module.exports = (nav, demoVC) => {
  Nav = nav;
  VC = demoVC;
  Require = require;
  win=(skdom = require('sweetiekit-dom')).load('http://localhost:8080');
  global.SweetieKitEnums = require('../enums');
};
