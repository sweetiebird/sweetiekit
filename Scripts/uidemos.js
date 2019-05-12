const SweetieKit = require('std:sweetiekit.node');

const makeButton = require('./examples/UIButton');
const makeBarButtonItem = require('./examples/UIBarButtonItem');
const makeImageView = require('./examples/UIImageView');
const makeSlider = require('./examples/UISlider');
const makeView = require('./examples/UIView');
const makeAlertCtrl = require('./examples/UIAlertController');
const makeImagePickerCtrl = require('./examples/UIImagePickerController');

const {
  UIApplication,
  UINavigationController,
  UIViewController,
  UITableView,
  UITableViewCell,
  UITableViewManager,
} = SweetieKit;

const demoTypes = {
  UIButton: makeButton,
  UIImageView: makeImageView,
  UISlider: makeSlider,
  UIView: makeView,
};

const demoCtrls = {
  UIAlertController: makeAlertCtrl,
  UIBarButtonItem: makeBarButtonItem,
  UIImagePickerController: makeImagePickerCtrl,
};

const demoTypeNames = Object.keys(demoTypes).sort();
const demoCtrlNames = Object.keys(demoCtrls).sort();

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
    this.demoVC = new UIViewController();
    this.demoVC.view.backgroundColor = { red: 1, green: 1, blue: 1 };
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
    if (section === 0) {
      const type = demoTypeNames[row];
      if (type) {
        cell.textLabel.text = type;
      }
    } else {
      const type = demoCtrlNames[row];
      if (type) {
        cell.textLabel.text = type;
      }
    }
    return cell;
  }

  getNumberRows(tableView, section) {
    if (section === 0) {
      return Object.keys(demoTypes).length;
    }
    return Object.keys(demoCtrls).length;
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
    } else {
      const type = Object.keys(demoCtrls)[row];
      if (demoCtrls[type]) {
        this.createDemoVC();
        await demoCtrls[type](this.nav, this.demoVC);
      }
    }
  }

  showDemoUI(view) {
    this.demoVC.view.addSubview(view);
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
      return 2;
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
  const sharedApp = new UIApplication();
  if (sharedApp.keyWindow) {
    const myApp = new UIDemosApp(sharedApp);
    myApp.launch();
  } else {
    setTimeout(start, 10);
  }
}

setTimeout(start, 1);
