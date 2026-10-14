// ItemInHandPrepassGlint / GeometryPrepass / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/ItemInHandPrepassGlint/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingTexCoord2 : TEXCOORD2,
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
  workingVector0.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector0.w = workingVector0.x * 0.600000024 + 0.400000006;
  workingVector0.w = workingVector0.w * 0.600000024 + 0.400000006;
  workingVector0.y = workingVector0.x * workingVector0.w;
  workingVector0.w = workingVector0.x * workingVector0.x;
  workingVector0.w = workingVector0.w * 0.600000024 + 0.400000006;
  workingVector0.z = workingVector0.x * workingVector0.w;
  workingVector0.xyz = min(float3(1,1,1), workingVector0.xyz);
  workingVector0.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector0.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 9.99999975e-005);
  workingVector1.x = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector0.w = workingVector0.w ? workingVector1.x : 0;
  workingVector0.xyz = workingVector0.www ? workingVector0.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
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
  workingVector0.xy = saturate(varyingTexCoord8.zy);
  workingVector0.xy = float2(255,255) * workingVector0.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  fragmentColor0.x = mad((int)workingVector0.x, 256, (int)workingVector0.y);
  workingVector0.x = saturate(RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
  workingVector0.x = 255 * workingVector0.x;
  fragmentColor0.w = (uint)workingVector0.x;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector0.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.xyz + float3(1,1,1);
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector1.xyz + workingVector0.xyz;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector0.xy = float2(-1,-1) + varyingColor0.xy;
  workingVector0.xy = RD_UNIFORM_COLOR_BASED.xx * workingVector0.xy + float2(1,1);
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.y = ceil(workingVector0.y);
  workingVector0.xyz = workingVector0.yyy * workingVector1.xyz + workingVector0.xzw;
#endif
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector2.xyz = materialTexture0.Sample(textureSampler0, workingVector1.zw).xyz;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, workingVector1.xy).xyz;
  workingVector2.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector2.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  fragmentColor1.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.xyz;
  workingVector0.x = RD_COMPARISON_MASK(varyingTexCoord8.w < varyingTexCoord8.x);
  workingVector0.y = varyingTexCoord8.x * 0.498039216 + 0.501960814;
  workingVector0.z = -varyingTexCoord8.w * 0.498039216 + 0.498039216;
  fragmentColor1.w = workingVector0.x ? workingVector0.y : workingVector0.z;
  workingVector0.x = dot(varyingNormal0.xyz, varyingNormal0.xyz);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xyz = varyingNormal0.xyz * workingVector0.xxx;
  workingVector0.w = abs(workingVector0.x) + abs(workingVector0.y);
  workingVector0.w = workingVector0.w + abs(workingVector0.z);
  workingVector0.w = 1 / workingVector0.w;
  workingVector0.xy = workingVector0.xy * workingVector0.ww;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0);
  workingVector1.xy = RD_COMPARISON_MASK(workingVector0.xy >= float2(0,0));
  workingVector1.xy = workingVector1.xy ? float2(1,1) : 0;
  workingVector1.xy = workingVector1.xy * float2(2,2) + float2(-1,-1);
  workingVector1.zw = float2(1,1) + -abs(workingVector0.yx);
  workingVector1.xy = workingVector1.zw * workingVector1.xy;
  fragmentColor2.xy = workingVector0.zz ? workingVector1.xy : workingVector0.xy;
  workingVector0.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord5.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector0.xxx + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector0.zzz + workingVector0.xyw;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector1.xyz;
  workingVector0.zw = workingVector1.xy / workingVector1.zz;
  workingVector0.zw = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor2.zw = workingVector0.zw + -workingVector0.xy;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float productValue = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f;
    float productValue1 = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue2 = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f;
    float productValue3 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * varyingColor0.w) + productValue2;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue18 = productValue * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue19 = productValue * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue20 = productValue * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue = ceil(productValue1);
    float productValue21 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue18) * scalarValue) + productValue18;
    float productValue22 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue19) * scalarValue) + productValue19;
    float productValue23 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue20) * scalarValue) + productValue20;
#endif
    float4 sampledTextureValue = glintTextureTexture.Sample(glintTextureSampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue1 = glintTextureTexture.Sample(glintTextureSampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue6 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue1.x + sampledTextureValue.x);
    float productValue7 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue1.y + sampledTextureValue.y);
    float productValue8 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue1.z + sampledTextureValue.z);
    float sumValue = varyingTexCoord5.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue1 = varyingTexCoord5.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue2 = varyingTexCoord5.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue9 = inverseLengthValue * varyingNormal0.x;
    float productValue10 = inverseLengthValue * varyingNormal0.y;
    float productValue11 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0f / ((abs(productValue10) + abs(productValue9)) + abs(productValue11));
    float productValue12 = quotientValue * productValue9;
    float productValue13 = quotientValue * productValue10;
    bool conditionValue = productValue11 < 0.0f;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue1 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue14 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue = clamp(productValue14, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue14 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue14, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue14 * productValue14) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue14, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue15 = clampedValue * 0.16666667163372039794921875f;
    float productValue16 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue17 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue3 = ceil(clamp(max(max(productValue15, productValue17), max(productValue16, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(varyingTexCoord8.z, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(varyingTexCoord8.y, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue15 / clampedValue3, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue16 / clampedValue3, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue17 / clampedValue3, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue3, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3) + (productValue6 * productValue6);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4) + (productValue7 * productValue7);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5) + (productValue8 * productValue8);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue21) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue21) + (productValue6 * productValue6);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22) + (productValue7 * productValue7);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23) + (productValue8 * productValue8);
#endif
    fragmentColor1.w = (varyingTexCoord8.x > varyingTexCoord8.w) ? ((varyingTexCoord8.x * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (varyingTexCoord8.w * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue ? (((productValue12 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue13))) : productValue12;
    fragmentColor2.y = conditionValue ? ((1.0f - abs(productValue12)) * ((productValue13 < 0.0f) ? (-1.0f) : 1.0f)) : productValue13;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue1)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue1)) * 0.5f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
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
