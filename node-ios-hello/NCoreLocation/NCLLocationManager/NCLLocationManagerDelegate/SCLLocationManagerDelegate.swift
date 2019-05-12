//
//  SCLLocationManagerDelegate.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import CoreLocation

typealias OnAuthorizationClosure = (CLLocationManager, Int32) -> Void
typealias DidUpdateLocationsClosure = (CLLocationManager, [CLLocation]) -> Void
typealias DidUpdateHeadingClosure = (CLLocationManager, CLHeading) -> Void

@objc(SCLLocationManagerDelegate)
class SCLLocationManagerDelegate: NSObject, CLLocationManagerDelegate {
  @objc var onAuthorizationCallback: OnAuthorizationClosure?
  @objc var didUpdateLocationsCallback: DidUpdateLocationsClosure?
  @objc var didUpdateHeadingCallback: DidUpdateHeadingClosure?

  @objc convenience init(onAuthorization: OnAuthorizationClosure!,
                        didUpdateLocations: DidUpdateLocationsClosure!,
                        didUpdateHeading: DidUpdateHeadingClosure!
                        ) {
    self.init()
    onAuthorizationCallback = onAuthorization
    didUpdateLocationsCallback = didUpdateLocations
    didUpdateHeadingCallback = didUpdateHeading
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
  
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    if let didUpdateHeadingCallback = didUpdateHeadingCallback {
      didUpdateHeadingCallback(manager, newHeading)
    }
  }
}
