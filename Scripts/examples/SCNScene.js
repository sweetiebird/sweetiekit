const SweetieKit = require('std:sweetiekit.node');

SWEET = typeof SWEET === 'undefined' ? {} : SWEET;
SWEET.SCNScene = SWEET.SCNScene || {};

Path = require('path');
MediaPath = Path.resolve(Path.join(Path.dirname(Require.resolve('.')),'node_modules', 'sweetiekit-art', 'media'));

const {
  MDLAsset,
  MDLScatteringFunction,
  MDLMaterial,
  MDLMaterialProperty,
  MDLObject,
  SCNView,
  SCNPlane,
  SCNNode,
  SCNScene,
  SCNPhysicsBody,
} = SweetieKit;

function UIColorRandom() {
  return {red: Math.random(), green: Math.random(), blue: Math.random()};
}

function V3(v, ...args) {
  switch (args.length) {
  case 0:
    return v.set(0,0,0);
  case 1:
    return v.set(args[0].x, args[0].y, args[0].z);
  case 2:
    return v.set(args[0], args[1], 0.0);
  case 3:
    return v.set(args[0], args[1], args[2]);
  default:
    throw new Error("V3: Bad arguments");
  }
}

SWEET.SCNScene.mount = async (nav, demoVC) => {
  SWEET.SCNScene.nav = nav;
  SWEET.SCNScene.demoVC = demoVC;
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h };

  scnView = new SCNView(frame);
  scene = new SCNScene();
  scnView.scene = scene;
  scnView.autoenablesDefaultLighting = true;
  scnView.allowsCameraControl = true;
  rootNode = scene.rootNode;

  pos1 = new THREE.Vector3();
  isImpulse = false;
  physNormalize = false;
  physScale = 1.0;
  hitExpr = (hit) => {
    return moveExpr(hit.worldCoordinates);
  };
  currentPos = (node) => node.presentationNode.position;
  moveExpr = (xyz, node=sphereNode) => {
    dir = V3(pos1, xyz).sub(currentPos(node));
    if (physNormalize) {
      dir.normalize();
    }
    dir.multiplyScalar(physScale);
    node.physicsBody.applyForce(dir, isImpulse);
  };

  scnView.touchesBeganWithEvent = (touches, evt) => {
    touches = Array.from(touches);
    let touch = touches[0];
    let pt = touches[0].locationInView(touch.view);
    pt.y -= Math.trunc(0.1*touch.view.height);
    console.log('touchesBegan', touches.length, pt, evt);
    let hits = scnView.hitTest(pt);
    if (hits && hits.length > 0) {
      let hit = hits[0];
      hitExpr(hit);
    }
  };

  scnView.touchesMovedWithEvent = (touches, evt) => {
    touches = Array.from(touches);
    let touch = touches[0];
    let pt = touches[0].locationInView(touch.view);
    pt.y -= Math.trunc(0.1*touch.view.height);
    //console.log('touchesMoved', touches.length, pt, evt);
    let hits = scnView.hitTest(pt);
    if (hits && hits.length > 0) {
      let hit = hits[0];
      hitExpr(hit);
    }
    /*
    //console.log('touchesMoved', touches.length, pt);
    if (hits && hits.length > 0) {
      active = _update(hits ? hits[0] : null);
      console.log(active.node.xScale, active.node.yScale,
        active.node.size ? active.node.size.width : -1,
        active.node.size ? active.node.size.height : -1);
    }
    */
  };

  scnView.touchesEndedWithEvent = (touches, evt) => {
    touches = Array.from(touches);
    let touch = touches[0];
    let pt = touches[0].locationInView(touch.view);
    pt.y -= Math.trunc(0.1*touch.view.height);
    console.log('touchesEnded', touches.length, pt, evt);
    /*
    let hits = scnView.hitTest(pt);
    if (hits && hits.length > 0) {
      active = _update(hits ? hits[0] : null);
    }
    */
  };

  scnView.viewWillAppear = (animated) => {
    console.log('scnView.viewWillAppear', animated, this);
    scnView.backgroundColor = UIColorRandom();

    povNode = new SCNNode();
    cam = new SCNCamera();
    povNode.camera = cam;
    povNode.eulerAngles = {x: -0.8357508, y: -0.552055, z: 1.75009517988e-8};
    povNode.position = {x: -5.12623739, y: 6.3341617, z: 9.9800148};
    rootNode.addChildNode(povNode);
    scnView.pointOfView = povNode;

    if (typeof floor === 'undefined') {
      floor = SCNFloor();
      floor.firstMaterial.diffuse.contents = UIColorRandom();
      floor.reflectivity = 0.25;
    }
    floorNode = new SCNNode(floor);
    floorNode.position = new THREE.Vector3(0.0, -3.0, -3.0);
    floorNode.physicsBody = SCNPhysicsBody.staticBody();
    rootNode.addChildNode(floorNode);

    if (typeof plane === 'undefined') {
      plane = SCNPlane(1.0, 1.0);
      plane.firstMaterial.diffuse.contents = {red: 0.5, green: 0.5, blue: 1.0};
    }
    planeNode = new SCNNode(plane);
    planeNode.physicsBody = SCNPhysicsBody.staticBody();
    rootNode.addChildNode(planeNode);

    if (typeof hornbugGeometry === 'undefined') {
      hornbugAsset = MDLAsset.alloc().initWithURL(NSURL(Path.join(MediaPath, 'hornbug.obj')));
      hornbugObject = hornbugAsset.objectAtIndex(0);
      hornbugGeometry = SCNGeometry.geometryWithMDLMesh(hornbugObject);
    }
    hornbugNode = SCNNode.nodeWithGeometry(hornbugGeometry);
    hornbugNode.position = new THREE.Vector3(0.0, 2.0, 0.0);
    hornbugNode.physicsBody = SCNPhysicsBody.dynamicBody();
    rootNode.addChildNode(hornbugNode);

    if (typeof fighterMaterial === 'undefined') {
      fighterScatteringFunction = MDLScatteringFunction();
      fighterMaterial = MDLMaterial.alloc().initWithNameScatteringFunction('fighterMaterial', fighterScatteringFunction);
      fighterMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('Fighter_Diffuse_25.jpg', MDLMaterialSemanticBaseColor, NSURL(Path.join(MediaPath, 'Fighter_Diffuse_25.jpg'))));
      fighterMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('Fighter_Specular_25.jpg', MDLMaterialSemanticMetallic, NSURL(Path.join(MediaPath, 'Fighter_Specular_25.jpg'))));
      fighterMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('Fighter_Illumination_25.jpg', MDLMaterialSemanticEmission, NSURL(Path.join(MediaPath, 'Fighter_Illumination_25.jpg'))));
    }
    if (typeof fighterGeometry === 'undefined') {
      fighterAsset = MDLAsset.alloc().initWithURL(NSURL(Path.join(MediaPath, 'Fighter.obj')));
      fighterObject = fighterAsset.objectAtIndex(0);
      for (let submesh of fighterObject.submeshes) {
        submesh.material = fighterMaterial;
      }
      fighterGeometry = SCNGeometry.geometryWithMDLMesh(fighterObject);
    }
    fighterNode = SCNNode.nodeWithGeometry(fighterGeometry);
    fighterNode.transform = new THREE.Matrix4().makeScale(3.0/1000, 3.0/1000, 3.0/1000);
    fighterNode.physicsBody = SCNPhysicsBody.dynamicBody();
    rootNode.addChildNode(fighterNode);

    if (typeof turtleMaterial === 'undefined') {
      turtleScatteringFunction = MDLScatteringFunction();
      turtleMaterial = MDLMaterial.alloc().initWithNameScatteringFunction('turtleMaterial', turtleScatteringFunction);
      turtleMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('models/Turtle_OBJ/turtle_color.png', MDLMaterialSemanticBaseColor, NSURL(Path.join(MediaPath, 'models/Turtle_OBJ/turtle_color.png'))));
      turtleMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('models/Turtle_OBJ/turtle_normal.png', MDLMaterialSemanticTangentSpaceNormal, NSURL(Path.join(MediaPath, 'models/Turtle_OBJ/turtle_normal.png'))));
      turtleMaterial.setProperty(MDLMaterialProperty.alloc().initWithNameSemanticURL('models/Turtle_OBJ/turtle_alpha.png', MDLMaterialSemanticOpacity, NSURL(Path.join(MediaPath, 'models/Turtle_OBJ/turtle_alpha.png'))));
    }
    if (typeof turtleGeometry === 'undefined') {
      turtleAsset = MDLAsset.alloc().initWithURL(NSURL(Path.join(MediaPath, 'models/Turtle_OBJ/turtle.obj')));
      turtleObject = turtleAsset.objectAtIndex(0);
      for (let submesh of turtleObject.submeshes) {
        submesh.material = turtleMaterial;
      }
      turtleGeometry = SCNGeometry.geometryWithMDLMesh(turtleObject);
    }
    turtleNode = SCNNode.nodeWithGeometry(turtleGeometry);
    turtleNode.position = new THREE.Vector3(1.0, 3.0, 0.0);
    // turtleNode.transform = new THREE.Matrix4().makeScale(3.0/1000, 3.0/1000, 3.0/1000);
    turtleNode.physicsBody = SCNPhysicsBody.dynamicBody();
    rootNode.addChildNode(turtleNode);

    if (typeof sphere === 'undefined') {
      sphere = SCNSphere(1.0);
      sphere.firstMaterial.diffuse.contents = {red: 1.0, green: 0.1, blue: 0.1};
    }
    sphereNode = new SCNNode(sphere);
    sphereNode.position = new THREE.Vector3(0.0, 3.0, 0.0);
    sphereNode.physicsBody = SCNPhysicsBody.dynamicBody();
    rootNode.addChildNode(sphereNode);

    if (typeof box === 'undefined') {
      box = SCNBox({width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.2});
      box.firstMaterial.diffuse.contents = {red: 0.1, green: 1.0, blue: 0.1};
    }
    boxNode = new SCNNode(box);
    boxNode.position = new THREE.Vector3(0.0, -3.0, 0.0);
    boxNode.physicsBody = SCNPhysicsBody.dynamicBody();
    rootNode.addChildNode(boxNode);

    if (typeof cylinder === 'undefined') {
      cylinder = SCNCylinder({radius: 1.0, height: 1.0});
      cylinder.firstMaterial.diffuse.contents = {red: 1.0, green: 1.0, blue: 0.1};
    }
    cylinderNode = new SCNNode(cylinder);
    cylinderNode.position = new THREE.Vector3(-3.0, 3.0, 0.0);
    cylinderNode.physicsBody = SCNPhysicsBody.dynamicBody();
    rootNode.addChildNode(cylinderNode)

    if (typeof torus === 'undefined') {
      torus = SCNTorus({ringRadius: 1.0, pipeRadius: 0.3});
      torus.firstMaterial.diffuse.contents = {red: 1.0, green: 1.0, blue: 1.0};
    }
    torusNode = new SCNNode(torus);
    torusNode.position = new THREE.Vector3(-3.0, 0.0, 0.0);
    torusNode.physicsBody = SCNPhysicsBody.dynamicBody();
    rootNode.addChildNode(torusNode);

    if (typeof capsule === 'undefined') {
      capsule = SCNCapsule({capRadius: 0.3, height: 1.0});
      capsule.firstMaterial.diffuse.contents = UIColorRandom();//UIColor.gray;
    }
    capsuleNode = new SCNNode(capsule);
    capsuleNode.position = new THREE.Vector3(-3.0, -3.0, 0.0);
    capsuleNode.physicsBody = SCNPhysicsBody.dynamicBody();
    rootNode.addChildNode(capsuleNode);

    if (typeof cone === 'undefined') {
      cone = SCNCone({topRadius: 1.0, bottomRadius: 2.0, height: 1.0});
      cone.firstMaterial.diffuse.contents = UIColorRandom();//UIColor.magenta;
    }
    coneNode = new SCNNode(cone);
    coneNode.position = new THREE.Vector3(3.0, -2.0, 0.0);
    coneNode.physicsBody = SCNPhysicsBody.dynamicBody();
    rootNode.addChildNode(coneNode);

    if (typeof tube === 'undefined') {
      tube = SCNTube({innerRadius: 1.0, outerRadius: 2.0, height: 1.0});
      tube.firstMaterial.diffuse.contents = UIColorRandom();//UIColor.brown;
    }
    tubeNode = new SCNNode(tube);
    tubeNode.position = new THREE.Vector3(3.0, 2.0, 0.0);
    tubeNode.physicsBody = SCNPhysicsBody.dynamicBody();
    rootNode.addChildNode(tubeNode);
  };

  return scnView;
};

async function make(...args) {
  return SWEET.SCNScene.mount(...args);
}

module.exports = make;
