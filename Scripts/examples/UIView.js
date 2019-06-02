const SweetieKit = require('std:sweetiekit.node');

const {
  UIView,
} = SweetieKit;

async function make(demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h };
  const view = UIView(frame);
  const frame2 = { x: 40, y: 80, width: frame.width - 80, height: frame.width - 80 };
  const view2 = UIView(frame2);
  view.backgroundColor = { red: 0, green: 174/255, blue: 174/255 };
  view2.backgroundColor = { red: 205/255, green: 37/255, blue: 83/255 };
  view.addSubview(view2);
  return view;
}

module.exports = make;
