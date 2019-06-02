const SweetieKit = require('std:sweetiekit.node');

const {
  UIViewController,
  UIButton,
} = SweetieKit;

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const btn = await UIButton.alloc('Push View Controller', 12, 80, w - 24, 50, () => {
    const lastVC = UIViewController();
    lastVC.view.backgroundColor = { red: 205/255, green: 37/255, blue: 83/255 };
    nav.pushViewController(lastVC);
  });
  btn.backgroundColor = { red: 87/255, green: 174/255, blue: 176/255 };
  btn.layer.cornerRadius = 4;
  demoVC.view.addSubview(btn);
  nav.pushViewController(demoVC);
}

module.exports = make;
