const SweetieKit = require('std:sweetiekit.node');

const SKSceneScaleMode = require('./enums').SKSceneScaleMode;

const math = require('./helpers').math;

const {
  SKScene,
  SKSpriteNode,
  SKAction,
  SKPhysicsContactDelegate,
  SKPhysicsBody,
  SKView,
  SKNode,
} = SweetieKit;

const distToLeftX = (parentSize, childSize) => (parentSize.width - childSize.width) * -0.5;
const distToRightX = (parentSize, childSize) => (parentSize.width - childSize.width) * 0.5;
const distToTopY = (parentSize, childSize) => (parentSize.width - childSize.width) * 0.5;
const distToBtmY = (parentSize, childSize) => (parentSize.height - childSize.height) * -0.5;

class Player {
  constructor(node) {
    this.node = node;
    this.node.name = 'player';
    this.isJumping = false;
  }

  jump() {
    if (!this.isJumping) {
      this.isJumping = true;
      this.node.physicsBody.velocity = { dx: 0, dy: 0 };
      this.node.physicsBody.applyImpulse({ dx: 0, dy: 50 });
    }
  }

  touchedGround() {
    this.isJumping = false;
  }
}

function makeDemo(navigation, dvc) {
  let player;
  let scene;
  let skView;
  let contactDel;
  let joystick;
  let joystickArrows;
  let joystickKnob;

  const PhysicsCategory = {
    none: 0,
    player: 1,
    ground: 2,
  };

  function touchesMoved(touches = []) {
    touches.forEach((t, idx) => {
      const viewLoc = t.locationInView(skView);
      const scnLoc = scene.convertPointFromView(viewLoc);
      const jPos = joystick.convertPointFromNode(scnLoc, scene);

      const radius = Math.min(
        joystickArrows.size.width / 2,
        Math.sqrt(Math.pow(jPos.y, 2) + Math.pow(jPos.x, 2)),
      );

      const angle = Math.atan2(jPos.y, jPos.x);

      joystickKnob.position = {
        x: Math.cos(angle) * radius,
        y: Math.sin(angle) * radius,
      };
    });
  }

  function touchesEnded() {
    const action = SKAction.moveTo({ x: 0, y: 0 }, 0.2);
    joystickKnob.runAction(action, () => {
      joystickKnob.position = { x: 0, y: 0 };
    });
    player.jump();
  }

  function addPlatforms() {
    const groundH = Math.round(scene.size.height * 0.05);
    const groundW = scene.size.width * 0.3;
    const groundOffset = scene.size.width * 0.08;
    const groundSize = { width: groundW, height: groundH };
    const groundY = (distToBtmY(scene.size, groundSize) * 0.45) + 40;
    const topGroundSize = { width: groundW * 0.8, height: groundH };

    const grounds = [
      { x: distToLeftX(scene.size, groundSize) + groundOffset, y: groundY, scaleX: 1, size: groundSize },
      { x: distToRightX(scene.size, groundSize) - groundOffset, y: groundY, scaleX: 1, size: groundSize },
      { x: distToLeftX(scene.size, topGroundSize) + (groundOffset * 2), y: groundY + 98, size: topGroundSize},
      { x: distToRightX(scene.size, topGroundSize) - (groundOffset * 2), y: groundY + 98, size: topGroundSize },
    ];

    for (let i = 0, l = grounds.length; i < l; i++) {
      const ground = new SKSpriteNode('game_ground');
      ground.size = grounds[i].size;
      ground.position = { x: grounds[i].x, y: grounds[i].y };

      ground.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(ground.size);
      ground.physicsBody.isDynamic = false;
      ground.physicsBody.categoryBitMask = PhysicsCategory.ground;
      ground.physicsBody.contactTestBitMask = PhysicsCategory.player;
      ground.physicsBody.collisionBitMask = PhysicsCategory.player;
      ground.physicsBody.allowsRotation = false;
      ground.physicsBody.affectedByGravity = false;

      ground.name = 'floating_ground';

      scene.addChild(ground);
    }
  }

  function makeScene(demoVC) {
    const scn = new SKScene();
    scn.anchorPoint = { x: 0.5, y: 0.5 };
    scn.scaleMode = SKSceneScaleMode.aspectFill;
    scn.size = { width: demoVC.view.bounds.width, height: demoVC.view.bounds.height };
    const bg = new SKSpriteNode('game_bg');
    bg.size = { width: demoVC.view.bounds.width, height: demoVC.view.bounds.height };
    bg.position = { x: 0, y: 0 };
    scn.addChild(bg);
    const stars = new SKSpriteNode('game_stars');
    const starsH = Math.round(demoVC.view.bounds.height * 0.26);
    const starsSize = { width: scn.size.width, height: starsH };
    stars.position = { x: 0, y: distToTopY(scn.size, starsSize) };
    stars.size = starsSize;
    scn.addChild(stars);
    const ground = new SKSpriteNode('game_ground');
    const groundH = Math.round(demoVC.view.bounds.height * 0.08);
    ground.size = { width: demoVC.view.bounds.width, height: groundH };
    ground.position = { x: 0, y: (demoVC.view.bounds.height / -2) + groundH };
    ground.name = 'ground';

    ground.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(ground.size);
    ground.physicsBody.isDynamic = false;
    ground.physicsBody.categoryBitMask = PhysicsCategory.ground;
    ground.physicsBody.contactTestBitMask = PhysicsCategory.player;
    ground.physicsBody.collisionBitMask = PhysicsCategory.player;
    ground.physicsBody.allowsRotation = false;
    ground.physicsBody.affectedByGravity = false;

    scn.addChild(ground);
    return scn;
  }

  function makeJoystick() {
    joystick = new SKNode();
    joystickKnob = new SKSpriteNode('game_knob');
    joystickArrows = new SKSpriteNode('game_arrows');
    const joystickSize = { width: 100, height: 100 };

    joystickKnob.size = joystickSize;
    joystick.size = joystickSize;
    joystickArrows.size = joystickSize;

    joystickKnob.position = { x: 0, y: 0 };
    joystickArrows.position = { x: 0, y: 0 };
    joystick.position = {
      x: distToRightX(scene.size, joystickSize) - 30,
      y: distToBtmY(scene.size, joystickSize) + 30,
    };

    joystickKnob.name = 'knob';
    joystickArrows.name = 'arrows';
    joystick.name = 'joystick';

    joystick.addChild(joystickKnob);
    joystick.addChild(joystickArrows);

    joystick.userInteractionEnabled = true;
    joystickArrows.userInteractionEnabled = true;

    joystickArrows.touchesMoved = touchesMoved;
    joystickArrows.touchesEnded = touchesEnded;

    scene.addChild(joystick);
  }

  function makePlayer(demoVC) {
    const node = new SKSpriteNode('game_player');
    node.size = { width: 36, height: 49 };
    node.position = { x: 0, y: 0};
    // node.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(node.size);
    return new Player(node);
  }

  function makeDelegate() {
    const del = new SKPhysicsContactDelegate();
    del.didBeginContact = (contact) => {
      let firstBody = contact.bodyA;
      let secBody = contact.bodyB;
      console.log(contact.bodyA, contact.bodyB);
      if (firstBody && firstBody.node) {
        if (secBody && secBody.node) {
          if (
            (firstBody.node.name.includes('ground') && secBody.node.name === 'player') ||
            (firstBody.node.name === 'player' && secBody.node.name.includes('ground'))
          ) {
            player.touchedGround();
          }
        }
      }
    };
    return del;
  }

  function makeView(demoVC) {
    const w = demoVC.view.frame.width;
    const h = demoVC.view.frame.height;
    const frame = { x: 0, y:0, width: w, height: h };
    return new SKView(frame);
  }

  function setConstraints(demoVC) {
    skView.translatesAutoresizingMaskIntoConstraints = false;
    skView.leadingAnchor.constraintEqualToAnchor(demoVC.view.leadingAnchor, 0).isActive = true;
    skView.trailingAnchor.constraintEqualToAnchor(demoVC.view.trailingAnchor, 0).isActive = true;
    skView.topAnchor.constraintEqualToAnchor(demoVC.view.topAnchor, 0).isActive = true;
    skView.bottomAnchor.constraintEqualToAnchor(demoVC.view.bottomAnchor, 0).isActive = true;
  }

  function setPhysicsBodies() {
    player.node.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(player.node.size);
    player.node.physicsBody.isDynamic = true;
    player.node.physicsBody.categoryBitMask = PhysicsCategory.player;
    player.node.physicsBody.contactTestBitMask = PhysicsCategory.ground;
    player.node.physicsBody.collisionBitMask = PhysicsCategory.ground;
    player.node.physicsBody.allowsRotation = false;
  }

  function start() {
    skView.presentScene(scene);
    addPlatforms();
  }

  async function make(nav, demoVC) {
    scene = makeScene(demoVC);
    player = makePlayer(demoVC);

    scene.addChild(player.node);

    contactDel = makeDelegate();
    skView = makeView(demoVC);

    scene.physicsWorld.contactDelegate = contactDel;
    demoVC.view.addSubview(skView);

    setConstraints(demoVC);
    setPhysicsBodies();

    makeJoystick();

    // scene.touchesMoved = touchesMoved;
    // scene.touchesEnded = touchesEnded;

    nav.pushViewController(demoVC);

    setTimeout(start, 2000);
  }

  make(navigation, dvc);
}

module.exports = makeDemo;
