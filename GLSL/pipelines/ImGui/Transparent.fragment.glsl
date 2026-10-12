#version 460
#extension GL_GOOGLE_include_directive : require
// ImGui / Transparent / fragment forward pipeline.
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


#include "../../include/materials/ImGui/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue = sampledTextureValue1.x * varyingColor0.x;
    precise float productValue1 = sampledTextureValue1.y * varyingColor0.y;
    precise float productValue2 = sampledTextureValue1.z * varyingColor0.z;
    precise float productValue3 = sampledTextureValue1.w * varyingColor0.w;
    fragmentColor0.x = productValue;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue2;
    fragmentColor0.w = productValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = sampledTextureValue1.x * varyingColor0.x;
    fragmentColor0.y = sampledTextureValue1.y * varyingColor0.y;
    fragmentColor0.z = sampledTextureValue1.z * varyingColor0.z;
    fragmentColor0.w = sampledTextureValue1.w * varyingColor0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = sampledTextureValue.x * varyingColor0.x;
    fragmentColor0.y = sampledTextureValue.y * varyingColor0.y;
    fragmentColor0.z = sampledTextureValue.z * varyingColor0.z;
    fragmentColor0.w = sampledTextureValue.w * varyingColor0.w;
#endif
}
