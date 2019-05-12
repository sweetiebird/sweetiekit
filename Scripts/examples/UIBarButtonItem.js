const SweetieKit = require('std:sweetiekit.node');

const {
  UIBarButtonItem,
} = SweetieKit;

async function make(nav, demoVC) {
  const item = new UIBarButtonItem('Press Me', () => {
    console.log('tapped');
    nav.isToolbarHidden = true;
  });
  demoVC.toolbarItems = [item];
  nav.isToolbarHidden = false;
  nav.pushViewController(demoVC)
}

module.exports = make;
