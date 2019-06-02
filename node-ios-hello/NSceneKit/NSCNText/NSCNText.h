//
//  NSCNText.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNText_h
#define NSCNText_h    

#include "NSCNGeometry.h"

#define js_value_SCNText(x) js_value_wrapper(x, SCNText)
#define to_value_SCNText(x) to_value_wrapper(x, SCNText)
#define is_value_SCNText(x) is_value_wrapper(x, SCNText)

JS_WRAP_CLASS(SCNText, SCNGeometry);
  JS_METHOD(textWithStringExtrusionDepth);
  JS_PROP(textSize);
  JS_PROP(extrusionDepth);
  JS_PROP(string);
  JS_PROP(font);
  JS_PROP(wrapped);
  JS_PROP(containerFrame);
  JS_PROP(truncationMode);
  JS_PROP(alignmentMode);
  JS_PROP(chamferRadius);
  JS_PROP(chamferProfile);
  JS_PROP(flatness);
JS_WRAP_CLASS_END(SCNText);

#endif /* NSCNText_h */
