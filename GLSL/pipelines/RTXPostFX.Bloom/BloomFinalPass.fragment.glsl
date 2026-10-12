#version 460
#extension GL_GOOGLE_include_directive : require
// RTXPostFX.Bloom / BloomFinalPass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXPostFX.Bloom/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue3.x;
    float scalarValue4 = sampledTextureValue3.y;
    float scalarValue5 = sampledTextureValue3.z;
    precise float sumValue = spvNMax(sampledTextureValue2.x, 0.0) - scalarValue3;
    precise float sumValue1 = spvNMax(sampledTextureValue2.y, 0.0) - scalarValue4;
    precise float sumValue2 = spvNMax(sampledTextureValue2.z, 0.0) - scalarValue5;
    fragmentColor0.x = fma(fragmentScalarConstants1.packedValues[0u], sumValue, scalarValue3);
    fragmentColor0.y = fma(fragmentScalarConstants1.packedValues[0u], sumValue1, scalarValue4);
    fragmentColor0.z = fma(fragmentScalarConstants1.packedValues[0u], sumValue2, scalarValue5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue3.x;
    float scalarValue4 = sampledTextureValue3.y;
    float scalarValue5 = sampledTextureValue3.z;
    fragmentColor0.x = fma(fragmentScalarConstants1.packedValues[0u], spvNMax(sampledTextureValue2.x, 0.0) - scalarValue3, scalarValue3);
    fragmentColor0.y = fma(fragmentScalarConstants1.packedValues[0u], spvNMax(sampledTextureValue2.y, 0.0) - scalarValue4, scalarValue4);
    fragmentColor0.z = fma(fragmentScalarConstants1.packedValues[0u], spvNMax(sampledTextureValue2.z, 0.0) - scalarValue5, scalarValue5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(gBloomOriginalInputTexture, gBloomOriginalInputSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    vec4 sampledTextureValue1 = texture(sampler2D(rasterColorTexture, rasterColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = (fragmentVectorConstants1.packedValues[0u].x * (spvNMax(sampledTextureValue1.x, 0.0) - scalarValue)) + scalarValue;
    fragmentColor0.y = (fragmentVectorConstants1.packedValues[0u].x * (spvNMax(sampledTextureValue1.y, 0.0) - scalarValue1)) + scalarValue1;
    fragmentColor0.z = (fragmentVectorConstants1.packedValues[0u].x * (spvNMax(sampledTextureValue1.z, 0.0) - scalarValue2)) + scalarValue2;
#endif
    fragmentColor0.w = 1.0;
}
