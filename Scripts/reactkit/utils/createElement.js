import {
  App,
  Window,
  Text,
} from '../components';
import { ROOT_NODE } from '../renderer';

function getHostContextNode() {
  return ROOT_NODE;
}

function createElement(type, props) {
  const COMPONENTS = {
    TEXT: () => new Text(ROOT_NODE, props),
    APP: () => new App(ROOT_NODE, props),
    WINDOW: () => new Window(ROOT_NODE, props),
    default: undefined,
  };

  console.log(type, props);
  return COMPONENTS[type] ? COMPONENTS[type]() : COMPONENTS.default;
}

export { createElement, getHostContextNode };
