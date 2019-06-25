const SweetieKit = require('std:sweetiekit.node');

const colors = require('./examples/colors');

__DEV__ = true;

// apps
const makeMiniApp = () => require('./examples/MiniApp');
makeMiniApp.lazy = true;
const makeMiniAppReact = () => require('./examples/miniAppReact');
makeMiniAppReact.lazy = true;
const makeFullReact = require('./examples/fullReact');
const makePlatformer = require('./examples/Beez');
const makeEmojiCam = require('./examples/emojiCam');

// view based demos
const makeARSCNView = require('./examples/ARSCNView');
const makeARSelection = require('./examples/ARSelection');
const makeButton = require('./examples/UIButton');
const makeBarButtonItem = require('./examples/UIBarButtonItem');
const makeCollectionView = require('./examples/UICollectionView');
const makeGifView = require('./examples/GifView');
const makeRemoteGifView = require('./examples/RemoteGifView');
const makeImageView = require('./examples/UIImageView');
const makeLabel = require('./examples/UILabel');
const makePageControl = require('./examples/UIPageControl');
const makePicker = require('./examples/UIPickerView');
const makeMapView = require('./examples/MKMapView');
const makeSKScene = require('./examples/SKScene');
const makeSCNScene = require('./examples/SCNScene');
// const makeSKSceneSockets = require('./examples/SKSceneSockets');
const makeScrollView = require('./examples/UIScrollView');
const makeSlider = require('./examples/UISlider');
const makeSwitch = require('./examples/UISwitch');
const makeTextField = require('./examples/UITextField');
const makeView = require('./examples/UIView');
const makeARSKView = require('./examples/ARSKView');
const makeCAEmitterLayer = require('./examples/CAEmitterLayer');
const makeCAMetalLayer = require('./examples/CAMetalLayer');
const makeMTKView = require('./examples/MTKView');
const makeCLLocation = require('./examples/CLLocation');
const makeGreenDot = require('./examples/GreenDot');

// controller based demos
const makeAlertCtrl = require('./examples/UIAlertController');
const makeImagePickerCtrl = require('./examples/UIImagePickerController');
const makeNavigationCtrl = require('./examples/UINavigationController');
const makeTabBarCtrl = require('./examples/UITabBarController');
const makeTableView = require('./examples/UITableView');
const makePopover = require('./examples/Popover');

// misc demos
const makeThreeObj = require('./examples/ThreeOBJ');
const makeScreenshotDemo = require('./examples/Screenshot');

const {
  UIApplication,
  UINavigationController,
  UIViewController,
  UITableView,
  UITableViewCell,
  UITableViewManager,
} = SweetieKit;

const demoTypes = {
  CAEmitterLayer: makeCAEmitterLayer,
  CAMetalLayer: makeCAMetalLayer,
  MTKView: makeMTKView,
  CLGeocoder: makeCLLocation,
  GifView: makeGifView,
  MKMapView: makeMapView,
  RemoteGifView: makeRemoteGifView,
  Screenshot: makeScreenshotDemo,
  SKScene: makeSKScene,
  SCNScene: makeSCNScene,
  // SKSceneSockets: makeSKSceneSockets,
  ThreeOBJ: makeThreeObj,
  UIButton: makeButton,
  UIImageView: makeImageView,
  UILabel: makeLabel,
  UIPageControl: makePageControl,
  UIPickerView: makePicker,
  UIScrollView: makeScrollView,
  UISlider: makeSlider,
  UISwitch: makeSwitch,
  UITextField: makeTextField,
  UIView: makeView,
};

const demoCtrls = {
  Popover: makePopover,
  UIAlertController: makeAlertCtrl,
  UIBarButtonItem: makeBarButtonItem,
  UICollectionView: makeCollectionView,
  UIImagePickerController: makeImagePickerCtrl,
  UINavigationController: makeNavigationCtrl,
  UITabBarController: makeTabBarCtrl,
  UITableView: makeTableView,
};

const arDemos = {
  ARSKView: makeARSKView,
  ARSCNView: makeARSCNView,
  ARSelection: makeARSelection,
  GreenDot: makeGreenDot,
};

const appDemos = {
  MiniApp: makeMiniApp,
  MiniAppReact: makeMiniAppReact,
  FullReact: makeFullReact,
  Platformer: makePlatformer,
  EmojiCam: makeEmojiCam,
};

const demoTypeNames = Object.keys(demoTypes).sort();
const demoCtrlNames = Object.keys(demoCtrls).sort();
const arDemoNames = Object.keys(arDemos).sort();
const appDemoNames = Object.keys(appDemos).sort();

const allDemoNames = [demoTypeNames, demoCtrlNames, arDemoNames, appDemoNames];
const allDemoSections = ['View Demos', 'Controller-Based Demos', 'AR Demos', 'App Demos'];

global.SweetieKitEnums = require('./examples/enums');

class UIDemosApp {
  constructor(app) {
    this.app = app;
    this.vc = UIViewController();
    this.table = new UITableView();
    this.vc.view.addSubview(this.table);
    this.setupConstraints();
    this.setTableManager();
    this.setupNav();
  }

  setupNav() {
    this.nav = new UINavigationController(this.vc);
  }

  createDemoVC() {
    gc();
    this.demoVC = UIViewController();
    gc();
    this.demoVC.view.backgroundColor = colors.getTheme().backgroundColor;
    gc();
  }

  setupConstraints() {
    this.table.translatesAutoresizingMaskIntoConstraints = false;

    this.table
      .leadingAnchor
      .constraintEqualToAnchor(this.vc.view.leadingAnchor, 0)
      .isActive = true;
    this.table
      .trailingAnchor
      .constraintEqualToAnchor(this.vc.view.trailingAnchor, 0)
      .isActive = true;
    this.table
      .topAnchor
      .constraintEqualToAnchor(this.vc.view.topAnchor, 0)
      .isActive = true;
    this.table
      .bottomAnchor
      .constraintEqualToAnchor(this.vc.view.bottomAnchor, 0)
      .isActive = true;
  }

  getCellFor(tableView, indexPath) {
    let { row, section } = indexPath;
    const cell = new UITableViewCell();
    const names = allDemoNames[section];
    const type = names[row];
    if (type) {
      cell.textLabel.text = type;
    }
    return cell;
  }

  getNumberRows(tableView, section) {
    if (section === 0) {
      return demoTypeNames.length;
    } else if (section === 1) {
      return demoCtrlNames.length;
    } else if (section === 2) {
      return arDemoNames.length;
    }
    return appDemoNames.length;
  }


  async handleCellSelected(tableView, indexPath) {
    let { section, row } = indexPath;

    const cell = this.table.cellForRowAt(indexPath);
    if (cell) {
      cell.isSelected = false;
    }

    if (section === 0) {
      const type = demoTypeNames[row];

      if (demoTypes[type]) {
        this.createDemoVC();
        const ui = await demoTypes[type](this.nav, this.demoVC);
        this.showDemoUI(ui, true);
      }
    } else if (section === 1) {
      const type = demoCtrlNames[row];
      if (demoCtrls[type]) {
        this.createDemoVC();
        const ui = await demoCtrls[type](this.nav, this.demoVC);
        this.showDemoUI(ui);
      }
    } else if (section === 2 ) {
      const type = arDemoNames[row];
      if (arDemos[type]) {
        this.createDemoVC();
        gc();
        const ui = await arDemos[type](this.nav, this.demoVC);
        gc();
        this.showDemoUI(ui);
      }
    } else {
      const type = appDemoNames[row];
      if (appDemos[type]) {
        this.createDemoVC();
        let makeApp = appDemos[type].lazy ? await appDemos[type]() : appDemos[type];
        // gc();
        const ui = await makeApp(this.nav, this.demoVC);
        // gc();
        this.showDemoUI(ui);
      }
    }
  }

  showDemoUI(view, shouldPush) {
    if (view) {
      this.demoVC.view.addSubview(view);
    }
    if (shouldPush) {
      this.nav.pushViewController(this.demoVC);
    }
  }

  setTableManager() {
    this.mgr = new UITableViewManager(
      this.getNumberRows.bind(this),
      this.getCellFor.bind(this),
    );

    this.mgr.numberOfSections = () => {
      return allDemoNames.length;
    };
    this.mgr.didSelectRowAt = this.handleCellSelected.bind(this);
    this.mgr.titleForHeaderInSection = (tv, section) => {
      return allDemoSections[section];
    };

    this.table.dataSource = this.mgr;
    this.table.delegate = this.mgr;
  }

  launch() {
    this.app.keyWindow.rootViewController = this.nav;
  }
}

async function start() {
  gc();
  const sharedApp = new UIApplication();
  if (sharedApp.keyWindow) {
    const myApp = this.myApp = SweetieKitApp = new UIDemosApp(sharedApp);
    myApp.launch();
  } else {
    setTimeout(start, 10);
  }
}

setTimeout(start, 1);
