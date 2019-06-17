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

  const btn = UIButton(CGRectMake(12, 80, w - 24, 50));
  btn.setTitleForState('Take a 📸', UIControlStateNormal);
  btn.addTargetActionForControlEvents(() => {
    if (img === undefined) {
      const imgDel = new UIImagePickerControllerDelegate();
      const imgCtrl = new UIImagePickerController();

      imgDel.onInfo = () => {
        let i = imgDel.result;

        if (i) {
          img = i;
          const imgView = UIImageView(img);
          imgView.frame = { x: 12, y: 140, width: w - 24, height: w - 24 };
          imgView.backgroundColor = UIColor.white;
          demoVC.view.addSubview(imgView);
          btn.setTitleForState('✅', UIControlStateNormal);
        }
      };

      imgDel.onCancel = (picker) => {};
      imgCtrl.delegate = imgDel;
      demoVC.present(imgCtrl, true, () => {});
    }
  }, UIControlEvents.touchUpInside);

  btn.backgroundColor = RGB(87, 174, 176);
  btn.layer.cornerRadius = 4;

  demoVC.view.addSubview(btn);

  nav.pushViewController(demoVC);
}

module.exports = make;
