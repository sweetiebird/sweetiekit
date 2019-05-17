const SweetieKit = require('std:sweetiekit.node');

const {
  UIButton,
} = SweetieKit;

async function make(demoVC) {
  const w = demoVC.view.frame.width;
  const button = await UIButton.alloc('👋 Hello Button', 12, 80, w - 24, 50, () => {
    const alert = new UIAlertController(
      'Button pressed',
      'Hello',
    );
    const action = new UIAlertAction('Okay', () => {
      alert.dismiss(true, () => {});
    });
    alert.addAction(action);
    demoVC.present(alert, true, () => {});
  });
  button.backgroundColor = { red: 87/255, green: 174/255, blue: 176/255 };
  button.layer.cornerRadius = 4;
  button.layer.shadowRadius = 12;
  button.layer.shadowColor = { red: 87/255, green: 174/255, blue: 176/255 };
  button.layer.shadowOffset = { width: 0, height: 12 };
  return button;
}

module.exports = make;
