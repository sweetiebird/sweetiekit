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

@objc class SUICollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
  var numberSectionsCallback: CVMNumberSectionsClosure?
  var numberItemsInSectionCallback: CVMNumberItemsInSectionClosure!
  var cellForItemAtCallback: CVMCellForItemAtClosure!
  var didSelectItemAtCallback: CVMDidSelectItemAtClosure?

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
  func setNumberOfSectionsCallback(_ closure: @escaping CVMNumberSectionsClosure) {
    numberSectionsCallback = closure
  }
  
  func setDidSelectItemAtCallback(_ closure: @escaping CVMDidSelectItemAtClosure) {
    didSelectItemAtCallback = closure
  }
}

