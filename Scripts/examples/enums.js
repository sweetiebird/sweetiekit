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

const ARWorldAlignment = {
  camera: 0,
  gravity: 1,
  gravityAndHeading: 2,
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
module.exports.ARWorldAlignment = ARWorldAlignment;
module.exports.UIStackViewDistribution = UIStackViewDistribution;
module.exports.UIStackViewAlignment = UIStackViewAlignment;
