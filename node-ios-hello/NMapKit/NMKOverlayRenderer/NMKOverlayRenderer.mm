//
//  NMKOverlayRenderer.mm
//
//  Created by Shawn Presser on 6/23/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKOverlayRenderer.h"

#define instancetype MKOverlayRenderer
#define js_value_instancetype js_value_MKOverlayRenderer

NMKOverlayRenderer::NMKOverlayRenderer() {}
NMKOverlayRenderer::~NMKOverlayRenderer() {}

JS_INIT_CLASS(MKOverlayRenderer, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithOverlay);
  JS_ASSIGN_PROTO_METHOD(pointForMapPoint);
  JS_ASSIGN_PROTO_METHOD(mapPointForPoint);
  JS_ASSIGN_PROTO_METHOD(rectForMapRect);
  JS_ASSIGN_PROTO_METHOD(mapRectForRect);
  JS_ASSIGN_PROTO_METHOD(canDrawMapRectZoomScale);
  JS_ASSIGN_PROTO_METHOD(drawMapRectZoomScaleInContext);
  JS_ASSIGN_PROTO_METHOD(setNeedsDisplay);
  JS_ASSIGN_PROTO_METHOD(setNeedsDisplayInMapRect);
  JS_ASSIGN_PROTO_METHOD(setNeedsDisplayInMapRectZoomScale);
  JS_ASSIGN_PROTO_PROP_READONLY(overlay);
  JS_ASSIGN_PROTO_PROP(alpha);
  JS_ASSIGN_PROTO_PROP_READONLY(contentScaleFactor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MKOverlayRenderer, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MKOverlayRenderer, NSObject);

NAN_METHOD(NMKOverlayRenderer::New) {
  JS_RECONSTRUCT(MKOverlayRenderer);
  @autoreleasepool {
    MKOverlayRenderer* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MKOverlayRenderer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MKOverlayRenderer alloc] init];
    }
    if (self) {
      NMKOverlayRenderer *wrapper = new NMKOverlayRenderer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MKOverlayRenderer::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMKOverlayRenderer::initWithOverlay) {
  JS_UNWRAP_OR_ALLOC(MKOverlayRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay);
    JS_SET_RETURN(js_value_instancetype([self initWithOverlay: overlay]));
  }
}

#include "NMKMapView.h"

NAN_METHOD(NMKOverlayRenderer::pointForMapPoint) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapPoint, mapPoint);
    JS_SET_RETURN(js_value_CGPoint([self pointForMapPoint: mapPoint]));
  }
}

NAN_METHOD(NMKOverlayRenderer::mapPointForPoint) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    JS_SET_RETURN(js_value_MKMapPoint([self mapPointForPoint: point]));
  }
}

NAN_METHOD(NMKOverlayRenderer::rectForMapRect) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    JS_SET_RETURN(js_value_CGRect([self rectForMapRect: mapRect]));
  }
}

NAN_METHOD(NMKOverlayRenderer::mapRectForRect) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_MKMapRect([self mapRectForRect: rect]));
  }
}

NAN_METHOD(NMKOverlayRenderer::canDrawMapRectZoomScale) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    declare_value(MKZoomScale, zoomScale);
    JS_SET_RETURN(js_value_BOOL([self canDrawMapRect: mapRect zoomScale: zoomScale]));
  }
}

NAN_METHOD(NMKOverlayRenderer::drawMapRectZoomScaleInContext) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    declare_value(MKZoomScale, zoomScale);
    declare_value(CGContextRef, context);
    [self drawMapRect: mapRect zoomScale: zoomScale inContext: context];
  }
}

NAN_METHOD(NMKOverlayRenderer::setNeedsDisplay) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    [self setNeedsDisplay];
  }
}

NAN_METHOD(NMKOverlayRenderer::setNeedsDisplayInMapRect) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    [self setNeedsDisplayInMapRect: mapRect];
  }
}

NAN_METHOD(NMKOverlayRenderer::setNeedsDisplayInMapRectZoomScale) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    declare_value(MKZoomScale, zoomScale);
    [self setNeedsDisplayInMapRect: mapRect zoomScale: zoomScale];
  }
}

NAN_GETTER(NMKOverlayRenderer::overlayGetter) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MKOverlay>*/([self overlay]));
  }
}

NAN_GETTER(NMKOverlayRenderer::alphaGetter) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self alpha]));
  }
}

NAN_SETTER(NMKOverlayRenderer::alphaSetter) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setAlpha: input];
  }
}

NAN_GETTER(NMKOverlayRenderer::contentScaleFactorGetter) {
  JS_UNWRAP(MKOverlayRenderer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self contentScaleFactor]));
  }
}

