//
//  defines.m
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
#include <unordered_map>

typedef Isolate* NJSContextRef;
typedef Isolate* NJSGlobalContextRef;
typedef Local<Value> NJSValueRef;
typedef Local<Object> NJSObjectRef;

@interface NJSValue : NSObject
- (instancetype)initWithValue:(NJSValueRef)value;
- (Local<Value>)toJS;
@end

@implementation NJSValue {
  Nan::Persistent<Value> m_value;
}
- (instancetype)initWithValue:(NJSValueRef)value
{
  self = [super init];
  if (!self)
    return nil;
  self->m_value.Reset(value);
//  self->m_value.SetWeak<Value>(value);
  return self;
}
- (Local<Value>)toJS
{
  if (m_value.IsEmpty()) {
    return Nan::Undefined();
  }
  return Nan::New(m_value);
}
@end

@interface NJSObject : NJSValue
@end

@implementation NJSObject {
}
@end

@interface NJSObjCClassInfo : NJSObject
- (instancetype)initForClass:(Class)cls;
- (NJSObject*)constructorInContext:(NJSContextRef)context;
- (NJSObject*)wrapperForObject:(id)value inContext:(NJSContextRef)context;
@end

@implementation NJSObjCClassInfo {
  Class m_cls;
  Nan::Persistent<FunctionTemplate> m_type;
}
- (instancetype)initForClass:(Class)cls
{
    self = [super init];
    if (!self)
        return nil;
    m_cls = cls;
    return self;
}
Nan::NAN_METHOD_RETURN_TYPE New(Nan::NAN_METHOD_ARGS_TYPE info) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  Nid *la = new Nid();

  if (info[0]->IsExternal()) {
    la->set_self((__bridge id)(info[0].As<External>()->Value()));
  } else {
    delete la;
    la = nullptr;
    Nan::ThrowError("NJSObjCClassInfo::New: failed");
    return;
  }
  la->wrap(obj);

  info.GetReturnValue().Set(obj);
}
- (NJSObject*)constructorInContext:(NJSContextRef)context
{
//  NNSObject::GetNSObjectType(NSObject *obj, Nan::Persistent<FunctionTemplate> &unset);
#if 1
//  Nan::EscapableHandleScope scope;

  /* constructor */
  Local<FunctionTemplate> ctorObj = Nan::New<FunctionTemplate>(New);
//  ctorObj->Inherit(Nan::New(Nid::type));
  ctorObj->InstanceTemplate()->SetInternalFieldCount(1);
  ctorObj->SetClassName(JS_STR(object_getClassName(m_cls)));
//  type.Reset(ctorObj);
  
  /* prototype */
  Local<ObjectTemplate> proto = ctorObj->PrototypeTemplate(); proto = proto;

  Local<Function> ctor = Nan::GetFunction(ctorObj).ToLocalChecked();
//  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctor), ctorObj);
  return [[NJSObject alloc] initWithValue:ctor];
#else
  return nil;
#endif
}
- (NJSObject*)wrapperForObject:(id)value inContext:(NJSContextRef)context
{
  return nil;
}
@end

@interface NJSWrapperMap : NSObject
- (instancetype)initWithContext:(NJSContextRef)context;
- (NJSObjCClassInfo*)classInfoForClass:(Class)cls;
@end

struct ObjCWeakRef {
  ObjCWeakRef(__weak id ref) : ref(ref) {}
  ObjCWeakRef(const ObjCWeakRef& rhs) : ref(rhs.ref) {}
  ObjCWeakRef& operator =(const ObjCWeakRef& rhs) {
    this->ref = rhs.ref;
    return *this;
  }
  
  bool operator == (__weak id src) const { return this->ref == src; }
  bool operator == (const ObjCWeakRef& src) const { return this->ref == src.ref; }
  operator size_t() const {
    return (size_t)ref;
  }
  __weak id ref;
};

struct ObjCWeakRefHash { 
  size_t operator()(__weak id ref) const
  { 
    return (size_t)ref;
  } 
}; 

@implementation NJSWrapperMap {
  NSMutableDictionary *m_classMap;
  std::unordered_map<__weak id, NJSValue*, ObjCWeakRefHash> m_cachedJSWrappers;
  NSMapTable *m_cachedObjCWrappers;
}

- (instancetype)initWithContext:(NJSContextRef)context
{
  self = [super init];
  if (!self)
      return nil;

  NSPointerFunctionsOptions keyOptions = NSPointerFunctionsOpaqueMemory | NSPointerFunctionsOpaquePersonality;
  NSPointerFunctionsOptions valueOptions = NSPointerFunctionsWeakMemory | NSPointerFunctionsObjectPersonality;
  m_cachedObjCWrappers = [[NSMapTable alloc] initWithKeyOptions:keyOptions valueOptions:valueOptions capacity:0];
  
//    m_cachedJSWrappers = std::make_unique<JSC::WeakGCMap<id, JSC::JSObject>>(toJS(context)->vm());

//    ASSERT(!toJSGlobalObject(context)->wrapperMap());
//    toJSGlobalObject(context)->setWrapperMap(self);
  m_classMap = [[NSMutableDictionary alloc] init];
  return self;
}

- (NJSObjCClassInfo*)classInfoForClass:(Class)cls
{
  if (!cls)
      return nil;

  // Check if we've already created a JSObjCClassInfo for this Class.
  if (NJSObjCClassInfo* classInfo = (NJSObjCClassInfo*)m_classMap[cls])
      return classInfo;

  // Skip internal classes beginning with '_' - just copy link to the parent class's info.
  if ('_' == *class_getName(cls)) {
#if 0
      bool conformsToExportProtocol = false;
      forEachProtocolImplementingProtocol(cls, getJSExportProtocol(), [&conformsToExportProtocol](Protocol *, bool& stop) {
          conformsToExportProtocol = true;
          stop = true;
      });

      if (!conformsToExportProtocol)
          return m_classMap[cls] = [self classInfoForClass:class_getSuperclass(cls)];
#endif
  }

  return m_classMap[cls] = [[NJSObjCClassInfo alloc] initForClass:cls];
}

- (NJSValue *)findJSWrapperForObject:(id)object inContext:(NJSContextRef)context
{
  NJSValue* jsWrapper = nil;
  ObjCWeakRef objcRef(object);
  auto it(m_cachedJSWrappers.find(object));
  if (it != m_cachedJSWrappers.end())
  {
    jsWrapper = it->second;
    if (jsWrapper) {
      auto value([jsWrapper toJS]);
      if (value.IsEmpty() || value->IsNullOrUndefined()) {
        m_cachedJSWrappers.erase(it);
      } else {
        return jsWrapper;
      }
    }
//        return [JSValue valueWithJSValueRef:toRef(jsWrapper) inContext:context];
  }
  return nil;
}

- (void)setJSWrapperForObject:(id)object wrapper:(NJSValue*)wrapper inContext:(NJSContextRef)context
{
  auto it(m_cachedJSWrappers.find(object));
  if (it != m_cachedJSWrappers.end()) {
    m_cachedJSWrappers.erase(it);
  }
  if (wrapper) {
    auto value([wrapper toJS]);
    if (!(value.IsEmpty() || value->IsNullOrUndefined())) {
      m_cachedJSWrappers[object] = wrapper;
    }
  }
}

- (NJSValue *)jsWrapperForObject:(id)object inContext:(NJSContextRef)context
{
//    ASSERT(toJSGlobalObject([context JSGlobalContextRef])->wrapperMap() == self);
  NJSValue* jsWrapper = nil;
  ObjCWeakRef objcRef(object);
  if (m_cachedJSWrappers.find(object) != m_cachedJSWrappers.end())
  {
    jsWrapper = m_cachedJSWrappers[object];
    if (jsWrapper)
      return jsWrapper;
//        return [JSValue valueWithJSValueRef:toRef(jsWrapper) inContext:context];
  }

  if (class_isMetaClass(object_getClass(object)))
      jsWrapper = [[self classInfoForClass:(Class)object] constructorInContext:context];
  else {
      NJSObjCClassInfo* classInfo = [self classInfoForClass:[object class]];
      jsWrapper = [classInfo wrapperForObject:object inContext:context];
  }

  // FIXME: https://bugs.webkit.org/show_bug.cgi?id=105891
  // This general approach to wrapper caching is pretty effective, but there are a couple of problems:
  // (1) For immortal objects JSValues will effectively leak and this results in error output being logged - we should avoid adding associated objects to immortal objects.
  // (2) A long lived object may rack up many JSValues. When the contexts are released these will unprotect the associated JavaScript objects,
  //     but still, would probably nicer if we made it so that only one associated object was required, broadcasting object dealloc.
//    m_cachedJSWrappers->set(object, jsWrapper);
  m_cachedJSWrappers[object] = jsWrapper;
//    return [JSValue valueWithJSValueRef:toRef(jsWrapper) inContext:context];
  return jsWrapper;
}

@end

//id tryUnwrapObjcObject(JSGlobalContextRef, JSValueRef);


namespace sweetiekit
{
  NJSWrapperMap* g_wrapperMap;
  
  NJSWrapperMap* GetWrapperMap() {
    if (!g_wrapperMap) {
#if SWEETIEKIT_WRAPPER_MAP
      g_wrapperMap = [[NJSWrapperMap alloc] initWithContext:Isolate::GetCurrent()];
#endif
    }
    return g_wrapperMap;
  }
  
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
        return js_value_NSString((NSString*)pThing);
      }
      if ([pThing isKindOfClass:[NSDate class]]) {
        return js_value_NSDate((NSDate*)pThing);
      }
      if ([pThing isKindOfClass:[NSNumber class]]) {
        return js_value_NSNumber((NSNumber*)pThing);
      }
      if ([pThing isKindOfClass:[UIColor class]]) {
        return js_value_UIColor((UIColor*)pThing);
      }
      if ([pThing isKindOfClass:[NSData class]]) {
        return js_value_NSData((NSData*)pThing);
      }
      if ([pThing isKindOfClass:[NSArray class]]) {
        return js_value_NSArray<id>((NSArray*)pThing);
      }
      if ([pThing isKindOfClass:[NSDictionary class]]) {
        return js_value_NSDictionary((NSDictionary*)pThing);
      }
      if ([pThing isKindOfClass:[NSSet class]]) {
        return js_value_NSSet((NSSet*)pThing);
      }
      NJSWrapperMap* wrappers = GetWrapperMap();
      if (wrappers) {
        NJSValue* wrapper = [wrappers findJSWrapperForObject:pThing inContext:JS_ISOLATE()];
        if (wrapper) {
          return [wrapper toJS];
        }
      }
      Local<Value> result(Nan::Undefined());
      Nan::EscapableHandleScope scope;
      Isolate* isolate(Isolate::GetCurrent());
      Local<Context> context(isolate->GetCurrentContext());
      Nan::Persistent<FunctionTemplate>& type(NNSObject::GetNSObjectType(pThing, defaultType));
      Local<FunctionTemplate> fnTemplate(Nan::New(type));
      MaybeLocal<Function> ctorMaybe(fnTemplate->GetFunction(context));
      if (ctorMaybe.IsEmpty()) {
        iOSLog0("GetWrapperFor failed to get constructor");
        return scope.Escape(result);
      }
      auto ctor(ctorMaybe.ToLocalChecked());
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)pThing)
      };
      MaybeLocal<Object> inst(ctor->NewInstance(context, sizeof(argv)/sizeof(argv[0]), argv));
      if (!inst.IsEmpty()) {
        result = Local<Value>::Cast(inst.ToLocalChecked());
      } else {
        iOSLog0("GetWrapperFor failed to get instance");
#if 1
        return scope.Escape(result);
#else
        MaybeLocal<Object> inst(JS_FUNC(defaultType.Get(isolate))->NewInstance(context, sizeof(argv)/sizeof(argv[0]), argv));
        if (!inst.IsEmpty()) {
          result = Local<Value>::Cast(inst.ToLocalChecked());
        } else {
          iOSLog0("GetWrapperFor failed to get default instance");
          return scope.Escape(result);
        }
#endif
      }
      if (wrappers) {
        NJSValue* wrapper = [[NJSValue alloc] initWithValue:result];
        [wrappers setJSWrapperForObject:pThing wrapper:wrapper inContext:isolate];
      }
      return scope.Escape(result);
    }
  }
  
  id GetValueFor(Local<Value> value, bool* failed) {
    if (failed) {
      *failed = false;
    }
    if (value->IsNullOrUndefined()) {
      return nullptr;
    }
    if (JS_INSTANCEOF(value, Nid)) {
      JS_UNWRAPPED_(value, id, result);
      return result;
    }
    if (value->IsExternal()) {
      id result = (__bridge id)(value.As<External>()->Value());
      return result;
    }
    if (value->IsString()) {
      return to_value_NSString(value);
    }
    if (is_value_NSDate(value)) {
      return to_value_NSDate(value);
    }
    if (is_value_NSNumber(value)) {
      return to_value_NSNumber(value);
    }
    if (is_value_UIColor(value)) {
      return to_value_UIColor(value);
    }
    if (is_value_NSData(value)) {
      return to_value_NSData(value);
    }
    if (is_value_NSArray<id>(value)) {
      return to_value_NSArray<id>(value);
    }
    if (is_value_NSDictionary(value)) {
      return to_value_NSDictionary(value);
    }
    if (is_value_NSSet(value)) {
      return to_value_NSSet(value);
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
  bool IsTransform(Local<Value> value) {
    Nan::HandleScope scope;
    if (value->IsObject() && JS_HAS(JS_OBJ(value), JS_STR("elements"))) {
      return IsTransform(JS_OBJ(value)->Get(JS_STR("elements")));
    }
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform = Local<Float32Array>::Cast(value);
      if (xform->Length() >= 16) {
        return true;
      }
      return true;
    } else if (value->IsArray()) {
      Local<Array> xform = Local<Array>::Cast(value);
      for (uint32_t i = 0; i < 16; i++) {
        if (!is_value_float(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform = Local<Float64Array>::Cast(value);
      if (xform->Length() >= 16) {
        return true;
      }
    } else {
      return false;
    }
    return true;
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
  bool IsTransform3(Local<Value> value) {
    Nan::HandleScope scope;
    if (value->IsObject() && JS_HAS(JS_OBJ(value), JS_STR("elements"))) {
      value = JS_OBJ(value)->Get(JS_STR("elements"));
    }
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform = Local<Float32Array>::Cast(value);
      if (xform->Length() >= 9) {
        return true;
      }
      return true;
    } else if (value->IsArray()) {
      Local<Array> xform = Local<Array>::Cast(value);
      for (uint32_t i = 0; i < 9; i++) {
        if (!is_value_float(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform = Local<Float64Array>::Cast(value);
      if (xform->Length() >= 9) {
        return true;
      }
    } else {
      return false;
    }
    return true;
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

  bool SetTransform4x3(simd_float4x3& transform, Local<Value> value) {
    return SetTransform4x3((float*)&transform, value);
  }
  bool IsTransform4x3(Local<Value> value) {
    Nan::HandleScope scope;
    if (value->IsObject() && JS_HAS(JS_OBJ(value), JS_STR("elements"))) {
      value = JS_OBJ(value)->Get(JS_STR("elements"));
    }
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform = Local<Float32Array>::Cast(value);
      if (xform->Length() >= 4*3) {
        return true;
      }
      return true;
    } else if (value->IsArray()) {
      Local<Array> xform = Local<Array>::Cast(value);
      for (uint32_t i = 0; i < 4*3; i++) {
        if (!is_value_float(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform = Local<Float64Array>::Cast(value);
      if (xform->Length() >= 4*3) {
        return true;
      }
    } else {
      return false;
    }
    return true;
  }
  bool SetTransform4x3(float* matrix, Local<Value> value) {
    Nan::HandleScope scope;
    if (value->IsObject() && JS_HAS(JS_OBJ(value), JS_STR("elements"))) {
      value = JS_OBJ(value)->Get(JS_STR("elements"));
    }
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform = Local<Float32Array>::Cast(value);
      for (uint32_t i = 0; i < 4*3; i++) {
        matrix[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform = Local<Array>::Cast(value);
      for (uint32_t i = 0; i < 4*3; i++) {
        matrix[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform = Local<Float64Array>::Cast(value);
      for (uint32_t i = 0; i < 4*3; i++) {
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
  bool IsQuaternion(Local<Value> value) {
    const int size = 4;
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform(Local<Float32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_float(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform(Local<Float64Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsObject()) {
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("y")))) {
        return false;
      }
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("z")))) {
        return false;
      }
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("w")))) {
        return false;
      }
      return true;
    }
    return false;
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

  bool SetVector1(simd_float1& quat, Local<Value> value) {
    return SetVector1((float*)&quat, value);
  }
  bool IsVector1(Local<Value> value) {
    const int size = 1;
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform(Local<Float32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_float(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform(Local<Float64Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsObject()) {
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector1(float* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 1;
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform(Local<Float32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform(Local<Float64Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
    } else {
      return false;
    }
    return true;
  }

  bool SetVector2(simd_float2& quat, Local<Value> value) {
    return SetVector2((float*)&quat, value);
  }
  bool IsVector2(Local<Value> value) {
    const int size = 2;
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform(Local<Float32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_float(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform(Local<Float64Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsObject()) {
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("y")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector2(float* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 2;
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform(Local<Float32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform(Local<Float64Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
      elements[1] = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")));
    } else {
      return false;
    }
    return true;
  }
  
  bool SetVector3(simd_float3& quat, Local<Value> value) {
    return SetVector3((float*)&quat, value);
  }
  bool IsVector3(Local<Value> value) {
    const int size = 3;
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform(Local<Float32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_float(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform(Local<Float64Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsObject()) {
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("y")))) {
        return false;
      }
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("z")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector3(float* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 3;
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform(Local<Float32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform(Local<Float64Array>::Cast(value));
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
  
  bool SetVector4(simd_float3& quat, Local<Value> value) {
    return SetVector4((float*)&quat, value);
  }
  bool IsVector4(Local<Value> value) {
    const int size = 4;
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform(Local<Float32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_float(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform(Local<Float64Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsObject()) {
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("y")))) {
        return false;
      }
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("z")))) {
        return false;
      }
      if (!is_value_float(JS_OBJ(value)->Get(JS_STR("w")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector4(float* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 4;
    if (value->IsFloat32Array()) {
      Local<Float32Array> xform(Local<Float32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = TO_FLOAT(xform->Get(i));
      }
    } else if (value->IsFloat64Array()) {
      Local<Float64Array> xform(Local<Float64Array>::Cast(value));
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
}

namespace sweetiekit
{
  bool SetVector1i(simd_int1& xyzw, Local<Value> value) {
    return SetVector1i((int32_t*)&xyzw, value);
  }
  bool IsVector1i(Local<Value> value) {
    const int size = 1;
    if (value->IsInt32Array()) {
      Local<Int32Array> xform(Local<Int32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_int32_t(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsObject()) {
      if (!is_value_int32_t(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector1i(int32_t* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 1;
    if (value->IsInt32Array()) {
      Local<Int32Array> xform(Local<Int32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_int32_t(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_int32_t(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = to_value_int32_t(JS_OBJ(value)->Get(JS_STR("x")));
    } else {
      return false;
    }
    return true;
  }

  bool SetVector2i(simd_int2& xyzw, Local<Value> value) {
    return SetVector2i((int32_t*)&xyzw, value);
  }
  bool IsVector2i(Local<Value> value) {
    const int size = 2;
    if (value->IsInt32Array()) {
      Local<Int32Array> xform(Local<Int32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_int32_t(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsObject()) {
      if (!is_value_int32_t(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      if (!is_value_int32_t(JS_OBJ(value)->Get(JS_STR("y")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector2i(int32_t* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 2;
    if (value->IsInt32Array()) {
      Local<Int32Array> xform(Local<Int32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_int32_t(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_int32_t(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = to_value_int32_t(JS_OBJ(value)->Get(JS_STR("x")));
      elements[1] = to_value_int32_t(JS_OBJ(value)->Get(JS_STR("y")));
    } else {
      return false;
    }
    return true;
  }
  
  bool SetVector3i(simd_int3& xyzw, Local<Value> value) {
    return SetVector3i((int32_t*)&xyzw, value);
  }
  bool IsVector3i(Local<Value> value) {
    const int size = 3;
    if (value->IsInt32Array()) {
      Local<Int32Array> xform(Local<Int32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_int32_t(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsObject()) {
      if (!is_value_int32_t(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      if (!is_value_int32_t(JS_OBJ(value)->Get(JS_STR("y")))) {
        return false;
      }
      if (!is_value_int32_t(JS_OBJ(value)->Get(JS_STR("z")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector3i(int32_t* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 3;
    if (value->IsInt32Array()) {
      Local<Int32Array> xform(Local<Int32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_int32_t(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_int32_t(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = to_value_int32_t(JS_OBJ(value)->Get(JS_STR("x")));
      elements[1] = to_value_int32_t(JS_OBJ(value)->Get(JS_STR("y")));
      elements[2] = to_value_int32_t(JS_OBJ(value)->Get(JS_STR("z")));
    } else {
      return false;
    }
    return true;
  }
  
  bool SetVector4i(simd_int3& xyzw, Local<Value> value) {
    return SetVector4i((int32_t*)&xyzw, value);
  }
  bool IsVector4i(Local<Value> value) {
    const int size = 4;
    if (value->IsInt32Array()) {
      Local<Int32Array> xform(Local<Int32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_int32_t(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsObject()) {
      if (!is_value_int32_t(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      if (!is_value_int32_t(JS_OBJ(value)->Get(JS_STR("y")))) {
        return false;
      }
      if (!is_value_int32_t(JS_OBJ(value)->Get(JS_STR("z")))) {
        return false;
      }
      if (!is_value_int32_t(JS_OBJ(value)->Get(JS_STR("w")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector4i(int32_t* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 4;
    if (value->IsInt32Array()) {
      Local<Int32Array> xform(Local<Int32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_int32_t(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_int32_t(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = to_value_int32_t(JS_OBJ(value)->Get(JS_STR("x")));
      elements[1] = to_value_int32_t(JS_OBJ(value)->Get(JS_STR("y")));
      elements[2] = to_value_int32_t(JS_OBJ(value)->Get(JS_STR("z")));
      elements[3] = to_value_int32_t(JS_OBJ(value)->Get(JS_STR("w")));
    } else {
      return false;
    }
    return true;
  }
}

namespace sweetiekit
{
  bool SetVector1u(simd_uint1& xyzw, Local<Value> value) {
    return SetVector1u((uint32_t*)&xyzw, value);
  }
  bool IsVector1u(Local<Value> value) {
    const int size = 1;
    if (value->IsUint32Array()) {
      Local<Uint32Array> xform(Local<Uint32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_uint32_t(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsObject()) {
      if (!is_value_uint32_t(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector1u(uint32_t* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 1;
    if (value->IsUint32Array()) {
      Local<Uint32Array> xform(Local<Uint32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_uint32_t(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_uint32_t(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = to_value_uint32_t(JS_OBJ(value)->Get(JS_STR("x")));
    } else {
      return false;
    }
    return true;
  }

  bool SetVector2u(simd_uint2& xyzw, Local<Value> value) {
    return SetVector2u((uint32_t*)&xyzw, value);
  }
  bool IsVector2u(Local<Value> value) {
    const int size = 2;
    if (value->IsUint32Array()) {
      Local<Uint32Array> xform(Local<Uint32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_uint32_t(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsObject()) {
      if (!is_value_uint32_t(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      if (!is_value_uint32_t(JS_OBJ(value)->Get(JS_STR("y")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector2u(uint32_t* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 2;
    if (value->IsUint32Array()) {
      Local<Uint32Array> xform(Local<Uint32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_uint32_t(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_uint32_t(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = to_value_uint32_t(JS_OBJ(value)->Get(JS_STR("x")));
      elements[1] = to_value_uint32_t(JS_OBJ(value)->Get(JS_STR("y")));
    } else {
      return false;
    }
    return true;
  }
  
  bool SetVector3u(simd_uint3& xyzw, Local<Value> value) {
    return SetVector3u((uint32_t*)&xyzw, value);
  }
  bool IsVector3u(Local<Value> value) {
    const int size = 3;
    if (value->IsUint32Array()) {
      Local<Uint32Array> xform(Local<Uint32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_uint32_t(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsObject()) {
      if (!is_value_uint32_t(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      if (!is_value_uint32_t(JS_OBJ(value)->Get(JS_STR("y")))) {
        return false;
      }
      if (!is_value_uint32_t(JS_OBJ(value)->Get(JS_STR("z")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector3u(uint32_t* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 3;
    if (value->IsUint32Array()) {
      Local<Uint32Array> xform(Local<Uint32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_uint32_t(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_uint32_t(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = to_value_uint32_t(JS_OBJ(value)->Get(JS_STR("x")));
      elements[1] = to_value_uint32_t(JS_OBJ(value)->Get(JS_STR("y")));
      elements[2] = to_value_uint32_t(JS_OBJ(value)->Get(JS_STR("z")));
    } else {
      return false;
    }
    return true;
  }
  
  bool SetVector4u(simd_uint3& xyzw, Local<Value> value) {
    return SetVector4u((uint32_t*)&xyzw, value);
  }
  bool IsVector4u(Local<Value> value) {
    const int size = 4;
    if (value->IsUint32Array()) {
      Local<Uint32Array> xform(Local<Uint32Array>::Cast(value));
      if (xform->Length() >= size) {
        return true;
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        if (!is_value_uint32_t(xform->Get(i))) {
          return false;
        }
      }
      return true;
    } else if (value->IsObject()) {
      if (!is_value_uint32_t(JS_OBJ(value)->Get(JS_STR("x")))) {
        return false;
      }
      if (!is_value_uint32_t(JS_OBJ(value)->Get(JS_STR("y")))) {
        return false;
      }
      if (!is_value_uint32_t(JS_OBJ(value)->Get(JS_STR("z")))) {
        return false;
      }
      if (!is_value_uint32_t(JS_OBJ(value)->Get(JS_STR("w")))) {
        return false;
      }
      return true;
    }
    return false;
  }
  bool SetVector4u(uint32_t* elements, Local<Value> value) {
    Nan::HandleScope scope;
    const int size = 4;
    if (value->IsUint32Array()) {
      Local<Uint32Array> xform(Local<Uint32Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_uint32_t(xform->Get(i));
      }
    } else if (value->IsArray()) {
      Local<Array> xform(Local<Array>::Cast(value));
      for (uint32_t i = 0; i < size; i++) {
        elements[i] = to_value_uint32_t(xform->Get(i));
      }
    } else if (value->IsObject()) {
      elements[0] = to_value_uint32_t(JS_OBJ(value)->Get(JS_STR("x")));
      elements[1] = to_value_uint32_t(JS_OBJ(value)->Get(JS_STR("y")));
      elements[2] = to_value_uint32_t(JS_OBJ(value)->Get(JS_STR("z")));
      elements[3] = to_value_uint32_t(JS_OBJ(value)->Get(JS_STR("w")));
    } else {
      return false;
    }
    return true;
  }
}

namespace sweetiekit
{
  Local<Value>
  CreateArrayBufferFromPointerLength(const void* _Nonnull bytes, size_t length)
  {
    Local<ArrayBuffer> result = ArrayBuffer::New(JS_ISOLATE(), length);
    memcpy(result->GetContents().Data(), bytes, length);
    return result;
  }
}

Local<Value>
js_value_ArrayBuffer(const void* _Nonnull bytes, size_t length)
{
  return sweetiekit::CreateArrayBufferFromPointerLength(bytes, length);
}

@implementation SweetJSFunction
- (sweetiekit::JSFunction *)jsFunction {
  return &_jsFunction;
}
@end

Local<Value>
js_value_NSDate(NSDate* _Nullable value)
{
  if (!value) {
    return Nan::Undefined();
  }
  double milliseconds = 1000.0 * [value timeIntervalSince1970];
  return Nan::New<Date>(milliseconds).ToLocalChecked();
}

NSDate* _Nullable
to_value_NSDate(const Local<Value>& value, bool* _Nullable failed)
{
  if (failed) {
    *failed = false;
  }
  
  if (value->IsNullOrUndefined()) {
  } else if (value->IsDate()) {
    double milliseconds = value->NumberValue(JS_CONTEXT()).FromJust();
    return [[NSDate alloc] initWithTimeIntervalSince1970:(milliseconds / 1000.0)];
  } else if (failed) {
    *failed = true;
  } else {
    Nan::ThrowError("Expected NSDate");
  }
  return nil;
}

bool
is_value_NSDate(const Local<Value>& value)
{
  return value->IsDate();
}

Local<Value>
js_value_NSTimeInterval(const NSTimeInterval& value)
{
  return JS_NUM(value);
}

NSTimeInterval
to_value_NSTimeInterval(const Local<Value>& value, bool* _Nullable failed)
{
  if (failed) {
    *failed = false;
  }
  
  if (value->IsNumber()) {
    double seconds = TO_DOUBLE(value);
    return seconds;
  } else if (failed) {
    *failed = true;
  } else {
    Nan::ThrowError("Expected NSTimeInterval");
  }
  return 0.0;
}

bool is_value_NSTimeInterval(const Local<Value>& value)
{
  return value->IsNumber();
}

Local<Value> js_value_simd_quatf(const simd_quatf& value) {
  return createTypedArray<Float32Array>(4, (const float*)&value);
}

Local<Value> js_value_simd_float1(const simd_float1& value) {
  return createTypedArray<Float32Array>(1, (const float*)&value);
}

Local<Value> js_value_simd_float2(const simd_float2& value) {
  return createTypedArray<Float32Array>(2, (const float*)&value);
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

Local<Value> js_value_simd_float4x3(const simd_float4x3& value) {
  return createTypedArray<Float32Array>(4*3, (const float*)&value);
}

Local<Value> js_value_simd_float4x4(const simd_float4x4& value) {
  return createTypedArray<Float32Array>(16, (const float*)&value);
}

simd_quatf    to_value_simd_quatf(const Local<Value>& value, bool * _Nullable failed) {
  simd_quatf result = { { 0, 0, 0, 1 } };
  bool ok = sweetiekit::SetQuaternion((float*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_quatf");
  }
  return result;
}

simd_float1   to_value_simd_float1(const Local<Value>& value, bool * _Nullable failed) {
  simd_float1 result = { 0 };
  bool ok = sweetiekit::SetVector1((float*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_float1");
  }
  return result;
}

simd_float2   to_value_simd_float2(const Local<Value>& value, bool * _Nullable failed) {
  simd_float2 result = { 0, 0 };
  bool ok = sweetiekit::SetVector2((float*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_float2");
  }
  return result;
}

simd_float3   to_value_simd_float3(const Local<Value>& value, bool * _Nullable failed) {
  simd_float3 result = { 0, 0, 0 };
  bool ok = sweetiekit::SetVector3((float*)&result, value);
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
  bool ok = sweetiekit::SetVector4((float*)&result, value);
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

simd_float4x3 to_value_simd_float4x3(const Local<Value>& value, bool * _Nullable failed) {
  simd_float4x3 result = { {
    { 1, 0, 0 },
    { 0, 1, 0 },
    { 0, 0, 1 },
    { 0, 0, 0 },
  } };
  bool ok = sweetiekit::SetTransform4x3(result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_float4x4");
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

bool  is_value_simd_quatf(const Local<Value>& value) {
  return sweetiekit::IsQuaternion(value);
}

bool  is_value_simd_float1(const Local<Value>& value) {
  return sweetiekit::IsVector1(value);
}

bool  is_value_simd_float2(const Local<Value>& value) {
  return sweetiekit::IsVector2(value);
}

bool  is_value_simd_float3(const Local<Value>& value) {
  return sweetiekit::IsVector3(value);
}

bool  is_value_simd_float4(const Local<Value>& value) {
  return sweetiekit::IsVector4(value);
}

bool  is_value_simd_float3x3(const Local<Value>& value) {
  return sweetiekit::IsTransform3(value);
}

bool  is_value_simd_float4x3(const Local<Value>& value) {
  return sweetiekit::IsTransform4x3(value);
}

bool  is_value_simd_float4x4(const Local<Value>& value) {
  return sweetiekit::IsTransform(value);
}



Local<Value> js_value_simd_int1(const simd_int1& value) {
  return createTypedArray<Int32Array>(1, (const int*)&value);
}

Local<Value> js_value_simd_int2(const simd_int2& value) {
  return createTypedArray<Int32Array>(2, (const int*)&value);
}

Local<Value> js_value_simd_int3(const simd_int3& value) {
  return createTypedArray<Int32Array>(3, (const int*)&value);
}

Local<Value> js_value_simd_int4(const simd_int4& value) {
  return createTypedArray<Int32Array>(4, (const int*)&value);
}

simd_int1   to_value_simd_int1(const Local<Value>& value, bool * _Nullable failed) {
  simd_int1 result = { 0 };
  bool ok = sweetiekit::SetVector1i((int32_t*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_int1");
  }
  return result;
}

simd_int2   to_value_simd_int2(const Local<Value>& value, bool * _Nullable failed) {
  simd_int2 result = { 0, 0 };
  bool ok = sweetiekit::SetVector2i((int32_t*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_int2");
  }
  return result;
}

simd_int3   to_value_simd_int3(const Local<Value>& value, bool * _Nullable failed) {
  simd_int3 result = { 0, 0, 0 };
  bool ok = sweetiekit::SetVector3i((int32_t*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_int3");
  }
  return result;
}

simd_int4   to_value_simd_int4(const Local<Value>& value, bool * _Nullable failed) {
  simd_int4 result = { 0, 0, 0, 1 };
  bool ok = sweetiekit::SetVector4i((int32_t*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_int4");
  }
  return result;
}

bool  is_value_simd_int1(const Local<Value>& value) {
  return sweetiekit::IsVector1i(value);
}

bool  is_value_simd_int2(const Local<Value>& value) {
  return sweetiekit::IsVector2i(value);
}

bool  is_value_simd_int3(const Local<Value>& value) {
  return sweetiekit::IsVector3i(value);
}

bool  is_value_simd_int4(const Local<Value>& value) {
  return sweetiekit::IsVector4i(value);
}



Local<Value> js_value_simd_uint1(const simd_uint1& value) {
  return createTypedArray<Uint32Array>(1, (const uint32_t*)&value);
}

Local<Value> js_value_simd_uint2(const simd_uint2& value) {
  return createTypedArray<Uint32Array>(2, (const uint32_t*)&value);
}

Local<Value> js_value_simd_uint3(const simd_uint3& value) {
  return createTypedArray<Uint32Array>(3, (const uint32_t*)&value);
}

Local<Value> js_value_simd_uint4(const simd_uint4& value) {
  return createTypedArray<Uint32Array>(4, (const uint32_t*)&value);
}

simd_uint1   to_value_simd_uint1(const Local<Value>& value, bool * _Nullable failed) {
  simd_uint1 result = { 0 };
  bool ok = sweetiekit::SetVector1u((uint32_t*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_uint1");
  }
  return result;
}

simd_uint2   to_value_simd_uint2(const Local<Value>& value, bool * _Nullable failed) {
  simd_uint2 result = { 0, 0 };
  bool ok = sweetiekit::SetVector2u((uint32_t*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_uint2");
  }
  return result;
}

simd_uint3   to_value_simd_uint3(const Local<Value>& value, bool * _Nullable failed) {
  simd_uint3 result = { 0, 0, 0 };
  bool ok = sweetiekit::SetVector3u((uint32_t*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_uint3");
  }
  return result;
}

simd_uint4   to_value_simd_uint4(const Local<Value>& value, bool * _Nullable failed) {
  simd_uint4 result = { 0, 0, 0, 1 };
  bool ok = sweetiekit::SetVector4u((uint32_t*)&result, value);
  if (failed) {
    *failed = ok;
  }
  else if (!ok) {
    Nan::ThrowError("Expected simd_uint4");
  }
  return result;
}

bool  is_value_simd_uint1(const Local<Value>& value) {
  return sweetiekit::IsVector1u(value);
}

bool  is_value_simd_uint2(const Local<Value>& value) {
  return sweetiekit::IsVector2u(value);
}

bool  is_value_simd_uint3(const Local<Value>& value) {
  return sweetiekit::IsVector3u(value);
}

bool  is_value_simd_uint4(const Local<Value>& value) {
  return sweetiekit::IsVector4u(value);
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

bool is_value_SCNQuaternion(const Local<Value>& value) {
  return sweetiekit::IsVector4(value);
}

bool is_value_SCNVector3(const Local<Value>& value) {
  return sweetiekit::IsVector3(value);
}

bool is_value_SCNVector4(const Local<Value>& value) {
  return sweetiekit::IsVector4(value);
}

bool is_value_SCNMatrix4(const Local<Value>& value) {
  return sweetiekit::IsTransform(value);
}

Local<Value> js_value_CATransform3D(const CATransform3D& value) {
  return createTypedArray<Float32Array>(16, (const float*)&value);
}

CATransform3D to_value_CATransform3D(const Local<Value>& value, bool * _Nullable failed) {
  CATransform3D result = {
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

bool is_value_CATransform3D(const Local<Value>& value) {
  return sweetiekit::IsTransform(value);
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

bool is_value_CGPoint(const Local<Value>& value) {
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("x"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("y"))->IsNumber()) {
    return false;
  }
  return true;
}

bool is_value_CGVector(const Local<Value>& value) {
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("dx"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("dy"))->IsNumber()) {
    return false;
  }
  return true;
}

bool is_value_CGSize(const Local<Value>& value) {
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("width"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("height"))->IsNumber()) {
    return false;
  }
  return true;
}

bool is_value_CGRect(const Local<Value>& value) {
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("x"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("y"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("width"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("height"))->IsNumber()) {
    return false;
  }
  return true;
}

Local<Value> js_value_CGColorRef(CGColorRef _Nullable color) {
  return sweetiekit::JSObjFromCGColor(color);
}

Local<Value> js_value_CGPathRef(CGPathRef _Nullable value) {
  return sweetiekit::GetWrapperFor((__bridge id)value);
}

Local<Value> js_value_CGContextRef(CGContextRef _Nullable value) {
  return sweetiekit::GetWrapperFor((__bridge id)value);
}

Local<Value> js_value_CGImageRef(CGImageRef _Nullable value) {
  return sweetiekit::GetWrapperFor((__bridge id)value);
}

Local<Value> js_value_CGLayerRef(CGLayerRef _Nullable value) {
  return sweetiekit::GetWrapperFor((__bridge id)value);
}

Local<Value> js_value_CGColorSpaceRef(CGColorSpaceRef _Nullable value) {
  return sweetiekit::GetWrapperFor((__bridge id)value);
}

Local<Value> js_value_CVImageBufferRef(CVImageBufferRef _Nullable value) {
  return sweetiekit::GetWrapperFor((__bridge id)value);
}

Local<Value> js_value_CVPixelBufferRef(CVPixelBufferRef _Nullable value) {
  return sweetiekit::GetWrapperFor((__bridge id)value);
}

Local<Value> js_value_UIColor(UIColor* _Nullable color) {
  return sweetiekit::JSObjFromUIColor(color);
}

CGColorRef _Nullable to_value_CGColorRef(const Local<Value>& value, bool * _Nullable failed) {
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

CGPathRef _Nullable to_value_CGPathRef(const Local<Value>& value, bool * _Nullable failed) {
  id result = sweetiekit::GetValueFor(value, failed);
  if (result && [result isKindOfClass:[UIBezierPath class]]) {
    return [result CGPath];
  }
  return (__bridge CGPathRef)result;
}

CGContextRef _Nullable to_value_CGContextRef(const Local<Value>& value, bool * _Nullable failed) {
  return (__bridge CGContextRef)sweetiekit::GetValueFor(value, failed);
}

CGImageRef _Nullable to_value_CGImageRef(const Local<Value>& value, bool * _Nullable failed) {
  return (__bridge CGImageRef)sweetiekit::GetValueFor(value, failed);
}

CGLayerRef _Nullable to_value_CGLayerRef(const Local<Value>& value, bool * _Nullable failed) {
  return (__bridge CGLayerRef)sweetiekit::GetValueFor(value, failed);
}

CGColorSpaceRef _Nullable to_value_CGColorSpaceRef(const Local<Value>& value, bool * _Nullable failed) {
  return (__bridge CGColorSpaceRef)sweetiekit::GetValueFor(value, failed);
}

CVImageBufferRef _Nullable to_value_CVImageBufferRef(const Local<Value>& value, bool * _Nullable failed) {
  return (__bridge CVImageBufferRef)sweetiekit::GetValueFor(value, failed);
}

CVPixelBufferRef _Nullable to_value_CVPixelBufferRef(const Local<Value>& value, bool * _Nullable failed) {
  return (__bridge CVPixelBufferRef)sweetiekit::GetValueFor(value, failed);
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

bool is_value_UIColor(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("red"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("green"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("blue"))->IsNumber()) {
    return false;
  }
  return true;
}

bool is_value_CGPathRef(const Local<Value>& value)
{
  // TODO: test type.
  return is_value_id(value);
}

bool is_value_CGContextRef(const Local<Value>& value)
{
  // TODO: test type.
  return is_value_id(value);
}

bool is_value_CGImageRef(const Local<Value>& value)
{
  // TODO: test type.
  return is_value_id(value);
}

bool is_value_CGLayerRef(const Local<Value>& value)
{
  // TODO: test type.
  return is_value_id(value);
}

bool is_value_CGColorSpaceRef(const Local<Value>& value)
{
  // TODO: test type.
  return is_value_id(value);
}

bool is_value_CVImageBufferRef(const Local<Value>& value)
{
  // TODO: test type.
  return is_value_id(value);
}

bool is_value_CVPixelBufferRef(const Local<Value>& value)
{
  // TODO: test type.
  return is_value_id(value);
}

Local<Value> js_value_NSRange(const NSRange& value)
{
  Nan::EscapableHandleScope handleScope;

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("location"), js_value_NSUInteger(value.location));
  result->Set(JS_STR("length"), js_value_NSUInteger(value.length));

  return handleScope.Escape(result);
}

NSRange to_value_NSRange(const Local<Value>& value)
{
  NSUInteger loc = to_value_NSUInteger(JS_OBJ(value)->Get(JS_STR("location")));
  NSUInteger len = to_value_NSUInteger(JS_OBJ(value)->Get(JS_STR("length")));
  return NSMakeRange(loc, len);
}

bool is_value_NSRange(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("length"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("location"))->IsNumber()) {
    return false;
  }
  return true;
}

Local<Value> js_value_NSIndexPath(const NSIndexPath* value)
{
  Nan::EscapableHandleScope handleScope;

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("section"), js_value_NSInteger([value section]));
  result->Set(JS_STR("row"), js_value_NSInteger([value row]));

  return handleScope.Escape(result);
}

NSIndexPath* to_value_NSIndexPath(const Local<Value>& value, bool* _Nullable failed)
{
  if (failed) {
    *failed = false;
  }

  if (!is_value_NSIndexPath(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected NSIndexPath");
    }
    return nil;
  }

  NSInteger section = to_value_NSInteger(JS_OBJ(value)->Get(JS_STR("section")));
  NSInteger row = to_value_NSInteger(JS_OBJ(value)->Get(JS_STR("row")));
  return [NSIndexPath indexPathForRow:row inSection:section];
}

bool is_value_NSIndexPath(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!is_value_NSInteger(obj->Get(JS_STR("section")))) {
    return false;
  }
  if (!is_value_NSInteger(obj->Get(JS_STR("row")))) {
    return false;
  }
  return true;
}

Local<Value> js_value_NSData(NSData* _Nullable data)
{
  if (!data) {
    return Nan::Undefined();
  }

  NSUInteger length = [data length];
  const void* bytes = [data bytes];

  Local<ArrayBuffer> result = ArrayBuffer::New(Isolate::GetCurrent(), length);
  memcpy(result->GetContents().Data(), bytes, length);
  return result;
}

NSData* _Nullable to_value_NSData(const Local<Value>& value, bool * _Nullable failed)
{
  if (failed) {
    *failed = false;
  }
  
  if (!is_value_NSData(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected NSData");
    }
    return nil;
  }
  
  Local<ArrayBuffer> buffer(value.As<ArrayBuffer>());
  NSUInteger length = buffer->GetContents().ByteLength();
  const void* bytes = buffer->GetContents().Data();
  NSData* result = [NSData dataWithBytes:bytes length:length];
  return result;
}

bool is_value_NSData(const Local<Value>& value)
{
  return value->IsArrayBuffer(); // unsure about this
}

bool is_value_CGAffineTransform(const Local<Value>& value)
{
  if (!value->IsArray()) {
    return false;
  }
  Local<Array> array(value.As<Array>());
  if (array->Length() != 6) {
    return false;
  }
  for (uint32_t i = 0; i < 6; i++) {
    if (!array->Get(i)->IsNumber()) {
      return false;
    }
  }
  return true;
}





/*
typedef struct UIEdgeInsets {
    CGFloat top, left, bottom, right;  // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
} UIEdgeInsets;
*/
Local<Value> js_value_UIEdgeInsets(const UIEdgeInsets& value)
{
  Nan::EscapableHandleScope handleScope;

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("top"), js_value_CGFloat(value.top));
  result->Set(JS_STR("left"), js_value_CGFloat(value.left));
  result->Set(JS_STR("bottom"), js_value_CGFloat(value.bottom));
  result->Set(JS_STR("right"), js_value_CGFloat(value.right));

  return handleScope.Escape(result);
}

UIEdgeInsets to_value_UIEdgeInsets(const Local<Value>& value)
{
  CGFloat top = to_value_CGFloat(JS_OBJ(value)->Get(JS_STR("top")));
  CGFloat left = to_value_CGFloat(JS_OBJ(value)->Get(JS_STR("left")));
  CGFloat bottom = to_value_CGFloat(JS_OBJ(value)->Get(JS_STR("bottom")));
  CGFloat right = to_value_CGFloat(JS_OBJ(value)->Get(JS_STR("right")));
  return UIEdgeInsetsMake(top, left, bottom, right);
}

bool is_value_UIEdgeInsets(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("top"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("left"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("bottom"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("right"))->IsNumber()) {
    return false;
  }
  return true;
}

/* Specifically for use in methods and functions supporting user interface layout direction
 */
/*
typedef struct NSDirectionalEdgeInsets {
    CGFloat top, leading, bottom, trailing;  // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
} NSDirectionalEdgeInsets API_AVAILABLE(ios(11.0),tvos(11.0),watchos(4.0));
*/
Local<Value> js_value_NSDirectionalEdgeInsets(const NSDirectionalEdgeInsets& value)
{
  Nan::EscapableHandleScope handleScope;

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("top"), js_value_CGFloat(value.top));
  result->Set(JS_STR("leading"), js_value_CGFloat(value.leading));
  result->Set(JS_STR("bottom"), js_value_CGFloat(value.bottom));
  result->Set(JS_STR("trailing"), js_value_CGFloat(value.trailing));

  return handleScope.Escape(result);
}

NSDirectionalEdgeInsets to_value_NSDirectionalEdgeInsets(const Local<Value>& value)
{
  CGFloat top = to_value_CGFloat(JS_OBJ(value)->Get(JS_STR("top")));
  CGFloat leading = to_value_CGFloat(JS_OBJ(value)->Get(JS_STR("leading")));
  CGFloat bottom = to_value_CGFloat(JS_OBJ(value)->Get(JS_STR("bottom")));
  CGFloat trailing = to_value_CGFloat(JS_OBJ(value)->Get(JS_STR("trailing")));
  return NSDirectionalEdgeInsetsMake(top, leading, bottom, trailing);
}

bool is_value_NSDirectionalEdgeInsets(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("top"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("leading"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("bottom"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("trailing"))->IsNumber()) {
    return false;
  }
  return true;
}

/*
typedef struct UIOffset {
    CGFloat horizontal, vertical; // specify amount to offset a position, positive for right or down, negative for left or up
} UIOffset;
*/
Local<Value> js_value_UIOffset(const UIOffset& value)
{
  Nan::EscapableHandleScope handleScope;

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("horizontal"), js_value_CGFloat(value.horizontal));
  result->Set(JS_STR("vertical"), js_value_CGFloat(value.vertical));

  return handleScope.Escape(result);
}

UIOffset to_value_UIOffset(const Local<Value>& value)
{
  CGFloat horizontal = to_value_CGFloat(JS_OBJ(value)->Get(JS_STR("horizontal")));
  CGFloat vertical = to_value_CGFloat(JS_OBJ(value)->Get(JS_STR("vertical")));
  return UIOffsetMake(horizontal, vertical);
}

bool is_value_UIOffset(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("horizontal"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("vertical"))->IsNumber()) {
    return false;
  }
  return true;
}

Local<Value> js_value_SEL(id _Nullable value) {
  return sweetiekit::GetWrapperFor(value);
}

Local<Value> js_value_SEL(SEL _Nullable value) {
  @autoreleasepool {
    return js_value_NSString(NSStringFromSelector(value));
  }
}

SEL _Nullable to_value_SEL(Local<Value> value, bool* _Nullable failed) {
  @autoreleasepool {
    if (!is_value_SEL(value)) {
      if (failed) {
        *failed = true;
      } else {
        Nan::ThrowError("to_value_SEL failed");
        return nil;
      }
    }
    
    NSString* selectorName = to_value_NSString(value);
    if (selectorName) {
      SEL action = NSSelectorFromString(selectorName);
      if (!action) {
        if (failed) {
          *failed = true;
        } else {
          Nan::ThrowError("to_value_SEL: NSSelectorFromString returned nil");
        }
        return nil;
      }
      return action;
    }
  }
  if (failed) {
    *failed = true;
  } else {
    Nan::ThrowError("to_value_SEL: nil result");
  }
  return nil;
}

bool is_value_SEL(Local<Value> value) {
  return is_value_NSString(value);
}

Local<Value> js_value_id(id _Nullable value) {
  return sweetiekit::GetWrapperFor(value);
}

id _Nullable to_value_id(Local<Value> value, bool* _Nullable failed) {
  return sweetiekit::GetValueFor(value, failed);
}

bool is_value_id(Local<Value> value) {
  bool failed = false;
  sweetiekit::GetValueFor(value, &failed);
  if (failed) {
    return false;
  }
  return true;
}

Local<Value> js_value_NSNumber(NSNumber* _Nullable value)
{
  if (value && value.objCType) {
    switch (value.objCType[0])
    {
    case 'B':
      return JS_BOOL(value.boolValue);
    case 'i':
      return JS_INT(value.intValue);
    case 'I':
      return JS_UINT(value.unsignedIntValue);
    case 'd':
      return JS_NUM(value.doubleValue);
    case 'f':
      return JS_FLOAT(value.floatValue);
    case 'q':
      return JS_INT64(value.longLongValue);
    case 'Q':
      return JS_UINT64(value.unsignedLongLongValue);
    }
  }
  return Nan::Undefined();
}

NSNumber* _Nullable to_value_NSNumber(Local<Value> value, bool* _Nullable failed)
{
  if (failed) {
    *failed = false;
  }
  if (value->IsBoolean()) {
    return [[NSNumber alloc] initWithBool: TO_BOOL(value)];
  }
  if (value->IsInt32()) {
    return [[NSNumber alloc] initWithInt: TO_INT32(value)];
  }
  if (value->IsUint32()) {
    return [[NSNumber alloc] initWithUnsignedInt:TO_UINT32(value)];
  }
  if (IS_INT64(value)) {
    return [[NSNumber alloc] initWithLongLong: TO_INT64(value)];
  }
  if (IS_UINT64(value)) {
    return [[NSNumber alloc] initWithUnsignedLongLong:TO_UINT64(value)];
  }
  if (value->IsNumber()) {
    return [[NSNumber alloc] initWithDouble: TO_DOUBLE(value)];
  }
  if (failed) {
    *failed = true;
    return nullptr;
  } else {
    Nan::ThrowError("to_value_NSNumber: expected a number");
    return nullptr;
  }
}

bool is_value_NSNumber(Local<Value> value)
{
  if (value->IsBoolean()) {
    return true;
  }
  if (value->IsInt32()) {
    return true;
  }
  if (value->IsUint32()) {
    return true;
  }
  if (IS_INT64(value)) {
    return true;
  }
  if (IS_UINT64(value)) {
    return true;
  }
  if (value->IsNumber()) {
    return true;
  }
  return false;
}


extern "C" void dispatch_ui_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  if ([NSThread isMainThread]) {
    {
      v8::Locker locker(JS_ISOLATE());
      Nan::HandleScope scope;
      block();
    }
  } else {
    dispatch_sync(dispatch_get_main_queue(), ^{
      v8::Locker locker(JS_ISOLATE());
      Nan::HandleScope scope;
      block();
    });
  }
}

id Nid::set_self(__weak id self) {
  _self = self;
  if (_self) {
    auto wrappers = sweetiekit::GetWrapperMap();
    if (wrappers) {
      NJSValue* wrapper = [[NJSValue alloc] initWithValue:this->handle()];
      if (wrapper) {
        [wrappers setJSWrapperForObject:_self wrapper:wrapper inContext:JS_ISOLATE()];
      }
    }
  }
  /*
  auto wrapper = objc_getAssociatedObject(obj, [obj associatedObjectKey:@"sweetiekit.type"]);
  if (wrapper == nullptr) {
    Nan::Persistent<FunctionTemplate>** p = new Nan::Persistent<FunctionTemplate>*(&GetDerivedType());
    auto w = [NSObjectWrapper alloc];
    w.ptr = p;
    
    objc_setAssociatedObject(obj, [obj associatedObjectKey:@"sweetiekit.type"], w, objc_AssociationPolicy::OBJC_ASSOCIATION_RETAIN);
    //[_NSObject assignAssociatedWrapperWithPtr:p forKey:@"sweetiekit.type"];
  }*/
  return _self;
}



Local<Value> js_value_NSMutableDictionary(NSMutableDictionary* _Nullable value) {
  if (value == nullptr) {
    return Nan::Undefined();
  } else {
    Nan::EscapableHandleScope scope;
    Local<Map> result(Map::New(JS_ISOLATE()));
    [value enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL * _Nonnull stop) {
      Local<Value> k = js_value_id(key);
      Local<Value> v = js_value_id(obj);
      (void)result->Set(JS_CONTEXT(), k, v);
    }];
    return scope.Escape(result);
  }
}

NSMutableDictionary* _Nullable to_value_NSMutableDictionary(Local<Value> dict, bool* _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  if (dict->IsMap()) {
    Nan::HandleScope();
    Local<Array> value(Local<Map>::Cast(dict)->AsArray());
    auto result = [[NSMutableDictionary alloc] init];
    for (uint32_t i = 0, n = value->Length(); i < n; i += 2) {
      id k = to_value_id(value->Get(i));
      id v = to_value_id(value->Get(i+1));
      [result setObject:v forKey:k];
    }
    return result;
  } else if (failed) {
    *failed = true;
    return nullptr;
  } else {
    Nan::ThrowError("to_value_NSMutableDictionary failed");
    return nullptr;
  }
}

bool is_value_NSMutableDictionary(Local<Value> value) {
  if (!value->IsMap()) {
    return false;
  }
  return true;
}

Local<Value> js_value_NSDictionary(NSDictionary* _Nullable value) {
  if (value == nullptr) {
    return Nan::Undefined();
  } else {
    Nan::EscapableHandleScope scope;
    Local<Map> result(Map::New(JS_ISOLATE()));
    [value enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL * _Nonnull stop) {
      Local<Value> k = js_value_id(key);
      Local<Value> v = js_value_id(obj);
      (void)result->Set(JS_CONTEXT(), k, v);
    }];
    return scope.Escape(result);
  }
}

NSDictionary* _Nullable to_value_NSDictionary(Local<Value> dict, bool* _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  if (dict->IsMap()) {
    Nan::HandleScope scope;
    Local<Array> value(Local<Map>::Cast(dict)->AsArray());
    auto result = [[NSMutableDictionary alloc] init];
    for (uint32_t i = 0, n = value->Length(); i < n; i += 2) {
      id k = to_value_id(value->Get(i));
      id v = to_value_id(value->Get(i+1));
      [result setObject:v forKey:k];
    }
    return result;
  } else if (failed) {
    *failed = true;
    return nullptr;
  } else {
    Nan::ThrowError("to_value_NSDictionary failed");
    return nullptr;
  }
}

bool is_value_NSDictionary(Local<Value> value) {
  if (!value->IsMap()) {
    return false;
  }
  return true;
}

Local<Value> js_value_NSSet(NSSet* _Nullable value) {
  if (value == nullptr) {
    return Nan::Undefined();
  } else {
    Nan::EscapableHandleScope scope;
    Local<Set> result(Set::New(JS_ISOLATE()));
    [value enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
      Local<Value> v = js_value_id(obj);
      (void)result->Add(JS_CONTEXT(), v);
    }];
    return scope.Escape(result);
  }
}

NSSet* _Nullable to_value_NSSet(Local<Value> dict, bool* _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  if (dict->IsSet()) {
    Nan::HandleScope scope;
    Local<Array> value(Local<Set>::Cast(dict)->AsArray());
    auto result = [[NSMutableSet alloc] init];
    for (uint32_t i = 0, n = value->Length(); i < n; i++) {
      id v = to_value_id(value->Get(i));
      [result addObject:v];
    }
    return result;
  } else if (failed) {
    *failed = true;
    return nullptr;
  } else {
    Nan::ThrowError("to_value_NSSet failed");
    return nullptr;
  }
}

bool is_value_NSSet(Local<Value> value) {
  if (!value->IsSet()) {
    return false;
  }
  return true;
}

Local<Value> js_value_NSMutableArray(NSMutableArray* _Nullable value) {
  if (value == nullptr) {
    return Nan::Undefined();
  } else {
    Nan::EscapableHandleScope scope;
    Local<Array> result(Array::New(JS_ISOLATE()));
    [value enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      Local<Value> i(js_value_NSUInteger(idx));
      Local<Value> v(js_value_id(obj));
      result->Set(i, v);
    }];
    return scope.Escape(result);
  }
}

NSMutableArray* _Nullable to_value_NSMutableArray(Local<Value> arr, bool* _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  if (arr->IsArray()) {
    Nan::HandleScope scope;
    Local<Array> value(Local<Array>::Cast(arr));
    auto result = [[NSMutableArray alloc] initWithCapacity:value->Length()];
    for (uint32_t i = 0, n = value->Length(); i < n; i++) {
      id v = to_value_id(value->Get(i));
      [result setObject:v atIndexedSubscript:i];
    }
    return result;
  } else if (failed) {
    *failed = true;
    return nullptr;
  } else {
    Nan::ThrowError("to_value_NSMutableArray failed");
    return nullptr;
  }
}

bool is_value_NSMutableArray(Local<Value> value) {
  if (!value->IsArray()) {
    return false;
  }
  return true;
}

Local<Value> js_value_NSArray(NSArray* _Nullable value) {
  if (value == nullptr) {
    return Nan::Undefined();
  } else {
    Nan::EscapableHandleScope scope;
    Local<Array> result(Array::New(JS_ISOLATE()));
    [value enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      Local<Value> i(js_value_NSUInteger(idx));
      Local<Value> v(js_value_id(obj));
      result->Set(i, v);
    }];
    return scope.Escape(result);
  }
}

NSArray* _Nullable to_value_NSArray(Local<Value> arr, bool* _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  if (arr->IsArray()) {
    Nan::HandleScope scope;
    Local<Array> value(Local<Array>::Cast(arr));
    auto result = [[NSMutableArray alloc] initWithCapacity:value->Length()];
    for (uint32_t i = 0, n = value->Length(); i < n; i++) {
      id v = to_value_id(value->Get(i));
      [result setObject:v atIndexedSubscript:i];
    }
    return result;
  } else if (failed) {
    *failed = true;
    return nullptr;
  } else {
    Nan::ThrowError("to_value_NSArray failed");
    return nullptr;
  }
}

bool is_value_NSArray(Local<Value> value) {
  if (!value->IsArray()) {
    return false;
  }
  return true;
}

Local<Value> js_value_NSArrayOfCGColors(NSArray* _Nullable value) {
  if (value == nullptr) {
    return Nan::Undefined();
  } else {
    Nan::EscapableHandleScope scope;
    Local<Array> result(Array::New(JS_ISOLATE()));
    [value enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      if ([obj isKindOfClass:[UIColor class]]) {
        Local<Value> i(js_value_NSUInteger(idx));
        Local<Value> v(js_value_UIColor(obj));
        result->Set(i, v);
      }
    }];
    return scope.Escape(result);
  }
}

NSArray* _Nullable to_value_NSArrayOfCGColors(Local<Value> arr, bool* _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  if (arr->IsArray()) {
    Nan::HandleScope scope;
    Local<Array> value(Local<Array>::Cast(arr));
    auto result = [[NSMutableArray alloc] initWithCapacity:value->Length()];
    for (uint32_t i = 0, n = value->Length(); i < n; i++) {
      if (is_value_UIColor(value->Get(i))) {
        UIColor* v(to_value_UIColor(value->Get(i)));
        CGColorRef color = [v CGColor];
        [result setObject:(__bridge id)color atIndexedSubscript:i];
      } else {
        if (failed) {
          *failed = true;
          return nil;
        } else {
          Nan::ThrowError("to_value_NSArrayOfCGColors failed: one of the items wasn't a CGColorRef");
          return nil;
        }
      }
    }
    return result;
  } else if (failed) {
    *failed = true;
    return nullptr;
  } else {
    Nan::ThrowError("to_value_NSArray failed");
    return nullptr;
  }
}

bool is_value_NSArrayOfCGColors(Local<Value> value) {
  if (!value->IsArray()) {
    return false;
  }
  // TODO: check each item in the array.
  return true;
}

Local<Value> js_value_boxed(id _Nullable value)
{
  return js_value_boxed(js_value_id(value));
}

Local<Value> js_value_boxed(Local<Value> value)
{
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("value"), value);
  return result;
}

Local<Value> to_value_boxed_value(Local<Value> box, bool* _Nullable failed)
{
  if (failed) {
    *failed = false;
  }
  if (is_value_boxed(box)) {
    Nan::EscapableHandleScope scope;
    Local<Object> jsBox(JS_OBJ(box));
    return scope.Escape(jsBox->Get(JS_STR("value")));
  }
  if (failed) {
    *failed = true;
  } else {
    Nan::ThrowError("to_value_boxed_value failed");
  }
  return Nan::Undefined();
}

id _Nullable to_value_boxed(Local<Object> box, bool* _Nullable failed)
{
  if (failed) {
    *failed = false;
  }
  if (is_value_boxed(box)) {
    Local<Object> jsBox(JS_OBJ(box));
    return to_value_id(jsBox->Get(JS_STR("value")));
  }
  if (failed) {
    *failed = true;
  } else {
    Nan::ThrowError("to_value_boxed_value failed");
  }
  return nil;
}

bool is_value_boxed(Local<Value> value)
{
  if (!value->IsObject()) {
    return false;
  }
  if (!JS_HAS(JS_OBJ(value), JS_STR("value"))) {
    if (JS_OBJ(value)->Get(JS_STR("value"))->IsNullOrUndefined()) {
      return false;
    }
  }
  return true;
}

