//
//  NSKAttribute.mm
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKAttribute.h"

#define instancetype SKAttribute
#define js_value_instancetype js_value_SKAttribute

NSKAttribute::NSKAttribute() {}
NSKAttribute::~NSKAttribute() {}

JS_INIT_CLASS(SKAttribute, NSObject);
  JS_ASSIGN_STATIC_METHOD(attributeWithNameType);
  JS_ASSIGN_PROTO_METHOD(initWithNameType);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(type);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKAttribute, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, SKAttributeType) {
    JS_ASSIGN_ENUM(SKAttributeTypeNone, NSInteger); //                  =    0,
    
    JS_ASSIGN_ENUM(SKAttributeTypeFloat, NSInteger); //                 =    1,
    JS_ASSIGN_ENUM(SKAttributeTypeVectorFloat2, NSInteger); //          =    2,
    JS_ASSIGN_ENUM(SKAttributeTypeVectorFloat3, NSInteger); //          =    3,
    JS_ASSIGN_ENUM(SKAttributeTypeVectorFloat4, NSInteger); //          =    4,
    
    JS_ASSIGN_ENUM(SKAttributeTypeHalfFloat, NSInteger); //             =    5,
    JS_ASSIGN_ENUM(SKAttributeTypeVectorHalfFloat2, NSInteger); //      =    6,
    JS_ASSIGN_ENUM(SKAttributeTypeVectorHalfFloat3, NSInteger); //      =    7,
    JS_ASSIGN_ENUM(SKAttributeTypeVectorHalfFloat4, NSInteger); //      =    8,
  //} NS_ENUM_AVAILABLE(10_11, 9_0);

JS_INIT_CLASS_END(SKAttribute, NSObject);

NAN_METHOD(NSKAttribute::New) {
  JS_RECONSTRUCT(SKAttribute);
  @autoreleasepool {
    SKAttribute* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKAttribute *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKAttribute alloc] init];
    }
    if (self) {
      NSKAttribute *wrapper = new NSKAttribute();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKAttribute::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSKAttribute::attributeWithNameType) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(SKAttributeType, type);
    JS_SET_RETURN(js_value_instancetype([SKAttribute attributeWithName: name type: type]));
  }
}

NAN_METHOD(NSKAttribute::initWithNameType) {
  JS_UNWRAP_OR_ALLOC(SKAttribute, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(SKAttributeType, type);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name type: type]));
  }
}

NAN_GETTER(NSKAttribute::nameGetter) {
  JS_UNWRAP(SKAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NSKAttribute::typeGetter) {
  JS_UNWRAP(SKAttribute, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKAttributeType([self type]));
  }
}
