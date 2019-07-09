//
//  NAVAnimation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAnimation.h"

JS_INIT_GLOBALS(AVAnimation);
  // global values (exports)

  /*!
   @constant          AVCoreAnimationBeginTimeAtZero
   @discussion        Use this constant to set the CoreAnimation's animation beginTime property to be time 0.
                The constant is a small, non-zero, positive value which avoids CoreAnimation
                from replacing 0.0 with CACurrentMediaTime().
  */
  JS_ASSIGN_ENUM(AVCoreAnimationBeginTimeAtZero, CFTimeInterval); //  API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /*!
    @constant    AVLayerVideoGravityResizeAspect
    @abstract    Preserve aspect ratio; fit within layer bounds.
    @discussion    AVLayerVideoGravityResizeAspect may be used when setting the videoGravity
                      property of an AVPlayerLayer or AVCaptureVideoPreviewLayer instance.
   */
  JS_ASSIGN_ENUM(AVLayerVideoGravityResizeAspect, AVLayerVideoGravity); //  API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);


  /*!
    @constant    AVLayerVideoGravityResizeAspectFill
    @abstract    Preserve aspect ratio; fill layer bounds.
      @discussion     AVLayerVideoGravityResizeAspectFill may be used when setting the videoGravity
                      property of an AVPlayerLayer or AVCaptureVideoPreviewLayer instance.
   */
  JS_ASSIGN_ENUM(AVLayerVideoGravityResizeAspectFill, AVLayerVideoGravity); //  API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);

  /*!
    @constant    AVLayerVideoGravityResize
    @abstract    Stretch to fill layer bounds.
      @discussion     AVLayerVideoGravityResize may be used when setting the videoGravity
                      property of an AVPlayerLayer or AVCaptureVideoPreviewLayer instance.
   */
  JS_ASSIGN_ENUM(AVLayerVideoGravityResize, AVLayerVideoGravity); //  API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0)) API_UNAVAILABLE(watchos);
JS_INIT_GLOBALS_END(AVAnimation);
