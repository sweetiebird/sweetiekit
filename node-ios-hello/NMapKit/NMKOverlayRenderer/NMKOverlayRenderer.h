//
//  NMKOverlayRenderer.h
//
//  Created by Shawn Presser on 6/23/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKOverlayRenderer_h
#define NMKOverlayRenderer_h    

#include "NNSObject.h"

#define js_value_MKOverlayRenderer(x) js_value_wrapper(x, MKOverlayRenderer)
#define to_value_MKOverlayRenderer(x) to_value_wrapper(x, MKOverlayRenderer)
#define is_value_MKOverlayRenderer(x) is_value_wrapper(x, MKOverlayRenderer)

JS_WRAP_CLASS(MKOverlayRenderer, NSObject);
  JS_METHOD(initWithOverlay);
  JS_METHOD(pointForMapPoint);
  JS_METHOD(mapPointForPoint);
  JS_METHOD(rectForMapRect);
  JS_METHOD(mapRectForRect);
  JS_METHOD(canDrawMapRectZoomScale);
  JS_METHOD(drawMapRectZoomScaleInContext);
  JS_METHOD(setNeedsDisplay);
  JS_METHOD(setNeedsDisplayInMapRect);
  JS_METHOD(setNeedsDisplayInMapRectZoomScale);
  JS_PROP_READONLY(overlay);
  JS_PROP(alpha);
  JS_PROP_READONLY(contentScaleFactor);
JS_WRAP_CLASS_END(MKOverlayRenderer);

#endif /* NMKOverlayRenderer_h */
