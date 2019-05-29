//
//  defines.h
//  node-ios-hello
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

#define JS_STR(...) Nan::New<v8::String>(__VA_ARGS__).ToLocalChecked()
#define JS_INT(val) Nan::New<v8::Integer>(static_cast<int32_t>(val))
#define JS_UINT(val) Nan::New<v8::Integer>(static_cast<uint32_t>(val))
#define JS_NUM(val) Nan::New<v8::Number>(val)
#define JS_FLOAT(val) Nan::New<v8::Number>(val)
#define JS_BOOL(val) Nan::New<v8::Boolean>(val)
#define JS_OBJ(val) Nan::To<v8::Object>(val).ToLocalChecked()
#define JS_TYPE(name) (Nan::New(name::type)->GetFunction(Isolate::GetCurrent()->GetCurrentContext()).ToLocalChecked())
#define JS_INSTANCEOF(obj, type) ((obj)->InstanceOf(JS_CONTEXT(), JS_TYPE(type)).FromJust())
#define JS_NEW(type, argc, argv) (JS_TYPE(type)->NewInstance(JS_CONTEXT(), argc, argv).ToLocalChecked())
#define JS_NEW_ARGV(type, argv) JS_NEW(type, sizeof(argv)/sizeof(argv[0]), argv)
#define JS_FUNC(x) ((x)->GetFunction(Isolate::GetCurrent()->GetCurrentContext()).ToLocalChecked())
#define JS_WRAPPER(el, ElType) sweetiekit::GetWrapperFor(el, N##ElType::type)

#define JS_ISOLATE() (Isolate::GetCurrent())
#define JS_CONTEXT() (Isolate::GetCurrent()->GetCurrentContext())
#define JS_GLOBAL() (JS_CONTEXT()->Global())
#define JS_HAS(obj, name) (obj)->Has(JS_CONTEXT(), name).FromJust()

#define TO_DOUBLE(x) (Nan::To<double>(x).FromJust())
#define TO_BOOL(x) (Nan::To<bool>(x).FromJust())
#define TO_UINT32(x) (Nan::To<unsigned int>(x).FromJust())
#define TO_INT32(x) (Nan::To<int>(x).FromJust())
#define TO_FLOAT(x) static_cast<float>((Nan::To<double>(x).FromJust()))
#define TO_FUNC(x) (Nan::To<Function>(x).ToLocalChecked())

template <typename T>
class shared_ptr_release_deleter {
public:
  void operator() (T * _Nullable ptr) {
    // nothing
  }
private:
};

template <typename T> struct V8TypedArrayTraits;
template<> struct V8TypedArrayTraits<Float32Array> { typedef float value_type; };
template<> struct V8TypedArrayTraits<Float64Array> { typedef double value_type; };
template<> struct V8TypedArrayTraits<Int32Array> { typedef int value_type; };
template<> struct V8TypedArrayTraits<Uint32Array> { typedef unsigned int value_type; };

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

#define JS_PROP(name) \
  static NAN_GETTER(name##Getter); \
  static NAN_SETTER(name##Setter)

#define JS_METHOD(name) \
  static NAN_METHOD(name)

#define JS_UNWRAP(type, name) \
  N##type* n##name = ObjectWrap::Unwrap<N##type>(info.This()); n##name = n##name; \
  type* name = n##name->As<type>(); name = name;

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

#define JS_PROTO_PROP(jsName)           JS_ASSIGN_PROP(proto, jsName)
#define JS_PROTO_PROP_READONLY(jsName)  JS_ASSIGN_PROP_READONLY(proto, jsName)
#define JS_PROTO_METHOD(jsName)         Nan::SetMethod(proto, #jsName, jsName)

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
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate); \
  static NAN_METHOD(New);
  
  
#define JS_WRAP_CLASS_END(name) \
};

#define JS_ATTACH_FUNCTION(jsValue, objcValue, keyName) \
  { \
    SweetJSFunction* func = [[SweetJSFunction alloc] init]; \
    [func jsFunction]->Reset(jsValue); \
    [objcValue associateValue:func withKey:keyName]; \
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
       cb.reset(new Nan::Persistent<Function>(Local<Function>::Cast(fn)));
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
     Local<Value> operator()(const char* _Nonnull methodName, Local<Value> arg0, Local<Value> arg1, Local<Value> arg2) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0, arg1, arg2 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, 3, argv));
     }
     static JSArgs Args() {
      return JSArgs();
     }
     static JSArgs Args(Local<Value> x0) {
       Nan::EscapableHandleScope scope;
       Local<Value> argv[] = { scope.Escape(x0) };
       return JSArgs(argv, argv + sizeof(argv[0]) / sizeof(argv));
     }
     static JSArgs Args(Local<Value> x0, Local<Value> x1) {
       Nan::EscapableHandleScope scope;
       Local<Value> argv[] = { scope.Escape(x0), scope.Escape(x1) };
       return JSArgs(argv, argv + sizeof(argv[0]) / sizeof(argv));
     }
     static JSArgs Args(Local<Value> x0, Local<Value> x1, Local<Value> x2) {
       Nan::EscapableHandleScope scope;
       Local<Value> argv[] = { scope.Escape(x0), scope.Escape(x1), scope.Escape(x2) };
       return JSArgs(argv, argv + sizeof(argv[0]) / sizeof(argv));
     }
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
  Local<Value> GetWrapperFor(id _Nullable pThing, Nan::Persistent<FunctionTemplate>& defaultType);
  Local<Value> GetWrapperFor(id _Nullable pThing);
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
  bool SetVector3(simd_float3& xyz, Local<Value> value);
  bool SetTransform3(float* _Nonnull transform, Local<Value> value);
  bool SetTransform(float* _Nonnull transform, Local<Value> value);
  bool SetQuaternion(float* _Nonnull quat, Local<Value> value);
  bool SetVector3(float* _Nonnull xyz, Local<Value> value);
}

extern "C" {

void iOSLog0(const char* _Nonnull msg);

#include <dispatch/queue.h>
void dispatch_ui_sync(dispatch_queue_t _Nonnull queue, dispatch_block_t _Nonnull block);
#define dispatch_sync dispatch_ui_sync

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

#define js_value_vector_float3   js_value_simd_float3
#define js_value_matrix_float3x3 js_value_simd_float3x3
#define js_value_matrix_float4x4 js_value_simd_float4x4
#define to_value_vector_float3   to_value_simd_float3
#define to_value_matrix_float3x3 to_value_simd_float3x3
#define to_value_matrix_float4x4 to_value_simd_float4x4

Local<Value> js_value_simd_quatf(const simd_quatf& value);
Local<Value> js_value_simd_float3(const simd_float3& value);
Local<Value> js_value_simd_float4(const simd_float4& value);
Local<Value> js_value_simd_float3x3(const simd_float3x3& value);
Local<Value> js_value_simd_float4x4(const simd_float4x4& value);
simd_quatf    to_value_simd_quatf(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_float3   to_value_simd_float3(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_float4   to_value_simd_float4(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_float3x3 to_value_simd_float3x3(const Local<Value>& value, bool * _Nullable failed = nullptr);
simd_float4x4 to_value_simd_float4x4(const Local<Value>& value, bool * _Nullable failed = nullptr);


Local<Value> js_value_SCNQuaternion(const SCNQuaternion& value);
Local<Value> js_value_SCNVector3(const SCNVector3& value);
Local<Value> js_value_SCNVector4(const SCNVector4& value);
Local<Value> js_value_SCNMatrix4(const SCNMatrix4& value);
SCNQuaternion  to_value_SCNQuaternion(const Local<Value>& value, bool * _Nullable failed = nullptr);
SCNVector3     to_value_SCNVector3(const Local<Value>& value, bool * _Nullable failed = nullptr);
SCNVector4     to_value_SCNVector4(const Local<Value>& value, bool * _Nullable failed = nullptr);
SCNMatrix4     to_value_SCNMatrix4(const Local<Value>& value, bool * _Nullable failed = nullptr);

Local<Value> js_value_CGPoint(const CGPoint& pt);
Local<Value> js_value_CGVector(const CGVector& pt);
Local<Value> js_value_CGSize(const CGSize& size);
Local<Value> js_value_CGRect(const CGRect& size);
CGPoint to_value_CGPoint(const Local<Value>& value);
CGVector to_value_CGVector(const Local<Value>& value);
CGSize to_value_CGSize(const Local<Value>& value);
CGRect to_value_CGRect(const Local<Value>& value);

Local<Value> js_value_CGColor(CGColorRef _Nullable color);
Local<Value> js_value_UIColor(UIColor* _Nullable color);
#define js_value_SKColor js_value_UIColor
CGColorRef _Nullable to_value_CGColor(const Local<Value>& value, bool * _Nullable failed = nullptr);
UIColor* _Nullable to_value_UIColor(const Local<Value>& value, bool * _Nullable failed = nullptr);
#define to_value_SKColor to_value_UIColor

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

static inline Local<Value> js_value_NSMutableDictionary(NSMutableDictionary* _Nullable dict) {
  if (dict == nullptr) {
    return Nan::Undefined();
  } else {
    auto result = Nan::New<Object>();
    Nan::ThrowError("js_value_NSMutableDictionary: not yet implemented");
//    for (NSInteger i = 0, n = [arr count]; i < n; i++) {
//      T item = [arr objectAtIndex:i];
//      Nan::Set(result, static_cast<uint32_t>(i), sweetiekit::GetWrapperFor(item));
//    }
    return result;
  }
}

static inline NSMutableDictionary* _Nullable to_value_NSMutableDictionary(Local<Value> dict) {
  if (!dict->IsObject()) {
    return nullptr;
  } else {
    NSMutableDictionary* result = [[NSMutableDictionary alloc] init];
    Nan::ThrowError("to_value_NSMutableDictionary: not yet implemented");
//    auto value = Local<Object>::Cast(dict);
//    for (uint32_t i = 0, n = value->Length(); i < n; i++) {
//      id item = sweetiekit::GetValueFor(value->Get(i));
//      [result setObject:item atIndexedSubscript:i];
//    }
    return result;
  }
}

template<typename T>
Local<Value> js_value_id(T* _Nullable value) {
  return sweetiekit::GetWrapperFor(value);
}

static inline Local<Value> js_value_id(id _Nullable value) {
  return sweetiekit::GetWrapperFor(value);
}

template<typename T>
T* _Nullable to_value_id(Local<Value> value, bool* _Nullable failed = nullptr) {
  return (T*)sweetiekit::GetValueFor(value, failed);
}

static inline id _Nullable to_value_id(Local<Value> value, bool* _Nullable failed = nullptr) {
  return sweetiekit::GetValueFor(value, failed);
}

#define js_value_NSInteger JS_INT
#define to_value_NSInteger TO_INT32
#define js_value_NSUInteger JS_UINT
#define to_value_NSUInteger TO_UINT32
#define js_value_NSString NSStringToJSString
#define to_value_NSString NJSStringToNSString

#define JS_ENUM(type, c, x) js_value_##c(x)
#define TO_ENUM(type, c, x) static_cast<type>(to_value_##c(x))

#define js_value_wrapper(x, t) js_value_wrapper_known(x, t)
#define to_value_wrapper(x, t) (t*)sweetiekit::GetValueFor(x)
#define js_value_wrapper_unknown(x, t) sweetiekit::GetWrapperFor(x)
#define to_value_wrapper_unknown(x, t) to_value_wrapper(x, t)
#define js_value_wrapper_known(x, t) sweetiekit::GetWrapperFor(x, N##t::type)
#define to_value_wrapper_known(x, t) to_value_wrapper(x, t)

// SceneKit types
#define js_value_SCNMorpher(x) js_value_wrapper_unknown(x, SCNMorpher)
#define to_value_SCNMorpher(x) to_value_wrapper_unknown(x, SCNMorpher)
#define js_value_SCNCamera(x) js_value_wrapper_unknown(x, SCNCamera)
#define to_value_SCNCamera(x) to_value_wrapper_unknown(x, SCNCamera)
#define js_value_SCNSkinner(x) js_value_wrapper_unknown(x, SCNSkinner)
#define to_value_SCNSkinner(x) to_value_wrapper_unknown(x, SCNSkinner)
#define js_value_SCNPhysicsBody(x) js_value_wrapper_unknown(x, SCNPhysicsBody)
#define to_value_SCNPhysicsBody(x) to_value_wrapper_unknown(x, SCNPhysicsBody)
#define js_value_SCNPhysicsField(x) js_value_wrapper_unknown(x, SCNPhysicsField)
#define to_value_SCNPhysicsField(x) to_value_wrapper_unknown(x, SCNPhysicsField)

// SpriteKit types
#define js_value_SKKeyframeSequence(x) js_value_wrapper_unknown(x, SKKeyframeSequence)
#define to_value_SKKeyframeSequence(x) to_value_wrapper_unknown(x, SKKeyframeSequence)
#define js_value_SKReachConstraints(x) js_value_wrapper_unknown(x, SKReachConstraints)
#define to_value_SKReachConstraints(x) to_value_wrapper_unknown(x, SKReachConstraints)

#endif /* defines_h */
