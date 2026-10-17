#version 460
#extension GL_GOOGLE_include_directive : require
// TextureShiftRenderChunkPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
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
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE2_FLOAT_8 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION2_FLOAT_7 1
#endif

#include "../../include/materials/TextureShiftRenderChunkPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool comparisonValue = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
#endif
    uint productValue = uint(int(varyingTexCoord6.y * 65535.0));
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint productValue51 = productValue * 8u;
    vec4 sampledTextureValue29 = uintBitsToFloat(uvec4(texelFetch(intermediateValue2, int(productValue51)).x, texelFetch(intermediateValue2, int(productValue51 + 1u)).x, texelFetch(intermediateValue2, int(productValue51 + 2u)).x, texelFetch(intermediateValue2, int(productValue51 + 3u)).x));
    uint productValue52 = (productValue * 8u) + 4u;
    vec4 sampledTextureValue30 = uintBitsToFloat(uvec4(texelFetch(intermediateValue2, int(productValue52)).x, texelFetch(intermediateValue2, int(productValue52 + 1u)).x, texelFetch(intermediateValue2, int(productValue52 + 2u)).x, texelFetch(intermediateValue2, int(productValue52 + 3u)).x));
    float scalarValue22 = sampledTextureValue30.x;
    float scalarValue23 = sampledTextureValue30.y;
    float scalarValue24 = sampledTextureValue30.z;
    float multiplyAddValue12 = fma(-varyingTexCoord6.x, sampledTextureValue30.w, 1.0);
    float comparisonValue25 = (scalarValue24 == 0.0) ? float(scalarValue23 >= multiplyAddValue12) : (1.0 - spvNClamp((multiplyAddValue12 - scalarValue23) / scalarValue24, 0.0, 1.0));
    float sumValue9 = sampledTextureValue29.x + varyingTexCoord0.x;
    float sumValue10 = sampledTextureValue29.y + varyingTexCoord0.y;
    float sumValue11 = sampledTextureValue29.z + varyingTexCoord0.x;
    float sumValue12 = sampledTextureValue29.w + varyingTexCoord0.y;
    vec4 sampledTextureValue31 = texture(sampler2D(materialTexture1, textureSampler1), vec2(sumValue9, sumValue10));
    float scalarValue25 = sampledTextureValue31.x;
    float scalarValue26 = sampledTextureValue31.y;
    float scalarValue27 = sampledTextureValue31.z;
    float scalarValue28 = sampledTextureValue31.w;
    vec4 sampledTextureValue32 = texture(sampler2D(materialTexture1, textureSampler1), vec2(sumValue11, sumValue12));
    float scalarValue29 = sampledTextureValue32.w;
    bool comparisonValue26 = scalarValue28 >= 0.5;
    bool comparisonValue27 = scalarValue29 >= 0.5;
    float productValue53 = spvNMin(comparisonValue25 * 4.0, 1.0);
    float comparisonValue28 = ((comparisonValue26 && comparisonValue27) || (!(comparisonValue26 || comparisonValue27))) ? float(comparisonValue26) : (comparisonValue27 ? productValue53 : (1.0 - productValue53));
    bool comparisonValue29 = comparisonValue28 <= 0.0;
    bool comparisonValue30 = comparisonValue29 || (comparisonValue28 >= 1.0);
    float multiplyAddValue17 = rdDot2Precise2(vec2(floor(fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[9u].x), floor(fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[9u].y)), vec2(0.067110560834407806396484375, 0.005837149918079376220703125));
    bool comparisonValue31 = (comparisonValue30 && comparisonValue29) || ((fract(fract(multiplyAddValue17) * 52.98291778564453125) >= comparisonValue28) && (!comparisonValue30));
    if (comparisonValue31)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint productValue51 = productValue * 8u;
    vec4 sampledTextureValue29 = uintBitsToFloat(uvec4(texelFetch(intermediateValue2, int(productValue51)).x, texelFetch(intermediateValue2, int(productValue51 + 1u)).x, texelFetch(intermediateValue2, int(productValue51 + 2u)).x, texelFetch(intermediateValue2, int(productValue51 + 3u)).x));
    uint productValue52 = (productValue * 8u) + 4u;
    vec4 sampledTextureValue30 = uintBitsToFloat(uvec4(texelFetch(intermediateValue2, int(productValue52)).x, texelFetch(intermediateValue2, int(productValue52 + 1u)).x, texelFetch(intermediateValue2, int(productValue52 + 2u)).x, texelFetch(intermediateValue2, int(productValue52 + 3u)).x));
    float scalarValue22 = sampledTextureValue30.x;
    float scalarValue23 = sampledTextureValue30.y;
    float scalarValue24 = sampledTextureValue30.z;
    float multiplyAddValue12 = fma(-varyingTexCoord6.x, sampledTextureValue30.w, 1.0);
    float comparisonValue25 = (scalarValue24 == 0.0) ? float(scalarValue23 >= multiplyAddValue12) : (1.0 - spvNClamp((multiplyAddValue12 - scalarValue23) / scalarValue24, 0.0, 1.0));
    float sumValue9 = sampledTextureValue29.x + varyingTexCoord0.x;
    float sumValue10 = sampledTextureValue29.y + varyingTexCoord0.y;
    float sumValue11 = sampledTextureValue29.z + varyingTexCoord0.x;
    float sumValue12 = sampledTextureValue29.w + varyingTexCoord0.y;
    vec4 sampledTextureValue31 = texture(sampler2D(materialTexture1, textureSampler1), vec2(sumValue9, sumValue10));
    float scalarValue25 = sampledTextureValue31.x;
    float scalarValue26 = sampledTextureValue31.y;
    float scalarValue27 = sampledTextureValue31.z;
    float scalarValue28 = sampledTextureValue31.w;
    vec4 sampledTextureValue32 = texture(sampler2D(materialTexture1, textureSampler1), vec2(sumValue11, sumValue12));
    float scalarValue29 = sampledTextureValue32.w;
    bool comparisonValue26 = scalarValue28 >= 0.5;
    bool comparisonValue27 = scalarValue29 >= 0.5;
    float productValue53 = spvNMin(comparisonValue25 * 4.0, 1.0);
    float comparisonValue61 = ((!(comparisonValue26 || comparisonValue27)) || (comparisonValue26 && comparisonValue27)) ? float(comparisonValue26) : (comparisonValue27 ? productValue53 : (1.0 - productValue53));
    bool comparisonValue62 = comparisonValue61 <= 0.0;
    bool comparisonValue63 = comparisonValue62 || (comparisonValue61 >= 1.0);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue40 = fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits3.x);
    float multiplyAddValue41 = fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits3.y);
    float scalarValue67 = rdDot2Precise2(vec2(floor(multiplyAddValue40), floor(multiplyAddValue41)), vec2(0.067110560834407806396484375, 0.005837149918079376220703125));
    bool comparisonValue64 = ((fract(fract(scalarValue67) * 52.98291778564453125) >= comparisonValue61) && (!comparisonValue63)) || (comparisonValue63 && comparisonValue62);
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue6 = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue68 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue17 = inversesqrt(scalarValue68);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits8 = rdDot3Precise(vec3(-(inverseLengthValue17 * reinterpretedBits4), -(inverseLengthValue17 * reinterpretedBits5), -(inverseLengthValue17 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits7.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits7.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits7.z)));
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
    float reinterpretedBits10 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[61u])) - reinterpretedBits9)) * (reinterpretedBits8 - reinterpretedBits9), 0.0, 1.0);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[62u]));
    float quotientValue7 = floor(multiplyAddValue40 / reinterpretedBits11) * reinterpretedBits11;
    float quotientValue8 = floor(multiplyAddValue41 / reinterpretedBits11) * reinterpretedBits11;
    float productValue82 = floor(quotientValue8 * 0.25);
    float productValue83 = floor(quotientValue8 * 0.5);
    float scalarValue69 = floor(quotientValue8);
    if (comparisonValue64 || ((varyingTexCoord2.x > 0.5) && ((fma(fma(fma(fract(fma(floor(quotientValue7 * 0.25), 0.5, (productValue82 * productValue82) * 0.75)), 0.25, fract(fma(floor(quotientValue7 * 0.5), 0.5, (productValue83 * productValue83) * 0.75))), 0.25, fract(fma(floor(quotientValue7), 0.5, (scalarValue69 * scalarValue69) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits10 * reinterpretedBits10) * fma(reinterpretedBits10, -2.0, 3.0)))))
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue = uintBitsToFloat(texelFetch(textureShiftBufferData, int(productValue * 8u)).x);
    float sampledTextureValue1 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 1u)).x);
    float sampledTextureValue2 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 2u)).x);
    float sampledTextureValue3 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 3u)).x);
    uvec4 sampledTextureValue4 = texelFetch(textureShiftBufferData, int((productValue * 8u) + 4u));
    uint scalarValue = sampledTextureValue4.x;
    float sampledTextureValue5 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 5u)).x);
    float sampledTextureValue6 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 6u)).x);
    float sampledTextureValue7 = 1.0 - (uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 7u)).x) * varyingTexCoord6.x);
    float quotientValue;
    if (sampledTextureValue6 == 0.0)
    {
        quotientValue = (sampledTextureValue5 < sampledTextureValue7) ? 0.0 : 1.0;
    }
    else
    {
        quotientValue = 1.0 - spvNMin(spvNMax((sampledTextureValue7 - sampledTextureValue5) / sampledTextureValue6, 0.0), 1.0);
    }
    bool conditionValue = quotientValue < 0.5;
    precise float comparisonValue1 = varyingTexCoord0.y + (conditionValue ? sampledTextureValue1 : sampledTextureValue3);
    precise float comparisonValue2 = varyingTexCoord0.x + (conditionValue ? sampledTextureValue : sampledTextureValue2);
    uint comparisonValue3 = (conditionValue ? (scalarValue >> 16u) : scalarValue) & 65535u;
    vec4 sampledTextureValue8 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(sampledTextureValue + varyingTexCoord0.x, sampledTextureValue1 + varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue8.x;
    float scalarValue2 = sampledTextureValue8.y;
    float scalarValue3 = sampledTextureValue8.z;
    float scalarValue4 = sampledTextureValue8.w;
    vec4 sampledTextureValue9 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(sampledTextureValue2 + varyingTexCoord0.x, sampledTextureValue3 + varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue9.w;
    float productValue1 = scalarValue5 * quotientValue;
    float productValue2 = productValue1 + (scalarValue4 * (1.0 - quotientValue));
    float comparisonValue4 = (productValue2 > 0.0) ? (productValue1 / productValue2) : 0.0;
    float productValue3 = (comparisonValue4 * (sampledTextureValue9.x - scalarValue1)) + scalarValue1;
    float productValue4 = (comparisonValue4 * (sampledTextureValue9.y - scalarValue2)) + scalarValue2;
    float productValue5 = (comparisonValue4 * (sampledTextureValue9.z - scalarValue3)) + scalarValue3;
    bool comparisonValue5 = scalarValue4 >= 0.5;
    bool comparisonValue6 = scalarValue5 >= 0.5;
    float comparisonValue7;
    if (comparisonValue5 != comparisonValue6)
    {
        float productValue6 = spvNMin(spvNMax(quotientValue * 4.0, 0.0), 1.0);
        comparisonValue7 = comparisonValue6 ? productValue6 : (1.0 - productValue6);
    }
    else
    {
        comparisonValue7 = float(comparisonValue5);
    }
    bool comparisonValue8 = comparisonValue7 <= 0.0;
    bool intermediateValue9;
    if (comparisonValue8 || (comparisonValue7 >= 1.0))
    {
        intermediateValue9 = comparisonValue8;
    }
    else
    {
        intermediateValue9 = comparisonValue7 <= fract(fract(dot(vec2(floor((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[9u].x), floor((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[9u].y)), vec2(0.067110560834407806396484375, 0.005837149918079376220703125))) * 52.98291778564453125);
    }
    float comparisonValue9 = intermediateValue9 ? 0.0 : 1.0;
    if (intermediateValue9)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue = uintBitsToFloat(texelFetch(textureShiftBufferData, int(productValue * 8u)).x);
    float sampledTextureValue1 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 1u)).x);
    float sampledTextureValue2 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 2u)).x);
    float sampledTextureValue3 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 3u)).x);
    uvec4 sampledTextureValue4 = texelFetch(textureShiftBufferData, int((productValue * 8u) + 4u));
    uint scalarValue = sampledTextureValue4.x;
    float sampledTextureValue5 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 5u)).x);
    float sampledTextureValue6 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 6u)).x);
    float sampledTextureValue7 = 1.0 - (uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 7u)).x) * varyingTexCoord6.x);
    float quotientValue;
    if (sampledTextureValue6 == 0.0)
    {
        quotientValue = (sampledTextureValue5 < sampledTextureValue7) ? 0.0 : 1.0;
    }
    else
    {
        quotientValue = 1.0 - spvNMin(spvNMax((sampledTextureValue7 - sampledTextureValue5) / sampledTextureValue6, 0.0), 1.0);
    }
    bool conditionValue = quotientValue < 0.5;
    precise float comparisonValue1 = varyingTexCoord0.y + (conditionValue ? sampledTextureValue1 : sampledTextureValue3);
    precise float comparisonValue2 = varyingTexCoord0.x + (conditionValue ? sampledTextureValue : sampledTextureValue2);
    uint comparisonValue3 = (conditionValue ? (scalarValue >> 16u) : scalarValue) & 65535u;
    vec4 sampledTextureValue8 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(sampledTextureValue + varyingTexCoord0.x, sampledTextureValue1 + varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue8.x;
    float scalarValue2 = sampledTextureValue8.y;
    float scalarValue3 = sampledTextureValue8.z;
    float scalarValue4 = sampledTextureValue8.w;
    vec4 sampledTextureValue9 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(sampledTextureValue2 + varyingTexCoord0.x, sampledTextureValue3 + varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue9.w;
    float productValue1 = scalarValue5 * quotientValue;
    float productValue2 = productValue1 + (scalarValue4 * (1.0 - quotientValue));
    float comparisonValue4 = (productValue2 > 0.0) ? (productValue1 / productValue2) : 0.0;
    float productValue3 = (comparisonValue4 * (sampledTextureValue9.x - scalarValue1)) + scalarValue1;
    float productValue4 = (comparisonValue4 * (sampledTextureValue9.y - scalarValue2)) + scalarValue2;
    float productValue5 = (comparisonValue4 * (sampledTextureValue9.z - scalarValue3)) + scalarValue3;
    bool comparisonValue5 = scalarValue4 >= 0.5;
    bool comparisonValue6 = scalarValue5 >= 0.5;
    float comparisonValue7;
    if (comparisonValue5 != comparisonValue6)
    {
        float productValue6 = spvNMin(spvNMax(quotientValue * 4.0, 0.0), 1.0);
        comparisonValue7 = comparisonValue6 ? productValue6 : (1.0 - productValue6);
    }
    else
    {
        comparisonValue7 = float(comparisonValue5);
    }
    bool comparisonValue8 = comparisonValue7 <= 0.0;
    bool intermediateValue9;
    if (comparisonValue8 || (comparisonValue7 >= 1.0))
    {
        intermediateValue9 = comparisonValue8;
    }
    else
    {
        intermediateValue9 = comparisonValue7 <= fract(fract(dot(vec2(floor((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x), floor((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y)), vec2(0.067110560834407806396484375, 0.005837149918079376220703125))) * 52.98291778564453125);
    }
    float comparisonValue9 = intermediateValue9 ? 0.0 : 1.0;
    bool comparisonValue10;
    if (varyingTexCoord2.x > 0.5)
    {
        float inverseLengthValue14 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue14), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue14), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue14)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[17u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[17u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[17u].z)) - fragmentVectorConstants1.packedValues[15u].x) / (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[15u].x), 0.0, 1.0);
        float quotientValue4 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
        float quotientValue5 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
        float productValue71 = floor(quotientValue5 * 0.25);
        float productValue72 = floor(quotientValue5 * 0.5);
        float scalarValue58 = floor(quotientValue5);
        comparisonValue10 = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue72 * productValue72) * 0.75) + (floor(quotientValue4 * 0.5) * 0.5)) + (fract(((productValue71 * productValue71) * 0.75) + (floor(quotientValue4 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue58 * scalarValue58) * 0.75) + (floor(quotientValue4) * 0.5)));
    }
    else
    {
        comparisonValue10 = false;
    }
    if (intermediateValue9 || comparisonValue10)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    bool conditionValue7 = comparisonValue25 < 0.5;
    uint reinterpretedBits = uint(int(floatBitsToUint(scalarValue22)) >> int(16u)) & 65535u;
    uint reinterpretedBits1 = floatBitsToUint(scalarValue22) & 65535u;
    float comparisonValue32 = conditionValue7 ? sumValue9 : sumValue11;
    float comparisonValue33 = conditionValue7 ? sumValue10 : sumValue12;
    uint comparisonValue34 = conditionValue7 ? reinterpretedBits : reinterpretedBits1;
    float productValue54 = comparisonValue25 * scalarValue29;
    float multiplyAddValue18 = fma(1.0 - comparisonValue25, scalarValue28, productValue54);
    bool conditionValue8 = multiplyAddValue18 > 0.0;
    float quotientValue2 = productValue54 / multiplyAddValue18;
    float multiplyAddValue19 = conditionValue8 ? fma(sampledTextureValue32.x - scalarValue25, quotientValue2, scalarValue25) : scalarValue25;
    float multiplyAddValue20 = conditionValue8 ? fma(sampledTextureValue32.y - scalarValue26, quotientValue2, scalarValue26) : scalarValue26;
    float multiplyAddValue21 = conditionValue8 ? fma(sampledTextureValue32.z - scalarValue27, quotientValue2, scalarValue27) : scalarValue27;
    bool comparisonValue35 = varyingTexCoord2.y != 0.0;
    fragmentColor1.x = comparisonValue35 ? ((comparisonValue31 ? multiplyAddValue19 : (fma(multiplyAddValue19, varyingColor0.x, -multiplyAddValue19) + multiplyAddValue19)) * varyingColor0.w) : (multiplyAddValue19 * varyingColor0.x);
    fragmentColor1.y = comparisonValue35 ? ((comparisonValue31 ? multiplyAddValue20 : (fma(multiplyAddValue20, varyingColor0.y, -multiplyAddValue20) + multiplyAddValue20)) * varyingColor0.w) : (multiplyAddValue20 * varyingColor0.y);
    fragmentColor1.z = comparisonValue35 ? ((comparisonValue31 ? multiplyAddValue21 : (fma(multiplyAddValue21, varyingColor0.z, -multiplyAddValue21) + multiplyAddValue21)) * varyingColor0.w) : (multiplyAddValue21 * varyingColor0.z);
    float intermediateValue27;
    float intermediateValue29;
    float multiplyAddValue6;
    float multiplyAddValue7;
    float multiplyAddValue8;
    float intermediateValue31;
    float intermediateValue33;
    if ((conditionValue7 && (reinterpretedBits != 65535u)) || ((!conditionValue7) && (reinterpretedBits1 != 65535u)))
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    bool conditionValue7 = comparisonValue25 < 0.5;
    uint reinterpretedBits = uint(int(floatBitsToUint(scalarValue22)) >> int(16u)) & 65535u;
    uint reinterpretedBits1 = floatBitsToUint(scalarValue22) & 65535u;
    float comparisonValue32 = conditionValue7 ? sumValue9 : sumValue11;
    float comparisonValue33 = conditionValue7 ? sumValue10 : sumValue12;
    uint comparisonValue34 = conditionValue7 ? reinterpretedBits : reinterpretedBits1;
    float productValue54 = comparisonValue25 * scalarValue29;
    float multiplyAddValue18 = fma(1.0 - comparisonValue25, scalarValue28, productValue54);
    bool conditionValue8 = multiplyAddValue18 > 0.0;
    float quotientValue2 = productValue54 / multiplyAddValue18;
    float multiplyAddValue19 = conditionValue8 ? fma(sampledTextureValue32.x - scalarValue25, quotientValue2, scalarValue25) : scalarValue25;
    float multiplyAddValue20 = conditionValue8 ? fma(sampledTextureValue32.y - scalarValue26, quotientValue2, scalarValue26) : scalarValue26;
    float multiplyAddValue21 = conditionValue8 ? fma(sampledTextureValue32.z - scalarValue27, quotientValue2, scalarValue27) : scalarValue27;
    bool comparisonValue35 = varyingTexCoord2.y != 0.0;
    fragmentColor1.x = comparisonValue35 ? ((comparisonValue64 ? multiplyAddValue19 : (fma(multiplyAddValue19, varyingColor0.x, -multiplyAddValue19) + multiplyAddValue19)) * varyingColor0.w) : (multiplyAddValue19 * varyingColor0.x);
    fragmentColor1.y = comparisonValue35 ? ((comparisonValue64 ? multiplyAddValue20 : (fma(multiplyAddValue20, varyingColor0.y, -multiplyAddValue20) + multiplyAddValue20)) * varyingColor0.w) : (multiplyAddValue20 * varyingColor0.y);
    fragmentColor1.z = comparisonValue35 ? ((comparisonValue64 ? multiplyAddValue21 : (fma(multiplyAddValue21, varyingColor0.z, -multiplyAddValue21) + multiplyAddValue21)) * varyingColor0.w) : (multiplyAddValue21 * varyingColor0.z);
    float intermediateValue31;
    float intermediateValue33;
    float multiplyAddValue7;
    float multiplyAddValue8;
    float multiplyAddValue9;
    float intermediateValue35;
    float intermediateValue37;
    if (((!conditionValue7) && (reinterpretedBits1 != 65535u)) || (conditionValue7 && (reinterpretedBits != 65535u)))
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue7 = productValue3 * varyingColor0.x;
    float productValue8 = productValue4 * varyingColor0.y;
    float productValue9 = productValue5 * varyingColor0.z;
    float productValue10;
    float productValue11;
    float productValue12;
    if (varyingTexCoord2.y != 0.0)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue7 = productValue3 * varyingColor0.x;
    float productValue8 = productValue4 * varyingColor0.y;
    float productValue9 = productValue5 * varyingColor0.z;
    float productValue12;
    float productValue13;
    float productValue14;
    if (varyingTexCoord2.y != 0.0)
#endif
    {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        uint productValue55 = (comparisonValue34 * 16u) + 4u;
        vec4 sampledTextureValue33 = uintBitsToFloat(uvec4(texelFetch(intermediateValue1, int(productValue55)).x, texelFetch(intermediateValue1, int(productValue55 + 1u)).x, texelFetch(intermediateValue1, int(productValue55 + 2u)).x, texelFetch(intermediateValue1, int(productValue55 + 3u)).x));
        float scalarValue30 = sampledTextureValue33.x;
        float scalarValue31 = sampledTextureValue33.y;
        float scalarValue32 = sampledTextureValue33.z;
        float scalarValue33 = sampledTextureValue33.w;
        uint productValue56 = (comparisonValue34 * 16u) + 8u;
        vec4 sampledTextureValue34 = uintBitsToFloat(uvec4(texelFetch(intermediateValue1, int(productValue56)).x, texelFetch(intermediateValue1, int(productValue56 + 1u)).x, texelFetch(intermediateValue1, int(productValue56 + 2u)).x, texelFetch(intermediateValue1, int(productValue56 + 3u)).x));
        uint productValue57 = (comparisonValue34 * 16u) + 12u;
        vec2 sampledTextureValue35 = uintBitsToFloat(uvec2(texelFetch(intermediateValue1, int(productValue57)).x, texelFetch(intermediateValue1, int(productValue57 + 1u)).x));
        float scalarValue34 = sampledTextureValue35.x;
        float scalarValue35 = sampledTextureValue35.y;
        uint reinterpretedBits2 = floatBitsToUint(sampledTextureValue34.x);
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        if ((reinterpretedBits2 & 4u) == 4u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        uint productValue55 = (comparisonValue34 * 16u) + 4u;
        vec4 sampledTextureValue33 = uintBitsToFloat(uvec4(texelFetch(intermediateValue1, int(productValue55)).x, texelFetch(intermediateValue1, int(productValue55 + 1u)).x, texelFetch(intermediateValue1, int(productValue55 + 2u)).x, texelFetch(intermediateValue1, int(productValue55 + 3u)).x));
        float scalarValue30 = sampledTextureValue33.x;
        float scalarValue31 = sampledTextureValue33.y;
        float scalarValue32 = sampledTextureValue33.z;
        float scalarValue33 = sampledTextureValue33.w;
        uint productValue56 = (comparisonValue34 * 16u) + 8u;
        vec4 sampledTextureValue34 = uintBitsToFloat(uvec4(texelFetch(intermediateValue1, int(productValue56)).x, texelFetch(intermediateValue1, int(productValue56 + 1u)).x, texelFetch(intermediateValue1, int(productValue56 + 2u)).x, texelFetch(intermediateValue1, int(productValue56 + 3u)).x));
        uint productValue57 = (comparisonValue34 * 16u) + 12u;
        vec2 sampledTextureValue35 = uintBitsToFloat(uvec2(texelFetch(intermediateValue1, int(productValue57)).x, texelFetch(intermediateValue1, int(productValue57 + 1u)).x));
        float scalarValue34 = sampledTextureValue35.x;
        float scalarValue35 = sampledTextureValue35.y;
        uint reinterpretedBits2 = floatBitsToUint(sampledTextureValue34.x);
        float multiplyAddValue14;
        float multiplyAddValue15;
        float multiplyAddValue16;
        if ((reinterpretedBits2 & 4u) == 4u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue10 = ((comparisonValue9 * (productValue7 - productValue3)) + productValue3) * varyingColor0.w;
        productValue11 = ((comparisonValue9 * (productValue8 - productValue4)) + productValue4) * varyingColor0.w;
        productValue12 = ((comparisonValue9 * (productValue9 - productValue5)) + productValue5) * varyingColor0.w;
    }
    else
    {
        productValue10 = productValue7;
        productValue11 = productValue8;
        productValue12 = productValue9;
    }
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if (comparisonValue3 == 65535u)
    {
        intermediateValue10 = 0.0;
        intermediateValue11 = 1.0;
        intermediateValue12 = 0.0;
        intermediateValue13 = 0.0;
        intermediateValue15 = 0.0;
        intermediateValue16 = 1.0;
        intermediateValue17 = 0.0;
    }
    else
    {
        float sampledTextureValue13 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 4u)).x);
        float sampledTextureValue14 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 5u)).x);
        float sampledTextureValue15 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 6u)).x);
        float sampledTextureValue16 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 7u)).x);
        uvec4 sampledTextureValue17 = texelFetch(pbrData, int((comparisonValue3 * 16u) + 8u));
        uint scalarValue6 = sampledTextureValue17.x;
        float sampledTextureValue18 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 12u)).x);
        float sampledTextureValue19 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 13u)).x);
        float sampledTextureValue20 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 15u)).x);
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
        if ((scalarValue6 & 4u) == 0u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue12 = ((comparisonValue9 * (productValue7 - productValue3)) + productValue3) * varyingColor0.w;
        productValue13 = ((comparisonValue9 * (productValue8 - productValue4)) + productValue4) * varyingColor0.w;
        productValue14 = ((comparisonValue9 * (productValue9 - productValue5)) + productValue5) * varyingColor0.w;
    }
    else
    {
        productValue12 = productValue7;
        productValue13 = productValue8;
        productValue14 = productValue9;
    }
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if (comparisonValue3 == 65535u)
    {
        intermediateValue11 = 0.0;
        intermediateValue12 = 1.0;
        intermediateValue13 = 0.0;
        intermediateValue14 = 0.0;
        intermediateValue16 = 0.0;
        intermediateValue17 = 1.0;
        intermediateValue18 = 0.0;
    }
    else
    {
        float sampledTextureValue13 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 4u)).x);
        float sampledTextureValue14 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 5u)).x);
        float sampledTextureValue15 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 6u)).x);
        float sampledTextureValue16 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 7u)).x);
        uvec4 sampledTextureValue17 = texelFetch(pbrData, int((comparisonValue3 * 16u) + 8u));
        uint scalarValue6 = sampledTextureValue17.x;
        float sampledTextureValue18 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 12u)).x);
        float sampledTextureValue19 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 13u)).x);
        float sampledTextureValue20 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 15u)).x);
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
        if ((scalarValue6 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue36 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(comparisonValue32, scalarValue30, scalarValue32), fma(comparisonValue33, scalarValue31, scalarValue33)));
            multiplyAddValue13 = fma(sampledTextureValue36.y, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue36.x, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue36.z, 2.0, -1.0);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue36 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(comparisonValue32, scalarValue30, scalarValue32), fma(comparisonValue33, scalarValue31, scalarValue33)));
            multiplyAddValue14 = fma(sampledTextureValue36.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue36.x, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue36.z, 2.0, -1.0);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue6 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue6 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue5 = 0.0;
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    float multiplyAddValue = fma(comparisonValue2, sampledTextureValue13, sampledTextureValue15);
                    float multiplyAddValue1 = fma(comparisonValue1, sampledTextureValue14, sampledTextureValue16);
                    vec4 sampledTextureValue21 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue, multiplyAddValue1), 0.0);
                    float scalarValue7 = sampledTextureValue21.x;
                    float scalarValue8 = sampledTextureValue21.y;
                    float scalarValue9 = sampledTextureValue21.z;
                    float multiplyAddValue2 = spvNClamp(fma(spvNMin(sampledTextureValue20 - sampledTextureValue19, sampledTextureValue20), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue1 = multiplyAddValue2 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue7 == scalarValue8) && (scalarValue8 == scalarValue9))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue1)
                        {
                            uvec2 sampledTextureValue22 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue15 = float(int(uint(int(float(int(sampledTextureValue22.x)))))) * multiplyAddValue;
                            float productValue16 = float(int(uint(int(float(int(sampledTextureValue22.y)))))) * multiplyAddValue1;
                            float scalarValue10 = fract(productValue15);
                            float scalarValue11 = fract(productValue16);
                            float comparisonValue19;
                            if (abs(scalarValue10 + (-0.5)) < 0.0625)
                            {
                                comparisonValue19 = ((scalarValue10 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue;
                            }
                            else
                            {
                                comparisonValue19 = multiplyAddValue;
                            }
                            float comparisonValue20;
                            if (abs(scalarValue11 + (-0.5)) < 0.0625)
                            {
                                comparisonValue20 = ((scalarValue11 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue1;
                            }
                            else
                            {
                                comparisonValue20 = multiplyAddValue1;
                            }
                            vec4 sampledTextureValue23 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue19, comparisonValue20));
                            float scalarValue12 = sampledTextureValue23.x;
                            float scalarValue13 = sampledTextureValue23.y;
                            float scalarValue14 = sampledTextureValue23.z;
                            float scalarValue15 = sampledTextureValue23.w;
                            float sumValue = fract(productValue15 + 0.5);
                            float sumValue1 = fract(productValue16 + 0.5);
                            bool conditionValue2 = sumValue1 > 0.5;
                            float intermediateValue[2];
                            intermediateValue[0u] = conditionValue2 ? scalarValue12 : scalarValue15;
                            intermediateValue[1u] = conditionValue2 ? scalarValue13 : scalarValue14;
                            float productValue17 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue18 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue2 = productValue17 - productValue18;
                            bool conditionValue3 = sumValue > 0.5;
                            intermediateValue[0u] = conditionValue3 ? scalarValue14 : scalarValue15;
                            intermediateValue[1u] = conditionValue3 ? scalarValue13 : scalarValue12;
                            float productValue25 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue = inversesqrt(dot(vec3(sumValue2, productValue25, 0.25), vec3(sumValue2, productValue25, 0.25)));
                            float productValue26 = inverseLengthValue * multiplyAddValue2;
                            branchMergedValue12 = productValue26 * sumValue2;
                            branchMergedValue14 = productValue26 * productValue25;
                            branchMergedValue15 = inverseLengthValue * 0.25;
                        }
                        else
                        {
                            branchMergedValue12 = 0.0;
                            branchMergedValue14 = 0.0;
                            branchMergedValue15 = 1.0;
                        }
                        branchMergedValue9 = branchMergedValue12;
                        branchMergedValue10 = branchMergedValue14;
                        branchMergedValue11 = branchMergedValue15;
                    }
                    else
                    {
                        uvec2 sampledTextureValue24 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue1)
                        {
                            float productValue32 = fract(float(int(uint(int(float(int(sampledTextureValue24.x)))))) * multiplyAddValue);
                            float productValue33 = fract(float(int(uint(int(float(int(sampledTextureValue24.y)))))) * multiplyAddValue1);
                            float comparisonValue12 = (((productValue32 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue8 * 2.0) + (-1.0))) - (((productValue32 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue21.w * 2.0) + (-1.0)));
                            float comparisonValue15 = (((productValue33 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue9 * 2.0) + (-1.0))) - (((productValue33 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue7 * 2.0) + (-1.0)));
                            float comparisonValue16 = ((abs(comparisonValue12) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue12;
                            float comparisonValue17 = ((abs(comparisonValue15) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue15;
                            float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue16, comparisonValue17, 0.25), vec3(comparisonValue16, comparisonValue17, 0.25)));
                            float productValue34 = inverseLengthValue1 * multiplyAddValue2;
                            branchMergedValue13 = productValue34 * comparisonValue16;
                            branchMergedValue16 = productValue34 * comparisonValue17;
                            branchMergedValue17 = inverseLengthValue1 * 0.25;
                        }
                        else
                        {
                            branchMergedValue13 = 0.0;
                            branchMergedValue16 = 0.0;
                            branchMergedValue17 = 1.0;
                        }
                        branchMergedValue9 = branchMergedValue13;
                        branchMergedValue10 = branchMergedValue16;
                        branchMergedValue11 = branchMergedValue17;
                    }
                    branchMergedValue3 = branchMergedValue9;
                    branchMergedValue5 = branchMergedValue10;
                    branchMergedValue6 = branchMergedValue11;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue5;
                branchMergedValue2 = branchMergedValue6;
            }
            else
            {
                float multiplyAddValue3 = fma(comparisonValue2, sampledTextureValue13, sampledTextureValue15);
                float multiplyAddValue4 = fma(comparisonValue1, sampledTextureValue14, sampledTextureValue16);
                float multiplyAddValue5 = spvNClamp(fma(spvNMin(sampledTextureValue20 - sampledTextureValue19, sampledTextureValue20), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue5 > 0.0)
                {
                    uvec2 sampledTextureValue25 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue35 = float(int(uint(int(float(int(sampledTextureValue25.x)))))) * multiplyAddValue3;
                    float productValue36 = float(int(uint(int(float(int(sampledTextureValue25.y)))))) * multiplyAddValue4;
                    float scalarValue16 = fract(productValue35);
                    float scalarValue17 = fract(productValue36);
                    float comparisonValue13;
                    if (abs(scalarValue16 + (-0.5)) < 0.0625)
                    {
                        comparisonValue13 = ((scalarValue16 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue3;
                    }
                    else
                    {
                        comparisonValue13 = multiplyAddValue3;
                    }
                    float comparisonValue18;
                    if (abs(scalarValue17 + (-0.5)) < 0.0625)
                    {
                        comparisonValue18 = ((scalarValue17 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue4;
                    }
                    else
                    {
                        comparisonValue18 = multiplyAddValue4;
                    }
                    vec4 sampledTextureValue26 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue13, comparisonValue18));
                    float scalarValue18 = sampledTextureValue26.x;
                    float scalarValue19 = sampledTextureValue26.y;
                    float scalarValue20 = sampledTextureValue26.z;
                    float scalarValue21 = sampledTextureValue26.w;
                    float sumValue3 = fract(productValue35 + 0.5);
                    float sumValue4 = fract(productValue36 + 0.5);
                    bool conditionValue4 = sumValue4 > 0.5;
                    float intermediateValue1[2];
                    intermediateValue1[0u] = conditionValue4 ? scalarValue18 : scalarValue21;
                    intermediateValue1[1u] = conditionValue4 ? scalarValue19 : scalarValue20;
                    float productValue37 = intermediateValue1[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue38 = intermediateValue1[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue5 = productValue37 - productValue38;
                    bool conditionValue5 = sumValue3 > 0.5;
                    intermediateValue1[0u] = conditionValue5 ? scalarValue20 : scalarValue21;
                    intermediateValue1[1u] = conditionValue5 ? scalarValue19 : scalarValue18;
                    float productValue39 = intermediateValue1[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue5, productValue39, 0.25), vec3(sumValue5, productValue39, 0.25)));
                    float productValue40 = inverseLengthValue2 * multiplyAddValue5;
                    branchMergedValue4 = productValue40 * sumValue5;
                    branchMergedValue7 = productValue40 * productValue39;
                    branchMergedValue8 = inverseLengthValue2 * 0.25;
                }
                else
                {
                    branchMergedValue4 = 0.0;
                    branchMergedValue7 = 0.0;
                    branchMergedValue8 = 1.0;
                }
                branchMergedValue = branchMergedValue4;
                branchMergedValue1 = branchMergedValue7;
                branchMergedValue2 = branchMergedValue8;
            }
            intermediateValue21 = branchMergedValue;
            intermediateValue22 = branchMergedValue1;
            intermediateValue23 = branchMergedValue2;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue6 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue6 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue5 = 0.0;
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    float multiplyAddValue = fma(comparisonValue2, sampledTextureValue13, sampledTextureValue15);
                    float multiplyAddValue1 = fma(comparisonValue1, sampledTextureValue14, sampledTextureValue16);
                    vec4 sampledTextureValue21 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue, multiplyAddValue1), 0.0);
                    float scalarValue7 = sampledTextureValue21.x;
                    float scalarValue8 = sampledTextureValue21.y;
                    float scalarValue9 = sampledTextureValue21.z;
                    float multiplyAddValue2 = spvNClamp(fma(spvNMin(sampledTextureValue20 - sampledTextureValue19, sampledTextureValue20), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue1 = multiplyAddValue2 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue7 == scalarValue8) && (scalarValue8 == scalarValue9))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue1)
                        {
                            uvec2 sampledTextureValue22 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue15 = float(int(uint(int(float(int(sampledTextureValue22.x)))))) * multiplyAddValue;
                            float productValue16 = float(int(uint(int(float(int(sampledTextureValue22.y)))))) * multiplyAddValue1;
                            float scalarValue10 = fract(productValue15);
                            float scalarValue11 = fract(productValue16);
                            float comparisonValue20;
                            if (abs(scalarValue10 + (-0.5)) < 0.0625)
                            {
                                comparisonValue20 = ((scalarValue10 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue;
                            }
                            else
                            {
                                comparisonValue20 = multiplyAddValue;
                            }
                            float comparisonValue21;
                            if (abs(scalarValue11 + (-0.5)) < 0.0625)
                            {
                                comparisonValue21 = ((scalarValue11 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue1;
                            }
                            else
                            {
                                comparisonValue21 = multiplyAddValue1;
                            }
                            vec4 sampledTextureValue49 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue20, comparisonValue21));
                            float scalarValue59 = sampledTextureValue49.x;
                            float scalarValue60 = sampledTextureValue49.y;
                            float scalarValue61 = sampledTextureValue49.z;
                            float scalarValue62 = sampledTextureValue49.w;
                            float sumValue = fract(productValue15 + 0.5);
                            float sumValue1 = fract(productValue16 + 0.5);
                            bool conditionValue2 = sumValue1 > 0.5;
                            float intermediateValue[2];
                            intermediateValue[0u] = conditionValue2 ? scalarValue59 : scalarValue62;
                            intermediateValue[1u] = conditionValue2 ? scalarValue60 : scalarValue61;
                            float productValue17 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue18 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue2 = productValue17 - productValue18;
                            bool conditionValue3 = sumValue > 0.5;
                            intermediateValue[0u] = conditionValue3 ? scalarValue61 : scalarValue62;
                            intermediateValue[1u] = conditionValue3 ? scalarValue60 : scalarValue59;
                            float productValue25 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue = inversesqrt(dot(vec3(sumValue2, productValue25, 0.25), vec3(sumValue2, productValue25, 0.25)));
                            float productValue26 = inverseLengthValue * multiplyAddValue2;
                            branchMergedValue12 = productValue26 * sumValue2;
                            branchMergedValue14 = productValue26 * productValue25;
                            branchMergedValue15 = inverseLengthValue * 0.25;
                        }
                        else
                        {
                            branchMergedValue12 = 0.0;
                            branchMergedValue14 = 0.0;
                            branchMergedValue15 = 1.0;
                        }
                        branchMergedValue9 = branchMergedValue12;
                        branchMergedValue10 = branchMergedValue14;
                        branchMergedValue11 = branchMergedValue15;
                    }
                    else
                    {
                        uvec2 sampledTextureValue24 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue1)
                        {
                            float productValue32 = fract(float(int(uint(int(float(int(sampledTextureValue24.x)))))) * multiplyAddValue);
                            float productValue33 = fract(float(int(uint(int(float(int(sampledTextureValue24.y)))))) * multiplyAddValue1);
                            float comparisonValue12 = (((productValue32 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue8 * 2.0) + (-1.0))) - (((productValue32 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue21.w * 2.0) + (-1.0)));
                            float comparisonValue15 = (((productValue33 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue9 * 2.0) + (-1.0))) - (((productValue33 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue7 * 2.0) + (-1.0)));
                            float comparisonValue16 = ((abs(comparisonValue12) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue12;
                            float comparisonValue17 = ((abs(comparisonValue15) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue15;
                            float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue16, comparisonValue17, 0.25), vec3(comparisonValue16, comparisonValue17, 0.25)));
                            float productValue34 = inverseLengthValue1 * multiplyAddValue2;
                            branchMergedValue13 = productValue34 * comparisonValue16;
                            branchMergedValue16 = productValue34 * comparisonValue17;
                            branchMergedValue17 = inverseLengthValue1 * 0.25;
                        }
                        else
                        {
                            branchMergedValue13 = 0.0;
                            branchMergedValue16 = 0.0;
                            branchMergedValue17 = 1.0;
                        }
                        branchMergedValue9 = branchMergedValue13;
                        branchMergedValue10 = branchMergedValue16;
                        branchMergedValue11 = branchMergedValue17;
                    }
                    branchMergedValue3 = branchMergedValue9;
                    branchMergedValue5 = branchMergedValue10;
                    branchMergedValue6 = branchMergedValue11;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue5;
                branchMergedValue2 = branchMergedValue6;
            }
            else
            {
                float multiplyAddValue3 = fma(comparisonValue2, sampledTextureValue13, sampledTextureValue15);
                float multiplyAddValue4 = fma(comparisonValue1, sampledTextureValue14, sampledTextureValue16);
                float multiplyAddValue5 = spvNClamp(fma(spvNMin(sampledTextureValue20 - sampledTextureValue19, sampledTextureValue20), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue5 > 0.0)
                {
                    uvec2 sampledTextureValue25 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue35 = float(int(uint(int(float(int(sampledTextureValue25.x)))))) * multiplyAddValue3;
                    float productValue36 = float(int(uint(int(float(int(sampledTextureValue25.y)))))) * multiplyAddValue4;
                    float scalarValue16 = fract(productValue35);
                    float scalarValue17 = fract(productValue36);
                    float comparisonValue14;
                    if (abs(scalarValue16 + (-0.5)) < 0.0625)
                    {
                        comparisonValue14 = ((scalarValue16 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue3;
                    }
                    else
                    {
                        comparisonValue14 = multiplyAddValue3;
                    }
                    float comparisonValue19;
                    if (abs(scalarValue17 + (-0.5)) < 0.0625)
                    {
                        comparisonValue19 = ((scalarValue17 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue4;
                    }
                    else
                    {
                        comparisonValue19 = multiplyAddValue4;
                    }
                    vec4 sampledTextureValue50 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue14, comparisonValue19));
                    float scalarValue63 = sampledTextureValue50.x;
                    float scalarValue64 = sampledTextureValue50.y;
                    float scalarValue65 = sampledTextureValue50.z;
                    float scalarValue66 = sampledTextureValue50.w;
                    float sumValue3 = fract(productValue35 + 0.5);
                    float sumValue4 = fract(productValue36 + 0.5);
                    bool conditionValue4 = sumValue4 > 0.5;
                    float intermediateValue1[2];
                    intermediateValue1[0u] = conditionValue4 ? scalarValue63 : scalarValue66;
                    intermediateValue1[1u] = conditionValue4 ? scalarValue64 : scalarValue65;
                    float productValue37 = intermediateValue1[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue38 = intermediateValue1[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue5 = productValue37 - productValue38;
                    bool conditionValue5 = sumValue3 > 0.5;
                    intermediateValue1[0u] = conditionValue5 ? scalarValue65 : scalarValue66;
                    intermediateValue1[1u] = conditionValue5 ? scalarValue64 : scalarValue63;
                    float productValue39 = intermediateValue1[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue5, productValue39, 0.25), vec3(sumValue5, productValue39, 0.25)));
                    float productValue40 = inverseLengthValue2 * multiplyAddValue5;
                    branchMergedValue4 = productValue40 * sumValue5;
                    branchMergedValue7 = productValue40 * productValue39;
                    branchMergedValue8 = inverseLengthValue2 * 0.25;
                }
                else
                {
                    branchMergedValue4 = 0.0;
                    branchMergedValue7 = 0.0;
                    branchMergedValue8 = 1.0;
                }
                branchMergedValue = branchMergedValue4;
                branchMergedValue1 = branchMergedValue7;
                branchMergedValue2 = branchMergedValue8;
            }
            intermediateValue22 = branchMergedValue;
            intermediateValue23 = branchMergedValue1;
            intermediateValue24 = branchMergedValue2;
#endif
        }
        else
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float sampledTextureValue37 = uintBitsToFloat(texelFetch(intermediateValue1, int((comparisonValue34 * 16u) + 15u)).x);
            float intermediateValue37;
            float intermediateValue38;
            float intermediateValue39;
            if ((reinterpretedBits2 & 8u) == 8u)
            {
                float sumValue13 = spvNClamp(2.0 - spvNMin(sampledTextureValue37, sampledTextureValue37 - scalarValue35), 0.0, 1.0);
                float productValue20;
                float productValue21;
                float productValue22;
                if (sumValue13 > 0.0)
                {
                    float multiplyAddValue22 = fma(comparisonValue32, scalarValue30, scalarValue32);
                    float multiplyAddValue23 = fma(comparisonValue33, scalarValue31, scalarValue33);
                    bool sampledTextureValue38 = uint(textureQueryLevels(materialTexture1)) > 0u;
                    uvec2 sampledTextureValue39 = uvec2(textureSize(materialTexture1, int(0u)));
                    uint scalarValue36 = sampledTextureValue39.x;
                    float comparisonValue36 = rdEvaluateFloatExpression2(sampledTextureValue38 ? scalarValue36 : 0u);
                    float comparisonValue37 = rdEvaluateFloatExpression2(sampledTextureValue38 ? sampledTextureValue39.y : 0u);
                    float productValue58 = fract(multiplyAddValue22 * comparisonValue36);
                    float productValue59 = fract(multiplyAddValue23 * comparisonValue37);
                    vec4 sampledTextureValue40 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue58 - 0.5) < 0.0625) ? (((productValue58 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue22) : multiplyAddValue22, (abs(productValue59 - 0.5) < 0.0625) ? (((productValue59 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue23) : multiplyAddValue23));
                    float scalarValue37 = sampledTextureValue40.x;
                    float scalarValue38 = sampledTextureValue40.y;
                    float scalarValue39 = sampledTextureValue40.z;
                    float scalarValue40 = sampledTextureValue40.w;
                    float multiplyAddValue24 = fract(fma(multiplyAddValue22, comparisonValue36, 0.5));
                    float multiplyAddValue25 = fract(fma(multiplyAddValue23, comparisonValue37, 0.5));
                    bool conditionValue9 = multiplyAddValue25 > 0.5;
                    bool conditionValue10 = multiplyAddValue24 > 0.5;
                    float comparisonValue38 = conditionValue9 ? scalarValue37 : scalarValue40;
                    float comparisonValue39 = conditionValue9 ? scalarValue38 : scalarValue39;
                    float comparisonValue40 = conditionValue10 ? scalarValue39 : scalarValue40;
                    float comparisonValue41 = conditionValue10 ? scalarValue38 : scalarValue37;
                    float sumValue14 = multiplyAddValue24 - 0.083333335816860198974609375;
                    float sumValue15 = multiplyAddValue24 + 0.083333335816860198974609375;
                    float sumValue16 = multiplyAddValue25 - 0.083333335816860198974609375;
                    float sumValue17 = multiplyAddValue25 + 0.083333335816860198974609375;
                    uint sumValue18 = uint(int(spvNClamp(sumValue14 + sumValue14, 0.0, 1.0)));
                    uint sumValue19 = uint(int(spvNClamp(sumValue15 + sumValue15, 0.0, 1.0)));
                    uint sumValue20 = uint(int(spvNClamp(sumValue16 + sumValue16, 0.0, 1.0)));
                    uint sumValue21 = uint(int(spvNClamp(sumValue17 + sumValue17, 0.0, 1.0)));
                    float comparisonValue42 = ((sumValue18 == 1u) ? comparisonValue39 : ((sumValue18 == 0u) ? comparisonValue38 : 0.0)) - ((sumValue19 == 1u) ? comparisonValue39 : ((sumValue19 == 0u) ? comparisonValue38 : 0.0));
                    float comparisonValue43 = ((sumValue20 == 1u) ? comparisonValue41 : ((sumValue20 == 0u) ? comparisonValue40 : 0.0)) - ((sumValue21 == 1u) ? comparisonValue41 : ((sumValue21 == 0u) ? comparisonValue40 : 0.0));
                    vec3 vectorValue = vec3(comparisonValue42, comparisonValue43, 0.25);
                    float scalarValue41 = rdDot3Precise(vectorValue, vectorValue);
                    float inverseLengthValue7 = inversesqrt(scalarValue41);
                    productValue20 = sumValue13 * (inverseLengthValue7 * comparisonValue43);
                    productValue21 = sumValue13 * (inverseLengthValue7 * comparisonValue42);
                    productValue22 = inverseLengthValue7 * 0.25;
                }
                else
                {
                    productValue20 = 0.0;
                    productValue21 = 0.0;
                    productValue22 = 1.0;
                }
                intermediateValue37 = productValue20;
                intermediateValue38 = productValue21;
                intermediateValue39 = productValue22;
            }
            else
            {
                float intermediateValue58;
                float intermediateValue60;
                float intermediateValue62;
                if ((reinterpretedBits2 & 16u) == 16u)
                {
                    float multiplyAddValue26 = fma(comparisonValue32, scalarValue30, scalarValue32);
                    float multiplyAddValue27 = fma(comparisonValue33, scalarValue31, scalarValue33);
                    float sumValue22 = spvNMin(sampledTextureValue37, sampledTextureValue37 - scalarValue35);
                    vec4 sampledTextureValue41 = textureLod(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue26, multiplyAddValue27), 0.0);
                    float scalarValue42 = sampledTextureValue41.x;
                    float scalarValue43 = sampledTextureValue41.y;
                    float scalarValue44 = sampledTextureValue41.z;
                    float intermediateValue59;
                    float intermediateValue61;
                    float intermediateValue63;
                    if ((scalarValue43 == scalarValue42) && (scalarValue44 == scalarValue43))
                    {
                        float scalarValue45 = spvNClamp(2.0 - sumValue22, 0.0, 1.0);
                        float productValue27;
                        float productValue28;
                        float productValue29;
                        if (scalarValue45 > 0.0)
                        {
                            bool sampledTextureValue42 = uint(textureQueryLevels(materialTexture1)) > 0u;
                            uvec2 sampledTextureValue43 = uvec2(textureSize(materialTexture1, int(0u)));
                            uint scalarValue46 = sampledTextureValue43.x;
                            float comparisonValue44 = rdEvaluateFloatExpression2(sampledTextureValue42 ? scalarValue46 : 0u);
                            float comparisonValue45 = rdEvaluateFloatExpression2(sampledTextureValue42 ? sampledTextureValue43.y : 0u);
                            float productValue60 = fract(multiplyAddValue26 * comparisonValue44);
                            float productValue61 = fract(multiplyAddValue27 * comparisonValue45);
                            vec4 sampledTextureValue44 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue60 - 0.5) < 0.0625) ? (multiplyAddValue26 + ((productValue60 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue26, (abs(productValue61 - 0.5) < 0.0625) ? (multiplyAddValue27 + ((productValue61 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue27));
                            float scalarValue47 = sampledTextureValue44.x;
                            float scalarValue48 = sampledTextureValue44.y;
                            float scalarValue49 = sampledTextureValue44.z;
                            float scalarValue50 = sampledTextureValue44.w;
                            float multiplyAddValue28 = fract(fma(multiplyAddValue26, comparisonValue44, 0.5));
                            float multiplyAddValue29 = fract(fma(multiplyAddValue27, comparisonValue45, 0.5));
                            bool conditionValue11 = multiplyAddValue29 > 0.5;
                            bool conditionValue12 = multiplyAddValue28 > 0.5;
                            float comparisonValue46 = conditionValue11 ? scalarValue47 : scalarValue50;
                            float comparisonValue47 = conditionValue11 ? scalarValue48 : scalarValue49;
                            float comparisonValue48 = conditionValue12 ? scalarValue49 : scalarValue50;
                            float comparisonValue49 = conditionValue12 ? scalarValue48 : scalarValue47;
                            float sumValue23 = multiplyAddValue28 - 0.083333335816860198974609375;
                            float sumValue24 = multiplyAddValue28 + 0.083333335816860198974609375;
                            float sumValue25 = multiplyAddValue29 - 0.083333335816860198974609375;
                            float sumValue26 = multiplyAddValue29 + 0.083333335816860198974609375;
                            uint sumValue27 = uint(int(spvNClamp(sumValue23 + sumValue23, 0.0, 1.0)));
                            uint sumValue28 = uint(int(spvNClamp(sumValue24 + sumValue24, 0.0, 1.0)));
                            uint sumValue29 = uint(int(spvNClamp(sumValue25 + sumValue25, 0.0, 1.0)));
                            uint sumValue30 = uint(int(spvNClamp(sumValue26 + sumValue26, 0.0, 1.0)));
                            float comparisonValue50 = ((sumValue27 == 1u) ? comparisonValue47 : ((sumValue27 == 0u) ? comparisonValue46 : 0.0)) - ((sumValue28 == 1u) ? comparisonValue47 : ((sumValue28 == 0u) ? comparisonValue46 : 0.0));
                            float comparisonValue51 = ((sumValue29 == 1u) ? comparisonValue49 : ((sumValue29 == 0u) ? comparisonValue48 : 0.0)) - ((sumValue30 == 1u) ? comparisonValue49 : ((sumValue30 == 0u) ? comparisonValue48 : 0.0));
                            vec3 vectorValue1 = vec3(comparisonValue50, comparisonValue51, 0.25);
                            float scalarValue51 = rdDot3Precise(vectorValue1, vectorValue1);
                            float inverseLengthValue8 = inversesqrt(scalarValue51);
                            productValue27 = scalarValue45 * (inverseLengthValue8 * comparisonValue51);
                            productValue28 = scalarValue45 * (inverseLengthValue8 * comparisonValue50);
                            productValue29 = inverseLengthValue8 * 0.25;
                        }
                        else
                        {
                            productValue27 = 0.0;
                            productValue28 = 0.0;
                            productValue29 = 1.0;
                        }
                        intermediateValue59 = productValue27;
                        intermediateValue61 = productValue28;
                        intermediateValue63 = productValue29;
                    }
                    else
                    {
                        bool sampledTextureValue45 = uint(textureQueryLevels(materialTexture1)) > 0u;
                        uvec2 sampledTextureValue46 = uvec2(textureSize(materialTexture1, int(0u)));
                        uint scalarValue52 = sampledTextureValue46.x;
                        float comparisonValue52 = rdEvaluateFloatExpression2(sampledTextureValue45 ? scalarValue52 : 0u);
                        float comparisonValue53 = rdEvaluateFloatExpression2(sampledTextureValue45 ? sampledTextureValue46.y : 0u);
                        float sumValue31 = spvNClamp(2.0 - sumValue22, 0.0, 1.0);
                        bool conditionValue13 = sumValue31 > 0.0;
                        float productValue62 = fract(multiplyAddValue26 * comparisonValue52);
                        float productValue63 = fract(multiplyAddValue27 * comparisonValue53);
                        float multiplyAddValue30 = (productValue62 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue41.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue31 = (productValue63 <= 0.083333335816860198974609375) ? (-fma(scalarValue42, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue32 = (productValue62 >= 0.916666686534881591796875) ? (fma(scalarValue43, 2.0, -1.0) + multiplyAddValue30) : multiplyAddValue30;
                        float multiplyAddValue33 = (productValue63 >= 0.916666686534881591796875) ? (fma(scalarValue44, 2.0, -1.0) + multiplyAddValue31) : multiplyAddValue31;
                        bool comparisonValue54 = abs(multiplyAddValue32) >= 0.004999999888241291046142578125;
                        bool comparisonValue55 = abs(multiplyAddValue33) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue56 = vec3(comparisonValue54 ? multiplyAddValue32 : 0.0, comparisonValue55 ? multiplyAddValue33 : 0.0, 0.25);
                        float scalarValue53 = rdDot3Precise(comparisonValue56, comparisonValue56);
                        float inverseLengthValue9 = inversesqrt(scalarValue53);
                        intermediateValue59 = (conditionValue13 && comparisonValue55) ? (sumValue31 * (inverseLengthValue9 * multiplyAddValue33)) : 0.0;
                        intermediateValue61 = (conditionValue13 && comparisonValue54) ? (sumValue31 * (inverseLengthValue9 * multiplyAddValue32)) : 0.0;
                        intermediateValue63 = conditionValue13 ? (inverseLengthValue9 * 0.25) : 1.0;
                    }
                    intermediateValue58 = intermediateValue59;
                    intermediateValue60 = intermediateValue61;
                    intermediateValue62 = intermediateValue63;
                }
                else
                {
                    intermediateValue58 = 0.0;
                    intermediateValue60 = 0.0;
                    intermediateValue62 = 1.0;
                }
                intermediateValue37 = intermediateValue58;
                intermediateValue38 = intermediateValue60;
                intermediateValue39 = intermediateValue62;
            }
            multiplyAddValue13 = intermediateValue37;
            multiplyAddValue14 = intermediateValue38;
            multiplyAddValue15 = intermediateValue39;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float sampledTextureValue37 = uintBitsToFloat(texelFetch(intermediateValue1, int((comparisonValue34 * 16u) + 15u)).x);
            float intermediateValue41;
            float intermediateValue42;
            float intermediateValue43;
            if ((reinterpretedBits2 & 8u) == 8u)
            {
                float sumValue13 = spvNClamp(2.0 - spvNMin(sampledTextureValue37, sampledTextureValue37 - scalarValue35), 0.0, 1.0);
                float productValue22;
                float productValue23;
                float productValue24;
                if (sumValue13 > 0.0)
                {
                    float multiplyAddValue22 = fma(comparisonValue32, scalarValue30, scalarValue32);
                    float multiplyAddValue23 = fma(comparisonValue33, scalarValue31, scalarValue33);
                    bool sampledTextureValue38 = uint(textureQueryLevels(materialTexture1)) > 0u;
                    uvec2 sampledTextureValue39 = uvec2(textureSize(materialTexture1, int(0u)));
                    uint scalarValue36 = sampledTextureValue39.x;
                    float comparisonValue36 = rdEvaluateFloatExpression2(sampledTextureValue38 ? scalarValue36 : 0u);
                    float comparisonValue37 = rdEvaluateFloatExpression2(sampledTextureValue38 ? sampledTextureValue39.y : 0u);
                    float productValue58 = fract(multiplyAddValue22 * comparisonValue36);
                    float productValue59 = fract(multiplyAddValue23 * comparisonValue37);
                    vec4 sampledTextureValue40 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue58 - 0.5) < 0.0625) ? (((productValue58 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue22) : multiplyAddValue22, (abs(productValue59 - 0.5) < 0.0625) ? (((productValue59 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue23) : multiplyAddValue23));
                    float scalarValue37 = sampledTextureValue40.x;
                    float scalarValue38 = sampledTextureValue40.y;
                    float scalarValue39 = sampledTextureValue40.z;
                    float scalarValue40 = sampledTextureValue40.w;
                    float multiplyAddValue24 = fract(fma(multiplyAddValue22, comparisonValue36, 0.5));
                    float multiplyAddValue25 = fract(fma(multiplyAddValue23, comparisonValue37, 0.5));
                    bool conditionValue9 = multiplyAddValue25 > 0.5;
                    bool conditionValue10 = multiplyAddValue24 > 0.5;
                    float comparisonValue38 = conditionValue9 ? scalarValue37 : scalarValue40;
                    float comparisonValue39 = conditionValue9 ? scalarValue38 : scalarValue39;
                    float comparisonValue40 = conditionValue10 ? scalarValue39 : scalarValue40;
                    float comparisonValue41 = conditionValue10 ? scalarValue38 : scalarValue37;
                    float sumValue14 = multiplyAddValue24 - 0.083333335816860198974609375;
                    float sumValue15 = multiplyAddValue24 + 0.083333335816860198974609375;
                    float sumValue16 = multiplyAddValue25 - 0.083333335816860198974609375;
                    float sumValue17 = multiplyAddValue25 + 0.083333335816860198974609375;
                    uint sumValue18 = uint(int(spvNClamp(sumValue14 + sumValue14, 0.0, 1.0)));
                    uint sumValue19 = uint(int(spvNClamp(sumValue15 + sumValue15, 0.0, 1.0)));
                    uint sumValue20 = uint(int(spvNClamp(sumValue16 + sumValue16, 0.0, 1.0)));
                    uint sumValue21 = uint(int(spvNClamp(sumValue17 + sumValue17, 0.0, 1.0)));
                    float comparisonValue42 = ((sumValue18 == 1u) ? comparisonValue39 : ((sumValue18 == 0u) ? comparisonValue38 : 0.0)) - ((sumValue19 == 1u) ? comparisonValue39 : ((sumValue19 == 0u) ? comparisonValue38 : 0.0));
                    float comparisonValue43 = ((sumValue20 == 1u) ? comparisonValue41 : ((sumValue20 == 0u) ? comparisonValue40 : 0.0)) - ((sumValue21 == 1u) ? comparisonValue41 : ((sumValue21 == 0u) ? comparisonValue40 : 0.0));
                    vec3 vectorValue = vec3(comparisonValue42, comparisonValue43, 0.25);
                    float scalarValue41 = rdDot3Precise(vectorValue, vectorValue);
                    float inverseLengthValue7 = inversesqrt(scalarValue41);
                    productValue22 = sumValue13 * (inverseLengthValue7 * comparisonValue43);
                    productValue23 = sumValue13 * (inverseLengthValue7 * comparisonValue42);
                    productValue24 = inverseLengthValue7 * 0.25;
                }
                else
                {
                    productValue22 = 0.0;
                    productValue23 = 0.0;
                    productValue24 = 1.0;
                }
                intermediateValue41 = productValue22;
                intermediateValue42 = productValue23;
                intermediateValue43 = productValue24;
            }
            else
            {
                float intermediateValue62;
                float intermediateValue64;
                float intermediateValue66;
                if ((reinterpretedBits2 & 16u) == 16u)
                {
                    float multiplyAddValue26 = fma(comparisonValue32, scalarValue30, scalarValue32);
                    float multiplyAddValue27 = fma(comparisonValue33, scalarValue31, scalarValue33);
                    float sumValue22 = spvNMin(sampledTextureValue37, sampledTextureValue37 - scalarValue35);
                    vec4 sampledTextureValue41 = textureLod(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue26, multiplyAddValue27), 0.0);
                    float scalarValue42 = sampledTextureValue41.x;
                    float scalarValue43 = sampledTextureValue41.y;
                    float scalarValue44 = sampledTextureValue41.z;
                    float intermediateValue63;
                    float intermediateValue65;
                    float intermediateValue67;
                    if ((scalarValue43 == scalarValue42) && (scalarValue44 == scalarValue43))
                    {
                        float scalarValue45 = spvNClamp(2.0 - sumValue22, 0.0, 1.0);
                        float productValue29;
                        float productValue30;
                        float productValue31;
                        if (scalarValue45 > 0.0)
                        {
                            bool sampledTextureValue42 = uint(textureQueryLevels(materialTexture1)) > 0u;
                            uvec2 sampledTextureValue43 = uvec2(textureSize(materialTexture1, int(0u)));
                            uint scalarValue46 = sampledTextureValue43.x;
                            float comparisonValue44 = rdEvaluateFloatExpression2(sampledTextureValue42 ? scalarValue46 : 0u);
                            float comparisonValue45 = rdEvaluateFloatExpression2(sampledTextureValue42 ? sampledTextureValue43.y : 0u);
                            float productValue60 = fract(multiplyAddValue26 * comparisonValue44);
                            float productValue61 = fract(multiplyAddValue27 * comparisonValue45);
                            vec4 sampledTextureValue44 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue60 - 0.5) < 0.0625) ? (multiplyAddValue26 + ((productValue60 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue26, (abs(productValue61 - 0.5) < 0.0625) ? (multiplyAddValue27 + ((productValue61 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue27));
                            float scalarValue47 = sampledTextureValue44.x;
                            float scalarValue48 = sampledTextureValue44.y;
                            float scalarValue49 = sampledTextureValue44.z;
                            float scalarValue50 = sampledTextureValue44.w;
                            float multiplyAddValue28 = fract(fma(multiplyAddValue26, comparisonValue44, 0.5));
                            float multiplyAddValue29 = fract(fma(multiplyAddValue27, comparisonValue45, 0.5));
                            bool conditionValue11 = multiplyAddValue29 > 0.5;
                            bool conditionValue12 = multiplyAddValue28 > 0.5;
                            float comparisonValue46 = conditionValue11 ? scalarValue47 : scalarValue50;
                            float comparisonValue47 = conditionValue11 ? scalarValue48 : scalarValue49;
                            float comparisonValue48 = conditionValue12 ? scalarValue49 : scalarValue50;
                            float comparisonValue49 = conditionValue12 ? scalarValue48 : scalarValue47;
                            float sumValue23 = multiplyAddValue28 - 0.083333335816860198974609375;
                            float sumValue24 = multiplyAddValue28 + 0.083333335816860198974609375;
                            float sumValue25 = multiplyAddValue29 - 0.083333335816860198974609375;
                            float sumValue26 = multiplyAddValue29 + 0.083333335816860198974609375;
                            uint sumValue27 = uint(int(spvNClamp(sumValue23 + sumValue23, 0.0, 1.0)));
                            uint sumValue28 = uint(int(spvNClamp(sumValue24 + sumValue24, 0.0, 1.0)));
                            uint sumValue29 = uint(int(spvNClamp(sumValue25 + sumValue25, 0.0, 1.0)));
                            uint sumValue30 = uint(int(spvNClamp(sumValue26 + sumValue26, 0.0, 1.0)));
                            float comparisonValue50 = ((sumValue27 == 1u) ? comparisonValue47 : ((sumValue27 == 0u) ? comparisonValue46 : 0.0)) - ((sumValue28 == 1u) ? comparisonValue47 : ((sumValue28 == 0u) ? comparisonValue46 : 0.0));
                            float comparisonValue51 = ((sumValue29 == 1u) ? comparisonValue49 : ((sumValue29 == 0u) ? comparisonValue48 : 0.0)) - ((sumValue30 == 1u) ? comparisonValue49 : ((sumValue30 == 0u) ? comparisonValue48 : 0.0));
                            vec3 vectorValue1 = vec3(comparisonValue50, comparisonValue51, 0.25);
                            float scalarValue51 = rdDot3Precise(vectorValue1, vectorValue1);
                            float inverseLengthValue8 = inversesqrt(scalarValue51);
                            productValue29 = scalarValue45 * (inverseLengthValue8 * comparisonValue51);
                            productValue30 = scalarValue45 * (inverseLengthValue8 * comparisonValue50);
                            productValue31 = inverseLengthValue8 * 0.25;
                        }
                        else
                        {
                            productValue29 = 0.0;
                            productValue30 = 0.0;
                            productValue31 = 1.0;
                        }
                        intermediateValue63 = productValue29;
                        intermediateValue65 = productValue30;
                        intermediateValue67 = productValue31;
                    }
                    else
                    {
                        bool sampledTextureValue45 = uint(textureQueryLevels(materialTexture1)) > 0u;
                        uvec2 sampledTextureValue46 = uvec2(textureSize(materialTexture1, int(0u)));
                        uint scalarValue52 = sampledTextureValue46.x;
                        float comparisonValue52 = rdEvaluateFloatExpression2(sampledTextureValue45 ? scalarValue52 : 0u);
                        float comparisonValue53 = rdEvaluateFloatExpression2(sampledTextureValue45 ? sampledTextureValue46.y : 0u);
                        float sumValue31 = spvNClamp(2.0 - sumValue22, 0.0, 1.0);
                        bool conditionValue13 = sumValue31 > 0.0;
                        float productValue62 = fract(multiplyAddValue26 * comparisonValue52);
                        float productValue63 = fract(multiplyAddValue27 * comparisonValue53);
                        float multiplyAddValue30 = (productValue62 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue41.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue31 = (productValue63 <= 0.083333335816860198974609375) ? (-fma(scalarValue42, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue32 = (productValue62 >= 0.916666686534881591796875) ? (fma(scalarValue43, 2.0, -1.0) + multiplyAddValue30) : multiplyAddValue30;
                        float multiplyAddValue33 = (productValue63 >= 0.916666686534881591796875) ? (fma(scalarValue44, 2.0, -1.0) + multiplyAddValue31) : multiplyAddValue31;
                        bool comparisonValue54 = abs(multiplyAddValue32) >= 0.004999999888241291046142578125;
                        bool comparisonValue55 = abs(multiplyAddValue33) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue56 = vec3(comparisonValue54 ? multiplyAddValue32 : 0.0, comparisonValue55 ? multiplyAddValue33 : 0.0, 0.25);
                        float scalarValue53 = rdDot3Precise(comparisonValue56, comparisonValue56);
                        float inverseLengthValue9 = inversesqrt(scalarValue53);
                        intermediateValue63 = (conditionValue13 && comparisonValue55) ? (sumValue31 * (inverseLengthValue9 * multiplyAddValue33)) : 0.0;
                        intermediateValue65 = (conditionValue13 && comparisonValue54) ? (sumValue31 * (inverseLengthValue9 * multiplyAddValue32)) : 0.0;
                        intermediateValue67 = conditionValue13 ? (inverseLengthValue9 * 0.25) : 1.0;
                    }
                    intermediateValue62 = intermediateValue63;
                    intermediateValue64 = intermediateValue65;
                    intermediateValue66 = intermediateValue67;
                }
                else
                {
                    intermediateValue62 = 0.0;
                    intermediateValue64 = 0.0;
                    intermediateValue66 = 1.0;
                }
                intermediateValue41 = intermediateValue62;
                intermediateValue42 = intermediateValue64;
                intermediateValue43 = intermediateValue66;
            }
            multiplyAddValue14 = intermediateValue41;
            multiplyAddValue15 = intermediateValue42;
            multiplyAddValue16 = intermediateValue43;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue27 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(comparisonValue2, sampledTextureValue13, sampledTextureValue15), fma(comparisonValue1, sampledTextureValue14, sampledTextureValue16)));
            intermediateValue21 = (sampledTextureValue27.x * 2.0) + (-1.0);
            intermediateValue22 = (sampledTextureValue27.y * 2.0) + (-1.0);
            intermediateValue23 = (sampledTextureValue27.z * 2.0) + (-1.0);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue27 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(comparisonValue2, sampledTextureValue13, sampledTextureValue15), fma(comparisonValue1, sampledTextureValue14, sampledTextureValue16)));
            intermediateValue22 = (sampledTextureValue27.x * 2.0) + (-1.0);
            intermediateValue23 = (sampledTextureValue27.y * 2.0) + (-1.0);
            intermediateValue24 = (sampledTextureValue27.z * 2.0) + (-1.0);
#endif
        }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue28;
        float intermediateValue30;
        float intermediateValue32;
        float comparisonValue11;
        if ((reinterpretedBits2 & 1u) == 1u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue32;
        float intermediateValue34;
        float intermediateValue36;
        float comparisonValue11;
        if ((reinterpretedBits2 & 1u) == 1u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue10;
        float sampledTextureValue11;
        float sampledTextureValue12;
        float intermediateValue14;
        if ((scalarValue6 & 1u) == 0u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue10;
        float sampledTextureValue11;
        float sampledTextureValue12;
        float intermediateValue15;
        if ((scalarValue6 & 1u) == 0u)
#endif
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            uint productValue64 = comparisonValue34 * 16u;
            vec4 sampledTextureValue47 = uintBitsToFloat(uvec4(texelFetch(intermediateValue1, int(productValue64)).x, texelFetch(intermediateValue1, int(productValue64 + 1u)).x, texelFetch(intermediateValue1, int(productValue64 + 2u)).x, texelFetch(intermediateValue1, int(productValue64 + 3u)).x));
            vec4 sampledTextureValue48 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(comparisonValue32, sampledTextureValue47.x, sampledTextureValue47.z), fma(comparisonValue33, sampledTextureValue47.y, sampledTextureValue47.w)));
            comparisonValue11 = ((reinterpretedBits2 & 2u) == 2u) ? sampledTextureValue48.w : scalarValue34;
            intermediateValue32 = sampledTextureValue48.x;
            intermediateValue30 = sampledTextureValue48.z;
            intermediateValue28 = sampledTextureValue48.y;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            uint productValue64 = comparisonValue34 * 16u;
            vec4 sampledTextureValue47 = uintBitsToFloat(uvec4(texelFetch(intermediateValue1, int(productValue64)).x, texelFetch(intermediateValue1, int(productValue64 + 1u)).x, texelFetch(intermediateValue1, int(productValue64 + 2u)).x, texelFetch(intermediateValue1, int(productValue64 + 3u)).x));
            vec4 sampledTextureValue48 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(comparisonValue32, sampledTextureValue47.x, sampledTextureValue47.z), fma(comparisonValue33, sampledTextureValue47.y, sampledTextureValue47.w)));
            comparisonValue11 = ((reinterpretedBits2 & 2u) == 2u) ? sampledTextureValue48.w : scalarValue34;
            intermediateValue36 = sampledTextureValue48.x;
            intermediateValue34 = sampledTextureValue48.z;
            intermediateValue32 = sampledTextureValue48.y;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue12 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 10u)).x);
            sampledTextureValue10 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 11u)).x);
            sampledTextureValue11 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 9u)).x);
            intermediateValue14 = sampledTextureValue18;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue12 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 10u)).x);
            sampledTextureValue10 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 11u)).x);
            sampledTextureValue11 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 9u)).x);
            intermediateValue15 = sampledTextureValue18;
#endif
        }
        else
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue11 = scalarValue34;
            intermediateValue32 = sampledTextureValue34.w;
            intermediateValue30 = sampledTextureValue34.y;
            intermediateValue28 = sampledTextureValue34.z;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue11 = scalarValue34;
            intermediateValue36 = sampledTextureValue34.w;
            intermediateValue34 = sampledTextureValue34.y;
            intermediateValue32 = sampledTextureValue34.z;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue28 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(comparisonValue2, uintBitsToFloat(texelFetch(pbrData, int(comparisonValue3 * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 2u)).x)), fma(comparisonValue1, uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 3u)).x))));
            sampledTextureValue12 = sampledTextureValue28.y;
            sampledTextureValue10 = sampledTextureValue28.x;
            sampledTextureValue11 = sampledTextureValue28.z;
            intermediateValue14 = ((scalarValue6 & 2u) != 0u) ? sampledTextureValue28.w : sampledTextureValue18;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue28 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(comparisonValue2, uintBitsToFloat(texelFetch(pbrData, int(comparisonValue3 * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 2u)).x)), fma(comparisonValue1, uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 3u)).x))));
            sampledTextureValue12 = sampledTextureValue28.y;
            sampledTextureValue10 = sampledTextureValue28.x;
            sampledTextureValue11 = sampledTextureValue28.z;
            intermediateValue15 = ((scalarValue6 & 2u) != 0u) ? sampledTextureValue28.w : sampledTextureValue18;
#endif
        }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue57 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue58 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue59 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue54 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue10 = inversesqrt(scalarValue54);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue55 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue11 = inversesqrt(scalarValue55);
        vec3 vectorValue4 = vec3(comparisonValue57, comparisonValue58, comparisonValue59);
        float scalarValue56 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue12 = inversesqrt(scalarValue56);
        intermediateValue27 = intermediateValue28;
        intermediateValue29 = intermediateValue30;
        multiplyAddValue6 = fma(inverseLengthValue12 * comparisonValue59, multiplyAddValue15, fma(inverseLengthValue10 * varyingTangent0.z, multiplyAddValue14, multiplyAddValue13 * (inverseLengthValue11 * varyingBitangent0.z)));
        multiplyAddValue7 = fma(inverseLengthValue12 * comparisonValue58, multiplyAddValue15, fma(inverseLengthValue10 * varyingTangent0.y, multiplyAddValue14, multiplyAddValue13 * (inverseLengthValue11 * varyingBitangent0.y)));
        multiplyAddValue8 = fma(inverseLengthValue12 * comparisonValue57, multiplyAddValue15, fma(inverseLengthValue10 * varyingTangent0.x, multiplyAddValue14, multiplyAddValue13 * (inverseLengthValue11 * varyingBitangent0.x)));
        intermediateValue31 = intermediateValue32;
        intermediateValue33 = comparisonValue11;
    }
    else
    {
        intermediateValue27 = 0.0;
        intermediateValue29 = 1.0;
        multiplyAddValue6 = 0.0;
        multiplyAddValue7 = 1.0;
        multiplyAddValue8 = 0.0;
        intermediateValue31 = 0.0;
        intermediateValue33 = 0.0;
    }
    float sumValue6 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    float sumValue7 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    float sumValue8 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    fragmentColor1.w = (intermediateValue33 < intermediateValue31) ? fma(intermediateValue31, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue33, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(multiplyAddValue8, multiplyAddValue7, multiplyAddValue6);
    float scalarValue57 = rdDot3Precise(vectorValue5, vectorValue5);
    float inverseLengthValue13 = inversesqrt(scalarValue57);
    float productValue65 = inverseLengthValue13 * multiplyAddValue8;
    float productValue66 = inverseLengthValue13 * multiplyAddValue7;
    float productValue67 = inverseLengthValue13 * multiplyAddValue6;
    float quotientValue3 = 1.0 / (abs(productValue67) + (abs(productValue66) + abs(productValue65)));
    float productValue68 = quotientValue3 * productValue65;
    float productValue69 = quotientValue3 * productValue66;
    bool conditionValue14 = productValue67 < 0.0;
    float sumValue32 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue14 ? ((1.0 - abs(productValue69)) * ((productValue68 >= 0.0) ? sumValue32 : (-1.0))) : productValue68;
    fragmentColor2.y = conditionValue14 ? ((1.0 - abs(productValue68)) * ((productValue69 >= 0.0) ? sumValue32 : (-1.0))) : productValue69;
    float multiplyAddValue34 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    float multiplyAddValue35 = fma(fragmentScalarConstants1.packedValues[27u], sumValue8, fma(fragmentScalarConstants1.packedValues[19u], sumValue6, sumValue7 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue34, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue35, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue34, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue35, 0.5, 0.5);
    bool bitwiseValue = (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05);
    float productValue46 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue60 = (bitwiseValue ? spvNMin(productValue46, 1.0) : varyingTexCoord5.x) * 0.16666667163372039794921875;
    float multiplyAddValue36 = (bitwiseValue ? spvNMin(fma(fma(productValue46, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue46, 1.0) : varyingTexCoord5.y) * 0.16666667163372039794921875;
    float multiplyAddValue37 = (bitwiseValue ? spvNMin(fma(productValue46 * productValue46, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue46, 1.0) : varyingTexCoord5.z) * 0.16666667163372039794921875;
    float productValue70 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue36, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue37, comparisonValue60)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue36 / productValue70, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue60 / productValue70, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue37 / productValue70, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue70, 0.0, 1.0) * 255.0);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue57 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue58 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue59 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue54 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue10 = inversesqrt(scalarValue54);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue55 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue11 = inversesqrt(scalarValue55);
        vec3 vectorValue4 = vec3(comparisonValue57, comparisonValue58, comparisonValue59);
        float scalarValue56 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue12 = inversesqrt(scalarValue56);
        intermediateValue31 = intermediateValue32;
        intermediateValue33 = intermediateValue34;
        multiplyAddValue7 = fma(inverseLengthValue12 * comparisonValue59, multiplyAddValue16, fma(inverseLengthValue10 * varyingTangent0.z, multiplyAddValue15, multiplyAddValue14 * (inverseLengthValue11 * varyingBitangent0.z)));
        multiplyAddValue8 = fma(inverseLengthValue12 * comparisonValue58, multiplyAddValue16, fma(inverseLengthValue10 * varyingTangent0.y, multiplyAddValue15, multiplyAddValue14 * (inverseLengthValue11 * varyingBitangent0.y)));
        multiplyAddValue9 = fma(inverseLengthValue12 * comparisonValue57, multiplyAddValue16, fma(inverseLengthValue10 * varyingTangent0.x, multiplyAddValue15, multiplyAddValue14 * (inverseLengthValue11 * varyingBitangent0.x)));
        intermediateValue35 = intermediateValue36;
        intermediateValue37 = comparisonValue11;
    }
    else
    {
        intermediateValue31 = 0.0;
        intermediateValue33 = 1.0;
        multiplyAddValue7 = 0.0;
        multiplyAddValue8 = 1.0;
        multiplyAddValue9 = 0.0;
        intermediateValue35 = 0.0;
        intermediateValue37 = 0.0;
    }
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float reinterpretedBits13 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits12.x);
    float reinterpretedBits14 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits12.y);
    float reinterpretedBits15 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits12.z);
    fragmentColor1.w = (intermediateValue37 < intermediateValue35) ? fma(intermediateValue35, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue37, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue7 = vec3(multiplyAddValue9, multiplyAddValue8, multiplyAddValue7);
    float scalarValue70 = rdDot3Precise(vectorValue7, vectorValue7);
    float inverseLengthValue18 = inversesqrt(scalarValue70);
    float productValue84 = inverseLengthValue18 * multiplyAddValue9;
    float productValue85 = inverseLengthValue18 * multiplyAddValue8;
    float productValue86 = inverseLengthValue18 * multiplyAddValue7;
    float quotientValue9 = 1.0 / (abs(productValue86) + (abs(productValue85) + abs(productValue84)));
    float productValue87 = quotientValue9 * productValue84;
    float productValue88 = quotientValue9 * productValue85;
    bool conditionValue16 = productValue86 < 0.0;
    float sumValue32 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue16 ? ((1.0 - abs(productValue88)) * ((productValue87 >= 0.0) ? sumValue32 : (-1.0))) : productValue87;
    fragmentColor2.y = conditionValue16 ? ((1.0 - abs(productValue87)) * ((productValue88 >= 0.0) ? sumValue32 : (-1.0))) : productValue88;
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[5u]);
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[6u]);
    uvec4 reinterpretedBits19 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float multiplyAddValue42 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[27u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[23u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[31u]));
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue43 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), reinterpretedBits15, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u])), reinterpretedBits13, reinterpretedBits14 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits18.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits17.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits16.x))) + uintBitsToFloat(reinterpretedBits19.x)) / multiplyAddValue42, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits22.x), reinterpretedBits15, fma(uintBitsToFloat(reinterpretedBits21.x), reinterpretedBits13, reinterpretedBits14 * uintBitsToFloat(reinterpretedBits20.x))) + uintBitsToFloat(reinterpretedBits23.x)) / multiplyAddValue43, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits18.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits17.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits16.y))) + uintBitsToFloat(reinterpretedBits19.y)) / multiplyAddValue42, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits22.y), reinterpretedBits15, fma(uintBitsToFloat(reinterpretedBits21.y), reinterpretedBits13, reinterpretedBits14 * uintBitsToFloat(reinterpretedBits20.y))) + uintBitsToFloat(reinterpretedBits23.y)) / multiplyAddValue43, 0.5, 0.5);
    bool bitwiseValue = (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05);
    float productValue46 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue60 = (bitwiseValue ? spvNMin(productValue46, 1.0) : varyingTexCoord5.x) * 0.16666667163372039794921875;
    float multiplyAddValue36 = (bitwiseValue ? spvNMin(fma(fma(productValue46, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue46, 1.0) : varyingTexCoord5.y) * 0.16666667163372039794921875;
    float multiplyAddValue37 = (bitwiseValue ? spvNMin(fma(productValue46 * productValue46, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue46, 1.0) : varyingTexCoord5.z) * 0.16666667163372039794921875;
    float productValue70 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue36, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue37, comparisonValue60)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue36 / productValue70, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue60 / productValue70, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue37 / productValue70, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue70, 0.0, 1.0) * 255.0);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue22 = comparisonValue ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue23 = comparisonValue ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue24 = comparisonValue ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue22, comparisonValue23, comparisonValue24), vec3(comparisonValue22, comparisonValue23, comparisonValue24)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue5 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue21;
        intermediateValue10 = sampledTextureValue10;
        intermediateValue11 = sampledTextureValue11;
        intermediateValue12 = sampledTextureValue12;
        intermediateValue13 = intermediateValue14;
        intermediateValue15 = fma(inverseLengthValue3 * comparisonValue22, intermediateValue23, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue22, inverseLengthValue5 * varyingTangent0.x));
        intermediateValue16 = fma(inverseLengthValue3 * comparisonValue23, intermediateValue23, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue22, inverseLengthValue5 * varyingTangent0.y));
        intermediateValue17 = fma(inverseLengthValue3 * comparisonValue24, intermediateValue23, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue22, inverseLengthValue5 * varyingTangent0.z));
    }
    float sumValue6 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    float sumValue7 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    float sumValue8 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float inverseLengthValue6 = inversesqrt(dot(vec3(intermediateValue15, intermediateValue16, intermediateValue17), vec3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue41 = inverseLengthValue6 * intermediateValue15;
    float productValue42 = inverseLengthValue6 * intermediateValue16;
    float productValue43 = inverseLengthValue6 * intermediateValue17;
    float quotientValue1 = 1.0 / ((abs(productValue42) + abs(productValue41)) + abs(productValue43));
    float productValue44 = quotientValue1 * productValue41;
    float productValue45 = quotientValue1 * productValue42;
    bool conditionValue6 = productValue43 < 0.0;
    float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float intermediateValue20;
    float productValue19;
    float productValue20;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue46 = varyingTexCoord1.x * varyingTexCoord1.x;
        intermediateValue20 = spvNClamp(productValue46, 0.0, 1.0);
        productValue19 = spvNClamp(((productValue46 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue46, 0.0, 1.0);
        productValue20 = spvNClamp((((productValue46 * productValue46) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue46, 0.0, 1.0);
    }
    else
    {
        intermediateValue20 = varyingTexCoord5.x;
        productValue19 = varyingTexCoord5.y;
        productValue20 = varyingTexCoord5.z;
    }
    float productValue47 = intermediateValue20 * 0.16666667163372039794921875;
    float productValue48 = productValue19 * 0.16666667163372039794921875;
    float productValue49 = productValue20 * 0.16666667163372039794921875;
    float productValue50 = ceil(spvNClamp(spvNMax(spvNMax(productValue47, productValue49), spvNMax(productValue48, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue11, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue47 / productValue50, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue48 / productValue50, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue49 / productValue50, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue50, 0.0, 1.0) * 255.0) & 255u);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue22 = comparisonValue ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue23 = comparisonValue ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue24 = comparisonValue ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue22, comparisonValue23, comparisonValue24), vec3(comparisonValue22, comparisonValue23, comparisonValue24)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue15 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue22;
        intermediateValue11 = sampledTextureValue10;
        intermediateValue12 = sampledTextureValue11;
        intermediateValue13 = sampledTextureValue12;
        intermediateValue14 = intermediateValue15;
        intermediateValue16 = fma(inverseLengthValue3 * comparisonValue22, intermediateValue24, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue23, inverseLengthValue15 * varyingTangent0.x));
        intermediateValue17 = fma(inverseLengthValue3 * comparisonValue23, intermediateValue24, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue23, inverseLengthValue15 * varyingTangent0.y));
        intermediateValue18 = fma(inverseLengthValue3 * comparisonValue24, intermediateValue24, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue23, inverseLengthValue15 * varyingTangent0.z));
    }
    float sumValue33 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue34 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue35 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue16 = inversesqrt(dot(vec3(intermediateValue16, intermediateValue17, intermediateValue18), vec3(intermediateValue16, intermediateValue17, intermediateValue18)));
    float productValue73 = inverseLengthValue16 * intermediateValue16;
    float productValue74 = inverseLengthValue16 * intermediateValue17;
    float productValue75 = inverseLengthValue16 * intermediateValue18;
    float quotientValue6 = 1.0 / ((abs(productValue74) + abs(productValue73)) + abs(productValue75));
    float productValue76 = quotientValue6 * productValue73;
    float productValue77 = quotientValue6 * productValue74;
    bool conditionValue15 = productValue75 < 0.0;
    float multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue39 = fma(fragmentVectorConstants1.packedValues[10u].w, sumValue35, fma(fragmentVectorConstants1.packedValues[9u].w, sumValue34, sumValue33 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
    float intermediateValue21;
    float productValue21;
    float productValue22;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue46 = varyingTexCoord1.x * varyingTexCoord1.x;
        intermediateValue21 = spvNClamp(productValue46, 0.0, 1.0);
        productValue21 = spvNClamp(((productValue46 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue46, 0.0, 1.0);
        productValue22 = spvNClamp((((productValue46 * productValue46) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue46, 0.0, 1.0);
    }
    else
    {
        intermediateValue21 = varyingTexCoord5.x;
        productValue21 = varyingTexCoord5.y;
        productValue22 = varyingTexCoord5.z;
    }
    float productValue78 = intermediateValue21 * 0.16666667163372039794921875;
    float productValue79 = productValue21 * 0.16666667163372039794921875;
    float productValue80 = productValue22 * 0.16666667163372039794921875;
    float productValue81 = ceil(spvNClamp(spvNMax(spvNMax(productValue78, productValue80), spvNMax(productValue79, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue78 / productValue81, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue79 / productValue81, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue80 / productValue81, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue81, 0.0, 1.0) * 255.0) & 255u);
#endif
    fragmentColor0.w = uint(spvNClamp(varyingTexCoord1.y, 0.0, 1.0) * 255.0);
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = uint(spvNClamp(intermediateValue27, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue29, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = uint(spvNClamp(intermediateValue31, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue33, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor1.x = productValue10;
    fragmentColor1.y = productValue11;
    fragmentColor1.z = productValue12;
    fragmentColor1.w = (intermediateValue10 > intermediateValue13) ? ((intermediateValue10 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue13 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue44 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue45))) : productValue44;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue44)) * ((productValue45 < 0.0) ? (-1.0) : 1.0)) : productValue45;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue10) - ((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue11)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue10) - ((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue11)) * 0.5;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor1.x = productValue12;
    fragmentColor1.y = productValue13;
    fragmentColor1.z = productValue14;
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue14 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue15 ? (((productValue76 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue77))) : productValue76;
    fragmentColor2.y = conditionValue15 ? ((1.0 - abs(productValue76)) * ((productValue77 < 0.0) ? (-1.0) : 1.0)) : productValue77;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue38) - ((fma(fragmentVectorConstants1.packedValues[10u].x, sumValue35, fma(fragmentVectorConstants1.packedValues[9u].x, sumValue34, sumValue33 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue39)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue38) - ((fma(fragmentVectorConstants1.packedValues[10u].y, sumValue35, fma(fragmentVectorConstants1.packedValues[9u].y, sumValue34, sumValue33 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue39)) * 0.5;
#endif
    discardIfRequested();
}
