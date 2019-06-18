const SweetieKit = require('std:sweetiekit.node');
const colors = require('./colors');

const {
  UIProgressView,
  UIScrollView,
  UIView,
  UILabel,
  UIPageControl,
  UIScrollViewDelegate,
  UIImage,
  UIImageView,
  UIFont,
  NSMutableParagraphStyle,
  NSMutableAttributedString,
  UIButton,
  UIViewController,
  UIBarButtonItem,
} = SweetieKit;

let scrollView;
let quizVC;
let w;
let h;
let viewH;
let nav;
let demoVC;
let progressView;
let quizScroll;

const bgColors = [
  colors.fitbodDarkGrey,
  colors.fitbodMedGrey,
  colors.fitbodDarkGrey,
  colors.fitbodMedGrey,
];

const numSlides = 4;
const numQuizSlides = 4;

const quizImages = [];
const quizTitles = [];
const quizOptions = [];

const iconImages = [
  'heart',
  'fire',
  'star',
  'plane',
];

const titles = [
  'Mustache Neutra',
  'Hexagon Unicorn',
  'Flannel Ennui',
  'Swag Hammock',
];

const titleFont = UIFont('Lato-Bold', 22);
const contentFont = UIFont('Lato-Bold', 16);
const buttonFont = UIFont('Lato-Bold', 17);
const pStyle = new NSMutableParagraphStyle();
pStyle.lineSpacing = 10;

const contentTexts = [
  'IPhone XOXO flexitarian meditation brooklyn sustainable pinterest. Before they sold out vape everyday carry YOLO. Lyft listicle kitsch pop-up try-hard.',
  'You probably haven\'t heard of them tousled celiac, tofu hoodie cred tote bag polaroid pok pok master cleanse godard mustache lomo.',
  'Mustache snackwave raw denim cred lo-fi pop-up art party coloring book. Unicorn truffaut paleo selfies health goth. Iceland woke aesthetic kombucha.',
  'Tbh narwhal tote bag street art put a bird on it normcore, before they sold out artisan edison bulb sriracha salvia forage 3 wolf moon unicorn vice.',
];

function setupQuizButton() {
  const nextBtn = UIButton(CGRectMake(20, viewH - 100, w - 40, 50));
  nextBtn.layer.cornerRadius = 25;
  nextBtn.layer.shadowOffset = CGSizeMake(0, 12);
  nextBtn.layer.shadowColor = RGB(85, 85, 85);
  nextBtn.layer.shadowOpacity = 0.2;
  nextBtn.layer.shadowRadius = 8;
  nextBtn.layer.maskToBounds = false;
  nextBtn.backgroundColor = colors.fitbodPink;
  nextBtn.setTitleForState('GET STARTED', UIControlStateNormal);
  nextBtn.setTitleColorForState(colors.black, UIControlStateNormal);
  nextBtn.titleLabel.font = buttonFont;
  nextBtn.showsTouchWhenHighlighted = true;

  nextBtn.addTargetActionForControlEvents(() => {

  }, UIControlEventTouchUpInside);

  quizVC.view.addSubview(nextBtn);
}

function setupProgressView() {
  progressView = new UIProgressView({
    x: 100,
    y: 68,
    width: quizVC.view.frame.width - 200,
    height: 20,
  });
  progressView.progressTintColor = UIColor.white;
  progressView.trackTintColor = colors.fitbodMedGrey;
}

function makeQuizDelegate(pageControl) {
  const del = new UIScrollViewDelegate();
  del.didScroll = (sv) => {
    const { x, y } = sv.contentOffset;
    const page = Math.round(x / w);
    if (page !== pageControl.currentPage) {
      pageControl.currentPage = page;
    }
  };
  del.didEndDecelerating = (sv) => {
    const { x, y } = sv.contentOffset;
    if (y < 0 || y > 0) {
      sv.setContentOffset({ x, y: 0 }, false);
    }
  };
  quizScroll.delegate = del;
}

function setupQuizView() {
  quizScroll = new UIScrollView();
  quizScroll.contentSize = { width: w * numSlides, height: viewH };
  quizScroll.isPagingEnabled = true;
  quizScroll.translatesAutoresizingMaskIntoConstraints = false;
  quizScroll.isDirectionalLockEnabled = true;
  quizScroll.bounces = false;

  quizVC.view.addSubview(quizScroll);
  quizScroll.layer.maskToBounds = true;

  quizScroll.leadingAnchor.constraintEqualToAnchor(quizVC.view.leadingAnchor, 0).isActive = true;
  quizScroll.trailingAnchor.constraintEqualToAnchor(quizVC.view.trailingAnchor, 0).isActive = true;
  quizScroll.topAnchor.constraintEqualToAnchor(quizVC.view.topAnchor, 0).isActive = true;
  quizScroll.bottomAnchor.constraintEqualToAnchor(quizVC.view.bottomAnchor, 0).isActive = true;

  const imgY = 60;
  const imgSize = 100;

  for (let i = 0; i < numSlides; i++) {
    const imgX = (w - 100) / 2;
    const labelY = imgY + imgSize + 50;
    const contentY = labelY + 70;
    const slideView = UIView({ x: w * i, y: 0, width: w, height: viewH });
    slideView.backgroundColor = UIColor.clear;
    const label = UILabel();
    label.frame = { x: 20, y: labelY, width: w - 40, height: 25 };
    label.text = titles[i];
    label.textColor = colors.fitbodPink;
    label.font = titleFont;
    label.textAlignment = NSTextAlignmentCenter;
    const contentLabel = UILabel();
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.textColor = RGB(255, 255, 255, 0.9);
    contentLabel.font = contentFont;
    contentLabel.frame = { x: 20, y: contentY, width: w - 40, height: 120 };
    const attrText = new NSMutableAttributedString(contentTexts[i]);
    attrText.addAttribute(NSParagraphStyleAttributeName, pStyle, {
      location: 0,
      length: contentTexts[i].length,
    });
    contentLabel.attributedText = attrText;
    const image = UIImage(iconImages[i]);
    const imageView = UIImageView(image);
    imageView.alpha = 0.5;
    imageView.frame = { x: imgX, y: imgY, width: imgSize, height: imgSize };
    quizScroll.addSubview(slideView);
    slideView.addSubview(label);
    slideView.addSubview(imageView);
    slideView.addSubview(contentLabel);
  }

  const pageControl = new UIPageControl({ x: 12, y: viewH - 200, width: w - 24, height: 60 });
  pageControl.numberOfPages = numSlides;
  pageControl.currentPage = 0;
  pageControl.currentPageIndicatorTintColor = colors.fitbodPink;
  pageControl.pageIndicatorTintColor = {
    ...colors.fitbodPink,
    alpha: 0.5,
  };
  pageControl.addTargetActionForControlEvents(() => {
    const i = pageControl.currentPage;
    const offsetX = w * i;
    quizScroll.setContentOffset({ x: offsetX, y: 0 }, true);
  }, UIControlEventValueChanged);

  makeQuizDelegate(pageControl);

  quizVC.view.addSubview(pageControl);
}

function startQuiz() {
  quizVC = UIViewController();
  quizVC.view.layer.maskToBounds = true;
  quizVC.view.backgroundColor = colors.fitbodDarkGrey;

  const clippingView = makeClippingView();
  quizVC.view.addSubview(clippingView);

  const bgView = makeBgView();
  clippingView.addSubview(bgView);

  const barView = makeStatusBarView();
  clippingView.addSubview(barView);

  setupQuizView();

  setupProgressView();

  clippingView.addSubview(progressView);

  setupQuizButton();

  nav.pushViewController(quizVC);

  setTimeout(() => {
    progressView.setProgress(0.2, true);
  }, 500);
}

function makeBgView() {
  const frame = { x: 0, y: -84, width: w, height: h + 84 };
  const img = UIImage('abstract_grey');
  const imgView = UIImageView(img);
  imgView.frame = frame;
  imgView.contentMode = UIViewContentModeScaleAspectFill;
  imgView.alpha = 0.2;
  imgView.layer.maskToBounds = true;
  return imgView;
}

function makeDelegate(pageControl) {
  const del = new UIScrollViewDelegate();
  del.didScroll = (sv) => {
    const { x, y } = sv.contentOffset;
    const page = Math.round(x / w);
    if (page !== pageControl.currentPage) {
      pageControl.currentPage = page;
    }
  };
  del.didEndDecelerating = (sv) => {
    const { x, y } = sv.contentOffset;
    if (y < 0 || y > 0) {
      sv.setContentOffset({ x, y: 0 }, false);
    }
  };
  scrollView.delegate = del;
}

function makeClippingView() {
  const clippingView = UIView({
    x: 0,
    y: -88,
    width: w,
    height: h + 88,
  });
  clippingView.backgroundColor = colors.fitbodDarkGrey;
  clippingView.layer.maskToBounds = true;
  return clippingView;
}

function setupWelcomeView() {
  w = demoVC.view.frame.width;
  h = demoVC.view.frame.height;
  viewH = h - 84;

  demoVC.view.backgroundColor = colors.fitbodDarkGrey;

  const clippingView = makeClippingView();
  demoVC.view.addSubview(clippingView);

  const bgView = makeBgView();
  clippingView.addSubview(bgView);

  const barView = makeStatusBarView();
  clippingView.addSubview(barView);

  scrollView = new UIScrollView();
  scrollView.contentSize = { width: w * numSlides, height: viewH };
  scrollView.isPagingEnabled = true;
  scrollView.translatesAutoresizingMaskIntoConstraints = false;
  scrollView.isDirectionalLockEnabled = true;
  scrollView.bounces = false;

  demoVC.view.addSubview(scrollView);
  scrollView.layer.maskToBounds = true;

  scrollView.leadingAnchor.constraintEqualToAnchor(demoVC.view.leadingAnchor, 0).isActive = true;
  scrollView.trailingAnchor.constraintEqualToAnchor(demoVC.view.trailingAnchor, 0).isActive = true;
  scrollView.topAnchor.constraintEqualToAnchor(demoVC.view.topAnchor, 0).isActive = true;
  scrollView.bottomAnchor.constraintEqualToAnchor(demoVC.view.bottomAnchor, 0).isActive = true;

  const imgY = 60;
  const imgSize = 100;

  for (let i = 0; i < numSlides; i++) {
    const imgX = (w - 100) / 2;
    const labelY = imgY + imgSize + 50;
    const contentY = labelY + 70;
    const slideView = UIView({ x: w * i, y: 0, width: w, height: viewH });
    slideView.backgroundColor = UIColor.clear;
    const label = new UILabel();
    label.frame = { x: 20, y: labelY, width: w - 40, height: 25 };
    label.text = titles[i];
    label.textColor = colors.fitbodPink;
    label.font = titleFont;
    label.textAlignment = NSTextAlignmentCenter;
    const contentLabel = UILabel();
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.textColor = RGB(255, 255, 255, 0.9);
    contentLabel.font = contentFont;
    contentLabel.frame = { x: 20, y: contentY, width: w - 40, height: 120 };
    const attrText = new NSMutableAttributedString(contentTexts[i]);
    attrText.addAttribute(NSParagraphStyleAttributeName, pStyle, {
      location: 0,
      length: contentTexts[i].length,
    });
    contentLabel.attributedText = attrText;
    const image = UIImage(iconImages[i]);
    const imageView = UIImageView(image);
    imageView.alpha = 0.5;
    imageView.frame = { x: imgX, y: imgY, width: imgSize, height: imgSize };
    scrollView.addSubview(slideView);
    slideView.addSubview(label);
    slideView.addSubview(imageView);
    slideView.addSubview(contentLabel);
  }

  const pageControl = new UIPageControl({ x: 12, y: viewH - 200, width: w - 24, height: 60 });
  pageControl.numberOfPages = numSlides;
  pageControl.currentPage = 0;
  pageControl.currentPageIndicatorTintColor = colors.fitbodPink;
  pageControl.pageIndicatorTintColor = {
    ...colors.fitbodPink,
    alpha: 0.5,
  };
  pageControl.addTargetActionForControlEvents(() => {
    const i = pageControl.currentPage;
    const offsetX = w * i;
    scrollView.setContentOffset({ x: offsetX, y: 0 }, true);
  }, UIControlEventValueChanged);

  makeDelegate(pageControl);

  demoVC.view.addSubview(pageControl);
}

function setupStartButton() {
  const nextBtn = UIButton(CGRectMake(20, viewH - 100, w - 40, 50));
  nextBtn.layer.cornerRadius = 25;
  nextBtn.layer.shadowOffset = CGSizeMake(0, 12);
  nextBtn.layer.shadowColor = RGB(85, 85, 85);
  nextBtn.layer.shadowOpacity = 0.2;
  nextBtn.layer.shadowRadius = 8;
  nextBtn.layer.maskToBounds = false;
  nextBtn.backgroundColor = colors.fitbodPink;
  nextBtn.setTitleForState('GET STARTED', UIControlStateNormal);
  nextBtn.setTitleColorForState(colors.black, UIControlStateNormal);
  nextBtn.titleLabel.font = buttonFont;
  nextBtn.showsTouchWhenHighlighted = true;

  nextBtn.addTargetActionForControlEvents(startQuiz, UIControlEventTouchUpInside);

  demoVC.view.addSubview(nextBtn);
}

function setupNavStyle(n) {
  n.navigationBar.setTranslucent(true);
  n.navigationBar.setBackgroundImageForBarMetrics(UIImage(), UIBarMetricsDefault);
  n.navigationBar.shadowImage = UIImage();
  n.navigationBar.tintColor = colors.fitbodPink;
  n.navigationBar.backgroundColor = UIColor.clear;
}

function makeStatusBarView() {
  const barView = UIView({
    x: 0,
    y: -88,
    width: w,
    height: 88,
  });
  barView.backgroundColor = colors.fitbodDarkGrey;
  return barView;
}

async function make(n, d) {
  demoVC = d;
  nav = n;

  setupWelcomeView();

  setupStartButton();

  setupNavStyle(n);

  nav.pushViewController(demoVC);
}

module.exports = make;
