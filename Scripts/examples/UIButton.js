const SweetieKit = require('std:sweetiekit.node');

const UIControlEvents = require('./enums').UIControlEvents;

const {
  UIButton,
} = SweetieKit;

async function make(demoVC) {
  const w = demoVC.view.frame.width;
  const button = UIButton({x: 12, y: 80, width: w - 24, height: 50});
  button.title = '👋 Hello Button';
  button.addTarget(() => {
    const alert = new UIAlertController(
      'Button pressed',
      'Hello',
    );
    const action = new UIAlertAction('Okay', () => {
      alert.dismiss(true, () => {});
    });
    alert.addAction(action);
    demoVC.present(alert, true, () => {});
  }, UIControlEvents.touchUpInside);
  button.backgroundColor = { red: 87/255, green: 174/255, blue: 176/255 };
  button.layer.cornerRadius = 4;
  button.layer.shadowRadius = 12;
  button.layer.shadowColor = { red: 87/255, green: 174/255, blue: 176/255 };
  button.layer.shadowOffset = { width: 0, height: 12 };
  return button;
}

module.exports = make;
