const SweetieKit = require('std:sweetiekit.node');

const {
  GifManager,
  GifView,
  Gif,
} = SweetieKit;

async function make(demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h/3 };

  const gifView = new GifView(frame);
  const gif = new Gif('1', 0.8);
  const mgr = new GifManager(100);

  demoVC.view.addSubview(gifView);
  gifView.setGifImage(gif, mgr, -1);

  return undefined;
}

module.exports = make;
