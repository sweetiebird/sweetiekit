const SweetieKit = process._linkedBinding('sweetiekit');

const {
  GifManager,
  GifView,
} = SweetieKit;

const url = 'https://i.imgur.com/Y1zCkQC.gif';

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const frame = { x: 0, y: 0, width: w, height: h/3 };

  const gifView = new GifView(frame);
  const mgr = new GifManager(100);

  demoVC.view.addSubview(gifView);
  gifView.setGifFromUrl(url, mgr, -1, 0.8, true);

  return undefined;
}

module.exports = make;
