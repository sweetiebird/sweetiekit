const SweetieKit = require('std:sweetiekit.node');

const {
  UIAlertController,
  UIAlertAction,
} = SweetieKit;

async function make(nav, demoVC) {
  const alert = new UIAlertController(
    'Alert Title',
    'And an informative message',
  );
  const action = new UIAlertAction('Okay', () => {
    alert.dismiss(true, () => {});
  });
  alert.addAction(action);
  nav.pushViewController(demoVC);
  demoVC.present(alert, true, () => {});
}

module.exports = make;
