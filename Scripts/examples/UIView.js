const SweetieKit = process._linkedBinding('sweetiekit');

const {
  CAGradientLayer,
  UIBezierPath,
  UIView,
  UITapGestureRecognizer,
  UIPanGestureRecognizer,
} = SweetieKit;

global.exampleUIViewAnimate = (rect = {x: 300}, view = fgView) => {
  //console.log('UIView.animate');
  const frame = view.frame;
  Object.assign(frame, rect);
  view.frame = frame;
};

global.exampleAnimate = (animate = global.exampleUIViewAnimate, completion = () => {}) => {
  UIView.animateWithDurationDelayUsingSpringWithDampingInitialSpringVelocityOptionsAnimationsCompletion(
    duration, delay, dampingRatio, velocity,
    UIViewAnimationOptionBeginFromCurrentState,
    () => {
      animate();
    },
    () => {
      completion();
    }
  );
};

global.exampleAnimateTo = (rect, view) => {
  exampleAnimate(() => {
    exampleUIViewAnimate(rect, view);
  });
};

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  bgFrame = { x: 0, y: 0, width: w, height: h };
  fgFrame = { x: 40, y: 80, width: bgFrame.width - 80, height: bgFrame.width - 80 };
  ggFrame = { ...fgFrame };
  ggFrame.y += fgFrame.height + 10;
  bgView = global.bgView = UIView(bgFrame);
  fgView = global.fgView = UIView(fgFrame);
  blurEffect = UIBlurEffect.effectWithStyle(UIBlurEffectStyleRegular);
  ggView = global.ggView = UIVisualEffectView.alloc().initWithEffect(blurEffect);
  ggView.frame = ggFrame;
  ggView.width *= 1.2;
  ggView.height *= 1.2;
  bgView.backgroundColor = RGB(221, 105, 28);
  fgView.backgroundColor = RGB(205, 37, 83);
  ggView.backgroundColor = RGB(83, 37, 205, 0.2);
  fgView.layer.masksToBounds = true; fgView.layer.cornerRadius = 20;
  ggView.layer.masksToBounds = true; ggView.layer.cornerRadius = 20;
  bgView.addSubview(fgView);
  bgView.addSubview(ggView);

  imView = (typeof imView === 'undefined') ? UIImageView(UIImage('nic')) : imView;
  imView.bounds = fgView.bounds;
  imView.removeFromSuperview();
  fgView.addSubview(imView);

  // https://stackoverflow.com/questions/23074539/programmatically-create-a-uiview-with-color-gradient
  global.gradient = CAGradientLayer();
  gradient.frame = fgView.bounds;
  gradient.colors = [
    RGB(73, 236, 187),
    RGB(77, 188, 250),
  ];
  fgView.layer.insertSublayerAtIndex(gradient, 0);

  // https://www.hackingwithswift.com/articles/155/advanced-uiview-shadow-effects-using-shadowpath
  const width = fgView.width;
  const height = fgView.height;
  const shadowSize = {width: width*1.05, height: 0.1*height};
  const shadowDistance = 0;
  const contactRect = {
    x: shadowSize.width,
    y: height + (shadowSize.height * 0.4) + shadowDistance,
    width: width - shadowSize.width * 2,
    height: shadowSize.height
  };
  fgView.layer.shadowPath = UIBezierPath.bezierPathWithOvalInRect(contactRect);
  fgView.layer.shadowRadius = 8;
  fgView.layer.shadowOpacity = 0.4;

  // animation

  if (typeof duration === 'undefined') {
    duration = 2;
    dampingRatio = 0.25;
    delay = 0;
    velocity = 0;
  }

  if (typeof tension === 'undefined') {
    tension = 54.83363359078326;
    friction = 3.702486785620688;

    animation = CASpringAnimation();
    animation.keyPath = 'position.x';

    animation.fromValue = 0 + ggView.center.x;
    toValue = 300 + ggView.center.x;
    animation.toValue = 300 + ggView.center.x;

    animation.stiffness = tension;
    animation.damping = friction;

    animation.mass = 1;
    animation.initialVelocity = 0;
    animation.duration = animation.settlingDuration;
  }
  animation.beginTime = CACurrentMediaTime() + delay;

  /*
  CATransaction.setCompletionBlock(() => {
    const pos = ggView.layer.position;
    console.log('CATransaction.setCompletionBlock', pos);
    if (pos) {
      pos.x = toValue;
      ggView.layer.position = pos;
    }
  });

  ggView.layer.addAnimationForKey(animation);
  CATransaction.commit();
  */

  // gesture recognizers

  const fgTap = UITapGestureRecognizer();
  fgTap.addTarget(() => {
    console.log('tap!', fgTap.locationOfTouchInView(0, fgView));
  });
  fgView.addGestureRecognizer(fgTap);

  const bgTap = UITapGestureRecognizer();
  bgTap.addTarget(() => {
    const pt = bgTap.locationOfTouchInView(0, bgView);
    console.log('bgTap!', pt);
    exampleAnimateTo(pt, fgView);
  });
  bgView.addGestureRecognizer(bgTap);

  const bgPan = UIPanGestureRecognizer();
  bgPan.addTarget(() => {
    //console.log('pan!');
    //console.log(bgPan.translationInView(bgView));
    //console.log(bgPan.velocityInView(bgView));
  });
  bgView.addGestureRecognizer(bgPan);

  const fgPan = UIPanGestureRecognizer();
  fgPan.addTarget(() => {
    const translation = fgPan.translationInView(fgView);
    const frame = fgView.frame;
    console.log('fgPan', translation, frame);
    frame.x += translation.x;
    frame.y += translation.y;
    exampleAnimateTo(frame, fgView);
    //fgView.frame = frame;
    fgPan.setTranslationInView(CGPointMake(0, 0), fgView);
  });
  fgView.addGestureRecognizer(fgPan);

  const ggPan = UIPanGestureRecognizer();
  ggPan.addTarget(() => {
    const translation = ggPan.translationInView(ggView);
    const frame = ggView.frame;
    console.log('ggPan', translation, frame);
    frame.x += translation.x;
    frame.y += translation.y;
    exampleAnimateTo(frame, ggView);
    //ggView.frame = frame;
    ggPan.setTranslationInView(CGPointMake(0, 0), ggView);
  });
  ggView.addGestureRecognizer(ggPan);

  return bgView;
}

module.exports = make;
