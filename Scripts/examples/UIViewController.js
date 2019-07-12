const SweetieKit = process._linkedBinding('sweetiekit');

const {
  UIViewController,
} = SweetieKit;

function make() {
  return UIViewController();
}

module.exports = make;
