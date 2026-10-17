#version 460
#extension GL_GOOGLE_include_directive : require
// RTXPostFX.Bloom / BloomUpscalePass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXPostFX.Bloom/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = spvNMax(sampledTextureValue1.x, 0.0);
    fragmentColor0.y = spvNMax(sampledTextureValue1.y, 0.0);
    fragmentColor0.z = spvNMax(sampledTextureValue1.z, 0.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(rasterColorTexture, rasterColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = spvNMax(sampledTextureValue.x, 0.0);
    fragmentColor0.y = spvNMax(sampledTextureValue.y, 0.0);
    fragmentColor0.z = spvNMax(sampledTextureValue.z, 0.0);
#endif
    fragmentColor0.w = 1.0;
}
