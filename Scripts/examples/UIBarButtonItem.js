const SweetieKit = process._linkedBinding('sweetiekit');

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
  nav.pushViewControllerAnimated(demoVC, true)
}

module.exports = make;
