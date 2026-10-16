#version 460
#extension GL_GOOGLE_include_directive : require
// WaterSimulation / VerticalFFT / fragment forward pipeline.
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

#include "../../include/materials/WaterSimulation/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u]));
    precise float productValue7 = reinterpretedBits * 0.5;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u]));
    precise float productValue8 = varyingTexCoord0.x * reinterpretedBits1;
    precise float productValue9 = varyingTexCoord0.y * reinterpretedBits1;
    precise float quotientValue3 = productValue9 / productValue7;
    precise float quotientValue4 = productValue9 / reinterpretedBits;
    precise float productValue10 = quotientValue4 * (-6.283185482025146484375);
    float wavePhaseValue4 = sin(productValue10);
    float wavePhaseValue5 = cos(productValue10);
    float multiplyAddValue1 = fma(floor(quotientValue4), productValue7, fma(-productValue7, floor(quotientValue3), productValue9));
    uvec4 reinterpretedBits2 = floatBitsToUint(fragmentVectorConstants1.packedValues[0u]);
    float reinterpretedBits3 = uintBitsToFloat(reinterpretedBits2.w);
    precise float reinterpretedBits5 = productValue8 / uintBitsToFloat(reinterpretedBits2.z);
    precise float quotientValue5 = multiplyAddValue1 / reinterpretedBits3;
    precise float multiplyAddValue2 = fma(reinterpretedBits1, 0.5, multiplyAddValue1) / reinterpretedBits3;
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(reinterpretedBits5, multiplyAddValue2));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(reinterpretedBits5, quotientValue5));
    precise float productValue11 = scalarValue5 * wavePhaseValue4;
    precise float productValue12 = scalarValue4 * wavePhaseValue4;
    precise float multiplyAddValue3 = fma(wavePhaseValue5, scalarValue4, -productValue11) + sampledTextureValue5.x;
    precise float multiplyAddValue4 = fma(wavePhaseValue5, scalarValue5, productValue12) + sampledTextureValue5.y;
    fragmentColor0.x = multiplyAddValue3;
    fragmentColor0.y = multiplyAddValue4;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u]));
    float productValue4 = reinterpretedBits * 0.5;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u]));
    float productValue5 = varyingTexCoord0.y * reinterpretedBits1;
    float quotientValue2 = productValue5 / reinterpretedBits;
    float productValue6 = quotientValue2 * (-6.283185482025146484375);
    float wavePhaseValue2 = sin(productValue6);
    float wavePhaseValue3 = cos(productValue6);
    float multiplyAddValue = fma(floor(quotientValue2), productValue4, fma(-productValue4, floor(productValue5 / productValue4), productValue5));
    uvec4 reinterpretedBits2 = floatBitsToUint(fragmentVectorConstants1.packedValues[0u]);
    float reinterpretedBits3 = uintBitsToFloat(reinterpretedBits2.w);
    float reinterpretedBits4 = (varyingTexCoord0.x * reinterpretedBits1) / uintBitsToFloat(reinterpretedBits2.z);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(reinterpretedBits4, fma(reinterpretedBits1, 0.5, multiplyAddValue) / reinterpretedBits3));
    float scalarValue2 = sampledTextureValue2.x;
    float scalarValue3 = sampledTextureValue2.y;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(reinterpretedBits4, multiplyAddValue / reinterpretedBits3));
    fragmentColor0.x = fma(wavePhaseValue3, scalarValue2, -(scalarValue3 * wavePhaseValue2)) + sampledTextureValue3.x;
    fragmentColor0.y = fma(wavePhaseValue3, scalarValue3, scalarValue2 * wavePhaseValue2) + sampledTextureValue3.y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord0.x;
    float productValue1 = fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord0.y;
    float quotientValue = productValue1 / fragmentVectorConstants1.packedValues[1u].x;
    float productValue2 = fragmentVectorConstants1.packedValues[1u].x * 0.5;
    float quotientValue1 = (productValue1 - (floor(productValue1 / productValue2) * productValue2)) + (productValue2 * floor(quotientValue));
    vec4 sampledTextureValue = texture(sampler2D(simTextureTexture, simTextureSampler), vec2(productValue / fragmentVectorConstants1.packedValues[0u].z, quotientValue1 / fragmentVectorConstants1.packedValues[0u].w));
    vec4 sampledTextureValue1 = texture(sampler2D(simTextureTexture, simTextureSampler), vec2(productValue / fragmentVectorConstants1.packedValues[0u].z, (quotientValue1 + (fragmentVectorConstants1.packedValues[2u].x * 0.5)) / fragmentVectorConstants1.packedValues[0u].w));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float productValue3 = quotientValue * (-6.283185482025146484375);
    float wavePhaseValue = sin(productValue3);
    float wavePhaseValue1 = cos(productValue3);
    fragmentColor0.x = (sampledTextureValue.x - (wavePhaseValue * scalarValue1)) + (wavePhaseValue1 * scalarValue);
    fragmentColor0.y = ((wavePhaseValue * scalarValue) + sampledTextureValue.y) + (wavePhaseValue1 * scalarValue1);
#endif
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
}
