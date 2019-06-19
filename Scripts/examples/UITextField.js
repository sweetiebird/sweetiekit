const SweetieKit = require('std:sweetiekit.node');

const {
  UITextField,
} = SweetieKit;

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const field = UITextField.alloc().initWithFrameCallback(CGRectMake(12, 80, w - 24, 50), () => {
    console.log(field.text);
  });
  return field;
}

module.exports = make;
