// RenderChunk / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 12
#endif


#include "../../include/materials/RenderChunk/FragmentBindings.hlsli"

#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  float4 varyingColor2 : COLOR2,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.x = RD_COMPARISON_MASK(0.5 < varyingTexCoord2.y);
  workingVector1.w = 1;
  workingVector0.w = varyingColor0.w;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyz;
#endif
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + RD_UNIFORM_FOG_COLOR.xyz;
  fragmentColor0.w = workingVector0.w;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
  return;
}
#elif RD_FEATURE_SEASONS == RD_ON || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  float4 varyingColor2 : COLOR2,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_FEATURE_SEASONS == RD_OFF || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingColor0.xy).xyzw;
  workingVector0.xyz = workingVector0.xyz * float3(2,2,2) + float3(-1,-1,-1);
  workingVector0.xyz = varyingColor0.zzz * workingVector0.xyz + float3(1,1,1);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector0.xyz;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + RD_UNIFORM_FOG_COLOR.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
  fragmentColor0.w = 1;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = materialTexture2.Sample(textureSampler2, varyingColor0.xy).xyz;
  workingVector0.xyz = workingVector0.xyz * float3(2,2,2) + float3(-1,-1,-1);
  workingVector0.xyz = varyingColor0.zzz * workingVector0.xyz + float3(1,1,1);
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector0.xyz;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyz;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + RD_UNIFORM_FOG_COLOR.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
  fragmentColor0.w = 1;
  return;
#elif RD_FEATURE_SEASONS == RD_OFF
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = scalarValue * varyingColor0.x;
    float productValue1 = scalarValue1 * varyingColor0.y;
    float productValue2 = scalarValue2 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue4;
    if (varyingTexCoord2.y > 0.5f)
    {
        productValue3 = (((productValue - scalarValue) * scalarValue3) + scalarValue) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue1) * scalarValue3) + scalarValue1) * varyingColor0.w;
        productValue5 = (((productValue2 - scalarValue2) * scalarValue3) + scalarValue2) * varyingColor0.w;
        intermediateValue4 = 1.0f;
    }
    else
    {
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue2;
        intermediateValue4 = varyingColor0.w;
    }
    float4 sampledTextureValue1 = lightMapTextureTexture.Sample(lightMapTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue6 = sampledTextureValue1.x * productValue3;
    float productValue7 = sampledTextureValue1.y * productValue4;
    float productValue8 = sampledTextureValue1.z * productValue5;
    fragmentColor0.x = ((RD_UNIFORM_FOG_COLOR.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((RD_UNIFORM_FOG_COLOR.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((RD_UNIFORM_FOG_COLOR.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = intermediateValue4;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue2 = seasonsTextureTexture.Sample(seasonsTextureSampler, float2(varyingColor0.x, varyingColor0.y));
    float4 sampledTextureValue1 = lightMapTextureTexture.Sample(lightMapTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue9 = ((sampledTextureValue.x * varyingColor0.w) * ((((sampledTextureValue2.x * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f)) * sampledTextureValue1.x;
    float productValue10 = ((sampledTextureValue.y * varyingColor0.w) * ((((sampledTextureValue2.y * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f)) * sampledTextureValue1.y;
    float productValue11 = ((sampledTextureValue.z * varyingColor0.w) * ((((sampledTextureValue2.z * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f)) * sampledTextureValue1.z;
    fragmentColor0.x = ((RD_UNIFORM_FOG_COLOR.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((RD_UNIFORM_FOG_COLOR.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((RD_UNIFORM_FOG_COLOR.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
#endif
