// SkyProbeDeferredShading / DoDeferredShading / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_10 1
#endif

#include "../../include/materials/SkyProbeDeferredShading/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = materialTexture6.Sample(textureSampler6, varyingTexCoord0.xy).x;
  workingVector0.yzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  materialTexture2.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
  workingVector1.xy = floatingPointResult.xy;
  workingVector1.xy = varyingTexCoord0.xy * workingVector1.xy;
  workingVector1.xy = (int2)workingVector1.xy;
  workingVector1.zw = float2(0,0);
  workingVector1.x = materialTexture2.Load(workingVector1.xyz).x;
  workingVector1.x = (int)workingVector1.x & 255;
  workingVector1.x = (uint)workingVector1.x;
  workingVector1.x = 0.00392156886 * workingVector1.x;
  workingVector1.y = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector2.xyz = max(float3(0,0,0), workingVector0.yzw);
  workingVector2.xyz = log2(workingVector2.xyz);
  workingVector2.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector2.xyz;
  workingVector2.xyz = exp2(workingVector2.xyz);
  workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.yzw;
  workingVector4.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.yzw;
  workingVector4.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector4.xyz;
  workingVector4.xyz = log2(workingVector4.xyz);
  workingVector4.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector4.xyz;
  workingVector4.xyz = exp2(workingVector4.xyz);
  workingVector0.yzw = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.yzw);
  workingVector0.yzw = workingVector0.yzw ? workingVector3.xyz : workingVector4.xyz;
  workingVector0.yzw = workingVector1.yyy ? workingVector2.xyz : workingVector0.yzw;
  workingVector1.y = dot(workingVector0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  workingVector1.yzw = workingVector1.yyy + -workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector1.yzw + workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.zzz * workingVector0.yzw;
  workingVector0.yzw = workingVector0.yzw * workingVector1.xxx;
  workingVector1.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.xxx * workingVector0.yzw;
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.000000);
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector1.w != 0) {
    workingVector3.x = RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x;
    workingVector3.y = RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y;
    workingVector1.w = workingVector0.x * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
    workingVector3.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
    workingVector2.yzw = workingVector3.xyz / workingVector1.www;
    workingVector1.w = dot(workingVector2.yzw, workingVector2.yzw);
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
        workingVector4.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector2.zzz;
        workingVector4.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector2.yyy + workingVector4.xyz;
        workingVector2.yzw = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector2.www + workingVector4.xyz;
        workingVector3.w = dot(workingVector2.yzw, workingVector2.yzw);
        workingVector3.w = rsqrt(workingVector3.w);
        workingVector4.xyz = workingVector3.www * workingVector2.yzw;
        workingVector2.y = RD_COMPARISON_MASK(workingVector4.y < 0.100000001);
        workingVector2.z = RD_COMPARISON_MASK(0 < RD_UNIFORM_CLAMP_VIEW_VECTORS.x);
        workingVector2.y = workingVector2.z ? workingVector2.y : 0;
        workingVector4.w = 0.100000001;
        workingVector2.z = dot(workingVector4.xzw, workingVector4.xzw);
        workingVector2.z = rsqrt(workingVector2.z);
        workingVector5.xyz = workingVector4.xwz * workingVector2.zzz;
        workingVector2.yzw = workingVector2.yyy ? workingVector5.xyz : workingVector4.xyz;
        workingVector4.xy = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
        workingVector5.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector6.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
        workingVector3.w = workingVector4.y + -workingVector4.x;
        workingVector4.y = -workingVector4.x + workingVector2.z;
        workingVector3.w = 1 / workingVector3.w;
        workingVector3.w = saturate(workingVector4.y * workingVector3.w);
        workingVector4.z = workingVector3.w * -2 + 3;
        workingVector3.w = workingVector3.w * workingVector3.w;
        workingVector3.w = -workingVector4.z * workingVector3.w + 1;
        workingVector4.z = workingVector3.w * workingVector3.w;
        workingVector3.w = workingVector4.z * workingVector3.w;
        workingVector4.z = dot(workingVector2.yzw, RD_UNIFORM_SUN_DIR.xyz);
        workingVector2.y = dot(workingVector2.yzw, RD_UNIFORM_MOON_DIR.xyz);
        workingVector2.z = workingVector4.z * workingVector4.z + 1;
        workingVector2.z = RD_UNIFORM_SUN_COLOR.w * workingVector2.z;
        workingVector2.w = workingVector2.y * workingVector2.y + 1;
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
        workingVector2.y = max(0, workingVector2.y);
        workingVector2.y = log2(workingVector2.y);
        workingVector2.y = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.y;
        workingVector2.y = exp2(workingVector2.y);
        workingVector2.yw = min(float2(1,1), workingVector2.yw);
        workingVector4.z = -workingVector2.w * 1.79999995 + 1.80999994;
        workingVector5.w = sqrt(workingVector4.z);
        workingVector4.z = workingVector5.w * workingVector4.z;
        workingVector4.z = 0.0361000001 / workingVector4.z;
        workingVector5.w = -workingVector2.y * 1.79999995 + 1.80999994;
        workingVector6.w = sqrt(workingVector5.w);
        workingVector5.w = workingVector6.w * workingVector5.w;
        workingVector5.w = 0.0361000001 / workingVector5.w;
        workingVector5.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector5.xyz;
        workingVector5.xyz = workingVector5.xyz * workingVector2.www;
        workingVector6.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector6.xyz;
        workingVector6.xyz = workingVector6.xyz * workingVector2.yyy;
        workingVector6.xyz = workingVector6.xyz * workingVector5.www;
        workingVector7.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector3.www;
        workingVector7.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector7.xyz;
        workingVector5.xyz = workingVector5.xyz * workingVector4.zzz + workingVector6.xyz;
        workingVector5.xyz = workingVector7.xyz * workingVector5.xyz;
        workingVector2.yzw = workingVector4.xyw * workingVector2.zzz + workingVector5.xyz;
        workingVector3.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector4.x = max(1, RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y);
        workingVector4.yzw = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector2.yzw;
        workingVector4.xyz = workingVector4.xxx * workingVector4.yzw + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector3.xyz = workingVector3.www ? workingVector4.xyz : workingVector2.yzw;
      }
    } else {
      workingVector3.xyz = float3(0,0,0);
    }
  } else {
    workingVector3.xyz = float3(0,0,0);
    workingVector1.w = 0;
  }
  workingVector0.yzw = -workingVector0.yzw * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.xxx + workingVector3.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  if (workingVector2.x != 0) {
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * varyingColor1.yy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * varyingColor1.xx + workingVector1.xy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector0.xx + workingVector1.xy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector1.xy;
    workingVector0.x = -workingVector1.x / workingVector1.y;
    workingVector0.x = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector0.x;
    workingVector1.x = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector0.x = workingVector0.x / workingVector1.x;
    workingVector0.x = workingVector0.x * 53.5981483 + 1;
    workingVector0.x = log2(workingVector0.x);
    workingVector0.x = 0.173286796 * workingVector0.x;
    workingVector1.x = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector1.y = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector0.x = workingVector0.x * workingVector1.y + -0.5;
    workingVector1.y = (int)workingVector0.x;
    workingVector1.x = (int)workingVector1.x + -2;
    workingVector1.y = max(0, (int)workingVector1.y);
    workingVector1.x = min((int)workingVector1.y, (int)workingVector1.x);
    workingVector2.z = (int)workingVector1.x;
    workingVector0.x = saturate(-workingVector2.z + workingVector0.x);
    workingVector2.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xyzw = materialTexture8.SampleLevel(textureSampler8, workingVector2.xyz, 0).xyzw;
    workingVector1.x = (int)workingVector1.x + 1;
    workingVector1.z = (int)workingVector1.x;
    workingVector1.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xyzw = materialTexture8.SampleLevel(textureSampler8, workingVector1.xyz, 0).xyzw;
    workingVector1.xyzw = workingVector1.xyzw + -workingVector2.xyzw;
    workingVector1.xyzw = workingVector0.xxxx * workingVector1.xyzw + workingVector2.xyzw;
  } else {
    workingVector1.xyzw = float4(0,0,0,1);
  }
  workingVector0.xyz = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_CURRENT_FACE.x == 3.000000);
  workingVector1.xyz = RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.zzz * workingVector0.xyz;
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_CURRENT_FACE.x != 2.000000);
  workingVector2.x = 1 + varyingColor1.y;
  workingVector2.x = 0.5 * workingVector2.x;
  workingVector2.y = RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x + -RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y;
  workingVector2.y = 9.99999975e-006 + workingVector2.y;
  workingVector2.x = max(RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y, workingVector2.x);
  workingVector2.x = min(RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x, workingVector2.x);
  workingVector2.x = -RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y + workingVector2.x;
  workingVector2.x = workingVector2.x / workingVector2.y;
  workingVector2.x = max(RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.z, workingVector2.x);
  workingVector2.xyz = workingVector2.xxx * workingVector0.xyz;
  workingVector0.xyz = workingVector1.www ? workingVector2.xyz : workingVector0.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  workingVector1.xyz = float3(0.003314286,0.003314286,0.003314286) * workingVector0.xyz;
  fragmentColor0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"
void executeFragmentStage()
{
    float4 sampledTextureValue = sceneDepthTexture.Sample(sceneDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float productValue = (scalarValue * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue = (RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x) / productValue;
    float quotientValue1 = (RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y) / productValue;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue;
    float multiplyAddValue = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue1 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue2 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.z));
    float4 sampledTextureValue1 = colorMetalnessSubsurfaceTexture.Sample(colorMetalnessSubsurfaceSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    uint unusedTextureMipCount124;
    uint2 vectorValue = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount124);
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
        exponentialValue = exp2(log2(max(scalarValue1, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(scalarValue2, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(scalarValue3, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (scalarValue1 <= 0.040449999272823333740234375f) ? (scalarValue1 * 0.077399380505084991455078125f) : exp2(log2((scalarValue1 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (scalarValue2 <= 0.040449999272823333740234375f) ? (scalarValue2 * 0.077399380505084991455078125f) : exp2(log2((scalarValue2 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (scalarValue3 <= 0.040449999272823333740234375f) ? (scalarValue3 * 0.077399380505084991455078125f) : exp2(log2((scalarValue3 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
    float dotProductValue = dot(float3(exponentialValue, exponentialValue1, exponentialValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
    float loadedBufferValue = ((float(emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y))), 0u)).x & 255u) * 0.0039215688593685626983642578125f) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.z) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.x;
    float productValue1 = (((dotProductValue - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * loadedBufferValue;
    float productValue2 = (((dotProductValue - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * loadedBufferValue;
    float productValue3 = (((dotProductValue - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * loadedBufferValue;
    float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
    float productValue4 = inverseLengthValue * multiplyAddValue;
    float productValue5 = inverseLengthValue * multiplyAddValue1;
    float productValue6 = inverseLengthValue * multiplyAddValue2;
    float productValue7;
    float productValue8;
    float productValue9;
    if ((productValue5 < 0.100000001490116119384765625f) && (RD_UNIFORM_CLAMP_VIEW_VECTORS.x > 0.0f))
    {
        float inverseLengthValue1 = rsqrt(dot(float3(productValue4, 0.100000001490116119384765625f, productValue6), float3(productValue4, 0.100000001490116119384765625f, productValue6)));
        productValue7 = inverseLengthValue1 * productValue4;
        productValue8 = inverseLengthValue1 * 0.100000001490116119384765625f;
        productValue9 = inverseLengthValue1 * productValue6;
    }
    else
    {
        productValue7 = productValue4;
        productValue8 = productValue5;
        productValue9 = productValue6;
    }
    bool comparisonValue = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.0f;
    float productValue10;
    float productValue11;
    float productValue12;
    if ((RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f) && (comparisonValue && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.0f)))
    {
        productValue10 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue11 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue12 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
    }
    else
    {
        productValue10 = 0.0f;
        productValue11 = 0.0f;
        productValue12 = 0.0f;
    }
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f)
    {
        float clampedValue = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2)) / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
        float branchMergedValue;
        float branchMergedValue2;
        float branchMergedValue3;
        float branchMergedValue4;
        if (clampedValue > 0.0f)
        {
            float branchMergedValue7;
            float branchMergedValue8;
            float branchMergedValue9;
            float branchMergedValue10;
            if (comparisonValue)
            {
                branchMergedValue7 = clampedValue;
                branchMergedValue8 = RD_UNIFORM_FOG_COLOR.x * max(productValue10, 1.0f);
                branchMergedValue9 = max(productValue11, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue10 = max(productValue12, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
            }
            else
            {
                float clampedValue1 = clamp(((productValue8 - RD_UNIFORM_FOG_SKY_BLEND.x) + RD_UNIFORM_FOG_SKY_BLEND.w) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
                float productValue13 = 1.0f - ((clampedValue1 * clampedValue1) * (3.0f - (clampedValue1 * 2.0f)));
                float productValue14 = (productValue13 * productValue13) * productValue13;
                float dotProductValue1 = dot(float3(productValue7, productValue8, productValue9), float3(RD_UNIFORM_SUN_DIR.xyz));
                float dotProductValue2 = dot(float3(productValue7, productValue8, productValue9), float3(RD_UNIFORM_MOON_DIR.xyz));
                float sumValue = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
                float clampedValue2 = clamp((productValue8 - sumValue) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue), 0.0f, 1.0f);
                float productValue15 = 1.0f - ((clampedValue2 * clampedValue2) * (3.0f - (clampedValue2 * 2.0f)));
                float productValue16 = (productValue15 * productValue15) * productValue15;
                float productValue17 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue2 * dotProductValue2) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue1 * dotProductValue1) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
                float clampedValue3 = clamp(exp2(log2(max(dotProductValue1, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float clampedValue4 = clamp(exp2(log2(max(dotProductValue2, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float productValue22 = 1.809999942779541015625f - (clampedValue3 * 1.7999999523162841796875f);
                float nonlinearValue = 0.036100022494792938232421875f / (sqrt(productValue22) * productValue22);
                float productValue23 = 1.809999942779541015625f - (clampedValue4 * 1.7999999523162841796875f);
                float nonlinearValue1 = 0.036100022494792938232421875f / (sqrt(productValue23) * productValue23);
                float productValue24 = clampedValue3 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
                float productValue25 = clampedValue4 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
                float productValue26 = (((productValue14 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue25 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue1) + ((productValue24 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue))) + (((productValue16 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue17)) * 0.079577468335628509521484375f;
                float productValue27 = (((productValue14 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue25 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue1) + ((productValue24 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue))) + (((productValue16 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue17)) * 0.079577468335628509521484375f;
                float productValue28 = (((productValue14 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue25 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue1) + ((productValue24 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue))) + (((productValue16 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue17)) * 0.079577468335628509521484375f;
                float branchMergedValue11;
                float branchMergedValue12;
                float branchMergedValue13;
                float branchMergedValue14;
                if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w != 0.0f)
                {
                    float scalarValue4 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, 1.0f);
                    branchMergedValue11 = clampedValue;
                    branchMergedValue12 = ((productValue26 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue4) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue13 = ((productValue27 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue4) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue14 = ((productValue28 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue4) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                }
                else
                {
                    branchMergedValue11 = clampedValue;
                    branchMergedValue12 = productValue26;
                    branchMergedValue13 = productValue27;
                    branchMergedValue14 = productValue28;
                }
                branchMergedValue7 = branchMergedValue11;
                branchMergedValue8 = branchMergedValue12;
                branchMergedValue9 = branchMergedValue13;
                branchMergedValue10 = branchMergedValue14;
            }
            branchMergedValue = branchMergedValue7;
            branchMergedValue2 = branchMergedValue8;
            branchMergedValue3 = branchMergedValue9;
            branchMergedValue4 = branchMergedValue10;
        }
        else
        {
            branchMergedValue = clampedValue;
            branchMergedValue2 = 0.0f;
            branchMergedValue3 = 0.0f;
            branchMergedValue4 = 0.0f;
        }
        intermediateValue5 = branchMergedValue;
        intermediateValue6 = branchMergedValue2;
        intermediateValue7 = branchMergedValue3;
        intermediateValue8 = branchMergedValue4;
    }
    else
    {
        intermediateValue5 = 0.0f;
        intermediateValue6 = 0.0f;
        intermediateValue7 = 0.0f;
        intermediateValue8 = 0.0f;
    }
    float productValue18;
    float productValue19;
    float productValue20;
    float productValue21;
    if (RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f)
    {
        float productValue29 = (varyingColor1.x + 1.0f) * 0.5f;
        float productValue30 = (varyingColor1.y + 1.0f) * 0.5f;
        uint scalarValue5 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue3 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, scalarValue, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.z * varyingColor1.x)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, scalarValue, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.w * varyingColor1.x)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue5))) + (-0.5f);
        uint sumValue1 = uint(min(int(uint(max(int(uint(int(multiplyAddValue3))), int(0u)))), int(scalarValue5 + 4294967294u)));
        float scalarValue6 = float(int(sumValue1));
        float sumValue2 = min(max(multiplyAddValue3 - scalarValue6, 0.0f), 1.0f);
        float4 sampledTextureValue2 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue29, productValue30, scalarValue6), 0.0f);
        float scalarValue7 = sampledTextureValue2.x;
        float scalarValue8 = sampledTextureValue2.y;
        float scalarValue9 = sampledTextureValue2.z;
        float scalarValue10 = sampledTextureValue2.w;
        float4 sampledTextureValue3 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue29, productValue30, float(int(sumValue1 + 1u))), 0.0f);
        productValue18 = ((sampledTextureValue3.x - scalarValue7) * sumValue2) + scalarValue7;
        productValue19 = ((sampledTextureValue3.y - scalarValue8) * sumValue2) + scalarValue8;
        productValue20 = ((sampledTextureValue3.z - scalarValue9) * sumValue2) + scalarValue9;
        productValue21 = ((sampledTextureValue3.w - scalarValue10) * sumValue2) + scalarValue10;
    }
    else
    {
        productValue18 = 0.0f;
        productValue19 = 0.0f;
        productValue20 = 0.0f;
        productValue21 = 1.0f;
    }
    float productValue31 = (productValue21 * (((intermediateValue6 - productValue1) * intermediateValue5) + productValue1)) + productValue18;
    float productValue32 = (productValue21 * (((intermediateValue7 - productValue2) * intermediateValue5) + productValue2)) + productValue19;
    float productValue33 = (productValue21 * (((intermediateValue8 - productValue3) * intermediateValue5) + productValue3)) + productValue20;
    float productValue34;
    float productValue35;
    float productValue36;
    if (RD_UNIFORM_CURRENT_FACE.x == 3.0f)
    {
        productValue34 = RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.z * productValue31;
        productValue35 = RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.z * productValue32;
        productValue36 = RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.z * productValue33;
    }
    else
    {
        float branchMergedValue1;
        float branchMergedValue5;
        float branchMergedValue6;
        if (RD_UNIFORM_CURRENT_FACE.x != 2.0f)
        {
            float quotientValue3 = max((min(max((varyingColor1.y + 1.0f) * 0.5f, RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y), RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x) - RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y) / ((RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x + 9.9999997473787516355514526367188e-06f) - RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y), RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.z);
            branchMergedValue1 = quotientValue3 * productValue31;
            branchMergedValue5 = quotientValue3 * productValue32;
            branchMergedValue6 = quotientValue3 * productValue33;
        }
        else
        {
            branchMergedValue1 = productValue31;
            branchMergedValue5 = productValue32;
            branchMergedValue6 = productValue33;
        }
        productValue34 = branchMergedValue1;
        productValue35 = branchMergedValue5;
        productValue36 = branchMergedValue6;
    }
    bool conditionValue = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
    fragmentColor0.x = conditionValue ? (productValue34 * 0.0033142860047519207000732421875f) : productValue34;
    fragmentColor0.y = conditionValue ? (productValue35 * 0.0033142860047519207000732421875f) : productValue35;
    fragmentColor0.z = conditionValue ? (productValue36 * 0.0033142860047519207000732421875f) : productValue36;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
