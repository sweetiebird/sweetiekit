const SweetieKit = process._linkedBinding('sweetiekit');

THREE = require('../../vendor/three/three');

const colors = require('../colors');

const {
  ARSKView,
  ARSKViewDelegate,
  ARWorldTrackingConfiguration,
  SKLabelNode,
  SKScene,
  ARAnchor,
  UITextFieldDelegate,
  UIApplication,
  UIButton,
  UIImage,
  NSMutableAttributedString,
  UIFont,
  UIView,
  UISlider,
  UIStoryboard,
  SKTexture,
  SKSpriteNode,
  SKEmitterNode,
  SKNode,
  SKAction,
  UIPopoverPresentationControllerDelegate,
  UITableViewController,
  UITableViewDataSource,
  UITableViewDelegate,
} = SweetieKit;

function emojiCam(nav) {
  const nicTexture = SKTexture(UIImage('nic'));
  let isEffectMode = false;
  let text = nicTexture;

  const vcId = 'emojicamVC';
  const topViewTag = 'topViewTag';
  const hideTrackingBtnTag = 'hideTrackingBtnTag';
  const trackingViewTag = 'trackingViewTag';
  const trackingLabelTag = 'trackingLabelTag';
  const effectBtnTag = 'effectBtnTag';

  const sb = UIStoryboard.storyboardWithNameBundle('Main');
  const demoVC = sb.instantiateViewControllerWithIdentifier(vcId);
  const menuButton = demoVC.view.viewWithTag(1);
  const effectButton = demoVC.view.viewWithStringTag(effectBtnTag);
  const sbTopView = demoVC.view.viewWithStringTag(topViewTag);
  const sbTextField = sbTopView.viewWithTag(2);

  const trackingMsgView = demoVC.view.viewWithStringTag(trackingViewTag);
  const hideTrackingMsgBtn = demoVC.view.viewWithStringTag(hideTrackingBtnTag);
  const trackingLabel = trackingMsgView.viewWithStringTag(trackingLabelTag);

  const menuOptions = [];

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

  effectButton.backgroundColor = colors.fitbodLightGrey;
  effectButton.addTargetActionForControlEvents(() => {
    isEffectMode = !isEffectMode;
    if (isEffectMode) {
      effectButton.backgroundColor = colors.purple;
    } else {
      effectButton.backgroundColor = colors.fitbodLightGrey;
    }
  }, UIControlEventTouchUpInside);

  UIImage.transparent = UIImage.transparent || UIImage('transparent');

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

  function onMenuItemSelect(tv, { row }) {
    console.log('menu item selected', row);
  }

  function popoverMenu() {
    const tableVC = UITableViewController();

    tableVC.tableView.delegate = UITableViewDelegate({
      tableViewDidSelectRowAtIndexPath: onMenuItemSelect,
    });

    tableVC.tableView.dataSource = UITableViewDataSource({
      tableViewNumberOfRowsInSection: () => menuOptions.length,
      tableViewCellForRowAtIndexPath: (tableView, { section, row }) => {
        const cell = UITableViewCell.alloc().initWithStyleReuseIdentifier(UITableViewCellStyleDefault,
          `EmojiCamMenuTableViewController_${tableVC.selfAddress}_${section},${row}`);
        try {
          let choice = menuOptions[row];
          if (typeof choice === 'function') {
            choice = choice(row);
          }
          if (choice != null) {
            if (typeof choice === 'object') {
              let { text: choiceText, backgroundColor } = choice;
              if (!text) {
                text = '';
              }
              cell.textLabel.text = text;
              if (backgroundColor) {
                cell.contentView.backgroundColor = backgroundColor;
              }
            }
          }
        } catch (err) {
          console.warn(err.stack);
        }
        return cell;
      },
    });
  }

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

  async function make(nav, demoVC) {
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
          const { trackingState } = currentFrame.camera;
          if (trackingState === ARTrackingStateLimited) {
            toggleTrackingMsgView(true);
          } else if (trackingState === ARTrackingStateNormal) {
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
            SKAction.moveByDuration({ dx: 0, dy: -30 }, 0.6),
            SKAction.scaleByDuration(-0.4, 0.6),
          ]);
          node.runAction(actionGroup, () => {});
        }
      }

      active = null;
    };

    demoVC.view.addSubview(arView);
    arView.pinToSuperview();

    new UIApplication()
      .keyWindow
      .rootViewController
      .viewControllers[0]
      .presentViewControllerAnimatedCompletion(demoVC, true, () => {});

    arView.presentScene(scene);

    const fireBtn = makeParticleButton(demoVC);
    fireBtn.addTargetActionForControlEvents(() => {
      isEffectMode = !isEffectMode;
      fireBtn.alpha = isEffectMode ? 1 : 0.3;
    }, UIControlEventTouchUpInside);

    const fieldHeight = 50;
    const horOffset = 24;

    sbTextField.addTargetActionForControlEvents(() => {
      if (!sbTextField.text || !sbTextField.text.length) {
        text = nicTexture;
      } else {
        text = sbTextField.text;
      }
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

    const viewW = view.frame.width;
    const scaleSliderY = (fieldHeight * 2) + 40;
    const sliderHeight = 20;

    scaleSlider = UISlider({
      x: horOffset, y: scaleSliderY, width: viewW - (horOffset * 2), height: sliderHeight,
    });
    // demoVC.view.addSubview(scaleSlider);

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
    effectButton.layer.cornerRadius = menuButton.frame.height / 2;

    const subviews = [sbTopView, menuButton, effectButton, trackingMsgView]; /*, distSlider, rotSlider, camBtn */
    subviews.forEach((s) => {
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
