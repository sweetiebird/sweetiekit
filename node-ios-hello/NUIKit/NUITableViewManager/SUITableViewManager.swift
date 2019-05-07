//
//  SUITableViewManager.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

typealias NumberSectionsClosure = (UITableView) -> Int
typealias NumberRowsInSectionClosure = (UITableView, Int) -> Int
typealias CellForRowAtClosure = (UITableView, IndexPath) -> UITableViewCell

@objc class SUITableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
  var numberSectionsCallback: NumberSectionsClosure?
  var numberRowsInSectionCallback: NumberRowsInSectionClosure!
  var cellForRowAtCallback: CellForRowAtClosure!
  
  override init() {
    super.init()
  }
  
  @objc convenience init(
    getNumberOfRowsInSection: @escaping NumberRowsInSectionClosure,
    getCellForRowAt: @escaping CellForRowAtClosure
  ) {
    self.init()
    numberRowsInSectionCallback = getNumberOfRowsInSection
    cellForRowAtCallback = getCellForRowAt
  }
}

@objc extension SUITableViewManager {
  func numberOfSections(in tableView: UITableView) -> Int {
    if let numberSectionsCallback = numberSectionsCallback {
      return numberSectionsCallback(tableView)
    }
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberRowsInSectionCallback(tableView, section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return cellForRowAtCallback(tableView, indexPath)
  }
}

@objc extension SUITableViewManager {
  func setNumberOfSectionsCallback(_ closure: @escaping NumberSectionsClosure) {
    numberSectionsCallback = closure
  }
}

