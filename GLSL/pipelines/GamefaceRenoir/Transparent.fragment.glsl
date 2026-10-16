#version 460
#extension GL_GOOGLE_include_directive : require
// GamefaceRenoir / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif

#include "../../include/materials/GamefaceRenoir/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint bitwiseValue1 = (uint(varyingTexCoord3.z) << 4u) + ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint scalarValue15 = uint(int(fragmentVectorConstants1.packedValues[bitwiseValue1].y));
    uint scalarValue16 = uint(int(fragmentVectorConstants1.packedValues[bitwiseValue1].x));
    vec2 vectorValue = vec2(varyingTexCoord5.x, varyingTexCoord5.y);
    float scalarValue8 = abs(varyingTexCoord5.x);
    float scalarValue9 = abs(varyingTexCoord5.y);
    precise float quotientValue2 = 1.0 / spvNMax(scalarValue8, scalarValue9);
    precise float productValue10 = quotientValue2 * spvNMin(scalarValue8, scalarValue9);
    precise float productValue11 = productValue10 * productValue10;
    float multiplyAddValue12 = fma(productValue11, fma(productValue11, fma(productValue11, fma(productValue11, 0.02083509974181652069091796875, -0.08513300120830535888671875), 0.1801410019397735595703125), -0.33029949665069580078125), 0.999866008758544921875);
    precise float productValue12 = multiplyAddValue12 * productValue10;
    precise float multiplyAddValue13 = ((varyingTexCoord5.x < 0.0) ? (-3.1415927410125732421875) : 0.0) + fma(productValue10, multiplyAddValue12, (scalarValue8 < scalarValue9) ? fma(productValue12, -2.0, 1.57079637050628662109375) : 0.0);
    precise float comparisonValue3 = (((spvNMin(varyingTexCoord5.x, varyingTexCoord5.y) < 0.0) && (spvNMax(varyingTexCoord5.x, varyingTexCoord5.y) >= 0.0)) ? (-multiplyAddValue13) : multiplyAddValue13) + 3.1415927410125732421875;
    precise float productValue13 = comparisonValue3 * 0.15915493667125701904296875;
    float nonlinearValue1 = ((scalarValue15 & 2u) != 0u) ? varyingTexCoord5.x : (((scalarValue15 & 4u) != 0u) ? sqrt(rdDot2Precise(vectorValue, vectorValue)) : (((scalarValue15 & 8u) != 0u) ? productValue13 : 0.0));
    precise float productValue14 = nonlinearValue1 * 0.5;
    float scalarValue17 = fract(productValue14);
    precise float sumValue11 = scalarValue17 + scalarValue17;
    float multiplyAddValue14 = ((scalarValue15 & 256u) != 0u) ? fract(nonlinearValue1) : (((scalarValue15 & 512u) != 0u) ? ((scalarValue17 < 0.5) ? sumValue11 : fma(-scalarValue17, 2.0, 2.0)) : nonlinearValue1);
    float multiplyAddValue3;
    float multiplyAddValue5;
    float multiplyAddValue7;
    float multiplyAddValue9;
    if ((scalarValue15 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue5 = bitfieldInsert(bitfieldExtract(uint(varyingTexCoord3.y), int(4u), int(4u)), uint(varyingTexCoord3.z), int(4u), int(28u));
    uint scalarValue6 = uint(int(fragmentVectorConstants1.packedValues[scalarValue5].y));
    uint scalarValue7 = uint(int(fragmentVectorConstants1.packedValues[scalarValue5].x));
    vec2 vectorValue = vec2(varyingTexCoord5.x, varyingTexCoord5.y);
    float scalarValue8 = abs(varyingTexCoord5.x);
    float scalarValue9 = abs(varyingTexCoord5.y);
    float quotientValue1 = (1.0 / spvNMax(scalarValue8, scalarValue9)) * spvNMin(scalarValue8, scalarValue9);
    float productValue7 = quotientValue1 * quotientValue1;
    float multiplyAddValue = fma(productValue7, fma(productValue7, fma(productValue7, fma(productValue7, 0.02083509974181652069091796875, -0.08513300120830535888671875), 0.1801410019397735595703125), -0.33029949665069580078125), 0.999866008758544921875);
    float multiplyAddValue1 = fma(quotientValue1, multiplyAddValue, (scalarValue8 < scalarValue9) ? fma(multiplyAddValue * quotientValue1, -2.0, 1.57079637050628662109375) : 0.0);
    float comparisonValue2 = (varyingTexCoord5.x < 0.0) ? (multiplyAddValue1 - 3.1415927410125732421875) : multiplyAddValue1;
    float nonlinearValue = ((scalarValue6 & 2u) != 0u) ? varyingTexCoord5.x : (((scalarValue6 & 4u) != 0u) ? sqrt(rdDot2Precise(vectorValue, vectorValue)) : (((scalarValue6 & 8u) != 0u) ? (((((spvNMin(varyingTexCoord5.x, varyingTexCoord5.y) < 0.0) && (spvNMax(varyingTexCoord5.x, varyingTexCoord5.y) >= 0.0)) ? (-comparisonValue2) : comparisonValue2) + 3.1415927410125732421875) * 0.15915493667125701904296875) : 0.0));
    float productValue8 = fract(nonlinearValue * 0.5);
    float multiplyAddValue2 = ((scalarValue6 & 256u) != 0u) ? fract(nonlinearValue) : (((scalarValue6 & 512u) != 0u) ? ((productValue8 < 0.5) ? (productValue8 + productValue8) : fma(-productValue8, 2.0, 2.0)) : nonlinearValue);
    float multiplyAddValue3;
    float multiplyAddValue5;
    float multiplyAddValue7;
    float multiplyAddValue9;
    if ((scalarValue6 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint bitwiseValue = (uint(varyingTexCoord3.z) << 4u) | ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue = bitwiseValue + 1u;
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[bitwiseValue].y));
    uint scalarValue1 = uint(int(fragmentVectorConstants1.packedValues[bitwiseValue].x));
    float intermediateValue2;
    if ((scalarValue & 2u) == 0u)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        uint sumValue12 = scalarValue16 + 1u;
        float scalarValue18 = spvNClamp(multiplyAddValue14, 0.0, 1.0);
        precise float sumValue13 = fragmentVectorConstants1.packedValues[sumValue12].x - fragmentVectorConstants1.packedValues[scalarValue16].x;
        precise float sumValue14 = fragmentVectorConstants1.packedValues[sumValue12].y - fragmentVectorConstants1.packedValues[scalarValue16].y;
        precise float sumValue15 = fragmentVectorConstants1.packedValues[sumValue12].z - fragmentVectorConstants1.packedValues[scalarValue16].z;
        precise float sumValue16 = fragmentVectorConstants1.packedValues[sumValue12].w - fragmentVectorConstants1.packedValues[scalarValue16].w;
        multiplyAddValue3 = fma(scalarValue18, sumValue16, fragmentVectorConstants1.packedValues[scalarValue16].w);
        multiplyAddValue5 = fma(scalarValue18, sumValue15, fragmentVectorConstants1.packedValues[scalarValue16].z);
        multiplyAddValue7 = fma(scalarValue18, sumValue14, fragmentVectorConstants1.packedValues[scalarValue16].y);
        multiplyAddValue9 = fma(scalarValue18, sumValue13, fragmentVectorConstants1.packedValues[scalarValue16].x);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        uint sumValue6 = scalarValue7 + 1u;
        float scalarValue10 = spvNClamp(multiplyAddValue2, 0.0, 1.0);
        multiplyAddValue3 = fma(scalarValue10, fragmentVectorConstants1.packedValues[sumValue6].w - fragmentVectorConstants1.packedValues[scalarValue7].w, fragmentVectorConstants1.packedValues[scalarValue7].w);
        multiplyAddValue5 = fma(scalarValue10, fragmentVectorConstants1.packedValues[sumValue6].z - fragmentVectorConstants1.packedValues[scalarValue7].z, fragmentVectorConstants1.packedValues[scalarValue7].z);
        multiplyAddValue7 = fma(scalarValue10, fragmentVectorConstants1.packedValues[sumValue6].y - fragmentVectorConstants1.packedValues[scalarValue7].y, fragmentVectorConstants1.packedValues[scalarValue7].y);
        multiplyAddValue9 = fma(scalarValue10, fragmentVectorConstants1.packedValues[sumValue6].x - fragmentVectorConstants1.packedValues[scalarValue7].x, fragmentVectorConstants1.packedValues[scalarValue7].x);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue;
        if ((scalarValue & 4u) == 0u)
        {
            float branchMergedValue6;
            if ((scalarValue & 8u) == 0u)
            {
                branchMergedValue6 = 0.0;
            }
            else
            {
                float quotientValue = atan(varyingTexCoord5.y / varyingTexCoord5.x);
                bool conditionValue = varyingTexCoord5.x < 0.0;
                bool comparisonValue = varyingTexCoord5.x == 0.0;
                bool comparisonValue1 = varyingTexCoord5.y >= 0.0;
                bool conditionValue1 = varyingTexCoord5.y < 0.0;
                branchMergedValue6 = (comparisonValue && comparisonValue1) ? 0.75 : ((comparisonValue && conditionValue1) ? 0.25 : ((((conditionValue && conditionValue1) ? (quotientValue + (-3.1415927410125732421875)) : ((conditionValue && comparisonValue1) ? (quotientValue + 3.1415927410125732421875) : quotientValue)) + 3.1415927410125732421875) * 0.15915493667125701904296875));
            }
            branchMergedValue = branchMergedValue6;
        }
        else
        {
            branchMergedValue = sqrt((varyingTexCoord5.y * varyingTexCoord5.y) + (varyingTexCoord5.x * varyingTexCoord5.x));
        }
        intermediateValue2 = branchMergedValue;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        float multiplyAddValue4;
        float multiplyAddValue6;
        float multiplyAddValue8;
        float multiplyAddValue10;
        if ((scalarValue15 & 32u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue4;
        float multiplyAddValue6;
        float multiplyAddValue8;
        float multiplyAddValue10;
        if ((scalarValue6 & 32u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue2 = varyingTexCoord5.x;
    }
    float intermediateValue5;
    if ((scalarValue & 256u) == 0u)
    {
        float branchMergedValue1;
        if ((scalarValue & 512u) == 0u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float multiplyAddValue15 = fma(-multiplyAddValue14, 2.0, 1.0);
            float scalarValue19 = spvNClamp(multiplyAddValue15, 0.0, 1.0);
            precise float sumValue17 = 1.0 - spvNMin(abs(multiplyAddValue15), 1.0);
            uint sumValue18 = scalarValue16 + 1u;
            uint sumValue19 = scalarValue16 + 2u;
            precise float productValue15 = sumValue17 * fragmentVectorConstants1.packedValues[sumValue18].x;
            precise float productValue16 = sumValue17 * fragmentVectorConstants1.packedValues[sumValue18].y;
            precise float productValue17 = sumValue17 * fragmentVectorConstants1.packedValues[sumValue18].z;
            precise float productValue18 = sumValue17 * fragmentVectorConstants1.packedValues[sumValue18].w;
            float scalarValue20 = spvNClamp(-multiplyAddValue15, 0.0, 1.0);
            multiplyAddValue10 = fma(scalarValue20, fragmentVectorConstants1.packedValues[sumValue19].x, fma(scalarValue19, fragmentVectorConstants1.packedValues[scalarValue16].x, productValue15));
            multiplyAddValue8 = fma(scalarValue20, fragmentVectorConstants1.packedValues[sumValue19].y, fma(scalarValue19, fragmentVectorConstants1.packedValues[scalarValue16].y, productValue16));
            multiplyAddValue6 = fma(scalarValue20, fragmentVectorConstants1.packedValues[sumValue19].z, fma(scalarValue19, fragmentVectorConstants1.packedValues[scalarValue16].z, productValue17));
            multiplyAddValue4 = fma(scalarValue20, fragmentVectorConstants1.packedValues[sumValue19].w, fma(scalarValue19, fragmentVectorConstants1.packedValues[scalarValue16].w, productValue18));
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue11 = fma(-multiplyAddValue2, 2.0, 1.0);
            float scalarValue11 = spvNClamp(multiplyAddValue11, 0.0, 1.0);
            float sumValue7 = 1.0 - spvNMin(abs(multiplyAddValue11), 1.0);
            uint sumValue8 = scalarValue7 + 1u;
            uint sumValue9 = scalarValue7 + 2u;
            float scalarValue12 = spvNClamp(-multiplyAddValue11, 0.0, 1.0);
            multiplyAddValue10 = fma(scalarValue12, fragmentVectorConstants1.packedValues[sumValue9].x, fma(scalarValue11, fragmentVectorConstants1.packedValues[scalarValue7].x, sumValue7 * fragmentVectorConstants1.packedValues[sumValue8].x));
            multiplyAddValue8 = fma(scalarValue12, fragmentVectorConstants1.packedValues[sumValue9].y, fma(scalarValue11, fragmentVectorConstants1.packedValues[scalarValue7].y, sumValue7 * fragmentVectorConstants1.packedValues[sumValue8].y));
            multiplyAddValue6 = fma(scalarValue12, fragmentVectorConstants1.packedValues[sumValue9].z, fma(scalarValue11, fragmentVectorConstants1.packedValues[scalarValue7].z, sumValue7 * fragmentVectorConstants1.packedValues[sumValue8].z));
            multiplyAddValue4 = fma(scalarValue12, fragmentVectorConstants1.packedValues[sumValue9].w, fma(scalarValue11, fragmentVectorConstants1.packedValues[scalarValue7].w, sumValue7 * fragmentVectorConstants1.packedValues[sumValue8].w));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue1 = intermediateValue2;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float intermediateValue25;
            float intermediateValue26;
            float intermediateValue27;
            float intermediateValue28;
            if ((scalarValue15 & 64u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float intermediateValue21;
            float intermediateValue22;
            float intermediateValue23;
            float intermediateValue24;
            if ((scalarValue6 & 64u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue = fract(intermediateValue2 * 0.5) * 2.0;
            branchMergedValue1 = (productValue < 1.0) ? productValue : (2.0 - productValue);
        }
        intermediateValue5 = branchMergedValue1;
    }
    else
    {
        intermediateValue5 = fract(intermediateValue2);
    }
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue & 16u) == 0u)
    {
        float branchMergedValue2;
        float branchMergedValue3;
        float branchMergedValue4;
        float branchMergedValue5;
        if ((scalarValue & 32u) == 0u)
        {
            float branchMergedValue7;
            float branchMergedValue8;
            float branchMergedValue9;
            float branchMergedValue10;
            if ((scalarValue & 64u) == 0u)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                vec4 sampledTextureValue6 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(multiplyAddValue14, fragmentScalarConstants1.packedValues[522u], fragmentScalarConstants1.packedValues[520u]), fma(fragmentScalarConstants1.packedValues[scalarValue16 * 4u], fragmentScalarConstants1.packedValues[523u], fragmentScalarConstants1.packedValues[521u])));
                intermediateValue25 = sampledTextureValue6.x;
                intermediateValue26 = sampledTextureValue6.y;
                intermediateValue27 = sampledTextureValue6.z;
                intermediateValue28 = sampledTextureValue6.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(multiplyAddValue2, fragmentScalarConstants1.packedValues[522u], fragmentScalarConstants1.packedValues[520u]), fma(fragmentScalarConstants1.packedValues[scalarValue7 * 4u], fragmentScalarConstants1.packedValues[523u], fragmentScalarConstants1.packedValues[521u])));
                intermediateValue21 = sampledTextureValue3.x;
                intermediateValue22 = sampledTextureValue3.y;
                intermediateValue23 = sampledTextureValue3.z;
                intermediateValue24 = sampledTextureValue3.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float branchMergedValue11;
                float branchMergedValue12;
                float branchMergedValue13;
                float branchMergedValue14;
                if ((scalarValue & 1u) == 0u)
                {
                    branchMergedValue11 = 0.0;
                    branchMergedValue12 = 0.0;
                    branchMergedValue13 = 0.0;
                    branchMergedValue14 = 0.0;
                }
                else
                {
                    vec4 sampledTextureValue = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[128u].y));
                    branchMergedValue11 = sampledTextureValue.x;
                    branchMergedValue12 = sampledTextureValue.y;
                    branchMergedValue13 = sampledTextureValue.z;
                    branchMergedValue14 = sampledTextureValue.w;
                }
                branchMergedValue7 = branchMergedValue11;
                branchMergedValue8 = branchMergedValue12;
                branchMergedValue9 = branchMergedValue13;
                branchMergedValue10 = branchMergedValue14;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                float intermediateValue29;
                float intermediateValue30;
                float intermediateValue31;
                float intermediateValue32;
                if ((scalarValue15 & 1u) != 0u)
                {
                    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                    intermediateValue29 = sampledTextureValue4.x;
                    intermediateValue30 = sampledTextureValue4.y;
                    intermediateValue31 = sampledTextureValue4.z;
                    intermediateValue32 = sampledTextureValue4.w;
                }
                else
                {
                    intermediateValue29 = 0.0;
                    intermediateValue30 = 0.0;
                    intermediateValue31 = 0.0;
                    intermediateValue32 = 0.0;
                }
                intermediateValue25 = intermediateValue29;
                intermediateValue26 = intermediateValue30;
                intermediateValue27 = intermediateValue31;
                intermediateValue28 = intermediateValue32;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float intermediateValue25;
                float intermediateValue26;
                float intermediateValue27;
                float intermediateValue28;
                if ((scalarValue6 & 1u) != 0u)
                {
                    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                    intermediateValue25 = sampledTextureValue4.x;
                    intermediateValue26 = sampledTextureValue4.y;
                    intermediateValue27 = sampledTextureValue4.z;
                    intermediateValue28 = sampledTextureValue4.w;
                }
                else
                {
                    intermediateValue25 = 0.0;
                    intermediateValue26 = 0.0;
                    intermediateValue27 = 0.0;
                    intermediateValue28 = 0.0;
                }
                intermediateValue21 = intermediateValue25;
                intermediateValue22 = intermediateValue26;
                intermediateValue23 = intermediateValue27;
                intermediateValue24 = intermediateValue28;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                vec4 sampledTextureValue1 = texture(sampler2D(txBuffer2Texture, txBuffer2Sampler), vec2((fragmentVectorConstants1.packedValues[130u].z * intermediateValue5) + fragmentVectorConstants1.packedValues[130u].x, (fragmentVectorConstants1.packedValues[130u].w * fragmentVectorConstants1.packedValues[scalarValue1].x) + fragmentVectorConstants1.packedValues[130u].y));
                branchMergedValue7 = sampledTextureValue1.x;
                branchMergedValue8 = sampledTextureValue1.y;
                branchMergedValue9 = sampledTextureValue1.z;
                branchMergedValue10 = sampledTextureValue1.w;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM40
            multiplyAddValue10 = intermediateValue25;
            multiplyAddValue8 = intermediateValue26;
            multiplyAddValue6 = intermediateValue27;
            multiplyAddValue4 = intermediateValue28;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue10 = intermediateValue21;
            multiplyAddValue8 = intermediateValue22;
            multiplyAddValue6 = intermediateValue23;
            multiplyAddValue4 = intermediateValue24;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue2 = branchMergedValue7;
            branchMergedValue3 = branchMergedValue8;
            branchMergedValue4 = branchMergedValue9;
            branchMergedValue5 = branchMergedValue10;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        multiplyAddValue3 = multiplyAddValue4;
        multiplyAddValue5 = multiplyAddValue6;
        multiplyAddValue7 = multiplyAddValue8;
        multiplyAddValue9 = multiplyAddValue10;
    }
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    if ((scalarValue15 & 128u) != 0u)
    {
        uint sumValue20 = bitwiseValue1 + 1u;
        vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(fma(varyingTexCoord2.x, fragmentVectorConstants1.packedValues[sumValue20].x, fragmentVectorConstants1.packedValues[sumValue20].z), fragmentVectorConstants1.packedValues[129u].z, fragmentVectorConstants1.packedValues[129u].x), fma(fma(varyingTexCoord2.y, fragmentVectorConstants1.packedValues[sumValue20].y, fragmentVectorConstants1.packedValues[sumValue20].w), fragmentVectorConstants1.packedValues[129u].w, fragmentVectorConstants1.packedValues[129u].y)));
        float scalarValue21 = sampledTextureValue7.w;
        precise float productValue19 = multiplyAddValue9 * scalarValue21;
        precise float productValue20 = multiplyAddValue7 * scalarValue21;
        precise float productValue21 = multiplyAddValue5 * scalarValue21;
        precise float productValue22 = multiplyAddValue3 * scalarValue21;
        intermediateValue20 = productValue22;
        intermediateValue21 = productValue21;
        intermediateValue22 = productValue20;
        intermediateValue23 = productValue19;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue3 = multiplyAddValue4;
        multiplyAddValue5 = multiplyAddValue6;
        multiplyAddValue7 = multiplyAddValue8;
        multiplyAddValue9 = multiplyAddValue10;
    }
    float productValue3;
    float productValue4;
    float productValue5;
    float productValue6;
    if ((scalarValue6 & 128u) != 0u)
    {
        uint sumValue10 = scalarValue5 + 1u;
        vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(fma(varyingTexCoord2.x, fragmentVectorConstants1.packedValues[sumValue10].x, fragmentVectorConstants1.packedValues[sumValue10].z), fragmentVectorConstants1.packedValues[129u].z, fragmentVectorConstants1.packedValues[129u].x), fma(fma(varyingTexCoord2.y, fragmentVectorConstants1.packedValues[sumValue10].y, fragmentVectorConstants1.packedValues[sumValue10].w), fragmentVectorConstants1.packedValues[129u].w, fragmentVectorConstants1.packedValues[129u].y)));
        float scalarValue13 = sampledTextureValue5.w;
        productValue3 = scalarValue13 * multiplyAddValue3;
        productValue4 = scalarValue13 * multiplyAddValue5;
        productValue5 = scalarValue13 * multiplyAddValue7;
        productValue6 = scalarValue13 * multiplyAddValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        else
        {
            float productValue1 = 1.0 - (intermediateValue5 * 2.0);
            float scalarValue2 = spvNMin(spvNMax(productValue1, 0.0), 1.0);
            float sumValue1 = 1.0 - spvNMin(abs(productValue1), 1.0);
            uint sumValue2 = scalarValue1 + 1u;
            float sumValue3 = spvNMin(spvNMax((-0.0) - productValue1, 0.0), 1.0);
            uint sumValue4 = scalarValue1 + 2u;
            branchMergedValue2 = ((fragmentVectorConstants1.packedValues[sumValue2].x * sumValue1) + (fragmentVectorConstants1.packedValues[scalarValue1].x * scalarValue2)) + (fragmentVectorConstants1.packedValues[sumValue4].x * sumValue3);
            branchMergedValue3 = ((fragmentVectorConstants1.packedValues[sumValue2].y * sumValue1) + (fragmentVectorConstants1.packedValues[scalarValue1].y * scalarValue2)) + (fragmentVectorConstants1.packedValues[sumValue4].y * sumValue3);
            branchMergedValue4 = ((fragmentVectorConstants1.packedValues[sumValue2].z * sumValue1) + (fragmentVectorConstants1.packedValues[scalarValue1].z * scalarValue2)) + (fragmentVectorConstants1.packedValues[sumValue4].z * sumValue3);
            branchMergedValue5 = ((fragmentVectorConstants1.packedValues[sumValue2].w * sumValue1) + (fragmentVectorConstants1.packedValues[scalarValue1].w * scalarValue2)) + (fragmentVectorConstants1.packedValues[sumValue4].w * sumValue3);
        }
        intermediateValue8 = branchMergedValue2;
        intermediateValue9 = branchMergedValue3;
        intermediateValue10 = branchMergedValue4;
        intermediateValue11 = branchMergedValue5;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue20 = multiplyAddValue3;
        intermediateValue21 = multiplyAddValue5;
        intermediateValue22 = multiplyAddValue7;
        intermediateValue23 = multiplyAddValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        productValue3 = multiplyAddValue3;
        productValue4 = multiplyAddValue5;
        productValue5 = multiplyAddValue7;
        productValue6 = multiplyAddValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float scalarValue3 = spvNClamp(intermediateValue5, 0.0, 1.0);
        uint sumValue5 = scalarValue1 + 1u;
        intermediateValue8 = ((fragmentVectorConstants1.packedValues[sumValue5].x - fragmentVectorConstants1.packedValues[scalarValue1].x) * scalarValue3) + fragmentVectorConstants1.packedValues[scalarValue1].x;
        intermediateValue9 = ((fragmentVectorConstants1.packedValues[sumValue5].y - fragmentVectorConstants1.packedValues[scalarValue1].y) * scalarValue3) + fragmentVectorConstants1.packedValues[scalarValue1].y;
        intermediateValue10 = ((fragmentVectorConstants1.packedValues[sumValue5].z - fragmentVectorConstants1.packedValues[scalarValue1].z) * scalarValue3) + fragmentVectorConstants1.packedValues[scalarValue1].z;
        intermediateValue11 = ((fragmentVectorConstants1.packedValues[sumValue5].w - fragmentVectorConstants1.packedValues[scalarValue1].w) * scalarValue3) + fragmentVectorConstants1.packedValues[scalarValue1].w;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint productValue23 = (bitwiseValue1 * 4u) + 3u;
    precise float productValue24 = intermediateValue23 * fragmentScalarConstants1.packedValues[productValue23];
    precise float productValue25 = intermediateValue22 * fragmentScalarConstants1.packedValues[productValue23];
    precise float productValue26 = intermediateValue21 * fragmentScalarConstants1.packedValues[productValue23];
    precise float productValue27 = intermediateValue20 * fragmentScalarConstants1.packedValues[productValue23];
    float scalarValue14 = spvNClamp(varyingTexCoord1.z, 0.0, 1.0);
    precise float productValue28 = productValue24 * scalarValue14;
    precise float productValue29 = productValue25 * scalarValue14;
    precise float productValue30 = productValue26 * scalarValue14;
    precise float productValue31 = productValue27 * scalarValue14;
    fragmentColor0.x = productValue28;
    fragmentColor0.y = productValue29;
    fragmentColor0.z = productValue30;
    fragmentColor0.w = productValue31;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue9 = (scalarValue5 * 4u) + 3u;
    float scalarValue14 = spvNClamp(varyingTexCoord1.z, 0.0, 1.0);
    fragmentColor0.x = (productValue6 * fragmentScalarConstants1.packedValues[productValue9]) * scalarValue14;
    fragmentColor0.y = (productValue5 * fragmentScalarConstants1.packedValues[productValue9]) * scalarValue14;
    fragmentColor0.z = (productValue4 * fragmentScalarConstants1.packedValues[productValue9]) * scalarValue14;
    fragmentColor0.w = (productValue3 * fragmentScalarConstants1.packedValues[productValue9]) * scalarValue14;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if ((scalarValue & 128u) == 0u)
    {
        intermediateValue12 = intermediateValue8;
        intermediateValue13 = intermediateValue9;
        intermediateValue14 = intermediateValue10;
        intermediateValue15 = intermediateValue11;
    }
    else
    {
        vec4 sampledTextureValue2 = texture(sampler2D(txBuffer1Texture, txBuffer1Sampler), vec2((((fragmentVectorConstants1.packedValues[sumValue].x * varyingTexCoord2.x) + fragmentVectorConstants1.packedValues[sumValue].z) * fragmentVectorConstants1.packedValues[129u].z) + fragmentVectorConstants1.packedValues[129u].x, (((fragmentVectorConstants1.packedValues[sumValue].y * varyingTexCoord2.y) + fragmentVectorConstants1.packedValues[sumValue].w) * fragmentVectorConstants1.packedValues[129u].w) + fragmentVectorConstants1.packedValues[129u].y));
        float scalarValue4 = sampledTextureValue2.w;
        intermediateValue12 = scalarValue4 * intermediateValue8;
        intermediateValue13 = scalarValue4 * intermediateValue9;
        intermediateValue14 = scalarValue4 * intermediateValue10;
        intermediateValue15 = scalarValue4 * intermediateValue11;
    }
    float productValue2 = spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * fragmentVectorConstants1.packedValues[bitwiseValue].w;
    fragmentColor0.x = productValue2 * intermediateValue12;
    fragmentColor0.y = productValue2 * intermediateValue13;
    fragmentColor0.z = productValue2 * intermediateValue14;
    fragmentColor0.w = productValue2 * intermediateValue15;
#endif
}
