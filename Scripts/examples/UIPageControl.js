const SweetieKit = require('std:sweetiekit.node');

const {
  UIScrollView,
  UIView,
  UILabel,
  UIPageControl,
  UIScrollViewDelegate,
} = SweetieKit;

let scrollView;

const colors = [
  { red: 0, green: 174/255, blue: 174/255 },
  { red: 205/255, green: 37/255, blue: 83/255 },
  { red: 0, green: 174/255, blue: 174/255 },
  { red: 205/255, green: 37/255, blue: 83/255 },
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
  scrollView.bottomAnchor.constraintEqualToAnchor(demoVC.view.bottomAnchor, -84).isActive = true;

  for (let i = 0; i < numSlides; i++) {
    const slideView = UIView({ x: w * i, y: 0, width: w, height: viewH });
    slideView.backgroundColor = colors[i];
    const label = UILabel();
    label.text = `Label ${i + 1}`;
    label.sizeToFit();
    scrollView.addSubview(slideView);
    slideView.addSubview(label);
  }

  const pageControl = new UIPageControl({ x: 12, y: viewH - 140, width: w - 24, height: 60 });
  pageControl.numberOfPages = numSlides;
  pageControl.currentPage = 0;
  pageControl.currentPageIndicatorTintColor = { red: 1, green: 0, blue: 1, alpha: 1 };
  pageControl.pageIndicatorTintColor = { red: 1, green: 1, blue: 1, alpha: 1 };

  makeDelegate(demoVC, pageControl);

  return pageControl;
}

module.exports = make;
