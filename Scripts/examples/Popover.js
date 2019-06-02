const SweetieKit = require('std:sweetiekit.node');
const { UIModalPresentationStyle, UIPopoverArrowDirection } = require('./enums');
const colors = require('./colors');

const {
  UIViewController,
  UIView,
  UIPopoverPresentationControllerDelegate,
} = SweetieKit;

// func launchMaptrackTablePopover(withTracks: [Track]) {
//   /*
//    thanks to Stefan for his popover view controller creation code
//    https://github.com/FitnessEffect/WorkoutTracker/blob/master/WorkoutTracker/InputExerciseViewController.swift
//    */
//   let xPosition = view.frame.width / 2
//   let yPosition = view.frame.height / 2
//   let popover = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "maptrackTableVC") as! MaptrackTableViewController
//   popover.delegate = self
//   popover.modalPresentationStyle = UIModalPresentationStyle.popover
//   popover.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
//   popover.popoverPresentationController?.delegate = self
//   popover.popoverPresentationController?.sourceView = view
//   popover.preferredContentSize = CGSize(width: 260, height: 240)
//   popover.popoverPresentationController?.sourceRect = CGRect(x: xPosition, y: yPosition, width: 0, height: 0)
//   popover.tracks = withTracks
//   present(popover, animated: true, completion: nil)
// }
//
// func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//   return .none
// }


function make(nav, demoVC) {
  nav.pushViewController(demoVC);
  const del = new UIPopoverPresentationControllerDelegate();
  const vc = UIViewController();
  vc.view.backgroundColor = colors.fitbodPink;
  vc.modalPresentationStyle = UIModalPresentationStyle.popover;
  vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection.up;
  vc.popoverPresentationController.delegate = del;
  vc.popoverPresentationController.sourceView = demoVC.view;
  vc.preferredContentSize = { width: 100, height: 100 };
  vc.popoverPresentationController.sourceRect = {
    x: 0,
    y: 0,
    width: 0,
    height: 0,
  };
  demoVC.present(vc, true, () => {});
}

module.exports = make;
