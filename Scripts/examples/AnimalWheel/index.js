const SweetieKit = require('std:sweetiekit.node');

const colors = require('../colors');

THREE = require('../../vendor/three/three');

const {
  ARSCNView,
  ARSCNViewDelegate,
  SCNScene,
  SCNNode,
  SCNBox,
  ARWorldTrackingConfiguration,
  SCNLight,
} = SweetieKit;

async function make(nav, demoVC) {
  view = demoVC.view;
  arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  config = new ARWorldTrackingConfiguration();
  viewDel = new ARSCNViewDelegate(() => {
    return new SCNNode();
  });
  scene = new SCNScene();
  geo = SCNBox({ width: 0.25, height: 0.35, length: 0.01, chamferRadius: 0 });
  mat = new SCNMaterial();
  colorMat = new SCNMaterial();
  mat.diffuse.contents = UIImage.imageNamed('rooster');
  colorMat.diffuse.contents = colors.white;
  geo.materials = [mat, colorMat];
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
    pt.y -= Math.trunc(0.1*touch.view.height);
    let hits = arView.hitTest(pt);
    if (hits && hits.length > 0) {
      let hit = hits[0];
      console.log(hit);
      if (hit.node) {
        node.geometry.firstMaterial.diffuse.contents = UIColor(1.0, 1.0, 1.0);
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
        const camXform = frame.camera.transform;
        const xform = new THREE.Matrix4().fromArray(camXform);
        xform.multiply(new THREE.Matrix4().makeTranslation(0,0,-1));
        node.simdTransform = xform;
        scene.rootNode.addChildNode(node);
      }
    }
    configure();
  }
}

module.exports = make;
