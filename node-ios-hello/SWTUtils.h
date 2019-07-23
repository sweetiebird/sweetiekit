//
//  SWTUtils.h
//  node-ios-hello
//
//  Created by Emily Kolar on 7/10/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef SWTUtils_h
#define SWTUtils_h

namespace sweetiekit
{
  void setup(v8::Isolate* isolate, v8::Local<v8::Context> context, struct uv_loop_s* loop);
  Isolate* currentIsolate();
  Local<Context> currentContext(Isolate* isolate_ = currentIsolate());
}

class EnterNode {
public:
  v8::Isolate* isolate_;
  v8::Persistent<v8::Context> context_;

  EnterNode(v8::Isolate* isolate = sweetiekit::currentIsolate(), v8::Local<v8::Context> context = sweetiekit::currentContext())
      : isolate_(isolate),
        context_(isolate, context)
  {
  }

  virtual ~EnterNode()
  {
  }
  
  virtual void OnRun() = 0;

  virtual void Run() {
    Isolate* isolate_(sweetiekit::currentIsolate());
    v8::Locker locker(isolate_);
    isolate_->Enter();
    assert(isolate_ == v8::Isolate::GetCurrent());
    v8::HandleScope handle_scope(isolate_);
    Local<Context> context(sweetiekit::currentContext());
    v8::Context::Scope context_scope(context);
    OnRun();
    isolate_->Exit();
  }
};


#if __OBJC__
typedef void (^BlockCallback)();

class EnterNodeWithBlock : public EnterNode {
public:
  BlockCallback block_;


  EnterNodeWithBlock(BlockCallback block,
    v8::Isolate* isolate = sweetiekit::currentIsolate(),
    v8::Local<v8::Context> context = sweetiekit::currentContext())
    : EnterNode(isolate, context)
    , block_(block)
  {
  }
  
  void OnRun() override {
    if (block_) {
      block_();
    }
  }
};
#endif



typedef char* char_ptr;
typedef const char* const_char_ptr;

#define js_value_const_char_ptr(x) js_value_NSString([NSString stringWithUTF8String:(x)])
#define to_value_const_char_ptr(x) [to_value_NSString(x) UTF8String]
#define is_value_const_char_ptr(x) is_value_NSString(x)


template <typename T> struct ConstPtrTraits;

template<typename T>
class ConstPtr
{
public:
  typedef std::vector<T> ValueVector;
  typedef ConstPtr<T> ConstValuePtr;
  
protected:
  mutable const T* m_pValue = nullptr;
  mutable ValueVector m_vValues;
  mutable bool m_bIsFromBackingStore = true;
  
  void Acquire(const ConstValuePtr& other) const
  {
    Reset();
    m_bIsFromBackingStore = other.m_bIsFromBackingStore;
    if (other.m_bIsFromBackingStore) {
      m_vValues = other.m_vValues;
    } else {
      m_pValue = other.m_pValue;
    }
  }

public:
  virtual ~ConstPtr()
  {
    Reset();
  }
  
  ConstPtr()
  {
  }
  
  ConstPtr(const T* value)
  {
    Reset(value);
  }
  
  ConstPtr(ConstValuePtr& other)
  {
    Acquire(other);
  }
  
  ConstPtr(const ConstValuePtr& other)
  {
    Acquire(other);
  }
  
  ConstPtr& operator =(ConstValuePtr& other)
  {
    Acquire(other);
    return *this;
  }
  
  operator const T*() const
  {
    return Get();
  }
  
  void Reset() const
  {
    m_pValue = nullptr;
    m_bIsFromBackingStore = true;
    m_vValues.clear();
  }
  
  void Reset(const T* value)
  {
    Reset();
    m_pValue = value;
  }
  
  void Reset(const ValueVector& values)
  {
    Reset();
    m_vValues = values;
    m_bIsFromBackingStore = true;
  }
  
  const T* Get() const
  {
    if (m_bIsFromBackingStore) {
      return &m_vValues[0];
    } else {
      return m_pValue;
    }
  }
  
  ValueVector& GetValues()
  {
    return m_vValues;
  }
public:
  static bool IsJS(const Local<Value>& value)
  {
    return ConstPtrTraits<T>::IsJS(value);
  }

  static void SetJS(ConstValuePtr& result, const Local<Value>& value)
  {
    return ConstPtrTraits<T>::SetJS(result, value);
  }

  static ConstValuePtr FromJS(const Local<Value>& value, bool* failed = nullptr, const char* errmsg = "Conversion failed")
  {
    ConstValuePtr result;
    
    if (failed) {
      *failed = false;
    }
    
    if (!IsJS(value)) {
      if (failed) {
        *failed = true;
      } else {
        Nan::ThrowError(errmsg);
      }
      return result;
    }
    SetJS(result, value);
    return result;
  }
};

template<> struct ConstPtrTraits<CGFloat>
{
  static bool IsJS(const Local<Value>& value)
  {
    if (value->IsFloat32Array()) {
      return true;
    } else if (value->IsFloat64Array()) {
      return true;
    } else if (value->IsArray()) {
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (!is_value_CGFloat(values->Get(i))) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  static void SetJS(ConstPtr<CGFloat>& result, const Local<Value>& value)
  {
    result.Reset();

    if (value->IsFloat32Array()) {
      ConstPtr<CGFloat>::ValueVector& results(result.GetValues());
      Local<Float32Array> values(Local<Float32Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        results.push_back(to_value_CGFloat(values->Get(i)));
      }
    } else if (value->IsFloat64Array()) {
      ConstPtr<CGFloat>::ValueVector& results(result.GetValues());
      Local<Float64Array> values(Local<Float64Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        results.push_back(to_value_CGFloat(values->Get(i)));
      }
    } else if (value->IsArray()) {
      ConstPtr<CGFloat>::ValueVector& results(result.GetValues());
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (is_value_CGFloat(values->Get(i))) {
          results.push_back(to_value_CGFloat(values->Get(i)));
        }
      }
    }
  }
};

template<> struct ConstPtrTraits<CGRect>
{
  static bool IsJS(const Local<Value>& value)
  {
    if (value->IsArray()) {
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (!is_value_CGRect(values->Get(i))) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  static void SetJS(ConstPtr<CGRect>& result, const Local<Value>& value)
  {
    if (value->IsArray()) {
      ConstPtr<CGRect>::ValueVector& results(result.GetValues());
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (is_value_CGRect(values->Get(i))) {
          results.push_back(to_value_CGRect(values->Get(i)));
        }
      }
    }
  }
};

template<> struct ConstPtrTraits<CGPoint>
{
  static bool IsJS(const Local<Value>& value)
  {
    if (value->IsArray()) {
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (!is_value_CGPoint(values->Get(i))) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  static void SetJS(ConstPtr<CGPoint>& result, const Local<Value>& value)
  {
    if (value->IsArray()) {
      ConstPtr<CGPoint>::ValueVector& results(result.GetValues());
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (is_value_CGPoint(values->Get(i))) {
          results.push_back(to_value_CGPoint(values->Get(i)));
        }
      }
    }
  }
};

template<> struct ConstPtrTraits<CGSize>
{
  static bool IsJS(const Local<Value>& value)
  {
    if (value->IsArray()) {
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (!is_value_CGSize(values->Get(i))) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  static void SetJS(ConstPtr<CGSize>& result, const Local<Value>& value)
  {
    if (value->IsArray()) {
      ConstPtr<CGSize>::ValueVector& results(result.GetValues());
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (is_value_CGSize(values->Get(i))) {
          results.push_back(to_value_CGSize(values->Get(i)));
        }
      }
    }
  }
};

#include "NCGFont.h"

template<> struct ConstPtrTraits<CGGlyph>
{
  static bool IsJS(const Local<Value>& value)
  {
    if (value->IsArray()) {
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (!is_value_CGGlyph(values->Get(i))) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  static void SetJS(ConstPtr<CGGlyph>& result, const Local<Value>& value)
  {
    if (value->IsArray()) {
      ConstPtr<CGGlyph>::ValueVector& results(result.GetValues());
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (is_value_CGGlyph(values->Get(i))) {
          results.push_back(to_value_CGGlyph(values->Get(i)));
        }
      }
    }
  }
};


typedef ConstPtr<CGFloat> const_CGFloat_ptr;
typedef ConstPtr<CGRect> const_CGRect_ptr;
typedef ConstPtr<CGPoint> const_CGPoint_ptr;
typedef ConstPtr<CGSize> const_CGSize_ptr;
typedef ConstPtr<CGGlyph> const_CGGlyph_ptr;

const_CGFloat_ptr to_value_const_CGFloat_ptr(Local<Value> x, bool* failed = nullptr);
bool is_value_const_CGFloat_ptr(Local<Value> x);

const_CGRect_ptr to_value_const_CGRect_ptr(Local<Value> x, bool* failed = nullptr);
bool is_value_const_CGRect_ptr(Local<Value> x);

const_CGPoint_ptr to_value_const_CGPoint_ptr(Local<Value> x, bool* failed = nullptr);
bool is_value_const_CGPoint_ptr(Local<Value> x);

const_CGSize_ptr to_value_const_CGSize_ptr(Local<Value> x, bool* failed = nullptr);
bool is_value_const_CGSize_ptr(Local<Value> x);

const_CGGlyph_ptr to_value_const_CGGlyph_ptr(Local<Value> x, bool* failed = nullptr);
bool is_value_const_CGGlyph_ptr(Local<Value> x);




template<> struct ConstPtrTraits<uint32_t>
{
  static bool IsJS(const Local<Value>& value)
  {
    if (value->IsUint32Array()) {
      return true;
    } else if (value->IsArray()) {
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (!is_value_uint32_t(values->Get(i))) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  static void SetJS(ConstPtr<uint32_t>& result, const Local<Value>& value)
  {
    result.Reset();

    if (value->IsUint32Array()) {
      ConstPtr<uint32_t>::ValueVector& results(result.GetValues());
      Local<Uint32Array> values(Local<Uint32Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        results.push_back(to_value_uint32_t(values->Get(i)));
      }
    } else if (value->IsArray()) {
      ConstPtr<uint32_t>::ValueVector& results(result.GetValues());
      Local<Array> values(Local<Array>::Cast(value));
      uint32_t length(static_cast<uint32_t>(values->Length()));
      for (uint32_t i = 0; i < length; i++) {
        if (is_value_uint32_t(values->Get(i))) {
          results.push_back(to_value_uint32_t(values->Get(i)));
        }
      }
    }
  }
};


typedef ConstPtr<uint32_t> const_uint32_t_ptr;

const_uint32_t_ptr to_value_const_uint32_t_ptr(Local<Value> x, bool* failed = nullptr);
bool is_value_const_uint32_t_ptr(Local<Value> x);



#endif /* SWTUtils_h */
