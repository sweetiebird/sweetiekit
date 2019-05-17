const SweetieKit = require('std:sweetiekit.node');
const colors = require('./colors');
const {
  NSTextAlignment,
  NSParagraphStyleAttributeName,
  UIControlState,
  UIViewContentMode,
}= require('./enums');

const {
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
} = SweetieKit;

let scrollView;

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

function makeBgView(demoVC) {
  const frame = { x: 0, y: 0, width: demoVC.view.frame.width, height: demoVC.view.frame.height };
  const img = new UIImage('abstract_grey');
  const imgView = new UIImageView(img);
  imgView.frame = frame;
  imgView.contentMode = UIViewContentMode.scaleAspectFill;
  imgView.alpha = 0.2;
  return imgView;
}

function makeDelegate(demoVC, pageControl) {
  const del = new UIScrollViewDelegate();
  del.didScroll = (sv) => {
    const { x, y } = sv.contentOffset;
    const page = Math.round(x / demoVC.view.frame.width);
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

async function make(nav, demoVC) {
  demoVC.view.backgroundColor = colors.fitbodDarkGrey;

  const bgView = makeBgView(demoVC);
  demoVC.view.addSubview(bgView);

  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const viewH = h - 84;

  scrollView = new UIScrollView();
  scrollView.contentSize = { width: w * numSlides, height: viewH };
  scrollView.isPagingEnabled = true;
  scrollView.translatesAutoresizingMaskIntoConstraints = false;
  scrollView.isDirectionalLockEnabled = true;
  scrollView.bounces = false;

  demoVC.view.addSubview(scrollView);

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
    label.frame = { x: 12, y: labelY, width: w - 24, height: 25 };
    label.text = titles[i];
    label.textColor = colors.fitbodPink;
    label.font = titleFont;
    label.textAlignment = NSTextAlignment.center;
    const contentLabel = new UILabel();
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignment.left;
    contentLabel.textColor = { red: 1, green: 1, blue: 1, alpha: 0.9 };
    contentLabel.font = contentFont;
    contentLabel.frame = { x: 12, y: contentY, width: w - 24, height: 120 };
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
  });

  makeDelegate(demoVC, pageControl);

  const nextBtn = new UIButton({
    x: 20,
    y: viewH - 100,
    width: w - 40,
    height: 50,
  });
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

  demoVC.view.addSubview(pageControl);
  demoVC.view.addSubview(nextBtn);
  nav.pushViewController(demoVC);
}

module.exports = make;
