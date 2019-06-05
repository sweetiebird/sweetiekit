//
//  NSMutableAttributedString.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSMutableAttributedString.h"

NNSMutableAttributedString::NNSMutableAttributedString () {}
NNSMutableAttributedString::~NNSMutableAttributedString () {}

JS_INIT_CLASS(NSMutableAttributedString, NSAttributedString);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, addAttribute);
  JS_ASSIGN_METHOD(proto, replaceCharactersInRangeWithString);
  JS_ASSIGN_METHOD(proto, setAttributesRange);
  JS_ASSIGN_METHOD(proto, addAttributeValueRange);
  JS_ASSIGN_METHOD(proto, addAttributesRange);
  JS_ASSIGN_METHOD(proto, removeAttributeRange);
  JS_ASSIGN_METHOD(proto, replaceCharactersInRangeWithAttributedString);
  JS_ASSIGN_METHOD(proto, insertAttributedStringAtIndex);
  JS_ASSIGN_METHOD(proto, appendAttributedString);
  JS_ASSIGN_METHOD(proto, deleteCharactersInRange);
  JS_ASSIGN_METHOD(proto, setAttributedString);
  JS_ASSIGN_METHOD(proto, beginEditing);
  JS_ASSIGN_METHOD(proto, endEditing);

  // static members (ctor)
  JS_INIT_CTOR(NSMutableAttributedString, NSAttributedString);
JS_INIT_CLASS_END(NSMutableAttributedString, NSAttributedString);

NAN_METHOD(NNSMutableAttributedString::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NNSMutableAttributedString *ui = new NNSMutableAttributedString();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge NSMutableAttributedString *)(info[0].As<External>()->Value()));
  } else if (info.Length() == 1) {
    NSString* string = NJSStringToNSString(info[0]);
    if (string == nullptr) {
      Nan::ThrowError("Invalid argument");
      return;
    }
    @autoreleasepool {
      ui->SetNSObject([[NSMutableAttributedString alloc] initWithString:string]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[NSMutableAttributedString alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NNSMutableAttributedString::addAttribute) {
  JS_UNWRAP(NSMutableAttributedString, ns);
  
  @autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(id, value);
    declare_value(NSRange, range);
    [ns addAttribute:name value:value range:range];
  }
}

NAN_METHOD(NNSMutableAttributedString::replaceCharactersInRangeWithString) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSRange, range);
    declare_pointer(NSString, str);
    JS_SET_RETURN(js_value_void([self replaceCharactersInRange: range withString: str]));
  }
}

NAN_METHOD(NNSMutableAttributedString::setAttributesRange) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, attrs);
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_void([self setAttributes: attrs range: range]));
  }
}

NAN_METHOD(NNSMutableAttributedString::addAttributeValueRange) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(id, value);
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_void([self addAttribute: name value: value range: range]));
  }
}

NAN_METHOD(NNSMutableAttributedString::addAttributesRange) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, attrs);
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_void([self addAttributes: attrs range: range]));
  }
}

NAN_METHOD(NNSMutableAttributedString::removeAttributeRange) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, name);
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_void([self removeAttribute: name range: range]));
  }
}

NAN_METHOD(NNSMutableAttributedString::replaceCharactersInRangeWithAttributedString) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSRange, range);
    declare_pointer(NSAttributedString, attrString);
    JS_SET_RETURN(js_value_void([self replaceCharactersInRange: range withAttributedString: attrString]));
  }
}

NAN_METHOD(NNSMutableAttributedString::insertAttributedStringAtIndex) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSAttributedString, attrString);
    declare_value(NSUInteger, loc);
    JS_SET_RETURN(js_value_void([self insertAttributedString: attrString atIndex: loc]));
  }
}

NAN_METHOD(NNSMutableAttributedString::appendAttributedString) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSAttributedString, attrString);
    JS_SET_RETURN(js_value_void([self appendAttributedString: attrString]));
  }
}

NAN_METHOD(NNSMutableAttributedString::deleteCharactersInRange) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSRange, range);
    JS_SET_RETURN(js_value_void([self deleteCharactersInRange: range]));
  }
}

NAN_METHOD(NNSMutableAttributedString::setAttributedString) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSAttributedString, attrString);
    JS_SET_RETURN(js_value_void([self setAttributedString: attrString]));
  }
}

NAN_METHOD(NNSMutableAttributedString::beginEditing) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self beginEditing]));
  }
}

NAN_METHOD(NNSMutableAttributedString::endEditing) {
  JS_UNWRAP(NSMutableAttributedString, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self endEditing]));
  }
}

