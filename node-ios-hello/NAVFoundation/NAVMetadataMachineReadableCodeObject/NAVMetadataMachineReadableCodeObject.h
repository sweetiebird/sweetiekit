//
//  NAVMetadataMachineReadableCodeObject.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVMetadataMachineReadableCodeObject_h
#define NAVMetadataMachineReadableCodeObject_h    

#include "NAVMetadataObject.h"

#define js_value_AVMetadataMachineReadableCodeObject(x) js_value_wrapper(x, AVMetadataMachineReadableCodeObject)
#define to_value_AVMetadataMachineReadableCodeObject(x) to_value_wrapper(x, AVMetadataMachineReadableCodeObject)
#define is_value_AVMetadataMachineReadableCodeObject(x) is_value_wrapper(x, AVMetadataMachineReadableCodeObject)

JS_WRAP_CLASS(AVMetadataMachineReadableCodeObject, AVMetadataObject);
  // TODO: declare AVMetadataMachineReadableCodeObject methods and properties
JS_WRAP_CLASS_END(AVMetadataMachineReadableCodeObject);

#endif /* NAVMetadataMachineReadableCodeObject_h */