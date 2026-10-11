// RenderChunk / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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
#define RD_BINDING_LAYOUT 14
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
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.x = RD_COMPARISON_MASK(0.5 < varyingTexCoord2.y);
  workingVector1.w = 1;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + RD_UNIFORM_FOG_COLOR.xyz;
  fragmentColor0.w = workingVector0.w;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xy = varyingColor1.xy / varyingColor1.ww;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector0.xy;
  workingVector0.xy = workingVector0.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector0.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz * workingVector0.xy;
  workingVector1.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector0.xyxy;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector1.xyzw = floor(workingVector1.xyzw);
  workingVector0.zw = workingVector1.yw * workingVector1.yw;
  workingVector0.zw = float2(0.75,0.75) * workingVector0.zw;
  workingVector0.zw = workingVector1.xz * float2(0.5,0.5) + workingVector0.zw;
  workingVector0.zw = frac(workingVector0.zw);
  workingVector0.z = workingVector0.z * 0.25 + workingVector0.w;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = 0.75 * workingVector0.y;
  workingVector0.x = workingVector0.x * 0.5 + workingVector0.y;
  workingVector0.x = frac(workingVector0.x);
  workingVector0.x = workingVector0.z * 0.25 + workingVector0.x;
  workingVector0.x = workingVector0.x * 64 + 0.5;
  workingVector0.x = 0.015625 * workingVector0.x;
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector0.y = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.y = rsqrt(workingVector0.y);
  workingVector0.yzw = workingVector1.xyz * workingVector0.yyy;
  workingVector1.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.xyz + varyingColor3.xyz;
  workingVector0.y = dot(-workingVector0.yzw, workingVector1.xyz);
  workingVector0.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x + workingVector0.y;
  workingVector0.z = RD_UNIFORM_DITHER_PARAMS2_ROW_2.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x;
  workingVector0.z = 1 / workingVector0.z;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector0.y);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.yzw = workingVector1.xyz * varyingColor0.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  workingVector1.xyzw = varyingColor0.xyzw * workingVector1.xyzw;
  workingVector2.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector2.w = 1;
  workingVector0.yz = RD_COMPARISON_MASK(float2(0.5,0.5) < varyingTexCoord2.yx);
  workingVector1.xyzw = workingVector0.yyyy ? workingVector2.xyzw : workingVector1.xyzw;
  workingVector0.x = workingVector0.x ? 0 : workingVector1.w;
  fragmentColor0.w = workingVector0.z ? workingVector0.x : workingVector1.w;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyzw;
  workingVector2.xyz = workingVector0.xyz * workingVector1.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_FOG_COLOR.xyz;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.x = RD_COMPARISON_MASK(0.5 < varyingTexCoord2.y);
  workingVector1.w = 1;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyz;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + RD_UNIFORM_FOG_COLOR.xyz;
  fragmentColor0.w = workingVector0.w;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xy = varyingColor1.xy / varyingColor1.ww;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector0.xy;
  workingVector0.xy = workingVector0.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector0.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz * workingVector0.xy;
  workingVector1.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector0.xyxy;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector1.xyzw = floor(workingVector1.xyzw);
  workingVector0.zw = workingVector1.yw * workingVector1.yw;
  workingVector0.zw = float2(0.75,0.75) * workingVector0.zw;
  workingVector0.zw = workingVector1.xz * float2(0.5,0.5) + workingVector0.zw;
  workingVector0.zw = frac(workingVector0.zw);
  workingVector0.z = workingVector0.z * 0.25 + workingVector0.w;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = 0.75 * workingVector0.y;
  workingVector0.x = workingVector0.x * 0.5 + workingVector0.y;
  workingVector0.x = frac(workingVector0.x);
  workingVector0.x = workingVector0.z * 0.25 + workingVector0.x;
  workingVector0.x = workingVector0.x * 64 + 0.5;
  workingVector0.x = 0.015625 * workingVector0.x;
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector0.y = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.y = rsqrt(workingVector0.y);
  workingVector0.yzw = workingVector1.xyz * workingVector0.yyy;
  workingVector1.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.xyz + varyingColor3.xyz;
  workingVector0.y = dot(-workingVector0.yzw, workingVector1.xyz);
  workingVector0.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x + workingVector0.y;
  workingVector0.z = RD_UNIFORM_DITHER_PARAMS2_ROW_2.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x;
  workingVector0.z = 1 / workingVector0.z;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector0.y);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.yzw = workingVector1.xyz * varyingColor0.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  workingVector1.xyzw = varyingColor0.xyzw * workingVector1.xyzw;
  workingVector2.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector2.w = 1;
  workingVector0.yz = RD_COMPARISON_MASK(float2(0.5,0.5) < varyingTexCoord2.yx);
  workingVector1.xyzw = workingVector0.yyyy ? workingVector2.xyzw : workingVector1.xyzw;
  workingVector0.x = workingVector0.x ? 0 : workingVector1.w;
  fragmentColor0.w = workingVector0.z ? workingVector0.x : workingVector1.w;
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyz;
  workingVector2.xyz = workingVector0.xyz * workingVector1.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_FOG_COLOR.xyz;
#endif
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = scalarValue * varyingColor0.x;
    float productValue1 = scalarValue1 * varyingColor0.y;
    float productValue2 = scalarValue2 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue4;
    if (varyingTexCoord2.y > 0.5f)
    {
        productValue3 = (((productValue - scalarValue) * scalarValue3) + scalarValue) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue1) * scalarValue3) + scalarValue1) * varyingColor0.w;
        productValue5 = (((productValue2 - scalarValue2) * scalarValue3) + scalarValue2) * varyingColor0.w;
        intermediateValue4 = 1.0f;
    }
    else
    {
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue2;
        intermediateValue4 = scalarValue3 * varyingColor0.w;
    }
#if RD_FEATURE_DITHERING == RD_ON
    float intermediateValue6;
    if (varyingTexCoord2.x > 0.5f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingColor3.x - RD_UNIFORM_VIEW_POSITION_AND_TIME.x, varyingColor3.y - RD_UNIFORM_VIEW_POSITION_AND_TIME.y, varyingColor3.z - RD_UNIFORM_VIEW_POSITION_AND_TIME.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_2.y - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float productValue9 = floor(quotientValue1 * 0.25f);
        float productValue10 = floor(quotientValue1 * 0.5f);
        float scalarValue4 = floor(quotientValue1);
        float branchMergedValue;
        if (!(((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue10 * productValue10) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue9 * productValue9) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue4 * scalarValue4) * 0.75f) + (floor(quotientValue) * 0.5f)))))
        {
            branchMergedValue = intermediateValue4;
        }
        else
        {
            branchMergedValue = 0.0f;
        }
        intermediateValue6 = branchMergedValue;
    }
    else
    {
        intermediateValue6 = intermediateValue4;
    }
#endif
    float4 sampledTextureValue1 = lightMapTextureTexture.Sample(lightMapTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue6 = sampledTextureValue1.x * productValue3;
    float productValue7 = sampledTextureValue1.y * productValue4;
    float productValue8 = sampledTextureValue1.z * productValue5;
    fragmentColor0.x = ((RD_UNIFORM_FOG_COLOR.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((RD_UNIFORM_FOG_COLOR.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((RD_UNIFORM_FOG_COLOR.z - productValue8) * varyingColor2.w) + productValue8;
#if RD_FEATURE_DITHERING == RD_OFF
    fragmentColor0.w = intermediateValue4;
#elif RD_FEATURE_DITHERING == RD_ON
    fragmentColor0.w = intermediateValue6;
#endif
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
