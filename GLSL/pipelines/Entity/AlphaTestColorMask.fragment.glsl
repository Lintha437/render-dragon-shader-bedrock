#version 460
#extension GL_GOOGLE_include_directive : require
// Entity / AlphaTestColorMask / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 3
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/Entity/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    if (fragmentScalarConstants1.packedValues[7u] <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue3.x;
    float scalarValue5 = sampledTextureValue3.y;
    float scalarValue6 = sampledTextureValue3.z;
    float scalarValue7 = sampledTextureValue3.w;
    if (scalarValue7 <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    if (!(!(fragmentVectorConstants1.packedValues[1u].w <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (!(!(fragmentVectorConstants1.packedValues[1u].w <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue2.x;
    float scalarValue1 = sampledTextureValue2.y;
    float scalarValue2 = sampledTextureValue2.z;
    float scalarValue3 = sampledTextureValue2.w;
    if (!(!(scalarValue3 <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue2.x;
    float scalarValue1 = sampledTextureValue2.y;
    float scalarValue2 = sampledTextureValue2.z;
    float scalarValue3 = sampledTextureValue2.w;
    vec4 sampledTextureValue = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (!(!(scalarValue3 <= 0.0)))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    precise float productValue6 = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[11u];
    fragmentColor0.w = productValue6;
    precise float sumValue = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue1;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue2;
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[3u], sumValue, multiplyAddValue);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[3u], sumValue1, multiplyAddValue1);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[3u], sumValue2, multiplyAddValue2);
    precise float productValue7 = multiplyAddValue3 * varyingColor3.x;
    precise float productValue8 = multiplyAddValue4 * varyingColor3.y;
    precise float productValue9 = multiplyAddValue5 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue3, varyingColor3.x, varyingColor2.x), productValue7);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue4, varyingColor3.y, varyingColor2.y), productValue8);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue5, varyingColor3.z, varyingColor2.z), productValue9);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue1.x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue1.y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue1.z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    precise float productValue16 = sampledTextureValue1.w * fragmentScalarConstants1.packedValues[7u];
    fragmentColor0.w = productValue16;
    precise float sumValue3 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue9;
    precise float sumValue4 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue10;
    precise float sumValue5 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue11;
    float multiplyAddValue15 = fma(fragmentScalarConstants1.packedValues[3u], sumValue3, multiplyAddValue9);
    float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[3u], sumValue4, multiplyAddValue10);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[3u], sumValue5, multiplyAddValue11);
    precise float productValue17 = multiplyAddValue15 * varyingColor3.x;
    precise float productValue18 = multiplyAddValue16 * varyingColor3.y;
    precise float productValue19 = multiplyAddValue17 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue15, varyingColor3.x, varyingColor2.x), productValue17);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue16, varyingColor3.y, varyingColor2.y), productValue18);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue17, varyingColor3.z, varyingColor2.z), productValue19);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[1u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[1u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[1u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    precise float productValue26 = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[7u];
    fragmentColor0.w = productValue26;
    precise float sumValue6 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue18;
    precise float sumValue7 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue19;
    precise float sumValue8 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue20;
    float multiplyAddValue24 = fma(fragmentScalarConstants1.packedValues[3u], sumValue6, multiplyAddValue18);
    float multiplyAddValue25 = fma(fragmentScalarConstants1.packedValues[3u], sumValue7, multiplyAddValue19);
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[3u], sumValue8, multiplyAddValue20);
    precise float productValue27 = multiplyAddValue24 * varyingColor3.x;
    precise float productValue28 = multiplyAddValue25 * varyingColor3.y;
    precise float productValue29 = multiplyAddValue26 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue24, varyingColor3.x, varyingColor2.x), productValue27);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue25, varyingColor3.y, varyingColor2.y), productValue28);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue26, varyingColor3.z, varyingColor2.z), productValue29);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue27 = fma(scalarValue7, fma(scalarValue4, fragmentVectorConstants1.packedValues[1u].x, -scalarValue4), scalarValue4);
    float multiplyAddValue28 = fma(scalarValue7, fma(scalarValue5, fragmentVectorConstants1.packedValues[1u].y, -scalarValue5), scalarValue5);
    float multiplyAddValue29 = fma(scalarValue7, fma(scalarValue6, fragmentVectorConstants1.packedValues[1u].z, -scalarValue6), scalarValue6);
    precise float productValue36 = scalarValue7 * fragmentScalarConstants1.packedValues[7u];
    fragmentColor0.w = productValue36;
    precise float sumValue9 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue27;
    precise float sumValue10 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue28;
    precise float sumValue11 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue29;
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[3u], sumValue9, multiplyAddValue27);
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[3u], sumValue10, multiplyAddValue28);
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[3u], sumValue11, multiplyAddValue29);
    precise float productValue37 = multiplyAddValue30 * varyingColor3.x;
    precise float productValue38 = multiplyAddValue31 * varyingColor3.y;
    precise float productValue39 = multiplyAddValue32 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue30, varyingColor3.x, varyingColor2.x), productValue37);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue31, varyingColor3.y, varyingColor2.y), productValue38);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue32, varyingColor3.z, varyingColor2.z), productValue39);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue36 = fma(scalarValue7, fma(scalarValue4, sampledTextureValue1.x, -scalarValue4), scalarValue4);
    float multiplyAddValue37 = fma(scalarValue7, fma(scalarValue5, sampledTextureValue1.y, -scalarValue5), scalarValue5);
    float multiplyAddValue38 = fma(scalarValue7, fma(scalarValue6, sampledTextureValue1.z, -scalarValue6), scalarValue6);
    precise float productValue46 = scalarValue7 * sampledTextureValue1.w;
    fragmentColor0.w = productValue46;
    precise float sumValue12 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue36;
    precise float sumValue13 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue37;
    precise float sumValue14 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue38;
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[3u], sumValue12, multiplyAddValue36);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[3u], sumValue13, multiplyAddValue37);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[3u], sumValue14, multiplyAddValue38);
    precise float productValue47 = multiplyAddValue42 * varyingColor3.x;
    precise float productValue48 = multiplyAddValue43 * varyingColor3.y;
    precise float productValue49 = multiplyAddValue44 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue42, varyingColor3.x, varyingColor2.x), productValue47);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue43, varyingColor3.y, varyingColor2.y), productValue48);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue44, varyingColor3.z, varyingColor2.z), productValue49);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue45 = fma(scalarValue7, fma(scalarValue4, scalarValue4, -scalarValue4), scalarValue4);
    float multiplyAddValue46 = fma(scalarValue7, fma(scalarValue5, scalarValue5, -scalarValue5), scalarValue5);
    float multiplyAddValue47 = fma(scalarValue7, fma(scalarValue6, scalarValue6, -scalarValue6), scalarValue6);
    precise float productValue56 = scalarValue7 * scalarValue7;
    fragmentColor0.w = productValue56;
    precise float sumValue15 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue45;
    precise float sumValue16 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue46;
    precise float sumValue17 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue47;
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[3u], sumValue15, multiplyAddValue45);
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[3u], sumValue16, multiplyAddValue46);
    float multiplyAddValue53 = fma(fragmentScalarConstants1.packedValues[3u], sumValue17, multiplyAddValue47);
    precise float productValue57 = multiplyAddValue51 * varyingColor3.x;
    precise float productValue58 = multiplyAddValue52 * varyingColor3.y;
    precise float productValue59 = multiplyAddValue53 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue51, varyingColor3.x, varyingColor2.x), productValue57);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue52, varyingColor3.y, varyingColor2.y), productValue58);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue53, varyingColor3.z, varyingColor2.z), productValue59);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[11u];
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue, multiplyAddValue);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue1, multiplyAddValue1);
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue2, multiplyAddValue2);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue6, varyingColor3.x, varyingColor2.x), multiplyAddValue6 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue7, varyingColor3.y, varyingColor2.y), multiplyAddValue7 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue8, varyingColor3.z, varyingColor2.z), multiplyAddValue8 * varyingColor3.z);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue1.x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue1.y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue1.z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    fragmentColor0.w = sampledTextureValue1.w * fragmentScalarConstants1.packedValues[7u];
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue9, multiplyAddValue9);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue10, multiplyAddValue10);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue11, multiplyAddValue11);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue12, varyingColor3.x, varyingColor2.x), multiplyAddValue12 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue13, varyingColor3.y, varyingColor2.y), multiplyAddValue13 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue14, varyingColor3.z, varyingColor2.z), multiplyAddValue14 * varyingColor3.z);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[1u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[1u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[1u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[7u];
    float multiplyAddValue21 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue18, multiplyAddValue18);
    float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue19, multiplyAddValue19);
    float multiplyAddValue23 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue20, multiplyAddValue20);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue21, varyingColor3.x, varyingColor2.x), multiplyAddValue21 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue22, varyingColor3.y, varyingColor2.y), multiplyAddValue22 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue23, varyingColor3.z, varyingColor2.z), multiplyAddValue23 * varyingColor3.z);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue27 = fma(scalarValue7, fma(scalarValue4, fragmentVectorConstants1.packedValues[1u].x, -scalarValue4), scalarValue4);
    float multiplyAddValue28 = fma(scalarValue7, fma(scalarValue5, fragmentVectorConstants1.packedValues[1u].y, -scalarValue5), scalarValue5);
    float multiplyAddValue29 = fma(scalarValue7, fma(scalarValue6, fragmentVectorConstants1.packedValues[1u].z, -scalarValue6), scalarValue6);
    fragmentColor0.w = scalarValue7 * fragmentScalarConstants1.packedValues[7u];
    float multiplyAddValue33 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue27, multiplyAddValue27);
    float multiplyAddValue34 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue28, multiplyAddValue28);
    float multiplyAddValue35 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue29, multiplyAddValue29);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue33, varyingColor3.x, varyingColor2.x), multiplyAddValue33 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue34, varyingColor3.y, varyingColor2.y), multiplyAddValue34 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue35, varyingColor3.z, varyingColor2.z), multiplyAddValue35 * varyingColor3.z);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue36 = fma(scalarValue7, fma(scalarValue4, sampledTextureValue1.x, -scalarValue4), scalarValue4);
    float multiplyAddValue37 = fma(scalarValue7, fma(scalarValue5, sampledTextureValue1.y, -scalarValue5), scalarValue5);
    float multiplyAddValue38 = fma(scalarValue7, fma(scalarValue6, sampledTextureValue1.z, -scalarValue6), scalarValue6);
    fragmentColor0.w = scalarValue7 * sampledTextureValue1.w;
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue36, multiplyAddValue36);
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue37, multiplyAddValue37);
    float multiplyAddValue41 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue38, multiplyAddValue38);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue39, varyingColor3.x, varyingColor2.x), multiplyAddValue39 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue40, varyingColor3.y, varyingColor2.y), multiplyAddValue40 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue41, varyingColor3.z, varyingColor2.z), multiplyAddValue41 * varyingColor3.z);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue45 = fma(scalarValue7, fma(scalarValue4, scalarValue4, -scalarValue4), scalarValue4);
    float multiplyAddValue46 = fma(scalarValue7, fma(scalarValue5, scalarValue5, -scalarValue5), scalarValue5);
    float multiplyAddValue47 = fma(scalarValue7, fma(scalarValue6, scalarValue6, -scalarValue6), scalarValue6);
    fragmentColor0.w = scalarValue7 * scalarValue7;
    float multiplyAddValue48 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue45, multiplyAddValue45);
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue46, multiplyAddValue46);
    float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue47, multiplyAddValue47);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue48, varyingColor3.x, varyingColor2.x), multiplyAddValue48 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue49, varyingColor3.y, varyingColor2.y), multiplyAddValue49 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue50, varyingColor3.z, varyingColor2.z), multiplyAddValue50 * varyingColor3.z);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (((fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[1u].x) - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue1 = (((fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[1u].y) - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue2 = (((fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[1u].z) - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue3 = (((fragmentVectorConstants1.packedValues[0u].x - productValue) * fragmentVectorConstants1.packedValues[0u].w) + productValue) * varyingColor3.x;
    float productValue4 = (((fragmentVectorConstants1.packedValues[0u].y - productValue1) * fragmentVectorConstants1.packedValues[0u].w) + productValue1) * varyingColor3.y;
    float productValue5 = (((fragmentVectorConstants1.packedValues[0u].z - productValue2) * fragmentVectorConstants1.packedValues[0u].w) + productValue2) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].w * fragmentVectorConstants1.packedValues[1u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue10 = (((sampledTextureValue.x * fragmentVectorConstants1.packedValues[1u].x) - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue11 = (((sampledTextureValue.y * fragmentVectorConstants1.packedValues[1u].y) - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue12 = (((sampledTextureValue.z * fragmentVectorConstants1.packedValues[1u].z) - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue13 = (((fragmentVectorConstants1.packedValues[0u].x - productValue10) * fragmentVectorConstants1.packedValues[0u].w) + productValue10) * varyingColor3.x;
    float productValue14 = (((fragmentVectorConstants1.packedValues[0u].y - productValue11) * fragmentVectorConstants1.packedValues[0u].w) + productValue11) * varyingColor3.y;
    float productValue15 = (((fragmentVectorConstants1.packedValues[0u].z - productValue12) * fragmentVectorConstants1.packedValues[0u].w) + productValue12) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.y = ((varyingColor2.y - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.z = ((varyingColor2.z - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.w = sampledTextureValue.w * fragmentVectorConstants1.packedValues[1u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue20 = (((fragmentVectorConstants1.packedValues[1u].x * fragmentVectorConstants1.packedValues[1u].x) - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue21 = (((fragmentVectorConstants1.packedValues[1u].y * fragmentVectorConstants1.packedValues[1u].y) - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue22 = (((fragmentVectorConstants1.packedValues[1u].z * fragmentVectorConstants1.packedValues[1u].z) - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue23 = (((fragmentVectorConstants1.packedValues[0u].x - productValue20) * fragmentVectorConstants1.packedValues[0u].w) + productValue20) * varyingColor3.x;
    float productValue24 = (((fragmentVectorConstants1.packedValues[0u].y - productValue21) * fragmentVectorConstants1.packedValues[0u].w) + productValue21) * varyingColor3.y;
    float productValue25 = (((fragmentVectorConstants1.packedValues[0u].z - productValue22) * fragmentVectorConstants1.packedValues[0u].w) + productValue22) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue23) * varyingColor2.w) + productValue23;
    fragmentColor0.y = ((varyingColor2.y - productValue24) * varyingColor2.w) + productValue24;
    fragmentColor0.z = ((varyingColor2.z - productValue25) * varyingColor2.w) + productValue25;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].w * fragmentVectorConstants1.packedValues[1u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue30 = (((fragmentVectorConstants1.packedValues[1u].x * scalarValue) - scalarValue) * scalarValue3) + scalarValue;
    float productValue31 = (((fragmentVectorConstants1.packedValues[1u].y * scalarValue1) - scalarValue1) * scalarValue3) + scalarValue1;
    float productValue32 = (((fragmentVectorConstants1.packedValues[1u].z * scalarValue2) - scalarValue2) * scalarValue3) + scalarValue2;
    float productValue33 = (((fragmentVectorConstants1.packedValues[0u].x - productValue30) * fragmentVectorConstants1.packedValues[0u].w) + productValue30) * varyingColor3.x;
    float productValue34 = (((fragmentVectorConstants1.packedValues[0u].y - productValue31) * fragmentVectorConstants1.packedValues[0u].w) + productValue31) * varyingColor3.y;
    float productValue35 = (((fragmentVectorConstants1.packedValues[0u].z - productValue32) * fragmentVectorConstants1.packedValues[0u].w) + productValue32) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue33) * varyingColor2.w) + productValue33;
    fragmentColor0.y = ((varyingColor2.y - productValue34) * varyingColor2.w) + productValue34;
    fragmentColor0.z = ((varyingColor2.z - productValue35) * varyingColor2.w) + productValue35;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].w * scalarValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue40 = (((sampledTextureValue.x * scalarValue) - scalarValue) * scalarValue3) + scalarValue;
    float productValue41 = (((sampledTextureValue.y * scalarValue1) - scalarValue1) * scalarValue3) + scalarValue1;
    float productValue42 = (((sampledTextureValue.z * scalarValue2) - scalarValue2) * scalarValue3) + scalarValue2;
    float productValue43 = (((fragmentVectorConstants1.packedValues[0u].x - productValue40) * fragmentVectorConstants1.packedValues[0u].w) + productValue40) * varyingColor3.x;
    float productValue44 = (((fragmentVectorConstants1.packedValues[0u].y - productValue41) * fragmentVectorConstants1.packedValues[0u].w) + productValue41) * varyingColor3.y;
    float productValue45 = (((fragmentVectorConstants1.packedValues[0u].z - productValue42) * fragmentVectorConstants1.packedValues[0u].w) + productValue42) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue43) * varyingColor2.w) + productValue43;
    fragmentColor0.y = ((varyingColor2.y - productValue44) * varyingColor2.w) + productValue44;
    fragmentColor0.z = ((varyingColor2.z - productValue45) * varyingColor2.w) + productValue45;
    fragmentColor0.w = sampledTextureValue.w * scalarValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue50 = (((scalarValue * scalarValue) - scalarValue) * scalarValue3) + scalarValue;
    float productValue51 = (((scalarValue1 * scalarValue1) - scalarValue1) * scalarValue3) + scalarValue1;
    float productValue52 = (((scalarValue2 * scalarValue2) - scalarValue2) * scalarValue3) + scalarValue2;
    float productValue53 = (((fragmentVectorConstants1.packedValues[0u].x - productValue50) * fragmentVectorConstants1.packedValues[0u].w) + productValue50) * varyingColor3.x;
    float productValue54 = (((fragmentVectorConstants1.packedValues[0u].y - productValue51) * fragmentVectorConstants1.packedValues[0u].w) + productValue51) * varyingColor3.y;
    float productValue55 = (((fragmentVectorConstants1.packedValues[0u].z - productValue52) * fragmentVectorConstants1.packedValues[0u].w) + productValue52) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue53) * varyingColor2.w) + productValue53;
    fragmentColor0.y = ((varyingColor2.y - productValue54) * varyingColor2.w) + productValue54;
    fragmentColor0.z = ((varyingColor2.z - productValue55) * varyingColor2.w) + productValue55;
    fragmentColor0.w = scalarValue3 * scalarValue3;
#endif
    discardIfRequested();
}
