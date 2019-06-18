const SweetieKit = require('std:sweetiekit.node');

const {
  UIViewController,
  UIButton,
} = SweetieKit;

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const btn = UIButton(CGRectMake(12, 80, w - 24, 50));
  btn.setTitleForState('Push View Controller', UIControlStateNormal);
  btn.addTargetActionForControlEvents(() => {
    const lastVC = UIViewController();
    lastVC.view.backgroundColor = RGB(205, 37, 83);
    nav.pushViewController(lastVC);
  }, UIControlEventTouchUpInside);
  btn.backgroundColor = RGB(87, 174, 176);
  btn.layer.cornerRadius = 4;
  demoVC.view.addSubview(btn);
  nav.pushViewController(demoVC);
}

module.exports = make;
