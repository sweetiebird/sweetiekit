//
//  NVNTypes.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNTypes.h"

JS_INIT_GLOBALS(VNTypes);
  // global values (exports)

  //typedef NS_ENUM(NSUInteger, VNImageCropAndScaleOption) {
    JS_ASSIGN_ENUM(VNImageCropAndScaleOptionCenterCrop, NSUInteger); //  = 0,  // scale image maintaining aspect ratio to fit on the short side and crop centered on the long side
    JS_ASSIGN_ENUM(VNImageCropAndScaleOptionScaleFit, NSUInteger); //  = 1,    // scale to size required by algorithm
    JS_ASSIGN_ENUM(VNImageCropAndScaleOptionScaleFill, NSUInteger); //  = 2
  //};

  /*!
    @brief Barcode symbologies that are supported by the Vision framework.
    
    @discussion The actual set of barcode symbologies that can actually be recognized by a specific version of the Vision framework should be determined by using the VNRequestNameSupportedBarcodeSymbologies request.
  */
  //typedef NSString *VNBarcodeSymbology NS_STRING_ENUM;

  JS_ASSIGN_ENUM(VNBarcodeSymbologyAztec, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyCode39, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyCode39Checksum, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyCode39FullASCII, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyCode39FullASCIIChecksum, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyCode93, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyCode93i, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyCode128, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyDataMatrix, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyEAN8, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyEAN13, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyI2of5, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyI2of5Checksum, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyITF14, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyPDF417, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyQR, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNBarcodeSymbologyUPCE, VNBarcodeSymbology); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));

#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && (__IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_13_0)
  //API_AVAILABLE(macos(10.15), ios(13.0), tvos(13.0))
  //typedef NS_ENUM(NSUInteger, VNElementType) {
    JS_ASSIGN_ENUM(VNElementTypeUnknown, NSUInteger); //  = 0,
    JS_ASSIGN_ENUM(VNElementTypeFloat, NSUInteger); //    = 1,    // IEEE 754 single-precision floating point value
    JS_ASSIGN_ENUM(VNElementTypeDouble, NSUInteger); //   = 2,    // IEEE 754 double-precision floating point value
  //};
#endif

JS_INIT_GLOBALS_END(VNTypes);
