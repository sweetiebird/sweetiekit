//
//  NNSMutableCharacterSet.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSMutableCharacterSet.h"

#define instancetype NSMutableCharacterSet
#define js_value_instancetype js_value_NSMutableCharacterSet

NNSMutableCharacterSet::NNSMutableCharacterSet() {}
NNSMutableCharacterSet::~NNSMutableCharacterSet() {}

JS_INIT_CLASS(NSMutableCharacterSet, NSCharacterSet);
  // instance members (proto)
  JS_ASSIGN_STATIC_METHOD(controlCharacterSet);
  JS_ASSIGN_STATIC_METHOD(whitespaceCharacterSet);
  JS_ASSIGN_STATIC_METHOD(whitespaceAndNewlineCharacterSet);
  JS_ASSIGN_STATIC_METHOD(decimalDigitCharacterSet);
  JS_ASSIGN_STATIC_METHOD(letterCharacterSet);
  JS_ASSIGN_STATIC_METHOD(lowercaseLetterCharacterSet);
  JS_ASSIGN_STATIC_METHOD(uppercaseLetterCharacterSet);
  JS_ASSIGN_STATIC_METHOD(nonBaseCharacterSet);
  JS_ASSIGN_STATIC_METHOD(alphanumericCharacterSet);
  JS_ASSIGN_STATIC_METHOD(decomposableCharacterSet);
  JS_ASSIGN_STATIC_METHOD(illegalCharacterSet);
  JS_ASSIGN_STATIC_METHOD(punctuationCharacterSet);
  JS_ASSIGN_STATIC_METHOD(capitalizedLetterCharacterSet);
  JS_ASSIGN_STATIC_METHOD(symbolCharacterSet);
  JS_ASSIGN_STATIC_METHOD(newlineCharacterSet);
  JS_ASSIGN_STATIC_METHOD(characterSetWithRange);
  JS_ASSIGN_STATIC_METHOD(characterSetWithCharactersInString);
  JS_ASSIGN_STATIC_METHOD(characterSetWithBitmapRepresentation);
  JS_ASSIGN_STATIC_METHOD(characterSetWithContentsOfFile);
  JS_ASSIGN_PROTO_METHOD(addCharactersInRange);
  JS_ASSIGN_PROTO_METHOD(removeCharactersInRange);
  JS_ASSIGN_PROTO_METHOD(addCharactersInString);
  JS_ASSIGN_PROTO_METHOD(removeCharactersInString);
  JS_ASSIGN_PROTO_METHOD(formUnionWithCharacterSet);
  JS_ASSIGN_PROTO_METHOD(formIntersectionWithCharacterSet);
  JS_ASSIGN_PROTO_METHOD(invert);

  // static members (ctor)
  JS_INIT_CTOR(NSMutableCharacterSet, NSCharacterSet);
  // constant values (exports)
JS_INIT_CLASS_END(NSMutableCharacterSet, NSCharacterSet);

NAN_METHOD(NNSMutableCharacterSet::New) {
  JS_RECONSTRUCT(NSMutableCharacterSet);
  @autoreleasepool {
    NSMutableCharacterSet* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSMutableCharacterSet *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSMutableCharacterSet alloc] init];
    }
    if (self) {
      NNSMutableCharacterSet *wrapper = new NNSMutableCharacterSet();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSMutableCharacterSet::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSMutableCharacterSet::controlCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet controlCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::whitespaceCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet whitespaceCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::whitespaceAndNewlineCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet whitespaceAndNewlineCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::decimalDigitCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet decimalDigitCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::letterCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet letterCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::lowercaseLetterCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet lowercaseLetterCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::uppercaseLetterCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet uppercaseLetterCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::nonBaseCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet nonBaseCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::alphanumericCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet alphanumericCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::decomposableCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet decomposableCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::illegalCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet illegalCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::punctuationCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet punctuationCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::capitalizedLetterCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet capitalizedLetterCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::symbolCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet symbolCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::newlineCharacterSet) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet newlineCharacterSet]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::characterSetWithRange) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, aRange);
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet characterSetWithRange: aRange]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::characterSetWithCharactersInString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, aString);
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet characterSetWithCharactersInString: aString]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::characterSetWithBitmapRepresentation) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet characterSetWithBitmapRepresentation: data]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::characterSetWithContentsOfFile) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, fName);
    JS_SET_RETURN(js_value_NSMutableCharacterSet([NSMutableCharacterSet characterSetWithContentsOfFile: fName]));
  }
}

NAN_METHOD(NNSMutableCharacterSet::addCharactersInRange) {
  JS_UNWRAP(NSMutableCharacterSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, aRange);
    [self addCharactersInRange: aRange];
  }
}

NAN_METHOD(NNSMutableCharacterSet::removeCharactersInRange) {
  JS_UNWRAP(NSMutableCharacterSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, aRange);
    [self removeCharactersInRange: aRange];
  }
}

NAN_METHOD(NNSMutableCharacterSet::addCharactersInString) {
  JS_UNWRAP(NSMutableCharacterSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, aString);
    [self addCharactersInString: aString];
  }
}

NAN_METHOD(NNSMutableCharacterSet::removeCharactersInString) {
  JS_UNWRAP(NSMutableCharacterSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, aString);
    [self removeCharactersInString: aString];
  }
}

NAN_METHOD(NNSMutableCharacterSet::formUnionWithCharacterSet) {
  JS_UNWRAP(NSMutableCharacterSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCharacterSet, otherSet);
    [self formUnionWithCharacterSet: otherSet];
  }
}

NAN_METHOD(NNSMutableCharacterSet::formIntersectionWithCharacterSet) {
  JS_UNWRAP(NSMutableCharacterSet, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCharacterSet, otherSet);
    [self formIntersectionWithCharacterSet: otherSet];
  }
}

NAN_METHOD(NNSMutableCharacterSet::invert) {
  JS_UNWRAP(NSMutableCharacterSet, self);
  declare_autoreleasepool {
    [self invert];
  }
}
