const SweetieKit = require('std:sweetiekit.node');

const colors = require('./colors');
const { UIControlState, UIControlEvents } = require('./enums');

const {
  CLGeocoder,
  UITextField,
  UILabel,
  CLLocationManager,
  CLLocationManagerDelegate,
  MKMapView,
  MKMapViewDelegate,
} = SweetieKit;

let mapView;
let distance;
let location;
let location2;
let text;
let distLabel;

function makeMap(demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h };
  mapView = new MKMapView(frame);
  const del = new MKMapViewDelegate();

  demoVC.view.addSubview(mapView);

  if (location) {
    const region = {
      coordinate: location.coordinate,
      latitudinalMeters: 500,
      longitudinalMeters: 500,
    };
    mapView.setRegion(region, true);
  }

  return undefined;
}

function updateMap() {
  const region = {
    coordinate: location.coordinate,
    latitudinalMeters: distance + 200,
    longitudinalMeters: distance + 200,
  };
  mapView.setRegion(region, true);
  mapView.addAnnotation({
    coordinate: location2.coordinate,
    title: 'GREEN DOT',
  });
  mapView.addAnnotation({
    coordinate: location.coordinate,
    title: 'YOU ARE HERE',
  });
  distLabel.text = `Distance: ${Math.round(distance)} meters`;
}

async function make(demoVC) {
  makeMap(demoVC);

  const geocoder = new CLGeocoder();

  const w = demoVC.view.frame.width;

  const field = await UITextField.alloc(12, 80, w - 24, 50, () => {
    text = field.text;
  });

  const btn = new UIButton({
    x: 12,
    y: 150,
    width: w - 24,
    height: 40,
  });

  btn.title = 'Geocode Address';

  btn.addTarget(() => {
    if (text) {
      geocoder.geocodeAddressString(text, (placemarks) => {
        if (Array.isArray(placemarks)) {
          const p = placemarks[0];
          location2 = p.location;
          distance = location.distance(location2);
          updateMap();
        }
      });
    }
  }, UIControlEvents.touchUpInside);

  btn.setTitleColorForState(colors.black, UIControlState.normal);
  btn.backgroundColor = colors.fitbodPink;

  distLabel = new UILabel({
    x: 12,
    y: 220,
    width: w - 24,
    height: 20,
  });
  distLabel.numberOfLines = 0;

  demoVC.view.addSubview(field);
  demoVC.view.addSubview(btn);
  demoVC.view.addSubview(distLabel);

  const mgr = new CLLocationManager();
  mgr.delegate = new CLLocationManagerDelegate(() => {
    mgr.startUpdatingLocation();
  }, (_, locations) => {
    if (Array.isArray(locations) && locations.length > 0 && !location) {
      location = locations[0];
      if (mapView) {
        const region = {
          coordinate: location.coordinate,
          latitudinalMeters: 500,
          longitudinalMeters: 500,
        };
        mapView.setRegion(region, true);
      }
    }
  }, () => {});
  mgr.requestAlwaysAuthorization();

  return undefined;
}

module.exports = make;
