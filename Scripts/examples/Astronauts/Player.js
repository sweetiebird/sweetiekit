const SweetieKit = require('std:sweetiekit.node');

const math = require('../helpers').math;

class Player {
  constructor(node) {
    this.node = node;
    this.node.name = 'player';
    this.refillJumps();
  }

  refillJumps() {
    this.jumps = 2;
  }

  jump(force) {
    if (this.jumps > 0) {
      --this.jumps;
      this.node.physicsBody.velocity = { dx: 0, dy: 0 };
      this.node.physicsBody.applyImpulse({ dx: force.x, dy: force.y });
    }
  }

  move(force) {
    this.node.physicsBody.applyForce({ dx: force.x, dy: force.y });
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
}

module.exports = Player;
