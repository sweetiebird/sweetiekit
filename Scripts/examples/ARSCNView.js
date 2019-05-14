SweetieKit = require('std:sweetiekit.node');

SCNLightType = require('./enums').SCNLightType;
THREE = require('../vendor/three/three');

const {
  ARSCNView,
  ARSCNViewDelegate,
  SCNScene,
  SCNNode,
  ARWorldTrackingConfiguration,
  SCNLight,
} = SweetieKit;

const modelFile = 'model.obj';

function make(nav, demoVC) {
  this.demoVC = demoVC;
  const view = this.view = demoVC.view;
  const arView = this.arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  arView.automaticallyUpdatesLighting = false;
  const config = this.config = new ARWorldTrackingConfiguration();
  this.nodes = [];
  const viewDel = this.viewDel = new ARSCNViewDelegate(() => {
    const node = new SCNNode();
    this.nodes.push(node);
    return node;
  });
  const scene = this.scene = new SCNScene();
  const node = this.node = new SCNNode(modelFile);
  
  arView.delegate = viewDel;
  arView.scene = scene;

  demoVC.view.addSubview(arView);
  nav.pushViewController(demoVC);
  arView.session.run(config);

  let interval = null;
  interval = setInterval(() => {
    gc();
    if (!this.arView.session.currentFrame) {
      return;
    }
    if (interval) {
      clearInterval(interval);
      interval = null;
    }

    if (false)
    {
      const spotlight = new SCNLight();
      const spotlightNode = new SCNNode();
      spotlight.type = SCNLightType.spot;
      spotlight.color = { red: 0, green: 174/255, blue: 174/255 }
      spotlight.spotInnerAngle = 0;
      spotlight.spotOuterAngle = 45;
      spotlight.attenuationEndDistance = 6;
      spotlightNode.light = spotlight;
      spotlightNode.simdTransform = xform;
      scene.rootNode.addChildNode(spotlightNode);
    }
    
    if (false)
    {
      const light = this.ambientLight = new SCNLight()
      const lightNode = this.ambientLightNode = new SCNNode()
      light.type = SCNLightType.ambient;
      light.color = {red: 1, green: 1, blue: 0};
      light.intensity = 40;
      lightNode.light = light
      scene.rootNode.addChildNode(lightNode);
    }
    
    if (true)
    {
      const myOmniLight = this.omniLight2 = new SCNLight()
      const myOmniLightNode = this.omniLightNode2 = new SCNNode()
      myOmniLight.type = SCNLightType.omni;
      myOmniLight.color = {red: 1, green: 1, blue: 0};
      myOmniLight.attenuationEndDistance = 6;
      myOmniLight.intensity = 40;
      myOmniLightNode.light = myOmniLight
      myOmniLightNode.position = {x: 2, y: 1, z: -3 }
      scene.rootNode.addChildNode(myOmniLightNode);
    }
    
    if (true)
    {
      const myOmniLight = this.myOmniLight = new SCNLight()
      const myOmniLightNode = this.myOmniLightNode = new SCNNode()
      myOmniLight.type = SCNLightType.omni;
      myOmniLight.color = {red: 0, green: 1, blue: 1};
      myOmniLight.attenuationEndDistance = 6;
      myOmniLight.intensity = 40;
      myOmniLightNode.light = myOmniLight
      myOmniLightNode.position = {x: -2, y: 1, z: -3 }
      scene.rootNode.addChildNode(myOmniLightNode);
      setInterval(() => {
        gc();
        if (this.arView.session.currentFrame) {
        ARSCNView.lock();
        ARSCNView.flush();
        ARSCNView.begin();
          const camXform = this.arView.session.currentFrame.camera.transform;
          const xform = new THREE.Matrix4().fromArray(camXform);
          //xform.multiply(new THREE.Matrix4().makeTranslation(1,1,-1));
          myOmniLightNode.simdTransform = xform;
          ARSCNView.commit();
          ARSCNView.flush();
          console.log(myOmniLightNode.debugDescription);
          ARSCNView.unlock();
          gc();
        }
      }, 1000/20);
    }
    
    if (true)
    {
      setInterval(() => {
        gc();
        console.log({playing: this.arView.playing});
        this.arView.playing = false;
        this.arView.session.run(config);
        this.arView.playing = true;
//        if (!this.arView.playing) {
//          this.arView.session.run(config);
//          this.arView.playing = true;
//        }
        gc();
        ARSCNView.lock();
        ARSCNView.flush();
        ARSCNView.begin();
        try {
          if (this.arView.session.currentFrame) {
            const camXform = this.arView.session.currentFrame.camera.transform;
            const xform = new THREE.Matrix4().fromArray(camXform);
            const pos = new THREE.Vector3();
            const rot = new THREE.Quaternion();
            const scale = new THREE.Vector3();
            xform.decompose(pos, rot, scale);
            console.log(pos.x, pos.y, pos.z);
          }
        } finally {
          ARSCNView.commit();
          ARSCNView.flush();
          ARSCNView.unlock();
        }
        gc();
      }, 1000);
    }
    
    const child = this.child = node.clone();
    child.simdTransform = new THREE.Matrix4().makeTranslation(0,0,-3);
    node.addChildNode(child);
    child.addChildNode(this.child2 = child.clone());
    const xform = new THREE.Matrix4().fromArray(this.arView.session.currentFrame.camera.transform);
    xform.multiply(new THREE.Matrix4().makeTranslation(0,0,-3));
    node.simdTransform = xform;
    scene.rootNode.addChildNode(node);
    gc();
  }, 10);
}

module.exports = make;
