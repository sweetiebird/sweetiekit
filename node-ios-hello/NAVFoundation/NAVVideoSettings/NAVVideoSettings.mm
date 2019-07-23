//
//  NAVVideoSettings.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVVideoSettings.h"

JS_INIT_GLOBALS(AVVideoSettings);
  // global values (exports)

  JS_ASSIGN_ENUM(AVVideoCodecKey, NSString); //  /* NSString (CMVideoCodecType) */        API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /*!
    @typedef      AVVideoCodecType
    @abstract     The type of the strings used to specify a video codec type (for instance, as values for the AVVideoCodecKey key in a video settings dictionary).
   */
  //typedef NSString * AVVideoCodecType NS_STRING_ENUM;

  JS_ASSIGN_ENUM(AVVideoCodecTypeHEVC, AVVideoCodecType); //  /* @"hvc1" */                    API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCodecTypeH264, AVVideoCodecType); //  /* @"avc1" */                    API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCodecTypeJPEG, AVVideoCodecType); //  /* @"jpeg" */                    API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCodecTypeAppleProRes4444, AVVideoCodecType); //  /* @"ap4h" */         API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCodecTypeAppleProRes422, AVVideoCodecType); //  /* @"apcn" */          API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && (__IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_13_0)
  JS_ASSIGN_ENUM(AVVideoCodecTypeAppleProRes422HQ, AVVideoCodecType); //  /* @"apch" */    API_AVAILABLE(macos(10.15), ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCodecTypeAppleProRes422LT, AVVideoCodecType); //  /* @"apcs" */    API_AVAILABLE(macos(10.15), ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCodecTypeAppleProRes422Proxy, AVVideoCodecType); //  /* @"apco" */    API_AVAILABLE(macos(10.15), ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);

  /* IMPORTANT NOTE: this constant is used to select the appropriate encoder, but is NOT used on the encoded content, which is backwards compatible and hence uses 'hvc1' as its codec type. */
  JS_ASSIGN_ENUM(AVVideoCodecTypeHEVCWithAlpha, AVVideoCodecType); //  /* @"muxa" */           API_AVAILABLE(macos(10.15), ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);
#endif
  JS_ASSIGN_ENUM(AVVideoCodecHEVC, NSString); //  /* @"hvc1" */                               API_DEPRECATED_WITH_REPLACEMENT("AVVideoCodecTypeHEVC", macos(10.13, 10.13), ios(11.0, 11.0), tvos(11.0, 11.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCodecH264, NSString); //  /* @"avc1" */                               API_DEPRECATED_WITH_REPLACEMENT("AVVideoCodecTypeH264", macos(10.7, 10.13), ios(4.0, 11.0), tvos(9.0, 11.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCodecJPEG, NSString); //  /* @"jpeg" */                               API_DEPRECATED_WITH_REPLACEMENT("AVVideoCodecTypeJPEG", macos(10.7, 10.13), ios(4.0, 11.0), tvos(9.0, 11.0)) API_UNAVAILABLE(watchos);
#if !TARGET_OS_IPHONE && !TARGET_OS_TV && !TARGET_OS_WATCH
  JS_ASSIGN_ENUM(AVVideoCodecAppleProRes4444, NSString); //  /* @"ap4h" */                    API_DEPRECATED_WITH_REPLACEMENT("AVVideoCodecTypeAppleProRes4444", macos(10.7, 10.13)) API_UNAVAILABLE(ios, tvos, watchos);
  JS_ASSIGN_ENUM(AVVideoCodecAppleProRes422, NSString); //  /* @"apcn" */                     API_DEPRECATED_WITH_REPLACEMENT("AVVideoCodecTypeAppleProRes422", macos(10.7, 10.13)) API_UNAVAILABLE(ios, tvos, watchos);
#endif

  // For best results, always use even number values for AVVideoWidthKey and AVVideoHeightKey when encoding to AVVideoCodecTypeH264 or any other format that uses 4:2:0 downsampling
  JS_ASSIGN_ENUM(AVVideoWidthKey, NSString); //  /* NSNumber (encoded pixels) */          API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoHeightKey, NSString); //  /* NSNumber (encoded pixels) */          API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /*!
   @constant  AVVideoPixelAspectRatioKey
   @abstract  The aspect ratio of the pixels in the video frame
   @discussion
    The value for this key is an NSDictionary containing AVVideoPixelAspectRatio*Key keys.  If no value is specified for this key, the default value for the codec is used.  Usually this is 1:1, meaning square pixels.
   
    Note that prior to OS X 10.9 and iOS 7.0, this key could only be specified as part of the dictionary given for AVVideoCompressionPropertiesKey.  As of OS X 10.9 and iOS 7.0, the top level of an AVVideoSettings dictionary is the preferred place to specify this key.
  */
  JS_ASSIGN_ENUM(AVVideoPixelAspectRatioKey, NSString); //                     API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoPixelAspectRatioHorizontalSpacingKey, NSString); //  /* NSNumber */  API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoPixelAspectRatioVerticalSpacingKey, NSString); //  /* NSNumber */    API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /*!
   @constant  AVVideoCleanApertureKey
   @abstract  Defines the region within the video dimensions that will be displayed during playback
   @discussion
    The value for this key is an NSDictionary containing AVVideoCleanAperture*Key keys.  AVVideoCleanApertureWidthKey and AVVideoCleanApertureHeightKey define a clean rectangle which is centered on the video frame.  To offset this rectangle from center, use AVVideoCleanApertureHorizontalOffsetKey and AVVideoCleanApertureVerticalOffsetKey.  A positive value for AVVideoCleanApertureHorizontalOffsetKey moves the clean aperture region to the right, and a positive value for AVVideoCleanApertureVerticalOffsetKey moves the clean aperture region down.
   
    If no clean aperture region is specified, the entire frame will be displayed during playback.
   
    Note that prior to OS X 10.9 and iOS 7.0, this key could only be specified as part of the dictionary given for AVVideoCompressionPropertiesKey.  As of OS X 10.9 and iOS 7.0, the top level of an AVVideoSettings dictionary is the preferred place to specify this key.
  */
  JS_ASSIGN_ENUM(AVVideoCleanApertureKey, NSString); //                       API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCleanApertureWidthKey, NSString); //  /* NSNumber */          API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCleanApertureHeightKey, NSString); //  /* NSNumber */          API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCleanApertureHorizontalOffsetKey, NSString); //  /* NSNumber */    API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoCleanApertureVerticalOffsetKey, NSString); //  /* NSNumber */      API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  JS_ASSIGN_ENUM(AVVideoScalingModeKey, NSString); //  /* NSString */                API_AVAILABLE(macos(10.7), ios(5.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  /* AVVideoScalingModeFit - Crop to remove edge processing region; preserve aspect ratio of cropped source by reducing specified width or height if necessary.  Will not scale a small source up to larger dimensions. */
  JS_ASSIGN_ENUM(AVVideoScalingModeFit, NSString); //                     API_AVAILABLE(macos(10.7), ios(5.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  /* AVVideoScalingModeResize - Crop to remove edge processing region; scale remainder to destination area.  Does not preserve aspect ratio. */
  JS_ASSIGN_ENUM(AVVideoScalingModeResize, NSString); //                     API_AVAILABLE(macos(10.7), ios(5.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  /* AVVideoScalingModeResizeAspect - Preserve aspect ratio of the source, and fill remaining areas with black to fit destination dimensions. */
  JS_ASSIGN_ENUM(AVVideoScalingModeResizeAspect, NSString); //                 API_AVAILABLE(macos(10.7), ios(5.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  /* AVVideoScalingModeResizeAspectFill - Preserve aspect ratio of the source, and crop picture to fit destination dimensions. */
  JS_ASSIGN_ENUM(AVVideoScalingModeResizeAspectFill, NSString); //               API_AVAILABLE(macos(10.7), ios(5.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /*
    Clients who specify AVVideoColorPropertiesKey must specify a color primary, transfer function, and Y'CbCr matrix.
    Most clients will want to specify HD, which consists of:
   
      AVVideoColorPrimaries_ITU_R_709_2
      AVVideoTransferFunction_ITU_R_709_2
      AVVideoYCbCrMatrix_ITU_R_709_2
   
    If you require SD colorimetry use:
   
      AVVideoColorPrimaries_SMPTE_C
      AVVideoTransferFunction_ITU_R_709_2
      AVVideoYCbCrMatrix_ITU_R_601_4
   
    If you require wide gamut HD colorimetry, you can use:
   
      AVVideoColorPrimaries_P3_D65
      AVVideoTransferFunction_ITU_R_709_2
      AVVideoYCbCrMatrix_ITU_R_709_2
   
      If you require 10-bit wide gamut HD colorimetry, you can use:
   
      AVVideoColorPrimaries_P3_D65
      AVVideoTransferFunction_ITU_R_2100_HLG
      AVVideoYCbCrMatrix_ITU_R_709_2

    AVFoundation will color match if the source and destination color properties differ according to the following rules:
   
    If you want to override the tagging of color properties in the video that you will be processing, set a value for AVVideoColorPropertiesKey:
   
    If AVVideoColorPropertiesKey is set in the output settings and the source buffers are not tagged with color properties, then the output will be tagged according to the AVVideoColorPropertiesKey color properties.
    If AVVideoColorPropertiesKey is set in the output settings and the source buffers are also tagged with color properties, then if necessary the source buffers will be color converted to match the color properties specified by AVVideoColorPropertiesKey, and the output will be tagged according to the AVVideoColorPropertiesKey color properties.
   
    If you do not want to override the tagging of color properties in the video that you will be processing, do not set a value for AVVideoColorPropertiesKey:
   
    If AVVideoColorPropertiesKey is not set in the output settings and the source buffers are tagged with color properties, then the output will be tagged according to the source buffer color properties.
    If AVVideoColorPropertiesKey is not set in the output settings and the source buffers are not tagged with color properties, then the output will not be tagged with any color properties.
   
     It is important that the source be tagged.
  */
  JS_ASSIGN_ENUM(AVVideoColorPropertiesKey, NSString); //  /* NSDictionary, all 3 below keys required */   API_AVAILABLE(macos(10.7), ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoColorPrimariesKey, NSString); //  /* NSString */                                   API_AVAILABLE(macos(10.7), ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoColorPrimaries_ITU_R_709_2, NSString); //                                          API_AVAILABLE(macos(10.7), ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos);
#if !TARGET_OS_IPHONE && !TARGET_OS_TV && !TARGET_OS_WATCH
  JS_ASSIGN_ENUM(AVVideoColorPrimaries_EBU_3213, NSString); //                                             API_AVAILABLE(macos(10.7)) API_UNAVAILABLE(ios, tvos, watchos);
#endif
  JS_ASSIGN_ENUM(AVVideoColorPrimaries_SMPTE_C, NSString); //                                              API_AVAILABLE(macos(10.7), ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoColorPrimaries_P3_D65, NSString); //                                               API_AVAILABLE(macos(10.12), ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoColorPrimaries_ITU_R_2020, NSString); //                                           API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoTransferFunctionKey, NSString); //  /* NSString */                                 API_AVAILABLE(macos(10.7), ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoTransferFunction_ITU_R_709_2, NSString); //                                        API_AVAILABLE(macos(10.7), ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos);
#if !TARGET_OS_IPHONE && !TARGET_OS_TV && !TARGET_OS_WATCH
  JS_ASSIGN_ENUM(AVVideoTransferFunction_SMPTE_240M_1995, NSString); //                                    API_AVAILABLE(macos(10.7)) API_UNAVAILABLE(ios, tvos, watchos);
#endif
  JS_ASSIGN_ENUM(AVVideoTransferFunction_SMPTE_ST_2084_PQ, NSString); //                                   API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoTransferFunction_ITU_R_2100_HLG, NSString); //                                     API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoYCbCrMatrixKey, NSString); //  /* NSString */                                      API_AVAILABLE(macos(10.7), ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoYCbCrMatrix_ITU_R_709_2, NSString); //                                             API_AVAILABLE(macos(10.7), ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoYCbCrMatrix_ITU_R_601_4, NSString); //                                             API_AVAILABLE(macos(10.7), ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos);
#if !TARGET_OS_IPHONE && !TARGET_OS_TV && !TARGET_OS_WATCH
  JS_ASSIGN_ENUM(AVVideoYCbCrMatrix_SMPTE_240M_1995, NSString); //                                         API_AVAILABLE(macos(10.7)) API_UNAVAILABLE(ios, tvos, watchos);
#endif
  JS_ASSIGN_ENUM(AVVideoYCbCrMatrix_ITU_R_2020, NSString); //                                              API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);

  /*!
   @constant  AVVideoAllowWideColorKey
   @abstract  Indicates whether the client can process wide color
   @discussion
    Clients who wish to process wide color content should set the value of this key to @YES, or specify AVVideoColorPropertiesKey.
   
    The default value, @NO, permits implicit color conversions to occur to a non-wide gamut color space.
   */
  JS_ASSIGN_ENUM(AVVideoAllowWideColorKey, NSString); //  /* NSNumber(BOOL)  */          API_AVAILABLE(macos(10.12), ios(10.0), tvos(10.0)) API_UNAVAILABLE(watchos);

  /*!
   @constant  AVVideoCompressionPropertiesKey
   @abstract
    The value for this key is an instance of NSDictionary, containing properties to be passed down to the video encoder.
   @discussion
    Package the below keys in an instance of NSDictionary and use it as the value for AVVideoCompressionPropertiesKey in the top-level AVVideoSettings dictionary.  In addition to the keys listed below, you can also include keys from VideoToolbox/VTCompressionProperties.h.
   
    Most keys can only be used for certain encoders.  Look at individual keys for details.
   */
  JS_ASSIGN_ENUM(AVVideoCompressionPropertiesKey, NSString); //  /* NSDictionary */                                API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoAverageBitRateKey, NSString); //  /* NSNumber (bits per second, H.264 only) */         API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoQualityKey, NSString); //  /* NSNumber (0.0-1.0, JPEG and HEIC only. With HEIC, 1.0 indicates lossless compression) */ API_AVAILABLE(macos(10.7), ios(5.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoMaxKeyFrameIntervalKey, NSString); //  /* NSNumber (frames, 1 means key frames only, H.264 only) */ API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoMaxKeyFrameIntervalDurationKey, NSString); //  /* NSNumber (seconds, 0.0 means no limit, H.264 only) */ API_AVAILABLE(macos(10.9), ios(7.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /*!
   @constant  AVVideoAllowFrameReorderingKey
   @abstract
     Enables or disables frame reordering.
   @discussion
     In order to achieve the best compression while maintaining image quality, some video encoders can reorder frames.  This means that the order in which the frames will be emitted and stored (the decode order) will be different from the order in which they are presented to the video encoder (the display order).
    
    Encoding using frame reordering requires more system resources than encoding without frame reordering, so encoding performance should be taken into account when deciding whether to enable frame reordering.  This is especially important when encoding video data from a real-time source, such as AVCaptureVideoDataOutput.  In this situation, using a value of @NO for AVVideoAllowFrameReorderingKey may yield the best results.
   
    The default is @YES, which means that the encoder decides whether to enable frame reordering.
   */
  JS_ASSIGN_ENUM(AVVideoAllowFrameReorderingKey, NSString); //  /* NSNumber (BOOL) */               API_AVAILABLE(macos(10.10), ios(7.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelKey, NSString); //  /* NSString, profile/level constants are specific to a particular encoder. See VideoToolbox/VTCompressionProperties.h for additional profiles/levels that can used as the value of this key. */               API_AVAILABLE(macos(10.8), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /* HEVC profiles/levels are defined in VideoToolbox/VTCompressionProperties.h, e.g. kVTProfileLevel_HEVC_Main_AutoLevel. The constants defined there can be used as the value for the key AVVideoProfileLevelKey. */

  JS_ASSIGN_ENUM(AVVideoProfileLevelH264Baseline30, NSString); //  /* Baseline Profile Level 3.0 */        API_AVAILABLE(macos(10.8), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelH264Baseline31, NSString); //  /* Baseline Profile Level 3.1 */        API_AVAILABLE(macos(10.8), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelH264Baseline41, NSString); //  /* Baseline Profile Level 4.1 */        API_AVAILABLE(macos(10.8), ios(5.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelH264BaselineAutoLevel, NSString); //  /* Baseline Profile Auto Level */ API_AVAILABLE(macos(10.9), ios(7.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelH264Main30, NSString); //  /* Main Profile Level 3.0 */                API_AVAILABLE(macos(10.8), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelH264Main31, NSString); //  /* Main Profile Level 3.1 */                API_AVAILABLE(macos(10.8), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelH264Main32, NSString); //  /* Main Profile Level 3.2 */                API_AVAILABLE(macos(10.8), ios(5.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelH264Main41, NSString); //  /* Main Profile Level 4.1 */                API_AVAILABLE(macos(10.8), ios(5.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelH264MainAutoLevel, NSString); //  /* Main Profile Auto Level */        API_AVAILABLE(macos(10.9), ios(7.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelH264High40, NSString); //  /* High Profile Level 4.0 */                API_AVAILABLE(macos(10.9), ios(6.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelH264High41, NSString); //  /* High Profile Level 4.1 */                API_AVAILABLE(macos(10.9), ios(6.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoProfileLevelH264HighAutoLevel, NSString); //  /* High Profile Auto Level */        API_AVAILABLE(macos(10.9), ios(7.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /*!
   @constant  AVVideoH264EntropyModeKey
   @abstract
    The entropy encoding mode for H.264 compression.
   @discussion
    If supported by an H.264 encoder, this property controls whether the encoder should use Context-based Adaptive Variable Length Coding (CAVLC) or Context-based Adaptive Binary Arithmetic Coding (CABAC).  CABAC generally gives better compression at the expense of higher computational overhead.  The default value is encoder-specific and may change depending on other encoder settings.  Care should be taken when using this property -- changes may result in a configuration which is not compatible with a requested Profile and Level.  Results in this case are undefined, and could include encode errors or a non-compliant output stream.
  */
  JS_ASSIGN_ENUM(AVVideoH264EntropyModeKey, NSString); //      /* NSString, H.264 only, one of: */       API_AVAILABLE(macos(10.10), ios(7.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoH264EntropyModeCAVLC, NSString); //  /* Context-based Adaptive Variable Length Coding */   API_AVAILABLE(macos(10.10), ios(7.0), tvos(9.0)) API_UNAVAILABLE(watchos);
  JS_ASSIGN_ENUM(AVVideoH264EntropyModeCABAC, NSString); //  /* Context-based Adaptive Binary Arithmetic Coding */ API_AVAILABLE(macos(10.10), ios(7.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /*!
   @constant  AVVideoExpectedSourceFrameRateKey
   @abstract
    Indicates the expected source frame rate, if known.
   @discussion
    The frame rate is measured in frames per second. This is not used to control the frame rate; it is provided as a hint to the video encoder so that it can set up internal configuration before compression begins. The actual frame rate will depend on frame durations and may vary. This should be set if an AutoLevel AVVideoProfileLevelKey is used, or if the source content has a high frame rate (higher than 30 fps). The encoder might have to drop frames to satisfy bit stream requirements if this key is not specified.
   */
  JS_ASSIGN_ENUM(AVVideoExpectedSourceFrameRateKey, NSString); //  /* NSNumber (frames per second) */        API_AVAILABLE(macos(10.10), ios(7.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /*!
   @constant  AVVideoAverageNonDroppableFrameRateKey
   @abstract
    The desired average number of non-droppable frames to be encoded for each second of video.
   @discussion
    Some video encoders can produce a flexible mixture of non-droppable frames and droppable frames.  The difference between these types is that it is necessary for a video decoder to decode a non-droppable frame in order to successfully decode subsequent frames, whereas droppable frames are optional and can be skipped without impact on decode of subsequent frames.  Having a proportion of droppable frames in a sequence has advantages for temporal scalability: at playback time more or fewer frames may be decoded depending on the play rate.  This property requests that the encoder emit an overall proportion of non-droppable and droppable frames so that there are the specified number of non-droppable frames per second.

    For example, to specify that the encoder should include an average of 30 non-droppable frames for each second of video:

    [myVideoSettings setObject:@30 forKey:AVVideoAverageNonDroppableFrameRateKey];
   */
  JS_ASSIGN_ENUM(AVVideoAverageNonDroppableFrameRateKey, NSString); //  /* NSNumber (frames per second) */    API_AVAILABLE(macos(10.10), ios(7.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /*!
   @constant  AVVideoDecompressionPropertiesKey
   @abstract
   The value for this key is an instance of NSDictionary, containing properties to be passed down to the video decoder.
   @discussion
   Package the below keys in an instance of NSDictionary and use it as the value for AVVideoDecompressionPropertiesKey in the top-level AVVideoSettings dictionary.  In addition to the keys listed below, you can also include keys from VideoToolbox/VTDecompressionProperties.h.
   
   Most keys can only be used for certain decoders.  Look at individual keys for details.
   */
#if !TARGET_OS_IPHONE && !TARGET_OS_TV && !TARGET_OS_WATCH
  JS_ASSIGN_ENUM(AVVideoDecompressionPropertiesKey, NSString); //  /* NSDictionary */   API_AVAILABLE(macos(10.13)) API_UNAVAILABLE(ios, tvos, watchos);
#endif

  /*!
    @constant AVVideoEncoderSpecificationKey
    @abstract
      The video encoder specification includes options for choosing a specific video encoder.
      
    @discussion
      The value for this key is a dictionary containing kVTVideoEncoderSpecification_* keys specified in the VideoToolbox framework.  This key should be specified at the top level of an AVVideoSettings dictionary.
   */
#if !TARGET_OS_IPHONE && !TARGET_OS_TV && !TARGET_OS_WATCH
  JS_ASSIGN_ENUM(AVVideoEncoderSpecificationKey, NSString); //  /* NSDictionary */ API_AVAILABLE(macos(10.10)) API_UNAVAILABLE(ios, tvos, watchos);
#endif

  //typedef NSString * AVVideoApertureMode NS_STRING_ENUM;

  /*!
   @constant  AVVideoApertureModeCleanAperture
   @abstract  Both pixel aspect ratio and clean aperture will be applied.
   @discussion
    An image's clean aperture is a region of video free from transition artifacts caused by the encoding of the signal.
   */
  JS_ASSIGN_ENUM(AVVideoApertureModeCleanAperture, AVVideoApertureMode); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);

  /*!
   @constant  AVVideoApertureModeProductionAperture
   @abstract  Only pixel aspect ratio will be applied.
   @discussion
    The image is not cropped to the clean aperture region, but it is scaled according to the pixel aspect ratio. Use this option when you want to see all the pixels in your video, including the edges.
   */
  JS_ASSIGN_ENUM(AVVideoApertureModeProductionAperture, AVVideoApertureMode); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);

  /*!
   @constant  AVVideoApertureModeEncodedPixels
   @abstract  Neither pixel aspect ratio nor clean aperture will be applied.
   @discussion
    The image is not cropped to the clean aperture region and is not scaled according to the pixel aspect ratio. The encoded dimensions of the image description are displayed.
   */
  JS_ASSIGN_ENUM(AVVideoApertureModeEncodedPixels, AVVideoApertureMode); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);

JS_INIT_GLOBALS_END(AVVideoSettings);
