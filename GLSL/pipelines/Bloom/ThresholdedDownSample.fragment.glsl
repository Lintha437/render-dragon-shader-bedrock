#version 460
#extension GL_GOOGLE_include_directive : require
// Bloom / ThresholdedDownSample / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 5
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/Bloom/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[1u]);
    float reinterpretedBits1 = uintBitsToFloat(reinterpretedBits.z);
    float reinterpretedBits2 = uintBitsToFloat(reinterpretedBits.w);
    precise float quotientValue4 = 2.0 / reinterpretedBits1;
    precise float quotientValue5 = 2.0 / reinterpretedBits2;
    float reinterpretedBits3 = uintBitsToFloat(reinterpretedBits.x);
    float reinterpretedBits4 = uintBitsToFloat(reinterpretedBits.y);
    precise float productValue2 = quotientValue4 * reinterpretedBits3;
    precise float productValue3 = quotientValue5 * reinterpretedBits4;
    precise float productValue4 = reinterpretedBits3 * reinterpretedBits1;
    precise float productValue5 = reinterpretedBits4 * reinterpretedBits2;
    precise float sumValue = floor(productValue4) - 0.5;
    precise float sumValue1 = floor(productValue5) - 0.5;
    precise float quotientValue6 = sumValue / reinterpretedBits1;
    precise float quotientValue7 = sumValue1 / reinterpretedBits2;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(fma(productValue2, 1.5, varyingTexCoord0.x), quotientValue6), spvNMin(fma(productValue3, 1.5, varyingTexCoord0.y), quotientValue7)));
    float scalarValue5 = sampledTextureValue6.x;
    precise float sampledTextureValue7 = texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[1u]));
    float comparisonValue9 = float(rdDot3Precise2(vec3(scalarValue5, sampledTextureValue6.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= sampledTextureValue7);
    precise float productValue6 = comparisonValue9 * scalarValue5;
    precise float productValue7 = comparisonValue9 * sampledTextureValue6.y;
    precise float productValue8 = comparisonValue9 * sampledTextureValue6.z;
    precise float productValue9 = comparisonValue9 * sampledTextureValue6.w;
    precise float productValue10 = productValue6 * 0.125;
    precise float productValue11 = productValue7 * 0.125;
    precise float productValue12 = productValue8 * 0.125;
    precise float productValue13 = productValue9 * 0.125;
    vec4 sampledTextureValue8 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue6, varyingTexCoord0.x), spvNMin(quotientValue7, varyingTexCoord0.y)));
    float scalarValue6 = sampledTextureValue8.x;
    float comparisonValue10 = float(rdDot3Precise2(vec3(scalarValue6, sampledTextureValue8.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= sampledTextureValue7);
    precise float productValue14 = comparisonValue10 * scalarValue6;
    precise float productValue15 = comparisonValue10 * sampledTextureValue8.y;
    precise float productValue16 = comparisonValue10 * sampledTextureValue8.z;
    precise float productValue17 = comparisonValue10 * sampledTextureValue8.w;
    precise float productValue18 = productValue2 * 1.5;
    precise float productValue19 = productValue3 * 1.5;
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue6, fma(-productValue2, 1.5, varyingTexCoord0.x)), spvNMin(quotientValue7, fma(-productValue3, 1.5, varyingTexCoord0.y))));
    float scalarValue7 = sampledTextureValue9.x;
    precise float sumValue2 = varyingTexCoord0.x - productValue18;
    precise float sumValue3 = productValue19 + varyingTexCoord0.y;
    precise float sumValue4 = productValue18 + varyingTexCoord0.x;
    precise float sumValue5 = varyingTexCoord0.y - productValue19;
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue6, sumValue2), spvNMin(quotientValue7, sumValue3)));
    float scalarValue8 = sampledTextureValue10.x;
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue6, sumValue4), spvNMin(quotientValue7, sumValue5)));
    float scalarValue9 = sampledTextureValue11.x;
    float comparisonValue11 = float(rdDot3Precise2(vec3(scalarValue8, sampledTextureValue10.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= sampledTextureValue7);
    precise float productValue20 = comparisonValue11 * scalarValue8;
    precise float productValue21 = comparisonValue11 * sampledTextureValue10.y;
    precise float productValue22 = comparisonValue11 * sampledTextureValue10.z;
    precise float productValue23 = comparisonValue11 * sampledTextureValue10.w;
    float comparisonValue12 = float(rdDot3Precise2(vec3(scalarValue9, sampledTextureValue11.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= sampledTextureValue7);
    precise float productValue24 = comparisonValue12 * scalarValue9;
    precise float productValue25 = comparisonValue12 * sampledTextureValue11.y;
    precise float productValue26 = comparisonValue12 * sampledTextureValue11.z;
    precise float productValue27 = comparisonValue12 * sampledTextureValue11.w;
    float comparisonValue13 = float(rdDot3Precise2(vec3(scalarValue7, sampledTextureValue9.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= sampledTextureValue7);
    precise float productValue28 = comparisonValue13 * scalarValue7;
    precise float productValue29 = comparisonValue13 * sampledTextureValue9.y;
    precise float productValue30 = comparisonValue13 * sampledTextureValue9.z;
    precise float productValue31 = comparisonValue13 * sampledTextureValue9.w;
    fragmentColor0.x = fma(productValue28, 0.125, fma(productValue24, 0.125, fma(productValue20, 0.125, fma(productValue14, 0.5, productValue10))));
    fragmentColor0.y = fma(productValue29, 0.125, fma(productValue25, 0.125, fma(productValue21, 0.125, fma(productValue15, 0.5, productValue11))));
    fragmentColor0.z = fma(productValue30, 0.125, fma(productValue26, 0.125, fma(productValue22, 0.125, fma(productValue16, 0.5, productValue12))));
    fragmentColor0.w = fma(productValue31, 0.125, fma(productValue27, 0.125, fma(productValue23, 0.125, fma(productValue17, 0.5, productValue13))));
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[1u]);
    float reinterpretedBits1 = uintBitsToFloat(reinterpretedBits.z);
    float reinterpretedBits2 = uintBitsToFloat(reinterpretedBits.w);
    float reinterpretedBits3 = uintBitsToFloat(reinterpretedBits.x);
    float reinterpretedBits4 = uintBitsToFloat(reinterpretedBits.y);
    float quotientValue = (2.0 / reinterpretedBits1) * reinterpretedBits3;
    float quotientValue1 = (2.0 / reinterpretedBits2) * reinterpretedBits4;
    float productValue = quotientValue * 1.5;
    float productValue1 = quotientValue1 * 1.5;
    float quotientValue2 = (floor(reinterpretedBits3 * reinterpretedBits1) - 0.5) / reinterpretedBits1;
    float quotientValue3 = (floor(reinterpretedBits4 * reinterpretedBits2) - 0.5) / reinterpretedBits2;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(fma(quotientValue, 1.5, varyingTexCoord0.x), quotientValue2), spvNMin(fma(quotientValue1, 1.5, varyingTexCoord0.y), quotientValue3)));
    float scalarValue = sampledTextureValue.x;
    float sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[1u]));
    bool comparisonValue = rdDot3Precise2(vec3(scalarValue, sampledTextureValue.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= sampledTextureValue1;
    float comparisonValue1 = comparisonValue ? (scalarValue * 0.125) : 0.0;
    float comparisonValue2 = comparisonValue ? (sampledTextureValue.y * 0.125) : 0.0;
    float comparisonValue3 = comparisonValue ? (sampledTextureValue.z * 0.125) : 0.0;
    float comparisonValue4 = comparisonValue ? (sampledTextureValue.w * 0.125) : 0.0;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue2, varyingTexCoord0.x), spvNMin(quotientValue3, varyingTexCoord0.y)));
    float scalarValue1 = sampledTextureValue2.x;
    bool comparisonValue5 = rdDot3Precise2(vec3(scalarValue1, sampledTextureValue2.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= sampledTextureValue1;
    float multiplyAddValue = comparisonValue5 ? fma(scalarValue1, 0.5, comparisonValue1) : comparisonValue1;
    float multiplyAddValue1 = comparisonValue5 ? fma(sampledTextureValue2.y, 0.5, comparisonValue2) : comparisonValue2;
    float multiplyAddValue2 = comparisonValue5 ? fma(sampledTextureValue2.z, 0.5, comparisonValue3) : comparisonValue3;
    float multiplyAddValue3 = comparisonValue5 ? fma(sampledTextureValue2.w, 0.5, comparisonValue4) : comparisonValue4;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue2, fma(-quotientValue, 1.5, varyingTexCoord0.x)), spvNMin(quotientValue3, fma(-quotientValue1, 1.5, varyingTexCoord0.y))));
    float scalarValue2 = sampledTextureValue3.x;
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue2, varyingTexCoord0.x - productValue), spvNMin(quotientValue3, productValue1 + varyingTexCoord0.y)));
    float scalarValue3 = sampledTextureValue4.x;
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue2, productValue + varyingTexCoord0.x), spvNMin(quotientValue3, varyingTexCoord0.y - productValue1)));
    float scalarValue4 = sampledTextureValue5.x;
    bool comparisonValue6 = rdDot3Precise2(vec3(scalarValue3, sampledTextureValue4.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= sampledTextureValue1;
    float multiplyAddValue4 = comparisonValue6 ? fma(scalarValue3, 0.125, multiplyAddValue) : multiplyAddValue;
    float multiplyAddValue5 = comparisonValue6 ? fma(sampledTextureValue4.y, 0.125, multiplyAddValue1) : multiplyAddValue1;
    float multiplyAddValue6 = comparisonValue6 ? fma(sampledTextureValue4.z, 0.125, multiplyAddValue2) : multiplyAddValue2;
    float multiplyAddValue7 = comparisonValue6 ? fma(sampledTextureValue4.w, 0.125, multiplyAddValue3) : multiplyAddValue3;
    bool comparisonValue7 = rdDot3Precise2(vec3(scalarValue4, sampledTextureValue5.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= sampledTextureValue1;
    float multiplyAddValue8 = comparisonValue7 ? fma(scalarValue4, 0.125, multiplyAddValue4) : multiplyAddValue4;
    float multiplyAddValue9 = comparisonValue7 ? fma(sampledTextureValue5.y, 0.125, multiplyAddValue5) : multiplyAddValue5;
    float multiplyAddValue10 = comparisonValue7 ? fma(sampledTextureValue5.z, 0.125, multiplyAddValue6) : multiplyAddValue6;
    float multiplyAddValue11 = comparisonValue7 ? fma(sampledTextureValue5.w, 0.125, multiplyAddValue7) : multiplyAddValue7;
    bool comparisonValue8 = rdDot3Precise2(vec3(scalarValue2, sampledTextureValue3.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= sampledTextureValue1;
    fragmentColor0.x = comparisonValue8 ? fma(scalarValue2, 0.125, multiplyAddValue8) : multiplyAddValue8;
    fragmentColor0.y = comparisonValue8 ? fma(sampledTextureValue3.y, 0.125, multiplyAddValue9) : multiplyAddValue9;
    fragmentColor0.z = comparisonValue8 ? fma(sampledTextureValue3.z, 0.125, multiplyAddValue10) : multiplyAddValue10;
    fragmentColor0.w = comparisonValue8 ? fma(sampledTextureValue3.w, 0.125, multiplyAddValue11) : multiplyAddValue11;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float quotientValue8 = (3.0 / fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].x;
    float quotientValue9 = (3.0 / fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[1u].y;
    float quotientValue10 = (floor(fragmentVectorConstants1.packedValues[1u].x * fragmentVectorConstants1.packedValues[1u].z) + (-0.5)) / fragmentVectorConstants1.packedValues[1u].z;
    float quotientValue11 = (floor(fragmentVectorConstants1.packedValues[1u].y * fragmentVectorConstants1.packedValues[1u].w) + (-0.5)) / fragmentVectorConstants1.packedValues[1u].w;
    float sampledTextureValue12 = texture(sampler2D(averageLuminanceTexture, averageLuminanceSampler), vec2(0.5)).x * fragmentVectorConstants1.packedValues[0u].y;
    vec4 sampledTextureValue13 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(spvNMin(varyingTexCoord0.x, quotientValue10), spvNMin(varyingTexCoord0.y, quotientValue11)));
    float scalarValue10 = sampledTextureValue13.x;
    float dotProductValue = (dot(vec3(scalarValue10, sampledTextureValue13.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < sampledTextureValue12) ? 0.0 : 0.5;
    float sumValue6 = spvNMin(quotientValue8 + varyingTexCoord0.x, quotientValue10);
    float sumValue7 = spvNMin(quotientValue9 + varyingTexCoord0.y, quotientValue11);
    vec4 sampledTextureValue14 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue6, sumValue7));
    float scalarValue11 = sampledTextureValue14.x;
    float dotProductValue1 = (dot(vec3(scalarValue11, sampledTextureValue14.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < sampledTextureValue12) ? 0.0 : 1.0;
    float sumValue8 = spvNMin(varyingTexCoord0.x - quotientValue8, quotientValue10);
    vec4 sampledTextureValue15 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue8, sumValue7));
    float scalarValue12 = sampledTextureValue15.x;
    float dotProductValue2 = (dot(vec3(scalarValue12, sampledTextureValue15.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < sampledTextureValue12) ? 0.0 : 1.0;
    float sumValue9 = spvNMin(varyingTexCoord0.y - quotientValue9, quotientValue11);
    vec4 sampledTextureValue16 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue6, sumValue9));
    float scalarValue13 = sampledTextureValue16.x;
    float dotProductValue3 = (dot(vec3(scalarValue13, sampledTextureValue16.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < sampledTextureValue12) ? 0.0 : 1.0;
    vec4 sampledTextureValue17 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue8, sumValue9));
    float scalarValue14 = sampledTextureValue17.x;
    float dotProductValue4 = (dot(vec3(scalarValue14, sampledTextureValue17.yz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < sampledTextureValue12) ? 0.0 : 1.0;
    fragmentColor0.x = (((((dotProductValue2 * scalarValue12) + (dotProductValue1 * scalarValue11)) + (dotProductValue3 * scalarValue13)) + (dotProductValue4 * scalarValue14)) * 0.125) + (dotProductValue * scalarValue10);
    fragmentColor0.y = (((((dotProductValue2 * sampledTextureValue15.y) + (dotProductValue1 * sampledTextureValue14.y)) + (dotProductValue3 * sampledTextureValue16.y)) + (dotProductValue4 * sampledTextureValue17.y)) * 0.125) + (dotProductValue * sampledTextureValue13.y);
    fragmentColor0.z = (((((dotProductValue2 * sampledTextureValue15.z) + (dotProductValue1 * sampledTextureValue14.z)) + (dotProductValue3 * sampledTextureValue16.z)) + (dotProductValue4 * sampledTextureValue17.z)) * 0.125) + (dotProductValue * sampledTextureValue13.z);
    fragmentColor0.w = (((((dotProductValue2 * sampledTextureValue15.w) + (dotProductValue1 * sampledTextureValue14.w)) + (dotProductValue3 * sampledTextureValue16.w)) + (dotProductValue4 * sampledTextureValue17.w)) * 0.125) + (dotProductValue * sampledTextureValue13.w);
#endif
}
