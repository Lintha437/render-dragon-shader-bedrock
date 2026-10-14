// ItemInHandForwardPBR / DepthOnlyAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 8
#endif


#include "../../include/materials/ItemInHandForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingTexCoord8 : TEXCOORD8,
  float3 varyingNormal0 : NORMAL0,
  int4 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTexCoord5 : TEXCOORD5,
  float3 varyingTangent0 : TANGENT0,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector0.y = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.y = rsqrt(workingVector0.y);
  workingVector0.yzw = workingVector1.xyz * workingVector0.yyy;
  workingVector1.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector0.y = dot(-workingVector0.yzw, workingVector1.xyz);
  workingVector0.z = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector0.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector0.y;
  workingVector0.z = 1 / workingVector0.z;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector0.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector0.zw = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector0.zw;
  workingVector0.zw = workingVector0.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector0.zw = floor(workingVector0.zw);
  workingVector0.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector0.zw;
  workingVector1.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector0.zwzw;
  workingVector1.xyzw = floor(workingVector1.xyzw);
  workingVector1.yw = workingVector1.yw * workingVector1.yw;
  workingVector1.yw = float2(0.75,0.75) * workingVector1.yw;
  workingVector1.xy = workingVector1.xz * float2(0.5,0.5) + workingVector1.yw;
  workingVector1.xy = frac(workingVector1.xy);
  workingVector1.x = workingVector1.x * 0.25 + workingVector1.y;
  workingVector0.zw = floor(workingVector0.zw);
  workingVector0.w = workingVector0.w * workingVector0.w;
  workingVector0.w = 0.75 * workingVector0.w;
  workingVector0.z = workingVector0.z * 0.5 + workingVector0.w;
  workingVector0.z = frac(workingVector0.z);
  workingVector0.z = workingVector1.x * 0.25 + workingVector0.z;
  workingVector0.z = workingVector0.z * 64 + 0.5;
  workingVector0.z = 0.015625 * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.z >= workingVector0.y);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  if (workingVector0.x != 0) discard;
  fragmentColor0.xyzw = float4(0,0,0,0);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    bool comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue = floor(quotientValue1 * 0.25f);
        float productValue1 = floor(quotientValue1 * 0.5f);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue1 * productValue1) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue * productValue) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue * scalarValue) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = 0.0f;
    fragmentColor0.y = 0.0f;
    fragmentColor0.z = 0.0f;
    fragmentColor0.w = 0.0f;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord8 = stage_input.varyingTexCoord8;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
