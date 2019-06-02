//
//  NSCNMaterialProperty.h
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNMaterialProperty_h
#define NSCNMaterialProperty_h    

#include "NNSObject.h"

#define js_value_SCNMaterialProperty(x) js_value_wrapper(x, SCNMaterialProperty)
#define to_value_SCNMaterialProperty(x) to_value_wrapper(x, SCNMaterialProperty)
#define is_value_SCNMaterialProperty(x) is_value_wrapper(x, SCNMaterialProperty)

// SceneKit enums
#define js_value_SCNFilterMode(x) JS_ENUM(SCNFilterMode, NSInteger, x)
#define to_value_SCNFilterMode(x) TO_ENUM(SCNFilterMode, NSInteger, x)
#define is_value_SCNFilterMode(x) IS_ENUM(SCNFilterMode, NSInteger, x)

#define js_value_SCNWrapMode(x) JS_ENUM(SCNWrapMode, NSInteger, x)
#define to_value_SCNWrapMode(x) TO_ENUM(SCNWrapMode, NSInteger, x)
#define is_value_SCNWrapMode(x) IS_ENUM(SCNWrapMode, NSInteger, x)

#define js_value_SCNColorMask(x) JS_ENUM(SCNColorMask, NSInteger, x)
#define to_value_SCNColorMask(x) TO_ENUM(SCNColorMask, NSInteger, x)
#define is_value_SCNColorMask(x) IS_ENUM(SCNColorMask, NSInteger, x)

JS_WRAP_CLASS(SCNMaterialProperty, NSObject);
  JS_PROP(contents);
  JS_PROP(intensity);
  JS_PROP(minificationFilter);
  JS_PROP(magnificationFilter);
  JS_PROP(mipFilter);
  JS_PROP(contentsTransform);
  JS_PROP(wrapS);
  JS_PROP(wrapT);
  JS_PROP(borderColor);
  JS_PROP(mappingChannel);
  JS_PROP(textureComponents);
  JS_PROP(maxAnisotropy);
JS_WRAP_CLASS_END(SCNMaterialProperty);

#endif /* NSCNMaterialProperty_h */
