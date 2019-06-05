const SweetieKit = require('std:sweetiekit.node');

const {
  GifManager,
  GifView,
  Gif,
} = SweetieKit;

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h/3 };

  const gifView = new GifView(frame);
  const gif = new Gif('1', 0.8);
  const mgr = new GifManager(100);

  gifView.viewWillAppear = function (animated) {
    console.log('gifView.viewWillAppear', animated, this);
    demoVC.view.backgroundColor = {red: Math.random(), green: Math.random(), blue: Math.random()};
  }

  demoVC.view.addSubview(gifView);
  gifView.setGifImage(gif, mgr, -1);

  return undefined;
}

module.exports = make;
