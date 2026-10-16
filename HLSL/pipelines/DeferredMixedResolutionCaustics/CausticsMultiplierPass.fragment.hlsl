// DeferredMixedResolutionCaustics / CausticsMultiplierPass / fragment forward pipeline.
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


#include "../../include/materials/DeferredMixedResolutionCaustics/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  if (workingVector0.x != 0) {
    workingVector0.xy = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xy;
    workingVector0.z = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).x;
    workingVector0.w = RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x;
    workingVector1.x = RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y;
    workingVector0.z = workingVector0.z * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
    workingVector0.w = workingVector0.w / workingVector0.z;
    workingVector1.x = workingVector1.x / workingVector0.z;
    workingVector0.z = RD_UNIFORM_INV_PROJ_ROW_3.z / workingVector0.z;
    workingVector1.xy = RD_UNIFORM_INV_VIEW_ROW_1.xz * workingVector1.xx;
    workingVector1.xy = RD_UNIFORM_INV_VIEW_ROW_0.xz * workingVector0.ww + workingVector1.xy;
    workingVector0.zw = RD_UNIFORM_INV_VIEW_ROW_2.xz * workingVector0.zz + workingVector1.xy;
    workingVector0.zw = RD_UNIFORM_INV_VIEW_ROW_3.xz + workingVector0.zw;
    workingVector1.xyz = float3(1,1,1) + -abs(workingVector0.xyx);
    workingVector2.z = workingVector1.x + -abs(workingVector0.y);
    workingVector1.x = RD_COMPARISON_MASK(workingVector2.z < 0);
    workingVector3.xy = RD_COMPARISON_MASK(workingVector0.xy >= float2(0,0));
    workingVector3.xy = workingVector3.xy ? float2(1,1) : 0;
    workingVector3.xy = workingVector3.xy * float2(2,2) + float2(-1,-1);
    workingVector1.yz = workingVector3.xy * workingVector1.yz;
    workingVector2.xy = workingVector1.xx ? workingVector1.yz : workingVector0.xy;
    workingVector0.x = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector0.x = rsqrt(workingVector0.x);
    workingVector1.xyz = workingVector2.xyz * workingVector0.xxx;
    workingVector0.x = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.x = rsqrt(workingVector0.x);
    workingVector0.x = saturate(workingVector1.y * workingVector0.x);
    workingVector0.yz = -RD_UNIFORM_WORLD_ORIGIN.xz + workingVector0.zw;
    workingVector1.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector0.yz;
    workingVector1.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
    workingVector0.y = materialTexture6.Sample(textureSampler6, workingVector1.xyz).x;
    workingVector0.y = workingVector0.y + workingVector0.y;
    workingVector0.x = workingVector0.y * workingVector0.x;
    workingVector0.x = log2(workingVector0.x);
    workingVector0.x = RD_UNIFORM_CAUSTICS_PARAMETERS.z * workingVector0.x;
    workingVector0.x = exp2(workingVector0.x);
    workingVector0.y = 1 + RD_UNIFORM_CAUSTICS_PARAMETERS.z;
    workingVector0.x = workingVector0.x * workingVector0.y;
  } else {
    workingVector0.x = 1;
  }
  fragmentColor0.x = workingVector0.x;
  fragmentColor0.yzw = float3(1,1,1);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = normalTexture.Sample(normalSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float4 sampledTextureValue1 = sceneDepthTexture.Sample(sceneDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = (sampledTextureValue1.x * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue = (RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x) / productValue;
    float quotientValue1 = (RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y) / productValue;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue;
    float sumValue = 1.0f - abs(scalarValue);
    float scalarValue2 = abs(scalarValue1);
    float sumValue1 = sumValue - scalarValue2;
    bool conditionValue = sumValue1 < 0.0f;
    float comparisonValue = conditionValue ? ((1.0f - scalarValue2) * ((scalarValue < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue;
    float comparisonValue1 = conditionValue ? (sumValue * ((scalarValue1 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue1;
    float inverseLengthValue = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue1), float3(comparisonValue, comparisonValue1, sumValue1)));
    float productValue1 = comparisonValue * inverseLengthValue;
    float productValue2 = comparisonValue1 * inverseLengthValue;
    float productValue3 = inverseLengthValue * sumValue1;
    float inverseLengthValue1 = rsqrt(dot(float3(productValue1, productValue2, productValue3), float3(productValue1, productValue2, productValue3)));
    float sampledTextureValue2;
    if ((RD_UNIFORM_CAUSTICS_PARAMETERS.x != 0.0f) && (RD_UNIFORM_CAUSTICS_PARAMETERS.w != 0.0f))
    {
        sampledTextureValue2 = exp2(log2((causticsTextureTexture.Sample(causticsTextureSampler, float3(((mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x) - RD_UNIFORM_WORLD_ORIGIN.x) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, ((mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z) - RD_UNIFORM_WORLD_ORIGIN.z) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y)).x * 2.0f) * clamp(dot(float3(0.0f, 1.0f, 0.0f), float3(inverseLengthValue1 * productValue1, productValue2 * inverseLengthValue1, inverseLengthValue1 * productValue3)), 0.0f, 1.0f)) * RD_UNIFORM_CAUSTICS_PARAMETERS.z) * (RD_UNIFORM_CAUSTICS_PARAMETERS.z + 1.0f);
    }
    else
    {
        sampledTextureValue2 = 1.0f;
    }
    fragmentColor0.x = sampledTextureValue2;
    fragmentColor0.y = 1.0f;
    fragmentColor0.z = 1.0f;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
