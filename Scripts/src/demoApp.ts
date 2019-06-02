// // import {UIApplication} from "sweetiekit/UIKit";
//
//
// //import * as SweetieKit from 'std:sweetiekit.node'
// // import {UIKit} from "./sweetiekit";
// // import UIApplication = UIKit.UIApplication;
//
//
// // import {IndexPath, UIKit} from "./sweetiekit";
// // import UIApplication = UIKit.UIApplication;
// // import UILabel = UIKit.UILabel;
// // import UIStoryboard = UIKit.UIStoryboard;
// // import UITableViewCell = UIKit.UITableViewCell;
// // import UITableViewDataSource = UIKit.UITableViewDataSource;
// // import UIRefreshControl = UIKit.UIRefreshControl;
// // import UITextField = UIKit.UITextField;
// // import UIImagePickerController = UIKit.UIImagePickerController;
// // import UITableView = UIKit.UITableView;
// // import UIButton = UIKit.UIButton;
// // import UIImageView = UIKit.UIImageView;
// // import UIImagePickerControllerDelegate = UIKit.UIImagePickerControllerDelegate;
// // import UIImage = UIKit.UIImage;
// // import UINavigationController = UIKit.UINavigationController;
// // // import {UIKit} from "std:sweetiekit";
// // // import UIApplication = UIKit.UIApplication;
// // // declare { UIApplication } = SweetieKit.UIKit;
// // // // import * as SweetieKit from 'sweetiekit';
// // // // @ts-ignore
// // // //import {IndexPath, UIKit} from './sweetiekit';
// // // import {IndexPath, UIKit} from "./sweetiekit";
// // // import UIApplication = UIKit.UIApplication;
// // // import UILabel = UIKit.UILabel;
// // // import UIStoryboard = UIKit.UIStoryboard;
// // // import UITableViewCell = UIKit.UITableViewCell;
// // // import UITableViewDataSource = UIKit.UITableViewDataSource;
// // // import UIRefreshControl = UIKit.UIRefreshControl;
// // // import UITextField = UIKit.UITextField;
// // // import UIImagePickerController = UIKit.UIImagePickerController;
// // // import UITableView = UIKit.UITableView;
// // // import UIButton = UIKit.UIButton;
// // // import UIImageView = UIKit.UIImageView;
// // // import UIImagePickerControllerDelegate = UIKit.UIImagePickerControllerDelegate;
// // // import UIImage = UIKit.UIImage;
// // // import UINavigationController = UIKit.UINavigationController;
// // //
// // // // import UIStoryboard = SweetieKit.UIKit.UIStoryboard;
// // // // import UIApplication = SweetieKit.UIKit.UIApplication;
// // // // import UIImage = SweetieKit.UIKit.UIImage;
// // // // import UINavigationController = SweetieKit.UIKit.UINavigationController;
// // // // import UILabel = SweetieKit.UIKit.UILabel;
// // // // import UIButton = SweetieKit.UIKit.UIButton;
// // // // import UITableViewCell = SweetieKit.UIKit.UITableViewCell;
// // // // import UITableView = SweetieKit.UIKit.UITableView;
// // // // import UIRefreshControl = SweetieKit.UIKit.UIRefreshControl;
// // // // import UITableViewDataSource = SweetieKit.UIKit.UITableViewDataSource;
// // // // import UIImagePickerControllerDelegate = SweetieKit.UIKit.UIImagePickerControllerDelegate;
// // // // import UIImagePickerController = SweetieKit.UIKit.UIImagePickerController;
// // // // import UIImageView = SweetieKit.UIKit.UIImageView;
// // // // import UITextField = SweetieKit.UIKit.UITextField;
// // // // import IndexPath = SweetieKit.IndexPath;
// // // //
// // // // const { UIKit, ObjC, CoreAnimation } = SweetieKit;
// // // //
// // // // const {
// // // //   UIApplication,
// // // //   UIWindow,
// // // //   UIStoryboard,
// // // //   UIViewController,
// // // //   UIView,
// // // //   UIButton,
// // // //   UITextField,
// // // //   UITabBarController,
// // // //   UIImage,
// // // //   UIImageView,
// // // //   UILabel,
// // // //   UINavigationController,
// // // //   UIImagePickerController,
// // // //   UIImagePickerControllerDelegate,
// // // //   UITableView,
// // // //   UITableViewDataSource,
// // // //   UITableViewCell,
// // // //   UIRefreshControl,
// // // // } = UIKit;
// // // //
// // // // const {
// // // //   NSObject,
// // // //   NSUserDefaults,
// // // // } = ObjC;
// // // //
// // // // const { CALayer } = CoreAnimation;
// //
//
// // app main
//
//
// // import UIApplication = UIKit.UIApplication;
// // import UILabel = UIKit.UILabel;
// // import UITableView = UIKit.UITableView;
// // import UIStoryboard = UIKit.UIStoryboard;
// // import UITableViewCell = UIKit.UITableViewCell;
// // import UITableViewDataSource = UIKit.UITableViewDataSource;
// // import UIRefreshControl = UIKit.UIRefreshControl;
// // import UIImage = UIKit.UIImage;
// // import UINavigationController = UIKit.UINavigationController;
// //
//
//
//
//
// import {UIKit} from "std:sweetiekit.node";
// import UIApplication = UIKit.UIApplication
//

// @ts-ignore
import { IndexPath, UIKit } from "./sweetiekit";
import UIApplication = UIKit.UIApplication;
import UILabel = UIKit.UILabel;
import UIStoryboard = UIKit.UIStoryboard;
import UITableViewCell = UIKit.UITableViewCell;
import UITableViewDataSource = UIKit.UITableViewDataSource;
import UIRefreshControl = UIKit.UIRefreshControl;
import UITextField = UIKit.UITextField;
import UIImagePickerController = UIKit.UIImagePickerController;
import UITableView = UIKit.UITableView;
import UIButton = UIKit.UIButton;
import UIImageView = UIKit.UIImageView;
import UIImagePickerControllerDelegate = UIKit.UIImagePickerControllerDelegate;
import UIImage = UIKit.UIImage;
import UINavigationController = UIKit.UINavigationController;

let app: UIApplication;
// root navigation controller
let nav: UINavigationController;

// storyboard
let sb: UIStoryboard;
// user name
let username: string;
// user photo
let img: UIImage;

const ctrls = {
  NAME: 'nameVC',
  PHOTO: 'photoVC',
  DASH: 'dashVC',
};

const myData = [
  ['Dinosaurs', [{
    name: 'Stegosaurus',
    cell: new UITableViewCell(0, 0, 200, 40),
  }]],
];

function createTable() {
  const tbl = new UITableView(0, 0, 300, 400);
  const label = UILabel(0, 0, 200, 40);
  label.text = "Esimate";
  label.sizeToFit();
  tbl.estimatedRowHeight = label.frame.height;
  tbl.rowHeight = label.frame.height;
  //tbl.rowHeight = 100;

  const refresh = UIRefreshControl.alloc();
  refresh.addTargetFor(tbl, () => {
    console.log('Refresh!');
    tbl.reloadData();
    refresh.endRefreshing();
  });
  tbl.refreshControl = refresh;

  const dataSrc = new UITableViewDataSource();
  dataSrc.numberOfRowsInSection = (id: string, section: number) => {
    const count = myData[section][1].length;
    console.log('numberOfRowsInSection', id, section, count);
    return count
  };
  dataSrc.cellForRowAt = (id: string, { section, row }: IndexPath, cell?: UITableViewCell) => {
    console.log('cellForRowAt', id, section, row);
    const data = myData[section][1][row];
    console.log(data);
    if (!cell) {
      if (typeof data === 'object') return data.cell;
    } else {
      console.log(cell);
      const label = cell.textLabel;
      label.text = typeof data === 'object' ? data.name : '';
      cell.addSubview(label);
      //cell.sizeToFit();
      console.log(cell.frame);
      //cell.frame = label.frame;
      console.log(cell.frame);
    }
    return cell;
  };
  tbl.dataSource = dataSrc;
  return tbl;
  // const tblView = new UITableView();
  // const dataSrc = new UITableViewDataSource();
  // dataSrc.numberOfSectionsInRow = () => Object.keys(myData).length;
  // dataSrc.cellForRowAt = async (stringId, { section, row }) => {
  //   const c = tblView.dequeueReusableCell("id");
  //   const data = myData[Object.keys(myData)[section]];
  //   const dino = data[row];
  //   const cell = await UITableCell.initWithFrame(CGRect(0, 0, 100, 40));
  //   const label = await UILabel.initWithFrame(CGRect(0, 0, 100, 40));
  //   label.text = dino.name;
  //   cell.addSubview(label);
  //   return cell;
  // };
  // tblView.dataSource = dataSrc;
}

async function demo() {
  const dashboardVC = sb.instantiateViewController(ctrls.DASH);
  dashboardVC.view.backgroundColor = { red: 111/255, green: 174/255, blue: 175/255 };
  const table = createTable();
  dashboardVC.view.addSubview(table);
  nav.setViewControllers([dashboardVC], false);
}

async function userPhoto() {
  const photoVC = sb.instantiateViewController(ctrls.PHOTO);

  const viewW = photoVC.view.width;
  const viewH = photoVC.view.height;
  const elemW = viewW - 24;
  const imgY = ((viewH - 100) / 2) - 40;
  const imgX = (viewW - 100) / 2;

  const nextBtn = await UIButton.alloc(`📸 Choose ${username}`, 12, imgY + 124, elemW, 50, async () => {
    if (img === undefined) {
      const imgDel = new UIImagePickerControllerDelegate();
      const imgCtrl = new UIImagePickerController();

      imgDel.onInfo = () => {
        let i = imgDel.result;

        if (i) {
          img = i;
          const imgView = new UIImageView(img);
          imgView.frame = { x: imgX, y: imgY, width: 100, height: 100 };
          imgView.backgroundColor = { red: 1, blue: 1, green: 1 };
          photoVC.view.addSubview(imgView);
          nextBtn.title = '✅ Lovely';
        }
      };

      imgDel.onCancel = () => {};
      imgCtrl.delegate = imgDel;
      photoVC.present(imgCtrl, true, () => {});
    } else {
      demo();
    }
  });

  nextBtn.backgroundColor = { red: 1.0, green: 1.0, blue: 1.0 };

  photoVC.view.addSubview(nextBtn);

  nav.pushViewController(photoVC, true);
}

async function setupApp() {
  app = new UIApplication();
  sb = new UIStoryboard('Main');

  const nameVC = sb.instantiateViewController(ctrls.NAME);

  const viewH = nameVC.view.height;
  const viewW = nameVC.view.width;
  const fieldY = ((viewH - 50) / 2) - 25;
  const elemW = viewW - 24;
  const buttonY = fieldY + 74;

  const nameField = await UITextField.alloc(12, fieldY, elemW, 50, () => {
    username = nameField.text;
    console.log(username);
  });
  nameField.delegate = nameVC;

  const nextBtn = await UIButton.alloc('👍 Next', 12, buttonY, elemW, 50, async () => {
    username = nameField.text;
    if (username) userPhoto();
  });

  nextBtn.backgroundColor = { red: 1.0, green: 1.0, blue: 1.0 };
  // nameVC.view.addSubview(nameField);
  // nameVC.view.addSubview(nextBtn);

  const table = createTable();
  console.log(table);
  nameVC.view.addSubview(table);
  nav = new UINavigationController(nameVC);

  app.keyWindow.setRootViewController(nav);
}

process.nextTick(async () => {
  await setupApp();
});
