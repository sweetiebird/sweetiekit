const SweetieKit = require('std:sweetiekit.node');

const {
  UIAlertController,
  UIAlertAction,
} = SweetieKit;

UIAlertControllerActionSheetImage = () => {
  let img = UIImage('laarc').imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal);
  UIAlertControllerActionSheetImage = (newImg = img) => {
    img = newImg;
    return img;
  };
  return img;
};

UIAlertControllerActionSheet_make = async function UIAlertControllerActionSheet_make(nav, demoVC) {
  const alertVC = UIAlertController.alertControllerWithTitleMessagePreferredStyle(
    'Alert Title',
    'And an informative subtitle',
    UIAlertControllerStyleActionSheet,
  );
  const title = NSMutableAttributedString.alloc().initWithString('Some title message');
  title.addAttributeValueRange(NSFontAttributeName, UIFont.systemFontOfSize(30.0), NSMakeRange(5, 5));
  alertVC.setValueForKey(title, 'attributedTitle');

  const button = UIAlertAction.actionWithTitleStyleHandler('First button', UIAlertActionStyleDefault, (action) => {
    alertVC.dismissViewControllerAnimatedCompletion(true, () => {});
  });
  const button2 = UIAlertAction.actionWithTitleStyleHandler('Second button', UIAlertActionStyleDefault, (action) => {
    alertVC.dismissViewControllerAnimatedCompletion(true, () => {});
  });
  button.setValueForKey(UIAlertControllerActionSheetImage(), 'image');
  alertVC.addAction(button);
  alertVC.addAction(button2);
  nav.pushViewControllerAnimated(demoVC, true);
  demoVC.presentViewControllerAnimatedCompletion(alertVC, true, () => {});
};

async function make (...args) {
  return await UIAlertControllerActionSheet_make(...args);
}

module.exports = make;
