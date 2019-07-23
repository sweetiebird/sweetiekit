//
//  NMKMapViewDelegate.h
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKMapViewDelegate_h
#define NMKMapViewDelegate_h    

#include "NNSObject.h"

#define js_value_MKMapViewDelegate(x) js_value_wrapper(x, MKMapViewDelegate)
#define to_value_MKMapViewDelegate(x) to_value_wrapper(x, MKMapViewDelegate)
#define is_value_MKMapViewDelegate(x) is_value_wrapper(x, MKMapViewDelegate)

JS_WRAP_PROTOCOL(MKMapViewDelegate, NSObject);
  JS_PROP(mapViewRegionWillChangeAnimated);
  JS_PROP(mapViewRegionDidChangeAnimated);
  JS_PROP(mapViewDidChangeVisibleRegion);
  JS_PROP(mapViewWillStartLoadingMap);
  JS_PROP(mapViewDidFinishLoadingMap);
  JS_PROP(mapViewDidFailLoadingMapWithError);
  JS_PROP(mapViewWillStartRenderingMap);
  JS_PROP(mapViewDidFinishRenderingMapFullyRendered);
  JS_PROP(mapViewViewForAnnotation);
  JS_PROP(mapViewDidAddAnnotationViews);
  JS_PROP(mapViewAnnotationViewCalloutAccessoryControlTapped);
  JS_PROP(mapViewDidSelectAnnotationView);
  JS_PROP(mapViewDidDeselectAnnotationView);
  JS_PROP(mapViewWillStartLocatingUser);
  JS_PROP(mapViewDidStopLocatingUser);
  JS_PROP(mapViewDidUpdateUserLocation);
  JS_PROP(mapViewDidFailToLocateUserWithError);
  JS_PROP(mapViewAnnotationViewDidChangeDragStateFromOldState);
  JS_PROP(mapViewDidChangeUserTrackingModeAnimated);
  JS_PROP(mapViewRendererForOverlay);
  JS_PROP(mapViewDidAddOverlayRenderers);
  JS_PROP(mapViewViewForOverlay);
  JS_PROP(mapViewDidAddOverlayViews);
  JS_PROP(mapViewClusterAnnotationForMemberAnnotations);
JS_WRAP_PROTOCOL_END(MKMapViewDelegate, NSObject);

#if __OBJC__

@interface MKMapViewDelegateType : NSObject<MKMapViewDelegate>

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated;
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated;

- (void)mapViewDidChangeVisibleRegion:(MKMapView *)mapView API_AVAILABLE(ios(11), tvos(11), macos(10.13));

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView;
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView;
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error;

- (void)mapViewWillStartRenderingMap:(MKMapView *)mapView NS_AVAILABLE(10_9, 7_0);
- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered NS_AVAILABLE(10_9, 7_0);

// mapView:viewForAnnotation: provides the view for each annotation.
// This method may be called for all or some of the added annotations.
// For MapKit provided annotations (eg. MKUserLocation) return nil to use the MapKit provided annotation view.
- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation;

// mapView:didAddAnnotationViews: is called after the annotation views have been added and positioned in the map.
// The delegate can implement this method to animate the adding of the annotations views.
// Use the current positions of the annotation views as the destinations of the animation.
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views;

#if TARGET_OS_IPHONE
// mapView:annotationView:calloutAccessoryControlTapped: is called when the user taps on left & right callout accessory UIControls.
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control __TVOS_PROHIBITED;
#endif

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0);
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0);

- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView NS_AVAILABLE(10_9, 4_0);
- (void)mapViewDidStopLocatingUser:(MKMapView *)mapView NS_AVAILABLE(10_9, 4_0);
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(10_9, 4_0);
- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error NS_AVAILABLE(10_9, 4_0);

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState 
   fromOldState:(MKAnnotationViewDragState)oldState NS_AVAILABLE(10_9, 4_0) __TVOS_PROHIBITED;

#if TARGET_OS_IPHONE
- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated NS_AVAILABLE(NA, 5_0);
#endif

#if TODO
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay NS_AVAILABLE(10_9, 7_0);
#endif
- (void)mapView:(MKMapView *)mapView didAddOverlayRenderers:(NSArray<MKOverlayRenderer *> *)renderers NS_AVAILABLE(10_9, 7_0);

#if TARGET_OS_IPHONE
#if TODO
// Prefer -mapView:rendererForOverlay:
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay NS_DEPRECATED_IOS(4_0, 7_0) __TVOS_PROHIBITED;
#endif
// Called after the provided overlay views have been added and positioned in the map.
// Prefer -mapView:didAddOverlayRenderers:
- (void)mapView:(MKMapView *)mapView didAddOverlayViews:(NSArray *)overlayViews NS_DEPRECATED_IOS(4_0, 7_0) __TVOS_PROHIBITED;
#endif

// Return nil for default MKClusterAnnotation, it is illegal to return a cluster annotation not containing the identical array of member annotations given.
- (MKClusterAnnotation *)mapView:(MKMapView *)mapView clusterAnnotationForMemberAnnotations:(NSArray<id<MKAnnotation>>*)memberAnnotations NS_AVAILABLE(10_13, 11_0) __TVOS_AVAILABLE(11_0) __WATCHOS_PROHIBITED;
@end
#endif

#endif /* NMKMapViewDelegate_h */
