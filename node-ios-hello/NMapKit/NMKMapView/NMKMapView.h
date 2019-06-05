//
//  NMKMapView.h
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKMapView_h
#define NMKMapView_h    

#include "NUIView.h"

#define js_value_MKMapView(x) js_value_wrapper(x, MKMapView)
#define to_value_MKMapView(x) to_value_wrapper(x, MKMapView)
#define is_value_MKMapView(x) is_value_wrapper(x, MKMapView)

JS_WRAP_CLASS(MKMapView, UIView);
  JS_METHOD(SetRegion);
  JS_METHOD(AddAnnotation);
JS_WRAP_CLASS_END(MKMapView);

#endif /* NMKMapView_h */
