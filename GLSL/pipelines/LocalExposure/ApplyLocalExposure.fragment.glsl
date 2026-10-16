#version 460
#extension GL_GOOGLE_include_directive : require
// LocalExposure / ApplyLocalExposure / fragment forward pipeline.
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
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/LocalExposure/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    float nonlinearValue;
    if (fragmentScalarConstants1.packedValues[4u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float sampledTextureValue;
    if (fragmentScalarConstants1.packedValues[4u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sampledTextureValue;
    if (fragmentVectorConstants1.packedValues[1u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float sampledTextureValue9 = 0.180000007152557373046875 / texture(sampler2D(materialTexture2, textureSampler2), vec2(0.5)).x;
        precise float sumValue2 = sampledTextureValue9 + 9.9999997473787516355514526367188e-05;
        nonlinearValue = log2(spvNMin(spvNMax(sumValue2, fragmentScalarConstants1.packedValues[10u]), fragmentScalarConstants1.packedValues[11u]));
#elif RD_PLATFORM == RD_PLATFORM_SM50
        sampledTextureValue = log2(spvNMin(spvNMax((0.180000007152557373046875 / texture(sampler2D(materialTexture2, textureSampler2), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05, fragmentScalarConstants1.packedValues[10u]), fragmentScalarConstants1.packedValues[11u]));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        sampledTextureValue = log2(spvNMin(spvNMax((0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05, fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].w));
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        nonlinearValue = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50 || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        sampledTextureValue = 0.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue5.x;
    precise float nonlinearValue2 = log2(spvNMin(spvNMax(rdDot3Precise2(vec3(scalarValue2, sampledTextureValue5.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), fragmentScalarConstants1.packedValues[10u]), fragmentScalarConstants1.packedValues[11u])) - nonlinearValue;
    precise float sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).x - nonlinearValue;
    precise float sumValue3 = nonlinearValue2 - fragmentScalarConstants1.packedValues[8u];
    precise float sumValue4 = fragmentScalarConstants1.packedValues[9u] - fragmentScalarConstants1.packedValues[8u];
    precise float quotientValue1 = sumValue3 / sumValue4;
    vec4 sampledTextureValue11 = texture(sampler3D(materialTexture4, textureSampler4), vec3(varyingTexCoord0.x, varyingTexCoord0.y, quotientValue1));
    float scalarValue4 = sampledTextureValue11.x;
    precise float quotientValue2 = sampledTextureValue11.y / scalarValue4;
    float multiplyAddValue3 = fma(quotientValue2, sumValue4, fragmentScalarConstants1.packedValues[8u]);
    precise float sumValue5 = sampledTextureValue10 - multiplyAddValue3;
    float multiplyAddValue4 = (scalarValue4 < 0.001000000047497451305389404296875) ? sampledTextureValue10 : fma(fragmentScalarConstants1.packedValues[2u], sumValue5, multiplyAddValue3);
    float sampledTextureValue8 = log2(spvNMin(spvNMax(texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x, fragmentScalarConstants1.packedValues[10u]), fragmentScalarConstants1.packedValues[11u]));
    precise float sumValue6 = multiplyAddValue4 - sampledTextureValue8;
    precise float sumValue7 = nonlinearValue2 - multiplyAddValue4;
    precise float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[1u], sumValue7, fma(fragmentScalarConstants1.packedValues[0u], sumValue6, sampledTextureValue8)) - nonlinearValue2;
    float exponentialValue1 = exp2(multiplyAddValue5);
    precise float productValue = scalarValue2 * exponentialValue1;
    precise float productValue1 = sampledTextureValue5.y * exponentialValue1;
    precise float productValue2 = sampledTextureValue5.z * exponentialValue1;
    fragmentColor0.x = productValue;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue5.x;
    float nonlinearValue1 = log2(spvNMin(spvNMax(rdDot3Precise2(vec3(scalarValue2, sampledTextureValue5.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), fragmentScalarConstants1.packedValues[10u]), fragmentScalarConstants1.packedValues[11u]));
    float sumValue = nonlinearValue1 - sampledTextureValue;
    float sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).x - sampledTextureValue;
    float sumValue1 = fragmentScalarConstants1.packedValues[9u] - fragmentScalarConstants1.packedValues[8u];
    vec4 sampledTextureValue7 = texture(sampler3D(materialTexture4, textureSampler4), vec3(varyingTexCoord0.x, varyingTexCoord0.y, (sumValue - fragmentScalarConstants1.packedValues[8u]) / sumValue1));
    float scalarValue3 = sampledTextureValue7.x;
    float multiplyAddValue = fma(sampledTextureValue7.y / scalarValue3, sumValue1, fragmentScalarConstants1.packedValues[8u]);
    float multiplyAddValue1 = (scalarValue3 < 0.001000000047497451305389404296875) ? sampledTextureValue6 : fma(fragmentScalarConstants1.packedValues[2u], sampledTextureValue6 - multiplyAddValue, multiplyAddValue);
    float sampledTextureValue8 = log2(spvNMin(spvNMax(texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x, fragmentScalarConstants1.packedValues[10u]), fragmentScalarConstants1.packedValues[11u]));
    float multiplyAddValue2 = exp2((sampledTextureValue - nonlinearValue1) + fma(fragmentScalarConstants1.packedValues[1u], sumValue - multiplyAddValue1, fma(fragmentScalarConstants1.packedValues[0u], multiplyAddValue1 - sampledTextureValue8, sampledTextureValue8)));
    fragmentColor0.x = scalarValue2 * multiplyAddValue2;
    fragmentColor0.y = sampledTextureValue5.y * multiplyAddValue2;
    fragmentColor0.z = sampledTextureValue5.z * multiplyAddValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue1 = texture(sampler2D(sceneColorTexture, sceneColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float dotProductValue = log2(spvNMin(spvNMax(dot(vec3(scalarValue, sampledTextureValue1.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].w)) - sampledTextureValue;
    float sampledTextureValue2 = texture(sampler2D(downsampledLogLuminanceTexture, downsampledLogLuminanceSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).x - sampledTextureValue;
    vec4 sampledTextureValue3 = texture(sampler3D(filteredBilateralGridTexture, filteredBilateralGridSampler), vec3(varyingTexCoord0.x, varyingTexCoord0.y, (dotProductValue - fragmentVectorConstants1.packedValues[2u].x) / (fragmentVectorConstants1.packedValues[2u].y - fragmentVectorConstants1.packedValues[2u].x)));
    float scalarValue1 = sampledTextureValue3.x;
    float quotientValue = ((fragmentVectorConstants1.packedValues[2u].y - fragmentVectorConstants1.packedValues[2u].x) * (sampledTextureValue3.y / scalarValue1)) + fragmentVectorConstants1.packedValues[2u].x;
    float comparisonValue = (scalarValue1 < 0.001000000047497451305389404296875) ? sampledTextureValue2 : (((sampledTextureValue2 - quotientValue) * fragmentVectorConstants1.packedValues[0u].z) + quotientValue);
    float sampledTextureValue4 = log2(spvNMin(spvNMax(texture(sampler2D(averageLuminanceTexture, averageLuminanceSampler), vec2(0.5)).x, fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].w));
    float exponentialValue = exp2(((sampledTextureValue4 - dotProductValue) + ((dotProductValue - comparisonValue) * fragmentVectorConstants1.packedValues[0u].y)) + ((comparisonValue - sampledTextureValue4) * fragmentVectorConstants1.packedValues[0u].x));
    fragmentColor0.x = exponentialValue * scalarValue;
    fragmentColor0.y = exponentialValue * sampledTextureValue1.y;
    fragmentColor0.z = exponentialValue * sampledTextureValue1.z;
#endif
    fragmentColor0.w = 1.0;
}
