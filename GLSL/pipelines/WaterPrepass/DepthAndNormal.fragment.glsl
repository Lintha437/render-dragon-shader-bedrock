#version 460
#extension GL_GOOGLE_include_directive : require
// WaterPrepass / DepthAndNormal / fragment forward pipeline.
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
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/WaterPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[5u]);
    precise float reinterpretedBits13 = varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits.x);
    precise float reinterpretedBits14 = varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits.y);
    precise float reinterpretedBits15 = varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits.z);
    precise float reinterpretedBits16 = varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits.w);
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    uvec4 reinterpretedBits2 = floatBitsToUint(fragmentVectorConstants1.packedValues[6u]);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float multiplyAddValue8 = fma(uintBitsToFloat(reinterpretedBits2.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits1.x), varyingTexCoord3.x, reinterpretedBits13)) + uintBitsToFloat(reinterpretedBits3.x);
    precise float multiplyAddValue9 = fma(uintBitsToFloat(reinterpretedBits2.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits1.y), varyingTexCoord3.x, reinterpretedBits14)) + uintBitsToFloat(reinterpretedBits3.y);
    precise float multiplyAddValue10 = fma(uintBitsToFloat(reinterpretedBits2.z), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits1.z), varyingTexCoord3.x, reinterpretedBits15)) + uintBitsToFloat(reinterpretedBits3.z);
    precise float multiplyAddValue11 = fma(uintBitsToFloat(reinterpretedBits2.w), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits1.w), varyingTexCoord3.x, reinterpretedBits16)) + uintBitsToFloat(reinterpretedBits3.w);
    precise float quotientValue = multiplyAddValue8 / multiplyAddValue11;
    precise float quotientValue1 = multiplyAddValue9 / multiplyAddValue11;
    precise float quotientValue2 = multiplyAddValue10 / multiplyAddValue11;
    uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits17 = quotientValue1 * uintBitsToFloat(reinterpretedBits4.z);
    precise float reinterpretedBits18 = quotientValue1 * uintBitsToFloat(reinterpretedBits4.w);
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    uvec4 reinterpretedBits6 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue12 = fma(uintBitsToFloat(reinterpretedBits6.z), quotientValue2, fma(uintBitsToFloat(reinterpretedBits5.z), quotientValue, reinterpretedBits17)) + uintBitsToFloat(reinterpretedBits7.z);
    precise float multiplyAddValue13 = fma(uintBitsToFloat(reinterpretedBits6.w), quotientValue2, fma(uintBitsToFloat(reinterpretedBits5.w), quotientValue, reinterpretedBits18)) + uintBitsToFloat(reinterpretedBits7.w);
    precise float quotientValue3 = (-multiplyAddValue12) / multiplyAddValue13;
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float sumValue3 = quotientValue3 - reinterpretedBits8;
    precise float reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits8;
    precise float quotientValue4 = sumValue3 / reinterpretedBits19;
    precise float multiplyAddValue14 = log2(fma(quotientValue4, 53.598148345947265625, 1.0)) * 0.17328679561614990234375;
    fragmentColor0.x = multiplyAddValue14;
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[3u]);
    precise float reinterpretedBits20 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits9.x);
    precise float reinterpretedBits21 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits9.y);
    precise float reinterpretedBits22 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits9.z);
    vec3 vectorValue1 = vec3(reinterpretedBits20, reinterpretedBits21, reinterpretedBits22);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    precise float productValue = inverseLengthValue2 * reinterpretedBits20;
    precise float productValue1 = inverseLengthValue2 * reinterpretedBits21;
    precise float productValue2 = inverseLengthValue2 * reinterpretedBits22;
    fragmentColor0.y = abs(rdDot3Precise2(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(productValue, productValue1, productValue2)));
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[5u]);
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    uvec4 reinterpretedBits2 = floatBitsToUint(fragmentVectorConstants1.packedValues[6u]);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float multiplyAddValue = fma(uintBitsToFloat(reinterpretedBits2.w), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits1.w), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits.w))) + uintBitsToFloat(reinterpretedBits3.w);
    float multiplyAddValue1 = (fma(uintBitsToFloat(reinterpretedBits2.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits1.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits.x))) + uintBitsToFloat(reinterpretedBits3.x)) / multiplyAddValue;
    float multiplyAddValue2 = (fma(uintBitsToFloat(reinterpretedBits2.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits1.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits.y))) + uintBitsToFloat(reinterpretedBits3.y)) / multiplyAddValue;
    float multiplyAddValue3 = (fma(uintBitsToFloat(reinterpretedBits2.z), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits1.z), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits.z))) + uintBitsToFloat(reinterpretedBits3.z)) / multiplyAddValue;
    uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    uvec4 reinterpretedBits6 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    fragmentColor0.x = log2(fma((((-(fma(uintBitsToFloat(reinterpretedBits6.z), multiplyAddValue3, fma(uintBitsToFloat(reinterpretedBits5.z), multiplyAddValue1, multiplyAddValue2 * uintBitsToFloat(reinterpretedBits4.z))) + uintBitsToFloat(reinterpretedBits7.z))) / (fma(uintBitsToFloat(reinterpretedBits6.w), multiplyAddValue3, fma(uintBitsToFloat(reinterpretedBits5.w), multiplyAddValue1, multiplyAddValue2 * uintBitsToFloat(reinterpretedBits4.w))) + uintBitsToFloat(reinterpretedBits7.w))) - reinterpretedBits8) / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits8), 53.598148345947265625, 1.0)) * 0.17328679561614990234375;
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[3u]);
    float reinterpretedBits10 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits9.x);
    float reinterpretedBits11 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits12 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits9.z);
    vec3 vectorValue = vec3(reinterpretedBits10, reinterpretedBits11, reinterpretedBits12);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    fragmentColor0.y = abs(rdDot3Precise2(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(inverseLengthValue * reinterpretedBits10, inverseLengthValue * reinterpretedBits11, inverseLengthValue * reinterpretedBits12)));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue5 = (fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue4;
    float multiplyAddValue6 = (fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue4;
    float multiplyAddValue7 = (fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].z) / multiplyAddValue4;
    float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[3u].x;
    float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[3u].y;
    float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[3u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue, sumValue1, sumValue2), vec3(sumValue, sumValue1, sumValue2)));
    fragmentColor0.x = log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[11u].z + fma(fragmentVectorConstants1.packedValues[10u].z, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[9u].z, multiplyAddValue6, multiplyAddValue5 * fragmentVectorConstants1.packedValues[8u].z)))) / (fma(fragmentVectorConstants1.packedValues[10u].w, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[9u].w, multiplyAddValue6, multiplyAddValue5 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375;
    fragmentColor0.y = abs(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(inverseLengthValue1 * sumValue, inverseLengthValue1 * sumValue1, inverseLengthValue1 * sumValue2)));
#endif
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 1.0;
}
