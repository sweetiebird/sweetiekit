//
//  SCLLocationManagerDelegate.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import CoreLocation

typealias DidUpdateLocationsClosure = (CLLocationManager, [CLLocation]) -> Void
typealias OnAuthorizationClosure = (CLLocationManager, Int32) -> Void

@objc(SCLLocationManagerDelegate)
class SCLLocationManagerDelegate: NSObject, CLLocationManagerDelegate {
  @objc var didUpdateLocationsCallback: DidUpdateLocationsClosure?
  @objc var onAuthorizationCallback: OnAuthorizationClosure?

//  @objc convenience init(onAuthorization: OnAuthorizationClosure!, didUpdateLocations: DidUpdateLocationsClosure!) {
//    self.init()
//    onAuthorizationCallback = onAuthorization
//    didUpdateLocationsCallback = didUpdateLocations
//  }
  @objc convenience init(didUpdateLocations: DidUpdateLocationsClosure!) {
    self.init()
    didUpdateLocationsCallback = didUpdateLocations
  }
}

@objc extension SCLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    let statusInt = status.rawValue
    if let onAuthorizationCallback = onAuthorizationCallback {
      onAuthorizationCallback(manager, statusInt)
    }
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let didUpdateLocationsCallback = didUpdateLocationsCallback {
      didUpdateLocationsCallback(manager, locations)
    }
  }
}
