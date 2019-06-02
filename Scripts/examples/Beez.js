const SweetieKit = require('std:sweetiekit.node');

const SKSceneScaleMode = require('./enums').SKSceneScaleMode;

const math = require('./helpers').math;

const v2 = (...args) => {
  switch (args.length == 0) {
    case 0: return new THREE.Vector2(0, 0);
    case 1: return (args[0] instanceof THREE.Vector2) ? args[0] : new THREE.Vector2(args[0].x, args[0].y);
    default: return new THREE.Vector2(args[0], args[1]);
  }
};

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
    this.refillJumps();
  }

  configure() {
    this.node.colorBlendFactor = 0.5;
    switch (this.jumps) {
      case 0:
        this.node.color = {red: 0.0, green: 0.0, blue: 1.0};
        break;
      case 1:
        this.node.color = {red: 1.0, green: 0.0, blue: 0.0};
        break;
      default:
        this.node.color = {red: 1.0, green: 1.0, blue: 1.0};
        break;
    }
  }

  refillJumps() {
    this.jumps = 2;
    this.configure();
  }

  jump(force) {
    if (this.jumps > 0) {
      --this.jumps;
      this.configure();
      this.node.physicsBody.velocity = { dx: 0, dy: 0 };
      this.node.physicsBody.applyImpulse({ dx: force.x, dy: force.y });
    }
  }

  move(force) {
  }

  touchedGround() {
    this.refillJumps();
  }

  kill() {
    this.refillJumps();
    this.node.position = v2(0, 0);
  }
}

function makeDemo(navigation, dvc) {
  //let player;
  //let scene;
  //let skView;
  //let contactDel;
  //let joystick;
  //let joystickArrows;
  //let joystickKnob;

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
    player.jump(joystickKnob.position);
    const action = SKAction.moveTo(v2(0, 0), 0.2);
    joystickKnob.runAction(action, () => {
      joystickKnob.position = v2(0, 0);
    });
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
    const groundW = demoVC.view.bounds.width * 1000;
    ground.size = { width: 2*groundW, height: groundH };
    ground.position = { x: -groundW, y: (demoVC.view.bounds.height / -2) + groundH };
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

    joystickKnob.position = v2(0, 0);
    joystickArrows.position = v2(0, 0);
    joystick.position = v2(
      distToRightX(scene.size, joystickSize) - 30,
      distToBtmY(scene.size, joystickSize) + 30,
    );

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
    node.position = v2(0, 0);
    // node.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(node.size);
    return new Player(node);
  }

  function makeDelegate() {
    const del = new SKPhysicsContactDelegate();
    del.didBeginContact = (contact) => {
      let bodyA = contact.bodyA;
      let bodyB = contact.bodyB;
      console.log(contact.bodyA.node.name, contact.bodyB.node.name);
      if (bodyA && bodyA.node) {
        if (bodyB && bodyB.node) {
          if (
            (bodyA.node.name.includes('ground') && bodyB.node.name === 'player') ||
            (bodyA.node.name === 'player' && bodyB.node.name.includes('ground'))
          ) {
            player.touchedGround();
          }
        }
      }
    };
    return del;
  }

  // sometimes the ground contact never seems to fire. This unsticks the player.
  let prevPos = v2(0, 0);
  let curPos = v2(0, 0);
  setInterval(() => {
    prevPos.x = curPos.x;
    prevPos.y = curPos.y;
    let pos = player.node.position;
    if (!pos || pos.y < -scene.size.height) {
      player.kill();
    } else {
      curPos.x = pos.x;
      curPos.y = pos.y;
      if (curPos.distanceTo(prevPos) < 0.01) {
        player.touchedGround();
      }
    }
  }, 1000);

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

    // scene.touchesBegan = touchesMoved;
    // scene.touchesMoved = touchesMoved;
    // scene.touchesEnded = touchesEnded;

    nav.pushViewController(demoVC);

    skView.viewWillAppear = () => {
      start();
    }
  }

  make(navigation, dvc);
}

module.exports = makeDemo;
