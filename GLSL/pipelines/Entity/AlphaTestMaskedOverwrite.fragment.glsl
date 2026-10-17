#version 460
#extension GL_GOOGLE_include_directive : require
// Entity / AlphaTestMaskedOverwrite / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 18
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
#define RD_OPTION_SOURCE_INPUT_TYPE2 RD_SOURCE_INPUT_TYPE2_CONSTANT
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#elif (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#elif (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
#extension GL_EXT_spirv_intrinsics : require
#endif

#include "../../include/materials/Entity/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = fragmentScalarConstants1.packedValues[13u] + fragmentScalarConstants1.packedValues[12u];
    precise float sumValue1 = sumValue + fragmentScalarConstants1.packedValues[14u];
    precise float sumValue2 = 1.0 - fragmentScalarConstants1.packedValues[15u];
    precise float productValue9 = sumValue2 * sumValue1;
    float scalarValue = spvNClamp(ceil(productValue9), 0.0, 1.0);
    precise float sumValue3 = fragmentVectorConstants1.packedValues[2u].x - fragmentVectorConstants1.packedValues[3u].x;
    precise float sumValue4 = fragmentVectorConstants1.packedValues[2u].y - fragmentVectorConstants1.packedValues[3u].y;
    precise float sumValue5 = fragmentVectorConstants1.packedValues[2u].z - fragmentVectorConstants1.packedValues[3u].z;
    precise float sumValue6 = fragmentVectorConstants1.packedValues[2u].w - fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue7 = fma(scalarValue, sumValue3, fragmentVectorConstants1.packedValues[3u].x);
    float multiplyAddValue8 = fma(scalarValue, sumValue4, fragmentVectorConstants1.packedValues[3u].y);
    float multiplyAddValue9 = fma(scalarValue, sumValue5, fragmentVectorConstants1.packedValues[3u].z);
    float multiplyAddValue10 = fma(scalarValue, sumValue6, fragmentVectorConstants1.packedValues[3u].w);
    if (fragmentScalarConstants1.packedValues[4u] >= multiplyAddValue10)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    precise float sumValue10 = scalarValue6 + scalarValue5;
    precise float sumValue11 = scalarValue7 + sumValue10;
    precise float sumValue12 = 1.0 - scalarValue8;
    precise float productValue25 = sumValue12 * sumValue11;
    float scalarValue9 = spvNClamp(ceil(productValue25), 0.0, 1.0);
    precise float sumValue13 = fragmentVectorConstants1.packedValues[2u].x - scalarValue5;
    precise float sumValue14 = fragmentVectorConstants1.packedValues[2u].y - scalarValue6;
    precise float sumValue15 = fragmentVectorConstants1.packedValues[2u].z - scalarValue7;
    precise float sumValue16 = fragmentVectorConstants1.packedValues[2u].w - scalarValue8;
    float multiplyAddValue21 = fma(scalarValue9, sumValue13, scalarValue5);
    float multiplyAddValue22 = fma(scalarValue9, sumValue14, scalarValue6);
    float multiplyAddValue23 = fma(scalarValue9, sumValue15, scalarValue7);
    float multiplyAddValue24 = fma(scalarValue9, sumValue16, scalarValue8);
    if (fragmentScalarConstants1.packedValues[4u] >= multiplyAddValue24)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    if (fragmentScalarConstants1.packedValues[4u] >= fragmentScalarConstants1.packedValues[11u])
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float sumValue23 = fragmentScalarConstants1.packedValues[9u] + fragmentScalarConstants1.packedValues[8u];
    precise float sumValue24 = sumValue23 + fragmentScalarConstants1.packedValues[10u];
    precise float sumValue25 = 1.0 - fragmentScalarConstants1.packedValues[11u];
    precise float productValue41 = sumValue25 * sumValue24;
    float scalarValue10 = spvNClamp(ceil(productValue41), 0.0, 1.0);
    precise float sumValue26 = sampledTextureValue3.x - fragmentVectorConstants1.packedValues[2u].x;
    precise float sumValue27 = sampledTextureValue3.y - fragmentVectorConstants1.packedValues[2u].y;
    precise float sumValue28 = sampledTextureValue3.z - fragmentVectorConstants1.packedValues[2u].z;
    precise float sumValue29 = sampledTextureValue3.w - fragmentVectorConstants1.packedValues[2u].w;
    float multiplyAddValue41 = fma(scalarValue10, sumValue26, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue42 = fma(scalarValue10, sumValue27, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue43 = fma(scalarValue10, sumValue28, fragmentVectorConstants1.packedValues[2u].z);
    float multiplyAddValue44 = fma(scalarValue10, sumValue29, fragmentVectorConstants1.packedValues[2u].w);
    if (fragmentScalarConstants1.packedValues[4u] >= multiplyAddValue44)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    precise float sumValue10 = scalarValue6 + scalarValue5;
    precise float sumValue11 = scalarValue7 + sumValue10;
    precise float sumValue12 = 1.0 - scalarValue8;
    precise float productValue25 = sumValue12 * sumValue11;
    float scalarValue9 = spvNClamp(ceil(productValue25), 0.0, 1.0);
    precise float sumValue33 = sampledTextureValue3.x - scalarValue5;
    precise float sumValue34 = sampledTextureValue3.y - scalarValue6;
    precise float sumValue35 = sampledTextureValue3.z - scalarValue7;
    precise float sumValue36 = sampledTextureValue3.w - scalarValue8;
    float multiplyAddValue55 = fma(scalarValue9, sumValue33, scalarValue5);
    float multiplyAddValue56 = fma(scalarValue9, sumValue34, scalarValue6);
    float multiplyAddValue57 = fma(scalarValue9, sumValue35, scalarValue7);
    float multiplyAddValue58 = fma(scalarValue9, sumValue36, scalarValue8);
    if (fragmentScalarConstants1.packedValues[4u] >= multiplyAddValue58)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue3.x;
    float scalarValue16 = sampledTextureValue3.y;
    float scalarValue17 = sampledTextureValue3.z;
    float scalarValue18 = sampledTextureValue3.w;
    if (fragmentScalarConstants1.packedValues[4u] >= scalarValue18)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue8 = spvNClamp(ceil((1.0 - fragmentScalarConstants1.packedValues[15u]) * ((fragmentScalarConstants1.packedValues[13u] + fragmentScalarConstants1.packedValues[12u]) + fragmentScalarConstants1.packedValues[14u])), 0.0, 1.0);
    float multiplyAddValue = fma(productValue8, fragmentVectorConstants1.packedValues[2u].x - fragmentVectorConstants1.packedValues[3u].x, fragmentVectorConstants1.packedValues[3u].x);
    float multiplyAddValue1 = fma(productValue8, fragmentVectorConstants1.packedValues[2u].y - fragmentVectorConstants1.packedValues[3u].y, fragmentVectorConstants1.packedValues[3u].y);
    float multiplyAddValue2 = fma(productValue8, fragmentVectorConstants1.packedValues[2u].z - fragmentVectorConstants1.packedValues[3u].z, fragmentVectorConstants1.packedValues[3u].z);
    float multiplyAddValue3 = fma(productValue8, fragmentVectorConstants1.packedValues[2u].w - fragmentVectorConstants1.packedValues[3u].w, fragmentVectorConstants1.packedValues[3u].w);
    if (fragmentScalarConstants1.packedValues[4u] >= multiplyAddValue3)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float productValue24 = spvNClamp(ceil((1.0 - scalarValue8) * (scalarValue7 + (scalarValue6 + scalarValue5))), 0.0, 1.0);
    float multiplyAddValue14 = fma(productValue24, fragmentVectorConstants1.packedValues[2u].x - scalarValue5, scalarValue5);
    float multiplyAddValue15 = fma(productValue24, fragmentVectorConstants1.packedValues[2u].y - scalarValue6, scalarValue6);
    float multiplyAddValue16 = fma(productValue24, fragmentVectorConstants1.packedValues[2u].z - scalarValue7, scalarValue7);
    float multiplyAddValue17 = fma(productValue24, fragmentVectorConstants1.packedValues[2u].w - scalarValue8, scalarValue8);
    if (fragmentScalarConstants1.packedValues[4u] >= multiplyAddValue17)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue40 = spvNClamp(ceil((1.0 - fragmentScalarConstants1.packedValues[11u]) * ((fragmentScalarConstants1.packedValues[9u] + fragmentScalarConstants1.packedValues[8u]) + fragmentScalarConstants1.packedValues[10u])), 0.0, 1.0);
    float multiplyAddValue34 = fma(productValue40, sampledTextureValue3.x - fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue35 = fma(productValue40, sampledTextureValue3.y - fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue36 = fma(productValue40, sampledTextureValue3.z - fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z);
    float multiplyAddValue37 = fma(productValue40, sampledTextureValue3.w - fragmentVectorConstants1.packedValues[2u].w, fragmentVectorConstants1.packedValues[2u].w);
    if (fragmentScalarConstants1.packedValues[4u] >= multiplyAddValue37)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float productValue24 = spvNClamp(ceil((1.0 - scalarValue8) * (scalarValue7 + (scalarValue6 + scalarValue5))), 0.0, 1.0);
    float multiplyAddValue48 = fma(productValue24, sampledTextureValue3.x - scalarValue5, scalarValue5);
    float multiplyAddValue49 = fma(productValue24, sampledTextureValue3.y - scalarValue6, scalarValue6);
    float multiplyAddValue50 = fma(productValue24, sampledTextureValue3.z - scalarValue7, scalarValue7);
    float multiplyAddValue51 = fma(productValue24, sampledTextureValue3.w - scalarValue8, scalarValue8);
    if (fragmentScalarConstants1.packedValues[4u] >= multiplyAddValue51)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = spvNMin(spvNMax(ceil(((fragmentVectorConstants1.packedValues[3u].x + fragmentVectorConstants1.packedValues[3u].y) + fragmentVectorConstants1.packedValues[3u].z) * (1.0 - fragmentVectorConstants1.packedValues[3u].w)), 0.0), 1.0);
    float productValue1 = (productValue * (fragmentVectorConstants1.packedValues[2u].x - fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[3u].x;
    float productValue2 = (productValue * (fragmentVectorConstants1.packedValues[2u].y - fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[3u].y;
    float productValue3 = (productValue * (fragmentVectorConstants1.packedValues[2u].z - fragmentVectorConstants1.packedValues[3u].z)) + fragmentVectorConstants1.packedValues[3u].z;
    float productValue4 = (productValue * (fragmentVectorConstants1.packedValues[2u].w - fragmentVectorConstants1.packedValues[3u].w)) + fragmentVectorConstants1.packedValues[3u].w;
    if (!(!(productValue4 <= fragmentVectorConstants1.packedValues[1u].x)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.z;
    float scalarValue4 = sampledTextureValue.w;
    float productValue13 = spvNMin(spvNMax(ceil(((scalarValue1 + scalarValue2) + scalarValue3) * (1.0 - scalarValue4)), 0.0), 1.0);
    float productValue14 = (productValue13 * (fragmentVectorConstants1.packedValues[2u].x - scalarValue1)) + scalarValue1;
    float productValue15 = (productValue13 * (fragmentVectorConstants1.packedValues[2u].y - scalarValue2)) + scalarValue2;
    float productValue16 = (productValue13 * (fragmentVectorConstants1.packedValues[2u].z - scalarValue3)) + scalarValue3;
    float productValue17 = (productValue13 * (fragmentVectorConstants1.packedValues[2u].w - scalarValue4)) + scalarValue4;
    if (!(!(productValue17 <= fragmentVectorConstants1.packedValues[1u].x)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    if (!(!(fragmentVectorConstants1.packedValues[2u].w <= fragmentVectorConstants1.packedValues[1u].x)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue29 = spvNMin(spvNMax(ceil(((fragmentVectorConstants1.packedValues[2u].x + fragmentVectorConstants1.packedValues[2u].y) + fragmentVectorConstants1.packedValues[2u].z) * (1.0 - fragmentVectorConstants1.packedValues[2u].w)), 0.0), 1.0);
    float productValue30 = (productValue29 * (sampledTextureValue2.x - fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[2u].x;
    float productValue31 = (productValue29 * (sampledTextureValue2.y - fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[2u].y;
    float productValue32 = (productValue29 * (sampledTextureValue2.z - fragmentVectorConstants1.packedValues[2u].z)) + fragmentVectorConstants1.packedValues[2u].z;
    float productValue33 = (productValue29 * (sampledTextureValue2.w - fragmentVectorConstants1.packedValues[2u].w)) + fragmentVectorConstants1.packedValues[2u].w;
    if (!(!(productValue33 <= fragmentVectorConstants1.packedValues[1u].x)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.z;
    float scalarValue4 = sampledTextureValue.w;
    float productValue13 = spvNMin(spvNMax(ceil(((scalarValue1 + scalarValue2) + scalarValue3) * (1.0 - scalarValue4)), 0.0), 1.0);
    float productValue45 = (productValue13 * (sampledTextureValue2.x - scalarValue1)) + scalarValue1;
    float productValue46 = (productValue13 * (sampledTextureValue2.y - scalarValue2)) + scalarValue2;
    float productValue47 = (productValue13 * (sampledTextureValue2.z - scalarValue3)) + scalarValue3;
    float productValue48 = (productValue13 * (sampledTextureValue2.w - scalarValue4)) + scalarValue4;
    if (!(!(productValue48 <= fragmentVectorConstants1.packedValues[1u].x)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue2.x;
    float scalarValue12 = sampledTextureValue2.y;
    float scalarValue13 = sampledTextureValue2.z;
    float scalarValue14 = sampledTextureValue2.w;
    if (!(!(scalarValue14 <= fragmentVectorConstants1.packedValues[1u].x)))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue7 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue7;
    precise float sumValue8 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue8;
    precise float sumValue9 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue9;
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[3u], sumValue7, multiplyAddValue7);
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[3u], sumValue8, multiplyAddValue8);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[3u], sumValue9, multiplyAddValue9);
    precise float productValue10 = multiplyAddValue11 * varyingColor3.x;
    precise float productValue11 = multiplyAddValue12 * varyingColor3.y;
    precise float productValue12 = multiplyAddValue13 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue11, varyingColor3.x, varyingColor2.x), productValue10);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue12, varyingColor3.y, varyingColor2.y), productValue11);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue13, varyingColor3.z, varyingColor2.z), productValue12);
    fragmentColor0.w = multiplyAddValue10;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue17 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue21;
    precise float sumValue18 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue22;
    precise float sumValue19 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue23;
    float multiplyAddValue25 = fma(fragmentScalarConstants1.packedValues[3u], sumValue17, multiplyAddValue21);
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[3u], sumValue18, multiplyAddValue22);
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[3u], sumValue19, multiplyAddValue23);
    precise float productValue26 = multiplyAddValue25 * varyingColor3.x;
    precise float productValue27 = multiplyAddValue26 * varyingColor3.y;
    precise float productValue28 = multiplyAddValue27 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue25, varyingColor3.x, varyingColor2.x), productValue26);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue26, varyingColor3.y, varyingColor2.y), productValue27);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue27, varyingColor3.z, varyingColor2.z), productValue28);
    fragmentColor0.w = multiplyAddValue24;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue20 = fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[2u].x;
    precise float sumValue21 = fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[2u].y;
    precise float sumValue22 = fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[2u].z;
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[3u], sumValue20, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[3u], sumValue21, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue33 = fma(fragmentScalarConstants1.packedValues[3u], sumValue22, fragmentVectorConstants1.packedValues[2u].z);
    precise float productValue37 = multiplyAddValue31 * varyingColor3.x;
    precise float productValue38 = multiplyAddValue32 * varyingColor3.y;
    precise float productValue39 = multiplyAddValue33 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue31, varyingColor3.x, varyingColor2.x), productValue37);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue32, varyingColor3.y, varyingColor2.y), productValue38);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue33, varyingColor3.z, varyingColor2.z), productValue39);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue30 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue41;
    precise float sumValue31 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue42;
    precise float sumValue32 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue43;
    float multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[3u], sumValue30, multiplyAddValue41);
    float multiplyAddValue46 = fma(fragmentScalarConstants1.packedValues[3u], sumValue31, multiplyAddValue42);
    float multiplyAddValue47 = fma(fragmentScalarConstants1.packedValues[3u], sumValue32, multiplyAddValue43);
    precise float productValue42 = multiplyAddValue45 * varyingColor3.x;
    precise float productValue43 = multiplyAddValue46 * varyingColor3.y;
    precise float productValue44 = multiplyAddValue47 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue45, varyingColor3.x, varyingColor2.x), productValue42);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue46, varyingColor3.y, varyingColor2.y), productValue43);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue47, varyingColor3.z, varyingColor2.z), productValue44);
    fragmentColor0.w = multiplyAddValue44;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue37 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue55;
    precise float sumValue38 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue56;
    precise float sumValue39 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue57;
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[3u], sumValue37, multiplyAddValue55);
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[3u], sumValue38, multiplyAddValue56);
    float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[3u], sumValue39, multiplyAddValue57);
    precise float productValue52 = multiplyAddValue59 * varyingColor3.x;
    precise float productValue53 = multiplyAddValue60 * varyingColor3.y;
    precise float productValue54 = multiplyAddValue61 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue59, varyingColor3.x, varyingColor2.x), productValue52);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue60, varyingColor3.y, varyingColor2.y), productValue53);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue61, varyingColor3.z, varyingColor2.z), productValue54);
    fragmentColor0.w = multiplyAddValue58;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue40 = fragmentVectorConstants1.packedValues[0u].x - scalarValue15;
    precise float sumValue41 = fragmentVectorConstants1.packedValues[0u].y - scalarValue16;
    precise float sumValue42 = fragmentVectorConstants1.packedValues[0u].z - scalarValue17;
    float multiplyAddValue62 = fma(fragmentScalarConstants1.packedValues[3u], sumValue40, scalarValue15);
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[3u], sumValue41, scalarValue16);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[3u], sumValue42, scalarValue17);
    precise float productValue58 = multiplyAddValue62 * varyingColor3.x;
    precise float productValue59 = multiplyAddValue63 * varyingColor3.y;
    precise float productValue60 = multiplyAddValue64 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue62, varyingColor3.x, varyingColor2.x), productValue58);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue63, varyingColor3.y, varyingColor2.y), productValue59);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue64, varyingColor3.z, varyingColor2.z), productValue60);
    fragmentColor0.w = scalarValue18;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue, multiplyAddValue);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue1, multiplyAddValue1);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue2, multiplyAddValue2);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue4, varyingColor3.x, varyingColor2.x), multiplyAddValue4 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue5, varyingColor3.y, varyingColor2.y), multiplyAddValue5 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue6, varyingColor3.z, varyingColor2.z), multiplyAddValue6 * varyingColor3.z);
    fragmentColor0.w = multiplyAddValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue14, multiplyAddValue14);
    float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue15, multiplyAddValue15);
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue16, multiplyAddValue16);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue18, varyingColor3.x, varyingColor2.x), multiplyAddValue18 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue19, varyingColor3.y, varyingColor2.y), multiplyAddValue19 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue20, varyingColor3.z, varyingColor2.z), multiplyAddValue20 * varyingColor3.z);
    fragmentColor0.w = multiplyAddValue17;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue28, varyingColor3.x, varyingColor2.x), multiplyAddValue28 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue29, varyingColor3.y, varyingColor2.y), multiplyAddValue29 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue30, varyingColor3.z, varyingColor2.z), multiplyAddValue30 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue38 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue34, multiplyAddValue34);
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue35, multiplyAddValue35);
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue36, multiplyAddValue36);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue38, varyingColor3.x, varyingColor2.x), multiplyAddValue38 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue39, varyingColor3.y, varyingColor2.y), multiplyAddValue39 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue40, varyingColor3.z, varyingColor2.z), multiplyAddValue40 * varyingColor3.z);
    fragmentColor0.w = multiplyAddValue37;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue48, multiplyAddValue48);
    float multiplyAddValue53 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue49, multiplyAddValue49);
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue50, multiplyAddValue50);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue52, varyingColor3.x, varyingColor2.x), multiplyAddValue52 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue53, varyingColor3.y, varyingColor2.y), multiplyAddValue53 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue54, varyingColor3.z, varyingColor2.z), multiplyAddValue54 * varyingColor3.z);
    fragmentColor0.w = multiplyAddValue51;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - scalarValue15, scalarValue15);
    float multiplyAddValue66 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - scalarValue16, scalarValue16);
    float multiplyAddValue67 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - scalarValue17, scalarValue17);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue65, varyingColor3.x, varyingColor2.x), multiplyAddValue65 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue66, varyingColor3.y, varyingColor2.y), multiplyAddValue66 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue67, varyingColor3.z, varyingColor2.z), multiplyAddValue67 * varyingColor3.z);
    fragmentColor0.w = scalarValue18;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue5 = (((fragmentVectorConstants1.packedValues[0u].x - productValue1) * fragmentVectorConstants1.packedValues[0u].w) + productValue1) * varyingColor3.x;
    float productValue6 = (((fragmentVectorConstants1.packedValues[0u].y - productValue2) * fragmentVectorConstants1.packedValues[0u].w) + productValue2) * varyingColor3.y;
    float productValue7 = (((fragmentVectorConstants1.packedValues[0u].z - productValue3) * fragmentVectorConstants1.packedValues[0u].w) + productValue3) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.y = ((varyingColor2.y - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.z = ((varyingColor2.z - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.w = productValue4;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue18 = (((fragmentVectorConstants1.packedValues[0u].x - productValue14) * fragmentVectorConstants1.packedValues[0u].w) + productValue14) * varyingColor3.x;
    float productValue19 = (((fragmentVectorConstants1.packedValues[0u].y - productValue15) * fragmentVectorConstants1.packedValues[0u].w) + productValue15) * varyingColor3.y;
    float productValue20 = (((fragmentVectorConstants1.packedValues[0u].z - productValue16) * fragmentVectorConstants1.packedValues[0u].w) + productValue16) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue18) * varyingColor2.w) + productValue18;
    fragmentColor0.y = ((varyingColor2.y - productValue19) * varyingColor2.w) + productValue19;
    fragmentColor0.z = ((varyingColor2.z - productValue20) * varyingColor2.w) + productValue20;
    fragmentColor0.w = productValue17;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue21 = (((fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[2u].x) * varyingColor3.x;
    float productValue22 = (((fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[2u].y) * varyingColor3.y;
    float productValue23 = (((fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[2u].z) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue21) * varyingColor2.w) + productValue21;
    fragmentColor0.y = ((varyingColor2.y - productValue22) * varyingColor2.w) + productValue22;
    fragmentColor0.z = ((varyingColor2.z - productValue23) * varyingColor2.w) + productValue23;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue34 = (((fragmentVectorConstants1.packedValues[0u].x - productValue30) * fragmentVectorConstants1.packedValues[0u].w) + productValue30) * varyingColor3.x;
    float productValue35 = (((fragmentVectorConstants1.packedValues[0u].y - productValue31) * fragmentVectorConstants1.packedValues[0u].w) + productValue31) * varyingColor3.y;
    float productValue36 = (((fragmentVectorConstants1.packedValues[0u].z - productValue32) * fragmentVectorConstants1.packedValues[0u].w) + productValue32) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue34) * varyingColor2.w) + productValue34;
    fragmentColor0.y = ((varyingColor2.y - productValue35) * varyingColor2.w) + productValue35;
    fragmentColor0.z = ((varyingColor2.z - productValue36) * varyingColor2.w) + productValue36;
    fragmentColor0.w = productValue33;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue49 = (((fragmentVectorConstants1.packedValues[0u].x - productValue45) * fragmentVectorConstants1.packedValues[0u].w) + productValue45) * varyingColor3.x;
    float productValue50 = (((fragmentVectorConstants1.packedValues[0u].y - productValue46) * fragmentVectorConstants1.packedValues[0u].w) + productValue46) * varyingColor3.y;
    float productValue51 = (((fragmentVectorConstants1.packedValues[0u].z - productValue47) * fragmentVectorConstants1.packedValues[0u].w) + productValue47) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue49) * varyingColor2.w) + productValue49;
    fragmentColor0.y = ((varyingColor2.y - productValue50) * varyingColor2.w) + productValue50;
    fragmentColor0.z = ((varyingColor2.z - productValue51) * varyingColor2.w) + productValue51;
    fragmentColor0.w = productValue48;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue55 = (((fragmentVectorConstants1.packedValues[0u].x - scalarValue11) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue11) * varyingColor3.x;
    float productValue56 = (((fragmentVectorConstants1.packedValues[0u].y - scalarValue12) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue12) * varyingColor3.y;
    float productValue57 = (((fragmentVectorConstants1.packedValues[0u].z - scalarValue13) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue13) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue55) * varyingColor2.w) + productValue55;
    fragmentColor0.y = ((varyingColor2.y - productValue56) * varyingColor2.w) + productValue56;
    fragmentColor0.z = ((varyingColor2.z - productValue57) * varyingColor2.w) + productValue57;
    fragmentColor0.w = scalarValue14;
#endif
    discardIfRequested();
}
