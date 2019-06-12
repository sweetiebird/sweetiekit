//
//  NNSCoder.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSCoder.h"

#define instancetype NSCoder
#define js_value_instancetype js_value_NSCoder

NNSCoder::NNSCoder() {}
NNSCoder::~NNSCoder() {}

JS_INIT_CLASS(NSCoder, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, encodeValueOfObjCTypeAt);
  JS_ASSIGN_METHOD(proto, encodeDataObject);
  JS_ASSIGN_METHOD(proto, decodeDataObject);
  JS_ASSIGN_METHOD(proto, decodeValueOfObjCTypeAtSize);
  JS_ASSIGN_METHOD(proto, versionForClassName);
  JS_ASSIGN_METHOD(proto, encodeObject);
  JS_ASSIGN_METHOD(proto, encodeRootObject);
  JS_ASSIGN_METHOD(proto, encodeBycopyObject);
  JS_ASSIGN_METHOD(proto, encodeByrefObject);
  JS_ASSIGN_METHOD(proto, encodeConditionalObject);
  JS_ASSIGN_METHOD(proto, encodeValuesOfObjCTypes);
  JS_ASSIGN_METHOD(proto, encodeArrayOfObjCTypeCountAt);
  JS_ASSIGN_METHOD(proto, encodeBytesLength);
  JS_ASSIGN_METHOD(proto, decodeObject);
  JS_ASSIGN_METHOD(proto, decodeTopLevelObjectAndReturnError);
  JS_ASSIGN_METHOD(proto, decodeValuesOfObjCTypes);
  JS_ASSIGN_METHOD(proto, decodeArrayOfObjCTypeCountAt);
  JS_ASSIGN_METHOD(proto, decodeBytesWithReturnedLength);
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
  JS_ASSIGN_METHOD(proto, encodePropertyList);
  JS_ASSIGN_METHOD(proto, decodePropertyList);
#endif
  JS_ASSIGN_METHOD(proto, setObjectZone);
  JS_ASSIGN_METHOD(proto, objectZone);
  JS_ASSIGN_METHOD(proto, encodeObjectForKey);
  JS_ASSIGN_METHOD(proto, encodeConditionalObjectForKey);
  JS_ASSIGN_METHOD(proto, encodeBoolForKey);
  JS_ASSIGN_METHOD(proto, encodeIntForKey);
  JS_ASSIGN_METHOD(proto, encodeInt32_forKey);
  JS_ASSIGN_METHOD(proto, encodeInt64_forKey);
  JS_ASSIGN_METHOD(proto, encodeFloatForKey);
  JS_ASSIGN_METHOD(proto, encodeDoubleForKey);
  JS_ASSIGN_METHOD(proto, encodeBytesLengthForKey);
  JS_ASSIGN_METHOD(proto, containsValueForKey);
  JS_ASSIGN_METHOD(proto, decodeObjectForKey);
  JS_ASSIGN_METHOD(proto, decodeTopLevelObjectForKeyError);
  JS_ASSIGN_METHOD(proto, decodeBoolForKey);
  JS_ASSIGN_METHOD(proto, decodeIntForKey);
  JS_ASSIGN_METHOD(proto, decodeInt32ForKey);
  JS_ASSIGN_METHOD(proto, decodeInt64ForKey);
  JS_ASSIGN_METHOD(proto, decodeFloatForKey);
  JS_ASSIGN_METHOD(proto, decodeDoubleForKey);
  JS_ASSIGN_METHOD(proto, decodeBytesForKeyReturnedLength);
  JS_ASSIGN_METHOD(proto, encodeIntegerForKey);
  JS_ASSIGN_METHOD(proto, decodeIntegerForKey);
  JS_ASSIGN_METHOD(proto, decodeObjectOfClassForKey);
  JS_ASSIGN_METHOD(proto, decodeTopLevelObjectOfClassForKeyError);
  JS_ASSIGN_METHOD(proto, decodeObjectOfClassesForKey);
  JS_ASSIGN_METHOD(proto, decodeTopLevelObjectOfClassesForKeyError);
  JS_ASSIGN_METHOD(proto, decodePropertyListForKey);
  JS_ASSIGN_METHOD(proto, failWithError);
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
  JS_ASSIGN_METHOD(proto, encodeNXObject);
  JS_ASSIGN_METHOD(proto, decodeNXObject);
#endif
  JS_ASSIGN_METHOD(proto, decodeValueOfObjCTypeAt);
  JS_ASSIGN_PROP_READONLY(proto, systemVersion);
  JS_ASSIGN_PROP_READONLY(proto, allowsKeyedCoding);
  JS_ASSIGN_PROP_READONLY(proto, requiresSecureCoding);
  JS_ASSIGN_PROP_READONLY(proto, allowedClasses);
  JS_ASSIGN_PROP_READONLY(proto, decodingFailurePolicy);
  JS_ASSIGN_PROP_READONLY(proto, error);

  // static members (ctor)
  JS_INIT_CTOR(NSCoder, NSObject);
JS_INIT_CLASS_END(NSCoder, NSObject);

NAN_METHOD(NNSCoder::New) {
  JS_RECONSTRUCT(NSCoder);
  @autoreleasepool {
    NSCoder* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSCoder *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSCoder alloc] init];
    }
    if (self) {
      NNSCoder *wrapper = new NNSCoder();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSCoder::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSCoder::encodeValueOfObjCTypeAt) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_pointer(const-char, type);
    declare_pointer(const-void, addr);
    [self encodeValueOfObjCType: type at: addr];
    #endif
  }
}

NAN_METHOD(NNSCoder::encodeDataObject) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    [self encodeDataObject: data];
  }
}

NAN_METHOD(NNSCoder::decodeDataObject) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self decodeDataObject]));
  }
}

NAN_METHOD(NNSCoder::decodeValueOfObjCTypeAtSize) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_pointer(const-char, type);
    declare_pointer(void, data);
    declare_value(NSUInteger, size);
    [self decodeValueOfObjCType: type at: data size: size];
    #endif
  }
}

NAN_METHOD(NNSCoder::versionForClassName) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, className);
    JS_SET_RETURN(js_value_NSInteger([self versionForClassName: className]));
  }
}

NAN_METHOD(NNSCoder::encodeObject) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, object);
    [self encodeObject: object];
  }
}

NAN_METHOD(NNSCoder::encodeRootObject) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, rootObject);
    [self encodeRootObject: rootObject];
  }
}

NAN_METHOD(NNSCoder::encodeBycopyObject) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, anObject);
    [self encodeBycopyObject: anObject];
  }
}

NAN_METHOD(NNSCoder::encodeByrefObject) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, anObject);
    [self encodeByrefObject: anObject];
  }
}

NAN_METHOD(NNSCoder::encodeConditionalObject) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, object);
    [self encodeConditionalObject: object];
  }
}

NAN_METHOD(NNSCoder::encodeValuesOfObjCTypes) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_pointer(const-char, types);
    [self encodeValuesOfObjCTypes: types ...];
    #endif
  }
}

NAN_METHOD(NNSCoder::encodeArrayOfObjCTypeCountAt) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_pointer(const-char, type);
    declare_value(NSUInteger, count);
    declare_pointer(const-void, array);
    [self encodeArrayOfObjCType: type count: count at: array];
    #endif
  }
}

NAN_METHOD(NNSCoder::encodeBytesLength) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_nullable_pointer(const-void, byteaddr);
    declare_value(NSUInteger, length);
    [self encodeBytes: byteaddr length: length];
    #endif
  }
}

NAN_METHOD(NNSCoder::decodeObject) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self decodeObject]));
  }
}

NAN_METHOD(NNSCoder::decodeTopLevelObjectAndReturnError) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_pointer(NSError-pointer, error);
    JS_SET_RETURN(js_value_id([self decodeTopLevelObjectAndReturnError: error]));
    #endif
  }
}

NAN_METHOD(NNSCoder::decodeValuesOfObjCTypes) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_pointer(const-char, types);
    [self decodeValuesOfObjCTypes: types ...];
    #endif
  }
}

NAN_METHOD(NNSCoder::decodeArrayOfObjCTypeCountAt) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_pointer(const-char, itemType);
    declare_value(NSUInteger, count);
    declare_pointer(void, array);
    [self decodeArrayOfObjCType: itemType count: count at: array];
    #endif
  }
}

NAN_METHOD(NNSCoder::decodeBytesWithReturnedLength) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_pointer(NSUInteger, lengthp);
    JS_SET_RETURN(js_value_void_pointer([self decodeBytesWithReturnedLength: lengthp]));
    #endif
  }
}

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
NAN_METHOD(NNSCoder::encodePropertyList) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, aPropertyList);
    [self encodePropertyList: aPropertyList];
  }
}

NAN_METHOD(NNSCoder::decodePropertyList) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self decodePropertyList]));
  }
}
#endif

NAN_METHOD(NNSCoder::setObjectZone) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_nullable_pointer(NSZone, zone);
    [self setObjectZone: zone];
    #endif
  }
}

NAN_METHOD(NNSCoder::objectZone) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    JS_SET_RETURN(js_value_NSZone([self objectZone]));
    #endif
  }
}

NAN_METHOD(NNSCoder::encodeObjectForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, object);
    declare_pointer(NSString, key);
    [self encodeObject: object forKey: key];
  }
}

NAN_METHOD(NNSCoder::encodeConditionalObjectForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, object);
    declare_pointer(NSString, key);
    [self encodeConditionalObject: object forKey: key];
  }
}

NAN_METHOD(NNSCoder::encodeBoolForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, value);
    declare_pointer(NSString, key);
    [self encodeBool: value forKey: key];
  }
}

NAN_METHOD(NNSCoder::encodeIntForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(int, value);
    declare_pointer(NSString, key);
    [self encodeInt: value forKey: key];
  }
}

NAN_METHOD(NNSCoder::encodeInt32_forKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(int32_t, value);
    declare_pointer(NSString, key);
    [self encodeInt32: value forKey: key];
  }
}

NAN_METHOD(NNSCoder::encodeInt64_forKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(int64_t, value);
    declare_pointer(NSString, key);
    [self encodeInt64: value forKey: key];
  }
}

NAN_METHOD(NNSCoder::encodeFloatForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, value);
    declare_pointer(NSString, key);
    [self encodeFloat: value forKey: key];
  }
}

NAN_METHOD(NNSCoder::encodeDoubleForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(double, value);
    declare_pointer(NSString, key);
    [self encodeDouble: value forKey: key];
  }
}

NAN_METHOD(NNSCoder::encodeBytesLengthForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_nullable_pointer(const-uint8_t, bytes);
    declare_value(NSUInteger, length);
    declare_pointer(NSString, key);
    [self encodeBytes: bytes length: length forKey: key];
    #endif
  }
}

NAN_METHOD(NNSCoder::containsValueForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_BOOL([self containsValueForKey: key]));
  }
}

NAN_METHOD(NNSCoder::decodeObjectForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self decodeObjectForKey: key]));
  }
}

NAN_METHOD(NNSCoder::decodeTopLevelObjectForKeyError) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO()
    #if 0
    declare_args();
    declare_pointer(NSString, key);
    declare_pointer(NSError-pointer, error);
    JS_SET_RETURN(js_value_id([self decodeTopLevelObjectForKey: key error: error]));
    #endif
  }
}

NAN_METHOD(NNSCoder::decodeBoolForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_BOOL([self decodeBoolForKey: key]));
  }
}

NAN_METHOD(NNSCoder::decodeIntForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_int([self decodeIntForKey: key]));
  }
}

NAN_METHOD(NNSCoder::decodeInt32ForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_int32_t([self decodeInt32ForKey: key]));
  }
}

NAN_METHOD(NNSCoder::decodeInt64ForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_int64_t([self decodeInt64ForKey: key]));
  }
}

NAN_METHOD(NNSCoder::decodeFloatForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_float([self decodeFloatForKey: key]));
  }
}

NAN_METHOD(NNSCoder::decodeDoubleForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_double([self decodeDoubleForKey: key]));
  }
}

NAN_METHOD(NNSCoder::decodeBytesForKeyReturnedLength) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO()
    #if 0
    declare_args();
    declare_pointer(NSString, key);
    declare_nullable_pointer(NSUInteger, lengthp);
    JS_SET_RETURN(js_value_uint8_t([self decodeBytesForKey: key returnedLength: lengthp]));
    #endif
  }
}

NAN_METHOD(NNSCoder::encodeIntegerForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, value);
    declare_pointer(NSString, key);
    [self encodeInteger: value forKey: key];
  }
}

NAN_METHOD(NNSCoder::decodeIntegerForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_NSInteger([self decodeIntegerForKey: key]));
  }
}

NAN_METHOD(NNSCoder::decodeObjectOfClassForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, aClass);
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self decodeObjectOfClass: aClass forKey: key]));
  }
}

NAN_METHOD(NNSCoder::decodeTopLevelObjectOfClassForKeyError) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_value(id, aClass);
    declare_pointer(NSString, key);
    declare_pointer(NSError-pointer, error);
    JS_SET_RETURN(js_value_id([self decodeTopLevelObjectOfClass: aClass forKey: key error: error]));
    #endif
  }
}

NAN_METHOD(NNSCoder::decodeObjectOfClassesForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_nullable_pointer(NSSet<Class>, classes);
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self decodeObjectOfClasses: classes forKey: key]));
    #endif
  }
}

NAN_METHOD(NNSCoder::decodeTopLevelObjectOfClassesForKeyError) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_nullable_pointer(NSSet<Class>, classes);
    declare_pointer(NSString, key);
    declare_pointer(NSError-pointer, error);
    JS_SET_RETURN(js_value_id([self decodeTopLevelObjectOfClasses: classes forKey: key error: error]));
    #endif
  }
}

NAN_METHOD(NNSCoder::decodePropertyListForKey) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self decodePropertyListForKey: key]));
  }
}

NAN_METHOD(NNSCoder::failWithError) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_pointer(NSError, error);
    [self failWithError: error];
    #endif
  }
}

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
NAN_METHOD(NNSCoder::encodeNXObject) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, object);
    [self encodeNXObject: object];
  }
}

NAN_METHOD(NNSCoder::decodeNXObject) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self decodeNXObject]));
  }
}
#endif

NAN_METHOD(NNSCoder::decodeValueOfObjCTypeAt) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    declare_args();
    declare_pointer(const-char, type);
    declare_pointer(void, data);
    [self decodeValueOfObjCType: type at: data];
    #endif
  }
}

NAN_GETTER(NNSCoder::systemVersionGetter) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_unsigned([self systemVersion]));
  }
}

NAN_GETTER(NNSCoder::allowsKeyedCodingGetter) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsKeyedCoding]));
  }
}

NAN_GETTER(NNSCoder::requiresSecureCodingGetter) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self requiresSecureCoding]));
  }
}

NAN_GETTER(NNSCoder::allowedClassesGetter) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    JS_SET_RETURN(js_value_NSSet<Class>([self allowedClasses]));
    #endif
  }
}

NAN_GETTER(NNSCoder::decodingFailurePolicyGetter) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDecodingFailurePolicy([self decodingFailurePolicy]));
  }
}

NAN_GETTER(NNSCoder::errorGetter) {
  JS_UNWRAP(NSCoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if 0
    JS_SET_RETURN(js_value_NSError([self error]));
    #endif
  }
}
