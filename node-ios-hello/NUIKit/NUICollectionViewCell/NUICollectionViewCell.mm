//
//  NUICollectionViewCell.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUICollectionViewCell.h"

Nan::Persistent<FunctionTemplate> NUICollectionViewCell::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUICollectionViewCell::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UICollectionViewCell"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUICollectionViewCell::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUICollectionViewCell *view = new NUICollectionViewCell();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UICollectionViewCell *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));

    @autoreleasepool {
      CGRect frame = CGRectMake(x, y, width, height);
      view->SetNSObject([[UICollectionViewCell alloc] initWithFrame:frame]);
    }
  } else {
    @autoreleasepool {
      view->SetNSObject([[UICollectionViewCell alloc] init]);
    }
  }
  view->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUICollectionViewCell::NUICollectionViewCell () {}
NUICollectionViewCell::~NUICollectionViewCell () {}
