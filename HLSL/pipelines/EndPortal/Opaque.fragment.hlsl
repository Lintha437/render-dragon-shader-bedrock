// EndPortal / Opaque / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/EndPortal/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  linear centroid float2 varyingTexCoord0 : TEXCOORD0,
  linear centroid float2 varyingTexCoord1 : TEXCOORD1,
  float varyingTexCoord2 : TEXCOORD2,
  float4 varyingColor0 : COLOR0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
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
  fragmentColor0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
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
    fragmentColor0.x = productValue1;
    fragmentColor0.y = productValue2;
    fragmentColor0.z = productValue3;
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
