#version 460
#extension GL_GOOGLE_include_directive : require
// ScreenSpaceReflections / SSRFillGaps / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_EXTENDED_GAP_FILL
#define RD_FEATURE_EXTENDED_GAP_FILL RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/ScreenSpaceReflections/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if (scalarValue3 < 0.0)
#elif (RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(inputTextureTexture, inputTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue3.x;
    float scalarValue7 = sampledTextureValue3.y;
    float scalarValue8 = sampledTextureValue3.z;
    float scalarValue9 = sampledTextureValue3.w;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if (!(scalarValue9 >= 0.0))
#elif (RD_FEATURE_EXTENDED_GAP_FILL == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_EXTENDED_GAP_FILL == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(inputTextureTexture, inputTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue3.x;
    float scalarValue7 = sampledTextureValue3.y;
    float scalarValue8 = sampledTextureValue3.z;
    float scalarValue9 = sampledTextureValue3.w;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if (!(scalarValue9 >= 0.0))
#endif
    {
#if (RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
        float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u]));
        precise float sumValue = varyingTexCoord0.x + 0.0;
        precise float sumValue1 = reinterpretedBits + varyingTexCoord0.y;
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture4, textureSampler4), vec2(sumValue, sumValue1));
        float scalarValue12 = sampledTextureValue8.w;
        precise float sumValue2 = varyingTexCoord0.y - reinterpretedBits;
        vec4 sampledTextureValue9 = texture(sampler2D(materialTexture4, textureSampler4), vec2(sumValue, sumValue2));
        float scalarValue13 = sampledTextureValue9.w;
        bool comparisonValue1 = (scalarValue12 >= 0.0) && (scalarValue13 >= 0.0);
        precise float sumValue3 = sampledTextureValue9.x + sampledTextureValue8.x;
        precise float sumValue4 = sampledTextureValue9.y + sampledTextureValue8.y;
        precise float sumValue5 = sampledTextureValue9.z + sampledTextureValue8.z;
        precise float sumValue6 = scalarValue13 + scalarValue12;
        precise float productValue = sumValue3 * 0.5;
        precise float productValue1 = sumValue4 * 0.5;
        precise float productValue2 = sumValue5 * 0.5;
        precise float productValue3 = sumValue6 * 0.5;
        fragmentColor0.x = comparisonValue1 ? productValue : scalarValue;
        fragmentColor0.y = comparisonValue1 ? productValue1 : scalarValue1;
        fragmentColor0.z = comparisonValue1 ? productValue2 : scalarValue2;
        fragmentColor0.w = comparisonValue1 ? productValue3 : scalarValue3;
#elif (RD_FEATURE_EXTENDED_GAP_FILL == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
        float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u]));
        precise float sumValue = varyingTexCoord0.x + 0.0;
        precise float sumValue1 = reinterpretedBits + varyingTexCoord0.y;
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture4, textureSampler4), vec2(sumValue, sumValue1));
        float scalarValue12 = sampledTextureValue8.w;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        if (scalarValue12 < 0.0)
        {
            vec4 sampledTextureValue10 = texture(sampler2D(materialTexture4, textureSampler4), vec2(fma(0.0, 2.0, varyingTexCoord0.x), fma(reinterpretedBits, 2.0, varyingTexCoord0.y)));
            intermediateValue8 = sampledTextureValue10.w;
            intermediateValue9 = sampledTextureValue10.x;
            intermediateValue10 = sampledTextureValue10.y;
            intermediateValue11 = sampledTextureValue10.z;
        }
        else
        {
            intermediateValue8 = scalarValue12;
            intermediateValue9 = sampledTextureValue8.x;
            intermediateValue10 = sampledTextureValue8.y;
            intermediateValue11 = sampledTextureValue8.z;
        }
        precise float sumValue2 = varyingTexCoord0.y - reinterpretedBits;
        vec4 sampledTextureValue9 = texture(sampler2D(materialTexture4, textureSampler4), vec2(sumValue, sumValue2));
        float scalarValue13 = sampledTextureValue9.w;
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        if (scalarValue13 < 0.0)
        {
            vec4 sampledTextureValue11 = texture(sampler2D(materialTexture4, textureSampler4), vec2(fma(0.0, 2.0, varyingTexCoord0.x), fma(reinterpretedBits, -2.0, varyingTexCoord0.y)));
            intermediateValue13 = sampledTextureValue11.z;
            intermediateValue14 = sampledTextureValue11.y;
            intermediateValue15 = sampledTextureValue11.x;
            intermediateValue16 = sampledTextureValue11.w;
        }
        else
        {
            intermediateValue13 = sampledTextureValue9.z;
            intermediateValue14 = sampledTextureValue9.y;
            intermediateValue15 = sampledTextureValue9.x;
            intermediateValue16 = scalarValue13;
        }
        bool comparisonValue2 = (intermediateValue8 >= 0.0) && (intermediateValue16 >= 0.0);
        precise float sumValue7 = intermediateValue15 + intermediateValue9;
        precise float sumValue8 = intermediateValue14 + intermediateValue10;
        precise float sumValue9 = intermediateValue13 + intermediateValue11;
        precise float sumValue10 = intermediateValue16 + intermediateValue8;
        precise float productValue4 = sumValue7 * 0.5;
        precise float productValue5 = sumValue8 * 0.5;
        precise float productValue6 = sumValue9 * 0.5;
        precise float productValue7 = sumValue10 * 0.5;
        fragmentColor0.x = comparisonValue2 ? productValue4 : scalarValue;
        fragmentColor0.y = comparisonValue2 ? productValue5 : scalarValue1;
        fragmentColor0.z = comparisonValue2 ? productValue6 : scalarValue2;
        fragmentColor0.w = comparisonValue2 ? productValue7 : scalarValue3;
#elif (RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u]));
        vec4 sampledTextureValue1 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, reinterpretedBits + varyingTexCoord0.y));
        float scalarValue4 = sampledTextureValue1.w;
        vec4 sampledTextureValue2 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y - reinterpretedBits));
        float scalarValue5 = sampledTextureValue2.w;
        bool comparisonValue = (scalarValue4 >= 0.0) && (scalarValue5 >= 0.0);
        fragmentColor0.x = comparisonValue ? ((sampledTextureValue2.x + sampledTextureValue1.x) * 0.5) : scalarValue;
        fragmentColor0.y = comparisonValue ? ((sampledTextureValue2.y + sampledTextureValue1.y) * 0.5) : scalarValue1;
        fragmentColor0.z = comparisonValue ? ((sampledTextureValue2.z + sampledTextureValue1.z) * 0.5) : scalarValue2;
        fragmentColor0.w = comparisonValue ? ((scalarValue5 + scalarValue4) * 0.5) : scalarValue3;
#elif (RD_FEATURE_EXTENDED_GAP_FILL == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u]));
        vec4 sampledTextureValue1 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, reinterpretedBits + varyingTexCoord0.y));
        float scalarValue4 = sampledTextureValue1.w;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        if (scalarValue4 < 0.0)
        {
            vec4 sampledTextureValue10 = texture(sampler2D(materialTexture4, textureSampler4), vec2(fma(0.0, 2.0, varyingTexCoord0.x), fma(reinterpretedBits, 2.0, varyingTexCoord0.y)));
            intermediateValue8 = sampledTextureValue10.w;
            intermediateValue9 = sampledTextureValue10.x;
            intermediateValue10 = sampledTextureValue10.y;
            intermediateValue11 = sampledTextureValue10.z;
        }
        else
        {
            intermediateValue8 = scalarValue4;
            intermediateValue9 = sampledTextureValue1.x;
            intermediateValue10 = sampledTextureValue1.y;
            intermediateValue11 = sampledTextureValue1.z;
        }
        vec4 sampledTextureValue2 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y - reinterpretedBits));
        float scalarValue5 = sampledTextureValue2.w;
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        if (scalarValue5 < 0.0)
        {
            vec4 sampledTextureValue11 = texture(sampler2D(materialTexture4, textureSampler4), vec2(fma(0.0, 2.0, varyingTexCoord0.x), fma(reinterpretedBits, -2.0, varyingTexCoord0.y)));
            intermediateValue13 = sampledTextureValue11.z;
            intermediateValue14 = sampledTextureValue11.y;
            intermediateValue15 = sampledTextureValue11.x;
            intermediateValue16 = sampledTextureValue11.w;
        }
        else
        {
            intermediateValue13 = sampledTextureValue2.z;
            intermediateValue14 = sampledTextureValue2.y;
            intermediateValue15 = sampledTextureValue2.x;
            intermediateValue16 = scalarValue5;
        }
        bool comparisonValue2 = (intermediateValue8 >= 0.0) && (intermediateValue16 >= 0.0);
        fragmentColor0.x = comparisonValue2 ? ((intermediateValue15 + intermediateValue9) * 0.5) : scalarValue;
        fragmentColor0.y = comparisonValue2 ? ((intermediateValue14 + intermediateValue10) * 0.5) : scalarValue1;
        fragmentColor0.z = comparisonValue2 ? ((intermediateValue13 + intermediateValue11) * 0.5) : scalarValue2;
        fragmentColor0.w = comparisonValue2 ? ((intermediateValue16 + intermediateValue8) * 0.5) : scalarValue3;
#elif (RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue4 = texture(sampler2D(inputTextureTexture, inputTextureSampler), vec2(varyingTexCoord0.x, fragmentVectorConstants1.packedValues[0u].w + varyingTexCoord0.y));
        float scalarValue10 = sampledTextureValue4.w;
        vec4 sampledTextureValue5 = texture(sampler2D(inputTextureTexture, inputTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y - fragmentVectorConstants1.packedValues[0u].w));
        float scalarValue11 = sampledTextureValue5.w;
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if ((scalarValue10 >= 0.0) && (scalarValue11 >= 0.0))
        {
            branchMergedValue = (sampledTextureValue5.x + sampledTextureValue4.x) * 0.5;
            branchMergedValue1 = (sampledTextureValue5.y + sampledTextureValue4.y) * 0.5;
            branchMergedValue2 = (sampledTextureValue5.z + sampledTextureValue4.z) * 0.5;
            branchMergedValue3 = (scalarValue11 + scalarValue10) * 0.5;
        }
        else
        {
            branchMergedValue = scalarValue6;
            branchMergedValue1 = scalarValue7;
            branchMergedValue2 = scalarValue8;
            branchMergedValue3 = scalarValue9;
        }
        intermediateValue6 = branchMergedValue;
        intermediateValue7 = branchMergedValue1;
        intermediateValue8 = branchMergedValue2;
        intermediateValue9 = branchMergedValue3;
#elif (RD_FEATURE_EXTENDED_GAP_FILL == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_EXTENDED_GAP_FILL == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue4 = texture(sampler2D(inputTextureTexture, inputTextureSampler), vec2(varyingTexCoord0.x, fragmentVectorConstants1.packedValues[0u].w + varyingTexCoord0.y));
        float scalarValue10 = sampledTextureValue4.w;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        if (!(scalarValue10 >= 0.0))
        {
            vec4 sampledTextureValue6 = texture(sampler2D(inputTextureTexture, inputTextureSampler), vec2(varyingTexCoord0.x, (fragmentVectorConstants1.packedValues[0u].w * 2.0) + varyingTexCoord0.y));
            intermediateValue9 = sampledTextureValue6.x;
            intermediateValue10 = sampledTextureValue6.y;
            intermediateValue11 = sampledTextureValue6.z;
            intermediateValue12 = sampledTextureValue6.w;
        }
        else
        {
            intermediateValue9 = sampledTextureValue4.x;
            intermediateValue10 = sampledTextureValue4.y;
            intermediateValue11 = sampledTextureValue4.z;
            intermediateValue12 = scalarValue10;
        }
        vec4 sampledTextureValue5 = texture(sampler2D(inputTextureTexture, inputTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y - fragmentVectorConstants1.packedValues[0u].w));
        float scalarValue11 = sampledTextureValue5.w;
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        if (!(scalarValue11 >= 0.0))
        {
            vec4 sampledTextureValue7 = texture(sampler2D(inputTextureTexture, inputTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y - (fragmentVectorConstants1.packedValues[0u].w * 2.0)));
            intermediateValue14 = sampledTextureValue7.x;
            intermediateValue15 = sampledTextureValue7.y;
            intermediateValue16 = sampledTextureValue7.z;
            intermediateValue17 = sampledTextureValue7.w;
        }
        else
        {
            intermediateValue14 = sampledTextureValue5.x;
            intermediateValue15 = sampledTextureValue5.y;
            intermediateValue16 = sampledTextureValue5.z;
            intermediateValue17 = scalarValue11;
        }
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if ((intermediateValue12 >= 0.0) && (intermediateValue17 >= 0.0))
        {
            branchMergedValue = (intermediateValue14 + intermediateValue9) * 0.5;
            branchMergedValue1 = (intermediateValue15 + intermediateValue10) * 0.5;
            branchMergedValue2 = (intermediateValue16 + intermediateValue11) * 0.5;
            branchMergedValue3 = (intermediateValue17 + intermediateValue12) * 0.5;
        }
        else
        {
            branchMergedValue = scalarValue6;
            branchMergedValue1 = scalarValue7;
            branchMergedValue2 = scalarValue8;
            branchMergedValue3 = scalarValue9;
        }
        intermediateValue5 = branchMergedValue;
        intermediateValue6 = branchMergedValue1;
        intermediateValue7 = branchMergedValue2;
        intermediateValue8 = branchMergedValue3;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        fragmentColor0.x = scalarValue;
        fragmentColor0.y = scalarValue1;
        fragmentColor0.z = scalarValue2;
        fragmentColor0.w = scalarValue3;
#elif (RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue6 = scalarValue6;
        intermediateValue7 = scalarValue7;
        intermediateValue8 = scalarValue8;
        intermediateValue9 = scalarValue9;
#elif (RD_FEATURE_EXTENDED_GAP_FILL == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_EXTENDED_GAP_FILL == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue5 = scalarValue6;
        intermediateValue6 = scalarValue7;
        intermediateValue7 = scalarValue8;
        intermediateValue8 = scalarValue9;
#endif
    }
#if (RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = intermediateValue6;
    fragmentColor0.y = intermediateValue7;
    fragmentColor0.z = intermediateValue8;
    fragmentColor0.w = intermediateValue9;
#elif (RD_FEATURE_EXTENDED_GAP_FILL == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_EXTENDED_GAP_FILL == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = intermediateValue5;
    fragmentColor0.y = intermediateValue6;
    fragmentColor0.z = intermediateValue7;
    fragmentColor0.w = intermediateValue8;
#endif
}
