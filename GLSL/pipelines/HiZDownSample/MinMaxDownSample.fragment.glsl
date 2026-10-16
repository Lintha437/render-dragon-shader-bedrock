#version 460
#extension GL_GOOGLE_include_directive : require
// HiZDownSample / MinMaxDownSample / fragment forward pipeline.
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
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/HiZDownSample/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[1u].z, -0.5, varyingTexCoord0.x);
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[1u].w, -0.5, varyingTexCoord0.y);
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[1u].z, 0.5, varyingTexCoord0.x);
    vec4 sampledTextureValue4 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue, multiplyAddValue1), fragmentScalarConstants1.packedValues[0u]);
    vec4 sampledTextureValue5 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue2, multiplyAddValue1), fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue4 = 1.0 - sampledTextureValue5.x;
    precise float sumValue5 = 1.0 - sampledTextureValue5.y;
    precise float sumValue6 = 1.0 - sampledTextureValue4.x;
    precise float sumValue7 = 1.0 - sampledTextureValue4.y;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[1u].w, 0.5, varyingTexCoord0.y);
    vec4 sampledTextureValue6 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue, multiplyAddValue3), fragmentScalarConstants1.packedValues[0u]);
    vec4 sampledTextureValue7 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue2, multiplyAddValue3), fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue8 = 1.0 - sampledTextureValue7.x;
    precise float sumValue9 = 1.0 - sampledTextureValue7.y;
    precise float sumValue10 = 1.0 - sampledTextureValue6.x;
    precise float sumValue11 = 1.0 - sampledTextureValue6.y;
    precise float sumValue12 = 1.0 - spvNMin(spvNMin(sumValue4, sumValue8), spvNMin(sumValue6, sumValue10));
    precise float sumValue13 = 1.0 - spvNMax(spvNMax(sumValue5, sumValue9), spvNMax(sumValue7, sumValue11));
    fragmentColor0.x = sumValue12;
    fragmentColor0.y = sumValue13;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[1u].z, -0.5, varyingTexCoord0.x);
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[1u].w, -0.5, varyingTexCoord0.y);
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[1u].z, 0.5, varyingTexCoord0.x);
    vec4 sampledTextureValue4 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue, multiplyAddValue1), fragmentScalarConstants1.packedValues[0u]);
    vec4 sampledTextureValue5 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue2, multiplyAddValue1), fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[1u].w, 0.5, varyingTexCoord0.y);
    vec4 sampledTextureValue6 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue, multiplyAddValue3), fragmentScalarConstants1.packedValues[0u]);
    vec4 sampledTextureValue7 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue2, multiplyAddValue3), fragmentScalarConstants1.packedValues[0u]);
    fragmentColor0.x = 1.0 - spvNMin(spvNMin(1.0 - sampledTextureValue5.x, 1.0 - sampledTextureValue7.x), spvNMin(1.0 - sampledTextureValue4.x, 1.0 - sampledTextureValue6.x));
    fragmentColor0.y = 1.0 - spvNMax(spvNMax(1.0 - sampledTextureValue5.y, 1.0 - sampledTextureValue7.y), spvNMax(1.0 - sampledTextureValue4.y, 1.0 - sampledTextureValue6.y));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = fragmentVectorConstants1.packedValues[1u].z * 0.5;
    float productValue1 = fragmentVectorConstants1.packedValues[1u].w * 0.5;
    float sumValue = varyingTexCoord0.x - productValue;
    float sumValue1 = varyingTexCoord0.y - productValue1;
    vec4 sampledTextureValue = textureLod(sampler2D(previousMipTexture, previousMipSampler), vec2(sumValue, sumValue1), fragmentVectorConstants1.packedValues[0u].x);
    float sumValue2 = productValue + varyingTexCoord0.x;
    vec4 sampledTextureValue1 = textureLod(sampler2D(previousMipTexture, previousMipSampler), vec2(sumValue2, sumValue1), fragmentVectorConstants1.packedValues[0u].x);
    float sumValue3 = productValue1 + varyingTexCoord0.y;
    vec4 sampledTextureValue2 = textureLod(sampler2D(previousMipTexture, previousMipSampler), vec2(sumValue, sumValue3), fragmentVectorConstants1.packedValues[0u].x);
    vec4 sampledTextureValue3 = textureLod(sampler2D(previousMipTexture, previousMipSampler), vec2(sumValue2, sumValue3), fragmentVectorConstants1.packedValues[0u].x);
    fragmentColor0.x = 1.0 - spvNMin(spvNMin(1.0 - sampledTextureValue.x, 1.0 - sampledTextureValue2.x), spvNMin(1.0 - sampledTextureValue1.x, 1.0 - sampledTextureValue3.x));
    fragmentColor0.y = 1.0 - spvNMax(spvNMax(1.0 - sampledTextureValue.y, 1.0 - sampledTextureValue2.y), spvNMax(1.0 - sampledTextureValue1.y, 1.0 - sampledTextureValue3.y));
#endif
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
}
