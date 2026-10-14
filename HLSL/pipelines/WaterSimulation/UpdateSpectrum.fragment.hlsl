// WaterSimulation / UpdateSpectrum / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
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
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = float2(-0.5,-0.5) + varyingTexCoord0.xy;
  workingVector0.xy = RD_UNIFORM_WATER_RESOLUTION.xx * workingVector0.xy;
  workingVector0.xy = float2(6.28318548,6.28318548) * workingVector0.xy;
  workingVector0.xy = workingVector0.xy / RD_UNIFORM_WATER_PATCH_SIZE.xx;
  workingVector0.z = dot(workingVector0.xy, float2(25.9796009,156.466003));
  workingVector0.x = dot(workingVector0.xy, workingVector0.xy);
  workingVector0.x = sqrt(workingVector0.x);
  workingVector0.x = RD_UNIFORM_G.x * workingVector0.x;
  workingVector0.x = sqrt(workingVector0.x);
  workingVector0.y = sin(workingVector0.z);
  workingVector0.y = 43758.5469 * workingVector0.y;
  workingVector0.y = frac(workingVector0.y);
  workingVector0.x = workingVector0.x * workingVector0.y;
  workingVector0.x = RD_UNIFORM_WATER_SIM_TIME.x * workingVector0.x;
  workingVector0.y = 0.159154937 * workingVector0.x;
  workingVector0.y = floor(workingVector0.y);
  workingVector0.x = -workingVector0.y * 6.28318548 + workingVector0.x;
  sincos(workingVector0.x, workingVector0.x, workingVector1.x);
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.y = workingVector2.y * workingVector0.x;
  workingVector0.y = workingVector2.x * workingVector1.x + -workingVector0.y;
  workingVector0.z = workingVector2.w * -workingVector0.x;
  workingVector0.z = workingVector2.z * workingVector1.x + -workingVector0.z;
  fragmentColor0.x = workingVector0.y + workingVector0.z;
  workingVector0.yz = workingVector2.yw * workingVector1.xx;
  workingVector0.y = workingVector2.x * workingVector0.x + workingVector0.y;
  workingVector0.x = workingVector2.z * -workingVector0.x + workingVector0.z;
  fragmentColor0.y = workingVector0.y + workingVector0.x;
  fragmentColor0.zw = float2(0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue = simTextureTexture.Sample(simTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = RD_UNIFORM_WATER_RESOLUTION.x * 6.283185482025146484375f;
    float quotientValue = (productValue * (varyingTexCoord0.x + (-0.5f))) / RD_UNIFORM_WATER_PATCH_SIZE.x;
    float quotientValue1 = (productValue * (varyingTexCoord0.y + (-0.5f))) / RD_UNIFORM_WATER_PATCH_SIZE.x;
    float dotProductValue = (sqrt(RD_UNIFORM_G.x * sqrt((quotientValue1 * quotientValue1) + (quotientValue * quotientValue))) * frac(sin(dot(float2(quotientValue, quotientValue1), float2(25.9796009063720703125f, 156.46600341796875f))) * 43758.546875f)) * RD_UNIFORM_WATER_SIM_TIME.x;
    float productValue1 = dotProductValue - (floor(dotProductValue * 0.15915493667125701904296875f) * 6.283185482025146484375f);
    float wavePhaseValue = sin(productValue1);
    float wavePhaseValue1 = cos(productValue1);
    float sumValue = (-0.0f) - wavePhaseValue;
    fragmentColor0.x = (((-0.0f) - (scalarValue3 * sumValue)) - (scalarValue1 * wavePhaseValue)) + (wavePhaseValue1 * (scalarValue2 + scalarValue));
    fragmentColor0.y = ((scalarValue2 * sumValue) + (wavePhaseValue * scalarValue)) + (wavePhaseValue1 * (scalarValue3 + scalarValue1));
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
