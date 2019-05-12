const SweetieKit = require('std:sweetiekit.node');

const {
  UIView,
} = SweetieKit;

async function make(demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h };
  const view = new UIView(frame);
  view.backgroundColor = { red: 0, green: 174/255, blue: 174/255 };
  return view;
}

module.exports = make;
