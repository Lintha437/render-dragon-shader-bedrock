// ItemInHandPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif


#include "../../include/materials/ItemInHandPrepass/FragmentBindings.hlsli"

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
  out uint4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1,
  out float4 fragmentColor2 : SV_TARGET2)
{
  float4 workingVector0,workingVector1,workingVector2;
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
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector0.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.xyz + float3(1,1,1);
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector1.xyz + workingVector0.xyz;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector0.xy = float2(-1,-1) + varyingColor0.xy;
  workingVector0.xy = RD_UNIFORM_COLOR_BASED.xx * workingVector0.xy + float2(1,1);
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
#endif
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  fragmentColor1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord5.xyz;
  workingVector0.w = RD_COMPARISON_MASK(varyingTexCoord8.w < varyingTexCoord8.x);
  workingVector1.x = varyingTexCoord8.x * 0.498039216 + 0.501960814;
  workingVector1.y = -varyingTexCoord8.w * 0.498039216 + 0.498039216;
  fragmentColor1.w = workingVector0.w ? workingVector1.x : workingVector1.y;
  workingVector0.w = dot(varyingNormal0.xyz, varyingNormal0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = varyingNormal0.xyz * workingVector0.www;
  workingVector0.w = abs(workingVector1.x) + abs(workingVector1.y);
  workingVector0.w = workingVector0.w + abs(workingVector1.z);
  workingVector0.w = 1 / workingVector0.w;
  workingVector1.xy = workingVector1.xy * workingVector0.ww;
  workingVector0.w = RD_COMPARISON_MASK(workingVector1.z < 0);
  workingVector1.zw = float2(1,1) + -abs(workingVector1.yx);
  workingVector2.xy = RD_COMPARISON_MASK(workingVector1.xy >= float2(0,0));
  workingVector2.xy = workingVector2.xy ? float2(1,1) : 0;
  workingVector2.xy = workingVector2.xy * float2(2,2) + float2(-1,-1);
  workingVector1.zw = workingVector2.xy * workingVector1.zw;
  fragmentColor2.xy = workingVector0.ww ? workingVector1.zw : workingVector1.xy;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector1.xyz;
  workingVector1.xy = workingVector1.xy / workingVector1.zz;
  workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector0.xxx + workingVector2.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector0.zzz + workingVector0.xyw;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor2.zw = workingVector1.xy + -workingVector0.xy;
  workingVector0.x = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector0.x = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector0.x;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 9.99999975e-005);
  workingVector0.y = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  workingVector1.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector0.y = workingVector1.x * 0.600000024 + 0.400000006;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector1.y = workingVector1.x * workingVector0.y;
  workingVector0.y = workingVector1.x * workingVector1.x;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector1.z = workingVector1.x * workingVector0.y;
  workingVector0.yzw = min(float3(1,1,1), workingVector1.xyz);
  workingVector0.xyz = workingVector0.xxx ? workingVector0.yzw : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector0.xyz = float3(0.166666672,0.166666672,0.166666672) * workingVector0.xyz;
  workingVector0.w = 0.00392156886;
  workingVector1.xy = max(workingVector0.xy, workingVector0.zw);
  workingVector0.w = max(workingVector1.x, workingVector1.y);
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.w = 255 * workingVector0.w;
  workingVector0.w = ceil(workingVector0.w);
  workingVector1.w = 0.00392156886 * workingVector0.w;
  workingVector1.xyz = workingVector0.xyz / workingVector1.www;
  workingVector1.xyzw = saturate(workingVector1.xyzw);
  workingVector0.xyzw = float4(255,255,255,255) * workingVector1.xyzw;
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  fragmentColor0.yz = mad((int2)workingVector0.xz, int2(256,256), (int2)workingVector0.yw);
  workingVector0.x = saturate(RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
  workingVector0.x = 255 * workingVector0.x;
  fragmentColor0.w = (uint)workingVector0.x;
  workingVector0.xy = saturate(varyingTexCoord8.zy);
  workingVector0.xy = float2(255,255) * workingVector0.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  fragmentColor0.x = mad((int)workingVector0.x, 256, (int)workingVector0.y);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float productValue = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f;
    float productValue1 = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue2 = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f;
    float productValue3 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * varyingColor0.w) + productValue2;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue17 = productValue * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue18 = productValue * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue19 = productValue * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue1 = ceil(productValue1);
    float productValue20 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue17) * scalarValue1) + productValue17;
    float productValue21 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue18) * scalarValue1) + productValue18;
    float productValue22 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue19) * scalarValue1) + productValue19;
#endif
    bool comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue6 = floor(quotientValue1 * 0.25f);
        float productValue7 = floor(quotientValue1 * 0.5f);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue7 * productValue7) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue6 * productValue6) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue * scalarValue) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue)
    {
        isFragmentDiscarded = true;
    }
    float sumValue = varyingTexCoord5.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue1 = varyingTexCoord5.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue2 = varyingTexCoord5.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue1 = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue8 = inverseLengthValue1 * varyingNormal0.x;
    float productValue9 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0f / ((abs(productValue9) + abs(productValue8)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue8;
    float productValue12 = quotientValue2 * productValue9;
    bool conditionValue = productValue10 < 0.0f;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue1 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue13 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue1 = clamp(productValue13, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue13 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue13, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue13 * productValue13) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue13, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue3 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue14 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue15 = clampedValue2 * 0.16666667163372039794921875f;
    float productValue16 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue4 = ceil(clamp(max(max(productValue14, productValue16), max(productValue15, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(varyingTexCoord8.z, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(varyingTexCoord8.y, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue14 / clampedValue4, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue15 / clampedValue4, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue16 / clampedValue4, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue4, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue20) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue20;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue21) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue21;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22;
#endif
    fragmentColor1.w = (varyingTexCoord8.x > varyingTexCoord8.w) ? ((varyingTexCoord8.x * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (varyingTexCoord8.w * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue ? (((productValue11 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue12))) : productValue11;
    fragmentColor2.y = conditionValue ? ((1.0f - abs(productValue11)) * ((productValue12 < 0.0f) ? (-1.0f) : 1.0f)) : productValue12;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue1)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue1)) * 0.5f;
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
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
}
#endif
