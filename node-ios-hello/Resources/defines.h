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
#define JS_INT(val) Nan::New<v8::Integer>(val)
#define JS_NUM(val) Nan::New<v8::Number>(val)
#define JS_FLOAT(val) Nan::New<v8::Number>(val)
#define JS_BOOL(val) Nan::New<v8::Boolean>(val)
#define JS_OBJ(val) Nan::To<v8::Object>(val).ToLocalChecked()
#define JS_TYPE(name) (Nan::New(name::type)->GetFunction(Isolate::GetCurrent()->GetCurrentContext()).ToLocalChecked())
#define JS_FUNC(x) ((x)->GetFunction(Isolate::GetCurrent()->GetCurrentContext()).ToLocalChecked())

#define JS_ISOLATE() (Isolate::GetCurrent())
#define JS_CONTEXT() (Isolate::GetCurrent()->GetCurrentContext())
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
  void operator() (T *ptr) {
    // nothing
  }
private:
};

Local<Array> pointerToArray(void *ptr);
void *arrayToPointer(Local<Array> array);

template <typename T> struct V8TypedArrayTraits;
template<> struct V8TypedArrayTraits<Float32Array> { typedef float value_type; };
template<> struct V8TypedArrayTraits<Float64Array> { typedef double value_type; };
template<> struct V8TypedArrayTraits<Int32Array> { typedef int value_type; };
template<> struct V8TypedArrayTraits<Uint32Array> { typedef unsigned int value_type; };

template <typename T>
Local<T> createTypedArray(size_t size, const typename V8TypedArrayTraits<T>::value_type* data = NULL) {
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

#define JS_PROP(name) \
  static NAN_GETTER(name##Getter); \
  static NAN_SETTER(name##Setter)

#define JS_UNWRAP(type, name) \
  N##type* n##name = ObjectWrap::Unwrap<N##type>(info.This()); n##name = n##name; \
  type* name = n##name->As<type>(); name = name;

#define JS_UNWRAPPED(info, type, name) \
  N##type* n##name = ObjectWrap::Unwrap<N##type>(JS_OBJ(info)); n##name = n##name; \
  __block type* name = n##name->As<type>(); name = name;

/*
#define JS_GETTER(type, name) \
NAN_GETTER(N##type::name##Getter) { \
  Nan::HandleScope scope; \
  N##type* nui = ObjectWrap::Unwrap<N##type>(info.This()); nui = nui; \
  type* ui = nui->As<type>(); ui = ui;

#define JS_GETTER_END(type, name) \
}*/

#define JS_SET_PROP(proto, jsName, cppName) \
  Nan::SetAccessor(proto, JS_STR(jsName), cppName##Getter, cppName##Setter);

#define JS_SET_PROP_READONLY(proto, jsName, cppName) \
  Nan::SetAccessor(proto, JS_STR(jsName), cppName##Getter);
  
#define JS_ASSIGN_PROP(proto, jsName) \
  Nan::SetAccessor(proto, JS_STR(#jsName), jsName##Getter, jsName##Setter);
  
#define JS_ASSIGN_PROP_READONLY(proto, jsName) \
  Nan::SetAccessor(proto, JS_STR(#jsName), jsName##Getter);
  
#define JS_SETTER(name) \
  NAN_SETTER(name##Setter)
  
#define JS_GETTER(name) \
  NAN_GETTER(name##Getter)


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

  void RunResInMainThread(uv_async_t *handle);
  void Resolve(Nan::Persistent<Function>* cb, bool shouldDelete = false);
  
  Local<Value> CallSync(Local<Function> cb, const char* methodName, int argc, Local<Value>* argv);
  
  void CallAsync(Nan::Global<Function>& cb, const char* methodName);
  void Kick();
  uint64_t nodeTick();
  void nodePump(Isolate* isolate);
}

struct Block_layout {
    void *isa;
    int flags;
    int reserved;
    void (*invoke)(void *, ...);
    struct Block_descriptor *descriptor;
};

typedef const Nan::FunctionCallbackInfo<v8::Value> & JSInfo;
typedef std::vector<Local<Value>> JSArgs;
namespace sweetiekit {
  typedef void (^BlockFunctionCallback)(JSInfo info);

  static Local<Function> FromBlock(const char* name, BlockFunctionCallback block) {
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
  
  static void Set(Local<Object> obj, const char* name, BlockFunctionCallback block) {
    Nan::HandleScope handleScope;
    obj->Set(JS_STR(name), FromBlock(name, block));
  }
}

namespace sweetiekit {
  static Local<Function> Rename(const char* name, Local<Function> fn) {
    Nan::HandleScope handleScope;
    fn->SetName(JS_STR(name));
    return fn;
  }
  class JSFunction
  {
     std::shared_ptr<Nan::Persistent<Function>> cb;
  public:
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
       Nan::HandleScope scope;
       cb.reset();
     }
    
     void Reset(Local<Function> fn) {
       Nan::HandleScope scope;
       cb.reset(new Nan::Persistent<Function>(fn));
     }
    
     void Reset(Local<Value> fn) {
       Nan::HandleScope scope;
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
     Local<Value> Call(const char* methodName, int argc, Local<Value>* argv) const {
       Nan::EscapableHandleScope scope;
       return scope.Escape(sweetiekit::CallSync(Get(), methodName, argc, argv));
     }
     Local<Value> operator()(const char* methodName, int argc, Local<Value>* argv) const {
       Nan::EscapableHandleScope scope;
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, argc, argv));
     }
     Local<Value> Call(const char* methodName, JSArgs& args) const {
       Nan::EscapableHandleScope scope;
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, (int)args.size(), args.empty() ? nullptr : &args[0]));
     }
     Local<Value> operator()(const char* methodName, JSArgs& args) const {
       Nan::EscapableHandleScope scope;
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, (int)args.size(), args.empty() ? nullptr : &args[0]));
     }
     Local<Value> Call(const char* methodName) const {
       Nan::EscapableHandleScope scope;
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, 0, nullptr));
     }
     Local<Value> operator()(const char* methodName) const {
       Nan::EscapableHandleScope scope;
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, 0, nullptr));
     }
     Local<Value> Call(const char* methodName, Local<Value> arg0) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, sizeof(argv)/sizeof(argv[0]), argv));
     }
     Local<Value> operator()(const char* methodName, Local<Value> arg0) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, sizeof(argv)/sizeof(argv[0]), argv));
     }
     Local<Value> Call(const char* methodName, Local<Value> arg0, Local<Value> arg1) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0, arg1 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, sizeof(argv)/sizeof(argv[0]), argv));
     }
     Local<Value> operator()(const char* methodName, Local<Value> arg0, Local<Value> arg1) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0, arg1 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, sizeof(argv)/sizeof(argv[0]), argv));
     }
     Local<Value> Call(const char* methodName, Local<Value> arg0, Local<Value> arg1, Local<Value> arg2) const {
       Nan::EscapableHandleScope scope;
      Local<Value> argv[] = { arg0, arg1, arg2 };
      return scope.Escape(sweetiekit::CallSync(Get(), methodName, sizeof(argv)/sizeof(argv[0]), argv));
     }
     Local<Value> operator()(const char* methodName, Local<Value> arg0, Local<Value> arg1, Local<Value> arg2) const {
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

namespace sweetiekit {
  Local<Value> GetWrapperFor(id pThing, Nan::Persistent<FunctionTemplate>& defaultType);
}

extern "C" {

void iOSLog0(const char* msg);

#include <dispatch/queue.h>
void dispatch_ui_sync(dispatch_queue_t queue, dispatch_block_t block);
#define dispatch_sync dispatch_ui_sync

bool NJSStringGetUTF8String(Local<Value> jsStr, std::string& outStr);

#ifdef __OBJC__
#import <CoreFoundation/CoreFoundation.h>
NSString* NJSStringToNSString(Local<Value> jsStr);
#endif

}

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
    
  extern bool SetTransform(simd_float4x4& transform, Local<Value> value);
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

  inline bool protocolImplementsProtocol(Protocol *candidate, Protocol *target)
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

  inline void forEachMethodInClass(Class cls, void (^callback)(Method))
  {
      unsigned count;
      auto methods = adoptSystem<Method[]>(class_copyMethodList(cls, &count));
      for (unsigned i = 0; i < count; ++i)
          callback(methods[i]);
  }

  inline void forEachPropertyInClass(Class cls, void (^callback)(objc_property_t))
  {
      unsigned count;
      auto properties = adoptSystem<objc_property_t[]>(class_copyPropertyList(cls, &count));
      for (unsigned i = 0; i < count; ++i)
          callback(properties[i]);
  }

  inline void forEachMethodInProtocol(Protocol *protocol, BOOL isRequiredMethod, BOOL isInstanceMethod, void (^callback)(SEL, const char*))
  {
      unsigned count;
      auto methods = adoptSystem<objc_method_description[]>(protocol_copyMethodDescriptionList(protocol, isRequiredMethod, isInstanceMethod, &count));
      for (unsigned i = 0; i < count; ++i)
          callback(methods[i].name, methods[i].types);
  }

  inline void forEachPropertyInProtocol(Protocol *protocol, void (^callback)(objc_property_t))
  {
      unsigned count;
      auto properties = adoptSystem<objc_property_t[]>(protocol_copyPropertyList(protocol, &count));
      for (unsigned i = 0; i < count; ++i)
          callback(properties[i]);
  }
}

#endif /* defines_h */
