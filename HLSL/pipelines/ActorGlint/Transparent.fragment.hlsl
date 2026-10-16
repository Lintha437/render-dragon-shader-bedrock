// ActorGlint / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 18
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
#define RD_BINDING_LAYOUT 14
#endif


#include "../../include/materials/ActorGlint/FragmentBindings.hlsli"

#if RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingTexCoord2 : TEXCOORD2,
  float4 varyingColor3 : COLOR3,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyzw;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw;
  workingVector3.xyz = workingVector2.xyz * workingVector1.xyz;
  workingVector1.xyz = -workingVector2.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.w = max(0, workingVector2.w);
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector3.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyzw;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xyz;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector1.xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.w = RD_UNIFORM_CHANGE_COLOR.w * workingVector1.w;
  workingVector0.w = max(0, workingVector0.w);
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  workingVector2.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector2.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector2.xyz + float3(1,1,1);
  workingVector3.xyz = workingVector2.xyz * workingVector1.xyz;
  workingVector1.xyz = -workingVector1.xyz * workingVector2.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector3.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyzw;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xyz;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector1.xyw;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector1.xxx;
  workingVector3.xyz = workingVector1.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.w = ceil(workingVector1.y);
  workingVector1.x = max(0, workingVector1.z);
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector1.x;
  workingVector1.xyz = workingVector0.www * workingVector3.xyz + workingVector2.xyz;
  workingVector2.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector2.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector2.xyz + float3(1,1,1);
  workingVector3.xyz = workingVector2.xyz * workingVector1.xyz;
  workingVector1.xyz = -workingVector1.xyz * workingVector2.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector3.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyz;
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyz;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw;
  workingVector3.xyz = workingVector2.xyz * workingVector1.xyz;
  workingVector1.xyz = -workingVector2.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.w = max(0, workingVector2.w);
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector3.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyz;
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyz;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xyz;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector1.xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.w = RD_UNIFORM_CHANGE_COLOR.w * workingVector1.w;
  workingVector0.w = max(0, workingVector0.w);
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  workingVector2.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector2.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector2.xyz + float3(1,1,1);
  workingVector3.xyz = workingVector2.xyz * workingVector1.xyz;
  workingVector1.xyz = -workingVector1.xyz * workingVector2.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector3.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyz;
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyz;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xyz;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector1.xyz;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector1.xxx;
  workingVector3.xyz = workingVector1.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.w = ceil(workingVector1.y);
  workingVector1.x = max(0, workingVector1.z);
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector1.x;
  workingVector1.xyz = workingVector0.www * workingVector3.xyz + workingVector2.xyz;
  workingVector2.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector2.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector2.xyz + float3(1,1,1);
  workingVector3.xyz = workingVector2.xyz * workingVector1.xyz;
  workingVector1.xyz = -workingVector1.xyz * workingVector2.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector3.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  return;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = (sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue1 = (sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue2 = (sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue3 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue4 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue5 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue6 = (productValue3 * productValue3) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue) * varyingColor3.x);
    float productValue7 = (productValue4 * productValue4) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue1) * varyingColor3.y);
    float productValue8 = (productValue5 * productValue5) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue2) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w);
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue3 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.x;
    float scalarValue1 = sampledTextureValue3.y;
    float scalarValue2 = sampledTextureValue3.z;
    float scalarValue3 = sampledTextureValue3.w;
    float productValue9 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0f - scalarValue3)) > 0.0f);
    float productValue10 = ((productValue9 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue)) + scalarValue) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue11 = ((productValue9 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue1)) + scalarValue1) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue12 = ((productValue9 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue2)) + scalarValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue3 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue4 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue5 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue13 = (productValue3 * productValue3) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue10) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue10) * varyingColor3.x);
    float productValue14 = (productValue4 * productValue4) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11) * varyingColor3.y);
    float productValue15 = (productValue5 * productValue5) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue12) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue12) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.y = ((varyingColor2.y - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.z = ((varyingColor2.z - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * max(0.0f, (productValue9 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue3)) + scalarValue3);
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue16 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue17 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue18 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue19 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue20 = ((((productValue16 * RD_UNIFORM_CHANGE_COLOR.x) - productValue16) * productValue19) + productValue16) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue21 = ((((productValue17 * RD_UNIFORM_CHANGE_COLOR.y) - productValue17) * productValue19) + productValue17) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue22 = ((((productValue18 * RD_UNIFORM_CHANGE_COLOR.z) - productValue18) * productValue19) + productValue18) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue3 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue4 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue5 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue23 = (productValue3 * productValue3) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue20) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue20) * varyingColor3.x);
    float productValue24 = (productValue4 * productValue4) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue21) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue21) * varyingColor3.y);
    float productValue25 = (productValue5 * productValue5) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue23) * varyingColor2.w) + productValue23;
    fragmentColor0.y = ((varyingColor2.y - productValue24) * varyingColor2.w) + productValue24;
    fragmentColor0.z = ((varyingColor2.z - productValue25) * varyingColor2.w) + productValue25;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * max(0.0f, productValue19 * RD_UNIFORM_CHANGE_COLOR.w);
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue3 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.x;
    float scalarValue1 = sampledTextureValue3.y;
    float scalarValue2 = sampledTextureValue3.z;
    float scalarValue3 = sampledTextureValue3.w;
    float productValue9 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0f - scalarValue3)) > 0.0f);
    float productValue26 = (productValue9 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue)) + scalarValue;
    float productValue27 = (productValue9 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue1)) + scalarValue1;
    float productValue28 = (productValue9 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue2)) + scalarValue2;
    float productValue29 = (productValue9 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue3)) + scalarValue3;
    float productValue30 = ((((productValue26 * RD_UNIFORM_CHANGE_COLOR.x) - productValue26) * productValue29) + productValue26) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue31 = ((((productValue27 * RD_UNIFORM_CHANGE_COLOR.y) - productValue27) * productValue29) + productValue27) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue32 = ((((productValue28 * RD_UNIFORM_CHANGE_COLOR.z) - productValue28) * productValue29) + productValue28) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue3 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue4 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue5 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue33 = (productValue3 * productValue3) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue30) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue30) * varyingColor3.x);
    float productValue34 = (productValue4 * productValue4) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue31) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue31) * varyingColor3.y);
    float productValue35 = (productValue5 * productValue5) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue32) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue32) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue33) * varyingColor2.w) + productValue33;
    fragmentColor0.y = ((varyingColor2.y - productValue34) * varyingColor2.w) + productValue34;
    fragmentColor0.z = ((varyingColor2.z - productValue35) * varyingColor2.w) + productValue35;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * max(0.0f, productValue29 * RD_UNIFORM_CHANGE_COLOR.w);
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue16 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue17 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue36 = RD_UNIFORM_CHANGE_COLOR.x * productValue16;
    float productValue37 = RD_UNIFORM_CHANGE_COLOR.y * productValue16;
    float productValue38 = RD_UNIFORM_CHANGE_COLOR.z * productValue16;
    float scalarValue4 = ceil(productValue17);
    float productValue39 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((productValue17 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue36) * scalarValue4) + productValue36);
    float productValue40 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((productValue17 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue37) * scalarValue4) + productValue37);
    float productValue41 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((productValue17 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue38) * scalarValue4) + productValue38);
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue3 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue4 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue5 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue42 = (productValue3 * productValue3) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39) * varyingColor3.x);
    float productValue43 = (productValue4 * productValue4) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40) * varyingColor3.y);
    float productValue44 = (productValue5 * productValue5) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue41) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue41) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue42) * varyingColor2.w) + productValue42;
    fragmentColor0.y = ((varyingColor2.y - productValue43) * varyingColor2.w) + productValue43;
    fragmentColor0.z = ((varyingColor2.z - productValue44) * varyingColor2.w) + productValue44;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w);
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue3 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.x;
    float scalarValue1 = sampledTextureValue3.y;
    float scalarValue3 = sampledTextureValue3.w;
    float productValue45 = float((((scalarValue + scalarValue1) + sampledTextureValue3.z) * (1.0f - scalarValue3)) > 0.0f);
    float productValue46 = (productValue45 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue)) + scalarValue;
    float productValue47 = (productValue45 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue1)) + scalarValue1;
    float productValue48 = productValue46 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue49 = productValue46 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue50 = productValue46 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue5 = ceil(productValue47);
    float productValue51 = ((((productValue47 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue48) * scalarValue5) + productValue48) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue52 = ((((productValue47 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue49) * scalarValue5) + productValue49) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue53 = ((((productValue47 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue50) * scalarValue5) + productValue50) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue3 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue4 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue5 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue54 = (productValue3 * productValue3) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue51) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue51) * varyingColor3.x);
    float productValue55 = (productValue4 * productValue4) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue52) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue52) * varyingColor3.y);
    float productValue56 = (productValue5 * productValue5) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue53) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue53) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue54) * varyingColor2.w) + productValue54;
    fragmentColor0.y = ((varyingColor2.y - productValue55) * varyingColor2.w) + productValue55;
    fragmentColor0.z = ((varyingColor2.z - productValue56) * varyingColor2.w) + productValue56;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * max(0.0f, (productValue45 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue3)) + scalarValue3);
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
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
  float4 varyingTexCoord2 : TEXCOORD2,
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
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector0.xyzw;
  workingVector0.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
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
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
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
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  workingVector0.xyz = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
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
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  workingVector0.xyz = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
#endif
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
  workingVector0.w = max(0, workingVector0.w);
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#endif
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector0.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector2.xyz = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyz;
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyz;
#endif
  workingVector2.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector2.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  return;
}
#endif
