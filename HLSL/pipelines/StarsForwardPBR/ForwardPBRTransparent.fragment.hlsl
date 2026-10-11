// StarsForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 0
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
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector1.x != 0) {
    workingVector1.xy = float2(1,1) + varyingColor1.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * varyingColor1.yy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * varyingColor1.xx + workingVector2.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * varyingColor1.zz + workingVector2.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector2.xy;
    workingVector1.w = -workingVector2.x / workingVector2.y;
    workingVector1.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector1.w;
    workingVector2.x = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector1.w = workingVector1.w / workingVector2.x;
    workingVector1.w = workingVector1.w * 53.5981483 + 1;
    workingVector1.w = log2(workingVector1.w);
    workingVector1.xyw = float3(0.5,0.5,0.173286796) * workingVector1.xyw;
    workingVector2.x = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector2.y = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector2.y = workingVector1.w * workingVector2.y + -0.5;
    workingVector2.z = (int)workingVector2.y;
    workingVector2.x = (int)workingVector2.x + -2;
    workingVector2.z = max(0, (int)workingVector2.z);
    workingVector2.x = min((int)workingVector2.z, (int)workingVector2.x);
    workingVector3.z = (int)workingVector2.x;
    workingVector2.y = saturate(-workingVector3.z + workingVector2.y);
    workingVector3.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.z = materialTexture2.SampleLevel(textureSampler2, workingVector3.xyz, 0).w;
    workingVector2.x = (int)workingVector2.x + 1;
    workingVector3.z = (int)workingVector2.x;
    workingVector3.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.x = materialTexture2.SampleLevel(textureSampler2, workingVector3.xyz, 0).w;
    workingVector2.x = workingVector2.x + -workingVector2.z;
    workingVector2.x = workingVector2.y * workingVector2.x + workingVector2.z;
    workingVector0.xyz = workingVector2.xxx * workingVector0.xyz;
  } else {
    workingVector1.xyw = float3(0,0,0);
  }
  workingVector2.x = RD_COMPARISON_MASK(0.5 < RD_UNIFORM_SKY_SAMPLES_CONFIG.x);
  if (workingVector2.x != 0) {
    workingVector1.y = 1 + -workingVector1.y;
    workingVector1.w = -RD_UNIFORM_SKY_SAMPLES_CONFIG.z + workingVector1.w;
    workingVector1.w = 5.77078009 * workingVector1.w;
    workingVector1.w = exp2(workingVector1.w);
    workingVector1.w = -1 + workingVector1.w;
    workingVector1.z = 0.0186573602 * workingVector1.w;
    workingVector1.x = materialTexture4.SampleLevel(textureSampler4, workingVector1.xyz, 0).y;
    workingVector1.x = RD_COMPARISON_MASK(workingVector1.x < RD_UNIFORM_SKY_SAMPLES_CONFIG.w);
    workingVector1.y = 0;
  } else {
    workingVector1.x = 0;
  }
  workingVector1.x = ~(int)workingVector1.x;
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  workingVector1.y = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector1.y != 0) {
    workingVector1.y = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).x;
    workingVector1.y = 0.180000007 / workingVector1.y;
    workingVector1.y = 9.99999975e-005 + workingVector1.y;
    workingVector0.xyz = workingVector1.yyy * workingVector0.xyz;
  }
  workingVector0.w = varyingColor0.w;
  fragmentColor0.xyzw = (int4)workingVector0.xyzw & (int4)workingVector1.xxxx;
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
    float productValue9;
    float productValue10;
    float productValue11;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue2 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
        productValue9 = sampledTextureValue2 * productValue6;
        productValue10 = sampledTextureValue2 * productValue7;
        productValue11 = sampledTextureValue2 * productValue8;
    }
    else
    {
        productValue9 = productValue6;
        productValue10 = productValue7;
        productValue11 = productValue8;
    }
    fragmentColor0.x = intermediateValue6 ? productValue9 : 0.0f;
    fragmentColor0.y = intermediateValue6 ? productValue10 : 0.0f;
    fragmentColor0.z = intermediateValue6 ? productValue11 : 0.0f;
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
