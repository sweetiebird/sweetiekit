const SweetieKit = require('std:sweetiekit.node');

const {
  UIImage,
  UIImageView,
} = SweetieKit;

async function make(demoVC) {
  const img = UIImage('laarc');
  const view = new UIImageView(img);
  const w = demoVC.view.frame.width;
  view.frame = {x: 12, y: 80, width: w - 24, height: w - 24};
  return view;
}

module.exports = make;
