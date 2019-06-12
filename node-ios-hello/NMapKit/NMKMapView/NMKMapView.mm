//
//  MKMapView.mm
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKMapView.h"

NMKMapView::NMKMapView () {}
NMKMapView::~NMKMapView () {}

JS_INIT_CLASS(MKMapView, UIView);
  // instance members (proto)
  JS_SET_METHOD(proto, "setRegion", SetRegion);
  JS_SET_METHOD(proto, "addAnnotation", AddAnnotation);
  // static members (ctor)
  JS_INIT_CTOR(MKMapView, UIView);
JS_INIT_CLASS_END(MKMapView, UIView);

NAN_METHOD(NMKMapView::New) {
  JS_RECONSTRUCT(MKMapView);

  Local<Object> obj = info.This();

  NMKMapView *ui = new NMKMapView();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge MKMapView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    @autoreleasepool {
      double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
      double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
      double w = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
      double h = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
      ui->SetNSObject([[MKMapView alloc] initWithFrame:CGRectMake(x, y, w, h)]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[MKMapView alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NMKMapView::SetRegion) {
  Nan::HandleScope scope;

  JS_UNWRAP(MKMapView, ui);

  @autoreleasepool {
    double lat = TO_DOUBLE(JS_OBJ(JS_OBJ(info[0])->Get(JS_STR("coordinate")))->Get(JS_STR("latitude")));
    double lng = TO_DOUBLE(JS_OBJ(JS_OBJ(info[0])->Get(JS_STR("coordinate")))->Get(JS_STR("longitude")));
    double latDist = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("latitudinalMeters")));
    double lngDist = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("longitudinalMeters")));
    bool animated = TO_BOOL(info[1]);
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
    [ui setRegion:MKCoordinateRegionMakeWithDistance([loc coordinate], latDist, lngDist) animated:animated];
  }
}

NAN_METHOD(NMKMapView::AddAnnotation) {
  Nan::HandleScope scope;

  JS_UNWRAP(MKMapView, ui);

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
    [ui addAnnotation:note];
  }
}
