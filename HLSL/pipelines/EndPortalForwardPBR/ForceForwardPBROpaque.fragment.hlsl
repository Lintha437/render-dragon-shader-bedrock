// EndPortalForwardPBR / ForceForwardPBROpaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/EndPortalForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  linear centroid float2 varyingTexCoord0 : TEXCOORD0,
  linear centroid float2 varyingTexCoord1 : TEXCOORD1,
  float varyingTexCoord2 : TEXCOORD2,
  float4 varyingColor0 : COLOR0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord1.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord1.xy).xyz;
#endif
  workingVector0.w = 1 + -varyingTexCoord2.x;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
#endif
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.w = 1 + -varyingColor0.w;
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector1.x = RD_COMPARISON_MASK(0.96875 < varyingTexCoord2.x);
  workingVector2.xyz = varyingColor0.xyz * varyingColor0.www;
  workingVector2.w = 1;
  workingVector0.w = 0;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  workingVector1.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.xyz;
  workingVector1.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector1.xyz;
  workingVector1.xyz = log2(workingVector1.xyz);
  workingVector1.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector1.xyz;
  workingVector1.xyz = exp2(workingVector1.xyz);
  workingVector2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyz;
  workingVector3.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector1.xyz = workingVector3.xyz ? workingVector2.xyz : workingVector1.xyz;
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
  fragmentColor0.w = workingVector0.w;
  workingVector0.xyz = log2(workingVector0.xyz);
  workingVector0.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector0.xyz;
  workingVector0.xyz = exp2(workingVector0.xyz);
  workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector0.xyz = workingVector0.www ? workingVector0.xyz : workingVector1.xyz;
  workingVector0.w = dot(workingVector0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  workingVector1.xyz = workingVector0.www + -workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_END_PORTAL_EMISSIVE_MULTIPLIER_AND_DESATURATION.yyy * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.xyz = workingVector1.xyz * RD_UNIFORM_END_PORTAL_EMISSIVE_MULTIPLIER_AND_DESATURATION.xxx + workingVector0.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = colorTextureTexture.Sample(colorTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = parallaxTextureTexture.Sample(parallaxTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue1;
    float productValue2;
    float productValue3;
    float intermediateValue;
    if ((varyingTexCoord2 * 32.0f) > 31.0f)
    {
        productValue1 = varyingColor0.x * varyingColor0.w;
        productValue2 = varyingColor0.y * varyingColor0.w;
        productValue3 = varyingColor0.z * varyingColor0.w;
        intermediateValue = 1.0f;
    }
    else
    {
        float productValue = (1.0f - varyingTexCoord2) * (1.0f - varyingColor0.w);
        productValue1 = (sampledTextureValue.x * productValue) * sampledTextureValue1.x;
        productValue2 = (sampledTextureValue.y * productValue) * sampledTextureValue1.y;
        productValue3 = (sampledTextureValue.z * productValue) * sampledTextureValue1.z;
        intermediateValue = 0.0f;
    }
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
        exponentialValue = exp2(log2(max(productValue1, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue2, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue3, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (productValue1 <= 0.040449999272823333740234375f) ? (productValue1 * 0.077399380505084991455078125f) : exp2(log2((productValue1 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue2 <= 0.040449999272823333740234375f) ? (productValue2 * 0.077399380505084991455078125f) : exp2(log2((productValue2 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue3 <= 0.040449999272823333740234375f) ? (productValue3 * 0.077399380505084991455078125f) : exp2(log2((productValue3 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
    float dotProductValue = dot(float3(exponentialValue, exponentialValue1, exponentialValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
    fragmentColor0.x = ((((dotProductValue - exponentialValue) * RD_UNIFORM_END_PORTAL_EMISSIVE_MULTIPLIER_AND_DESATURATION.y) + exponentialValue) * RD_UNIFORM_END_PORTAL_EMISSIVE_MULTIPLIER_AND_DESATURATION.x) + exponentialValue;
    fragmentColor0.y = ((((dotProductValue - exponentialValue1) * RD_UNIFORM_END_PORTAL_EMISSIVE_MULTIPLIER_AND_DESATURATION.y) + exponentialValue1) * RD_UNIFORM_END_PORTAL_EMISSIVE_MULTIPLIER_AND_DESATURATION.x) + exponentialValue1;
    fragmentColor0.z = ((((dotProductValue - exponentialValue2) * RD_UNIFORM_END_PORTAL_EMISSIVE_MULTIPLIER_AND_DESATURATION.y) + exponentialValue2) * RD_UNIFORM_END_PORTAL_EMISSIVE_MULTIPLIER_AND_DESATURATION.x) + exponentialValue2;
    fragmentColor0.w = intermediateValue;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
