// TextureShiftRenderChunk / AlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 2
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
#if RD_FEATURE_DITHERING == RD_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#elif RD_FEATURE_DITHERING == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = 65535 * varyingTexCoord5.y;
  workingVector0.x = (int)workingVector0.x;
  workingVector1.x = sampledResource3[workingVector0.x].val[0/4];
  workingVector1.y = sampledResource3[workingVector0.x].val[0/4+1];
  workingVector1.z = sampledResource3[workingVector0.x].val[0/4+2];
  workingVector1.w = sampledResource3[workingVector0.x].val[0/4+3];
  workingVector0.x = sampledResource3[workingVector0.x].val[20/4];
  workingVector0.y = sampledResource3[workingVector0.x].val[20/4+1];
  workingVector0.z = sampledResource3[workingVector0.x].val[20/4+2];
  workingVector0.z = -varyingTexCoord5.x * workingVector0.z + 1;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.y == 0.000000);
  workingVector2.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector0.z);
  workingVector2.x = workingVector2.x ? 1.000000 : 0;
  workingVector0.x = workingVector0.z + -workingVector0.x;
  workingVector0.x = saturate(workingVector0.x / workingVector0.y);
  workingVector0.x = 1 + -workingVector0.x;
  workingVector0.x = workingVector0.w ? workingVector2.x : workingVector0.x;
  workingVector1.xyzw = varyingTexCoord0.xyxy + workingVector1.xyzw;
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector0.y = RD_COMPARISON_MASK(workingVector2.w >= 0.5);
  workingVector0.z = RD_COMPARISON_MASK(workingVector1.w >= 0.5);
  workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == (int)workingVector0.y);
  workingVector0.y = workingVector0.y ? 1.000000 : 0;
  workingVector3.x = 4 * workingVector0.x;
  workingVector3.x = min(1, workingVector3.x);
  workingVector3.y = 1 + -workingVector3.x;
  workingVector0.z = workingVector0.z ? workingVector3.x : workingVector3.y;
  workingVector0.y = workingVector0.w ? workingVector0.y : workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(0 >= workingVector0.y);
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.y >= 1);
  workingVector0.w = (int)workingVector0.w | (int)workingVector0.z;
  workingVector3.xy = varyingColor1.xy / varyingColor1.ww;
  workingVector3.xy = workingVector3.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector3.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector3.xy;
#if RD_FEATURE_DITHERING == RD_ON
  workingVector3.zw = floor(workingVector3.xy);
  workingVector3.z = dot(workingVector3.zw, float2(0.0671105608,0.00583714992));
  workingVector3.z = frac(workingVector3.z);
  workingVector3.z = 52.9829178 * workingVector3.z;
  workingVector3.z = frac(workingVector3.z);
  workingVector0.y = RD_COMPARISON_MASK(workingVector3.z >= workingVector0.y);
  workingVector0.y = workingVector0.w ? workingVector0.z : workingVector0.y;
  workingVector0.z = RD_COMPARISON_MASK(0.5 < varyingTexCoord2.x);
  workingVector4.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector4.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector4.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector0.w = dot(workingVector4.xyz, workingVector4.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector4.xyz = workingVector4.xyz * workingVector0.www;
  workingVector5.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.xyz + varyingColor3.xyz;
  workingVector0.w = dot(-workingVector4.xyz, workingVector5.xyz);
  workingVector3.z = RD_UNIFORM_DITHER_PARAMS2_ROW_2.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x;
  workingVector0.w = -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x + workingVector0.w;
  workingVector3.z = 1 / workingVector3.z;
  workingVector0.w = saturate(workingVector3.z * workingVector0.w);
  workingVector3.z = workingVector0.w * -2 + 3;
  workingVector0.w = workingVector0.w * workingVector0.w;
  workingVector0.w = workingVector3.z * workingVector0.w;
  workingVector3.xy = workingVector3.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz;
#endif
  workingVector3.xy = floor(workingVector3.xy);
#if RD_FEATURE_DITHERING == RD_OFF
  workingVector3.x = dot(workingVector3.xy, float2(0.0671105608,0.00583714992));
#elif RD_FEATURE_DITHERING == RD_ON
  workingVector3.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz * workingVector3.xy;
  workingVector4.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector3.xyxy;
  workingVector4.xyzw = floor(workingVector4.xyzw);
  workingVector3.zw = workingVector4.yw * workingVector4.yw;
  workingVector3.zw = float2(0.75,0.75) * workingVector3.zw;
  workingVector3.zw = workingVector4.xz * float2(0.5,0.5) + workingVector3.zw;
  workingVector3.zw = frac(workingVector3.zw);
  workingVector3.z = workingVector3.z * 0.25 + workingVector3.w;
  workingVector3.xy = floor(workingVector3.xy);
  workingVector3.y = workingVector3.y * workingVector3.y;
  workingVector3.y = 0.75 * workingVector3.y;
  workingVector3.x = workingVector3.x * 0.5 + workingVector3.y;
#endif
  workingVector3.x = frac(workingVector3.x);
#if RD_FEATURE_DITHERING == RD_OFF
  workingVector3.x = 52.9829178 * workingVector3.x;
  workingVector3.x = frac(workingVector3.x);
  workingVector0.y = RD_COMPARISON_MASK(workingVector3.x >= workingVector0.y);
  workingVector0.y = workingVector0.w ? workingVector0.z : workingVector0.y;
  if (workingVector0.y != 0) discard;
#elif RD_FEATURE_DITHERING == RD_ON
  workingVector3.x = workingVector3.z * 0.25 + workingVector3.x;
  workingVector3.x = workingVector3.x * 64 + 0.5;
  workingVector3.x = 0.015625 * workingVector3.x;
  workingVector0.w = RD_COMPARISON_MASK(workingVector3.x >= workingVector0.w);
  workingVector0.z = workingVector0.w ? workingVector0.z : 0;
  workingVector0.z = (int)workingVector0.y | (int)workingVector0.z;
  if (workingVector0.z != 0) discard;
#endif
  fragmentColor0.w = workingVector0.y ? 0 : 1;
  workingVector0.y = 1 + -workingVector0.x;
  workingVector0.x = workingVector1.w * workingVector0.x;
  workingVector0.y = workingVector0.y * workingVector2.w + workingVector0.x;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.y);
  workingVector0.x = workingVector0.x / workingVector0.y;
  workingVector0.x = workingVector0.z ? workingVector0.x : 0;
  workingVector0.yzw = workingVector1.xyz + -workingVector2.xyz;
  workingVector0.xyz = workingVector0.xxx * workingVector0.yzw + workingVector2.xyz;
  workingVector0.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyz;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + RD_UNIFORM_FOG_COLOR.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
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
    float scalarValue4 = sampledTextureValue1.w;
    float productValue1 = scalarValue4 * quotientValue;
    float productValue2 = productValue1 + (scalarValue3 * (1.0f - quotientValue));
    float comparisonValue = (productValue2 > 0.0f) ? (productValue1 / productValue2) : 0.0f;
    bool comparisonValue1 = scalarValue3 >= 0.5f;
    bool comparisonValue2 = scalarValue4 >= 0.5f;
    float comparisonValue3;
    if (comparisonValue1 != comparisonValue2)
    {
        float productValue3 = min(max(quotientValue * 4.0f, 0.0f), 1.0f);
        comparisonValue3 = comparisonValue2 ? productValue3 : (1.0f - productValue3);
    }
    else
    {
        comparisonValue3 = float(comparisonValue1);
    }
    bool comparisonValue4 = comparisonValue3 <= 0.0f;
    bool intermediateValue5;
    if (comparisonValue4 || (comparisonValue3 >= 1.0f))
    {
        intermediateValue5 = comparisonValue4;
    }
    else
    {
        intermediateValue5 = comparisonValue3 <= frac(frac(dot(float2(floor((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x), floor((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y)), float2(0.067110560834407806396484375f, 0.005837149918079376220703125f))) * 52.98291778564453125f);
    }
#if RD_FEATURE_DITHERING == RD_OFF
    if (intermediateValue5)
#elif RD_FEATURE_DITHERING == RD_ON
    bool comparisonValue5;
    if (varyingTexCoord2.x > 0.5f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingColor3.x - RD_UNIFORM_VIEW_POSITION_AND_TIME.x, varyingColor3.y - RD_UNIFORM_VIEW_POSITION_AND_TIME.y, varyingColor3.z - RD_UNIFORM_VIEW_POSITION_AND_TIME.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_2.y - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x), 0.0f, 1.0f);
        float quotientValue1 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float quotientValue2 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float productValue7 = floor(quotientValue2 * 0.25f);
        float productValue8 = floor(quotientValue2 * 0.5f);
        float scalarValue5 = floor(quotientValue2);
        comparisonValue5 = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue8 * productValue8) * 0.75f) + (floor(quotientValue1 * 0.5f) * 0.5f)) + (frac(((productValue7 * productValue7) * 0.75f) + (floor(quotientValue1 * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue1) * 0.5f)));
    }
    else
    {
        comparisonValue5 = false;
    }
    if (intermediateValue5 || comparisonValue5)
#endif
    {
        isFragmentDiscarded = true;
    }
    float4 sampledTextureValue2 = lightMapTextureTexture.Sample(lightMapTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue4 = (((comparisonValue * (sampledTextureValue1.x - scalarValue)) + scalarValue) * varyingColor0.x) * sampledTextureValue2.x;
    float productValue5 = (((comparisonValue * (sampledTextureValue1.y - scalarValue1)) + scalarValue1) * varyingColor0.y) * sampledTextureValue2.y;
    float productValue6 = (((comparisonValue * (sampledTextureValue1.z - scalarValue2)) + scalarValue2) * varyingColor0.z) * sampledTextureValue2.z;
    fragmentColor0.x = ((RD_UNIFORM_FOG_COLOR.x - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.y = ((RD_UNIFORM_FOG_COLOR.y - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.z = ((RD_UNIFORM_FOG_COLOR.z - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.w = intermediateValue5 ? 0.0f : 1.0f;
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
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    varyingColor3 = stage_input.varyingColor3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
