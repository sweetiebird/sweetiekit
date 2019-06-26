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
} = SweetieKit;

const modelFile = 'turtle.scn';

DAEPath = Path.resolve(Path.join(Path.dirname(Require.resolve('.')),'node_modules', 'sweetiekit-art', 'media', 'models', 'Turtle_dae', 'turtle.dae'));

async function make(nav, demoVC) {
  const sceneUrl = NSBundle.main().URLForResourceWithExtension('turtle', 'dae');
  scene = SCNScene.sceneWithURLOptionsError(sceneUrl);
  // nodesInFile = [];
  // containerNode = SCNNode();
  // turtleScene.rootNode.enumerateChildNodes((n) => {
  //   nodesInFile.push(n);
  //   containerNode.addChildNode(n);
  // });

  // console.log(containerNode.childNodes);

  view = demoVC.view;
  arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  config = new ARWorldTrackingConfiguration();
  viewDel = new ARSCNViewDelegate(() => {
    return new SCNNode();
  });
  // scene = new SCNScene();
  // geo = SCNTube(0.01, 0.02, 0.1);
  // mat = new SCNMaterial();
  // mat.diffuse.contents = {red: 1, green: 0.5, blue: 0.5};
  // geo.materials = [mat];
  // node = new SCNNode(geo);

  arView.delegate = viewDel;
  arView.scene = scene;

  spotlight = new SCNLight();
  spotlight.type = SCNLightTypeOmni;

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

  // async function loadIt() {
  //   Require('sweetiekit-dom')();
  //   eval(await (await fetch('https://threejs.org/examples/js/loaders/ColladaLoader.js')).text());
  //   loadingManager = new THREE.LoadingManager(function () {
  //     console.log(elf);
  //   });
  //   loader = new THREE.ColladaLoader(loadingManager);
  //   loader.load( 'https://emkolar.ninja/media/models/Turtle_dae/turtle.dae', function (collada) {
  //     elf = collada.scene;
  //   });
  // }

  function str2ab(str) {
    var buf = new ArrayBuffer(str.length*2); // 2 bytes for each char
    var bufView = new Uint16Array(buf);
    for (var i=0, strLen=str.length; i < strLen; i++) {
      bufView[i] = str.charCodeAt(i);
    }
    return buf;
  }

  // async function loadModel() {
    // const { data } = response;
    // const arrBuffer = str2ab(data);
    // const source = SCNSceneSource.sceneSourceWithDataOptions(arrBuffer);
    // const tNode = source.entryWithIdentifierWithClass('Turtle', NSClassFromString('SCNNode'));
    // console.log('turtle node exists', !!tNode);
    // const filePath = 'turtle.dae';
    // console.log(filePath);
    // fs.writeFileSync(filePath, data, 'utf8');

    // if (typeof turtleGeometry === 'undefined') {
    //   turtleAsset = MDLAsset.alloc().initWithURL(NSURL(filePath));
    //   turtleObject = turtleAsset.objectAtIndex(0);
    //   for (let submesh of turtleObject.submeshes) {
    //     submesh.material = turtleMaterial;
    //   }
    //   turtleGeometry = SCNGeometry.geometryWithMDLMesh(turtleObject);
    // }
    // turtleNode = SCNNode.nodeWithGeometry(turtleGeometry);
    // turtleNode = SCNNode(filePath);
    // containerNode.position = new THREE.Vector3(1.0, 3.0, 0.0);
    // turtleNode.transform = new THREE.Matrix4().makeScale(3.0/1000, 3.0/1000, 3.0/1000);
    // turtleNode.physicsBody = SCNPhysicsBody.dynamicBody();
    // scene.rootNode.addChildNode(containerNode);
  // }

  setTimeout(() => {
    arView.session.run(config);
    async function configure() {
      const frame = arView.session.currentFrame;
      if (!frame) {
        setTimeout(configure, 10);
      } else {
        // if (typeof turtleMaterial === 'undefined') {
        //   turtleScatteringFunction = MDLScatteringFunction();
        //   turtleMaterial = MDLMaterial.alloc().initWithNameScatteringFunction('turtleMaterial', turtleScatteringFunction);
        //   turtleMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('models/Turtle_dae/turtle_color.png', MDLMaterialSemanticBaseColor, NSURL(Path.join(MediaPath, 'models/Turtle_dae/turtle_color.png'))));
        //   turtleMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('models/Turtle_dae/turtle_Normal.png', MDLMaterialSemanticTangentSpaceNormal, NSURL(Path.join(MediaPath, 'models/Turtle_dae/turtle_Normal.png'))));
        //   turtleMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('models/Turtle_dae/turtle_alpha.png', MDLMaterialSemanticOpacity, NSURL(Path.join(MediaPath, 'models/Turtle_dae/turtle_alpha.png'))));
        // }
        if (typeof turtleSCNMaterial === 'undefined') {
          turtleScatteringFunction = MDLScatteringFunction();
          turtleMaterial = MDLMaterial.alloc().initWithNameScatteringFunction('turtleMaterial', turtleScatteringFunction);
          turtleMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('models/Turtle_dae/turtle_color.png', MDLMaterialSemanticBaseColor, NSURL(Path.join(MediaPath, 'models/Turtle_dae/turtle_color.png'))));
          turtleMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('models/Turtle_dae/turtle_Normal.png', MDLMaterialSemanticTangentSpaceNormal, NSURL(Path.join(MediaPath, 'models/Turtle_dae/turtle_Normal.png'))));
          turtleMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('models/Turtle_dae/turtle_alpha.png', MDLMaterialSemanticOpacity, NSURL(Path.join(MediaPath, 'models/Turtle_dae/turtle_alpha.png'))));
          turtleSCNMaterial = SCNMaterial.materialWithMDLMaterial(turtleMaterial);
        }
        // containerNode.position = new THREE.Vector3(1.0, 3.0, 0.0);
        // scene.rootNode.addChildNode(containerNode);
        // await loadIt();
        // if (typeof turtleNode === 'undefined') {
        //   turtleScene = SCNScene.sceneWithURLOptionsError(NSURL(DAEPath));
        //   turtleNode = turtleScene.childNodeWithName('Turtle');
        //   console.log(turtleNode);
        // }
        // const url = NSBundle.main().URLForResourceWithExtension('turtle', 'dae');
        // console.log(url.absoluteString);
        // if (typeof turtleGeometry === 'undefined') {
        //   turtleAsset = MDLAsset.alloc().initWithURL(NSURL(DAEPath));
        //   turtleObject = turtleAsset.objectAtIndex(0);
        //   for (let submesh of turtleObject.submeshes) {
        //     submesh.material = turtleMaterial;
        //   }
        //   turtleGeometry = SCNGeometry.geometryWithMDLMesh(turtleObject);
        // }
        // turtleNode.position = new THREE.Vector3(1.0, 3.0, 0.0);
        // turtleNode.transform = new THREE.Matrix4().makeScale(3.0/1000, 3.0/1000, 3.0/1000);
        // turtleNode.physicsBody = SCNPhysicsBody.dynamicBody();
        // const camXform = frame.camera.transform;
        // const xform = new THREE.Matrix4().fromArray(camXform);
        // xform.multiply(new THREE.Matrix4().makeScale(2.0/10, 2.0/10, 2.0/10));
        // xform.multiply(new THREE.Matrix4().makeTranslation(0,-1,-0.3));
        // turtleNode.simdTransform = xform;
        //
        // scene.rootNode.addChildNode(turtleNode);

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
