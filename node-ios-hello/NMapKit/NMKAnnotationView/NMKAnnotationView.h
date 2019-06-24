//
//  NMKAnnotationView.h
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

#define js_value_MKAnnotationViewDragState(x) JS_ENUM(MKAnnotationViewDragState, NSUInteger, x)
#define to_value_MKAnnotationViewDragState(x) TO_ENUM(MKAnnotationViewDragState, NSUInteger, x)
#define is_value_MKAnnotationViewDragState(x) IS_ENUM(MKAnnotationViewDragState, NSUInteger, x)

#define js_value_MKFeatureDisplayPriority(x) JS_ENUM(MKFeatureDisplayPriority, float, x)
#define to_value_MKFeatureDisplayPriority(x) TO_ENUM(MKFeatureDisplayPriority, float, x)
#define is_value_MKFeatureDisplayPriority(x) IS_ENUM(MKFeatureDisplayPriority, float, x)

#define js_value_MKAnnotationViewCollisionMode(x) JS_ENUM(MKAnnotationViewCollisionMode, NSInteger, x)
#define to_value_MKAnnotationViewCollisionMode(x) TO_ENUM(MKAnnotationViewCollisionMode, NSInteger, x)
#define is_value_MKAnnotationViewCollisionMode(x) IS_ENUM(MKAnnotationViewCollisionMode, NSInteger, x)

JS_WRAP_CLASS(MKAnnotationView, UIView);
  JS_METHOD(initWithAnnotationReuseIdentifier);
  JS_METHOD(initWithCoder);
  JS_METHOD(prepareForReuse);
  JS_METHOD(prepareForDisplay);
  JS_METHOD(setSelectedAnimated);
  JS_METHOD(setDragStateAnimated);
  JS_PROP_READONLY(reuseIdentifier);
  JS_PROP(annotation);
  JS_PROP(image);
  JS_PROP(centerOffset);
  JS_PROP(calloutOffset);
#if !TARGET_OS_IPHONE
  JS_PROP(leftCalloutOffset);
  JS_PROP(rightCalloutOffset);
#endif
  JS_PROP(isEnabled);
  JS_PROP(isHighlighted);
  JS_PROP(isSelected);
  JS_PROP(canShowCallout);
  JS_PROP(leftCalloutAccessoryView);
  JS_PROP(rightCalloutAccessoryView);
  JS_PROP(detailCalloutAccessoryView);
  JS_PROP(isDraggable);
  JS_PROP(dragState);
  JS_PROP(clusteringIdentifier);
  JS_PROP_READONLY(clusterAnnotationView);
  JS_PROP(displayPriority);
  JS_PROP(collisionMode);
JS_WRAP_CLASS_END(MKAnnotationView);

#endif /* NMKAnnotationView_h */
