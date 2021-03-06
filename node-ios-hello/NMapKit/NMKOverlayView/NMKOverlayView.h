//
//  NMKOverlayView.h
//
//  Created by Shawn Presser on 6/23/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKOverlayView_h
#define NMKOverlayView_h    

#include "NUIView.h"

#define js_value_MKOverlayView(x) js_value_wrapper(x, MKOverlayView)
#define to_value_MKOverlayView(x) to_value_wrapper(x, MKOverlayView)
#define is_value_MKOverlayView(x) is_value_wrapper(x, MKOverlayView)

JS_WRAP_CLASS(MKOverlayView, UIView);
  JS_METHOD(initWithOverlay);
  JS_METHOD(pointForMapPoint);
  JS_METHOD(mapPointForPoint);
  JS_METHOD(rectForMapRect);
  JS_METHOD(mapRectForRect);
  JS_METHOD(canDrawMapRectZoomScale);
  JS_METHOD(drawMapRectZoomScaleInContext);
  JS_METHOD(setNeedsDisplayInMapRect);
  JS_METHOD(setNeedsDisplayInMapRectZoomScale);
  JS_PROP_READONLY(overlay);
JS_WRAP_CLASS_END(MKOverlayView);

#endif /* NMKOverlayView_h */
