//
//  NCMSampleBuffer.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCMSampleBuffer.h"

#include "NCVImageBuffer.h"
#include "NCFBase.h"

NAN_METHOD(CMSampleBufferGetImageBuffer) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CMSampleBufferRef, sbuf);
    js_return_value(CVImageBufferRef, ::CMSampleBufferGetImageBuffer(sbuf));
  }
}

JS_INIT_GLOBALS(CMSampleBuffer);
  // global values (exports)
  JS_ASSIGN_GLOBAL_METHOD(CMSampleBufferGetImageBuffer);

  // The following keys may be attached to individual samples via the CMSampleBufferGetSampleAttachmentsArray() interface:
  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_NotSync, CFStringRef); //   // CFBoolean (absence of this key implies Sync)
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_PartialSync, CFStringRef); //   // CFBoolean (absence of this key implies not Partial Sync. If NotSync is false, PartialSync should be ignored.)
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_HasRedundantCoding, CFStringRef); //   // kCFBooleanTrue, kCFBooleanFalse, or absent if unknown
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_IsDependedOnByOthers, CFStringRef); //   // kCFBooleanTrue, kCFBooleanFalse, or absent if unknown
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_DependsOnOthers, CFStringRef); //   // kCFBooleanTrue (e.g., non-I-frame), kCFBooleanFalse (e.g. I-frame), or absent if unknown
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_EarlierDisplayTimesAllowed, CFStringRef); //   // CFBoolean
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
  // A frame is considered droppable if and only if kCMSampleAttachmentKey_IsDependedOnByOthers is present and set to kCFBooleanFalse.

  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_DisplayImmediately, CFStringRef); //   // CFBoolean
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_DoNotDisplay, CFStringRef); //   // CFBoolean
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  // The following keys may be attached to sample buffers using CMSetAttachment():
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_ResetDecoderBeforeDecoding, CFStringRef); //   // CFBoolean
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_DrainAfterDecoding, CFStringRef); //   // CFBoolean
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_PostNotificationWhenConsumed, CFStringRef); //   // CFDictionary (client-defined)
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_ResumeOutput, CFStringRef); //   // CFNumber (ResumeTag)
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleAttachmentKey_HEVCTemporalLevelInfo
    @abstract  Indicates a video frame's level within a hierarchical frame dependency structure.
    @discussion
      When present, the temporal level attachments among a group of video frames provide information about where inter-frame dependencies may and may not exist.  
      The temporal level attachment, if present, is a positive CFNumber, and indicates that this video frame does not depend on any video frame with a greater temporal level.
      The attachment may be absent if no such information is available.

  */
  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_HEVCTemporalLevelInfo, CFStringRef); //   // CFDictionary(kCMHEVCTemporalLevelInfoKey_*), optional.  Corresponds to 'tscl' sample group.
                //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));

  JS_ASSIGN_ENUM(kCMHEVCTemporalLevelInfoKey_TemporalLevel, CFStringRef); //           // CFNumber(Int)
                //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMHEVCTemporalLevelInfoKey_ProfileSpace, CFStringRef); //           // CFNumber(Int)
                //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMHEVCTemporalLevelInfoKey_TierFlag, CFStringRef); //             // CFNumber(Int)
                //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMHEVCTemporalLevelInfoKey_ProfileIndex, CFStringRef); //           // CFNumber(Int)
                //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMHEVCTemporalLevelInfoKey_ProfileCompatibilityFlags, CFStringRef); //     // CFData(4 bytes)
                //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMHEVCTemporalLevelInfoKey_ConstraintIndicatorFlags, CFStringRef); //     // CFData(6 bytes)
                //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));
  JS_ASSIGN_ENUM(kCMHEVCTemporalLevelInfoKey_LevelIndex, CFStringRef); //             // CFNumber(Int)
                //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));

  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_HEVCTemporalSubLayerAccess, CFStringRef); //       // CFBoolean, optional.  Corresponds to 'tsas' sample group.
                //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));

  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_HEVCStepwiseTemporalSubLayerAccess, CFStringRef); //   // CFBoolean, optional.  Corresponds to 'stsa' sample group.
                //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));

  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_HEVCSyncSampleNALUnitType, CFStringRef); //       // CFNumber(Int), optional.  Corresponds to 'sync' sample group.
    //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));

#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && (__IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_13_0)
  // The kCMSampleAttachmentKey_AudioIndependentSampleDecoderRefreshCount sample attachment
  // is only present if the audio sample is an IndependentFrame (IF, value is non-zero) or ImmediatePlayoutFrame (IPF, value is zero).
  JS_ASSIGN_ENUM(kCMSampleAttachmentKey_AudioIndependentSampleDecoderRefreshCount, CFStringRef); //   // CFNumber(Int), optional.
    //API_AVAILABLE(macos(10.15), ios(13.0), tvos(13.0), watchos(6.0));
#endif

  /*!
    @constant  kCMSampleBufferAttachmentKey_TransitionID
    @abstract  Marks a transition from one source of buffers (eg. song) to another
    @discussion
      For example, during gapless playback of a list of songs, this attachment marks the first buffer from the next song.
      If this attachment is on a buffer containing no samples, the first following buffer that contains samples is the
      buffer that contains the first samples from the next song.  The value of this attachment is a CFTypeRef.  This
      transition identifier should be unique within a playlist, so each transition in a playlist is uniquely
      identifiable.  A CFNumberRef counter that increments with each transition is a simple example.
  */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_TransitionID, CFStringRef); // 
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_TrimDurationAtStart
    @abstract  The duration that should be removed at the beginning of the sample buffer, after decoding.
    @discussion
      If this attachment is not present, the trim duration is zero (nothing removed).
      This is a CMTime in CFDictionary format as made by CMTimeCopyAsDictionary; 
      use CMTimeMakeFromDictionary to convert to CMTime.
      In cases where all the output after decoding the sample buffer is to be discarded 
      (eg, the samples are only being decoded to prime the decoder) the usual convention
      is to set kCMSampleBufferAttachmentKey_TrimDurationAtStart to the whole duration 
      and not to set a kCMSampleBufferAttachmentKey_TrimDurationAtEnd attachment.
      Note that setting or removing kCMSampleBufferAttachmentKey_TrimDurationAtStart from
      a sample buffer will not adjust an explicitly-set OutputPresentationTimeStamp.
  */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_TrimDurationAtStart, CFStringRef); //   // CFDictionary/CMTime, default 0
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_TrimDurationAtEnd
    @abstract  The duration that should be removed at the end of the sample buffer, after decoding.
    @discussion
      If this attachment is not present, the trim duration is zero (nothing removed).
      This is a CMTime in CFDictionary format as made by CMTimeCopyAsDictionary; 
      use CMTimeMakeFromDictionary to convert to CMTime.
  */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_TrimDurationAtEnd, CFStringRef); //   // CFDictionary/CMTime, default 0
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_SpeedMultiplier
    @abstract  The factor by which the sample buffer's presentation should be accelerated (eg, in a scaled edit).
    @discussion
      For normal playback the speed multiplier would be 1.0 (which is used if this attachment is not present); 
      for double-speed playback the speed multiplier would be 2.0, which would halve the output duration.
      Speed-multiplication factors take effect after trimming; see CMSampleBufferGetOutputDuration.
      Note that this attachment principally provides information about the duration-stretching effect:
      by default, it should be implemented by rate conversion, but other attachments may specify richer 
      stretching operations -- for example, scaling without pitch shift, or pitch shift without changing duration.
      Sequences of speed-multiplied sample buffers should have explicit OutputPresentationTimeStamp attachments 
      to clarify when each should be output.
  */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_SpeedMultiplier, CFStringRef); //   // CFNumber, positive, default 1
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_Reverse
    @abstract  Indicates that the decoded contents of the sample buffer should be reversed.
      If this attachment is not present, the sample buffer should be played forwards as usual.
      Reversal occurs after trimming and speed multipliers.

  */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_Reverse, CFStringRef); //   // CFBoolean, default false
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_FillDiscontinuitiesWithSilence
    @abstract  Fill the difference between discontiguous sample buffers with silence.
    @discussion
      If a sample buffer enters a buffer queue and the presentation time stamp between the
      previous buffer and the buffer with this attachment are discontiguous, handle the
      discontinuity by generating silence for the time difference.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_FillDiscontinuitiesWithSilence, CFStringRef); //   // CFBoolean, default false
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_EmptyMedia
    @abstract  Marks an intentionally empty interval in the sequence of samples.
    @discussion
      The sample buffer's output presentation timestamp indicates when the empty interval begins.
      Marker sample buffers with this attachment are used to announce the arrival of empty edits.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_EmptyMedia, CFStringRef); //   // CFBoolean, default false
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_PermanentEmptyMedia
    @abstract  Marks the end of the sequence of samples.
    @discussion
      Marker sample buffers with this attachment in addition to kCMSampleBufferAttachmentKey_EmptyMedia
      are used to indicate that no further samples are expected.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_PermanentEmptyMedia, CFStringRef); //   // CFBoolean, default false
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_DisplayEmptyMediaImmediately
    @abstract  Tells that the empty marker should be dequeued immediately regardless of its timestamp.
    @discussion
      Marker sample buffers with this attachment in addition to kCMSampleBufferAttachmentKey_EmptyMedia
      are used to tell that the empty sample buffer should be dequeued immediately regardless of its timestamp.
      This attachment should only be used with sample buffers with the kCMSampleBufferAttachmentKey_EmptyMedia
      attachment.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_DisplayEmptyMediaImmediately, CFStringRef); // 
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_EndsPreviousSampleDuration
    @abstract  Indicates that sample buffer's decode timestamp may be used to define the previous sample buffer's duration.
    @discussion
      Marker sample buffers with this attachment may be used in situations where sample buffers are transmitted
      before their duration is known. In such situations, normally the recipient may use each sample buffer's timestamp
      to calculate the duration of the previous sample buffer. The marker sample buffer with this attachment is sent
      to provide the timestamp for calculating the final sample buffer's duration.
  */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_EndsPreviousSampleDuration, CFStringRef); //   // CFBoolean, default false
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_SampleReferenceURL
    @abstract  Indicates the URL where the sample data is.
    @discussion
      This key is only used for CMSampleBuffers representing sample references.  
      Such CMSampleBuffers:
       - have dataBuffer == NULL and imageBuffer == NULL
       - have dataReady == true and no makeDataReadyCallback
       - have a non-NULL formatDescription
       - have numSamples > 0
       - have numSampleTimingEntries > 0 and numSampleSizeEntries > 0
  */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_SampleReferenceURL, CFStringRef); //   // CFURL
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_SampleReferenceByteOffset
    @abstract  Indicates the byte offset at which the sample data begins.
    @discussion
      This key is only used for CMSampleBuffers representing sample references.  
      Such CMSampleBuffers:
       - have dataBuffer == NULL and imageBuffer == NULL
       - have dataReady == true and no makeDataReadyCallback
       - have a non-NULL formatDescription
       - have numSamples > 0
       - have numSampleTimingEntries > 0 and numSampleSizeEntries > 0
  */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_SampleReferenceByteOffset, CFStringRef); //   // CFNumber, byte offset from beginning of URL to contiguous data
                //API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_GradualDecoderRefresh
    @abstract  Indicates the decoder refresh count.
    @discussion
      Sample buffers with this attachment may be used to identify the audio decoder refresh count.
  */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_GradualDecoderRefresh, CFStringRef); //   // CFNumber, audio decoder refresh count
                  //API_AVAILABLE(macos(10.7), ios(4.3), tvos(9.0), watchos(6.0));
      
    /*!
      @constant  kCMSampleBufferAttachmentKey_DroppedFrameReason
      @abstract  Indicates the reason the current video frame was dropped.
      @discussion
        Sample buffers with this attachment contain no image or data buffer.  They mark a dropped video
        frame.  This attachment identifies the reason for the droppage.
    */
    JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_DroppedFrameReason, CFStringRef); //   // CFString, frame drop reason
                  //API_AVAILABLE(macos(10.9), ios(6.0), tvos(9.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferDroppedFrameReason_FrameWasLate
    @abstract  The frame was dropped because it was late
    @discussion
      The value of kCMSampleBufferAttachmentKey_DroppedFrameReason if a video capture client has indicated 
      that late video frames should be dropped and the current frame is late.  This condition is typically
      caused by the client's processing taking too long.
  */
  JS_ASSIGN_ENUM(kCMSampleBufferDroppedFrameReason_FrameWasLate, CFStringRef); // 
                //API_AVAILABLE(macos(10.9), ios(6.0), tvos(9.0), watchos(6.0));
    
  /*!
    @constant  kCMSampleBufferDroppedFrameReason_OutOfBuffers
    @abstract  The frame was dropped because the module providing frames is out of buffers
    @discussion
      The value of kCMSampleBufferAttachmentKey_DroppedFrameReason if the module providing sample buffers
      has run out of source buffers.  This condition is typically caused by the client holding onto
      buffers for too long and can be alleviated by returning buffers to the provider.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferDroppedFrameReason_OutOfBuffers, CFStringRef); // 
                //API_AVAILABLE(macos(10.9), ios(6.0), tvos(9.0), watchos(6.0));
    
  /*!
    @constant  kCMSampleBufferDroppedFrameReason_Discontinuity
    @abstract  An unknown number of frames were dropped
    @discussion
      The value of kCMSampleBufferAttachmentKey_DroppedFrameReason if the module providing sample buffers
      has experienced a discontinuity, and an unknown number of frames have been lost.  This condition is 
      typically caused by the system being too busy.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferDroppedFrameReason_Discontinuity, CFStringRef); // 
                //API_AVAILABLE(macos(10.9), ios(6.0), tvos(9.0), watchos(6.0));
    
  /*!
    @constant  kCMSampleBufferAttachmentKey_DroppedFrameReasonInfo
    @abstract  Indicates additional information regarding the dropped video frame.
    @discussion
      Sample buffers with this attachment contain no image or data buffer.  They mark a dropped video
      frame. If present, this attachment provides additional information about the kCMSampleBufferAttachmentKey_DroppedFrameReason.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_DroppedFrameReasonInfo, CFStringRef); //   
                //API_AVAILABLE(macos(10.10), ios(7.0), tvos(9.0), watchos(6.0)); // CFString, dropped frame reason additional information
    
  /*!
    @constant  kCMSampleBufferDroppedFrameReasonInfo_CameraModeSwitch
    @abstract  A discontinuity was caused by a camera mode switch.
    @discussion
      The value of kCMSampleBufferAttachmentKey_DroppedFrameReasonInfo if the module providing sample buffers
      has experienced a discontinuity due to a camera mode switch. Short discontinuities of this type can occur when the 
      session is configured for still image capture on some devices.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferDroppedFrameReasonInfo_CameraModeSwitch, CFStringRef); // 
                //API_AVAILABLE(macos(10.10), ios(7.0), tvos(9.0), watchos(6.0));
    
    
    
  /*!
    @constant  kCMSampleBufferAttachmentKey_StillImageLensStabilizationInfo
    @abstract  Indicates information about the lens stabilization applied to the current still image buffer.
    @discussion
          Sample buffers that have been captured with a lens stabilization module may have an attachment of
      kCMSampleBufferAttachmentKey_StillImageLensStabilizationInfo which has information about the stabilization status
          during the capture.  This key will not be present in CMSampleBuffers coming from cameras without a lens stabilization module.
  */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_StillImageLensStabilizationInfo, CFStringRef); //   // CFString, one of kCMSampleBufferLensStabilizationInfo_*
                //API_AVAILABLE(macos(10.11), ios(9.0), tvos(9.0), watchos(6.0));

  /*!
   @constant  kCMSampleBufferLensStabilizationInfo_Active
   @abstract  The lens stabilization module was active for the duration this buffer.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferLensStabilizationInfo_Active, CFStringRef); //   // CFString
                //API_AVAILABLE(macos(10.11), ios(9.0), tvos(9.0), watchos(6.0));

  /*!
   @constant  kCMSampleBufferLensStabilizationInfo_OutOfRange
   @abstract  The motion of the device or duration of the capture was outside of what the stabilization mechanism could support.
   @discussion
    The value of kCMSampleBufferAttachmentKey_StillImageLensStabilizationInfo if the module stabilizing the lens was unable to
    compensate for the movement.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferLensStabilizationInfo_OutOfRange, CFStringRef); //   // CFString
                //API_AVAILABLE(macos(10.11), ios(9.0), tvos(9.0), watchos(6.0));

  /*!
   @constant  kCMSampleBufferLensStabilizationInfo_Unavailable
   @abstract  The lens stabilization module was unavailable for use.
   @discussion
    The value of kCMSampleBufferAttachmentKey_StillImageLensStabilizationInfo if the lens stabilization module is unavailable
    to compensate for the motion of the device.  The module may be available at a later time.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferLensStabilizationInfo_Unavailable, CFStringRef); //   // CFString
                //API_AVAILABLE(macos(10.11), ios(9.0), tvos(9.0), watchos(6.0));

  /*!
   @constant  kCMSampleBufferLensStabilizationInfo_Off
   @abstract  The lens stabilization module was not used during this capture.
   @discussion
    The value of kCMSampleBufferAttachmentKey_StillImageLensStabilizationInfo if the lens stabilization module was not used for this capture.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferLensStabilizationInfo_Off, CFStringRef); //   // CFString
                //API_AVAILABLE(macos(10.11), ios(9.0), tvos(9.0), watchos(6.0));

  /*!
     @constant  kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix
     @abstract  Indicates the 3x3 camera intrinsic matrix applied to the current sample buffer.
     @discussion
      Camera intrinsic matrix is a CFData containing a matrix_float3x3, which is column-major. It has the following contents:
        fx  0  ox
        0  fy  oy
        0  0  1
        fx and fy are the focal length in pixels. For square pixels, they will have the same value.
        ox and oy are the coordinates of the principal point. The origin is the upper left of the frame.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix, CFStringRef); //   // CFData (matrix_float3x3)
                //API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(6.0));

  /*!
    @constant  kCMSampleBufferAttachmentKey_ForceKeyFrame
    @abstract  Indicates that the current or next video sample buffer should be forced to be encoded as a key frame.
    @discussion
      A value of kCFBooleanTrue for kCMSampleBufferAttachmentKey_ForceKeyFrame indicates that the current or next video sample buffer processed in the stream should be forced to be encoded as a key frame.
      If this attachment is present and kCFBooleanTrue on a sample buffer with a video frame, that video frame will be forced to become a key frame.  If the sample buffer for which this is present and kCFBooleanTrue does not have a valid video frame, the next sample buffer processed that contains a valid video frame will be encoded as a key frame.
      
      Usual care should be taken when setting attachments on sample buffers whose orgins and destinations are ambiguous.  For example, CMSetAttachment() is not thread-safe, and CMSampleBuffers may be used in multiple sample buffer streams in a given system.  This can lead to crashes during concurrent access and/or unexpected behavior on alternate sample buffer streams.  Therefore, unless the orgin and destination of a sample buffer is known, the general recommended practice is to synthesize an empty sample buffer with this attachment alone and insert it into the sample buffer stream ahead of the concrete sample buffer rather than setting this attachment on the concrete sample buffer itself.
   */
  JS_ASSIGN_ENUM(kCMSampleBufferAttachmentKey_ForceKeyFrame, CFStringRef); // 
                //API_AVAILABLE(macos(10.10), ios(8.0), tvos(9.0), watchos(6.0)); // CFBoolean


JS_INIT_GLOBALS_END(CMSampleBuffer);
