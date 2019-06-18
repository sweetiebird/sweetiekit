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

module.exports.SCNLightType = SCNLightType;
module.exports.SKSceneScaleMode = SKSceneScaleMode;
