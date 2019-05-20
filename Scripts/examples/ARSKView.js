const SweetieKit = require('std:sweetiekit.node');

THREE = require('../vendor/three/three');

const {
  ARSKView,
  ARSKViewDelegate,
  ARWorldTrackingConfiguration,
  SKLabelNode,
  SKScene,
  ARAnchor,
  UITextField,
} = SweetieKit;

let text = '@';

async function make(nav, demoVC) {
  const view = demoVC.view;
  const arView = new ARSKView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  const config = new ARWorldTrackingConfiguration();
  const chars = [];
  const viewDel = new ARSKViewDelegate((view, anchor) => {
    const node = new SKLabelNode();
    node.text = text || 'SweetieKit';
    chars.push({anchor, node});
    return node;
  });

  const scene = SKScene.sceneWithSize({ width: view.frame.width, height: view.frame.height });

  arView.delegate = viewDel;
  arView.scene = scene;

  scene.touchesEnded = (touches) => {
    const camXform = arView.session.currentFrame.camera.transform;
    const translation = new THREE.Matrix4().makeTranslation(0,0,-40/1000);
    const view = new THREE.Matrix4().fromArray(camXform);
    view.multiply(translation);
    const anchor = ARAnchor.initWithTransform(view);
    arView.session.add(anchor);
  };
  
  this.interval = setInterval(() => {
    for (let c of chars) {
      let pos = c.node.position;
      pos.x += 1;
      c.node.position = pos;
    }
  }, 1000/60);

  demoVC.view.addSubview(arView);
  nav.pushViewController(demoVC);

  arView.presentScene(scene);

  const field = await UITextField.alloc(12, 80, demoVC.view.frame.width - 24, 50, () => {
    text = field.text;
  });

  demoVC.view.addSubview(field);
  demoVC.view.bringSubviewToFront(field);

  arView.viewWillAppear = () => {
    arView.session.run(config);
  }
}

module.exports = make;
