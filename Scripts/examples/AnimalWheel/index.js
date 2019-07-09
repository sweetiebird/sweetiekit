const SweetieKit = require('std:sweetiekit.node');
const axios = require('axios');
const Path = require('path');

const colors = require('../colors');

THREE = require('../../vendor/three/three');

const {
  ARSCNView,
  ARSCNViewDelegate,
  AVAudioPlayer,
  AVAudioSession,
  SCNScene,
  SCNNode,
  SCNBox,
  ARWorldTrackingConfiguration,
  SCNLight,
  UIImage,
} = SweetieKit;

const animalImagesCache = {};

function makeAnimalNodes(animals) {
  return animals.map((animal, idx) => {
    const cardGeo = SCNBox({ width: 0.25, height: 0.35, length: 0.01, chamferRadius: 0 });
    const animalNode = new SCNNode(cardGeo);
    animalNode.name = animal;
    return animalNode;
  });
}

async function getImage(name, selected = false) {
  const imgKey = `${name}${selected ? '_selected' : ''}`;

  if (animalImagesCache[imgKey]) {
    return animalImagesCache[imgKey];
  }

  const imgUrl = `https://emkolar.ninja/sweetiekit/img/${imgKey}.png`;

  try {
    const response = await axios({
      method: 'GET',
      url: imgUrl,
      responseType: 'arraybuffer',
    });

    const cardImage = UIImage.imageWithData(response.data);

    animalImagesCache[imgKey] = cardImage;

    return cardImage;
  } catch (err) {
    console.log(err, err.response, err.message);
  }
}

function setMaterials(nodes, selected = false) {
  nodes.forEach(async (n) => {
    const cardImage = await getImage(n.name, selected);

    if (cardImage) {
      const cardMat = new SCNMaterial();
      cardMat.diffuse.contents = cardImage;
      n.geometry.materials = [cardMat];
    }
  });
}

function playSound(nodeName) {
  try {
    const soundPath = Path.resolve(Path.join(
      Path.dirname(
        Require.resolve('.')),
      'node_modules',
      'sweetiekit-art',
      'media',
      'sound',
      `${nodeName}.mp3`,
    ));

    const soundUrl = NSURL.initFileURLWithPath(soundPath);

    if (audioPlayer) {
      audioPlayer = audioPlayer.initWithContentsOfURLError(soundUrl);

      if (audioPlayer.prepareToPlay()) {
        audioPlayer.play();
      }
    }
  } catch (err) {
    console.log(err, err.response, err.message);
  }
}

async function make(nav, demoVC) {
  const animals = ['horse', 'pig', 'chick', 'rooster', 'cow', 'duck'];

  audioSession = AVAudioSession.sharedInstance();
  audioSession.setCategoryError(AVAudioSessionCategoryPlayback);

  audioPlayer = AVAudioPlayer.alloc();

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

  arView.touchesBeganWithEvent = async (touches, evt) => {
    touches = Array.from(touches);
    let touch = touches[0];
    let pt = touches[0].locationInView(touch.view);
    let hits = arView.hitTest(pt);

    if (hits && hits.length > 0) {
      let hit = hits[0];

      if (typeof lastNode !== 'undefined') {
        const n = scene.rootNode.childNodeWithNameRecursively(lastNode, true);

        if (n) {
          setMaterials([n]);
        }
      }

      if (hit.node) {
        setMaterials([hit.node], true);

        playSound(hit.node.name);

        lastNode = hit.node.name;
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
