const SweetieKit = require('std:sweetiekit.node');

const UIKit = SweetieKit;
const ObjC = SweetieKit;
const CoreAnimation = SweetieKit;

const {
  UIApplicationMain,
  UIApplication,
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
} = UIKit;

// shared application
let app;
// storyboard
let sb;
// root nav
let nav;
// todos view controller
let todoVC;

const todos = ['Do stuff', 'Other stuff'];
const mainBlue = { red: 17/255, green: 205/255, blue: 239/255 };
const mainBg = { red: 248/255, green: 249/255, blue: 244/255 };

async function renderTodos() {
  const startY = (todoVC.view.frame.height / 2) - 100;
  todos.forEach((todo, idx) => {
    const label = UILabel.alloc();
    label.frame = { x: 12, y: startY + (idx * 40), width: todoVC.view.frame.width - 24, height: 40 };
    label.text = todo;
    todoVC.view.addSubview(label);
  });
}

async function getTodoController() {
  todoVC = new UIViewController();

  todoVC.view.backgroundColor = mainBg;

  const scrollView = new UIScrollView(0, 0, todoVC.view.frame.width, todoVC.view.frame.height);
  scrollView.translatesAutoresizingMaskIntoConstraints = false;

  const viewH = todoVC.view.height;
  const viewW = todoVC.view.width;
  const fieldY = 100;
  const elemW = viewW - 24;
  const buttonY = fieldY + 74;

  const todoField = await UITextField.alloc(12, fieldY, elemW, 50, () => {
    console.log(todoField.text);
  });

  const addBtn = await UIButton.alloc('👍 Add Todo', 12, buttonY, elemW, 50, async () => {
    console.log('UIButton', todoField.text);
  });

  addBtn.backgroundColor = mainBlue;

  const longView = new UIView(0, 0, todoVC.view.frame.width, todoVC.view.frame.height * 2);
  longView.addSubview(todoField);
  longView.addSubview(addBtn);

  scrollView.addSubview(longView);

  todoVC.view.addSubview(scrollView);

  return todoVC;
}

async function setup() {
  app = new UIApplication();
  sb = new UIStoryboard('Main');

  const todoVC = await getTodoController();

  nav = new UINavigationController(todoVC);

  app.keyWindow.setRootViewController(nav);

  await renderTodos();
}

async function start() {
  await setup();
}

setTimeout(start, 1000);

const options = {
  appDelegate: 'AppDelegate',
  onBackgroundFetch: () => {
    console.log('bgFetch!');
  }
};

UIApplicationMain(options);
