#version 460
#extension GL_GOOGLE_include_directive : require
// CracksBlockEntity / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 1
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/CracksBlockEntity/FragmentBindings.glsli"

void main()
{
    vec4 sampledTextureValue = texture(sampler2D(cracksTextureTexture, cracksTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = sampledTextureValue.x;
    fragmentColor0.y = sampledTextureValue.y;
    fragmentColor0.z = sampledTextureValue.z;
    fragmentColor0.w = sampledTextureValue.w;
}
