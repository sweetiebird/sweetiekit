const SweetieKit = process._linkedBinding('sweetiekit');

const {
  UISwitch,
} = SweetieKit;

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  return new UISwitch({ x: 12, y: 80, width: w - 24, height: 80 });
}

module.exports = make;
