class Player {
  constructor(node) {
    this.node = node;
    this.node.name = 'player';
    this.pos = { x: 0, y: 0 };
    this.dest = { x: 0, y: 0 };
    this.speed = 200;
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

  update(dt) {
  }
}

module.exports = Player;

