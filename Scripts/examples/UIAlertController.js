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
    alert.dismissViewControllerAnimatedCompletion(true, () => {});
  });
  alert.addAction(action);
  nav.pushViewController(demoVC);
  demoVC.presentViewControllerAnimatedCompletion(alert, true, () => {});
}

module.exports = make;
