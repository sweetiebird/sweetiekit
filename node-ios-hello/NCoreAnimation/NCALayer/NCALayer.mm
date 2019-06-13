//
//  NCALayer.mm
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCALayer.h"

#define instancetype CALayer
#define js_value_instancetype js_value_CALayer

#include "NCABasicAnimation.h"

NCALayer::NCALayer () {}
NCALayer::~NCALayer () {}

JS_INIT_CLASS(CALayer, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(presentationLayer);
  JS_ASSIGN_PROTO_METHOD(modelLayer);
  JS_ASSIGN_PROTO_METHOD(shouldArchiveValueForKey);
  JS_ASSIGN_PROTO_METHOD(affineTransform);
  JS_ASSIGN_PROTO_METHOD(setAffineTransform);
  JS_ASSIGN_PROTO_METHOD(contentsAreFlipped);
  JS_ASSIGN_PROTO_METHOD(removeFromSuperlayer);
  JS_ASSIGN_PROTO_METHOD(addSublayer);
  JS_ASSIGN_PROTO_METHOD(insertSublayerAtIndex);
  JS_ASSIGN_PROTO_METHOD(insertSublayerBelow);
  JS_ASSIGN_PROTO_METHOD(insertSublayerAbove);
  JS_ASSIGN_PROTO_METHOD(replaceSublayerWith);
  JS_ASSIGN_PROTO_METHOD(convertPointFromLayer);
  JS_ASSIGN_PROTO_METHOD(convertPointToLayer);
  JS_ASSIGN_PROTO_METHOD(convertRectFromLayer);
  JS_ASSIGN_PROTO_METHOD(convertRectToLayer);
  JS_ASSIGN_PROTO_METHOD(convertTimeFromLayer);
  JS_ASSIGN_PROTO_METHOD(convertTimeToLayer);
  JS_ASSIGN_PROTO_METHOD(hitTest);
  JS_ASSIGN_PROTO_METHOD(containsPoint);
  JS_ASSIGN_PROTO_METHOD(display);
  JS_ASSIGN_PROTO_METHOD(setNeedsDisplay);
  JS_ASSIGN_PROTO_METHOD(setNeedsDisplayInRect);
  JS_ASSIGN_PROTO_METHOD(needsDisplay);
  JS_ASSIGN_PROTO_METHOD(displayIfNeeded);
  JS_ASSIGN_PROTO_METHOD(drawInContext);
  JS_ASSIGN_PROTO_METHOD(renderInContext);
  JS_ASSIGN_PROTO_METHOD(preferredFrameSize);
  JS_ASSIGN_PROTO_METHOD(setNeedsLayout);
  JS_ASSIGN_PROTO_METHOD(needsLayout);
  JS_ASSIGN_PROTO_METHOD(layoutIfNeeded);
  JS_ASSIGN_PROTO_METHOD(layoutSublayers);
  JS_ASSIGN_PROTO_METHOD(actionForKey);
  JS_ASSIGN_PROTO_METHOD(addAnimationForKey);
  JS_ASSIGN_PROTO_METHOD(removeAllAnimations);
  JS_ASSIGN_PROTO_METHOD(removeAnimationForKey);
  JS_ASSIGN_PROTO_METHOD(animationKeys);
  JS_ASSIGN_PROTO_METHOD(animationForKey);
  
#if TODO
// CAAction
  JS_ASSIGN_PROTO_METHOD(runActionForKeyObjectArguments);
// CALayerDelegate
  JS_ASSIGN_PROTO_METHOD(displayLayer);
  JS_ASSIGN_PROTO_METHOD(drawLayerInContext);
  JS_ASSIGN_PROTO_METHOD(layerWillDraw);
  JS_ASSIGN_PROTO_METHOD(layoutSublayersOfLayer);
  JS_ASSIGN_PROTO_METHOD(actionForLayerForKey);
#endif
// CALayer
  JS_ASSIGN_PROTO_PROP(bounds);
  JS_ASSIGN_PROTO_PROP(position);
  JS_ASSIGN_PROTO_PROP(zPosition);
  JS_ASSIGN_PROTO_PROP(anchorPoint);
  JS_ASSIGN_PROTO_PROP(anchorPointZ);
  JS_ASSIGN_PROTO_PROP(transform);
  JS_ASSIGN_PROTO_PROP(frame);
  JS_ASSIGN_PROTO_PROP(isHidden);
  JS_ASSIGN_PROTO_PROP(isDoubleSided);
  JS_ASSIGN_PROTO_PROP(isGeometryFlipped);
  JS_ASSIGN_PROTO_PROP_READONLY(superlayer);
  JS_ASSIGN_PROTO_PROP(sublayers);
  JS_ASSIGN_PROTO_PROP(sublayerTransform);
  JS_ASSIGN_PROTO_PROP(mask);
  JS_ASSIGN_PROTO_PROP(masksToBounds);
  JS_ASSIGN_PROTO_PROP(contents);
  JS_ASSIGN_PROTO_PROP(contentsRect);
  JS_ASSIGN_PROTO_PROP(contentsGravity);
  JS_ASSIGN_PROTO_PROP(contentsScale);
  JS_ASSIGN_PROTO_PROP(contentsCenter);
  JS_ASSIGN_PROTO_PROP(contentsFormat);
  JS_ASSIGN_PROTO_PROP(minificationFilter);
  JS_ASSIGN_PROTO_PROP(magnificationFilter);
  JS_ASSIGN_PROTO_PROP(minificationFilterBias);
  JS_ASSIGN_PROTO_PROP(isOpaque);
  JS_ASSIGN_PROTO_PROP(needsDisplayOnBoundsChange);
  JS_ASSIGN_PROTO_PROP(drawsAsynchronously);
  JS_ASSIGN_PROTO_PROP(edgeAntialiasingMask);
  JS_ASSIGN_PROTO_PROP(allowsEdgeAntialiasing);
  JS_ASSIGN_PROTO_PROP(backgroundColor);
  JS_ASSIGN_PROTO_PROP(cornerRadius);
  JS_ASSIGN_PROTO_PROP(maskedCorners);
  JS_ASSIGN_PROTO_PROP(borderWidth);
  JS_ASSIGN_PROTO_PROP(borderColor);
  JS_ASSIGN_PROTO_PROP(opacity);
  JS_ASSIGN_PROTO_PROP(allowsGroupOpacity);
  JS_ASSIGN_PROTO_PROP(compositingFilter);
  JS_ASSIGN_PROTO_PROP(filters);
  JS_ASSIGN_PROTO_PROP(backgroundFilters);
  JS_ASSIGN_PROTO_PROP(shouldRasterize);
  JS_ASSIGN_PROTO_PROP(rasterizationScale);
  JS_ASSIGN_PROTO_PROP(shadowColor);
  JS_ASSIGN_PROTO_PROP(shadowOpacity);
  JS_ASSIGN_PROTO_PROP(shadowOffset);
  JS_ASSIGN_PROTO_PROP(shadowRadius);
  JS_ASSIGN_PROTO_PROP(shadowPath);
  JS_ASSIGN_PROTO_PROP(actions);
  JS_ASSIGN_PROTO_PROP(name);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(style);

  // static members (ctor)
  JS_INIT_CTOR(CALayer, NSObject);
  JS_ASSIGN_STATIC_METHOD(layer);
  JS_ASSIGN_STATIC_METHOD(defaultValueForKey);
  JS_ASSIGN_STATIC_METHOD(needsDisplayForKey);
  JS_ASSIGN_STATIC_METHOD(defaultActionForKey);
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_STATIC_METHOD(initWithLayer);
  
  // constants

/* Bit definitions for `edgeAntialiasingMask' property. */

//typedef NS_OPTIONS (unsigned int, CAEdgeAntialiasingMask)
{
  JS_ASSIGN_ENUM(kCALayerLeftEdge, uint32_t);      /* Minimum X edge. */
  JS_ASSIGN_ENUM(kCALayerRightEdge, uint32_t);     /* Maximum X edge. */
  JS_ASSIGN_ENUM(kCALayerBottomEdge, uint32_t);    /* Minimum Y edge. */
  JS_ASSIGN_ENUM(kCALayerTopEdge, uint32_t);       /* Maximum Y edge. */
}

/* Bit definitions for `maskedCorners' property. */

//typedef NS_OPTIONS (NSUInteger, CACornerMask)
{
  JS_ASSIGN_ENUM(kCALayerMinXMinYCorner, NSUInteger);
  JS_ASSIGN_ENUM(kCALayerMaxXMinYCorner, NSUInteger);
  JS_ASSIGN_ENUM(kCALayerMinXMaxYCorner, NSUInteger);
  JS_ASSIGN_ENUM(kCALayerMaxXMaxYCorner, NSUInteger);
};

  /** Layer `contentsGravity' values. **/
  JS_ASSIGN_VALUE(kCAGravityCenter);
  JS_ASSIGN_VALUE(kCAGravityTop);
  JS_ASSIGN_VALUE(kCAGravityBottom);
  JS_ASSIGN_VALUE(kCAGravityLeft);
  JS_ASSIGN_VALUE(kCAGravityRight);
  JS_ASSIGN_VALUE(kCAGravityTopLeft);
  JS_ASSIGN_VALUE(kCAGravityTopRight);
  JS_ASSIGN_VALUE(kCAGravityBottomLeft);
  JS_ASSIGN_VALUE(kCAGravityBottomRight);
  JS_ASSIGN_VALUE(kCAGravityResize);
  JS_ASSIGN_VALUE(kCAGravityResizeAspect);
  JS_ASSIGN_VALUE(kCAGravityResizeAspectFill);

  /** Layer `contentsFormat` values. **/
  JS_ASSIGN_VALUE(kCAContentsFormatRGBA8Uint); /* RGBA UInt8 per component */
  JS_ASSIGN_VALUE(kCAContentsFormatRGBA16Float); /* RGBA half-float 16-bit per component */
  JS_ASSIGN_VALUE(kCAContentsFormatGray8Uint); /* Grayscale with alpha (if not opaque) UInt8 per component */

  /** Contents filter names. **/
  JS_ASSIGN_VALUE(kCAFilterNearest);
  JS_ASSIGN_VALUE(kCAFilterLinear);
  JS_ASSIGN_VALUE(kCAFilterTrilinear);

JS_INIT_CLASS_END(CALayer, NSObject);

NAN_METHOD(NCALayer::New) {
  JS_RECONSTRUCT(CALayer);

  Local<Object> viewObj = info.This();

  NCALayer *view = new NCALayer();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge CALayer *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("NCALayer::New must receive a CALayer");
  }
  view->Wrap(viewObj);

  JS_SET_RETURN(viewObj);
}

NAN_METHOD(NCALayer::layer) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([CALayer layer]));
  }
}

NAN_METHOD(NCALayer::defaultValueForKey) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([CALayer defaultValueForKey: key]));
  }
}

NAN_METHOD(NCALayer::needsDisplayForKey) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_BOOL([CALayer needsDisplayForKey: key]));
  }
}

#define js_value_CAAction(x) js_value_wrapper_unknown(x, CAAction)
#define to_value_CAAction(x) to_value_wrapper_unknown(x, CAAction)
#define is_value_CAAction(x) is_value_wrapper_unknown(x, CAAction)

NAN_METHOD(NCALayer::defaultActionForKey) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, event);
    JS_SET_RETURN(js_value_id/* <CAAction>*/([CALayer defaultActionForKey: event]));
  }
}

NAN_METHOD(NCALayer::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[CALayer alloc] init]));
  }
}

NAN_METHOD(NCALayer::initWithLayer) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id, layer);
    JS_SET_RETURN(js_value_instancetype([[CALayer alloc] initWithLayer: layer]));
  }
}

NAN_METHOD(NCALayer::presentationLayer) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([self presentationLayer]));
  }
}

NAN_METHOD(NCALayer::modelLayer) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([self modelLayer]));
  }
}

NAN_METHOD(NCALayer::shouldArchiveValueForKey) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_BOOL([self shouldArchiveValueForKey: key]));
  }
}

NAN_METHOD(NCALayer::affineTransform) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGAffineTransform([self affineTransform]));
  }
}

NAN_METHOD(NCALayer::setAffineTransform) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGAffineTransform, m);
    [self setAffineTransform: m];
  }
}

NAN_METHOD(NCALayer::contentsAreFlipped) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self contentsAreFlipped]));
  }
}

NAN_METHOD(NCALayer::removeFromSuperlayer) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    [self removeFromSuperlayer];
  }
}

NAN_METHOD(NCALayer::addSublayer) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CALayer, layer);
    [self addSublayer: layer];
  }
}

NAN_METHOD(NCALayer::insertSublayerAtIndex) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CALayer, layer);
    declare_value(unsigned, idx);
    [self insertSublayer: layer atIndex: idx];
  }
}

NAN_METHOD(NCALayer::insertSublayerBelow) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CALayer, layer);
    declare_nullable_pointer(CALayer, sibling);
    [self insertSublayer: layer below: sibling];
  }
}

NAN_METHOD(NCALayer::insertSublayerAbove) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CALayer, layer);
    declare_nullable_pointer(CALayer, sibling);
    [self insertSublayer: layer above: sibling];
  }
}

NAN_METHOD(NCALayer::replaceSublayerWith) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CALayer, oldLayer);
    declare_pointer(CALayer, newLayer);
    [self replaceSublayer: oldLayer with: newLayer];
  }
}

NAN_METHOD(NCALayer::convertPointFromLayer) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, p);
    declare_nullable_pointer(CALayer, l);
    JS_SET_RETURN(js_value_CGPoint([self convertPoint: p fromLayer: l]));
  }
}

NAN_METHOD(NCALayer::convertPointToLayer) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, p);
    declare_nullable_pointer(CALayer, l);
    JS_SET_RETURN(js_value_CGPoint([self convertPoint: p toLayer: l]));
  }
}

NAN_METHOD(NCALayer::convertRectFromLayer) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, r);
    declare_nullable_pointer(CALayer, l);
    JS_SET_RETURN(js_value_CGRect([self convertRect: r fromLayer: l]));
  }
}

NAN_METHOD(NCALayer::convertRectToLayer) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, r);
    declare_nullable_pointer(CALayer, l);
    JS_SET_RETURN(js_value_CGRect([self convertRect: r toLayer: l]));
  }
}

NAN_METHOD(NCALayer::convertTimeFromLayer) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CFTimeInterval, t);
    declare_nullable_pointer(CALayer, l);
    JS_SET_RETURN(js_value_CFTimeInterval([self convertTime: t fromLayer: l]));
  }
}

NAN_METHOD(NCALayer::convertTimeToLayer) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CFTimeInterval, t);
    declare_nullable_pointer(CALayer, l);
    JS_SET_RETURN(js_value_CFTimeInterval([self convertTime: t toLayer: l]));
  }
}

NAN_METHOD(NCALayer::hitTest) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, p);
    JS_SET_RETURN(js_value_CALayer([self hitTest: p]));
  }
}

NAN_METHOD(NCALayer::containsPoint) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, p);
    JS_SET_RETURN(js_value_BOOL([self containsPoint: p]));
  }
}

NAN_METHOD(NCALayer::display) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    [self display];
  }
}

NAN_METHOD(NCALayer::setNeedsDisplay) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    [self setNeedsDisplay];
  }
}

NAN_METHOD(NCALayer::setNeedsDisplayInRect) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, r);
    [self setNeedsDisplayInRect: r];
  }
}

NAN_METHOD(NCALayer::needsDisplay) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self needsDisplay]));
  }
}

NAN_METHOD(NCALayer::displayIfNeeded) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    [self displayIfNeeded];
  }
}

NAN_METHOD(NCALayer::drawInContext) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGContextRef, ctx);
    [self drawInContext: ctx];
  }
}

NAN_METHOD(NCALayer::renderInContext) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(CGContextRef, ctx);
    if (!ctx) {
      ctx = UIGraphicsGetCurrentContext();
    }
    [self renderInContext: ctx];
  }
}

NAN_METHOD(NCALayer::preferredFrameSize) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self preferredFrameSize]));
  }
}

NAN_METHOD(NCALayer::setNeedsLayout) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    [self setNeedsLayout];
  }
}

NAN_METHOD(NCALayer::needsLayout) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self needsLayout]));
  }
}

NAN_METHOD(NCALayer::layoutIfNeeded) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    [self layoutIfNeeded];
  }
}

NAN_METHOD(NCALayer::layoutSublayers) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    [self layoutSublayers];
  }
}

NAN_METHOD(NCALayer::actionForKey) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, event);
    JS_SET_RETURN(js_value_id/* <CAAction>*/([self actionForKey: event]));
  }
}

#define js_value_CAAnimation(x) js_value_wrapper_unknown(x, CAAnimation)
#define to_value_CAAnimation(x) to_value_wrapper_unknown(x, CAAnimation)
#define is_value_CAAnimation(x) is_value_wrapper_unknown(x, CAAnimation)

NAN_METHOD(NCALayer::addAnimationForKey) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CAAnimation, anim);
    declare_nullable_pointer(NSString, key);
    [self addAnimation: anim forKey: key];
  }
}

NAN_METHOD(NCALayer::removeAllAnimations) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    [self removeAllAnimations];
  }
}

NAN_METHOD(NCALayer::removeAnimationForKey) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    [self removeAnimationForKey: key];
  }
}

NAN_METHOD(NCALayer::animationKeys) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self animationKeys]));
  }
}

NAN_METHOD(NCALayer::animationForKey) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_CAAnimation([self animationForKey: key]));
  }
}

#if TODO
NAN_METHOD(NCAAction::runActionForKeyObject) {
  JS_UNWRAP(CAAction, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, event);
    declare_value(id, anObject);
    [self runActionForKey: event object: anObject];
  }
}

NAN_METHOD(NCALayerDelegate::displayLayer) {
  JS_UNWRAP(CALayerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CALayer, layer);
    [self displayLayer: layer];
  }
}

NAN_METHOD(NCALayerDelegate::drawLayerInContext) {
  JS_UNWRAP(CALayerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CALayer, layer);
    declare_value(CGContextRef, ctx);
    [self drawLayer: layer inContext: ctx];
  }
}

NAN_METHOD(NCALayerDelegate::layerWillDraw) {
  JS_UNWRAP(CALayerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CALayer, layer);
    [self layerWillDraw: layer];
  }
}

NAN_METHOD(NCALayerDelegate::layoutSublayersOfLayer) {
  JS_UNWRAP(CALayerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CALayer, layer);
    [self layoutSublayersOfLayer: layer];
  }
}

NAN_METHOD(NCALayerDelegate::actionForLayerForKey) {
  JS_UNWRAP(CALayerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CALayer, layer);
    declare_pointer(NSString, event);
    JS_SET_RETURN(js_value_id/* <CAAction>*/([self actionForLayer: layer forKey: event]));
  }
}
#endif

#include "NCABasicAnimation.h"

NAN_METHOD(NCALayer::AddAnimation) {
  JS_UNWRAP(CALayer, self);
  @autoreleasepool {
    if (info[0]->IsNullOrUndefined()) {
      return;
    }
    if (!is_value_CABasicAnimation(info[0])) {
      Nan::ThrowError("NCALayer::AddAnimation: expected first argument to be a CABasicAnimation");
      return;
    }
    [self addAnimation:to_value_CABasicAnimation(info[0]) forKey:to_value_NSString(info[1])];
  }
}

NAN_GETTER(NCALayer::boundsGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self bounds]));
  }
}

NAN_SETTER(NCALayer::boundsSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGRect, input);
    [self setBounds: input];
  }
}

NAN_GETTER(NCALayer::positionGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self position]));
  }
}

NAN_SETTER(NCALayer::positionSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setPosition: input];
  }
}

NAN_GETTER(NCALayer::zPositionGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self zPosition]));
  }
}

NAN_SETTER(NCALayer::zPositionSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setZPosition: input];
  }
}

NAN_GETTER(NCALayer::anchorPointGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self anchorPoint]));
  }
}

NAN_SETTER(NCALayer::anchorPointSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setAnchorPoint: input];
  }
}

NAN_GETTER(NCALayer::anchorPointZGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self anchorPointZ]));
  }
}

NAN_SETTER(NCALayer::anchorPointZSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setAnchorPointZ: input];
  }
}

NAN_GETTER(NCALayer::transformGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CATransform3D([self transform]));
  }
}

NAN_SETTER(NCALayer::transformSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CATransform3D, input);
    [self setTransform: input];
  }
}

NAN_GETTER(NCALayer::frameGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self frame]));
  }
}

NAN_SETTER(NCALayer::frameSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGRect, input);
    [self setFrame: input];
  }
}

NAN_GETTER(NCALayer::isHiddenGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isHidden]));
  }
}

NAN_SETTER(NCALayer::isHiddenSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidden: input];
  }
}

NAN_GETTER(NCALayer::isDoubleSidedGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isDoubleSided]));
  }
}

NAN_SETTER(NCALayer::isDoubleSidedSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDoubleSided: input];
  }
}

NAN_GETTER(NCALayer::isGeometryFlippedGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isGeometryFlipped]));
  }
}

NAN_SETTER(NCALayer::isGeometryFlippedSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setGeometryFlipped: input];
  }
}

NAN_GETTER(NCALayer::superlayerGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CALayer([self superlayer]));
  }
}

NAN_GETTER(NCALayer::sublayersGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<CALayer*>([self sublayers]));
  }
}

NAN_SETTER(NCALayer::sublayersSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<CALayer*>, input);
    [self setSublayers: input];
  }
}

NAN_GETTER(NCALayer::sublayerTransformGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CATransform3D([self sublayerTransform]));
  }
}

NAN_SETTER(NCALayer::sublayerTransformSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CATransform3D, input);
    [self setSublayerTransform: input];
  }
}

NAN_GETTER(NCALayer::maskGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CALayer([self mask]));
  }
}

NAN_SETTER(NCALayer::maskSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(CALayer, input);
    [self setMask: input];
  }
}

NAN_GETTER(NCALayer::masksToBoundsGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self masksToBounds]));
  }
}

NAN_SETTER(NCALayer::masksToBoundsSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setMasksToBounds: input];
  }
}

NAN_GETTER(NCALayer::contentsGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self contents]));
  }
}

NAN_SETTER(NCALayer::contentsSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    [self setContents: input];
  }
}

NAN_GETTER(NCALayer::contentsRectGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self contentsRect]));
  }
}

NAN_SETTER(NCALayer::contentsRectSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGRect, input);
    [self setContentsRect: input];
  }
}

NAN_GETTER(NCALayer::contentsGravityGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CALayerContentsGravity([self contentsGravity]));
  }
}

NAN_SETTER(NCALayer::contentsGravitySetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CALayerContentsGravity, input);
    [self setContentsGravity: input];
  }
}

NAN_GETTER(NCALayer::contentsScaleGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self contentsScale]));
  }
}

NAN_SETTER(NCALayer::contentsScaleSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setContentsScale: input];
  }
}

NAN_GETTER(NCALayer::contentsCenterGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self contentsCenter]));
  }
}

NAN_SETTER(NCALayer::contentsCenterSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGRect, input);
    [self setContentsCenter: input];
  }
}

NAN_GETTER(NCALayer::contentsFormatGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CALayerContentsFormat([self contentsFormat]));
  }
}

NAN_SETTER(NCALayer::contentsFormatSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CALayerContentsFormat, input);
    [self setContentsFormat: input];
  }
}

NAN_GETTER(NCALayer::minificationFilterGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CALayerContentsFilter([self minificationFilter]));
  }
}

NAN_SETTER(NCALayer::minificationFilterSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CALayerContentsFilter, input);
    [self setMinificationFilter: input];
  }
}

NAN_GETTER(NCALayer::magnificationFilterGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CALayerContentsFilter([self magnificationFilter]));
  }
}

NAN_SETTER(NCALayer::magnificationFilterSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CALayerContentsFilter, input);
    [self setMagnificationFilter: input];
  }
}

NAN_GETTER(NCALayer::minificationFilterBiasGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self minificationFilterBias]));
  }
}

NAN_SETTER(NCALayer::minificationFilterBiasSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setMinificationFilterBias: input];
  }
}

NAN_GETTER(NCALayer::isOpaqueGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isOpaque]));
  }
}

NAN_SETTER(NCALayer::isOpaqueSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setOpaque: input];
  }
}

NAN_GETTER(NCALayer::needsDisplayOnBoundsChangeGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self needsDisplayOnBoundsChange]));
  }
}

NAN_SETTER(NCALayer::needsDisplayOnBoundsChangeSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setNeedsDisplayOnBoundsChange: input];
  }
}

NAN_GETTER(NCALayer::drawsAsynchronouslyGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self drawsAsynchronously]));
  }
}

NAN_SETTER(NCALayer::drawsAsynchronouslySetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDrawsAsynchronously: input];
  }
}

NAN_GETTER(NCALayer::edgeAntialiasingMaskGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CAEdgeAntialiasingMask([self edgeAntialiasingMask]));
  }
}

NAN_SETTER(NCALayer::edgeAntialiasingMaskSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CAEdgeAntialiasingMask, input);
    [self setEdgeAntialiasingMask: input];
  }
}

NAN_GETTER(NCALayer::allowsEdgeAntialiasingGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsEdgeAntialiasing]));
  }
}

NAN_SETTER(NCALayer::allowsEdgeAntialiasingSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsEdgeAntialiasing: input];
  }
}

NAN_GETTER(NCALayer::backgroundColorGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGColorRef([self backgroundColor]));
  }
}

NAN_SETTER(NCALayer::backgroundColorSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGColorRef, input);
    [self setBackgroundColor: input];
  }
}

NAN_GETTER(NCALayer::cornerRadiusGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self cornerRadius]));
  }
}

NAN_SETTER(NCALayer::cornerRadiusSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setCornerRadius: input];
  }
}

NAN_GETTER(NCALayer::maskedCornersGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CACornerMask([self maskedCorners]));
  }
}

NAN_SETTER(NCALayer::maskedCornersSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CACornerMask, input);
    [self setMaskedCorners: input];
  }
}

NAN_GETTER(NCALayer::borderWidthGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self borderWidth]));
  }
}

NAN_SETTER(NCALayer::borderWidthSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setBorderWidth: input];
  }
}

NAN_GETTER(NCALayer::borderColorGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGColorRef([self borderColor]));
  }
}

NAN_SETTER(NCALayer::borderColorSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGColorRef, input);
    [self setBorderColor: input];
  }
}

NAN_GETTER(NCALayer::opacityGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self opacity]));
  }
}

NAN_SETTER(NCALayer::opacitySetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setOpacity: input];
  }
}

NAN_GETTER(NCALayer::allowsGroupOpacityGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsGroupOpacity]));
  }
}

NAN_SETTER(NCALayer::allowsGroupOpacitySetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsGroupOpacity: input];
  }
}

NAN_GETTER(NCALayer::compositingFilterGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self compositingFilter]));
  }
}

NAN_SETTER(NCALayer::compositingFilterSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id, input);
    [self setCompositingFilter: input];
  }
}

NAN_GETTER(NCALayer::filtersGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray([self filters]));
  }
}

NAN_SETTER(NCALayer::filtersSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray, input);
    [self setFilters: input];
  }
}

NAN_GETTER(NCALayer::backgroundFiltersGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray([self backgroundFilters]));
  }
}

NAN_SETTER(NCALayer::backgroundFiltersSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray, input);
    [self setBackgroundFilters: input];
  }
}

NAN_GETTER(NCALayer::shouldRasterizeGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldRasterize]));
  }
}

NAN_SETTER(NCALayer::shouldRasterizeSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShouldRasterize: input];
  }
}

NAN_GETTER(NCALayer::rasterizationScaleGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self rasterizationScale]));
  }
}

NAN_SETTER(NCALayer::rasterizationScaleSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setRasterizationScale: input];
  }
}

NAN_GETTER(NCALayer::shadowColorGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGColorRef([self shadowColor]));
  }
}

NAN_SETTER(NCALayer::shadowColorSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGColorRef, input);
    [self setShadowColor: input];
  }
}

NAN_GETTER(NCALayer::shadowOpacityGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self shadowOpacity]));
  }
}

NAN_SETTER(NCALayer::shadowOpacitySetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setShadowOpacity: input];
  }
}

NAN_GETTER(NCALayer::shadowOffsetGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self shadowOffset]));
  }
}

NAN_SETTER(NCALayer::shadowOffsetSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setShadowOffset: input];
  }
}

NAN_GETTER(NCALayer::shadowRadiusGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self shadowRadius]));
  }
}

NAN_SETTER(NCALayer::shadowRadiusSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setShadowRadius: input];
  }
}

NAN_GETTER(NCALayer::shadowPathGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPathRef([self shadowPath]));
  }
}

NAN_SETTER(NCALayer::shadowPathSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPathRef, input);
    [self setShadowPath: input];
  }
}

NAN_GETTER(NCALayer::actionsGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id<CAAction>>*/([self actions]));
  }
}

NAN_SETTER(NCALayer::actionsSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSString*, id<CAAction>>*/, input);
    [self setActions: input];
  }
}

NAN_GETTER(NCALayer::nameGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_SETTER(NCALayer::nameSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setName: input];
  }
}

NAN_GETTER(NCALayer::delegateGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <CALayerDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NCALayer::delegateSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <CALayerDelegate>*/, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NCALayer::styleGetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary([self style]));
  }
}

NAN_SETTER(NCALayer::styleSetter) {
  JS_UNWRAP(CALayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary, input);
    [self setStyle: input];
  }
}

