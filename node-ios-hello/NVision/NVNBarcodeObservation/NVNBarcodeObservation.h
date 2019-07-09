//
//  NVNBarcodeObservation.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNBarcodeObservation_h
#define NVNBarcodeObservation_h    

#include "NVNRectangleObservation.h"

#define js_value_VNBarcodeObservation(x) js_value_wrapper(x, VNBarcodeObservation)
#define to_value_VNBarcodeObservation(x) to_value_wrapper(x, VNBarcodeObservation)
#define is_value_VNBarcodeObservation(x) is_value_wrapper(x, VNBarcodeObservation)

JS_WRAP_CLASS(VNBarcodeObservation, VNRectangleObservation);
  JS_PROP_READONLY(symbology);
  JS_PROP_READONLY(barcodeDescriptor);
  JS_PROP_READONLY(payloadStringValue);
JS_WRAP_CLASS_END(VNBarcodeObservation);

#endif /* NVNBarcodeObservation_h */
