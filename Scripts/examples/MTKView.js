const SweetieKit = process._linkedBinding('sweetiekit');

const {
  MTKView,
} = SweetieKit;

FPSTotalFrames = 0;
FPSCurrentSecond = 0;
FPSCurrentFrames = 0;
FPSCurrent = 0;

FPSUpdate = function FPSUpdate() {
  ++FPSTotalFrames;
  ++FPSCurrentFrames;
  const thisSecond = Math.floor(CACurrentMediaTime());
  if (thisSecond !== FPSCurrentSecond) {
    FPSCurrent = FPSCurrentFrames;
    FPSCurrentFrames = 0;
    FPSCurrentSecond = thisSecond;
    console.log(`FPS: ${FPSCurrent}`);
  }
  return FPSCurrent;
};

FPSGet = function FPSGet() {
  return FPSCurrent;
}

CameraController = class CameraController {
  constructor() {
    this._matTranslate = new THREE.Matrix4();
    this._matRotAltitude = new THREE.Matrix4();
    this._matRotAzimuth = new THREE.Matrix4();
    this._axis = new THREE.Vector3();
    this._dirty = true;

    this.radius = 1.5;
    this.sensitivity = 0.01;
    this.minAltitude = -Math.PI / 4.0;
    this.maxAltitude = Math.PI / 2.0;
    this.altitude = 0.0;
    this.azimuth = 0.0;
    this.lastPoint = CGPointMake(0, 0);
  }

  get viewMatrix() {
    if (this._dirty) {
      this._view = this._matTranslate.makeTranslation(0, 0, -this.radius)
        .multiply(this._matRotAltitude.makeRotationAxis(this._axis.set(1, 0, 0), this.altitude))
        .multiply(this._matRotAzimuth.makeRotationAxis(this._axis.set(0, 1, 0), this.azimuth));
      this._dirty = false;
    }
    return this._view;
  }

  startedInteraction({x, y}) {
    this.lastPoint = CGPointMake(x, y);
  }

  dragged({x, y}) {
    const deltaX = (this.lastPoint.x - x);
    const deltaY = (this.lastPoint.y - y);
    this.azimuth += -deltaX * this.sensitivity;
    this.altitude += -deltaY * this.sensitivity;
    this.altitude = Math.min(Math.max(this.minAltitude, this.altitude), this.maxAltitude);
    this._dirty = true;
    this.lastPoint = CGPointMake(x, y);
  }
};

ProjectionController = class ProjectionController {
  constructor() {
    this.width = 1.0;
    this.height = 1.0;
    this.znear = 0.1;
    this.zfar = 1000.0;
    this.fov = Math.PI / 3;
    this._projectionMatrix = new THREE.Matrix4();
  }

  update(projectionMatrix = this._projectionMatrix) {
    let aspect = (this.width / this.height);
    let fovRadians = this.fov;
    let nearZ = this.znear;
    let farZ = this.zfar;

    let yScale = 1.0 / Math.tan(fovRadians * 0.5);
    let xScale = yScale / aspect;
    let zRange = farZ - nearZ;
    let zScale = -(farZ + nearZ) / zRange;
    let wzScale = -2 * farZ * nearZ / zRange;

    let xx = xScale;
    let yy = yScale;
    let zz = zScale;
    let zw = -1.0;
    let wz = wzScale;

    projectionMatrix.set(
      xx, 0, 0, 0,
      0, yy, 0, 0,
      0, 0, zz, zw,
      0, 0, wz, 1);
    return projectionMatrix;
  }

  get projectionMatrix() {
    return this.update();
  }
};


VertexBufferIndex = {
  attributes: 0,
  uniforms: 1,
};

FragmentBufferIndex = {
  uniforms: 0,
  texture: 1,
};

Uniforms = class Uniforms {
  constructor()
  {
    this._values = new Float32Array([
      1, 0, 0, 0,
      0, 1, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 1,
      1, 1, 1, 1,
    ]);
  }

  set modelViewProjectionMatrix(value) {
    let i = 0;
    let j = i + 16;
    value = value.elements ? value.elements : value;
    for (; i < j; i++) {
      this._values[i] = value[i];
    }
  }

  set color(value) {
    let i = 16;
    let j = i + 4;
    value = [value.red, value.green, value.blue, value.alpha];
    for (; i < j; i++) {
      this._values[i] = value[i-16];
    }
  }

  get buffer() {
    return this._values.buffer;
  }

  get length() {
    return this._values.byteLength;
  }
};

MTKViewExample = typeof MTKViewExample !== 'undefined' ? MTKViewExample : function MTKViewExample(...args) {
  this.init(...args);
};

MTKViewExample.prototype.init = function(opts = {
  device: MTLCreateSystemDefaultDevice(),
}) {
  if (!opts.device) {
    throw new Error("device is null");
  }
  this.opts = { ...opts };
};

MTKViewExample.prototype.getDevice = function() {
  return this.opts.device;
};

MTKRegionMake = (x, y, z, width, height, depth) => {
  return {
    origin: { x, y, z },
    size: { width, height, depth },
  }
};

MTKViewExample.prototype.makeTexture = function(image, width, height, region = MTKRegionMake(0, 0, 0, width, height, 1), device = this.getDevice()) {
  const textureDescriptor = MTLTextureDescriptor();
  textureDescriptor.pixelFormat = MTLPixelFormatBGRA8Unorm;
  textureDescriptor.width = width;
  textureDescriptor.height = height;
  const texture = device.newTextureWithDescriptor(textureDescriptor);

  this.updateTexture(texture, image, width, height, region);

  return texture;
};

MTKViewExample.prototype.updateTexture = function(texture, image, width, height, region = MTKRegionMake(0, 0, 0, width, height, 1)) {
  texture.replaceRegionMipmapLevelWithBytesBytesPerRow(region, 0, image, 4*width);
  return texture;
};

MTKViewExample.prototype.makeDescriptor = function() {
  const vertexDescriptor = MDLVertexDescriptor();
  vertexDescriptor.addOrReplaceAttribute(
    MDLVertexAttribute.alloc().initWithNameFormatOffsetBufferIndex(
      MDLVertexAttributePosition, MDLVertexFormatFloat3, 0, 0));
  vertexDescriptor.addOrReplaceAttribute(
    MDLVertexAttribute.alloc().initWithNameFormatOffsetBufferIndex(
      MDLVertexAttributeTextureCoordinate, MDLVertexFormatFloat2, 4*3, 0));
  const mtlVertexDescriptor = MTKMetalVertexDescriptorFromModelIOWithError(vertexDescriptor);
  mtlVertexDescriptor.layouts.objectAtIndexedSubscript(VertexBufferIndex.attributes).stride = 5*4;
  return mtlVertexDescriptor;
};

MTKView_make = async function make(nav, demoVC) {
  if (!MTKViewExample.instance) {
    MTKViewExample.instance = new MTKViewExample();
  }

  device = MTKViewExample.instance.getDevice();
  cam = new CameraController();
  cam.radius = 1.5;
  proj = new ProjectionController();
  uniforms = new Uniforms();
  mvp = new THREE.Matrix4();
  uniforms.modelViewProjectionMatrix = mvp.set(...proj.projectionMatrix.elements).multiply(cam.viewMatrix);

  view = demoVC.view;
  const frame = {...view.frame};
  /*
  if (frame.width > 512) {
    frame.width = 512;
  }
  if (frame.height > 512) {
    frame.height = 512;
  }
  */
  mtkView = MTKView(frame, device);

  mtkView.touchesBeganWithEvent = (touches, event) => {
    touches = Array.from(touches);
    const pt = touches[0].locationInView(touches[0].view);
    cam.startedInteraction(pt);
  };

  mtkView.touchesMovedWithEvent = (touches, event) => {
    touches = Array.from(touches);
    const pt = touches[0].locationInView(touches[0].view);
    cam.dragged(pt);
    proj.width = touches[0].view.bounds.width;
    proj.height = touches[0].view.bounds.height;
    uniforms.modelViewProjectionMatrix = mvp.set(...proj.projectionMatrix.elements).multiply(cam.viewMatrix);
    //console.log(cam.altitude, cam.azimuth, cam.viewMatrix);
  };

  //mtkView.device = device;
  mtkView.clearColor = /*MTLClearColorMake*/ UIColor(0.3, 0.3, 0.3, 1.0);
  mtkView.colorPixelFormat = MTLPixelFormatBGRA8Unorm;
  //mtkView.depthStencilPixelFormat = MTLPixelFormatDepth32Float;
  mtkView.sampleCount = 1;

  mtkImageWidth = 64;
  mtkImageHeight = 64;
  mtkImage = new Uint8ClampedArray(4*mtkImageWidth*mtkImageHeight);

  mtkImageRegen = () => {
    const h = mtkImageHeight;
    const w = mtkImageWidth;
    for (let y = 0; y < h; y++) {
      for (let x = 0; x < w; x++) {
        const i = 4*(y*h + x);
        const v = Math.random();
        mtkImage[i+0] = 0xFF * v;
        mtkImage[i+1] = 0xFF * v;
        mtkImage[i+2] = 0xFF * v;
        mtkImage[i+3] = 0xFF;
      }
    }
  };
  mtkImageRegen();
  if (typeof mtkImageInterval !== 'undefined') {
    clearInterval(mtkImageInterval);
    delete mtkImageInterval;
  };
  mtkImageInterval = setInterval(() => { mtkImageRegen(); }, 1000 / 60);

  mtkTexture = MTKViewExample.instance.makeTexture(mtkImage, mtkImageWidth, mtkImageHeight);

  mtkView.delegate = MTKViewDelegate({
    mtkViewDrawableSizeWillChange(mtkView, size) {
      console.log('mtkViewDrawableSizeWillChange', mtkView, size);
      proj.width = size.width;
      proj.height = size.height;
      uniforms.modelViewProjectionMatrix = mvp.set(...proj.projectionMatrix.elements).multiply(cam.viewMatrix);
    },
    drawInMTKView(mtkView) {
      FPSUpdate();
      const drawable = mtkView.currentDrawable;
      if (drawable && drawable.texture && mtkView.currentRenderPassDescriptor) {
        const region = MTKRegionMake(0, 0, 0, mtkImageWidth, mtkImageHeight, 1);
        mtkTexture.replaceRegionMipmapLevelWithBytesBytesPerRow(region, 0, mtkImage, mtkImageWidth*4);
        const renderPassDescriptor = mtkView.currentRenderPassDescriptor;
        uniforms.color = UIColor(Math.random(), Math.random(), Math.random(), 1.0);
        renderPassDescriptor.colorAttachments.objectAtIndexedSubscript(0).texture = drawable.texture;
        renderPassDescriptor.colorAttachments.objectAtIndexedSubscript(0).loadAction = MTLLoadActionClear;
        renderPassDescriptor.colorAttachments.objectAtIndexedSubscript(0).clearColor = /*MTLClearColor*/ RGB(0, 104, 55, 1.0);
        const commandBuffer = commandQueue.commandBuffer();
        renderEncoder = commandBuffer.renderCommandEncoderWithDescriptor(renderPassDescriptor);
        renderEncoder.setRenderPipelineState(pipelineState);
        renderEncoder.setVertexBytesLengthAtIndex(uniforms.buffer, uniforms.length, VertexBufferIndex.uniforms);
        renderEncoder.setFragmentBytesLengthAtIndex(uniforms.buffer, uniforms.length, FragmentBufferIndex.uniforms);
        renderEncoder.setFragmentTextureAtIndex(mtkTexture, FragmentBufferIndex.texture);
        renderEncoder.setVertexBufferWithOffsetAtIndex(vertexBuffer, 0, 0);
        renderEncoder.drawPrimitivesVertexStartVertexCountInstanceCount(MTLPrimitiveTypeTriangle, 0, vertexBuffer.length, 1);
        renderEncoder.endEncoding();
        commandBuffer.presentDrawable(drawable);
        commandBuffer.commit();
      }
    },
  });

  metalLibrary = device.newLibraryWithSourceOptionsError(`
  
#include <metal_stdlib>
using namespace metal;

enum {
    vertexBufferIndexUniforms = 1
};

enum {
    fragmentBufferIndexUniforms = 0,
    fragmentBufferIndexTexture = 1
};

struct Uniforms {
  //float4x4 modelMatrix;
  float4x4 modelViewProjectionMatrix;
  float4 color;
  //float3x3 normalMatrix;
  //float3 cameraPos;
  //float3 directionalLightInvDirection;
  //float3 lightPosition;
};

struct Vertex {
    float3 position  [[attribute(0)]];
    //float3 normal    [[attribute(1)]];
    //float3 tangent   [[attribute(2)]];
    //float2 texCoords [[attribute(3)]];
    float2 texCoords [[attribute(1)]];
};

struct VertexOut {
    float4 position [[position]];
    float2 texCoords;
    float3 worldPos;
    float3 normal;
    float3 bitangent;
    float3 tangent;
};

vertex VertexOut basic_vertex(
  const device packed_float3* vertex_array [[ buffer(0) ]],
  unsigned int vid [[ vertex_id ]],
  constant Uniforms &uniforms [[buffer(vertexBufferIndexUniforms)]])
{
  VertexOut out;
  //out.position = uniforms.modelViewProjectionMatrix * float4(in.position, 1.0);
  out.position = uniforms.modelViewProjectionMatrix * float4(vertex_array[vid], 1.0);
  //out.position = float4(vertex_array[vid], 1.0);
  return out;
}

fragment half4 basic_fragment(VertexOut in                     [[stage_in]],
                             constant Uniforms &uniforms      [[buffer(fragmentBufferIndexUniforms)]])
{
  return half4(uniforms.color);
}

vertex VertexOut vertex_main(Vertex in [[stage_in]],
                             constant Uniforms &uniforms [[buffer(vertexBufferIndexUniforms)]])
{
    VertexOut out;
    out.position = uniforms.modelViewProjectionMatrix * float4(in.position, 1.0);
    out.texCoords = in.texCoords;
    //out.normal = uniforms.normalMatrix * in.normal;
    //out.tangent = uniforms.normalMatrix * in.tangent;
    //out.bitangent = uniforms.normalMatrix * cross(in.normal, in.tangent);
    //out.worldPos = (uniforms.modelMatrix * float4(in.position, 1.0)).xyz;
    return out;
}

fragment half4 fragment_main(VertexOut in                     [[stage_in]],
                             constant Uniforms &uniforms      [[buffer(fragmentBufferIndexUniforms)]],
                             texture2d<half> colorTexture     [[texture(fragmentBufferIndexTexture)]])
{
  constexpr sampler textureSampler (mag_filter::linear,
                                    min_filter::linear);

  const half4 diffuseColor = colorTexture.sample(textureSampler, in.texCoords);
  const half4 lightColor = 0.5 + half4(uniforms.color);
  const half4 resultColor = diffuseColor * lightColor;
  return resultColor;
}
`, MTLCompileOptions());

  //fragmentProgram = metalLibrary.newFunctionWithName("basic_fragment");
  //vertexProgram = metalLibrary.newFunctionWithName("basic_vertex");
  fragmentProgram = metalLibrary.newFunctionWithName("fragment_main");
  vertexProgram = metalLibrary.newFunctionWithName("vertex_main");

  pipelineStateDescriptor = MTLRenderPipelineDescriptor();
  pipelineStateDescriptor.vertexFunction = vertexProgram;
  pipelineStateDescriptor.fragmentFunction = fragmentProgram;
  pipelineStateDescriptor.colorAttachments.objectAtIndexedSubscript(0).pixelFormat = MTLPixelFormatBGRA8Unorm;
  vertexDescriptor = MTKViewExample.instance.makeDescriptor();
  pipelineStateDescriptor.vertexDescriptor = vertexDescriptor;

  pipelineState = device.newRenderPipelineStateWithDescriptorError(pipelineStateDescriptor);

  vertexData = new Float32Array([
    -1.0, +1.0, 0.0,   -0.0, +1.0,
    -1.0, -1.0, 0.0,   -0.0, -0.0,
    +1.0, -1.0, 0.0,   +1.0, -0.0,

    -1.0, +1.0, 0.0,   -0.0, +1.0,
    +1.0, -1.0, 0.0,   +1.0, -0.0,
    +1.0, +1.0, 0.0,   +1.0, +1.0,
  ]);
  vertexBuffer = device.newBufferWithBytesLengthOptions(vertexData.buffer, vertexData.length * 4, 0);

  commandQueue = device.newCommandQueue();
  view.addSubview(mtkView);
  mtkView.pinToSuperview();
};

module.exports = (...args) => MTKView_make(...args);
