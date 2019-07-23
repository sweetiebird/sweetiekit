SWEET = require('../../sweet');
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
  SWEET.__DEV__ = cfg;
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
