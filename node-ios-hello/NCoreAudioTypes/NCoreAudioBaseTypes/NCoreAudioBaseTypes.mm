//
//  NCoreAudioBaseTypes.mm
//
//  Created by Shawn Presser on 7/22/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCoreAudioBaseTypes.h"

#include "NMacTypes.h"

/*
    Float64             mSampleTime;
    UInt64              mHostTime;
    Float64             mRateScalar;
    UInt64              mWordClockTime;
    SMPTETime           mSMPTETime;
    AudioTimeStampFlags mFlags;
    UInt32              mReserved;
 */

Local<Value> js_value_AudioTimeStamp(const AudioTimeStamp& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  js_struct_value(Float64, mSampleTime);
  js_struct_value(UInt64, mHostTime);
  js_struct_value(Float64, mRateScalar);
  js_struct_value(UInt64, mWordClockTime);
  js_struct_value(SMPTETime, mSMPTETime);
  js_struct_value(AudioTimeStampFlags, mFlags);
//  js_struct_value(UInt32, mReserved);
  return scope.Escape(result);
}

AudioTimeStamp to_value_AudioTimeStamp(const Local<Value>& value, bool * _Nullable failed) {
  AudioTimeStamp result;
  memset(&result, 0, sizeof(AudioTimeStamp));
  check_struct_type(AudioTimeStamp);
  to_struct_value(Float64, mSampleTime);
  to_struct_value(UInt64, mHostTime);
  to_struct_value(Float64, mRateScalar);
  to_struct_value(UInt64, mWordClockTime);
  to_struct_value(SMPTETime, mSMPTETime);
  to_struct_value(AudioTimeStampFlags, mFlags);
  return result;
}

bool is_value_AudioTimeStamp(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  check_struct_value(Float64, mSampleTime);
  check_struct_value(UInt64, mHostTime);
  check_struct_value(Float64, mRateScalar);
  check_struct_value(UInt64, mWordClockTime);
  check_struct_value(SMPTETime, mSMPTETime);
  check_struct_value(AudioTimeStampFlags, mFlags);
  return true;
}

/*
    SInt16          mSubframes;
    SInt16          mSubframeDivisor;
    UInt32          mCounter;
    SMPTETimeType   mType;
    SMPTETimeFlags  mFlags;
    SInt16          mHours;
    SInt16          mMinutes;
    SInt16          mSeconds;
    SInt16          mFrames;
 */

Local<Value> js_value_SMPTETime(const SMPTETime& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  js_struct_value(SInt16, mSubframes);
  js_struct_value(SInt16, mSubframeDivisor);
  js_struct_value(UInt32, mCounter);
  js_struct_value(SMPTETimeType, mType);
  js_struct_value(SInt16, mHours);
  js_struct_value(SInt16, mMinutes);
  js_struct_value(SInt16, mSeconds);
  js_struct_value(SInt16, mFrames);
//  js_struct_value(UInt32, mReserved);
  return scope.Escape(result);
}

SMPTETime to_value_SMPTETime(const Local<Value>& value, bool * _Nullable failed) {
  SMPTETime result;
  memset(&result, 0, sizeof(SMPTETime));
  check_struct_type(SMPTETime);
  to_struct_value(SInt16, mSubframes);
  to_struct_value(SInt16, mSubframeDivisor);
  to_struct_value(UInt32, mCounter);
  to_struct_value(SMPTETimeType, mType);
  to_struct_value(SInt16, mHours);
  to_struct_value(SInt16, mMinutes);
  to_struct_value(SInt16, mSeconds);
  to_struct_value(SInt16, mFrames);
  return result;
}

bool is_value_SMPTETime(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  check_struct_value(SInt16, mSubframes);
  check_struct_value(SInt16, mSubframeDivisor);
  check_struct_value(UInt32, mCounter);
  check_struct_value(SMPTETimeType, mType);
  check_struct_value(SInt16, mHours);
  check_struct_value(SInt16, mMinutes);
  check_struct_value(SInt16, mSeconds);
  check_struct_value(SInt16, mFrames);
  return true;
}


JS_INIT_GLOBALS(CoreAudioBaseTypes);
  // global values (exports)

  /*!
      @enum           AudioTimeStamp Flags
      @abstract       The flags that indicate which fields in an AudioTimeStamp structure are valid.
      @constant       kAudioTimeStampSampleTimeValid
                          The sample frame time is valid.
      @constant       kAudioTimeStampHostTimeValid
                          The host time is valid.
      @constant       kAudioTimeStampRateScalarValid
                          The rate scalar is valid.
      @constant       kAudioTimeStampWordClockTimeValid
                          The word clock time is valid.
      @constant       kAudioTimeStampSMPTETimeValid
                          The SMPTE time is valid.
      @constant       kAudioTimeStampSampleHostTimeValid
                          The sample frame time and the host time are valid.
  */
  //typedef CF_OPTIONS(UInt32, AudioTimeStampFlags) {
    JS_ASSIGN_ENUM(kAudioTimeStampNothingValid, UInt32); //          = 0,
    JS_ASSIGN_ENUM(kAudioTimeStampSampleTimeValid, UInt32); //       = (1U << 0),
    JS_ASSIGN_ENUM(kAudioTimeStampHostTimeValid, UInt32); //         = (1U << 1),
    JS_ASSIGN_ENUM(kAudioTimeStampRateScalarValid, UInt32); //       = (1U << 2),
    JS_ASSIGN_ENUM(kAudioTimeStampWordClockTimeValid, UInt32); //    = (1U << 3),
    JS_ASSIGN_ENUM(kAudioTimeStampSMPTETimeValid, UInt32); //        = (1U << 4),
    JS_ASSIGN_ENUM(kAudioTimeStampSampleHostTimeValid, UInt32); //   = (kAudioTimeStampSampleTimeValid | kAudioTimeStampHostTimeValid)
  //};

  /*!
      @enum           SMPTE Time Types
      @abstract       Constants that describe the type of SMPTE time.
      @constant       kSMPTETimeType24
                          24 Frame
      @constant       kSMPTETimeType25
                          25 Frame
      @constant       kSMPTETimeType30Drop
                          30 Drop Frame
      @constant       kSMPTETimeType30
                          30 Frame
      @constant       kSMPTETimeType2997
                          29.97 Frame
      @constant       kSMPTETimeType2997Drop
                          29.97 Drop Frame
      @constant       kSMPTETimeType60
                          60 Frame
      @constant       kSMPTETimeType5994
                          59.94 Frame
      @constant       kSMPTETimeType60Drop
                          60 Drop Frame
      @constant       kSMPTETimeType5994Drop
                          59.94 Drop Frame
      @constant       kSMPTETimeType50
                          50 Frame
      @constant       kSMPTETimeType2398
                          23.98 Frame
  */
  //typedef CF_ENUM(UInt32, SMPTETimeType) {
    JS_ASSIGN_ENUM(kSMPTETimeType24, UInt32); //         = 0,
    JS_ASSIGN_ENUM(kSMPTETimeType25, UInt32); //         = 1,
    JS_ASSIGN_ENUM(kSMPTETimeType30Drop, UInt32); //     = 2,
    JS_ASSIGN_ENUM(kSMPTETimeType30, UInt32); //         = 3,
    JS_ASSIGN_ENUM(kSMPTETimeType2997, UInt32); //       = 4,
    JS_ASSIGN_ENUM(kSMPTETimeType2997Drop, UInt32); //   = 5,
    JS_ASSIGN_ENUM(kSMPTETimeType60, UInt32); //         = 6,
    JS_ASSIGN_ENUM(kSMPTETimeType5994, UInt32); //       = 7,
    JS_ASSIGN_ENUM(kSMPTETimeType60Drop, UInt32); //     = 8,
    JS_ASSIGN_ENUM(kSMPTETimeType5994Drop, UInt32); //   = 9,
    JS_ASSIGN_ENUM(kSMPTETimeType50, UInt32); //         = 10,
    JS_ASSIGN_ENUM(kSMPTETimeType2398, UInt32); //       = 11
  //};

  /*!
      @enum           SMPTE State Flags
      @abstract       Flags that describe the SMPTE time state.
      @constant       kSMPTETimeValid
                          The full time is valid.
      @constant       kSMPTETimeRunning
                          Time is running.
  */
  //typedef CF_OPTIONS(UInt32, SMPTETimeFlags) {
    JS_ASSIGN_ENUM(kSMPTETimeUnknown, UInt32); //    = 0,
    JS_ASSIGN_ENUM(kSMPTETimeValid, UInt32); //      = (1U << 0),
    JS_ASSIGN_ENUM(kSMPTETimeRunning, UInt32); //    = (1U << 1)
  //};


JS_INIT_GLOBALS_END(CoreAudioBaseTypes);
