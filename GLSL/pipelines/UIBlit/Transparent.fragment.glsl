#version 460
#extension GL_GOOGLE_include_directive : require
// UIBlit / Transparent / fragment forward pipeline.
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

#include "../../include/materials/UIBlit/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue = sampledTextureValue1.x * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue1 = sampledTextureValue1.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue2 = sampledTextureValue1.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue3 = sampledTextureValue1.w * fragmentVectorConstants1.packedValues[1u].w;
    precise float productValue4 = productValue3 * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.w = productValue4;
    fragmentColor0.x = productValue;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.w = (sampledTextureValue1.w * fragmentVectorConstants1.packedValues[1u].w) * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.x = sampledTextureValue1.x * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = sampledTextureValue1.y * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = sampledTextureValue1.z * fragmentVectorConstants1.packedValues[1u].z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = fragmentVectorConstants1.packedValues[1u].x * sampledTextureValue.x;
    fragmentColor0.y = fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y;
    fragmentColor0.z = fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z;
    fragmentColor0.w = (fragmentVectorConstants1.packedValues[1u].w * sampledTextureValue.w) * fragmentVectorConstants1.packedValues[0u].x;
#endif
}
