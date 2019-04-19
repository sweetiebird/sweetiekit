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
#include <unistd.h>

#include <string>
#include <map>
#include <thread>
#include <v8.h>
#include <node.h>
#include "nan.h"


#include <stdarg.h>

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>

extern "C" void iOSLog(const char* format, ...);

namespace node {
    extern std::map<std::string, std::pair<void *, bool>> dlibs;
}
using namespace v8;

//#import "FirstViewController.h"
#import "node_ios_hello-Swift.h"
#import "libs_main.hpp"

UIViewController* rootViewController;

void Hello(const FunctionCallbackInfo<Value>& args) {
    iOSLog("Hello, world!\n");
    Isolate* isolate = args.GetIsolate();
    args.GetReturnValue().Set(String::NewFromUtf8(isolate, "world", NewStringType::kNormal).ToLocalChecked());
}


void SetRandomBackgroundColor(const FunctionCallbackInfo<Value>& args) {
    Isolate* isolate = args.GetIsolate();

    @autoreleasepool {

        dispatch_queue_t downloadQueue = dispatch_queue_create("image loader", NULL);
        dispatch_async(downloadQueue, ^{
            //NSData *imageData = [NSData dataWithContentsOfURL:networkURL]; // long time!
            dispatch_async(dispatch_get_main_queue(), ^ {
                if (rootViewController != nullptr) {
                    [rootViewController setRandomBackgroundColor];
                }
//                [g_ViewController randomize];
                //[[ViewController2 me] randomize];
                //[g_UIViewController setRandomBackgroundColor];
                /*
                 UIImage *image = [UIImage imageWithData:imageData];
                 self.imageView.image = image;
                 self.imageView.frame = CGRectMake(0,0, image.size.width, image.size.height);
                 self.scrollView.contentSize = image.size;*/
            });
        });

    }
    args.GetReturnValue().Set(String::NewFromUtf8(
                                                  isolate, "world", NewStringType::kNormal).ToLocalChecked());
}



namespace sweetiekit {
    void InitExports(Local<Object> exports) {
        iOSLog("InitExports\n");

        Local<Value> controller = makeUIViewController();
        exports->Set(Nan::New("UIViewController").ToLocalChecked(), controller);
        
        Local<Value> uiView = makeUIView();
        exports->Set(Nan::New("UIView").ToLocalChecked(), uiView);
        
        Local<Value> uiStoryboard = makeUIStoryboard();
        exports->Set(Nan::New("UIStoryboard").ToLocalChecked(), uiStoryboard);

        uintptr_t initFunctionAddress = (uintptr_t)InitExports;
        Local<Array> initFunctionAddressArray = Nan::New<Array>(2);
        initFunctionAddressArray->Set(0, Nan::New<Integer>((uint32_t)(initFunctionAddress >> 32)));
        initFunctionAddressArray->Set(1, Nan::New<Integer>((uint32_t)(initFunctionAddress & 0xFFFFFFFF)));
        exports->Set(Nan::New("initFunctionAddress").ToLocalChecked(), initFunctionAddressArray);
        
        NODE_SET_METHOD(exports, "hello", Hello);
        NODE_SET_METHOD(exports, "setRandomBackgroundColor", SetRandomBackgroundColor);
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
