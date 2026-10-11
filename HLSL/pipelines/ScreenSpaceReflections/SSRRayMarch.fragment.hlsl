// ScreenSpaceReflections / SSRRayMarch / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT2_16 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT3_17 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT4_18 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT_15 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT2_12 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT3_13 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT4_14 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT_11 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_4 1
#endif
#define RD_USE_TEXTURE_SIZE_UINT2_10 1
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/ScreenSpaceReflections/FragmentBindings.hlsli"

#include "../../include/Math.hlsli"
void executeFragmentStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue55 = varyingTexCoord0.x * RD_UNIFORM_SCREEN_SIZE.x;
    precise float productValue56 = varyingTexCoord0.y * RD_UNIFORM_SCREEN_SIZE.y;
    precise float sumValue25 = floor(productValue55) + 0.5f;
    precise float sumValue26 = floor(productValue56) + 0.5f;
    precise float productValue57 = sumValue25 * RD_UNIFORM_SCREEN_SIZE.z;
    precise float productValue58 = sumValue26 * RD_UNIFORM_SCREEN_SIZE.w;
    uint intermediateValue11;
    rdTextureSize(materialTexture2, 0u, intermediateValue11);
    bool conditionValue3 = intermediateValue11 > 0u;
    uint unusedTextureMipCount102;
    uint2 vectorValue1 = rdTextureSize(materialTexture2, 0u, unusedTextureMipCount102);
    uint scalarValue16 = vectorValue1.x;
    precise float comparisonValue26 = productValue57 * rdUnsignedToFloat(conditionValue3 ? scalarValue16 : 0u);
    precise float comparisonValue27 = productValue58 * rdUnsignedToFloat(conditionValue3 ? vectorValue1.y : 0u);
    precise float loadedBufferValue2 = rdUnsignedToFloat((materialTexture2.Load(int3(uint2(uint(int(comparisonValue26)), uint(int(comparisonValue27))), 0u)).x >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    float scalarValue39 = ddx(productValue57);
    float scalarValue40 = ddy(productValue58);
    float scalarValue41 = ddx(productValue58);
    float scalarValue42 = ddy(productValue57);
    if (RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.x < loadedBufferValue2)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float productValue39 = (floor(varyingTexCoord0.x * RD_UNIFORM_SCREEN_SIZE.x) + 0.5f) * RD_UNIFORM_SCREEN_SIZE.z;
    float productValue40 = (floor(varyingTexCoord0.y * RD_UNIFORM_SCREEN_SIZE.y) + 0.5f) * RD_UNIFORM_SCREEN_SIZE.w;
    uint intermediateValue11;
    rdTextureSize(materialTexture2, 0u, intermediateValue11);
    bool conditionValue3 = intermediateValue11 > 0u;
    uint unusedTextureMipCount102;
    uint2 vectorValue1 = rdTextureSize(materialTexture2, 0u, unusedTextureMipCount102);
    uint scalarValue16 = vectorValue1.x;
    float loadedBufferValue1 = rdUnsignedToFloat(rdBitfieldUExtract(materialTexture2.Load(int3(uint2(uint(int(productValue39 * rdUnsignedToFloat(conditionValue3 ? scalarValue16 : 0u))), uint(int(productValue40 * rdUnsignedToFloat(conditionValue3 ? vectorValue1.y : 0u)))), 0u)).x, 8u, 8u)) * 0.0039215688593685626983642578125f;
    float scalarValue17 = ddy_coarse(productValue40);
    float scalarValue18 = ddx_coarse(productValue39);
    float scalarValue19 = ddx_coarse(productValue40);
    float scalarValue20 = ddy_coarse(productValue39);
    if (RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.x < loadedBufferValue1)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (floor(RD_UNIFORM_SCREEN_SIZE.x * varyingTexCoord0.x) + 0.5f) * RD_UNIFORM_SCREEN_SIZE.z;
    float productValue1 = (floor(RD_UNIFORM_SCREEN_SIZE.y * varyingTexCoord0.y) + 0.5f) * RD_UNIFORM_SCREEN_SIZE.w;
    uint unusedTextureMipCount121;
    uint2 vectorValue = rdTextureSize(gbufferRoughnessTexture, 0u, unusedTextureMipCount121);
    float loadedBufferValue = float((gbufferRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue.x)))))) * productValue)), uint(int(float(int(uint(int(float(int(vectorValue.y)))))) * productValue1))), 0u)).x >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    float intermediateValue1;
    float intermediateValue3;
    float intermediateValue5;
    float intermediateValue7;
    if (loadedBufferValue > RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.x)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        fragmentColor0.x = 0.0f;
        fragmentColor0.y = 0.0f;
        fragmentColor0.z = 0.0f;
        fragmentColor0.w = -1.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue1 = 0.0f;
        intermediateValue3 = 0.0f;
        intermediateValue5 = 0.0f;
        intermediateValue7 = -1.0f;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float productValue59 = varyingTexCoord1.x * RD_UNIFORM_INV_PROJ_ROW_0.x;
        precise float productValue60 = varyingTexCoord1.y * RD_UNIFORM_INV_PROJ_ROW_1.y;
        float sampledTextureValue10 = mad(materialTexture0.SampleGrad(textureSampler0, float2(productValue57, productValue58), float2(scalarValue39, scalarValue41), float2(scalarValue42, scalarValue40)).x, RD_UNIFORM_INV_PROJ_ROW_2.w, RD_UNIFORM_INV_PROJ_ROW_3.w);
        precise float quotientValue12 = productValue59 / sampledTextureValue10;
        precise float quotientValue13 = productValue60 / sampledTextureValue10;
        precise float quotientValue14 = RD_UNIFORM_INV_PROJ_ROW_3.z / sampledTextureValue10;
        float4 sampledTextureValue11 = materialTexture1.SampleGrad(textureSampler1, float2(productValue57, productValue58), float2(scalarValue39, scalarValue41), float2(scalarValue42, scalarValue40));
        float scalarValue43 = sampledTextureValue11.x;
        float scalarValue44 = sampledTextureValue11.y;
        float scalarValue45 = abs(scalarValue44);
        precise float sumValue27 = 1.0f - abs(scalarValue43);
        precise float sumValue28 = 1.0f - scalarValue45;
        precise float sumValue29 = sumValue27 - scalarValue45;
        bool conditionValue8 = sumValue29 < 0.0f;
        precise float comparisonValue28 = sumValue28 * ((scalarValue43 >= 0.0f) ? 1.0f : (-1.0f));
        precise float comparisonValue29 = sumValue27 * ((scalarValue44 >= 0.0f) ? 1.0f : (-1.0f));
        float comparisonValue30 = conditionValue8 ? comparisonValue28 : scalarValue43;
        float comparisonValue31 = conditionValue8 ? comparisonValue29 : scalarValue44;
        float3 vectorValue8 = float3(comparisonValue30, comparisonValue31, sumValue29);
        float inverseLengthValue14 = rsqrt(rdDot3Precise(vectorValue8, vectorValue8));
        precise float productValue61 = inverseLengthValue14 * comparisonValue30;
        precise float productValue62 = inverseLengthValue14 * comparisonValue31;
        precise float productValue63 = inverseLengthValue14 * sumValue29;
        float3 vectorValue9 = float3(productValue61, productValue62, productValue63);
        float scalarValue46 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_0.xyz), vectorValue9);
        float scalarValue47 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_1.xyz), vectorValue9);
        float scalarValue48 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_2.xyz), vectorValue9);
        float3 vectorValue10 = float3(scalarValue46, scalarValue47, scalarValue48);
        float inverseLengthValue15 = rsqrt(rdDot3Precise(vectorValue10, vectorValue10));
        precise float productValue64 = inverseLengthValue15 * scalarValue46;
        precise float productValue65 = inverseLengthValue15 * scalarValue47;
        precise float productValue66 = inverseLengthValue15 * scalarValue48;
        float3 vectorValue11 = float3(quotientValue12, quotientValue13, quotientValue14);
        float inverseLengthValue16 = rsqrt(rdDot3Precise(vectorValue11, vectorValue11));
        precise float productValue67 = inverseLengthValue16 * quotientValue12;
        precise float productValue68 = inverseLengthValue16 * quotientValue13;
        precise float productValue69 = inverseLengthValue16 * quotientValue14;
        float scalarValue49 = rdDot3Precise(float3(productValue67, productValue68, productValue69), float3(productValue64, productValue65, productValue66));
        precise float sumValue30 = scalarValue49 + scalarValue49;
        float scalarValue50 = -sumValue30;
        float multiplyAddValue45 = mad(productValue64, scalarValue50, productValue67);
        float multiplyAddValue46 = mad(productValue65, scalarValue50, productValue68);
        float multiplyAddValue47 = mad(productValue66, scalarValue50, productValue69);
        float3 vectorValue12 = float3(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47);
        float inverseLengthValue17 = rsqrt(rdDot3Precise(vectorValue12, vectorValue12));
        precise float productValue70 = inverseLengthValue17 * multiplyAddValue45;
        precise float productValue71 = inverseLengthValue17 * multiplyAddValue46;
        precise float productValue72 = inverseLengthValue17 * multiplyAddValue47;
        float multiplyAddValue48 = mad(productValue64, RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.z, quotientValue12);
        float multiplyAddValue49 = mad(productValue65, RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.z, quotientValue13);
        float multiplyAddValue50 = mad(productValue66, RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.z, quotientValue14);
        float multiplyAddValue51 = mad(multiplyAddValue45, inverseLengthValue17, multiplyAddValue48);
        float multiplyAddValue52 = mad(multiplyAddValue46, inverseLengthValue17, multiplyAddValue49);
        float multiplyAddValue53 = mad(multiplyAddValue47, inverseLengthValue17, multiplyAddValue50);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue5 = mad(materialTexture0.SampleGrad(textureSampler0, float2(productValue39, productValue40), float2(scalarValue18, scalarValue19), float2(scalarValue20, scalarValue17)).x, RD_UNIFORM_INV_PROJ_ROW_2.w, RD_UNIFORM_INV_PROJ_ROW_3.w);
        float quotientValue7 = (varyingTexCoord1.x * RD_UNIFORM_INV_PROJ_ROW_0.x) / sampledTextureValue5;
        float quotientValue8 = (varyingTexCoord1.y * RD_UNIFORM_INV_PROJ_ROW_1.y) / sampledTextureValue5;
        float quotientValue9 = RD_UNIFORM_INV_PROJ_ROW_3.z / sampledTextureValue5;
        float4 sampledTextureValue6 = materialTexture1.SampleGrad(textureSampler1, float2(productValue39, productValue40), float2(scalarValue18, scalarValue19), float2(scalarValue20, scalarValue17));
        float scalarValue21 = sampledTextureValue6.x;
        float scalarValue22 = sampledTextureValue6.y;
        float scalarValue23 = abs(scalarValue22);
        float sumValue19 = 1.0f - abs(scalarValue21);
        float sumValue20 = sumValue19 - scalarValue23;
        bool conditionValue4 = sumValue20 < 0.0f;
        float comparisonValue22 = conditionValue4 ? (((scalarValue21 >= 0.0f) ? 1.0f : (-1.0f)) * (1.0f - scalarValue23)) : scalarValue21;
        float comparisonValue23 = conditionValue4 ? (((scalarValue22 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue19) : scalarValue22;
        float3 vectorValue2 = float3(comparisonValue22, comparisonValue23, sumValue20);
        float inverseLengthValue8 = rsqrt(rdDot3Precise(vectorValue2, vectorValue2));
        float3 productValue41 = float3(inverseLengthValue8 * comparisonValue22, inverseLengthValue8 * comparisonValue23, inverseLengthValue8 * sumValue20);
        float scalarValue24 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_0.xyz), productValue41);
        float scalarValue25 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_1.xyz), productValue41);
        float scalarValue26 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_2.xyz), productValue41);
        float3 vectorValue3 = float3(scalarValue24, scalarValue25, scalarValue26);
        float inverseLengthValue9 = rsqrt(rdDot3Precise(vectorValue3, vectorValue3));
        float productValue42 = inverseLengthValue9 * scalarValue24;
        float productValue43 = inverseLengthValue9 * scalarValue25;
        float productValue44 = inverseLengthValue9 * scalarValue26;
        float3 vectorValue4 = float3(quotientValue7, quotientValue8, quotientValue9);
        float inverseLengthValue10 = rsqrt(rdDot3Precise(vectorValue4, vectorValue4));
        float productValue45 = inverseLengthValue10 * quotientValue7;
        float productValue46 = inverseLengthValue10 * quotientValue8;
        float productValue47 = inverseLengthValue10 * quotientValue9;
        float scalarValue27 = rdDot3Precise(float3(productValue45, productValue46, productValue47), float3(productValue42, productValue43, productValue44));
        float sumValue21 = -(scalarValue27 + scalarValue27);
        float multiplyAddValue14 = mad(productValue42, sumValue21, productValue45);
        float multiplyAddValue15 = mad(productValue43, sumValue21, productValue46);
        float multiplyAddValue16 = mad(productValue44, sumValue21, productValue47);
        float3 vectorValue5 = float3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16);
        float inverseLengthValue11 = rsqrt(rdDot3Precise(vectorValue5, vectorValue5));
        float productValue48 = inverseLengthValue11 * multiplyAddValue14;
        float productValue49 = inverseLengthValue11 * multiplyAddValue15;
        float productValue50 = inverseLengthValue11 * multiplyAddValue16;
        float multiplyAddValue17 = mad(productValue42, RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.z, quotientValue7);
        float multiplyAddValue18 = mad(productValue43, RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.z, quotientValue8);
        float multiplyAddValue21 = mad(productValue44, RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.z, quotientValue9);
        float multiplyAddValue22 = mad(multiplyAddValue14, inverseLengthValue11, multiplyAddValue17);
        float multiplyAddValue23 = mad(multiplyAddValue15, inverseLengthValue11, multiplyAddValue18);
        float multiplyAddValue24 = mad(multiplyAddValue16, inverseLengthValue11, multiplyAddValue21);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sumValue = (-0.0f) - RD_UNIFORM_CAMERA_DATA.y;
        float sumValue1 = (-0.0f) - RD_UNIFORM_CAMERA_DATA.x;
        uint scalarValue = uint(int(RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.w));
        float sampledTextureValue = (gbufferDepthTexture.Sample(gbufferDepthSampler, float2(productValue, productValue1)).x * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
        float quotientValue = (RD_UNIFORM_INV_PROJ_ROW_0.x * varyingTexCoord1.x) / sampledTextureValue;
        float quotientValue1 = (RD_UNIFORM_INV_PROJ_ROW_1.y * varyingTexCoord1.y) / sampledTextureValue;
        float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / sampledTextureValue;
        float4 sampledTextureValue1 = gbufferNormalTexture.Sample(gbufferNormalSampler, float2(productValue, productValue1));
        float scalarValue1 = sampledTextureValue1.x;
        float scalarValue2 = sampledTextureValue1.y;
        float sumValue2 = 1.0f - abs(scalarValue1);
        float scalarValue3 = abs(scalarValue2);
        float sumValue3 = sumValue2 - scalarValue3;
        bool conditionValue = sumValue3 < 0.0f;
        float comparisonValue = conditionValue ? ((1.0f - scalarValue3) * ((scalarValue1 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue1;
        float comparisonValue1 = conditionValue ? (((scalarValue2 < 0.0f) ? (-1.0f) : 1.0f) * sumValue2) : scalarValue2;
        float inverseLengthValue = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue3), float3(comparisonValue, comparisonValue1, sumValue3)));
        float productValue2 = comparisonValue * inverseLengthValue;
        float productValue3 = comparisonValue1 * inverseLengthValue;
        float productValue4 = inverseLengthValue * sumValue3;
        float inverseLengthValue1 = rsqrt(dot(float3(productValue2, productValue3, productValue4), float3(productValue2, productValue3, productValue4)));
        float productValue5 = inverseLengthValue1 * productValue2;
        float productValue6 = productValue3 * inverseLengthValue1;
        float productValue7 = inverseLengthValue1 * productValue4;
        float multiplyAddValue = mad(RD_UNIFORM_INV_VIEW_ROW_0.z, productValue7, mad(RD_UNIFORM_INV_VIEW_ROW_0.y, productValue6, productValue5 * RD_UNIFORM_INV_VIEW_ROW_0.x));
        float multiplyAddValue1 = mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue7, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue6, productValue5 * RD_UNIFORM_INV_VIEW_ROW_1.x));
        float multiplyAddValue2 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue7, mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue6, productValue5 * RD_UNIFORM_INV_VIEW_ROW_2.x));
        float inverseLengthValue2 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        float productValue8 = inverseLengthValue2 * multiplyAddValue;
        float productValue9 = inverseLengthValue2 * multiplyAddValue1;
        float productValue10 = inverseLengthValue2 * multiplyAddValue2;
        float inverseLengthValue3 = rsqrt(dot(float3(quotientValue, quotientValue1, quotientValue2), float3(quotientValue, quotientValue1, quotientValue2)));
        float productValue11 = inverseLengthValue3 * quotientValue;
        float productValue12 = inverseLengthValue3 * quotientValue1;
        float productValue13 = inverseLengthValue3 * quotientValue2;
        float dotProductValue = dot(float3(productValue11, productValue12, productValue13), float3(productValue8, productValue9, productValue10)) * 2.0f;
        float productValue14 = productValue11 - (dotProductValue * productValue8);
        float productValue15 = productValue12 - (dotProductValue * productValue9);
        float productValue16 = productValue13 - (dotProductValue * productValue10);
        float inverseLengthValue4 = rsqrt(dot(float3(productValue14, productValue15, productValue16), float3(productValue14, productValue15, productValue16)));
        float productValue17 = productValue14 * inverseLengthValue4;
        float productValue18 = productValue15 * inverseLengthValue4;
        float productValue19 = productValue16 * inverseLengthValue4;
        float productValue20 = (productValue8 * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.z) + quotientValue;
        float productValue21 = (productValue9 * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.z) + quotientValue1;
        float productValue22 = (productValue10 * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.z) + quotientValue2;
        float sumValue5 = productValue17 + productValue20;
        float sumValue7 = productValue18 + productValue21;
        float sumValue8 = productValue19 + productValue22;
#endif
        bool conditionValue1 = RD_UNIFORM_CAMERA_DATA.x < RD_UNIFORM_CAMERA_DATA.y;
#if RD_PLATFORM == RD_PLATFORM_SM40
        bool conditionValue5 = !conditionValue1;
        if (((conditionValue1 && ((RD_UNIFORM_CAMERA_DATA.x < multiplyAddValue53) && (multiplyAddValue53 < RD_UNIFORM_CAMERA_DATA.y))) || (conditionValue5 && ((RD_UNIFORM_CAMERA_DATA.y < multiplyAddValue53) && (multiplyAddValue53 < RD_UNIFORM_CAMERA_DATA.x)))) && ((((RD_UNIFORM_CAMERA_DATA.x < multiplyAddValue50) && (multiplyAddValue50 < RD_UNIFORM_CAMERA_DATA.y)) && conditionValue1) || (conditionValue5 && ((multiplyAddValue50 < RD_UNIFORM_CAMERA_DATA.x) && (RD_UNIFORM_CAMERA_DATA.y < multiplyAddValue50)))))
#elif RD_PLATFORM == RD_PLATFORM_SM50
        bool conditionValue5 = !conditionValue1;
        if (((conditionValue5 && ((multiplyAddValue24 < RD_UNIFORM_CAMERA_DATA.x) && (RD_UNIFORM_CAMERA_DATA.y < multiplyAddValue24))) || (conditionValue1 && ((RD_UNIFORM_CAMERA_DATA.x < multiplyAddValue24) && (multiplyAddValue24 < RD_UNIFORM_CAMERA_DATA.y)))) && ((conditionValue1 && ((RD_UNIFORM_CAMERA_DATA.x < multiplyAddValue21) && (multiplyAddValue21 < RD_UNIFORM_CAMERA_DATA.y))) || (conditionValue5 && ((multiplyAddValue21 < RD_UNIFORM_CAMERA_DATA.x) && (RD_UNIFORM_CAMERA_DATA.y < multiplyAddValue21)))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        bool bitwiseValue;
        if (conditionValue1)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue73 = multiplyAddValue49 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
            precise float productValue74 = multiplyAddValue49 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
            precise float productValue75 = multiplyAddValue49 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
            precise float productValue76 = multiplyAddValue49 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
            precise float multiplyAddValue54 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue50, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue48, productValue73)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
            precise float multiplyAddValue55 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue50, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue48, productValue74)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
            precise float multiplyAddValue56 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue50, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue48, productValue75)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
            precise float multiplyAddValue57 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue50, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue48, productValue76)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
            precise float quotientValue15 = multiplyAddValue54 / multiplyAddValue57;
            precise float quotientValue17 = multiplyAddValue55 / multiplyAddValue57;
            precise float quotientValue18 = multiplyAddValue56 / multiplyAddValue57;
            precise float sumValue31 = quotientValue15 + 1.0f;
            precise float sumValue32 = quotientValue17 + 1.0f;
            precise float productValue77 = RD_UNIFORM_VIEWPORT_SCALE.x * sumValue31;
            float multiplyAddValue58 = mad(-sumValue32, 0.5f, 1.0f);
            precise float productValue78 = productValue77 * 0.5f;
            precise float productValue79 = multiplyAddValue58 * RD_UNIFORM_VIEWPORT_SCALE.y;
            precise float productValue80 = quotientValue18 * 1.0f;
            precise float productValue81 = multiplyAddValue52 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
            precise float productValue82 = multiplyAddValue52 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
            precise float productValue83 = multiplyAddValue52 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
            precise float productValue84 = multiplyAddValue52 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
            precise float multiplyAddValue59 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue53, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue51, productValue81)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
            precise float multiplyAddValue60 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue53, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue51, productValue82)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
            precise float multiplyAddValue61 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue53, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue51, productValue83)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
            precise float multiplyAddValue62 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue53, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue51, productValue84)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
            precise float quotientValue19 = multiplyAddValue59 / multiplyAddValue62;
            precise float quotientValue20 = multiplyAddValue60 / multiplyAddValue62;
            precise float quotientValue21 = multiplyAddValue61 / multiplyAddValue62;
            precise float sumValue33 = quotientValue19 + 1.0f;
            precise float sumValue34 = quotientValue20 + 1.0f;
            precise float productValue85 = RD_UNIFORM_VIEWPORT_SCALE.x * sumValue33;
            float multiplyAddValue63 = mad(productValue85, 0.5f, -productValue78);
            float multiplyAddValue64 = mad(mad(-sumValue34, 0.5f, 1.0f), RD_UNIFORM_VIEWPORT_SCALE.y, -productValue79);
            precise float productValue86 = multiplyAddValue63 * RD_UNIFORM_SCREEN_SIZE.x;
            precise float productValue87 = multiplyAddValue64 * RD_UNIFORM_SCREEN_SIZE.y;
            float scalarValue51 = max(abs(productValue87), abs(productValue86));
            precise float quotientValue22 = multiplyAddValue63 / scalarValue51;
            precise float quotientValue23 = multiplyAddValue64 / scalarValue51;
            precise float multiplyAddValue65 = mad(quotientValue21, 1.0f, -productValue80) / scalarValue51;
            precise float productValue88 = quotientValue22 * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.y;
            precise float productValue89 = quotientValue23 * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.y;
            precise float productValue90 = multiplyAddValue65 * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.y;
            precise float quotientValue24 = productValue78 / productValue88;
            precise float quotientValue25 = productValue79 / productValue89;
            precise float quotientValue26 = productValue80 / productValue90;
            precise float multiplyAddValue66 = mad(-productValue77, 0.5f, 1.0f) / productValue88;
            precise float multiplyAddValue67 = mad(-multiplyAddValue58, RD_UNIFORM_VIEWPORT_SCALE.y, 1.0f) / productValue89;
            precise float multiplyAddValue68 = mad(-quotientValue18, 1.0f, 1.0f) / productValue90;
            uint comparisonValue32 = uint(min(int(uint(int(RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.x))), int(uint(int(min((productValue90 < 0.0f) ? abs(quotientValue26) : multiplyAddValue68, min((productValue89 < 0.0f) ? abs(quotientValue25) : multiplyAddValue67, (productValue88 < 0.0f) ? abs(quotientValue24) : multiplyAddValue66)))))));
            float scalarValue28 = rdDot2Precise(RD_UNIFORM_CAMERA_DATA.x.xx, RD_UNIFORM_CAMERA_DATA.y.xx);
            precise float sumValue35 = RD_UNIFORM_CAMERA_DATA.y - RD_UNIFORM_CAMERA_DATA.x;
            float scalarValue29 = -RD_UNIFORM_CAMERA_DATA.y;
            precise float multiplyAddValue69 = mad(productValue80, sumValue35, scalarValue29) - RD_UNIFORM_CAMERA_DATA.x;
            precise float quotientValue27 = scalarValue28 / multiplyAddValue69;
            precise float sumValue36 = RD_UNIFORM_CAMERA_DATA.x + quotientValue27;
            precise float quotientValue28 = (-sumValue36) / sumValue35;
            uint intermediateValue38;
            float intermediateValue39;
            float intermediateValue40;
            float intermediateValue41;
            intermediateValue38 = 4294967295u;
            intermediateValue39 = 0.0f;
            intermediateValue40 = 0.0f;
            intermediateValue41 = 0.0f;
            uint comparisonValue7;
            float comparisonValue8;
            float comparisonValue9;
            float comparisonValue10;
            precise float quotientValue16;
            bool multiplyAddValue25;
            uint sumValue12;
            float scalarValue52 = quotientValue28;
            bool conditionValue6 = false;
            uint scalarValue31 = 1u;
            [loop]
            for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue26 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue21, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue17, multiplyAddValue18 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
            float multiplyAddValue27 = (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue21, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue17, multiplyAddValue18 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue26;
            float multiplyAddValue28 = RD_UNIFORM_VIEWPORT_SCALE.x * (((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue21, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue17, multiplyAddValue18 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue26) + 1.0f);
            float multiplyAddValue29 = mad(-(((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue21, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue17, multiplyAddValue18 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue26) + 1.0f), 0.5f, 1.0f);
            float productValue51 = multiplyAddValue28 * 0.5f;
            float productValue52 = multiplyAddValue29 * RD_UNIFORM_VIEWPORT_SCALE.y;
            float multiplyAddValue30 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue22, multiplyAddValue23 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
            float multiplyAddValue31 = mad(RD_UNIFORM_VIEWPORT_SCALE.x * (((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue22, multiplyAddValue23 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue30) + 1.0f), 0.5f, -productValue51);
            float multiplyAddValue32 = mad(mad(-(((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue22, multiplyAddValue23 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue30) + 1.0f), 0.5f, 1.0f), RD_UNIFORM_VIEWPORT_SCALE.y, -productValue52);
            float productValue53 = max(abs(multiplyAddValue32 * RD_UNIFORM_SCREEN_SIZE.y), abs(multiplyAddValue31 * RD_UNIFORM_SCREEN_SIZE.x));
            float quotientValue10 = (multiplyAddValue31 / productValue53) * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.y;
            float quotientValue11 = (multiplyAddValue32 / productValue53) * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.y;
            float multiplyAddValue33 = ((((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue22, multiplyAddValue23 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue30) - multiplyAddValue27) / productValue53) * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.y;
            uint multiplyAddValue34 = uint(min(int(uint(int(RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.x))), int(uint(int(min((multiplyAddValue33 < 0.0f) ? abs(multiplyAddValue27 / multiplyAddValue33) : ((1.0f - multiplyAddValue27) / multiplyAddValue33), min((quotientValue11 < 0.0f) ? abs(productValue52 / quotientValue11) : (mad(-multiplyAddValue29, RD_UNIFORM_VIEWPORT_SCALE.y, 1.0f) / quotientValue11), (quotientValue10 < 0.0f) ? abs(productValue51 / quotientValue10) : (mad(-multiplyAddValue28, 0.5f, 1.0f) / quotientValue10))))))));
            float scalarValue28 = rdDot2Precise(RD_UNIFORM_CAMERA_DATA.x.xx, RD_UNIFORM_CAMERA_DATA.y.xx);
            float sumValue10 = RD_UNIFORM_CAMERA_DATA.y - RD_UNIFORM_CAMERA_DATA.x;
            float scalarValue29 = -RD_UNIFORM_CAMERA_DATA.y;
            float multiplyAddValue35 = (-(RD_UNIFORM_CAMERA_DATA.x + (scalarValue28 / (mad(multiplyAddValue27, sumValue10, scalarValue29) - RD_UNIFORM_CAMERA_DATA.x)))) / sumValue10;
            uint intermediateValue35;
            float intermediateValue36;
            float intermediateValue37;
            float intermediateValue38;
            intermediateValue35 = 4294967295u;
            intermediateValue36 = 0.0f;
            intermediateValue37 = 0.0f;
            intermediateValue38 = 0.0f;
            uint comparisonValue2;
            float comparisonValue3;
            float comparisonValue4;
            float comparisonValue5;
            float multiplyAddValue19;
            bool multiplyAddValue20;
            uint sumValue4;
            float scalarValue30 = multiplyAddValue35;
            bool conditionValue6 = false;
            uint scalarValue31 = 1u;
            [loop]
            for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            bitwiseValue = (RD_UNIFORM_CAMERA_DATA.x < sumValue8) && (sumValue8 < RD_UNIFORM_CAMERA_DATA.y);
        }
        else
        {
            bitwiseValue = (RD_UNIFORM_CAMERA_DATA.x > sumValue8) && (sumValue8 > RD_UNIFORM_CAMERA_DATA.y);
        }
        bool bitwiseValue1;
        if (conditionValue1)
        {
            bitwiseValue1 = (RD_UNIFORM_CAMERA_DATA.x < productValue22) && (productValue22 < RD_UNIFORM_CAMERA_DATA.y);
        }
        else
        {
            bitwiseValue1 = (RD_UNIFORM_CAMERA_DATA.x > productValue22) && (productValue22 > RD_UNIFORM_CAMERA_DATA.y);
        }
        float branchMergedValue6;
        float branchMergedValue7;
        float branchMergedValue8;
        float branchMergedValue9;
        if (bitwiseValue && bitwiseValue1)
        {
            float multiplyAddValue3 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, productValue22, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, productValue21, productValue20 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
            float multiplyAddValue4 = (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, productValue22, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, productValue21, productValue20 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue3;
            float multiplyAddValue5 = (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, productValue22, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, productValue21, productValue20 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue3;
            float multiplyAddValue6 = (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, productValue22, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, productValue21, productValue20 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue3;
            float productValue23 = RD_UNIFORM_VIEWPORT_SCALE.x * 0.5f;
            float productValue24 = (multiplyAddValue4 + 1.0f) * productValue23;
            float productValue25 = (1.0f - ((multiplyAddValue5 + 1.0f) * 0.5f)) * RD_UNIFORM_VIEWPORT_SCALE.y;
            float multiplyAddValue7 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, sumValue8, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, sumValue7, sumValue5 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
            float multiplyAddValue8 = (((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, sumValue8, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, sumValue7, sumValue5 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue7) - multiplyAddValue4) * productValue23;
            float multiplyAddValue9 = (RD_UNIFORM_VIEWPORT_SCALE.y * 0.5f) * (multiplyAddValue5 - ((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, sumValue8, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, sumValue7, sumValue5 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue7));
            float productValue26 = max(abs(multiplyAddValue8 * RD_UNIFORM_SCREEN_SIZE.x), abs(multiplyAddValue9 * RD_UNIFORM_SCREEN_SIZE.y));
            float quotientValue3 = (multiplyAddValue8 / productValue26) * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.y;
            float quotientValue4 = (multiplyAddValue9 / productValue26) * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.y;
            float multiplyAddValue10 = ((((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, sumValue8, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, sumValue7, sumValue5 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue7) - multiplyAddValue6) / productValue26) * RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.y;
            uint comparisonValue17 = uint(min(int(uint(int(min(min((quotientValue3 < 0.0f) ? abs(productValue24 / quotientValue3) : ((1.0f - productValue24) / quotientValue3), (quotientValue4 < 0.0f) ? abs(productValue25 / quotientValue4) : ((1.0f - productValue25) / quotientValue4)), (multiplyAddValue10 < 0.0f) ? abs(multiplyAddValue6 / multiplyAddValue10) : ((1.0f - multiplyAddValue6) / multiplyAddValue10))))), int(uint(int(RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.x)))));
            float multiplyAddValue11 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue19, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue18, productValue17 * RD_UNIFORM_INV_VIEW_ROW_0.x));
            float multiplyAddValue12 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue19, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue18, productValue17 * RD_UNIFORM_INV_VIEW_ROW_0.y));
            float multiplyAddValue13 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue19, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue18, productValue17 * RD_UNIFORM_INV_VIEW_ROW_0.z));
            uint intermediateValue14;
            float intermediateValue15;
            float intermediateValue16;
            float intermediateValue17;
            if (int(comparisonValue17) > int(0u))
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                if (!((!conditionValue6) && (int(comparisonValue32) >= int(scalarValue31))))
                {
                    break;
                }
                float scalarValue32 = rdSignedBitsToFloat(scalarValue31);
                float multiplyAddValue70 = mad(productValue88, scalarValue32, productValue78);
                float multiplyAddValue71 = mad(productValue89, scalarValue32, productValue79);
                float multiplyAddValue72 = mad(productValue90, scalarValue32, productValue80);
                precise float multiplyAddValue73 = mad(multiplyAddValue72, sumValue35, scalarValue29) - RD_UNIFORM_CAMERA_DATA.x;
                precise float quotientValue29 = scalarValue28 / multiplyAddValue73;
                precise float sumValue37 = RD_UNIFORM_CAMERA_DATA.x + quotientValue29;
                precise float sampledTextureValue12 = mad(materialTexture0.Sample(textureSampler0, float2(multiplyAddValue70, multiplyAddValue71)).x, sumValue35, scalarValue29) - RD_UNIFORM_CAMERA_DATA.x;
                precise float quotientValue30 = scalarValue28 / sampledTextureValue12;
                precise float sumValue38 = RD_UNIFORM_CAMERA_DATA.x + quotientValue30;
                quotientValue16 = (-sumValue37) / sumValue35;
                precise float quotientValue31 = (-sumValue38) / sumValue35;
                multiplyAddValue25 = (quotientValue16 >= quotientValue31) && (mad(RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.w, quotientValue31, quotientValue31) >= scalarValue52);
                comparisonValue10 = multiplyAddValue25 ? multiplyAddValue70 : intermediateValue41;
                comparisonValue9 = multiplyAddValue25 ? multiplyAddValue71 : intermediateValue40;
                comparisonValue8 = multiplyAddValue25 ? multiplyAddValue72 : intermediateValue39;
                comparisonValue7 = multiplyAddValue25 ? scalarValue31 : intermediateValue38;
                sumValue12 = scalarValue31 + 1u;
                intermediateValue38 = comparisonValue7;
                intermediateValue39 = comparisonValue8;
                intermediateValue40 = comparisonValue9;
                intermediateValue41 = comparisonValue10;
                scalarValue52 = quotientValue16;
                conditionValue6 = multiplyAddValue25;
                scalarValue31 = sumValue12;
                continue;
            }
            if (int(intermediateValue38) >= int(1u))
            {
                uint scalarValue = uint(int(RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.w));
                precise float productValue91 = productValue71 * RD_UNIFORM_INV_VIEW_ROW_1.x;
                precise float productValue92 = productValue71 * RD_UNIFORM_INV_VIEW_ROW_1.y;
                precise float productValue93 = productValue71 * RD_UNIFORM_INV_VIEW_ROW_1.z;
                float multiplyAddValue74 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue72, mad(RD_UNIFORM_INV_VIEW_ROW_0.x, productValue70, productValue91));
                float multiplyAddValue75 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue72, mad(RD_UNIFORM_INV_VIEW_ROW_0.y, productValue70, productValue92));
                float multiplyAddValue76 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue72, mad(RD_UNIFORM_INV_VIEW_ROW_0.z, productValue70, productValue93));
                float sumValue39 = rdSignedBitsToFloat(intermediateValue38 - 1u);
                float scalarValue53 = rdSignedBitsToFloat(intermediateValue38);
                float intermediateValue48;
                float intermediateValue49;
                float intermediateValue50;
                float intermediateValue51;
                intermediateValue48 = scalarValue53;
                intermediateValue49 = intermediateValue39;
                intermediateValue50 = intermediateValue40;
                intermediateValue51 = intermediateValue41;
                float comparisonValue11;
                float comparisonValue12;
                float comparisonValue13;
                float comparisonValue14;
                float comparisonValue15;
                float comparisonValue16;
                uint sumValue16;
                float scalarValue54 = sumValue39;
                float scalarValue55 = scalarValue53;
                uint scalarValue9 = 0u;
                [loop]
#elif RD_PLATFORM == RD_PLATFORM_SM50
                if (!((!conditionValue6) && (int(multiplyAddValue34) >= int(scalarValue31))))
                {
                    break;
                }
                float scalarValue32 = rdSignedBitsToFloat(scalarValue31);
                float multiplyAddValue36 = mad(quotientValue10, scalarValue32, productValue51);
                float multiplyAddValue37 = mad(quotientValue11, scalarValue32, productValue52);
                float multiplyAddValue38 = mad(multiplyAddValue33, scalarValue32, multiplyAddValue27);
                multiplyAddValue19 = (-(RD_UNIFORM_CAMERA_DATA.x + (scalarValue28 / (mad(multiplyAddValue38, sumValue10, scalarValue29) - RD_UNIFORM_CAMERA_DATA.x)))) / sumValue10;
                float sampledTextureValue7 = (-(RD_UNIFORM_CAMERA_DATA.x + (scalarValue28 / (mad(materialTexture0.Sample(textureSampler0, float2(multiplyAddValue36, multiplyAddValue37)).x, sumValue10, scalarValue29) - RD_UNIFORM_CAMERA_DATA.x)))) / sumValue10;
                multiplyAddValue20 = (multiplyAddValue19 >= sampledTextureValue7) && (mad(RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.w, sampledTextureValue7, sampledTextureValue7) >= scalarValue30);
                comparisonValue5 = multiplyAddValue20 ? multiplyAddValue36 : intermediateValue38;
                comparisonValue4 = multiplyAddValue20 ? multiplyAddValue37 : intermediateValue37;
                comparisonValue3 = multiplyAddValue20 ? multiplyAddValue38 : intermediateValue36;
                comparisonValue2 = multiplyAddValue20 ? scalarValue31 : intermediateValue35;
                sumValue4 = scalarValue31 + 1u;
                intermediateValue35 = comparisonValue2;
                intermediateValue36 = comparisonValue3;
                intermediateValue37 = comparisonValue4;
                intermediateValue38 = comparisonValue5;
                scalarValue30 = multiplyAddValue19;
                conditionValue6 = multiplyAddValue20;
                scalarValue31 = sumValue4;
                continue;
            }
            if (int(intermediateValue35) >= int(1u))
            {
                uint scalarValue = uint(int(RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.w));
                float multiplyAddValue39 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue50, mad(RD_UNIFORM_INV_VIEW_ROW_0.x, productValue48, productValue49 * RD_UNIFORM_INV_VIEW_ROW_1.x));
                float multiplyAddValue40 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue50, mad(RD_UNIFORM_INV_VIEW_ROW_0.y, productValue48, productValue49 * RD_UNIFORM_INV_VIEW_ROW_1.y));
                float multiplyAddValue41 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue50, mad(RD_UNIFORM_INV_VIEW_ROW_0.z, productValue48, productValue49 * RD_UNIFORM_INV_VIEW_ROW_1.z));
                float sumValue22 = rdSignedBitsToFloat(intermediateValue35 - 1u);
                float scalarValue33 = rdSignedBitsToFloat(intermediateValue35);
                float intermediateValue45;
                float intermediateValue46;
                float intermediateValue47;
                float intermediateValue48;
                intermediateValue45 = scalarValue33;
                intermediateValue46 = intermediateValue36;
                intermediateValue47 = intermediateValue37;
                intermediateValue48 = intermediateValue38;
                float comparisonValue6;
                float comparisonValue7;
                float comparisonValue8;
                float comparisonValue9;
                float comparisonValue10;
                float comparisonValue11;
                uint sumValue6;
                float scalarValue34 = sumValue22;
                float scalarValue35 = scalarValue33;
                uint scalarValue9 = 0u;
                [loop]
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float productValue27 = (RD_UNIFORM_CAMERA_DATA.x * RD_UNIFORM_CAMERA_DATA.y) * 2.0f;
                float sumValue9 = sumValue - RD_UNIFORM_CAMERA_DATA.x;
                float sumValue10 = RD_UNIFORM_CAMERA_DATA.y - RD_UNIFORM_CAMERA_DATA.x;
                uint intermediateValue18;
                float quotientValue5;
                uint intermediateValue19;
                float intermediateValue20;
                float intermediateValue21;
                float intermediateValue22;
                intermediateValue18 = 4294967295u;
                quotientValue5 = (sumValue1 - (productValue27 / ((multiplyAddValue6 * sumValue10) + sumValue9))) / sumValue10;
                intermediateValue19 = 1u;
                intermediateValue20 = 0.0f;
                intermediateValue21 = 0.0f;
                intermediateValue22 = 0.0f;
                uint comparisonValue3;
                float comparisonValue4;
                float comparisonValue5;
                float comparisonValue6;
#endif
                for (;;)
                {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
                    if (int(scalarValue) <= int(scalarValue9))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float scalarValue4 = float(int(intermediateValue19));
                    float productValue28 = (scalarValue4 * quotientValue3) + productValue24;
                    float productValue29 = (scalarValue4 * quotientValue4) + productValue25;
                    float productValue30 = (scalarValue4 * multiplyAddValue10) + multiplyAddValue6;
                    float quotientValue6 = (sumValue1 - (productValue27 / ((productValue30 * sumValue10) + sumValue9))) / sumValue10;
                    float sampledTextureValue2 = (sumValue1 - (productValue27 / ((gbufferDepthTexture.Sample(gbufferDepthSampler, float2(productValue28, productValue29)).x * sumValue10) + sumValue9))) / sumValue10;
                    bool comparisonValue18 = sampledTextureValue2 <= quotientValue6;
                    bool comparisonValue19 = quotientValue5 <= ((sampledTextureValue2 * RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.w) + sampledTextureValue2);
                    bool bitwiseValue2 = comparisonValue18 && comparisonValue19;
                    comparisonValue3 = bitwiseValue2 ? intermediateValue19 : intermediateValue18;
                    comparisonValue4 = bitwiseValue2 ? productValue28 : intermediateValue20;
                    comparisonValue5 = bitwiseValue2 ? productValue29 : intermediateValue21;
                    comparisonValue6 = bitwiseValue2 ? productValue30 : intermediateValue22;
                    if ((int(intermediateValue19) < int(comparisonValue17)) && (!(comparisonValue18 && comparisonValue19)))
                    {
                        intermediateValue18 = comparisonValue3;
                        quotientValue5 = quotientValue6;
                        intermediateValue19++;
                        intermediateValue20 = comparisonValue4;
                        intermediateValue21 = comparisonValue5;
                        intermediateValue22 = comparisonValue6;
                    }
                    else
#endif
                    {
                        break;
                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                    precise float sumValue40 = scalarValue55 + scalarValue54;
                    precise float productValue94 = sumValue40 * 0.5f;
                    float multiplyAddValue77 = mad(productValue88, productValue94, productValue78);
                    float multiplyAddValue78 = mad(productValue89, productValue94, productValue79);
                    float multiplyAddValue79 = mad(productValue90, productValue94, productValue80);
                    precise float sampledTextureValue13 = mad(materialTexture0.Sample(textureSampler0, float2(multiplyAddValue77, multiplyAddValue78)).x, sumValue35, scalarValue29) - RD_UNIFORM_CAMERA_DATA.x;
                    precise float quotientValue32 = scalarValue28 / sampledTextureValue13;
                    precise float sumValue41 = RD_UNIFORM_CAMERA_DATA.x + quotientValue32;
                    precise float quotientValue33 = (-sumValue41) / sumValue35;
                    precise float multiplyAddValue80 = mad(multiplyAddValue79, sumValue35, scalarValue29) - RD_UNIFORM_CAMERA_DATA.x;
                    precise float quotientValue34 = scalarValue28 / multiplyAddValue80;
                    precise float sumValue42 = RD_UNIFORM_CAMERA_DATA.x + quotientValue34;
                    precise float quotientValue35 = (-sumValue42) / sumValue35;
                    bool conditionValue9 = quotientValue33 < quotientValue35;
                    comparisonValue14 = conditionValue9 ? multiplyAddValue77 : intermediateValue51;
                    comparisonValue13 = conditionValue9 ? multiplyAddValue78 : intermediateValue50;
                    comparisonValue12 = conditionValue9 ? multiplyAddValue79 : intermediateValue49;
                    comparisonValue15 = conditionValue9 ? scalarValue54 : productValue94;
                    comparisonValue16 = conditionValue9 ? productValue94 : scalarValue55;
                    comparisonValue11 = conditionValue9 ? productValue94 : intermediateValue48;
                    sumValue16 = scalarValue9 + 1u;
                    intermediateValue48 = comparisonValue11;
                    intermediateValue49 = comparisonValue12;
                    intermediateValue50 = comparisonValue13;
                    intermediateValue51 = comparisonValue14;
                    scalarValue54 = comparisonValue15;
                    scalarValue55 = comparisonValue16;
                    scalarValue9 = sumValue16;
                    continue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    float productValue54 = (scalarValue35 + scalarValue34) * 0.5f;
                    float multiplyAddValue42 = mad(quotientValue10, productValue54, productValue51);
                    float multiplyAddValue43 = mad(quotientValue11, productValue54, productValue52);
                    float multiplyAddValue44 = mad(multiplyAddValue33, productValue54, multiplyAddValue27);
                    bool sampledTextureValue8 = ((-(RD_UNIFORM_CAMERA_DATA.x + (scalarValue28 / (mad(materialTexture0.Sample(textureSampler0, float2(multiplyAddValue42, multiplyAddValue43)).x, sumValue10, scalarValue29) - RD_UNIFORM_CAMERA_DATA.x)))) / sumValue10) < ((-(RD_UNIFORM_CAMERA_DATA.x + (scalarValue28 / (mad(multiplyAddValue44, sumValue10, scalarValue29) - RD_UNIFORM_CAMERA_DATA.x)))) / sumValue10);
                    comparisonValue9 = sampledTextureValue8 ? multiplyAddValue42 : intermediateValue48;
                    comparisonValue8 = sampledTextureValue8 ? multiplyAddValue43 : intermediateValue47;
                    comparisonValue7 = sampledTextureValue8 ? multiplyAddValue44 : intermediateValue46;
                    comparisonValue10 = sampledTextureValue8 ? scalarValue34 : productValue54;
                    comparisonValue11 = sampledTextureValue8 ? productValue54 : scalarValue35;
                    comparisonValue6 = sampledTextureValue8 ? productValue54 : intermediateValue45;
                    sumValue6 = scalarValue9 + 1u;
                    intermediateValue45 = comparisonValue6;
                    intermediateValue46 = comparisonValue7;
                    intermediateValue47 = comparisonValue8;
                    intermediateValue48 = comparisonValue9;
                    scalarValue34 = comparisonValue10;
                    scalarValue35 = comparisonValue11;
                    scalarValue9 = sumValue6;
                    continue;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                precise float quotientValue36 = intermediateValue48 / rdSignedBitsToFloat(comparisonValue32);
                precise float productValue95 = RD_UNIFORM_CAMERA_DATA.z * RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.x;
                precise float multiplyAddValue81 = log2(abs(mad(intermediateValue51, 2.0f, -1.0f))) * productValue95;
                precise float multiplyAddValue82 = log2(abs(mad(intermediateValue50, 2.0f, -1.0f))) * RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.y;
                precise float exponentialValue = 1.0f - exp2(multiplyAddValue81);
                precise float exponentialValue1 = 1.0f - exp2(multiplyAddValue82);
                precise float productValue96 = exponentialValue1 * exponentialValue;
                precise float sumValue43 = 1.0f - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z;
                precise float sumValue44 = quotientValue36 - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z;
                precise float quotientValue37 = 1.0f / sumValue43;
                precise float productValue97 = quotientValue37 * sumValue44;
                float clampedValue2 = clamp(productValue97, 0.0f, 1.0f);
                precise float productValue98 = clampedValue2 * clampedValue2;
                precise float sumValue45 = RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.x - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y;
                precise float sumValue46 = max(loadedBufferValue2, RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y) - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y;
                precise float quotientValue38 = sumValue46 / sumValue45;
                precise float sumValue47 = 1.0f - quotientValue38;
                float4 sampledTextureValue14 = materialTexture1.Sample(textureSampler1, float2(intermediateValue51, intermediateValue50));
                float scalarValue56 = sampledTextureValue14.x;
                float scalarValue57 = sampledTextureValue14.y;
                float scalarValue58 = abs(scalarValue57);
                precise float sumValue48 = 1.0f - abs(scalarValue56);
                precise float sumValue49 = 1.0f - scalarValue58;
                precise float sumValue50 = sumValue48 - scalarValue58;
                bool conditionValue10 = sumValue50 < 0.0f;
                precise float comparisonValue33 = ((scalarValue56 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue49;
                precise float comparisonValue34 = ((scalarValue57 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue48;
                float comparisonValue35 = conditionValue10 ? comparisonValue33 : scalarValue56;
                float comparisonValue36 = conditionValue10 ? comparisonValue34 : scalarValue57;
                float3 vectorValue13 = float3(comparisonValue35, comparisonValue36, sumValue50);
                float inverseLengthValue18 = rsqrt(rdDot3Precise(vectorValue13, vectorValue13));
                precise float productValue99 = inverseLengthValue18 * comparisonValue35;
                precise float productValue100 = inverseLengthValue18 * comparisonValue36;
                precise float productValue101 = inverseLengthValue18 * sumValue50;
                float3 vectorValue14 = float3(multiplyAddValue74, multiplyAddValue75, multiplyAddValue76);
                float inverseLengthValue19 = rsqrt(rdDot3Precise(vectorValue14, vectorValue14));
                precise float productValue102 = inverseLengthValue19 * multiplyAddValue74;
                precise float productValue103 = inverseLengthValue19 * multiplyAddValue75;
                precise float productValue104 = inverseLengthValue19 * multiplyAddValue76;
                precise float sumValue51 = 1.0f - rdDot3Precise(float3(productValue99, productValue100, productValue101), float3(productValue102, productValue103, productValue104));
                fragmentColor0.w = min(sumValue47, min(clamp(sumValue51, 0.0f, 1.0f), min(mad(-mad(clampedValue2, -2.0f, 3.0f), productValue98, 1.0f), productValue96)));
                fragmentColor0.x = intermediateValue51;
                fragmentColor0.y = intermediateValue50;
                fragmentColor0.z = intermediateValue49;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float clampedValue1 = clamp((1.0f / (1.0f - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z)) * ((intermediateValue45 / rdSignedBitsToFloat(multiplyAddValue34)) - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z), 0.0f, 1.0f);
                float4 sampledTextureValue9 = materialTexture1.Sample(textureSampler1, float2(intermediateValue48, intermediateValue47));
                float scalarValue36 = sampledTextureValue9.x;
                float scalarValue37 = sampledTextureValue9.y;
                float scalarValue38 = abs(scalarValue37);
                float sumValue23 = 1.0f - abs(scalarValue36);
                float sumValue24 = sumValue23 - scalarValue38;
                bool conditionValue7 = sumValue24 < 0.0f;
                float comparisonValue24 = conditionValue7 ? (((scalarValue36 >= 0.0f) ? 1.0f : (-1.0f)) * (1.0f - scalarValue38)) : scalarValue36;
                float comparisonValue25 = conditionValue7 ? (((scalarValue37 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue23) : scalarValue37;
                float3 vectorValue6 = float3(comparisonValue24, comparisonValue25, sumValue24);
                float inverseLengthValue12 = rsqrt(rdDot3Precise(vectorValue6, vectorValue6));
                float3 vectorValue7 = float3(multiplyAddValue39, multiplyAddValue40, multiplyAddValue41);
                float inverseLengthValue13 = rsqrt(rdDot3Precise(vectorValue7, vectorValue7));
                fragmentColor0.w = min(1.0f - ((max(loadedBufferValue1, RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y) - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y) / (RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.x - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y)), min(clamp(1.0f - rdDot3Precise(float3(inverseLengthValue12 * comparisonValue24, inverseLengthValue12 * comparisonValue25, inverseLengthValue12 * sumValue24), float3(inverseLengthValue13 * multiplyAddValue39, inverseLengthValue13 * multiplyAddValue40, inverseLengthValue13 * multiplyAddValue41)), 0.0f, 1.0f), min(mad(-mad(clampedValue1, -2.0f, 3.0f), clampedValue1 * clampedValue1, 1.0f), (1.0f - exp2(log2(abs(mad(intermediateValue47, 2.0f, -1.0f))) * RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.y)) * (1.0f - exp2(log2(abs(mad(intermediateValue48, 2.0f, -1.0f))) * (RD_UNIFORM_CAMERA_DATA.z * RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.x))))));
                fragmentColor0.x = intermediateValue48;
                fragmentColor0.y = intermediateValue47;
                fragmentColor0.z = intermediateValue46;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue14 = comparisonValue3;
                intermediateValue15 = comparisonValue4;
                intermediateValue16 = comparisonValue5;
                intermediateValue17 = comparisonValue6;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
                fragmentColor0.x = 0.0f;
                fragmentColor0.y = 0.0f;
                fragmentColor0.z = 0.0f;
                fragmentColor0.w = -1.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue14 = 4294967295u;
                intermediateValue15 = 0.0f;
                intermediateValue16 = 0.0f;
                intermediateValue17 = 0.0f;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue10;
            float branchMergedValue11;
            float branchMergedValue12;
            float branchMergedValue13;
            if (int(intermediateValue14) < int(1u))
            {
                branchMergedValue10 = 0.0f;
                branchMergedValue11 = 0.0f;
                branchMergedValue12 = -1.0f;
                branchMergedValue13 = 0.0f;
            }
            else
            {
                float scalarValue5 = float(int(intermediateValue14));
                float intermediateValue2;
                float intermediateValue4;
                float intermediateValue6;
                float intermediateValue25;
                if (int(scalarValue) > int(0u))
                {
                    float sumValue11 = float(int(intermediateValue14 + 4294967295u));
                    float intermediateValue26;
                    float intermediateValue27;
                    float intermediateValue28;
                    float intermediateValue29;
                    float intermediateValue35;
                    float intermediateValue37;
                    float scalarValue6 = sumValue11;
                    float scalarValue7 = scalarValue5;
                    float scalarValue8 = scalarValue5;
                    uint scalarValue9 = 0u;
                    float scalarValue10 = intermediateValue15;
                    float scalarValue11 = intermediateValue16;
                    float scalarValue12 = intermediateValue17;
                    float productValue34;
                    float productValue35;
                    float productValue36;
                    float productValue37;
                    bool sampledTextureValue4;
                    for (;;)
                    {
                        productValue34 = (scalarValue7 + scalarValue6) * 0.5f;
                        productValue35 = (productValue34 * quotientValue3) + productValue24;
                        productValue36 = (productValue34 * quotientValue4) + productValue25;
                        productValue37 = (productValue34 * multiplyAddValue10) + multiplyAddValue6;
                        float productValue31 = (RD_UNIFORM_CAMERA_DATA.x * RD_UNIFORM_CAMERA_DATA.y) * 2.0f;
                        float sumValue13 = RD_UNIFORM_CAMERA_DATA.y - RD_UNIFORM_CAMERA_DATA.x;
                        float sumValue14 = sumValue - RD_UNIFORM_CAMERA_DATA.x;
                        sampledTextureValue4 = ((sumValue1 - (productValue31 / ((productValue37 * sumValue13) + sumValue14))) / sumValue13) > ((sumValue1 - (productValue31 / ((gbufferDepthTexture.Sample(gbufferDepthSampler, float2(productValue35, productValue36)).x * sumValue13) + sumValue14))) / sumValue13);
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        float branchMergedValue4;
                        float branchMergedValue5;
                        if (sampledTextureValue4)
                        {
                            branchMergedValue = productValue37;
                            branchMergedValue1 = productValue36;
                            branchMergedValue2 = productValue35;
                            branchMergedValue3 = productValue34;
                            branchMergedValue4 = productValue34;
                            branchMergedValue5 = scalarValue6;
                        }
                        else
                        {
                            branchMergedValue = scalarValue12;
                            branchMergedValue1 = scalarValue11;
                            branchMergedValue2 = scalarValue10;
                            branchMergedValue3 = scalarValue8;
                            branchMergedValue4 = scalarValue7;
                            branchMergedValue5 = productValue34;
                        }
                        intermediateValue29 = branchMergedValue;
                        intermediateValue28 = branchMergedValue1;
                        intermediateValue27 = branchMergedValue2;
                        intermediateValue26 = branchMergedValue3;
                        intermediateValue37 = branchMergedValue4;
                        intermediateValue35 = branchMergedValue5;
                        uint sumValue15 = scalarValue9 + 1u;
                        if (sumValue15 == scalarValue)
                        {
                            break;
                        }
                        else
                        {
                            scalarValue6 = intermediateValue35;
                            scalarValue7 = intermediateValue37;
                            scalarValue8 = intermediateValue26;
                            scalarValue9 = sumValue15;
                            scalarValue10 = intermediateValue27;
                            scalarValue11 = intermediateValue28;
                            scalarValue12 = intermediateValue29;
                            continue;
                        }
                    }
                    intermediateValue25 = intermediateValue26;
                    intermediateValue2 = intermediateValue27;
                    intermediateValue4 = intermediateValue28;
                    intermediateValue6 = intermediateValue29;
                }
                else
                {
                    intermediateValue25 = scalarValue5;
                    intermediateValue2 = intermediateValue15;
                    intermediateValue4 = intermediateValue16;
                    intermediateValue6 = intermediateValue17;
                }
                float clampedValue = clamp(((intermediateValue25 / float(int(comparisonValue17))) - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z) / (1.0f - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z), 0.0f, 1.0f);
                float4 sampledTextureValue3 = gbufferNormalTexture.Sample(gbufferNormalSampler, float2(intermediateValue2, intermediateValue4));
                float scalarValue13 = sampledTextureValue3.x;
                float scalarValue14 = sampledTextureValue3.y;
                float sumValue17 = 1.0f - abs(scalarValue13);
                float scalarValue15 = abs(scalarValue14);
                float sumValue18 = sumValue17 - scalarValue15;
                bool conditionValue2 = sumValue18 < 0.0f;
                float comparisonValue20 = conditionValue2 ? ((1.0f - scalarValue15) * ((scalarValue13 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue13;
                float comparisonValue21 = conditionValue2 ? (((scalarValue14 < 0.0f) ? (-1.0f) : 1.0f) * sumValue17) : scalarValue14;
                float inverseLengthValue5 = rsqrt(dot(float3(comparisonValue20, comparisonValue21, sumValue18), float3(comparisonValue20, comparisonValue21, sumValue18)));
                float productValue32 = comparisonValue20 * inverseLengthValue5;
                float productValue33 = comparisonValue21 * inverseLengthValue5;
                float productValue38 = inverseLengthValue5 * sumValue18;
                float inverseLengthValue6 = rsqrt(dot(float3(productValue32, productValue33, productValue38), float3(productValue32, productValue33, productValue38)));
                float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13)));
                branchMergedValue10 = intermediateValue4;
                branchMergedValue11 = intermediateValue6;
                branchMergedValue12 = min(min(min((1.0f - exp2(log2(abs((intermediateValue4 * 2.0f) + (-1.0f))) * RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.y)) * (1.0f - exp2((RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.x * RD_UNIFORM_CAMERA_DATA.z) * log2(abs((intermediateValue2 * 2.0f) + (-1.0f))))), 1.0f - ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f)))), clamp(1.0f - dot(float3(inverseLengthValue6 * productValue32, productValue33 * inverseLengthValue6, inverseLengthValue6 * productValue38), float3(inverseLengthValue7 * multiplyAddValue11, inverseLengthValue7 * multiplyAddValue12, inverseLengthValue7 * multiplyAddValue13)), 0.0f, 1.0f)), 1.0f - ((max(loadedBufferValue, RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y) - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y) / (RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.x - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y)));
                branchMergedValue13 = intermediateValue2;
            }
            branchMergedValue6 = branchMergedValue10;
            branchMergedValue7 = branchMergedValue11;
            branchMergedValue8 = branchMergedValue12;
            branchMergedValue9 = branchMergedValue13;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            fragmentColor0.x = 0.0f;
            fragmentColor0.y = 0.0f;
            fragmentColor0.z = 0.0f;
            fragmentColor0.w = -1.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue6 = 0.0f;
            branchMergedValue7 = 0.0f;
            branchMergedValue8 = -1.0f;
            branchMergedValue9 = 0.0f;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue1 = branchMergedValue9;
        intermediateValue3 = branchMergedValue6;
        intermediateValue5 = branchMergedValue7;
        intermediateValue7 = branchMergedValue8;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = intermediateValue1;
    fragmentColor0.y = intermediateValue3;
    fragmentColor0.z = intermediateValue5;
    fragmentColor0.w = intermediateValue7;
#endif
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
