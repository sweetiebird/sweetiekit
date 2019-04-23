//
//  SUITableViewDataSource.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import Foundation
import UIKit

typealias UITableViewDataSourceNumberOfRowsInSectionClosure = (UITableView, Int) -> (Int)
typealias UITableViewDataSourceCellForRowAtClosure = (UITableView, IndexPath, UITableViewCell?) -> (UITableViewCell?)

class SUITableViewDataSource: NSObject, UITableViewDataSource {
  
  var numberRowsCallback: UITableViewDataSourceNumberOfRowsInSectionClosure!
  var cellCallback: UITableViewDataSourceCellForRowAtClosure!

  @objc func setNumberRowsClosure(closure: @escaping UITableViewDataSourceNumberOfRowsInSectionClosure) {
      numberRowsCallback = closure
  }

  @objc func setCellClosure(closure: @escaping UITableViewDataSourceCellForRowAtClosure) {
      cellCallback = closure
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let group = DispatchGroup();
    var result: Int = 0
    group.enter();
    AppDelegate.queue.async {
      result = self.numberRowsCallback(tableView, section)
      group.leave()
    }
    group.wait()
    return result
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //let group = DispatchGroup();
    let result: UITableViewCell! = self.cellCallback(tableView, indexPath, nil)
    //group.enter();
    //let cell = UITableViewCell.init(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    AppDelegate.queue.async {
      self.cellCallback(tableView, indexPath, result)
      //group.leave()
    }
    //group.wait()
    //return result!
    return result
  }
}
