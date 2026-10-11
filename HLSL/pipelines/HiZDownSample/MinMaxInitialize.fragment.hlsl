// HiZDownSample / MinMaxInitialize / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/HiZDownSample/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = RD_UNIFORM_MIP_RESOLUTION_AND_RECIP_RESOLUTION.xy * varyingTexCoord0.xy;
  workingVector0.xy = RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION.zw * workingVector0.xy;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
  workingVector0.y = workingVector0.x * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
  fragmentColor0.x = 1 + -workingVector0.x;
  workingVector0.x = RD_UNIFORM_INV_PROJ_ROW_3.z / workingVector0.y;
  workingVector0.x = -RD_UNIFORM_THICKNESS.x + workingVector0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w * workingVector0.x;
  workingVector0.x = workingVector0.x * RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector0.x = workingVector0.x / workingVector0.y;
  fragmentColor0.y = 1 + -workingVector0.x;
  fragmentColor0.zw = float2(0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = RD_UNIFORM_MIP_RESOLUTION_AND_RECIP_RESOLUTION.xy * varyingTexCoord0.xy;
  workingVector0.xy = RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION.zw * workingVector0.xy;
  workingVector0.x = materialTexture0.Sample(textureSampler0, workingVector0.xy).x;
  workingVector0.y = workingVector0.x * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
  fragmentColor0.x = 1 + -workingVector0.x;
  workingVector0.x = RD_UNIFORM_INV_PROJ_ROW_3.z / workingVector0.y;
  workingVector0.x = -RD_UNIFORM_THICKNESS.x + workingVector0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w * workingVector0.x;
  workingVector0.x = workingVector0.x * RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector0.x = workingVector0.x / workingVector0.y;
  fragmentColor0.y = 1 + -workingVector0.x;
  fragmentColor0.zw = float2(0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue = previousMipTexture.Sample(previousMipSampler, float2((RD_UNIFORM_MIP_RESOLUTION_AND_RECIP_RESOLUTION.x * varyingTexCoord0.x) * RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION.z, (RD_UNIFORM_MIP_RESOLUTION_AND_RECIP_RESOLUTION.y * varyingTexCoord0.y) * RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION.w));
    float scalarValue = sampledTextureValue.x;
    float quotientValue = (RD_UNIFORM_INV_PROJ_ROW_3.z / ((scalarValue * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_THICKNESS.x;
    fragmentColor0.x = 1.0f - scalarValue;
    fragmentColor0.y = 1.0f - (((quotientValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / (quotientValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w));
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
