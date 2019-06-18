const SweetieKit = require('std:sweetiekit.node');
const { UIModalPresentationStyle, UIPopoverArrowDirection } = require('./enums');
const colors = require('./colors');

const {
  UIViewController,
  UIPopoverPresentationControllerDelegate,
} = SweetieKit;

function make(nav, demoVC) {

  nav.pushViewController(demoVC);

  const view = demoVC.view;

  const button = UIButton(CGRectMake(12, 80, view.frame.width - 24, 50));
  view.addSubview(button);

  //const xPosition = view.frame.width / 2;
  //const yPosition = view.frame.height / 2;
  const xPosition = button.frame.x + button.frame.width / 2;
  const yPosition = button.frame.y + button.frame.height;

  button.setTitleForState('👋 Hello Button', UIControlStateNormal);
  button.addTargetActionForControlEvents(() => {
    const vc = UIViewController();
    vc.view.backgroundColor = colors.fitbodPink;
    vc.modalPresentationStyle = UIModalPresentationPopover;
    vc.preferredContentSize = CGSizeMake(260, 240);
    const ppc = vc.popoverPresentationController;
    if (ppc) {
      ppc.permittedArrowDirections = UIPopoverArrowDirectionUp;
      const del = new UIPopoverPresentationControllerDelegate();
      ppc.delegate = del;

      ppc.sourceView = view;
      ppc.sourceRect = CGRectMake(xPosition, yPosition, 0, 0);

      ppc.permittedArrowDirections = UIPopoverArrowDirectionUp;
    }
    demoVC.present(vc, true, () => {});
  }, UIControlEventTouchUpInside);
  button.backgroundColor = RGB(87, 174, 176);
  button.layer.cornerRadius = 4;
  button.layer.shadowRadius = 12;
  button.layer.shadowColor = RGB(87, 174, 176);
  button.layer.shadowOffset = CGSizeMake(0, 12);
}

module.exports = make;
