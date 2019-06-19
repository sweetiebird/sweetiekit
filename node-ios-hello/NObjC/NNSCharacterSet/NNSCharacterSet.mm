//
//  NNSCharacterSet.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSCharacterSet.h"

#define instancetype NSCharacterSet
#define js_value_instancetype js_value_NSCharacterSet

NNSCharacterSet::NNSCharacterSet() {}
NNSCharacterSet::~NNSCharacterSet() {}

JS_INIT_CLASS(NSCharacterSet, NSObject);
  // instance members (proto)
  JS_ASSIGN_STATIC_METHOD(characterSetWithRange);
  JS_ASSIGN_STATIC_METHOD(characterSetWithCharactersInString);
  JS_ASSIGN_STATIC_METHOD(characterSetWithBitmapRepresentation);
  JS_ASSIGN_STATIC_METHOD(characterSetWithContentsOfFile);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(characterIsMember);
  JS_ASSIGN_PROTO_METHOD(longCharacterIsMember);
  JS_ASSIGN_PROTO_METHOD(isSupersetOfSet);
  JS_ASSIGN_PROTO_METHOD(hasMemberInPlane);
  JS_ASSIGN_STATIC_PROP_READONLY(controlCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(whitespaceCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(whitespaceAndNewlineCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(decimalDigitCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(letterCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(lowercaseLetterCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(uppercaseLetterCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(nonBaseCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(alphanumericCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(decomposableCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(illegalCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(punctuationCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(capitalizedLetterCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(symbolCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(newlineCharacterSet);
  JS_ASSIGN_PROTO_PROP_READONLY(bitmapRepresentation);
  JS_ASSIGN_PROTO_PROP_READONLY(invertedSet);

  // static members (ctor)
  JS_INIT_CTOR(NSCharacterSet, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSCharacterSet, NSObject);

NAN_METHOD(NNSCharacterSet::New) {
  JS_RECONSTRUCT(NSCharacterSet);
  @autoreleasepool {
    NSCharacterSet* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSCharacterSet *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSCharacterSet alloc] init];
    }
    if (self) {
      NNSCharacterSet *wrapper = new NNSCharacterSet();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSCharacterSet::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSCharacterSet::characterSetWithRange) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, aRange);
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet characterSetWithRange: aRange]));
  }
}

NAN_METHOD(NNSCharacterSet::characterSetWithCharactersInString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, aString);
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet characterSetWithCharactersInString: aString]));
  }
}

NAN_METHOD(NNSCharacterSet::characterSetWithBitmapRepresentation) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet characterSetWithBitmapRepresentation: data]));
  }
}

NAN_METHOD(NNSCharacterSet::characterSetWithContentsOfFile) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, fName);
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet characterSetWithContentsOfFile: fName]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NNSCharacterSet::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(NSCharacterSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NNSCharacterSet::characterIsMember) {
  JS_UNWRAP(NSCharacterSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(unichar, aCharacter);
    JS_SET_RETURN(js_value_BOOL([self characterIsMember: aCharacter]));
  }
}

NAN_METHOD(NNSCharacterSet::longCharacterIsMember) {
  JS_UNWRAP(NSCharacterSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UTF32Char, theLongChar);
    JS_SET_RETURN(js_value_BOOL([self longCharacterIsMember: theLongChar]));
  }
}

NAN_METHOD(NNSCharacterSet::isSupersetOfSet) {
  JS_UNWRAP(NSCharacterSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCharacterSet, theOtherSet);
    JS_SET_RETURN(js_value_BOOL([self isSupersetOfSet: theOtherSet]));
  }
}

NAN_METHOD(NNSCharacterSet::hasMemberInPlane) {
  JS_UNWRAP(NSCharacterSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(uint8_t, thePlane);
    JS_SET_RETURN(js_value_BOOL([self hasMemberInPlane: thePlane]));
  }
}

NAN_GETTER(NNSCharacterSet::controlCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet controlCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::whitespaceCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet whitespaceCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::whitespaceAndNewlineCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet whitespaceAndNewlineCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::decimalDigitCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet decimalDigitCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::letterCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet letterCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::lowercaseLetterCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet lowercaseLetterCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::uppercaseLetterCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet uppercaseLetterCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::nonBaseCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet nonBaseCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::alphanumericCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet alphanumericCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::decomposableCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet decomposableCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::illegalCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet illegalCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::punctuationCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet punctuationCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::capitalizedLetterCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet capitalizedLetterCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::symbolCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet symbolCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::newlineCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet newlineCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::bitmapRepresentationGetter) {
  JS_UNWRAP(NSCharacterSet, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self bitmapRepresentation]));
  }
}

NAN_GETTER(NNSCharacterSet::invertedSetGetter) {
  JS_UNWRAP(NSCharacterSet, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([self invertedSet]));
  }
}
