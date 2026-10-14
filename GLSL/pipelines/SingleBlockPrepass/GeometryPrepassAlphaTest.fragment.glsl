#version 460
#extension GL_GOOGLE_include_directive : require
// SingleBlockPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 8
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

#include "../../include/materials/SingleBlockPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue22 = sampledTextureValue21.x;
    float scalarValue23 = sampledTextureValue21.y;
    float scalarValue24 = sampledTextureValue21.z;
    float scalarValue25 = sampledTextureValue21.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue26 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue26);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits), -(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float reinterpretedBits6 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[81u])) - reinterpretedBits5)) * (reinterpretedBits4 - reinterpretedBits5), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[22u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[82u]));
    float multiplyAddValue14 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue15 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue42 = floor(multiplyAddValue15 * 0.25);
    float productValue43 = floor(multiplyAddValue15 * 0.5);
    float scalarValue27 = floor(multiplyAddValue15);
    if ((scalarValue25 < 0.5) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue14 * 0.25), 0.5, (productValue42 * productValue42) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue14 * 0.5), 0.5, (productValue43 * productValue43) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue14), 0.5, (scalarValue27 * scalarValue27) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits6 * reinterpretedBits6) * fma(reinterpretedBits6, -2.0, 3.0)))))
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue26 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue26);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits), -(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits32 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]));
    float reinterpretedBits33 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) - reinterpretedBits32)) * (reinterpretedBits4 - reinterpretedBits32), 0.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[21u]);
    float reinterpretedBits35 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]));
    float multiplyAddValue32 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.x)) / reinterpretedBits35) * reinterpretedBits35;
    float multiplyAddValue33 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.y)) / reinterpretedBits35) * reinterpretedBits35;
    float productValue57 = floor(multiplyAddValue33 * 0.25);
    float productValue58 = floor(multiplyAddValue33 * 0.5);
    float scalarValue56 = floor(multiplyAddValue33);
    if ((sampledTextureValue21.w < 0.5) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue32 * 0.25), 0.5, (productValue57 * productValue57) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue32 * 0.5), 0.5, (productValue58 * productValue58) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue32), 0.5, (scalarValue56 * scalarValue56) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits33 * reinterpretedBits33) * fma(reinterpretedBits33, -2.0, 3.0)))))
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue2 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
    uint scalarValue = uint(varyingTexCoord4);
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.z;
    float scalarValue4 = sampledTextureValue.w;
    bool comparisonValue1;
    if (fragmentVectorConstants1.packedValues[23u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[20u].x) / (fragmentVectorConstants1.packedValues[20u].y - fragmentVectorConstants1.packedValues[20u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[22u].x) / fragmentVectorConstants1.packedValues[20u].z) * fragmentVectorConstants1.packedValues[20u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[22u].y) / fragmentVectorConstants1.packedValues[20u].z) * fragmentVectorConstants1.packedValues[20u].z;
        float productValue = floor(quotientValue1 * 0.25);
        float productValue1 = floor(quotientValue1 * 0.5);
        float scalarValue5 = floor(quotientValue1);
        comparisonValue1 = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue1 * productValue1) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue * productValue) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue5 * scalarValue5) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue1 = false;
    }
    if ((scalarValue4 < 0.5) || comparisonValue1)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue2 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
    uint scalarValue = uint(varyingTexCoord4);
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    bool comparisonValue1;
    if (fragmentVectorConstants1.packedValues[22u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[19u].x) / (fragmentVectorConstants1.packedValues[19u].y - fragmentVectorConstants1.packedValues[19u].x), 0.0, 1.0);
        float quotientValue4 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[21u].x) / fragmentVectorConstants1.packedValues[19u].z) * fragmentVectorConstants1.packedValues[19u].z;
        float quotientValue5 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[21u].y) / fragmentVectorConstants1.packedValues[19u].z) * fragmentVectorConstants1.packedValues[19u].z;
        float productValue67 = floor(quotientValue5 * 0.25);
        float productValue68 = floor(quotientValue5 * 0.5);
        float scalarValue78 = floor(quotientValue5);
        comparisonValue1 = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue68 * productValue68) * 0.75) + (floor(quotientValue4 * 0.5) * 0.5)) + (fract(((productValue67 * productValue67) * 0.75) + (floor(quotientValue4 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue78 * scalarValue78) * 0.75) + (floor(quotientValue4) * 0.5)));
    }
    else
    {
        comparisonValue1 = false;
    }
    if ((sampledTextureValue.w < 0.5) || comparisonValue1)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    bool reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u])) != 0.0;
    fragmentColor1.x = reinterpretedBits9 ? (fma(scalarValue25, fma(scalarValue22, varyingColor0.x, -scalarValue22), scalarValue22) * varyingColor0.w) : (scalarValue22 * varyingColor0.x);
    fragmentColor1.y = reinterpretedBits9 ? (fma(scalarValue25, fma(scalarValue23, varyingColor0.y, -scalarValue23), scalarValue23) * varyingColor0.w) : (scalarValue23 * varyingColor0.y);
    fragmentColor1.z = reinterpretedBits9 ? (fma(scalarValue25, fma(scalarValue24, varyingColor0.z, -scalarValue24), scalarValue24) * varyingColor0.w) : (scalarValue24 * varyingColor0.z);
    uint scalarValue = uint(varyingTexCoord4);
    float intermediateValue24;
    float intermediateValue26;
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    float intermediateValue28;
    float intermediateValue30;
    if (scalarValue != 65535u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue33 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingColor0.x, varyingColor0.y));
    fragmentColor1.x = (sampledTextureValue21.x * fma(varyingColor0.z, fma(sampledTextureValue33.x, 2.0, -1.0), 1.0)) * varyingColor0.w;
    fragmentColor1.y = (sampledTextureValue21.y * fma(varyingColor0.z, fma(sampledTextureValue33.y, 2.0, -1.0), 1.0)) * varyingColor0.w;
    fragmentColor1.z = (sampledTextureValue21.z * fma(varyingColor0.z, fma(sampledTextureValue33.z, 2.0, -1.0), 1.0)) * varyingColor0.w;
    uint scalarValue = uint(varyingTexCoord4);
    float intermediateValue22;
    float intermediateValue24;
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    float intermediateValue26;
    float intermediateValue28;
    if (scalarValue != 65535u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue2 = scalarValue1 * varyingColor0.x;
    float productValue3 = scalarValue2 * varyingColor0.y;
    float productValue4 = scalarValue3 * varyingColor0.z;
    float productValue5;
    float productValue6;
    float productValue7;
    if (fragmentVectorConstants1.packedValues[18u].x != 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue39 = texture(sampler2D(seasonsTextureTexture, seasonsTextureSampler), vec2(varyingColor0.x, varyingColor0.y));
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if (scalarValue == 65535u)
#endif
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits10 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue * 4u) + 1u]);
        float scalarValue28 = reinterpretedBits10.x;
        float scalarValue29 = reinterpretedBits10.y;
        float scalarValue30 = reinterpretedBits10.z;
        float scalarValue31 = reinterpretedBits10.w;
        vec4 reinterpretedBits11 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue * 4u) + 2u]);
        vec2 reinterpretedBits12 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue * 8u) + 6u]);
        float scalarValue32 = reinterpretedBits12.x;
        float scalarValue33 = reinterpretedBits12.y;
        uint reinterpretedBits13 = floatBitsToUint(reinterpretedBits11.x);
        float multiplyAddValue9;
        float multiplyAddValue10;
        float multiplyAddValue11;
        if ((reinterpretedBits13 & 4u) == 4u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits36 = uintBitsToFloat(intermediateValue4.packedValues[(scalarValue * 4u) + 1u]);
        float scalarValue57 = reinterpretedBits36.x;
        float scalarValue58 = reinterpretedBits36.y;
        float scalarValue59 = reinterpretedBits36.z;
        float scalarValue60 = reinterpretedBits36.w;
        vec4 reinterpretedBits37 = uintBitsToFloat(intermediateValue4.packedValues[(scalarValue * 4u) + 2u]);
        vec2 reinterpretedBits38 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue * 8u) + 6u]);
        float scalarValue61 = reinterpretedBits38.x;
        float scalarValue62 = reinterpretedBits38.y;
        uint reinterpretedBits39 = floatBitsToUint(reinterpretedBits37.x);
        float multiplyAddValue9;
        float multiplyAddValue10;
        float multiplyAddValue11;
        if ((reinterpretedBits39 & 4u) == 4u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue5 = (((productValue2 - scalarValue1) * scalarValue4) + scalarValue1) * varyingColor0.w;
        productValue6 = (((productValue3 - scalarValue2) * scalarValue4) + scalarValue2) * varyingColor0.w;
        productValue7 = (((productValue4 - scalarValue3) * scalarValue4) + scalarValue3) * varyingColor0.w;
    }
    else
    {
        productValue5 = productValue2;
        productValue6 = productValue3;
        productValue7 = productValue4;
    }
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if (scalarValue == 65535u)
    {
        intermediateValue8 = 0.0;
        intermediateValue9 = 1.0;
        intermediateValue10 = 0.0;
        intermediateValue11 = 0.0;
        intermediateValue13 = 0.0;
        intermediateValue14 = 1.0;
        intermediateValue15 = 0.0;
    }
    else
    {
        float sampledTextureValue5 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 4u)).x);
        float sampledTextureValue6 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 5u)).x);
        float sampledTextureValue7 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 6u)).x);
        float sampledTextureValue8 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 7u)).x);
        uvec4 sampledTextureValue9 = texelFetch(pbrData, int((scalarValue * 16u) + 8u));
        uint scalarValue6 = sampledTextureValue9.x;
        float sampledTextureValue10 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 12u)).x);
        float sampledTextureValue11 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 13u)).x);
        float sampledTextureValue12 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 15u)).x);
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
        if ((scalarValue6 & 4u) == 0u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue4 = 0.0;
        intermediateValue5 = 1.0;
        intermediateValue6 = 0.0;
        intermediateValue7 = 0.0;
        intermediateValue9 = 0.0;
        intermediateValue10 = 1.0;
        intermediateValue11 = 0.0;
    }
    else
    {
        float sampledTextureValue5 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 4u)).x);
        float sampledTextureValue6 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 5u)).x);
        float sampledTextureValue7 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 6u)).x);
        float sampledTextureValue8 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 7u)).x);
        uvec4 sampledTextureValue9 = texelFetch(pbrData, int((scalarValue * 16u) + 8u));
        uint scalarValue6 = sampledTextureValue9.x;
        float sampledTextureValue10 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 12u)).x);
        float sampledTextureValue11 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 13u)).x);
        float sampledTextureValue12 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 15u)).x);
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        if ((scalarValue6 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue22 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, scalarValue28, scalarValue30), fma(varyingTexCoord0.y, scalarValue29, scalarValue31)));
            multiplyAddValue9 = fma(sampledTextureValue22.y, 2.0, -1.0);
            multiplyAddValue10 = fma(sampledTextureValue22.x, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue22.z, 2.0, -1.0);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue34 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, scalarValue57, scalarValue59), fma(varyingTexCoord0.y, scalarValue58, scalarValue60)));
            multiplyAddValue9 = fma(sampledTextureValue34.y, 2.0, -1.0);
            multiplyAddValue10 = fma(sampledTextureValue34.x, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue34.z, 2.0, -1.0);
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
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
                    float multiplyAddValue = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                    float multiplyAddValue1 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                    vec4 sampledTextureValue13 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue, multiplyAddValue1), 0.0);
                    float scalarValue7 = sampledTextureValue13.x;
                    float scalarValue8 = sampledTextureValue13.y;
                    float scalarValue9 = sampledTextureValue13.z;
                    float multiplyAddValue5 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue = multiplyAddValue5 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue7 == scalarValue8) && (scalarValue8 == scalarValue9))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue)
                        {
                            uvec2 sampledTextureValue14 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue10 = float(int(uint(int(float(int(sampledTextureValue14.x)))))) * multiplyAddValue;
                            float productValue11 = float(int(uint(int(float(int(sampledTextureValue14.y)))))) * multiplyAddValue1;
                            float scalarValue10 = fract(productValue10);
                            float scalarValue11 = fract(productValue11);
                            float comparisonValue11;
                            if (abs(scalarValue10 + (-0.5)) < 0.0625)
                            {
                                comparisonValue11 = ((scalarValue10 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue;
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue;
                            }
                            float comparisonValue12;
                            if (abs(scalarValue11 + (-0.5)) < 0.0625)
                            {
                                comparisonValue12 = ((scalarValue11 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue1;
                            }
                            else
                            {
                                comparisonValue12 = multiplyAddValue1;
                            }
                            vec4 sampledTextureValue15 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue11, comparisonValue12));
                            float scalarValue12 = sampledTextureValue15.x;
                            float scalarValue13 = sampledTextureValue15.y;
                            float scalarValue14 = sampledTextureValue15.z;
                            float scalarValue15 = sampledTextureValue15.w;
                            float sumValue = fract(productValue10 + 0.5);
                            float sumValue1 = fract(productValue11 + 0.5);
                            bool conditionValue1 = sumValue1 > 0.5;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue1 ? scalarValue12 : scalarValue15;
                            intermediateValue1[1u] = conditionValue1 ? scalarValue13 : scalarValue14;
                            float productValue16 = intermediateValue1[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue17 = intermediateValue1[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue2 = productValue16 - productValue17;
                            bool conditionValue2 = sumValue > 0.5;
                            intermediateValue1[0u] = conditionValue2 ? scalarValue14 : scalarValue15;
                            intermediateValue1[1u] = conditionValue2 ? scalarValue13 : scalarValue12;
                            float productValue18 = intermediateValue1[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue18, 0.25), vec3(sumValue2, productValue18, 0.25)));
                            float productValue22 = inverseLengthValue1 * multiplyAddValue5;
                            branchMergedValue12 = productValue22 * sumValue2;
                            branchMergedValue14 = productValue22 * productValue18;
                            branchMergedValue15 = inverseLengthValue1 * 0.25;
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
                        uvec2 sampledTextureValue16 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue)
                        {
                            float productValue23 = fract(float(int(uint(int(float(int(sampledTextureValue16.x)))))) * multiplyAddValue);
                            float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue16.y)))))) * multiplyAddValue1);
                            float comparisonValue3 = (((productValue23 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue8 * 2.0) + (-1.0))) - (((productValue23 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue13.w * 2.0) + (-1.0)));
                            float comparisonValue4 = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue9 * 2.0) + (-1.0))) - (((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue7 * 2.0) + (-1.0)));
                            float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                            float comparisonValue7 = ((abs(comparisonValue4) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue4;
                            float inverseLengthValue2 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, 0.25), vec3(comparisonValue6, comparisonValue7, 0.25)));
                            float productValue25 = inverseLengthValue2 * multiplyAddValue5;
                            branchMergedValue13 = productValue25 * comparisonValue6;
                            branchMergedValue16 = productValue25 * comparisonValue7;
                            branchMergedValue17 = inverseLengthValue2 * 0.25;
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
                float multiplyAddValue6 = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                float multiplyAddValue7 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                float multiplyAddValue8 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue8 > 0.0)
                {
                    uvec2 sampledTextureValue17 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue26 = float(int(uint(int(float(int(sampledTextureValue17.x)))))) * multiplyAddValue6;
                    float productValue27 = float(int(uint(int(float(int(sampledTextureValue17.y)))))) * multiplyAddValue7;
                    float scalarValue16 = fract(productValue26);
                    float scalarValue17 = fract(productValue27);
                    float comparisonValue5;
                    if (abs(scalarValue16 + (-0.5)) < 0.0625)
                    {
                        comparisonValue5 = ((scalarValue16 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue6;
                    }
                    else
                    {
                        comparisonValue5 = multiplyAddValue6;
                    }
                    float comparisonValue10;
                    if (abs(scalarValue17 + (-0.5)) < 0.0625)
                    {
                        comparisonValue10 = ((scalarValue17 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue7;
                    }
                    else
                    {
                        comparisonValue10 = multiplyAddValue7;
                    }
                    vec4 sampledTextureValue18 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue5, comparisonValue10));
                    float scalarValue18 = sampledTextureValue18.x;
                    float scalarValue19 = sampledTextureValue18.y;
                    float scalarValue20 = sampledTextureValue18.z;
                    float scalarValue21 = sampledTextureValue18.w;
                    float sumValue3 = fract(productValue26 + 0.5);
                    float sumValue4 = fract(productValue27 + 0.5);
                    bool conditionValue3 = sumValue4 > 0.5;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue3 ? scalarValue18 : scalarValue21;
                    intermediateValue2[1u] = conditionValue3 ? scalarValue19 : scalarValue20;
                    float productValue28 = intermediateValue2[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue29 = intermediateValue2[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue5 = productValue28 - productValue29;
                    bool conditionValue4 = sumValue3 > 0.5;
                    intermediateValue2[0u] = conditionValue4 ? scalarValue20 : scalarValue21;
                    intermediateValue2[1u] = conditionValue4 ? scalarValue19 : scalarValue18;
                    float productValue30 = intermediateValue2[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue2[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue3 = inversesqrt(dot(vec3(sumValue5, productValue30, 0.25), vec3(sumValue5, productValue30, 0.25)));
                    float productValue31 = inverseLengthValue3 * multiplyAddValue8;
                    branchMergedValue4 = productValue31 * sumValue5;
                    branchMergedValue7 = productValue31 * productValue30;
                    branchMergedValue8 = inverseLengthValue3 * 0.25;
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
            intermediateValue19 = branchMergedValue;
            intermediateValue20 = branchMergedValue1;
            intermediateValue21 = branchMergedValue2;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
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
                    float multiplyAddValue = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                    float multiplyAddValue1 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                    vec4 sampledTextureValue13 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue, multiplyAddValue1), 0.0);
                    float scalarValue7 = sampledTextureValue13.x;
                    float scalarValue8 = sampledTextureValue13.y;
                    float scalarValue9 = sampledTextureValue13.z;
                    float multiplyAddValue5 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue = multiplyAddValue5 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue7 == scalarValue8) && (scalarValue8 == scalarValue9))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue)
                        {
                            uvec2 sampledTextureValue14 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue10 = float(int(uint(int(float(int(sampledTextureValue14.x)))))) * multiplyAddValue;
                            float productValue11 = float(int(uint(int(float(int(sampledTextureValue14.y)))))) * multiplyAddValue1;
                            float scalarValue10 = fract(productValue10);
                            float scalarValue11 = fract(productValue11);
                            float comparisonValue11;
                            if (abs(scalarValue10 + (-0.5)) < 0.0625)
                            {
                                comparisonValue11 = ((scalarValue10 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue;
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue;
                            }
                            float comparisonValue12;
                            if (abs(scalarValue11 + (-0.5)) < 0.0625)
                            {
                                comparisonValue12 = ((scalarValue11 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue1;
                            }
                            else
                            {
                                comparisonValue12 = multiplyAddValue1;
                            }
                            vec4 sampledTextureValue15 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue11, comparisonValue12));
                            float scalarValue12 = sampledTextureValue15.x;
                            float scalarValue13 = sampledTextureValue15.y;
                            float scalarValue14 = sampledTextureValue15.z;
                            float scalarValue15 = sampledTextureValue15.w;
                            float sumValue = fract(productValue10 + 0.5);
                            float sumValue1 = fract(productValue11 + 0.5);
                            bool conditionValue1 = sumValue1 > 0.5;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue1 ? scalarValue12 : scalarValue15;
                            intermediateValue1[1u] = conditionValue1 ? scalarValue13 : scalarValue14;
                            float productValue16 = intermediateValue1[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue17 = intermediateValue1[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue2 = productValue16 - productValue17;
                            bool conditionValue2 = sumValue > 0.5;
                            intermediateValue1[0u] = conditionValue2 ? scalarValue14 : scalarValue15;
                            intermediateValue1[1u] = conditionValue2 ? scalarValue13 : scalarValue12;
                            float productValue18 = intermediateValue1[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue18, 0.25), vec3(sumValue2, productValue18, 0.25)));
                            float productValue22 = inverseLengthValue1 * multiplyAddValue5;
                            branchMergedValue12 = productValue22 * sumValue2;
                            branchMergedValue14 = productValue22 * productValue18;
                            branchMergedValue15 = inverseLengthValue1 * 0.25;
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
                        uvec2 sampledTextureValue16 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue)
                        {
                            float productValue23 = fract(float(int(uint(int(float(int(sampledTextureValue16.x)))))) * multiplyAddValue);
                            float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue16.y)))))) * multiplyAddValue1);
                            float comparisonValue3 = (((productValue23 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue8 * 2.0) + (-1.0))) - (((productValue23 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue13.w * 2.0) + (-1.0)));
                            float comparisonValue4 = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue9 * 2.0) + (-1.0))) - (((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue7 * 2.0) + (-1.0)));
                            float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                            float comparisonValue7 = ((abs(comparisonValue4) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue4;
                            float inverseLengthValue2 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, 0.25), vec3(comparisonValue6, comparisonValue7, 0.25)));
                            float productValue25 = inverseLengthValue2 * multiplyAddValue5;
                            branchMergedValue13 = productValue25 * comparisonValue6;
                            branchMergedValue16 = productValue25 * comparisonValue7;
                            branchMergedValue17 = inverseLengthValue2 * 0.25;
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
                float multiplyAddValue6 = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                float multiplyAddValue7 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                float multiplyAddValue8 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue8 > 0.0)
                {
                    uvec2 sampledTextureValue17 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue26 = float(int(uint(int(float(int(sampledTextureValue17.x)))))) * multiplyAddValue6;
                    float productValue27 = float(int(uint(int(float(int(sampledTextureValue17.y)))))) * multiplyAddValue7;
                    float scalarValue16 = fract(productValue26);
                    float scalarValue17 = fract(productValue27);
                    float comparisonValue5;
                    if (abs(scalarValue16 + (-0.5)) < 0.0625)
                    {
                        comparisonValue5 = ((scalarValue16 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue6;
                    }
                    else
                    {
                        comparisonValue5 = multiplyAddValue6;
                    }
                    float comparisonValue10;
                    if (abs(scalarValue17 + (-0.5)) < 0.0625)
                    {
                        comparisonValue10 = ((scalarValue17 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue7;
                    }
                    else
                    {
                        comparisonValue10 = multiplyAddValue7;
                    }
                    vec4 sampledTextureValue18 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue5, comparisonValue10));
                    float scalarValue18 = sampledTextureValue18.x;
                    float scalarValue19 = sampledTextureValue18.y;
                    float scalarValue20 = sampledTextureValue18.z;
                    float scalarValue21 = sampledTextureValue18.w;
                    float sumValue3 = fract(productValue26 + 0.5);
                    float sumValue4 = fract(productValue27 + 0.5);
                    bool conditionValue3 = sumValue4 > 0.5;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue3 ? scalarValue18 : scalarValue21;
                    intermediateValue2[1u] = conditionValue3 ? scalarValue19 : scalarValue20;
                    float productValue28 = intermediateValue2[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue29 = intermediateValue2[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue5 = productValue28 - productValue29;
                    bool conditionValue4 = sumValue3 > 0.5;
                    intermediateValue2[0u] = conditionValue4 ? scalarValue20 : scalarValue21;
                    intermediateValue2[1u] = conditionValue4 ? scalarValue19 : scalarValue18;
                    float productValue30 = intermediateValue2[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue2[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue3 = inversesqrt(dot(vec3(sumValue5, productValue30, 0.25), vec3(sumValue5, productValue30, 0.25)));
                    float productValue31 = inverseLengthValue3 * multiplyAddValue8;
                    branchMergedValue4 = productValue31 * sumValue5;
                    branchMergedValue7 = productValue31 * productValue30;
                    branchMergedValue8 = inverseLengthValue3 * 0.25;
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
            intermediateValue15 = branchMergedValue;
            intermediateValue16 = branchMergedValue1;
            intermediateValue17 = branchMergedValue2;
#endif
        }
        else
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits14 = uintBitsToFloat(intermediateValue1.packedValues[(scalarValue * 16u) + 15u]);
            float intermediateValue34;
            float intermediateValue35;
            float intermediateValue36;
            if ((reinterpretedBits13 & 8u) == 8u)
            {
                float sumValue9 = spvNClamp(2.0 - spvNMin(reinterpretedBits14, reinterpretedBits14 - scalarValue33), 0.0, 1.0);
                float productValue12;
                float productValue13;
                float productValue14;
                if (sumValue9 > 0.0)
                {
                    float multiplyAddValue16 = fma(varyingTexCoord0.x, scalarValue28, scalarValue30);
                    float multiplyAddValue17 = fma(varyingTexCoord0.y, scalarValue29, scalarValue31);
                    bool sampledTextureValue23 = uint(textureQueryLevels(materialTexture0)) > 0u;
                    uvec2 sampledTextureValue24 = uvec2(textureSize(materialTexture0, int(0u)));
                    uint scalarValue34 = sampledTextureValue24.x;
                    float comparisonValue14 = rdEvaluateFloatExpression2(sampledTextureValue23 ? scalarValue34 : 0u);
                    float comparisonValue15 = rdEvaluateFloatExpression2(sampledTextureValue23 ? sampledTextureValue24.y : 0u);
                    float productValue44 = fract(multiplyAddValue16 * comparisonValue14);
                    float productValue45 = fract(multiplyAddValue17 * comparisonValue15);
                    vec4 sampledTextureValue25 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue44 - 0.5) < 0.0625) ? (multiplyAddValue16 + ((productValue44 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue16, (abs(productValue45 - 0.5) < 0.0625) ? (multiplyAddValue17 + ((productValue45 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue17));
                    float scalarValue35 = sampledTextureValue25.x;
                    float scalarValue36 = sampledTextureValue25.y;
                    float scalarValue37 = sampledTextureValue25.z;
                    float scalarValue38 = sampledTextureValue25.w;
                    float multiplyAddValue18 = fract(fma(multiplyAddValue16, comparisonValue14, 0.5));
                    float multiplyAddValue19 = fract(fma(multiplyAddValue17, comparisonValue15, 0.5));
                    bool conditionValue6 = multiplyAddValue19 > 0.5;
                    bool conditionValue7 = multiplyAddValue18 > 0.5;
                    float comparisonValue16 = conditionValue6 ? scalarValue35 : scalarValue38;
                    float comparisonValue17 = conditionValue6 ? scalarValue36 : scalarValue37;
                    float comparisonValue18 = conditionValue7 ? scalarValue37 : scalarValue38;
                    float comparisonValue19 = conditionValue7 ? scalarValue36 : scalarValue35;
                    float sumValue10 = multiplyAddValue18 - 0.083333335816860198974609375;
                    float sumValue11 = multiplyAddValue18 + 0.083333335816860198974609375;
                    float sumValue12 = multiplyAddValue19 - 0.083333335816860198974609375;
                    float sumValue13 = multiplyAddValue19 + 0.083333335816860198974609375;
                    uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                    uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                    uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                    uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                    float comparisonValue20 = ((sumValue14 == 1u) ? comparisonValue17 : ((sumValue14 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue15 == 1u) ? comparisonValue17 : ((sumValue15 == 0u) ? comparisonValue16 : 0.0));
                    float comparisonValue21 = ((sumValue16 == 1u) ? comparisonValue19 : ((sumValue16 == 0u) ? comparisonValue18 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue19 : ((sumValue17 == 0u) ? comparisonValue18 : 0.0));
                    vec3 vectorValue1 = vec3(comparisonValue20, comparisonValue21, 0.25);
                    float scalarValue39 = rdDot3Precise(vectorValue1, vectorValue1);
                    float inverseLengthValue9 = inversesqrt(scalarValue39);
                    productValue12 = sumValue9 * (inverseLengthValue9 * comparisonValue21);
                    productValue13 = sumValue9 * (inverseLengthValue9 * comparisonValue20);
                    productValue14 = inverseLengthValue9 * 0.25;
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
                if ((reinterpretedBits13 & 16u) == 16u)
                {
                    float multiplyAddValue20 = fma(varyingTexCoord0.x, scalarValue28, scalarValue30);
                    float multiplyAddValue21 = fma(varyingTexCoord0.y, scalarValue29, scalarValue31);
                    float sumValue18 = spvNMin(reinterpretedBits14, reinterpretedBits14 - scalarValue33);
                    vec4 sampledTextureValue26 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue20, multiplyAddValue21), 0.0);
                    float scalarValue40 = sampledTextureValue26.x;
                    float scalarValue41 = sampledTextureValue26.y;
                    float scalarValue42 = sampledTextureValue26.z;
                    float intermediateValue56;
                    float intermediateValue58;
                    float intermediateValue60;
                    if ((scalarValue41 == scalarValue40) && (scalarValue42 == scalarValue41))
                    {
                        float scalarValue43 = spvNClamp(2.0 - sumValue18, 0.0, 1.0);
                        float productValue19;
                        float productValue20;
                        float productValue21;
                        if (scalarValue43 > 0.0)
                        {
                            bool sampledTextureValue27 = uint(textureQueryLevels(materialTexture0)) > 0u;
                            uvec2 sampledTextureValue28 = uvec2(textureSize(materialTexture0, int(0u)));
                            uint scalarValue44 = sampledTextureValue28.x;
                            float comparisonValue22 = rdEvaluateFloatExpression2(sampledTextureValue27 ? scalarValue44 : 0u);
                            float comparisonValue23 = rdEvaluateFloatExpression2(sampledTextureValue27 ? sampledTextureValue28.y : 0u);
                            float productValue46 = fract(multiplyAddValue20 * comparisonValue22);
                            float productValue47 = fract(multiplyAddValue21 * comparisonValue23);
                            vec4 sampledTextureValue29 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue46 - 0.5) < 0.0625) ? (multiplyAddValue20 + ((productValue46 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue20, (abs(productValue47 - 0.5) < 0.0625) ? (multiplyAddValue21 + ((productValue47 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue21));
                            float scalarValue45 = sampledTextureValue29.x;
                            float scalarValue46 = sampledTextureValue29.y;
                            float scalarValue47 = sampledTextureValue29.z;
                            float scalarValue48 = sampledTextureValue29.w;
                            float multiplyAddValue22 = fract(fma(multiplyAddValue20, comparisonValue22, 0.5));
                            float multiplyAddValue23 = fract(fma(multiplyAddValue21, comparisonValue23, 0.5));
                            bool conditionValue8 = multiplyAddValue23 > 0.5;
                            bool conditionValue9 = multiplyAddValue22 > 0.5;
                            float comparisonValue24 = conditionValue8 ? scalarValue45 : scalarValue48;
                            float comparisonValue25 = conditionValue8 ? scalarValue46 : scalarValue47;
                            float comparisonValue26 = conditionValue9 ? scalarValue47 : scalarValue48;
                            float comparisonValue27 = conditionValue9 ? scalarValue46 : scalarValue45;
                            float sumValue19 = multiplyAddValue22 - 0.083333335816860198974609375;
                            float sumValue20 = multiplyAddValue22 + 0.083333335816860198974609375;
                            float sumValue21 = multiplyAddValue23 - 0.083333335816860198974609375;
                            float sumValue22 = multiplyAddValue23 + 0.083333335816860198974609375;
                            uint sumValue23 = uint(int(spvNClamp(sumValue19 + sumValue19, 0.0, 1.0)));
                            uint sumValue24 = uint(int(spvNClamp(sumValue20 + sumValue20, 0.0, 1.0)));
                            uint sumValue25 = uint(int(spvNClamp(sumValue21 + sumValue21, 0.0, 1.0)));
                            uint sumValue26 = uint(int(spvNClamp(sumValue22 + sumValue22, 0.0, 1.0)));
                            float comparisonValue28 = ((sumValue23 == 1u) ? comparisonValue25 : ((sumValue23 == 0u) ? comparisonValue24 : 0.0)) - ((sumValue24 == 1u) ? comparisonValue25 : ((sumValue24 == 0u) ? comparisonValue24 : 0.0));
                            float comparisonValue29 = ((sumValue25 == 1u) ? comparisonValue27 : ((sumValue25 == 0u) ? comparisonValue26 : 0.0)) - ((sumValue26 == 1u) ? comparisonValue27 : ((sumValue26 == 0u) ? comparisonValue26 : 0.0));
                            vec3 vectorValue2 = vec3(comparisonValue28, comparisonValue29, 0.25);
                            float scalarValue49 = rdDot3Precise(vectorValue2, vectorValue2);
                            float inverseLengthValue10 = inversesqrt(scalarValue49);
                            productValue19 = scalarValue43 * (inverseLengthValue10 * comparisonValue29);
                            productValue20 = scalarValue43 * (inverseLengthValue10 * comparisonValue28);
                            productValue21 = inverseLengthValue10 * 0.25;
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
                        bool sampledTextureValue30 = uint(textureQueryLevels(materialTexture0)) > 0u;
                        uvec2 sampledTextureValue31 = uvec2(textureSize(materialTexture0, int(0u)));
                        uint scalarValue50 = sampledTextureValue31.x;
                        float comparisonValue30 = rdEvaluateFloatExpression2(sampledTextureValue30 ? scalarValue50 : 0u);
                        float comparisonValue31 = rdEvaluateFloatExpression2(sampledTextureValue30 ? sampledTextureValue31.y : 0u);
                        float sumValue27 = spvNClamp(2.0 - sumValue18, 0.0, 1.0);
                        bool conditionValue10 = sumValue27 > 0.0;
                        float productValue48 = fract(multiplyAddValue20 * comparisonValue30);
                        float productValue49 = fract(multiplyAddValue21 * comparisonValue31);
                        float multiplyAddValue24 = (productValue48 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue26.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue25 = (productValue49 <= 0.083333335816860198974609375) ? (-fma(scalarValue40, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue26 = (productValue48 >= 0.916666686534881591796875) ? (fma(scalarValue41, 2.0, -1.0) + multiplyAddValue24) : multiplyAddValue24;
                        float multiplyAddValue27 = (productValue49 >= 0.916666686534881591796875) ? (fma(scalarValue42, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                        bool comparisonValue32 = abs(multiplyAddValue26) >= 0.004999999888241291046142578125;
                        bool comparisonValue33 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue34 = vec3(comparisonValue32 ? multiplyAddValue26 : 0.0, comparisonValue33 ? multiplyAddValue27 : 0.0, 0.25);
                        float scalarValue51 = rdDot3Precise(comparisonValue34, comparisonValue34);
                        float inverseLengthValue11 = inversesqrt(scalarValue51);
                        intermediateValue56 = (conditionValue10 && comparisonValue33) ? (sumValue27 * (inverseLengthValue11 * multiplyAddValue27)) : 0.0;
                        intermediateValue58 = (conditionValue10 && comparisonValue32) ? (sumValue27 * (inverseLengthValue11 * multiplyAddValue26)) : 0.0;
                        intermediateValue60 = conditionValue10 ? (inverseLengthValue11 * 0.25) : 1.0;
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
            multiplyAddValue9 = intermediateValue34;
            multiplyAddValue10 = intermediateValue35;
            multiplyAddValue11 = intermediateValue36;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits40 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue * 16u) + 15u]);
            float intermediateValue32;
            float intermediateValue33;
            float intermediateValue34;
            if ((reinterpretedBits39 & 8u) == 8u)
            {
                float sumValue29 = spvNClamp(2.0 - spvNMin(reinterpretedBits40, reinterpretedBits40 - scalarValue62), 0.0, 1.0);
                float productValue12;
                float productValue13;
                float productValue14;
                if (sumValue29 > 0.0)
                {
                    float multiplyAddValue34 = fma(varyingTexCoord0.x, scalarValue57, scalarValue59);
                    float multiplyAddValue35 = fma(varyingTexCoord0.y, scalarValue58, scalarValue60);
                    bool sampledTextureValue23 = uint(textureQueryLevels(materialTexture0)) > 0u;
                    uvec2 sampledTextureValue24 = uvec2(textureSize(materialTexture0, int(0u)));
                    uint scalarValue34 = sampledTextureValue24.x;
                    float comparisonValue14 = rdEvaluateFloatExpression2(sampledTextureValue23 ? scalarValue34 : 0u);
                    float comparisonValue15 = rdEvaluateFloatExpression2(sampledTextureValue23 ? sampledTextureValue24.y : 0u);
                    float productValue59 = fract(multiplyAddValue34 * comparisonValue14);
                    float productValue60 = fract(multiplyAddValue35 * comparisonValue15);
                    vec4 sampledTextureValue35 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue59 - 0.5) < 0.0625) ? (multiplyAddValue34 + ((productValue59 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue34, (abs(productValue60 - 0.5) < 0.0625) ? (multiplyAddValue35 + ((productValue60 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue35));
                    float scalarValue63 = sampledTextureValue35.x;
                    float scalarValue64 = sampledTextureValue35.y;
                    float scalarValue65 = sampledTextureValue35.z;
                    float scalarValue66 = sampledTextureValue35.w;
                    float multiplyAddValue36 = fract(fma(multiplyAddValue34, comparisonValue14, 0.5));
                    float multiplyAddValue37 = fract(fma(multiplyAddValue35, comparisonValue15, 0.5));
                    bool conditionValue12 = multiplyAddValue37 > 0.5;
                    bool conditionValue13 = multiplyAddValue36 > 0.5;
                    float comparisonValue38 = conditionValue12 ? scalarValue63 : scalarValue66;
                    float comparisonValue39 = conditionValue12 ? scalarValue64 : scalarValue65;
                    float comparisonValue40 = conditionValue13 ? scalarValue65 : scalarValue66;
                    float comparisonValue41 = conditionValue13 ? scalarValue64 : scalarValue63;
                    float sumValue30 = multiplyAddValue36 - 0.083333335816860198974609375;
                    float sumValue31 = multiplyAddValue36 + 0.083333335816860198974609375;
                    float sumValue32 = multiplyAddValue37 - 0.083333335816860198974609375;
                    float sumValue33 = multiplyAddValue37 + 0.083333335816860198974609375;
                    uint sumValue34 = uint(int(spvNClamp(sumValue30 + sumValue30, 0.0, 1.0)));
                    uint sumValue35 = uint(int(spvNClamp(sumValue31 + sumValue31, 0.0, 1.0)));
                    uint sumValue36 = uint(int(spvNClamp(sumValue32 + sumValue32, 0.0, 1.0)));
                    uint sumValue37 = uint(int(spvNClamp(sumValue33 + sumValue33, 0.0, 1.0)));
                    float comparisonValue42 = ((sumValue34 == 1u) ? comparisonValue39 : ((sumValue34 == 0u) ? comparisonValue38 : 0.0)) - ((sumValue35 == 1u) ? comparisonValue39 : ((sumValue35 == 0u) ? comparisonValue38 : 0.0));
                    float comparisonValue43 = ((sumValue36 == 1u) ? comparisonValue41 : ((sumValue36 == 0u) ? comparisonValue40 : 0.0)) - ((sumValue37 == 1u) ? comparisonValue41 : ((sumValue37 == 0u) ? comparisonValue40 : 0.0));
                    vec3 vectorValue7 = vec3(comparisonValue42, comparisonValue43, 0.25);
                    float scalarValue67 = rdDot3Precise(vectorValue7, vectorValue7);
                    float inverseLengthValue16 = inversesqrt(scalarValue67);
                    productValue12 = sumValue29 * (inverseLengthValue16 * comparisonValue43);
                    productValue13 = sumValue29 * (inverseLengthValue16 * comparisonValue42);
                    productValue14 = inverseLengthValue16 * 0.25;
                }
                else
                {
                    productValue12 = 0.0;
                    productValue13 = 0.0;
                    productValue14 = 1.0;
                }
                intermediateValue32 = productValue12;
                intermediateValue33 = productValue13;
                intermediateValue34 = productValue14;
            }
            else
            {
                float intermediateValue53;
                float intermediateValue55;
                float intermediateValue57;
                if ((reinterpretedBits39 & 16u) == 16u)
                {
                    float multiplyAddValue38 = fma(varyingTexCoord0.x, scalarValue57, scalarValue59);
                    float multiplyAddValue39 = fma(varyingTexCoord0.y, scalarValue58, scalarValue60);
                    float sumValue38 = spvNMin(reinterpretedBits40, reinterpretedBits40 - scalarValue62);
                    vec4 sampledTextureValue36 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue38, multiplyAddValue39), 0.0);
                    float scalarValue68 = sampledTextureValue36.x;
                    float scalarValue69 = sampledTextureValue36.y;
                    float scalarValue70 = sampledTextureValue36.z;
                    float intermediateValue54;
                    float intermediateValue56;
                    float intermediateValue58;
                    if ((scalarValue69 == scalarValue68) && (scalarValue70 == scalarValue69))
                    {
                        float scalarValue71 = spvNClamp(2.0 - sumValue38, 0.0, 1.0);
                        float productValue19;
                        float productValue20;
                        float productValue21;
                        if (scalarValue71 > 0.0)
                        {
                            bool sampledTextureValue27 = uint(textureQueryLevels(materialTexture0)) > 0u;
                            uvec2 sampledTextureValue28 = uvec2(textureSize(materialTexture0, int(0u)));
                            uint scalarValue44 = sampledTextureValue28.x;
                            float comparisonValue22 = rdEvaluateFloatExpression2(sampledTextureValue27 ? scalarValue44 : 0u);
                            float comparisonValue23 = rdEvaluateFloatExpression2(sampledTextureValue27 ? sampledTextureValue28.y : 0u);
                            float productValue61 = fract(multiplyAddValue38 * comparisonValue22);
                            float productValue62 = fract(multiplyAddValue39 * comparisonValue23);
                            vec4 sampledTextureValue37 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue61 - 0.5) < 0.0625) ? (multiplyAddValue38 + ((productValue61 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue38, (abs(productValue62 - 0.5) < 0.0625) ? (multiplyAddValue39 + ((productValue62 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue39));
                            float scalarValue72 = sampledTextureValue37.x;
                            float scalarValue73 = sampledTextureValue37.y;
                            float scalarValue74 = sampledTextureValue37.z;
                            float scalarValue75 = sampledTextureValue37.w;
                            float multiplyAddValue40 = fract(fma(multiplyAddValue38, comparisonValue22, 0.5));
                            float multiplyAddValue41 = fract(fma(multiplyAddValue39, comparisonValue23, 0.5));
                            bool conditionValue14 = multiplyAddValue41 > 0.5;
                            bool conditionValue15 = multiplyAddValue40 > 0.5;
                            float comparisonValue44 = conditionValue14 ? scalarValue72 : scalarValue75;
                            float comparisonValue45 = conditionValue14 ? scalarValue73 : scalarValue74;
                            float comparisonValue46 = conditionValue15 ? scalarValue74 : scalarValue75;
                            float comparisonValue47 = conditionValue15 ? scalarValue73 : scalarValue72;
                            float sumValue39 = multiplyAddValue40 - 0.083333335816860198974609375;
                            float sumValue40 = multiplyAddValue40 + 0.083333335816860198974609375;
                            float sumValue41 = multiplyAddValue41 - 0.083333335816860198974609375;
                            float sumValue42 = multiplyAddValue41 + 0.083333335816860198974609375;
                            uint sumValue43 = uint(int(spvNClamp(sumValue39 + sumValue39, 0.0, 1.0)));
                            uint sumValue44 = uint(int(spvNClamp(sumValue40 + sumValue40, 0.0, 1.0)));
                            uint sumValue45 = uint(int(spvNClamp(sumValue41 + sumValue41, 0.0, 1.0)));
                            uint sumValue46 = uint(int(spvNClamp(sumValue42 + sumValue42, 0.0, 1.0)));
                            float comparisonValue48 = ((sumValue43 == 1u) ? comparisonValue45 : ((sumValue43 == 0u) ? comparisonValue44 : 0.0)) - ((sumValue44 == 1u) ? comparisonValue45 : ((sumValue44 == 0u) ? comparisonValue44 : 0.0));
                            float comparisonValue49 = ((sumValue45 == 1u) ? comparisonValue47 : ((sumValue45 == 0u) ? comparisonValue46 : 0.0)) - ((sumValue46 == 1u) ? comparisonValue47 : ((sumValue46 == 0u) ? comparisonValue46 : 0.0));
                            vec3 vectorValue8 = vec3(comparisonValue48, comparisonValue49, 0.25);
                            float scalarValue76 = rdDot3Precise(vectorValue8, vectorValue8);
                            float inverseLengthValue17 = inversesqrt(scalarValue76);
                            productValue19 = scalarValue71 * (inverseLengthValue17 * comparisonValue49);
                            productValue20 = scalarValue71 * (inverseLengthValue17 * comparisonValue48);
                            productValue21 = inverseLengthValue17 * 0.25;
                        }
                        else
                        {
                            productValue19 = 0.0;
                            productValue20 = 0.0;
                            productValue21 = 1.0;
                        }
                        intermediateValue54 = productValue19;
                        intermediateValue56 = productValue20;
                        intermediateValue58 = productValue21;
                    }
                    else
                    {
                        bool sampledTextureValue30 = uint(textureQueryLevels(materialTexture0)) > 0u;
                        uvec2 sampledTextureValue31 = uvec2(textureSize(materialTexture0, int(0u)));
                        uint scalarValue50 = sampledTextureValue31.x;
                        float comparisonValue30 = rdEvaluateFloatExpression2(sampledTextureValue30 ? scalarValue50 : 0u);
                        float comparisonValue31 = rdEvaluateFloatExpression2(sampledTextureValue30 ? sampledTextureValue31.y : 0u);
                        float sumValue47 = spvNClamp(2.0 - sumValue38, 0.0, 1.0);
                        bool conditionValue16 = sumValue47 > 0.0;
                        float productValue63 = fract(multiplyAddValue38 * comparisonValue30);
                        float productValue64 = fract(multiplyAddValue39 * comparisonValue31);
                        float multiplyAddValue42 = (productValue63 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue36.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue43 = (productValue64 <= 0.083333335816860198974609375) ? (-fma(scalarValue68, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue44 = (productValue63 >= 0.916666686534881591796875) ? (fma(scalarValue69, 2.0, -1.0) + multiplyAddValue42) : multiplyAddValue42;
                        float multiplyAddValue45 = (productValue64 >= 0.916666686534881591796875) ? (fma(scalarValue70, 2.0, -1.0) + multiplyAddValue43) : multiplyAddValue43;
                        bool comparisonValue50 = abs(multiplyAddValue44) >= 0.004999999888241291046142578125;
                        bool comparisonValue51 = abs(multiplyAddValue45) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue52 = vec3(comparisonValue50 ? multiplyAddValue44 : 0.0, comparisonValue51 ? multiplyAddValue45 : 0.0, 0.25);
                        float scalarValue77 = rdDot3Precise(comparisonValue52, comparisonValue52);
                        float inverseLengthValue18 = inversesqrt(scalarValue77);
                        intermediateValue54 = (conditionValue16 && comparisonValue51) ? (sumValue47 * (inverseLengthValue18 * multiplyAddValue45)) : 0.0;
                        intermediateValue56 = (conditionValue16 && comparisonValue50) ? (sumValue47 * (inverseLengthValue18 * multiplyAddValue44)) : 0.0;
                        intermediateValue58 = conditionValue16 ? (inverseLengthValue18 * 0.25) : 1.0;
                    }
                    intermediateValue53 = intermediateValue54;
                    intermediateValue55 = intermediateValue56;
                    intermediateValue57 = intermediateValue58;
                }
                else
                {
                    intermediateValue53 = 0.0;
                    intermediateValue55 = 0.0;
                    intermediateValue57 = 1.0;
                }
                intermediateValue32 = intermediateValue53;
                intermediateValue33 = intermediateValue55;
                intermediateValue34 = intermediateValue57;
            }
            multiplyAddValue9 = intermediateValue32;
            multiplyAddValue10 = intermediateValue33;
            multiplyAddValue11 = intermediateValue34;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue19 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7), fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8)));
            intermediateValue19 = (sampledTextureValue19.x * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue19.y * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue19.z * 2.0) + (-1.0);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue19 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7), fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8)));
            intermediateValue15 = (sampledTextureValue19.x * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue19.y * 2.0) + (-1.0);
            intermediateValue17 = (sampledTextureValue19.z * 2.0) + (-1.0);
#endif
        }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue25;
        float intermediateValue27;
        float intermediateValue29;
        float comparisonValue;
        if ((reinterpretedBits13 & 1u) == 1u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue23;
        float intermediateValue25;
        float intermediateValue27;
        float comparisonValue;
        if ((reinterpretedBits39 & 1u) == 1u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue1;
        float sampledTextureValue2;
        float sampledTextureValue3;
        float intermediateValue12;
        if ((scalarValue6 & 1u) == 0u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue2;
        float sampledTextureValue3;
        float sampledTextureValue4;
        float intermediateValue8;
        if ((scalarValue6 & 1u) == 0u)
#endif
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 reinterpretedBits15 = uintBitsToFloat(intermediateValue3.packedValues[scalarValue * 4u]);
            vec4 sampledTextureValue32 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, reinterpretedBits15.x, reinterpretedBits15.z), fma(varyingTexCoord0.y, reinterpretedBits15.y, reinterpretedBits15.w)));
            comparisonValue = ((reinterpretedBits13 & 2u) == 2u) ? sampledTextureValue32.w : scalarValue32;
            intermediateValue29 = sampledTextureValue32.x;
            intermediateValue27 = sampledTextureValue32.z;
            intermediateValue25 = sampledTextureValue32.y;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 reinterpretedBits41 = uintBitsToFloat(intermediateValue4.packedValues[scalarValue * 4u]);
            vec4 sampledTextureValue38 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, reinterpretedBits41.x, reinterpretedBits41.z), fma(varyingTexCoord0.y, reinterpretedBits41.y, reinterpretedBits41.w)));
            comparisonValue = ((reinterpretedBits39 & 2u) == 2u) ? sampledTextureValue38.w : scalarValue61;
            intermediateValue27 = sampledTextureValue38.x;
            intermediateValue25 = sampledTextureValue38.z;
            intermediateValue23 = sampledTextureValue38.y;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 10u)).x);
            sampledTextureValue1 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 11u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 9u)).x);
            intermediateValue12 = sampledTextureValue10;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue4 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 10u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 11u)).x);
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 9u)).x);
            intermediateValue8 = sampledTextureValue10;
#endif
        }
        else
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue = scalarValue32;
            intermediateValue29 = reinterpretedBits11.w;
            intermediateValue27 = reinterpretedBits11.y;
            intermediateValue25 = reinterpretedBits11.z;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue = scalarValue61;
            intermediateValue27 = reinterpretedBits37.w;
            intermediateValue25 = reinterpretedBits37.y;
            intermediateValue23 = reinterpretedBits37.z;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue20 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 3u)).x))));
            sampledTextureValue3 = sampledTextureValue20.y;
            sampledTextureValue1 = sampledTextureValue20.x;
            sampledTextureValue2 = sampledTextureValue20.z;
            intermediateValue12 = ((scalarValue6 & 2u) != 0u) ? sampledTextureValue20.w : sampledTextureValue10;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue20 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 3u)).x))));
            sampledTextureValue4 = sampledTextureValue20.y;
            sampledTextureValue2 = sampledTextureValue20.x;
            sampledTextureValue3 = sampledTextureValue20.z;
            intermediateValue8 = ((scalarValue6 & 2u) != 0u) ? sampledTextureValue20.w : sampledTextureValue10;
#endif
        }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue35 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue36 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue37 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue3 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue52 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue52);
        vec3 vectorValue4 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue53 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue53);
        vec3 vectorValue5 = vec3(comparisonValue35, comparisonValue36, comparisonValue37);
        float scalarValue54 = rdDot3Precise(vectorValue5, vectorValue5);
        float inverseLengthValue14 = inversesqrt(scalarValue54);
        intermediateValue24 = intermediateValue25;
        intermediateValue26 = intermediateValue27;
        multiplyAddValue2 = fma(inverseLengthValue14 * comparisonValue37, multiplyAddValue11, fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue13 * varyingBitangent0.z)));
        multiplyAddValue3 = fma(inverseLengthValue14 * comparisonValue36, multiplyAddValue11, fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue13 * varyingBitangent0.y)));
        multiplyAddValue4 = fma(inverseLengthValue14 * comparisonValue35, multiplyAddValue11, fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue13 * varyingBitangent0.x)));
        intermediateValue28 = intermediateValue29;
        intermediateValue30 = comparisonValue;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue35 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue36 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue37 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue3 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue52 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue52);
        vec3 vectorValue4 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue53 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue53);
        vec3 vectorValue5 = vec3(comparisonValue35, comparisonValue36, comparisonValue37);
        float scalarValue54 = rdDot3Precise(vectorValue5, vectorValue5);
        float inverseLengthValue14 = inversesqrt(scalarValue54);
        intermediateValue22 = intermediateValue23;
        intermediateValue24 = intermediateValue25;
        multiplyAddValue2 = fma(inverseLengthValue14 * comparisonValue37, multiplyAddValue11, fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue13 * varyingBitangent0.z)));
        multiplyAddValue3 = fma(inverseLengthValue14 * comparisonValue36, multiplyAddValue11, fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue13 * varyingBitangent0.y)));
        multiplyAddValue4 = fma(inverseLengthValue14 * comparisonValue35, multiplyAddValue11, fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue13 * varyingBitangent0.x)));
        intermediateValue26 = intermediateValue27;
        intermediateValue28 = comparisonValue;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue8 = comparisonValue2 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue9 = comparisonValue2 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue13 = comparisonValue2 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue4 = inversesqrt(dot(vec3(comparisonValue8, comparisonValue9, comparisonValue13), vec3(comparisonValue8, comparisonValue9, comparisonValue13)));
        float inverseLengthValue5 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue6 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        intermediateValue8 = sampledTextureValue1;
        intermediateValue9 = sampledTextureValue2;
        intermediateValue10 = sampledTextureValue3;
        intermediateValue11 = intermediateValue12;
        intermediateValue13 = fma(inverseLengthValue4 * comparisonValue8, intermediateValue21, fma(inverseLengthValue5 * varyingBitangent0.x, intermediateValue20, inverseLengthValue6 * varyingTangent0.x));
        intermediateValue14 = fma(inverseLengthValue4 * comparisonValue9, intermediateValue21, fma(inverseLengthValue5 * varyingBitangent0.y, intermediateValue20, inverseLengthValue6 * varyingTangent0.y));
        intermediateValue15 = fma(inverseLengthValue4 * comparisonValue13, intermediateValue21, fma(inverseLengthValue5 * varyingBitangent0.z, intermediateValue20, inverseLengthValue6 * varyingTangent0.z));
    }
    float sumValue6 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[17u].x;
    float sumValue7 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[17u].y;
    float sumValue8 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[17u].z;
    float inverseLengthValue7 = inversesqrt(dot(vec3(intermediateValue13, intermediateValue14, intermediateValue15), vec3(intermediateValue13, intermediateValue14, intermediateValue15)));
    float productValue32 = inverseLengthValue7 * intermediateValue13;
    float productValue33 = inverseLengthValue7 * intermediateValue14;
    float productValue34 = inverseLengthValue7 * intermediateValue15;
    float quotientValue2 = 1.0 / ((abs(productValue33) + abs(productValue32)) + abs(productValue34));
    float productValue35 = quotientValue2 * productValue32;
    float productValue36 = quotientValue2 * productValue33;
    bool conditionValue5 = productValue34 < 0.0;
    float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].w;
    float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[14u].w, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].w, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w;
    float intermediateValue18;
    float productValue14;
    float productValue15;
    if ((fragmentVectorConstants1.packedValues[24u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[16u].x + fragmentVectorConstants1.packedValues[16u].y) + fragmentVectorConstants1.packedValues[16u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue37 = fragmentVectorConstants1.packedValues[24u].x * fragmentVectorConstants1.packedValues[24u].x;
        intermediateValue18 = spvNClamp(productValue37, 0.0, 1.0);
        productValue14 = spvNClamp(((productValue37 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue37, 0.0, 1.0);
        productValue15 = spvNClamp((((productValue37 * productValue37) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue37, 0.0, 1.0);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue8 = comparisonValue2 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue9 = comparisonValue2 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue13 = comparisonValue2 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue4 = inversesqrt(dot(vec3(comparisonValue8, comparisonValue9, comparisonValue13), vec3(comparisonValue8, comparisonValue9, comparisonValue13)));
        float inverseLengthValue5 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue19 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue15;
        intermediateValue4 = sampledTextureValue2;
        intermediateValue5 = sampledTextureValue3;
        intermediateValue6 = sampledTextureValue4;
        intermediateValue7 = intermediateValue8;
        intermediateValue9 = fma(inverseLengthValue4 * comparisonValue8, intermediateValue17, fma(inverseLengthValue5 * varyingBitangent0.x, intermediateValue16, inverseLengthValue19 * varyingTangent0.x));
        intermediateValue10 = fma(inverseLengthValue4 * comparisonValue9, intermediateValue17, fma(inverseLengthValue5 * varyingBitangent0.y, intermediateValue16, inverseLengthValue19 * varyingTangent0.y));
        intermediateValue11 = fma(inverseLengthValue4 * comparisonValue13, intermediateValue17, fma(inverseLengthValue5 * varyingBitangent0.z, intermediateValue16, inverseLengthValue19 * varyingTangent0.z));
    }
    float sumValue6 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[17u].x;
    float sumValue7 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[17u].y;
    float sumValue8 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[17u].z;
    float inverseLengthValue20 = inversesqrt(dot(vec3(intermediateValue9, intermediateValue10, intermediateValue11), vec3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue69 = inverseLengthValue20 * intermediateValue9;
    float productValue70 = inverseLengthValue20 * intermediateValue10;
    float productValue71 = inverseLengthValue20 * intermediateValue11;
    float quotientValue6 = 1.0 / ((abs(productValue70) + abs(productValue69)) + abs(productValue71));
    float productValue72 = quotientValue6 * productValue69;
    float productValue73 = quotientValue6 * productValue70;
    bool conditionValue17 = productValue71 < 0.0;
    float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].w;
    float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[14u].w, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].w, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w;
    float intermediateValue14;
    float productValue8;
    float productValue9;
    if ((fragmentVectorConstants1.packedValues[23u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[16u].x + fragmentVectorConstants1.packedValues[16u].y) + fragmentVectorConstants1.packedValues[16u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue74 = fragmentVectorConstants1.packedValues[23u].x * fragmentVectorConstants1.packedValues[23u].x;
        intermediateValue14 = spvNClamp(productValue74, 0.0, 1.0);
        productValue8 = spvNClamp(((productValue74 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue74, 0.0, 1.0);
        productValue9 = spvNClamp((((productValue74 * productValue74) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue74, 0.0, 1.0);
#endif
    }
    else
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue24 = 0.0;
        intermediateValue26 = 1.0;
        multiplyAddValue2 = 0.0;
        multiplyAddValue3 = 1.0;
        multiplyAddValue4 = 0.0;
        intermediateValue28 = 0.0;
        intermediateValue30 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue22 = 0.0;
        intermediateValue24 = 1.0;
        multiplyAddValue2 = 0.0;
        multiplyAddValue3 = 1.0;
        multiplyAddValue4 = 0.0;
        intermediateValue26 = 0.0;
        intermediateValue28 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue18 = fragmentVectorConstants1.packedValues[16u].x;
        productValue14 = fragmentVectorConstants1.packedValues[16u].y;
        productValue15 = fragmentVectorConstants1.packedValues[16u].z;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue14 = fragmentVectorConstants1.packedValues[16u].x;
        productValue8 = fragmentVectorConstants1.packedValues[16u].y;
        productValue9 = fragmentVectorConstants1.packedValues[16u].z;
#endif
    }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits17 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits16.x);
    float reinterpretedBits18 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits16.y);
    float reinterpretedBits19 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits16.z);
    fragmentColor1.w = (intermediateValue30 < intermediateValue28) ? fma(intermediateValue28, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue30, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(multiplyAddValue4, multiplyAddValue3, multiplyAddValue2);
    float scalarValue55 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue55);
    float productValue50 = inverseLengthValue15 * multiplyAddValue4;
    float productValue51 = inverseLengthValue15 * multiplyAddValue3;
    float productValue52 = inverseLengthValue15 * multiplyAddValue2;
    float quotientValue3 = 1.0 / (abs(productValue52) + (abs(productValue51) + abs(productValue50)));
    float productValue53 = quotientValue3 * productValue50;
    float productValue54 = quotientValue3 * productValue51;
    bool conditionValue11 = productValue52 < 0.0;
    float sumValue28 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? ((1.0 - abs(productValue54)) * ((productValue53 >= 0.0) ? sumValue28 : (-1.0))) : productValue53;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue53)) * ((productValue54 >= 0.0) ? sumValue28 : (-1.0))) : productValue54;
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue28 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u]));
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float multiplyAddValue29 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits19, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), reinterpretedBits17, reinterpretedBits18 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits22.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits20.x))) + uintBitsToFloat(reinterpretedBits23.x)) / multiplyAddValue28, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits26.x), reinterpretedBits19, fma(uintBitsToFloat(reinterpretedBits25.x), reinterpretedBits17, reinterpretedBits18 * uintBitsToFloat(reinterpretedBits24.x))) + uintBitsToFloat(reinterpretedBits27.x)) / multiplyAddValue29, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits22.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits20.y))) + uintBitsToFloat(reinterpretedBits23.y)) / multiplyAddValue28, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits26.y), reinterpretedBits19, fma(uintBitsToFloat(reinterpretedBits25.y), reinterpretedBits17, reinterpretedBits18 * uintBitsToFloat(reinterpretedBits24.y))) + uintBitsToFloat(reinterpretedBits27.y)) / multiplyAddValue29, 0.5, 0.5);
    float reinterpretedBits28 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[96u]));
    bool reinterpretedBits29 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[65u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[66u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits28 > 9.9999997473787516355514526367188e-05);
    float productValue55 = reinterpretedBits28 * reinterpretedBits28;
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits31 = (reinterpretedBits29 ? spvNMin(productValue55, 1.0) : uintBitsToFloat(reinterpretedBits30.x)) * 0.16666667163372039794921875;
    float multiplyAddValue30 = (reinterpretedBits29 ? spvNMin(fma(fma(productValue55, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue55, 1.0) : uintBitsToFloat(reinterpretedBits30.y)) * 0.16666667163372039794921875;
    float multiplyAddValue31 = (reinterpretedBits29 ? spvNMin(fma(productValue55 * productValue55, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue55, 1.0) : uintBitsToFloat(reinterpretedBits30.z)) * 0.16666667163372039794921875;
    float productValue56 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue30, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue31, reinterpretedBits31)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue30 / productValue56, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits31 / productValue56, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue31 / productValue56, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue56, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[97u])), 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue26, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits17 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits16.x);
    float reinterpretedBits18 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits16.y);
    float reinterpretedBits19 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits16.z);
    fragmentColor1.w = (intermediateValue28 < intermediateValue26) ? fma(intermediateValue26, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue28, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(multiplyAddValue4, multiplyAddValue3, multiplyAddValue2);
    float scalarValue55 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue55);
    float productValue50 = inverseLengthValue15 * multiplyAddValue4;
    float productValue51 = inverseLengthValue15 * multiplyAddValue3;
    float productValue52 = inverseLengthValue15 * multiplyAddValue2;
    float quotientValue3 = 1.0 / (abs(productValue52) + (abs(productValue51) + abs(productValue50)));
    float productValue53 = quotientValue3 * productValue50;
    float productValue54 = quotientValue3 * productValue51;
    bool conditionValue11 = productValue52 < 0.0;
    float sumValue28 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? ((1.0 - abs(productValue54)) * ((productValue53 >= 0.0) ? sumValue28 : (-1.0))) : productValue53;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue53)) * ((productValue54 >= 0.0) ? sumValue28 : (-1.0))) : productValue54;
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue28 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u]));
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float multiplyAddValue29 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits19, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), reinterpretedBits17, reinterpretedBits18 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits22.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits20.x))) + uintBitsToFloat(reinterpretedBits23.x)) / multiplyAddValue28, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits26.x), reinterpretedBits19, fma(uintBitsToFloat(reinterpretedBits25.x), reinterpretedBits17, reinterpretedBits18 * uintBitsToFloat(reinterpretedBits24.x))) + uintBitsToFloat(reinterpretedBits27.x)) / multiplyAddValue29, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits22.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits20.y))) + uintBitsToFloat(reinterpretedBits23.y)) / multiplyAddValue28, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits26.y), reinterpretedBits19, fma(uintBitsToFloat(reinterpretedBits25.y), reinterpretedBits17, reinterpretedBits18 * uintBitsToFloat(reinterpretedBits24.y))) + uintBitsToFloat(reinterpretedBits27.y)) / multiplyAddValue29, 0.5, 0.5);
    float reinterpretedBits42 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    bool reinterpretedBits43 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[65u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[66u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits42 > 9.9999997473787516355514526367188e-05);
    float productValue65 = reinterpretedBits42 * reinterpretedBits42;
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits44 = (reinterpretedBits43 ? spvNMin(productValue65, 1.0) : uintBitsToFloat(reinterpretedBits30.x)) * 0.16666667163372039794921875;
    float multiplyAddValue46 = (reinterpretedBits43 ? spvNMin(fma(fma(productValue65, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue65, 1.0) : uintBitsToFloat(reinterpretedBits30.y)) * 0.16666667163372039794921875;
    float multiplyAddValue47 = (reinterpretedBits43 ? spvNMin(fma(productValue65 * productValue65, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue65, 1.0) : uintBitsToFloat(reinterpretedBits30.z)) * 0.16666667163372039794921875;
    float productValue66 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue46, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue47, reinterpretedBits44)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue46 / productValue66, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits44 / productValue66, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue47 / productValue66, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue66, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])), 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue38 = intermediateValue18 * 0.16666667163372039794921875;
    float productValue39 = productValue14 * 0.16666667163372039794921875;
    float productValue40 = productValue15 * 0.16666667163372039794921875;
    float productValue41 = ceil(spvNClamp(spvNMax(spvNMax(productValue38, productValue40), spvNMax(productValue39, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue10, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue38 / productValue41, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue39 / productValue41, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue40 / productValue41, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue41, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[24u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = productValue5;
    fragmentColor1.y = productValue6;
    fragmentColor1.z = productValue7;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue11 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue5 ? (((productValue35 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue36))) : productValue35;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue35)) * ((productValue36 < 0.0) ? (-1.0) : 1.0)) : productValue36;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[14u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].x, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].x)) + fragmentVectorConstants1.packedValues[15u].x) / multiplyAddValue13)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[14u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].y, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].y)) + fragmentVectorConstants1.packedValues[15u].y) / multiplyAddValue13)) * 0.5;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue75 = intermediateValue14 * 0.16666667163372039794921875;
    float productValue76 = productValue8 * 0.16666667163372039794921875;
    float productValue77 = productValue9 * 0.16666667163372039794921875;
    float productValue78 = ceil(spvNClamp(spvNMax(spvNMax(productValue75, productValue77), spvNMax(productValue76, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue75 / productValue78, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue76 / productValue78, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue77 / productValue78, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue78, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[23u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = (sampledTextureValue.x * varyingColor0.w) * ((((sampledTextureValue39.x * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.y = (sampledTextureValue.y * varyingColor0.w) * ((((sampledTextureValue39.y * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.z = (sampledTextureValue.z * varyingColor0.w) * ((((sampledTextureValue39.z * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.w = (intermediateValue4 > intermediateValue7) ? ((intermediateValue4 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue7 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue17 ? (((productValue72 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue73))) : productValue72;
    fragmentColor2.y = conditionValue17 ? ((1.0 - abs(productValue72)) * ((productValue73 < 0.0) ? (-1.0) : 1.0)) : productValue73;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[14u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].x, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].x)) + fragmentVectorConstants1.packedValues[15u].x) / multiplyAddValue13)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[14u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].y, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].y)) + fragmentVectorConstants1.packedValues[15u].y) / multiplyAddValue13)) * 0.5;
#endif
    discardIfRequested();
}
