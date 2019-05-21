import ReactReconciler from 'react-reconciler';
const SweetieKit = Require('std:sweetiekit.node');

const {
  UILabel,
  UIView,
  UIButton,
} = SweetieKit;

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
    let [prefix, ...rest] = type.split('-');
    prefix = prefix.toUpperCase();
    rest = rest.reduce((str, word) => {
      const next = word[0].toUpperCase() + word.substring(1);
      return `${str}${next}`;
    }, '');
    const component = `${prefix}${rest}`;
    console.log(component);
    return new SweetieKit[component]();
  },

  appendInitialChild(parentInstance, child) {
    // parentInstance.appendChild(child)
    parentInstance.addSubview(child);
  },

  finalizeInitialChildren(
    view,
    type,
    props,
    rootContainerInstance,
    hostContext
  ) {
    const { children, ...otherProps } = props;
    Object.keys(otherProps).forEach(attr => {
      if (attr === 'frame') {
        view.frame = otherProps[attr];
      } else if (attr === 'backgroundColor') {
        view.backgroundColor = otherProps[attr];
      } else if (attr === 'text') {
        view.text = otherProps[attr];
      } else if (attr === 'target') {
        const [fn, events] = otherProps[attr];

        if (view.__ourVeryHackCacheOfEventListeners) {
          view.__ourVeryHackCacheOfEventListeners.push([fn, events]);
        } else {
          view.__ourVeryHackCacheOfEventListeners = [[fn, events]];
        }

        view.addTarget(fn, events);
      } else {
        console.log('we have not handled this attribute yet', attr);
      }
    });
  },

  prepareUpdate(
    domElement,
    type,
    oldProps,
    newProps,
    rootContainerInstance,
    hostContext
  ) {
    const propKeys = new Set(
      Object.keys(newProps).concat(
        Object.keys(oldProps)
      )
    ).values();

    const payload = [];

    for (let key of propKeys) {
      if (
        // text children are already handled
        key !== 'children' &&
        oldProps[key] !== newProps[key]
      ) {
        payload.push({ [key]: newProps[key] })
      }
    }

    return payload;
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
  scheduleDeferredCallback() {},
  cancelDeferredCallback: "",

  // -------------------
  //     Mutation
  // -------------------

  supportsMutation: true,

  commitMount(domElement, type, newProps, internalInstanceHandle) {
    console.log('commitMount');
  },

  commitUpdate(
    view,
    updatePayload,
    type,
    oldProps,
    newProps,
    internalInstanceHandle
  ) {
    updatePayload.forEach(update => {
      Object.keys(update).forEach(key => {
        if (key === 'target') {
          view.__ourVeryHackCacheOfEventListeners.forEach(pair => { // To prevent leak
            view.removeTarget(pair[0], pair[1]);
          });
          view.__ourVeryHackCacheOfEventListeners = [ update[key] ];
          view.addTarget(update[key][0], update[key][1]);
        } else {
          view[key] = update[key];
        }
      });
    });
  },

  resetTextContent(domElement) {
  },

  commitTextUpdate(textInstance, oldText, newText) {
    textInstance.text = newText;
  },

  appendChild(parentInstance, child) {
    parentInstance.addSubview(child);
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
    child.removeFromSuperview();
  },

  removeChildFromContainer(container, child) {
    console.log('removeChildFromContainer');
    child.removeFromSuperview();
  }
};

const SKRenderer = ReactReconciler(hostConfig);

let internalContainerStructure;

export default {
  render(elements, containerNode, callback) {
    if (!internalContainerStructure) {
      internalContainerStructure = SKRenderer.createContainer(
        containerNode,
        false,
        false,
      );
    }

    SKRenderer.updateContainer(elements, internalContainerStructure, null, callback);
  }
};
