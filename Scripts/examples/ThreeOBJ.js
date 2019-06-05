const fs = require('fs');

THREE = require('../vendor/three/three');
require('../vendor/three/OBJExporter');

async function make(nav, demoVC) {
  const exporter = new THREE.OBJExporter();
  const geometry = new THREE.RingGeometry(0.3, 0.5, 32);
  const material = new THREE.MeshNormalMaterial();
  const mesh = new THREE.Mesh(geometry, material);
  const output = exporter.parse(mesh);
  console.log(output);
  fs.writeFileSync('dot.obj', output, "utf8");
  return undefined;
}

module.exports = make;
