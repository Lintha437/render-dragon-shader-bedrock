// DeferredIndirectSpecular / DoIndirectSpecularShading / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 5
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_MODE
#define RD_OPTION_MODE RD_MODE_DEFAULT
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_10 1
#endif

#include "../../include/materials/DeferredIndirectSpecular/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_PLATFORM == RD_PLATFORM_SM40
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  fragmentColor0.xyzw = float4(0,0,0,0);
  return;
#elif (RD_OPTION_MODE == RD_MODE_DEFAULT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_MODE == RD_MODE_DEFAULT && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = normalTexture.Sample(normalSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float4 sampledTextureValue1 = sceneDepthTexture.Sample(sceneDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float productValue = (scalarValue2 * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue = (RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x) / productValue;
    float quotientValue1 = (RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y) / productValue;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue;
    float multiplyAddValue = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z;
    float quotientValue3 = ((RD_UNIFORM_SUB_PIXEL_OFFSET.x + varyingColor1.x) * RD_UNIFORM_INV_PROJ_ROW_0.x) / productValue;
    float quotientValue4 = ((varyingColor1.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y) * RD_UNIFORM_INV_PROJ_ROW_1.y) / productValue;
    float multiplyAddValue3 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x) - RD_UNIFORM_WORLD_ORIGIN.x;
    float multiplyAddValue4 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y) - RD_UNIFORM_WORLD_ORIGIN.y;
    float multiplyAddValue5 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z) - RD_UNIFORM_WORLD_ORIGIN.z;
    float scalarValue3 = ddx_coarse(quotientValue3);
    float scalarValue4 = ddx_coarse(quotientValue4);
    float scalarValue5 = ddx_coarse(quotientValue2);
    float inverseLengthValue = rsqrt(dot(float3(scalarValue3, scalarValue4, scalarValue5), float3(scalarValue3, scalarValue4, scalarValue5)));
    float productValue1 = inverseLengthValue * scalarValue3;
    float productValue2 = inverseLengthValue * scalarValue4;
    float productValue3 = inverseLengthValue * scalarValue5;
    float sumValue = ddy_coarse((-0.0f) - quotientValue3);
    float sumValue1 = ddy_coarse((-0.0f) - quotientValue4);
    float sumValue2 = ddy_coarse((-0.0f) - quotientValue2);
    float inverseLengthValue1 = rsqrt(dot(float3(sumValue, sumValue1, sumValue2), float3(sumValue, sumValue1, sumValue2)));
    float productValue4 = inverseLengthValue1 * sumValue;
    float productValue5 = inverseLengthValue1 * sumValue1;
    float productValue6 = inverseLengthValue1 * sumValue2;
    float productValue7 = (productValue6 * productValue2) - (productValue5 * productValue3);
    float productValue8 = (productValue4 * productValue3) - (productValue6 * productValue1);
    float productValue9 = (productValue5 * productValue1) - (productValue4 * productValue2);
    float inverseLengthValue2 = rsqrt(dot(float3(productValue7, productValue8, productValue9), float3(productValue7, productValue8, productValue9)));
    float productValue10 = productValue7 * inverseLengthValue2;
    float productValue11 = productValue8 * inverseLengthValue2;
    float productValue12 = productValue9 * inverseLengthValue2;
    float multiplyAddValue6 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue12, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue11, productValue10 * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue7 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue12, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue11, productValue10 * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue8 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue12, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue11, productValue10 * RD_UNIFORM_INV_VIEW_ROW_0.z));
    float inverseLengthValue3 = rsqrt(dot(float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8), float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8)));
    float quotientValue5 = round((inverseLengthValue3 * multiplyAddValue6) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue6 = round((inverseLengthValue3 * multiplyAddValue7) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue7 = round((inverseLengthValue3 * multiplyAddValue8) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float inverseLengthValue4 = rsqrt(dot(float3(quotientValue5, quotientValue6, quotientValue7), float3(quotientValue5, quotientValue6, quotientValue7)));
    float productValue13 = inverseLengthValue4 * quotientValue5;
    float productValue14 = inverseLengthValue4 * quotientValue6;
    float productValue15 = inverseLengthValue4 * quotientValue7;
    float productValue16 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
    float quotientValue8 = productValue16 - (multiplyAddValue3 - (floor(multiplyAddValue3 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue9 = productValue16 - (multiplyAddValue4 - (floor(multiplyAddValue4 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue10 = productValue16 - (multiplyAddValue5 - (floor(multiplyAddValue5 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float dotProductValue = dot(float3(quotientValue8, quotientValue9, quotientValue10), float3(productValue13, productValue14, productValue15));
    float productValue17 = ((quotientValue8 + multiplyAddValue3) - (dotProductValue * productValue13)) + RD_UNIFORM_WORLD_ORIGIN.x;
    float productValue18 = ((multiplyAddValue4 - (dotProductValue * productValue14)) + quotientValue9) + RD_UNIFORM_WORLD_ORIGIN.y;
    float productValue19 = ((multiplyAddValue5 - (dotProductValue * productValue15)) + quotientValue10) + RD_UNIFORM_WORLD_ORIGIN.z;
    float sumValue3 = 1.0f - abs(scalarValue);
    float scalarValue6 = abs(scalarValue1);
    float sumValue4 = sumValue3 - scalarValue6;
    bool conditionValue = sumValue4 < 0.0f;
    float comparisonValue = conditionValue ? ((1.0f - scalarValue6) * ((scalarValue < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue;
    float comparisonValue1 = conditionValue ? (sumValue3 * ((scalarValue1 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue1;
    float inverseLengthValue5 = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue4), float3(comparisonValue, comparisonValue1, sumValue4)));
    float productValue20 = comparisonValue * inverseLengthValue5;
    float productValue21 = comparisonValue1 * inverseLengthValue5;
    float productValue22 = inverseLengthValue5 * sumValue4;
    float inverseLengthValue6 = rsqrt(dot(float3(productValue20, productValue21, productValue22), float3(productValue20, productValue21, productValue22)));
    float productValue23 = inverseLengthValue6 * productValue20;
    float productValue24 = productValue21 * inverseLengthValue6;
    float productValue25 = inverseLengthValue6 * productValue22;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue25, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue24, productValue23 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue25, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue24, productValue23 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue25, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue24, productValue23 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue26 = inverseLengthValue7 * multiplyAddValue9;
    float productValue27 = inverseLengthValue7 * multiplyAddValue10;
    float productValue28 = inverseLengthValue7 * multiplyAddValue11;
    float4 sampledTextureValue2 = colorMetalnessSubsurfaceTexture.Sample(colorMetalnessSubsurfaceSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue2.x;
    float scalarValue8 = sampledTextureValue2.y;
    float scalarValue9 = sampledTextureValue2.z;
    float clampedValue = clamp((sampledTextureValue2.w + (-0.501960813999176025390625f)) * 2.007874011993408203125f, 0.0f, 1.0f);
    uint unusedTextureMipCount410;
    uint2 vectorValue = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount410);
    uint4 loadedBufferValue = emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y))), 0u));
    uint scalarValue10 = loadedBufferValue.y;
    uint scalarValue11 = loadedBufferValue.z;
    float bitwiseValue = float((loadedBufferValue.x >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    float bitwiseValue1 = float(scalarValue11 & 255u) * 9.2272217443678528070449829101562e-05f;
    float bitwiseValue2 = bitwiseValue1 * float((scalarValue10 >> 8u) & 255u);
    float bitwiseValue3 = bitwiseValue1 * float(scalarValue10 & 255u);
    float bitwiseValue4 = bitwiseValue1 * float((scalarValue11 >> 8u) & 255u);
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
        exponentialValue = exp2(log2(max(scalarValue7, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(scalarValue8, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(scalarValue9, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (scalarValue7 <= 0.040449999272823333740234375f) ? (scalarValue7 * 0.077399380505084991455078125f) : exp2(log2((scalarValue7 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (scalarValue8 <= 0.040449999272823333740234375f) ? (scalarValue8 * 0.077399380505084991455078125f) : exp2(log2((scalarValue8 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (scalarValue9 <= 0.040449999272823333740234375f) ? (scalarValue9 * 0.077399380505084991455078125f) : exp2(log2((scalarValue9 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
    float productValue29 = (1.0f - clampedValue) * 0.039999999105930328369140625f;
    float productValue30 = (exponentialValue * clampedValue) + productValue29;
    float productValue31 = (exponentialValue1 * clampedValue) + productValue29;
    float productValue32 = (exponentialValue2 * clampedValue) + productValue29;
    bool conditionValue1 = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
    float sampledTextureValue3;
    if (conditionValue1)
    {
        sampledTextureValue3 = previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x;
    }
    else
    {
        sampledTextureValue3 = 0.0f;
    }
    float clampedValue1 = clamp(((float(loadedBufferValue.w & 255u) * 0.062745101749897003173828125f) - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y) / max(RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y, 1.0f), 0.0f, 1.0f);
    float productValue33 = ((clampedValue1 * clampedValue1) * clampedValue1) * RD_UNIFORM_IBL_PARAMETERS.x;
    bool comparisonValue2 = RD_UNIFORM_IBL_PARAMETERS.x != 0.0f;
    bool comparisonValue3 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f;
    float productValue61;
    float productValue62;
    float productValue63;
    if (comparisonValue2 && (RD_UNIFORM_SSR_PARAMETERS.x != 0.0f))
    {
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
        {
            float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, productValue19, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue18, productValue17 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
            intermediateValue15 = productValue17;
            intermediateValue16 = productValue18;
            intermediateValue17 = productValue19;
            multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue19, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue18, productValue17 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
            multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue19, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue18, productValue17 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
            multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue19, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue18, productValue17 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
            multiplyAddValue16 = (mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, productValue19, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue18, productValue17 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue12;
            multiplyAddValue17 = (1.0f - ((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, productValue19, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue18, productValue17 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue12)) * 0.5f;
        }
        else
        {
            intermediateValue15 = multiplyAddValue;
            intermediateValue16 = multiplyAddValue1;
            intermediateValue17 = multiplyAddValue2;
            multiplyAddValue13 = quotientValue;
            multiplyAddValue14 = quotientValue1;
            multiplyAddValue15 = quotientValue2;
            multiplyAddValue16 = varyingColor1.x;
            multiplyAddValue17 = 1.0f - ((varyingColor1.y + 1.0f) * 0.5f);
        }
        precise float sumValue5 = multiplyAddValue16 + 1.0f;
        precise float productValue34 = sumValue5 * 0.5f;
        float sumValue6 = intermediateValue15 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue7 = intermediateValue16 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue8 = intermediateValue17 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue8 = rsqrt(dot(float3(sumValue6, sumValue7, sumValue8), float3(sumValue6, sumValue7, sumValue8)));
        float productValue35 = inverseLengthValue8 * sumValue6;
        float productValue36 = inverseLengthValue8 * sumValue7;
        float productValue37 = inverseLengthValue8 * sumValue8;
        float inverseLengthValue9 = rsqrt(dot(float3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15), float3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15)));
        float4 sampledTextureValue4 = ssrTextureTexture.Sample(ssrTextureSampler, float2(productValue34 * RD_UNIFORM_VIEWPORT_SCALE.x, multiplyAddValue17 * RD_UNIFORM_VIEWPORT_SCALE.y));
        float scalarValue12 = sampledTextureValue4.x;
        float scalarValue13 = sampledTextureValue4.y;
        float scalarValue14 = sampledTextureValue4.z;
        float quotientValue12;
        float quotientValue13;
        float quotientValue14;
        if (conditionValue1)
        {
            float quotientValue11 = (0.180000007152557373046875f / sampledTextureValue3) + 9.9999997473787516355514526367188e-05f;
            quotientValue12 = scalarValue12 / quotientValue11;
            quotientValue13 = scalarValue13 / quotientValue11;
            quotientValue14 = scalarValue14 / quotientValue11;
        }
        else
        {
            quotientValue12 = scalarValue12;
            quotientValue13 = scalarValue13;
            quotientValue14 = scalarValue14;
        }
        float dotProductValue1 = dot(float3(productValue35, productValue36, productValue37), float3(productValue23, productValue24, productValue25)) * 2.0f;
        float productValue38 = productValue35 - (dotProductValue1 * productValue23);
        float productValue39 = productValue36 - (dotProductValue1 * productValue24);
        float productValue40 = productValue37 - (dotProductValue1 * productValue25);
        float sumValue9 = 1.0f - bitwiseValue;
        float productValue41 = sumValue9 * sumValue9;
        float productValue42 = productValue41 * productValue41;
        precise float comparisonValue4 = 1.0f - ((uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u) ? productValue41 : (productValue42 * productValue42));
        precise float productValue43 = (RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f)) * comparisonValue4;
        uint scalarValue15 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
        float4 sampledTextureValue5 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue38, productValue39, productValue40, float(int(scalarValue15))), productValue43);
        float4 sampledTextureValue6 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue38, productValue39, productValue40, float(int(uint(int(scalarValue15 + 2u) - int(3u) * (int(scalarValue15 + 2u) / int(3u)))))), productValue43);
        float scalarValue16 = sampledTextureValue6.x;
        float scalarValue17 = sampledTextureValue6.y;
        float scalarValue18 = sampledTextureValue6.z;
        float productValue44 = ((sampledTextureValue5.x - scalarValue16) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue16;
        float productValue45 = ((sampledTextureValue5.y - scalarValue17) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue17;
        float productValue46 = ((sampledTextureValue5.z - scalarValue18) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue18;
        float productValue47 = productValue33 * RD_UNIFORM_IBL_PARAMETERS.z;
        float comparisonValue5 = (conditionValue1 ? (productValue44 * 301.72412109375f) : productValue44) * productValue47;
        float comparisonValue6 = (conditionValue1 ? (productValue45 * 301.72412109375f) : productValue45) * productValue47;
        float comparisonValue7 = (conditionValue1 ? (productValue46 * 301.72412109375f) : productValue46) * productValue47;
        float comparisonValue12;
        float comparisonValue13;
        float comparisonValue14;
        if (comparisonValue3)
        {
            float productValue48 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue49 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue50 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue51 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
            float productValue52 = productValue51 * bitwiseValue2;
            float productValue53 = productValue51 * bitwiseValue3;
            float productValue54 = productValue51 * bitwiseValue4;
            float clampedValue2 = clamp(dot(float3(productValue52, productValue53, productValue54), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
            float productValue55 = ((clampedValue2 * (productValue52 - productValue48)) + productValue48) * clampedValue;
            float productValue56 = ((clampedValue2 * (productValue53 - productValue49)) + productValue49) * clampedValue;
            float productValue57 = ((clampedValue2 * (productValue54 - productValue50)) + productValue50) * clampedValue;
            float intermediateValue41;
            float intermediateValue42;
            float intermediateValue43;
            bool intermediateValue44;
            if (!(dot(float3(comparisonValue5, comparisonValue6, comparisonValue7), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue55, productValue56, productValue57), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
            {
                intermediateValue41 = productValue55;
                intermediateValue42 = productValue56;
                intermediateValue43 = productValue57;
                intermediateValue44 = true;
            }
            else
            {
                intermediateValue41 = 0.0f;
                intermediateValue42 = 0.0f;
                intermediateValue43 = 0.0f;
                intermediateValue44 = false;
            }
            comparisonValue12 = intermediateValue44 ? intermediateValue41 : comparisonValue5;
            comparisonValue13 = intermediateValue44 ? intermediateValue42 : comparisonValue6;
            comparisonValue14 = intermediateValue44 ? intermediateValue43 : comparisonValue7;
        }
        else
        {
            comparisonValue12 = comparisonValue5;
            comparisonValue13 = comparisonValue6;
            comparisonValue14 = comparisonValue7;
        }
        float productValue58 = sampledTextureValue4.w * RD_UNIFORM_SSR_PARAMETERS.y;
        float4 sampledTextureValue7 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(productValue26, productValue27, productValue28), float3((-0.0f) - (multiplyAddValue13 * inverseLengthValue9), (-0.0f) - (multiplyAddValue14 * inverseLengthValue9), (-0.0f) - (multiplyAddValue15 * inverseLengthValue9))), 0.0f, 1.0f), sumValue9));
        float scalarValue19 = sampledTextureValue7.x;
        float scalarValue20 = sampledTextureValue7.y;
        productValue61 = ((scalarValue19 * productValue30) + scalarValue20) * (((quotientValue12 - comparisonValue12) * productValue58) + comparisonValue12);
        productValue62 = ((scalarValue19 * productValue31) + scalarValue20) * (((quotientValue13 - comparisonValue13) * productValue58) + comparisonValue13);
        productValue63 = ((scalarValue19 * productValue32) + scalarValue20) * (((quotientValue14 - comparisonValue14) * productValue58) + comparisonValue14);
    }
    else
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (comparisonValue2)
        {
            float intermediateValue25;
            float intermediateValue26;
            float intermediateValue27;
            float multiplyAddValue18;
            float multiplyAddValue19;
            float multiplyAddValue20;
            if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
            {
                intermediateValue25 = productValue17;
                intermediateValue26 = productValue18;
                intermediateValue27 = productValue19;
                multiplyAddValue18 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue19, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue18, productValue17 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
                multiplyAddValue19 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue19, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue18, productValue17 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
                multiplyAddValue20 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue19, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue18, productValue17 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
            }
            else
            {
                intermediateValue25 = multiplyAddValue;
                intermediateValue26 = multiplyAddValue1;
                intermediateValue27 = multiplyAddValue2;
                multiplyAddValue18 = quotientValue;
                multiplyAddValue19 = quotientValue1;
                multiplyAddValue20 = quotientValue2;
            }
            float sumValue10 = intermediateValue25 - RD_UNIFORM_INV_VIEW_ROW_3.x;
            float sumValue11 = intermediateValue26 - RD_UNIFORM_INV_VIEW_ROW_3.y;
            float sumValue12 = intermediateValue27 - RD_UNIFORM_INV_VIEW_ROW_3.z;
            float inverseLengthValue10 = rsqrt(dot(float3(sumValue10, sumValue11, sumValue12), float3(sumValue10, sumValue11, sumValue12)));
            float productValue59 = inverseLengthValue10 * sumValue10;
            float productValue60 = inverseLengthValue10 * sumValue11;
            float productValue66 = inverseLengthValue10 * sumValue12;
            float inverseLengthValue11 = rsqrt(dot(float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20), float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20)));
            float dotProductValue2 = dot(float3(productValue59, productValue60, productValue66), float3(productValue23, productValue24, productValue25)) * 2.0f;
            float productValue67 = productValue59 - (dotProductValue2 * productValue23);
            float productValue68 = productValue60 - (dotProductValue2 * productValue24);
            float productValue69 = productValue66 - (dotProductValue2 * productValue25);
            float sumValue13 = 1.0f - bitwiseValue;
            float productValue70 = sumValue13 * sumValue13;
            float productValue71 = productValue70 * productValue70;
            precise float comparisonValue8 = 1.0f - ((uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u) ? productValue70 : (productValue71 * productValue71));
            precise float productValue72 = (RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f)) * comparisonValue8;
            uint scalarValue21 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
            float4 sampledTextureValue8 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue67, productValue68, productValue69, float(int(scalarValue21))), productValue72);
            float4 sampledTextureValue9 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue67, productValue68, productValue69, float(int(uint(int(scalarValue21 + 2u) - int(3u) * (int(scalarValue21 + 2u) / int(3u)))))), productValue72);
            float scalarValue22 = sampledTextureValue9.x;
            float scalarValue23 = sampledTextureValue9.y;
            float scalarValue24 = sampledTextureValue9.z;
            float productValue73 = ((sampledTextureValue8.x - scalarValue22) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue22;
            float productValue74 = ((sampledTextureValue8.y - scalarValue23) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue23;
            float productValue75 = ((sampledTextureValue8.z - scalarValue24) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue24;
            float productValue76 = productValue33 * RD_UNIFORM_IBL_PARAMETERS.z;
            float comparisonValue9 = (conditionValue1 ? (productValue73 * 301.72412109375f) : productValue73) * productValue76;
            float comparisonValue10 = (conditionValue1 ? (productValue74 * 301.72412109375f) : productValue74) * productValue76;
            float comparisonValue11 = (conditionValue1 ? (productValue75 * 301.72412109375f) : productValue75) * productValue76;
            float comparisonValue15;
            float comparisonValue16;
            float comparisonValue17;
            if (comparisonValue3)
            {
                float productValue77 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue78 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue79 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue80 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
                float productValue81 = productValue80 * bitwiseValue2;
                float productValue82 = productValue80 * bitwiseValue3;
                float productValue83 = productValue80 * bitwiseValue4;
                float clampedValue3 = clamp(dot(float3(productValue81, productValue82, productValue83), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
                float productValue84 = ((clampedValue3 * (productValue81 - productValue77)) + productValue77) * clampedValue;
                float productValue85 = ((clampedValue3 * (productValue82 - productValue78)) + productValue78) * clampedValue;
                float productValue86 = ((clampedValue3 * (productValue83 - productValue79)) + productValue79) * clampedValue;
                float intermediateValue45;
                float intermediateValue46;
                float intermediateValue47;
                bool intermediateValue48;
                if (!(dot(float3(comparisonValue9, comparisonValue10, comparisonValue11), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue84, productValue85, productValue86), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
                {
                    intermediateValue45 = productValue84;
                    intermediateValue46 = productValue85;
                    intermediateValue47 = productValue86;
                    intermediateValue48 = true;
                }
                else
                {
                    intermediateValue45 = 0.0f;
                    intermediateValue46 = 0.0f;
                    intermediateValue47 = 0.0f;
                    intermediateValue48 = false;
                }
                comparisonValue15 = intermediateValue48 ? intermediateValue45 : comparisonValue9;
                comparisonValue16 = intermediateValue48 ? intermediateValue46 : comparisonValue10;
                comparisonValue17 = intermediateValue48 ? intermediateValue47 : comparisonValue11;
            }
            else
            {
                comparisonValue15 = comparisonValue9;
                comparisonValue16 = comparisonValue10;
                comparisonValue17 = comparisonValue11;
            }
            float4 sampledTextureValue10 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(productValue26, productValue27, productValue28), float3((-0.0f) - (multiplyAddValue18 * inverseLengthValue11), (-0.0f) - (multiplyAddValue19 * inverseLengthValue11), (-0.0f) - (multiplyAddValue20 * inverseLengthValue11))), 0.0f, 1.0f), sumValue13));
            float scalarValue25 = sampledTextureValue10.x;
            float scalarValue26 = sampledTextureValue10.y;
            branchMergedValue = ((scalarValue25 * productValue32) + scalarValue26) * comparisonValue17;
            branchMergedValue1 = ((scalarValue25 * productValue31) + scalarValue26) * comparisonValue16;
            branchMergedValue2 = ((scalarValue25 * productValue30) + scalarValue26) * comparisonValue15;
        }
        else
        {
            float branchMergedValue3;
            float branchMergedValue4;
            float branchMergedValue5;
            if (comparisonValue3)
            {
                float multiplyAddValue21;
                float multiplyAddValue22;
                float multiplyAddValue23;
                if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
                {
                    multiplyAddValue21 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue19, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue18, productValue17 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
                    multiplyAddValue22 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue19, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue18, productValue17 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
                    multiplyAddValue23 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue19, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue18, productValue17 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
                }
                else
                {
                    multiplyAddValue21 = quotientValue;
                    multiplyAddValue22 = quotientValue1;
                    multiplyAddValue23 = quotientValue2;
                }
                float inverseLengthValue12 = rsqrt(dot(float3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23), float3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23)));
                float productValue87 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue88 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue89 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue90 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
                float productValue91 = productValue90 * bitwiseValue2;
                float productValue92 = productValue90 * bitwiseValue3;
                float productValue93 = productValue90 * bitwiseValue4;
                float clampedValue4 = clamp(dot(float3(productValue91, productValue92, productValue93), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
                float productValue94 = ((clampedValue4 * (productValue91 - productValue87)) + productValue87) * clampedValue;
                float productValue95 = ((clampedValue4 * (productValue92 - productValue88)) + productValue88) * clampedValue;
                float productValue96 = ((clampedValue4 * (productValue93 - productValue89)) + productValue89) * clampedValue;
                bool dotProductValue3 = dot(float3(productValue94, productValue95, productValue96), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) <= 0.0f;
                float4 sampledTextureValue11 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(productValue26, productValue27, productValue28), float3((-0.0f) - (multiplyAddValue21 * inverseLengthValue12), (-0.0f) - (multiplyAddValue22 * inverseLengthValue12), (-0.0f) - (multiplyAddValue23 * inverseLengthValue12))), 0.0f, 1.0f), 1.0f - bitwiseValue));
                float scalarValue27 = sampledTextureValue11.x;
                float scalarValue28 = sampledTextureValue11.y;
                branchMergedValue3 = ((scalarValue27 * productValue32) + scalarValue28) * (dotProductValue3 ? 0.0f : productValue96);
                branchMergedValue4 = ((scalarValue27 * productValue31) + scalarValue28) * (dotProductValue3 ? 0.0f : productValue95);
                branchMergedValue5 = ((scalarValue27 * productValue30) + scalarValue28) * (dotProductValue3 ? 0.0f : productValue94);
            }
            else
            {
                branchMergedValue3 = 0.0f;
                branchMergedValue4 = 0.0f;
                branchMergedValue5 = 0.0f;
            }
            branchMergedValue = branchMergedValue3;
            branchMergedValue1 = branchMergedValue4;
            branchMergedValue2 = branchMergedValue5;
        }
        productValue61 = branchMergedValue2;
        productValue62 = branchMergedValue1;
        productValue63 = branchMergedValue;
    }
    float nonlinearValue = (RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2)) / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
    float clampedValue5 = 1.0f - clamp((RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f) ? (nonlinearValue * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) : (nonlinearValue / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
    float productValue97 = clampedValue5 * productValue61;
    float productValue98 = clampedValue5 * productValue62;
    float productValue99 = clampedValue5 * productValue63;
    float productValue100;
    float productValue101;
    float productValue102;
    if (RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f)
    {
        float productValue108 = (varyingColor1.x + 1.0f) * 0.5f;
        float productValue109 = (varyingColor1.y + 1.0f) * 0.5f;
        uint scalarValue29 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue24 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, scalarValue2, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.z * varyingColor1.x)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, scalarValue2, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.w * varyingColor1.x)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue29))) + (-0.5f);
        uint sumValue14 = uint(min(int(uint(max(int(uint(int(multiplyAddValue24))), int(0u)))), int(scalarValue29 + 4294967294u)));
        float scalarValue30 = float(int(sumValue14));
        float4 sampledTextureValue12 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue108, productValue109, scalarValue30), 0.0f);
        float scalarValue31 = sampledTextureValue12.w;
        float sampledTextureValue13 = ((scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue108, productValue109, float(int(sumValue14 + 1u))), 0.0f).w - scalarValue31) * min(max(multiplyAddValue24 - scalarValue30, 0.0f), 1.0f)) + scalarValue31;
        productValue100 = sampledTextureValue13 * productValue97;
        productValue101 = sampledTextureValue13 * productValue98;
        productValue102 = sampledTextureValue13 * productValue99;
    }
    else
    {
        productValue100 = productValue97;
        productValue101 = productValue98;
        productValue102 = productValue99;
    }
    float productValue103;
    float productValue104;
    float productValue105;
    if (conditionValue1)
    {
        float quotientValue15 = (0.180000007152557373046875f / sampledTextureValue3) + 9.9999997473787516355514526367188e-05f;
        productValue103 = quotientValue15 * productValue100;
        productValue104 = quotientValue15 * productValue101;
        productValue105 = quotientValue15 * productValue102;
    }
    else
    {
        productValue103 = productValue100;
        productValue104 = productValue101;
        productValue105 = productValue102;
    }
    fragmentColor0.x = productValue103;
    fragmentColor0.y = productValue104;
    fragmentColor0.z = productValue105;
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
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    float productValue110 = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.x * varyingTexCoord0.x) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.z;
    float productValue111 = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.y * varyingTexCoord0.y) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.w;
    float4 sampledTextureValue14 = normalTexture.Sample(normalSampler, float2(productValue110, productValue111));
    float scalarValue32 = sampledTextureValue14.x;
    float scalarValue33 = sampledTextureValue14.y;
    float4 sampledTextureValue15 = sceneDepthTexture.Sample(sceneDepthSampler, float2(productValue110, productValue111));
    float scalarValue34 = sampledTextureValue15.x;
    float productValue112 = (scalarValue34 * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue16 = (RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x) / productValue112;
    float quotientValue17 = (RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y) / productValue112;
    float quotientValue18 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue112;
    float multiplyAddValue25 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue18, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue17, quotientValue16 * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x;
    float multiplyAddValue26 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue18, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue17, quotientValue16 * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y;
    float multiplyAddValue27 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue18, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue17, quotientValue16 * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z;
    float quotientValue19 = ((RD_UNIFORM_SUB_PIXEL_OFFSET.x + varyingColor1.x) * RD_UNIFORM_INV_PROJ_ROW_0.x) / productValue112;
    float quotientValue20 = ((varyingColor1.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y) * RD_UNIFORM_INV_PROJ_ROW_1.y) / productValue112;
    float multiplyAddValue28 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue18, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue20, quotientValue19 * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x) - RD_UNIFORM_WORLD_ORIGIN.x;
    float multiplyAddValue29 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue18, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue20, quotientValue19 * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y) - RD_UNIFORM_WORLD_ORIGIN.y;
    float multiplyAddValue30 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue18, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue20, quotientValue19 * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z) - RD_UNIFORM_WORLD_ORIGIN.z;
    float scalarValue35 = ddx_coarse(quotientValue19);
    float scalarValue36 = ddx_coarse(quotientValue20);
    float scalarValue37 = ddx_coarse(quotientValue18);
    float inverseLengthValue13 = rsqrt(dot(float3(scalarValue35, scalarValue36, scalarValue37), float3(scalarValue35, scalarValue36, scalarValue37)));
    float productValue113 = inverseLengthValue13 * scalarValue35;
    float productValue114 = inverseLengthValue13 * scalarValue36;
    float productValue115 = inverseLengthValue13 * scalarValue37;
    float sumValue15 = ddy_coarse((-0.0f) - quotientValue19);
    float sumValue16 = ddy_coarse((-0.0f) - quotientValue20);
    float sumValue17 = ddy_coarse((-0.0f) - quotientValue18);
    float inverseLengthValue14 = rsqrt(dot(float3(sumValue15, sumValue16, sumValue17), float3(sumValue15, sumValue16, sumValue17)));
    float productValue116 = inverseLengthValue14 * sumValue15;
    float productValue117 = inverseLengthValue14 * sumValue16;
    float productValue118 = inverseLengthValue14 * sumValue17;
    float productValue119 = (productValue118 * productValue114) - (productValue117 * productValue115);
    float productValue120 = (productValue116 * productValue115) - (productValue118 * productValue113);
    float productValue121 = (productValue117 * productValue113) - (productValue116 * productValue114);
    float inverseLengthValue15 = rsqrt(dot(float3(productValue119, productValue120, productValue121), float3(productValue119, productValue120, productValue121)));
    float productValue122 = productValue119 * inverseLengthValue15;
    float productValue123 = productValue120 * inverseLengthValue15;
    float productValue124 = productValue121 * inverseLengthValue15;
    float multiplyAddValue31 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue124, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue123, productValue122 * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue32 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue124, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue123, productValue122 * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue33 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue124, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue123, productValue122 * RD_UNIFORM_INV_VIEW_ROW_0.z));
    float inverseLengthValue16 = rsqrt(dot(float3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33), float3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33)));
    float quotientValue21 = round((inverseLengthValue16 * multiplyAddValue31) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue22 = round((inverseLengthValue16 * multiplyAddValue32) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue23 = round((inverseLengthValue16 * multiplyAddValue33) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float inverseLengthValue17 = rsqrt(dot(float3(quotientValue21, quotientValue22, quotientValue23), float3(quotientValue21, quotientValue22, quotientValue23)));
    float productValue125 = inverseLengthValue17 * quotientValue21;
    float productValue126 = inverseLengthValue17 * quotientValue22;
    float productValue127 = inverseLengthValue17 * quotientValue23;
    float productValue16 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
    float quotientValue24 = productValue16 - (multiplyAddValue28 - (floor(multiplyAddValue28 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue25 = productValue16 - (multiplyAddValue29 - (floor(multiplyAddValue29 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue26 = productValue16 - (multiplyAddValue30 - (floor(multiplyAddValue30 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float dotProductValue4 = dot(float3(quotientValue24, quotientValue25, quotientValue26), float3(productValue125, productValue126, productValue127));
    float productValue128 = ((quotientValue24 + multiplyAddValue28) - (dotProductValue4 * productValue125)) + RD_UNIFORM_WORLD_ORIGIN.x;
    float productValue129 = ((multiplyAddValue29 - (dotProductValue4 * productValue126)) + quotientValue25) + RD_UNIFORM_WORLD_ORIGIN.y;
    float productValue130 = ((multiplyAddValue30 - (dotProductValue4 * productValue127)) + quotientValue26) + RD_UNIFORM_WORLD_ORIGIN.z;
    float sumValue18 = 1.0f - abs(scalarValue32);
    float scalarValue38 = abs(scalarValue33);
    float sumValue19 = sumValue18 - scalarValue38;
    bool conditionValue2 = sumValue19 < 0.0f;
    float comparisonValue18 = conditionValue2 ? ((1.0f - scalarValue38) * ((scalarValue32 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue32;
    float comparisonValue19 = conditionValue2 ? (sumValue18 * ((scalarValue33 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue33;
    float inverseLengthValue18 = rsqrt(dot(float3(comparisonValue18, comparisonValue19, sumValue19), float3(comparisonValue18, comparisonValue19, sumValue19)));
    float productValue131 = comparisonValue18 * inverseLengthValue18;
    float productValue132 = comparisonValue19 * inverseLengthValue18;
    float productValue133 = inverseLengthValue18 * sumValue19;
    float inverseLengthValue19 = rsqrt(dot(float3(productValue131, productValue132, productValue133), float3(productValue131, productValue132, productValue133)));
    float productValue134 = inverseLengthValue19 * productValue131;
    float productValue135 = productValue132 * inverseLengthValue19;
    float productValue136 = inverseLengthValue19 * productValue133;
    float multiplyAddValue34 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue136, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue135, productValue134 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue35 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue136, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue135, productValue134 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue36 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue136, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue135, productValue134 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue20 = rsqrt(dot(float3(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36), float3(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36)));
    float productValue137 = inverseLengthValue20 * multiplyAddValue34;
    float productValue138 = inverseLengthValue20 * multiplyAddValue35;
    float productValue139 = inverseLengthValue20 * multiplyAddValue36;
    float4 sampledTextureValue16 = colorMetalnessSubsurfaceTexture.Sample(colorMetalnessSubsurfaceSampler, float2(productValue110, productValue111));
    float scalarValue39 = sampledTextureValue16.x;
    float scalarValue40 = sampledTextureValue16.y;
    float scalarValue41 = sampledTextureValue16.z;
    float clampedValue6 = clamp((sampledTextureValue16.w + (-0.501960813999176025390625f)) * 2.007874011993408203125f, 0.0f, 1.0f);
    uint unusedTextureMipCount425;
    uint2 vectorValue1 = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount425);
    uint4 loadedBufferValue1 = emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue1.x)))))) * productValue110)), uint(int(float(int(uint(int(float(int(vectorValue1.y)))))) * productValue111))), 0u));
    uint scalarValue42 = loadedBufferValue1.y;
    uint scalarValue43 = loadedBufferValue1.z;
    float bitwiseValue5 = float((loadedBufferValue1.x >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    float bitwiseValue6 = float(scalarValue43 & 255u) * 9.2272217443678528070449829101562e-05f;
    float bitwiseValue7 = bitwiseValue6 * float((scalarValue42 >> 8u) & 255u);
    float bitwiseValue8 = bitwiseValue6 * float(scalarValue42 & 255u);
    float bitwiseValue9 = bitwiseValue6 * float((scalarValue43 >> 8u) & 255u);
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
        exponentialValue = exp2(log2(max(scalarValue39, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(scalarValue40, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(scalarValue41, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (scalarValue39 <= 0.040449999272823333740234375f) ? (scalarValue39 * 0.077399380505084991455078125f) : exp2(log2((scalarValue39 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (scalarValue40 <= 0.040449999272823333740234375f) ? (scalarValue40 * 0.077399380505084991455078125f) : exp2(log2((scalarValue40 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (scalarValue41 <= 0.040449999272823333740234375f) ? (scalarValue41 * 0.077399380505084991455078125f) : exp2(log2((scalarValue41 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
    float productValue140 = (1.0f - clampedValue6) * 0.039999999105930328369140625f;
    float productValue141 = (exponentialValue * clampedValue6) + productValue140;
    float productValue142 = (exponentialValue1 * clampedValue6) + productValue140;
    float productValue143 = (exponentialValue2 * clampedValue6) + productValue140;
    bool conditionValue1 = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
    float sampledTextureValue3;
    if (conditionValue1)
    {
        sampledTextureValue3 = previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x;
    }
    else
    {
        sampledTextureValue3 = 0.0f;
    }
    float clampedValue7 = clamp(((float(loadedBufferValue1.w & 255u) * 0.062745101749897003173828125f) - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y) / max(RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y, 1.0f), 0.0f, 1.0f);
    float productValue144 = ((clampedValue7 * clampedValue7) * clampedValue7) * RD_UNIFORM_IBL_PARAMETERS.x;
    bool comparisonValue2 = RD_UNIFORM_IBL_PARAMETERS.x != 0.0f;
    bool comparisonValue3 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f;
    float productValue63;
    float productValue64;
    float productValue65;
    if (comparisonValue2 && (RD_UNIFORM_SSR_PARAMETERS.x != 0.0f))
    {
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
        {
            float multiplyAddValue37 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, productValue130, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue129, productValue128 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
            intermediateValue15 = productValue128;
            intermediateValue16 = productValue129;
            intermediateValue17 = productValue130;
            multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue130, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue129, productValue128 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
            multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue130, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue129, productValue128 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
            multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue130, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue129, productValue128 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
            multiplyAddValue16 = (mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, productValue130, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue129, productValue128 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue37;
            multiplyAddValue17 = (1.0f - ((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, productValue130, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue129, productValue128 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue37)) * 0.5f;
        }
        else
        {
            intermediateValue15 = multiplyAddValue25;
            intermediateValue16 = multiplyAddValue26;
            intermediateValue17 = multiplyAddValue27;
            multiplyAddValue13 = quotientValue16;
            multiplyAddValue14 = quotientValue17;
            multiplyAddValue15 = quotientValue18;
            multiplyAddValue16 = varyingColor1.x;
            multiplyAddValue17 = 1.0f - ((varyingColor1.y + 1.0f) * 0.5f);
        }
        precise float sumValue5 = multiplyAddValue16 + 1.0f;
        precise float productValue34 = sumValue5 * 0.5f;
        float sumValue6 = intermediateValue15 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue7 = intermediateValue16 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue8 = intermediateValue17 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue8 = rsqrt(dot(float3(sumValue6, sumValue7, sumValue8), float3(sumValue6, sumValue7, sumValue8)));
        float productValue35 = inverseLengthValue8 * sumValue6;
        float productValue36 = inverseLengthValue8 * sumValue7;
        float productValue37 = inverseLengthValue8 * sumValue8;
        float inverseLengthValue9 = rsqrt(dot(float3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15), float3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15)));
        float4 sampledTextureValue4 = ssrTextureTexture.Sample(ssrTextureSampler, float2(productValue34 * RD_UNIFORM_VIEWPORT_SCALE.x, multiplyAddValue17 * RD_UNIFORM_VIEWPORT_SCALE.y));
        float scalarValue12 = sampledTextureValue4.x;
        float scalarValue13 = sampledTextureValue4.y;
        float scalarValue14 = sampledTextureValue4.z;
        float quotientValue12;
        float quotientValue13;
        float quotientValue14;
        if (conditionValue1)
        {
            float quotientValue11 = (0.180000007152557373046875f / sampledTextureValue3) + 9.9999997473787516355514526367188e-05f;
            quotientValue12 = scalarValue12 / quotientValue11;
            quotientValue13 = scalarValue13 / quotientValue11;
            quotientValue14 = scalarValue14 / quotientValue11;
        }
        else
        {
            quotientValue12 = scalarValue12;
            quotientValue13 = scalarValue13;
            quotientValue14 = scalarValue14;
        }
        float dotProductValue5 = dot(float3(productValue35, productValue36, productValue37), float3(productValue134, productValue135, productValue136)) * 2.0f;
        float productValue145 = productValue35 - (dotProductValue5 * productValue134);
        float productValue146 = productValue36 - (dotProductValue5 * productValue135);
        float productValue147 = productValue37 - (dotProductValue5 * productValue136);
        float sumValue20 = 1.0f - bitwiseValue5;
        float productValue148 = sumValue20 * sumValue20;
        float productValue149 = productValue148 * productValue148;
        precise float comparisonValue20 = 1.0f - ((uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u) ? productValue148 : (productValue149 * productValue149));
        precise float productValue150 = (RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f)) * comparisonValue20;
        uint scalarValue15 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
        float4 sampledTextureValue17 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue145, productValue146, productValue147, float(int(scalarValue15))), productValue150);
        float4 sampledTextureValue18 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue145, productValue146, productValue147, float(int(uint(int(scalarValue15 + 2u) - int(3u) * (int(scalarValue15 + 2u) / int(3u)))))), productValue150);
        float scalarValue44 = sampledTextureValue18.x;
        float scalarValue45 = sampledTextureValue18.y;
        float scalarValue46 = sampledTextureValue18.z;
        float productValue151 = ((sampledTextureValue17.x - scalarValue44) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue44;
        float productValue152 = ((sampledTextureValue17.y - scalarValue45) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue45;
        float productValue153 = ((sampledTextureValue17.z - scalarValue46) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue46;
        float productValue154 = productValue144 * RD_UNIFORM_IBL_PARAMETERS.z;
        float comparisonValue21 = (conditionValue1 ? (productValue151 * 301.72412109375f) : productValue151) * productValue154;
        float comparisonValue22 = (conditionValue1 ? (productValue152 * 301.72412109375f) : productValue152) * productValue154;
        float comparisonValue23 = (conditionValue1 ? (productValue153 * 301.72412109375f) : productValue153) * productValue154;
        float comparisonValue12;
        float comparisonValue13;
        float comparisonValue14;
        if (comparisonValue3)
        {
            float productValue48 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue49 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue50 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue51 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
            float productValue155 = productValue51 * bitwiseValue7;
            float productValue156 = productValue51 * bitwiseValue8;
            float productValue157 = productValue51 * bitwiseValue9;
            float clampedValue8 = clamp(dot(float3(productValue155, productValue156, productValue157), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
            float productValue158 = ((clampedValue8 * (productValue155 - productValue48)) + productValue48) * clampedValue6;
            float productValue159 = ((clampedValue8 * (productValue156 - productValue49)) + productValue49) * clampedValue6;
            float productValue160 = ((clampedValue8 * (productValue157 - productValue50)) + productValue50) * clampedValue6;
            float intermediateValue41;
            float intermediateValue42;
            float intermediateValue43;
            bool intermediateValue44;
            if (!(dot(float3(comparisonValue21, comparisonValue22, comparisonValue23), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue158, productValue159, productValue160), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
            {
                intermediateValue41 = productValue158;
                intermediateValue42 = productValue159;
                intermediateValue43 = productValue160;
                intermediateValue44 = true;
            }
            else
            {
                intermediateValue41 = 0.0f;
                intermediateValue42 = 0.0f;
                intermediateValue43 = 0.0f;
                intermediateValue44 = false;
            }
            comparisonValue12 = intermediateValue44 ? intermediateValue41 : comparisonValue21;
            comparisonValue13 = intermediateValue44 ? intermediateValue42 : comparisonValue22;
            comparisonValue14 = intermediateValue44 ? intermediateValue43 : comparisonValue23;
        }
        else
        {
            comparisonValue12 = comparisonValue21;
            comparisonValue13 = comparisonValue22;
            comparisonValue14 = comparisonValue23;
        }
        float productValue58 = sampledTextureValue4.w * RD_UNIFORM_SSR_PARAMETERS.y;
        float4 sampledTextureValue19 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(productValue137, productValue138, productValue139), float3((-0.0f) - (multiplyAddValue13 * inverseLengthValue9), (-0.0f) - (multiplyAddValue14 * inverseLengthValue9), (-0.0f) - (multiplyAddValue15 * inverseLengthValue9))), 0.0f, 1.0f), sumValue20));
        float scalarValue47 = sampledTextureValue19.x;
        float scalarValue48 = sampledTextureValue19.y;
        productValue63 = ((scalarValue47 * productValue141) + scalarValue48) * (((quotientValue12 - comparisonValue12) * productValue58) + comparisonValue12);
        productValue64 = ((scalarValue47 * productValue142) + scalarValue48) * (((quotientValue13 - comparisonValue13) * productValue58) + comparisonValue13);
        productValue65 = ((scalarValue47 * productValue143) + scalarValue48) * (((quotientValue14 - comparisonValue14) * productValue58) + comparisonValue14);
    }
    else
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (comparisonValue2)
        {
            float intermediateValue25;
            float intermediateValue26;
            float intermediateValue27;
            float multiplyAddValue18;
            float multiplyAddValue19;
            float multiplyAddValue20;
            if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
            {
                intermediateValue25 = productValue128;
                intermediateValue26 = productValue129;
                intermediateValue27 = productValue130;
                multiplyAddValue18 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue130, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue129, productValue128 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
                multiplyAddValue19 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue130, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue129, productValue128 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
                multiplyAddValue20 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue130, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue129, productValue128 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
            }
            else
            {
                intermediateValue25 = multiplyAddValue25;
                intermediateValue26 = multiplyAddValue26;
                intermediateValue27 = multiplyAddValue27;
                multiplyAddValue18 = quotientValue16;
                multiplyAddValue19 = quotientValue17;
                multiplyAddValue20 = quotientValue18;
            }
            float sumValue10 = intermediateValue25 - RD_UNIFORM_INV_VIEW_ROW_3.x;
            float sumValue11 = intermediateValue26 - RD_UNIFORM_INV_VIEW_ROW_3.y;
            float sumValue12 = intermediateValue27 - RD_UNIFORM_INV_VIEW_ROW_3.z;
            float inverseLengthValue10 = rsqrt(dot(float3(sumValue10, sumValue11, sumValue12), float3(sumValue10, sumValue11, sumValue12)));
            float productValue59 = inverseLengthValue10 * sumValue10;
            float productValue60 = inverseLengthValue10 * sumValue11;
            float productValue66 = inverseLengthValue10 * sumValue12;
            float inverseLengthValue11 = rsqrt(dot(float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20), float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20)));
            float dotProductValue6 = dot(float3(productValue59, productValue60, productValue66), float3(productValue134, productValue135, productValue136)) * 2.0f;
            float productValue161 = productValue59 - (dotProductValue6 * productValue134);
            float productValue162 = productValue60 - (dotProductValue6 * productValue135);
            float productValue163 = productValue66 - (dotProductValue6 * productValue136);
            float sumValue21 = 1.0f - bitwiseValue5;
            float productValue164 = sumValue21 * sumValue21;
            float productValue165 = productValue164 * productValue164;
            precise float comparisonValue24 = 1.0f - ((uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u) ? productValue164 : (productValue165 * productValue165));
            precise float productValue166 = (RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f)) * comparisonValue24;
            uint scalarValue21 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
            float4 sampledTextureValue20 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue161, productValue162, productValue163, float(int(scalarValue21))), productValue166);
            float4 sampledTextureValue21 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue161, productValue162, productValue163, float(int(uint(int(scalarValue21 + 2u) - int(3u) * (int(scalarValue21 + 2u) / int(3u)))))), productValue166);
            float scalarValue49 = sampledTextureValue21.x;
            float scalarValue50 = sampledTextureValue21.y;
            float scalarValue51 = sampledTextureValue21.z;
            float productValue167 = ((sampledTextureValue20.x - scalarValue49) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue49;
            float productValue168 = ((sampledTextureValue20.y - scalarValue50) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue50;
            float productValue169 = ((sampledTextureValue20.z - scalarValue51) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue51;
            float productValue170 = productValue144 * RD_UNIFORM_IBL_PARAMETERS.z;
            float comparisonValue25 = (conditionValue1 ? (productValue167 * 301.72412109375f) : productValue167) * productValue170;
            float comparisonValue26 = (conditionValue1 ? (productValue168 * 301.72412109375f) : productValue168) * productValue170;
            float comparisonValue27 = (conditionValue1 ? (productValue169 * 301.72412109375f) : productValue169) * productValue170;
            float comparisonValue15;
            float comparisonValue16;
            float comparisonValue17;
            if (comparisonValue3)
            {
                float productValue77 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue78 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue79 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue80 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
                float productValue171 = productValue80 * bitwiseValue7;
                float productValue172 = productValue80 * bitwiseValue8;
                float productValue173 = productValue80 * bitwiseValue9;
                float clampedValue9 = clamp(dot(float3(productValue171, productValue172, productValue173), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
                float productValue174 = ((clampedValue9 * (productValue171 - productValue77)) + productValue77) * clampedValue6;
                float productValue175 = ((clampedValue9 * (productValue172 - productValue78)) + productValue78) * clampedValue6;
                float productValue176 = ((clampedValue9 * (productValue173 - productValue79)) + productValue79) * clampedValue6;
                float intermediateValue45;
                float intermediateValue46;
                float intermediateValue47;
                bool intermediateValue48;
                if (!(dot(float3(comparisonValue25, comparisonValue26, comparisonValue27), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue174, productValue175, productValue176), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
                {
                    intermediateValue45 = productValue174;
                    intermediateValue46 = productValue175;
                    intermediateValue47 = productValue176;
                    intermediateValue48 = true;
                }
                else
                {
                    intermediateValue45 = 0.0f;
                    intermediateValue46 = 0.0f;
                    intermediateValue47 = 0.0f;
                    intermediateValue48 = false;
                }
                comparisonValue15 = intermediateValue48 ? intermediateValue45 : comparisonValue25;
                comparisonValue16 = intermediateValue48 ? intermediateValue46 : comparisonValue26;
                comparisonValue17 = intermediateValue48 ? intermediateValue47 : comparisonValue27;
            }
            else
            {
                comparisonValue15 = comparisonValue25;
                comparisonValue16 = comparisonValue26;
                comparisonValue17 = comparisonValue27;
            }
            float4 sampledTextureValue22 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(productValue137, productValue138, productValue139), float3((-0.0f) - (multiplyAddValue18 * inverseLengthValue11), (-0.0f) - (multiplyAddValue19 * inverseLengthValue11), (-0.0f) - (multiplyAddValue20 * inverseLengthValue11))), 0.0f, 1.0f), sumValue21));
            float scalarValue52 = sampledTextureValue22.x;
            float scalarValue53 = sampledTextureValue22.y;
            branchMergedValue = ((scalarValue52 * productValue143) + scalarValue53) * comparisonValue17;
            branchMergedValue1 = ((scalarValue52 * productValue142) + scalarValue53) * comparisonValue16;
            branchMergedValue2 = ((scalarValue52 * productValue141) + scalarValue53) * comparisonValue15;
        }
        else
        {
            float branchMergedValue3;
            float branchMergedValue4;
            float branchMergedValue5;
            if (comparisonValue3)
            {
                float multiplyAddValue21;
                float multiplyAddValue22;
                float multiplyAddValue23;
                if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
                {
                    multiplyAddValue21 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue130, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue129, productValue128 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
                    multiplyAddValue22 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue130, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue129, productValue128 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
                    multiplyAddValue23 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue130, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue129, productValue128 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
                }
                else
                {
                    multiplyAddValue21 = quotientValue16;
                    multiplyAddValue22 = quotientValue17;
                    multiplyAddValue23 = quotientValue18;
                }
                float inverseLengthValue12 = rsqrt(dot(float3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23), float3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23)));
                float productValue87 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue88 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue89 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue90 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
                float productValue177 = productValue90 * bitwiseValue7;
                float productValue178 = productValue90 * bitwiseValue8;
                float productValue179 = productValue90 * bitwiseValue9;
                float clampedValue10 = clamp(dot(float3(productValue177, productValue178, productValue179), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
                float productValue180 = ((clampedValue10 * (productValue177 - productValue87)) + productValue87) * clampedValue6;
                float productValue181 = ((clampedValue10 * (productValue178 - productValue88)) + productValue88) * clampedValue6;
                float productValue182 = ((clampedValue10 * (productValue179 - productValue89)) + productValue89) * clampedValue6;
                bool dotProductValue7 = dot(float3(productValue180, productValue181, productValue182), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) <= 0.0f;
                float4 sampledTextureValue23 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(productValue137, productValue138, productValue139), float3((-0.0f) - (multiplyAddValue21 * inverseLengthValue12), (-0.0f) - (multiplyAddValue22 * inverseLengthValue12), (-0.0f) - (multiplyAddValue23 * inverseLengthValue12))), 0.0f, 1.0f), 1.0f - bitwiseValue5));
                float scalarValue54 = sampledTextureValue23.x;
                float scalarValue55 = sampledTextureValue23.y;
                branchMergedValue3 = ((scalarValue54 * productValue143) + scalarValue55) * (dotProductValue7 ? 0.0f : productValue182);
                branchMergedValue4 = ((scalarValue54 * productValue142) + scalarValue55) * (dotProductValue7 ? 0.0f : productValue181);
                branchMergedValue5 = ((scalarValue54 * productValue141) + scalarValue55) * (dotProductValue7 ? 0.0f : productValue180);
            }
            else
            {
                branchMergedValue3 = 0.0f;
                branchMergedValue4 = 0.0f;
                branchMergedValue5 = 0.0f;
            }
            branchMergedValue = branchMergedValue3;
            branchMergedValue1 = branchMergedValue4;
            branchMergedValue2 = branchMergedValue5;
        }
        productValue63 = branchMergedValue2;
        productValue64 = branchMergedValue1;
        productValue65 = branchMergedValue;
    }
    float nonlinearValue1 = (RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (sqrt(((quotientValue17 * quotientValue17) + (quotientValue16 * quotientValue16)) + (quotientValue18 * quotientValue18)) / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
    float clampedValue11 = 1.0f - clamp((RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f) ? (nonlinearValue1 * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) : (nonlinearValue1 / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
    float productValue183 = clampedValue11 * productValue63;
    float productValue184 = clampedValue11 * productValue64;
    float productValue185 = clampedValue11 * productValue65;
    float productValue102;
    float productValue103;
    float productValue104;
    if (RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f)
    {
        float productValue108 = (varyingColor1.x + 1.0f) * 0.5f;
        float productValue109 = (varyingColor1.y + 1.0f) * 0.5f;
        uint scalarValue29 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue38 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, scalarValue34, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.z * varyingColor1.x)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, scalarValue34, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.w * varyingColor1.x)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue29))) + (-0.5f);
        uint sumValue22 = uint(min(int(uint(max(int(uint(int(multiplyAddValue38))), int(0u)))), int(scalarValue29 + 4294967294u)));
        float scalarValue56 = float(int(sumValue22));
        float4 sampledTextureValue24 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue108, productValue109, scalarValue56), 0.0f);
        float scalarValue57 = sampledTextureValue24.w;
        float sampledTextureValue25 = ((scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue108, productValue109, float(int(sumValue22 + 1u))), 0.0f).w - scalarValue57) * min(max(multiplyAddValue38 - scalarValue56, 0.0f), 1.0f)) + scalarValue57;
        productValue102 = sampledTextureValue25 * productValue183;
        productValue103 = sampledTextureValue25 * productValue184;
        productValue104 = sampledTextureValue25 * productValue185;
    }
    else
    {
        productValue102 = productValue183;
        productValue103 = productValue184;
        productValue104 = productValue185;
    }
    float productValue105;
    float productValue106;
    float productValue107;
    if (conditionValue1)
    {
        float quotientValue15 = (0.180000007152557373046875f / sampledTextureValue3) + 9.9999997473787516355514526367188e-05f;
        productValue105 = quotientValue15 * productValue102;
        productValue106 = quotientValue15 * productValue103;
        productValue107 = quotientValue15 * productValue104;
    }
    else
    {
        productValue105 = productValue102;
        productValue106 = productValue103;
        productValue107 = productValue104;
    }
    fragmentColor0.x = productValue105;
    fragmentColor0.y = productValue106;
    fragmentColor0.z = productValue107;
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
#endif
}
#elif RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
  workingVector0.xy = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xy;
  workingVector0.z = materialTexture8.Sample(textureSampler8, varyingTexCoord0.xy).x;
  workingVector1.x = RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x;
  workingVector1.y = RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y;
  workingVector0.w = workingVector0.z * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
  workingVector1.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
  workingVector1.xyz = workingVector1.xyz / workingVector0.www;
  workingVector2.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector1.yyy;
  workingVector2.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector1.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector1.zzz + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector2.xyz;
  workingVector1.w = RD_UNIFORM_SUB_PIXEL_OFFSET.x + varyingColor1.x;
  workingVector2.w = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + varyingColor1.y;
  workingVector3.z = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector1.w;
  workingVector3.x = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector2.w;
  workingVector3.y = RD_UNIFORM_INV_PROJ_ROW_3.z;
  workingVector3.xyz = workingVector3.xyz / workingVector0.www;
  workingVector4.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector3.xxx;
  workingVector4.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector3.zzz + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector3.yyy + workingVector4.xyz;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
  workingVector0.xy = RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.xy * varyingTexCoord0.xy;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector0.xy = float2(0.5,0.5) + workingVector0.xy;
  workingVector0.xy = RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.zw * workingVector0.xy;
  workingVector0.zw = materialTexture3.Sample(textureSampler3, workingVector0.xy).xy;
  workingVector1.x = materialTexture8.Sample(textureSampler8, workingVector0.xy).x;
  workingVector2.x = RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x;
  workingVector2.y = RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y;
  workingVector1.y = workingVector1.x * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
  workingVector2.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
  workingVector2.xyz = workingVector2.xyz / workingVector1.yyy;
  workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector2.yyy;
  workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector2.xxx + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector2.zzz + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector3.xyz;
  workingVector1.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + varyingColor1.x;
  workingVector1.w = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + varyingColor1.y;
  workingVector4.z = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector1.z;
  workingVector4.x = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector1.w;
  workingVector4.y = RD_UNIFORM_INV_PROJ_ROW_3.z;
  workingVector1.yzw = workingVector4.xyz / workingVector1.yyy;
  workingVector4.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector1.yyy;
  workingVector4.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector1.www + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector1.zzz + workingVector4.xyz;
#endif
  workingVector4.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector4.xyz;
  workingVector4.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector4.xyz;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
  workingVector5.xyz = ddx_coarse(workingVector3.yzx);
  workingVector0.w = dot(workingVector5.xyz, workingVector5.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector5.xyz = workingVector5.xyz * workingVector0.www;
  workingVector3.xyz = -workingVector3.xyz;
  workingVector3.xyz = ddy_coarse(workingVector3.xyz);
  workingVector0.w = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector3.xyz = workingVector3.xyz * workingVector0.www;
  workingVector6.xyz = workingVector5.xyz * workingVector3.xyz;
  workingVector3.xyz = workingVector5.zxy * workingVector3.yzx + -workingVector6.xyz;
  workingVector0.w = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector3.xyz = workingVector3.xyz * workingVector0.www;
  workingVector5.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector3.yyy;
  workingVector3.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector3.xxx + workingVector5.xyz;
  workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector3.zzz + workingVector3.xyw;
  workingVector0.w = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector3.xyz = workingVector3.xyz * workingVector0.www;
  workingVector3.xyz = workingVector3.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
  workingVector3.xyz = round(workingVector3.xyz);
  workingVector3.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector3.xyz;
  workingVector0.w = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector3.xyz = workingVector3.xyz * workingVector0.www;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
  workingVector5.xyz = ddx_coarse(workingVector1.zwy);
  workingVector2.w = dot(workingVector5.xyz, workingVector5.xyz);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector5.xyz = workingVector5.xyz * workingVector2.www;
  workingVector1.yzw = -workingVector1.yzw;
  workingVector1.yzw = ddy_coarse(workingVector1.yzw);
  workingVector2.w = dot(workingVector1.yzw, workingVector1.yzw);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector1.yzw = workingVector2.www * workingVector1.yzw;
  workingVector6.xyz = workingVector5.xyz * workingVector1.yzw;
  workingVector1.yzw = workingVector5.zxy * workingVector1.zwy + -workingVector6.xyz;
  workingVector2.w = dot(workingVector1.yzw, workingVector1.yzw);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector1.yzw = workingVector2.www * workingVector1.yzw;
  workingVector5.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector1.zzz;
  workingVector5.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector1.yyy + workingVector5.xyz;
  workingVector1.yzw = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector1.www + workingVector5.xyz;
  workingVector2.w = dot(workingVector1.yzw, workingVector1.yzw);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector1.yzw = workingVector2.www * workingVector1.yzw;
  workingVector1.yzw = workingVector1.yzw / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
  workingVector1.yzw = round(workingVector1.yzw);
  workingVector1.yzw = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector1.yzw;
  workingVector2.w = dot(workingVector1.yzw, workingVector1.yzw);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector1.yzw = workingVector2.www * workingVector1.yzw;
#endif
  workingVector5.xyz = workingVector4.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
  workingVector5.xyz = floor(workingVector5.xyz);
  workingVector5.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector5.xyz + workingVector4.xyz;
  workingVector5.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector5.xyz;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
  workingVector0.w = dot(workingVector5.xyz, workingVector3.xyz);
  workingVector3.xyz = -workingVector0.www * workingVector3.xyz + workingVector5.xyz;
  workingVector3.xyz = workingVector4.xyz + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector3.xyz;
  workingVector4.xyz = float3(1,1,1) + -abs(workingVector0.xyx);
  workingVector5.z = workingVector4.x + -abs(workingVector0.y);
  workingVector0.w = RD_COMPARISON_MASK(workingVector5.z < 0);
  workingVector4.xw = RD_COMPARISON_MASK(workingVector0.xy >= float2(0,0));
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
  workingVector2.w = dot(workingVector5.xyz, workingVector1.yzw);
  workingVector1.yzw = -workingVector2.www * workingVector1.yzw + workingVector5.xyz;
  workingVector1.yzw = workingVector4.xyz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector1.yzw;
  workingVector4.xyz = float3(1,1,1) + -abs(workingVector0.zwz);
  workingVector5.z = workingVector4.x + -abs(workingVector0.w);
  workingVector2.w = RD_COMPARISON_MASK(workingVector5.z < 0);
  workingVector4.xw = RD_COMPARISON_MASK(workingVector0.zw >= float2(0,0));
#endif
  workingVector4.xw = workingVector4.xw ? float2(1,1) : float2(-1,-1);
  workingVector4.xy = workingVector4.yz * workingVector4.xw;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
  workingVector5.xy = workingVector0.ww ? workingVector4.xy : workingVector0.xy;
  workingVector0.x = dot(workingVector5.xyz, workingVector5.xyz);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xyw = workingVector5.xyz * workingVector0.xxx;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector0.yyy;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector0.xxx + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector0.www + workingVector4.xyz;
  workingVector1.w = dot(workingVector4.xyz, workingVector4.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector4.xyz = workingVector4.xyz * workingVector1.www;
  workingVector5.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector6.xyzw = float4(-0.501960814,0.0549999997,0.0549999997,0.0549999997) + workingVector5.wxyz;
  workingVector6.xyzw = float4(2.00787401,0.947867334,0.947867334,0.947867334) * workingVector6.xyzw;
  workingVector6.x = saturate(workingVector6.x);
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
  workingVector5.xy = workingVector2.ww ? workingVector4.xy : workingVector0.zw;
  workingVector0.z = dot(workingVector5.xyz, workingVector5.xyz);
  workingVector0.z = rsqrt(workingVector0.z);
  workingVector4.xyz = workingVector5.xyz * workingVector0.zzz;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector4.yyy;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector4.xxx + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector4.zzz + workingVector5.xyz;
  workingVector0.z = dot(workingVector5.xyz, workingVector5.xyz);
  workingVector0.z = rsqrt(workingVector0.z);
  workingVector5.xyz = workingVector5.xyz * workingVector0.zzz;
  workingVector6.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyzw;
  workingVector7.xyzw = float4(-0.501960814,0.0549999997,0.0549999997,0.0549999997) + workingVector6.wxyz;
  workingVector7.xyzw = float4(2.00787401,0.947867334,0.947867334,0.947867334) * workingVector7.xyzw;
  workingVector7.x = saturate(workingVector7.x);
#endif
  materialTexture2.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
#if RD_OPTION_MODE == RD_MODE_DEFAULT
  workingVector7.xy = floatingPointResult.xy;
  workingVector7.xy = varyingTexCoord0.xy * workingVector7.xy;
  workingVector7.xy = (int2)workingVector7.xy;
  workingVector7.zw = float2(0,0);
  workingVector7.xyzw = materialTexture2.Load(workingVector7.xyz).xyzw;
  if (8 == 0) workingVector8.x = 0; else if (8+8 < 32) {   workingVector8.x = (uint)workingVector7.x << (32-(8 + 8)); workingVector8.x = (uint)workingVector8.x >> (32-8);  } else workingVector8.x = (uint)workingVector7.x >> 8;
  if (8 == 0) workingVector8.y = 0; else if (8+8 < 32) {   workingVector8.y = (uint)workingVector7.y << (32-(8 + 8)); workingVector8.y = (uint)workingVector8.y >> (32-8);  } else workingVector8.y = (uint)workingVector7.y >> 8;
  if (8 == 0) workingVector8.z = 0; else if (8+8 < 32) {   workingVector8.z = (uint)workingVector7.z << (32-(8 + 8)); workingVector8.z = (uint)workingVector8.z >> (32-8);  } else workingVector8.z = (uint)workingVector7.z >> 8;
  workingVector1.w = (uint)workingVector8.x;
  workingVector7.xyz = (int3)workingVector7.wyz & int3(255,255,255);
  workingVector2.w = (uint)workingVector7.x;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
  workingVector0.zw = floatingPointResult.xy;
  workingVector0.xy = workingVector0.zw * workingVector0.xy;
  workingVector0.xy = (int2)workingVector0.xy;
  workingVector0.zw = float2(0,0);
  workingVector0.xyzw = materialTexture2.Load(workingVector0.xyz).xyzw;
  if (8 == 0) workingVector8.x = 0; else if (8+8 < 32) {   workingVector8.x = (uint)workingVector0.x << (32-(8 + 8)); workingVector8.x = (uint)workingVector8.x >> (32-8);  } else workingVector8.x = (uint)workingVector0.x >> 8;
  if (8 == 0) workingVector8.y = 0; else if (8+8 < 32) {   workingVector8.y = (uint)workingVector0.y << (32-(8 + 8)); workingVector8.y = (uint)workingVector8.y >> (32-8);  } else workingVector8.y = (uint)workingVector0.y >> 8;
  if (8 == 0) workingVector8.z = 0; else if (8+8 < 32) {   workingVector8.z = (uint)workingVector0.z << (32-(8 + 8)); workingVector8.z = (uint)workingVector8.z >> (32-8);  } else workingVector8.z = (uint)workingVector0.z >> 8;
  workingVector0.x = (uint)workingVector8.x;
  workingVector0.yzw = (int3)workingVector0.wyz & int3(255,255,255);
  workingVector0.y = (uint)workingVector0.y;
#endif
  workingVector8.xz = (uint2)workingVector8.yz;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
  workingVector8.yw = (uint2)workingVector7.yz;
  workingVector7.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector8.xyzw;
  workingVector7.xyz = workingVector7.xyz * workingVector7.www;
  workingVector7.xyz = float3(6,6,6) * workingVector7.xyz;
  workingVector3.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector8.xyz = max(float3(0,0,0), workingVector5.xyz);
  workingVector8.xyz = log2(workingVector8.xyz);
  workingVector8.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector8.xyz;
  workingVector8.xyz = exp2(workingVector8.xyz);
  workingVector9.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector5.xyz;
  workingVector6.yzw = log2(workingVector6.yzw);
  workingVector6.yzw = float3(2.4000001,2.4000001,2.4000001) * workingVector6.yzw;
  workingVector6.yzw = exp2(workingVector6.yzw);
  workingVector5.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector5.xyz);
  workingVector5.xyz = workingVector5.xyz ? workingVector9.xyz : workingVector6.yzw;
  workingVector5.xyz = workingVector3.www ? workingVector8.xyz : workingVector5.xyz;
  workingVector3.w = 1 + -workingVector6.x;
  workingVector5.xyz = workingVector5.xyz * workingVector6.xxx;
  workingVector5.xyz = workingVector3.www * float3(0.0399999991,0.0399999991,0.0399999991) + workingVector5.xyz;
  workingVector3.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
  workingVector8.yw = (uint2)workingVector0.zw;
  workingVector8.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector8.xyzw;
  workingVector8.xyz = workingVector8.xyz * workingVector8.www;
  workingVector8.xyz = float3(6,6,6) * workingVector8.xyz;
  workingVector0.z = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector9.xyz = max(float3(0,0,0), workingVector6.xyz);
  workingVector9.xyz = log2(workingVector9.xyz);
  workingVector9.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector9.xyz;
  workingVector9.xyz = exp2(workingVector9.xyz);
  workingVector10.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector6.xyz;
  workingVector7.yzw = log2(workingVector7.yzw);
  workingVector7.yzw = float3(2.4000001,2.4000001,2.4000001) * workingVector7.yzw;
  workingVector7.yzw = exp2(workingVector7.yzw);
  workingVector6.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector6.xyz);
  workingVector6.xyz = workingVector6.xyz ? workingVector10.xyz : workingVector7.yzw;
  workingVector6.xyz = workingVector0.zzz ? workingVector9.xyz : workingVector6.xyz;
  workingVector0.z = 1 + -workingVector7.x;
  workingVector6.xyz = workingVector6.xyz * workingVector7.xxx;
  workingVector6.xyz = workingVector0.zzz * float3(0.0399999991,0.0399999991,0.0399999991) + workingVector6.xyz;
  workingVector0.z = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.z != 0) {
    workingVector0.w = materialTexture6.Sample(textureSampler6, float2(0.5,0.5)).x;
  } else {
    workingVector0.w = 0;
  }
  workingVector2.w = RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
  workingVector2.w = max(1, workingVector2.w);
  workingVector0.y = workingVector0.y * 0.0627451017 + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
  workingVector0.y = saturate(workingVector0.y / workingVector2.w);
  workingVector2.w = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector2.w * workingVector0.y;
  workingVector0.y = RD_UNIFORM_IBL_PARAMETERS.x * workingVector0.y;
  workingVector2.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector2.w = sqrt(workingVector2.w);
  workingVector3.w = RD_COMPARISON_MASK(RD_UNIFORM_SSR_PARAMETERS.x != 0.000000);
  workingVector4.w = RD_COMPARISON_MASK(RD_UNIFORM_IBL_PARAMETERS.x != 0.000000);
  workingVector3.w = workingVector3.w ? workingVector4.w : 0;
#endif
  if (workingVector3.w != 0) {
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector4.w = materialTexture6.Sample(textureSampler6, float2(0.5,0.5)).x;
  } else {
    workingVector4.w = 0;
  }
  workingVector5.w = RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
  workingVector5.w = max(1, workingVector5.w);
  workingVector2.w = workingVector2.w * 0.0627451017 + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
  workingVector2.w = saturate(workingVector2.w / workingVector5.w);
  workingVector5.w = workingVector2.w * workingVector2.w;
  workingVector2.w = workingVector5.w * workingVector2.w;
  workingVector2.w = RD_UNIFORM_IBL_PARAMETERS.x * workingVector2.w;
  workingVector5.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector5.w = sqrt(workingVector5.w);
  workingVector6.y = RD_COMPARISON_MASK(RD_UNIFORM_SSR_PARAMETERS.x != 0.000000);
  workingVector6.z = RD_COMPARISON_MASK(RD_UNIFORM_IBL_PARAMETERS.x != 0.000000);
  workingVector6.y = workingVector6.z ? workingVector6.y : 0;
  if (workingVector6.y != 0) {
    workingVector6.y = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
    workingVector6.w = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
    workingVector7.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
    workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector3.yyy;
    workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector3.xxx + workingVector8.xyz;
    workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector3.zzz + workingVector8.xyz;
    workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector8.xyz;
    workingVector9.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * workingVector3.yyy;
    workingVector9.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * workingVector3.xxx + workingVector9.xyz;
    workingVector9.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * workingVector3.zzz + workingVector9.xyz;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector3.w = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
    workingVector5.w = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
    workingVector6.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
    workingVector7.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector1.zzz;
    workingVector7.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector1.yyy + workingVector7.yzw;
    workingVector7.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector1.www + workingVector7.yzw;
    workingVector7.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector7.yzw;
    workingVector9.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * workingVector1.zzz;
    workingVector9.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * workingVector1.yyy + workingVector9.xyz;
    workingVector9.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * workingVector1.www + workingVector9.xyz;
#endif
    workingVector9.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector9.xyz;
    workingVector9.xy = workingVector9.xy / workingVector9.zz;
    workingVector9.z = -workingVector9.y;
    workingVector9.xy = float2(1,1) + workingVector9.xz;
    workingVector9.xy = float2(0.5,0.5) * workingVector9.xy;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector10.xyz = workingVector7.www ? workingVector3.xyz : workingVector2.xyz;
    workingVector8.xyz = workingVector7.www ? workingVector8.xyz : workingVector1.xyz;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector10.xyz = workingVector6.www ? workingVector1.yzw : workingVector3.xyz;
    workingVector7.yzw = workingVector6.www ? workingVector7.yzw : workingVector2.xyz;
#endif
    workingVector9.zw = varyingColor1.xy * float2(0.5,-0.5) + float2(0.5,0.5);
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector9.xy = workingVector7.ww ? workingVector9.xy : workingVector9.zw;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector9.xy = workingVector6.ww ? workingVector9.xy : workingVector9.zw;
#endif
    workingVector10.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector10.xyz;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector7.w = dot(workingVector10.xyz, workingVector10.xyz);
    workingVector7.w = rsqrt(workingVector7.w);
    workingVector10.xyz = workingVector10.xyz * workingVector7.www;
    workingVector7.w = dot(workingVector8.xyz, workingVector8.xyz);
    workingVector7.w = rsqrt(workingVector7.w);
    workingVector8.xyz = workingVector8.xyz * workingVector7.www;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector6.w = dot(workingVector10.xyz, workingVector10.xyz);
    workingVector6.w = rsqrt(workingVector6.w);
    workingVector10.xyz = workingVector10.xyz * workingVector6.www;
    workingVector6.w = dot(workingVector7.yzw, workingVector7.yzw);
    workingVector6.w = rsqrt(workingVector6.w);
    workingVector7.yzw = workingVector7.yzw * workingVector6.www;
#endif
    workingVector9.xy = RD_UNIFORM_VIEWPORT_SCALE.xy * workingVector9.xy;
    workingVector9.xyzw = materialTexture7.Sample(textureSampler7, workingVector9.xy).xyzw;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector7.w = 0.180000007 / workingVector4.w;
    workingVector7.w = 9.99999975e-005 + workingVector7.w;
    workingVector11.xyz = workingVector9.xyz / workingVector7.www;
    workingVector9.xyz = workingVector3.www ? workingVector11.xyz : workingVector9.xyz;
    workingVector7.w = dot(workingVector10.xyz, workingVector0.xyw);
    workingVector7.w = workingVector7.w + workingVector7.w;
    workingVector10.xyz = workingVector0.xyw * -workingVector7.www + workingVector10.xyz;
    workingVector6.w = RD_COMPARISON_MASK((int)workingVector6.w == 1);
    workingVector11.y = -workingVector1.w * 0.00392156886 + 1;
    workingVector7.w = workingVector11.y * workingVector11.y;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector6.w = 0.180000007 / workingVector0.w;
    workingVector6.w = 9.99999975e-005 + workingVector6.w;
    workingVector11.xyz = workingVector9.xyz / workingVector6.www;
    workingVector9.xyz = workingVector0.zzz ? workingVector11.xyz : workingVector9.xyz;
    workingVector6.w = dot(workingVector10.xyz, workingVector4.xyz);
    workingVector6.w = workingVector6.w + workingVector6.w;
    workingVector10.xyz = workingVector4.xyz * -workingVector6.www + workingVector10.xyz;
    workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 1);
    workingVector11.y = -workingVector0.x * 0.00392156886 + 1;
    workingVector6.w = workingVector11.y * workingVector11.y;
#endif
    workingVector8.w = -workingVector11.y * workingVector11.y + 1;
    workingVector11.z = -1 + RD_UNIFORM_IBL_PARAMETERS.y;
    workingVector8.w = workingVector11.z * workingVector8.w;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector7.w = workingVector7.w * workingVector7.w;
    workingVector7.w = -workingVector7.w * workingVector7.w + 1;
    workingVector7.w = workingVector7.w * workingVector11.z;
    workingVector6.w = workingVector6.w ? workingVector8.w : workingVector7.w;
    workingVector7.w = (int)RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x;
    workingVector7.w = (int)workingVector7.w + 2;
    workingVector8.w = (int)workingVector7.w & 0x80000000;
    workingVector7.w = max((int)-workingVector7.w, (int)workingVector7.w);
    workingVector7.w = (uint)workingVector7.w % 3;
    workingVector11.z = -(int)workingVector7.w;
    workingVector7.w = workingVector8.w ? workingVector11.z : workingVector7.w;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector6.w = workingVector6.w * workingVector6.w;
    workingVector6.w = -workingVector6.w * workingVector6.w + 1;
    workingVector6.w = workingVector6.w * workingVector11.z;
    workingVector5.w = workingVector5.w ? workingVector8.w : workingVector6.w;
    workingVector6.w = (int)RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x;
    workingVector6.w = (int)workingVector6.w + 2;
    workingVector8.w = (int)workingVector6.w & 0x80000000;
    workingVector6.w = max((int)-workingVector6.w, (int)workingVector6.w);
    workingVector6.w = (uint)workingVector6.w % 3;
    workingVector11.z = -(int)workingVector6.w;
    workingVector6.w = workingVector8.w ? workingVector11.z : workingVector6.w;
#endif
    workingVector10.w = trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x);
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector12.xyz = materialTexture12.SampleLevel(textureSampler12, workingVector10.xyzw, workingVector6.w).xyz;
    workingVector10.w = (int)workingVector7.w;
    workingVector10.xyz = materialTexture12.SampleLevel(textureSampler12, workingVector10.xyzw, workingVector6.w).xyz;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector12.xyz = materialTexture12.SampleLevel(textureSampler12, workingVector10.xyzw, workingVector5.w).xyz;
    workingVector10.w = (int)workingVector6.w;
    workingVector10.xyz = materialTexture12.SampleLevel(textureSampler12, workingVector10.xyzw, workingVector5.w).xyz;
#endif
    workingVector12.xyz = workingVector12.xyz + -workingVector10.xyz;
    workingVector10.xyz = RD_UNIFORM_IBL_PARAMETERS.www * workingVector12.xyz + workingVector10.xyz;
    workingVector12.xyz = float3(301.724121,301.724121,301.724121) * workingVector10.xyz;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector10.xyz = workingVector3.www ? workingVector12.xyz : workingVector10.xyz;
    workingVector10.xyz = workingVector10.xyz * workingVector2.www;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector10.xyz = workingVector0.zzz ? workingVector12.xyz : workingVector10.xyz;
    workingVector10.xyz = workingVector10.xyz * workingVector0.yyy;
#endif
    workingVector10.xyz = RD_UNIFORM_IBL_PARAMETERS.zzz * workingVector10.xyz;
    workingVector12.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector13.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector7.xyz;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector13.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector8.xyz;
#endif
    workingVector14.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector13.xyz;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector6.w = saturate(dot(workingVector14.xyz, float3(0.212599993,0.715200007,0.0722000003)));
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector5.w = saturate(dot(workingVector14.xyz, float3(0.212599993,0.715200007,0.0722000003)));
#endif
    workingVector13.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector13.xyz + -workingVector12.xyz;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector12.xyz = workingVector6.www * workingVector13.xyz + workingVector12.xyz;
    workingVector12.xyz = workingVector12.xyz * workingVector6.xxx;
    workingVector6.w = dot(workingVector10.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector7.w = dot(workingVector12.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector6.w = RD_COMPARISON_MASK(workingVector6.w < workingVector7.w);
    workingVector12.xyz = workingVector6.www ? workingVector12.xyz : 0;
    workingVector12.xyz = workingVector6.www ? workingVector12.xyz : workingVector10.xyz;
    workingVector10.xyz = workingVector6.yyy ? workingVector12.xyz : workingVector10.xyz;
    workingVector6.y = RD_UNIFORM_SSR_PARAMETERS.y * workingVector9.w;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector12.xyz = workingVector5.www * workingVector13.xyz + workingVector12.xyz;
    workingVector12.xyz = workingVector12.xyz * workingVector7.xxx;
    workingVector5.w = dot(workingVector10.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector6.w = dot(workingVector12.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector5.w = RD_COMPARISON_MASK(workingVector5.w < workingVector6.w);
    workingVector12.xyz = workingVector5.www ? workingVector12.xyz : 0;
    workingVector12.xyz = workingVector5.www ? workingVector12.xyz : workingVector10.xyz;
    workingVector10.xyz = workingVector3.www ? workingVector12.xyz : workingVector10.xyz;
    workingVector3.w = RD_UNIFORM_SSR_PARAMETERS.y * workingVector9.w;
#endif
    workingVector9.xyz = -workingVector10.xyz + workingVector9.xyz;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector9.xyz = workingVector6.yyy * workingVector9.xyz + workingVector10.xyz;
    workingVector11.x = saturate(dot(workingVector4.xyz, -workingVector8.xyz));
    workingVector6.yw = materialTexture0.Sample(textureSampler0, workingVector11.xy).xy;
    workingVector8.xyz = workingVector5.xyz * workingVector6.yyy + workingVector6.www;
    workingVector8.xyz = workingVector9.xyz * workingVector8.xyz;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector9.xyz = workingVector3.www * workingVector9.xyz + workingVector10.xyz;
    workingVector11.x = saturate(dot(workingVector5.xyz, -workingVector7.yzw));
    workingVector7.yz = materialTexture0.Sample(textureSampler0, workingVector11.xy).xy;
    workingVector7.yzw = workingVector6.xyz * workingVector7.yyy + workingVector7.zzz;
    workingVector7.yzw = workingVector9.xyz * workingVector7.yzw;
#endif
  } else {
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    if (workingVector6.z != 0) {
      workingVector6.y = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
      workingVector6.z = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
      workingVector6.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector3.yyy;
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector3.xxx + workingVector9.xyz;
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector3.zzz + workingVector9.xyz;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    if (workingVector4.w != 0) {
      workingVector3.w = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
      workingVector4.w = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
      workingVector5.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector1.zzz;
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector1.yyy + workingVector9.xyz;
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector1.www + workingVector9.xyz;
#endif
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector9.xyz;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
      workingVector2.xyz = workingVector6.www ? workingVector3.xyz : workingVector2.xyz;
      workingVector9.xyz = workingVector6.www ? workingVector9.xyz : workingVector1.xyz;
      workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector2.xyz;
      workingVector6.w = dot(workingVector2.xyz, workingVector2.xyz);
      workingVector6.w = rsqrt(workingVector6.w);
      workingVector2.xyz = workingVector6.www * workingVector2.xyz;
      workingVector6.w = dot(workingVector9.xyz, workingVector9.xyz);
      workingVector6.w = rsqrt(workingVector6.w);
      workingVector9.xyz = workingVector9.xyz * workingVector6.www;
      workingVector6.w = dot(workingVector2.xyz, workingVector0.xyw);
      workingVector6.w = workingVector6.w + workingVector6.w;
      workingVector10.xyz = workingVector0.xyw * -workingVector6.www + workingVector2.xyz;
      workingVector0.x = RD_COMPARISON_MASK((int)workingVector6.z == 1);
      workingVector2.y = -workingVector1.w * 0.00392156886 + 1;
      workingVector0.y = workingVector2.y * workingVector2.y;
      workingVector0.w = -workingVector2.y * workingVector2.y + 1;
      workingVector2.z = -1 + RD_UNIFORM_IBL_PARAMETERS.y;
      workingVector0.y = workingVector0.y * workingVector0.y;
      workingVector0.y = -workingVector0.y * workingVector0.y + 1;
      workingVector0.yw = workingVector2.zz * workingVector0.yw;
      workingVector0.x = workingVector0.x ? workingVector0.w : workingVector0.y;
      workingVector0.y = (int)RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x;
      workingVector0.y = (int)workingVector0.y + 2;
      workingVector0.w = (int)workingVector0.y & 0x80000000;
      workingVector0.y = max((int)-workingVector0.y, (int)workingVector0.y);
      workingVector0.y = (uint)workingVector0.y % 3;
      workingVector2.z = -(int)workingVector0.y;
      workingVector0.y = workingVector0.w ? workingVector2.z : workingVector0.y;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
      workingVector3.xyz = workingVector5.www ? workingVector1.yzw : workingVector3.xyz;
      workingVector9.xyz = workingVector5.www ? workingVector9.xyz : workingVector2.xyz;
      workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector3.xyz;
      workingVector5.w = dot(workingVector3.xyz, workingVector3.xyz);
      workingVector5.w = rsqrt(workingVector5.w);
      workingVector3.xyz = workingVector5.www * workingVector3.xyz;
      workingVector5.w = dot(workingVector9.xyz, workingVector9.xyz);
      workingVector5.w = rsqrt(workingVector5.w);
      workingVector9.xyz = workingVector9.xyz * workingVector5.www;
      workingVector5.w = dot(workingVector3.xyz, workingVector4.xyz);
      workingVector5.w = workingVector5.w + workingVector5.w;
      workingVector10.xyz = workingVector4.xyz * -workingVector5.www + workingVector3.xyz;
      workingVector3.x = RD_COMPARISON_MASK((int)workingVector4.w == 1);
      workingVector4.y = -workingVector0.x * 0.00392156886 + 1;
      workingVector3.y = workingVector4.y * workingVector4.y;
      workingVector3.z = -workingVector4.y * workingVector4.y + 1;
      workingVector4.z = -1 + RD_UNIFORM_IBL_PARAMETERS.y;
      workingVector3.y = workingVector3.y * workingVector3.y;
      workingVector3.y = -workingVector3.y * workingVector3.y + 1;
      workingVector3.yz = workingVector4.zz * workingVector3.yz;
      workingVector3.x = workingVector3.x ? workingVector3.z : workingVector3.y;
      workingVector3.y = (int)RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x;
      workingVector3.y = (int)workingVector3.y + 2;
      workingVector3.z = (int)workingVector3.y & 0x80000000;
      workingVector3.y = max((int)-workingVector3.y, (int)workingVector3.y);
      workingVector3.y = (uint)workingVector3.y % 3;
      workingVector4.z = -(int)workingVector3.y;
      workingVector3.y = workingVector3.z ? workingVector4.z : workingVector3.y;
#endif
      workingVector10.w = trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x);
#if RD_OPTION_MODE == RD_MODE_DEFAULT
      workingVector11.xyz = materialTexture12.SampleLevel(textureSampler12, workingVector10.xyzw, workingVector0.x).xyz;
      workingVector10.w = (int)workingVector0.y;
      workingVector0.xyw = materialTexture12.SampleLevel(textureSampler12, workingVector10.xyzw, workingVector0.x).xyz;
      workingVector10.xyz = workingVector11.xyz + -workingVector0.xyw;
      workingVector0.xyw = RD_UNIFORM_IBL_PARAMETERS.www * workingVector10.xyz + workingVector0.xyw;
      workingVector10.xyz = float3(301.724121,301.724121,301.724121) * workingVector0.xyw;
      workingVector0.xyw = workingVector3.www ? workingVector10.xyz : workingVector0.xyw;
      workingVector0.xyw = workingVector0.xyw * workingVector2.www;
      workingVector0.xyw = RD_UNIFORM_IBL_PARAMETERS.zzz * workingVector0.xyw;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
      workingVector11.xyz = materialTexture12.SampleLevel(textureSampler12, workingVector10.xyzw, workingVector3.x).xyz;
      workingVector10.w = (int)workingVector3.y;
      workingVector3.xyz = materialTexture12.SampleLevel(textureSampler12, workingVector10.xyzw, workingVector3.x).xyz;
      workingVector10.xyz = workingVector11.xyz + -workingVector3.xyz;
      workingVector3.xyz = RD_UNIFORM_IBL_PARAMETERS.www * workingVector10.xyz + workingVector3.xyz;
      workingVector10.xyz = float3(301.724121,301.724121,301.724121) * workingVector3.xyz;
      workingVector3.xyz = workingVector0.zzz ? workingVector10.xyz : workingVector3.xyz;
      workingVector3.xyz = workingVector3.xyz * workingVector0.yyy;
      workingVector3.xyz = RD_UNIFORM_IBL_PARAMETERS.zzz * workingVector3.xyz;
#endif
      workingVector10.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
      workingVector11.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector7.xyz;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
      workingVector11.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector8.xyz;
#endif
      workingVector12.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector11.xyz;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
      workingVector2.z = saturate(dot(workingVector12.xyz, float3(0.212599993,0.715200007,0.0722000003)));
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
      workingVector0.y = saturate(dot(workingVector12.xyz, float3(0.212599993,0.715200007,0.0722000003)));
#endif
      workingVector11.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector11.xyz + -workingVector10.xyz;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
      workingVector10.xyz = workingVector2.zzz * workingVector11.xyz + workingVector10.xyz;
      workingVector10.xyz = workingVector10.xyz * workingVector6.xxx;
      workingVector2.z = dot(workingVector0.xyw, float3(0.212599993,0.715200007,0.0722000003));
      workingVector2.w = dot(workingVector10.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector2.z = RD_COMPARISON_MASK(workingVector2.z < workingVector2.w);
      workingVector10.xyz = workingVector2.zzz ? workingVector10.xyz : 0;
      workingVector10.xyz = workingVector2.zzz ? workingVector10.xyz : workingVector0.xyw;
      workingVector0.xyw = workingVector6.yyy ? workingVector10.xyz : workingVector0.xyw;
      workingVector2.x = saturate(dot(workingVector4.xyz, -workingVector9.xyz));
      workingVector2.xy = materialTexture0.Sample(textureSampler0, workingVector2.xy).xy;
      workingVector2.xyz = workingVector5.xyz * workingVector2.xxx + workingVector2.yyy;
      workingVector8.xyz = workingVector2.xyz * workingVector0.xyw;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
      workingVector10.xyz = workingVector0.yyy * workingVector11.xyz + workingVector10.xyz;
      workingVector10.xyz = workingVector10.xyz * workingVector7.xxx;
      workingVector0.y = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector4.z = dot(workingVector10.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector0.y = RD_COMPARISON_MASK(workingVector0.y < workingVector4.z);
      workingVector10.xyz = workingVector0.yyy ? workingVector10.xyz : 0;
      workingVector10.xyz = workingVector0.yyy ? workingVector10.xyz : workingVector3.xyz;
      workingVector3.xyz = workingVector3.www ? workingVector10.xyz : workingVector3.xyz;
      workingVector4.x = saturate(dot(workingVector5.xyz, -workingVector9.xyz));
      workingVector4.xy = materialTexture0.Sample(textureSampler0, workingVector4.xy).xy;
      workingVector4.xyz = workingVector6.xyz * workingVector4.xxx + workingVector4.yyy;
      workingVector7.yzw = workingVector4.xyz * workingVector3.xyz;
#endif
    } else {
#if RD_OPTION_MODE == RD_MODE_DEFAULT
      workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
      if (workingVector0.x != 0) {
        workingVector0.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
        workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector3.yyy;
        workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector3.xxx + workingVector2.xyz;
        workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector3.zzz + workingVector2.xyz;
        workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector2.xyz;
        workingVector0.xyw = workingVector0.xxx ? workingVector2.xyz : workingVector1.xyz;
        workingVector1.x = dot(workingVector0.xyw, workingVector0.xyw);
        workingVector1.x = rsqrt(workingVector1.x);
        workingVector0.xyw = workingVector1.xxx * workingVector0.xyw;
        workingVector1.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
        workingVector2.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector7.xyz;
        workingVector3.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector2.xyz;
        workingVector2.w = saturate(dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003)));
        workingVector2.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector2.xyz + -workingVector1.xyz;
        workingVector1.xyz = workingVector2.www * workingVector2.xyz + workingVector1.xyz;
        workingVector1.xyz = workingVector1.xyz * workingVector6.xxx;
        workingVector2.x = dot(workingVector1.xyz, float3(0.212599993,0.715200007,0.0722000003));
        workingVector2.x = RD_COMPARISON_MASK(0 < workingVector2.x);
        workingVector1.xyz = workingVector2.xxx ? workingVector1.xyz : 0;
        workingVector0.x = saturate(dot(workingVector4.xyz, -workingVector0.xyw));
        workingVector0.y = -workingVector1.w * 0.00392156886 + 1;
        workingVector0.xy = materialTexture0.Sample(textureSampler0, workingVector0.xy).xy;
        workingVector0.xyw = workingVector5.xyz * workingVector0.xxx + workingVector0.yyy;
        workingVector8.xyz = workingVector1.xyz * workingVector0.xyw;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
      workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
      if (workingVector0.y != 0) {
        workingVector0.y = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
        workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector1.zzz;
        workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector1.yyy + workingVector3.xyz;
        workingVector1.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector1.www + workingVector3.xyz;
        workingVector1.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector1.yzw;
        workingVector1.yzw = workingVector0.yyy ? workingVector1.yzw : workingVector2.xyz;
        workingVector0.y = dot(workingVector1.yzw, workingVector1.yzw);
        workingVector0.y = rsqrt(workingVector0.y);
        workingVector1.yzw = workingVector1.yzw * workingVector0.yyy;
        workingVector2.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
        workingVector3.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector8.xyz;
        workingVector4.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector3.xyz;
        workingVector0.y = saturate(dot(workingVector4.xyz, float3(0.212599993,0.715200007,0.0722000003)));
        workingVector3.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector3.xyz + -workingVector2.xyz;
        workingVector2.xyz = workingVector0.yyy * workingVector3.xyz + workingVector2.xyz;
        workingVector2.xyz = workingVector2.xyz * workingVector7.xxx;
        workingVector0.y = dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003));
        workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.y);
        workingVector2.xyz = workingVector0.yyy ? workingVector2.xyz : 0;
        workingVector3.x = saturate(dot(workingVector5.xyz, -workingVector1.yzw));
        workingVector3.y = -workingVector0.x * 0.00392156886 + 1;
        workingVector0.xy = materialTexture0.Sample(textureSampler0, workingVector3.xy).xy;
        workingVector1.yzw = workingVector6.xyz * workingVector0.xxx + workingVector0.yyy;
        workingVector7.yzw = workingVector2.xyz * workingVector1.yzw;
#endif
      } else {
#if RD_OPTION_MODE == RD_MODE_DEFAULT
        workingVector8.xyz = float3(0,0,0);
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
        workingVector7.yzw = float3(0,0,0);
#endif
      }
    }
  }
  workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.000000);
  workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
#if RD_OPTION_MODE == RD_MODE_DEFAULT
  workingVector0.w = workingVector5.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
  workingVector0.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector0.w;
  workingVector0.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.w;
  workingVector1.x = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector0.w);
  workingVector1.x = 1 + -workingVector1.x;
  workingVector1.xyz = workingVector8.xyz * workingVector1.xxx;
  workingVector1.w = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  workingVector0.w = saturate(workingVector0.w / workingVector1.w);
  workingVector0.w = 1 + -workingVector0.w;
  workingVector2.xyz = workingVector8.xyz * workingVector0.www;
  workingVector1.xyz = workingVector0.xxx ? workingVector1.xyz : workingVector2.xyz;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
  workingVector1.y = workingVector2.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
  workingVector1.y = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector1.y;
  workingVector1.y = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector1.y;
  workingVector1.z = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector1.y);
  workingVector1.z = 1 + -workingVector1.z;
  workingVector2.xyz = workingVector7.yzw * workingVector1.zzz;
  workingVector1.z = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  workingVector1.y = saturate(workingVector1.y / workingVector1.z);
  workingVector1.y = 1 + -workingVector1.y;
  workingVector1.yzw = workingVector7.yzw * workingVector1.yyy;
  workingVector1.yzw = workingVector0.xxx ? workingVector2.xyz : workingVector1.yzw;
#endif
  if (workingVector0.y != 0) {
    workingVector0.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * varyingColor1.yy;
    workingVector0.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * varyingColor1.xx + workingVector0.xy;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector0.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector0.zz + workingVector0.xy;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector0.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector1.xx + workingVector0.xy;
#endif
    workingVector0.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector0.xy;
    workingVector0.x = -workingVector0.x / workingVector0.y;
    workingVector0.x = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector0.x;
    workingVector0.y = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector0.x = workingVector0.x / workingVector0.y;
    workingVector0.x = workingVector0.x * 53.5981483 + 1;
    workingVector0.x = log2(workingVector0.x);
    workingVector0.x = 0.173286796 * workingVector0.x;
    workingVector0.y = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector0.z = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector0.x = workingVector0.x * workingVector0.z + -0.5;
    workingVector0.z = (int)workingVector0.x;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector1.x = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector0.x = workingVector0.x * workingVector1.x + -0.5;
    workingVector1.x = (int)workingVector0.x;
#endif
    workingVector0.y = (int)workingVector0.y + -2;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector0.z = max(0, (int)workingVector0.z);
    workingVector0.y = min((int)workingVector0.z, (int)workingVector0.y);
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector1.x = max(0, (int)workingVector1.x);
    workingVector0.y = min((int)workingVector1.x, (int)workingVector0.y);
#endif
    workingVector2.z = (int)workingVector0.y;
    workingVector0.x = saturate(-workingVector2.z + workingVector0.x);
    workingVector2.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector0.z = materialTexture10.SampleLevel(textureSampler10, workingVector2.xyz, 0).w;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector1.x = materialTexture10.SampleLevel(textureSampler10, workingVector2.xyz, 0).w;
#endif
    workingVector0.y = (int)workingVector0.y + 1;
    workingVector2.z = (int)workingVector0.y;
    workingVector2.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector0.y = materialTexture10.SampleLevel(textureSampler10, workingVector2.xyz, 0).w;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
    workingVector0.y = workingVector0.y + -workingVector0.z;
    workingVector0.x = workingVector0.x * workingVector0.y + workingVector0.z;
    workingVector1.xyz = workingVector0.xxx * workingVector1.xyz;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
    workingVector0.y = workingVector0.y + -workingVector1.x;
    workingVector0.x = workingVector0.x * workingVector0.y + workingVector1.x;
    workingVector1.yzw = workingVector0.xxx * workingVector1.yzw;
#endif
  }
#if RD_OPTION_MODE == RD_MODE_DEFAULT
  workingVector0.x = 0.180000007 / workingVector4.w;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
  workingVector0.x = 0.180000007 / workingVector0.w;
#endif
  workingVector0.x = 9.99999975e-005 + workingVector0.x;
#if RD_OPTION_MODE == RD_MODE_DEFAULT
  workingVector0.xyz = workingVector1.xyz * workingVector0.xxx;
  fragmentColor0.xyz = workingVector3.www ? workingVector0.xyz : workingVector1.xyz;
#elif RD_OPTION_MODE == RD_MODE_MIXED_RES
  workingVector0.xyw = workingVector1.yzw * workingVector0.xxx;
  fragmentColor0.xyz = workingVector0.zzz ? workingVector0.xyw : workingVector1.yzw;
#endif
  fragmentColor0.w = 1;
  return;
}
#endif
