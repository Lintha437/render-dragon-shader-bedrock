// WaterSimulation / VerticalFFT / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/WaterSimulation/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = 0.5 * RD_UNIFORM_STOCKHAM_FFT_SUB_TRANSFORM_SIZE.x;
  workingVector1.xy = RD_UNIFORM_WATER_RESOLUTION.xx * varyingTexCoord0.xy;
  workingVector0.y = workingVector1.y / workingVector0.x;
  workingVector0.y = floor(workingVector0.y);
  workingVector0.y = -workingVector0.x * workingVector0.y + workingVector1.y;
  workingVector0.z = workingVector1.y / RD_UNIFORM_STOCKHAM_FFT_SUB_TRANSFORM_SIZE.x;
  workingVector0.w = floor(workingVector0.z);
  workingVector0.z = -6.28318548 * workingVector0.z;
  sincos(workingVector0.z, workingVector2.x, workingVector3.x);
  workingVector1.z = workingVector0.w * workingVector0.x + workingVector0.y;
  workingVector1.w = RD_UNIFORM_WATER_RESOLUTION.x * 0.5 + workingVector1.z;
  workingVector0.xyzw = workingVector1.xzxw / RD_UNIFORM_VIEW_RECT.zwzw;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.zw).xyzw;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
  workingVector0.zw = workingVector2.xx * workingVector1.yx;
  workingVector0.z = workingVector3.x * workingVector1.x + -workingVector0.z;
  workingVector0.w = workingVector3.x * workingVector1.y + workingVector0.w;
  fragmentColor0.xy = workingVector0.xy + workingVector0.zw;
  fragmentColor0.zw = float2(0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = 0.5 * RD_UNIFORM_STOCKHAM_FFT_SUB_TRANSFORM_SIZE.x;
  workingVector1.xy = RD_UNIFORM_WATER_RESOLUTION.xx * varyingTexCoord0.xy;
  workingVector0.y = workingVector1.y / workingVector0.x;
  workingVector0.y = floor(workingVector0.y);
  workingVector0.y = -workingVector0.x * workingVector0.y + workingVector1.y;
  workingVector0.z = workingVector1.y / RD_UNIFORM_STOCKHAM_FFT_SUB_TRANSFORM_SIZE.x;
  workingVector0.w = floor(workingVector0.z);
  workingVector0.z = -6.28318548 * workingVector0.z;
  sincos(workingVector0.z, workingVector2.x, workingVector3.x);
  workingVector1.z = workingVector0.w * workingVector0.x + workingVector0.y;
  workingVector1.w = RD_UNIFORM_WATER_RESOLUTION.x * 0.5 + workingVector1.z;
  workingVector0.xyzw = workingVector1.xzxw / RD_UNIFORM_VIEW_RECT.zwzw;
  workingVector0.zw = materialTexture0.Sample(textureSampler0, workingVector0.zw).xy;
  workingVector0.xy = materialTexture0.Sample(textureSampler0, workingVector0.xy).xy;
  workingVector1.xy = workingVector2.xx * workingVector0.wz;
  workingVector0.z = workingVector3.x * workingVector0.z + -workingVector1.x;
  workingVector0.w = workingVector3.x * workingVector0.w + workingVector1.y;
  fragmentColor0.xy = workingVector0.xy + workingVector0.zw;
  fragmentColor0.zw = float2(0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = RD_UNIFORM_WATER_RESOLUTION.x * varyingTexCoord0.x;
    float productValue1 = RD_UNIFORM_WATER_RESOLUTION.x * varyingTexCoord0.y;
    float quotientValue = productValue1 / RD_UNIFORM_STOCKHAM_FFT_SUB_TRANSFORM_SIZE.x;
    float productValue2 = RD_UNIFORM_STOCKHAM_FFT_SUB_TRANSFORM_SIZE.x * 0.5f;
    float quotientValue1 = (productValue1 - (floor(productValue1 / productValue2) * productValue2)) + (productValue2 * floor(quotientValue));
    float4 sampledTextureValue = simTextureTexture.Sample(simTextureSampler, float2(productValue / RD_UNIFORM_VIEW_RECT.z, quotientValue1 / RD_UNIFORM_VIEW_RECT.w));
    float4 sampledTextureValue1 = simTextureTexture.Sample(simTextureSampler, float2(productValue / RD_UNIFORM_VIEW_RECT.z, (quotientValue1 + (RD_UNIFORM_WATER_RESOLUTION.x * 0.5f)) / RD_UNIFORM_VIEW_RECT.w));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float productValue3 = quotientValue * (-6.283185482025146484375f);
    float wavePhaseValue = sin(productValue3);
    float wavePhaseValue1 = cos(productValue3);
    fragmentColor0.x = (sampledTextureValue.x - (wavePhaseValue * scalarValue1)) + (wavePhaseValue1 * scalarValue);
    fragmentColor0.y = ((wavePhaseValue * scalarValue) + sampledTextureValue.y) + (wavePhaseValue1 * scalarValue1);
    fragmentColor0.z = 0.0f;
    fragmentColor0.w = 0.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
