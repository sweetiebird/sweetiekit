__PLATFORM__ = typeof __PLATFORM__ === 'undefined' ? 'ios' : __PLATFORM__;
__DEV__ = typeof __DEV__ === 'undefined' ? 'dev' : __DEV__;

SWEET = typeof SWEET === 'undefined' ? {} : SWEET;
SWEET.require = SWEET.require || require;
SWEET.process = process;

SweetieKit = typeof SweetieKit === 'undefined' ? SWEET.process._linkedBinding('sweetiekit') : SweetieKit;
SweetieKitDOM = SWEET.require('sweetiekit-dom');
SWEET.window = window = (typeof window === 'undefined') ? SweetieKitDOM() : window;

SWEET.kit = SWEET.kit || SweetieKit;
SWEET.dom = SWEET.dom || SweetieKitDOM;

SWEET.getConfig = () =>
  (typeof __DEV__ === 'object') ? __DEV__.cfg :
  (typeof __DEV__ === 'string') ? __DEV__ :
  (typeof __DEV__ === 'undefined') ? 'dev' :
  (__DEV__ ? 'dev' : 'prod'),

SWEET.FullReact = SWEET.FullReact || {};
SWEET.FullReact.getUrl = (cfg = SWEET.getConfig()) => {
  switch (cfg) {
    case 'prod': return 'https://emkolar.ninja/sweetie-react';
    case 'phone': return 'http://ios.shawwn.com:31337';
    default: return 'http://localhost:8080';
  }
}
SWEET.FullReact.refresh = async (url, cfg = SWEET.getConfig()) => {
  url = url || SWEET.FullReact.getUrl(cfg);
  window = await SWEET.dom.load(url);
  __DEV__ = cfg;
  return url;
}

SWEET.FullReact.mount = async (nav, demoVC) => {
  await SWEET.FullReact.refresh();
}

global.OnShake = () => {
//  SWEET.FullReact.refresh();
}

module.exports = async (...args) => {
  SWEET.require = Require = require;
  return await SWEET.FullReact.mount(...args);
};
