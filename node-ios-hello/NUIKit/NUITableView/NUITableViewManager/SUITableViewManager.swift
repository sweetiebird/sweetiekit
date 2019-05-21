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
typealias DidSelectRowAtClosure = (UITableView, IndexPath) -> Void
typealias TitleForSectionHeaderClosure = (UITableView, Int) -> String?
typealias SUITableViewManager_HeightForRowClosure = (UITableView, IndexPath) -> CGFloat

@objc class SUITableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
  // data source
  var numberSectionsCallback: NumberSectionsClosure?
  var numberRowsInSectionCallback: NumberRowsInSectionClosure!
  var cellForRowAtCallback: CellForRowAtClosure!
  var didSelectRowAtCallback: DidSelectRowAtClosure?
  var titleForSectionCallback: TitleForSectionHeaderClosure?
  
  // delegate
  var heightForRowCallback: SUITableViewManager_HeightForRowClosure?

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
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    didSelectRowAtCallback?(tableView, indexPath)
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return titleForSectionCallback?(tableView, section)
  }
}

@objc extension SUITableViewManager {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if let heightForRowCallback = heightForRowCallback {
      return heightForRowCallback(tableView, indexPath)
    }
    return UITableView.automaticDimension
  }
}

@objc extension SUITableViewManager {
  func setNumberOfSectionsCallback(_ closure: @escaping NumberSectionsClosure) {
    numberSectionsCallback = closure
  }

  func setDidSelectRowAtCallback(_ closure: @escaping DidSelectRowAtClosure) {
    didSelectRowAtCallback = closure
  }
  
  func setTitleForSectionCallback(_ closure: @escaping TitleForSectionHeaderClosure) {
    titleForSectionCallback = closure
  }

  func setHeightForRowCallback(_ closure: @escaping SUITableViewManager_HeightForRowClosure) {
    heightForRowCallback = closure
  }
}

