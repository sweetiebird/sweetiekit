//
//  NUICollectionView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUICollectionView.h"
#include "NUIScrollView.h"
#include "NUITableViewDataSource.h"
#include "NUINib.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUICollectionView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUICollectionView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIScrollView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UICollectionView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "backgroundView", BackgroundView);
  Nan::SetMethod(proto, "registerNibForCellWithReuseIdentifier", RegisterNibForCellWithReuseIdentifier);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUICollectionView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUICollectionView *view = new NUICollectionView();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UICollectionView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      dispatch_sync(dispatch_get_main_queue(), ^ {
          view->SetNSObject([[UICollectionView alloc] initWithFrame:frame]);
      });
    }
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        view->SetNSObject([[UICollectionView alloc] init]);
      });
    }
  }
  view->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NUICollectionView::NUICollectionView () {}
NUICollectionView::~NUICollectionView () {}

NAN_METHOD(NUICollectionView::RegisterNibForCellWithReuseIdentifier) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionView, ui);

  NUINib *nibObj = ObjectWrap::Unwrap<NUINib>(Local<Object>::Cast(info[0]));
  
  std::string identifier;
  if (info[1]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[1]));
    identifier = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }

  @autoreleasepool {
    NSString *reuseIdentifier = [NSString stringWithUTF8String:identifier.c_str()];
    [ui registerNib:nibObj->As<UINib>() forCellWithReuseIdentifier:reuseIdentifier];
  }
}

NAN_GETTER(NUICollectionView::BackgroundViewGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionView, ui);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui backgroundView], NUIView::type)));
}

NAN_SETTER(NUICollectionView::BackgroundViewSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionView, ui);

  NUIView *bgViewObj = ObjectWrap::Unwrap<NUIView>(Local<Object>::Cast(value));

  @autoreleasepool {
    [ui setBackgroundView:bgViewObj->As<UIView>()];
  }
}

