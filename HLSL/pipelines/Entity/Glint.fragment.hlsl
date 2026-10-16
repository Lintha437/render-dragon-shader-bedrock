// Entity / Glint / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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
#define RD_BINDING_LAYOUT 66
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
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  workingVector0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_GLINT_COLOR.xyzw * workingVector2.xyzx;
  workingVector1.xyzw = workingVector1.xyzx * RD_UNIFORM_GLINT_COLOR.xyzw + workingVector2.xyzw;
  workingVector1.xyzw = RD_UNIFORM_TILE_LIGHT_COLOR.xyzw * workingVector1.xyzw;
  workingVector2.xyz = workingVector1.xyz * workingVector1.xyz;
  workingVector2.w = abs(workingVector1.w);
  workingVector0.w = 0;
  fragmentColor0.xyzw = workingVector2.xyzw + workingVector0.xyzw;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  workingVector0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_GLINT_COLOR.xyzw * workingVector2.xyzx;
  workingVector1.xyzw = workingVector1.xyzx * RD_UNIFORM_GLINT_COLOR.xyzw + workingVector2.xyzw;
  workingVector1.xyzw = RD_UNIFORM_TILE_LIGHT_COLOR.xyzw * workingVector1.xyzw;
  workingVector2.xyz = workingVector1.xyz * workingVector1.xyz;
  workingVector2.w = abs(workingVector1.w);
  workingVector0.w = 0;
  fragmentColor0.xyzw = workingVector2.xyzw + workingVector0.xyzw;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  workingVector0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector2.xyz = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyz;
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyz;
  workingVector2.xyzw = RD_UNIFORM_GLINT_COLOR.xyzw * workingVector2.xyzx;
  workingVector1.xyzw = workingVector1.xyzx * RD_UNIFORM_GLINT_COLOR.xyzw + workingVector2.xyzw;
  workingVector1.xyzw = RD_UNIFORM_TILE_LIGHT_COLOR.xyzw * workingVector1.xyzw;
  workingVector2.xyz = workingVector1.xyz * workingVector1.xyz;
  workingVector2.w = abs(workingVector1.w);
  workingVector0.w = 0;
  fragmentColor0.xyzw = workingVector2.xyzw + workingVector0.xyzw;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  workingVector0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector2.xyz = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyz;
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyz;
  workingVector2.xyzw = RD_UNIFORM_GLINT_COLOR.xyzw * workingVector2.xyzx;
  workingVector1.xyzw = workingVector1.xyzx * RD_UNIFORM_GLINT_COLOR.xyzw + workingVector2.xyzw;
  workingVector1.xyzw = RD_UNIFORM_TILE_LIGHT_COLOR.xyzw * workingVector1.xyzw;
  workingVector2.xyz = workingVector1.xyz * workingVector1.xyz;
  workingVector2.w = abs(workingVector1.w);
  workingVector0.w = 0;
  fragmentColor0.xyzw = workingVector2.xyzw + workingVector0.xyzw;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (((RD_UNIFORM_OVERLAY_COLOR.x - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_MAT_COLOR0.x) * varyingColor3.x;
    float productValue1 = (((RD_UNIFORM_OVERLAY_COLOR.y - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_MAT_COLOR0.y) * varyingColor3.y;
    float productValue2 = (((RD_UNIFORM_OVERLAY_COLOR.z - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_MAT_COLOR0.z) * varyingColor3.z;
    float4 sampledTextureValue = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float scalarValue = sampledTextureValue.x;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float scalarValue1 = sampledTextureValue1.x;
    float productValue3 = ((RD_UNIFORM_GLINT_COLOR.x * scalarValue1) + (RD_UNIFORM_GLINT_COLOR.x * scalarValue)) * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    float productValue4 = ((RD_UNIFORM_GLINT_COLOR.y * sampledTextureValue1.y) + (RD_UNIFORM_GLINT_COLOR.y * sampledTextureValue.y)) * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    float productValue5 = ((RD_UNIFORM_GLINT_COLOR.z * sampledTextureValue1.z) + (RD_UNIFORM_GLINT_COLOR.z * sampledTextureValue.z)) * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    fragmentColor0.x = (((varyingColor2.x - productValue) * varyingColor2.w) + productValue) + (productValue3 * productValue3);
    fragmentColor0.y = (((varyingColor2.y - productValue1) * varyingColor2.w) + productValue1) + (productValue4 * productValue4);
    fragmentColor0.z = (((varyingColor2.z - productValue2) * varyingColor2.w) + productValue2) + (productValue5 * productValue5);
    fragmentColor0.w = abs(((RD_UNIFORM_GLINT_COLOR.w * scalarValue1) + (RD_UNIFORM_GLINT_COLOR.w * scalarValue)) * RD_UNIFORM_TILE_LIGHT_COLOR.w);
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
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue2.x;
    float scalarValue3 = sampledTextureValue2.y;
    float scalarValue4 = sampledTextureValue2.z;
    float productValue6 = (((RD_UNIFORM_OVERLAY_COLOR.x - scalarValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue2) * varyingColor3.x;
    float productValue7 = (((RD_UNIFORM_OVERLAY_COLOR.y - scalarValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue3) * varyingColor3.y;
    float productValue8 = (((RD_UNIFORM_OVERLAY_COLOR.z - scalarValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue4) * varyingColor3.z;
    float4 sampledTextureValue = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float scalarValue = sampledTextureValue.x;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float scalarValue1 = sampledTextureValue1.x;
    float productValue3 = ((RD_UNIFORM_GLINT_COLOR.x * scalarValue1) + (RD_UNIFORM_GLINT_COLOR.x * scalarValue)) * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    float productValue4 = ((RD_UNIFORM_GLINT_COLOR.y * sampledTextureValue1.y) + (RD_UNIFORM_GLINT_COLOR.y * sampledTextureValue.y)) * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    float productValue5 = ((RD_UNIFORM_GLINT_COLOR.z * sampledTextureValue1.z) + (RD_UNIFORM_GLINT_COLOR.z * sampledTextureValue.z)) * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    fragmentColor0.x = (((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6) + (productValue3 * productValue3);
    fragmentColor0.y = (((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7) + (productValue4 * productValue4);
    fragmentColor0.z = (((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8) + (productValue5 * productValue5);
    fragmentColor0.w = abs(((RD_UNIFORM_GLINT_COLOR.w * scalarValue1) + (RD_UNIFORM_GLINT_COLOR.w * scalarValue)) * RD_UNIFORM_TILE_LIGHT_COLOR.w);
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
#endif
}
