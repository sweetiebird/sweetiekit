//
//  NVNTypes.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNTypes_h
#define NVNTypes_h    

#include "NNSObject.h"

#define js_value_VNConfidence(x) JS_ENUM(VNConfidence, float, x)
#define to_value_VNConfidence(x) TO_ENUM(VNConfidence, float, x)
#define is_value_VNConfidence(x) IS_ENUM(VNConfidence, float, x)

#define js_value_VNAspectRatio(x) JS_ENUM(VNAspectRatio, float, x)
#define to_value_VNAspectRatio(x) TO_ENUM(VNAspectRatio, float, x)
#define is_value_VNAspectRatio(x) IS_ENUM(VNAspectRatio, float, x)

#define js_value_VNDegrees(x) JS_ENUM(VNDegrees, float, x)
#define to_value_VNDegrees(x) TO_ENUM(VNDegrees, float, x)
#define is_value_VNDegrees(x) IS_ENUM(VNDegrees, float, x)

#define js_value_VNImageCropAndScaleOption(x) JS_ENUM(VNImageCropAndScaleOption, NSUInteger, x)
#define to_value_VNImageCropAndScaleOption(x) TO_ENUM(VNImageCropAndScaleOption, NSUInteger, x)
#define is_value_VNImageCropAndScaleOption(x) IS_ENUM(VNImageCropAndScaleOption, NSUInteger, x)

#define js_value_VNBarcodeSymbology(x) JS_ENUM(VNBarcodeSymbology, NSString, x)
#define to_value_VNBarcodeSymbology(x) TO_ENUM(VNBarcodeSymbology, NSString, x)
#define is_value_VNBarcodeSymbology(x) IS_ENUM(VNBarcodeSymbology, NSString, x)

#define js_value_VNElementType(x) JS_ENUM(VNElementType, NSUInteger, x)
#define to_value_VNElementType(x) TO_ENUM(VNElementType, NSUInteger, x)
#define is_value_VNElementType(x) IS_ENUM(VNElementType, NSUInteger, x)

JS_WRAP_GLOBALS(VNTypes);
JS_WRAP_GLOBALS_END(VNTypes);

#endif /* NVNTypes_h */
