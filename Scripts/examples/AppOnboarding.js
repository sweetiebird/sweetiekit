const SweetieKit = require('std:sweetiekit.node');
const colors = require('./colors');
const {
  NSTextAlignment,
  NSParagraphStyleAttributeName,
  UIControlState,
  UIViewContentMode,
  UIBarStyle,
  UIControlEvents,
  UIProgressViewStyle,
  UIBarMetrics,
}= require('./enums');

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

const bgColors = [
  colors.fitbodDarkGrey,
  colors.fitbodMedGrey,
  colors.fitbodDarkGrey,
  colors.fitbodMedGrey,
];

const numSlides = 4;

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

const titleFont = new UIFont('Lato-Bold', 22);
const contentFont = new UIFont('Lato-Bold', 16);
const buttonFont = new UIFont('Lato-Bold', 17);
const pStyle = new NSMutableParagraphStyle();
pStyle.lineSpacing = 10;

const contentTexts = [
  'IPhone XOXO flexitarian meditation brooklyn sustainable pinterest. Before they sold out vape everyday carry YOLO. Lyft listicle kitsch pop-up try-hard.',
  'You probably haven\'t heard of them tousled celiac, tofu hoodie cred tote bag polaroid pok pok master cleanse godard mustache lomo.',
  'Mustache snackwave raw denim cred lo-fi pop-up art party coloring book. Unicorn truffaut paleo selfies health goth. Iceland woke aesthetic kombucha.',
  'Tbh narwhal tote bag street art put a bird on it normcore, before they sold out artisan edison bulb sriracha salvia forage 3 wolf moon unicorn vice.',
];

function setupProgressView() {
  progressView = new UIProgressView({
    x: 100,
    y: 68,
    width: quizVC.view.frame.width - 200,
    height: 20,
  });
  progressView.progressTintColor = { red: 1, green: 1, blue: 1, alpha: 1 };
  progressView.trackTintColor = colors.fitbodMedGrey;
}

function startQuiz() {
  quizVC = new UIViewController();
  quizVC.view.layer.maskToBounds = true;
  quizVC.view.backgroundColor = colors.fitbodDarkGrey;

  const clippingView = makeClippingView();
  quizVC.view.addSubview(clippingView);

  const bgView = makeBgView();
  clippingView.addSubview(bgView);

  const barView = makeStatusBarView();
  clippingView.addSubview(barView);

  setupProgressView();

  clippingView.addSubview(progressView);


  quizVC.navigationItem.backBarButtonItem = new UIBarButtonItem('');

  nav.pushViewController(quizVC);

  setTimeout(() => {
    progressView.setProgress(0.2, true);
  }, 500);
}

function makeBgView() {
  const frame = { x: 0, y: -84, width: w, height: h + 84 };
  const img = new UIImage('abstract_grey');
  const imgView = new UIImageView(img);
  imgView.frame = frame;
  imgView.contentMode = UIViewContentMode.scaleAspectFill;
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
  const clippingView = new UIView({
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
    const slideView = new UIView({ x: w * i, y: 0, width: w, height: viewH });
    slideView.backgroundColor = { red: 0, green: 0, blue: 0, alpha: 0 };
    const label = new UILabel();
    label.frame = { x: 20, y: labelY, width: w - 40, height: 25 };
    label.text = titles[i];
    label.textColor = colors.fitbodPink;
    label.font = titleFont;
    label.textAlignment = NSTextAlignment.center;
    const contentLabel = new UILabel();
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignment.left;
    contentLabel.textColor = { red: 1, green: 1, blue: 1, alpha: 0.9 };
    contentLabel.font = contentFont;
    contentLabel.frame = { x: 20, y: contentY, width: w - 40, height: 120 };
    const attrText = new NSMutableAttributedString(contentTexts[i]);
    attrText.addAttribute(NSParagraphStyleAttributeName, pStyle, {
      location: 0,
      length: contentTexts[i].length,
    });
    contentLabel.attributedText = attrText;
    const image = new UIImage(iconImages[i]);
    const imageView = new UIImageView(image);
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
  pageControl.addTarget(() => {
    const i = pageControl.currentPage;
    const offsetX = w * i;
    scrollView.setContentOffset({ x: offsetX, y: 0 }, true);
  }, UIControlEvents.valueChanged);

  makeDelegate(demoVC, pageControl);

  demoVC.view.addSubview(pageControl);
}

function setupStartButton() {
  const nextBtn = new UIButton({
    x: 20,
    y: viewH - 100,
    width: w - 40,
    height: 50,
  });
  // const nextBtn = UIButton.alloc('GET STARTED', 20, viewH - 100, w - 40, 50, startQuiz);
  nextBtn.title = 'GET STARTED';
  nextBtn.layer.cornerRadius = 25;
  nextBtn.layer.shadowOffset = { width: 0, height: 12 };
  nextBtn.layer.shadowColor = { red: 0.33, green: 0.33, blue: 0.33, alpha: 1 };
  nextBtn.layer.shadowOpacity = 0.2;
  nextBtn.layer.shadowRadius = 8;
  nextBtn.layer.maskToBounds = false;
  nextBtn.backgroundColor = colors.fitbodPink;
  nextBtn.setTitleColorForState(colors.black, UIControlState.normal);
  nextBtn.titleLabel.font = buttonFont;
  nextBtn.showsTouchWhenHighlighted = true;

  nextBtn.addTarget(startQuiz, UIControlEvents.touchUpInside);

  demoVC.view.addSubview(nextBtn);
}

function setupNavStyle(n) {
  n.navigationBar.setTranslucent(true);
  n.navigationBar.setBackgroundImageForBarMetrics(new UIImage(), UIBarMetrics.default);
  n.navigationBar.shadowImage = new UIImage();
  n.navigationBar.tintColor = colors.fitbodPink;
  n.navigationBar.backgroundColor = { red: 0, green: 0, blue: 0, alpha: 0 };
}

function makeStatusBarView() {
  const barView = new UIView({
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
