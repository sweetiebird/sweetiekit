//
//  NUIPickerViewManager.swift
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

typealias SUIPickerViewManager_NumberComponentsClosure = (UIPickerView) -> Int
typealias SUIPickerViewManager_NumberRowsClosure = (UIPickerView, Int) -> Int
typealias SUIPickerViewManager_TitleForRowClosure = (UIPickerView, Int, Int) -> String?
typealias SUIPickerViewManager_DidSelectRowClosure = (UIPickerView, Int, Int) -> Void
typealias SUIPickerViewManager_AttributedTitleForRowClosure = (UIPickerView, Int, Int) -> NSAttributedString?

@objc class SUIPickerViewManager: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
  var numberComponentsCallback: SUIPickerViewManager_NumberComponentsClosure!
  var numberRowsCallback: SUIPickerViewManager_NumberRowsClosure!
  var titleForRowCallback: SUIPickerViewManager_TitleForRowClosure?
  var didSelectRowCallback: SUIPickerViewManager_DidSelectRowClosure?
  var attributedTitleForRowCallback: SUIPickerViewManager_AttributedTitleForRowClosure?

  @objc convenience init(numberComponents: @escaping SUIPickerViewManager_NumberComponentsClosure, numberRows: @escaping SUIPickerViewManager_NumberRowsClosure) {
    self.init()
    numberComponentsCallback = numberComponents
    numberRowsCallback = numberRows
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return numberComponentsCallback(pickerView)
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return numberRowsCallback(pickerView, component)
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return titleForRowCallback?(pickerView, row, component)
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    didSelectRowCallback?(pickerView, row, component)
  }
  
  func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
    return attributedTitleForRowCallback?(pickerView, row, component)
  }
}

@objc extension SUIPickerViewManager {
  func setTitleForRow(_ closure: @escaping SUIPickerViewManager_TitleForRowClosure) {
    titleForRowCallback = closure
  }
  
  func setDidSelectRow(_ closure: @escaping SUIPickerViewManager_DidSelectRowClosure) {
    didSelectRowCallback = closure
  }
  
  func setAttributedTitleForRow(_ closure: @escaping SUIPickerViewManager_AttributedTitleForRowClosure) {
    attributedTitleForRowCallback = closure
  }
}
