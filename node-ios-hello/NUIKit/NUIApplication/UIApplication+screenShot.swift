//
//  UIApplication+screenShot.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/26/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import UIKit

extension UIApplication {
    @objc var screenShot: UIImage?  { return keyWindow?.layer.screenShot }
}

extension CALayer {

    @objc var screenShot: UIImage?  {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return screenshot
        }
        return nil
    }
}

import VideoToolbox

extension UIImage {
    @objc public convenience init?(pixelBuffer: CVPixelBuffer) {
        var cgImage: CGImage?
        VTCreateCGImageFromCVPixelBuffer(pixelBuffer, options: nil, imageOut: &cgImage)

        if let cgImage = cgImage {
            self.init(cgImage: cgImage)
        } else {
            return nil
        }
    }
}
