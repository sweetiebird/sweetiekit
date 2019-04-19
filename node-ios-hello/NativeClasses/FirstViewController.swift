//
//  FirstViewController.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 4/9/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        let vc = UIViewController()
//        present(vc, animated: true, completion: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

@objc
extension UIViewController {
    @objc func setRandomBackgroundColor() {
        let hue = CGFloat( arc4random() % 256) / 256.0;  //  0.0 to 1.0
        let saturation = CGFloat( arc4random() % 128) / 256.0 + 0.5;  //  0.5 to 1.0, away from white
        let brightness = CGFloat( arc4random() % 128) / 256.0 + 0.5;  //  0.5 to 1.0, away from black
        self.view.backgroundColor = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}
