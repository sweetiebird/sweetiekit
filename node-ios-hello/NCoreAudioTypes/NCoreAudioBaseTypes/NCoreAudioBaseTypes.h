//
//  NCoreAudioBaseTypes.h
//
//  Created by Shawn Presser on 7/22/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCoreAudioBaseTypes_h
#define NCoreAudioBaseTypes_h    

#include "NNSObject.h"

#define js_value_AudioFormatID js_value_UInt32
#define to_value_AudioFormatID to_value_UInt32
#define is_value_AudioFormatID is_value_UInt32

#define js_value_AudioFormatFlags js_value_UInt32
#define to_value_AudioFormatFlags to_value_UInt32
#define is_value_AudioFormatFlags is_value_UInt32

#define js_value_AudioTimeStampFlags(x) JS_ENUM(AudioTimeStampFlags, UInt32, x)
#define to_value_AudioTimeStampFlags(x) TO_ENUM(AudioTimeStampFlags, UInt32, x)
#define is_value_AudioTimeStampFlags(x) IS_ENUM(AudioTimeStampFlags, UInt32, x)

#define js_value_SMPTETimeType(x) JS_ENUM(SMPTETimeType, UInt32, x)
#define to_value_SMPTETimeType(x) TO_ENUM(SMPTETimeType, UInt32, x)
#define is_value_SMPTETimeType(x) IS_ENUM(SMPTETimeType, UInt32, x)

#define js_value_SMPTETimeFlags(x) JS_ENUM(SMPTETimeFlags, UInt32, x)
#define to_value_SMPTETimeFlags(x) TO_ENUM(SMPTETimeFlags, UInt32, x)
#define is_value_SMPTETimeFlags(x) IS_ENUM(SMPTETimeFlags, UInt32, x)

/*!
    @struct         AudioTimeStamp
    @abstract       A structure that holds different representations of the same point in time.
    @var            mSampleTime
                        The absolute sample frame time.
    @var            mHostTime
                        The host machine's time base, mach_absolute_time.
    @var            mRateScalar
                        The ratio of actual host ticks per sample frame to the nominal host ticks
                        per sample frame.
    @var            mWordClockTime
                        The word clock time.
    @var            mSMPTETime
                        The SMPTE time.
    @var            mFlags
                        A set of flags indicating which representations of the time are valid.
    @var            mReserved
                        Pads the structure out to force an even 8 byte alignment.
*/
/*
struct AudioTimeStamp
{
    Float64             mSampleTime;
    UInt64              mHostTime;
    Float64             mRateScalar;
    UInt64              mWordClockTime;
    SMPTETime           mSMPTETime;
    AudioTimeStampFlags mFlags;
    UInt32              mReserved;
};
typedef struct AudioTimeStamp   AudioTimeStamp;
*/
JS_DECLARE_STRUCT(AudioTimeStamp);


/*!
    @struct         SMPTETime
    @abstract       A structure for holding a SMPTE time.
    @var            mSubframes
                        The number of subframes in the full message.
    @var            mSubframeDivisor
                        The number of subframes per frame (typically 80).
    @var            mCounter
                        The total number of messages received.
    @var            mType
                        The kind of SMPTE time using the SMPTE time type constants.
    @var            mFlags
                        A set of flags that indicate the SMPTE state.
    @var            mHours
                        The number of hours in the full message.
    @var            mMinutes
                        The number of minutes in the full message.
    @var            mSeconds
                        The number of seconds in the full message.
    @var            mFrames
                        The number of frames in the full message.
*/
/*
struct SMPTETime
{
    SInt16          mSubframes;
    SInt16          mSubframeDivisor;
    UInt32          mCounter;
    SMPTETimeType   mType;
    SMPTETimeFlags  mFlags;
    SInt16          mHours;
    SInt16          mMinutes;
    SInt16          mSeconds;
    SInt16          mFrames;
};
typedef struct SMPTETime    SMPTETime;
 */
JS_DECLARE_STRUCT(SMPTETime);

JS_WRAP_GLOBALS(CoreAudioBaseTypes);
JS_WRAP_GLOBALS_END(CoreAudioBaseTypes);

#endif /* NCoreAudioBaseTypes_h */
