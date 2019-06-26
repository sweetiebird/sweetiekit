const SweetieKit = require('std:sweetiekit.node');

THREE = require('../vendor/three/three');

const {
  ARSCNView,
  ARSCNViewDelegate,
  SCNScene,
  SCNNode,
  ARWorldTrackingConfiguration,
  SCNLight,
  NSBundle,
} = SweetieKit;

const modelFile = 'turtle.scn';

async function make(nav, demoVC) {
  view = demoVC.view;
  arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  config = new ARWorldTrackingConfiguration();
  viewDel = new ARSCNViewDelegate(() => {
    return new SCNNode();
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
  spotlight.type = SCNLightTypeSpot;
  spotlight.spotInnerAngle = 45;
  spotlight.spotOuterAngle = 45;

  scene.rootNode.light = spotlight;
  scene.rootNode.position = { x: 1, y: 1, z: 0 };
  scene.rootNode.eulerAngles = { x: Math.PI / 2, y: 0, z: 0 };

  arView.configure = () => {
    /*
    if (arView.size.width !== arView.scene.size.width ||
      arView.size.height !== arView.scene.size.height) {
      console.log('arView.configure');
      arView.scene.size = arView.size;
    }
    */
  };
  if (arView.configureInterval) {
    clearInterval(arView.configureInterval);
    delete arView.configureInterval;
}
  arView.configureInterval = setInterval(() => {
    if (arView.configure) {
      arView.configure();
    }
  }, 1000);

  demoVC.view.addSubview(arView);
  nav.pushViewController(demoVC);

  const url = NSBundle.main().URLForResourceWithExtension('turtle', 'scn');
  turtleScene = SCNScene.sceneWithURLOptionsError(url);
  containerNode = SCNNode();


  setTimeout(() => {
    turtleScene.rootNode.enumerateChildNodes((n) => {
      containerNode.addChildNode(n);
      console.log(n);
    });

    arView.session.run(config);
    function configure() {
      const frame = arView.session.currentFrame;
      if (!frame) {
        setTimeout(configure, 10);
      } else {
        console.log(containerNode);
        const camXform = frame.camera.transform;
        const xform = new THREE.Matrix4().fromArray(camXform);
        xform.multiply(new THREE.Matrix4().makeTranslation(0,0,-0.3));
        containerNode.simdTransform = xform;
        scene.rootNode.addChildNode(containerNode);
        // const child = node.clone();
        // child.simdTransform = new THREE.Matrix4().makeTranslation(0,0,-0.3);
        // node.addChildNode(child);
        // child.addChildNode(child.clone());
        // const camXform = frame.camera.transform;
        // const xform = new THREE.Matrix4().fromArray(camXform);
        // xform.multiply(new THREE.Matrix4().makeTranslation(0,0,-0.3));
        // node.simdTransform = xform;
        // scene.rootNode.addChildNode(node);
      }
    }
    configure();
  }, 1000);
}

module.exports = make;
