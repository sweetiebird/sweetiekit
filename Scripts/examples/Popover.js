const SweetieKit = require('std:sweetiekit.node');
const colors = require('./colors');

const {
  UIViewController,
  UIPopoverPresentationControllerDelegate,
} = SweetieKit;

Popover_action = function Popover_action(sender, nav, demoVC) {
  const vc = UIViewController();
  vc.view.backgroundColor = colors.fitbodPink;
  vc.modalPresentationStyle = UIModalPresentationPopover;
  vc.preferredContentSize = CGSizeMake(100, 50);
  vc.view.bounds = CGRectMake(0, 0, 100, 50);

  const ppc = vc.popoverPresentationController;
  ppc.sourceView = sender;
  ppc.sourceRect = sender.bounds;
  ppc.permittedArrowDirections = UIPopoverArrowDirectionUp;
  ppc.delegate = UIPopoverPresentationControllerDelegate({
    // ensure the popover shows in portrait mode
    // https://www.ralfebert.de/ios-examples/uikit/choicepopover/
    adaptivePresentationStyleForPresentationController: () => {
      return UIModalPresentationNone;
    },
  });

  // show the popover.
  demoVC.presentViewControllerAnimatedCompletion(vc, true, () => {});

  return vc;
};

Popover_make = function Popover_make(nav, demoVC) {

  nav.pushViewControllerAnimated(demoVC, true);

  const view = demoVC.view;
  const button = UIButton(CGRectMake(12, 80, view.frame.width - 24, 50));
  view.addSubview(button);

  button.setTitleForState('👋 Hello Button', UIControlStateNormal);
  button.addTargetActionForControlEvents((sender) => {
    Popover_vc = Popover_action(sender, nav, demoVC);
  }, UIControlEventTouchUpInside);
  button.backgroundColor = RGB(87, 174, 176);
  button.layer.cornerRadius = 4;
  button.layer.shadowRadius = 12;
  button.layer.shadowColor = RGB(87, 174, 176);
  button.layer.shadowOffset = CGSizeMake(0, 12);
};

function make(...args) {
  return Popover_make(...args);
}

module.exports = make;
