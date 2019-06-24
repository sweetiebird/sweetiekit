const SweetieKit = require('std:sweetiekit.node');

const {
  MKMapView,
  MKMapViewDelegate,
  MKAnnotationView,
} = SweetieKit;

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h };
  const view = new MKMapView(frame);
  const del = new MKMapViewDelegate();

  demoVC.view.addSubview(view);
  setTimeout(() => {
    const region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(41.880600, -87.630050), 1000, 1000);
    view.setRegionAnimated(region, true);
    view.addAnnotation(MKAnnotation({
      coordinate: CLLocationCoordinate2DMake(41.880600, -87.630050),
      title: 'Novel Coworking',
      subtitle: 'Just Work'
    }));
    view.addAnnotation(MKAnnotation({
      coordinate: CLLocationCoordinate2DMake(41.909830, -87.648360),
      title: 'Home Sweet Home',
    }));
  }, 1000);
  return undefined;
}

module.exports = make;
