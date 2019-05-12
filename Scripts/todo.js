const SweetieKit = require('std:sweetiekit.node');
const axios = require('axios');
const THREE = require('./three-min');

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
  ARSKView,
  ARAnchor,
  ARWorldTrackingConfiguration,
  AVAudioPlayer,
  ARSKViewDelegate,
  NSBundle,
  SKLabelNode,
  SKScene,
  SKSpriteNode,
  CLLocationManager,
  CLLocationManagerDelegate,
  UICollectionViewManager,
  UICollectionView,
  UICollectionViewCell,
  UICollectionViewController,
} = UIKit;

const CLLocationAccuracy = {
  BestForNavigation: 'kCLLocationAccuracyBestForNavigation',
};

const UITableViewScrollPosition = {
  Top: 'Top',
  Bottom: 'Bottom',
  Middle: 'Middle',
  None: 'None',
};

const UICollectionViewScrollPosition = {
  Top: 'Top',
  Bottom: 'Bottom',
  Left: 'Left',
  Right: 'Right',
  None: 'None',
  CenteredHorizontally: 'CenteredHorizontally',
  CenteredVertically: 'CenteredVertically',
};

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

lblConsole = null;

function attachConsole(vc) {

  const scrollView = new UIScrollView();
  const contentView = new UIView();
  contentView.isUserInteractionEnabled = false;
  scrollView.isUserInteractionEnabled = false;

  scrollView.translatesAutoresizingMaskIntoConstraints = false;
  contentView.translatesAutoresizingMaskIntoConstraints = false;

  vc.view.addSubview(scrollView);
  scrollView.addSubview(contentView);

  scrollView.backgroundColor = { red: 248/255, green: 236/255, blue: 194/255, alpha: 0/255 };
  scrollView.backgroundColor = { red: 0.5*248/255, green: 0.5*236/255, blue: 0.5*194/255, alpha: 192/255 };

  scrollView.leadingAnchor.constraintEqualToAnchor(vc.view.leadingAnchor, 20).isActive = true;
  scrollView.trailingAnchor.constraintEqualToAnchor(vc.view.trailingAnchor, 0).isActive = true;
  scrollView.topAnchor.constraintEqualToAnchor(vc.view.topAnchor, 20).isActive = true;
  scrollView.bottomAnchor.constraintEqualToAnchor(vc.view.bottomAnchor, -20).isActive = true;

  contentView.centerXAnchor.constraintEqualToAnchor(scrollView.centerXAnchor, 0).isActive = true;
  contentView.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor, 0).isActive = true;
  contentView.topAnchor.constraintEqualToAnchor(scrollView.topAnchor, 0).isActive = true;
  contentView.bottomAnchor.constraintEqualToAnchor(scrollView.bottomAnchor, 0).isActive = true;

  lblConsole = UILabel.alloc();
  lblConsole.numberOfLines = 0;
  lblConsole.font = "Courier-Bold";
  lblConsole.textColor = { red: 248/255, green: 236/255, blue: 194/255 };
  lblConsole.text = 'Lorem ipsum dolor amet aliqua sunt lumbersexual cardigan. Authentic live-edge chia everyday carry, selfies id est. Coloring book activated charcoal dreamcatcher flannel direct trade wayfarers put a bird on it retro locavore health goth seitan enamel pin esse. Excepteur non irony, kitsch nulla pok pok raw denim plaid. Messenger bag deep v ut, photo booth raclette crucifix XOXO glossier veniam ugh labore. Tumblr celiac irure labore, beard live-edge street art health goth non marfa gochujang poke la croix plaid. Duis roof party poutine, copper mug normcore pickled microdosing swag messenger bag. Meggings nulla man braid 8-bit distillery, authentic affogato poke poutine selvage proident actually ullamco sartorial blog. Tattooed letterpress street art four loko. Photo booth hexagon mlkshk, cupidatat officia pinterest distillery. Portland hashtag labore dolore deserunt gochujang, tacos taxidermy ut selfies.';
  lblConsole.sizeToFit();
  lblConsole.translatesAutoresizingMaskIntoConstraints = false;
/*
  const label2 = UILabel.alloc();
  label2.numberOfLines = 0;
  label2.font = "Courier-Bold";
  label2.textColor = { red: 248/255, green: 236/255, blue: 194/255 };
  label2.text = 'Pop-up brooklyn kitsch distillery. Celiac austin minim live-edge distillery. Ut succulents deserunt, reprehenderit nisi locavore in beard bicycle rights voluptate venmo. Viral quis hammock, mlkshk microdosing aute truffaut lomo. Echo park sed activated charcoal iPhone sriracha irony shoreditch gastropub dreamcatcher disrupt butcher VHS man braid neutra DIY. Chillwave actually sartorial trust fund DIY irony copper mug. Ea enamel pin irure est. Williamsburg adipisicing neutra, cupidatat mollit tofu bitters forage. Messenger bag crucifix commodo jean shorts viral meditation.';
  label2.sizeToFit();
  label2.translatesAutoresizingMaskIntoConstraints = false;

  const label3 = UILabel.alloc();
  label3.numberOfLines = 0;
  label3.font = "Courier-Bold";
  label3.textColor = { red: 248/255, green: 236/255, blue: 194/255 };
  label3.text = 'Pop-up brooklyn kitsch distillery. Celiac austin minim live-edge distillery. Ut succulents deserunt, reprehenderit nisi locavore in beard bicycle rights voluptate venmo. Viral quis hammock, mlkshk microdosing aute truffaut lomo. Echo park sed activated charcoal iPhone sriracha irony shoreditch gastropub dreamcatcher disrupt butcher VHS man braid neutra DIY. Chillwave actually sartorial trust fund DIY irony copper mug. Ea enamel pin irure est. Williamsburg adipisicing neutra, cupidatat mollit tofu bitters forage. Messenger bag crucifix commodo jean shorts viral meditation.';
  label3.sizeToFit();
  label3.translatesAutoresizingMaskIntoConstraints = false;
  contentView.addSubview(label1);
  contentView.addSubview(label2);
  contentView.addSubview(label3);
*/

  contentView.addSubview(lblConsole);

  lblConsole.layer.shadowColor = {red: 0, green: 0, blue: 0};
  lblConsole.layer.shadowRadius = 3.0;
  lblConsole.layer.shadowOpacity = 1.0;
  lblConsole.layer.shadowOffset = {width: 4, height: 4};
  lblConsole.layer.masksToBounds = false;

  lblConsole.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor, 0).isActive = true;
  lblConsole.topAnchor.constraintEqualToAnchor(contentView.topAnchor, 0).isActive = true;
  lblConsole.widthAnchor.constraintEqualToAnchor(contentView.widthAnchor, -20).isActive = true;

  /*
  label2.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor, 0).isActive = true;
  label2.topAnchor.constraintEqualToAnchor(label1.bottomAnchor, 25).isActive = true;
  label2.widthAnchor.constraintEqualToAnchor(contentView.widthAnchor, -20).isActive = true;

  label3.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor, 0).isActive = true;
  label3.topAnchor.constraintEqualToAnchor(label2.bottomAnchor, 25).isActive = true;
  label3.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor, 0).isActive = true;
  label3.widthAnchor.constraintEqualToAnchor(contentView.widthAnchor, -20).isActive = true;
  */

}

const util = require('util');

function print(txt) {
  console.log(txt);
  if (typeof txt !== 'string') {
    txt = util.inspect(txt, {depth: Infinity});
  }
  lblConsole.text = txt + '\n' + lblConsole.text;
}

const randomColor = () => {
  const colors = [
    { red: 205/255, green: 37/255, blue: 83/255, alpha: 1 },
    { red: 205/255, green: 223/255, blue: 206/255, alpha: 1 },
    { red: 87/255, green: 174/255, blue: 176/255, alpha: 1 },
    { red: 1, green: 1, blue: 1, alpha: 1 },
    { red: 0, green: 0, blue: 0, alpha: 1 },
  ];
  const index = Math.floor(Math.random() * colors.length);
  return colors[index];
};

const target = { lat: 41.880605, lng: -87.630256 };
// const target = { lat: 41.880605, lng: -87.629714 };
let currentHeading = {};

class ARApp {
  constructor(app) {
    this.app = app;
    this.targetAdded = false;
    this.vc = new UIViewController();
    const view = this.vc.view;
    this.arView = new ARSKView({ x: 0, y: 0, width: view.frame.width, height: view.frame.height });
    this.vc.view.addSubview(this.arView);
    attachConsole(this.vc);
    this.config = new ARWorldTrackingConfiguration();
    this.viewDel = new ARSKViewDelegate(() => {
      return new SKSpriteNode('flux_pin');
    });
    this.arView.delegate = this.viewDel;
    this.scene = new SKScene('Scene');
    this.arView.presentScene(this.scene);
  }

  setupLocationUpdates() {
    this.locDel = new CLLocationManagerDelegate((mgr, status) => {
      this.locMgr.startUpdatingLocation();
      if (CLLocationManager.headingAvailable()) {
        this.locMgr.headingFilter = 5
        this.locMgr.startUpdatingHeading()
      }

    }, (mgr, locations) => {
      for (let i = 0, len = locations.length; i < len; i++) {
        const loc = locations[i];
        const { coordinate, floor, altitude,
          horizontalAccuracy, verticalAccuracy,
          timestamp,
          speed, course } = loc;
        const { latitude, longitude } = coordinate;
        print({ latitude, longitude, floor, altitude,
          horizontalAccuracy, verticalAccuracy,
          timestamp,
          speed, course, heading: currentHeading });
        // if (Math.abs(latitude - target.lat) <= 0.01) {
        //   if (Math.abs(longitude - target.lng) <= 0.0001) {
        //     console.log('ADD TARGET');
        //     console.log(latitude, longitude);
        //     this.targetAdded = true;
        //     this.arView.session.add();
        //     break;
        //   }
        // }

         // simd_float4x4 translation = matrix_identity_float4x4;
         // translation.columns[3].z = -3;
         // simd_float4x4 camTransform = [[[session currentFrame] camera] transform];
         // simd_float4x4 transform = simd_mul(camTransform, translation);
         // ARAnchor *anchor = [[ARAnchor alloc] initWithTransform:transform];
         // [session addAnchor:anchor];
        if (!this.targetAdded) {
          if (Math.abs(latitude - target.lat) <= 0.01) {
            if (Math.abs(longitude - target.lng) <= 0.01) {
              this.targetAdded = true;
              const camXform = this.arView.session.currentFrame.camera.transform;
              const translation = new THREE.Matrix4().makeTranslation(0,0,-3);
              const view = new THREE.Matrix4().fromArray(camXform);
              view.multiply(translation);
              const anchor = ARAnchor.initWithTransform(new Float32Array(view.elements));
              this.arView.session.add(anchor);
              break;
            }
          }
        }
      }
    }, (mgr, heading) => {
      const {
        magneticHeading,
        trueHeading,
        headingAccuracy,
        timestamp,
        x,
        y,
        z,
      } = heading;
      console.log(currentHeading = {
        magneticHeading,
        trueHeading,
        headingAccuracy,
        timestamp,
        x,
        y,
        z,
      });
    });
    this.locMgr = new CLLocationManager();
    this.locMgr.delegate = this.locDel;
    this.locMgr.desiredAccuracy = CLLocationAccuracy.BestForNavigation;
    this.locMgr.distanceFilter = 1;
    console.log(this.locMgr, this.locDel);
    this.locMgr.requestAlwaysAuthorization();
  }

  launch() {
    this.app.keyWindow.setRootViewController(this.vc);
    console.log(this.config, this.vc.view);
    setTimeout(() => {
      this.arView.session.run(this.config);
    }, 1000);
    setTimeout(() => {
      this.setupLocationUpdates();
    }, 3000);
  }
}

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

    this.todoTable.scrollToRowAt(
      { section: 0, row: this.todos.length - 1 },
      UITableViewScrollPosition.Top,
      true,
    );

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

  // playAudio() {
  //   this.sound = NSBundle.main().pathForResource('sunflower', 'mp3');
  //   this.player = new AVAudioPlayer(this.sound);
  //   console.log(this.sound, this.player);
  //   if (this.player) {
  //     this.player.play();
  //   }
  // }

  launch() {
    this.app.keyWindow.setRootViewController(this.nav);
  }
}

class CollectionApp {
  constructor(app) {
    this.app = app;
    this.items = [];
    this.sb = new UIStoryboard('Main');
    this.setupDefaults();
    this.vc = new UIViewController();
    this.collView = new UICollectionView({ x: 0, y: 0, width: this.vc.view.frame.width, height: this.vc.view.frame.height });
    this.collView.backgroundColor = { red: 1, green: 1, blue: 1 };
    this.vc.view.addSubview(this.collView);
    this.addBarItem();
    this.setupConstraints();
    this.setCollectionManager();
    this.createNavController();
  }

  setupDefaults() {
    this.defaults = new NSUserDefaults();

    const existingItems = this.defaults.stringForKey('ITEMS');
    if (existingItems) {
      const itemsObj = JSON.parse(existingItems);
      console.log(itemsObj);
      if (itemsObj) {
        this.items = itemsObj;
      }
    } else {
      const strItems = JSON.stringify(this.items);
      this.defaults.setValueForKey(strItems, 'ITEMS');
    }
  }

  setupConstraints() {
    this.collView.translatesAutoresizingMaskIntoConstraints = false;

    this.collView
      .leadingAnchor
      .constraintEqualToAnchor(this.vc.view.leadingAnchor, 0)
      .isActive = true;
    this.collView
      .trailingAnchor
      .constraintEqualToAnchor(this.vc.view.trailingAnchor, 0)
      .isActive = true;
    this.collView
      .topAnchor
      .constraintEqualToAnchor(this.vc.view.topAnchor, 0)
      .isActive = true;
    this.collView
      .bottomAnchor
      .constraintEqualToAnchor(this.vc.view.bottomAnchor, 0)
      .isActive = true;
  }

  addNewItem() {
    const d = new Date();
    const dateStr = `${d.toLocaleDateString()} ${d.toLocaleTimeString()}`;

    const newItem = {
      text: dateStr,
      isDone: false,
    };

    this.items.push(newItem);

    this.collView.reloadData();

    const itemsStr = JSON.stringify(this.items);
    this.defaults.setValueForKey(itemsStr, 'ITEMS');
  }

  addBarItem() {
    const addBarItem = new UIBarButtonItem('Add', this.addNewItem.bind(this));
    this.vc.toolbarItems = [addBarItem];
  }

  getItemsFor(tableView, section) {
    return this.items.length;
  }

  getCellFor(tableView, { section, row }) {
    const cell = this.collView.dequeueReusableCellWithReuseIdentifier(
      'collCell',
      { section, row },
    );
    const item = this.items[row];
    console.log(cell, item);
    if (item && item.text) {
      const label = UILabel.alloc();
      label.frame = { x: 0, y: 0, width: 200, height: 40 };
      label.text = item.text;
      const view = new UIView({
        x: 0, y: 0, width: 200, height: 200,
      });
      view.addSubview(label);
      cell.contentView.addSubview(view);
    }
    return cell;
  }

  handleCellSelected(tableView, { section, row }) {
    const cell = this.collView.cellForItemAt({ section, row });
    console.log('item selected: cell: ', cell);
  }

  setCollectionManager() {
    this.mgr = new UICollectionViewManager(this.getItemsFor.bind(this), this.getCellFor.bind(this));

    this.mgr.didSelectItemAt = this.handleCellSelected.bind(this);

    this.collView.dataSource = this.mgr;
    this.collView.delegate = this.mgr;
  }

  createNavController() {
    this.nav = new UINavigationController(this.vc);
    this.nav.isToolbarHidden = false;
  }

  launch() {
    this.app.keyWindow.setRootViewController(this.nav);
  }
}

// async function start() {
//   const sharedApp = new UIApplication();
//   if (sharedApp.keyWindow) {
//     const myApp = new ARApp(sharedApp);
//     myApp.launch();
//   } else {
//     setTimeout(start, 10);
//   }
// }

async function start() {
  const sharedApp = new UIApplication();
  if (sharedApp.keyWindow) {
    const myApp = new CollectionApp(sharedApp);
    myApp.launch();
  } else {
    setTimeout(start, 10);
  }
}

setTimeout(start, 1);

const options = {
  appDelegate: 'AppDelegate',
  onBackgroundFetch: () => {
    console.log('bgFetch!');
  }
};
