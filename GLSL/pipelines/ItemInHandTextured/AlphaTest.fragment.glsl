#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandTextured / AlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ItemInHandTextured/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    precise float productValue6 = scalarValue * varyingColor0.x;
    precise float productValue7 = scalarValue1 * varyingColor0.y;
    precise float productValue8 = scalarValue2 * varyingColor0.z;
    precise float multiplyAddValue11 = fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w;
    precise float multiplyAddValue12 = fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w;
    precise float multiplyAddValue13 = fma(scalarValue3, fma(scalarValue2, varyingColor0.z, -scalarValue2), scalarValue2) * varyingColor0.w;
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float reinterpretedBits16 = (reinterpretedBits ? multiplyAddValue11 : productValue6) * uintBitsToFloat(reinterpretedBits1.x);
    precise float reinterpretedBits17 = (reinterpretedBits ? multiplyAddValue12 : productValue7) * uintBitsToFloat(reinterpretedBits1.y);
    precise float reinterpretedBits18 = (reinterpretedBits ? multiplyAddValue13 : productValue8) * uintBitsToFloat(reinterpretedBits1.z);
    precise float reinterpretedBits19 = (reinterpretedBits ? 1.0 : scalarValue3) * uintBitsToFloat(reinterpretedBits1.w);
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits3, reinterpretedBits4, reinterpretedBits5);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue9 = inverseLengthValue * reinterpretedBits3;
    precise float productValue10 = inverseLengthValue * reinterpretedBits4;
    precise float productValue11 = inverseLengthValue * reinterpretedBits5;
    uvec4 reinterpretedBits6 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits20 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits6.x);
    precise float reinterpretedBits21 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits6.y);
    precise float reinterpretedBits22 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits6.z);
    float scalarValue6 = rdDot3Precise(vec3(-productValue9, -productValue10, -productValue11), vec3(reinterpretedBits20, reinterpretedBits21, reinterpretedBits22));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits8;
    precise float sumValue = scalarValue6 - reinterpretedBits8;
    precise float quotientValue = 1.0 / reinterpretedBits23;
    precise float productValue12 = quotientValue * sumValue;
    float scalarValue7 = spvNClamp(productValue12, 0.0, 1.0);
    precise float productValue13 = scalarValue7 * scalarValue7;
    precise float multiplyAddValue14 = productValue13 * fma(scalarValue7, -2.0, 3.0);
    precise float quotientValue1 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue2 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue15 = fma(quotientValue1, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits10.x);
    precise float multiplyAddValue16 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits10.y);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue3 = multiplyAddValue15 / reinterpretedBits11;
    precise float quotientValue4 = multiplyAddValue16 / reinterpretedBits11;
    precise float productValue14 = floor(quotientValue3) * reinterpretedBits11;
    precise float productValue15 = floor(quotientValue4) * reinterpretedBits11;
    precise float productValue16 = productValue14 * 0.25;
    precise float productValue17 = productValue15 * 0.25;
    precise float productValue18 = productValue14 * 0.5;
    precise float productValue19 = productValue15 * 0.5;
    float scalarValue8 = floor(productValue17);
    float scalarValue9 = floor(productValue19);
    precise float productValue20 = scalarValue8 * scalarValue8;
    precise float productValue21 = scalarValue9 * scalarValue9;
    precise float productValue22 = productValue20 * 0.75;
    precise float productValue23 = productValue21 * 0.75;
    float scalarValue10 = floor(productValue15);
    precise float productValue24 = scalarValue10 * scalarValue10;
    precise float productValue25 = productValue24 * 0.75;
    precise float multiplyAddValue17 = fma(fma(fma(fract(fma(floor(productValue16), 0.5, productValue22)), 0.25, fract(fma(floor(productValue18), 0.5, productValue23))), 0.25, fract(fma(floor(productValue14), 0.5, productValue25))), 64.0, 0.5) * 0.015625;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue17 >= multiplyAddValue14)) || (reinterpretedBits19 < 0.5))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    precise float productValue6 = scalarValue * varyingColor0.x;
    precise float productValue7 = scalarValue1 * varyingColor0.y;
    precise float multiplyAddValue11 = fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w;
    precise float multiplyAddValue12 = fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w;
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float reinterpretedBits16 = (reinterpretedBits ? multiplyAddValue11 : productValue6) * uintBitsToFloat(reinterpretedBits1.x);
    precise float reinterpretedBits17 = (reinterpretedBits ? multiplyAddValue12 : productValue7) * uintBitsToFloat(reinterpretedBits1.y);
    precise float reinterpretedBits32 = (reinterpretedBits ? 1.0 : scalarValue3) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits3, reinterpretedBits4, reinterpretedBits5);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue9 = inverseLengthValue * reinterpretedBits3;
    precise float productValue10 = inverseLengthValue * reinterpretedBits4;
    precise float productValue11 = inverseLengthValue * reinterpretedBits5;
    uvec4 reinterpretedBits6 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits20 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits6.x);
    precise float reinterpretedBits21 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits6.y);
    precise float reinterpretedBits22 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits6.z);
    float scalarValue6 = rdDot3Precise(vec3(-productValue9, -productValue10, -productValue11), vec3(reinterpretedBits20, reinterpretedBits21, reinterpretedBits22));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits8;
    precise float sumValue = scalarValue6 - reinterpretedBits8;
    precise float quotientValue = 1.0 / reinterpretedBits23;
    precise float productValue12 = quotientValue * sumValue;
    float scalarValue7 = spvNClamp(productValue12, 0.0, 1.0);
    precise float productValue13 = scalarValue7 * scalarValue7;
    precise float multiplyAddValue14 = productValue13 * fma(scalarValue7, -2.0, 3.0);
    precise float quotientValue1 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue2 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue15 = fma(quotientValue1, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits10.x);
    precise float multiplyAddValue16 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits10.y);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue3 = multiplyAddValue15 / reinterpretedBits11;
    precise float quotientValue4 = multiplyAddValue16 / reinterpretedBits11;
    precise float productValue14 = floor(quotientValue3) * reinterpretedBits11;
    precise float productValue15 = floor(quotientValue4) * reinterpretedBits11;
    precise float productValue16 = productValue14 * 0.25;
    precise float productValue17 = productValue15 * 0.25;
    precise float productValue18 = productValue14 * 0.5;
    precise float productValue19 = productValue15 * 0.5;
    float scalarValue8 = floor(productValue17);
    float scalarValue9 = floor(productValue19);
    precise float productValue20 = scalarValue8 * scalarValue8;
    precise float productValue21 = scalarValue9 * scalarValue9;
    precise float productValue22 = productValue20 * 0.75;
    precise float productValue23 = productValue21 * 0.75;
    float scalarValue10 = floor(productValue15);
    precise float productValue24 = scalarValue10 * scalarValue10;
    precise float productValue25 = productValue24 * 0.75;
    precise float multiplyAddValue17 = fma(fma(fma(fract(fma(floor(productValue16), 0.5, productValue22)), 0.25, fract(fma(floor(productValue18), 0.5, productValue23))), 0.25, fract(fma(floor(productValue14), 0.5, productValue25))), 64.0, 0.5) * 0.015625;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue17 >= multiplyAddValue14)) || (reinterpretedBits32 < 0.5))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits2 = (reinterpretedBits ? 1.0 : scalarValue3) * uintBitsToFloat(reinterpretedBits1.w);
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits3, reinterpretedBits4, reinterpretedBits5);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits6 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits7 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4), -(inverseLengthValue * reinterpretedBits5)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits6.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits6.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits6.z)));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits9 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits8)) * (reinterpretedBits7 - reinterpretedBits8), 0.0, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits10.x)) / reinterpretedBits11) * reinterpretedBits11;
    float multiplyAddValue1 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits10.y)) / reinterpretedBits11) * reinterpretedBits11;
    float productValue = floor(multiplyAddValue1 * 0.25);
    float productValue1 = floor(multiplyAddValue1 * 0.5);
    float scalarValue5 = floor(multiplyAddValue1);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue * productValue) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue1 * productValue1) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue5 * scalarValue5) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits9 * reinterpretedBits9) * fma(reinterpretedBits9, -2.0, 3.0)))) || (reinterpretedBits2 < 0.5))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits27 = (reinterpretedBits ? 1.0 : scalarValue3) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits3, reinterpretedBits4, reinterpretedBits5);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits6 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits7 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4), -(inverseLengthValue * reinterpretedBits5)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits6.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits6.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits6.z)));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits9 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits8)) * (reinterpretedBits7 - reinterpretedBits8), 0.0, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits10.x)) / reinterpretedBits11) * reinterpretedBits11;
    float multiplyAddValue1 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits10.y)) / reinterpretedBits11) * reinterpretedBits11;
    float productValue = floor(multiplyAddValue1 * 0.25);
    float productValue1 = floor(multiplyAddValue1 * 0.5);
    float scalarValue5 = floor(multiplyAddValue1);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue * productValue) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue1 * productValue1) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue5 * scalarValue5) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits9 * reinterpretedBits9) * fma(reinterpretedBits9, -2.0, 3.0)))) || (reinterpretedBits27 < 0.5))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue1.x;
    float scalarValue12 = sampledTextureValue1.y;
    float scalarValue13 = sampledTextureValue1.z;
    float scalarValue14 = sampledTextureValue1.w;
    float productValue29 = scalarValue11 * varyingColor0.x;
    float productValue30 = scalarValue12 * varyingColor0.y;
    float productValue31 = scalarValue13 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue4;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue3 = (((productValue29 - scalarValue11) * scalarValue14) + scalarValue11) * varyingColor0.w;
        productValue4 = (((productValue30 - scalarValue12) * scalarValue14) + scalarValue12) * varyingColor0.w;
        productValue5 = (((productValue31 - scalarValue13) * scalarValue14) + scalarValue13) * varyingColor0.w;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue3 = productValue29;
        productValue4 = productValue30;
        productValue5 = productValue31;
        intermediateValue4 = scalarValue14;
    }
    float productValue32 = fragmentVectorConstants1.packedValues[17u].w * intermediateValue4;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue5 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue6 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue33 = floor(quotientValue6 * 0.25);
        float productValue34 = floor(quotientValue6 * 0.5);
        float scalarValue15 = floor(quotientValue6);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue34 * productValue34) * 0.75) + (floor(quotientValue5 * 0.5) * 0.5)) + (fract(((productValue33 * productValue33) * 0.75) + (floor(quotientValue5 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue15 * scalarValue15) * 0.75) + (floor(quotientValue5) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((productValue32 < 0.5) || comparisonValue)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue1.x;
    float scalarValue12 = sampledTextureValue1.y;
    float scalarValue14 = sampledTextureValue1.w;
    float productValue29 = scalarValue11 * varyingColor0.x;
    float productValue30 = scalarValue12 * varyingColor0.y;
    float productValue2;
    float productValue3;
    float intermediateValue3;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue2 = (((productValue29 - scalarValue11) * scalarValue14) + scalarValue11) * varyingColor0.w;
        productValue3 = (((productValue30 - scalarValue12) * scalarValue14) + scalarValue12) * varyingColor0.w;
        intermediateValue3 = 1.0;
    }
    else
    {
        productValue2 = productValue29;
        productValue3 = productValue30;
        intermediateValue3 = scalarValue14;
    }
    float productValue44 = fragmentVectorConstants1.packedValues[17u].w * intermediateValue3;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue5 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue6 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue33 = floor(quotientValue6 * 0.25);
        float productValue34 = floor(quotientValue6 * 0.5);
        float scalarValue15 = floor(quotientValue6);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue34 * productValue34) * 0.75) + (floor(quotientValue5 * 0.5) * 0.5)) + (fract(((productValue33 * productValue33) * 0.75) + (floor(quotientValue5 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue15 * scalarValue15) * 0.75) + (floor(quotientValue5) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((productValue44 < 0.5) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    precise float sumValue3 = varyingColor0.z - 1.0;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float multiplyAddValue18 = reinterpretedBits16 * fma(reinterpretedBits12, sumValue1, 1.0);
    precise float multiplyAddValue19 = reinterpretedBits17 * fma(reinterpretedBits12, sumValue2, 1.0);
    precise float multiplyAddValue20 = reinterpretedBits18 * fma(reinterpretedBits12, sumValue3, 1.0);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue21 = fma(varyingColor0.w, fma(multiplyAddValue18, uintBitsToFloat(reinterpretedBits13.x), -multiplyAddValue18), multiplyAddValue18);
    float multiplyAddValue22 = fma(varyingColor0.w, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits13.y), -multiplyAddValue19), multiplyAddValue19);
    float multiplyAddValue23 = fma(varyingColor0.w, fma(multiplyAddValue20, uintBitsToFloat(reinterpretedBits13.z), -multiplyAddValue20), multiplyAddValue20);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits24 = uintBitsToFloat(reinterpretedBits14.x) - multiplyAddValue21;
    precise float reinterpretedBits25 = uintBitsToFloat(reinterpretedBits14.y) - multiplyAddValue22;
    precise float reinterpretedBits26 = uintBitsToFloat(reinterpretedBits14.z) - multiplyAddValue23;
    float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue24 = fma(reinterpretedBits15, reinterpretedBits24, multiplyAddValue21);
    float multiplyAddValue25 = fma(reinterpretedBits15, reinterpretedBits25, multiplyAddValue22);
    float multiplyAddValue26 = fma(reinterpretedBits15, reinterpretedBits26, multiplyAddValue23);
    precise float productValue26 = multiplyAddValue24 * varyingColor1.x;
    precise float productValue27 = multiplyAddValue25 * varyingColor1.y;
    precise float productValue28 = multiplyAddValue26 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue24, varyingColor1.x, varyingColor2.x), productValue26);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue25, varyingColor1.y, varyingColor2.y), productValue27);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue26, varyingColor1.z, varyingColor2.z), productValue28);
    fragmentColor0.w = reinterpretedBits19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float multiplyAddValue18 = reinterpretedBits16 * fma(reinterpretedBits12, sumValue1, 1.0);
    precise float multiplyAddValue19 = reinterpretedBits17 * fma(reinterpretedBits12, sumValue2, 1.0);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    precise float reinterpretedBits33 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits34 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits35 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue18 = ceil(multiplyAddValue19);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue33 = fma(scalarValue18, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits31.x), -reinterpretedBits33), reinterpretedBits33);
    float multiplyAddValue34 = fma(scalarValue18, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits31.y), -reinterpretedBits34), reinterpretedBits34);
    float multiplyAddValue35 = fma(scalarValue18, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits31.z), -reinterpretedBits35), reinterpretedBits35);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits36 = uintBitsToFloat(reinterpretedBits14.x) - multiplyAddValue33;
    precise float reinterpretedBits37 = uintBitsToFloat(reinterpretedBits14.y) - multiplyAddValue34;
    precise float reinterpretedBits38 = uintBitsToFloat(reinterpretedBits14.z) - multiplyAddValue35;
    float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue36 = fma(reinterpretedBits15, reinterpretedBits36, multiplyAddValue33);
    float multiplyAddValue37 = fma(reinterpretedBits15, reinterpretedBits37, multiplyAddValue34);
    float multiplyAddValue38 = fma(reinterpretedBits15, reinterpretedBits38, multiplyAddValue35);
    precise float productValue56 = multiplyAddValue36 * varyingColor1.x;
    precise float productValue57 = multiplyAddValue37 * varyingColor1.y;
    precise float productValue58 = multiplyAddValue38 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue36, varyingColor1.x, varyingColor2.x), productValue56);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue37, varyingColor1.y, varyingColor2.y), productValue57);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue38, varyingColor1.z, varyingColor2.z), productValue58);
    fragmentColor0.w = reinterpretedBits32;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue2 = ((reinterpretedBits ? (fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w) : (scalarValue * varyingColor0.x)) * uintBitsToFloat(reinterpretedBits1.x)) * fma(reinterpretedBits12, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = ((reinterpretedBits ? (fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w) : (scalarValue1 * varyingColor0.y)) * uintBitsToFloat(reinterpretedBits1.y)) * fma(reinterpretedBits12, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue4 = ((reinterpretedBits ? (fma(scalarValue3, fma(scalarValue2, varyingColor0.z, -scalarValue2), scalarValue2) * varyingColor0.w) : (scalarValue2 * varyingColor0.z)) * uintBitsToFloat(reinterpretedBits1.z)) * fma(reinterpretedBits12, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue5 = fma(varyingColor0.w, fma(multiplyAddValue2, uintBitsToFloat(reinterpretedBits13.x), -multiplyAddValue2), multiplyAddValue2);
    float multiplyAddValue6 = fma(varyingColor0.w, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits13.y), -multiplyAddValue3), multiplyAddValue3);
    float multiplyAddValue7 = fma(varyingColor0.w, fma(multiplyAddValue4, uintBitsToFloat(reinterpretedBits13.z), -multiplyAddValue4), multiplyAddValue4);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue8 = fma(reinterpretedBits15, uintBitsToFloat(reinterpretedBits14.x) - multiplyAddValue5, multiplyAddValue5);
    float multiplyAddValue9 = fma(reinterpretedBits15, uintBitsToFloat(reinterpretedBits14.y) - multiplyAddValue6, multiplyAddValue6);
    float multiplyAddValue10 = fma(reinterpretedBits15, uintBitsToFloat(reinterpretedBits14.z) - multiplyAddValue7, multiplyAddValue7);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue8, varyingColor1.x, varyingColor2.x), multiplyAddValue8 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue9, varyingColor1.y, varyingColor2.y), multiplyAddValue9 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue10, varyingColor1.z, varyingColor2.z), multiplyAddValue10 * varyingColor1.z);
    fragmentColor0.w = reinterpretedBits2;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue2 = ((reinterpretedBits ? (fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w) : (scalarValue * varyingColor0.x)) * uintBitsToFloat(reinterpretedBits1.x)) * fma(reinterpretedBits12, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = ((reinterpretedBits ? (fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w) : (scalarValue1 * varyingColor0.y)) * uintBitsToFloat(reinterpretedBits1.y)) * fma(reinterpretedBits12, varyingColor0.y - 1.0, 1.0);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits28 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits13.x);
    float reinterpretedBits29 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits13.y);
    float reinterpretedBits30 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue17 = ceil(multiplyAddValue3);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue27 = fma(scalarValue17, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits31.x), -reinterpretedBits28), reinterpretedBits28);
    float multiplyAddValue28 = fma(scalarValue17, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits31.y), -reinterpretedBits29), reinterpretedBits29);
    float multiplyAddValue29 = fma(scalarValue17, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits31.z), -reinterpretedBits30), reinterpretedBits30);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue30 = fma(reinterpretedBits15, uintBitsToFloat(reinterpretedBits14.x) - multiplyAddValue27, multiplyAddValue27);
    float multiplyAddValue31 = fma(reinterpretedBits15, uintBitsToFloat(reinterpretedBits14.y) - multiplyAddValue28, multiplyAddValue28);
    float multiplyAddValue32 = fma(reinterpretedBits15, uintBitsToFloat(reinterpretedBits14.z) - multiplyAddValue29, multiplyAddValue29);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue30, varyingColor1.x, varyingColor2.x), multiplyAddValue30 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue31, varyingColor1.y, varyingColor2.y), multiplyAddValue31 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue32, varyingColor1.z, varyingColor2.z), multiplyAddValue32 * varyingColor1.z);
    fragmentColor0.w = reinterpretedBits27;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue35 = (fragmentVectorConstants1.packedValues[17u].x * productValue3) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue36 = (fragmentVectorConstants1.packedValues[17u].y * productValue4) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue37 = (fragmentVectorConstants1.packedValues[17u].z * productValue5) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue38 = (((productValue35 * fragmentVectorConstants1.packedValues[4u].x) - productValue35) * varyingColor0.w) + productValue35;
    float productValue39 = (((productValue36 * fragmentVectorConstants1.packedValues[4u].y) - productValue36) * varyingColor0.w) + productValue36;
    float productValue40 = (((productValue37 * fragmentVectorConstants1.packedValues[4u].z) - productValue37) * varyingColor0.w) + productValue37;
    float productValue41 = (((fragmentVectorConstants1.packedValues[9u].x - productValue38) * fragmentVectorConstants1.packedValues[9u].w) + productValue38) * varyingColor1.x;
    float productValue42 = (((fragmentVectorConstants1.packedValues[9u].y - productValue39) * fragmentVectorConstants1.packedValues[9u].w) + productValue39) * varyingColor1.y;
    float productValue43 = (((fragmentVectorConstants1.packedValues[9u].z - productValue40) * fragmentVectorConstants1.packedValues[9u].w) + productValue40) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue41) * varyingColor2.w) + productValue41;
    fragmentColor0.y = ((varyingColor2.y - productValue42) * varyingColor2.w) + productValue42;
    fragmentColor0.z = ((varyingColor2.z - productValue43) * varyingColor2.w) + productValue43;
    fragmentColor0.w = productValue32;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue45 = (fragmentVectorConstants1.packedValues[17u].x * productValue2) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue46 = (fragmentVectorConstants1.packedValues[17u].y * productValue3) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue47 = productValue45 * fragmentVectorConstants1.packedValues[4u].x;
    float productValue48 = productValue45 * fragmentVectorConstants1.packedValues[4u].y;
    float productValue49 = productValue45 * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue16 = ceil(productValue46);
    float productValue50 = (((productValue46 * fragmentVectorConstants1.packedValues[18u].x) - productValue47) * scalarValue16) + productValue47;
    float productValue51 = (((productValue46 * fragmentVectorConstants1.packedValues[18u].y) - productValue48) * scalarValue16) + productValue48;
    float productValue52 = (((productValue46 * fragmentVectorConstants1.packedValues[18u].z) - productValue49) * scalarValue16) + productValue49;
    float productValue53 = (((fragmentVectorConstants1.packedValues[9u].x - productValue50) * fragmentVectorConstants1.packedValues[9u].w) + productValue50) * varyingColor1.x;
    float productValue54 = (((fragmentVectorConstants1.packedValues[9u].y - productValue51) * fragmentVectorConstants1.packedValues[9u].w) + productValue51) * varyingColor1.y;
    float productValue55 = (((fragmentVectorConstants1.packedValues[9u].z - productValue52) * fragmentVectorConstants1.packedValues[9u].w) + productValue52) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue53) * varyingColor2.w) + productValue53;
    fragmentColor0.y = ((varyingColor2.y - productValue54) * varyingColor2.w) + productValue54;
    fragmentColor0.z = ((varyingColor2.z - productValue55) * varyingColor2.w) + productValue55;
    fragmentColor0.w = productValue44;
#endif
    discardIfRequested();
}
