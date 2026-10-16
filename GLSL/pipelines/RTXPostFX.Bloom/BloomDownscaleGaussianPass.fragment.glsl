#version 460
#extension GL_GOOGLE_include_directive : require
// RTXPostFX.Bloom / BloomDownscaleGaussianPass / fragment forward pipeline.
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
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/RTXPostFX.Bloom/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[0u]);
    float reinterpretedBits1 = uintBitsToFloat(reinterpretedBits.z);
    float reinterpretedBits2 = uintBitsToFloat(reinterpretedBits.w);
    precise float productValue7 = reinterpretedBits1 * 0.5;
    precise float productValue8 = reinterpretedBits2 * 0.5;
    float intermediateValue4;
    float intermediateValue6;
    float intermediateValue8;
    intermediateValue4 = 0.0;
    intermediateValue6 = 0.0;
    intermediateValue8 = 0.0;
    uint sumValue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[0u]);
    float reinterpretedBits1 = uintBitsToFloat(reinterpretedBits.z);
    float reinterpretedBits2 = uintBitsToFloat(reinterpretedBits.w);
    float productValue = reinterpretedBits1 * 0.5;
    float productValue1 = reinterpretedBits2 * 0.5;
    float intermediateValue4;
    float intermediateValue6;
    float intermediateValue8;
    intermediateValue4 = 0.0;
    intermediateValue6 = 0.0;
    intermediateValue8 = 0.0;
    uint sumValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue5 = fragmentVectorConstants1.packedValues[0u].z * 0.5;
    float productValue6 = fragmentVectorConstants1.packedValues[0u].w * 0.5;
    float productValue2;
    float productValue3;
    float productValue4;
#endif
    float intermediateValue5;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue6;
#endif
    float intermediateValue7;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint intermediateValue8;
    float scalarValue3 = 0.0;
    float scalarValue4 = 0.0;
    float scalarValue5 = 0.0;
#endif
    uint scalarValue = 4294967294u;
    for (;;)
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        if (int(scalarValue) >= int(2u))
        {
            break;
        }
        uint comparisonValue = ((int(scalarValue) < int(0u)) ? (4294967295u - scalarValue) : scalarValue) << 1u;
        float scalarValue1 = rdSignedBitsToFloat(scalarValue);
        intermediateValue5 = intermediateValue4;
        intermediateValue7 = intermediateValue6;
        intermediateValue9 = intermediateValue8;
        float multiplyAddValue;
        float multiplyAddValue1;
        float multiplyAddValue2;
        uint sumValue1;
        uint scalarValue2 = 4294967294u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue5 = scalarValue3;
        intermediateValue6 = scalarValue4;
        intermediateValue7 = scalarValue5;
        intermediateValue8 = 4294967294u;
#endif
        for (;;)
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            if (int(scalarValue2) >= int(2u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint bitwiseValue = (uint(int(intermediateValue8) >> int(31u)) ^ intermediateValue8) + ((uint(int(scalarValue) >> int(31u)) ^ scalarValue) * 2u);
            vec4 sampledTextureValue1 = texture(sampler2D(rasterColorTexture, rasterColorSampler), vec2((productValue5 + varyingTexCoord0.x) + (float(int(scalarValue)) * fragmentVectorConstants1.packedValues[0u].z), (productValue6 + varyingTexCoord0.y) + (float(int(intermediateValue8)) * fragmentVectorConstants1.packedValues[0u].w)));
            productValue2 = (sampledTextureValue1.x * intermediateValue[bitwiseValue]) + intermediateValue5;
            productValue3 = (sampledTextureValue1.y * intermediateValue[bitwiseValue]) + intermediateValue6;
            productValue4 = (sampledTextureValue1.z * intermediateValue[bitwiseValue]) + intermediateValue7;
            uint sumValue2 = intermediateValue8 + 1u;
            if (sumValue2 == 2u)
#endif
            {
                break;
            }
#if RD_PLATFORM == RD_PLATFORM_SM40
            uint comparisonValue1 = comparisonValue + ((int(scalarValue2) < int(0u)) ? (4294967295u - scalarValue2) : scalarValue2);
            precise float multiplyAddValue3 = fma(scalarValue1, reinterpretedBits1, productValue7) + varyingTexCoord0.x;
            precise float multiplyAddValue4 = fma(rdSignedBitsToFloat(scalarValue2), reinterpretedBits2, productValue8) + varyingTexCoord0.y;
            vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue3, multiplyAddValue4));
            float comparisonValue2 = (comparisonValue1 == 0u) ? 0.16339969635009765625 : (((comparisonValue1 >= 1u) && (comparisonValue1 < 3u)) ? 0.0387139283120632171630859375 : ((comparisonValue1 == 3u) ? 0.009172405116260051727294921875 : 0.0));
            multiplyAddValue2 = fma(sampledTextureValue2.x, comparisonValue2, intermediateValue9);
            multiplyAddValue1 = fma(sampledTextureValue2.y, comparisonValue2, intermediateValue7);
            multiplyAddValue = fma(sampledTextureValue2.z, comparisonValue2, intermediateValue5);
            sumValue1 = scalarValue2 + 1u;
            intermediateValue5 = multiplyAddValue;
            intermediateValue7 = multiplyAddValue1;
            intermediateValue9 = multiplyAddValue2;
            scalarValue2 = sumValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            uint comparisonValue1 = comparisonValue + ((int(scalarValue2) < int(0u)) ? (4294967295u - scalarValue2) : scalarValue2);
            vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(scalarValue1, reinterpretedBits1, productValue) + varyingTexCoord0.x, fma(rdSignedBitsToFloat(scalarValue2), reinterpretedBits2, productValue1) + varyingTexCoord0.y));
            float comparisonValue2 = (comparisonValue1 == 0u) ? 0.16339969635009765625 : (((comparisonValue1 >= 1u) && (comparisonValue1 < 3u)) ? 0.0387139283120632171630859375 : ((comparisonValue1 == 3u) ? 0.009172405116260051727294921875 : 0.0));
            multiplyAddValue2 = fma(sampledTextureValue.x, comparisonValue2, intermediateValue9);
            multiplyAddValue1 = fma(sampledTextureValue.y, comparisonValue2, intermediateValue7);
            multiplyAddValue = fma(sampledTextureValue.z, comparisonValue2, intermediateValue5);
            sumValue1 = scalarValue2 + 1u;
            intermediateValue5 = multiplyAddValue;
            intermediateValue7 = multiplyAddValue1;
            intermediateValue9 = multiplyAddValue2;
            scalarValue2 = sumValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            else
            {
                intermediateValue5 = productValue2;
                intermediateValue6 = productValue3;
                intermediateValue7 = productValue4;
                intermediateValue8 = sumValue2;
            }
        }
        uint sumValue3 = scalarValue + 1u;
        if (sumValue3 == 2u)
        {
            break;
        }
        else
        {
            scalarValue3 = productValue2;
            scalarValue4 = productValue3;
            scalarValue5 = productValue4;
            scalarValue = sumValue3;
#endif
            continue;
        }
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        sumValue = scalarValue + 1u;
        intermediateValue4 = intermediateValue5;
        intermediateValue6 = intermediateValue7;
        intermediateValue8 = intermediateValue9;
        scalarValue = sumValue;
        continue;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = intermediateValue8;
    fragmentColor0.y = intermediateValue6;
    fragmentColor0.z = intermediateValue4;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = productValue2;
    fragmentColor0.y = productValue3;
    fragmentColor0.z = productValue4;
#endif
    fragmentColor0.w = 1.0;
}
