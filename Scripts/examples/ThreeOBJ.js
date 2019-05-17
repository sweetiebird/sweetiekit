const fs = require('fs');

THREE = require('../vendor/three/three');
require('../vendor/three/OBJExporter');

async function make(demoVC) {
  const exporter = new THREE.OBJExporter();
  const geometry = new THREE.BoxBufferGeometry(0.2, 0.2, 0.2);
  const material = new THREE.MeshBasicMaterial({ color: 0xffff00 });
  const mesh = new THREE.Mesh(geometry, material);
  const output = exporter.parse(mesh);
  console.log(output);
  fs.writeFileSync('model.obj', output, "utf8");
  return undefined;
}

module.exports = make;
