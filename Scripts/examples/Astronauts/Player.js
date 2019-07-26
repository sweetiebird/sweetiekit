const SweetieKit = process._linkedBinding('sweetiekit');

const math = require('../helpers').math;

class Player {
  constructor(node) {
    this.node = node;
    this.refillJumps();
    this.impulse = math.v2(0, 0);
    this.jumpImpulse = math.v2(0, 0);
  }

  refillJumps() {
    this.jumps = 2;
  }

  jump(force = Player.jumpForce) {
    if (this.jumps > 0) {
      --this.jumps;
      //this.node.physicsBody.velocity = { dx: 0, dy: 0 };
      //this.node.physicsBody.applyImpulse({ dx: force.x, dy: force.y });
      this.jumpImpulse.x += force.x;
      this.jumpImpulse.y += force.y;
    }
  }

  move(impulse, speed = Player.speed) {
    if (speed !== 0) {
      if (impulse.x !== 0 || impulse.y !== 0) {
        this.node.physicsBody.applyImpulse({ dx: speed*impulse.x, dy: speed*impulse.y });
      }
    }
  }
  

  touchedGround() {
    this.refillJumps();
  }

  kill() {
    this.refillJumps();
    this.node.position = math.v2(0, 0);
  }

  get position() {
    return this.node.position;
  }
  
  update() {
    this.move(this.impulse);
    this.move(this.jumpImpulse);
    this.jumpImpulse.x = 0;
    this.jumpImpulse.y = 0;
  }
}

Player.speed = 1.5;
Player.jumpForce = math.v2(0, 30);

module.exports = Player;
