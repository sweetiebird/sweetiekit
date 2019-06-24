//
//  NSCNScene.h
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
  JS_STATIC_METHOD(sceneWithMDLAsset);
  JS_STATIC_METHOD(scene);
  JS_STATIC_METHOD(sceneNamed);
  JS_STATIC_METHOD(sceneNamedInDirectoryOptions);
  JS_STATIC_METHOD(sceneWithURLOptionsError);
  JS_METHOD(attributeForKey);
  JS_METHOD(setAttributeForKey);
  JS_METHOD(writeToURLOptionsDelegateProgressHandler);
  JS_PROP_READONLY(rootNode);
  JS_PROP_READONLY(physicsWorld);
  JS_PROP_READONLY(background);
  JS_PROP_READONLY(lightingEnvironment);
  JS_PROP(fogStartDistance);
  JS_PROP(fogEndDistance);
  JS_PROP(fogDensityExponent);
  JS_PROP(fogColor);
  JS_PROP(isPaused);
JS_WRAP_CLASS_END(SCNScene);

#endif /* NSCNScene_h */
