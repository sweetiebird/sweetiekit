const SweetieKit = require('std:sweetiekit.node');

const {
  CAGradientLayer,
  UIBezierPath,
  UIView,
  UITapGestureRecognizer,
} = SweetieKit;

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const bgFrame = { x: 0, y: 0, width: w, height: h };
  const fgFrame = { x: 40, y: 80, width: bgFrame.width - 80, height: bgFrame.width - 80 };
  const bgView = global.bgView = UIView(bgFrame);
  const fgView = global.fgView = UIView(fgFrame);
  bgView.backgroundColor = RGB(221, 105, 28);
  fgView.backgroundColor = RGB(205, 37, 83);
  bgView.addSubview(fgView);

  // https://stackoverflow.com/questions/23074539/programmatically-create-a-uiview-with-color-gradient
  global.gradient = CAGradientLayer();
  gradient.frame = fgView.bounds;
  gradient.colors = [
    RGB(73, 236, 187),
    RGB(77, 188, 250),
  ];
  fgView.layer.insertSublayerAtIndex(gradient, 0);

  // https://www.hackingwithswift.com/articles/155/advanced-uiview-shadow-effects-using-shadowpath
  const width = fgView.width;
  const height = fgView.height;
  const shadowSize = {width: width*1.05, height: 0.1*height};
  const shadowDistance = 0;
  const contactRect = {
    x: shadowSize.width,
    y: height + (shadowSize.height * 0.4) + shadowDistance,
    width: width - shadowSize.width * 2,
    height: shadowSize.height
  };
  fgView.layer.shadowPath = UIBezierPath.bezierPathWithOvalInRect(contactRect);
  fgView.layer.shadowRadius = 8;
  fgView.layer.shadowOpacity = 0.4;

  const tap = UITapGestureRecognizer();
  tap.addTarget(() => {
    console.log('tap!!');
  });
  const tap2 = UITapGestureRecognizer();
  tap2.addTarget(() => {
    console.log('tap22222!!');
  });
  fgView.addGestureRecognizer(tap);
  bgView.addGestureRecognizer(tap2);

  return bgView;
}

module.exports = make;
