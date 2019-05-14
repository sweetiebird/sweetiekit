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
} = SweetieKit;

const modelFile = 'model.obj';

async function make(nav, demoVC) {
  const view = demoVC.view;
  const arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  const config = new ARWorldTrackingConfiguration();
  const viewDel = new ARSCNViewDelegate(() => {
    return new SCNNode();
  });
  const scene = new SCNScene();
  const node = new SCNNode(modelFile);
  
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
  
  setTimeout(() => {
    arView.session.run(config);
    function configure() {
      const frame = arView.session.currentFrame;
      if (!frame) {
        setTimeout(configure, 10);
      } else {
        const child = node.clone();
        child.simdTransform = new THREE.Matrix4().makeTranslation(0,0,-3);
        node.addChildNode(child);
        child.addChildNode(child.clone());
        const camXform = frame.camera.transform;
        const xform = new THREE.Matrix4().fromArray(camXform);
        xform.multiply(new THREE.Matrix4().makeTranslation(0,0,-3));
        node.simdTransform = xform;
        scene.rootNode.addChildNode(node);
      }
    }
    configure();
  }, 1000);
}

module.exports = make;
