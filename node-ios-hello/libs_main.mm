//
//  main.m
//  window
//
//  Created by BB on 3/20/19.
//  Copyright © 2019 Sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "NUIViewController.h"
#include <unistd.h>
// #include <stdio.h>
// #include <fcntl.h>
// #include <cstdlib>
// #include <cstring>
// #include <dlfcn.h>
// #include <errno.h>

#include <string>
#include <map>
#include <thread>
#include <v8.h>
#include <node.h>
#include "nan.h"


#include <stdarg.h>

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>

//namespace v8 { namespace internal { bool FLAG_jitless = true; }}


extern "C" void iOSLog(const char* format, ...);
//{
//
//    va_list args;
//    va_start(args, format);
//    NSLogv([NSString stringWithUTF8String:format], args);
//    vfprintf(stderr, format, args);
//    fflush(stderr);
//    va_end(args);
//}



namespace node {
    extern std::map<std::string, std::pair<void *, bool>> dlibs;
}

/*
 struct application_context_t {
 int dummy_value;
 };
 enum DummyValue {
 STOPPED = 0,
 RUNNING,
 PAUSED,
 };
 
 static void onNewInitArg(void* application_context) {
 MLLifecycleInitArgList *args;
 MLLifecycleGetInitArgList(&args);
 
 ((struct application_context_t*)application_context)->dummy_value = DummyValue::RUNNING;
 ML_LOG_TAG(Info, LOG_TAG, "%s: On new init arg called %x.", application_name, args);
 }
 
 static void onStop(void* application_context) {
 ((struct application_context_t*)application_context)->dummy_value = DummyValue::STOPPED;
 ML_LOG_TAG(Info, LOG_TAG, "%s: On stop called.", application_name);
 }
 
 static void onPause(void* application_context) {
 ((struct application_context_t*)application_context)->dummy_value = DummyValue::PAUSED;
 ML_LOG_TAG(Info, LOG_TAG, "%s: On pause called.", application_name);
 }
 
 static void onResume(void* application_context) {
 ((struct application_context_t*)application_context)->dummy_value = DummyValue::RUNNING;
 ML_LOG_TAG(Info, LOG_TAG, "%s: On resume called.", application_name);
 }
 
 static void onUnloadResources(void* application_context) {
 ((struct application_context_t*)application_context)->dummy_value = DummyValue::STOPPED;
 ML_LOG_TAG(Info, LOG_TAG, "%s: On unload resources called.", application_name);
 }
 */
using namespace v8;


void Hello(const FunctionCallbackInfo<Value>& args) {
    iOSLog("Hello, world!\n");
    Isolate* isolate = args.GetIsolate();
    args.GetReturnValue().Set(String::NewFromUtf8(
                                                  isolate, "world", NewStringType::kNormal).ToLocalChecked());
}
#define JS_FUNC(x) (Nan::GetFunction(x).ToLocalChecked())


#if 0
NAN_METHOD(Fetch) {
    Nan::HandleScope scope;
    //Local<Object> asyncObject = Nan::New<Object>();
    
    //Isolate* isolate = args.GetIsolate();
    
    Nan::Utf8String url(info[0]);
    NSString *url2 = [[NSString alloc] initWithData:*url encoding:NSUTF8StringEncoding];
    
    
    //AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, "fetch");
    Local<Function> cbFn = JS_FUNC(Nan::New<v8::FunctionTemplate>(info[1]));
    
    
    
    @autoreleasepool {
        NSURLSession *aSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [[aSession dataTaskWithURL:[NSURL URLWithString:url2] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (((NSHTTPURLResponse *)response).statusCode == 200) {
                if (data) {
                    NSString *contentOfURL = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    NSLog(@"%@", contentOfURL);
                    
                    Local<String> arg0 = Nan::New<String>(contentOfURL).ToLocalChecked();
                    Local<Value> argv[] = {
                        arg0,
                    };
                    Local<Object> asyncObject = Nan::New<Object>();
                    AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, "IVRCompositor::RequestGetPoses");
                    
                    asyncResource.MakeCallback(cbFn, sizeof(argv)/sizeof(argv[0]), argv);
                    
                    
                    
                    /*
                     const char* args[] = {
                     "--jitless",
                     "-e",
                     [contentOfURL cStringUsingEncoding:NSUTF8StringEncoding],
                     0};
                     node::Start(sizeof(args)/sizeof(const char*)-1, (char**)args);*/
                }
            }
        }] resume];
    }

    //args.GetReturnValue().Set(String::NewFromUtf8(isolate, "world", NewStringType::kNormal).ToLocalChecked());
}
#endif

//#import "FirstViewController.h"
#import "node_ios_hello-Swift.h"
#import "libs_main.hpp"


UIViewController* rootViewController;

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



namespace exokit {
    
    
    void InitExports(Local<Object> exports) {
        iOSLog("InitExports\n");

        Local<Value> controller = makeUIViewController();
        exports->Set(Nan::New("UIViewController").ToLocalChecked(), controller);
#if 0
        std::pair<Local<Value>, Local<FunctionTemplate>> glResult = makeGl();
        exports->Set(Nan::New("nativeGl").ToLocalChecked(), glResult.first);
        
        std::pair<Local<Value>, Local<FunctionTemplate>> gl2Result = makeGl2(glResult.second);
        exports->Set(Nan::New("nativeGl2").ToLocalChecked(), gl2Result.first);
        
        Local<Value> image = makeImage();
        exports->Set(Nan::New("nativeImage").ToLocalChecked(), image);
        
        Local<Value> imageData = makeImageData();
        exports->Set(Nan::New("nativeImageData").ToLocalChecked(), imageData);
        
        Local<Value> imageBitmap = makeImageBitmap();
        exports->Set(Nan::New("nativeImageBitmap").ToLocalChecked(), imageBitmap);
        
        Local<Value> path2d = makePath2D();
        exports->Set(Nan::New("nativePath2D").ToLocalChecked(), path2d);
        
        Local<Value> canvasGradient = makeCanvasGradient();
        exports->Set(Nan::New("nativeCanvasGradient").ToLocalChecked(), canvasGradient);
        
        Local<Value> canvasPattern = makeCanvasPattern();
        exports->Set(Nan::New("nativeCanvasPattern").ToLocalChecked(), canvasPattern);
        
        Local<Value> canvas = makeCanvasRenderingContext2D(imageData, canvasGradient, canvasPattern);
        exports->Set(Nan::New("nativeCanvasRenderingContext2D").ToLocalChecked(), canvas);
        
        Local<Value> audio = makeAudio();
        exports->Set(Nan::New("nativeAudio").ToLocalChecked(), audio);
        
        Local<Value> video = makeVideo(imageData);
        exports->Set(Nan::New("nativeVideo").ToLocalChecked(), video);
        
        Local<Value> browser = makeBrowser();
        exports->Set(Nan::New("nativeBrowser").ToLocalChecked(), browser);
        
        Local<Value> rtc = makeRtc();
        exports->Set(Nan::New("nativeRtc").ToLocalChecked(), rtc);
        
        /* Local<Value> glfw = makeGlfw();
         exports->Set(Nan::New("nativeGlfw").ToLocalChecked(), glfw); */
        
        Local<Value> window = makeWindow();
        exports->Set(Nan::New("nativeWindow").ToLocalChecked(), window);
        
#ifdef OPENVR
        Local<Value> vr = makeVr();
        exports->Set(Nan::New("nativeVr").ToLocalChecked(), vr);
#endif
        
#if LEAPMOTION
        Local<Value> lm = makeLm();
        exports->Set(Nan::New("nativeLm").ToLocalChecked(), lm);
#endif
        
#if defined(LUMIN)
        Local<Value> ml = makeMl();
        exports->Set(Nan::New("nativeMl").ToLocalChecked(), ml);
#endif
        
#ifndef LUMIN
#define NATIVE_ANALYTICS true
#else
#define NATIVE_ANALYTICS false
#endif
        exports->Set(Nan::New("nativeAnalytics").ToLocalChecked(), JS_BOOL(NATIVE_ANALYTICS));
#endif
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
    void node_register_module_exokit(Local<Object> exports, Local<Value> module, Local<Context> context) {
        exokit::Init(exports);
    }
}

/*
 extern "C" {
 void node_register_module_exokit(Local<Object> exports, Local<Value> module, Local<Context> context);
 void node_register_module_vm_one(Local<Object> exports, Local<Value> module, Local<Context> context);
 void node_register_module_raw_buffer(Local<Object> exports, Local<Value> module, Local<Context> context);
 void node_register_module_child_process_thread(Local<Object> exports, Local<Value> module, Local<Context> context);
 }*/

inline void registerDlibs(std::map<std::string, std::pair<void *, bool>> &dlibs) {
    dlibs["/package/build/Release/exokit.node"] = std::pair<void *, bool>((void *)&node_register_module_exokit, false);
#if 0
    dlibs["/package/node_modules/vm-one/build/Release/vmOne.node"] = (void *)&node_register_module_vm_one;
    dlibs["/package/node_modules/raw-buffer/build/Release/raw_buffer.node"] = (void *)&node_register_module_raw_buffer;
    dlibs["/package/node_modules/child-process-thread/build/Release/child_process_thread.node"] = (void *)&node_register_module_child_process_thread;
#endif
}


//int main(int argc, char * argv[]) {
//    iOSLog("argc: %d\n", argc);
//    for (int i = 0; i < argc; i++) {
//        iOSLog("%s\n", argv[i]);
//    }
//    iOSLog("----\n");
//
//    //registerDlibs(node::dlibs);
//    /*
//     if (argc > 1) {
//     return node::Start(argc, argv);
//     }*/
//
//    @autoreleasepool {
////        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//    }
//}

extern "C" void registerNodeDLibs() {
    registerDlibs(node::dlibs);
}
