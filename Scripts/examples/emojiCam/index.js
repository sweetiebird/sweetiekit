const SweetieKit = require('std:sweetiekit.node');

THREE = require('../../vendor/three/three');

const colors = require('../colors');

const {
  ARSKView,
  ARSKViewDelegate,
  ARWorldTrackingConfiguration,
  SKLabelNode,
  SKScene,
  ARAnchor,
  UITextField,
  UITextFieldDelegate,
  UIApplication,
  UIButton,
  UIImage,
  NSMutableAttributedString,
  UIFont,
  UIView,
  UISlider,
  UIStoryboard,
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

function emojiCam(nav) {
  let manualTrackMsgHide = false;

  const vcId = 'emojicamVC';
  const intoVcId = 'introVC';
  const closeBtnTag = 'closeBtnTag';
  const topViewTag = 'topViewTag';
  const hideTrackingBtnTag = 'hideTrackingBtnTag';
  const trackingViewTag = 'trackingViewTag';
  const trackingLabelTag = 'trackingLabelTag';

  const sb = UIStoryboard.storyboardWithNameBundle('Main');
  const demoVC = sb.instantiateViewControllerWithIdentifier(vcId);
  const introVC = sb.instantiateViewControllerWithIdentifier(intoVcId);
  const menuButton = demoVC.view.viewWithTag(1);
  const sbTopView = demoVC.view.viewWithStringTag(topViewTag);
  const sbTextField = sbTopView.viewWithTag(2);

  const trackingMsgView = demoVC.view.viewWithStringTag(trackingViewTag);
  const hideTrackingMsgBtn = demoVC.view.viewWithStringTag(hideTrackingBtnTag);
  const trackingLabel = trackingMsgView.viewWithStringTag(trackingLabelTag);

  function toggleTrackingMsgView(showMessage = false) {
    if (showMessage) {
      trackingMsgView.hidden = false;
      sbTopView.hidden = true;
      if (scaleSlider) scaleSlider.hidden = true;
    }

    UIView.animateWithDurationAnimationsCompletion(0.2, () => {
      trackingMsgView.alpha = showMessage ? 1 : 0;
    }, () => {
      if (!showMessage) {
        trackingMsgView.hidden = true;
        sbTopView.hidden = false;
        if (scaleSlider) scaleSlider.hidden = false;
      }
    });
  }

  hideTrackingMsgBtn.addTargetActionForControlEvents(() => {
    toggleTrackingMsgView(false);
    }, UIControlEventTouchUpInside);
  //let text = '👀';
  let text = SKTexture(UIImage('nic'));
  UIImage.transparent = UIImage.transparent || UIImage('transparent');

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

  // function makeCamBtn(demoVC, btnSize) {
  //   const camBtn = UIButton(CGRectMake(
  //     (demoVC.view.frame.width - btnSize) / 2,
  //     demoVC.view.frame.height - (124 + btnSize),
  //     btnSize,
  //     btnSize
  //   ));
  //   camBtn.layer.cornerRadius = btnSize / 2;
  //   camBtn.layer.shadowOpacity = 1;
  //   camBtn.layer.shadowOffset = { width: 0, height: 4 };
  //   camBtn.layer.shadowColor = colors.fitbodDarkGrey;
  //   camBtn.layer.shadowRadius = 6;
  //   camBtn.showsTouchWhenHighlighted = true;
  //   camBtn.setBackgroundImageForState(UIImage('camera_btn_thin'), UIControlStateNormal);
  //   return camBtn;
  // }

  const trackViewGradient = CAGradientLayer();
  trackViewGradient.frame = demoVC.view.bounds;
  trackViewGradient.colors = [
    { ...colors.white, alpha: 0.4 },
    { ...colors.white, alpha: 0.4 },
    { ...colors.white, alpha: 0.4 },
    { ...colors.white, alpha: 0.75 },
    { ...colors.white, alpha: 1 },
  ];
  trackingMsgView.layer.insertSublayerAtIndex(trackViewGradient, 0);

  trackingLabel.text = 'Establishing tracking';
  // const attrText = NSMutableAttributedString('Establishing tracking');
  // attrText.addAttribute(NSStrokeWidthAttributeName, 1, {
  //   location: 0,
  //   length: attrText.length,
  // });
  // attrText.addAttribute(NSStrokeColorAttributeName, colors.black, {
  //   location: 0,
  //   length: attrText.length,
  // });
  // attrText.addAttribute(NSForegroundColorAttributeName, colors.white, {
  //   location: 0,
  //   length: placeholderText.length,
  // });
  // trackingLabel.attributedText = attrText;

  function makeTextField(demoVC, fieldHeight, horOffset, callback) {
    const frame = CGRectMake(
      horOffset,
      0,
      demoVC.view.frame.width - (horOffset * 2),
      fieldHeight);

    const field = UITextField.initNewWithFrameCallback(frame, callback);
    field.textColor = {
      ...colors.white,
      alpha: 0.8,
    };
    field.backgroundColor = colors.clear;

    const placeholderText = 'Enter some text...';
    const placeholderFont = UIFont('Lato-Bold', 17);

    const attrPlaceholder = NSMutableAttributedString(placeholderText);

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
    field.autocorrectionType = UITextAutocorrectionTypeNo;
    field.spellCheckingType = UITextSpellCheckingTypeNo;

    return field;
  }

  function makeParticleButton(demoVC) {
    const size = 40;
    const btn = UIButton(CGRectMake(demoVC.view.frame.width - size, 0, size, size));
    btn.backgroundColor = colors.clear;
    btn.setBackgroundImageForState(UIImage('fire'), UIControlStateNormal);
    btn.showsTouchWhenHighlighted = true;
    btn.contentMode = UIViewContentModeScaleAspectFit;
    btn.alpha = 0.3;
    return btn;
  }

  // function takeScreenshot(view) {
  //   const w = view.frame.width;
  //   const h = view.frame.height;
  //
  //   try {
  //     CoreGraphics.UIGraphicsBeginImageContextWithOptions(
  //       { width: w, height: h },
  //       true,
  //       0.0,
  //     );
  //
  //     view.layer.renderInContext();
  //
  //     const img = CoreGraphics.UIGraphicsGetImageFromCurrentImageContext();
  //
  //     if (img) {
  //       const ssFrame = { x: 0, y: 0, width: w * 0.4, height: h * 0.4 };
  //       const ssView = UIImageView(img);
  //       ssView.frame = ssFrame;
  //       ssView.layer.borderWidth = 1;
  //       ssView.layer.borderColor = UIColor.white;
  //       view.addSubview(ssView);
  //       view.bringSubviewToFront(ssView);
  //
  //       // ==========
  //       // recalls UIApplicationMain and crashes?
  //       // ==========
  //
  //       console.log('Writing UIImage');
  //       UIKit.UIImageWriteToSavedPhotosAlbum(img, () => {
  //         console.log('written!');
  //       });
  //     }
  //   } finally {
  //     CoreGraphics.UIGraphicsEndImageContext();
  //   }
  // }
  //
  // function getCapturedImage(arView) {
  //   try {
  //     const orientation = (new UIApplication()).statusBarOrientation;
  //     const size = { width: arView.frame.width, height: arView.frame.height };
  //     const xform = arView.session.currentFrame.displayTransform(orientation, size);
  //     const xFormMatrix = new THREE.Matrix3().fromArray(xform);
  //     const matrix = new THREE.Matrix3().rotate(90);
  //     xFormMatrix.multiply(matrix);
  //     const ciImg = arView.session.currentFrame.capturedImage;
  //     const xformedImg = ciImg.imageByApplyingTransform(xFormMatrix);
  //     console.log(xformedImg);
  //     const uiImg = UIImage.alloc().initWithCIImageScaleOrientation(xformedImg, 1, orientation);
  //     console.log(ciImg, xformedImg, uiImg);
  //     const ssView = UIImageView(uiImg);
  //     ssView.frame = { x: 0, y: 0, width: arView.frame.width, height: arView.frame.height };
  //     return ssView;
  //   } catch (err) {
  //     console.log(err);
  //     return undefined;
  //   }
  // }
  //
  // function toggleRecordScreen(demoVC, recorder) {
  //   const del = new RPPreviewViewControllerDelegate();
  //   del.previewControllerDidFinish = (previewController) => {
  //     console.log('preview controller did finish - uidemos.js toggleRecordScreen()');
  //     previewController.dismissViewControllerAnimatedCompletion(true, () => {
  //       console.log('preview controller did finish 2 - uidemos.js toggleRecordScreen()');
  //     });
  //   };
  //
  //   if (recorder.isRecording) {
  //     console.log('stop recording - uidemos.js toggleRecordScreen()');
  //     recorder.stopRecordingWithHandler((previewController) => {
  //       console.log('stop recording 2 - uidemos.js toggleRecordScreen()');
  //       previewController.delegate = del;
  //       demoVC.presentViewControllerAnimatedCompletion(previewController, true, () => {
  //         console.log('stop recording 3 - uidemos.js toggleRecordScreen()');
  //       });
  //     });
  //   } else if (recorder.isAvailable) {
  //     console.log('start recording - uidemos.js toggleRecordScreen()');
  //     recorder.startRecordingWithHandler(() => {});
  //   }
  // }

  function makeTopView(demoVC, fieldHeight) {
    const borderView = UIView({ x: 0, y: fieldHeight, width: demoVC.view.frame.width, height: 1 });
    borderView.backgroundColor = {
      ...colors.white,
      alpha: 0.3,
    };

    const topView = UIView({ x: 0, y: (fieldHeight * 1.5), width: demoVC.view.frame.width, height: fieldHeight + 1 });
    topView.backgroundColor = {
      ...colors.white,
      alpha: 0.1,
    };

    topView.addSubview(borderView);

    return topView;
  }

  async function make(nav, demoVC) {
    // const recorder = new RPScreenRecorder();
    // console.log(recorder);

    view = demoVC.view;
    arView = ARSKView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
    config = ARWorldTrackingConfiguration();

    chars = [];
    active = null;

    _remove = (char, removeNode = true, removeAnchor = true) => {
      if (!char) {
        return true;
      }

      const session = arView.session;

      if (!session) {
        throw new Error('no arView session');
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

    arView.delegate = ARSKViewDelegate({
      viewNodeForAnchor(view, anchor) {
        if (active && active.anchor && active.anchor.identifier.UUIDString === anchor.identifier.UUIDString) {
          if (!active.node) {
            throw new Error("expected node");
          }
          return active.node;
        }
        for (let i = chars.length - 1; i >= 0; i--) {
          let char = chars[i];
          if (char.anchor.identifier.UUIDString === anchor.identifier.UUIDString) {
            if (!char.node) {
              throw new Error("expected node");
            }
            return char.node;
          }
        }
        //throw new Error("couldn't find node for anchor " + anchor.identifier.UUIDString);
      }
    });

    scene = SKScene.sceneWithSize({
      width: view.frame.width,
      height: view.frame.height
    });

    trackingInterval = setInterval(() => {
      if (arView.session) {
        const { currentFrame } = arView.session;

        if (currentFrame) {
          const { trackingState, trackingStateReason } = currentFrame.camera;
          if (trackingState === ARTrackingStateNotAvailable) {
            console.log('tracking state: not available');
          } else if (trackingState === ARTrackingStateLimited) {
            console.log('tracking state: limited');
            toggleTrackingMsgView(true);
            console.log(trackingMsgView);
            // if (!manualTrackMsgHide) {
            //   toggleTrackingMsgView(true);
            // }
          } else if (trackingState === ARTrackingStateNormal) {
            console.log('tracking state: normal');
            toggleTrackingMsgView(false);
          }
        }
      }
    }, 3500);

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
        const wrapper = SKNode();
        const moveWrapper = SKNode();
        const magicNode = SKEmitterNode(magicParticlePath);
        const sparkNode = SKEmitterNode(sparkParticlePath);
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
        const node = SKLabelNode();
        const txt = _text(text);
        const str = txt.substr(0, 500);

        const attrRange = {
          location: 0,
          length: str.length,
        };

        node.numberOfLines = textWrap(str).split('\n').length;
        //node.preferredMaxLayoutWidth = 10;

        const attrTxt = NSMutableAttributedString(str);
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
      if (typeof txt === 'string') {
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
      char.anchor = ARAnchor().initWithTransform(xform);
      arView.session.add(char.anchor);
      return char;
    };

    scene.touchesBeganWithEvent = (touches, evt) => {
      touches = Array.from(touches);
      let touch = touches[0];
      let pt = touches[0].locationInView(touch.view);
      pt.y -= Math.trunc(0.1*touch.view.height);
      let hits = arView.hitTestTypes(pt, 1);
      console.log('touchesBeganWithEvent', touches.length, pt);
      if (hits && hits.length > 0) {
        active = _update(hits ? hits[0] : null);
      }
    };

    scene.touchesMovedWithEvent = (touches, evt) => {
      touches = Array.from(touches);
      let touch = touches[0];
      let pt = touches[0].locationInView(touch.view);
      pt.y -= Math.trunc(0.1*touch.view.height);
      let hits = arView.hitTestTypes(pt, 1);
      //console.log('touchesMovedWithEvent', touches.length, pt);
      if (hits && hits.length > 0) {
        active = _update(hits ? hits[0] : null);
        console.log(active.node.xScale, active.node.yScale,
          active.node.size ? active.node.size.width : -1,
          active.node.size ? active.node.size.height : -1);
      }
    };

    scene.touchesEndedWithEvent = (touches, evt) => {
      touches = Array.from(touches);
      let touch = touches[0];
      let pt = touches[0].locationInView(touch.view);
      pt.y -= Math.trunc(0.1*touch.view.height);
      let hits = arView.hitTestTypes(pt, 1);
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
    arView.pinToSuperview();
    // nav.pushViewControllerAnimated(demoVC, true);
    new UIApplication()
      .keyWindow
      .rootViewController
      .viewControllers[0]
      .presentViewControllerAnimatedCompletion(demoVC, true, () => {});

    arView.presentScene(scene);

    // const btnSize = 70;

    // const camBtn = makeCamBtn(demoVC, btnSize);
    // camBtn.addTargetActionForControlEvents(() => {
    //   console.log('recording');
    //   //toggleRecordScreen(demoVC, recorder);
    //   // takeScreenshot(demoVC.view);
    //   const imgView = getCapturedImage(arView);
    //   if (imgView) demoVC.view.addSubview(imgView);
    // }, UIControlEventTouchUpInside);

    const fireBtn = makeParticleButton(demoVC);
    fireBtn.addTargetActionForControlEvents(() => {
      isEffectMode = !isEffectMode;
      fireBtn.alpha = isEffectMode ? 1 : 0.3;
    }, UIControlEventTouchUpInside);

    const fieldHeight = 50;
    const horOffset = 24;

    sbTextField.addTargetActionForControlEvents(() => {
      text = sbTextField.text;
    }, UIControlEventAllEditingEvents);
    const fieldDel = new UITextFieldDelegate({
      textFieldShouldReturn: () => true,
    });
    sbTextField.delegate = fieldDel;

    const placeholderText = 'Enter some text';
    const attrPlaceholder = NSMutableAttributedString(placeholderText);

    attrPlaceholder.addAttribute(NSForegroundColorAttributeName, colors.white, {
      location: 0,
      length: placeholderText.length,
    });
    attrPlaceholder.addAttribute(NSKernAttributeName, 1.1, {
      location: 0,
      length: placeholderText.length,
    });
    sbTextField.attributedPlaceholder = attrPlaceholder;
    // const field = makeTextField(demoVC, fieldHeight, horOffset, () => {
    //   text = field.text;
    // });

    // const topView = makeTopView(demoVC, fieldHeight);
    // demoVC.view.addSubview(topView);
    /*
    topView.pinToSuperviewWithInsetsEdges(
      UIEdgeInsetsMake(0, 0, 0, 0),
      UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeRight);
      */

    // topView.addSubview(field);
    /*
    field.pinToSuperviewWithInsetsEdges(
      UIEdgeInsetsMake(0, 0, 0, fireBtn.width),
      UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight);
      */

    // topView.addSubview(fireBtn);
    /*
    fireBtn.pinToSuperviewWithInsetsEdges(
      UIEdgeInsetsMake(0, field.width, 0, 0),
      UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight);
      */

    // noinspection JSSuspiciousNameCombination
    // const closeBtn = UIButton({ x: 0, y: fieldHeight * 0.5, width: fieldHeight, height: fieldHeight });
    // closeBtn.setTitleForState('x', UIControlStateNormal);
    // closeBtn.setTitleColorForState(colors.white, UIControlStateNormal);
    // closeBtn.backgroundColor = colors.clear;
    // closeBtn.addTargetActionForControlEvents(() => {
    //   demoVC.dismissViewControllerAnimatedCompletion(true, () => {});
    // }, UIControlEventTouchUpInside);
    // closeBtn.alpha = 0.6;
    // demoVC.view.addSubview(closeBtn);

    const viewW = view.frame.width;
    const scaleSliderY = (fieldHeight * 2) + 40;
    const sliderHeight = 20;

    scaleSlider = UISlider({
      x: horOffset, y: scaleSliderY, width: viewW - (horOffset * 2), height: sliderHeight,
    });
    demoVC.view.addSubview(scaleSlider);
    /*
    scaleSlider.pinToSuperviewWithInsetsEdges(
      UIEdgeInsetsMake(scaleSliderY, 0, 0, 0),
      UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeRight);
      */
    scaleSlider.value = 0.25;
    scaleSlider.setThumbImageForState(UIImage.transparent, UIControlStateNormal);
    scaleSlider.addTargetActionForControlEvents(() => {
      console.log('scale slider changed', scaleSlider.value);
      if (active && active.node) {
        active.node.removeFromParent();
        delete active.node;
        _update();
      }
    }, UIControlEventValueChanged);

    const distSlider = UISlider({
      x: horOffset, y: scaleSliderY + sliderHeight, width: viewW - (horOffset * 2), height: sliderHeight,
    });
    distSlider.value = 0.5;
    distSlider.setThumbImageForState(UIImage.transparent, UIControlStateNormal);
    distSlider.addTargetActionForControlEvents(() => {
      console.log('distance slider changed', distSlider.value);
    }, UIControlEventValueChanged);

    const rotSlider = UISlider({
      x: horOffset, y: scaleSliderY + (sliderHeight * 2), width: viewW - (horOffset * 2), height: sliderHeight,
    });
    rotSlider.value = 0.5;
    rotSlider.setThumbImageForState(UIImage.transparent, UIControlStateNormal);
    rotSlider.addTargetActionForControlEvents(() => {
      console.log('rotation slider changed', rotSlider.value);
    }, UIControlEventValueChanged);

    menuButton.layer.cornerRadius = menuButton.frame.height / 2;
    const subviews = [scaleSlider, sbTopView, menuButton, trackingMsgView]; /*, distSlider, rotSlider, camBtn */
    subviews.forEach((s) => {
      //demoVC.view.addSubview(s);
      demoVC.view.bringSubviewToFront(s);
    });

    arView.viewWillAppear = () => {
      arView.session.run(config);
    };

    arView.configure = () => {
      if (arView.size.width !== arView.scene.size.width ||
        arView.size.height !== arView.scene.size.height) {
        console.log('arView.configure');
        arView.scene.size = arView.size;
      }
    };

    arView.configureInterval = setInterval(() => {
      arView.configure();
    }, 1000);
  }

  make(nav, demoVC);
}

module.exports = emojiCam;
