const SweetieKit = require('std:sweetiekit.node');

THREE = require('../vendor/three/three');

const colors = require('./colors');
const {
  UIControlState,
  UIControlEvents,
  NSFontAttributeName,
  NSForegroundColorAttributeName,
  NSKernAttributeName,
  NSStrokeColorAttributeName,
  NSStrokeWidthAttributeName,
  UITextAutocorrectionType,
  UITextSpellCheckingType,
  UIImageOrientation,
  UIViewContentMode,
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
  SKTexture,
  SKSpriteNode,
  RPScreenRecorder,
  RPPreviewViewController,
  RPPreviewViewControllerDelegate,
  SKEmitterNode,
  SKNode,
  SKAction,
} = SweetieKit;

//let text = '👀';
let text = new SKTexture(UIImage("nic"));
UIImage.transparent = UIImage.transparent || UIImage("transparent");

let isEffectMode = false;
const sparkParticlePath = 'Spark.sks';
const magicParticlePath = 'Magic.sks';

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
  const camBtn = UIButton({
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
  camBtn.setBackgroundImageForState(UIImage('camera_btn_thin'), UIControlState.normal);
  return camBtn;
}

async function makeTextField(demoVC, fieldHeight, horOffset, callback) {
  const frame = CGRectMake(
    horOffset,
    0,
    demoVC.view.frame.width - (horOffset * 2),
    fieldHeight);

  const field = UITextField.initWithFrameCallback(frame, callback);
  field.textColor = {
    ...colors.white,
    alpha: 0.8,
  };
  field.backgroundColor = colors.clear;
  const placeholderText = 'Enter some text...';
  const placeholderFont = UIFont('Lato-Bold', 17);
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

function makeParticleButton(demoVC) {
  const size = 40;
  const btn = UIButton({
    x: demoVC.view.frame.width - size,
    y: 0,
    width: size,
    height: size,
  });
  btn.backgroundColor = colors.clear;
  btn.setBackgroundImageForState(UIImage('fire'), UIControlState.normal);
  btn.showsTouchWhenHighlighted = true;
  btn.contentMode = UIViewContentMode.scaleAspectFit;
  btn.alpha = 0.3;
  return btn;
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

    view.layer.renderInContext();

    const img = CoreGraphics.UIGraphicsGetImageFromCurrentImageContext();

    if (img) {
      const ssFrame = { x: 0, y: 0, width: w * 0.4, height: h * 0.4 };
      const ssView = UIImageView(img);
      ssView.frame = ssFrame;
      ssView.layer.borderWidth = 1;
      ssView.layer.borderColor = UIColor.white;
      view.addSubview(ssView);
      view.bringSubviewToFront(ssView);

      // ==========
      // recalls UIApplicationMain and crashes?
      // ==========

      console.log("Writing UIImage");
      UIKit.UIImageWriteToSavedPhotosAlbum(img, () => {
        console.log('written!');
      });
    }
  } finally {
    CoreGraphics.UIGraphicsEndImageContext();
  }
}

function getCapturedImage(arView) {
  try {
    const orientation = (new UIApplication()).statusBarOrientation;
    const size = { width: arView.frame.width, height: arView.frame.height };
    const xform = arView.session.currentFrame.displayTransform(orientation, size);
    const xFormMatrix = new THREE.Matrix3().fromArray(xform);
    const matrix = new THREE.Matrix3().rotate(90);
    xFormMatrix.multiply(matrix);
    const ciImg = arView.session.currentFrame.capturedImage;
    const xformedImg = ciImg.imageByApplyingTransform(xFormMatrix);
    console.log(xformedImg);
    const uiImg = UIImage.initWithCIImageScaleOrientation(xformedImg, 1, orientation);
    console.log(ciImg, xformedImg, uiImg);
    const ssView = UIImageView(uiImg);
    ssView.frame = { x: 0, y: 0, width: arView.frame.width, height: arView.frame.height };
    return ssView;
  } catch (err) {
    console.log(err);
    return undefined;
  }
}

function toggleRecordScreen(demoVC, recorder) {
  const del = new RPPreviewViewControllerDelegate();
  del.previewControllerDidFinish = (previewController) => {
    console.log('preview controller did finish - uidemos.js toggleRecordScreen()');
    previewController.dismiss(true, () => {
      console.log('preview controller did finish 2 - uidemos.js toggleRecordScreen()');
    });
  };

  if (recorder.isRecording) {
    console.log('stop recording - uidemos.js toggleRecordScreen()');
    recorder.stopRecordingWithHandler((previewController) => {
      console.log('stop recording 2 - uidemos.js toggleRecordScreen()');
      previewController.delegate = del;
      demoVC.present(previewController, true, () => {
        console.log('stop recording 3 - uidemos.js toggleRecordScreen()');
      });
    });
  } else if (recorder.isAvailable) {
    console.log('start recording - uidemos.js toggleRecordScreen()');
    recorder.startRecordingWithHandler(() => {});
  }
}

function makeTopView(demoVC, fieldHeight) {
  const borderView = UIView({ x: 0, y: fieldHeight, width: demoVC.view.frame.width, height: 1 });
  borderView.backgroundColor = {
    ...colors.white,
    alpha: 0.3,
  };

  const topView = UIView({ x: 0, y: 0, width: demoVC.view.frame.width, height: fieldHeight + 1 });
  topView.backgroundColor = {
    ...colors.white,
    alpha: 0.1,
  };

  topView.addSubview(borderView);

  return topView;
}

async function make(nav, demoVC) {
  const recorder = new RPScreenRecorder();
  console.log(recorder);

  view = demoVC.view;
  arView = new ARSKView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
  config = new ARWorldTrackingConfiguration();
  chars = [];
  active = null;

  _remove = (char, removeNode = true, removeAnchor = true) => {
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

  viewDel = new ARSKViewDelegate((view, anchor) => {
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

  scene = SKScene.sceneWithSize({
    width: view.frame.width,
    height: view.frame.height
  });
  arView.scene = scene;

  mat1 = new THREE.Matrix4();
  mat2 = new THREE.Matrix4();

  _xform = (xform) => {
    let worldTransform = (xform ? xform.worldTransform : undefined);
    if (worldTransform) {
      xform = worldTransform;
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

  _text = (txt) => {
    return txt || text || '👀';
  };

  _node = (text) => {
    if (isEffectMode) {
      const wrapper = new SKNode();
      const moveWrapper = new SKNode();
      const magicNode = new SKEmitterNode(magicParticlePath);
      const sparkNode = new SKEmitterNode(sparkParticlePath);
      moveWrapper.addChild(sparkNode);
      moveWrapper.addChild(magicNode);
      wrapper.addChild(moveWrapper);
      return wrapper;
    }

    if (text instanceof UIImage || text instanceof SKTexture) {
      const size = text.size;
      size.width *= scaleSlider.value;
      size.height *= scaleSlider.value;
      const node = new SKSpriteNode(text, size);
      return node;
    } else {
      const node = new SKLabelNode();
      const txt = _text(text);
      const str = txt.substr(0, 500);

      const attrRange = {
        location: 0,
        length: str.length,
      };

      node.numberOfLines = textWrap(str).split('\n').length;
      //node.preferredMaxLayoutWidth = 10;

      const attrTxt = new NSMutableAttributedString(str);
      attrTxt.addAttribute(NSForegroundColorAttributeName, colors.white, attrRange);
      attrTxt.addAttribute(NSFontAttributeName, UIFont('Lato-Bold', 17), attrRange);
      attrTxt.addAttribute(NSStrokeColorAttributeName, colors.black, attrRange);
      attrTxt.addAttribute(NSStrokeWidthAttributeName, -4.0, attrRange);

      node.attributedText = attrTxt;
      return node;
    }
  };

  _update = (xform, txt = text, char = active) => {
    if (!char) {
      char = {};
      chars.push(char);
    }
    if (!char.node) {
      char.node = _node(txt);
    }
    if (typeof txt === "string") {
      char.node.text = _text(txt);
    }
    if (char.anchor) {
      if (!xform) {
        xform = char.anchor.transform;
      }
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
      console.log(active.node.xScale, active.node.yScale,
        active.node.size ? active.node.size.width : -1,
        active.node.size ? active.node.size.height : -1);
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

    if (active && active.node) {
      const kids = active.node.children;

      if (kids.length) {
        const node = kids[0];
        const actionGroup = SKAction.group([
          SKAction.moveBy({ dx: 0, dy: -30 }, 0.6),
          SKAction.scaleBy(-0.4, 0.6),
        ]);
        node.runAction(actionGroup, () => {});
      }
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

  // const btnSize = 70;

  // const camBtn = makeCamBtn(demoVC, btnSize);
  // camBtn.addTarget(() => {
  //   console.log('recording');
  //   //toggleRecordScreen(demoVC, recorder);
  //   // takeScreenshot(demoVC.view);
  //   const imgView = getCapturedImage(arView);
  //   if (imgView) demoVC.view.addSubview(imgView);
  // }, UIControlEvents.touchUpInside);

  const fireBtn = makeParticleButton(demoVC);
  fireBtn.addTarget(() => {
    isEffectMode = !isEffectMode;
    fireBtn.alpha = isEffectMode ? 1 : 0.3;
  }, UIControlEvents.touchUpInside);

  const fieldHeight = 50;
  const horOffset = 24;

  const field = await makeTextField(demoVC, fieldHeight, horOffset, () => {
    text = field.text;
  });

  const topView = makeTopView(demoVC, fieldHeight);
  topView.addSubview(field);
  topView.addSubview(fireBtn);

  const viewW = view.frame.width;
  const scaleSliderY = fieldHeight + 20;
  const sliderHeight = 20;

  const scaleSlider = new UISlider({
      x: horOffset, y: scaleSliderY, width: viewW - (horOffset * 2), height: sliderHeight,
  });
  scaleSlider.value = 0.5;
  scaleSlider.setThumbImage(UIImage.transparent);
  scaleSlider.addTarget(() => {
    console.log('scale slider changed', scaleSlider.value);
    if (active && active.node) {
      active.node.removeFromParent();
      delete active.node;
      _update();
    }
  }, UIControlEvents.valueChanged);

  const distSlider = new UISlider({
    x: horOffset, y: scaleSliderY + sliderHeight, width: viewW - (horOffset * 2), height: sliderHeight,
  });
  distSlider.value = 0.5;
  distSlider.setThumbImage(UIImage.transparent);
  distSlider.addTarget(() => {
    console.log('distance slider changed', distSlider.value);
  }, UIControlEvents.valueChanged);

  const rotSlider = new UISlider({
    x: horOffset, y: scaleSliderY + (sliderHeight * 2), width: viewW - (horOffset * 2), height: sliderHeight,
  });
  rotSlider.value = 0.5;
  rotSlider.setThumbImage(UIImage.transparent);
  rotSlider.addTarget(() => {
    console.log('rotation slider changed', rotSlider.value);
  }, UIControlEvents.valueChanged);

  const subviews = [topView, scaleSlider/*, distSlider, rotSlider, camBtn */];
  subviews.forEach((s) => {
    demoVC.view.addSubview(s);
    demoVC.view.bringSubviewToFront(s);
  });

  arView.viewWillAppear = () => {
    arView.session.run(config);
  }
}

module.exports = make;
