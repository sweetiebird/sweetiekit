//
//  SMKAnnotation.swift
//
//  Created by Emily Kolar on 5/14/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import MapKit

@objc class SMKAnnotation: NSObject, MKAnnotation {
  @objc let title: String?
  @objc let coordinate: CLLocationCoordinate2D
  @objc let about: String?

  @objc init(coordinate: CLLocationCoordinate2D, title: String?, about: String?) {
    self.title = title
    self.coordinate = coordinate
    self.about = about

    super.init()
  }
  
  var subtitle: String? {
    return about
  }
}
