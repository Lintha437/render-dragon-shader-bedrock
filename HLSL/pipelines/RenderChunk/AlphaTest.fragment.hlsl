// RenderChunk / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif


#include "../../include/materials/RenderChunk/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  float4 varyingColor2 : COLOR2,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  float4 varyingColor3 : COLOR3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector1.x != 0) discard;
  workingVector0.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyzw;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector0.w != 0) discard;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingColor0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz * float3(2,2,2) + float3(-1,-1,-1);
  workingVector1.xyz = varyingColor0.zzz * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector0.xyz;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyzw;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector1.x = RD_COMPARISON_MASK(0.5 < varyingTexCoord2.x);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
  workingVector2.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.xyz + varyingColor3.xyz;
  workingVector1.y = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.z = RD_UNIFORM_DITHER_PARAMS2_ROW_2.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x;
  workingVector1.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x + workingVector1.y;
  workingVector1.z = 1 / workingVector1.z;
  workingVector1.y = saturate(workingVector1.y * workingVector1.z);
  workingVector1.z = workingVector1.y * -2 + 3;
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.y = workingVector1.z * workingVector1.y;
  workingVector1.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.zw;
  workingVector1.zw = workingVector1.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz * workingVector1.zw;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector2.x = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector1.w = 0.75 * workingVector1.w;
  workingVector1.z = workingVector1.z * 0.5 + workingVector1.w;
  workingVector1.z = frac(workingVector1.z);
  workingVector1.z = workingVector2.x * 0.25 + workingVector1.z;
  workingVector1.z = workingVector1.z * 64 + 0.5;
  workingVector1.z = 0.015625 * workingVector1.z;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.z >= workingVector1.y);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  if (workingVector1.x != 0) discard;
  workingVector0.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyzw;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector1.x = RD_COMPARISON_MASK(0.5 < varyingTexCoord2.x);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
  workingVector2.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.xyz + varyingColor3.xyz;
  workingVector1.y = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.z = RD_UNIFORM_DITHER_PARAMS2_ROW_2.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x;
  workingVector1.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x + workingVector1.y;
  workingVector1.z = 1 / workingVector1.z;
  workingVector1.y = saturate(workingVector1.y * workingVector1.z);
  workingVector1.z = workingVector1.y * -2 + 3;
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.y = workingVector1.z * workingVector1.y;
  workingVector1.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.zw;
  workingVector1.zw = workingVector1.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz * workingVector1.zw;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector2.x = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector1.w = 0.75 * workingVector1.w;
  workingVector1.z = workingVector1.z * 0.5 + workingVector1.w;
  workingVector1.z = frac(workingVector1.z);
  workingVector1.z = workingVector2.x * 0.25 + workingVector1.z;
  workingVector1.z = workingVector1.z * 64 + 0.5;
  workingVector1.z = 0.015625 * workingVector1.z;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.z >= workingVector1.y);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector0.w = (int)workingVector0.w | (int)workingVector1.x;
  if (workingVector0.w != 0) discard;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingColor0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz * float3(2,2,2) + float3(-1,-1,-1);
  workingVector1.xyz = varyingColor0.zzz * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector0.xyz;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyzw;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector1.x != 0) discard;
  workingVector0.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyz;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector0.w != 0) discard;
  workingVector1.xyz = materialTexture2.Sample(textureSampler2, varyingColor0.xy).xyz;
  workingVector1.xyz = workingVector1.xyz * float3(2,2,2) + float3(-1,-1,-1);
  workingVector1.xyz = varyingColor0.zzz * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector0.xyz;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyz;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector1.x = RD_COMPARISON_MASK(0.5 < varyingTexCoord2.x);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
  workingVector2.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.xyz + varyingColor3.xyz;
  workingVector1.y = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.z = RD_UNIFORM_DITHER_PARAMS2_ROW_2.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x;
  workingVector1.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x + workingVector1.y;
  workingVector1.z = 1 / workingVector1.z;
  workingVector1.y = saturate(workingVector1.y * workingVector1.z);
  workingVector1.z = workingVector1.y * -2 + 3;
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.y = workingVector1.z * workingVector1.y;
  workingVector1.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.zw;
  workingVector1.zw = workingVector1.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz * workingVector1.zw;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector2.x = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector1.w = 0.75 * workingVector1.w;
  workingVector1.z = workingVector1.z * 0.5 + workingVector1.w;
  workingVector1.z = frac(workingVector1.z);
  workingVector1.z = workingVector2.x * 0.25 + workingVector1.z;
  workingVector1.z = workingVector1.z * 64 + 0.5;
  workingVector1.z = 0.015625 * workingVector1.z;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.z >= workingVector1.y);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  if (workingVector1.x != 0) discard;
  workingVector0.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyz;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector1.x = RD_COMPARISON_MASK(0.5 < varyingTexCoord2.x);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
  workingVector2.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.xyz + varyingColor3.xyz;
  workingVector1.y = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.z = RD_UNIFORM_DITHER_PARAMS2_ROW_2.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x;
  workingVector1.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x + workingVector1.y;
  workingVector1.z = 1 / workingVector1.z;
  workingVector1.y = saturate(workingVector1.y * workingVector1.z);
  workingVector1.z = workingVector1.y * -2 + 3;
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.y = workingVector1.z * workingVector1.y;
  workingVector1.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.zw;
  workingVector1.zw = workingVector1.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz * workingVector1.zw;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector2.x = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector1.w = 0.75 * workingVector1.w;
  workingVector1.z = workingVector1.z * 0.5 + workingVector1.w;
  workingVector1.z = frac(workingVector1.z);
  workingVector1.z = workingVector2.x * 0.25 + workingVector1.z;
  workingVector1.z = workingVector1.z * 64 + 0.5;
  workingVector1.z = 0.015625 * workingVector1.z;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.z >= workingVector1.y);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector0.w = (int)workingVector0.w | (int)workingVector1.x;
  if (workingVector0.w != 0) discard;
  workingVector1.xyz = materialTexture2.Sample(textureSampler2, varyingColor0.xy).xyz;
  workingVector1.xyz = workingVector1.xyz * float3(2,2,2) + float3(-1,-1,-1);
  workingVector1.xyz = varyingColor0.zzz * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector0.xyz;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyz;
#endif
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + RD_UNIFORM_FOG_COLOR.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
#if RD_FEATURE_SEASONS == RD_OFF
  fragmentColor0.w = workingVector0.w;
#elif RD_FEATURE_SEASONS == RD_ON
  fragmentColor0.w = 1;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
    float scalarValue = sampledTextureValue.w;
    if (scalarValue < 0.5f)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
    if (sampledTextureValue.w < 0.5f)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
    float scalarValue = sampledTextureValue.w;
    bool comparisonValue;
    if (varyingTexCoord2.x > 0.5f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingColor3.x - RD_UNIFORM_VIEW_POSITION_AND_TIME.x, varyingColor3.y - RD_UNIFORM_VIEW_POSITION_AND_TIME.y, varyingColor3.z - RD_UNIFORM_VIEW_POSITION_AND_TIME.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_2.y - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float productValue6 = floor(quotientValue1 * 0.25f);
        float productValue7 = floor(quotientValue1 * 0.5f);
        float scalarValue1 = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue7 * productValue7) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue6 * productValue6) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue1 * scalarValue1) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((scalarValue < 0.5f) || comparisonValue)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
    bool comparisonValue;
    if (varyingTexCoord2.x > 0.5f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingColor3.x - RD_UNIFORM_VIEW_POSITION_AND_TIME.x, varyingColor3.y - RD_UNIFORM_VIEW_POSITION_AND_TIME.y, varyingColor3.z - RD_UNIFORM_VIEW_POSITION_AND_TIME.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_2.y - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float productValue6 = floor(quotientValue1 * 0.25f);
        float productValue7 = floor(quotientValue1 * 0.5f);
        float scalarValue1 = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue7 * productValue7) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue6 * productValue6) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue1 * scalarValue1) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((sampledTextureValue.w < 0.5f) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_FEATURE_SEASONS == RD_ON
    float4 sampledTextureValue2 = seasonsTextureTexture.Sample(seasonsTextureSampler, float2(varyingColor0.x, varyingColor0.y));
#endif
    float4 sampledTextureValue1 = lightMapTextureTexture.Sample(lightMapTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
#if RD_FEATURE_SEASONS == RD_OFF
    float productValue = (sampledTextureValue.x * varyingColor0.x) * sampledTextureValue1.x;
    float productValue1 = (sampledTextureValue.y * varyingColor0.y) * sampledTextureValue1.y;
    float productValue2 = (sampledTextureValue.z * varyingColor0.z) * sampledTextureValue1.z;
    fragmentColor0.x = ((RD_UNIFORM_FOG_COLOR.x - productValue) * varyingColor2.w) + productValue;
    fragmentColor0.y = ((RD_UNIFORM_FOG_COLOR.y - productValue1) * varyingColor2.w) + productValue1;
    fragmentColor0.z = ((RD_UNIFORM_FOG_COLOR.z - productValue2) * varyingColor2.w) + productValue2;
    fragmentColor0.w = scalarValue;
#elif RD_FEATURE_SEASONS == RD_ON
    float productValue3 = ((sampledTextureValue.x * varyingColor0.w) * ((((sampledTextureValue2.x * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f)) * sampledTextureValue1.x;
    float productValue4 = ((sampledTextureValue.y * varyingColor0.w) * ((((sampledTextureValue2.y * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f)) * sampledTextureValue1.y;
    float productValue5 = ((sampledTextureValue.z * varyingColor0.w) * ((((sampledTextureValue2.z * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f)) * sampledTextureValue1.z;
    fragmentColor0.x = ((RD_UNIFORM_FOG_COLOR.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((RD_UNIFORM_FOG_COLOR.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((RD_UNIFORM_FOG_COLOR.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = 1.0f;
#endif
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    varyingColor3 = stage_input.varyingColor3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
