#version 460
#extension GL_GOOGLE_include_directive : require
// BeaconBeam / Transparent / fragment forward pipeline.
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

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/BeaconBeam/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.x;
    float scalarValue4 = sampledTextureValue1.y;
    float scalarValue5 = sampledTextureValue1.z;
    precise float sumValue = fragmentVectorConstants1.packedValues[0u].x - scalarValue3;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[0u].y - scalarValue4;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[0u].z - scalarValue5;
    precise float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[3u], sumValue, scalarValue3) * varyingColor0.x;
    precise float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[3u], sumValue1, scalarValue4) * varyingColor0.y;
    precise float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[3u], sumValue2, scalarValue5) * varyingColor0.z;
    precise float productValue = sampledTextureValue1.w * varyingColor0.w;
    fragmentColor0.x = multiplyAddValue;
    fragmentColor0.y = multiplyAddValue1;
    fragmentColor0.z = multiplyAddValue2;
    fragmentColor0.w = productValue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.x;
    float scalarValue4 = sampledTextureValue1.y;
    float scalarValue5 = sampledTextureValue1.z;
    fragmentColor0.x = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - scalarValue3, scalarValue3) * varyingColor0.x;
    fragmentColor0.y = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - scalarValue4, scalarValue4) * varyingColor0.y;
    fragmentColor0.z = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - scalarValue5, scalarValue5) * varyingColor0.z;
    fragmentColor0.w = sampledTextureValue1.w * varyingColor0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(beaconTextureTexture, beaconTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    fragmentColor0.x = (((fragmentVectorConstants1.packedValues[0u].x - scalarValue) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue) * varyingColor0.x;
    fragmentColor0.y = (((fragmentVectorConstants1.packedValues[0u].y - scalarValue1) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue1) * varyingColor0.y;
    fragmentColor0.z = (((fragmentVectorConstants1.packedValues[0u].z - scalarValue2) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue2) * varyingColor0.z;
    fragmentColor0.w = sampledTextureValue.w * varyingColor0.w;
#endif
}
