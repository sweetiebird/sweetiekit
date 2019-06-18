//
//  NUILabel.mm
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUILabel.h"

NUILabel::NUILabel() {}
NUILabel::~NUILabel() {}

JS_INIT_CLASS(UILabel, UIView);
  // instance members (proto)
  JS_SET_PROP(proto, "text", Text);
  JS_SET_PROP(proto, "numberOfLines", NumberOfLines);
  JS_SET_PROP(proto, "font", Font);
  JS_SET_PROP(proto, "textColor", TextColor);
  JS_SET_PROP(proto, "highlightedTextColor", HighlightedTextColor);
  JS_SET_PROP(proto, "isHighlighted", IsHighlighted);
  JS_ASSIGN_PROP(proto, textAlignment);
  JS_ASSIGN_PROP(proto, attributedText);
  // static members (ctor)
  JS_INIT_CTOR(UILabel, UIView);
  // constants (exports)
  
/* Values for NSTextAlignment */
//typedef NS_ENUM(NSInteger, NSTextAlignment) {
    JS_ASSIGN_ENUM(NSTextAlignmentLeft, NSInteger); //       = 0,    // Visually left aligned
#if TARGET_OS_IPHONE && !0
    JS_ASSIGN_ENUM(NSTextAlignmentCenter, NSInteger); //     = 1,    // Visually centered
    JS_ASSIGN_ENUM(NSTextAlignmentRight, NSInteger); //      = 2,    // Visually right aligned
#else /* !TARGET_OS_IPHONE */
    JS_ASSIGN_ENUM(NSTextAlignmentRight, NSInteger); //      = 1,    // Visually right aligned
    JS_ASSIGN_ENUM(NSTextAlignmentCenter, NSInteger); //     = 2,    // Visually centered
#endif
    JS_ASSIGN_ENUM(NSTextAlignmentJustified, NSInteger); //  = 3,    // Fully-justified. The last line in a paragraph is natural-aligned.
    JS_ASSIGN_ENUM(NSTextAlignmentNatural, NSInteger); //    = 4,    // Indicates the default alignment for script
//} NS_ENUM_AVAILABLE_IOS(6_0);

#if TODO
#if __has_include(<CoreText/CTParagraphStyle.h>)
UIKIT_SWIFT_FORWARD_DECLARE(typedef CF_ENUM(uint8_t, CTTextAlignment))
UIKIT_EXTERN CTTextAlignment NSTextAlignmentToCTTextAlignment(NSTextAlignment nsTextAlignment) NS_AVAILABLE_IOS(6_0);
UIKIT_EXTERN NSTextAlignment NSTextAlignmentFromCTTextAlignment(CTTextAlignment ctTextAlignment) NS_AVAILABLE_IOS(6_0);
#endif
#endif

/* Values for NSWritingDirection */
//typedef NS_ENUM(NSInteger, NSWritingDirection) {
    JS_ASSIGN_ENUM(NSWritingDirectionNatural, NSInteger); //        = -1,    // Determines direction using the Unicode Bidi Algorithm rules P2 and P3
    JS_ASSIGN_ENUM(NSWritingDirectionLeftToRight, NSInteger); //    =  0,    // Left to right writing direction
    JS_ASSIGN_ENUM(NSWritingDirectionRightToLeft, NSInteger); //    =  1     // Right to left writing direction
//} NS_ENUM_AVAILABLE_IOS(6_0);

JS_INIT_CLASS_END(UILabel, UIView);

NAN_METHOD(NUILabel::New) {
  JS_RECONSTRUCT(UILabel);
  @autoreleasepool {
    UILabel* self = nullptr;

    if (IS_EXT(info[0])) {
      self = (__bridge UILabel *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 4) {
      self = [[UILabel alloc]
              initWithFrame:CGRectMake(
                TO_FLOAT(info[0]),
                TO_FLOAT(info[1]),
                TO_FLOAT(info[2]),
                TO_FLOAT(info[3])
              )];
    } else if (info.Length() >= 1 && IS_OBJ(info[0])) {
      Local<Object> args = JS_OBJ(info[0]);

      if (JS_HAS_STR(args, "frame")) {
        Local<Object> frame = JS_OBJ(args->Get(JS_STR("frame")));

        self = [[UILabel alloc] initWithFrame:sweetiekit::FrameFromJSObj(frame)];
      } else if (JS_HAS_STR(args, "width")) {
        self = [[UILabel alloc] initWithFrame:sweetiekit::FrameFromJSObj(args)];
      }
    } else if (info.Length() <= 0) {
      self = [[UILabel alloc] init];
    }

    if (self) {
      NUILabel *wrapper = new NUILabel();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNBox::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUILabel::TextGetter) {
  Nan::HandleScope scope;

  NUILabel *view = ObjectWrap::Unwrap<NUILabel>(info.This());
  __block NSString* str = nullptr;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      str = [view->As<UILabel>() text];
    });
  }

  if (str != nullptr) {
    auto result = JS_STR([str UTF8String]);
    info.GetReturnValue().Set(result);
  }
  
}

NAN_SETTER(NUILabel::TextSetter) {
  Nan::HandleScope scope;

  NUILabel *btn = ObjectWrap::Unwrap<NUILabel>(info.This());

  std::string title;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    title = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [btn->As<UILabel>() setText:[NSString stringWithUTF8String:title.c_str()]];
    });
  }
}

NAN_GETTER(NUILabel::NumberOfLinesGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UILabel, ui);
  
  JS_SET_RETURN(JS_NUM([ui numberOfLines]));
}

NAN_SETTER(NUILabel::NumberOfLinesSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UILabel, ui);

  int lines = TO_INT32(value);

  [ui setNumberOfLines:lines];
}

#include "NUIFont.h"

NAN_GETTER(NUILabel::FontGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UILabel, ui);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui font], NUIFont::type));
}

NAN_SETTER(NUILabel::FontSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UILabel, ui);

  NUIFont *font = ObjectWrap::Unwrap<NUIFont>(Local<Object>::Cast(value));

  @autoreleasepool {
    [ui setFont:font->As<UIFont>()];
  }
}

NAN_GETTER(NUILabel::TextColorGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UILabel, ui);
  
  CGFloat red = 0;
  CGFloat green = 0;
  CGFloat blue = 0;
  CGFloat alpha = 1;
  @autoreleasepool {
    UIColor* color = [ui textColor];
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUILabel::TextColorSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UILabel, ui);

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  @autoreleasepool {
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    [ui setTextColor:color];
  }
}

NAN_GETTER(NUILabel::HighlightedTextColorGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UILabel, ui);
  
  CGFloat red = 0;
  CGFloat green = 0;
  CGFloat blue = 0;
  CGFloat alpha = 1;
  @autoreleasepool {
    UIColor* color = [ui highlightedTextColor];
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUILabel::HighlightedTextColorSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UILabel, ui);

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  @autoreleasepool {
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    [ui setHighlightedTextColor:color];
  }
}

NAN_GETTER(NUILabel::IsHighlightedGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UILabel, ui);

  JS_SET_RETURN(JS_BOOL([ui isHighlighted]));
}

NAN_SETTER(NUILabel::IsHighlightedSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UILabel, ui);
  
  [ui setHighlighted:TO_BOOL(value)];
}

NAN_GETTER(NUILabel::textAlignmentGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UILabel, ui);

  JS_SET_RETURN(JS_NUM([ui textAlignment]));
}

NAN_SETTER(NUILabel::textAlignmentSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UILabel, ui);
  
  NSTextAlignment type = NSTextAlignment(TO_DOUBLE(value));

  @autoreleasepool {
    [ui setTextAlignment:type];
  }
}

#include "NNSAttributedString.h"

NAN_GETTER(NUILabel::attributedTextGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UILabel, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui attributedText], NNSAttributedString::type));
}

NAN_SETTER(NUILabel::attributedTextSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UILabel, ui);
  
  NSAttributedString *str = (NSAttributedString *)sweetiekit::FromJS(value);
  
  [ui setAttributedText:str];
}

