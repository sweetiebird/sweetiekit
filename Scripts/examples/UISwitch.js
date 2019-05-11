const SweetieKit = require('std:sweetiekit.node');

const {
  UISwitch,
} = SweetieKit;

async function make() {
  return new UISwitch({ x: 100, y: 100, width: 80, height: 80 });
}

module.exports = make;
