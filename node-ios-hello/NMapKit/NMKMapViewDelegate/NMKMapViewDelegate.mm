//
//  MKMapViewDelegate.mm
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKMapViewDelegate.h"

NMKMapViewDelegate::NMKMapViewDelegate () {}
NMKMapViewDelegate::~NMKMapViewDelegate () {}

JS_INIT_CLASS(MKMapViewDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(mapViewRegionWillChangeAnimated);
  JS_ASSIGN_PROTO_PROP(mapViewRegionDidChangeAnimated);
  JS_ASSIGN_PROTO_PROP(mapViewDidChangeVisibleRegion);
  JS_ASSIGN_PROTO_PROP(mapViewWillStartLoadingMap);
  JS_ASSIGN_PROTO_PROP(mapViewDidFinishLoadingMap);
  JS_ASSIGN_PROTO_PROP(mapViewDidFailLoadingMapWithError);
  JS_ASSIGN_PROTO_PROP(mapViewWillStartRenderingMap);
  JS_ASSIGN_PROTO_PROP(mapViewDidFinishRenderingMapFullyRendered);
  JS_ASSIGN_PROTO_PROP(mapViewViewForAnnotation);
  JS_ASSIGN_PROTO_PROP(mapViewDidAddAnnotationViews);
  JS_ASSIGN_PROTO_PROP(mapViewAnnotationViewCalloutAccessoryControlTapped);
  JS_ASSIGN_PROTO_PROP(mapViewDidSelectAnnotationView);
  JS_ASSIGN_PROTO_PROP(mapViewDidDeselectAnnotationView);
  JS_ASSIGN_PROTO_PROP(mapViewWillStartLocatingUser);
  JS_ASSIGN_PROTO_PROP(mapViewDidStopLocatingUser);
  JS_ASSIGN_PROTO_PROP(mapViewDidUpdateUserLocation);
  JS_ASSIGN_PROTO_PROP(mapViewDidFailToLocateUserWithError);
  JS_ASSIGN_PROTO_PROP(mapViewAnnotationViewDidChangeDragStateFromOldState);
  JS_ASSIGN_PROTO_PROP(mapViewDidChangeUserTrackingModeAnimated);
  JS_ASSIGN_PROTO_PROP(mapViewRendererForOverlay);
  JS_ASSIGN_PROTO_PROP(mapViewDidAddOverlayRenderers);
  JS_ASSIGN_PROTO_PROP(mapViewViewForOverlay);
  JS_ASSIGN_PROTO_PROP(mapViewDidAddOverlayViews);
  JS_ASSIGN_PROTO_PROP(mapViewClusterAnnotationForMemberAnnotations);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MKMapViewDelegate, NSObject);
JS_INIT_CLASS_END(MKMapViewDelegate, NSObject);

NAN_METHOD(NMKMapViewDelegate::New) {
  JS_RECONSTRUCT(MKMapViewDelegate);
  @autoreleasepool {
    MKMapViewDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MKMapViewDelegate *)(info[0].As<External>()->Value());
    } else if (info[0]->IsObject()) {
      Local<Value> that(JS_NEW(NMKMapViewDelegate, 0, nullptr));
      sweetiekit::JSFunction objectAssign(JS_OBJ(JS_GLOBAL()->Get(JS_STR("Object")))->Get(JS_STR("assign")));
      objectAssign("NMKMapViewDelegate::New", that, info[0]);
      JS_SET_RETURN(that);
      return;
    } else if (info.Length() <= 0) {
      self = [[MKMapViewDelegate alloc] init];
    }
    if (self) {
      NMKMapViewDelegate *wrapper = new NMKMapViewDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MKMapViewDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(MKMapViewDelegate, mapViewRegionWillChangeAnimated);
DELEGATE_PROP(MKMapViewDelegate, mapViewRegionDidChangeAnimated);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidChangeVisibleRegion);
DELEGATE_PROP(MKMapViewDelegate, mapViewWillStartLoadingMap);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidFinishLoadingMap);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidFailLoadingMapWithError);
DELEGATE_PROP(MKMapViewDelegate, mapViewWillStartRenderingMap);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidFinishRenderingMapFullyRendered);
DELEGATE_PROP(MKMapViewDelegate, mapViewViewForAnnotation);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidAddAnnotationViews);
DELEGATE_PROP(MKMapViewDelegate, mapViewAnnotationViewCalloutAccessoryControlTapped);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidSelectAnnotationView);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidDeselectAnnotationView);
DELEGATE_PROP(MKMapViewDelegate, mapViewWillStartLocatingUser);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidStopLocatingUser);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidUpdateUserLocation);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidFailToLocateUserWithError);
DELEGATE_PROP(MKMapViewDelegate, mapViewAnnotationViewDidChangeDragStateFromOldState);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidChangeUserTrackingModeAnimated);
DELEGATE_PROP(MKMapViewDelegate, mapViewRendererForOverlay);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidAddOverlayRenderers);
DELEGATE_PROP(MKMapViewDelegate, mapViewViewForOverlay);
DELEGATE_PROP(MKMapViewDelegate, mapViewDidAddOverlayViews);
DELEGATE_PROP(MKMapViewDelegate, mapViewClusterAnnotationForMemberAnnotations);

#include "NMKMapView.h"
#include "NNSError.h"
#include "NMKAnnotationView.h"
#include "NUIControl.h"
#include "NMKUserLocation.h"
#include "NMKClusterAnnotation.h"

@implementation MKMapViewDelegate
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
  call_delegate(noop(), mapViewRegionWillChangeAnimated,
    js_value_MKMapView(mapView),
    js_value_BOOL(animated));
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
  call_delegate(noop(), mapViewRegionDidChangeAnimated,
    js_value_MKMapView(mapView),
    js_value_BOOL(animated));
}

- (void)mapViewDidChangeVisibleRegion:(MKMapView *)mapView API_AVAILABLE(ios(11), tvos(11), macos(10.13))
{
  call_delegate(noop(), mapViewDidChangeVisibleRegion,
    js_value_MKMapView(mapView));
}

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView
{
  call_delegate(noop(), mapViewWillStartLoadingMap,
    js_value_MKMapView(mapView));
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
  call_delegate(noop(), mapViewDidFinishLoadingMap,
    js_value_MKMapView(mapView));
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error
{
  call_delegate(noop(), mapViewDidFailLoadingMapWithError,
    js_value_MKMapView(mapView),
    js_value_NSError(error));
}

- (void)mapViewWillStartRenderingMap:(MKMapView *)mapView NS_AVAILABLE(10_9, 7_0)
{
  call_delegate(noop(), mapViewWillStartRenderingMap,
    js_value_MKMapView(mapView));
}

- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered NS_AVAILABLE(10_9, 7_0)
{
  call_delegate(noop(), mapViewDidFinishRenderingMapFullyRendered,
    js_value_MKMapView(mapView),
    js_value_BOOL(fullyRendered));
}

// mapView:viewForAnnotation: provides the view for each annotation.
// This method may be called for all or some of the added annotations.
// For MapKit provided annotations (eg. MKUserLocation) return nil to use the MapKit provided annotation view.
- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
  __block MKAnnotationView* result = nil;
  call_delegate(result = to_value_MKAnnotationView(JS_RESULT), mapViewViewForAnnotation,
    js_value_MKMapView(mapView),
    js_value_id/* <MKAnnotation>*/(annotation));
  return result;
}

// mapView:didAddAnnotationViews: is called after the annotation views have been added and positioned in the map.
// The delegate can implement this method to animate the adding of the annotations views.
// Use the current positions of the annotation views as the destinations of the animation.
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views
{
  call_delegate(noop(), mapViewDidAddAnnotationViews,
    js_value_MKMapView(mapView),
    js_value_NSArray<MKAnnotationView *>(views));
}

#if TARGET_OS_IPHONE
// mapView:annotationView:calloutAccessoryControlTapped: is called when the user taps on left & right callout accessory UIControls.
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control __TVOS_PROHIBITED
{
  call_delegate(noop(), mapViewAnnotationViewCalloutAccessoryControlTapped,
    js_value_MKMapView(mapView),
    js_value_MKAnnotationView(view),
    js_value_UIControl(control));
}
#endif

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0)
{
  call_delegate(noop(), mapViewDidSelectAnnotationView,
    js_value_MKMapView(mapView),
    js_value_MKAnnotationView(view));
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0)
{
  call_delegate(noop(), mapViewDidDeselectAnnotationView,
    js_value_MKMapView(mapView),
    js_value_MKAnnotationView(view));
}

- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView NS_AVAILABLE(10_9, 4_0)
{
  call_delegate(noop(), mapViewWillStartLocatingUser,
    js_value_MKMapView(mapView));
}

- (void)mapViewDidStopLocatingUser:(MKMapView *)mapView NS_AVAILABLE(10_9, 4_0)
{
  call_delegate(noop(), mapViewDidStopLocatingUser,
    js_value_MKMapView(mapView));
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(10_9, 4_0)
{
  call_delegate(noop(), mapViewDidUpdateUserLocation,
    js_value_MKMapView(mapView),
    js_value_MKUserLocation(userLocation));
}

- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error NS_AVAILABLE(10_9, 4_0)
{
  call_delegate(noop(), mapViewDidFailToLocateUserWithError,
    js_value_MKMapView(mapView),
    js_value_NSError(error));
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState 
   fromOldState:(MKAnnotationViewDragState)oldState NS_AVAILABLE(10_9, 4_0) __TVOS_PROHIBITED
{
  call_delegate(noop(), mapViewAnnotationViewDidChangeDragStateFromOldState,
    js_value_MKMapView(mapView),
    js_value_MKAnnotationView(view),
    js_value_MKAnnotationViewDragState(newState));
}

#if TARGET_OS_IPHONE
- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated NS_AVAILABLE(NA, 5_0)
{
  call_delegate(noop(), mapViewDidChangeUserTrackingModeAnimated,
    js_value_MKMapView(mapView),
    js_value_MKUserTrackingMode(mode),
    js_value_BOOL(animated));
}
#endif

#if TODO
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay NS_AVAILABLE(10_9, 7_0)
{
  __block MKOverlayRenderer* result = nil;
  call_delegate(result = js_value_MKOverlayRenderer(JS_RESULT), mapViewRendererForOverlay,
    js_value_MKMapView(mapView),
    js_value_id/* <MKOverlay>*/(overlay));
  return result;
}
#endif

- (void)mapView:(MKMapView *)mapView didAddOverlayRenderers:(NSArray<MKOverlayRenderer *> *)renderers NS_AVAILABLE(10_9, 7_0)
{
  call_delegate(noop(), mapViewDidAddOverlayRenderers,
    js_value_MKMapView(mapView),
    js_value_NSArray<MKOverlayRenderer*>(renderers));
}

#if TARGET_OS_IPHONE
#if TODO
// Prefer -mapView:rendererForOverlay:
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay NS_DEPRECATED_IOS(4_0, 7_0) __TVOS_PROHIBITED
{
  __block MKOverlayView* result = [mapView rendererForOverlay:overlay];
  call_delegate(result = is_value_MKOverlayRenderer(JS_RESULT) ? to_value_MKOverlayRenderer(JS_RESULT) : result, mapViewViewForOverlay,
    js_value_MKMapView(mapView),
    js_value_id/* <MKOverlay>*/(overlay));
  return result;
}
#endif

// Called after the provided overlay views have been added and positioned in the map.
// Prefer -mapView:didAddOverlayRenderers:
- (void)mapView:(MKMapView *)mapView didAddOverlayViews:(NSArray *)overlayViews NS_DEPRECATED_IOS(4_0, 7_0) __TVOS_PROHIBITED
{
  call_delegate(noop(), mapViewDidAddOverlayViews,
    js_value_MKMapView(mapView),
    js_value_NSArray(overlayViews));
}
#endif

// Return nil for default MKClusterAnnotation, it is illegal to return a cluster annotation not containing the identical array of member annotations given.
- (MKClusterAnnotation *)mapView:(MKMapView *)mapView clusterAnnotationForMemberAnnotations:(NSArray<id<MKAnnotation>>*)memberAnnotations NS_AVAILABLE(10_13, 11_0) __TVOS_AVAILABLE(11_0) __WATCHOS_PROHIBITED
{
  __block MKClusterAnnotation* result = nil;
  call_delegate(result = is_value_MKClusterAnnotation(JS_RESULT) ? to_value_MKClusterAnnotation(JS_RESULT) : result, mapViewClusterAnnotationForMemberAnnotations,
    js_value_MKMapView(mapView),
    js_value_NSArray<id<MKAnnotation>>(memberAnnotations));
  return result;
}
@end