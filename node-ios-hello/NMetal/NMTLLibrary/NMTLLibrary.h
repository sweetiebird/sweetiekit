//
//  NMTLLibrary.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLLibrary_h
#define NMTLLibrary_h    

#include "NNSObject.h"

#define js_value_MTLLibrary(x) js_protocol_wrapper(x, MTLLibrary)
#define to_value_MTLLibrary(x) to_protocol_wrapper(x, MTLLibrary)
#define is_value_MTLLibrary(x) is_protocol_wrapper(x, MTLLibrary)

#define js_value_MTLPatchType(x) JS_ENUM(MTLPatchType, NSUInteger, x)
#define to_value_MTLPatchType(x) TO_ENUM(MTLPatchType, NSUInteger, x)
#define is_value_MTLPatchType(x) IS_ENUM(MTLPatchType, NSUInteger, x)

#define js_value_MTLFunctionType(x) JS_ENUM(MTLFunctionType, NSUInteger, x)
#define to_value_MTLFunctionType(x) TO_ENUM(MTLFunctionType, NSUInteger, x)
#define is_value_MTLFunctionType(x) IS_ENUM(MTLFunctionType, NSUInteger, x)

#define js_value_MTLLanguageVersion(x) JS_ENUM(MTLLanguageVersion, NSUInteger, x)
#define to_value_MTLLanguageVersion(x) TO_ENUM(MTLLanguageVersion, NSUInteger, x)
#define is_value_MTLLanguageVersion(x) IS_ENUM(MTLLanguageVersion, NSUInteger, x)

#define js_value_MTLLibraryError(x) JS_ENUM(MTLLibraryError, NSUInteger, x)
#define to_value_MTLLibraryError(x) TO_ENUM(MTLLibraryError, NSUInteger, x)
#define is_value_MTLLibraryError(x) IS_ENUM(MTLLibraryError, NSUInteger, x)

JS_WRAP_PROTOCOL(MTLLibrary, NSObject);
  JS_METHOD(newFunctionWithName);
  JS_METHOD(newFunctionWithNameConstantValuesError);
  JS_METHOD(newFunctionWithNameConstantValuesCompletionHandler);
  JS_PROP(label);
  JS_PROP_READONLY(device);
  JS_PROP_READONLY(functionNames);
JS_WRAP_PROTOCOL_END(MTLLibrary, NSObject);

#endif /* NMTLLibrary_h */
