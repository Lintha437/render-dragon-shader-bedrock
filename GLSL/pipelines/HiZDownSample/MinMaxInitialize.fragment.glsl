#version 460
#extension GL_GOOGLE_include_directive : require
// HiZDownSample / MinMaxInitialize / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/HiZDownSample/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits2 = varyingTexCoord0.x * uintBitsToFloat(reinterpretedBits.x);
    precise float reinterpretedBits3 = varyingTexCoord0.y * uintBitsToFloat(reinterpretedBits.y);
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    precise float reinterpretedBits4 = reinterpretedBits2 * uintBitsToFloat(reinterpretedBits1.z);
    precise float reinterpretedBits5 = reinterpretedBits3 * uintBitsToFloat(reinterpretedBits1.w);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(reinterpretedBits4, reinterpretedBits5));
    float scalarValue2 = sampledTextureValue2.x;
    precise float sumValue = 1.0 - scalarValue2;
    fragmentColor0.x = sumValue;
    precise float multiplyAddValue1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[30u])) / fma(scalarValue2, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[27u])), uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[31u])));
    precise float reinterpretedBits6 = multiplyAddValue1 - uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    precise float reinterpretedBits7 = reinterpretedBits6 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u]));
    precise float multiplyAddValue2 = fma(reinterpretedBits6, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u])), uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[14u]))) / reinterpretedBits7;
    precise float sumValue1 = 1.0 - multiplyAddValue2;
    fragmentColor0.y = sumValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2((varyingTexCoord0.x * uintBitsToFloat(reinterpretedBits.x)) * uintBitsToFloat(reinterpretedBits1.z), (varyingTexCoord0.y * uintBitsToFloat(reinterpretedBits.y)) * uintBitsToFloat(reinterpretedBits1.w)));
    float scalarValue1 = sampledTextureValue1.x;
    fragmentColor0.x = 1.0 - scalarValue1;
    float multiplyAddValue = (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[30u])) / fma(scalarValue1, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[27u])), uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[31u])))) - uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    fragmentColor0.y = 1.0 - (fma(multiplyAddValue, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u])), uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[14u]))) / (multiplyAddValue * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u]))));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(previousMipTexture, previousMipSampler), vec2((fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord0.x) * fragmentVectorConstants1.packedValues[10u].z, (fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord0.y) * fragmentVectorConstants1.packedValues[10u].w));
    float scalarValue = sampledTextureValue.x;
    float quotientValue = (fragmentVectorConstants1.packedValues[7u].z / ((scalarValue * fragmentVectorConstants1.packedValues[6u].w) + fragmentVectorConstants1.packedValues[7u].w)) - fragmentVectorConstants1.packedValues[8u].x;
    fragmentColor0.x = 1.0 - scalarValue;
    fragmentColor0.y = 1.0 - (((quotientValue * fragmentVectorConstants1.packedValues[2u].z) + fragmentVectorConstants1.packedValues[3u].z) / (quotientValue * fragmentVectorConstants1.packedValues[2u].w));
#endif
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
}
