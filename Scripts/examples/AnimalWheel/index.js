const SweetieKit = process._linkedBinding('sweetiekit');
axios = require('axios');

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

AnimalWheel_animalImagesCache = {};

AnimalWheel_makeAnimalNodes = function AnimalWheel_makeAnimalNodes(animals) {
  return animals.map((animal) => {
    const cardGeo = SCNBox({ width: 0.25, height: 0.35, length: 0.01, chamferRadius: 0 });
    const animalNode = new SCNNode(cardGeo);
    animalNode.name = animal;
    return animalNode;
  });
}

AnimalWheel_getImage = async function AnimalWheel_getImage(name, selected = false) {
  const imgKey = `${name}${selected ? '_selected' : ''}`;

  if (AnimalWheel_animalImagesCache[imgKey]) {
    return AnimalWheel_animalImagesCache[imgKey];
  }

  const imgUrl = `https://emkolar.ninja/sweetiekit/img/${imgKey}.png`;

  try {
    const response = await axios({
      method: 'GET',
      url: imgUrl,
      responseType: 'arraybuffer',
    });

    const cardImage = UIImage.imageWithData(response.data);

    AnimalWheel_animalImagesCache[imgKey] = cardImage;

    return cardImage;
  } catch (err) {
    console.log(err, err.response, err.message);
  }
}

AnimalWheel_setMaterials = function AnimalWheel_setMaterials(nodes, selected = false) {
  nodes.forEach(async (n) => {
    const cardImage = await AnimalWheel_getImage(n.name, selected);

    if (cardImage) {
      const cardMat = new SCNMaterial();
      cardMat.diffuse.contents = cardImage;
      n.geometry.materials = [cardMat];
    }
  });
}

AnimalWheel_playSound = async function AnimalWheel_playSound(nodeName) {
  try {
    const soundUrl = `https://emkolar.ninja/sweetiekit/sound/${nodeName}.mp3`;

    const resp = await axios({
      method: 'GET',
      url: soundUrl,
      responseType: 'arraybuffer',
    });

    const { data } = resp;

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

AnimalWheel_getAnimalsList = async function AnimalWheel_getAnimalsList() {
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

AnimalWheel_makeWheel = async function AnimalWheel_makeWheel(nodes) {
  const len = nodes.length;
  const radius = 0.5;
  const step = (2.0 * Math.PI) / len;

  for (let i = 0; i < len; i++) {
    const n = nodes[i];
    const angle = step * i;
    const xPos = Math.cos(angle) * radius;
    const zPos = -Math.sin(angle) * radius;
    n.position = { x: xPos, y: 0, z: zPos };
    n.eulerAngles = { x: 0, y: angle + Math.PI/4, z: 0 };
  }
};

AnimalWheel_make = async function AnimalWheel_make(nav, demoVC) {
  const animals = await AnimalWheel_getAnimalsList();

  audioSession = AVAudioSession.sharedInstance();
  audioSession.setCategoryError(AVAudioSessionCategoryPlayback);

  audioPlayer = AVAudioPlayer.alloc();

  view = demoVC.view;
  arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  arView.autoenablesDefaultLighting = true;
  config = new ARWorldTrackingConfiguration();
  viewDel = ARSCNViewDelegate({
    rendererNodeForAnchor: () => {
      return new SCNNode();
    },
  });
  scene = new SCNScene();
  animalNodes = AnimalWheel_makeAnimalNodes(animals);

  containerNode = SCNNode();
  containerNode.position = { x: 0, y: 0, z: -1 };

  animalNodes.forEach((n) => {
    containerNode.addChildNode(n);
  });

  /*
  // Disable automatic lighting
  arView.autoenablesDefaultLighting = false
  arView.automaticallyUpdatesLighting = false

  // create ambient light
  ambientLightNode.light = SCNLight()
  ambientLightNode.light.type = SCNLightTypeAmbient;
  ambientLightNode.light.color = UIColor.darkGray;
  scene.rootNode.addChildNode(ambientLightNode);

  // create secondary light
  lightNode = SCNNode();
  lightNode.light = SCNLight()
  lightNode.light.type = SCNLightTypeOmni;
  lightNode.position = SCNVector3Make(0, 1, 1);
  scene.rootNode.addChildNode(lightNode);
  
  // create main light that cast shadow
  lightNode2 = SCNNode();
  lightNode2.light = SCNLight()
  lightNode2.light.type = SCNlightTypeSpot;
  lightNode2.position = SCNVector3Make(-1, 10, 1);
  lightNode2.eulerAngles = SCNVector3Make(-Math.PI*0.5, 0, 0);
  lightNode2.light.castsShadow = true; // to cast shadow 
  lightNode2.light.shadowMode = SCNShadowModeDeferred; // to render shadow in transparent plane
  lightNode2.light.shadowSampleCount = 64; //remove flickering of shadow and soften shadow
  lightNode2.light.shadowMapSize = CGSizeMake(2048, 2048); //sharpen or detail shadow
  containerNode.addChildNode(lightNode2)

  // place shadow plane under your object
  shadowPlane = SCNPlane(10, 10);
//  shadowPlane.materials.first.colorBufferWriteMask = 0;
  shadowPlaneNode = SCNNode(shadowPlane);
  planeNode.eulerAngles = SCNVector3Make(-Math.PI*0.5, 0, 0); // because plane is created vertical
  containerNode.addChildNode(shadowPlaneNode);
   */

  arView.delegate = viewDel;
  arView.scene = scene;

  scene.rootNode.position = SCNVector3Make(1, 1, 0);
  scene.rootNode.eulerAngles = SCNVector3Make(Math.PI*0.5, 0, 0);

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

        if (audioPlayer && audioPlayer.isPlaying) {
          audioPlayer.stop();
        }
      }

      if (hit.node) {
        AnimalWheel_playSound(hit.node.name);

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
        await AnimalWheel_makeWheel(animalNodes);
        AnimalWheel_setMaterials(animalNodes);
      }
    }
    configure();
  }
}

function make(...args) {
  return AnimalWheel_make(...args);
}

module.exports = make;
