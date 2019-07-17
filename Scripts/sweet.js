SWEET = typeof SWEET === 'undefined' ? {} : SWEET;
if (SWEET.__PLATFORM__ == null) {
  SWEET.__PLATFORM__ = 'ios';
}
if (SWEET.__DEV__ == null) {
  SWEET.__DEV__ = 'dev';
}

SWEET.require = SWEET.require || require;
if (typeof Require !== 'undefined') {
  SWEET.Require = SWEET.Require || Require;
}
SWEET.process = process;

SweetieKit = typeof SweetieKit === 'undefined' ? SWEET.process._linkedBinding('sweetiekit') : SweetieKit;
SweetieKitDOM = SWEET.require('sweetiekit-dom');
SWEET.window = window = (typeof window === 'undefined') ? SweetieKitDOM() : window;

if (SWEET.window.SweetieKitDOM_GlobalContext) {
  SWEET.window.SweetieKitDOM_GlobalContext.WebGLRenderingContext = SweetieKit.WebGLRenderingContext
  SWEET.window.SweetieKitDOM_GlobalContext.WebGL2RenderingContext = SweetieKit.WebGL2RenderingContext
}

SWEET.kit = SWEET.kit || SweetieKit;
SWEET.dom = SWEET.dom || SweetieKitDOM;

SWEET.getConfig = () =>
  (typeof SWEET.__DEV__ === 'object') ? SWEET.__DEV__.cfg :
  (typeof SWEET.__DEV__ === 'string') ? SWEET.__DEV__ :
  (typeof SWEET.__DEV__ === 'undefined') ? 'dev' :
  (SWEET.__DEV__ ? 'dev' : 'prod'),

module.exports = SWEET;
