//
//  NUIButton.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIButton.h"

#define instancetype UIButton
#define js_value_instancetype js_value_UIButton

NUIButton::NUIButton() {}
NUIButton::~NUIButton() {}

JS_INIT_CLASS(UIButton, UIControl);
  // instance members (proto)
  JS_ASSIGN_STATIC_METHOD(buttonWithType);
  JS_ASSIGN_PROTO_METHOD(setTitleForState);
  JS_ASSIGN_PROTO_METHOD(setTitleColorForState);
  JS_ASSIGN_PROTO_METHOD(setTitleShadowColorForState);
  JS_ASSIGN_PROTO_METHOD(setImageForState);
  JS_ASSIGN_PROTO_METHOD(setBackgroundImageForState);
  JS_ASSIGN_PROTO_METHOD(setAttributedTitleForState);
  JS_ASSIGN_PROTO_METHOD(titleForState);
  JS_ASSIGN_PROTO_METHOD(titleColorForState);
  JS_ASSIGN_PROTO_METHOD(titleShadowColorForState);
  JS_ASSIGN_PROTO_METHOD(imageForState);
  JS_ASSIGN_PROTO_METHOD(backgroundImageForState);
  JS_ASSIGN_PROTO_METHOD(attributedTitleForState);
  JS_ASSIGN_PROTO_METHOD(backgroundRectForBounds);
  JS_ASSIGN_PROTO_METHOD(contentRectForBounds);
  JS_ASSIGN_PROTO_METHOD(titleRectForContentRect);
  JS_ASSIGN_PROTO_METHOD(imageRectForContentRect);
  JS_ASSIGN_PROTO_PROP(contentEdgeInsets);
  JS_ASSIGN_PROTO_PROP(titleEdgeInsets);
  JS_ASSIGN_PROTO_PROP(reversesTitleShadowWhenHighlighted);
  JS_ASSIGN_PROTO_PROP(imageEdgeInsets);
  JS_ASSIGN_PROTO_PROP(adjustsImageWhenHighlighted);
  JS_ASSIGN_PROTO_PROP(adjustsImageWhenDisabled);
  JS_ASSIGN_PROTO_PROP(showsTouchWhenHighlighted);
  JS_ASSIGN_PROTO_PROP(tintColor);
  JS_ASSIGN_PROTO_PROP_READONLY(buttonType);
  JS_ASSIGN_PROTO_PROP_READONLY(currentTitle);
  JS_ASSIGN_PROTO_PROP_READONLY(currentTitleColor);
  JS_ASSIGN_PROTO_PROP_READONLY(currentTitleShadowColor);
  JS_ASSIGN_PROTO_PROP_READONLY(currentImage);
  JS_ASSIGN_PROTO_PROP_READONLY(currentBackgroundImage);
  JS_ASSIGN_PROTO_PROP_READONLY(currentAttributedTitle);
  JS_ASSIGN_PROTO_PROP_READONLY(titleLabel);
  JS_ASSIGN_PROTO_PROP_READONLY(imageView);
  JS_ASSIGN_PROTO_PROP(font);
  JS_ASSIGN_PROTO_PROP(lineBreakMode);
  JS_ASSIGN_PROTO_PROP(titleShadowOffset);

  // static members (ctor)
  JS_INIT_CTOR(UIButton, UIControl);

  // constant values (exports)

//typedef NS_ENUM(NSInteger, UIButtonType) {
  JS_ASSIGN_ENUM(UIButtonTypeCustom, NSInteger); // = 0,                         
  JS_ASSIGN_ENUM(UIButtonTypeSystem, NSInteger); // NS_ENUM_AVAILABLE_IOS(7_0),  

  JS_ASSIGN_ENUM(UIButtonTypeDetailDisclosure, NSInteger);
  JS_ASSIGN_ENUM(UIButtonTypeInfoLight, NSInteger);
  JS_ASSIGN_ENUM(UIButtonTypeInfoDark, NSInteger);
  JS_ASSIGN_ENUM(UIButtonTypeContactAdd, NSInteger);
  
#ifdef __TVOS__
  JS_ASSIGN_ENUM(UIButtonTypePlain, NSInteger); // API_AVAILABLE(tvos(11.0)) API_UNAVAILABLE(ios, watchos), 
#endif

  JS_ASSIGN_ENUM(UIButtonTypeRoundedRect, NSInteger); // = UIButtonTypeSystem   
//};

JS_INIT_CLASS_END(UIButton, UIControl);

NAN_METHOD(NUIButton::New) {
  JS_RECONSTRUCT(UIButton);
  @autoreleasepool {
    UIButton* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIButton *)(info[0].As<External>()->Value());
    } else if (info.Length() > 0 && is_value_CGRect(info[0])) {
      self = [[UIButton alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UIButton alloc] init];
    }
    if (self) {
      NUIButton *wrapper = new NUIButton();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIButton::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIButton::buttonWithType) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIButtonType, buttonType);
    JS_SET_RETURN(js_value_instancetype([UIButton buttonWithType: buttonType]));
  }
}

NAN_METHOD(NUIButton::setTitleForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, title);
    declare_value(UIControlState, state);
    [self setTitle: title forState: state];
  }
}

NAN_METHOD(NUIButton::setTitleColorForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIColor, color);
    declare_value(UIControlState, state);
    [self setTitleColor: color forState: state];
  }
}

NAN_METHOD(NUIButton::setTitleShadowColorForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIColor, color);
    declare_value(UIControlState, state);
    [self setTitleShadowColor: color forState: state];
  }
}

#include "NUIImage.h"

NAN_METHOD(NUIButton::setImageForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    declare_value(UIControlState, state);
    [self setImage: image forState: state];
  }
}

NAN_METHOD(NUIButton::setBackgroundImageForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    declare_value(UIControlState, state);
    [self setBackgroundImage: image forState: state];
  }
}

#include "NNSAttributedString.h"

NAN_METHOD(NUIButton::setAttributedTitleForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSAttributedString, title);
    declare_value(UIControlState, state);
    [self setAttributedTitle: title forState: state];
  }
}

NAN_METHOD(NUIButton::titleForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_NSString([self titleForState: state]));
  }
}

NAN_METHOD(NUIButton::titleColorForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_UIColor([self titleColorForState: state]));
  }
}

NAN_METHOD(NUIButton::titleShadowColorForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_UIColor([self titleShadowColorForState: state]));
  }
}

NAN_METHOD(NUIButton::imageForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_UIImage([self imageForState: state]));
  }
}

NAN_METHOD(NUIButton::backgroundImageForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_UIImage([self backgroundImageForState: state]));
  }
}

NAN_METHOD(NUIButton::attributedTitleForState) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_NSAttributedString([self attributedTitleForState: state]));
  }
}

NAN_METHOD(NUIButton::backgroundRectForBounds) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self backgroundRectForBounds: bounds]));
  }
}

NAN_METHOD(NUIButton::contentRectForBounds) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self contentRectForBounds: bounds]));
  }
}

NAN_METHOD(NUIButton::titleRectForContentRect) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, contentRect);
    JS_SET_RETURN(js_value_CGRect([self titleRectForContentRect: contentRect]));
  }
}

NAN_METHOD(NUIButton::imageRectForContentRect) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, contentRect);
    JS_SET_RETURN(js_value_CGRect([self imageRectForContentRect: contentRect]));
  }
}

NAN_GETTER(NUIButton::contentEdgeInsetsGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self contentEdgeInsets]));
  }
}

NAN_SETTER(NUIButton::contentEdgeInsetsSetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIEdgeInsets, input);
    [self setContentEdgeInsets: input];
  }
}

NAN_GETTER(NUIButton::titleEdgeInsetsGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self titleEdgeInsets]));
  }
}

NAN_SETTER(NUIButton::titleEdgeInsetsSetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIEdgeInsets, input);
    [self setTitleEdgeInsets: input];
  }
}

NAN_GETTER(NUIButton::reversesTitleShadowWhenHighlightedGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self reversesTitleShadowWhenHighlighted]));
  }
}

NAN_SETTER(NUIButton::reversesTitleShadowWhenHighlightedSetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setReversesTitleShadowWhenHighlighted: input];
  }
}

NAN_GETTER(NUIButton::imageEdgeInsetsGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self imageEdgeInsets]));
  }
}

NAN_SETTER(NUIButton::imageEdgeInsetsSetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIEdgeInsets, input);
    [self setImageEdgeInsets: input];
  }
}

NAN_GETTER(NUIButton::adjustsImageWhenHighlightedGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self adjustsImageWhenHighlighted]));
  }
}

NAN_SETTER(NUIButton::adjustsImageWhenHighlightedSetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAdjustsImageWhenHighlighted: input];
  }
}

NAN_GETTER(NUIButton::adjustsImageWhenDisabledGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self adjustsImageWhenDisabled]));
  }
}

NAN_SETTER(NUIButton::adjustsImageWhenDisabledSetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAdjustsImageWhenDisabled: input];
  }
}

NAN_GETTER(NUIButton::showsTouchWhenHighlightedGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsTouchWhenHighlighted]));
  }
}

NAN_SETTER(NUIButton::showsTouchWhenHighlightedSetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsTouchWhenHighlighted: input];
  }
}

NAN_GETTER(NUIButton::tintColorGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self tintColor]));
  }
}

NAN_SETTER(NUIButton::tintColorSetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setTintColor: input];
  }
}

NAN_GETTER(NUIButton::buttonTypeGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIButtonType([self buttonType]));
  }
}

NAN_GETTER(NUIButton::currentTitleGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self currentTitle]));
  }
}

NAN_GETTER(NUIButton::currentTitleColorGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self currentTitleColor]));
  }
}

NAN_GETTER(NUIButton::currentTitleShadowColorGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self currentTitleShadowColor]));
  }
}

NAN_GETTER(NUIButton::currentImageGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self currentImage]));
  }
}

NAN_GETTER(NUIButton::currentBackgroundImageGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self currentBackgroundImage]));
  }
}

NAN_GETTER(NUIButton::currentAttributedTitleGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSAttributedString([self currentAttributedTitle]));
  }
}

#include "NUILabel.h"

NAN_GETTER(NUIButton::titleLabelGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UILabel([self titleLabel]));
  }
}

#include "NUIImageView.h"

NAN_GETTER(NUIButton::imageViewGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImageView([self imageView]));
  }
}

#include "NUIFont.h"

NAN_GETTER(NUIButton::fontGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIFont([self font]));
  }
}

NAN_SETTER(NUIButton::fontSetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIFont, input);
    [self setFont: input];
  }
}

#include "NNSParagraphStyle.h"

NAN_GETTER(NUIButton::lineBreakModeGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSLineBreakMode([self lineBreakMode]));
  }
}

NAN_SETTER(NUIButton::lineBreakModeSetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSLineBreakMode, input);
    [self setLineBreakMode: input];
  }
}

NAN_GETTER(NUIButton::titleShadowOffsetGetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self titleShadowOffset]));
  }
}

NAN_SETTER(NUIButton::titleShadowOffsetSetter) {
  JS_UNWRAP(UIButton, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setTitleShadowOffset: input];
  }
}
