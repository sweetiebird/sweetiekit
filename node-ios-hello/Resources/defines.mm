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
    Nan::HandleScope handleScope;
    return jsThing->IsNumber();
  }
  
  bool IsJSColor(Local<Value> jsThing)
  {
    Nan::HandleScope scope;

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
    Nan::HandleScope scope;
    return JS_HAS(jsObj, JS_STR("alpha"));
  }

  UIColor* UIColorFromJSColor(Local<Value> jsThing)
  {
    Nan::HandleScope scope;

    Local<Object> jsObj = JS_OBJ(jsThing);
    double r = TO_DOUBLE(jsObj->Get(JS_STR("red")));
    double g = TO_DOUBLE(jsObj->Get(JS_STR("green")));
    double b = TO_DOUBLE(jsObj->Get(JS_STR("blue")));
    double a = HasJSAlphaProp(jsObj) ? TO_DOUBLE(jsObj->Get(JS_STR("alpha"))) : 1.0;
    
    UIColor *color = [[UIColor alloc] initWithRed:r green:g blue:b alpha:a];
    return color;
  }
  
  CGColorRef CGColorRefFromJSColor(Local<Value> jsThing)
  {
    Nan::HandleScope scope;

    UIColor *color = UIColorFromJSColor(jsThing);

    return color.CGColor;
  }

  Local<Object> JSObjFromCGColor(CGColorRef color)
  {
    Nan::EscapableHandleScope handleScope;

    const CGFloat* components = CGColorGetComponents(color);
    float r = components[0];
    float g = components[1];
    float b = components[2];
    float a = CGColorGetAlpha(color);

    Local<Object> result = Object::New(Isolate::GetCurrent());
    result->Set(JS_STR("red"), JS_NUM(r));
    result->Set(JS_STR("green"), JS_NUM(g));
    result->Set(JS_STR("blue"), JS_NUM(b));
    result->Set(JS_STR("alpha"), JS_NUM(a));
  
    return handleScope.Escape(result);
  }
  
  Local<Object> JSObjFromUIColor(UIColor* color)
  {
    Nan::EscapableHandleScope handleScope;

    double r = 0;
    double g = 0;
    double b = 0;
    double a = 0;
    [color getRed:&r green:&g blue:&b alpha:&a];

    Local<Object> result = Object::New(Isolate::GetCurrent());
    result->Set(JS_STR("red"), JS_NUM(r));
    result->Set(JS_STR("green"), JS_NUM(g));
    result->Set(JS_STR("blue"), JS_NUM(b));
    result->Set(JS_STR("alpha"), JS_NUM(a));
  
    return handleScope.Escape(result);
  }

  bool IsJSFrame(Local<Value> jsThing)
  {
    Nan::HandleScope scope;

    if (jsThing->IsObject()) {
      Local<Object> jsObj = JS_OBJ(jsThing);
      return JS_HAS(jsObj, JS_STR("x"))
        && JS_HAS(jsObj, JS_STR("y"))
        && JS_HAS(jsObj, JS_STR("width"))
        && JS_HAS(jsObj, JS_STR("height"));
    }
  
    return false;
  }

  CGRect FrameFromJSObj(Local<Value> jsThing)
  {
    Nan::HandleScope scope;

    if (jsThing->IsObject()) {
      Local<Object> jsObj = JS_OBJ(jsThing);
      double x = TO_DOUBLE(jsObj->Get(JS_STR("x")));
      double y = TO_DOUBLE(jsObj->Get(JS_STR("y")));
      double w = TO_DOUBLE(jsObj->Get(JS_STR("width")));
      double h = TO_DOUBLE(jsObj->Get(JS_STR("height")));
      return CGRectMake(x, y, w, h);
    }

    return CGRectZero;
  }
  
  Local<Object> JSObjFromFrame(CGRect frame)
  {
    Nan::EscapableHandleScope handleScope;

    Local<Object> result = Object::New(Isolate::GetCurrent());

    Local<Object> origin = Object::New(Isolate::GetCurrent());
    origin->Set(JS_STR("x"), JS_NUM(frame.origin.x));
    origin->Set(JS_STR("y"), JS_NUM(frame.origin.y));
    result->Set(JS_STR("origin"), JS_OBJ(origin));

    Local<Object> size = Object::New(Isolate::GetCurrent());
    size->Set(JS_STR("width"), JS_NUM(frame.size.width));
    size->Set(JS_STR("height"), JS_NUM(frame.size.height));
    result->Set(JS_STR("size"), JS_OBJ(size));

    result->Set(JS_STR("minX"), JS_NUM(CGRectGetMinX(frame)));
    result->Set(JS_STR("maxX"), JS_NUM(CGRectGetMaxX(frame)));
    result->Set(JS_STR("minY"), JS_NUM(CGRectGetMinY(frame)));
    result->Set(JS_STR("maxY"), JS_NUM(CGRectGetMaxY(frame)));
  
    
    return handleScope.Escape(result);
  }

  Local<Array> JSArrayFromCGAffineTransform(CGAffineTransform xform)
  {
    Nan::EscapableHandleScope handleScope;

    Local<Array> result = Nan::New<Array>();
    Nan::Set(result, static_cast<uint32_t>(0), JS_NUM(xform.a));
    Nan::Set(result, static_cast<uint32_t>(1), JS_NUM(xform.b));
    Nan::Set(result, static_cast<uint32_t>(2), JS_NUM(xform.c));
    Nan::Set(result, static_cast<uint32_t>(3), JS_NUM(xform.d));
    Nan::Set(result, static_cast<uint32_t>(4), JS_NUM(xform.tx));
    Nan::Set(result, static_cast<uint32_t>(5), JS_NUM(xform.ty));

    return handleScope.Escape(result);
  }
  
  CGAffineTransform CGAffineXFormFromJSArray(Local<Value> jsThing)
  {
    Nan::HandleScope scope;

    if (jsThing->IsArray()) {
      Local<Array> array = Local<Array>::Cast(jsThing);
      double a = TO_DOUBLE(array->Get(0));
      double b = TO_DOUBLE(array->Get(1));
      double c = TO_DOUBLE(array->Get(2));
      double d = TO_DOUBLE(array->Get(3));
      double tx = TO_DOUBLE(array->Get(4));
      double ty = TO_DOUBLE(array->Get(5));
      return CGAffineTransformMake(a, b, c, d, tx, ty);
    }

    return CGAffineTransformIdentity;
  }

  id FromJS(Local<Value> jsThing)
  {
    Nan::EscapableHandleScope handleScope;
    if (IsJSColor(jsThing)) {
      UIColor *color = UIColorFromJSColor(jsThing);
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
  
  bool SetTransform3(simd_float3x3& transform, Local<Value> value) {
    Nan::HandleScope scope;
    float* matrix = (float*)&transform;
    if (value->IsObject() && JS_HAS(JS_OBJ(value), JS_STR("elements"))) {
      value = JS_OBJ(value)->Get(JS_STR("elements"));
    }
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform = Local<Float32Array>::Cast(value);
      for (uint32_t i = 0; i < 9; i++) {
        matrix[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform = Local<Array>::Cast(value);
      for (uint32_t i = 0; i < 9; i++) {
        matrix[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform = Local<Float64Array>::Cast(value);
      for (uint32_t i = 0; i < 9; i++) {
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

Local<Value> js_value_CGPoint(const CGPoint& pt) {
  auto __obj = Nan::New<Object>();
  Nan::Set(__obj, JS_STR("x"), JS_NUM(pt.x));
  Nan::Set(__obj, JS_STR("y"), JS_NUM(pt.y));
  return __obj;
}

CGPoint to_value_CGPoint(const Local<Value>& value) {
  return CGPointMake(
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x"))),
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")))
  );
}

CGSize to_value_CGSize(const Local<Value>& value) {
  return CGSizeMake(
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("width"))),
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("height")))
  );
}
