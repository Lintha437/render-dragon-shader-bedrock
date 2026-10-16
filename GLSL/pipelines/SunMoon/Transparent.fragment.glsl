#version 460
#extension GL_GOOGLE_include_directive : require
// SunMoon / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 1
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/SunMoon/FragmentBindings.glsli"

void main()
{
    vec4 sampledTextureValue = texture(sampler2D(sunMoonTextureTexture, sunMoonTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = sampledTextureValue.x * fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = sampledTextureValue.y * fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = sampledTextureValue.z * fragmentVectorConstants1.packedValues[0u].z;
    fragmentColor0.w = sampledTextureValue.w * fragmentVectorConstants1.packedValues[0u].w;
}
