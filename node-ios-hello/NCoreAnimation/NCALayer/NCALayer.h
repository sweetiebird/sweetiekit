//
//  NCALayer.h
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCALayer_h
#define NCALayer_h

#include "NNSObject.h"

#define js_value_CALayer(x) js_value_wrapper(x, CALayer)
#define to_value_CALayer(x) to_value_wrapper(x, CALayer)
#define is_value_CALayer(x) is_value_wrapper(x, CALayer)

#define js_value_CAEdgeAntialiasingMask(x) JS_OPTS(CAEdgeAntialiasingMask, uint32_t, x)
#define to_value_CAEdgeAntialiasingMask(x) TO_OPTS(CAEdgeAntialiasingMask, uint32_t, x)
#define is_value_CAEdgeAntialiasingMask(x) IS_OPTS(CAEdgeAntialiasingMask, uint32_t, x)

#define js_value_CACornerMask(x) JS_OPTS(CACornerMask, NSUInteger, x)
#define to_value_CACornerMask(x) TO_OPTS(CACornerMask, NSUInteger, x)
#define is_value_CACornerMask(x) IS_OPTS(CACornerMask, NSUInteger, x)

#define js_value_CALayerContentsGravity(x) JS_ENUM(CALayerContentsGravity, NSString, x)
#define to_value_CALayerContentsGravity(x) TO_ENUM(CALayerContentsGravity, NSString, x)
#define is_value_CALayerContentsGravity(x) IS_ENUM(CALayerContentsGravity, NSString, x)

#define js_value_CALayerContentsFormat(x) JS_ENUM(CALayerContentsFormat, NSString, x)
#define to_value_CALayerContentsFormat(x) TO_ENUM(CALayerContentsFormat, NSString, x)
#define is_value_CALayerContentsFormat(x) IS_ENUM(CALayerContentsFormat, NSString, x)

#define js_value_CALayerContentsFilter(x) JS_ENUM(CALayerContentsFilter, NSString, x)
#define to_value_CALayerContentsFilter(x) TO_ENUM(CALayerContentsFilter, NSString, x)
#define is_value_CALayerContentsFilter(x) IS_ENUM(CALayerContentsFilter, NSString, x)

JS_WRAP_CLASS(CALayer, NSObject);
  JS_METHOD(AddAnimation);
  JS_METHOD(AddSublayer);

 // CALayer
  JS_STATIC_METHOD(layer);
  JS_STATIC_METHOD(defaultValueForKey);
  JS_STATIC_METHOD(needsDisplayForKey);
  JS_STATIC_METHOD(defaultActionForKey);
  JS_STATIC_METHOD(init);
  JS_STATIC_METHOD(initWithLayer);
  JS_METHOD(presentationLayer);
  JS_METHOD(modelLayer);
  JS_METHOD(shouldArchiveValueForKey);
  JS_METHOD(affineTransform);
  JS_METHOD(setAffineTransform);
  JS_METHOD(contentsAreFlipped);
  JS_METHOD(removeFromSuperlayer);
  JS_METHOD(addSublayer);
  JS_METHOD(insertSublayerAtIndex);
  JS_METHOD(insertSublayerBelow);
  JS_METHOD(insertSublayerAbove);
  JS_METHOD(replaceSublayerWith);
  JS_METHOD(convertPointFromLayer);
  JS_METHOD(convertPointToLayer);
  JS_METHOD(convertRectFromLayer);
  JS_METHOD(convertRectToLayer);
  JS_METHOD(convertTimeFromLayer);
  JS_METHOD(convertTimeToLayer);
  JS_METHOD(hitTest);
  JS_METHOD(containsPoint);
  JS_METHOD(display);
  JS_METHOD(setNeedsDisplay);
  JS_METHOD(setNeedsDisplayInRect);
  JS_METHOD(needsDisplay);
  JS_METHOD(displayIfNeeded);
  JS_METHOD(drawInContext);
  JS_METHOD(renderInContext);
  JS_METHOD(preferredFrameSize);
  JS_METHOD(setNeedsLayout);
  JS_METHOD(needsLayout);
  JS_METHOD(layoutIfNeeded);
  JS_METHOD(layoutSublayers);
  JS_METHOD(actionForKey);
  JS_METHOD(addAnimationForKey);
  JS_METHOD(removeAllAnimations);
  JS_METHOD(removeAnimationForKey);
  JS_METHOD(animationKeys);
  JS_METHOD(animationForKey);
#if TODO
// CAAction
  JS_METHOD(runActionForKeyObjectArguments);
// CALayerDelegate
  JS_METHOD(displayLayer);
  JS_METHOD(drawLayerInContext);
  JS_METHOD(layerWillDraw);
  JS_METHOD(layoutSublayersOfLayer);
  JS_METHOD(actionForLayerForKey);
#endif
// CALayer
  JS_PROP(bounds);
  JS_PROP(position);
  JS_PROP(zPosition);
  JS_PROP(anchorPoint);
  JS_PROP(anchorPointZ);
  JS_PROP(transform);
  JS_PROP(frame);
  JS_PROP(isHidden);
  JS_PROP(isDoubleSided);
  JS_PROP(isGeometryFlipped);
  JS_PROP_READONLY(superlayer);
  JS_PROP(sublayers);
  JS_PROP(sublayerTransform);
  JS_PROP(mask);
  JS_PROP(masksToBounds);
  JS_PROP(contents);
  JS_PROP(contentsRect);
  JS_PROP(contentsGravity);
  JS_PROP(contentsScale);
  JS_PROP(contentsCenter);
  JS_PROP(contentsFormat);
  JS_PROP(minificationFilter);
  JS_PROP(magnificationFilter);
  JS_PROP(minificationFilterBias);
  JS_PROP(isOpaque);
  JS_PROP(needsDisplayOnBoundsChange);
  JS_PROP(drawsAsynchronously);
  JS_PROP(edgeAntialiasingMask);
  JS_PROP(allowsEdgeAntialiasing);
  JS_PROP(backgroundColor);
  JS_PROP(cornerRadius);
  JS_PROP(maskedCorners);
  JS_PROP(borderWidth);
  JS_PROP(borderColor);
  JS_PROP(opacity);
  JS_PROP(allowsGroupOpacity);
  JS_PROP(compositingFilter);
  JS_PROP(filters);
  JS_PROP(backgroundFilters);
  JS_PROP(shouldRasterize);
  JS_PROP(rasterizationScale);
  JS_PROP(shadowColor);
  JS_PROP(shadowOpacity);
  JS_PROP(shadowOffset);
  JS_PROP(shadowRadius);
  JS_PROP(shadowPath);
  JS_PROP(actions);
  JS_PROP(name);
  JS_PROP(delegate);
  JS_PROP(style);


JS_WRAP_CLASS_END(CALayer);


#endif /* NCALayer_h */
