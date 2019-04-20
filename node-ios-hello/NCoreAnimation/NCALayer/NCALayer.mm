//
//  NCALayer.m
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "NCALayer.h"
#include "ColorHelper.h"

Nan::Persistent<FunctionTemplate> NCALayer::type;

NCALayer::NCALayer () {}
NCALayer::~NCALayer () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NCALayer::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CALayer"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "cornerRadius", CornerRadius);
  JS_SET_PROP(proto, "borderWidth", BorderWidth);
  JS_SET_PROP(proto, "borderColor", BorderColor);
  JS_SET_PROP(proto, "shadowOffset", ShadowOffset);
  JS_SET_PROP(proto, "shadowColor", ShadowColor);
  JS_SET_PROP(proto, "shadowRadius", ShadowRadius);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCALayer::New) {
  Nan::HandleScope scope;

  Local<Object> viewObj = info.This();

  NCALayer *view = new NCALayer();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge CALayer *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("NCALayer::New must receive a CALayer");
  }
  view->Wrap(viewObj);

  JS_SET_RETURN(viewObj);
}

NAN_GETTER(NCALayer::CornerRadiusGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  __block CGFloat theCornerRadius = 0.0;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      theCornerRadius = [ui cornerRadius];
    });
  }
  
  JS_SET_RETURN(JS_FLOAT(theCornerRadius));
}

NAN_SETTER(NCALayer::CornerRadiusSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  if (value->IsNumber()) {
    CGFloat theCornerRadius = TO_FLOAT(value);
    
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        [ui setCornerRadius:theCornerRadius];
      });
    }
  } else {
    iOSLog0("NCALayer::CornerRadiusSetter: value is not a number");
  }
}

NAN_GETTER(NCALayer::BorderColorGetter) {
  NCALayer *view = ObjectWrap::Unwrap<NCALayer>(Local<Object>::Cast(info.This()));
  
  __block CGFloat red = 0;
  __block CGFloat green = 0;
  __block CGFloat blue = 0;
  __block CGFloat alpha = 1;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(),  ^ {
      UIColor* color = [ColorHelper CGColorToUIColor:[view->As<CALayer>() borderColor]];
      [color getRed:&red green:&green blue:&blue alpha:&alpha];
    });
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NCALayer::BorderColorSetter) {
  NCALayer *view = ObjectWrap::Unwrap<NCALayer>(Local<Object>::Cast(info.This()));

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<CALayer>() setBorderColor:color.CGColor];
    });
  }
}

NAN_GETTER(NCALayer::BorderWidthGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  __block CGFloat theBorderWidth = 0.0;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      theBorderWidth = [ui borderWidth];
    });
  }
  
  JS_SET_RETURN(JS_FLOAT(theBorderWidth));
}

NAN_SETTER(NCALayer::BorderWidthSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  if (value->IsNumber()) {
    CGFloat theBorderWidth = TO_FLOAT(value);
    
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        [ui setBorderWidth:theBorderWidth];
      });
    }
  } else {
    iOSLog0("NCALayer::BorderWidthSetter: value is not a number");
  }
}

static bool JS_IsCGSize(Local<Object> value) {
  if (!value->IsObject()) {
    return false;
  }
  if (!JS_HAS(value, JS_STR("width"))) {
    return false;
  }
  if (!JS_HAS(value, JS_STR("height"))) {
    return false;
  }
  return true;
}

NAN_GETTER(NCALayer::ShadowColorGetter) {
  NCALayer *view = ObjectWrap::Unwrap<NCALayer>(Local<Object>::Cast(info.This()));
  
  __block CGFloat red = 0;
  __block CGFloat green = 0;
  __block CGFloat blue = 0;
  __block CGFloat alpha = 1;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(),  ^ {
      UIColor* color = [ColorHelper CGColorToUIColor:[view->As<CALayer>() shadowColor]];
      [color getRed:&red green:&green blue:&blue alpha:&alpha];
    });
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NCALayer::ShadowColorSetter) {
  NCALayer *view = ObjectWrap::Unwrap<NCALayer>(Local<Object>::Cast(info.This()));

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<CALayer>() setShadowColor:color.CGColor];
    });
  }
}

NAN_GETTER(NCALayer::ShadowOffsetGetter) {
  NCALayer *view = ObjectWrap::Unwrap<NCALayer>(Local<Object>::Cast(info.This()));
  
  __block CGSize offset;
  offset.width = 0.0;
  offset.height = 0.0;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(),  ^ {
      offset = [view->As<CALayer>() shadowOffset];
    });
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_NUM(offset.width));
  result->Set(JS_STR("height"), JS_NUM(offset.height));

  JS_SET_RETURN(result);
}

NAN_SETTER(NCALayer::ShadowOffsetSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  if (JS_IsCGSize(JS_OBJ(value))) {
    CGSize theShadowOffset;
    theShadowOffset.width = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("width")));
    theShadowOffset.height = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("height")));
    
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        [ui setShadowOffset:theShadowOffset];
      });
    }
  } else {
    iOSLog0("NCALayer::ShadowOffsetSetter: value is not a CGSize");
  }
}

NAN_GETTER(NCALayer::ShadowRadiusGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  __block CGFloat theShadowRadius = 0.0;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      theShadowRadius = [ui shadowRadius];
    });
  }
  
  JS_SET_RETURN(JS_FLOAT(theShadowRadius));
}

NAN_SETTER(NCALayer::ShadowRadiusSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  if (value->IsNumber()) {
    CGFloat theShadowRadius = TO_FLOAT(value);
    
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        [ui setShadowRadius:theShadowRadius];
      });
    }
  } else {
    iOSLog0("NCALayer::ShadowRadiusSetter: value is not a number");
  }
}
