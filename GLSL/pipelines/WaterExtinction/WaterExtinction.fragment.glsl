#version 460
#extension GL_GOOGLE_include_directive : require
// WaterExtinction / WaterExtinction / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/WaterExtinction/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue12 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue13 = varyingColor1.x * fragmentScalarConstants1.packedValues[20u];
    float productValue14 = varyingColor1.y * fragmentScalarConstants1.packedValues[25u];
    float multiplyAddValue2 = fma(sampledTextureValue11.x, fragmentScalarConstants1.packedValues[31u], fragmentScalarConstants1.packedValues[35u]);
    float multiplyAddValue3 = fma(sampledTextureValue12.x, fragmentScalarConstants1.packedValues[31u], fragmentScalarConstants1.packedValues[35u]);
    float quotientValue6 = productValue13 / multiplyAddValue3;
    float quotientValue7 = productValue14 / multiplyAddValue3;
    float quotientValue8 = fragmentScalarConstants1.packedValues[34u] / multiplyAddValue3;
    bool conditionValue = fragmentScalarConstants1.packedValues[40u] > 0.0;
    float intermediateValue14;
    float intermediateValue16;
    float intermediateValue17;
    if (conditionValue)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(waterDepthTexture, waterDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = fragmentVectorConstants1.packedValues[5u].x * varyingColor1.x;
    float productValue1 = fragmentVectorConstants1.packedValues[6u].y * varyingColor1.y;
    float productValue2 = (sampledTextureValue.x * fragmentVectorConstants1.packedValues[7u].w) + fragmentVectorConstants1.packedValues[8u].w;
    float quotientValue = productValue / productValue2;
    float quotientValue1 = productValue1 / productValue2;
    float quotientValue2 = fragmentVectorConstants1.packedValues[8u].z / productValue2;
    float productValue3 = (sampledTextureValue1.x * fragmentVectorConstants1.packedValues[7u].w) + fragmentVectorConstants1.packedValues[8u].w;
    float quotientValue3 = productValue / productValue3;
    float quotientValue4 = productValue1 / productValue3;
    float quotientValue5 = fragmentVectorConstants1.packedValues[8u].z / productValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (fragmentVectorConstants1.packedValues[10u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint productValue15 = uint(int(fragmentScalarConstants1.packedValues[42u] * 0.5));
        float multiplyAddValue7 = ((fma(fragmentScalarConstants1.packedValues[12u], quotientValue8, fma(fragmentScalarConstants1.packedValues[4u], quotientValue6, quotientValue7 * fragmentScalarConstants1.packedValues[8u])) + fragmentScalarConstants1.packedValues[16u]) - fragmentScalarConstants1.packedValues[0u]) / fragmentScalarConstants1.packedValues[3u];
        float multiplyAddValue8 = ((fma(fragmentScalarConstants1.packedValues[14u], quotientValue8, fma(fragmentScalarConstants1.packedValues[6u], quotientValue6, quotientValue7 * fragmentScalarConstants1.packedValues[10u])) + fragmentScalarConstants1.packedValues[18u]) - fragmentScalarConstants1.packedValues[2u]) / fragmentScalarConstants1.packedValues[3u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint productValue4 = uint(int(fragmentVectorConstants1.packedValues[10u].z * 0.5));
        float multiplyAddValue = ((fma(fragmentVectorConstants1.packedValues[3u].x, quotientValue5, fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue4, quotientValue3 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[4u].x) - fragmentVectorConstants1.packedValues[0u].x) / fragmentVectorConstants1.packedValues[0u].w;
        float multiplyAddValue1 = ((fma(fragmentVectorConstants1.packedValues[3u].z, quotientValue5, fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue4, quotientValue3 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[4u].z) - fragmentVectorConstants1.packedValues[0u].z) / fragmentVectorConstants1.packedValues[0u].w;
        uint sumValue = uint(int(fragmentVectorConstants1.packedValues[10u].z)) + 4294967295u;
        uint sumValue1 = uint(min(int(uint(max(int(uint(int(floor(multiplyAddValue))) + productValue4), int(0u)))), int(sumValue)));
        uint sumValue2 = uint(min(int(uint(max(int(uint(int(floor(multiplyAddValue1))) + productValue4), int(0u)))), int(sumValue)));
        uint sampledTextureValue2 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue1, sumValue2)), int(0u)).x * 255.0)));
#endif
        uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[10u].w));
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint sumValue7 = uint(int(fragmentVectorConstants1.packedValues[10u].z)) - 1u;
        uint sumValue8 = uint(min(int(uint(max(int(productValue15 + uint(int(floor(multiplyAddValue7)))), int(0u)))), int(sumValue7)));
        uint sumValue9 = uint(min(int(sumValue7), int(uint(max(int(productValue15 + uint(int(floor(multiplyAddValue8)))), int(0u))))));
        uint sampledTextureValue13 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue8, sumValue9)), int(0u)).x * 255.0)));
        bool comparisonValue4 = int(sampledTextureValue13) >= int(scalarValue);
        uint comparisonValue5 = comparisonValue4 ? 0u : sampledTextureValue13;
        uint sumValue10 = sumValue9 + 1u;
        uint sumValue11 = sumValue8 + 1u;
        uint sampledTextureValue14 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue11, sumValue9)), int(0u)).x * 255.0)));
        bool comparisonValue6 = int(sampledTextureValue14) >= int(scalarValue);
        bool conditionValue1 = !comparisonValue6;
        uint sampledTextureValue15 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue8, sumValue10)), int(0u)).x * 255.0)));
        bool comparisonValue7 = int(sampledTextureValue15) >= int(scalarValue);
        bool conditionValue2 = !comparisonValue7;
        uint sampledTextureValue16 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue11, sumValue10)), int(0u)).x * 255.0)));
        bool comparisonValue8 = int(sampledTextureValue16) >= int(scalarValue);
        bool comparisonValue9 = comparisonValue6 || ((sampledTextureValue14 == 0u) && conditionValue1);
        bool comparisonValue10 = sampledTextureValue15 == 0u;
        bool comparisonValue11 = ((!comparisonValue8) && ((comparisonValue7 && (sampledTextureValue16 == 0u)) || ((sampledTextureValue15 == sampledTextureValue16) && conditionValue2))) || (comparisonValue8 && ((conditionValue2 && comparisonValue10) || comparisonValue7));
        bool comparisonValue12 = comparisonValue11 && ((((!comparisonValue4) && (((sampledTextureValue13 == sampledTextureValue14) && conditionValue1) || ((sampledTextureValue13 == 0u) && comparisonValue6))) || (comparisonValue4 && comparisonValue9)) && ((comparisonValue7 && comparisonValue9) || (conditionValue2 && (((sampledTextureValue14 == sampledTextureValue15) && conditionValue1) || (comparisonValue6 && comparisonValue10)))));
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if (comparisonValue12)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint comparisonValue = (int(sampledTextureValue2) >= int(scalarValue)) ? 0u : sampledTextureValue2;
        uint sumValue3 = sumValue1 + 1u;
        uint sampledTextureValue3 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue3, sumValue2)), int(0u)).x * 255.0)));
        uint comparisonValue1 = (int(sampledTextureValue3) >= int(scalarValue)) ? 0u : sampledTextureValue3;
        uint sumValue4 = sumValue2 + 1u;
        uint sampledTextureValue4 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue1, sumValue4)), int(0u)).x * 255.0)));
        uint comparisonValue2 = (int(sampledTextureValue4) >= int(scalarValue)) ? 0u : sampledTextureValue4;
        uint sampledTextureValue5 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue3, sumValue4)), int(0u)).x * 255.0)));
        uint comparisonValue3 = (int(sampledTextureValue5) >= int(scalarValue)) ? 0u : sampledTextureValue5;
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (((comparisonValue == comparisonValue1) && (comparisonValue1 == comparisonValue2)) && (comparisonValue2 == comparisonValue3))
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            uint productValue16 = comparisonValue5 * 20u;
            vec3 reinterpretedBits = uintBitsToFloat(uvec3(intermediateValue3.packedValues[productValue16], intermediateValue3.packedValues[productValue16 + 1u], intermediateValue3.packedValues[productValue16 + 2u]));
            intermediateValue18 = reinterpretedBits.x;
            intermediateValue19 = reinterpretedBits.y;
            intermediateValue20 = reinterpretedBits.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint scalarValue1 = comparisonValue * 20u;
            vec3 sampledTextureValue6 = uintBitsToFloat(uvec3(texelFetch(zBiomeInfoBuffer, int(scalarValue1)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue1 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue1 + 2u)).x));
            branchMergedValue = sampledTextureValue6.x;
            branchMergedValue1 = sampledTextureValue6.y;
            branchMergedValue2 = sampledTextureValue6.z;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue18 = comparisonValue11 ? uintBitsToFloat(0xffffffffu ) : 0.0;
            intermediateValue19 = uintBitsToFloat(sumValue10);
            intermediateValue20 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint productValue5 = comparisonValue * 20u;
            vec3 sampledTextureValue7 = uintBitsToFloat(uvec3(texelFetch(zBiomeInfoBuffer, int(productValue5)).x, texelFetch(zBiomeInfoBuffer, int(productValue5 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue5 + 2u)).x));
            uint productValue6 = comparisonValue1 * 20u;
            vec3 sampledTextureValue8 = uintBitsToFloat(uvec3(texelFetch(zBiomeInfoBuffer, int(productValue6)).x, texelFetch(zBiomeInfoBuffer, int(productValue6 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue6 + 2u)).x));
            uint productValue7 = comparisonValue2 * 20u;
            vec3 sampledTextureValue9 = uintBitsToFloat(uvec3(texelFetch(zBiomeInfoBuffer, int(productValue7)).x, texelFetch(zBiomeInfoBuffer, int(productValue7 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue7 + 2u)).x));
            uint productValue8 = comparisonValue3 * 20u;
            vec3 sampledTextureValue10 = uintBitsToFloat(uvec3(texelFetch(zBiomeInfoBuffer, int(productValue8)).x, texelFetch(zBiomeInfoBuffer, int(productValue8 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue8 + 2u)).x));
            float scalarValue2 = fract(multiplyAddValue);
            float scalarValue3 = fract(multiplyAddValue1);
            float sumValue5 = 1.0 - scalarValue2;
            float sumValue6 = 1.0 - scalarValue3;
            float productValue9 = sumValue6 * sumValue5;
            float productValue10 = sumValue6 * scalarValue2;
            float productValue11 = sumValue5 * scalarValue3;
            float productValue12 = scalarValue3 * scalarValue2;
            branchMergedValue = (((productValue12 * sampledTextureValue10.x) + (productValue11 * sampledTextureValue9.x)) + (productValue10 * sampledTextureValue8.x)) + (productValue9 * sampledTextureValue7.x);
            branchMergedValue1 = (((productValue12 * sampledTextureValue10.y) + (productValue11 * sampledTextureValue9.y)) + (productValue10 * sampledTextureValue8.y)) + (productValue9 * sampledTextureValue7.y);
            branchMergedValue2 = (((productValue12 * sampledTextureValue10.z) + (productValue11 * sampledTextureValue9.z)) + (productValue10 * sampledTextureValue8.z)) + (productValue9 * sampledTextureValue7.z);
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue4;
        float multiplyAddValue5;
        float multiplyAddValue6;
        if (!comparisonValue12)
        {
            uint productValue17 = comparisonValue5 * 20u;
            vec3 reinterpretedBits1 = uintBitsToFloat(uvec3(intermediateValue3.packedValues[productValue17], intermediateValue3.packedValues[productValue17 + 1u], intermediateValue3.packedValues[productValue17 + 2u]));
            uint comparisonValue13 = (comparisonValue6 ? 0u : sampledTextureValue14) * 20u;
            vec3 reinterpretedBits2 = uintBitsToFloat(uvec3(intermediateValue3.packedValues[comparisonValue13], intermediateValue3.packedValues[comparisonValue13 + 1u], intermediateValue3.packedValues[comparisonValue13 + 2u]));
            uint comparisonValue14 = (comparisonValue7 ? 0u : sampledTextureValue15) * 20u;
            vec3 reinterpretedBits3 = uintBitsToFloat(uvec3(intermediateValue3.packedValues[comparisonValue14], intermediateValue3.packedValues[comparisonValue14 + 1u], intermediateValue3.packedValues[comparisonValue14 + 2u]));
            uint comparisonValue15 = (comparisonValue8 ? 0u : sampledTextureValue16) * 20u;
            vec3 reinterpretedBits4 = uintBitsToFloat(uvec3(intermediateValue3.packedValues[comparisonValue15], intermediateValue3.packedValues[comparisonValue15 + 1u], intermediateValue3.packedValues[comparisonValue15 + 2u]));
            float scalarValue4 = fract(multiplyAddValue7);
            float scalarValue5 = fract(multiplyAddValue8);
            float sumValue12 = 1.0 - scalarValue5;
            float sumValue13 = 1.0 - scalarValue4;
            float productValue18 = sumValue12 * sumValue13;
            float productValue19 = scalarValue4 * sumValue12;
            float productValue20 = scalarValue5 * sumValue13;
            float productValue21 = scalarValue5 * scalarValue4;
            multiplyAddValue4 = fma(reinterpretedBits4.x, productValue21, fma(reinterpretedBits3.x, productValue20, fma(reinterpretedBits1.x, productValue18, reinterpretedBits2.x * productValue19)));
            multiplyAddValue5 = fma(reinterpretedBits4.y, productValue21, fma(reinterpretedBits3.y, productValue20, fma(reinterpretedBits1.y, productValue18, reinterpretedBits2.y * productValue19)));
            multiplyAddValue6 = fma(reinterpretedBits4.z, productValue21, fma(reinterpretedBits3.z, productValue20, fma(reinterpretedBits1.z, productValue18, reinterpretedBits2.z * productValue19)));
        }
        else
        {
            multiplyAddValue4 = intermediateValue18;
            multiplyAddValue5 = intermediateValue19;
            multiplyAddValue6 = intermediateValue20;
        }
        intermediateValue14 = multiplyAddValue4;
        intermediateValue16 = multiplyAddValue5;
        intermediateValue17 = multiplyAddValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue4 = branchMergedValue;
        intermediateValue5 = branchMergedValue1;
        intermediateValue6 = branchMergedValue2;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue14 = intermediateValue15;
        intermediateValue16 = intermediateValue15;
        intermediateValue17 = intermediateValue15;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue4 = fragmentVectorConstants1.packedValues[11u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[11u].y;
        intermediateValue6 = fragmentVectorConstants1.packedValues[11u].z;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    if (!conditionValue)
    {
        intermediateValue21 = fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue22 = fragmentVectorConstants1.packedValues[11u].y;
        intermediateValue23 = fragmentVectorConstants1.packedValues[11u].x;
    }
    else
    {
        intermediateValue21 = intermediateValue17;
        intermediateValue22 = intermediateValue16;
        intermediateValue23 = intermediateValue14;
    }
    vec4 quotientValue9 = vec4(productValue13 / multiplyAddValue2, productValue14 / multiplyAddValue2, fragmentScalarConstants1.packedValues[34u] / multiplyAddValue2, multiplyAddValue2 / multiplyAddValue2);
    vec4 quotientValue10 = vec4(quotientValue6, quotientValue7, quotientValue8, multiplyAddValue3 / multiplyAddValue3);
    float nonlinearValue1 = (spvNMin(sqrt(rdDot4Precise(quotientValue9, quotientValue9)), fragmentScalarConstants1.packedValues[38u]) - spvNMin(sqrt(rdDot4Precise(quotientValue10, quotientValue10)), fragmentScalarConstants1.packedValues[38u])) + fragmentScalarConstants1.packedValues[49u];
    fragmentColor0.x = exp2((nonlinearValue1 * (-intermediateValue23)) * 1.44269502162933349609375);
    fragmentColor0.y = exp2((nonlinearValue1 * (-intermediateValue22)) * 1.44269502162933349609375);
    fragmentColor0.z = exp2((nonlinearValue1 * (-intermediateValue21)) * 1.44269502162933349609375);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float nonlinearValue = ((spvNMin(sqrt((((quotientValue * quotientValue) + 1.0) + (quotientValue1 * quotientValue1)) + (quotientValue2 * quotientValue2)), fragmentVectorConstants1.packedValues[9u].z) - spvNMin(sqrt((((quotientValue3 * quotientValue3) + 1.0) + (quotientValue4 * quotientValue4)) + (quotientValue5 * quotientValue5)), fragmentVectorConstants1.packedValues[9u].z)) + fragmentVectorConstants1.packedValues[12u].y) * (-1.44269502162933349609375);
    fragmentColor0.x = exp2(nonlinearValue * intermediateValue4);
    fragmentColor0.y = exp2(nonlinearValue * intermediateValue5);
    fragmentColor0.z = exp2(nonlinearValue * intermediateValue6);
#endif
    fragmentColor0.w = 1.0;
}
