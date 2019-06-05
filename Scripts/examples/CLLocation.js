const SweetieKit = require('std:sweetiekit.node');
THREE = require('../vendor/three/three');

const colors = require('./colors');
const { UIControlState, UIControlEvents } = require('./enums');
const math = require('./helpers/math');

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
let trueHeading;
let arView;

// const angleFromCoord = (lat1, long1, lat2, long2) => {
//   const dLong = long2 - long1;
//   const y = Math.sin(dLong) * Math.cos(lat2);
//   const x = (Math.cos(lat1) * Math.sin(lat2)) - (Math.sin(lat1) * Math.cos(lat2) * Math.cos(dLong));
//   const brng = Math.atan2(y, x);
//   return brng * (180 / Math.PI);
//   // return (deg + 360) / 360;
// };

const angleFromCoord = (lat1, long1, lat2, long2) => {
  const dLong = long2 - long1;
  const y = Math.sin(dLong) * Math.cos(lat2);
  const x = (Math.cos(lat1) * Math.sin(lat2)) - (Math.sin(lat1) * Math.cos(lat2) * Math.cos(dLong));
  if (y > 0) {
    if (x > 0) {
      return Math.atan(y / x);
    } else if (x < 0) {
      return 180 - (Math.atan(-y / x));
    } else {
      return 90;
    }
  } else if (y < 0) {
    if (x > 0) {
      return -Math.atan(-y / x);
    } else if (x < 0) {
      return Math.atan(y / x) - 180;
    } else {
      return 270;
    }
  } else {
    if (x > 0) {
      return 0;
    } else if (x < 0) {
      return 180;
    } else {
      return 0;
    }
  }
  // return (deg + 360) / 360;
};

const degFromCoord = (lat1, lat2, long1, long2) => {
  const radians = angleFromCoord(lat1, lat2, long1, long2);
  return radians * (180 / Math.PI);
};

// convert angles into vectors
// take .product after normalizing
// gives cos of angle between them

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
  const dest = doMath(
    location.coordinate.latitude,
    location.coordinate.longitude,
    location2.coordinate.latitude,
    location2.coordinate.longitude,
    trueHeading,
  );
  console.log(dest);
}

const headingCounterClockwise = (heading) => {
  return 360 - heading;
};

const angularDifference = (lat1, lat2, long1, long2, heading) => {
  const eastAngles = degFromCoord(lat1, lat2, long1, long2);
  const eastHeading = headingCounterClockwise(heading);
  return eastAngles - eastHeading;
};

function doMath(lat1, lat2, long1, long2, heading) {
  const deg = angularDifference(lat1, lat2, long1, long2, heading);
  const rads = deg * (Math.PI / 180);
  const x = Math.cos(rads);
  const y = Math.sin(rads);
  const v = new THREE.Vector3(x, y, 0);
  v.multiplyScalar(distance);
  return v;
}

async function make(nav, demoVC) {
  makeMap(demoVC);

  const geocoder = new CLGeocoder();

  const w = demoVC.view.frame.width;

  const field = await UITextField.alloc(12, 80, w - 24, 50, () => {
    text = field.text;
  });

  const btn = UIButton({
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

  distLabel = UILabel({
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
    mgr.startUpdatingHeading();
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
  }, (_, heading) => {
    trueHeading = heading.trueHeading;
    console.log(trueHeading);
  });
  mgr.requestAlwaysAuthorization();

  return undefined;
}

module.exports = make;
