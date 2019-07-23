const SweetieKit = process._linkedBinding('sweetiekit');

const {
  EAGLContext,
  GLKView,
  GLKViewDelegate,
  GLKViewController,
  GLKViewControllerDelegate,
  WebGLRenderingContext,
} = SweetieKit;

GLKView_checkError = function (msg = '') {
  const error = gl.getError();
  if (error !== gl.NO_ERROR) {
    let errorName = null;
    for (let k in gl) {
      if (gl[k] === error) {
        errorName = k;
        break;
      }
    }
    if (!errorName) {
      errorName = 'UNKNOWN_ERROR';
    }
    console.warn(`WebGL error: ${errorName} ${msg}`);
    return true;
  }
  return false;
}

GLKView_checkShader = function (shader, msg='') {
  var message = gl.getShaderInfoLog(shader);

  if (message.length > 0) {
    /* message may be an error or a warning */
    console.warn(`WebGL shader error: ${message} ${msg}`);
    return true;
  }
  if (GLKView_checkError(msg)) {
    return true;
  }
  return false;
}

GLKView_checkProgram = function (program, msg='') {
  var message = gl.getProgramInfoLog(program);

  if (message.length > 0) {
    /* message may be an error or a warning */
    console.warn(`WebGL program error: ${message} ${msg}`);
    return true;
  }
  if (GLKView_checkError(msg)) {
    return true;
  }
  return false;
}

GLKView_setupProgram = function GLKView_setupProgram() {
  if (GLKView_checkError('start')) {
    return;
  }
  const vertShader = gl.createShader(gl.VERTEX_SHADER);
  if (GLKView_checkError('create vertex shader')) {
    return;
  }
  gl.shaderSource(vertShader, `
attribute vec3 c;
void main(void){
  gl_Position=vec4(c, 1.0);
}
`);
  if (GLKView_checkError('upload vertex shader')) {
    return;
  }
  gl.compileShader(vertShader);
  if (GLKView_checkShader(vertShader, 'compile vertex shader')) {
    return;
  }
  const fragShader = gl.createShader(gl.FRAGMENT_SHADER);
  if (GLKView_checkError('create fragment shader')) {
    return;
  }
  gl.shaderSource(fragShader, `
void main(void){
  gl_FragColor=vec4(0.0,1.0,1.0,1.0);
}
`);
  if (GLKView_checkError('upload fragment shader')) {
    return;
  }
  gl.compileShader(fragShader);
  if (GLKView_checkShader(fragShader, 'compile fragment shader')) {
    return;
  }
  const prog = gl.createProgram();
  if (GLKView_checkError('create program')) {
    return;
  }
  gl.attachShader(prog, vertShader);
  if (GLKView_checkError('attach vertex shader')) {
    return;
  }
  gl.attachShader(prog, fragShader);
  if (GLKView_checkError('attach fragment shader')) {
    return;
  }
  gl.linkProgram(prog);
  if (GLKView_checkProgram(prog, 'link program')) {
    return;
  }
  GLKView_vertShader = vertShader;
  GLKView_fragShader = fragShader;
  GLKView_prog = prog;
  return prog;
}

GLKView_setupBuffers = function () {
  if (GLKView_checkError('setupBuffers preamble')) {
    return;
  }
  const vertexBuf = gl.createBuffer();
  if (GLKView_checkError('createBuffer')) {
    return;
  }
  gl.bindBuffer(gl.ARRAY_BUFFER, vertexBuf);
  if (GLKView_checkError('bindBuffer')) {
    return;
  }
  gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([ -0.5,0.5,0.0,  -0.5,-0.5,0.0,  0.5,-0.5,0.0 ]), gl.STATIC_DRAW);
  if (GLKView_checkError('bufferData')) {
    return;
  }

  const coord = gl.getAttribLocation(GLKView_prog, "c");
  if (GLKView_checkError('getAttribLocation')) {
    return;
  }
  gl.vertexAttribPointer(coord, 3, gl.FLOAT, false, 0, 0);
  if (GLKView_checkError('vertexAttribPointer')) {
    return;
  }
  gl.enableVertexAttribArray(coord);
  if (GLKView_checkError('enableVertexAttribArray')) {
    return;
  }

  GLKView_vertexBuf = vertexBuf;
  GLKView_coord = coord;
  return vertexBuf;
}

GLKView_setup = function() {
  if (!GLKView_setupProgram()) {
    return false;
  }
  if (!GLKView_setupBuffers()) {
    return false;
  }
  return true;
}

GLKView_shouldSetup = true;

GLKView_draw = function GLKView_draw(view, rect) {
  if (GLKView_checkError('draw')) {
    return;
  }
  if (GLKView_shouldSetup) {
    if (!GLKView_setup()) {
      console.warn("GLKView_setup failed");
      return;
    }
    GLKView_shouldSetup = false;
  }
  gl.viewport(0,0,rect.width,rect.height);
  gl.clearColor(0.85, 0.05, 0.85, 1.0);
  gl.clear(gl.COLOR_BUFFER_BIT);
  gl.useProgram(GLKView_prog);
  
  gl.bindBuffer(gl.ARRAY_BUFFER, GLKView_vertexBuf);
  gl.enableVertexAttribArray(GLKView_coord);
  gl.drawArrays(gl.TRIANGLES, 0, 3);
}

GLKView_setupContext = function GLKView_setupContext() {
  const EAGLContext = SweetieKit.EAGLContext;
  if (EAGLContext) {
    let glContext;
    glContext = EAGLContext.alloc().initWithAPI(kEAGLRenderingAPIOpenGLES3);
    if (glContext) {
      glContext.version = 3;
      return glContext;
    }
    glContext = EAGLContext.alloc().initWithAPI(kEAGLRenderingAPIOpenGLES2);
    if (glContext) {
      glContext.version = 2;
      return glContext;
    }
    glContext = EAGLContext.alloc().initWithAPI(kEAGLRenderingAPIOpenGLES1);
    if (glContext) {
      glContext.version = 1;
      return glContext;
    }
  }
  const NSOpenGLContext = SweetieKit.NSOpenGLContext;
  if (NSOpenGLContext) {
    const attrs = [NSOpenGLPFADoubleBuffer, NSOpenGLPFADepthSize, 32, 0];
    const format = NSOpenGLPixelFormat.alloc().initWithAttributes(attrs);
    const context = NSOpenGLContext.alloc().initWithFormatShareContext(format, null);
    return context;
  }
}

NSOpenGLView_make = function NSOpenGLView_make(glContext) {
  //gl = new SweetieKit.WebGLRenderingContext();
  glkVC = UIViewController();
  glkView = glkVC.view;
  glkView.context = glContext;
  return glkVC;
}

GLKView_make = function GLKView_make() {
  glContext = GLKView_setupContext();
  if (!glContext) {
    return;
  }
  if (glContext.className === "NSOpenGLContext") {
    return NSOpenGLView_make(glContext);
  }
  GLKView_shouldSetup = true;
  gl = new SweetieKit.WebGLRenderingContext();
  glkVC = GLKViewController();
  glkView = glkVC.view;
  glkView.context = glContext;
  glkView.delegate = GLKViewDelegate({
    glkViewDrawInRect(...args) {
      return GLKView_draw(...args);
    }
  });
  return glkVC;
}

module.exports = () => {
  return GLKView_make();
};
