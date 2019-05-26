//
//  UIKitGlobals.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NUIKitGlobals.h"
#include "NUIImage.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIKitGlobals::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIKitGlobals::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIKitGlobals"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "UIImageWriteToSavedPhotosAlbum", UIImageWriteToSavedPhotosAlbum);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIKitGlobals::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIKitGlobals *ui = new NUIKitGlobals();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SUIKitGlobals *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([SUIKitGlobals shared]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIKitGlobals::NUIKitGlobals () {}
NUIKitGlobals::~NUIKitGlobals () {}

NAN_METHOD(NUIKitGlobals::UIImageWriteToSavedPhotosAlbum) {
  Nan::HandleScope scope;

  auto img = ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(info[0]))->As<UIImage>();
  
  __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[1]);
  __block SUITargetUIImageWriteToSavedPhotosAlbum* target = [[SUITargetUIImageWriteToSavedPhotosAlbum alloc] init];

  [target setCallbackClosure:^(UIImage * _Nonnull image, NSError * _Nullable error, void * _Nullable context) {
    Nan::HandleScope scope;
    (*fn)("NUIKitGlobals::UIImageWriteToSavedPhotosAlbum",
            sweetiekit::GetWrapperFor(image, NUIImage::type),
            sweetiekit::GetWrapperFor(error));
    [[SUIKitGlobals shared] dissociateValueForKey:@"sweetiekit.uikitglobals.uiimagewritetosavedphotosalbum"];
    target = nullptr;
  }];

  [target setDeinitClosure:^() {
    Nan::HandleScope scope;
    delete fn; fn = nullptr; target = nullptr;
    iOSLog0("fn deleted");
  }];

  [[SUIKitGlobals shared] associateValue:target withKey:@"sweetiekit.uikitglobals.uiimagewritetosavedphotosalbum"];

  [SUIKitGlobals uiImageWriteToSavedPhotosAlbumWithImage:img target:target selector:[target callbackSelector] contextInfo:nullptr];
}
