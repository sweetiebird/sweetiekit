//
//  NSKAttributeValue.mm
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKAttributeValue.h"

#define instancetype SKAttributeValue
#define js_value_instancetype js_value_SKAttributeValue

NSKAttributeValue::NSKAttributeValue() {}
NSKAttributeValue::~NSKAttributeValue() {}

JS_INIT_CLASS(SKAttributeValue, NSObject);
  JS_ASSIGN_STATIC_METHOD(valueWithFloat);
  JS_ASSIGN_STATIC_METHOD(valueWithVectorFloat2);
  JS_ASSIGN_STATIC_METHOD(valueWithVectorFloat3);
  JS_ASSIGN_STATIC_METHOD(valueWithVectorFloat4);
  JS_ASSIGN_PROTO_PROP(floatValue);
  JS_ASSIGN_PROTO_PROP(vectorFloat2Value);
  JS_ASSIGN_PROTO_PROP(vectorFloat3Value);
  JS_ASSIGN_PROTO_PROP(vectorFloat4Value);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKAttributeValue, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SKAttributeValue, NSObject);

NAN_METHOD(NSKAttributeValue::New) {
  JS_RECONSTRUCT(SKAttributeValue);
  @autoreleasepool {
    SKAttributeValue* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKAttributeValue *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKAttributeValue alloc] init];
    }
    if (self) {
      NSKAttributeValue *wrapper = new NSKAttributeValue();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKAttributeValue::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSKAttributeValue::valueWithFloat) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, value);
    JS_SET_RETURN(js_value_instancetype([SKAttributeValue valueWithFloat: value]));
  }
}

NAN_METHOD(NSKAttributeValue::valueWithVectorFloat2) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float2, value);
    JS_SET_RETURN(js_value_instancetype([SKAttributeValue valueWithVectorFloat2: value]));
  }
}

NAN_METHOD(NSKAttributeValue::valueWithVectorFloat3) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float3, value);
    JS_SET_RETURN(js_value_instancetype([SKAttributeValue valueWithVectorFloat3: value]));
  }
}

NAN_METHOD(NSKAttributeValue::valueWithVectorFloat4) {
  declare_autoreleasepool {
    declare_args();
    declare_value(vector_float4, value);
    JS_SET_RETURN(js_value_instancetype([SKAttributeValue valueWithVectorFloat4: value]));
  }
}

NAN_GETTER(NSKAttributeValue::floatValueGetter) {
  JS_UNWRAP(SKAttributeValue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self floatValue]));
  }
}

NAN_SETTER(NSKAttributeValue::floatValueSetter) {
  JS_UNWRAP(SKAttributeValue, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setFloatValue: input];
  }
}

NAN_GETTER(NSKAttributeValue::vectorFloat2ValueGetter) {
  JS_UNWRAP(SKAttributeValue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float2([self vectorFloat2Value]));
  }
}

NAN_SETTER(NSKAttributeValue::vectorFloat2ValueSetter) {
  JS_UNWRAP(SKAttributeValue, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float2, input);
    [self setVectorFloat2Value: input];
  }
}

NAN_GETTER(NSKAttributeValue::vectorFloat3ValueGetter) {
  JS_UNWRAP(SKAttributeValue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float3([self vectorFloat3Value]));
  }
}

NAN_SETTER(NSKAttributeValue::vectorFloat3ValueSetter) {
  JS_UNWRAP(SKAttributeValue, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float3, input);
    [self setVectorFloat3Value: input];
  }
}

NAN_GETTER(NSKAttributeValue::vectorFloat4ValueGetter) {
  JS_UNWRAP(SKAttributeValue, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_vector_float4([self vectorFloat4Value]));
  }
}

NAN_SETTER(NSKAttributeValue::vectorFloat4ValueSetter) {
  JS_UNWRAP(SKAttributeValue, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(vector_float4, input);
    [self setVectorFloat4Value: input];
  }
}
