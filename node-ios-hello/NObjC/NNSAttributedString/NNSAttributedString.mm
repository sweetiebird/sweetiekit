//
//  NSAttributedString.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSAttributedString.h"

NNSAttributedString::NNSAttributedString () {}
NNSAttributedString::~NNSAttributedString () {}

JS_INIT_CLASS(NSAttributedString, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, attributesAtIndexEffectiveRange);
  JS_ASSIGN_METHOD(proto, attributeAtIndexEffectiveRange);
  JS_ASSIGN_METHOD(proto, attributedSubstringFromRange);
  JS_ASSIGN_METHOD(proto, attributesAtIndexLongestEffectiveRangeInRange);
  JS_ASSIGN_METHOD(proto, attributeAtIndexLongestEffectiveRangeInRange);
  JS_ASSIGN_METHOD(proto, isEqualToAttributedString);
  JS_ASSIGN_METHOD(proto, enumerateAttributesInRangeOptionsUsingBlock);
  JS_ASSIGN_METHOD(proto, enumerateAttributeInRangeOptionsUsingBlock);
  JS_ASSIGN_PROP_READONLY(proto, string);
  JS_ASSIGN_PROP_READONLY(proto, length);
  // static members (ctor)
  JS_INIT_CTOR(NSAttributedString, NSObject);
  JS_ASSIGN_METHOD(ctor, initWithString);
  JS_ASSIGN_METHOD(ctor, initWithStringAttributes);
  JS_ASSIGN_METHOD(ctor, initWithAttributedString);
JS_INIT_CLASS_END(NSAttributedString, NSObject);

NAN_METHOD(NNSAttributedString::New) {
  JS_RECONSTRUCT(NSAttributedString);
  @autoreleasepool {
    NSAttributedString* self = nullptr;
    
    declare_args();
    if (info[0]->IsExternal()) {
      self = (__bridge NSAttributedString *)(info[0].As<External>()->Value());
    } else if (is_value_NSString(info[0])) {
      declare_pointer(NSString, string);
      declare_nullable_pointer(NSDictionary, attributes);
      self = [[NSAttributedString alloc] initWithString:string attributes:attributes];
    } else if (is_value_NSAttributedString(info[0])) {
      declare_pointer(NSAttributedString, string);
      self = [[NSAttributedString alloc] initWithAttributedString:string];
    } else if (info.Length() <= 0) {
      self = [[NSAttributedString alloc] init];
    }
    if (self) {
      NNSAttributedString *wrapper = new NNSAttributedString();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSAttributedString::New: invalid arguments");
    }
  }
}

void copy_value_NSRange(Local<Value> dst, const NSRange* _Nullable value)
{
  if (value) {
    if (dst->IsObject()) {
      auto dstObj(JS_OBJ(dst));
      dstObj->Set(JS_STR("location"), js_value_NSUInteger(value->location));
      dstObj->Set(JS_STR("length"), js_value_NSUInteger(value->length));
    }
  }
}

NAN_METHOD(NNSAttributedString::attributesAtIndexEffectiveRange) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSUInteger, location);
    declare_value_pointer(NSRange, range);
    
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey,id>*/(
      [self attributesAtIndex: location effectiveRange: range]));
    copy_value_NSRange(rangeObj, range);
  }
}

NAN_METHOD(NNSAttributedString::attributeAtIndexEffectiveRange) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, attrName);
    declare_value(NSUInteger, location);
    declare_value_pointer(NSRange, range);
    
    JS_SET_RETURN(js_value_id(
      [self attribute: attrName atIndex: location effectiveRange: range]));
    copy_value_NSRange(rangeObj, range);
  }
}

NAN_METHOD(NNSAttributedString::attributedSubstringFromRange) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_NSAttributedString([self attributedSubstringFromRange: range]));
  }
}

NAN_METHOD(NNSAttributedString::attributesAtIndexLongestEffectiveRangeInRange) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool {
    declare_args();
    declare_value(NSUInteger, location);
    declare_value_pointer(NSRange, range);
    declare_value(NSRange, rangeLimit);
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey,id>*/(
      [self attributesAtIndex: location longestEffectiveRange: range inRange: rangeLimit]));
    copy_value_NSRange(rangeObj, range);
  }
}

NAN_METHOD(NNSAttributedString::attributeAtIndexLongestEffectiveRangeInRange) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, attrName);
    declare_value(NSUInteger, location);
    declare_value_pointer(NSRange, range);
    declare_value(NSRange, rangeLimit);
    
    JS_SET_RETURN(js_value_id(
      [self attribute: attrName atIndex: location longestEffectiveRange: range inRange: rangeLimit]));
    copy_value_NSRange(rangeObj, range);
  }
}

NAN_METHOD(NNSAttributedString::isEqualToAttributedString) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSAttributedString, other);
    
    JS_SET_RETURN(JS_BOOL(
      [self isEqualToAttributedString: other]));
  }
}

NAN_METHOD(NNSAttributedString::initWithString) {
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, str);
    
    JS_SET_RETURN_EXTERNAL(NSAttributedString,
      [[NSAttributedString alloc] initWithString: str]);
    return;
  }
}

NAN_METHOD(NNSAttributedString::initWithStringAttributes) {
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, str);
    declare_pointer(NSDictionary, attrs);
    
    JS_SET_RETURN_EXTERNAL(NSAttributedString,
      [[NSAttributedString alloc] initWithString: str attributes: attrs]);
  }
}

NAN_METHOD(NNSAttributedString::initWithAttributedString) {
  @autoreleasepool
  {
    NSAttributedString* attrStr(to_value_NSAttributedString(info[0]));
    JS_SET_RETURN_EXTERNAL(NSAttributedString, [[NSAttributedString alloc] initWithAttributedString: attrStr]);
  }
}

NAN_METHOD(NNSAttributedString::enumerateAttributesInRangeOptionsUsingBlock) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSRange, enumerationRange);
    declare_value(NSAttributedStringEnumerationOptions, opts);
    declare_value(NJSFunction, fn);
    sweetiekit::JSEnumerateShouldStop shouldStop(JS_PRETTY_METHOD_NAME);
    
    auto block = ^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
      dispatch_main(^{
        fn(JS_PRETTY_METHOD_NAME, js_value_id(value), js_value_NSRange(range), shouldStop);
        if (shouldStop) {
          *stop = true;
        }
      });
    };
    
    JS_SET_RETURN(js_value_void(
      [self enumerateAttributesInRange: enumerationRange options: opts usingBlock: block]));
  }
}
  

NAN_METHOD(NNSAttributedString::enumerateAttributeInRangeOptionsUsingBlock) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, attrName);
    declare_value(NSRange, enumerationRange);
    declare_value(NSAttributedStringEnumerationOptions, opts);
    declare_value(NJSFunction, fn);
    sweetiekit::JSEnumerateShouldStop shouldStop(JS_PRETTY_METHOD_NAME);
    
    auto block = ^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
      dispatch_main(^{
        fn(JS_PRETTY_METHOD_NAME, js_value_id(value), js_value_NSRange(range), shouldStop);
        if (shouldStop) {
          *stop = true;
        }
      });
    };
    
    JS_SET_RETURN(js_value_void(
      [self enumerateAttribute: attrName inRange: enumerationRange options: opts usingBlock: block]));
  }
}

NAN_GETTER(NNSAttributedString::stringGetter) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    JS_SET_RETURN(js_value_NSString([self string]));
  }
}

NAN_GETTER(NNSAttributedString::lengthGetter) {
  JS_UNWRAP(NSAttributedString, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSUInteger([self length]));
  }
}
