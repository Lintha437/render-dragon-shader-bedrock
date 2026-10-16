#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandTextured / Transparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 8
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/ItemInHandTextured/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue2 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue3 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue1 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue4 = multiplyAddValue / reinterpretedBits1;
    precise float quotientValue5 = multiplyAddValue1 / reinterpretedBits1;
    precise float productValue18 = floor(quotientValue4) * reinterpretedBits1;
    precise float productValue19 = floor(quotientValue5) * reinterpretedBits1;
    precise float productValue20 = productValue18 * 0.25;
    precise float productValue21 = productValue19 * 0.25;
    precise float productValue22 = productValue18 * 0.5;
    precise float productValue23 = productValue19 * 0.5;
    float scalarValue5 = floor(productValue19);
    float scalarValue6 = floor(productValue21);
    float scalarValue7 = floor(productValue23);
    precise float productValue24 = scalarValue6 * scalarValue6;
    precise float productValue25 = scalarValue7 * scalarValue7;
    precise float productValue26 = productValue24 * 0.75;
    precise float productValue27 = productValue25 * 0.75;
    precise float productValue28 = scalarValue5 * scalarValue5;
    precise float productValue29 = productValue28 * 0.75;
    precise float multiplyAddValue2 = fma(fma(fma(fract(fma(floor(productValue20), 0.5, productValue26)), 0.25, fract(fma(floor(productValue22), 0.5, productValue27))), 0.25, fract(fma(floor(productValue18), 0.5, productValue29))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue30 = inverseLengthValue1 * reinterpretedBits2;
    precise float productValue31 = inverseLengthValue1 * reinterpretedBits3;
    precise float productValue32 = inverseLengthValue1 * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits6 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits7 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits8 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float sumValue = rdDot3Precise2(vec3(-productValue30, -productValue31, -productValue32), vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8)) - reinterpretedBits9;
    precise float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits9;
    precise float quotientValue6 = 1.0 / reinterpretedBits10;
    precise float productValue33 = quotientValue6 * sumValue;
    float scalarValue8 = spvNClamp(productValue33, 0.0, 1.0);
    precise float productValue34 = scalarValue8 * scalarValue8;
    precise float multiplyAddValue3 = productValue34 * fma(scalarValue8, -2.0, 3.0);
    bool reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue11 = sampledTextureValue1.z;
    float scalarValue12 = sampledTextureValue1.w;
    precise float multiplyAddValue4 = fma(scalarValue12, fma(scalarValue9, varyingColor0.x, -scalarValue9), scalarValue9) * varyingColor0.w;
    precise float multiplyAddValue5 = fma(scalarValue12, fma(scalarValue10, varyingColor0.y, -scalarValue10), scalarValue10) * varyingColor0.w;
    precise float multiplyAddValue6 = fma(scalarValue12, fma(scalarValue11, varyingColor0.z, -scalarValue11), scalarValue11) * varyingColor0.w;
    precise float productValue35 = scalarValue9 * varyingColor0.x;
    precise float productValue36 = scalarValue10 * varyingColor0.y;
    precise float productValue37 = scalarValue11 * varyingColor0.z;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float reinterpretedBits13 = (reinterpretedBits11 ? multiplyAddValue4 : productValue35) * uintBitsToFloat(reinterpretedBits12.x);
    precise float reinterpretedBits14 = (reinterpretedBits11 ? multiplyAddValue5 : productValue36) * uintBitsToFloat(reinterpretedBits12.y);
    precise float reinterpretedBits15 = (reinterpretedBits11 ? multiplyAddValue6 : productValue37) * uintBitsToFloat(reinterpretedBits12.z);
    precise float reinterpretedBits16 = (reinterpretedBits11 ? 1.0 : scalarValue12) * uintBitsToFloat(reinterpretedBits12.w);
    precise float reinterpretedBits17 = (((multiplyAddValue2 >= multiplyAddValue3) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0)) ? 0.0 : 1.0) * reinterpretedBits16;
    fragmentColor0.w = reinterpretedBits17;
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    precise float sumValue3 = varyingColor0.z - 1.0;
    float reinterpretedBits18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float multiplyAddValue7 = fma(reinterpretedBits18, sumValue1, 1.0) * reinterpretedBits13;
    precise float multiplyAddValue8 = fma(reinterpretedBits18, sumValue2, 1.0) * reinterpretedBits14;
    precise float multiplyAddValue9 = fma(reinterpretedBits18, sumValue3, 1.0) * reinterpretedBits15;
    uvec4 reinterpretedBits19 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue10 = fma(varyingColor0.w, fma(multiplyAddValue7, uintBitsToFloat(reinterpretedBits19.x), -multiplyAddValue7), multiplyAddValue7);
    float multiplyAddValue11 = fma(varyingColor0.w, fma(multiplyAddValue8, uintBitsToFloat(reinterpretedBits19.y), -multiplyAddValue8), multiplyAddValue8);
    float multiplyAddValue12 = fma(varyingColor0.w, fma(multiplyAddValue9, uintBitsToFloat(reinterpretedBits19.z), -multiplyAddValue9), multiplyAddValue9);
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits21 = uintBitsToFloat(reinterpretedBits20.x) - multiplyAddValue10;
    precise float reinterpretedBits22 = uintBitsToFloat(reinterpretedBits20.y) - multiplyAddValue11;
    precise float reinterpretedBits23 = uintBitsToFloat(reinterpretedBits20.z) - multiplyAddValue12;
    float reinterpretedBits24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue13 = fma(reinterpretedBits24, reinterpretedBits21, multiplyAddValue10);
    float multiplyAddValue14 = fma(reinterpretedBits24, reinterpretedBits22, multiplyAddValue11);
    float multiplyAddValue15 = fma(reinterpretedBits24, reinterpretedBits23, multiplyAddValue12);
    precise float productValue38 = multiplyAddValue13 * varyingColor1.x;
    precise float productValue39 = multiplyAddValue14 * varyingColor1.y;
    precise float productValue40 = multiplyAddValue15 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue13, varyingColor1.x, varyingColor2.x), productValue38);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue14, varyingColor1.y, varyingColor2.y), productValue39);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue15, varyingColor1.z, varyingColor2.z), productValue40);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue2 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue3 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue1 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue4 = multiplyAddValue / reinterpretedBits1;
    precise float quotientValue5 = multiplyAddValue1 / reinterpretedBits1;
    precise float productValue18 = floor(quotientValue4) * reinterpretedBits1;
    precise float productValue19 = floor(quotientValue5) * reinterpretedBits1;
    precise float productValue20 = productValue18 * 0.25;
    precise float productValue21 = productValue19 * 0.25;
    precise float productValue22 = productValue18 * 0.5;
    precise float productValue23 = productValue19 * 0.5;
    float scalarValue5 = floor(productValue19);
    float scalarValue6 = floor(productValue21);
    float scalarValue7 = floor(productValue23);
    precise float productValue24 = scalarValue6 * scalarValue6;
    precise float productValue25 = scalarValue7 * scalarValue7;
    precise float productValue26 = productValue24 * 0.75;
    precise float productValue27 = productValue25 * 0.75;
    precise float productValue28 = scalarValue5 * scalarValue5;
    precise float productValue29 = productValue28 * 0.75;
    precise float multiplyAddValue2 = fma(fma(fma(fract(fma(floor(productValue20), 0.5, productValue26)), 0.25, fract(fma(floor(productValue22), 0.5, productValue27))), 0.25, fract(fma(floor(productValue18), 0.5, productValue29))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue30 = inverseLengthValue1 * reinterpretedBits2;
    precise float productValue31 = inverseLengthValue1 * reinterpretedBits3;
    precise float productValue32 = inverseLengthValue1 * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits6 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits7 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits8 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float sumValue = rdDot3Precise2(vec3(-productValue30, -productValue31, -productValue32), vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8)) - reinterpretedBits9;
    precise float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits9;
    precise float quotientValue6 = 1.0 / reinterpretedBits10;
    precise float productValue33 = quotientValue6 * sumValue;
    float scalarValue8 = spvNClamp(productValue33, 0.0, 1.0);
    precise float productValue34 = scalarValue8 * scalarValue8;
    precise float multiplyAddValue3 = productValue34 * fma(scalarValue8, -2.0, 3.0);
    bool reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue12 = sampledTextureValue1.w;
    precise float multiplyAddValue4 = fma(scalarValue12, fma(scalarValue9, varyingColor0.x, -scalarValue9), scalarValue9) * varyingColor0.w;
    precise float multiplyAddValue5 = fma(scalarValue12, fma(scalarValue10, varyingColor0.y, -scalarValue10), scalarValue10) * varyingColor0.w;
    precise float productValue35 = scalarValue9 * varyingColor0.x;
    precise float productValue36 = scalarValue10 * varyingColor0.y;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float reinterpretedBits13 = (reinterpretedBits11 ? multiplyAddValue4 : productValue35) * uintBitsToFloat(reinterpretedBits12.x);
    precise float reinterpretedBits14 = (reinterpretedBits11 ? multiplyAddValue5 : productValue36) * uintBitsToFloat(reinterpretedBits12.y);
    precise float reinterpretedBits30 = (reinterpretedBits11 ? 1.0 : scalarValue12) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    precise float reinterpretedBits31 = (((multiplyAddValue2 >= multiplyAddValue3) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0)) ? 0.0 : 1.0) * reinterpretedBits30;
    fragmentColor0.w = reinterpretedBits31;
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    float reinterpretedBits18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float multiplyAddValue7 = fma(reinterpretedBits18, sumValue1, 1.0) * reinterpretedBits13;
    precise float multiplyAddValue8 = fma(reinterpretedBits18, sumValue2, 1.0) * reinterpretedBits14;
    uvec4 reinterpretedBits19 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    precise float reinterpretedBits32 = multiplyAddValue7 * uintBitsToFloat(reinterpretedBits19.x);
    precise float reinterpretedBits33 = multiplyAddValue7 * uintBitsToFloat(reinterpretedBits19.y);
    precise float reinterpretedBits34 = multiplyAddValue7 * uintBitsToFloat(reinterpretedBits19.z);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float scalarValue16 = ceil(multiplyAddValue8);
    float multiplyAddValue33 = fma(scalarValue16, fma(multiplyAddValue8, uintBitsToFloat(reinterpretedBits29.x), -reinterpretedBits32), reinterpretedBits32);
    float multiplyAddValue34 = fma(scalarValue16, fma(multiplyAddValue8, uintBitsToFloat(reinterpretedBits29.y), -reinterpretedBits33), reinterpretedBits33);
    float multiplyAddValue35 = fma(scalarValue16, fma(multiplyAddValue8, uintBitsToFloat(reinterpretedBits29.z), -reinterpretedBits34), reinterpretedBits34);
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits35 = uintBitsToFloat(reinterpretedBits20.x) - multiplyAddValue33;
    precise float reinterpretedBits36 = uintBitsToFloat(reinterpretedBits20.y) - multiplyAddValue34;
    precise float reinterpretedBits37 = uintBitsToFloat(reinterpretedBits20.z) - multiplyAddValue35;
    float reinterpretedBits24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue36 = fma(reinterpretedBits24, reinterpretedBits35, multiplyAddValue33);
    float multiplyAddValue37 = fma(reinterpretedBits24, reinterpretedBits36, multiplyAddValue34);
    float multiplyAddValue38 = fma(reinterpretedBits24, reinterpretedBits37, multiplyAddValue35);
    precise float productValue54 = multiplyAddValue36 * varyingColor1.x;
    precise float productValue55 = multiplyAddValue37 * varyingColor1.y;
    precise float productValue56 = multiplyAddValue38 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue36, varyingColor1.x, varyingColor2.x), productValue54);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue37, varyingColor1.y, varyingColor2.y), productValue55);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue38, varyingColor1.z, varyingColor2.z), productValue56);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue16 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue17 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue13 = floor(multiplyAddValue17);
    float productValue41 = floor(multiplyAddValue17 * 0.25);
    float productValue42 = floor(multiplyAddValue17 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits25 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits9)) * (rdDot3Precise2(vec3(-(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3), -(inverseLengthValue1 * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits9), 0.0, 1.0);
    bool reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue11 = sampledTextureValue1.z;
    float scalarValue12 = sampledTextureValue1.w;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue16 * 0.25), 0.5, (productValue41 * productValue41) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue16 * 0.5), 0.5, (productValue42 * productValue42) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue16), 0.5, (scalarValue13 * scalarValue13) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits25 * reinterpretedBits25) * fma(reinterpretedBits25, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0)) ? 0.0 : ((reinterpretedBits11 ? 1.0 : scalarValue12) * uintBitsToFloat(reinterpretedBits12.w));
    float reinterpretedBits18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue18 = fma(reinterpretedBits18, varyingColor0.x - 1.0, 1.0) * ((reinterpretedBits11 ? (fma(scalarValue12, fma(scalarValue9, varyingColor0.x, -scalarValue9), scalarValue9) * varyingColor0.w) : (scalarValue9 * varyingColor0.x)) * uintBitsToFloat(reinterpretedBits12.x));
    float multiplyAddValue19 = fma(reinterpretedBits18, varyingColor0.y - 1.0, 1.0) * ((reinterpretedBits11 ? (fma(scalarValue12, fma(scalarValue10, varyingColor0.y, -scalarValue10), scalarValue10) * varyingColor0.w) : (scalarValue10 * varyingColor0.y)) * uintBitsToFloat(reinterpretedBits12.y));
    float multiplyAddValue20 = fma(reinterpretedBits18, varyingColor0.z - 1.0, 1.0) * ((reinterpretedBits11 ? (fma(scalarValue12, fma(scalarValue11, varyingColor0.z, -scalarValue11), scalarValue11) * varyingColor0.w) : (scalarValue11 * varyingColor0.z)) * uintBitsToFloat(reinterpretedBits12.z));
    uvec4 reinterpretedBits19 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue21 = fma(varyingColor0.w, fma(multiplyAddValue18, uintBitsToFloat(reinterpretedBits19.x), -multiplyAddValue18), multiplyAddValue18);
    float multiplyAddValue22 = fma(varyingColor0.w, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits19.y), -multiplyAddValue19), multiplyAddValue19);
    float multiplyAddValue23 = fma(varyingColor0.w, fma(multiplyAddValue20, uintBitsToFloat(reinterpretedBits19.z), -multiplyAddValue20), multiplyAddValue20);
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue24 = fma(reinterpretedBits24, uintBitsToFloat(reinterpretedBits20.x) - multiplyAddValue21, multiplyAddValue21);
    float multiplyAddValue25 = fma(reinterpretedBits24, uintBitsToFloat(reinterpretedBits20.y) - multiplyAddValue22, multiplyAddValue22);
    float multiplyAddValue26 = fma(reinterpretedBits24, uintBitsToFloat(reinterpretedBits20.z) - multiplyAddValue23, multiplyAddValue23);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue24, varyingColor1.x, varyingColor2.x), multiplyAddValue24 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue25, varyingColor1.y, varyingColor2.y), multiplyAddValue25 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue26, varyingColor1.z, varyingColor2.z), multiplyAddValue26 * varyingColor1.z);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue16 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue17 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue13 = floor(multiplyAddValue17);
    float productValue41 = floor(multiplyAddValue17 * 0.25);
    float productValue42 = floor(multiplyAddValue17 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits25 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits9)) * (rdDot3Precise2(vec3(-(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3), -(inverseLengthValue1 * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits9), 0.0, 1.0);
    bool reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue12 = sampledTextureValue1.w;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    fragmentColor0.w = (((fma(fma(fma(fract(fma(floor(multiplyAddValue16 * 0.25), 0.5, (productValue41 * productValue41) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue16 * 0.5), 0.5, (productValue42 * productValue42) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue16), 0.5, (scalarValue13 * scalarValue13) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits25 * reinterpretedBits25) * fma(reinterpretedBits25, -2.0, 3.0))) && (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0)) ? 0.0 : ((reinterpretedBits11 ? 1.0 : scalarValue12) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])));
    float reinterpretedBits18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue18 = fma(reinterpretedBits18, varyingColor0.x - 1.0, 1.0) * ((reinterpretedBits11 ? (fma(scalarValue12, fma(scalarValue9, varyingColor0.x, -scalarValue9), scalarValue9) * varyingColor0.w) : (scalarValue9 * varyingColor0.x)) * uintBitsToFloat(reinterpretedBits12.x));
    float multiplyAddValue19 = fma(reinterpretedBits18, varyingColor0.y - 1.0, 1.0) * ((reinterpretedBits11 ? (fma(scalarValue12, fma(scalarValue10, varyingColor0.y, -scalarValue10), scalarValue10) * varyingColor0.w) : (scalarValue10 * varyingColor0.y)) * uintBitsToFloat(reinterpretedBits12.y));
    uvec4 reinterpretedBits19 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits26 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits19.x);
    float reinterpretedBits27 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits19.y);
    float reinterpretedBits28 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits19.z);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float scalarValue15 = ceil(multiplyAddValue19);
    float multiplyAddValue27 = fma(scalarValue15, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits29.x), -reinterpretedBits26), reinterpretedBits26);
    float multiplyAddValue28 = fma(scalarValue15, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits29.y), -reinterpretedBits27), reinterpretedBits27);
    float multiplyAddValue29 = fma(scalarValue15, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits29.z), -reinterpretedBits28), reinterpretedBits28);
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue30 = fma(reinterpretedBits24, uintBitsToFloat(reinterpretedBits20.x) - multiplyAddValue27, multiplyAddValue27);
    float multiplyAddValue31 = fma(reinterpretedBits24, uintBitsToFloat(reinterpretedBits20.y) - multiplyAddValue28, multiplyAddValue28);
    float multiplyAddValue32 = fma(reinterpretedBits24, uintBitsToFloat(reinterpretedBits20.z) - multiplyAddValue29, multiplyAddValue29);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue30, varyingColor1.x, varyingColor2.x), multiplyAddValue30 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue31, varyingColor1.y, varyingColor2.y), multiplyAddValue31 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue32, varyingColor1.z, varyingColor2.z), multiplyAddValue32 * varyingColor1.z);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = scalarValue * varyingColor0.x;
    float productValue1 = scalarValue1 * varyingColor0.y;
    float productValue6 = scalarValue2 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue4;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue3 = (((productValue - scalarValue) * scalarValue3) + scalarValue) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue1) * scalarValue3) + scalarValue1) * varyingColor0.w;
        productValue5 = (((productValue6 - scalarValue2) * scalarValue3) + scalarValue2) * varyingColor0.w;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue6;
        intermediateValue4 = scalarValue3;
    }
    float productValue7 = (fragmentVectorConstants1.packedValues[17u].x * productValue3) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue8 = (fragmentVectorConstants1.packedValues[17u].y * productValue4) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue9 = (fragmentVectorConstants1.packedValues[17u].z * productValue5) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue10 = (((productValue7 * fragmentVectorConstants1.packedValues[4u].x) - productValue7) * varyingColor0.w) + productValue7;
    float productValue11 = (((productValue8 * fragmentVectorConstants1.packedValues[4u].y) - productValue8) * varyingColor0.w) + productValue8;
    float productValue12 = (((productValue9 * fragmentVectorConstants1.packedValues[4u].z) - productValue9) * varyingColor0.w) + productValue9;
    float productValue13 = (((fragmentVectorConstants1.packedValues[9u].x - productValue10) * fragmentVectorConstants1.packedValues[9u].w) + productValue10) * varyingColor1.x;
    float productValue14 = (((fragmentVectorConstants1.packedValues[9u].y - productValue11) * fragmentVectorConstants1.packedValues[9u].w) + productValue11) * varyingColor1.y;
    float productValue15 = (((fragmentVectorConstants1.packedValues[9u].z - productValue12) * fragmentVectorConstants1.packedValues[9u].w) + productValue12) * varyingColor1.z;
    float comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue16 = floor(quotientValue1 * 0.25);
        float productValue17 = floor(quotientValue1 * 0.5);
        float scalarValue4 = floor(quotientValue1);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue17 * productValue17) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue16 * productValue16) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue4 * scalarValue4) * 0.75) + (floor(quotientValue) * 0.5)))) ? 0.0 : 1.0;
    }
    else
    {
        comparisonValue = 1.0;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.y = ((varyingColor2.y - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.z = ((varyingColor2.z - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.w = (fragmentVectorConstants1.packedValues[17u].w * intermediateValue4) * comparisonValue;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = scalarValue * varyingColor0.x;
    float productValue1 = scalarValue1 * varyingColor0.y;
    float productValue2;
    float productValue3;
    float intermediateValue3;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue2 = (((productValue - scalarValue) * scalarValue3) + scalarValue) * varyingColor0.w;
        productValue3 = (((productValue1 - scalarValue1) * scalarValue3) + scalarValue1) * varyingColor0.w;
        intermediateValue3 = 1.0;
    }
    else
    {
        productValue2 = productValue;
        productValue3 = productValue1;
        intermediateValue3 = scalarValue3;
    }
    float productValue43 = (fragmentVectorConstants1.packedValues[17u].x * productValue2) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue44 = (fragmentVectorConstants1.packedValues[17u].y * productValue3) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue45 = productValue43 * fragmentVectorConstants1.packedValues[4u].x;
    float productValue46 = productValue43 * fragmentVectorConstants1.packedValues[4u].y;
    float productValue47 = productValue43 * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue14 = ceil(productValue44);
    float productValue48 = (((productValue44 * fragmentVectorConstants1.packedValues[18u].x) - productValue45) * scalarValue14) + productValue45;
    float productValue49 = (((productValue44 * fragmentVectorConstants1.packedValues[18u].y) - productValue46) * scalarValue14) + productValue46;
    float productValue50 = (((productValue44 * fragmentVectorConstants1.packedValues[18u].z) - productValue47) * scalarValue14) + productValue47;
    float productValue51 = (((fragmentVectorConstants1.packedValues[9u].x - productValue48) * fragmentVectorConstants1.packedValues[9u].w) + productValue48) * varyingColor1.x;
    float productValue52 = (((fragmentVectorConstants1.packedValues[9u].y - productValue49) * fragmentVectorConstants1.packedValues[9u].w) + productValue49) * varyingColor1.y;
    float productValue53 = (((fragmentVectorConstants1.packedValues[9u].z - productValue50) * fragmentVectorConstants1.packedValues[9u].w) + productValue50) * varyingColor1.z;
    float comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue16 = floor(quotientValue1 * 0.25);
        float productValue17 = floor(quotientValue1 * 0.5);
        float scalarValue4 = floor(quotientValue1);
        comparisonValue = (((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue17 * productValue17) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue16 * productValue16) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue4 * scalarValue4) * 0.75) + (floor(quotientValue) * 0.5)))) ? 0.0 : 1.0;
    }
    else
    {
        comparisonValue = 1.0;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue51) * varyingColor2.w) + productValue51;
    fragmentColor0.y = ((varyingColor2.y - productValue52) * varyingColor2.w) + productValue52;
    fragmentColor0.z = ((varyingColor2.z - productValue53) * varyingColor2.w) + productValue53;
    fragmentColor0.w = (fragmentVectorConstants1.packedValues[17u].w * intermediateValue3) * comparisonValue;
#endif
}
