const SweetieKit = process._linkedBinding('sweetiekit');

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
      imgCtrl.allowsEditing = true;
      imgCtrl.sourceType = UIImagePickerControllerSourceTypeCamera;

      imgDel.imagePickerControllerDidFinishPickingMediaWithInfo = (picker, info) => {
        let img = info.get(UIImagePickerControllerOriginalImage);
        if (img) {
          const imgView = UIImageView(img);
          imgView.frame = { x: 12, y: 140, width: w - 24, height: w - 24 };
          imgView.backgroundColor = UIColor.white;
          demoVC.view.addSubview(imgView);
          btn.setTitleForState('✅', UIControlStateNormal);
        }
        picker.dismissViewControllerAnimatedCompletion(true, () => {});
      };

      imgDel.imagePickerControllerDidCancel = (picker) => {};
      imgCtrl.delegate = imgDel;
      demoVC.presentViewControllerAnimatedCompletion(imgCtrl, true, () => {});
    }
  }, UIControlEventTouchUpInside);

  btn.backgroundColor = RGB(87, 174, 176);
  btn.layer.cornerRadius = 4;

  demoVC.view.addSubview(btn);

  nav.pushViewControllerAnimated(demoVC, true);
}

module.exports = make;
