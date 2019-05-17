import React from 'react';
import SweetieKit from 'std:sweetiekit.node'
import IOSComponent from './IOSComponent';

class App extends IOSComponent {
  render() {
    const children = React.Children.toArray(this.props.children);
    if (children.length >= 1) {
      const firstChild = children[0];
      console.log(firstChild);
    }
  }
}

module.exports = App;
