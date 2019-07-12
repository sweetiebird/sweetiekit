const SweetieKit = process._linkedBinding('sweetiekit');

const {
  UIImage,
  UIImageView,
} = SweetieKit;

async function make(nav, demoVC) {
  img = UIImage('laarc');
  view = UIImageView(img);
  const w = demoVC.view.frame.width;
  view.frame = {x: 12, y: 80, width: w - 24, height: w - 24};
  return view;
}

module.exports = make;
