// CloudsForwardPBR / ForwardPBRTransparentSkyProbe / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_4 1
#endif

#include "../../include/materials/CloudsForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeFragmentStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float3 vectorValue = float3(varyingTexCoord3.x, varyingTexCoord3.y, varyingTexCoord3.z);
    float scalarValue12 = rdDot3Precise(vectorValue, vectorValue);
    float clampedValue7 = clamp((sqrt(scalarValue12) / RD_UNIFORM_DISTANCE_CONTROL.x) - 0.89999997615814208984375f, 0.0f, 1.0f);
    float productValue64 = ((RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) * varyingColor0.x) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
    float productValue65 = ((RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) * varyingColor0.y) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
    float productValue66 = ((RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) * varyingColor0.z) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
    float multiplyAddValue18 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue19 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue23 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue24 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue25 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue23, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue18, multiplyAddValue19 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w)));
    float multiplyAddValue26 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue23, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue18, multiplyAddValue19 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x))) / multiplyAddValue25;
    float multiplyAddValue27 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue23, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue18, multiplyAddValue19 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y))) / multiplyAddValue25;
    float multiplyAddValue28 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue24, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue23, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue18, multiplyAddValue19 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z))) / multiplyAddValue25;
    float intermediateValue22;
    float multiplyAddValue11;
    float multiplyAddValue12;
    float multiplyAddValue13;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint scalarValue = uint(varyingTexCoord4);
    float clampedValue = clamp(max((sqrt(((varyingTexCoord3.y * varyingTexCoord3.y) + (varyingTexCoord3.x * varyingTexCoord3.x)) + (varyingTexCoord3.z * varyingTexCoord3.z)) / RD_UNIFORM_DISTANCE_CONTROL.x) + (-0.89999997615814208984375f), 0.0f), 0.0f, 1.0f);
    float productValue = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
    float productValue1 = (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * varyingColor0.x) * productValue;
    float productValue2 = (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * varyingColor0.y) * productValue;
    float productValue3 = (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * varyingColor0.z) * productValue;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.z * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float multiplyAddValue5 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x))) / multiplyAddValue4;
    float multiplyAddValue6 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y))) / multiplyAddValue4;
    float multiplyAddValue7 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z))) / multiplyAddValue4;
    float productValue7;
    float productValue8;
    float productValue9;
#endif
    if (RD_UNIFORM_CLOUD_LIGHTING_TOGGLES.z != 0.0f)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue29 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, varyingNormal0.x, varyingNormal0.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.x));
        float multiplyAddValue30 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, varyingNormal0.x, varyingNormal0.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.y));
        float multiplyAddValue34 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, varyingNormal0.x, varyingNormal0.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.z));
        float inverseLengthValue7 = rsqrt(scalarValue12);
        float productValue67 = inverseLengthValue7 * varyingTexCoord3.x;
        float productValue68 = inverseLengthValue7 * varyingTexCoord3.z;
        float productValue69 = inverseLengthValue7 * varyingTexCoord3.y;
        bool conditionValue6 = productValue68 > 0.0f;
        bool conditionValue7 = productValue67 > 0.0f;
        float sumValue11 = RD_UNIFORM_WORLD_ORIGIN.y - varyingTexCoord3.y;
        bool conditionValue8 = productValue68 < 0.0f;
        bool conditionValue9 = productValue67 < 0.0f;
        float comparisonValue6 = (productValue69 > 0.0f) ? min((sumValue11 + 196.3300018310546875f) / productValue69, 16.0f) : ((productValue69 < 0.0f) ? min((sumValue11 + 192.3300018310546875f) / productValue69, 16.0f) : 16.0f);
        uint scalarValue = uint(varyingTexCoord4);
        bool comparisonValue7 = (scalarValue & 64u) != 0u;
        bool comparisonValue10 = (scalarValue & 2u) != 0u;
        bool comparisonValue11 = (scalarValue & 16u) != 0u;
        bool comparisonValue12 = (scalarValue & 8u) != 0u;
        float comparisonValue13 = conditionValue6 ? ((16.0f - varyingTexCoord5.y) / productValue68) : (conditionValue8 ? ((-varyingTexCoord5.y) / productValue68) : 16.0f);
        bool bitwiseValue4 = ((!conditionValue6) && (conditionValue8 && comparisonValue10)) || (comparisonValue7 && conditionValue6);
        float comparisonValue14 = conditionValue7 ? ((16.0f - varyingTexCoord5.x) / productValue67) : (conditionValue9 ? ((-varyingTexCoord5.x) / productValue67) : 16.0f);
        bool bitwiseValue5 = ((!conditionValue7) && (conditionValue9 && comparisonValue12)) || (conditionValue7 && comparisonValue11);
        bool conditionValue10 = comparisonValue13 < comparisonValue14;
        bool conditionValue11 = comparisonValue14 < comparisonValue13;
        float comparisonValue15 = conditionValue10 ? (bitwiseValue4 ? comparisonValue6 : min(comparisonValue6, comparisonValue13)) : (conditionValue11 ? (bitwiseValue5 ? comparisonValue6 : min(comparisonValue6, comparisonValue14)) : comparisonValue6);
        float intermediateValue23;
        if ((!(conditionValue10 || ((!bitwiseValue5) && conditionValue11))) || (conditionValue10 && bitwiseValue4))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, varyingNormal0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.x * varyingNormal0.x));
        float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, varyingNormal0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.y * varyingNormal0.x));
        float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, varyingNormal0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.z * varyingNormal0.x));
        float inverseLengthValue = rsqrt(dot(float3(varyingTexCoord3.x, varyingTexCoord3.y, varyingTexCoord3.z), float3(varyingTexCoord3.x, varyingTexCoord3.y, varyingTexCoord3.z)));
        float productValue4 = inverseLengthValue * varyingTexCoord3.x;
        float productValue5 = inverseLengthValue * varyingTexCoord3.y;
        float productValue6 = inverseLengthValue * varyingTexCoord3.z;
        float quotientValue;
        if (productValue5 > 0.0f)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float comparisonValue9;
            if (conditionValue6 && conditionValue7)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            quotientValue = min(16.0f, ((196.3300018310546875f - varyingTexCoord3.y) + RD_UNIFORM_WORLD_ORIGIN.y) / productValue5);
        }
        else
        {
            float branchMergedValue;
            if (productValue5 < 0.0f)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                comparisonValue9 = ((scalarValue & 128u) != 0u) ? comparisonValue15 : min(max(comparisonValue13, comparisonValue14), comparisonValue15);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue = min(16.0f, ((192.3300018310546875f - varyingTexCoord3.y) + RD_UNIFORM_WORLD_ORIGIN.y) / productValue5);
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                float scalarValue13 = min(max(comparisonValue13, comparisonValue14), comparisonValue15);
                comparisonValue9 = (conditionValue8 && conditionValue7) ? (((scalarValue & 4u) != 0u) ? comparisonValue15 : scalarValue13) : ((conditionValue6 && conditionValue9) ? (((scalarValue & 32u) != 0u) ? comparisonValue15 : scalarValue13) : ((conditionValue9 && conditionValue8) ? (((scalarValue & 1u) != 0u) ? comparisonValue15 : scalarValue13) : comparisonValue15));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue = 16.0f;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue23 = comparisonValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            quotientValue = branchMergedValue;
        }
        bool conditionValue = productValue6 > 0.0f;
        float quotientValue1;
        uint bitwiseValue;
        if (conditionValue)
        {
            quotientValue1 = (16.0f - varyingTexCoord5.y) / productValue6;
            bitwiseValue = (scalarValue >> 6u) & 1u;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue23 = comparisonValue15;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint branchMergedValue2;
            float branchMergedValue17;
            if (productValue6 < 0.0f)
            {
                branchMergedValue2 = (scalarValue >> 1u) & 1u;
                branchMergedValue17 = ((-0.0f) - varyingTexCoord5.y) / productValue6;
            }
            else
            {
                branchMergedValue2 = 0u;
                branchMergedValue17 = 16.0f;
            }
            quotientValue1 = branchMergedValue17;
            bitwiseValue = branchMergedValue2;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float scalarValue14 = max(intermediateValue23, 0.0f);
        float multiplyAddValue35 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x, RD_UNIFORM_VIEW_MATRIX_ROW_1.x * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y)));
        float multiplyAddValue36 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x, RD_UNIFORM_VIEW_MATRIX_ROW_1.y * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y)));
        float multiplyAddValue37 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x, RD_UNIFORM_VIEW_MATRIX_ROW_1.z * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y)));
        float3 vectorValue1 = float3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37);
        float inverseLengthValue8 = rsqrt(rdDot3Precise(vectorValue1, vectorValue1));
        float productValue70 = (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x;
        float productValue71 = (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x;
        float productValue72 = (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x;
        bool comparisonValue17 = RD_UNIFORM_CLOUD_LIGHTING_TOGGLES.x != 0.0f;
        float3 productValue73 = float3(inverseLengthValue8 * multiplyAddValue35, inverseLengthValue8 * multiplyAddValue36, inverseLengthValue8 * multiplyAddValue37);
        float multiplyAddValue20;
        float multiplyAddValue21;
        float multiplyAddValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        bool conditionValue1 = productValue4 > 0.0f;
        float quotientValue2;
        uint bitwiseValue1;
        if (conditionValue1)
        {
            quotientValue2 = (16.0f - varyingTexCoord5.x) / productValue4;
            bitwiseValue1 = (scalarValue >> 4u) & 1u;
        }
        else
        {
            uint branchMergedValue4;
            float branchMergedValue18;
            if (productValue4 < 0.0f)
            {
                branchMergedValue4 = (scalarValue >> 3u) & 1u;
                branchMergedValue18 = ((-0.0f) - varyingTexCoord5.x) / productValue4;
            }
            else
            {
                branchMergedValue4 = 0u;
                branchMergedValue18 = 16.0f;
            }
            quotientValue2 = branchMergedValue18;
            bitwiseValue1 = branchMergedValue4;
        }
        float intermediateValue18;
        bool intermediateValue19;
        if (quotientValue2 > quotientValue1)
        {
            bool branchMergedValue5;
            float branchMergedValue19;
            if (bitwiseValue == 0u)
            {
                branchMergedValue5 = false;
                branchMergedValue19 = min(quotientValue, quotientValue1);
            }
            else
            {
                branchMergedValue5 = true;
                branchMergedValue19 = quotientValue;
            }
            intermediateValue18 = branchMergedValue19;
            intermediateValue19 = branchMergedValue5;
        }
        else
        {
            bool branchMergedValue6;
            float branchMergedValue20;
            if ((!(quotientValue2 < quotientValue1)) || (bitwiseValue1 != 0u))
            {
                branchMergedValue6 = true;
                branchMergedValue20 = quotientValue;
            }
            else
            {
                branchMergedValue6 = false;
                branchMergedValue20 = min(quotientValue, quotientValue2);
            }
            intermediateValue18 = branchMergedValue20;
            intermediateValue19 = branchMergedValue6;
        }
        float intermediateValue20;
        if (intermediateValue19)
        {
            float branchMergedValue7;
            if (conditionValue1 && conditionValue)
            {
                float branchMergedValue27;
                if ((scalarValue & 128u) == 0u)
                {
                    branchMergedValue27 = min(intermediateValue18, max(quotientValue2, quotientValue1));
                }
                else
                {
                    branchMergedValue27 = intermediateValue18;
                }
                branchMergedValue7 = branchMergedValue27;
            }
            else
            {
                float branchMergedValue28;
                if (conditionValue1 && (productValue6 < 0.0f))
                {
                    float branchMergedValue31;
                    if ((scalarValue & 4u) == 0u)
                    {
                        branchMergedValue31 = min(intermediateValue18, max(quotientValue2, quotientValue1));
                    }
                    else
                    {
                        branchMergedValue31 = intermediateValue18;
                    }
                    branchMergedValue28 = branchMergedValue31;
                }
                else
                {
                    float branchMergedValue32;
                    if ((productValue4 < 0.0f) && conditionValue)
                    {
                        float branchMergedValue35;
                        if ((scalarValue & 32u) == 0u)
                        {
                            branchMergedValue35 = min(intermediateValue18, max(quotientValue2, quotientValue1));
                        }
                        else
                        {
                            branchMergedValue35 = intermediateValue18;
                        }
                        branchMergedValue32 = branchMergedValue35;
                    }
                    else
                    {
                        float branchMergedValue36;
                        if (((scalarValue & 1u) != 0u) || ((!(productValue6 < 0.0f)) || (!(productValue4 < 0.0f))))
                        {
                            branchMergedValue36 = intermediateValue18;
                        }
                        else
                        {
                            branchMergedValue36 = min(intermediateValue18, max(quotientValue2, quotientValue1));
                        }
                        branchMergedValue32 = branchMergedValue36;
                    }
                    branchMergedValue28 = branchMergedValue32;
                }
                branchMergedValue7 = branchMergedValue28;
            }
            intermediateValue20 = branchMergedValue7;
        }
        else
        {
            intermediateValue20 = intermediateValue18;
        }
        float scalarValue1 = min(max(intermediateValue20, 0.0f), 16.0f);
        float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
        float multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
        float multiplyAddValue16 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
        float inverseLengthValue1 = rsqrt(dot(float3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16), float3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16)));
        float productValue10 = inverseLengthValue1 * multiplyAddValue14;
        float productValue11 = inverseLengthValue1 * multiplyAddValue15;
        float productValue12 = inverseLengthValue1 * multiplyAddValue16;
        float productValue13 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w;
        float productValue14 = productValue13 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x;
        float productValue15 = productValue13 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y;
        float productValue16 = productValue13 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z;
        float productValue44;
        float productValue45;
        float productValue46;
#endif
        if (RD_UNIFORM_CLOUD_LIGHTING_TOGGLES.y != 0.0f)
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue38 = mad(productValue68 * scalarValue14, 0.5f, varyingTexCoord5.y);
            float multiplyAddValue39 = mad(productValue67 * scalarValue14, 0.5f, varyingTexCoord5.x);
            float3 vectorValue2 = float3(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xyz);
            float inverseLengthValue9 = rsqrt(rdDot3Precise(vectorValue2, vectorValue2));
            float productValue74 = inverseLengthValue9 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y;
            float productValue75 = inverseLengthValue9 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z;
            float productValue76 = inverseLengthValue9 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x;
            bool conditionValue12 = productValue75 > 0.0f;
            bool conditionValue13 = productValue76 > 0.0f;
            float multiplyAddValue40 = RD_UNIFORM_WORLD_ORIGIN.y - mad(productValue69 * scalarValue14, 0.5f, varyingTexCoord3.y);
            bool conditionValue14 = productValue75 < 0.0f;
            bool conditionValue15 = productValue76 < 0.0f;
            float comparisonValue18 = (productValue74 > 0.0f) ? min((multiplyAddValue40 + 196.3300018310546875f) / productValue74, 16.0f) : ((productValue74 < 0.0f) ? min((multiplyAddValue40 + 192.3300018310546875f) / productValue74, 16.0f) : 16.0f);
            float comparisonValue19 = conditionValue12 ? ((16.0f - multiplyAddValue38) / productValue75) : (conditionValue14 ? ((-multiplyAddValue38) / productValue75) : 16.0f);
            bool bitwiseValue6 = (conditionValue12 && comparisonValue7) || ((!conditionValue12) && (conditionValue14 && comparisonValue10));
            float comparisonValue20 = conditionValue13 ? ((16.0f - multiplyAddValue39) / productValue76) : (conditionValue15 ? ((-multiplyAddValue39) / productValue76) : 16.0f);
            bool bitwiseValue7 = ((!conditionValue13) && (conditionValue15 && comparisonValue12)) || (conditionValue13 && comparisonValue11);
            bool conditionValue16 = comparisonValue19 < comparisonValue20;
            bool conditionValue17 = comparisonValue20 < comparisonValue19;
            float comparisonValue23 = conditionValue16 ? (bitwiseValue6 ? comparisonValue18 : min(comparisonValue18, comparisonValue19)) : (conditionValue17 ? (bitwiseValue7 ? comparisonValue18 : min(comparisonValue20, comparisonValue18)) : comparisonValue18);
            float intermediateValue43;
            if ((conditionValue16 && bitwiseValue6) || (!(conditionValue16 || ((!bitwiseValue7) && conditionValue17))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue17 = scalarValue1 * 0.5f;
            float productValue18 = productValue17 * inverseLengthValue;
            float productValue19 = (productValue18 * varyingTexCoord3.y) + varyingTexCoord3.y;
            float productValue20 = (productValue18 * varyingTexCoord3.x) + varyingTexCoord5.x;
            float productValue21 = (productValue18 * varyingTexCoord3.z) + varyingTexCoord5.y;
            float inverseLengthValue2 = rsqrt(dot(float3(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xyz), float3(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xyz)));
            float productValue22 = inverseLengthValue2 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x;
            float productValue23 = inverseLengthValue2 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y;
            float productValue24 = inverseLengthValue2 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z;
            float quotientValue3;
            if (productValue23 > 0.0f)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                float comparisonValue16;
                if (conditionValue13 && conditionValue12)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                quotientValue3 = min(16.0f, ((196.3300018310546875f - productValue19) + RD_UNIFORM_WORLD_ORIGIN.y) / productValue23);
            }
            else
            {
                float branchMergedValue8;
                if (productValue23 < 0.0f)
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    comparisonValue16 = ((scalarValue & 128u) != 0u) ? comparisonValue23 : min(max(comparisonValue19, comparisonValue20), comparisonValue23);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue8 = min(16.0f, ((192.3300018310546875f - productValue19) + RD_UNIFORM_WORLD_ORIGIN.y) / productValue23);
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    float scalarValue15 = min(max(comparisonValue19, comparisonValue20), comparisonValue23);
                    comparisonValue16 = (conditionValue13 && conditionValue14) ? (((scalarValue & 4u) != 0u) ? comparisonValue23 : scalarValue15) : ((conditionValue12 && conditionValue15) ? (((scalarValue & 32u) != 0u) ? comparisonValue23 : scalarValue15) : ((conditionValue15 && conditionValue14) ? (((scalarValue & 1u) != 0u) ? comparisonValue23 : scalarValue15) : comparisonValue23));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue8 = 16.0f;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue43 = comparisonValue16;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                quotientValue3 = branchMergedValue8;
            }
            bool conditionValue2 = productValue24 > 0.0f;
            float quotientValue4;
            uint bitwiseValue2;
            if (conditionValue2)
            {
                quotientValue4 = (16.0f - productValue21) / productValue24;
                bitwiseValue2 = (scalarValue >> 6u) & 1u;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue43 = comparisonValue23;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                uint branchMergedValue10;
                float branchMergedValue23;
                if (productValue24 < 0.0f)
                {
                    branchMergedValue10 = (scalarValue >> 1u) & 1u;
                    branchMergedValue23 = ((-0.0f) - productValue21) / productValue24;
                }
                else
                {
                    branchMergedValue10 = 0u;
                    branchMergedValue23 = 16.0f;
                }
                quotientValue4 = branchMergedValue23;
                bitwiseValue2 = branchMergedValue10;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            float clampedValue8 = clamp((1.0f / RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.x) * (scalarValue14 * 0.5f), 0.0f, 1.0f);
            float multiplyAddValue41 = mad(-mad(clampedValue8, -2.0f, 3.0f), clampedValue8 * clampedValue8, 1.0f);
            float exponentialValue1 = exp2(((-max(intermediateValue43, 0.0f)) * RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.w) * 1.44269502162933349609375f);
            float3 vectorValue3 = float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue23);
            float inverseLengthValue10 = rsqrt(rdDot3Precise(vectorValue3, vectorValue3));
            float multiplyAddValue42 = rdDot2Precise(rdDot3Precise(productValue73, float3(-(inverseLengthValue10 * multiplyAddValue18), -(inverseLengthValue10 * multiplyAddValue19), -(inverseLengthValue10 * multiplyAddValue23))).xx, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y.xx) + mad(RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y, 1.0f);
            float multiplyAddValue43 = (mad(-RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y, 1.0f) * 0.079577468335628509521484375f) / (multiplyAddValue42 * sqrt(multiplyAddValue42));
            multiplyAddValue20 = mad(exponentialValue1 * (multiplyAddValue43 * productValue72), multiplyAddValue41, productValue66);
            multiplyAddValue21 = mad(exponentialValue1 * (multiplyAddValue43 * productValue71), multiplyAddValue41, productValue65);
            multiplyAddValue22 = mad(exponentialValue1 * (multiplyAddValue43 * productValue70), multiplyAddValue41, productValue64);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            bool conditionValue3 = productValue22 > 0.0f;
            float quotientValue5;
            uint bitwiseValue3;
            if (conditionValue3)
            {
                quotientValue5 = (16.0f - productValue20) / productValue22;
                bitwiseValue3 = (scalarValue >> 4u) & 1u;
            }
            else
            {
                uint branchMergedValue11;
                float branchMergedValue24;
                if (productValue22 < 0.0f)
                {
                    branchMergedValue11 = (scalarValue >> 3u) & 1u;
                    branchMergedValue24 = ((-0.0f) - productValue20) / productValue22;
                }
                else
                {
                    branchMergedValue11 = 0u;
                    branchMergedValue24 = 16.0f;
                }
                quotientValue5 = branchMergedValue24;
                bitwiseValue3 = branchMergedValue11;
            }
            float intermediateValue32;
            bool intermediateValue33;
            if (quotientValue5 > quotientValue4)
            {
                bool branchMergedValue12;
                float branchMergedValue25;
                if (bitwiseValue2 == 0u)
                {
                    branchMergedValue12 = false;
                    branchMergedValue25 = min(quotientValue3, quotientValue4);
                }
                else
                {
                    branchMergedValue12 = true;
                    branchMergedValue25 = quotientValue3;
                }
                intermediateValue32 = branchMergedValue25;
                intermediateValue33 = branchMergedValue12;
            }
            else
            {
                bool branchMergedValue13;
                float branchMergedValue26;
                if ((!(quotientValue5 < quotientValue4)) || (bitwiseValue3 != 0u))
                {
                    branchMergedValue13 = true;
                    branchMergedValue26 = quotientValue3;
                }
                else
                {
                    branchMergedValue13 = false;
                    branchMergedValue26 = min(quotientValue3, quotientValue5);
                }
                intermediateValue32 = branchMergedValue26;
                intermediateValue33 = branchMergedValue13;
            }
            float intermediateValue34;
            if (intermediateValue33)
            {
                float branchMergedValue14;
                if (conditionValue3 && conditionValue2)
                {
                    float branchMergedValue29;
                    if ((scalarValue & 128u) == 0u)
                    {
                        branchMergedValue29 = min(intermediateValue32, max(quotientValue5, quotientValue4));
                    }
                    else
                    {
                        branchMergedValue29 = intermediateValue32;
                    }
                    branchMergedValue14 = branchMergedValue29;
                }
                else
                {
                    float branchMergedValue30;
                    if (conditionValue3 && (productValue24 < 0.0f))
                    {
                        float branchMergedValue33;
                        if ((scalarValue & 4u) == 0u)
                        {
                            branchMergedValue33 = min(intermediateValue32, max(quotientValue5, quotientValue4));
                        }
                        else
                        {
                            branchMergedValue33 = intermediateValue32;
                        }
                        branchMergedValue30 = branchMergedValue33;
                    }
                    else
                    {
                        float branchMergedValue34;
                        if ((productValue22 < 0.0f) && conditionValue2)
                        {
                            float branchMergedValue37;
                            if ((scalarValue & 32u) == 0u)
                            {
                                branchMergedValue37 = min(intermediateValue32, max(quotientValue5, quotientValue4));
                            }
                            else
                            {
                                branchMergedValue37 = intermediateValue32;
                            }
                            branchMergedValue34 = branchMergedValue37;
                        }
                        else
                        {
                            float branchMergedValue38;
                            if (((scalarValue & 1u) != 0u) || ((!(productValue24 < 0.0f)) || (!(productValue22 < 0.0f))))
                            {
                                branchMergedValue38 = intermediateValue32;
                            }
                            else
                            {
                                branchMergedValue38 = min(intermediateValue32, max(quotientValue5, quotientValue4));
                            }
                            branchMergedValue34 = branchMergedValue38;
                        }
                        branchMergedValue30 = branchMergedValue34;
                    }
                    branchMergedValue14 = branchMergedValue30;
                }
                intermediateValue34 = branchMergedValue14;
            }
            else
            {
                intermediateValue34 = intermediateValue32;
            }
            float clampedValue1 = clamp(productValue17 / RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.x, 0.0f, 1.0f);
            float inverseLengthValue3 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
            float dotProductValue = (((dot(float3(productValue10, productValue11, productValue12), float3((-0.0f) - (multiplyAddValue * inverseLengthValue3), (-0.0f) - (multiplyAddValue1 * inverseLengthValue3), (-0.0f) - (multiplyAddValue2 * inverseLengthValue3))) * 2.0f) + RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y) * RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y) + 1.0f;
            float exponentialValue = (((1.0f - (RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y * RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y)) * 0.079577468335628509521484375f) / (dotProductValue * sqrt(dotProductValue))) * ((1.0f - ((clampedValue1 * clampedValue1) * (3.0f - (clampedValue1 * 2.0f)))) * exp2((min(max(intermediateValue34, 0.0f), 16.0f) * (-1.44269502162933349609375f)) * RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.w));
            productValue44 = (exponentialValue * productValue14) + productValue1;
            productValue45 = (exponentialValue * productValue15) + productValue2;
            productValue46 = (exponentialValue * productValue16) + productValue3;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue20 = productValue66;
            multiplyAddValue21 = productValue65;
            multiplyAddValue22 = productValue64;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue44 = productValue1;
            productValue45 = productValue2;
            productValue46 = productValue3;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float clampedValue9 = clamp((1.0f / RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.x) * scalarValue14, 0.0f, 1.0f);
        float multiplyAddValue44 = mad(-mad(clampedValue9, -2.0f, 3.0f), clampedValue9 * clampedValue9, 1.0f);
        float3 vectorValue4 = float3(multiplyAddValue29, multiplyAddValue30, multiplyAddValue34);
        float sumValue = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
        float productValue25 = sumValue * sumValue;
        float quotientValue6 = max((rdDot3Precise(vectorValue4, productValue73) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue25, 0.0f);
        float quotientValue7 = max((rdDot3Precise(float3(-multiplyAddValue29, -multiplyAddValue30, -multiplyAddValue34), productValue73) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue25, 0.0f);
        float productValue77 = varyingColor0.x * 0.3183098733425140380859375f;
        float productValue78 = varyingColor0.y * 0.3183098733425140380859375f;
        float productValue79 = varyingColor0.z * 0.3183098733425140380859375f;
        float comparisonValue8;
        float comparisonValue21;
        float comparisonValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue48;
        float productValue49;
        float productValue50;
        if (RD_UNIFORM_CLOUD_LIGHTING_TOGGLES.x != 0.0f)
        {
            float clampedValue2 = clamp(scalarValue1 / RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.x, 0.0f, 1.0f);
            float sumValue = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
            float productValue25 = sumValue * sumValue;
            float dotProductValue1 = (((max((dot(float3((-0.0f) - multiplyAddValue8, (-0.0f) - multiplyAddValue9, (-0.0f) - multiplyAddValue10), float3(productValue10, productValue11, productValue12)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue25, 0.0f) * (1.0f - ((clampedValue2 * clampedValue2) * (3.0f - (clampedValue2 * 2.0f))))) + max((dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(productValue10, productValue11, productValue12)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue25, 0.0f)) * 0.3183098733425140380859375f) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x;
            productValue48 = productValue44 + ((dotProductValue1 * varyingColor0.x) * productValue14);
            productValue49 = productValue45 + ((dotProductValue1 * varyingColor0.y) * productValue15);
            productValue50 = productValue46 + ((dotProductValue1 * varyingColor0.z) * productValue16);
        }
        else
        {
            productValue48 = productValue44;
            productValue49 = productValue45;
            productValue50 = productValue46;
        }
        float productValue60;
        float productValue61;
        float productValue62;
#endif
        if (RD_UNIFORM_IBL_PARAMETERS.x != 0.0f)
        {
            bool conditionValue4 = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
#if RD_PLATFORM == RD_PLATFORM_SM50
            bool conditionValue18 = RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f;
            float multiplyAddValue45 = conditionValue18 ? (mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x) : multiplyAddValue18;
            float multiplyAddValue46 = conditionValue18 ? (mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y) : multiplyAddValue19;
            float multiplyAddValue47 = conditionValue18 ? (mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z) : multiplyAddValue23;
#endif
            float sumValue1 = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
            float sumValue2 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
            float sumValue3 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
#if RD_PLATFORM == RD_PLATFORM_SM50
            float3 vectorValue5 = float3(sumValue1, sumValue2, sumValue3);
            float inverseLengthValue11 = rsqrt(rdDot3Precise(vectorValue5, vectorValue5));
            float productValue80 = inverseLengthValue11 * sumValue1;
            float productValue81 = inverseLengthValue11 * sumValue2;
            float productValue82 = inverseLengthValue11 * sumValue3;
            float3 vectorValue6 = float3(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47);
            float inverseLengthValue12 = rsqrt(rdDot3Precise(vectorValue6, vectorValue6));
            float scalarValue16 = rdDot3Precise(float3(productValue80, productValue81, productValue82), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z));
            float sumValue12 = -(scalarValue16 + scalarValue16);
            float multiplyAddValue48 = mad(varyingNormal0.x, sumValue12, productValue80);
            float multiplyAddValue49 = mad(varyingNormal0.y, sumValue12, productValue81);
            float multiplyAddValue53 = mad(varyingNormal0.z, sumValue12, productValue82);
            float sumValue13 = RD_UNIFORM_IBL_PARAMETERS.y - 1.0f;
            uint sumValue14 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x)) + 2u;
            uint scalarValue17 = uint(abs(int(sumValue14))) % 3u;
            float4 sampledTextureValue6 = materialTexture6.SampleLevel(textureSampler6, float4(multiplyAddValue48, multiplyAddValue49, multiplyAddValue53, trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x)), sumValue13);
            float4 sampledTextureValue7 = materialTexture6.SampleLevel(textureSampler6, float4(multiplyAddValue48, multiplyAddValue49, multiplyAddValue53, rdSignedBitsToFloat(((sumValue14 & 2147483648u) != 0u) ? (-scalarValue17) : scalarValue17)), sumValue13);
            float scalarValue18 = sampledTextureValue7.x;
            float scalarValue19 = sampledTextureValue7.y;
            float scalarValue20 = sampledTextureValue7.z;
            float multiplyAddValue54 = mad(RD_UNIFORM_IBL_PARAMETERS.w, sampledTextureValue6.x - scalarValue18, scalarValue18);
            float multiplyAddValue55 = mad(RD_UNIFORM_IBL_PARAMETERS.w, sampledTextureValue6.y - scalarValue19, scalarValue19);
            float multiplyAddValue56 = mad(RD_UNIFORM_IBL_PARAMETERS.w, sampledTextureValue6.z - scalarValue20, scalarValue20);
            float comparisonValue24 = (conditionValue4 ? (multiplyAddValue54 * 301.72412109375f) : multiplyAddValue54) * RD_UNIFORM_IBL_PARAMETERS.z;
            float comparisonValue25 = (conditionValue4 ? (multiplyAddValue55 * 301.72412109375f) : multiplyAddValue55) * RD_UNIFORM_IBL_PARAMETERS.z;
            float comparisonValue26 = (conditionValue4 ? (multiplyAddValue56 * 301.72412109375f) : multiplyAddValue56) * RD_UNIFORM_IBL_PARAMETERS.z;
            bool comparisonValue27 = (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f) && (rdDot3Precise(float3(comparisonValue24, comparisonValue25, comparisonValue26), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) < 0.0f);
            float4 sampledTextureValue8 = materialTexture0.Sample(textureSampler0, float2(clamp(rdDot3Precise(vectorValue4, float3(-(multiplyAddValue45 * inverseLengthValue12), -(multiplyAddValue46 * inverseLengthValue12), -(multiplyAddValue47 * inverseLengthValue12))), 0.0f, 1.0f), 0.0f));
            float multiplyAddValue57 = mad(sampledTextureValue8.x, 0.039999999105930328369140625f, sampledTextureValue8.y);
            comparisonValue21 = comparisonValue27 ? 0.0f : (multiplyAddValue57 * comparisonValue26);
            comparisonValue22 = comparisonValue27 ? 0.0f : (multiplyAddValue57 * comparisonValue25);
            comparisonValue8 = comparisonValue27 ? 0.0f : (multiplyAddValue57 * comparisonValue24);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float inverseLengthValue4 = rsqrt(dot(float3(sumValue1, sumValue2, sumValue3), float3(sumValue1, sumValue2, sumValue3)));
            float productValue29 = inverseLengthValue4 * sumValue1;
            float productValue30 = inverseLengthValue4 * sumValue2;
            float productValue31 = inverseLengthValue4 * sumValue3;
            float inverseLengthValue5 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
            float dotProductValue2 = dot(float3(productValue29, productValue30, productValue31), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)) * 2.0f;
            float productValue32 = productValue29 - (dotProductValue2 * varyingNormal0.x);
            float productValue33 = productValue30 - (dotProductValue2 * varyingNormal0.y);
            float productValue34 = productValue31 - (dotProductValue2 * varyingNormal0.z);
            float sumValue4 = RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f);
            uint scalarValue2 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
            float4 sampledTextureValue = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue32, productValue33, productValue34, float(int(scalarValue2))), sumValue4);
            float4 sampledTextureValue1 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue32, productValue33, productValue34, float(int(uint(int(scalarValue2 + 2u) - int(3u) * (int(scalarValue2 + 2u) / int(3u)))))), sumValue4);
            float scalarValue3 = sampledTextureValue1.x;
            float scalarValue4 = sampledTextureValue1.y;
            float scalarValue5 = sampledTextureValue1.z;
            float productValue35 = ((sampledTextureValue.x - scalarValue3) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue3;
            float productValue36 = ((sampledTextureValue.y - scalarValue4) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue4;
            float productValue37 = ((sampledTextureValue.z - scalarValue5) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue5;
            float comparisonValue = (conditionValue4 ? (productValue35 * 301.72412109375f) : productValue35) * RD_UNIFORM_IBL_PARAMETERS.z;
            float comparisonValue1 = (conditionValue4 ? (productValue36 * 301.72412109375f) : productValue36) * RD_UNIFORM_IBL_PARAMETERS.z;
            float comparisonValue2 = (conditionValue4 ? (productValue37 * 301.72412109375f) : productValue37) * RD_UNIFORM_IBL_PARAMETERS.z;
            float intermediateValue28;
            float intermediateValue29;
            float intermediateValue30;
            if (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f)
            {
                float branchMergedValue9;
                float branchMergedValue21;
                float branchMergedValue22;
                if (((dot(float3(comparisonValue, comparisonValue1, comparisonValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= 0.0f) ? 0.0f : 1.0f) == 1.0f)
                {
                    branchMergedValue9 = 0.0f;
                    branchMergedValue21 = 0.0f;
                    branchMergedValue22 = 0.0f;
                }
                else
                {
                    branchMergedValue9 = comparisonValue2;
                    branchMergedValue21 = comparisonValue1;
                    branchMergedValue22 = comparisonValue;
                }
                intermediateValue28 = branchMergedValue22;
                intermediateValue29 = branchMergedValue21;
                intermediateValue30 = branchMergedValue9;
            }
            else
            {
                intermediateValue28 = comparisonValue;
                intermediateValue29 = comparisonValue1;
                intermediateValue30 = comparisonValue2;
            }
            float4 sampledTextureValue2 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3((-0.0f) - (multiplyAddValue * inverseLengthValue5), (-0.0f) - (multiplyAddValue1 * inverseLengthValue5), (-0.0f) - (multiplyAddValue2 * inverseLengthValue5))), 0.0f, 1.0f), 0.0f));
            float productValue38 = (sampledTextureValue2.x * 0.039999999105930328369140625f) + sampledTextureValue2.y;
            productValue60 = productValue38 * intermediateValue28;
            productValue61 = productValue38 * intermediateValue29;
            productValue62 = productValue38 * intermediateValue30;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            comparisonValue21 = 0.0f;
            comparisonValue22 = 0.0f;
            comparisonValue8 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue60 = 0.0f;
            productValue61 = 0.0f;
            productValue62 = 0.0f;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue22 = comparisonValue8;
        multiplyAddValue11 = mad(comparisonValue21, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z, comparisonValue17 ? mad(productValue72 * mad(quotientValue6, productValue79, multiplyAddValue44 * (quotientValue7 * productValue79)), RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x, multiplyAddValue20) : multiplyAddValue20);
        multiplyAddValue12 = mad(comparisonValue22, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z, comparisonValue17 ? mad(productValue71 * mad(quotientValue6, productValue78, multiplyAddValue44 * (quotientValue7 * productValue78)), RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x, multiplyAddValue21) : multiplyAddValue21);
        multiplyAddValue13 = mad(comparisonValue8, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z, comparisonValue17 ? mad(productValue70 * mad(quotientValue6, productValue77, multiplyAddValue44 * (quotientValue7 * productValue77)), RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x, multiplyAddValue22) : multiplyAddValue22);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue7 = (RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z * productValue60) + productValue48;
        productValue8 = (RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z * productValue61) + productValue49;
        productValue9 = (RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z * productValue62) + productValue50;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue22 = multiplyAddValue18;
        multiplyAddValue11 = productValue66;
        multiplyAddValue12 = productValue65;
        multiplyAddValue13 = productValue64;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue7 = productValue1;
        productValue8 = productValue2;
        productValue9 = productValue3;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue39;
    uint intermediateValue40;
    uint intermediateValue41;
    uint intermediateValue42;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
#endif
    if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint multiplyAddValue31;
        uint multiplyAddValue32;
        uint multiplyAddValue33;
        float intermediateValue38;
        if (clampedValue7 > 0.0f)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue1;
        float branchMergedValue15;
        float branchMergedValue16;
        if (clampedValue > 0.0f)
#endif
        {
            float sumValue5 = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
            float sumValue6 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
            float sumValue7 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
#if RD_PLATFORM == RD_PLATFORM_SM50
            float3 vectorValue7 = float3(sumValue5, sumValue6, sumValue7);
            float inverseLengthValue13 = rsqrt(rdDot3Precise(vectorValue7, vectorValue7));
            float sumValue15 = RD_UNIFORM_FOG_SKY_BLEND.w - RD_UNIFORM_FOG_SKY_BLEND.x;
            float multiplyAddValue58 = mad(sumValue6, inverseLengthValue13, sumValue15);
            float clampedValue10 = clamp((1.0f / (sumValue15 + (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.w))) * multiplyAddValue58, 0.0f, 1.0f);
            float multiplyAddValue59 = mad(-mad(clampedValue10, -2.0f, 3.0f), clampedValue10 * clampedValue10, 1.0f);
            float productValue83 = multiplyAddValue59 * (multiplyAddValue59 * multiplyAddValue59);
            float3 productValue84 = float3(sumValue5 * inverseLengthValue13, sumValue6 * inverseLengthValue13, sumValue7 * inverseLengthValue13);
            float scalarValue21 = rdDot3Precise(productValue84, float3(RD_UNIFORM_SUN_DIR.xyz));
            float scalarValue22 = rdDot3Precise(productValue84, float3(RD_UNIFORM_MOON_DIR.xyz));
            float clampedValue11 = clamp((1.0f / (sumValue15 + RD_UNIFORM_FOG_SKY_BLEND.y)) * multiplyAddValue58, 0.0f, 1.0f);
            float multiplyAddValue60 = mad(-mad(clampedValue11, -2.0f, 3.0f), clampedValue11 * clampedValue11, 1.0f);
            float productValue85 = multiplyAddValue60 * (multiplyAddValue60 * multiplyAddValue60);
            float multiplyAddValue61 = mad(mad(scalarValue21, scalarValue21, 1.0f) * RD_UNIFORM_SUN_COLOR.w, 0.75f, (mad(scalarValue22, scalarValue22, 1.0f) * RD_UNIFORM_MOON_COLOR.w) * 0.75f);
            float exponentialValue2 = min(exp2(log2(max(scalarValue21, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 1.0f);
            float exponentialValue3 = min(exp2(log2(max(scalarValue22, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 1.0f);
            float multiplyAddValue62 = mad(-exponentialValue2, 1.7999999523162841796875f, 1.809999942779541015625f);
            float multiplyAddValue63 = mad(-exponentialValue3, 1.7999999523162841796875f, 1.809999942779541015625f);
            float nonlinearValue2 = 0.0361000001430511474609375f / (sqrt(multiplyAddValue62) * multiplyAddValue62);
            float nonlinearValue3 = 0.0361000001430511474609375f / (sqrt(multiplyAddValue63) * multiplyAddValue63);
            float multiplyAddValue64 = mad(exponentialValue2 * ((RD_UNIFORM_SUN_COLOR.x * RD_UNIFORM_SUN_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.y), nonlinearValue2, nonlinearValue3 * (exponentialValue3 * ((RD_UNIFORM_MOON_COLOR.x * RD_UNIFORM_MOON_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.z))) * ((productValue83 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * 0.079577468335628509521484375f);
            multiplyAddValue31 = asuint(mad(clampedValue7, mad((mad(productValue85, RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x, RD_UNIFORM_SKY_ZENITH_COLOR.x) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.x) * 0.079577468335628509521484375f, multiplyAddValue61, multiplyAddValue64) - multiplyAddValue13, multiplyAddValue13));
            multiplyAddValue32 = asuint(mad(clampedValue7, mad((mad(productValue85, RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y, RD_UNIFORM_SKY_ZENITH_COLOR.y) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.x) * 0.079577468335628509521484375f, multiplyAddValue61, mad(exponentialValue2 * ((RD_UNIFORM_SUN_COLOR.y * RD_UNIFORM_SUN_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.y), nonlinearValue2, nonlinearValue3 * (exponentialValue3 * ((RD_UNIFORM_MOON_COLOR.y * RD_UNIFORM_MOON_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.z))) * ((productValue83 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * 0.079577468335628509521484375f)) - multiplyAddValue12, multiplyAddValue12));
            multiplyAddValue33 = asuint(mad(clampedValue7, mad((mad(productValue85, RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z, RD_UNIFORM_SKY_ZENITH_COLOR.z) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.x) * 0.079577468335628509521484375f, multiplyAddValue61, mad(exponentialValue2 * ((RD_UNIFORM_SUN_COLOR.z * RD_UNIFORM_SUN_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.y), nonlinearValue2, nonlinearValue3 * (exponentialValue3 * ((RD_UNIFORM_MOON_COLOR.z * RD_UNIFORM_MOON_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.z))) * ((productValue83 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * 0.079577468335628509521484375f)) - multiplyAddValue11, multiplyAddValue11));
            intermediateValue38 = multiplyAddValue64;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float inverseLengthValue6 = rsqrt(dot(float3(sumValue5, sumValue6, sumValue7), float3(sumValue5, sumValue6, sumValue7)));
            float productValue39 = inverseLengthValue6 * sumValue5;
            float productValue40 = inverseLengthValue6 * sumValue6;
            float productValue41 = inverseLengthValue6 * sumValue7;
            float clampedValue3 = clamp(((RD_UNIFORM_FOG_SKY_BLEND.w - RD_UNIFORM_FOG_SKY_BLEND.x) + productValue40) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
            float productValue42 = 1.0f - ((clampedValue3 * clampedValue3) * (3.0f - (clampedValue3 * 2.0f)));
            float productValue43 = (productValue42 * productValue42) * productValue42;
            float dotProductValue3 = dot(float3(productValue39, productValue40, productValue41), float3(RD_UNIFORM_SUN_DIR.xyz));
            float dotProductValue4 = dot(float3(productValue39, productValue40, productValue41), float3(RD_UNIFORM_MOON_DIR.xyz));
            float sumValue8 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
            float clampedValue4 = clamp((productValue40 - sumValue8) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue8), 0.0f, 1.0f);
            float productValue47 = 1.0f - ((clampedValue4 * clampedValue4) * (3.0f - (clampedValue4 * 2.0f)));
            float productValue51 = (productValue47 * productValue47) * productValue47;
            float productValue52 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue4 * dotProductValue4) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue3 * dotProductValue3) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
            float clampedValue5 = clamp(exp2(log2(max(dotProductValue3, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
            float clampedValue6 = clamp(exp2(log2(max(dotProductValue4, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
            float productValue53 = 1.809999942779541015625f - (clampedValue5 * 1.7999999523162841796875f);
            float nonlinearValue = 0.036100022494792938232421875f / (sqrt(productValue53) * productValue53);
            float productValue54 = 1.809999942779541015625f - (clampedValue6 * 1.7999999523162841796875f);
            float nonlinearValue1 = 0.036100022494792938232421875f / (sqrt(productValue54) * productValue54);
            float productValue55 = clampedValue5 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
            float productValue56 = clampedValue6 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
            branchMergedValue1 = ((((((productValue43 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue56 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue1) + ((productValue55 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue))) + (((productValue51 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue52)) * 0.079577468335628509521484375f) - productValue9) * clampedValue) + productValue9;
            branchMergedValue15 = ((((((productValue43 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue56 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue1) + ((productValue55 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue))) + (((productValue51 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue52)) * 0.079577468335628509521484375f) - productValue8) * clampedValue) + productValue8;
            branchMergedValue16 = ((((((productValue43 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue56 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue1) + ((productValue55 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue))) + (((productValue51 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue52)) * 0.079577468335628509521484375f) - productValue7) * clampedValue) + productValue7;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue31 = asuint(multiplyAddValue13);
            multiplyAddValue32 = asuint(multiplyAddValue12);
            multiplyAddValue33 = asuint(multiplyAddValue11);
            intermediateValue38 = intermediateValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue1 = productValue9;
            branchMergedValue15 = productValue8;
            branchMergedValue16 = productValue7;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue39 = intermediateValue38;
        intermediateValue40 = multiplyAddValue33;
        intermediateValue41 = multiplyAddValue32;
        intermediateValue42 = multiplyAddValue31;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue2 = branchMergedValue16;
        intermediateValue3 = branchMergedValue15;
        intermediateValue4 = branchMergedValue1;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue39 = intermediateValue22;
        intermediateValue40 = asuint(mad(clampedValue7, RD_UNIFORM_FOG_COLOR.z - multiplyAddValue11, multiplyAddValue11));
        intermediateValue41 = asuint(mad(clampedValue7, RD_UNIFORM_FOG_COLOR.y - multiplyAddValue12, multiplyAddValue12));
        intermediateValue42 = asuint(mad(clampedValue7, RD_UNIFORM_FOG_COLOR.x - multiplyAddValue13, multiplyAddValue13));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue2 = ((RD_UNIFORM_FOG_COLOR.x - productValue7) * clampedValue) + productValue7;
        intermediateValue3 = ((RD_UNIFORM_FOG_COLOR.y - productValue8) * clampedValue) + productValue8;
        intermediateValue4 = ((RD_UNIFORM_FOG_COLOR.z - productValue9) * clampedValue) + productValue9;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    bool comparisonValue28 = RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f;
    uint multiplyAddValue50;
    uint multiplyAddValue51;
    uint multiplyAddValue52;
    float intermediateValue59;
    float intermediateValue60;
    float intermediateValue61;
    if (comparisonValue28)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue26;
    float productValue27;
    float productValue28;
    float intermediateValue11;
    float intermediateValue13;
    float intermediateValue14;
    if (RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float productValue86 = (multiplyAddValue26 + 1.0f) * 0.5f;
        float productValue87 = (multiplyAddValue27 + 1.0f) * 0.5f;
        float multiplyAddValue65 = log2(mad((((-(mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue28, mad(RD_UNIFORM_INV_PROJ_ROW_0.z, multiplyAddValue26, multiplyAddValue27 * RD_UNIFORM_INV_PROJ_ROW_1.z)) + RD_UNIFORM_INV_PROJ_ROW_3.z)) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue28, mad(RD_UNIFORM_INV_PROJ_ROW_0.w, multiplyAddValue26, multiplyAddValue27 * RD_UNIFORM_INV_PROJ_ROW_1.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x), 53.598148345947265625f, 1.0f)) * 0.17328679561614990234375f;
        float multiplyAddValue66 = mad(multiplyAddValue65, trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z), -0.5f);
        uint sumValue16 = uint(min(int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z)) - 2u), int(uint(max(int(uint(int(multiplyAddValue66))), int(0u))))));
        float scalarValue23 = rdSignedBitsToFloat(sumValue16);
        float clampedValue12 = clamp(multiplyAddValue66 - scalarValue23, 0.0f, 1.0f);
        float4 sampledTextureValue9 = materialTexture3.SampleLevel(textureSampler3, float3(productValue86, productValue87, scalarValue23), 0.0f);
        float scalarValue24 = sampledTextureValue9.x;
        float scalarValue25 = sampledTextureValue9.y;
        float scalarValue26 = sampledTextureValue9.z;
        float scalarValue27 = sampledTextureValue9.w;
        float4 sampledTextureValue10 = materialTexture3.SampleLevel(textureSampler3, float3(productValue86, productValue87, rdSignedBitsToFloat(sumValue16 + 1u)), 0.0f);
        float multiplyAddValue67 = mad(clampedValue12, sampledTextureValue10.w - scalarValue27, scalarValue27);
        multiplyAddValue50 = asuint(mad(multiplyAddValue67, asfloat(intermediateValue42), mad(clampedValue12, sampledTextureValue10.x - scalarValue24, scalarValue24)));
        multiplyAddValue51 = asuint(mad(multiplyAddValue67, asfloat(intermediateValue41), mad(clampedValue12, sampledTextureValue10.y - scalarValue25, scalarValue25)));
        multiplyAddValue52 = asuint(mad(multiplyAddValue67, asfloat(intermediateValue40), mad(clampedValue12, sampledTextureValue10.z - scalarValue26, scalarValue26)));
        intermediateValue59 = productValue86;
        intermediateValue60 = multiplyAddValue65;
        intermediateValue61 = productValue87;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue57 = (multiplyAddValue5 + 1.0f) * 0.5f;
        float productValue58 = (multiplyAddValue6 + 1.0f) * 0.5f;
        float multiplyAddValue17 = log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue7, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue6, multiplyAddValue5 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue7, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue6, multiplyAddValue5 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f;
        uint scalarValue6 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float productValue59 = (float(int(scalarValue6)) * multiplyAddValue17) + (-0.5f);
        uint sumValue9 = uint(min(int(uint(max(int(uint(int(productValue59))), int(0u)))), int(scalarValue6 + 4294967294u)));
        float scalarValue7 = float(int(sumValue9));
        float sumValue10 = min(max(productValue59 - scalarValue7, 0.0f), 1.0f);
        float4 sampledTextureValue3 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue57, productValue58, scalarValue7), 0.0f);
        float scalarValue8 = sampledTextureValue3.x;
        float scalarValue9 = sampledTextureValue3.y;
        float scalarValue10 = sampledTextureValue3.z;
        float scalarValue11 = sampledTextureValue3.w;
        float4 sampledTextureValue4 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue57, productValue58, float(int(sumValue9 + 1u))), 0.0f);
        float productValue63 = ((sampledTextureValue4.w - scalarValue11) * sumValue10) + scalarValue11;
        productValue26 = (((sampledTextureValue4.x - scalarValue8) * sumValue10) + scalarValue8) + (productValue63 * intermediateValue2);
        productValue27 = (((sampledTextureValue4.y - scalarValue9) * sumValue10) + scalarValue9) + (productValue63 * intermediateValue3);
        productValue28 = (((sampledTextureValue4.z - scalarValue10) * sumValue10) + scalarValue10) + (productValue63 * intermediateValue4);
        intermediateValue11 = productValue57;
        intermediateValue13 = productValue58;
        intermediateValue14 = multiplyAddValue17;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue50 = intermediateValue42;
        multiplyAddValue51 = intermediateValue41;
        multiplyAddValue52 = intermediateValue40;
        intermediateValue59 = comparisonValue28 ? asfloat(0xffffffffu ) : 0.0f;
        intermediateValue60 = intermediateValue39;
        intermediateValue61 = clampedValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue26 = intermediateValue2;
        productValue27 = intermediateValue3;
        productValue28 = intermediateValue4;
        intermediateValue11 = intermediateValue12;
        intermediateValue13 = intermediateValue12;
        intermediateValue14 = intermediateValue12;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint intermediateValue63;
    bool sampledTextureValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool intermediateValue16;
#endif
    if (RD_UNIFORM_SKY_SAMPLES_CONFIG.x > 0.5f)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue63 = 0u;
        sampledTextureValue5 = materialTexture5.SampleLevel(textureSampler5, float3(intermediateValue59, 1.0f - intermediateValue61, (exp2((intermediateValue60 - RD_UNIFORM_SKY_SAMPLES_CONFIG.z) * 5.770780086517333984375f) - 1.0f) * 0.0186573602259159088134765625f), 0.0f).y < RD_UNIFORM_SKY_SAMPLES_CONFIG.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        bool branchMergedValue3;
        if (skyAmbientSamplesTexture.SampleLevel(skyAmbientSamplesSampler, float3(intermediateValue11, 1.0f - intermediateValue13, (exp2((intermediateValue14 - RD_UNIFORM_SKY_SAMPLES_CONFIG.z) * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f), 0.0f).y < RD_UNIFORM_SKY_SAMPLES_CONFIG.w)
        {
            branchMergedValue3 = false;
        }
        else
        {
            branchMergedValue3 = true;
        }
        intermediateValue16 = branchMergedValue3;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue63 = asuint(intermediateValue61);
        sampledTextureValue5 = false;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue16 = true;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint comparisonValue29 = sampledTextureValue5 ? intermediateValue63 : 4294967295u;
    fragmentColor0.w = asfloat(comparisonValue29 & asuint(varyingColor0.w)) * ((min(max((multiplyAddValue27 + 1.0f) * 0.5f, RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y), RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x) - RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y) / ((RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x - RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y) + 9.9999997473787516355514526367188e-06f));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float comparisonValue3 = intermediateValue16 ? productValue26 : 0.0f;
    float comparisonValue4 = intermediateValue16 ? productValue27 : 0.0f;
    float comparisonValue5 = intermediateValue16 ? productValue28 : 0.0f;
#endif
    bool conditionValue5 = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float reinterpretedBits = asfloat(multiplyAddValue50 & comparisonValue29);
    float reinterpretedBits1 = asfloat(multiplyAddValue51 & comparisonValue29);
    float reinterpretedBits2 = asfloat(multiplyAddValue52 & comparisonValue29);
    fragmentColor0.x = conditionValue5 ? (reinterpretedBits * 0.0033142860047519207000732421875f) : reinterpretedBits;
    fragmentColor0.y = conditionValue5 ? (reinterpretedBits1 * 0.0033142860047519207000732421875f) : reinterpretedBits1;
    fragmentColor0.z = conditionValue5 ? (reinterpretedBits2 * 0.0033142860047519207000732421875f) : reinterpretedBits2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = conditionValue5 ? (comparisonValue3 * 0.0033142860047519207000732421875f) : comparisonValue3;
    fragmentColor0.y = conditionValue5 ? (comparisonValue4 * 0.0033142860047519207000732421875f) : comparisonValue4;
    fragmentColor0.z = conditionValue5 ? (comparisonValue5 * 0.0033142860047519207000732421875f) : comparisonValue5;
    fragmentColor0.w = ((min(max((multiplyAddValue6 + 1.0f) * 0.5f, RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y), RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x) - RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y) / ((RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.x + 9.9999997473787516355514526367188e-06f) - RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS.y)) * (intermediateValue16 ? varyingColor0.w : 0.0f);
#endif
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingColor0 = stage_input.varyingColor0;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingFragmentPosition0 = stage_input.varyingFragmentPosition0;
#endif
    varyingNormal0 = stage_input.varyingNormal0;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord0 = stage_input.varyingTexCoord0;
#endif
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
