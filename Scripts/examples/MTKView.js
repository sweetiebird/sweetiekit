const SweetieKit = require('std:sweetiekit.node');

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
  }
  return FPSCurrent;
}

FPSGet = function FPSGet() {
  return FPSCurrent;
}

async function make(nav, demoVC) {
  device = MTLCreateSystemDefaultDevice();
  if (!device) {
    return;
  }
  view = demoVC.view;
  mtkView = MTKView(view.frame);
  view.addSubview(mtkView);
  mtkView.pinToSuperview();

  mtkView.device = device;
  mtkView.clearColor = /*MTLClearColorMake*/ UIColor(0.3, 0.3, 0.3, 1.0);
  mtkView.colorPixelFormat = MTLPixelFormatBGRA8Unorm;
  //mtkView.depthStencilPixelFormat = MTLPixelFormatDepth32Float;
  mtkView.sampleCount = 1;

  mtkView.delegate = MTKViewDelegate({
    mtkViewDrawableSizeWillChange(mtkView, size) {
      console.log('mtkViewDrawableSizeWillChange', mtkView, size);
    },
    drawInMTKView(mtkView) {
      FPSUpdate();
      drawable = mtkView.currentDrawable;
      renderPassDescriptor = mtkView.currentRenderPassDescriptor;
      if (drawable && renderPassDescriptor) {
        renderPassDescriptor.colorAttachments.objectAtIndexedSubscript(0).texture = drawable.texture;
        renderPassDescriptor.colorAttachments.objectAtIndexedSubscript(0).loadAction = MTLLoadActionClear;
        renderPassDescriptor.colorAttachments.objectAtIndexedSubscript(0).clearColor = /*MTLClearColor*/ RGB(0, 104, 55, 1.0);
        commandBuffer = commandQueue.commandBuffer();
        renderEncoder = commandBuffer.renderCommandEncoderWithDescriptor(renderPassDescriptor);
        renderEncoder.setRenderPipelineState(pipelineState);
        renderEncoder.setVertexBufferWithOffsetAtIndex(vertexBuffer, 0, 0);
        renderEncoder.drawPrimitivesVertexStartVertexCountInstanceCount(MTLPrimitiveTypeTriangle, 0, 3, 1);
        renderEncoder.endEncoding();
        commandBuffer.presentDrawable(drawable);
        commandBuffer.commit();
      }
    },
  });

  vertexData = new Float32Array([
    0.0,  1.0, 0.0,
    -1.0, -1.0, 0.0,
    1.0, -1.0, 0.0,
  ]);
  dataSize = vertexData.length * 4;
  vertexBuffer = device.newBufferWithBytesLengthOptions(vertexData.buffer, dataSize, 0);

  metalLibrary = device.newLibraryWithSourceOptionsError(`

vertex float4 basic_vertex(
  const device packed_float3* vertex_array [[ buffer(0) ]],
  unsigned int vid [[ vertex_id ]]) {
  return float4(vertex_array[vid], 1.0);
}

fragment half4 basic_fragment() {
  return half4(1.0);
}
`, MTLCompileOptions());

  fragmentProgram = metalLibrary.newFunctionWithName("basic_fragment");
  vertexProgram = metalLibrary.newFunctionWithName("basic_vertex");

  pipelineStateDescriptor = MTLRenderPipelineDescriptor();
  pipelineStateDescriptor.vertexFunction = vertexProgram;
  pipelineStateDescriptor.fragmentFunction = fragmentProgram;
  pipelineStateDescriptor.colorAttachments.objectAtIndexedSubscript(0).pixelFormat = MTLPixelFormatBGRA8Unorm;

  pipelineState = device.newRenderPipelineStateWithDescriptorError(pipelineStateDescriptor);

  commandQueue = device.newCommandQueue();
}

module.exports = make;
