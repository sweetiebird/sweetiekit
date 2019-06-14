const SweetieKit = require('std:sweetiekit.node');

const {
  UIViewController,
  UITabBarController,
  UITabBarItem,
} = SweetieKit;

async function make(nav, demoVC) {
  const tabCtrl = new UITabBarController();
  const otherVC = UIViewController();
  otherVC.view.backgroundColor = RGB(205, 37, 83);
  const otherItem = new UITabBarItem('Other Tab');
  const demoItem = new UITabBarItem('Tab A');
  demoVC.tabBarItem = demoItem;
  otherVC.tabBarItem = otherItem;
  tabCtrl.setViewControllers([demoVC, otherVC]);
  nav.pushViewController(tabCtrl);
}

module.exports = make;
