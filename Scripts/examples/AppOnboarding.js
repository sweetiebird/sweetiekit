const SweetieKit = require('std:sweetiekit.node');
const colors = require('./colors');
const {
  NSTextAlignment,
  NSParagraphStyleAttributeName,
  NSForegroundColorAttributeName,
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

const titleFont = UIFont.boldSystemFont(20);
const contentFont = UIFont.systemFont(16);
const pStyle = new NSMutableParagraphStyle();
pStyle.lineSpacing = 10;

const contentTexts = [
  'IPhone XOXO flexitarian meditation brooklyn sustainable pinterest. Before they sold out vape everyday carry YOLO. Lyft listicle kitsch pop-up try-hard.',
  'You probably haven\'t heard of them tousled celiac, tofu hoodie cred tote bag polaroid pok pok master cleanse godard mustache lomo.',
  'Mustache snackwave raw denim cred lo-fi pop-up art party coloring book. Unicorn truffaut paleo selfies health goth. Iceland woke aesthetic kombucha.',
  'Tbh narwhal tote bag street art put a bird on it normcore, before they sold out artisan edison bulb sriracha salvia forage 3 wolf moon unicorn vice.',
];

function makeDelegate(demoVC, pageControl) {
  const del = new UIScrollViewDelegate();
  del.didScroll = (sv) => {
    const { x } = sv.contentOffset;
    pageControl.currentPage = Math.round(x / demoVC.view.frame.width);
  };
  del.didEndDecelerating = (sv) => {
    const { x, y } = sv.contentOffset;
    if (y !== 0) {
      sv.setContentOffset({ x, y: 0 }, false);
    }
  };
  scrollView.delegate = del;
}

async function make(nav, demoVC) {
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

  const imgY = 40;
  const imgSize = 100;

  for (let i = 0; i < numSlides; i++) {
    const imgX = (w - 100) / 2;
    const labelY = imgY + imgSize + 40;
    const contentY = labelY + 60;
    const slideView = new UIView({ x: w * i, y: 0, width: w, height: viewH });
    slideView.backgroundColor = bgColors[i];
    const label = new UILabel();
    label.frame = { x: 12, y: labelY, width: w - 24, height: 25 };
    label.text = `Label ${i + 1}`;
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
    // contentLabel.text = contentTexts[i];
    const image = new UIImage(iconImages[i]);
    const imageView = new UIImageView(image);
    imageView.alpha = 0.5;
    imageView.frame = { x: imgX, y: imgY, width: imgSize, height: imgSize };
    scrollView.addSubview(slideView);
    slideView.addSubview(label);
    slideView.addSubview(imageView);
    slideView.addSubview(contentLabel);
    const attrs = {
      attribute: 'value',
    };
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
    const i = pageControl.currentPage;
    const offsetX = w * i;
    scrollView.setContentOffset({ x: offsetX, y: 0 }, true);
  });

  makeDelegate(demoVC, pageControl);

  demoVC.view.addSubview(pageControl);
  nav.pushViewController(demoVC);
}

module.exports = make;
