// DeferredMixedResolutionLightingPrepass / DiscreteIndirectCombinedLightingPass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_GPUBLOCK_LIGHTING
#define RD_FEATURE_GPUBLOCK_LIGHTING RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_10 1
#endif

#include "../../include/materials/DeferredMixedResolutionLightingPrepass/FragmentBindings.hlsli"

#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF) || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1,
  out float4 fragmentColor2 : SV_TARGET2)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.xy * varyingTexCoord0.xy;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector0.xy = float2(0.5,0.5) + workingVector0.xy;
  workingVector0.xy = RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.zw * workingVector0.xy;
  workingVector0.z = materialTexture6.Sample(textureSampler6, workingVector0.xy).x;
  workingVector0.w = 65535 * workingVector0.z;
  workingVector0.w = floor(workingVector0.w);
  fragmentColor0.w = workingVector0.z * 65535 + -workingVector0.w;
  fragmentColor0.z = 1.52590219e-005 * workingVector0.w;
  workingVector0.zw = materialTexture3.Sample(textureSampler3, workingVector0.xy).xy;
  fragmentColor0.xy = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  materialTexture2.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
  workingVector0.zw = floatingPointResult.xy;
  workingVector0.zw = workingVector0.zw * workingVector0.xy;
  workingVector0.x = materialTexture1.Sample(textureSampler1, workingVector0.xy).w;
  workingVector0.x = -0.501960814 + workingVector0.x;
  workingVector0.x = saturate(2.00787401 * workingVector0.x);
  workingVector0.x = 1 + -workingVector0.x;
  workingVector1.xy = (int2)workingVector0.zw;
  workingVector1.zw = float2(0,0);
  workingVector0.yzw = materialTexture2.Load(workingVector1.xyz).yzw;
  if (8 == 0) workingVector1.x = 0; else if (8+8 < 32) {   workingVector1.x = (uint)workingVector0.y << (32-(8 + 8)); workingVector1.x = (uint)workingVector1.x >> (32-8);  } else workingVector1.x = (uint)workingVector0.y >> 8;
  if (8 == 0) workingVector1.y = 0; else if (8+8 < 32) {   workingVector1.y = (uint)workingVector0.z << (32-(8 + 8)); workingVector1.y = (uint)workingVector1.y >> (32-8);  } else workingVector1.y = (uint)workingVector0.z >> 8;
  workingVector0.yzw = (int3)workingVector0.wyz & int3(255,255,255);
  workingVector1.xz = (uint2)workingVector1.xy;
  workingVector1.yw = (uint2)workingVector0.zw;
  workingVector0.y = (uint)workingVector0.y;
  workingVector0.y = 0.00392156886 * workingVector0.y;
  workingVector1.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector1.xyzw;
  workingVector1.xyz = workingVector1.xyz * workingVector1.www;
  workingVector1.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector1.xyz;
  workingVector0.z = workingVector0.y * workingVector0.y;
  workingVector0.w = workingVector0.z * workingVector0.z;
  workingVector0.w = workingVector0.w * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y + -workingVector0.w;
  workingVector0.y = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector0.y + workingVector0.w;
  workingVector0.yzw = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.yyy;
  workingVector0.yzw = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector0.yzw;
  workingVector0.yzw = workingVector1.xyz * float3(6,6,6) + workingVector0.yzw;
  workingVector1.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector0.yzw = max(workingVector1.xyz, workingVector0.yzw);
  workingVector0.xyz = workingVector0.xxx * workingVector0.yzw;
  fragmentColor1.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www * workingVector0.xyz;
  fragmentColor1.w = 1;
  fragmentColor2.xyzw = float4(0,0,0,1);
  return;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.x * varyingTexCoord0.x) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.z;
    float productValue1 = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.y * varyingTexCoord0.y) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.w;
    float4 sampledTextureValue = normalTexture.Sample(normalSampler, float2(productValue, productValue1));
    uint unusedTextureMipCount91;
    uint2 vectorValue = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount91);
    uint4 loadedBufferValue = emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue.x)))))) * productValue)), uint(int(float(int(uint(int(float(int(vectorValue.y)))))) * productValue1))), 0u));
    uint scalarValue = loadedBufferValue.y;
    uint scalarValue1 = loadedBufferValue.z;
    float bitwiseValue = float(loadedBufferValue.w & 255u) * 0.0039215688593685626983642578125f;
    float bitwiseValue1 = (float(scalarValue1 & 255u) * 9.2272217443678528070449829101562e-05f) * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w;
    float productValue2 = bitwiseValue * bitwiseValue;
    float productValue3 = productValue2 * productValue2;
    float productValue4 = ((((productValue2 - productValue3) * RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y) + productValue3) * bitwiseValue) * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
    float sampledTextureValue1 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * (1.0f - clamp((colorMetalnessSubsurfaceTexture.Sample(colorMetalnessSubsurfaceSampler, float2(productValue, productValue1)).w + (-0.501960813999176025390625f)) * 2.007874011993408203125f, 0.0f, 1.0f));
    float sampledTextureValue2 = sceneDepthTexture.Sample(sceneDepthSampler, float2(productValue, productValue1)).x * 65535.0f;
    float scalarValue2 = floor(sampledTextureValue2);
    fragmentColor0.x = (sampledTextureValue.x * 0.5f) + 0.5f;
    fragmentColor0.y = (sampledTextureValue.y * 0.5f) + 0.5f;
    fragmentColor0.z = scalarValue2 * 1.525902189314365386962890625e-05f;
    fragmentColor0.w = sampledTextureValue2 - scalarValue2;
    fragmentColor1.x = sampledTextureValue1 * max((bitwiseValue1 * float((scalarValue >> 8u) & 255u)) + (productValue4 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w);
    fragmentColor1.y = sampledTextureValue1 * max((bitwiseValue1 * float(scalarValue & 255u)) + (productValue4 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w);
    fragmentColor1.z = sampledTextureValue1 * max((bitwiseValue1 * float((scalarValue1 >> 8u) & 255u)) + (productValue4 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w);
    fragmentColor1.w = 1.0f;
    fragmentColor2.x = 0.0f;
    fragmentColor2.y = 0.0f;
    fragmentColor2.z = 0.0f;
    fragmentColor2.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.x * varyingTexCoord0.x) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.z;
    float productValue1 = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.y * varyingTexCoord0.y) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.w;
    float productValue5 = (productValue * 2.0f) + (-1.0f);
    float productValue6 = ((1.0f - productValue1) * 2.0f) + (-1.0f);
    float4 sampledTextureValue = normalTexture.Sample(normalSampler, float2(productValue, productValue1));
    float scalarValue3 = sampledTextureValue.x;
    float scalarValue4 = sampledTextureValue.y;
    float4 sampledTextureValue3 = sceneDepthTexture.Sample(sceneDepthSampler, float2(productValue, productValue1));
    float scalarValue5 = sampledTextureValue3.x;
    float productValue7 = (scalarValue5 * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue = (productValue5 * RD_UNIFORM_INV_PROJ_ROW_0.x) / productValue7;
    float quotientValue1 = (productValue6 * RD_UNIFORM_INV_PROJ_ROW_1.y) / productValue7;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue7;
    float sumValue = (-0.0f) - quotientValue2;
    float multiplyAddValue = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z;
    float quotientValue3 = ((RD_UNIFORM_SUB_PIXEL_OFFSET.x + productValue5) * RD_UNIFORM_INV_PROJ_ROW_0.x) / productValue7;
    float quotientValue4 = ((productValue6 - RD_UNIFORM_SUB_PIXEL_OFFSET.y) * RD_UNIFORM_INV_PROJ_ROW_1.y) / productValue7;
    float multiplyAddValue3 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x) - RD_UNIFORM_WORLD_ORIGIN.x;
    float multiplyAddValue4 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y) - RD_UNIFORM_WORLD_ORIGIN.y;
    float multiplyAddValue5 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z) - RD_UNIFORM_WORLD_ORIGIN.z;
    float scalarValue6 = ddx_coarse(quotientValue3);
    float scalarValue7 = ddx_coarse(quotientValue4);
    float scalarValue8 = ddx_coarse(quotientValue2);
    float inverseLengthValue = rsqrt(dot(float3(scalarValue6, scalarValue7, scalarValue8), float3(scalarValue6, scalarValue7, scalarValue8)));
    float productValue8 = inverseLengthValue * scalarValue6;
    float productValue9 = inverseLengthValue * scalarValue7;
    float productValue10 = inverseLengthValue * scalarValue8;
    float sumValue1 = ddy_coarse((-0.0f) - quotientValue3);
    float sumValue2 = ddy_coarse((-0.0f) - quotientValue4);
    float sumValue3 = ddy_coarse((-0.0f) - quotientValue2);
    float inverseLengthValue1 = rsqrt(dot(float3(sumValue1, sumValue2, sumValue3), float3(sumValue1, sumValue2, sumValue3)));
    float productValue11 = inverseLengthValue1 * sumValue1;
    float productValue12 = inverseLengthValue1 * sumValue2;
    float productValue13 = inverseLengthValue1 * sumValue3;
    float productValue14 = (productValue13 * productValue9) - (productValue12 * productValue10);
    float productValue15 = (productValue11 * productValue10) - (productValue13 * productValue8);
    float productValue16 = (productValue12 * productValue8) - (productValue11 * productValue9);
    float inverseLengthValue2 = rsqrt(dot(float3(productValue14, productValue15, productValue16), float3(productValue14, productValue15, productValue16)));
    float productValue17 = productValue14 * inverseLengthValue2;
    float productValue18 = productValue15 * inverseLengthValue2;
    float productValue19 = productValue16 * inverseLengthValue2;
    float multiplyAddValue6 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue19, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue18, productValue17 * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue7 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue19, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue18, productValue17 * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue8 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue19, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue18, productValue17 * RD_UNIFORM_INV_VIEW_ROW_0.z));
    float inverseLengthValue3 = rsqrt(dot(float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8), float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8)));
    float quotientValue5 = round((inverseLengthValue3 * multiplyAddValue6) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue6 = round((inverseLengthValue3 * multiplyAddValue7) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue7 = round((inverseLengthValue3 * multiplyAddValue8) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float inverseLengthValue4 = rsqrt(dot(float3(quotientValue5, quotientValue6, quotientValue7), float3(quotientValue5, quotientValue6, quotientValue7)));
    float productValue20 = inverseLengthValue4 * quotientValue5;
    float productValue21 = inverseLengthValue4 * quotientValue6;
    float productValue35 = inverseLengthValue4 * quotientValue7;
    float productValue36 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
    float quotientValue8 = productValue36 - (multiplyAddValue3 - (floor(multiplyAddValue3 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue9 = productValue36 - (multiplyAddValue4 - (floor(multiplyAddValue4 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue10 = productValue36 - (multiplyAddValue5 - (floor(multiplyAddValue5 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float dotProductValue = dot(float3(quotientValue8, quotientValue9, quotientValue10), float3(productValue20, productValue21, productValue35));
    float sumValue4 = 1.0f - abs(scalarValue3);
    float scalarValue9 = abs(scalarValue4);
    float sumValue5 = sumValue4 - scalarValue9;
    bool conditionValue = sumValue5 < 0.0f;
    float comparisonValue = conditionValue ? ((1.0f - scalarValue9) * ((scalarValue3 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue3;
    float comparisonValue1 = conditionValue ? (sumValue4 * ((scalarValue4 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue4;
    float inverseLengthValue5 = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue5), float3(comparisonValue, comparisonValue1, sumValue5)));
    float productValue37 = comparisonValue * inverseLengthValue5;
    float productValue38 = comparisonValue1 * inverseLengthValue5;
    float productValue39 = inverseLengthValue5 * sumValue5;
    float inverseLengthValue6 = rsqrt(dot(float3(productValue37, productValue38, productValue39), float3(productValue37, productValue38, productValue39)));
    float productValue40 = inverseLengthValue6 * productValue37;
    float productValue41 = productValue38 * inverseLengthValue6;
    float productValue42 = inverseLengthValue6 * productValue39;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue41, productValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue41, productValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue41, productValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue43 = inverseLengthValue7 * multiplyAddValue9;
    float productValue44 = inverseLengthValue7 * multiplyAddValue10;
    float productValue45 = inverseLengthValue7 * multiplyAddValue11;
    float4 sampledTextureValue4 = colorMetalnessSubsurfaceTexture.Sample(colorMetalnessSubsurfaceSampler, float2(productValue, productValue1));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue13 = sampledTextureValue4.w;
    float clampedValue = clamp((scalarValue13 + (-0.501960813999176025390625f)) * 2.007874011993408203125f, 0.0f, 1.0f);
    uint unusedTextureMipCount393;
    uint2 vectorValue1 = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount393);
    uint4 loadedBufferValue2 = emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue1.x)))))) * productValue)), uint(int(float(int(uint(int(float(int(vectorValue1.y)))))) * productValue1))), 0u));
    uint scalarValue14 = loadedBufferValue2.y;
    uint scalarValue15 = loadedBufferValue2.z;
    float bitwiseValue2 = float((loadedBufferValue2.x >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    float bitwiseValue3 = float(loadedBufferValue2.w & 255u) * 0.0039215688593685626983642578125f;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
        exponentialValue = exp2(log2(max(scalarValue10, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(scalarValue11, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(scalarValue12, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (scalarValue10 <= 0.040449999272823333740234375f) ? (scalarValue10 * 0.077399380505084991455078125f) : exp2(log2((scalarValue10 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (scalarValue11 <= 0.040449999272823333740234375f) ? (scalarValue11 * 0.077399380505084991455078125f) : exp2(log2((scalarValue11 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (scalarValue12 <= 0.040449999272823333740234375f) ? (scalarValue12 * 0.077399380505084991455078125f) : exp2(log2((scalarValue12 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
    float sumValue6 = 1.0f - clampedValue;
    float productValue46 = sumValue6 * 0.039999999105930328369140625f;
    float productValue47 = (exponentialValue * clampedValue) + productValue46;
    float productValue48 = (exponentialValue1 * clampedValue) + productValue46;
    float productValue49 = (exponentialValue2 * clampedValue) + productValue46;
    float nonlinearValue = sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2)) + 9.9999997473787516355514526367188e-05f;
    float quotientValue11 = quotientValue / nonlinearValue;
    float quotientValue12 = quotientValue1 / nonlinearValue;
    float quotientValue13 = quotientValue2 / nonlinearValue;
    float sumValue16 = (-0.0f) - quotientValue11;
    float sumValue32 = (-0.0f) - quotientValue12;
    float sumValue54 = (-0.0f) - quotientValue13;
    float clampedValue1 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * clamp((0.4980392158031463623046875f - scalarValue13) * 2.007874011993408203125f, 0.0f, 1.0f);
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
    if (scalarValue5 != 1.0f)
    {
        float branchMergedValue5;
        float branchMergedValue10;
        float branchMergedValue11;
        float branchMergedValue12;
        float branchMergedValue13;
        float branchMergedValue14;
        if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
        {
            bool conditionValue1 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
            float comparisonValue2 = conditionValue1 ? (((quotientValue8 + multiplyAddValue3) - (dotProductValue * productValue20)) + RD_UNIFORM_WORLD_ORIGIN.x) : multiplyAddValue;
            float comparisonValue3 = conditionValue1 ? (((multiplyAddValue4 - (dotProductValue * productValue21)) + quotientValue9) + RD_UNIFORM_WORLD_ORIGIN.y) : multiplyAddValue1;
            float comparisonValue10 = conditionValue1 ? (((multiplyAddValue5 - (dotProductValue * productValue35)) + quotientValue10) + RD_UNIFORM_WORLD_ORIGIN.z) : multiplyAddValue2;
            float productValue50 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue;
            float productValue51 = productValue50 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
            float intermediateValue23;
            if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue)
            {
                intermediateValue23 = 0.0f;
            }
            else
            {
                float branchMergedValue6;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue)
                {
                    branchMergedValue6 = 1.0f;
                }
                else
                {
                    branchMergedValue6 = min(floor(min(max((log2(sumValue) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                }
                intermediateValue23 = branchMergedValue6;
            }
            float quotientValue14 = min(floor(min(max((productValue51 + quotientValue) / (productValue51 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
            float quotientValue15 = min(floor(min(max((productValue50 + quotientValue1) / (productValue50 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
            uint intermediateValue24;
            bool intermediateValue26;
            uint intermediateValue27;
            if ((intermediateValue23 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue15 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue14 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue23 < 0.0f) || ((quotientValue14 < 0.0f) || (quotientValue15 < 0.0f))))))
            {
                intermediateValue24 = intermediateValue25;
                intermediateValue26 = false;
                intermediateValue27 = 0u;
            }
            else
            {
                uint scalarValue16 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                uint productValue52 = uint(int(((quotientValue15 + (intermediateValue23 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue14)) * scalarValue16;
                intermediateValue24 = productValue52;
                intermediateValue26 = true;
                intermediateValue27 = productValue52 + scalarValue16;
            }
            float intermediateValue29;
            float intermediateValue31;
            float intermediateValue33;
            float intermediateValue35;
            float intermediateValue37;
            float intermediateValue39;
            if (intermediateValue26 && (int(intermediateValue24) < int(intermediateValue27)))
            {
                float intermediateValue51;
                float quotientValue16;
                float dotProductValue3;
                float sumValue18;
                float sumValue19;
                float sumValue20;
                float quotientValue18;
                float quotientValue19;
                float quotientValue20;
                float intermediateValue54;
                float intermediateValue55;
                float intermediateValue56;
                float intermediateValue57;
                float intermediateValue59;
                float intermediateValue30;
                float intermediateValue32;
                float intermediateValue34;
                float intermediateValue36;
                float intermediateValue38;
                float intermediateValue40;
                float scalarValue17 = 0.0f;
                float scalarValue18 = 0.0f;
                float scalarValue19 = 0.0f;
                float scalarValue20 = 0.0f;
                float scalarValue21 = 0.0f;
                float scalarValue22 = 0.0f;
                uint scalarValue23 = intermediateValue24;
                uint loadedBufferValue1;
                for (;;)
                {
                    loadedBufferValue1 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue23).x)));
                    if (int(loadedBufferValue1) < int(0u))
                    {
                        intermediateValue30 = scalarValue17;
                        intermediateValue32 = scalarValue18;
                        intermediateValue34 = scalarValue19;
                        intermediateValue36 = scalarValue20;
                        intermediateValue38 = scalarValue21;
                        intermediateValue40 = scalarValue22;
                        break;
                    }
                    else
                    {
                        uint productValue53 = loadedBufferValue1 * 32u;
                        float4 loadedBufferValue3 = asfloat(uint4(rdLoad_zLights(productValue53).x, rdLoad_zLights(productValue53 + 1u).x, rdLoad_zLights(productValue53 + 2u).x, rdLoad_zLights(productValue53 + 3u).x));
                        float scalarValue24 = loadedBufferValue3.x;
                        float scalarValue25 = loadedBufferValue3.y;
                        float scalarValue26 = loadedBufferValue3.z;
                        float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue26, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, scalarValue25, scalarValue24 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.x - quotientValue);
                        float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue26, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, scalarValue25, scalarValue24 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.y - quotientValue1);
                        float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue26, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, scalarValue25, scalarValue24 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.z - quotientValue2);
                        float inverseLengthValue8 = rsqrt(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14)));
                        float productValue54 = inverseLengthValue8 * multiplyAddValue12;
                        float productValue55 = inverseLengthValue8 * multiplyAddValue13;
                        float productValue56 = inverseLengthValue8 * multiplyAddValue14;
                        float dotProductValue1 = dot(float3(productValue43, productValue44, productValue45), float3(productValue54, productValue55, productValue56));
                        intermediateValue51 = max(dotProductValue1, 0.0f);
                        float dotProductValue2 = max(dot(float3(productValue43, productValue44, productValue45), float3(sumValue16, sumValue32, sumValue54)), 0.0f);
                        float sumValue64 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
                        float productValue57 = sumValue64 * sumValue64;
                        quotientValue16 = ((max((dotProductValue1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue57, 0.0f) - intermediateValue51) * clampedValue1) + intermediateValue51;
                        dotProductValue3 = max((dot(float3((-0.0f) - productValue43, (-0.0f) - productValue44, (-0.0f) - productValue45), float3(productValue54, productValue55, productValue56)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue57, 0.0f) * clampedValue1;
                        float sumValue71 = productValue54 - quotientValue11;
                        float sumValue72 = productValue55 - quotientValue12;
                        float sumValue73 = productValue56 - quotientValue13;
                        float inverseLengthValue9 = rsqrt(dot(float3(sumValue71, sumValue72, sumValue73), float3(sumValue71, sumValue72, sumValue73)));
                        float productValue58 = inverseLengthValue9 * sumValue71;
                        float productValue59 = inverseLengthValue9 * sumValue72;
                        float productValue73 = inverseLengthValue9 * sumValue73;
                        float scalarValue27 = max(bitwiseValue2, 0.0500000007450580596923828125f);
                        float productValue74 = scalarValue27 * scalarValue27;
                        float productValue75 = productValue74 * productValue74;
                        float dotProductValue4 = max(dot(float3(productValue43, productValue44, productValue45), float3(productValue58, productValue59, productValue73)), 0.0f);
                        float productValue76 = ((dotProductValue4 * dotProductValue4) * (productValue75 + (-1.0f))) + 1.0f;
                        float productValue77 = productValue74 * 0.5f;
                        float sumValue80 = 1.0f - productValue77;
                        float sumValue81 = productValue77 + 9.9999997473787516355514526367188e-05f;
                        float clampedValue2 = clamp(1.0f - max(dot(float3(sumValue16, sumValue32, sumValue54), float3(productValue58, productValue59, productValue73)), 0.0f), 0.0f, 1.0f);
                        float productValue78 = clampedValue2 * clampedValue2;
                        float productValue79 = (productValue78 * productValue78) * clampedValue2;
                        float productValue80 = (productValue79 * (1.0f - productValue47)) + productValue47;
                        float productValue81 = (productValue79 * (1.0f - productValue48)) + productValue48;
                        float productValue82 = (productValue79 * (1.0f - productValue49)) + productValue49;
                        sumValue18 = 1.0f - productValue80;
                        sumValue19 = 1.0f - productValue81;
                        sumValue20 = 1.0f - productValue82;
                        float quotientValue17 = ((dotProductValue2 / ((sumValue80 * dotProductValue2) + sumValue81)) * (productValue75 / ((productValue76 * productValue76) * 3.1415927410125732421875f))) * (intermediateValue51 / ((sumValue80 * intermediateValue51) + sumValue81));
                        float productValue83 = ((intermediateValue51 * 4.0f) * dotProductValue2) + 9.9999997473787516355514526367188e-05f;
                        quotientValue18 = (productValue80 * quotientValue17) / productValue83;
                        quotientValue19 = (productValue81 * quotientValue17) / productValue83;
                        quotientValue20 = (productValue82 * quotientValue17) / productValue83;
                        float sumValue82 = scalarValue24 - multiplyAddValue;
                        float sumValue83 = scalarValue25 - multiplyAddValue1;
                        float sumValue84 = scalarValue26 - multiplyAddValue2;
                        float productValue66;
                        if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                        {
                            float sumValue85 = (abs(sumValue83) + abs(sumValue82)) + abs(sumValue84);
                            productValue66 = sumValue85 * sumValue85;
                        }
                        else
                        {
                            productValue66 = dot(float3(sumValue82, sumValue83, sumValue84), float3(sumValue82, sumValue83, sumValue84));
                        }
                        float scalarValue28 = loadedBufferValue3.w;
                        float productValue84 = scalarValue28 * scalarValue28;
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        float branchMergedValue4;
                        if (!(productValue66 >= productValue84))
                        {
                            float intermediateValue58;
                            float intermediateValue60;
                            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                            {
                                uint productValue85 = (loadedBufferValue1 * 32u) + 8u;
                                float4 loadedBufferValue5 = asfloat(uint4(rdLoad_zLights(productValue85).x, rdLoad_zLights(productValue85 + 1u).x, rdLoad_zLights(productValue85 + 2u).x, rdLoad_zLights(productValue85 + 3u).x));
                                uint productValue86 = (loadedBufferValue1 * 32u) + 12u;
                                float4 loadedBufferValue6 = asfloat(uint4(rdLoad_zLights(productValue86).x, rdLoad_zLights(productValue86 + 1u).x, rdLoad_zLights(productValue86 + 2u).x, rdLoad_zLights(productValue86 + 3u).x));
                                uint productValue87 = (loadedBufferValue1 * 32u) + 16u;
                                float4 loadedBufferValue7 = asfloat(uint4(rdLoad_zLights(productValue87).x, rdLoad_zLights(productValue87 + 1u).x, rdLoad_zLights(productValue87 + 2u).x, rdLoad_zLights(productValue87 + 3u).x));
                                uint productValue88 = (loadedBufferValue1 * 32u) + 20u;
                                float4 loadedBufferValue8 = asfloat(uint4(rdLoad_zLights(productValue88).x, rdLoad_zLights(productValue88 + 1u).x, rdLoad_zLights(productValue88 + 2u).x, rdLoad_zLights(productValue88 + 3u).x));
                                uint productValue89 = (loadedBufferValue1 * 32u) + 24u;
                                float4 loadedBufferValue10 = asfloat(uint4(rdLoad_zLights(productValue89).x, rdLoad_zLights(productValue89 + 1u).x, rdLoad_zLights(productValue89 + 2u).x, rdLoad_zLights(productValue89 + 3u).x));
                                uint productValue90 = (loadedBufferValue1 * 32u) + 28u;
                                float4 loadedBufferValue13 = asfloat(uint4(rdLoad_zLights(productValue90).x, rdLoad_zLights(productValue90 + 1u).x, rdLoad_zLights(productValue90 + 2u).x, rdLoad_zLights(productValue90 + 3u).x));
                                float sumValue86 = comparisonValue2 - scalarValue24;
                                float sumValue88 = comparisonValue3 - scalarValue25;
                                float sumValue89 = comparisonValue10 - scalarValue26;
                                float scalarValue29 = abs(sumValue86);
                                float scalarValue30 = abs(sumValue88);
                                float scalarValue31 = abs(sumValue89);
                                uint comparisonValue5;
                                if ((scalarValue29 >= scalarValue30) && (scalarValue29 >= scalarValue31))
                                {
                                    comparisonValue5 = uint(!(sumValue86 >= 0.0f));
                                }
                                else
                                {
                                    uint branchMergedValue8;
                                    if (!(scalarValue30 >= scalarValue31))
                                    {
                                        branchMergedValue8 = (sumValue89 >= 0.0f) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue8 = (sumValue88 >= 0.0f) ? 2u : 3u;
                                    }
                                    comparisonValue5 = branchMergedValue8;
                                }
                                float sumValue90 = (-0.0f) - sumValue86;
                                float intermediateValue64;
                                float intermediateValue65;
                                float intermediateValue66;
                                float intermediateValue67;
                                float sumValue29;
                                float intermediateValue68;
                                float intermediateValue69;
                                if (comparisonValue5 == 1u)
                                {
                                    intermediateValue64 = loadedBufferValue6.x;
                                    intermediateValue65 = loadedBufferValue6.y;
                                    intermediateValue66 = loadedBufferValue6.z;
                                    intermediateValue67 = loadedBufferValue6.w;
                                    sumValue29 = (-0.0f) - sumValue89;
                                    intermediateValue68 = sumValue88;
                                    intermediateValue69 = sumValue86;
                                }
                                else
                                {
                                    float branchMergedValue9;
                                    float branchMergedValue16;
                                    float branchMergedValue17;
                                    float branchMergedValue18;
                                    float branchMergedValue19;
                                    float branchMergedValue20;
                                    float branchMergedValue21;
                                    if (comparisonValue5 == 2u)
                                    {
                                        branchMergedValue9 = loadedBufferValue7.x;
                                        branchMergedValue16 = (-0.0f) - sumValue88;
                                        branchMergedValue17 = sumValue90;
                                        branchMergedValue18 = (-0.0f) - sumValue89;
                                        branchMergedValue19 = loadedBufferValue7.w;
                                        branchMergedValue20 = loadedBufferValue7.z;
                                        branchMergedValue21 = loadedBufferValue7.y;
                                    }
                                    else
                                    {
                                        float branchMergedValue23;
                                        float branchMergedValue25;
                                        float branchMergedValue26;
                                        float branchMergedValue27;
                                        float branchMergedValue28;
                                        float branchMergedValue29;
                                        float branchMergedValue30;
                                        if (comparisonValue5 == 3u)
                                        {
                                            branchMergedValue23 = loadedBufferValue8.x;
                                            branchMergedValue25 = sumValue88;
                                            branchMergedValue26 = sumValue90;
                                            branchMergedValue27 = sumValue89;
                                            branchMergedValue28 = loadedBufferValue8.w;
                                            branchMergedValue29 = loadedBufferValue8.z;
                                            branchMergedValue30 = loadedBufferValue8.y;
                                        }
                                        else
                                        {
                                            float branchMergedValue31;
                                            float branchMergedValue32;
                                            float branchMergedValue33;
                                            float branchMergedValue34;
                                            float branchMergedValue35;
                                            float branchMergedValue36;
                                            float branchMergedValue37;
                                            if (comparisonValue5 == 4u)
                                            {
                                                branchMergedValue31 = loadedBufferValue10.x;
                                                branchMergedValue32 = (-0.0f) - sumValue89;
                                                branchMergedValue33 = sumValue90;
                                                branchMergedValue34 = sumValue88;
                                                branchMergedValue35 = loadedBufferValue10.w;
                                                branchMergedValue36 = loadedBufferValue10.z;
                                                branchMergedValue37 = loadedBufferValue10.y;
                                            }
                                            else
                                            {
                                                bool comparisonValue13 = comparisonValue5 == 5u;
                                                branchMergedValue31 = comparisonValue13 ? loadedBufferValue13.x : loadedBufferValue5.x;
                                                branchMergedValue32 = comparisonValue13 ? sumValue89 : sumValue90;
                                                branchMergedValue33 = comparisonValue13 ? sumValue86 : sumValue89;
                                                branchMergedValue34 = sumValue88;
                                                branchMergedValue35 = comparisonValue13 ? loadedBufferValue13.w : loadedBufferValue5.w;
                                                branchMergedValue36 = comparisonValue13 ? loadedBufferValue13.z : loadedBufferValue5.z;
                                                branchMergedValue37 = comparisonValue13 ? loadedBufferValue13.y : loadedBufferValue5.y;
                                            }
                                            branchMergedValue23 = branchMergedValue31;
                                            branchMergedValue25 = branchMergedValue32;
                                            branchMergedValue26 = branchMergedValue33;
                                            branchMergedValue27 = branchMergedValue34;
                                            branchMergedValue28 = branchMergedValue35;
                                            branchMergedValue29 = branchMergedValue36;
                                            branchMergedValue30 = branchMergedValue37;
                                        }
                                        branchMergedValue9 = branchMergedValue23;
                                        branchMergedValue16 = branchMergedValue25;
                                        branchMergedValue17 = branchMergedValue26;
                                        branchMergedValue18 = branchMergedValue27;
                                        branchMergedValue19 = branchMergedValue28;
                                        branchMergedValue20 = branchMergedValue29;
                                        branchMergedValue21 = branchMergedValue30;
                                    }
                                    intermediateValue64 = branchMergedValue9;
                                    intermediateValue65 = branchMergedValue21;
                                    intermediateValue66 = branchMergedValue20;
                                    intermediateValue67 = branchMergedValue19;
                                    sumValue29 = branchMergedValue17;
                                    intermediateValue68 = branchMergedValue18;
                                    intermediateValue69 = branchMergedValue16;
                                }
                                float branchMergedValue7;
                                float branchMergedValue15;
                                if ((intermediateValue66 == 0.0f) && (intermediateValue67 == 0.0f))
                                {
                                    branchMergedValue7 = 1.0f;
                                    branchMergedValue15 = 0.0f;
                                }
                                else
                                {
                                    float multiplyAddValue15 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue69, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue68, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue29)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                    float inverseLengthValue10 = rsqrt(dot(float3(productValue40, productValue41, productValue42), float3(productValue40, productValue41, productValue42)));
                                    float sumValue91 = (-0.0f) - sumValue88;
                                    float sumValue92 = (-0.0f) - sumValue89;
                                    float inverseLengthValue11 = rsqrt(dot(float3(sumValue90, sumValue91, sumValue92), float3(sumValue90, sumValue91, sumValue92)));
                                    float dotProductValue5 = min(max(dot(float3(inverseLengthValue11 * sumValue90, inverseLengthValue11 * sumValue91, inverseLengthValue11 * sumValue92), float3(inverseLengthValue10 * productValue40, inverseLengthValue10 * productValue41, inverseLengthValue10 * productValue42)), RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x), 1.0f);
                                    float sumValue93 = intermediateValue66 - intermediateValue64;
                                    float productValue92 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue93;
                                    float multiplyAddValue16 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue69, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue68, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue29)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue15;
                                    float multiplyAddValue17 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue69, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue68, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue29)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue15;
                                    float quotientValue21 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                    float quotientValue22 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                    float sumValue94 = intermediateValue67 - intermediateValue65;
                                    float productValue93 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue94;
                                    float4 sampledTextureValue5 = pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(((multiplyAddValue16 * 0.5f) + 0.5f) * productValue92) + 0.5f) / productValue92) * sumValue93) + intermediateValue64, quotientValue21 + intermediateValue64), intermediateValue66 - quotientValue21), min(max((((floor((0.5f - (multiplyAddValue17 * 0.5f)) * productValue93) + 0.5f) / productValue93) * sumValue94) + intermediateValue65, quotientValue22 + intermediateValue65), intermediateValue67 - quotientValue22)), 0.0f);
                                    float scalarValue32 = sampledTextureValue5.x;
                                    float multiplyAddValue18 = float(scalarValue32 >= (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue69, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue68, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue29)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) - ((RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / max(productValue92, 1.0f)) * (((sqrt(1.0f - (dotProductValue5 * dotProductValue5)) / dotProductValue5) * RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y) + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x))) / multiplyAddValue15));
                                    float branchMergedValue22;
                                    float branchMergedValue24;
                                    if (clampedValue1 > 0.0f)
                                    {
                                        float multiplyAddValue19 = mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.w, scalarValue32, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.w, multiplyAddValue17, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.w * multiplyAddValue16)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.w;
                                        float multiplyAddValue20 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.x, scalarValue32, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.x, multiplyAddValue17, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.x * multiplyAddValue16)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.x) / multiplyAddValue19;
                                        float multiplyAddValue21 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.y, scalarValue32, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.y, multiplyAddValue17, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.y * multiplyAddValue16)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.y) / multiplyAddValue19;
                                        float multiplyAddValue22 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.z, scalarValue32, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.z, multiplyAddValue17, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.z * multiplyAddValue16)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.z) / multiplyAddValue19;
                                        float clampedValue3 = clamp((sqrt(((intermediateValue68 * intermediateValue68) + (sumValue29 * sumValue29)) + (intermediateValue69 * intermediateValue69)) - sqrt(((multiplyAddValue21 * multiplyAddValue21) + (multiplyAddValue20 * multiplyAddValue20)) + (multiplyAddValue22 * multiplyAddValue22))) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z, 0.0f, 1.0f);
                                        branchMergedValue22 = 1.0f - ((clampedValue3 * clampedValue3) * (3.0f - (clampedValue3 * 2.0f)));
                                        branchMergedValue24 = multiplyAddValue18;
                                    }
                                    else
                                    {
                                        branchMergedValue22 = 1.0f;
                                        branchMergedValue24 = multiplyAddValue18;
                                    }
                                    branchMergedValue7 = branchMergedValue22;
                                    branchMergedValue15 = branchMergedValue24;
                                }
                                intermediateValue58 = branchMergedValue15;
                                intermediateValue60 = branchMergedValue7;
                            }
                            else
                            {
                                intermediateValue58 = 1.0f;
                                intermediateValue60 = 1.0f;
                            }
                            uint productValue94 = (loadedBufferValue1 * 32u) + 4u;
                            float4 loadedBufferValue15 = asfloat(uint4(rdLoad_zLights(productValue94).x, rdLoad_zLights(productValue94 + 1u).x, rdLoad_zLights(productValue94 + 2u).x, rdLoad_zLights(productValue94 + 3u).x));
                            float quotientValue23 = productValue66 / (productValue84 + 9.9999997473787516355514526367188e-05f);
                            float clampedValue4 = clamp(1.0f - (quotientValue23 * quotientValue23), 0.0f, 1.0f);
                            float quotientValue24 = (clampedValue4 * clampedValue4) * (1.0f / max(productValue66, 0.100000001490116119384765625f));
                            float clampedValue5;
                            if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                            {
                                float clampedValue6 = clamp(((1.0f - quotientValue24) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                clampedValue5 = clamp((((clampedValue6 * clampedValue6) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue6 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue24;
                            }
                            else
                            {
                                clampedValue5 = quotientValue24;
                            }
                            float productValue95 = clampedValue5 * loadedBufferValue15.w;
                            branchMergedValue = intermediateValue60;
                            branchMergedValue1 = intermediateValue58;
                            branchMergedValue2 = productValue95 * loadedBufferValue15.z;
                            branchMergedValue3 = productValue95 * loadedBufferValue15.x;
                            branchMergedValue4 = productValue95 * loadedBufferValue15.y;
                        }
                        else
                        {
                            branchMergedValue = 1.0f;
                            branchMergedValue1 = 1.0f;
                            branchMergedValue2 = 0.0f;
                            branchMergedValue3 = 0.0f;
                            branchMergedValue4 = 0.0f;
                        }
                        intermediateValue59 = branchMergedValue;
                        intermediateValue57 = branchMergedValue1;
                        intermediateValue56 = branchMergedValue2;
                        intermediateValue54 = branchMergedValue3;
                        intermediateValue55 = branchMergedValue4;
                        float productValue96 = intermediateValue57 * quotientValue16;
                        float productValue97 = dotProductValue3 * intermediateValue59;
                        float productValue98 = sumValue6 * 0.3183098733425140380859375f;
                        float productValue99 = (((productValue98 * intermediateValue54) * (productValue97 + (productValue96 * sumValue18))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue20;
                        float productValue100 = (((productValue98 * intermediateValue55) * (productValue97 + (productValue96 * sumValue19))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue21;
                        float productValue101 = (((productValue98 * intermediateValue56) * (productValue97 + (productValue96 * sumValue20))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue22;
                        float productValue102 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (intermediateValue57 * intermediateValue51);
                        float productValue103 = ((productValue102 * quotientValue18) * intermediateValue54) + scalarValue17;
                        float productValue104 = ((productValue102 * quotientValue19) * intermediateValue55) + scalarValue18;
                        float productValue105 = ((productValue102 * quotientValue20) * intermediateValue56) + scalarValue19;
                        uint sumValue95 = scalarValue23 + 1u;
                        if (int(sumValue95) < int(intermediateValue27))
                        {
                            scalarValue17 = productValue103;
                            scalarValue18 = productValue104;
                            scalarValue19 = productValue105;
                            scalarValue20 = productValue99;
                            scalarValue21 = productValue100;
                            scalarValue22 = productValue101;
                            scalarValue23 = sumValue95;
                            continue;
                        }
                        else
                        {
                            intermediateValue30 = productValue103;
                            intermediateValue32 = productValue104;
                            intermediateValue34 = productValue105;
                            intermediateValue36 = productValue99;
                            intermediateValue38 = productValue100;
                            intermediateValue40 = productValue101;
                            break;
                        }
                    }
                }
                intermediateValue29 = intermediateValue30;
                intermediateValue31 = intermediateValue32;
                intermediateValue33 = intermediateValue34;
                intermediateValue35 = intermediateValue36;
                intermediateValue37 = intermediateValue38;
                intermediateValue39 = intermediateValue40;
            }
            else
            {
                intermediateValue29 = 0.0f;
                intermediateValue31 = 0.0f;
                intermediateValue33 = 0.0f;
                intermediateValue35 = 0.0f;
                intermediateValue37 = 0.0f;
                intermediateValue39 = 0.0f;
            }
            float sumValue96 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
            branchMergedValue5 = sumValue96 * intermediateValue29;
            branchMergedValue10 = sumValue96 * intermediateValue39;
            branchMergedValue11 = sumValue96 * intermediateValue37;
            branchMergedValue12 = sumValue96 * intermediateValue35;
            branchMergedValue13 = sumValue96 * intermediateValue33;
            branchMergedValue14 = sumValue96 * intermediateValue31;
        }
        else
        {
            branchMergedValue5 = 0.0f;
            branchMergedValue10 = 0.0f;
            branchMergedValue11 = 0.0f;
            branchMergedValue12 = 0.0f;
            branchMergedValue13 = 0.0f;
            branchMergedValue14 = 0.0f;
        }
        intermediateValue15 = branchMergedValue5;
        intermediateValue16 = branchMergedValue14;
        intermediateValue17 = branchMergedValue13;
        intermediateValue18 = branchMergedValue12;
        intermediateValue19 = branchMergedValue11;
        intermediateValue20 = branchMergedValue10;
    }
    else
    {
        intermediateValue15 = 0.0f;
        intermediateValue16 = 0.0f;
        intermediateValue17 = 0.0f;
        intermediateValue18 = 0.0f;
        intermediateValue19 = 0.0f;
        intermediateValue20 = 0.0f;
    }
    float bitwiseValue4 = (float(scalarValue15 & 255u) * 9.2272217443678528070449829101562e-05f) * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w;
    float productValue106 = bitwiseValue3 * bitwiseValue3;
    float productValue107 = productValue106 * productValue106;
    float productValue108 = (((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue106 - productValue107)) + productValue107) * bitwiseValue3) * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
    float productValue109 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * sumValue6;
    float productValue110 = scalarValue5 * 65535.0f;
    float scalarValue33 = floor(productValue110);
    fragmentColor0.x = (scalarValue3 * 0.5f) + 0.5f;
    fragmentColor0.y = (scalarValue4 * 0.5f) + 0.5f;
    fragmentColor0.z = scalarValue33 * 1.525902189314365386962890625e-05f;
    fragmentColor0.w = productValue110 - scalarValue33;
    fragmentColor1.x = (productValue109 * max((bitwiseValue4 * float((scalarValue14 >> 8u) & 255u)) + (productValue108 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w)) + intermediateValue18;
    fragmentColor1.y = (productValue109 * max((bitwiseValue4 * float(scalarValue14 & 255u)) + (productValue108 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w)) + intermediateValue19;
    fragmentColor1.z = (productValue109 * max((bitwiseValue4 * float((scalarValue15 >> 8u) & 255u)) + (productValue108 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w)) + intermediateValue20;
    fragmentColor1.w = 1.0f;
    fragmentColor2.x = intermediateValue15;
    fragmentColor2.y = intermediateValue16;
    fragmentColor2.z = intermediateValue17;
    fragmentColor2.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.x * varyingTexCoord0.x) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.z;
    float productValue1 = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.y * varyingTexCoord0.y) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.w;
    float4 sampledTextureValue = normalTexture.Sample(normalSampler, float2(productValue, productValue1));
    float scalarValue3 = sampledTextureValue.x;
    float scalarValue4 = sampledTextureValue.y;
    float4 sampledTextureValue3 = sceneDepthTexture.Sample(sceneDepthSampler, float2(productValue, productValue1));
    float scalarValue5 = sampledTextureValue3.x;
    float productValue7 = (scalarValue5 * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue25 = (((productValue * 2.0f) + (-1.0f)) * RD_UNIFORM_INV_PROJ_ROW_0.x) / productValue7;
    float quotientValue26 = ((((1.0f - productValue1) * 2.0f) + (-1.0f)) * RD_UNIFORM_INV_PROJ_ROW_1.y) / productValue7;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue7;
    float sumValue4 = 1.0f - abs(scalarValue3);
    float scalarValue9 = abs(scalarValue4);
    float sumValue5 = sumValue4 - scalarValue9;
    bool conditionValue = sumValue5 < 0.0f;
    float comparisonValue = conditionValue ? ((1.0f - scalarValue9) * ((scalarValue3 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue3;
    float comparisonValue1 = conditionValue ? (sumValue4 * ((scalarValue4 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue4;
    float inverseLengthValue5 = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue5), float3(comparisonValue, comparisonValue1, sumValue5)));
    float productValue37 = comparisonValue * inverseLengthValue5;
    float productValue38 = comparisonValue1 * inverseLengthValue5;
    float productValue39 = inverseLengthValue5 * sumValue5;
    float inverseLengthValue6 = rsqrt(dot(float3(productValue37, productValue38, productValue39), float3(productValue37, productValue38, productValue39)));
    float productValue40 = inverseLengthValue6 * productValue37;
    float productValue41 = productValue38 * inverseLengthValue6;
    float productValue42 = inverseLengthValue6 * productValue39;
    float4 sampledTextureValue4 = colorMetalnessSubsurfaceTexture.Sample(colorMetalnessSubsurfaceSampler, float2(productValue, productValue1));
    uint unusedTextureMipCount195;
    uint2 vectorValue2 = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount195);
    uint4 loadedBufferValue17 = emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue2.x)))))) * productValue)), uint(int(float(int(uint(int(float(int(vectorValue2.y)))))) * productValue1))), 0u));
    uint scalarValue34 = loadedBufferValue17.y;
    uint scalarValue35 = loadedBufferValue17.z;
    uint scalarValue36 = loadedBufferValue17.w;
    float bitwiseValue5 = float(scalarValue36 & 255u) * 0.0039215688593685626983642578125f;
    float bitwiseValue6 = float(scalarValue35 & 255u) * 9.2272217443678528070449829101562e-05f;
    uint bitwiseValue7 = uint(floor(float((scalarValue36 >> 8u) & 255u)));
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f) && ((bitwiseValue7 & 1u) == 0u))
    {
        float multiplyAddValue23 = (((RD_UNIFORM_INV_VIEW_ROW_3.x + (-0.5f)) + (productValue40 * 0.20000000298023223876953125f)) + mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue26, quotientValue25 * RD_UNIFORM_INV_VIEW_ROW_0.x))) - RD_UNIFORM_WORLD_ORIGIN.x;
        float multiplyAddValue24 = (((RD_UNIFORM_INV_VIEW_ROW_3.y + (-0.5f)) + (productValue41 * 0.20000000298023223876953125f)) + mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue26, quotientValue25 * RD_UNIFORM_INV_VIEW_ROW_0.y))) - RD_UNIFORM_WORLD_ORIGIN.y;
        float multiplyAddValue25 = (((RD_UNIFORM_INV_VIEW_ROW_3.z + (-0.5f)) + (productValue42 * 0.20000000298023223876953125f)) + mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue26, quotientValue25 * RD_UNIFORM_INV_VIEW_ROW_0.z))) - RD_UNIFORM_WORLD_ORIGIN.z;
        float productValue111 = floor(multiplyAddValue23 * 0.0625f) * 16.0f;
        float productValue112 = floor(multiplyAddValue24 * 0.0625f) * 16.0f;
        float productValue113 = floor(multiplyAddValue25 * 0.0625f) * 16.0f;
        uint productValue114 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue23))))) * 0.0625f)));
        uint productValue115 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue24))))) * 0.0625f)));
        uint productValue116 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue25))))) * 0.0625f)));
        float sumValue97 = multiplyAddValue23 - productValue111;
        float sumValue98 = multiplyAddValue24 - productValue112;
        float sumValue99 = multiplyAddValue25 - productValue113;
        uint bitwiseValue8 = (productValue115 << 16u) | (productValue114 & 65535u);
        uint bitwiseValue9 = productValue116 & 65535u;
        uint productValue117 = productValue114 * 1540483477u;
        uint productValue118 = productValue115 * 1540483477u;
        uint productValue119 = productValue116 * 1540483477u;
        uint bitwiseValue12 = ((((((((productValue117 >> 24u) ^ productValue117) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue118 >> 24u) ^ productValue118) * 1540483477u)) * 1540483477u) ^ (((productValue119 >> 24u) ^ productValue119) * 1540483477u)) * 1540483477u;
        uint bitwiseValue13 = ((bitwiseValue12 >> 13u) ^ bitwiseValue12) * 1540483477u;
        uint bitwiseValue24 = (bitwiseValue13 >> 15u) ^ bitwiseValue13;
        uint bitwiseValue27 = bitwiseValue24 >> 16u;
        uint bitwiseValue28 = bitwiseValue24 & 65535u;
        uint comparisonValue16 = uint(bitwiseValue28 == bitwiseValue27) | (bitwiseValue28 ^ bitwiseValue27);
        uint sumValue100 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) + 4294967295u;
        bool intermediateValue19;
        uint scalarValue37 = comparisonValue16;
        uint scalarValue38 = 0u;
        uint scalarValue39 = 0u;
        uint loadedBufferValue1;
        uint bitwiseValue10;
        for (;;)
        {
            bitwiseValue10 = scalarValue37 & sumValue100;
            uint loadedBufferValue19 = rdLoad_gpuEntryBuffer((bitwiseValue10 * 4u) + 2u).x & 65535u;
            bool loadedBufferValue21 = (rdLoad_gpuEntryBuffer((bitwiseValue10 * 4u) + 1u).x == bitwiseValue9) && ((rdLoad_gpuEntryBuffer(bitwiseValue10 * 4u).x == bitwiseValue8) && (loadedBufferValue19 == comparisonValue16));
            loadedBufferValue1 = loadedBufferValue21 ? rdLoad_gpuEntryBuffer((bitwiseValue10 * 4u) + 3u).x : scalarValue38;
            if ((loadedBufferValue19 == 0u) || loadedBufferValue21)
            {
                intermediateValue19 = loadedBufferValue21;
                break;
            }
            else
            {
                uint sumValue101 = scalarValue39 + 1u;
                if (int(sumValue101) < int(8u))
                {
                    scalarValue37 = bitwiseValue10 + 1u;
                    scalarValue38 = loadedBufferValue1;
                    scalarValue39 = sumValue101;
                    continue;
                }
                else
                {
                    intermediateValue19 = false;
                    break;
                }
            }
        }
        uint bitwiseValue29 = loadedBufferValue1 >> 2u;
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (intermediateValue19)
        {
            float scalarValue40 = abs(productValue40);
            float scalarValue41 = abs(productValue41);
            float scalarValue42 = abs(productValue42);
            float branchMergedValue27;
            float branchMergedValue28;
            float branchMergedValue29;
            if (((bitwiseValue7 & 2u) == 0u) && (((scalarValue40 >= 1.0f) || (scalarValue41 >= 1.0f)) || (scalarValue42 >= 1.0f)))
            {
                float intermediateValue64;
                float intermediateValue65;
                float intermediateValue66;
                float intermediateValue67;
                float intermediateValue69;
                float intermediateValue71;
                float intermediateValue73;
                float intermediateValue75;
                float intermediateValue77;
                float intermediateValue79;
                float intermediateValue80;
                float intermediateValue81;
                float productValue22;
                float productValue23;
                float productValue24;
                float sumValue7;
                float sumValue8;
                float sumValue9;
                float sumValue10;
                float sumValue11;
                float sumValue12;
                float sumValue13;
                float sumValue14;
                float sumValue15;
                float productValue25;
                float productValue26;
                float productValue27;
                float productValue28;
                bool comparisonValue4;
                for (;;)
                {
                    float dotProductValue7 = dot(float3(sumValue97, sumValue98, sumValue99), float3(scalarValue40, scalarValue41, scalarValue42));
                    float dotProductValue8 = dot(float3(sumValue97, sumValue98, sumValue99), float3(scalarValue42, scalarValue40, scalarValue41));
                    float dotProductValue9 = dot(float3(sumValue97, sumValue98, sumValue99), float3(scalarValue41, scalarValue42, scalarValue40));
                    float comparisonValue19 = (((inverseLengthValue6 * inverseLengthValue5) * ((comparisonValue + sumValue5) + comparisonValue1)) > 0.0f) ? ceil(dotProductValue7) : floor(dotProductValue7);
                    float scalarValue43 = floor(dotProductValue8);
                    float scalarValue44 = floor(dotProductValue9);
                    productValue22 = ((comparisonValue19 * scalarValue40) + (scalarValue43 * scalarValue42)) + (scalarValue44 * scalarValue41);
                    productValue23 = ((comparisonValue19 * scalarValue41) + (scalarValue43 * scalarValue40)) + (scalarValue44 * scalarValue42);
                    productValue24 = ((comparisonValue19 * scalarValue42) + (scalarValue43 * scalarValue41)) + (scalarValue44 * scalarValue40);
                    sumValue7 = productValue22 + scalarValue42;
                    sumValue8 = productValue23 + scalarValue40;
                    sumValue9 = productValue24 + scalarValue41;
                    sumValue10 = productValue22 + scalarValue41;
                    sumValue11 = productValue23 + scalarValue42;
                    sumValue12 = productValue24 + scalarValue40;
                    sumValue13 = sumValue7 + scalarValue41;
                    sumValue14 = sumValue11 + scalarValue40;
                    sumValue15 = sumValue9 + scalarValue40;
                    float sumValue102 = dotProductValue8 - scalarValue43;
                    float sumValue103 = dotProductValue9 - scalarValue44;
                    float sumValue104 = 1.0f - sumValue102;
                    float sumValue105 = 1.0f - sumValue103;
                    productValue25 = sumValue105 * sumValue104;
                    productValue26 = sumValue105 * sumValue102;
                    productValue27 = sumValue104 * sumValue103;
                    productValue28 = sumValue103 * sumValue102;
                    comparisonValue4 = ((productValue24 >= 0.0f) && ((productValue22 >= 0.0f) && (productValue23 >= 0.0f))) && ((sumValue15 < 16.0f) && ((sumValue13 < 16.0f) && (sumValue14 < 16.0f)));
                    if (comparisonValue4)
                    {
                        uint4 loadedBufferValue23 = rdLoad_voxelBuffer(((uint(productValue23) + bitwiseValue29) + (uint(productValue24) << 4u)) + (uint(productValue22) << 8u));
                        uint scalarValue45 = loadedBufferValue23.x;
                        float bitwiseValue14;
                        float intermediateValue38;
                        float intermediateValue39;
                        if (scalarValue45 == 0u)
                        {
                            bitwiseValue14 = 0.0f;
                            intermediateValue38 = 0.0f;
                            intermediateValue39 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue30 = float(scalarValue45 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue14 = bitwiseValue30 * float(scalarValue45 & 255u);
                            intermediateValue38 = bitwiseValue30 * float((scalarValue45 >> 8u) & 255u);
                            intermediateValue39 = bitwiseValue30 * float((scalarValue45 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue28 = rdLoad_voxelBuffer(((uint(sumValue8) + bitwiseValue29) + (uint(sumValue9) << 4u)) + (uint(sumValue7) << 8u));
                        uint scalarValue46 = loadedBufferValue28.x;
                        float bitwiseValue18;
                        float intermediateValue44;
                        float intermediateValue45;
                        if (scalarValue46 == 0u)
                        {
                            bitwiseValue18 = 0.0f;
                            intermediateValue44 = 0.0f;
                            intermediateValue45 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue31 = float(scalarValue46 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue18 = bitwiseValue31 * float(scalarValue46 & 255u);
                            intermediateValue44 = bitwiseValue31 * float((scalarValue46 >> 8u) & 255u);
                            intermediateValue45 = bitwiseValue31 * float((scalarValue46 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue30 = rdLoad_voxelBuffer(((uint(sumValue11) + bitwiseValue29) + (uint(sumValue12) << 4u)) + (uint(sumValue10) << 8u));
                        uint scalarValue47 = loadedBufferValue30.x;
                        float bitwiseValue22;
                        float intermediateValue58;
                        float intermediateValue59;
                        if (scalarValue47 == 0u)
                        {
                            bitwiseValue22 = 0.0f;
                            intermediateValue58 = 0.0f;
                            intermediateValue59 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue32 = float(scalarValue47 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue22 = bitwiseValue32 * float(scalarValue47 & 255u);
                            intermediateValue58 = bitwiseValue32 * float((scalarValue47 >> 8u) & 255u);
                            intermediateValue59 = bitwiseValue32 * float((scalarValue47 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue32 = rdLoad_voxelBuffer(((uint(sumValue14) + bitwiseValue29) + (uint(sumValue15) << 4u)) + (uint(sumValue13) << 8u));
                        uint scalarValue48 = loadedBufferValue32.x;
                        float branchMergedValue3;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        float branchMergedValue7;
                        float branchMergedValue8;
                        float branchMergedValue9;
                        float branchMergedValue10;
                        float branchMergedValue11;
                        float branchMergedValue12;
                        float branchMergedValue13;
                        float branchMergedValue23;
                        float branchMergedValue24;
                        if (scalarValue48 == 0u)
                        {
                            branchMergedValue3 = intermediateValue44;
                            branchMergedValue5 = bitwiseValue18;
                            branchMergedValue6 = intermediateValue39;
                            branchMergedValue7 = intermediateValue38;
                            branchMergedValue8 = bitwiseValue14;
                            branchMergedValue9 = intermediateValue58;
                            branchMergedValue10 = bitwiseValue22;
                            branchMergedValue11 = intermediateValue45;
                            branchMergedValue12 = 0.0f;
                            branchMergedValue13 = 0.0f;
                            branchMergedValue23 = 0.0f;
                            branchMergedValue24 = intermediateValue59;
                        }
                        else
                        {
                            float bitwiseValue33 = float(scalarValue48 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            branchMergedValue3 = intermediateValue44;
                            branchMergedValue5 = bitwiseValue18;
                            branchMergedValue6 = intermediateValue39;
                            branchMergedValue7 = intermediateValue38;
                            branchMergedValue8 = bitwiseValue14;
                            branchMergedValue9 = intermediateValue58;
                            branchMergedValue10 = bitwiseValue22;
                            branchMergedValue11 = intermediateValue45;
                            branchMergedValue12 = bitwiseValue33 * float((scalarValue48 >> 16u) & 255u);
                            branchMergedValue13 = bitwiseValue33 * float((scalarValue48 >> 8u) & 255u);
                            branchMergedValue23 = bitwiseValue33 * float(scalarValue48 & 255u);
                            branchMergedValue24 = intermediateValue59;
                        }
                        intermediateValue64 = branchMergedValue8;
                        intermediateValue65 = branchMergedValue7;
                        intermediateValue66 = branchMergedValue6;
                        intermediateValue67 = branchMergedValue5;
                        intermediateValue69 = branchMergedValue3;
                        intermediateValue71 = branchMergedValue11;
                        intermediateValue73 = branchMergedValue10;
                        intermediateValue75 = branchMergedValue9;
                        intermediateValue77 = branchMergedValue24;
                        intermediateValue79 = branchMergedValue23;
                        intermediateValue80 = branchMergedValue13;
                        intermediateValue81 = branchMergedValue12;
                        break;
                    }
                    else
                    {
                        float intermediateValue47;
                        float intermediateValue48;
                        float intermediateValue49;
                        float sumValue29;
                        float sumValue30;
                        float sumValue31;
                        uint comparisonValue8;
                        bool comparisonValue9;
                        for (;;)
                        {
                            sumValue29 = productValue22 + productValue111;
                            sumValue30 = productValue23 + productValue112;
                            sumValue31 = productValue24 + productValue113;
                            uint comparisonValue22 = ((((uint(productValue22 >= 16.0f) << 1u) | uint(productValue22 < 0.0f)) | (uint(productValue23 < 0.0f) << 2u)) | (uint(productValue23 >= 16.0f) << 3u)) | (uint(productValue24 < 0.0f) << 4u);
                            comparisonValue8 = intermediateValue[comparisonValue22 | (uint(productValue24 >= 16.0f) << 5u)];
                            comparisonValue9 = ((((comparisonValue22 | (uint(productValue24 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue22 & 31u))) == 0u;
                            uint loadedBufferValue9;
                            if (comparisonValue9)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue8 & 31u))) == 0u)
                                {
                                    intermediateValue47 = 0.0f;
                                    intermediateValue48 = 0.0f;
                                    intermediateValue49 = 0.0f;
                                    break;
                                }
                                loadedBufferValue9 = ((((uint(sumValue29 - (floor(sumValue29 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue30 - (floor(sumValue30 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue31 - (floor(sumValue31 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue8).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue9 = ((((uint(productValue24) << 4u) & 240u) | (uint(productValue23) & 15u)) | ((uint(productValue22) << 8u) & 3840u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue34 = rdLoad_voxelBuffer(loadedBufferValue9);
                            uint scalarValue49 = loadedBufferValue34.x;
                            if (scalarValue49 == 0u)
                            {
                                intermediateValue47 = 0.0f;
                                intermediateValue48 = 0.0f;
                                intermediateValue49 = 0.0f;
                                break;
                            }
                            float bitwiseValue34 = float(scalarValue49 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue47 = bitwiseValue34 * float(scalarValue49 & 255u);
                            intermediateValue48 = bitwiseValue34 * float((scalarValue49 >> 8u) & 255u);
                            intermediateValue49 = bitwiseValue34 * float((scalarValue49 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue68;
                        float intermediateValue70;
                        float intermediateValue72;
                        float sumValue42;
                        float sumValue43;
                        float sumValue44;
                        uint comparisonValue14;
                        bool comparisonValue15;
                        for (;;)
                        {
                            sumValue42 = sumValue7 + productValue111;
                            sumValue43 = sumValue8 + productValue112;
                            sumValue44 = sumValue9 + productValue113;
                            uint comparisonValue25 = ((((uint(sumValue7 >= 16.0f) << 1u) | uint(sumValue7 < 0.0f)) | (uint(sumValue8 < 0.0f) << 2u)) | (uint(sumValue8 >= 16.0f) << 3u)) | (uint(sumValue9 < 0.0f) << 4u);
                            comparisonValue14 = intermediateValue[comparisonValue25 | (uint(sumValue9 >= 16.0f) << 5u)];
                            comparisonValue15 = ((((comparisonValue25 | (uint(sumValue9 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue25 & 31u))) == 0u;
                            uint loadedBufferValue16;
                            if (comparisonValue15)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue14 & 31u))) == 0u)
                                {
                                    intermediateValue68 = 0.0f;
                                    intermediateValue70 = 0.0f;
                                    intermediateValue72 = 0.0f;
                                    break;
                                }
                                loadedBufferValue16 = ((((uint(sumValue42 - (floor(sumValue42 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue43 - (floor(sumValue43 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue44 - (floor(sumValue44 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue14).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue16 = ((((uint(sumValue9) << 4u) & 240u) | (uint(sumValue8) & 15u)) | ((uint(sumValue7) << 8u) & 3840u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue36 = rdLoad_voxelBuffer(loadedBufferValue16);
                            uint scalarValue50 = loadedBufferValue36.x;
                            if (scalarValue50 == 0u)
                            {
                                intermediateValue68 = 0.0f;
                                intermediateValue70 = 0.0f;
                                intermediateValue72 = 0.0f;
                                break;
                            }
                            float bitwiseValue35 = float(scalarValue50 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue68 = bitwiseValue35 * float(scalarValue50 & 255u);
                            intermediateValue70 = bitwiseValue35 * float((scalarValue50 >> 8u) & 255u);
                            intermediateValue72 = bitwiseValue35 * float((scalarValue50 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue74;
                        float intermediateValue76;
                        float intermediateValue78;
                        float sumValue48;
                        float sumValue49;
                        float sumValue50;
                        uint comparisonValue20;
                        bool comparisonValue21;
                        for (;;)
                        {
                            sumValue48 = sumValue10 + productValue111;
                            sumValue49 = sumValue11 + productValue112;
                            sumValue50 = sumValue12 + productValue113;
                            uint comparisonValue29 = ((((uint(sumValue10 >= 16.0f) << 1u) | uint(sumValue10 < 0.0f)) | (uint(sumValue11 < 0.0f) << 2u)) | (uint(sumValue11 >= 16.0f) << 3u)) | (uint(sumValue12 < 0.0f) << 4u);
                            comparisonValue20 = intermediateValue[comparisonValue29 | (uint(sumValue12 >= 16.0f) << 5u)];
                            comparisonValue21 = ((((comparisonValue29 | (uint(sumValue12 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue29 & 31u))) == 0u;
                            uint loadedBufferValue20;
                            if (comparisonValue21)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue20 & 31u))) == 0u)
                                {
                                    intermediateValue74 = 0.0f;
                                    intermediateValue76 = 0.0f;
                                    intermediateValue78 = 0.0f;
                                    break;
                                }
                                loadedBufferValue20 = ((((uint(sumValue48 - (floor(sumValue48 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue49 - (floor(sumValue49 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue50 - (floor(sumValue50 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue20).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue20 = ((((uint(sumValue12) << 4u) & 240u) | (uint(sumValue11) & 15u)) | ((uint(sumValue10) << 8u) & 3840u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue37 = rdLoad_voxelBuffer(loadedBufferValue20);
                            uint scalarValue51 = loadedBufferValue37.x;
                            if (scalarValue51 == 0u)
                            {
                                intermediateValue74 = 0.0f;
                                intermediateValue76 = 0.0f;
                                intermediateValue78 = 0.0f;
                                break;
                            }
                            float bitwiseValue36 = float(scalarValue51 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue74 = bitwiseValue36 * float(scalarValue51 & 255u);
                            intermediateValue76 = bitwiseValue36 * float((scalarValue51 >> 8u) & 255u);
                            intermediateValue78 = bitwiseValue36 * float((scalarValue51 >> 16u) & 255u);
                            break;
                        }
                        float sumValue106 = sumValue13 + productValue111;
                        float sumValue107 = sumValue14 + productValue112;
                        float sumValue108 = sumValue15 + productValue113;
                        uint comparisonValue30 = ((((uint(sumValue13 >= 16.0f) << 1u) | uint(sumValue13 < 0.0f)) | (uint(sumValue14 < 0.0f) << 2u)) | (uint(sumValue14 >= 16.0f) << 3u)) | (uint(sumValue15 < 0.0f) << 4u);
                        uint comparisonValue31 = comparisonValue30 | (uint(sumValue15 >= 16.0f) << 5u);
                        uint loadedBufferValue24;
                        if ((((comparisonValue31 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue30 & 31u))) == 0u)
                        {
                            if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (intermediateValue[comparisonValue31] & 31u))) == 0u)
                            {
                                intermediateValue64 = intermediateValue47;
                                intermediateValue65 = intermediateValue48;
                                intermediateValue66 = intermediateValue49;
                                intermediateValue67 = intermediateValue68;
                                intermediateValue69 = intermediateValue70;
                                intermediateValue71 = intermediateValue72;
                                intermediateValue73 = intermediateValue74;
                                intermediateValue75 = intermediateValue76;
                                intermediateValue77 = intermediateValue78;
                                intermediateValue79 = 0.0f;
                                intermediateValue80 = 0.0f;
                                intermediateValue81 = 0.0f;
                                break;
                            }
                            loadedBufferValue24 = ((((uint(sumValue106 - (floor(sumValue106 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue107 - (floor(sumValue107 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue108 - (floor(sumValue108 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + intermediateValue[comparisonValue31]).x >> 2u);
                        }
                        else
                        {
                            loadedBufferValue24 = ((((uint(sumValue15) << 4u) & 240u) | (uint(sumValue14) & 15u)) | ((uint(sumValue13) << 8u) & 3840u)) + bitwiseValue29;
                        }
                        uint4 loadedBufferValue38 = rdLoad_voxelBuffer(loadedBufferValue24);
                        uint scalarValue52 = loadedBufferValue38.x;
                        if (scalarValue52 == 0u)
                        {
                            intermediateValue64 = intermediateValue47;
                            intermediateValue65 = intermediateValue48;
                            intermediateValue66 = intermediateValue49;
                            intermediateValue67 = intermediateValue68;
                            intermediateValue69 = intermediateValue70;
                            intermediateValue71 = intermediateValue72;
                            intermediateValue73 = intermediateValue74;
                            intermediateValue75 = intermediateValue76;
                            intermediateValue77 = intermediateValue78;
                            intermediateValue79 = 0.0f;
                            intermediateValue80 = 0.0f;
                            intermediateValue81 = 0.0f;
                            break;
                        }
                        float bitwiseValue37 = float(scalarValue52 >> 24u) * 9.2272217443678528070449829101562e-05f;
                        intermediateValue64 = intermediateValue47;
                        intermediateValue65 = intermediateValue48;
                        intermediateValue66 = intermediateValue49;
                        intermediateValue67 = intermediateValue68;
                        intermediateValue69 = intermediateValue70;
                        intermediateValue71 = intermediateValue72;
                        intermediateValue73 = intermediateValue74;
                        intermediateValue75 = intermediateValue76;
                        intermediateValue77 = intermediateValue78;
                        intermediateValue79 = bitwiseValue37 * float(scalarValue52 & 255u);
                        intermediateValue80 = bitwiseValue37 * float((scalarValue52 >> 8u) & 255u);
                        intermediateValue81 = bitwiseValue37 * float((scalarValue52 >> 16u) & 255u);
                        break;
                    }
                }
                branchMergedValue27 = (((intermediateValue69 * productValue26) + (intermediateValue65 * productValue25)) + (intermediateValue75 * productValue27)) + (intermediateValue80 * productValue28);
                branchMergedValue28 = (((intermediateValue71 * productValue26) + (intermediateValue66 * productValue25)) + (intermediateValue77 * productValue27)) + (intermediateValue81 * productValue28);
                branchMergedValue29 = (((intermediateValue67 * productValue26) + (intermediateValue64 * productValue25)) + (intermediateValue73 * productValue27)) + (intermediateValue79 * productValue28);
            }
            else
            {
                float intermediateValue83;
                float intermediateValue84;
                float intermediateValue85;
                float intermediateValue86;
                float intermediateValue88;
                float intermediateValue90;
                float intermediateValue92;
                float intermediateValue94;
                float intermediateValue96;
                float intermediateValue98;
                float intermediateValue99;
                float intermediateValue100;
                float intermediateValue25;
                float intermediateValue26;
                float intermediateValue27;
                uint intermediateValue28;
                uint intermediateValue29;
                uint intermediateValue30;
                float intermediateValue33;
                float sumValue23;
                float sumValue24;
                float sumValue25;
                float sumValue26;
                float sumValue27;
                float sumValue28;
                bool comparisonValue6;
                uint productValue29;
                uint productValue30;
                uint productValue31;
                uint productValue32;
                uint productValue33;
                uint productValue34;
                for (;;)
                {
                    intermediateValue25 = floor(sumValue97);
                    intermediateValue26 = floor(sumValue98);
                    intermediateValue27 = floor(sumValue99);
                    float sumValue109 = sumValue97 - intermediateValue25;
                    float sumValue110 = sumValue98 - intermediateValue26;
                    float sumValue111 = sumValue99 - intermediateValue27;
                    uint comparisonValue32 = ((uint(sumValue110 >= sumValue111) << 1u) | uint(sumValue109 >= sumValue110)) | (uint(sumValue109 >= sumValue111) << 2u);
                    intermediateValue28 = uint(intermediateValue25);
                    intermediateValue29 = uint(intermediateValue26);
                    intermediateValue30 = uint(intermediateValue27);
                    float scalarValue53 = min(sumValue109, sumValue110);
                    float scalarValue54 = max(sumValue109, sumValue110);
                    intermediateValue33 = min(scalarValue53, sumValue111);
                    float scalarValue55 = max(scalarValue54, sumValue111);
                    float scalarValue56 = max(min(scalarValue54, sumValue111), scalarValue53);
                    sumValue23 = 1.0f - scalarValue55;
                    sumValue24 = scalarValue55 - scalarValue56;
                    sumValue25 = scalarValue56 - intermediateValue33;
                    sumValue26 = intermediateValue25 + 1.0f;
                    sumValue27 = intermediateValue26 + 1.0f;
                    sumValue28 = intermediateValue27 + 1.0f;
                    comparisonValue6 = (((intermediateValue25 >= 0.0f) && (intermediateValue26 >= 0.0f)) && (intermediateValue27 >= 0.0f)) && (((sumValue26 < 16.0f) && (sumValue27 < 16.0f)) && (sumValue28 < 16.0f));
                    productValue29 = 0u + (comparisonValue32 * 3u);
                    productValue30 = 1u + (comparisonValue32 * 3u);
                    productValue31 = 2u + (comparisonValue32 * 3u);
                    productValue32 = 0u + (comparisonValue32 * 3u);
                    productValue33 = 1u + (comparisonValue32 * 3u);
                    productValue34 = 2u + (comparisonValue32 * 3u);
                    if (comparisonValue6)
                    {
                        uint bitwiseValue38 = intermediateValue30 << 4u;
                        uint sumValue112 = intermediateValue29 + bitwiseValue29;
                        uint bitwiseValue39 = sumValue112 + (intermediateValue28 << 8u);
                        uint4 loadedBufferValue39 = rdLoad_voxelBuffer(bitwiseValue39 + bitwiseValue38);
                        uint scalarValue57 = loadedBufferValue39.x;
                        float bitwiseValue16;
                        float intermediateValue41;
                        float intermediateValue42;
                        if (scalarValue57 == 0u)
                        {
                            bitwiseValue16 = 0.0f;
                            intermediateValue41 = 0.0f;
                            intermediateValue42 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue40 = float(scalarValue57 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue16 = bitwiseValue40 * float(scalarValue57 & 255u);
                            intermediateValue41 = bitwiseValue40 * float((scalarValue57 >> 8u) & 255u);
                            intermediateValue42 = bitwiseValue40 * float((scalarValue57 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue40 = rdLoad_voxelBuffer(((intermediateValue1[productValue30] + sumValue112) + ((intermediateValue1[productValue29] + intermediateValue28) << 8u)) + ((intermediateValue1[productValue31] + intermediateValue30) << 4u));
                        uint scalarValue58 = loadedBufferValue40.x;
                        float bitwiseValue20;
                        float intermediateValue51;
                        float intermediateValue52;
                        if (scalarValue58 == 0u)
                        {
                            bitwiseValue20 = 0.0f;
                            intermediateValue51 = 0.0f;
                            intermediateValue52 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue41 = float(scalarValue58 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue20 = bitwiseValue41 * float(scalarValue58 & 255u);
                            intermediateValue51 = bitwiseValue41 * float((scalarValue58 >> 8u) & 255u);
                            intermediateValue52 = bitwiseValue41 * float((scalarValue58 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue41 = rdLoad_voxelBuffer(((intermediateValue2[productValue33] + sumValue112) + ((intermediateValue2[productValue32] + intermediateValue28) << 8u)) + ((intermediateValue2[productValue34] + intermediateValue30) << 4u));
                        uint scalarValue59 = loadedBufferValue41.x;
                        float bitwiseValue25;
                        float intermediateValue61;
                        float intermediateValue62;
                        if (scalarValue59 == 0u)
                        {
                            bitwiseValue25 = 0.0f;
                            intermediateValue61 = 0.0f;
                            intermediateValue62 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue42 = float(scalarValue59 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue25 = bitwiseValue42 * float(scalarValue59 & 255u);
                            intermediateValue61 = bitwiseValue42 * float((scalarValue59 >> 8u) & 255u);
                            intermediateValue62 = bitwiseValue42 * float((scalarValue59 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue42 = rdLoad_voxelBuffer((bitwiseValue39 + 273u) + bitwiseValue38);
                        uint scalarValue60 = loadedBufferValue42.x;
                        float branchMergedValue4;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        float branchMergedValue18;
                        float branchMergedValue19;
                        float branchMergedValue20;
                        float branchMergedValue21;
                        float branchMergedValue22;
                        float branchMergedValue25;
                        float branchMergedValue26;
                        if (scalarValue60 == 0u)
                        {
                            branchMergedValue4 = intermediateValue41;
                            branchMergedValue14 = intermediateValue42;
                            branchMergedValue15 = bitwiseValue20;
                            branchMergedValue16 = intermediateValue51;
                            branchMergedValue17 = intermediateValue52;
                            branchMergedValue18 = bitwiseValue25;
                            branchMergedValue19 = intermediateValue61;
                            branchMergedValue20 = intermediateValue62;
                            branchMergedValue21 = 0.0f;
                            branchMergedValue22 = 0.0f;
                            branchMergedValue25 = bitwiseValue16;
                            branchMergedValue26 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue43 = float(scalarValue60 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            branchMergedValue4 = intermediateValue41;
                            branchMergedValue14 = intermediateValue42;
                            branchMergedValue15 = bitwiseValue20;
                            branchMergedValue16 = intermediateValue51;
                            branchMergedValue17 = intermediateValue52;
                            branchMergedValue18 = bitwiseValue25;
                            branchMergedValue19 = intermediateValue61;
                            branchMergedValue20 = intermediateValue62;
                            branchMergedValue21 = bitwiseValue43 * float((scalarValue60 >> 8u) & 255u);
                            branchMergedValue22 = bitwiseValue43 * float((scalarValue60 >> 16u) & 255u);
                            branchMergedValue25 = bitwiseValue16;
                            branchMergedValue26 = bitwiseValue43 * float(scalarValue60 & 255u);
                        }
                        intermediateValue83 = branchMergedValue25;
                        intermediateValue84 = branchMergedValue4;
                        intermediateValue85 = branchMergedValue14;
                        intermediateValue86 = branchMergedValue15;
                        intermediateValue88 = branchMergedValue16;
                        intermediateValue90 = branchMergedValue17;
                        intermediateValue92 = branchMergedValue18;
                        intermediateValue94 = branchMergedValue19;
                        intermediateValue96 = branchMergedValue20;
                        intermediateValue98 = branchMergedValue26;
                        intermediateValue99 = branchMergedValue21;
                        intermediateValue100 = branchMergedValue22;
                        break;
                    }
                    else
                    {
                        float intermediateValue54;
                        float intermediateValue55;
                        float intermediateValue56;
                        float sumValue33;
                        float sumValue34;
                        float sumValue35;
                        float sumValue36;
                        float sumValue37;
                        float sumValue38;
                        float sumValue39;
                        float sumValue40;
                        float sumValue41;
                        uint comparisonValue11;
                        bool comparisonValue12;
                        for (;;)
                        {
                            sumValue33 = float(intermediateValue1[productValue29]) + intermediateValue25;
                            sumValue34 = float(intermediateValue1[productValue30]) + intermediateValue26;
                            sumValue35 = float(intermediateValue1[productValue31]) + intermediateValue27;
                            sumValue36 = float(intermediateValue2[productValue32]) + intermediateValue25;
                            sumValue37 = float(intermediateValue2[productValue33]) + intermediateValue26;
                            sumValue38 = float(intermediateValue2[productValue34]) + intermediateValue27;
                            sumValue39 = intermediateValue25 + productValue111;
                            sumValue40 = intermediateValue26 + productValue112;
                            sumValue41 = intermediateValue27 + productValue113;
                            uint comparisonValue33 = ((((uint(intermediateValue25 >= 16.0f) << 1u) | uint(intermediateValue25 < 0.0f)) | (uint(intermediateValue26 < 0.0f) << 2u)) | (uint(intermediateValue26 >= 16.0f) << 3u)) | (uint(intermediateValue27 < 0.0f) << 4u);
                            comparisonValue11 = intermediateValue[comparisonValue33 | (uint(intermediateValue27 >= 16.0f) << 5u)];
                            comparisonValue12 = ((((comparisonValue33 | (uint(intermediateValue27 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue33 & 31u))) == 0u;
                            uint loadedBufferValue12;
                            if (comparisonValue12)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue11 & 31u))) == 0u)
                                {
                                    intermediateValue54 = 0.0f;
                                    intermediateValue55 = 0.0f;
                                    intermediateValue56 = 0.0f;
                                    break;
                                }
                                loadedBufferValue12 = ((((uint(sumValue39 - (floor(sumValue39 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue40 - (floor(sumValue40 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue41 - (floor(sumValue41 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue11).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue12 = ((((intermediateValue28 << 8u) & 3840u) | (intermediateValue29 & 15u)) | ((intermediateValue30 << 4u) & 240u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue43 = rdLoad_voxelBuffer(loadedBufferValue12);
                            uint scalarValue61 = loadedBufferValue43.x;
                            if (scalarValue61 == 0u)
                            {
                                intermediateValue54 = 0.0f;
                                intermediateValue55 = 0.0f;
                                intermediateValue56 = 0.0f;
                                break;
                            }
                            float bitwiseValue44 = float(scalarValue61 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue54 = bitwiseValue44 * float(scalarValue61 & 255u);
                            intermediateValue55 = bitwiseValue44 * float((scalarValue61 >> 8u) & 255u);
                            intermediateValue56 = bitwiseValue44 * float((scalarValue61 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue87;
                        float intermediateValue89;
                        float intermediateValue91;
                        float sumValue45;
                        float sumValue46;
                        float sumValue47;
                        uint comparisonValue17;
                        bool comparisonValue18;
                        for (;;)
                        {
                            sumValue45 = sumValue33 + productValue111;
                            sumValue46 = sumValue34 + productValue112;
                            sumValue47 = sumValue35 + productValue113;
                            uint comparisonValue34 = ((((uint(sumValue33 >= 16.0f) << 1u) | uint(sumValue33 < 0.0f)) | (uint(sumValue34 < 0.0f) << 2u)) | (uint(sumValue34 >= 16.0f) << 3u)) | (uint(sumValue35 < 0.0f) << 4u);
                            comparisonValue17 = intermediateValue[comparisonValue34 | (uint(sumValue35 >= 16.0f) << 5u)];
                            comparisonValue18 = ((((comparisonValue34 | (uint(sumValue35 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue34 & 31u))) == 0u;
                            uint loadedBufferValue18;
                            if (comparisonValue18)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue17 & 31u))) == 0u)
                                {
                                    intermediateValue87 = 0.0f;
                                    intermediateValue89 = 0.0f;
                                    intermediateValue91 = 0.0f;
                                    break;
                                }
                                loadedBufferValue18 = ((((uint(sumValue45 - (floor(sumValue45 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue46 - (floor(sumValue46 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue47 - (floor(sumValue47 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue17).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue18 = ((((uint(sumValue33) << 8u) & 3840u) | (uint(sumValue34) & 15u)) | ((uint(sumValue35) << 4u) & 240u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue44 = rdLoad_voxelBuffer(loadedBufferValue18);
                            uint scalarValue62 = loadedBufferValue44.x;
                            if (scalarValue62 == 0u)
                            {
                                intermediateValue87 = 0.0f;
                                intermediateValue89 = 0.0f;
                                intermediateValue91 = 0.0f;
                                break;
                            }
                            float bitwiseValue45 = float(scalarValue62 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue87 = bitwiseValue45 * float(scalarValue62 & 255u);
                            intermediateValue89 = bitwiseValue45 * float((scalarValue62 >> 8u) & 255u);
                            intermediateValue91 = bitwiseValue45 * float((scalarValue62 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue93;
                        float intermediateValue95;
                        float intermediateValue97;
                        float sumValue51;
                        float sumValue52;
                        float sumValue53;
                        uint comparisonValue23;
                        bool comparisonValue24;
                        for (;;)
                        {
                            sumValue51 = sumValue36 + productValue111;
                            sumValue52 = sumValue37 + productValue112;
                            sumValue53 = sumValue38 + productValue113;
                            uint comparisonValue35 = ((((uint(sumValue36 >= 16.0f) << 1u) | uint(sumValue36 < 0.0f)) | (uint(sumValue37 < 0.0f) << 2u)) | (uint(sumValue37 >= 16.0f) << 3u)) | (uint(sumValue38 < 0.0f) << 4u);
                            comparisonValue23 = intermediateValue[comparisonValue35 | (uint(sumValue38 >= 16.0f) << 5u)];
                            comparisonValue24 = ((((comparisonValue35 | (uint(sumValue38 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue35 & 31u))) == 0u;
                            uint loadedBufferValue22;
                            if (comparisonValue24)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue23 & 31u))) == 0u)
                                {
                                    intermediateValue93 = 0.0f;
                                    intermediateValue95 = 0.0f;
                                    intermediateValue97 = 0.0f;
                                    break;
                                }
                                loadedBufferValue22 = ((((uint(sumValue51 - (floor(sumValue51 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue52 - (floor(sumValue52 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue53 - (floor(sumValue53 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue23).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue22 = ((((uint(sumValue36) << 8u) & 3840u) | (uint(sumValue37) & 15u)) | ((uint(sumValue38) << 4u) & 240u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue45 = rdLoad_voxelBuffer(loadedBufferValue22);
                            uint scalarValue63 = loadedBufferValue45.x;
                            if (scalarValue63 == 0u)
                            {
                                intermediateValue93 = 0.0f;
                                intermediateValue95 = 0.0f;
                                intermediateValue97 = 0.0f;
                                break;
                            }
                            float bitwiseValue46 = float(scalarValue63 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue93 = bitwiseValue46 * float(scalarValue63 & 255u);
                            intermediateValue95 = bitwiseValue46 * float((scalarValue63 >> 8u) & 255u);
                            intermediateValue97 = bitwiseValue46 * float((scalarValue63 >> 16u) & 255u);
                            break;
                        }
                        float sumValue113 = sumValue26 + productValue111;
                        float sumValue114 = sumValue27 + productValue112;
                        float sumValue115 = sumValue28 + productValue113;
                        uint comparisonValue36 = ((((uint(sumValue26 >= 16.0f) << 1u) | uint(sumValue26 < 0.0f)) | (uint(sumValue27 < 0.0f) << 2u)) | (uint(sumValue27 >= 16.0f) << 3u)) | (uint(sumValue28 < 0.0f) << 4u);
                        uint comparisonValue37 = comparisonValue36 | (uint(sumValue28 >= 16.0f) << 5u);
                        uint loadedBufferValue26;
                        if ((((comparisonValue37 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue36 & 31u))) == 0u)
                        {
                            if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (intermediateValue[comparisonValue37] & 31u))) == 0u)
                            {
                                intermediateValue83 = intermediateValue54;
                                intermediateValue84 = intermediateValue55;
                                intermediateValue85 = intermediateValue56;
                                intermediateValue86 = intermediateValue87;
                                intermediateValue88 = intermediateValue89;
                                intermediateValue90 = intermediateValue91;
                                intermediateValue92 = intermediateValue93;
                                intermediateValue94 = intermediateValue95;
                                intermediateValue96 = intermediateValue97;
                                intermediateValue98 = 0.0f;
                                intermediateValue99 = 0.0f;
                                intermediateValue100 = 0.0f;
                                break;
                            }
                            loadedBufferValue26 = ((((uint(sumValue113 - (floor(sumValue113 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue114 - (floor(sumValue114 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue115 - (floor(sumValue115 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + intermediateValue[comparisonValue37]).x >> 2u);
                        }
                        else
                        {
                            loadedBufferValue26 = ((((uint(sumValue26) << 8u) & 3840u) | (uint(sumValue27) & 15u)) | ((uint(sumValue28) << 4u) & 240u)) + bitwiseValue29;
                        }
                        uint4 loadedBufferValue46 = rdLoad_voxelBuffer(loadedBufferValue26);
                        uint scalarValue64 = loadedBufferValue46.x;
                        if (scalarValue64 == 0u)
                        {
                            intermediateValue83 = intermediateValue54;
                            intermediateValue84 = intermediateValue55;
                            intermediateValue85 = intermediateValue56;
                            intermediateValue86 = intermediateValue87;
                            intermediateValue88 = intermediateValue89;
                            intermediateValue90 = intermediateValue91;
                            intermediateValue92 = intermediateValue93;
                            intermediateValue94 = intermediateValue95;
                            intermediateValue96 = intermediateValue97;
                            intermediateValue98 = 0.0f;
                            intermediateValue99 = 0.0f;
                            intermediateValue100 = 0.0f;
                            break;
                        }
                        float bitwiseValue47 = float(scalarValue64 >> 24u) * 9.2272217443678528070449829101562e-05f;
                        intermediateValue83 = intermediateValue54;
                        intermediateValue84 = intermediateValue55;
                        intermediateValue85 = intermediateValue56;
                        intermediateValue86 = intermediateValue87;
                        intermediateValue88 = intermediateValue89;
                        intermediateValue90 = intermediateValue91;
                        intermediateValue92 = intermediateValue93;
                        intermediateValue94 = intermediateValue95;
                        intermediateValue96 = intermediateValue97;
                        intermediateValue98 = bitwiseValue47 * float(scalarValue64 & 255u);
                        intermediateValue99 = bitwiseValue47 * float((scalarValue64 >> 8u) & 255u);
                        intermediateValue100 = bitwiseValue47 * float((scalarValue64 >> 16u) & 255u);
                        break;
                    }
                }
                branchMergedValue27 = (((intermediateValue88 * sumValue24) + (intermediateValue84 * sumValue23)) + (intermediateValue94 * sumValue25)) + (intermediateValue99 * intermediateValue33);
                branchMergedValue28 = (((intermediateValue90 * sumValue24) + (intermediateValue85 * sumValue23)) + (intermediateValue96 * sumValue25)) + (intermediateValue100 * intermediateValue33);
                branchMergedValue29 = (((intermediateValue86 * sumValue24) + (intermediateValue83 * sumValue23)) + (intermediateValue92 * sumValue25)) + (intermediateValue98 * intermediateValue33);
            }
            branchMergedValue = branchMergedValue27;
            branchMergedValue1 = branchMergedValue28;
            branchMergedValue2 = branchMergedValue29;
        }
        else
        {
            branchMergedValue = 0.0f;
            branchMergedValue1 = 0.0f;
            branchMergedValue2 = 0.0f;
        }
        intermediateValue12 = branchMergedValue2;
        intermediateValue13 = branchMergedValue;
        intermediateValue14 = branchMergedValue1;
    }
    else
    {
        intermediateValue12 = bitwiseValue6 * float((scalarValue34 >> 8u) & 255u);
        intermediateValue13 = bitwiseValue6 * float(scalarValue34 & 255u);
        intermediateValue14 = bitwiseValue6 * float((scalarValue35 >> 8u) & 255u);
    }
    float productValue120 = bitwiseValue5 * bitwiseValue5;
    float productValue121 = productValue120 * productValue120;
    float productValue122 = (((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue120 - productValue121)) + productValue121) * bitwiseValue5) * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
    float clampedValue7 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * (1.0f - clamp((sampledTextureValue4.w + (-0.501960813999176025390625f)) * 2.007874011993408203125f, 0.0f, 1.0f));
    float productValue110 = scalarValue5 * 65535.0f;
    float scalarValue33 = floor(productValue110);
    fragmentColor0.x = (scalarValue3 * 0.5f) + 0.5f;
    fragmentColor0.y = (scalarValue4 * 0.5f) + 0.5f;
    fragmentColor0.z = scalarValue33 * 1.525902189314365386962890625e-05f;
    fragmentColor0.w = productValue110 - scalarValue33;
    fragmentColor1.x = clampedValue7 * max((productValue122 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue12), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w);
    fragmentColor1.y = clampedValue7 * max((productValue122 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue13), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w);
    fragmentColor1.z = clampedValue7 * max((productValue122 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue14), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w);
    fragmentColor1.w = 1.0f;
    fragmentColor2.x = 0.0f;
    fragmentColor2.y = 0.0f;
    fragmentColor2.z = 0.0f;
    fragmentColor2.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.x * varyingTexCoord0.x) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.z;
    float productValue1 = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.y * varyingTexCoord0.y) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.w;
    float productValue5 = (productValue * 2.0f) + (-1.0f);
    float productValue6 = ((1.0f - productValue1) * 2.0f) + (-1.0f);
    float4 sampledTextureValue = normalTexture.Sample(normalSampler, float2(productValue, productValue1));
    float scalarValue3 = sampledTextureValue.x;
    float scalarValue4 = sampledTextureValue.y;
    float4 sampledTextureValue3 = sceneDepthTexture.Sample(sceneDepthSampler, float2(productValue, productValue1));
    float scalarValue5 = sampledTextureValue3.x;
    float productValue7 = (scalarValue5 * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue = (productValue5 * RD_UNIFORM_INV_PROJ_ROW_0.x) / productValue7;
    float quotientValue1 = (productValue6 * RD_UNIFORM_INV_PROJ_ROW_1.y) / productValue7;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue7;
    float sumValue = (-0.0f) - quotientValue2;
    float multiplyAddValue = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z;
    float quotientValue3 = ((RD_UNIFORM_SUB_PIXEL_OFFSET.x + productValue5) * RD_UNIFORM_INV_PROJ_ROW_0.x) / productValue7;
    float quotientValue4 = ((productValue6 - RD_UNIFORM_SUB_PIXEL_OFFSET.y) * RD_UNIFORM_INV_PROJ_ROW_1.y) / productValue7;
    float multiplyAddValue3 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x) - RD_UNIFORM_WORLD_ORIGIN.x;
    float multiplyAddValue4 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y) - RD_UNIFORM_WORLD_ORIGIN.y;
    float multiplyAddValue5 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z) - RD_UNIFORM_WORLD_ORIGIN.z;
    float scalarValue6 = ddx_coarse(quotientValue3);
    float scalarValue7 = ddx_coarse(quotientValue4);
    float scalarValue8 = ddx_coarse(quotientValue2);
    float inverseLengthValue = rsqrt(dot(float3(scalarValue6, scalarValue7, scalarValue8), float3(scalarValue6, scalarValue7, scalarValue8)));
    float productValue8 = inverseLengthValue * scalarValue6;
    float productValue9 = inverseLengthValue * scalarValue7;
    float productValue10 = inverseLengthValue * scalarValue8;
    float sumValue1 = ddy_coarse((-0.0f) - quotientValue3);
    float sumValue2 = ddy_coarse((-0.0f) - quotientValue4);
    float sumValue3 = ddy_coarse((-0.0f) - quotientValue2);
    float inverseLengthValue1 = rsqrt(dot(float3(sumValue1, sumValue2, sumValue3), float3(sumValue1, sumValue2, sumValue3)));
    float productValue11 = inverseLengthValue1 * sumValue1;
    float productValue12 = inverseLengthValue1 * sumValue2;
    float productValue13 = inverseLengthValue1 * sumValue3;
    float productValue14 = (productValue13 * productValue9) - (productValue12 * productValue10);
    float productValue15 = (productValue11 * productValue10) - (productValue13 * productValue8);
    float productValue16 = (productValue12 * productValue8) - (productValue11 * productValue9);
    float inverseLengthValue2 = rsqrt(dot(float3(productValue14, productValue15, productValue16), float3(productValue14, productValue15, productValue16)));
    float productValue17 = productValue14 * inverseLengthValue2;
    float productValue18 = productValue15 * inverseLengthValue2;
    float productValue19 = productValue16 * inverseLengthValue2;
    float multiplyAddValue6 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue19, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue18, productValue17 * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue7 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue19, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue18, productValue17 * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue8 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue19, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue18, productValue17 * RD_UNIFORM_INV_VIEW_ROW_0.z));
    float inverseLengthValue3 = rsqrt(dot(float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8), float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8)));
    float quotientValue5 = round((inverseLengthValue3 * multiplyAddValue6) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue6 = round((inverseLengthValue3 * multiplyAddValue7) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue7 = round((inverseLengthValue3 * multiplyAddValue8) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float inverseLengthValue4 = rsqrt(dot(float3(quotientValue5, quotientValue6, quotientValue7), float3(quotientValue5, quotientValue6, quotientValue7)));
    float productValue20 = inverseLengthValue4 * quotientValue5;
    float productValue21 = inverseLengthValue4 * quotientValue6;
    float productValue35 = inverseLengthValue4 * quotientValue7;
    float productValue36 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
    float quotientValue8 = productValue36 - (multiplyAddValue3 - (floor(multiplyAddValue3 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue9 = productValue36 - (multiplyAddValue4 - (floor(multiplyAddValue4 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue10 = productValue36 - (multiplyAddValue5 - (floor(multiplyAddValue5 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float dotProductValue = dot(float3(quotientValue8, quotientValue9, quotientValue10), float3(productValue20, productValue21, productValue35));
    float sumValue4 = 1.0f - abs(scalarValue3);
    float scalarValue9 = abs(scalarValue4);
    float sumValue5 = sumValue4 - scalarValue9;
    bool conditionValue = sumValue5 < 0.0f;
    float comparisonValue = conditionValue ? ((1.0f - scalarValue9) * ((scalarValue3 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue3;
    float comparisonValue1 = conditionValue ? (sumValue4 * ((scalarValue4 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue4;
    float inverseLengthValue5 = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue5), float3(comparisonValue, comparisonValue1, sumValue5)));
    float productValue37 = comparisonValue * inverseLengthValue5;
    float productValue38 = comparisonValue1 * inverseLengthValue5;
    float productValue39 = inverseLengthValue5 * sumValue5;
    float inverseLengthValue6 = rsqrt(dot(float3(productValue37, productValue38, productValue39), float3(productValue37, productValue38, productValue39)));
    float productValue40 = inverseLengthValue6 * productValue37;
    float productValue41 = productValue38 * inverseLengthValue6;
    float productValue42 = inverseLengthValue6 * productValue39;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue41, productValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue41, productValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue41, productValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue43 = inverseLengthValue7 * multiplyAddValue9;
    float productValue44 = inverseLengthValue7 * multiplyAddValue10;
    float productValue45 = inverseLengthValue7 * multiplyAddValue11;
    float4 sampledTextureValue4 = colorMetalnessSubsurfaceTexture.Sample(colorMetalnessSubsurfaceSampler, float2(productValue, productValue1));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue13 = sampledTextureValue4.w;
    float clampedValue = clamp((scalarValue13 + (-0.501960813999176025390625f)) * 2.007874011993408203125f, 0.0f, 1.0f);
    uint unusedTextureMipCount420;
    uint2 vectorValue3 = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount420);
    uint4 loadedBufferValue47 = emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue3.x)))))) * productValue)), uint(int(float(int(uint(int(float(int(vectorValue3.y)))))) * productValue1))), 0u));
    uint scalarValue65 = loadedBufferValue47.y;
    uint scalarValue66 = loadedBufferValue47.z;
    uint scalarValue67 = loadedBufferValue47.w;
    float bitwiseValue48 = float((loadedBufferValue47.x >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    float bitwiseValue49 = float(scalarValue67 & 255u) * 0.0039215688593685626983642578125f;
    float bitwiseValue50 = float(scalarValue66 & 255u) * 9.2272217443678528070449829101562e-05f;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
        exponentialValue = exp2(log2(max(scalarValue10, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(scalarValue11, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(scalarValue12, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (scalarValue10 <= 0.040449999272823333740234375f) ? (scalarValue10 * 0.077399380505084991455078125f) : exp2(log2((scalarValue10 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (scalarValue11 <= 0.040449999272823333740234375f) ? (scalarValue11 * 0.077399380505084991455078125f) : exp2(log2((scalarValue11 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (scalarValue12 <= 0.040449999272823333740234375f) ? (scalarValue12 * 0.077399380505084991455078125f) : exp2(log2((scalarValue12 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
    float sumValue6 = 1.0f - clampedValue;
    float productValue46 = sumValue6 * 0.039999999105930328369140625f;
    float productValue47 = (exponentialValue * clampedValue) + productValue46;
    float productValue48 = (exponentialValue1 * clampedValue) + productValue46;
    float productValue49 = (exponentialValue2 * clampedValue) + productValue46;
    float nonlinearValue = sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2)) + 9.9999997473787516355514526367188e-05f;
    float quotientValue11 = quotientValue / nonlinearValue;
    float quotientValue12 = quotientValue1 / nonlinearValue;
    float quotientValue13 = quotientValue2 / nonlinearValue;
    float sumValue16 = (-0.0f) - quotientValue11;
    float sumValue32 = (-0.0f) - quotientValue12;
    float sumValue54 = (-0.0f) - quotientValue13;
    float clampedValue1 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * clamp((0.4980392158031463623046875f - scalarValue13) * 2.007874011993408203125f, 0.0f, 1.0f);
    float intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    float intermediateValue24;
    if (scalarValue5 != 1.0f)
    {
        float branchMergedValue5;
        float branchMergedValue8;
        float branchMergedValue9;
        float branchMergedValue10;
        float branchMergedValue11;
        float branchMergedValue12;
        if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
        {
            bool conditionValue1 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
            float comparisonValue2 = conditionValue1 ? (((quotientValue8 + multiplyAddValue3) - (dotProductValue * productValue20)) + RD_UNIFORM_WORLD_ORIGIN.x) : multiplyAddValue;
            float comparisonValue3 = conditionValue1 ? (((multiplyAddValue4 - (dotProductValue * productValue21)) + quotientValue9) + RD_UNIFORM_WORLD_ORIGIN.y) : multiplyAddValue1;
            float comparisonValue10 = conditionValue1 ? (((multiplyAddValue5 - (dotProductValue * productValue35)) + quotientValue10) + RD_UNIFORM_WORLD_ORIGIN.z) : multiplyAddValue2;
            float productValue50 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue;
            float productValue51 = productValue50 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
            float intermediateValue30;
            if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue)
            {
                intermediateValue30 = 0.0f;
            }
            else
            {
                float branchMergedValue7;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue)
                {
                    branchMergedValue7 = 1.0f;
                }
                else
                {
                    branchMergedValue7 = min(floor(min(max((log2(sumValue) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                }
                intermediateValue30 = branchMergedValue7;
            }
            float quotientValue14 = min(floor(min(max((productValue51 + quotientValue) / (productValue51 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
            float quotientValue15 = min(floor(min(max((productValue50 + quotientValue1) / (productValue50 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
            uint intermediateValue34;
            bool intermediateValue36;
            uint intermediateValue37;
            if ((intermediateValue30 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue15 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue14 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue30 < 0.0f) || ((quotientValue14 < 0.0f) || (quotientValue15 < 0.0f))))))
            {
                intermediateValue34 = intermediateValue35;
                intermediateValue36 = false;
                intermediateValue37 = 0u;
            }
            else
            {
                uint scalarValue16 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                uint productValue123 = uint(int(((quotientValue15 + (intermediateValue30 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue14)) * scalarValue16;
                intermediateValue34 = productValue123;
                intermediateValue36 = true;
                intermediateValue37 = productValue123 + scalarValue16;
            }
            float intermediateValue40;
            float intermediateValue42;
            float intermediateValue44;
            float intermediateValue46;
            float intermediateValue48;
            float intermediateValue50;
            if (intermediateValue36 && (int(intermediateValue34) < int(intermediateValue37)))
            {
                float intermediateValue78;
                float quotientValue16;
                float dotProductValue6;
                float sumValue45;
                float sumValue46;
                float sumValue47;
                float quotientValue18;
                float quotientValue19;
                float quotientValue20;
                float intermediateValue103;
                float intermediateValue104;
                float intermediateValue105;
                float intermediateValue106;
                float intermediateValue108;
                float intermediateValue41;
                float intermediateValue43;
                float intermediateValue45;
                float intermediateValue47;
                float intermediateValue49;
                float intermediateValue51;
                uint scalarValue68 = intermediateValue34;
                float scalarValue17 = 0.0f;
                float scalarValue18 = 0.0f;
                float scalarValue19 = 0.0f;
                float scalarValue20 = 0.0f;
                float scalarValue21 = 0.0f;
                float scalarValue22 = 0.0f;
                uint loadedBufferValue4;
                for (;;)
                {
                    loadedBufferValue4 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue68).x)));
                    if (int(loadedBufferValue4) < int(0u))
                    {
                        intermediateValue41 = scalarValue17;
                        intermediateValue43 = scalarValue18;
                        intermediateValue45 = scalarValue19;
                        intermediateValue47 = scalarValue20;
                        intermediateValue49 = scalarValue21;
                        intermediateValue51 = scalarValue22;
                        break;
                    }
                    else
                    {
                        uint productValue124 = loadedBufferValue4 * 32u;
                        float4 loadedBufferValue48 = asfloat(uint4(rdLoad_zLights(productValue124).x, rdLoad_zLights(productValue124 + 1u).x, rdLoad_zLights(productValue124 + 2u).x, rdLoad_zLights(productValue124 + 3u).x));
                        float scalarValue69 = loadedBufferValue48.x;
                        float scalarValue70 = loadedBufferValue48.y;
                        float scalarValue71 = loadedBufferValue48.z;
                        float multiplyAddValue26 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue71, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, scalarValue70, scalarValue69 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.x - quotientValue);
                        float multiplyAddValue27 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue71, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, scalarValue70, scalarValue69 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.y - quotientValue1);
                        float multiplyAddValue28 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue71, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, scalarValue70, scalarValue69 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.z - quotientValue2);
                        float inverseLengthValue12 = rsqrt(dot(float3(multiplyAddValue26, multiplyAddValue27, multiplyAddValue28), float3(multiplyAddValue26, multiplyAddValue27, multiplyAddValue28)));
                        float productValue125 = inverseLengthValue12 * multiplyAddValue26;
                        float productValue126 = inverseLengthValue12 * multiplyAddValue27;
                        float productValue127 = inverseLengthValue12 * multiplyAddValue28;
                        float dotProductValue10 = dot(float3(productValue43, productValue44, productValue45), float3(productValue125, productValue126, productValue127));
                        intermediateValue78 = max(dotProductValue10, 0.0f);
                        float dotProductValue2 = max(dot(float3(productValue43, productValue44, productValue45), float3(sumValue16, sumValue32, sumValue54)), 0.0f);
                        float sumValue64 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
                        float productValue57 = sumValue64 * sumValue64;
                        quotientValue16 = ((max((dotProductValue10 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue57, 0.0f) - intermediateValue78) * clampedValue1) + intermediateValue78;
                        dotProductValue6 = max((dot(float3((-0.0f) - productValue43, (-0.0f) - productValue44, (-0.0f) - productValue45), float3(productValue125, productValue126, productValue127)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue57, 0.0f) * clampedValue1;
                        float sumValue116 = productValue125 - quotientValue11;
                        float sumValue117 = productValue126 - quotientValue12;
                        float sumValue118 = productValue127 - quotientValue13;
                        float inverseLengthValue13 = rsqrt(dot(float3(sumValue116, sumValue117, sumValue118), float3(sumValue116, sumValue117, sumValue118)));
                        float productValue128 = inverseLengthValue13 * sumValue116;
                        float productValue129 = inverseLengthValue13 * sumValue117;
                        float productValue130 = inverseLengthValue13 * sumValue118;
                        float scalarValue72 = max(bitwiseValue48, 0.0500000007450580596923828125f);
                        float productValue131 = scalarValue72 * scalarValue72;
                        float productValue132 = productValue131 * productValue131;
                        float dotProductValue11 = max(dot(float3(productValue43, productValue44, productValue45), float3(productValue128, productValue129, productValue130)), 0.0f);
                        float productValue133 = ((dotProductValue11 * dotProductValue11) * (productValue132 + (-1.0f))) + 1.0f;
                        float productValue134 = productValue131 * 0.5f;
                        float sumValue119 = 1.0f - productValue134;
                        float sumValue120 = productValue134 + 9.9999997473787516355514526367188e-05f;
                        float clampedValue8 = clamp(1.0f - max(dot(float3(sumValue16, sumValue32, sumValue54), float3(productValue128, productValue129, productValue130)), 0.0f), 0.0f, 1.0f);
                        float productValue135 = clampedValue8 * clampedValue8;
                        float productValue136 = (productValue135 * productValue135) * clampedValue8;
                        float productValue137 = (productValue136 * (1.0f - productValue47)) + productValue47;
                        float productValue138 = (productValue136 * (1.0f - productValue48)) + productValue48;
                        float productValue139 = (productValue136 * (1.0f - productValue49)) + productValue49;
                        sumValue45 = 1.0f - productValue137;
                        sumValue46 = 1.0f - productValue138;
                        sumValue47 = 1.0f - productValue139;
                        float quotientValue27 = ((dotProductValue2 / ((sumValue119 * dotProductValue2) + sumValue120)) * (productValue132 / ((productValue133 * productValue133) * 3.1415927410125732421875f))) * (intermediateValue78 / ((sumValue119 * intermediateValue78) + sumValue120));
                        float productValue140 = ((intermediateValue78 * 4.0f) * dotProductValue2) + 9.9999997473787516355514526367188e-05f;
                        quotientValue18 = (productValue137 * quotientValue27) / productValue140;
                        quotientValue19 = (productValue138 * quotientValue27) / productValue140;
                        quotientValue20 = (productValue139 * quotientValue27) / productValue140;
                        float sumValue121 = scalarValue69 - multiplyAddValue;
                        float sumValue122 = scalarValue70 - multiplyAddValue1;
                        float sumValue123 = scalarValue71 - multiplyAddValue2;
                        float productValue91;
                        if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                        {
                            float sumValue124 = (abs(sumValue122) + abs(sumValue121)) + abs(sumValue123);
                            productValue91 = sumValue124 * sumValue124;
                        }
                        else
                        {
                            productValue91 = dot(float3(sumValue121, sumValue122, sumValue123), float3(sumValue121, sumValue122, sumValue123));
                        }
                        float scalarValue73 = loadedBufferValue48.w;
                        float productValue141 = scalarValue73 * scalarValue73;
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        float branchMergedValue4;
                        if (!(productValue91 >= productValue141))
                        {
                            float intermediateValue107;
                            float intermediateValue109;
                            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                            {
                                uint productValue142 = (loadedBufferValue4 * 32u) + 8u;
                                float4 loadedBufferValue49 = asfloat(uint4(rdLoad_zLights(productValue142).x, rdLoad_zLights(productValue142 + 1u).x, rdLoad_zLights(productValue142 + 2u).x, rdLoad_zLights(productValue142 + 3u).x));
                                uint productValue143 = (loadedBufferValue4 * 32u) + 12u;
                                float4 loadedBufferValue50 = asfloat(uint4(rdLoad_zLights(productValue143).x, rdLoad_zLights(productValue143 + 1u).x, rdLoad_zLights(productValue143 + 2u).x, rdLoad_zLights(productValue143 + 3u).x));
                                uint productValue144 = (loadedBufferValue4 * 32u) + 16u;
                                float4 loadedBufferValue51 = asfloat(uint4(rdLoad_zLights(productValue144).x, rdLoad_zLights(productValue144 + 1u).x, rdLoad_zLights(productValue144 + 2u).x, rdLoad_zLights(productValue144 + 3u).x));
                                uint productValue145 = (loadedBufferValue4 * 32u) + 20u;
                                float4 loadedBufferValue52 = asfloat(uint4(rdLoad_zLights(productValue145).x, rdLoad_zLights(productValue145 + 1u).x, rdLoad_zLights(productValue145 + 2u).x, rdLoad_zLights(productValue145 + 3u).x));
                                uint productValue146 = (loadedBufferValue4 * 32u) + 24u;
                                float4 loadedBufferValue53 = asfloat(uint4(rdLoad_zLights(productValue146).x, rdLoad_zLights(productValue146 + 1u).x, rdLoad_zLights(productValue146 + 2u).x, rdLoad_zLights(productValue146 + 3u).x));
                                uint productValue147 = (loadedBufferValue4 * 32u) + 28u;
                                float4 loadedBufferValue54 = asfloat(uint4(rdLoad_zLights(productValue147).x, rdLoad_zLights(productValue147 + 1u).x, rdLoad_zLights(productValue147 + 2u).x, rdLoad_zLights(productValue147 + 3u).x));
                                float sumValue125 = comparisonValue2 - scalarValue69;
                                float sumValue126 = comparisonValue3 - scalarValue70;
                                float sumValue127 = comparisonValue10 - scalarValue71;
                                float scalarValue74 = abs(sumValue125);
                                float scalarValue75 = abs(sumValue126);
                                float scalarValue76 = abs(sumValue127);
                                uint comparisonValue28;
                                if ((scalarValue74 >= scalarValue75) && (scalarValue74 >= scalarValue76))
                                {
                                    comparisonValue28 = uint(!(sumValue125 >= 0.0f));
                                }
                                else
                                {
                                    uint branchMergedValue15;
                                    if (!(scalarValue75 >= scalarValue76))
                                    {
                                        branchMergedValue15 = (sumValue127 >= 0.0f) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue15 = (sumValue126 >= 0.0f) ? 2u : 3u;
                                    }
                                    comparisonValue28 = branchMergedValue15;
                                }
                                float sumValue128 = (-0.0f) - sumValue125;
                                float intermediateValue159;
                                float intermediateValue160;
                                float intermediateValue161;
                                float intermediateValue162;
                                float sumValue87;
                                float intermediateValue163;
                                float intermediateValue164;
                                if (comparisonValue28 == 1u)
                                {
                                    intermediateValue159 = loadedBufferValue50.x;
                                    intermediateValue160 = loadedBufferValue50.y;
                                    intermediateValue161 = loadedBufferValue50.z;
                                    intermediateValue162 = loadedBufferValue50.w;
                                    sumValue87 = (-0.0f) - sumValue127;
                                    intermediateValue163 = sumValue126;
                                    intermediateValue164 = sumValue125;
                                }
                                else
                                {
                                    float branchMergedValue16;
                                    float branchMergedValue38;
                                    float branchMergedValue39;
                                    float branchMergedValue40;
                                    float branchMergedValue41;
                                    float branchMergedValue42;
                                    float branchMergedValue43;
                                    if (comparisonValue28 == 2u)
                                    {
                                        branchMergedValue16 = (-0.0f) - sumValue126;
                                        branchMergedValue38 = (-0.0f) - sumValue127;
                                        branchMergedValue39 = sumValue128;
                                        branchMergedValue40 = loadedBufferValue51.w;
                                        branchMergedValue41 = loadedBufferValue51.z;
                                        branchMergedValue42 = loadedBufferValue51.y;
                                        branchMergedValue43 = loadedBufferValue51.x;
                                    }
                                    else
                                    {
                                        float branchMergedValue52;
                                        float branchMergedValue54;
                                        float branchMergedValue55;
                                        float branchMergedValue56;
                                        float branchMergedValue57;
                                        float branchMergedValue58;
                                        float branchMergedValue59;
                                        if (comparisonValue28 == 3u)
                                        {
                                            branchMergedValue52 = sumValue126;
                                            branchMergedValue54 = sumValue127;
                                            branchMergedValue55 = sumValue128;
                                            branchMergedValue56 = loadedBufferValue52.w;
                                            branchMergedValue57 = loadedBufferValue52.z;
                                            branchMergedValue58 = loadedBufferValue52.y;
                                            branchMergedValue59 = loadedBufferValue52.x;
                                        }
                                        else
                                        {
                                            float branchMergedValue61;
                                            float branchMergedValue62;
                                            float branchMergedValue63;
                                            float branchMergedValue64;
                                            float branchMergedValue65;
                                            float branchMergedValue66;
                                            float branchMergedValue67;
                                            if (comparisonValue28 == 4u)
                                            {
                                                branchMergedValue61 = (-0.0f) - sumValue127;
                                                branchMergedValue62 = sumValue126;
                                                branchMergedValue63 = sumValue128;
                                                branchMergedValue64 = loadedBufferValue53.w;
                                                branchMergedValue65 = loadedBufferValue53.z;
                                                branchMergedValue66 = loadedBufferValue53.y;
                                                branchMergedValue67 = loadedBufferValue53.x;
                                            }
                                            else
                                            {
                                                bool comparisonValue38 = comparisonValue28 == 5u;
                                                branchMergedValue61 = comparisonValue38 ? sumValue127 : sumValue128;
                                                branchMergedValue62 = sumValue126;
                                                branchMergedValue63 = comparisonValue38 ? sumValue125 : sumValue127;
                                                branchMergedValue64 = comparisonValue38 ? loadedBufferValue54.w : loadedBufferValue49.w;
                                                branchMergedValue65 = comparisonValue38 ? loadedBufferValue54.z : loadedBufferValue49.z;
                                                branchMergedValue66 = comparisonValue38 ? loadedBufferValue54.y : loadedBufferValue49.y;
                                                branchMergedValue67 = comparisonValue38 ? loadedBufferValue54.x : loadedBufferValue49.x;
                                            }
                                            branchMergedValue52 = branchMergedValue61;
                                            branchMergedValue54 = branchMergedValue62;
                                            branchMergedValue55 = branchMergedValue63;
                                            branchMergedValue56 = branchMergedValue64;
                                            branchMergedValue57 = branchMergedValue65;
                                            branchMergedValue58 = branchMergedValue66;
                                            branchMergedValue59 = branchMergedValue67;
                                        }
                                        branchMergedValue16 = branchMergedValue52;
                                        branchMergedValue38 = branchMergedValue54;
                                        branchMergedValue39 = branchMergedValue55;
                                        branchMergedValue40 = branchMergedValue56;
                                        branchMergedValue41 = branchMergedValue57;
                                        branchMergedValue42 = branchMergedValue58;
                                        branchMergedValue43 = branchMergedValue59;
                                    }
                                    intermediateValue159 = branchMergedValue43;
                                    intermediateValue160 = branchMergedValue42;
                                    intermediateValue161 = branchMergedValue41;
                                    intermediateValue162 = branchMergedValue40;
                                    sumValue87 = branchMergedValue39;
                                    intermediateValue163 = branchMergedValue38;
                                    intermediateValue164 = branchMergedValue16;
                                }
                                float branchMergedValue17;
                                float branchMergedValue44;
                                if ((intermediateValue161 == 0.0f) && (intermediateValue162 == 0.0f))
                                {
                                    branchMergedValue17 = 1.0f;
                                    branchMergedValue44 = 0.0f;
                                }
                                else
                                {
                                    float multiplyAddValue29 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue164, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue163, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue87)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                    float inverseLengthValue10 = rsqrt(dot(float3(productValue40, productValue41, productValue42), float3(productValue40, productValue41, productValue42)));
                                    float sumValue129 = (-0.0f) - sumValue126;
                                    float sumValue130 = (-0.0f) - sumValue127;
                                    float inverseLengthValue14 = rsqrt(dot(float3(sumValue128, sumValue129, sumValue130), float3(sumValue128, sumValue129, sumValue130)));
                                    float dotProductValue12 = min(max(dot(float3(inverseLengthValue14 * sumValue128, inverseLengthValue14 * sumValue129, inverseLengthValue14 * sumValue130), float3(inverseLengthValue10 * productValue40, inverseLengthValue10 * productValue41, inverseLengthValue10 * productValue42)), RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x), 1.0f);
                                    float sumValue131 = intermediateValue161 - intermediateValue159;
                                    float productValue148 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue131;
                                    float multiplyAddValue30 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue164, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue163, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue87)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue29;
                                    float multiplyAddValue31 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue164, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue163, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue87)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue29;
                                    float quotientValue21 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                    float quotientValue22 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                    float sumValue132 = intermediateValue162 - intermediateValue160;
                                    float productValue149 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue132;
                                    float4 sampledTextureValue6 = pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(((multiplyAddValue30 * 0.5f) + 0.5f) * productValue148) + 0.5f) / productValue148) * sumValue131) + intermediateValue159, quotientValue21 + intermediateValue159), intermediateValue161 - quotientValue21), min(max((((floor((0.5f - (multiplyAddValue31 * 0.5f)) * productValue149) + 0.5f) / productValue149) * sumValue132) + intermediateValue160, quotientValue22 + intermediateValue160), intermediateValue162 - quotientValue22)), 0.0f);
                                    float scalarValue77 = sampledTextureValue6.x;
                                    float multiplyAddValue32 = float(scalarValue77 >= (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue164, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue163, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue87)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) - ((RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / max(productValue148, 1.0f)) * (((sqrt(1.0f - (dotProductValue12 * dotProductValue12)) / dotProductValue12) * RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y) + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x))) / multiplyAddValue29));
                                    float branchMergedValue53;
                                    float branchMergedValue60;
                                    if (clampedValue1 > 0.0f)
                                    {
                                        float multiplyAddValue33 = mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.w, scalarValue77, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.w, multiplyAddValue31, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.w * multiplyAddValue30)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.w;
                                        float multiplyAddValue34 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.x, scalarValue77, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.x, multiplyAddValue31, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.x * multiplyAddValue30)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.x) / multiplyAddValue33;
                                        float multiplyAddValue35 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.y, scalarValue77, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.y, multiplyAddValue31, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.y * multiplyAddValue30)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.y) / multiplyAddValue33;
                                        float multiplyAddValue36 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.z, scalarValue77, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.z, multiplyAddValue31, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.z * multiplyAddValue30)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.z) / multiplyAddValue33;
                                        float clampedValue9 = clamp((sqrt(((intermediateValue163 * intermediateValue163) + (sumValue87 * sumValue87)) + (intermediateValue164 * intermediateValue164)) - sqrt(((multiplyAddValue35 * multiplyAddValue35) + (multiplyAddValue34 * multiplyAddValue34)) + (multiplyAddValue36 * multiplyAddValue36))) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z, 0.0f, 1.0f);
                                        branchMergedValue53 = 1.0f - ((clampedValue9 * clampedValue9) * (3.0f - (clampedValue9 * 2.0f)));
                                        branchMergedValue60 = multiplyAddValue32;
                                    }
                                    else
                                    {
                                        branchMergedValue53 = 1.0f;
                                        branchMergedValue60 = multiplyAddValue32;
                                    }
                                    branchMergedValue17 = branchMergedValue53;
                                    branchMergedValue44 = branchMergedValue60;
                                }
                                intermediateValue107 = branchMergedValue44;
                                intermediateValue109 = branchMergedValue17;
                            }
                            else
                            {
                                intermediateValue107 = 1.0f;
                                intermediateValue109 = 1.0f;
                            }
                            uint productValue150 = (loadedBufferValue4 * 32u) + 4u;
                            float4 loadedBufferValue55 = asfloat(uint4(rdLoad_zLights(productValue150).x, rdLoad_zLights(productValue150 + 1u).x, rdLoad_zLights(productValue150 + 2u).x, rdLoad_zLights(productValue150 + 3u).x));
                            float quotientValue28 = productValue91 / (productValue141 + 9.9999997473787516355514526367188e-05f);
                            float clampedValue10 = clamp(1.0f - (quotientValue28 * quotientValue28), 0.0f, 1.0f);
                            float quotientValue29 = (clampedValue10 * clampedValue10) * (1.0f / max(productValue91, 0.100000001490116119384765625f));
                            float clampedValue5;
                            if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                            {
                                float clampedValue11 = clamp(((1.0f - quotientValue29) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                clampedValue5 = clamp((((clampedValue11 * clampedValue11) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue11 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue29;
                            }
                            else
                            {
                                clampedValue5 = quotientValue29;
                            }
                            float productValue151 = clampedValue5 * loadedBufferValue55.w;
                            branchMergedValue = productValue151 * loadedBufferValue55.x;
                            branchMergedValue1 = intermediateValue109;
                            branchMergedValue2 = intermediateValue107;
                            branchMergedValue3 = productValue151 * loadedBufferValue55.z;
                            branchMergedValue4 = productValue151 * loadedBufferValue55.y;
                        }
                        else
                        {
                            branchMergedValue = 0.0f;
                            branchMergedValue1 = 1.0f;
                            branchMergedValue2 = 1.0f;
                            branchMergedValue3 = 0.0f;
                            branchMergedValue4 = 0.0f;
                        }
                        intermediateValue103 = branchMergedValue;
                        intermediateValue108 = branchMergedValue1;
                        intermediateValue106 = branchMergedValue2;
                        intermediateValue105 = branchMergedValue3;
                        intermediateValue104 = branchMergedValue4;
                        float productValue152 = intermediateValue106 * quotientValue16;
                        float productValue153 = dotProductValue6 * intermediateValue108;
                        float productValue98 = sumValue6 * 0.3183098733425140380859375f;
                        float productValue154 = (((productValue98 * intermediateValue103) * (productValue153 + (productValue152 * sumValue45))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue20;
                        float productValue155 = (((productValue98 * intermediateValue104) * (productValue153 + (productValue152 * sumValue46))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue21;
                        float productValue156 = (((productValue98 * intermediateValue105) * (productValue153 + (productValue152 * sumValue47))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue22;
                        float productValue157 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (intermediateValue106 * intermediateValue78);
                        float productValue158 = ((productValue157 * quotientValue18) * intermediateValue103) + scalarValue17;
                        float productValue159 = ((productValue157 * quotientValue19) * intermediateValue104) + scalarValue18;
                        float productValue160 = ((productValue157 * quotientValue20) * intermediateValue105) + scalarValue19;
                        uint sumValue133 = scalarValue68 + 1u;
                        if (int(sumValue133) < int(intermediateValue37))
                        {
                            scalarValue68 = sumValue133;
                            scalarValue17 = productValue158;
                            scalarValue18 = productValue159;
                            scalarValue19 = productValue160;
                            scalarValue20 = productValue154;
                            scalarValue21 = productValue155;
                            scalarValue22 = productValue156;
                            continue;
                        }
                        else
                        {
                            intermediateValue41 = productValue158;
                            intermediateValue43 = productValue159;
                            intermediateValue45 = productValue160;
                            intermediateValue47 = productValue154;
                            intermediateValue49 = productValue155;
                            intermediateValue51 = productValue156;
                            break;
                        }
                    }
                }
                intermediateValue40 = intermediateValue41;
                intermediateValue42 = intermediateValue43;
                intermediateValue44 = intermediateValue45;
                intermediateValue46 = intermediateValue47;
                intermediateValue48 = intermediateValue49;
                intermediateValue50 = intermediateValue51;
            }
            else
            {
                intermediateValue40 = 0.0f;
                intermediateValue42 = 0.0f;
                intermediateValue44 = 0.0f;
                intermediateValue46 = 0.0f;
                intermediateValue48 = 0.0f;
                intermediateValue50 = 0.0f;
            }
            float sumValue96 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
            branchMergedValue5 = sumValue96 * intermediateValue50;
            branchMergedValue8 = sumValue96 * intermediateValue48;
            branchMergedValue9 = sumValue96 * intermediateValue46;
            branchMergedValue10 = sumValue96 * intermediateValue44;
            branchMergedValue11 = sumValue96 * intermediateValue42;
            branchMergedValue12 = sumValue96 * intermediateValue40;
        }
        else
        {
            branchMergedValue5 = 0.0f;
            branchMergedValue8 = 0.0f;
            branchMergedValue9 = 0.0f;
            branchMergedValue10 = 0.0f;
            branchMergedValue11 = 0.0f;
            branchMergedValue12 = 0.0f;
        }
        intermediateValue19 = branchMergedValue12;
        intermediateValue20 = branchMergedValue11;
        intermediateValue21 = branchMergedValue10;
        intermediateValue22 = branchMergedValue9;
        intermediateValue23 = branchMergedValue8;
        intermediateValue24 = branchMergedValue5;
    }
    else
    {
        intermediateValue19 = 0.0f;
        intermediateValue20 = 0.0f;
        intermediateValue21 = 0.0f;
        intermediateValue22 = 0.0f;
        intermediateValue23 = 0.0f;
        intermediateValue24 = 0.0f;
    }
    uint bitwiseValue51 = uint(floor(float((scalarValue67 >> 8u) & 255u)));
    float intermediateValue26;
    float intermediateValue27;
    float intermediateValue28;
    if (((bitwiseValue51 & 1u) == 0u) && ((RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f) && (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f)))
    {
        float productValue161 = ((multiplyAddValue + (-0.5f)) - RD_UNIFORM_WORLD_ORIGIN.x) + (productValue40 * 0.20000000298023223876953125f);
        float productValue162 = ((multiplyAddValue1 + (-0.5f)) - RD_UNIFORM_WORLD_ORIGIN.y) + (productValue41 * 0.20000000298023223876953125f);
        float productValue163 = ((multiplyAddValue2 + (-0.5f)) - RD_UNIFORM_WORLD_ORIGIN.z) + (productValue42 * 0.20000000298023223876953125f);
        float productValue164 = floor(productValue161 * 0.0625f) * 16.0f;
        float productValue165 = floor(productValue162 * 0.0625f) * 16.0f;
        float productValue166 = floor(productValue163 * 0.0625f) * 16.0f;
        uint productValue167 = uint(int(floor(float(int(uint(int(floor(productValue161))))) * 0.0625f)));
        uint productValue168 = uint(int(floor(float(int(uint(int(floor(productValue162))))) * 0.0625f)));
        uint productValue169 = uint(int(floor(float(int(uint(int(floor(productValue163))))) * 0.0625f)));
        float sumValue134 = productValue161 - productValue164;
        float sumValue135 = productValue162 - productValue165;
        float sumValue136 = productValue163 - productValue166;
        uint bitwiseValue52 = (productValue168 << 16u) | (productValue167 & 65535u);
        uint bitwiseValue53 = (productValue169 & 65535u) | 131072u;
        uint productValue170 = productValue167 * 1540483477u;
        uint productValue171 = productValue168 * 1540483477u;
        uint productValue172 = productValue169 * 1540483477u;
        uint bitwiseValue54 = (((((((((productValue170 >> 24u) ^ productValue170) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue171 >> 24u) ^ productValue171) * 1540483477u)) * 1540483477u) ^ (((productValue172 >> 24u) ^ productValue172) * 1540483477u)) * 1540483477u) ^ 2418085729u;
        uint bitwiseValue55 = ((bitwiseValue54 >> 13u) ^ bitwiseValue54) * 1540483477u;
        uint bitwiseValue56 = (bitwiseValue55 >> 15u) ^ bitwiseValue55;
        uint bitwiseValue57 = bitwiseValue56 >> 16u;
        uint bitwiseValue58 = bitwiseValue56 & 65535u;
        uint comparisonValue39 = uint(bitwiseValue58 == bitwiseValue57) | (bitwiseValue58 ^ bitwiseValue57);
        uint sumValue100 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) + 4294967295u;
        bool intermediateValue39;
        uint scalarValue78 = comparisonValue39;
        uint scalarValue38 = 0u;
        uint scalarValue39 = 0u;
        uint loadedBufferValue1;
        uint bitwiseValue11;
        for (;;)
        {
            bitwiseValue11 = scalarValue78 & sumValue100;
            uint loadedBufferValue56 = rdLoad_gpuEntryBuffer((bitwiseValue11 * 4u) + 2u).x & 65535u;
            bool loadedBufferValue57 = (rdLoad_gpuEntryBuffer((bitwiseValue11 * 4u) + 1u).x == bitwiseValue53) && ((rdLoad_gpuEntryBuffer(bitwiseValue11 * 4u).x == bitwiseValue52) && (loadedBufferValue56 == comparisonValue39));
            loadedBufferValue1 = loadedBufferValue57 ? rdLoad_gpuEntryBuffer((bitwiseValue11 * 4u) + 3u).x : scalarValue38;
            if ((loadedBufferValue56 == 0u) || loadedBufferValue57)
            {
                intermediateValue39 = loadedBufferValue57;
                break;
            }
            else
            {
                uint sumValue101 = scalarValue39 + 1u;
                if (int(sumValue101) < int(8u))
                {
                    scalarValue78 = bitwiseValue11 + 1u;
                    scalarValue38 = loadedBufferValue1;
                    scalarValue39 = sumValue101;
                    continue;
                }
                else
                {
                    intermediateValue39 = false;
                    break;
                }
            }
        }
        uint bitwiseValue29 = loadedBufferValue1 >> 2u;
        float branchMergedValue6;
        float branchMergedValue18;
        float branchMergedValue19;
        if (intermediateValue39)
        {
            float scalarValue40 = abs(productValue40);
            float scalarValue41 = abs(productValue41);
            float scalarValue42 = abs(productValue42);
            float branchMergedValue49;
            float branchMergedValue50;
            float branchMergedValue51;
            if (((bitwiseValue51 & 2u) == 0u) && (((scalarValue40 >= 1.0f) || (scalarValue41 >= 1.0f)) || (scalarValue42 >= 1.0f)))
            {
                float intermediateValue119;
                float intermediateValue120;
                float intermediateValue121;
                float intermediateValue122;
                float intermediateValue124;
                float intermediateValue126;
                float intermediateValue128;
                float intermediateValue130;
                float intermediateValue132;
                float intermediateValue134;
                float intermediateValue135;
                float intermediateValue136;
                float productValue60;
                float productValue61;
                float productValue62;
                float sumValue17;
                float sumValue18;
                float sumValue19;
                float sumValue20;
                float sumValue21;
                float sumValue22;
                float sumValue23;
                float sumValue24;
                float sumValue25;
                float productValue63;
                float productValue64;
                float productValue65;
                float productValue66;
                bool comparisonValue7;
                for (;;)
                {
                    float dotProductValue13 = dot(float3(sumValue134, sumValue135, sumValue136), float3(scalarValue40, scalarValue41, scalarValue42));
                    float dotProductValue14 = dot(float3(sumValue134, sumValue135, sumValue136), float3(scalarValue42, scalarValue40, scalarValue41));
                    float dotProductValue15 = dot(float3(sumValue134, sumValue135, sumValue136), float3(scalarValue41, scalarValue42, scalarValue40));
                    float comparisonValue40 = (((inverseLengthValue6 * inverseLengthValue5) * ((comparisonValue + sumValue5) + comparisonValue1)) > 0.0f) ? ceil(dotProductValue13) : floor(dotProductValue13);
                    float scalarValue79 = floor(dotProductValue14);
                    float scalarValue80 = floor(dotProductValue15);
                    productValue60 = ((comparisonValue40 * scalarValue40) + (scalarValue79 * scalarValue42)) + (scalarValue80 * scalarValue41);
                    productValue61 = ((comparisonValue40 * scalarValue41) + (scalarValue79 * scalarValue40)) + (scalarValue80 * scalarValue42);
                    productValue62 = ((comparisonValue40 * scalarValue42) + (scalarValue79 * scalarValue41)) + (scalarValue80 * scalarValue40);
                    sumValue17 = productValue60 + scalarValue42;
                    sumValue18 = productValue61 + scalarValue40;
                    sumValue19 = productValue62 + scalarValue41;
                    sumValue20 = productValue60 + scalarValue41;
                    sumValue21 = productValue61 + scalarValue42;
                    sumValue22 = productValue62 + scalarValue40;
                    sumValue23 = sumValue17 + scalarValue41;
                    sumValue24 = sumValue21 + scalarValue40;
                    sumValue25 = sumValue19 + scalarValue40;
                    float sumValue137 = dotProductValue14 - scalarValue79;
                    float sumValue138 = dotProductValue15 - scalarValue80;
                    float sumValue139 = 1.0f - sumValue137;
                    float sumValue140 = 1.0f - sumValue138;
                    productValue63 = sumValue140 * sumValue139;
                    productValue64 = sumValue140 * sumValue137;
                    productValue65 = sumValue139 * sumValue138;
                    productValue66 = sumValue138 * sumValue137;
                    comparisonValue7 = ((productValue62 >= 0.0f) && ((productValue60 >= 0.0f) && (productValue61 >= 0.0f))) && ((sumValue25 < 16.0f) && ((sumValue23 < 16.0f) && (sumValue24 < 16.0f)));
                    if (comparisonValue7)
                    {
                        uint4 loadedBufferValue58 = rdLoad_voxelBuffer(((uint(productValue61) + bitwiseValue29) + (uint(productValue62) << 4u)) + (uint(productValue60) << 8u));
                        uint scalarValue81 = loadedBufferValue58.x;
                        float bitwiseValue15;
                        float intermediateValue82;
                        float intermediateValue83;
                        if (scalarValue81 == 0u)
                        {
                            bitwiseValue15 = 0.0f;
                            intermediateValue82 = 0.0f;
                            intermediateValue83 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue59 = float(scalarValue81 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue15 = bitwiseValue59 * float(scalarValue81 & 255u);
                            intermediateValue82 = bitwiseValue59 * float((scalarValue81 >> 8u) & 255u);
                            intermediateValue83 = bitwiseValue59 * float((scalarValue81 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue59 = rdLoad_voxelBuffer(((uint(sumValue18) + bitwiseValue29) + (uint(sumValue19) << 4u)) + (uint(sumValue17) << 8u));
                        uint scalarValue82 = loadedBufferValue59.x;
                        float bitwiseValue19;
                        float intermediateValue89;
                        float intermediateValue90;
                        if (scalarValue82 == 0u)
                        {
                            bitwiseValue19 = 0.0f;
                            intermediateValue89 = 0.0f;
                            intermediateValue90 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue60 = float(scalarValue82 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue19 = bitwiseValue60 * float(scalarValue82 & 255u);
                            intermediateValue89 = bitwiseValue60 * float((scalarValue82 >> 8u) & 255u);
                            intermediateValue90 = bitwiseValue60 * float((scalarValue82 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue60 = rdLoad_voxelBuffer(((uint(sumValue21) + bitwiseValue29) + (uint(sumValue22) << 4u)) + (uint(sumValue20) << 8u));
                        uint scalarValue83 = loadedBufferValue60.x;
                        float bitwiseValue23;
                        float intermediateValue110;
                        float intermediateValue111;
                        if (scalarValue83 == 0u)
                        {
                            bitwiseValue23 = 0.0f;
                            intermediateValue110 = 0.0f;
                            intermediateValue111 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue61 = float(scalarValue83 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue23 = bitwiseValue61 * float(scalarValue83 & 255u);
                            intermediateValue110 = bitwiseValue61 * float((scalarValue83 >> 8u) & 255u);
                            intermediateValue111 = bitwiseValue61 * float((scalarValue83 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue61 = rdLoad_voxelBuffer(((uint(sumValue24) + bitwiseValue29) + (uint(sumValue25) << 4u)) + (uint(sumValue23) << 8u));
                        uint scalarValue84 = loadedBufferValue61.x;
                        float branchMergedValue13;
                        float branchMergedValue20;
                        float branchMergedValue21;
                        float branchMergedValue22;
                        float branchMergedValue23;
                        float branchMergedValue24;
                        float branchMergedValue25;
                        float branchMergedValue26;
                        float branchMergedValue27;
                        float branchMergedValue28;
                        float branchMergedValue45;
                        float branchMergedValue46;
                        if (scalarValue84 == 0u)
                        {
                            branchMergedValue13 = 0.0f;
                            branchMergedValue20 = 0.0f;
                            branchMergedValue21 = 0.0f;
                            branchMergedValue22 = intermediateValue111;
                            branchMergedValue23 = intermediateValue110;
                            branchMergedValue24 = bitwiseValue23;
                            branchMergedValue25 = intermediateValue90;
                            branchMergedValue26 = intermediateValue89;
                            branchMergedValue27 = bitwiseValue19;
                            branchMergedValue28 = intermediateValue83;
                            branchMergedValue45 = intermediateValue82;
                            branchMergedValue46 = bitwiseValue15;
                        }
                        else
                        {
                            float bitwiseValue62 = float(scalarValue84 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            branchMergedValue13 = bitwiseValue62 * float((scalarValue84 >> 16u) & 255u);
                            branchMergedValue20 = bitwiseValue62 * float((scalarValue84 >> 8u) & 255u);
                            branchMergedValue21 = bitwiseValue62 * float(scalarValue84 & 255u);
                            branchMergedValue22 = intermediateValue111;
                            branchMergedValue23 = intermediateValue110;
                            branchMergedValue24 = bitwiseValue23;
                            branchMergedValue25 = intermediateValue90;
                            branchMergedValue26 = intermediateValue89;
                            branchMergedValue27 = bitwiseValue19;
                            branchMergedValue28 = intermediateValue83;
                            branchMergedValue45 = intermediateValue82;
                            branchMergedValue46 = bitwiseValue15;
                        }
                        intermediateValue119 = branchMergedValue46;
                        intermediateValue120 = branchMergedValue45;
                        intermediateValue121 = branchMergedValue28;
                        intermediateValue122 = branchMergedValue27;
                        intermediateValue124 = branchMergedValue26;
                        intermediateValue126 = branchMergedValue25;
                        intermediateValue128 = branchMergedValue24;
                        intermediateValue130 = branchMergedValue23;
                        intermediateValue132 = branchMergedValue22;
                        intermediateValue134 = branchMergedValue21;
                        intermediateValue135 = branchMergedValue20;
                        intermediateValue136 = branchMergedValue13;
                        break;
                    }
                    else
                    {
                        float intermediateValue92;
                        float intermediateValue93;
                        float intermediateValue94;
                        float sumValue51;
                        float sumValue52;
                        float sumValue53;
                        uint comparisonValue11;
                        bool comparisonValue12;
                        for (;;)
                        {
                            sumValue51 = productValue60 + productValue164;
                            sumValue52 = productValue61 + productValue165;
                            sumValue53 = productValue62 + productValue166;
                            uint comparisonValue41 = ((((uint(productValue60 >= 16.0f) << 1u) | uint(productValue60 < 0.0f)) | (uint(productValue61 < 0.0f) << 2u)) | (uint(productValue61 >= 16.0f) << 3u)) | (uint(productValue62 < 0.0f) << 4u);
                            comparisonValue11 = intermediateValue[comparisonValue41 | (uint(productValue62 >= 16.0f) << 5u)];
                            comparisonValue12 = ((((comparisonValue41 | (uint(productValue62 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue41 & 31u))) == 0u;
                            uint loadedBufferValue11;
                            if (comparisonValue12)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue11 & 31u))) == 0u)
                                {
                                    intermediateValue92 = 0.0f;
                                    intermediateValue93 = 0.0f;
                                    intermediateValue94 = 0.0f;
                                    break;
                                }
                                loadedBufferValue11 = ((((uint(sumValue51 - (floor(sumValue51 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue52 - (floor(sumValue52 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue53 - (floor(sumValue53 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue11).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue11 = ((((uint(productValue62) << 4u) & 240u) | (uint(productValue61) & 15u)) | ((uint(productValue60) << 8u) & 3840u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue62 = rdLoad_voxelBuffer(loadedBufferValue11);
                            uint scalarValue85 = loadedBufferValue62.x;
                            if (scalarValue85 == 0u)
                            {
                                intermediateValue92 = 0.0f;
                                intermediateValue93 = 0.0f;
                                intermediateValue94 = 0.0f;
                                break;
                            }
                            float bitwiseValue63 = float(scalarValue85 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue92 = bitwiseValue63 * float(scalarValue85 & 255u);
                            intermediateValue93 = bitwiseValue63 * float((scalarValue85 >> 8u) & 255u);
                            intermediateValue94 = bitwiseValue63 * float((scalarValue85 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue123;
                        float intermediateValue125;
                        float intermediateValue127;
                        float sumValue65;
                        float sumValue66;
                        float sumValue67;
                        uint comparisonValue17;
                        bool comparisonValue18;
                        for (;;)
                        {
                            sumValue65 = sumValue17 + productValue164;
                            sumValue66 = sumValue18 + productValue165;
                            sumValue67 = sumValue19 + productValue166;
                            uint comparisonValue42 = ((((uint(sumValue17 >= 16.0f) << 1u) | uint(sumValue17 < 0.0f)) | (uint(sumValue18 < 0.0f) << 2u)) | (uint(sumValue18 >= 16.0f) << 3u)) | (uint(sumValue19 < 0.0f) << 4u);
                            comparisonValue17 = intermediateValue[comparisonValue42 | (uint(sumValue19 >= 16.0f) << 5u)];
                            comparisonValue18 = ((((comparisonValue42 | (uint(sumValue19 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue42 & 31u))) == 0u;
                            uint loadedBufferValue25;
                            if (comparisonValue18)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue17 & 31u))) == 0u)
                                {
                                    intermediateValue123 = 0.0f;
                                    intermediateValue125 = 0.0f;
                                    intermediateValue127 = 0.0f;
                                    break;
                                }
                                loadedBufferValue25 = ((((uint(sumValue65 - (floor(sumValue65 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue66 - (floor(sumValue66 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue67 - (floor(sumValue67 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue17).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue25 = ((((uint(sumValue19) << 4u) & 240u) | (uint(sumValue18) & 15u)) | ((uint(sumValue17) << 8u) & 3840u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue63 = rdLoad_voxelBuffer(loadedBufferValue25);
                            uint scalarValue86 = loadedBufferValue63.x;
                            if (scalarValue86 == 0u)
                            {
                                intermediateValue123 = 0.0f;
                                intermediateValue125 = 0.0f;
                                intermediateValue127 = 0.0f;
                                break;
                            }
                            float bitwiseValue64 = float(scalarValue86 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue123 = bitwiseValue64 * float(scalarValue86 & 255u);
                            intermediateValue125 = bitwiseValue64 * float((scalarValue86 >> 8u) & 255u);
                            intermediateValue127 = bitwiseValue64 * float((scalarValue86 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue129;
                        float intermediateValue131;
                        float intermediateValue133;
                        float sumValue74;
                        float sumValue75;
                        float sumValue76;
                        uint comparisonValue23;
                        bool comparisonValue24;
                        for (;;)
                        {
                            sumValue74 = sumValue20 + productValue164;
                            sumValue75 = sumValue21 + productValue165;
                            sumValue76 = sumValue22 + productValue166;
                            uint comparisonValue43 = ((((uint(sumValue20 >= 16.0f) << 1u) | uint(sumValue20 < 0.0f)) | (uint(sumValue21 < 0.0f) << 2u)) | (uint(sumValue21 >= 16.0f) << 3u)) | (uint(sumValue22 < 0.0f) << 4u);
                            comparisonValue23 = intermediateValue[comparisonValue43 | (uint(sumValue22 >= 16.0f) << 5u)];
                            comparisonValue24 = ((((comparisonValue43 | (uint(sumValue22 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue43 & 31u))) == 0u;
                            uint loadedBufferValue29;
                            if (comparisonValue24)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue23 & 31u))) == 0u)
                                {
                                    intermediateValue129 = 0.0f;
                                    intermediateValue131 = 0.0f;
                                    intermediateValue133 = 0.0f;
                                    break;
                                }
                                loadedBufferValue29 = ((((uint(sumValue74 - (floor(sumValue74 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue75 - (floor(sumValue75 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue76 - (floor(sumValue76 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue23).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue29 = ((((uint(sumValue22) << 4u) & 240u) | (uint(sumValue21) & 15u)) | ((uint(sumValue20) << 8u) & 3840u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue64 = rdLoad_voxelBuffer(loadedBufferValue29);
                            uint scalarValue87 = loadedBufferValue64.x;
                            if (scalarValue87 == 0u)
                            {
                                intermediateValue129 = 0.0f;
                                intermediateValue131 = 0.0f;
                                intermediateValue133 = 0.0f;
                                break;
                            }
                            float bitwiseValue65 = float(scalarValue87 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue129 = bitwiseValue65 * float(scalarValue87 & 255u);
                            intermediateValue131 = bitwiseValue65 * float((scalarValue87 >> 8u) & 255u);
                            intermediateValue133 = bitwiseValue65 * float((scalarValue87 >> 16u) & 255u);
                            break;
                        }
                        float sumValue141 = sumValue23 + productValue164;
                        float sumValue142 = sumValue24 + productValue165;
                        float sumValue143 = sumValue25 + productValue166;
                        uint comparisonValue44 = ((((uint(sumValue23 >= 16.0f) << 1u) | uint(sumValue23 < 0.0f)) | (uint(sumValue24 < 0.0f) << 2u)) | (uint(sumValue24 >= 16.0f) << 3u)) | (uint(sumValue25 < 0.0f) << 4u);
                        uint comparisonValue45 = comparisonValue44 | (uint(sumValue25 >= 16.0f) << 5u);
                        uint loadedBufferValue33;
                        if ((((comparisonValue45 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue44 & 31u))) == 0u)
                        {
                            if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (intermediateValue[comparisonValue45] & 31u))) == 0u)
                            {
                                intermediateValue119 = intermediateValue92;
                                intermediateValue120 = intermediateValue93;
                                intermediateValue121 = intermediateValue94;
                                intermediateValue122 = intermediateValue123;
                                intermediateValue124 = intermediateValue125;
                                intermediateValue126 = intermediateValue127;
                                intermediateValue128 = intermediateValue129;
                                intermediateValue130 = intermediateValue131;
                                intermediateValue132 = intermediateValue133;
                                intermediateValue134 = 0.0f;
                                intermediateValue135 = 0.0f;
                                intermediateValue136 = 0.0f;
                                break;
                            }
                            loadedBufferValue33 = ((((uint(sumValue141 - (floor(sumValue141 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue142 - (floor(sumValue142 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue143 - (floor(sumValue143 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + intermediateValue[comparisonValue45]).x >> 2u);
                        }
                        else
                        {
                            loadedBufferValue33 = ((((uint(sumValue25) << 4u) & 240u) | (uint(sumValue24) & 15u)) | ((uint(sumValue23) << 8u) & 3840u)) + bitwiseValue29;
                        }
                        uint4 loadedBufferValue65 = rdLoad_voxelBuffer(loadedBufferValue33);
                        uint scalarValue88 = loadedBufferValue65.x;
                        if (scalarValue88 == 0u)
                        {
                            intermediateValue119 = intermediateValue92;
                            intermediateValue120 = intermediateValue93;
                            intermediateValue121 = intermediateValue94;
                            intermediateValue122 = intermediateValue123;
                            intermediateValue124 = intermediateValue125;
                            intermediateValue126 = intermediateValue127;
                            intermediateValue128 = intermediateValue129;
                            intermediateValue130 = intermediateValue131;
                            intermediateValue132 = intermediateValue133;
                            intermediateValue134 = 0.0f;
                            intermediateValue135 = 0.0f;
                            intermediateValue136 = 0.0f;
                            break;
                        }
                        float bitwiseValue66 = float(scalarValue88 >> 24u) * 9.2272217443678528070449829101562e-05f;
                        intermediateValue119 = intermediateValue92;
                        intermediateValue120 = intermediateValue93;
                        intermediateValue121 = intermediateValue94;
                        intermediateValue122 = intermediateValue123;
                        intermediateValue124 = intermediateValue125;
                        intermediateValue126 = intermediateValue127;
                        intermediateValue128 = intermediateValue129;
                        intermediateValue130 = intermediateValue131;
                        intermediateValue132 = intermediateValue133;
                        intermediateValue134 = bitwiseValue66 * float(scalarValue88 & 255u);
                        intermediateValue135 = bitwiseValue66 * float((scalarValue88 >> 8u) & 255u);
                        intermediateValue136 = bitwiseValue66 * float((scalarValue88 >> 16u) & 255u);
                        break;
                    }
                }
                branchMergedValue49 = (((intermediateValue122 * productValue64) + (intermediateValue119 * productValue63)) + (intermediateValue128 * productValue65)) + (intermediateValue134 * productValue66);
                branchMergedValue50 = (((intermediateValue126 * productValue64) + (intermediateValue121 * productValue63)) + (intermediateValue132 * productValue65)) + (intermediateValue136 * productValue66);
                branchMergedValue51 = (((intermediateValue124 * productValue64) + (intermediateValue120 * productValue63)) + (intermediateValue130 * productValue65)) + (intermediateValue135 * productValue66);
            }
            else
            {
                float intermediateValue138;
                float intermediateValue139;
                float intermediateValue140;
                float intermediateValue141;
                float intermediateValue143;
                float intermediateValue145;
                float intermediateValue147;
                float intermediateValue149;
                float intermediateValue151;
                float intermediateValue153;
                float intermediateValue154;
                float intermediateValue155;
                float intermediateValue64;
                float intermediateValue65;
                float intermediateValue66;
                uint intermediateValue67;
                uint intermediateValue68;
                uint intermediateValue69;
                float intermediateValue72;
                float sumValue33;
                float sumValue34;
                float sumValue35;
                float sumValue36;
                float sumValue37;
                float sumValue38;
                bool comparisonValue9;
                uint productValue67;
                uint productValue68;
                uint productValue69;
                uint productValue70;
                uint productValue71;
                uint productValue72;
                for (;;)
                {
                    intermediateValue64 = floor(sumValue134);
                    intermediateValue65 = floor(sumValue135);
                    intermediateValue66 = floor(sumValue136);
                    float sumValue144 = sumValue134 - intermediateValue64;
                    float sumValue145 = sumValue135 - intermediateValue65;
                    float sumValue146 = sumValue136 - intermediateValue66;
                    uint comparisonValue46 = ((uint(sumValue145 >= sumValue146) << 1u) | uint(sumValue144 >= sumValue145)) | (uint(sumValue144 >= sumValue146) << 2u);
                    intermediateValue67 = uint(intermediateValue64);
                    intermediateValue68 = uint(intermediateValue65);
                    intermediateValue69 = uint(intermediateValue66);
                    float scalarValue89 = min(sumValue144, sumValue145);
                    float scalarValue90 = max(sumValue144, sumValue145);
                    intermediateValue72 = min(scalarValue89, sumValue146);
                    float scalarValue91 = max(scalarValue90, sumValue146);
                    float scalarValue92 = max(min(scalarValue90, sumValue146), scalarValue89);
                    sumValue33 = 1.0f - scalarValue91;
                    sumValue34 = scalarValue91 - scalarValue92;
                    sumValue35 = scalarValue92 - intermediateValue72;
                    sumValue36 = intermediateValue64 + 1.0f;
                    sumValue37 = intermediateValue65 + 1.0f;
                    sumValue38 = intermediateValue66 + 1.0f;
                    comparisonValue9 = (((intermediateValue64 >= 0.0f) && (intermediateValue65 >= 0.0f)) && (intermediateValue66 >= 0.0f)) && (((sumValue36 < 16.0f) && (sumValue37 < 16.0f)) && (sumValue38 < 16.0f));
                    productValue67 = 0u + (comparisonValue46 * 3u);
                    productValue68 = 1u + (comparisonValue46 * 3u);
                    productValue69 = 2u + (comparisonValue46 * 3u);
                    productValue70 = 0u + (comparisonValue46 * 3u);
                    productValue71 = 1u + (comparisonValue46 * 3u);
                    productValue72 = 2u + (comparisonValue46 * 3u);
                    if (comparisonValue9)
                    {
                        uint bitwiseValue67 = intermediateValue69 << 4u;
                        uint sumValue147 = intermediateValue68 + bitwiseValue29;
                        uint bitwiseValue68 = sumValue147 + (intermediateValue67 << 8u);
                        uint4 loadedBufferValue66 = rdLoad_voxelBuffer(bitwiseValue68 + bitwiseValue67);
                        uint scalarValue93 = loadedBufferValue66.x;
                        float bitwiseValue17;
                        float intermediateValue85;
                        float intermediateValue86;
                        if (scalarValue93 == 0u)
                        {
                            bitwiseValue17 = 0.0f;
                            intermediateValue85 = 0.0f;
                            intermediateValue86 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue69 = float(scalarValue93 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue17 = bitwiseValue69 * float(scalarValue93 & 255u);
                            intermediateValue85 = bitwiseValue69 * float((scalarValue93 >> 8u) & 255u);
                            intermediateValue86 = bitwiseValue69 * float((scalarValue93 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue67 = rdLoad_voxelBuffer(((intermediateValue1[productValue68] + sumValue147) + ((intermediateValue1[productValue67] + intermediateValue67) << 8u)) + ((intermediateValue1[productValue69] + intermediateValue69) << 4u));
                        uint scalarValue94 = loadedBufferValue67.x;
                        float bitwiseValue21;
                        float intermediateValue96;
                        float intermediateValue97;
                        if (scalarValue94 == 0u)
                        {
                            bitwiseValue21 = 0.0f;
                            intermediateValue96 = 0.0f;
                            intermediateValue97 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue70 = float(scalarValue94 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue21 = bitwiseValue70 * float(scalarValue94 & 255u);
                            intermediateValue96 = bitwiseValue70 * float((scalarValue94 >> 8u) & 255u);
                            intermediateValue97 = bitwiseValue70 * float((scalarValue94 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue68 = rdLoad_voxelBuffer(((intermediateValue2[productValue71] + sumValue147) + ((intermediateValue2[productValue70] + intermediateValue67) << 8u)) + ((intermediateValue2[productValue72] + intermediateValue69) << 4u));
                        uint scalarValue95 = loadedBufferValue68.x;
                        float bitwiseValue26;
                        float intermediateValue113;
                        float intermediateValue114;
                        if (scalarValue95 == 0u)
                        {
                            bitwiseValue26 = 0.0f;
                            intermediateValue113 = 0.0f;
                            intermediateValue114 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue71 = float(scalarValue95 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue26 = bitwiseValue71 * float(scalarValue95 & 255u);
                            intermediateValue113 = bitwiseValue71 * float((scalarValue95 >> 8u) & 255u);
                            intermediateValue114 = bitwiseValue71 * float((scalarValue95 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue69 = rdLoad_voxelBuffer((bitwiseValue68 + 273u) + bitwiseValue67);
                        uint scalarValue96 = loadedBufferValue69.x;
                        float branchMergedValue14;
                        float branchMergedValue29;
                        float branchMergedValue30;
                        float branchMergedValue31;
                        float branchMergedValue32;
                        float branchMergedValue33;
                        float branchMergedValue34;
                        float branchMergedValue35;
                        float branchMergedValue36;
                        float branchMergedValue37;
                        float branchMergedValue47;
                        float branchMergedValue48;
                        if (scalarValue96 == 0u)
                        {
                            branchMergedValue14 = 0.0f;
                            branchMergedValue29 = 0.0f;
                            branchMergedValue30 = 0.0f;
                            branchMergedValue31 = intermediateValue114;
                            branchMergedValue32 = intermediateValue113;
                            branchMergedValue33 = bitwiseValue26;
                            branchMergedValue34 = intermediateValue97;
                            branchMergedValue35 = intermediateValue96;
                            branchMergedValue36 = bitwiseValue21;
                            branchMergedValue37 = intermediateValue86;
                            branchMergedValue47 = intermediateValue85;
                            branchMergedValue48 = bitwiseValue17;
                        }
                        else
                        {
                            float bitwiseValue72 = float(scalarValue96 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            branchMergedValue14 = bitwiseValue72 * float((scalarValue96 >> 16u) & 255u);
                            branchMergedValue29 = bitwiseValue72 * float((scalarValue96 >> 8u) & 255u);
                            branchMergedValue30 = bitwiseValue72 * float(scalarValue96 & 255u);
                            branchMergedValue31 = intermediateValue114;
                            branchMergedValue32 = intermediateValue113;
                            branchMergedValue33 = bitwiseValue26;
                            branchMergedValue34 = intermediateValue97;
                            branchMergedValue35 = intermediateValue96;
                            branchMergedValue36 = bitwiseValue21;
                            branchMergedValue37 = intermediateValue86;
                            branchMergedValue47 = intermediateValue85;
                            branchMergedValue48 = bitwiseValue17;
                        }
                        intermediateValue138 = branchMergedValue48;
                        intermediateValue139 = branchMergedValue47;
                        intermediateValue140 = branchMergedValue37;
                        intermediateValue141 = branchMergedValue36;
                        intermediateValue143 = branchMergedValue35;
                        intermediateValue145 = branchMergedValue34;
                        intermediateValue147 = branchMergedValue33;
                        intermediateValue149 = branchMergedValue32;
                        intermediateValue151 = branchMergedValue31;
                        intermediateValue153 = branchMergedValue30;
                        intermediateValue154 = branchMergedValue29;
                        intermediateValue155 = branchMergedValue14;
                        break;
                    }
                    else
                    {
                        float intermediateValue99;
                        float intermediateValue100;
                        float intermediateValue101;
                        float sumValue55;
                        float sumValue56;
                        float sumValue57;
                        float sumValue58;
                        float sumValue59;
                        float sumValue60;
                        float sumValue61;
                        float sumValue62;
                        float sumValue63;
                        uint comparisonValue14;
                        bool comparisonValue15;
                        for (;;)
                        {
                            sumValue55 = float(intermediateValue1[productValue67]) + intermediateValue64;
                            sumValue56 = float(intermediateValue1[productValue68]) + intermediateValue65;
                            sumValue57 = float(intermediateValue1[productValue69]) + intermediateValue66;
                            sumValue58 = float(intermediateValue2[productValue70]) + intermediateValue64;
                            sumValue59 = float(intermediateValue2[productValue71]) + intermediateValue65;
                            sumValue60 = float(intermediateValue2[productValue72]) + intermediateValue66;
                            sumValue61 = intermediateValue64 + productValue164;
                            sumValue62 = intermediateValue65 + productValue165;
                            sumValue63 = intermediateValue66 + productValue166;
                            uint comparisonValue47 = ((((uint(intermediateValue64 >= 16.0f) << 1u) | uint(intermediateValue64 < 0.0f)) | (uint(intermediateValue65 < 0.0f) << 2u)) | (uint(intermediateValue65 >= 16.0f) << 3u)) | (uint(intermediateValue66 < 0.0f) << 4u);
                            comparisonValue14 = intermediateValue[comparisonValue47 | (uint(intermediateValue66 >= 16.0f) << 5u)];
                            comparisonValue15 = ((((comparisonValue47 | (uint(intermediateValue66 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue47 & 31u))) == 0u;
                            uint loadedBufferValue14;
                            if (comparisonValue15)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue14 & 31u))) == 0u)
                                {
                                    intermediateValue99 = 0.0f;
                                    intermediateValue100 = 0.0f;
                                    intermediateValue101 = 0.0f;
                                    break;
                                }
                                loadedBufferValue14 = ((((uint(sumValue61 - (floor(sumValue61 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue62 - (floor(sumValue62 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue63 - (floor(sumValue63 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue14).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue14 = ((((intermediateValue67 << 8u) & 3840u) | (intermediateValue68 & 15u)) | ((intermediateValue69 << 4u) & 240u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue70 = rdLoad_voxelBuffer(loadedBufferValue14);
                            uint scalarValue97 = loadedBufferValue70.x;
                            if (scalarValue97 == 0u)
                            {
                                intermediateValue99 = 0.0f;
                                intermediateValue100 = 0.0f;
                                intermediateValue101 = 0.0f;
                                break;
                            }
                            float bitwiseValue73 = float(scalarValue97 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue99 = bitwiseValue73 * float(scalarValue97 & 255u);
                            intermediateValue100 = bitwiseValue73 * float((scalarValue97 >> 8u) & 255u);
                            intermediateValue101 = bitwiseValue73 * float((scalarValue97 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue142;
                        float intermediateValue144;
                        float intermediateValue146;
                        float sumValue68;
                        float sumValue69;
                        float sumValue70;
                        uint comparisonValue20;
                        bool comparisonValue21;
                        for (;;)
                        {
                            sumValue68 = sumValue55 + productValue164;
                            sumValue69 = sumValue56 + productValue165;
                            sumValue70 = sumValue57 + productValue166;
                            uint comparisonValue48 = ((((uint(sumValue55 >= 16.0f) << 1u) | uint(sumValue55 < 0.0f)) | (uint(sumValue56 < 0.0f) << 2u)) | (uint(sumValue56 >= 16.0f) << 3u)) | (uint(sumValue57 < 0.0f) << 4u);
                            comparisonValue20 = intermediateValue[comparisonValue48 | (uint(sumValue57 >= 16.0f) << 5u)];
                            comparisonValue21 = ((((comparisonValue48 | (uint(sumValue57 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue48 & 31u))) == 0u;
                            uint loadedBufferValue27;
                            if (comparisonValue21)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue20 & 31u))) == 0u)
                                {
                                    intermediateValue142 = 0.0f;
                                    intermediateValue144 = 0.0f;
                                    intermediateValue146 = 0.0f;
                                    break;
                                }
                                loadedBufferValue27 = ((((uint(sumValue68 - (floor(sumValue68 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue69 - (floor(sumValue69 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue70 - (floor(sumValue70 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue20).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue27 = ((((uint(sumValue55) << 8u) & 3840u) | (uint(sumValue56) & 15u)) | ((uint(sumValue57) << 4u) & 240u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue71 = rdLoad_voxelBuffer(loadedBufferValue27);
                            uint scalarValue98 = loadedBufferValue71.x;
                            if (scalarValue98 == 0u)
                            {
                                intermediateValue142 = 0.0f;
                                intermediateValue144 = 0.0f;
                                intermediateValue146 = 0.0f;
                                break;
                            }
                            float bitwiseValue74 = float(scalarValue98 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue142 = bitwiseValue74 * float(scalarValue98 & 255u);
                            intermediateValue144 = bitwiseValue74 * float((scalarValue98 >> 8u) & 255u);
                            intermediateValue146 = bitwiseValue74 * float((scalarValue98 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue148;
                        float intermediateValue150;
                        float intermediateValue152;
                        float sumValue77;
                        float sumValue78;
                        float sumValue79;
                        uint comparisonValue26;
                        bool comparisonValue27;
                        for (;;)
                        {
                            sumValue77 = sumValue58 + productValue164;
                            sumValue78 = sumValue59 + productValue165;
                            sumValue79 = sumValue60 + productValue166;
                            uint comparisonValue49 = ((((uint(sumValue58 >= 16.0f) << 1u) | uint(sumValue58 < 0.0f)) | (uint(sumValue59 < 0.0f) << 2u)) | (uint(sumValue59 >= 16.0f) << 3u)) | (uint(sumValue60 < 0.0f) << 4u);
                            comparisonValue26 = intermediateValue[comparisonValue49 | (uint(sumValue60 >= 16.0f) << 5u)];
                            comparisonValue27 = ((((comparisonValue49 | (uint(sumValue60 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue49 & 31u))) == 0u;
                            uint loadedBufferValue31;
                            if (comparisonValue27)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (comparisonValue26 & 31u))) == 0u)
                                {
                                    intermediateValue148 = 0.0f;
                                    intermediateValue150 = 0.0f;
                                    intermediateValue152 = 0.0f;
                                    break;
                                }
                                loadedBufferValue31 = ((((uint(sumValue77 - (floor(sumValue77 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue78 - (floor(sumValue78 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue79 - (floor(sumValue79 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + comparisonValue26).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue31 = ((((uint(sumValue58) << 8u) & 3840u) | (uint(sumValue59) & 15u)) | ((uint(sumValue60) << 4u) & 240u)) + bitwiseValue29;
                            }
                            uint4 loadedBufferValue72 = rdLoad_voxelBuffer(loadedBufferValue31);
                            uint scalarValue99 = loadedBufferValue72.x;
                            if (scalarValue99 == 0u)
                            {
                                intermediateValue148 = 0.0f;
                                intermediateValue150 = 0.0f;
                                intermediateValue152 = 0.0f;
                                break;
                            }
                            float bitwiseValue75 = float(scalarValue99 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue148 = bitwiseValue75 * float(scalarValue99 & 255u);
                            intermediateValue150 = bitwiseValue75 * float((scalarValue99 >> 8u) & 255u);
                            intermediateValue152 = bitwiseValue75 * float((scalarValue99 >> 16u) & 255u);
                            break;
                        }
                        float sumValue148 = sumValue36 + productValue164;
                        float sumValue149 = sumValue37 + productValue165;
                        float sumValue150 = sumValue38 + productValue166;
                        uint comparisonValue35 = ((((uint(sumValue36 >= 16.0f) << 1u) | uint(sumValue36 < 0.0f)) | (uint(sumValue37 < 0.0f) << 2u)) | (uint(sumValue37 >= 16.0f) << 3u)) | (uint(sumValue38 < 0.0f) << 4u);
                        uint comparisonValue50 = comparisonValue35 | (uint(sumValue38 >= 16.0f) << 5u);
                        uint loadedBufferValue35;
                        if ((((comparisonValue50 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue35 & 31u))) == 0u)
                        {
                            if ((rdLoad_voxelBuffer(bitwiseValue29 + 4096u).x & (1u << (intermediateValue[comparisonValue50] & 31u))) == 0u)
                            {
                                intermediateValue138 = intermediateValue99;
                                intermediateValue139 = intermediateValue100;
                                intermediateValue140 = intermediateValue101;
                                intermediateValue141 = intermediateValue142;
                                intermediateValue143 = intermediateValue144;
                                intermediateValue145 = intermediateValue146;
                                intermediateValue147 = intermediateValue148;
                                intermediateValue149 = intermediateValue150;
                                intermediateValue151 = intermediateValue152;
                                intermediateValue153 = 0.0f;
                                intermediateValue154 = 0.0f;
                                intermediateValue155 = 0.0f;
                                break;
                            }
                            loadedBufferValue35 = ((((uint(sumValue148 - (floor(sumValue148 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue149 - (floor(sumValue149 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue150 - (floor(sumValue150 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue29 + 4097u) + intermediateValue[comparisonValue50]).x >> 2u);
                        }
                        else
                        {
                            loadedBufferValue35 = ((((uint(sumValue36) << 8u) & 3840u) | (uint(sumValue37) & 15u)) | ((uint(sumValue38) << 4u) & 240u)) + bitwiseValue29;
                        }
                        uint4 loadedBufferValue73 = rdLoad_voxelBuffer(loadedBufferValue35);
                        uint scalarValue100 = loadedBufferValue73.x;
                        if (scalarValue100 == 0u)
                        {
                            intermediateValue138 = intermediateValue99;
                            intermediateValue139 = intermediateValue100;
                            intermediateValue140 = intermediateValue101;
                            intermediateValue141 = intermediateValue142;
                            intermediateValue143 = intermediateValue144;
                            intermediateValue145 = intermediateValue146;
                            intermediateValue147 = intermediateValue148;
                            intermediateValue149 = intermediateValue150;
                            intermediateValue151 = intermediateValue152;
                            intermediateValue153 = 0.0f;
                            intermediateValue154 = 0.0f;
                            intermediateValue155 = 0.0f;
                            break;
                        }
                        float bitwiseValue76 = float(scalarValue100 >> 24u) * 9.2272217443678528070449829101562e-05f;
                        intermediateValue138 = intermediateValue99;
                        intermediateValue139 = intermediateValue100;
                        intermediateValue140 = intermediateValue101;
                        intermediateValue141 = intermediateValue142;
                        intermediateValue143 = intermediateValue144;
                        intermediateValue145 = intermediateValue146;
                        intermediateValue147 = intermediateValue148;
                        intermediateValue149 = intermediateValue150;
                        intermediateValue151 = intermediateValue152;
                        intermediateValue153 = bitwiseValue76 * float(scalarValue100 & 255u);
                        intermediateValue154 = bitwiseValue76 * float((scalarValue100 >> 8u) & 255u);
                        intermediateValue155 = bitwiseValue76 * float((scalarValue100 >> 16u) & 255u);
                        break;
                    }
                }
                branchMergedValue49 = (((intermediateValue141 * sumValue34) + (intermediateValue138 * sumValue33)) + (intermediateValue147 * sumValue35)) + (intermediateValue153 * intermediateValue72);
                branchMergedValue50 = (((intermediateValue145 * sumValue34) + (intermediateValue140 * sumValue33)) + (intermediateValue151 * sumValue35)) + (intermediateValue155 * intermediateValue72);
                branchMergedValue51 = (((intermediateValue143 * sumValue34) + (intermediateValue139 * sumValue33)) + (intermediateValue149 * sumValue35)) + (intermediateValue154 * intermediateValue72);
            }
            branchMergedValue6 = branchMergedValue49;
            branchMergedValue18 = branchMergedValue50;
            branchMergedValue19 = branchMergedValue51;
        }
        else
        {
            branchMergedValue6 = 0.0f;
            branchMergedValue18 = 0.0f;
            branchMergedValue19 = 0.0f;
        }
        intermediateValue26 = branchMergedValue6;
        intermediateValue27 = branchMergedValue19;
        intermediateValue28 = branchMergedValue18;
    }
    else
    {
        intermediateValue26 = bitwiseValue50 * float((scalarValue65 >> 8u) & 255u);
        intermediateValue27 = bitwiseValue50 * float(scalarValue65 & 255u);
        intermediateValue28 = bitwiseValue50 * float((scalarValue66 >> 8u) & 255u);
    }
    float productValue173 = bitwiseValue49 * bitwiseValue49;
    float productValue174 = productValue173 * productValue173;
    float productValue175 = (((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue173 - productValue174)) + productValue174) * bitwiseValue49) * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
    float productValue109 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * sumValue6;
    float productValue110 = scalarValue5 * 65535.0f;
    float scalarValue33 = floor(productValue110);
    fragmentColor0.x = (scalarValue3 * 0.5f) + 0.5f;
    fragmentColor0.y = (scalarValue4 * 0.5f) + 0.5f;
    fragmentColor0.z = scalarValue33 * 1.525902189314365386962890625e-05f;
    fragmentColor0.w = productValue110 - scalarValue33;
    fragmentColor1.x = (productValue109 * max((productValue175 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue26), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w)) + intermediateValue22;
    fragmentColor1.y = (productValue109 * max((productValue175 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue27), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w)) + intermediateValue23;
    fragmentColor1.z = (productValue109 * max((productValue175 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue28), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w)) + intermediateValue24;
    fragmentColor1.w = 1.0f;
    fragmentColor2.x = intermediateValue19;
    fragmentColor2.y = intermediateValue20;
    fragmentColor2.z = intermediateValue21;
    fragmentColor2.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
#endif
}
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1,
  out float4 fragmentColor2 : SV_TARGET2)
{
#if RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23,workingVector24,workingVector25;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  const float4 icb[] = { { -1, 0, 0, 1},
                              { 2, 0, 0, 1},
                              { 3, 0, 1, 0},
                              { -1, 0, 1, 0},
                              { 0, 1, 0, 0},
                              { 6, 1, 0, 0},
                              { 7, 0, 1, 0},
                              { -1, 1, 0, 0},
                              { 1, 0, 1, 1},
                              { 10, 1, 0, 1},
                              { 11, 0, 1, 1},
                              { -1, 0, 1, 1},
                              { -1, 1, 0, 1},
                              { -1, 1, 0, 1},
                              { -1, 1, 1, 0},
                              { -1, 1, 1, 0},
                              { 4, 0, 0, 0},
                              { 14, 0, 0, 0},
                              { 16, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 8, 0, 0, 0},
                              { 18, 0, 0, 0},
                              { 20, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 12, 0, 0, 0},
                              { 22, 0, 0, 0},
                              { 24, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 5, 0, 0, 0},
                              { 15, 0, 0, 0},
                              { 17, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 9, 0, 0, 0},
                              { 19, 0, 0, 0},
                              { 21, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 13, 0, 0, 0},
                              { 23, 0, 0, 0},
                              { 25, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0} };
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
  const float4 icb[] = { { -1, 0, 0, 1},
                              { 2, 0, 0, 1},
                              { 3, 0, 1, 0},
                              { -1, 0, 1, 0},
                              { 0, 1, 0, 0},
                              { 6, 1, 0, 0},
                              { 7, 0, 1, 0},
                              { -1, 1, 0, 0},
                              { 1, 0, 1, 1},
                              { 10, 1, 0, 1},
                              { 11, 0, 1, 1},
                              { -1, 0, 1, 1},
                              { -1, 1, 0, 1},
                              { -1, 1, 0, 1},
                              { -1, 1, 1, 0},
                              { -1, 1, 1, 0},
                              { 4, 0, 0, 0},
                              { 14, 0, 0, 0},
                              { 16, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 8, 0, 0, 0},
                              { 18, 0, 0, 0},
                              { 20, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 12, 0, 0, 0},
                              { 22, 0, 0, 0},
                              { 24, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 5, 0, 0, 0},
                              { 15, 0, 0, 0},
                              { 17, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 9, 0, 0, 0},
                              { 19, 0, 0, 0},
                              { 21, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 13, 0, 0, 0},
                              { 23, 0, 0, 0},
                              { 25, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0} };
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23,workingVector24,workingVector25,workingVector26;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.xy * varyingTexCoord0.xy;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector0.xy = float2(0.5,0.5) + workingVector0.xy;
  workingVector1.xy = RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.zw * workingVector0.xy;
#if RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF
  workingVector0.xz = materialTexture3.Sample(textureSampler3, workingVector1.xy).xy;
  workingVector0.w = materialTexture6.Sample(textureSampler6, workingVector1.xy).x;
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector1.w = -0.501960814 + workingVector2.w;
  workingVector1.w = saturate(2.00787401 * workingVector1.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector0.xz = materialTexture3.Sample(textureSampler3, workingVector1.xy).xy;
  workingVector0.w = materialTexture6.Sample(textureSampler6, workingVector1.xy).x;
  workingVector1.w = materialTexture1.Sample(textureSampler1, workingVector1.xy).w;
  workingVector1.w = -0.501960814 + workingVector1.w;
  workingVector1.w = saturate(2.00787401 * workingVector1.w);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
  workingVector1.z = -workingVector0.y * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.w + 1;
  workingVector0.xy = workingVector1.xz * float2(2,2) + float2(-1,-1);
  workingVector0.zw = materialTexture3.Sample(textureSampler3, workingVector1.xy).xy;
  workingVector1.z = materialTexture6.Sample(textureSampler6, workingVector1.xy).x;
  workingVector2.x = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector0.x;
  workingVector2.y = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector0.y;
  workingVector1.w = workingVector1.z * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
  workingVector2.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
  workingVector2.xyz = workingVector2.xyz / workingVector1.www;
  workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector2.yyy;
  workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector2.xxx + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector2.zzz + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector3.xyz;
  workingVector4.xyz = float3(1,1,1) + -abs(workingVector0.zwz);
  workingVector5.y = workingVector4.x + -abs(workingVector0.w);
  workingVector2.w = RD_COMPARISON_MASK(workingVector5.y < 0);
  workingVector4.xw = RD_COMPARISON_MASK(workingVector0.wz >= float2(0,0));
  workingVector4.xw = workingVector4.xw ? float2(1,1) : float2(-1,-1);
  workingVector4.xy = workingVector4.zy * workingVector4.xw;
  workingVector5.xz = workingVector2.ww ? workingVector4.xy : workingVector0.wz;
  workingVector2.w = dot(workingVector5.xyz, workingVector5.xyz);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector4.xyz = workingVector5.xyz * workingVector2.www;
  workingVector6.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector3.w = -0.501960814 + workingVector6.w;
  workingVector3.w = saturate(2.00787401 * workingVector3.w);
#endif
  materialTexture2.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
#if RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF
  workingVector3.xy = floatingPointResult.xy;
  workingVector3.xy = workingVector3.xy * workingVector1.xy;
  workingVector3.xy = (int2)workingVector3.xy;
  workingVector3.zw = float2(0,0);
  workingVector3.xyzw = materialTexture2.Load(workingVector3.xyz).xyzw;
  workingVector4.xyz = (int3)workingVector3.wyz & int3(255,255,255);
  workingVector1.y = (uint)workingVector4.x;
  workingVector1.y = 0.00392156886 * workingVector1.y;
  if (8 == 0) workingVector3.y = 0; else if (8+8 < 32) {   workingVector3.y = (uint)workingVector3.y << (32-(8 + 8)); workingVector3.y = (uint)workingVector3.y >> (32-8);  } else workingVector3.y = (uint)workingVector3.y >> 8;
  if (8 == 0) workingVector3.z = 0; else if (8+8 < 32) {   workingVector3.z = (uint)workingVector3.z << (32-(8 + 8)); workingVector3.z = (uint)workingVector3.z >> (32-8);  } else workingVector3.z = (uint)workingVector3.z >> 8;
  workingVector5.xz = (uint2)workingVector3.yz;
  workingVector5.yw = (uint2)workingVector4.yz;
  workingVector4.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector5.xyzw;
  workingVector3.yzw = workingVector4.xyz * workingVector4.www;
  workingVector3.yzw = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector3.yzw;
  workingVector4.x = 1 + -workingVector1.w;
  workingVector4.y = RD_COMPARISON_MASK(workingVector0.w != 1.000000);
  if (workingVector4.y != 0) {
    workingVector4.y = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z);
    if (workingVector4.y != 0) {
      workingVector1.z = -workingVector0.y * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.w + 1;
      workingVector1.xz = workingVector1.xz * float2(2,2) + float2(-1,-1);
      workingVector5.x = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector1.x;
      workingVector5.y = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector1.z;
      workingVector0.y = workingVector0.w * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
      workingVector5.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
      workingVector4.yzw = workingVector5.xyz / workingVector0.yyy;
      workingVector5.x = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * -workingVector4.w;
      workingVector5.y = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w * workingVector5.x;
      workingVector5.z = workingVector5.x * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w + workingVector4.y;
      workingVector5.xy = workingVector5.xy + workingVector5.xy;
      workingVector5.y = saturate(workingVector5.z / workingVector5.y);
      workingVector5.z = -workingVector4.w * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z + workingVector4.z;
      workingVector5.x = saturate(workingVector5.z / workingVector5.x);
      workingVector5.zw = RD_COMPARISON_MASK(-workingVector4.ww < RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.xy);
      workingVector6.x = log2(-workingVector4.w);
      workingVector6.x = -RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z + workingVector6.x;
      workingVector6.x = saturate(RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x * workingVector6.x);
      workingVector7.xyzw = float4(-2,-1,-1,-1) + RD_UNIFORM_CLUSTER_DIMENSIONS.zzxy;
      workingVector6.x = workingVector7.x * workingVector6.x;
      workingVector6.x = floor(workingVector6.x);
      workingVector6.x = 2 + workingVector6.x;
      workingVector6.x = min(workingVector6.x, workingVector7.y);
      workingVector5.w = workingVector5.w ? 1 : workingVector6.x;
      workingVector5.z = workingVector5.z ? 0 : workingVector5.w;
      workingVector5.xy = RD_UNIFORM_CLUSTER_DIMENSIONS.yx * workingVector5.xy;
      workingVector5.xy = floor(workingVector5.xy);
      workingVector5.xy = min(workingVector5.xy, workingVector7.wz);
      workingVector5.w = RD_COMPARISON_MASK(workingVector5.y < 0);
      workingVector6.x = RD_COMPARISON_MASK(workingVector5.x < 0);
      workingVector5.w = (int)workingVector5.w | (int)workingVector6.x;
      workingVector6.x = RD_COMPARISON_MASK(workingVector5.z < 0);
      workingVector5.w = (int)workingVector5.w | (int)workingVector6.x;
      workingVector6.x = RD_COMPARISON_MASK(workingVector5.y >= RD_UNIFORM_CLUSTER_DIMENSIONS.x);
      workingVector5.w = (int)workingVector5.w | (int)workingVector6.x;
      workingVector6.x = RD_COMPARISON_MASK(workingVector5.x >= RD_UNIFORM_CLUSTER_DIMENSIONS.y);
      workingVector5.w = (int)workingVector5.w | (int)workingVector6.x;
      workingVector6.x = RD_COMPARISON_MASK(workingVector5.z >= RD_UNIFORM_CLUSTER_DIMENSIONS.z);
      workingVector5.w = (int)workingVector5.w | (int)workingVector6.x;
      if (workingVector5.w == 0) {
        workingVector6.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector4.zzz;
        workingVector6.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector4.yyy + workingVector6.xyz;
        workingVector6.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector4.www + workingVector6.xyz;
        workingVector6.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector6.xyz;
        workingVector1.x = RD_UNIFORM_SUB_PIXEL_OFFSET.x + workingVector1.x;
        workingVector1.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + workingVector1.z;
        workingVector7.z = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector1.x;
        workingVector7.x = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector1.z;
        workingVector7.y = RD_UNIFORM_INV_PROJ_ROW_3.z;
        workingVector7.xyz = workingVector7.xyz / workingVector0.yyy;
        workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector7.xxx;
        workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector7.zzz + workingVector8.xyz;
        workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector7.yyy + workingVector8.xyz;
        workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector8.xyz;
        workingVector8.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector8.xyz;
        workingVector9.xyz = ddx_coarse(workingVector7.yzx);
        workingVector0.y = dot(workingVector9.xyz, workingVector9.xyz);
        workingVector0.y = rsqrt(workingVector0.y);
        workingVector9.xyz = workingVector9.xyz * workingVector0.yyy;
        workingVector7.xyz = -workingVector7.xyz;
        workingVector7.xyz = ddy_coarse(workingVector7.xyz);
        workingVector0.y = dot(workingVector7.xyz, workingVector7.xyz);
        workingVector0.y = rsqrt(workingVector0.y);
        workingVector7.xyz = workingVector7.xyz * workingVector0.yyy;
        workingVector10.xyz = workingVector9.xyz * workingVector7.xyz;
        workingVector7.xyz = workingVector9.zxy * workingVector7.yzx + -workingVector10.xyz;
        workingVector0.y = dot(workingVector7.xyz, workingVector7.xyz);
        workingVector0.y = rsqrt(workingVector0.y);
        workingVector7.xyz = workingVector7.xyz * workingVector0.yyy;
        workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector7.yyy;
        workingVector7.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector7.xxx + workingVector9.xyz;
        workingVector7.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector7.zzz + workingVector7.xyw;
        workingVector0.y = dot(workingVector7.xyz, workingVector7.xyz);
        workingVector0.y = rsqrt(workingVector0.y);
        workingVector7.xyz = workingVector7.xyz * workingVector0.yyy;
        workingVector7.xyz = workingVector7.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
        workingVector7.xyz = round(workingVector7.xyz);
        workingVector7.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector7.xyz;
        workingVector0.y = dot(workingVector7.xyz, workingVector7.xyz);
        workingVector0.y = rsqrt(workingVector0.y);
        workingVector7.xyz = workingVector7.xyz * workingVector0.yyy;
        workingVector9.xyz = workingVector8.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
        workingVector9.xyz = floor(workingVector9.xyz);
        workingVector9.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector9.xyz + workingVector8.xyz;
        workingVector9.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector9.xyz;
        workingVector0.y = dot(workingVector9.xyz, workingVector7.xyz);
        workingVector7.xyz = -workingVector0.yyy * workingVector7.xyz + workingVector9.xyz;
        workingVector7.xyz = workingVector8.xyz + workingVector7.xyz;
        workingVector7.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector7.xyz;
        workingVector8.xyz = float3(1,1,1) + -abs(workingVector0.xzx);
        workingVector9.z = workingVector8.x + -abs(workingVector0.z);
        workingVector0.y = RD_COMPARISON_MASK(workingVector9.z < 0);
        workingVector1.xz = RD_COMPARISON_MASK(workingVector0.xz >= float2(0,0));
        workingVector1.xz = workingVector1.xz ? float2(1,1) : float2(-1,-1);
        workingVector1.xz = workingVector8.yz * workingVector1.xz;
        workingVector9.xy = workingVector0.yy ? workingVector1.xz : workingVector0.xz;
        workingVector0.y = dot(workingVector9.xyz, workingVector9.xyz);
        workingVector0.y = rsqrt(workingVector0.y);
        workingVector8.xyz = workingVector9.xyz * workingVector0.yyy;
        workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector8.yyy;
        workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector8.xxx + workingVector9.xyz;
        workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector8.zzz + workingVector9.xyz;
        workingVector0.y = dot(workingVector9.xyz, workingVector9.xyz);
        workingVector0.y = rsqrt(workingVector0.y);
        workingVector9.xyz = workingVector9.xyz * workingVector0.yyy;
        workingVector0.y = 0.498039216 + -workingVector2.w;
        workingVector0.y = saturate(2.00787401 * workingVector0.y);
        if (8 == 0) workingVector1.x = 0; else if (8+8 < 32) {         workingVector1.x = (uint)workingVector3.x << (32-(8 + 8)); workingVector1.x = (uint)workingVector1.x >> (32-8);        } else workingVector1.x = (uint)workingVector3.x >> 8;
        workingVector1.x = (uint)workingVector1.x;
        workingVector1.x = 0.00392156886 * workingVector1.x;
        workingVector1.z = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
        workingVector10.xyz = max(float3(0,0,0), workingVector2.xyz);
        workingVector10.xyz = log2(workingVector10.xyz);
        workingVector10.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector10.xyz;
        workingVector10.xyz = exp2(workingVector10.xyz);
        workingVector11.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector2.xyz;
        workingVector12.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector2.xyz;
        workingVector12.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector12.xyz;
        workingVector12.xyz = log2(workingVector12.xyz);
        workingVector12.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector12.xyz;
        workingVector12.xyz = exp2(workingVector12.xyz);
        workingVector2.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector2.xyz);
        workingVector2.xyz = workingVector2.xyz ? workingVector11.xyz : workingVector12.xyz;
        workingVector2.xyz = workingVector1.zzz ? workingVector10.xyz : workingVector2.xyz;
        workingVector10.xy = float2(0.0399999991,0.318309873) * workingVector4.xx;
        workingVector2.xyz = workingVector2.xyz * workingVector1.www + workingVector10.xxx;
        workingVector1.z = dot(workingVector4.yzw, workingVector4.yzw);
        workingVector1.z = sqrt(workingVector1.z);
        workingVector1.z = 9.99999975e-005 + workingVector1.z;
        workingVector10.xzw = workingVector4.yzw / workingVector1.zzz;
        workingVector0.y = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * workingVector0.y;
        workingVector1.z = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
        workingVector1.z = RD_COMPARISON_MASK(0 < (int)workingVector1.z);
        workingVector7.xyz = workingVector1.zzz ? workingVector7.xyz : workingVector6.xyz;
        workingVector1.z = workingVector5.x * RD_UNIFORM_CLUSTER_DIMENSIONS.x + workingVector5.y;
        workingVector1.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector5.z;
        workingVector1.z = workingVector1.w * RD_UNIFORM_CLUSTER_DIMENSIONS.y + workingVector1.z;
        workingVector1.z = (int)workingVector1.z;
        workingVector1.w = (int)RD_UNIFORM_CLUSTER_DIMENSIONS.w;
        workingVector2.w = (int)workingVector1.w * (int)workingVector1.z;
        workingVector1.z = mad((int)workingVector1.z, (int)workingVector1.w, (int)workingVector1.w);
        workingVector1.w = dot(workingVector9.xyz, -workingVector10.xzw);
        workingVector3.x = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
        workingVector3.x = workingVector3.x * workingVector3.x;
        workingVector1.xw = max(float2(0.0500000007,0), workingVector1.xw);
        workingVector1.x = workingVector1.x * workingVector1.x;
        workingVector5.x = workingVector1.x * workingVector1.x;
        workingVector5.y = workingVector1.x * workingVector1.x + -1;
        workingVector5.z = 0.5 * workingVector1.x;
        workingVector1.x = -workingVector1.x * 0.5 + 1;
        workingVector5.w = workingVector1.w * workingVector1.x + workingVector5.z;
        workingVector5.w = 9.99999975e-005 + workingVector5.w;
        workingVector5.w = workingVector1.w / workingVector5.w;
        workingVector11.xyz = float3(1,1,1) + -workingVector2.xyz;
        workingVector6.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x);
        workingVector7.w = RD_COMPARISON_MASK(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.000000);
        workingVector8.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x);
        workingVector9.w = RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
        workingVector12.xy = float2(0.5,0.5) / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xy;
        workingVector11.w = RD_COMPARISON_MASK(0 < workingVector0.y);
        workingVector9.w = 1 / workingVector9.w;
        workingVector13.xyz = float3(0,0,0);
        workingVector14.xyz = float3(0,0,0);
        workingVector12.z = workingVector2.w;
        while (true) {
          workingVector12.w = RD_COMPARISON_MASK((int)workingVector12.z >= (int)workingVector1.z);
          if (workingVector12.w != 0) break;
          workingVector12.w = sampledResource12[workingVector12.z].val[0/4];
          workingVector12.w = (int)workingVector12.w;
          workingVector13.w = RD_COMPARISON_MASK((int)workingVector12.w < 0);
          if (workingVector13.w != 0) {
            break;
          }
          workingVector15.x = sampledResource13[workingVector12.w].val[0/4];
          workingVector15.y = sampledResource13[workingVector12.w].val[0/4+1];
          workingVector15.z = sampledResource13[workingVector12.w].val[0/4+2];
          workingVector16.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector15.yyy;
          workingVector16.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector15.xxx + workingVector16.xyz;
          workingVector16.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector15.zzz + workingVector16.xyz;
          workingVector16.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector16.xyz;
          workingVector16.xyz = workingVector16.xyz + -workingVector4.yzw;
          workingVector13.w = dot(workingVector16.xyz, workingVector16.xyz);
          workingVector13.w = rsqrt(workingVector13.w);
          workingVector17.xyz = workingVector16.xyz * workingVector13.www;
          workingVector14.w = dot(workingVector9.xyz, workingVector17.xyz);
          workingVector15.w = max(0, workingVector14.w);
          workingVector14.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector14.w;
          workingVector14.w = workingVector14.w / workingVector3.x;
          workingVector14.w = max(0, workingVector14.w);
          workingVector14.w = workingVector14.w + -workingVector15.w;
          workingVector14.w = workingVector0.y * workingVector14.w + workingVector15.w;
          workingVector16.w = dot(-workingVector9.xyz, workingVector17.xyz);
          workingVector16.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector16.w;
          workingVector16.w = workingVector16.w / workingVector3.x;
          workingVector16.w = max(0, workingVector16.w);
          workingVector16.w = workingVector16.w * workingVector0.y;
          workingVector16.xyz = workingVector16.xyz * workingVector13.www + -workingVector10.xzw;
          workingVector13.w = dot(workingVector16.xyz, workingVector16.xyz);
          workingVector13.w = rsqrt(workingVector13.w);
          workingVector16.xyz = workingVector16.xyz * workingVector13.www;
          workingVector13.w = dot(workingVector9.xyz, workingVector16.xyz);
          workingVector13.w = max(0, workingVector13.w);
          workingVector13.w = workingVector13.w * workingVector13.w;
          workingVector13.w = workingVector13.w * workingVector5.y + 1;
          workingVector13.w = workingVector13.w * workingVector13.w;
          workingVector13.w = 3.14159274 * workingVector13.w;
          workingVector13.w = workingVector5.x / workingVector13.w;
          workingVector17.x = workingVector15.w * workingVector1.x + workingVector5.z;
          workingVector17.x = 9.99999975e-005 + workingVector17.x;
          workingVector17.x = workingVector15.w / workingVector17.x;
          workingVector17.x = workingVector17.x * workingVector5.w;
          workingVector16.x = dot(-workingVector10.xzw, workingVector16.xyz);
          workingVector16.x = max(0, workingVector16.x);
          workingVector16.x = 1 + -workingVector16.x;
          workingVector16.x = max(0, workingVector16.x);
          workingVector16.y = workingVector16.x * workingVector16.x;
          workingVector16.y = workingVector16.y * workingVector16.y;
          workingVector16.x = workingVector16.y * workingVector16.x;
          workingVector16.xyz = workingVector11.xyz * workingVector16.xxx + workingVector2.xyz;
          workingVector17.yzw = float3(1,1,1) + -workingVector16.xyz;
          workingVector17.yzw = workingVector17.yzw * workingVector14.www;
          workingVector17.yzw = workingVector17.yzw * workingVector10.yyy;
          workingVector14.w = workingVector16.w * workingVector10.y;
          workingVector16.xyz = workingVector16.xyz * workingVector13.www;
          workingVector16.xyz = workingVector16.xyz * workingVector17.xxx;
          workingVector13.w = workingVector15.w * workingVector1.w;
          workingVector13.w = workingVector13.w * 4 + 9.99999975e-005;
          workingVector16.xyz = workingVector16.xyz / workingVector13.www;
          workingVector16.xyz = workingVector16.xyz * workingVector15.www;
          workingVector13.w = RD_COMPARISON_MASK((int)workingVector12.w >= 0);
          if (workingVector13.w != 0) {
            workingVector18.x = sampledResource13[workingVector12.w].val[0/4];
            workingVector18.y = sampledResource13[workingVector12.w].val[0/4+1];
            workingVector18.z = sampledResource13[workingVector12.w].val[0/4+2];
            workingVector18.w = sampledResource13[workingVector12.w].val[0/4+3];
            workingVector18.xyz = workingVector18.xyz + -workingVector6.xyz;
            workingVector13.w = abs(workingVector18.x) + abs(workingVector18.y);
            workingVector13.w = workingVector13.w + abs(workingVector18.z);
            workingVector13.w = workingVector13.w * workingVector13.w;
            workingVector15.w = dot(workingVector18.xyz, workingVector18.xyz);
            workingVector13.w = workingVector6.w ? workingVector13.w : workingVector15.w;
            workingVector15.w = workingVector18.w * workingVector18.w;
            workingVector15.w = RD_COMPARISON_MASK(workingVector13.w < workingVector15.w);
            if (workingVector15.w != 0) {
              if (workingVector7.w != 0) {
                workingVector19.x = sampledResource13[workingVector12.w].val[32/4];
                workingVector19.y = sampledResource13[workingVector12.w].val[32/4+1];
                workingVector19.z = sampledResource13[workingVector12.w].val[32/4+2];
                workingVector19.w = sampledResource13[workingVector12.w].val[32/4+3];
                workingVector20.x = sampledResource13[workingVector12.w].val[48/4];
                workingVector20.y = sampledResource13[workingVector12.w].val[48/4+1];
                workingVector20.z = sampledResource13[workingVector12.w].val[48/4+2];
                workingVector20.w = sampledResource13[workingVector12.w].val[48/4+3];
                workingVector21.x = sampledResource13[workingVector12.w].val[64/4];
                workingVector21.y = sampledResource13[workingVector12.w].val[64/4+1];
                workingVector21.z = sampledResource13[workingVector12.w].val[64/4+2];
                workingVector21.w = sampledResource13[workingVector12.w].val[64/4+3];
                workingVector22.x = sampledResource13[workingVector12.w].val[80/4];
                workingVector22.y = sampledResource13[workingVector12.w].val[80/4+1];
                workingVector22.z = sampledResource13[workingVector12.w].val[80/4+2];
                workingVector22.w = sampledResource13[workingVector12.w].val[80/4+3];
                workingVector23.x = sampledResource13[workingVector12.w].val[96/4];
                workingVector23.y = sampledResource13[workingVector12.w].val[96/4+1];
                workingVector23.z = sampledResource13[workingVector12.w].val[96/4+2];
                workingVector23.w = sampledResource13[workingVector12.w].val[96/4+3];
                workingVector24.x = sampledResource13[workingVector12.w].val[112/4];
                workingVector24.y = sampledResource13[workingVector12.w].val[112/4+1];
                workingVector24.z = sampledResource13[workingVector12.w].val[112/4+2];
                workingVector24.w = sampledResource13[workingVector12.w].val[112/4+3];
                workingVector15.xyz = -workingVector15.xyz + workingVector7.xyz;
                workingVector18.xyz = RD_COMPARISON_MASK(abs(workingVector15.xxy) >= abs(workingVector15.yzz));
                workingVector16.w = workingVector18.y ? workingVector18.x : 0;
                workingVector25.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(0,0,0));
                workingVector25.xyz = workingVector25.xyz ? float3(0,2.80259693e-045,5.60519386e-045) : float3(1,3,5);
                workingVector17.x = workingVector18.z ? workingVector25.y : workingVector25.z;
                workingVector16.w = workingVector16.w ? workingVector25.x : workingVector17.x;
                workingVector25.xyzw = RD_COMPARISON_MASK((int4)workingVector16.wwww == int4(1,2,3,4));
                workingVector16.w = RD_COMPARISON_MASK((int)workingVector16.w == 5);
                workingVector19.xyzw = workingVector16.wwww ? workingVector24.xyzw : workingVector19.xyzw;
                workingVector19.xyzw = workingVector25.wwww ? workingVector23.xyzw : workingVector19.xyzw;
                workingVector19.xyzw = workingVector25.zzzz ? workingVector22.xyzw : workingVector19.xyzw;
                workingVector19.xyzw = workingVector25.yyyy ? workingVector21.xyzw : workingVector19.xyzw;
                workingVector19.xyzw = workingVector25.xxxx ? workingVector20.xyzw : workingVector19.xyzw;
                workingVector18.xy = RD_COMPARISON_MASK(workingVector19.zw == float2(0,0));
                workingVector17.x = workingVector18.y ? workingVector18.x : 0;
                if (workingVector17.x == 0) {
                  workingVector15.w = -workingVector15.x;
                  workingVector18.xy = workingVector16.ww ? workingVector15.xz : workingVector15.zw;
                  workingVector18.xz = workingVector25.ww ? -workingVector15.xz : workingVector18.xy;
                  workingVector20.xyz = float3(-1,1,1) * workingVector15.xzy;
                  workingVector18.y = workingVector20.z;
                  workingVector18.xyz = workingVector25.zzz ? workingVector20.xyz : workingVector18.xyz;
                  workingVector18.xyz = workingVector25.yyy ? -workingVector15.xzy : workingVector18.xyz;
                  workingVector20.xyz = float3(-1,1,1) * workingVector15.zyx;
                  workingVector18.xyz = workingVector25.xxx ? workingVector20.xyz : workingVector18.xyz;
                  workingVector20.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.xyzw * workingVector18.yyyy;
                  workingVector20.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.xyzw * workingVector18.xxxx + workingVector20.xyzw;
                  workingVector20.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.xyzw * workingVector18.zzzz + workingVector20.xyzw;
                  workingVector20.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.xyzw + workingVector20.xyzw;
                  workingVector15.w = dot(-workingVector15.xyz, -workingVector15.xyz);
                  workingVector15.w = rsqrt(workingVector15.w);
                  workingVector15.xyz = -workingVector15.xyz * workingVector15.www;
                  workingVector15.x = dot(workingVector15.xyz, workingVector8.xyz);
                  workingVector15.x = max(RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x, workingVector15.x);
                  workingVector15.x = min(1, workingVector15.x);
                  workingVector15.y = -workingVector15.x * workingVector15.x + 1;
                  workingVector15.y = sqrt(workingVector15.y);
                  workingVector15.x = workingVector15.y / workingVector15.x;
                  workingVector15.x = RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y * workingVector15.x + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x;
                  workingVector15.yzw = workingVector19.zzw + -workingVector19.xxy;
                  workingVector21.xyz = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xxy * workingVector15.yzw;
                  workingVector15.y = max(1, workingVector21.x);
                  workingVector15.y = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / workingVector15.y;
                  workingVector20.z = -workingVector15.x * workingVector15.y + workingVector20.z;
                  workingVector20.xyz = workingVector20.xyz / workingVector20.www;
                  workingVector22.xy = workingVector20.xy * float2(0.5,0.5) + float2(0.5,0.5);
                  workingVector15.xy = workingVector19.xy + workingVector12.xy;
                  workingVector19.zw = workingVector19.zw + -workingVector12.xy;
                  workingVector22.z = 1 + -workingVector22.y;
                  workingVector21.xw = workingVector22.xz * workingVector21.yz;
                  workingVector21.xw = floor(workingVector21.xw);
                  workingVector21.xw = float2(0.5,0.5) + workingVector21.xw;
                  workingVector21.xy = workingVector21.xw / workingVector21.yz;
                  workingVector15.zw = workingVector21.xy * workingVector15.zw + workingVector19.xy;
                  workingVector15.xy = max(workingVector15.zw, workingVector15.xy);
                  workingVector15.xy = min(workingVector15.xy, workingVector19.zw);
                  workingVector15.x = materialTexture4.SampleLevel(textureSampler4, workingVector15.xy, 0).x;
                  workingVector15.y = RD_COMPARISON_MASK(workingVector15.x >= workingVector20.z);
                  workingVector15.y = workingVector15.y ? 1.000000 : 0;
                  workingVector19.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.xyzw * workingVector20.yyyy;
                  workingVector19.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.xyzw * workingVector20.xxxx + workingVector19.xyzw;
                  workingVector19.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.xyzw * workingVector15.xxxx + workingVector19.xyzw;
                  workingVector19.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.xyzw + workingVector19.xyzw;
                  workingVector15.xzw = workingVector19.xyz / workingVector19.www;
                  workingVector16.w = dot(workingVector18.xyz, workingVector18.xyz);
                  workingVector16.w = sqrt(workingVector16.w);
                  workingVector15.x = dot(workingVector15.xzw, workingVector15.xzw);
                  workingVector15.x = sqrt(workingVector15.x);
                  workingVector15.x = workingVector16.w + -workingVector15.x;
                  workingVector15.x = saturate(RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector15.x);
                  workingVector15.z = workingVector15.x * -2 + 3;
                  workingVector15.x = workingVector15.x * workingVector15.x;
                  workingVector15.x = -workingVector15.z * workingVector15.x + 1;
                  workingVector15.x = workingVector11.w ? workingVector15.x : 1;
                } else {
                  workingVector15.xy = float2(1,0);
                }
              } else {
                workingVector15.xy = float2(1,1);
              }
              workingVector15.z = max(0.100000001, workingVector13.w);
              workingVector15.z = 1 / workingVector15.z;
              workingVector15.w = workingVector18.w * workingVector18.w + 9.99999975e-005;
              workingVector13.w = workingVector13.w / workingVector15.w;
              workingVector13.w = -workingVector13.w * workingVector13.w + 1;
              workingVector13.w = max(0, workingVector13.w);
              workingVector13.w = workingVector13.w * workingVector13.w;
              workingVector15.w = workingVector15.z * workingVector13.w;
              workingVector13.w = -workingVector15.z * workingVector13.w + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
              workingVector13.w = 1 + workingVector13.w;
              workingVector13.w = saturate(workingVector13.w * workingVector9.w);
              workingVector15.z = workingVector13.w * -2 + 3;
              workingVector13.w = workingVector13.w * workingVector13.w;
              workingVector13.w = workingVector15.z * workingVector13.w;
              workingVector13.w = saturate(workingVector13.w * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w);
              workingVector13.w = workingVector15.w * workingVector13.w;
              workingVector13.w = workingVector8.w ? workingVector13.w : workingVector15.w;
              workingVector18.x = sampledResource13[workingVector12.w].val[16/4];
              workingVector18.y = sampledResource13[workingVector12.w].val[16/4+1];
              workingVector18.z = sampledResource13[workingVector12.w].val[16/4+2];
              workingVector18.w = sampledResource13[workingVector12.w].val[16/4+3];
              workingVector18.xyz = workingVector18.xyz * workingVector18.www;
              workingVector18.xyz = workingVector18.xyz * workingVector13.www;
            } else {
              workingVector18.xyz = float3(0,0,0);
              workingVector15.xy = float2(1,1);
            }
          } else {
            workingVector18.xyz = float3(0,0,0);
            workingVector15.xy = float2(1,1);
          }
          workingVector12.w = workingVector15.x * workingVector14.w;
          workingVector15.xzw = workingVector17.yzw * workingVector15.yyy + workingVector12.www;
          workingVector15.xzw = workingVector15.xzw * workingVector18.xyz;
          workingVector13.xyz = workingVector15.xzw * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx + workingVector13.xyz;
          workingVector15.xyz = workingVector16.xyz * workingVector15.yyy;
          workingVector15.xyz = workingVector15.xyz * workingVector18.xyz;
          workingVector14.xyz = workingVector15.xyz * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy + workingVector14.xyz;
          workingVector12.z = (int)workingVector12.z + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector2.xy = floatingPointResult.xy;
  workingVector2.xy = workingVector2.xy * workingVector1.xy;
  workingVector2.xy = (int2)workingVector2.xy;
  workingVector2.zw = float2(0,0);
  workingVector2.xyz = materialTexture2.Load(workingVector2.xyz).yzw;
  workingVector1.y = (int)workingVector2.z & 255;
  workingVector1.y = (uint)workingVector1.y;
  workingVector1.y = 0.00392156886 * workingVector1.y;
  if (8 == 0) workingVector2.z = 0; else if (8+8 < 32) {   workingVector2.z = (uint)workingVector2.z << (32-(8 + 8)); workingVector2.z = (uint)workingVector2.z >> (32-8);  } else workingVector2.z = (uint)workingVector2.z >> 8;
  workingVector2.w = (int)workingVector2.z & 1;
  workingVector3.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
  workingVector2.w = RD_COMPARISON_MASK((int)workingVector2.w == 0);
  workingVector2.w = workingVector2.w ? workingVector3.x : 0;
  if (workingVector2.w != 0) {
    workingVector1.z = -workingVector0.y * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.w + 1;
    workingVector1.xz = workingVector1.xz * float2(2,2) + float2(-1,-1);
    workingVector0.y = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector1.x;
    workingVector1.x = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector1.z;
    workingVector1.z = workingVector0.w * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
    workingVector0.y = workingVector0.y / workingVector1.z;
    workingVector1.x = workingVector1.x / workingVector1.z;
    workingVector1.z = RD_UNIFORM_INV_PROJ_ROW_3.z / workingVector1.z;
    workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector1.xxx;
    workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector0.yyy + workingVector3.xyz;
    workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector1.zzz + workingVector3.xyz;
    workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector3.xyz;
    workingVector4.xyz = float3(1,1,1) + -abs(workingVector0.xzx);
    workingVector5.y = workingVector4.x + -abs(workingVector0.z);
    workingVector0.y = RD_COMPARISON_MASK(workingVector5.y < 0);
    workingVector1.xz = RD_COMPARISON_MASK(workingVector0.zx >= float2(0,0));
    workingVector1.xz = workingVector1.xz ? float2(1,1) : float2(-1,-1);
    workingVector1.xz = workingVector4.zy * workingVector1.xz;
    workingVector5.xz = workingVector0.yy ? workingVector1.xz : workingVector0.zx;
    workingVector0.y = dot(workingVector5.xyz, workingVector5.xyz);
    workingVector0.y = rsqrt(workingVector0.y);
    workingVector4.xyz = workingVector5.xyz * workingVector0.yyy;
    workingVector3.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector3.xyz;
    workingVector3.xyz = float3(-0.5,-0.5,-0.5) + workingVector3.xyz;
    workingVector3.xyz = workingVector4.zxy * float3(0.200000003,0.200000003,0.200000003) + workingVector3.xyz;
    workingVector5.xzw = floor(workingVector3.xyz);
    workingVector5.xzw = float3(0.0625,0.0625,0.0625) * workingVector5.xzw;
    workingVector5.xzw = floor(workingVector5.xzw);
    workingVector5.xzw = (int3)workingVector5.xzw;
    bitMask.x = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector1.x = (((uint)workingVector5.z << 16) & bitMask.x) | ((uint)workingVector5.x & ~bitMask.x);
    workingVector1.z = (int)workingVector5.w & 0x0000ffff;
    workingVector5.xzw = (int3)workingVector5.xzw * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
    workingVector6.xyz = (uint3)workingVector5.xzw >> int3(24,24,24);
    workingVector5.xzw = (int3)workingVector5.xzw ^ (int3)workingVector6.xyz;
    workingVector5.xzw = (int3)workingVector5.xzw * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
    workingVector2.w = (int)workingVector5.x ^ 0x88b16480;
    workingVector2.w = (int)workingVector2.w * 0x5bd1e995;
    workingVector2.w = (int)workingVector5.z ^ (int)workingVector2.w;
    workingVector2.w = (int)workingVector2.w * 0x5bd1e995;
    workingVector2.w = (int)workingVector5.w ^ (int)workingVector2.w;
    workingVector2.w = (int)workingVector2.w * 0x5bd1e995;
    workingVector2.w = (int)workingVector2.w ^ 0;
    workingVector3.w = (uint)workingVector2.w >> 13;
    workingVector2.w = (int)workingVector2.w ^ (int)workingVector3.w;
    workingVector2.w = (int)workingVector2.w * 0x5bd1e995;
    workingVector3.w = (uint)workingVector2.w >> 15;
    workingVector2.w = (int)workingVector2.w ^ (int)workingVector3.w;
    workingVector3.w = (uint)workingVector2.w >> 16;
    workingVector2.w = (int)workingVector2.w ^ (int)workingVector3.w;
    workingVector2.w = workingVector2.w ? 0.000000 : 0;
    workingVector3.w = workingVector2.w ? 0 : 1;
    workingVector2.w = (int)workingVector2.w | (int)workingVector3.w;
    workingVector3.w = (uint)RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x;
    workingVector3.w = (int)workingVector3.w + -1;
    workingVector4.w = workingVector2.w ? workingVector3.w : 0;
    workingVector6.x = workingVector4.w;
    workingVector6.y = 0;
    workingVector5.xz = float2(0,0);
    while (true) {
      workingVector5.w = RD_COMPARISON_MASK((int)workingVector6.y >= 8);
      if (workingVector5.w != 0) break;
      workingVector7.x = sampledResource10[workingVector6.x].val[0/4];
      workingVector7.y = sampledResource10[workingVector6.x].val[0/4+1];
      workingVector7.z = sampledResource10[workingVector6.x].val[0/4+2];
      workingVector7.w = sampledResource10[workingVector6.x].val[0/4+3];
      workingVector5.w = (int)workingVector7.z & 0x0000ffff;
      workingVector6.z = RD_COMPARISON_MASK((int)workingVector5.w == 0);
      workingVector5.w = RD_COMPARISON_MASK((int)workingVector2.w == (int)workingVector5.w);
      workingVector6.w = RD_COMPARISON_MASK((int)workingVector1.x == (int)workingVector7.x);
      workingVector5.w = workingVector5.w ? workingVector6.w : 0;
      workingVector6.w = RD_COMPARISON_MASK((int)workingVector1.z == (int)workingVector7.y);
      workingVector5.w = workingVector5.w ? workingVector6.w : 0;
      workingVector6.w = workingVector5.w ? workingVector7.w : workingVector5.x;
      workingVector7.x = workingVector5.z ? workingVector5.x : workingVector6.w;
      workingVector7.y = (int)workingVector5.w | (int)workingVector5.z;
      workingVector5.w = (int)workingVector6.x + 1;
      workingVector6.x = (int)workingVector3.w & (int)workingVector5.w;
      workingVector5.w = (int)workingVector6.z | (int)workingVector7.y;
      if (workingVector5.w != 0) {
        workingVector5.xz = workingVector7.xy;
        break;
      }
      workingVector6.y = (int)workingVector6.y + 1;
      workingVector5.xz = workingVector7.xy;
    }
    if (workingVector5.z != 0) {
      workingVector1.x = (int)workingVector2.z & 2;
      workingVector6.xyz = float3(0.0625,0.0625,0.0625) * workingVector3.xyz;
      workingVector6.xyz = floor(workingVector6.xyz);
      workingVector3.xyz = -workingVector6.xyz * float3(16,16,16) + workingVector3.xyz;
      workingVector1.z = (uint)workingVector5.x >> 2;
      workingVector1.x = RD_COMPARISON_MASK((int)workingVector1.x == 0);
      workingVector5.xzw = RD_COMPARISON_MASK(abs(workingVector4.zxy) >= float3(1,1,1));
      workingVector2.z = (int)workingVector5.z | (int)workingVector5.x;
      workingVector2.z = (int)workingVector5.w | (int)workingVector2.z;
      workingVector1.x = workingVector1.x ? workingVector2.z : 0;
      if (workingVector1.x != 0) {
        workingVector1.x = dot(workingVector3.yzx, abs(workingVector4.xyz));
        workingVector2.z = dot(workingVector3.zxy, abs(workingVector4.xyz));
        workingVector2.w = dot(workingVector3.xyz, abs(workingVector4.xyz));
        workingVector3.w = workingVector4.z + workingVector4.x;
        workingVector0.y = workingVector5.y * workingVector0.y + workingVector3.w;
        workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.y);
        workingVector3.w = ceil(workingVector1.x);
        workingVector1.x = floor(workingVector1.x);
        workingVector0.y = workingVector0.y ? workingVector3.w : workingVector1.x;
        workingVector1.x = floor(workingVector2.z);
        workingVector3.w = floor(workingVector2.w);
        workingVector5.xyz = abs(workingVector4.yzx) * workingVector1.xxx;
        workingVector5.xyz = abs(workingVector4.zxy) * workingVector0.yyy + workingVector5.xyz;
        workingVector5.xyz = abs(workingVector4.xyz) * workingVector3.www + workingVector5.xyz;
        workingVector7.xyz = workingVector5.xyz + abs(workingVector4.yzx);
        workingVector8.xyz = workingVector5.xyz + abs(workingVector4.xyz);
        workingVector4.xyz = workingVector7.xyz + abs(workingVector4.xyz);
        workingVector0.y = workingVector2.z + -workingVector1.x;
        workingVector1.x = -workingVector3.w + workingVector2.w;
        workingVector2.z = 1 + -workingVector0.y;
        workingVector2.w = 1 + -workingVector1.x;
        workingVector3.w = workingVector2.z * workingVector2.w;
        workingVector2.w = workingVector2.w * workingVector0.y;
        workingVector2.z = workingVector2.z * workingVector1.x;
        workingVector0.y = workingVector1.x * workingVector0.y;
        workingVector9.xyz = RD_COMPARISON_MASK(workingVector5.xyz >= float3(0,0,0));
        workingVector1.x = workingVector9.y ? workingVector9.x : 0;
        workingVector1.x = workingVector9.z ? workingVector1.x : 0;
        workingVector9.xyz = RD_COMPARISON_MASK(workingVector4.xyz < float3(16,16,16));
        workingVector4.w = workingVector9.y ? workingVector9.x : 0;
        workingVector4.w = workingVector9.z ? workingVector4.w : 0;
        workingVector1.x = (int)workingVector1.x & (int)workingVector4.w;
        if (workingVector1.x != 0) {
          workingVector9.xyz = (uint3)workingVector5.xyz;
          workingVector10.xyz = (uint3)workingVector7.xyz;
          workingVector11.xyz = (uint3)workingVector8.xyz;
          workingVector12.xyz = (uint3)workingVector4.xyz;
          workingVector9.xz = (uint2)workingVector9.zx << int2(4,8);
          workingVector1.x = (int)workingVector9.x + (int)workingVector9.y;
          workingVector1.x = (int)workingVector9.z + (int)workingVector1.x;
          workingVector1.x = (int)workingVector1.x + (int)workingVector1.z;
          workingVector9.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector9.yzw = (uint3)workingVector9.xxx >> int3(8,16,24);
          workingVector13.xyzw = (int4)workingVector9.xyzw & int4(255,255,255,255);
          workingVector13.xyzw = (uint4)workingVector13.xyzw;
          workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
          workingVector9.yzw = workingVector13.xyz * workingVector13.www;
          workingVector9.yzw = float3(6,6,6) * workingVector9.yzw;
          workingVector9.xyz = workingVector9.xxx ? workingVector9.yzw : float3(0,0,0);
          workingVector10.xz = (uint2)workingVector10.zx << int2(4,8);
          workingVector1.x = (int)workingVector10.x + (int)workingVector10.y;
          workingVector1.x = (int)workingVector10.z + (int)workingVector1.x;
          workingVector1.x = (int)workingVector1.x + (int)workingVector1.z;
          workingVector10.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector10.yzw = (uint3)workingVector10.xxx >> int3(8,16,24);
          workingVector13.xyzw = (int4)workingVector10.xyzw & int4(255,255,255,255);
          workingVector13.xyzw = (uint4)workingVector13.xyzw;
          workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
          workingVector10.yzw = workingVector13.xyz * workingVector13.www;
          workingVector10.yzw = float3(6,6,6) * workingVector10.yzw;
          workingVector10.xyz = workingVector10.xxx ? workingVector10.yzw : float3(0,0,0);
          workingVector11.xz = (uint2)workingVector11.zx << int2(4,8);
          workingVector1.x = (int)workingVector11.x + (int)workingVector11.y;
          workingVector1.x = (int)workingVector11.z + (int)workingVector1.x;
          workingVector1.x = (int)workingVector1.x + (int)workingVector1.z;
          workingVector11.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector11.yzw = (uint3)workingVector11.xxx >> int3(8,16,24);
          workingVector13.xyzw = (int4)workingVector11.xyzw & int4(255,255,255,255);
          workingVector13.xyzw = (uint4)workingVector13.xyzw;
          workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
          workingVector11.yzw = workingVector13.xyz * workingVector13.www;
          workingVector11.yzw = float3(6,6,6) * workingVector11.yzw;
          workingVector11.xyz = workingVector11.xxx ? workingVector11.yzw : float3(0,0,0);
          workingVector12.xz = (uint2)workingVector12.zx << int2(4,8);
          workingVector1.x = (int)workingVector12.x + (int)workingVector12.y;
          workingVector1.x = (int)workingVector12.z + (int)workingVector1.x;
          workingVector1.x = (int)workingVector1.x + (int)workingVector1.z;
          workingVector12.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector12.yzw = (uint3)workingVector12.xxx >> int3(8,16,24);
          workingVector13.xyzw = (int4)workingVector12.xyzw & int4(255,255,255,255);
          workingVector13.xyzw = (uint4)workingVector13.xyzw;
          workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
          workingVector12.yzw = workingVector13.xyz * workingVector13.www;
          workingVector12.yzw = float3(6,6,6) * workingVector12.yzw;
          workingVector12.xyz = workingVector12.xxx ? workingVector12.yzw : float3(0,0,0);
        } else {
          workingVector13.xyz = workingVector6.xyz * float3(16,16,16) + workingVector5.xyz;
          workingVector14.xyz = RD_COMPARISON_MASK(workingVector5.xyz < float3(0,0,0));
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector5.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.x = (((uint)workingVector14.x << 0) & bitMask.x) | ((uint)workingVector15.x & ~bitMask.x);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector14.y = (((uint)workingVector14.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
          workingVector1.x = (int)workingVector1.x + (int)workingVector14.x;
          workingVector1.x = (int)workingVector15.y + (int)workingVector1.x;
          workingVector1.x = (int)workingVector14.y + (int)workingVector1.x;
          workingVector1.x = (int)workingVector15.z + (int)workingVector1.x;
          workingVector4.w = RD_COMPARISON_MASK((int)icb[workingVector1.x+0].x < 0);
          workingVector5.xyz = (uint3)workingVector5.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector5.x = (((uint)workingVector5.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector5.z = (((uint)workingVector5.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.x = (((uint)workingVector5.y << 0) & bitMask.x) | ((uint)workingVector5.x & ~bitMask.x);
          workingVector5.x = (int)workingVector5.z + (int)workingVector5.x;
          workingVector5.x = (int)workingVector1.z + (int)workingVector5.x;
          workingVector5.yz = (int2)workingVector1.zz + int2(4096,4097);
          workingVector5.y = sampledResource11[workingVector5.y].val[0/4];
          workingVector5.w = 1 << (int)icb[workingVector1.x+0].x;
          workingVector5.w = (int)workingVector5.w & (int)workingVector5.y;
          workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 0);
          workingVector1.x = (int)workingVector5.z + (int)icb[workingVector1.x+0].x;
          workingVector1.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector1.x = (uint)workingVector1.x >> 2;
          workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xyz;
          workingVector14.xyz = floor(workingVector14.xyz);
          workingVector13.xyz = -workingVector14.xyz * float3(16,16,16) + workingVector13.xyz;
          workingVector13.xyz = (uint3)workingVector13.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
          workingVector6.w = (int)workingVector13.z + (int)workingVector6.w;
          workingVector1.x = (int)workingVector1.x + (int)workingVector6.w;
          workingVector1.x = workingVector4.w ? workingVector5.x : workingVector1.x;
          workingVector4.w = workingVector4.w ? 0 : workingVector5.w;
          workingVector13.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector13.yzw = (uint3)workingVector13.xxx >> int3(8,16,24);
          workingVector14.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
          workingVector14.xyzw = (uint4)workingVector14.xyzw;
          workingVector14.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector14.xyzw;
          workingVector13.yzw = workingVector14.xyz * workingVector14.www;
          workingVector13.yzw = float3(6,6,6) * workingVector13.yzw;
          workingVector13.xyz = workingVector13.xxx ? workingVector13.yzw : float3(0,0,0);
          workingVector9.xyz = workingVector4.www ? float3(0,0,0) : workingVector13.xyz;
          workingVector13.xyz = workingVector6.xyz * float3(16,16,16) + workingVector7.xyz;
          workingVector14.xyz = RD_COMPARISON_MASK(workingVector7.xyz < float3(0,0,0));
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector7.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.x = (((uint)workingVector14.x << 0) & bitMask.x) | ((uint)workingVector15.x & ~bitMask.x);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector5.x = (((uint)workingVector14.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector5.w = (((uint)workingVector14.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
          workingVector1.x = (int)workingVector1.x + (int)workingVector5.x;
          workingVector1.x = (int)workingVector15.y + (int)workingVector1.x;
          workingVector1.x = (int)workingVector5.w + (int)workingVector1.x;
          workingVector1.x = (int)workingVector15.z + (int)workingVector1.x;
          workingVector4.w = RD_COMPARISON_MASK((int)icb[workingVector1.x+0].x < 0);
          workingVector7.xyz = (uint3)workingVector7.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector5.x = (((uint)workingVector7.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector5.w = (((uint)workingVector7.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.x = (((uint)workingVector7.y << 0) & bitMask.x) | ((uint)workingVector5.x & ~bitMask.x);
          workingVector5.x = (int)workingVector5.w + (int)workingVector5.x;
          workingVector5.x = (int)workingVector1.z + (int)workingVector5.x;
          workingVector5.w = 1 << (int)icb[workingVector1.x+0].x;
          workingVector5.w = (int)workingVector5.w & (int)workingVector5.y;
          workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 0);
          workingVector1.x = (int)workingVector5.z + (int)icb[workingVector1.x+0].x;
          workingVector1.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector1.x = (uint)workingVector1.x >> 2;
          workingVector7.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xyz;
          workingVector7.xyz = floor(workingVector7.xyz);
          workingVector7.xyz = -workingVector7.xyz * float3(16,16,16) + workingVector13.xyz;
          workingVector7.xyz = (uint3)workingVector7.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector7.x = (((uint)workingVector7.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector7.z = (((uint)workingVector7.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector7.y << 0) & bitMask.w) | ((uint)workingVector7.x & ~bitMask.w);
          workingVector6.w = (int)workingVector7.z + (int)workingVector6.w;
          workingVector1.x = (int)workingVector1.x + (int)workingVector6.w;
          workingVector1.x = workingVector4.w ? workingVector5.x : workingVector1.x;
          workingVector4.w = workingVector4.w ? 0 : workingVector5.w;
          workingVector7.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector7.yzw = (uint3)workingVector7.xxx >> int3(8,16,24);
          workingVector13.xyzw = (int4)workingVector7.xyzw & int4(255,255,255,255);
          workingVector13.xyzw = (uint4)workingVector13.xyzw;
          workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
          workingVector7.yzw = workingVector13.xyz * workingVector13.www;
          workingVector7.yzw = float3(6,6,6) * workingVector7.yzw;
          workingVector7.xyz = workingVector7.xxx ? workingVector7.yzw : float3(0,0,0);
          workingVector10.xyz = workingVector4.www ? float3(0,0,0) : workingVector7.xyz;
          workingVector7.xyz = workingVector6.xyz * float3(16,16,16) + workingVector8.xyz;
          workingVector13.xyz = RD_COMPARISON_MASK(workingVector8.xyz < float3(0,0,0));
          workingVector14.xyz = RD_COMPARISON_MASK(workingVector8.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector14.y = (((uint)workingVector14.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.x = (((uint)workingVector13.x << 0) & bitMask.x) | ((uint)workingVector14.x & ~bitMask.x);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector5.x = (((uint)workingVector13.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector5.w = (((uint)workingVector13.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
          workingVector1.x = (int)workingVector1.x + (int)workingVector5.x;
          workingVector1.x = (int)workingVector14.y + (int)workingVector1.x;
          workingVector1.x = (int)workingVector5.w + (int)workingVector1.x;
          workingVector1.x = (int)workingVector14.z + (int)workingVector1.x;
          workingVector4.w = RD_COMPARISON_MASK((int)icb[workingVector1.x+0].x < 0);
          workingVector8.xyz = (uint3)workingVector8.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector5.x = (((uint)workingVector8.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector5.w = (((uint)workingVector8.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.x = (((uint)workingVector8.y << 0) & bitMask.x) | ((uint)workingVector5.x & ~bitMask.x);
          workingVector5.x = (int)workingVector5.w + (int)workingVector5.x;
          workingVector5.x = (int)workingVector1.z + (int)workingVector5.x;
          workingVector5.w = 1 << (int)icb[workingVector1.x+0].x;
          workingVector5.w = (int)workingVector5.w & (int)workingVector5.y;
          workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 0);
          workingVector1.x = (int)workingVector5.z + (int)icb[workingVector1.x+0].x;
          workingVector1.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector1.x = (uint)workingVector1.x >> 2;
          workingVector8.xyz = float3(0.0625,0.0625,0.0625) * workingVector7.xyz;
          workingVector8.xyz = floor(workingVector8.xyz);
          workingVector7.xyz = -workingVector8.xyz * float3(16,16,16) + workingVector7.xyz;
          workingVector7.xyz = (uint3)workingVector7.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector7.x = (((uint)workingVector7.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector7.z = (((uint)workingVector7.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector7.y << 0) & bitMask.w) | ((uint)workingVector7.x & ~bitMask.w);
          workingVector6.w = (int)workingVector7.z + (int)workingVector6.w;
          workingVector1.x = (int)workingVector1.x + (int)workingVector6.w;
          workingVector1.x = workingVector4.w ? workingVector5.x : workingVector1.x;
          workingVector4.w = workingVector4.w ? 0 : workingVector5.w;
          workingVector7.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector7.yzw = (uint3)workingVector7.xxx >> int3(8,16,24);
          workingVector8.xyzw = (int4)workingVector7.xyzw & int4(255,255,255,255);
          workingVector8.xyzw = (uint4)workingVector8.xyzw;
          workingVector8.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector8.xyzw;
          workingVector7.yzw = workingVector8.xyz * workingVector8.www;
          workingVector7.yzw = float3(6,6,6) * workingVector7.yzw;
          workingVector7.xyz = workingVector7.xxx ? workingVector7.yzw : float3(0,0,0);
          workingVector11.xyz = workingVector4.www ? float3(0,0,0) : workingVector7.xyz;
          workingVector7.xyz = workingVector6.xyz * float3(16,16,16) + workingVector4.xyz;
          workingVector8.xyz = RD_COMPARISON_MASK(workingVector4.xyz < float3(0,0,0));
          workingVector13.xyz = RD_COMPARISON_MASK(workingVector4.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector13.y = (((uint)workingVector13.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.x = (((uint)workingVector8.x << 0) & bitMask.x) | ((uint)workingVector13.x & ~bitMask.x);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector5.x = (((uint)workingVector8.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector5.w = (((uint)workingVector8.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
          workingVector1.x = (int)workingVector1.x + (int)workingVector5.x;
          workingVector1.x = (int)workingVector13.y + (int)workingVector1.x;
          workingVector1.x = (int)workingVector5.w + (int)workingVector1.x;
          workingVector1.x = (int)workingVector13.z + (int)workingVector1.x;
          workingVector4.w = RD_COMPARISON_MASK((int)icb[workingVector1.x+0].x < 0);
          workingVector4.xyz = (uint3)workingVector4.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector4.x = (((uint)workingVector4.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector4.z = (((uint)workingVector4.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector4.x = (((uint)workingVector4.y << 0) & bitMask.x) | ((uint)workingVector4.x & ~bitMask.x);
          workingVector4.x = (int)workingVector4.z + (int)workingVector4.x;
          workingVector4.x = (int)workingVector1.z + (int)workingVector4.x;
          workingVector4.y = 1 << (int)icb[workingVector1.x+0].x;
          workingVector4.y = (int)workingVector4.y & (int)workingVector5.y;
          workingVector4.y = RD_COMPARISON_MASK((int)workingVector4.y == 0);
          workingVector1.x = (int)workingVector5.z + (int)icb[workingVector1.x+0].x;
          workingVector1.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector1.x = (uint)workingVector1.x >> 2;
          workingVector5.xyz = float3(0.0625,0.0625,0.0625) * workingVector7.xyz;
          workingVector5.xyz = floor(workingVector5.xyz);
          workingVector5.xyz = -workingVector5.xyz * float3(16,16,16) + workingVector7.xyz;
          workingVector5.xyz = (uint3)workingVector5.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector5.x = (((uint)workingVector5.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector5.z = (((uint)workingVector5.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector4.z = (((uint)workingVector5.y << 0) & bitMask.z) | ((uint)workingVector5.x & ~bitMask.z);
          workingVector4.z = (int)workingVector5.z + (int)workingVector4.z;
          workingVector1.x = (int)workingVector1.x + (int)workingVector4.z;
          workingVector1.x = workingVector4.w ? workingVector4.x : workingVector1.x;
          workingVector4.x = workingVector4.w ? 0 : workingVector4.y;
          workingVector5.x = sampledResource11[workingVector1.x].val[0/4];
          workingVector5.yzw = (uint3)workingVector5.xxx >> int3(8,16,24);
          workingVector7.xyzw = (int4)workingVector5.xyzw & int4(255,255,255,255);
          workingVector7.xyzw = (uint4)workingVector7.xyzw;
          workingVector7.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector7.xyzw;
          workingVector4.yzw = workingVector7.xyz * workingVector7.www;
          workingVector4.yzw = float3(6,6,6) * workingVector4.yzw;
          workingVector4.yzw = workingVector5.xxx ? workingVector4.yzw : float3(0,0,0);
          workingVector12.xyz = workingVector4.xxx ? float3(0,0,0) : workingVector4.yzw;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
  workingVector5.xz = floatingPointResult.xy;
  workingVector1.xy = workingVector5.xz * workingVector1.xy;
  workingVector7.xy = (int2)workingVector1.xy;
  workingVector7.zw = float2(0,0);
  workingVector7.xyzw = materialTexture2.Load(workingVector7.xyz).xyzw;
  workingVector1.x = (int)workingVector7.w & 255;
  workingVector1.x = (uint)workingVector1.x;
  workingVector1.x = 0.00392156886 * workingVector1.x;
  if (8 == 0) workingVector1.y = 0; else if (8+8 < 32) {   workingVector1.y = (uint)workingVector7.w << (32-(8 + 8)); workingVector1.y = (uint)workingVector1.y >> (32-8);  } else workingVector1.y = (uint)workingVector7.w >> 8;
  workingVector4.w = 1 + -workingVector3.w;
  workingVector5.x = RD_COMPARISON_MASK(workingVector1.z != 1.000000);
  if (workingVector5.x != 0) {
    workingVector5.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z);
    if (workingVector5.x != 0) {
      workingVector5.x = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * -workingVector2.z;
      workingVector5.z = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w * workingVector5.x;
      workingVector5.w = workingVector5.x * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w + workingVector2.x;
      workingVector5.xz = workingVector5.xz + workingVector5.xz;
      workingVector5.z = saturate(workingVector5.w / workingVector5.z);
      workingVector5.w = -workingVector2.z * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z + workingVector2.y;
      workingVector5.x = saturate(workingVector5.w / workingVector5.x);
      workingVector8.xy = RD_COMPARISON_MASK(-workingVector2.zz < RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.xy);
      workingVector5.w = log2(-workingVector2.z);
      workingVector5.w = -RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z + workingVector5.w;
      workingVector5.w = saturate(RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x * workingVector5.w);
      workingVector9.xyzw = float4(-2,-1,-1,-1) + RD_UNIFORM_CLUSTER_DIMENSIONS.zzxy;
      workingVector5.w = workingVector9.x * workingVector5.w;
      workingVector5.w = floor(workingVector5.w);
      workingVector5.w = 2 + workingVector5.w;
      workingVector5.w = min(workingVector5.w, workingVector9.y);
      workingVector5.w = workingVector8.y ? 1 : workingVector5.w;
      workingVector5.w = workingVector8.x ? 0 : workingVector5.w;
      workingVector5.xz = RD_UNIFORM_CLUSTER_DIMENSIONS.yx * workingVector5.xz;
      workingVector5.xz = floor(workingVector5.xz);
      workingVector5.xz = min(workingVector5.xz, workingVector9.wz);
      workingVector7.w = RD_COMPARISON_MASK(workingVector5.z < 0);
      workingVector8.x = RD_COMPARISON_MASK(workingVector5.x < 0);
      workingVector7.w = (int)workingVector7.w | (int)workingVector8.x;
      workingVector8.x = RD_COMPARISON_MASK(workingVector5.w < 0);
      workingVector7.w = (int)workingVector7.w | (int)workingVector8.x;
      workingVector8.x = RD_COMPARISON_MASK(workingVector5.z >= RD_UNIFORM_CLUSTER_DIMENSIONS.x);
      workingVector7.w = (int)workingVector7.w | (int)workingVector8.x;
      workingVector8.x = RD_COMPARISON_MASK(workingVector5.x >= RD_UNIFORM_CLUSTER_DIMENSIONS.y);
      workingVector7.w = (int)workingVector7.w | (int)workingVector8.x;
      workingVector8.x = RD_COMPARISON_MASK(workingVector5.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.z);
      workingVector7.w = (int)workingVector7.w | (int)workingVector8.x;
      if (workingVector7.w == 0) {
        workingVector0.x = RD_UNIFORM_SUB_PIXEL_OFFSET.x + workingVector0.x;
        workingVector0.y = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + workingVector0.y;
        workingVector8.z = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector0.x;
        workingVector8.x = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector0.y;
        workingVector8.y = RD_UNIFORM_INV_PROJ_ROW_3.z;
        workingVector8.xyz = workingVector8.xyz / workingVector1.www;
        workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector8.xxx;
        workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector8.zzz + workingVector9.xyz;
        workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector8.yyy + workingVector9.xyz;
        workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector9.xyz;
        workingVector9.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector9.xyz;
        workingVector10.xyz = ddx_coarse(workingVector8.yzx);
        workingVector0.x = dot(workingVector10.xyz, workingVector10.xyz);
        workingVector0.x = rsqrt(workingVector0.x);
        workingVector10.xyz = workingVector10.xyz * workingVector0.xxx;
        workingVector8.xyz = -workingVector8.xyz;
        workingVector8.xyz = ddy_coarse(workingVector8.xyz);
        workingVector0.x = dot(workingVector8.xyz, workingVector8.xyz);
        workingVector0.x = rsqrt(workingVector0.x);
        workingVector8.xyz = workingVector8.xyz * workingVector0.xxx;
        workingVector11.xyz = workingVector10.xyz * workingVector8.xyz;
        workingVector8.xyz = workingVector10.zxy * workingVector8.yzx + -workingVector11.xyz;
        workingVector0.x = dot(workingVector8.xyz, workingVector8.xyz);
        workingVector0.x = rsqrt(workingVector0.x);
        workingVector8.xyz = workingVector8.xyz * workingVector0.xxx;
        workingVector10.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector8.yyy;
        workingVector8.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector8.xxx + workingVector10.xyz;
        workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector8.zzz + workingVector8.xyw;
        workingVector0.x = dot(workingVector8.xyz, workingVector8.xyz);
        workingVector0.x = rsqrt(workingVector0.x);
        workingVector8.xyz = workingVector8.xyz * workingVector0.xxx;
        workingVector8.xyz = workingVector8.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
        workingVector8.xyz = round(workingVector8.xyz);
        workingVector8.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector8.xyz;
        workingVector0.x = dot(workingVector8.xyz, workingVector8.xyz);
        workingVector0.x = rsqrt(workingVector0.x);
        workingVector8.xyz = workingVector8.xyz * workingVector0.xxx;
        workingVector10.xyz = workingVector9.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
        workingVector10.xyz = floor(workingVector10.xyz);
        workingVector10.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector10.xyz + workingVector9.xyz;
        workingVector10.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector10.xyz;
        workingVector0.x = dot(workingVector10.xyz, workingVector8.xyz);
        workingVector8.xyz = -workingVector0.xxx * workingVector8.xyz + workingVector10.xyz;
        workingVector8.xyz = workingVector9.xyz + workingVector8.xyz;
        workingVector8.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector8.xyz;
        workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector4.xxx;
        workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector4.zzz + workingVector9.xyz;
        workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector4.yyy + workingVector9.xyz;
        workingVector0.x = dot(workingVector9.xyz, workingVector9.xyz);
        workingVector0.x = rsqrt(workingVector0.x);
        workingVector9.xyz = workingVector9.xyz * workingVector0.xxx;
        workingVector0.x = 0.498039216 + -workingVector6.w;
        workingVector0.x = saturate(2.00787401 * workingVector0.x);
        if (8 == 0) workingVector0.y = 0; else if (8+8 < 32) {         workingVector0.y = (uint)workingVector7.x << (32-(8 + 8)); workingVector0.y = (uint)workingVector0.y >> (32-8);        } else workingVector0.y = (uint)workingVector7.x >> 8;
        workingVector0.y = (uint)workingVector0.y;
        workingVector0.y = 0.00392156886 * workingVector0.y;
        workingVector1.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
        workingVector10.xyz = max(float3(0,0,0), workingVector6.xyz);
        workingVector10.xyz = log2(workingVector10.xyz);
        workingVector10.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector10.xyz;
        workingVector10.xyz = exp2(workingVector10.xyz);
        workingVector11.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector6.xyz;
        workingVector12.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector6.xyz;
        workingVector12.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector12.xyz;
        workingVector12.xyz = log2(workingVector12.xyz);
        workingVector12.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector12.xyz;
        workingVector12.xyz = exp2(workingVector12.xyz);
        workingVector6.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector6.xyz);
        workingVector6.xyz = workingVector6.xyz ? workingVector11.xyz : workingVector12.xyz;
        workingVector6.xyz = workingVector1.www ? workingVector10.xyz : workingVector6.xyz;
        workingVector7.xw = float2(0.0399999991,0.318309873) * workingVector4.ww;
        workingVector6.xyz = workingVector6.xyz * workingVector3.www + workingVector7.xxx;
        workingVector1.w = dot(workingVector2.xyz, workingVector2.xyz);
        workingVector1.w = sqrt(workingVector1.w);
        workingVector1.w = 9.99999975e-005 + workingVector1.w;
        workingVector10.xyz = workingVector2.xyz / workingVector1.www;
        workingVector0.x = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * workingVector0.x;
        workingVector1.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
        workingVector1.w = RD_COMPARISON_MASK(0 < (int)workingVector1.w);
        workingVector8.xyz = workingVector1.www ? workingVector8.xyz : workingVector3.xyz;
        workingVector1.w = workingVector5.x * RD_UNIFORM_CLUSTER_DIMENSIONS.x + workingVector5.z;
        workingVector3.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector5.w;
        workingVector1.w = workingVector3.w * RD_UNIFORM_CLUSTER_DIMENSIONS.y + workingVector1.w;
        workingVector1.w = (int)workingVector1.w;
        workingVector3.w = (int)RD_UNIFORM_CLUSTER_DIMENSIONS.w;
        workingVector5.x = (int)workingVector1.w * (int)workingVector3.w;
        workingVector1.w = mad((int)workingVector1.w, (int)workingVector3.w, (int)workingVector3.w);
        workingVector3.w = dot(workingVector9.xyz, -workingVector10.xyz);
        workingVector3.w = max(0, workingVector3.w);
        workingVector5.z = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
        workingVector5.z = workingVector5.z * workingVector5.z;
        workingVector0.y = max(0.0500000007, workingVector0.y);
        workingVector0.y = workingVector0.y * workingVector0.y;
        workingVector5.w = workingVector0.y * workingVector0.y;
        workingVector6.w = workingVector0.y * workingVector0.y + -1;
        workingVector7.x = 0.5 * workingVector0.y;
        workingVector0.y = -workingVector0.y * 0.5 + 1;
        workingVector8.w = workingVector3.w * workingVector0.y + workingVector7.x;
        workingVector8.w = 9.99999975e-005 + workingVector8.w;
        workingVector8.w = workingVector3.w / workingVector8.w;
        workingVector11.xyz = float3(1,1,1) + -workingVector6.xyz;
        workingVector9.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x);
        workingVector10.w = RD_COMPARISON_MASK(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.000000);
        workingVector11.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x);
        workingVector12.x = RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
        workingVector12.yz = float2(0.5,0.5) / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xy;
        workingVector12.w = RD_COMPARISON_MASK(0 < workingVector0.x);
        workingVector12.x = 1 / workingVector12.x;
        workingVector13.xyz = float3(0,0,0);
        workingVector14.xyz = float3(0,0,0);
        workingVector13.w = workingVector5.x;
        while (true) {
          workingVector14.w = RD_COMPARISON_MASK((int)workingVector13.w >= (int)workingVector1.w);
          if (workingVector14.w != 0) break;
          workingVector14.w = sampledResource12[workingVector13.w].val[0/4];
          workingVector14.w = (int)workingVector14.w;
          workingVector15.x = RD_COMPARISON_MASK((int)workingVector14.w < 0);
          if (workingVector15.x != 0) {
            break;
          }
          workingVector15.x = sampledResource13[workingVector14.w].val[0/4];
          workingVector15.y = sampledResource13[workingVector14.w].val[0/4+1];
          workingVector15.z = sampledResource13[workingVector14.w].val[0/4+2];
          workingVector16.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector15.yyy;
          workingVector16.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector15.xxx + workingVector16.xyz;
          workingVector16.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector15.zzz + workingVector16.xyz;
          workingVector16.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector16.xyz;
          workingVector16.xyz = workingVector16.xyz + -workingVector2.xyz;
          workingVector15.w = dot(workingVector16.xyz, workingVector16.xyz);
          workingVector15.w = rsqrt(workingVector15.w);
          workingVector17.xyz = workingVector16.xyz * workingVector15.www;
          workingVector16.w = dot(workingVector9.xyz, workingVector17.xyz);
          workingVector17.w = max(0, workingVector16.w);
          workingVector16.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector16.w;
          workingVector16.w = workingVector16.w / workingVector5.z;
          workingVector16.w = max(0, workingVector16.w);
          workingVector16.w = workingVector16.w + -workingVector17.w;
          workingVector16.w = workingVector0.x * workingVector16.w + workingVector17.w;
          workingVector17.x = dot(-workingVector9.xyz, workingVector17.xyz);
          workingVector17.x = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector17.x;
          workingVector17.x = workingVector17.x / workingVector5.z;
          workingVector17.x = max(0, workingVector17.x);
          workingVector17.x = workingVector17.x * workingVector0.x;
          workingVector16.xyz = workingVector16.xyz * workingVector15.www + -workingVector10.xyz;
          workingVector15.w = dot(workingVector16.xyz, workingVector16.xyz);
          workingVector15.w = rsqrt(workingVector15.w);
          workingVector16.xyz = workingVector16.xyz * workingVector15.www;
          workingVector15.w = dot(workingVector9.xyz, workingVector16.xyz);
          workingVector15.w = max(0, workingVector15.w);
          workingVector15.w = workingVector15.w * workingVector15.w;
          workingVector15.w = workingVector15.w * workingVector6.w + 1;
          workingVector15.w = workingVector15.w * workingVector15.w;
          workingVector15.w = 3.14159274 * workingVector15.w;
          workingVector15.w = workingVector5.w / workingVector15.w;
          workingVector17.y = workingVector17.w * workingVector0.y + workingVector7.x;
          workingVector17.y = 9.99999975e-005 + workingVector17.y;
          workingVector17.y = workingVector17.w / workingVector17.y;
          workingVector17.y = workingVector17.y * workingVector8.w;
          workingVector16.x = dot(-workingVector10.xyz, workingVector16.xyz);
          workingVector16.x = max(0, workingVector16.x);
          workingVector16.x = 1 + -workingVector16.x;
          workingVector16.x = max(0, workingVector16.x);
          workingVector16.y = workingVector16.x * workingVector16.x;
          workingVector16.y = workingVector16.y * workingVector16.y;
          workingVector16.x = workingVector16.y * workingVector16.x;
          workingVector16.xyz = workingVector11.xyz * workingVector16.xxx + workingVector6.xyz;
          workingVector18.xyz = float3(1,1,1) + -workingVector16.xyz;
          workingVector18.xyz = workingVector18.xyz * workingVector16.www;
          workingVector18.xyz = workingVector18.xyz * workingVector7.www;
          workingVector16.w = workingVector17.x * workingVector7.w;
          workingVector16.xyz = workingVector16.xyz * workingVector15.www;
          workingVector16.xyz = workingVector16.xyz * workingVector17.yyy;
          workingVector15.w = workingVector17.w * workingVector3.w;
          workingVector15.w = workingVector15.w * 4 + 9.99999975e-005;
          workingVector16.xyz = workingVector16.xyz / workingVector15.www;
          workingVector16.xyz = workingVector17.www * workingVector16.xyz;
          workingVector15.w = RD_COMPARISON_MASK((int)workingVector14.w >= 0);
          if (workingVector15.w != 0) {
            workingVector17.x = sampledResource13[workingVector14.w].val[0/4];
            workingVector17.y = sampledResource13[workingVector14.w].val[0/4+1];
            workingVector17.z = sampledResource13[workingVector14.w].val[0/4+2];
            workingVector17.w = sampledResource13[workingVector14.w].val[0/4+3];
            workingVector17.xyz = workingVector17.xyz + -workingVector3.xyz;
            workingVector15.w = abs(workingVector17.x) + abs(workingVector17.y);
            workingVector15.w = workingVector15.w + abs(workingVector17.z);
            workingVector15.w = workingVector15.w * workingVector15.w;
            workingVector17.x = dot(workingVector17.xyz, workingVector17.xyz);
            workingVector15.w = workingVector9.w ? workingVector15.w : workingVector17.x;
            workingVector17.x = workingVector17.w * workingVector17.w;
            workingVector17.x = RD_COMPARISON_MASK(workingVector15.w < workingVector17.x);
            if (workingVector17.x != 0) {
              if (workingVector10.w != 0) {
                workingVector19.x = sampledResource13[workingVector14.w].val[32/4];
                workingVector19.y = sampledResource13[workingVector14.w].val[32/4+1];
                workingVector19.z = sampledResource13[workingVector14.w].val[32/4+2];
                workingVector19.w = sampledResource13[workingVector14.w].val[32/4+3];
                workingVector20.x = sampledResource13[workingVector14.w].val[48/4];
                workingVector20.y = sampledResource13[workingVector14.w].val[48/4+1];
                workingVector20.z = sampledResource13[workingVector14.w].val[48/4+2];
                workingVector20.w = sampledResource13[workingVector14.w].val[48/4+3];
                workingVector21.x = sampledResource13[workingVector14.w].val[64/4];
                workingVector21.y = sampledResource13[workingVector14.w].val[64/4+1];
                workingVector21.z = sampledResource13[workingVector14.w].val[64/4+2];
                workingVector21.w = sampledResource13[workingVector14.w].val[64/4+3];
                workingVector22.x = sampledResource13[workingVector14.w].val[80/4];
                workingVector22.y = sampledResource13[workingVector14.w].val[80/4+1];
                workingVector22.z = sampledResource13[workingVector14.w].val[80/4+2];
                workingVector22.w = sampledResource13[workingVector14.w].val[80/4+3];
                workingVector23.x = sampledResource13[workingVector14.w].val[96/4];
                workingVector23.y = sampledResource13[workingVector14.w].val[96/4+1];
                workingVector23.z = sampledResource13[workingVector14.w].val[96/4+2];
                workingVector23.w = sampledResource13[workingVector14.w].val[96/4+3];
                workingVector24.x = sampledResource13[workingVector14.w].val[112/4];
                workingVector24.y = sampledResource13[workingVector14.w].val[112/4+1];
                workingVector24.z = sampledResource13[workingVector14.w].val[112/4+2];
                workingVector24.w = sampledResource13[workingVector14.w].val[112/4+3];
                workingVector25.xyz = -workingVector15.xyz + workingVector8.xyz;
                workingVector15.xyz = RD_COMPARISON_MASK(abs(workingVector25.xxy) >= abs(workingVector25.yzz));
                workingVector15.x = workingVector15.y ? workingVector15.x : 0;
                workingVector17.xyz = RD_COMPARISON_MASK(workingVector25.xyz >= float3(0,0,0));
                workingVector17.xyz = workingVector17.xyz ? float3(0,2.80259693e-045,5.60519386e-045) : float3(1,3,5);
                workingVector15.y = workingVector15.z ? workingVector17.y : workingVector17.z;
                workingVector15.x = workingVector15.x ? workingVector17.x : workingVector15.y;
                workingVector26.xyzw = RD_COMPARISON_MASK((int4)workingVector15.xxxx == int4(1,2,3,4));
                workingVector15.x = RD_COMPARISON_MASK((int)workingVector15.x == 5);
                workingVector19.xyzw = workingVector15.xxxx ? workingVector24.xyzw : workingVector19.xyzw;
                workingVector19.xyzw = workingVector26.wwww ? workingVector23.xyzw : workingVector19.xyzw;
                workingVector19.xyzw = workingVector26.zzzz ? workingVector22.xyzw : workingVector19.xyzw;
                workingVector19.xyzw = workingVector26.yyyy ? workingVector21.xyzw : workingVector19.xyzw;
                workingVector19.xyzw = workingVector26.xxxx ? workingVector20.xyzw : workingVector19.xyzw;
                workingVector15.yz = RD_COMPARISON_MASK(workingVector19.zw == float2(0,0));
                workingVector15.y = workingVector15.z ? workingVector15.y : 0;
                if (workingVector15.y == 0) {
                  workingVector25.w = -workingVector25.x;
                  workingVector15.xy = workingVector15.xx ? workingVector25.xz : workingVector25.zw;
                  workingVector15.xz = workingVector26.ww ? -workingVector25.xz : workingVector15.xy;
                  workingVector17.xyz = float3(-1,1,1) * workingVector25.xzy;
                  workingVector15.y = workingVector17.z;
                  workingVector15.xyz = workingVector26.zzz ? workingVector17.xyz : workingVector15.xyz;
                  workingVector15.xyz = workingVector26.yyy ? -workingVector25.xzy : workingVector15.xyz;
                  workingVector17.xyz = float3(-1,1,1) * workingVector25.zyx;
                  workingVector15.xyz = workingVector26.xxx ? workingVector17.xyz : workingVector15.xyz;
                  workingVector20.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.xyzw * workingVector15.yyyy;
                  workingVector20.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.xyzw * workingVector15.xxxx + workingVector20.xyzw;
                  workingVector20.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.xyzw * workingVector15.zzzz + workingVector20.xyzw;
                  workingVector20.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.xyzw + workingVector20.xyzw;
                  workingVector17.x = dot(-workingVector25.xyz, -workingVector25.xyz);
                  workingVector17.x = rsqrt(workingVector17.x);
                  workingVector17.xyz = -workingVector25.xyz * workingVector17.xxx;
                  workingVector17.x = dot(workingVector17.yzx, workingVector4.xyz);
                  workingVector17.x = max(RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x, workingVector17.x);
                  workingVector17.x = min(1, workingVector17.x);
                  workingVector17.y = -workingVector17.x * workingVector17.x + 1;
                  workingVector17.y = sqrt(workingVector17.y);
                  workingVector17.x = workingVector17.y / workingVector17.x;
                  workingVector17.x = RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y * workingVector17.x + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x;
                  workingVector21.xyz = workingVector19.zzw + -workingVector19.xxy;
                  workingVector22.xyz = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xxy * workingVector21.xyz;
                  workingVector17.y = max(1, workingVector22.x);
                  workingVector17.y = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / workingVector17.y;
                  workingVector20.z = -workingVector17.x * workingVector17.y + workingVector20.z;
                  workingVector17.xyz = workingVector20.xyz / workingVector20.www;
                  workingVector20.xy = workingVector17.xy * float2(0.5,0.5) + float2(0.5,0.5);
                  workingVector21.xw = workingVector19.xy + workingVector12.yz;
                  workingVector19.zw = workingVector19.zw + -workingVector12.yz;
                  workingVector20.z = 1 + -workingVector20.y;
                  workingVector20.xy = workingVector20.xz * workingVector22.yz;
                  workingVector20.xy = floor(workingVector20.xy);
                  workingVector20.xy = float2(0.5,0.5) + workingVector20.xy;
                  workingVector20.xy = workingVector20.xy / workingVector22.yz;
                  workingVector19.xy = workingVector20.xy * workingVector21.yz + workingVector19.xy;
                  workingVector19.xy = max(workingVector19.xy, workingVector21.xw);
                  workingVector19.xy = min(workingVector19.xy, workingVector19.zw);
                  workingVector18.w = materialTexture4.SampleLevel(textureSampler4, workingVector19.xy, 0).x;
                  workingVector17.z = RD_COMPARISON_MASK(workingVector18.w >= workingVector17.z);
                  workingVector17.z = workingVector17.z ? 1.000000 : 0;
                  workingVector19.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.xyzw * workingVector17.yyyy;
                  workingVector19.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.xyzw * workingVector17.xxxx + workingVector19.xyzw;
                  workingVector19.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.xyzw * workingVector18.wwww + workingVector19.xyzw;
                  workingVector19.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.xyzw + workingVector19.xyzw;
                  workingVector19.xyz = workingVector19.xyz / workingVector19.www;
                  workingVector15.x = dot(workingVector15.xyz, workingVector15.xyz);
                  workingVector15.y = dot(workingVector19.xyz, workingVector19.xyz);
                  workingVector15.xy = sqrt(workingVector15.xy);
                  workingVector15.x = workingVector15.x + -workingVector15.y;
                  workingVector15.x = saturate(RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector15.x);
                  workingVector15.y = workingVector15.x * -2 + 3;
                  workingVector15.x = workingVector15.x * workingVector15.x;
                  workingVector15.x = -workingVector15.y * workingVector15.x + 1;
                  workingVector15.x = workingVector12.w ? workingVector15.x : 1;
                } else {
                  workingVector15.x = 1;
                  workingVector17.z = 0;
                }
              } else {
                workingVector17.z = 1;
                workingVector15.x = 1;
              }
              workingVector15.y = max(0.100000001, workingVector15.w);
              workingVector15.y = 1 / workingVector15.y;
              workingVector15.z = workingVector17.w * workingVector17.w + 9.99999975e-005;
              workingVector15.z = workingVector15.w / workingVector15.z;
              workingVector15.z = -workingVector15.z * workingVector15.z + 1;
              workingVector15.z = max(0, workingVector15.z);
              workingVector15.z = workingVector15.z * workingVector15.z;
              workingVector15.w = workingVector15.y * workingVector15.z;
              workingVector15.y = -workingVector15.y * workingVector15.z + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
              workingVector15.y = 1 + workingVector15.y;
              workingVector15.y = saturate(workingVector15.y * workingVector12.x);
              workingVector15.z = workingVector15.y * -2 + 3;
              workingVector15.y = workingVector15.y * workingVector15.y;
              workingVector15.y = workingVector15.z * workingVector15.y;
              workingVector15.y = saturate(workingVector15.y * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w);
              workingVector15.y = workingVector15.w * workingVector15.y;
              workingVector15.y = workingVector11.w ? workingVector15.y : workingVector15.w;
              workingVector19.x = sampledResource13[workingVector14.w].val[16/4];
              workingVector19.y = sampledResource13[workingVector14.w].val[16/4+1];
              workingVector19.z = sampledResource13[workingVector14.w].val[16/4+2];
              workingVector19.w = sampledResource13[workingVector14.w].val[16/4+3];
              workingVector17.xyw = workingVector19.xyz * workingVector19.www;
              workingVector15.yzw = workingVector17.xyw * workingVector15.yyy;
            } else {
              workingVector17.z = 1;
              workingVector15.xyzw = float4(1,0,0,0);
            }
          } else {
            workingVector17.z = 1;
            workingVector15.xyzw = float4(1,0,0,0);
          }
          workingVector14.w = workingVector16.w * workingVector15.x;
          workingVector17.xyw = workingVector18.xyz * workingVector17.zzz + workingVector14.www;
          workingVector17.xyw = workingVector17.xyw * workingVector15.yzw;
          workingVector13.xyz = workingVector17.xyw * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx + workingVector13.xyz;
          workingVector16.xyz = workingVector17.zzz * workingVector16.xyz;
          workingVector15.xyz = workingVector16.xyz * workingVector15.yzw;
          workingVector14.xyz = workingVector15.xyz * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy + workingVector14.xyz;
          workingVector13.w = (int)workingVector13.w + 1;
#endif
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector4.xyz = workingVector10.xyz * workingVector2.www;
        workingVector4.xyz = workingVector9.xyz * workingVector3.www + workingVector4.xyz;
        workingVector4.xyz = workingVector11.xyz * workingVector2.zzz + workingVector4.xyz;
        workingVector4.xyz = workingVector12.xyz * workingVector0.yyy + workingVector4.xyz;
#endif
      } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector13.xyz = float3(0,0,0);
        workingVector14.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector5.xyz = floor(workingVector3.xyz);
        workingVector3.xyz = -workingVector5.xyz + workingVector3.xyz;
        workingVector7.xyz = RD_COMPARISON_MASK(workingVector3.xyx >= workingVector3.yzz);
        bitMask.z = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector2.z = (((uint)workingVector7.y << 1) & bitMask.z) | ((uint)0 & ~bitMask.z);
        bitMask.w = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector2.w = (((uint)workingVector7.z << 2) & bitMask.w) | ((uint)0 & ~bitMask.w);
        bitMask.y = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.y = (((uint)workingVector7.x << 0) & bitMask.y) | ((uint)workingVector2.z & ~bitMask.y);
        workingVector0.y = (int)workingVector2.w + (int)workingVector0.y;
        workingVector1.x = min(workingVector3.x, workingVector3.y);
        workingVector2.z = max(workingVector3.x, workingVector3.y);
        workingVector2.w = min(workingVector1.x, workingVector3.z);
        workingVector3.x = max(workingVector2.z, workingVector3.z);
        workingVector2.z = min(workingVector2.z, workingVector3.z);
        workingVector1.x = max(workingVector2.z, workingVector1.x);
        workingVector2.z = 1 + -workingVector3.x;
        workingVector3.x = workingVector3.x + -workingVector1.x;
        workingVector1.x = workingVector1.x + -workingVector2.w;
        workingVector3.yzw = RD_COMPARISON_MASK(workingVector5.xyz >= float3(0,0,0));
        workingVector3.y = workingVector3.z ? workingVector3.y : 0;
        workingVector3.y = workingVector3.w ? workingVector3.y : 0;
        workingVector7.xyz = float3(1,1,1) + workingVector5.xyz;
        workingVector8.xyz = RD_COMPARISON_MASK(workingVector7.xyz < float3(16,16,16));
        workingVector3.z = workingVector8.y ? workingVector8.x : 0;
        workingVector3.z = workingVector8.z ? workingVector3.z : 0;
        workingVector3.y = workingVector3.z ? workingVector3.y : 0;
        if (workingVector3.y != 0) {
          workingVector3.yzw = (uint3)workingVector5.xyz;
          workingVector8.xy = RD_COMPARISON_MASK((uint2)workingVector0.yy < int2(2,6));
          workingVector8.xz = workingVector8.xy ? float2(0,0) : 0;
          workingVector8.yw = icb[workingVector0.y+0].yz;
          workingVector9.xyz = (int3)workingVector3.yzw + (int3)workingVector8.ywx;
          workingVector8.xy = icb[workingVector0.y+8].yz;
          workingVector8.xyz = (int3)workingVector3.yzw + (int3)workingVector8.xyz;
          workingVector10.xyz = (int3)workingVector3.yzw + int3(1,1,1);
          workingVector3.yw = (uint2)workingVector3.wy << int2(4,8);
          workingVector3.y = (int)workingVector3.y + (int)workingVector3.z;
          workingVector3.y = (int)workingVector3.w + (int)workingVector3.y;
          workingVector3.y = (int)workingVector1.z + (int)workingVector3.y;
          workingVector11.x = sampledResource11[workingVector3.y].val[0/4];
          workingVector11.yzw = (uint3)workingVector11.xxx >> int3(8,16,24);
          workingVector12.xyzw = (int4)workingVector11.xyzw & int4(255,255,255,255);
          workingVector12.xyzw = (uint4)workingVector12.xyzw;
          workingVector12.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector12.xyzw;
          workingVector3.yzw = workingVector12.xyz * workingVector12.www;
          workingVector3.yzw = float3(6,6,6) * workingVector3.yzw;
          workingVector3.yzw = workingVector11.xxx ? workingVector3.yzw : float3(0,0,0);
          workingVector9.xz = (uint2)workingVector9.zx << int2(4,8);
          workingVector4.w = (int)workingVector9.x + (int)workingVector9.y;
          workingVector4.w = (int)workingVector9.z + (int)workingVector4.w;
          workingVector4.w = (int)workingVector1.z + (int)workingVector4.w;
          workingVector9.x = sampledResource11[workingVector4.w].val[0/4];
          workingVector9.yzw = (uint3)workingVector9.xxx >> int3(8,16,24);
          workingVector11.xyzw = (int4)workingVector9.xyzw & int4(255,255,255,255);
          workingVector11.xyzw = (uint4)workingVector11.xyzw;
          workingVector11.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector11.xyzw;
          workingVector9.yzw = workingVector11.xyz * workingVector11.www;
          workingVector9.yzw = float3(6,6,6) * workingVector9.yzw;
          workingVector9.xyz = workingVector9.xxx ? workingVector9.yzw : float3(0,0,0);
          workingVector8.xz = (uint2)workingVector8.zx << int2(4,8);
          workingVector4.w = (int)workingVector8.x + (int)workingVector8.y;
          workingVector4.w = (int)workingVector8.z + (int)workingVector4.w;
          workingVector4.w = (int)workingVector1.z + (int)workingVector4.w;
          workingVector8.x = sampledResource11[workingVector4.w].val[0/4];
          workingVector8.yzw = (uint3)workingVector8.xxx >> int3(8,16,24);
          workingVector11.xyzw = (int4)workingVector8.xyzw & int4(255,255,255,255);
          workingVector11.xyzw = (uint4)workingVector11.xyzw;
          workingVector11.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector11.xyzw;
          workingVector8.yzw = workingVector11.xyz * workingVector11.www;
          workingVector8.yzw = float3(6,6,6) * workingVector8.yzw;
          workingVector8.xyz = workingVector8.xxx ? workingVector8.yzw : float3(0,0,0);
          workingVector10.xz = (uint2)workingVector10.zx << int2(4,8);
          workingVector4.w = (int)workingVector10.x + (int)workingVector10.y;
          workingVector4.w = (int)workingVector10.z + (int)workingVector4.w;
          workingVector4.w = (int)workingVector1.z + (int)workingVector4.w;
          workingVector10.x = sampledResource11[workingVector4.w].val[0/4];
          workingVector10.yzw = (uint3)workingVector10.xxx >> int3(8,16,24);
          workingVector11.xyzw = (int4)workingVector10.xyzw & int4(255,255,255,255);
          workingVector11.xyzw = (uint4)workingVector11.xyzw;
          workingVector11.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector11.xyzw;
          workingVector10.yzw = workingVector11.xyz * workingVector11.www;
          workingVector10.yzw = float3(6,6,6) * workingVector10.yzw;
          workingVector10.xyz = workingVector10.xxx ? workingVector10.yzw : float3(0,0,0);
        } else {
          workingVector11.xy = RD_COMPARISON_MASK((uint2)workingVector0.yy < int2(2,6));
          workingVector11.xy = workingVector11.xy ? float2(0,0) : 0;
          workingVector12.xy = (uint2)icb[workingVector0.y+0].yz;
          workingVector12.z = (uint)workingVector11.x;
          workingVector11.xzw = workingVector12.xyz + workingVector5.xyz;
          workingVector12.xy = (uint2)icb[workingVector0.y+8].yz;
          workingVector12.z = (uint)workingVector11.y;
          workingVector12.xyz = workingVector12.xyz + workingVector5.xyz;
          workingVector13.xyz = workingVector6.xyz * float3(16,16,16) + workingVector5.xyz;
          workingVector14.xyz = RD_COMPARISON_MASK(workingVector5.xyz < float3(0,0,0));
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector5.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.y = (((uint)workingVector14.x << 0) & bitMask.y) | ((uint)workingVector15.x & ~bitMask.y);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector14.y = (((uint)workingVector14.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
          workingVector0.y = (int)workingVector0.y + (int)workingVector14.x;
          workingVector0.y = (int)workingVector15.y + (int)workingVector0.y;
          workingVector0.y = (int)workingVector14.y + (int)workingVector0.y;
          workingVector0.y = (int)workingVector15.z + (int)workingVector0.y;
          workingVector4.w = RD_COMPARISON_MASK((int)icb[workingVector0.y+0].x < 0);
          workingVector5.xyz = (uint3)workingVector5.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector5.x = (((uint)workingVector5.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector5.z = (((uint)workingVector5.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.x = (((uint)workingVector5.y << 0) & bitMask.x) | ((uint)workingVector5.x & ~bitMask.x);
          workingVector5.x = (int)workingVector5.z + (int)workingVector5.x;
          workingVector5.x = (int)workingVector1.z + (int)workingVector5.x;
          workingVector5.yz = (int2)workingVector1.zz + int2(4096,4097);
          workingVector5.y = sampledResource11[workingVector5.y].val[0/4];
          workingVector5.w = 1 << (int)icb[workingVector0.y+0].x;
          workingVector5.w = (int)workingVector5.w & (int)workingVector5.y;
          workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 0);
          workingVector0.y = (int)workingVector5.z + (int)icb[workingVector0.y+0].x;
          workingVector0.y = sampledResource11[workingVector0.y].val[0/4];
          workingVector0.y = (uint)workingVector0.y >> 2;
          workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xyz;
          workingVector14.xyz = floor(workingVector14.xyz);
          workingVector13.xyz = -workingVector14.xyz * float3(16,16,16) + workingVector13.xyz;
          workingVector13.xyz = (uint3)workingVector13.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
          workingVector6.w = (int)workingVector13.z + (int)workingVector6.w;
          workingVector0.y = (int)workingVector0.y + (int)workingVector6.w;
          workingVector0.y = workingVector4.w ? workingVector5.x : workingVector0.y;
          workingVector4.w = workingVector4.w ? 0 : workingVector5.w;
          workingVector13.x = sampledResource11[workingVector0.y].val[0/4];
          workingVector13.yzw = (uint3)workingVector13.xxx >> int3(8,16,24);
          workingVector14.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
          workingVector14.xyzw = (uint4)workingVector14.xyzw;
          workingVector14.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector14.xyzw;
          workingVector13.yzw = workingVector14.xyz * workingVector14.www;
          workingVector13.yzw = float3(6,6,6) * workingVector13.yzw;
          workingVector13.xyz = workingVector13.xxx ? workingVector13.yzw : float3(0,0,0);
          workingVector3.yzw = workingVector4.www ? float3(0,0,0) : workingVector13.xyz;
          workingVector13.xyz = workingVector6.xyz * float3(16,16,16) + workingVector11.xzw;
          workingVector14.xyz = RD_COMPARISON_MASK(workingVector11.xzw < float3(0,0,0));
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector11.xzw >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.y = (((uint)workingVector14.x << 0) & bitMask.y) | ((uint)workingVector15.x & ~bitMask.y);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector5.x = (((uint)workingVector14.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector5.w = (((uint)workingVector14.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
          workingVector0.y = (int)workingVector0.y + (int)workingVector5.x;
          workingVector0.y = (int)workingVector15.y + (int)workingVector0.y;
          workingVector0.y = (int)workingVector5.w + (int)workingVector0.y;
          workingVector0.y = (int)workingVector15.z + (int)workingVector0.y;
          workingVector4.w = RD_COMPARISON_MASK((int)icb[workingVector0.y+0].x < 0);
          workingVector11.xyz = (uint3)workingVector11.xzw;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector5.x = (((uint)workingVector11.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector5.w = (((uint)workingVector11.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.x = (((uint)workingVector11.y << 0) & bitMask.x) | ((uint)workingVector5.x & ~bitMask.x);
          workingVector5.x = (int)workingVector5.w + (int)workingVector5.x;
          workingVector5.x = (int)workingVector1.z + (int)workingVector5.x;
          workingVector5.w = 1 << (int)icb[workingVector0.y+0].x;
          workingVector5.w = (int)workingVector5.w & (int)workingVector5.y;
          workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 0);
          workingVector0.y = (int)workingVector5.z + (int)icb[workingVector0.y+0].x;
          workingVector0.y = sampledResource11[workingVector0.y].val[0/4];
          workingVector0.y = (uint)workingVector0.y >> 2;
          workingVector11.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xyz;
          workingVector11.xyz = floor(workingVector11.xyz);
          workingVector11.xyz = -workingVector11.xyz * float3(16,16,16) + workingVector13.xyz;
          workingVector11.xyz = (uint3)workingVector11.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.z = (((uint)workingVector11.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector11.y << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
          workingVector6.w = (int)workingVector11.z + (int)workingVector6.w;
          workingVector0.y = (int)workingVector0.y + (int)workingVector6.w;
          workingVector0.y = workingVector4.w ? workingVector5.x : workingVector0.y;
          workingVector4.w = workingVector4.w ? 0 : workingVector5.w;
          workingVector11.x = sampledResource11[workingVector0.y].val[0/4];
          workingVector11.yzw = (uint3)workingVector11.xxx >> int3(8,16,24);
          workingVector13.xyzw = (int4)workingVector11.xyzw & int4(255,255,255,255);
          workingVector13.xyzw = (uint4)workingVector13.xyzw;
          workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
          workingVector11.yzw = workingVector13.xyz * workingVector13.www;
          workingVector11.yzw = float3(6,6,6) * workingVector11.yzw;
          workingVector11.xyz = workingVector11.xxx ? workingVector11.yzw : float3(0,0,0);
          workingVector9.xyz = workingVector4.www ? float3(0,0,0) : workingVector11.xyz;
          workingVector11.xyz = workingVector6.xyz * float3(16,16,16) + workingVector12.xyz;
          workingVector13.xyz = RD_COMPARISON_MASK(workingVector12.xyz < float3(0,0,0));
          workingVector14.xyz = RD_COMPARISON_MASK(workingVector12.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector14.y = (((uint)workingVector14.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.y = (((uint)workingVector13.x << 0) & bitMask.y) | ((uint)workingVector14.x & ~bitMask.y);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector5.x = (((uint)workingVector13.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector5.w = (((uint)workingVector13.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
          workingVector0.y = (int)workingVector0.y + (int)workingVector5.x;
          workingVector0.y = (int)workingVector14.y + (int)workingVector0.y;
          workingVector0.y = (int)workingVector5.w + (int)workingVector0.y;
          workingVector0.y = (int)workingVector14.z + (int)workingVector0.y;
          workingVector4.w = RD_COMPARISON_MASK((int)icb[workingVector0.y+0].x < 0);
          workingVector12.xyz = (uint3)workingVector12.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector5.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector5.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.x = (((uint)workingVector12.y << 0) & bitMask.x) | ((uint)workingVector5.x & ~bitMask.x);
          workingVector5.x = (int)workingVector5.w + (int)workingVector5.x;
          workingVector5.x = (int)workingVector1.z + (int)workingVector5.x;
          workingVector5.w = 1 << (int)icb[workingVector0.y+0].x;
          workingVector5.w = (int)workingVector5.w & (int)workingVector5.y;
          workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 0);
          workingVector0.y = (int)workingVector5.z + (int)icb[workingVector0.y+0].x;
          workingVector0.y = sampledResource11[workingVector0.y].val[0/4];
          workingVector0.y = (uint)workingVector0.y >> 2;
          workingVector12.xyz = float3(0.0625,0.0625,0.0625) * workingVector11.xyz;
          workingVector12.xyz = floor(workingVector12.xyz);
          workingVector11.xyz = -workingVector12.xyz * float3(16,16,16) + workingVector11.xyz;
          workingVector11.xyz = (uint3)workingVector11.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.z = (((uint)workingVector11.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector11.y << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
          workingVector6.w = (int)workingVector11.z + (int)workingVector6.w;
          workingVector0.y = (int)workingVector0.y + (int)workingVector6.w;
          workingVector0.y = workingVector4.w ? workingVector5.x : workingVector0.y;
          workingVector4.w = workingVector4.w ? 0 : workingVector5.w;
          workingVector11.x = sampledResource11[workingVector0.y].val[0/4];
          workingVector11.yzw = (uint3)workingVector11.xxx >> int3(8,16,24);
          workingVector12.xyzw = (int4)workingVector11.xyzw & int4(255,255,255,255);
          workingVector12.xyzw = (uint4)workingVector12.xyzw;
          workingVector12.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector12.xyzw;
          workingVector11.yzw = workingVector12.xyz * workingVector12.www;
          workingVector11.yzw = float3(6,6,6) * workingVector11.yzw;
          workingVector11.xyz = workingVector11.xxx ? workingVector11.yzw : float3(0,0,0);
          workingVector8.xyz = workingVector4.www ? float3(0,0,0) : workingVector11.xyz;
          workingVector6.xyz = workingVector6.xyz * float3(16,16,16) + workingVector7.xyz;
          workingVector11.xyz = RD_COMPARISON_MASK(workingVector7.xyz < float3(0,0,0));
          workingVector12.xyz = RD_COMPARISON_MASK(workingVector7.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector12.y = (((uint)workingVector12.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.y = (((uint)workingVector11.x << 0) & bitMask.y) | ((uint)workingVector12.x & ~bitMask.y);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector5.x = (((uint)workingVector11.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector5.w = (((uint)workingVector11.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
          workingVector0.y = (int)workingVector0.y + (int)workingVector5.x;
          workingVector0.y = (int)workingVector12.y + (int)workingVector0.y;
          workingVector0.y = (int)workingVector5.w + (int)workingVector0.y;
          workingVector0.y = (int)workingVector12.z + (int)workingVector0.y;
          workingVector4.w = RD_COMPARISON_MASK((int)icb[workingVector0.y+0].x < 0);
          workingVector7.xyz = (uint3)workingVector7.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector5.x = (((uint)workingVector7.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector5.w = (((uint)workingVector7.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.x = (((uint)workingVector7.y << 0) & bitMask.x) | ((uint)workingVector5.x & ~bitMask.x);
          workingVector5.x = (int)workingVector5.w + (int)workingVector5.x;
          workingVector1.z = (int)workingVector1.z + (int)workingVector5.x;
          workingVector5.x = 1 << (int)icb[workingVector0.y+0].x;
          workingVector5.x = (int)workingVector5.x & (int)workingVector5.y;
          workingVector5.x = RD_COMPARISON_MASK((int)workingVector5.x == 0);
          workingVector0.y = (int)workingVector5.z + (int)icb[workingVector0.y+0].x;
          workingVector0.y = sampledResource11[workingVector0.y].val[0/4];
          workingVector0.y = (uint)workingVector0.y >> 2;
          workingVector5.yzw = float3(0.0625,0.0625,0.0625) * workingVector6.xyz;
          workingVector5.yzw = floor(workingVector5.yzw);
          workingVector5.yzw = -workingVector5.yzw * float3(16,16,16) + workingVector6.xyz;
          workingVector5.yzw = (uint3)workingVector5.yzw;
          bitMask.y = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector5.y = (((uint)workingVector5.w << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector5.w = (((uint)workingVector5.y << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.y = (((uint)workingVector5.z << 0) & bitMask.y) | ((uint)workingVector5.y & ~bitMask.y);
          workingVector5.y = (int)workingVector5.w + (int)workingVector5.y;
          workingVector0.y = (int)workingVector0.y + (int)workingVector5.y;
          workingVector0.y = workingVector4.w ? workingVector1.z : workingVector0.y;
          workingVector1.z = workingVector4.w ? 0 : workingVector5.x;
          workingVector5.x = sampledResource11[workingVector0.y].val[0/4];
          workingVector5.yzw = (uint3)workingVector5.xxx >> int3(8,16,24);
          workingVector6.xyzw = workingVector5.xyzw ? float4(0,0,0,0) : 0;
          workingVector6.xyzw = (uint4)workingVector6.xyzw;
          workingVector6.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector6.xyzw;
          workingVector5.yzw = workingVector6.xyz * workingVector6.www;
          workingVector5.yzw = float3(6,6,6) * workingVector5.yzw;
          workingVector5.xyz = workingVector5.xxx ? workingVector5.yzw : float3(0,0,0);
          workingVector10.xyz = workingVector1.zzz ? float3(0,0,0) : workingVector5.xyz;
        }
        workingVector5.xyz = workingVector9.xyz * workingVector3.xxx;
        workingVector3.xyz = workingVector3.yzw * workingVector2.zzz + workingVector5.xyz;
        workingVector3.xyz = workingVector8.xyz * workingVector1.xxx + workingVector3.xyz;
        workingVector4.xyz = workingVector10.xyz * workingVector2.www + workingVector3.xyz;
#endif
      }
#if RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF
      workingVector0.y = 1 + -RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
      workingVector1.xzw = workingVector0.yyy * workingVector13.xyz;
      workingVector2.xyz = workingVector0.yyy * workingVector14.xyz;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
      workingVector0.x = 1 + -RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
      workingVector2.xyz = workingVector0.xxx * workingVector13.xyz;
      workingVector5.xzw = workingVector0.xxx * workingVector14.xyz;
#endif
    } else {
#if RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF
      workingVector1.xzw = float3(0,0,0);
      workingVector2.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector4.xyz = float3(0,0,0);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
      workingVector2.xyz = float3(0,0,0);
      workingVector5.xzw = float3(0,0,0);
#endif
    }
  } else {
#if RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF
    workingVector1.xzw = float3(0,0,0);
    workingVector2.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    if (8 == 0) workingVector1.x = 0; else if (8+8 < 32) {     workingVector1.x = (uint)workingVector2.x << (32-(8 + 8)); workingVector1.x = (uint)workingVector1.x >> (32-8);    } else workingVector1.x = (uint)workingVector2.x >> 8;
    if (8 == 0) workingVector1.z = 0; else if (8+8 < 32) {     workingVector1.z = (uint)workingVector2.y << (32-(8 + 8)); workingVector1.z = (uint)workingVector1.z >> (32-8);    } else workingVector1.z = (uint)workingVector2.y >> 8;
    workingVector2.xy = (int2)workingVector2.xy & int2(255,255);
    workingVector3.xz = (uint2)workingVector1.xz;
    workingVector3.yw = (uint2)workingVector2.xy;
    workingVector2.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector3.xyzw;
    workingVector2.xyz = workingVector2.xyz * workingVector2.www;
    workingVector4.xyz = float3(6,6,6) * workingVector2.xyz;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    workingVector2.xyz = float3(0,0,0);
    workingVector5.xzw = float3(0,0,0);
#endif
  }
#if RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF
  workingVector0.y = workingVector1.y * workingVector1.y;
  workingVector2.w = workingVector0.y * workingVector0.y;
  workingVector2.w = workingVector2.w * workingVector1.y;
  workingVector0.y = workingVector0.y * workingVector1.y + -workingVector2.w;
  workingVector0.y = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector0.y + workingVector2.w;
  workingVector4.yzw = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.yyy;
  workingVector4.yzw = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector4.yzw;
  workingVector3.xyz = workingVector3.yzw * float3(6,6,6) + workingVector4.yzw;
  workingVector4.yzw = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector3.xyz = max(workingVector4.yzw, workingVector3.xyz);
  workingVector3.xyz = workingVector4.xxx * workingVector3.xyz;
  fragmentColor1.xyz = workingVector3.xyz * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www + workingVector1.xzw;
  fragmentColor0.xy = workingVector0.xz * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.x = 65535 * workingVector0.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector0.y = 1 + -workingVector1.w;
  workingVector1.x = workingVector1.y * workingVector1.y;
  workingVector1.z = workingVector1.x * workingVector1.x;
  workingVector1.z = workingVector1.z * workingVector1.y;
  workingVector1.x = workingVector1.x * workingVector1.y + -workingVector1.z;
  workingVector1.x = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector1.x + workingVector1.z;
  workingVector1.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector1.xxx;
  workingVector1.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector1.xyz;
  workingVector1.xyz = workingVector4.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector1.xyz;
  workingVector2.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector1.xyz = max(workingVector2.xyz, workingVector1.xyz);
  workingVector1.xyz = workingVector1.xyz * workingVector0.yyy;
  fragmentColor1.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www * workingVector1.xyz;
  fragmentColor0.xy = workingVector0.xz * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.x = 65535 * workingVector0.w;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
  workingVector0.x = (int)workingVector1.y & 1;
  workingVector0.y = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z);
  workingVector1.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
  workingVector0.y = workingVector0.y ? workingVector1.w : 0;
  workingVector0.x = RD_COMPARISON_MASK((int)workingVector0.x == 0);
  workingVector0.x = workingVector0.x ? workingVector0.y : 0;
  if (workingVector0.x != 0) {
    workingVector3.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector3.xyz;
    workingVector3.xyz = float3(-0.5,-0.5,-0.5) + workingVector3.xyz;
    workingVector3.xyz = workingVector4.zxy * float3(0.200000003,0.200000003,0.200000003) + workingVector3.xyz;
    workingVector6.xyz = floor(workingVector3.xyz);
    workingVector6.xyz = float3(0.0625,0.0625,0.0625) * workingVector6.xyz;
    workingVector6.xyz = floor(workingVector6.xyz);
    workingVector6.xyz = (int3)workingVector6.xyz;
    bitMask.x = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector0.x = (((uint)workingVector6.y << 16) & bitMask.x) | ((uint)workingVector6.x & ~bitMask.x);
    bitMask.y = ((~(-1 << 16)) << 0) & 0xffffffff;  workingVector0.y = (((uint)workingVector6.z << 0) & bitMask.y) | ((uint)0x00020000 & ~bitMask.y);
    workingVector6.xyz = (int3)workingVector6.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
    workingVector8.xyz = (uint3)workingVector6.xyz >> int3(24,24,24);
    workingVector6.xyz = (int3)workingVector6.xyz ^ (int3)workingVector8.xyz;
    workingVector6.xyz = (int3)workingVector6.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
    workingVector1.w = (int)workingVector6.x ^ 0x88b16480;
    workingVector1.w = (int)workingVector1.w * 0x5bd1e995;
    workingVector1.w = (int)workingVector6.y ^ (int)workingVector1.w;
    workingVector1.w = (int)workingVector1.w * 0x5bd1e995;
    workingVector1.w = (int)workingVector6.z ^ (int)workingVector1.w;
    workingVector1.w = (int)workingVector1.w * 0x5bd1e995;
    workingVector1.w = (int)workingVector1.w ^ 0x90210f61;
    workingVector3.w = (uint)workingVector1.w >> 13;
    workingVector1.w = (int)workingVector1.w ^ (int)workingVector3.w;
    workingVector1.w = (int)workingVector1.w * 0x5bd1e995;
    workingVector3.w = (uint)workingVector1.w >> 15;
    workingVector1.w = (int)workingVector1.w ^ (int)workingVector3.w;
    workingVector3.w = (uint)workingVector1.w >> 16;
    workingVector1.w = (int)workingVector1.w ^ (int)workingVector3.w;
    workingVector1.w = workingVector1.w ? 0.000000 : 0;
    workingVector3.w = workingVector1.w ? 0 : 1;
    workingVector1.w = (int)workingVector1.w | (int)workingVector3.w;
    workingVector3.w = (uint)RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x;
    workingVector3.w = (int)workingVector3.w + -1;
    workingVector6.x = workingVector1.w ? workingVector3.w : 0;
    workingVector8.x = workingVector6.x;
    workingVector8.y = 0;
    workingVector6.yz = float2(0,0);
    while (true) {
      workingVector6.w = RD_COMPARISON_MASK((int)workingVector8.y >= 8);
      if (workingVector6.w != 0) break;
      workingVector9.x = sampledResource10[workingVector8.x].val[0/4];
      workingVector9.y = sampledResource10[workingVector8.x].val[0/4+1];
      workingVector9.z = sampledResource10[workingVector8.x].val[0/4+2];
      workingVector9.w = sampledResource10[workingVector8.x].val[0/4+3];
      workingVector6.w = (int)workingVector9.z & 0x0000ffff;
      workingVector7.x = RD_COMPARISON_MASK((int)workingVector6.w == 0);
      workingVector6.w = RD_COMPARISON_MASK((int)workingVector1.w == (int)workingVector6.w);
      workingVector7.w = RD_COMPARISON_MASK((int)workingVector0.x == (int)workingVector9.x);
      workingVector6.w = workingVector6.w ? workingVector7.w : 0;
      workingVector7.w = RD_COMPARISON_MASK((int)workingVector0.y == (int)workingVector9.y);
      workingVector6.w = workingVector6.w ? workingVector7.w : 0;
      workingVector7.w = workingVector6.w ? workingVector9.w : workingVector6.y;
      workingVector9.x = workingVector6.z ? workingVector6.y : workingVector7.w;
      workingVector9.y = (int)workingVector6.w | (int)workingVector6.z;
      workingVector6.w = (int)workingVector8.x + 1;
      workingVector8.x = (int)workingVector3.w & (int)workingVector6.w;
      workingVector6.w = (int)workingVector7.x | (int)workingVector9.y;
      if (workingVector6.w != 0) {
        workingVector6.yz = workingVector9.xy;
        break;
      }
      workingVector8.y = (int)workingVector8.y + 1;
      workingVector6.yz = workingVector9.xy;
    }
    if (workingVector6.z != 0) {
      workingVector0.x = (int)workingVector1.y & 2;
      workingVector6.xzw = float3(0.0625,0.0625,0.0625) * workingVector3.xyz;
      workingVector6.xzw = floor(workingVector6.xzw);
      workingVector3.xyz = -workingVector6.xzw * float3(16,16,16) + workingVector3.xyz;
      workingVector0.y = (uint)workingVector6.y >> 2;
      workingVector0.x = RD_COMPARISON_MASK((int)workingVector0.x == 0);
      workingVector8.xyz = RD_COMPARISON_MASK(abs(workingVector4.zxy) >= float3(1,1,1));
      workingVector1.y = (int)workingVector8.y | (int)workingVector8.x;
      workingVector1.y = (int)workingVector8.z | (int)workingVector1.y;
      workingVector0.x = workingVector0.x ? workingVector1.y : 0;
      if (workingVector0.x != 0) {
        workingVector0.x = dot(workingVector3.yzx, abs(workingVector4.xyz));
        workingVector1.y = dot(workingVector3.zxy, abs(workingVector4.xyz));
        workingVector1.w = dot(workingVector3.xyz, abs(workingVector4.xyz));
        workingVector3.w = workingVector4.z + workingVector4.x;
        workingVector2.w = workingVector5.y * workingVector2.w + workingVector3.w;
        workingVector2.w = RD_COMPARISON_MASK(0 < workingVector2.w);
        workingVector3.w = ceil(workingVector0.x);
        workingVector0.x = floor(workingVector0.x);
        workingVector0.x = workingVector2.w ? workingVector3.w : workingVector0.x;
        workingVector2.w = floor(workingVector1.y);
        workingVector3.w = floor(workingVector1.w);
        workingVector8.xyz = abs(workingVector4.yzx) * workingVector2.www;
        workingVector8.xyz = abs(workingVector4.zxy) * workingVector0.xxx + workingVector8.xyz;
        workingVector8.xyz = abs(workingVector4.xyz) * workingVector3.www + workingVector8.xyz;
        workingVector9.xyz = workingVector8.xyz + abs(workingVector4.yzx);
        workingVector10.xyz = workingVector8.xyz + abs(workingVector4.xyz);
        workingVector4.xyz = workingVector9.xyz + abs(workingVector4.xyz);
        workingVector0.x = -workingVector2.w + workingVector1.y;
        workingVector1.y = -workingVector3.w + workingVector1.w;
        workingVector1.w = 1 + -workingVector0.x;
        workingVector2.w = 1 + -workingVector1.y;
        workingVector3.w = workingVector2.w * workingVector1.w;
        workingVector2.w = workingVector2.w * workingVector0.x;
        workingVector1.w = workingVector1.w * workingVector1.y;
        workingVector0.x = workingVector1.y * workingVector0.x;
        workingVector11.xyz = RD_COMPARISON_MASK(workingVector8.xyz >= float3(0,0,0));
        workingVector1.y = workingVector11.y ? workingVector11.x : 0;
        workingVector1.y = workingVector11.z ? workingVector1.y : 0;
        workingVector11.xyz = RD_COMPARISON_MASK(workingVector4.xyz < float3(16,16,16));
        workingVector5.y = workingVector11.y ? workingVector11.x : 0;
        workingVector5.y = workingVector11.z ? workingVector5.y : 0;
        workingVector1.y = (int)workingVector1.y & (int)workingVector5.y;
        if (workingVector1.y != 0) {
          workingVector11.xyz = (uint3)workingVector8.xyz;
          workingVector12.xyz = (uint3)workingVector9.xyz;
          workingVector13.xyz = (uint3)workingVector10.xyz;
          workingVector14.xyz = (uint3)workingVector4.xyz;
          workingVector7.xw = (uint2)workingVector11.zx << int2(4,8);
          workingVector1.y = (int)workingVector7.x + (int)workingVector11.y;
          workingVector1.y = (int)workingVector7.w + (int)workingVector1.y;
          workingVector1.y = (int)workingVector0.y + (int)workingVector1.y;
          workingVector11.x = sampledResource11[workingVector1.y].val[0/4];
          workingVector11.yzw = (uint3)workingVector11.xxx >> int3(8,16,24);
          workingVector15.xyzw = (int4)workingVector11.xyzw & int4(255,255,255,255);
          workingVector15.xyzw = (uint4)workingVector15.xyzw;
          workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
          workingVector11.yzw = workingVector15.xyz * workingVector15.www;
          workingVector11.yzw = float3(6,6,6) * workingVector11.yzw;
          workingVector11.xyz = workingVector11.xxx ? workingVector11.yzw : float3(0,0,0);
          workingVector7.xw = (uint2)workingVector12.zx << int2(4,8);
          workingVector1.y = (int)workingVector7.x + (int)workingVector12.y;
          workingVector1.y = (int)workingVector7.w + (int)workingVector1.y;
          workingVector1.y = (int)workingVector0.y + (int)workingVector1.y;
          workingVector12.x = sampledResource11[workingVector1.y].val[0/4];
          workingVector12.yzw = (uint3)workingVector12.xxx >> int3(8,16,24);
          workingVector15.xyzw = (int4)workingVector12.xyzw & int4(255,255,255,255);
          workingVector15.xyzw = (uint4)workingVector15.xyzw;
          workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
          workingVector12.yzw = workingVector15.xyz * workingVector15.www;
          workingVector12.yzw = float3(6,6,6) * workingVector12.yzw;
          workingVector12.xyz = workingVector12.xxx ? workingVector12.yzw : float3(0,0,0);
          workingVector7.xw = (uint2)workingVector13.zx << int2(4,8);
          workingVector1.y = (int)workingVector7.x + (int)workingVector13.y;
          workingVector1.y = (int)workingVector7.w + (int)workingVector1.y;
          workingVector1.y = (int)workingVector0.y + (int)workingVector1.y;
          workingVector13.x = sampledResource11[workingVector1.y].val[0/4];
          workingVector13.yzw = (uint3)workingVector13.xxx >> int3(8,16,24);
          workingVector15.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
          workingVector15.xyzw = (uint4)workingVector15.xyzw;
          workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
          workingVector13.yzw = workingVector15.xyz * workingVector15.www;
          workingVector13.yzw = float3(6,6,6) * workingVector13.yzw;
          workingVector13.xyz = workingVector13.xxx ? workingVector13.yzw : float3(0,0,0);
          workingVector7.xw = (uint2)workingVector14.zx << int2(4,8);
          workingVector1.y = (int)workingVector7.x + (int)workingVector14.y;
          workingVector1.y = (int)workingVector7.w + (int)workingVector1.y;
          workingVector1.y = (int)workingVector0.y + (int)workingVector1.y;
          workingVector14.x = sampledResource11[workingVector1.y].val[0/4];
          workingVector14.yzw = (uint3)workingVector14.xxx >> int3(8,16,24);
          workingVector15.xyzw = (int4)workingVector14.xyzw & int4(255,255,255,255);
          workingVector15.xyzw = (uint4)workingVector15.xyzw;
          workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
          workingVector14.yzw = workingVector15.xyz * workingVector15.www;
          workingVector14.yzw = float3(6,6,6) * workingVector14.yzw;
          workingVector14.xyz = workingVector14.xxx ? workingVector14.yzw : float3(0,0,0);
        } else {
          workingVector15.xyz = workingVector6.xzw * float3(16,16,16) + workingVector8.xyz;
          workingVector16.xyz = RD_COMPARISON_MASK(workingVector8.xyz < float3(0,0,0));
          workingVector17.xyz = RD_COMPARISON_MASK(workingVector8.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector17.x = (((uint)workingVector17.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector17.y = (((uint)workingVector17.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector17.z = (((uint)workingVector17.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.y = (((uint)workingVector16.x << 0) & bitMask.y) | ((uint)workingVector17.x & ~bitMask.y);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector7.x = (((uint)workingVector16.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector7.w = (((uint)workingVector16.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
          workingVector1.y = (int)workingVector1.y + (int)workingVector7.x;
          workingVector1.y = (int)workingVector17.y + (int)workingVector1.y;
          workingVector1.y = (int)workingVector7.w + (int)workingVector1.y;
          workingVector1.y = (int)workingVector17.z + (int)workingVector1.y;
          workingVector5.y = RD_COMPARISON_MASK((int)icb[workingVector1.y+0].x < 0);
          workingVector8.xyz = (uint3)workingVector8.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector7.x = (((uint)workingVector8.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector7.w = (((uint)workingVector8.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.y = (((uint)workingVector8.y << 0) & bitMask.y) | ((uint)workingVector7.x & ~bitMask.y);
          workingVector6.y = (int)workingVector7.w + (int)workingVector6.y;
          workingVector6.y = (int)workingVector0.y + (int)workingVector6.y;
          workingVector7.xw = (int2)workingVector0.yy + int2(4096,4097);
          workingVector7.x = sampledResource11[workingVector7.x].val[0/4];
          workingVector8.x = 1 << (int)icb[workingVector1.y+0].x;
          workingVector8.x = (int)workingVector7.x & (int)workingVector8.x;
          workingVector8.x = RD_COMPARISON_MASK((int)workingVector8.x == 0);
          workingVector1.y = (int)workingVector7.w + (int)icb[workingVector1.y+0].x;
          workingVector1.y = sampledResource11[workingVector1.y].val[0/4];
          workingVector1.y = (uint)workingVector1.y >> 2;
          workingVector8.yzw = float3(0.0625,0.0625,0.0625) * workingVector15.xyz;
          workingVector8.yzw = floor(workingVector8.yzw);
          workingVector8.yzw = -workingVector8.yzw * float3(16,16,16) + workingVector15.xyz;
          workingVector8.yzw = (uint3)workingVector8.yzw;
          bitMask.y = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector8.y = (((uint)workingVector8.w << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector8.w = (((uint)workingVector8.y << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.y = (((uint)workingVector8.z << 0) & bitMask.y) | ((uint)workingVector8.y & ~bitMask.y);
          workingVector8.y = (int)workingVector8.w + (int)workingVector8.y;
          workingVector1.y = (int)workingVector1.y + (int)workingVector8.y;
          workingVector1.y = workingVector5.y ? workingVector6.y : workingVector1.y;
          workingVector5.y = workingVector5.y ? 0 : workingVector8.x;
          workingVector8.x = sampledResource11[workingVector1.y].val[0/4];
          workingVector8.yzw = (uint3)workingVector8.xxx >> int3(8,16,24);
          workingVector15.xyzw = workingVector8.xyzw ? float4(0,0,0,0) : 0;
          workingVector15.xyzw = (uint4)workingVector15.xyzw;
          workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
          workingVector8.yzw = workingVector15.xyz * workingVector15.www;
          workingVector8.yzw = float3(6,6,6) * workingVector8.yzw;
          workingVector8.xyz = workingVector8.xxx ? workingVector8.yzw : float3(0,0,0);
          workingVector11.xyz = workingVector5.yyy ? float3(0,0,0) : workingVector8.xyz;
          workingVector8.xyz = workingVector6.xzw * float3(16,16,16) + workingVector9.xyz;
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector9.xyz < float3(0,0,0));
          workingVector16.xyz = RD_COMPARISON_MASK(workingVector9.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector16.y = (((uint)workingVector16.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector16.z = (((uint)workingVector16.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.y = (((uint)workingVector15.x << 0) & bitMask.y) | ((uint)workingVector16.x & ~bitMask.y);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
          workingVector1.y = (int)workingVector1.y + (int)workingVector15.x;
          workingVector1.y = (int)workingVector16.y + (int)workingVector1.y;
          workingVector1.y = (int)workingVector15.y + (int)workingVector1.y;
          workingVector1.y = (int)workingVector16.z + (int)workingVector1.y;
          workingVector5.y = RD_COMPARISON_MASK((int)icb[workingVector1.y+0].x < 0);
          workingVector9.xyz = (uint3)workingVector9.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector9.x = (((uint)workingVector9.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector9.z = (((uint)workingVector9.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.y = (((uint)workingVector9.y << 0) & bitMask.y) | ((uint)workingVector9.x & ~bitMask.y);
          workingVector6.y = (int)workingVector9.z + (int)workingVector6.y;
          workingVector6.y = (int)workingVector0.y + (int)workingVector6.y;
          workingVector8.w = 1 << (int)icb[workingVector1.y+0].x;
          workingVector8.w = (int)workingVector7.x & (int)workingVector8.w;
          workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
          workingVector1.y = (int)workingVector7.w + (int)icb[workingVector1.y+0].x;
          workingVector1.y = sampledResource11[workingVector1.y].val[0/4];
          workingVector1.y = (uint)workingVector1.y >> 2;
          workingVector9.xyz = float3(0.0625,0.0625,0.0625) * workingVector8.xyz;
          workingVector9.xyz = floor(workingVector9.xyz);
          workingVector8.xyz = -workingVector9.xyz * float3(16,16,16) + workingVector8.xyz;
          workingVector8.xyz = (uint3)workingVector8.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector8.z = (((uint)workingVector8.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.y << 0) & bitMask.x) | ((uint)workingVector8.x & ~bitMask.x);
          workingVector8.x = (int)workingVector8.z + (int)workingVector8.x;
          workingVector1.y = (int)workingVector1.y + (int)workingVector8.x;
          workingVector1.y = workingVector5.y ? workingVector6.y : workingVector1.y;
          workingVector5.y = workingVector5.y ? 0 : workingVector8.w;
          workingVector8.x = sampledResource11[workingVector1.y].val[0/4];
          workingVector8.yzw = (uint3)workingVector8.xxx >> int3(8,16,24);
          workingVector9.xyzw = (int4)workingVector8.xyzw & int4(255,255,255,255);
          workingVector9.xyzw = (uint4)workingVector9.xyzw;
          workingVector9.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector9.xyzw;
          workingVector8.yzw = workingVector9.xyz * workingVector9.www;
          workingVector8.yzw = float3(6,6,6) * workingVector8.yzw;
          workingVector8.xyz = workingVector8.xxx ? workingVector8.yzw : float3(0,0,0);
          workingVector12.xyz = workingVector5.yyy ? float3(0,0,0) : workingVector8.xyz;
          workingVector8.xyz = workingVector6.xzw * float3(16,16,16) + workingVector10.xyz;
          workingVector9.xyz = RD_COMPARISON_MASK(workingVector10.xyz < float3(0,0,0));
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector10.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.y = (((uint)workingVector9.x << 0) & bitMask.y) | ((uint)workingVector15.x & ~bitMask.y);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector9.x = (((uint)workingVector9.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector9.y = (((uint)workingVector9.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
          workingVector1.y = (int)workingVector1.y + (int)workingVector9.x;
          workingVector1.y = (int)workingVector15.y + (int)workingVector1.y;
          workingVector1.y = (int)workingVector9.y + (int)workingVector1.y;
          workingVector1.y = (int)workingVector15.z + (int)workingVector1.y;
          workingVector5.y = RD_COMPARISON_MASK((int)icb[workingVector1.y+0].x < 0);
          workingVector9.xyz = (uint3)workingVector10.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector9.x = (((uint)workingVector9.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector9.z = (((uint)workingVector9.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.y = (((uint)workingVector9.y << 0) & bitMask.y) | ((uint)workingVector9.x & ~bitMask.y);
          workingVector6.y = (int)workingVector9.z + (int)workingVector6.y;
          workingVector6.y = (int)workingVector0.y + (int)workingVector6.y;
          workingVector8.w = 1 << (int)icb[workingVector1.y+0].x;
          workingVector8.w = (int)workingVector7.x & (int)workingVector8.w;
          workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
          workingVector1.y = (int)workingVector7.w + (int)icb[workingVector1.y+0].x;
          workingVector1.y = sampledResource11[workingVector1.y].val[0/4];
          workingVector1.y = (uint)workingVector1.y >> 2;
          workingVector9.xyz = float3(0.0625,0.0625,0.0625) * workingVector8.xyz;
          workingVector9.xyz = floor(workingVector9.xyz);
          workingVector8.xyz = -workingVector9.xyz * float3(16,16,16) + workingVector8.xyz;
          workingVector8.xyz = (uint3)workingVector8.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector8.z = (((uint)workingVector8.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.y << 0) & bitMask.x) | ((uint)workingVector8.x & ~bitMask.x);
          workingVector8.x = (int)workingVector8.z + (int)workingVector8.x;
          workingVector1.y = (int)workingVector1.y + (int)workingVector8.x;
          workingVector1.y = workingVector5.y ? workingVector6.y : workingVector1.y;
          workingVector5.y = workingVector5.y ? 0 : workingVector8.w;
          workingVector8.x = sampledResource11[workingVector1.y].val[0/4];
          workingVector8.yzw = (uint3)workingVector8.xxx >> int3(8,16,24);
          workingVector9.xyzw = (int4)workingVector8.xyzw & int4(255,255,255,255);
          workingVector9.xyzw = (uint4)workingVector9.xyzw;
          workingVector9.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector9.xyzw;
          workingVector8.yzw = workingVector9.xyz * workingVector9.www;
          workingVector8.yzw = float3(6,6,6) * workingVector8.yzw;
          workingVector8.xyz = workingVector8.xxx ? workingVector8.yzw : float3(0,0,0);
          workingVector13.xyz = workingVector5.yyy ? float3(0,0,0) : workingVector8.xyz;
          workingVector8.xyz = workingVector6.xzw * float3(16,16,16) + workingVector4.xyz;
          workingVector9.xyz = RD_COMPARISON_MASK(workingVector4.xyz < float3(0,0,0));
          workingVector10.xyz = RD_COMPARISON_MASK(workingVector4.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector10.x = (((uint)workingVector10.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector10.y = (((uint)workingVector10.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector10.z = (((uint)workingVector10.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.y = (((uint)workingVector9.x << 0) & bitMask.y) | ((uint)workingVector10.x & ~bitMask.y);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector9.x = (((uint)workingVector9.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector9.y = (((uint)workingVector9.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
          workingVector1.y = (int)workingVector1.y + (int)workingVector9.x;
          workingVector1.y = (int)workingVector10.y + (int)workingVector1.y;
          workingVector1.y = (int)workingVector9.y + (int)workingVector1.y;
          workingVector1.y = (int)workingVector10.z + (int)workingVector1.y;
          workingVector5.y = RD_COMPARISON_MASK((int)icb[workingVector1.y+0].x < 0);
          workingVector4.xyz = (uint3)workingVector4.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector4.x = (((uint)workingVector4.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector4.z = (((uint)workingVector4.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector4.x = (((uint)workingVector4.y << 0) & bitMask.x) | ((uint)workingVector4.x & ~bitMask.x);
          workingVector4.x = (int)workingVector4.z + (int)workingVector4.x;
          workingVector4.x = (int)workingVector0.y + (int)workingVector4.x;
          workingVector4.y = 1 << (int)icb[workingVector1.y+0].x;
          workingVector4.y = (int)workingVector4.y & (int)workingVector7.x;
          workingVector4.y = RD_COMPARISON_MASK((int)workingVector4.y == 0);
          workingVector1.y = (int)workingVector7.w + (int)icb[workingVector1.y+0].x;
          workingVector1.y = sampledResource11[workingVector1.y].val[0/4];
          workingVector1.y = (uint)workingVector1.y >> 2;
          workingVector9.xyz = float3(0.0625,0.0625,0.0625) * workingVector8.xyz;
          workingVector9.xyz = floor(workingVector9.xyz);
          workingVector8.xyz = -workingVector9.xyz * float3(16,16,16) + workingVector8.xyz;
          workingVector8.xyz = (uint3)workingVector8.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector7.x = (((uint)workingVector8.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector7.w = (((uint)workingVector8.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector4.z = (((uint)workingVector8.y << 0) & bitMask.z) | ((uint)workingVector7.x & ~bitMask.z);
          workingVector4.z = (int)workingVector7.w + (int)workingVector4.z;
          workingVector1.y = (int)workingVector1.y + (int)workingVector4.z;
          workingVector1.y = workingVector5.y ? workingVector4.x : workingVector1.y;
          workingVector4.x = workingVector5.y ? 0 : workingVector4.y;
          workingVector8.x = sampledResource11[workingVector1.y].val[0/4];
          workingVector8.yzw = (uint3)workingVector8.xxx >> int3(8,16,24);
          workingVector9.xyzw = (int4)workingVector8.xyzw & int4(255,255,255,255);
          workingVector9.xyzw = (uint4)workingVector9.xyzw;
          workingVector9.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector9.xyzw;
          workingVector8.yzw = workingVector9.xyz * workingVector9.www;
          workingVector8.yzw = float3(6,6,6) * workingVector8.yzw;
          workingVector8.xyz = workingVector8.xxx ? workingVector8.yzw : float3(0,0,0);
          workingVector14.xyz = workingVector4.xxx ? float3(0,0,0) : workingVector8.xyz;
        }
        workingVector4.xyz = workingVector12.xyz * workingVector2.www;
        workingVector4.xyz = workingVector11.xyz * workingVector3.www + workingVector4.xyz;
        workingVector4.xyz = workingVector13.xyz * workingVector1.www + workingVector4.xyz;
        workingVector4.xyz = workingVector14.xyz * workingVector0.xxx + workingVector4.xyz;
      } else {
        workingVector8.xyz = floor(workingVector3.xyz);
        workingVector3.xyz = -workingVector8.xyz + workingVector3.xyz;
        workingVector9.xyz = RD_COMPARISON_MASK(workingVector3.xyx >= workingVector3.yzz);
        bitMask.y = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector1.y = (((uint)workingVector9.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
        bitMask.w = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector1.w = (((uint)workingVector9.z << 2) & bitMask.w) | ((uint)0 & ~bitMask.w);
        bitMask.x = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.x = (((uint)workingVector9.x << 0) & bitMask.x) | ((uint)workingVector1.y & ~bitMask.x);
        workingVector0.x = (int)workingVector1.w + (int)workingVector0.x;
        workingVector1.y = min(workingVector3.x, workingVector3.y);
        workingVector1.w = max(workingVector3.x, workingVector3.y);
        workingVector2.w = min(workingVector1.y, workingVector3.z);
        workingVector3.x = max(workingVector1.w, workingVector3.z);
        workingVector1.w = min(workingVector1.w, workingVector3.z);
        workingVector1.y = max(workingVector1.w, workingVector1.y);
        workingVector1.w = 1 + -workingVector3.x;
        workingVector3.x = workingVector3.x + -workingVector1.y;
        workingVector1.y = workingVector1.y + -workingVector2.w;
        workingVector3.yzw = RD_COMPARISON_MASK(workingVector8.xyz >= float3(0,0,0));
        workingVector3.y = workingVector3.z ? workingVector3.y : 0;
        workingVector3.y = workingVector3.w ? workingVector3.y : 0;
        workingVector9.xyz = float3(1,1,1) + workingVector8.xyz;
        workingVector10.xyz = RD_COMPARISON_MASK(workingVector9.xyz < float3(16,16,16));
        workingVector3.z = workingVector10.y ? workingVector10.x : 0;
        workingVector3.z = workingVector10.z ? workingVector3.z : 0;
        workingVector3.y = workingVector3.z ? workingVector3.y : 0;
        if (workingVector3.y != 0) {
          workingVector3.yzw = (uint3)workingVector8.xyz;
          workingVector7.xw = RD_COMPARISON_MASK((uint2)workingVector0.xx < int2(2,6));
          workingVector10.xz = workingVector7.xw ? float2(0,0) : 0;
          workingVector10.yw = icb[workingVector0.x+0].yz;
          workingVector11.xyz = (int3)workingVector3.yzw + (int3)workingVector10.ywx;
          workingVector10.xy = icb[workingVector0.x+8].yz;
          workingVector10.xyz = (int3)workingVector3.yzw + (int3)workingVector10.xyz;
          workingVector12.xyz = (int3)workingVector3.yzw + int3(1,1,1);
          workingVector3.yw = (uint2)workingVector3.wy << int2(4,8);
          workingVector3.y = (int)workingVector3.y + (int)workingVector3.z;
          workingVector3.y = (int)workingVector3.w + (int)workingVector3.y;
          workingVector3.y = (int)workingVector0.y + (int)workingVector3.y;
          workingVector13.x = sampledResource11[workingVector3.y].val[0/4];
          workingVector13.yzw = (uint3)workingVector13.xxx >> int3(8,16,24);
          workingVector14.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
          workingVector14.xyzw = (uint4)workingVector14.xyzw;
          workingVector14.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector14.xyzw;
          workingVector3.yzw = workingVector14.xyz * workingVector14.www;
          workingVector3.yzw = float3(6,6,6) * workingVector3.yzw;
          workingVector3.yzw = workingVector13.xxx ? workingVector3.yzw : float3(0,0,0);
          workingVector7.xw = (uint2)workingVector11.zx << int2(4,8);
          workingVector5.y = (int)workingVector7.x + (int)workingVector11.y;
          workingVector5.y = (int)workingVector7.w + (int)workingVector5.y;
          workingVector5.y = (int)workingVector0.y + (int)workingVector5.y;
          workingVector11.x = sampledResource11[workingVector5.y].val[0/4];
          workingVector11.yzw = (uint3)workingVector11.xxx >> int3(8,16,24);
          workingVector13.xyzw = (int4)workingVector11.xyzw & int4(255,255,255,255);
          workingVector13.xyzw = (uint4)workingVector13.xyzw;
          workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
          workingVector11.yzw = workingVector13.xyz * workingVector13.www;
          workingVector11.yzw = float3(6,6,6) * workingVector11.yzw;
          workingVector11.xyz = workingVector11.xxx ? workingVector11.yzw : float3(0,0,0);
          workingVector7.xw = (uint2)workingVector10.zx << int2(4,8);
          workingVector5.y = (int)workingVector7.x + (int)workingVector10.y;
          workingVector5.y = (int)workingVector7.w + (int)workingVector5.y;
          workingVector5.y = (int)workingVector0.y + (int)workingVector5.y;
          workingVector10.x = sampledResource11[workingVector5.y].val[0/4];
          workingVector10.yzw = (uint3)workingVector10.xxx >> int3(8,16,24);
          workingVector13.xyzw = (int4)workingVector10.xyzw & int4(255,255,255,255);
          workingVector13.xyzw = (uint4)workingVector13.xyzw;
          workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
          workingVector10.yzw = workingVector13.xyz * workingVector13.www;
          workingVector10.yzw = float3(6,6,6) * workingVector10.yzw;
          workingVector10.xyz = workingVector10.xxx ? workingVector10.yzw : float3(0,0,0);
          workingVector7.xw = (uint2)workingVector12.zx << int2(4,8);
          workingVector5.y = (int)workingVector7.x + (int)workingVector12.y;
          workingVector5.y = (int)workingVector7.w + (int)workingVector5.y;
          workingVector5.y = (int)workingVector0.y + (int)workingVector5.y;
          workingVector12.x = sampledResource11[workingVector5.y].val[0/4];
          workingVector12.yzw = (uint3)workingVector12.xxx >> int3(8,16,24);
          workingVector13.xyzw = (int4)workingVector12.xyzw & int4(255,255,255,255);
          workingVector13.xyzw = (uint4)workingVector13.xyzw;
          workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
          workingVector12.yzw = workingVector13.xyz * workingVector13.www;
          workingVector12.yzw = float3(6,6,6) * workingVector12.yzw;
          workingVector12.xyz = workingVector12.xxx ? workingVector12.yzw : float3(0,0,0);
        } else {
          workingVector7.xw = RD_COMPARISON_MASK((uint2)workingVector0.xx < int2(2,6));
          workingVector7.xw = workingVector7.xw ? float2(0,0) : 0;
          workingVector13.xy = (uint2)icb[workingVector0.x+0].yz;
          workingVector13.z = (uint)workingVector7.x;
          workingVector13.xyz = workingVector13.xyz + workingVector8.xyz;
          workingVector14.xy = (uint2)icb[workingVector0.x+8].yz;
          workingVector14.z = (uint)workingVector7.w;
          workingVector14.xyz = workingVector14.xyz + workingVector8.xyz;
          workingVector15.xyz = workingVector6.xzw * float3(16,16,16) + workingVector8.xyz;
          workingVector16.xyz = RD_COMPARISON_MASK(workingVector8.xyz < float3(0,0,0));
          workingVector17.xyz = RD_COMPARISON_MASK(workingVector8.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector17.x = (((uint)workingVector17.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector17.y = (((uint)workingVector17.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector17.z = (((uint)workingVector17.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.x = (((uint)workingVector16.x << 0) & bitMask.x) | ((uint)workingVector17.x & ~bitMask.x);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector7.x = (((uint)workingVector16.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector7.w = (((uint)workingVector16.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
          workingVector0.x = (int)workingVector0.x + (int)workingVector7.x;
          workingVector0.x = (int)workingVector17.y + (int)workingVector0.x;
          workingVector0.x = (int)workingVector7.w + (int)workingVector0.x;
          workingVector0.x = (int)workingVector17.z + (int)workingVector0.x;
          workingVector5.y = RD_COMPARISON_MASK((int)icb[workingVector0.x+0].x < 0);
          workingVector8.xyz = (uint3)workingVector8.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector7.x = (((uint)workingVector8.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector7.w = (((uint)workingVector8.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.y = (((uint)workingVector8.y << 0) & bitMask.y) | ((uint)workingVector7.x & ~bitMask.y);
          workingVector6.y = (int)workingVector7.w + (int)workingVector6.y;
          workingVector6.y = (int)workingVector0.y + (int)workingVector6.y;
          workingVector7.xw = (int2)workingVector0.yy + int2(4096,4097);
          workingVector7.x = sampledResource11[workingVector7.x].val[0/4];
          workingVector8.x = 1 << (int)icb[workingVector0.x+0].x;
          workingVector8.x = (int)workingVector7.x & (int)workingVector8.x;
          workingVector8.x = RD_COMPARISON_MASK((int)workingVector8.x == 0);
          workingVector0.x = (int)workingVector7.w + (int)icb[workingVector0.x+0].x;
          workingVector0.x = sampledResource11[workingVector0.x].val[0/4];
          workingVector0.x = (uint)workingVector0.x >> 2;
          workingVector8.yzw = float3(0.0625,0.0625,0.0625) * workingVector15.xyz;
          workingVector8.yzw = floor(workingVector8.yzw);
          workingVector8.yzw = -workingVector8.yzw * float3(16,16,16) + workingVector15.xyz;
          workingVector8.yzw = (uint3)workingVector8.yzw;
          bitMask.y = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector8.y = (((uint)workingVector8.w << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector8.w = (((uint)workingVector8.y << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.y = (((uint)workingVector8.z << 0) & bitMask.y) | ((uint)workingVector8.y & ~bitMask.y);
          workingVector8.y = (int)workingVector8.w + (int)workingVector8.y;
          workingVector0.x = (int)workingVector0.x + (int)workingVector8.y;
          workingVector0.x = workingVector5.y ? workingVector6.y : workingVector0.x;
          workingVector5.y = workingVector5.y ? 0 : workingVector8.x;
          workingVector8.x = sampledResource11[workingVector0.x].val[0/4];
          workingVector8.yzw = (uint3)workingVector8.xxx >> int3(8,16,24);
          workingVector15.xyzw = workingVector8.xyzw ? float4(0,0,0,0) : 0;
          workingVector15.xyzw = (uint4)workingVector15.xyzw;
          workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
          workingVector8.yzw = workingVector15.xyz * workingVector15.www;
          workingVector8.yzw = float3(6,6,6) * workingVector8.yzw;
          workingVector8.xyz = workingVector8.xxx ? workingVector8.yzw : float3(0,0,0);
          workingVector3.yzw = workingVector5.yyy ? float3(0,0,0) : workingVector8.xyz;
          workingVector8.xyz = workingVector6.xzw * float3(16,16,16) + workingVector13.xyz;
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector13.xyz < float3(0,0,0));
          workingVector16.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector16.y = (((uint)workingVector16.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector16.z = (((uint)workingVector16.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.x = (((uint)workingVector15.x << 0) & bitMask.x) | ((uint)workingVector16.x & ~bitMask.x);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
          workingVector0.x = (int)workingVector0.x + (int)workingVector15.x;
          workingVector0.x = (int)workingVector16.y + (int)workingVector0.x;
          workingVector0.x = (int)workingVector15.y + (int)workingVector0.x;
          workingVector0.x = (int)workingVector16.z + (int)workingVector0.x;
          workingVector5.y = RD_COMPARISON_MASK((int)icb[workingVector0.x+0].x < 0);
          workingVector13.xyz = (uint3)workingVector13.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.y = (((uint)workingVector13.y << 0) & bitMask.y) | ((uint)workingVector13.x & ~bitMask.y);
          workingVector6.y = (int)workingVector13.z + (int)workingVector6.y;
          workingVector6.y = (int)workingVector0.y + (int)workingVector6.y;
          workingVector8.w = 1 << (int)icb[workingVector0.x+0].x;
          workingVector8.w = (int)workingVector7.x & (int)workingVector8.w;
          workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
          workingVector0.x = (int)workingVector7.w + (int)icb[workingVector0.x+0].x;
          workingVector0.x = sampledResource11[workingVector0.x].val[0/4];
          workingVector0.x = (uint)workingVector0.x >> 2;
          workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector8.xyz;
          workingVector13.xyz = floor(workingVector13.xyz);
          workingVector8.xyz = -workingVector13.xyz * float3(16,16,16) + workingVector8.xyz;
          workingVector8.xyz = (uint3)workingVector8.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector8.z = (((uint)workingVector8.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.y << 0) & bitMask.x) | ((uint)workingVector8.x & ~bitMask.x);
          workingVector8.x = (int)workingVector8.z + (int)workingVector8.x;
          workingVector0.x = (int)workingVector0.x + (int)workingVector8.x;
          workingVector0.x = workingVector5.y ? workingVector6.y : workingVector0.x;
          workingVector5.y = workingVector5.y ? 0 : workingVector8.w;
          workingVector8.x = sampledResource11[workingVector0.x].val[0/4];
          workingVector8.yzw = (uint3)workingVector8.xxx >> int3(8,16,24);
          workingVector13.xyzw = (int4)workingVector8.xyzw & int4(255,255,255,255);
          workingVector13.xyzw = (uint4)workingVector13.xyzw;
          workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
          workingVector8.yzw = workingVector13.xyz * workingVector13.www;
          workingVector8.yzw = float3(6,6,6) * workingVector8.yzw;
          workingVector8.xyz = workingVector8.xxx ? workingVector8.yzw : float3(0,0,0);
          workingVector11.xyz = workingVector5.yyy ? float3(0,0,0) : workingVector8.xyz;
          workingVector8.xyz = workingVector6.xzw * float3(16,16,16) + workingVector14.xyz;
          workingVector13.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.x = (((uint)workingVector13.x << 0) & bitMask.x) | ((uint)workingVector15.x & ~bitMask.x);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector13.y = (((uint)workingVector13.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
          workingVector0.x = (int)workingVector0.x + (int)workingVector13.x;
          workingVector0.x = (int)workingVector15.y + (int)workingVector0.x;
          workingVector0.x = (int)workingVector13.y + (int)workingVector0.x;
          workingVector0.x = (int)workingVector15.z + (int)workingVector0.x;
          workingVector5.y = RD_COMPARISON_MASK((int)icb[workingVector0.x+0].x < 0);
          workingVector13.xyz = (uint3)workingVector14.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.y = (((uint)workingVector13.y << 0) & bitMask.y) | ((uint)workingVector13.x & ~bitMask.y);
          workingVector6.y = (int)workingVector13.z + (int)workingVector6.y;
          workingVector6.y = (int)workingVector0.y + (int)workingVector6.y;
          workingVector8.w = 1 << (int)icb[workingVector0.x+0].x;
          workingVector8.w = (int)workingVector7.x & (int)workingVector8.w;
          workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
          workingVector0.x = (int)workingVector7.w + (int)icb[workingVector0.x+0].x;
          workingVector0.x = sampledResource11[workingVector0.x].val[0/4];
          workingVector0.x = (uint)workingVector0.x >> 2;
          workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector8.xyz;
          workingVector13.xyz = floor(workingVector13.xyz);
          workingVector8.xyz = -workingVector13.xyz * float3(16,16,16) + workingVector8.xyz;
          workingVector8.xyz = (uint3)workingVector8.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector8.z = (((uint)workingVector8.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.y << 0) & bitMask.x) | ((uint)workingVector8.x & ~bitMask.x);
          workingVector8.x = (int)workingVector8.z + (int)workingVector8.x;
          workingVector0.x = (int)workingVector0.x + (int)workingVector8.x;
          workingVector0.x = workingVector5.y ? workingVector6.y : workingVector0.x;
          workingVector5.y = workingVector5.y ? 0 : workingVector8.w;
          workingVector8.x = sampledResource11[workingVector0.x].val[0/4];
          workingVector8.yzw = (uint3)workingVector8.xxx >> int3(8,16,24);
          workingVector13.xyzw = (int4)workingVector8.xyzw & int4(255,255,255,255);
          workingVector13.xyzw = (uint4)workingVector13.xyzw;
          workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
          workingVector8.yzw = workingVector13.xyz * workingVector13.www;
          workingVector8.yzw = float3(6,6,6) * workingVector8.yzw;
          workingVector8.xyz = workingVector8.xxx ? workingVector8.yzw : float3(0,0,0);
          workingVector10.xyz = workingVector5.yyy ? float3(0,0,0) : workingVector8.xyz;
          workingVector6.xyz = workingVector6.xzw * float3(16,16,16) + workingVector9.xyz;
          workingVector8.xyz = RD_COMPARISON_MASK(workingVector9.xyz < float3(0,0,0));
          workingVector13.xyz = RD_COMPARISON_MASK(workingVector9.xyz >= float3(16,16,16));
          bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector13.y = (((uint)workingVector13.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.x = (((uint)workingVector8.x << 0) & bitMask.x) | ((uint)workingVector13.x & ~bitMask.x);
          bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector8.y = (((uint)workingVector8.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
          workingVector0.x = (int)workingVector0.x + (int)workingVector8.x;
          workingVector0.x = (int)workingVector13.y + (int)workingVector0.x;
          workingVector0.x = (int)workingVector8.y + (int)workingVector0.x;
          workingVector0.x = (int)workingVector13.z + (int)workingVector0.x;
          workingVector5.y = RD_COMPARISON_MASK((int)icb[workingVector0.x+0].x < 0);
          workingVector8.xyz = (uint3)workingVector9.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector8.z = (((uint)workingVector8.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector8.y << 0) & bitMask.w) | ((uint)workingVector8.x & ~bitMask.w);
          workingVector6.w = (int)workingVector8.z + (int)workingVector6.w;
          workingVector0.y = (int)workingVector0.y + (int)workingVector6.w;
          workingVector6.w = 1 << (int)icb[workingVector0.x+0].x;
          workingVector6.w = (int)workingVector6.w & (int)workingVector7.x;
          workingVector6.w = RD_COMPARISON_MASK((int)workingVector6.w == 0);
          workingVector0.x = (int)workingVector7.w + (int)icb[workingVector0.x+0].x;
          workingVector0.x = sampledResource11[workingVector0.x].val[0/4];
          workingVector0.x = (uint)workingVector0.x >> 2;
          workingVector8.xyz = float3(0.0625,0.0625,0.0625) * workingVector6.xyz;
          workingVector8.xyz = floor(workingVector8.xyz);
          workingVector6.xyz = -workingVector8.xyz * float3(16,16,16) + workingVector6.xyz;
          workingVector6.xyz = (uint3)workingVector6.xyz;
          bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector6.x = (((uint)workingVector6.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
          bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector6.z = (((uint)workingVector6.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.x = (((uint)workingVector6.y << 0) & bitMask.x) | ((uint)workingVector6.x & ~bitMask.x);
          workingVector6.x = (int)workingVector6.z + (int)workingVector6.x;
          workingVector0.x = (int)workingVector0.x + (int)workingVector6.x;
          workingVector0.x = workingVector5.y ? workingVector0.y : workingVector0.x;
          workingVector0.y = workingVector5.y ? 0 : workingVector6.w;
          workingVector6.x = sampledResource11[workingVector0.x].val[0/4];
          workingVector6.yzw = (uint3)workingVector6.xxx >> int3(8,16,24);
          workingVector8.xyzw = (int4)workingVector6.xyzw & int4(255,255,255,255);
          workingVector8.xyzw = (uint4)workingVector8.xyzw;
          workingVector8.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector8.xyzw;
          workingVector6.yzw = workingVector8.xyz * workingVector8.www;
          workingVector6.yzw = float3(6,6,6) * workingVector6.yzw;
          workingVector6.xyz = workingVector6.xxx ? workingVector6.yzw : float3(0,0,0);
          workingVector12.xyz = workingVector0.yyy ? float3(0,0,0) : workingVector6.xyz;
        }
        workingVector6.xyz = workingVector11.xyz * workingVector3.xxx;
        workingVector3.xyz = workingVector3.yzw * workingVector1.www + workingVector6.xyz;
        workingVector3.xyz = workingVector10.xyz * workingVector1.yyy + workingVector3.xyz;
        workingVector4.xyz = workingVector12.xyz * workingVector2.www + workingVector3.xyz;
      }
    } else {
      workingVector4.xyz = float3(0,0,0);
    }
  } else {
    if (8 == 0) workingVector0.x = 0; else if (8+8 < 32) {     workingVector0.x = (uint)workingVector7.y << (32-(8 + 8)); workingVector0.x = (uint)workingVector0.x >> (32-8);    } else workingVector0.x = (uint)workingVector7.y >> 8;
    if (8 == 0) workingVector0.y = 0; else if (8+8 < 32) {     workingVector0.y = (uint)workingVector7.z << (32-(8 + 8)); workingVector0.y = (uint)workingVector0.y >> (32-8);    } else workingVector0.y = (uint)workingVector7.z >> 8;
    workingVector1.yw = (int2)workingVector7.yz & int2(255,255);
    workingVector3.xz = (uint2)workingVector0.xy;
    workingVector3.yw = (uint2)workingVector1.yw;
    workingVector3.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector3.xyzw;
    workingVector3.xyz = workingVector3.xyz * workingVector3.www;
    workingVector4.xyz = float3(6,6,6) * workingVector3.xyz;
  }
  workingVector0.x = workingVector1.x * workingVector1.x;
  workingVector0.y = workingVector0.x * workingVector0.x;
  workingVector0.y = workingVector0.y * workingVector1.x;
  workingVector0.x = workingVector0.x * workingVector1.x + -workingVector0.y;
  workingVector0.x = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector0.x + workingVector0.y;
  workingVector1.xyw = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.xxx;
  workingVector1.xyw = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector1.xyw;
  workingVector1.xyw = workingVector4.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector1.xyw;
  workingVector3.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector1.xyw = max(workingVector3.xyz, workingVector1.xyw);
  workingVector1.xyw = workingVector4.www * workingVector1.xyw;
  fragmentColor1.xyz = workingVector1.xyw * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www + workingVector2.xyz;
  fragmentColor0.xy = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.x = 65535 * workingVector1.z;
#endif
  workingVector0.x = floor(workingVector0.x);
  fragmentColor0.z = 1.52590219e-005 * workingVector0.x;
#if RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF || RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  fragmentColor0.w = workingVector0.w * 65535 + -workingVector0.x;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
  fragmentColor0.w = workingVector1.z * 65535 + -workingVector0.x;
#endif
  fragmentColor1.w = 1;
#if RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF
  fragmentColor2.xyz = workingVector2.xyz;
  fragmentColor2.w = 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  fragmentColor2.xyzw = float4(0,0,0,1);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
  fragmentColor2.xyz = workingVector5.xzw;
  fragmentColor2.w = 1;
#endif
  return;
}
#endif
