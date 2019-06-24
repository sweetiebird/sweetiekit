const SweetieKit = require('std:sweetiekit.node');

const math = require('./helpers').math;

const {
  SKScene,
  SKSpriteNode,
  SKAction,
  SKPhysicsContactDelegate,
  SKPhysicsBody,
} = SweetieKit;

let player;
let scene;
let view;
let contactDel;

const PhysicsCategory = {
  none: 0,
  monster: 1,
  projectile: 2,
};

const random = (min, max) => (
  (Math.random() * max) + min
);

function makePlayer(demoVC) {
  player = new SKSpriteNode('player');
  player.position = {
    x: demoVC.view.frame.width * 0.1,
    y: (demoVC.view.frame.height - 84) * 0.5,
  };
}

function touchesEnded(touches) {
  if (touches.length > 0) {
    const t = touches[0];
    const loc = t.locationInView(view);
    const l = {
      x: loc.x,
      y: view.frame.height - loc.y,
    };

    let projectile = new SKSpriteNode('projectile');
    projectile.position = player.position;

    projectile.physicsBody = SKPhysicsBody.bodyWithCircleOfRadius(projectile.size.width / 2);
    projectile.physicsBody.isDynamic = true;
    projectile.physicsBody.categoryBitMask = PhysicsCategory.projectile;
    projectile.physicsBody.contactTestBitMask = PhysicsCategory.monster;
    projectile.physicsBody.collisionBitMask = PhysicsCategory.none;
    projectile.physicsBody.usesPreciseCollisionDetection = true;

    const offset = math.point.sub(l, projectile.position);
    const direction = math.point.normalized(offset);
    const shootAmount = math.point.mult(direction, 1000);
    const realDest = math.point.add(shootAmount, projectile.position);

    scene.addChild(projectile);

    setTimeout(() => {
      projectile.physicsBody.node.removeFromParent();
    }, 1500);


    const actionMove = SKAction.moveTo(realDest, 2);
    const moveDone = SKAction.removeFromParent();
    const sequence = SKAction.sequence([actionMove, moveDone]);
    projectile.runAction(sequence, () => {});
  }
}

function makeScene(demoVC) {
  const w = demoVC.view.frame.width;
  const h = (demoVC.view.frame.height - 84);
  const size = { width: w, height: h };
  scene = SKScene.sceneWithSize(size);
  scene.backgroundColor = RGB( 135, 206, 250 );
  scene.scaleMode = SKSceneScaleModeResizeFill;
  scene.touchesEnded = touchesEnded;
  scene.physicsWorld.gravity = { dx: 0, dy: 0 };
}

function makeDelegate() {
  contactDel = new SKPhysicsContactDelegate();
  contactDel.didBeginContact = (contact) => {
    let firstBody = contact.bodyA;
    let secBody = contact.bodyB;
    console.log(contact, contact.bodyA, contact.bodyB);
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

function addMonster(demoVC) {
  let monster = new SKSpriteNode('monster');

  const height = (demoVC.view.frame.height - 84);
  const width = demoVC.view.frame.width;
  const size = monster.size;
  const y = random(size.height, (height - size.height));
  const x = width - size.width;
  monster.position = { x, y };

  monster.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(size);
  monster.physicsBody.isDynamic = true;
  monster.physicsBody.categoryBitMask = PhysicsCategory.monster;
  monster.physicsBody.contactTestBitMask = PhysicsCategory.projectile;
  monster.physicsBody.collisionBitMask = PhysicsCategory.none;

  scene.addChild(monster);

  const duration  = random(2, 4);
  const actionMove = SKAction.moveTo({ x: -size.width / 2, y }, duration);
  const moveDone = SKAction.removeFromParent();
  const sequence = SKAction.sequence([actionMove, moveDone]);

  monster.runAction(sequence, () => {});
}

function start(demoVC) {
  view.presentScene(scene);
  scene.addChild(player);
  setInterval(() => {
    addMonster(demoVC);
  }, 500);
}

async function make(nav, demoVC) {
  makePlayer(demoVC);
  makeScene(demoVC);
  makeDelegate();
  makeView(demoVC);

  setTimeout(() => {
    start(demoVC);
  }, 2000);
  return view;
}

module.exports = make;
