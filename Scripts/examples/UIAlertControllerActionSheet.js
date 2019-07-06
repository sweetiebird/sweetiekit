const SweetieKit = require('std:sweetiekit.node');

const {
  UIAlertController,
  UIAlertAction,
} = SweetieKit;

UIAlertControllerActionSheetImage = () => {
  let img = UIImage('nic').imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal);
  UIAlertControllerActionSheetImage = (newImg = img) => {
    img = newImg;
    return img;
  };
  return img;
};

UIAlertControllerActionSheetImage2 = () => {
  let img = UIImage('laarc').imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal);
  UIAlertControllerActionSheetImage2 = (newImg = img) => {
    img = newImg;
    return img;
  };
  return img;
};

UIAlertControllerActionSheet_make = async function UIAlertControllerActionSheet_make(nav, demoVC) {

  // https://stackoverflow.com/questions/40675816/uialertcontroller-and-uialertcontrollerstyleactionsheet-customization

  alertVC = UIAlertController.alertControllerWithTitleMessagePreferredStyle(
    'Alert Title',
    'And an informative subtitle',
    UIAlertControllerStyleActionSheet,
  );
  const title = NSMutableAttributedString.alloc().initWithString('Some title message');
  title.addAttributeValueRange(NSFontAttributeName, UIFont.systemFontOfSize(30.0), NSMakeRange(5, 5));
  alertVC.setValueForKey(title, 'attributedTitle');

  const button = UIAlertAction.actionWithTitleStyleHandler('First button', UIAlertActionStyleCancel, (action) => {
    alertVC.dismissViewControllerAnimatedCompletion(true, () => {});
  });
  const button2 = UIAlertAction.actionWithTitleStyleHandler('Second button', UIAlertActionStyleDestructive, (action) => {
    alertVC.dismissViewControllerAnimatedCompletion(true, () => {});
  });
  const button3 = UIAlertAction.actionWithTitleStyleHandler('Third button', UIAlertActionStyleDefault, (action) => {
    alertVC.dismissViewControllerAnimatedCompletion(true, () => {});
  });
  button.setValueForKey(UIAlertControllerActionSheetImage(), 'image');
  button2.setValueForKey(UIAlertControllerActionSheetImage2(), 'image');
  alertVC.addAction(button);
  alertVC.addAction(button2);
  alertVC.addAction(button3);
  nav.pushViewControllerAnimated(demoVC, true);
  demoVC.presentViewControllerAnimatedCompletion(alertVC, true, () => {});
};

async function make (...args) {
  return await UIAlertControllerActionSheet_make(...args);
}

module.exports = make;
