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

    view.layer.renderInContext();

    const img = CoreGraphics.UIGraphicsGetImageFromCurrentImageContext();

    if (img) {
      const ssFrame = { x: 0, y: 0, width: w * 0.4, height: h * 0.4 };
      ssView = UIImageView(img);
      ssView.frame = ssFrame;
      ssView.layer.borderWidth = 1;
      ssView.layer.borderColor = UIColor.white;
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
  view.backgroundColor = RGB(0, 174, 174);
  view2.backgroundColor = RGB(205, 37, 83);
  // view2.backgroundColor = UIColor.white;
  view.addSubview(view2);
  // view2.addSubview(ssView);

  const button = UIButton(CGRectMake(20, h - 200, w - 40, 50));
  button.setTitleForState('📷 Screenshot', UIControlStateNormal);
  button.backgroundColor = RGB(87, 174, 176);
  button.layer.cornerRadius = 25;
  button.layer.shadowRadius = 12;
  button.layer.shadowColor = RGB(87, 174, 176);
  button.layer.shadowOffset = { width: 0, height: 12 };
  button.layer.shadowOpacity = 1;
  button.addTarget(takeSS, UIControlEvents.touchUpInside);
  button.showsTouchWhenHighlighted = true;

  view.addSubview(button);

  return view;
}

module.exports = make;
