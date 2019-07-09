//
//  NCGContext.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCGContext.h"

#define js_return_value(type, x) JS_SET_RETURN(js_value_##type(x))

#include "NCFBase.h"

typedef char* char_ptr;
typedef const char* const_char_ptr;

#define js_value_const_char_ptr(x) js_value_NSString(x)
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



const_CGFloat_ptr to_value_const_CGFloat_ptr(Local<Value> x, bool* failed) {
  return const_CGFloat_ptr::FromJS(x, failed, "Expected CGFloat");
}

bool is_value_const_CGFloat_ptr(Local<Value> x) {
  return const_CGFloat_ptr::IsJS(x);
}

const_CGRect_ptr to_value_const_CGRect_ptr(Local<Value> x, bool* failed) {
  return const_CGRect_ptr::FromJS(x, failed, "Expected CGRect");
}

bool is_value_const_CGRect_ptr(Local<Value> x) {
  return const_CGRect_ptr::IsJS(x);
}

const_CGPoint_ptr to_value_const_CGPoint_ptr(Local<Value> x, bool* failed) {
  return const_CGPoint_ptr::FromJS(x, failed, "Expected CGPoint");
}

bool is_value_const_CGPoint_ptr(Local<Value> x) {
  return const_CGPoint_ptr::IsJS(x);
}

const_CGSize_ptr to_value_const_CGSize_ptr(Local<Value> x, bool* failed) {
  return const_CGSize_ptr::FromJS(x, failed, "Expected CGSize");
}

bool is_value_const_CGSize_ptr(Local<Value> x) {
  return const_CGSize_ptr::IsJS(x);
}

const_CGGlyph_ptr to_value_const_CGGlyph_ptr(Local<Value> x, bool* failed) {
  return const_CGGlyph_ptr::FromJS(x, failed, "Expected CGGlyph");
}

bool is_value_const_CGGlyph_ptr(Local<Value> x) {
  return const_CGGlyph_ptr::IsJS(x);
}


#include "NCGImage.h" // TODO: for CFTypeID. Refactor this.

//CG_EXTERN CFTypeID CGContextGetTypeID(void,)
NAN_METHOD(CGContextGetTypeID) {
  declare_autoreleasepool {
    declare_args();
    js_return_value(CFTypeID, ::CGContextGetTypeID());
  }
}

//CG_EXTERN void CGContextSaveGState(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextSaveGState) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextSaveGState(c);
  }
}

//CG_EXTERN void CGContextRestoreGState(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextRestoreGState) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextRestoreGState(c);
  }
}

//CG_EXTERN void CGContextScaleCTM(CGContextRef cg_nullable c, CGFloat sx, CGFloat sy,)
NAN_METHOD(CGContextScaleCTM) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, sx);
    declare_value(CGFloat, sy);
    ::CGContextScaleCTM(c, sx, sy);
  }
}

//CG_EXTERN void CGContextTranslateCTM(CGContextRef cg_nullable c, CGFloat tx, CGFloat ty,)
NAN_METHOD(CGContextTranslateCTM) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, tx);
    declare_value(CGFloat, ty);
    ::CGContextTranslateCTM(c, tx, ty);
  }
}

//CG_EXTERN void CGContextRotateCTM(CGContextRef cg_nullable c, CGFloat angle,)
NAN_METHOD(CGContextRotateCTM) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, angle);
    ::CGContextRotateCTM(c, angle);
  }
}

//CG_EXTERN void CGContextConcatCTM(CGContextRef cg_nullable c, CGAffineTransform transform,)
NAN_METHOD(CGContextConcatCTM) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGAffineTransform, transform);
    ::CGContextConcatCTM(c, transform);
  }
}

//CG_EXTERN CGAffineTransform CGContextGetCTM(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextGetCTM) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    js_return_value(CGAffineTransform, ::CGContextGetCTM(c));
  }
}

//CG_EXTERN void CGContextSetLineWidth(CGContextRef cg_nullable c, CGFloat width,)
NAN_METHOD(CGContextSetLineWidth) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, width);
    ::CGContextSetLineWidth(c, width);
  }
}

#include "NCGPath.h"

//CG_EXTERN void CGContextSetLineCap(CGContextRef cg_nullable c, CGLineCap cap,)
NAN_METHOD(CGContextSetLineCap) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGLineCap, cap);
    ::CGContextSetLineCap(c, cap);
  }
}

//CG_EXTERN void CGContextSetLineJoin(CGContextRef cg_nullable c, CGLineJoin join,)
NAN_METHOD(CGContextSetLineJoin) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGLineJoin, join);
    ::CGContextSetLineJoin(c, join);
  }
}

//CG_EXTERN void CGContextSetMiterLimit(CGContextRef cg_nullable c, CGFloat limit,)
NAN_METHOD(CGContextSetMiterLimit) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, limit);
    ::CGContextSetMiterLimit(c, limit);
  }
}

//CG_EXTERN void CGContextSetLineDash(CGContextRef cg_nullable c, CGFloat phase, const CGFloat * __nullable lengths, size_t count,)
NAN_METHOD(CGContextSetLineDash) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, phase);
    declare_nullable_value(const_CGFloat_ptr, lengths);
    declare_value(size_t, count);
    ::CGContextSetLineDash(c, phase, lengths, count);
  }
}

//CG_EXTERN void CGContextSetFlatness(CGContextRef cg_nullable c, CGFloat flatness,)
NAN_METHOD(CGContextSetFlatness) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, flatness);
    ::CGContextSetFlatness(c, flatness);
  }
}

//CG_EXTERN void CGContextSetAlpha(CGContextRef cg_nullable c, CGFloat alpha,)
NAN_METHOD(CGContextSetAlpha) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, alpha);
    ::CGContextSetAlpha(c, alpha);
  }
}

//CG_EXTERN void CGContextSetBlendMode(CGContextRef cg_nullable c, CGBlendMode mode,)
NAN_METHOD(CGContextSetBlendMode) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGBlendMode, mode);
    ::CGContextSetBlendMode(c, mode);
  }
}

//CG_EXTERN void CGContextBeginPath(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextBeginPath) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextBeginPath(c);
  }
}

//CG_EXTERN void CGContextMoveToPoint(CGContextRef cg_nullable c, CGFloat x, CGFloat y,)
NAN_METHOD(CGContextMoveToPoint) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, x);
    declare_value(CGFloat, y);
    ::CGContextMoveToPoint(c, x, y);
  }
}

//CG_EXTERN void CGContextAddLineToPoint(CGContextRef cg_nullable c, CGFloat x, CGFloat y,)
NAN_METHOD(CGContextAddLineToPoint) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, x);
    declare_value(CGFloat, y);
    ::CGContextAddLineToPoint(c, x, y);
  }
}

//CG_EXTERN void CGContextAddCurveToPoint(CGContextRef cg_nullable c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y,)
NAN_METHOD(CGContextAddCurveToPoint) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, cp1x);
    declare_value(CGFloat, cp1y);
    declare_value(CGFloat, cp2x);
    declare_value(CGFloat, cp2y);
    declare_value(CGFloat, x);
    declare_value(CGFloat, y);
    ::CGContextAddCurveToPoint(c, cp1x, cp1y, cp2x, cp2y, x, y);
  }
}

//CG_EXTERN void CGContextAddQuadCurveToPoint(CGContextRef cg_nullable c, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y,)
NAN_METHOD(CGContextAddQuadCurveToPoint) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, cpx);
    declare_value(CGFloat, cpy);
    declare_value(CGFloat, x);
    declare_value(CGFloat, y);
    ::CGContextAddQuadCurveToPoint(c, cpx, cpy, x, y);
  }
}

//CG_EXTERN void CGContextClosePath(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextClosePath) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextClosePath(c);
  }
}

//CG_EXTERN void CGContextAddRect(CGContextRef cg_nullable c, CGRect rect,)
NAN_METHOD(CGContextAddRect) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    ::CGContextAddRect(c, rect);
  }
}

//CG_EXTERN void CGContextAddRects(CGContextRef cg_nullable c, const CGRect * __nullable rects, size_t count,)
NAN_METHOD(CGContextAddRects) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_CGRect_ptr, rects);
    declare_value(size_t, count);
    ::CGContextAddRects(c, rects, count);
  }
}

//CG_EXTERN void CGContextAddLines(CGContextRef cg_nullable c, const CGPoint * __nullable points, size_t count,)
NAN_METHOD(CGContextAddLines) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_CGPoint_ptr, points);
    declare_value(size_t, count);
    ::CGContextAddLines(c, points, count);
  }
}

//CG_EXTERN void CGContextAddEllipseInRect(CGContextRef cg_nullable c, CGRect rect,)
NAN_METHOD(CGContextAddEllipseInRect) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    ::CGContextAddEllipseInRect(c, rect);
  }
}

//CG_EXTERN void CGContextAddArc(CGContextRef cg_nullable c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise,)
NAN_METHOD(CGContextAddArc) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, x);
    declare_value(CGFloat, y);
    declare_value(CGFloat, radius);
    declare_value(CGFloat, startAngle);
    declare_value(CGFloat, endAngle);
    declare_value(int, clockwise);
    ::CGContextAddArc(c, x, y, radius, startAngle, endAngle, clockwise);
  }
}

//CG_EXTERN void CGContextAddArcToPoint(CGContextRef cg_nullable c, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius,)
NAN_METHOD(CGContextAddArcToPoint) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, x1);
    declare_value(CGFloat, y1);
    declare_value(CGFloat, x2);
    declare_value(CGFloat, y2);
    declare_value(CGFloat, radius);
    ::CGContextAddArcToPoint(c, x1, y1, x2, y2, radius);
  }
}

//CG_EXTERN void CGContextAddPath(CGContextRef cg_nullable c, CGPathRef cg_nullable path,)
NAN_METHOD(CGContextAddPath) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGPathRef, path);
    ::CGContextAddPath(c, path);
  }
}

//CG_EXTERN void CGContextReplacePathWithStrokedPath(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextReplacePathWithStrokedPath) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextReplacePathWithStrokedPath(c);
  }
}

//CG_EXTERN bool CGContextIsPathEmpty(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextIsPathEmpty) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    js_return_value(bool, ::CGContextIsPathEmpty(c));
  }
}

//CG_EXTERN CGPoint CGContextGetPathCurrentPoint(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextGetPathCurrentPoint) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    js_return_value(CGPoint, ::CGContextGetPathCurrentPoint(c));
  }
}

//CG_EXTERN CGRect CGContextGetPathBoundingBox(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextGetPathBoundingBox) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    js_return_value(CGRect, ::CGContextGetPathBoundingBox(c));
  }
}

//CG_EXTERN CGPathRef __nullable CGContextCopyPath(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextCopyPath) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    js_return_value(CGPathRef, ::CGContextCopyPath(c));
  }
}

//CG_EXTERN bool CGContextPathContainsPoint(CGContextRef cg_nullable c, CGPoint point, CGPathDrawingMode mode,)
NAN_METHOD(CGContextPathContainsPoint) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGPoint, point);
    declare_value(CGPathDrawingMode, mode);
    js_return_value(bool, ::CGContextPathContainsPoint(c, point, mode));
  }
}

//CG_EXTERN void CGContextDrawPath(CGContextRef cg_nullable c, CGPathDrawingMode mode,)
NAN_METHOD(CGContextDrawPath) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGPathDrawingMode, mode);
    ::CGContextDrawPath(c, mode);
  }
}

//CG_EXTERN void CGContextFillPath(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextFillPath) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextFillPath(c);
  }
}

//CG_EXTERN void CGContextEOFillPath(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextEOFillPath) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextEOFillPath(c);
  }
}

//CG_EXTERN void CGContextStrokePath(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextStrokePath) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextStrokePath(c);
  }
}

//CG_EXTERN void CGContextFillRect(CGContextRef cg_nullable c, CGRect rect,)
NAN_METHOD(CGContextFillRect) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    ::CGContextFillRect(c, rect);
  }
}

//CG_EXTERN void CGContextFillRects(CGContextRef cg_nullable c, const CGRect * __nullable rects, size_t count,)
NAN_METHOD(CGContextFillRects) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_CGRect_ptr, rects);
    declare_value(size_t, count);
    ::CGContextFillRects(c, rects, count);
  }
}

//CG_EXTERN void CGContextStrokeRect(CGContextRef cg_nullable c, CGRect rect,)
NAN_METHOD(CGContextStrokeRect) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    ::CGContextStrokeRect(c, rect);
  }
}

//CG_EXTERN void CGContextStrokeRectWithWidth(CGContextRef cg_nullable c, CGRect rect, CGFloat width,)
NAN_METHOD(CGContextStrokeRectWithWidth) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    declare_value(CGFloat, width);
    ::CGContextStrokeRectWithWidth(c, rect, width);
  }
}

//CG_EXTERN void CGContextClearRect(CGContextRef cg_nullable c, CGRect rect,)
NAN_METHOD(CGContextClearRect) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    ::CGContextClearRect(c, rect);
  }
}

//CG_EXTERN void CGContextFillEllipseInRect(CGContextRef cg_nullable c, CGRect rect,)
NAN_METHOD(CGContextFillEllipseInRect) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    ::CGContextFillEllipseInRect(c, rect);
  }
}

//CG_EXTERN void CGContextStrokeEllipseInRect(CGContextRef cg_nullable c, CGRect rect,)
NAN_METHOD(CGContextStrokeEllipseInRect) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    ::CGContextStrokeEllipseInRect(c, rect);
  }
}

//CG_EXTERN void CGContextStrokeLineSegments(CGContextRef cg_nullable c, const CGPoint * __nullable points, size_t count,)
NAN_METHOD(CGContextStrokeLineSegments) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_CGPoint_ptr, points);
    declare_value(size_t, count);
    ::CGContextStrokeLineSegments(c, points, count);
  }
}

//CG_EXTERN void CGContextClip(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextClip) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextClip(c);
  }
}

//CG_EXTERN void CGContextEOClip(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextEOClip) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextEOClip(c);
  }
}

//CG_EXTERN void CGContextResetClip(CGContextRef c);
NAN_METHOD(CGContextResetClip) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextResetClip(c);
  }
}

//CG_EXTERN void CGContextClipToMask(CGContextRef cg_nullable c, CGRect rect, CGImageRef cg_nullable mask,)
NAN_METHOD(CGContextClipToMask) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    declare_nullable_value(CGImageRef, mask);
    ::CGContextClipToMask(c, rect, mask);
  }
}

//CG_EXTERN CGRect CGContextGetClipBoundingBox(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextGetClipBoundingBox) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    js_return_value(CGRect, ::CGContextGetClipBoundingBox(c));
  }
}

//CG_EXTERN void CGContextClipToRect(CGContextRef cg_nullable c, CGRect rect,)
NAN_METHOD(CGContextClipToRect) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    ::CGContextClipToRect(c, rect);
  }
}

//CG_EXTERN void CGContextClipToRects(CGContextRef cg_nullable c, const CGRect *  rects, size_t count,)
NAN_METHOD(CGContextClipToRects) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(const_CGRect_ptr , rects);
    declare_value(size_t, count);
    ::CGContextClipToRects(c, rects, count);
  }
}

//CG_EXTERN void CGContextSetFillColorWithColor(CGContextRef cg_nullable c, CGColorRef cg_nullable color,)
NAN_METHOD(CGContextSetFillColorWithColor) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGColorRef, color);
    ::CGContextSetFillColorWithColor(c, color);
  }
}

//CG_EXTERN void CGContextSetStrokeColorWithColor(CGContextRef cg_nullable c, CGColorRef cg_nullable color,)
NAN_METHOD(CGContextSetStrokeColorWithColor) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGColorRef, color);
    ::CGContextSetStrokeColorWithColor(c, color);
  }
}

//CG_EXTERN void CGContextSetFillColorSpace(CGContextRef cg_nullable c, CGColorSpaceRef cg_nullable space,)
NAN_METHOD(CGContextSetFillColorSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGColorSpaceRef, space);
    ::CGContextSetFillColorSpace(c, space);
  }
}

//CG_EXTERN void CGContextSetStrokeColorSpace(CGContextRef cg_nullable c, CGColorSpaceRef cg_nullable space,)
NAN_METHOD(CGContextSetStrokeColorSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGColorSpaceRef, space);
    ::CGContextSetStrokeColorSpace(c, space);
  }
}

//CG_EXTERN void CGContextSetFillColor(CGContextRef cg_nullable c, const CGFloat * cg_nullable components,)
NAN_METHOD(CGContextSetFillColor) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_CGFloat_ptr, components);
    ::CGContextSetFillColor(c, components);
  }
}

//CG_EXTERN void CGContextSetStrokeColor(CGContextRef cg_nullable c, const CGFloat * cg_nullable components,)
NAN_METHOD(CGContextSetStrokeColor) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_CGFloat_ptr, components);
    ::CGContextSetStrokeColor(c, components);
  }
}

#include "NCGPattern.h"

//CG_EXTERN void CGContextSetFillPattern(CGContextRef cg_nullable c, CGPatternRef cg_nullable pattern, const CGFloat * cg_nullable components,)
NAN_METHOD(CGContextSetFillPattern) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGPatternRef, pattern);
    declare_nullable_value(const_CGFloat_ptr, components);
    ::CGContextSetFillPattern(c, pattern, components);
  }
}

//CG_EXTERN void CGContextSetStrokePattern(CGContextRef cg_nullable c, CGPatternRef cg_nullable pattern, const CGFloat * cg_nullable components,)
NAN_METHOD(CGContextSetStrokePattern) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGPatternRef, pattern);
    declare_nullable_value(const_CGFloat_ptr, components);
    ::CGContextSetStrokePattern(c, pattern, components);
  }
}

//CG_EXTERN void CGContextSetPatternPhase(CGContextRef cg_nullable c, CGSize phase,)
NAN_METHOD(CGContextSetPatternPhase) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGSize, phase);
    ::CGContextSetPatternPhase(c, phase);
  }
}

//CG_EXTERN void CGContextSetGrayFillColor(CGContextRef cg_nullable c, CGFloat gray, CGFloat alpha,)
NAN_METHOD(CGContextSetGrayFillColor) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, gray);
    declare_value(CGFloat, alpha);
    ::CGContextSetGrayFillColor(c, gray, alpha);
  }
}

//CG_EXTERN void CGContextSetGrayStrokeColor(CGContextRef cg_nullable c, CGFloat gray, CGFloat alpha,)
NAN_METHOD(CGContextSetGrayStrokeColor) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, gray);
    declare_value(CGFloat, alpha);
    ::CGContextSetGrayStrokeColor(c, gray, alpha);
  }
}

//CG_EXTERN void CGContextSetRGBFillColor(CGContextRef cg_nullable c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha,)
NAN_METHOD(CGContextSetRGBFillColor) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, red);
    declare_value(CGFloat, green);
    declare_value(CGFloat, blue);
    declare_value(CGFloat, alpha);
    ::CGContextSetRGBFillColor(c, red, green, blue, alpha);
  }
}

//CG_EXTERN void CGContextSetRGBStrokeColor(CGContextRef cg_nullable c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha,)
NAN_METHOD(CGContextSetRGBStrokeColor) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, red);
    declare_value(CGFloat, green);
    declare_value(CGFloat, blue);
    declare_value(CGFloat, alpha);
    ::CGContextSetRGBStrokeColor(c, red, green, blue, alpha);
  }
}

//CG_EXTERN void CGContextSetCMYKFillColor(CGContextRef cg_nullable c, CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat black, CGFloat alpha,)
NAN_METHOD(CGContextSetCMYKFillColor) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, cyan);
    declare_value(CGFloat, magenta);
    declare_value(CGFloat, yellow);
    declare_value(CGFloat, black);
    declare_value(CGFloat, alpha);
    ::CGContextSetCMYKFillColor(c, cyan, magenta, yellow, black, alpha);
  }
}

//CG_EXTERN void CGContextSetCMYKStrokeColor(CGContextRef cg_nullable c, CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat black, CGFloat alpha,)
NAN_METHOD(CGContextSetCMYKStrokeColor) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, cyan);
    declare_value(CGFloat, magenta);
    declare_value(CGFloat, yellow);
    declare_value(CGFloat, black);
    declare_value(CGFloat, alpha);
    ::CGContextSetCMYKStrokeColor(c, cyan, magenta, yellow, black, alpha);
  }
}

#include "NCGColorSpace.h"

//CG_EXTERN void CGContextSetRenderingIntent(CGContextRef cg_nullable c, CGColorRenderingIntent intent,)
NAN_METHOD(CGContextSetRenderingIntent) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGColorRenderingIntent, intent);
    ::CGContextSetRenderingIntent(c, intent);
  }
}

//CG_EXTERN void CGContextDrawImage(CGContextRef cg_nullable c, CGRect rect, CGImageRef cg_nullable image,)
NAN_METHOD(CGContextDrawImage) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    declare_nullable_value(CGImageRef, image);
    ::CGContextDrawImage(c, rect, image);
  }
}

//CG_EXTERN void CGContextDrawTiledImage(CGContextRef cg_nullable c, CGRect rect, CGImageRef cg_nullable image,)
NAN_METHOD(CGContextDrawTiledImage) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    declare_nullable_value(CGImageRef, image);
    ::CGContextDrawTiledImage(c, rect, image);
  }
}

//CG_EXTERN CGInterpolationQuality CGContextGetInterpolationQuality(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextGetInterpolationQuality) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    js_return_value(CGInterpolationQuality, ::CGContextGetInterpolationQuality(c));
  }
}

//CG_EXTERN void CGContextSetInterpolationQuality(CGContextRef cg_nullable c, CGInterpolationQuality quality,)
NAN_METHOD(CGContextSetInterpolationQuality) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGInterpolationQuality, quality);
    ::CGContextSetInterpolationQuality(c, quality);
  }
}

//CG_EXTERN void CGContextSetShadowWithColor(CGContextRef cg_nullable c, CGSize offset, CGFloat blur, CGColorRef __nullable color,)
NAN_METHOD(CGContextSetShadowWithColor) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGSize, offset);
    declare_value(CGFloat, blur);
    declare_nullable_value(CGColorRef, color);
    ::CGContextSetShadowWithColor(c, offset, blur, color);
  }
}

//CG_EXTERN void CGContextSetShadow(CGContextRef cg_nullable c, CGSize offset, CGFloat blur,)
NAN_METHOD(CGContextSetShadow) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGSize, offset);
    declare_value(CGFloat, blur);
    ::CGContextSetShadow(c, offset, blur);
  }
}

#include "NCGGradient.h"

//CG_EXTERN void CGContextDrawLinearGradient(CGContextRef cg_nullable c, CGGradientRef cg_nullable gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options,)
NAN_METHOD(CGContextDrawLinearGradient) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGGradientRef, gradient);
    declare_value(CGPoint, startPoint);
    declare_value(CGPoint, endPoint);
    declare_value(CGGradientDrawingOptions, options);
    ::CGContextDrawLinearGradient(c, gradient, startPoint, endPoint, options);
  }
}

//CG_EXTERN void CGContextDrawRadialGradient(CGContextRef cg_nullable c, CGGradientRef cg_nullable gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options,)
NAN_METHOD(CGContextDrawRadialGradient) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGGradientRef, gradient);
    declare_value(CGPoint, startCenter);
    declare_value(CGFloat, startRadius);
    declare_value(CGPoint, endCenter);
    declare_value(CGFloat, endRadius);
    declare_value(CGGradientDrawingOptions, options);
    ::CGContextDrawRadialGradient(c, gradient, startCenter, startRadius, endCenter, endRadius, options);
  }
}

#include "NCGShading.h"

//CG_EXTERN void CGContextDrawShading(CGContextRef cg_nullable c, cg_nullable CGShadingRef shading,)
NAN_METHOD(CGContextDrawShading) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGShadingRef, shading);
    ::CGContextDrawShading(c, shading);
  }
}

//CG_EXTERN void CGContextSetCharacterSpacing(CGContextRef cg_nullable c, CGFloat spacing,)
NAN_METHOD(CGContextSetCharacterSpacing) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, spacing);
    ::CGContextSetCharacterSpacing(c, spacing);
  }
}

//CG_EXTERN void CGContextSetTextPosition(CGContextRef cg_nullable c, CGFloat x, CGFloat y,)
NAN_METHOD(CGContextSetTextPosition) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, x);
    declare_value(CGFloat, y);
    ::CGContextSetTextPosition(c, x, y);
  }
}

//CG_EXTERN CGPoint CGContextGetTextPosition(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextGetTextPosition) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    js_return_value(CGPoint, ::CGContextGetTextPosition(c));
  }
}

//CG_EXTERN void CGContextSetTextMatrix(CGContextRef cg_nullable c, CGAffineTransform t,)
NAN_METHOD(CGContextSetTextMatrix) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGAffineTransform, t);
    ::CGContextSetTextMatrix(c, t);
  }
}

//CG_EXTERN CGAffineTransform CGContextGetTextMatrix(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextGetTextMatrix) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    js_return_value(CGAffineTransform, ::CGContextGetTextMatrix(c));
  }
}

//CG_EXTERN void CGContextSetTextDrawingMode(CGContextRef cg_nullable c, CGTextDrawingMode mode,)
NAN_METHOD(CGContextSetTextDrawingMode) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGTextDrawingMode, mode);
    ::CGContextSetTextDrawingMode(c, mode);
  }
}

//CG_EXTERN void CGContextSetFont(CGContextRef cg_nullable c, CGFontRef cg_nullable font,)
NAN_METHOD(CGContextSetFont) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGFontRef, font);
    ::CGContextSetFont(c, font);
  }
}

//CG_EXTERN void CGContextSetFontSize(CGContextRef cg_nullable c, CGFloat size,)
NAN_METHOD(CGContextSetFontSize) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, size);
    ::CGContextSetFontSize(c, size);
  }
}

//CG_EXTERN void CGContextShowGlyphsAtPositions(CGContextRef cg_nullable c, const CGGlyph * cg_nullable glyphs, const CGPoint * cg_nullable Lpositions, size_t count,)
NAN_METHOD(CGContextShowGlyphsAtPositions) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_CGGlyph_ptr, glyphs);
    declare_nullable_value(const_CGPoint_ptr, Lpositions);
    declare_value(size_t, count);
    ::CGContextShowGlyphsAtPositions(c, glyphs, Lpositions, count);
  }
}

#include "NCGPDFPage.h"

//CG_EXTERN void CGContextDrawPDFPage(CGContextRef cg_nullable c, CGPDFPageRef cg_nullable page,)
NAN_METHOD(CGContextDrawPDFPage) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CGPDFPageRef, page);
    ::CGContextDrawPDFPage(c, page);
  }
}

//CG_EXTERN void CGContextBeginPage(CGContextRef cg_nullable c, const CGRect * __nullable mediaBox,)
NAN_METHOD(CGContextBeginPage) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_CGRect_ptr, mediaBox);
    ::CGContextBeginPage(c, mediaBox);
  }
}

//CG_EXTERN void CGContextEndPage(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextEndPage) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextEndPage(c);
  }
}

//CG_EXTERN CGContextRef cg_nullable CGContextRetain(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextRetain) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    js_return_value(CGContextRef, ::CGContextRetain(c));
  }
}

//CG_EXTERN void CGContextRelease(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextRelease) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextRelease(c);
  }
}

//CG_EXTERN void CGContextFlush(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextFlush) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextFlush(c);
  }
}

//CG_EXTERN void CGContextSynchronize(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextSynchronize) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextSynchronize(c);
  }
}

//CG_EXTERN void CGContextSetShouldAntialias(CGContextRef cg_nullable c, bool shouldAntialias,)
NAN_METHOD(CGContextSetShouldAntialias) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(bool, shouldAntialias);
    ::CGContextSetShouldAntialias(c, shouldAntialias);
  }
}

//CG_EXTERN void CGContextSetAllowsAntialiasing(CGContextRef cg_nullable c, bool allowsAntialiasing,)
NAN_METHOD(CGContextSetAllowsAntialiasing) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(bool, allowsAntialiasing);
    ::CGContextSetAllowsAntialiasing(c, allowsAntialiasing);
  }
}

//CG_EXTERN void CGContextSetShouldSmoothFonts(CGContextRef cg_nullable c, bool shouldSmoothFonts,)
NAN_METHOD(CGContextSetShouldSmoothFonts) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(bool, shouldSmoothFonts);
    ::CGContextSetShouldSmoothFonts(c, shouldSmoothFonts);
  }
}

//CG_EXTERN void CGContextSetAllowsFontSmoothing(CGContextRef cg_nullable c, bool allowsFontSmoothing,)
NAN_METHOD(CGContextSetAllowsFontSmoothing) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(bool, allowsFontSmoothing);
    ::CGContextSetAllowsFontSmoothing(c, allowsFontSmoothing);
  }
}

//CG_EXTERN void CGContextSetShouldSubpixelPositionFonts( CGContextRef cg_nullable c, bool shouldSubpixelPositionFonts,)
NAN_METHOD(CGContextSetShouldSubpixelPositionFonts) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(bool, shouldSubpixelPositionFonts);
    ::CGContextSetShouldSubpixelPositionFonts(c, shouldSubpixelPositionFonts);
  }
}

//CG_EXTERN void CGContextSetAllowsFontSubpixelPositioning( CGContextRef cg_nullable c, bool allowsFontSubpixelPositioning,)
NAN_METHOD(CGContextSetAllowsFontSubpixelPositioning) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(bool, allowsFontSubpixelPositioning);
    ::CGContextSetAllowsFontSubpixelPositioning(c, allowsFontSubpixelPositioning);
  }
}

//CG_EXTERN void CGContextSetShouldSubpixelQuantizeFonts( CGContextRef cg_nullable c, bool shouldSubpixelQuantizeFonts,)
NAN_METHOD(CGContextSetShouldSubpixelQuantizeFonts) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(bool, shouldSubpixelQuantizeFonts);
    ::CGContextSetShouldSubpixelQuantizeFonts(c, shouldSubpixelQuantizeFonts);
  }
}

//CG_EXTERN void CGContextSetAllowsFontSubpixelQuantization( CGContextRef cg_nullable c, bool allowsFontSubpixelQuantization,)
NAN_METHOD(CGContextSetAllowsFontSubpixelQuantization) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(bool, allowsFontSubpixelQuantization);
    ::CGContextSetAllowsFontSubpixelQuantization(c, allowsFontSubpixelQuantization);
  }
}

#include "NCFDictionary.h"

//CG_EXTERN void CGContextBeginTransparencyLayer(CGContextRef cg_nullable c, CFDictionaryRef __nullable auxiliaryInfo,)
NAN_METHOD(CGContextBeginTransparencyLayer) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(CFDictionaryRef, auxiliaryInfo);
    ::CGContextBeginTransparencyLayer(c, auxiliaryInfo);
  }
}

//CG_EXTERN void CGContextBeginTransparencyLayerWithRect( CGContextRef cg_nullable c, CGRect rect, CFDictionaryRef __nullable auxInfo,)
NAN_METHOD(CGContextBeginTransparencyLayerWithRect) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    declare_nullable_value(CFDictionaryRef, auxInfo);
    ::CGContextBeginTransparencyLayerWithRect(c, rect, auxInfo);
  }
}

//CG_EXTERN void CGContextEndTransparencyLayer(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextEndTransparencyLayer) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    ::CGContextEndTransparencyLayer(c);
  }
}

//CG_EXTERN CGAffineTransform CGContextGetUserSpaceToDeviceSpaceTransform(CGContextRef cg_nullable c,)
NAN_METHOD(CGContextGetUserSpaceToDeviceSpaceTransform) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    js_return_value(CGAffineTransform, ::CGContextGetUserSpaceToDeviceSpaceTransform(c));
  }
}

//CG_EXTERN CGPoint CGContextConvertPointToDeviceSpace(CGContextRef cg_nullable c, CGPoint point,)
NAN_METHOD(CGContextConvertPointToDeviceSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGPoint, point);
    js_return_value(CGPoint, ::CGContextConvertPointToDeviceSpace(c, point));
  }
}

//CG_EXTERN CGPoint CGContextConvertPointToUserSpace(CGContextRef cg_nullable c, CGPoint point,)
NAN_METHOD(CGContextConvertPointToUserSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGPoint, point);
    js_return_value(CGPoint, ::CGContextConvertPointToUserSpace(c, point));
  }
}

//CG_EXTERN CGSize CGContextConvertSizeToDeviceSpace(CGContextRef cg_nullable c, CGSize size,)
NAN_METHOD(CGContextConvertSizeToDeviceSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGSize, size);
    js_return_value(CGSize, ::CGContextConvertSizeToDeviceSpace(c, size));
  }
}

//CG_EXTERN CGSize CGContextConvertSizeToUserSpace(CGContextRef cg_nullable c, CGSize size,)
NAN_METHOD(CGContextConvertSizeToUserSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGSize, size);
    js_return_value(CGSize, ::CGContextConvertSizeToUserSpace(c, size));
  }
}

//CG_EXTERN CGRect CGContextConvertRectToDeviceSpace(CGContextRef cg_nullable c, CGRect rect,)
NAN_METHOD(CGContextConvertRectToDeviceSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    js_return_value(CGRect, ::CGContextConvertRectToDeviceSpace(c, rect));
  }
}

//CG_EXTERN CGRect CGContextConvertRectToUserSpace(CGContextRef cg_nullable c, CGRect rect,)
NAN_METHOD(CGContextConvertRectToUserSpace) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    js_return_value(CGRect, ::CGContextConvertRectToUserSpace(c, rect));
  }
}

//CG_EXTERN void CGContextSelectFont(CGContextRef cg_nullable c, const char * cg_nullable name, CGFloat size, CGTextEncoding textEncoding,)
NAN_METHOD(CGContextSelectFont) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_char_ptr, name);
    declare_value(CGFloat, size);
    declare_value(CGTextEncoding, textEncoding);
    ::CGContextSelectFont(c, name, size, textEncoding);
  }
}

//CG_EXTERN void CGContextShowText(CGContextRef cg_nullable c, const char * cg_nullable string, size_t length,)
NAN_METHOD(CGContextShowText) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_char_ptr, string);
    declare_value(size_t, length);
    ::CGContextShowText(c, string, length);
  }
}

//CG_EXTERN void CGContextShowTextAtPoint(CGContextRef cg_nullable c, CGFloat x, CGFloat y, const char * cg_nullable string, size_t length,)
NAN_METHOD(CGContextShowTextAtPoint) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, x);
    declare_value(CGFloat, y);
    declare_nullable_value(const_char_ptr, string);
    declare_value(size_t, length);
    ::CGContextShowTextAtPoint(c, x, y, string, length);
  }
}

//CG_EXTERN void CGContextShowGlyphs(CGContextRef cg_nullable c, const CGGlyph * __nullable g, size_t count,)
NAN_METHOD(CGContextShowGlyphs) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_CGGlyph_ptr, g);
    declare_value(size_t, count);
    ::CGContextShowGlyphs(c, g, count);
  }
}

//CG_EXTERN void CGContextShowGlyphsAtPoint(CGContextRef cg_nullable c, CGFloat x, CGFloat y, const CGGlyph * __nullable glyphs, size_t count,)
NAN_METHOD(CGContextShowGlyphsAtPoint) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGFloat, x);
    declare_value(CGFloat, y);
    declare_nullable_value(const_CGGlyph_ptr, glyphs);
    declare_value(size_t, count);
    ::CGContextShowGlyphsAtPoint(c, x, y, glyphs, count);
  }
}

//CG_EXTERN void CGContextShowGlyphsWithAdvances(CGContextRef cg_nullable c, const CGGlyph * __nullable glyphs, const CGSize * __nullable advances, size_t count,)
NAN_METHOD(CGContextShowGlyphsWithAdvances) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_nullable_value(const_CGGlyph_ptr, glyphs);
    declare_nullable_value(const_CGSize_ptr, advances);
    declare_value(size_t, count);
    ::CGContextShowGlyphsWithAdvances(c, glyphs, advances, count);
  }
}

#include "NCGPDFDocument.h"

#if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

//CG_EXTERN void CGContextDrawPDFDocument(CGContextRef cg_nullable c, CGRect rect, CGPDFDocumentRef cg_nullable document, int page,)
NAN_METHOD(CGContextDrawPDFDocument) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, c);
    declare_value(CGRect, rect);
    declare_nullable_value(CGPDFDocumentRef, document);
    declare_value(int, page);
    ::CGContextDrawPDFDocument(c, rect, document, page);
  }
}

#endif // #if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC


JS_INIT_GLOBALS(CGContext);
  // global values (exports)

  JS_ASSIGN_GLOBAL_METHOD(CGContextGetTypeID);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSaveGState);
  JS_ASSIGN_GLOBAL_METHOD(CGContextRestoreGState);
  JS_ASSIGN_GLOBAL_METHOD(CGContextScaleCTM);
  JS_ASSIGN_GLOBAL_METHOD(CGContextTranslateCTM);
  JS_ASSIGN_GLOBAL_METHOD(CGContextRotateCTM);
  JS_ASSIGN_GLOBAL_METHOD(CGContextConcatCTM);
  JS_ASSIGN_GLOBAL_METHOD(CGContextGetCTM);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetLineWidth);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetLineCap);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetLineJoin);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetMiterLimit);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetLineDash);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetFlatness);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetAlpha);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetBlendMode);
  JS_ASSIGN_GLOBAL_METHOD(CGContextBeginPath);
  JS_ASSIGN_GLOBAL_METHOD(CGContextMoveToPoint);
  JS_ASSIGN_GLOBAL_METHOD(CGContextAddLineToPoint);
  JS_ASSIGN_GLOBAL_METHOD(CGContextAddCurveToPoint);
  JS_ASSIGN_GLOBAL_METHOD(CGContextAddQuadCurveToPoint);
  JS_ASSIGN_GLOBAL_METHOD(CGContextClosePath);
  JS_ASSIGN_GLOBAL_METHOD(CGContextAddRect);
  JS_ASSIGN_GLOBAL_METHOD(CGContextAddRects);
  JS_ASSIGN_GLOBAL_METHOD(CGContextAddLines);
  JS_ASSIGN_GLOBAL_METHOD(CGContextAddEllipseInRect);
  JS_ASSIGN_GLOBAL_METHOD(CGContextAddArc);
  JS_ASSIGN_GLOBAL_METHOD(CGContextAddArcToPoint);
  JS_ASSIGN_GLOBAL_METHOD(CGContextAddPath);
  JS_ASSIGN_GLOBAL_METHOD(CGContextReplacePathWithStrokedPath);
  JS_ASSIGN_GLOBAL_METHOD(CGContextIsPathEmpty);
  JS_ASSIGN_GLOBAL_METHOD(CGContextGetPathCurrentPoint);
  JS_ASSIGN_GLOBAL_METHOD(CGContextGetPathBoundingBox);
  JS_ASSIGN_GLOBAL_METHOD(CGContextCopyPath);
  JS_ASSIGN_GLOBAL_METHOD(CGContextPathContainsPoint);
  JS_ASSIGN_GLOBAL_METHOD(CGContextDrawPath);
  JS_ASSIGN_GLOBAL_METHOD(CGContextFillPath);
  JS_ASSIGN_GLOBAL_METHOD(CGContextEOFillPath);
  JS_ASSIGN_GLOBAL_METHOD(CGContextStrokePath);
  JS_ASSIGN_GLOBAL_METHOD(CGContextFillRect);
  JS_ASSIGN_GLOBAL_METHOD(CGContextFillRects);
  JS_ASSIGN_GLOBAL_METHOD(CGContextStrokeRect);
  JS_ASSIGN_GLOBAL_METHOD(CGContextStrokeRectWithWidth);
  JS_ASSIGN_GLOBAL_METHOD(CGContextClearRect);
  JS_ASSIGN_GLOBAL_METHOD(CGContextFillEllipseInRect);
  JS_ASSIGN_GLOBAL_METHOD(CGContextStrokeEllipseInRect);
  JS_ASSIGN_GLOBAL_METHOD(CGContextStrokeLineSegments);
  JS_ASSIGN_GLOBAL_METHOD(CGContextClip);
  JS_ASSIGN_GLOBAL_METHOD(CGContextEOClip);
  JS_ASSIGN_GLOBAL_METHOD(CGContextResetClip);
  JS_ASSIGN_GLOBAL_METHOD(CGContextClipToMask);
  JS_ASSIGN_GLOBAL_METHOD(CGContextGetClipBoundingBox);
  JS_ASSIGN_GLOBAL_METHOD(CGContextClipToRect);
  JS_ASSIGN_GLOBAL_METHOD(CGContextClipToRects);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetFillColorWithColor);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetStrokeColorWithColor);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetFillColorSpace);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetStrokeColorSpace);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetFillColor);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetStrokeColor);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetFillPattern);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetStrokePattern);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetPatternPhase);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetGrayFillColor);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetGrayStrokeColor);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetRGBFillColor);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetRGBStrokeColor);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetCMYKFillColor);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetCMYKStrokeColor);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetRenderingIntent);
  JS_ASSIGN_GLOBAL_METHOD(CGContextDrawImage);
  JS_ASSIGN_GLOBAL_METHOD(CGContextDrawTiledImage);
  JS_ASSIGN_GLOBAL_METHOD(CGContextGetInterpolationQuality);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetInterpolationQuality);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetShadowWithColor);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetShadow);
  JS_ASSIGN_GLOBAL_METHOD(CGContextDrawLinearGradient);
  JS_ASSIGN_GLOBAL_METHOD(CGContextDrawRadialGradient);
  JS_ASSIGN_GLOBAL_METHOD(CGContextDrawShading);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetCharacterSpacing);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetTextPosition);
  JS_ASSIGN_GLOBAL_METHOD(CGContextGetTextPosition);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetTextMatrix);
  JS_ASSIGN_GLOBAL_METHOD(CGContextGetTextMatrix);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetTextDrawingMode);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetFont);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetFontSize);
  JS_ASSIGN_GLOBAL_METHOD(CGContextShowGlyphsAtPositions);
  JS_ASSIGN_GLOBAL_METHOD(CGContextDrawPDFPage);
  JS_ASSIGN_GLOBAL_METHOD(CGContextBeginPage);
  JS_ASSIGN_GLOBAL_METHOD(CGContextEndPage);
  JS_ASSIGN_GLOBAL_METHOD(CGContextRetain);
  JS_ASSIGN_GLOBAL_METHOD(CGContextRelease);
  JS_ASSIGN_GLOBAL_METHOD(CGContextFlush);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSynchronize);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetShouldAntialias);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetAllowsAntialiasing);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetShouldSmoothFonts);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetAllowsFontSmoothing);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetShouldSubpixelPositionFonts);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetAllowsFontSubpixelPositioning);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetShouldSubpixelQuantizeFonts);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSetAllowsFontSubpixelQuantization);
  JS_ASSIGN_GLOBAL_METHOD(CGContextBeginTransparencyLayer);
  JS_ASSIGN_GLOBAL_METHOD(CGContextBeginTransparencyLayerWithRect);
  JS_ASSIGN_GLOBAL_METHOD(CGContextEndTransparencyLayer);
  JS_ASSIGN_GLOBAL_METHOD(CGContextGetUserSpaceToDeviceSpaceTransform);
  JS_ASSIGN_GLOBAL_METHOD(CGContextConvertPointToDeviceSpace);
  JS_ASSIGN_GLOBAL_METHOD(CGContextConvertPointToUserSpace);
  JS_ASSIGN_GLOBAL_METHOD(CGContextConvertSizeToDeviceSpace);
  JS_ASSIGN_GLOBAL_METHOD(CGContextConvertSizeToUserSpace);
  JS_ASSIGN_GLOBAL_METHOD(CGContextConvertRectToDeviceSpace);
  JS_ASSIGN_GLOBAL_METHOD(CGContextConvertRectToUserSpace);
  JS_ASSIGN_GLOBAL_METHOD(CGContextSelectFont);
  JS_ASSIGN_GLOBAL_METHOD(CGContextShowText);
  JS_ASSIGN_GLOBAL_METHOD(CGContextShowTextAtPoint);
  JS_ASSIGN_GLOBAL_METHOD(CGContextShowGlyphs);
  JS_ASSIGN_GLOBAL_METHOD(CGContextShowGlyphsAtPoint);
  JS_ASSIGN_GLOBAL_METHOD(CGContextShowGlyphsWithAdvances);
#if !TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
  JS_ASSIGN_GLOBAL_METHOD(CGContextDrawPDFDocument);
#endif

  //typedef CF_ENUM (int32_t, CGPathDrawingMode) {
    JS_ASSIGN_ENUM(kCGPathFill, int32_t);
    JS_ASSIGN_ENUM(kCGPathEOFill, int32_t);
    JS_ASSIGN_ENUM(kCGPathStroke, int32_t);
    JS_ASSIGN_ENUM(kCGPathFillStroke, int32_t);
    JS_ASSIGN_ENUM(kCGPathEOFillStroke, int32_t);
  //};

  //typedef CF_ENUM (int32_t, CGTextDrawingMode) {
    JS_ASSIGN_ENUM(kCGTextFill, int32_t);
    JS_ASSIGN_ENUM(kCGTextStroke, int32_t);
    JS_ASSIGN_ENUM(kCGTextFillStroke, int32_t);
    JS_ASSIGN_ENUM(kCGTextInvisible, int32_t);
    JS_ASSIGN_ENUM(kCGTextFillClip, int32_t);
    JS_ASSIGN_ENUM(kCGTextStrokeClip, int32_t);
    JS_ASSIGN_ENUM(kCGTextFillStrokeClip, int32_t);
    JS_ASSIGN_ENUM(kCGTextClip, int32_t);
  //};

  //typedef CF_ENUM (int32_t, CGTextEncoding) {
    JS_ASSIGN_ENUM(kCGEncodingFontSpecific, int32_t);
    JS_ASSIGN_ENUM(kCGEncodingMacRoman, int32_t);
  //} CG_AVAILABLE_BUT_DEPRECATED(10.0, 10.9, 2.0, 7.0);

  //typedef CF_ENUM (int32_t, CGInterpolationQuality) {
    JS_ASSIGN_ENUM(kCGInterpolationDefault, int32_t); //  = 0,  
    JS_ASSIGN_ENUM(kCGInterpolationNone, int32_t); //  = 1,     
    JS_ASSIGN_ENUM(kCGInterpolationLow, int32_t); //  = 2,      
    JS_ASSIGN_ENUM(kCGInterpolationMedium, int32_t); //  = 4,   
    JS_ASSIGN_ENUM(kCGInterpolationHigh, int32_t); //  = 3      
  //};

  //typedef CF_ENUM (int32_t, CGBlendMode) {
      
    JS_ASSIGN_ENUM(kCGBlendModeNormal, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeMultiply, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeScreen, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeOverlay, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDarken, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeLighten, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeColorDodge, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeColorBurn, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeSoftLight, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeHardLight, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDifference, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeExclusion, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeHue, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeSaturation, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeColor, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeLuminosity, int32_t);

    JS_ASSIGN_ENUM(kCGBlendModeClear, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeCopy, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeSourceIn, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeSourceOut, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeSourceAtop, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDestinationOver, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDestinationIn, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDestinationOut, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDestinationAtop, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeXOR, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModePlusDarker, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModePlusLighter, int32_t);
  //};

JS_INIT_GLOBALS_END(CGContext);
