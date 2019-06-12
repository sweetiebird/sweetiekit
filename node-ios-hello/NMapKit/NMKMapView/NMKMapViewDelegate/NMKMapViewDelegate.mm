//
//  MKMapViewDelegate.mm
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKMapViewDelegate.h"

NMKMapViewDelegate::NMKMapViewDelegate () {}
NMKMapViewDelegate::~NMKMapViewDelegate () {}

JS_INIT_CLASS(MKMapViewDelegate, NSObject);
  // instance members (proto)
  JS_SET_PROP(proto, "didFinishRendering", DidFinishRendering);
  JS_SET_PROP(proto, "didUpdateUserLocation", DidUpdateUserLocation);
  JS_SET_PROP(proto, "viewForAnnotation", ViewForAnnotation);
  JS_SET_PROP(proto, "didSelectViewForAnnotation", DidSelectViewForAnnotation);
  // static members (ctor)
  JS_INIT_CTOR(MKMapViewDelegate, NSObject);
JS_INIT_CLASS_END(MKMapViewDelegate, NSObject);

NAN_METHOD(NMKMapViewDelegate::New) {
  JS_RECONSTRUCT(MKMapViewDelegate);

  Local<Object> obj = info.This();

  NMKMapViewDelegate *ui = new NMKMapViewDelegate();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SMKMapViewDelegate *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SMKMapViewDelegate alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NMKMapViewDelegate::DidFinishRenderingGetter) {
  Nan::HandleScope scope;
  
  @autoreleasepool {
    NMKMapViewDelegate *del = ObjectWrap::Unwrap<NMKMapViewDelegate>(Local<Object>::Cast(info.This()));
    SMKMapViewDelegate *sDel = del->As<SMKMapViewDelegate>();
  }
}

NAN_SETTER(NMKMapViewDelegate::DidFinishRenderingSetter) {
  Nan::HandleScope scope;

  @autoreleasepool {
    NMKMapViewDelegate *del = ObjectWrap::Unwrap<NMKMapViewDelegate>(Local<Object>::Cast(info.This()));
    SMKMapViewDelegate *sDel = del->As<SMKMapViewDelegate>();
  }
}

NAN_GETTER(NMKMapViewDelegate::DidUpdateUserLocationGetter) {
  Nan::HandleScope scope;
  
  @autoreleasepool {
    NMKMapViewDelegate *del = ObjectWrap::Unwrap<NMKMapViewDelegate>(Local<Object>::Cast(info.This()));
    SMKMapViewDelegate *sDel = del->As<SMKMapViewDelegate>();
  }
}

NAN_SETTER(NMKMapViewDelegate::DidUpdateUserLocationSetter) {
  Nan::HandleScope scope;

  @autoreleasepool {
    NMKMapViewDelegate *del = ObjectWrap::Unwrap<NMKMapViewDelegate>(Local<Object>::Cast(info.This()));
    SMKMapViewDelegate *sDel = del->As<SMKMapViewDelegate>();
  }
}

NAN_GETTER(NMKMapViewDelegate::ViewForAnnotationGetter) {
  Nan::HandleScope scope;
  
  @autoreleasepool {
    NMKMapViewDelegate *del = ObjectWrap::Unwrap<NMKMapViewDelegate>(Local<Object>::Cast(info.This()));
    SMKMapViewDelegate *sDel = del->As<SMKMapViewDelegate>();
  }
}

NAN_SETTER(NMKMapViewDelegate::ViewForAnnotationSetter) {
  Nan::HandleScope scope;

  @autoreleasepool {
    NMKMapViewDelegate *del = ObjectWrap::Unwrap<NMKMapViewDelegate>(Local<Object>::Cast(info.This()));
    SMKMapViewDelegate *sDel = del->As<SMKMapViewDelegate>();
  }
}

NAN_GETTER(NMKMapViewDelegate::DidSelectViewForAnnotationGetter) {
  Nan::HandleScope scope;
  
  @autoreleasepool {
    NMKMapViewDelegate *del = ObjectWrap::Unwrap<NMKMapViewDelegate>(Local<Object>::Cast(info.This()));
    SMKMapViewDelegate *sDel = del->As<SMKMapViewDelegate>();
  }
}

NAN_SETTER(NMKMapViewDelegate::DidSelectViewForAnnotationSetter) {
  Nan::HandleScope scope;

  @autoreleasepool {
    NMKMapViewDelegate *del = ObjectWrap::Unwrap<NMKMapViewDelegate>(Local<Object>::Cast(info.This()));
    SMKMapViewDelegate *sDel = del->As<SMKMapViewDelegate>();
  }
}
