//
//  main.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/10/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "main.h"
#import "node_ios_hello-Swift.h"
#include "NNSObject.h"

@implementation JSApplication

- (instancetype)init
{
   self = [super init];
   if (self) {
   }
   return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
   self = [super init];
   if (self) {
     self.frame = frame;
   }
   return self;
}

@end

JSApplication* JSApp() {
  return (JSApplication*)[UIApplication sharedApplication];
}

bool _started;

void Init(Local<Object> exports) {
  Nan::HandleScope scope;
  NSLog(@"Initialized!");
  
  exports->Set(Nan::New<String>("poll").ToLocalChecked(),
  Function::New(Isolate::GetCurrent()->GetCurrentContext(),
    [](const FunctionCallbackInfo<Value>& args) -> void {
      if (!_started) {
//        UIKit_PumpEvents();
        __builtin_trap();
      } else {
        fprintf(stderr, "node is alive\n");
        fflush(stderr);
      }
    }).ToLocalChecked());
}

NAN_MODULE_INIT(init) {
  Init(target);
}
NODE_MODULE_LINKED(honeykit, init);

int main(int argc, char** argv)
{
  static auto _argc = argc;
  static auto _argv = argv;
  registerNodeDLibs();
  chdir(getenv("HOME"));
  chdir("Documents");

  NSString* entry = [ScriptGetter GetWithName:@"demo"];
  if (entry == nullptr) {
    __builtin_trap();
  }
//  auto args = [NSString stringWithFormat:@"node\0--jitless\0--builtins-in-stack-traces\0--abort-on-uncaught-exception\0%@\0\0", entry];
  NSArray* arguments = @[@"node", @"--jitless", entry
  /*@"-e",
@"\
honeykit = process._linkedBinding('honeykit'); \
honeykit.loop = setInterval(() => {            \
  honeykit.poll();                             \
}, 1000 / 100);                                \
honeykit.stop = () => {                        \
  clearInterval(honeykit.loop);                \
  delete honeykit.loop;                        \
}                                              \
"*/
];
  NSString* args = [arguments componentsJoinedByString:@"\0"];
  char* s = (char*)[args UTF8String];
  std::vector<char*> node_argv;
  size_t n = 0;
  for (NSString *arg in arguments) {
    node_argv.push_back(s + n);
    n += [arg length] + 1;
  }
  node_argv.push_back(nullptr);
  int node_argc = (int)node_argv.size() - 1;
  
  node::pNodeRunLoopRun = [](Isolate* isolate, Local<Context> context, struct uv_loop_s* loop) {
  
    NSTimer* timer = [NSTimer timerWithTimeInterval:60.0/1000.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
      _started = true;
      [JSApp() update:loop];
    }];
  
    [[NSRunLoop currentRunLoop]
      addTimer:timer
      forMode:NSRunLoopCommonModes];
  
    [[JSApplication sharedApplication]
     associateValue:timer
     withKey:@"honeykit.mainloop"];
    
    @autoreleasepool {
      UIApplicationMain(_argc, _argv,
        NSStringFromClass(JSApplication.class),
        NSStringFromClass(AppDelegate.class));
    }
  };
  node::Start(node_argc, node_argv.data());
}


