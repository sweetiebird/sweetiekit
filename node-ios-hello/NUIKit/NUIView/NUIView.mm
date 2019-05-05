//
//  NUIView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NUIView.h"
#include "NUIButton.h"
#include "NUIResponder.h"

Nan::Persistent<FunctionTemplate> NUIView::type;
CGSize NUIView::tmp_Size;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIView::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIResponder::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("frame"), FrameGetter, FrameSetter);
  Nan::SetAccessor(proto, JS_STR("origin"), OriginGetter, OriginSetter);
  Nan::SetAccessor(proto, JS_STR("center"), CenterGetter, CenterSetter);
  Nan::SetAccessor(proto, JS_STR("size"), SizeGetter, SizeSetter);
  Nan::SetAccessor(proto, JS_STR("x"), XGetter, XSetter);
  Nan::SetAccessor(proto, JS_STR("y"), YGetter, YSetter);
  Nan::SetAccessor(proto, JS_STR("width"), WidthGetter, WidthSetter);
  Nan::SetAccessor(proto, JS_STR("height"), HeightGetter, HeightSetter);
  Nan::SetAccessor(proto, JS_STR("autoresizesSubviews"), AutoresizesSubviewsGetter, AutoresizesSubviewsSetter);
  Nan::SetAccessor(proto, JS_STR("subviews"), SubviewsGetter);
  Nan::SetAccessor(proto, JS_STR("layer"), LayerGetter);
  Nan::SetMethod(proto, "addSubview", AddSubview);
  Nan::SetMethod(proto, "sizeThatFits", SizeThatFits);
  Nan::SetMethod(proto, "sizeToFit", SizeToFit);
  Nan::SetAccessor(proto, JS_STR("backgroundColor"), BackgroundColorGetter, BackgroundColorSetter);
  Nan::SetMethod(proto, "viewWithStringTag", ViewWithStringTag);
  JS_SET_PROP(proto, "translatesAutoresizingMaskIntoConstraints", TranslatesAutoresizingMaskIntoConstraints);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  sweetiekit::Set(ctorFn, "beginAnimations", ^(JSInfo info) {
    [UIView beginAnimations:NJSStringToNSString(info[0]) context:nullptr];
  });
  sweetiekit::Set(ctorFn, "setAnimationDuration", ^(JSInfo info) {
    if (!info[0]->IsNumber()) {
      Nan::ThrowTypeError("setAnimationDuration: Expected a number");
    } else {
      [UIView setAnimationDuration:TO_DOUBLE(info[0])];
    }
  });
  sweetiekit::Set(ctorFn, "setAnimationBeginsFromCurrentState", ^(JSInfo info) {
    if (!info[0]->IsBoolean()) {
      Nan::ThrowTypeError("setAnimationBeginsFromCurrentState: Expected a boolean");
    } else {
      [UIView setAnimationBeginsFromCurrentState:TO_BOOL(info[0])];
    }
  });
  sweetiekit::Set(ctorFn, "commitAnimations", ^(JSInfo info) {
    [UIView commitAnimations];
  });
  sweetiekit::Set(ctorFn, "animate", ^(JSInfo info) {
    Isolate* isolate = info.GetIsolate();
    Nan::HandleScope handleScope;
    NSTimeInterval duration = info[0]->IsNumber() ? TO_DOUBLE(info[0]) : 0.0;
    NSTimeInterval delay = info[1]->IsNumber() ? TO_DOUBLE(info[1]) : 0.0;
    auto options = info[2]; // TODO
    __block sweetiekit::JSFunction animations(info[3]);
    __block sweetiekit::JSFunction completion(info[4]);
    
    @autoreleasepool {
      [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        Nan::HandleScope handleScope;
        animations("UIView:animateWithDuration:animations");
      } completion:^(BOOL finished) {
        Nan::HandleScope handleScope;
        completion("UIView:animateWithDuration:animations", JS_BOOL(finished));
      }];
    }
  });

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIView::New) {
  Nan::HandleScope scope;

  Local<Object> viewObj = info.This();

  NUIView *view = new NUIView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIView *)(info[0].As<External>()->Value()));
  } else {
      double x = TO_DOUBLE(info[0]);
      double y = TO_DOUBLE(info[1]);
      double width = TO_DOUBLE(info[2]);
      double height = TO_DOUBLE(info[3]);

      @autoreleasepool {
        dispatch_sync(dispatch_get_main_queue(), ^ {
            view->SetNSObject([[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)]);
        });
      }
  }
  view->Wrap(viewObj);
  
  JS_SET_RETURN(viewObj);
}

NAN_GETTER(NUIView::FrameGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);
  Local<Object> result = Object::New(Isolate::GetCurrent());
#if 1
  Local<Object> origin = result;
  Local<Object> size = result;
#else
  Local<Object> origin = Object::New(Isolate::GetCurrent());
  Local<Object> size = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("origin"), JS_OBJ(origin));
  result->Set(JS_STR("size"), JS_OBJ(size));
#endif
  CGRect frame(nui->GetFrame());
  double width = frame.size.width;
  double height = frame.size.height;
  double x = frame.origin.x;
  double y = frame.origin.y;
  origin->Set(JS_STR("x"), JS_FLOAT(x));
  origin->Set(JS_STR("y"), JS_FLOAT(y));
  size->Set(JS_STR("width"), JS_FLOAT(width));
  size->Set(JS_STR("height"), JS_FLOAT(height));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUIView::FrameSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  double width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
  double height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
  double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
  double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));
//  double width = TO_DOUBLE(JS_OBJ(JS_OBJ(value)->Get(JS_STR("size")))->Get(JS_STR("width")));
//  double height = TO_DOUBLE(JS_OBJ(JS_OBJ(value)->Get(JS_STR("size")))->Get(JS_STR("height")));
//  double x = TO_DOUBLE(JS_OBJ(JS_OBJ(value)->Get(JS_STR("origin")))->Get(JS_STR("x")));
//  double y = TO_DOUBLE(JS_OBJ(JS_OBJ(value)->Get(JS_STR("origin")))->Get(JS_STR("y")));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setFrame:CGRectMake(x, y, width, height)];
    });
  }
}

NAN_GETTER(NUIView::OriginGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_FLOAT(view->GetFrame().origin.x));
  result->Set(JS_STR("y"), JS_FLOAT(view->GetFrame().origin.y));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUIView::OriginSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  CGRect frame(view->GetFrame());
  frame.origin.x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
  frame.origin.y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setFrame:frame];
    });
  }
}

NAN_GETTER(NUIView::CenterGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  Local<Object> result = Object::New(Isolate::GetCurrent());
  CGRect frame(view->GetFrame());
  result->Set(JS_STR("x"), JS_FLOAT(frame.origin.x + frame.size.width/2));
  result->Set(JS_STR("y"), JS_FLOAT(frame.origin.y + frame.size.height/2));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUIView::CenterSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  CGRect frame(view->GetFrame());
  double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
  double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));
  double dx = x - (frame.origin.x + frame.size.width/2);
  double dy = y - (frame.origin.y + frame.size.height/2);
  frame.origin.x += dx;
  frame.origin.y += dy;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setFrame:frame];
    });
  }
}

NAN_GETTER(NUIView::SizeGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
   Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_FLOAT(view->GetFrame().size.width));
  result->Set(JS_STR("height"), JS_FLOAT(view->GetFrame().size.height));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUIView::SizeSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  CGRect frame(view->GetFrame());
  frame.size.width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
  frame.size.height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setFrame:frame];
    });
  }
}

NAN_GETTER(NUIView::XGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  JS_SET_RETURN(JS_NUM(view->GetFrame().origin.x));
}

NAN_SETTER(NUIView::XSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  CGRect frame(view->GetFrame());
  frame.origin.x = TO_DOUBLE(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setFrame:frame];
    });
  }
}

NAN_GETTER(NUIView::YGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  JS_SET_RETURN(JS_NUM(view->GetFrame().origin.y));
}

NAN_SETTER(NUIView::YSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  CGRect frame(view->GetFrame());
  frame.origin.y = TO_DOUBLE(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setFrame:frame];
    });
  }
}

NAN_GETTER(NUIView::WidthGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  JS_SET_RETURN(JS_NUM(view->GetFrame().size.width));
}

NAN_SETTER(NUIView::WidthSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  CGRect frame(view->GetFrame());
  frame.size.width = TO_DOUBLE(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setFrame:frame];
    });
  }
}

NAN_GETTER(NUIView::HeightGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  JS_SET_RETURN(JS_NUM(view->GetFrame().size.height));
}

NAN_SETTER(NUIView::HeightSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  CGRect frame(view->GetFrame());
  frame.size.height = TO_DOUBLE(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setFrame:frame];
    });
  }
}

NAN_GETTER(NUIView::AutoresizesSubviewsGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  JS_SET_RETURN(JS_BOOL([view->As<UIView>() autoresizesSubviews]));
}

NAN_SETTER(NUIView::AutoresizesSubviewsSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  
  [view->As<UIView>() setAutoresizesSubviews:TO_BOOL(value)];
}

NAN_GETTER(NUIView::SubviewsGetter) {
  Nan::HandleScope scope;

  NUIView* view = ObjectWrap::Unwrap<NUIView>(info.This());
  UIView* pView = view->As<UIView>();
  __block NSArray* subviews = nullptr;
  __block NSInteger count = 0;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      subviews = [pView subviews];
      count = [subviews count];
    });
  }
  
  auto result = Nan::New<Array>();

  for (NSInteger i = 0; i < count; i++) {
    UIView* pSubview = [subviews objectAtIndex:i];
    if (pSubview != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)pSubview)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(pSubview, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      Nan::Set(result, static_cast<uint32_t>(i), value);
    }
  }

  JS_SET_RETURN(result);
}


CGRect NUIView::GetFrame() {
  __block CGRect frame = CGRectMake(0,0,0,0);
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      if (As<UIView>()) {
        frame = [As<UIView>() frame];
      }
    });
  }
  return frame;
}

NAN_METHOD(NUIView::SizeThatFits) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  
  tmp_Size.width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
  tmp_Size.height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      CGSize size = [view->As<UIView>() sizeThatFits:tmp_Size];
      tmp_Size.width = size.width;
      tmp_Size.height = size.height;
    });
  }

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_FLOAT(tmp_Size.width));
  result->Set(JS_STR("height"), JS_FLOAT(tmp_Size.height));

  JS_SET_RETURN(result);
}

NAN_METHOD(NUIView::SizeToFit) {
  NUIView *view = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(info.This()));
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() sizeToFit];
    });
  }
}

NAN_GETTER(NUIView::BackgroundColorGetter) {
  NUIView *view = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(info.This()));
  
  __block CGFloat red = 0;
  __block CGFloat green = 0;
  __block CGFloat blue = 0;
  __block CGFloat alpha = 1;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(),  ^ {
      UIColor* color = [view->As<UIView>() backgroundColor];
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

NAN_SETTER(NUIView::BackgroundColorSetter) {
  NUIView *view = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(info.This()));

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setBackgroundColor:color];
    });
  }
}

NAN_METHOD(NUIView::AddSubview) {
  NUIView *view = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(info.This()));
  Local<Object> obj = JS_OBJ(info[0]);
  if (obj->InstanceOf(JS_CONTEXT(), JS_TYPE(NUIView)).FromJust()) {
    NUIView *subview = ObjectWrap::Unwrap<NUIView>(obj);

    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        [view->As<UIView>() addSubview:subview->As<UIView>()];
      });
    }
  } else {
    Nan::ThrowError("Unknown addSubview type");
  }
}

NAN_METHOD(NUIView::ViewWithStringTag) {
  NUIView *view = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(info.This()));

  std::string key;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    key = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  __block UIView* obj = nullptr;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      obj = [view->As<UIView>() viewWithStringTagWithStrTag:[NSString stringWithUTF8String:key.c_str()]];
    });
  }
  if (obj != nullptr) {
    Local<Value> argv[] = {
      Nan::New<v8::External>((__bridge void*)obj)
    };
    Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(obj, NNSObject::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
    JS_SET_RETURN(value);
  }
}

NAN_GETTER(NUIView::LayerGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIView, ui);
  __block CALayer* theLayer = nullptr;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      theLayer = [ui layer];
    });
  }
  
  if (theLayer != nullptr) {
    Local<Value> argv[] = {
      Nan::New<v8::External>((__bridge void*)theLayer)
    };
    Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(theLayer, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
    JS_SET_RETURN(JS_OBJ(value));
  }
}

NAN_GETTER(NUIView::TranslatesAutoresizingMaskIntoConstraintsGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  JS_SET_RETURN(JS_BOOL([view->As<UIView>() translatesAutoresizingMaskIntoConstraints]));
}

NAN_SETTER(NUIView::TranslatesAutoresizingMaskIntoConstraintsSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  
  [view->As<UIView>() setTranslatesAutoresizingMaskIntoConstraints:TO_BOOL(value)];
}

NUIView::NUIView () {}
NUIView::~NUIView () {}

