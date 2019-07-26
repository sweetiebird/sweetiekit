const SweetieKit = process._linkedBinding('sweetiekit');

const Colyseus = require('colyseus.js');

const math = require('../helpers').math;

const Player = require('./Player');

const v2 = math.v2;

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

Astronauts_players = [];

Astronauts_makeDemo = function Astronauts_makeDemo(navigation, dvc) {
  //let player;
  //let scene;
  //let skView;
  //let contactDel;
  //let joystick;
  //let joystickArrows;
  // let joystickKnob;
  var client = new Colyseus.Client('ws://localhost:2567');
  var room = client.join('create_or_join');
  room.onJoin.add(function() {
    console.log(room.id);
    console.log('joined!');
  });

  const PhysicsCategory = {
    none: 0,
    player: 1,
    ground: 2,
  };

  function touchesMoved(touches = []) {
    const copy = Array.from(touches);
    copy.forEach((t, idx) => {
      const viewLoc = t.locationInView(skView);
      const scnLoc = scene.convertPointFromView(viewLoc);
      const jPos = joystick.convertPointFromNode(scnLoc, scene);

      const radius = Math.min(
        joystickArrows.size.width / 2,
        Math.sqrt(Math.pow(jPos.y, 2) + Math.pow(jPos.x, 2)),
      );

      const angle = Math.atan2(jPos.y, jPos.x);
      Astronauts_players[0].impulse = {
        x: Math.cos(angle),
        y: -Math.sin(angle),
      };
      joystickKnob.position = {
        x: Math.cos(angle) * radius,
        y: Math.sin(angle) * radius,
      };
    });
  }

  function touchesEnded() {
    // player.jump(joystickKnob.position);
    const action = SKAction.moveToDuration(v2(0, 0), 0.1);
    joystickKnob.runAction(action, () => {
      joystickKnob.position = v2(0, 0);
    });
  }

  function touchesBegan() {
  }
  
  function inputJump(player) {
    // const bothZero = joystickKnob.position.x === 0 && joystickKnob.position.y === 0;
    // const jumpPos = {
    //   x: !bothZero ? joystickKnob.position.x : player.node.position.x,
    //   y: !bothZero ? joystickKnob.position.y : player.node.position.y + player.node.size.height,
    // };
    // console.log(jumpPos);
    /*
    const force = {
      x: 0,
      y: Player.jumpForce,
    };
    player.jump(force);
    if (knob.position.x === 0 && knob.position.y === 0) {
    } else {
      const { x, y } = knob.position;
      player.jump({ x, y: y + 30 });
    }
    */
    player.jump();
  }

  function sceneTouchesBegan(touches = []) {
    const copy = Array.from(touches);
    if (copy.length) {
      const last = copy[copy.length - 1];
      const viewLoc = last.locationInView(skView);
      if (viewLoc.x < skView.frame.width * 0.6) {
        inputJump(Astronauts_players[0]);
      }
    }
  }

  function addPlatforms() {
    const groundH = 18;
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
      const ground = SKSpriteNode('game_ground');
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
    const scn = SKScene();
    scn.anchorPoint = { x: 0.5, y: 0.5 };
    scn.scaleMode = SKSceneScaleModeAspectFill;
    scn.size = { width: demoVC.view.bounds.width, height: demoVC.view.bounds.height };
    const bg = SKSpriteNode('game_bg');
    bg.size = { width: demoVC.view.bounds.width, height: demoVC.view.bounds.height };
    bg.position = { x: 0, y: 0 };
    scn.addChild(bg);
    const stars = SKSpriteNode('game_stars');
    const starsH = Math.round(demoVC.view.bounds.height * 0.26);
    const starsSize = { width: scn.size.width, height: starsH };
    stars.position = { x: 0, y: distToTopY(scn.size, starsSize) };
    stars.size = starsSize;
    scn.addChild(stars);
    const ground = SKSpriteNode('game_ground');
    const groundH = Math.round(demoVC.view.bounds.height * 0.08);
    const groundW = demoVC.view.bounds.width * 1000;
    ground.size = { width: 2*groundW, height: groundH };
    ground.position = { x: -(groundW * 0.5), y: (demoVC.view.bounds.height / -2) + groundH };
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
    joystick = SKNode();
    joystickKnob = SKSpriteNode('game_knob');
    joystickArrows = SKSpriteNode('game_arrows');
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

    joystick.isUserInteractionEnabled = true;
    joystickArrows.isUserInteractionEnabled = true;

    joystickArrows.touchesMovedWithEvent = touchesMoved;
    joystickArrows.touchesEndedWithEvent = touchesEnded;
    joystickArrows.touchesBeganWithEvent = touchesBegan;

    scene.addChild(joystick);
  }

  function makePlayer(playerIndex, demoVC, position = v2(0, 0)) {
    const node = SKSpriteNode('game_player');
    node.name = `player ${playerIndex}`;
    node.size = { width: 36, height: 49 };
    node.position = position;
    const physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(node.size);
    physicsBody.isDynamic = true;
    physicsBody.categoryBitMask = PhysicsCategory.player;
    physicsBody.contactTestBitMask = PhysicsCategory.player | PhysicsCategory.ground;
    physicsBody.collisionBitMask = PhysicsCategory.player | PhysicsCategory.ground;
    physicsBody.allowsRotation = false;
    node.physicsBody = physicsBody;
    const player = new Player(node);

    // sometimes the ground contact never seems to fire. This unsticks the player.
    let prevPos = v2(0, 0);
    let curPos = v2(0, 0);
    player._checkGroundInterval = setInterval(() => {
      if (scene == null || scene.size == null || scene.size.height == null) {
        clearInterval(player._checkGroundInterval);
        return;
      }
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
    
    return player;
  }

  function makeDelegate() {
    const del = SKPhysicsContactDelegate();
    del.didBeginContact = (contact) => {
      let bodyA = contact.bodyA;
      let bodyB = contact.bodyB;
      if (bodyA && bodyA.node && bodyA.node.name) {
        if (bodyB && bodyB.node && bodyB.node.name) {
          const nameA = String(bodyA.node.name);
          const nameB = String(bodyB.node.name);
          for (let i = 0; i < Astronauts_players.length; i++) {
            if (
              (nameA.includes('ground') && nameB === `player ${i}`) ||
              (nameA === `player ${i}` && nameB.includes('ground'))
            ) {
              Astronauts_players[i].touchedGround();
            }
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
    scene.physicsBody = SKPhysicsBody.bodyWithEdgeLoopFromRect(scene.frame);
    scene.physicsBody.isDynamic = false;
    scene.physicsBody.categoryBitMask = PhysicsCategory.ground;
    scene.physicsBody.contactTestBitMask = PhysicsCategory.player;
    scene.physicsBody.collisionBitMask = PhysicsCategory.player;
    scene.physicsBody.allowsRotation = false;
    scene.physicsBody.affectedByGravity = false;
  }

  function start() {
    skView.presentScene(scene);
    addPlatforms();
  }

  Astronauts_joystickRadius = 30;
  Astronauts_OnGamepadValueChanged = (gamepad, input) => {
    const desc = input.debugDescription;
    const playerIndex = gamepad.controller.playerIndex;
    const player = Astronauts_players[playerIndex];
    console.log('GamepadValueChanged', gamepad, input, `Player ${playerIndex}`, desc);
    if (player) {
      if (desc.startsWith("Button A ")) {
        if (input.isPressed) {
          // jump
          console.log(`Player ${playerIndex} jump`);
          inputJump(player);
        }
      } else if (desc.startsWith("Left Thumbstick")) {
        player.impulse = {
          x: input.xAxis.value,
          y: input.yAxis.value,
        };
        if (playerIndex === 0) {
          const radius = Astronauts_joystickRadius;
          joystickKnob.position = {
            x: player.impulse.x * radius,
            y: player.impulse.y * radius,
          };
        }
      }
    }
  }

  async function make(nav, demoVC) {
    scene = makeScene(demoVC);
    Astronauts_players[0] = makePlayer(0, demoVC, v2(30, 0));
    Astronauts_players[1] = makePlayer(1, demoVC, v2(-30, 0));

    for (let player of Astronauts_players) {
      scene.addChild(player.node);
    }

    contactDel = makeDelegate();
    skView = makeView(demoVC);
    skView.multipleTouchEnabled = true;

    scene.physicsWorld.contactDelegate = contactDel;
    demoVC.view.addSubview(skView);
    demoVC.view.multipleTouchEnabled = true;

    setConstraints(demoVC);
    setPhysicsBodies();

    makeJoystick();

    scene.touchesBeganWithEvent = sceneTouchesBegan;
    // scene.touchesMoved = touchesMoved;
    // scene.touchesEndedWithEvent = touchesEnded;

    scene.update = () => {
      for (let player of Astronauts_players) {
        player.update(scene);
      }
    };

    nav.pushViewControllerAnimated(demoVC, true);

    skView.viewWillAppear = () => {
      start();
    }
    
    OnGamepadValueChanged = (...args) => Astronauts_OnGamepadValueChanged(...args);
  }

  make(navigation, dvc);
}

module.exports = Astronauts_makeDemo;
