const SweetieKit = require('std:sweetiekit.node');

const {
  UIViewController,
  UITabBarController,
  UITabBarItem,
} = SweetieKit;

async function make(nav, demoVC) {
  tabCtrl = new UITabBarController();
  otherVC = UIViewController();
  otherVC.view.backgroundColor = RGB(205, 37, 83);
  otherItem = UITabBarItem('Other Tab');
  demoItem = UITabBarItem('Tab A');
  demoVC.tabBarItem = demoItem;
  otherVC.tabBarItem = otherItem;
  tabCtrl.setViewControllersAnimated([demoVC, otherVC], true);
  nav.pushViewControllerAnimated(tabCtrl, true);
}

module.exports = make;
