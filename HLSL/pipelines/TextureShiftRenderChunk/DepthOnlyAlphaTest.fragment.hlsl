// TextureShiftRenderChunk / DepthOnlyAlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 6
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
  workingVector0.y = materialTexture1.Sample(textureSampler1, workingVector1.xy).w;
  workingVector0.z = materialTexture1.Sample(textureSampler1, workingVector1.zw).w;
  workingVector0.x = RD_COMPARISON_MASK(0.5 < workingVector0.x);
  workingVector0.x = workingVector0.x ? workingVector0.z : workingVector0.y;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 0.5);
  if (workingVector0.x != 0) discard;
  fragmentColor0.xyzw = float4(0,0,0,0);
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
    if (((quotientValue > 0.5f) ? matTextureTexture.Sample(matTextureSampler, float2(asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 2u).x) + varyingTexCoord0.x, asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 3u).x) + varyingTexCoord0.y)).w : matTextureTexture.Sample(matTextureSampler, float2(asfloat(rdLoad_textureShiftBufferData(productValue * 8u).x) + varyingTexCoord0.x, asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 1u).x) + varyingTexCoord0.y)).w) < 0.5f)
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
