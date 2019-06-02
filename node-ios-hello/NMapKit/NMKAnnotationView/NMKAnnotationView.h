//
//  NMKAnnotationView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKAnnotationView_h
#define NMKAnnotationView_h    

#include "NUIView.h"

#define js_value_MKAnnotationView(x) js_value_wrapper(x, MKAnnotationView)
#define to_value_MKAnnotationView(x) to_value_wrapper(x, MKAnnotationView)
#define is_value_MKAnnotationView(x) is_value_wrapper(x, MKAnnotationView)

JS_WRAP_CLASS(MKAnnotationView, UIView);
  JS_PROP(Image);
  JS_PROP(Annotation);
JS_WRAP_CLASS_END(MKAnnotationView);

#endif /* NMKAnnotationView_h */
