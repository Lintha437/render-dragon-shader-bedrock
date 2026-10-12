// LegacyCubemapForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
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


#include "../../include/materials/LegacyCubemapForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord1 : TEXCOORD1,
  float4 varyingColor0 : COLOR0,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector1.yzw = max(float3(0,0,0), workingVector0.xyz);
  workingVector1.yzw = log2(workingVector1.yzw);
  workingVector1.yzw = float3(2.20000005,2.20000005,2.20000005) * workingVector1.yzw;
  workingVector1.yzw = exp2(workingVector1.yzw);
  workingVector2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyz;
  workingVector3.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.xyz;
  workingVector3.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector3.xyz;
  workingVector3.xyz = log2(workingVector3.xyz);
  workingVector3.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector3.xyz;
  workingVector3.xyz = exp2(workingVector3.xyz);
  workingVector4.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector2.xyz = workingVector4.xyz ? workingVector2.xyz : workingVector3.xyz;
  workingVector1.xyz = workingVector1.xxx ? workingVector1.yzw : workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * workingVector1.xyz;
  workingVector3.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www;
  workingVector3.xyz = workingVector3.xyz * workingVector1.xyz;
  workingVector3.xyz = RD_UNIFORM_SKYBOX_PARAMETERS.xxx * workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www * workingVector3.xyz;
  workingVector2.xyz = workingVector2.xyz * RD_UNIFORM_SKYBOX_AMBIENT_ILLUMINANCE.xxx + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
  workingVector3.xyz = RD_UNIFORM_SKYBOX_PARAMETERS.yyy * workingVector3.xyz;
  workingVector1.xyz = workingVector3.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx + workingVector2.xyz;
  workingVector1.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_SKYBOX_PARAMETERS.zw);
  workingVector1.z = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x);
  workingVector1.x = workingVector1.z ? workingVector1.x : 0;
  if (workingVector1.x != 0) {
    workingVector1.x = RD_UNIFORM_WORLD_ORIGIN.y + RD_UNIFORM_CLOUD_RENDER_DISTANCE_AND_CLOUD_HEIGHT.y;
    workingVector1.z = 9.99999975e-005 + varyingTexCoord3.y;
    workingVector1.x = workingVector1.x / workingVector1.z;
    workingVector2.xyz = varyingTexCoord3.xyz * workingVector1.xxx;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = sqrt(workingVector1.z);
    workingVector1.z = workingVector1.z / RD_UNIFORM_CLOUD_RENDER_DISTANCE_AND_CLOUD_HEIGHT.x;
    workingVector1.z = saturate(-0.899999976 + workingVector1.z);
    workingVector1.w = RD_COMPARISON_MASK(0 < workingVector1.z);
    if (workingVector1.w != 0) {
      workingVector2.xyz = varyingTexCoord3.xyz * workingVector1.xxx + -RD_UNIFORM_INV_VIEW_ROW_3.xyz;
      workingVector1.x = dot(workingVector2.xyz, workingVector2.xyz);
      workingVector1.x = rsqrt(workingVector1.x);
      workingVector2.xzw = workingVector2.xyz * workingVector1.xxx;
      workingVector3.xy = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
      workingVector4.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
      workingVector5.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
      workingVector1.w = workingVector3.y + -workingVector3.x;
      workingVector1.x = workingVector2.y * workingVector1.x + -workingVector3.x;
      workingVector1.w = 1 / workingVector1.w;
      workingVector1.w = saturate(workingVector1.x * workingVector1.w);
      workingVector2.y = workingVector1.w * -2 + 3;
      workingVector1.w = workingVector1.w * workingVector1.w;
      workingVector1.w = -workingVector2.y * workingVector1.w + 1;
      workingVector2.y = workingVector1.w * workingVector1.w;
      workingVector1.w = workingVector2.y * workingVector1.w;
      workingVector2.y = dot(workingVector2.xzw, RD_UNIFORM_SUN_DIR.xyz);
      workingVector2.x = dot(workingVector2.xzw, RD_UNIFORM_MOON_DIR.xyz);
      workingVector2.z = workingVector2.y * workingVector2.y + 1;
      workingVector2.z = RD_UNIFORM_SUN_COLOR.w * workingVector2.z;
      workingVector2.w = workingVector2.x * workingVector2.x + 1;
      workingVector2.w = RD_UNIFORM_MOON_COLOR.w * workingVector2.w;
      workingVector2.w = 0.75 * workingVector2.w;
      workingVector3.x = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector3.x;
      workingVector3.x = 1 / workingVector3.x;
      workingVector1.x = saturate(workingVector3.x * workingVector1.x);
      workingVector3.x = workingVector1.x * -2 + 3;
      workingVector1.x = workingVector1.x * workingVector1.x;
      workingVector1.x = -workingVector3.x * workingVector1.x + 1;
      workingVector3.x = workingVector1.x * workingVector1.x;
      workingVector1.x = workingVector3.x * workingVector1.x;
      workingVector3.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
      workingVector3.xyz = workingVector1.xxx * workingVector3.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
      workingVector3.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector3.xyz;
      workingVector3.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector3.xyz;
      workingVector1.x = workingVector2.z * 0.75 + workingVector2.w;
      workingVector2.xy = max(float2(0,0), workingVector2.xy);
      workingVector2.y = log2(workingVector2.y);
      workingVector2.y = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.y;
      workingVector2.y = exp2(workingVector2.y);
      workingVector2.x = log2(workingVector2.x);
      workingVector2.x = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.x;
      workingVector2.x = exp2(workingVector2.x);
      workingVector2.xy = min(float2(1,1), workingVector2.xy);
      workingVector2.z = -workingVector2.y * 1.79999995 + 1.80999994;
      workingVector2.w = sqrt(workingVector2.z);
      workingVector2.z = workingVector2.z * workingVector2.w;
      workingVector2.w = -workingVector2.x * 1.79999995 + 1.80999994;
      workingVector3.w = sqrt(workingVector2.w);
      workingVector2.w = workingVector3.w * workingVector2.w;
      workingVector2.zw = float2(0.0361000001,0.0361000001) / workingVector2.zw;
      workingVector4.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector4.xyz;
      workingVector4.xyz = workingVector4.xyz * workingVector2.yyy;
      workingVector5.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector5.xyz;
      workingVector5.xyz = workingVector5.xyz * workingVector2.xxx;
      workingVector2.xyw = workingVector5.xyz * workingVector2.www;
      workingVector5.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector1.www;
      workingVector5.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector5.xyz;
      workingVector2.xyz = workingVector4.xyz * workingVector2.zzz + workingVector2.xyw;
      workingVector2.xyz = workingVector5.xyz * workingVector2.xyz;
      workingVector2.xyz = workingVector3.xyz * workingVector1.xxx + workingVector2.xyz;
      workingVector2.xyz = workingVector2.xyz + -workingVector0.xyz;
      workingVector0.xyz = workingVector1.zzz * workingVector2.xyz + workingVector0.xyz;
    }
  }
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x);
  workingVector1.x = workingVector1.x ? workingVector1.y : 0;
  if (workingVector1.x != 0) {
    workingVector1.xyz = varyingTexCoord1.xyz / varyingTexCoord1.www;
    workingVector2.xy = float2(1,1) + workingVector1.xy;
    workingVector2.xy = float2(0.5,0.5) * workingVector2.xy;
    workingVector1.yw = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector1.yy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector1.xx + workingVector1.yw;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector1.zz + workingVector1.xy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector1.xy;
    workingVector1.x = -workingVector1.x / workingVector1.y;
    workingVector1.x = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector1.x;
    workingVector1.y = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector1.x = workingVector1.x / workingVector1.y;
    workingVector1.x = workingVector1.x * 53.5981483 + 1;
    workingVector1.x = log2(workingVector1.x);
    workingVector1.x = 0.173286796 * workingVector1.x;
    workingVector1.y = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector1.z = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector1.z = workingVector1.x * workingVector1.z + -0.5;
    workingVector1.w = (int)workingVector1.z;
    workingVector1.y = (int)workingVector1.y + -2;
    workingVector1.w = max(0, (int)workingVector1.w);
    workingVector1.y = min((int)workingVector1.w, (int)workingVector1.y);
    workingVector2.z = (int)workingVector1.y;
    workingVector1.z = saturate(-workingVector2.z + workingVector1.z);
    workingVector3.xyzw = materialTexture3.SampleLevel(textureSampler3, workingVector2.xyz, 0).xyzw;
    workingVector1.y = (int)workingVector1.y + 1;
    workingVector2.w = (int)workingVector1.y;
    workingVector4.xyzw = materialTexture3.SampleLevel(textureSampler3, workingVector2.xyw, 0).xyzw;
    workingVector4.xyzw = workingVector4.xyzw + -workingVector3.xyzw;
    workingVector3.xyzw = workingVector1.zzzz * workingVector4.xyzw + workingVector3.xyzw;
    workingVector0.xyz = workingVector3.www * workingVector0.xyz + workingVector3.xyz;
  } else {
    workingVector2.xy = float2(0,0);
    workingVector1.x = 0;
  }
  workingVector1.y = RD_COMPARISON_MASK(0.5 < RD_UNIFORM_SKY_SAMPLES_CONFIG.x);
  if (workingVector1.y != 0) {
    workingVector2.y = 1 + -workingVector2.y;
    workingVector1.x = -RD_UNIFORM_SKY_SAMPLES_CONFIG.z + workingVector1.x;
    workingVector1.x = 5.77078009 * workingVector1.x;
    workingVector1.x = exp2(workingVector1.x);
    workingVector1.x = -1 + workingVector1.x;
    workingVector2.z = 0.0186573602 * workingVector1.x;
    workingVector1.x = materialTexture5.SampleLevel(textureSampler5, workingVector2.xyz, 0).y;
    workingVector1.x = RD_COMPARISON_MASK(workingVector1.x < RD_UNIFORM_SKY_SAMPLES_CONFIG.w);
    workingVector1.y = 0;
  } else {
    workingVector1.x = 0;
  }
  workingVector1.x = ~(int)workingVector1.x;
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  workingVector0.xyzw = (int4)workingVector0.xyzw & (int4)workingVector1.xxxx;
  workingVector1.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector1.x != 0) {
    workingVector1.x = materialTexture1.Sample(textureSampler1, float2(0.5,0.5)).x;
    workingVector1.x = 0.180000007 / workingVector1.x;
    workingVector1.x = 9.99999975e-005 + workingVector1.x;
    workingVector0.xyz = workingVector1.xxx * workingVector0.xyz;
  }
  fragmentColor0.xyzw = workingVector0.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
        exponentialValue = exp2(log2(max(scalarValue, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(scalarValue1, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(scalarValue2, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (scalarValue <= 0.040449999272823333740234375f) ? (scalarValue * 0.077399380505084991455078125f) : exp2(log2((scalarValue + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (scalarValue1 <= 0.040449999272823333740234375f) ? (scalarValue1 * 0.077399380505084991455078125f) : exp2(log2((scalarValue1 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (scalarValue2 <= 0.040449999272823333740234375f) ? (scalarValue2 * 0.077399380505084991455078125f) : exp2(log2((scalarValue2 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
    float productValue = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * (RD_UNIFORM_SKYBOX_PARAMETERS.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w);
    float productValue1 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * RD_UNIFORM_SKYBOX_PARAMETERS.y);
    float productValue2 = (((productValue * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_SKYBOX_AMBIENT_ILLUMINANCE.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x)) + (productValue1 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x)) * exponentialValue;
    float productValue3 = (((productValue * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_SKYBOX_AMBIENT_ILLUMINANCE.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y)) + (productValue1 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y)) * exponentialValue1;
    float productValue4 = (((productValue * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_SKYBOX_AMBIENT_ILLUMINANCE.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z)) + (productValue1 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z)) * exponentialValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if ((RD_UNIFORM_SKYBOX_PARAMETERS.z != 0.0f) && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f))
    {
        float quotientValue = (RD_UNIFORM_WORLD_ORIGIN.y + RD_UNIFORM_CLOUD_RENDER_DISTANCE_AND_CLOUD_HEIGHT.y) / (varyingTexCoord3.y + 9.9999997473787516355514526367188e-05f);
        float productValue5 = quotientValue * varyingTexCoord3.x;
        float productValue6 = quotientValue * varyingTexCoord3.y;
        float productValue7 = quotientValue * varyingTexCoord3.z;
        float clampedValue = clamp(max((sqrt(((productValue5 * productValue5) + (productValue6 * productValue6)) + (productValue7 * productValue7)) / RD_UNIFORM_CLOUD_RENDER_DISTANCE_AND_CLOUD_HEIGHT.x) + (-0.89999997615814208984375f), 0.0f), 0.0f, 1.0f);
        float branchMergedValue;
        float branchMergedValue2;
        float branchMergedValue3;
        if (clampedValue > 0.0f)
        {
            float sumValue = productValue5 - RD_UNIFORM_INV_VIEW_ROW_3.x;
            float sumValue1 = productValue6 - RD_UNIFORM_INV_VIEW_ROW_3.y;
            float sumValue2 = productValue7 - RD_UNIFORM_INV_VIEW_ROW_3.z;
            float inverseLengthValue = rsqrt(dot(float3(sumValue, sumValue1, sumValue2), float3(sumValue, sumValue1, sumValue2)));
            float productValue8 = inverseLengthValue * sumValue;
            float productValue9 = inverseLengthValue * sumValue1;
            float productValue10 = inverseLengthValue * sumValue2;
            float clampedValue1 = clamp(((RD_UNIFORM_FOG_SKY_BLEND.w - RD_UNIFORM_FOG_SKY_BLEND.x) + productValue9) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
            float productValue11 = 1.0f - ((clampedValue1 * clampedValue1) * (3.0f - (clampedValue1 * 2.0f)));
            float productValue12 = (productValue11 * productValue11) * productValue11;
            float dotProductValue = dot(float3(productValue8, productValue9, productValue10), float3(RD_UNIFORM_SUN_DIR.xyz));
            float dotProductValue1 = dot(float3(productValue8, productValue9, productValue10), float3(RD_UNIFORM_MOON_DIR.xyz));
            float sumValue3 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
            float clampedValue2 = clamp((productValue9 - sumValue3) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue3), 0.0f, 1.0f);
            float productValue13 = 1.0f - ((clampedValue2 * clampedValue2) * (3.0f - (clampedValue2 * 2.0f)));
            float productValue14 = (productValue13 * productValue13) * productValue13;
            float productValue15 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue1 * dotProductValue1) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue * dotProductValue) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
            float clampedValue3 = clamp(exp2(log2(max(dotProductValue, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
            float clampedValue4 = clamp(exp2(log2(max(dotProductValue1, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
            float productValue16 = 1.809999942779541015625f - (clampedValue3 * 1.7999999523162841796875f);
            float nonlinearValue = 0.036100022494792938232421875f / (sqrt(productValue16) * productValue16);
            float productValue17 = 1.809999942779541015625f - (clampedValue4 * 1.7999999523162841796875f);
            float nonlinearValue1 = 0.036100022494792938232421875f / (sqrt(productValue17) * productValue17);
            float productValue18 = clampedValue3 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
            float productValue19 = clampedValue4 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
            branchMergedValue = ((((((productValue12 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue19 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue1) + ((productValue18 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue))) + (((productValue14 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue15)) * 0.079577468335628509521484375f) - productValue2) * clampedValue) + productValue2;
            branchMergedValue2 = ((((((productValue12 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue19 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue1) + ((productValue18 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue))) + (((productValue14 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue15)) * 0.079577468335628509521484375f) - productValue3) * clampedValue) + productValue3;
            branchMergedValue3 = ((((((productValue12 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue19 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue1) + ((productValue18 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue))) + (((productValue14 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue15)) * 0.079577468335628509521484375f) - productValue4) * clampedValue) + productValue4;
        }
        else
        {
            branchMergedValue = productValue2;
            branchMergedValue2 = productValue3;
            branchMergedValue3 = productValue4;
        }
        intermediateValue3 = branchMergedValue;
        intermediateValue4 = branchMergedValue2;
        intermediateValue5 = branchMergedValue3;
    }
    else
    {
        intermediateValue3 = productValue2;
        intermediateValue4 = productValue3;
        intermediateValue5 = productValue4;
    }
    float productValue24;
    float productValue25;
    float productValue26;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((RD_UNIFORM_SKYBOX_PARAMETERS.w != 0.0f) && (RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f))
    {
        float quotientValue1 = varyingTexCoord1.x / varyingTexCoord1.w;
        float quotientValue2 = varyingTexCoord1.y / varyingTexCoord1.w;
        float quotientValue3 = varyingTexCoord1.z / varyingTexCoord1.w;
        float productValue20 = (quotientValue1 + 1.0f) * 0.5f;
        float productValue21 = (quotientValue2 + 1.0f) * 0.5f;
        float multiplyAddValue = log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, quotientValue3, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, quotientValue2, quotientValue1 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, quotientValue3, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, quotientValue2, quotientValue1 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f;
        uint scalarValue3 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float productValue22 = (float(int(scalarValue3)) * multiplyAddValue) + (-0.5f);
        uint sumValue4 = uint(min(int(uint(max(int(uint(int(productValue22))), int(0u)))), int(scalarValue3 + 4294967294u)));
        float scalarValue4 = float(int(sumValue4));
        float sumValue5 = min(max(productValue22 - scalarValue4, 0.0f), 1.0f);
        float4 sampledTextureValue1 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue20, productValue21, scalarValue4), 0.0f);
        float scalarValue5 = sampledTextureValue1.x;
        float scalarValue6 = sampledTextureValue1.y;
        float scalarValue7 = sampledTextureValue1.z;
        float scalarValue8 = sampledTextureValue1.w;
        float4 sampledTextureValue2 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue20, productValue21, float(int(sumValue4 + 1u))), 0.0f);
        float productValue23 = ((sampledTextureValue2.w - scalarValue8) * sumValue5) + scalarValue8;
        productValue24 = (((sampledTextureValue2.x - scalarValue5) * sumValue5) + scalarValue5) + (productValue23 * intermediateValue3);
        productValue25 = (((sampledTextureValue2.y - scalarValue6) * sumValue5) + scalarValue6) + (productValue23 * intermediateValue4);
        productValue26 = (((sampledTextureValue2.z - scalarValue7) * sumValue5) + scalarValue7) + (productValue23 * intermediateValue5);
        intermediateValue12 = productValue20;
        intermediateValue13 = productValue21;
        intermediateValue14 = multiplyAddValue;
    }
    else
    {
        productValue24 = intermediateValue3;
        productValue25 = intermediateValue4;
        productValue26 = intermediateValue5;
        intermediateValue12 = 0.0f;
        intermediateValue13 = 0.0f;
        intermediateValue14 = 0.0f;
    }
    bool intermediateValue15;
    if (RD_UNIFORM_SKY_SAMPLES_CONFIG.x > 0.5f)
    {
        bool branchMergedValue1;
        if (skyAmbientSamplesTexture.SampleLevel(skyAmbientSamplesSampler, float3(intermediateValue12, 1.0f - intermediateValue13, (exp2((intermediateValue14 - RD_UNIFORM_SKY_SAMPLES_CONFIG.z) * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f), 0.0f).y < RD_UNIFORM_SKY_SAMPLES_CONFIG.w)
        {
            branchMergedValue1 = false;
        }
        else
        {
            branchMergedValue1 = true;
        }
        intermediateValue15 = branchMergedValue1;
    }
    else
    {
        intermediateValue15 = true;
    }
    float comparisonValue = intermediateValue15 ? productValue24 : 0.0f;
    float comparisonValue1 = intermediateValue15 ? productValue25 : 0.0f;
    float comparisonValue2 = intermediateValue15 ? productValue26 : 0.0f;
    float productValue27;
    float productValue28;
    float productValue29;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue3 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
        productValue27 = sampledTextureValue3 * comparisonValue;
        productValue28 = sampledTextureValue3 * comparisonValue1;
        productValue29 = sampledTextureValue3 * comparisonValue2;
    }
    else
    {
        productValue27 = comparisonValue;
        productValue28 = comparisonValue1;
        productValue29 = comparisonValue2;
    }
    fragmentColor0.x = productValue27;
    fragmentColor0.y = productValue28;
    fragmentColor0.z = productValue29;
    fragmentColor0.w = intermediateValue15 ? sampledTextureValue.w : 0.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
