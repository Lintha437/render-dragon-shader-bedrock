// TextureShiftRenderChunk / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
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
#define RD_BINDING_LAYOUT 8
#endif


#include "../../include/materials/TextureShiftRenderChunk/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  float4 varyingColor2 : COLOR2,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  nointerpolation float4 varyingTexCoord5 : TEXCOORD5,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
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
  workingVector0.y = RD_COMPARISON_MASK(0.5 < workingVector0.x);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector0.y = workingVector0.y ? workingVector2.w : workingVector1.w;
  workingVector2.xyz = workingVector2.xyz + -workingVector1.xyz;
  workingVector0.xzw = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyz = workingVector0.xzw * varyingColor0.xyz + -workingVector0.xzw;
  workingVector1.xyz = workingVector0.yyy * workingVector1.xyz + workingVector0.xzw;
  workingVector0.xyz = varyingColor0.xyz * workingVector0.xzw;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.x = RD_COMPARISON_MASK(0.5 < varyingTexCoord2.y);
  workingVector1.w = 1;
  workingVector0.w = varyingColor0.w;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyz;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + RD_UNIFORM_FOG_COLOR.xyz;
  fragmentColor0.w = workingVector0.w;
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
    float4 sampledTextureValue1 = matTextureTexture.Sample(matTextureSampler, float2(asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 2u).x) + varyingTexCoord0.x, asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 3u).x) + varyingTexCoord0.y));
    float productValue1 = ((sampledTextureValue1.x - scalarValue) * quotientValue) + scalarValue;
    float productValue2 = ((sampledTextureValue1.y - scalarValue1) * quotientValue) + scalarValue1;
    float productValue3 = ((sampledTextureValue1.z - scalarValue2) * quotientValue) + scalarValue2;
    float comparisonValue = (quotientValue > 0.5f) ? sampledTextureValue1.w : sampledTextureValue.w;
    float productValue4 = productValue1 * varyingColor0.x;
    float productValue5 = productValue2 * varyingColor0.y;
    float productValue6 = productValue3 * varyingColor0.z;
    float productValue7;
    float productValue8;
    float productValue9;
    float intermediateValue3;
    if (varyingTexCoord2.y > 0.5f)
    {
        productValue7 = (((productValue4 - productValue1) * comparisonValue) + productValue1) * varyingColor0.w;
        productValue8 = (((productValue5 - productValue2) * comparisonValue) + productValue2) * varyingColor0.w;
        productValue9 = (((productValue6 - productValue3) * comparisonValue) + productValue3) * varyingColor0.w;
        intermediateValue3 = 1.0f;
    }
    else
    {
        productValue7 = productValue4;
        productValue8 = productValue5;
        productValue9 = productValue6;
        intermediateValue3 = varyingColor0.w;
    }
    float4 sampledTextureValue2 = lightMapTextureTexture.Sample(lightMapTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue10 = sampledTextureValue2.x * productValue7;
    float productValue11 = sampledTextureValue2.y * productValue8;
    float productValue12 = sampledTextureValue2.z * productValue9;
    fragmentColor0.x = ((RD_UNIFORM_FOG_COLOR.x - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.y = ((RD_UNIFORM_FOG_COLOR.y - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.z = ((RD_UNIFORM_FOG_COLOR.z - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.w = intermediateValue3;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
