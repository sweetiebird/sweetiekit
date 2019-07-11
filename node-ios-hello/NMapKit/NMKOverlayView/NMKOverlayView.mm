//
//  NMKOverlayView.mm
//
//  Created by Shawn Presser on 6/23/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKOverlayView.h"

#define instancetype MKOverlayView
#define js_value_instancetype js_value_MKOverlayView

NMKOverlayView::NMKOverlayView() {}
NMKOverlayView::~NMKOverlayView() {}

JS_INIT_CLASS(MKOverlayView, UIView);
  JS_ASSIGN_PROTO_METHOD(initWithOverlay);
  JS_ASSIGN_PROTO_METHOD(pointForMapPoint);
  JS_ASSIGN_PROTO_METHOD(mapPointForPoint);
  JS_ASSIGN_PROTO_METHOD(rectForMapRect);
  JS_ASSIGN_PROTO_METHOD(mapRectForRect);
  JS_ASSIGN_PROTO_METHOD(canDrawMapRectZoomScale);
  JS_ASSIGN_PROTO_METHOD(drawMapRectZoomScaleInContext);
  JS_ASSIGN_PROTO_METHOD(setNeedsDisplayInMapRect);
  JS_ASSIGN_PROTO_METHOD(setNeedsDisplayInMapRectZoomScale);
  JS_ASSIGN_PROTO_PROP_READONLY(overlay);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MKOverlayView, UIView);
  // constant values (exports)
JS_INIT_CLASS_END(MKOverlayView, UIView);

NAN_METHOD(NMKOverlayView::New) {
  JS_RECONSTRUCT(MKOverlayView);
  @autoreleasepool {
    MKOverlayView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MKOverlayView *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[MKOverlayView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[MKOverlayView alloc] init];
    }
    if (self) {
      NMKOverlayView *wrapper = new NMKOverlayView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MKOverlayView::New: invalid arguments");
    }
  }
}

#include "NMKMapView.h"

NAN_METHOD(NMKOverlayView::initWithOverlay) {
  JS_UNWRAP_OR_ALLOC(MKOverlayView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay);
    JS_SET_RETURN(js_value_instancetype([self initWithOverlay: overlay]));
  }
}

NAN_METHOD(NMKOverlayView::pointForMapPoint) {
  JS_UNWRAP(MKOverlayView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapPoint, mapPoint);
    JS_SET_RETURN(js_value_CGPoint([self pointForMapPoint: mapPoint]));
  }
}

NAN_METHOD(NMKOverlayView::mapPointForPoint) {
  JS_UNWRAP(MKOverlayView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    JS_SET_RETURN(js_value_MKMapPoint([self mapPointForPoint: point]));
  }
}

NAN_METHOD(NMKOverlayView::rectForMapRect) {
  JS_UNWRAP(MKOverlayView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    JS_SET_RETURN(js_value_CGRect([self rectForMapRect: mapRect]));
  }
}

NAN_METHOD(NMKOverlayView::mapRectForRect) {
  JS_UNWRAP(MKOverlayView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_MKMapRect([self mapRectForRect: rect]));
  }
}

NAN_METHOD(NMKOverlayView::canDrawMapRectZoomScale) {
  JS_UNWRAP(MKOverlayView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    declare_value(MKZoomScale, zoomScale);
    JS_SET_RETURN(js_value_BOOL([self canDrawMapRect: mapRect zoomScale: zoomScale]));
  }
}

NAN_METHOD(NMKOverlayView::drawMapRectZoomScaleInContext) {
  JS_UNWRAP(MKOverlayView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    declare_value(MKZoomScale, zoomScale);
    declare_value(CGContextRef, context);
    [self drawMapRect: mapRect zoomScale: zoomScale inContext: context];
  }
}

NAN_METHOD(NMKOverlayView::setNeedsDisplayInMapRect) {
  JS_UNWRAP(MKOverlayView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    [self setNeedsDisplayInMapRect: mapRect];
  }
}

NAN_METHOD(NMKOverlayView::setNeedsDisplayInMapRectZoomScale) {
  JS_UNWRAP(MKOverlayView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    declare_value(MKZoomScale, zoomScale);
    [self setNeedsDisplayInMapRect: mapRect zoomScale: zoomScale];
  }
}

NAN_GETTER(NMKOverlayView::overlayGetter) {
  JS_UNWRAP(MKOverlayView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MKOverlay>*/([self overlay]));
  }
}

