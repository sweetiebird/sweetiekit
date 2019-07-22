//
//  NAVAudioTypes.h
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioTypes_h
#define NAVAudioTypes_h    

#include "NNSObject.h"

/*! @typedef AVAudioFramePosition
  @abstract A position in an audio file or stream.
*/
//typedef int64_t    AVAudioFramePosition;
#define js_value_AVAudioFramePosition js_value_int64_t
#define to_value_AVAudioFramePosition to_value_int64_t
#define is_value_AVAudioFramePosition is_value_int64_t

/*!  @typedef AVAudioFrameCount
  @abstract A number of audio sample frames.
  
  @discussion
    Rationale: making this a potentially larger-than-32-bit type like NSUInteger would open the
    door to a large set of runtime failures due to underlying implementations' use of UInt32.
    
    TODO: Remove rationales.
*/
//typedef uint32_t  AVAudioFrameCount;
#define js_value_AVAudioFrameCount js_value_uint32_t
#define to_value_AVAudioFrameCount to_value_uint32_t
#define is_value_AVAudioFrameCount is_value_uint32_t

/*!  @typedef AVAudioPacketCount
  @abstract A number of packets of compressed audio data.
  
  @discussion
    Rationale: making this a potentially larger-than-32-bit type like NSUInteger would open the
    door to a large set of runtime failures due to underlying implementations' use of UInt32.
    
    TODO: Remove rationales.
*/
//typedef uint32_t  AVAudioPacketCount;
#define js_value_AVAudioPacketCount js_value_uint32_t
#define to_value_AVAudioPacketCount to_value_uint32_t
#define is_value_AVAudioPacketCount is_value_uint32_t

/*!  @typedef AVAudioChannelCount
  @abstract A number of audio channels.
  
  @discussion
    Rationale: making this a potentially larger-than-32-bit type like NSUInteger would open the
    door to a large set of runtime failures due to underlying implementations' use of UInt32.
*/
//typedef uint32_t  AVAudioChannelCount;
#define js_value_AVAudioChannelCount js_value_uint32_t
#define to_value_AVAudioChannelCount to_value_uint32_t
#define is_value_AVAudioChannelCount is_value_uint32_t

/*!  @typedef AVAudioNodeBus
  @abstract The index of a bus on an AVAudioNode.
  @discussion
    AVAudioNode objects potentially have multiple input and/or output busses.
    AVAudioNodeBus represents a bus as a zero-based index.
*/
//typedef NSUInteger AVAudioNodeBus;
#define js_value_AVAudioNodeBus js_value_NSUInteger
#define to_value_AVAudioNodeBus to_value_NSUInteger
#define is_value_AVAudioNodeBus is_value_NSUInteger


JS_DECLARE_STRUCT(AVAudio3DPoint);
JS_DECLARE_STRUCT(AVAudio3DVector);
//
//#define js_value_AVAudio3DVector js_value_AVAudio3DPoint
//#define to_value_AVAudio3DVector to_value_AVAudio3DPoint
//#define is_value_AVAudio3DVector is_value_AVAudio3DPoint

JS_DECLARE_STRUCT(AVAudio3DVectorOrientation);
JS_DECLARE_STRUCT(AVAudio3DAngularOrientation);

JS_WRAP_GLOBALS(AVAudioTypes);
JS_WRAP_GLOBALS_END(AVAudioTypes);

#endif /* NAVAudioTypes_h */
