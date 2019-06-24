module.exports = (nav, demoVC) => {
  Nav = nav;
  VC = demoVC;
  Require = require;
  if (__DEV__) {
    win=(skdom = require('sweetiekit-dom')).load('http://localhost:8080');
  } else {
    win=(skdom = require('sweetiekit-dom')).load('https://emkolar.ninja/sweetie-react');
  }
  __PLATFORM__ = 'ios';
};
