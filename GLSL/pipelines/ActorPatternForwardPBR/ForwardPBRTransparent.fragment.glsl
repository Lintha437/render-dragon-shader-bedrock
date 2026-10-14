#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPatternForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_OPTION_EMISSIVE
#define RD_OPTION_EMISSIVE RD_EMISSIVE_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MASKED_MULTITEXTURE
#define RD_FEATURE_MASKED_MULTITEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/ActorPatternForwardPBR/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    float intermediateValue3;
    if (fragmentScalarConstants1.packedValues[0u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float sampledTextureValue;
    if (fragmentScalarConstants1.packedValues[0u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sampledTextureValue;
    if (fragmentVectorConstants1.packedValues[0u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float sampledTextureValue1 = 0.180000007152557373046875 / texture(sampler2D(materialTexture7, textureSampler7), vec2(0.5)).x;
        precise float sumValue = sampledTextureValue1 + 9.9999997473787516355514526367188e-05;
        intermediateValue3 = sumValue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        sampledTextureValue = (0.180000007152557373046875 / texture(sampler2D(materialTexture7, textureSampler7), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        sampledTextureValue = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue3 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50 || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        sampledTextureValue = 1.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    fragmentColor0.x = intermediateValue3;
    fragmentColor0.y = intermediateValue3;
    fragmentColor0.z = intermediateValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM50 || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = sampledTextureValue;
    fragmentColor0.y = sampledTextureValue;
    fragmentColor0.z = sampledTextureValue;
#endif
    fragmentColor0.w = 1.0;
}
