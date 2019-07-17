//
//  main.m
//
//  Created by Emily Kolar on 5/10/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#include "main.h"
#include "NNSObject.h"
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
  get_persistent_function(self, fn, @"sweetiekit_viewWillAppear");
  if (fn) {
    dispatch_main(^{
      [fn jsFunction]->Call("UIViewController::viewWillAppear", js_value_BOOL(animated));
    });
  }
  sweetiekit::forEachView([self view], ^(UIView *view) {
    get_persistent_function(view, fn, @"sweetiekit_viewWillAppear");
    if (fn) {
      dispatch_main(^{
        [fn jsFunction]->Call("UIView::viewWillAppear", js_value_BOOL(animated));
      });
    }
  });
}

- (void)xxx_viewDidAppear:(BOOL)animated {
  [self xxx_viewDidAppear:animated];
  get_persistent_function(self, fn, @"sweetiekit_viewDidAppear");
  if (fn) {
    dispatch_main(^{
      [fn jsFunction]->Call("UIViewController::viewDidAppear", js_value_BOOL(animated));
    });
  }
  sweetiekit::forEachView([self view], ^(UIView *view) {
    get_persistent_function(view, fn, @"sweetiekit_viewDidAppear");
    if (fn) {
      dispatch_main(^{
        [fn jsFunction]->Call("UIView::viewDidAppear", js_value_BOOL(animated));
      });
    }
  });
}

- (void)xxx_viewWillDisappear:(BOOL)animated {
  [self xxx_viewWillDisappear:animated];
  get_persistent_function(self, fn, @"sweetiekit_viewWillDisappear");
  if (fn) {
    dispatch_main(^{
      [fn jsFunction]->Call("UIViewController::viewWillDisappear", js_value_BOOL(animated));
    });
  }
  sweetiekit::forEachView([self view], ^(UIView *view) {
    get_persistent_function(view, fn, @"sweetiekit_viewWillDisappear");
    if (fn) {
      dispatch_main(^{
        [fn jsFunction]->Call("UIView::viewWillDisappear", js_value_BOOL(animated));
      });
    }
  });
}

- (void)xxx_viewDidDisappear:(BOOL)animated {
  [self xxx_viewDidDisappear:animated];
  get_persistent_function(self, fn, @"sweetiekit_viewDidDisappear");
  if (fn) {
    dispatch_main(^{
      [fn jsFunction]->Call("UIViewController::viewDidDisappear", js_value_BOOL(animated));
    });
  }
  sweetiekit::forEachView([self view], ^(UIView *view) {
    get_persistent_function(view, fn, @"sweetiekit_viewDidDisappear");
    if (fn) {
      dispatch_main(^{
        [fn jsFunction]->Call("UIView::viewDidDisappear", js_value_BOOL(animated));
      });
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

#include "NUIEvent.h"

@implementation UIResponder (Sweetiekit_Hooks)

+ (void)load {
  static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      __block IMP originalEndedIMP = SweetieKitReplaceMethodWithBlock([self class], @selector(touchesEnded:withEvent:), ^(UIResponder *_self, NSSet *touches, UIEvent *event) {
          get_persistent_function(_self, fn, @"sweetiekit_touchesEndedWithEvent");
          if (fn) {
            dispatch_main(^{
              [fn jsFunction]->Call("UIResponder::touchesEndedWithEvent",
                js_value_NSSet(touches),
                js_value_UIEvent(event));
            });
          }
          ((void ( *)(id, SEL, NSSet *, UIEvent *))originalEndedIMP)(_self, @selector(touchesEnded:withEvent:), touches, event);
        });

      __block IMP originalMovedIMP = SweetieKitReplaceMethodWithBlock([self class], @selector(touchesMoved:withEvent:), ^(UIResponder *_self, NSSet *touches, UIEvent *event) {
          get_persistent_function(_self, fn, @"sweetiekit_touchesMovedWithEvent");
          if (fn) {
            dispatch_main(^{
              [fn jsFunction]->Call("UIResponder::touchesMovedWithEvent",
                js_value_NSSet(touches),
                js_value_UIEvent(event));
            });
          }
          ((void ( *)(id, SEL, NSSet *, UIEvent *))originalMovedIMP)(_self, @selector(touchesMoved:withEvent:), touches, event);
        });

      __block IMP originalBeganIMP = SweetieKitReplaceMethodWithBlock([self class], @selector(touchesBegan:withEvent:), ^(UIResponder *_self, NSSet *touches, UIEvent *event) {
          get_persistent_function(_self, fn, @"sweetiekit_touchesBeganWithEvent");
          if (fn) {
            dispatch_main(^{
              [fn jsFunction]->Call("UIResponder::touchesBeganWithEvent",
                js_value_NSSet(touches),
                js_value_UIEvent(event));
            });
          }
          ((void ( *)(id, SEL, NSSet *, UIEvent *))originalBeganIMP)(_self, @selector(touchesBegan:withEvent:), touches, event);
        });

    __block IMP touchesCancelledIMP = SweetieKitReplaceMethodWithBlock([self class], @selector(touchesCancelled:withEvent:), ^(UIResponder *_self, NSSet *touches, UIEvent *event) {
          get_persistent_function(_self, fn, @"sweetiekit_touchesCancelledWithEvent");
          if (fn) {
            dispatch_main(^{
              [fn jsFunction]->Call("UIResponder::touchesCancelledWithEvent",
                js_value_NSSet(touches),
                js_value_UIEvent(event));
            });
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
          get_persistent_function(_self, fn, @"sweetiekit_update");
          if (fn) {
            dispatch_main(^{
              [fn jsFunction]->Call("SKScene::update",
                js_value_NSTimeInterval(currentTime));
            });
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
    dispatch_main(^{
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

NAN_MODULE_INIT(honeykit_init) {
  Init(target);
}
NODE_MODULE_LINKED(honeykit, honeykit_init);

#include "SWTUtils.h"

namespace sweetiekit {
  extern Isolate* nodeIsolate;
  extern Persistent<Context>* nodeContext;
}

int main(int argc, char** argv)
{
  static auto _argc = argc;
  static auto _argv = argv;
//  registerNodeDLibs();
  chdir(getenv("HOME"));
  chdir("Documents");

  NSString* entry = [ScriptGetter GetWithName:@"demo"];
  if (entry == nullptr) {
    __builtin_trap();
  }
//  auto args = [NSString stringWithFormat:@"node\0--jitless\0--builtins-in-stack-traces\0--abort-on-uncaught-exception\0%@\0\0", entry];
  NSArray* arguments = @[@"node",
  @"--expose_gc",
  @"--inspect=0.0.0.0:9229",
#if !TARGET_OS_UIKITFORMAC
  @"--jitless",
#endif
  @"--builtins-in-stack-traces",
  entry
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
      v8::Locker locker(isolate);
      isolate->Enter();
      _started = true;
      [JSApp() update:loop];
    }];
  
    [[NSRunLoop currentRunLoop]
      addTimer:timer
      forMode:NSRunLoopCommonModes];
  
    [[JSApplication sharedApplication]
     associateValue:timer
     withKey:@"honeykit.mainloop"];
    
    isolate->Exit();
    v8::Unlocker unlocker(isolate);
    
    @autoreleasepool {
      UIApplicationMain(_argc, _argv,
        NSStringFromClass(JSApplication.class),
        NSStringFromClass(AppDelegate.class));
    }
  };
  node::Start(node_argc, node_argv.data());
}

extern "C" void registerNodeDLibs()
{
  if (@available(iOS 13.0, *)) {
    UIApplication* application = [UIApplication sharedApplication];
    [application requestSceneSessionActivation: nil userActivity: nil options: nil errorHandler: nil];
    auto session = [[UIApplication sharedApplication] openSessions].anyObject;
    UIScene* scene = [session scene];
    if ([scene isKindOfClass:[UIWindowScene class]]) {
      UIWindowScene* windowScene = (UIWindowScene*)scene;
      UIWindow* window = [[UIWindow alloc] initWithWindowScene: windowScene];
      SceneDelegate* sceneDelegate = [SceneDelegate new];
      windowScene.delegate = sceneDelegate;
  //    window.rootViewController = [SceneDelegate getHostingController];
      window.rootViewController = [[UIViewController alloc] init];
      sceneDelegate.window = window;
      [window makeKeyAndVisible];
    } else {
      UIWindow* window = [[UIWindow alloc] init];
  //    window.rootViewController = [SceneDelegate getHostingController];
      window.rootViewController = [[UIViewController alloc] init];
      [window makeKeyAndVisible];
    }
  }
}
