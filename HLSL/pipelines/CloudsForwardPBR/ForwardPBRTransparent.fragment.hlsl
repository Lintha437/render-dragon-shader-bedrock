// CloudsForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 1
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
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float clampedValue = clamp((sqrt(scalarValue) / RD_UNIFORM_DISTANCE_CONTROL.x) - 0.89999997615814208984375f, 0.0f, 1.0f);
    float productValue = ((RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) * varyingColor0.x) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
    float productValue1 = ((RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) * varyingColor0.y) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
    float productValue2 = ((RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) * varyingColor0.z) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue7;
    float multiplyAddValue8;
    float multiplyAddValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint scalarValue1 = uint(varyingTexCoord4);
    float clampedValue6 = clamp(max((sqrt(((varyingTexCoord3.y * varyingTexCoord3.y) + (varyingTexCoord3.x * varyingTexCoord3.x)) + (varyingTexCoord3.z * varyingTexCoord3.z)) / RD_UNIFORM_DISTANCE_CONTROL.x) + (-0.89999997615814208984375f), 0.0f), 0.0f, 1.0f);
    float productValue34 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
    float productValue35 = (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * varyingColor0.x) * productValue34;
    float productValue36 = (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * varyingColor0.y) * productValue34;
    float productValue37 = (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * varyingColor0.z) * productValue34;
    float multiplyAddValue52 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue53 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue54 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.z * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue55 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue56 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue55, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue54, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue53, multiplyAddValue52 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float multiplyAddValue57 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue55, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue54, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue53, multiplyAddValue52 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x))) / multiplyAddValue56;
    float multiplyAddValue58 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue55, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue54, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue53, multiplyAddValue52 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y))) / multiplyAddValue56;
    float multiplyAddValue59 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue55, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue54, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue53, multiplyAddValue52 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z))) / multiplyAddValue56;
    float productValue7;
    float productValue8;
    float productValue9;
#endif
    if (RD_UNIFORM_CLOUD_LIGHTING_TOGGLES.z != 0.0f)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, varyingNormal0.x, varyingNormal0.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.x));
        float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, varyingNormal0.x, varyingNormal0.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.y));
        float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, varyingNormal0.x, varyingNormal0.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.z));
        float inverseLengthValue = rsqrt(scalarValue);
        float productValue3 = inverseLengthValue * varyingTexCoord3.x;
        float productValue4 = inverseLengthValue * varyingTexCoord3.z;
        float productValue5 = inverseLengthValue * varyingTexCoord3.y;
        bool conditionValue = productValue4 > 0.0f;
        bool conditionValue1 = productValue3 > 0.0f;
        float sumValue = RD_UNIFORM_WORLD_ORIGIN.y - varyingTexCoord3.y;
        bool conditionValue2 = productValue4 < 0.0f;
        bool conditionValue3 = productValue3 < 0.0f;
        float comparisonValue = (productValue5 > 0.0f) ? min((sumValue + 196.3300018310546875f) / productValue5, 16.0f) : ((productValue5 < 0.0f) ? min((sumValue + 192.3300018310546875f) / productValue5, 16.0f) : 16.0f);
        uint scalarValue1 = uint(varyingTexCoord4);
        bool comparisonValue1 = (scalarValue1 & 64u) != 0u;
        bool comparisonValue2 = (scalarValue1 & 2u) != 0u;
        bool comparisonValue3 = (scalarValue1 & 16u) != 0u;
        bool comparisonValue4 = (scalarValue1 & 8u) != 0u;
        float comparisonValue5 = conditionValue ? ((16.0f - varyingTexCoord5.y) / productValue4) : (conditionValue2 ? ((-varyingTexCoord5.y) / productValue4) : 16.0f);
        bool bitwiseValue4 = ((!conditionValue) && (comparisonValue2 && conditionValue2)) || (comparisonValue1 && conditionValue);
        float comparisonValue6 = conditionValue1 ? ((16.0f - varyingTexCoord5.x) / productValue3) : (conditionValue3 ? ((-varyingTexCoord5.x) / productValue3) : 16.0f);
        bool bitwiseValue5 = (comparisonValue3 && conditionValue1) || ((!conditionValue1) && (conditionValue3 && comparisonValue4));
        bool conditionValue4 = comparisonValue5 < comparisonValue6;
        bool conditionValue5 = comparisonValue6 < comparisonValue5;
        float comparisonValue7 = conditionValue4 ? (bitwiseValue4 ? comparisonValue : min(comparisonValue, comparisonValue5)) : (conditionValue5 ? (bitwiseValue5 ? comparisonValue : min(comparisonValue, comparisonValue6)) : comparisonValue);
        float intermediateValue24;
        if ((!(conditionValue4 || ((!bitwiseValue5) && conditionValue5))) || (conditionValue4 && bitwiseValue4))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float multiplyAddValue60 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, varyingNormal0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.x * varyingNormal0.x));
        float multiplyAddValue61 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, varyingNormal0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.y * varyingNormal0.x));
        float multiplyAddValue62 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingNormal0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, varyingNormal0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.z * varyingNormal0.x));
        float inverseLengthValue7 = rsqrt(dot(float3(varyingTexCoord3.x, varyingTexCoord3.y, varyingTexCoord3.z), float3(varyingTexCoord3.x, varyingTexCoord3.y, varyingTexCoord3.z)));
        float productValue38 = inverseLengthValue7 * varyingTexCoord3.x;
        float productValue39 = inverseLengthValue7 * varyingTexCoord3.y;
        float productValue40 = inverseLengthValue7 * varyingTexCoord3.z;
        float quotientValue;
        if (productValue39 > 0.0f)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float comparisonValue8;
            if (conditionValue1 && conditionValue)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            quotientValue = min(16.0f, ((196.3300018310546875f - varyingTexCoord3.y) + RD_UNIFORM_WORLD_ORIGIN.y) / productValue39);
        }
        else
        {
            float branchMergedValue;
            if (productValue39 < 0.0f)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                comparisonValue8 = ((scalarValue1 & 128u) != 0u) ? comparisonValue7 : min(max(comparisonValue5, comparisonValue6), comparisonValue7);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue = min(16.0f, ((192.3300018310546875f - varyingTexCoord3.y) + RD_UNIFORM_WORLD_ORIGIN.y) / productValue39);
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                float scalarValue2 = min(max(comparisonValue5, comparisonValue6), comparisonValue7);
                comparisonValue8 = (conditionValue2 && conditionValue1) ? (((scalarValue1 & 4u) != 0u) ? comparisonValue7 : scalarValue2) : ((conditionValue3 && conditionValue) ? (((scalarValue1 & 32u) != 0u) ? comparisonValue7 : scalarValue2) : ((conditionValue3 && conditionValue2) ? (((scalarValue1 & 1u) != 0u) ? comparisonValue7 : scalarValue2) : comparisonValue7));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue = 16.0f;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue24 = comparisonValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            quotientValue = branchMergedValue;
        }
        bool conditionValue15 = productValue40 > 0.0f;
        float quotientValue1;
        uint bitwiseValue;
        if (conditionValue15)
        {
            quotientValue1 = (16.0f - varyingTexCoord5.y) / productValue40;
            bitwiseValue = (scalarValue1 >> 6u) & 1u;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue24 = comparisonValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint branchMergedValue2;
            float branchMergedValue17;
            if (productValue40 < 0.0f)
            {
                branchMergedValue2 = (scalarValue1 >> 1u) & 1u;
                branchMergedValue17 = ((-0.0f) - varyingTexCoord5.y) / productValue40;
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
        float scalarValue3 = max(intermediateValue24, 0.0f);
        float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x, RD_UNIFORM_VIEW_MATRIX_ROW_1.x * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y)));
        float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x, RD_UNIFORM_VIEW_MATRIX_ROW_1.y * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y)));
        float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x, RD_UNIFORM_VIEW_MATRIX_ROW_1.z * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y)));
        float3 vectorValue1 = float3(multiplyAddValue10, multiplyAddValue11, multiplyAddValue12);
        float inverseLengthValue1 = rsqrt(rdDot3Precise(vectorValue1, vectorValue1));
        float productValue6 = (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x;
        float productValue10 = (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x;
        float productValue11 = (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x;
        bool comparisonValue9 = RD_UNIFORM_CLOUD_LIGHTING_TOGGLES.x != 0.0f;
        float3 productValue12 = float3(inverseLengthValue1 * multiplyAddValue10, inverseLengthValue1 * multiplyAddValue11, inverseLengthValue1 * multiplyAddValue12);
        float multiplyAddValue16;
        float multiplyAddValue17;
        float multiplyAddValue18;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        bool conditionValue16 = productValue38 > 0.0f;
        float quotientValue2;
        uint bitwiseValue1;
        if (conditionValue16)
        {
            quotientValue2 = (16.0f - varyingTexCoord5.x) / productValue38;
            bitwiseValue1 = (scalarValue1 >> 4u) & 1u;
        }
        else
        {
            uint branchMergedValue4;
            float branchMergedValue18;
            if (productValue38 < 0.0f)
            {
                branchMergedValue4 = (scalarValue1 >> 3u) & 1u;
                branchMergedValue18 = ((-0.0f) - varyingTexCoord5.x) / productValue38;
            }
            else
            {
                branchMergedValue4 = 0u;
                branchMergedValue18 = 16.0f;
            }
            quotientValue2 = branchMergedValue18;
            bitwiseValue1 = branchMergedValue4;
        }
        float intermediateValue17;
        bool intermediateValue18;
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
            intermediateValue17 = branchMergedValue19;
            intermediateValue18 = branchMergedValue5;
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
            intermediateValue17 = branchMergedValue20;
            intermediateValue18 = branchMergedValue6;
        }
        float intermediateValue19;
        if (intermediateValue18)
        {
            float branchMergedValue7;
            if (conditionValue16 && conditionValue15)
            {
                float branchMergedValue27;
                if ((scalarValue1 & 128u) == 0u)
                {
                    branchMergedValue27 = min(intermediateValue17, max(quotientValue2, quotientValue1));
                }
                else
                {
                    branchMergedValue27 = intermediateValue17;
                }
                branchMergedValue7 = branchMergedValue27;
            }
            else
            {
                float branchMergedValue28;
                if (conditionValue16 && (productValue40 < 0.0f))
                {
                    float branchMergedValue31;
                    if ((scalarValue1 & 4u) == 0u)
                    {
                        branchMergedValue31 = min(intermediateValue17, max(quotientValue2, quotientValue1));
                    }
                    else
                    {
                        branchMergedValue31 = intermediateValue17;
                    }
                    branchMergedValue28 = branchMergedValue31;
                }
                else
                {
                    float branchMergedValue32;
                    if ((productValue38 < 0.0f) && conditionValue15)
                    {
                        float branchMergedValue35;
                        if ((scalarValue1 & 32u) == 0u)
                        {
                            branchMergedValue35 = min(intermediateValue17, max(quotientValue2, quotientValue1));
                        }
                        else
                        {
                            branchMergedValue35 = intermediateValue17;
                        }
                        branchMergedValue32 = branchMergedValue35;
                    }
                    else
                    {
                        float branchMergedValue36;
                        if (((scalarValue1 & 1u) != 0u) || ((!(productValue40 < 0.0f)) || (!(productValue38 < 0.0f))))
                        {
                            branchMergedValue36 = intermediateValue17;
                        }
                        else
                        {
                            branchMergedValue36 = min(intermediateValue17, max(quotientValue2, quotientValue1));
                        }
                        branchMergedValue32 = branchMergedValue36;
                    }
                    branchMergedValue28 = branchMergedValue32;
                }
                branchMergedValue7 = branchMergedValue28;
            }
            intermediateValue19 = branchMergedValue7;
        }
        else
        {
            intermediateValue19 = intermediateValue17;
        }
        float scalarValue17 = min(max(intermediateValue19, 0.0f), 16.0f);
        float multiplyAddValue63 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
        float multiplyAddValue64 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
        float multiplyAddValue65 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
        float inverseLengthValue8 = rsqrt(dot(float3(multiplyAddValue63, multiplyAddValue64, multiplyAddValue65), float3(multiplyAddValue63, multiplyAddValue64, multiplyAddValue65)));
        float productValue41 = inverseLengthValue8 * multiplyAddValue63;
        float productValue42 = inverseLengthValue8 * multiplyAddValue64;
        float productValue43 = inverseLengthValue8 * multiplyAddValue65;
        float productValue44 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w;
        float productValue45 = productValue44 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x;
        float productValue46 = productValue44 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y;
        float productValue50 = productValue44 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z;
        float productValue47;
        float productValue48;
        float productValue49;
#endif
        if (RD_UNIFORM_CLOUD_LIGHTING_TOGGLES.y != 0.0f)
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue13 = mad(productValue4 * scalarValue3, 0.5f, varyingTexCoord5.y);
            float multiplyAddValue14 = mad(productValue3 * scalarValue3, 0.5f, varyingTexCoord5.x);
            float3 vectorValue2 = float3(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xyz);
            float inverseLengthValue2 = rsqrt(rdDot3Precise(vectorValue2, vectorValue2));
            float productValue13 = inverseLengthValue2 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y;
            float productValue14 = inverseLengthValue2 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z;
            float productValue15 = inverseLengthValue2 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x;
            bool conditionValue6 = productValue14 > 0.0f;
            bool conditionValue7 = productValue15 > 0.0f;
            float multiplyAddValue15 = RD_UNIFORM_WORLD_ORIGIN.y - mad(productValue5 * scalarValue3, 0.5f, varyingTexCoord3.y);
            bool conditionValue8 = productValue14 < 0.0f;
            bool conditionValue9 = productValue15 < 0.0f;
            float comparisonValue10 = (productValue13 > 0.0f) ? min((multiplyAddValue15 + 196.3300018310546875f) / productValue13, 16.0f) : ((productValue13 < 0.0f) ? min((multiplyAddValue15 + 192.3300018310546875f) / productValue13, 16.0f) : 16.0f);
            float comparisonValue11 = conditionValue6 ? ((16.0f - multiplyAddValue13) / productValue14) : (conditionValue8 ? ((-multiplyAddValue13) / productValue14) : 16.0f);
            bool bitwiseValue6 = ((!conditionValue6) && (comparisonValue2 && conditionValue8)) || (conditionValue6 && comparisonValue1);
            float comparisonValue12 = conditionValue7 ? ((16.0f - multiplyAddValue14) / productValue15) : (conditionValue9 ? ((-multiplyAddValue14) / productValue15) : 16.0f);
            bool bitwiseValue7 = ((!conditionValue7) && (conditionValue9 && comparisonValue4)) || (conditionValue7 && comparisonValue3);
            bool conditionValue10 = comparisonValue11 < comparisonValue12;
            bool conditionValue11 = comparisonValue12 < comparisonValue11;
            float comparisonValue13 = conditionValue10 ? (bitwiseValue6 ? comparisonValue10 : min(comparisonValue10, comparisonValue11)) : (conditionValue11 ? (bitwiseValue7 ? comparisonValue10 : min(comparisonValue12, comparisonValue10)) : comparisonValue10);
            float intermediateValue42;
            if ((!(((!bitwiseValue7) && conditionValue11) || conditionValue10)) || (conditionValue10 && bitwiseValue6))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue54 = scalarValue17 * 0.5f;
            float productValue55 = productValue54 * inverseLengthValue7;
            float productValue56 = (productValue55 * varyingTexCoord3.y) + varyingTexCoord3.y;
            float productValue57 = (productValue55 * varyingTexCoord3.x) + varyingTexCoord5.x;
            float productValue58 = (productValue55 * varyingTexCoord3.z) + varyingTexCoord5.y;
            float inverseLengthValue9 = rsqrt(dot(float3(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xyz), float3(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xyz)));
            float productValue59 = inverseLengthValue9 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x;
            float productValue60 = inverseLengthValue9 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y;
            float productValue61 = inverseLengthValue9 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z;
            float quotientValue3;
            if (productValue60 > 0.0f)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                float comparisonValue15;
                if (conditionValue7 && conditionValue6)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                quotientValue3 = min(16.0f, ((196.3300018310546875f - productValue56) + RD_UNIFORM_WORLD_ORIGIN.y) / productValue60);
            }
            else
            {
                float branchMergedValue8;
                if (productValue60 < 0.0f)
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    comparisonValue15 = ((scalarValue1 & 128u) != 0u) ? comparisonValue13 : min(max(comparisonValue11, comparisonValue12), comparisonValue13);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue8 = min(16.0f, ((192.3300018310546875f - productValue56) + RD_UNIFORM_WORLD_ORIGIN.y) / productValue60);
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    float scalarValue4 = min(max(comparisonValue11, comparisonValue12), comparisonValue13);
                    comparisonValue15 = (conditionValue7 && conditionValue8) ? (((scalarValue1 & 4u) != 0u) ? comparisonValue13 : scalarValue4) : ((conditionValue6 && conditionValue9) ? (((scalarValue1 & 32u) != 0u) ? comparisonValue13 : scalarValue4) : ((conditionValue9 && conditionValue8) ? (((scalarValue1 & 1u) != 0u) ? comparisonValue13 : scalarValue4) : comparisonValue13));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue8 = 16.0f;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue42 = comparisonValue15;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                quotientValue3 = branchMergedValue8;
            }
            bool conditionValue17 = productValue61 > 0.0f;
            float quotientValue4;
            uint bitwiseValue2;
            if (conditionValue17)
            {
                quotientValue4 = (16.0f - productValue58) / productValue61;
                bitwiseValue2 = (scalarValue1 >> 6u) & 1u;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue42 = comparisonValue13;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float branchMergedValue10;
                uint branchMergedValue23;
                if (productValue61 < 0.0f)
                {
                    branchMergedValue10 = ((-0.0f) - productValue58) / productValue61;
                    branchMergedValue23 = (scalarValue1 >> 1u) & 1u;
                }
                else
                {
                    branchMergedValue10 = 16.0f;
                    branchMergedValue23 = 0u;
                }
                quotientValue4 = branchMergedValue10;
                bitwiseValue2 = branchMergedValue23;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            float clampedValue1 = clamp((1.0f / RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.x) * (scalarValue3 * 0.5f), 0.0f, 1.0f);
            float multiplyAddValue19 = mad(-mad(clampedValue1, -2.0f, 3.0f), clampedValue1 * clampedValue1, 1.0f);
            float exponentialValue = exp2(((-max(intermediateValue42, 0.0f)) * RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.w) * 1.44269502162933349609375f);
            float3 vectorValue3 = float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2);
            float inverseLengthValue3 = rsqrt(rdDot3Precise(vectorValue3, vectorValue3));
            float multiplyAddValue20 = rdDot2Precise(rdDot3Precise(productValue12, float3(-(inverseLengthValue3 * multiplyAddValue), -(inverseLengthValue3 * multiplyAddValue1), -(inverseLengthValue3 * multiplyAddValue2))).xx, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y.xx) + mad(RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y, 1.0f);
            float multiplyAddValue21 = (mad(-RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y, 1.0f) * 0.079577468335628509521484375f) / (multiplyAddValue20 * sqrt(multiplyAddValue20));
            multiplyAddValue16 = mad(exponentialValue * (multiplyAddValue21 * productValue11), multiplyAddValue19, productValue2);
            multiplyAddValue17 = mad(exponentialValue * (multiplyAddValue21 * productValue10), multiplyAddValue19, productValue1);
            multiplyAddValue18 = mad(exponentialValue * (multiplyAddValue21 * productValue6), multiplyAddValue19, productValue);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            bool conditionValue18 = productValue59 > 0.0f;
            float quotientValue5;
            uint bitwiseValue3;
            if (conditionValue18)
            {
                quotientValue5 = (16.0f - productValue57) / productValue59;
                bitwiseValue3 = (scalarValue1 >> 4u) & 1u;
            }
            else
            {
                uint branchMergedValue11;
                float branchMergedValue24;
                if (productValue59 < 0.0f)
                {
                    branchMergedValue11 = (scalarValue1 >> 3u) & 1u;
                    branchMergedValue24 = ((-0.0f) - productValue57) / productValue59;
                }
                else
                {
                    branchMergedValue11 = 0u;
                    branchMergedValue24 = 16.0f;
                }
                quotientValue5 = branchMergedValue24;
                bitwiseValue3 = branchMergedValue11;
            }
            float intermediateValue31;
            bool intermediateValue32;
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
                intermediateValue31 = branchMergedValue25;
                intermediateValue32 = branchMergedValue12;
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
                intermediateValue31 = branchMergedValue26;
                intermediateValue32 = branchMergedValue13;
            }
            float intermediateValue33;
            if (intermediateValue32)
            {
                float branchMergedValue14;
                if (conditionValue18 && conditionValue17)
                {
                    float branchMergedValue29;
                    if ((scalarValue1 & 128u) == 0u)
                    {
                        branchMergedValue29 = min(intermediateValue31, max(quotientValue5, quotientValue4));
                    }
                    else
                    {
                        branchMergedValue29 = intermediateValue31;
                    }
                    branchMergedValue14 = branchMergedValue29;
                }
                else
                {
                    float branchMergedValue30;
                    if (conditionValue18 && (productValue61 < 0.0f))
                    {
                        float branchMergedValue33;
                        if ((scalarValue1 & 4u) == 0u)
                        {
                            branchMergedValue33 = min(intermediateValue31, max(quotientValue5, quotientValue4));
                        }
                        else
                        {
                            branchMergedValue33 = intermediateValue31;
                        }
                        branchMergedValue30 = branchMergedValue33;
                    }
                    else
                    {
                        float branchMergedValue34;
                        if ((productValue59 < 0.0f) && conditionValue17)
                        {
                            float branchMergedValue37;
                            if ((scalarValue1 & 32u) == 0u)
                            {
                                branchMergedValue37 = min(intermediateValue31, max(quotientValue5, quotientValue4));
                            }
                            else
                            {
                                branchMergedValue37 = intermediateValue31;
                            }
                            branchMergedValue34 = branchMergedValue37;
                        }
                        else
                        {
                            float branchMergedValue38;
                            if (((scalarValue1 & 1u) != 0u) || ((!(productValue61 < 0.0f)) || (!(productValue59 < 0.0f))))
                            {
                                branchMergedValue38 = intermediateValue31;
                            }
                            else
                            {
                                branchMergedValue38 = min(intermediateValue31, max(quotientValue5, quotientValue4));
                            }
                            branchMergedValue34 = branchMergedValue38;
                        }
                        branchMergedValue30 = branchMergedValue34;
                    }
                    branchMergedValue14 = branchMergedValue30;
                }
                intermediateValue33 = branchMergedValue14;
            }
            else
            {
                intermediateValue33 = intermediateValue31;
            }
            float clampedValue7 = clamp(productValue54 / RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.x, 0.0f, 1.0f);
            float inverseLengthValue10 = rsqrt(dot(float3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54), float3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54)));
            float dotProductValue = (((dot(float3(productValue41, productValue42, productValue43), float3((-0.0f) - (multiplyAddValue52 * inverseLengthValue10), (-0.0f) - (multiplyAddValue53 * inverseLengthValue10), (-0.0f) - (multiplyAddValue54 * inverseLengthValue10))) * 2.0f) + RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y) * RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y) + 1.0f;
            float exponentialValue3 = (((1.0f - (RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y * RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.y)) * 0.079577468335628509521484375f) / (dotProductValue * sqrt(dotProductValue))) * ((1.0f - ((clampedValue7 * clampedValue7) * (3.0f - (clampedValue7 * 2.0f)))) * exp2((min(max(intermediateValue33, 0.0f), 16.0f) * (-1.44269502162933349609375f)) * RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.w));
            productValue47 = (exponentialValue3 * productValue45) + productValue35;
            productValue48 = (exponentialValue3 * productValue46) + productValue36;
            productValue49 = (exponentialValue3 * productValue50) + productValue37;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue16 = productValue2;
            multiplyAddValue17 = productValue1;
            multiplyAddValue18 = productValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue47 = productValue35;
            productValue48 = productValue36;
            productValue49 = productValue37;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float clampedValue2 = clamp((1.0f / RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.x) * scalarValue3, 0.0f, 1.0f);
        float multiplyAddValue22 = mad(-mad(clampedValue2, -2.0f, 3.0f), clampedValue2 * clampedValue2, 1.0f);
        float3 vectorValue4 = float3(multiplyAddValue4, multiplyAddValue5, multiplyAddValue6);
        float sumValue1 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
        float productValue16 = sumValue1 * sumValue1;
        float quotientValue6 = max((rdDot3Precise(vectorValue4, productValue12) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue16, 0.0f);
        float quotientValue7 = max((rdDot3Precise(float3(-multiplyAddValue4, -multiplyAddValue5, -multiplyAddValue6), productValue12) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue16, 0.0f);
        float productValue17 = varyingColor0.x * 0.3183098733425140380859375f;
        float productValue18 = varyingColor0.y * 0.3183098733425140380859375f;
        float productValue19 = varyingColor0.z * 0.3183098733425140380859375f;
        float comparisonValue20;
        float comparisonValue21;
        float comparisonValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue51;
        float productValue52;
        float productValue53;
        if (RD_UNIFORM_CLOUD_LIGHTING_TOGGLES.x != 0.0f)
        {
            float clampedValue8 = clamp(scalarValue17 / RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.x, 0.0f, 1.0f);
            float sumValue1 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
            float productValue16 = sumValue1 * sumValue1;
            float dotProductValue1 = (((max((dot(float3((-0.0f) - multiplyAddValue60, (-0.0f) - multiplyAddValue61, (-0.0f) - multiplyAddValue62), float3(productValue41, productValue42, productValue43)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue16, 0.0f) * (1.0f - ((clampedValue8 * clampedValue8) * (3.0f - (clampedValue8 * 2.0f))))) + max((dot(float3(multiplyAddValue60, multiplyAddValue61, multiplyAddValue62), float3(productValue41, productValue42, productValue43)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue16, 0.0f)) * 0.3183098733425140380859375f) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x;
            productValue51 = productValue47 + ((dotProductValue1 * varyingColor0.x) * productValue45);
            productValue52 = productValue48 + ((dotProductValue1 * varyingColor0.y) * productValue46);
            productValue53 = productValue49 + ((dotProductValue1 * varyingColor0.z) * productValue50);
        }
        else
        {
            productValue51 = productValue47;
            productValue52 = productValue48;
            productValue53 = productValue49;
        }
        float productValue63;
        float productValue64;
        float productValue65;
#endif
        if (RD_UNIFORM_IBL_PARAMETERS.x != 0.0f)
        {
            bool conditionValue12 = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
#if RD_PLATFORM == RD_PLATFORM_SM50
            bool conditionValue13 = RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f;
            float multiplyAddValue23 = conditionValue13 ? (mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x) : multiplyAddValue;
            float multiplyAddValue24 = conditionValue13 ? (mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y) : multiplyAddValue1;
            float multiplyAddValue25 = conditionValue13 ? (mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z) : multiplyAddValue2;
#endif
            float sumValue2 = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
            float sumValue3 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
            float sumValue4 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
#if RD_PLATFORM == RD_PLATFORM_SM50
            float3 vectorValue5 = float3(sumValue2, sumValue3, sumValue4);
            float inverseLengthValue4 = rsqrt(rdDot3Precise(vectorValue5, vectorValue5));
            float productValue20 = inverseLengthValue4 * sumValue2;
            float productValue21 = inverseLengthValue4 * sumValue3;
            float productValue22 = inverseLengthValue4 * sumValue4;
            float3 vectorValue6 = float3(multiplyAddValue23, multiplyAddValue24, multiplyAddValue25);
            float inverseLengthValue5 = rsqrt(rdDot3Precise(vectorValue6, vectorValue6));
            float scalarValue5 = rdDot3Precise(float3(productValue20, productValue21, productValue22), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z));
            float sumValue5 = -(scalarValue5 + scalarValue5);
            float multiplyAddValue29 = mad(varyingNormal0.x, sumValue5, productValue20);
            float multiplyAddValue30 = mad(varyingNormal0.y, sumValue5, productValue21);
            float multiplyAddValue31 = mad(varyingNormal0.z, sumValue5, productValue22);
            float sumValue6 = RD_UNIFORM_IBL_PARAMETERS.y - 1.0f;
            uint sumValue7 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x)) + 2u;
            uint scalarValue6 = uint(abs(int(sumValue7))) % 3u;
            float4 sampledTextureValue = materialTexture6.SampleLevel(textureSampler6, float4(multiplyAddValue29, multiplyAddValue30, multiplyAddValue31, trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x)), sumValue6);
            float4 sampledTextureValue1 = materialTexture6.SampleLevel(textureSampler6, float4(multiplyAddValue29, multiplyAddValue30, multiplyAddValue31, rdSignedBitsToFloat(((sumValue7 & 2147483648u) != 0u) ? (-scalarValue6) : scalarValue6)), sumValue6);
            float scalarValue7 = sampledTextureValue1.x;
            float scalarValue8 = sampledTextureValue1.y;
            float scalarValue9 = sampledTextureValue1.z;
            float multiplyAddValue32 = mad(RD_UNIFORM_IBL_PARAMETERS.w, sampledTextureValue.x - scalarValue7, scalarValue7);
            float multiplyAddValue33 = mad(RD_UNIFORM_IBL_PARAMETERS.w, sampledTextureValue.y - scalarValue8, scalarValue8);
            float multiplyAddValue34 = mad(RD_UNIFORM_IBL_PARAMETERS.w, sampledTextureValue.z - scalarValue9, scalarValue9);
            float comparisonValue14 = (conditionValue12 ? (multiplyAddValue32 * 301.72412109375f) : multiplyAddValue32) * RD_UNIFORM_IBL_PARAMETERS.z;
            float comparisonValue16 = (conditionValue12 ? (multiplyAddValue33 * 301.72412109375f) : multiplyAddValue33) * RD_UNIFORM_IBL_PARAMETERS.z;
            float comparisonValue17 = (conditionValue12 ? (multiplyAddValue34 * 301.72412109375f) : multiplyAddValue34) * RD_UNIFORM_IBL_PARAMETERS.z;
            bool comparisonValue18 = (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f) && (rdDot3Precise(float3(comparisonValue14, comparisonValue16, comparisonValue17), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) < 0.0f);
            float4 sampledTextureValue2 = materialTexture0.Sample(textureSampler0, float2(clamp(rdDot3Precise(vectorValue4, float3(-(multiplyAddValue23 * inverseLengthValue5), -(multiplyAddValue24 * inverseLengthValue5), -(multiplyAddValue25 * inverseLengthValue5))), 0.0f, 1.0f), 0.0f));
            float multiplyAddValue35 = mad(sampledTextureValue2.x, 0.039999999105930328369140625f, sampledTextureValue2.y);
            comparisonValue20 = comparisonValue18 ? 0.0f : (multiplyAddValue35 * comparisonValue17);
            comparisonValue21 = comparisonValue18 ? 0.0f : (multiplyAddValue35 * comparisonValue16);
            comparisonValue22 = comparisonValue18 ? 0.0f : (multiplyAddValue35 * comparisonValue14);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float inverseLengthValue11 = rsqrt(dot(float3(sumValue2, sumValue3, sumValue4), float3(sumValue2, sumValue3, sumValue4)));
            float productValue62 = inverseLengthValue11 * sumValue2;
            float productValue66 = inverseLengthValue11 * sumValue3;
            float productValue67 = inverseLengthValue11 * sumValue4;
            float inverseLengthValue12 = rsqrt(dot(float3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54), float3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54)));
            float dotProductValue2 = dot(float3(productValue62, productValue66, productValue67), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)) * 2.0f;
            float productValue68 = productValue62 - (dotProductValue2 * varyingNormal0.x);
            float productValue69 = productValue66 - (dotProductValue2 * varyingNormal0.y);
            float productValue70 = productValue67 - (dotProductValue2 * varyingNormal0.z);
            float sumValue13 = RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f);
            uint scalarValue18 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
            float4 sampledTextureValue7 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue68, productValue69, productValue70, float(int(scalarValue18))), sumValue13);
            float4 sampledTextureValue8 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue68, productValue69, productValue70, float(int(uint(int(scalarValue18 + 2u) - int(3u) * (int(scalarValue18 + 2u) / int(3u)))))), sumValue13);
            float scalarValue19 = sampledTextureValue8.x;
            float scalarValue20 = sampledTextureValue8.y;
            float scalarValue21 = sampledTextureValue8.z;
            float productValue71 = ((sampledTextureValue7.x - scalarValue19) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue19;
            float productValue72 = ((sampledTextureValue7.y - scalarValue20) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue20;
            float productValue73 = ((sampledTextureValue7.z - scalarValue21) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue21;
            float comparisonValue26 = (conditionValue12 ? (productValue71 * 301.72412109375f) : productValue71) * RD_UNIFORM_IBL_PARAMETERS.z;
            float comparisonValue27 = (conditionValue12 ? (productValue72 * 301.72412109375f) : productValue72) * RD_UNIFORM_IBL_PARAMETERS.z;
            float comparisonValue28 = (conditionValue12 ? (productValue73 * 301.72412109375f) : productValue73) * RD_UNIFORM_IBL_PARAMETERS.z;
            float intermediateValue27;
            float intermediateValue28;
            float intermediateValue29;
            if (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f)
            {
                float branchMergedValue9;
                float branchMergedValue21;
                float branchMergedValue22;
                if (((dot(float3(comparisonValue26, comparisonValue27, comparisonValue28), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= 0.0f) ? 0.0f : 1.0f) == 1.0f)
                {
                    branchMergedValue9 = 0.0f;
                    branchMergedValue21 = 0.0f;
                    branchMergedValue22 = 0.0f;
                }
                else
                {
                    branchMergedValue9 = comparisonValue28;
                    branchMergedValue21 = comparisonValue27;
                    branchMergedValue22 = comparisonValue26;
                }
                intermediateValue27 = branchMergedValue22;
                intermediateValue28 = branchMergedValue21;
                intermediateValue29 = branchMergedValue9;
            }
            else
            {
                intermediateValue27 = comparisonValue26;
                intermediateValue28 = comparisonValue27;
                intermediateValue29 = comparisonValue28;
            }
            float4 sampledTextureValue9 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue60, multiplyAddValue61, multiplyAddValue62), float3((-0.0f) - (multiplyAddValue52 * inverseLengthValue12), (-0.0f) - (multiplyAddValue53 * inverseLengthValue12), (-0.0f) - (multiplyAddValue54 * inverseLengthValue12))), 0.0f, 1.0f), 0.0f));
            float productValue74 = (sampledTextureValue9.x * 0.039999999105930328369140625f) + sampledTextureValue9.y;
            productValue63 = productValue74 * intermediateValue27;
            productValue64 = productValue74 * intermediateValue28;
            productValue65 = productValue74 * intermediateValue29;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            comparisonValue20 = 0.0f;
            comparisonValue21 = 0.0f;
            comparisonValue22 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue63 = 0.0f;
            productValue64 = 0.0f;
            productValue65 = 0.0f;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue7 = mad(comparisonValue20, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z, comparisonValue9 ? mad(productValue11 * mad(quotientValue6, productValue19, multiplyAddValue22 * (quotientValue7 * productValue19)), RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x, multiplyAddValue16) : multiplyAddValue16);
        multiplyAddValue8 = mad(comparisonValue21, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z, comparisonValue9 ? mad(productValue10 * mad(quotientValue6, productValue18, multiplyAddValue22 * (quotientValue7 * productValue18)), RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x, multiplyAddValue17) : multiplyAddValue17);
        multiplyAddValue9 = mad(comparisonValue22, RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z, comparisonValue9 ? mad(productValue6 * mad(quotientValue6, productValue17, multiplyAddValue22 * (quotientValue7 * productValue17)), RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x, multiplyAddValue18) : multiplyAddValue18);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue7 = (RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z * productValue63) + productValue51;
        productValue8 = (RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z * productValue64) + productValue52;
        productValue9 = (RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS.z * productValue65) + productValue53;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue7 = productValue2;
        multiplyAddValue8 = productValue1;
        multiplyAddValue9 = productValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue7 = productValue35;
        productValue8 = productValue36;
        productValue9 = productValue37;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue39;
    float intermediateValue40;
    float intermediateValue41;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
#endif
    if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue26;
        float multiplyAddValue27;
        float multiplyAddValue28;
        if (clampedValue > 0.0f)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue1;
        float branchMergedValue15;
        float branchMergedValue16;
        if (clampedValue6 > 0.0f)
#endif
        {
            float sumValue8 = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
            float sumValue9 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
            float sumValue10 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
#if RD_PLATFORM == RD_PLATFORM_SM50
            float3 vectorValue7 = float3(sumValue8, sumValue9, sumValue10);
            float inverseLengthValue6 = rsqrt(rdDot3Precise(vectorValue7, vectorValue7));
            float sumValue11 = RD_UNIFORM_FOG_SKY_BLEND.w - RD_UNIFORM_FOG_SKY_BLEND.x;
            float multiplyAddValue36 = mad(sumValue9, inverseLengthValue6, sumValue11);
            float clampedValue3 = clamp((1.0f / (sumValue11 + (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.w))) * multiplyAddValue36, 0.0f, 1.0f);
            float multiplyAddValue37 = mad(-mad(clampedValue3, -2.0f, 3.0f), clampedValue3 * clampedValue3, 1.0f);
            float productValue23 = multiplyAddValue37 * (multiplyAddValue37 * multiplyAddValue37);
            float3 productValue24 = float3(sumValue8 * inverseLengthValue6, sumValue9 * inverseLengthValue6, sumValue10 * inverseLengthValue6);
            float scalarValue10 = rdDot3Precise(productValue24, float3(RD_UNIFORM_SUN_DIR.xyz));
            float scalarValue11 = rdDot3Precise(productValue24, float3(RD_UNIFORM_MOON_DIR.xyz));
            float clampedValue4 = clamp((1.0f / (sumValue11 + RD_UNIFORM_FOG_SKY_BLEND.y)) * multiplyAddValue36, 0.0f, 1.0f);
            float multiplyAddValue38 = mad(-mad(clampedValue4, -2.0f, 3.0f), clampedValue4 * clampedValue4, 1.0f);
            float productValue25 = multiplyAddValue38 * (multiplyAddValue38 * multiplyAddValue38);
            float multiplyAddValue39 = mad(mad(scalarValue10, scalarValue10, 1.0f) * RD_UNIFORM_SUN_COLOR.w, 0.75f, (mad(scalarValue11, scalarValue11, 1.0f) * RD_UNIFORM_MOON_COLOR.w) * 0.75f);
            float exponentialValue1 = min(exp2(log2(max(scalarValue10, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 1.0f);
            float exponentialValue2 = min(exp2(log2(max(scalarValue11, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 1.0f);
            float multiplyAddValue40 = mad(-exponentialValue1, 1.7999999523162841796875f, 1.809999942779541015625f);
            float multiplyAddValue41 = mad(-exponentialValue2, 1.7999999523162841796875f, 1.809999942779541015625f);
            float nonlinearValue = 0.0361000001430511474609375f / (sqrt(multiplyAddValue40) * multiplyAddValue40);
            float nonlinearValue1 = 0.0361000001430511474609375f / (sqrt(multiplyAddValue41) * multiplyAddValue41);
            multiplyAddValue26 = mad(clampedValue, mad((mad(productValue25, RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x, RD_UNIFORM_SKY_ZENITH_COLOR.x) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.x) * 0.079577468335628509521484375f, multiplyAddValue39, mad(exponentialValue1 * ((RD_UNIFORM_SUN_COLOR.x * RD_UNIFORM_SUN_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.y), nonlinearValue, nonlinearValue1 * (exponentialValue2 * ((RD_UNIFORM_MOON_COLOR.x * RD_UNIFORM_MOON_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.z))) * ((productValue23 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * 0.079577468335628509521484375f)) - multiplyAddValue9, multiplyAddValue9);
            multiplyAddValue27 = mad(clampedValue, mad((mad(productValue25, RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y, RD_UNIFORM_SKY_ZENITH_COLOR.y) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.x) * 0.079577468335628509521484375f, multiplyAddValue39, mad(exponentialValue1 * ((RD_UNIFORM_SUN_COLOR.y * RD_UNIFORM_SUN_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.y), nonlinearValue, nonlinearValue1 * (exponentialValue2 * ((RD_UNIFORM_MOON_COLOR.y * RD_UNIFORM_MOON_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.z))) * ((productValue23 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * 0.079577468335628509521484375f)) - multiplyAddValue8, multiplyAddValue8);
            multiplyAddValue28 = mad(clampedValue, mad((mad(productValue25, RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z, RD_UNIFORM_SKY_ZENITH_COLOR.z) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.x) * 0.079577468335628509521484375f, multiplyAddValue39, mad(exponentialValue1 * ((RD_UNIFORM_SUN_COLOR.z * RD_UNIFORM_SUN_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.y), nonlinearValue, nonlinearValue1 * (exponentialValue2 * ((RD_UNIFORM_MOON_COLOR.z * RD_UNIFORM_MOON_COLOR.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.z))) * ((productValue23 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * 0.079577468335628509521484375f)) - multiplyAddValue7, multiplyAddValue7);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float inverseLengthValue13 = rsqrt(dot(float3(sumValue8, sumValue9, sumValue10), float3(sumValue8, sumValue9, sumValue10)));
            float productValue75 = inverseLengthValue13 * sumValue8;
            float productValue76 = inverseLengthValue13 * sumValue9;
            float productValue77 = inverseLengthValue13 * sumValue10;
            float clampedValue9 = clamp(((RD_UNIFORM_FOG_SKY_BLEND.w - RD_UNIFORM_FOG_SKY_BLEND.x) + productValue76) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
            float productValue78 = 1.0f - ((clampedValue9 * clampedValue9) * (3.0f - (clampedValue9 * 2.0f)));
            float productValue79 = (productValue78 * productValue78) * productValue78;
            float dotProductValue3 = dot(float3(productValue75, productValue76, productValue77), float3(RD_UNIFORM_SUN_DIR.xyz));
            float dotProductValue4 = dot(float3(productValue75, productValue76, productValue77), float3(RD_UNIFORM_MOON_DIR.xyz));
            float sumValue14 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
            float clampedValue10 = clamp((productValue76 - sumValue14) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue14), 0.0f, 1.0f);
            float productValue80 = 1.0f - ((clampedValue10 * clampedValue10) * (3.0f - (clampedValue10 * 2.0f)));
            float productValue81 = (productValue80 * productValue80) * productValue80;
            float productValue82 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue4 * dotProductValue4) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue3 * dotProductValue3) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
            float clampedValue11 = clamp(exp2(log2(max(dotProductValue3, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
            float clampedValue12 = clamp(exp2(log2(max(dotProductValue4, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
            float productValue83 = 1.809999942779541015625f - (clampedValue11 * 1.7999999523162841796875f);
            float nonlinearValue2 = 0.036100022494792938232421875f / (sqrt(productValue83) * productValue83);
            float productValue84 = 1.809999942779541015625f - (clampedValue12 * 1.7999999523162841796875f);
            float nonlinearValue3 = 0.036100022494792938232421875f / (sqrt(productValue84) * productValue84);
            float productValue85 = clampedValue11 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
            float productValue86 = clampedValue12 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
            branchMergedValue1 = ((((((productValue79 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue86 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue3) + ((productValue85 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue2))) + (((productValue81 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue82)) * 0.079577468335628509521484375f) - productValue7) * clampedValue6) + productValue7;
            branchMergedValue15 = ((((((productValue79 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue86 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue3) + ((productValue85 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue2))) + (((productValue81 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue82)) * 0.079577468335628509521484375f) - productValue9) * clampedValue6) + productValue9;
            branchMergedValue16 = ((((((productValue79 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue86 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue3) + ((productValue85 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue2))) + (((productValue81 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue82)) * 0.079577468335628509521484375f) - productValue8) * clampedValue6) + productValue8;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue26 = multiplyAddValue9;
            multiplyAddValue27 = multiplyAddValue8;
            multiplyAddValue28 = multiplyAddValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue1 = productValue7;
            branchMergedValue15 = productValue9;
            branchMergedValue16 = productValue8;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue39 = multiplyAddValue28;
        intermediateValue40 = multiplyAddValue27;
        intermediateValue41 = multiplyAddValue26;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue2 = branchMergedValue1;
        intermediateValue3 = branchMergedValue16;
        intermediateValue4 = branchMergedValue15;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue39 = mad(clampedValue, RD_UNIFORM_FOG_COLOR.z - multiplyAddValue7, multiplyAddValue7);
        intermediateValue40 = mad(clampedValue, RD_UNIFORM_FOG_COLOR.y - multiplyAddValue8, multiplyAddValue8);
        intermediateValue41 = mad(clampedValue, RD_UNIFORM_FOG_COLOR.x - multiplyAddValue9, multiplyAddValue9);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue2 = ((RD_UNIFORM_FOG_COLOR.x - productValue7) * clampedValue6) + productValue7;
        intermediateValue3 = ((RD_UNIFORM_FOG_COLOR.y - productValue8) * clampedValue6) + productValue8;
        intermediateValue4 = ((RD_UNIFORM_FOG_COLOR.z - productValue9) * clampedValue6) + productValue9;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    bool comparisonValue19 = RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f;
    float multiplyAddValue49;
    float multiplyAddValue50;
    float multiplyAddValue51;
    float intermediateValue58;
    float intermediateValue59;
    float intermediateValue60;
    if (comparisonValue19)
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
        float multiplyAddValue42 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w)));
        float multiplyAddValue43 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x))) / multiplyAddValue42;
        float multiplyAddValue44 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y))) / multiplyAddValue42;
        float multiplyAddValue45 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z))) / multiplyAddValue42;
        float productValue32 = (multiplyAddValue43 + 1.0f) * 0.5f;
        float productValue33 = (multiplyAddValue44 + 1.0f) * 0.5f;
        float multiplyAddValue46 = log2(mad((((-(mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue45, mad(RD_UNIFORM_INV_PROJ_ROW_0.z, multiplyAddValue43, multiplyAddValue44 * RD_UNIFORM_INV_PROJ_ROW_1.z)) + RD_UNIFORM_INV_PROJ_ROW_3.z)) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue45, mad(RD_UNIFORM_INV_PROJ_ROW_0.w, multiplyAddValue43, multiplyAddValue44 * RD_UNIFORM_INV_PROJ_ROW_1.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x), 53.598148345947265625f, 1.0f)) * 0.17328679561614990234375f;
        float multiplyAddValue47 = mad(multiplyAddValue46, trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z), -0.5f);
        uint sumValue12 = uint(min(int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z)) - 2u), int(uint(max(int(uint(int(multiplyAddValue47))), int(0u))))));
        float scalarValue12 = rdSignedBitsToFloat(sumValue12);
        float clampedValue5 = clamp(multiplyAddValue47 - scalarValue12, 0.0f, 1.0f);
        float4 sampledTextureValue3 = materialTexture3.SampleLevel(textureSampler3, float3(productValue32, productValue33, scalarValue12), 0.0f);
        float scalarValue13 = sampledTextureValue3.x;
        float scalarValue14 = sampledTextureValue3.y;
        float scalarValue15 = sampledTextureValue3.z;
        float scalarValue16 = sampledTextureValue3.w;
        float4 sampledTextureValue4 = materialTexture3.SampleLevel(textureSampler3, float3(productValue32, productValue33, rdSignedBitsToFloat(sumValue12 + 1u)), 0.0f);
        float multiplyAddValue48 = mad(clampedValue5, sampledTextureValue4.w - scalarValue16, scalarValue16);
        multiplyAddValue49 = mad(multiplyAddValue48, intermediateValue41, mad(clampedValue5, sampledTextureValue4.x - scalarValue13, scalarValue13));
        multiplyAddValue50 = mad(multiplyAddValue48, intermediateValue40, mad(clampedValue5, sampledTextureValue4.y - scalarValue14, scalarValue14));
        multiplyAddValue51 = mad(multiplyAddValue48, intermediateValue39, mad(clampedValue5, sampledTextureValue4.z - scalarValue15, scalarValue15));
        intermediateValue58 = productValue32;
        intermediateValue59 = multiplyAddValue46;
        intermediateValue60 = productValue33;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue87 = (multiplyAddValue57 + 1.0f) * 0.5f;
        float productValue88 = (multiplyAddValue58 + 1.0f) * 0.5f;
        float multiplyAddValue66 = log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue59, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue58, multiplyAddValue57 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue59, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue58, multiplyAddValue57 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f;
        uint scalarValue22 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float productValue89 = (float(int(scalarValue22)) * multiplyAddValue66) + (-0.5f);
        uint sumValue15 = uint(min(int(uint(max(int(uint(int(productValue89))), int(0u)))), int(scalarValue22 + 4294967294u)));
        float scalarValue23 = float(int(sumValue15));
        float sumValue16 = min(max(productValue89 - scalarValue23, 0.0f), 1.0f);
        float4 sampledTextureValue10 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue87, productValue88, scalarValue23), 0.0f);
        float scalarValue24 = sampledTextureValue10.x;
        float scalarValue25 = sampledTextureValue10.y;
        float scalarValue26 = sampledTextureValue10.z;
        float scalarValue27 = sampledTextureValue10.w;
        float4 sampledTextureValue11 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue87, productValue88, float(int(sumValue15 + 1u))), 0.0f);
        float productValue90 = ((sampledTextureValue11.w - scalarValue27) * sumValue16) + scalarValue27;
        productValue26 = (((sampledTextureValue11.x - scalarValue24) * sumValue16) + scalarValue24) + (productValue90 * intermediateValue2);
        productValue27 = (((sampledTextureValue11.y - scalarValue25) * sumValue16) + scalarValue25) + (productValue90 * intermediateValue3);
        productValue28 = (((sampledTextureValue11.z - scalarValue26) * sumValue16) + scalarValue26) + (productValue90 * intermediateValue4);
        intermediateValue11 = productValue87;
        intermediateValue13 = productValue88;
        intermediateValue14 = multiplyAddValue66;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue49 = intermediateValue41;
        multiplyAddValue50 = intermediateValue40;
        multiplyAddValue51 = intermediateValue39;
        intermediateValue58 = multiplyAddValue;
        intermediateValue59 = comparisonValue19 ? asfloat(0xffffffffu ) : 0.0f;
        intermediateValue60 = multiplyAddValue1;
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
    bool conditionValue14 = RD_UNIFORM_SKY_SAMPLES_CONFIG.x > 0.5f;
    bool intermediateValue63;
    bool sampledTextureValue5;
    if (conditionValue14)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool intermediateValue16;
    if (RD_UNIFORM_SKY_SAMPLES_CONFIG.x > 0.5f)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue63 = true;
        sampledTextureValue5 = materialTexture5.SampleLevel(textureSampler5, float3(intermediateValue58, 1.0f - intermediateValue60, (exp2((intermediateValue59 - RD_UNIFORM_SKY_SAMPLES_CONFIG.z) * 5.770780086517333984375f) - 1.0f) * 0.0186573602259159088134765625f), 0.0f).y < RD_UNIFORM_SKY_SAMPLES_CONFIG.w;
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
        intermediateValue63 = !conditionValue14;
        sampledTextureValue5 = false;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue16 = true;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    bool bitwiseValue8 = intermediateValue63 && sampledTextureValue5;
    float comparisonValue23;
    float comparisonValue24;
    float comparisonValue25;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float comparisonValue29 = intermediateValue16 ? productValue26 : 0.0f;
    float comparisonValue30 = intermediateValue16 ? productValue27 : 0.0f;
    float comparisonValue31 = intermediateValue16 ? productValue28 : 0.0f;
    float productValue29;
    float productValue30;
    float productValue31;
#endif
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue6 = (0.180000007152557373046875f / materialTexture1.Sample(textureSampler1, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
        comparisonValue23 = bitwiseValue8 ? 0.0f : (sampledTextureValue6 * multiplyAddValue51);
        comparisonValue24 = bitwiseValue8 ? 0.0f : (sampledTextureValue6 * multiplyAddValue50);
        comparisonValue25 = bitwiseValue8 ? 0.0f : (sampledTextureValue6 * multiplyAddValue49);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue12 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
        productValue29 = sampledTextureValue12 * comparisonValue29;
        productValue30 = sampledTextureValue12 * comparisonValue30;
        productValue31 = sampledTextureValue12 * comparisonValue31;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        comparisonValue23 = bitwiseValue8 ? 0.0f : multiplyAddValue51;
        comparisonValue24 = bitwiseValue8 ? 0.0f : multiplyAddValue50;
        comparisonValue25 = bitwiseValue8 ? 0.0f : multiplyAddValue49;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue29 = comparisonValue29;
        productValue30 = comparisonValue30;
        productValue31 = comparisonValue31;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = comparisonValue25;
    fragmentColor0.y = comparisonValue24;
    fragmentColor0.z = comparisonValue23;
    fragmentColor0.w = bitwiseValue8 ? 0.0f : varyingColor0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = productValue29;
    fragmentColor0.y = productValue30;
    fragmentColor0.z = productValue31;
    fragmentColor0.w = intermediateValue16 ? varyingColor0.w : 0.0f;
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
