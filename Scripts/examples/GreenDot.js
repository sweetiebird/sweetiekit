const SweetieKit = require('std:sweetiekit.node');

const SCNLightType = require('./enums').SCNLightType;
THREE = require('../vendor/three/three');

const {
  ARSCNView,
  ARSCNViewDelegate,
  SCNScene,
  SCNNode,
  ARWorldTrackingConfiguration,
  SCNLight,
  UIFont,
  SCNText,
} = SweetieKit;

const modelFile = 'dot.obj';

const font = new UIFont('RobotoMono-Medium', 8);

async function make(nav, demoVC) {
  const view = demoVC.view;
  const arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  const config = new ARWorldTrackingConfiguration();
  const viewDel = new ARSCNViewDelegate(() => {
    return new SCNNode();
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
      const node = new SCNNode(modelFile);
      const camXform = frame.camera.transform;
      const xform = new THREE.Matrix4().fromArray(camXform);
      xform.multiply(new THREE.Matrix4().makeTranslation(0,0,-5));
      node.simdTransform = xform;

      const text = new SCNText('NAV', 1);
      text.font = font;
      const textNode = new SCNNode(text);
      const xform2 = new THREE.Matrix4().fromArray(camXform);
      xform2.multiply(new THREE.Matrix4().makeTranslation(-3,0.6,-5));
      textNode.simdTransform = xform2;
      textNode.scale = { x: 0.4, y: 0.4, z: 0.4 };

      scene.rootNode.addChildNode(textNode);
      scene.rootNode.addChildNode(node);
    }
  }

  setTimeout(() => {
    arView.session.run(config);
    configure();
  }, 1000);
}

module.exports = make;
