//
//  SMKMapViewDelegate.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/14/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import MapKit

typealias SMKMapViewDeleate_DidFinishRendering = (MKMapView, Bool) -> Void
typealias SMKMapViewDelegate_DidUpdateUserLocation = (MKMapView, MKUserLocation) -> Void
typealias SMKMapViewDelegate_ViewForAnnotation = (MKMapView, MKAnnotation) -> MKAnnotationView?
typealias SMKMapViewDelegate_SelectViewForAnnotation = (MKMapView, MKAnnotationView) -> Void

@objc(SMKMapViewDelegate)
class SMKMapViewDelegate: NSObject, MKMapViewDelegate {
  @objc var didFinishRenderingCallback: SMKMapViewDeleate_DidFinishRendering?
  @objc var didUpdateUserLocationCallback: SMKMapViewDelegate_DidUpdateUserLocation?
  @objc var viewForAnnoationCallback: SMKMapViewDelegate_ViewForAnnotation?
  @objc var didSelectViewForAnnotationCallback: SMKMapViewDelegate_SelectViewForAnnotation?

  func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
    didFinishRenderingCallback?(mapView, fullyRendered)
  }
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    didUpdateUserLocationCallback?(mapView, userLocation)
  }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    return viewForAnnoationCallback?(mapView, annotation)
  }
  
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    didSelectViewForAnnotationCallback?(mapView, view)
  }
}

@objc extension SMKMapViewDelegate {
  @objc func setDidFinishRendering(_ closure: @escaping SMKMapViewDeleate_DidFinishRendering) {
    didFinishRenderingCallback = closure
  }
  
  @objc func setDidUpdateUserLocation(_ closure: @escaping SMKMapViewDelegate_DidUpdateUserLocation) {
    didUpdateUserLocationCallback = closure
  }
  
  @objc func setViewForAnnotation(_ closure: @escaping SMKMapViewDelegate_ViewForAnnotation) {
    viewForAnnoationCallback = closure
  }
  
  @objc func setDidSelectViewForAnnotation(_ closure: @escaping SMKMapViewDelegate_SelectViewForAnnotation) {
    didSelectViewForAnnotationCallback = closure
  }
}
