// StarsForwardPBR / ForwardPBRTransparentSkyProbe / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/StarsForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_STARS_COLOR.xyz * varyingColor0.www;
  workingVector0.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector0.w != 0) {
    workingVector1.xy = float2(1,1) + varyingColor1.xy;
    workingVector1.xy = float2(0.5,0.5) * workingVector1.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * varyingColor1.yy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * varyingColor1.xx + workingVector2.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * varyingColor1.zz + workingVector2.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector2.xy;
    workingVector0.w = -workingVector2.x / workingVector2.y;
    workingVector0.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector0.w;
    workingVector1.w = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector0.w = workingVector0.w / workingVector1.w;
    workingVector0.w = workingVector0.w * 53.5981483 + 1;
    workingVector0.w = log2(workingVector0.w);
    workingVector0.w = 0.173286796 * workingVector0.w;
    workingVector1.w = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector2.x = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector2.x = workingVector0.w * workingVector2.x + -0.5;
    workingVector2.y = (int)workingVector2.x;
    workingVector1.w = (int)workingVector1.w + -2;
    workingVector2.y = max(0, (int)workingVector2.y);
    workingVector1.w = min((int)workingVector2.y, (int)workingVector1.w);
    workingVector3.z = (int)workingVector1.w;
    workingVector2.x = saturate(-workingVector3.z + workingVector2.x);
    workingVector3.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.y = materialTexture2.SampleLevel(textureSampler2, workingVector3.xyz, 0).w;
    workingVector1.w = (int)workingVector1.w + 1;
    workingVector3.z = (int)workingVector1.w;
    workingVector3.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.w = materialTexture2.SampleLevel(textureSampler2, workingVector3.xyz, 0).w;
    workingVector1.w = workingVector1.w + -workingVector2.y;
    workingVector1.w = workingVector2.x * workingVector1.w + workingVector2.y;
    workingVector0.xyz = workingVector1.www * workingVector0.xyz;
  } else {
    workingVector1.xy = float2(0,0);
    workingVector0.w = 0;
  }
  workingVector1.w = RD_COMPARISON_MASK(0.5 < RD_UNIFORM_SKY_SAMPLES_CONFIG.x);
  if (workingVector1.w != 0) {
    workingVector1.y = 1 + -workingVector1.y;
    workingVector0.w = -RD_UNIFORM_SKY_SAMPLES_CONFIG.z + workingVector0.w;
    workingVector0.w = 5.77078009 * workingVector0.w;
    workingVector0.w = exp2(workingVector0.w);
    workingVector0.w = -1 + workingVector0.w;
    workingVector1.z = 0.0186573602 * workingVector0.w;
    workingVector0.w = materialTexture4.SampleLevel(textureSampler4, workingVector1.xyz, 0).y;
    workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_SKY_SAMPLES_CONFIG.w);
    workingVector1.x = 0;
  } else {
    workingVector0.w = 0;
  }
  workingVector0.w = ~(int)workingVector0.w;
  workingVector0.w = (int)workingVector1.x | (int)workingVector0.w;
  workingVector1.x = 1 + varyingColor1.y;
  workingVector1.x = 0.5 * workingVector1.x;
  workingVector1.y = RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x + -RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y;
  workingVector1.y = 9.99999975e-006 + workingVector1.y;
  workingVector1.x = max(RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y, workingVector1.x);
  workingVector1.x = min(RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x, workingVector1.x);
  workingVector1.x = -RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y + workingVector1.x;
  workingVector1.x = workingVector1.x / workingVector1.y;
  workingVector0.xyz = workingVector1.xxx * workingVector0.xyz;
  workingVector1.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  workingVector1.yzw = float3(0.003314286,0.003314286,0.003314286) * workingVector0.xyz;
  workingVector1.xyz = workingVector1.xxx ? workingVector1.yzw : workingVector0.xyz;
  workingVector1.w = varyingColor0.w;
  fragmentColor0.xyzw = (int4)workingVector0.wwww & (int4)workingVector1.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float productValue = (varyingColor0.w * varyingColor0.x) * RD_UNIFORM_STARS_COLOR.x;
    float productValue1 = (varyingColor0.w * varyingColor0.y) * RD_UNIFORM_STARS_COLOR.y;
    float productValue2 = (varyingColor0.w * varyingColor0.z) * RD_UNIFORM_STARS_COLOR.z;
    float productValue6;
    float productValue7;
    float productValue8;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f)
    {
        float productValue3 = (varyingColor1.x + 1.0f) * 0.5f;
        float productValue4 = (varyingColor1.y + 1.0f) * 0.5f;
        float multiplyAddValue = log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, varyingColor1.z, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.z * varyingColor1.x)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, varyingColor1.z, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.w * varyingColor1.x)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f;
        uint scalarValue = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float productValue5 = (float(int(scalarValue)) * multiplyAddValue) + (-0.5f);
        uint sumValue = uint(min(int(uint(max(int(uint(int(productValue5))), int(0u)))), int(scalarValue + 4294967294u)));
        float scalarValue1 = float(int(sumValue));
        float4 sampledTextureValue = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue3, productValue4, scalarValue1), 0.0f);
        float scalarValue2 = sampledTextureValue.w;
        float sampledTextureValue1 = ((scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue3, productValue4, float(int(sumValue + 1u))), 0.0f).w - scalarValue2) * min(max(productValue5 - scalarValue1, 0.0f), 1.0f)) + scalarValue2;
        productValue6 = sampledTextureValue1 * productValue;
        productValue7 = sampledTextureValue1 * productValue1;
        productValue8 = sampledTextureValue1 * productValue2;
        intermediateValue3 = productValue3;
        intermediateValue4 = productValue4;
        intermediateValue5 = multiplyAddValue;
    }
    else
    {
        productValue6 = productValue;
        productValue7 = productValue1;
        productValue8 = productValue2;
        intermediateValue3 = 0.0f;
        intermediateValue4 = 0.0f;
        intermediateValue5 = 0.0f;
    }
    bool intermediateValue6;
    if (RD_UNIFORM_SKY_SAMPLES_CONFIG.x > 0.5f)
    {
        bool branchMergedValue;
        if (skyAmbientSamplesTexture.SampleLevel(skyAmbientSamplesSampler, float3(intermediateValue3, 1.0f - intermediateValue4, (exp2((intermediateValue5 - RD_UNIFORM_SKY_SAMPLES_CONFIG.z) * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f), 0.0f).y < RD_UNIFORM_SKY_SAMPLES_CONFIG.w)
        {
            branchMergedValue = false;
        }
        else
        {
            branchMergedValue = true;
        }
        intermediateValue6 = branchMergedValue;
    }
    else
    {
        intermediateValue6 = true;
    }
    float quotientValue = (min(max((varyingColor1.y + 1.0f) * 0.5f, RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y), RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x) - RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y) / ((RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x + 9.9999997473787516355514526367188e-06f) - RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y);
    float productValue9 = quotientValue * productValue6;
    float productValue10 = quotientValue * productValue7;
    float productValue11 = quotientValue * productValue8;
    float productValue12;
    float productValue13;
    float productValue14;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        productValue12 = productValue9 * 0.0033142860047519207000732421875f;
        productValue13 = productValue10 * 0.0033142860047519207000732421875f;
        productValue14 = productValue11 * 0.0033142860047519207000732421875f;
    }
    else
    {
        productValue12 = productValue9;
        productValue13 = productValue10;
        productValue14 = productValue11;
    }
    fragmentColor0.x = intermediateValue6 ? productValue12 : 0.0f;
    fragmentColor0.y = intermediateValue6 ? productValue13 : 0.0f;
    fragmentColor0.z = intermediateValue6 ? productValue14 : 0.0f;
    fragmentColor0.w = intermediateValue6 ? varyingColor0.w : 0.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
