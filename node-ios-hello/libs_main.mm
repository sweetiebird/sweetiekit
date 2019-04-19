//
//  libs_main.mm
//  node-ios-hello
//
//  Created by Shawn on 3/20/19.
//  Copyright © 2019 Sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "NUIViewController.h"
#include "NUIView.h"
#include "NUIStoryboard.h"
#include "NUIButton.h"
#include "NUITabBarController.h"
#include "NUIImage.h"
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


namespace sweetiekit {
    void InitExports(Local<Object> exports) {
        iOSLog("InitExports\n");

        Local<Value> controller = makeUIViewController();
        exports->Set(Nan::New("UIViewController").ToLocalChecked(), controller);
      
        Local<Value> uiTabBarController = makeUITabBarController();
        exports->Set(Nan::New("UITabBarController").ToLocalChecked(), uiTabBarController);

        Local<Value> uiView = makeUIView();
        exports->Set(Nan::New("UIView").ToLocalChecked(), uiView);
        
        Local<Value> uiStoryboard = makeUIStoryboard();
        exports->Set(Nan::New("UIStoryboard").ToLocalChecked(), uiStoryboard);

        Local<Value> uiButton = makeUIButton();
        exports->Set(Nan::New("UIButton").ToLocalChecked(), uiButton);

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
