//
//  NCALayer.m
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#include "NCALayer.h"
#include "ColorHelper.h"
#include "NCABasicAnimation.h"
#include "defines.h"

NCALayer::NCALayer () {}
NCALayer::~NCALayer () {}

JS_INIT_CLASS(CALayer, NSObject);
  // instance members (proto)
  JS_SET_PROP(proto, "cornerRadius", CornerRadius);
  JS_SET_PROP(proto, "borderWidth", BorderWidth);
  JS_SET_PROP(proto, "borderColor", BorderColor);
  JS_SET_PROP(proto, "shadowOffset", ShadowOffset);
  JS_SET_PROP(proto, "shadowColor", ShadowColor);
  JS_SET_PROP(proto, "shadowRadius", ShadowRadius);
  JS_SET_PROP(proto, "position", Position);
//  JS_SET_METHOD(proto, "addAnimation", AddAnimation);
//  JS_SET_METHOD(proto, "addSublayer", AddSublayer);
//  JS_SET_METHOD(proto, "renderInContext", RenderInContext);
  JS_SET_PROP(proto, "masksToBounds", MasksToBounds);
  JS_SET_PROP(proto, "shadowOpacity", ShadowOpacity);
  JS_SET_PROP(proto, "frame", Frame);
  
  JS_ASSIGN_METHOD(proto, presentationLayer);
  JS_ASSIGN_METHOD(proto, modelLayer);
  JS_ASSIGN_METHOD(proto, shouldArchiveValueForKey);
  JS_ASSIGN_METHOD(proto, affineTransform);
  JS_ASSIGN_METHOD(proto, setAffineTransform);
  JS_ASSIGN_METHOD(proto, contentsAreFlipped);
  JS_ASSIGN_METHOD(proto, removeFromSuperlayer);
  JS_ASSIGN_METHOD(proto, addSublayer);
  JS_ASSIGN_METHOD(proto, insertSublayerAtIndex);
  JS_ASSIGN_METHOD(proto, insertSublayerBelow);
  JS_ASSIGN_METHOD(proto, insertSublayerAbove);
  JS_ASSIGN_METHOD(proto, replaceSublayerWith);
  JS_ASSIGN_METHOD(proto, convertPointFromLayer);
  JS_ASSIGN_METHOD(proto, convertPointToLayer);
  JS_ASSIGN_METHOD(proto, convertRectFromLayer);
  JS_ASSIGN_METHOD(proto, convertRectToLayer);
  JS_ASSIGN_METHOD(proto, convertTimeFromLayer);
  JS_ASSIGN_METHOD(proto, convertTimeToLayer);
  JS_ASSIGN_METHOD(proto, hitTest);
  JS_ASSIGN_METHOD(proto, containsPoint);
  JS_ASSIGN_METHOD(proto, display);
  JS_ASSIGN_METHOD(proto, setNeedsDisplay);
  JS_ASSIGN_METHOD(proto, setNeedsDisplayInRect);
  JS_ASSIGN_METHOD(proto, needsDisplay);
  JS_ASSIGN_METHOD(proto, displayIfNeeded);
  JS_ASSIGN_METHOD(proto, drawInContext);
  JS_ASSIGN_METHOD(proto, renderInContext);
  JS_ASSIGN_METHOD(proto, preferredFrameSize);
  JS_ASSIGN_METHOD(proto, setNeedsLayout);
  JS_ASSIGN_METHOD(proto, needsLayout);
  JS_ASSIGN_METHOD(proto, layoutIfNeeded);
  JS_ASSIGN_METHOD(proto, layoutSublayers);
  JS_ASSIGN_METHOD(proto, actionForKey);
  JS_ASSIGN_METHOD(proto, addAnimationForKey);
  JS_ASSIGN_METHOD(proto, removeAllAnimations);
  JS_ASSIGN_METHOD(proto, removeAnimationForKey);
  JS_ASSIGN_METHOD(proto, animationKeys);
  JS_ASSIGN_METHOD(proto, animationForKey);
  
  /*
  JS_ASSIGN_PROP(proto, bounds);
  JS_ASSIGN_PROP(proto, position);
  JS_ASSIGN_PROP(proto, zPosition);
  JS_ASSIGN_PROP(proto, anchorPoint);
  JS_ASSIGN_PROP(proto, anchorPointZ);
  JS_ASSIGN_PROP(proto, transform);
  JS_ASSIGN_PROP(proto, frame);
  JS_ASSIGN_PROP(proto, hidden);
  JS_ASSIGN_PROP(proto, doubleSided);
  JS_ASSIGN_PROP(proto, geometryFlipped);
  JS_ASSIGN_PROP_READONLY(proto, superlayer);
  JS_ASSIGN_PROP(proto, sublayers);
  JS_ASSIGN_PROP(proto, sublayerTransform);
  JS_ASSIGN_PROP(proto, mask);
  JS_ASSIGN_PROP(proto, masksToBounds);
  JS_ASSIGN_PROP(proto, contents);
  JS_ASSIGN_PROP(proto, contentsRect);
  JS_ASSIGN_PROP(proto, contentsGravity);
  JS_ASSIGN_PROP(proto, contentsScale);
  JS_ASSIGN_PROP(proto, contentsCenter);
  JS_ASSIGN_PROP(proto, contentsFormat);
  JS_ASSIGN_PROP(proto, minificationFilter);
  JS_ASSIGN_PROP(proto, magnificationFilter);
  JS_ASSIGN_PROP(proto, minificationFilterBias);
  JS_ASSIGN_PROP(proto, opaque);
  JS_ASSIGN_PROP(proto, needsDisplayOnBoundsChange);
  JS_ASSIGN_PROP(proto, drawsAsynchronously);
  JS_ASSIGN_PROP(proto, edgeAntialiasingMask);
  JS_ASSIGN_PROP(proto, allowsEdgeAntialiasing);
  JS_ASSIGN_PROP(proto, backgroundColor);
  JS_ASSIGN_PROP(proto, cornerRadius);
  JS_ASSIGN_PROP(proto, maskedCorners);
  JS_ASSIGN_PROP(proto, borderWidth);
  JS_ASSIGN_PROP(proto, borderColor);
  JS_ASSIGN_PROP(proto, opacity);
  JS_ASSIGN_PROP(proto, allowsGroupOpacity);
  JS_ASSIGN_PROP(proto, compositingFilter);
  JS_ASSIGN_PROP(proto, filters);
  JS_ASSIGN_PROP(proto, backgroundFilters);
  JS_ASSIGN_PROP(proto, shouldRasterize);
  JS_ASSIGN_PROP(proto, rasterizationScale);
  JS_ASSIGN_PROP(proto, shadowColor);
  JS_ASSIGN_PROP(proto, shadowOpacity);
  JS_ASSIGN_PROP(proto, shadowOffset);
  JS_ASSIGN_PROP(proto, shadowRadius);
  JS_ASSIGN_PROP(proto, shadowPath);
  JS_ASSIGN_PROP(proto, actions);
  JS_ASSIGN_PROP(proto, name);
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP(proto, style);
*/

  // static members (ctor)
  JS_INIT_CTOR(CALayer, NSObject);
  JS_ASSIGN_METHOD(ctor, layer);
  JS_ASSIGN_METHOD(ctor, defaultValueForKey);
  JS_ASSIGN_METHOD(ctor, needsDisplayForKey);
  JS_ASSIGN_METHOD(ctor, defaultActionForKey);
  JS_ASSIGN_METHOD(ctor, init);
  JS_ASSIGN_METHOD(ctor, initWithLayer);
JS_INIT_CLASS_END(CALayer, NSObject);

NAN_METHOD(NCALayer::New) {
  Nan::HandleScope scope;

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

#define js_value_instancetype js_value_CALayer

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

NAN_GETTER(NCALayer::CornerRadiusGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  __block CGFloat theCornerRadius = 0.0;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      theCornerRadius = [ui cornerRadius];
    });
  }
  
  JS_SET_RETURN(JS_FLOAT(theCornerRadius));
}

NAN_SETTER(NCALayer::CornerRadiusSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  if (value->IsNumber()) {
    CGFloat theCornerRadius = TO_FLOAT(value);
    
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        [ui setCornerRadius:theCornerRadius];
      });
    }
  } else {
    iOSLog0("NCALayer::CornerRadiusSetter: value is not a number");
  }
}

NAN_GETTER(NCALayer::BorderColorGetter) {
  NCALayer *view = ObjectWrap::Unwrap<NCALayer>(Local<Object>::Cast(info.This()));
  
  __block CGFloat red = 0;
  __block CGFloat green = 0;
  __block CGFloat blue = 0;
  __block CGFloat alpha = 1;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(),  ^ {
      UIColor* color = [ColorHelper CGColorToUIColor:[view->As<CALayer>() borderColor]];
      [color getRed:&red green:&green blue:&blue alpha:&alpha];
    });
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NCALayer::BorderColorSetter) {
  NCALayer *view = ObjectWrap::Unwrap<NCALayer>(Local<Object>::Cast(info.This()));

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<CALayer>() setBorderColor:color.CGColor];
    });
  }
}

NAN_GETTER(NCALayer::BorderWidthGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  __block CGFloat theBorderWidth = 0.0;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      theBorderWidth = [ui borderWidth];
    });
  }
  
  JS_SET_RETURN(JS_FLOAT(theBorderWidth));
}

NAN_SETTER(NCALayer::BorderWidthSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  if (value->IsNumber()) {
    CGFloat theBorderWidth = TO_FLOAT(value);
    
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        [ui setBorderWidth:theBorderWidth];
      });
    }
  } else {
    iOSLog0("NCALayer::BorderWidthSetter: value is not a number");
  }
}

static bool JS_IsCGSize(Local<Object> value) {
  if (!value->IsObject()) {
    return false;
  }
  if (!JS_HAS(value, JS_STR("width"))) {
    return false;
  }
  if (!JS_HAS(value, JS_STR("height"))) {
    return false;
  }
  return true;
}

NAN_GETTER(NCALayer::ShadowColorGetter) {
  NCALayer *view = ObjectWrap::Unwrap<NCALayer>(Local<Object>::Cast(info.This()));
  
  __block CGFloat red = 0;
  __block CGFloat green = 0;
  __block CGFloat blue = 0;
  __block CGFloat alpha = 1;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(),  ^ {
      UIColor* color = [ColorHelper CGColorToUIColor:[view->As<CALayer>() shadowColor]];
      [color getRed:&red green:&green blue:&blue alpha:&alpha];
    });
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NCALayer::ShadowColorSetter) {
  NCALayer *view = ObjectWrap::Unwrap<NCALayer>(Local<Object>::Cast(info.This()));

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<CALayer>() setShadowColor:color.CGColor];
    });
  }
}

NAN_GETTER(NCALayer::ShadowOffsetGetter) {
  NCALayer *view = ObjectWrap::Unwrap<NCALayer>(Local<Object>::Cast(info.This()));
  
  __block CGSize offset;
  offset.width = 0.0;
  offset.height = 0.0;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(),  ^ {
      offset = [view->As<CALayer>() shadowOffset];
    });
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_NUM(offset.width));
  result->Set(JS_STR("height"), JS_NUM(offset.height));

  JS_SET_RETURN(result);
}

NAN_SETTER(NCALayer::ShadowOffsetSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  if (JS_IsCGSize(JS_OBJ(value))) {
    CGSize theShadowOffset;
    theShadowOffset.width = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("width")));
    theShadowOffset.height = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("height")));
    
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        [ui setShadowOffset:theShadowOffset];
      });
    }
  } else {
    iOSLog0("NCALayer::ShadowOffsetSetter: value is not a CGSize");
  }
}

NAN_GETTER(NCALayer::ShadowRadiusGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  __block CGFloat theShadowRadius = 0.0;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      theShadowRadius = [ui shadowRadius];
    });
  }
  
  JS_SET_RETURN(JS_FLOAT(theShadowRadius));
}

NAN_SETTER(NCALayer::ShadowRadiusSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  if (value->IsNumber()) {
    CGFloat theShadowRadius = TO_FLOAT(value);
    
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        [ui setShadowRadius:theShadowRadius];
      });
    }
  } else {
    iOSLog0("NCALayer::ShadowRadiusSetter: value is not a number");
  }
}

NAN_GETTER(NCALayer::PositionGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  __block CGPoint position;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      position = [ui position];
    });
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_NUM(position.x));
  result->Set(JS_STR("y"), JS_NUM(position.y));
  
  JS_SET_RETURN(result);
}

NAN_SETTER(NCALayer::PositionSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(CALayer, ui);
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
      double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));
      CGPoint pt = CGPointMake(x, y);
      [ui setPosition:pt];
    });
  }
}

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

NAN_GETTER(NCALayer::MasksToBoundsGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CALayer, ui);

  JS_SET_RETURN(JS_BOOL([ui masksToBounds]));
}

NAN_SETTER(NCALayer::MasksToBoundsSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CALayer, ui);
  
  [ui setMasksToBounds:TO_BOOL(value)];
}

NAN_GETTER(NCALayer::ShadowOpacityGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CALayer, ui);

  JS_SET_RETURN(JS_NUM([ui shadowOpacity]));
}

NAN_SETTER(NCALayer::ShadowOpacitySetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CALayer, ui);
  
  [ui setShadowOpacity:TO_FLOAT(value)];
}

//NAN_METHOD(NCALayer::RenderInContext) {
//  Nan::HandleScope scope;
//
//  JS_UNWRAP(CALayer, layer)
//
//  NSString *ctxType = NJSStringToNSString(info[0]);
//
//  if ([ctxType  isEqual: @"current"]) {
//    @autoreleasepool {
//      [layer renderInContext:UIGraphicsGetCurrentContext()];
//    }
//  }
//}

NAN_GETTER(NCALayer::FrameGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CALayer, ca);
  
  JS_SET_RETURN(sweetiekit::JSObjFromFrame([ca frame]));
}

NAN_SETTER(NCALayer::FrameSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CALayer, ca);

  @autoreleasepool {
    [ca setFrame:sweetiekit::FrameFromJSObj(JS_OBJ(value))];
  }
}
