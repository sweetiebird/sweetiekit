const SweetieKit = require('std:sweetiekit.node');
const math = require('./helpers/math');
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

const font = UIFont('RobotoMono-Medium', 8);

let mgr;
let navAnchor;
let arView;
let distNode;
let geocoder;
let dest;

const address = '1538 n halsted st chicago il 60642';

function setupLocation() {
  geocoder = new CLGeocoder();
  mgr = new CLLocationManager();
  del = new CLLocationManagerDelegate();
  del.locationManagerDidChangeAuthorizationStatus = () => {
    mgr.startUpdatingLocation();
  };
  del.locationManagerDidUpdateLocations = (_, locations) => {
    const loc = locations[0];
    if (dest) {
      const d = loc.distance(dest);
      distNode.geometry.string = `${Math.round(d)} meters`;
    }
  };
  mgr.delegate = del;
  mgr.requestAlwaysAuthorization();
  geocoder.geocodeAddressStringCompletionHandler(address, (placemarks) => {
    dest = placemarks[0].location;
  });
}

async function make(nav, demoVC) {
  const view = demoVC.view;
  arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  const config = new ARWorldTrackingConfiguration();
  config.worldAlignment = ARWorldAlignmentGravityAndHeading;

  const viewDel = ARSCNViewDelegate({
    rendererNodeForAnchor: () => {
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
    }
  });

  const scene = new SCNScene();

  arView.delegate = viewDel;
  arView.scene = scene;

  const spotlight = new SCNLight();
  spotlight.type = SCNLightTypeSpot;
  spotlight.spotInnerAngle = 45;
  spotlight.spotOuterAngle = 45;

  scene.rootNode.light = spotlight;
  scene.rootNode.position = { x: 1, y: 1, z: 0 };
  scene.rootNode.eulerAngles = { x: Math.PI / 2, y: 0, z: 0 };

  demoVC.view.addSubview(arView);
  nav.pushViewControllerAnimated(demoVC, true);

  function configure() {
    const frame = arView.session.currentFrame;
    if (!frame) {
      setTimeout(configure, 10);
    } else {
      const camXform = frame.camera.transform;
      const xform = new THREE.Matrix4().fromArray(camXform);
      xform.multiply(new THREE.Matrix4().makeTranslation(0,0,-5));
      const anchor = ARAnchor.alloc().initWithTransform(xform);
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
