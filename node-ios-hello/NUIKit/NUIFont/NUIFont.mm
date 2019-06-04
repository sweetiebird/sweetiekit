//
//  UIFont.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIFont.h"

NUIFont::NUIFont() {}
NUIFont::~NUIFont() {}

JS_INIT_CLASS(UIFont, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, fontWithSize);
  JS_ASSIGN_PROP_READONLY(proto, familyName);
  JS_ASSIGN_PROP_READONLY(proto, fontName);
  JS_ASSIGN_PROP_READONLY(proto, pointSize);
  JS_ASSIGN_PROP_READONLY(proto, ascender);
  JS_ASSIGN_PROP_READONLY(proto, descender);
  JS_ASSIGN_PROP_READONLY(proto, capHeight);
  JS_ASSIGN_PROP_READONLY(proto, xHeight);
  JS_ASSIGN_PROP_READONLY(proto, lineHeight);
  JS_ASSIGN_PROP_READONLY(proto, leading);
  JS_ASSIGN_PROP_READONLY(proto, fontDescriptor);
  // static members (ctor)
  JS_INIT_CTOR(UIFont, NSObject);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), familyNames);
  JS_ASSIGN_METHOD(ctor, systemFont);
  JS_ASSIGN_METHOD(ctor, boldSystemFont);
  JS_ASSIGN_METHOD(ctor, italicSystemFont);
  JS_ASSIGN_METHOD(ctor, preferredFontForTextStyle);
  JS_ASSIGN_METHOD(ctor, preferredFontForTextStyleCompatibleWithTraitCollection);
  JS_ASSIGN_METHOD(ctor, fontWithNameSize);
  JS_ASSIGN_METHOD(ctor, fontNamesForFamilyName);
  JS_ASSIGN_METHOD(ctor, systemFontOfSize);
  JS_ASSIGN_METHOD(ctor, boldSystemFontOfSize);
  JS_ASSIGN_METHOD(ctor, italicSystemFontOfSize);
  JS_ASSIGN_METHOD(ctor, systemFontOfSizeWeight);
  JS_ASSIGN_METHOD(ctor, monospacedDigitSystemFontOfSizeWeight);
  JS_ASSIGN_METHOD(ctor, fontWithDescriptorSize);
JS_INIT_CLASS_END(UIFont, NSObject);

NAN_METHOD(NUIFont::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `UIFont(...)`, turn into construct call.
      JS_SET_RETURN_NEW(UIFont, info);
      return;
    }
    UIFont* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIFont *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && info[0]->IsString()) {
      self = [UIFont fontWithName:to_value_NSString(info[0]) size:(info[1]->IsNumber() ? TO_INT32(info[1]) : 17)];
    } else if (info.Length() <= 0) {
      self = [[UIFont alloc] init];
    }
    if (self) {
      NUIFont *wrapper = new NUIFont();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIFont::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIFont::systemFont) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NUIFont)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUIFont *ui = ObjectWrap::Unwrap<NUIFont>(obj);

  @autoreleasepool {
    double size = TO_DOUBLE(info[0]);
    ui->SetNSObject([UIFont systemFontOfSize:size]);
  }

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUIFont::boldSystemFont) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NUIFont)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUIFont *ui = ObjectWrap::Unwrap<NUIFont>(obj);

  @autoreleasepool {
    double size = TO_DOUBLE(info[0]);
    ui->SetNSObject([UIFont boldSystemFontOfSize:size]);
  }

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUIFont::italicSystemFont) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NUIFont)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUIFont *ui = ObjectWrap::Unwrap<NUIFont>(obj);

  @autoreleasepool {
    double size = TO_DOUBLE(info[0]);
    ui->SetNSObject([UIFont italicSystemFontOfSize:size]);
  }

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUIFont::preferredFontForTextStyle) {
  @autoreleasepool
  {
    declare_args();
    declare_value(UIFontTextStyle, style);
    JS_SET_RETURN(js_value_UIFont([UIFont preferredFontForTextStyle: style]));
  }
}

#define js_value_UITraitCollection(x) js_value_wrapper_unknown(x, UITraitCollection)
#define to_value_UITraitCollection(x) to_value_wrapper_unknown(x, UITraitCollection)
#define is_value_UITraitCollection(x) is_value_wrapper_unknown(x, UITraitCollection)

NAN_METHOD(NUIFont::preferredFontForTextStyleCompatibleWithTraitCollection) {
  @autoreleasepool
  {
    declare_args();
    declare_value(UIFontTextStyle, style);
    declare_pointer(UITraitCollection, traitCollection);
    JS_SET_RETURN(js_value_UIFont([UIFont preferredFontForTextStyle: style compatibleWithTraitCollection: traitCollection]));
  }
}

NAN_METHOD(NUIFont::fontWithNameSize) {
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, fontName);
    declare_value(CGFloat, fontSize);
    JS_SET_RETURN(js_value_UIFont([UIFont fontWithName: fontName size: fontSize]));
  }
}

NAN_METHOD(NUIFont::fontNamesForFamilyName) {
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, familyName);
    JS_SET_RETURN(js_value_NSArray<NSString*>([UIFont fontNamesForFamilyName: familyName]));
  }
}

NAN_METHOD(NUIFont::systemFontOfSize) {
  @autoreleasepool
  {
    declare_args();
    declare_value(CGFloat, fontSize);
    JS_SET_RETURN(js_value_UIFont([UIFont systemFontOfSize: fontSize]));
  }
}

NAN_METHOD(NUIFont::boldSystemFontOfSize) {
  @autoreleasepool
  {
    declare_args();
    declare_value(CGFloat, fontSize);
    JS_SET_RETURN(js_value_UIFont([UIFont boldSystemFontOfSize: fontSize]));
  }
}

NAN_METHOD(NUIFont::italicSystemFontOfSize) {
  @autoreleasepool
  {
    declare_args();
    declare_value(CGFloat, fontSize);
    JS_SET_RETURN(js_value_UIFont([UIFont italicSystemFontOfSize: fontSize]));
  }
}

NAN_METHOD(NUIFont::systemFontOfSizeWeight) {
  @autoreleasepool
  {
    declare_args();
    declare_value(CGFloat, fontSize);
    declare_value(CGFloat, weight);
    JS_SET_RETURN(js_value_UIFont([UIFont systemFontOfSize: fontSize weight: weight]));
  }
}

NAN_METHOD(NUIFont::monospacedDigitSystemFontOfSizeWeight) {
  @autoreleasepool
  {
    declare_args();
    declare_value(CGFloat, fontSize);
    declare_value(CGFloat, weight);
    JS_SET_RETURN(js_value_UIFont([UIFont monospacedDigitSystemFontOfSize: fontSize weight: weight]));
  }
}

#define js_value_UIFontDescriptor(x) js_value_wrapper_unknown(x, UIFontDescriptor)
#define to_value_UIFontDescriptor(x) to_value_wrapper_unknown(x, UIFontDescriptor)
#define is_value_UIFontDescriptor(x) is_value_wrapper_unknown(x, UIFontDescriptor)

NAN_METHOD(NUIFont::fontWithDescriptorSize) {
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIFontDescriptor, descriptor);
    declare_value(CGFloat, pointSize);
    JS_SET_RETURN(js_value_UIFont([UIFont fontWithDescriptor: descriptor size: pointSize]));
  }
}

NAN_METHOD(NUIFont::fontWithSize) {
  JS_UNWRAP(UIFont, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGFloat, fontSize);
    JS_SET_RETURN(js_value_UIFont([self fontWithSize: fontSize]));
  }
}

NAN_GETTER(NUIFont::familyNamesGetter) {
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray<NSString*>([UIFont familyNames]));
  }
}

NAN_GETTER(NUIFont::familyNameGetter) {
  JS_UNWRAP(UIFont, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self familyName]));
  }
}

NAN_GETTER(NUIFont::fontNameGetter) {
  JS_UNWRAP(UIFont, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self fontName]));
  }
}

NAN_GETTER(NUIFont::pointSizeGetter) {
  JS_UNWRAP(UIFont, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self pointSize]));
  }
}

NAN_GETTER(NUIFont::ascenderGetter) {
  JS_UNWRAP(UIFont, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self ascender]));
  }
}

NAN_GETTER(NUIFont::descenderGetter) {
  JS_UNWRAP(UIFont, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self descender]));
  }
}

NAN_GETTER(NUIFont::capHeightGetter) {
  JS_UNWRAP(UIFont, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self capHeight]));
  }
}

NAN_GETTER(NUIFont::xHeightGetter) {
  JS_UNWRAP(UIFont, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self xHeight]));
  }
}

NAN_GETTER(NUIFont::lineHeightGetter) {
  JS_UNWRAP(UIFont, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self lineHeight]));
  }
}

NAN_GETTER(NUIFont::leadingGetter) {
  JS_UNWRAP(UIFont, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self leading]));
  }
}

NAN_GETTER(NUIFont::fontDescriptorGetter) {
  JS_UNWRAP(UIFont, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIFontDescriptor([self fontDescriptor]));
  }
}

