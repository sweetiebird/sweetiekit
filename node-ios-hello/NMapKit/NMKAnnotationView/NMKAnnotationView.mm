//
//  MKAnnotationView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#include "defines.h"
#include "NUIView.h"
#include "NMKAnnotationView.h"
#include "NUIImage.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NMKAnnotationView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NMKAnnotationView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("MKAnnotationView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "image", Image);
  JS_SET_PROP(proto, "annotation", Annotation);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NMKAnnotationView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NMKAnnotationView *ui = new NMKAnnotationView();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge MKAnnotationView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    @autoreleasepool {
      double lat = TO_DOUBLE(JS_OBJ(JS_OBJ(info[0])->Get(JS_STR("coordinate")))->Get(JS_STR("latitude")));
      double lng = TO_DOUBLE(JS_OBJ(JS_OBJ(info[0])->Get(JS_STR("coordinate")))->Get(JS_STR("longitude")));
      NSString *title = nullptr;
      NSString *subtitle = nullptr;
      if (JS_OBJ(info[0])->Get(JS_STR("title"))->IsString()) {
        title = NJSStringToNSString(JS_OBJ(info[0])->Get(JS_STR("title")));
      }
      if (JS_OBJ(info[0])->Get(JS_STR("subtitle"))->IsString()) {
        subtitle = NJSStringToNSString(JS_OBJ(info[0])->Get(JS_STR("subtitle")));
      }
      CLLocation *loc = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
      SMKAnnotation *note = [[SMKAnnotation alloc] initWithCoordinate:[loc coordinate] title:title about:subtitle];
      ui->SetNSObject([[MKAnnotationView alloc] initWithAnnotation:note reuseIdentifier:nullptr]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[MKAnnotationView alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NMKAnnotationView::NMKAnnotationView () {}
NMKAnnotationView::~NMKAnnotationView () {}

NAN_GETTER(NMKAnnotationView::ImageGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(MKAnnotationView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui image], NUIImage::type));
}

NAN_SETTER(NMKAnnotationView::ImageSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(MKAnnotationView, ui);
  
  NUIImage *img = ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(value));
  
  [ui setImage:img->As<UIImage>()];
}

NAN_GETTER(NMKAnnotationView::AnnotationGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(MKAnnotationView, ui);

  __block double lat = 0;
  __block double lng = 0;
  __block NSString *title = nullptr;
  __block NSString *subtitle = nullptr;

  @autoreleasepool {
    lat = [[ui annotation] coordinate].latitude;
    lng = [[ui annotation] coordinate].longitude;
    title = [[ui annotation] title];
    subtitle = [[ui annotation] subtitle];
  }

  Local<Object> result = Object::New(Isolate::GetCurrent());
  Local<Object> coordinate = Object::New(Isolate::GetCurrent());
  coordinate->Set(JS_STR("latitude"), JS_NUM(lat));
  coordinate->Set(JS_STR("longitude"), JS_NUM(lng));
  result->Set(JS_STR("coordinate"), JS_OBJ(coordinate));
  result->Set(JS_STR("title"), JS_STR([title UTF8String]));
  result->Set(JS_STR("subtitle"), JS_STR([subtitle UTF8String]));

  JS_SET_RETURN(result);
}

NAN_SETTER(NMKAnnotationView::AnnotationSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(MKAnnotationView, ui);

  @autoreleasepool {
    double lat = TO_DOUBLE(JS_OBJ(JS_OBJ(value)->Get(JS_STR("coordinate")))->Get(JS_STR("latitude")));
    double lng = TO_DOUBLE(JS_OBJ(JS_OBJ(value)->Get(JS_STR("coordinate")))->Get(JS_STR("longitude")));
    NSString *title = nullptr;
    NSString *subtitle = nullptr;
    if (JS_OBJ(value)->Get(JS_STR("title"))->IsString()) {
      title = NJSStringToNSString(JS_OBJ(value)->Get(JS_STR("title")));
    }
    if (JS_OBJ(value)->Get(JS_STR("subtitle"))->IsString()) {
      subtitle = NJSStringToNSString(JS_OBJ(value)->Get(JS_STR("subtitle")));
    }
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
    SMKAnnotation *note = [[SMKAnnotation alloc] initWithCoordinate:[loc coordinate] title:title about:subtitle];
    [ui setAnnotation:note];
  }
}

