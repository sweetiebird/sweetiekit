//
//  MKMapView.mm
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKMapView.h"
#import <MapKit/MKMapView.h>

#define instancetype MKMapView
#define js_value_instancetype js_value_MKMapView

Local<Value> js_value_MKMapPoint(const MKMapPoint& pt) {
  Nan::EscapableHandleScope scope;
  auto result = Nan::New<Object>();
  Nan::Set(result, JS_STR("x"), JS_NUM(pt.x));
  Nan::Set(result, JS_STR("y"), JS_NUM(pt.y));
  return scope.Escape(result);
}

Local<Value> js_value_MKMapSize(const MKMapSize& size) {
  Nan::EscapableHandleScope scope;
  auto result = Nan::New<Object>();
  Nan::Set(result, JS_STR("width"), JS_NUM(size.width));
  Nan::Set(result, JS_STR("height"), JS_NUM(size.height));
  return scope.Escape(result);
}

Local<Value> js_value_MKMapRect(const MKMapRect& rect) {
  Nan::EscapableHandleScope scope;
  auto result = Nan::New<Object>();
  Nan::Set(result, JS_STR("x"), JS_NUM(rect.origin.x));
  Nan::Set(result, JS_STR("y"), JS_NUM(rect.origin.y));
  Nan::Set(result, JS_STR("width"), JS_NUM(rect.size.width));
  Nan::Set(result, JS_STR("height"), JS_NUM(rect.size.height));
  return scope.Escape(result);
}

#include "NCLLocation.h"

Local<Value> js_value_MKCoordinateSpan(const MKCoordinateSpan& value) {
  Nan::EscapableHandleScope scope;
  auto result = Nan::New<Object>();
  Nan::Set(result, JS_STR("latitudeDelta"), js_value_CLLocationDegrees(value.latitudeDelta));
  Nan::Set(result, JS_STR("longitudeDelta"), js_value_CLLocationDegrees(value.longitudeDelta));
  return scope.Escape(result);
}

Local<Value> js_value_MKCoordinateRegion(const MKCoordinateRegion& value) {
  Nan::EscapableHandleScope scope;
  auto result = Nan::New<Object>();
  Nan::Set(result, JS_STR("center"), js_value_CLLocationCoordinate2D(value.center));
  Nan::Set(result, JS_STR("span"), js_value_MKCoordinateSpan(value.span));
  return scope.Escape(result);
}

MKMapPoint to_value_MKMapPoint(const Local<Value>& value, bool* _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  if (!is_value_MKMapPoint(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("to_value_MKMapPoint: expected an MKMapPoint");
    }
    return MKMapPointMake(0, 0);
  }
  return MKMapPointMake(
    TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x"))),
    TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")))
  );
}

MKMapSize to_value_MKMapSize(const Local<Value>& value, bool* _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  if (!is_value_MKMapSize(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("to_value_MKMapSize: expected an MKMapSize");
    }
    return MKMapSizeMake(0, 0);
  }
  return MKMapSizeMake(
    TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width"))),
    TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")))
  );
}

MKMapRect to_value_MKMapRect(const Local<Value>& value, bool* _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  if (!is_value_MKMapRect(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("to_value_MKMapRect: expected an MKMapRect");
    }
    return MKMapRectMake(0, 0, 0, 0);
  }
  return MKMapRectMake(
    TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x"))),
    TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y"))),
    TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width"))),
    TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")))
  );
}

MKCoordinateSpan to_value_MKCoordinateSpan(Local<Value> value, bool* _Nullable failed) {
  MKCoordinateSpan result;
  result.latitudeDelta = 0;
  result.longitudeDelta = 0;
  if (failed) {
    *failed = false;
  }
  if (!is_value_MKCoordinateSpan(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("to_value_MKCoordinateSpan: expected an MKCoordinateSpan");
    }
    return result;
  }
  result.latitudeDelta = to_value_CLLocationDegrees(JS_OBJ(value)->Get(JS_STR("latitudeDelta")));
  result.longitudeDelta = to_value_CLLocationDegrees(JS_OBJ(value)->Get(JS_STR("longitudeDelta")));
  return result;
}

MKCoordinateRegion to_value_MKCoordinateRegion(Local<Value> value, bool* _Nullable failed) {
  MKCoordinateRegion result;
  result.center = kCLLocationCoordinate2DInvalid;
  result.span.latitudeDelta = 0;
  result.span.longitudeDelta = 0;
  if (failed) {
    *failed = false;
  }
  if (!is_value_MKCoordinateRegion(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("to_value_MKCoordinateRegion: expected an MKCoordinateRegion");
    }
    return result;
  }
  result.center = to_value_CLLocationCoordinate2D(JS_OBJ(value)->Get(JS_STR("center")));
  result.span = to_value_MKCoordinateSpan(JS_OBJ(value)->Get(JS_STR("span")));
  return result;
}

bool is_value_MKMapPoint(const Local<Value>& value) {
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("x"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("y"))->IsNumber()) {
    return false;
  }
  return true;
}

bool is_value_MKMapSize(const Local<Value>& value) {
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("width"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("height"))->IsNumber()) {
    return false;
  }
  return true;
}

bool is_value_MKMapRect(const Local<Value>& value) {
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> obj(JS_OBJ(value));
  if (!obj->Get(JS_STR("x"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("y"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("width"))->IsNumber()) {
    return false;
  }
  if (!obj->Get(JS_STR("height"))->IsNumber()) {
    return false;
  }
  return true;
}

/*
typedef struct {
    CLLocationDegrees latitudeDelta;
    CLLocationDegrees longitudeDelta;
} MKCoordinateSpan;
*/
bool is_value_MKCoordinateSpan(const Local<Value>& value) {
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> obj(JS_OBJ(value));
  if (!is_value_CLLocationDegrees(obj->Get(JS_STR("latitudeDelta")))) {
    return false;
  }
  if (!is_value_CLLocationDegrees(obj->Get(JS_STR("longitudeDelta")))) {
    return false;
  }
  return true;
}

/*
typedef struct {
  CLLocationCoordinate2D center;
  MKCoordinateSpan span;
} MKCoordinateRegion;
*/
bool is_value_MKCoordinateRegion(const Local<Value>& value) {
  if (!value->IsObject()) {
    return false;
  }
  Local<Object> obj(JS_OBJ(value));
  if (!is_value_CLLocationCoordinate2D(obj->Get(JS_STR("center")))) {
    return false;
  }
  if (!is_value_MKCoordinateSpan(obj->Get(JS_STR("span")))) {
    return false;
  }
  return true;
}

NMKMapView::NMKMapView() {}
NMKMapView::~NMKMapView() {}

JS_INIT_CLASS(MKMapView, UIView);
  // global functions
  JS_SET_METHOD(exports, "MKCoordinateSpanMake", MKCoordinateSpanMake);
  JS_SET_METHOD(exports, "MKCoordinateRegionMake", MKCoordinateRegionMake);
  JS_SET_METHOD(exports, "MKCoordinateRegionMakeWithDistance", MKCoordinateRegionMakeWithDistance);
  
// MKMapView
  JS_ASSIGN_PROTO_METHOD(setRegionAnimated);
  JS_ASSIGN_PROTO_METHOD(setCenterCoordinateAnimated);
  JS_ASSIGN_PROTO_METHOD(regionThatFits);
  JS_ASSIGN_PROTO_METHOD(setVisibleMapRectAnimated);
  JS_ASSIGN_PROTO_METHOD(mapRectThatFits);
  JS_ASSIGN_PROTO_METHOD(setVisibleMapRectEdgePaddingAnimated);
  JS_ASSIGN_PROTO_METHOD(mapRectThatFitsEdgePadding);
  JS_ASSIGN_PROTO_METHOD(setVisibleMapRectEdgePaddingAnimated);
  JS_ASSIGN_PROTO_METHOD(mapRectThatFitsEdgePadding);
  JS_ASSIGN_PROTO_METHOD(setCameraAnimated);
  JS_ASSIGN_PROTO_METHOD(convertCoordinateToPointToView);
  JS_ASSIGN_PROTO_METHOD(convertPointToCoordinateFromView);
  JS_ASSIGN_PROTO_METHOD(convertRegionToRectToView);
  JS_ASSIGN_PROTO_METHOD(convertRectToRegionFromView);
  JS_ASSIGN_PROTO_METHOD(setUserTrackingModeAnimated);
  JS_ASSIGN_PROTO_METHOD(addAnnotation);
  JS_ASSIGN_PROTO_METHOD(addAnnotations);
  JS_ASSIGN_PROTO_METHOD(removeAnnotation);
  JS_ASSIGN_PROTO_METHOD(removeAnnotations);
  JS_ASSIGN_PROTO_METHOD(annotationsInMapRect);
  JS_ASSIGN_PROTO_METHOD(viewForAnnotation);
  JS_ASSIGN_PROTO_METHOD(dequeueReusableAnnotationViewWithIdentifier);
  JS_ASSIGN_PROTO_METHOD(dequeueReusableAnnotationViewWithIdentifierForAnnotation);
  JS_ASSIGN_PROTO_METHOD(registerClassForAnnotationViewWithReuseIdentifier);
  JS_ASSIGN_PROTO_METHOD(selectAnnotationAnimated);
  JS_ASSIGN_PROTO_METHOD(deselectAnnotationAnimated);
  JS_ASSIGN_PROTO_METHOD(showAnnotationsAnimated);
  JS_ASSIGN_PROTO_METHOD(addOverlayLevel);
  JS_ASSIGN_PROTO_METHOD(addOverlaysLevel);
  JS_ASSIGN_PROTO_METHOD(removeOverlay);
  JS_ASSIGN_PROTO_METHOD(removeOverlays);
  JS_ASSIGN_PROTO_METHOD(insertOverlayAtIndexLevel);
  JS_ASSIGN_PROTO_METHOD(insertOverlayAboveOverlay);
  JS_ASSIGN_PROTO_METHOD(insertOverlayBelowOverlay);
  JS_ASSIGN_PROTO_METHOD(exchangeOverlayWithOverlay);
  JS_ASSIGN_PROTO_METHOD(overlaysInLevel);
  JS_ASSIGN_PROTO_METHOD(rendererForOverlay);
  JS_ASSIGN_PROTO_METHOD(viewForOverlay);
  JS_ASSIGN_PROTO_METHOD(addOverlay);
  JS_ASSIGN_PROTO_METHOD(addOverlays);
  JS_ASSIGN_PROTO_METHOD(insertOverlayAtIndex);
  JS_ASSIGN_PROTO_METHOD(exchangeOverlayAtIndexWithOverlayAtIndex);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(mapType);
  JS_ASSIGN_PROTO_PROP(region);
  JS_ASSIGN_PROTO_PROP(centerCoordinate);
  JS_ASSIGN_PROTO_PROP(visibleMapRect);
  JS_ASSIGN_PROTO_PROP(camera);
  JS_ASSIGN_PROTO_PROP(isZoomEnabled);
  JS_ASSIGN_PROTO_PROP(isScrollEnabled);
  JS_ASSIGN_PROTO_PROP(isRotateEnabled);
  JS_ASSIGN_PROTO_PROP(isPitchEnabled);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_PROP(showsZoomControls);
#endif
  JS_ASSIGN_PROTO_PROP(showsCompass);
  JS_ASSIGN_PROTO_PROP(showsScale);
  JS_ASSIGN_PROTO_PROP(showsPointsOfInterest);
  JS_ASSIGN_PROTO_PROP(showsBuildings);
  JS_ASSIGN_PROTO_PROP(showsTraffic);
  JS_ASSIGN_PROTO_PROP(showsUserLocation);
  JS_ASSIGN_PROTO_PROP_READONLY(userLocation);
  JS_ASSIGN_PROTO_PROP(userTrackingMode);
  JS_ASSIGN_PROTO_PROP_READONLY(isUserLocationVisible);
  JS_ASSIGN_PROTO_PROP_READONLY(annotations);
  JS_ASSIGN_PROTO_PROP(selectedAnnotations);
  JS_ASSIGN_PROTO_PROP_READONLY(annotationVisibleRect);
  JS_ASSIGN_PROTO_PROP_READONLY(overlays);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MKMapView, UIView);
  
  // constants (exports)
  
  //typedef NS_ENUM(NSInteger, MKUserTrackingMode) {
    JS_ASSIGN_ENUM(MKUserTrackingModeNone, NSInteger); // = 0, // the user's location is not followed
    JS_ASSIGN_ENUM(MKUserTrackingModeFollow, NSInteger); //, // the map follows the user's location
    JS_ASSIGN_ENUM(MKUserTrackingModeFollowWithHeading, NSInteger); // __TVOS_PROHIBITED, // the map follows the user's location and heading
  //} NS_ENUM_AVAILABLE(NA, 5_0) __TVOS_AVAILABLE(9_2) __WATCHOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, MKOverlayLevel) {
    JS_ASSIGN_ENUM(MKOverlayLevelAboveRoads, NSInteger); // = 0, // note that labels include shields and point of interest icons.
    JS_ASSIGN_ENUM(MKOverlayLevelAboveLabels, NSInteger); //
  //} NS_ENUM_AVAILABLE(10_9, 7_0) __TVOS_AVAILABLE(9_2) __WATCHOS_PROHIBITED;

  JS_ASSIGN_ENUM(MKErrorDomain, NSString); // __TVOS_AVAILABLE(9_2);

  //typedef NS_ENUM(NSUInteger, MKMapType) {
    JS_ASSIGN_ENUM(MKMapTypeStandard, NSInteger); // = 0,
    JS_ASSIGN_ENUM(MKMapTypeSatellite, NSInteger);
    JS_ASSIGN_ENUM(MKMapTypeHybrid, NSInteger);
    JS_ASSIGN_ENUM(MKMapTypeSatelliteFlyover, NSInteger); // NS_ENUM_AVAILABLE(10_11, 9_0),
    JS_ASSIGN_ENUM(MKMapTypeHybridFlyover, NSInteger); // NS_ENUM_AVAILABLE(10_11, 9_0),
    JS_ASSIGN_ENUM(MKMapTypeMutedStandard, NSInteger); // NS_ENUM_AVAILABLE(10_13, 11_0) __TVOS_AVAILABLE(11_0),
  //} NS_ENUM_AVAILABLE(10_9, 3_0) __TVOS_AVAILABLE(9_2) __WATCHOS_PROHIBITED;

  //typedef NS_ENUM(NSUInteger, MKErrorCode) {
    JS_ASSIGN_ENUM(MKErrorUnknown, NSInteger); // = 1,
    JS_ASSIGN_ENUM(MKErrorServerFailure, NSInteger);
    JS_ASSIGN_ENUM(MKErrorLoadingThrottled, NSInteger);
    JS_ASSIGN_ENUM(MKErrorPlacemarkNotFound, NSInteger);
    JS_ASSIGN_ENUM(MKErrorDirectionsNotFound, NSInteger); // NS_ENUM_AVAILABLE(10_9, 7_0)
  //} NS_ENUM_AVAILABLE(10_9, 3_0) __TVOS_AVAILABLE(9_2) __WATCHOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, MKFeatureVisibility) {
    JS_ASSIGN_ENUM(MKFeatureVisibilityAdaptive, NSInteger);
    JS_ASSIGN_ENUM(MKFeatureVisibilityHidden, NSInteger);
    JS_ASSIGN_ENUM(MKFeatureVisibilityVisible, NSInteger);
  //} NS_AVAILABLE_IOS(11_0) __TVOS_AVAILABLE(11_0) __WATCHOS_PROHIBITED;

JS_INIT_CLASS_END(MKMapView, UIView);

NAN_METHOD(NMKMapView::New) {
  JS_RECONSTRUCT(MKMapView);
  @autoreleasepool {
    MKMapView* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MKMapView *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[MKMapView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[MKMapView alloc] init];
    }
    if (self) {
      NMKMapView *wrapper = new NMKMapView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MKMapView::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMKMapView::MKCoordinateSpanMake) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationDegrees, latitudeDelta);
    declare_value(CLLocationDegrees, longitudeDelta);
    JS_SET_RETURN(js_value_MKCoordinateSpan(::MKCoordinateSpanMake(latitudeDelta, longitudeDelta)));
  }
}

// NS_INLINE MKCoordinateRegion MKCoordinateRegionMake(CLLocationCoordinate2D centerCoordinate, MKCoordinateSpan span)

NAN_METHOD(NMKMapView::MKCoordinateRegionMake) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, centerCoordinate);
    declare_value(MKCoordinateSpan, span);
    JS_SET_RETURN(js_value_MKCoordinateRegion(::MKCoordinateRegionMake(centerCoordinate, span)));
  }
}

// MK_EXTERN MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters) __TVOS_AVAILABLE(9_2);

NAN_METHOD(NMKMapView::MKCoordinateRegionMakeWithDistance) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, centerCoordinate);
    declare_value(CLLocationDistance, latitudinalMeters);
    declare_value(CLLocationDistance, longitudinalMeters);
    JS_SET_RETURN(js_value_MKCoordinateRegion(::MKCoordinateRegionMakeWithDistance(centerCoordinate, latitudinalMeters, longitudinalMeters)));
  }
}

NAN_METHOD(NMKMapView::setRegionAnimated) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKCoordinateRegion, region);
    declare_value(BOOL, animated);
    [self setRegion: region animated: animated];
  }
}

NAN_METHOD(NMKMapView::setCenterCoordinateAnimated) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, coordinate);
    declare_value(BOOL, animated);
    [self setCenterCoordinate: coordinate animated: animated];
  }
}

NAN_METHOD(NMKMapView::regionThatFits) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKCoordinateRegion, region);
    JS_SET_RETURN(js_value_MKCoordinateRegion([self regionThatFits: region]));
  }
}

NAN_METHOD(NMKMapView::setVisibleMapRectAnimated) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    declare_value(BOOL, animate);
    [self setVisibleMapRect: mapRect animated: animate];
  }
}

NAN_METHOD(NMKMapView::mapRectThatFits) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    JS_SET_RETURN(js_value_MKMapRect([self mapRectThatFits: mapRect]));
  }
}

NAN_METHOD(NMKMapView::setVisibleMapRectEdgePaddingAnimated) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    declare_value(UIEdgeInsets, insets);
    declare_value(BOOL, animate);
    [self setVisibleMapRect: mapRect edgePadding: insets animated: animate];
  }
}

NAN_METHOD(NMKMapView::mapRectThatFitsEdgePadding) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    declare_value(UIEdgeInsets, insets);
    JS_SET_RETURN(js_value_MKMapRect([self mapRectThatFits: mapRect edgePadding: insets]));
  }
}

#include "NMKMapCamera.h"

NAN_METHOD(NMKMapView::setCameraAnimated) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MKMapCamera, camera);
    declare_value(BOOL, animated);
    [self setCamera: camera animated: animated];
  }
}

NAN_METHOD(NMKMapView::convertCoordinateToPointToView) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, coordinate);
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGPoint([self convertCoordinate: coordinate toPointToView: view]));
  }
}

NAN_METHOD(NMKMapView::convertPointToCoordinateFromView) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_CLLocationCoordinate2D([self convertPoint: point toCoordinateFromView: view]));
  }
}

NAN_METHOD(NMKMapView::convertRegionToRectToView) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKCoordinateRegion, region);
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGRect([self convertRegion: region toRectToView: view]));
  }
}

NAN_METHOD(NMKMapView::convertRectToRegionFromView) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_MKCoordinateRegion([self convertRect: rect toRegionFromView: view]));
  }
}

NAN_METHOD(NMKMapView::setUserTrackingModeAnimated) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKUserTrackingMode, mode);
    declare_value(BOOL, animated);
    [self setUserTrackingMode: mode animated: animated];
  }
}

NAN_METHOD(NMKMapView::addAnnotation) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKAnnotation>*/, annotation);
    [self addAnnotation: annotation];
  }
}

NAN_METHOD(NMKMapView::addAnnotations) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<id/* <MKAnnotation>*/>, annotations);
    [self addAnnotations: annotations];
  }
}

NAN_METHOD(NMKMapView::removeAnnotation) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKAnnotation>*/, annotation);
    [self removeAnnotation: annotation];
  }
}

NAN_METHOD(NMKMapView::removeAnnotations) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<id<MKAnnotation>>, annotations);
    [self removeAnnotations: annotations];
  }
}

NAN_METHOD(NMKMapView::annotationsInMapRect) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKMapRect, mapRect);
    JS_SET_RETURN(js_value_NSSet/* <id<MKAnnotation>>*/([self annotationsInMapRect: mapRect]));
  }
}

#include "NMKAnnotationView.h"

NAN_METHOD(NMKMapView::viewForAnnotation) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKAnnotation>*/, annotation);
    JS_SET_RETURN(js_value_MKAnnotationView([self viewForAnnotation: annotation]));
  }
}

NAN_METHOD(NMKMapView::dequeueReusableAnnotationViewWithIdentifier) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, identifier);
    JS_SET_RETURN(js_value_MKAnnotationView([self dequeueReusableAnnotationViewWithIdentifier: identifier]));
  }
}

NAN_METHOD(NMKMapView::dequeueReusableAnnotationViewWithIdentifierForAnnotation) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, identifier);
    declare_value(id/* <MKAnnotation>*/, annotation);
    JS_SET_RETURN(js_value_MKAnnotationView([self dequeueReusableAnnotationViewWithIdentifier: identifier forAnnotation: annotation]));
  }
}

NAN_METHOD(NMKMapView::registerClassForAnnotationViewWithReuseIdentifier) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id /*Class*/, viewClass);
    declare_pointer(NSString, identifier);
    [self registerClass: viewClass forAnnotationViewWithReuseIdentifier: identifier];
  }
}

NAN_METHOD(NMKMapView::selectAnnotationAnimated) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKAnnotation>*/, annotation);
    declare_value(BOOL, animated);
    [self selectAnnotation: annotation animated: animated];
  }
}

NAN_METHOD(NMKMapView::deselectAnnotationAnimated) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* <MKAnnotation>*/, annotation);
    declare_value(BOOL, animated);
    [self deselectAnnotation: annotation animated: animated];
  }
}

NAN_METHOD(NMKMapView::showAnnotationsAnimated) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<id/* <MKAnnotation>*/>, annotations);
    declare_value(BOOL, animated);
    [self showAnnotations: annotations animated: animated];
  }
}

NAN_METHOD(NMKMapView::addOverlayLevel) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay);
    declare_value(MKOverlayLevel, level);
    [self addOverlay: overlay level: level];
  }
}

NAN_METHOD(NMKMapView::addOverlaysLevel) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<id<MKOverlay>>, overlays);
    declare_value(MKOverlayLevel, level);
    [self addOverlays: overlays level: level];
  }
}

NAN_METHOD(NMKMapView::removeOverlay) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay);
    [self removeOverlay: overlay];
  }
}

NAN_METHOD(NMKMapView::removeOverlays) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<id<MKOverlay>>, overlays);
    [self removeOverlays: overlays];
  }
}

NAN_METHOD(NMKMapView::insertOverlayAtIndexLevel) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay);
    declare_value(NSUInteger, index);
    declare_value(MKOverlayLevel, level);
    [self insertOverlay: overlay atIndex: index level: level];
  }
}

NAN_METHOD(NMKMapView::insertOverlayAboveOverlay) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay);
    declare_value(id/* <MKOverlay>*/, sibling);
    [self insertOverlay: overlay aboveOverlay: sibling];
  }
}

NAN_METHOD(NMKMapView::insertOverlayBelowOverlay) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay);
    declare_value(id/* <MKOverlay>*/, sibling);
    [self insertOverlay: overlay belowOverlay: sibling];
  }
}

NAN_METHOD(NMKMapView::exchangeOverlayWithOverlay) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay1);
    declare_value(id/* <MKOverlay>*/, overlay2);
    [self exchangeOverlay: overlay1 withOverlay: overlay2];
  }
}

NAN_METHOD(NMKMapView::overlaysInLevel) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MKOverlayLevel, level);
    JS_SET_RETURN(js_value_NSArray<id/* <MKOverlay>*/>([self overlaysInLevel: level]));
  }
}

#include "NMKOverlayRenderer.h"

NAN_METHOD(NMKMapView::rendererForOverlay) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay);
    JS_SET_RETURN(js_value_MKOverlayRenderer([self rendererForOverlay: overlay]));
  }
}

#include "NMKOverlayView.h"

NAN_METHOD(NMKMapView::viewForOverlay) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay);
    JS_SET_RETURN(js_value_MKOverlayView([self viewForOverlay: overlay]));
  }
}

NAN_METHOD(NMKMapView::addOverlay) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay);
    [self addOverlay: overlay];
  }
}

NAN_METHOD(NMKMapView::addOverlays) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<id/* <MKOverlay>*/>, overlays);
    [self addOverlays: overlays];
  }
}

NAN_METHOD(NMKMapView::insertOverlayAtIndex) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <MKOverlay>*/, overlay);
    declare_value(NSUInteger, index);
    [self insertOverlay: overlay atIndex: index];
  }
}

NAN_METHOD(NMKMapView::exchangeOverlayAtIndexWithOverlayAtIndex) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, index1);
    declare_value(NSUInteger, index2);
    [self exchangeOverlayAtIndex: index1 withOverlayAtIndex: index2];
  }
}

NAN_GETTER(NMKMapView::delegateGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <MKMapViewDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NMKMapView::delegateSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <MKMapViewDelegate>*/, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NMKMapView::delegate"];
  }
}

NAN_GETTER(NMKMapView::mapTypeGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MKMapType([self mapType]));
  }
}

NAN_SETTER(NMKMapView::mapTypeSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MKMapType, input);
    [self setMapType: input];
  }
}

NAN_GETTER(NMKMapView::regionGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MKCoordinateRegion([self region]));
  }
}

NAN_SETTER(NMKMapView::regionSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MKCoordinateRegion, input);
    [self setRegion: input];
  }
}

NAN_GETTER(NMKMapView::centerCoordinateGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationCoordinate2D([self centerCoordinate]));
  }
}

NAN_SETTER(NMKMapView::centerCoordinateSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CLLocationCoordinate2D, input);
    [self setCenterCoordinate: input];
  }
}

NAN_GETTER(NMKMapView::visibleMapRectGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MKMapRect([self visibleMapRect]));
  }
}

NAN_SETTER(NMKMapView::visibleMapRectSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MKMapRect, input);
    [self setVisibleMapRect: input];
  }
}

NAN_GETTER(NMKMapView::cameraGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MKMapCamera([self camera]));
  }
}

NAN_SETTER(NMKMapView::cameraSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MKMapCamera, input);
    [self setCamera: input];
  }
}

NAN_GETTER(NMKMapView::isZoomEnabledGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isZoomEnabled]));
  }
}

NAN_SETTER(NMKMapView::isZoomEnabledSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setZoomEnabled: input];
  }
}

NAN_GETTER(NMKMapView::isScrollEnabledGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isScrollEnabled]));
  }
}

NAN_SETTER(NMKMapView::isScrollEnabledSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setScrollEnabled: input];
  }
}

NAN_GETTER(NMKMapView::isRotateEnabledGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRotateEnabled]));
  }
}

NAN_SETTER(NMKMapView::isRotateEnabledSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setRotateEnabled: input];
  }
}

NAN_GETTER(NMKMapView::isPitchEnabledGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPitchEnabled]));
  }
}

NAN_SETTER(NMKMapView::isPitchEnabledSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPitchEnabled: input];
  }
}

#if !TARGET_OS_IPHONE
NAN_GETTER(NMKMapView::showsZoomControlsGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsZoomControls]));
  }
}

NAN_SETTER(NMKMapView::showsZoomControlsSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsZoomControls: input];
  }
}
#endif

NAN_GETTER(NMKMapView::showsCompassGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsCompass]));
  }
}

NAN_SETTER(NMKMapView::showsCompassSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsCompass: input];
  }
}

NAN_GETTER(NMKMapView::showsScaleGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsScale]));
  }
}

NAN_SETTER(NMKMapView::showsScaleSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsScale: input];
  }
}

NAN_GETTER(NMKMapView::showsPointsOfInterestGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsPointsOfInterest]));
  }
}

NAN_SETTER(NMKMapView::showsPointsOfInterestSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsPointsOfInterest: input];
  }
}

NAN_GETTER(NMKMapView::showsBuildingsGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsBuildings]));
  }
}

NAN_SETTER(NMKMapView::showsBuildingsSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsBuildings: input];
  }
}

NAN_GETTER(NMKMapView::showsTrafficGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsTraffic]));
  }
}

NAN_SETTER(NMKMapView::showsTrafficSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsTraffic: input];
  }
}

NAN_GETTER(NMKMapView::showsUserLocationGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsUserLocation]));
  }
}

NAN_SETTER(NMKMapView::showsUserLocationSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsUserLocation: input];
  }
}

#include "NMKUserLocation.h"

NAN_GETTER(NMKMapView::userLocationGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MKUserLocation([self userLocation]));
  }
}

NAN_GETTER(NMKMapView::userTrackingModeGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MKUserTrackingMode([self userTrackingMode]));
  }
}

NAN_SETTER(NMKMapView::userTrackingModeSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MKUserTrackingMode, input);
    [self setUserTrackingMode: input];
  }
}

NAN_GETTER(NMKMapView::isUserLocationVisibleGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isUserLocationVisible]));
  }
}

NAN_GETTER(NMKMapView::annotationsGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<id<MKAnnotation>>([self annotations]));
  }
}

NAN_GETTER(NMKMapView::selectedAnnotationsGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<id<MKAnnotation>>([self selectedAnnotations]));
  }
}

NAN_SETTER(NMKMapView::selectedAnnotationsSetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<id<MKAnnotation>>, input);
    [self setSelectedAnnotations: input];
  }
}

NAN_GETTER(NMKMapView::annotationVisibleRectGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self annotationVisibleRect]));
  }
}

NAN_GETTER(NMKMapView::overlaysGetter) {
  JS_UNWRAP(MKMapView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<id<MKOverlay>>([self overlays]));
  }
}
