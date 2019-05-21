const SweetieKit = require('std:sweetiekit.node');

const colors = require('./colors');

const {
  NSTextAlignment,
  NSParagraphStyleAttributeName,
  UIControlState,
  UIViewContentMode,
  UIControlEvents,
  UIBarMetrics,
  UITableViewSelectionStyle,
  UITableViewCellSeparatorStyle,
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
  UITableViewCell,
  UITableView,
  UITableViewManager,
} = SweetieKit;

let w;
let h;
let viewH;

const imgY = 60;
const imgSize = 100;

const welcomeImages = [
  'heart',
  'fire',
  'star',
  'plane',
];

const welcomeTitles = [
  'Mustache Neutra',
  'Hexagon Unicorn',
  'Flannel Ennui',
  'Swag Hammock',
];

const welcomeContentTexts = [
  'IPhone XOXO flexitarian meditation brooklyn sustainable pinterest. Before they sold out vape everyday carry YOLO. Lyft listicle kitsch pop-up try-hard.',
  'You probably haven\'t heard of them tousled celiac, tofu hoodie cred tote bag polaroid pok pok master cleanse godard mustache lomo.',
  'Mustache snackwave raw denim cred lo-fi pop-up art party coloring book. Unicorn truffaut paleo selfies health goth. Iceland woke aesthetic kombucha.',
  'Tbh narwhal tote bag street art put a bird on it normcore, before they sold out artisan edison bulb sriracha salvia forage 3 wolf moon unicorn vice.',
];

const quizImages = [
  'heart',
  'fire',
  'star',
  'plane',
];

const quizTitles = [
  'Neutra Mustache',
  'Unicorn Hexagon',
  "Ennui Flannel",
];

const quizContentTexts = [
  '2IPhone XOXO flexitarian meditation brooklyn sustainable pinterest. Before they sold out vape everyday carry YOLO. Lyft listicle kitsch pop-up try-hard.',
  '2You probably haven\'t heard of them tousled celiac, tofu hoodie cred tote bag polaroid pok pok master cleanse godard mustache lomo.',
  '2Mustache snackwave raw denim cred lo-fi pop-up art party coloring book. Unicorn truffaut paleo selfies health goth. Iceland woke aesthetic kombucha.',
];

const quizResponses = [
  ['Resp A', 'Resp B', 'Resp C'],
  ['Resp A', 'Resp B', 'Resp C'],
  ['Resp A', 'Resp B', 'Resp C'],
];

const responseSelections = [0, 0, 0];

const titleFont = new UIFont('Lato-Bold', 22);
const contentFont = new UIFont('Lato-Bold', 16);
const buttonFont = new UIFont('Lato-Bold', 17);

const pStyle = new NSMutableParagraphStyle();
pStyle.lineSpacing = 10;

function setNavStyles(nav) {
  nav.navigationBar.setTranslucent(true);
  nav.navigationBar.setBackgroundImageForBarMetrics(new UIImage(), UIBarMetrics.default);
  nav.navigationBar.shadowImage = new UIImage();
  nav.navigationBar.tintColor = colors.fitbodPink;
  nav.navigationBar.backgroundColor = { red: 0, green: 0, blue: 0, alpha: 0 };
}

function makeAppButton(title) {
  const btn = new UIButton({
    x: 20,
    y: viewH - 100,
    width: w - 40,
    height: 50,
  });

  btn.title = title;
  btn.layer.cornerRadius = 25;
  btn.layer.shadowOffset = { width: 0, height: 12 };
  btn.layer.shadowColor = { red: 0.33, green: 0.33, blue: 0.33, alpha: 1 };
  btn.layer.shadowOpacity = 0.2;
  btn.layer.shadowRadius = 8;
  btn.layer.maskToBounds = false;

  btn.backgroundColor = colors.fitbodPink;

  btn.setTitleColorForState(colors.black, UIControlState.normal);
  btn.titleLabel.font = buttonFont;

  return btn;
}

function makeProgressView() {
  const progressView = new UIProgressView({
    x: 100,
    y: 68,
    width: w - 200,
    height: 20,
  });
  progressView.progressTintColor = { red: 1, green: 1, blue: 1, alpha: 1 };
  progressView.trackTintColor = colors.fitbodMedGrey;
  return progressView;
}

function makeScrollDelegate(pageControl) {
  const del = new UIScrollViewDelegate();

  del.didScroll = (sv) => {
    const { x } = sv.contentOffset;
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

  return del;
}

function makeSlides(scroll, numSlides, titles, contentTexts, iconImages) {
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

    if (Array.isArray(contentTexts[i])) {
      const items = contentTexts[i];
      for (let j = 0, len = items.length; j < len; j++) {
        const contentLabel = new UILabel();
        contentLabel.numberOfLines = 0;
        contentLabel.textAlignment = NSTextAlignment.left;
        contentLabel.textColor = { red: 1, green: 1, blue: 1, alpha: 0.9 };
        contentLabel.font = contentFont;
        contentLabel.frame = { x: 20, y: contentY + (40 * j), width: w - 40, height: 120 };

        const attrText = new NSMutableAttributedString(items[j]);
        attrText.addAttribute(NSParagraphStyleAttributeName, pStyle, {
          location: 0,
          length: items[j].length,
        });

        contentLabel.attributedText = attrText;
        contentLabel.isUserInteractionEnabled = true;

        slideView.addSubview(contentLabel);
      }
    } else {
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

      slideView.addSubview(contentLabel);
    }

    const image = new UIImage(iconImages[i]);
    const imageView = new UIImageView(image);
    imageView.alpha = 0.5;
    imageView.frame = { x: imgX, y: imgY, width: imgSize, height: imgSize };

    slideView.addSubview(label);
    slideView.addSubview(imageView);

    scroll.addSubview(slideView);
  }
}

function makePageControl(scroll, numSlides) {
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
    scroll.setContentOffset({ x: offsetX, y: 0 }, true);
  }, UIControlEvents.valueChanged);

  return pageControl;
}

function makeScrollView(vc, numSlides) {
  const scroll = new UIScrollView();

  scroll.contentSize = { width: w * numSlides, height: viewH };
  scroll.isPagingEnabled = true;
  scroll.translatesAutoresizingMaskIntoConstraints = false;
  scroll.isDirectionalLockEnabled = true;
  scroll.bounces = false;
  scroll.layer.maskToBounds = true;

  vc.view.addSubview(scroll);

  scroll.leadingAnchor.constraintEqualToAnchor(vc.view.leadingAnchor, 0).isActive = true;
  scroll.trailingAnchor.constraintEqualToAnchor(vc.view.trailingAnchor, 0).isActive = true;
  scroll.topAnchor.constraintEqualToAnchor(vc.view.topAnchor, 0).isActive = true;
  scroll.bottomAnchor.constraintEqualToAnchor(vc.view.bottomAnchor, 0).isActive = true;

  return scroll;
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

  function setSizes(vc) {
  w = vc.view.frame.width;
  h = vc.view.frame.height;
  viewH = h - 84;
}

function makeQuizSlides(scroll, numSlides, titles, contentTexts, iconImages) {
  for (let i = 0; i < numSlides; i++) {
    const imgX = (w - 100) / 2;
    const labelY = imgY + imgSize + 50;
    const contentY = labelY + 70;
    const items = contentTexts[i];

    const label = new UILabel();
    label.frame = { x: (w * i) + 20, y: labelY, width: w - 40, height: 25 };
    label.text = titles[i];
    label.textColor = colors.fitbodLightGrey;
    label.font = titleFont;
    label.textAlignment = NSTextAlignment.center;

    const del = new UITableViewManager((tv, section) => {
      return 3;
    }, (tv, indexPath) => {
      const cell = new UITableViewCell();
      const text = items[indexPath.row];
      cell.textLabel.numberOfLines = 0;
      cell.textLabel.textAlignment = NSTextAlignment.left;
      cell.textLabel.font = contentFont;

      if (indexPath.row === responseSelections[i]) {
        cell.textLabel.textColor = colors.fitbodPink;
      } else {
        cell.textLabel.textColor = { red: 1, green: 1, blue: 1, alpha: 0.9 };
      }

      cell.backgroundColor = { red: 0, green: 0, blue: 0, alpha: 0 };

      const attrText = new NSMutableAttributedString(text);
      attrText.addAttribute(NSParagraphStyleAttributeName, pStyle, {
        location: 0,
        length: text.length,
      });

      cell.textLabel.attributedText = attrText;

      cell.selectionStyle = UITableViewSelectionStyle.none;

      return cell;
    });

    del.numberOfSections = () => {
      return 1;
    };

    del.didSelectRowAt = (tv, indexPath) => {
      const { row } = indexPath;
      responseSelections[i] = row;
      tv.reloadData();
    };

    del.heightForRowAtIndexPath = (tv, indexPath) => {
      return 80;
    };

    const slideView = new UITableView({ x: w * i, y: contentY, width: w, height: viewH - contentY });
    slideView.backgroundColor = { red: 0, green: 0, blue: 0, alpha: 0 };
    slideView.separatorStyle = UITableViewCellSeparatorStyle.none;
    slideView.delegate = del;
    slideView.dataSource = del;

    // const image = new UIImage(iconImages[i]);
    // const imageView = new UIImageView(image);
    // imageView.alpha = 0.5;
    // imageView.frame = { x: imgX, y: imgY, width: imgSize, height: imgSize };

    // slideView.addSubview(label);
    // slideView.addSubview(imageView);

    scroll.addSubview(label);
    scroll.addSubview(slideView);
  }
}

function startQuiz(nav) {
  const numQuestions = 2;
  let quizStep = 0;

  const vc = new UIViewController();
  vc.view.backgroundColor = colors.fitbodDarkGrey;

  const clippingView = makeClippingView();
  vc.view.addSubview(clippingView);

  const bgView = makeBgView();
  clippingView.addSubview(bgView);

  const barView = makeStatusBarView();
  clippingView.addSubview(barView);

  const scrollView = makeScrollView(vc, 3);
  makeQuizSlides(scrollView, 3, quizTitles, quizResponses, quizImages);

  const pageControl = makePageControl(scrollView, 3);
  scrollView.delegate = makeScrollDelegate(pageControl);
  vc.view.addSubview(pageControl);

  const progressView = makeProgressView();
  clippingView.addSubview(progressView);

  const nextButton = makeAppButton('NEXT');
  nextButton.addTarget(() => {
    quizStep += 1;
    if (quizStep === numQuestions) {
      console.log('done');
    } else {
      console.log('page to next');
    }
  }, UIControlEvents.touchUpInside);

  vc.view.addSubview(nextButton);

  nav.pushViewController(vc);

  setTimeout(() => {
    progressView.setProgress(0.2, true);
  }, 500);
}

async function make(nav, demoVC) {
  setNavStyles(nav);
  setSizes(demoVC);

  demoVC.view.backgroundColor = colors.fitbodDarkGrey;

  const clippingView = makeClippingView();
  demoVC.view.addSubview(clippingView);

  const bgView = makeBgView();
  clippingView.addSubview(bgView);

  const barView = makeStatusBarView();
  clippingView.addSubview(barView);

  const scrollView = makeScrollView(demoVC, 4);
  makeSlides(scrollView, 4, welcomeTitles, welcomeContentTexts, welcomeImages);

  const pageControl = makePageControl(scrollView, 4);
  scrollView.delegate = makeScrollDelegate(pageControl);
  demoVC.view.addSubview(pageControl);

  const startButton = makeAppButton('GET STARTED');
  startButton.addTarget(() => {
    startQuiz(nav);
  }, UIControlEvents.touchUpInside);
  demoVC.view.addSubview(startButton);

  nav.pushViewController(demoVC);
}

module.exports = make;
