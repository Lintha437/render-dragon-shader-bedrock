#version 460
#extension GL_GOOGLE_include_directive : require
// LegacyCubemap / ForceForwardPBROpaque / fragment forward pipeline.
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

#include "../../include/materials/LegacyCubemap/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if (fragmentScalarConstants1.packedValues[0u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float productValue;
    float productValue1;
    float productValue2;
    if (fragmentScalarConstants1.packedValues[0u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue2.x;
    float scalarValue4 = sampledTextureValue2.y;
    float scalarValue5 = sampledTextureValue2.z;
    float productValue;
    float productValue1;
    float productValue2;
    if (fragmentVectorConstants1.packedValues[0u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float sampledTextureValue4 = 0.180000007152557373046875 / texture(sampler2D(materialTexture1, textureSampler1), vec2(0.5)).x;
        precise float sumValue = sampledTextureValue4 + 9.9999997473787516355514526367188e-05;
        precise float productValue3 = scalarValue * sumValue;
        precise float productValue4 = scalarValue1 * sumValue;
        precise float productValue5 = scalarValue2 * sumValue;
        intermediateValue8 = productValue5;
        intermediateValue9 = productValue4;
        intermediateValue10 = productValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue1 = (0.180000007152557373046875 / texture(sampler2D(materialTexture1, textureSampler1), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue = scalarValue2 * sampledTextureValue1;
        productValue1 = scalarValue1 * sampledTextureValue1;
        productValue2 = scalarValue * sampledTextureValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue3 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue = sampledTextureValue3 * scalarValue3;
        productValue1 = sampledTextureValue3 * scalarValue4;
        productValue2 = sampledTextureValue3 * scalarValue5;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue8 = scalarValue2;
        intermediateValue9 = scalarValue1;
        intermediateValue10 = scalarValue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        productValue = scalarValue2;
        productValue1 = scalarValue1;
        productValue2 = scalarValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue = scalarValue3;
        productValue1 = scalarValue4;
        productValue2 = scalarValue5;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    fragmentColor0.x = intermediateValue10;
    fragmentColor0.y = intermediateValue9;
    fragmentColor0.z = intermediateValue8;
    fragmentColor0.w = sampledTextureValue.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = productValue2;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue;
    fragmentColor0.w = sampledTextureValue.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = productValue;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue2;
    fragmentColor0.w = sampledTextureValue2.w;
#endif
}
