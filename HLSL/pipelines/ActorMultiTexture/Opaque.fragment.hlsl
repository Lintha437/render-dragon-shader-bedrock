// ActorMultiTexture / Opaque / fragment forward pipeline.
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
#ifndef RD_FEATURE_COLOR_SECOND_TEXTURE
#define RD_FEATURE_COLOR_SECOND_TEXTURE RD_OFF
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
#define RD_BINDING_LAYOUT 7
#endif


#include "../../include/materials/ActorMultiTexture/FragmentBindings.hlsli"

#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF) || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
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
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = -RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz + workingVector1.xyz;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = max(0, workingVector0.w);
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
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
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
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
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
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
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue12 = ((sampledTextureValue1.x - productValue) * scalarValue) + productValue;
    float productValue13 = ((sampledTextureValue1.y - productValue1) * scalarValue) + productValue1;
    float productValue14 = ((sampledTextureValue1.z - productValue2) * scalarValue) + productValue2;
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue15 = (((sampledTextureValue2.x - productValue12) * scalarValue1) + productValue12) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue16 = (((sampledTextureValue2.y - productValue13) * scalarValue1) + productValue13) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue17 = (((sampledTextureValue2.z - productValue14) * scalarValue1) + productValue14) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue18 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue15) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue15) * varyingColor3.x;
    float productValue19 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue16) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue16) * varyingColor3.y;
    float productValue20 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue17) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue17) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue18) * varyingColor2.w) + productValue18;
    fragmentColor0.y = ((varyingColor2.y - productValue19) * varyingColor2.w) + productValue19;
    fragmentColor0.z = ((varyingColor2.z - productValue20) * varyingColor2.w) + productValue20;
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue21 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue22 = productValue21 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2);
    float productValue23 = productValue21 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3);
    float productValue24 = productValue21 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue4);
    float productValue25 = (productValue22 + scalarValue2) - (productValue22 * scalarValue);
    float productValue26 = (productValue23 + scalarValue3) - (productValue23 * scalarValue);
    float productValue27 = (productValue24 + scalarValue4) - (productValue24 * scalarValue);
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue28 = (((sampledTextureValue2.x - productValue25) * scalarValue1) + productValue25) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue29 = (((sampledTextureValue2.y - productValue26) * scalarValue1) + productValue26) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue30 = (((sampledTextureValue2.z - productValue27) * scalarValue1) + productValue27) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue31 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue28) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue28) * varyingColor3.x;
    float productValue32 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue29) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue29) * varyingColor3.y;
    float productValue33 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue30) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue30) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue31) * varyingColor2.w) + productValue31;
    fragmentColor0.y = ((varyingColor2.y - productValue32) * varyingColor2.w) + productValue32;
    fragmentColor0.z = ((varyingColor2.z - productValue33) * varyingColor2.w) + productValue33;
    fragmentColor0.w = max(0.0f, (productValue21 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue3;
    float productValue4;
    float productValue5;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue3 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue5) - scalarValue5) * scalarValue1) + scalarValue5;
        productValue4 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue6) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue5 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue7) - scalarValue7) * scalarValue1) + scalarValue7;
    }
    else
    {
        productValue3 = ((sampledTextureValue1.x - productValue) * scalarValue) + productValue;
        productValue4 = ((sampledTextureValue1.y - productValue1) * scalarValue) + productValue1;
        productValue5 = ((sampledTextureValue1.z - productValue2) * scalarValue) + productValue2;
    }
    float productValue34 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue3;
    float productValue35 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue4;
    float productValue36 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue5;
    float productValue37 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue34) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue34) * varyingColor3.x;
    float productValue38 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue35) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue35) * varyingColor3.y;
    float productValue39 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue36) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue36) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue37) * varyingColor2.w) + productValue37;
    fragmentColor0.y = ((varyingColor2.y - productValue38) * varyingColor2.w) + productValue38;
    fragmentColor0.z = ((varyingColor2.z - productValue39) * varyingColor2.w) + productValue39;
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue21 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue22 = productValue21 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2);
    float productValue23 = productValue21 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3);
    float productValue24 = productValue21 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue4);
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue4;
    float productValue5;
    float productValue6;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue4 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue5) - scalarValue5) * scalarValue1) + scalarValue5;
        productValue5 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue6) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue6 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue7) - scalarValue7) * scalarValue1) + scalarValue7;
    }
    else
    {
        productValue4 = (productValue22 + scalarValue2) - (productValue22 * scalarValue);
        productValue5 = (productValue23 + scalarValue3) - (productValue23 * scalarValue);
        productValue6 = (productValue24 + scalarValue4) - (productValue24 * scalarValue);
    }
    float productValue40 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue4;
    float productValue41 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue5;
    float productValue42 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue6;
    float productValue43 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40) * varyingColor3.x;
    float productValue44 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue41) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue41) * varyingColor3.y;
    float productValue45 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue42) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue42) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue43) * varyingColor2.w) + productValue43;
    fragmentColor0.y = ((varyingColor2.y - productValue44) * varyingColor2.w) + productValue44;
    fragmentColor0.z = ((varyingColor2.z - productValue45) * varyingColor2.w) + productValue45;
    fragmentColor0.w = max(0.0f, (productValue21 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue46 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue47 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * productValue46) + productValue;
    float productValue48 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * productValue46) + productValue1;
    float productValue49 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * productValue46) + productValue2;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue50 = ((sampledTextureValue1.x - productValue47) * scalarValue) + productValue47;
    float productValue51 = ((sampledTextureValue1.y - productValue48) * scalarValue) + productValue48;
    float productValue52 = ((sampledTextureValue1.z - productValue49) * scalarValue) + productValue49;
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue53 = (((sampledTextureValue2.x - productValue50) * scalarValue1) + productValue50) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue54 = (((sampledTextureValue2.y - productValue51) * scalarValue1) + productValue51) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue55 = (((sampledTextureValue2.z - productValue52) * scalarValue1) + productValue52) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue56 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue53) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue53) * varyingColor3.x;
    float productValue57 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue54) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue54) * varyingColor3.y;
    float productValue58 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue55) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue55) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue56) * varyingColor2.w) + productValue56;
    fragmentColor0.y = ((varyingColor2.y - productValue57) * varyingColor2.w) + productValue57;
    fragmentColor0.z = ((varyingColor2.z - productValue58) * varyingColor2.w) + productValue58;
    fragmentColor0.w = max(0.0f, productValue46 * RD_UNIFORM_CHANGE_COLOR.w);
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue21 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue59 = (productValue21 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2)) + scalarValue2;
    float productValue60 = (productValue21 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3)) + scalarValue3;
    float productValue61 = (productValue21 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue4)) + scalarValue4;
    float productValue62 = (productValue21 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue63 = (((productValue59 * RD_UNIFORM_CHANGE_COLOR.x) - productValue59) * productValue62) + productValue59;
    float productValue64 = (((productValue60 * RD_UNIFORM_CHANGE_COLOR.y) - productValue60) * productValue62) + productValue60;
    float productValue65 = (((productValue61 * RD_UNIFORM_CHANGE_COLOR.z) - productValue61) * productValue62) + productValue61;
    float productValue66 = ((scalarValue2 - productValue63) * scalarValue) + productValue63;
    float productValue67 = ((scalarValue3 - productValue64) * scalarValue) + productValue64;
    float productValue68 = ((scalarValue4 - productValue65) * scalarValue) + productValue65;
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue69 = (((sampledTextureValue2.x - productValue66) * scalarValue1) + productValue66) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue70 = (((sampledTextureValue2.y - productValue67) * scalarValue1) + productValue67) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue71 = (((sampledTextureValue2.z - productValue68) * scalarValue1) + productValue68) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue72 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue69) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue69) * varyingColor3.x;
    float productValue73 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue70) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue70) * varyingColor3.y;
    float productValue74 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue71) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue71) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue72) * varyingColor2.w) + productValue72;
    fragmentColor0.y = ((varyingColor2.y - productValue73) * varyingColor2.w) + productValue73;
    fragmentColor0.z = ((varyingColor2.z - productValue74) * varyingColor2.w) + productValue74;
    fragmentColor0.w = max(0.0f, productValue62 * RD_UNIFORM_CHANGE_COLOR.w);
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue46 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue47 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * productValue46) + productValue;
    float productValue48 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * productValue46) + productValue1;
    float productValue49 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * productValue46) + productValue2;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue7;
    float productValue8;
    float productValue9;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue7 = (((scalarValue5 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue5) * scalarValue1) + scalarValue5;
        productValue8 = (((scalarValue6 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue9 = (((scalarValue7 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue7) * scalarValue1) + scalarValue7;
    }
    else
    {
        productValue7 = ((sampledTextureValue1.x - productValue47) * scalarValue) + productValue47;
        productValue8 = ((sampledTextureValue1.y - productValue48) * scalarValue) + productValue48;
        productValue9 = ((sampledTextureValue1.z - productValue49) * scalarValue) + productValue49;
    }
    float productValue75 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue7;
    float productValue76 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue8;
    float productValue77 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue9;
    float productValue78 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue75) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue75) * varyingColor3.x;
    float productValue79 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue76) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue76) * varyingColor3.y;
    float productValue80 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue77) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue77) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue78) * varyingColor2.w) + productValue78;
    fragmentColor0.y = ((varyingColor2.y - productValue79) * varyingColor2.w) + productValue79;
    fragmentColor0.z = ((varyingColor2.z - productValue80) * varyingColor2.w) + productValue80;
    fragmentColor0.w = max(0.0f, productValue46 * RD_UNIFORM_CHANGE_COLOR.w);
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue21 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue59 = (productValue21 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2)) + scalarValue2;
    float productValue60 = (productValue21 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3)) + scalarValue3;
    float productValue61 = (productValue21 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue4)) + scalarValue4;
    float productValue62 = (productValue21 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue63 = (((productValue59 * RD_UNIFORM_CHANGE_COLOR.x) - productValue59) * productValue62) + productValue59;
    float productValue64 = (((productValue60 * RD_UNIFORM_CHANGE_COLOR.y) - productValue60) * productValue62) + productValue60;
    float productValue65 = (((productValue61 * RD_UNIFORM_CHANGE_COLOR.z) - productValue61) * productValue62) + productValue61;
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue8 = (((scalarValue5 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue5) * scalarValue1) + scalarValue5;
        productValue9 = (((scalarValue6 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue10 = (((scalarValue7 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue7) * scalarValue1) + scalarValue7;
    }
    else
    {
        productValue8 = ((scalarValue2 - productValue63) * scalarValue) + productValue63;
        productValue9 = ((scalarValue3 - productValue64) * scalarValue) + productValue64;
        productValue10 = ((scalarValue4 - productValue65) * scalarValue) + productValue65;
    }
    float productValue81 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue8;
    float productValue82 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue9;
    float productValue83 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue10;
    float productValue84 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue81) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue81) * varyingColor3.x;
    float productValue85 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue82) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue82) * varyingColor3.y;
    float productValue86 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue83) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue83) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue84) * varyingColor2.w) + productValue84;
    fragmentColor0.y = ((varyingColor2.y - productValue85) * varyingColor2.w) + productValue85;
    fragmentColor0.z = ((varyingColor2.z - productValue86) * varyingColor2.w) + productValue86;
    fragmentColor0.w = max(0.0f, productValue62 * RD_UNIFORM_CHANGE_COLOR.w);
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue87 = RD_UNIFORM_CHANGE_COLOR.x * productValue;
    float productValue88 = RD_UNIFORM_CHANGE_COLOR.y * productValue;
    float productValue89 = RD_UNIFORM_CHANGE_COLOR.z * productValue;
    float scalarValue8 = ceil(productValue1);
    float productValue90 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue87) * scalarValue8) + productValue87;
    float productValue91 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue88) * scalarValue8) + productValue88;
    float productValue92 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue89) * scalarValue8) + productValue89;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue93 = ((sampledTextureValue1.x - productValue90) * scalarValue) + productValue90;
    float productValue94 = ((sampledTextureValue1.y - productValue91) * scalarValue) + productValue91;
    float productValue95 = ((sampledTextureValue1.z - productValue92) * scalarValue) + productValue92;
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue96 = (((sampledTextureValue2.x - productValue93) * scalarValue1) + productValue93) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue97 = (((sampledTextureValue2.y - productValue94) * scalarValue1) + productValue94) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue98 = (((sampledTextureValue2.z - productValue95) * scalarValue1) + productValue95) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue99 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue96) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue96) * varyingColor3.x;
    float productValue100 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue97) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue97) * varyingColor3.y;
    float productValue101 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue98) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue98) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue99) * varyingColor2.w) + productValue99;
    fragmentColor0.y = ((varyingColor2.y - productValue100) * varyingColor2.w) + productValue100;
    fragmentColor0.z = ((varyingColor2.z - productValue101) * varyingColor2.w) + productValue101;
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue21 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue59 = (productValue21 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2)) + scalarValue2;
    float productValue60 = (productValue21 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3)) + scalarValue3;
    float productValue102 = productValue59 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue103 = productValue59 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue104 = productValue59 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue9 = ceil(productValue60);
    float productValue105 = (((productValue60 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue102) * scalarValue9) + productValue102;
    float productValue106 = (((productValue60 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue103) * scalarValue9) + productValue103;
    float productValue107 = (((productValue60 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue104) * scalarValue9) + productValue104;
    float productValue108 = ((scalarValue2 - productValue105) * scalarValue) + productValue105;
    float productValue109 = ((scalarValue3 - productValue106) * scalarValue) + productValue106;
    float productValue110 = ((scalarValue4 - productValue107) * scalarValue) + productValue107;
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue111 = (((sampledTextureValue2.x - productValue108) * scalarValue1) + productValue108) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue112 = (((sampledTextureValue2.y - productValue109) * scalarValue1) + productValue109) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue113 = (((sampledTextureValue2.z - productValue110) * scalarValue1) + productValue110) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue114 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue111) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue111) * varyingColor3.x;
    float productValue115 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue112) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue112) * varyingColor3.y;
    float productValue116 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue113) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue113) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue114) * varyingColor2.w) + productValue114;
    fragmentColor0.y = ((varyingColor2.y - productValue115) * varyingColor2.w) + productValue115;
    fragmentColor0.z = ((varyingColor2.z - productValue116) * varyingColor2.w) + productValue116;
    fragmentColor0.w = max(0.0f, (productValue21 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue87 = RD_UNIFORM_CHANGE_COLOR.x * productValue;
    float productValue88 = RD_UNIFORM_CHANGE_COLOR.y * productValue;
    float productValue89 = RD_UNIFORM_CHANGE_COLOR.z * productValue;
    float scalarValue8 = ceil(productValue1);
    float productValue90 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue87) * scalarValue8) + productValue87;
    float productValue91 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue88) * scalarValue8) + productValue88;
    float productValue92 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue89) * scalarValue8) + productValue89;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue8 = (((scalarValue5 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue5) * scalarValue1) + scalarValue5;
        productValue9 = (((scalarValue6 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue10 = (((scalarValue7 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue7) * scalarValue1) + scalarValue7;
    }
    else
    {
        productValue8 = ((sampledTextureValue1.x - productValue90) * scalarValue) + productValue90;
        productValue9 = ((sampledTextureValue1.y - productValue91) * scalarValue) + productValue91;
        productValue10 = ((sampledTextureValue1.z - productValue92) * scalarValue) + productValue92;
    }
    float productValue81 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue8;
    float productValue82 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue9;
    float productValue83 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue10;
    float productValue84 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue81) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue81) * varyingColor3.x;
    float productValue85 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue82) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue82) * varyingColor3.y;
    float productValue86 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue83) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue83) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue84) * varyingColor2.w) + productValue84;
    fragmentColor0.y = ((varyingColor2.y - productValue85) * varyingColor2.w) + productValue85;
    fragmentColor0.z = ((varyingColor2.z - productValue86) * varyingColor2.w) + productValue86;
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue21 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue59 = (productValue21 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2)) + scalarValue2;
    float productValue60 = (productValue21 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3)) + scalarValue3;
    float productValue102 = productValue59 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue103 = productValue59 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue104 = productValue59 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue9 = ceil(productValue60);
    float productValue105 = (((productValue60 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue102) * scalarValue9) + productValue102;
    float productValue106 = (((productValue60 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue103) * scalarValue9) + productValue103;
    float productValue107 = (((productValue60 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue104) * scalarValue9) + productValue104;
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue9;
    float productValue10;
    float productValue11;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue9 = (((scalarValue5 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue5) * scalarValue1) + scalarValue5;
        productValue10 = (((scalarValue6 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue11 = (((scalarValue7 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue7) * scalarValue1) + scalarValue7;
    }
    else
    {
        productValue9 = ((scalarValue2 - productValue105) * scalarValue) + productValue105;
        productValue10 = ((scalarValue3 - productValue106) * scalarValue) + productValue106;
        productValue11 = ((scalarValue4 - productValue107) * scalarValue) + productValue107;
    }
    float productValue117 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue9;
    float productValue118 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue10;
    float productValue119 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue11;
    float productValue120 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue117) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue117) * varyingColor3.x;
    float productValue121 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue118) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue118) * varyingColor3.y;
    float productValue122 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue119) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue119) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue120) * varyingColor2.w) + productValue120;
    fragmentColor0.y = ((varyingColor2.y - productValue121) * varyingColor2.w) + productValue121;
    fragmentColor0.z = ((varyingColor2.z - productValue122) * varyingColor2.w) + productValue122;
    fragmentColor0.w = max(0.0f, (productValue21 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
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
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
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
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
  float4 workingVector0,workingVector1,workingVector2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector0.xyzw;
  workingVector1.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = max(0, workingVector1.w);
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = -RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz + workingVector1.xyz;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = max(0, workingVector0.w);
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector0.xyzw;
  workingVector1.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = max(0, workingVector1.w);
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector0.xyzw;
  workingVector1.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector1.w = RD_UNIFORM_CHANGE_COLOR.w * workingVector1.w;
  fragmentColor0.w = max(0, workingVector1.w);
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.w = RD_UNIFORM_CHANGE_COLOR.w * workingVector0.w;
  fragmentColor0.w = max(0, workingVector0.w);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector0.xyzw;
  workingVector1.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector1.w = RD_UNIFORM_CHANGE_COLOR.w * workingVector1.w;
  fragmentColor0.w = max(0, workingVector1.w);
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector2.xyw + -workingVector0.xyw;
  workingVector1.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xyw;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector1.xxx;
  workingVector3.xyz = workingVector1.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector1.x = ceil(workingVector1.y);
  fragmentColor0.w = max(0, workingVector1.z);
  workingVector1.xyz = workingVector1.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyw;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.y);
  fragmentColor0.w = max(0, workingVector0.z);
  workingVector0.xyz = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector2.xyw + -workingVector0.xyw;
  workingVector1.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xyw;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector1.xxx;
  workingVector3.xyz = workingVector1.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector1.x = ceil(workingVector1.y);
  fragmentColor0.w = max(0, workingVector1.z);
  workingVector1.xyz = workingVector1.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector1.yzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector1.yzw + -workingVector0.xyw;
  workingVector1.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xyw;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector1.xxx;
  workingVector3.xyz = workingVector1.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector1.x = ceil(workingVector1.y);
  fragmentColor0.w = max(0, workingVector1.z);
  workingVector1.xyz = workingVector1.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.y);
  fragmentColor0.w = max(0, workingVector0.z);
  workingVector0.xyz = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(0 < workingVector1.x);
  workingVector1.x = workingVector1.x ? 1.000000 : 0;
  workingVector1.yzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector1.yzw + -workingVector0.xyw;
  workingVector1.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xyw;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector1.xxx;
  workingVector3.xyz = workingVector1.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector1.x = ceil(workingVector1.y);
  fragmentColor0.w = max(0, workingVector1.z);
  workingVector1.xyz = workingVector1.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
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
