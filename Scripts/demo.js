const sweetiekit = require('std:sweetiekit.node');
const {
  NSObject,
  NSUserDefaults,
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
} = sweetiekit;

console.log(sweetiekit);

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

async function demo() {
  const dashboardVC = sb.instantiateViewController(ctrls.DASH);
  dashboardVC.view.backgroundColor = { red: 111/255, green: 174/255, blue: 175/255 };
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

      imgDel.onCancel = (picker) => {};
      imgCtrl.delegate = imgDel;
      photoVC.present(imgCtrl, true, () => {});
    } else {
      demo();
    }
  });

  nextBtn.backgroundColor = { red: 1.0, green: 1.0, blue: 1.0 };

  photoVC.view.addSubview(nextBtn);

  nav.pushViewController(photoVC);
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
  nameVC.view.addSubview(nameField);
  nameVC.view.addSubview(nextBtn);

  nav = new UINavigationController(nameVC);

  app.keyWindow.setRootViewController(nav);
}

process.nextTick(async () => {
  await setupApp();
});