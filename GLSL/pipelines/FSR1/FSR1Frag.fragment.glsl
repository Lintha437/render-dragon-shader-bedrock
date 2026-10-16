#version 460
#extension GL_GOOGLE_include_directive : require
// FSR1 / FSR1Frag / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_FFXPRECISION
#define RD_OPTION_FFXPRECISION RD_FFXPRECISION_HALF
#endif
#ifndef RD_OPTION_FSRFILTER_MODE
#define RD_OPTION_FSRFILTER_MODE RD_FSRFILTER_MODE_EASU
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_HALF && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_EASU && RD_PLATFORM == RD_PLATFORM_SM65)
#if defined(GL_AMD_gpu_shader_half_float)
#extension GL_AMD_gpu_shader_half_float : require
#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
#else
#error No extension available for FP16.
#endif
#extension GL_EXT_shader_16bit_storage : require
#extension GL_EXT_spirv_intrinsics : require
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_HALF && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_RCAS)
#if defined(GL_AMD_gpu_shader_half_float)
#extension GL_AMD_gpu_shader_half_float : require
#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
#else
#error No extension available for FP16.
#endif
#extension GL_EXT_shader_16bit_storage : require
#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_HALF && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_BILINEAR)
#if defined(GL_AMD_gpu_shader_half_float)
#extension GL_AMD_gpu_shader_half_float : require
#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
#else
#error No extension available for FP16.
#endif
#extension GL_EXT_shader_16bit_storage : require
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_FULL && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_EASU)
#extension GL_EXT_spirv_intrinsics : require
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_FULL && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_RCAS)
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/FSR1/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[0u]);
    float reinterpretedBits1 = rdSignedBitsToFloat(uint(int(varyingTexCoord0.x * uintBitsToFloat(reinterpretedBits.z))) - uint(int(varyingTexCoord0.y * uintBitsToFloat(reinterpretedBits.w))));
    bool multiplyAddValue = fma(-floor(reinterpretedBits1 * 0.0625), 16.0, reinterpretedBits1) <= 0.937499940395355224609375;
    fragmentColor0.x = multiplyAddValue ? 0.9570000171661376953125 : 0.0;
    fragmentColor0.y = multiplyAddValue ? 0.2750000059604644775390625 : 0.0;
    fragmentColor0.z = multiplyAddValue ? 0.0670000016689300537109375 : 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60
    float productValue = float(int(uint(int(fragmentVectorConstants1.packedValues[0u].z * varyingTexCoord0.x)) - uint(int(fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord0.y))));
    float comparisonValue = (((productValue - (floor(productValue * 0.0625) * 16.0)) * 0.066666670143604278564453125) > 0.0625) ? 0.0 : 1.0;
    fragmentColor0.x = comparisonValue * 0.9570000171661376953125;
    fragmentColor0.y = comparisonValue * 0.2750000059604644775390625;
    fragmentColor0.z = comparisonValue * 0.0670000016689300537109375;
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_HALF && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_EASU && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue1 = (fragmentVectorConstants1.packedValues[0u].x * float(uint(fragmentVectorConstants1.packedValues[4u].z * varyingTexCoord0.x))) + fragmentVectorConstants1.packedValues[0u].z;
    float productValue2 = (fragmentVectorConstants1.packedValues[0u].y * float(uint(fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord0.y))) + fragmentVectorConstants1.packedValues[0u].w;
    float productValue3 = (productValue1 + 0.5) * fragmentVectorConstants1.packedValues[1u].x;
    float productValue4 = (productValue2 + 0.5) * fragmentVectorConstants1.packedValues[1u].y;
    vec4 sampledTextureValue = textureLod(sampler2D(inputTexTexture, inputTexSampler), vec2(productValue3, productValue4 - fragmentVectorConstants1.packedValues[1u].y), 0.0);
    vec4 sampledTextureValue1 = textureLod(sampler2D(inputTexTexture, inputTexSampler), vec2(productValue3 - fragmentVectorConstants1.packedValues[1u].x, productValue4), 0.0);
    vec4 sampledTextureValue2 = textureLod(sampler2D(inputTexTexture, inputTexSampler), vec2(productValue3, productValue4), 0.0);
    float16_t scalarValue = float16_t(sampledTextureValue2.x);
    float16_t scalarValue1 = float16_t(sampledTextureValue2.y);
    vec4 sampledTextureValue3 = textureLod(sampler2D(inputTexTexture, inputTexSampler), vec2(productValue3 + fragmentVectorConstants1.packedValues[1u].x, productValue4), 0.0);
    vec4 sampledTextureValue4 = textureLod(sampler2D(inputTexTexture, inputTexSampler), vec2(productValue3, productValue4 + fragmentVectorConstants1.packedValues[1u].y), 0.0);
    float16_t productValue5 = (float16_t(sampledTextureValue.x) * float16_t(0.5)) + float16_t(sampledTextureValue.y);
    float16_t productValue6 = (float16_t(sampledTextureValue1.x) * float16_t(0.5)) + float16_t(sampledTextureValue1.y);
    float16_t productValue7 = (scalarValue * float16_t(0.5)) + scalarValue1;
    float16_t productValue8 = (float16_t(sampledTextureValue3.x) * float16_t(0.5)) + float16_t(sampledTextureValue3.y);
    float16_t productValue9 = (float16_t(sampledTextureValue4.x) * float16_t(0.5)) + float16_t(sampledTextureValue4.y);
    float16_t sumValue = productValue8 - productValue6;
    float16_t quotientValue = spvNClamp(abs(sumValue) * (float16_t(1.0) / spvNMax(abs(productValue8 - productValue7), abs(productValue7 - productValue6))), float16_t(0.0), float16_t(1.0));
    float16_t sumValue1 = productValue9 - productValue5;
    float16_t quotientValue1 = spvNClamp(abs(sumValue1) * (float16_t(1.0) / spvNMax(abs(productValue9 - productValue7), abs(productValue7 - productValue5))), float16_t(0.0), float16_t(1.0));
    float16_t productValue10 = (sumValue1 * sumValue1) + (sumValue * sumValue);
    float16_t intermediateValue2;
    float16_t intermediateValue3;
    float16_t intermediateValue4;
    if (productValue10 < float16_t(0.015625))
    {
        intermediateValue2 = scalarValue;
        intermediateValue3 = scalarValue1;
        intermediateValue4 = float16_t(sampledTextureValue2.z);
    }
    else
    {
        float16_t inverseLengthValue = inversesqrt(productValue10);
        float16_t productValue11 = inverseLengthValue * sumValue;
        float16_t productValue12 = inverseLengthValue * sumValue1;
        float16_t productValue13 = ((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) * float16_t(0.5);
        float16_t productValue14 = productValue13 * productValue13;
        float16_t quotientValue2 = ((((float16_t(1.0) / spvNMax(abs(productValue11), abs(productValue12))) * ((productValue11 * productValue11) + (productValue12 * productValue12))) + float16_t(-1.0)) * productValue14) + float16_t(1.0);
        float16_t productValue15 = float16_t(1.0) - (productValue14 * float16_t(0.5));
        float16_t productValue16 = float16_t(0.5) - (productValue14 * float16_t(0.2900390625));
        float16_t quotientValue3 = float16_t(1.0) / productValue16;
        float scalarValue2 = floor(productValue1);
        float scalarValue3 = floor(productValue2);
        float16_t sumValue2 = float16_t(productValue1 - scalarValue2);
        float16_t sumValue3 = float16_t(productValue2 - scalarValue3);
        float productValue17 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].y;
        float productValue18 = (scalarValue2 * fragmentVectorConstants1.packedValues[1u].x) + fragmentVectorConstants1.packedValues[1u].z;
        float sumValue4 = productValue17 + fragmentVectorConstants1.packedValues[1u].w;
        float sumValue5 = productValue18 + fragmentVectorConstants1.packedValues[2u].x;
        float sumValue6 = sumValue4 + fragmentVectorConstants1.packedValues[2u].y;
        float sumValue7 = productValue18 + fragmentVectorConstants1.packedValues[2u].z;
        float sumValue8 = sumValue4 + fragmentVectorConstants1.packedValues[2u].w;
        float sumValue9 = productValue18 + fragmentVectorConstants1.packedValues[3u].x;
        float sumValue10 = (fragmentVectorConstants1.packedValues[1u].w + fragmentVectorConstants1.packedValues[3u].y) + sumValue4;
        vec4 sampledTextureValue5 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(productValue18, productValue17));
        vec4 sampledTextureValue6 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(productValue18, productValue17), int(1u));
        vec4 sampledTextureValue7 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(productValue18, productValue17), int(2u));
        vec4 sampledTextureValue8 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue5, sumValue6));
        vec4 sampledTextureValue9 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue5, sumValue6), int(1u));
        vec4 sampledTextureValue10 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue5, sumValue6), int(2u));
        vec4 sampledTextureValue11 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue7, sumValue8));
        vec4 sampledTextureValue12 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue7, sumValue8), int(1u));
        vec4 sampledTextureValue13 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue7, sumValue8), int(2u));
        vec4 sampledTextureValue14 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue9, sumValue10));
        vec4 sampledTextureValue15 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue9, sumValue10), int(1u));
        vec4 sampledTextureValue16 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue9, sumValue10), int(2u));
        float16_t sumValue11 = float16_t(-1.0) - sumValue3;
        float16_t sumValue12 = float16_t(1.0) - sumValue2;
        float16_t productValue19 = sumValue12 * productValue11;
        float16_t productValue20 = sumValue2 * productValue11;
        float16_t productValue21 = sumValue11 * productValue12;
        float16_t productValue22 = sumValue12 * productValue12;
        float16_t productValue23 = sumValue2 * productValue12;
        float16_t productValue24 = sumValue11 * productValue11;
        float16_t productValue25 = (productValue21 + productValue19) * quotientValue2;
        float16_t productValue26 = (productValue21 - productValue20) * quotientValue2;
        float16_t productValue27 = (productValue24 - productValue22) * productValue15;
        float16_t productValue28 = (productValue24 + productValue23) * productValue15;
        float16_t productValue29 = spvNMin((productValue25 * productValue25) + (productValue27 * productValue27), quotientValue3);
        float16_t productValue30 = spvNMin((productValue26 * productValue26) + (productValue28 * productValue28), quotientValue3);
        float16_t productValue31 = (productValue29 * productValue16) + float16_t(-1.0);
        float16_t productValue32 = (productValue30 * productValue16) + float16_t(-1.0);
        float16_t productValue33 = (productValue31 * productValue31) * ((((productValue29 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue29 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t productValue34 = (productValue32 * productValue32) * ((((productValue30 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue30 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t sumValue13 = float16_t(1.0) - sumValue3;
        float16_t sumValue14 = float16_t(-1.0) - sumValue2;
        float16_t productValue35 = sumValue14 * productValue11;
        float16_t productValue36 = sumValue13 * productValue12;
        float16_t productValue37 = sumValue14 * productValue12;
        float16_t productValue38 = sumValue13 * productValue11;
        float16_t productValue39 = (productValue36 + productValue35) * quotientValue2;
        float16_t productValue40 = (productValue36 - productValue20) * quotientValue2;
        float16_t productValue41 = (productValue38 - productValue37) * productValue15;
        float16_t productValue42 = (productValue38 + productValue23) * productValue15;
        float16_t productValue43 = spvNMin((productValue39 * productValue39) + (productValue41 * productValue41), quotientValue3);
        float16_t productValue44 = spvNMin((productValue40 * productValue40) + (productValue42 * productValue42), quotientValue3);
        float16_t productValue45 = (productValue43 * productValue16) + float16_t(-1.0);
        float16_t productValue46 = (productValue44 * productValue16) + float16_t(-1.0);
        float16_t productValue47 = (productValue45 * productValue45) * ((((productValue43 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue43 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t productValue48 = (productValue46 * productValue46) * ((((productValue44 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue44 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t sumValue15 = float16_t(-0.0) - sumValue3;
        float16_t productValue49 = productValue12 * sumValue15;
        float16_t productValue50 = productValue11 * sumValue15;
        float16_t productValue51 = (productValue49 - productValue20) * quotientValue2;
        float16_t productValue52 = (productValue35 + productValue49) * quotientValue2;
        float16_t productValue53 = (productValue50 + productValue23) * productValue15;
        float16_t productValue54 = (productValue50 - productValue37) * productValue15;
        float16_t productValue55 = spvNMin((productValue51 * productValue51) + (productValue53 * productValue53), quotientValue3);
        float16_t productValue56 = spvNMin((productValue52 * productValue52) + (productValue54 * productValue54), quotientValue3);
        float16_t productValue57 = (productValue55 * productValue16) + float16_t(-1.0);
        float16_t productValue58 = (productValue56 * productValue16) + float16_t(-1.0);
        float16_t productValue59 = (productValue57 * productValue57) * ((((productValue55 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue55 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t productValue60 = (productValue58 * productValue58) * ((((productValue56 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue56 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t sumValue16 = float16_t(2.0) - sumValue2;
        float16_t productValue61 = sumValue16 * productValue11;
        float16_t productValue62 = sumValue16 * productValue12;
        float16_t productValue63 = (productValue36 + productValue19) * quotientValue2;
        float16_t productValue64 = (productValue36 + productValue61) * quotientValue2;
        float16_t productValue65 = (productValue38 - productValue22) * productValue15;
        float16_t productValue66 = (productValue38 - productValue62) * productValue15;
        float16_t productValue67 = spvNMin((productValue63 * productValue63) + (productValue65 * productValue65), quotientValue3);
        float16_t productValue68 = spvNMin((productValue64 * productValue64) + (productValue66 * productValue66), quotientValue3);
        float16_t productValue69 = (productValue67 * productValue16) + float16_t(-1.0);
        float16_t productValue70 = (productValue68 * productValue16) + float16_t(-1.0);
        float16_t productValue71 = (productValue69 * productValue69) * ((((productValue67 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue67 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t productValue72 = (productValue70 * productValue70) * ((((productValue68 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue68 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t productValue73 = (productValue61 + productValue49) * quotientValue2;
        float16_t productValue74 = (productValue19 + productValue49) * quotientValue2;
        float16_t productValue75 = (productValue50 - productValue62) * productValue15;
        float16_t productValue76 = (productValue50 - productValue22) * productValue15;
        float16_t productValue77 = spvNMin((productValue73 * productValue73) + (productValue75 * productValue75), quotientValue3);
        float16_t productValue78 = spvNMin((productValue74 * productValue74) + (productValue76 * productValue76), quotientValue3);
        float16_t productValue79 = (productValue77 * productValue16) + float16_t(-1.0);
        float16_t productValue80 = (productValue78 * productValue16) + float16_t(-1.0);
        float16_t productValue81 = (productValue79 * productValue79) * ((((productValue77 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue77 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t productValue82 = (productValue80 * productValue80) * ((((productValue78 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue78 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t sumValue17 = float16_t(2.0) - sumValue3;
        float16_t productValue83 = sumValue17 * productValue12;
        float16_t productValue84 = sumValue17 * productValue11;
        float16_t productValue85 = (productValue83 - productValue20) * quotientValue2;
        float16_t productValue86 = (productValue83 + productValue19) * quotientValue2;
        float16_t productValue87 = (productValue84 + productValue23) * productValue15;
        float16_t productValue88 = (productValue84 - productValue22) * productValue15;
        float16_t productValue89 = spvNMin((productValue85 * productValue85) + (productValue87 * productValue87), quotientValue3);
        float16_t productValue90 = spvNMin((productValue86 * productValue86) + (productValue88 * productValue88), quotientValue3);
        float16_t productValue91 = (productValue89 * productValue16) + float16_t(-1.0);
        float16_t productValue92 = (productValue90 * productValue16) + float16_t(-1.0);
        float16_t productValue93 = (productValue91 * productValue91) * ((((productValue89 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue89 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t productValue94 = (productValue92 * productValue92) * ((((productValue90 * float16_t(0.625)) + float16_t(-1.5625)) * ((productValue90 * float16_t(0.39990234375)) + float16_t(-1.0))) + float16_t(-0.5625));
        float16_t quotientValue4 = float16_t(1.0) / (((((((((((productValue34 + productValue33) + productValue47) + productValue48) + productValue59) + productValue60) + productValue71) + productValue72) + productValue81) + productValue82) + productValue93) + productValue94);
        intermediateValue2 = ((((((((((((productValue34 * float16_t(sampledTextureValue5.w)) + (productValue33 * float16_t(sampledTextureValue5.z))) + (productValue47 * float16_t(sampledTextureValue8.x))) + (productValue48 * float16_t(sampledTextureValue8.y))) + (productValue59 * float16_t(sampledTextureValue8.z))) + (productValue60 * float16_t(sampledTextureValue8.w))) + (productValue71 * float16_t(sampledTextureValue11.x))) + (productValue72 * float16_t(sampledTextureValue11.y))) + (productValue81 * float16_t(sampledTextureValue11.z))) + (productValue82 * float16_t(sampledTextureValue11.w))) + (productValue93 * float16_t(sampledTextureValue14.x))) + (productValue94 * float16_t(sampledTextureValue14.y))) * quotientValue4;
        intermediateValue3 = ((((((((((((productValue34 * float16_t(sampledTextureValue6.w)) + (productValue33 * float16_t(sampledTextureValue6.z))) + (productValue47 * float16_t(sampledTextureValue9.x))) + (productValue48 * float16_t(sampledTextureValue9.y))) + (productValue59 * float16_t(sampledTextureValue9.z))) + (productValue60 * float16_t(sampledTextureValue9.w))) + (productValue71 * float16_t(sampledTextureValue12.x))) + (productValue72 * float16_t(sampledTextureValue12.y))) + (productValue81 * float16_t(sampledTextureValue12.z))) + (productValue82 * float16_t(sampledTextureValue12.w))) + (productValue93 * float16_t(sampledTextureValue15.x))) + (productValue94 * float16_t(sampledTextureValue15.y))) * quotientValue4;
        intermediateValue4 = ((((((((((((productValue34 * float16_t(sampledTextureValue7.w)) + (productValue33 * float16_t(sampledTextureValue7.z))) + (productValue47 * float16_t(sampledTextureValue10.x))) + (productValue48 * float16_t(sampledTextureValue10.y))) + (productValue59 * float16_t(sampledTextureValue10.z))) + (productValue60 * float16_t(sampledTextureValue10.w))) + (productValue71 * float16_t(sampledTextureValue13.x))) + (productValue72 * float16_t(sampledTextureValue13.y))) + (productValue81 * float16_t(sampledTextureValue13.z))) + (productValue82 * float16_t(sampledTextureValue13.w))) + (productValue93 * float16_t(sampledTextureValue16.x))) + (productValue94 * float16_t(sampledTextureValue16.y))) * quotientValue4;
    }
    fragmentColor0.x = float(intermediateValue2);
    fragmentColor0.y = float(intermediateValue3);
    fragmentColor0.z = float(intermediateValue4);
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_HALF && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_RCAS)
    uint bitwiseValue = uint(float(uint(fragmentVectorConstants1.packedValues[1u].z * varyingTexCoord0.x))) << 16u;
    uint bitwiseValue1 = uint(int(bitwiseValue) >> int(16u));
    uint bitwiseValue2 = uint(float(uint(fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord0.y))) << 16u;
    vec4 sampledTextureValue18 = texelFetch(inputTexTexture, ivec2(uvec2(bitwiseValue1, uint(int(bitwiseValue2 + 4294901760u) >> int(16u)))), int(0u));
    float16_t scalarValue4 = float16_t(sampledTextureValue18.x);
    float16_t scalarValue5 = float16_t(sampledTextureValue18.y);
    float16_t scalarValue6 = float16_t(sampledTextureValue18.z);
    uint bitwiseValue3 = uint(int(bitwiseValue2) >> int(16u));
    vec4 sampledTextureValue19 = texelFetch(inputTexTexture, ivec2(uvec2(uint(int(bitwiseValue + 4294901760u) >> int(16u)), bitwiseValue3)), int(0u));
    float16_t scalarValue7 = float16_t(sampledTextureValue19.x);
    float16_t scalarValue8 = float16_t(sampledTextureValue19.y);
    float16_t scalarValue9 = float16_t(sampledTextureValue19.z);
    vec4 sampledTextureValue20 = texelFetch(inputTexTexture, ivec2(uvec2(bitwiseValue1, bitwiseValue3)), int(0u));
    float16_t scalarValue10 = float16_t(sampledTextureValue20.x);
    float16_t scalarValue11 = float16_t(sampledTextureValue20.y);
    float16_t scalarValue12 = float16_t(sampledTextureValue20.z);
    vec4 sampledTextureValue21 = texelFetch(inputTexTexture, ivec2(uvec2(uint(int(bitwiseValue + 65536u) >> int(16u)), bitwiseValue3)), int(0u));
    float16_t scalarValue13 = float16_t(sampledTextureValue21.x);
    float16_t scalarValue14 = float16_t(sampledTextureValue21.y);
    float16_t scalarValue15 = float16_t(sampledTextureValue21.z);
    vec4 sampledTextureValue22 = texelFetch(inputTexTexture, ivec2(uvec2(bitwiseValue1, uint(int(bitwiseValue2 + 65536u) >> int(16u)))), int(0u));
    float16_t scalarValue16 = float16_t(sampledTextureValue22.x);
    float16_t scalarValue17 = float16_t(sampledTextureValue22.y);
    float16_t scalarValue18 = float16_t(sampledTextureValue22.z);
    float16_t scalarValue19 = spvNMin(spvNMin(scalarValue4, spvNMin(scalarValue7, scalarValue13)), scalarValue16);
    float16_t scalarValue20 = spvNMin(spvNMin(scalarValue5, spvNMin(scalarValue8, scalarValue14)), scalarValue17);
    float16_t scalarValue21 = spvNMin(spvNMin(scalarValue6, spvNMin(scalarValue9, scalarValue15)), scalarValue18);
    float16_t scalarValue22 = spvNMax(spvNMax(scalarValue4, spvNMax(scalarValue7, scalarValue13)), scalarValue16);
    float16_t scalarValue23 = spvNMax(spvNMax(scalarValue5, spvNMax(scalarValue8, scalarValue14)), scalarValue17);
    float16_t scalarValue24 = spvNMax(spvNMax(scalarValue6, spvNMax(scalarValue9, scalarValue15)), scalarValue18);
    float16_t quotientValue5 = spvNMax(float16_t(-0.1875), spvNMin(spvNMax(spvNMax(float16_t(-0.0) - (spvNMin(scalarValue19, scalarValue10) * (float16_t(0.25) / scalarValue22)), (float16_t(1.0) - spvNMax(scalarValue22, scalarValue10)) * (float16_t(1.0) / ((scalarValue19 * float16_t(4.0)) + float16_t(-4.0)))), spvNMax(spvNMax(float16_t(-0.0) - (spvNMin(scalarValue20, scalarValue11) * (float16_t(0.25) / scalarValue23)), (float16_t(1.0) - spvNMax(scalarValue23, scalarValue11)) * (float16_t(1.0) / ((scalarValue20 * float16_t(4.0)) + float16_t(-4.0)))), spvNMax(float16_t(-0.0) - (spvNMin(scalarValue21, scalarValue12) * (float16_t(0.25) / scalarValue24)), (float16_t(1.0) - spvNMax(scalarValue24, scalarValue12)) * (float16_t(1.0) / ((scalarValue21 * float16_t(4.0)) + float16_t(-4.0)))))), float16_t(0.0))) * float16_t(fragmentVectorConstants1.packedValues[0u].x);
    float16_t productValue95 = (quotientValue5 * float16_t(4.0)) + float16_t(1.0);
    float16_t sumValue18 = uint16BitsToFloat16(30605us - float16BitsToUint16(productValue95));
    float16_t productValue96 = (float16_t(2.0) - (sumValue18 * productValue95)) * sumValue18;
    fragmentColor0.x = float(productValue96 * ((quotientValue5 * (((scalarValue7 + scalarValue4) + scalarValue13) + scalarValue16)) + scalarValue10));
    fragmentColor0.y = float(productValue96 * ((quotientValue5 * (((scalarValue8 + scalarValue5) + scalarValue14) + scalarValue17)) + scalarValue11));
    fragmentColor0.z = float(productValue96 * ((quotientValue5 * (((scalarValue9 + scalarValue6) + scalarValue15) + scalarValue18)) + scalarValue12));
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_HALF && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_BILINEAR)
    vec4 sampledTextureValue17 = textureLod(sampler2D(inputTexTexture, inputTexSampler), vec2((((float(uint(fragmentVectorConstants1.packedValues[2u].z * varyingTexCoord0.x)) * fragmentVectorConstants1.packedValues[0u].x) + fragmentVectorConstants1.packedValues[0u].z) * fragmentVectorConstants1.packedValues[1u].x) + (fragmentVectorConstants1.packedValues[1u].z * 0.5), (((float(uint(fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord0.y)) * fragmentVectorConstants1.packedValues[0u].y) + fragmentVectorConstants1.packedValues[0u].w) * fragmentVectorConstants1.packedValues[1u].y) - (fragmentVectorConstants1.packedValues[1u].w * 0.5)), 0.0);
    fragmentColor0.x = float(float16_t(sampledTextureValue17.x));
    fragmentColor0.y = float(float16_t(sampledTextureValue17.y));
    fragmentColor0.z = float(float16_t(sampledTextureValue17.z));
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_FULL && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_EASU)
    float productValue97 = (float(uint(float(uint(fragmentVectorConstants1.packedValues[4u].z * varyingTexCoord0.x)))) * fragmentVectorConstants1.packedValues[0u].x) + fragmentVectorConstants1.packedValues[0u].z;
    float productValue98 = (float(uint(float(uint(fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord0.y)))) * fragmentVectorConstants1.packedValues[0u].y) + fragmentVectorConstants1.packedValues[0u].w;
    float scalarValue25 = floor(productValue97);
    float scalarValue26 = floor(productValue98);
    float sumValue19 = productValue97 - scalarValue25;
    float sumValue20 = productValue98 - scalarValue26;
    float productValue99 = (scalarValue25 * fragmentVectorConstants1.packedValues[1u].x) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue100 = (scalarValue26 * fragmentVectorConstants1.packedValues[1u].y) + fragmentVectorConstants1.packedValues[1u].w;
    float sumValue21 = productValue99 + fragmentVectorConstants1.packedValues[2u].x;
    float sumValue22 = productValue100 + fragmentVectorConstants1.packedValues[2u].y;
    float sumValue23 = productValue99 + fragmentVectorConstants1.packedValues[2u].z;
    float sumValue24 = productValue100 + fragmentVectorConstants1.packedValues[2u].w;
    float sumValue25 = productValue99 + fragmentVectorConstants1.packedValues[3u].x;
    float sumValue26 = productValue100 + fragmentVectorConstants1.packedValues[3u].y;
    vec4 sampledTextureValue23 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(productValue99, productValue100));
    float scalarValue27 = sampledTextureValue23.x;
    float scalarValue28 = sampledTextureValue23.y;
    vec4 sampledTextureValue24 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(productValue99, productValue100), int(1u));
    float scalarValue29 = sampledTextureValue24.x;
    float scalarValue30 = sampledTextureValue24.y;
    vec4 sampledTextureValue25 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(productValue99, productValue100), int(2u));
    float scalarValue31 = sampledTextureValue25.x;
    float scalarValue32 = sampledTextureValue25.y;
    vec4 sampledTextureValue26 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue21, sumValue22));
    float scalarValue33 = sampledTextureValue26.x;
    float scalarValue34 = sampledTextureValue26.y;
    float scalarValue35 = sampledTextureValue26.z;
    float scalarValue36 = sampledTextureValue26.w;
    vec4 sampledTextureValue27 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue21, sumValue22), int(1u));
    float scalarValue37 = sampledTextureValue27.x;
    float scalarValue38 = sampledTextureValue27.y;
    float scalarValue39 = sampledTextureValue27.z;
    float scalarValue40 = sampledTextureValue27.w;
    vec4 sampledTextureValue28 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue21, sumValue22), int(2u));
    float scalarValue41 = sampledTextureValue28.x;
    float scalarValue42 = sampledTextureValue28.y;
    float scalarValue43 = sampledTextureValue28.z;
    float scalarValue44 = sampledTextureValue28.w;
    vec4 sampledTextureValue29 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue23, sumValue24));
    float scalarValue45 = sampledTextureValue29.x;
    float scalarValue46 = sampledTextureValue29.y;
    float scalarValue47 = sampledTextureValue29.z;
    float scalarValue48 = sampledTextureValue29.w;
    vec4 sampledTextureValue30 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue23, sumValue24), int(1u));
    float scalarValue49 = sampledTextureValue30.x;
    float scalarValue50 = sampledTextureValue30.y;
    float scalarValue51 = sampledTextureValue30.z;
    float scalarValue52 = sampledTextureValue30.w;
    vec4 sampledTextureValue31 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue23, sumValue24), int(2u));
    float scalarValue53 = sampledTextureValue31.x;
    float scalarValue54 = sampledTextureValue31.y;
    float scalarValue55 = sampledTextureValue31.z;
    float scalarValue56 = sampledTextureValue31.w;
    vec4 sampledTextureValue32 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue25, sumValue26));
    float scalarValue57 = sampledTextureValue32.z;
    float scalarValue58 = sampledTextureValue32.w;
    vec4 sampledTextureValue33 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue25, sumValue26), int(1u));
    float scalarValue59 = sampledTextureValue33.z;
    float scalarValue60 = sampledTextureValue33.w;
    vec4 sampledTextureValue34 = textureGather(sampler2D(inputTexTexture, inputTexSampler), vec2(sumValue25, sumValue26), int(2u));
    float scalarValue61 = sampledTextureValue34.z;
    float scalarValue62 = sampledTextureValue34.w;
    float productValue101 = ((scalarValue31 + scalarValue27) * 0.5) + scalarValue29;
    float productValue102 = ((scalarValue32 + scalarValue28) * 0.5) + scalarValue30;
    float productValue103 = ((scalarValue41 + scalarValue33) * 0.5) + scalarValue37;
    float productValue104 = ((scalarValue42 + scalarValue34) * 0.5) + scalarValue38;
    float productValue105 = ((scalarValue43 + scalarValue35) * 0.5) + scalarValue39;
    float productValue106 = ((scalarValue44 + scalarValue36) * 0.5) + scalarValue40;
    float productValue107 = ((scalarValue53 + scalarValue45) * 0.5) + scalarValue49;
    float productValue108 = ((scalarValue54 + scalarValue46) * 0.5) + scalarValue50;
    float productValue109 = ((scalarValue55 + scalarValue47) * 0.5) + scalarValue51;
    float productValue110 = ((scalarValue56 + scalarValue48) * 0.5) + scalarValue52;
    float productValue111 = ((scalarValue61 + scalarValue57) * 0.5) + scalarValue59;
    float productValue112 = ((scalarValue62 + scalarValue58) * 0.5) + scalarValue60;
    float sumValue27 = 1.0 - sumValue19;
    float sumValue28 = 1.0 - sumValue20;
    float productValue113 = sumValue27 * sumValue28;
    float sumValue29 = abs(productValue110 - productValue105);
    float sumValue30 = productValue110 - productValue106;
    float reinterpretedBits2 = spvNClamp(uintBitsToFloat(2129690299u - floatBitsToUint(spvNMax(sumValue29, abs(productValue105 - productValue106)))) * abs(sumValue30), 0.0, 1.0);
    float sumValue31 = abs(productValue104 - productValue105);
    float sumValue32 = productValue104 - productValue101;
    float reinterpretedBits3 = spvNClamp(uintBitsToFloat(2129690299u - floatBitsToUint(spvNMax(sumValue31, abs(productValue105 - productValue101)))) * abs(sumValue32), 0.0, 1.0);
    float productValue114 = sumValue28 * sumValue19;
    float sumValue33 = productValue109 - productValue105;
    float reinterpretedBits4 = spvNClamp(uintBitsToFloat(2129690299u - floatBitsToUint(spvNMax(abs(productValue109 - productValue110), sumValue29))) * abs(sumValue33), 0.0, 1.0);
    float sumValue34 = abs(productValue107 - productValue110);
    float sumValue35 = productValue107 - productValue102;
    float reinterpretedBits5 = spvNClamp(uintBitsToFloat(2129690299u - floatBitsToUint(spvNMax(sumValue34, abs(productValue110 - productValue102)))) * abs(sumValue35), 0.0, 1.0);
    float productValue115 = sumValue27 * sumValue20;
    float sumValue36 = abs(productValue107 - productValue104);
    float sumValue37 = productValue107 - productValue103;
    float reinterpretedBits6 = spvNClamp(uintBitsToFloat(2129690299u - floatBitsToUint(spvNMax(sumValue36, abs(productValue104 - productValue103)))) * abs(sumValue37), 0.0, 1.0);
    float sumValue38 = productValue112 - productValue105;
    float reinterpretedBits7 = spvNClamp(uintBitsToFloat(2129690299u - floatBitsToUint(spvNMax(abs(productValue112 - productValue104), sumValue31))) * abs(sumValue38), 0.0, 1.0);
    float productValue116 = sumValue19 * sumValue20;
    float sumValue39 = productValue108 - productValue104;
    float productValue117 = (((sumValue30 * productValue113) + (sumValue33 * productValue114)) + (sumValue37 * productValue115)) + (sumValue39 * productValue116);
    float reinterpretedBits8 = spvNClamp(uintBitsToFloat(2129690299u - floatBitsToUint(spvNMax(abs(productValue108 - productValue107), sumValue36))) * abs(sumValue39), 0.0, 1.0);
    float sumValue40 = productValue111 - productValue110;
    float productValue118 = (((sumValue35 * productValue114) + (sumValue32 * productValue113)) + (sumValue38 * productValue115)) + (sumValue40 * productValue116);
    float reinterpretedBits9 = spvNClamp(uintBitsToFloat(2129690299u - floatBitsToUint(spvNMax(abs(productValue111 - productValue107), sumValue34))) * abs(sumValue40), 0.0, 1.0);
    float productValue119 = (productValue118 * productValue118) + (productValue117 * productValue117);
    bool conditionValue = productValue119 < 3.0517578125e-05;
    float reinterpretedBits10 = conditionValue ? 1.0 : uintBitsToFloat(1597275508u - (floatBitsToUint(productValue119) >> 1u));
    float comparisonValue1 = reinterpretedBits10 * (conditionValue ? 1.0 : productValue117);
    float productValue120 = reinterpretedBits10 * productValue118;
    float productValue121 = ((((((reinterpretedBits5 * reinterpretedBits5) + (reinterpretedBits4 * reinterpretedBits4)) * productValue114) + (((reinterpretedBits3 * reinterpretedBits3) + (reinterpretedBits2 * reinterpretedBits2)) * productValue113)) + (((reinterpretedBits7 * reinterpretedBits7) + (reinterpretedBits6 * reinterpretedBits6)) * productValue115)) + (((reinterpretedBits9 * reinterpretedBits9) + (reinterpretedBits8 * reinterpretedBits8)) * productValue116)) * 0.5;
    float productValue122 = productValue121 * productValue121;
    float reinterpretedBits11 = (((uintBitsToFloat(2129690299u - floatBitsToUint(spvNMax(abs(comparisonValue1), abs(productValue120)))) * ((comparisonValue1 * comparisonValue1) + (productValue120 * productValue120))) + (-1.0)) * productValue122) + 1.0;
    float productValue123 = 1.0 - (productValue122 * 0.5);
    float productValue124 = 0.5 - (productValue122 * 0.2899999916553497314453125);
    float reinterpretedBits12 = uintBitsToFloat(2129690299u - floatBitsToUint(productValue124));
    float sumValue41 = (-1.0) - sumValue20;
    float productValue125 = comparisonValue1 * sumValue19;
    float productValue126 = productValue120 * sumValue41;
    float productValue127 = productValue120 * sumValue19;
    float productValue128 = comparisonValue1 * sumValue41;
    float productValue129 = reinterpretedBits11 * (productValue126 - productValue125);
    float productValue130 = productValue123 * (productValue127 + productValue128);
    float productValue131 = spvNMin((productValue129 * productValue129) + (productValue130 * productValue130), reinterpretedBits12);
    float productValue132 = (productValue131 * productValue124) + (-1.0);
    float productValue133 = (productValue132 * productValue132) * ((((productValue131 * 0.625) + (-1.5625)) * ((productValue131 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float productValue134 = comparisonValue1 * sumValue27;
    float productValue135 = productValue120 * sumValue27;
    float productValue136 = reinterpretedBits11 * (productValue134 + productValue126);
    float productValue137 = productValue123 * (productValue128 - productValue135);
    float productValue138 = spvNMin((productValue136 * productValue136) + (productValue137 * productValue137), reinterpretedBits12);
    float productValue139 = (productValue138 * productValue124) + (-1.0);
    float productValue140 = (productValue139 * productValue139) * ((((productValue138 * 0.625) + (-1.5625)) * ((productValue138 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float sumValue42 = (-1.0) - sumValue19;
    float productValue141 = comparisonValue1 * sumValue42;
    float productValue142 = productValue120 * sumValue28;
    float productValue143 = productValue120 * sumValue42;
    float productValue144 = comparisonValue1 * sumValue28;
    float productValue145 = reinterpretedBits11 * (productValue141 + productValue142);
    float productValue146 = productValue123 * (productValue144 - productValue143);
    float productValue147 = spvNMin((productValue145 * productValue145) + (productValue146 * productValue146), reinterpretedBits12);
    float productValue148 = (productValue147 * productValue124) + (-1.0);
    float productValue149 = (productValue148 * productValue148) * ((((productValue147 * 0.625) + (-1.5625)) * ((productValue147 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float productValue150 = reinterpretedBits11 * (productValue142 - productValue125);
    float productValue151 = productValue123 * (productValue127 + productValue144);
    float productValue152 = spvNMin((productValue150 * productValue150) + (productValue151 * productValue151), reinterpretedBits12);
    float productValue153 = (productValue152 * productValue124) + (-1.0);
    float productValue154 = (productValue153 * productValue153) * ((((productValue152 * 0.625) + (-1.5625)) * ((productValue152 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float sumValue43 = (-0.0) - sumValue20;
    float productValue155 = productValue120 * sumValue43;
    float productValue156 = comparisonValue1 * sumValue43;
    float productValue157 = reinterpretedBits11 * (productValue155 - productValue125);
    float productValue158 = productValue123 * (productValue127 + productValue156);
    float productValue159 = spvNMin((productValue157 * productValue157) + (productValue158 * productValue158), reinterpretedBits12);
    float productValue160 = (productValue159 * productValue124) + (-1.0);
    float productValue161 = (productValue160 * productValue160) * ((((productValue159 * 0.625) + (-1.5625)) * ((productValue159 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float productValue162 = reinterpretedBits11 * (productValue141 + productValue155);
    float productValue163 = productValue123 * (productValue156 - productValue143);
    float productValue164 = spvNMin((productValue162 * productValue162) + (productValue163 * productValue163), reinterpretedBits12);
    float productValue165 = (productValue164 * productValue124) + (-1.0);
    float productValue166 = (productValue165 * productValue165) * ((((productValue164 * 0.625) + (-1.5625)) * ((productValue164 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float productValue167 = reinterpretedBits11 * (productValue134 + productValue142);
    float productValue168 = productValue123 * (productValue144 - productValue135);
    float productValue169 = spvNMin((productValue167 * productValue167) + (productValue168 * productValue168), reinterpretedBits12);
    float productValue170 = (productValue169 * productValue124) + (-1.0);
    float productValue171 = (productValue170 * productValue170) * ((((productValue169 * 0.625) + (-1.5625)) * ((productValue169 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float sumValue44 = 2.0 - sumValue19;
    float productValue172 = comparisonValue1 * sumValue44;
    float productValue173 = productValue120 * sumValue44;
    float productValue174 = reinterpretedBits11 * (productValue172 + productValue142);
    float productValue175 = productValue123 * (productValue144 - productValue173);
    float productValue176 = spvNMin((productValue174 * productValue174) + (productValue175 * productValue175), reinterpretedBits12);
    float productValue177 = (productValue176 * productValue124) + (-1.0);
    float productValue178 = (productValue177 * productValue177) * ((((productValue176 * 0.625) + (-1.5625)) * ((productValue176 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float productValue179 = reinterpretedBits11 * (productValue172 + productValue155);
    float productValue180 = productValue123 * (productValue156 - productValue173);
    float productValue181 = spvNMin((productValue179 * productValue179) + (productValue180 * productValue180), reinterpretedBits12);
    float productValue182 = (productValue181 * productValue124) + (-1.0);
    float productValue183 = (productValue182 * productValue182) * ((((productValue181 * 0.625) + (-1.5625)) * ((productValue181 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float productValue184 = reinterpretedBits11 * (productValue134 + productValue155);
    float productValue185 = productValue123 * (productValue156 - productValue135);
    float productValue186 = spvNMin((productValue184 * productValue184) + (productValue185 * productValue185), reinterpretedBits12);
    float productValue187 = (productValue186 * productValue124) + (-1.0);
    float productValue188 = (productValue187 * productValue187) * ((((productValue186 * 0.625) + (-1.5625)) * ((productValue186 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float sumValue45 = 2.0 - sumValue20;
    float productValue189 = productValue120 * sumValue45;
    float productValue190 = comparisonValue1 * sumValue45;
    float productValue191 = reinterpretedBits11 * (productValue134 + productValue189);
    float productValue192 = productValue123 * (productValue190 - productValue135);
    float productValue193 = spvNMin((productValue191 * productValue191) + (productValue192 * productValue192), reinterpretedBits12);
    float productValue194 = (productValue193 * productValue124) + (-1.0);
    float productValue195 = (productValue194 * productValue194) * ((((productValue193 * 0.625) + (-1.5625)) * ((productValue193 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float productValue196 = reinterpretedBits11 * (productValue189 - productValue125);
    float productValue197 = productValue123 * (productValue127 + productValue190);
    float productValue198 = spvNMin((productValue196 * productValue196) + (productValue197 * productValue197), reinterpretedBits12);
    float productValue199 = (productValue198 * productValue124) + (-1.0);
    float productValue200 = (productValue199 * productValue199) * ((((productValue198 * 0.625) + (-1.5625)) * ((productValue198 * 0.4000000059604644775390625) + (-1.0))) + (-0.5625));
    float quotientValue6 = 1.0 / (((((((((((productValue140 + productValue133) + productValue149) + productValue154) + productValue161) + productValue166) + productValue171) + productValue178) + productValue183) + productValue188) + productValue195) + productValue200);
    fragmentColor0.x = spvNMin(spvNMax(spvNMax(scalarValue35, spvNMax(scalarValue48, scalarValue34)), scalarValue45), spvNMax(spvNMin(spvNMin(scalarValue35, spvNMin(scalarValue48, scalarValue34)), scalarValue45), ((((((((((((productValue140 * scalarValue28) + (productValue133 * scalarValue27)) + (productValue149 * scalarValue33)) + (productValue154 * scalarValue34)) + (productValue161 * scalarValue35)) + (productValue166 * scalarValue36)) + (productValue171 * scalarValue45)) + (productValue178 * scalarValue46)) + (productValue183 * scalarValue47)) + (productValue188 * scalarValue48)) + (productValue195 * scalarValue57)) + (productValue200 * scalarValue58)) * quotientValue6));
    fragmentColor0.y = spvNMin(spvNMax(spvNMax(scalarValue39, spvNMax(scalarValue52, scalarValue38)), scalarValue49), spvNMax(spvNMin(spvNMin(scalarValue39, spvNMin(scalarValue52, scalarValue38)), scalarValue49), ((((((((((((productValue140 * scalarValue30) + (productValue133 * scalarValue29)) + (productValue149 * scalarValue37)) + (productValue154 * scalarValue38)) + (productValue161 * scalarValue39)) + (productValue166 * scalarValue40)) + (productValue171 * scalarValue49)) + (productValue178 * scalarValue50)) + (productValue183 * scalarValue51)) + (productValue188 * scalarValue52)) + (productValue195 * scalarValue59)) + (productValue200 * scalarValue60)) * quotientValue6));
    fragmentColor0.z = spvNMin(spvNMax(spvNMax(scalarValue43, spvNMax(scalarValue56, scalarValue42)), scalarValue53), spvNMax(spvNMin(spvNMin(scalarValue43, spvNMin(scalarValue56, scalarValue42)), scalarValue53), ((((((((((((productValue140 * scalarValue32) + (productValue133 * scalarValue31)) + (productValue149 * scalarValue41)) + (productValue154 * scalarValue42)) + (productValue161 * scalarValue43)) + (productValue166 * scalarValue44)) + (productValue171 * scalarValue53)) + (productValue178 * scalarValue54)) + (productValue183 * scalarValue55)) + (productValue188 * scalarValue56)) + (productValue195 * scalarValue61)) + (productValue200 * scalarValue62)) * quotientValue6));
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_FULL && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_RCAS)
    uint productValue201 = uint(float(uint(fragmentVectorConstants1.packedValues[1u].z * varyingTexCoord0.x)));
    uint productValue202 = uint(float(uint(fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord0.y)));
    vec4 sampledTextureValue35 = texelFetch(inputTexTexture, ivec2(uvec2(productValue201, productValue202 + 4294967295u)), int(0u));
    float scalarValue63 = sampledTextureValue35.x;
    float scalarValue64 = sampledTextureValue35.y;
    float scalarValue65 = sampledTextureValue35.z;
    vec4 sampledTextureValue36 = texelFetch(inputTexTexture, ivec2(uvec2(productValue201 + 4294967295u, productValue202)), int(0u));
    float scalarValue66 = sampledTextureValue36.x;
    float scalarValue67 = sampledTextureValue36.y;
    float scalarValue68 = sampledTextureValue36.z;
    vec4 sampledTextureValue37 = texelFetch(inputTexTexture, ivec2(uvec2(productValue201, productValue202)), int(0u));
    float scalarValue69 = sampledTextureValue37.x;
    float scalarValue70 = sampledTextureValue37.y;
    float scalarValue71 = sampledTextureValue37.z;
    vec4 sampledTextureValue38 = texelFetch(inputTexTexture, ivec2(uvec2(productValue201 + 1u, productValue202)), int(0u));
    float scalarValue72 = sampledTextureValue38.x;
    float scalarValue73 = sampledTextureValue38.y;
    float scalarValue74 = sampledTextureValue38.z;
    vec4 sampledTextureValue39 = texelFetch(inputTexTexture, ivec2(uvec2(productValue201, productValue202 + 1u)), int(0u));
    float scalarValue75 = sampledTextureValue39.x;
    float scalarValue76 = sampledTextureValue39.y;
    float scalarValue77 = sampledTextureValue39.z;
    float scalarValue78 = spvNMin(spvNMin(scalarValue63, spvNMin(scalarValue66, scalarValue72)), scalarValue75);
    float scalarValue79 = spvNMin(spvNMin(scalarValue64, spvNMin(scalarValue67, scalarValue73)), scalarValue76);
    float scalarValue80 = spvNMin(spvNMin(scalarValue65, spvNMin(scalarValue68, scalarValue74)), scalarValue77);
    float scalarValue81 = spvNMax(spvNMax(scalarValue63, spvNMax(scalarValue66, scalarValue72)), scalarValue75);
    float scalarValue82 = spvNMax(spvNMax(scalarValue64, spvNMax(scalarValue67, scalarValue73)), scalarValue76);
    float scalarValue83 = spvNMax(spvNMax(scalarValue65, spvNMax(scalarValue68, scalarValue74)), scalarValue77);
    float quotientValue7 = spvNMax(-0.1875, spvNMin(spvNMax(spvNMax((-0.0) - (spvNMin(scalarValue78, scalarValue69) * (0.25 / scalarValue81)), (1.0 - spvNMax(scalarValue81, scalarValue69)) * (1.0 / ((scalarValue78 * 4.0) + (-4.0)))), spvNMax(spvNMax((-0.0) - (spvNMin(scalarValue79, scalarValue70) * (0.25 / scalarValue82)), (1.0 - spvNMax(scalarValue82, scalarValue70)) * (1.0 / ((scalarValue79 * 4.0) + (-4.0)))), spvNMax((-0.0) - (spvNMin(scalarValue80, scalarValue71) * (0.25 / scalarValue83)), (1.0 - spvNMax(scalarValue83, scalarValue71)) * (1.0 / ((scalarValue80 * 4.0) + (-4.0)))))), 0.0)) * fragmentVectorConstants1.packedValues[0u].x;
    float productValue203 = (quotientValue7 * 4.0) + 1.0;
    float reinterpretedBits13 = uintBitsToFloat(2129764351u - floatBitsToUint(productValue203));
    float productValue204 = (2.0 - (reinterpretedBits13 * productValue203)) * reinterpretedBits13;
    fragmentColor0.x = productValue204 * ((quotientValue7 * (((scalarValue66 + scalarValue63) + scalarValue72) + scalarValue75)) + scalarValue69);
    fragmentColor0.y = productValue204 * ((quotientValue7 * (((scalarValue67 + scalarValue64) + scalarValue73) + scalarValue76)) + scalarValue70);
    fragmentColor0.z = productValue204 * ((quotientValue7 * (((scalarValue68 + scalarValue65) + scalarValue74) + scalarValue77)) + scalarValue71);
#elif (RD_OPTION_FFXPRECISION == RD_FFXPRECISION_FULL && RD_OPTION_FSRFILTER_MODE == RD_FSRFILTER_MODE_BILINEAR)
    vec4 sampledTextureValue17 = textureLod(sampler2D(inputTexTexture, inputTexSampler), vec2((((float(uint(fragmentVectorConstants1.packedValues[2u].z * varyingTexCoord0.x)) * fragmentVectorConstants1.packedValues[0u].x) + fragmentVectorConstants1.packedValues[0u].z) * fragmentVectorConstants1.packedValues[1u].x) + (fragmentVectorConstants1.packedValues[1u].z * 0.5), (((float(uint(fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord0.y)) * fragmentVectorConstants1.packedValues[0u].y) + fragmentVectorConstants1.packedValues[0u].w) * fragmentVectorConstants1.packedValues[1u].y) - (fragmentVectorConstants1.packedValues[1u].w * 0.5)), 0.0);
    fragmentColor0.x = sampledTextureValue17.x;
    fragmentColor0.y = sampledTextureValue17.y;
    fragmentColor0.z = sampledTextureValue17.z;
#endif
    fragmentColor0.w = 1.0;
}
