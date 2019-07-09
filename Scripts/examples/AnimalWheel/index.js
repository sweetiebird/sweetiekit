const SweetieKit = require('std:sweetiekit.node');
const axios = require('axios');

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
  UIImage,
} = SweetieKit;

function makeAnimalNodes(animals) {
  return animals.map((animal, idx) => {
    const cardGeo = SCNBox({ width: 0.25, height: 0.35, length: 0.01, chamferRadius: 0 });
    // const cardMat = new SCNMaterial();
    // const imgUrl = NSURL.URLWithString(`https://emkolar.ninja/sweetiekit/img/${animal}.png`);
    // cardMat.diffuse.contents = UIImage.imageNamed(animal);
    // cardGeo.materials = [cardMat];
    const animalNode = new SCNNode(cardGeo);
    animalNode.name = animal;
    return animalNode;
  });
}

function setMaterials(nodes) {
  nodes.forEach(async (n) => {
    console.log('node name', n.name);

    const imgUrl = `https://emkolar.ninja/sweetiekit/img/${n.name}.png`;

    try {
      const response = await axios({
        method: 'GET',
        url: imgUrl,
        responseType: 'arraybuffer',
      });
      const cardImage = UIImage.imageWithData(response.data);
      if (cardImage) {
        const cardMat = new SCNMaterial();
        cardMat.diffuse.contents = cardImage;
        n.geometry.materials = [cardMat];
      }
    } catch (err) {
      console.log(err, err.response, err.message);
    }
  });
}

async function make(nav, demoVC) {
  const animals = ['rooster', 'cow', 'duck'];

  view = demoVC.view;
  arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  config = new ARWorldTrackingConfiguration();
  viewDel = new ARSCNViewDelegate(() => {
    return new SCNNode();
  });
  scene = new SCNScene();
  animalNodes = makeAnimalNodes(animals);

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
        animalNodes.forEach((n) => {
          n.geometry.firstMaterial.diffuse.contents = UIImage.imageNamed(n.name);
        });
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
        animalNodes.forEach((n, idx) => {
          xform.multiply(new THREE.Matrix4().makeTranslation(idx * 0.25,0,-1));
          n.simdTransform = xform;
          scene.rootNode.addChildNode(n);
        });
        setMaterials(animalNodes);
      }
    }
    configure();
  }
}

module.exports = make;
