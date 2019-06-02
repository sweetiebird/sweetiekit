const SweetieKit = require('std:sweetiekit.node');

const {
  SCNView,
  SCNPlane,
  SCNNode,
  SCNScene,
} = SweetieKit;

function UIColorRandom() {
  return {red: Math.random(), green: Math.random(), blue: Math.random()};
}

async function make(demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h };

  scnView = new SCNView(frame);
  scene = new SCNScene();
  scnView.scene = scene;
  scnView.autoenablesDefaultLighting = true;
  scnView.allowsCameraControl = true;
  rootNode = scene.rootNode;

  scnView.viewWillAppear = (animated) => {
    console.log('scnView.viewWillAppear', animated, this);
    scnView.backgroundColor = UIColorRandom();

    plane = SCNPlane(1.0, 1.0);
    plane.firstMaterial.diffuse.contents = {red: 0.5, green: 0.5, blue: 1.0};
    node = new SCNNode(plane);
    rootNode.addChildNode(node);

    sphere = SCNSphere(1.0);
    sphere.firstMaterial.diffuse.contents = {red: 1.0, green: 0.1, blue: 0.1};
    sphereNode = new SCNNode(sphere);
    sphereNode.position = new THREE.Vector3(0.0, 3.0, 0.0);
    rootNode.addChildNode(sphereNode);

    box = SCNBox({width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.2});
    box.firstMaterial.diffuse.contents = {red: 0.1, green: 1.0, blue: 0.1};
    boxNode = new SCNNode(box);
    boxNode.position = new THREE.Vector3(0.0, -3.0, 0.0);
    rootNode.addChildNode(boxNode);

    cylinder = SCNCylinder({radius: 1.0, height: 1.0});
    cylinder.firstMaterial.diffuse.contents = {red: 1.0, green: 1.0, blue: 0.1};
    cylinderNode = new SCNNode(cylinder);
    cylinderNode.position = new THREE.Vector3(-3.0, 3.0, 0.0);
    rootNode.addChildNode(cylinderNode)

    torus = SCNTorus({ringRadius: 1.0, pipeRadius: 0.3});
    torus.firstMaterial.diffuse.contents = {red: 1.0, green: 1.0, blue: 1.0};
    torusNode = new SCNNode(torus);
    torusNode.position = new THREE.Vector3(-3.0, 0.0, 0.0);
    rootNode.addChildNode(torusNode);

    capsule = SCNCapsule({capRadius: 0.3, height: 1.0});
    capsule.firstMaterial.diffuse.contents = UIColorRandom();//UIColor.gray;
    capsuleNode = new SCNNode(capsule);
    capsuleNode.position = new THREE.Vector3(-3.0, -3.0, 0.0);
    rootNode.addChildNode(capsuleNode);

    cone = SCNCone({topRadius: 1.0, bottomRadius: 2.0, height: 1.0});
    cone.firstMaterial.diffuse.contents = UIColorRandom();//UIColor.magenta;
    coneNode = new SCNNode(cone);
    coneNode.position = new THREE.Vector3(3.0, -2.0, 0.0);
    rootNode.addChildNode(coneNode);

    tube = SCNTube({innerRadius: 1.0, outerRadius: 2.0, height: 1.0});
    tube.firstMaterial.diffuse.contents = UIColorRandom();//UIColor.brown;
    tubeNode = new SCNNode(tube);
    tubeNode.position = new THREE.Vector3(3.0, 2.0, 0.0);
    rootNode.addChildNode(tubeNode);
  };

  return scnView;
}

module.exports = make;
