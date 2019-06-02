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
#import <objc/runtime.h>
#include "defines.h"
#include "NUITouch.h"

void xxx_swizzle(Class class_, SEL originalSelector, SEL swizzledSelector)
{
  Method originalMethod = class_getInstanceMethod(class_, originalSelector);
  Method swizzledMethod = class_getInstanceMethod(class_, swizzledSelector);

  // When swizzling a class method, use the following:
  // Class class = object_getClass((id)self);
  // ...
  // Method originalMethod = class_getClassMethod(class, originalSelector);
  // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);

  BOOL didAddMethod =
      class_addMethod(class_,
          originalSelector,
          method_getImplementation(swizzledMethod),
          method_getTypeEncoding(swizzledMethod));

  if (didAddMethod) {
      class_replaceMethod(class_,
          swizzledSelector,
          method_getImplementation(originalMethod),
          method_getTypeEncoding(originalMethod));
  } else {
      method_exchangeImplementations(originalMethod, swizzledMethod);
  }
}
@implementation UIView (Sweetiekit_Hooks)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class_ = [self class];
        xxx_swizzle(class_,
          @selector(drawRect:),
          @selector(xxx_drawRect:));
    });
}

#pragma mark - Method Swizzling

- (void)xxx_drawRect:(CGRect)rect {
  [self xxx_drawRect:rect];
  //NSLog(@"drawRect: %@ %@", self, rect);
  id fn = [self associatedValueForKey:@"sweetiekit_drawRect"];
  if (fn != nullptr) {
    Nan::HandleScope scope;
    SweetJSFunction* func = (SweetJSFunction*)fn;
        
    Local<Object> result = Object::New(Isolate::GetCurrent());
  #if 1
    Local<Object> origin = result;
    Local<Object> size = result;
  #else
    Local<Object> origin = Object::New(Isolate::GetCurrent());
    Local<Object> size = Object::New(Isolate::GetCurrent());
    result->Set(JS_STR("origin"), JS_OBJ(origin));
    result->Set(JS_STR("size"), JS_OBJ(size));
  #endif
    double width = rect.size.width;
    double height = rect.size.height;
    double x = rect.origin.x;
    double y = rect.origin.y;
    origin->Set(JS_STR("x"), JS_NUM(x));
    origin->Set(JS_STR("y"), JS_NUM(y));
    size->Set(JS_STR("width"), JS_NUM(width));
    size->Set(JS_STR("height"), JS_NUM(height));
    [func jsFunction]->Call("UIView::drawRect", result);
  }
}
@end

@implementation UIViewController (Sweetiekit_Hooks)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class_ = [self class];
        xxx_swizzle(class_,
          @selector(viewWillAppear:),
          @selector(xxx_viewWillAppear:));
        xxx_swizzle(class_,
          @selector(viewDidAppear:),
          @selector(xxx_viewDidAppear:));
        xxx_swizzle(class_,
          @selector(viewWillDisappear:),
          @selector(xxx_viewWillDisappear:));
        xxx_swizzle(class_,
          @selector(viewDidDisappear:),
          @selector(xxx_viewDidDisappear:));
    });
}

#pragma mark - Method Swizzling

- (void)xxx_viewWillAppear:(BOOL)animated {
    [self xxx_viewWillAppear:animated];
    //NSLog(@"viewWillAppear: %@", self);
    id fn = [self associatedValueForKey:@"sweetiekit_viewWillAppear"];
    if (fn != nullptr) {
      Nan::HandleScope scope;
      SweetJSFunction* func = (SweetJSFunction*)fn;
      [func jsFunction]->Call("UIViewController::viewWillAppear", JS_BOOL(animated));
    }
    sweetiekit::forEachView([self view], ^(UIView *view) {
      id fn = [view associatedValueForKey:@"sweetiekit_viewWillAppear"];
      if (fn != nullptr) {
        Nan::HandleScope scope;
        SweetJSFunction* func = (SweetJSFunction*)fn;
        [func jsFunction]->Call("UIView::viewWillAppear", JS_BOOL(animated));
      }
    });
}

- (void)xxx_viewDidAppear:(BOOL)animated {
    [self xxx_viewDidAppear:animated];
    //NSLog(@"viewDidAppear: %@", self);
    id fn = [self associatedValueForKey:@"sweetiekit_viewDidAppear"];
    if (fn != nullptr) {
      Nan::HandleScope scope;
      SweetJSFunction* func = (SweetJSFunction*)fn;
      [func jsFunction]->Call("UIViewController::viewDidAppear", JS_BOOL(animated));
    }
    sweetiekit::forEachView([self view], ^(UIView *view) {
      id fn = [view associatedValueForKey:@"sweetiekit_viewDidAppear"];
      if (fn != nullptr) {
        Nan::HandleScope scope;
        SweetJSFunction* func = (SweetJSFunction*)fn;
        [func jsFunction]->Call("UIView::viewDidAppear", JS_BOOL(animated));
      }
    });
}

- (void)xxx_viewWillDisappear:(BOOL)animated {
    [self xxx_viewWillDisappear:animated];
    //NSLog(@"viewWillDisappear: %@", self);
    id fn = [self associatedValueForKey:@"sweetiekit_viewWillDisappear"];
    if (fn != nullptr) {
      Nan::HandleScope scope;
      SweetJSFunction* func = (SweetJSFunction*)fn;
      [func jsFunction]->Call("UIViewController::viewWillDisappear", JS_BOOL(animated));
    }
    sweetiekit::forEachView([self view], ^(UIView *view) {
      id fn = [view associatedValueForKey:@"sweetiekit_viewWillDisappear"];
      if (fn != nullptr) {
        Nan::HandleScope scope;
        SweetJSFunction* func = (SweetJSFunction*)fn;
        [func jsFunction]->Call("UIView::viewWillDisappear", JS_BOOL(animated));
      }
    });
}

- (void)xxx_viewDidDisappear:(BOOL)animated {
    [self xxx_viewWillDisappear:animated];
    //NSLog(@"viewDidDisappear: %@", self);
    id fn = [self associatedValueForKey:@"sweetiekit_viewDidDisappear"];
    if (fn != nullptr) {
      Nan::HandleScope scope;
      SweetJSFunction* func = (SweetJSFunction*)fn;
      [func jsFunction]->Call("UIViewController::viewDidDisappear", JS_BOOL(animated));
    }
    sweetiekit::forEachView([self view], ^(UIView *view) {
      id fn = [view associatedValueForKey:@"sweetiekit_viewDidDisappear"];
      if (fn != nullptr) {
        Nan::HandleScope scope;
        SweetJSFunction* func = (SweetJSFunction*)fn;
        [func jsFunction]->Call("UIView::viewDidDisappear", JS_BOOL(animated));
      }
    });
}

@end

IMP SweetieKitReplaceMethodWithBlock(Class c, SEL origSEL, id block) {
    NSCParameterAssert(block);

    // get original method
    Method origMethod = class_getInstanceMethod(c, origSEL);
    NSCParameterAssert(origMethod);

    // convert block to IMP trampoline and replace method implementation
    IMP newIMP = imp_implementationWithBlock(block);

    // Try adding the method if not yet in the current class
    if (!class_addMethod(c, origSEL, newIMP, method_getTypeEncoding(origMethod))) {
        return method_setImplementation(origMethod, newIMP);
    }else {
        return method_getImplementation(origMethod);
    }
}

@implementation UIResponder (Sweetiekit_Hooks)

+ (void)load {
  static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      __block IMP originalEndedIMP = SweetieKitReplaceMethodWithBlock([self class], @selector(touchesEnded:withEvent:), ^(UIResponder *_self, NSSet *touches, UIEvent *event) {
          NSLog(@"touches ended implementation");

          id fn = [_self associatedValueForKey:@"sweetiekit_touchesEnded"];
          if (fn != nullptr) {
            Nan::HandleScope scope;
            SweetJSFunction* func = (SweetJSFunction*)fn;
            __block uint32_t count = 0;
            auto value = Nan::New<Array>();
            [touches enumerateObjectsUsingBlock: ^ (UITouch * _Nonnull touch, BOOL * _Nonnull stop) {
              Nan::Set(value, count++, sweetiekit::GetWrapperFor(touch, NUITouch::type));
            }];
            [func jsFunction]->Call("UIResponder::touchesEnded", value, sweetiekit::GetWrapperFor(event));
           }

          ((void ( *)(id, SEL, NSSet *, UIEvent *))originalEndedIMP)(_self, @selector(touchesEnded:withEvent:), touches, event);
        });

      __block IMP originalMovedIMP = SweetieKitReplaceMethodWithBlock([self class], @selector(touchesMoved:withEvent:), ^(UIResponder *_self, NSSet *touches, UIEvent *event) {
          NSLog(@"touches moved implementation");

          id fn = [_self associatedValueForKey:@"sweetiekit_touchesMoved"];
          if (fn != nullptr) {
            Nan::HandleScope scope;
            SweetJSFunction* func = (SweetJSFunction*)fn;
            __block uint32_t count = 0;
            auto value = Nan::New<Array>();
            [touches enumerateObjectsUsingBlock: ^ (UITouch * _Nonnull touch, BOOL * _Nonnull stop) {
              Nan::Set(value, count++, sweetiekit::GetWrapperFor(touch, NUITouch::type));
            }];
            [func jsFunction]->Call("UIResponder::touchesMoved", value, sweetiekit::GetWrapperFor(event));
           }

          ((void ( *)(id, SEL, NSSet *, UIEvent *))originalMovedIMP)(_self, @selector(touchesMoved:withEvent:), touches, event);
        });

      __block IMP originalBeganIMP = SweetieKitReplaceMethodWithBlock([self class], @selector(touchesBegan:withEvent:), ^(UIResponder *_self, NSSet *touches, UIEvent *event) {
          NSLog(@"touches began implementation");

          id fn = [_self associatedValueForKey:@"sweetiekit_touchesBegan"];
          if (fn != nullptr) {
            Nan::HandleScope scope;
            SweetJSFunction* func = (SweetJSFunction*)fn;
            __block uint32_t count = 0;
            auto value = Nan::New<Array>();
            [touches enumerateObjectsUsingBlock: ^ (UITouch * _Nonnull touch, BOOL * _Nonnull stop) {
              Nan::Set(value, count++, sweetiekit::GetWrapperFor(touch, NUITouch::type));
            }];
            [func jsFunction]->Call("UIResponder::touchesBegan", value, sweetiekit::GetWrapperFor(event));
           }

          ((void ( *)(id, SEL, NSSet *, UIEvent *))originalBeganIMP)(_self, @selector(touchesBegan:withEvent:), touches, event);
        });

    __block IMP touchesCancelledIMP = SweetieKitReplaceMethodWithBlock([self class], @selector(touchesCancelled:withEvent:), ^(UIResponder *_self, NSSet *touches, UIEvent *event) {
          NSLog(@"touches cancelled implementation");

          id fn = [_self associatedValueForKey:@"sweetiekit_touchesCancelled"];
          if (fn != nullptr) {
            Nan::HandleScope scope;
            SweetJSFunction* func = (SweetJSFunction*)fn;
            __block uint32_t count = 0;
            auto value = Nan::New<Array>();
            [touches enumerateObjectsUsingBlock: ^ (UITouch * _Nonnull touch, BOOL * _Nonnull stop) {
              Nan::Set(value, count++, sweetiekit::GetWrapperFor(touch, NUITouch::type));
            }];
            [func jsFunction]->Call("UIResponder::touchesCancelled", value, sweetiekit::GetWrapperFor(event));
           }

          ((void ( *)(id, SEL, NSSet *, UIEvent *))touchesCancelledIMP)(_self, @selector(touchesCancelled:withEvent:), touches, event);
        });
    });
}

@end

@implementation SKScene (Sweetiekit_Hooks)

+ (void)load {
  static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      __block IMP originalUpdateIMP = SweetieKitReplaceMethodWithBlock([self class], @selector(update:), ^(SKScene *_self, NSTimeInterval currentTime) {
          NSLog(@"update: implementation");

          id fn = [_self associatedValueForKey:@"sweetiekit_update"];
          if (fn != nullptr) {
            Nan::HandleScope scope;
            SweetJSFunction* func = (SweetJSFunction*)fn;
            [func jsFunction]->Call("SKScene::update", JS_FLOAT(currentTime));
           }

          ((void ( *)(id, SEL, NSTimeInterval))originalUpdateIMP)(_self, @selector(update:), currentTime);
        });
    });
}

@end

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

- (void) sendEvent:(UIEvent *)event
{
    if( event && (event.subtype==UIEventSubtypeMotionShake))
    {
        /*AppDelegate *objAppDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

        [objAppDelegate doWhatEver];*/
        dispatch_ui_sync(dispatch_get_main_queue(), ^{
          Nan::HandleScope scope;
          if (JS_HAS(JS_GLOBAL(), JS_STR("OnShake")) && JS_GLOBAL()->Get(JS_STR("OnShake"))->IsFunction()) {
            sweetiekit::JSFunction fn(JS_GLOBAL()->Get(JS_STR("OnShake")));
            fn.Call("JSApplication:sendEvent OnShake");
          }
        });
        [super sendEvent:event];
    }
    else
    {
        [super sendEvent:event];
    }
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
  NSArray* arguments = @[@"node", @"--expose_gc", @"--inspect=0.0.0.0:9229", @"--jitless", entry
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


