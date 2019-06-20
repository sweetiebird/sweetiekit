const SweetieKit = require('std:sweetiekit.node');
const colors = require('./colors');

const {
  UITextField,
} = SweetieKit;

titleFont = UIFont('Lato-Bold', 22);
contentFont = UIFont('Lato-Bold', 16);
buttonFont = UIFont('Lato-Bold', 17);
pStyle = new NSMutableParagraphStyle();
pStyle.lineSpacing = 10;

async function make(nav, demoVC) {
  pane = UIView();
  demoVC.view.addSubview(pane);
  pane.pinToSuperview();
  pane.backgroundColor = UIColor.clear;


  const w = demoVC.view.frame.width;
  textField = UITextField.alloc().initWithFrame(CGRectMake(12, 80, w - 24, 50));
  textField.placeholder = "Enter text here";
  textField.font = UIFont.systemFontOfSize(15);
  textField.borderStyle = UITextBorderStyleRoundedRect;
  textField.returnKeyType = UIReturnKeyDone;
  textField.clearButtonMode = UITextFieldViewModeWhileEditing;
  pane.addSubview(textField);

  label = UILabel();
  const y = textField.frame.y + textField.bounds.height + 10;
  label.frame = CGRectMake(12, y, w - 24, pane.bounds.height - y);
  label.textColor = colors.getTheme().textColor;
  label.font = titleFont;
  label.textAlignment = NSTextAlignmentCenter;
  label.numberOfLines = 0;
  pane.addSubview(label);

  textField.addTargetActionForControlEvents((self) => {
    console.log('textField changed:', self, self.text);
    label.text = self.text;
  },UIControlEventAllEditingEvents);

  textField.delegate = UITextFieldDelegate({
    textFieldDidBeginEditing(self) {
      console.log('textFieldDidBeginEditing', self, self.text);
    },
    textFieldDidEndEditing(self) {
      console.log('textFieldDidEndEditing', self, self.text);
    },
    textFieldShouldReturn(self) {
      console.log('textFieldShouldReturn', self, self.text);
      self.resignFirstResponder();
      return true;
    },
  });

  return pane;
}

module.exports = make;
