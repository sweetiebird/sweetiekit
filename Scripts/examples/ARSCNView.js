const SweetieKit = require('std:sweetiekit.node');

const {
  ARSCNView,
  ARSCNViewDelegate,
  SCNScene,
  SCNNode,
  ARWorldTrackingConfiguration,
} = SweetieKit;

const modelFile = 'model.obj';

async function make(nav, demoVC) {
  const view = demoVC.view;
  const arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  const config = new ARWorldTrackingConfiguration();
  const viewDel = new ARSCNViewDelegate(() => {
    return new SCNNode();
  });
  const scene = new SCNScene(modelFile);
  arView.delegate = viewDel;
  arView.scene = scene;
  demoVC.view.addSubview(arView);
  nav.pushViewController(demoVC);
  setTimeout(() => {
    arView.session.run(config);
  }, 1000);
}

module.exports = make;
