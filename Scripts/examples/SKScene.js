const SweetieKit = require('std:sweetiekit.node');

const SKSceneScaleMode = require('./enums').SKSceneScaleMode;

const {
  SKNode,
  SKPhysicsBody,
  SKScene,
  SKSpriteNode,
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
  const sprite = new SKSpriteNode('laarc');
  const body = SKPhysicsBody.bodyWithCircleOfRadius(sprite.size.width / 2);
  sprite.physicsBody = body;
  sprite.affectedByGravity = true;
  setTimeout(() => {
    view.presentScene(scene);
    scene.addChild(sprite);
    sprite.position = { x: w / 2, y: h / 2 };
  }, 2000);
  return view;
}

module.exports = make;
