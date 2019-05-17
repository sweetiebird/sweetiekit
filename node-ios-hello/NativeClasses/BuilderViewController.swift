//
//  BuilderViewController.swift
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import UIKit

class BuilderViewController: UIViewController {

  @IBOutlet weak var secondImageView: UIImageView!
  @IBOutlet weak var firstImageView: UIImageView!

  override func viewDidLoad() {
        super.viewDidLoad()
      let drag = UIDragInteraction(delegate: self)
      let drop = UIDropInteraction(delegate: self)
      view.addInteraction(drop)
      view.addInteraction(drag)
      firstImageView.isUserInteractionEnabled = true
      secondImageView.isUserInteractionEnabled = true
    }
}

extension BuilderViewController: UIDragInteractionDelegate {
  func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
    guard let image = firstImageView.image else { return [] }

    let provider = NSItemProvider(object: image)
    let item = UIDragItem(itemProvider: provider)
    item.localObject = image
    
    /*
         Returning a non-empty array, as shown here, enables dragging. You
         can disable dragging by instead returning an empty array.
    */
    return [item]
  }
}

extension BuilderViewController: UIDropInteractionDelegate {
  func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
    for dragItem in session.items {
        // 2
        dragItem.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { object, error in
            // 3
            guard error == nil else { return print("Failed to load our dragged item") }
            guard let draggedImage = object as? UIImage else { return }
            // 4
            DispatchQueue.main.async {
                let centerPoint = session.location(in: self.view)
                //5
                if session.location(in: self.view).y <= self.firstImageView.frame.maxY {
                    self.firstImageView.image = draggedImage
                    self.firstImageView.center = centerPoint
                } else {
                    self.secondImageView.image = draggedImage
                    self.secondImageView.center = centerPoint
                }
            }
        })
    }
  }
  
  func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
    return UIDropProposal(operation: .copy)
  }
  
  func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
    return session.canLoadObjects(ofClass: UIImage.self)
  }
}
