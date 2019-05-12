const SweetieKit = require('std:sweetiekit.node');

const makeSlider = require('./examples/UISlider');
const makeView = require('./examples/UIView');

const {
  UIApplication,
  UINavigationController,
  UIViewController,
  UITableView,
  UITableViewCell,
  UITableViewManager,
} = SweetieKit;

const demoTypes = {
  UISlider: makeSlider,
  UIView: makeView,
};

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
    const { row } = indexPath;
    const cell = new UITableViewCell();
    const type = Object.keys(demoTypes)[row];
    if (type) {
      cell.textLabel.text = type;
    }
    return cell;
  }

  getNumberRows(tableView, section) {
    return Object.keys(demoTypes).length;
  }

  async handleCellSelected(tableView, indexPath) {
    const { row } = indexPath;

    const cell = this.table.cellForRowAt(indexPath);
    if (cell) {
      cell.isSelected = false;
    }

    const type = Object.keys(demoTypes)[row];

    if (demoTypes[type]) {
      this.createDemoVC();
      const ui = await demoTypes[type](this.demoVC);
      this.showDemoUI(ui);
    }
  }

  showDemoUI(view) {
    this.demoVC.view.addSubview(view);
    this.nav.pushViewController(this.demoVC);
  }

  setTableManager() {
    this.mgr = new UITableViewManager(
      this.getNumberRows.bind(this),
      this.getCellFor.bind(this),
    );

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
