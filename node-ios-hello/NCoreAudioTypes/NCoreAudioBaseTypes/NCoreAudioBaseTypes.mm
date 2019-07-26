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

/*
    UInt32              mNumberChannels;
    UInt32              mDataByteSize;
    void* __nullable    mData;
 */

Local<Value> js_value_AudioBuffer(const AudioBuffer& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  js_struct_value(UInt32, mNumberChannels);
  js_struct_value(UInt32, mDataByteSize);
  if (value.mData) {
    result->Set(JS_STR("mData"), ArrayBuffer::New(Isolate::GetCurrent(), (void*)value.mData, value.mDataByteSize));
  }
  return scope.Escape(result);
}

AudioBuffer to_value_AudioBuffer(const Local<Value>& value, bool * _Nullable failed) {
  AudioBuffer result;
  memset(&result, 0, sizeof(AudioBuffer));
  check_struct_type(AudioBuffer);
  to_struct_value(UInt32, mNumberChannels);
  to_struct_value(UInt32, mDataByteSize);
  {
    Local<Value> value_(JS_OBJ(value)->Get(JS_STR("mData")));
    if (value_->IsNullOrUndefined()) {
      result.mData = nullptr;
    } else {
      Local<ArrayBuffer> mData(Local<ArrayBuffer>::Cast(value_));
      result.mData = mData->GetContents().Data();
    }
  }
  return result;
}

bool is_value_AudioBuffer(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  check_struct_value(UInt32, mNumberChannels);
  check_struct_value(UInt32, mDataByteSize);
  return true;
}

/*
    UInt32      mNumberBuffers;
    AudioBuffer mBuffers[1]; // this is a variable length array of mNumberBuffers elements
 */

Local<Value> js_value_AudioBufferList(const AudioBufferList& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  js_struct_value(UInt32, mNumberBuffers);
  Local<Array> mBuffers(Nan::New<Array>(value.mNumberBuffers));
  for (UInt32 i = 0, n = value.mNumberBuffers; i < n; i++) {
    mBuffers->Set(i, js_value_AudioBuffer(value.mBuffers[i]));
  }
  result->Set(JS_STR("mBuffers"), mBuffers);
  return scope.Escape(result);
}

AudioBufferList to_value_AudioBufferList(const Local<Value>& value, bool * _Nullable failed) {
  AudioBufferList result;
  memset(&result, 0, sizeof(AudioBufferList));
  check_struct_type(AudioBufferList);
  to_struct_value(UInt32, mNumberBuffers);
  if (result.mNumberBuffers > 1) {
    js_panic_noreturn("AudioBufferList::mNumberBuffers must be <= 1");
    return result;
  }
  Local<Value> array(JS_OBJ(value)->Get(JS_STR("mBuffers")));
  if (array->IsArray()) {
    Local<Array> values(Local<Array>::Cast(array));
    uint32_t length(result.mNumberBuffers);
    for (uint32_t i = 0; i < length; i++) {
      result.mBuffers[i] = to_value_AudioBuffer(values->Get(i));
    }
  }
  return result;
}

bool is_value_AudioBufferList(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  check_struct_value(UInt32, mNumberBuffers);
  check_struct_value(NSArray<AudioBuffer>, mBuffers);
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

  /*!
      @enum           AudioStreamBasicDescription Constants
      @constant       kAudioStreamAnyRate
                          The format can use any sample rate. Note that this constant can only appear
                          in listings of supported formats. It will never appear in a current format.
  */
  JS_ASSIGN_ENUM(kAudioStreamAnyRate, Float64); //  = 0.0;

  /*!
      @enum           Format IDs
      @abstract       The AudioFormatIDs used to identify individual formats of audio data.
      @constant       kAudioFormatLinearPCM
                          Linear PCM, uses the standard flags.
      @constant       kAudioFormatAC3
                          AC-3, has no flags.
      @constant       kAudioFormat60958AC3
                          AC-3 packaged for transport over an IEC 60958 compliant digital audio
                          interface. Uses the standard flags.
      @constant       kAudioFormatAppleIMA4
                          Apples implementation of IMA 4:1 ADPCM, has no flags.
      @constant       kAudioFormatMPEG4AAC
                          MPEG-4 Low Complexity AAC audio object, has no flags.
      @constant       kAudioFormatMPEG4CELP
                          MPEG-4 CELP audio object, has no flags.
      @constant       kAudioFormatMPEG4HVXC
                          MPEG-4 HVXC audio object, has no flags.
      @constant       kAudioFormatMPEG4TwinVQ
                          MPEG-4 TwinVQ audio object type, has no flags.
      @constant       kAudioFormatMACE3
                          MACE 3:1, has no flags.
      @constant       kAudioFormatMACE6
                          MACE 6:1, has no flags.
      @constant       kAudioFormatULaw
                          µLaw 2:1, has no flags.
      @constant       kAudioFormatALaw
                          aLaw 2:1, has no flags.
      @constant       kAudioFormatQDesign
                          QDesign music, has no flags
      @constant       kAudioFormatQDesign2
                          QDesign2 music, has no flags
      @constant       kAudioFormatQUALCOMM
                          QUALCOMM PureVoice, has no flags
      @constant       kAudioFormatMPEGLayer1
                          MPEG-1/2, Layer 1 audio, has no flags
      @constant       kAudioFormatMPEGLayer2
                          MPEG-1/2, Layer 2 audio, has no flags
      @constant       kAudioFormatMPEGLayer3
                          MPEG-1/2, Layer 3 audio, has no flags
      @constant       kAudioFormatTimeCode
                          A stream of IOAudioTimeStamps, uses the IOAudioTimeStamp flags (see
                          IOKit/audio/IOAudioTypes.h).
      @constant       kAudioFormatMIDIStream
                          A stream of MIDIPacketLists where the time stamps in the MIDIPacketList are
                          sample offsets in the stream. The mSampleRate field is used to describe how
                          time is passed in this kind of stream and an AudioUnit that receives or
                          generates this stream can use this sample rate, the number of frames it is
                          rendering and the sample offsets within the MIDIPacketList to define the
                          time for any MIDI event within this list. It has no flags.
      @constant       kAudioFormatParameterValueStream
                          A "side-chain" of Float32 data that can be fed or generated by an AudioUnit
                          and is used to send a high density of parameter value control information.
                          An AU will typically run a ParameterValueStream at either the sample rate of
                          the AudioUnit's audio data, or some integer divisor of this (say a half or a
                          third of the sample rate of the audio). The Sample Rate of the ASBD
                          describes this relationship. It has no flags.
      @constant       kAudioFormatAppleLossless
                          Apple Lossless, the flags indicate the bit depth of the source material.
      @constant       kAudioFormatMPEG4AAC_HE
                          MPEG-4 High Efficiency AAC audio object, has no flags.
      @constant       kAudioFormatMPEG4AAC_LD
                          MPEG-4 AAC Low Delay audio object, has no flags.
      @constant       kAudioFormatMPEG4AAC_ELD
                          MPEG-4 AAC Enhanced Low Delay audio object, has no flags. This is the formatID of
                          the base layer without the SBR extension. See also kAudioFormatMPEG4AAC_ELD_SBR
      @constant       kAudioFormatMPEG4AAC_ELD_SBR
                          MPEG-4 AAC Enhanced Low Delay audio object with SBR extension layer, has no flags.
      @constant       kAudioFormatMPEG4AAC_HE_V2
                          MPEG-4 High Efficiency AAC Version 2 audio object, has no flags.
      @constant       kAudioFormatMPEG4AAC_Spatial
                          MPEG-4 Spatial Audio audio object, has no flags.
      @constant       kAudioFormatMPEGD_USAC
                          MPEG-D Unified Speech and Audio Coding, has no flags.
      @constant       kAudioFormatAMR
                          The AMR Narrow Band speech codec.
      @constant       kAudioFormatAMR_WB
                          The AMR Wide Band speech codec.
      @constant       kAudioFormatAudible
                          The format used for Audible audio books. It has no flags.
      @constant       kAudioFormatiLBC
                          The iLBC narrow band speech codec. It has no flags.
      @constant       kAudioFormatDVIIntelIMA
                          DVI/Intel IMA ADPCM - ACM code 17.
      @constant       kAudioFormatMicrosoftGSM
                          Microsoft GSM 6.10 - ACM code 49.
      @constant       kAudioFormatAES3
                          This format is defined by AES3-2003, and adopted into MXF and MPEG-2
                          containers and SDTI transport streams with SMPTE specs 302M-2002 and
                          331M-2000. It has no flags.
      @constant       kAudioFormatEnhancedAC3
                          Enhanced AC-3, has no flags.
      @constant       kAudioFormatFLAC
                          Free Lossless Audio Codec, the flags indicate the bit depth of the source material.
      @constant       kAudioFormatOpus
                          Opus codec, has no flags.
  */
  //typedef CF_ENUM(AudioFormatID) {
    JS_ASSIGN_ENUM(kAudioFormatLinearPCM, AudioFormatID); //                = 'lpcm',
    JS_ASSIGN_ENUM(kAudioFormatAC3, AudioFormatID); //                      = 'ac-3',
    JS_ASSIGN_ENUM(kAudioFormat60958AC3, AudioFormatID); //                 = 'cac3',
    JS_ASSIGN_ENUM(kAudioFormatAppleIMA4, AudioFormatID); //                = 'ima4',
    JS_ASSIGN_ENUM(kAudioFormatMPEG4AAC, AudioFormatID); //                 = 'aac ',
    JS_ASSIGN_ENUM(kAudioFormatMPEG4CELP, AudioFormatID); //                = 'celp',
    JS_ASSIGN_ENUM(kAudioFormatMPEG4HVXC, AudioFormatID); //                = 'hvxc',
    JS_ASSIGN_ENUM(kAudioFormatMPEG4TwinVQ, AudioFormatID); //              = 'twvq',
    JS_ASSIGN_ENUM(kAudioFormatMACE3, AudioFormatID); //                    = 'MAC3',
    JS_ASSIGN_ENUM(kAudioFormatMACE6, AudioFormatID); //                    = 'MAC6',
    JS_ASSIGN_ENUM(kAudioFormatULaw, AudioFormatID); //                     = 'ulaw',
    JS_ASSIGN_ENUM(kAudioFormatALaw, AudioFormatID); //                     = 'alaw',
    JS_ASSIGN_ENUM(kAudioFormatQDesign, AudioFormatID); //                  = 'QDMC',
    JS_ASSIGN_ENUM(kAudioFormatQDesign2, AudioFormatID); //                 = 'QDM2',
    JS_ASSIGN_ENUM(kAudioFormatQUALCOMM, AudioFormatID); //                 = 'Qclp',
    JS_ASSIGN_ENUM(kAudioFormatMPEGLayer1, AudioFormatID); //               = '.mp1',
    JS_ASSIGN_ENUM(kAudioFormatMPEGLayer2, AudioFormatID); //               = '.mp2',
    JS_ASSIGN_ENUM(kAudioFormatMPEGLayer3, AudioFormatID); //               = '.mp3',
    JS_ASSIGN_ENUM(kAudioFormatTimeCode, AudioFormatID); //                 = 'time',
    JS_ASSIGN_ENUM(kAudioFormatMIDIStream, AudioFormatID); //               = 'midi',
    JS_ASSIGN_ENUM(kAudioFormatParameterValueStream, AudioFormatID); //     = 'apvs',
    JS_ASSIGN_ENUM(kAudioFormatAppleLossless, AudioFormatID); //            = 'alac',
    JS_ASSIGN_ENUM(kAudioFormatMPEG4AAC_HE, AudioFormatID); //              = 'aach',
    JS_ASSIGN_ENUM(kAudioFormatMPEG4AAC_LD, AudioFormatID); //              = 'aacl',
    JS_ASSIGN_ENUM(kAudioFormatMPEG4AAC_ELD, AudioFormatID); //             = 'aace',
    JS_ASSIGN_ENUM(kAudioFormatMPEG4AAC_ELD_SBR, AudioFormatID); //         = 'aacf',
    JS_ASSIGN_ENUM(kAudioFormatMPEG4AAC_ELD_V2, AudioFormatID); //          = 'aacg',
    JS_ASSIGN_ENUM(kAudioFormatMPEG4AAC_HE_V2, AudioFormatID); //           = 'aacp',
    JS_ASSIGN_ENUM(kAudioFormatMPEG4AAC_Spatial, AudioFormatID); //         = 'aacs',
    JS_ASSIGN_ENUM(kAudioFormatMPEGD_USAC, AudioFormatID); //               = 'usac',
    JS_ASSIGN_ENUM(kAudioFormatAMR, AudioFormatID); //                      = 'samr',
    JS_ASSIGN_ENUM(kAudioFormatAMR_WB, AudioFormatID); //                   = 'sawb',
    JS_ASSIGN_ENUM(kAudioFormatAudible, AudioFormatID); //                  = 'AUDB',
    JS_ASSIGN_ENUM(kAudioFormatiLBC, AudioFormatID); //                     = 'ilbc',
    JS_ASSIGN_ENUM(kAudioFormatDVIIntelIMA, AudioFormatID); //              = 0x6D730011,
    JS_ASSIGN_ENUM(kAudioFormatMicrosoftGSM, AudioFormatID); //             = 0x6D730031,
    JS_ASSIGN_ENUM(kAudioFormatAES3, AudioFormatID); //                     = 'aes3',
    JS_ASSIGN_ENUM(kAudioFormatEnhancedAC3, AudioFormatID); //              = 'ec-3',
    JS_ASSIGN_ENUM(kAudioFormatFLAC, AudioFormatID); //                     = 'flac',
    JS_ASSIGN_ENUM(kAudioFormatOpus, AudioFormatID); //                     = 'opus'
  //};

  /*!
      @enum           Standard AudioFormatFlags Values for AudioStreamBasicDescription
      @abstract       These are the standard AudioFormatFlags for use in the mFormatFlags field of the
                      AudioStreamBasicDescription structure.
      @discussion     Typically, when an ASBD is being used, the fields describe the complete layout
                      of the sample data in the buffers that are represented by this description -
                      where typically those buffers are represented by an AudioBuffer that is
                      contained in an AudioBufferList.

                      However, when an ASBD has the kAudioFormatFlagIsNonInterleaved flag, the
                      AudioBufferList has a different structure and semantic. In this case, the ASBD
                      fields will describe the format of ONE of the AudioBuffers that are contained in
                      the list, AND each AudioBuffer in the list is determined to have a single (mono)
                      channel of audio data. Then, the ASBD's mChannelsPerFrame will indicate the
                      total number of AudioBuffers that are contained within the AudioBufferList -
                      where each buffer contains one channel. This is used primarily with the
                      AudioUnit (and AudioConverter) representation of this list - and won't be found
                      in the AudioHardware usage of this structure.
      @constant       kAudioFormatFlagIsFloat
                          Set for floating point, clear for integer.
      @constant       kAudioFormatFlagIsBigEndian
                          Set for big endian, clear for little endian.
      @constant       kAudioFormatFlagIsSignedInteger
                          Set for signed integer, clear for unsigned integer. This is only valid if
                          kAudioFormatFlagIsFloat is clear.
      @constant       kAudioFormatFlagIsPacked
                          Set if the sample bits occupy the entire available bits for the channel,
                          clear if they are high or low aligned within the channel. Note that even if
                          this flag is clear, it is implied that this flag is set if the
                          AudioStreamBasicDescription is filled out such that the fields have the
                          following relationship:
                             ((mBitsPerSample / 8) * mChannelsPerFrame) == mBytesPerFrame
      @constant       kAudioFormatFlagIsAlignedHigh
                          Set if the sample bits are placed into the high bits of the channel, clear
                          for low bit placement. This is only valid if kAudioFormatFlagIsPacked is
                          clear.
      @constant       kAudioFormatFlagIsNonInterleaved
                          Set if the samples for each channel are located contiguously and the
                          channels are layed out end to end, clear if the samples for each frame are
                          layed out contiguously and the frames layed out end to end.
      @constant       kAudioFormatFlagIsNonMixable
                          Set to indicate when a format is non-mixable. Note that this flag is only
                          used when interacting with the HAL's stream format information. It is not a
                          valid flag for any other uses.
      @constant       kAudioFormatFlagsAreAllClear
                          Set if all the flags would be clear in order to preserve 0 as the wild card
                          value.
      @constant       kLinearPCMFormatFlagIsFloat
                          Synonym for kAudioFormatFlagIsFloat.
      @constant       kLinearPCMFormatFlagIsBigEndian
                          Synonym for kAudioFormatFlagIsBigEndian.
      @constant       kLinearPCMFormatFlagIsSignedInteger
                          Synonym for kAudioFormatFlagIsSignedInteger.
      @constant       kLinearPCMFormatFlagIsPacked
                          Synonym for kAudioFormatFlagIsPacked.
      @constant       kLinearPCMFormatFlagIsAlignedHigh
                          Synonym for kAudioFormatFlagIsAlignedHigh.
      @constant       kLinearPCMFormatFlagIsNonInterleaved
                          Synonym for kAudioFormatFlagIsNonInterleaved.
      @constant       kLinearPCMFormatFlagIsNonMixable
                          Synonym for kAudioFormatFlagIsNonMixable.
      @constant       kLinearPCMFormatFlagsAreAllClear
                          Synonym for kAudioFormatFlagsAreAllClear.
      @constant       kLinearPCMFormatFlagsSampleFractionShift
                          The linear PCM flags contain a 6-bit bitfield indicating that an integer
                          format is to be interpreted as fixed point. The value indicates the number
                          of bits are used to represent the fractional portion of each sample value.
                          This constant indicates the bit position (counting from the right) of the
                          bitfield in mFormatFlags.
      @constant       kLinearPCMFormatFlagsSampleFractionMask
                          number_fractional_bits = (mFormatFlags &
                          kLinearPCMFormatFlagsSampleFractionMask) >>
                          kLinearPCMFormatFlagsSampleFractionShift
      @constant       kAppleLosslessFormatFlag_16BitSourceData
                          This flag is set for Apple Lossless data that was sourced from 16 bit native
                          endian signed integer data.
      @constant       kAppleLosslessFormatFlag_20BitSourceData
                          This flag is set for Apple Lossless data that was sourced from 20 bit native
                          endian signed integer data aligned high in 24 bits.
      @constant       kAppleLosslessFormatFlag_24BitSourceData
                          This flag is set for Apple Lossless data that was sourced from 24 bit native
                          endian signed integer data.
      @constant       kAppleLosslessFormatFlag_32BitSourceData
                          This flag is set for Apple Lossless data that was sourced from 32 bit native
                          endian signed integer data.
  */
  //CF_ENUM(AudioFormatFlags) {
    JS_ASSIGN_ENUM(kAudioFormatFlagIsFloat, AudioFormatFlags); //                      = (1U << 0),     // 0x1
    JS_ASSIGN_ENUM(kAudioFormatFlagIsBigEndian, AudioFormatFlags); //                  = (1U << 1),     // 0x2
    JS_ASSIGN_ENUM(kAudioFormatFlagIsSignedInteger, AudioFormatFlags); //              = (1U << 2),     // 0x4
    JS_ASSIGN_ENUM(kAudioFormatFlagIsPacked, AudioFormatFlags); //                     = (1U << 3),     // 0x8
    JS_ASSIGN_ENUM(kAudioFormatFlagIsAlignedHigh, AudioFormatFlags); //                = (1U << 4),     // 0x10
    JS_ASSIGN_ENUM(kAudioFormatFlagIsNonInterleaved, AudioFormatFlags); //             = (1U << 5),     // 0x20
    JS_ASSIGN_ENUM(kAudioFormatFlagIsNonMixable, AudioFormatFlags); //                 = (1U << 6),     // 0x40
    JS_ASSIGN_ENUM(kAudioFormatFlagsAreAllClear, AudioFormatFlags); //                 = 0x80000000,

    JS_ASSIGN_ENUM(kLinearPCMFormatFlagIsFloat, AudioFormatFlags); //                  = kAudioFormatFlagIsFloat,
    JS_ASSIGN_ENUM(kLinearPCMFormatFlagIsBigEndian, AudioFormatFlags); //              = kAudioFormatFlagIsBigEndian,
    JS_ASSIGN_ENUM(kLinearPCMFormatFlagIsSignedInteger, AudioFormatFlags); //          = kAudioFormatFlagIsSignedInteger,
    JS_ASSIGN_ENUM(kLinearPCMFormatFlagIsPacked, AudioFormatFlags); //                 = kAudioFormatFlagIsPacked,
    JS_ASSIGN_ENUM(kLinearPCMFormatFlagIsAlignedHigh, AudioFormatFlags); //            = kAudioFormatFlagIsAlignedHigh,
    JS_ASSIGN_ENUM(kLinearPCMFormatFlagIsNonInterleaved, AudioFormatFlags); //         = kAudioFormatFlagIsNonInterleaved,
    JS_ASSIGN_ENUM(kLinearPCMFormatFlagIsNonMixable, AudioFormatFlags); //             = kAudioFormatFlagIsNonMixable,
    JS_ASSIGN_ENUM(kLinearPCMFormatFlagsSampleFractionShift, AudioFormatFlags); //     = 7,
    JS_ASSIGN_ENUM(kLinearPCMFormatFlagsSampleFractionMask, AudioFormatFlags); //      = (0x3F << kLinearPCMFormatFlagsSampleFractionShift),
    JS_ASSIGN_ENUM(kLinearPCMFormatFlagsAreAllClear, AudioFormatFlags); //             = kAudioFormatFlagsAreAllClear,

    JS_ASSIGN_ENUM(kAppleLosslessFormatFlag_16BitSourceData, AudioFormatFlags); //     = 1,
    JS_ASSIGN_ENUM(kAppleLosslessFormatFlag_20BitSourceData, AudioFormatFlags); //     = 2,
    JS_ASSIGN_ENUM(kAppleLosslessFormatFlag_24BitSourceData, AudioFormatFlags); //     = 3,
    JS_ASSIGN_ENUM(kAppleLosslessFormatFlag_32BitSourceData, AudioFormatFlags); //     = 4
  //};


  /*!
      @enum           Commonly Used Combinations of AudioFormatFlags
      @abstract       Some commonly used combinations of flags for AudioStreamBasicDescriptions.
      @constant       kAudioFormatFlagsNativeEndian
                          Defined to set or clear kAudioFormatFlagIsBigEndian depending on the
                          endianness of the processor at build time.
      @constant       kAudioFormatFlagsCanonical
                          The flags for the canonical audio sample type. This matches AudioSampleType.
      @constant       kAudioFormatFlagsAudioUnitCanonical
                          The flags for the canonical audio unit sample type. This matches
                          AudioUnitSampleType.
      @constant       kAudioFormatFlagsNativeFloatPacked
                          The flags for fully packed, native endian floating point data.
   
      @discussion
          The "canonical" flags are deprecated. CA_PREFER_FIXED_POINT is discouraged because floating-
          point performance on iOS is such that fixed point is no longer truly preferred. All Apple-
          supplied AudioUnits support floating point. Replacement should be done with careful
          consideration of the format being specified or expected, but often
          kAudioFormatFlagsCanonical can be replaced with kAudioFormatFlagsNativeFloatPacked, and
          kAudioFormatFlagsAudioUnitCanonical with kAudioFormatFlagsNativeFloatPacked |
          kAudioFormatFlagIsNonInterleaved.
  */
  //CF_ENUM(AudioFormatFlags) {
#if TARGET_RT_BIG_ENDIAN
    JS_ASSIGN_ENUM(kAudioFormatFlagsNativeEndian, AudioFormatFlags); //        = kAudioFormatFlagIsBigEndian,
#else
    JS_ASSIGN_ENUM(kAudioFormatFlagsNativeEndian, AudioFormatFlags); //        = 0,
#endif
#if !defined(CA_PREFER_FIXED_POINT) || !CA_PREFER_FIXED_POINT
    JS_ASSIGN_ENUM(kAudioFormatFlagsCanonical, AudioFormatFlags); //  CA_CANONICAL_DEPRECATED          = kAudioFormatFlagIsFloat | kAudioFormatFlagsNativeEndian | kAudioFormatFlagIsPacked,
    JS_ASSIGN_ENUM(kAudioFormatFlagsAudioUnitCanonical, AudioFormatFlags); //  CA_CANONICAL_DEPRECATED = kAudioFormatFlagIsFloat | kAudioFormatFlagsNativeEndian | kAudioFormatFlagIsPacked | kAudioFormatFlagIsNonInterleaved,
#else
    JS_ASSIGN_ENUM(kAudioFormatFlagsCanonical, AudioFormatFlags); //  CA_CANONICAL_DEPRECATED          = kAudioFormatFlagIsSignedInteger | kAudioFormatFlagsNativeEndian | kAudioFormatFlagIsPacked,
    JS_ASSIGN_ENUM(kAudioFormatFlagsAudioUnitCanonical, AudioFormatFlags); //  CA_CANONICAL_DEPRECATED = kAudioFormatFlagIsSignedInteger | kAudioFormatFlagsNativeEndian | kAudioFormatFlagIsPacked | kAudioFormatFlagIsNonInterleaved | (kAudioUnitSampleFractionBits << kLinearPCMFormatFlagsSampleFractionShift),
#endif
    JS_ASSIGN_ENUM(kAudioFormatFlagsNativeFloatPacked, AudioFormatFlags); //   = kAudioFormatFlagIsFloat | kAudioFormatFlagsNativeEndian | kAudioFormatFlagIsPacked
  //};



JS_INIT_GLOBALS_END(CoreAudioBaseTypes);
