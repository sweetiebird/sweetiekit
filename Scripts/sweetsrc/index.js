import React from 'react';
import ReactDOM from './renderer';
const SweetieKit = Require('std:sweetiekit.node');

const {
  UIApplication,
  UILabel,
  UIView,
  UIViewController,
} = SweetieKit;

import App from './App';


const app = new UIApplication();
const rootVC = new UIViewController();
app.keyWindow.setRootViewController(rootVC);

function render() {
  // var mountNode = document.getElementById('app');
  ReactDOM.render(<App frame={rootVC.view.frame} />, rootVC.view);
}

render();
if (module.hot) {
  module.hot.accept('./App', () => { render(); });
}
