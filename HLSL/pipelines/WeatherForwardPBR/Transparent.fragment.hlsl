// WeatherForwardPBR / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 9
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FLIP_OCCLUSION
#define RD_FEATURE_FLIP_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_NO_OCCLUSION
#define RD_FEATURE_NO_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_NO_VARIETY
#define RD_FEATURE_NO_VARIETY RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif


#include "../../include/materials/WeatherForwardPBR/FragmentBindings.hlsli"

#if (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor1 : COLOR1,
  float varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord1.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.xyz = materialTexture2.Sample(textureSampler2, varyingTexCoord1.xy).xyz;
#endif
  workingVector0.xyz = float3(255,255,255) * workingVector0.xyz;
  workingVector0.xyz = round(workingVector0.xyz);
  workingVector0.xyz = (uint3)workingVector0.xyz;
  workingVector0.y = (uint)workingVector0.y << 8;
  workingVector0.x = (int)workingVector0.y | (int)workingVector0.x;
  workingVector0.xy = (int2)workingVector0.xz & int2(1023,15);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.x = RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x + workingVector0.x;
  workingVector0.z = -workingVector0.x * 0.00392156886 + varyingTexCoord2.x;
  workingVector0.xy = float2(0.00392156886,0.0666666701) * workingVector0.xy;
#if RD_FEATURE_FLIP_OCCLUSION == RD_OFF
  workingVector0.x = RD_COMPARISON_MASK(varyingTexCoord2.x < workingVector0.x);
#elif RD_FEATURE_FLIP_OCCLUSION == RD_ON
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < varyingTexCoord2.x);
#endif
  workingVector0.z = saturate(25 * workingVector0.z);
  workingVector1.x = -workingVector0.z * workingVector0.y + workingVector0.y;
  workingVector0.yz = RD_COMPARISON_MASK(varyingTexCoord1.xy >= float2(0,0));
  workingVector1.zw = RD_COMPARISON_MASK(float2(1,1) >= varyingTexCoord1.xy);
  workingVector0.y = workingVector0.y ? workingVector1.z : 0;
  workingVector0.y = workingVector0.z ? workingVector0.y : 0;
  workingVector0.y = workingVector1.w ? workingVector0.y : 0;
  workingVector0.x = workingVector0.x ? workingVector0.y : 0;
  workingVector1.y = 1;
  workingVector0.xy = workingVector0.xx ? float2(0,0) : workingVector1.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyzw;
  workingVector2.xyzw = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).xyzw;
  workingVector0.xzw = workingVector2.xyz * workingVector1.xyz;
  workingVector1.xyz = -workingVector2.xyz * workingVector1.xyz + varyingColor1.xyz;
  fragmentColor0.w = workingVector2.w * workingVector0.y;
  fragmentColor0.xyz = varyingColor1.www * workingVector1.xyz + workingVector0.xzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.xzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyz;
  workingVector1.xyzw = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector1.xyz * workingVector0.xzw + varyingColor1.xyz;
  fragmentColor0.w = workingVector1.w * workingVector0.y;
  fragmentColor0.xyz = varyingColor1.www * workingVector0.xzw + workingVector2.xyz;
#endif
  return;
}
#elif RD_FEATURE_NO_OCCLUSION == RD_ON || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor1 : COLOR1,
  float varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_FEATURE_NO_OCCLUSION == RD_OFF || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord1.xy).xyzw;
  workingVector0.xyz = float3(255,255,255) * workingVector0.xyz;
  workingVector0.xyz = round(workingVector0.xyz);
  workingVector0.xyz = (uint3)workingVector0.xyz;
  workingVector0.y = (uint)workingVector0.y << 8;
  workingVector0.x = (int)workingVector0.y | (int)workingVector0.x;
  workingVector0.xy = (int2)workingVector0.xz & int2(1023,15);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.y = 0.0666666701 * workingVector0.y;
  workingVector0.x = RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x + workingVector0.x;
  workingVector0.x = -workingVector0.x * 0.00392156886 + varyingTexCoord2.x;
  workingVector0.x = saturate(25 * workingVector0.x);
  workingVector0.x = -workingVector0.x * workingVector0.y + workingVector0.y;
  workingVector0.y = 1;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyzw;
  workingVector1.xyzw = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + varyingColor1.xyz;
  fragmentColor0.w = workingVector1.w;
  fragmentColor0.xyz = varyingColor1.www * workingVector0.xyz + workingVector2.xyz;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = materialTexture2.Sample(textureSampler2, varyingTexCoord1.xy).xyz;
  workingVector0.xyz = float3(255,255,255) * workingVector0.xyz;
  workingVector0.xyz = round(workingVector0.xyz);
  workingVector0.xyz = (uint3)workingVector0.xyz;
  workingVector0.y = (uint)workingVector0.y << 8;
  workingVector0.x = (int)workingVector0.y | (int)workingVector0.x;
  workingVector0.xy = (int2)workingVector0.xz & int2(1023,15);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.y = 0.0666666701 * workingVector0.y;
  workingVector0.x = RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x + workingVector0.x;
  workingVector0.x = -workingVector0.x * 0.00392156886 + varyingTexCoord2.x;
  workingVector0.x = saturate(25 * workingVector0.x);
  workingVector0.x = -workingVector0.x * workingVector0.y + workingVector0.y;
  workingVector0.y = 1;
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyz;
  workingVector1.xyzw = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + varyingColor1.xyz;
  fragmentColor0.w = workingVector1.w;
  fragmentColor0.xyz = varyingColor1.www * workingVector0.xyz + workingVector2.xyz;
  return;
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF)
    float4 sampledTextureValue = weatherTextureTexture.Sample(weatherTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = occlusionTextureTexture.Sample(occlusionTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    float bitwiseValue = float(uint(round(sampledTextureValue1.z * 255.0f)) & 15u) * 0.066666670143604278564453125f;
    float bitwiseValue1 = (float(((uint(round(sampledTextureValue1.y * 255.0f)) << 8u) | uint(round(sampledTextureValue1.x * 255.0f))) & 1023u) + RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x) * 0.0039215688593685626983642578125f;
    float intermediateValue;
    float intermediateValue1;
    if (((varyingTexCoord1.y <= 1.0f) && (((varyingTexCoord1.x >= 0.0f) && (varyingTexCoord1.x <= 1.0f)) && (varyingTexCoord1.y >= 0.0f))) && (varyingTexCoord2 < bitwiseValue1))
    {
        intermediateValue = 0.0f;
        intermediateValue1 = 0.0f;
    }
    else
    {
        intermediateValue = bitwiseValue - (clamp((varyingTexCoord2 - bitwiseValue1) * 25.0f, 0.0f, 1.0f) * bitwiseValue);
        intermediateValue1 = 1.0f;
    }
    float4 sampledTextureValue2 = lightingTextureTexture.Sample(lightingTextureSampler, float2(intermediateValue, intermediateValue1));
    float productValue = sampledTextureValue2.x * sampledTextureValue.x;
    float productValue1 = sampledTextureValue2.y * sampledTextureValue.y;
    float productValue2 = sampledTextureValue2.z * sampledTextureValue.z;
    fragmentColor0.x = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    fragmentColor0.y = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    fragmentColor0.z = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    fragmentColor0.w = intermediateValue1 * sampledTextureValue.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = weatherTextureTexture.Sample(weatherTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = occlusionTextureTexture.Sample(occlusionTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    float bitwiseValue = float(uint(round(sampledTextureValue1.z * 255.0f)) & 15u) * 0.066666670143604278564453125f;
    float4 sampledTextureValue3 = lightingTextureTexture.Sample(lightingTextureSampler, float2(bitwiseValue - (bitwiseValue * clamp((varyingTexCoord2 - ((float(((uint(round(sampledTextureValue1.y * 255.0f)) << 8u) | uint(round(sampledTextureValue1.x * 255.0f))) & 1023u) + RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x) * 0.0039215688593685626983642578125f)) * 25.0f, 0.0f, 1.0f)), 1.0f));
    float productValue3 = sampledTextureValue3.x * sampledTextureValue.x;
    float productValue4 = sampledTextureValue3.y * sampledTextureValue.y;
    float productValue5 = sampledTextureValue3.z * sampledTextureValue.z;
    fragmentColor0.x = ((varyingColor1.x - productValue3) * varyingColor1.w) + productValue3;
    fragmentColor0.y = ((varyingColor1.y - productValue4) * varyingColor1.w) + productValue4;
    fragmentColor0.z = ((varyingColor1.z - productValue5) * varyingColor1.w) + productValue5;
    fragmentColor0.w = sampledTextureValue.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif RD_FEATURE_FLIP_OCCLUSION == RD_ON
    float4 sampledTextureValue = weatherTextureTexture.Sample(weatherTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = occlusionTextureTexture.Sample(occlusionTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    float bitwiseValue = float(uint(round(sampledTextureValue1.z * 255.0f)) & 15u) * 0.066666670143604278564453125f;
    float bitwiseValue1 = (float(((uint(round(sampledTextureValue1.y * 255.0f)) << 8u) | uint(round(sampledTextureValue1.x * 255.0f))) & 1023u) + RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x) * 0.0039215688593685626983642578125f;
    float intermediateValue;
    float intermediateValue1;
    if (((varyingTexCoord1.y <= 1.0f) && (((varyingTexCoord1.x >= 0.0f) && (varyingTexCoord1.x <= 1.0f)) && (varyingTexCoord1.y >= 0.0f))) && (varyingTexCoord2 > bitwiseValue1))
    {
        intermediateValue = 0.0f;
        intermediateValue1 = 0.0f;
    }
    else
    {
        intermediateValue = bitwiseValue - (clamp((varyingTexCoord2 - bitwiseValue1) * 25.0f, 0.0f, 1.0f) * bitwiseValue);
        intermediateValue1 = 1.0f;
    }
    float4 sampledTextureValue2 = lightingTextureTexture.Sample(lightingTextureSampler, float2(intermediateValue, intermediateValue1));
    float productValue = sampledTextureValue2.x * sampledTextureValue.x;
    float productValue1 = sampledTextureValue2.y * sampledTextureValue.y;
    float productValue2 = sampledTextureValue2.z * sampledTextureValue.z;
    fragmentColor0.x = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    fragmentColor0.y = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    fragmentColor0.z = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    fragmentColor0.w = intermediateValue1 * sampledTextureValue.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
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
