#version 460
#extension GL_GOOGLE_include_directive : require
// LocalExposure / GaussianDownsample / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if defined(GL_EXT_control_flow_attributes)
#extension GL_EXT_control_flow_attributes : require
#define SPIRV_CROSS_FLATTEN [[flatten]]
#define SPIRV_CROSS_BRANCH [[dont_flatten]]
#define SPIRV_CROSS_UNROLL [[unroll]]
#define SPIRV_CROSS_LOOP [[dont_unroll]]
#else
#define SPIRV_CROSS_FLATTEN
#define SPIRV_CROSS_BRANCH
#define SPIRV_CROSS_UNROLL
#define SPIRV_CROSS_LOOP
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DIVIDE_UNSIGNED_UINT_11 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_DIV_MOD_UVEC2_12 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_MODULO_UNSIGNED_UINT_10 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/LocalExposure/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
uint SDiv(uint num, uint den)
{
    uint intermediateValue2;
    SPIRV_CROSS_FLATTEN
    if (den == 0u)
    {
        intermediateValue2 = 4294967295u;
    }
    else
    {
        intermediateValue2 = uint(int(num) / int(den));
    }
    return intermediateValue2;
}
#endif
void main()
{
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[0u].x));
    uint scalarValue1 = uint(int(fragmentVectorConstants1.packedValues[0u].y));
#if RD_PLATFORM == RD_PLATFORM_SM40
    uvec2 vectorValue = rdUnsignedDivMod(uint(abs(int(scalarValue))), uint(abs(int(scalarValue1))));
    uint scalarValue8 = vectorValue.x;
    uint scalarValue9 = -scalarValue8;
    bool comparisonValue = ((scalarValue ^ scalarValue1) & 2147483648u) != 0u;
    precise float productValue3 = rdSignedBitsToFloat(scalarValue * scalarValue) * 0.5;
    uint comparisonValue1 = -(comparisonValue ? scalarValue9 : scalarValue8);
    float scalarValue10 = trunc(fragmentScalarConstants1.packedValues[1u]);
    float intermediateValue19;
    float intermediateValue21;
    intermediateValue19 = 0.0;
    intermediateValue21 = 0.0;
    uint sumValue;
    float intermediateValue20;
    float intermediateValue22;
    uint scalarValue11 = comparisonValue1;
    for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uvec2 vectorValue = rdUnsignedDivMod(uint(abs(int(scalarValue))), uint(abs(int(scalarValue1))));
    uint scalarValue8 = vectorValue.x;
    uint scalarValue9 = -scalarValue8;
    bool comparisonValue = ((scalarValue ^ scalarValue1) & 2147483648u) != 0u;
    float productValue7 = rdSignedBitsToFloat(scalarValue * scalarValue) * 0.5;
    uint comparisonValue1 = -(comparisonValue ? scalarValue9 : scalarValue8);
    float scalarValue10 = trunc(fragmentScalarConstants1.packedValues[1u]);
    float intermediateValue19;
    float intermediateValue21;
    intermediateValue19 = 0.0;
    intermediateValue21 = 0.0;
    uint sumValue;
    float intermediateValue20;
    float intermediateValue22;
    uint scalarValue11 = comparisonValue1;
    for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint scalarValue2 = SDiv(scalarValue, scalarValue1);
    float productValue = float(int(scalarValue * scalarValue)) * 0.5;
    uint scalarValue3 = -scalarValue2;
    float intermediateValue5;
    float intermediateValue6;
    if (int(scalarValue2) < int(scalarValue3))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        bool conditionValue = !comparisonValue;
        if ((comparisonValue && (int(scalarValue9) < int(scalarValue11))) || ((int(scalarValue8) < int(scalarValue11)) && conditionValue))
        {
            break;
        }
        float scalarValue12 = rdSignedBitsToFloat(scalarValue11);
        intermediateValue20 = intermediateValue19;
        intermediateValue22 = intermediateValue21;
        precise float sumValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        bool conditionValue = !comparisonValue;
        if ((comparisonValue && (int(scalarValue9) < int(scalarValue11))) || ((int(scalarValue8) < int(scalarValue11)) && conditionValue))
        {
            break;
        }
        float scalarValue12 = rdSignedBitsToFloat(scalarValue11);
        intermediateValue20 = intermediateValue19;
        intermediateValue22 = intermediateValue21;
        float sumValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue5 = 0.0;
        intermediateValue6 = 0.0;
    }
    else
    {
#endif
        float sampledTextureValue;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        uint sumValue2;
        uint scalarValue13 = comparisonValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sumValue;
        float intermediateValue10;
        float intermediateValue11;
        uint intermediateValue12;
        float scalarValue4 = 0.0;
        float scalarValue5 = 0.0;
        uint scalarValue6 = scalarValue3;
#endif
        for (;;)
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            if ((conditionValue && (int(scalarValue8) < int(scalarValue13))) || (comparisonValue && (int(scalarValue9) < int(scalarValue13))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue10 = scalarValue4;
            intermediateValue11 = scalarValue5;
            intermediateValue12 = scalarValue3;
            for (;;)
            {
                float scalarValue7 = float(int(scalarValue1));
                float productValue1 = float(int(scalarValue6)) * scalarValue7;
                float productValue2 = float(int(intermediateValue12)) * scalarValue7;
                float exponentialValue = exp2((((-0.0) - ((productValue1 * productValue1) + (productValue2 * productValue2))) / productValue) * 1.44269502162933349609375);
                sampledTextureValue = (log2(spvNMin(spvNMax(dot(vec3(texture(sampler2D(sceneColorTexture, sceneColorSampler), vec2(spvNMin((fragmentVectorConstants1.packedValues[3u].x * productValue1) + varyingTexCoord0.x, fragmentVectorConstants1.packedValues[1u].z), spvNMin((fragmentVectorConstants1.packedValues[3u].y * productValue2) + varyingTexCoord0.y, fragmentVectorConstants1.packedValues[1u].w))).xyz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].w)) * exponentialValue) + intermediateValue10;
                sumValue = exponentialValue + intermediateValue11;
                if (int(intermediateValue12) < int(scalarValue2))
                {
                    intermediateValue10 = sampledTextureValue;
                    intermediateValue11 = sumValue;
                    intermediateValue12++;
                }
                else
                {
                    break;
                }
            }
            if (int(scalarValue6) < int(scalarValue2))
            {
                scalarValue4 = sampledTextureValue;
                scalarValue5 = sumValue;
                scalarValue6++;
                continue;
            }
            else
#endif
            {
                break;
            }
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue4 = scalarValue10 * scalarValue12;
            precise float productValue5 = scalarValue10 * rdSignedBitsToFloat(scalarValue13);
            vec2 vectorValue1 = vec2(productValue4, productValue5);
            precise float quotientValue = (-rdDot2Precise(vectorValue1, vectorValue1)) / productValue3;
            precise float productValue6 = quotientValue * 1.44269502162933349609375;
            float exponentialValue1 = exp2(productValue6);
            sampledTextureValue = fma(exponentialValue1, log2(spvNMin(spvNMax(rdDot3Precise2(vec3(texture(sampler2D(materialTexture3, textureSampler3), vec2(spvNMin(fma(productValue4, fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord0.x), fragmentVectorConstants1.packedValues[1u].z), spvNMin(fma(productValue5, fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord0.y), fragmentVectorConstants1.packedValues[1u].w))).xyz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), fragmentScalarConstants1.packedValues[10u]), fragmentScalarConstants1.packedValues[11u])), intermediateValue22);
            sumValue1 = exponentialValue1 + intermediateValue20;
            sumValue2 = scalarValue13 + 1u;
            intermediateValue20 = sumValue1;
            intermediateValue22 = sampledTextureValue;
            scalarValue13 = sumValue2;
            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float productValue8 = scalarValue10 * scalarValue12;
            float productValue9 = scalarValue10 * rdSignedBitsToFloat(scalarValue13);
            vec2 vectorValue2 = vec2(productValue8, productValue9);
            float exponentialValue2 = exp2(((-rdDot2Precise(vectorValue2, vectorValue2)) / productValue7) * 1.44269502162933349609375);
            sampledTextureValue = fma(exponentialValue2, log2(spvNMin(spvNMax(rdDot3Precise2(vec3(texture(sampler2D(materialTexture3, textureSampler3), vec2(spvNMin(fma(productValue8, fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord0.x), fragmentVectorConstants1.packedValues[1u].z), spvNMin(fma(productValue9, fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord0.y), fragmentVectorConstants1.packedValues[1u].w))).xyz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), fragmentScalarConstants1.packedValues[10u]), fragmentScalarConstants1.packedValues[11u])), intermediateValue22);
            sumValue1 = exponentialValue2 + intermediateValue20;
            sumValue2 = scalarValue13 + 1u;
            intermediateValue20 = sumValue1;
            intermediateValue22 = sampledTextureValue;
            scalarValue13 = sumValue2;
            continue;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        sumValue = scalarValue11 + 1u;
        intermediateValue19 = intermediateValue20;
        intermediateValue21 = intermediateValue22;
        scalarValue11 = sumValue;
        continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue5 = sampledTextureValue;
        intermediateValue6 = sumValue;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float quotientValue1 = intermediateValue21 / intermediateValue19;
    fragmentColor0.x = quotientValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = intermediateValue21 / intermediateValue19;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = intermediateValue5 / intermediateValue6;
#endif
    fragmentColor0.y = 0.0;
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
}
