//
//  NMKMapViewDelegate.h
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKMapViewDelegate_h
#define NMKMapViewDelegate_h    

#include "NNSObject.h"

#define js_value_MKMapViewDelegate(x) js_value_wrapper(x, MKMapViewDelegate)
#define to_value_MKMapViewDelegate(x) to_value_wrapper(x, MKMapViewDelegate)
#define is_value_MKMapViewDelegate(x) is_value_wrapper(x, MKMapViewDelegate)

JS_WRAP_CLASS(MKMapViewDelegate, NSObject);
  JS_PROP(DidFinishRendering);
  JS_PROP(DidUpdateUserLocation);
  JS_PROP(ViewForAnnotation);
  JS_PROP(DidSelectViewForAnnotation);
  sweetiekit::JSFunction _didFinishRendering;
  sweetiekit::JSFunction _didUpdateUserLocation;
  sweetiekit::JSFunction _viewForAnnotation;
  sweetiekit::JSFunction _didSelectViewForAnnotation;
JS_WRAP_CLASS_END(MKMapViewDelegate);

#endif /* NMKMapViewDelegate_h */
