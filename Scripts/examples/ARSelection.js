const SweetieKit = require('std:sweetiekit.node');

THREE = require('../vendor/three/three');

const {
  ARSCNView,
  ARSCNViewDelegate,
  SCNScene,
  SCNNode,
  ARWorldTrackingConfiguration,
  SCNLight,
} = SweetieKit;

ARSelection_make =  async function ARSelection_make(nav, demoVC) {
  view = demoVC.view;
  arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  config = new ARWorldTrackingConfiguration();
  config.planeDetection = ARPlaneDetectionHorizontal;
  config.environmentTexturing = AREnvironmentTexturingAutomatic;
  viewDel = ARSCNViewDelegate({
    rendererNodeForAnchor: () => {
      return new SCNNode();
    },
  });
  scene = new SCNScene();
  geo = SCNTube(0.01, 0.02, 0.1);
  mat = new SCNMaterial();
  mat.diffuse.contents = {red: 1, green: 0.5, blue: 0.5};
  geo.materials = [mat];
  node = new SCNNode(geo);

  arView.delegate = viewDel;
  arView.scene = scene;

  spotlight = new SCNLight();
  spotlight.type = SCNLightTypeOmni;

  scene.rootNode.light = spotlight;
  scene.rootNode.position = { x: 1, y: 1, z: 0 };
  scene.rootNode.eulerAngles = { x: Math.PI / 2, y: 0, z: 0 };

  demoVC.view.addSubview(arView);
  nav.pushViewControllerAnimated(demoVC, true);

  arView.touchesBeganWithEvent = (touches, evt) => {
    touches = Array.from(touches);
    let touch = touches[0];
    let pt = touches[0].locationInView(touch.view);
    let hits = arView.hitTest(pt);
    if (hits && hits.length > 0) {
      let hit = hits[0];
      console.log(hit);
      if (hit.node) {
        node.geometry.firstMaterial.diffuse.contents = UIColor(1.0, 1.0, 1.0);
        child.geometry.firstMaterial.diffuse.contents = UIColor(1.0, 1.0, 1.0);
        child2.geometry.firstMaterial.diffuse.contents = UIColor(1.0, 1.0, 1.0);
        hit.node.geometry.firstMaterial.diffuse.contents = UIColor(1.0, 0.5, 0.5);
      }
    }
  };

  arView.viewWillAppear = () => {
    arView.session.run(config);
    function configure() {
      const frame = arView.session.currentFrame;
      if (!frame) {
        setTimeout(configure, 10);
      } else {
        child = node.clone();
        child.geometry = SCNTube(0.01, 0.02, 0.1);
        child.simdTransform = new THREE.Matrix4().makeTranslation(0,0,-0.3);
        node.addChildNode(child);

        child2 = child.clone();
        child2.geometry = SCNTube(0.01, 0.02, 0.1);
        child.addChildNode(child2);

        const camXform = frame.camera.transform;
        const xform = new THREE.Matrix4().fromArray(camXform);
        xform.multiply(new THREE.Matrix4().makeTranslation(0,0,-0.3));
        node.simdTransform = xform;
        scene.rootNode.addChildNode(node);
      }
    }
    configure();
  }
}

function make(...args) {
  return ARSelection_make(...args);
}

module.exports = make;
