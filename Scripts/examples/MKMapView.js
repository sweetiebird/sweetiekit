const SweetieKit = require('std:sweetiekit.node');

const {
  MKMapView,
} = SweetieKit;

async function make(demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h };
  const view = new MKMapView(frame);
  demoVC.view.addSubview(view);
  setTimeout(() => {
    view.setRegion({ latitude: 41.880600, longitude: -87.630050 }, 1000, 1000, true);
    view.addAnnotation({ latitude: 41.880600, longitude: -87.630050 }, 'Novel Coworking!');
    view.addAnnotation({ latitude: 41.909830, longitude: -87.648360 }, 'Home Sweet Home!');
  }, 1000);
  return undefined;
}

module.exports = make;
