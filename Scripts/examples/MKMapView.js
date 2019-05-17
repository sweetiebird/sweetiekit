const SweetieKit = require('std:sweetiekit.node');

const {
  MKMapView,
  MKMapViewDelegate,
  MKAnnotationView,
} = SweetieKit;

async function make(demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h };
  const view = new MKMapView(frame);
  const del = new MKMapViewDelegate();

  demoVC.view.addSubview(view);
  setTimeout(() => {
    const region = {
      coordinate: { latitude: 41.880600, longitude: -87.630050 },
      latitudinalMeters: 1000,
      longitudinalMeters: 1000,
    };
    view.setRegion(region, true);
    view.addAnnotation({
      coordinate: { latitude: 41.880600, longitude: -87.630050 },
      title: 'Novel Coworking',
      subtitle: 'Just Work' },
    );
    view.addAnnotation({
      coordinate: { latitude: 41.909830, longitude: -87.648360 },
      title: 'Home Sweet Home',
    });
  }, 1000);
  return undefined;
}

module.exports = make;
