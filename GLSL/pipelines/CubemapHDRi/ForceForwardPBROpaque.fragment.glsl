#version 460
#extension GL_GOOGLE_include_directive : require
// CubemapHDRi / ForceForwardPBROpaque / fragment forward pipeline.
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
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/CubemapHDRi/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec3 vectorValue = vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue4 = inverseLengthValue1 * varyingTexCoord0.x;
    precise float productValue5 = inverseLengthValue1 * varyingTexCoord0.y;
    precise float productValue6 = inverseLengthValue1 * varyingTexCoord0.z;
    vec4 sampledTextureValue4 = texture(samplerCube(materialTexture1, textureSampler1), vec3(-productValue4, productValue5, productValue6));
    float scalarValue6 = sampledTextureValue4.x;
    float scalarValue7 = sampledTextureValue4.y;
    float scalarValue8 = sampledTextureValue4.z;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if (fragmentScalarConstants1.packedValues[0u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec3 vectorValue = vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    vec4 sampledTextureValue2 = texture(samplerCube(materialTexture1, textureSampler1), vec3(-(inverseLengthValue1 * varyingTexCoord0.x), inverseLengthValue1 * varyingTexCoord0.y, inverseLengthValue1 * varyingTexCoord0.z));
    float scalarValue3 = sampledTextureValue2.x;
    float scalarValue4 = sampledTextureValue2.y;
    float scalarValue5 = sampledTextureValue2.z;
    float productValue1;
    float productValue2;
    float productValue3;
    if (fragmentScalarConstants1.packedValues[0u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float inverseLengthValue = inversesqrt(dot(vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z), vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z)));
    vec4 sampledTextureValue = texture(samplerCube(matTextureTexture, matTextureSampler), vec3((-0.0) - (varyingTexCoord0.x * inverseLengthValue), inverseLengthValue * varyingTexCoord0.y, inverseLengthValue * varyingTexCoord0.z));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float productValue;
    float productValue1;
    float productValue2;
    if (fragmentVectorConstants1.packedValues[0u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float sampledTextureValue5 = 0.180000007152557373046875 / texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x;
        precise float sumValue = sampledTextureValue5 + 9.9999997473787516355514526367188e-05;
        precise float productValue7 = scalarValue6 * sumValue;
        precise float productValue8 = scalarValue7 * sumValue;
        precise float productValue9 = scalarValue8 * sumValue;
        intermediateValue11 = productValue9;
        intermediateValue12 = productValue8;
        intermediateValue13 = productValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue3 = (0.180000007152557373046875 / texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue1 = scalarValue5 * sampledTextureValue3;
        productValue2 = scalarValue4 * sampledTextureValue3;
        productValue3 = scalarValue3 * sampledTextureValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue1 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue = sampledTextureValue1 * scalarValue;
        productValue1 = sampledTextureValue1 * scalarValue1;
        productValue2 = sampledTextureValue1 * scalarValue2;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue11 = scalarValue8;
        intermediateValue12 = scalarValue7;
        intermediateValue13 = scalarValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        productValue1 = scalarValue5;
        productValue2 = scalarValue4;
        productValue3 = scalarValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue = scalarValue;
        productValue1 = scalarValue1;
        productValue2 = scalarValue2;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    fragmentColor0.x = intermediateValue13;
    fragmentColor0.y = intermediateValue12;
    fragmentColor0.z = intermediateValue11;
    fragmentColor0.w = sampledTextureValue4.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = productValue3;
    fragmentColor0.y = productValue2;
    fragmentColor0.z = productValue1;
    fragmentColor0.w = sampledTextureValue2.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = productValue;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue2;
    fragmentColor0.w = sampledTextureValue.w;
#endif
}
