import SweetieKit from 'std:sweetiekit.node'
import IOSComponent from './IOSComponent';

const { UIWindow } = SweetieKit;

let CURRENT_WINDOW;

class Window extends IOSComponent {
  constructor(root, props) {
    super(root, props);
    this.root = root;
    this.props = { ...props };
    this.window = new UIWindow();
    CURRENT_WINDOW = this.window;
  }

  render() {
    console.log('rendering window');
    this.window.makeKeyAndVisible();
  }
}

module.exports = Window;
