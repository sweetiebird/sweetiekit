const fs = require('fs');

THREE = require('../vendor/three/three');
require('../vendor/three/OBJExporter');

async function make(demoVC) {
  const exporter = new THREE.OBJExporter();
  const geometry = new THREE.BoxBufferGeometry(0.1, 1, 1);
  const material = new THREE.MeshBasicMaterial({ color: 0xffff00 });
  const mesh = new THREE.Mesh(geometry, material);
  const output = exporter.parse(mesh);
  fs.writeFileSync('model.obj', output);
  return undefined;
}

module.exports = make;
