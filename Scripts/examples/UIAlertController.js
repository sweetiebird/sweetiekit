const SweetieKit = require('std:sweetiekit.node');

const {
  UIAlertController,
  UIAlertAction,
} = SweetieKit;

async function make(nav, demoVC) {
  const alert = UIAlertController.alertControllerWithTitleMessagePreferredStyle(
    'Alert Title',
    'And an informative message',
    UIAlertControllerStyleAlert,
  );
  const action = UIAlertAction.actionWithTitleStyleHandler('Okay', UIAlertActionStyleDefault, (action) => {
    alert.dismissViewControllerAnimatedCompletion(true, () => {});
  });
  alert.addAction(action);
  nav.pushViewControllerAnimated(demoVC, true);
  demoVC.presentViewControllerAnimatedCompletion(alert, true, () => {});
}

module.exports = make;
