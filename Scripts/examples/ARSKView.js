const SweetieKit = require('std:sweetiekit.node');

THREE = require('../vendor/three/three');

const colors = require('./colors');
const {
  UIControlState,
  UIControlEvents,
  NSFontAttributeName,
  NSForegroundColorAttributeName,
  NSKernAttributeName,
  UITextAutocorrectionType,
  UITextSpellCheckingType,
} = require('./enums');

const {
  ARSKView,
  ARSKViewDelegate,
  ARWorldTrackingConfiguration,
  SKLabelNode,
  SKScene,
  ARAnchor,
  UITextField,
  UIButton,
  UIImage,
  NSMutableAttributedString,
  UIFont,
  UIView,
  UISlider,
  CoreGraphics,
} = SweetieKit;

let text = '👀';

function lineWrap(s) {
  if (s.length > 600) {
    return s.substr(0, 600) + '\n' + lineWrap(s.substr(600));
  }
  return s;
}

function textWrap(s) {
 return s.split('\n').map(line => lineWrap(line)).join('\n');
}

function makeCamBtn(demoVC, btnSize) {
  const camBtn = new UIButton({
    x: (demoVC.view.frame.width - btnSize) / 2,
    y: demoVC.view.frame.height - (124 + btnSize),
    width: btnSize,
    height: btnSize,
  });
  camBtn.layer.cornerRadius = btnSize / 2;
  camBtn.layer.shadowOpacity = 1;
  camBtn.layer.shadowOffset = { width: 0, height: 4 };
  camBtn.layer.shadowColor = colors.fitbodDarkGrey;
  camBtn.layer.shadowRadius = 6;
  camBtn.showsTouchWhenHighlighted = true;
  camBtn.setBackgroundImageForState(new UIImage('camera_btn_thin'), UIControlState.normal);
  return camBtn;
}

async function makeTextField(demoVC, fieldHeight, horOffset, callback) {
  const field = await UITextField.alloc(
    horOffset,
    0,
    demoVC.view.frame.width - (horOffset * 2),
    fieldHeight,
    callback,
  );
  field.textColor = {
    ...colors.white,
    alpha: 0.8,
  };
  field.backgroundColor = colors.clear;
  const placeholderText = '👀, 🐙, Hi Mom, etc';
  const placeholderFont = new UIFont('Lato-Regular', 17);
  const attrPlaceholder = new NSMutableAttributedString(placeholderText);
  attrPlaceholder.addAttribute(NSForegroundColorAttributeName, colors.white, {
    location: 0,
    length: placeholderText.length,
  });
  attrPlaceholder.addAttribute(NSFontAttributeName, placeholderFont, {
    location: 0,
    length: placeholderText.length,
  });
  attrPlaceholder.addAttribute(NSKernAttributeName, 1.1, {
    location: 0,
    length: placeholderText.length,
  });
  field.attributedPlaceholder = attrPlaceholder;
  field.autocorrectionType = UITextAutocorrectionType.none;
  field.spellCheckingType = UITextSpellCheckingType.none;
  return field;
}

function takeScreenshot(view) {
  const w = view.frame.width;
  const h = view.frame.height;

  try {
    CoreGraphics.UIGraphicsBeginImageContextWithOptions(
      { width: w, height: h },
      true,
      0.0,
    );

    view.layer.renderInContext('current');

    const img = CoreGraphics.UIGraphicsGetImageFromCurrentImageContext();

    if (img) {
      const ssFrame = { x: 0, y: 0, width: w * 0.4, height: h * 0.4 };
      const ssView = new UIImageView(img);
      ssView.frame = ssFrame;
      ssView.layer.borderWidth = 1;
      ssView.layer.borderColor = { red: 1, green: 1, blue: 1, alpha: 1 };
      view.addSubview(ssView);
      view.bringSubviewToFront(ssView);

      // ==========
      // recalls UIApplicationMain and crashes?
      // ==========

      // UIKit.UIImageWriteToSavedPhotosAlbum(img, () => {
      //   console.log('written!');
      // });
    }
  } finally {
    CoreGraphics.UIGraphicsEndImageContext();
  }
}

function makeTopView(demoVC, fieldHeight) {
  const borderView = new UIView({ x: 0, y: fieldHeight, width: demoVC.view.frame.width, height: 1 });
  borderView.backgroundColor = {
    ...colors.white,
    alpha: 0.3,
  };

  const topView = new UIView({ x: 0, y: 0, width: demoVC.view.frame.width, height: fieldHeight + 1 });
  topView.backgroundColor = {
    ...colors.white,
    alpha: 0.1,
  };

  topView.addSubview(borderView);

  return topView;
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
    const node = new SKLabelNode();
    const txt = _text(text);
    node.numberOfLines = textWrap(txt).split('\n').length;
    //node.preferredMaxLayoutWidth = 10;
    node.text = txt.substr(0,500);
    return node;
  };

  const _update = (xform, txt = text, char = active) => {
    if (!char) {
      char = {};
      chars.push(char);
    }
    if (!char.node) {
      char.node = _node(txt);
    }
    char.node.text = _text(txt);
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

  const btnSize = 70;

  const camBtn = makeCamBtn(demoVC, btnSize);
  camBtn.addTarget(() => {
    console.log('taking screenshot');
    takeScreenshot(arView);
  }, UIControlEvents.touchUpInside);

  const fieldHeight = 50;
  const horOffset = 12;

  const field = await makeTextField(demoVC, fieldHeight, horOffset, () => {
    text = field.text;
  });

  const topView = makeTopView(demoVC, fieldHeight);
  topView.addSubview(field);

  const viewW = view.frame.width;
  const scaleSliderY = fieldHeight + 62;
  const sliderHeight = 40;

  const scaleSlider = new UISlider({
      x: horOffset, y: scaleSliderY, width: viewW - (horOffset * 2), height: sliderHeight,
  });
  scaleSlider.addTarget(() => {
    console.log('scale slider changed', scaleSlider.value);
  }, UIControlEvents.valueChanged);

  const distSlider = new UISlider({
    x: horOffset, y: scaleSliderY + sliderHeight, width: viewW - (horOffset * 2), height: sliderHeight,
  });
  distSlider.addTarget(() => {
    console.log('distance slider changed', distSlider.value);
  }, UIControlEvents.valueChanged);

  const rotSlider = new UISlider({
    x: horOffset, y: scaleSliderY + (sliderHeight * 2), width: viewW - (horOffset * 2), height: sliderHeight,
  });
  rotSlider.addTarget(() => {
    console.log('rotation slider changed', rotSlider.value);
  }, UIControlEvents.valueChanged);

  const subviews = [topView, scaleSlider, distSlider, rotSlider, camBtn];
  subviews.forEach((s) => {
    demoVC.view.addSubview(s);
    demoVC.view.bringSubviewToFront(s);
  });

  arView.viewWillAppear = () => {
    arView.session.run(config);
  }
}

module.exports = make;
