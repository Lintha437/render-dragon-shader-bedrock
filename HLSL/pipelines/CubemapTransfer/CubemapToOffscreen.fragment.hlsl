// CubemapTransfer / CubemapToOffscreen / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/CubemapTransfer/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (int)RD_UNIFORM_CURRENT_FACE.x;
  switch (workingVector0.x) {
    case 0 :    workingVector0.x = 1;
    workingVector0.yz = varyingTexCoord0.yx * float2(-2,-2) + float2(1,1);
    break;
    case 1 :    workingVector0.x = -1;
    workingVector0.yz = varyingTexCoord0.yx * float2(-2,2) + float2(1,-1);
    break;
    case 2 :    workingVector0.xz = varyingTexCoord0.xy * float2(2,2) + float2(-1,-1);
    workingVector0.y = 1;
    break;
    case 3 :    workingVector0.xz = varyingTexCoord0.xy * float2(2,-2) + float2(-1,1);
    workingVector0.y = -1;
    break;
    case 4 :    workingVector0.xy = varyingTexCoord0.xy * float2(2,-2) + float2(-1,1);
    workingVector0.z = 1;
    break;
    case 5 :    workingVector0.xy = varyingTexCoord0.xy * float2(-2,-2) + float2(1,1);
    workingVector0.z = -1;
    break;
    default :
    workingVector0.xyz = float3(0,0,0);
    break;
  }
  workingVector0.w = -1 + RD_UNIFORM_CURRENT_MIP.x;
  fragmentColor0.xyzw = materialTexture0.SampleLevel(textureSampler0, workingVector0.xyz, workingVector0.w).xyzw;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (varyingTexCoord0.x * 2.0f) + (-1.0f);
    float productValue1 = (varyingTexCoord0.y * 2.0f) + (-1.0f);
    float intermediateValue;
    float sumValue;
    float sumValue1;
    switch (uint(int(RD_UNIFORM_CURRENT_FACE.x)))
    {
        case 0u:
        {
            intermediateValue = 1.0f;
            sumValue = (-0.0f) - productValue1;
            sumValue1 = (-0.0f) - productValue;
            break;
        }
        case 1u:
        {
            intermediateValue = -1.0f;
            sumValue = (-0.0f) - productValue1;
            sumValue1 = productValue;
            break;
        }
        case 2u:
        {
            intermediateValue = productValue;
            sumValue = 1.0f;
            sumValue1 = productValue1;
            break;
        }
        case 3u:
        {
            intermediateValue = productValue;
            sumValue = -1.0f;
            sumValue1 = (-0.0f) - productValue1;
            break;
        }
        case 4u:
        {
            intermediateValue = productValue;
            sumValue = (-0.0f) - productValue1;
            sumValue1 = 1.0f;
            break;
        }
        case 5u:
        {
            intermediateValue = (-0.0f) - productValue;
            sumValue = (-0.0f) - productValue1;
            sumValue1 = -1.0f;
            break;
        }
        default:
        {
            intermediateValue = 0.0f;
            sumValue = 0.0f;
            sumValue1 = 0.0f;
            break;
        }
    }
    float4 sampledTextureValue = srcTextureCubeTexture.SampleLevel(srcTextureCubeSampler, float3(intermediateValue, sumValue, sumValue1), RD_UNIFORM_CURRENT_MIP.x + (-1.0f));
    fragmentColor0.x = sampledTextureValue.x;
    fragmentColor0.y = sampledTextureValue.y;
    fragmentColor0.z = sampledTextureValue.z;
    fragmentColor0.w = sampledTextureValue.w;
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
