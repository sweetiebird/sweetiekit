const SweetieKit = require('std:sweetiekit.node');

const { UIControlEvents } = require('./enums');

const {
  UIView,
  UIButton,
  CoreGraphics,
  UIImageView,
  UIKit,
} = SweetieKit;

let view;
let view2;
let ssView;

function takeSS() {
  const w = view.frame.width;
  const h = view.frame.height;

  try {
    CoreGraphics.UIGraphicsBeginImageContextWithOptions(
      { width: w, height: h },
      true,
      0.0,
    );

    view.layer.renderInContext('current');

    const img = CoreGraphics.UIGraphicsGetImageFromCurrentImageContext();

    if (img) {
      const ssFrame = { x: 0, y: 0, width: w * 0.4, height: h * 0.4 };
      ssView = UIImageView(img);
      ssView.frame = ssFrame;
      ssView.layer.borderWidth = 1;
      ssView.layer.borderColor = { red: 1, green: 1, blue: 1, alpha: 1 };
      view.addSubview(ssView);

      // ==========
      // recalls UIApplicationMain and crashes?
      // ==========

      // UIKit.UIImageWriteToSavedPhotosAlbum(img, () => {
      //   console.log('written!');
      // });
    }
  } finally {
    CoreGraphics.UIGraphicsEndImageContext();
  }
}

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h };
  view = UIView(frame);
  const frame2 = { x: 40, y: 80, width: frame.width * 0.8, height: frame.width * 0.8 };
  view2 = UIView(frame2);
  // const ssFrame = { x: 0, y: 0, width: frame2.width * 0.4, height: frame2.height * 0.4 };
  // ssView = UIView(ssFrame);
  view.backgroundColor = { red: 0, green: 174/255, blue: 174/255 };
  view2.backgroundColor = { red: 205/255, green: 37/255, blue: 83/255 };
  // view2.backgroundColor = { red: 1, green: 1, blue: 1 };
  view.addSubview(view2);
  // view2.addSubview(ssView);

  const button = UIButton({
    x: 20,
    y: h - 200,
    width: w - 40,
    height: 50,
  });
  button.title = '📷 Screenshot';
  button.backgroundColor = { red: 87/255, green: 174/255, blue: 176/255 };
  button.layer.cornerRadius = 25;
  button.layer.shadowRadius = 12;
  button.layer.shadowColor = { red: 87/255, green: 174/255, blue: 176/255 };
  button.layer.shadowOffset = { width: 0, height: 12 };
  button.layer.shadowOpacity = 1;
  button.addTarget(takeSS, UIControlEvents.touchUpInside);
  button.showsTouchWhenHighlighted = true;

  view.addSubview(button);

  return view;
}

module.exports = make;
