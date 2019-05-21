import ReactReconciler from 'react-reconciler';
const SweetieKit = Require('std:sweetiekit.node');

const {
  UILabel,
  UIView,
} = SweetieKit;

console.log('sweetiekit uilabel', UILabel);

const hostConfig = {
  getRootHostContext(rootContainerInstance) {
    return {}
  },

  getChildHostContext(parentHostContext, type, rootContainerInstance) {
    return {};
  },

  getPublicInstance(instance) {
    console.log('getPublicInstance');
  },

  prepareForCommit(containerInfo) {
  },

  resetAfterCommit(containerInfo) {
  },

  createInstance(
    type,
    props,
    rootContainerInstance,
    hostContext,
    internalInstanceHandle
  ) {
    if (type === 'div') {
      return new UIView();
    }
    return new UILabel();
  },

  appendInitialChild(parentInstance, child) {
    // parentInstance.appendChild(child)
    parentInstance.addSubview(child);
  },

  finalizeInitialChildren(
    domElement,
    type,
    props,
    rootContainerInstance,
    hostContext
  ) {
    // const { children, ...otherProps } = props;
    // Object.keys(otherProps).forEach(attr => {
    //   if (attr === 'className') {
    //     domElement.class = otherProps[attr];
    //   } else if (attr === 'onClick') {
    //     const listener = otherProps[attr];
    //     if (domElement.__ourVeryHackCacheOfEventListeners) {
    //       domElement.__ourVeryHackCacheOfEventListeners.push(listener)
    //     } else {
    //       domElement.__ourVeryHackCacheOfEventListeners = [ listener ]
    //     }
    //     domElement.addEventListener('click', listener);
    //   } else {
    //     throw new Error('TODO: We haven\'t handled other properties/attributes')
    //   }
    // })
  },

  prepareUpdate(
    domElement,
    type,
    oldProps,
    newProps,
    rootContainerInstance,
    hostContext
  ) {
    console.log('prepareUpdate');

    return [ null ];

  },

  shouldSetTextContent(type, props) {
    return false;
  },

  shouldDeprioritizeSubtree(type, props) {
    console.log('shouldDeprioritizeSubtree');
  },

  createTextInstance(
    text,
    rootContainerInstance,
    hostContext,
    internalInstanceHandle
  ) {
    const label = new UILabel();
    label.text = text;
    return label;
  },

  now: Date.now,

  isPrimaryRenderer: true,
  scheduleDeferredCallback: "",
  cancelDeferredCallback: "",

  // -------------------
  //     Mutation
  // -------------------

  supportsMutation: true,

  commitMount(domElement, type, newProps, internalInstanceHandle) {
    console.log('commitMount');
  },

  commitUpdate(
    domElement,
    updatePayload,
    type,
    oldProps,
    newProps,
    internalInstanceHandle
  ) {
  },

  resetTextContent(domElement) {
  },

  commitTextUpdate(textInstance, oldText, newText) {
    textInstance.text = newText;
  },

  appendChild(parentInstance, child) {
  },

  appendChildToContainer(container, child) {
    console.log(container, child);
    container.addSubview(child);
  },

  insertBefore(parentInstance, child, beforeChild) {
    console.log('insertBefore');
  },

  insertInContainerBefore(container, child, beforeChild) {
    console.log('insertInContainerBefore');
  },

  removeChild(parentInstance, child) {
    console.log('removeChild');
  },

  removeChildFromContainer(container, child) {
    console.log('removeChildFromContainer');
  }
};
const DOMRenderer = ReactReconciler(hostConfig);

let internalContainerStructure;

export default {
  render(elements, containerNode, callback) {
    if (!internalContainerStructure) {
      internalContainerStructure = DOMRenderer.createContainer(
        containerNode,
        false,
        false,
      );
    }

    DOMRenderer.updateContainer(elements, internalContainerStructure, null, callback);
  }
};
