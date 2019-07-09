//
//  NEAGLContext.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NEAGLContext.h"

#ifdef __IPHONEOS__

#define instancetype EAGLContext
#define js_value_instancetype js_value_EAGLContext

NEAGLContext::NEAGLContext() {}
NEAGLContext::~NEAGLContext() {}

JS_METHOD(NEAGLGetVersion) {
  declare_autoreleasepool {
    unsigned int major = 0;
    unsigned int minor = 0;
    EAGLGetVersion(&major, &minor);
    Nan::EscapableHandleScope scope;
    Local<Object> result(Nan::New<Object>());
    result->Set(JS_STR("major"), js_value_uint32_t(major));
    result->Set(JS_STR("minor"), js_value_uint32_t(minor));
    JS_SET_RETURN(scope.Escape(result));
  }
}

JS_INIT_CLASS(EAGLContext, NSObject);
  JS_ASSIGN_GLOBAL_METHOD_AS(NEAGLGetVersion, "EAGLGetVersion");
  JS_ASSIGN_STATIC_METHOD(setCurrentContext);
  JS_ASSIGN_STATIC_METHOD(currentContext);
  JS_ASSIGN_PROTO_METHOD(initWithAPI);
  JS_ASSIGN_PROTO_METHOD(initWithAPISharegroup);
  JS_ASSIGN_PROTO_PROP_READONLY(API);
  JS_ASSIGN_PROTO_PROP_READONLY(sharegroup);
  JS_ASSIGN_PROTO_PROP(debugLabel);
  JS_ASSIGN_PROTO_PROP(isMultiThreaded);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(EAGLContext, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSUInteger, EAGLRenderingAPI) {
    JS_ASSIGN_ENUM(kEAGLRenderingAPIOpenGLES1, NSInteger); //  = 1,
    JS_ASSIGN_ENUM(kEAGLRenderingAPIOpenGLES2, NSInteger); //  = 2,
    JS_ASSIGN_ENUM(kEAGLRenderingAPIOpenGLES3, NSInteger); //  = 3,
  //};

JS_INIT_CLASS_END(EAGLContext, NSObject);

NAN_METHOD(NEAGLContext::New) {
  JS_RECONSTRUCT(EAGLContext);
  @autoreleasepool {
    EAGLContext* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge EAGLContext *)(info[0].As<External>()->Value());
    }
    if (self) {
      NEAGLContext *wrapper = new NEAGLContext();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("EAGLContext::New: invalid arguments");
    }
  }
}

NAN_METHOD(NEAGLContext::setCurrentContext) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(EAGLContext, context);
    JS_SET_RETURN(js_value_BOOL([EAGLContext setCurrentContext: context]));
  }
}

NAN_METHOD(NEAGLContext::currentContext) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_EAGLContext([EAGLContext currentContext]));
  }
}

NAN_METHOD(NEAGLContext::initWithAPI) {
  JS_UNWRAP_OR_ALLOC(EAGLContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(EAGLRenderingAPI, api);
    JS_SET_RETURN(js_value_instancetype([self initWithAPI: api]));
  }
}

#include "NEAGLSharegroup.h"

NAN_METHOD(NEAGLContext::initWithAPISharegroup) {
  JS_UNWRAP_OR_ALLOC(EAGLContext, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(EAGLRenderingAPI, api);
    declare_pointer(EAGLSharegroup, sharegroup);
    JS_SET_RETURN(js_value_instancetype([self initWithAPI: api sharegroup: sharegroup]));
  }
}

NAN_SETTER(NEAGLSharegroup::debugLabelSetter) {
  JS_UNWRAP(EAGLSharegroup, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setDebugLabel: input];
  }
}
// EAGLContext

NAN_GETTER(NEAGLContext::APIGetter) {
  JS_UNWRAP(EAGLContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_EAGLRenderingAPI([self API]));
  }
}

NAN_GETTER(NEAGLContext::sharegroupGetter) {
  JS_UNWRAP(EAGLContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_EAGLSharegroup([self sharegroup]));
  }
}

NAN_GETTER(NEAGLContext::debugLabelGetter) {
  JS_UNWRAP(EAGLContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self debugLabel]));
  }
}

NAN_SETTER(NEAGLContext::debugLabelSetter) {
  JS_UNWRAP(EAGLContext, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setDebugLabel: input];
  }
}

NAN_GETTER(NEAGLContext::isMultiThreadedGetter) {
  JS_UNWRAP(EAGLContext, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMultiThreaded]));
  }
}

NAN_SETTER(NEAGLContext::isMultiThreadedSetter) {
  JS_UNWRAP(EAGLContext, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setMultiThreaded: input];
  }
}

#endif
