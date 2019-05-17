const CLLocationAccuracy = {
  BestForNavigation: 'kCLLocationAccuracyBestForNavigation',
};

const UITableViewScrollPosition = {
  Top: 'Top',
  Bottom: 'Bottom',
  Middle: 'Middle',
  None: 'None',
};

const UICollectionViewScrollPosition = {
  Top: 'Top',
  Bottom: 'Bottom',
  Left: 'Left',
  Right: 'Right',
  None: 'None',
  CenteredHorizontally: 'CenteredHorizontally',
  CenteredVertically: 'CenteredVertically',
};

const SCNLightType = {
  IES: 'IES',
  ambient: 'ambient',
  directional: 'directional',
  omni: 'omni',
  probe: 'probe',
  spot: 'spot',
};

const SKSceneScaleMode = {
  fill: 'fill',
  aspectFill: 'aspectFill',
  aspectFit: 'aspectFit',
  resizeFill: 'resizeFill',
};

const NSTextAlignment = {
  left: 'left',
  right: 'right',
  center: 'center',
  justified: 'justified',
  natural: 'natural',
};

const UIControlState = {
  normal: 0,
  highlighted: 1 << 0,
  disabled: 1 << 1,
  selected: 1 << 2,
  focused: 1 << 3,
};

const UIViewContentMode = {
  scaleToFill: 0,
  scaleAspectFit: 1,
  scaleAspectFill: 2,
  redraw: 3,
  center: 4,
  top: 5,
  bottom: 6,
  left: 7,
  right: 8,
  topLeft: 9,
  topRight: 10,
  bottomLeft: 11,
  bottomRight: 12,
};

const UIBarStyle = {
  default: 0,
  black: 1,
  blackTranslucent: 2,
};

module.exports.CLLocationAccuracy = CLLocationAccuracy;
module.exports.UITableViewScrollPosition = UITableViewScrollPosition;
module.exports.UICollectionViewScrollPosition = UICollectionViewScrollPosition;
module.exports.SCNLightType = SCNLightType;
module.exports.SKSceneScaleMode = SKSceneScaleMode;
module.exports.NSTextAlignment = NSTextAlignment;
module.exports.NSParagraphStyleAttributeName = 'NSParagraphStyle';
module.exports.NSForegroundColorAttributeName = 'NSColor';
module.exports.UIControlState = UIControlState;
module.exports.UIViewContentMode = UIViewContentMode;
module.exports.UIBarStyle = UIBarStyle;
