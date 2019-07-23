const SweetieKit = process._linkedBinding('sweetiekit');

const {
  UIImage,
  CAEmitterLayer,
  CAEmitterCell,
} = SweetieKit;

async function make(nav, demoVC) {
  view = demoVC.view;
  layer = new CAEmitterLayer();
  layer.emitterPosition = view.center;
  layer.renderMode = kCAEmitterLayerOldestFirst;
  cell = new CAEmitterCell();
  cell.alphaSpeed = -0.4;
  cell.birthRate = 100;
  cell.lifetime = 10;
  cell.velocity = 100;
  cell.scale = 0.1;
  cell.emissionRange = Math.PI * 2.0;
  cell.contents = UIImage('nic');

  layer.emitterCells = [cell];

  demoVC.view.layer.addSublayer(layer);

  return undefined;
}

module.exports = make;
