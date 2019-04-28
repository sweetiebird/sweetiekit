const React = require('react');
const SweetieKit = require('std:sweetiekit.node');

const { UIApplication, UIViewController, UIView } = SweetieKit;

class App {
  constructor() {
    // this.app = new UIApplication();
    this.vc = new UIViewController();
    this.view = new UIView(0, 0, this.vc.view.frame.width, this.vc.view.frame.height);
    this.view.backgroundColor = { red: 0, green: 174/255, blue: 175/255 };
    this.vc.view.addSubview(this.view);
    // this.app.keyWindow.setRootViewController(this.vc);
  }
}

// const app = new App();
const app = new UIApplication();

const SweetieRenderer = {
  render(element, app, callback) {
    console.log(element, app);
    // app.keyWindow.setRootViewController(element);
  },
};

// const app = new UIApplication();

// const App = () => {
//   const view = new UIView(0, 0, 300, 400);
//   const vc = new UIViewController();
//   vc.view.addSubview(view);
//   app.keyWindow.setRootViewController(vc);
// };

SweetieRenderer.render(<App />, app);
