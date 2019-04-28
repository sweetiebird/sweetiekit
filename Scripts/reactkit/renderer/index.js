import { createElement } from '../utils/createElement';
import SweetieRenderer from './reconciler';
// import { connectDevtools } from '../devtools';

export let ROOT_NODE = {};

// Renders the input component
function render(element) {
  // connectDevtools(DesktopRenderer);

  ROOT_NODE = createElement('APP');
  const container = ROOT_NODE;

  // Returns the current fiber (flushed fiber)
  const node = SweetieRenderer().createContainer(ROOT_NODE);

  // Schedules a top level update with current fiber and a priority level (depending upon the context)
  SweetieRenderer.updateContainer(element, node, null);

  ROOT_NODE.render();
}

module.exports = render;
