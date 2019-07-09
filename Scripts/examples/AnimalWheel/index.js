const SweetieKit = require('std:sweetiekit.node');
const axios = require('axios');

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
  CIFilter,
  SCNPlane,
  SCNMaterial,
} = SweetieKit;

const animalImagesCache = {};

const sounds = {};

function makeBloom() {
  const bloomFilter = CIFilter.filterWithName('CIBloom');
  bloomFilter.setValueForKey(10.0, 'inputIntensity');
  bloomFilter.setValueForKey(20.0, 'inputRadius');
  return bloomFilter;
}

function makeAnimalNodes(animals) {
  return animals.map((animal) => {
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

function preloadSounds(nodes) {
  nodes.forEach(async (n) => {
    const nodeName = n.name;

    try {
      const soundUrl = `https://emkolar.ninja/sweetiekit/sound/${nodeName}.mp3`;

      const resp = await axios({
        method: 'GET',
        url: soundUrl,
        responseType: 'arraybuffer',
      });

      const { data } = resp;

      if (data) {
        sounds[nodeName] = data;
      }
    } catch (err) {
      console.log(err, err.response, err.message);
    }
  });
}

async function playSound(nodeName) {
  try {
    const data = sounds[nodeName];

    if (data && audioPlayer) {
      audioPlayer = audioPlayer.initWithDataError(data);

      if (audioPlayer.prepareToPlay()) {
        audioPlayer.play();
      }
    }
  } catch (err) {
    console.log(err, err.response, err.message);
  }
}

async function getAnimalsList() {
  const dataUrl = 'https://emkolar.ninja/sweetiekit/data/animals.json';

  try {
    const response = await axios({
      method: 'GET',
      url: dataUrl,
      responseType: 'json',
    });

    return response.data.animals;
  } catch (err) {
    console.log(err, err.response, err.message);
  }
}

async function makeWheel(nodes) {
  const len = nodes.length;
  const radius = 0.5;
  const step = (2.0 * Math.PI) / len;

  for (let i = 0; i < len; i++) {
    const n = nodes[i];
    const xPos = Math.cos(step * i) * radius;
    const zPos = Math.sin(step * i) * radius;
    n.position = { x: xPos, y: 0, z: zPos };
    n.rotation = { x: 0, y: 0, z: 0, w: -Math.PI * (i/6/7.5) };
    const filterNode = SCNNode.nodeWithGeometry(SCNPlane(0.25, 0.35));
    filterNode.position = { x: 0, y: 0, z: -0.01 };
    filterNode.name = 'filter';
    const filterMat = SCNMaterial();
    filterMat.diffuse.contents = colors.fitbodPink;
    filterNode.geometry.materials = [filterMat];
    n.addChildNode(filterNode);
  }
}

async function make(nav, demoVC) {
  const animals = await getAnimalsList();

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

  preloadSounds(animalNodes);

  containerNode = SCNNode();
  containerNode.position = { x: 0, y: 0, z: -2 };

  animalNodes.forEach((n) => {
    containerNode.addChildNode(n);
  });

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
        const filterNode = n.childNodeWithNameRecursively('filter', true);
        filterNode.filters = [];

        try {
          if (audioPlayer && audioPlayer.isPlaying) {
            audioPlayer.stop();
          }
        } catch (err) {
          console.log(err);
        }
      }

      if (hit.node) {
        const bloomFilter = makeBloom();

        const filterNode = hit.node.childNodeWithNameRecursively('filter', true);
        filterNode.filters = [bloomFilter];

        playSound(hit.node.name);

        lastNode = hit.node.name;
      }
    }
  };

  arView.viewWillAppear = () => {
    arView.session.run(config);
    async function configure() {
      const frame = arView.session.currentFrame;
      if (!frame) {
        setTimeout(configure, 10);
      } else {
        scene.rootNode.addChildNode(containerNode);
        await makeWheel(animalNodes);
        setMaterials(animalNodes);
      }
    }
    configure();
  }
}

module.exports = make;
