const SweetieKit = require('std:sweetiekit.node');

const SKSceneScaleMode = require('./enums').SKSceneScaleMode;

const {
  SKNode,
  SKPhysicsBody,
  SKScene,
} = SweetieKit;

async function make(demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const size = { width: w, height: h };
  const scene = SKScene.sceneWithSize(size);
  scene.backgroundColor = { red: 218/255, green: 112/255, blue: 214/255 };
  scene.scaleMode = SKSceneScaleMode.resizeFill;
  const frame = { x: 0, y:0, width: w, height: h };
  const view = new SKView(frame);
  setTimeout(() => {
    view.presentScene(scene);
  }, 2000);
  return view;
}

module.exports = make;
