const SweetieKit = require('std:sweetiekit.node');

const {
  UIScrollView,
} = SweetieKit;

async function make(view) {
  const scrollView = new UIScrollView();
  view.addSubview(scrollView);
  scrollView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, 0).isActive = true;
  scrollView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, 0).isActive = true;
  scrollView.topAnchor.constraintEqualToAnchor(view.topAnchor, 0).isActive = true;
  scrollView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, 0).isActive = true;
  return scrollView;
}

module.exports = make;
