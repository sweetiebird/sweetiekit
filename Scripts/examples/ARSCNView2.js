const SweetieKit = require('std:sweetiekit.node');

const fs = require('fs');
const axios = require('axios');

THREE = require('../vendor/three/three');
Path = require('path');

const {
  ARSCNView,
  ARSCNViewDelegate,
  SCNScene,
  SCNNode,
  ARWorldTrackingConfiguration,
  SCNLight,
  NSBundle,
  SCNSceneSource,
  SCNMaterial,
  UIImage,
} = SweetieKit;

const modelFile = 'turtle.scn';

DAEPath = Path.resolve(Path.join(Path.dirname(Require.resolve('.')),'node_modules', 'sweetiekit-art', 'media', 'models', 'Turtle_dae', 'turtle.dae'));

async function make(nav, demoVC) {
  const sceneUrl = NSBundle.main().URLForResourceWithExtension('turtle', 'dae');
  turtleScene = SCNScene.sceneWithURLOptionsError(sceneUrl);
  scene = SCNScene();

  anchorNode = SCNNode();

  view = demoVC.view;
  arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  config = new ARWorldTrackingConfiguration();
  config.planeDetection = ARPlaneDetectionVertical;
  viewDel = ARSCNViewDelegate({
    rendererNodeForAnchor: () => {
      return anchorNode;
    }
  });

  arView.delegate = viewDel;
  arView.scene = scene;

  spotlight = new SCNLight();
  spotlight.type = SCNLightTypeOmni;
  spotlightNode = SCNNode();
  spotlightNode.position = { x: 0, y: 2, z: 0 };
  spotlightNode.light = spotlight;

  ambientLight = new SCNLight();
  ambientLight.type = SCNLightTypeAmbient;
  ambientLight.intensity = 40;
  scene.rootNode.light = ambientLight;

  scene.rootNode.addChildNode(spotlightNode);

  arView.configure = () => {
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
  nav.pushViewControllerAnimated(demoVC, true);

  function str2ab(str) {
    var buf = new ArrayBuffer(str.length*2); // 2 bytes for each char
    var bufView = new Uint16Array(buf);
    for (var i=0, strLen=str.length; i < strLen; i++) {
      bufView[i] = str.charCodeAt(i);
    }
    return buf;
  }

  setTimeout(() => {
    arView.session.run(config);
    async function configure() {
      const frame = arView.session.currentFrame;
      if (!frame) {
        setTimeout(configure, 20);
      } else {
        if (typeof turtleSCNMaterialColor === 'undefined') {
          turtleSCNMaterialColor = SCNMaterial();
          turtleSCNMaterialColor.isDoubleSided = false;
          turtleSCNMaterialColor.diffuse.contents = UIImage('turtle_color');
        }
        if (typeof turtleSCNMaterialNormal === 'undefined') {
          turtleSCNMaterialNormal = SCNMaterial();
          turtleSCNMaterialNormal.isDoubleSided = false;
          turtleSCNMaterialNormal.diffuse.contents = UIImage('turtle_normal');
        }
        if (typeof turtleSCNMaterialAlpha === 'undefined') {
          turtleSCNMaterialAlpha = SCNMaterial();
          turtleSCNMaterialAlpha.isDoubleSided = false;
          turtleSCNMaterialAlpha.diffuse.contents = UIImage('turtle_alpha');
        }
        turtleNode = turtleScene.rootNode.childNodeWithNameRecursively('Turtle', true);
        if (turtleNode) {
          turtleNode.geometry.materials = [turtleSCNMaterialColor, turtleSCNMaterialNormal, turtleSCNMaterialAlpha];
          scene.rootNode.addChildNode(turtleNode);
        }
        const camXform = frame.camera.transform;
        const xform = new THREE.Matrix4().fromArray(camXform);
        xform.multiply(new THREE.Matrix4().makeTranslation(0,0,5));
        scene.rootNode.simdTransform = xform;
      }
    }
    configure();
  }, 1000);
}

module.exports = make;
