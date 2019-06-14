//
//  NUITextField.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextField.h"
#include "NUIFont.h"

#define instancetype UITextField
#define js_value_instancetype js_value_UITextField

NUITextField::NUITextField()
{
}
NUITextField::~NUITextField()
{
}

JS_INIT_CLASS(UITextField, UIControl);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(callback);
  JS_ASSIGN_PROTO_PROP(autocorrectionType);
  
  JS_ASSIGN_PROTO_METHOD(borderRectForBounds);
  JS_ASSIGN_PROTO_METHOD(textRectForBounds);
  JS_ASSIGN_PROTO_METHOD(placeholderRectForBounds);
  JS_ASSIGN_PROTO_METHOD(editingRectForBounds);
  JS_ASSIGN_PROTO_METHOD(clearButtonRectForBounds);
  JS_ASSIGN_PROTO_METHOD(leftViewRectForBounds);
  JS_ASSIGN_PROTO_METHOD(rightViewRectForBounds);
  JS_ASSIGN_PROTO_METHOD(drawTextInRect);
  JS_ASSIGN_PROTO_METHOD(drawPlaceholderInRect);
  
  JS_ASSIGN_PROTO_PROP(text);
  JS_ASSIGN_PROTO_PROP(attributedText);
  JS_ASSIGN_PROTO_PROP(textColor);
  JS_ASSIGN_PROTO_PROP(font);
  JS_ASSIGN_PROTO_PROP(textAlignment);
  JS_ASSIGN_PROTO_PROP(borderStyle);
  JS_ASSIGN_PROTO_PROP(defaultTextAttributes);
  JS_ASSIGN_PROTO_PROP(placeholder);
  JS_ASSIGN_PROTO_PROP(attributedPlaceholder);
  JS_ASSIGN_PROTO_PROP(clearsOnBeginEditing);
  JS_ASSIGN_PROTO_PROP(adjustsFontSizeToFitWidth);
  JS_ASSIGN_PROTO_PROP(minimumFontSize);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(background);
  JS_ASSIGN_PROTO_PROP(disabledBackground);
  JS_ASSIGN_PROTO_PROP_READONLY(isEditing);
  JS_ASSIGN_PROTO_PROP(allowsEditingTextAttributes);
  JS_ASSIGN_PROTO_PROP(typingAttributes);
  JS_ASSIGN_PROTO_PROP(clearButtonMode);
  JS_ASSIGN_PROTO_PROP(leftView);
  JS_ASSIGN_PROTO_PROP(leftViewMode);
  JS_ASSIGN_PROTO_PROP(rightView);
  JS_ASSIGN_PROTO_PROP(rightViewMode);
  JS_ASSIGN_PROTO_PROP(inputView);
  JS_ASSIGN_PROTO_PROP(inputAccessoryView);
  JS_ASSIGN_PROTO_PROP(clearsOnInsertion);

  // static members (ctor)
  JS_INIT_CTOR(UITextField, UIControl);
  JS_ASSIGN_STATIC_METHOD(initWithFrameCallback);
JS_INIT_CLASS_END(UITextField, UIControl);

NAN_METHOD(NUITextField::New) {
  JS_RECONSTRUCT(UITextField);
  @autoreleasepool {
    UITextField* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UITextField *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[UITextField alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UITextField alloc] init];
    }
    if (self) {
      NUITextField *wrapper = new NUITextField();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NUITextField::New: invalid arguments");
    }
  }
}

#define get_persistent_function(from, name, key) \
      SweetJSFunction* name = (SweetJSFunction*)[from associatedValueForKey:key];

NAN_METHOD(NUITextField::initWithFrameCallback) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    UITextField* self = [[UITextField alloc] initWithFrame:frame];
    declare_persistent_function(callback, @"sweetiekit.UITextField.initWithFrameCallback");
    [self setPlaceholder:@"Enter text here"];
    [self setFont:[UIFont systemFontOfSize:15]];
    [self setBorderStyle:UITextBorderStyleRoundedRect];
    [self setAutocorrectionType:UITextAutocorrectionTypeNo];
    [self setKeyboardType:UIKeyboardTypeDefault];
    [self setReturnKeyType:UIReturnKeyDone];
    [self setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self setTargetClosureWithClosure:^(UITextField* sender){
      __block bool result = true;
      dispatch_main(^{
        get_persistent_function(sender, callback, @"sweetiekit.UITextField.initWithFrameCallback");
        if (callback) {
          result = to_value_BOOL([callback jsFunction]->Call("NUITextField::initWithFrameCallback"));
        }
      });
      return result;
    }];
    JS_SET_RETURN(js_value_instancetype(self));
  }
}

NAN_GETTER(NUITextField::callbackGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    get_persistent_function(self, callback, @"sweetiekit.UITextField.initWithFrameCallback");
    if (callback) {
      JS_SET_RETURN([callback jsFunction]->Get());
    }
  }
}

NAN_SETTER(NUITextField::callbackSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_persistent_function(callback, @"sweetiekit.UITextField.initWithFrameCallback");
  }
}

NAN_GETTER(NUITextField::autocorrectionTypeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self autocorrectionType]));
  }
}

NAN_SETTER(NUITextField::autocorrectionTypeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setAutocorrectionType:(UITextAutocorrectionType)input];
  }
}

NAN_METHOD(NUITextField::borderRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self borderRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::textRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self textRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::placeholderRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self placeholderRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::editingRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self editingRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::clearButtonRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self clearButtonRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::leftViewRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self leftViewRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::rightViewRectForBounds) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self rightViewRectForBounds: bounds]));
  }
}

NAN_METHOD(NUITextField::drawTextInRect) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    [self drawTextInRect: rect];
  }
}

NAN_METHOD(NUITextField::drawPlaceholderInRect) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    [self drawPlaceholderInRect: rect];
  }
}

NAN_GETTER(NUITextField::textGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString ([self text]));
  }
}

NAN_SETTER(NUITextField::textSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString , input);
    [self setText: input];
  }
}

#include "NNSAttributedString.h"

NAN_GETTER(NUITextField::attributedTextGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSAttributedString([self attributedText]));
  }
}

NAN_SETTER(NUITextField::attributedTextSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSAttributedString, input);
    [self setAttributedText: input];
  }
}

NAN_GETTER(NUITextField::textColorGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor ([self textColor]));
  }
}

NAN_SETTER(NUITextField::textColorSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor , input);
    [self setTextColor: input];
  }
}

NAN_GETTER(NUITextField::fontGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIFont ([self font]));
  }
}

NAN_SETTER(NUITextField::fontSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIFont , input);
    [self setFont: input];
  }
}

NAN_GETTER(NUITextField::textAlignmentGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTextAlignment([self textAlignment]));
  }
}

NAN_SETTER(NUITextField::textAlignmentSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTextAlignment, input);
    [self setTextAlignment: input];
  }
}

NAN_GETTER(NUITextField::borderStyleGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextBorderStyle([self borderStyle]));
  }
}

NAN_SETTER(NUITextField::borderStyleSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextBorderStyle, input);
    [self setBorderStyle: input];
  }
}

NAN_GETTER(NUITextField::defaultTextAttributesGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey, id>*/([self defaultTextAttributes]));
  }
}

NAN_SETTER(NUITextField::defaultTextAttributesSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, input);
    [self setDefaultTextAttributes: input];
  }
}

NAN_GETTER(NUITextField::placeholderGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString ([self placeholder]));
  }
}

NAN_SETTER(NUITextField::placeholderSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString , input);
    [self setPlaceholder: input];
  }
}

#include "NNSAttributedString.h"

NAN_GETTER(NUITextField::attributedPlaceholderGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSAttributedString([self attributedPlaceholder]));
  }
}

NAN_SETTER(NUITextField::attributedPlaceholderSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSAttributedString, input);
    [self setAttributedPlaceholder: input];
  }
}

NAN_GETTER(NUITextField::clearsOnBeginEditingGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self clearsOnBeginEditing]));
  }
}

NAN_SETTER(NUITextField::clearsOnBeginEditingSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setClearsOnBeginEditing: input];
  }
}

NAN_GETTER(NUITextField::adjustsFontSizeToFitWidthGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self adjustsFontSizeToFitWidth]));
  }
}

NAN_SETTER(NUITextField::adjustsFontSizeToFitWidthSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAdjustsFontSizeToFitWidth: input];
  }
}

NAN_GETTER(NUITextField::minimumFontSizeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self minimumFontSize]));
  }
}

NAN_SETTER(NUITextField::minimumFontSizeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMinimumFontSize: input];
  }
}

NAN_GETTER(NUITextField::delegateGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UITextFieldDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NUITextField::delegateSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UITextFieldDelegate>*/, input);
    [self setDelegate: input];
  }
}

#include "NUIImage.h"

NAN_GETTER(NUITextField::backgroundGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage ([self background]));
  }
}

NAN_SETTER(NUITextField::backgroundSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setBackground: input];
  }
}

NAN_GETTER(NUITextField::disabledBackgroundGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self disabledBackground]));
  }
}

NAN_SETTER(NUITextField::disabledBackgroundSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setDisabledBackground: input];
  }
}

NAN_GETTER(NUITextField::isEditingGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEditing]));
  }
}

NAN_GETTER(NUITextField::allowsEditingTextAttributesGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsEditingTextAttributes]));
  }
}

NAN_SETTER(NUITextField::allowsEditingTextAttributesSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsEditingTextAttributes: input];
  }
}

NAN_GETTER(NUITextField::typingAttributesGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey, id>*/([self typingAttributes]));
  }
}

NAN_SETTER(NUITextField::typingAttributesSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, input);
    [self setTypingAttributes: input];
  }
}

NAN_GETTER(NUITextField::clearButtonModeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextFieldViewMode([self clearButtonMode]));
  }
}

NAN_SETTER(NUITextField::clearButtonModeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextFieldViewMode, input);
    [self setClearButtonMode: input];
  }
}

NAN_GETTER(NUITextField::leftViewGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView ([self leftView]));
  }
}

NAN_SETTER(NUITextField::leftViewSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView , input);
    [self setLeftView: input];
  }
}

NAN_GETTER(NUITextField::leftViewModeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextFieldViewMode([self leftViewMode]));
  }
}

NAN_SETTER(NUITextField::leftViewModeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextFieldViewMode, input);
    [self setLeftViewMode: input];
  }
}

NAN_GETTER(NUITextField::rightViewGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView ([self rightView]));
  }
}

NAN_SETTER(NUITextField::rightViewSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView , input);
    [self setRightView: input];
  }
}

NAN_GETTER(NUITextField::rightViewModeGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextFieldViewMode([self rightViewMode]));
  }
}

NAN_SETTER(NUITextField::rightViewModeSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UITextFieldViewMode, input);
    [self setRightViewMode: input];
  }
}

NAN_GETTER(NUITextField::inputViewGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self inputView]));
  }
}

NAN_SETTER(NUITextField::inputViewSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setInputView: input];
  }
}

NAN_GETTER(NUITextField::inputAccessoryViewGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self inputAccessoryView]));
  }
}

NAN_SETTER(NUITextField::inputAccessoryViewSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setInputAccessoryView: input];
  }
}

NAN_GETTER(NUITextField::clearsOnInsertionGetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self clearsOnInsertion]));
  }
}

NAN_SETTER(NUITextField::clearsOnInsertionSetter) {
  JS_UNWRAP(UITextField, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setClearsOnInsertion: input];
  }
}

// --------- end source ----------------
