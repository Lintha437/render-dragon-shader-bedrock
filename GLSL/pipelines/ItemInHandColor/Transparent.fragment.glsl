#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandColor / Transparent / fragment forward pipeline.
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

#include "../../include/materials/ItemInHandColor/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue2 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue3 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    precise float multiplyAddValue11 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue12 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    precise float quotientValue4 = multiplyAddValue11 / reinterpretedBits1;
    precise float quotientValue5 = multiplyAddValue12 / reinterpretedBits1;
    precise float productValue13 = floor(quotientValue4) * reinterpretedBits1;
    precise float productValue14 = floor(quotientValue5) * reinterpretedBits1;
    precise float productValue15 = productValue13 * 0.25;
    precise float productValue16 = productValue14 * 0.25;
    precise float productValue17 = productValue13 * 0.5;
    precise float productValue18 = productValue14 * 0.5;
    float scalarValue2 = floor(productValue14);
    float scalarValue3 = floor(productValue16);
    float scalarValue4 = floor(productValue18);
    precise float productValue19 = scalarValue3 * scalarValue3;
    precise float productValue20 = scalarValue4 * scalarValue4;
    precise float productValue21 = productValue19 * 0.75;
    precise float productValue22 = productValue20 * 0.75;
    precise float productValue23 = scalarValue2 * scalarValue2;
    precise float productValue24 = productValue23 * 0.75;
    precise float multiplyAddValue13 = fma(fma(fma(fract(fma(floor(productValue15), 0.5, productValue21)), 0.25, fract(fma(floor(productValue17), 0.5, productValue22))), 0.25, fract(fma(floor(productValue13), 0.5, productValue24))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue25 = inverseLengthValue1 * reinterpretedBits2;
    precise float productValue26 = inverseLengthValue1 * reinterpretedBits3;
    precise float productValue27 = inverseLengthValue1 * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits12 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits13 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits14 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float sumValue = rdDot3Precise2(vec3(-productValue25, -productValue26, -productValue27), vec3(reinterpretedBits12, reinterpretedBits13, reinterpretedBits14)) - reinterpretedBits6;
    precise float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits6;
    precise float quotientValue6 = 1.0 / reinterpretedBits15;
    precise float productValue28 = quotientValue6 * sumValue;
    float scalarValue5 = spvNClamp(productValue28, 0.0, 1.0);
    precise float productValue29 = scalarValue5 * scalarValue5;
    precise float multiplyAddValue14 = productValue29 * fma(scalarValue5, -2.0, 3.0);
    fragmentColor0.w = ((multiplyAddValue13 >= multiplyAddValue14) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0)) ? 0.0 : 1.0;
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    precise float sumValue3 = varyingColor0.z - 1.0;
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue15 = fma(reinterpretedBits8, sumValue1, 1.0);
    float multiplyAddValue16 = fma(reinterpretedBits8, sumValue2, 1.0);
    float multiplyAddValue17 = fma(reinterpretedBits8, sumValue3, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue18 = fma(varyingColor0.w, fma(multiplyAddValue15, uintBitsToFloat(reinterpretedBits9.x), -multiplyAddValue15), multiplyAddValue15);
    float multiplyAddValue19 = fma(varyingColor0.w, fma(multiplyAddValue16, uintBitsToFloat(reinterpretedBits9.y), -multiplyAddValue16), multiplyAddValue16);
    float multiplyAddValue20 = fma(varyingColor0.w, fma(multiplyAddValue17, uintBitsToFloat(reinterpretedBits9.z), -multiplyAddValue17), multiplyAddValue17);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits16 = uintBitsToFloat(reinterpretedBits10.x) - multiplyAddValue18;
    precise float reinterpretedBits17 = uintBitsToFloat(reinterpretedBits10.y) - multiplyAddValue19;
    precise float reinterpretedBits18 = uintBitsToFloat(reinterpretedBits10.z) - multiplyAddValue20;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue21 = fma(reinterpretedBits11, reinterpretedBits16, multiplyAddValue18);
    float multiplyAddValue22 = fma(reinterpretedBits11, reinterpretedBits17, multiplyAddValue19);
    float multiplyAddValue23 = fma(reinterpretedBits11, reinterpretedBits18, multiplyAddValue20);
    precise float productValue30 = multiplyAddValue21 * varyingColor1.x;
    precise float productValue31 = multiplyAddValue22 * varyingColor1.y;
    precise float productValue32 = multiplyAddValue23 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue21, varyingColor1.x, varyingColor2.x), productValue30);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue22, varyingColor1.y, varyingColor2.y), productValue31);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue23, varyingColor1.z, varyingColor2.z), productValue32);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue2 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue3 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    precise float multiplyAddValue11 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue12 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    precise float quotientValue4 = multiplyAddValue11 / reinterpretedBits1;
    precise float quotientValue5 = multiplyAddValue12 / reinterpretedBits1;
    precise float productValue13 = floor(quotientValue4) * reinterpretedBits1;
    precise float productValue14 = floor(quotientValue5) * reinterpretedBits1;
    precise float productValue15 = productValue13 * 0.25;
    precise float productValue16 = productValue14 * 0.25;
    precise float productValue17 = productValue13 * 0.5;
    precise float productValue18 = productValue14 * 0.5;
    float scalarValue2 = floor(productValue14);
    float scalarValue3 = floor(productValue16);
    float scalarValue4 = floor(productValue18);
    precise float productValue19 = scalarValue3 * scalarValue3;
    precise float productValue20 = scalarValue4 * scalarValue4;
    precise float productValue21 = productValue19 * 0.75;
    precise float productValue22 = productValue20 * 0.75;
    precise float productValue23 = scalarValue2 * scalarValue2;
    precise float productValue24 = productValue23 * 0.75;
    precise float multiplyAddValue13 = fma(fma(fma(fract(fma(floor(productValue15), 0.5, productValue21)), 0.25, fract(fma(floor(productValue17), 0.5, productValue22))), 0.25, fract(fma(floor(productValue13), 0.5, productValue24))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue25 = inverseLengthValue1 * reinterpretedBits2;
    precise float productValue26 = inverseLengthValue1 * reinterpretedBits3;
    precise float productValue27 = inverseLengthValue1 * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits12 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits13 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits14 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float sumValue = rdDot3Precise2(vec3(-productValue25, -productValue26, -productValue27), vec3(reinterpretedBits12, reinterpretedBits13, reinterpretedBits14)) - reinterpretedBits6;
    precise float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits6;
    precise float quotientValue6 = 1.0 / reinterpretedBits15;
    precise float productValue28 = quotientValue6 * sumValue;
    float scalarValue5 = spvNClamp(productValue28, 0.0, 1.0);
    precise float productValue29 = scalarValue5 * scalarValue5;
    precise float multiplyAddValue14 = productValue29 * fma(scalarValue5, -2.0, 3.0);
    fragmentColor0.w = ((multiplyAddValue13 >= multiplyAddValue14) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0)) ? 0.0 : 1.0;
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue15 = fma(reinterpretedBits8, sumValue1, 1.0);
    float multiplyAddValue16 = fma(reinterpretedBits8, sumValue2, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    precise float reinterpretedBits19 = multiplyAddValue15 * uintBitsToFloat(reinterpretedBits9.x);
    precise float reinterpretedBits20 = multiplyAddValue15 * uintBitsToFloat(reinterpretedBits9.y);
    precise float reinterpretedBits21 = multiplyAddValue15 * uintBitsToFloat(reinterpretedBits9.z);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float scalarValue7 = ceil(multiplyAddValue16);
    float multiplyAddValue24 = fma(scalarValue7, fma(multiplyAddValue16, uintBitsToFloat(reinterpretedBits22.x), -reinterpretedBits19), reinterpretedBits19);
    float multiplyAddValue25 = fma(scalarValue7, fma(multiplyAddValue16, uintBitsToFloat(reinterpretedBits22.y), -reinterpretedBits20), reinterpretedBits20);
    float multiplyAddValue26 = fma(scalarValue7, fma(multiplyAddValue16, uintBitsToFloat(reinterpretedBits22.z), -reinterpretedBits21), reinterpretedBits21);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits23 = uintBitsToFloat(reinterpretedBits10.x) - multiplyAddValue24;
    precise float reinterpretedBits24 = uintBitsToFloat(reinterpretedBits10.y) - multiplyAddValue25;
    precise float reinterpretedBits25 = uintBitsToFloat(reinterpretedBits10.z) - multiplyAddValue26;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue27 = fma(reinterpretedBits11, reinterpretedBits23, multiplyAddValue24);
    float multiplyAddValue28 = fma(reinterpretedBits11, reinterpretedBits24, multiplyAddValue25);
    float multiplyAddValue29 = fma(reinterpretedBits11, reinterpretedBits25, multiplyAddValue26);
    precise float productValue42 = multiplyAddValue27 * varyingColor1.x;
    precise float productValue43 = multiplyAddValue28 * varyingColor1.y;
    precise float productValue44 = multiplyAddValue29 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue27, varyingColor1.x, varyingColor2.x), productValue42);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue28, varyingColor1.y, varyingColor2.y), productValue43);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue29, varyingColor1.z, varyingColor2.z), productValue44);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    float multiplyAddValue = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue1 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue1 = floor(multiplyAddValue1);
    float productValue11 = floor(multiplyAddValue1 * 0.25);
    float productValue12 = floor(multiplyAddValue1 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits6)) * (rdDot3Precise2(vec3(-(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3), -(inverseLengthValue1 * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits6), 0.0, 1.0);
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue11 * productValue11) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue12 * productValue12) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue1 * scalarValue1) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0)) ? 0.0 : 1.0;
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
    float multiplyAddValue8 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - multiplyAddValue5, multiplyAddValue5);
    float multiplyAddValue9 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - multiplyAddValue6, multiplyAddValue6);
    float multiplyAddValue10 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - multiplyAddValue7, multiplyAddValue7);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue8, varyingColor1.x, varyingColor2.x), multiplyAddValue8 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue9, varyingColor1.y, varyingColor2.y), multiplyAddValue9 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue10, varyingColor1.z, varyingColor2.z), multiplyAddValue10 * varyingColor1.z);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    float multiplyAddValue = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue1 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue1 = floor(multiplyAddValue1);
    float productValue11 = floor(multiplyAddValue1 * 0.25);
    float productValue12 = floor(multiplyAddValue1 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits6)) * (rdDot3Precise2(vec3(-(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3), -(inverseLengthValue1 * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits6), 0.0, 1.0);
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue11 * productValue11) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue12 * productValue12) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue1 * scalarValue1) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0)) ? 0.0 : 1.0;
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue2 = fma(reinterpretedBits8, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = fma(reinterpretedBits8, varyingColor0.y - 1.0, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits26 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits9.x);
    float reinterpretedBits27 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits28 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits9.z);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float scalarValue8 = ceil(multiplyAddValue3);
    float multiplyAddValue30 = fma(scalarValue8, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits22.x), -reinterpretedBits26), reinterpretedBits26);
    float multiplyAddValue31 = fma(scalarValue8, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits22.y), -reinterpretedBits27), reinterpretedBits27);
    float multiplyAddValue32 = fma(scalarValue8, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits22.z), -reinterpretedBits28), reinterpretedBits28);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue33 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - multiplyAddValue30, multiplyAddValue30);
    float multiplyAddValue34 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - multiplyAddValue31, multiplyAddValue31);
    float multiplyAddValue35 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - multiplyAddValue32, multiplyAddValue32);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue33, varyingColor1.x, varyingColor2.x), multiplyAddValue33 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue34, varyingColor1.y, varyingColor2.y), multiplyAddValue34 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue35, varyingColor1.z, varyingColor2.z), multiplyAddValue35 * varyingColor1.z);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue2 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.z + (-1.0))) + 1.0;
    float productValue3 = (((productValue * fragmentVectorConstants1.packedValues[4u].x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * fragmentVectorConstants1.packedValues[4u].y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * fragmentVectorConstants1.packedValues[4u].z) - productValue2) * varyingColor0.w) + productValue2;
    float productValue6 = (((fragmentVectorConstants1.packedValues[9u].x - productValue3) * fragmentVectorConstants1.packedValues[9u].w) + productValue3) * varyingColor1.x;
    float productValue7 = (((fragmentVectorConstants1.packedValues[9u].y - productValue4) * fragmentVectorConstants1.packedValues[9u].w) + productValue4) * varyingColor1.y;
    float productValue8 = (((fragmentVectorConstants1.packedValues[9u].z - productValue5) * fragmentVectorConstants1.packedValues[9u].w) + productValue5) * varyingColor1.z;
    float comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue9 = floor(quotientValue1 * 0.25);
        float productValue10 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue10 * productValue10) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue9 * productValue9) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)))) ? 0.0 : 1.0;
    }
    else
    {
        comparisonValue = 1.0;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = comparisonValue;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue33 = productValue * fragmentVectorConstants1.packedValues[4u].x;
    float productValue34 = productValue * fragmentVectorConstants1.packedValues[4u].y;
    float productValue35 = productValue * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue6 = ceil(productValue1);
    float productValue36 = (((productValue1 * fragmentVectorConstants1.packedValues[16u].x) - productValue33) * scalarValue6) + productValue33;
    float productValue37 = (((productValue1 * fragmentVectorConstants1.packedValues[16u].y) - productValue34) * scalarValue6) + productValue34;
    float productValue38 = (((productValue1 * fragmentVectorConstants1.packedValues[16u].z) - productValue35) * scalarValue6) + productValue35;
    float productValue39 = (((fragmentVectorConstants1.packedValues[9u].x - productValue36) * fragmentVectorConstants1.packedValues[9u].w) + productValue36) * varyingColor1.x;
    float productValue40 = (((fragmentVectorConstants1.packedValues[9u].y - productValue37) * fragmentVectorConstants1.packedValues[9u].w) + productValue37) * varyingColor1.y;
    float productValue41 = (((fragmentVectorConstants1.packedValues[9u].z - productValue38) * fragmentVectorConstants1.packedValues[9u].w) + productValue38) * varyingColor1.z;
    float comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue9 = floor(quotientValue1 * 0.25);
        float productValue10 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue10 * productValue10) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue9 * productValue9) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)))) ? 0.0 : 1.0;
    }
    else
    {
        comparisonValue = 1.0;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue39) * varyingColor2.w) + productValue39;
    fragmentColor0.y = ((varyingColor2.y - productValue40) * varyingColor2.w) + productValue40;
    fragmentColor0.z = ((varyingColor2.z - productValue41) * varyingColor2.w) + productValue41;
    fragmentColor0.w = comparisonValue;
#endif
}
