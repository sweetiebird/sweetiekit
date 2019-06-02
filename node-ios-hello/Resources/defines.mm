//
//  defines.m
//  node-ios-hello
//
//  Created by BB on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NSKNode.h"


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


Local<Value> NSStringToJSString(NSString* value) {
  if (value) {
    return JS_STR([value UTF8String]);
  } else {
    return Nan::Undefined();
  }
}
#include "NNSObject.h"

namespace sweetiekit
{
  Local<Value> GetWrapperFor(__weak id pThing)
  {
    return GetWrapperFor(pThing, NNSObject::type);
  }
  
  Local<Value> GetWrapperFor(__weak id pThing, Nan::Persistent<FunctionTemplate>& defaultType)
  {
    @autoreleasepool {
      if (pThing == nullptr) {
        return Nan::Undefined();
      }
      if ([pThing isKindOfClass:[NSString class]]) {
        return JS_STR([(NSString*)pThing UTF8String]);
      }
      Nan::EscapableHandleScope scope;
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)pThing)
      };
      auto result(JS_FUNC(Nan::New(NNSObject::GetNSObjectType(pThing, defaultType)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked());
//      auto kind(NNSObject::GetNSObjectType(pThing, defaultType));
      return scope.Escape(result);
    }
  }
  
  id GetValueFor(Local<Value> value, bool* failed) {
    if (failed) {
      *failed = false;
    }
    if (JS_INSTANCEOF(value, Nid)) {
      JS_UNWRAPPED_(value, id, result);
      return result;
    }
    if (value->IsNullOrUndefined()) {
      return nullptr;
    }
    if (value->IsExternal()) {
      id result = (__bridge id)(value.As<External>()->Value());
      return result;
    }
    if (value->IsString()) {
      return to_value_NSString(value);
    }
    if (value->IsInt32()) {
      return [[NSNumber alloc] initWithInt: TO_INT32(value)];
    }
    if (value->IsUint32()) {
      return [[NSNumber alloc] initWithUnsignedInt: TO_UINT32(value)];
    }
    if (value->IsNumber()) {
      return [[NSNumber alloc] initWithDouble: TO_DOUBLE(value)];
    }
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected objective-c id value");
    }
    return nullptr;
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
    return SetTransform((float*)&transform, value);
  }
  bool SetTransform(float* matrix, Local<Value> value) {
    Nan::HandleScope scope;
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
    return SetTransform3((float*)&transform, value);
  }
  bool SetTransform3(float* matrix, Local<Value> value) {
    Nan::HandleScope scope;
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
  
  bool SetQuaternion(simd_quatf& quat, Local<Value> value) {
    return SetQuaternion((float*)&quat, value);
  }
  bool SetQuaternion(float* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 4;
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform = Local<Float32Array>::Cast(value);
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform = Local<Array>::Cast(value);
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform = Local<Float64Array>::Cast(value);
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
      elements[1] = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")));
      elements[2] = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("z")));
      elements[3] = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("w")));
    } else {
      return false;
    }
    return true;
  }
  
  bool SetVector3(simd_float3& quat, Local<Value> value) {
    return SetVector3((float*)&quat, value);
  }
  bool SetVector3(float* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 3;
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform = Local<Float32Array>::Cast(value);
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform = Local<Array>::Cast(value);
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform = Local<Float64Array>::Cast(value);
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
      elements[1] = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")));
      elements[2] = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("z")));
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

Local<Value> js_value_simd_quatf(const simd_quatf& value) {
  return createTypedArray<Float32Array>(4, (const float*)&value);
}

Local<Value> js_value_simd_float3(const simd_float3& value) {
  return createTypedArray<Float32Array>(3, (const float*)&value);
}

Local<Value> js_value_simd_float4(const simd_float4& value) {
  return createTypedArray<Float32Array>(4, (const float*)&value);
}

Local<Value> js_value_simd_float3x3(const simd_float3x3& value) {
  return createTypedArray<Float32Array>(9, (const float*)&value);
}

Local<Value> js_value_simd_float4x4(const simd_float4x4& value) {
  return createTypedArray<Float32Array>(16, (const float*)&value);
}

simd_quatf    to_value_simd_quatf(const Local<Value>& value, bool * _Nullable failed) {
  simd_quatf result = { { 0, 0, 0, 1 } };
  bool ok = sweetiekit::SetQuaternion(result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_quatf");
  }
  return result;
}

simd_float3   to_value_simd_float3(const Local<Value>& value, bool * _Nullable failed) {
  simd_float3 result = { 0, 0, 0 };
  bool ok = sweetiekit::SetVector3(result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_float3");
  }
  return result;
}

simd_float4   to_value_simd_float4(const Local<Value>& value, bool * _Nullable failed) {
  simd_float4 result = { 0, 0, 0, 1 };
  bool ok = sweetiekit::SetQuaternion((float*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_float4");
  }
  return result;
}

simd_float3x3 to_value_simd_float3x3(const Local<Value>& value, bool * _Nullable failed) {
  simd_float3x3 result = { {
    { 1, 0, 0 },
    { 0, 1, 0 },
    { 0, 0, 1 },
  } };
  bool ok = sweetiekit::SetTransform3(result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_float3x3");
  }
  return result;
}

simd_float4x4 to_value_simd_float4x4(const Local<Value>& value, bool * _Nullable failed) {
  simd_float4x4 result = { {
    { 1, 0, 0, 0 },
    { 0, 1, 0, 0 },
    { 0, 0, 1, 0 },
    { 0, 0, 0, 1 },
  } };
  bool ok = sweetiekit::SetTransform(result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_float4x4");
  }
  return result;
}

Local<Value> js_value_SCNQuaternion(const SCNQuaternion& value) {
  //return createTypedArray<Float32Array>(4, (const float*)&value);
  Nan::EscapableHandleScope scope;
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_FLOAT(value.x));
  result->Set(JS_STR("y"), JS_FLOAT(value.y));
  result->Set(JS_STR("z"), JS_FLOAT(value.z));
  result->Set(JS_STR("w"), JS_FLOAT(value.w));
  return scope.Escape(result);
}

Local<Value> js_value_SCNVector3(const SCNVector3& value) {
  //return createTypedArray<Float32Array>(3, (const float*)&value);
  Nan::EscapableHandleScope scope;
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_FLOAT(value.x));
  result->Set(JS_STR("y"), JS_FLOAT(value.y));
  result->Set(JS_STR("z"), JS_FLOAT(value.z));
  return scope.Escape(result);
}

Local<Value> js_value_SCNVector4(const SCNVector4& value) {
//  return createTypedArray<Float32Array>(4, (const float*)&value);
  Nan::EscapableHandleScope scope;
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_FLOAT(value.x));
  result->Set(JS_STR("y"), JS_FLOAT(value.y));
  result->Set(JS_STR("z"), JS_FLOAT(value.z));
  result->Set(JS_STR("w"), JS_FLOAT(value.w));
  return scope.Escape(result);
}

Local<Value> js_value_SCNMatrix4(const SCNMatrix4& value) {
  return createTypedArray<Float32Array>(16, (const float*)&value);
}

SCNQuaternion    to_value_SCNQuaternion(const Local<Value>& value, bool * _Nullable failed) {
  SCNQuaternion result = { 0, 0, 0, 1 };
  bool ok = sweetiekit::SetQuaternion((float*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected SCNQuaternion");
  }
  return result;
}

SCNVector3   to_value_SCNVector3(const Local<Value>& value, bool * _Nullable failed) {
  SCNVector3 result = { 0, 0, 0 };
  bool ok = sweetiekit::SetVector3((float*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected SCNVector3");
  }
  return result;
}

SCNVector4   to_value_SCNVector4(const Local<Value>& value, bool * _Nullable failed) {
  SCNVector4 result = { 0, 0, 0, 1 };
  bool ok = sweetiekit::SetQuaternion((float*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected SCNVector4");
  }
  return result;
}

SCNMatrix4 to_value_SCNMatrix4(const Local<Value>& value, bool * _Nullable failed) {
  SCNMatrix4 result = {
    1, 0, 0, 0,
    0, 1, 0, 0,
    0, 0, 1, 0,
    0, 0, 0, 1,
  };
  bool ok = sweetiekit::SetTransform((float*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected SCNMatrix4");
  }
  return result;
}

Local<Value> js_value_CGPoint(const CGPoint& pt) {
  auto result = Nan::New<Object>();
  Nan::Set(result, JS_STR("x"), JS_NUM(pt.x));
  Nan::Set(result, JS_STR("y"), JS_NUM(pt.y));
  return result;
}

Local<Value> js_value_CGVector(const CGVector& pt) {
  auto result = Nan::New<Object>();
  Nan::Set(result, JS_STR("dx"), JS_NUM(pt.dx));
  Nan::Set(result, JS_STR("dy"), JS_NUM(pt.dy));
  return result;
}

Local<Value> js_value_CGSize(const CGSize& size) {
  auto result = Nan::New<Object>();
  Nan::Set(result, JS_STR("width"), JS_NUM(size.width));
  Nan::Set(result, JS_STR("height"), JS_NUM(size.height));
  return result;
}

Local<Value> js_value_CGRect(const CGRect& rect) {
  auto result = Nan::New<Object>();
  Nan::Set(result, JS_STR("x"), JS_NUM(rect.origin.x));
  Nan::Set(result, JS_STR("y"), JS_NUM(rect.origin.y));
  Nan::Set(result, JS_STR("width"), JS_NUM(rect.size.width));
  Nan::Set(result, JS_STR("height"), JS_NUM(rect.size.height));
  return result;
}

CGPoint to_value_CGPoint(const Local<Value>& value) {
  return CGPointMake(
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x"))),
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")))
  );
}

CGVector to_value_CGVector(const Local<Value>& value) {
  return CGVectorMake(
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("dx"))),
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("dy")))
  );
}

CGSize to_value_CGSize(const Local<Value>& value) {
  return CGSizeMake(
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("width"))),
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("height")))
  );
}

CGRect to_value_CGRect(const Local<Value>& value) {
  return CGRectMake(
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x"))),
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y"))),
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("width"))),
    TO_FLOAT(JS_OBJ(value)->Get(JS_STR("height")))
  );
}

Local<Value> js_value_CGColor(CGColorRef _Nullable color) {
  return sweetiekit::JSObjFromCGColor(color);
}

Local<Value> js_value_UIColor(UIColor* _Nullable color) {
  return sweetiekit::JSObjFromUIColor(color);
}

CGColorRef _Nullable to_value_CGColor(const Local<Value>& value, bool * _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  CGColorRef result = sweetiekit::CGColorRefFromJSColor(value);
  if (!result) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected CGColor");
    }
  }
  return result;
}

UIColor* _Nullable to_value_UIColor(const Local<Value>& value, bool * _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  UIColor* result = sweetiekit::UIColorFromJSColor(value);
  if (!result) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected CGColor");
    }
  }
  return result;
}
