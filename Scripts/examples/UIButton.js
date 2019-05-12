const SweetieKit = require('std:sweetiekit.node');

const {
  UIButton,
} = SweetieKit;

async function make() {
  const button = await UIButton.alloc('👋 Hello Button', 0, 0, 200, 50, () => {
    console.log('button pressed');
  });
  button.backgroundColor = { red: 87/255, green: 174/255, blue: 176/255 };
  button.layer.cornerRadius = 4;
  return button;
}

module.exports = make;
