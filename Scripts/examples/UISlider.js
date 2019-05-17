const SweetieKit = require('std:sweetiekit.node');

const {
  UISlider,
} = SweetieKit;

async function make(demoVC) {
  const w = demoVC.view.frame.width;
  return new UISlider({ x: 12, y: 80, width: w - 24, height: 60 });
}

module.exports = make;
