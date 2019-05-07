const SweetieKit = require('std:sweetiekit.node');

const {
  UIBarButtonItem,
} = SweetieKit;

function make() {
  return new UIBarButtonItem('Add', () => {
    console.log('tapped');
  });
}

module.exports = make;
