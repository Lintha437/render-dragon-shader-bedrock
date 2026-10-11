#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandPrepassTextured / GeometryPrepassAlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 6
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_samplerless_texture_functions : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION2_FLOAT_7 1
#endif

#include "../../include/materials/ItemInHandPrepassTextured/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u])) != 0.0;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits6 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z)));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits8 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits7)) * (reinterpretedBits6 - reinterpretedBits7), 0.0, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x)) / reinterpretedBits10) * reinterpretedBits10;
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y)) / reinterpretedBits10) * reinterpretedBits10;
    float productValue = floor(multiplyAddValue1 * 0.25);
    float productValue1 = floor(multiplyAddValue1 * 0.5);
    float scalarValue5 = floor(multiplyAddValue1);
    if ((((reinterpretedBits ? 1.0 : scalarValue3) * uintBitsToFloat(reinterpretedBits1.w)) < 0.5) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue * productValue) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue1 * productValue1) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue5 * scalarValue5) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits8 * reinterpretedBits8) * fma(reinterpretedBits8, -2.0, 3.0)))))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u])) != 0.0;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    uvec4 reinterpretedBits1 = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits6 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z)));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits8 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits7)) * (reinterpretedBits6 - reinterpretedBits7), 0.0, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x)) / reinterpretedBits10) * reinterpretedBits10;
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y)) / reinterpretedBits10) * reinterpretedBits10;
    float productValue = floor(multiplyAddValue1 * 0.25);
    float productValue1 = floor(multiplyAddValue1 * 0.5);
    float scalarValue5 = floor(multiplyAddValue1);
    if ((((reinterpretedBits ? 1.0 : scalarValue3) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[115u]))) < 0.5) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue * productValue) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue1 * productValue1) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue5 * scalarValue5) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits8 * reinterpretedBits8) * fma(reinterpretedBits8, -2.0, 3.0)))))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue30 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
    uint scalarValue6 = uint(varyingTexCoord4);
    vec4 sampledTextureValue15 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue35 = sampledTextureValue15.x;
    float scalarValue36 = sampledTextureValue15.y;
    float scalarValue37 = sampledTextureValue15.z;
    float scalarValue38 = sampledTextureValue15.w;
    float productValue25 = scalarValue35 * varyingColor0.x;
    float productValue26 = scalarValue36 * varyingColor0.y;
    float productValue27 = scalarValue37 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue7;
    if (fragmentVectorConstants1.packedValues[20u].x != 0.0)
    {
        productValue3 = (((productValue25 - scalarValue35) * scalarValue38) + scalarValue35) * varyingColor0.w;
        productValue4 = (((productValue26 - scalarValue36) * scalarValue38) + scalarValue36) * varyingColor0.w;
        productValue5 = (((productValue27 - scalarValue37) * scalarValue38) + scalarValue37) * varyingColor0.w;
        intermediateValue7 = 1.0;
    }
    else
    {
        productValue3 = productValue25;
        productValue4 = productValue26;
        productValue5 = productValue27;
        intermediateValue7 = scalarValue38;
    }
    float productValue28 = (fragmentVectorConstants1.packedValues[28u].x * productValue3) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue29 = (fragmentVectorConstants1.packedValues[28u].y * productValue4) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue30 = (fragmentVectorConstants1.packedValues[28u].z * productValue5) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue31 = (((productValue28 * fragmentVectorConstants1.packedValues[4u].x) - productValue28) * varyingColor0.w) + productValue28;
    float productValue32 = (((productValue29 * fragmentVectorConstants1.packedValues[4u].y) - productValue29) * varyingColor0.w) + productValue29;
    float productValue33 = (((productValue30 * fragmentVectorConstants1.packedValues[4u].z) - productValue30) * varyingColor0.w) + productValue30;
    bool comparisonValue1;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
    {
        float inverseLengthValue8 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue8)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[22u].x) / (fragmentVectorConstants1.packedValues[22u].y - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
        float quotientValue1 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float quotientValue2 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float productValue34 = floor(quotientValue2 * 0.25);
        float productValue35 = floor(quotientValue2 * 0.5);
        float scalarValue39 = floor(quotientValue2);
        comparisonValue1 = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue35 * productValue35) * 0.75) + (floor(quotientValue1 * 0.5) * 0.5)) + (fract(((productValue34 * productValue34) * 0.75) + (floor(quotientValue1 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue39 * scalarValue39) * 0.75) + (floor(quotientValue1) * 0.5)));
    }
    else
    {
        comparisonValue1 = false;
    }
    if (((fragmentVectorConstants1.packedValues[28u].w * intermediateValue7) < 0.5) || comparisonValue1)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue30 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
    uint scalarValue6 = uint(varyingTexCoord4);
    vec4 sampledTextureValue15 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue35 = sampledTextureValue15.x;
    float scalarValue36 = sampledTextureValue15.y;
    float scalarValue38 = sampledTextureValue15.w;
    float productValue25 = scalarValue35 * varyingColor0.x;
    float productValue26 = scalarValue36 * varyingColor0.y;
    float productValue2;
    float productValue3;
    float intermediateValue6;
    if (fragmentVectorConstants1.packedValues[20u].x != 0.0)
    {
        productValue2 = (((productValue25 - scalarValue35) * scalarValue38) + scalarValue35) * varyingColor0.w;
        productValue3 = (((productValue26 - scalarValue36) * scalarValue38) + scalarValue36) * varyingColor0.w;
        intermediateValue6 = 1.0;
    }
    else
    {
        productValue2 = productValue25;
        productValue3 = productValue26;
        intermediateValue6 = scalarValue38;
    }
    float productValue61 = (fragmentVectorConstants1.packedValues[28u].x * productValue2) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue62 = (fragmentVectorConstants1.packedValues[28u].y * productValue3) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue63 = productValue61 * fragmentVectorConstants1.packedValues[4u].x;
    float productValue64 = productValue61 * fragmentVectorConstants1.packedValues[4u].y;
    float productValue65 = productValue61 * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue56 = ceil(productValue62);
    float productValue66 = (((productValue62 * fragmentVectorConstants1.packedValues[29u].x) - productValue63) * scalarValue56) + productValue63;
    float productValue67 = (((productValue62 * fragmentVectorConstants1.packedValues[29u].y) - productValue64) * scalarValue56) + productValue64;
    float productValue68 = (((productValue62 * fragmentVectorConstants1.packedValues[29u].z) - productValue65) * scalarValue56) + productValue65;
    bool comparisonValue1;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
    {
        float inverseLengthValue8 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue8), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue8)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[22u].x) / (fragmentVectorConstants1.packedValues[22u].y - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
        float quotientValue1 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float quotientValue2 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float productValue34 = floor(quotientValue2 * 0.25);
        float productValue35 = floor(quotientValue2 * 0.5);
        float scalarValue39 = floor(quotientValue2);
        comparisonValue1 = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue35 * productValue35) * 0.75) + (floor(quotientValue1 * 0.5) * 0.5)) + (fract(((productValue34 * productValue34) * 0.75) + (floor(quotientValue1 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue39 * scalarValue39) * 0.75) + (floor(quotientValue1) * 0.5)));
    }
    else
    {
        comparisonValue1 = false;
    }
    if (((fragmentVectorConstants1.packedValues[28u].w * intermediateValue6) < 0.5) || comparisonValue1)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue2 = ((reinterpretedBits ? (fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w) : (scalarValue * varyingColor0.x)) * uintBitsToFloat(reinterpretedBits1.x)) * fma(reinterpretedBits11, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = ((reinterpretedBits ? (fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w) : (scalarValue1 * varyingColor0.y)) * uintBitsToFloat(reinterpretedBits1.y)) * fma(reinterpretedBits11, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue4 = ((reinterpretedBits ? (fma(scalarValue3, fma(scalarValue2, varyingColor0.z, -scalarValue2), scalarValue2) * varyingColor0.w) : (scalarValue2 * varyingColor0.z)) * uintBitsToFloat(reinterpretedBits1.z)) * fma(reinterpretedBits11, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue5 = fma(varyingColor0.w, fma(multiplyAddValue2, uintBitsToFloat(reinterpretedBits12.x), -multiplyAddValue2), multiplyAddValue2);
    float multiplyAddValue6 = fma(varyingColor0.w, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits12.y), -multiplyAddValue3), multiplyAddValue3);
    float multiplyAddValue11 = fma(varyingColor0.w, fma(multiplyAddValue4, uintBitsToFloat(reinterpretedBits12.z), -multiplyAddValue4), multiplyAddValue4);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    fragmentColor1.x = fma(reinterpretedBits14, uintBitsToFloat(reinterpretedBits13.x) - multiplyAddValue5, multiplyAddValue5);
    fragmentColor1.y = fma(reinterpretedBits14, uintBitsToFloat(reinterpretedBits13.y) - multiplyAddValue6, multiplyAddValue6);
    fragmentColor1.z = fma(reinterpretedBits14, uintBitsToFloat(reinterpretedBits13.z) - multiplyAddValue11, multiplyAddValue11);
    uint scalarValue6 = uint(varyingTexCoord4);
    float intermediateValue24;
    float intermediateValue26;
    float multiplyAddValue8;
    float multiplyAddValue9;
    float multiplyAddValue10;
    float intermediateValue28;
    float intermediateValue30;
    if (scalarValue6 != 65535u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue40 = fma(reinterpretedBits11, varyingColor0.x - 1.0, 1.0) * ((reinterpretedBits ? (fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w) : (scalarValue * varyingColor0.x)) * uintBitsToFloat(reinterpretedBits1.x));
    float multiplyAddValue41 = fma(reinterpretedBits11, varyingColor0.y - 1.0, 1.0) * ((reinterpretedBits ? (fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w) : (scalarValue1 * varyingColor0.y)) * uintBitsToFloat(reinterpretedBits1.y));
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits37 = multiplyAddValue40 * uintBitsToFloat(reinterpretedBits12.x);
    float reinterpretedBits38 = multiplyAddValue40 * uintBitsToFloat(reinterpretedBits12.y);
    float reinterpretedBits39 = multiplyAddValue40 * uintBitsToFloat(reinterpretedBits12.z);
    float scalarValue57 = ceil(multiplyAddValue41);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float multiplyAddValue42 = fma(scalarValue57, fma(multiplyAddValue41, uintBitsToFloat(reinterpretedBits40.x), -reinterpretedBits37), reinterpretedBits37);
    float multiplyAddValue43 = fma(scalarValue57, fma(multiplyAddValue41, uintBitsToFloat(reinterpretedBits40.y), -reinterpretedBits38), reinterpretedBits38);
    float multiplyAddValue44 = fma(scalarValue57, fma(multiplyAddValue41, uintBitsToFloat(reinterpretedBits40.z), -reinterpretedBits39), reinterpretedBits39);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    fragmentColor1.x = fma(reinterpretedBits14, uintBitsToFloat(reinterpretedBits13.x) - multiplyAddValue42, multiplyAddValue42);
    fragmentColor1.y = fma(reinterpretedBits14, uintBitsToFloat(reinterpretedBits13.y) - multiplyAddValue43, multiplyAddValue43);
    fragmentColor1.z = fma(reinterpretedBits14, uintBitsToFloat(reinterpretedBits13.z) - multiplyAddValue44, multiplyAddValue44);
    uint scalarValue6 = uint(varyingTexCoord4);
    float intermediateValue24;
    float intermediateValue26;
    float multiplyAddValue7;
    float multiplyAddValue8;
    float multiplyAddValue9;
    float intermediateValue28;
    float intermediateValue30;
    if (scalarValue6 != 65535u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue9;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if (scalarValue6 == 65535u)
#endif
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits15 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue6 * 4u) + 1u]);
        float scalarValue7 = reinterpretedBits15.x;
        float scalarValue8 = reinterpretedBits15.y;
        float scalarValue9 = reinterpretedBits15.z;
        float scalarValue10 = reinterpretedBits15.w;
        vec4 reinterpretedBits16 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue6 * 4u) + 2u]);
        vec2 reinterpretedBits17 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue6 * 8u) + 6u]);
        float scalarValue11 = reinterpretedBits17.x;
        float scalarValue12 = reinterpretedBits17.y;
        uint reinterpretedBits18 = floatBitsToUint(reinterpretedBits16.x);
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        if ((reinterpretedBits18 & 4u) == 4u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits15 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue6 * 4u) + 1u]);
        float scalarValue7 = reinterpretedBits15.x;
        float scalarValue8 = reinterpretedBits15.y;
        float scalarValue9 = reinterpretedBits15.z;
        float scalarValue10 = reinterpretedBits15.w;
        vec4 reinterpretedBits16 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue6 * 4u) + 2u]);
        vec2 reinterpretedBits17 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue6 * 8u) + 6u]);
        float scalarValue11 = reinterpretedBits17.x;
        float scalarValue12 = reinterpretedBits17.y;
        uint reinterpretedBits18 = floatBitsToUint(reinterpretedBits16.x);
        float multiplyAddValue14;
        float multiplyAddValue15;
        float multiplyAddValue16;
        if ((reinterpretedBits18 & 4u) == 4u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue9 = 0.0;
        intermediateValue11 = 0.0;
        intermediateValue12 = 1.0;
        intermediateValue13 = 0.0;
        intermediateValue14 = varyingNormal0.x;
        intermediateValue15 = varyingNormal0.y;
        intermediateValue16 = varyingNormal0.z;
    }
    else
    {
        float sampledTextureValue16 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 4u)).x);
        float sampledTextureValue17 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 5u)).x);
        float sampledTextureValue18 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 6u)).x);
        float sampledTextureValue19 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 7u)).x);
        uvec4 sampledTextureValue20 = texelFetch(pbrData, int((scalarValue6 * 16u) + 8u));
        uint scalarValue40 = sampledTextureValue20.x;
        float sampledTextureValue21 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 12u)).x);
        float sampledTextureValue22 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 13u)).x);
        float sampledTextureValue23 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 15u)).x);
        float intermediateValue20;
        float intermediateValue21;
        float intermediateValue22;
        if ((scalarValue40 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, scalarValue7, scalarValue9), fma(varyingTexCoord0.y, scalarValue8, scalarValue10)));
            multiplyAddValue15 = fma(sampledTextureValue4.y, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue4.x, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue4.z, 2.0, -1.0);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, scalarValue7, scalarValue9), fma(varyingTexCoord0.y, scalarValue8, scalarValue10)));
            multiplyAddValue14 = fma(sampledTextureValue4.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue4.x, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue4.z, 2.0, -1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue40 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue40 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue5 = 0.0;
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    float multiplyAddValue32 = fma(varyingTexCoord0.x, sampledTextureValue16, sampledTextureValue18);
                    float multiplyAddValue33 = fma(varyingTexCoord0.y, sampledTextureValue17, sampledTextureValue19);
                    vec4 sampledTextureValue24 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue32, multiplyAddValue33), 0.0);
                    float scalarValue41 = sampledTextureValue24.x;
                    float scalarValue42 = sampledTextureValue24.y;
                    float scalarValue43 = sampledTextureValue24.z;
                    float multiplyAddValue34 = spvNClamp(fma(spvNMin(sampledTextureValue23 - sampledTextureValue22, sampledTextureValue23), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue6 = multiplyAddValue34 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue41 == scalarValue42) && (scalarValue42 == scalarValue43))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue6)
                        {
                            uvec2 sampledTextureValue25 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue36 = float(int(uint(int(float(int(sampledTextureValue25.x)))))) * multiplyAddValue32;
                            float productValue37 = float(int(uint(int(float(int(sampledTextureValue25.y)))))) * multiplyAddValue33;
                            float scalarValue44 = fract(productValue36);
                            float scalarValue45 = fract(productValue37);
                            float comparisonValue11;
                            if (abs(scalarValue44 + (-0.5)) < 0.0625)
                            {
                                comparisonValue11 = ((scalarValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue32;
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue32;
                            }
                            float comparisonValue12;
                            if (abs(scalarValue45 + (-0.5)) < 0.0625)
                            {
                                comparisonValue12 = ((scalarValue45 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue33;
                            }
                            else
                            {
                                comparisonValue12 = multiplyAddValue33;
                            }
                            vec4 sampledTextureValue26 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue11, comparisonValue12));
                            float scalarValue46 = sampledTextureValue26.x;
                            float scalarValue47 = sampledTextureValue26.y;
                            float scalarValue48 = sampledTextureValue26.z;
                            float scalarValue49 = sampledTextureValue26.w;
                            float sumValue20 = fract(productValue36 + 0.5);
                            float sumValue21 = fract(productValue37 + 0.5);
                            bool conditionValue7 = sumValue21 > 0.5;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue7 ? scalarValue46 : scalarValue49;
                            intermediateValue1[1u] = conditionValue7 ? scalarValue47 : scalarValue48;
                            float productValue38 = intermediateValue1[uint(int(spvNClamp((sumValue20 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue39 = intermediateValue1[uint(int(spvNClamp((sumValue20 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue22 = productValue38 - productValue39;
                            bool conditionValue8 = sumValue20 > 0.5;
                            intermediateValue1[0u] = conditionValue8 ? scalarValue48 : scalarValue49;
                            intermediateValue1[1u] = conditionValue8 ? scalarValue47 : scalarValue46;
                            float productValue40 = intermediateValue1[uint(int(spvNClamp((sumValue21 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue21 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue9 = inversesqrt(dot(vec3(sumValue22, productValue40, 0.25), vec3(sumValue22, productValue40, 0.25)));
                            float productValue41 = inverseLengthValue9 * multiplyAddValue34;
                            branchMergedValue12 = productValue41 * sumValue22;
                            branchMergedValue14 = productValue41 * productValue40;
                            branchMergedValue15 = inverseLengthValue9 * 0.25;
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
                        uvec2 sampledTextureValue27 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue6)
                        {
                            float productValue42 = fract(float(int(uint(int(float(int(sampledTextureValue27.x)))))) * multiplyAddValue32);
                            float productValue43 = fract(float(int(uint(int(float(int(sampledTextureValue27.y)))))) * multiplyAddValue33);
                            float comparisonValue31 = (((productValue42 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue42 * 2.0) + (-1.0))) - (((productValue42 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue24.w * 2.0) + (-1.0)));
                            float comparisonValue32 = (((productValue43 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue43 * 2.0) + (-1.0))) - (((productValue43 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue41 * 2.0) + (-1.0)));
                            float comparisonValue33 = ((abs(comparisonValue31) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue31;
                            float comparisonValue34 = ((abs(comparisonValue32) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue32;
                            float inverseLengthValue10 = inversesqrt(dot(vec3(comparisonValue33, comparisonValue34, 0.25), vec3(comparisonValue33, comparisonValue34, 0.25)));
                            float productValue44 = inverseLengthValue10 * multiplyAddValue34;
                            branchMergedValue13 = productValue44 * comparisonValue33;
                            branchMergedValue16 = productValue44 * comparisonValue34;
                            branchMergedValue17 = inverseLengthValue10 * 0.25;
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
                float multiplyAddValue35 = fma(varyingTexCoord0.x, sampledTextureValue16, sampledTextureValue18);
                float multiplyAddValue36 = fma(varyingTexCoord0.y, sampledTextureValue17, sampledTextureValue19);
                float multiplyAddValue37 = spvNClamp(fma(spvNMin(sampledTextureValue23 - sampledTextureValue22, sampledTextureValue23), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue37 > 0.0)
                {
                    uvec2 sampledTextureValue28 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue45 = float(int(uint(int(float(int(sampledTextureValue28.x)))))) * multiplyAddValue35;
                    float productValue46 = float(int(uint(int(float(int(sampledTextureValue28.y)))))) * multiplyAddValue36;
                    float scalarValue50 = fract(productValue45);
                    float scalarValue51 = fract(productValue46);
                    float comparisonValue5;
                    if (abs(scalarValue50 + (-0.5)) < 0.0625)
                    {
                        comparisonValue5 = ((scalarValue50 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue35;
                    }
                    else
                    {
                        comparisonValue5 = multiplyAddValue35;
                    }
                    float comparisonValue10;
                    if (abs(scalarValue51 + (-0.5)) < 0.0625)
                    {
                        comparisonValue10 = ((scalarValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue36;
                    }
                    else
                    {
                        comparisonValue10 = multiplyAddValue36;
                    }
                    vec4 sampledTextureValue29 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue5, comparisonValue10));
                    float scalarValue52 = sampledTextureValue29.x;
                    float scalarValue53 = sampledTextureValue29.y;
                    float scalarValue54 = sampledTextureValue29.z;
                    float scalarValue55 = sampledTextureValue29.w;
                    float sumValue23 = fract(productValue45 + 0.5);
                    float sumValue24 = fract(productValue46 + 0.5);
                    bool conditionValue9 = sumValue24 > 0.5;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue9 ? scalarValue52 : scalarValue55;
                    intermediateValue2[1u] = conditionValue9 ? scalarValue53 : scalarValue54;
                    float productValue47 = intermediateValue2[uint(int(spvNClamp((sumValue23 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue48 = intermediateValue2[uint(int(spvNClamp((sumValue23 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue25 = productValue47 - productValue48;
                    bool conditionValue10 = sumValue23 > 0.5;
                    intermediateValue2[0u] = conditionValue10 ? scalarValue54 : scalarValue55;
                    intermediateValue2[1u] = conditionValue10 ? scalarValue53 : scalarValue52;
                    float productValue49 = intermediateValue2[uint(int(spvNClamp((sumValue24 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue2[uint(int(spvNClamp((sumValue24 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue11 = inversesqrt(dot(vec3(sumValue25, productValue49, 0.25), vec3(sumValue25, productValue49, 0.25)));
                    float productValue50 = inverseLengthValue11 * multiplyAddValue37;
                    branchMergedValue4 = productValue50 * sumValue25;
                    branchMergedValue7 = productValue50 * productValue49;
                    branchMergedValue8 = inverseLengthValue11 * 0.25;
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
            intermediateValue20 = branchMergedValue;
            intermediateValue21 = branchMergedValue1;
            intermediateValue22 = branchMergedValue2;
#endif
        }
        else
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits19 = uintBitsToFloat(intermediateValue1.packedValues[(scalarValue6 * 16u) + 15u]);
            float intermediateValue34;
            float intermediateValue35;
            float intermediateValue36;
            if ((reinterpretedBits18 & 8u) == 8u)
            {
                float sumValue = spvNClamp(2.0 - spvNMin(reinterpretedBits19, reinterpretedBits19 - scalarValue12), 0.0, 1.0);
                float productValue12;
                float productValue13;
                float productValue14;
                if (sumValue > 0.0)
                {
                    float multiplyAddValue12 = fma(varyingTexCoord0.x, scalarValue7, scalarValue9);
                    float multiplyAddValue13 = fma(varyingTexCoord0.y, scalarValue8, scalarValue10);
                    bool sampledTextureValue5 = uint(textureQueryLevels(materialTexture0)) > 0u;
                    uvec2 sampledTextureValue6 = uvec2(textureSize(materialTexture0, int(0u)));
                    uint scalarValue13 = sampledTextureValue6.x;
                    float comparisonValue2 = rdEvaluateFloatExpression2(sampledTextureValue5 ? scalarValue13 : 0u);
                    float comparisonValue3 = rdEvaluateFloatExpression2(sampledTextureValue5 ? sampledTextureValue6.y : 0u);
                    float productValue6 = fract(multiplyAddValue12 * comparisonValue2);
                    float productValue7 = fract(multiplyAddValue13 * comparisonValue3);
                    vec4 sampledTextureValue7 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue6 - 0.5) < 0.0625) ? (multiplyAddValue12 + ((productValue6 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue12, (abs(productValue7 - 0.5) < 0.0625) ? (multiplyAddValue13 + ((productValue7 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue13));
                    float scalarValue14 = sampledTextureValue7.x;
                    float scalarValue15 = sampledTextureValue7.y;
                    float scalarValue16 = sampledTextureValue7.z;
                    float scalarValue17 = sampledTextureValue7.w;
                    float multiplyAddValue18 = fract(fma(multiplyAddValue12, comparisonValue2, 0.5));
                    float multiplyAddValue19 = fract(fma(multiplyAddValue13, comparisonValue3, 0.5));
                    bool conditionValue = multiplyAddValue19 > 0.5;
                    bool conditionValue1 = multiplyAddValue18 > 0.5;
                    float comparisonValue4 = conditionValue ? scalarValue14 : scalarValue17;
                    float comparisonValue6 = conditionValue ? scalarValue15 : scalarValue16;
                    float comparisonValue7 = conditionValue1 ? scalarValue16 : scalarValue17;
                    float comparisonValue8 = conditionValue1 ? scalarValue15 : scalarValue14;
                    float sumValue1 = multiplyAddValue18 - 0.083333335816860198974609375;
                    float sumValue2 = multiplyAddValue18 + 0.083333335816860198974609375;
                    float sumValue3 = multiplyAddValue19 - 0.083333335816860198974609375;
                    float sumValue4 = multiplyAddValue19 + 0.083333335816860198974609375;
                    uint sumValue5 = uint(int(spvNClamp(sumValue1 + sumValue1, 0.0, 1.0)));
                    uint sumValue6 = uint(int(spvNClamp(sumValue2 + sumValue2, 0.0, 1.0)));
                    uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                    uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                    float comparisonValue9 = ((sumValue5 == 1u) ? comparisonValue6 : ((sumValue5 == 0u) ? comparisonValue4 : 0.0)) - ((sumValue6 == 1u) ? comparisonValue6 : ((sumValue6 == 0u) ? comparisonValue4 : 0.0));
                    float comparisonValue13 = ((sumValue7 == 1u) ? comparisonValue8 : ((sumValue7 == 0u) ? comparisonValue7 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue8 : ((sumValue8 == 0u) ? comparisonValue7 : 0.0));
                    vec3 vectorValue1 = vec3(comparisonValue9, comparisonValue13, 0.25);
                    float scalarValue18 = rdDot3Precise(vectorValue1, vectorValue1);
                    float inverseLengthValue1 = inversesqrt(scalarValue18);
                    productValue12 = sumValue * (inverseLengthValue1 * comparisonValue13);
                    productValue13 = sumValue * (inverseLengthValue1 * comparisonValue9);
                    productValue14 = inverseLengthValue1 * 0.25;
                }
                else
                {
                    productValue12 = 0.0;
                    productValue13 = 0.0;
                    productValue14 = 1.0;
                }
                intermediateValue34 = productValue12;
                intermediateValue35 = productValue13;
                intermediateValue36 = productValue14;
            }
            else
            {
                float intermediateValue55;
                float intermediateValue57;
                float intermediateValue59;
                if ((reinterpretedBits18 & 16u) == 16u)
                {
                    float multiplyAddValue20 = fma(varyingTexCoord0.x, scalarValue7, scalarValue9);
                    float multiplyAddValue21 = fma(varyingTexCoord0.y, scalarValue8, scalarValue10);
                    float sumValue9 = spvNMin(reinterpretedBits19, reinterpretedBits19 - scalarValue12);
                    vec4 sampledTextureValue8 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue20, multiplyAddValue21), 0.0);
                    float scalarValue19 = sampledTextureValue8.x;
                    float scalarValue20 = sampledTextureValue8.y;
                    float scalarValue21 = sampledTextureValue8.z;
                    float intermediateValue56;
                    float intermediateValue58;
                    float intermediateValue60;
                    if ((scalarValue20 == scalarValue19) && (scalarValue21 == scalarValue20))
                    {
                        float scalarValue22 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        float productValue19;
                        float productValue20;
                        float productValue21;
                        if (scalarValue22 > 0.0)
                        {
                            bool sampledTextureValue9 = uint(textureQueryLevels(materialTexture0)) > 0u;
                            uvec2 sampledTextureValue10 = uvec2(textureSize(materialTexture0, int(0u)));
                            uint scalarValue23 = sampledTextureValue10.x;
                            float comparisonValue14 = rdEvaluateFloatExpression2(sampledTextureValue9 ? scalarValue23 : 0u);
                            float comparisonValue15 = rdEvaluateFloatExpression2(sampledTextureValue9 ? sampledTextureValue10.y : 0u);
                            float productValue8 = fract(multiplyAddValue20 * comparisonValue14);
                            float productValue9 = fract(multiplyAddValue21 * comparisonValue15);
                            vec4 sampledTextureValue11 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue8 - 0.5) < 0.0625) ? (multiplyAddValue20 + ((productValue8 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue20, (abs(productValue9 - 0.5) < 0.0625) ? (multiplyAddValue21 + ((productValue9 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue21));
                            float scalarValue24 = sampledTextureValue11.x;
                            float scalarValue25 = sampledTextureValue11.y;
                            float scalarValue26 = sampledTextureValue11.z;
                            float scalarValue27 = sampledTextureValue11.w;
                            float multiplyAddValue22 = fract(fma(multiplyAddValue20, comparisonValue14, 0.5));
                            float multiplyAddValue23 = fract(fma(multiplyAddValue21, comparisonValue15, 0.5));
                            bool conditionValue2 = multiplyAddValue23 > 0.5;
                            bool conditionValue3 = multiplyAddValue22 > 0.5;
                            float comparisonValue16 = conditionValue2 ? scalarValue24 : scalarValue27;
                            float comparisonValue17 = conditionValue2 ? scalarValue25 : scalarValue26;
                            float comparisonValue18 = conditionValue3 ? scalarValue26 : scalarValue27;
                            float comparisonValue19 = conditionValue3 ? scalarValue25 : scalarValue24;
                            float sumValue10 = multiplyAddValue22 - 0.083333335816860198974609375;
                            float sumValue11 = multiplyAddValue22 + 0.083333335816860198974609375;
                            float sumValue12 = multiplyAddValue23 - 0.083333335816860198974609375;
                            float sumValue13 = multiplyAddValue23 + 0.083333335816860198974609375;
                            uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                            uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                            uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                            uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                            float comparisonValue20 = ((sumValue14 == 1u) ? comparisonValue17 : ((sumValue14 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue15 == 1u) ? comparisonValue17 : ((sumValue15 == 0u) ? comparisonValue16 : 0.0));
                            float comparisonValue21 = ((sumValue16 == 1u) ? comparisonValue19 : ((sumValue16 == 0u) ? comparisonValue18 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue19 : ((sumValue17 == 0u) ? comparisonValue18 : 0.0));
                            vec3 vectorValue2 = vec3(comparisonValue20, comparisonValue21, 0.25);
                            float scalarValue28 = rdDot3Precise(vectorValue2, vectorValue2);
                            float inverseLengthValue2 = inversesqrt(scalarValue28);
                            productValue19 = scalarValue22 * (inverseLengthValue2 * comparisonValue21);
                            productValue20 = scalarValue22 * (inverseLengthValue2 * comparisonValue20);
                            productValue21 = inverseLengthValue2 * 0.25;
                        }
                        else
                        {
                            productValue19 = 0.0;
                            productValue20 = 0.0;
                            productValue21 = 1.0;
                        }
                        intermediateValue56 = productValue19;
                        intermediateValue58 = productValue20;
                        intermediateValue60 = productValue21;
                    }
                    else
                    {
                        bool sampledTextureValue12 = uint(textureQueryLevels(materialTexture0)) > 0u;
                        uvec2 sampledTextureValue13 = uvec2(textureSize(materialTexture0, int(0u)));
                        uint scalarValue29 = sampledTextureValue13.x;
                        float comparisonValue22 = rdEvaluateFloatExpression2(sampledTextureValue12 ? scalarValue29 : 0u);
                        float comparisonValue23 = rdEvaluateFloatExpression2(sampledTextureValue12 ? sampledTextureValue13.y : 0u);
                        float sumValue18 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        bool conditionValue4 = sumValue18 > 0.0;
                        float productValue10 = fract(multiplyAddValue20 * comparisonValue22);
                        float productValue11 = fract(multiplyAddValue21 * comparisonValue23);
                        float multiplyAddValue24 = (productValue10 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue8.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue25 = (productValue11 <= 0.083333335816860198974609375) ? (-fma(scalarValue19, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue26 = (productValue10 >= 0.916666686534881591796875) ? (fma(scalarValue20, 2.0, -1.0) + multiplyAddValue24) : multiplyAddValue24;
                        float multiplyAddValue27 = (productValue11 >= 0.916666686534881591796875) ? (fma(scalarValue21, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                        bool comparisonValue24 = abs(multiplyAddValue26) >= 0.004999999888241291046142578125;
                        bool comparisonValue25 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue26 = vec3(comparisonValue24 ? multiplyAddValue26 : 0.0, comparisonValue25 ? multiplyAddValue27 : 0.0, 0.25);
                        float scalarValue30 = rdDot3Precise(comparisonValue26, comparisonValue26);
                        float inverseLengthValue3 = inversesqrt(scalarValue30);
                        intermediateValue56 = (conditionValue4 && comparisonValue25) ? (sumValue18 * (inverseLengthValue3 * multiplyAddValue27)) : 0.0;
                        intermediateValue58 = (conditionValue4 && comparisonValue24) ? (sumValue18 * (inverseLengthValue3 * multiplyAddValue26)) : 0.0;
                        intermediateValue60 = conditionValue4 ? (inverseLengthValue3 * 0.25) : 1.0;
                    }
                    intermediateValue55 = intermediateValue56;
                    intermediateValue57 = intermediateValue58;
                    intermediateValue59 = intermediateValue60;
                }
                else
                {
                    intermediateValue55 = 0.0;
                    intermediateValue57 = 0.0;
                    intermediateValue59 = 1.0;
                }
                intermediateValue34 = intermediateValue55;
                intermediateValue35 = intermediateValue57;
                intermediateValue36 = intermediateValue59;
            }
            multiplyAddValue15 = intermediateValue34;
            multiplyAddValue16 = intermediateValue35;
            multiplyAddValue17 = intermediateValue36;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits19 = uintBitsToFloat(intermediateValue1.packedValues[(scalarValue6 * 16u) + 15u]);
            float intermediateValue34;
            float intermediateValue35;
            float intermediateValue36;
            if ((reinterpretedBits18 & 8u) == 8u)
            {
                float sumValue = spvNClamp(2.0 - spvNMin(reinterpretedBits19, reinterpretedBits19 - scalarValue12), 0.0, 1.0);
                float productValue12;
                float productValue13;
                float productValue14;
                if (sumValue > 0.0)
                {
                    float multiplyAddValue12 = fma(varyingTexCoord0.x, scalarValue7, scalarValue9);
                    float multiplyAddValue13 = fma(varyingTexCoord0.y, scalarValue8, scalarValue10);
                    bool sampledTextureValue5 = uint(textureQueryLevels(materialTexture0)) > 0u;
                    uvec2 sampledTextureValue6 = uvec2(textureSize(materialTexture0, int(0u)));
                    uint scalarValue13 = sampledTextureValue6.x;
                    float comparisonValue2 = rdEvaluateFloatExpression2(sampledTextureValue5 ? scalarValue13 : 0u);
                    float comparisonValue3 = rdEvaluateFloatExpression2(sampledTextureValue5 ? sampledTextureValue6.y : 0u);
                    float productValue6 = fract(multiplyAddValue12 * comparisonValue2);
                    float productValue7 = fract(multiplyAddValue13 * comparisonValue3);
                    vec4 sampledTextureValue7 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue6 - 0.5) < 0.0625) ? (multiplyAddValue12 + ((productValue6 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue12, (abs(productValue7 - 0.5) < 0.0625) ? (multiplyAddValue13 + ((productValue7 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue13));
                    float scalarValue14 = sampledTextureValue7.x;
                    float scalarValue15 = sampledTextureValue7.y;
                    float scalarValue16 = sampledTextureValue7.z;
                    float scalarValue17 = sampledTextureValue7.w;
                    float multiplyAddValue18 = fract(fma(multiplyAddValue12, comparisonValue2, 0.5));
                    float multiplyAddValue19 = fract(fma(multiplyAddValue13, comparisonValue3, 0.5));
                    bool conditionValue = multiplyAddValue19 > 0.5;
                    bool conditionValue1 = multiplyAddValue18 > 0.5;
                    float comparisonValue4 = conditionValue ? scalarValue14 : scalarValue17;
                    float comparisonValue6 = conditionValue ? scalarValue15 : scalarValue16;
                    float comparisonValue7 = conditionValue1 ? scalarValue16 : scalarValue17;
                    float comparisonValue8 = conditionValue1 ? scalarValue15 : scalarValue14;
                    float sumValue1 = multiplyAddValue18 - 0.083333335816860198974609375;
                    float sumValue2 = multiplyAddValue18 + 0.083333335816860198974609375;
                    float sumValue3 = multiplyAddValue19 - 0.083333335816860198974609375;
                    float sumValue4 = multiplyAddValue19 + 0.083333335816860198974609375;
                    uint sumValue5 = uint(int(spvNClamp(sumValue1 + sumValue1, 0.0, 1.0)));
                    uint sumValue6 = uint(int(spvNClamp(sumValue2 + sumValue2, 0.0, 1.0)));
                    uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                    uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                    float comparisonValue9 = ((sumValue5 == 1u) ? comparisonValue6 : ((sumValue5 == 0u) ? comparisonValue4 : 0.0)) - ((sumValue6 == 1u) ? comparisonValue6 : ((sumValue6 == 0u) ? comparisonValue4 : 0.0));
                    float comparisonValue13 = ((sumValue7 == 1u) ? comparisonValue8 : ((sumValue7 == 0u) ? comparisonValue7 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue8 : ((sumValue8 == 0u) ? comparisonValue7 : 0.0));
                    vec3 vectorValue1 = vec3(comparisonValue9, comparisonValue13, 0.25);
                    float scalarValue18 = rdDot3Precise(vectorValue1, vectorValue1);
                    float inverseLengthValue1 = inversesqrt(scalarValue18);
                    productValue12 = sumValue * (inverseLengthValue1 * comparisonValue13);
                    productValue13 = sumValue * (inverseLengthValue1 * comparisonValue9);
                    productValue14 = inverseLengthValue1 * 0.25;
                }
                else
                {
                    productValue12 = 0.0;
                    productValue13 = 0.0;
                    productValue14 = 1.0;
                }
                intermediateValue34 = productValue12;
                intermediateValue35 = productValue13;
                intermediateValue36 = productValue14;
            }
            else
            {
                float intermediateValue55;
                float intermediateValue57;
                float intermediateValue59;
                if ((reinterpretedBits18 & 16u) == 16u)
                {
                    float multiplyAddValue20 = fma(varyingTexCoord0.x, scalarValue7, scalarValue9);
                    float multiplyAddValue21 = fma(varyingTexCoord0.y, scalarValue8, scalarValue10);
                    float sumValue9 = spvNMin(reinterpretedBits19, reinterpretedBits19 - scalarValue12);
                    vec4 sampledTextureValue8 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue20, multiplyAddValue21), 0.0);
                    float scalarValue19 = sampledTextureValue8.x;
                    float scalarValue20 = sampledTextureValue8.y;
                    float scalarValue21 = sampledTextureValue8.z;
                    float intermediateValue56;
                    float intermediateValue58;
                    float intermediateValue60;
                    if ((scalarValue20 == scalarValue19) && (scalarValue21 == scalarValue20))
                    {
                        float scalarValue22 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        float productValue19;
                        float productValue20;
                        float productValue21;
                        if (scalarValue22 > 0.0)
                        {
                            bool sampledTextureValue9 = uint(textureQueryLevels(materialTexture0)) > 0u;
                            uvec2 sampledTextureValue10 = uvec2(textureSize(materialTexture0, int(0u)));
                            uint scalarValue23 = sampledTextureValue10.x;
                            float comparisonValue14 = rdEvaluateFloatExpression2(sampledTextureValue9 ? scalarValue23 : 0u);
                            float comparisonValue15 = rdEvaluateFloatExpression2(sampledTextureValue9 ? sampledTextureValue10.y : 0u);
                            float productValue8 = fract(multiplyAddValue20 * comparisonValue14);
                            float productValue9 = fract(multiplyAddValue21 * comparisonValue15);
                            vec4 sampledTextureValue11 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue8 - 0.5) < 0.0625) ? (multiplyAddValue20 + ((productValue8 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue20, (abs(productValue9 - 0.5) < 0.0625) ? (multiplyAddValue21 + ((productValue9 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue21));
                            float scalarValue24 = sampledTextureValue11.x;
                            float scalarValue25 = sampledTextureValue11.y;
                            float scalarValue26 = sampledTextureValue11.z;
                            float scalarValue27 = sampledTextureValue11.w;
                            float multiplyAddValue22 = fract(fma(multiplyAddValue20, comparisonValue14, 0.5));
                            float multiplyAddValue23 = fract(fma(multiplyAddValue21, comparisonValue15, 0.5));
                            bool conditionValue2 = multiplyAddValue23 > 0.5;
                            bool conditionValue3 = multiplyAddValue22 > 0.5;
                            float comparisonValue16 = conditionValue2 ? scalarValue24 : scalarValue27;
                            float comparisonValue17 = conditionValue2 ? scalarValue25 : scalarValue26;
                            float comparisonValue18 = conditionValue3 ? scalarValue26 : scalarValue27;
                            float comparisonValue19 = conditionValue3 ? scalarValue25 : scalarValue24;
                            float sumValue10 = multiplyAddValue22 - 0.083333335816860198974609375;
                            float sumValue11 = multiplyAddValue22 + 0.083333335816860198974609375;
                            float sumValue12 = multiplyAddValue23 - 0.083333335816860198974609375;
                            float sumValue13 = multiplyAddValue23 + 0.083333335816860198974609375;
                            uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                            uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                            uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                            uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                            float comparisonValue20 = ((sumValue14 == 1u) ? comparisonValue17 : ((sumValue14 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue15 == 1u) ? comparisonValue17 : ((sumValue15 == 0u) ? comparisonValue16 : 0.0));
                            float comparisonValue21 = ((sumValue16 == 1u) ? comparisonValue19 : ((sumValue16 == 0u) ? comparisonValue18 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue19 : ((sumValue17 == 0u) ? comparisonValue18 : 0.0));
                            vec3 vectorValue2 = vec3(comparisonValue20, comparisonValue21, 0.25);
                            float scalarValue28 = rdDot3Precise(vectorValue2, vectorValue2);
                            float inverseLengthValue2 = inversesqrt(scalarValue28);
                            productValue19 = scalarValue22 * (inverseLengthValue2 * comparisonValue21);
                            productValue20 = scalarValue22 * (inverseLengthValue2 * comparisonValue20);
                            productValue21 = inverseLengthValue2 * 0.25;
                        }
                        else
                        {
                            productValue19 = 0.0;
                            productValue20 = 0.0;
                            productValue21 = 1.0;
                        }
                        intermediateValue56 = productValue19;
                        intermediateValue58 = productValue20;
                        intermediateValue60 = productValue21;
                    }
                    else
                    {
                        bool sampledTextureValue12 = uint(textureQueryLevels(materialTexture0)) > 0u;
                        uvec2 sampledTextureValue13 = uvec2(textureSize(materialTexture0, int(0u)));
                        uint scalarValue29 = sampledTextureValue13.x;
                        float comparisonValue22 = rdEvaluateFloatExpression2(sampledTextureValue12 ? scalarValue29 : 0u);
                        float comparisonValue23 = rdEvaluateFloatExpression2(sampledTextureValue12 ? sampledTextureValue13.y : 0u);
                        float sumValue18 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        bool conditionValue4 = sumValue18 > 0.0;
                        float productValue10 = fract(multiplyAddValue20 * comparisonValue22);
                        float productValue11 = fract(multiplyAddValue21 * comparisonValue23);
                        float multiplyAddValue24 = (productValue10 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue8.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue25 = (productValue11 <= 0.083333335816860198974609375) ? (-fma(scalarValue19, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue26 = (productValue10 >= 0.916666686534881591796875) ? (fma(scalarValue20, 2.0, -1.0) + multiplyAddValue24) : multiplyAddValue24;
                        float multiplyAddValue27 = (productValue11 >= 0.916666686534881591796875) ? (fma(scalarValue21, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                        bool comparisonValue24 = abs(multiplyAddValue26) >= 0.004999999888241291046142578125;
                        bool comparisonValue25 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue26 = vec3(comparisonValue24 ? multiplyAddValue26 : 0.0, comparisonValue25 ? multiplyAddValue27 : 0.0, 0.25);
                        float scalarValue30 = rdDot3Precise(comparisonValue26, comparisonValue26);
                        float inverseLengthValue3 = inversesqrt(scalarValue30);
                        intermediateValue56 = (conditionValue4 && comparisonValue25) ? (sumValue18 * (inverseLengthValue3 * multiplyAddValue27)) : 0.0;
                        intermediateValue58 = (conditionValue4 && comparisonValue24) ? (sumValue18 * (inverseLengthValue3 * multiplyAddValue26)) : 0.0;
                        intermediateValue60 = conditionValue4 ? (inverseLengthValue3 * 0.25) : 1.0;
                    }
                    intermediateValue55 = intermediateValue56;
                    intermediateValue57 = intermediateValue58;
                    intermediateValue59 = intermediateValue60;
                }
                else
                {
                    intermediateValue55 = 0.0;
                    intermediateValue57 = 0.0;
                    intermediateValue59 = 1.0;
                }
                intermediateValue34 = intermediateValue55;
                intermediateValue35 = intermediateValue57;
                intermediateValue36 = intermediateValue59;
            }
            multiplyAddValue14 = intermediateValue34;
            multiplyAddValue15 = intermediateValue35;
            multiplyAddValue16 = intermediateValue36;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            vec4 sampledTextureValue30 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue16, sampledTextureValue18), fma(varyingTexCoord0.y, sampledTextureValue17, sampledTextureValue19)));
            intermediateValue20 = (sampledTextureValue30.x * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue30.y * 2.0) + (-1.0);
            intermediateValue22 = (sampledTextureValue30.z * 2.0) + (-1.0);
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float intermediateValue25;
        float intermediateValue27;
        float intermediateValue29;
        float comparisonValue;
        if ((reinterpretedBits18 & 1u) == 1u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float intermediateValue10;
        float sampledTextureValue1;
        float sampledTextureValue2;
        float sampledTextureValue3;
        if ((scalarValue40 & 1u) == 0u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            vec4 reinterpretedBits20 = uintBitsToFloat(intermediateValue3.packedValues[scalarValue6 * 4u]);
            vec4 sampledTextureValue14 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, reinterpretedBits20.x, reinterpretedBits20.z), fma(varyingTexCoord0.y, reinterpretedBits20.y, reinterpretedBits20.w)));
            comparisonValue = ((reinterpretedBits18 & 2u) == 2u) ? sampledTextureValue14.w : scalarValue11;
            intermediateValue29 = sampledTextureValue14.x;
            intermediateValue27 = sampledTextureValue14.z;
            intermediateValue25 = sampledTextureValue14.y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            sampledTextureValue1 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 10u)).x);
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 11u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 9u)).x);
            intermediateValue10 = sampledTextureValue21;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            comparisonValue = scalarValue11;
            intermediateValue29 = reinterpretedBits16.w;
            intermediateValue27 = reinterpretedBits16.y;
            intermediateValue25 = reinterpretedBits16.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            vec4 sampledTextureValue31 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue6 * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue6 * 16u) + 3u)).x))));
            sampledTextureValue1 = sampledTextureValue31.y;
            sampledTextureValue3 = sampledTextureValue31.x;
            sampledTextureValue2 = sampledTextureValue31.z;
            intermediateValue10 = ((scalarValue40 & 2u) != 0u) ? sampledTextureValue31.w : sampledTextureValue21;
#endif
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue27 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue28 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue29 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue3 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue31 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue31);
        vec3 vectorValue4 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue32 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue32);
        vec3 vectorValue5 = vec3(comparisonValue27, comparisonValue28, comparisonValue29);
        float scalarValue33 = rdDot3Precise(vectorValue5, vectorValue5);
        float inverseLengthValue6 = inversesqrt(scalarValue33);
        intermediateValue24 = intermediateValue25;
        intermediateValue26 = intermediateValue27;
        multiplyAddValue8 = fma(inverseLengthValue6 * comparisonValue29, multiplyAddValue17, fma(inverseLengthValue4 * varyingTangent0.z, multiplyAddValue16, multiplyAddValue15 * (inverseLengthValue5 * varyingBitangent0.z)));
        multiplyAddValue9 = fma(inverseLengthValue6 * comparisonValue28, multiplyAddValue17, fma(inverseLengthValue4 * varyingTangent0.y, multiplyAddValue16, multiplyAddValue15 * (inverseLengthValue5 * varyingBitangent0.y)));
        multiplyAddValue10 = fma(inverseLengthValue6 * comparisonValue27, multiplyAddValue17, fma(inverseLengthValue4 * varyingTangent0.x, multiplyAddValue16, multiplyAddValue15 * (inverseLengthValue5 * varyingBitangent0.x)));
        intermediateValue28 = intermediateValue29;
        intermediateValue30 = comparisonValue;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue27 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue28 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue29 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue3 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue31 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue31);
        vec3 vectorValue4 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue32 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue32);
        vec3 vectorValue5 = vec3(comparisonValue27, comparisonValue28, comparisonValue29);
        float scalarValue33 = rdDot3Precise(vectorValue5, vectorValue5);
        float inverseLengthValue6 = inversesqrt(scalarValue33);
        intermediateValue24 = intermediateValue25;
        intermediateValue26 = intermediateValue27;
        multiplyAddValue7 = fma(inverseLengthValue6 * comparisonValue29, multiplyAddValue16, fma(inverseLengthValue4 * varyingTangent0.z, multiplyAddValue15, multiplyAddValue14 * (inverseLengthValue5 * varyingBitangent0.z)));
        multiplyAddValue8 = fma(inverseLengthValue6 * comparisonValue28, multiplyAddValue16, fma(inverseLengthValue4 * varyingTangent0.y, multiplyAddValue15, multiplyAddValue14 * (inverseLengthValue5 * varyingBitangent0.y)));
        multiplyAddValue9 = fma(inverseLengthValue6 * comparisonValue27, multiplyAddValue16, fma(inverseLengthValue4 * varyingTangent0.x, multiplyAddValue15, multiplyAddValue14 * (inverseLengthValue5 * varyingBitangent0.x)));
        intermediateValue28 = intermediateValue29;
        intermediateValue30 = comparisonValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float comparisonValue35 = comparisonValue30 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue36 = comparisonValue30 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue37 = comparisonValue30 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue12 = inversesqrt(dot(vec3(comparisonValue35, comparisonValue36, comparisonValue37), vec3(comparisonValue35, comparisonValue36, comparisonValue37)));
        float inverseLengthValue13 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue14 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue20;
        intermediateValue9 = intermediateValue10;
        intermediateValue11 = sampledTextureValue1;
        intermediateValue12 = sampledTextureValue2;
        intermediateValue13 = sampledTextureValue3;
        intermediateValue14 = fma(inverseLengthValue12 * comparisonValue35, intermediateValue22, fma(inverseLengthValue13 * varyingBitangent0.x, intermediateValue21, inverseLengthValue14 * varyingTangent0.x));
        intermediateValue15 = fma(inverseLengthValue12 * comparisonValue36, intermediateValue22, fma(inverseLengthValue13 * varyingBitangent0.y, intermediateValue21, inverseLengthValue14 * varyingTangent0.y));
        intermediateValue16 = fma(inverseLengthValue12 * comparisonValue37, intermediateValue22, fma(inverseLengthValue13 * varyingBitangent0.z, intermediateValue21, inverseLengthValue14 * varyingTangent0.z));
    }
    float sumValue26 = varyingTexCoord5.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue27 = varyingTexCoord5.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue28 = varyingTexCoord5.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue15 = inversesqrt(dot(vec3(intermediateValue14, intermediateValue15, intermediateValue16), vec3(intermediateValue14, intermediateValue15, intermediateValue16)));
    float productValue51 = inverseLengthValue15 * intermediateValue14;
    float productValue52 = inverseLengthValue15 * intermediateValue15;
    float productValue53 = inverseLengthValue15 * intermediateValue16;
    float quotientValue3 = 1.0 / ((abs(productValue52) + abs(productValue51)) + abs(productValue53));
    float productValue54 = quotientValue3 * productValue51;
    float productValue55 = quotientValue3 * productValue52;
    bool conditionValue11 = productValue53 < 0.0;
    float multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue39 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue28, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue19;
    float productValue20;
    float productValue21;
    if ((fragmentVectorConstants1.packedValues[27u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue56 = fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue19 = spvNClamp(productValue56, 0.0, 1.0);
        productValue20 = spvNClamp(((productValue56 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue56, 0.0, 1.0);
        productValue21 = spvNClamp((((productValue56 * productValue56) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue56, 0.0, 1.0);
#endif
    }
    else
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue24 = 0.0;
        intermediateValue26 = 1.0;
        multiplyAddValue8 = varyingNormal0.z;
        multiplyAddValue9 = varyingNormal0.y;
        multiplyAddValue10 = varyingNormal0.x;
        intermediateValue28 = 0.0;
        intermediateValue30 = 0.0;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue24 = 0.0;
        intermediateValue26 = 1.0;
        multiplyAddValue7 = varyingNormal0.z;
        multiplyAddValue8 = varyingNormal0.y;
        multiplyAddValue9 = varyingNormal0.x;
        intermediateValue28 = 0.0;
        intermediateValue30 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue19 = fragmentVectorConstants1.packedValues[18u].x;
        productValue20 = fragmentVectorConstants1.packedValues[18u].y;
        productValue21 = fragmentVectorConstants1.packedValues[18u].z;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits22 = varyingTexCoord5.x - uintBitsToFloat(reinterpretedBits21.x);
    float reinterpretedBits23 = varyingTexCoord5.y - uintBitsToFloat(reinterpretedBits21.y);
    float reinterpretedBits24 = varyingTexCoord5.z - uintBitsToFloat(reinterpretedBits21.z);
    fragmentColor1.w = (intermediateValue30 < intermediateValue28) ? fma(intermediateValue28, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue30, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(multiplyAddValue10, multiplyAddValue9, multiplyAddValue8);
    float scalarValue34 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue7 = inversesqrt(scalarValue34);
    float productValue15 = inverseLengthValue7 * multiplyAddValue10;
    float productValue16 = inverseLengthValue7 * multiplyAddValue9;
    float productValue17 = inverseLengthValue7 * multiplyAddValue8;
    float quotientValue = 1.0 / (abs(productValue17) + (abs(productValue16) + abs(productValue15)));
    float productValue18 = quotientValue * productValue15;
    float productValue22 = quotientValue * productValue16;
    bool conditionValue5 = productValue17 < 0.0;
    float sumValue19 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? ((1.0 - abs(productValue22)) * ((productValue18 >= 0.0) ? sumValue19 : (-1.0))) : productValue18;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue18)) * ((productValue22 >= 0.0) ? sumValue19 : (-1.0))) : productValue22;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue28 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue29 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits24, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits27.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits26.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits25.x))) + uintBitsToFloat(reinterpretedBits28.x)) / multiplyAddValue28, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits31.x), reinterpretedBits24, fma(uintBitsToFloat(reinterpretedBits30.x), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(reinterpretedBits29.x))) + uintBitsToFloat(reinterpretedBits32.x)) / multiplyAddValue29, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits27.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits26.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits25.y))) + uintBitsToFloat(reinterpretedBits28.y)) / multiplyAddValue28, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits31.y), reinterpretedBits24, fma(uintBitsToFloat(reinterpretedBits30.y), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(reinterpretedBits29.y))) + uintBitsToFloat(reinterpretedBits32.y)) / multiplyAddValue29, 0.5, 0.5);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
    bool reinterpretedBits34 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits33 > 9.9999997473787516355514526367188e-05);
    float productValue23 = reinterpretedBits33 * reinterpretedBits33;
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits36 = (reinterpretedBits34 ? spvNMin(productValue23, 1.0) : uintBitsToFloat(reinterpretedBits35.x)) * 0.16666667163372039794921875;
    float multiplyAddValue30 = (reinterpretedBits34 ? spvNMin(fma(fma(productValue23, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue23, 1.0) : uintBitsToFloat(reinterpretedBits35.y)) * 0.16666667163372039794921875;
    float multiplyAddValue31 = (reinterpretedBits34 ? spvNMin(fma(productValue23 * productValue23, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue23, 1.0) : uintBitsToFloat(reinterpretedBits35.z)) * 0.16666667163372039794921875;
    float productValue24 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue30, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue31, reinterpretedBits36)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue30 / productValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits36 / productValue24, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue31 / productValue24, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue24, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[109u])), 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue26, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits22 = varyingTexCoord5.x - uintBitsToFloat(reinterpretedBits21.x);
    float reinterpretedBits23 = varyingTexCoord5.y - uintBitsToFloat(reinterpretedBits21.y);
    float reinterpretedBits24 = varyingTexCoord5.z - uintBitsToFloat(reinterpretedBits21.z);
    fragmentColor1.w = (intermediateValue30 < intermediateValue28) ? fma(intermediateValue28, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue30, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue7 = vec3(multiplyAddValue9, multiplyAddValue8, multiplyAddValue7);
    float scalarValue58 = rdDot3Precise(vectorValue7, vectorValue7);
    float inverseLengthValue16 = inversesqrt(scalarValue58);
    float productValue69 = inverseLengthValue16 * multiplyAddValue9;
    float productValue70 = inverseLengthValue16 * multiplyAddValue8;
    float productValue71 = inverseLengthValue16 * multiplyAddValue7;
    float quotientValue4 = 1.0 / (abs(productValue71) + (abs(productValue70) + abs(productValue69)));
    float productValue72 = quotientValue4 * productValue69;
    float productValue73 = quotientValue4 * productValue70;
    bool conditionValue12 = productValue71 < 0.0;
    float sumValue19 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue12 ? ((1.0 - abs(productValue73)) * ((productValue72 >= 0.0) ? sumValue19 : (-1.0))) : productValue72;
    fragmentColor2.y = conditionValue12 ? ((1.0 - abs(productValue72)) * ((productValue73 >= 0.0) ? sumValue19 : (-1.0))) : productValue73;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue28 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue29 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits24, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits27.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits26.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits25.x))) + uintBitsToFloat(reinterpretedBits28.x)) / multiplyAddValue28, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits31.x), reinterpretedBits24, fma(uintBitsToFloat(reinterpretedBits30.x), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(reinterpretedBits29.x))) + uintBitsToFloat(reinterpretedBits32.x)) / multiplyAddValue29, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits27.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits26.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits25.y))) + uintBitsToFloat(reinterpretedBits28.y)) / multiplyAddValue28, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits31.y), reinterpretedBits24, fma(uintBitsToFloat(reinterpretedBits30.y), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(reinterpretedBits29.y))) + uintBitsToFloat(reinterpretedBits32.y)) / multiplyAddValue29, 0.5, 0.5);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
    bool reinterpretedBits34 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits33 > 9.9999997473787516355514526367188e-05);
    float productValue23 = reinterpretedBits33 * reinterpretedBits33;
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits36 = (reinterpretedBits34 ? spvNMin(productValue23, 1.0) : uintBitsToFloat(reinterpretedBits35.x)) * 0.16666667163372039794921875;
    float multiplyAddValue30 = (reinterpretedBits34 ? spvNMin(fma(fma(productValue23, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue23, 1.0) : uintBitsToFloat(reinterpretedBits35.y)) * 0.16666667163372039794921875;
    float multiplyAddValue31 = (reinterpretedBits34 ? spvNMin(fma(productValue23 * productValue23, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue23, 1.0) : uintBitsToFloat(reinterpretedBits35.z)) * 0.16666667163372039794921875;
    float productValue24 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue30, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue31, reinterpretedBits36)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue30 / productValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits36 / productValue24, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue31 / productValue24, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue24, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[109u])), 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue26, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue57 = intermediateValue19 * 0.16666667163372039794921875;
    float productValue58 = productValue20 * 0.16666667163372039794921875;
    float productValue59 = productValue21 * 0.16666667163372039794921875;
    float productValue60 = ceil(spvNClamp(spvNMax(spvNMax(productValue57, productValue59), spvNMax(productValue58, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue11, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue57 / productValue60, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue58 / productValue60, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue59 / productValue60, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue60, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[27u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue31) * fragmentVectorConstants1.packedValues[13u].w) + productValue31;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue32) * fragmentVectorConstants1.packedValues[13u].w) + productValue32;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue33) * fragmentVectorConstants1.packedValues[13u].w) + productValue33;
    fragmentColor1.w = (intermediateValue13 > intermediateValue9) ? ((intermediateValue13 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue9 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue11 ? (((productValue54 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue55))) : productValue54;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue54)) * ((productValue55 < 0.0) ? (-1.0) : 1.0)) : productValue55;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue38) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue39)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue38) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue39)) * 0.5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue57 = intermediateValue19 * 0.16666667163372039794921875;
    float productValue58 = productValue20 * 0.16666667163372039794921875;
    float productValue59 = productValue21 * 0.16666667163372039794921875;
    float productValue60 = ceil(spvNClamp(spvNMax(spvNMax(productValue57, productValue59), spvNMax(productValue58, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue11, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue57 / productValue60, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue58 / productValue60, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue59 / productValue60, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue60, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[27u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue66) * fragmentVectorConstants1.packedValues[13u].w) + productValue66;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue67) * fragmentVectorConstants1.packedValues[13u].w) + productValue67;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue68) * fragmentVectorConstants1.packedValues[13u].w) + productValue68;
    fragmentColor1.w = (intermediateValue13 > intermediateValue9) ? ((intermediateValue13 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue9 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue11 ? (((productValue54 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue55))) : productValue54;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue54)) * ((productValue55 < 0.0) ? (-1.0) : 1.0)) : productValue55;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue38) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue28, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue39)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue38) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue28, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue27, sumValue26 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue39)) * 0.5;
#endif
    discardIfRequested();
}
