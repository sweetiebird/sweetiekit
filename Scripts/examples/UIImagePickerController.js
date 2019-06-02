const SweetieKit = require('std:sweetiekit.node');

const UIControlEvents = require('./enums').UIControlEvents;

const {
  UIImagePickerController,
  UIImagePickerControllerDelegate,
  UIImageView,
  UIButton,
} = SweetieKit;

async function make(nav, demoVC) {
  let img;

  const w = demoVC.view.frame.width;

  const btn = UIButton({x: 12, y: 80, width: w - 24, height: 50});
  btn.title = 'Take a 📸';
  btn.addTarget(() => {
    if (img === undefined) {
      const imgDel = new UIImagePickerControllerDelegate();
      const imgCtrl = new UIImagePickerController();

      imgDel.onInfo = () => {
        let i = imgDel.result;

        if (i) {
          img = i;
          const imgView = UIImageView(img);
          imgView.frame = { x: 12, y: 140, width: w - 24, height: w - 24 };
          imgView.backgroundColor = { red: 1, blue: 1, green: 1 };
          demoVC.view.addSubview(imgView);
          btn.title = '✅';
        }
      };

      imgDel.onCancel = (picker) => {};
      imgCtrl.delegate = imgDel;
      demoVC.present(imgCtrl, true, () => {});
    }
  }, UIControlEvents.touchUpInside);

  btn.backgroundColor = { red: 87/255, green: 174/255, blue: 176/255 };
  btn.layer.cornerRadius = 4;

  demoVC.view.addSubview(btn);

  nav.pushViewController(demoVC);
}

module.exports = make;
