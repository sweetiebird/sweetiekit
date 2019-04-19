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

using namespace v8;

#define JS_STR(...) Nan::New<v8::String>(__VA_ARGS__).ToLocalChecked()
#define JS_INT(val) Nan::New<v8::Integer>(val)
#define JS_NUM(val) Nan::New<v8::Number>(val)
#define JS_FLOAT(val) Nan::New<v8::Number>(val)
#define JS_BOOL(val) Nan::New<v8::Boolean>(val)
#define JS_OBJ(val) Nan::To<v8::Object>(val).ToLocalChecked()
#define JS_TYPE(name) (Nan::New(name::type)->GetFunction(Isolate::GetCurrent()->GetCurrentContext()).ToLocalChecked())
#define JS_FUNC(x) ((x)->GetFunction(Isolate::GetCurrent()->GetCurrentContext()).ToLocalChecked())

#define JS_CONTEXT() (Isolate::GetCurrent()->GetCurrentContext())

#define TO_DOUBLE(x) (Nan::To<double>(x).FromJust())
#define TO_BOOL(x) (Nan::To<bool>(x).FromJust())
#define TO_UINT32(x) (Nan::To<unsigned int>(x).FromJust())
#define TO_INT32(x) (Nan::To<int>(x).FromJust())
#define TO_FLOAT(x) static_cast<float>((Nan::To<double>(x).FromJust()))

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

#define JS_WRAP_CLASS(name) \
using namespace v8; \
using namespace node; \
\
extern Local<Object> make##name(); \
\
class N##name : public ObjectWrap { \
public: \
  N##name(); \
  ~N##name(); \
 \
  name* me; \
  static Nan::Persistent<FunctionTemplate> type; \
  static Local<Object> Initialize(Isolate *isolate); \
  static NAN_METHOD(New);
  
  
#define JS_WRAP_CLASS_END(name) \
};

#include <array>
#include <deque>
#include <mutex>
#include <thread>

namespace sweetiekit {
  extern uv_sem_t reqSem;
  extern uv_async_t resAsync;
  extern std::mutex reqMutex;
  extern std::mutex resMutex;
  extern std::deque<std::function<void()>> reqCbs;
  extern std::deque<std::function<void()>> resCbs;
  extern std::thread reqThead;

  void RunResInMainThread(uv_async_t *handle);
  void Resolve(Nan::Persistent<Function>* cb);
  void Kick();
}

extern "C" void iOSLog0(const char* msg);

#endif /* defines_h */
