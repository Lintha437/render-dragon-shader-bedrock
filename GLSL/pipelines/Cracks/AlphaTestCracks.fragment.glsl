#version 460
#extension GL_GOOGLE_include_directive : require
// Cracks / AlphaTestCracks / fragment forward pipeline.
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


#include "../../include/materials/Cracks/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    if (scalarValue1 < 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(cracksTextureTexture, cracksTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    if (scalarValue < 0.5)
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = sampledTextureValue1.x;
    fragmentColor0.y = sampledTextureValue1.y;
    fragmentColor0.z = sampledTextureValue1.z;
    fragmentColor0.w = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = sampledTextureValue.x;
    fragmentColor0.y = sampledTextureValue.y;
    fragmentColor0.z = sampledTextureValue.z;
    fragmentColor0.w = scalarValue;
#endif
    discardIfRequested();
}
