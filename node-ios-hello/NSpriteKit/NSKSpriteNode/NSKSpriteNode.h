//
//  NSKSpriteNode.h
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKSpriteNode_h
#define NSKSpriteNode_h

#import "NSKNode.h"

#define js_value_SKSpriteNode(x) js_value_wrapper(x, SKSpriteNode)
#define to_value_SKSpriteNode(x) to_value_wrapper(x, SKSpriteNode)
#define is_value_SKSpriteNode(x) is_value_wrapper(x, SKSpriteNode)

// SpriteKit enums
#define js_value_SKBlendMode(x) JS_ENUM(SKBlendMode, NSInteger, x)
#define to_value_SKBlendMode(x) TO_ENUM(SKBlendMode, NSInteger, x)
#define is_value_SKBlendMode(x) IS_ENUM(SKBlendMode, NSInteger, x)

JS_WRAP_CLASS(SKSpriteNode, SKNode);
  JS_METHOD(scaleToSize);
  JS_METHOD(animateWithRemoteGIF);
//  JS_PROP(size);
//  JS_PROP(colorBlendFactor);
//  JS_PROP(color);
//  JS_PROP(anchorPoint);
  JS_PROP(texture);
  JS_PROP(normalTexture);
  JS_PROP(lightingBitMask);
  JS_PROP(shadowCastBitMask);
  JS_PROP(shadowedBitMask);
  JS_PROP(centerRect);
  JS_PROP(colorBlendFactor);
  JS_PROP(color);
  JS_PROP(blendMode);
  JS_PROP(anchorPoint);
  JS_PROP(size);
  JS_PROP(shader);
  JS_PROP(attributeValues);
JS_WRAP_CLASS_END(SKSpriteNode);

#endif /* NSKSpriteNode_h */
