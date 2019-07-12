const SweetieKit = process._linkedBinding('sweetiekit');

THREE = require('../vendor/three/three');

const {
  ARSCNView,
  ARSCNViewDelegate,
  SCNScene,
  SCNNode,
  ARWorldTrackingConfiguration,
  SCNLight,
} = SweetieKit;

ARPointManager_geometry = null;
ARPointManager_pointSize = 0.005;
ARPointManager_updateGeometry = true;

ARPointManager = function ARPointManager(root, size = 10) {
  if (ARPointManager_updateGeometry || !ARPointManager_geometry) {
    const size = ARPointManager_pointSize;
    ARPointManager_geometry = SCNBox(size, size, size, 0);
    ARPointManager_updateGeometry = false;
  }
  ARPointManager_geometry.firstMaterial.diffuse.contents = {red: 1, green: 0.5, blue: 0.5};
  this.root = root;
  this.size = size;
  this.entries = new Array(size);
}

ARPointManager.prototype.find = function (id) {
  for (let entry of this.entries) {
    if (entry) {
      if (entry.id === id) {
        return entry;
      }
    }
  }
}

ARPointManager.prototype.findEmptyIndex = function () {
  for (let n = this.entries.length, i = 0; i < n; i++) {
    if (!this.entries[i]) {
        return i;
    }
  }
  return -1;
}

ARPointManager.prototype.insert = function (entry) {
  let idx = this.findEmptyIndex();
  if (idx < 0) {
    return idx;
  }
  this.entries[idx] = entry;
  return idx;
}

ARPointManager.prototype.clear = function() {
  for (let n = this.entries.length, i = 0; i < n; i++) {
    let entry = this.entries[i];
    if (entry) {
      if (entry.node) {
        entry.node.removeFromParentNode();
        delete entry.node;
      }
      this.entries[i] = entry = null;
    }
  }
}

ARPointManager.prototype.updatePoints = function (arFrame) {
  if (arFrame) {
    //console.log('frame');
    const cloud = arFrame.rawFeaturePoints;
    if (cloud) {
      console.log('points');
      gc();
      //const camXform = frame.camera.transform;
      //const xform = new THREE.Matrix4().fromArray(camXform);

      const ids = cloud.identifiers;
      const pts = cloud.points;
      const now = CACurrentMediaTime();
      const n = ids.length;
      for (let i = 0; i < n; i++) {
        const id = ids[i];
        //const pt = new THREE.Vector3(pts[3*i], pts[3*i+1], pts[3*i+2]);
        const pt = SCNVector3Make(pts[3*i], pts[3*i+1], pts[3*i+2]);
        let entry = this.find(id);
        if (!entry) {
          entry = {id, position: pt, time: now};
          const idx = this.insert(entry);
          if (idx < 0) {
            entry = null;
          }
        }
        if (entry) {
          entry.time = now;
          if (!entry.node) {
            entry.node = SCNNode(ARPointManager_geometry);
            this.root.addChildNode(entry.node);
            console.log(entry);
          }
          entry.node.position = entry.position;
        }
      }
    }
  }
}

global.OnShake = () => {
}

ARRain_update = (view, now) => {
  //console.log(now);
  //console.log('updated');
  //ARRain_pts.updatePoints(arView.session.currentFrame);
}

ARRain_sessionDidUpdateFrame = function(session, frame)  {
  console.log('updateFrame');
  ARRain_pts.clear();
  ARRain_pts.updatePoints(frame);
  process.nextTick(gc);
}

ARRain_make =  async function ARRain_make(nav, demoVC) {
  view = demoVC.view;
  arView = new ARSCNView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  //arView.debugOptions = ARSCNDebugOptionShowFeaturePoints | ARSCNDebugOptionShowWorldOrigin;
  arView.autoenablesDefaultLighting = true;
  //arView.debugOptions = ARSCNDebugOptionShowFeaturePoints;
  config = new ARWorldTrackingConfiguration();
  //config.planeDetection = ARPlaneDetectionHorizontal;
  //config.environmentTexturing = AREnvironmentTexturingAutomatic;

  scene = new SCNScene();
  if (typeof ARRain_pts !== 'undefined') {
    ARRain_pts.clear();
  }
  ARRain_pts = new ARPointManager(scene.rootNode);
  geo = SCNTube(0.01, 0.02, 0.1);
  node = new SCNNode(geo);
  mat = new SCNMaterial();
  mat.diffuse.contents = {red: 1, green: 0.5, blue: 0.5};
  geo.materials = [mat];
  node = new SCNNode(geo);
  arView.scene = scene;

  arView.delegate = ARSCNViewDelegate({
    rendererNodeForAnchor: () => {
      return new SCNNode();
    },
    rendererUpdateAtTime: (...args) => {
      ARRain_update(...args);
    },
  });

  arView.session.delegate = ARSessionDelegate({
    sessionDidUpdateFrame(...args) {
      return ARRain_sessionDidUpdateFrame(...args);
    },
  });

/*
  spotlight = new SCNLight();
  spotlight.type = SCNLightTypeOmni;
  scene.rootNode.light = spotlight;
  scene.rootNode.position = { x: 1, y: 1, z: 0 };
  */


  /*
  // place shadow plane under your object
  shadowPlane = SCNPlane(10, 10);
  //shadowPlane.materials.first.colorBufferWriteMask = 0;
  shadowPlaneNode = SCNNode(shadowPlane);
  shadowPlaneNode.position = SCNVector3Make(0,-3,0);
  shadowPlaneNode.eulerAngles = SCNVector3Make(-Math.PI*0.5, 0, 0); // because plane is created vertical
  scene.rootNode.addChildNode(shadowPlaneNode);
  */

  demoVC.view.addSubview(arView);
  nav.pushViewControllerAnimated(demoVC, true);

  arView.touchesBeganWithEvent = (touches, evt) => {
    touches = Array.from(touches);
    let touch = touches[0];
    let pt = touches[0].locationInView(touch.view);
    let hits = arView.hitTest(pt);
    if (hits && hits.length > 0) {
      let hit = hits[0];
      console.log(hit);
      if (hit.node) {
        node.geometry.firstMaterial.diffuse.contents = UIColor(1.0, 1.0, 1.0);
        child.geometry.firstMaterial.diffuse.contents = UIColor(1.0, 1.0, 1.0);
        child2.geometry.firstMaterial.diffuse.contents = UIColor(1.0, 1.0, 1.0);
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
        child = node.clone();
        child.geometry = SCNTube(0.01, 0.02, 0.1);
        child.simdTransform = new THREE.Matrix4().makeTranslation(0,0,-0.3);
        node.addChildNode(child);

        child2 = child.clone();
        child2.geometry = SCNTube(0.01, 0.02, 0.1);
        child.addChildNode(child2);

        const camXform = frame.camera.transform;
        const xform = new THREE.Matrix4().fromArray(camXform);
        xform.multiply(new THREE.Matrix4().makeTranslation(0,0,-0.3));
        node.simdTransform = xform;
        scene.rootNode.addChildNode(node);
      }
    }
    configure();
  }
}

function make(...args) {
  return ARRain_make(...args);
}

module.exports = make;
