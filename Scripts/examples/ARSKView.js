const SweetieKit = require('std:sweetiekit.node');

THREE = require('../vendor/three/three');

const {
  ARSKView,
  ARSKViewDelegate,
  ARWorldTrackingConfiguration,
  SKLabelNode,
  SKScene,
  ARAnchor,
  UITextField,
  UIImage,
  SKTexture,
  SKSpriteNode,
} = SweetieKit;

//let text = '👀';
let text = new SKTexture(new UIImage("nic"));

function lineWrap(s) {
  if (s.length > 600) {
    return s.substr(0, 600) + '\n' + lineWrap(s.substr(600));
  }
  return s;
}

function textWrap(s) {
 return s.split('\n').map(line => lineWrap(line)).join('\n');
}

async function make(nav, demoVC) {
  const view = demoVC.view;
  const arView = new ARSKView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  const config = new ARWorldTrackingConfiguration();
  const chars = [];
  let active = null;

  const _remove = (char, removeNode = true, removeAnchor = true) => {
    if (!char) {
      return true;
    }
    const session = arView.session;
    if (!session) {
      throw new Error("no arView session");
    }
    const {anchor, node} = char;
    if (removeAnchor && anchor) {
      arView.session.remove(anchor);
      delete char.anchor;
    }
    if (removeNode && node) {
      node.removeFromParent();
      delete char.node;
    }
    return true;
  };

  global.OnShake = function OnShake() {
    console.log('shook');
    if (chars.length > 0) {
      if (_remove(chars[chars.length - 1])) {
        chars.pop();
      }
    }
    if (_remove(active)) {
      active = null;
    }
  };

  const viewDel = new ARSKViewDelegate((view, anchor) => {
    const { identifier } = anchor;
    if (active && active.anchor && active.anchor.identifier === anchor.identifier) {
      if (!active.node) {
        throw new Error("expected node");
      }
      return active.node;
    }
    for (let i = chars.length - 1; i >= 0; i--) {
      let char = chars[i];
      if (char.anchor.identifier === identifier) {
        if (!char.node) {
          throw new Error("expected node");
        }
        return char.node;
      }
    }
    //throw new Error("couldn't find node for anchor " + anchor.identifier);
  });
  arView.delegate = viewDel;

  const scene = SKScene.sceneWithSize({
    width: view.frame.width,
    height: view.frame.height
  });
  arView.scene = scene;

  const mat1 = new THREE.Matrix4();
  const mat2 = new THREE.Matrix4();

  const _xform = (xform) => {
    if (xform && xform.hasOwnProperty("worldTransform")) {
      xform = xform.worldTransform;
    }
    if (!xform) {
      const camXform = arView.session.currentFrame.camera.transform;
      const translation = mat1.makeTranslation(0,0,-1000/1000);
      xform = mat2.fromArray(camXform);
      xform.multiply(translation);
      gc();
    }
    return xform;
  };

  const _text = (txt) => {
    return txt || text || '👀';
  }

  const _node = (text) => {
    if (text instanceof UIImage || text instanceof SKTexture) {
      const node = new SKSpriteNode(text);
      node.xScale = 0.1;
      node.yScale = 0.1;
      return node;
    } else {
      const node = new SKLabelNode();
      const txt = _text(text);
      node.numberOfLines = textWrap(txt).split('\n').length;
      //node.preferredMaxLayoutWidth = 10;
      node.text = txt.substr(0,500);
      return node;
    }
  };

  const _update = (xform, txt = text, char = active) => {
    if (!char) {
      char = {};
      chars.push(char);
    }
    if (txt instanceof UIImage || txt instanceof SKTexture) {
      if (!char.node) {
        char.node = _node(txt);
      }
    } else {
      if (!char.node) {
        char.node = _node(txt);
      }
      char.node.text = _text(txt);
    }
    if (char.anchor) {
      arView.session.remove(char.anchor);
      delete char.anchor;
    }
    xform = _xform(xform);
    char.anchor = ARAnchor.initWithTransform(xform);
    arView.session.add(char.anchor);
    return char;
  };

  scene.touchesBegan = (touches, evt) => {
    let touch = touches[0];
    let pt = touches[0].locationInView(touch.view);
    pt.y -= Math.trunc(0.1*touch.view.height);
    let hits = arView.hitTest(pt, 1);
    console.log('touchesBegan', touches.length, pt);
    if (hits && hits.length > 0) {
      active = _update(hits ? hits[0] : null);
    }
  };

  scene.touchesMoved = (touches, evt) => {
    let touch = touches[0];
    let pt = touches[0].locationInView(touch.view);
    pt.y -= Math.trunc(0.1*touch.view.height);
    let hits = arView.hitTest(pt, 1);
    //console.log('touchesMoved', touches.length, pt);
    if (hits && hits.length > 0) {
      active = _update(hits ? hits[0] : null);
    }
  };

  scene.touchesEnded = (touches, evt) => {
    let touch = touches[0];
    let pt = touches[0].locationInView(touch.view);
    pt.y -= Math.trunc(0.1*touch.view.height);
    let hits = arView.hitTest(pt, 1);
    console.log('touchesEnded', touches.length, pt);
    if (hits && hits.length > 0) {
      active = _update(hits ? hits[0] : null);
    }
    active = null;
  };

  /*
  this.interval = setInterval(() => {
    for (let c of chars) {
      let pos = c.node.position;
      pos.x += 1;
      c.node.position = pos;
    }
  }, 1000/60);*/

  demoVC.view.addSubview(arView);
  nav.pushViewController(demoVC);

  arView.presentScene(scene);

  const field = await UITextField.alloc(12, 0, demoVC.view.frame.width - 24, 50, () => {
    text = field.text;
  });

  demoVC.view.addSubview(field);
  demoVC.view.bringSubviewToFront(field);

  arView.viewWillAppear = () => {
    arView.session.run(config);
  }
}

module.exports = make;
