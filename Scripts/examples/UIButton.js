const SweetieKit = require('std:sweetiekit.node');

const {
  UIButton,
} = SweetieKit;

async function make() {
  return UIButton.alloc('👋 Hello', 0, 0, 200, 50, () => {
    console.log('button pressed');
  });
}

module.exports = make;
