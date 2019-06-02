//
//  NUILabel.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUILabel.h"
#include "NUIView.h"
#include "NUIFont.h"
#include "NNSAttributedString.h"

Nan::Persistent<FunctionTemplate> NUILabel::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUILabel::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UILabel"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("text"), TextGetter, TextSetter);
  JS_SET_PROP(proto, "numberOfLines", NumberOfLines);
  JS_SET_PROP(proto, "font", Font);
  JS_SET_PROP(proto, "textColor", TextColor);
  JS_SET_PROP(proto, "highlightedTextColor", HighlightedTextColor);
  JS_SET_PROP(proto, "isHighlighted", IsHighlighted);
  JS_ASSIGN_PROP(proto, textAlignment);
  JS_ASSIGN_PROP(proto, attributedText);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "alloc", Alloc);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}



NAN_METHOD(NUILabel::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `UILabel(...)`, turn into construct call.
      JS_SET_RETURN_NEW(UILabel, info);
      return;
    }
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

/*
NAN_METHOD(NUILabel::New) {
  Nan::HandleScope scope;

  Local<Object> txtObj = info.This();

  NUILabel *txt = new NUILabel();
  
  if (info[0]->IsExternal()) {
    txt->SetNSObject((__bridge UILabel *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      txt->SetNSObject([[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)]);
    }
  } else {
    @autoreleasepool {
      txt->SetNSObject([[UILabel alloc] init]);
    }
  }
  txt->Wrap(txtObj);

  info.GetReturnValue().Set(txtObj);
}
*/

NUILabel::NUILabel () {}
NUILabel::~NUILabel () {}

NAN_METHOD(NUILabel::Alloc) {
  Nan::EscapableHandleScope scope;
  //auto resolver = Promise::Resolver::New(JS_CONTEXT()).ToLocalChecked();
  
  Local<Value> argv[] = {
  };
  Local<Object> tfObj = JS_TYPE(NUILabel)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUILabel *field = ObjectWrap::Unwrap<NUILabel>(tfObj);

  double x = info[0]->IsNumber() ? TO_DOUBLE(info[0]) : 0.0;
  double y = info[1]->IsNumber() ? TO_DOUBLE(info[1]) : 0.0;
  double width = info[2]->IsNumber() ? TO_DOUBLE(info[2]) : 0.0;
  double height = info[3]->IsNumber() ? TO_DOUBLE(info[3]) : 0.0;

  //Nan::Persistent<Function>* cb = new Nan::Persistent<Function>(Local<Function>::Cast(info[4]));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UIFont * customFont = [UIFont systemFontOfSize:15]; //custom font

      UILabel* fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
      field->SetNSObject(fromLabel);
      fromLabel.text = @"";
      fromLabel.font = customFont;
      fromLabel.numberOfLines = 1;
      fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
      fromLabel.adjustsFontSizeToFitWidth = YES;
      //fromLabel.adjustsLetterSpacingToFitWidth = YES;
      fromLabel.lineBreakMode = NSLineBreakByWordWrapping;
      fromLabel.minimumScaleFactor = 10.0f/12.0f;
      fromLabel.clipsToBounds = YES;
      fromLabel.backgroundColor = [UIColor clearColor];
      fromLabel.textColor = [UIColor blackColor];
      fromLabel.textAlignment = NSTextAlignmentLeft;
      /*
      [txt setPlaceholder:@"Enter text here"];
      [txt setBorderStyle:UITextBorderStyleRoundedRect];
      [txt setAutocorrectionType:UITextAutocorrectionTypeNo];
      [txt setKeyboardType:UIKeyboardTypeDefault];
      [txt setReturnKeyType:UIReturnKeyDone];
      [txt setClearButtonMode:UILabelViewModeWhileEditing];
      [txt setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
      [txt setTargetClosureWithClosure:^(UILabel*){
        sweetiekit::Resolve(cb);
        return true;
      }];*/
    });
  }

  info.GetReturnValue().Set(tfObj);
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

