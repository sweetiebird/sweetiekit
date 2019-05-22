//
//  NUIView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NUIView.h"
#include "NUIButton.h"
#include "NUIResponder.h"
#include "NNSLayoutAnchor.h"
#include "NUIGestureRecognizer.h"

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
  JS_SET_PROP(proto, "frame", Frame);
  JS_SET_PROP(proto, "bounds", Bounds);
  JS_SET_PROP(proto, "origin", Origin);
  JS_SET_PROP(proto, "center", Center);
  JS_SET_PROP(proto, "size", Size);
  JS_SET_PROP(proto, "x", X);
  JS_SET_PROP(proto, "y", Y);
  JS_SET_PROP(proto, "width", Width);
  JS_SET_PROP(proto, "height", Height);
  JS_ASSIGN_PROP(proto, alpha);
  Nan::SetAccessor(proto, JS_STR("autoresizesSubviews"), AutoresizesSubviewsGetter, AutoresizesSubviewsSetter);
  Nan::SetAccessor(proto, JS_STR("subviews"), SubviewsGetter);
  Nan::SetAccessor(proto, JS_STR("layer"), LayerGetter);
  Nan::SetMethod(proto, "addSubview", AddSubview);
  Nan::SetMethod(proto, "sizeThatFits", SizeThatFits);
  Nan::SetMethod(proto, "sizeToFit", SizeToFit);
  Nan::SetAccessor(proto, JS_STR("backgroundColor"), BackgroundColorGetter, BackgroundColorSetter);
  Nan::SetMethod(proto, "viewWithStringTag", ViewWithStringTag);
  Nan::SetMethod(proto, "removeFromSuperview", RemoveFromSuperview);
  Nan::SetMethod(proto, "bringSubviewToFront", bringSubviewToFront);
  Nan::SetMethod(proto, "addGestureRecognizer", addGestureRecognizer);
  JS_SET_PROP(proto, "translatesAutoresizingMaskIntoConstraints", TranslatesAutoresizingMaskIntoConstraints);
  JS_SET_PROP_READONLY(proto, "leadingAnchor", LeadingAnchor);
  JS_SET_PROP_READONLY(proto, "trailingAnchor", TrailingAnchor);
  JS_SET_PROP_READONLY(proto, "topAnchor", TopAnchor);
  JS_SET_PROP_READONLY(proto, "bottomAnchor", BottomAnchor);
  JS_SET_PROP_READONLY(proto, "centerXAnchor", CenterXAnchor);
  JS_SET_PROP_READONLY(proto, "centerYAnchor", centerYAnchor);
  JS_SET_PROP_READONLY(proto, "widthAnchor", WidthAnchor);
  JS_ASSIGN_PROP_READONLY(proto, heightAnchor);
  JS_SET_PROP(proto, "isUserInteractionEnabled", UserInteractionEnabled);
  JS_ASSIGN_PROP(proto, viewDidAppear);
  JS_ASSIGN_PROP(proto, viewWillAppear);
  JS_ASSIGN_PROP(proto, viewDidDisappear);
  JS_ASSIGN_PROP(proto, viewWillDisappear);
  JS_ASSIGN_PROP(proto, drawRect);
  JS_ASSIGN_PROP(proto, contentMode);

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

NUIView::NUIView () {}
NUIView::~NUIView () {}

NAN_METHOD(NUIView::New) {
  Nan::HandleScope scope;

  Local<Object> viewObj = info.This();

  NUIView *view = new NUIView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          view->SetNSObject([[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)]);
      });
    }
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          view->SetNSObject([[UIView alloc] init]);
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
  origin->Set(JS_STR("x"), JS_NUM(x));
  origin->Set(JS_STR("y"), JS_NUM(y));
  size->Set(JS_STR("width"), JS_NUM(width));
  size->Set(JS_STR("height"), JS_NUM(height));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUIView::FrameSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
//  double width = TO_DOUBLE(JS_OBJ(JS_OBJ(value)->Get(JS_STR("size")))->Get(JS_STR("width")));
//  double height = TO_DOUBLE(JS_OBJ(JS_OBJ(value)->Get(JS_STR("size")))->Get(JS_STR("height")));
//  double x = TO_DOUBLE(JS_OBJ(JS_OBJ(value)->Get(JS_STR("origin")))->Get(JS_STR("x")));
//  double y = TO_DOUBLE(JS_OBJ(JS_OBJ(value)->Get(JS_STR("origin")))->Get(JS_STR("y")));

  @autoreleasepool {
      float width = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("width")));
      float height = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("height")));
      float x = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
      float y = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")));
      [view->As<UIView>() setFrame:CGRectMake(x, y, width, height)];
  }
}


NAN_GETTER(NUIView::BoundsGetter) {
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
  CGRect bounds(nui->GetBounds());
  double width = bounds.size.width;
  double height = bounds.size.height;
  double x = bounds.origin.x;
  double y = bounds.origin.y;
  origin->Set(JS_STR("x"), JS_NUM(x));
  origin->Set(JS_STR("y"), JS_NUM(y));
  size->Set(JS_STR("width"), JS_NUM(width));
  size->Set(JS_STR("height"), JS_NUM(height));

  JS_SET_RETURN(result);
}

NAN_SETTER(NUIView::BoundsSetter) {
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
      [view->As<UIView>() setBounds:CGRectMake(x, y, width, height)];
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
  JS_SET_RETURN(JS_NUM(view->GetBounds().size.width));
}

NAN_SETTER(NUIView::WidthSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  CGRect bounds(view->GetBounds());
  bounds.size.width = TO_DOUBLE(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setBounds:bounds];
    });
  }
}

NAN_GETTER(NUIView::HeightGetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());
  JS_SET_RETURN(JS_NUM(view->GetBounds().size.height));
}

NAN_SETTER(NUIView::HeightSetter) {
  Nan::HandleScope scope;

  NUIView *view = ObjectWrap::Unwrap<NUIView>(info.This());

  CGRect bounds(view->GetBounds());
  bounds.size.height = TO_DOUBLE(value);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UIView>() setBounds:bounds];
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

CGRect NUIView::GetBounds() {
  __block CGRect bounds = CGRectMake(0,0,0,0);
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      if (As<UIView>()) {
        bounds = [As<UIView>() bounds];
      }
    });
  }
  return bounds;
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

NAN_METHOD(NUIView::RemoveFromSuperview) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);

  [ui removeFromSuperview];
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
    JS_SET_RETURN(value);
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

NAN_GETTER(NUIView::LeadingAnchorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui leadingAnchor], NNSLayoutAnchor::type));
}

NAN_GETTER(NUIView::TrailingAnchorGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIView, ui);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui trailingAnchor], NNSLayoutAnchor::type));
}

NAN_GETTER(NUIView::TopAnchorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui topAnchor], NNSLayoutAnchor::type));
}

NAN_GETTER(NUIView::BottomAnchorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui bottomAnchor], NNSLayoutAnchor::type));
}

NAN_GETTER(NUIView::CenterXAnchorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui centerXAnchor], NNSLayoutAnchor::type));
}

NAN_GETTER(NUIView::centerYAnchorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui centerYAnchor], NNSLayoutAnchor::type));
}

NAN_GETTER(NUIView::WidthAnchorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui widthAnchor], NNSLayoutAnchor::type));
}

NAN_GETTER(NUIView::heightAnchorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui heightAnchor], NNSLayoutAnchor::type));
}

NAN_GETTER(NUIView::UserInteractionEnabledGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);

  JS_SET_RETURN(JS_BOOL([ui isUserInteractionEnabled]));
}

NAN_SETTER(NUIView::UserInteractionEnabledSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);
  
  [ui setUserInteractionEnabled:TO_BOOL(value)];
}

NAN_METHOD(NUIView::bringSubviewToFront) {
  NUIView *view = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(info.This()));
  Local<Object> obj = JS_OBJ(info[0]);
  if (obj->InstanceOf(JS_CONTEXT(), JS_TYPE(NUIView)).FromJust()) {
    NUIView *subview = ObjectWrap::Unwrap<NUIView>(obj);
    @autoreleasepool {
      [view->As<UIView>() bringSubviewToFront:subview->As<UIView>()];
    }
  } else {
    Nan::ThrowError("Unknown addSubview type");
  }
}

NAN_GETTER(NUIView::alphaGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);
  
  JS_SET_RETURN(JS_NUM([ui alpha]));
}

NAN_SETTER(NUIView::alphaSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);

  @autoreleasepool {
    double alpha = TO_DOUBLE(value);
    [ui setAlpha:alpha];
  }
}

NAN_GETTER(NUIView::contentModeGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);
  
  JS_SET_RETURN(JS_NUM([ui contentMode]));
}

NAN_SETTER(NUIView::contentModeSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIView, ui);

  @autoreleasepool {
    UIViewContentMode mode = UIViewContentMode(TO_INT32(value));
    [ui setContentMode:mode];
  }
}

NAN_GETTER(NUIView::viewDidAppearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewDidAppear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIView::viewDidAppearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewDidAppear"];
  }
}

NAN_GETTER(NUIView::viewWillAppearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewWillAppear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIView::viewWillAppearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewWillAppear"];
  }
}

NAN_GETTER(NUIView::viewDidDisappearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewDidDisappear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIView::viewDidDisappearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewDidDisappear"];
  }
}

NAN_GETTER(NUIView::viewWillDisappearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewWillDisappear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIView::viewWillDisappearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewWillDisappear"];
  }
}

NAN_GETTER(NUIView::drawRectGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_drawRect"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIView::drawRectSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_drawRect"];
  }
}

NAN_METHOD(NUIView::addGestureRecognizer) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIView, ui);
  
  Local<Object> obj = JS_OBJ(info[0]);
  NUIGestureRecognizer *gest = ObjectWrap::Unwrap<NUIGestureRecognizer>(obj);
}
