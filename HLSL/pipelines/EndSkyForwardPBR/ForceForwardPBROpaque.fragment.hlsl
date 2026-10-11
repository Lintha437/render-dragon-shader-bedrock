// EndSkyForwardPBR / ForceForwardPBROpaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
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


#include "../../include/materials/EndSkyForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
#endif
  workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector1.xyz = max(float3(0,0,0), workingVector0.xyz);
  workingVector1.xyz = log2(workingVector1.xyz);
  workingVector1.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector1.xyz;
  workingVector1.xyz = exp2(workingVector1.xyz);
  workingVector2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyz;
  workingVector3.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.xyz;
  workingVector3.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector3.xyz;
  workingVector3.xyz = log2(workingVector3.xyz);
  workingVector3.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector3.xyz;
  workingVector3.xyz = exp2(workingVector3.xyz);
  workingVector0.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector0.xyz = workingVector0.xyz ? workingVector2.xyz : workingVector3.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
  workingVector1.xyz = varyingColor1.xyz / varyingColor1.zzz;
  workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector0.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xzw = workingVector2.xyz * workingVector0.www;
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.000000);
  if (workingVector1.w != 0) {
    workingVector3.x = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector1.x;
    workingVector3.y = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector1.y;
    workingVector1.w = workingVector1.z * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
    workingVector3.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
    workingVector3.xyz = workingVector3.xyz / workingVector1.www;
    workingVector1.w = dot(workingVector3.xyz, workingVector3.xyz);
    workingVector1.w = sqrt(workingVector1.w);
    workingVector1.w = workingVector1.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector1.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector1.w;
    workingVector1.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector1.w;
    workingVector1.w = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector1.w);
    workingVector3.x = RD_COMPARISON_MASK(0 < workingVector1.w);
    if (workingVector3.x != 0) {
      workingVector3.x = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.000000);
      if (workingVector3.x != 0) {
        workingVector3.x = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.000000);
        workingVector3.y = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
        workingVector3.x = workingVector3.y ? workingVector3.x : 0;
        workingVector3.yzw = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
        workingVector4.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
        workingVector3.yzw = max(workingVector4.xyz, workingVector3.yzw);
        workingVector3.yzw = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector3.yzw;
        workingVector3.xyz = workingVector3.xxx ? workingVector3.yzw : 0;
        workingVector3.xyz = max(float3(1,1,1), workingVector3.xyz);
        workingVector3.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector3.xyz;
      } else {
        workingVector4.xy = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
        workingVector5.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector6.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
        workingVector3.w = workingVector4.y + -workingVector4.x;
        workingVector4.y = workingVector2.y * workingVector0.w + -workingVector4.x;
        workingVector3.w = 1 / workingVector3.w;
        workingVector3.w = saturate(workingVector4.y * workingVector3.w);
        workingVector4.z = workingVector3.w * -2 + 3;
        workingVector3.w = workingVector3.w * workingVector3.w;
        workingVector3.w = -workingVector4.z * workingVector3.w + 1;
        workingVector4.z = workingVector3.w * workingVector3.w;
        workingVector3.w = workingVector4.z * workingVector3.w;
        workingVector4.z = dot(workingVector2.xzw, RD_UNIFORM_SUN_DIR.xyz);
        workingVector2.x = dot(workingVector2.xzw, RD_UNIFORM_MOON_DIR.xyz);
        workingVector2.z = workingVector4.z * workingVector4.z + 1;
        workingVector2.z = RD_UNIFORM_SUN_COLOR.w * workingVector2.z;
        workingVector2.w = workingVector2.x * workingVector2.x + 1;
        workingVector2.w = RD_UNIFORM_MOON_COLOR.w * workingVector2.w;
        workingVector2.w = 0.75 * workingVector2.w;
        workingVector4.x = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector4.x;
        workingVector4.x = 1 / workingVector4.x;
        workingVector4.x = saturate(workingVector4.y * workingVector4.x);
        workingVector4.y = workingVector4.x * -2 + 3;
        workingVector4.x = workingVector4.x * workingVector4.x;
        workingVector4.x = -workingVector4.y * workingVector4.x + 1;
        workingVector4.y = workingVector4.x * workingVector4.x;
        workingVector4.x = workingVector4.y * workingVector4.x;
        workingVector7.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector4.xyw = workingVector4.xxx * workingVector7.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector4.xyw = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector4.xyw;
        workingVector4.xyw = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector4.xyw;
        workingVector2.z = workingVector2.z * 0.75 + workingVector2.w;
        workingVector2.w = max(0, workingVector4.z);
        workingVector2.w = log2(workingVector2.w);
        workingVector2.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.w;
        workingVector2.w = exp2(workingVector2.w);
        workingVector2.x = max(0, workingVector2.x);
        workingVector2.x = log2(workingVector2.x);
        workingVector2.x = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.x;
        workingVector2.x = exp2(workingVector2.x);
        workingVector2.xw = min(float2(1,1), workingVector2.xw);
        workingVector4.z = -workingVector2.w * 1.79999995 + 1.80999994;
        workingVector5.w = sqrt(workingVector4.z);
        workingVector4.z = workingVector5.w * workingVector4.z;
        workingVector4.z = 0.0361000001 / workingVector4.z;
        workingVector5.w = -workingVector2.x * 1.79999995 + 1.80999994;
        workingVector6.w = sqrt(workingVector5.w);
        workingVector5.w = workingVector6.w * workingVector5.w;
        workingVector5.w = 0.0361000001 / workingVector5.w;
        workingVector5.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector5.xyz;
        workingVector5.xyz = workingVector5.xyz * workingVector2.www;
        workingVector6.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector6.xyz;
        workingVector6.xyz = workingVector6.xyz * workingVector2.xxx;
        workingVector6.xyz = workingVector6.xyz * workingVector5.www;
        workingVector7.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector3.www;
        workingVector7.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector7.xyz;
        workingVector5.xyz = workingVector5.xyz * workingVector4.zzz + workingVector6.xyz;
        workingVector5.xyz = workingVector7.xyz * workingVector5.xyz;
        workingVector2.xzw = workingVector4.xyw * workingVector2.zzz + workingVector5.xyz;
        workingVector3.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector4.x = max(1, RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y);
        workingVector4.yzw = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector2.xzw;
        workingVector4.xyz = workingVector4.xxx * workingVector4.yzw + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector3.xyz = workingVector3.www ? workingVector4.xyz : workingVector2.xzw;
      }
    } else {
      workingVector3.xyz = float3(0,0,0);
    }
  } else {
    workingVector3.xyz = float3(0,0,0);
    workingVector1.w = 0;
  }
  workingVector2.x = RD_UNIFORM_FOG_SKY_BLEND.x + -RD_UNIFORM_FOG_SKY_BLEND.w;
  workingVector2.z = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector2.x;
  workingVector0.w = workingVector2.y * workingVector0.w + -workingVector2.x;
  workingVector2.x = 1 / workingVector2.z;
  workingVector0.w = saturate(workingVector2.x * workingVector0.w);
  workingVector2.x = workingVector0.w * -2 + 3;
  workingVector0.w = workingVector0.w * workingVector0.w;
  workingVector0.w = -workingVector2.x * workingVector0.w + 1;
  workingVector2.x = workingVector0.w * workingVector0.w;
  workingVector0.w = workingVector2.x * workingVector0.w;
  workingVector2.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
  workingVector2.xyz = workingVector0.www * workingVector2.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
  workingVector2.xyz = RD_UNIFORM_MINIMUM_SKY_LUMINANCE.xxx * workingVector2.xyz;
  workingVector2.xyz = max(workingVector2.xyz, workingVector3.xyz);
  workingVector0.xyz = workingVector2.xyz * workingVector0.xyz + float3(-1,-1,-1);
  workingVector0.xyz = workingVector1.www * workingVector0.xyz + float3(1,1,1);
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector0.w != 0) {
    workingVector2.xy = float2(1,1) + workingVector1.xy;
    workingVector2.xy = float2(0.5,0.5) * workingVector2.xy;
    workingVector1.yw = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector1.yy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector1.xx + workingVector1.yw;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector1.zz + workingVector1.xy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector1.xy;
    workingVector0.w = -workingVector1.x / workingVector1.y;
    workingVector0.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector0.w;
    workingVector1.x = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector0.w = workingVector0.w / workingVector1.x;
    workingVector0.w = workingVector0.w * 53.5981483 + 1;
    workingVector0.w = log2(workingVector0.w);
    workingVector0.w = 0.173286796 * workingVector0.w;
    workingVector1.x = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector1.y = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector0.w = workingVector0.w * workingVector1.y + -0.5;
    workingVector1.y = (int)workingVector0.w;
    workingVector1.x = (int)workingVector1.x + -2;
    workingVector1.y = max(0, (int)workingVector1.y);
    workingVector1.x = min((int)workingVector1.y, (int)workingVector1.x);
    workingVector2.z = (int)workingVector1.x;
    workingVector0.w = saturate(-workingVector2.z + workingVector0.w);
    workingVector3.xyzw = materialTexture3.SampleLevel(textureSampler3, workingVector2.xyz, 0).xyzw;
    workingVector1.x = (int)workingVector1.x + 1;
    workingVector2.w = (int)workingVector1.x;
    workingVector1.xyzw = materialTexture3.SampleLevel(textureSampler3, workingVector2.xyw, 0).xyzw;
    workingVector1.xyzw = workingVector1.xyzw + -workingVector3.xyzw;
    workingVector1.xyzw = workingVector0.wwww * workingVector1.xyzw + workingVector3.xyzw;
  } else {
    workingVector1.xyzw = float4(0,0,0,1);
  }
  workingVector0.xyz = workingVector1.www * workingVector0.xyz + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.w != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector1.xyzw = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).xyzw;
    workingVector0.w = 0.180000007 / workingVector1.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector0.w = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).x;
    workingVector0.w = 0.180000007 / workingVector0.w;
#endif
    workingVector0.w = 9.99999975e-005 + workingVector0.w;
    workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  }
  fragmentColor0.xyz = workingVector0.xyz;
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = skyTextureTexture.Sample(skyTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
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
    float quotientValue = varyingColor1.x / varyingColor1.z;
    float quotientValue1 = varyingColor1.y / varyingColor1.z;
    float sumValue = RD_UNIFORM_INV_PROJ_ROW_3.w + RD_UNIFORM_INV_PROJ_ROW_2.w;
    float quotientValue2 = (quotientValue * RD_UNIFORM_INV_PROJ_ROW_0.x) / sumValue;
    float quotientValue3 = (quotientValue1 * RD_UNIFORM_INV_PROJ_ROW_1.y) / sumValue;
    float quotientValue4 = RD_UNIFORM_INV_PROJ_ROW_3.z / sumValue;
    float sumValue1 = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
    float sumValue2 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
    float sumValue3 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
    float inverseLengthValue = rsqrt(dot(float3(sumValue1, sumValue2, sumValue3), float3(sumValue1, sumValue2, sumValue3)));
    float productValue = inverseLengthValue * sumValue1;
    float productValue1 = inverseLengthValue * sumValue2;
    float productValue2 = inverseLengthValue * sumValue3;
    bool comparisonValue = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.0f;
    float productValue3;
    float productValue4;
    float productValue5;
    if ((comparisonValue && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.0f)) && (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f))
    {
        productValue3 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue4 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue5 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
    }
    else
    {
        productValue3 = 0.0f;
        productValue4 = 0.0f;
        productValue5 = 0.0f;
    }
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f)
    {
        float clampedValue = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (sqrt(((quotientValue3 * quotientValue3) + (quotientValue2 * quotientValue2)) + (quotientValue4 * quotientValue4)) / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (clampedValue > 0.0f)
        {
            float branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            if (comparisonValue)
            {
                branchMergedValue4 = clampedValue;
                branchMergedValue5 = RD_UNIFORM_FOG_COLOR.x * max(productValue3, 1.0f);
                branchMergedValue6 = max(productValue4, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue7 = max(productValue5, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
            }
            else
            {
                float clampedValue1 = clamp(((productValue1 - RD_UNIFORM_FOG_SKY_BLEND.x) + RD_UNIFORM_FOG_SKY_BLEND.w) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
                float productValue6 = 1.0f - ((clampedValue1 * clampedValue1) * (3.0f - (clampedValue1 * 2.0f)));
                float productValue7 = (productValue6 * productValue6) * productValue6;
                float dotProductValue = dot(float3(productValue, productValue1, productValue2), float3(RD_UNIFORM_SUN_DIR.xyz));
                float dotProductValue1 = dot(float3(productValue, productValue1, productValue2), float3(RD_UNIFORM_MOON_DIR.xyz));
                float sumValue4 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
                float clampedValue2 = clamp((productValue1 - sumValue4) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue4), 0.0f, 1.0f);
                float productValue8 = 1.0f - ((clampedValue2 * clampedValue2) * (3.0f - (clampedValue2 * 2.0f)));
                float productValue9 = (productValue8 * productValue8) * productValue8;
                float productValue10 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue1 * dotProductValue1) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue * dotProductValue) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
                float clampedValue3 = clamp(exp2(log2(max(dotProductValue, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float clampedValue4 = clamp(exp2(log2(max(dotProductValue1, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float productValue11 = 1.809999942779541015625f - (clampedValue3 * 1.7999999523162841796875f);
                float nonlinearValue = 0.036100022494792938232421875f / (sqrt(productValue11) * productValue11);
                float productValue12 = 1.809999942779541015625f - (clampedValue4 * 1.7999999523162841796875f);
                float nonlinearValue1 = 0.036100022494792938232421875f / (sqrt(productValue12) * productValue12);
                float productValue17 = clampedValue3 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
                float productValue18 = clampedValue4 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
                float productValue19 = (((productValue7 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue18 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue1) + ((productValue17 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue))) + (((productValue9 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue10)) * 0.079577468335628509521484375f;
                float productValue20 = (((productValue7 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue18 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue1) + ((productValue17 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue))) + (((productValue9 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue10)) * 0.079577468335628509521484375f;
                float productValue21 = (((productValue7 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue18 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue1) + ((productValue17 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue))) + (((productValue9 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue10)) * 0.079577468335628509521484375f;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w != 0.0f)
                {
                    float scalarValue3 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, 1.0f);
                    branchMergedValue8 = clampedValue;
                    branchMergedValue9 = ((productValue19 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue3) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue10 = ((productValue20 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue3) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue11 = ((productValue21 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue3) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                }
                else
                {
                    branchMergedValue8 = clampedValue;
                    branchMergedValue9 = productValue19;
                    branchMergedValue10 = productValue20;
                    branchMergedValue11 = productValue21;
                }
                branchMergedValue4 = branchMergedValue8;
                branchMergedValue5 = branchMergedValue9;
                branchMergedValue6 = branchMergedValue10;
                branchMergedValue7 = branchMergedValue11;
            }
            branchMergedValue = branchMergedValue4;
            branchMergedValue1 = branchMergedValue5;
            branchMergedValue2 = branchMergedValue6;
            branchMergedValue3 = branchMergedValue7;
        }
        else
        {
            branchMergedValue = clampedValue;
            branchMergedValue1 = 0.0f;
            branchMergedValue2 = 0.0f;
            branchMergedValue3 = 0.0f;
        }
        intermediateValue3 = branchMergedValue;
        intermediateValue4 = branchMergedValue1;
        intermediateValue5 = branchMergedValue2;
        intermediateValue6 = branchMergedValue3;
    }
    else
    {
        intermediateValue3 = 0.0f;
        intermediateValue4 = 0.0f;
        intermediateValue5 = 0.0f;
        intermediateValue6 = 0.0f;
    }
    float sumValue5 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
    float clampedValue5 = clamp((productValue1 - sumValue5) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue5), 0.0f, 1.0f);
    float productValue22 = 1.0f - ((clampedValue5 * clampedValue5) * (3.0f - (clampedValue5 * 2.0f)));
    float productValue23 = (productValue22 * productValue22) * productValue22;
    float productValue13;
    float productValue14;
    float productValue15;
    float productValue16;
    if (RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f)
    {
        float productValue24 = (quotientValue + 1.0f) * 0.5f;
        float productValue25 = (quotientValue1 + 1.0f) * 0.5f;
        uint scalarValue4 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + (RD_UNIFORM_INV_PROJ_ROW_2.z + mad(RD_UNIFORM_INV_PROJ_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_1.w, quotientValue1, quotientValue * RD_UNIFORM_INV_PROJ_ROW_0.w) + sumValue)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue4))) + (-0.5f);
        uint sumValue6 = uint(min(int(uint(max(int(uint(int(multiplyAddValue))), int(0u)))), int(scalarValue4 + 4294967294u)));
        float scalarValue5 = float(int(sumValue6));
        float sumValue7 = min(max(multiplyAddValue - scalarValue5, 0.0f), 1.0f);
        float4 sampledTextureValue1 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue24, productValue25, scalarValue5), 0.0f);
        float scalarValue6 = sampledTextureValue1.x;
        float scalarValue7 = sampledTextureValue1.y;
        float scalarValue8 = sampledTextureValue1.z;
        float scalarValue9 = sampledTextureValue1.w;
        float4 sampledTextureValue2 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue24, productValue25, float(int(sumValue6 + 1u))), 0.0f);
        productValue13 = ((sampledTextureValue2.x - scalarValue6) * sumValue7) + scalarValue6;
        productValue14 = ((sampledTextureValue2.y - scalarValue7) * sumValue7) + scalarValue7;
        productValue15 = ((sampledTextureValue2.z - scalarValue8) * sumValue7) + scalarValue8;
        productValue16 = ((sampledTextureValue2.w - scalarValue9) * sumValue7) + scalarValue9;
    }
    else
    {
        productValue13 = 0.0f;
        productValue14 = 0.0f;
        productValue15 = 0.0f;
        productValue16 = 1.0f;
    }
    float productValue26 = (productValue16 * ((((max(((productValue23 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * RD_UNIFORM_MINIMUM_SKY_LUMINANCE.x, intermediateValue4) * exponentialValue) + (-1.0f)) * intermediateValue3) + 1.0f)) + productValue13;
    float productValue27 = (productValue16 * ((((max(((productValue23 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * RD_UNIFORM_MINIMUM_SKY_LUMINANCE.x, intermediateValue5) * exponentialValue1) + (-1.0f)) * intermediateValue3) + 1.0f)) + productValue14;
    float productValue28 = (productValue16 * ((((max(((productValue23 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * RD_UNIFORM_MINIMUM_SKY_LUMINANCE.x, intermediateValue6) * exponentialValue2) + (-1.0f)) * intermediateValue3) + 1.0f)) + productValue15;
    float productValue29;
    float productValue30;
    float productValue31;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue3 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
        productValue29 = sampledTextureValue3 * productValue26;
        productValue30 = sampledTextureValue3 * productValue27;
        productValue31 = sampledTextureValue3 * productValue28;
    }
    else
    {
        productValue29 = productValue26;
        productValue30 = productValue27;
        productValue31 = productValue28;
    }
    fragmentColor0.x = productValue29;
    fragmentColor0.y = productValue30;
    fragmentColor0.z = productValue31;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
