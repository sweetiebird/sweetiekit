//
//  NMacTypes.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMacTypes_h
#define NMacTypes_h    

#include "NNSObject.h"

#define JS_TYPEDEF(type, c, x) js_value_##c(x)
#define TO_TYPEDEF(type, c, x) to_value_##c(x)
#define IS_TYPEDEF(type, c, x) is_value_##c(x)

#define js_value_SInt8 js_value_int8_t
#define to_value_SInt8 to_value_int8_t
#define is_value_SInt8 is_value_int8_t

#define js_value_SInt16 js_value_int16_t
#define to_value_SInt16 to_value_int16_t
#define is_value_SInt16 is_value_int16_t

#define js_value_SInt32 js_value_int32_t
#define to_value_SInt32 to_value_int32_t
#define is_value_SInt32 is_value_int32_t

#define js_value_SInt64 js_value_int64_t
#define to_value_SInt64 to_value_int64_t
#define is_value_SInt64 is_value_int64_t

#define js_value_UInt8 js_value_uint8_t
#define to_value_UInt8 to_value_uint8_t
#define is_value_UInt8 is_value_uint8_t

#define js_value_UInt16 js_value_uint16_t
#define to_value_UInt16 to_value_uint16_t
#define is_value_UInt16 is_value_uint16_t

#define js_value_UInt32 js_value_uint32_t
#define to_value_UInt32 to_value_uint32_t
#define is_value_UInt32 is_value_uint32_t

#define js_value_UInt64 js_value_uint64_t
#define to_value_UInt64 to_value_uint64_t
#define is_value_UInt64 is_value_uint64_t

#define js_value_Float32 js_value_float
#define to_value_Float32 to_value_float
#define is_value_Float32 is_value_float

#define js_value_Float64 js_value_double
#define to_value_Float64 to_value_double
#define is_value_Float64 is_value_double

#define js_value_OSErr js_value_SInt16
#define to_value_OSErr to_value_SInt16
#define is_value_OSErr is_value_SInt16

#define js_value_OSStatus js_value_SInt32
#define to_value_OSStatus to_value_SInt32
#define is_value_OSStatus is_value_SInt32

#define js_value_LogicalAddress js_value_void_ptr
#define to_value_LogicalAddress to_value_void_ptr
#define is_value_LogicalAddress is_value_void_ptr

#define js_value_ConstLogicalAddress js_value_const_void_ptr
#define to_value_ConstLogicalAddress to_value_const_void_ptr
#define is_value_ConstLogicalAddress is_value_const_void_ptr

#define js_value_PhysicalAddress js_value_void_ptr
#define to_value_PhysicalAddress to_value_void_ptr
#define is_value_PhysicalAddress is_value_void_ptr

#define js_value_BytePtr js_value_UInt8
#define to_value_BytePtr to_value_UInt8
#define is_value_BytePtr is_value_UInt8

#define js_value_ByteCount js_value_unsigned_long
#define to_value_ByteCount to_value_unsigned_long
#define is_value_ByteCount is_value_unsigned_long

#define js_value_ByteOffset js_value_unsigned_long
#define to_value_ByteOffset to_value_unsigned_long
#define is_value_ByteOffset is_value_unsigned_long

#define js_value_Duration js_value_SInt32
#define to_value_Duration to_value_SInt32
#define is_value_Duration is_value_SInt32

#define js_value_AbsoluteTime js_value_UnsignedWide
#define to_value_AbsoluteTime to_value_UnsignedWide
#define is_value_AbsoluteTime is_value_UnsignedWide

#define js_value_OptionBits js_value_UInt32
#define to_value_OptionBits to_value_UInt32
#define is_value_OptionBits is_value_UInt32

#define js_value_ItemCount js_value_unsigned_long
#define to_value_ItemCount to_value_unsigned_long
#define is_value_ItemCount is_value_unsigned_long

#define js_value_PBVersion js_value_UInt32
#define to_value_PBVersion to_value_UInt32
#define is_value_PBVersion is_value_UInt32

#define js_value_ScriptCode js_value_SInt16
#define to_value_ScriptCode to_value_SInt16
#define is_value_ScriptCode is_value_SInt16

#define js_value_LangCode js_value_SInt16
#define to_value_LangCode to_value_SInt16
#define is_value_LangCode is_value_SInt16

#define js_value_RegionCode js_value_SInt16
#define to_value_RegionCode to_value_SInt16
#define is_value_RegionCode is_value_SInt16

#define js_value_FourCharCode js_value_UInt32
#define to_value_FourCharCode to_value_UInt32
#define is_value_FourCharCode is_value_UInt32

#define js_value_OSType js_value_FourCharCode
#define to_value_OSType to_value_FourCharCode
#define is_value_OSType is_value_FourCharCode

#define js_value_ResType js_value_FourCharCode
#define to_value_ResType to_value_FourCharCode
#define is_value_ResType is_value_FourCharCode

#define js_value_OSTypePtr js_value_OSType_ptr
#define to_value_OSTypePtr to_value_OSType_ptr
#define is_value_OSTypePtr is_value_OSType_ptr

#define js_value_ResTypePtr js_value_ResType_ptr
#define to_value_ResTypePtr to_value_ResType_ptr
#define is_value_ResTypePtr is_value_ResType_ptr

JS_WRAP_GLOBALS(MacTypes);
JS_WRAP_GLOBALS_END(MacTypes);


#define js_struct_value(type, name) \
  result->Set(JS_STR(#name), js_value_##type(value.name))

#define to_struct_init_value(type, name, v) \
  result.name = v

#define to_struct_value(type, name) \
  result.name = to_value_##type(JS_OBJ(value)->Get(JS_STR(#name)))

#define is_struct_value(type, name) \
  is_value_##type(JS_OBJ(value)->Get(JS_STR(#name)))

#define check_struct_value(type, name) \
  if (!is_struct_value(type, name)) { \
    return false; \
  }

#define check_struct_type(type) \
  if (failed) { \
    *failed = false; \
  } \
  if (!is_value_##type(value)) { \
    if (failed) { \
      *failed = true; \
    } else { \
      Nan::ThrowError("Expected " #type); \
    } \
    return result; \
  }

#endif /* NMacTypes_h */
