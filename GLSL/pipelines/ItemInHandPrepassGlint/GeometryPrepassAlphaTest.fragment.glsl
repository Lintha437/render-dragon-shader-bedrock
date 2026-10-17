#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandPrepassGlint / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ItemInHandPrepassGlint/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue2 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue2 = inversesqrt(scalarValue2);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue2 * reinterpretedBits), -(inverseLengthValue2 * reinterpretedBits1), -(inverseLengthValue2 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits6 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[85u])) - reinterpretedBits5)) * (reinterpretedBits4 - reinterpretedBits5), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[24u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[86u]));
    float multiplyAddValue2 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue3 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue39 = floor(multiplyAddValue3 * 0.25);
    float productValue40 = floor(multiplyAddValue3 * 0.5);
    float scalarValue3 = floor(multiplyAddValue3);
    if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[100u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue2 * 0.25), 0.5, (productValue39 * productValue39) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue2 * 0.5), 0.5, (productValue40 * productValue40) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue2), 0.5, (scalarValue3 * scalarValue3) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits6 * reinterpretedBits6) * fma(reinterpretedBits6, -2.0, 3.0))))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue2 = (fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.z + (-1.0))) + 1.0;
    float productValue3 = (((productValue * fragmentVectorConstants1.packedValues[4u].x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * fragmentVectorConstants1.packedValues[4u].y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * fragmentVectorConstants1.packedValues[4u].z) - productValue2) * varyingColor0.w) + productValue2;
    vec4 sampledTextureValue = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue1 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue6 = (fragmentVectorConstants1.packedValues[26u].x * fragmentVectorConstants1.packedValues[27u].x) * (sampledTextureValue1.x + sampledTextureValue.x);
    float productValue7 = (fragmentVectorConstants1.packedValues[26u].y * fragmentVectorConstants1.packedValues[27u].y) * (sampledTextureValue1.y + sampledTextureValue.y);
    float productValue8 = (fragmentVectorConstants1.packedValues[26u].z * fragmentVectorConstants1.packedValues[27u].z) * (sampledTextureValue1.z + sampledTextureValue.z);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[21u].x) / (fragmentVectorConstants1.packedValues[21u].y - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].x) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].y) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float productValue9 = floor(quotientValue1 * 0.25);
        float productValue10 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue10 * productValue10) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue9 * productValue9) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue25 = productValue * fragmentVectorConstants1.packedValues[4u].x;
    float productValue26 = productValue * fragmentVectorConstants1.packedValues[4u].y;
    float productValue27 = productValue * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue1 = ceil(productValue1);
    float productValue28 = (((productValue1 * fragmentVectorConstants1.packedValues[27u].x) - productValue25) * scalarValue1) + productValue25;
    float productValue29 = (((productValue1 * fragmentVectorConstants1.packedValues[27u].y) - productValue26) * scalarValue1) + productValue26;
    float productValue30 = (((productValue1 * fragmentVectorConstants1.packedValues[27u].z) - productValue27) * scalarValue1) + productValue27;
    vec4 sampledTextureValue = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue1 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue31 = (fragmentVectorConstants1.packedValues[26u].x * fragmentVectorConstants1.packedValues[28u].x) * (sampledTextureValue1.x + sampledTextureValue.x);
    float productValue32 = (fragmentVectorConstants1.packedValues[26u].y * fragmentVectorConstants1.packedValues[28u].y) * (sampledTextureValue1.y + sampledTextureValue.y);
    float productValue33 = (fragmentVectorConstants1.packedValues[26u].z * fragmentVectorConstants1.packedValues[28u].z) * (sampledTextureValue1.z + sampledTextureValue.z);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[21u].x) / (fragmentVectorConstants1.packedValues[21u].y - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].x) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].y) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float productValue9 = floor(quotientValue1 * 0.25);
        float productValue10 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue10 * productValue10) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue9 * productValue9) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)));
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
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float multiplyAddValue4 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue5 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue6 = fma(reinterpretedBits9, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue7 = fma(varyingColor0.w, fma(multiplyAddValue4, uintBitsToFloat(reinterpretedBits10.x), -multiplyAddValue4), multiplyAddValue4);
    float multiplyAddValue8 = fma(varyingColor0.w, fma(multiplyAddValue5, uintBitsToFloat(reinterpretedBits10.y), -multiplyAddValue5), multiplyAddValue5);
    float multiplyAddValue9 = fma(varyingColor0.w, fma(multiplyAddValue6, uintBitsToFloat(reinterpretedBits10.z), -multiplyAddValue6), multiplyAddValue6);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits13.x);
    float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits13.y);
    float reinterpretedBits16 = uintBitsToFloat(reinterpretedBits13.z);
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[27u]);
    float multiplyAddValue10 = fma(sampledTextureValue2.x, reinterpretedBits14, sampledTextureValue3.x * reinterpretedBits14) * uintBitsToFloat(reinterpretedBits17.x);
    float multiplyAddValue11 = fma(sampledTextureValue2.y, reinterpretedBits15, sampledTextureValue3.y * reinterpretedBits15) * uintBitsToFloat(reinterpretedBits17.y);
    float multiplyAddValue12 = fma(sampledTextureValue2.z, reinterpretedBits16, sampledTextureValue3.z * reinterpretedBits16) * uintBitsToFloat(reinterpretedBits17.z);
    fragmentColor1.x = fma(multiplyAddValue10, multiplyAddValue10, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue7, multiplyAddValue7));
    fragmentColor1.y = fma(multiplyAddValue11, multiplyAddValue11, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue8, multiplyAddValue8));
    fragmentColor1.z = fma(multiplyAddValue12, multiplyAddValue12, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue9, multiplyAddValue9));
    uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits19 = varyingTexCoord5.x - uintBitsToFloat(reinterpretedBits18.x);
    float reinterpretedBits20 = varyingTexCoord5.y - uintBitsToFloat(reinterpretedBits18.y);
    float reinterpretedBits21 = varyingTexCoord5.z - uintBitsToFloat(reinterpretedBits18.z);
    fragmentColor1.w = (varyingTexCoord8.w < varyingTexCoord8.x) ? fma(varyingTexCoord8.x, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-varyingTexCoord8.w, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue4 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue4);
    float productValue41 = inverseLengthValue3 * varyingNormal0.x;
    float productValue42 = inverseLengthValue3 * varyingNormal0.y;
    float productValue43 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue3 = 1.0 / (abs(productValue43) + (abs(productValue42) + abs(productValue41)));
    float productValue44 = quotientValue3 * productValue41;
    float productValue45 = quotientValue3 * productValue42;
    bool conditionValue1 = productValue43 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue45)) * ((productValue44 >= 0.0) ? sumValue3 : (-1.0))) : productValue44;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue44)) * ((productValue45 >= 0.0) ? sumValue3 : (-1.0))) : productValue45;
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue13 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue14 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits21, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits19, reinterpretedBits20 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits24.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits23.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits22.x))) + uintBitsToFloat(reinterpretedBits25.x)) / multiplyAddValue13, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.x), reinterpretedBits21, fma(uintBitsToFloat(reinterpretedBits27.x), reinterpretedBits19, reinterpretedBits20 * uintBitsToFloat(reinterpretedBits26.x))) + uintBitsToFloat(reinterpretedBits29.x)) / multiplyAddValue14, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits24.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits23.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits22.y))) + uintBitsToFloat(reinterpretedBits25.y)) / multiplyAddValue13, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.y), reinterpretedBits21, fma(uintBitsToFloat(reinterpretedBits27.y), reinterpretedBits19, reinterpretedBits20 * uintBitsToFloat(reinterpretedBits26.y))) + uintBitsToFloat(reinterpretedBits29.y)) / multiplyAddValue14, 0.5, 0.5);
    float reinterpretedBits30 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
    bool reinterpretedBits31 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits30 > 9.9999997473787516355514526367188e-05);
    float productValue46 = reinterpretedBits30 * reinterpretedBits30;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits33 = (reinterpretedBits31 ? spvNMin(productValue46, 1.0) : uintBitsToFloat(reinterpretedBits32.x)) * 0.16666667163372039794921875;
    float multiplyAddValue15 = (reinterpretedBits31 ? spvNMin(fma(fma(productValue46, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue46, 1.0) : uintBitsToFloat(reinterpretedBits32.y)) * 0.16666667163372039794921875;
    float multiplyAddValue16 = (reinterpretedBits31 ? spvNMin(fma(productValue46 * productValue46, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue46, 1.0) : uintBitsToFloat(reinterpretedBits32.z)) * 0.16666667163372039794921875;
    float productValue47 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue15, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue16, reinterpretedBits33)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue15 / productValue47, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits33 / productValue47, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue16 / productValue47, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue47, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[113u])), 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) + (uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float multiplyAddValue4 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue5 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits34 = multiplyAddValue4 * uintBitsToFloat(reinterpretedBits10.x);
    float reinterpretedBits35 = multiplyAddValue4 * uintBitsToFloat(reinterpretedBits10.y);
    float reinterpretedBits36 = multiplyAddValue4 * uintBitsToFloat(reinterpretedBits10.z);
    float scalarValue5 = ceil(multiplyAddValue5);
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[27u]);
    float multiplyAddValue17 = fma(scalarValue5, fma(multiplyAddValue5, uintBitsToFloat(reinterpretedBits17.x), -reinterpretedBits34), reinterpretedBits34);
    float multiplyAddValue18 = fma(scalarValue5, fma(multiplyAddValue5, uintBitsToFloat(reinterpretedBits17.y), -reinterpretedBits35), reinterpretedBits35);
    float multiplyAddValue19 = fma(scalarValue5, fma(multiplyAddValue5, uintBitsToFloat(reinterpretedBits17.z), -reinterpretedBits36), reinterpretedBits36);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits13.x);
    float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits13.y);
    float reinterpretedBits16 = uintBitsToFloat(reinterpretedBits13.z);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
    float multiplyAddValue20 = fma(sampledTextureValue2.x, reinterpretedBits14, sampledTextureValue3.x * reinterpretedBits14) * uintBitsToFloat(reinterpretedBits37.x);
    float multiplyAddValue21 = fma(sampledTextureValue2.y, reinterpretedBits15, sampledTextureValue3.y * reinterpretedBits15) * uintBitsToFloat(reinterpretedBits37.y);
    float multiplyAddValue22 = fma(sampledTextureValue2.z, reinterpretedBits16, sampledTextureValue3.z * reinterpretedBits16) * uintBitsToFloat(reinterpretedBits37.z);
    fragmentColor1.x = fma(multiplyAddValue20, multiplyAddValue20, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue17, multiplyAddValue17));
    fragmentColor1.y = fma(multiplyAddValue21, multiplyAddValue21, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue18, multiplyAddValue18));
    fragmentColor1.z = fma(multiplyAddValue22, multiplyAddValue22, fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue19, multiplyAddValue19));
    uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits19 = varyingTexCoord5.x - uintBitsToFloat(reinterpretedBits18.x);
    float reinterpretedBits20 = varyingTexCoord5.y - uintBitsToFloat(reinterpretedBits18.y);
    float reinterpretedBits21 = varyingTexCoord5.z - uintBitsToFloat(reinterpretedBits18.z);
    fragmentColor1.w = (varyingTexCoord8.w < varyingTexCoord8.x) ? fma(varyingTexCoord8.x, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-varyingTexCoord8.w, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue4 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue4);
    float productValue41 = inverseLengthValue3 * varyingNormal0.x;
    float productValue42 = inverseLengthValue3 * varyingNormal0.y;
    float productValue43 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue3 = 1.0 / (abs(productValue43) + (abs(productValue42) + abs(productValue41)));
    float productValue44 = quotientValue3 * productValue41;
    float productValue45 = quotientValue3 * productValue42;
    bool conditionValue1 = productValue43 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue45)) * ((productValue44 >= 0.0) ? sumValue3 : (-1.0))) : productValue44;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue44)) * ((productValue45 >= 0.0) ? sumValue3 : (-1.0))) : productValue45;
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue13 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue14 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits21, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits19, reinterpretedBits20 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits24.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits23.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits22.x))) + uintBitsToFloat(reinterpretedBits25.x)) / multiplyAddValue13, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.x), reinterpretedBits21, fma(uintBitsToFloat(reinterpretedBits27.x), reinterpretedBits19, reinterpretedBits20 * uintBitsToFloat(reinterpretedBits26.x))) + uintBitsToFloat(reinterpretedBits29.x)) / multiplyAddValue14, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits24.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits23.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits22.y))) + uintBitsToFloat(reinterpretedBits25.y)) / multiplyAddValue13, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.y), reinterpretedBits21, fma(uintBitsToFloat(reinterpretedBits27.y), reinterpretedBits19, reinterpretedBits20 * uintBitsToFloat(reinterpretedBits26.y))) + uintBitsToFloat(reinterpretedBits29.y)) / multiplyAddValue14, 0.5, 0.5);
    float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits39 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits38 > 9.9999997473787516355514526367188e-05);
    float productValue48 = reinterpretedBits38 * reinterpretedBits38;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits40 = (reinterpretedBits39 ? spvNMin(productValue48, 1.0) : uintBitsToFloat(reinterpretedBits32.x)) * 0.16666667163372039794921875;
    float multiplyAddValue23 = (reinterpretedBits39 ? spvNMin(fma(fma(productValue48, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue48, 1.0) : uintBitsToFloat(reinterpretedBits32.y)) * 0.16666667163372039794921875;
    float multiplyAddValue24 = (reinterpretedBits39 ? spvNMin(fma(productValue48 * productValue48, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue48, 1.0) : uintBitsToFloat(reinterpretedBits32.z)) * 0.16666667163372039794921875;
    float productValue49 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue23, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue24, reinterpretedBits40)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue23 / productValue49, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits40 / productValue49, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue24 / productValue49, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue49, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) + (uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue = varyingTexCoord5.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue1 = varyingTexCoord5.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue2 = varyingTexCoord5.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue11 = inverseLengthValue1 * varyingNormal0.x;
    float productValue12 = inverseLengthValue1 * varyingNormal0.y;
    float productValue13 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue12) + abs(productValue11)) + abs(productValue13));
    float productValue14 = quotientValue2 * productValue11;
    float productValue15 = quotientValue2 * productValue12;
    bool conditionValue = productValue13 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue2;
    float productValue17;
    float productValue18;
    if ((fragmentVectorConstants1.packedValues[28u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue16 = fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue2 = spvNClamp(productValue16, 0.0, 1.0);
        productValue17 = spvNClamp(((productValue16 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue16, 0.0, 1.0);
        productValue18 = spvNClamp((((productValue16 * productValue16) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue16, 0.0, 1.0);
    }
    else
    {
        intermediateValue2 = fragmentVectorConstants1.packedValues[18u].x;
        productValue17 = fragmentVectorConstants1.packedValues[18u].y;
        productValue18 = fragmentVectorConstants1.packedValues[18u].z;
    }
    float productValue21 = intermediateValue2 * 0.16666667163372039794921875;
    float productValue22 = productValue17 * 0.16666667163372039794921875;
    float productValue23 = productValue18 * 0.16666667163372039794921875;
    float productValue24 = ceil(spvNClamp(spvNMax(spvNMax(productValue21, productValue23), spvNMax(productValue22, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue21 / productValue24, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue22 / productValue24, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue23 / productValue24, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue24, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[13u].x - productValue3) * fragmentVectorConstants1.packedValues[13u].w) + productValue3) + (productValue6 * productValue6);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[13u].y - productValue4) * fragmentVectorConstants1.packedValues[13u].w) + productValue4) + (productValue7 * productValue7);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[13u].z - productValue5) * fragmentVectorConstants1.packedValues[13u].w) + productValue5) + (productValue8 * productValue8);
    fragmentColor1.w = (varyingTexCoord8.x > varyingTexCoord8.w) ? ((varyingTexCoord8.x * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (varyingTexCoord8.w * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue14 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue15))) : productValue14;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue14)) * ((productValue15 < 0.0) ? (-1.0) : 1.0)) : productValue15;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue1)) * 0.5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue = varyingTexCoord5.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue1 = varyingTexCoord5.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue2 = varyingTexCoord5.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue11 = inverseLengthValue1 * varyingNormal0.x;
    float productValue12 = inverseLengthValue1 * varyingNormal0.y;
    float productValue13 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue12) + abs(productValue11)) + abs(productValue13));
    float productValue14 = quotientValue2 * productValue11;
    float productValue15 = quotientValue2 * productValue12;
    bool conditionValue = productValue13 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue3;
    float productValue19;
    float productValue20;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue34 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue3 = spvNClamp(productValue34, 0.0, 1.0);
        productValue19 = spvNClamp(((productValue34 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue34, 0.0, 1.0);
        productValue20 = spvNClamp((((productValue34 * productValue34) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue34, 0.0, 1.0);
    }
    else
    {
        intermediateValue3 = fragmentVectorConstants1.packedValues[18u].x;
        productValue19 = fragmentVectorConstants1.packedValues[18u].y;
        productValue20 = fragmentVectorConstants1.packedValues[18u].z;
    }
    float productValue35 = intermediateValue3 * 0.16666667163372039794921875;
    float productValue36 = productValue19 * 0.16666667163372039794921875;
    float productValue37 = productValue20 * 0.16666667163372039794921875;
    float productValue38 = ceil(spvNClamp(spvNMax(spvNMax(productValue35, productValue37), spvNMax(productValue36, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue35 / productValue38, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue36 / productValue38, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue37 / productValue38, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue38, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[13u].x - productValue28) * fragmentVectorConstants1.packedValues[13u].w) + productValue28) + (productValue31 * productValue31);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[13u].y - productValue29) * fragmentVectorConstants1.packedValues[13u].w) + productValue29) + (productValue32 * productValue32);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[13u].z - productValue30) * fragmentVectorConstants1.packedValues[13u].w) + productValue30) + (productValue33 * productValue33);
    fragmentColor1.w = (varyingTexCoord8.x > varyingTexCoord8.w) ? ((varyingTexCoord8.x * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (varyingTexCoord8.w * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue14 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue15))) : productValue14;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue14)) * ((productValue15 < 0.0) ? (-1.0) : 1.0)) : productValue15;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue1)) * 0.5;
#endif
    discardIfRequested();
}
