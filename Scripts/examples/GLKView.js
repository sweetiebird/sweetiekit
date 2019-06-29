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
      // glClearColor(0.85, 0.85, 0.85, 1.0)
      // glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
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
