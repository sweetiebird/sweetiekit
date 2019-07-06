//
//  NCGPDFPage.h
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCGPDFPage_h
#define NCGPDFPage_h    

#include "NNSObject.h"

#define js_value_CGPDFPageRef(x) js_value_bridged(x, CGPDFPageRef)
#define to_value_CGPDFPageRef(x) to_value_bridged(x, CGPDFPageRef)
#define is_value_CGPDFPageRef(x) is_value_bridged(x, CGPDFPageRef)

#define js_value_CGPDFBox(x) JS_ENUM(CGPDFBox, int32_t, x)
#define to_value_CGPDFBox(x) TO_ENUM(CGPDFBox, int32_t, x)
#define is_value_CGPDFBox(x) IS_ENUM(CGPDFBox, int32_t, x)

JS_WRAP_GLOBALS(CGPDFPage);
JS_WRAP_GLOBALS_END(CGPDFPage);

#endif /* NCGPDFPage_h */
