// ActorTint / Opaque / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 4
#endif


#include "../../include/materials/ActorTint/FragmentBindings.hlsli"

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
#if (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = max(0, workingVector0.w);
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.w = RD_UNIFORM_CHANGE_COLOR.w * workingVector0.w;
  fragmentColor0.w = max(0, workingVector0.w);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyw;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.y);
  fragmentColor0.w = max(0, workingVector0.z);
  workingVector0.xyz = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.y);
  fragmentColor0.w = max(0, workingVector0.z);
  workingVector0.xyz = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue3 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * sampledTextureValue1.x) - productValue) * scalarValue) + productValue) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue4 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * sampledTextureValue1.y) - productValue1) * scalarValue) + productValue1) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue5 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * sampledTextureValue1.z) - productValue2) * scalarValue) + productValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue6 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3) * varyingColor3.x;
    float productValue7 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4) * varyingColor3.y;
    float productValue8 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w);
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue9 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue)) > 0.0f);
    float productValue10 = (productValue9 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue11 = (productValue9 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue12 = (productValue9 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue3)) + scalarValue3;
    float productValue13 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue1) - productValue10) * scalarValue) + productValue10) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue14 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue2) - productValue11) * scalarValue) + productValue11) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue15 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue3) - productValue12) * scalarValue) + productValue12) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue16 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue13) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue13) * varyingColor3.x;
    float productValue17 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue14) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue14) * varyingColor3.y;
    float productValue18 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue15) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue15) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue16) * varyingColor2.w) + productValue16;
    fragmentColor0.y = ((varyingColor2.y - productValue17) * varyingColor2.w) + productValue17;
    fragmentColor0.z = ((varyingColor2.z - productValue18) * varyingColor2.w) + productValue18;
    fragmentColor0.w = max(0.0f, (productValue9 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue19 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue20 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * productValue19) + productValue;
    float productValue21 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * productValue19) + productValue1;
    float productValue22 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * productValue19) + productValue2;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue23 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * sampledTextureValue1.x) - productValue20) * scalarValue) + productValue20) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue24 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * sampledTextureValue1.y) - productValue21) * scalarValue) + productValue21) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue25 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * sampledTextureValue1.z) - productValue22) * scalarValue) + productValue22) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue26 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23) * varyingColor3.x;
    float productValue27 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24) * varyingColor3.y;
    float productValue28 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue25) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue25) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue26) * varyingColor2.w) + productValue26;
    fragmentColor0.y = ((varyingColor2.y - productValue27) * varyingColor2.w) + productValue27;
    fragmentColor0.z = ((varyingColor2.z - productValue28) * varyingColor2.w) + productValue28;
    fragmentColor0.w = max(0.0f, productValue19 * RD_UNIFORM_CHANGE_COLOR.w);
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue9 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue)) > 0.0f);
    float productValue10 = (productValue9 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue11 = (productValue9 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue12 = (productValue9 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue3)) + scalarValue3;
    float productValue29 = (productValue9 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue30 = (((productValue10 * RD_UNIFORM_CHANGE_COLOR.x) - productValue10) * productValue29) + productValue10;
    float productValue31 = (((productValue11 * RD_UNIFORM_CHANGE_COLOR.y) - productValue11) * productValue29) + productValue11;
    float productValue32 = (((productValue12 * RD_UNIFORM_CHANGE_COLOR.z) - productValue12) * productValue29) + productValue12;
    float productValue33 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue1) - productValue30) * scalarValue) + productValue30) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue34 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue2) - productValue31) * scalarValue) + productValue31) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue35 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue3) - productValue32) * scalarValue) + productValue32) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue36 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue33) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue33) * varyingColor3.x;
    float productValue37 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue34) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue34) * varyingColor3.y;
    float productValue38 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue35) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue35) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue36) * varyingColor2.w) + productValue36;
    fragmentColor0.y = ((varyingColor2.y - productValue37) * varyingColor2.w) + productValue37;
    fragmentColor0.z = ((varyingColor2.z - productValue38) * varyingColor2.w) + productValue38;
    fragmentColor0.w = max(0.0f, productValue29 * RD_UNIFORM_CHANGE_COLOR.w);
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue39 = RD_UNIFORM_CHANGE_COLOR.x * productValue;
    float productValue40 = RD_UNIFORM_CHANGE_COLOR.y * productValue;
    float productValue41 = RD_UNIFORM_CHANGE_COLOR.z * productValue;
    float scalarValue4 = ceil(productValue1);
    float productValue42 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue39) * scalarValue4) + productValue39;
    float productValue43 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue40) * scalarValue4) + productValue40;
    float productValue44 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue41) * scalarValue4) + productValue41;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue45 = ((((sampledTextureValue1.x * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue42) * scalarValue) + productValue42) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue46 = ((((sampledTextureValue1.y * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue43) * scalarValue) + productValue43) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue47 = ((((sampledTextureValue1.z * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue44) * scalarValue) + productValue44) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue48 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue45) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue45) * varyingColor3.x;
    float productValue49 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue46) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue46) * varyingColor3.y;
    float productValue50 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue47) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue47) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue48) * varyingColor2.w) + productValue48;
    fragmentColor0.y = ((varyingColor2.y - productValue49) * varyingColor2.w) + productValue49;
    fragmentColor0.z = ((varyingColor2.z - productValue50) * varyingColor2.w) + productValue50;
    fragmentColor0.w = max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w);
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue9 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue)) > 0.0f);
    float productValue10 = (productValue9 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue11 = (productValue9 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue51 = productValue10 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue52 = productValue10 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue53 = productValue10 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue5 = ceil(productValue11);
    float productValue54 = (((productValue11 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue51) * scalarValue5) + productValue51;
    float productValue55 = (((productValue11 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue52) * scalarValue5) + productValue52;
    float productValue56 = (((productValue11 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue53) * scalarValue5) + productValue53;
    float productValue57 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue1) - productValue54) * scalarValue) + productValue54) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue58 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue2) - productValue55) * scalarValue) + productValue55) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue59 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue3) - productValue56) * scalarValue) + productValue56) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue60 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue57) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue57) * varyingColor3.x;
    float productValue61 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue58) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue58) * varyingColor3.y;
    float productValue62 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue59) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue59) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue60) * varyingColor2.w) + productValue60;
    fragmentColor0.y = ((varyingColor2.y - productValue61) * varyingColor2.w) + productValue61;
    fragmentColor0.z = ((varyingColor2.z - productValue62) * varyingColor2.w) + productValue62;
    fragmentColor0.w = max(0.0f, (productValue9 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
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
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
  float4 workingVector0,workingVector1,workingVector2;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector0.xyzw;
  workingVector1.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector0.xyzw;
  workingVector1.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector1.w = RD_UNIFORM_CHANGE_COLOR.w * workingVector1.w;
  fragmentColor0.w = max(0, workingVector1.w);
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector2.xyw + -workingVector0.xyw;
  workingVector1.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xyw;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector1.xxx;
  workingVector3.xyz = workingVector1.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector1.x = ceil(workingVector1.y);
  fragmentColor0.w = max(0, workingVector1.z);
  workingVector1.xyz = workingVector1.xxx * workingVector3.xyz + workingVector2.xyz;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector1.yzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector1.yzw + -workingVector0.xyw;
  workingVector1.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xyw;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector1.xxx;
  workingVector3.xyz = workingVector1.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector1.x = ceil(workingVector1.y);
  fragmentColor0.w = max(0, workingVector1.z);
  workingVector1.xyz = workingVector1.xxx * workingVector3.xyz + workingVector2.xyz;
#endif
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
  fragmentColor0.w = max(0, workingVector1.w);
#endif
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
}
#endif
