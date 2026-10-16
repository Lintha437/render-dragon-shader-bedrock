// Actor / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 36
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_OPTION_EMISSIVE
#define RD_OPTION_EMISSIVE RD_EMISSIVE_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MASKED_MULTITEXTURE
#define RD_FEATURE_MASKED_MULTITEXTURE RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 19
#endif


#include "../../include/materials/Actor/FragmentBindings.hlsli"

#if RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor3 : COLOR3,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.xyz + float3(1,1,1);
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector1.xyzw;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.w = max(0, workingVector1.w);
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
  fragmentColor0.w = 1;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.w = RD_UNIFORM_CHANGE_COLOR.w * workingVector0.w;
  workingVector0.w = max(0, workingVector0.w);
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
  fragmentColor0.w = 1;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xy = RD_UNIFORM_MAT_COLOR.xy * workingVector0.xy;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.y = ceil(workingVector0.y);
  workingVector0.xyz = workingVector0.yyy * workingVector1.xyz + workingVector0.xzw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyw;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.y);
  workingVector0.y = max(0, workingVector0.z);
  workingVector0.xzw = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector0.xzw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xzw + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.yyy * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xyz = -workingVector0.xzw * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
  fragmentColor0.w = 1;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xy;
  workingVector0.xy = RD_UNIFORM_MAT_COLOR.xy * workingVector0.xy;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.y = ceil(workingVector0.y);
  workingVector0.xyz = workingVector0.yyy * workingVector1.xyz + workingVector0.xzw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.y);
  workingVector0.y = max(0, workingVector0.z);
  workingVector0.xzw = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector0.xzw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xzw + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.yyy * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xyz = -workingVector0.xzw * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
  fragmentColor0.w = 1;
  return;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = (sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue1 = (sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue2 = (sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue3 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue) * varyingColor3.x;
    float productValue4 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue1) * varyingColor3.y;
    float productValue5 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue2) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    float productValue10 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0f - sampledTextureValue1.w)) > 0.0f);
    float productValue11 = ((productValue10 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue)) + scalarValue) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue12 = ((productValue10 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue1)) + scalarValue1) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue13 = ((productValue10 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue2)) + scalarValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue14 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11) * varyingColor3.x;
    float productValue15 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue12) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue12) * varyingColor3.y;
    float productValue16 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue13) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue13) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.y = ((varyingColor2.y - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.z = ((varyingColor2.z - productValue16) * varyingColor2.w) + productValue16;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue6 = max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w);
    float productValue = (sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue1 = (sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue2 = (sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue7 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue) * ((productValue6 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue8 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue1) * ((productValue6 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue9 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue2) * ((productValue6 * (varyingColor3.z + (-1.0f))) + 1.0f);
    fragmentColor0.x = ((varyingColor2.x - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.y = ((varyingColor2.y - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.z = ((varyingColor2.z - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    float productValue17 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0f - scalarValue3)) > 0.0f);
    float productValue18 = max(0.0f, (productValue17 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue3)) + scalarValue3);
    float productValue19 = ((productValue17 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue)) + scalarValue) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue20 = ((productValue17 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue1)) + scalarValue1) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue21 = ((productValue17 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue2)) + scalarValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue22 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue19) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue19) * ((productValue18 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue23 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue20) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue20) * ((productValue18 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue24 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue21) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue21) * ((productValue18 * (varyingColor3.z + (-1.0f))) + 1.0f);
    fragmentColor0.x = ((varyingColor2.x - productValue22) * varyingColor2.w) + productValue22;
    fragmentColor0.y = ((varyingColor2.y - productValue23) * varyingColor2.w) + productValue23;
    fragmentColor0.z = ((varyingColor2.z - productValue24) * varyingColor2.w) + productValue24;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue25 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue26 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue27 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue28 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue29 = ((((productValue25 * RD_UNIFORM_CHANGE_COLOR.x) - productValue25) * productValue28) + productValue25) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue30 = ((((productValue26 * RD_UNIFORM_CHANGE_COLOR.y) - productValue26) * productValue28) + productValue26) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue31 = ((((productValue27 * RD_UNIFORM_CHANGE_COLOR.z) - productValue27) * productValue28) + productValue27) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue32 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue29) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue29) * varyingColor3.x;
    float productValue33 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue30) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue30) * varyingColor3.y;
    float productValue34 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue31) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue31) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue32) * varyingColor2.w) + productValue32;
    fragmentColor0.y = ((varyingColor2.y - productValue33) * varyingColor2.w) + productValue33;
    fragmentColor0.z = ((varyingColor2.z - productValue34) * varyingColor2.w) + productValue34;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    float productValue17 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0f - scalarValue3)) > 0.0f);
    float productValue35 = (productValue17 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue)) + scalarValue;
    float productValue36 = (productValue17 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue1)) + scalarValue1;
    float productValue37 = (productValue17 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue2)) + scalarValue2;
    float productValue38 = (productValue17 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue3)) + scalarValue3;
    float productValue39 = ((((productValue35 * RD_UNIFORM_CHANGE_COLOR.x) - productValue35) * productValue38) + productValue35) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue40 = ((((productValue36 * RD_UNIFORM_CHANGE_COLOR.y) - productValue36) * productValue38) + productValue36) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue41 = ((((productValue37 * RD_UNIFORM_CHANGE_COLOR.z) - productValue37) * productValue38) + productValue37) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue42 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39) * varyingColor3.x;
    float productValue43 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40) * varyingColor3.y;
    float productValue44 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue41) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue41) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue42) * varyingColor2.w) + productValue42;
    fragmentColor0.y = ((varyingColor2.y - productValue43) * varyingColor2.w) + productValue43;
    fragmentColor0.z = ((varyingColor2.z - productValue44) * varyingColor2.w) + productValue44;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue25 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue26 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue27 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue28 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue45 = max(0.0f, productValue28 * RD_UNIFORM_CHANGE_COLOR.w);
    float productValue29 = ((((productValue25 * RD_UNIFORM_CHANGE_COLOR.x) - productValue25) * productValue28) + productValue25) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue30 = ((((productValue26 * RD_UNIFORM_CHANGE_COLOR.y) - productValue26) * productValue28) + productValue26) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue31 = ((((productValue27 * RD_UNIFORM_CHANGE_COLOR.z) - productValue27) * productValue28) + productValue27) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue46 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue29) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue29) * ((productValue45 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue47 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue30) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue30) * ((productValue45 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue48 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue31) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue31) * ((productValue45 * (varyingColor3.z + (-1.0f))) + 1.0f);
    fragmentColor0.x = ((varyingColor2.x - productValue46) * varyingColor2.w) + productValue46;
    fragmentColor0.y = ((varyingColor2.y - productValue47) * varyingColor2.w) + productValue47;
    fragmentColor0.z = ((varyingColor2.z - productValue48) * varyingColor2.w) + productValue48;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    float productValue17 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0f - scalarValue3)) > 0.0f);
    float productValue35 = (productValue17 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue)) + scalarValue;
    float productValue36 = (productValue17 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue1)) + scalarValue1;
    float productValue37 = (productValue17 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue2)) + scalarValue2;
    float productValue38 = (productValue17 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue3)) + scalarValue3;
    float productValue49 = max(0.0f, productValue38 * RD_UNIFORM_CHANGE_COLOR.w);
    float productValue39 = ((((productValue35 * RD_UNIFORM_CHANGE_COLOR.x) - productValue35) * productValue38) + productValue35) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue40 = ((((productValue36 * RD_UNIFORM_CHANGE_COLOR.y) - productValue36) * productValue38) + productValue36) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue41 = ((((productValue37 * RD_UNIFORM_CHANGE_COLOR.z) - productValue37) * productValue38) + productValue37) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue50 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39) * ((productValue49 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue51 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40) * ((productValue49 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue52 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue41) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue41) * ((productValue49 * (varyingColor3.z + (-1.0f))) + 1.0f);
    fragmentColor0.x = ((varyingColor2.x - productValue50) * varyingColor2.w) + productValue50;
    fragmentColor0.y = ((varyingColor2.y - productValue51) * varyingColor2.w) + productValue51;
    fragmentColor0.z = ((varyingColor2.z - productValue52) * varyingColor2.w) + productValue52;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue25 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue26 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue65 = RD_UNIFORM_CHANGE_COLOR.x * productValue25;
    float productValue66 = RD_UNIFORM_CHANGE_COLOR.y * productValue25;
    float productValue67 = RD_UNIFORM_CHANGE_COLOR.z * productValue25;
    float scalarValue5 = ceil(productValue26);
    float productValue68 = ((((productValue26 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue65) * scalarValue5) + productValue65) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue69 = ((((productValue26 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue66) * scalarValue5) + productValue66) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue70 = ((((productValue26 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue67) * scalarValue5) + productValue67) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue71 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue68) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue68) * varyingColor3.x;
    float productValue72 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue69) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue69) * varyingColor3.y;
    float productValue73 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue70) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue70) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue71) * varyingColor2.w) + productValue71;
    fragmentColor0.y = ((varyingColor2.y - productValue72) * varyingColor2.w) + productValue72;
    fragmentColor0.z = ((varyingColor2.z - productValue73) * varyingColor2.w) + productValue73;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float productValue53 = float((((scalarValue + scalarValue1) + sampledTextureValue1.z) * (1.0f - sampledTextureValue1.w)) > 0.0f);
    float productValue54 = (productValue53 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue)) + scalarValue;
    float productValue55 = (productValue53 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue1)) + scalarValue1;
    float productValue56 = productValue54 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue57 = productValue54 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue58 = productValue54 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue4 = ceil(productValue55);
    float productValue59 = ((((productValue55 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue56) * scalarValue4) + productValue56) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue60 = ((((productValue55 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue57) * scalarValue4) + productValue57) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue61 = ((((productValue55 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue58) * scalarValue4) + productValue58) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue62 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue59) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue59) * varyingColor3.x;
    float productValue63 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue60) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue60) * varyingColor3.y;
    float productValue64 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue61) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue61) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue62) * varyingColor2.w) + productValue62;
    fragmentColor0.y = ((varyingColor2.y - productValue63) * varyingColor2.w) + productValue63;
    fragmentColor0.z = ((varyingColor2.z - productValue64) * varyingColor2.w) + productValue64;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue25 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue26 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue65 = RD_UNIFORM_CHANGE_COLOR.x * productValue25;
    float productValue66 = RD_UNIFORM_CHANGE_COLOR.y * productValue25;
    float productValue67 = RD_UNIFORM_CHANGE_COLOR.z * productValue25;
    float scalarValue5 = ceil(productValue26);
    float productValue6 = max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w);
    float productValue74 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((productValue26 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue65) * scalarValue5) + productValue65);
    float productValue75 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((productValue26 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue66) * scalarValue5) + productValue66);
    float productValue76 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((productValue26 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue67) * scalarValue5) + productValue67);
    float productValue77 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue74) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue74) * ((productValue6 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue78 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue75) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue75) * ((productValue6 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue79 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue76) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue76) * ((productValue6 * (varyingColor3.z + (-1.0f))) + 1.0f);
    fragmentColor0.x = ((varyingColor2.x - productValue77) * varyingColor2.w) + productValue77;
    fragmentColor0.y = ((varyingColor2.y - productValue78) * varyingColor2.w) + productValue78;
    fragmentColor0.z = ((varyingColor2.z - productValue79) * varyingColor2.w) + productValue79;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.w;
    float productValue80 = float((((scalarValue + scalarValue1) + sampledTextureValue1.z) * (1.0f - scalarValue3)) > 0.0f);
    float productValue81 = (productValue80 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue)) + scalarValue;
    float productValue82 = (productValue80 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue1)) + scalarValue1;
    float productValue83 = productValue81 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue84 = productValue81 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue85 = productValue81 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue6 = ceil(productValue82);
    float productValue86 = max(0.0f, (productValue80 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue3)) + scalarValue3);
    float productValue87 = ((((productValue82 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue83) * scalarValue6) + productValue83) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue88 = ((((productValue82 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue84) * scalarValue6) + productValue84) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue89 = ((((productValue82 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue85) * scalarValue6) + productValue85) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue90 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue87) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue87) * ((productValue86 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue91 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue88) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue88) * ((productValue86 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue92 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue89) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue89) * ((productValue86 * (varyingColor3.z + (-1.0f))) + 1.0f);
    fragmentColor0.x = ((varyingColor2.x - productValue90) * varyingColor2.w) + productValue90;
    fragmentColor0.y = ((varyingColor2.y - productValue91) * varyingColor2.w) + productValue91;
    fragmentColor0.z = ((varyingColor2.z - productValue92) * varyingColor2.w) + productValue92;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor3 : COLOR3,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
#if (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector0.w = 1 + -workingVector0.w;
  workingVector0.w = workingVector1.x * workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
  workingVector0.w = workingVector0.w ? 1.000000 : 0;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR.xyz * workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector0.xyzw;
  workingVector0.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector0.xyzw;
  workingVector0.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector0.xyzw;
  workingVector0.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.w = RD_UNIFORM_CHANGE_COLOR.w * workingVector0.w;
  workingVector0.w = max(0, workingVector0.w);
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.z = workingVector1.x + workingVector0.z;
  workingVector0.w = 1 + -workingVector0.w;
  workingVector0.z = workingVector0.z * workingVector0.w;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xy = RD_UNIFORM_MAT_COLOR.xy * workingVector1.xy + -workingVector0.xy;
  workingVector0.xy = workingVector0.zz * workingVector1.xy + workingVector0.xy;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.y = ceil(workingVector0.y);
  workingVector0.xyz = workingVector0.yyy * workingVector1.xyz + workingVector0.xzw;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.z = workingVector1.x + workingVector0.z;
  workingVector1.x = 1 + -workingVector0.w;
  workingVector0.z = workingVector1.x * workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector1.xyw + -workingVector0.xyw;
  workingVector0.xyz = workingVector0.zzz * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.y);
  workingVector0.y = max(0, workingVector0.z);
  workingVector0.xzw = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector0.w = 1 + -workingVector0.w;
  workingVector0.w = workingVector1.x * workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
  workingVector0.w = workingVector0.w ? 1.000000 : 0;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR.xyz * workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.z = workingVector1.x + workingVector0.z;
  workingVector0.w = 1 + -workingVector0.w;
  workingVector0.z = workingVector0.z * workingVector0.w;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector1.xy = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xy;
  workingVector1.xy = RD_UNIFORM_MAT_COLOR.xy * workingVector1.xy + -workingVector0.xy;
  workingVector0.xy = workingVector0.zz * workingVector1.xy + workingVector0.xy;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.y = ceil(workingVector0.y);
  workingVector0.xyz = workingVector0.yyy * workingVector1.xyz + workingVector0.xzw;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.z = workingVector1.x + workingVector0.z;
  workingVector1.x = 1 + -workingVector0.w;
  workingVector0.z = workingVector1.x * workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyz = workingVector0.zzz * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.y);
  workingVector0.y = max(0, workingVector0.z);
  workingVector0.xzw = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
#endif
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
#if RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.w = max(0, workingVector0.w);
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector0.xzw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xzw + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.yyy * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xyz = -workingVector0.xzw * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
#endif
  fragmentColor0.w = 1;
  return;
}
#endif
