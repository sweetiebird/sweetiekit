//
//  NNSCoder.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSCoder_h
#define NNSCoder_h    

#include "NNSObject.h"

#define js_value_NSCoder(x) js_value_wrapper(x, NSCoder)
#define to_value_NSCoder(x) to_value_wrapper(x, NSCoder)
#define is_value_NSCoder(x) is_value_wrapper(x, NSCoder)

// SpriteKit enums
#define js_value_NSDecodingFailurePolicy(x) JS_ENUM(NSDecodingFailurePolicy, NSInteger, x)
#define to_value_NSDecodingFailurePolicy(x) TO_ENUM(NSDecodingFailurePolicy, NSInteger, x)
#define is_value_NSDecodingFailurePolicy(x) IS_ENUM(NSDecodingFailurePolicy, NSInteger, x)

JS_WRAP_CLASS(NSCoder, NSObject);
  JS_METHOD(encodeValueOfObjCTypeAt);
  JS_METHOD(encodeDataObject);
  JS_METHOD(decodeDataObject);
  JS_METHOD(decodeValueOfObjCTypeAtSize);
  JS_METHOD(versionForClassName);
  JS_METHOD(encodeObject);
  JS_METHOD(encodeRootObject);
  JS_METHOD(encodeBycopyObject);
  JS_METHOD(encodeByrefObject);
  JS_METHOD(encodeConditionalObject);
  JS_METHOD(encodeValuesOfObjCTypes);
  JS_METHOD(encodeArrayOfObjCTypeCountAt);
  JS_METHOD(encodeBytesLength);
  JS_METHOD(decodeObject);
  JS_METHOD(decodeTopLevelObjectAndReturnError);
  JS_METHOD(decodeValuesOfObjCTypes);
  JS_METHOD(decodeArrayOfObjCTypeCountAt);
  JS_METHOD(decodeBytesWithReturnedLength);
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
  JS_METHOD(encodePropertyList);
  JS_METHOD(decodePropertyList);
#endif
  JS_METHOD(setObjectZone);
  JS_METHOD(objectZone);
  JS_METHOD(encodeObjectForKey);
  JS_METHOD(encodeConditionalObjectForKey);
  JS_METHOD(encodeBoolForKey);
  JS_METHOD(encodeIntForKey);
  JS_METHOD(encodeInt32_forKey);
  JS_METHOD(encodeInt64_forKey);
  JS_METHOD(encodeFloatForKey);
  JS_METHOD(encodeDoubleForKey);
  JS_METHOD(encodeBytesLengthForKey);
  JS_METHOD(containsValueForKey);
  JS_METHOD(decodeObjectForKey);
  JS_METHOD(decodeTopLevelObjectForKeyError);
  JS_METHOD(decodeBoolForKey);
  JS_METHOD(decodeIntForKey);
  JS_METHOD(decodeInt32ForKey);
  JS_METHOD(decodeInt64ForKey);
  JS_METHOD(decodeFloatForKey);
  JS_METHOD(decodeDoubleForKey);
  JS_METHOD(decodeBytesForKeyReturnedLength);
  JS_METHOD(encodeIntegerForKey);
  JS_METHOD(decodeIntegerForKey);
  JS_METHOD(decodeObjectOfClassForKey);
  JS_METHOD(decodeTopLevelObjectOfClassForKeyError);
  JS_METHOD(decodeObjectOfClassesForKey);
  JS_METHOD(decodeTopLevelObjectOfClassesForKeyError);
  JS_METHOD(decodePropertyListForKey);
  JS_METHOD(failWithError);
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
  JS_METHOD(encodeNXObject);
  JS_METHOD(decodeNXObject);
#endif
  JS_METHOD(decodeValueOfObjCTypeAt);
  JS_PROP_READONLY(systemVersion);
  JS_PROP_READONLY(allowsKeyedCoding);
  JS_PROP_READONLY(requiresSecureCoding);
  JS_PROP_READONLY(allowedClasses);
  JS_PROP_READONLY(decodingFailurePolicy);
  JS_PROP_READONLY(error);
JS_WRAP_CLASS_END(NSCoder);

#endif /* NNSCoder_h */
