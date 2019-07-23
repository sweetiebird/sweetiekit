//
//  NMKMapView.h
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKMapView_h
#define NMKMapView_h    

#include "NUIView.h"

#define js_value_MKMapView(x) js_value_wrapper(x, MKMapView)
#define to_value_MKMapView(x) to_value_wrapper(x, MKMapView)
#define is_value_MKMapView(x) is_value_wrapper(x, MKMapView)

#define js_value_MKUserTrackingMode(x) JS_ENUM(MKUserTrackingMode, NSInteger, x)
#define to_value_MKUserTrackingMode(x) TO_ENUM(MKUserTrackingMode, NSInteger, x)
#define is_value_MKUserTrackingMode(x) IS_ENUM(MKUserTrackingMode, NSInteger, x)

#define js_value_MKOverlayLevel(x) JS_ENUM(MKOverlayLevel, NSInteger, x)
#define to_value_MKOverlayLevel(x) TO_ENUM(MKOverlayLevel, NSInteger, x)
#define is_value_MKOverlayLevel(x) IS_ENUM(MKOverlayLevel, NSInteger, x)

#define js_value_MKZoomScale js_value_CGFloat
#define to_value_MKZoomScale to_value_CGFloat
#define is_value_MKZoomScale is_value_CGFloat

Local<Value> js_value_MKMapPoint(const MKMapPoint& pt);
Local<Value> js_value_MKMapSize(const MKMapSize& size);
Local<Value> js_value_MKMapRect(const MKMapRect& size);
Local<Value> js_value_MKCoordinateSpan(const MKCoordinateSpan& value);
Local<Value> js_value_MKCoordinateRegion(const MKCoordinateRegion& value);
MKMapPoint to_value_MKMapPoint(const Local<Value>& value, bool* _Nullable failed = nullptr);
MKMapSize to_value_MKMapSize(const Local<Value>& value, bool* _Nullable failed = nullptr);
MKMapRect to_value_MKMapRect(const Local<Value>& value, bool* _Nullable failed = nullptr);
MKCoordinateSpan to_value_MKCoordinateSpan(Local<Value> value, bool* _Nullable failed = nullptr);
MKCoordinateRegion to_value_MKCoordinateRegion(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_MKMapPoint(const Local<Value>& value);
bool is_value_MKMapSize(const Local<Value>& value);
bool is_value_MKMapRect(const Local<Value>& value);
bool is_value_MKCoordinateSpan(const Local<Value>& value);
bool is_value_MKCoordinateRegion(const Local<Value>& value);

#define js_value_MKMapType(x) JS_ENUM(MKMapType, NSUInteger, x)
#define to_value_MKMapType(x) TO_ENUM(MKMapType, NSUInteger, x)
#define is_value_MKMapType(x) IS_ENUM(MKMapType, NSUInteger, x)

#define js_value_MKErrorCode(x) JS_ENUM(MKErrorCode, NSUInteger, x)
#define to_value_MKErrorCode(x) TO_ENUM(MKErrorCode, NSUInteger, x)
#define is_value_MKErrorCode(x) IS_ENUM(MKErrorCode, NSUInteger, x)

#define js_value_MKFeatureVisibility(x) JS_ENUM(MKFeatureVisibility, NSInteger, x)
#define to_value_MKFeatureVisibility(x) TO_ENUM(MKFeatureVisibility, NSInteger, x)
#define is_value_MKFeatureVisibility(x) IS_ENUM(MKFeatureVisibility, NSInteger, x)


JS_WRAP_CLASS(MKMapView, UIView);
// global functions
  JS_GLOBAL_METHOD(MKCoordinateSpanMake);
  JS_GLOBAL_METHOD(MKCoordinateRegionMake);
  JS_GLOBAL_METHOD(MKCoordinateRegionMakeWithDistance);

// MKMapView
  JS_METHOD(setRegionAnimated);
  JS_METHOD(setCenterCoordinateAnimated);
  JS_METHOD(regionThatFits);
  JS_METHOD(setVisibleMapRectAnimated);
  JS_METHOD(mapRectThatFits);
  JS_METHOD(setVisibleMapRectEdgePaddingAnimated);
  JS_METHOD(mapRectThatFitsEdgePadding);
  JS_METHOD(setCameraAnimated);
  JS_METHOD(convertCoordinateToPointToView);
  JS_METHOD(convertPointToCoordinateFromView);
  JS_METHOD(convertRegionToRectToView);
  JS_METHOD(convertRectToRegionFromView);
  JS_METHOD(setUserTrackingModeAnimated);
  JS_METHOD(addAnnotation);
  JS_METHOD(addAnnotations);
  JS_METHOD(removeAnnotation);
  JS_METHOD(removeAnnotations);
  JS_METHOD(annotationsInMapRect);
  JS_METHOD(viewForAnnotation);
  JS_METHOD(dequeueReusableAnnotationViewWithIdentifier);
  JS_METHOD(dequeueReusableAnnotationViewWithIdentifierForAnnotation);
  JS_METHOD(registerClassForAnnotationViewWithReuseIdentifier);
  JS_METHOD(selectAnnotationAnimated);
  JS_METHOD(deselectAnnotationAnimated);
  JS_METHOD(showAnnotationsAnimated);
  JS_METHOD(addOverlayLevel);
  JS_METHOD(addOverlaysLevel);
  JS_METHOD(removeOverlay);
  JS_METHOD(removeOverlays);
  JS_METHOD(insertOverlayAtIndexLevel);
  JS_METHOD(insertOverlayAboveOverlay);
  JS_METHOD(insertOverlayBelowOverlay);
  JS_METHOD(exchangeOverlayWithOverlay);
  JS_METHOD(overlaysInLevel);
  JS_METHOD(rendererForOverlay);
  JS_METHOD(viewForOverlay);
  JS_METHOD(addOverlay);
  JS_METHOD(addOverlays);
  JS_METHOD(insertOverlayAtIndex);
  JS_METHOD(exchangeOverlayAtIndexWithOverlayAtIndex);
  JS_PROP(delegate);
  JS_PROP(mapType);
  JS_PROP(region);
  JS_PROP(centerCoordinate);
  JS_PROP(visibleMapRect);
  JS_PROP(camera);
  JS_PROP(isZoomEnabled);
  JS_PROP(isScrollEnabled);
  JS_PROP(isRotateEnabled);
  JS_PROP(isPitchEnabled);
#if !TARGET_OS_IPHONE
  JS_PROP(showsZoomControls);
#endif
  JS_PROP(showsCompass);
  JS_PROP(showsScale);
  JS_PROP(showsPointsOfInterest);
  JS_PROP(showsBuildings);
  JS_PROP(showsTraffic);
  JS_PROP(showsUserLocation);
  JS_PROP_READONLY(userLocation);
  JS_PROP(userTrackingMode);
  JS_PROP_READONLY(isUserLocationVisible);
  JS_PROP_READONLY(annotations);
  JS_PROP(selectedAnnotations);
  JS_PROP_READONLY(annotationVisibleRect);
  JS_PROP_READONLY(overlays);
JS_WRAP_CLASS_END(MKMapView);

#endif /* NMKMapView_h */
