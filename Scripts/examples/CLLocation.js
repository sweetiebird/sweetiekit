const SweetieKit = require('std:sweetiekit.node');
THREE = require('../vendor/three/three');

const colors = require('./colors');
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

location = null;
trueHeading = 0;

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
  demoVC.view.addSubview(mapView);

  if (location) {
    const region = MKCoordinateRegionMakeWithDistance(location.coordinate, 500, 500);
    mapView.setRegionAnimated(region, true);
  }

  return undefined;
}

function updateMap() {
  region = MKCoordinateRegionMakeWithDistance(location.coordinate, distance + 200, distance + 200);
  mapView.setRegionAnimated(region, true);
  mapView.addAnnotation(MKAnnotation({
    coordinate: location2.coordinate,
    title: 'GREEN DOT',
  }));
  mapView.addAnnotation(MKAnnotation({
    coordinate: location.coordinate,
    title: 'YOU ARE HERE',
  }));
  distLabel.text = `Distance: ${Math.round(distance)} meters`;
  dest = doMath(
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

  const frame = {x: 12, y: 80, width: w - 24, height: 50};
  textField = UITextField.alloc().initWithFrame(frame);
  textField.placeholder = "Enter address here";
  textField.font = UIFont.systemFontOfSize(15);
  textField.borderStyle = UITextBorderStyleRoundedRect;
  textField.returnKeyType = UIReturnKeyDone;
  textField.clearButtonMode = UITextFieldViewModeWhileEditing;

  _action = () => {
    text = textField.text.trim();
    if (text.length > 0) {
      console.log('geocode', text);
      geocoder.geocodeAddressStringCompletionHandler(text, (placemarks, error) => {
        console.log('geocodeAddressStringCompletionHandler', placemarks, error);
        if (Array.isArray(placemarks)) {
          textField.resignFirstResponder();
          const p = placemarks[0];
          location2 = p.location;
          if (location) {
            distance = location.distanceFromLocation(location2);
            updateMap();
          } else {
            console.log('location is null');
          }
        }
      });
    }
  };

  textField.delegate = UITextFieldDelegate({
    textFieldShouldReturn(self) {
      _action();
      return true;
    },
  });

  button = UIButton(CGRectMake(12, 150, w - 24, 40));
  button.addTargetActionForControlEvents(() => {
    _action();
  }, UIControlEventTouchUpInside);

  button.setTitleForState('Geocode Address', UIControlStateNormal);
  button.setTitleColorForState(colors.black, UIControlStateNormal);
  button.backgroundColor = colors.fitbodPink;

  distLabel = UILabel(CGRectMake(12, 220, w - 24, 20));
  distLabel.numberOfLines = 0;

  headingLabel = UILabel(CGRectMake(12, 270, w - 24, 20));
  headingLabel.numberOfLines = 0;

  demoVC.view.addSubview(textField);
  demoVC.view.addSubview(button);
  demoVC.view.addSubview(distLabel);
  demoVC.view.addSubview(headingLabel);

  mgr = new CLLocationManager();
  del = new CLLocationManagerDelegate();
  del.locationManagerDidChangeAuthorizationStatus = (self, status) => {
    console.log('locationManagerDidChangeAuthorizationStatus', self, status);
    mgr.startUpdatingLocation();
    mgr.startUpdatingHeading();
  };
  del.locationManagerDidUpdateLocations = (self, locations) => {
    console.log('locationManagerDidUpdateLocations', self, locations);
    if (Array.isArray(locations) && locations.length > 0 && !location) {
      location = locations[0];
      if (mapView) {
        const region = MKCoordinateRegionMakeWithDistance(location.coordinate, 500, 500);
        mapView.setRegionAnimated(region, true);
      }
    }
  };
  del.locationManagerDidDidUpdateHeading = (self, heading) => {
    console.log('locationManagerDidUpdateHeading', self, heading.debugDescription);
    trueHeading = heading.trueHeading;
    headingLabel.text = heading.debugDescription;
  };
  mgr.delegate = del;
  mgr.requestAlwaysAuthorization();

  return undefined;
}

module.exports = make;
