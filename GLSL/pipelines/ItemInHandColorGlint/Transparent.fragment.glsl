#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandColorGlint / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 10
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/ItemInHandColorGlint/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue2 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue3 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    precise float multiplyAddValue14 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue15 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    precise float quotientValue4 = multiplyAddValue14 / reinterpretedBits1;
    precise float quotientValue5 = multiplyAddValue15 / reinterpretedBits1;
    precise float productValue16 = floor(quotientValue4) * reinterpretedBits1;
    precise float productValue17 = floor(quotientValue5) * reinterpretedBits1;
    precise float productValue18 = productValue16 * 0.25;
    precise float productValue19 = productValue17 * 0.25;
    precise float productValue20 = productValue16 * 0.5;
    precise float productValue21 = productValue17 * 0.5;
    float scalarValue2 = floor(productValue17);
    float scalarValue3 = floor(productValue19);
    float scalarValue4 = floor(productValue21);
    precise float productValue22 = scalarValue3 * scalarValue3;
    precise float productValue23 = scalarValue4 * scalarValue4;
    precise float productValue24 = productValue22 * 0.75;
    precise float productValue25 = productValue23 * 0.75;
    precise float productValue26 = scalarValue2 * scalarValue2;
    precise float productValue27 = productValue26 * 0.75;
    precise float multiplyAddValue16 = fma(fma(fma(fract(fma(floor(productValue18), 0.5, productValue24)), 0.25, fract(fma(floor(productValue20), 0.5, productValue25))), 0.25, fract(fma(floor(productValue16), 0.5, productValue27))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue28 = inverseLengthValue1 * reinterpretedBits2;
    precise float productValue29 = inverseLengthValue1 * reinterpretedBits3;
    precise float productValue30 = inverseLengthValue1 * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits17 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits18 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits19 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float sumValue = rdDot3Precise2(vec3(-productValue28, -productValue29, -productValue30), vec3(reinterpretedBits17, reinterpretedBits18, reinterpretedBits19)) - reinterpretedBits6;
    precise float reinterpretedBits20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits6;
    precise float quotientValue6 = 1.0 / reinterpretedBits20;
    precise float productValue31 = quotientValue6 * sumValue;
    float scalarValue5 = spvNClamp(productValue31, 0.0, 1.0);
    precise float productValue32 = scalarValue5 * scalarValue5;
    precise float multiplyAddValue17 = productValue32 * fma(scalarValue5, -2.0, 3.0);
    fragmentColor0.w = ((multiplyAddValue16 >= multiplyAddValue17) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0)) ? 0.0 : 1.0;
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    precise float sumValue3 = varyingColor0.z - 1.0;
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue18 = fma(reinterpretedBits8, sumValue1, 1.0);
    float multiplyAddValue19 = fma(reinterpretedBits8, sumValue2, 1.0);
    float multiplyAddValue20 = fma(reinterpretedBits8, sumValue3, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue21 = fma(varyingColor0.w, fma(multiplyAddValue18, uintBitsToFloat(reinterpretedBits9.x), -multiplyAddValue18), multiplyAddValue18);
    float multiplyAddValue22 = fma(varyingColor0.w, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits9.y), -multiplyAddValue19), multiplyAddValue19);
    float multiplyAddValue23 = fma(varyingColor0.w, fma(multiplyAddValue20, uintBitsToFloat(reinterpretedBits9.z), -multiplyAddValue20), multiplyAddValue20);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits21 = uintBitsToFloat(reinterpretedBits10.x) - multiplyAddValue21;
    precise float reinterpretedBits22 = uintBitsToFloat(reinterpretedBits10.y) - multiplyAddValue22;
    precise float reinterpretedBits23 = uintBitsToFloat(reinterpretedBits10.z) - multiplyAddValue23;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    precise float multiplyAddValue24 = fma(reinterpretedBits11, reinterpretedBits21, multiplyAddValue21) * varyingColor1.x;
    precise float multiplyAddValue25 = fma(reinterpretedBits11, reinterpretedBits22, multiplyAddValue22) * varyingColor1.y;
    precise float multiplyAddValue26 = fma(reinterpretedBits11, reinterpretedBits23, multiplyAddValue23) * varyingColor1.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits13 = uintBitsToFloat(reinterpretedBits12.x);
    float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits12.y);
    float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits12.z);
    precise float productValue33 = sampledTextureValue2.x * reinterpretedBits13;
    precise float productValue34 = sampledTextureValue2.y * reinterpretedBits14;
    precise float productValue35 = sampledTextureValue2.z * reinterpretedBits15;
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float multiplyAddValue27 = fma(sampledTextureValue3.x, reinterpretedBits13, productValue33) * uintBitsToFloat(reinterpretedBits16.x);
    precise float multiplyAddValue28 = fma(sampledTextureValue3.y, reinterpretedBits14, productValue34) * uintBitsToFloat(reinterpretedBits16.y);
    precise float multiplyAddValue29 = fma(sampledTextureValue3.z, reinterpretedBits15, productValue35) * uintBitsToFloat(reinterpretedBits16.z);
    float multiplyAddValue30 = fma(multiplyAddValue27, multiplyAddValue27, multiplyAddValue24);
    float multiplyAddValue31 = fma(multiplyAddValue28, multiplyAddValue28, multiplyAddValue25);
    float multiplyAddValue32 = fma(multiplyAddValue29, multiplyAddValue29, multiplyAddValue26);
    precise float sumValue4 = varyingColor2.x - multiplyAddValue30;
    precise float sumValue5 = varyingColor2.y - multiplyAddValue31;
    precise float sumValue6 = varyingColor2.z - multiplyAddValue32;
    fragmentColor0.x = fma(varyingColor2.w, sumValue4, multiplyAddValue30);
    fragmentColor0.y = fma(varyingColor2.w, sumValue5, multiplyAddValue31);
    fragmentColor0.z = fma(varyingColor2.w, sumValue6, multiplyAddValue32);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue2 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue3 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    precise float multiplyAddValue14 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue15 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    precise float quotientValue4 = multiplyAddValue14 / reinterpretedBits1;
    precise float quotientValue5 = multiplyAddValue15 / reinterpretedBits1;
    precise float productValue16 = floor(quotientValue4) * reinterpretedBits1;
    precise float productValue17 = floor(quotientValue5) * reinterpretedBits1;
    precise float productValue18 = productValue16 * 0.25;
    precise float productValue19 = productValue17 * 0.25;
    precise float productValue20 = productValue16 * 0.5;
    precise float productValue21 = productValue17 * 0.5;
    float scalarValue2 = floor(productValue17);
    float scalarValue3 = floor(productValue19);
    float scalarValue4 = floor(productValue21);
    precise float productValue22 = scalarValue3 * scalarValue3;
    precise float productValue23 = scalarValue4 * scalarValue4;
    precise float productValue24 = productValue22 * 0.75;
    precise float productValue25 = productValue23 * 0.75;
    precise float productValue26 = scalarValue2 * scalarValue2;
    precise float productValue27 = productValue26 * 0.75;
    precise float multiplyAddValue16 = fma(fma(fma(fract(fma(floor(productValue18), 0.5, productValue24)), 0.25, fract(fma(floor(productValue20), 0.5, productValue25))), 0.25, fract(fma(floor(productValue16), 0.5, productValue27))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue28 = inverseLengthValue1 * reinterpretedBits2;
    precise float productValue29 = inverseLengthValue1 * reinterpretedBits3;
    precise float productValue30 = inverseLengthValue1 * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits17 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits18 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits19 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float sumValue = rdDot3Precise2(vec3(-productValue28, -productValue29, -productValue30), vec3(reinterpretedBits17, reinterpretedBits18, reinterpretedBits19)) - reinterpretedBits6;
    precise float reinterpretedBits20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits6;
    precise float quotientValue6 = 1.0 / reinterpretedBits20;
    precise float productValue31 = quotientValue6 * sumValue;
    float scalarValue5 = spvNClamp(productValue31, 0.0, 1.0);
    precise float productValue32 = scalarValue5 * scalarValue5;
    precise float multiplyAddValue17 = productValue32 * fma(scalarValue5, -2.0, 3.0);
    fragmentColor0.w = ((multiplyAddValue16 >= multiplyAddValue17) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0)) ? 0.0 : 1.0;
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue18 = fma(reinterpretedBits8, sumValue1, 1.0);
    float multiplyAddValue19 = fma(reinterpretedBits8, sumValue2, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    precise float reinterpretedBits28 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits9.x);
    precise float reinterpretedBits29 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits9.y);
    precise float reinterpretedBits30 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits9.z);
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float scalarValue8 = ceil(multiplyAddValue19);
    float multiplyAddValue42 = fma(scalarValue8, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits16.x), -reinterpretedBits28), reinterpretedBits28);
    float multiplyAddValue43 = fma(scalarValue8, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits16.y), -reinterpretedBits29), reinterpretedBits29);
    float multiplyAddValue44 = fma(scalarValue8, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits16.z), -reinterpretedBits30), reinterpretedBits30);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits31 = uintBitsToFloat(reinterpretedBits10.x) - multiplyAddValue42;
    precise float reinterpretedBits32 = uintBitsToFloat(reinterpretedBits10.y) - multiplyAddValue43;
    precise float reinterpretedBits33 = uintBitsToFloat(reinterpretedBits10.z) - multiplyAddValue44;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    precise float multiplyAddValue45 = fma(reinterpretedBits11, reinterpretedBits31, multiplyAddValue42) * varyingColor1.x;
    precise float multiplyAddValue46 = fma(reinterpretedBits11, reinterpretedBits32, multiplyAddValue43) * varyingColor1.y;
    precise float multiplyAddValue47 = fma(reinterpretedBits11, reinterpretedBits33, multiplyAddValue44) * varyingColor1.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits13 = uintBitsToFloat(reinterpretedBits12.x);
    float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits12.y);
    float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits12.z);
    precise float productValue33 = sampledTextureValue2.x * reinterpretedBits13;
    precise float productValue34 = sampledTextureValue2.y * reinterpretedBits14;
    precise float productValue35 = sampledTextureValue2.z * reinterpretedBits15;
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    precise float multiplyAddValue48 = fma(sampledTextureValue3.x, reinterpretedBits13, productValue33) * uintBitsToFloat(reinterpretedBits27.x);
    precise float multiplyAddValue49 = fma(sampledTextureValue3.y, reinterpretedBits14, productValue34) * uintBitsToFloat(reinterpretedBits27.y);
    precise float multiplyAddValue50 = fma(sampledTextureValue3.z, reinterpretedBits15, productValue35) * uintBitsToFloat(reinterpretedBits27.z);
    float multiplyAddValue51 = fma(multiplyAddValue48, multiplyAddValue48, multiplyAddValue45);
    float multiplyAddValue52 = fma(multiplyAddValue49, multiplyAddValue49, multiplyAddValue46);
    float multiplyAddValue53 = fma(multiplyAddValue50, multiplyAddValue50, multiplyAddValue47);
    precise float sumValue7 = varyingColor2.x - multiplyAddValue51;
    precise float sumValue8 = varyingColor2.y - multiplyAddValue52;
    precise float sumValue9 = varyingColor2.z - multiplyAddValue53;
    fragmentColor0.x = fma(varyingColor2.w, sumValue7, multiplyAddValue51);
    fragmentColor0.y = fma(varyingColor2.w, sumValue8, multiplyAddValue52);
    fragmentColor0.z = fma(varyingColor2.w, sumValue9, multiplyAddValue53);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    float multiplyAddValue = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue1 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue1 = floor(multiplyAddValue1);
    float productValue14 = floor(multiplyAddValue1 * 0.25);
    float productValue15 = floor(multiplyAddValue1 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits6)) * (rdDot3Precise2(vec3(-(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3), -(inverseLengthValue1 * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits6), 0.0, 1.0);
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue14 * productValue14) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue15 * productValue15) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue1 * scalarValue1) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0)) ? 0.0 : 1.0;
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue2 = fma(reinterpretedBits8, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = fma(reinterpretedBits8, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue4 = fma(reinterpretedBits8, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue5 = fma(varyingColor0.w, fma(multiplyAddValue2, uintBitsToFloat(reinterpretedBits9.x), -multiplyAddValue2), multiplyAddValue2);
    float multiplyAddValue6 = fma(varyingColor0.w, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits9.y), -multiplyAddValue3), multiplyAddValue3);
    float multiplyAddValue7 = fma(varyingColor0.w, fma(multiplyAddValue4, uintBitsToFloat(reinterpretedBits9.z), -multiplyAddValue4), multiplyAddValue4);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits13 = uintBitsToFloat(reinterpretedBits12.x);
    float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits12.y);
    float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits12.z);
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue8 = fma(sampledTextureValue3.x, reinterpretedBits13, sampledTextureValue2.x * reinterpretedBits13) * uintBitsToFloat(reinterpretedBits16.x);
    float multiplyAddValue9 = fma(sampledTextureValue3.y, reinterpretedBits14, sampledTextureValue2.y * reinterpretedBits14) * uintBitsToFloat(reinterpretedBits16.y);
    float multiplyAddValue10 = fma(sampledTextureValue3.z, reinterpretedBits15, sampledTextureValue2.z * reinterpretedBits15) * uintBitsToFloat(reinterpretedBits16.z);
    float multiplyAddValue11 = fma(multiplyAddValue8, multiplyAddValue8, fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - multiplyAddValue5, multiplyAddValue5) * varyingColor1.x);
    float multiplyAddValue12 = fma(multiplyAddValue9, multiplyAddValue9, fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - multiplyAddValue6, multiplyAddValue6) * varyingColor1.y);
    float multiplyAddValue13 = fma(multiplyAddValue10, multiplyAddValue10, fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - multiplyAddValue7, multiplyAddValue7) * varyingColor1.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue11, multiplyAddValue11);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue12, multiplyAddValue12);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue13, multiplyAddValue13);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    float multiplyAddValue = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue1 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue1 = floor(multiplyAddValue1);
    float productValue14 = floor(multiplyAddValue1 * 0.25);
    float productValue15 = floor(multiplyAddValue1 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits6)) * (rdDot3Precise2(vec3(-(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3), -(inverseLengthValue1 * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits6), 0.0, 1.0);
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue14 * productValue14) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue15 * productValue15) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue1 * scalarValue1) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0)) ? 0.0 : 1.0;
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue2 = fma(reinterpretedBits8, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = fma(reinterpretedBits8, varyingColor0.y - 1.0, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits24 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits9.x);
    float reinterpretedBits25 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits26 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits9.z);
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float scalarValue6 = ceil(multiplyAddValue3);
    float multiplyAddValue33 = fma(scalarValue6, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits16.x), -reinterpretedBits24), reinterpretedBits24);
    float multiplyAddValue34 = fma(scalarValue6, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits16.y), -reinterpretedBits25), reinterpretedBits25);
    float multiplyAddValue35 = fma(scalarValue6, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits16.z), -reinterpretedBits26), reinterpretedBits26);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits13 = uintBitsToFloat(reinterpretedBits12.x);
    float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits12.y);
    float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits12.z);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue36 = fma(sampledTextureValue3.x, reinterpretedBits13, sampledTextureValue2.x * reinterpretedBits13) * uintBitsToFloat(reinterpretedBits27.x);
    float multiplyAddValue37 = fma(sampledTextureValue3.y, reinterpretedBits14, sampledTextureValue2.y * reinterpretedBits14) * uintBitsToFloat(reinterpretedBits27.y);
    float multiplyAddValue38 = fma(sampledTextureValue3.z, reinterpretedBits15, sampledTextureValue2.z * reinterpretedBits15) * uintBitsToFloat(reinterpretedBits27.z);
    float multiplyAddValue39 = fma(multiplyAddValue36, multiplyAddValue36, fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - multiplyAddValue33, multiplyAddValue33) * varyingColor1.x);
    float multiplyAddValue40 = fma(multiplyAddValue37, multiplyAddValue37, fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - multiplyAddValue34, multiplyAddValue34) * varyingColor1.y);
    float multiplyAddValue41 = fma(multiplyAddValue38, multiplyAddValue38, fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - multiplyAddValue35, multiplyAddValue35) * varyingColor1.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue39, multiplyAddValue39);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue40, multiplyAddValue40);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue41, multiplyAddValue41);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue2 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.z + (-1.0))) + 1.0;
    float productValue3 = (((productValue * fragmentVectorConstants1.packedValues[4u].x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * fragmentVectorConstants1.packedValues[4u].y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * fragmentVectorConstants1.packedValues[4u].z) - productValue2) * varyingColor0.w) + productValue2;
    vec4 sampledTextureValue = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue1 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue6 = (fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[17u].x) * (sampledTextureValue1.x + sampledTextureValue.x);
    float productValue7 = (fragmentVectorConstants1.packedValues[16u].y * fragmentVectorConstants1.packedValues[17u].y) * (sampledTextureValue1.y + sampledTextureValue.y);
    float productValue8 = (fragmentVectorConstants1.packedValues[16u].z * fragmentVectorConstants1.packedValues[17u].z) * (sampledTextureValue1.z + sampledTextureValue.z);
    float productValue9 = (productValue6 * productValue6) + ((((fragmentVectorConstants1.packedValues[9u].x - productValue3) * fragmentVectorConstants1.packedValues[9u].w) + productValue3) * varyingColor1.x);
    float productValue10 = (productValue7 * productValue7) + ((((fragmentVectorConstants1.packedValues[9u].y - productValue4) * fragmentVectorConstants1.packedValues[9u].w) + productValue4) * varyingColor1.y);
    float productValue11 = (productValue8 * productValue8) + ((((fragmentVectorConstants1.packedValues[9u].z - productValue5) * fragmentVectorConstants1.packedValues[9u].w) + productValue5) * varyingColor1.z);
    float comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue12 = floor(quotientValue1 * 0.25);
        float productValue13 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue13 * productValue13) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue12 * productValue12) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)))) ? 0.0 : 1.0;
    }
    else
    {
        comparisonValue = 1.0;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = comparisonValue;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue36 = productValue * fragmentVectorConstants1.packedValues[4u].x;
    float productValue37 = productValue * fragmentVectorConstants1.packedValues[4u].y;
    float productValue38 = productValue * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue7 = ceil(productValue1);
    float productValue39 = (((productValue1 * fragmentVectorConstants1.packedValues[17u].x) - productValue36) * scalarValue7) + productValue36;
    float productValue40 = (((productValue1 * fragmentVectorConstants1.packedValues[17u].y) - productValue37) * scalarValue7) + productValue37;
    float productValue41 = (((productValue1 * fragmentVectorConstants1.packedValues[17u].z) - productValue38) * scalarValue7) + productValue38;
    vec4 sampledTextureValue = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue1 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue42 = (fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[18u].x) * (sampledTextureValue1.x + sampledTextureValue.x);
    float productValue43 = (fragmentVectorConstants1.packedValues[16u].y * fragmentVectorConstants1.packedValues[18u].y) * (sampledTextureValue1.y + sampledTextureValue.y);
    float productValue44 = (fragmentVectorConstants1.packedValues[16u].z * fragmentVectorConstants1.packedValues[18u].z) * (sampledTextureValue1.z + sampledTextureValue.z);
    float productValue45 = (productValue42 * productValue42) + ((((fragmentVectorConstants1.packedValues[9u].x - productValue39) * fragmentVectorConstants1.packedValues[9u].w) + productValue39) * varyingColor1.x);
    float productValue46 = (productValue43 * productValue43) + ((((fragmentVectorConstants1.packedValues[9u].y - productValue40) * fragmentVectorConstants1.packedValues[9u].w) + productValue40) * varyingColor1.y);
    float productValue47 = (productValue44 * productValue44) + ((((fragmentVectorConstants1.packedValues[9u].z - productValue41) * fragmentVectorConstants1.packedValues[9u].w) + productValue41) * varyingColor1.z);
    float comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue12 = floor(quotientValue1 * 0.25);
        float productValue13 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue13 * productValue13) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue12 * productValue12) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)))) ? 0.0 : 1.0;
    }
    else
    {
        comparisonValue = 1.0;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue45) * varyingColor2.w) + productValue45;
    fragmentColor0.y = ((varyingColor2.y - productValue46) * varyingColor2.w) + productValue46;
    fragmentColor0.z = ((varyingColor2.z - productValue47) * varyingColor2.w) + productValue47;
    fragmentColor0.w = comparisonValue;
#endif
}
