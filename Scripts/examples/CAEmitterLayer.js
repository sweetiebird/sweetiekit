const SweetieKit = require('std:sweetiekit.node');

const {
  UIImage,
  CAEmitterLayer,
  CAEmitterCell,
} = SweetieKit;

async function make(nav, demoVC) {
  const view = demoVC.view;
  const layer = new CAEmitterLayer();
  layer.emitterPosition = { x: view.frame.width / 2, y: view.frame.height / 2 };
  const cell = new CAEmitterCell();
  cell.birthrate = 100;
  cell.lifetime = 10;
  cell.velocity = 100;
  cell.scale = 0.1;
  cell.emissionRange = Math.PI * 2.0;
  cell.contents = UIImage('laarc');

  layer.emitterCells = [cell];

  demoVC.view.layer.addSublayer(layer);

  return undefined;
}

module.exports = make;
