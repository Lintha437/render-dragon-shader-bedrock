#version 460
#extension GL_GOOGLE_include_directive : require
// Flipbook / Blit / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/Flipbook/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool comparisonValue = scalarValue3 >= 0.00999999977648258209228515625;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    precise float sumValue = scalarValue - scalarValue4;
    precise float sumValue1 = scalarValue1 - scalarValue5;
    precise float sumValue2 = scalarValue2 - scalarValue6;
    precise float sumValue3 = scalarValue3 - scalarValue7;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    bool conditionValue = scalarValue7 < 0.00999999977648258209228515625;
    fragmentColor0.x = conditionValue ? scalarValue : (comparisonValue ? fma(reinterpretedBits, sumValue, scalarValue4) : scalarValue4);
    fragmentColor0.y = conditionValue ? scalarValue1 : (comparisonValue ? fma(reinterpretedBits, sumValue1, scalarValue5) : scalarValue5);
    fragmentColor0.z = conditionValue ? scalarValue2 : (comparisonValue ? fma(reinterpretedBits, sumValue2, scalarValue6) : scalarValue6);
    fragmentColor0.w = conditionValue ? scalarValue3 : (comparisonValue ? fma(reinterpretedBits, sumValue3, scalarValue7) : scalarValue7);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool comparisonValue = scalarValue3 >= 0.00999999977648258209228515625;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    bool conditionValue = scalarValue7 < 0.00999999977648258209228515625;
    fragmentColor0.x = conditionValue ? scalarValue : (comparisonValue ? fma(reinterpretedBits, scalarValue - scalarValue4, scalarValue4) : scalarValue4);
    fragmentColor0.y = conditionValue ? scalarValue1 : (comparisonValue ? fma(reinterpretedBits, scalarValue1 - scalarValue5, scalarValue5) : scalarValue5);
    fragmentColor0.z = conditionValue ? scalarValue2 : (comparisonValue ? fma(reinterpretedBits, scalarValue2 - scalarValue6, scalarValue6) : scalarValue6);
    fragmentColor0.w = conditionValue ? scalarValue3 : (comparisonValue ? fma(reinterpretedBits, scalarValue3 - scalarValue7, scalarValue7) : scalarValue7);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue2 = texture(sampler2D(blitTextureTexture, blitTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue2.x;
    float scalarValue9 = sampledTextureValue2.y;
    float scalarValue10 = sampledTextureValue2.z;
    float scalarValue11 = sampledTextureValue2.w;
    vec4 sampledTextureValue3 = texture(sampler2D(blitTextureTexture, blitTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue12 = sampledTextureValue3.x;
    float scalarValue13 = sampledTextureValue3.y;
    float scalarValue14 = sampledTextureValue3.z;
    float scalarValue15 = sampledTextureValue3.w;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if (scalarValue11 < 0.00999999977648258209228515625)
    {
        intermediateValue8 = scalarValue12;
        intermediateValue9 = scalarValue13;
        intermediateValue10 = scalarValue14;
        intermediateValue11 = scalarValue15;
    }
    else
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (!(scalarValue15 >= 0.00999999977648258209228515625))
        {
            branchMergedValue = scalarValue8;
            branchMergedValue1 = scalarValue9;
            branchMergedValue2 = scalarValue10;
            branchMergedValue3 = scalarValue11;
        }
        else
        {
            branchMergedValue = (fragmentVectorConstants1.packedValues[0u].z * (scalarValue12 - scalarValue8)) + scalarValue8;
            branchMergedValue1 = (fragmentVectorConstants1.packedValues[0u].z * (scalarValue13 - scalarValue9)) + scalarValue9;
            branchMergedValue2 = (fragmentVectorConstants1.packedValues[0u].z * (scalarValue14 - scalarValue10)) + scalarValue10;
            branchMergedValue3 = (fragmentVectorConstants1.packedValues[0u].z * (scalarValue15 - scalarValue11)) + scalarValue11;
        }
        intermediateValue8 = branchMergedValue;
        intermediateValue9 = branchMergedValue1;
        intermediateValue10 = branchMergedValue2;
        intermediateValue11 = branchMergedValue3;
    }
    fragmentColor0.x = intermediateValue8;
    fragmentColor0.y = intermediateValue9;
    fragmentColor0.z = intermediateValue10;
    fragmentColor0.w = intermediateValue11;
#endif
}
