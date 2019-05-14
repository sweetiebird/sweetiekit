//
//  SMKAnnotation.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/14/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import MapKit

@objc class SMKAnnotation: NSObject, MKAnnotation {
  @objc let title: String?
  @objc let coordinate: CLLocationCoordinate2D
  
  @objc init(coordinate: CLLocationCoordinate2D, title: String) {
    self.title = title
    self.coordinate = coordinate
    
    super.init()
  }
}
