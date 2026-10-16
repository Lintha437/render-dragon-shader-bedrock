// MeshFallbackPrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/MeshFallbackPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor0 : COLOR0,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTangent0 : TANGENT0,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out uint4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1,
  out float4 fragmentColor2 : SV_TARGET2)
{
#if RD_FEATURE_USE_TEXTURES == RD_ON
  float4 workingVector0,workingVector1,workingVector2;
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
  float4 workingVector0,workingVector1;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_FEATURE_USE_TEXTURES == RD_ON
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector0.w != 0) discard;
  workingVector0.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector0.xyz;
  fragmentColor1.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector0.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord4.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_MERS_UNIFORMS.w < RD_UNIFORM_MERS_UNIFORMS.x);
  workingVector1.x = RD_UNIFORM_MERS_UNIFORMS.x * 0.498039216 + 0.501960814;
  workingVector1.y = -RD_UNIFORM_MERS_UNIFORMS.w * 0.498039216 + 0.498039216;
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
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
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
#endif
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
#if RD_FEATURE_USE_TEXTURES == RD_ON
  workingVector0.x = saturate(RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
  workingVector0.x = 255 * workingVector0.x;
  fragmentColor0.w = (uint)workingVector0.x;
#endif
  workingVector0.xy = saturate(RD_UNIFORM_MERS_UNIFORMS.zy);
  workingVector0.xy = float2(255,255) * workingVector0.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  fragmentColor0.x = mad((int)workingVector0.x, 256, (int)workingVector0.y);
#if RD_FEATURE_USE_TEXTURES == RD_OFF
  workingVector0.x = saturate(RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
  workingVector0.x = 255 * workingVector0.x;
  fragmentColor0.w = (uint)workingVector0.x;
  workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_MERS_UNIFORMS.w < RD_UNIFORM_MERS_UNIFORMS.x);
  workingVector0.y = RD_UNIFORM_MERS_UNIFORMS.x * 0.498039216 + 0.501960814;
  workingVector0.z = -RD_UNIFORM_MERS_UNIFORMS.w * 0.498039216 + 0.498039216;
  fragmentColor1.w = workingVector0.x ? workingVector0.y : workingVector0.z;
  fragmentColor1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * varyingColor0.xyz;
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
  workingVector0.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord4.xyz;
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
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_FEATURE_USE_TEXTURES == RD_ON


#endif
void executeFragmentStage()
{
#if RD_FEATURE_USE_TEXTURES == RD_ON
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue.w < 0.5f)
    {
        isFragmentDiscarded = true;
    }
#endif
    float sumValue = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue1 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue2 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue = inverseLengthValue * varyingNormal0.x;
    float productValue1 = inverseLengthValue * varyingNormal0.y;
    float productValue2 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0f / ((abs(productValue1) + abs(productValue)) + abs(productValue2));
    float productValue3 = quotientValue * productValue;
    float productValue4 = quotientValue * productValue1;
    bool conditionValue = productValue2 < 0.0f;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue1 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue5 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue = clamp(productValue5, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue5 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue5, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue5 * productValue5) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue5, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue6 = clampedValue * 0.16666667163372039794921875f;
    float productValue7 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue8 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue3 = ceil(clamp(max(max(productValue6, productValue8), max(productValue7, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(RD_UNIFORM_MERS_UNIFORMS.z, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(RD_UNIFORM_MERS_UNIFORMS.y, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue6 / clampedValue3, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue7 / clampedValue3, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue8 / clampedValue3, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue3, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f);
#if RD_FEATURE_USE_TEXTURES == RD_ON
    fragmentColor1.x = (sampledTextureValue.x * varyingColor0.x) * RD_UNIFORM_CURRENT_COLOR.x;
    fragmentColor1.y = (sampledTextureValue.y * varyingColor0.y) * RD_UNIFORM_CURRENT_COLOR.y;
    fragmentColor1.z = (sampledTextureValue.z * varyingColor0.z) * RD_UNIFORM_CURRENT_COLOR.z;
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
    fragmentColor1.x = RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.x;
    fragmentColor1.y = RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.y;
    fragmentColor1.z = RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.z;
#endif
    fragmentColor1.w = (RD_UNIFORM_MERS_UNIFORMS.x > RD_UNIFORM_MERS_UNIFORMS.w) ? ((RD_UNIFORM_MERS_UNIFORMS.x * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (RD_UNIFORM_MERS_UNIFORMS.w * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue ? (((productValue3 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue4))) : productValue3;
    fragmentColor2.y = conditionValue ? ((1.0f - abs(productValue3)) * ((productValue4 < 0.0f) ? (-1.0f) : 1.0f)) : productValue4;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue1)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue1)) * 0.5f;
#if RD_FEATURE_USE_TEXTURES == RD_ON
    discardIfRequested();
#endif
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor0 = stage_input.varyingColor0;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
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
