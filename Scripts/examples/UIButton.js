const SweetieKit = require('std:sweetiekit.node');

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
    const alert = new UIAlertController(
      'Button pressed',
      'Hello',
    );
    const action = new UIAlertAction('Okay', () => {
      alert.dismiss(true, () => {});
    });
    alert.addAction(action);
    demoVC.present(alert, true, () => {});
  }, UIControlEventTouchUpInside);
  button.backgroundColor = RGB(87, 174, 176);
  button.layer.cornerRadius = 4;
  button.layer.shadowRadius = 12;
  button.layer.shadowColor = RGB(87, 174, 176);
  button.layer.shadowOffset = CGSizeMake(0, 12);
}

module.exports = make;
