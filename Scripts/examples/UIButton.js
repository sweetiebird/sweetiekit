const SweetieKit = require('std:sweetiekit.node');

const {
  UIButton,
} = SweetieKit;

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const button = UIButton(CGRectMake(12, 80, w - 24, 50));
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
  return button;
}

module.exports = make;
