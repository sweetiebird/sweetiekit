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
