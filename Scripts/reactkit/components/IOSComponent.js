import SweetieKit from 'std:sweetiekit.node'

const { UIApplication } = SweetieKit;

const exists = (a) => {
  return typeof a !== 'undefined';
};

class IOSComponent {
  constructor(root, props) {
    this.app = new UIApplication();
    this.children = [];
    this.element = {};
  }

  renderChildNode(parent) {
    // render the children
    for (let i = 0; i < this.children.length; i += 1) {
      if (typeof this.children[i] === 'object') {
        this.children[i].render(parent);
      }
    }
  }

  appendChild(child) {
    // add a child to the list to be rendered
    this.children.push(child);
  }

  addParentAppend(parent) {
    // append to parent. Can be overriden
    parent.element.append(this.element);
  }

  addParent(parent) {
    this.lastParent = parent;
    // add itself to the parent
    if (exists(parent.element.setChild)) {
      parent.element.setChild(this.element);
    } else if (
      exists(parent.element.append) ||
      exists(parent.element.appendItem)
    ) {
      this.addParentAppend(parent); // append itself to the parent
    }
  }

  removeChild(child) {
    if (exists(child.children)) {
      // we recursively remove all children
      child.children.forEach(function(w) {
        child.removeChild(w);
      });
    }
    if (typeof child === 'string') {
      // strings don't have remove methods either
    } else if (exists(this.element.setChild)) {
      // if it can only have one child, we don't need to "de-render" it
    } else if (exists(this.element.deleteAt)) {
      // if it can have multiple ex. VerticalBox
      this.element.deleteAt(this.children.indexOf(child));
      child.element.destroy();
    }
    const index = this.children.indexOf(child);
    this.children.splice(index, 1);
  }

  reparentChild(child) {
    // we as the parent add the child to yourself again
    child.render(this);
  }

  deparentChild(child) {
    // remove it, and destroy it
    if (exists(this.element.setChild)) {
    } else if (exists(this.element.deleteAt)) {
      // if it can have multiple ex. VerticalBox
      this.element.deleteAt(this.children.indexOf(child));
    }
  }

  insertChild(child, beforeChild) {
    // used in reconciler to add a new child before others
    const beforeIndex = this.children.indexOf(beforeChild);
    for (let i = this.children.length - 1; i >= beforeIndex; i--) {
      this.deparentChild(this.children[i]); // we remove all the children from the parent
    }
    this.children.splice(beforeIndex, 0, child); // insert our child
    for (let i = beforeIndex; i < this.children.length; i++) {
      this.reparentChild(this.children[i]);
    }
  }
}

module.exports = IOSComponent;
