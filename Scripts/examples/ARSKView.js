const SweetieKit = require('std:sweetiekit.node');

THREE = require('../vendor/three/three');

const {
  ARSKView,
  ARSKViewDelegate,
  ARWorldTrackingConfiguration,
  SKLabelNode,
  SKScene,
  ARAnchor,
} = SweetieKit;

async function make(nav, demoVC) {
  const view = demoVC.view;
  const arView = new ARSKView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  const config = new ARWorldTrackingConfiguration();
  const viewDel = new ARSKViewDelegate(() => {
    const node = new SKLabelNode();
    node.text = 'SweetieKit';
    return node;
  });
  const scene = SKScene.sceneWithSize({ width: view.frame.width, height: view.frame.height });

  arView.delegate = viewDel;
  arView.scene = scene;

  scene.touchesEnded = (touches) => {
    const camXform = arView.session.currentFrame.camera.transform;
    const translation = new THREE.Matrix4().makeTranslation(0,0,-3);
    const view = new THREE.Matrix4().fromArray(camXform);
    view.multiply(translation);
    const anchor = ARAnchor.initWithTransform(view);
    arView.session.add(anchor);
  };

  demoVC.view.addSubview(arView);
  nav.pushViewController(demoVC);

  arView.presentScene(scene);

  setTimeout(() => {
    arView.session.run(config);
  }, 2000);
}

module.exports = make;
