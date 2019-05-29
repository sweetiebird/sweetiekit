const SweetieKit = require('std:sweetiekit.node');

const SKSceneScaleMode = require('./enums').SKSceneScaleMode;

const math = require('./helpers').math;

const {
  SKScene,
  SKSpriteNode,
  SKAction,
  SKPhysicsContactDelegate,
  SKPhysicsBody,
} = SweetieKit;


function makeDemo(navigation, dvc) {
  let player;
  let scene;
  let view;
  let contactDel;

  const PhysicsCategory = {
    none: 0,
    player: 1,
    ground: 2,
  };

  function touchesEnded(touches) {
  }

  function makeScene(demoVC) {
    scene = new SKScene('GameScene');
    scene.scaleMode = SKSceneScaleMode.resizeFill;
    scene.touchesEnded = touchesEnded;
    scene.physicsWorld.gravity = { dx: 0, dy: -9.8 };
  }

  function makePlayer(demoVC) {
    player = scene.childNodeWithName('player');
    player.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(player.size);
  }

  function makeDelegate() {
    contactDel = new SKPhysicsContactDelegate();
    contactDel.didBeginContact = (contact) => {
      let firstBody = contact.bodyA;
      let secBody = contact.bodyB;
      console.log(contact.bodyA, contact.bodyB);
      if (firstBody && firstBody.node) {
        firstBody.node.removeFromParent();
      }
      if (secBody && secBody.node) {
        secBody.node.removeFromParent();
      }
    };
    scene.physicsWorld.contactDelegate = contactDel;
  }

  function makeView(demoVC) {
    const w = demoVC.view.frame.width;
    const h = (demoVC.view.frame.height - 84);
    const frame = { x: 0, y:0, width: w, height: h };
    view = new SKView(frame);
  }

  function start(demoVC) {
    view.presentScene(scene);
  }

  async function make(nav, demoVC) {
    makeScene(demoVC);
    makePlayer(demoVC);
    makeDelegate();
    makeView(demoVC);

    nav.pushViewController(demoVC);
    setTimeout(() => {
      start(demoVC);
    }, 2000);
    return view;
  }

  make(navigation, dvc);
}

module.exports = makeDemo;
