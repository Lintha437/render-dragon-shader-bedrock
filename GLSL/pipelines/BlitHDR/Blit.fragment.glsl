#version 460
#extension GL_GOOGLE_include_directive : require
// BlitHDR / Blit / fragment forward pipeline.
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


#include "../../include/materials/BlitHDR/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sampledTextureValue4 = 0.180000007152557373046875 / texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x;
    precise float sumValue = sampledTextureValue4 + 9.9999997473787516355514526367188e-05;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float quotientValue = sampledTextureValue3.x / sumValue;
    precise float quotientValue1 = sampledTextureValue3.y / sumValue;
    precise float quotientValue2 = sampledTextureValue3.z / sumValue;
    fragmentColor0.x = quotientValue;
    fragmentColor0.y = quotientValue1;
    fragmentColor0.z = quotientValue2;
    fragmentColor0.w = sampledTextureValue3.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float sampledTextureValue2 = (0.180000007152557373046875 / texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = sampledTextureValue3.x / sampledTextureValue2;
    fragmentColor0.y = sampledTextureValue3.y / sampledTextureValue2;
    fragmentColor0.z = sampledTextureValue3.z / sampledTextureValue2;
    fragmentColor0.w = sampledTextureValue3.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(blitTextureTexture, blitTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float sampledTextureValue1 = (0.180000007152557373046875 / texture(sampler2D(averageLuminanceTexture, averageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
    fragmentColor0.x = sampledTextureValue.x / sampledTextureValue1;
    fragmentColor0.y = sampledTextureValue.y / sampledTextureValue1;
    fragmentColor0.z = sampledTextureValue.z / sampledTextureValue1;
    fragmentColor0.w = sampledTextureValue.w;
#endif
}
