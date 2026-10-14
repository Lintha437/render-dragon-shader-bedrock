#version 460
#extension GL_GOOGLE_include_directive : require
// Entity / AlphaTestMultiColor / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 48
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE0
#define RD_OPTION_SOURCE_INPUT_TYPE0 RD_SOURCE_INPUT_TYPE0_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE1
#define RD_OPTION_SOURCE_INPUT_TYPE1 RD_SOURCE_INPUT_TYPE1_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE2
#define RD_OPTION_SOURCE_INPUT_TYPE2 RD_SOURCE_INPUT_TYPE2_SAMPLED
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 20
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/Entity/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    if ((fragmentScalarConstants1.packedValues[4u] >= fragmentScalarConstants1.packedValues[11u]) && (fragmentScalarConstants1.packedValues[15u] <= 0.0))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue3.w;
    if ((fragmentScalarConstants1.packedValues[4u] >= fragmentScalarConstants1.packedValues[11u]) && (scalarValue15 <= 0.0))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue20 = sampledTextureValue3.x;
    float scalarValue21 = sampledTextureValue3.y;
    float scalarValue22 = sampledTextureValue3.z;
    float scalarValue15 = sampledTextureValue3.w;
    if ((fragmentScalarConstants1.packedValues[4u] >= fragmentScalarConstants1.packedValues[11u]) && (scalarValue15 <= 0.0))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    if ((fragmentScalarConstants1.packedValues[4u] >= fragmentScalarConstants1.packedValues[11u]) && (fragmentScalarConstants1.packedValues[11u] <= 0.0))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue5.x;
    float scalarValue29 = sampledTextureValue5.y;
    float scalarValue30 = sampledTextureValue5.z;
    float scalarValue31 = sampledTextureValue5.w;
    if ((fragmentScalarConstants1.packedValues[4u] >= scalarValue31) && (fragmentScalarConstants1.packedValues[11u] <= 0.0))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue5.x;
    float scalarValue29 = sampledTextureValue5.y;
    float scalarValue30 = sampledTextureValue5.z;
    float scalarValue31 = sampledTextureValue5.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue3.w;
    if ((fragmentScalarConstants1.packedValues[4u] >= scalarValue31) && (scalarValue15 <= 0.0))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue5.x;
    float scalarValue29 = sampledTextureValue5.y;
    float scalarValue30 = sampledTextureValue5.z;
    float scalarValue31 = sampledTextureValue5.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue20 = sampledTextureValue3.x;
    float scalarValue21 = sampledTextureValue3.y;
    float scalarValue22 = sampledTextureValue3.z;
    float scalarValue15 = sampledTextureValue3.w;
    if ((fragmentScalarConstants1.packedValues[4u] >= scalarValue31) && (scalarValue15 <= 0.0))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue5.x;
    float scalarValue29 = sampledTextureValue5.y;
    float scalarValue30 = sampledTextureValue5.z;
    float scalarValue31 = sampledTextureValue5.w;
    if ((fragmentScalarConstants1.packedValues[4u] >= scalarValue31) && (scalarValue31 <= 0.0))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = ((fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[3u].w) + fragmentVectorConstants1.packedValues[2u].x;
    float productValue1 = ((fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[3u].w) + fragmentVectorConstants1.packedValues[2u].y;
    float productValue2 = ((fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[3u].w) + fragmentVectorConstants1.packedValues[2u].z;
    if ((fragmentVectorConstants1.packedValues[3u].w <= 0.0) && (fragmentVectorConstants1.packedValues[2u].w <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue12 = (fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[3u].w;
    float productValue13 = (fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[3u].w;
    float productValue14 = (fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[3u].w;
    if ((fragmentVectorConstants1.packedValues[3u].w <= 0.0) && (fragmentVectorConstants1.packedValues[2u].w <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = ((fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[3u].w) + fragmentVectorConstants1.packedValues[2u].x;
    float productValue1 = ((fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[3u].w) + fragmentVectorConstants1.packedValues[2u].y;
    float productValue2 = ((fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[3u].w) + fragmentVectorConstants1.packedValues[2u].z;
    if ((fragmentVectorConstants1.packedValues[3u].w <= 0.0) && (fragmentVectorConstants1.packedValues[2u].w <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue2.w;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue30 = ((sampledTextureValue2.x - fragmentVectorConstants1.packedValues[2u].x) * scalarValue13) + fragmentVectorConstants1.packedValues[2u].x;
    float productValue31 = ((sampledTextureValue2.y - fragmentVectorConstants1.packedValues[2u].y) * scalarValue13) + fragmentVectorConstants1.packedValues[2u].y;
    float productValue32 = ((sampledTextureValue2.z - fragmentVectorConstants1.packedValues[2u].z) * scalarValue13) + fragmentVectorConstants1.packedValues[2u].z;
    if ((scalarValue13 <= 0.0) && (fragmentVectorConstants1.packedValues[2u].w <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue2.w;
    float productValue42 = (sampledTextureValue2.x - fragmentVectorConstants1.packedValues[2u].x) * scalarValue13;
    float productValue43 = (sampledTextureValue2.y - fragmentVectorConstants1.packedValues[2u].y) * scalarValue13;
    float productValue44 = (sampledTextureValue2.z - fragmentVectorConstants1.packedValues[2u].z) * scalarValue13;
    if ((scalarValue13 <= 0.0) && (fragmentVectorConstants1.packedValues[2u].w <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue2.x;
    float scalarValue17 = sampledTextureValue2.y;
    float scalarValue18 = sampledTextureValue2.z;
    float scalarValue13 = sampledTextureValue2.w;
    float productValue54 = ((scalarValue16 - fragmentVectorConstants1.packedValues[2u].x) * scalarValue13) + fragmentVectorConstants1.packedValues[2u].x;
    float productValue55 = ((scalarValue17 - fragmentVectorConstants1.packedValues[2u].y) * scalarValue13) + fragmentVectorConstants1.packedValues[2u].y;
    float productValue56 = ((scalarValue18 - fragmentVectorConstants1.packedValues[2u].z) * scalarValue13) + fragmentVectorConstants1.packedValues[2u].z;
    if ((scalarValue13 <= 0.0) && (fragmentVectorConstants1.packedValues[2u].w <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if ((fragmentVectorConstants1.packedValues[2u].w <= 0.0) && (fragmentVectorConstants1.packedValues[2u].w <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((fragmentVectorConstants1.packedValues[2u].w <= 0.0) && (fragmentVectorConstants1.packedValues[2u].w <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue4.x;
    float scalarValue25 = sampledTextureValue4.y;
    float scalarValue26 = sampledTextureValue4.z;
    float scalarValue27 = sampledTextureValue4.w;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue85 = ((fragmentVectorConstants1.packedValues[2u].x - scalarValue24) * fragmentVectorConstants1.packedValues[2u].w) + scalarValue24;
    float productValue86 = ((fragmentVectorConstants1.packedValues[2u].y - scalarValue25) * fragmentVectorConstants1.packedValues[2u].w) + scalarValue25;
    float productValue87 = ((fragmentVectorConstants1.packedValues[2u].z - scalarValue26) * fragmentVectorConstants1.packedValues[2u].w) + scalarValue26;
    if ((fragmentVectorConstants1.packedValues[2u].w <= 0.0) && (scalarValue27 <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue4.x;
    float scalarValue25 = sampledTextureValue4.y;
    float scalarValue26 = sampledTextureValue4.z;
    float scalarValue27 = sampledTextureValue4.w;
    float productValue100 = (fragmentVectorConstants1.packedValues[2u].x - scalarValue24) * fragmentVectorConstants1.packedValues[2u].w;
    float productValue101 = (fragmentVectorConstants1.packedValues[2u].y - scalarValue25) * fragmentVectorConstants1.packedValues[2u].w;
    float productValue102 = (fragmentVectorConstants1.packedValues[2u].z - scalarValue26) * fragmentVectorConstants1.packedValues[2u].w;
    if ((fragmentVectorConstants1.packedValues[2u].w <= 0.0) && (scalarValue27 <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue4.x;
    float scalarValue25 = sampledTextureValue4.y;
    float scalarValue26 = sampledTextureValue4.z;
    float scalarValue27 = sampledTextureValue4.w;
    float productValue85 = ((fragmentVectorConstants1.packedValues[2u].x - scalarValue24) * fragmentVectorConstants1.packedValues[2u].w) + scalarValue24;
    float productValue86 = ((fragmentVectorConstants1.packedValues[2u].y - scalarValue25) * fragmentVectorConstants1.packedValues[2u].w) + scalarValue25;
    float productValue87 = ((fragmentVectorConstants1.packedValues[2u].z - scalarValue26) * fragmentVectorConstants1.packedValues[2u].w) + scalarValue26;
    if ((fragmentVectorConstants1.packedValues[2u].w <= 0.0) && (scalarValue27 <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue4.x;
    float scalarValue25 = sampledTextureValue4.y;
    float scalarValue26 = sampledTextureValue4.z;
    float scalarValue27 = sampledTextureValue4.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue2.w;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue118 = ((sampledTextureValue2.x - scalarValue24) * scalarValue13) + scalarValue24;
    float productValue119 = ((sampledTextureValue2.y - scalarValue25) * scalarValue13) + scalarValue25;
    float productValue120 = ((sampledTextureValue2.z - scalarValue26) * scalarValue13) + scalarValue26;
    if ((scalarValue13 <= 0.0) && (scalarValue27 <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue4.x;
    float scalarValue25 = sampledTextureValue4.y;
    float scalarValue26 = sampledTextureValue4.z;
    float scalarValue27 = sampledTextureValue4.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue2.w;
    float productValue130 = (sampledTextureValue2.x - scalarValue24) * scalarValue13;
    float productValue131 = (sampledTextureValue2.y - scalarValue25) * scalarValue13;
    float productValue132 = (sampledTextureValue2.z - scalarValue26) * scalarValue13;
    if ((scalarValue13 <= 0.0) && (scalarValue27 <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue4.x;
    float scalarValue25 = sampledTextureValue4.y;
    float scalarValue26 = sampledTextureValue4.z;
    float scalarValue27 = sampledTextureValue4.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue2.x;
    float scalarValue17 = sampledTextureValue2.y;
    float scalarValue18 = sampledTextureValue2.z;
    float scalarValue13 = sampledTextureValue2.w;
    float productValue142 = ((scalarValue16 - scalarValue24) * scalarValue13) + scalarValue24;
    float productValue143 = ((scalarValue17 - scalarValue25) * scalarValue13) + scalarValue25;
    float productValue144 = ((scalarValue18 - scalarValue26) * scalarValue13) + scalarValue26;
    if ((scalarValue13 <= 0.0) && (scalarValue27 <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue4.x;
    float scalarValue25 = sampledTextureValue4.y;
    float scalarValue26 = sampledTextureValue4.z;
    float scalarValue27 = sampledTextureValue4.w;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if ((scalarValue27 <= 0.0) && (scalarValue27 <= fragmentVectorConstants1.packedValues[1u].x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue24 = sampledTextureValue4.x;
    float scalarValue25 = sampledTextureValue4.y;
    float scalarValue26 = sampledTextureValue4.z;
    float scalarValue27 = sampledTextureValue4.w;
    if ((scalarValue27 <= 0.0) && (scalarValue27 <= fragmentVectorConstants1.packedValues[1u].x))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    precise float sumValue = fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[2u].x;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[2u].y;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[2u].z;
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[15u], sumValue, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[15u], sumValue1, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[15u], sumValue2, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue9 = ceil(scalarValue8);
    precise float multiplyAddValue12 = fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[4u].x, -scalarValue5), scalarValue5) - multiplyAddValue9;
    precise float multiplyAddValue13 = fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[4u].y, -scalarValue6), scalarValue6) - multiplyAddValue10;
    precise float multiplyAddValue14 = fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[4u].z, -scalarValue7), scalarValue7) - multiplyAddValue11;
    float multiplyAddValue15 = fma(scalarValue9, multiplyAddValue12, multiplyAddValue9);
    float multiplyAddValue16 = fma(scalarValue9, multiplyAddValue13, multiplyAddValue10);
    float multiplyAddValue17 = fma(scalarValue9, multiplyAddValue14, multiplyAddValue11);
    precise float sumValue3 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue15;
    precise float sumValue4 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue16;
    precise float sumValue5 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue17;
    float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[3u], sumValue3, multiplyAddValue15);
    float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[3u], sumValue4, multiplyAddValue16);
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[3u], sumValue5, multiplyAddValue17);
    precise float productValue9 = multiplyAddValue18 * varyingColor3.x;
    precise float productValue10 = multiplyAddValue19 * varyingColor3.y;
    precise float productValue11 = multiplyAddValue20 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue18, varyingColor3.x, varyingColor2.x), productValue9);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue19, varyingColor3.y, varyingColor2.y), productValue10);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue20, varyingColor3.z, varyingColor2.z), productValue11);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[2u].x;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[2u].y;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[2u].z;
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[15u], sumValue, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[15u], sumValue1, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[15u], sumValue2, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue11 = ceil(fragmentScalarConstants1.packedValues[11u]);
    precise float multiplyAddValue21 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[4u].x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x) - multiplyAddValue9;
    precise float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[4u].y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y) - multiplyAddValue10;
    precise float multiplyAddValue23 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[4u].z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z) - multiplyAddValue11;
    float multiplyAddValue24 = fma(scalarValue11, multiplyAddValue21, multiplyAddValue9);
    float multiplyAddValue25 = fma(scalarValue11, multiplyAddValue22, multiplyAddValue10);
    float multiplyAddValue26 = fma(scalarValue11, multiplyAddValue23, multiplyAddValue11);
    precise float sumValue6 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue24;
    precise float sumValue7 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue25;
    precise float sumValue8 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue26;
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[3u], sumValue6, multiplyAddValue24);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[3u], sumValue7, multiplyAddValue25);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[3u], sumValue8, multiplyAddValue26);
    precise float productValue21 = multiplyAddValue27 * varyingColor3.x;
    precise float productValue22 = multiplyAddValue28 * varyingColor3.y;
    precise float productValue23 = multiplyAddValue29 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue27, varyingColor3.x, varyingColor2.x), productValue21);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue28, varyingColor3.y, varyingColor2.y), productValue22);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue29, varyingColor3.z, varyingColor2.z), productValue23);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[2u].x;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[2u].y;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[2u].z;
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[15u], sumValue, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[15u], sumValue1, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[15u], sumValue2, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue14 = ceil(fragmentScalarConstants1.packedValues[15u]);
    precise float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[15u], fma(fragmentVectorConstants1.packedValues[3u].x, fragmentVectorConstants1.packedValues[4u].x, -fragmentVectorConstants1.packedValues[3u].x), fragmentVectorConstants1.packedValues[3u].x) - multiplyAddValue9;
    precise float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[15u], fma(fragmentVectorConstants1.packedValues[3u].y, fragmentVectorConstants1.packedValues[4u].y, -fragmentVectorConstants1.packedValues[3u].y), fragmentVectorConstants1.packedValues[3u].y) - multiplyAddValue10;
    precise float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[15u], fma(fragmentVectorConstants1.packedValues[3u].z, fragmentVectorConstants1.packedValues[4u].z, -fragmentVectorConstants1.packedValues[3u].z), fragmentVectorConstants1.packedValues[3u].z) - multiplyAddValue11;
    float multiplyAddValue45 = fma(scalarValue14, multiplyAddValue42, multiplyAddValue9);
    float multiplyAddValue46 = fma(scalarValue14, multiplyAddValue43, multiplyAddValue10);
    float multiplyAddValue47 = fma(scalarValue14, multiplyAddValue44, multiplyAddValue11);
    precise float sumValue9 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue45;
    precise float sumValue10 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue46;
    precise float sumValue11 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue47;
    float multiplyAddValue48 = fma(fragmentScalarConstants1.packedValues[3u], sumValue9, multiplyAddValue45);
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[3u], sumValue10, multiplyAddValue46);
    float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[3u], sumValue11, multiplyAddValue47);
    precise float productValue39 = multiplyAddValue48 * varyingColor3.x;
    precise float productValue40 = multiplyAddValue49 * varyingColor3.y;
    precise float productValue41 = multiplyAddValue50 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue48, varyingColor3.x, varyingColor2.x), productValue39);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue49, varyingColor3.y, varyingColor2.y), productValue40);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue50, varyingColor3.z, varyingColor2.z), productValue41);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    precise float sumValue12 = sampledTextureValue3.x - fragmentVectorConstants1.packedValues[2u].x;
    precise float sumValue13 = sampledTextureValue3.y - fragmentVectorConstants1.packedValues[2u].y;
    precise float sumValue14 = sampledTextureValue3.z - fragmentVectorConstants1.packedValues[2u].z;
    float multiplyAddValue60 = fma(scalarValue15, sumValue12, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue61 = fma(scalarValue15, sumValue13, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue62 = fma(scalarValue15, sumValue14, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue9 = ceil(scalarValue8);
    precise float multiplyAddValue63 = fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[3u].x, -scalarValue5), scalarValue5) - multiplyAddValue60;
    precise float multiplyAddValue64 = fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[3u].y, -scalarValue6), scalarValue6) - multiplyAddValue61;
    precise float multiplyAddValue65 = fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[3u].z, -scalarValue7), scalarValue7) - multiplyAddValue62;
    float multiplyAddValue66 = fma(scalarValue9, multiplyAddValue63, multiplyAddValue60);
    float multiplyAddValue67 = fma(scalarValue9, multiplyAddValue64, multiplyAddValue61);
    float multiplyAddValue68 = fma(scalarValue9, multiplyAddValue65, multiplyAddValue62);
    precise float sumValue15 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue66;
    precise float sumValue16 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue67;
    precise float sumValue17 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue68;
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[3u], sumValue15, multiplyAddValue66);
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[3u], sumValue16, multiplyAddValue67);
    float multiplyAddValue71 = fma(fragmentScalarConstants1.packedValues[3u], sumValue17, multiplyAddValue68);
    precise float productValue51 = multiplyAddValue69 * varyingColor3.x;
    precise float productValue52 = multiplyAddValue70 * varyingColor3.y;
    precise float productValue53 = multiplyAddValue71 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue69, varyingColor3.x, varyingColor2.x), productValue51);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue70, varyingColor3.y, varyingColor2.y), productValue52);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue71, varyingColor3.z, varyingColor2.z), productValue53);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue12 = sampledTextureValue3.x - fragmentVectorConstants1.packedValues[2u].x;
    precise float sumValue13 = sampledTextureValue3.y - fragmentVectorConstants1.packedValues[2u].y;
    precise float sumValue14 = sampledTextureValue3.z - fragmentVectorConstants1.packedValues[2u].z;
    float multiplyAddValue60 = fma(scalarValue15, sumValue12, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue61 = fma(scalarValue15, sumValue13, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue62 = fma(scalarValue15, sumValue14, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue11 = ceil(fragmentScalarConstants1.packedValues[11u]);
    precise float multiplyAddValue78 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[3u].x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x) - multiplyAddValue60;
    precise float multiplyAddValue79 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[3u].y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y) - multiplyAddValue61;
    precise float multiplyAddValue80 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z) - multiplyAddValue62;
    float multiplyAddValue81 = fma(scalarValue11, multiplyAddValue78, multiplyAddValue60);
    float multiplyAddValue82 = fma(scalarValue11, multiplyAddValue79, multiplyAddValue61);
    float multiplyAddValue83 = fma(scalarValue11, multiplyAddValue80, multiplyAddValue62);
    precise float sumValue18 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue81;
    precise float sumValue19 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue82;
    precise float sumValue20 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue83;
    float multiplyAddValue84 = fma(fragmentScalarConstants1.packedValues[3u], sumValue18, multiplyAddValue81);
    float multiplyAddValue85 = fma(fragmentScalarConstants1.packedValues[3u], sumValue19, multiplyAddValue82);
    float multiplyAddValue86 = fma(fragmentScalarConstants1.packedValues[3u], sumValue20, multiplyAddValue83);
    precise float productValue63 = multiplyAddValue84 * varyingColor3.x;
    precise float productValue64 = multiplyAddValue85 * varyingColor3.y;
    precise float productValue65 = multiplyAddValue86 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue84, varyingColor3.x, varyingColor2.x), productValue63);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue85, varyingColor3.y, varyingColor2.y), productValue64);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue86, varyingColor3.z, varyingColor2.z), productValue65);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue21 = scalarValue20 - fragmentVectorConstants1.packedValues[2u].x;
    precise float sumValue22 = scalarValue21 - fragmentVectorConstants1.packedValues[2u].y;
    precise float sumValue23 = scalarValue22 - fragmentVectorConstants1.packedValues[2u].z;
    float multiplyAddValue96 = fma(scalarValue15, sumValue21, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue97 = fma(scalarValue15, sumValue22, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue98 = fma(scalarValue15, sumValue23, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue23 = ceil(scalarValue15);
    precise float multiplyAddValue99 = fma(scalarValue15, fma(scalarValue20, fragmentVectorConstants1.packedValues[3u].x, -scalarValue20), scalarValue20) - multiplyAddValue96;
    precise float multiplyAddValue100 = fma(scalarValue15, fma(scalarValue21, fragmentVectorConstants1.packedValues[3u].y, -scalarValue21), scalarValue21) - multiplyAddValue97;
    precise float multiplyAddValue101 = fma(scalarValue15, fma(scalarValue22, fragmentVectorConstants1.packedValues[3u].z, -scalarValue22), scalarValue22) - multiplyAddValue98;
    float multiplyAddValue102 = fma(scalarValue23, multiplyAddValue99, multiplyAddValue96);
    float multiplyAddValue103 = fma(scalarValue23, multiplyAddValue100, multiplyAddValue97);
    float multiplyAddValue104 = fma(scalarValue23, multiplyAddValue101, multiplyAddValue98);
    precise float sumValue24 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue102;
    precise float sumValue25 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue103;
    precise float sumValue26 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue104;
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[3u], sumValue24, multiplyAddValue102);
    float multiplyAddValue106 = fma(fragmentScalarConstants1.packedValues[3u], sumValue25, multiplyAddValue103);
    float multiplyAddValue107 = fma(fragmentScalarConstants1.packedValues[3u], sumValue26, multiplyAddValue104);
    precise float productValue66 = multiplyAddValue105 * varyingColor3.x;
    precise float productValue67 = multiplyAddValue106 * varyingColor3.y;
    precise float productValue68 = multiplyAddValue107 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue105, varyingColor3.x, varyingColor2.x), productValue66);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue106, varyingColor3.y, varyingColor2.y), productValue67);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue107, varyingColor3.z, varyingColor2.z), productValue68);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float scalarValue9 = ceil(scalarValue8);
    precise float multiplyAddValue108 = fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[3u].x, -scalarValue5), scalarValue5) - fragmentVectorConstants1.packedValues[2u].x;
    precise float multiplyAddValue109 = fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[3u].y, -scalarValue6), scalarValue6) - fragmentVectorConstants1.packedValues[2u].y;
    precise float multiplyAddValue110 = fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[3u].z, -scalarValue7), scalarValue7) - fragmentVectorConstants1.packedValues[2u].z;
    float multiplyAddValue111 = fma(scalarValue9, multiplyAddValue108, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue112 = fma(scalarValue9, multiplyAddValue109, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue113 = fma(scalarValue9, multiplyAddValue110, fragmentVectorConstants1.packedValues[2u].z);
    precise float sumValue27 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue111;
    precise float sumValue28 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue112;
    precise float sumValue29 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue113;
    float multiplyAddValue114 = fma(fragmentScalarConstants1.packedValues[3u], sumValue27, multiplyAddValue111);
    float multiplyAddValue115 = fma(fragmentScalarConstants1.packedValues[3u], sumValue28, multiplyAddValue112);
    float multiplyAddValue116 = fma(fragmentScalarConstants1.packedValues[3u], sumValue29, multiplyAddValue113);
    precise float productValue82 = multiplyAddValue114 * varyingColor3.x;
    precise float productValue83 = multiplyAddValue115 * varyingColor3.y;
    precise float productValue84 = multiplyAddValue116 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue114, varyingColor3.x, varyingColor2.x), productValue82);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue115, varyingColor3.y, varyingColor2.y), productValue83);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue116, varyingColor3.z, varyingColor2.z), productValue84);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float multiplyAddValue129 = fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[3u].x, -fragmentVectorConstants1.packedValues[2u].x) * fragmentScalarConstants1.packedValues[11u];
    precise float multiplyAddValue130 = fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[3u].y, -fragmentVectorConstants1.packedValues[2u].y) * fragmentScalarConstants1.packedValues[11u];
    precise float multiplyAddValue131 = fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z, -fragmentVectorConstants1.packedValues[2u].z) * fragmentScalarConstants1.packedValues[11u];
    float scalarValue11 = ceil(fragmentScalarConstants1.packedValues[11u]);
    float multiplyAddValue132 = fma(scalarValue11, multiplyAddValue129, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue133 = fma(scalarValue11, multiplyAddValue130, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue134 = fma(scalarValue11, multiplyAddValue131, fragmentVectorConstants1.packedValues[2u].z);
    precise float sumValue30 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue132;
    precise float sumValue31 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue133;
    precise float sumValue32 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue134;
    float multiplyAddValue135 = fma(fragmentScalarConstants1.packedValues[3u], sumValue30, multiplyAddValue132);
    float multiplyAddValue136 = fma(fragmentScalarConstants1.packedValues[3u], sumValue31, multiplyAddValue133);
    float multiplyAddValue137 = fma(fragmentScalarConstants1.packedValues[3u], sumValue32, multiplyAddValue134);
    precise float productValue94 = multiplyAddValue135 * varyingColor3.x;
    precise float productValue95 = multiplyAddValue136 * varyingColor3.y;
    precise float productValue96 = multiplyAddValue137 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue135, varyingColor3.x, varyingColor2.x), productValue94);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue136, varyingColor3.y, varyingColor2.y), productValue95);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue137, varyingColor3.z, varyingColor2.z), productValue96);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    precise float sumValue33 = fragmentVectorConstants1.packedValues[2u].x - scalarValue28;
    precise float sumValue34 = fragmentVectorConstants1.packedValues[2u].y - scalarValue29;
    precise float sumValue35 = fragmentVectorConstants1.packedValues[2u].z - scalarValue30;
    float multiplyAddValue147 = fma(fragmentScalarConstants1.packedValues[11u], sumValue33, scalarValue28);
    float multiplyAddValue148 = fma(fragmentScalarConstants1.packedValues[11u], sumValue34, scalarValue29);
    float multiplyAddValue149 = fma(fragmentScalarConstants1.packedValues[11u], sumValue35, scalarValue30);
    float scalarValue9 = ceil(scalarValue8);
    precise float multiplyAddValue150 = fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[3u].x, -scalarValue5), scalarValue5) - multiplyAddValue147;
    precise float multiplyAddValue151 = fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[3u].y, -scalarValue6), scalarValue6) - multiplyAddValue148;
    precise float multiplyAddValue152 = fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[3u].z, -scalarValue7), scalarValue7) - multiplyAddValue149;
    float multiplyAddValue153 = fma(scalarValue9, multiplyAddValue150, multiplyAddValue147);
    float multiplyAddValue154 = fma(scalarValue9, multiplyAddValue151, multiplyAddValue148);
    float multiplyAddValue155 = fma(scalarValue9, multiplyAddValue152, multiplyAddValue149);
    precise float sumValue36 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue153;
    precise float sumValue37 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue154;
    precise float sumValue38 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue155;
    float multiplyAddValue156 = fma(fragmentScalarConstants1.packedValues[3u], sumValue36, multiplyAddValue153);
    float multiplyAddValue157 = fma(fragmentScalarConstants1.packedValues[3u], sumValue37, multiplyAddValue154);
    float multiplyAddValue158 = fma(fragmentScalarConstants1.packedValues[3u], sumValue38, multiplyAddValue155);
    precise float productValue97 = multiplyAddValue156 * varyingColor3.x;
    precise float productValue98 = multiplyAddValue157 * varyingColor3.y;
    precise float productValue99 = multiplyAddValue158 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue156, varyingColor3.x, varyingColor2.x), productValue97);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue157, varyingColor3.y, varyingColor2.y), productValue98);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue158, varyingColor3.z, varyingColor2.z), productValue99);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue33 = fragmentVectorConstants1.packedValues[2u].x - scalarValue28;
    precise float sumValue34 = fragmentVectorConstants1.packedValues[2u].y - scalarValue29;
    precise float sumValue35 = fragmentVectorConstants1.packedValues[2u].z - scalarValue30;
    float multiplyAddValue147 = fma(fragmentScalarConstants1.packedValues[11u], sumValue33, scalarValue28);
    float multiplyAddValue148 = fma(fragmentScalarConstants1.packedValues[11u], sumValue34, scalarValue29);
    float multiplyAddValue149 = fma(fragmentScalarConstants1.packedValues[11u], sumValue35, scalarValue30);
    float scalarValue33 = ceil(scalarValue31);
    precise float multiplyAddValue165 = fma(scalarValue31, fma(scalarValue28, fragmentVectorConstants1.packedValues[3u].x, -scalarValue28), scalarValue28) - multiplyAddValue147;
    precise float multiplyAddValue166 = fma(scalarValue31, fma(scalarValue29, fragmentVectorConstants1.packedValues[3u].y, -scalarValue29), scalarValue29) - multiplyAddValue148;
    precise float multiplyAddValue167 = fma(scalarValue31, fma(scalarValue30, fragmentVectorConstants1.packedValues[3u].z, -scalarValue30), scalarValue30) - multiplyAddValue149;
    float multiplyAddValue168 = fma(scalarValue33, multiplyAddValue165, multiplyAddValue147);
    float multiplyAddValue169 = fma(scalarValue33, multiplyAddValue166, multiplyAddValue148);
    float multiplyAddValue170 = fma(scalarValue33, multiplyAddValue167, multiplyAddValue149);
    precise float sumValue39 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue168;
    precise float sumValue40 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue169;
    precise float sumValue41 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue170;
    float multiplyAddValue171 = fma(fragmentScalarConstants1.packedValues[3u], sumValue39, multiplyAddValue168);
    float multiplyAddValue172 = fma(fragmentScalarConstants1.packedValues[3u], sumValue40, multiplyAddValue169);
    float multiplyAddValue173 = fma(fragmentScalarConstants1.packedValues[3u], sumValue41, multiplyAddValue170);
    precise float productValue109 = multiplyAddValue171 * varyingColor3.x;
    precise float productValue110 = multiplyAddValue172 * varyingColor3.y;
    precise float productValue111 = multiplyAddValue173 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue171, varyingColor3.x, varyingColor2.x), productValue109);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue172, varyingColor3.y, varyingColor2.y), productValue110);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue173, varyingColor3.z, varyingColor2.z), productValue111);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue33 = fragmentVectorConstants1.packedValues[2u].x - scalarValue28;
    precise float sumValue34 = fragmentVectorConstants1.packedValues[2u].y - scalarValue29;
    precise float sumValue35 = fragmentVectorConstants1.packedValues[2u].z - scalarValue30;
    float multiplyAddValue147 = fma(fragmentScalarConstants1.packedValues[11u], sumValue33, scalarValue28);
    float multiplyAddValue148 = fma(fragmentScalarConstants1.packedValues[11u], sumValue34, scalarValue29);
    float multiplyAddValue149 = fma(fragmentScalarConstants1.packedValues[11u], sumValue35, scalarValue30);
    float scalarValue11 = ceil(fragmentScalarConstants1.packedValues[11u]);
    precise float multiplyAddValue180 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[3u].x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x) - multiplyAddValue147;
    precise float multiplyAddValue181 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[3u].y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y) - multiplyAddValue148;
    precise float multiplyAddValue182 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z) - multiplyAddValue149;
    float multiplyAddValue183 = fma(scalarValue11, multiplyAddValue180, multiplyAddValue147);
    float multiplyAddValue184 = fma(scalarValue11, multiplyAddValue181, multiplyAddValue148);
    float multiplyAddValue185 = fma(scalarValue11, multiplyAddValue182, multiplyAddValue149);
    precise float sumValue42 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue183;
    precise float sumValue43 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue184;
    precise float sumValue44 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue185;
    float multiplyAddValue186 = fma(fragmentScalarConstants1.packedValues[3u], sumValue42, multiplyAddValue183);
    float multiplyAddValue187 = fma(fragmentScalarConstants1.packedValues[3u], sumValue43, multiplyAddValue184);
    float multiplyAddValue188 = fma(fragmentScalarConstants1.packedValues[3u], sumValue44, multiplyAddValue185);
    precise float productValue127 = multiplyAddValue186 * varyingColor3.x;
    precise float productValue128 = multiplyAddValue187 * varyingColor3.y;
    precise float productValue129 = multiplyAddValue188 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue186, varyingColor3.x, varyingColor2.x), productValue127);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue187, varyingColor3.y, varyingColor2.y), productValue128);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue188, varyingColor3.z, varyingColor2.z), productValue129);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    precise float sumValue45 = sampledTextureValue3.x - scalarValue28;
    precise float sumValue46 = sampledTextureValue3.y - scalarValue29;
    precise float sumValue47 = sampledTextureValue3.z - scalarValue30;
    float multiplyAddValue198 = fma(scalarValue15, sumValue45, scalarValue28);
    float multiplyAddValue199 = fma(scalarValue15, sumValue46, scalarValue29);
    float multiplyAddValue200 = fma(scalarValue15, sumValue47, scalarValue30);
    float scalarValue9 = ceil(scalarValue8);
    precise float multiplyAddValue201 = fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[2u].x, -scalarValue5), scalarValue5) - multiplyAddValue198;
    precise float multiplyAddValue202 = fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[2u].y, -scalarValue6), scalarValue6) - multiplyAddValue199;
    precise float multiplyAddValue203 = fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[2u].z, -scalarValue7), scalarValue7) - multiplyAddValue200;
    float multiplyAddValue204 = fma(scalarValue9, multiplyAddValue201, multiplyAddValue198);
    float multiplyAddValue205 = fma(scalarValue9, multiplyAddValue202, multiplyAddValue199);
    float multiplyAddValue206 = fma(scalarValue9, multiplyAddValue203, multiplyAddValue200);
    precise float sumValue48 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue204;
    precise float sumValue49 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue205;
    precise float sumValue50 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue206;
    float multiplyAddValue207 = fma(fragmentScalarConstants1.packedValues[3u], sumValue48, multiplyAddValue204);
    float multiplyAddValue208 = fma(fragmentScalarConstants1.packedValues[3u], sumValue49, multiplyAddValue205);
    float multiplyAddValue209 = fma(fragmentScalarConstants1.packedValues[3u], sumValue50, multiplyAddValue206);
    precise float productValue139 = multiplyAddValue207 * varyingColor3.x;
    precise float productValue140 = multiplyAddValue208 * varyingColor3.y;
    precise float productValue141 = multiplyAddValue209 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue207, varyingColor3.x, varyingColor2.x), productValue139);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue208, varyingColor3.y, varyingColor2.y), productValue140);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue209, varyingColor3.z, varyingColor2.z), productValue141);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue45 = sampledTextureValue3.x - scalarValue28;
    precise float sumValue46 = sampledTextureValue3.y - scalarValue29;
    precise float sumValue47 = sampledTextureValue3.z - scalarValue30;
    float multiplyAddValue198 = fma(scalarValue15, sumValue45, scalarValue28);
    float multiplyAddValue199 = fma(scalarValue15, sumValue46, scalarValue29);
    float multiplyAddValue200 = fma(scalarValue15, sumValue47, scalarValue30);
    float scalarValue33 = ceil(scalarValue31);
    precise float multiplyAddValue216 = fma(scalarValue31, fma(scalarValue28, fragmentVectorConstants1.packedValues[2u].x, -scalarValue28), scalarValue28) - multiplyAddValue198;
    precise float multiplyAddValue217 = fma(scalarValue31, fma(scalarValue29, fragmentVectorConstants1.packedValues[2u].y, -scalarValue29), scalarValue29) - multiplyAddValue199;
    precise float multiplyAddValue218 = fma(scalarValue31, fma(scalarValue30, fragmentVectorConstants1.packedValues[2u].z, -scalarValue30), scalarValue30) - multiplyAddValue200;
    float multiplyAddValue219 = fma(scalarValue33, multiplyAddValue216, multiplyAddValue198);
    float multiplyAddValue220 = fma(scalarValue33, multiplyAddValue217, multiplyAddValue199);
    float multiplyAddValue221 = fma(scalarValue33, multiplyAddValue218, multiplyAddValue200);
    precise float sumValue51 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue219;
    precise float sumValue52 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue220;
    precise float sumValue53 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue221;
    float multiplyAddValue222 = fma(fragmentScalarConstants1.packedValues[3u], sumValue51, multiplyAddValue219);
    float multiplyAddValue223 = fma(fragmentScalarConstants1.packedValues[3u], sumValue52, multiplyAddValue220);
    float multiplyAddValue224 = fma(fragmentScalarConstants1.packedValues[3u], sumValue53, multiplyAddValue221);
    precise float productValue151 = multiplyAddValue222 * varyingColor3.x;
    precise float productValue152 = multiplyAddValue223 * varyingColor3.y;
    precise float productValue153 = multiplyAddValue224 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue222, varyingColor3.x, varyingColor2.x), productValue151);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue223, varyingColor3.y, varyingColor2.y), productValue152);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue224, varyingColor3.z, varyingColor2.z), productValue153);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue54 = scalarValue20 - scalarValue28;
    precise float sumValue55 = scalarValue21 - scalarValue29;
    precise float sumValue56 = scalarValue22 - scalarValue30;
    float multiplyAddValue234 = fma(scalarValue15, sumValue54, scalarValue28);
    float multiplyAddValue235 = fma(scalarValue15, sumValue55, scalarValue29);
    float multiplyAddValue236 = fma(scalarValue15, sumValue56, scalarValue30);
    float scalarValue23 = ceil(scalarValue15);
    precise float multiplyAddValue237 = fma(scalarValue15, fma(scalarValue20, fragmentVectorConstants1.packedValues[2u].x, -scalarValue20), scalarValue20) - multiplyAddValue234;
    precise float multiplyAddValue238 = fma(scalarValue15, fma(scalarValue21, fragmentVectorConstants1.packedValues[2u].y, -scalarValue21), scalarValue21) - multiplyAddValue235;
    precise float multiplyAddValue239 = fma(scalarValue15, fma(scalarValue22, fragmentVectorConstants1.packedValues[2u].z, -scalarValue22), scalarValue22) - multiplyAddValue236;
    float multiplyAddValue240 = fma(scalarValue23, multiplyAddValue237, multiplyAddValue234);
    float multiplyAddValue241 = fma(scalarValue23, multiplyAddValue238, multiplyAddValue235);
    float multiplyAddValue242 = fma(scalarValue23, multiplyAddValue239, multiplyAddValue236);
    precise float sumValue57 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue240;
    precise float sumValue58 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue241;
    precise float sumValue59 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue242;
    float multiplyAddValue243 = fma(fragmentScalarConstants1.packedValues[3u], sumValue57, multiplyAddValue240);
    float multiplyAddValue244 = fma(fragmentScalarConstants1.packedValues[3u], sumValue58, multiplyAddValue241);
    float multiplyAddValue245 = fma(fragmentScalarConstants1.packedValues[3u], sumValue59, multiplyAddValue242);
    precise float productValue160 = multiplyAddValue243 * varyingColor3.x;
    precise float productValue161 = multiplyAddValue244 * varyingColor3.y;
    precise float productValue162 = multiplyAddValue245 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue243, varyingColor3.x, varyingColor2.x), productValue160);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue244, varyingColor3.y, varyingColor2.y), productValue161);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue245, varyingColor3.z, varyingColor2.z), productValue162);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float scalarValue9 = ceil(scalarValue8);
    precise float multiplyAddValue252 = fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[2u].x, -scalarValue5), scalarValue5) - scalarValue28;
    precise float multiplyAddValue253 = fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[2u].y, -scalarValue6), scalarValue6) - scalarValue29;
    precise float multiplyAddValue254 = fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[2u].z, -scalarValue7), scalarValue7) - scalarValue30;
    float multiplyAddValue255 = fma(scalarValue9, multiplyAddValue252, scalarValue28);
    float multiplyAddValue256 = fma(scalarValue9, multiplyAddValue253, scalarValue29);
    float multiplyAddValue257 = fma(scalarValue9, multiplyAddValue254, scalarValue30);
    precise float sumValue60 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue255;
    precise float sumValue61 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue256;
    precise float sumValue62 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue257;
    float multiplyAddValue258 = fma(fragmentScalarConstants1.packedValues[3u], sumValue60, multiplyAddValue255);
    float multiplyAddValue259 = fma(fragmentScalarConstants1.packedValues[3u], sumValue61, multiplyAddValue256);
    float multiplyAddValue260 = fma(fragmentScalarConstants1.packedValues[3u], sumValue62, multiplyAddValue257);
    precise float productValue170 = multiplyAddValue258 * varyingColor3.x;
    precise float productValue171 = multiplyAddValue259 * varyingColor3.y;
    precise float productValue172 = multiplyAddValue260 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue258, varyingColor3.x, varyingColor2.x), productValue170);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue259, varyingColor3.y, varyingColor2.y), productValue171);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue260, varyingColor3.z, varyingColor2.z), productValue172);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float multiplyAddValue267 = scalarValue31 * fma(scalarValue28, fragmentVectorConstants1.packedValues[2u].x, -scalarValue28);
    precise float multiplyAddValue268 = scalarValue31 * fma(scalarValue29, fragmentVectorConstants1.packedValues[2u].y, -scalarValue29);
    precise float multiplyAddValue269 = scalarValue31 * fma(scalarValue30, fragmentVectorConstants1.packedValues[2u].z, -scalarValue30);
    float scalarValue33 = ceil(scalarValue31);
    float multiplyAddValue270 = fma(scalarValue33, multiplyAddValue267, scalarValue28);
    float multiplyAddValue271 = fma(scalarValue33, multiplyAddValue268, scalarValue29);
    float multiplyAddValue272 = fma(scalarValue33, multiplyAddValue269, scalarValue30);
    precise float sumValue63 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue270;
    precise float sumValue64 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue271;
    precise float sumValue65 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue272;
    float multiplyAddValue273 = fma(fragmentScalarConstants1.packedValues[3u], sumValue63, multiplyAddValue270);
    float multiplyAddValue274 = fma(fragmentScalarConstants1.packedValues[3u], sumValue64, multiplyAddValue271);
    float multiplyAddValue275 = fma(fragmentScalarConstants1.packedValues[3u], sumValue65, multiplyAddValue272);
    precise float productValue173 = multiplyAddValue273 * varyingColor3.x;
    precise float productValue174 = multiplyAddValue274 * varyingColor3.y;
    precise float productValue175 = multiplyAddValue275 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue273, varyingColor3.x, varyingColor2.x), productValue173);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue274, varyingColor3.y, varyingColor2.y), productValue174);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue275, varyingColor3.z, varyingColor2.z), productValue175);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[15u], fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[15u], fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[15u], fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue9 = ceil(scalarValue8);
    float multiplyAddValue3 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[4u].x, -scalarValue5), scalarValue5) - multiplyAddValue, multiplyAddValue);
    float multiplyAddValue4 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[4u].y, -scalarValue6), scalarValue6) - multiplyAddValue1, multiplyAddValue1);
    float multiplyAddValue5 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[4u].z, -scalarValue7), scalarValue7) - multiplyAddValue2, multiplyAddValue2);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue3, multiplyAddValue3);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue4, multiplyAddValue4);
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue5, multiplyAddValue5);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue6, varyingColor3.x, varyingColor2.x), multiplyAddValue6 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue7, varyingColor3.y, varyingColor2.y), multiplyAddValue7 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue8, varyingColor3.z, varyingColor2.z), multiplyAddValue8 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[15u], fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[15u], fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[15u], fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue11 = ceil(fragmentScalarConstants1.packedValues[11u]);
    float multiplyAddValue30 = fma(scalarValue11, fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[4u].x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x) - multiplyAddValue, multiplyAddValue);
    float multiplyAddValue31 = fma(scalarValue11, fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[4u].y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y) - multiplyAddValue1, multiplyAddValue1);
    float multiplyAddValue32 = fma(scalarValue11, fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[4u].z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z) - multiplyAddValue2, multiplyAddValue2);
    float multiplyAddValue33 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue30, multiplyAddValue30);
    float multiplyAddValue34 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue31, multiplyAddValue31);
    float multiplyAddValue35 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue32, multiplyAddValue32);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue33, varyingColor3.x, varyingColor2.x), multiplyAddValue33 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue34, varyingColor3.y, varyingColor2.y), multiplyAddValue34 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue35, varyingColor3.z, varyingColor2.z), multiplyAddValue35 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[15u], fragmentVectorConstants1.packedValues[3u].x - fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[15u], fragmentVectorConstants1.packedValues[3u].y - fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[15u], fragmentVectorConstants1.packedValues[3u].z - fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue14 = ceil(fragmentScalarConstants1.packedValues[15u]);
    float multiplyAddValue36 = fma(scalarValue14, fma(fragmentScalarConstants1.packedValues[15u], fma(fragmentVectorConstants1.packedValues[3u].x, fragmentVectorConstants1.packedValues[4u].x, -fragmentVectorConstants1.packedValues[3u].x), fragmentVectorConstants1.packedValues[3u].x) - multiplyAddValue, multiplyAddValue);
    float multiplyAddValue37 = fma(scalarValue14, fma(fragmentScalarConstants1.packedValues[15u], fma(fragmentVectorConstants1.packedValues[3u].y, fragmentVectorConstants1.packedValues[4u].y, -fragmentVectorConstants1.packedValues[3u].y), fragmentVectorConstants1.packedValues[3u].y) - multiplyAddValue1, multiplyAddValue1);
    float multiplyAddValue38 = fma(scalarValue14, fma(fragmentScalarConstants1.packedValues[15u], fma(fragmentVectorConstants1.packedValues[3u].z, fragmentVectorConstants1.packedValues[4u].z, -fragmentVectorConstants1.packedValues[3u].z), fragmentVectorConstants1.packedValues[3u].z) - multiplyAddValue2, multiplyAddValue2);
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue36, multiplyAddValue36);
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue37, multiplyAddValue37);
    float multiplyAddValue41 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue38, multiplyAddValue38);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue39, varyingColor3.x, varyingColor2.x), multiplyAddValue39 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue40, varyingColor3.y, varyingColor2.y), multiplyAddValue40 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue41, varyingColor3.z, varyingColor2.z), multiplyAddValue41 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float multiplyAddValue51 = fma(scalarValue15, sampledTextureValue3.x - fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue52 = fma(scalarValue15, sampledTextureValue3.y - fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue53 = fma(scalarValue15, sampledTextureValue3.z - fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue9 = ceil(scalarValue8);
    float multiplyAddValue54 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[3u].x, -scalarValue5), scalarValue5) - multiplyAddValue51, multiplyAddValue51);
    float multiplyAddValue55 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[3u].y, -scalarValue6), scalarValue6) - multiplyAddValue52, multiplyAddValue52);
    float multiplyAddValue56 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[3u].z, -scalarValue7), scalarValue7) - multiplyAddValue53, multiplyAddValue53);
    float multiplyAddValue57 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue54, multiplyAddValue54);
    float multiplyAddValue58 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue55, multiplyAddValue55);
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue56, multiplyAddValue56);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue57, varyingColor3.x, varyingColor2.x), multiplyAddValue57 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue58, varyingColor3.y, varyingColor2.y), multiplyAddValue58 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue59, varyingColor3.z, varyingColor2.z), multiplyAddValue59 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue51 = fma(scalarValue15, sampledTextureValue3.x - fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue52 = fma(scalarValue15, sampledTextureValue3.y - fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue53 = fma(scalarValue15, sampledTextureValue3.z - fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue11 = ceil(fragmentScalarConstants1.packedValues[11u]);
    float multiplyAddValue72 = fma(scalarValue11, fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[3u].x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x) - multiplyAddValue51, multiplyAddValue51);
    float multiplyAddValue73 = fma(scalarValue11, fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[3u].y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y) - multiplyAddValue52, multiplyAddValue52);
    float multiplyAddValue74 = fma(scalarValue11, fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z) - multiplyAddValue53, multiplyAddValue53);
    float multiplyAddValue75 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue72, multiplyAddValue72);
    float multiplyAddValue76 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue73, multiplyAddValue73);
    float multiplyAddValue77 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue74, multiplyAddValue74);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue75, varyingColor3.x, varyingColor2.x), multiplyAddValue75 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue76, varyingColor3.y, varyingColor2.y), multiplyAddValue76 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue77, varyingColor3.z, varyingColor2.z), multiplyAddValue77 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue87 = fma(scalarValue15, scalarValue20 - fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue88 = fma(scalarValue15, scalarValue21 - fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue89 = fma(scalarValue15, scalarValue22 - fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z);
    float scalarValue23 = ceil(scalarValue15);
    float multiplyAddValue90 = fma(scalarValue23, fma(scalarValue15, fma(scalarValue20, fragmentVectorConstants1.packedValues[3u].x, -scalarValue20), scalarValue20) - multiplyAddValue87, multiplyAddValue87);
    float multiplyAddValue91 = fma(scalarValue23, fma(scalarValue15, fma(scalarValue21, fragmentVectorConstants1.packedValues[3u].y, -scalarValue21), scalarValue21) - multiplyAddValue88, multiplyAddValue88);
    float multiplyAddValue92 = fma(scalarValue23, fma(scalarValue15, fma(scalarValue22, fragmentVectorConstants1.packedValues[3u].z, -scalarValue22), scalarValue22) - multiplyAddValue89, multiplyAddValue89);
    float multiplyAddValue93 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue90, multiplyAddValue90);
    float multiplyAddValue94 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue91, multiplyAddValue91);
    float multiplyAddValue95 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue92, multiplyAddValue92);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue93, varyingColor3.x, varyingColor2.x), multiplyAddValue93 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue94, varyingColor3.y, varyingColor2.y), multiplyAddValue94 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue95, varyingColor3.z, varyingColor2.z), multiplyAddValue95 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float scalarValue9 = ceil(scalarValue8);
    float multiplyAddValue117 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[3u].x, -scalarValue5), scalarValue5) - fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue118 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[3u].y, -scalarValue6), scalarValue6) - fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue119 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[3u].z, -scalarValue7), scalarValue7) - fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z);
    float multiplyAddValue120 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue117, multiplyAddValue117);
    float multiplyAddValue121 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue118, multiplyAddValue118);
    float multiplyAddValue122 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue119, multiplyAddValue119);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue120, varyingColor3.x, varyingColor2.x), multiplyAddValue120 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue121, varyingColor3.y, varyingColor2.y), multiplyAddValue121 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue122, varyingColor3.z, varyingColor2.z), multiplyAddValue122 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float scalarValue11 = ceil(fragmentScalarConstants1.packedValues[11u]);
    float multiplyAddValue123 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[3u].x, -fragmentVectorConstants1.packedValues[2u].x) * fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue124 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[3u].y, -fragmentVectorConstants1.packedValues[2u].y) * fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue125 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z, -fragmentVectorConstants1.packedValues[2u].z) * fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].z);
    float multiplyAddValue126 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue123, multiplyAddValue123);
    float multiplyAddValue127 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue124, multiplyAddValue124);
    float multiplyAddValue128 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue125, multiplyAddValue125);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue126, varyingColor3.x, varyingColor2.x), multiplyAddValue126 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue127, varyingColor3.y, varyingColor2.y), multiplyAddValue127 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue128, varyingColor3.z, varyingColor2.z), multiplyAddValue128 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float multiplyAddValue138 = fma(fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].x - scalarValue28, scalarValue28);
    float multiplyAddValue139 = fma(fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].y - scalarValue29, scalarValue29);
    float multiplyAddValue140 = fma(fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].z - scalarValue30, scalarValue30);
    float scalarValue9 = ceil(scalarValue8);
    float multiplyAddValue141 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[3u].x, -scalarValue5), scalarValue5) - multiplyAddValue138, multiplyAddValue138);
    float multiplyAddValue142 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[3u].y, -scalarValue6), scalarValue6) - multiplyAddValue139, multiplyAddValue139);
    float multiplyAddValue143 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[3u].z, -scalarValue7), scalarValue7) - multiplyAddValue140, multiplyAddValue140);
    float multiplyAddValue144 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue141, multiplyAddValue141);
    float multiplyAddValue145 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue142, multiplyAddValue142);
    float multiplyAddValue146 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue143, multiplyAddValue143);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue144, varyingColor3.x, varyingColor2.x), multiplyAddValue144 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue145, varyingColor3.y, varyingColor2.y), multiplyAddValue145 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue146, varyingColor3.z, varyingColor2.z), multiplyAddValue146 * varyingColor3.z);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue138 = fma(fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].x - scalarValue28, scalarValue28);
    float multiplyAddValue139 = fma(fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].y - scalarValue29, scalarValue29);
    float multiplyAddValue140 = fma(fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].z - scalarValue30, scalarValue30);
    float scalarValue33 = ceil(scalarValue31);
    float multiplyAddValue159 = fma(scalarValue33, fma(scalarValue31, fma(scalarValue28, fragmentVectorConstants1.packedValues[3u].x, -scalarValue28), scalarValue28) - multiplyAddValue138, multiplyAddValue138);
    float multiplyAddValue160 = fma(scalarValue33, fma(scalarValue31, fma(scalarValue29, fragmentVectorConstants1.packedValues[3u].y, -scalarValue29), scalarValue29) - multiplyAddValue139, multiplyAddValue139);
    float multiplyAddValue161 = fma(scalarValue33, fma(scalarValue31, fma(scalarValue30, fragmentVectorConstants1.packedValues[3u].z, -scalarValue30), scalarValue30) - multiplyAddValue140, multiplyAddValue140);
    float multiplyAddValue162 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue159, multiplyAddValue159);
    float multiplyAddValue163 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue160, multiplyAddValue160);
    float multiplyAddValue164 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue161, multiplyAddValue161);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue162, varyingColor3.x, varyingColor2.x), multiplyAddValue162 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue163, varyingColor3.y, varyingColor2.y), multiplyAddValue163 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue164, varyingColor3.z, varyingColor2.z), multiplyAddValue164 * varyingColor3.z);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue138 = fma(fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].x - scalarValue28, scalarValue28);
    float multiplyAddValue139 = fma(fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].y - scalarValue29, scalarValue29);
    float multiplyAddValue140 = fma(fragmentScalarConstants1.packedValues[11u], fragmentVectorConstants1.packedValues[2u].z - scalarValue30, scalarValue30);
    float scalarValue11 = ceil(fragmentScalarConstants1.packedValues[11u]);
    float multiplyAddValue174 = fma(scalarValue11, fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[3u].x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x) - multiplyAddValue138, multiplyAddValue138);
    float multiplyAddValue175 = fma(scalarValue11, fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[3u].y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y) - multiplyAddValue139, multiplyAddValue139);
    float multiplyAddValue176 = fma(scalarValue11, fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z) - multiplyAddValue140, multiplyAddValue140);
    float multiplyAddValue177 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue174, multiplyAddValue174);
    float multiplyAddValue178 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue175, multiplyAddValue175);
    float multiplyAddValue179 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue176, multiplyAddValue176);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue177, varyingColor3.x, varyingColor2.x), multiplyAddValue177 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue178, varyingColor3.y, varyingColor2.y), multiplyAddValue178 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue179, varyingColor3.z, varyingColor2.z), multiplyAddValue179 * varyingColor3.z);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float multiplyAddValue189 = fma(scalarValue15, sampledTextureValue3.x - scalarValue28, scalarValue28);
    float multiplyAddValue190 = fma(scalarValue15, sampledTextureValue3.y - scalarValue29, scalarValue29);
    float multiplyAddValue191 = fma(scalarValue15, sampledTextureValue3.z - scalarValue30, scalarValue30);
    float scalarValue9 = ceil(scalarValue8);
    float multiplyAddValue192 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[2u].x, -scalarValue5), scalarValue5) - multiplyAddValue189, multiplyAddValue189);
    float multiplyAddValue193 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[2u].y, -scalarValue6), scalarValue6) - multiplyAddValue190, multiplyAddValue190);
    float multiplyAddValue194 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[2u].z, -scalarValue7), scalarValue7) - multiplyAddValue191, multiplyAddValue191);
    float multiplyAddValue195 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue192, multiplyAddValue192);
    float multiplyAddValue196 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue193, multiplyAddValue193);
    float multiplyAddValue197 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue194, multiplyAddValue194);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue195, varyingColor3.x, varyingColor2.x), multiplyAddValue195 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue196, varyingColor3.y, varyingColor2.y), multiplyAddValue196 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue197, varyingColor3.z, varyingColor2.z), multiplyAddValue197 * varyingColor3.z);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue189 = fma(scalarValue15, sampledTextureValue3.x - scalarValue28, scalarValue28);
    float multiplyAddValue190 = fma(scalarValue15, sampledTextureValue3.y - scalarValue29, scalarValue29);
    float multiplyAddValue191 = fma(scalarValue15, sampledTextureValue3.z - scalarValue30, scalarValue30);
    float scalarValue33 = ceil(scalarValue31);
    float multiplyAddValue210 = fma(scalarValue33, fma(scalarValue31, fma(scalarValue28, fragmentVectorConstants1.packedValues[2u].x, -scalarValue28), scalarValue28) - multiplyAddValue189, multiplyAddValue189);
    float multiplyAddValue211 = fma(scalarValue33, fma(scalarValue31, fma(scalarValue29, fragmentVectorConstants1.packedValues[2u].y, -scalarValue29), scalarValue29) - multiplyAddValue190, multiplyAddValue190);
    float multiplyAddValue212 = fma(scalarValue33, fma(scalarValue31, fma(scalarValue30, fragmentVectorConstants1.packedValues[2u].z, -scalarValue30), scalarValue30) - multiplyAddValue191, multiplyAddValue191);
    float multiplyAddValue213 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue210, multiplyAddValue210);
    float multiplyAddValue214 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue211, multiplyAddValue211);
    float multiplyAddValue215 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue212, multiplyAddValue212);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue213, varyingColor3.x, varyingColor2.x), multiplyAddValue213 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue214, varyingColor3.y, varyingColor2.y), multiplyAddValue214 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue215, varyingColor3.z, varyingColor2.z), multiplyAddValue215 * varyingColor3.z);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue225 = fma(scalarValue15, scalarValue20 - scalarValue28, scalarValue28);
    float multiplyAddValue226 = fma(scalarValue15, scalarValue21 - scalarValue29, scalarValue29);
    float multiplyAddValue227 = fma(scalarValue15, scalarValue22 - scalarValue30, scalarValue30);
    float scalarValue23 = ceil(scalarValue15);
    float multiplyAddValue228 = fma(scalarValue23, fma(scalarValue15, fma(scalarValue20, fragmentVectorConstants1.packedValues[2u].x, -scalarValue20), scalarValue20) - multiplyAddValue225, multiplyAddValue225);
    float multiplyAddValue229 = fma(scalarValue23, fma(scalarValue15, fma(scalarValue21, fragmentVectorConstants1.packedValues[2u].y, -scalarValue21), scalarValue21) - multiplyAddValue226, multiplyAddValue226);
    float multiplyAddValue230 = fma(scalarValue23, fma(scalarValue15, fma(scalarValue22, fragmentVectorConstants1.packedValues[2u].z, -scalarValue22), scalarValue22) - multiplyAddValue227, multiplyAddValue227);
    float multiplyAddValue231 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue228, multiplyAddValue228);
    float multiplyAddValue232 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue229, multiplyAddValue229);
    float multiplyAddValue233 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue230, multiplyAddValue230);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue231, varyingColor3.x, varyingColor2.x), multiplyAddValue231 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue232, varyingColor3.y, varyingColor2.y), multiplyAddValue232 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue233, varyingColor3.z, varyingColor2.z), multiplyAddValue233 * varyingColor3.z);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float scalarValue9 = ceil(scalarValue8);
    float multiplyAddValue246 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue5, fragmentVectorConstants1.packedValues[2u].x, -scalarValue5), scalarValue5) - scalarValue28, scalarValue28);
    float multiplyAddValue247 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue6, fragmentVectorConstants1.packedValues[2u].y, -scalarValue6), scalarValue6) - scalarValue29, scalarValue29);
    float multiplyAddValue248 = fma(scalarValue9, fma(scalarValue8, fma(scalarValue7, fragmentVectorConstants1.packedValues[2u].z, -scalarValue7), scalarValue7) - scalarValue30, scalarValue30);
    float multiplyAddValue249 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue246, multiplyAddValue246);
    float multiplyAddValue250 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue247, multiplyAddValue247);
    float multiplyAddValue251 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue248, multiplyAddValue248);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue249, varyingColor3.x, varyingColor2.x), multiplyAddValue249 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue250, varyingColor3.y, varyingColor2.y), multiplyAddValue250 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue251, varyingColor3.z, varyingColor2.z), multiplyAddValue251 * varyingColor3.z);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float scalarValue33 = ceil(scalarValue31);
    float multiplyAddValue261 = fma(scalarValue33, scalarValue31 * fma(scalarValue28, fragmentVectorConstants1.packedValues[2u].x, -scalarValue28), scalarValue28);
    float multiplyAddValue262 = fma(scalarValue33, scalarValue31 * fma(scalarValue29, fragmentVectorConstants1.packedValues[2u].y, -scalarValue29), scalarValue29);
    float multiplyAddValue263 = fma(scalarValue33, scalarValue31 * fma(scalarValue30, fragmentVectorConstants1.packedValues[2u].z, -scalarValue30), scalarValue30);
    float multiplyAddValue264 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue261, multiplyAddValue261);
    float multiplyAddValue265 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue262, multiplyAddValue262);
    float multiplyAddValue266 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue263, multiplyAddValue263);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue264, varyingColor3.x, varyingColor2.x), multiplyAddValue264 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue265, varyingColor3.y, varyingColor2.y), multiplyAddValue265 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue266, varyingColor3.z, varyingColor2.z), multiplyAddValue266 * varyingColor3.z);
    fragmentColor0.w = scalarValue31;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue4 = ceil(scalarValue3);
    float productValue3 = (((scalarValue - productValue) + (((fragmentVectorConstants1.packedValues[4u].x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + productValue;
    float productValue4 = (((scalarValue1 - productValue1) + (((fragmentVectorConstants1.packedValues[4u].y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + productValue1;
    float productValue5 = (((scalarValue2 - productValue2) + (((fragmentVectorConstants1.packedValues[4u].z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + productValue2;
    float productValue6 = (((fragmentVectorConstants1.packedValues[0u].x - productValue3) * fragmentVectorConstants1.packedValues[0u].w) + productValue3) * varyingColor3.x;
    float productValue7 = (((fragmentVectorConstants1.packedValues[0u].y - productValue4) * fragmentVectorConstants1.packedValues[0u].w) + productValue4) * varyingColor3.y;
    float productValue8 = (((fragmentVectorConstants1.packedValues[0u].z - productValue5) * fragmentVectorConstants1.packedValues[0u].w) + productValue5) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue10 = ceil(fragmentVectorConstants1.packedValues[2u].w);
    float productValue15 = (productValue12 + fragmentVectorConstants1.packedValues[2u].x) + (((((fragmentVectorConstants1.packedValues[4u].x * fragmentVectorConstants1.packedValues[2u].x) - fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[2u].w) - productValue12) * scalarValue10);
    float productValue16 = (productValue13 + fragmentVectorConstants1.packedValues[2u].y) + (((((fragmentVectorConstants1.packedValues[4u].y * fragmentVectorConstants1.packedValues[2u].y) - fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[2u].w) - productValue13) * scalarValue10);
    float productValue17 = (productValue14 + fragmentVectorConstants1.packedValues[2u].z) + (((((fragmentVectorConstants1.packedValues[4u].z * fragmentVectorConstants1.packedValues[2u].z) - fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[2u].w) - productValue14) * scalarValue10);
    float productValue18 = (((fragmentVectorConstants1.packedValues[0u].x - productValue15) * fragmentVectorConstants1.packedValues[0u].w) + productValue15) * varyingColor3.x;
    float productValue19 = (((fragmentVectorConstants1.packedValues[0u].y - productValue16) * fragmentVectorConstants1.packedValues[0u].w) + productValue16) * varyingColor3.y;
    float productValue20 = (((fragmentVectorConstants1.packedValues[0u].z - productValue17) * fragmentVectorConstants1.packedValues[0u].w) + productValue17) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue18) * varyingColor2.w) + productValue18;
    fragmentColor0.y = ((varyingColor2.y - productValue19) * varyingColor2.w) + productValue19;
    fragmentColor0.z = ((varyingColor2.z - productValue20) * varyingColor2.w) + productValue20;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue12 = ceil(fragmentVectorConstants1.packedValues[3u].w);
    float productValue24 = (((fragmentVectorConstants1.packedValues[3u].x - productValue) + (((fragmentVectorConstants1.packedValues[4u].x * fragmentVectorConstants1.packedValues[3u].x) - fragmentVectorConstants1.packedValues[3u].x) * fragmentVectorConstants1.packedValues[3u].w)) * scalarValue12) + productValue;
    float productValue25 = (((fragmentVectorConstants1.packedValues[3u].y - productValue1) + (((fragmentVectorConstants1.packedValues[4u].y * fragmentVectorConstants1.packedValues[3u].y) - fragmentVectorConstants1.packedValues[3u].y) * fragmentVectorConstants1.packedValues[3u].w)) * scalarValue12) + productValue1;
    float productValue26 = (((fragmentVectorConstants1.packedValues[3u].z - productValue2) + (((fragmentVectorConstants1.packedValues[4u].z * fragmentVectorConstants1.packedValues[3u].z) - fragmentVectorConstants1.packedValues[3u].z) * fragmentVectorConstants1.packedValues[3u].w)) * scalarValue12) + productValue2;
    float productValue27 = (((fragmentVectorConstants1.packedValues[0u].x - productValue24) * fragmentVectorConstants1.packedValues[0u].w) + productValue24) * varyingColor3.x;
    float productValue28 = (((fragmentVectorConstants1.packedValues[0u].y - productValue25) * fragmentVectorConstants1.packedValues[0u].w) + productValue25) * varyingColor3.y;
    float productValue29 = (((fragmentVectorConstants1.packedValues[0u].z - productValue26) * fragmentVectorConstants1.packedValues[0u].w) + productValue26) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue27) * varyingColor2.w) + productValue27;
    fragmentColor0.y = ((varyingColor2.y - productValue28) * varyingColor2.w) + productValue28;
    fragmentColor0.z = ((varyingColor2.z - productValue29) * varyingColor2.w) + productValue29;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue4 = ceil(scalarValue3);
    float productValue33 = (((scalarValue - productValue30) + (((fragmentVectorConstants1.packedValues[3u].x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + productValue30;
    float productValue34 = (((scalarValue1 - productValue31) + (((fragmentVectorConstants1.packedValues[3u].y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + productValue31;
    float productValue35 = (((scalarValue2 - productValue32) + (((fragmentVectorConstants1.packedValues[3u].z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + productValue32;
    float productValue36 = (((fragmentVectorConstants1.packedValues[0u].x - productValue33) * fragmentVectorConstants1.packedValues[0u].w) + productValue33) * varyingColor3.x;
    float productValue37 = (((fragmentVectorConstants1.packedValues[0u].y - productValue34) * fragmentVectorConstants1.packedValues[0u].w) + productValue34) * varyingColor3.y;
    float productValue38 = (((fragmentVectorConstants1.packedValues[0u].z - productValue35) * fragmentVectorConstants1.packedValues[0u].w) + productValue35) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue36) * varyingColor2.w) + productValue36;
    fragmentColor0.y = ((varyingColor2.y - productValue37) * varyingColor2.w) + productValue37;
    fragmentColor0.z = ((varyingColor2.z - productValue38) * varyingColor2.w) + productValue38;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue10 = ceil(fragmentVectorConstants1.packedValues[2u].w);
    float productValue45 = (productValue42 + fragmentVectorConstants1.packedValues[2u].x) + (((((fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[2u].x) - fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[2u].w) - productValue42) * scalarValue10);
    float productValue46 = (productValue43 + fragmentVectorConstants1.packedValues[2u].y) + (((((fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[2u].y) - fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[2u].w) - productValue43) * scalarValue10);
    float productValue47 = (productValue44 + fragmentVectorConstants1.packedValues[2u].z) + (((((fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[2u].z) - fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[2u].w) - productValue44) * scalarValue10);
    float productValue48 = (((fragmentVectorConstants1.packedValues[0u].x - productValue45) * fragmentVectorConstants1.packedValues[0u].w) + productValue45) * varyingColor3.x;
    float productValue49 = (((fragmentVectorConstants1.packedValues[0u].y - productValue46) * fragmentVectorConstants1.packedValues[0u].w) + productValue46) * varyingColor3.y;
    float productValue50 = (((fragmentVectorConstants1.packedValues[0u].z - productValue47) * fragmentVectorConstants1.packedValues[0u].w) + productValue47) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue48) * varyingColor2.w) + productValue48;
    fragmentColor0.y = ((varyingColor2.y - productValue49) * varyingColor2.w) + productValue49;
    fragmentColor0.z = ((varyingColor2.z - productValue50) * varyingColor2.w) + productValue50;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue19 = ceil(scalarValue13);
    float productValue57 = (((scalarValue16 - productValue54) + (((fragmentVectorConstants1.packedValues[3u].x * scalarValue16) - scalarValue16) * scalarValue13)) * scalarValue19) + productValue54;
    float productValue58 = (((scalarValue17 - productValue55) + (((fragmentVectorConstants1.packedValues[3u].y * scalarValue17) - scalarValue17) * scalarValue13)) * scalarValue19) + productValue55;
    float productValue59 = (((scalarValue18 - productValue56) + (((fragmentVectorConstants1.packedValues[3u].z * scalarValue18) - scalarValue18) * scalarValue13)) * scalarValue19) + productValue56;
    float productValue60 = (((fragmentVectorConstants1.packedValues[0u].x - productValue57) * fragmentVectorConstants1.packedValues[0u].w) + productValue57) * varyingColor3.x;
    float productValue61 = (((fragmentVectorConstants1.packedValues[0u].y - productValue58) * fragmentVectorConstants1.packedValues[0u].w) + productValue58) * varyingColor3.y;
    float productValue62 = (((fragmentVectorConstants1.packedValues[0u].z - productValue59) * fragmentVectorConstants1.packedValues[0u].w) + productValue59) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue60) * varyingColor2.w) + productValue60;
    fragmentColor0.y = ((varyingColor2.y - productValue61) * varyingColor2.w) + productValue61;
    fragmentColor0.z = ((varyingColor2.z - productValue62) * varyingColor2.w) + productValue62;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue4 = ceil(scalarValue3);
    float productValue69 = (((scalarValue - fragmentVectorConstants1.packedValues[2u].x) + (((fragmentVectorConstants1.packedValues[3u].x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + fragmentVectorConstants1.packedValues[2u].x;
    float productValue70 = (((scalarValue1 - fragmentVectorConstants1.packedValues[2u].y) + (((fragmentVectorConstants1.packedValues[3u].y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + fragmentVectorConstants1.packedValues[2u].y;
    float productValue71 = (((scalarValue2 - fragmentVectorConstants1.packedValues[2u].z) + (((fragmentVectorConstants1.packedValues[3u].z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + fragmentVectorConstants1.packedValues[2u].z;
    float productValue72 = (((fragmentVectorConstants1.packedValues[0u].x - productValue69) * fragmentVectorConstants1.packedValues[0u].w) + productValue69) * varyingColor3.x;
    float productValue73 = (((fragmentVectorConstants1.packedValues[0u].y - productValue70) * fragmentVectorConstants1.packedValues[0u].w) + productValue70) * varyingColor3.y;
    float productValue74 = (((fragmentVectorConstants1.packedValues[0u].z - productValue71) * fragmentVectorConstants1.packedValues[0u].w) + productValue71) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue72) * varyingColor2.w) + productValue72;
    fragmentColor0.y = ((varyingColor2.y - productValue73) * varyingColor2.w) + productValue73;
    fragmentColor0.z = ((varyingColor2.z - productValue74) * varyingColor2.w) + productValue74;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue75 = ceil(fragmentVectorConstants1.packedValues[2u].w) * fragmentVectorConstants1.packedValues[2u].w;
    float productValue76 = (((fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[2u].x) - fragmentVectorConstants1.packedValues[2u].x) * productValue75) + fragmentVectorConstants1.packedValues[2u].x;
    float productValue77 = (((fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[2u].y) - fragmentVectorConstants1.packedValues[2u].y) * productValue75) + fragmentVectorConstants1.packedValues[2u].y;
    float productValue78 = (((fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[2u].z) - fragmentVectorConstants1.packedValues[2u].z) * productValue75) + fragmentVectorConstants1.packedValues[2u].z;
    float productValue79 = (((fragmentVectorConstants1.packedValues[0u].x - productValue76) * fragmentVectorConstants1.packedValues[0u].w) + productValue76) * varyingColor3.x;
    float productValue80 = (((fragmentVectorConstants1.packedValues[0u].y - productValue77) * fragmentVectorConstants1.packedValues[0u].w) + productValue77) * varyingColor3.y;
    float productValue81 = (((fragmentVectorConstants1.packedValues[0u].z - productValue78) * fragmentVectorConstants1.packedValues[0u].w) + productValue78) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue79) * varyingColor2.w) + productValue79;
    fragmentColor0.y = ((varyingColor2.y - productValue80) * varyingColor2.w) + productValue80;
    fragmentColor0.z = ((varyingColor2.z - productValue81) * varyingColor2.w) + productValue81;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue4 = ceil(scalarValue3);
    float productValue88 = (((scalarValue - productValue85) + (((fragmentVectorConstants1.packedValues[3u].x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + productValue85;
    float productValue89 = (((scalarValue1 - productValue86) + (((fragmentVectorConstants1.packedValues[3u].y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + productValue86;
    float productValue90 = (((scalarValue2 - productValue87) + (((fragmentVectorConstants1.packedValues[3u].z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + productValue87;
    float productValue91 = (((fragmentVectorConstants1.packedValues[0u].x - productValue88) * fragmentVectorConstants1.packedValues[0u].w) + productValue88) * varyingColor3.x;
    float productValue92 = (((fragmentVectorConstants1.packedValues[0u].y - productValue89) * fragmentVectorConstants1.packedValues[0u].w) + productValue89) * varyingColor3.y;
    float productValue93 = (((fragmentVectorConstants1.packedValues[0u].z - productValue90) * fragmentVectorConstants1.packedValues[0u].w) + productValue90) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue91) * varyingColor2.w) + productValue91;
    fragmentColor0.y = ((varyingColor2.y - productValue92) * varyingColor2.w) + productValue92;
    fragmentColor0.z = ((varyingColor2.z - productValue93) * varyingColor2.w) + productValue93;
    fragmentColor0.w = scalarValue27;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue32 = ceil(scalarValue27);
    float productValue103 = (productValue100 + scalarValue24) + (((((fragmentVectorConstants1.packedValues[3u].x * scalarValue24) - scalarValue24) * scalarValue27) - productValue100) * scalarValue32);
    float productValue104 = (productValue101 + scalarValue25) + (((((fragmentVectorConstants1.packedValues[3u].y * scalarValue25) - scalarValue25) * scalarValue27) - productValue101) * scalarValue32);
    float productValue105 = (productValue102 + scalarValue26) + (((((fragmentVectorConstants1.packedValues[3u].z * scalarValue26) - scalarValue26) * scalarValue27) - productValue102) * scalarValue32);
    float productValue106 = (((fragmentVectorConstants1.packedValues[0u].x - productValue103) * fragmentVectorConstants1.packedValues[0u].w) + productValue103) * varyingColor3.x;
    float productValue107 = (((fragmentVectorConstants1.packedValues[0u].y - productValue104) * fragmentVectorConstants1.packedValues[0u].w) + productValue104) * varyingColor3.y;
    float productValue108 = (((fragmentVectorConstants1.packedValues[0u].z - productValue105) * fragmentVectorConstants1.packedValues[0u].w) + productValue105) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue106) * varyingColor2.w) + productValue106;
    fragmentColor0.y = ((varyingColor2.y - productValue107) * varyingColor2.w) + productValue107;
    fragmentColor0.z = ((varyingColor2.z - productValue108) * varyingColor2.w) + productValue108;
    fragmentColor0.w = scalarValue27;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue10 = ceil(fragmentVectorConstants1.packedValues[2u].w);
    float productValue112 = (((fragmentVectorConstants1.packedValues[2u].x - productValue85) + (((fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[2u].x) - fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[2u].w)) * scalarValue10) + productValue85;
    float productValue113 = (((fragmentVectorConstants1.packedValues[2u].y - productValue86) + (((fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[2u].y) - fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[2u].w)) * scalarValue10) + productValue86;
    float productValue114 = (((fragmentVectorConstants1.packedValues[2u].z - productValue87) + (((fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[2u].z) - fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[2u].w)) * scalarValue10) + productValue87;
    float productValue115 = (((fragmentVectorConstants1.packedValues[0u].x - productValue112) * fragmentVectorConstants1.packedValues[0u].w) + productValue112) * varyingColor3.x;
    float productValue116 = (((fragmentVectorConstants1.packedValues[0u].y - productValue113) * fragmentVectorConstants1.packedValues[0u].w) + productValue113) * varyingColor3.y;
    float productValue117 = (((fragmentVectorConstants1.packedValues[0u].z - productValue114) * fragmentVectorConstants1.packedValues[0u].w) + productValue114) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue115) * varyingColor2.w) + productValue115;
    fragmentColor0.y = ((varyingColor2.y - productValue116) * varyingColor2.w) + productValue116;
    fragmentColor0.z = ((varyingColor2.z - productValue117) * varyingColor2.w) + productValue117;
    fragmentColor0.w = scalarValue27;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue4 = ceil(scalarValue3);
    float productValue121 = (((scalarValue - productValue118) + (((fragmentVectorConstants1.packedValues[2u].x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + productValue118;
    float productValue122 = (((scalarValue1 - productValue119) + (((fragmentVectorConstants1.packedValues[2u].y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + productValue119;
    float productValue123 = (((scalarValue2 - productValue120) + (((fragmentVectorConstants1.packedValues[2u].z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + productValue120;
    float productValue124 = (((fragmentVectorConstants1.packedValues[0u].x - productValue121) * fragmentVectorConstants1.packedValues[0u].w) + productValue121) * varyingColor3.x;
    float productValue125 = (((fragmentVectorConstants1.packedValues[0u].y - productValue122) * fragmentVectorConstants1.packedValues[0u].w) + productValue122) * varyingColor3.y;
    float productValue126 = (((fragmentVectorConstants1.packedValues[0u].z - productValue123) * fragmentVectorConstants1.packedValues[0u].w) + productValue123) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue124) * varyingColor2.w) + productValue124;
    fragmentColor0.y = ((varyingColor2.y - productValue125) * varyingColor2.w) + productValue125;
    fragmentColor0.z = ((varyingColor2.z - productValue126) * varyingColor2.w) + productValue126;
    fragmentColor0.w = scalarValue27;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue32 = ceil(scalarValue27);
    float productValue133 = (productValue130 + scalarValue24) + (((((fragmentVectorConstants1.packedValues[2u].x * scalarValue24) - scalarValue24) * scalarValue27) - productValue130) * scalarValue32);
    float productValue134 = (productValue131 + scalarValue25) + (((((fragmentVectorConstants1.packedValues[2u].y * scalarValue25) - scalarValue25) * scalarValue27) - productValue131) * scalarValue32);
    float productValue135 = (productValue132 + scalarValue26) + (((((fragmentVectorConstants1.packedValues[2u].z * scalarValue26) - scalarValue26) * scalarValue27) - productValue132) * scalarValue32);
    float productValue136 = (((fragmentVectorConstants1.packedValues[0u].x - productValue133) * fragmentVectorConstants1.packedValues[0u].w) + productValue133) * varyingColor3.x;
    float productValue137 = (((fragmentVectorConstants1.packedValues[0u].y - productValue134) * fragmentVectorConstants1.packedValues[0u].w) + productValue134) * varyingColor3.y;
    float productValue138 = (((fragmentVectorConstants1.packedValues[0u].z - productValue135) * fragmentVectorConstants1.packedValues[0u].w) + productValue135) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue136) * varyingColor2.w) + productValue136;
    fragmentColor0.y = ((varyingColor2.y - productValue137) * varyingColor2.w) + productValue137;
    fragmentColor0.z = ((varyingColor2.z - productValue138) * varyingColor2.w) + productValue138;
    fragmentColor0.w = scalarValue27;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue19 = ceil(scalarValue13);
    float productValue145 = (((scalarValue16 - productValue142) + (((fragmentVectorConstants1.packedValues[2u].x * scalarValue16) - scalarValue16) * scalarValue13)) * scalarValue19) + productValue142;
    float productValue146 = (((scalarValue17 - productValue143) + (((fragmentVectorConstants1.packedValues[2u].y * scalarValue17) - scalarValue17) * scalarValue13)) * scalarValue19) + productValue143;
    float productValue147 = (((scalarValue18 - productValue144) + (((fragmentVectorConstants1.packedValues[2u].z * scalarValue18) - scalarValue18) * scalarValue13)) * scalarValue19) + productValue144;
    float productValue148 = (((fragmentVectorConstants1.packedValues[0u].x - productValue145) * fragmentVectorConstants1.packedValues[0u].w) + productValue145) * varyingColor3.x;
    float productValue149 = (((fragmentVectorConstants1.packedValues[0u].y - productValue146) * fragmentVectorConstants1.packedValues[0u].w) + productValue146) * varyingColor3.y;
    float productValue150 = (((fragmentVectorConstants1.packedValues[0u].z - productValue147) * fragmentVectorConstants1.packedValues[0u].w) + productValue147) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue148) * varyingColor2.w) + productValue148;
    fragmentColor0.y = ((varyingColor2.y - productValue149) * varyingColor2.w) + productValue149;
    fragmentColor0.z = ((varyingColor2.z - productValue150) * varyingColor2.w) + productValue150;
    fragmentColor0.w = scalarValue27;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue4 = ceil(scalarValue3);
    float productValue154 = (((scalarValue - scalarValue24) + (((fragmentVectorConstants1.packedValues[2u].x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + scalarValue24;
    float productValue155 = (((scalarValue1 - scalarValue25) + (((fragmentVectorConstants1.packedValues[2u].y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + scalarValue25;
    float productValue156 = (((scalarValue2 - scalarValue26) + (((fragmentVectorConstants1.packedValues[2u].z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + scalarValue26;
    float productValue157 = (((fragmentVectorConstants1.packedValues[0u].x - productValue154) * fragmentVectorConstants1.packedValues[0u].w) + productValue154) * varyingColor3.x;
    float productValue158 = (((fragmentVectorConstants1.packedValues[0u].y - productValue155) * fragmentVectorConstants1.packedValues[0u].w) + productValue155) * varyingColor3.y;
    float productValue159 = (((fragmentVectorConstants1.packedValues[0u].z - productValue156) * fragmentVectorConstants1.packedValues[0u].w) + productValue156) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue157) * varyingColor2.w) + productValue157;
    fragmentColor0.y = ((varyingColor2.y - productValue158) * varyingColor2.w) + productValue158;
    fragmentColor0.z = ((varyingColor2.z - productValue159) * varyingColor2.w) + productValue159;
    fragmentColor0.w = scalarValue27;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue163 = ceil(scalarValue27) * scalarValue27;
    float productValue164 = (((fragmentVectorConstants1.packedValues[2u].x * scalarValue24) - scalarValue24) * productValue163) + scalarValue24;
    float productValue165 = (((fragmentVectorConstants1.packedValues[2u].y * scalarValue25) - scalarValue25) * productValue163) + scalarValue25;
    float productValue166 = (((fragmentVectorConstants1.packedValues[2u].z * scalarValue26) - scalarValue26) * productValue163) + scalarValue26;
    float productValue167 = (((fragmentVectorConstants1.packedValues[0u].x - productValue164) * fragmentVectorConstants1.packedValues[0u].w) + productValue164) * varyingColor3.x;
    float productValue168 = (((fragmentVectorConstants1.packedValues[0u].y - productValue165) * fragmentVectorConstants1.packedValues[0u].w) + productValue165) * varyingColor3.y;
    float productValue169 = (((fragmentVectorConstants1.packedValues[0u].z - productValue166) * fragmentVectorConstants1.packedValues[0u].w) + productValue166) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue167) * varyingColor2.w) + productValue167;
    fragmentColor0.y = ((varyingColor2.y - productValue168) * varyingColor2.w) + productValue168;
    fragmentColor0.z = ((varyingColor2.z - productValue169) * varyingColor2.w) + productValue169;
    fragmentColor0.w = scalarValue27;
#endif
    discardIfRequested();
}
