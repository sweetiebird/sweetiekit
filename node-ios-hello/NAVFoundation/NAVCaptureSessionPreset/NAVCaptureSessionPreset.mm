//
//  NAVCaptureSessionPreset.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureSessionPreset.h"

JS_INIT_GLOBALS(AVCaptureSessionPreset);
  // global values (exports)

  /*!
   @group AVCaptureSessionPreset string constants
   
   @discussion
      Clients may use an AVCaptureSessionPreset to set the format for output on an AVCaptureSession.
   */
  //typedef NSString * AVCaptureSessionPreset NS_STRING_ENUM API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPresetPhoto
   @abstract
      An AVCaptureSession preset suitable for high resolution photo quality output.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetPhoto for full resolution photo quality output.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPresetPhoto, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPresetHigh
   @abstract
      An AVCaptureSession preset suitable for high quality video and audio output.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetHigh to achieve high quality video and audio output. AVCaptureSessionPresetHigh is the default sessionPreset value.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPresetHigh, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPresetMedium
   @abstract
      An AVCaptureSession preset suitable for medium quality output.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetMedium to achieve output video and audio bitrates suitable for sharing over WiFi.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPresetMedium, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPresetLow
   @abstract
      An AVCaptureSession preset suitable for low quality output.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetLow to achieve output video and audio bitrates suitable for sharing over 3G.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPresetLow, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPreset320x240
   @abstract
      An AVCaptureSession preset suitable for 320x240 video output.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset320x240 to achieve 320x240 output.
   */
#if TARGET_OS_MAC
  JS_ASSIGN_ENUM(AVCaptureSessionPreset320x240, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.7)) API_UNAVAILABLE(ios, watchos, tvos);
#endif

  /*!
   @constant AVCaptureSessionPreset352x288
   @abstract
      An AVCaptureSession preset suitable for 352x288 video output.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset352x288 to achieve CIF quality (352x288) output.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPreset352x288, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.7), ios(5.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPreset640x480
   @abstract
      An AVCaptureSession preset suitable for 640x480 video output.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset640x480 to achieve VGA quality (640x480) output.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPreset640x480, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPreset960x540
   @abstract
      An AVCaptureSession preset suitable for 960x540 video output.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset960x540 to achieve quarter HD quality (960x540) output.
   */
#if TARGET_OS_MAC
  JS_ASSIGN_ENUM(AVCaptureSessionPreset960x540, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.7)) API_UNAVAILABLE(ios, watchos, tvos);
#endif

  /*!
   @constant AVCaptureSessionPreset1280x720
   @abstract
      An AVCaptureSession preset suitable for 1280x720 video output.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset1280x720 to achieve 1280x720 output.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPreset1280x720, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.7), ios(4.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPreset1920x1080
   @abstract
      An AVCaptureSession preset suitable for 1920x1080 video output.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset1920x1080 to achieve 1920x1080 output.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPreset1920x1080, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.15), ios(5.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPreset3840x2160
   @abstract
      An AVCaptureSession preset suitable for 3840x2160 (UHD 4K) video output.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset3840x2160 to achieve 3840x2160 output.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPreset3840x2160, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.15), ios(9.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPresetiFrame960x540
   @abstract
      An AVCaptureSession preset producing 960x540 Apple iFrame video and audio content.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetiFrame960x540 to achieve 960x540 quality iFrame H.264 video at ~30 Mbits/sec with AAC audio. QuickTime movies captured in iFrame format are optimal for editing applications.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPresetiFrame960x540, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.9), ios(5.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPresetiFrame1280x720
   @abstract
      An AVCaptureSession preset producing 1280x720 Apple iFrame video and audio content.
   
   @discussion
      Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetiFrame1280x720 to achieve 1280x720 quality iFrame H.264 video at ~40 Mbits/sec with AAC audio. QuickTime movies captured in iFrame format are optimal for editing applications.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPresetiFrame1280x720, AVCaptureSessionPreset); //  API_AVAILABLE(macos(10.9), ios(5.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

  /*!
   @constant AVCaptureSessionPresetInputPriority
   @abstract
      An AVCaptureSession preset indicating that the formats of the session's inputs are being given priority.
   
   @discussion
      By calling -setSessionPreset:, clients can easily configure an AVCaptureSession to produce a desired quality of service level. The session configures its inputs and outputs optimally to produce the QoS level indicated. Clients who need to ensure a particular input format is chosen can use AVCaptureDevice's -setActiveFormat: method. When a client sets the active format on a device, the associated session's -sessionPreset property automatically changes to AVCaptureSessionPresetInputPriority. This change indicates that the input format selected by the client now dictates the quality of service level provided at the outputs. When a client sets the session preset to anything other than AVCaptureSessionPresetInputPriority, the session resumes responsibility for configuring inputs and outputs, and is free to change its inputs' activeFormat as needed.
   */
  JS_ASSIGN_ENUM(AVCaptureSessionPresetInputPriority, AVCaptureSessionPreset); //  API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

JS_INIT_GLOBALS_END(AVCaptureSessionPreset);
