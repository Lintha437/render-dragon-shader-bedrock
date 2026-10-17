#version 460
#extension GL_GOOGLE_include_directive : require
// DeferredMixedResolutionCaustics / CausticsMultiplierPass / fragment forward pipeline.
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
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/DeferredMixedResolutionCaustics/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float inverseLengthValue1;
    if ((fragmentScalarConstants1.packedValues[35u] != 0.0) && (fragmentScalarConstants1.packedValues[32u] != 0.0))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(normalTexture, normalSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    vec4 sampledTextureValue1 = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = (sampledTextureValue1.x * fragmentVectorConstants1.packedValues[6u].w) + fragmentVectorConstants1.packedValues[7u].w;
    float quotientValue = (fragmentVectorConstants1.packedValues[4u].x * varyingColor1.x) / productValue;
    float quotientValue1 = (fragmentVectorConstants1.packedValues[5u].y * varyingColor1.y) / productValue;
    float quotientValue2 = fragmentVectorConstants1.packedValues[7u].z / productValue;
    float sumValue = 1.0 - abs(scalarValue);
    float scalarValue2 = abs(scalarValue1);
    float sumValue1 = sumValue - scalarValue2;
    bool conditionValue = sumValue1 < 0.0;
    float comparisonValue = conditionValue ? ((1.0 - scalarValue2) * ((scalarValue < 0.0) ? (-1.0) : 1.0)) : scalarValue;
    float comparisonValue1 = conditionValue ? (sumValue * ((scalarValue1 < 0.0) ? (-1.0) : 1.0)) : scalarValue1;
    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue, comparisonValue1, sumValue1), vec3(comparisonValue, comparisonValue1, sumValue1)));
    float productValue1 = comparisonValue * inverseLengthValue;
    float productValue2 = comparisonValue1 * inverseLengthValue;
    float productValue3 = inverseLengthValue * sumValue1;
    float inverseLengthValue2 = inversesqrt(dot(vec3(productValue1, productValue2, productValue3), vec3(productValue1, productValue2, productValue3)));
    float sampledTextureValue2;
    if ((fragmentVectorConstants1.packedValues[8u].x != 0.0) && (fragmentVectorConstants1.packedValues[8u].w != 0.0))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        float scalarValue3 = sampledTextureValue3.x;
        float scalarValue4 = sampledTextureValue3.y;
        float sampledTextureValue4 = fma(texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).x, fragmentScalarConstants1.packedValues[27u], fragmentScalarConstants1.packedValues[31u]);
        float quotientValue3 = (varyingColor1.x * fragmentScalarConstants1.packedValues[16u]) / sampledTextureValue4;
        float quotientValue4 = (varyingColor1.y * fragmentScalarConstants1.packedValues[21u]) / sampledTextureValue4;
        float quotientValue5 = fragmentScalarConstants1.packedValues[30u] / sampledTextureValue4;
        float scalarValue5 = abs(scalarValue4);
        float sumValue2 = 1.0 - abs(scalarValue3);
        float sumValue3 = sumValue2 - scalarValue5;
        bool conditionValue1 = sumValue3 < 0.0;
        float sumValue4 = 2.0 - 1.0;
        float comparisonValue2 = conditionValue1 ? ((1.0 - scalarValue5) * ((scalarValue3 >= 0.0) ? sumValue4 : (-1.0))) : scalarValue3;
        float comparisonValue3 = conditionValue1 ? (sumValue2 * ((scalarValue4 >= 0.0) ? sumValue4 : (-1.0))) : scalarValue4;
        vec3 vectorValue = vec3(comparisonValue2, comparisonValue3, sumValue3);
        float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
        float productValue4 = inverseLengthValue3 * comparisonValue3;
        vec3 productValue5 = vec3(inverseLengthValue3 * comparisonValue2, productValue4, inverseLengthValue3 * sumValue3);
        vec4 sampledTextureValue5 = texture(sampler2DArray(materialTexture6, textureSampler6), vec3(((fma(fragmentScalarConstants1.packedValues[8u], quotientValue5, fma(fragmentScalarConstants1.packedValues[0u], quotientValue3, quotientValue4 * fragmentScalarConstants1.packedValues[4u])) + fragmentScalarConstants1.packedValues[12u]) - fragmentScalarConstants1.packedValues[40u]) * fragmentScalarConstants1.packedValues[33u], ((fma(fragmentScalarConstants1.packedValues[10u], quotientValue5, fma(fragmentScalarConstants1.packedValues[2u], quotientValue3, quotientValue4 * fragmentScalarConstants1.packedValues[6u])) + fragmentScalarConstants1.packedValues[14u]) - fragmentScalarConstants1.packedValues[42u]) * fragmentScalarConstants1.packedValues[33u], fragmentScalarConstants1.packedValues[37u]));
        inverseLengthValue1 = (fragmentScalarConstants1.packedValues[34u] + 1.0) * exp2(log2(spvNClamp(inversesqrt(rdDot3Precise2(productValue5, productValue5)) * productValue4, 0.0, 1.0) * (sampledTextureValue5.x + sampledTextureValue5.x)) * fragmentScalarConstants1.packedValues[34u]);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        sampledTextureValue2 = exp2(log2((texture(sampler2DArray(causticsTextureTexture, causticsTextureSampler), vec3(((fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[1u].x, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x) - fragmentVectorConstants1.packedValues[10u].x) * fragmentVectorConstants1.packedValues[8u].y, ((fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[1u].z, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z) - fragmentVectorConstants1.packedValues[10u].z) * fragmentVectorConstants1.packedValues[8u].y, fragmentVectorConstants1.packedValues[9u].y)).x * 2.0) * spvNClamp(dot(vec3(0.0, 1.0, 0.0), vec3(inverseLengthValue2 * productValue1, productValue2 * inverseLengthValue2, inverseLengthValue2 * productValue3)), 0.0, 1.0)) * fragmentVectorConstants1.packedValues[8u].z) * (fragmentVectorConstants1.packedValues[8u].z + 1.0);
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        inverseLengthValue1 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        sampledTextureValue2 = 1.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = inverseLengthValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = sampledTextureValue2;
#endif
    fragmentColor0.y = 1.0;
    fragmentColor0.z = 1.0;
    fragmentColor0.w = 1.0;
}
