const SweetieKit = require('std:sweetiekit.node');

const {
  UITextField,
} = SweetieKit;

async function make() {
  const field = await UITextField.alloc(0, 0, 200, 50, () => {
    console.log(field.text);
  });

  return field;
}

module.exports = make;
