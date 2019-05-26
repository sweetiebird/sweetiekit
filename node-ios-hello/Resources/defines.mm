//
//  defines.m
//  node-ios-hello
//
//  Created by BB on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"


bool NJSStringGetUTF8String(Local<Value> jsStr, std::string& outStr) {
  Nan::HandleScope scope;
  
  std::string identifier;
  if (jsStr->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(jsStr));
    outStr = *utf8Value;
    return true;
  } else {
    return false;
  }
}

NSString* NJSStringToNSString(Local<Value> jsStr) {
  std::string str;
  if (NJSStringGetUTF8String(jsStr, str)) {
    return [NSString stringWithUTF8String:str.c_str()];
  } else {
    return nullptr;
  }
}

#include "NNSObject.h"

namespace sweetiekit
{
  Local<Value> GetWrapperFor(id pThing)
  {
    return GetWrapperFor(pThing, NNSObject::type);
  }
  
  Local<Value> GetWrapperFor(id pThing, Nan::Persistent<FunctionTemplate>& defaultType)
  {
    Nan::EscapableHandleScope handleScope;
    Local<Value> result;
    if (pThing != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)pThing)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(pThing, defaultType)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      result = value;
    } else {
      result = Nan::Undefined();
    }
    return handleScope.Escape(result);
  }
  
  bool IsJSNumber(Local<Value> jsThing)
  {
    Nan::EscapableHandleScope handleScope;
    return jsThing->IsNumber();
  }
  
  bool IsJSColor(Local<Value> jsThing)
  {
    Nan::EscapableHandleScope handleScope;

    if (!jsThing->IsObject()) {
      return false;
    }

    Local<Object> jsObj = JS_OBJ(jsThing);
    return JS_HAS(jsObj, JS_STR("red"))
      && JS_HAS(jsObj, JS_STR("green"))
      && JS_HAS(jsObj, JS_STR("blue"));
  }
  
  bool HasJSAlphaProp(Local<Object> jsObj)
  {
    Nan::EscapableHandleScope handleScope;
    return JS_HAS(jsObj, JS_STR("alpha"));
  }

  UIColor* ColorFromJSColor(Local<Value> jsThing)
  {
    Nan::EscapableHandleScope handleScope;

    Local<Object> jsObj = JS_OBJ(jsThing);
    double r = TO_DOUBLE(jsObj->Get(JS_STR("red")));
    double g = TO_DOUBLE(jsObj->Get(JS_STR("green")));
    double b = TO_DOUBLE(jsObj->Get(JS_STR("blue")));
    double a = HasJSAlphaProp(jsObj) ? TO_DOUBLE(jsObj->Get(JS_STR("alpha"))) : 1.0;
    
    UIColor *color = [[UIColor alloc] initWithRed:r green:g blue:b alpha:a];
    return color;
  }

  id FromJS(Local<Value> jsThing)
  {
    Nan::EscapableHandleScope handleScope;
    if (IsJSColor(jsThing)) {
      UIColor *color = ColorFromJSColor(jsThing);
      return color;
    }

    if (IsJSNumber(jsThing)) {
      NSNumber *thing = [NSNumber numberWithDouble:TO_DOUBLE(jsThing)];
      return thing;
    }

    JS_UNWRAPPED(jsThing, NSObject, thing);
    return thing;
  }
  

  bool SetTransform(simd_float4x4& transform, Local<Value> value) {
    Nan::HandleScope scope;
    float* matrix = (float*)&transform;
    if (value->IsObject() && JS_HAS(JS_OBJ(value), JS_STR("elements"))) {
      value = JS_OBJ(value)->Get(JS_STR("elements"));
    }
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform = Local<Float32Array>::Cast(value);
      for (uint32_t i = 0; i < 16; i++) {
        matrix[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform = Local<Array>::Cast(value);
      for (uint32_t i = 0; i < 16; i++) {
        matrix[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform = Local<Float64Array>::Cast(value);
      for (uint32_t i = 0; i < 16; i++) {
        matrix[i] = TO_FLOAT(xform->Get(i));
      }
    } else {
      return false;
    }
    return true;
  }
}

@implementation SweetJSFunction
- (sweetiekit::JSFunction *)jsFunction {
  return &_jsFunction;
}
@end
