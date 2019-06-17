//
//  defines.h
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef defines_h
#define defines_h

#include <v8.h>
#include <nan.h>
#include "main.h"

using namespace v8;
  
#define JS_TODO(...) { Nan::ThrowError("Not implemented"); return __VA_ARGS__; }
#define JS_STR(...) Nan::New<v8::String>(__VA_ARGS__).ToLocalChecked()
#define JS_INT(val) Nan::New<v8::Integer>(static_cast<int32_t>(val))
#define JS_UINT(val) Nan::New<v8::Integer>(static_cast<uint32_t>(val))
#define JS_BYTE(val) Nan::New<v8::Integer>(static_cast<uint8_t>(val))
#define JS_NUM(val) Nan::New<v8::Number>(val)
#define JS_FLOAT(val) Nan::New<v8::Number>(val)
#define JS_BOOL(val) Nan::New<v8::Boolean>(val)
#define JS_OBJ(val) Nan::To<v8::Object>(val).ToLocalChecked()
#define JS_TYPE(name) (Nan::New(name::type)->GetFunction(Isolate::GetCurrent()->GetCurrentContext()).ToLocalChecked())
#define JS_INSTANCEOF(obj, type) ((obj)->InstanceOf(JS_CONTEXT(), JS_TYPE(type)).FromJust())
#define JS_NEW(type, argc, argv) (JS_TYPE(type)->NewInstance(JS_CONTEXT(), argc, argv).FromMaybe<Value>(Nan::Undefined()))
#define JS_NEW_ARGV(type, argv) JS_NEW(type, sizeof(argv)/sizeof(argv[0]), argv)
#define JS_FUNC(x) ((x)->GetFunction(Isolate::GetCurrent()->GetCurrentContext()).ToLocalChecked())
#define JS_WRAPPER(el, ElType) sweetiekit::GetWrapperFor(el, N##ElType::type)

#define JS_ISOLATE() (Isolate::GetCurrent())
#define JS_CONTEXT() (Isolate::GetCurrent()->GetCurrentContext())
#define JS_GLOBAL() (JS_CONTEXT()->Global())
#define JS_HAS(obj, name) (obj)->Has(JS_CONTEXT(), name).FromJust()
#define JS_HAS_STR(obj, name) (obj)->Has(JS_CONTEXT(), JS_STR(name)).FromJust()

#define TO_DOUBLE(x) (Nan::To<double>(x).FromJust())
#define TO_BOOL(x) (Nan::To<bool>(x).FromJust())
#define TO_BYTE(x) static_cast<uint8_t>(Nan::To<unsigned int>(x).FromJust())
#define TO_UINT32(x) (Nan::To<unsigned int>(x).FromJust())
#define TO_INT32(x) (Nan::To<int>(x).FromJust())
#define TO_FLOAT(x) static_cast<float>((Nan::To<double>(x).FromJust()))
#define TO_FUNC(x) (Nan::To<Function>(x).ToLocalChecked())

#define IS_OBJ(x) x->IsObject()
#define IS_EXT(x) x->IsExternal()
#define IS_BYTE(x) ((x)->IsUint32() && (TO_UINT32(x) <= 255))

#define JS_PANIC(fmt, ...) \
  { \
    char js_panic_msg[4096]; \
    snprintf(js_panic_msg, 4096, "%s: " fmt, __PRETTY_FUNCTION__, __VA_ARGS__); \
    Nan::ThrowError(js_panic_msg); \
    return; \
  }

#define js_panic_noreturn(msg) \
  { \
    char js_panic_msg[4096]; \
    snprintf(js_panic_msg, 4096, "%s: %s", __PRETTY_FUNCTION__, msg); \
    Nan::ThrowError(js_panic_msg); \
  }
  
#define js_panic_deprecated() \
    JS_PANIC("deprecated");

template <typename T>
class shared_ptr_release_deleter {
public:
  void operator() (T * _Nullable ptr) {
    // nothing
  }
private:
};

template <typename T> struct V8TypedArrayTraits;
template<> struct V8TypedArrayTraits<Float64Array> { typedef double value_type; };
template<> struct V8TypedArrayTraits<Float32Array> { typedef float value_type; };
template<> struct V8TypedArrayTraits<Int32Array> { typedef int32_t value_type; };
template<> struct V8TypedArrayTraits<Uint32Array> { typedef uint32_t value_type; };
template<> struct V8TypedArrayTraits<Int16Array> { typedef int16_t value_type; };
template<> struct V8TypedArrayTraits<Uint16Array> { typedef uint16_t value_type; };
template<> struct V8TypedArrayTraits<Int8Array> { typedef int8_t value_type; };
template<> struct V8TypedArrayTraits<Uint8Array> { typedef uint8_t value_type; };

template <typename T>
Local<T> createTypedArray(size_t size, const typename V8TypedArrayTraits<T>::value_type* _Nullable data = NULL) {
  size_t byteLength = size * sizeof(typename V8TypedArrayTraits<T>::value_type);
  Local<ArrayBuffer> buffer = ArrayBuffer::New(Isolate::GetCurrent(), byteLength);
  Local<T> result = T::New(buffer, 0, size);
  if (data) {
    for (unsigned int i = 0; i < size; i++) {
      result->Set(i, Nan::New(data[i]));
    }
  }
  return result;
};

template <typename T>
Local<T> createExternalTypedArray(size_t size, size_t stride, const typename V8TypedArrayTraits<T>::value_type* _Nonnull data) {
  size_t byteLength = size * sizeof(typename V8TypedArrayTraits<T>::value_type);
  Local<ArrayBuffer> buffer = ArrayBuffer::New(Isolate::GetCurrent(), (void*)data, byteLength);
  Local<T> result = T::New(buffer, 0, size);
  return result;
};

#include <v8.h>
#include <node.h>
#include <nan.h>
using namespace v8;
using namespace node;

#define JS_SET_RETURN(x) \
  info.GetReturnValue().Set(x)

// forwards arguments to type's constructor.
#define JS_SET_RETURN_NEW(type, info) \
  { \
      std::vector<Local<Value>> argv; \
      for (int i = 0; i < info.Length(); i++) { \
        argv.push_back(info[i]); \
      } \
      JS_SET_RETURN(JS_NEW(N##type, static_cast<int>(argv.size()), &argv[0])); \
  }

#define JS_RECONSTRUCT(type) \
  if (!info.IsConstructCall()) { \
    /* Invoked as plain function, turn into construct call. */ \
    JS_SET_RETURN_NEW(type, info); \
    return; \
  }

#define JS_SET_RETURN_NEW_1(type, arg0) \
  { \
      std::vector<Local<Value>> argv; \
      argv.push_back(arg0); \
      JS_SET_RETURN(JS_NEW(N##type, static_cast<int>(argv.size()), &argv[0])); \
  }
  
#define JS_SET_RETURN_EXTERNAL(type, value) \
{ \
    id JS_RETURN_VALUE(value); \
    JS_SET_RETURN_NEW_1(type, Nan::New<External>((__bridge void*)JS_RETURN_VALUE)); \
}

#define JS_SET_RETURN_NEW_2(type, arg0, arg1) \
  { \
      std::vector<Local<Value>> argv; \
      argv.push_back(arg0); \
      argv.push_back(arg1); \
      JS_SET_RETURN(JS_NEW(N##type, static_cast<int>(argv.size()), &argv[0])); \
  }

#define JS_PROP(name) \
  static NAN_GETTER(name##Getter); \
  static NAN_SETTER(name##Setter)
  
#define JS_PROP_READONLY(name) \
  JS_PROP(name)

#define JS_STATIC_PROP(name) \
  static NAN_GETTER(name##Getter); \
  static NAN_SETTER(name##Setter)
  
#define JS_STATIC_PROP_READONLY(name) \
  JS_PROP(name)

#define JS_METHOD(name) \
  static NAN_METHOD(name)

#define JS_STATIC_METHOD(name) \
  static NAN_METHOD(name)
  
#define JS_UNWRAP_(type, name) \
  auto JS_METHOD_NAME(__FUNCTION__); JS_METHOD_NAME = JS_METHOD_NAME; \
  auto JS_PRETTY_METHOD_NAME(__PRETTY_FUNCTION__); JS_PRETTY_METHOD_NAME = JS_PRETTY_METHOD_NAME; \
  N##type* n##name = ObjectWrap::Unwrap<N##type>(info.This()); n##name = n##name; \
  type name = n##name->self<type>(); name = name;

#define JS_UNWRAP(type, name) \
  auto JS_METHOD_NAME(__FUNCTION__); JS_METHOD_NAME = JS_METHOD_NAME; \
  auto JS_PRETTY_METHOD_NAME(__PRETTY_FUNCTION__); JS_PRETTY_METHOD_NAME = JS_PRETTY_METHOD_NAME; \
  N##type* n##name = ObjectWrap::Unwrap<N##type>(info.This()); n##name = n##name; \
  type* name##_ = n##name->As<type>(); \
  __weak type* name = name##_; name = name;

#define JS_UNWRAP_SWIFT(type, name) \
  auto JS_METHOD_NAME(__FUNCTION__); JS_METHOD_NAME = JS_METHOD_NAME; \
  auto JS_PRETTY_METHOD_NAME(__PRETTY_FUNCTION__); JS_PRETTY_METHOD_NAME = JS_PRETTY_METHOD_NAME; \
  N##type* n##name = ObjectWrap::Unwrap<N##type>(info.This()); n##name = n##name; \
  S##type* name = n##name->As<S##type>(); name = name;
  
#define JS_UNWRAPPED_(info, type, name) \
  N##type* n##name = ObjectWrap::Unwrap<N##type>(JS_OBJ(info)); n##name = n##name; \
  __block type name = n##name->self<type>(); name = name;

#define JS_UNWRAPPED(info, type, name) \
  N##type* n##name = ObjectWrap::Unwrap<N##type>(JS_OBJ(info)); n##name = n##name; \
  __block type* name = n##name->As<type>(); name = name;

#define JS_SET_PROP(proto, jsName, cppName) \
  Nan::SetAccessor(proto, JS_STR(jsName), cppName##Getter, cppName##Setter)

#define JS_SET_PROP_READONLY(proto, jsName, cppName) \
  Nan::SetAccessor(proto, JS_STR(jsName), cppName##Getter)
  
#define JS_ASSIGN_PROP(proto, jsName) \
  Nan::SetAccessor(proto, JS_STR(#jsName), jsName##Getter, jsName##Setter)

#define JS_ASSIGN_PROP_READONLY(proto, jsName) \
  Nan::SetAccessor(proto, JS_STR(#jsName), jsName##Getter)
  
#define JS_SET_METHOD(proto, jsName, cppName) \
  Nan::SetMethod(proto, jsName, cppName)
  
#define JS_ASSIGN_METHOD(proto, jsName) \
  Nan::SetMethod(proto, #jsName, jsName)

#define JS_ASSIGN_PROTO_PROP(jsName)           JS_ASSIGN_PROP(proto, jsName)
#define JS_ASSIGN_PROTO_PROP_READONLY(jsName)  JS_ASSIGN_PROP_READONLY(proto, jsName)
#define JS_ASSIGN_PROTO_METHOD(jsName)         JS_ASSIGN_METHOD(proto, jsName)
#define JS_ASSIGN_PROTO_METHOD_AS(cppName, jsName) JS_SET_METHOD(proto, jsName, cppName)

#define JS_ASSIGN_STATIC_PROP(jsName)           JS_ASSIGN_PROP(JS_OBJ(ctor), jsName)
#define JS_ASSIGN_STATIC_PROP_READONLY(jsName)  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), jsName)
#define JS_ASSIGN_STATIC_METHOD(jsName)         JS_ASSIGN_METHOD(ctor, jsName)
#define JS_ASSIGN_STATIC_METHOD_AS(cppName, jsName) JS_SET_METHOD(ctor, jsName, cppName)

#define JS_ASSIGN_ENUM(name, type) \
  exports->Set(JS_STR(#name), js_value_##type(name))

#define JS_ASSIGN_VALUE(name) \
  JS_ASSIGN_ENUM(name, id)

#define JS_GETTER(ElType, el, jsName, ...) \
NAN_GETTER(N##ElType::jsName##Getter) { \
  Nan::HandleScope scope; \
  JS_UNWRAP(ElType, el); \
  @autoreleasepool { \
    __VA_ARGS__; \
  } \
}

#define JS_SETTER(ElType, el, jsName, ...) \
NAN_SETTER(N##ElType::jsName##Setter) { \
  Nan::HandleScope scope; \
  JS_UNWRAP(ElType, el); \
  @autoreleasepool { \
    __VA_ARGS__; \
  } \
}

#define JS_WRAP_CLASS(name, base) \
\
class N##name : public N##base { \
public: \
  N##name(); \
  ~N##name(); \
 \
  static Nan::Persistent<FunctionTemplate> type; \
  virtual Nan::Persistent<FunctionTemplate>& GetDerivedType() { return type; } \
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate, Local<Object> exports); \
  static NAN_METHOD(New);
  
  
#define JS_WRAP_CLASS_END(name) \
};

#define JS_ATTACH_FUNCTION(jsValue, objcValue, keyName) \
  { \
    SweetJSFunction* func = [[SweetJSFunction alloc] init]; \
    [func jsFunction]->Reset(jsValue); \
    [objcValue associateValue:func withKey:keyName]; \
  }

#define JS_INIT_CLASS(name, base) \
  JS_INIT_CLASS_BASE(name, ctorSpec->Inherit(Nan::New(N##base::type)))

#define JS_INIT_CLASS_BASE(name, ...) \
\
Nan::Persistent<FunctionTemplate> N##name::type; \
\
std::pair<Local<Object>, Local<FunctionTemplate>> N##name::Initialize(Isolate *isolate, Local<Object> exports) \
{ \
  Nan::EscapableHandleScope scope; \
\
  /* constructor */ \
  Local<FunctionTemplate> ctorSpec = Nan::New<FunctionTemplate>(New); \
  ctorSpec->InstanceTemplate()->SetInternalFieldCount(1); \
  ctorSpec->SetClassName(JS_STR(#name)); \
  __VA_ARGS__; \
  Local<Function> ctor(Nan::GetFunction(ctorSpec).ToLocalChecked()); \
  auto result(std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctor), ctorSpec)); \
\
  /* prototype */ \
  MaybeLocal<Value> proto_m = ctor->Get(JS_CONTEXT(), JS_STR("prototype")); \
  if (proto_m.IsEmpty()) { \
    js_panic_noreturn("Constructor prototype gave an internal error"); \
    return result; \
  } \
  Local<Value> proto_v(proto_m.ToLocalChecked()); \
  if (!proto_v->IsObject()) { \
    js_panic_noreturn("Constructor prototype isn't an object"); \
    return result; \
  } \
  Local<Object> proto(JS_OBJ(proto_v))

#define JS_INIT_CTOR(name, base) \
  { }; 

#define JS_INIT_CLASS_END(name, base) \
  type.Reset(ctorSpec); \
  return result; \
}
  
#define JS_GET_FUNCTION(varName, objc, keyName) \
  auto& varName = *[(SweetJSFunction*)[objc associatedValueForKey:keyName] jsFunction];

#include <array>
#include <deque>
#include <mutex>
#include <thread>

namespace sweetiekit {
  extern uv_sem_t resSem;
  extern uv_sem_t reqSem;
  extern uv_async_t resAsync;
  extern std::mutex reqMutex;
  extern std::mutex resMutex;
  extern std::deque<std::function<void()>> reqCbs;
  extern std::deque<std::function<void()>> resCbs;
  extern std::thread reqThead;

  void RunResInMainThread(uv_async_t * _Nonnull handle);
  void Resolve(Nan::Persistent<Function>* _Nullable cb, bool shouldDelete = false);
  
  Local<Value> CallSync(Local<Function> cb, const char* _Nonnull methodName, int argc, Local<Value>* _Nullable argv);
  
  void CallAsync(Nan::Global<Function>& cb, const char* _Nonnull methodName);
  void Kick();
  uint64_t nodeTick();
  void nodePump(Isolate* _Nonnull isolate);
}

struct Block_layout {
    void * _Nonnull isa;
    int flags;
    int reserved;
    void (* _Nonnull invoke)(void * _Nonnull, ...);
    struct Block_descriptor * _Nonnull descriptor;
};

typedef const Nan::FunctionCallbackInfo<v8::Value> & JSInfo;
typedef std::vector<Local<Value>> JSArgs;
namespace sweetiekit {
  typedef void (^BlockFunctionCallback)(JSInfo info);

  static Local<Function> FromBlock(const char* _Nonnull name, BlockFunctionCallback _Nonnull block) {
   Nan::EscapableHandleScope handleScope;
   Nan::FunctionCallback cb = [](JSInfo info) {
    Local<Value> data(info.Data());
    BlockFunctionCallback block_((__bridge BlockFunctionCallback)(data.As<External>()->Value()));
    Nan::HandleScope handleScope;
    @autoreleasepool {
      block_(info);
    }
   };
   Local<Function> fn = Nan::New<v8::Function>(cb, Nan::New<v8::External>((__bridge void*)block));
   fn->SetName(JS_STR(name));
   return handleScope.Escape(fn);
  }
  
  inline static void Set(Local<Object> obj, const char* _Nonnull name, BlockFunctionCallback _Nonnull block) {
    Nan::HandleScope handleScope;
    obj->Set(JS_STR(name), FromBlock(name, block));
  }
}

namespace sweetiekit {
  inline static Local<Function> Rename(const char* _Nonnull name, Local<Function> fn) {
    Nan::HandleScope handleScope;
    fn->SetName(JS_STR(name));
    return fn;
  }
  class JSFunction
  {
  public:
     std::shared_ptr<Nan::Persistent<Function>> cb;
     
     JSFunction()
     {
     }
    
     JSFunction(Local<Value> cb)
     {
       Reset(cb);
     }
     JSFunction(Local<Function> cb)
     {
       Reset(cb);
     }
     virtual ~JSFunction() {
      Reset();
     }
     
     void Reset() {
       cb.reset();
     }
    
     void Reset(Local<Function> fn) {
       cb.reset(new Nan::Persistent<Function>(fn));
     }
    
     void Reset(Local<Value> fn) {
       if (fn->IsFunction()) {
        cb.reset(new Nan::Persistent<Function>(Local<Function>::Cast(fn)));
       } else {
        Reset();
       }
     }
    
     JSFunction& operator = (Local<Function> fn) {
      Reset(fn);
      return *this;
     }
    
     JSFunction& operator = (Local<Value> fn) {
      Reset(fn);
      return *this;
     }
    
     Local<Value> GetValue() const {
       Nan::EscapableHandleScope scope;
       return scope.Escape(Nan::New(*cb));
     }
    
     Local<Function> Get() const {
       Nan::EscapableHandleScope scope;
       return scope.Escape(Nan::New(*cb));
     }
     Local<Function> operator *() {
       Nan::EscapableHandleScope scope;
       return scope.Escape(Get());
     }
     Local<Value> Call(const char* _Nonnull methodName, int argc, Local<Value>* _Nullable argv) const {
       Nan::EscapableHandleScope scope;
       return scope.Escape(sweetiekit::CallSync(Get(), methodName, argc, argv));
     }
     Local<Value> operator()(const char* _Nonnull methodName, int argc, Local<Value>* _Nullable argv) const {
       Nan::EscapableHandleScope scope;
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, argc, argv));
     }
     Local<Value> Call(const char* _Nonnull methodName, JSArgs& args) const {
       Nan::EscapableHandleScope scope;
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, (int)args.size(), args.empty() ? nullptr : &args[0]));
     }
     Local<Value> operator()(const char* _Nonnull methodName, JSArgs& args) const {
       Nan::EscapableHandleScope scope;
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, (int)args.size(), args.empty() ? nullptr : &args[0]));
     }
     Local<Value> Call(const char* _Nonnull methodName) const {
       Nan::EscapableHandleScope scope;
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, 0, nullptr));
     }
     Local<Value> operator()(const char* _Nonnull methodName) const {
       Nan::EscapableHandleScope scope;
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, 0, nullptr));
     }
     Local<Value> Call(const char* _Nonnull methodName, Local<Value> arg0) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, sizeof(argv)/sizeof(argv[0]), argv));
     }
     Local<Value> operator()(const char* _Nonnull methodName, Local<Value> arg0) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, sizeof(argv)/sizeof(argv[0]), argv));
     }
     Local<Value> Call(const char* _Nonnull methodName, Local<Value> arg0, Local<Value> arg1) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0, arg1 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, sizeof(argv)/sizeof(argv[0]), argv));
     }
     Local<Value> operator()(const char* _Nonnull methodName, Local<Value> arg0, Local<Value> arg1) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0, arg1 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, sizeof(argv)/sizeof(argv[0]), argv));
     }
     Local<Value> Call(const char* _Nonnull methodName, Local<Value> arg0, Local<Value> arg1, Local<Value> arg2) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0, arg1, arg2 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, sizeof(argv)/sizeof(argv[0]), argv));
     }
     Local<Value> Call(const char* _Nonnull methodName, Local<Value> arg0, Local<Value> arg1, Local<Value> arg2, Local<Value> arg3) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0, arg1, arg2, arg3 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, sizeof(argv)/sizeof(argv[0]), argv));
     }
     Local<Value> operator()(const char* _Nonnull methodName, Local<Value> arg0, Local<Value> arg1, Local<Value> arg2) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0, arg1, arg2 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, 3, argv));
     }
     Local<Value> operator()(const char* _Nonnull methodName, Local<Value> arg0, Local<Value> arg1, Local<Value> arg2, Local<Value> arg3) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0, arg1, arg2, arg3 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, 4, argv));
     }
     static JSArgs Args() {
      return JSArgs();
     }
     static JSArgs Args(Local<Value> x0) {
       Local<Value> argv[] = { x0 };
       return JSArgs(argv, argv + sizeof(argv[0]) / sizeof(argv));
     }
     static JSArgs Args(Local<Value> x0, Local<Value> x1) {
       Local<Value> argv[] = { x0, x1 };
       return JSArgs(argv, argv + sizeof(argv[0]) / sizeof(argv));
     }
     static JSArgs Args(Local<Value> x0, Local<Value> x1, Local<Value> x2) {
       Local<Value> argv[] = { x0, x1, x2 };
       return JSArgs(argv, argv + sizeof(argv[0]) / sizeof(argv));
     }
     static JSArgs Args(Local<Value> x0, Local<Value> x1, Local<Value> x2, Local<Value> x3) {
       Local<Value> argv[] = { x0, x1, x2, x3 };
       return JSArgs(argv, argv + sizeof(argv[0]) / sizeof(argv));
     }
  };
  typedef JSFunction NJSFunction;
}

namespace sweetiekit {
  struct JSEnumerateShouldStop
  {
    JSEnumerateShouldStop(const char* methodName)
    {
      m_onStop.Reset(sweetiekit::FromBlock(methodName, ^(JSInfo info) {
        m_onStopCalled = true;
        m_onStopResult = (info.Length() > 0) ? TO_BOOL(info[0]) : YES;
      }));
    }
    bool Stopped() const { return m_onStopCalled && m_onStopResult; }
    Local<Value> Get() const { return m_onStop.Get(); }
    
    operator bool() const { return Stopped(); }
    operator Local<Value>() const { return m_onStop.Get(); }
  private:
    JSFunction m_onStop;
    bool m_onStopCalled = false;
    bool m_onStopResult = false;
  };
}

#ifdef __OBJC__
@interface SweetJSFunction : NSObject
{
#ifdef __cplusplus
  sweetiekit::JSFunction _jsFunction;
#else
  void* _jsFunction;
#endif
}

#ifdef __cplusplus
- (sweetiekit::JSFunction * _Nonnull)jsFunction;
#else
- (void * _Nonnull)jsFunction;
#endif
@end
#endif

namespace sweetiekit {
  Local<Value> GetWrapperFor(__weak id _Nullable pThing, Nan::Persistent<FunctionTemplate>& defaultType);
  Local<Value> GetWrapperFor(__weak id _Nullable pThing);
  id _Nullable GetValueFor(Local<Value> value, bool* _Nullable failed = nullptr);
  id _Nullable FromJS(Local<Value> jsThing);
  Local<Object> JSObjFromFrame(CGRect frame);
  Local<Object> JSObjFromCGColor(CGColorRef _Nullable color);
  Local<Object> JSObjFromUIColor(UIColor* _Nullable color);
  CGRect FrameFromJSObj(Local<Value> jsThing);
  UIColor* _Nullable UIColorFromJSColor(Local<Value> jsThing);
  CGColorRef _Nullable CGColorRefFromJSColor(Local<Value> jsThing);
  bool IsJSColor(Local<Value> jsThing);
  Local<Array> JSArrayFromCGAffineTransform(CGAffineTransform xform);
  CGAffineTransform CGAffineXFormFromJSArray(Local<Value> jsThing);
  bool IsJSFrame(Local<Value> jsThing);
  bool SetTransform3(simd_float3x3& transform, Local<Value> value);
  bool SetTransform(simd_float4x4& transform, Local<Value> value);
  bool SetQuaternion(simd_quatf& quat, Local<Value> value);
  bool SetVector1(simd_float1& xyz, Local<Value> value);
  bool SetVector2(simd_float2& xyz, Local<Value> value);
  bool SetVector3(simd_float3& xyz, Local<Value> value);
  bool SetVector4(simd_float4& xyz, Local<Value> value);
  bool SetTransform3(float* _Nonnull transform, Local<Value> value);
  bool SetTransform(float* _Nonnull transform, Local<Value> value);
  bool SetQuaternion(float* _Nonnull quat, Local<Value> value);
  bool SetVector1(float* _Nonnull x, Local<Value> value);
  bool SetVector2(float* _Nonnull xy, Local<Value> value);
  bool SetVector3(float* _Nonnull xyz, Local<Value> value);
  bool SetVector4(float* _Nonnull xyzw, Local<Value> value);
  bool IsTransform3(Local<Value> value);
  bool IsTransform(Local<Value> value);
  bool IsQuaternion(Local<Value> value);
  bool IsVector1(Local<Value> value);
  bool IsVector2(Local<Value> value);
  bool IsVector3(Local<Value> value);
  bool IsVector4(Local<Value> value);
  
  bool SetVector1i(simd_int1& x, Local<Value> value);
  bool SetVector2i(simd_int2& xy, Local<Value> value);
  bool SetVector3i(simd_int3& xyz, Local<Value> value);
  bool SetVector4i(simd_int4& xyzw, Local<Value> value);
  bool SetVector1i(int32_t* _Nonnull x, Local<Value> value);
  bool SetVector2i(int32_t* _Nonnull xy, Local<Value> value);
  bool SetVector3i(int32_t* _Nonnull xyz, Local<Value> value);
  bool SetVector4i(int32_t* _Nonnull xyzw, Local<Value> value);
  bool IsVector1i(Local<Value> value);
  bool IsVector2i(Local<Value> value);
  bool IsVector3i(Local<Value> value);
  bool IsVector4i(Local<Value> value);
  
  bool SetVector1u(simd_uint1& x, Local<Value> value);
  bool SetVector2u(simd_uint2& xy, Local<Value> value);
  bool SetVector3u(simd_uint3& xyz, Local<Value> value);
  bool SetVector4u(simd_uint4& xyzw, Local<Value> value);
  bool SetVector1u(uint32_t* _Nonnull x, Local<Value> value);
  bool SetVector2u(uint32_t* _Nonnull xy, Local<Value> value);
  bool SetVector3u(uint32_t* _Nonnull xyz, Local<Value> value);
  bool SetVector4u(uint32_t* _Nonnull xyzw, Local<Value> value);
  bool IsVector1u(Local<Value> value);
  bool IsVector2u(Local<Value> value);
  bool IsVector3u(Local<Value> value);
  bool IsVector4u(Local<Value> value);
  
  Local<Value> CreateArrayBufferFromPointerLength(const void* _Nonnull bytes, size_t length);
}

Local<Value> js_value_ArrayBuffer(const void* _Nonnull bytes, size_t length);

extern "C" {

void iOSLog0(const char* _Nonnull msg);

#include <dispatch/queue.h>
void dispatch_ui_sync(dispatch_queue_t _Nonnull queue, dispatch_block_t _Nonnull block);
#define dispatch_sync dispatch_ui_sync
#define dispatch_main(block) declare_autoreleasepool { dispatch_ui_sync(dispatch_get_main_queue(), block); }

bool NJSStringGetUTF8String(Local<Value> jsStr, std::string& outStr);

#ifdef __OBJC__
#import <CoreFoundation/CoreFoundation.h>
NSString* _Nullable NJSStringToNSString(Local<Value> jsStr);
#endif

}
Local<Value> NSStringToJSString(NSString* _Nullable value);

namespace sweetiekit {
  class TryCatchReport : Nan::TryCatch
  {
  public:
    TryCatchReport() {
      this->SetVerbose(true);
    }
    virtual ~TryCatchReport() {
      if (this->HasCaught()) {
        auto msg = this->Message();
        std::string str;
        if (NJSStringGetUTF8String(msg->Get(), str)) {
          iOSLog0(str.c_str());
        }
      }
    }
  };
}


#ifdef __OBJC__
#include <objc/objc.h>
#include <objc/runtime.h>
#endif
/*
#include <cassert>
#define ASSERT assert
*/

namespace sweetiekit {
  template<typename T, typename U>
  inline std::unique_ptr<T> adoptSystem(U value)
  {
      return std::unique_ptr<T>(value);
  }

  inline bool protocolImplementsProtocol(Protocol * _Nonnull candidate, Protocol* _Nonnull target)
  {
      unsigned protocolProtocolsCount;
      auto protocolProtocols = adoptSystem<__unsafe_unretained Protocol*[]>(protocol_copyProtocolList(candidate, &protocolProtocolsCount));
      for (unsigned i = 0; i < protocolProtocolsCount; ++i) {
          if (protocol_isEqual(protocolProtocols[i], target))
              return true;
      }
      return false;
  }
  /*
  inline void forEachProtocolImplementingProtocol(Class cls, Protocol *target, void (^callback)(Protocol *, bool& stop))
  {
      ASSERT(cls);
      ASSERT(target);

      Vector<Protocol*> worklist;
      HashSet<void*> visited;

      // Initially fill the worklist with the Class's protocols.
      {
          unsigned protocolsCount;
          auto protocols = adoptSystem<__unsafe_unretained Protocol*[]>(class_copyProtocolList(cls, &protocolsCount));
          worklist.append(protocols.get(), protocolsCount);
      }

      bool stop = false;
      while (!worklist.isEmpty()) {
          Protocol *protocol = worklist.last();
          worklist.removeLast();

          // Are we encountering this Protocol for the first time?
          if (!visited.add((__bridge void*)protocol).isNewEntry)
              continue;

          // If it implements the protocol, make the callback.
          if (protocolImplementsProtocol(protocol, target)) {
              callback(protocol, stop);
              if (stop)
                  break;
          }

          // Add incorporated protocols to the worklist.
          {
              unsigned protocolsCount;
              auto protocols = adoptSystem<__unsafe_unretained Protocol*[]>(protocol_copyProtocolList(protocol, &protocolsCount));
              worklist.append(protocols.get(), protocolsCount);
          }
      }
  }*/

  inline void forEachMethodInClass(Class _Nonnull cls, void (^ _Nonnull callback)(Method _Nonnull))
  {
      unsigned count;
      auto methods = adoptSystem<Method[]>(class_copyMethodList(cls, &count));
      for (unsigned i = 0; i < count; ++i)
          callback(methods[i]);
  }

  inline void forEachPropertyInClass(Class _Nonnull cls, void (^ _Nonnull callback)(objc_property_t _Nonnull))
  {
      unsigned count;
      auto properties = adoptSystem<objc_property_t[]>(class_copyPropertyList(cls, &count));
      for (unsigned i = 0; i < count; ++i)
          callback(properties[i]);
  }

  inline void forEachMethodInProtocol(Protocol* _Nonnull protocol, BOOL isRequiredMethod, BOOL isInstanceMethod, void (^ _Nonnull callback)(SEL _Nonnull , const char*_Nonnull))
  {
      unsigned count;
      auto methods = adoptSystem<objc_method_description[]>(protocol_copyMethodDescriptionList(protocol, isRequiredMethod, isInstanceMethod, &count));
      for (unsigned i = 0; i < count; ++i)
          callback(methods[i].name, methods[i].types);
  }

  inline void forEachPropertyInProtocol(Protocol* _Nonnull protocol, void (^ _Nonnull callback)(objc_property_t _Nonnull ))
  {
      unsigned count;
      auto properties = adoptSystem<objc_property_t[]>(protocol_copyPropertyList(protocol, &count));
      for (unsigned i = 0; i < count; ++i)
          callback(properties[i]);
  }
  
  inline void forEachView(UIView * _Nonnull view, void(^ _Nonnull callback)(UIView* _Nullable view)) {
    callback(view);
    for (UIView* subview : [view subviews]) {
      forEachView(subview, callback);
    }
  }
}

extern "C" {
    // Forward declare some Objective-C runtime internal methods that are not API.
    const char * _Nullable _protocol_getMethodTypeEncoding(Protocol * _Nonnull, SEL, BOOL isRequiredMethod, BOOL isInstanceMethod);
    id _Nullable objc_initWeak(id _Nullable * _Nonnull, id _Nonnull);
    void objc_destroyWeak(id _Nullable * _Nonnull);
    bool _Block_has_signature(void * _Nonnull);
    const char * _Nullable _Block_signature(void * _Nonnull);
}

namespace sweetiekit
{
  inline void forEachValueInArray(Local<Array> array, void (^ _Nonnull callback)(uint32_t index, Local<Value> value))
  {
    Nan::HandleScope scope;
    for (uint32_t i = 0, n = array->Length(); i < n; i++) {
      @autoreleasepool {
        Local<Value> value = array->Get(i);
        callback(i, value);
      }
    }
  }
  
  inline void forEachEntryInObject(Local<Object> object, void (^ _Nonnull callback)(Local<Value> key, Local<Value> value))
  {
    Nan::HandleScope scope;
    Local<Array> names = object->GetOwnPropertyNames(JS_CONTEXT()).ToLocalChecked();
    for (uint32_t i = 0, n = names->Length(); i < n; i++) {
      @autoreleasepool {
        Local<Value> jsKey = names->Get(i);
        Local<Value> jsValue = object->Get(jsKey);
        callback(jsKey, jsValue);
      }
    }
  }
}

using sweetiekit::NJSFunction;
#define is_value_NJSFunction(x) (x)->IsFunction()
#define to_value_NJSFunction(x) (x)

#define js_value_void(...) (__VA_ARGS__, Nan::Undefined())

#define js_value_CFTimeInterval(x) js_value_double(x)
#define to_value_CFTimeInterval(x) to_value_double(x)
#define is_value_CFTimeInterval(x) is_value_double(x)

Local<Value> js_value_NSDate(NSDate* _Nullable value);
NSDate* _Nullable to_value_NSDate(const Local<Value>& value, bool* _Nullable failed = nullptr);
bool is_value_NSDate(const Local<Value>& value);

Local<Value> js_value_NSTimeInterval(const NSTimeInterval& value);
NSTimeInterval to_value_NSTimeInterval(const Local<Value>& value, bool* _Nullable failed = nullptr);
bool is_value_NSTimeInterval(const Local<Value>& value);

Local<Value> js_value_simd_quatf(const simd_quatf& value);
Local<Value> js_value_simd_float1(const simd_float1& value);
Local<Value> js_value_simd_float2(const simd_float2& value);
Local<Value> js_value_simd_float3(const simd_float3& value);
Local<Value> js_value_simd_float4(const simd_float4& value);
Local<Value> js_value_simd_float3x3(const simd_float3x3& value);
Local<Value> js_value_simd_float4x4(const simd_float4x4& value);
simd_quatf    to_value_simd_quatf(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_float1   to_value_simd_float1(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_float2   to_value_simd_float2(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_float3   to_value_simd_float3(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_float4   to_value_simd_float4(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_float3x3 to_value_simd_float3x3(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_float4x4 to_value_simd_float4x4(const Local<Value>& value, bool * _Nullable failed = nullptr);
bool is_value_simd_quatf(const Local<Value>& value);
bool is_value_simd_float1(const Local<Value>& value);
bool is_value_simd_float2(const Local<Value>& value);
bool is_value_simd_float3(const Local<Value>& value);
bool is_value_simd_float4(const Local<Value>& value);
bool is_value_simd_float3x3(const Local<Value>& value);
bool is_value_simd_float4x4(const Local<Value>& value);

#define js_value_vector_float1   js_value_simd_float1
#define js_value_vector_float2   js_value_simd_float2
#define js_value_vector_float3   js_value_simd_float3
#define js_value_vector_float4   js_value_simd_float4
#define js_value_matrix_float3x3 js_value_simd_float3x3
#define js_value_matrix_float4x4 js_value_simd_float4x4
#define to_value_vector_float1   to_value_simd_float1
#define to_value_vector_float2   to_value_simd_float2
#define to_value_vector_float3   to_value_simd_float3
#define to_value_vector_float4   to_value_simd_float4
#define to_value_matrix_float3x3 to_value_simd_float3x3
#define to_value_matrix_float4x4 to_value_simd_float4x4
#define is_value_vector_float1   is_value_simd_float1
#define is_value_vector_float2   is_value_simd_float2
#define is_value_vector_float3   is_value_simd_float3
#define is_value_vector_float4   is_value_simd_float4
#define is_value_matrix_float3x3 is_value_simd_float3x3
#define is_value_matrix_float4x4 is_value_simd_float4x4

Local<Value> js_value_simd_int1(const simd_int1& value);
Local<Value> js_value_simd_int2(const simd_int2& value);
Local<Value> js_value_simd_int3(const simd_int3& value);
Local<Value> js_value_simd_int4(const simd_int4& value);
simd_int1   to_value_simd_int1(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_int2   to_value_simd_int2(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_int3   to_value_simd_int3(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_int4   to_value_simd_int4(const Local<Value>& value, bool * _Nullable failed = nullptr);
bool is_value_simd_int1(const Local<Value>& value);
bool is_value_simd_int2(const Local<Value>& value);
bool is_value_simd_int3(const Local<Value>& value);
bool is_value_simd_int4(const Local<Value>& value);

#define js_value_vector_int1   js_value_simd_int1
#define js_value_vector_int2   js_value_simd_int2
#define js_value_vector_int3   js_value_simd_int3
#define js_value_vector_int4   js_value_simd_int4
#define to_value_vector_int1   to_value_simd_int1
#define to_value_vector_int2   to_value_simd_int2
#define to_value_vector_int3   to_value_simd_int3
#define to_value_vector_int4   to_value_simd_int4
#define is_value_vector_int1   is_value_simd_int1
#define is_value_vector_int2   is_value_simd_int2
#define is_value_vector_int3   is_value_simd_int3
#define is_value_vector_int4   is_value_simd_int4

Local<Value> js_value_simd_uint1(const simd_uint1& value);
Local<Value> js_value_simd_uint2(const simd_uint2& value);
Local<Value> js_value_simd_uint3(const simd_uint3& value);
Local<Value> js_value_simd_uint4(const simd_uint4& value);
simd_uint1   to_value_simd_uint1(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_uint2   to_value_simd_uint2(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_uint3   to_value_simd_uint3(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_uint4   to_value_simd_uint4(const Local<Value>& value, bool * _Nullable failed = nullptr);
bool is_value_simd_uint1(const Local<Value>& value);
bool is_value_simd_uint2(const Local<Value>& value);
bool is_value_simd_uint3(const Local<Value>& value);
bool is_value_simd_uint4(const Local<Value>& value);

#define js_value_vector_uint1   js_value_simd_uint1
#define js_value_vector_uint2   js_value_simd_uint2
#define js_value_vector_uint3   js_value_simd_uint3
#define js_value_vector_uint4   js_value_simd_uint4
#define to_value_vector_uint1   to_value_simd_uint1
#define to_value_vector_uint2   to_value_simd_uint2
#define to_value_vector_uint3   to_value_simd_uint3
#define to_value_vector_uint4   to_value_simd_uint4
#define is_value_vector_uint1   is_value_simd_uint1
#define is_value_vector_uint2   is_value_simd_uint2
#define is_value_vector_uint3   is_value_simd_uint3
#define is_value_vector_uint4   is_value_simd_uint4

Local<Value> js_value_SCNQuaternion(const SCNQuaternion& value);
Local<Value> js_value_SCNVector3(const SCNVector3& value);
Local<Value> js_value_SCNVector4(const SCNVector4& value);
Local<Value> js_value_SCNMatrix4(const SCNMatrix4& value);
SCNQuaternion  to_value_SCNQuaternion(const Local<Value>& value, bool * _Nullable failed = nullptr);
SCNVector3     to_value_SCNVector3(const Local<Value>& value, bool * _Nullable failed = nullptr);
SCNVector4     to_value_SCNVector4(const Local<Value>& value, bool * _Nullable failed = nullptr);
SCNMatrix4     to_value_SCNMatrix4(const Local<Value>& value, bool * _Nullable failed = nullptr);

Local<Value> js_value_CATransform3D(const CATransform3D& value);
CATransform3D to_value_CATransform3D(const Local<Value>& value, bool * _Nullable failed = nullptr);
bool is_value_CATransform3D(const Local<Value>& value);

Local<Value> js_value_CGPoint(const CGPoint& pt);
Local<Value> js_value_CGVector(const CGVector& pt);
Local<Value> js_value_CGSize(const CGSize& size);
Local<Value> js_value_CGRect(const CGRect& size);
CGPoint to_value_CGPoint(const Local<Value>& value);
CGVector to_value_CGVector(const Local<Value>& value);
CGSize to_value_CGSize(const Local<Value>& value);
CGRect to_value_CGRect(const Local<Value>& value);
bool is_value_CGPoint(const Local<Value>& value);
bool is_value_CGVector(const Local<Value>& value);
bool is_value_CGSize(const Local<Value>& value);
bool is_value_CGRect(const Local<Value>& value);

Local<Value> js_value_CGColorRef(CGColorRef _Nullable value);
Local<Value> js_value_CGPathRef(CGPathRef _Nullable value);
Local<Value> js_value_CGContextRef(CGContextRef _Nullable value);
Local<Value> js_value_CGImageRef(CGImageRef _Nullable value);
Local<Value> js_value_UIColor(UIColor* _Nullable value);

CGColorRef _Nullable to_value_CGColorRef(const Local<Value>& value, bool * _Nullable failed = nullptr);
CGPathRef _Nullable to_value_CGPathRef(const Local<Value>& value, bool * _Nullable failed = nullptr);
CGContextRef _Nullable to_value_CGContextRef(const Local<Value>& value, bool * _Nullable failed = nullptr);
CGImageRef _Nullable to_value_CGImageRef(const Local<Value>& value, bool * _Nullable failed = nullptr);
UIColor* _Nullable to_value_UIColor(const Local<Value>& value, bool * _Nullable failed = nullptr);

#define is_value_CGColorRef is_value_UIColor
bool is_value_CGPathRef(const Local<Value>& value);
bool is_value_CGContextRef(const Local<Value>& value);
bool is_value_CGImageRef(const Local<Value>& value);
bool is_value_UIColor(const Local<Value>& value);

#define js_value_SKColor js_value_UIColor
#define to_value_SKColor to_value_UIColor
#define is_value_SKColor is_value_UIColor

Local<Value> js_value_NSRange(const NSRange& pt);
NSRange to_value_NSRange(const Local<Value>& value);
bool is_value_NSRange(const Local<Value>& value);

Local<Value> js_value_NSData(NSData* _Nullable value);
NSData* _Nullable to_value_NSData(const Local<Value>& value, bool* _Nullable failed = nullptr);
bool is_value_NSData(const Local<Value>& value);

#define js_value_CGAffineTransform(x) sweetiekit::JSArrayFromCGAffineTransform(x)
#define to_value_CGAffineTransform(x) sweetiekit::CGAffineXFormFromJSArray(x)
bool is_value_CGAffineTransform(const Local<Value>& value);

/*
typedef struct UIEdgeInsets {
    CGFloat top, left, bottom, right;  // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
} UIEdgeInsets;
*/
Local<Value> js_value_UIEdgeInsets(const UIEdgeInsets& pt);
UIEdgeInsets to_value_UIEdgeInsets(const Local<Value>& value);
bool is_value_UIEdgeInsets(const Local<Value>& value);

/* Specifically for use in methods and functions supporting user interface layout direction
 */
/*
typedef struct NSDirectionalEdgeInsets {
    CGFloat top, leading, bottom, trailing;  // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
} NSDirectionalEdgeInsets API_AVAILABLE(ios(11.0),tvos(11.0),watchos(4.0));
*/
Local<Value> js_value_NSDirectionalEdgeInsets(const NSDirectionalEdgeInsets& pt);
NSDirectionalEdgeInsets to_value_NSDirectionalEdgeInsets(const Local<Value>& value);
bool is_value_NSDirectionalEdgeInsets(const Local<Value>& value);

/*
typedef struct UIOffset {
    CGFloat horizontal, vertical; // specify amount to offset a position, positive for right or down, negative for left or up
} UIOffset;
*/
Local<Value> js_value_UIOffset(const UIOffset& pt);
UIOffset to_value_UIOffset(const Local<Value>& value);
bool is_value_UIOffset(const Local<Value>& value);


template<typename T>
Local<Value> js_value_NSMutableArray(NSMutableArray<T>* _Nullable arr) {
  if (arr == nullptr) {
    return Nan::Undefined();
  } else {
    auto result = Nan::New<Array>();
    for (NSInteger i = 0, n = [arr count]; i < n; i++) {
      T item = [arr objectAtIndex:i];
      Nan::Set(result, static_cast<uint32_t>(i), sweetiekit::GetWrapperFor(item));
    }
    return result;
  }
}

template<typename T>
NSMutableArray<T>* _Nullable to_value_NSMutableArray(Local<Value> arr) {
  if (!arr->IsArray()) {
    return nullptr;
  } else {
    auto value = Local<Array>::Cast(arr);
    auto result = [[NSMutableArray alloc] initWithCapacity:value->Length()];
    for (uint32_t i = 0, n = value->Length(); i < n; i++) {
      id item = sweetiekit::GetValueFor(value->Get(i));
      [result setObject:item atIndexedSubscript:i];
    }
    return result;
  }
}

template<typename T>
bool is_value_NSMutableArray(Local<Value> arr) {
  if (!arr->IsArray()) {
    return false;
  }
  // TODO: check the type of each object in the array against T
  return true;
}


template<typename T>
Local<Value> js_value_NSArray(NSArray<T>* _Nullable arr) {
  if (arr == nullptr) {
    return Nan::Undefined();
  } else {
    auto result = Nan::New<Array>();
    for (NSInteger i = 0, n = [arr count]; i < n; i++) {
      T item = [arr objectAtIndex:i];
      Nan::Set(result, static_cast<uint32_t>(i), sweetiekit::GetWrapperFor(item));
    }
    return result;
  }
}

template<typename T>
NSArray<T>* _Nullable to_value_NSArray(Local<Value> arr) {
  if (!arr->IsArray()) {
    return nullptr;
  } else {
    auto value = Local<Array>::Cast(arr);
    auto result = [[NSMutableArray alloc] initWithCapacity:value->Length()];
    for (uint32_t i = 0, n = value->Length(); i < n; i++) {
      id item = sweetiekit::GetValueFor(value->Get(i));
      [result setObject:item atIndexedSubscript:i];
    }
    return result;
  }
}

template<typename T>
bool is_value_NSArray(Local<Value> arr) {
  if (!arr->IsArray()) {
    return false;
  }
  // TODO: check the type of each object in the array against T
  return true;
}


template<typename K, typename T>
Local<Value> js_value_NSDictionary(NSDictionary<K, T>* _Nullable value) {
  if (value == nullptr) {
    return Nan::Undefined();
  } else {
    Local<Map> result(Map::New(JS_ISOLATE()));
    [value enumerateKeysAndObjectsUsingBlock:^(K key, T obj, BOOL * _Nonnull stop) {
      Local<Value> k = js_value_id(key);
      Local<Value> v = js_value_id(obj);
      result->Set(JS_CONTEXT(), k, v);
    }];
    return result;
  }
}

template<typename K, typename T>
NSDictionary<K, T>* _Nullable to_value_NSDictionary(Local<Value> dict) {
  if (!dict->IsMap()) {
    return nullptr;
  } else {
    Local<Array> value(Local<Map>::Cast(dict)->AsArray());
    auto result = [[NSMutableDictionary alloc] init];
    for (uint32_t i = 0, n = value->Length(); i < n; i += 2) {
      id k = sweetiekit::GetValueFor(value->Get(i));
      id v = sweetiekit::GetValueFor(value->Get(i+1));
      [result setObject:v forKey:k];
    }
    return result;
  }
}

template<typename K, typename T>
bool is_value_NSDictionary(Local<Value> value) {
  if (!value->IsMap()) {
    return false;
  }
  // TODO: check the type of each object in the dictionary against K and T
  return true;
}

Local<Value> js_value_id(id _Nullable value);
id _Nullable to_value_id(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_id(Local<Value> value);

Local<Value> js_value_NSNumber(NSNumber* _Nullable value);
NSNumber* _Nullable to_value_NSNumber(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_NSNumber(Local<Value> value);

Local<Value> js_value_NSMutableDictionary(NSMutableDictionary* _Nullable value);
NSMutableDictionary* _Nullable to_value_NSMutableDictionary(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_NSMutableDictionary(Local<Value> value);

Local<Value> js_value_NSDictionary(NSDictionary* _Nullable value);
NSDictionary* _Nullable to_value_NSDictionary(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_NSDictionary(Local<Value> value);

Local<Value> js_value_NSMutableSet(NSMutableSet* _Nullable value);
NSMutableSet* _Nullable to_value_NSMutableSet(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_NSMutableSet(Local<Value> value);

Local<Value> js_value_NSSet(NSSet* _Nullable value);
NSSet* _Nullable to_value_NSSet(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_NSSet(Local<Value> value);

Local<Value> js_value_NSMutableArray(NSMutableArray* _Nullable value);
NSMutableArray* _Nullable to_value_NSMutableArray(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_NSMutableArray(Local<Value> value);

Local<Value> js_value_NSArray(NSArray* _Nullable value);
NSArray* _Nullable to_value_NSArray(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_NSArray(Local<Value> value);

Local<Value> js_value_NSArrayOfCGColors(NSArray* _Nullable value);
NSArray* _Nullable to_value_NSArrayOfCGColors(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_NSArrayOfCGColors(Local<Value> value);

template<typename T>
Local<Value> js_value_id(T* _Nullable value) {
  return sweetiekit::GetWrapperFor(value);
}

template<typename T>
T* _Nullable to_value_id(Local<Value> value, bool* _Nullable failed = nullptr) {
  return (T*)sweetiekit::GetValueFor(value, failed);
}

template<typename T>
Local<Value> js_value_id_(T _Nullable value) {
  return sweetiekit::GetWrapperFor(value);
}

template<typename T>
T _Nullable to_value_id_(Local<Value> value, bool* _Nullable failed = nullptr) {
  return (T)sweetiekit::GetValueFor(value, failed);
}

#define js_value_void_pointer(x) Nan::New<External>(x)
#define to_value_void_pointer(x) (x).As<External>()->Value()
#define is_value_void_pointer(x) (x)->IsExternal()

#define js_value_bool(x) JS_BOOL(x)
#define to_value_bool(x) TO_BOOL(x)
#define is_value_bool(x) (x)->IsBoolean()

#define js_value_int(x) JS_INT(x)
#define to_value_int(x) TO_INT32(x)
#define is_value_int(x) (x)->IsInt32()

#define js_value_unsigned(x) JS_UINT(x)
#define to_value_unsigned(x) TO_UINT32(x)
#define is_value_unsigned(x) (x)->IsUint32()

#define js_value_unsigned_int(x) JS_UINT(x)
#define to_value_unsigned_int(x) TO_UINT32(x)
#define is_value_unsigned_int(x) (x)->IsUint32()

#define js_value_uint8_t(x) JS_BYTE(x)
#define to_value_uint8_t(x) TO_BYTE(x)
#define is_value_uint8_t(x) IS_BYTE(x)

#define js_value_int16_t(x) JS_INT(static_cast<int16_t>(x))
#define to_value_int16_t(x) static_cast<int16_t>(TO_INT32(x))
#define is_value_int16_t(x) (x)->IsInt32() // TODO

#define js_value_uint16_t(x) JS_UINT(static_cast<uint16_t>(x))
#define to_value_uint16_t(x) static_cast<uint16_t>(TO_UINT32(x))
#define is_value_uint16_t(x) ((x)->IsUint32() && (TO_UINT32(x) <= 65535))

#define js_value_int32_t(x) JS_INT(x)
#define to_value_int32_t(x) TO_INT32(x)
#define is_value_int32_t(x) (x)->IsInt32()

#define js_value_uint32_t(x) JS_UINT(x)
#define to_value_uint32_t(x) TO_UINT32(x)
#define is_value_uint32_t(x) (x)->IsUint32()

// unsure about these, but they should work for integers from -2^52 to 2^52
#define JS_INT64(x) JS_NUM(static_cast<double>(x))
#define TO_INT64(x) static_cast<int64_t>(TO_DOUBLE(x))
#define IS_INT64(x) (x)->IsNumber()
#define JS_UINT64(x) JS_NUM(static_cast<double>(x))
#define TO_UINT64(x) static_cast<uint64_t>(TO_DOUBLE(x))
#define IS_UINT64(x) (x)->IsNumber()

#define js_value_int64_t(x) JS_INT64(x)
#define to_value_int64_t(x) TO_INT64(x)
#define is_value_int64_t(x) IS_INT64(x)

#define js_value_uint64_t(x) JS_UINT64(x)
#define to_value_uint64_t(x) TO_UINT64(x)
#define is_value_uint64_t(x) IS_UINT64(x)

#define js_value_double(x) JS_NUM(x)
#define to_value_double(x) TO_DOUBLE(x)
#define is_value_double(x) (x)->IsNumber()

#define js_value_float(x) JS_FLOAT(x)
#define to_value_float(x) TO_FLOAT(x)
#define is_value_float(x) (x)->IsNumber()

#define js_value_BOOL(x) JS_BOOL(x)
#define to_value_BOOL(x) TO_BOOL(x)
#define is_value_BOOL(x) (x)->IsBoolean()

#define js_value_NSInteger(x) JS_INT(x)
#define to_value_NSInteger(x) TO_INT32(x)
#define is_value_NSInteger(x) (x)->IsInt32()

#define js_value_NSUInteger(x) JS_UINT(x)
#define to_value_NSUInteger(x) TO_UINT32(x)
#define is_value_NSUInteger(x) (x)->IsUint32()

#define js_value_CGFloat(x) JS_FLOAT(x)
#define to_value_CGFloat(x) TO_FLOAT(x)
#define is_value_CGFloat(x) (x)->IsNumber()

#define js_value_NSString(x) NSStringToJSString(x)
#define to_value_NSString(x) NJSStringToNSString(x)
#define is_value_NSString(x) (x)->IsString()

#define JS_ENUM(type, c, x) js_value_##c(x)
#define TO_ENUM(type, c, x) static_cast<type>(to_value_##c(x))
#define IS_ENUM(type, c, x) is_value_##c(x)

#define JS_OPTS(type, c, x) js_value_##c(x)
#define TO_OPTS(type, c, x) static_cast<type>(to_value_##c(x))
#define IS_OPTS(type, c, x) is_value_##c(x)

#define js_enum_wrapper(x, c) JS_ENUM(c, NSInteger, x)
#define to_enum_wrapper(x, c) TO_ENUM(c, NSInteger, x)
#define is_enum_wrapper(x, c) IS_ENUM(c, NSInteger, x)

#define js_enum_string_wrapper(x, c) JS_ENUM(c, NSString, x)
#define to_enum_string_wrapper(x, c) TO_ENUM(c, NSString, x)
#define is_enum_string_wrapper(x, c) IS_ENUM(c, NSString, x)
#define js_opts_wrapper(x, c) JS_OPTS(c, NSUInteger, x)
#define to_opts_wrapper(x, c) TO_OPTS(c, NSUInteger, x)
#define is_opts_wrapper(x, c) IS_OPTS(c, NSUInteger, x)

#define js_value_wrapper(x, t) sweetiekit::GetWrapperFor(x, N##t::type)
#define to_value_wrapper(x, t) (t*)sweetiekit::GetValueFor(x)
#define is_value_wrapper(x, t) JS_INSTANCEOF(x, N##t)

#define js_value_wrapper_unknown(x, t) sweetiekit::GetWrapperFor(x)
#define to_value_wrapper_unknown(x, t) to_value_wrapper(x, t)
#define is_value_wrapper_unknown(x, t) is_value_wrapper(x, NSObject)
  
#define declare_value_(index, type, name) \
  auto name##_argument_index(index); \
  if (!is_value_##type(info[name##_argument_index])) \
    JS_PANIC("Expected arg[%u] to be a " #type, name##_argument_index); \
  type name(to_value_##type(info[name##_argument_index]));
  
#define declare_pointer_(index, type, name) \
  auto name##_argument_index(index); \
  if (info[name##_argument_index]->IsNullOrUndefined() || !is_value_##type(info[name##_argument_index])) \
    JS_PANIC("Expected arg[%u] to be a " #type, name##_argument_index); \
  type* name(to_value_##type(info[name##_argument_index]));
  
#define declare_nullable_value_(index, type, name) \
  auto name##_argument_index(index); \
  if (!info[name##_argument_index]->IsNullOrUndefined() && !is_value_##type(info[name##_argument_index])) \
    JS_PANIC("Expected arg[%u] to be a " #type, name##_argument_index); \
  type name(info[name##_argument_index]->IsNullOrUndefined() ? nullptr : to_value_##type(info[name##_argument_index]));
  
#define declare_nullable_pointer_(index, type, name) \
  auto name##_argument_index(index); \
  if (!info[name##_argument_index]->IsNullOrUndefined() && !is_value_##type(info[name##_argument_index])) \
    JS_PANIC("Expected arg[%u] to be a " #type, name##_argument_index); \
  type* name(info[name##_argument_index]->IsNullOrUndefined() ? nullptr : to_value_##type(info[name##_argument_index]));

#define declare_value_pointer_(index, type, name) \
  auto name##_argument_index(index); \
  type name##_; \
  type* name = (info[name##_argument_index]->IsObject()) ? &(name##_) : nullptr; \
  Local<Object> name##Obj; \
  if (info[name##_argument_index]->IsObject()) { \
    name##Obj = JS_OBJ(info[name##_argument_index]); \
  }
  
#ifdef __OBJC__
#define declare_autoreleasepool @autoreleasepool
#else
#define declare_autoreleasepool
#endif

#define declare_args() \
  int JS_ARGC = 0

#define declare_getter() \
  std::vector< Local<Value> > info; \
  declare_args()

#define declare_setter() \
  std::vector< Local<Value> > info; \
  info.push_back(value); \
  declare_args()

#define declare_value(...) \
  declare_value_(JS_ARGC, __VA_ARGS__); JS_ARGC++;
  
#define declare_pointer(...) \
  declare_pointer_(JS_ARGC, __VA_ARGS__); JS_ARGC++;

#define declare_nullable_pointer(...) \
  declare_nullable_pointer_(JS_ARGC, __VA_ARGS__); JS_ARGC++;
  
#define declare_nullable_value(...) \
  declare_nullable_value_(JS_ARGC, __VA_ARGS__); JS_ARGC++;
  
#define declare_value_pointer(...) \
  declare_value_pointer_(JS_ARGC, __VA_ARGS__); JS_ARGC++;
  
#define declare_error() \
  NSError* error = nullptr

#define declare_callback_function(name) \
  sweetiekit::JSFunction name(info[JS_ARGC++]);

#define declare_persistent_function(name, keyName) \
  SweetJSFunction* name = [[SweetJSFunction alloc] init]; \
  [name jsFunction]->Reset(info[JS_ARGC++]); \
  [self associateValue:name withKey:keyName];
  
#define get_persistent_function(from, name, key) \
      SweetJSFunction* name = (SweetJSFunction*)[from associatedValueForKey:key];
      
#define check_error() \
  js_panic_NSError(error)
  
// Foundation
#define js_panic_NSError(error) \
    if (error) { \
      Nan::ThrowError([[error localizedDescription] UTF8String]); \
      return; \
    }
    


// CoreGraphics types

#define js_value_CGBlendMode(x) JS_ENUM(CGBlendMode, NSInteger, x)
#define to_value_CGBlendMode(x) TO_ENUM(CGBlendMode, NSInteger, x)
#define is_value_CGBlendMode(x) IS_ENUM(CGBlendMode, NSInteger, x)

// SceneKit types
#define js_value_SCNMorpher(x) js_value_wrapper_unknown(x, SCNMorpher)
#define to_value_SCNMorpher(x) to_value_wrapper_unknown(x, SCNMorpher)
#define js_value_SCNSkinner(x) js_value_wrapper_unknown(x, SCNSkinner)
#define to_value_SCNSkinner(x) to_value_wrapper_unknown(x, SCNSkinner)
#define js_value_SCNPhysicsField(x) js_value_wrapper_unknown(x, SCNPhysicsField)
#define to_value_SCNPhysicsField(x) to_value_wrapper_unknown(x, SCNPhysicsField)

// SpriteKit types
#define js_value_SKKeyframeSequence(x) js_value_wrapper_unknown(x, SKKeyframeSequence)
#define to_value_SKKeyframeSequence(x) to_value_wrapper_unknown(x, SKKeyframeSequence)
#define js_value_SKReachConstraints(x) js_value_wrapper_unknown(x, SKReachConstraints)
#define to_value_SKReachConstraints(x) to_value_wrapper_unknown(x, SKReachConstraints)

#ifdef __OBJC__
#import "node_ios_hello-Swift.h"
#endif

#endif /* defines_h */
