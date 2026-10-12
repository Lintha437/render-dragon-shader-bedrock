#version 460
#extension GL_GOOGLE_include_directive : require
// EndSky / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/EndSky/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue = sampledTextureValue.x * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue1 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue2 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue3 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[0u].w;
    fragmentColor0.x = productValue;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue2;
    fragmentColor0.w = productValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = sampledTextureValue.x * fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = sampledTextureValue.y * fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = sampledTextureValue.z * fragmentVectorConstants1.packedValues[0u].z;
    fragmentColor0.w = sampledTextureValue.w * fragmentVectorConstants1.packedValues[0u].w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue1 = texture(sampler2D(skyTextureTexture, skyTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = sampledTextureValue1.x * fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = sampledTextureValue1.y * fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = sampledTextureValue1.z * fragmentVectorConstants1.packedValues[0u].z;
    fragmentColor0.w = sampledTextureValue1.w * fragmentVectorConstants1.packedValues[0u].w;
#endif
}
