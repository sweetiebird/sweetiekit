const SweetieKit = require('std:sweetiekit.node');
const faker = require('Faker');
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
  UITableViewCell,
  UITableView,
  UITabBarController,
  UITabBarItem,
  UIAlertController,
  UIAlertAction,
} = SweetieKit;

let w;
let h;
let viewH;

const imgY = 60;
const imgSize = 100;

let partyTable;
let wagonStack;
const party = [];
const wagon = [];

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
  'study',
  'like',
  'diamond',
];

const quizTitles = [
  'How experienced are you with the Oregon Trail?',
  'What\'s your main reason for joining a wagon party?',
  'What special items are you bringing?',
];

const quizResponses = [
  ['Greenhorn', 'Adventurer', 'Trail Guide'],
  ['To make my fortune', 'To hunt squirrels', 'Feeling lucky'],
  ['Wagon Caulk', 'Grandfather clock', 'Box of ammo (Costco wholesale)'],
];

const responseSelections = [0, 0, 0];

const titleFont = UIFont('Lato-Bold', 22);
const contentFont = UIFont('Lato-Bold', 17);
const buttonFont = UIFont('Lato-Bold', 17);
const barTitleFont = UIFont('Lato-Black', 14);

const pStyle = new NSMutableParagraphStyle();
pStyle.lineSpacing = 10;

const randomExpLevel = () => {
  const levels = ['Greenhorn', 'Adventurer', 'Trail Guide'];
  const idx = Math.floor(Math.random() * levels.length);
  return levels[idx];
};

function setNavStyles(nav) {
  nav.navigationBar.opaque = false;
  nav.navigationBar.setBackgroundImageForBarMetrics(UIImage(), UIBarMetricsDefault);
  nav.navigationBar.shadowImage = UIImage();
  nav.navigationBar.tintColor = colors.fitbodPink;
  nav.navigationBar.backgroundColor = UIColor.clear;
}

function setInnerAppNavStyles(nav) {
  //nav.setNavigationBarHiddenAnimated(true);
}

function makeAppButton(title) {
  const btn = UIButton(CGRectMake(20, viewH - 100, w - 40, 50));

  btn.layer.cornerRadius = 25;
  btn.layer.shadowOffset = CGSizeMake(0, 12);
  btn.layer.shadowColor = RGB(85, 85, 85);
  btn.layer.shadowOpacity = 0.2;
  btn.layer.shadowRadius = 8;
  btn.layer.maskToBounds = false;

  btn.backgroundColor = colors.fitbodPink;

  btn.setTitleColorForState(colors.black, UIControlStateNormal);
  btn.setTitleForState(title, UIControlStateNormal);
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
  progressView.progressTintColor = UIColor.white;
  progressView.trackTintColor = colors.fitbodMedGrey;
  return progressView;
}

function makeScrollDelegate(pageControl) {
  const del = UIScrollViewDelegate();

  del.scrollViewDidScroll = (sv) => {
    const { x } = sv.contentOffset;
    const page = Math.round(x / w);
    if (page !== pageControl.currentPage) {
      pageControl.currentPage = page;
    }
  };

  del.scrollViewDidEndDecelerating = (sv) => {
    const { x, y } = sv.contentOffset;
    if (y < 0 || y > 0) {
      sv.setContentOffsetAnimated({ x, y: 0 }, false);
    }
  };

  return del;
}

function makeSlides(scroll, numSlides, titles, contentTexts, iconImages) {
  for (let i = 0; i < numSlides; i++) {
    const imgX = (w - 100) / 2;
    const labelY = imgY + imgSize + 50;
    const contentY = labelY + 70;

    const slideView = UIView(CGRectMake(w * i, 0, w, viewH));
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
    imageView.contentMode = UIViewContentModeScaleAspectFit;

    slideView.addSubview(label);
    slideView.addSubview(imageView);
    slideView.addSubview(contentLabel);

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
  const barView = UIView({
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
  const img = UIImage('abstract_grey');
  const imgView = UIImageView(img);
  imgView.frame = frame;
  imgView.contentMode = UIViewContentModeScaleAspectFill;
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

function makeTopToolbarTitle(title) {
  const button = UIButton();
  button.setTitleForState(title, UIControlStateNormal);
  button.sizeToFit();
  button.setTitleColorForState({
    ...colors.white,
    alpha: 0.8,
  }, UIControlStateNormal);
  button.titleLabel.font = barTitleFont;
  button.translatesAutoresizingMaskIntoConstraints = false;
  button.showsTouchWhenHighlighted = true;
  return button;
}

function makeTopToolbarView() {
  const barHeight = 88;
  const toolbar = UIView({ x: 0, y: 0, width: w, height: barHeight });
  toolbar.backgroundColor = colors.fitbodMedGrey;
  return toolbar;
}

function makePartyTable() {
  const cellH = 100;

  partyTable = new UITableView({
    x: 0,
    y: 88,
    width: w,
    height: h - 172,
  });

  partyTable.dataSource = UITableViewDataSource({
    tableViewNumberOfRowsInSection() {
      return party.length;
    },
    tableViewCellForRowAtIndexPath(_, { row }) {
      const cell = UITableViewCell.alloc().initWithStyleReuseIdentifier(UITableViewCellStyleSubtitle, "id");
      const person = party[row];
      cell.textLabel.text = person.name;
      cell.textLabel.textColor = colors.white;
      if (cell.detailTextLabel) {
        cell.detailTextLabel.text = `${person.experience} • ${person.item}`;
        cell.detailTextLabel.textColor = {
          ...colors.white,
          alpha: 0.7,
        };
      }
      cell.backgroundColor = colors.clear;
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
      return cell;
    },
  });
  partyTable.delegate = UITableViewDelegate({
    tableViewHeightForRowAtIndexPath() {
      return cellH;
    },
  });
}

function makeInnerAppControllers(nav) {
  setInnerAppNavStyles(nav);

  const partyVC = UIViewController();
  partyVC.view.backgroundColor = colors.fitbodDarkGrey;
  partyVC.tabBarItem = new UITabBarItem(
    'Party',
    UIImage('user_unselected'),
    UIImage('user'),
  );
  const partyToolbar = makeTopToolbarView();
  const partyTitle = makeTopToolbarTitle('YOUR PARTY 🕺');
  const partyTitleH = partyTitle.frame.height;
  partyToolbar.addSubview(partyTitle);
  partyTitle.centerYAnchor.constraintEqualToAnchor(partyToolbar.centerYAnchor, partyTitleH / 2).isActive = true;
  partyTitle.centerXAnchor.constraintEqualToAnchor(partyToolbar.centerXAnchor, 0).isActive = true;
  partyVC.view.addSubview(partyToolbar);
  partyVC.view.bringSubviewToFront(partyToolbar);

  partyTitle.addTargetActionForControlEvents(() => {
    const adj = faker.random.bs_adjective();
    const noun = faker.random.bs_noun();
    party.push({
      name: faker.Name.findName(),
      experience: randomExpLevel(),
      goal: faker.Company.catchPhrase(),
      item: `${adj[0].toUpperCase()}${adj.substring(1).toLowerCase()} ${noun[0].toUpperCase()}${noun.substring(1).toLowerCase()}`,
    });
    partyTable.reloadData();
  }, UIControlEventTouchUpInside);

  makePartyTable();
  partyTable.separatorStyle = UITableViewCellSeparatorStyleNone;
  partyTable.backgroundColor = colors.clear;
  partyVC.view.addSubview(partyTable);

  const wagonVC = UIViewController();
  wagonVC.view.backgroundColor = colors.fitbodDarkGrey;
  wagonVC.tabBarItem = new UITabBarItem(
    'Wagon',
    UIImage('truck_unselected'),
    UIImage('truck'),
  );
  const wagonToolbar = makeTopToolbarView();
  const wagonTitle = makeTopToolbarTitle('➕ YOUR WAGON');
  const wagonTitleH = wagonTitle.frame.height;
  wagonToolbar.addSubview(wagonTitle);
  wagonTitle.centerYAnchor.constraintEqualToAnchor(wagonToolbar.centerYAnchor, wagonTitleH / 2).isActive = true;
  wagonTitle.centerXAnchor.constraintEqualToAnchor(wagonToolbar.centerXAnchor, 0).isActive = true;
  wagonVC.view.addSubview(wagonToolbar);
  wagonVC.view.bringSubviewToFront(wagonToolbar);

  wagonTitle.addTargetActionForControlEvents(() => {
    console.log('editor view controller');
  }, UIControlEventTouchUpInside);

  const tabVC = new UITabBarController();
  nav.setViewControllersAnimated([tabVC], true);

  tabVC.setViewControllersAnimated([partyVC, wagonVC], false);

  if (tabVC.tabBar) {
    tabVC.tabBar.barTintColor = colors.fitbodMedGrey;
    tabVC.tabBar.tintColor = colors.fitbodPink;
    tabVC.tabBar.unselectedItemTintColor = {
      ...colors.white,
      alpha: 0.8,
    };
  }
}

function makeQuizSlides(scroll, numSlides, titles, contentTexts, iconImages) {
  for (let i = 0; i < numSlides; i++) {
    const imgX = (w - 100) / 2;
    const labelY = imgY + imgSize + 50;
    const items = contentTexts[i];

    const image = UIImage(iconImages[i]);
    const imageView = UIImageView(image);
    imageView.alpha = 0.5;
    imageView.frame = { x: (w * i) + imgX, y: imgY, width: imgSize, height: imgSize };
    imageView.contentMode = UIViewContentModeScaleAspectFit;

    const label = UILabel();
    label.frame = { x: (w * i) + 20, y: labelY, width: w - 40, height: 25 };
    label.text = titles[i];
    label.textColor = colors.white;
    label.font = titleFont;
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0;
    label.sizeToFit();

    const contentY = labelY + label.frame.height + 10;

    const slideView = new UITableView({ x: w * i, y: contentY, width: w, height: viewH - contentY });
    slideView.backgroundColor = UIColor.clear;
    slideView.separatorStyle = UITableViewCellSeparatorStyleNone;
    slideView.dataSource = UITableViewDataSource({
      tableViewNumberOfRowsInSection(tableView, section) {
        return 3;
      },
      tableViewCellForRowAtIndexPath(tableView, indexPath) {
        const { row } = indexPath;
        const cell = UITableViewCell.alloc().initWithStyleReuseIdentifier(UITableViewCellStyleDefault, "id");
        const text = items[row];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.font = contentFont;

        if (row === responseSelections[i]) {
          cell.textLabel.textColor = colors.fitbodPink;
        } else {
          cell.textLabel.textColor = RGB(255, 255, 255, 0.9);
        }

        cell.backgroundColor = UIColor.clear;

        const attrText = new NSMutableAttributedString(text);
        attrText.addAttribute(NSParagraphStyleAttributeName, pStyle, {
          location: 0,
          length: text.length,
        });

        cell.textLabel.attributedText = attrText;

        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
      },
    });
    slideView.delegate = UITableViewDelegate({
      tableViewHeightForRowAtIndexPath(tableView, indexPath) {
        return 80;
      },
      tableViewDidSelectRowAtIndexPath(tableView, indexPath) {
        const { row } = indexPath;
        responseSelections[i] = row;
        tableView.reloadData();
      },
    });

    scroll.addSubview(imageView);
    scroll.addSubview(label);
    scroll.addSubview(slideView);
  }
}

function startQuiz(nav) {
  const numQuestions = 3;
  let quizStep = 0;

  const vc = UIViewController();
  vc.view.backgroundColor = colors.fitbodDarkGrey;

  const clippingView = makeClippingView();
  vc.view.addSubview(clippingView);

  const bgView = makeBgView();
  clippingView.addSubview(bgView);

  const barView = makeStatusBarView();
  clippingView.addSubview(barView);

  const scrollView = makeScrollView(vc, numQuestions);
  makeQuizSlides(scrollView, numQuestions, quizTitles, quizResponses, quizImages);

  const pageControl = makePageControl(scrollView, numQuestions);
  pageControl.addTargetActionForControlEvents(() => {
    const i = pageControl.currentPage;
    const offsetX = w * i;
    scrollView.setContentOffsetAnimated({ x: offsetX, y: 0 }, true);
    if (i !== quizStep) {
      quizStep = i;
    }
  }, UIControlEventValueChanged);

  const progressView = makeProgressView();
  clippingView.addSubview(progressView);

  const nextButton = makeAppButton('NEXT');
  nextButton.addTargetActionForControlEvents(() => {
    if (quizStep === numQuestions - 1) {
      party.push({
        name: 'Me',
        experience: quizResponses[0][responseSelections[0]],
        goal: quizResponses[1][responseSelections[1]],
        item: quizResponses[2][responseSelections[2]],
      });
      makeInnerAppControllers(nav);
    } else {
      quizStep += 1;
      if (quizStep <= numQuestions - 1) {
        const newContentOffset = w * quizStep;
        scrollView.setContentOffsetAnimated({ x: newContentOffset, y: 0 }, true);
        progressView.setProgress((quizStep + 1) / 3, true);
      } else {
        quizStep = numQuestions - 1;
      }
      if (quizStep >= numQuestions - 1) {
        nextButton.setTitleForState('DONE', UIControlStateNormal);
      } else {
        nextButton.setTitleForState('NEXT', UIControlStateNormal);
      }
    }
  }, UIControlEventTouchUpInside);

  const del = UIScrollViewDelegate();

  del.scrollViewDidScroll = (sv) => {
    const { x } = sv.contentOffset;
    const page = Math.round(x / w);
    if (page !== pageControl.currentPage) {
      pageControl.currentPage = page;
    }
    if (page !== quizStep) {
      quizStep = page;
      progressView.setProgress((quizStep + 1) / 3, true);
    }
    if (page >= numQuestions - 1) {
      nextButton.setTitleForState('DONE', UIControlStateNormal);
    } else {
      nextButton.setTitleForState('NEXT', UIControlStateNormal);
    }
  };

  del.scrollViewDidEndDecelerating = (sv) => {
    const { x, y } = sv.contentOffset;
    if (y < 0 || y > 0) {
      sv.setContentOffsetAnimated({ x, y: 0 }, false);
    }
    const page = Math.round(x / w);
    if (page !== quizStep) {
      quizStep = page;
      progressView.setProgress((quizStep + 1) / 3, true);
    }
    if (page >= numQuestions - 1) {
      nextButton.setTitleForState('DONE', UIControlStateNormal);
    } else {
      nextButton.setTitleForState('NEXT', UIControlStateNormal);
    }
  };

  scrollView.delegate = del;
  vc.view.addSubview(pageControl);
  vc.view.addSubview(nextButton);

  nav.pushViewControllerAnimated(vc, true);

  setTimeout(() => {
    progressView.setProgress(1/3, true);
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
  pageControl.addTargetActionForControlEvents(() => {
    const i = pageControl.currentPage;
    const offsetX = w * i;
    scrollView.setContentOffsetAnimated({ x: offsetX, y: 0 }, true);
  }, UIControlEventValueChanged);
  demoVC.view.addSubview(pageControl);

  const startButton = makeAppButton('GET STARTED');
  startButton.addTargetActionForControlEvents(() => {
    startQuiz(nav);
  }, UIControlEventTouchUpInside);
  demoVC.view.addSubview(startButton);

  nav.pushViewControllerAnimated(demoVC, true);
}

module.exports = make;
