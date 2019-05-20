const SweetieKit = require('std:sweetiekit.node');
const math = require('./helpers/math');
const SCNLightType = require('./enums').SCNLightType;
const ARWorldAlignment = require('./enums').ARWorldAlignment;
THREE = require('../vendor/three/three');

const {
  ARSCNView,
  ARSCNViewDelegate,
  ARAnchor,
  SCNScene,
  SCNNode,
  ARWorldTrackingConfiguration,
  SCNLight,
  UIFont,
  SCNText,
  CLLocationManager,
  CLLocationManagerDelegate,
  CLGeocoder,
} = SweetieKit;

const modelFile = 'dot.obj';

const font = new UIFont('RobotoMono-Medium', 8);

let mgr;
let navAnchor;
let arView;
let distNode;
let geocoder;
let dest;
let dist;

const address = '1538 n halsted st chicago il 60642';

const azimuth = (start, end) => {
  let az = 0;
  let lat1 = math.degToRad(start.latitude);
  let long1 = math.degToRad(start.longitude);
  let lat2 = math.degToRad(end.latitude);
  let long2 = math.degToRad(end.longitude);
  let dLong = long2 - long1;
  let y = Math.sin(dLong) * Math.cos(lat2);
  let x = (Math.cos(lat1) * Math.sin(lat2)) - (Math.sin(lat1 * Math.cos(lat2) * Math.cos(dLong)));
  let radsBearing = Math.atan2(y, x);
  az = math.radToDeg(radsBearing);
  if (az < 0) az += 360;
  return az;
};

function setupLocation() {
  geocoder = new CLGeocoder();
  mgr = new CLLocationManager();
  mgr.delegate = new CLLocationManagerDelegate(() => {
    mgr.startUpdatingLocation();
  }, (_, locations) => {
    const loc = locations[0];
    if (dest) {
      const az = azimuth(loc.coordinate, dest.coordinate);
      const d = loc.distance(dest);
      console.log(az, d);
    }
  }, () => {});
  mgr.requestAlwaysAuthorization();
  geocoder.geocodeAddressString(address, (placemarks) => {
    dest = placemarks[0].location;
  });
}

async function make(nav, demoVC) {
  const view = demoVC.view;
  arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  const config = new ARWorldTrackingConfiguration();
  config.worldAlignment = ARWorldAlignment.gravityAndHeading;

  const viewDel = new ARSCNViewDelegate(() => {
    const parentNode = new SCNNode();
    const node = new SCNNode(modelFile);
    const camXform = arView.session.currentFrame.camera.transform;

    const text = new SCNText('NAV', 1);
    text.font = font;
    const textNode = new SCNNode(text);
    const xform2 = new THREE.Matrix4().fromArray(camXform);
    xform2.multiply(new THREE.Matrix4().makeTranslation(-0.7,0.4,0));
    textNode.simdTransform = xform2;
    textNode.scale = { x: 0.1, y: 0.1, z: 0.4 };

    const distText = new SCNText('0 Meters', 1);
    text.font = font;
    distNode = new SCNNode(distText);
    const xform3 = new THREE.Matrix4().fromArray(camXform);
    xform3.multiply(new THREE.Matrix4().makeTranslation(-2.5,-1.8,0));
    distNode.simdTransform = xform3;
    distNode.scale = { x: 0.1, y: 0.1, z: 0.4 };


    parentNode.addChildNode(textNode);
    parentNode.addChildNode(node);
    parentNode.addChildNode(distNode);

    return parentNode;
  });

  const scene = new SCNScene();

  arView.delegate = viewDel;
  arView.scene = scene;

  const spotlight = new SCNLight();
  spotlight.type = SCNLightType.spot;
  spotlight.spotInnerAngle = 45;
  spotlight.spotOuterAngle = 45;

  scene.rootNode.light = spotlight;
  scene.rootNode.position = { x: 1, y: 1, z: 0 };
  scene.rootNode.eulerAngles = { x: Math.PI / 2, y: 0, z: 0 };

  demoVC.view.addSubview(arView);
  nav.pushViewController(demoVC);

  function configure() {
    const frame = arView.session.currentFrame;
    if (!frame) {
      setTimeout(configure, 10);
    } else {
      const camXform = frame.camera.transform;
      const xform = new THREE.Matrix4().fromArray(camXform);
      xform.multiply(new THREE.Matrix4().makeTranslation(0,0,-5));
      const anchor = ARAnchor.initWithTransform(xform);
      arView.session.add(anchor);
      navAnchor = anchor;
      setupLocation();
    }
  }

  setTimeout(() => {
    arView.session.run(config);
    configure();
  }, 1000);
}

module.exports = make;