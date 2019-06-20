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
  JS_ASSIGN_STATIC_METHOD(UIImageWriteToSavedPhotosAlbum);
  JS_ASSIGN_STATIC_PROP_READONLY(UIImageOrientation);
  JS_ASSIGN_STATIC_PROP_READONLY(UITextFieldViewMode);
  JS_ASSIGN_STATIC_PROP_READONLY(UIControlEvents);
  JS_ASSIGN_STATIC_PROP_READONLY(UIControlState);
JS_INIT_CLASS_END(UIKitGlobals, NSObject);

NAN_METHOD(NUIKitGlobals::New) {
  JS_RECONSTRUCT(UIKitGlobals);

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
#include "NNSError.h"

NAN_METHOD(NUIKitGlobals::UIImageWriteToSavedPhotosAlbum) {
  Nan::HandleScope scope;

  auto img = ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(info[0]))->As<UIImage>();
  
  __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[1]);
  __block SUITargetUIImageWriteToSavedPhotosAlbum* target = [[SUITargetUIImageWriteToSavedPhotosAlbum alloc] init];

  [target setCallbackClosure:^(UIImage * _Nonnull image, NSError * _Nullable error, void * _Nullable context) {
    Nan::HandleScope scope;
    (*fn)("NUIKitGlobals::UIImageWriteToSavedPhotosAlbum",
      js_value_UIImage(image),
      js_value_NSError(error));
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

NAN_GETTER(NUIKitGlobals::UIImageOrientationGetter) {
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

NAN_GETTER(NUIKitGlobals::UITextFieldViewModeGetter) {
  Nan::HandleScope scope;

  Local<Object> result = Object::New(Isolate::GetCurrent());
  
  result->Set(JS_STR("never"), JS_NUM(UITextFieldViewModeNever));
  result->Set(JS_STR("whileEditing"), JS_NUM(UITextFieldViewModeWhileEditing));
  result->Set(JS_STR("unlessEditing"), JS_NUM(UITextFieldViewModeUnlessEditing));
  result->Set(JS_STR("always"), JS_NUM(UITextFieldViewModeAlways));
  
  JS_SET_RETURN(result);
}

NAN_GETTER(NUIKitGlobals::UIControlEventsGetter) {
  Nan::HandleScope scope;

  Local<Object> result = Object::New(Isolate::GetCurrent());
  
  result->Set(JS_STR("touchDown"), js_value_NSUInteger(UIControlEventTouchDown));
  result->Set(JS_STR("touchDownRepeat"), js_value_NSUInteger(UIControlEventTouchDownRepeat));
  result->Set(JS_STR("touchDragInside"), js_value_NSUInteger(UIControlEventTouchDragInside));
  result->Set(JS_STR("touchDragOutside"), js_value_NSUInteger(UIControlEventTouchDragOutside));
  result->Set(JS_STR("touchDragEnter"), js_value_NSUInteger(UIControlEventTouchDragEnter));
  result->Set(JS_STR("touchDragExit"), js_value_NSUInteger(UIControlEventTouchDragExit));
  result->Set(JS_STR("touchUpInside"), js_value_NSUInteger(UIControlEventTouchUpInside));
  result->Set(JS_STR("touchUpOutside"), js_value_NSUInteger(UIControlEventTouchUpOutside));
  result->Set(JS_STR("touchCancel"), js_value_NSUInteger(UIControlEventTouchCancel));
  result->Set(JS_STR("valueChanged"), js_value_NSUInteger(UIControlEventValueChanged));
  result->Set(JS_STR("primaryActionTriggered"), js_value_NSUInteger(UIControlEventPrimaryActionTriggered));
  result->Set(JS_STR("editingDidBegin"), js_value_NSUInteger(UIControlEventEditingDidBegin));
  result->Set(JS_STR("editingChanged"), js_value_NSUInteger(UIControlEventEditingChanged));
  result->Set(JS_STR("editingDidEnd"), js_value_NSUInteger(UIControlEventEditingDidEnd));
  result->Set(JS_STR("editingDidEndOnExit"), js_value_NSUInteger(UIControlEventEditingDidEndOnExit));

  JS_SET_RETURN(result);
}

NAN_GETTER(NUIKitGlobals::UIControlStateGetter) {
  Nan::HandleScope scope;

  Local<Object> result = Object::New(Isolate::GetCurrent());
  
  result->Set(JS_STR("normal"), js_value_NSUInteger(UIControlStateNormal));
  result->Set(JS_STR("highlighted"), js_value_NSUInteger(UIControlStateHighlighted));
  result->Set(JS_STR("disabled"), js_value_NSUInteger(UIControlStateDisabled));
  result->Set(JS_STR("selected"), js_value_NSUInteger(UIControlStateSelected));
  result->Set(JS_STR("focused"), js_value_NSUInteger(UIControlStateFocused));
  result->Set(JS_STR("application"), js_value_NSUInteger(UIControlStateApplication));

  JS_SET_RETURN(result);
}
