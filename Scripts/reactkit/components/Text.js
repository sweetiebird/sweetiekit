import React from 'react';
import SweetieKit from 'std:sweetiekit.node'
import IOSComponent from './IOSComponent';

const { UILabel } = SweetieKit;

class Text extends IOSComponent {
  constructor(root, props) {
    super(root, props);
    this.root = root;
    this.props = { ...props };
    this.newElement();
  }

  newElement() {
    this.element = new UILabel(0, 0, 200, 40);
  }

  render(parent) {
    this.addParent(parent);
    this.renderChildNode();
  }
}

Text.childName = 'text';

module.exports = Text;
