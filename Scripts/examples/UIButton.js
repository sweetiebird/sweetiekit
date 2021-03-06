const SweetieKit = process._linkedBinding('sweetiekit');

const {
  UIButton,
} = SweetieKit;

async function make(nav, demoVC) {
  const view = demoVC.view;
  const w = view.frame.width;
  const button = UIButton();
  view.addSubview(button);
  button.pinToSuperviewWithInsetsEdges(UIEdgeInsetsMake(30, 0, 0, 0), UIRectEdgeTop);
  button.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).isActive = true;
  button.widthAnchor.constraintGreaterThanOrEqualToAnchorConstant(view.widthAnchor, -24).isActive = true;
  button.setTitleForState('👋 Hello Button', UIControlStateNormal);
  button.addTargetActionForControlEvents(() => {
    const alert = UIAlertController.alertControllerWithTitleMessagePreferredStyle(
      'Button pressed',
      'Hello',
      UIAlertControllerStyleAlert,
    );
    const action = UIAlertAction.actionWithTitleStyleHandler('Okay', UIAlertActionStyleDefault, (action) => {
      alert.dismissViewControllerAnimatedCompletion(true, () => {});
    });
    alert.addAction(action);
    demoVC.presentViewControllerAnimatedCompletion(alert, true, () => {});
  }, UIControlEventTouchUpInside);
  button.backgroundColor = RGB(87, 174, 176);
  button.layer.cornerRadius = 4;
  button.layer.shadowRadius = 12;
  button.layer.shadowColor = RGB(87, 174, 176);
  button.layer.shadowOffset = CGSizeMake(0, 12);
}

module.exports = make;
