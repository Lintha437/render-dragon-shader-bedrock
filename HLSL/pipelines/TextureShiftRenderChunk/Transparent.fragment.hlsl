// TextureShiftRenderChunk / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#define RD_BINDING_LAYOUT 10
#endif


#include "../../include/materials/TextureShiftRenderChunk/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  float4 varyingColor2 : COLOR2,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  nointerpolation float4 varyingTexCoord5 : TEXCOORD5,
  float3 varyingTexCoord3 : TEXCOORD3,
  float4 varyingColor3 : COLOR3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_FEATURE_DITHERING == RD_OFF
  workingVector0.x = 65535 * varyingTexCoord5.y;
  workingVector0.x = (int)workingVector0.x;
  workingVector0.y = sampledResource3[workingVector0.x].val[20/4];
  workingVector0.z = sampledResource3[workingVector0.x].val[20/4+1];
  workingVector0.w = sampledResource3[workingVector0.x].val[20/4+2];
  workingVector1.x = sampledResource3[workingVector0.x].val[0/4];
  workingVector1.y = sampledResource3[workingVector0.x].val[0/4+1];
  workingVector1.z = sampledResource3[workingVector0.x].val[0/4+2];
  workingVector1.w = sampledResource3[workingVector0.x].val[0/4+3];
  workingVector1.xyzw = varyingTexCoord0.xyxy + workingVector1.xyzw;
  workingVector0.x = -varyingTexCoord5.x * workingVector0.w + 1;
  workingVector0.w = workingVector0.x + -workingVector0.y;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.y >= workingVector0.x);
  workingVector0.x = workingVector0.x ? 1.000000 : 0;
  workingVector0.y = saturate(workingVector0.w / workingVector0.z);
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z == 0.000000);
  workingVector0.y = 1 + -workingVector0.y;
  workingVector0.x = workingVector0.z ? workingVector0.x : workingVector0.y;
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector2.xyzw = workingVector2.xyzw + -workingVector1.xyzw;
  workingVector0.xyzw = workingVector0.xxxx * workingVector2.xyzw + workingVector1.xyzw;
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
#elif RD_FEATURE_DITHERING == RD_ON
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
  workingVector0.y = 65535 * varyingTexCoord5.y;
  workingVector0.y = (int)workingVector0.y;
  workingVector1.x = sampledResource3[workingVector0.y].val[20/4];
  workingVector1.y = sampledResource3[workingVector0.y].val[20/4+1];
  workingVector1.z = sampledResource3[workingVector0.y].val[20/4+2];
  workingVector2.x = sampledResource3[workingVector0.y].val[0/4];
  workingVector2.y = sampledResource3[workingVector0.y].val[0/4+1];
  workingVector2.z = sampledResource3[workingVector0.y].val[0/4+2];
  workingVector2.w = sampledResource3[workingVector0.y].val[0/4+3];
  workingVector2.xyzw = varyingTexCoord0.xyxy + workingVector2.xyzw;
  workingVector0.y = -varyingTexCoord5.x * workingVector1.z + 1;
  workingVector0.z = workingVector0.y + -workingVector1.x;
  workingVector0.y = RD_COMPARISON_MASK(workingVector1.x >= workingVector0.y);
  workingVector0.y = workingVector0.y ? 1.000000 : 0;
  workingVector0.z = saturate(workingVector0.z / workingVector1.y);
  workingVector0.w = RD_COMPARISON_MASK(workingVector1.y == 0.000000);
  workingVector0.z = 1 + -workingVector0.z;
  workingVector0.y = workingVector0.w ? workingVector0.y : workingVector0.z;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector2.zw).xyzw;
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector2.xy).xyzw;
  workingVector1.xyzw = -workingVector2.xyzw + workingVector1.xyzw;
  workingVector1.xyzw = workingVector0.yyyy * workingVector1.xyzw + workingVector2.xyzw;
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
    uint productValue = uint(int(varyingTexCoord5.y * 65535.0f));
    float loadedBufferValue = asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 5u).x);
    float loadedBufferValue1 = asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 6u).x);
    float loadedBufferValue2 = 1.0f - (asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 7u).x) * varyingTexCoord5.x);
    float quotientValue;
    if (loadedBufferValue1 == 0.0f)
    {
        quotientValue = (loadedBufferValue < loadedBufferValue2) ? 0.0f : 1.0f;
    }
    else
    {
        quotientValue = 1.0f - min(max((loadedBufferValue2 - loadedBufferValue) / loadedBufferValue1, 0.0f), 1.0f);
    }
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(asfloat(rdLoad_textureShiftBufferData(productValue * 8u).x) + varyingTexCoord0.x, asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 1u).x) + varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float4 sampledTextureValue1 = matTextureTexture.Sample(matTextureSampler, float2(asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 2u).x) + varyingTexCoord0.x, asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 3u).x) + varyingTexCoord0.y));
    float productValue1 = ((sampledTextureValue1.x - scalarValue) * quotientValue) + scalarValue;
    float productValue2 = ((sampledTextureValue1.y - scalarValue1) * quotientValue) + scalarValue1;
    float productValue3 = ((sampledTextureValue1.z - scalarValue2) * quotientValue) + scalarValue2;
    float productValue4 = ((sampledTextureValue1.w - scalarValue3) * quotientValue) + scalarValue3;
    float productValue5 = productValue1 * varyingColor0.x;
    float productValue6 = productValue2 * varyingColor0.y;
    float productValue7 = productValue3 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue4;
    if (varyingTexCoord2.y > 0.5f)
    {
        productValue8 = (((productValue5 - productValue1) * productValue4) + productValue1) * varyingColor0.w;
        productValue9 = (((productValue6 - productValue2) * productValue4) + productValue2) * varyingColor0.w;
        productValue10 = (((productValue7 - productValue3) * productValue4) + productValue3) * varyingColor0.w;
        intermediateValue4 = 1.0f;
    }
    else
    {
        productValue8 = productValue5;
        productValue9 = productValue6;
        productValue10 = productValue7;
        intermediateValue4 = productValue4 * varyingColor0.w;
    }
#if RD_FEATURE_DITHERING == RD_ON
    float intermediateValue6;
    if (varyingTexCoord2.x > 0.5f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingColor3.x - RD_UNIFORM_VIEW_POSITION_AND_TIME.x, varyingColor3.y - RD_UNIFORM_VIEW_POSITION_AND_TIME.y, varyingColor3.z - RD_UNIFORM_VIEW_POSITION_AND_TIME.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_2.y - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x), 0.0f, 1.0f);
        float quotientValue1 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float quotientValue2 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float productValue14 = floor(quotientValue2 * 0.25f);
        float productValue15 = floor(quotientValue2 * 0.5f);
        float scalarValue4 = floor(quotientValue2);
        float branchMergedValue;
        if (!(((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue15 * productValue15) * 0.75f) + (floor(quotientValue1 * 0.5f) * 0.5f)) + (frac(((productValue14 * productValue14) * 0.75f) + (floor(quotientValue1 * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue4 * scalarValue4) * 0.75f) + (floor(quotientValue1) * 0.5f)))))
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
    float4 sampledTextureValue2 = lightMapTextureTexture.Sample(lightMapTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue11 = sampledTextureValue2.x * productValue8;
    float productValue12 = sampledTextureValue2.y * productValue9;
    float productValue13 = sampledTextureValue2.z * productValue10;
    fragmentColor0.x = ((RD_UNIFORM_FOG_COLOR.x - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.y = ((RD_UNIFORM_FOG_COLOR.y - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.z = ((RD_UNIFORM_FOG_COLOR.z - productValue13) * varyingColor2.w) + productValue13;
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
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    varyingColor3 = stage_input.varyingColor3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
