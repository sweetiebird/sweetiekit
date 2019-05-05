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
} = UIKit;

// shared application
let app;
// storyboard
let sb;
// root nav
let nav;

async function getTodoController() {
  const todoVC = new UIViewController();

  todoVC.view.backgroundColor = { red: 1, green: 1, blue: 1 };

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

  todoVC.view.addSubview(todoField);
  todoVC.view.addSubview(addBtn);

  return todoVC;
}

async function setup() {
  app = new UIApplication();
  sb = new UIStoryboard('Main');

  const todoVC = await getTodoController();

  nav = new UINavigationController(todoVC);

  app.keyWindow.setRootViewController(nav);
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
