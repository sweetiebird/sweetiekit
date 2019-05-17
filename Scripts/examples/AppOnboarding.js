const SweetieKit = require('std:sweetiekit.node');
const colors = require('./colors');

const {
  UIScrollView,
  UIView,
  UILabel,
  UIPageControl,
  UIScrollViewDelegate,
} = SweetieKit;

let scrollView;

const bgColors = [
  colors.fitbodDarkGrey,
  colors.fitbodMedGrey,
  colors.fitbodDarkGrey,
  colors.fitbodMedGrey,
];

function makeDelegate(demoVC, pageControl) {
  const del = new UIScrollViewDelegate();
  del.didScroll = (sv) => {
    const { x } = sv.contentOffset;
    pageControl.currentPage = Math.round(x / demoVC.view.frame.width);
  };
  scrollView.delegate = del;
}

async function make(nav, demoVC) {
  const numSlides = 4;

  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const viewH = h - 84;

  scrollView = new UIScrollView();
  scrollView.contentSize = { width: w * numSlides, height: viewH };
  scrollView.isPagingEnabled = true;
  scrollView.translatesAutoresizingMaskIntoConstraints = false;

  demoVC.view.addSubview(scrollView);

  scrollView.leadingAnchor.constraintEqualToAnchor(demoVC.view.leadingAnchor, 0).isActive = true;
  scrollView.trailingAnchor.constraintEqualToAnchor(demoVC.view.trailingAnchor, 0).isActive = true;
  scrollView.topAnchor.constraintEqualToAnchor(demoVC.view.topAnchor, 0).isActive = true;
  scrollView.bottomAnchor.constraintEqualToAnchor(demoVC.view.bottomAnchor, 0).isActive = true;

  for (let i = 0; i < numSlides; i++) {
    const slideView = new UIView({ x: w * i, y: 0, width: w, height: viewH });
    slideView.backgroundColor = bgColors[i];
    const label = new UILabel();
    label.text = `Label ${i + 1}`;
    label.sizeToFit();
    scrollView.addSubview(slideView);
    slideView.addSubview(label);
  }

  const pageControl = new UIPageControl({ x: 12, y: h - 200, width: w - 24, height: 60 });
  pageControl.numberOfPages = numSlides;
  pageControl.currentPage = 0;
  pageControl.currentPageIndicatorTintColor = colors.fitbodPink;
  pageControl.pageIndicatorTintColor = {
    ...colors.fitbodPink,
    alpha: 0.5,
  };
  pageControl.addTarget(() => {
    console.log(pageControl.currentPage);
  });

  makeDelegate(demoVC, pageControl);

  demoVC.view.addSubview(pageControl);
  nav.pushViewController(demoVC);
}

module.exports = make;
