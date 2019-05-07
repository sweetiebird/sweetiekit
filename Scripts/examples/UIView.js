const SweetieKit = require('std:sweetiekit.node');

const {
  UIView,
} = SweetieKit;

function make() {
  const frame = { x: 0, y: 0, width: 375, height: 667 };
  return new UIView(frame);
}

module.exports = make;
