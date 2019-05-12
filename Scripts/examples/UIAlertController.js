const SweetieKit = require('std:sweetiekit.node');

const {
  UIAlertController,
  UIAlertAction,
} = SweetieKit;

async function make() {
  const alert = new UIAlertController(
    'Alert Title',
    'And an informative message',
  );
  const action = new UIAlertAction('Okay', () => {
    alert.dismiss(true, () => {});
  });
  alert.addAction(action);
  return alert;
}

module.exports = make;
