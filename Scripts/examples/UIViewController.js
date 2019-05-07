const SweetieKit = require('std:sweetiekit.node');

const {
  UIViewController,
} = SweetieKit;

function make() {
  return new UIViewController();
}

module.exports = make;
