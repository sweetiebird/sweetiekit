//
//  SUICollectionViewManager.swift
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

typealias CVMNumberSectionsClosure = (UICollectionView) -> Int
typealias CVMNumberItemsInSectionClosure = (UICollectionView, Int) -> Int
typealias CVMCellForItemAtClosure = (UICollectionView, IndexPath) -> UICollectionViewCell

typealias CVMDidSelectItemAtClosure = (UICollectionView, IndexPath) -> Void
typealias CVMDidDeselectItemAtClosure = (UICollectionView, IndexPath) -> Void
typealias CVMShouldSelectItemAtClosure = (UICollectionView, IndexPath) -> Bool
typealias CVMShouldDeselectItemAtClosure = (UICollectionView, IndexPath) -> Bool

typealias CVMDidHighlightItemAtClosure = (UICollectionView, IndexPath) -> Void
typealias CVMDidUnhighlightItemAtClosure = (UICollectionView, IndexPath) -> Void
typealias CVMShouldHighlightItemAtClosure = (UICollectionView, IndexPath) -> Bool
typealias CVMShouldUnhighlightItemAtClosure = (UICollectionView, IndexPath) -> Bool

@objc class SUICollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
  var numberSectionsCallback: CVMNumberSectionsClosure?
  var numberItemsInSectionCallback: CVMNumberItemsInSectionClosure!
  var cellForItemAtCallback: CVMCellForItemAtClosure!
  
  var didSelectItemAtCallback: CVMDidSelectItemAtClosure?
  var didDeselectItemAtCallback: CVMDidDeselectItemAtClosure?
  var shouldSelectItemAtCallback: CVMShouldSelectItemAtClosure?
  var shouldDeselectItemAtCallback: CVMShouldDeselectItemAtClosure?
  
  var didHighlightItemAtCallback: CVMDidHighlightItemAtClosure?
  var didUnhighlightItemAtCallback: CVMDidUnhighlightItemAtClosure?
  var shouldHighlightItemAtCallback: CVMShouldHighlightItemAtClosure?
  var shouldUnhighlightItemAtCallback: CVMShouldUnhighlightItemAtClosure?

  override init() {
    super.init()
  }
  
  @objc convenience init(
    numberItemsInSection: @escaping CVMNumberItemsInSectionClosure,
    cellForItemAt: @escaping CVMCellForItemAtClosure
  ) {
    self.init()
    numberItemsInSectionCallback = numberItemsInSection
    cellForItemAtCallback = cellForItemAt
  }
}

@objc extension SUICollectionViewManager {
  func setNumberOfSectionsCallback(_ closure: @escaping CVMNumberSectionsClosure) {
    numberSectionsCallback = closure
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    if let numberSectionsCallback = numberSectionsCallback {
      return numberSectionsCallback(collectionView)
    }
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return numberItemsInSectionCallback(collectionView, section)
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return cellForItemAtCallback(collectionView, indexPath)
  }
}

@objc extension SUICollectionViewManager {
  func setDidSelectItemAtCallback(_ closure: @escaping CVMDidSelectItemAtClosure) {
    didSelectItemAtCallback = closure
  }
  
  func setDidDeselectItemAtCallback(_ closure: @escaping CVMDidDeselectItemAtClosure) {
    didDeselectItemAtCallback = closure
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    didSelectItemAtCallback?(collectionView, indexPath);
  }

  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    didDeselectItemAtCallback?(collectionView, indexPath);
  }
  
  func setShouldSelectItemAtCallback(_ closure: @escaping CVMShouldSelectItemAtClosure) {
    shouldSelectItemAtCallback = closure
  }
  
  func setShouldDeselectItemAtCallback(_ closure: @escaping CVMShouldDeselectItemAtClosure) {
    shouldDeselectItemAtCallback = closure
  }

  func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    return shouldSelectItemAtCallback?(collectionView, indexPath) ?? true;
  }

  func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
    return shouldDeselectItemAtCallback?(collectionView, indexPath) ?? true;
  }
}

@objc extension SUICollectionViewManager {
  func setDidHighlightItemAtCallback(_ closure: @escaping CVMDidHighlightItemAtClosure) {
    didHighlightItemAtCallback = closure
  }
  
  func setDidUnhighlightItemAtCallback(_ closure: @escaping CVMDidUnhighlightItemAtClosure) {
    didUnhighlightItemAtCallback = closure
  }

  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    didHighlightItemAtCallback?(collectionView, indexPath);
  }

  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    didUnhighlightItemAtCallback?(collectionView, indexPath);
  }
  
  func setShouldHighlightItemAtCallback(_ closure: @escaping CVMShouldHighlightItemAtClosure) {
    shouldHighlightItemAtCallback = closure
  }
  
  func setShouldUnhighlightItemAtCallback(_ closure: @escaping CVMShouldUnhighlightItemAtClosure) {
    shouldUnhighlightItemAtCallback = closure
  }

  func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    return shouldHighlightItemAtCallback?(collectionView, indexPath) ?? true;
  }

  func collectionView(_ collectionView: UICollectionView, shouldUnhighlightItemAt indexPath: IndexPath) -> Bool {
    return shouldUnhighlightItemAtCallback?(collectionView, indexPath) ?? true;
  }
}

