//
//  NSCNScene.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNScene_h
#define NSCNScene_h

#include "NNSObject.h"

#define js_value_SCNScene(x) js_value_wrapper(x, SCNScene)
#define to_value_SCNScene(x) to_value_wrapper(x, SCNScene)
#define is_value_SCNScene(x) is_value_wrapper(x, SCNScene)

JS_WRAP_CLASS(SCNScene, NSObject);
  JS_PROP(rootNode);
JS_WRAP_CLASS_END(SCNScene);

#endif /* NSCNScene_h */
