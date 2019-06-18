const SweetieKit = require('std:sweetiekit.node');

const { UIKit } = SweetieKit;

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

const UIModalPresentationStyle = {
  none: -1,
  fullScreen: 0,
  pageSheet: 1,
  formSheet: 2,
  currentContext: 3,
  custom: 4,
  overFullScreen: 5,
  overCurrentContext: 6,
  blurOverFullScreen: 7,
  popover: 8,
};

const UIPopoverArrowDirection = {
  up: 0,
  down: 1,
  left: 2,
  right: 3,
  any: 4,
  unknown: -1,
};

module.exports.ARHitTestResultType = {
  /** Result type from intersecting the nearest feature point. */
  featurePoint                                        : (1 << 0),

  /** Result type from intersecting a horizontal plane estimate, determined for the current frame. */
  estimatedHorizontalPlane                            : (1 << 1),

  /** Result type from intersecting a vertical plane estimate, determined for the current frame. */
  estimatedVerticalPlane                              : (1 << 2),

  /** Result type from intersecting with an existing plane anchor. */
  existingPlane                                       : (1 << 3),

  /** Result type from intersecting with an existing plane anchor, taking into account the plane’s extent. */
  existingPlaneUsingExtent                            : (1 << 4),

  /** Result type from intersecting with an existing plane anchor, taking into account the plane’s geometry. */
  existingPlaneUsingGeometry                          : (1 << 5),
};

const UITextAutocorrectionType = {
  default: 0,
  none: 1,
  yes: 2,
};

const UITextSpellCheckingType = {
  default: 0,
  none: 1,
  yes: 2,
};

//typedef NS_ENUM(NSInteger, UITouchPhase)
module.exports.UITouchPhase = {
  began:0,             // whenever a finger touches the surface.
  moved:1,             // whenever a finger moves on the surface.
  stationary:2,        // whenever a finger is touching the surface but hasn't moved since the previous event.
  ended:3,             // whenever a finger leaves the surface.
  cancelled:4,         // whenever a touch doesn't end but we need to stop tracking (e.g. putting device to face)
};

module.exports.MDLMaterialSemantic = {

  baseColor: 0,
  subsurface: 1,
  metallic: 2,
  specular: 3,
  specularExponent: 4,
  specularTint: 5,
  roughness: 6,
  anisotropic: 7,
  anisotropicRotation: 8,
  sheen: 9,
  sheenTint: 10,
  clearcoat: 11,
  clearcoatGloss: 12,

  emission: 13,
  bump: 14,
  opacity: 15,
  interfaceIndexOfRefraction: 16,
  materialIndexOfRefraction: 17,
  objectSpaceNormal: 18,
  tangentSpaceNormal: 19,
  displacement: 20,
  displacementScale: 21,
  ambientOcclusion: 22,
  ambientOcclusionScale: 23,

  none: 0x8000,
  userDefined: 0x8001
};

module.exports.SCNLightType = SCNLightType;
module.exports.SKSceneScaleMode = SKSceneScaleMode;
module.exports.NSParagraphStyleAttributeName = 'NSParagraphStyle';
module.exports.NSForegroundColorAttributeName = 'NSColor';
module.exports.NSFontAttributeName = 'NSFont';
module.exports.NSKernAttributeName = 'NSKern';
module.exports.NSStrokeColorAttributeName = 'NSStrokeColor';
module.exports.NSStrokeWidthAttributeName = 'NSStrokeWidth';
module.exports.UIViewContentMode = UIViewContentMode;
module.exports.UIBarStyle = UIBarStyle;
module.exports.UIProgressViewStyle = UIProgressViewStyle;
module.exports.UIBarMetrics = UIBarMetrics;
module.exports.ARWorldAlignment = ARWorldAlignment;
module.exports.UITableViewSelectionStyle = UITableViewSelectionStyle;
module.exports.UITableViewCellSeparatorStyle = UITableViewCellSeparatorStyle;
module.exports.UILayoutConstraintAxis = UILayoutConstraintAxis;
module.exports.UIStackViewDistribution = UIStackViewDistribution;
module.exports.UIStackViewAlignment = UIStackViewAlignment;
module.exports.UITableViewCellStyle = UITableViewCellStyle;
module.exports.UIModalPresentationStyle = UIModalPresentationStyle;
module.exports.UIPopoverArrowDirection = UIPopoverArrowDirection;
module.exports.UITextAutocorrectionType = UITextAutocorrectionType;
module.exports.UITextSpellCheckingType = UITextSpellCheckingType;
module.exports.UIImageOrientation = UIKit.UIImageOrientation;
