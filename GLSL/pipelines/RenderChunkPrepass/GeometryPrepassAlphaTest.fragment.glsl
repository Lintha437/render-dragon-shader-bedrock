#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunkPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 9
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
#extension GL_EXT_spirv_intrinsics : require
#endif
#extension GL_EXT_samplerless_texture_functions : require
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
#extension GL_EXT_spirv_intrinsics : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION2_FLOAT_7 1
#endif

#include "../../include/materials/RenderChunkPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if (scalarValue3 < 0.5)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue.w < 0.5)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits13 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue8 = vec3(reinterpretedBits12, reinterpretedBits13, reinterpretedBits14);
    float scalarValue74 = rdDot3Precise(vectorValue8, vectorValue8);
    float inverseLengthValue19 = inversesqrt(scalarValue74);
    uvec4 reinterpretedBits15 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits16 = rdDot3Precise(vec3(-(inverseLengthValue19 * reinterpretedBits12), -(inverseLengthValue19 * reinterpretedBits13), -(inverseLengthValue19 * reinterpretedBits14)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits15.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits15.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits15.z)));
    float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
    float reinterpretedBits18 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[61u])) - reinterpretedBits17)) * (reinterpretedBits16 - reinterpretedBits17), 0.0, 1.0);
    uvec4 reinterpretedBits19 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[62u]));
    float multiplyAddValue46 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits19.x)) / reinterpretedBits20) * reinterpretedBits20;
    float multiplyAddValue47 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits19.y)) / reinterpretedBits20) * reinterpretedBits20;
    float productValue73 = floor(multiplyAddValue47 * 0.25);
    float productValue74 = floor(multiplyAddValue47 * 0.5);
    float scalarValue75 = floor(multiplyAddValue47);
    if ((scalarValue3 < 0.5) || ((varyingTexCoord2.x > 0.5) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue46 * 0.25), 0.5, (productValue73 * productValue73) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue46 * 0.5), 0.5, (productValue74 * productValue74) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue46), 0.5, (scalarValue75 * scalarValue75) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits18 * reinterpretedBits18) * fma(reinterpretedBits18, -2.0, 3.0)))))
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits13 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue8 = vec3(reinterpretedBits12, reinterpretedBits13, reinterpretedBits14);
    float scalarValue74 = rdDot3Precise(vectorValue8, vectorValue8);
    float inverseLengthValue19 = inversesqrt(scalarValue74);
    uvec4 reinterpretedBits15 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits16 = rdDot3Precise(vec3(-(inverseLengthValue19 * reinterpretedBits12), -(inverseLengthValue19 * reinterpretedBits13), -(inverseLengthValue19 * reinterpretedBits14)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits15.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits15.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits15.z)));
    float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
    float reinterpretedBits18 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[61u])) - reinterpretedBits17)) * (reinterpretedBits16 - reinterpretedBits17), 0.0, 1.0);
    uvec4 reinterpretedBits19 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[62u]));
    float multiplyAddValue46 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits19.x)) / reinterpretedBits20) * reinterpretedBits20;
    float multiplyAddValue47 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits19.y)) / reinterpretedBits20) * reinterpretedBits20;
    float productValue73 = floor(multiplyAddValue47 * 0.25);
    float productValue74 = floor(multiplyAddValue47 * 0.5);
    float scalarValue75 = floor(multiplyAddValue47);
    if ((sampledTextureValue.w < 0.5) || ((varyingTexCoord2 > 0.5) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue46 * 0.25), 0.5, (productValue73 * productValue73) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue46 * 0.5), 0.5, (productValue74 * productValue74) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue46), 0.5, (scalarValue75 * scalarValue75) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits18 * reinterpretedBits18) * fma(reinterpretedBits18, -2.0, 3.0)))))
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue34 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
    uint scalarValue4 = uint(varyingTexCoord4);
    vec4 sampledTextureValue16 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue33 = sampledTextureValue16.x;
    float scalarValue34 = sampledTextureValue16.y;
    float scalarValue35 = sampledTextureValue16.z;
    float scalarValue36 = sampledTextureValue16.w;
    if (scalarValue36 < 0.5)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue34 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
    uint scalarValue4 = uint(varyingTexCoord4);
    vec4 sampledTextureValue16 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue16.w < 0.5)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue34 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
    uint scalarValue4 = uint(varyingTexCoord4);
    vec4 sampledTextureValue16 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue33 = sampledTextureValue16.x;
    float scalarValue34 = sampledTextureValue16.y;
    float scalarValue35 = sampledTextureValue16.z;
    float scalarValue36 = sampledTextureValue16.w;
    bool comparisonValue1;
    if (varyingTexCoord2.x > 0.5)
    {
        float inverseLengthValue21 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue21), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue21), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue21)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[17u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[17u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[17u].z)) - fragmentVectorConstants1.packedValues[15u].x) / (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[15u].x), 0.0, 1.0);
        float quotientValue4 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
        float quotientValue5 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
        float productValue80 = floor(quotientValue5 * 0.25);
        float productValue81 = floor(quotientValue5 * 0.5);
        float scalarValue77 = floor(quotientValue5);
        comparisonValue1 = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue4 * 0.5) * 0.5)) + (fract(((productValue80 * productValue80) * 0.75) + (floor(quotientValue4 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue77 * scalarValue77) * 0.75) + (floor(quotientValue4) * 0.5)));
    }
    else
    {
        comparisonValue1 = false;
    }
    if ((scalarValue36 < 0.5) || comparisonValue1)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue34 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
    uint scalarValue4 = uint(varyingTexCoord4);
    vec4 sampledTextureValue16 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    bool comparisonValue1;
    if (varyingTexCoord2.x > 0.5)
    {
        float inverseLengthValue21 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue21), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue21), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue21)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[17u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[17u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[17u].z)) - fragmentVectorConstants1.packedValues[15u].x) / (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[15u].x), 0.0, 1.0);
        float quotientValue4 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
        float quotientValue5 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
        float productValue80 = floor(quotientValue5 * 0.25);
        float productValue81 = floor(quotientValue5 * 0.5);
        float scalarValue77 = floor(quotientValue5);
        comparisonValue1 = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue4 * 0.5) * 0.5)) + (fract(((productValue80 * productValue80) * 0.75) + (floor(quotientValue4 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue77 * scalarValue77) * 0.75) + (floor(quotientValue4) * 0.5)));
    }
    else
    {
        comparisonValue1 = false;
    }
    if ((sampledTextureValue16.w < 0.5) || comparisonValue1)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    bool comparisonValue2 = varyingTexCoord2.y != 0.0;
    fragmentColor1.x = comparisonValue2 ? (fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w) : (scalarValue * varyingColor0.x);
    fragmentColor1.y = comparisonValue2 ? (fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w) : (scalarValue1 * varyingColor0.y);
    fragmentColor1.z = comparisonValue2 ? (fma(scalarValue3, fma(scalarValue2, varyingColor0.z, -scalarValue2), scalarValue2) * varyingColor0.w) : (scalarValue2 * varyingColor0.z);
    uint scalarValue4 = uint(varyingTexCoord4);
    float intermediateValue21;
    float intermediateValue23;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    float intermediateValue25;
    float intermediateValue27;
    if (scalarValue4 != 65535u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue33 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingColor0.x, varyingColor0.y));
    fragmentColor1.x = (sampledTextureValue.x * fma(varyingColor0.z, fma(sampledTextureValue33.x, 2.0, -1.0), 1.0)) * varyingColor0.w;
    fragmentColor1.y = (sampledTextureValue.y * fma(varyingColor0.z, fma(sampledTextureValue33.y, 2.0, -1.0), 1.0)) * varyingColor0.w;
    fragmentColor1.z = (sampledTextureValue.z * fma(varyingColor0.z, fma(sampledTextureValue33.z, 2.0, -1.0), 1.0)) * varyingColor0.w;
    uint scalarValue4 = uint(varyingTexCoord4);
    float intermediateValue19;
    float intermediateValue21;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    float intermediateValue23;
    float intermediateValue25;
    if (scalarValue4 != 65535u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    bool comparisonValue2 = varyingTexCoord2.y != 0.0;
    fragmentColor1.x = comparisonValue2 ? (fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w) : (scalarValue * varyingColor0.x);
    fragmentColor1.y = comparisonValue2 ? (fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w) : (scalarValue1 * varyingColor0.y);
    fragmentColor1.z = comparisonValue2 ? (fma(scalarValue3, fma(scalarValue2, varyingColor0.z, -scalarValue2), scalarValue2) * varyingColor0.w) : (scalarValue2 * varyingColor0.z);
    uint scalarValue4 = uint(varyingTexCoord4);
    float intermediateValue24;
    float intermediateValue26;
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    float intermediateValue28;
    float intermediateValue30;
    if (scalarValue4 != 65535u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue33 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingColor0.x, varyingColor0.y));
    fragmentColor1.x = (sampledTextureValue.x * fma(varyingColor0.z, fma(sampledTextureValue33.x, 2.0, -1.0), 1.0)) * varyingColor0.w;
    fragmentColor1.y = (sampledTextureValue.y * fma(varyingColor0.z, fma(sampledTextureValue33.y, 2.0, -1.0), 1.0)) * varyingColor0.w;
    fragmentColor1.z = (sampledTextureValue.z * fma(varyingColor0.z, fma(sampledTextureValue33.z, 2.0, -1.0), 1.0)) * varyingColor0.w;
    uint scalarValue4 = uint(varyingTexCoord4);
    float intermediateValue22;
    float intermediateValue24;
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    float intermediateValue26;
    float intermediateValue28;
    if (scalarValue4 != 65535u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue31 = scalarValue33 * varyingColor0.x;
    float productValue32 = scalarValue34 * varyingColor0.y;
    float productValue33 = scalarValue35 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    if (varyingTexCoord2.y != 0.0)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue39 = texture(sampler2D(seasonsTextureTexture, seasonsTextureSampler), vec2(varyingColor0.x, varyingColor0.y));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if (scalarValue4 == 65535u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue31 = scalarValue33 * varyingColor0.x;
    float productValue32 = scalarValue34 * varyingColor0.y;
    float productValue33 = scalarValue35 * varyingColor0.z;
    float productValue5;
    float productValue6;
    float productValue7;
    if (varyingTexCoord2.y != 0.0)
    {
        productValue5 = (((productValue31 - scalarValue33) * scalarValue36) + scalarValue33) * varyingColor0.w;
        productValue6 = (((productValue32 - scalarValue34) * scalarValue36) + scalarValue34) * varyingColor0.w;
        productValue7 = (((productValue33 - scalarValue35) * scalarValue36) + scalarValue35) * varyingColor0.w;
    }
    else
    {
        productValue5 = productValue31;
        productValue6 = productValue32;
        productValue7 = productValue33;
    }
    float multiplyAddValue;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if (scalarValue4 == 65535u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue39 = texture(sampler2D(seasonsTextureTexture, seasonsTextureSampler), vec2(varyingColor0.x, varyingColor0.y));
    float multiplyAddValue;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if (scalarValue4 == 65535u)
#endif
    {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue4 * 4u) + 1u]);
        float scalarValue5 = reinterpretedBits.x;
        float scalarValue6 = reinterpretedBits.y;
        float scalarValue7 = reinterpretedBits.z;
        float scalarValue8 = reinterpretedBits.w;
        vec4 reinterpretedBits1 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue4 * 4u) + 2u]);
        vec2 reinterpretedBits2 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue4 * 8u) + 6u]);
        float scalarValue9 = reinterpretedBits2.x;
        float scalarValue10 = reinterpretedBits2.y;
        uint reinterpretedBits3 = floatBitsToUint(reinterpretedBits1.x);
        float multiplyAddValue7;
        float multiplyAddValue8;
        float multiplyAddValue9;
        if ((reinterpretedBits3 & 4u) == 4u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits6 = uintBitsToFloat(intermediateValue4.packedValues[(scalarValue4 * 4u) + 1u]);
        float scalarValue53 = reinterpretedBits6.x;
        float scalarValue54 = reinterpretedBits6.y;
        float scalarValue55 = reinterpretedBits6.z;
        float scalarValue56 = reinterpretedBits6.w;
        vec4 reinterpretedBits7 = uintBitsToFloat(intermediateValue4.packedValues[(scalarValue4 * 4u) + 2u]);
        vec2 reinterpretedBits8 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue4 * 8u) + 6u]);
        float scalarValue57 = reinterpretedBits8.x;
        float scalarValue58 = reinterpretedBits8.y;
        uint reinterpretedBits9 = floatBitsToUint(reinterpretedBits7.x);
        float multiplyAddValue7;
        float multiplyAddValue8;
        float multiplyAddValue9;
        if ((reinterpretedBits9 & 4u) == 4u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue4 * 4u) + 1u]);
        float scalarValue5 = reinterpretedBits.x;
        float scalarValue6 = reinterpretedBits.y;
        float scalarValue7 = reinterpretedBits.z;
        float scalarValue8 = reinterpretedBits.w;
        vec4 reinterpretedBits1 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue4 * 4u) + 2u]);
        vec2 reinterpretedBits2 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue4 * 8u) + 6u]);
        float scalarValue9 = reinterpretedBits2.x;
        float scalarValue10 = reinterpretedBits2.y;
        uint reinterpretedBits3 = floatBitsToUint(reinterpretedBits1.x);
        float multiplyAddValue9;
        float multiplyAddValue10;
        float multiplyAddValue11;
        if ((reinterpretedBits3 & 4u) == 4u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits6 = uintBitsToFloat(intermediateValue4.packedValues[(scalarValue4 * 4u) + 1u]);
        float scalarValue53 = reinterpretedBits6.x;
        float scalarValue54 = reinterpretedBits6.y;
        float scalarValue55 = reinterpretedBits6.z;
        float scalarValue56 = reinterpretedBits6.w;
        vec4 reinterpretedBits7 = uintBitsToFloat(intermediateValue4.packedValues[(scalarValue4 * 4u) + 2u]);
        vec2 reinterpretedBits8 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue4 * 8u) + 6u]);
        float scalarValue57 = reinterpretedBits8.x;
        float scalarValue58 = reinterpretedBits8.y;
        uint reinterpretedBits9 = floatBitsToUint(reinterpretedBits7.x);
        float multiplyAddValue9;
        float multiplyAddValue10;
        float multiplyAddValue11;
        if ((reinterpretedBits9 & 4u) == 4u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue3 = (((productValue31 - scalarValue33) * scalarValue36) + scalarValue33) * varyingColor0.w;
        productValue4 = (((productValue32 - scalarValue34) * scalarValue36) + scalarValue34) * varyingColor0.w;
        productValue5 = (((productValue33 - scalarValue35) * scalarValue36) + scalarValue35) * varyingColor0.w;
    }
    else
    {
        productValue3 = productValue31;
        productValue4 = productValue32;
        productValue5 = productValue33;
    }
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if (scalarValue4 == 65535u)
    {
        intermediateValue7 = 0.0;
        intermediateValue8 = 1.0;
        intermediateValue9 = 0.0;
        intermediateValue10 = 0.0;
        intermediateValue12 = 0.0;
        intermediateValue13 = 1.0;
        intermediateValue14 = 0.0;
    }
    else
    {
        float sampledTextureValue17 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 4u)).x);
        float sampledTextureValue18 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 5u)).x);
        float sampledTextureValue19 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 6u)).x);
        float sampledTextureValue20 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 7u)).x);
        uvec4 sampledTextureValue21 = texelFetch(pbrData, int((scalarValue4 * 16u) + 8u));
        uint scalarValue37 = sampledTextureValue21.x;
        float sampledTextureValue22 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 12u)).x);
        float sampledTextureValue23 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 13u)).x);
        float sampledTextureValue24 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 15u)).x);
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if ((scalarValue37 & 4u) == 0u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue3 = 0.0;
        intermediateValue4 = 1.0;
        intermediateValue5 = 0.0;
        intermediateValue6 = 0.0;
        intermediateValue8 = 0.0;
        intermediateValue9 = 1.0;
        intermediateValue10 = 0.0;
    }
    else
    {
        float sampledTextureValue17 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 4u)).x);
        float sampledTextureValue18 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 5u)).x);
        float sampledTextureValue19 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 6u)).x);
        float sampledTextureValue20 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 7u)).x);
        uvec4 sampledTextureValue21 = texelFetch(pbrData, int((scalarValue4 * 16u) + 8u));
        uint scalarValue37 = sampledTextureValue21.x;
        float sampledTextureValue22 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 12u)).x);
        float sampledTextureValue23 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 13u)).x);
        float sampledTextureValue24 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 15u)).x);
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        if ((scalarValue37 & 4u) == 0u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        multiplyAddValue = 0.0;
        intermediateValue8 = 1.0;
        intermediateValue9 = 0.0;
        intermediateValue10 = 0.0;
        intermediateValue12 = 0.0;
        intermediateValue13 = 1.0;
        intermediateValue14 = 0.0;
    }
    else
    {
        float sampledTextureValue17 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 4u)).x);
        float sampledTextureValue18 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 5u)).x);
        float sampledTextureValue19 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 6u)).x);
        float sampledTextureValue20 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 7u)).x);
        uvec4 sampledTextureValue21 = texelFetch(pbrData, int((scalarValue4 * 16u) + 8u));
        uint scalarValue37 = sampledTextureValue21.x;
        float sampledTextureValue22 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 12u)).x);
        float sampledTextureValue23 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 13u)).x);
        float sampledTextureValue24 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 15u)).x);
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if ((scalarValue37 & 4u) == 0u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        multiplyAddValue = 0.0;
        intermediateValue4 = 1.0;
        intermediateValue5 = 0.0;
        intermediateValue6 = 0.0;
        intermediateValue8 = 0.0;
        intermediateValue9 = 1.0;
        intermediateValue10 = 0.0;
    }
    else
    {
        float sampledTextureValue17 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 4u)).x);
        float sampledTextureValue18 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 5u)).x);
        float sampledTextureValue19 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 6u)).x);
        float sampledTextureValue20 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 7u)).x);
        uvec4 sampledTextureValue21 = texelFetch(pbrData, int((scalarValue4 * 16u) + 8u));
        uint scalarValue37 = sampledTextureValue21.x;
        float sampledTextureValue22 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 12u)).x);
        float sampledTextureValue23 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 13u)).x);
        float sampledTextureValue24 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 15u)).x);
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        if ((scalarValue37 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord0.x, scalarValue5, scalarValue7), fma(varyingTexCoord0.y, scalarValue6, scalarValue8)));
            multiplyAddValue7 = fma(sampledTextureValue5.y, 2.0, -1.0);
            multiplyAddValue8 = fma(sampledTextureValue5.x, 2.0, -1.0);
            multiplyAddValue9 = fma(sampledTextureValue5.z, 2.0, -1.0);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue34 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord0.x, scalarValue53, scalarValue55), fma(varyingTexCoord0.y, scalarValue54, scalarValue56)));
            multiplyAddValue7 = fma(sampledTextureValue34.y, 2.0, -1.0);
            multiplyAddValue8 = fma(sampledTextureValue34.x, 2.0, -1.0);
            multiplyAddValue9 = fma(sampledTextureValue34.z, 2.0, -1.0);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord0.x, scalarValue5, scalarValue7), fma(varyingTexCoord0.y, scalarValue6, scalarValue8)));
            multiplyAddValue9 = fma(sampledTextureValue5.y, 2.0, -1.0);
            multiplyAddValue10 = fma(sampledTextureValue5.x, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue5.z, 2.0, -1.0);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue34 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord0.x, scalarValue53, scalarValue55), fma(varyingTexCoord0.y, scalarValue54, scalarValue56)));
            multiplyAddValue9 = fma(sampledTextureValue34.y, 2.0, -1.0);
            multiplyAddValue10 = fma(sampledTextureValue34.x, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue34.z, 2.0, -1.0);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue37 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue37 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue5 = 0.0;
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    float multiplyAddValue26 = fma(varyingTexCoord0.x, sampledTextureValue17, sampledTextureValue19);
                    float multiplyAddValue27 = fma(varyingTexCoord0.y, sampledTextureValue18, sampledTextureValue20);
                    vec4 sampledTextureValue25 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue26, multiplyAddValue27), 0.0);
                    float scalarValue38 = sampledTextureValue25.x;
                    float scalarValue39 = sampledTextureValue25.y;
                    float scalarValue40 = sampledTextureValue25.z;
                    float multiplyAddValue28 = spvNClamp(fma(spvNMin(sampledTextureValue24 - sampledTextureValue23, sampledTextureValue24), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue6 = multiplyAddValue28 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue38 == scalarValue39) && (scalarValue39 == scalarValue40))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue6)
                        {
                            uvec2 sampledTextureValue26 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue34 = float(int(uint(int(float(int(sampledTextureValue26.x)))))) * multiplyAddValue26;
                            float productValue35 = float(int(uint(int(float(int(sampledTextureValue26.y)))))) * multiplyAddValue27;
                            float scalarValue41 = fract(productValue34);
                            float scalarValue42 = fract(productValue35);
                            float comparisonValue10;
                            if (abs(scalarValue41 + (-0.5)) < 0.0625)
                            {
                                comparisonValue10 = ((scalarValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue26;
                            }
                            else
                            {
                                comparisonValue10 = multiplyAddValue26;
                            }
                            float comparisonValue11;
                            if (abs(scalarValue42 + (-0.5)) < 0.0625)
                            {
                                comparisonValue11 = ((scalarValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue27;
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue27;
                            }
                            vec4 sampledTextureValue27 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue10, comparisonValue11));
                            float scalarValue43 = sampledTextureValue27.x;
                            float scalarValue44 = sampledTextureValue27.y;
                            float scalarValue45 = sampledTextureValue27.z;
                            float scalarValue46 = sampledTextureValue27.w;
                            float sumValue23 = fract(productValue34 + 0.5);
                            float sumValue24 = fract(productValue35 + 0.5);
                            bool conditionValue7 = sumValue24 > 0.5;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue7 ? scalarValue43 : scalarValue46;
                            intermediateValue1[1u] = conditionValue7 ? scalarValue44 : scalarValue45;
                            float productValue36 = intermediateValue1[uint(int(spvNClamp((sumValue23 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue37 = intermediateValue1[uint(int(spvNClamp((sumValue23 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue25 = productValue36 - productValue37;
                            bool conditionValue8 = sumValue23 > 0.5;
                            intermediateValue1[0u] = conditionValue8 ? scalarValue45 : scalarValue46;
                            intermediateValue1[1u] = conditionValue8 ? scalarValue44 : scalarValue43;
                            float productValue38 = intermediateValue1[uint(int(spvNClamp((sumValue24 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue24 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue7 = inversesqrt(dot(vec3(sumValue25, productValue38, 0.25), vec3(sumValue25, productValue38, 0.25)));
                            float productValue39 = inverseLengthValue7 * multiplyAddValue28;
                            branchMergedValue12 = productValue39 * sumValue25;
                            branchMergedValue14 = productValue39 * productValue38;
                            branchMergedValue15 = inverseLengthValue7 * 0.25;
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
                        uvec2 sampledTextureValue28 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue6)
                        {
                            float productValue40 = fract(float(int(uint(int(float(int(sampledTextureValue28.x)))))) * multiplyAddValue26);
                            float productValue41 = fract(float(int(uint(int(float(int(sampledTextureValue28.y)))))) * multiplyAddValue27);
                            float comparisonValue35 = (((productValue40 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue39 * 2.0) + (-1.0))) - (((productValue40 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue25.w * 2.0) + (-1.0)));
                            float comparisonValue36 = (((productValue41 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue40 * 2.0) + (-1.0))) - (((productValue41 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue38 * 2.0) + (-1.0)));
                            float comparisonValue37 = ((abs(comparisonValue35) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue35;
                            float comparisonValue38 = ((abs(comparisonValue36) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue36;
                            float inverseLengthValue8 = inversesqrt(dot(vec3(comparisonValue37, comparisonValue38, 0.25), vec3(comparisonValue37, comparisonValue38, 0.25)));
                            float productValue42 = inverseLengthValue8 * multiplyAddValue28;
                            branchMergedValue13 = productValue42 * comparisonValue37;
                            branchMergedValue16 = productValue42 * comparisonValue38;
                            branchMergedValue17 = inverseLengthValue8 * 0.25;
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
                float multiplyAddValue29 = fma(varyingTexCoord0.x, sampledTextureValue17, sampledTextureValue19);
                float multiplyAddValue30 = fma(varyingTexCoord0.y, sampledTextureValue18, sampledTextureValue20);
                float multiplyAddValue31 = spvNClamp(fma(spvNMin(sampledTextureValue24 - sampledTextureValue23, sampledTextureValue24), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue31 > 0.0)
                {
                    uvec2 sampledTextureValue29 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue43 = float(int(uint(int(float(int(sampledTextureValue29.x)))))) * multiplyAddValue29;
                    float productValue44 = float(int(uint(int(float(int(sampledTextureValue29.y)))))) * multiplyAddValue30;
                    float scalarValue47 = fract(productValue43);
                    float scalarValue48 = fract(productValue44);
                    float comparisonValue4;
                    if (abs(scalarValue47 + (-0.5)) < 0.0625)
                    {
                        comparisonValue4 = ((scalarValue47 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue29;
                    }
                    else
                    {
                        comparisonValue4 = multiplyAddValue29;
                    }
                    float comparisonValue9;
                    if (abs(scalarValue48 + (-0.5)) < 0.0625)
                    {
                        comparisonValue9 = ((scalarValue48 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue30;
                    }
                    else
                    {
                        comparisonValue9 = multiplyAddValue30;
                    }
                    vec4 sampledTextureValue30 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue4, comparisonValue9));
                    float scalarValue49 = sampledTextureValue30.x;
                    float scalarValue50 = sampledTextureValue30.y;
                    float scalarValue51 = sampledTextureValue30.z;
                    float scalarValue52 = sampledTextureValue30.w;
                    float sumValue26 = fract(productValue43 + 0.5);
                    float sumValue27 = fract(productValue44 + 0.5);
                    bool conditionValue9 = sumValue27 > 0.5;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue9 ? scalarValue49 : scalarValue52;
                    intermediateValue2[1u] = conditionValue9 ? scalarValue50 : scalarValue51;
                    float productValue45 = intermediateValue2[uint(int(spvNClamp((sumValue26 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue46 = intermediateValue2[uint(int(spvNClamp((sumValue26 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue28 = productValue45 - productValue46;
                    bool conditionValue10 = sumValue26 > 0.5;
                    intermediateValue2[0u] = conditionValue10 ? scalarValue51 : scalarValue52;
                    intermediateValue2[1u] = conditionValue10 ? scalarValue50 : scalarValue49;
                    float productValue47 = intermediateValue2[uint(int(spvNClamp((sumValue27 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue2[uint(int(spvNClamp((sumValue27 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue9 = inversesqrt(dot(vec3(sumValue28, productValue47, 0.25), vec3(sumValue28, productValue47, 0.25)));
                    float productValue48 = inverseLengthValue9 * multiplyAddValue31;
                    branchMergedValue4 = productValue48 * sumValue28;
                    branchMergedValue7 = productValue48 * productValue47;
                    branchMergedValue8 = inverseLengthValue9 * 0.25;
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
            intermediateValue18 = branchMergedValue;
            intermediateValue19 = branchMergedValue1;
            intermediateValue20 = branchMergedValue2;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue37 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue37 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue5 = 0.0;
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    float multiplyAddValue26 = fma(varyingTexCoord0.x, sampledTextureValue17, sampledTextureValue19);
                    float multiplyAddValue27 = fma(varyingTexCoord0.y, sampledTextureValue18, sampledTextureValue20);
                    vec4 sampledTextureValue25 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue26, multiplyAddValue27), 0.0);
                    float scalarValue38 = sampledTextureValue25.x;
                    float scalarValue39 = sampledTextureValue25.y;
                    float scalarValue40 = sampledTextureValue25.z;
                    float multiplyAddValue28 = spvNClamp(fma(spvNMin(sampledTextureValue24 - sampledTextureValue23, sampledTextureValue24), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue6 = multiplyAddValue28 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue38 == scalarValue39) && (scalarValue39 == scalarValue40))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue6)
                        {
                            uvec2 sampledTextureValue26 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue34 = float(int(uint(int(float(int(sampledTextureValue26.x)))))) * multiplyAddValue26;
                            float productValue35 = float(int(uint(int(float(int(sampledTextureValue26.y)))))) * multiplyAddValue27;
                            float scalarValue41 = fract(productValue34);
                            float scalarValue42 = fract(productValue35);
                            float comparisonValue10;
                            if (abs(scalarValue41 + (-0.5)) < 0.0625)
                            {
                                comparisonValue10 = ((scalarValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue26;
                            }
                            else
                            {
                                comparisonValue10 = multiplyAddValue26;
                            }
                            float comparisonValue11;
                            if (abs(scalarValue42 + (-0.5)) < 0.0625)
                            {
                                comparisonValue11 = ((scalarValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue27;
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue27;
                            }
                            vec4 sampledTextureValue27 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue10, comparisonValue11));
                            float scalarValue43 = sampledTextureValue27.x;
                            float scalarValue44 = sampledTextureValue27.y;
                            float scalarValue45 = sampledTextureValue27.z;
                            float scalarValue46 = sampledTextureValue27.w;
                            float sumValue23 = fract(productValue34 + 0.5);
                            float sumValue24 = fract(productValue35 + 0.5);
                            bool conditionValue7 = sumValue24 > 0.5;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue7 ? scalarValue43 : scalarValue46;
                            intermediateValue1[1u] = conditionValue7 ? scalarValue44 : scalarValue45;
                            float productValue36 = intermediateValue1[uint(int(spvNClamp((sumValue23 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue37 = intermediateValue1[uint(int(spvNClamp((sumValue23 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue25 = productValue36 - productValue37;
                            bool conditionValue8 = sumValue23 > 0.5;
                            intermediateValue1[0u] = conditionValue8 ? scalarValue45 : scalarValue46;
                            intermediateValue1[1u] = conditionValue8 ? scalarValue44 : scalarValue43;
                            float productValue38 = intermediateValue1[uint(int(spvNClamp((sumValue24 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue24 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue7 = inversesqrt(dot(vec3(sumValue25, productValue38, 0.25), vec3(sumValue25, productValue38, 0.25)));
                            float productValue39 = inverseLengthValue7 * multiplyAddValue28;
                            branchMergedValue12 = productValue39 * sumValue25;
                            branchMergedValue14 = productValue39 * productValue38;
                            branchMergedValue15 = inverseLengthValue7 * 0.25;
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
                        uvec2 sampledTextureValue28 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue6)
                        {
                            float productValue40 = fract(float(int(uint(int(float(int(sampledTextureValue28.x)))))) * multiplyAddValue26);
                            float productValue41 = fract(float(int(uint(int(float(int(sampledTextureValue28.y)))))) * multiplyAddValue27);
                            float comparisonValue35 = (((productValue40 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue39 * 2.0) + (-1.0))) - (((productValue40 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue25.w * 2.0) + (-1.0)));
                            float comparisonValue36 = (((productValue41 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue40 * 2.0) + (-1.0))) - (((productValue41 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue38 * 2.0) + (-1.0)));
                            float comparisonValue37 = ((abs(comparisonValue35) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue35;
                            float comparisonValue38 = ((abs(comparisonValue36) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue36;
                            float inverseLengthValue8 = inversesqrt(dot(vec3(comparisonValue37, comparisonValue38, 0.25), vec3(comparisonValue37, comparisonValue38, 0.25)));
                            float productValue42 = inverseLengthValue8 * multiplyAddValue28;
                            branchMergedValue13 = productValue42 * comparisonValue37;
                            branchMergedValue16 = productValue42 * comparisonValue38;
                            branchMergedValue17 = inverseLengthValue8 * 0.25;
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
                float multiplyAddValue29 = fma(varyingTexCoord0.x, sampledTextureValue17, sampledTextureValue19);
                float multiplyAddValue30 = fma(varyingTexCoord0.y, sampledTextureValue18, sampledTextureValue20);
                float multiplyAddValue31 = spvNClamp(fma(spvNMin(sampledTextureValue24 - sampledTextureValue23, sampledTextureValue24), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue31 > 0.0)
                {
                    uvec2 sampledTextureValue29 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue43 = float(int(uint(int(float(int(sampledTextureValue29.x)))))) * multiplyAddValue29;
                    float productValue44 = float(int(uint(int(float(int(sampledTextureValue29.y)))))) * multiplyAddValue30;
                    float scalarValue47 = fract(productValue43);
                    float scalarValue48 = fract(productValue44);
                    float comparisonValue4;
                    if (abs(scalarValue47 + (-0.5)) < 0.0625)
                    {
                        comparisonValue4 = ((scalarValue47 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue29;
                    }
                    else
                    {
                        comparisonValue4 = multiplyAddValue29;
                    }
                    float comparisonValue9;
                    if (abs(scalarValue48 + (-0.5)) < 0.0625)
                    {
                        comparisonValue9 = ((scalarValue48 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue30;
                    }
                    else
                    {
                        comparisonValue9 = multiplyAddValue30;
                    }
                    vec4 sampledTextureValue30 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue4, comparisonValue9));
                    float scalarValue49 = sampledTextureValue30.x;
                    float scalarValue50 = sampledTextureValue30.y;
                    float scalarValue51 = sampledTextureValue30.z;
                    float scalarValue52 = sampledTextureValue30.w;
                    float sumValue26 = fract(productValue43 + 0.5);
                    float sumValue27 = fract(productValue44 + 0.5);
                    bool conditionValue9 = sumValue27 > 0.5;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue9 ? scalarValue49 : scalarValue52;
                    intermediateValue2[1u] = conditionValue9 ? scalarValue50 : scalarValue51;
                    float productValue45 = intermediateValue2[uint(int(spvNClamp((sumValue26 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue46 = intermediateValue2[uint(int(spvNClamp((sumValue26 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue28 = productValue45 - productValue46;
                    bool conditionValue10 = sumValue26 > 0.5;
                    intermediateValue2[0u] = conditionValue10 ? scalarValue51 : scalarValue52;
                    intermediateValue2[1u] = conditionValue10 ? scalarValue50 : scalarValue49;
                    float productValue47 = intermediateValue2[uint(int(spvNClamp((sumValue27 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue2[uint(int(spvNClamp((sumValue27 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue9 = inversesqrt(dot(vec3(sumValue28, productValue47, 0.25), vec3(sumValue28, productValue47, 0.25)));
                    float productValue48 = inverseLengthValue9 * multiplyAddValue31;
                    branchMergedValue4 = productValue48 * sumValue28;
                    branchMergedValue7 = productValue48 * productValue47;
                    branchMergedValue8 = inverseLengthValue9 * 0.25;
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
            intermediateValue14 = branchMergedValue;
            intermediateValue15 = branchMergedValue1;
            intermediateValue16 = branchMergedValue2;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue37 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue37 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue5 = 0.0;
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    float multiplyAddValue26 = fma(varyingTexCoord0.x, sampledTextureValue17, sampledTextureValue19);
                    float multiplyAddValue27 = fma(varyingTexCoord0.y, sampledTextureValue18, sampledTextureValue20);
                    vec4 sampledTextureValue25 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue26, multiplyAddValue27), 0.0);
                    float scalarValue38 = sampledTextureValue25.x;
                    float scalarValue39 = sampledTextureValue25.y;
                    float scalarValue40 = sampledTextureValue25.z;
                    float multiplyAddValue28 = spvNClamp(fma(spvNMin(sampledTextureValue24 - sampledTextureValue23, sampledTextureValue24), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue6 = multiplyAddValue28 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue38 == scalarValue39) && (scalarValue39 == scalarValue40))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue6)
                        {
                            uvec2 sampledTextureValue26 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue34 = float(int(uint(int(float(int(sampledTextureValue26.x)))))) * multiplyAddValue26;
                            float productValue35 = float(int(uint(int(float(int(sampledTextureValue26.y)))))) * multiplyAddValue27;
                            float scalarValue41 = fract(productValue34);
                            float scalarValue42 = fract(productValue35);
                            float comparisonValue11;
                            if (abs(scalarValue41 + (-0.5)) < 0.0625)
                            {
                                comparisonValue11 = ((scalarValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue26;
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue26;
                            }
                            float comparisonValue12;
                            if (abs(scalarValue42 + (-0.5)) < 0.0625)
                            {
                                comparisonValue12 = ((scalarValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue27;
                            }
                            else
                            {
                                comparisonValue12 = multiplyAddValue27;
                            }
                            vec4 sampledTextureValue40 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue11, comparisonValue12));
                            float scalarValue78 = sampledTextureValue40.x;
                            float scalarValue79 = sampledTextureValue40.y;
                            float scalarValue80 = sampledTextureValue40.z;
                            float scalarValue81 = sampledTextureValue40.w;
                            float sumValue23 = fract(productValue34 + 0.5);
                            float sumValue24 = fract(productValue35 + 0.5);
                            bool conditionValue7 = sumValue24 > 0.5;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue7 ? scalarValue78 : scalarValue81;
                            intermediateValue1[1u] = conditionValue7 ? scalarValue79 : scalarValue80;
                            float productValue36 = intermediateValue1[uint(int(spvNClamp((sumValue23 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue37 = intermediateValue1[uint(int(spvNClamp((sumValue23 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue25 = productValue36 - productValue37;
                            bool conditionValue8 = sumValue23 > 0.5;
                            intermediateValue1[0u] = conditionValue8 ? scalarValue80 : scalarValue81;
                            intermediateValue1[1u] = conditionValue8 ? scalarValue79 : scalarValue78;
                            float productValue38 = intermediateValue1[uint(int(spvNClamp((sumValue24 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue24 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue7 = inversesqrt(dot(vec3(sumValue25, productValue38, 0.25), vec3(sumValue25, productValue38, 0.25)));
                            float productValue39 = inverseLengthValue7 * multiplyAddValue28;
                            branchMergedValue12 = productValue39 * sumValue25;
                            branchMergedValue14 = productValue39 * productValue38;
                            branchMergedValue15 = inverseLengthValue7 * 0.25;
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
                        uvec2 sampledTextureValue28 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue6)
                        {
                            float productValue40 = fract(float(int(uint(int(float(int(sampledTextureValue28.x)))))) * multiplyAddValue26);
                            float productValue41 = fract(float(int(uint(int(float(int(sampledTextureValue28.y)))))) * multiplyAddValue27);
                            float comparisonValue35 = (((productValue40 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue39 * 2.0) + (-1.0))) - (((productValue40 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue25.w * 2.0) + (-1.0)));
                            float comparisonValue36 = (((productValue41 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue40 * 2.0) + (-1.0))) - (((productValue41 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue38 * 2.0) + (-1.0)));
                            float comparisonValue37 = ((abs(comparisonValue35) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue35;
                            float comparisonValue38 = ((abs(comparisonValue36) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue36;
                            float inverseLengthValue8 = inversesqrt(dot(vec3(comparisonValue37, comparisonValue38, 0.25), vec3(comparisonValue37, comparisonValue38, 0.25)));
                            float productValue42 = inverseLengthValue8 * multiplyAddValue28;
                            branchMergedValue13 = productValue42 * comparisonValue37;
                            branchMergedValue16 = productValue42 * comparisonValue38;
                            branchMergedValue17 = inverseLengthValue8 * 0.25;
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
                float multiplyAddValue29 = fma(varyingTexCoord0.x, sampledTextureValue17, sampledTextureValue19);
                float multiplyAddValue30 = fma(varyingTexCoord0.y, sampledTextureValue18, sampledTextureValue20);
                float multiplyAddValue31 = spvNClamp(fma(spvNMin(sampledTextureValue24 - sampledTextureValue23, sampledTextureValue24), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue31 > 0.0)
                {
                    uvec2 sampledTextureValue29 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue43 = float(int(uint(int(float(int(sampledTextureValue29.x)))))) * multiplyAddValue29;
                    float productValue44 = float(int(uint(int(float(int(sampledTextureValue29.y)))))) * multiplyAddValue30;
                    float scalarValue47 = fract(productValue43);
                    float scalarValue48 = fract(productValue44);
                    float comparisonValue5;
                    if (abs(scalarValue47 + (-0.5)) < 0.0625)
                    {
                        comparisonValue5 = ((scalarValue47 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue29;
                    }
                    else
                    {
                        comparisonValue5 = multiplyAddValue29;
                    }
                    float comparisonValue10;
                    if (abs(scalarValue48 + (-0.5)) < 0.0625)
                    {
                        comparisonValue10 = ((scalarValue48 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue30;
                    }
                    else
                    {
                        comparisonValue10 = multiplyAddValue30;
                    }
                    vec4 sampledTextureValue41 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue5, comparisonValue10));
                    float scalarValue82 = sampledTextureValue41.x;
                    float scalarValue83 = sampledTextureValue41.y;
                    float scalarValue84 = sampledTextureValue41.z;
                    float scalarValue85 = sampledTextureValue41.w;
                    float sumValue26 = fract(productValue43 + 0.5);
                    float sumValue27 = fract(productValue44 + 0.5);
                    bool conditionValue9 = sumValue27 > 0.5;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue9 ? scalarValue82 : scalarValue85;
                    intermediateValue2[1u] = conditionValue9 ? scalarValue83 : scalarValue84;
                    float productValue45 = intermediateValue2[uint(int(spvNClamp((sumValue26 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue46 = intermediateValue2[uint(int(spvNClamp((sumValue26 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue28 = productValue45 - productValue46;
                    bool conditionValue10 = sumValue26 > 0.5;
                    intermediateValue2[0u] = conditionValue10 ? scalarValue84 : scalarValue85;
                    intermediateValue2[1u] = conditionValue10 ? scalarValue83 : scalarValue82;
                    float productValue47 = intermediateValue2[uint(int(spvNClamp((sumValue27 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue2[uint(int(spvNClamp((sumValue27 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue9 = inversesqrt(dot(vec3(sumValue28, productValue47, 0.25), vec3(sumValue28, productValue47, 0.25)));
                    float productValue48 = inverseLengthValue9 * multiplyAddValue31;
                    branchMergedValue4 = productValue48 * sumValue28;
                    branchMergedValue7 = productValue48 * productValue47;
                    branchMergedValue8 = inverseLengthValue9 * 0.25;
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
            intermediateValue18 = branchMergedValue;
            intermediateValue19 = branchMergedValue1;
            intermediateValue20 = branchMergedValue2;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue37 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue37 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue5 = 0.0;
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    float multiplyAddValue26 = fma(varyingTexCoord0.x, sampledTextureValue17, sampledTextureValue19);
                    float multiplyAddValue27 = fma(varyingTexCoord0.y, sampledTextureValue18, sampledTextureValue20);
                    vec4 sampledTextureValue25 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue26, multiplyAddValue27), 0.0);
                    float scalarValue38 = sampledTextureValue25.x;
                    float scalarValue39 = sampledTextureValue25.y;
                    float scalarValue40 = sampledTextureValue25.z;
                    float multiplyAddValue28 = spvNClamp(fma(spvNMin(sampledTextureValue24 - sampledTextureValue23, sampledTextureValue24), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue6 = multiplyAddValue28 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue38 == scalarValue39) && (scalarValue39 == scalarValue40))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue6)
                        {
                            uvec2 sampledTextureValue26 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue34 = float(int(uint(int(float(int(sampledTextureValue26.x)))))) * multiplyAddValue26;
                            float productValue35 = float(int(uint(int(float(int(sampledTextureValue26.y)))))) * multiplyAddValue27;
                            float scalarValue41 = fract(productValue34);
                            float scalarValue42 = fract(productValue35);
                            float comparisonValue11;
                            if (abs(scalarValue41 + (-0.5)) < 0.0625)
                            {
                                comparisonValue11 = ((scalarValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue26;
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue26;
                            }
                            float comparisonValue12;
                            if (abs(scalarValue42 + (-0.5)) < 0.0625)
                            {
                                comparisonValue12 = ((scalarValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue27;
                            }
                            else
                            {
                                comparisonValue12 = multiplyAddValue27;
                            }
                            vec4 sampledTextureValue40 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue11, comparisonValue12));
                            float scalarValue78 = sampledTextureValue40.x;
                            float scalarValue79 = sampledTextureValue40.y;
                            float scalarValue80 = sampledTextureValue40.z;
                            float scalarValue81 = sampledTextureValue40.w;
                            float sumValue23 = fract(productValue34 + 0.5);
                            float sumValue24 = fract(productValue35 + 0.5);
                            bool conditionValue7 = sumValue24 > 0.5;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue7 ? scalarValue78 : scalarValue81;
                            intermediateValue1[1u] = conditionValue7 ? scalarValue79 : scalarValue80;
                            float productValue36 = intermediateValue1[uint(int(spvNClamp((sumValue23 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue37 = intermediateValue1[uint(int(spvNClamp((sumValue23 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue25 = productValue36 - productValue37;
                            bool conditionValue8 = sumValue23 > 0.5;
                            intermediateValue1[0u] = conditionValue8 ? scalarValue80 : scalarValue81;
                            intermediateValue1[1u] = conditionValue8 ? scalarValue79 : scalarValue78;
                            float productValue38 = intermediateValue1[uint(int(spvNClamp((sumValue24 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue24 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue7 = inversesqrt(dot(vec3(sumValue25, productValue38, 0.25), vec3(sumValue25, productValue38, 0.25)));
                            float productValue39 = inverseLengthValue7 * multiplyAddValue28;
                            branchMergedValue12 = productValue39 * sumValue25;
                            branchMergedValue14 = productValue39 * productValue38;
                            branchMergedValue15 = inverseLengthValue7 * 0.25;
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
                        uvec2 sampledTextureValue28 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue6)
                        {
                            float productValue40 = fract(float(int(uint(int(float(int(sampledTextureValue28.x)))))) * multiplyAddValue26);
                            float productValue41 = fract(float(int(uint(int(float(int(sampledTextureValue28.y)))))) * multiplyAddValue27);
                            float comparisonValue35 = (((productValue40 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue39 * 2.0) + (-1.0))) - (((productValue40 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue25.w * 2.0) + (-1.0)));
                            float comparisonValue36 = (((productValue41 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue40 * 2.0) + (-1.0))) - (((productValue41 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue38 * 2.0) + (-1.0)));
                            float comparisonValue37 = ((abs(comparisonValue35) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue35;
                            float comparisonValue38 = ((abs(comparisonValue36) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue36;
                            float inverseLengthValue8 = inversesqrt(dot(vec3(comparisonValue37, comparisonValue38, 0.25), vec3(comparisonValue37, comparisonValue38, 0.25)));
                            float productValue42 = inverseLengthValue8 * multiplyAddValue28;
                            branchMergedValue13 = productValue42 * comparisonValue37;
                            branchMergedValue16 = productValue42 * comparisonValue38;
                            branchMergedValue17 = inverseLengthValue8 * 0.25;
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
                float multiplyAddValue29 = fma(varyingTexCoord0.x, sampledTextureValue17, sampledTextureValue19);
                float multiplyAddValue30 = fma(varyingTexCoord0.y, sampledTextureValue18, sampledTextureValue20);
                float multiplyAddValue31 = spvNClamp(fma(spvNMin(sampledTextureValue24 - sampledTextureValue23, sampledTextureValue24), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue31 > 0.0)
                {
                    uvec2 sampledTextureValue29 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue43 = float(int(uint(int(float(int(sampledTextureValue29.x)))))) * multiplyAddValue29;
                    float productValue44 = float(int(uint(int(float(int(sampledTextureValue29.y)))))) * multiplyAddValue30;
                    float scalarValue47 = fract(productValue43);
                    float scalarValue48 = fract(productValue44);
                    float comparisonValue5;
                    if (abs(scalarValue47 + (-0.5)) < 0.0625)
                    {
                        comparisonValue5 = ((scalarValue47 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue29;
                    }
                    else
                    {
                        comparisonValue5 = multiplyAddValue29;
                    }
                    float comparisonValue10;
                    if (abs(scalarValue48 + (-0.5)) < 0.0625)
                    {
                        comparisonValue10 = ((scalarValue48 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue30;
                    }
                    else
                    {
                        comparisonValue10 = multiplyAddValue30;
                    }
                    vec4 sampledTextureValue41 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue5, comparisonValue10));
                    float scalarValue82 = sampledTextureValue41.x;
                    float scalarValue83 = sampledTextureValue41.y;
                    float scalarValue84 = sampledTextureValue41.z;
                    float scalarValue85 = sampledTextureValue41.w;
                    float sumValue26 = fract(productValue43 + 0.5);
                    float sumValue27 = fract(productValue44 + 0.5);
                    bool conditionValue9 = sumValue27 > 0.5;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue9 ? scalarValue82 : scalarValue85;
                    intermediateValue2[1u] = conditionValue9 ? scalarValue83 : scalarValue84;
                    float productValue45 = intermediateValue2[uint(int(spvNClamp((sumValue26 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue46 = intermediateValue2[uint(int(spvNClamp((sumValue26 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue28 = productValue45 - productValue46;
                    bool conditionValue10 = sumValue26 > 0.5;
                    intermediateValue2[0u] = conditionValue10 ? scalarValue84 : scalarValue85;
                    intermediateValue2[1u] = conditionValue10 ? scalarValue83 : scalarValue82;
                    float productValue47 = intermediateValue2[uint(int(spvNClamp((sumValue27 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue2[uint(int(spvNClamp((sumValue27 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue9 = inversesqrt(dot(vec3(sumValue28, productValue47, 0.25), vec3(sumValue28, productValue47, 0.25)));
                    float productValue48 = inverseLengthValue9 * multiplyAddValue31;
                    branchMergedValue4 = productValue48 * sumValue28;
                    branchMergedValue7 = productValue48 * productValue47;
                    branchMergedValue8 = inverseLengthValue9 * 0.25;
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
            intermediateValue14 = branchMergedValue;
            intermediateValue15 = branchMergedValue1;
            intermediateValue16 = branchMergedValue2;
#endif
        }
        else
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits4 = uintBitsToFloat(intermediateValue1.packedValues[(scalarValue4 * 16u) + 15u]);
            float intermediateValue31;
            float intermediateValue32;
            float intermediateValue33;
            if ((reinterpretedBits3 & 8u) == 8u)
            {
                float sumValue = spvNClamp(2.0 - spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue10), 0.0, 1.0);
                float productValue10;
                float productValue11;
                float productValue12;
                if (sumValue > 0.0)
                {
                    float multiplyAddValue5 = fma(varyingTexCoord0.x, scalarValue5, scalarValue7);
                    float multiplyAddValue6 = fma(varyingTexCoord0.y, scalarValue6, scalarValue8);
                    bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture1)) > 0u;
                    uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture1, int(0u)));
                    uint scalarValue11 = sampledTextureValue7.x;
                    float comparisonValue3 = rdEvaluateFloatExpression2(sampledTextureValue6 ? scalarValue11 : 0u);
                    float comparisonValue6 = rdEvaluateFloatExpression2(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                    float productValue = fract(multiplyAddValue5 * comparisonValue3);
                    float productValue1 = fract(multiplyAddValue6 * comparisonValue6);
                    vec4 sampledTextureValue8 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue - 0.5) < 0.0625) ? (multiplyAddValue5 + ((productValue > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue5, (abs(productValue1 - 0.5) < 0.0625) ? (multiplyAddValue6 + ((productValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue6));
                    float scalarValue12 = sampledTextureValue8.x;
                    float scalarValue13 = sampledTextureValue8.y;
                    float scalarValue14 = sampledTextureValue8.z;
                    float scalarValue15 = sampledTextureValue8.w;
                    float multiplyAddValue12 = fract(fma(multiplyAddValue5, comparisonValue3, 0.5));
                    float multiplyAddValue13 = fract(fma(multiplyAddValue6, comparisonValue6, 0.5));
                    bool conditionValue = multiplyAddValue13 > 0.5;
                    bool conditionValue1 = multiplyAddValue12 > 0.5;
                    float comparisonValue7 = conditionValue ? scalarValue12 : scalarValue15;
                    float comparisonValue8 = conditionValue ? scalarValue13 : scalarValue14;
                    float comparisonValue13 = conditionValue1 ? scalarValue14 : scalarValue15;
                    float comparisonValue14 = conditionValue1 ? scalarValue13 : scalarValue12;
                    float sumValue1 = multiplyAddValue12 - 0.083333335816860198974609375;
                    float sumValue2 = multiplyAddValue12 + 0.083333335816860198974609375;
                    float sumValue3 = multiplyAddValue13 - 0.083333335816860198974609375;
                    float sumValue4 = multiplyAddValue13 + 0.083333335816860198974609375;
                    uint sumValue5 = uint(int(spvNClamp(sumValue1 + sumValue1, 0.0, 1.0)));
                    uint sumValue6 = uint(int(spvNClamp(sumValue2 + sumValue2, 0.0, 1.0)));
                    uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                    uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                    float comparisonValue15 = ((sumValue5 == 1u) ? comparisonValue8 : ((sumValue5 == 0u) ? comparisonValue7 : 0.0)) - ((sumValue6 == 1u) ? comparisonValue8 : ((sumValue6 == 0u) ? comparisonValue7 : 0.0));
                    float comparisonValue16 = ((sumValue7 == 1u) ? comparisonValue14 : ((sumValue7 == 0u) ? comparisonValue13 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue14 : ((sumValue8 == 0u) ? comparisonValue13 : 0.0));
                    vec3 vectorValue = vec3(comparisonValue15, comparisonValue16, 0.25);
                    float scalarValue16 = rdDot3Precise(vectorValue, vectorValue);
                    float inverseLengthValue = inversesqrt(scalarValue16);
                    productValue10 = sumValue * (inverseLengthValue * comparisonValue16);
                    productValue11 = sumValue * (inverseLengthValue * comparisonValue15);
                    productValue12 = inverseLengthValue * 0.25;
                }
                else
                {
                    productValue10 = 0.0;
                    productValue11 = 0.0;
                    productValue12 = 1.0;
                }
                intermediateValue31 = productValue10;
                intermediateValue32 = productValue11;
                intermediateValue33 = productValue12;
            }
            else
            {
                float intermediateValue52;
                float intermediateValue54;
                float intermediateValue56;
                if ((reinterpretedBits3 & 16u) == 16u)
                {
                    float multiplyAddValue14 = fma(varyingTexCoord0.x, scalarValue5, scalarValue7);
                    float multiplyAddValue15 = fma(varyingTexCoord0.y, scalarValue6, scalarValue8);
                    float sumValue9 = spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue10);
                    vec4 sampledTextureValue9 = textureLod(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue14, multiplyAddValue15), 0.0);
                    float scalarValue17 = sampledTextureValue9.x;
                    float scalarValue18 = sampledTextureValue9.y;
                    float scalarValue19 = sampledTextureValue9.z;
                    float intermediateValue53;
                    float intermediateValue55;
                    float intermediateValue57;
                    if ((scalarValue18 == scalarValue17) && (scalarValue19 == scalarValue18))
                    {
                        float scalarValue20 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        float productValue17;
                        float productValue18;
                        float productValue19;
                        if (scalarValue20 > 0.0)
                        {
                            bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture1)) > 0u;
                            uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture1, int(0u)));
                            uint scalarValue21 = sampledTextureValue11.x;
                            float comparisonValue17 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue21 : 0u);
                            float comparisonValue18 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                            float productValue2 = fract(multiplyAddValue14 * comparisonValue17);
                            float productValue16 = fract(multiplyAddValue15 * comparisonValue18);
                            vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue2 - 0.5) < 0.0625) ? (multiplyAddValue14 + ((productValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue14, (abs(productValue16 - 0.5) < 0.0625) ? (multiplyAddValue15 + ((productValue16 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue15));
                            float scalarValue22 = sampledTextureValue12.x;
                            float scalarValue23 = sampledTextureValue12.y;
                            float scalarValue24 = sampledTextureValue12.z;
                            float scalarValue25 = sampledTextureValue12.w;
                            float multiplyAddValue16 = fract(fma(multiplyAddValue14, comparisonValue17, 0.5));
                            float multiplyAddValue17 = fract(fma(multiplyAddValue15, comparisonValue18, 0.5));
                            bool conditionValue2 = multiplyAddValue17 > 0.5;
                            bool conditionValue3 = multiplyAddValue16 > 0.5;
                            float comparisonValue19 = conditionValue2 ? scalarValue22 : scalarValue25;
                            float comparisonValue20 = conditionValue2 ? scalarValue23 : scalarValue24;
                            float comparisonValue21 = conditionValue3 ? scalarValue24 : scalarValue25;
                            float comparisonValue22 = conditionValue3 ? scalarValue23 : scalarValue22;
                            float sumValue10 = multiplyAddValue16 - 0.083333335816860198974609375;
                            float sumValue11 = multiplyAddValue16 + 0.083333335816860198974609375;
                            float sumValue12 = multiplyAddValue17 - 0.083333335816860198974609375;
                            float sumValue13 = multiplyAddValue17 + 0.083333335816860198974609375;
                            uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                            uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                            uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                            uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                            float comparisonValue23 = ((sumValue14 == 1u) ? comparisonValue20 : ((sumValue14 == 0u) ? comparisonValue19 : 0.0)) - ((sumValue15 == 1u) ? comparisonValue20 : ((sumValue15 == 0u) ? comparisonValue19 : 0.0));
                            float comparisonValue24 = ((sumValue16 == 1u) ? comparisonValue22 : ((sumValue16 == 0u) ? comparisonValue21 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue22 : ((sumValue17 == 0u) ? comparisonValue21 : 0.0));
                            vec3 vectorValue1 = vec3(comparisonValue23, comparisonValue24, 0.25);
                            float scalarValue26 = rdDot3Precise(vectorValue1, vectorValue1);
                            float inverseLengthValue1 = inversesqrt(scalarValue26);
                            productValue17 = scalarValue20 * (inverseLengthValue1 * comparisonValue24);
                            productValue18 = scalarValue20 * (inverseLengthValue1 * comparisonValue23);
                            productValue19 = inverseLengthValue1 * 0.25;
                        }
                        else
                        {
                            productValue17 = 0.0;
                            productValue18 = 0.0;
                            productValue19 = 1.0;
                        }
                        intermediateValue53 = productValue17;
                        intermediateValue55 = productValue18;
                        intermediateValue57 = productValue19;
                    }
                    else
                    {
                        bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture1)) > 0u;
                        uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture1, int(0u)));
                        uint scalarValue27 = sampledTextureValue14.x;
                        float comparisonValue25 = rdEvaluateFloatExpression2(sampledTextureValue13 ? scalarValue27 : 0u);
                        float comparisonValue26 = rdEvaluateFloatExpression2(sampledTextureValue13 ? sampledTextureValue14.y : 0u);
                        float sumValue18 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        bool conditionValue4 = sumValue18 > 0.0;
                        float productValue22 = fract(multiplyAddValue14 * comparisonValue25);
                        float productValue23 = fract(multiplyAddValue15 * comparisonValue26);
                        float multiplyAddValue18 = (productValue22 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue9.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue19 = (productValue23 <= 0.083333335816860198974609375) ? (-fma(scalarValue17, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue20 = (productValue22 >= 0.916666686534881591796875) ? (fma(scalarValue18, 2.0, -1.0) + multiplyAddValue18) : multiplyAddValue18;
                        float multiplyAddValue21 = (productValue23 >= 0.916666686534881591796875) ? (fma(scalarValue19, 2.0, -1.0) + multiplyAddValue19) : multiplyAddValue19;
                        bool comparisonValue27 = abs(multiplyAddValue20) >= 0.004999999888241291046142578125;
                        bool comparisonValue28 = abs(multiplyAddValue21) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue29 = vec3(comparisonValue27 ? multiplyAddValue20 : 0.0, comparisonValue28 ? multiplyAddValue21 : 0.0, 0.25);
                        float scalarValue28 = rdDot3Precise(comparisonValue29, comparisonValue29);
                        float inverseLengthValue2 = inversesqrt(scalarValue28);
                        intermediateValue53 = (conditionValue4 && comparisonValue28) ? (sumValue18 * (inverseLengthValue2 * multiplyAddValue21)) : 0.0;
                        intermediateValue55 = (conditionValue4 && comparisonValue27) ? (sumValue18 * (inverseLengthValue2 * multiplyAddValue20)) : 0.0;
                        intermediateValue57 = conditionValue4 ? (inverseLengthValue2 * 0.25) : 1.0;
                    }
                    intermediateValue52 = intermediateValue53;
                    intermediateValue54 = intermediateValue55;
                    intermediateValue56 = intermediateValue57;
                }
                else
                {
                    intermediateValue52 = 0.0;
                    intermediateValue54 = 0.0;
                    intermediateValue56 = 1.0;
                }
                intermediateValue31 = intermediateValue52;
                intermediateValue32 = intermediateValue54;
                intermediateValue33 = intermediateValue56;
            }
            multiplyAddValue7 = intermediateValue31;
            multiplyAddValue8 = intermediateValue32;
            multiplyAddValue9 = intermediateValue33;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits10 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue4 * 16u) + 15u]);
            float intermediateValue29;
            float intermediateValue30;
            float intermediateValue31;
            if ((reinterpretedBits9 & 8u) == 8u)
            {
                float sumValue29 = spvNClamp(2.0 - spvNMin(reinterpretedBits10, reinterpretedBits10 - scalarValue58), 0.0, 1.0);
                float productValue10;
                float productValue11;
                float productValue12;
                if (sumValue29 > 0.0)
                {
                    float multiplyAddValue34 = fma(varyingTexCoord0.x, scalarValue53, scalarValue55);
                    float multiplyAddValue35 = fma(varyingTexCoord0.y, scalarValue54, scalarValue56);
                    bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture1)) > 0u;
                    uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture1, int(0u)));
                    uint scalarValue11 = sampledTextureValue7.x;
                    float comparisonValue3 = rdEvaluateFloatExpression2(sampledTextureValue6 ? scalarValue11 : 0u);
                    float comparisonValue6 = rdEvaluateFloatExpression2(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                    float productValue58 = fract(multiplyAddValue34 * comparisonValue3);
                    float productValue59 = fract(multiplyAddValue35 * comparisonValue6);
                    vec4 sampledTextureValue35 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue58 - 0.5) < 0.0625) ? (multiplyAddValue34 + ((productValue58 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue34, (abs(productValue59 - 0.5) < 0.0625) ? (multiplyAddValue35 + ((productValue59 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue35));
                    float scalarValue59 = sampledTextureValue35.x;
                    float scalarValue60 = sampledTextureValue35.y;
                    float scalarValue61 = sampledTextureValue35.z;
                    float scalarValue62 = sampledTextureValue35.w;
                    float multiplyAddValue36 = fract(fma(multiplyAddValue34, comparisonValue3, 0.5));
                    float multiplyAddValue37 = fract(fma(multiplyAddValue35, comparisonValue6, 0.5));
                    bool conditionValue12 = multiplyAddValue37 > 0.5;
                    bool conditionValue13 = multiplyAddValue36 > 0.5;
                    float comparisonValue42 = conditionValue12 ? scalarValue59 : scalarValue62;
                    float comparisonValue43 = conditionValue12 ? scalarValue60 : scalarValue61;
                    float comparisonValue44 = conditionValue13 ? scalarValue61 : scalarValue62;
                    float comparisonValue45 = conditionValue13 ? scalarValue60 : scalarValue59;
                    float sumValue30 = multiplyAddValue36 - 0.083333335816860198974609375;
                    float sumValue31 = multiplyAddValue36 + 0.083333335816860198974609375;
                    float sumValue32 = multiplyAddValue37 - 0.083333335816860198974609375;
                    float sumValue33 = multiplyAddValue37 + 0.083333335816860198974609375;
                    uint sumValue34 = uint(int(spvNClamp(sumValue30 + sumValue30, 0.0, 1.0)));
                    uint sumValue35 = uint(int(spvNClamp(sumValue31 + sumValue31, 0.0, 1.0)));
                    uint sumValue36 = uint(int(spvNClamp(sumValue32 + sumValue32, 0.0, 1.0)));
                    uint sumValue37 = uint(int(spvNClamp(sumValue33 + sumValue33, 0.0, 1.0)));
                    float comparisonValue46 = ((sumValue34 == 1u) ? comparisonValue43 : ((sumValue34 == 0u) ? comparisonValue42 : 0.0)) - ((sumValue35 == 1u) ? comparisonValue43 : ((sumValue35 == 0u) ? comparisonValue42 : 0.0));
                    float comparisonValue47 = ((sumValue36 == 1u) ? comparisonValue45 : ((sumValue36 == 0u) ? comparisonValue44 : 0.0)) - ((sumValue37 == 1u) ? comparisonValue45 : ((sumValue37 == 0u) ? comparisonValue44 : 0.0));
                    vec3 vectorValue6 = vec3(comparisonValue46, comparisonValue47, 0.25);
                    float scalarValue63 = rdDot3Precise(vectorValue6, vectorValue6);
                    float inverseLengthValue14 = inversesqrt(scalarValue63);
                    productValue10 = sumValue29 * (inverseLengthValue14 * comparisonValue47);
                    productValue11 = sumValue29 * (inverseLengthValue14 * comparisonValue46);
                    productValue12 = inverseLengthValue14 * 0.25;
                }
                else
                {
                    productValue10 = 0.0;
                    productValue11 = 0.0;
                    productValue12 = 1.0;
                }
                intermediateValue29 = productValue10;
                intermediateValue30 = productValue11;
                intermediateValue31 = productValue12;
            }
            else
            {
                float intermediateValue50;
                float intermediateValue52;
                float intermediateValue54;
                if ((reinterpretedBits9 & 16u) == 16u)
                {
                    float multiplyAddValue38 = fma(varyingTexCoord0.x, scalarValue53, scalarValue55);
                    float multiplyAddValue39 = fma(varyingTexCoord0.y, scalarValue54, scalarValue56);
                    float sumValue38 = spvNMin(reinterpretedBits10, reinterpretedBits10 - scalarValue58);
                    vec4 sampledTextureValue36 = textureLod(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue38, multiplyAddValue39), 0.0);
                    float scalarValue64 = sampledTextureValue36.x;
                    float scalarValue65 = sampledTextureValue36.y;
                    float scalarValue66 = sampledTextureValue36.z;
                    float intermediateValue51;
                    float intermediateValue53;
                    float intermediateValue55;
                    if ((scalarValue65 == scalarValue64) && (scalarValue66 == scalarValue65))
                    {
                        float scalarValue67 = spvNClamp(2.0 - sumValue38, 0.0, 1.0);
                        float productValue17;
                        float productValue18;
                        float productValue19;
                        if (scalarValue67 > 0.0)
                        {
                            bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture1)) > 0u;
                            uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture1, int(0u)));
                            uint scalarValue21 = sampledTextureValue11.x;
                            float comparisonValue17 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue21 : 0u);
                            float comparisonValue18 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                            float productValue60 = fract(multiplyAddValue38 * comparisonValue17);
                            float productValue61 = fract(multiplyAddValue39 * comparisonValue18);
                            vec4 sampledTextureValue37 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue60 - 0.5) < 0.0625) ? (multiplyAddValue38 + ((productValue60 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue38, (abs(productValue61 - 0.5) < 0.0625) ? (multiplyAddValue39 + ((productValue61 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue39));
                            float scalarValue68 = sampledTextureValue37.x;
                            float scalarValue69 = sampledTextureValue37.y;
                            float scalarValue70 = sampledTextureValue37.z;
                            float scalarValue71 = sampledTextureValue37.w;
                            float multiplyAddValue40 = fract(fma(multiplyAddValue38, comparisonValue17, 0.5));
                            float multiplyAddValue41 = fract(fma(multiplyAddValue39, comparisonValue18, 0.5));
                            bool conditionValue14 = multiplyAddValue41 > 0.5;
                            bool conditionValue15 = multiplyAddValue40 > 0.5;
                            float comparisonValue48 = conditionValue14 ? scalarValue68 : scalarValue71;
                            float comparisonValue49 = conditionValue14 ? scalarValue69 : scalarValue70;
                            float comparisonValue50 = conditionValue15 ? scalarValue70 : scalarValue71;
                            float comparisonValue51 = conditionValue15 ? scalarValue69 : scalarValue68;
                            float sumValue39 = multiplyAddValue40 - 0.083333335816860198974609375;
                            float sumValue40 = multiplyAddValue40 + 0.083333335816860198974609375;
                            float sumValue41 = multiplyAddValue41 - 0.083333335816860198974609375;
                            float sumValue42 = multiplyAddValue41 + 0.083333335816860198974609375;
                            uint sumValue43 = uint(int(spvNClamp(sumValue39 + sumValue39, 0.0, 1.0)));
                            uint sumValue44 = uint(int(spvNClamp(sumValue40 + sumValue40, 0.0, 1.0)));
                            uint sumValue45 = uint(int(spvNClamp(sumValue41 + sumValue41, 0.0, 1.0)));
                            uint sumValue46 = uint(int(spvNClamp(sumValue42 + sumValue42, 0.0, 1.0)));
                            float comparisonValue52 = ((sumValue43 == 1u) ? comparisonValue49 : ((sumValue43 == 0u) ? comparisonValue48 : 0.0)) - ((sumValue44 == 1u) ? comparisonValue49 : ((sumValue44 == 0u) ? comparisonValue48 : 0.0));
                            float comparisonValue53 = ((sumValue45 == 1u) ? comparisonValue51 : ((sumValue45 == 0u) ? comparisonValue50 : 0.0)) - ((sumValue46 == 1u) ? comparisonValue51 : ((sumValue46 == 0u) ? comparisonValue50 : 0.0));
                            vec3 vectorValue7 = vec3(comparisonValue52, comparisonValue53, 0.25);
                            float scalarValue72 = rdDot3Precise(vectorValue7, vectorValue7);
                            float inverseLengthValue15 = inversesqrt(scalarValue72);
                            productValue17 = scalarValue67 * (inverseLengthValue15 * comparisonValue53);
                            productValue18 = scalarValue67 * (inverseLengthValue15 * comparisonValue52);
                            productValue19 = inverseLengthValue15 * 0.25;
                        }
                        else
                        {
                            productValue17 = 0.0;
                            productValue18 = 0.0;
                            productValue19 = 1.0;
                        }
                        intermediateValue51 = productValue17;
                        intermediateValue53 = productValue18;
                        intermediateValue55 = productValue19;
                    }
                    else
                    {
                        bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture1)) > 0u;
                        uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture1, int(0u)));
                        uint scalarValue27 = sampledTextureValue14.x;
                        float comparisonValue25 = rdEvaluateFloatExpression2(sampledTextureValue13 ? scalarValue27 : 0u);
                        float comparisonValue26 = rdEvaluateFloatExpression2(sampledTextureValue13 ? sampledTextureValue14.y : 0u);
                        float sumValue47 = spvNClamp(2.0 - sumValue38, 0.0, 1.0);
                        bool conditionValue16 = sumValue47 > 0.0;
                        float productValue62 = fract(multiplyAddValue38 * comparisonValue25);
                        float productValue63 = fract(multiplyAddValue39 * comparisonValue26);
                        float multiplyAddValue42 = (productValue62 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue36.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue43 = (productValue63 <= 0.083333335816860198974609375) ? (-fma(scalarValue64, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue44 = (productValue62 >= 0.916666686534881591796875) ? (fma(scalarValue65, 2.0, -1.0) + multiplyAddValue42) : multiplyAddValue42;
                        float multiplyAddValue45 = (productValue63 >= 0.916666686534881591796875) ? (fma(scalarValue66, 2.0, -1.0) + multiplyAddValue43) : multiplyAddValue43;
                        bool comparisonValue54 = abs(multiplyAddValue44) >= 0.004999999888241291046142578125;
                        bool comparisonValue55 = abs(multiplyAddValue45) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue56 = vec3(comparisonValue54 ? multiplyAddValue44 : 0.0, comparisonValue55 ? multiplyAddValue45 : 0.0, 0.25);
                        float scalarValue73 = rdDot3Precise(comparisonValue56, comparisonValue56);
                        float inverseLengthValue16 = inversesqrt(scalarValue73);
                        intermediateValue51 = (conditionValue16 && comparisonValue55) ? (sumValue47 * (inverseLengthValue16 * multiplyAddValue45)) : 0.0;
                        intermediateValue53 = (conditionValue16 && comparisonValue54) ? (sumValue47 * (inverseLengthValue16 * multiplyAddValue44)) : 0.0;
                        intermediateValue55 = conditionValue16 ? (inverseLengthValue16 * 0.25) : 1.0;
                    }
                    intermediateValue50 = intermediateValue51;
                    intermediateValue52 = intermediateValue53;
                    intermediateValue54 = intermediateValue55;
                }
                else
                {
                    intermediateValue50 = 0.0;
                    intermediateValue52 = 0.0;
                    intermediateValue54 = 1.0;
                }
                intermediateValue29 = intermediateValue50;
                intermediateValue30 = intermediateValue52;
                intermediateValue31 = intermediateValue54;
            }
            multiplyAddValue7 = intermediateValue29;
            multiplyAddValue8 = intermediateValue30;
            multiplyAddValue9 = intermediateValue31;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits4 = uintBitsToFloat(intermediateValue1.packedValues[(scalarValue4 * 16u) + 15u]);
            float intermediateValue34;
            float intermediateValue35;
            float intermediateValue36;
            if ((reinterpretedBits3 & 8u) == 8u)
            {
                float sumValue = spvNClamp(2.0 - spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue10), 0.0, 1.0);
                float productValue12;
                float productValue13;
                float productValue14;
                if (sumValue > 0.0)
                {
                    float multiplyAddValue5 = fma(varyingTexCoord0.x, scalarValue5, scalarValue7);
                    float multiplyAddValue6 = fma(varyingTexCoord0.y, scalarValue6, scalarValue8);
                    bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture1)) > 0u;
                    uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture1, int(0u)));
                    uint scalarValue11 = sampledTextureValue7.x;
                    float comparisonValue3 = rdEvaluateFloatExpression2(sampledTextureValue6 ? scalarValue11 : 0u);
                    float comparisonValue6 = rdEvaluateFloatExpression2(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                    float productValue = fract(multiplyAddValue5 * comparisonValue3);
                    float productValue1 = fract(multiplyAddValue6 * comparisonValue6);
                    vec4 sampledTextureValue8 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue - 0.5) < 0.0625) ? (multiplyAddValue5 + ((productValue > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue5, (abs(productValue1 - 0.5) < 0.0625) ? (multiplyAddValue6 + ((productValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue6));
                    float scalarValue12 = sampledTextureValue8.x;
                    float scalarValue13 = sampledTextureValue8.y;
                    float scalarValue14 = sampledTextureValue8.z;
                    float scalarValue15 = sampledTextureValue8.w;
                    float multiplyAddValue12 = fract(fma(multiplyAddValue5, comparisonValue3, 0.5));
                    float multiplyAddValue13 = fract(fma(multiplyAddValue6, comparisonValue6, 0.5));
                    bool conditionValue = multiplyAddValue13 > 0.5;
                    bool conditionValue1 = multiplyAddValue12 > 0.5;
                    float comparisonValue7 = conditionValue ? scalarValue12 : scalarValue15;
                    float comparisonValue8 = conditionValue ? scalarValue13 : scalarValue14;
                    float comparisonValue13 = conditionValue1 ? scalarValue14 : scalarValue15;
                    float comparisonValue14 = conditionValue1 ? scalarValue13 : scalarValue12;
                    float sumValue1 = multiplyAddValue12 - 0.083333335816860198974609375;
                    float sumValue2 = multiplyAddValue12 + 0.083333335816860198974609375;
                    float sumValue3 = multiplyAddValue13 - 0.083333335816860198974609375;
                    float sumValue4 = multiplyAddValue13 + 0.083333335816860198974609375;
                    uint sumValue5 = uint(int(spvNClamp(sumValue1 + sumValue1, 0.0, 1.0)));
                    uint sumValue6 = uint(int(spvNClamp(sumValue2 + sumValue2, 0.0, 1.0)));
                    uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                    uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                    float comparisonValue15 = ((sumValue5 == 1u) ? comparisonValue8 : ((sumValue5 == 0u) ? comparisonValue7 : 0.0)) - ((sumValue6 == 1u) ? comparisonValue8 : ((sumValue6 == 0u) ? comparisonValue7 : 0.0));
                    float comparisonValue16 = ((sumValue7 == 1u) ? comparisonValue14 : ((sumValue7 == 0u) ? comparisonValue13 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue14 : ((sumValue8 == 0u) ? comparisonValue13 : 0.0));
                    vec3 vectorValue = vec3(comparisonValue15, comparisonValue16, 0.25);
                    float scalarValue16 = rdDot3Precise(vectorValue, vectorValue);
                    float inverseLengthValue = inversesqrt(scalarValue16);
                    productValue12 = sumValue * (inverseLengthValue * comparisonValue16);
                    productValue13 = sumValue * (inverseLengthValue * comparisonValue15);
                    productValue14 = inverseLengthValue * 0.25;
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
                if ((reinterpretedBits3 & 16u) == 16u)
                {
                    float multiplyAddValue14 = fma(varyingTexCoord0.x, scalarValue5, scalarValue7);
                    float multiplyAddValue15 = fma(varyingTexCoord0.y, scalarValue6, scalarValue8);
                    float sumValue9 = spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue10);
                    vec4 sampledTextureValue9 = textureLod(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue14, multiplyAddValue15), 0.0);
                    float scalarValue17 = sampledTextureValue9.x;
                    float scalarValue18 = sampledTextureValue9.y;
                    float scalarValue19 = sampledTextureValue9.z;
                    float intermediateValue56;
                    float intermediateValue58;
                    float intermediateValue60;
                    if ((scalarValue18 == scalarValue17) && (scalarValue19 == scalarValue18))
                    {
                        float scalarValue20 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        float productValue19;
                        float productValue20;
                        float productValue21;
                        if (scalarValue20 > 0.0)
                        {
                            bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture1)) > 0u;
                            uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture1, int(0u)));
                            uint scalarValue21 = sampledTextureValue11.x;
                            float comparisonValue17 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue21 : 0u);
                            float comparisonValue18 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                            float productValue2 = fract(multiplyAddValue14 * comparisonValue17);
                            float productValue16 = fract(multiplyAddValue15 * comparisonValue18);
                            vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue2 - 0.5) < 0.0625) ? (multiplyAddValue14 + ((productValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue14, (abs(productValue16 - 0.5) < 0.0625) ? (multiplyAddValue15 + ((productValue16 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue15));
                            float scalarValue22 = sampledTextureValue12.x;
                            float scalarValue23 = sampledTextureValue12.y;
                            float scalarValue24 = sampledTextureValue12.z;
                            float scalarValue25 = sampledTextureValue12.w;
                            float multiplyAddValue16 = fract(fma(multiplyAddValue14, comparisonValue17, 0.5));
                            float multiplyAddValue17 = fract(fma(multiplyAddValue15, comparisonValue18, 0.5));
                            bool conditionValue2 = multiplyAddValue17 > 0.5;
                            bool conditionValue3 = multiplyAddValue16 > 0.5;
                            float comparisonValue19 = conditionValue2 ? scalarValue22 : scalarValue25;
                            float comparisonValue20 = conditionValue2 ? scalarValue23 : scalarValue24;
                            float comparisonValue21 = conditionValue3 ? scalarValue24 : scalarValue25;
                            float comparisonValue22 = conditionValue3 ? scalarValue23 : scalarValue22;
                            float sumValue10 = multiplyAddValue16 - 0.083333335816860198974609375;
                            float sumValue11 = multiplyAddValue16 + 0.083333335816860198974609375;
                            float sumValue12 = multiplyAddValue17 - 0.083333335816860198974609375;
                            float sumValue13 = multiplyAddValue17 + 0.083333335816860198974609375;
                            uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                            uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                            uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                            uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                            float comparisonValue23 = ((sumValue14 == 1u) ? comparisonValue20 : ((sumValue14 == 0u) ? comparisonValue19 : 0.0)) - ((sumValue15 == 1u) ? comparisonValue20 : ((sumValue15 == 0u) ? comparisonValue19 : 0.0));
                            float comparisonValue24 = ((sumValue16 == 1u) ? comparisonValue22 : ((sumValue16 == 0u) ? comparisonValue21 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue22 : ((sumValue17 == 0u) ? comparisonValue21 : 0.0));
                            vec3 vectorValue1 = vec3(comparisonValue23, comparisonValue24, 0.25);
                            float scalarValue26 = rdDot3Precise(vectorValue1, vectorValue1);
                            float inverseLengthValue1 = inversesqrt(scalarValue26);
                            productValue19 = scalarValue20 * (inverseLengthValue1 * comparisonValue24);
                            productValue20 = scalarValue20 * (inverseLengthValue1 * comparisonValue23);
                            productValue21 = inverseLengthValue1 * 0.25;
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
                        bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture1)) > 0u;
                        uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture1, int(0u)));
                        uint scalarValue27 = sampledTextureValue14.x;
                        float comparisonValue25 = rdEvaluateFloatExpression2(sampledTextureValue13 ? scalarValue27 : 0u);
                        float comparisonValue26 = rdEvaluateFloatExpression2(sampledTextureValue13 ? sampledTextureValue14.y : 0u);
                        float sumValue18 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        bool conditionValue4 = sumValue18 > 0.0;
                        float productValue22 = fract(multiplyAddValue14 * comparisonValue25);
                        float productValue23 = fract(multiplyAddValue15 * comparisonValue26);
                        float multiplyAddValue18 = (productValue22 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue9.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue19 = (productValue23 <= 0.083333335816860198974609375) ? (-fma(scalarValue17, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue20 = (productValue22 >= 0.916666686534881591796875) ? (fma(scalarValue18, 2.0, -1.0) + multiplyAddValue18) : multiplyAddValue18;
                        float multiplyAddValue21 = (productValue23 >= 0.916666686534881591796875) ? (fma(scalarValue19, 2.0, -1.0) + multiplyAddValue19) : multiplyAddValue19;
                        bool comparisonValue27 = abs(multiplyAddValue20) >= 0.004999999888241291046142578125;
                        bool comparisonValue28 = abs(multiplyAddValue21) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue29 = vec3(comparisonValue27 ? multiplyAddValue20 : 0.0, comparisonValue28 ? multiplyAddValue21 : 0.0, 0.25);
                        float scalarValue28 = rdDot3Precise(comparisonValue29, comparisonValue29);
                        float inverseLengthValue2 = inversesqrt(scalarValue28);
                        intermediateValue56 = (conditionValue4 && comparisonValue28) ? (sumValue18 * (inverseLengthValue2 * multiplyAddValue21)) : 0.0;
                        intermediateValue58 = (conditionValue4 && comparisonValue27) ? (sumValue18 * (inverseLengthValue2 * multiplyAddValue20)) : 0.0;
                        intermediateValue60 = conditionValue4 ? (inverseLengthValue2 * 0.25) : 1.0;
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
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits10 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue4 * 16u) + 15u]);
            float intermediateValue32;
            float intermediateValue33;
            float intermediateValue34;
            if ((reinterpretedBits9 & 8u) == 8u)
            {
                float sumValue29 = spvNClamp(2.0 - spvNMin(reinterpretedBits10, reinterpretedBits10 - scalarValue58), 0.0, 1.0);
                float productValue12;
                float productValue13;
                float productValue14;
                if (sumValue29 > 0.0)
                {
                    float multiplyAddValue34 = fma(varyingTexCoord0.x, scalarValue53, scalarValue55);
                    float multiplyAddValue35 = fma(varyingTexCoord0.y, scalarValue54, scalarValue56);
                    bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture1)) > 0u;
                    uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture1, int(0u)));
                    uint scalarValue11 = sampledTextureValue7.x;
                    float comparisonValue3 = rdEvaluateFloatExpression2(sampledTextureValue6 ? scalarValue11 : 0u);
                    float comparisonValue6 = rdEvaluateFloatExpression2(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                    float productValue58 = fract(multiplyAddValue34 * comparisonValue3);
                    float productValue59 = fract(multiplyAddValue35 * comparisonValue6);
                    vec4 sampledTextureValue35 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue58 - 0.5) < 0.0625) ? (multiplyAddValue34 + ((productValue58 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue34, (abs(productValue59 - 0.5) < 0.0625) ? (multiplyAddValue35 + ((productValue59 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue35));
                    float scalarValue59 = sampledTextureValue35.x;
                    float scalarValue60 = sampledTextureValue35.y;
                    float scalarValue61 = sampledTextureValue35.z;
                    float scalarValue62 = sampledTextureValue35.w;
                    float multiplyAddValue36 = fract(fma(multiplyAddValue34, comparisonValue3, 0.5));
                    float multiplyAddValue37 = fract(fma(multiplyAddValue35, comparisonValue6, 0.5));
                    bool conditionValue12 = multiplyAddValue37 > 0.5;
                    bool conditionValue13 = multiplyAddValue36 > 0.5;
                    float comparisonValue42 = conditionValue12 ? scalarValue59 : scalarValue62;
                    float comparisonValue43 = conditionValue12 ? scalarValue60 : scalarValue61;
                    float comparisonValue44 = conditionValue13 ? scalarValue61 : scalarValue62;
                    float comparisonValue45 = conditionValue13 ? scalarValue60 : scalarValue59;
                    float sumValue30 = multiplyAddValue36 - 0.083333335816860198974609375;
                    float sumValue31 = multiplyAddValue36 + 0.083333335816860198974609375;
                    float sumValue32 = multiplyAddValue37 - 0.083333335816860198974609375;
                    float sumValue33 = multiplyAddValue37 + 0.083333335816860198974609375;
                    uint sumValue34 = uint(int(spvNClamp(sumValue30 + sumValue30, 0.0, 1.0)));
                    uint sumValue35 = uint(int(spvNClamp(sumValue31 + sumValue31, 0.0, 1.0)));
                    uint sumValue36 = uint(int(spvNClamp(sumValue32 + sumValue32, 0.0, 1.0)));
                    uint sumValue37 = uint(int(spvNClamp(sumValue33 + sumValue33, 0.0, 1.0)));
                    float comparisonValue46 = ((sumValue34 == 1u) ? comparisonValue43 : ((sumValue34 == 0u) ? comparisonValue42 : 0.0)) - ((sumValue35 == 1u) ? comparisonValue43 : ((sumValue35 == 0u) ? comparisonValue42 : 0.0));
                    float comparisonValue47 = ((sumValue36 == 1u) ? comparisonValue45 : ((sumValue36 == 0u) ? comparisonValue44 : 0.0)) - ((sumValue37 == 1u) ? comparisonValue45 : ((sumValue37 == 0u) ? comparisonValue44 : 0.0));
                    vec3 vectorValue6 = vec3(comparisonValue46, comparisonValue47, 0.25);
                    float scalarValue63 = rdDot3Precise(vectorValue6, vectorValue6);
                    float inverseLengthValue14 = inversesqrt(scalarValue63);
                    productValue12 = sumValue29 * (inverseLengthValue14 * comparisonValue47);
                    productValue13 = sumValue29 * (inverseLengthValue14 * comparisonValue46);
                    productValue14 = inverseLengthValue14 * 0.25;
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
                if ((reinterpretedBits9 & 16u) == 16u)
                {
                    float multiplyAddValue38 = fma(varyingTexCoord0.x, scalarValue53, scalarValue55);
                    float multiplyAddValue39 = fma(varyingTexCoord0.y, scalarValue54, scalarValue56);
                    float sumValue38 = spvNMin(reinterpretedBits10, reinterpretedBits10 - scalarValue58);
                    vec4 sampledTextureValue36 = textureLod(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue38, multiplyAddValue39), 0.0);
                    float scalarValue64 = sampledTextureValue36.x;
                    float scalarValue65 = sampledTextureValue36.y;
                    float scalarValue66 = sampledTextureValue36.z;
                    float intermediateValue54;
                    float intermediateValue56;
                    float intermediateValue58;
                    if ((scalarValue65 == scalarValue64) && (scalarValue66 == scalarValue65))
                    {
                        float scalarValue67 = spvNClamp(2.0 - sumValue38, 0.0, 1.0);
                        float productValue19;
                        float productValue20;
                        float productValue21;
                        if (scalarValue67 > 0.0)
                        {
                            bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture1)) > 0u;
                            uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture1, int(0u)));
                            uint scalarValue21 = sampledTextureValue11.x;
                            float comparisonValue17 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue21 : 0u);
                            float comparisonValue18 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                            float productValue60 = fract(multiplyAddValue38 * comparisonValue17);
                            float productValue61 = fract(multiplyAddValue39 * comparisonValue18);
                            vec4 sampledTextureValue37 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue60 - 0.5) < 0.0625) ? (multiplyAddValue38 + ((productValue60 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue38, (abs(productValue61 - 0.5) < 0.0625) ? (multiplyAddValue39 + ((productValue61 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue39));
                            float scalarValue68 = sampledTextureValue37.x;
                            float scalarValue69 = sampledTextureValue37.y;
                            float scalarValue70 = sampledTextureValue37.z;
                            float scalarValue71 = sampledTextureValue37.w;
                            float multiplyAddValue40 = fract(fma(multiplyAddValue38, comparisonValue17, 0.5));
                            float multiplyAddValue41 = fract(fma(multiplyAddValue39, comparisonValue18, 0.5));
                            bool conditionValue14 = multiplyAddValue41 > 0.5;
                            bool conditionValue15 = multiplyAddValue40 > 0.5;
                            float comparisonValue48 = conditionValue14 ? scalarValue68 : scalarValue71;
                            float comparisonValue49 = conditionValue14 ? scalarValue69 : scalarValue70;
                            float comparisonValue50 = conditionValue15 ? scalarValue70 : scalarValue71;
                            float comparisonValue51 = conditionValue15 ? scalarValue69 : scalarValue68;
                            float sumValue39 = multiplyAddValue40 - 0.083333335816860198974609375;
                            float sumValue40 = multiplyAddValue40 + 0.083333335816860198974609375;
                            float sumValue41 = multiplyAddValue41 - 0.083333335816860198974609375;
                            float sumValue42 = multiplyAddValue41 + 0.083333335816860198974609375;
                            uint sumValue43 = uint(int(spvNClamp(sumValue39 + sumValue39, 0.0, 1.0)));
                            uint sumValue44 = uint(int(spvNClamp(sumValue40 + sumValue40, 0.0, 1.0)));
                            uint sumValue45 = uint(int(spvNClamp(sumValue41 + sumValue41, 0.0, 1.0)));
                            uint sumValue46 = uint(int(spvNClamp(sumValue42 + sumValue42, 0.0, 1.0)));
                            float comparisonValue52 = ((sumValue43 == 1u) ? comparisonValue49 : ((sumValue43 == 0u) ? comparisonValue48 : 0.0)) - ((sumValue44 == 1u) ? comparisonValue49 : ((sumValue44 == 0u) ? comparisonValue48 : 0.0));
                            float comparisonValue53 = ((sumValue45 == 1u) ? comparisonValue51 : ((sumValue45 == 0u) ? comparisonValue50 : 0.0)) - ((sumValue46 == 1u) ? comparisonValue51 : ((sumValue46 == 0u) ? comparisonValue50 : 0.0));
                            vec3 vectorValue7 = vec3(comparisonValue52, comparisonValue53, 0.25);
                            float scalarValue72 = rdDot3Precise(vectorValue7, vectorValue7);
                            float inverseLengthValue15 = inversesqrt(scalarValue72);
                            productValue19 = scalarValue67 * (inverseLengthValue15 * comparisonValue53);
                            productValue20 = scalarValue67 * (inverseLengthValue15 * comparisonValue52);
                            productValue21 = inverseLengthValue15 * 0.25;
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
                        bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture1)) > 0u;
                        uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture1, int(0u)));
                        uint scalarValue27 = sampledTextureValue14.x;
                        float comparisonValue25 = rdEvaluateFloatExpression2(sampledTextureValue13 ? scalarValue27 : 0u);
                        float comparisonValue26 = rdEvaluateFloatExpression2(sampledTextureValue13 ? sampledTextureValue14.y : 0u);
                        float sumValue47 = spvNClamp(2.0 - sumValue38, 0.0, 1.0);
                        bool conditionValue16 = sumValue47 > 0.0;
                        float productValue62 = fract(multiplyAddValue38 * comparisonValue25);
                        float productValue63 = fract(multiplyAddValue39 * comparisonValue26);
                        float multiplyAddValue42 = (productValue62 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue36.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue43 = (productValue63 <= 0.083333335816860198974609375) ? (-fma(scalarValue64, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue44 = (productValue62 >= 0.916666686534881591796875) ? (fma(scalarValue65, 2.0, -1.0) + multiplyAddValue42) : multiplyAddValue42;
                        float multiplyAddValue45 = (productValue63 >= 0.916666686534881591796875) ? (fma(scalarValue66, 2.0, -1.0) + multiplyAddValue43) : multiplyAddValue43;
                        bool comparisonValue54 = abs(multiplyAddValue44) >= 0.004999999888241291046142578125;
                        bool comparisonValue55 = abs(multiplyAddValue45) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue56 = vec3(comparisonValue54 ? multiplyAddValue44 : 0.0, comparisonValue55 ? multiplyAddValue45 : 0.0, 0.25);
                        float scalarValue73 = rdDot3Precise(comparisonValue56, comparisonValue56);
                        float inverseLengthValue16 = inversesqrt(scalarValue73);
                        intermediateValue54 = (conditionValue16 && comparisonValue55) ? (sumValue47 * (inverseLengthValue16 * multiplyAddValue45)) : 0.0;
                        intermediateValue56 = (conditionValue16 && comparisonValue54) ? (sumValue47 * (inverseLengthValue16 * multiplyAddValue44)) : 0.0;
                        intermediateValue58 = conditionValue16 ? (inverseLengthValue16 * 0.25) : 1.0;
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
            vec4 sampledTextureValue31 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue17, sampledTextureValue19), fma(varyingTexCoord0.y, sampledTextureValue18, sampledTextureValue20)));
            intermediateValue18 = (sampledTextureValue31.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue31.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue31.z * 2.0) + (-1.0);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue31 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue17, sampledTextureValue19), fma(varyingTexCoord0.y, sampledTextureValue18, sampledTextureValue20)));
            intermediateValue14 = (sampledTextureValue31.x * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue31.y * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue31.z * 2.0) + (-1.0);
#endif
        }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue22;
        float intermediateValue24;
        float intermediateValue26;
        float comparisonValue1;
        if ((reinterpretedBits3 & 1u) == 1u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue20;
        float intermediateValue22;
        float intermediateValue24;
        float comparisonValue;
        if ((reinterpretedBits9 & 1u) == 1u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue25;
        float intermediateValue27;
        float intermediateValue29;
        float comparisonValue1;
        if ((reinterpretedBits3 & 1u) == 1u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue23;
        float intermediateValue25;
        float intermediateValue27;
        float comparisonValue;
        if ((reinterpretedBits9 & 1u) == 1u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue1;
        float sampledTextureValue2;
        float sampledTextureValue3;
        float intermediateValue11;
        if ((scalarValue37 & 1u) == 0u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue2;
        float sampledTextureValue3;
        float sampledTextureValue4;
        float intermediateValue7;
        if ((scalarValue37 & 1u) == 0u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float intermediateValue11;
        float sampledTextureValue1;
        float sampledTextureValue2;
        float sampledTextureValue3;
        if ((scalarValue37 & 1u) == 0u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float intermediateValue7;
        float sampledTextureValue2;
        float sampledTextureValue3;
        float sampledTextureValue4;
        if ((scalarValue37 & 1u) == 0u)
#endif
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 reinterpretedBits5 = uintBitsToFloat(intermediateValue3.packedValues[scalarValue4 * 4u]);
            vec4 sampledTextureValue15 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord0.x, reinterpretedBits5.x, reinterpretedBits5.z), fma(varyingTexCoord0.y, reinterpretedBits5.y, reinterpretedBits5.w)));
            comparisonValue1 = ((reinterpretedBits3 & 2u) == 2u) ? sampledTextureValue15.w : scalarValue9;
            intermediateValue26 = sampledTextureValue15.x;
            intermediateValue24 = sampledTextureValue15.z;
            intermediateValue22 = sampledTextureValue15.y;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 reinterpretedBits11 = uintBitsToFloat(intermediateValue4.packedValues[scalarValue4 * 4u]);
            vec4 sampledTextureValue38 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord0.x, reinterpretedBits11.x, reinterpretedBits11.z), fma(varyingTexCoord0.y, reinterpretedBits11.y, reinterpretedBits11.w)));
            comparisonValue = ((reinterpretedBits9 & 2u) == 2u) ? sampledTextureValue38.w : scalarValue57;
            intermediateValue24 = sampledTextureValue38.x;
            intermediateValue22 = sampledTextureValue38.z;
            intermediateValue20 = sampledTextureValue38.y;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 reinterpretedBits5 = uintBitsToFloat(intermediateValue3.packedValues[scalarValue4 * 4u]);
            vec4 sampledTextureValue15 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord0.x, reinterpretedBits5.x, reinterpretedBits5.z), fma(varyingTexCoord0.y, reinterpretedBits5.y, reinterpretedBits5.w)));
            comparisonValue1 = ((reinterpretedBits3 & 2u) == 2u) ? sampledTextureValue15.w : scalarValue9;
            intermediateValue29 = sampledTextureValue15.x;
            intermediateValue27 = sampledTextureValue15.z;
            intermediateValue25 = sampledTextureValue15.y;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 reinterpretedBits11 = uintBitsToFloat(intermediateValue4.packedValues[scalarValue4 * 4u]);
            vec4 sampledTextureValue38 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord0.x, reinterpretedBits11.x, reinterpretedBits11.z), fma(varyingTexCoord0.y, reinterpretedBits11.y, reinterpretedBits11.w)));
            comparisonValue = ((reinterpretedBits9 & 2u) == 2u) ? sampledTextureValue38.w : scalarValue57;
            intermediateValue27 = sampledTextureValue38.x;
            intermediateValue25 = sampledTextureValue38.z;
            intermediateValue23 = sampledTextureValue38.y;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 10u)).x);
            sampledTextureValue1 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 11u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 9u)).x);
            intermediateValue11 = sampledTextureValue22;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue4 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 10u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 11u)).x);
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 9u)).x);
            intermediateValue7 = sampledTextureValue22;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue1 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 10u)).x);
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 11u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 9u)).x);
            intermediateValue11 = sampledTextureValue22;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 10u)).x);
            sampledTextureValue4 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 11u)).x);
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 9u)).x);
            intermediateValue7 = sampledTextureValue22;
#endif
        }
        else
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue1 = scalarValue9;
            intermediateValue26 = reinterpretedBits1.w;
            intermediateValue24 = reinterpretedBits1.y;
            intermediateValue22 = reinterpretedBits1.z;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue = scalarValue57;
            intermediateValue24 = reinterpretedBits7.w;
            intermediateValue22 = reinterpretedBits7.y;
            intermediateValue20 = reinterpretedBits7.z;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue1 = scalarValue9;
            intermediateValue29 = reinterpretedBits1.w;
            intermediateValue27 = reinterpretedBits1.y;
            intermediateValue25 = reinterpretedBits1.z;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue = scalarValue57;
            intermediateValue27 = reinterpretedBits7.w;
            intermediateValue25 = reinterpretedBits7.y;
            intermediateValue23 = reinterpretedBits7.z;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue32 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue4 * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 3u)).x))));
            sampledTextureValue3 = sampledTextureValue32.y;
            sampledTextureValue1 = sampledTextureValue32.x;
            sampledTextureValue2 = sampledTextureValue32.z;
            intermediateValue11 = ((scalarValue37 & 2u) != 0u) ? sampledTextureValue32.w : sampledTextureValue22;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue32 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue4 * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 3u)).x))));
            sampledTextureValue4 = sampledTextureValue32.y;
            sampledTextureValue2 = sampledTextureValue32.x;
            sampledTextureValue3 = sampledTextureValue32.z;
            intermediateValue7 = ((scalarValue37 & 2u) != 0u) ? sampledTextureValue32.w : sampledTextureValue22;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue32 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue4 * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 3u)).x))));
            sampledTextureValue1 = sampledTextureValue32.y;
            sampledTextureValue3 = sampledTextureValue32.x;
            sampledTextureValue2 = sampledTextureValue32.z;
            intermediateValue11 = ((scalarValue37 & 2u) != 0u) ? sampledTextureValue32.w : sampledTextureValue22;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue32 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue4 * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 3u)).x))));
            sampledTextureValue2 = sampledTextureValue32.y;
            sampledTextureValue4 = sampledTextureValue32.x;
            sampledTextureValue3 = sampledTextureValue32.z;
            intermediateValue7 = ((scalarValue37 & 2u) != 0u) ? sampledTextureValue32.w : sampledTextureValue22;
#endif
        }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue30 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue31 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue32 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue29 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue3 = inversesqrt(scalarValue29);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue30 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue30);
        vec3 vectorValue4 = vec3(comparisonValue30, comparisonValue31, comparisonValue32);
        float scalarValue31 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue31);
        intermediateValue21 = intermediateValue22;
        intermediateValue23 = intermediateValue24;
        multiplyAddValue = fma(inverseLengthValue5 * comparisonValue32, multiplyAddValue9, fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue4 * varyingBitangent0.z)));
        multiplyAddValue1 = fma(inverseLengthValue5 * comparisonValue31, multiplyAddValue9, fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue4 * varyingBitangent0.y)));
        multiplyAddValue2 = fma(inverseLengthValue5 * comparisonValue30, multiplyAddValue9, fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue4 * varyingBitangent0.x)));
        intermediateValue25 = intermediateValue26;
        intermediateValue27 = comparisonValue1;
    }
    else
    {
        intermediateValue21 = 0.0;
        intermediateValue23 = 1.0;
        multiplyAddValue = 0.0;
        multiplyAddValue1 = 1.0;
        multiplyAddValue2 = 0.0;
        intermediateValue25 = 0.0;
        intermediateValue27 = 0.0;
    }
    float sumValue19 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    float sumValue20 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    float sumValue21 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    fragmentColor1.w = (intermediateValue27 < intermediateValue25) ? fma(intermediateValue25, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue27, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(multiplyAddValue2, multiplyAddValue1, multiplyAddValue);
    float scalarValue32 = rdDot3Precise(vectorValue5, vectorValue5);
    float inverseLengthValue6 = inversesqrt(scalarValue32);
    float productValue24 = inverseLengthValue6 * multiplyAddValue2;
    float productValue25 = inverseLengthValue6 * multiplyAddValue1;
    float productValue26 = inverseLengthValue6 * multiplyAddValue;
    float quotientValue = 1.0 / (abs(productValue26) + (abs(productValue25) + abs(productValue24)));
    float productValue27 = quotientValue * productValue24;
    float productValue28 = quotientValue * productValue25;
    bool conditionValue5 = productValue26 < 0.0;
    float sumValue22 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? ((1.0 - abs(productValue28)) * ((productValue27 >= 0.0) ? sumValue22 : (-1.0))) : productValue27;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue27)) * ((productValue28 >= 0.0) ? sumValue22 : (-1.0))) : productValue28;
    float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    float multiplyAddValue23 = fma(fragmentScalarConstants1.packedValues[27u], sumValue21, fma(fragmentScalarConstants1.packedValues[19u], sumValue19, sumValue20 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue22, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue21, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue19, sumValue20 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue23, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue22, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue21, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue19, sumValue20 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue23, 0.5, 0.5);
    bool bitwiseValue = (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05);
    float productValue29 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue33 = (bitwiseValue ? spvNMin(productValue29, 1.0) : varyingTexCoord5.x) * 0.16666667163372039794921875;
    float multiplyAddValue24 = (bitwiseValue ? spvNMin(fma(fma(productValue29, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue29, 1.0) : varyingTexCoord5.y) * 0.16666667163372039794921875;
    float multiplyAddValue25 = (bitwiseValue ? spvNMin(fma(productValue29 * productValue29, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue29, 1.0) : varyingTexCoord5.z) * 0.16666667163372039794921875;
    float productValue30 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue24, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue25, comparisonValue33)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue24 / productValue30, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue33 / productValue30, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue25 / productValue30, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue30, 0.0, 1.0) * 255.0);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue30 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue31 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue32 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue29 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue3 = inversesqrt(scalarValue29);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue30 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue30);
        vec3 vectorValue4 = vec3(comparisonValue30, comparisonValue31, comparisonValue32);
        float scalarValue31 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue31);
        intermediateValue19 = intermediateValue20;
        intermediateValue21 = intermediateValue22;
        multiplyAddValue = fma(inverseLengthValue5 * comparisonValue32, multiplyAddValue9, fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue4 * varyingBitangent0.z)));
        multiplyAddValue1 = fma(inverseLengthValue5 * comparisonValue31, multiplyAddValue9, fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue4 * varyingBitangent0.y)));
        multiplyAddValue2 = fma(inverseLengthValue5 * comparisonValue30, multiplyAddValue9, fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue4 * varyingBitangent0.x)));
        intermediateValue23 = intermediateValue24;
        intermediateValue25 = comparisonValue;
    }
    else
    {
        intermediateValue19 = 0.0;
        intermediateValue21 = 1.0;
        multiplyAddValue = 0.0;
        multiplyAddValue1 = 1.0;
        multiplyAddValue2 = 0.0;
        intermediateValue23 = 0.0;
        intermediateValue25 = 0.0;
    }
    float sumValue19 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    float sumValue20 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    float sumValue21 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    fragmentColor1.w = (intermediateValue25 < intermediateValue23) ? fma(intermediateValue23, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue25, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(multiplyAddValue2, multiplyAddValue1, multiplyAddValue);
    float scalarValue32 = rdDot3Precise(vectorValue5, vectorValue5);
    float inverseLengthValue6 = inversesqrt(scalarValue32);
    float productValue24 = inverseLengthValue6 * multiplyAddValue2;
    float productValue25 = inverseLengthValue6 * multiplyAddValue1;
    float productValue26 = inverseLengthValue6 * multiplyAddValue;
    float quotientValue = 1.0 / (abs(productValue26) + (abs(productValue25) + abs(productValue24)));
    float productValue27 = quotientValue * productValue24;
    float productValue28 = quotientValue * productValue25;
    bool conditionValue5 = productValue26 < 0.0;
    float sumValue22 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? ((1.0 - abs(productValue28)) * ((productValue27 >= 0.0) ? sumValue22 : (-1.0))) : productValue27;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue27)) * ((productValue28 >= 0.0) ? sumValue22 : (-1.0))) : productValue28;
    float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    float multiplyAddValue23 = fma(fragmentScalarConstants1.packedValues[27u], sumValue21, fma(fragmentScalarConstants1.packedValues[19u], sumValue19, sumValue20 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue22, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue21, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue19, sumValue20 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue23, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue22, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue21, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue19, sumValue20 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue23, 0.5, 0.5);
    bool bitwiseValue = (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05);
    float productValue29 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue33 = (bitwiseValue ? spvNMin(productValue29, 1.0) : varyingTexCoord5.x) * 0.16666667163372039794921875;
    float multiplyAddValue24 = (bitwiseValue ? spvNMin(fma(fma(productValue29, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue29, 1.0) : varyingTexCoord5.y) * 0.16666667163372039794921875;
    float multiplyAddValue25 = (bitwiseValue ? spvNMin(fma(productValue29 * productValue29, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue29, 1.0) : varyingTexCoord5.z) * 0.16666667163372039794921875;
    float productValue30 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue24, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue25, comparisonValue33)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue24 / productValue30, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue33 / productValue30, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue25 / productValue30, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue30, 0.0, 1.0) * 255.0);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue30 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue31 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue32 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue29 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue3 = inversesqrt(scalarValue29);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue30 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue30);
        vec3 vectorValue4 = vec3(comparisonValue30, comparisonValue31, comparisonValue32);
        float scalarValue31 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue31);
        intermediateValue24 = intermediateValue25;
        intermediateValue26 = intermediateValue27;
        multiplyAddValue2 = fma(inverseLengthValue5 * comparisonValue32, multiplyAddValue11, fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue4 * varyingBitangent0.z)));
        multiplyAddValue3 = fma(inverseLengthValue5 * comparisonValue31, multiplyAddValue11, fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue4 * varyingBitangent0.y)));
        multiplyAddValue4 = fma(inverseLengthValue5 * comparisonValue30, multiplyAddValue11, fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue4 * varyingBitangent0.x)));
        intermediateValue28 = intermediateValue29;
        intermediateValue30 = comparisonValue1;
    }
    else
    {
        intermediateValue24 = 0.0;
        intermediateValue26 = 1.0;
        multiplyAddValue2 = 0.0;
        multiplyAddValue3 = 1.0;
        multiplyAddValue4 = 0.0;
        intermediateValue28 = 0.0;
        intermediateValue30 = 0.0;
    }
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float reinterpretedBits22 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits21.x);
    float reinterpretedBits23 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits21.y);
    float reinterpretedBits24 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits21.z);
    fragmentColor1.w = (intermediateValue30 < intermediateValue28) ? fma(intermediateValue28, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue30, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue9 = vec3(multiplyAddValue4, multiplyAddValue3, multiplyAddValue2);
    float scalarValue76 = rdDot3Precise(vectorValue9, vectorValue9);
    float inverseLengthValue20 = inversesqrt(scalarValue76);
    float productValue75 = inverseLengthValue20 * multiplyAddValue4;
    float productValue76 = inverseLengthValue20 * multiplyAddValue3;
    float productValue77 = inverseLengthValue20 * multiplyAddValue2;
    float quotientValue3 = 1.0 / (abs(productValue77) + (abs(productValue76) + abs(productValue75)));
    float productValue78 = quotientValue3 * productValue75;
    float productValue79 = quotientValue3 * productValue76;
    bool conditionValue18 = productValue77 < 0.0;
    float sumValue22 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue18 ? ((1.0 - abs(productValue79)) * ((productValue78 >= 0.0) ? sumValue22 : (-1.0))) : productValue78;
    fragmentColor2.y = conditionValue18 ? ((1.0 - abs(productValue78)) * ((productValue79 >= 0.0) ? sumValue22 : (-1.0))) : productValue79;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[5u]);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[6u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float multiplyAddValue48 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[27u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[23u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[31u]));
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue49 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), reinterpretedBits24, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u])), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits27.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits26.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits25.x))) + uintBitsToFloat(reinterpretedBits28.x)) / multiplyAddValue48, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits31.x), reinterpretedBits24, fma(uintBitsToFloat(reinterpretedBits30.x), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(reinterpretedBits29.x))) + uintBitsToFloat(reinterpretedBits32.x)) / multiplyAddValue49, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits27.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits26.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits25.y))) + uintBitsToFloat(reinterpretedBits28.y)) / multiplyAddValue48, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits31.y), reinterpretedBits24, fma(uintBitsToFloat(reinterpretedBits30.y), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(reinterpretedBits29.y))) + uintBitsToFloat(reinterpretedBits32.y)) / multiplyAddValue49, 0.5, 0.5);
    bool bitwiseValue = (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05);
    float productValue29 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue33 = (bitwiseValue ? spvNMin(productValue29, 1.0) : varyingTexCoord5.x) * 0.16666667163372039794921875;
    float multiplyAddValue24 = (bitwiseValue ? spvNMin(fma(fma(productValue29, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue29, 1.0) : varyingTexCoord5.y) * 0.16666667163372039794921875;
    float multiplyAddValue25 = (bitwiseValue ? spvNMin(fma(productValue29 * productValue29, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue29, 1.0) : varyingTexCoord5.z) * 0.16666667163372039794921875;
    float productValue30 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue24, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue25, comparisonValue33)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue24 / productValue30, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue33 / productValue30, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue25 / productValue30, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue30, 0.0, 1.0) * 255.0);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue30 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue31 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue32 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue29 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue3 = inversesqrt(scalarValue29);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue30 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue4 = inversesqrt(scalarValue30);
        vec3 vectorValue4 = vec3(comparisonValue30, comparisonValue31, comparisonValue32);
        float scalarValue31 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue5 = inversesqrt(scalarValue31);
        intermediateValue22 = intermediateValue23;
        intermediateValue24 = intermediateValue25;
        multiplyAddValue2 = fma(inverseLengthValue5 * comparisonValue32, multiplyAddValue11, fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue4 * varyingBitangent0.z)));
        multiplyAddValue3 = fma(inverseLengthValue5 * comparisonValue31, multiplyAddValue11, fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue4 * varyingBitangent0.y)));
        multiplyAddValue4 = fma(inverseLengthValue5 * comparisonValue30, multiplyAddValue11, fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue10, multiplyAddValue9 * (inverseLengthValue4 * varyingBitangent0.x)));
        intermediateValue26 = intermediateValue27;
        intermediateValue28 = comparisonValue;
    }
    else
    {
        intermediateValue22 = 0.0;
        intermediateValue24 = 1.0;
        multiplyAddValue2 = 0.0;
        multiplyAddValue3 = 1.0;
        multiplyAddValue4 = 0.0;
        intermediateValue26 = 0.0;
        intermediateValue28 = 0.0;
    }
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float reinterpretedBits22 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits21.x);
    float reinterpretedBits23 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits21.y);
    float reinterpretedBits24 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits21.z);
    fragmentColor1.w = (intermediateValue28 < intermediateValue26) ? fma(intermediateValue26, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue28, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue9 = vec3(multiplyAddValue4, multiplyAddValue3, multiplyAddValue2);
    float scalarValue76 = rdDot3Precise(vectorValue9, vectorValue9);
    float inverseLengthValue20 = inversesqrt(scalarValue76);
    float productValue75 = inverseLengthValue20 * multiplyAddValue4;
    float productValue76 = inverseLengthValue20 * multiplyAddValue3;
    float productValue77 = inverseLengthValue20 * multiplyAddValue2;
    float quotientValue3 = 1.0 / (abs(productValue77) + (abs(productValue76) + abs(productValue75)));
    float productValue78 = quotientValue3 * productValue75;
    float productValue79 = quotientValue3 * productValue76;
    bool conditionValue18 = productValue77 < 0.0;
    float sumValue22 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue18 ? ((1.0 - abs(productValue79)) * ((productValue78 >= 0.0) ? sumValue22 : (-1.0))) : productValue78;
    fragmentColor2.y = conditionValue18 ? ((1.0 - abs(productValue78)) * ((productValue79 >= 0.0) ? sumValue22 : (-1.0))) : productValue79;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[5u]);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[6u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float multiplyAddValue48 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[27u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[23u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[31u]));
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue49 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), reinterpretedBits24, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u])), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits27.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits26.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits25.x))) + uintBitsToFloat(reinterpretedBits28.x)) / multiplyAddValue48, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits31.x), reinterpretedBits24, fma(uintBitsToFloat(reinterpretedBits30.x), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(reinterpretedBits29.x))) + uintBitsToFloat(reinterpretedBits32.x)) / multiplyAddValue49, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits27.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits26.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits25.y))) + uintBitsToFloat(reinterpretedBits28.y)) / multiplyAddValue48, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits31.y), reinterpretedBits24, fma(uintBitsToFloat(reinterpretedBits30.y), reinterpretedBits22, reinterpretedBits23 * uintBitsToFloat(reinterpretedBits29.y))) + uintBitsToFloat(reinterpretedBits32.y)) / multiplyAddValue49, 0.5, 0.5);
    bool bitwiseValue = (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05);
    float productValue29 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue33 = (bitwiseValue ? spvNMin(productValue29, 1.0) : varyingTexCoord5.x) * 0.16666667163372039794921875;
    float multiplyAddValue24 = (bitwiseValue ? spvNMin(fma(fma(productValue29, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue29, 1.0) : varyingTexCoord5.y) * 0.16666667163372039794921875;
    float multiplyAddValue25 = (bitwiseValue ? spvNMin(fma(productValue29 * productValue29, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue29, 1.0) : varyingTexCoord5.z) * 0.16666667163372039794921875;
    float productValue30 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue24, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue25, comparisonValue33)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue24 / productValue30, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue33 / productValue30, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue25 / productValue30, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue30, 0.0, 1.0) * 255.0);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue39 = comparisonValue34 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue40 = comparisonValue34 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue41 = comparisonValue34 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue10 = inversesqrt(dot(vec3(comparisonValue39, comparisonValue40, comparisonValue41), vec3(comparisonValue39, comparisonValue40, comparisonValue41)));
        float inverseLengthValue11 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue12 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        intermediateValue7 = sampledTextureValue1;
        intermediateValue8 = sampledTextureValue2;
        intermediateValue9 = sampledTextureValue3;
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = fma(inverseLengthValue10 * comparisonValue39, intermediateValue20, fma(inverseLengthValue11 * varyingBitangent0.x, intermediateValue19, inverseLengthValue12 * varyingTangent0.x));
        intermediateValue13 = fma(inverseLengthValue10 * comparisonValue40, intermediateValue20, fma(inverseLengthValue11 * varyingBitangent0.y, intermediateValue19, inverseLengthValue12 * varyingTangent0.y));
        intermediateValue14 = fma(inverseLengthValue10 * comparisonValue41, intermediateValue20, fma(inverseLengthValue11 * varyingBitangent0.z, intermediateValue19, inverseLengthValue12 * varyingTangent0.z));
    }
    float sumValue19 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    float sumValue20 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    float sumValue21 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float inverseLengthValue13 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue49 = inverseLengthValue13 * intermediateValue12;
    float productValue50 = inverseLengthValue13 * intermediateValue13;
    float productValue51 = inverseLengthValue13 * intermediateValue14;
    float quotientValue1 = 1.0 / ((abs(productValue50) + abs(productValue49)) + abs(productValue51));
    float productValue52 = quotientValue1 * productValue49;
    float productValue53 = quotientValue1 * productValue50;
    bool conditionValue11 = productValue51 < 0.0;
    float multiplyAddValue32 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue33 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue21, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float intermediateValue17;
    float productValue12;
    float productValue13;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue29 = varyingTexCoord1.x * varyingTexCoord1.x;
        intermediateValue17 = spvNClamp(productValue29, 0.0, 1.0);
        productValue12 = spvNClamp(((productValue29 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue29, 0.0, 1.0);
        productValue13 = spvNClamp((((productValue29 * productValue29) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue29, 0.0, 1.0);
    }
    else
    {
        intermediateValue17 = varyingTexCoord5.x;
        productValue12 = varyingTexCoord5.y;
        productValue13 = varyingTexCoord5.z;
    }
    float productValue54 = intermediateValue17 * 0.16666667163372039794921875;
    float productValue55 = productValue12 * 0.16666667163372039794921875;
    float productValue56 = productValue13 * 0.16666667163372039794921875;
    float productValue57 = ceil(spvNClamp(spvNMax(spvNMax(productValue54, productValue56), spvNMax(productValue55, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue54 / productValue57, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue55 / productValue57, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue56 / productValue57, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue57, 0.0, 1.0) * 255.0) & 255u);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue39 = comparisonValue34 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue40 = comparisonValue34 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue41 = comparisonValue34 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue10 = inversesqrt(dot(vec3(comparisonValue39, comparisonValue40, comparisonValue41), vec3(comparisonValue39, comparisonValue40, comparisonValue41)));
        float inverseLengthValue11 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue17 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue14;
        intermediateValue3 = sampledTextureValue2;
        intermediateValue4 = sampledTextureValue3;
        intermediateValue5 = sampledTextureValue4;
        intermediateValue6 = intermediateValue7;
        intermediateValue8 = fma(inverseLengthValue10 * comparisonValue39, intermediateValue16, fma(inverseLengthValue11 * varyingBitangent0.x, intermediateValue15, inverseLengthValue17 * varyingTangent0.x));
        intermediateValue9 = fma(inverseLengthValue10 * comparisonValue40, intermediateValue16, fma(inverseLengthValue11 * varyingBitangent0.y, intermediateValue15, inverseLengthValue17 * varyingTangent0.y));
        intermediateValue10 = fma(inverseLengthValue10 * comparisonValue41, intermediateValue16, fma(inverseLengthValue11 * varyingBitangent0.z, intermediateValue15, inverseLengthValue17 * varyingTangent0.z));
    }
    float sumValue19 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    float sumValue20 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    float sumValue21 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float inverseLengthValue18 = inversesqrt(dot(vec3(intermediateValue8, intermediateValue9, intermediateValue10), vec3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue64 = inverseLengthValue18 * intermediateValue8;
    float productValue65 = inverseLengthValue18 * intermediateValue9;
    float productValue66 = inverseLengthValue18 * intermediateValue10;
    float quotientValue2 = 1.0 / ((abs(productValue65) + abs(productValue64)) + abs(productValue66));
    float productValue67 = quotientValue2 * productValue64;
    float productValue68 = quotientValue2 * productValue65;
    bool conditionValue17 = productValue66 < 0.0;
    float multiplyAddValue32 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue33 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue21, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float intermediateValue13;
    float productValue6;
    float productValue7;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue29 = varyingTexCoord1.x * varyingTexCoord1.x;
        intermediateValue13 = spvNClamp(productValue29, 0.0, 1.0);
        productValue6 = spvNClamp(((productValue29 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue29, 0.0, 1.0);
        productValue7 = spvNClamp((((productValue29 * productValue29) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue29, 0.0, 1.0);
    }
    else
    {
        intermediateValue13 = varyingTexCoord5.x;
        productValue6 = varyingTexCoord5.y;
        productValue7 = varyingTexCoord5.z;
    }
    float productValue69 = intermediateValue13 * 0.16666667163372039794921875;
    float productValue70 = productValue6 * 0.16666667163372039794921875;
    float productValue71 = productValue7 * 0.16666667163372039794921875;
    float productValue72 = ceil(spvNClamp(spvNMax(spvNMax(productValue69, productValue71), spvNMax(productValue70, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue69 / productValue72, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue70 / productValue72, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue71 / productValue72, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue72, 0.0, 1.0) * 255.0) & 255u);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue39 = comparisonValue34 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue40 = comparisonValue34 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue41 = comparisonValue34 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue10 = inversesqrt(dot(vec3(comparisonValue39, comparisonValue40, comparisonValue41), vec3(comparisonValue39, comparisonValue40, comparisonValue41)));
        float inverseLengthValue11 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue12 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        multiplyAddValue = fma(inverseLengthValue10 * comparisonValue39, intermediateValue20, fma(inverseLengthValue11 * varyingBitangent0.x, intermediateValue19, inverseLengthValue12 * varyingTangent0.x));
        intermediateValue8 = fma(inverseLengthValue10 * comparisonValue40, intermediateValue20, fma(inverseLengthValue11 * varyingBitangent0.y, intermediateValue19, inverseLengthValue12 * varyingTangent0.y));
        intermediateValue9 = fma(inverseLengthValue10 * comparisonValue41, intermediateValue20, fma(inverseLengthValue11 * varyingBitangent0.z, intermediateValue19, inverseLengthValue12 * varyingTangent0.z));
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = sampledTextureValue1;
        intermediateValue13 = sampledTextureValue2;
        intermediateValue14 = sampledTextureValue3;
    }
    float sumValue48 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue49 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue50 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue22 = inversesqrt(dot(vec3(multiplyAddValue, intermediateValue8, intermediateValue9), vec3(multiplyAddValue, intermediateValue8, intermediateValue9)));
    float productValue82 = inverseLengthValue22 * multiplyAddValue;
    float productValue83 = inverseLengthValue22 * intermediateValue8;
    float productValue84 = inverseLengthValue22 * intermediateValue9;
    float quotientValue6 = 1.0 / ((abs(productValue83) + abs(productValue82)) + abs(productValue84));
    float productValue85 = quotientValue6 * productValue82;
    float productValue86 = quotientValue6 * productValue83;
    bool conditionValue19 = productValue84 < 0.0;
    float multiplyAddValue50 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue51 = fma(fragmentVectorConstants1.packedValues[10u].w, sumValue50, fma(fragmentVectorConstants1.packedValues[9u].w, sumValue49, sumValue48 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
    float intermediateValue17;
    float productValue14;
    float productValue15;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue29 = varyingTexCoord1.x * varyingTexCoord1.x;
        intermediateValue17 = spvNClamp(productValue29, 0.0, 1.0);
        productValue14 = spvNClamp(((productValue29 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue29, 0.0, 1.0);
        productValue15 = spvNClamp((((productValue29 * productValue29) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue29, 0.0, 1.0);
    }
    else
    {
        intermediateValue17 = varyingTexCoord5.x;
        productValue14 = varyingTexCoord5.y;
        productValue15 = varyingTexCoord5.z;
    }
    float productValue54 = intermediateValue17 * 0.16666667163372039794921875;
    float productValue87 = productValue14 * 0.16666667163372039794921875;
    float productValue88 = productValue15 * 0.16666667163372039794921875;
    float productValue89 = ceil(spvNClamp(spvNMax(spvNMax(productValue54, productValue88), spvNMax(productValue87, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue54 / productValue89, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue87 / productValue89, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue88 / productValue89, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue89, 0.0, 1.0) * 255.0) & 255u);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue39 = comparisonValue34 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue40 = comparisonValue34 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue41 = comparisonValue34 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue10 = inversesqrt(dot(vec3(comparisonValue39, comparisonValue40, comparisonValue41), vec3(comparisonValue39, comparisonValue40, comparisonValue41)));
        float inverseLengthValue11 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue17 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue14;
        multiplyAddValue = fma(inverseLengthValue10 * comparisonValue39, intermediateValue16, fma(inverseLengthValue11 * varyingBitangent0.x, intermediateValue15, inverseLengthValue17 * varyingTangent0.x));
        intermediateValue4 = fma(inverseLengthValue10 * comparisonValue40, intermediateValue16, fma(inverseLengthValue11 * varyingBitangent0.y, intermediateValue15, inverseLengthValue17 * varyingTangent0.y));
        intermediateValue5 = fma(inverseLengthValue10 * comparisonValue41, intermediateValue16, fma(inverseLengthValue11 * varyingBitangent0.z, intermediateValue15, inverseLengthValue17 * varyingTangent0.z));
        intermediateValue6 = intermediateValue7;
        intermediateValue8 = sampledTextureValue2;
        intermediateValue9 = sampledTextureValue3;
        intermediateValue10 = sampledTextureValue4;
    }
    float sumValue48 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[12u].x;
    float sumValue49 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[12u].y;
    float sumValue50 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[12u].z;
    float inverseLengthValue23 = inversesqrt(dot(vec3(multiplyAddValue, intermediateValue4, intermediateValue5), vec3(multiplyAddValue, intermediateValue4, intermediateValue5)));
    float productValue90 = inverseLengthValue23 * multiplyAddValue;
    float productValue91 = inverseLengthValue23 * intermediateValue4;
    float productValue92 = inverseLengthValue23 * intermediateValue5;
    float quotientValue7 = 1.0 / ((abs(productValue91) + abs(productValue90)) + abs(productValue92));
    float productValue93 = quotientValue7 * productValue90;
    float productValue94 = quotientValue7 * productValue91;
    bool conditionValue20 = productValue92 < 0.0;
    float multiplyAddValue50 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue51 = fma(fragmentVectorConstants1.packedValues[10u].w, sumValue50, fma(fragmentVectorConstants1.packedValues[9u].w, sumValue49, sumValue48 * fragmentVectorConstants1.packedValues[8u].w)) + fragmentVectorConstants1.packedValues[11u].w;
    float intermediateValue13;
    float productValue8;
    float productValue9;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue29 = varyingTexCoord1.x * varyingTexCoord1.x;
        intermediateValue13 = spvNClamp(productValue29, 0.0, 1.0);
        productValue8 = spvNClamp(((productValue29 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue29, 0.0, 1.0);
        productValue9 = spvNClamp((((productValue29 * productValue29) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue29, 0.0, 1.0);
    }
    else
    {
        intermediateValue13 = varyingTexCoord5.x;
        productValue8 = varyingTexCoord5.y;
        productValue9 = varyingTexCoord5.z;
    }
    float productValue69 = intermediateValue13 * 0.16666667163372039794921875;
    float productValue95 = productValue8 * 0.16666667163372039794921875;
    float productValue96 = productValue9 * 0.16666667163372039794921875;
    float productValue97 = ceil(spvNClamp(spvNMax(spvNMax(productValue69, productValue96), spvNMax(productValue95, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue69 / productValue97, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue95 / productValue97, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue96 / productValue97, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue97, 0.0, 1.0) * 255.0) & 255u);
#endif
    fragmentColor0.w = uint(spvNClamp(varyingTexCoord1.y, 0.0, 1.0) * 255.0);
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = uint(spvNClamp(intermediateValue19, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue26, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor1.x = productValue3;
    fragmentColor1.y = productValue4;
    fragmentColor1.z = productValue5;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue11 ? (((productValue52 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue53))) : productValue52;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue52)) * ((productValue53 < 0.0) ? (-1.0) : 1.0)) : productValue53;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue32) - ((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue21, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue33)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue32) - ((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue21, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue33)) * 0.5;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor1.x = (sampledTextureValue16.x * varyingColor0.w) * ((((sampledTextureValue39.x * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.y = (sampledTextureValue16.y * varyingColor0.w) * ((((sampledTextureValue39.y * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.z = (sampledTextureValue16.z * varyingColor0.w) * ((((sampledTextureValue39.z * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue17 ? (((productValue67 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue68))) : productValue67;
    fragmentColor2.y = conditionValue17 ? ((1.0 - abs(productValue67)) * ((productValue68 < 0.0) ? (-1.0) : 1.0)) : productValue68;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue32) - ((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue21, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue33)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue32) - ((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue21, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue33)) * 0.5;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor1.x = productValue5;
    fragmentColor1.y = productValue6;
    fragmentColor1.z = productValue7;
    fragmentColor1.w = (intermediateValue14 > intermediateValue10) ? ((intermediateValue14 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue19 ? (((productValue85 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue86))) : productValue85;
    fragmentColor2.y = conditionValue19 ? ((1.0 - abs(productValue85)) * ((productValue86 < 0.0) ? (-1.0) : 1.0)) : productValue86;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue50) - ((fma(fragmentVectorConstants1.packedValues[10u].x, sumValue50, fma(fragmentVectorConstants1.packedValues[9u].x, sumValue49, sumValue48 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue51)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue50) - ((fma(fragmentVectorConstants1.packedValues[10u].y, sumValue50, fma(fragmentVectorConstants1.packedValues[9u].y, sumValue49, sumValue48 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue51)) * 0.5;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor1.x = (sampledTextureValue16.x * varyingColor0.w) * ((((sampledTextureValue39.x * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.y = (sampledTextureValue16.y * varyingColor0.w) * ((((sampledTextureValue39.y * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.z = (sampledTextureValue16.z * varyingColor0.w) * ((((sampledTextureValue39.z * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.w = (intermediateValue10 > intermediateValue6) ? ((intermediateValue10 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue20 ? (((productValue93 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue94))) : productValue93;
    fragmentColor2.y = conditionValue20 ? ((1.0 - abs(productValue93)) * ((productValue94 < 0.0) ? (-1.0) : 1.0)) : productValue94;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue50) - ((fma(fragmentVectorConstants1.packedValues[10u].x, sumValue50, fma(fragmentVectorConstants1.packedValues[9u].x, sumValue49, sumValue48 * fragmentVectorConstants1.packedValues[8u].x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue51)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue50) - ((fma(fragmentVectorConstants1.packedValues[10u].y, sumValue50, fma(fragmentVectorConstants1.packedValues[9u].y, sumValue49, sumValue48 * fragmentVectorConstants1.packedValues[8u].y)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue51)) * 0.5;
#endif
    discardIfRequested();
}
