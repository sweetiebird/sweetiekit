const SweetieKit = require('std:sweetiekit.node');

const {
  EAGLContext,
  GLKView,
  GLKViewDelegate,
  GLKViewController,
  GLKViewControllerDelegate,
} = SweetieKit;

function initGL() {
  glContext = EAGLContext.alloc().initWithAPI(kEAGLRenderingAPIOpenGLES1);
  if (!glContext) {
    return;
  }

  glkVC = GLKViewController();
  glkView = glkVC.view;
  glkView.context = glContext;
  glkView.delegate = GLKViewDelegate({
    glkViewDrawInRect(view, rect) {
      console.log('glkViewDrawInRect', view, rect);
      //gl.clearColor(0.85, 0.05, 0.85, 1.0);
      //gl.clear(gl.COLOR_BUFFER_BIT);
      // ....
    }
  });
  return glkVC;
}

module.exports = () => {
  glkVC = initGL();
  setTimeout(() => {
    UIApplication().keyWindow.rootViewController = glkVC;
  }, 500);
};
