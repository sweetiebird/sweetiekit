//
//  NCMTime.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCMTime.h"

#include "NMacTypes.h"

Local<Value> js_value_CMTime(const CMTime& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  
//  CMTimeValue  value;    /*! @field value The value of the CMTime. value/timescale = seconds. */
//  CMTimeScale  timescale;  /*! @field timescale The timescale of the CMTime. value/timescale = seconds.  */
//  CMTimeFlags  flags;    /*! @field flags The flags, eg. kCMTimeFlags_Valid, kCMTimeFlags_PositiveInfinity, etc. */
//  CMTimeEpoch  epoch;    /*! @field epoch Differentiates between equal timestamps that are actually different because
//                         of looping, multi-item sequencing, etc.  
//                         Will be used during comparison: greater epochs happen after lesser ones. 
//                         Additions/subtraction is only possible within a single epoch,
//                         however, since epoch length may be unknown/variable. */
  js_struct_value(CMTimeValue, value);
  js_struct_value(CMTimeScale, timescale);
  js_struct_value(CMTimeFlags, flags);
  js_struct_value(CMTimeEpoch, epoch);
  return scope.Escape(result);
}

CMTime to_value_CMTime(const Local<Value>& value, bool * _Nullable failed) {
  CMTime result;
  to_struct_init_value(CMTimeValue, value, 0);
  to_struct_init_value(CMTimeScale, timescale, 0);
  to_struct_init_value(CMTimeFlags, flags, 0);
  to_struct_init_value(CMTimeEpoch, epoch, 0);
  check_struct_type(CMTime);
  to_struct_value(CMTimeValue, value);
  to_struct_value(CMTimeScale, timescale);
  to_struct_value(CMTimeFlags, flags);
  to_struct_value(CMTimeEpoch, epoch);
  return result;
}

bool is_value_CMTime(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  check_struct_value(CMTimeValue, value);
  check_struct_value(CMTimeScale, timescale);
  check_struct_value(CMTimeFlags, flags);
  check_struct_value(CMTimeEpoch, epoch);
  return true;
}

JS_INIT_GLOBALS(CMTime);
  // global values (exports)
  /*!
    @enum    CMTimeFlags
    @abstract  Flag bits for a CMTime.
    @constant  kCMTimeFlags_Valid Must be set, or the CMTime is considered invalid.
                    Allows simple clearing (eg. with calloc or memset) for initialization
                    of arrays of CMTime structs to "invalid". This flag must be set, even
                    if other flags are set as well.
    @constant  kCMTimeFlags_HasBeenRounded Set whenever a CMTime value is rounded, or is derived from another rounded CMTime.                          
    @constant  kCMTimeFlags_PositiveInfinity Set if the CMTime is +inf.  "Implied value" flag (other struct fields are ignored).                          
    @constant  kCMTimeFlags_NegativeInfinity Set if the CMTime is -inf.  "Implied value" flag (other struct fields are ignored).                            
    @constant  kCMTimeFlags_Indefinite Set if the CMTime is indefinite/unknown. Example of usage: duration of a live broadcast.
                       "Implied value" flag (other struct fields are ignored).
  */
  //typedef CF_OPTIONS( uint32_t, CMTimeFlags ) {
    JS_ASSIGN_ENUM(kCMTimeFlags_Valid, uint32_t); //  = 1UL<<0,
    JS_ASSIGN_ENUM(kCMTimeFlags_HasBeenRounded, uint32_t); //  = 1UL<<1,
    JS_ASSIGN_ENUM(kCMTimeFlags_PositiveInfinity, uint32_t); //  = 1UL<<2,
    JS_ASSIGN_ENUM(kCMTimeFlags_NegativeInfinity, uint32_t); //  = 1UL<<3,
    JS_ASSIGN_ENUM(kCMTimeFlags_Indefinite, uint32_t); //  = 1UL<<4,
    JS_ASSIGN_ENUM(kCMTimeFlags_ImpliedValueFlagsMask, uint32_t); //  = kCMTimeFlags_PositiveInfinity | kCMTimeFlags_NegativeInfinity | kCMTimeFlags_Indefinite
  //} API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

JS_INIT_GLOBALS_END(CMTime);
