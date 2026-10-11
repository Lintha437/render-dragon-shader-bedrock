#version 460
#extension GL_GOOGLE_include_directive : require
// ActorBanner / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_OPTION_EMISSIVE
#define RD_OPTION_EMISSIVE RD_EMISSIVE_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MASKED_MULTITEXTURE
#define RD_FEATURE_MASKED_MULTITEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 7
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/ActorBanner/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue = varyingColor1.x / varyingColor1.w;
    precise float quotientValue1 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue = fma(quotientValue, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue1 = fma(quotientValue1, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    precise float quotientValue2 = multiplyAddValue / reinterpretedBits1;
    precise float quotientValue3 = multiplyAddValue1 / reinterpretedBits1;
    precise float productValue = floor(quotientValue2) * reinterpretedBits1;
    precise float productValue1 = floor(quotientValue3) * reinterpretedBits1;
    precise float productValue2 = productValue * 0.25;
    precise float productValue3 = productValue1 * 0.25;
    precise float productValue4 = productValue * 0.5;
    precise float productValue5 = productValue1 * 0.5;
    float scalarValue = floor(productValue1);
    float scalarValue1 = floor(productValue3);
    float scalarValue2 = floor(productValue5);
    precise float productValue6 = scalarValue1 * scalarValue1;
    precise float productValue7 = scalarValue2 * scalarValue2;
    precise float productValue8 = productValue6 * 0.75;
    precise float productValue9 = productValue7 * 0.75;
    precise float productValue10 = scalarValue * scalarValue;
    precise float productValue11 = productValue10 * 0.75;
    precise float multiplyAddValue2 = fma(fma(fma(fract(fma(floor(productValue2), 0.5, productValue8)), 0.25, fract(fma(floor(productValue4), 0.5, productValue9))), 0.25, fract(fma(floor(productValue), 0.5, productValue11))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue12 = inverseLengthValue * reinterpretedBits2;
    precise float productValue13 = inverseLengthValue * reinterpretedBits3;
    precise float productValue14 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits6 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits7 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits8 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    precise float sumValue = rdDot3Precise2(vec3(-productValue12, -productValue13, -productValue14), vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8)) - reinterpretedBits9;
    precise float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits9;
    precise float quotientValue4 = 1.0 / reinterpretedBits10;
    precise float productValue15 = quotientValue4 * sumValue;
    float scalarValue3 = spvNClamp(productValue15, 0.0, 1.0);
    precise float productValue16 = scalarValue3 * scalarValue3;
    precise float multiplyAddValue3 = productValue16 * fma(scalarValue3, -2.0, 3.0);
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.x, varyingTexCoord2.y));
    float scalarValue4 = sampledTextureValue.x;
    float scalarValue5 = sampledTextureValue.w;
    precise float productValue17 = scalarValue5 * scalarValue4;
    precise float multiplyAddValue4 = fma(varyingColor0.w, fma(-scalarValue4, scalarValue5, scalarValue5), productValue17) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
    fragmentColor0.w = ((multiplyAddValue2 >= multiplyAddValue3) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : multiplyAddValue4;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    precise float productValue18 = sampledTextureValue1.x * varyingColor0.x;
    precise float productValue19 = sampledTextureValue1.y * varyingColor0.y;
    precise float productValue20 = sampledTextureValue1.z * varyingColor0.z;
    precise float productValue21 = productValue18 * varyingColor3.x;
    precise float productValue22 = productValue19 * varyingColor3.y;
    precise float productValue23 = productValue20 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-productValue18, varyingColor3.x, varyingColor2.x), productValue21);
    fragmentColor0.y = fma(varyingColor2.w, fma(-productValue19, varyingColor3.y, varyingColor2.y), productValue22);
    fragmentColor0.z = fma(varyingColor2.w, fma(-productValue20, varyingColor3.z, varyingColor2.z), productValue23);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue = varyingColor1.x / varyingColor1.w;
    precise float quotientValue1 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue = fma(quotientValue, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue1 = fma(quotientValue1, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    precise float quotientValue2 = multiplyAddValue / reinterpretedBits1;
    precise float quotientValue3 = multiplyAddValue1 / reinterpretedBits1;
    precise float productValue = floor(quotientValue2) * reinterpretedBits1;
    precise float productValue1 = floor(quotientValue3) * reinterpretedBits1;
    precise float productValue2 = productValue * 0.25;
    precise float productValue3 = productValue1 * 0.25;
    precise float productValue4 = productValue * 0.5;
    precise float productValue5 = productValue1 * 0.5;
    float scalarValue = floor(productValue1);
    float scalarValue1 = floor(productValue3);
    float scalarValue2 = floor(productValue5);
    precise float productValue6 = scalarValue1 * scalarValue1;
    precise float productValue7 = scalarValue2 * scalarValue2;
    precise float productValue8 = productValue6 * 0.75;
    precise float productValue9 = productValue7 * 0.75;
    precise float productValue10 = scalarValue * scalarValue;
    precise float productValue11 = productValue10 * 0.75;
    precise float multiplyAddValue2 = fma(fma(fma(fract(fma(floor(productValue2), 0.5, productValue8)), 0.25, fract(fma(floor(productValue4), 0.5, productValue9))), 0.25, fract(fma(floor(productValue), 0.5, productValue11))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue12 = inverseLengthValue * reinterpretedBits2;
    precise float productValue13 = inverseLengthValue * reinterpretedBits3;
    precise float productValue14 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits6 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits7 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits8 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    precise float sumValue = rdDot3Precise2(vec3(-productValue12, -productValue13, -productValue14), vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8)) - reinterpretedBits9;
    precise float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits9;
    precise float quotientValue4 = 1.0 / reinterpretedBits10;
    precise float productValue15 = quotientValue4 * sumValue;
    float scalarValue3 = spvNClamp(productValue15, 0.0, 1.0);
    precise float productValue16 = scalarValue3 * scalarValue3;
    precise float multiplyAddValue3 = productValue16 * fma(scalarValue3, -2.0, 3.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    precise float reinterpretedBits12 = sampledTextureValue1.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
    fragmentColor0.w = ((multiplyAddValue2 >= multiplyAddValue3) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : reinterpretedBits12;
    precise float productValue29 = scalarValue7 * varyingColor3.x;
    precise float productValue30 = scalarValue8 * varyingColor3.y;
    precise float productValue31 = scalarValue9 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue7, varyingColor3.x, varyingColor2.x), productValue29);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue8, varyingColor3.y, varyingColor2.y), productValue30);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue9, varyingColor3.z, varyingColor2.z), productValue31);
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    float multiplyAddValue5 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue6 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue6 = floor(multiplyAddValue6);
    float productValue24 = floor(multiplyAddValue6 * 0.25);
    float productValue25 = floor(multiplyAddValue6 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    float reinterpretedBits11 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits9)) * (rdDot3Precise2(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits9), 0.0, 1.0);
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.x, varyingTexCoord2.y));
    float scalarValue4 = sampledTextureValue.x;
    float scalarValue5 = sampledTextureValue.w;
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue5 * 0.25), 0.5, (productValue24 * productValue24) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue5 * 0.5), 0.5, (productValue25 * productValue25) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue5), 0.5, (scalarValue6 * scalarValue6) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits11 * reinterpretedBits11) * fma(reinterpretedBits11, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : (fma(varyingColor0.w, fma(-scalarValue4, scalarValue5, scalarValue5), scalarValue5 * scalarValue4) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    float productValue26 = sampledTextureValue1.x * varyingColor0.x;
    float productValue27 = sampledTextureValue1.y * varyingColor0.y;
    float productValue28 = sampledTextureValue1.z * varyingColor0.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-productValue26, varyingColor3.x, varyingColor2.x), productValue26 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-productValue27, varyingColor3.y, varyingColor2.y), productValue27 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-productValue28, varyingColor3.z, varyingColor2.z), productValue28 * varyingColor3.z);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[34u]));
    float multiplyAddValue5 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue6 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue6 = floor(multiplyAddValue6);
    float productValue24 = floor(multiplyAddValue6 * 0.25);
    float productValue25 = floor(multiplyAddValue6 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]));
    float reinterpretedBits11 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[33u])) - reinterpretedBits9)) * (rdDot3Precise2(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits9), 0.0, 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue5 * 0.25), 0.5, (productValue24 * productValue24) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue5 * 0.5), 0.5, (productValue25 * productValue25) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue5), 0.5, (scalarValue6 * scalarValue6) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits11 * reinterpretedBits11) * fma(reinterpretedBits11, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) != 0.0)) ? 0.0 : (sampledTextureValue1.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])));
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue7, varyingColor3.x, varyingColor2.x), scalarValue7 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue8, varyingColor3.y, varyingColor2.y), scalarValue8 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue9, varyingColor3.z, varyingColor2.z), scalarValue9 * varyingColor3.z);
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord2.x, varyingTexCoord2.y));
    float scalarValue10 = sampledTextureValue3.w;
    float productValue32 = sampledTextureValue3.x * scalarValue10;
    float productValue33 = ((scalarValue10 - productValue32) * varyingColor0.w) + productValue32;
    float comparisonValue;
    if (fragmentVectorConstants1.packedValues[12u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[8u].x) / (fragmentVectorConstants1.packedValues[8u].y - fragmentVectorConstants1.packedValues[8u].x), 0.0, 1.0);
        float quotientValue5 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[11u].x) / fragmentVectorConstants1.packedValues[8u].z) * fragmentVectorConstants1.packedValues[8u].z;
        float quotientValue6 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[11u].y) / fragmentVectorConstants1.packedValues[8u].z) * fragmentVectorConstants1.packedValues[8u].z;
        float productValue34 = floor(quotientValue6 * 0.25);
        float productValue35 = floor(quotientValue6 * 0.5);
        float scalarValue11 = floor(quotientValue6);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue35 * productValue35) * 0.75) + (floor(quotientValue5 * 0.5) * 0.5)) + (fract(((productValue34 * productValue34) * 0.75) + (floor(quotientValue5 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue11 * scalarValue11) * 0.75) + (floor(quotientValue5) * 0.5)))) ? 0.0 : productValue33;
    }
    else
    {
        comparisonValue = productValue33;
    }
    float productValue36 = (varyingColor0.x * varyingColor3.x) * sampledTextureValue2.x;
    float productValue37 = (varyingColor0.y * varyingColor3.y) * sampledTextureValue2.y;
    float productValue38 = (varyingColor0.z * varyingColor3.z) * sampledTextureValue2.z;
    fragmentColor0.x = ((varyingColor2.x - productValue36) * varyingColor2.w) + productValue36;
    fragmentColor0.y = ((varyingColor2.y - productValue37) * varyingColor2.w) + productValue37;
    fragmentColor0.z = ((varyingColor2.z - productValue38) * varyingColor2.w) + productValue38;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[13u].x * comparisonValue;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    float scalarValue12 = sampledTextureValue2.w;
    float comparisonValue;
    if (fragmentVectorConstants1.packedValues[12u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[8u].x) / (fragmentVectorConstants1.packedValues[8u].y - fragmentVectorConstants1.packedValues[8u].x), 0.0, 1.0);
        float quotientValue5 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[11u].x) / fragmentVectorConstants1.packedValues[8u].z) * fragmentVectorConstants1.packedValues[8u].z;
        float quotientValue6 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[11u].y) / fragmentVectorConstants1.packedValues[8u].z) * fragmentVectorConstants1.packedValues[8u].z;
        float productValue34 = floor(quotientValue6 * 0.25);
        float productValue35 = floor(quotientValue6 * 0.5);
        float scalarValue11 = floor(quotientValue6);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue35 * productValue35) * 0.75) + (floor(quotientValue5 * 0.5) * 0.5)) + (fract(((productValue34 * productValue34) * 0.75) + (floor(quotientValue5 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue11 * scalarValue11) * 0.75) + (floor(quotientValue5) * 0.5)))) ? 0.0 : scalarValue12;
    }
    else
    {
        comparisonValue = scalarValue12;
    }
    float productValue39 = sampledTextureValue2.x * varyingColor3.x;
    float productValue40 = sampledTextureValue2.y * varyingColor3.y;
    float productValue41 = sampledTextureValue2.z * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue39) * varyingColor2.w) + productValue39;
    fragmentColor0.y = ((varyingColor2.y - productValue40) * varyingColor2.w) + productValue40;
    fragmentColor0.z = ((varyingColor2.z - productValue41) * varyingColor2.w) + productValue41;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[13u].x * comparisonValue;
#endif
}
