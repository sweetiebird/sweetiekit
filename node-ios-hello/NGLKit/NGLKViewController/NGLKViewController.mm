//
//  NGLKViewController.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGLKViewController.h"

#import <GLKit/GLKViewController.h>

#define instancetype GLKViewController
#define js_value_instancetype js_value_GLKViewController

NGLKViewController::NGLKViewController() {}
NGLKViewController::~NGLKViewController() {}

JS_INIT_CLASS(GLKViewController, UIViewController);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(preferredFramesPerSecond);
  JS_ASSIGN_PROTO_PROP_READONLY(framesPerSecond);
  JS_ASSIGN_PROTO_PROP(isPaused);
  JS_ASSIGN_PROTO_PROP_READONLY(framesDisplayed);
  JS_ASSIGN_PROTO_PROP_READONLY(timeSinceFirstResume);
  JS_ASSIGN_PROTO_PROP_READONLY(timeSinceLastResume);
  JS_ASSIGN_PROTO_PROP_READONLY(timeSinceLastUpdate);
  JS_ASSIGN_PROTO_PROP_READONLY(timeSinceLastDraw);
  JS_ASSIGN_PROTO_PROP(pauseOnWillResignActive);
  JS_ASSIGN_PROTO_PROP(resumeOnDidBecomeActive);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(GLKViewController, UIViewController);
  // constant values (exports)
JS_INIT_CLASS_END(GLKViewController, UIViewController);

NAN_METHOD(NGLKViewController::New) {
  JS_RECONSTRUCT(GLKViewController);
  @autoreleasepool {
    GLKViewController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge GLKViewController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[GLKViewController alloc] init];
    }
    if (self) {
      NGLKViewController *wrapper = new NGLKViewController();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("GLKViewController::New: invalid arguments");
    }
  }
}

#include "NGLKViewControllerDelegate.h"

NAN_GETTER(NGLKViewController::delegateGetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_GLKViewControllerDelegate([self delegate]));
  }
}

NAN_SETTER(NGLKViewController::delegateSetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(GLKViewControllerDelegate, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NGLKViewController::delegate"];
  }
}

NAN_GETTER(NGLKViewController::preferredFramesPerSecondGetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self preferredFramesPerSecond]));
  }
}

NAN_SETTER(NGLKViewController::preferredFramesPerSecondSetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setPreferredFramesPerSecond: input];
  }
}

NAN_GETTER(NGLKViewController::framesPerSecondGetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self framesPerSecond]));
  }
}

NAN_GETTER(NGLKViewController::isPausedGetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPaused]));
  }
}

NAN_SETTER(NGLKViewController::isPausedSetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPaused: input];
  }
}

NAN_GETTER(NGLKViewController::framesDisplayedGetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self framesDisplayed]));
  }
}

NAN_GETTER(NGLKViewController::timeSinceFirstResumeGetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timeSinceFirstResume]));
  }
}

NAN_GETTER(NGLKViewController::timeSinceLastResumeGetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timeSinceLastResume]));
  }
}

NAN_GETTER(NGLKViewController::timeSinceLastUpdateGetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timeSinceLastUpdate]));
  }
}

NAN_GETTER(NGLKViewController::timeSinceLastDrawGetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timeSinceLastDraw]));
  }
}

NAN_GETTER(NGLKViewController::pauseOnWillResignActiveGetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self pauseOnWillResignActive]));
  }
}

NAN_SETTER(NGLKViewController::pauseOnWillResignActiveSetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPauseOnWillResignActive: input];
  }
}

NAN_GETTER(NGLKViewController::resumeOnDidBecomeActiveGetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self resumeOnDidBecomeActive]));
  }
}

NAN_SETTER(NGLKViewController::resumeOnDidBecomeActiveSetter) {
  JS_UNWRAP(GLKViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setResumeOnDidBecomeActive: input];
  }
}

