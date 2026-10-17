#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandColorGlint / AlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 2
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ItemInHandColorGlint/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM40
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    precise float productValue16 = inverseLengthValue1 * reinterpretedBits;
    precise float productValue17 = inverseLengthValue1 * reinterpretedBits1;
    precise float productValue18 = inverseLengthValue1 * reinterpretedBits2;
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits18 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x);
    precise float reinterpretedBits19 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y);
    precise float reinterpretedBits20 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z);
    float scalarValue3 = rdDot3Precise(vec3(-productValue16, -productValue17, -productValue18), vec3(reinterpretedBits18, reinterpretedBits19, reinterpretedBits20));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float reinterpretedBits21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits5;
    precise float sumValue = scalarValue3 - reinterpretedBits5;
    precise float quotientValue2 = 1.0 / reinterpretedBits21;
    precise float productValue19 = quotientValue2 * sumValue;
    float scalarValue4 = spvNClamp(productValue19, 0.0, 1.0);
    precise float productValue20 = scalarValue4 * scalarValue4;
    precise float multiplyAddValue14 = productValue20 * fma(scalarValue4, -2.0, 3.0);
    precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    precise float multiplyAddValue15 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x);
    precise float multiplyAddValue16 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    precise float quotientValue5 = multiplyAddValue15 / reinterpretedBits8;
    precise float quotientValue6 = multiplyAddValue16 / reinterpretedBits8;
    precise float productValue21 = floor(quotientValue5) * reinterpretedBits8;
    precise float productValue22 = floor(quotientValue6) * reinterpretedBits8;
    precise float productValue23 = productValue21 * 0.25;
    precise float productValue24 = productValue22 * 0.25;
    precise float productValue25 = productValue21 * 0.5;
    precise float productValue26 = productValue22 * 0.5;
    float scalarValue5 = floor(productValue24);
    float scalarValue6 = floor(productValue26);
    precise float productValue27 = scalarValue5 * scalarValue5;
    precise float productValue28 = scalarValue6 * scalarValue6;
    precise float productValue29 = productValue27 * 0.75;
    precise float productValue30 = productValue28 * 0.75;
    float scalarValue7 = floor(productValue22);
    precise float productValue31 = scalarValue7 * scalarValue7;
    precise float productValue32 = productValue31 * 0.75;
    precise float multiplyAddValue17 = fma(fma(fma(fract(fma(floor(productValue23), 0.5, productValue29)), 0.25, fract(fma(floor(productValue25), 0.5, productValue30))), 0.25, fract(fma(floor(productValue21), 0.5, productValue32))), 64.0, 0.5) * 0.015625;
    if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && (multiplyAddValue17 >= multiplyAddValue14))
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits), -(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float reinterpretedBits6 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits5)) * (reinterpretedBits4 - reinterpretedBits5), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    float multiplyAddValue = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue1 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue14 = floor(multiplyAddValue1 * 0.25);
    float productValue15 = floor(multiplyAddValue1 * 0.5);
    float scalarValue2 = floor(multiplyAddValue1);
    if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue14 * productValue14) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue15 * productValue15) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue2 * scalarValue2) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits6 * reinterpretedBits6) * fma(reinterpretedBits6, -2.0, 3.0))))
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
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue12 = floor(quotientValue1 * 0.25);
        float productValue13 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue13 * productValue13) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue12 * productValue12) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue36 = productValue * fragmentVectorConstants1.packedValues[4u].x;
    float productValue37 = productValue * fragmentVectorConstants1.packedValues[4u].y;
    float productValue38 = productValue * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue8 = ceil(productValue1);
    float productValue39 = (((productValue1 * fragmentVectorConstants1.packedValues[17u].x) - productValue36) * scalarValue8) + productValue36;
    float productValue40 = (((productValue1 * fragmentVectorConstants1.packedValues[17u].y) - productValue37) * scalarValue8) + productValue37;
    float productValue41 = (((productValue1 * fragmentVectorConstants1.packedValues[17u].z) - productValue38) * scalarValue8) + productValue38;
    vec4 sampledTextureValue = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue1 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue42 = (fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[18u].x) * (sampledTextureValue1.x + sampledTextureValue.x);
    float productValue43 = (fragmentVectorConstants1.packedValues[16u].y * fragmentVectorConstants1.packedValues[18u].y) * (sampledTextureValue1.y + sampledTextureValue.y);
    float productValue44 = (fragmentVectorConstants1.packedValues[16u].z * fragmentVectorConstants1.packedValues[18u].z) * (sampledTextureValue1.z + sampledTextureValue.z);
    float productValue45 = (productValue42 * productValue42) + ((((fragmentVectorConstants1.packedValues[9u].x - productValue39) * fragmentVectorConstants1.packedValues[9u].w) + productValue39) * varyingColor1.x);
    float productValue46 = (productValue43 * productValue43) + ((((fragmentVectorConstants1.packedValues[9u].y - productValue40) * fragmentVectorConstants1.packedValues[9u].w) + productValue40) * varyingColor1.y);
    float productValue47 = (productValue44 * productValue44) + ((((fragmentVectorConstants1.packedValues[9u].z - productValue41) * fragmentVectorConstants1.packedValues[9u].w) + productValue41) * varyingColor1.z);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue12 = floor(quotientValue1 * 0.25);
        float productValue13 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue13 * productValue13) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue12 * productValue12) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    precise float sumValue3 = varyingColor0.z - 1.0;
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue18 = fma(reinterpretedBits9, sumValue1, 1.0);
    float multiplyAddValue19 = fma(reinterpretedBits9, sumValue2, 1.0);
    float multiplyAddValue20 = fma(reinterpretedBits9, sumValue3, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue21 = fma(varyingColor0.w, fma(multiplyAddValue18, uintBitsToFloat(reinterpretedBits10.x), -multiplyAddValue18), multiplyAddValue18);
    float multiplyAddValue22 = fma(varyingColor0.w, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits10.y), -multiplyAddValue19), multiplyAddValue19);
    float multiplyAddValue23 = fma(varyingColor0.w, fma(multiplyAddValue20, uintBitsToFloat(reinterpretedBits10.z), -multiplyAddValue20), multiplyAddValue20);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits22 = uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue21;
    precise float reinterpretedBits23 = uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue22;
    precise float reinterpretedBits24 = uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue23;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    precise float multiplyAddValue24 = fma(reinterpretedBits12, reinterpretedBits22, multiplyAddValue21) * varyingColor1.x;
    precise float multiplyAddValue25 = fma(reinterpretedBits12, reinterpretedBits23, multiplyAddValue22) * varyingColor1.y;
    precise float multiplyAddValue26 = fma(reinterpretedBits12, reinterpretedBits24, multiplyAddValue23) * varyingColor1.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits13.x);
    float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits13.y);
    float reinterpretedBits16 = uintBitsToFloat(reinterpretedBits13.z);
    precise float productValue33 = sampledTextureValue3.x * reinterpretedBits14;
    precise float productValue34 = sampledTextureValue3.y * reinterpretedBits15;
    precise float productValue35 = sampledTextureValue3.z * reinterpretedBits16;
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float multiplyAddValue27 = fma(sampledTextureValue2.x, reinterpretedBits14, productValue33) * uintBitsToFloat(reinterpretedBits17.x);
    precise float multiplyAddValue28 = fma(sampledTextureValue2.y, reinterpretedBits15, productValue34) * uintBitsToFloat(reinterpretedBits17.y);
    precise float multiplyAddValue29 = fma(sampledTextureValue2.z, reinterpretedBits16, productValue35) * uintBitsToFloat(reinterpretedBits17.z);
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
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue18 = fma(reinterpretedBits9, sumValue1, 1.0);
    float multiplyAddValue19 = fma(reinterpretedBits9, sumValue2, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    precise float reinterpretedBits29 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits10.x);
    precise float reinterpretedBits30 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits10.y);
    precise float reinterpretedBits31 = multiplyAddValue18 * uintBitsToFloat(reinterpretedBits10.z);
    float scalarValue10 = ceil(multiplyAddValue19);
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue42 = fma(scalarValue10, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits17.x), -reinterpretedBits29), reinterpretedBits29);
    float multiplyAddValue43 = fma(scalarValue10, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits17.y), -reinterpretedBits30), reinterpretedBits30);
    float multiplyAddValue44 = fma(scalarValue10, fma(multiplyAddValue19, uintBitsToFloat(reinterpretedBits17.z), -reinterpretedBits31), reinterpretedBits31);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits32 = uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue42;
    precise float reinterpretedBits33 = uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue43;
    precise float reinterpretedBits34 = uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue44;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    precise float multiplyAddValue45 = fma(reinterpretedBits12, reinterpretedBits32, multiplyAddValue42) * varyingColor1.x;
    precise float multiplyAddValue46 = fma(reinterpretedBits12, reinterpretedBits33, multiplyAddValue43) * varyingColor1.y;
    precise float multiplyAddValue47 = fma(reinterpretedBits12, reinterpretedBits34, multiplyAddValue44) * varyingColor1.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits13.x);
    float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits13.y);
    float reinterpretedBits16 = uintBitsToFloat(reinterpretedBits13.z);
    precise float productValue33 = sampledTextureValue3.x * reinterpretedBits14;
    precise float productValue34 = sampledTextureValue3.y * reinterpretedBits15;
    precise float productValue35 = sampledTextureValue3.z * reinterpretedBits16;
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    precise float multiplyAddValue48 = fma(sampledTextureValue2.x, reinterpretedBits14, productValue33) * uintBitsToFloat(reinterpretedBits28.x);
    precise float multiplyAddValue49 = fma(sampledTextureValue2.y, reinterpretedBits15, productValue34) * uintBitsToFloat(reinterpretedBits28.y);
    precise float multiplyAddValue50 = fma(sampledTextureValue2.z, reinterpretedBits16, productValue35) * uintBitsToFloat(reinterpretedBits28.z);
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
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue2 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue4 = fma(reinterpretedBits9, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue5 = fma(varyingColor0.w, fma(multiplyAddValue2, uintBitsToFloat(reinterpretedBits10.x), -multiplyAddValue2), multiplyAddValue2);
    float multiplyAddValue6 = fma(varyingColor0.w, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits10.y), -multiplyAddValue3), multiplyAddValue3);
    float multiplyAddValue7 = fma(varyingColor0.w, fma(multiplyAddValue4, uintBitsToFloat(reinterpretedBits10.z), -multiplyAddValue4), multiplyAddValue4);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits13.x);
    float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits13.y);
    float reinterpretedBits16 = uintBitsToFloat(reinterpretedBits13.z);
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue8 = fma(sampledTextureValue2.x, reinterpretedBits14, sampledTextureValue3.x * reinterpretedBits14) * uintBitsToFloat(reinterpretedBits17.x);
    float multiplyAddValue9 = fma(sampledTextureValue2.y, reinterpretedBits15, sampledTextureValue3.y * reinterpretedBits15) * uintBitsToFloat(reinterpretedBits17.y);
    float multiplyAddValue10 = fma(sampledTextureValue2.z, reinterpretedBits16, sampledTextureValue3.z * reinterpretedBits16) * uintBitsToFloat(reinterpretedBits17.z);
    float multiplyAddValue11 = fma(multiplyAddValue8, multiplyAddValue8, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue5, multiplyAddValue5) * varyingColor1.x);
    float multiplyAddValue12 = fma(multiplyAddValue9, multiplyAddValue9, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue6, multiplyAddValue6) * varyingColor1.y);
    float multiplyAddValue13 = fma(multiplyAddValue10, multiplyAddValue10, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue7, multiplyAddValue7) * varyingColor1.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue11, multiplyAddValue11);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue12, multiplyAddValue12);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue13, multiplyAddValue13);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue2 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits25 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits10.x);
    float reinterpretedBits26 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits10.y);
    float reinterpretedBits27 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits10.z);
    float scalarValue9 = ceil(multiplyAddValue3);
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue33 = fma(scalarValue9, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits17.x), -reinterpretedBits25), reinterpretedBits25);
    float multiplyAddValue34 = fma(scalarValue9, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits17.y), -reinterpretedBits26), reinterpretedBits26);
    float multiplyAddValue35 = fma(scalarValue9, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits17.z), -reinterpretedBits27), reinterpretedBits27);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits13.x);
    float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits13.y);
    float reinterpretedBits16 = uintBitsToFloat(reinterpretedBits13.z);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue36 = fma(sampledTextureValue2.x, reinterpretedBits14, sampledTextureValue3.x * reinterpretedBits14) * uintBitsToFloat(reinterpretedBits28.x);
    float multiplyAddValue37 = fma(sampledTextureValue2.y, reinterpretedBits15, sampledTextureValue3.y * reinterpretedBits15) * uintBitsToFloat(reinterpretedBits28.y);
    float multiplyAddValue38 = fma(sampledTextureValue2.z, reinterpretedBits16, sampledTextureValue3.z * reinterpretedBits16) * uintBitsToFloat(reinterpretedBits28.z);
    float multiplyAddValue39 = fma(multiplyAddValue36, multiplyAddValue36, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue33, multiplyAddValue33) * varyingColor1.x);
    float multiplyAddValue40 = fma(multiplyAddValue37, multiplyAddValue37, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue34, multiplyAddValue34) * varyingColor1.y);
    float multiplyAddValue41 = fma(multiplyAddValue38, multiplyAddValue38, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue35, multiplyAddValue35) * varyingColor1.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue39, multiplyAddValue39);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue40, multiplyAddValue40);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue41, multiplyAddValue41);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue45) * varyingColor2.w) + productValue45;
    fragmentColor0.y = ((varyingColor2.y - productValue46) * varyingColor2.w) + productValue46;
    fragmentColor0.z = ((varyingColor2.z - productValue47) * varyingColor2.w) + productValue47;
#endif
    fragmentColor0.w = 1.0;
    discardIfRequested();
}
