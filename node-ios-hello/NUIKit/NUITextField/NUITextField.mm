//
//  NUITextField.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextField.h"
#include "NUIFont.h"

NUITextField::NUITextField()
: _callback(new Nan::Persistent<Function>())
{
}
NUITextField::~NUITextField()
{
  delete _callback;
}

JS_INIT_CLASS(UITextField, UIControl);
  // instance members (proto)
  JS_SET_PROP(proto, "callback", Callback);
  JS_ASSIGN_PROP(proto, autocorrectionType);
  
  JS_ASSIGN_METHOD(proto, borderRectForBounds);
  JS_ASSIGN_METHOD(proto, textRectForBounds);
  JS_ASSIGN_METHOD(proto, placeholderRectForBounds);
  JS_ASSIGN_METHOD(proto, editingRectForBounds);
  JS_ASSIGN_METHOD(proto, clearButtonRectForBounds);
  JS_ASSIGN_METHOD(proto, leftViewRectForBounds);
  JS_ASSIGN_METHOD(proto, rightViewRectForBounds);
  JS_ASSIGN_METHOD(proto, drawTextInRect);
  JS_ASSIGN_METHOD(proto, drawPlaceholderInRect);
  
  JS_ASSIGN_PROP(proto, text);
  JS_ASSIGN_PROP(proto, attributedText);
  JS_ASSIGN_PROP(proto, textColor);
  JS_ASSIGN_PROP(proto, font);
  JS_ASSIGN_PROP(proto, textAlignment);
  JS_ASSIGN_PROP(proto, borderStyle);
  JS_ASSIGN_PROP(proto, defaultTextAttributes);
  JS_ASSIGN_PROP(proto, placeholder);
  JS_ASSIGN_PROP(proto, attributedPlaceholder);
  JS_ASSIGN_PROP(proto, clearsOnBeginEditing);
  JS_ASSIGN_PROP(proto, adjustsFontSizeToFitWidth);
  JS_ASSIGN_PROP(proto, minimumFontSize);
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP(proto, background);
  JS_ASSIGN_PROP(proto, disabledBackground);
  JS_ASSIGN_PROP_READONLY(proto, isEditing);
  JS_ASSIGN_PROP(proto, allowsEditingTextAttributes);
  JS_ASSIGN_PROP(proto, typingAttributes);
  JS_ASSIGN_PROP(proto, clearButtonMode);
  JS_ASSIGN_PROP(proto, leftView);
  JS_ASSIGN_PROP(proto, leftViewMode);
  JS_ASSIGN_PROP(proto, rightView);
  JS_ASSIGN_PROP(proto, rightViewMode);
  JS_ASSIGN_PROP(proto, inputView);
  JS_ASSIGN_PROP(proto, inputAccessoryView);
  JS_ASSIGN_PROP(proto, clearsOnInsertion);

  // static members (ctor)
  JS_INIT_CTOR(UITextField, UIControl);
  JS_SET_METHOD(ctor, "alloc", Alloc);
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

NAN_METHOD(NUITextField::Alloc) {
  Nan::EscapableHandleScope scope;
  //auto resolver = Promise::Resolver::New(JS_CONTEXT()).ToLocalChecked();
  
  Local<Value> argv[] = {
  };
  Local<Object> tfObj = JS_TYPE(NUITextField)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  JS_UNWRAPPED(tfObj, UITextField, ui);

  double x = TO_DOUBLE(info[0]);
  double y = TO_DOUBLE(info[1]);
  double width = TO_DOUBLE(info[2]);
  double height = TO_DOUBLE(info[3]);
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      ui = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
      nui->SetNSObject(ui);
      [ui setPlaceholder:@"Enter text here"];
      [ui setFont:[UIFont systemFontOfSize:15]];
      [ui setBorderStyle:UITextBorderStyleRoundedRect];
      [ui setAutocorrectionType:UITextAutocorrectionTypeNo];
      [ui setKeyboardType:UIKeyboardTypeDefault];
      [ui setReturnKeyType:UIReturnKeyDone];
      [ui setClearButtonMode:UITextFieldViewModeWhileEditing];
      [ui setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
      [ui setTargetClosureWithClosure:^(UITextField*){
        Nan::HandleScope scope;
        sweetiekit::Resolve(nui->_callback);
        return true;
      }];
    });
  }
  
  if (info[4]->IsFunction()) {
    nui->_callback->Reset(Local<Function>::Cast(info[4]));
    NodeUIViewController* del = [[NodeUIViewController alloc] init];
    [ui associateValue:del withKey:@"sweetiekit.UITextField.callback"];
    [ui setDelegate:del];
  }

  info.GetReturnValue().Set(tfObj);
}

NAN_GETTER(NUITextField::CallbackGetter) {
  Nan::HandleScope scope;

  NUITextField *view = ObjectWrap::Unwrap<NUITextField>(info.This());

  info.GetReturnValue().Set(Nan::New(view->_callback));
}

NAN_SETTER(NUITextField::CallbackSetter) {
  Nan::HandleScope scope;

  NUITextField *field = ObjectWrap::Unwrap<NUITextField>(info.This());
  field->_callback->Reset(Local<Function>::Cast(value));
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UITextField* txt = field->As<UITextField>();
      [txt setTargetClosureWithClosure:^(UITextField*){
        sweetiekit::Resolve(field->_callback);
        return true;
      }];
    });
  }
}

NAN_GETTER(NUITextField::autocorrectionTypeGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITextField, ui);
  
  JS_SET_RETURN(JS_NUM([ui autocorrectionType]));
}

NAN_SETTER(NUITextField::autocorrectionTypeSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITextField, ui);
  
  UITextAutocorrectionType type = value->IsNumber() ? UITextAutocorrectionType(TO_INT32(value)) : UITextAutocorrectionTypeDefault;

  @autoreleasepool {
    [ui setAutocorrectionType:type];
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
