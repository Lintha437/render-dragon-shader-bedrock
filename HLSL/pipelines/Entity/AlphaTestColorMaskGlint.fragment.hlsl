// Entity / AlphaTestColorMaskGlint / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 18
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE0
#define RD_OPTION_SOURCE_INPUT_TYPE0 RD_SOURCE_INPUT_TYPE0_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE1
#define RD_OPTION_SOURCE_INPUT_TYPE1 RD_SOURCE_INPUT_TYPE1_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE2
#define RD_OPTION_SOURCE_INPUT_TYPE2 RD_SOURCE_INPUT_TYPE2_CONSTANT
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 18
#endif


#include "../../include/materials/Entity/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor2 : COLOR2,
  float4 varyingTexCoord2 : TEXCOORD2,
  float4 varyingColor3 : COLOR3,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
  workingVector0.x = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR0.w);
  if (workingVector0.x != 0) discard;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.x = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR0.w);
  if (workingVector0.x != 0) discard;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.xyz * workingVector0.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
  workingVector0.x = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR0.w);
  if (workingVector0.x != 0) discard;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR0.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector0.xyz * workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * workingVector0.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.x = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR0.w);
  if (workingVector0.x != 0) discard;
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.xyz * workingVector0.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector1.xyz = workingVector0.xyz * workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#endif
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  workingVector0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, workingVector1.xy).xyzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, workingVector1.zw).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector2.xyz = materialTexture2.Sample(textureSampler2, workingVector1.xy).xyz;
  workingVector1.xyz = materialTexture2.Sample(textureSampler2, workingVector1.zw).xyz;
#endif
  workingVector1.xyzw = RD_UNIFORM_GLINT_COLOR.xyzw * workingVector1.xyzx;
  workingVector1.xyzw = workingVector2.xyzx * RD_UNIFORM_GLINT_COLOR.xyzw + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_TILE_LIGHT_COLOR.xyzw * workingVector1.xyzw;
  workingVector2.xyz = workingVector1.xyz * workingVector1.xyz;
  workingVector2.w = abs(workingVector1.w);
  workingVector0.w = 0;
  fragmentColor0.xyzw = workingVector2.xyzw + workingVector0.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    if (!(!(RD_UNIFORM_MAT_COLOR0.w <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (!(!(RD_UNIFORM_MAT_COLOR0.w <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    float4 sampledTextureValue3 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.x;
    float scalarValue3 = sampledTextureValue3.y;
    float scalarValue4 = sampledTextureValue3.z;
    float scalarValue5 = sampledTextureValue3.w;
    if (!(!(scalarValue5 <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float4 sampledTextureValue3 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.x;
    float scalarValue3 = sampledTextureValue3.y;
    float scalarValue4 = sampledTextureValue3.z;
    float scalarValue5 = sampledTextureValue3.w;
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (!(!(scalarValue5 <= 0.0f)))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
    float productValue = (((RD_UNIFORM_MAT_COLOR1.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue1 = (((RD_UNIFORM_MAT_COLOR1.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue2 = (((RD_UNIFORM_MAT_COLOR1.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue3 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue) * varyingColor3.x;
    float productValue4 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue1) * varyingColor3.y;
    float productValue5 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue2) * varyingColor3.z;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float productValue9 = (((sampledTextureValue2.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue10 = (((sampledTextureValue2.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue11 = (((sampledTextureValue2.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue12 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue9) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue9) * varyingColor3.x;
    float productValue13 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue10) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue10) * varyingColor3.y;
    float productValue14 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11) * varyingColor3.z;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    float productValue15 = (((RD_UNIFORM_MAT_COLOR0.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue16 = (((RD_UNIFORM_MAT_COLOR0.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue17 = (((RD_UNIFORM_MAT_COLOR0.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue18 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue15) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue15) * varyingColor3.x;
    float productValue19 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue16) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue16) * varyingColor3.y;
    float productValue20 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue17) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue17) * varyingColor3.z;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
    float productValue21 = (((RD_UNIFORM_MAT_COLOR1.x * scalarValue2) - scalarValue2) * scalarValue5) + scalarValue2;
    float productValue22 = (((RD_UNIFORM_MAT_COLOR1.y * scalarValue3) - scalarValue3) * scalarValue5) + scalarValue3;
    float productValue23 = (((RD_UNIFORM_MAT_COLOR1.z * scalarValue4) - scalarValue4) * scalarValue5) + scalarValue4;
    float productValue24 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue21) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue21) * varyingColor3.x;
    float productValue25 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22) * varyingColor3.y;
    float productValue26 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23) * varyingColor3.z;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float productValue27 = (((sampledTextureValue2.x * scalarValue2) - scalarValue2) * scalarValue5) + scalarValue2;
    float productValue28 = (((sampledTextureValue2.y * scalarValue3) - scalarValue3) * scalarValue5) + scalarValue3;
    float productValue29 = (((sampledTextureValue2.z * scalarValue4) - scalarValue4) * scalarValue5) + scalarValue4;
    float productValue30 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue27) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue27) * varyingColor3.x;
    float productValue31 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue28) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue28) * varyingColor3.y;
    float productValue32 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue29) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue29) * varyingColor3.z;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    float productValue33 = (((scalarValue2 * scalarValue2) - scalarValue2) * scalarValue5) + scalarValue2;
    float productValue34 = (((scalarValue3 * scalarValue3) - scalarValue3) * scalarValue5) + scalarValue3;
    float productValue35 = (((scalarValue4 * scalarValue4) - scalarValue4) * scalarValue5) + scalarValue4;
    float productValue36 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue33) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue33) * varyingColor3.x;
    float productValue37 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue34) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue34) * varyingColor3.y;
    float productValue38 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue35) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue35) * varyingColor3.z;
#endif
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float scalarValue = sampledTextureValue.x;
    float4 sampledTextureValue1 = matTexture2Texture.Sample(matTexture2Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float scalarValue1 = sampledTextureValue1.x;
    float productValue6 = ((RD_UNIFORM_GLINT_COLOR.x * scalarValue1) + (RD_UNIFORM_GLINT_COLOR.x * scalarValue)) * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    float productValue7 = ((RD_UNIFORM_GLINT_COLOR.y * sampledTextureValue1.y) + (RD_UNIFORM_GLINT_COLOR.y * sampledTextureValue.y)) * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    float productValue8 = ((RD_UNIFORM_GLINT_COLOR.z * sampledTextureValue1.z) + (RD_UNIFORM_GLINT_COLOR.z * sampledTextureValue.z)) * RD_UNIFORM_TILE_LIGHT_COLOR.z;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
    fragmentColor0.x = (((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3) + (productValue6 * productValue6);
    fragmentColor0.y = (((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4) + (productValue7 * productValue7);
    fragmentColor0.z = (((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5) + (productValue8 * productValue8);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    fragmentColor0.x = (((varyingColor2.x - productValue12) * varyingColor2.w) + productValue12) + (productValue6 * productValue6);
    fragmentColor0.y = (((varyingColor2.y - productValue13) * varyingColor2.w) + productValue13) + (productValue7 * productValue7);
    fragmentColor0.z = (((varyingColor2.z - productValue14) * varyingColor2.w) + productValue14) + (productValue8 * productValue8);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    fragmentColor0.x = (((varyingColor2.x - productValue18) * varyingColor2.w) + productValue18) + (productValue6 * productValue6);
    fragmentColor0.y = (((varyingColor2.y - productValue19) * varyingColor2.w) + productValue19) + (productValue7 * productValue7);
    fragmentColor0.z = (((varyingColor2.z - productValue20) * varyingColor2.w) + productValue20) + (productValue8 * productValue8);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
    fragmentColor0.x = (((varyingColor2.x - productValue24) * varyingColor2.w) + productValue24) + (productValue6 * productValue6);
    fragmentColor0.y = (((varyingColor2.y - productValue25) * varyingColor2.w) + productValue25) + (productValue7 * productValue7);
    fragmentColor0.z = (((varyingColor2.z - productValue26) * varyingColor2.w) + productValue26) + (productValue8 * productValue8);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    fragmentColor0.x = (((varyingColor2.x - productValue30) * varyingColor2.w) + productValue30) + (productValue6 * productValue6);
    fragmentColor0.y = (((varyingColor2.y - productValue31) * varyingColor2.w) + productValue31) + (productValue7 * productValue7);
    fragmentColor0.z = (((varyingColor2.z - productValue32) * varyingColor2.w) + productValue32) + (productValue8 * productValue8);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    fragmentColor0.x = (((varyingColor2.x - productValue36) * varyingColor2.w) + productValue36) + (productValue6 * productValue6);
    fragmentColor0.y = (((varyingColor2.y - productValue37) * varyingColor2.w) + productValue37) + (productValue7 * productValue7);
    fragmentColor0.z = (((varyingColor2.z - productValue38) * varyingColor2.w) + productValue38) + (productValue8 * productValue8);
#endif
    fragmentColor0.w = abs(((RD_UNIFORM_GLINT_COLOR.w * scalarValue1) + (RD_UNIFORM_GLINT_COLOR.w * scalarValue)) * RD_UNIFORM_TILE_LIGHT_COLOR.w);
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
