// WeatherForwardPBR / MotionOnly / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 9
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FLIP_OCCLUSION
#define RD_FEATURE_FLIP_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_NO_OCCLUSION
#define RD_FEATURE_NO_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_NO_VARIETY
#define RD_FEATURE_NO_VARIETY RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 6
#endif


#include "../../include/materials/WeatherForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor1 : COLOR1,
  float varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  float4 varyingTexCoord4 : TEXCOORD4,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord1.xy).xyzw;
  workingVector0.xy = float2(255,255) * workingVector1.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.y = (uint)workingVector0.y << 8;
  workingVector0.x = (int)workingVector0.y | (int)workingVector0.x;
  workingVector0.x = (int)workingVector0.x & 1023;
  workingVector0.x = (uint)workingVector0.x;
  workingVector0.x = RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x + workingVector0.x;
  workingVector0.x = 0.00392156886 * workingVector0.x;
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector0.zw = RD_COMPARISON_MASK(varyingTexCoord1.xy >= float2(0,0));
  workingVector1.xy = RD_COMPARISON_MASK(float2(1,1) >= varyingTexCoord1.xy);
  workingVector0.z = workingVector0.z ? workingVector1.x : 0;
  workingVector0.z = workingVector0.w ? workingVector0.z : 0;
  workingVector0.z = workingVector1.y ? workingVector0.z : 0;
  workingVector0.x = RD_COMPARISON_MASK(varyingTexCoord2.x < workingVector0.x);
  workingVector0.x = workingVector0.x ? workingVector0.z : 0;
  workingVector0.x = (int)workingVector0.x | (int)workingVector0.y;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).xyzw;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord1.xy).xyzw;
  workingVector0.xy = float2(255,255) * workingVector1.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.y = (uint)workingVector0.y << 8;
  workingVector0.x = (int)workingVector0.y | (int)workingVector0.x;
  workingVector0.x = (int)workingVector0.x & 1023;
  workingVector0.x = (uint)workingVector0.x;
  workingVector0.x = RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x + workingVector0.x;
  workingVector0.x = 0.00392156886 * workingVector0.x;
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector0.zw = RD_COMPARISON_MASK(varyingTexCoord1.xy >= float2(0,0));
  workingVector1.xy = RD_COMPARISON_MASK(float2(1,1) >= varyingTexCoord1.xy);
  workingVector0.z = workingVector0.z ? workingVector1.x : 0;
  workingVector0.z = workingVector0.w ? workingVector0.z : 0;
  workingVector0.z = workingVector1.y ? workingVector0.z : 0;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < varyingTexCoord2.x);
  workingVector0.x = workingVector0.x ? workingVector0.z : 0;
  workingVector0.x = (int)workingVector0.x | (int)workingVector0.y;
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.x = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).w;
  workingVector0.yz = materialTexture2.Sample(textureSampler2, varyingTexCoord1.xy).xy;
  workingVector0.yz = float2(255,255) * workingVector0.yz;
  workingVector0.yz = round(workingVector0.yz);
  workingVector0.yz = (uint2)workingVector0.yz;
  workingVector0.z = (uint)workingVector0.z << 8;
  workingVector0.y = (int)workingVector0.z | (int)workingVector0.y;
  workingVector0.y = (int)workingVector0.y & 1023;
  workingVector0.y = (uint)workingVector0.y;
  workingVector0.y = RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x + workingVector0.y;
  workingVector0.y = 0.00392156886 * workingVector0.y;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 0.5);
  workingVector0.zw = RD_COMPARISON_MASK(varyingTexCoord1.xy >= float2(0,0));
  workingVector1.xy = RD_COMPARISON_MASK(float2(1,1) >= varyingTexCoord1.xy);
  workingVector0.z = workingVector0.z ? workingVector1.x : 0;
  workingVector0.z = workingVector0.w ? workingVector0.z : 0;
  workingVector0.z = workingVector1.y ? workingVector0.z : 0;
  workingVector0.y = RD_COMPARISON_MASK(varyingTexCoord2.x < workingVector0.y);
  workingVector0.y = workingVector0.y ? workingVector0.z : 0;
  workingVector0.x = (int)workingVector0.y | (int)workingVector0.x;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.x = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).w;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 0.5);
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.x = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).w;
  workingVector0.yz = materialTexture2.Sample(textureSampler2, varyingTexCoord1.xy).xy;
  workingVector0.yz = float2(255,255) * workingVector0.yz;
  workingVector0.yz = round(workingVector0.yz);
  workingVector0.yz = (uint2)workingVector0.yz;
  workingVector0.z = (uint)workingVector0.z << 8;
  workingVector0.y = (int)workingVector0.z | (int)workingVector0.y;
  workingVector0.y = (int)workingVector0.y & 1023;
  workingVector0.y = (uint)workingVector0.y;
  workingVector0.y = RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x + workingVector0.y;
  workingVector0.y = 0.00392156886 * workingVector0.y;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 0.5);
  workingVector0.zw = RD_COMPARISON_MASK(varyingTexCoord1.xy >= float2(0,0));
  workingVector1.xy = RD_COMPARISON_MASK(float2(1,1) >= varyingTexCoord1.xy);
  workingVector0.z = workingVector0.z ? workingVector1.x : 0;
  workingVector0.z = workingVector0.w ? workingVector0.z : 0;
  workingVector0.z = workingVector1.y ? workingVector0.z : 0;
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.y < varyingTexCoord2.x);
  workingVector0.y = workingVector0.y ? workingVector0.z : 0;
  workingVector0.x = (int)workingVector0.y | (int)workingVector0.x;
#endif
  if (workingVector0.x != 0) discard;
  workingVector0.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord4.xyz;
  workingVector1.xyz = varyingTexCoord3.xyz + -workingVector0.xyz;
  workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.w = sqrt(workingVector0.w);
  workingVector0.w = RD_COMPARISON_MASK(27 < workingVector0.w);
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector1.xyz;
  workingVector1.xy = workingVector1.xy / workingVector1.zz;
  workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * varyingTexCoord3.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * varyingTexCoord3.zzz + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector2.xyz;
  workingVector1.zw = workingVector2.xy / workingVector2.zz;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.zw = workingVector1.xy + -workingVector1.zw;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector0.yyy;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector0.xxx + workingVector2.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector0.zzz + workingVector2.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.xy = workingVector1.xy + -workingVector0.xy;
  fragmentColor0.zw = workingVector0.ww ? workingVector1.zw : workingVector0.xy;
  fragmentColor0.xy = float2(0,0);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF)
    float4 sampledTextureValue = occlusionTextureTexture.Sample(occlusionTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    if ((weatherTextureTexture.Sample(weatherTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5f) || (((varyingTexCoord1.y <= 1.0f) && (((varyingTexCoord1.x >= 0.0f) && (varyingTexCoord1.x <= 1.0f)) && (varyingTexCoord1.y >= 0.0f))) && (varyingTexCoord2 < ((float(((uint(round(sampledTextureValue.y * 255.0f)) << 8u) | uint(round(sampledTextureValue.x * 255.0f))) & 1023u) + RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x) * 0.0039215688593685626983642578125f))))
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    if (weatherTextureTexture.Sample(weatherTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5f)
#elif RD_FEATURE_FLIP_OCCLUSION == RD_ON
    float4 sampledTextureValue = occlusionTextureTexture.Sample(occlusionTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    if ((weatherTextureTexture.Sample(weatherTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5f) || (((varyingTexCoord1.y <= 1.0f) && (((varyingTexCoord1.x >= 0.0f) && (varyingTexCoord1.x <= 1.0f)) && (varyingTexCoord1.y >= 0.0f))) && (varyingTexCoord2 > ((float(((uint(round(sampledTextureValue.y * 255.0f)) << 8u) | uint(round(sampledTextureValue.x * 255.0f))) & 1023u) + RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x) * 0.0039215688593685626983642578125f))))
#endif
    {
        isFragmentDiscarded = true;
    }
    float sumValue = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue1 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue2 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float sumValue3 = varyingTexCoord3.x - sumValue;
    float sumValue4 = varyingTexCoord3.y - sumValue1;
    float sumValue5 = varyingTexCoord3.z - sumValue2;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue3;
    float multiplyAddValue4;
    if (sqrt(((sumValue3 * sumValue3) + (sumValue4 * sumValue4)) + (sumValue5 * sumValue5)) > 27.0f)
    {
        float multiplyAddValue1 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
        multiplyAddValue3 = (mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue1;
        multiplyAddValue4 = (mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue1;
    }
    else
    {
        float multiplyAddValue2 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
        multiplyAddValue3 = (mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue2;
        multiplyAddValue4 = (mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue2;
    }
    precise float multiplyAddValue5 = ((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue) - multiplyAddValue4;
    precise float multiplyAddValue6 = ((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue) - multiplyAddValue3;
    precise float productValue = multiplyAddValue5 * 0.5f;
    precise float productValue1 = multiplyAddValue6 * 0.5f;
    fragmentColor0.x = 0.0f;
    fragmentColor0.y = 0.0f;
    fragmentColor0.z = productValue1;
    fragmentColor0.w = productValue;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
