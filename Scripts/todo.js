const SweetieKit = require('std:sweetiekit.node');

const UIKit = SweetieKit;
const ObjC = SweetieKit;
const CoreAnimation = SweetieKit;

const {
  UIApplicationMain,
  UIApplication,
  UIBarButtonItem,
  UIWindow,
  UIStoryboard,
  UIViewController,
  UIView,
  UIButton,
  UITextField,
  UITabBarController,
  UIImage,
  UIImageView,
  UILabel,
  UINavigationController,
  UIImagePickerController,
  UIImagePickerControllerDelegate,
  UITableView,
  UITableViewDataSource,
  UITableViewCell,
  UIRefreshControl,
  CABasicAnimation,
  UISwitch,
  UIViewControllerTransitioningDelegate,
  UIPresentationController,
  UIScrollView,
  NSLayoutConstraint,
  NSLayoutAnchor,
  UITableViewManager,
  NSObject,
  NSUserDefaults,
} = UIKit;

// shared application
// let app;
// // storyboard
// let sb;
// // root nav
// let nav;
// // todos view controller
// let todoVC;
// // todos table view
// let todoTable;
// // todos data source
// let mgr;
// // user defaults
// let defaults;
//
// let todos = [];
// const mainBlue = { red: 17/255, green: 205/255, blue: 239/255 };
// const mainBg = { red: 248/255, green: 249/255, blue: 244/255 };

// async function renderTodos() {
//   const startY = (todoVC.view.frame.height / 2) - 100;
//   todos.forEach((todo, idx) => {
//     const label = UILabel.alloc();
//     label.frame = { x: 12, y: startY + (idx * 40), width: todoVC.view.frame.width - 24, height: 40 };
//     label.text = todo;
//     todoVC.view.addSubview(label);
//   });
// }
//
// function makeTableView() {
//   const table = new UITableView();
//
//   todoVC.view.addSubview(table);
//
//   table.translatesAutoresizingMaskIntoConstraints = false;
//
//   table.leadingAnchor.constraintEqualToAnchor(todoVC.view.leadingAnchor, 0).isActive = true;
//   table.trailingAnchor.constraintEqualToAnchor(todoVC.view.trailingAnchor, 0).isActive = true;
//   table.topAnchor.constraintEqualToAnchor(todoVC.view.topAnchor, 0).isActive = true;
//   table.bottomAnchor.constraintEqualToAnchor(todoVC.view.bottomAnchor, 0).isActive = true;
//
//   return table;
// }
//
// async function getTodoController() {
//   todoVC = new UIViewController();
//
//   todoVC.view.backgroundColor = mainBg;
//
//   const scrollView = new UIScrollView();
//   const contentView = new UIView();
//
//   scrollView.translatesAutoresizingMaskIntoConstraints = false;
//   contentView.translatesAutoresizingMaskIntoConstraints = false;
//
//   todoVC.view.addSubview(scrollView);
//   scrollView.addSubview(contentView);
//
//   scrollView.backgroundColor = { red: 248/255, green: 236/255, blue: 194/255 };
//
//   scrollView.leadingAnchor.constraintEqualToAnchor(todoVC.view.leadingAnchor, 20).isActive = true;
//   scrollView.trailingAnchor.constraintEqualToAnchor(todoVC.view.trailingAnchor, 0).isActive = true;
//   scrollView.topAnchor.constraintEqualToAnchor(todoVC.view.topAnchor, 20).isActive = true;
//   scrollView.bottomAnchor.constraintEqualToAnchor(todoVC.view.bottomAnchor, -20).isActive = true;
//
//   contentView.centerXAnchor.constraintEqualToAnchor(scrollView.centerXAnchor, 0).isActive = true;
//   contentView.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor, 0).isActive = true;
//   contentView.topAnchor.constraintEqualToAnchor(scrollView.topAnchor, 0).isActive = true;
//   contentView.bottomAnchor.constraintEqualToAnchor(scrollView.bottomAnchor, 0).isActive = true;
//
//   const label1 = UILabel.alloc();
//   label1.numberOfLines = 0;
//   label1.text = 'Lorem ipsum dolor amet aliqua sunt lumbersexual cardigan. Authentic live-edge chia everyday carry, selfies id est. Coloring book activated charcoal dreamcatcher flannel direct trade wayfarers put a bird on it retro locavore health goth seitan enamel pin esse. Excepteur non irony, kitsch nulla pok pok raw denim plaid. Messenger bag deep v ut, photo booth raclette crucifix XOXO glossier veniam ugh labore. Tumblr celiac irure labore, beard live-edge street art health goth non marfa gochujang poke la croix plaid. Duis roof party poutine, copper mug normcore pickled microdosing swag messenger bag. Meggings nulla man braid 8-bit distillery, authentic affogato poke poutine selvage proident actually ullamco sartorial blog. Tattooed letterpress street art four loko. Photo booth hexagon mlkshk, cupidatat officia pinterest distillery. Portland hashtag labore dolore deserunt gochujang, tacos taxidermy ut selfies.';
//   label1.sizeToFit();
//   label1.translatesAutoresizingMaskIntoConstraints = false;
//
//   const label2 = UILabel.alloc();
//   label2.numberOfLines = 0;
//   label2.text = 'Pop-up brooklyn kitsch distillery. Celiac austin minim live-edge distillery. Ut succulents deserunt, reprehenderit nisi locavore in beard bicycle rights voluptate venmo. Viral quis hammock, mlkshk microdosing aute truffaut lomo. Echo park sed activated charcoal iPhone sriracha irony shoreditch gastropub dreamcatcher disrupt butcher VHS man braid neutra DIY. Chillwave actually sartorial trust fund DIY irony copper mug. Ea enamel pin irure est. Williamsburg adipisicing neutra, cupidatat mollit tofu bitters forage. Messenger bag crucifix commodo jean shorts viral meditation.';
//   label2.sizeToFit();
//   label2.translatesAutoresizingMaskIntoConstraints = false;
//
//   const label3 = UILabel.alloc();
//   label3.numberOfLines = 0;
//   label3.text = 'Pop-up brooklyn kitsch distillery. Celiac austin minim live-edge distillery. Ut succulents deserunt, reprehenderit nisi locavore in beard bicycle rights voluptate venmo. Viral quis hammock, mlkshk microdosing aute truffaut lomo. Echo park sed activated charcoal iPhone sriracha irony shoreditch gastropub dreamcatcher disrupt butcher VHS man braid neutra DIY. Chillwave actually sartorial trust fund DIY irony copper mug. Ea enamel pin irure est. Williamsburg adipisicing neutra, cupidatat mollit tofu bitters forage. Messenger bag crucifix commodo jean shorts viral meditation.';
//   label3.sizeToFit();
//   label3.translatesAutoresizingMaskIntoConstraints = false;
//
//   contentView.addSubview(label1);
//   contentView.addSubview(label2);
//   contentView.addSubview(label3);
//
//   label1.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor, 0).isActive = true;
//   label1.topAnchor.constraintEqualToAnchor(contentView.topAnchor, 0).isActive = true;
//   label1.widthAnchor.constraintEqualToAnchor(contentView.widthAnchor, -20).isActive = true;
//
//   label2.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor, 0).isActive = true;
//   label2.topAnchor.constraintEqualToAnchor(label1.bottomAnchor, 25).isActive = true;
//   label2.widthAnchor.constraintEqualToAnchor(contentView.widthAnchor, -20).isActive = true;
//
//   label3.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor, 0).isActive = true;
//   label3.topAnchor.constraintEqualToAnchor(label2.bottomAnchor, 25).isActive = true;
//   label3.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor, 0).isActive = true;
//   label3.widthAnchor.constraintEqualToAnchor(contentView.widthAnchor, -20).isActive = true;
//
//   return todoVC;
// }

class MyApp {
  constructor(app) {
    this.app = app;
    this.todos = [];
    this.sb = new UIStoryboard('Main');
    this.setupDefaults();
    this.todoVC = new UIViewController();
    this.todoTable = new UITableView();
    this.todoVC.view.addSubview(this.todoTable);
    this.setupConstraints();
    this.addBarItem();
    this.setTableManager();
    this.createNavController();
  }

  setupDefaults() {
    this.defaults = new NSUserDefaults();

    const existingTodos = this.defaults.stringForKey('TODOS');
    if (existingTodos) {
      const todosObj = JSON.parse(existingTodos);
      console.log(todosObj);
      if (todosObj) {
        this.todos = todosObj;
      }
    } else {
      const strTodos = JSON.stringify(this.todos);
      this.defaults.setValueForKey(strTodos, 'TODOS');
    }
  }

  setupConstraints() {
    this.todoTable.translatesAutoresizingMaskIntoConstraints = false;

    this.todoTable
      .leadingAnchor
      .constraintEqualToAnchor(this.todoVC.view.leadingAnchor, 0)
      .isActive = true;
    this.todoTable
      .trailingAnchor
      .constraintEqualToAnchor(this.todoVC.view.trailingAnchor, 0)
      .isActive = true;
    this.todoTable
      .topAnchor
      .constraintEqualToAnchor(this.todoVC.view.topAnchor, 0)
      .isActive = true;
    this.todoTable
      .bottomAnchor
      .constraintEqualToAnchor(this.todoVC.view.bottomAnchor, 0)
      .isActive = true;
  }

  addNewTodo() {
    const d = new Date();
    const dateStr = `${d.toLocaleDateString()} ${d.toLocaleTimeString()}`;

    const newTodo = {
      text: dateStr,
      isDone: false,
    };

    this.todos.push(newTodo);

    this.todoTable.reloadData();

    const todosStr = JSON.stringify(this.todos);
    this.defaults.setValueForKey(todosStr, 'TODOS');
  }

  addBarItem() {
    const addBarItem = new UIBarButtonItem('Add', this.addNewTodo.bind(this));
    this.todoVC.toolbarItems = [addBarItem];
  }

  getRowsFor(tableView, section) {
    return this.todos.length;
  }

  getCellFor(tableView, { section, row }) {
    const cell = new UITableViewCell();
    const todo = this.todos[row];
    if (todo && todo.text) {
      cell.textLabel.text = todo.text;
      if (!todo.isDone) {
        cell.textLabel.font = 'Arial-BoldMT';
      }
    }
    return cell;
  }

  handleCellSelected(tableView, { section, row }) {
    const cell = this.todoTable.cellForRowAt({ section, row });
    if (cell) {
      cell.isSelected = false;
    }
    if (this.todos[row]) {
      this.todos[row].isDone = !this.todos[row].isDone;
      const todosStr = JSON.stringify(this.todos);
      this.defaults.setValueForKey(todosStr, 'TODOS');
      this.todoTable.reloadData();
    }
  }

  setTableManager() {
    this.mgr = new UITableViewManager(this.getRowsFor.bind(this), this.getCellFor.bind(this));

    this.mgr.didSelectRowAt = this.handleCellSelected.bind(this);

    this.todoTable.dataSource = this.mgr;
    this.todoTable.delegate = this.mgr;
  }

  createNavController() {
    this.nav = new UINavigationController(this.todoVC);
    this.nav.isToolbarHidden = false;
  }

  launch() {
    this.app.keyWindow.setRootViewController(this.nav);
  }
}

async function start() {
  const sharedApp = new UIApplication();
  const myApp = new MyApp(sharedApp);
  myApp.launch();
}

setTimeout(start, 1000);

const options = {
  appDelegate: 'AppDelegate',
  onBackgroundFetch: () => {
    console.log('bgFetch!');
  }
};

UIApplicationMain(options);
