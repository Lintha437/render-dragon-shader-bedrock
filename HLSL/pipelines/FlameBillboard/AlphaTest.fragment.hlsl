// FlameBillboard / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/FlameBillboard/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = RD_UNIFORM_UV_OFFSET.xy + varyingTexCoord0.xy;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = varyingColor0.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor0.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = workingVector0.w;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float4 sampledTextureValue = flameAtlasTexture.Sample(flameAtlasSampler, float2(RD_UNIFORM_UV_OFFSET.x + varyingTexCoord0.x, RD_UNIFORM_UV_OFFSET.y + varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if (scalarValue3 < 0.5f)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = ((varyingColor0.x - scalarValue) * varyingColor0.w) + scalarValue;
    fragmentColor0.y = ((varyingColor0.y - scalarValue1) * varyingColor0.w) + scalarValue1;
    fragmentColor0.z = ((varyingColor0.z - scalarValue2) * varyingColor0.w) + scalarValue2;
    fragmentColor0.w = scalarValue3;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
