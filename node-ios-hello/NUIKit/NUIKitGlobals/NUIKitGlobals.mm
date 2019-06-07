//
//  UIKitGlobals.mm
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIKitGlobals.h"

NUIKitGlobals::NUIKitGlobals() {}
NUIKitGlobals::~NUIKitGlobals() {}

JS_INIT_CLASS(UIKitGlobals, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIKitGlobals, NSObject);
  JS_ASSIGN_METHOD(ctor, UIImageWriteToSavedPhotosAlbum);
  JS_ASSIGN_METHOD(ctor, UIImageOrientation);
  JS_ASSIGN_METHOD(ctor, UITextFieldViewMode);
JS_INIT_CLASS_END(UIKitGlobals, NSObject);

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

#include "NUIImage.h"

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

NAN_METHOD(NUIKitGlobals::UIImageOrientation) {
  Nan::HandleScope scope;

  Local<Object> result = Object::New(Isolate::GetCurrent());
  
  result->Set(JS_STR("up"), JS_NUM(UIImageOrientationUp));
  result->Set(JS_STR("down"), JS_NUM(UIImageOrientationDown));
  result->Set(JS_STR("left"), JS_NUM(UIImageOrientationLeft));
  result->Set(JS_STR("right"), JS_NUM(UIImageOrientationRight));
  result->Set(JS_STR("upMirrored"), JS_NUM(UIImageOrientationUpMirrored));
  result->Set(JS_STR("downMirrored"), JS_NUM(UIImageOrientationDownMirrored));
  result->Set(JS_STR("leftMirrored"), JS_NUM(UIImageOrientationLeftMirrored));
  result->Set(JS_STR("rightMirrored"), JS_NUM(UIImageOrientationRightMirrored));
  
  JS_SET_RETURN(result);
}

NAN_METHOD(NUIKitGlobals::UITextFieldViewMode) {
  Nan::HandleScope scope;

  Local<Object> result = Object::New(Isolate::GetCurrent());
  
  result->Set(JS_STR("never"), JS_NUM(UITextFieldViewModeNever));
  result->Set(JS_STR("whileEditing"), JS_NUM(UITextFieldViewModeWhileEditing));
  result->Set(JS_STR("unlessEditing"), JS_NUM(UITextFieldViewModeUnlessEditing));
  result->Set(JS_STR("always"), JS_NUM(UITextFieldViewModeAlways));
  
  JS_SET_RETURN(result);
}
