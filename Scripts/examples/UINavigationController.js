const SweetieKit = require('std:sweetiekit.node');

const UIControlEvents = require('./enums').UIControlEvents;

const {
  UIViewController,
  UIButton,
} = SweetieKit;

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const btn = UIButton({x: 12, y: 80, width: w - 24, height: 50});
  btn.title = 'Push View Controller';
  btn.addTarget(() => {
    const lastVC = UIViewController();
    lastVC.view.backgroundColor = RGB(205, 37, 83);
    nav.pushViewController(lastVC);
  }, UIControlEvents.touchUpInside);
  btn.backgroundColor = RGB(87, 174, 176);
  btn.layer.cornerRadius = 4;
  demoVC.view.addSubview(btn);
  nav.pushViewController(demoVC);
}

module.exports = make;
