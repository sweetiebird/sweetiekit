//
//  UITapGestureRecognizer.mm
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITapGestureRecognizer.h"

#define JS_INIT_DEFAULT(name) \
  N##name::N##name() {} \
  N##name::~N##name() {}

JS_INIT_DEFAULT(UITapGestureRecognizer);
JS_INIT_CLASS(UITapGestureRecognizer, UIGestureRecognizer);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITapGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UITapGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUITapGestureRecognizer::New) {
  JS_RECONSTRUCT(UITapGestureRecognizer);

  Local<Object> obj = info.This();

  NUITapGestureRecognizer *ui = new NUITapGestureRecognizer();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UITapGestureRecognizer *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UITapGestureRecognizer alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}
  
JS_INIT_DEFAULT(UIPinchGestureRecognizer);
JS_INIT_CLASS(UIPinchGestureRecognizer, UIGestureRecognizer);
  JS_INIT_CTOR(UIPinchGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UIPinchGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUIPinchGestureRecognizer::New) {
  JS_RECONSTRUCT(UIPinchGestureRecognizer);
  @autoreleasepool {
    UIPinchGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIPinchGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [UIPinchGestureRecognizer alloc];
    }
    if (self) {
      NUIPinchGestureRecognizer *wrapper = new NUIPinchGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPinchGestureRecognizer::New: invalid arguments");
    }
  }
}

JS_INIT_DEFAULT(UIRotationGestureRecognizer);
JS_INIT_CLASS(UIRotationGestureRecognizer, UIGestureRecognizer);
  JS_INIT_CTOR(UIRotationGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UIRotationGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUIRotationGestureRecognizer::New) {
  JS_RECONSTRUCT(UIRotationGestureRecognizer);
  @autoreleasepool {
    UIRotationGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIRotationGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [UIRotationGestureRecognizer alloc];
    }
    if (self) {
      NUIRotationGestureRecognizer *wrapper = new NUIRotationGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIRotationGestureRecognizer::New: invalid arguments");
    }
  }
}

JS_INIT_DEFAULT(UISwipeGestureRecognizer);
JS_INIT_CLASS(UISwipeGestureRecognizer, UIGestureRecognizer);
  JS_INIT_CTOR(UISwipeGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UISwipeGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUISwipeGestureRecognizer::New) {
  JS_RECONSTRUCT(UISwipeGestureRecognizer);
  @autoreleasepool {
    UISwipeGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UISwipeGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [UISwipeGestureRecognizer alloc];
    }
    if (self) {
      NUISwipeGestureRecognizer *wrapper = new NUISwipeGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UISwipeGestureRecognizer::New: invalid arguments");
    }
  }
}

JS_INIT_DEFAULT(UIPanGestureRecognizer);
JS_INIT_CLASS(UIPanGestureRecognizer, UIGestureRecognizer);
  JS_INIT_CTOR(UIPanGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UIPanGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUIPanGestureRecognizer::New) {
  JS_RECONSTRUCT(UIPanGestureRecognizer);
  @autoreleasepool {
    UIPanGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIPanGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [UIPanGestureRecognizer alloc];
    }
    if (self) {
      NUIPanGestureRecognizer *wrapper = new NUIPanGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPanGestureRecognizer::New: invalid arguments");
    }
  }
}

JS_INIT_DEFAULT(UIScreenEdgePanGestureRecognizer);
JS_INIT_CLASS(UIScreenEdgePanGestureRecognizer, UIPanGestureRecognizer);
  JS_INIT_CTOR(UIScreenEdgePanGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UIScreenEdgePanGestureRecognizer, UIPanGestureRecognizer);

NAN_METHOD(NUIScreenEdgePanGestureRecognizer::New) {
  JS_RECONSTRUCT(UIScreenEdgePanGestureRecognizer);
  @autoreleasepool {
    UIScreenEdgePanGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIScreenEdgePanGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [UIScreenEdgePanGestureRecognizer alloc];
    }
    if (self) {
      NUIScreenEdgePanGestureRecognizer *wrapper = new NUIScreenEdgePanGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIScreenEdgePanGestureRecognizer::New: invalid arguments");
    }
  }
}

JS_INIT_DEFAULT(UILongPressGestureRecognizer);
JS_INIT_CLASS(UILongPressGestureRecognizer, UIGestureRecognizer);
  JS_INIT_CTOR(UILongPressGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UILongPressGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUILongPressGestureRecognizer::New) {
  JS_RECONSTRUCT(UILongPressGestureRecognizer);
  @autoreleasepool {
    UILongPressGestureRecognizer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UILongPressGestureRecognizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [UILongPressGestureRecognizer alloc];
    }
    if (self) {
      NUILongPressGestureRecognizer *wrapper = new NUILongPressGestureRecognizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UILongPressGestureRecognizer::New: invalid arguments");
    }
  }
}
