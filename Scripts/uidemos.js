const SweetieKit = require('std:sweetiekit.node');

// view based demos
const makeARSCNView = require('./examples/ARSCNView');
const makeButton = require('./examples/UIButton');
const makeBarButtonItem = require('./examples/UIBarButtonItem');
const makeImageView = require('./examples/UIImageView');
const makeLabel = require('./examples/UILabel');
const makeScrollView = require('./examples/UIScrollView');
const makeSlider = require('./examples/UISlider');
const makeSwitch = require('./examples/UISwitch');
const makeTextField = require('./examples/UITextField');
const makeView = require('./examples/UIView');

// controller based demos
const makeAlertCtrl = require('./examples/UIAlertController');
const makeImagePickerCtrl = require('./examples/UIImagePickerController');
const makeNavigationCtrl = require('./examples/UINavigationController');
const makeTabBarCtrl = require('./examples/UITabBarController');
const makeTableView = require('./examples/UITableView');

// misc demos
const makeThreeObj = require('./examples/ThreeOBJ');

const {
  UIApplication,
  UINavigationController,
  UIViewController,
  UITableView,
  UITableViewCell,
  UITableViewManager,
} = SweetieKit;

const demoTypes = {
  ThreeObj: makeThreeObj,
  UIButton: makeButton,
  UIImageView: makeImageView,
  UILabel: makeLabel,
  UIScrollView: makeScrollView,
  UISlider: makeSlider,
  UISwitch: makeSwitch,
  UITextField: makeTextField,
  UIView: makeView,
};

const demoCtrls = {
  UIAlertController: makeAlertCtrl,
  UIBarButtonItem: makeBarButtonItem,
  UIImagePickerController: makeImagePickerCtrl,
  UINavigationController: makeNavigationCtrl,
  UITabBarController: makeTabBarCtrl,
  UITableView: makeTableView,
};

const arDemos = {
  ARSCNView: makeARSCNView,
};

const demoTypeNames = Object.keys(demoTypes).sort();
const demoCtrlNames = Object.keys(demoCtrls).sort();
const arDemoNames = Object.keys(arDemos).sort();

const allDemoNames = [demoTypeNames, demoCtrlNames, arDemoNames];

class UIDemosApp {
  constructor(app) {
    this.app = app;
    this.vc = new UIViewController();
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
    this.demoVC = new UIViewController();
    gc();
    this.demoVC.view.backgroundColor = { red: 1, green: 1, blue: 1 };
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
    const { row, section } = indexPath;
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
    }
    return arDemoNames.length;
  }

  async handleCellSelected(tableView, indexPath) {
    const { section, row } = indexPath;

    const cell = this.table.cellForRowAt(indexPath);
    if (cell) {
      cell.isSelected = false;
    }

    if (section === 0) {
      const type = Object.keys(demoTypes)[row];

      if (demoTypes[type]) {
        this.createDemoVC();
        const ui = await demoTypes[type](this.demoVC);
        this.showDemoUI(ui);
      }
    } else if (section === 1) {
      const type = Object.keys(demoCtrls)[row];
      if (demoCtrls[type]) {
        this.createDemoVC();
        await demoCtrls[type](this.nav, this.demoVC);
      }
    } else {
      const type = Object.keys(arDemos)[row];
      if (arDemos[type]) {
        this.createDemoVC();
        gc();
        await arDemos[type](this.nav, this.demoVC);
        gc();
      }
    }
  }

  showDemoUI(view) {
    if (view) {
      this.demoVC.view.addSubview(view);
    }
    this.nav.pushViewController(this.demoVC);
  }

  presentDemoUI(ctrl) {
    this.nav.pushViewController(this.demoVC);
    setTimeout(() => {
      this.demoVC.present(ctrl, true);
    }, 1000);
  }

  setTableManager() {
    this.mgr = new UITableViewManager(
      this.getNumberRows.bind(this),
      this.getCellFor.bind(this),
    );

    this.mgr.numberOfSections = () => {
      return 3;
    };
    this.mgr.didSelectRowAt = this.handleCellSelected.bind(this);

    this.table.dataSource = this.mgr;
    this.table.delegate = this.mgr;
  }

  launch() {
    this.app.keyWindow.setRootViewController(this.nav);
  }
}

async function start() {
  gc();
  const sharedApp = new UIApplication();
  if (sharedApp.keyWindow) {
    const myApp = this.myApp = new UIDemosApp(sharedApp);
    myApp.launch();
  } else {
    setTimeout(start, 10);
  }
}

setTimeout(start, 1);
