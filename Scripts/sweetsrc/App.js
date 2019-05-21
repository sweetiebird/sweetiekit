import React from 'react';
import ReactDOM from './renderer';

const SweetieKit = Require('std:sweetiekit.node');

const {
  UIApplication,
  UILabel,
  UIView,
  UIViewController,
} = SweetieKit;

const app = new UIApplication();
const rootVC = new UIViewController();
app.keyWindow.setRootViewController(rootVC);

class App extends React.Component {
  render() {
    return <div>Hello {this.props.name}</div>;
  }
}

// var mountNode = document.getElementById('app');
ReactDOM.render(<App name='Jane' />, rootVC.view);
