const SweetieKit = require('std:sweetiekit.node');
// const axios = require('axios');
const https = require('https');

//const { UIKit, ObjC, CoreAnimation } = SweetieKit;
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
} = UIKit;

const {
  NSObject,
  NSUserDefaults,
} = ObjC;

const { CALayer } = CoreAnimation;

// app main
let app;
// root navigation controller
let nav;
// storyboard
let sb;
// user name
let username;
// user photo
let img;

const ctrls = {
  NAME: 'nameVC',
  PHOTO: 'photoVC',
  DASH: 'dashVC',
};

function makeid(length) {
   var result           = '';
   var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
   var charactersLength = characters.length;
   for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
   }
   return result;
}


myData = [
  ['Dinosaurs', [{
    name: 'Stegosaurus',
    cell: new UITableViewCell(),
  }]],
];
for (let i = 0; i < 300; i++) {
  myData[0][1].push({
    name: makeid(60),
    cell: new UITableViewCell(),
  });
}

function CGRect(x, y, width, height) {
  return {x, y, width, height}
}

function flash(duration, start, end, again)
{
  UIView.animate(duration, 0.0, null, () => {
    start();
  }, () => {
    if (false) {
      UIView.beginAnimations();
      try {
        UIView.setAnimationBeginsFromCurrentState(true);
        UIView.setAnimationDuration(duration);
        end();
      } finally {
        UIView.commitAnimations();
        if (!again || again()) {
          setTimeout(() => flash(duration, start, end, again), duration*1000);
        }
      }
    } else {
      UIView.animate(duration, 0.0, null, () => {
        end();
      }, () => {
        if (!again || again()) {
          flash(duration, start, end, again);
        }
      });
    }
  });
}

function createTable() {
  const tbl = new UITableView(0, 0, 300, 400);
  const label = UILabel.alloc(0, 0, 200, 40);
  label.text = "Esimate";
  label.sizeToFit()
  tbl.estimatedRowHeight = label.frame.height;
  tbl.rowHeight = label.frame.height;
  //tbl.rowHeight = 100;

  const dataSrc = new UITableViewDataSource();
  dataSrc.numberOfRowsInSection = (id, section) => {
    const count = myData[section][1].length;
    //console.log('numberOfRowsInSection', id, section, count)
    return count
  };
  dataSrc.cellForRowAt = (id, { section, row }, cell) => {
    //console.log('cellForRowAt', id, section, row, cell)
    const data = myData[section][1][row];
    //console.log(data)
    if (!cell) {
      return data.cell
    } else {
      //console.log(cell)
      //const label = UILabel.alloc();
      const label = cell.textLabel;
      label.text = data.name;
      //label.sizeToFit();
      //const cell = new UITableViewCell(0, 0, 300, 40);
      //cell.frame = label.frame
      //cell.addSubview(label);
      //cell.sizeToFit();
      //console.log(cell.frame);
      //cell.frame = label.frame;
      //console.log(cell.frame);
    }
    return cell;
  };

  let cancelReload;
  dataSrc.willDisplayCellForRowAt = (tv, cell, {section, row}) => {
    //console.log('willDisplayCellForRowAt', tv, cell, {section, row});
    if (row >= myData[0][1].length - 100) {
      for (let i = 0; i < 1; i++) {
        myData[0][1].push({
          name: makeid(60),
          cell: new UITableViewCell(),
        });
      }
      if (cancelReload) clearTimeout(cancelReload);
      cancelReload = setTimeout(() => {
        tbl.reloadData();
      }, 10);
    }
  }

  const refresh = UIRefreshControl.alloc();
  refresh.addTargetFor(tbl, () => {
    console.log('Refresh!')
    tbl.reloadData();
    refresh.endRefreshing();
  });
  tbl.refreshControl = refresh;
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
  console.log('userPhoto');
   const photoVC = sb.instantiateViewController(ctrls.PHOTO);
  console.log('userPhoto1');

   const viewW = photoVC.view.width;
   const viewH = photoVC.view.height;
   const elemW = viewW - 24;
   const imgY = ((viewH - 100) / 2) - 40;
   const imgX = (viewW - 100) / 2;

  console.log('userPhoto2');

   const nextBtn = await UIButton.alloc(`📸 Choose ${username}`, 12, imgY + 124, elemW, 50, async () => {
     if (img === undefined) {
       const imgDel = new UIImagePickerControllerDelegate();
       const imgCtrl = new UIImagePickerController();

       imgDel.onInfo = () => {
         let i = imgDel.result;

         if (i) {
           img = i;
           const imgView = new UIImageView(img);
           imgView.frame = { x: imgX - 5, y: imgY, width: 100 - 10, height: 100 - 10 };
           imgView.backgroundColor = { red: 1, blue: 1, green: 1 };
           imgView.center = {x: imgView.x + imgView.width/2, y: imgView.y + imgView.height/2};
           photoVC.view.addSubview(imgView);
           nextBtn.title = '✅ Lovely';
           const imgViewStart = imgView.frame;
           const imgViewMorph = imgView.frame;
           imgViewMorph.x += 10;
           imgViewMorph.width += 10;
           imgViewMorph.height += 10;
           flash(0.5, () => {
//             imgView.x += 10;
//             imgView.width += 10;
//             imgView.height += 10;
            imgView.frame = imgViewMorph;
           }, () => {
//             imgView.x -= 10;
//             imgView.width -= 10;
//             imgView.height -= 10;
            imgView.frame = imgViewStart;
           });
         }
       };

       imgDel.onCancel = (picker) => {};
       imgCtrl.delegate = imgDel;
       photoVC.present(imgCtrl, true, () => {});
     } else {
       demo();
     }
   });
  console.log('userPhoto3');

   nextBtn.backgroundColor = { red: 1.0, green: 1.0, blue: 1.0 };

  console.log('userPhoto4');
   photoVC.view.addSubview(nextBtn);
  console.log('userPhoto5');

   nav.pushViewController(photoVC);
  console.log('userPhoto6');
 }

async function setupApp() {
  console.log('setupApp');
  app = new UIApplication();
  console.log('setupApp2');
  sb = new UIStoryboard('Main');
  console.log('setupApp3');

  const nameVC = sb.instantiateViewController(ctrls.NAME);
  console.log('setupApp4');
  nav = new UINavigationController(nameVC);
  const view = nameVC.view;

  app.keyWindow.setRootViewController(nav);

  const viewH = nameVC.view.height;
  const viewW = nameVC.view.width;
  const fieldY = ((viewH - 50) / 2) - 25;
  const elemW = viewW - 24;
  const buttonY = fieldY + 74;
  console.log('setupApp5');
  
  let _animating = false;

  function restartAnimations() {
    if (nameField.text.length <= 0) {
      startAnimations();
    }
  }
  setInterval(() => {
    restartAnimations();
  }, 500);
  const nameField = await UITextField.alloc(12, fieldY, elemW, 50, () => {
    console.log('nameField', nameField.text);
    //restartAnimations();
  });
  console.log('setupApp6a');
  // nameField.delegate = nameVC;
  console.log('setupApp6b');

  const nextBtn = await UIButton.alloc('👍 Next', 12, buttonY, elemW, 50, async () => {
    console.log('UIButton');
    username = nameField.text;
    nameField.text = "";
    startAnimations();
    console.log('UIButton', username);
    if (username) { await userPhoto(); }
    console.log('UIButton', username);
  });
  console.log('setupApp7');

  nextBtn.backgroundColor = { red: 1.0, green: 1.0, blue: 1.0 };
  nameVC.view.addSubview(nameField);
  nameVC.view.addSubview(nextBtn);
  console.log('setupApp8');

  const toggle = new UISwitch({ x: 100, y: 100, width: 80, height: 80 });
  nameVC.view.addSubview(toggle);
  const table = createTable();
  table.height /= 3;
  table.x = 0;
  table.y = 0;
  //table.y = view.height - table.height;
  table.width = view.width;
  // console.log(table);
  // nameVC.view.addSubview(table);
  console.log('setupApp9');
  
  function goAgain() {
    //console.log(nameField.text);
    _animating = nameField.text.length <= 0;
    return _animating;
  }
  function startAnimations() {
    if (_animating) return;
    _animating = true;
    flash(0.3, () => {
      nextBtn.backgroundColor = { red: Math.random(), green: Math.random(), blue: Math.random() };
    }, () => {
      nextBtn.backgroundColor = { red: 1.0, green: 1.0, blue: 1.0 };
    }, goAgain);
    flash(0.3, () => {
      nameField.backgroundColor = { red: Math.random(), green: Math.random(), blue: Math.random() };
    }, () => {
      nameField.backgroundColor = { red: 1.0, green: 1.0, blue: 1.0 };
    }, goAgain);
    function randomFrame() {
      return CGRect(
        Math.random() * view.width,
        Math.random() * view.height,
        10,
        10
      );
    }
    const nextBtnHome = nextBtn.frame;
    flash(1.0, () => {
      nextBtn.frame = randomFrame();
    }, () => {
      nextBtn.frame = nextBtnHome;
    }, goAgain);
    
    const tableHome = table.frame;
    flash(1.0, () => {
      table.frame = randomFrame();
    }, () => {
      table.frame = tableHome;
    }, goAgain);
  }
  
  startAnimations();

  const layerPos = nextBtn.layer.position;
  console.log('layer position', layerPos);
  const anim = new CABasicAnimation('position');
  anim.duration = 3.0;
  anim.fromValue = { x: layerPos.x, y: layerPos.y };
  nextBtn.layer.position = { x: layerPos.x + 100, y: layerPos.y + 100 };
  anim.toValue = { x: layerPos.x + 100, y: layerPos.y + 100 };
  nextBtn.layer.addAnimation(anim, 'position');

  console.log('setupAppDone');
}

async function setup() {
  await setupApp();
}

/*
process.nextTick(setup);
*/

setTimeout(setup, 1000);

function foo () {
  console.log('foo');
  var res, rej;
  var p = new Promise((resolve, reject) => {
    res = resolve;
    rej = reject;
  });

  setTimeout(() => {
    console.log('foo done');
    res();
  }, 10000);
  return p;
}
setTimeout(async () => {
  await foo()
    console.log('foo bar 1');
}, 5000);
setTimeout(async () => {
  await foo()
    console.log('foo bar 2');
}, 6000);
setTimeout(async () => {
  foo()
    console.log('foo bar 3');
}, 7000);

https.get('https://testserver-rugwhbkbuu.now.sh/', (resp) => {
  console.log('inside https get');
  let data = '';

  // A chunk of data has been recieved.
  resp.on('data', (chunk) => {
    console.log('on data');
    data += chunk;
  });

  // The whole response has been received. Print out the result.
  resp.on('end', () => {
    console.log('on end');
    console.log(JSON.parse(data));
    // onComplete();
  });

}).on("error", (err) => {
  console.log("Error: " + err.message);
  // onComplete();
});

const options =
{
  appDelegate: "AppDelegate",
  onBackgroundFetch: (onComplete) => {
    console.log("bgFetch!");


    // try {
    // console.log('trying');
    //   axios.get('http://230048b3.ngrok.io')
    //     .then(resp => console.log('bg fetch result', resp))
    //     .catch((e) => {
    //       console.log('bg fetch err', e);
    //       console.log('bg fetch err msg', e.message);
    //     })
    //     .finally(() => {
    //       console.log('finally');
    //       onComplete();
    //     });
    // } catch (err) {
    //   console.log('error', err);
    //   console.log('error message', err.message);
    // }
    // try {
    //   console.log("bgFetch1!");
    //   const result = await axios.get('https://testserver-rugwhbkbuu.now.sh/');
    //   console.log("bgFetch2!");
    //   console.log(result);
    // } catch(e) {
    //   console.log("bgError!", e.message);
    //
    // } finally {
    //   console.log("bgFetchFinally!");
    //   onComplete();
    // }
  }
};

//UIApplicationMain(options);

setInterval(() => {
  UIApplicationMain(options);
}, 5);
