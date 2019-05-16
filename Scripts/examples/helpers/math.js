const pointAdd = (left, right) => ({
  x: left.x + right.x,
  y: left.y + right.y,
});

const pointSub = (left, right) => ({
  x: left.x - right.x,
  y: left.y - right.y,
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

const normalized = (pt) => {
  const len = length(pt);
  return pointDiv(pt, len);
};


module.exports.point = {
  add: pointAdd,
  sub: pointSub,
  mult: pointMult,
  div: pointDiv,
  length,
  normalized,
};
