const SweetieKit = require('std:sweetiekit.node');

const {
  CAGradientLayer,
  UIBezierPath,
  UIView,
} = SweetieKit;

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const bgFrame = { x: 0, y: 0, width: w, height: h };
  const fgFrame = { x: 40, y: 80, width: bgFrame.width - 80, height: bgFrame.width - 80 };
  const bgView = global.bgView = UIView(bgFrame);
  const fgView = global.fgView = UIView(fgFrame);
  bgView.backgroundColor = { red: 221/255, green: 105/255, blue: 28/255 };
  fgView.backgroundColor = { red: 205/255, green: 37/255, blue: 83/255 };
  bgView.addSubview(fgView);

  // https://stackoverflow.com/questions/23074539/programmatically-create-a-uiview-with-color-gradient
  global.gradient = CAGradientLayer();
  gradient.frame = fgView.bounds;
  gradient.colors = [
    { red:73/255, green:236/255, blue:187/255 },
    { red:77/255, green:188/255, blue:250/255 },
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

  return bgView;
}

module.exports = make;
