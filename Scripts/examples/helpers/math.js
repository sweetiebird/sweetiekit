const pointAdd = (left, right) => ({
  x: left.x + right.x,
  y: left.y + right.y,
});

const pointSub = (left, right) => ({
  x: left.x - right.x,
  y: left.y - right.y,
});

const vecSub = (left, right) => ({
  x: left.x - right.x,
  y: left.y - right.y,
  z: left.z - right.z,
});

const pointMult = (pt, scalar) => ({
  x: pt.x * scalar,
  y: pt.y * scalar,
});

const pointDiv = (pt, scalar) => ({
  x: pt.x / scalar,
  y: pt.y / scalar,
});

const length = (pt) => (
  Math.sqrt((pt.x * pt.x) + (pt.y * pt.y))
);

const lengthVec = (vec) => (
  Math.sqrt((vec.x * vec.x) + (vec.y * vec.y) + (vec.z * vec.z))
);

const normalized = (pt) => {
  const len = length(pt);
  return pointDiv(pt, len);
};

const degToRad = (deg) => {
  return deg * (Math.PI / 180);
};

const radToDeg = (rad) => {
  return rad * (180 / Math.PI);
};


module.exports.point = {
  add: pointAdd,
  sub: pointSub,
  mult: pointMult,
  div: pointDiv,
  length,
  normalized,
};

module.exports.vec = {
  sub: vecSub,
  length: lengthVec,
};

module.exports.degToRad = degToRad;
module.exports.radToDeg = radToDeg;
