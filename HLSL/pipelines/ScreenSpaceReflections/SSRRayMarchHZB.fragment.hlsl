// ScreenSpaceReflections / SSRRayMarchHZB / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 6
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT2_7 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT3_8 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT4_9 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT_6 1
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
    precise float productValue33 = varyingTexCoord0.x * RD_UNIFORM_SCREEN_SIZE.x;
    precise float productValue34 = varyingTexCoord0.y * RD_UNIFORM_SCREEN_SIZE.y;
    precise float sumValue12 = floor(productValue33) + 0.5f;
    precise float sumValue13 = floor(productValue34) + 0.5f;
    precise float productValue35 = sumValue12 * RD_UNIFORM_SCREEN_SIZE.z;
    precise float productValue36 = sumValue13 * RD_UNIFORM_SCREEN_SIZE.w;
    uint intermediateValue12;
    rdTextureSize(materialTexture2, 0u, intermediateValue12);
    bool conditionValue2 = intermediateValue12 > 0u;
    uint unusedTextureMipCount103;
    uint2 vectorValue1 = rdTextureSize(materialTexture2, 0u, unusedTextureMipCount103);
    uint scalarValue17 = vectorValue1.x;
    precise float comparisonValue7 = productValue35 * rdUnsignedToFloat(conditionValue2 ? scalarValue17 : 0u);
    precise float comparisonValue8 = productValue36 * rdUnsignedToFloat(conditionValue2 ? vectorValue1.y : 0u);
    precise float loadedBufferValue2 = rdUnsignedToFloat((materialTexture2.Load(int3(uint2(uint(int(comparisonValue7)), uint(int(comparisonValue8))), 0u)).x >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    float scalarValue18 = ddy(productValue35);
    float scalarValue19 = ddx(productValue36);
    float scalarValue20 = ddx(productValue35);
    float scalarValue21 = ddy(productValue36);
    if (RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.x < loadedBufferValue2)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float productValue74 = (floor(varyingTexCoord0.x * RD_UNIFORM_SCREEN_SIZE.x) + 0.5f) * RD_UNIFORM_SCREEN_SIZE.z;
    float productValue75 = (floor(varyingTexCoord0.y * RD_UNIFORM_SCREEN_SIZE.y) + 0.5f) * RD_UNIFORM_SCREEN_SIZE.w;
    uint intermediateValue12;
    rdTextureSize(materialTexture2, 0u, intermediateValue12);
    bool conditionValue2 = intermediateValue12 > 0u;
    uint unusedTextureMipCount103;
    uint2 vectorValue1 = rdTextureSize(materialTexture2, 0u, unusedTextureMipCount103);
    uint scalarValue17 = vectorValue1.x;
    float loadedBufferValue4 = rdUnsignedToFloat(rdBitfieldUExtract(materialTexture2.Load(int3(uint2(uint(int(productValue74 * rdUnsignedToFloat(conditionValue2 ? scalarValue17 : 0u))), uint(int(productValue75 * rdUnsignedToFloat(conditionValue2 ? vectorValue1.y : 0u)))), 0u)).x, 8u, 8u)) * 0.0039215688593685626983642578125f;
    float scalarValue41 = ddy_coarse(productValue74);
    float scalarValue42 = ddx_coarse(productValue75);
    float scalarValue43 = ddy_coarse(productValue75);
    float scalarValue44 = ddx_coarse(productValue74);
    if (RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.x < loadedBufferValue4)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (floor(RD_UNIFORM_SCREEN_SIZE.x * varyingTexCoord0.x) + 0.5f) * RD_UNIFORM_SCREEN_SIZE.z;
    float productValue1 = (floor(RD_UNIFORM_SCREEN_SIZE.y * varyingTexCoord0.y) + 0.5f) * RD_UNIFORM_SCREEN_SIZE.w;
    uint unusedTextureMipCount128;
    uint2 vectorValue = rdTextureSize(gbufferRoughnessTexture, 0u, unusedTextureMipCount128);
    float loadedBufferValue = float((gbufferRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue.x)))))) * productValue)), uint(int(float(int(uint(int(float(int(vectorValue.y)))))) * productValue1))), 0u)).x >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    float intermediateValue1;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue5;
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
        intermediateValue2 = 0.0f;
        intermediateValue3 = 0.0f;
        intermediateValue5 = -1.0f;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        float4 sampledTextureValue3 = materialTexture0.SampleGrad(textureSampler0, float2(productValue35, productValue36), float2(scalarValue20, scalarValue19), float2(scalarValue18, scalarValue21));
        float scalarValue22 = sampledTextureValue3.x;
        if (scalarValue22 != 1.0f)
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float4 sampledTextureValue6 = materialTexture0.SampleGrad(textureSampler0, float2(productValue74, productValue75), float2(scalarValue44, scalarValue42), float2(scalarValue41, scalarValue43));
        float scalarValue45 = sampledTextureValue6.x;
        if (scalarValue45 != 1.0f)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint scalarValue = uint(int(RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.x));
        float4 sampledTextureValue = gbufferDepthTexture.Sample(gbufferDepthSampler, float2(productValue, productValue1));
        float scalarValue1 = sampledTextureValue.x;
        float branchMergedValue7;
        float branchMergedValue8;
        float branchMergedValue9;
        float branchMergedValue10;
        if (scalarValue1 == 1.0f)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            uint scalarValue = uint(int(RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.x));
            precise float productValue37 = varyingTexCoord1.x * RD_UNIFORM_INV_PROJ_ROW_0.x;
            precise float productValue38 = varyingTexCoord1.y * RD_UNIFORM_INV_PROJ_ROW_1.y;
            float multiplyAddValue10 = mad(scalarValue22, RD_UNIFORM_INV_PROJ_ROW_2.w, RD_UNIFORM_INV_PROJ_ROW_3.w);
            precise float quotientValue8 = productValue37 / multiplyAddValue10;
            precise float quotientValue9 = productValue38 / multiplyAddValue10;
            precise float quotientValue10 = RD_UNIFORM_INV_PROJ_ROW_3.z / multiplyAddValue10;
            float4 sampledTextureValue4 = materialTexture1.SampleGrad(textureSampler1, float2(productValue35, productValue36), float2(scalarValue20, scalarValue19), float2(scalarValue18, scalarValue21));
            float scalarValue23 = sampledTextureValue4.x;
            float scalarValue24 = sampledTextureValue4.y;
            float scalarValue25 = abs(scalarValue24);
            precise float sumValue14 = 1.0f - abs(scalarValue23);
            precise float sumValue15 = 1.0f - scalarValue25;
            precise float sumValue16 = sumValue14 - scalarValue25;
            bool conditionValue3 = sumValue16 < 0.0f;
            precise float multiplyAddValue11 = sumValue15 * mad(float(scalarValue23 >= 0.0f), 2.0f, -1.0f);
            precise float multiplyAddValue12 = sumValue14 * mad(float(scalarValue24 >= 0.0f), 2.0f, -1.0f);
            float comparisonValue9 = conditionValue3 ? multiplyAddValue11 : scalarValue23;
            float comparisonValue10 = conditionValue3 ? multiplyAddValue12 : scalarValue24;
            float3 vectorValue2 = float3(comparisonValue9, comparisonValue10, sumValue16);
            float inverseLengthValue8 = rsqrt(rdDot3Precise(vectorValue2, vectorValue2));
            precise float productValue39 = inverseLengthValue8 * comparisonValue9;
            precise float productValue40 = inverseLengthValue8 * comparisonValue10;
            precise float productValue41 = inverseLengthValue8 * sumValue16;
            float3 vectorValue3 = float3(productValue39, productValue40, productValue41);
            float scalarValue26 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_0.xyz), vectorValue3);
            float scalarValue27 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_1.xyz), vectorValue3);
            float scalarValue28 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_2.xyz), vectorValue3);
            float3 vectorValue4 = float3(scalarValue26, scalarValue27, scalarValue28);
            float inverseLengthValue9 = rsqrt(rdDot3Precise(vectorValue4, vectorValue4));
            precise float productValue42 = inverseLengthValue9 * scalarValue26;
            precise float productValue43 = inverseLengthValue9 * scalarValue27;
            precise float productValue44 = inverseLengthValue9 * scalarValue28;
            float3 vectorValue5 = float3(quotientValue8, quotientValue9, quotientValue10);
            float inverseLengthValue10 = rsqrt(rdDot3Precise(vectorValue5, vectorValue5));
            precise float productValue45 = inverseLengthValue10 * quotientValue8;
            precise float productValue46 = inverseLengthValue10 * quotientValue9;
            precise float productValue47 = inverseLengthValue10 * quotientValue10;
            float scalarValue29 = rdDot3Precise(float3(productValue45, productValue46, productValue47), float3(productValue42, productValue43, productValue44));
            precise float sumValue17 = scalarValue29 + scalarValue29;
            float scalarValue30 = -sumValue17;
            float multiplyAddValue13 = mad(productValue42, scalarValue30, productValue45);
            float multiplyAddValue14 = mad(productValue43, scalarValue30, productValue46);
            float multiplyAddValue15 = mad(productValue44, scalarValue30, productValue47);
            float3 vectorValue6 = float3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15);
            float inverseLengthValue11 = rsqrt(rdDot3Precise(vectorValue6, vectorValue6));
            precise float productValue48 = inverseLengthValue11 * multiplyAddValue13;
            precise float productValue49 = inverseLengthValue11 * multiplyAddValue14;
            precise float productValue50 = inverseLengthValue11 * multiplyAddValue15;
            float multiplyAddValue17 = mad(productValue50, 1000.0f, quotientValue10);
            bool conditionValue4 = RD_UNIFORM_CAMERA_DATA.x < multiplyAddValue17;
            precise float sumValue18 = RD_UNIFORM_CAMERA_DATA.x - quotientValue10;
            precise float quotientValue11 = sumValue18 / productValue50;
            float multiplyAddValue18 = conditionValue4 ? mad(quotientValue11, productValue48, quotientValue8) : mad(productValue48, 1000.0f, quotientValue8);
            float multiplyAddValue19 = conditionValue4 ? mad(quotientValue11, productValue49, quotientValue9) : mad(productValue49, 1000.0f, quotientValue9);
            float multiplyAddValue21 = conditionValue4 ? mad(quotientValue11, productValue50, quotientValue10) : multiplyAddValue17;
            precise float productValue51 = multiplyAddValue19 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
            precise float productValue52 = multiplyAddValue19 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
            precise float productValue53 = multiplyAddValue19 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
            precise float productValue54 = multiplyAddValue19 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
            precise float multiplyAddValue22 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue21, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue18, productValue51)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
            precise float multiplyAddValue23 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue21, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue18, productValue52)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
            precise float multiplyAddValue24 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue21, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue18, productValue53)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
            precise float multiplyAddValue25 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue21, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue18, productValue54)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
            precise float quotientValue12 = multiplyAddValue22 / multiplyAddValue25;
            precise float quotientValue13 = multiplyAddValue23 / multiplyAddValue25;
            precise float quotientValue14 = multiplyAddValue24 / multiplyAddValue25;
            precise float productValue55 = quotientValue13 * 0.5f;
            precise float productValue56 = quotientValue12 * 0.5f;
            float multiplyAddValue26 = mad(varyingTexCoord1.y, -0.5f, 0.5f);
            float multiplyAddValue27 = mad(varyingTexCoord1.x, 0.5f, 0.5f);
            precise float multiplyAddValue28 = mad(productValue55, -1.0f, 0.5f) - multiplyAddValue26;
            precise float multiplyAddValue29 = mad(productValue56, 1.0f, 0.5f) - multiplyAddValue27;
            precise float productValue57 = multiplyAddValue28 * RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y;
            precise float productValue58 = multiplyAddValue29 * RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x;
            precise float sumValue19 = quotientValue14 - scalarValue22;
            float2 vectorValue7 = float2(productValue57, productValue58);
            precise float nonlinearValue1 = RD_UNIFORM_SCREEN_SPACE_RAY_OFFSET.x / sqrt(rdDot2Precise(vectorValue7, vectorValue7));
            precise float productValue59 = productValue58 * nonlinearValue1;
            precise float productValue60 = productValue57 * nonlinearValue1;
            float multiplyAddValue30 = mad(multiplyAddValue27, RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x, productValue59);
            float multiplyAddValue31 = mad(multiplyAddValue26, RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y, productValue60);
            bool conditionValue5 = productValue58 > 0.0f;
            bool conditionValue6 = productValue57 > 0.0f;
            uint scalarValue31 = uint(int(RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x));
            uint scalarValue32 = uint(int(RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y));
            uint scalarValue33 = uint(int(RD_UNIFORM_HI_ZMIP_COUNT.x));
            float multiplyAddValue20;
            uint intermediateValue50;
            uint intermediateValue52;
            uint intermediateValue54;
            multiplyAddValue20 = mad(sumValue19, nonlinearValue1, scalarValue22);
            intermediateValue50 = uint(int(floor(multiplyAddValue31)));
            intermediateValue52 = uint(int(floor(multiplyAddValue30)));
            intermediateValue54 = 0u;
            float intermediateValue43;
            float intermediateValue45;
            float intermediateValue47;
            uint intermediateValue49;
            uint intermediateValue51;
            uint intermediateValue53;
            uint intermediateValue55;
            bool intermediateValue62;
            float scalarValue34 = multiplyAddValue31;
            float scalarValue35 = multiplyAddValue30;
            uint scalarValue12 = 0u;
            [loop]
            for (;;)
            {
                if (int(scalarValue) <= int(intermediateValue54))
                {
                    intermediateValue62 = true;
                    break;
                }
                uint bitwiseValue6 = scalarValue12 & 31u;
                uint bitwiseValue7 = uint(int(intermediateValue52) >> int(bitwiseValue6));
                uint bitwiseValue8 = uint(int(intermediateValue50) >> int(bitwiseValue6));
                float4 loadedBufferValue3 = materialTexture3.Load(int3(uint2(bitwiseValue7, bitwiseValue8), scalarValue12));
                precise float sumValue20 = 1.0f - loadedBufferValue3.x;
                precise float sumValue21 = 1.0f - loadedBufferValue3.y;
                uint bitwiseValue9 = bitwiseValue7 << bitwiseValue6;
                uint bitwiseValue10 = bitwiseValue8 << bitwiseValue6;
                uint bitwiseValue11 = 1u << bitwiseValue6;
                uint sumValue22 = bitwiseValue11 + bitwiseValue9;
                uint sumValue23 = bitwiseValue10 + bitwiseValue11;
                bool conditionValue7 = !conditionValue5;
                bool conditionValue8 = !conditionValue6;
                uint sumValue24 = bitwiseValue9 - 1u;
                uint sumValue25 = bitwiseValue10 - 1u;
                float comparisonValue11 = rdSignedBitsToFloat(conditionValue5 ? sumValue22 : bitwiseValue9);
                float comparisonValue12 = rdSignedBitsToFloat(conditionValue6 ? sumValue23 : bitwiseValue10);
                precise float sumValue26 = comparisonValue11 - scalarValue35;
                precise float sumValue28 = comparisonValue12 - scalarValue34;
                precise float quotientValue15 = sumValue26 / productValue58;
                precise float quotientValue16 = sumValue28 / productValue57;
                bool conditionValue9 = quotientValue15 < quotientValue16;
                float multiplyAddValue32 = mad(quotientValue15, productValue57, scalarValue34);
                float multiplyAddValue33 = mad(quotientValue16, productValue58, scalarValue35);
                uint scalarValue36 = uint(int(floor(multiplyAddValue32)));
                uint scalarValue37 = uint(int(floor(multiplyAddValue33)));
                bool conditionValue10 = !conditionValue9;
                float multiplyAddValue34 = conditionValue9 ? mad(quotientValue15, sumValue19, multiplyAddValue20) : mad(quotientValue16, sumValue19, multiplyAddValue20);
                if ((sumValue21 >= min(multiplyAddValue20, multiplyAddValue34)) && ((int(intermediateValue54) > int(0u)) && (max(multiplyAddValue20, multiplyAddValue34) >= sumValue20)))
                {
                    uint sumValue27;
                    if (scalarValue12 == 0u)
                    {
                        intermediateValue62 = false;
                        break;
                    }
                    else
                    {
                        sumValue27 = scalarValue12 - 1u;
                    }
                    intermediateValue55 = intermediateValue54;
                    intermediateValue53 = intermediateValue52;
                    intermediateValue51 = intermediateValue50;
                    intermediateValue49 = sumValue27;
                    intermediateValue47 = scalarValue35;
                    intermediateValue45 = scalarValue34;
                    intermediateValue43 = multiplyAddValue20;
                }
                else
                {
                    if ((((((int(scalarValue37) < int(0u)) && conditionValue10) || (conditionValue9 && (((int(sumValue22) < int(0u)) && conditionValue5) || ((int(sumValue24) < int(0u)) && conditionValue7)))) || (((int(scalarValue36) < int(0u)) && conditionValue9) || ((((int(sumValue25) < int(0u)) && conditionValue8) || ((int(sumValue23) < int(0u)) && conditionValue6)) && conditionValue10))) || (((((int(sumValue22) >= int(scalarValue31)) && conditionValue5) || (conditionValue7 && (int(sumValue24) >= int(scalarValue31)))) && conditionValue9) || ((int(scalarValue31) <= int(scalarValue37)) && conditionValue10))) || (((int(scalarValue36) >= int(scalarValue32)) && conditionValue9) || (((conditionValue8 && (int(sumValue25) >= int(scalarValue32))) || ((int(sumValue23) >= int(scalarValue32)) && conditionValue6)) && conditionValue10)))
                    {
                        intermediateValue62 = true;
                        break;
                    }
                    intermediateValue55 = intermediateValue54 + 1u;
                    intermediateValue53 = conditionValue9 ? (conditionValue5 ? sumValue22 : sumValue24) : scalarValue37;
                    intermediateValue51 = conditionValue9 ? scalarValue36 : (conditionValue6 ? sumValue23 : sumValue25);
                    intermediateValue49 = uint(int(scalarValue33) > int(scalarValue12 + 1u)) + scalarValue12;
                    intermediateValue47 = conditionValue9 ? comparisonValue11 : multiplyAddValue33;
                    intermediateValue45 = conditionValue9 ? multiplyAddValue32 : comparisonValue12;
                    intermediateValue43 = multiplyAddValue34;
                }
                multiplyAddValue20 = intermediateValue43;
                scalarValue34 = intermediateValue45;
                scalarValue35 = intermediateValue47;
                scalarValue12 = intermediateValue49;
                intermediateValue50 = intermediateValue51;
                intermediateValue52 = intermediateValue53;
                intermediateValue54 = intermediateValue55;
                continue;
            }
            if (!intermediateValue62)
            {
                precise float sumValue29 = rdSignedBitsToFloat(intermediateValue52) + 0.5f;
                precise float sumValue30 = rdSignedBitsToFloat(intermediateValue50) + 0.5f;
                precise float quotientValue17 = sumValue29 / RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x;
                precise float quotientValue18 = sumValue30 / RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y;
                precise float productValue61 = productValue49 * RD_UNIFORM_INV_VIEW_ROW_1.x;
                precise float productValue62 = productValue49 * RD_UNIFORM_INV_VIEW_ROW_1.y;
                precise float productValue63 = productValue49 * RD_UNIFORM_INV_VIEW_ROW_1.z;
                float multiplyAddValue35 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue50, mad(RD_UNIFORM_INV_VIEW_ROW_0.x, productValue48, productValue61));
                float multiplyAddValue36 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue50, mad(RD_UNIFORM_INV_VIEW_ROW_0.y, productValue48, productValue62));
                float multiplyAddValue37 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue50, mad(RD_UNIFORM_INV_VIEW_ROW_0.z, productValue48, productValue63));
                precise float quotientValue19 = rdSignedBitsToFloat(intermediateValue54) / trunc(RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.x);
                precise float productValue64 = RD_UNIFORM_CAMERA_DATA.z * RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.x;
                precise float multiplyAddValue38 = log2(abs(mad(quotientValue17, 2.0f, -1.0f))) * productValue64;
                precise float multiplyAddValue39 = log2(abs(mad(quotientValue18, 2.0f, -1.0f))) * RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.y;
                precise float exponentialValue = 1.0f - exp2(multiplyAddValue38);
                precise float exponentialValue1 = 1.0f - exp2(multiplyAddValue39);
                precise float productValue65 = exponentialValue1 * exponentialValue;
                precise float sumValue31 = 1.0f - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z;
                precise float sumValue32 = quotientValue19 - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z;
                precise float quotientValue20 = 1.0f / sumValue31;
                precise float productValue66 = quotientValue20 * sumValue32;
                float clampedValue1 = clamp(productValue66, 0.0f, 1.0f);
                precise float productValue67 = clampedValue1 * clampedValue1;
                precise float sumValue33 = RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.x - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y;
                precise float sumValue34 = max(loadedBufferValue2, RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y) - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y;
                precise float quotientValue21 = sumValue34 / sumValue33;
                precise float sumValue35 = 1.0f - quotientValue21;
                float4 sampledTextureValue5 = materialTexture1.Sample(textureSampler1, float2(quotientValue17, quotientValue18));
                float scalarValue38 = sampledTextureValue5.x;
                float scalarValue39 = sampledTextureValue5.y;
                float scalarValue40 = abs(scalarValue39);
                precise float sumValue36 = 1.0f - abs(scalarValue38);
                precise float sumValue37 = 1.0f - scalarValue40;
                precise float sumValue38 = sumValue36 - scalarValue40;
                bool conditionValue11 = sumValue38 < 0.0f;
                precise float multiplyAddValue40 = mad(float(scalarValue38 >= 0.0f), 2.0f, -1.0f) * sumValue37;
                precise float multiplyAddValue41 = mad(float(scalarValue39 >= 0.0f), 2.0f, -1.0f) * sumValue36;
                float comparisonValue13 = conditionValue11 ? multiplyAddValue40 : scalarValue38;
                float comparisonValue14 = conditionValue11 ? multiplyAddValue41 : scalarValue39;
                float3 vectorValue8 = float3(comparisonValue13, comparisonValue14, sumValue38);
                float inverseLengthValue12 = rsqrt(rdDot3Precise(vectorValue8, vectorValue8));
                precise float productValue68 = inverseLengthValue12 * comparisonValue13;
                precise float productValue69 = inverseLengthValue12 * comparisonValue14;
                precise float productValue70 = inverseLengthValue12 * sumValue38;
                float3 vectorValue9 = float3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37);
                float inverseLengthValue13 = rsqrt(rdDot3Precise(vectorValue9, vectorValue9));
                precise float productValue71 = multiplyAddValue35 * inverseLengthValue13;
                precise float productValue72 = multiplyAddValue36 * inverseLengthValue13;
                precise float productValue73 = multiplyAddValue37 * inverseLengthValue13;
                precise float sumValue39 = 1.0f - rdDot3Precise(float3(productValue68, productValue69, productValue70), float3(productValue71, productValue72, productValue73));
                fragmentColor0.w = min(sumValue35, min(clamp(sumValue39, 0.0f, 1.0f), min(mad(-mad(clampedValue1, -2.0f, 3.0f), productValue67, 1.0f), productValue65)));
                fragmentColor0.x = quotientValue17;
                fragmentColor0.y = quotientValue18;
                fragmentColor0.z = multiplyAddValue20;
            }
            else
            {
                fragmentColor0.x = 0.0f;
                fragmentColor0.y = 0.0f;
                fragmentColor0.z = 0.0f;
                fragmentColor0.w = -1.0f;
            }
#elif RD_PLATFORM == RD_PLATFORM_SM50
            uint scalarValue = uint(int(RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.x));
            float multiplyAddValue42 = mad(scalarValue45, RD_UNIFORM_INV_PROJ_ROW_2.w, RD_UNIFORM_INV_PROJ_ROW_3.w);
            float quotientValue22 = (varyingTexCoord1.x * RD_UNIFORM_INV_PROJ_ROW_0.x) / multiplyAddValue42;
            float quotientValue23 = (varyingTexCoord1.y * RD_UNIFORM_INV_PROJ_ROW_1.y) / multiplyAddValue42;
            float quotientValue24 = RD_UNIFORM_INV_PROJ_ROW_3.z / multiplyAddValue42;
            float4 sampledTextureValue7 = materialTexture1.SampleGrad(textureSampler1, float2(productValue74, productValue75), float2(scalarValue44, scalarValue42), float2(scalarValue41, scalarValue43));
            float scalarValue46 = sampledTextureValue7.x;
            float scalarValue47 = sampledTextureValue7.y;
            float scalarValue48 = abs(scalarValue47);
            float sumValue40 = 1.0f - abs(scalarValue46);
            float sumValue41 = sumValue40 - scalarValue48;
            bool conditionValue12 = sumValue41 < 0.0f;
            float sumValue42 = 2.0f - 1.0f;
            float comparisonValue15 = conditionValue12 ? ((1.0f - scalarValue48) * ((scalarValue46 >= 0.0f) ? sumValue42 : (-1.0f))) : scalarValue46;
            float comparisonValue16 = conditionValue12 ? (sumValue40 * ((scalarValue47 >= 0.0f) ? sumValue42 : (-1.0f))) : scalarValue47;
            float3 vectorValue10 = float3(comparisonValue15, comparisonValue16, sumValue41);
            float inverseLengthValue14 = rsqrt(rdDot3Precise(vectorValue10, vectorValue10));
            float3 productValue76 = float3(inverseLengthValue14 * comparisonValue15, inverseLengthValue14 * comparisonValue16, inverseLengthValue14 * sumValue41);
            float scalarValue49 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_0.xyz), productValue76);
            float scalarValue50 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_1.xyz), productValue76);
            float scalarValue51 = rdDot3Precise(float3(RD_UNIFORM_INV_VIEW_ROW_2.xyz), productValue76);
            float3 vectorValue11 = float3(scalarValue49, scalarValue50, scalarValue51);
            float inverseLengthValue15 = rsqrt(rdDot3Precise(vectorValue11, vectorValue11));
            float productValue77 = inverseLengthValue15 * scalarValue49;
            float productValue78 = inverseLengthValue15 * scalarValue50;
            float productValue79 = inverseLengthValue15 * scalarValue51;
            float3 vectorValue12 = float3(quotientValue22, quotientValue23, quotientValue24);
            float inverseLengthValue16 = rsqrt(rdDot3Precise(vectorValue12, vectorValue12));
            float productValue80 = inverseLengthValue16 * quotientValue22;
            float productValue81 = inverseLengthValue16 * quotientValue23;
            float productValue82 = inverseLengthValue16 * quotientValue24;
            float scalarValue52 = rdDot3Precise(float3(productValue80, productValue81, productValue82), float3(productValue77, productValue78, productValue79));
            float sumValue43 = -(scalarValue52 + scalarValue52);
            float multiplyAddValue43 = mad(productValue77, sumValue43, productValue80);
            float multiplyAddValue44 = mad(productValue78, sumValue43, productValue81);
            float multiplyAddValue45 = mad(productValue79, sumValue43, productValue82);
            float3 vectorValue13 = float3(multiplyAddValue43, multiplyAddValue44, multiplyAddValue45);
            float inverseLengthValue17 = rsqrt(rdDot3Precise(vectorValue13, vectorValue13));
            float productValue83 = inverseLengthValue17 * multiplyAddValue43;
            float productValue84 = inverseLengthValue17 * multiplyAddValue44;
            float productValue85 = inverseLengthValue17 * multiplyAddValue45;
            float multiplyAddValue46 = mad(productValue85, 1000.0f, quotientValue24);
            bool conditionValue13 = RD_UNIFORM_CAMERA_DATA.x < multiplyAddValue46;
            float quotientValue25 = (RD_UNIFORM_CAMERA_DATA.x - quotientValue24) / productValue85;
            float multiplyAddValue47 = conditionValue13 ? mad(quotientValue25, productValue83, quotientValue22) : mad(productValue83, 1000.0f, quotientValue22);
            float multiplyAddValue48 = conditionValue13 ? mad(quotientValue25, productValue84, quotientValue23) : mad(productValue84, 1000.0f, quotientValue23);
            float multiplyAddValue49 = conditionValue13 ? mad(quotientValue25, productValue85, quotientValue24) : multiplyAddValue46;
            float multiplyAddValue50 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue49, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue47, multiplyAddValue48 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
            float multiplyAddValue26 = mad(varyingTexCoord1.y, -0.5f, 0.5f);
            float multiplyAddValue27 = mad(varyingTexCoord1.x, 0.5f, 0.5f);
            float multiplyAddValue51 = ((0.5f - (((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue49, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue47, multiplyAddValue48 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue50) * 0.5f)) - multiplyAddValue26) * RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y;
            float multiplyAddValue52 = (((((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue49, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue47, multiplyAddValue48 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue50) * 0.5f) + 0.5f) - multiplyAddValue27) * RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x;
            float multiplyAddValue53 = ((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue49, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue47, multiplyAddValue48 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue50) - scalarValue45;
            float2 vectorValue14 = float2(multiplyAddValue51, multiplyAddValue52);
            float nonlinearValue2 = RD_UNIFORM_SCREEN_SPACE_RAY_OFFSET.x / sqrt(rdDot2Precise(vectorValue14, vectorValue14));
            float multiplyAddValue54 = mad(multiplyAddValue27, RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x, multiplyAddValue52 * nonlinearValue2);
            float multiplyAddValue55 = mad(multiplyAddValue26, RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y, multiplyAddValue51 * nonlinearValue2);
            bool conditionValue14 = multiplyAddValue52 > 0.0f;
            bool conditionValue15 = multiplyAddValue51 > 0.0f;
            uint scalarValue31 = uint(int(RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x));
            uint scalarValue32 = uint(int(RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y));
            uint scalarValue33 = uint(int(RD_UNIFORM_HI_ZMIP_COUNT.x));
            float multiplyAddValue16;
            uint intermediateValue48;
            uint intermediateValue50;
            uint intermediateValue52;
            multiplyAddValue16 = mad(multiplyAddValue53, nonlinearValue2, scalarValue45);
            intermediateValue48 = uint(int(floor(multiplyAddValue55)));
            intermediateValue50 = uint(int(floor(multiplyAddValue54)));
            intermediateValue52 = 0u;
            float intermediateValue41;
            float intermediateValue43;
            float intermediateValue45;
            uint intermediateValue47;
            uint intermediateValue49;
            uint intermediateValue51;
            uint intermediateValue53;
            bool intermediateValue60;
            float scalarValue53 = multiplyAddValue55;
            float scalarValue54 = multiplyAddValue54;
            uint scalarValue12 = 0u;
            for (;;)
            {
                if (int(scalarValue) <= int(intermediateValue52))
                {
                    intermediateValue60 = true;
                    break;
                }
                uint bitwiseValue6 = scalarValue12 & 31u;
                float4 loadedBufferValue5 = materialTexture3.Load(int3(uint2(uint(int(intermediateValue50) >> int(bitwiseValue6)), uint(int(intermediateValue48) >> int(bitwiseValue6))), scalarValue12));
                uint scalarValue55 = rdBitfieldInsert(intermediateValue50, 0u, 0u, bitwiseValue6);
                uint scalarValue56 = rdBitfieldInsert(intermediateValue48, 0u, 0u, bitwiseValue6);
                uint bitwiseValue11 = 1u << bitwiseValue6;
                uint sumValue44 = scalarValue55 + bitwiseValue11;
                uint sumValue45 = bitwiseValue11 + scalarValue56;
                uint comparisonValue17 = conditionValue14 ? sumValue44 : (scalarValue55 - 1u);
                uint comparisonValue18 = conditionValue15 ? sumValue45 : (scalarValue56 - 1u);
                float comparisonValue19 = rdSignedBitsToFloat(conditionValue14 ? sumValue44 : scalarValue55);
                float comparisonValue20 = rdSignedBitsToFloat(conditionValue15 ? sumValue45 : scalarValue56);
                float quotientValue26 = (comparisonValue19 - scalarValue54) / multiplyAddValue52;
                float quotientValue27 = (comparisonValue20 - scalarValue53) / multiplyAddValue51;
                bool conditionValue16 = quotientValue26 < quotientValue27;
                float multiplyAddValue56 = mad(quotientValue26, multiplyAddValue51, scalarValue53);
                float multiplyAddValue57 = mad(quotientValue27, multiplyAddValue52, scalarValue54);
                uint scalarValue57 = uint(int(floor(multiplyAddValue56)));
                uint scalarValue58 = uint(int(floor(multiplyAddValue57)));
                bool conditionValue17 = !conditionValue16;
                float multiplyAddValue58 = conditionValue16 ? mad(quotientValue26, multiplyAddValue53, multiplyAddValue16) : mad(quotientValue27, multiplyAddValue53, multiplyAddValue16);
                if (((1.0f - loadedBufferValue5.y) >= min(multiplyAddValue16, multiplyAddValue58)) && ((max(multiplyAddValue16, multiplyAddValue58) >= (1.0f - loadedBufferValue5.x)) && (int(intermediateValue52) > int(0u))))
                {
                    uint sumValue8;
                    if (scalarValue12 == 0u)
                    {
                        intermediateValue60 = false;
                        break;
                    }
                    else
                    {
                        sumValue8 = scalarValue12 - 1u;
                    }
                    intermediateValue53 = intermediateValue52;
                    intermediateValue51 = intermediateValue50;
                    intermediateValue49 = intermediateValue48;
                    intermediateValue47 = sumValue8;
                    intermediateValue45 = scalarValue54;
                    intermediateValue43 = scalarValue53;
                    intermediateValue41 = multiplyAddValue16;
                }
                else
                {
                    if (((conditionValue17 && (int(scalarValue32) <= int(comparisonValue18))) || (conditionValue16 && (int(scalarValue57) >= int(scalarValue32)))) || ((((int(scalarValue31) <= int(comparisonValue17)) && conditionValue16) || ((int(scalarValue31) <= int(scalarValue58)) && conditionValue17)) || (((conditionValue16 && (int(comparisonValue17) < int(0u))) || ((int(scalarValue58) < int(0u)) && conditionValue17)) || (((int(scalarValue57) < int(0u)) && conditionValue16) || ((int(comparisonValue18) < int(0u)) && conditionValue17)))))
                    {
                        intermediateValue60 = true;
                        break;
                    }
                    intermediateValue53 = intermediateValue52 + 1u;
                    intermediateValue51 = conditionValue16 ? comparisonValue17 : scalarValue58;
                    intermediateValue49 = conditionValue16 ? scalarValue57 : comparisonValue18;
                    intermediateValue47 = uint(int(scalarValue33) > int(scalarValue12 + 1u)) + scalarValue12;
                    intermediateValue45 = conditionValue16 ? comparisonValue19 : multiplyAddValue57;
                    intermediateValue43 = conditionValue16 ? multiplyAddValue56 : comparisonValue20;
                    intermediateValue41 = multiplyAddValue58;
                }
                multiplyAddValue16 = intermediateValue41;
                scalarValue53 = intermediateValue43;
                scalarValue54 = intermediateValue45;
                scalarValue12 = intermediateValue47;
                intermediateValue48 = intermediateValue49;
                intermediateValue50 = intermediateValue51;
                intermediateValue52 = intermediateValue53;
                continue;
            }
            if (!intermediateValue60)
            {
                float quotientValue28 = (rdSignedBitsToFloat(intermediateValue50) + 0.5f) / RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x;
                float quotientValue29 = (rdSignedBitsToFloat(intermediateValue48) + 0.5f) / RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y;
                float multiplyAddValue59 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue85, mad(RD_UNIFORM_INV_VIEW_ROW_0.x, productValue83, productValue84 * RD_UNIFORM_INV_VIEW_ROW_1.x));
                float multiplyAddValue60 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue85, mad(RD_UNIFORM_INV_VIEW_ROW_0.y, productValue83, productValue84 * RD_UNIFORM_INV_VIEW_ROW_1.y));
                float multiplyAddValue61 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue85, mad(RD_UNIFORM_INV_VIEW_ROW_0.z, productValue83, productValue84 * RD_UNIFORM_INV_VIEW_ROW_1.z));
                float clampedValue2 = clamp((1.0f / (1.0f - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z)) * ((rdSignedBitsToFloat(intermediateValue52) / trunc(RD_UNIFORM_SSR_RAY_MARCHING_PARAMS.x)) - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z), 0.0f, 1.0f);
                float4 sampledTextureValue8 = materialTexture1.Sample(textureSampler1, float2(quotientValue28, quotientValue29));
                float scalarValue59 = sampledTextureValue8.x;
                float scalarValue60 = sampledTextureValue8.y;
                float scalarValue61 = abs(scalarValue60);
                float sumValue46 = 1.0f - abs(scalarValue59);
                float sumValue47 = sumValue46 - scalarValue61;
                bool conditionValue18 = sumValue47 < 0.0f;
                float comparisonValue21 = conditionValue18 ? ((1.0f - scalarValue61) * ((scalarValue59 >= 0.0f) ? sumValue42 : (-1.0f))) : scalarValue59;
                float comparisonValue22 = conditionValue18 ? (sumValue46 * ((scalarValue60 >= 0.0f) ? sumValue42 : (-1.0f))) : scalarValue60;
                float3 vectorValue15 = float3(comparisonValue21, comparisonValue22, sumValue47);
                float inverseLengthValue18 = rsqrt(rdDot3Precise(vectorValue15, vectorValue15));
                float3 vectorValue16 = float3(multiplyAddValue59, multiplyAddValue60, multiplyAddValue61);
                float inverseLengthValue19 = rsqrt(rdDot3Precise(vectorValue16, vectorValue16));
                fragmentColor0.w = min(1.0f - ((max(loadedBufferValue4, RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y) - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y) / (RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.x - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y)), min(clamp(1.0f - rdDot3Precise(float3(inverseLengthValue18 * comparisonValue21, inverseLengthValue18 * comparisonValue22, inverseLengthValue18 * sumValue47), float3(multiplyAddValue59 * inverseLengthValue19, multiplyAddValue60 * inverseLengthValue19, multiplyAddValue61 * inverseLengthValue19)), 0.0f, 1.0f), min(mad(-mad(clampedValue2, -2.0f, 3.0f), clampedValue2 * clampedValue2, 1.0f), (1.0f - exp2(log2(abs(mad(quotientValue29, 2.0f, -1.0f))) * RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.y)) * (1.0f - exp2(log2(abs(mad(quotientValue28, 2.0f, -1.0f))) * (RD_UNIFORM_CAMERA_DATA.z * RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.x))))));
                fragmentColor0.x = quotientValue28;
                fragmentColor0.y = quotientValue29;
                fragmentColor0.z = multiplyAddValue16;
            }
            else
            {
                fragmentColor0.x = 0.0f;
                fragmentColor0.y = 0.0f;
                fragmentColor0.z = 0.0f;
                fragmentColor0.w = -1.0f;
            }
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue7 = -1.0f;
            branchMergedValue8 = 0.0f;
            branchMergedValue9 = 0.0f;
            branchMergedValue10 = 0.0f;
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
            float productValue2 = (scalarValue1 * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
            float quotientValue = (RD_UNIFORM_INV_PROJ_ROW_0.x * varyingTexCoord1.x) / productValue2;
            float quotientValue1 = (RD_UNIFORM_INV_PROJ_ROW_1.y * varyingTexCoord1.y) / productValue2;
            float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue2;
            float4 sampledTextureValue1 = gbufferNormalTexture.Sample(gbufferNormalSampler, float2(productValue, productValue1));
            float scalarValue2 = sampledTextureValue1.x;
            float scalarValue3 = sampledTextureValue1.y;
            float sumValue = 1.0f - abs(scalarValue2);
            float scalarValue4 = abs(scalarValue3);
            float sumValue1 = sumValue - scalarValue4;
            bool conditionValue = sumValue1 < 0.0f;
            float comparisonValue = conditionValue ? ((1.0f - scalarValue4) * ((scalarValue2 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue2;
            float comparisonValue1 = conditionValue ? (((scalarValue3 < 0.0f) ? (-1.0f) : 1.0f) * sumValue) : scalarValue3;
            float inverseLengthValue = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue1), float3(comparisonValue, comparisonValue1, sumValue1)));
            float productValue3 = comparisonValue * inverseLengthValue;
            float productValue4 = comparisonValue1 * inverseLengthValue;
            float productValue5 = inverseLengthValue * sumValue1;
            float inverseLengthValue1 = rsqrt(dot(float3(productValue3, productValue4, productValue5), float3(productValue3, productValue4, productValue5)));
            float productValue6 = inverseLengthValue1 * productValue3;
            float productValue7 = productValue4 * inverseLengthValue1;
            float productValue8 = inverseLengthValue1 * productValue5;
            float multiplyAddValue = mad(RD_UNIFORM_INV_VIEW_ROW_0.z, productValue8, mad(RD_UNIFORM_INV_VIEW_ROW_0.y, productValue7, productValue6 * RD_UNIFORM_INV_VIEW_ROW_0.x));
            float multiplyAddValue1 = mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue8, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue7, productValue6 * RD_UNIFORM_INV_VIEW_ROW_1.x));
            float multiplyAddValue2 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue8, mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue7, productValue6 * RD_UNIFORM_INV_VIEW_ROW_2.x));
            float inverseLengthValue2 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
            float productValue9 = inverseLengthValue2 * multiplyAddValue;
            float productValue10 = inverseLengthValue2 * multiplyAddValue1;
            float productValue11 = inverseLengthValue2 * multiplyAddValue2;
            float inverseLengthValue3 = rsqrt(dot(float3(quotientValue, quotientValue1, quotientValue2), float3(quotientValue, quotientValue1, quotientValue2)));
            float productValue12 = inverseLengthValue3 * quotientValue;
            float productValue13 = inverseLengthValue3 * quotientValue1;
            float productValue14 = inverseLengthValue3 * quotientValue2;
            float dotProductValue = dot(float3(productValue12, productValue13, productValue14), float3(productValue9, productValue10, productValue11)) * 2.0f;
            float productValue15 = productValue12 - (dotProductValue * productValue9);
            float productValue16 = productValue13 - (dotProductValue * productValue10);
            float productValue17 = productValue14 - (dotProductValue * productValue11);
            float inverseLengthValue4 = rsqrt(dot(float3(productValue15, productValue16, productValue17), float3(productValue15, productValue16, productValue17)));
            float productValue18 = productValue15 * inverseLengthValue4;
            float productValue19 = productValue16 * inverseLengthValue4;
            float productValue20 = productValue17 * inverseLengthValue4;
            float productValue21 = (productValue20 * 1000.0f) + quotientValue2;
            float productValue22;
            float productValue23;
            float sumValue3;
            if (productValue21 > RD_UNIFORM_CAMERA_DATA.x)
            {
                float sumValue2 = RD_UNIFORM_CAMERA_DATA.x - quotientValue2;
                float quotientValue3 = sumValue2 / productValue20;
                productValue22 = quotientValue3 * productValue18;
                productValue23 = quotientValue3 * productValue19;
                sumValue3 = sumValue2 + quotientValue2;
            }
            else
            {
                productValue22 = productValue18 * 1000.0f;
                productValue23 = productValue19 * 1000.0f;
                sumValue3 = productValue21;
            }
            precise float sumValue4 = quotientValue1 + productValue23;
            precise float sumValue5 = quotientValue + productValue22;
            float multiplyAddValue3 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, sumValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, sumValue4, sumValue5 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
            float multiplyAddValue4 = ((((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, sumValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, sumValue4, sumValue5 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue3) - varyingTexCoord1.x) * 0.5f) * RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x;
            float multiplyAddValue5 = ((varyingTexCoord1.y - ((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, sumValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, sumValue4, sumValue5 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue3)) * 0.5f) * RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y;
            float multiplyAddValue6 = ((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, sumValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, sumValue4, sumValue5 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue3) - scalarValue1;
            float nonlinearValue = RD_UNIFORM_SCREEN_SPACE_RAY_OFFSET.x / sqrt((multiplyAddValue4 * multiplyAddValue4) + (multiplyAddValue5 * multiplyAddValue5));
            float productValue24 = (nonlinearValue * multiplyAddValue4) + (RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x * ((varyingTexCoord1.x * 0.5f) + 0.5f));
            float productValue25 = (nonlinearValue * multiplyAddValue5) + (RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y * (0.5f - (varyingTexCoord1.y * 0.5f)));
            float productValue26 = (nonlinearValue * multiplyAddValue6) + scalarValue1;
            uint scalarValue5 = uint(int(floor(productValue24)));
            uint scalarValue6 = uint(int(floor(productValue25)));
            float intermediateValue4;
            uint intermediateValue15;
            uint intermediateValue17;
            uint intermediateValue19;
            bool intermediateValue21;
            if (int(scalarValue) > int(0u))
            {
                float intermediateValue24;
                float intermediateValue26;
                float intermediateValue28;
                uint intermediateValue30;
                uint intermediateValue32;
                uint intermediateValue34;
                uint intermediateValue36;
                float intermediateValue14;
                uint intermediateValue16;
                uint intermediateValue18;
                uint intermediateValue20;
                bool intermediateValue22;
                float scalarValue7 = productValue24;
                float scalarValue8 = productValue25;
                float scalarValue9 = productValue26;
                uint scalarValue10 = scalarValue5;
                uint scalarValue11 = scalarValue6;
                uint scalarValue12 = 0u;
                uint scalarValue13 = 0u;
                float sumValue6;
                float sumValue7;
                uint bitwiseValue3;
                uint bitwiseValue4;
                uint bitwiseValue5;
                bool intermediateValue37;
                bool intermediateValue38;
                float comparisonValue2;
                float quotientValue6;
                float comparisonValue3;
                float quotientValue7;
                bool intermediateValue39;
                for (;;)
                {
                    uint bitwiseValue = scalarValue13 & 31u;
                    uint bitwiseValue1 = uint(int(scalarValue10) >> int(bitwiseValue));
                    uint bitwiseValue2 = uint(int(scalarValue11) >> int(bitwiseValue));
                    float4 loadedBufferValue1 = hiZBufferTexture.Load(int3(uint2(bitwiseValue1, bitwiseValue2), scalarValue13));
                    sumValue6 = 1.0f - loadedBufferValue1.x;
                    sumValue7 = 1.0f - loadedBufferValue1.y;
                    bitwiseValue3 = bitwiseValue1 << bitwiseValue;
                    bitwiseValue4 = bitwiseValue2 << bitwiseValue;
                    bitwiseValue5 = 1u << bitwiseValue;
                    intermediateValue37 = multiplyAddValue4 > 0.0f;
                    intermediateValue38 = multiplyAddValue5 > 0.0f;
                    comparisonValue2 = float(int(bitwiseValue3 + (intermediateValue37 ? bitwiseValue5 : 0u)));
                    quotientValue6 = (comparisonValue2 - scalarValue7) / multiplyAddValue4;
                    comparisonValue3 = float(int(bitwiseValue4 + (intermediateValue38 ? bitwiseValue5 : 0u)));
                    quotientValue7 = (comparisonValue3 - scalarValue8) / multiplyAddValue5;
                    intermediateValue39 = quotientValue6 < quotientValue7;
                    float intermediateValue44;
                    float intermediateValue45;
                    float intermediateValue46;
                    uint comparisonValue6;
                    uint intermediateValue47;
                    if (intermediateValue39)
                    {
                        float productValue27 = (quotientValue6 * multiplyAddValue5) + scalarValue8;
                        intermediateValue44 = comparisonValue2;
                        intermediateValue45 = productValue27;
                        intermediateValue46 = quotientValue6;
                        comparisonValue6 = bitwiseValue3 + (intermediateValue37 ? bitwiseValue5 : 4294967295u);
                        intermediateValue47 = uint(int(floor(productValue27)));
                    }
                    else
                    {
                        float productValue28 = (quotientValue7 * multiplyAddValue4) + scalarValue7;
                        intermediateValue44 = productValue28;
                        intermediateValue45 = comparisonValue3;
                        intermediateValue46 = quotientValue7;
                        comparisonValue6 = uint(int(floor(productValue28)));
                        intermediateValue47 = bitwiseValue4 + (intermediateValue38 ? bitwiseValue5 : 4294967295u);
                    }
                    precise float productValue29 = multiplyAddValue6 * intermediateValue46;
                    precise float sumValue9 = scalarValue9 + productValue29;
                    float branchMergedValue;
                    float branchMergedValue1;
                    uint branchMergedValue2;
                    uint branchMergedValue3;
                    uint branchMergedValue4;
                    uint branchMergedValue5;
                    float branchMergedValue6;
                    if ((min(scalarValue9, sumValue9) <= sumValue7) && ((int(scalarValue12) > int(0u)) && (max(scalarValue9, sumValue9) >= sumValue6)))
                    {
                        if (scalarValue13 == 0u)
                        {
                            intermediateValue14 = scalarValue9;
                            intermediateValue16 = scalarValue10;
                            intermediateValue18 = scalarValue11;
                            intermediateValue20 = scalarValue12;
                            intermediateValue22 = true;
                            break;
                        }
                        branchMergedValue = scalarValue8;
                        branchMergedValue1 = scalarValue9;
                        branchMergedValue2 = scalarValue10;
                        branchMergedValue3 = scalarValue11;
                        branchMergedValue4 = scalarValue12;
                        branchMergedValue5 = scalarValue13 + 4294967295u;
                        branchMergedValue6 = scalarValue7;
                    }
                    else
                    {
                        if ((int(intermediateValue47) >= int(uint(int(RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y)))) || ((int(intermediateValue47 | comparisonValue6) < int(0u)) || (int(comparisonValue6) >= int(uint(int(RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x))))))
                        {
                            intermediateValue14 = scalarValue9;
                            intermediateValue16 = scalarValue10;
                            intermediateValue18 = scalarValue11;
                            intermediateValue20 = scalarValue12;
                            intermediateValue22 = false;
                            break;
                        }
                        branchMergedValue = intermediateValue45;
                        branchMergedValue1 = sumValue9;
                        branchMergedValue2 = comparisonValue6;
                        branchMergedValue3 = intermediateValue47;
                        branchMergedValue4 = scalarValue12 + 1u;
                        branchMergedValue5 = uint(int(scalarValue13 + 1u) < int(uint(int(RD_UNIFORM_HI_ZMIP_COUNT.x)))) + scalarValue13;
                        branchMergedValue6 = intermediateValue44;
                    }
                    intermediateValue26 = branchMergedValue;
                    intermediateValue28 = branchMergedValue1;
                    intermediateValue30 = branchMergedValue2;
                    intermediateValue32 = branchMergedValue3;
                    intermediateValue34 = branchMergedValue4;
                    intermediateValue36 = branchMergedValue5;
                    intermediateValue24 = branchMergedValue6;
                    if (int(intermediateValue34) < int(scalarValue))
                    {
                        scalarValue7 = intermediateValue24;
                        scalarValue8 = intermediateValue26;
                        scalarValue9 = intermediateValue28;
                        scalarValue10 = intermediateValue30;
                        scalarValue11 = intermediateValue32;
                        scalarValue12 = intermediateValue34;
                        scalarValue13 = intermediateValue36;
                        continue;
                    }
                    else
                    {
                        intermediateValue14 = intermediateValue28;
                        intermediateValue16 = intermediateValue30;
                        intermediateValue18 = intermediateValue32;
                        intermediateValue20 = intermediateValue34;
                        intermediateValue22 = false;
                        break;
                    }
                }
                intermediateValue4 = intermediateValue14;
                intermediateValue15 = intermediateValue16;
                intermediateValue17 = intermediateValue18;
                intermediateValue19 = intermediateValue20;
                intermediateValue21 = intermediateValue22;
            }
            else
            {
                intermediateValue4 = productValue26;
                intermediateValue15 = scalarValue5;
                intermediateValue17 = scalarValue6;
                intermediateValue19 = 0u;
                intermediateValue21 = false;
            }
            float branchMergedValue11;
            float branchMergedValue12;
            float branchMergedValue13;
            float branchMergedValue14;
            if (intermediateValue21)
            {
                float quotientValue4 = (float(int(intermediateValue15)) + 0.5f) / RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.x;
                float quotientValue5 = (float(int(intermediateValue17)) + 0.5f) / RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS.y;
                float multiplyAddValue7 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue20, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue19, productValue18 * RD_UNIFORM_INV_VIEW_ROW_0.x));
                float multiplyAddValue8 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue20, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue19, productValue18 * RD_UNIFORM_INV_VIEW_ROW_0.y));
                float multiplyAddValue9 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue20, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue19, productValue18 * RD_UNIFORM_INV_VIEW_ROW_0.z));
                float clampedValue = clamp(((float(int(intermediateValue19)) / float(int(scalarValue))) - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z) / (1.0f - RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.z), 0.0f, 1.0f);
                float4 sampledTextureValue2 = gbufferNormalTexture.Sample(gbufferNormalSampler, float2(quotientValue4, quotientValue5));
                float scalarValue14 = sampledTextureValue2.x;
                float scalarValue15 = sampledTextureValue2.y;
                float sumValue10 = 1.0f - abs(scalarValue14);
                float scalarValue16 = abs(scalarValue15);
                float sumValue11 = sumValue10 - scalarValue16;
                bool conditionValue1 = sumValue11 < 0.0f;
                float comparisonValue4 = conditionValue1 ? ((1.0f - scalarValue16) * ((scalarValue14 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue14;
                float comparisonValue5 = conditionValue1 ? (((scalarValue15 < 0.0f) ? (-1.0f) : 1.0f) * sumValue10) : scalarValue15;
                float inverseLengthValue5 = rsqrt(dot(float3(comparisonValue4, comparisonValue5, sumValue11), float3(comparisonValue4, comparisonValue5, sumValue11)));
                float productValue30 = comparisonValue4 * inverseLengthValue5;
                float productValue31 = comparisonValue5 * inverseLengthValue5;
                float productValue32 = inverseLengthValue5 * sumValue11;
                float inverseLengthValue6 = rsqrt(dot(float3(productValue30, productValue31, productValue32), float3(productValue30, productValue31, productValue32)));
                float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9), float3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9)));
                branchMergedValue11 = min(min(min((1.0f - exp2(log2(abs((quotientValue5 * 2.0f) + (-1.0f))) * RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.y)) * (1.0f - exp2((RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS.x * RD_UNIFORM_CAMERA_DATA.z) * log2(abs((quotientValue4 * 2.0f) + (-1.0f))))), 1.0f - ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f)))), clamp(1.0f - dot(float3(inverseLengthValue6 * productValue30, productValue31 * inverseLengthValue6, inverseLengthValue6 * productValue32), float3(inverseLengthValue7 * multiplyAddValue7, inverseLengthValue7 * multiplyAddValue8, inverseLengthValue7 * multiplyAddValue9)), 0.0f, 1.0f)), 1.0f - ((max(loadedBufferValue, RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y) - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y) / (RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.x - RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS.y)));
                branchMergedValue12 = intermediateValue4;
                branchMergedValue13 = quotientValue5;
                branchMergedValue14 = quotientValue4;
            }
            else
            {
                branchMergedValue11 = -1.0f;
                branchMergedValue12 = 0.0f;
                branchMergedValue13 = 0.0f;
                branchMergedValue14 = 0.0f;
            }
            branchMergedValue7 = branchMergedValue11;
            branchMergedValue8 = branchMergedValue12;
            branchMergedValue9 = branchMergedValue13;
            branchMergedValue10 = branchMergedValue14;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue1 = branchMergedValue10;
        intermediateValue2 = branchMergedValue9;
        intermediateValue3 = branchMergedValue8;
        intermediateValue5 = branchMergedValue7;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = intermediateValue1;
    fragmentColor0.y = intermediateValue2;
    fragmentColor0.z = intermediateValue3;
    fragmentColor0.w = intermediateValue5;
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
