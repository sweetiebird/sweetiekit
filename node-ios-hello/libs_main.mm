//
//  libs_main.mm
//  node-ios-hello
//
//  Created by Shawn on 3/20/19.
//  Copyright © 2019 Sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "NNSObject.h"
#include "NNSUserDefaults.h"
#include "NUIApplication.h"
#include "NUIWindow.h"
#include "NUIViewController.h"
#include "NUIView.h"
#include "NUIControl.h"
#include "NUIStoryboard.h"
#include "NUIButton.h"
#include "NUITabBarController.h"
#include "NUIImage.h"
#include "NUIImageView.h"
#include "NUILabel.h"
#include "NUITextField.h"
#include "NUINavigationController.h"
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
            Local<Function> callback = Nan::New(*cb);
            if (!callback.IsEmpty()) {
              Local<Object> asyncObject = Nan::New<Object>();
              AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, "UIButton::New");
              asyncResource.MakeCallback(callback, 0, nullptr);
            }
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
  
        auto N_NSUserDefaults = NNSUserDefaults::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSUserDefaults").ToLocalChecked(), N_NSUserDefaults.first);
  
        auto N_UIApplication = NUIApplication::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIApplication").ToLocalChecked(), N_UIApplication.first);
  
        auto N_UIWindow = NUIWindow::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIWindow").ToLocalChecked(), N_UIWindow.first);
  
        auto N_UIResponder = NUIResponder::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIResponder").ToLocalChecked(), N_UIResponder.first);
  
        auto N_UIViewController = NUIViewController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIViewController").ToLocalChecked(), N_UIViewController.first);
  
        auto N_UITabBarController = NUITabBarController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITabBarController").ToLocalChecked(), N_UITabBarController.first);
  
        auto N_UIView = NUIView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIView").ToLocalChecked(), N_UIView.first);
  
        auto N_UIControl = NUIControl::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIControl").ToLocalChecked(), N_UIControl.first);
  
        auto N_UIStoryboard = NUIStoryboard::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIStoryboard").ToLocalChecked(), N_UIStoryboard.first);
  
        auto N_UIButton = NUIButton::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIButton").ToLocalChecked(), N_UIButton.first);
  
        auto N_UITextField = NUITextField::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITextField").ToLocalChecked(), N_UITextField.first);
  
        auto N_UIImage = NUIImage::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIImage").ToLocalChecked(), N_UIImage.first);
  
        auto N_UIImageView = NUIImageView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIImageView").ToLocalChecked(), N_UIImageView.first);
  
        auto N_UILabel = NUILabel::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UILabel").ToLocalChecked(), N_UILabel.first);

        auto N_UINavigationController = NUINavigationController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UINavigationController").ToLocalChecked(), N_UINavigationController.first);

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
