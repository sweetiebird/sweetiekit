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

const UIControlEvents = {
  touchDown: 1 << 0,
  touchDownRepeat: 1 << 1,
  touchDragInside: 1 << 2,
  touchDragOutside: 1 << 3,
  touchDragEnter: 1 << 4,
  touchDragExit: 1 << 5,
  touchUpInside: 1 << 6,
  touchUpOutside: 1 << 7,
  touchCancel: 1 << 8,
  valueChanged: 1 << 12,
  primaryActionTriggered: 1 << 13,
  editingDidBegin: 1 << 16,
  editingChanged: 1 << 17,
  editingDidEnd: 1 << 18,
  editingDidEndOnExit: 1 << 19,
};

const UIProgressViewStyle = {
  default: 0,
  bar: 1,
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

const UIBarMetrics = {
  default: 0,
  compact: 1,
  defaultPrompt: 2,
  compactPrompt: 3,
};

const ARWorldAlignment = {
  camera: 0,
  gravity: 1,
  gravityAndHeading: 2,
};

const UITableViewSelectionStyle = {
  none: 0,
  blue: 1,
  gray: 2,
  default: 3,
};

const UITableViewCellSeparatorStyle = {
  none: 0,
  singleLine: 1,
};

const UILayoutConstraintAxis = {
  horizontal: 0,
  vertical: 1,
};

const UIStackViewDistribution = {
  fill: 0,
  fillEqually: 1,
  fillProportionally: 2,
  equalSpacing: 3,
  equalCentering: 4,
};

const UIStackViewAlignment = {
  fill: 0,
  leading: 1,
  top: 2,
  firstBaseline: 3,
  center: 4,
  trailing: 5,
  bottom: 6,
  lastBaseline: 7,
};

const UITableViewCellStyle = {
  default: 0,
  value1: 1,
  value2: 2,
  subtitle: 3,
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
module.exports.UIControlEvents = UIControlEvents;
module.exports.UIProgressViewStyle = UIProgressViewStyle;
module.exports.UIBarMetrics = UIBarMetrics;
module.exports.ARWorldAlignment = ARWorldAlignment;
module.exports.UITableViewSelectionStyle = UITableViewSelectionStyle;
module.exports.UITableViewCellSeparatorStyle = UITableViewCellSeparatorStyle;
module.exports.UILayoutConstraintAxis = UILayoutConstraintAxis;
module.exports.UIStackViewDistribution = UIStackViewDistribution;
module.exports.UIStackViewAlignment = UIStackViewAlignment;
module.exports.UITableViewCellStyle = UITableViewCellStyle;
