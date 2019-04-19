//
//  libs_main.mm
//  node-ios-hello
//
//  Created by Shawn on 3/20/19.
//  Copyright © 2019 Sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "NNSObject.h"
#include "NUIApplication.h"
#include "NUIWindow.h"
#include "NUIViewController.h"
#include "NUIView.h"
#include "NUIStoryboard.h"
#include "NUIButton.h"
#include "NUITabBarController.h"
#include "NUIImage.h"
#include "NUITextField.h"
#include <unistd.h>

#include <string>
#include <map>
#include <thread>
#include <v8.h>
#include <node.h>
#include "nan.h"

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
#import "libs_main.hpp"

extern "C" void iOSLog(const char* format, ...);

namespace node {
    extern std::map<std::string, std::pair<void *, bool>> dlibs;
}
using namespace v8;


#include <array>
#include <deque>
#include <mutex>
#include <thread>


namespace sweetiekit {
  uv_sem_t reqSem;
  uv_async_t resAsync;
  std::mutex reqMutex;
  std::mutex resMutex;
  std::deque<std::function<void()>> reqCbs;
  std::deque<std::function<void()>> resCbs;
  std::thread reqThead;

  void RunResInMainThread(uv_async_t *handle) {
    Nan::HandleScope scope;

    std::function<void()> resCb;
    {
      std::lock_guard<std::mutex> lock(reqMutex);

      resCb = resCbs.front();
      resCbs.pop_front();
    }
    if (resCb) {
      resCb();
    }
  }
  
  void Resolve(Nan::Persistent<Function>* cb) {
    {
        std::lock_guard<std::mutex> lock(sweetiekit::resMutex);
        sweetiekit::resCbs.push_back([cb]() -> void {

          if (cb != nullptr)
          {
            Local<Object> asyncObject = Nan::New<Object>();
            AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, "UIButton::New");
            Local<Function> callback = Nan::New(*cb);
            asyncResource.MakeCallback(callback, 0, nullptr);
          }
      });
    }
    uv_async_send(&sweetiekit::resAsync);
  }
  
  Nan::Callback tickKicker;
  
  void Kick() {
    tickKicker();
  }
};


namespace sweetiekit {
void InitExports(Local<Object> exports) {
  iOSLog("InitExports\n");
      
  tickKicker.SetFunction(v8::Function::New(JS_CONTEXT(), [](const FunctionCallbackInfo<Value>& info) -> void {
}).ToLocalChecked());

  
  uv_sem_init(&sweetiekit::reqSem, 0);
  uv_async_init(uv_default_loop(), &sweetiekit::resAsync, sweetiekit::RunResInMainThread);
  sweetiekit::reqThead = std::thread([]() -> void {
    for (;;) {
      uv_sem_wait(&sweetiekit::reqSem);

      std::function<void()> reqCb;
      {
        std::lock_guard<std::mutex> lock(sweetiekit::reqMutex);

        if (sweetiekit::reqCbs.size() > 0) {
          reqCb = sweetiekit::reqCbs.front();
          sweetiekit::reqCbs.pop_front();
        }
      }
      if (reqCb) {
        reqCb();
      } else {
        break;
      }
    }
  });


  
        auto N_NSObject = NNSObject::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSObject").ToLocalChecked(), N_NSObject.first);
  
        auto N_UIApplication = NUIApplication::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIApplication").ToLocalChecked(), N_UIApplication.first);
  
        auto N_UIWindow = NUIWindow::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIWindow").ToLocalChecked(), N_UIWindow.first);
  
        auto N_UIViewController = NUIViewController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIViewController").ToLocalChecked(), N_UIViewController.first);
  
        auto N_UITabBarController = NUITabBarController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITabBarController").ToLocalChecked(), N_UITabBarController.first);
  
        Local<Value> uiView = makeUIView();
        exports->Set(Nan::New("UIView").ToLocalChecked(), uiView);
        
        Local<Value> uiStoryboard = makeUIStoryboard();
        exports->Set(Nan::New("UIStoryboard").ToLocalChecked(), uiStoryboard);

        Local<Value> uiButton = makeUIButton();
        exports->Set(Nan::New("UIButton").ToLocalChecked(), uiButton);

        Local<Value> uiTextField = makeUITextField();
        exports->Set(Nan::New("UITextField").ToLocalChecked(), uiTextField);

        Local<Value> uiImage = makeUIImage();
        exports->Set(Nan::New("UIImage").ToLocalChecked(), uiImage);

        uintptr_t initFunctionAddress = (uintptr_t)InitExports;
        Local<Array> initFunctionAddressArray = Nan::New<Array>(2);
        initFunctionAddressArray->Set(0, Nan::New<Integer>((uint32_t)(initFunctionAddress >> 32)));
        initFunctionAddressArray->Set(1, Nan::New<Integer>((uint32_t)(initFunctionAddress & 0xFFFFFFFF)));
        exports->Set(Nan::New("initFunctionAddress").ToLocalChecked(), initFunctionAddressArray);
        
        iOSLog("initialized!\n");
    }
    
    void Init(Local<Object> exports) {
        InitExports(exports);
    }
}

extern "C" {
    void node_register_module_sweetiekit(Local<Object> exports, Local<Value> module, Local<Context> context) {
        sweetiekit::Init(exports);
    }
}

inline void registerDlibs(std::map<std::string, std::pair<void *, bool>> &dlibs) {
    dlibs["std:sweetiekit.node"] = std::pair<void *, bool>((void *)&node_register_module_sweetiekit, false);
}

extern "C" void registerNodeDLibs() {
    registerDlibs(node::dlibs);
}
