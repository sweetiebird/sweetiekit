const SweetieKit = process._linkedBinding('sweetiekit');

const {
  UIButton,
} = SweetieKit;

// https://medium.com/@nathangitter/building-fluid-interfaces-ios-swift-9732bb934bf5

FluidButton_make = function make(nav, demoVC) {
  const view = demoVC.view;
  const w = view.frame.width;
  const button = UIButton();
  const normalColor = RGB(87, 174, 176);
  const highlightedColor = UIColor.gray;
  view.addSubview(button);
  button.pinToSuperviewWithInsetsEdges(UIEdgeInsetsMake(30, 0, 0, 0), UIRectEdgeTop);
  button.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).isActive = true;
  button.widthAnchor.constraintGreaterThanOrEqualToAnchorConstant(view.widthAnchor, -24).isActive = true;
  button.setTitleForState('👋 Hello Button', UIControlStateNormal);
  let animator = UIViewPropertyAnimator();
  onDown = NSTarget(() => {
    console.log('down');
    animator.stopAnimation(true);
    button.backgroundColor = highlightedColor;
  });
  onUp = NSTarget(() => {
    console.log('up');
    animator = UIViewPropertyAnimator.alloc().initWithDurationCurveAnimations(0.5, UIViewAnimationCurveEaseOut, () => {
      button.backgroundColor = normalColor;
    });
    animator.startAnimation()
  });
  button.addTargetForControlEvents(onDown, onDown.selector, UIControlEventTouchDown | UIControlEventTouchDragEnter);
  button.addTargetForControlEvents(onUp, onUp.selector, UIControlEventTouchUpInside | UIControlEventTouchDragExit | UIControlEventTouchCancel);
  button.backgroundColor = normalColor;
  button.layer.cornerRadius = 4;
  button.layer.shadowRadius = 12;
  button.layer.shadowColor = RGB(87, 174, 176);
  button.layer.shadowOffset = CGSizeMake(0, 12);
};

function make(...args) {
  return FluidButton_make(...args);
}

module.exports = make;
