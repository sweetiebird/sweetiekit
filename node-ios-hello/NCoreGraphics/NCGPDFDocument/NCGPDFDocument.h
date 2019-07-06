//
//  NCGPDFDocument.h
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCGPDFDocument_h
#define NCGPDFDocument_h    

#include "NNSObject.h"

#define js_value_CGPDFDocumentRef(x) js_value_bridged(x, CGPDFDocumentRef)
#define to_value_CGPDFDocumentRef(x) to_value_bridged(x, CGPDFDocumentRef)
#define is_value_CGPDFDocumentRef(x) is_value_bridged(x, CGPDFDocumentRef)

JS_WRAP_GLOBALS(CGPDFDocument);
JS_WRAP_GLOBALS_END(CGPDFDocument);

#endif /* NCGPDFDocument_h */
