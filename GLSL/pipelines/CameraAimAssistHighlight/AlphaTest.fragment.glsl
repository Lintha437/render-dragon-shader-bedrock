#version 460
#extension GL_GOOGLE_include_directive : require
// CameraAimAssistHighlight / AlphaTest / fragment forward pipeline.
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

#include "../../include/materials/CameraAimAssistHighlight/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue = sampledTextureValue1.w * fragmentScalarConstants1.packedValues[0u];
    precise float productValue1 = sampledTextureValue1.x * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue2 = sampledTextureValue1.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue3 = sampledTextureValue1.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue4 = productValue * fragmentVectorConstants1.packedValues[1u].w;
    fragmentColor0.x = productValue1;
    fragmentColor0.y = productValue2;
    fragmentColor0.z = productValue3;
    fragmentColor0.w = productValue4;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = sampledTextureValue1.x * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = sampledTextureValue1.y * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = sampledTextureValue1.z * fragmentVectorConstants1.packedValues[1u].z;
    fragmentColor0.w = (sampledTextureValue1.w * fragmentScalarConstants1.packedValues[0u]) * fragmentVectorConstants1.packedValues[1u].w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = fragmentVectorConstants1.packedValues[1u].x * sampledTextureValue.x;
    fragmentColor0.y = fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y;
    fragmentColor0.z = fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z;
    fragmentColor0.w = (fragmentVectorConstants1.packedValues[0u].x * sampledTextureValue.w) * fragmentVectorConstants1.packedValues[1u].w;
#endif
}
