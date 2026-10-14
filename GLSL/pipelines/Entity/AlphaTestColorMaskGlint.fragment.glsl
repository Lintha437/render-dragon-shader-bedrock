#version 460
#extension GL_GOOGLE_include_directive : require
// Entity / AlphaTestColorMaskGlint / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 20
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/Entity/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    if (fragmentScalarConstants1.packedValues[11u] <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue7.x;
    float scalarValue9 = sampledTextureValue7.y;
    float scalarValue10 = sampledTextureValue7.z;
    float scalarValue11 = sampledTextureValue7.w;
    if (scalarValue11 <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    if (!(!(fragmentVectorConstants1.packedValues[2u].w <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (!(!(fragmentVectorConstants1.packedValues[2u].w <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue6 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue6.x;
    float scalarValue5 = sampledTextureValue6.y;
    float scalarValue6 = sampledTextureValue6.z;
    float scalarValue7 = sampledTextureValue6.w;
    if (!(!(scalarValue7 <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue6 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue6.x;
    float scalarValue5 = sampledTextureValue6.y;
    float scalarValue6 = sampledTextureValue6.z;
    float scalarValue7 = sampledTextureValue6.w;
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (!(!(scalarValue7 <= 0.0)))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[3u].x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[3u].y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z);
    precise float sumValue = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue1;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue2;
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[3u], sumValue, multiplyAddValue);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[3u], sumValue1, multiplyAddValue1);
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[3u], sumValue2, multiplyAddValue2);
    precise float productValue9 = multiplyAddValue9 * varyingColor3.x;
    precise float productValue10 = multiplyAddValue10 * varyingColor3.y;
    precise float productValue11 = multiplyAddValue11 * varyingColor3.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    precise float productValue12 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue13 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue14 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue15 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].w;
    precise float multiplyAddValue12 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, productValue12) * fragmentVectorConstants1.packedValues[4u].x;
    precise float multiplyAddValue13 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, productValue13) * fragmentVectorConstants1.packedValues[4u].y;
    precise float multiplyAddValue14 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, productValue14) * fragmentVectorConstants1.packedValues[4u].z;
    precise float multiplyAddValue15 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, productValue15) * fragmentVectorConstants1.packedValues[4u].w;
    precise float productValue16 = multiplyAddValue12 * multiplyAddValue12;
    precise float productValue17 = multiplyAddValue13 * multiplyAddValue13;
    precise float productValue18 = multiplyAddValue14 * multiplyAddValue14;
    precise float multiplyAddValue16 = fma(varyingColor2.w, fma(-multiplyAddValue9, varyingColor3.x, varyingColor2.x), productValue9) + productValue16;
    precise float multiplyAddValue17 = fma(varyingColor2.w, fma(-multiplyAddValue10, varyingColor3.y, varyingColor2.y), productValue10) + productValue17;
    precise float multiplyAddValue18 = fma(varyingColor2.w, fma(-multiplyAddValue11, varyingColor3.z, varyingColor2.z), productValue11) + productValue18;
    precise float sumValue3 = abs(multiplyAddValue15) + 0.0;
    fragmentColor0.x = multiplyAddValue16;
    fragmentColor0.y = multiplyAddValue17;
    fragmentColor0.z = multiplyAddValue18;
    fragmentColor0.w = sumValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, sampledTextureValue5.x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, sampledTextureValue5.y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue21 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, sampledTextureValue5.z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z);
    precise float sumValue4 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue19;
    precise float sumValue5 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue20;
    precise float sumValue6 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue21;
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[3u], sumValue4, multiplyAddValue19);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[3u], sumValue5, multiplyAddValue20);
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[3u], sumValue6, multiplyAddValue21);
    precise float productValue34 = multiplyAddValue28 * varyingColor3.x;
    precise float productValue35 = multiplyAddValue29 * varyingColor3.y;
    precise float productValue36 = multiplyAddValue30 * varyingColor3.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    precise float productValue12 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue13 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue14 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue15 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].w;
    precise float multiplyAddValue31 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, productValue12) * fragmentVectorConstants1.packedValues[3u].x;
    precise float multiplyAddValue32 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, productValue13) * fragmentVectorConstants1.packedValues[3u].y;
    precise float multiplyAddValue33 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, productValue14) * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue34 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, productValue15) * fragmentVectorConstants1.packedValues[3u].w;
    precise float productValue37 = multiplyAddValue31 * multiplyAddValue31;
    precise float productValue38 = multiplyAddValue32 * multiplyAddValue32;
    precise float productValue39 = multiplyAddValue33 * multiplyAddValue33;
    precise float multiplyAddValue35 = fma(varyingColor2.w, fma(-multiplyAddValue28, varyingColor3.x, varyingColor2.x), productValue34) + productValue37;
    precise float multiplyAddValue36 = fma(varyingColor2.w, fma(-multiplyAddValue29, varyingColor3.y, varyingColor2.y), productValue35) + productValue38;
    precise float multiplyAddValue37 = fma(varyingColor2.w, fma(-multiplyAddValue30, varyingColor3.z, varyingColor2.z), productValue36) + productValue39;
    precise float sumValue7 = abs(multiplyAddValue34) + 0.0;
    fragmentColor0.x = multiplyAddValue35;
    fragmentColor0.y = multiplyAddValue36;
    fragmentColor0.z = multiplyAddValue37;
    fragmentColor0.w = sumValue7;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue38 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z);
    precise float sumValue8 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue38;
    precise float sumValue9 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue39;
    precise float sumValue10 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue40;
    float multiplyAddValue41 = fma(fragmentScalarConstants1.packedValues[3u], sumValue8, multiplyAddValue38);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[3u], sumValue9, multiplyAddValue39);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[3u], sumValue10, multiplyAddValue40);
    precise float productValue40 = multiplyAddValue41 * varyingColor3.x;
    precise float productValue41 = multiplyAddValue42 * varyingColor3.y;
    precise float productValue42 = multiplyAddValue43 * varyingColor3.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    precise float productValue12 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue13 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue14 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue15 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].w;
    precise float multiplyAddValue31 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, productValue12) * fragmentVectorConstants1.packedValues[3u].x;
    precise float multiplyAddValue32 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, productValue13) * fragmentVectorConstants1.packedValues[3u].y;
    precise float multiplyAddValue33 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, productValue14) * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue34 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, productValue15) * fragmentVectorConstants1.packedValues[3u].w;
    precise float productValue37 = multiplyAddValue31 * multiplyAddValue31;
    precise float productValue38 = multiplyAddValue32 * multiplyAddValue32;
    precise float productValue39 = multiplyAddValue33 * multiplyAddValue33;
    precise float multiplyAddValue44 = fma(varyingColor2.w, fma(-multiplyAddValue41, varyingColor3.x, varyingColor2.x), productValue40) + productValue37;
    precise float multiplyAddValue45 = fma(varyingColor2.w, fma(-multiplyAddValue42, varyingColor3.y, varyingColor2.y), productValue41) + productValue38;
    precise float multiplyAddValue46 = fma(varyingColor2.w, fma(-multiplyAddValue43, varyingColor3.z, varyingColor2.z), productValue42) + productValue39;
    precise float sumValue7 = abs(multiplyAddValue34) + 0.0;
    fragmentColor0.x = multiplyAddValue44;
    fragmentColor0.y = multiplyAddValue45;
    fragmentColor0.z = multiplyAddValue46;
    fragmentColor0.w = sumValue7;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue50 = fma(scalarValue11, fma(scalarValue8, fragmentVectorConstants1.packedValues[2u].x, -scalarValue8), scalarValue8);
    float multiplyAddValue51 = fma(scalarValue11, fma(scalarValue9, fragmentVectorConstants1.packedValues[2u].y, -scalarValue9), scalarValue9);
    float multiplyAddValue52 = fma(scalarValue11, fma(scalarValue10, fragmentVectorConstants1.packedValues[2u].z, -scalarValue10), scalarValue10);
    precise float sumValue11 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue50;
    precise float sumValue12 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue51;
    precise float sumValue13 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue52;
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[3u], sumValue11, multiplyAddValue50);
    float multiplyAddValue57 = fma(fragmentScalarConstants1.packedValues[3u], sumValue12, multiplyAddValue51);
    float multiplyAddValue58 = fma(fragmentScalarConstants1.packedValues[3u], sumValue13, multiplyAddValue52);
    precise float productValue49 = multiplyAddValue56 * varyingColor3.x;
    precise float productValue50 = multiplyAddValue57 * varyingColor3.y;
    precise float productValue51 = multiplyAddValue58 * varyingColor3.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    precise float productValue12 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue13 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue14 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue15 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].w;
    precise float multiplyAddValue31 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, productValue12) * fragmentVectorConstants1.packedValues[3u].x;
    precise float multiplyAddValue32 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, productValue13) * fragmentVectorConstants1.packedValues[3u].y;
    precise float multiplyAddValue33 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, productValue14) * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue34 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, productValue15) * fragmentVectorConstants1.packedValues[3u].w;
    precise float productValue37 = multiplyAddValue31 * multiplyAddValue31;
    precise float productValue38 = multiplyAddValue32 * multiplyAddValue32;
    precise float productValue39 = multiplyAddValue33 * multiplyAddValue33;
    precise float multiplyAddValue59 = fma(varyingColor2.w, fma(-multiplyAddValue56, varyingColor3.x, varyingColor2.x), productValue49) + productValue37;
    precise float multiplyAddValue60 = fma(varyingColor2.w, fma(-multiplyAddValue57, varyingColor3.y, varyingColor2.y), productValue50) + productValue38;
    precise float multiplyAddValue61 = fma(varyingColor2.w, fma(-multiplyAddValue58, varyingColor3.z, varyingColor2.z), productValue51) + productValue39;
    precise float sumValue7 = abs(multiplyAddValue34) + 0.0;
    fragmentColor0.x = multiplyAddValue59;
    fragmentColor0.y = multiplyAddValue60;
    fragmentColor0.z = multiplyAddValue61;
    fragmentColor0.w = sumValue7;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue62 = fma(scalarValue11, fma(scalarValue8, sampledTextureValue5.x, -scalarValue8), scalarValue8);
    float multiplyAddValue63 = fma(scalarValue11, fma(scalarValue9, sampledTextureValue5.y, -scalarValue9), scalarValue9);
    float multiplyAddValue64 = fma(scalarValue11, fma(scalarValue10, sampledTextureValue5.z, -scalarValue10), scalarValue10);
    precise float sumValue14 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue62;
    precise float sumValue15 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue63;
    precise float sumValue16 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue64;
    float multiplyAddValue71 = fma(fragmentScalarConstants1.packedValues[3u], sumValue14, multiplyAddValue62);
    float multiplyAddValue72 = fma(fragmentScalarConstants1.packedValues[3u], sumValue15, multiplyAddValue63);
    float multiplyAddValue73 = fma(fragmentScalarConstants1.packedValues[3u], sumValue16, multiplyAddValue64);
    precise float productValue61 = multiplyAddValue71 * varyingColor3.x;
    precise float productValue62 = multiplyAddValue72 * varyingColor3.y;
    precise float productValue63 = multiplyAddValue73 * varyingColor3.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    precise float productValue12 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue13 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue14 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue15 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].w;
    precise float multiplyAddValue74 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, productValue12) * fragmentVectorConstants1.packedValues[2u].x;
    precise float multiplyAddValue75 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, productValue13) * fragmentVectorConstants1.packedValues[2u].y;
    precise float multiplyAddValue76 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, productValue14) * fragmentVectorConstants1.packedValues[2u].z;
    precise float multiplyAddValue77 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, productValue15) * fragmentVectorConstants1.packedValues[2u].w;
    precise float productValue64 = multiplyAddValue74 * multiplyAddValue74;
    precise float productValue65 = multiplyAddValue75 * multiplyAddValue75;
    precise float productValue66 = multiplyAddValue76 * multiplyAddValue76;
    precise float multiplyAddValue78 = fma(varyingColor2.w, fma(-multiplyAddValue71, varyingColor3.x, varyingColor2.x), productValue61) + productValue64;
    precise float multiplyAddValue79 = fma(varyingColor2.w, fma(-multiplyAddValue72, varyingColor3.y, varyingColor2.y), productValue62) + productValue65;
    precise float multiplyAddValue80 = fma(varyingColor2.w, fma(-multiplyAddValue73, varyingColor3.z, varyingColor2.z), productValue63) + productValue66;
    precise float sumValue17 = abs(multiplyAddValue77) + 0.0;
    fragmentColor0.x = multiplyAddValue78;
    fragmentColor0.y = multiplyAddValue79;
    fragmentColor0.z = multiplyAddValue80;
    fragmentColor0.w = sumValue17;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue81 = fma(scalarValue11, fma(scalarValue8, scalarValue8, -scalarValue8), scalarValue8);
    float multiplyAddValue82 = fma(scalarValue11, fma(scalarValue9, scalarValue9, -scalarValue9), scalarValue9);
    float multiplyAddValue83 = fma(scalarValue11, fma(scalarValue10, scalarValue10, -scalarValue10), scalarValue10);
    precise float sumValue18 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue81;
    precise float sumValue19 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue82;
    precise float sumValue20 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue83;
    float multiplyAddValue84 = fma(fragmentScalarConstants1.packedValues[3u], sumValue18, multiplyAddValue81);
    float multiplyAddValue85 = fma(fragmentScalarConstants1.packedValues[3u], sumValue19, multiplyAddValue82);
    float multiplyAddValue86 = fma(fragmentScalarConstants1.packedValues[3u], sumValue20, multiplyAddValue83);
    precise float productValue73 = multiplyAddValue84 * varyingColor3.x;
    precise float productValue74 = multiplyAddValue85 * varyingColor3.y;
    precise float productValue75 = multiplyAddValue86 * varyingColor3.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    precise float productValue12 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue13 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue14 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue15 = scalarValue3 * fragmentVectorConstants1.packedValues[1u].w;
    precise float multiplyAddValue74 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, productValue12) * fragmentVectorConstants1.packedValues[2u].x;
    precise float multiplyAddValue75 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, productValue13) * fragmentVectorConstants1.packedValues[2u].y;
    precise float multiplyAddValue76 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, productValue14) * fragmentVectorConstants1.packedValues[2u].z;
    precise float multiplyAddValue77 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, productValue15) * fragmentVectorConstants1.packedValues[2u].w;
    precise float productValue64 = multiplyAddValue74 * multiplyAddValue74;
    precise float productValue65 = multiplyAddValue75 * multiplyAddValue75;
    precise float productValue66 = multiplyAddValue76 * multiplyAddValue76;
    precise float multiplyAddValue87 = fma(varyingColor2.w, fma(-multiplyAddValue84, varyingColor3.x, varyingColor2.x), productValue73) + productValue64;
    precise float multiplyAddValue88 = fma(varyingColor2.w, fma(-multiplyAddValue85, varyingColor3.y, varyingColor2.y), productValue74) + productValue65;
    precise float multiplyAddValue89 = fma(varyingColor2.w, fma(-multiplyAddValue86, varyingColor3.z, varyingColor2.z), productValue75) + productValue66;
    precise float sumValue17 = abs(multiplyAddValue77) + 0.0;
    fragmentColor0.x = multiplyAddValue87;
    fragmentColor0.y = multiplyAddValue88;
    fragmentColor0.z = multiplyAddValue89;
    fragmentColor0.w = sumValue17;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[3u].x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[3u].y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z);
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue, multiplyAddValue);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue1, multiplyAddValue1);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue2, multiplyAddValue2);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    float multiplyAddValue6 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, scalarValue3 * fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[4u].x;
    float multiplyAddValue7 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[4u].y;
    float multiplyAddValue8 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[4u].z;
    fragmentColor0.x = fma(multiplyAddValue6, multiplyAddValue6, fma(varyingColor2.w, fma(-multiplyAddValue3, varyingColor3.x, varyingColor2.x), multiplyAddValue3 * varyingColor3.x));
    fragmentColor0.y = fma(multiplyAddValue7, multiplyAddValue7, fma(varyingColor2.w, fma(-multiplyAddValue4, varyingColor3.y, varyingColor2.y), multiplyAddValue4 * varyingColor3.y));
    fragmentColor0.z = fma(multiplyAddValue8, multiplyAddValue8, fma(varyingColor2.w, fma(-multiplyAddValue5, varyingColor3.z, varyingColor2.z), multiplyAddValue5 * varyingColor3.z));
    fragmentColor0.w = abs(fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, scalarValue3 * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[4u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, sampledTextureValue5.x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, sampledTextureValue5.y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue21 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, sampledTextureValue5.z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z);
    float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue19, multiplyAddValue19);
    float multiplyAddValue23 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue20, multiplyAddValue20);
    float multiplyAddValue24 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue21, multiplyAddValue21);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    float multiplyAddValue25 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, scalarValue3 * fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[3u].x;
    float multiplyAddValue26 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[3u].y;
    float multiplyAddValue27 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[3u].z;
    fragmentColor0.x = fma(multiplyAddValue25, multiplyAddValue25, fma(varyingColor2.w, fma(-multiplyAddValue22, varyingColor3.x, varyingColor2.x), multiplyAddValue22 * varyingColor3.x));
    fragmentColor0.y = fma(multiplyAddValue26, multiplyAddValue26, fma(varyingColor2.w, fma(-multiplyAddValue23, varyingColor3.y, varyingColor2.y), multiplyAddValue23 * varyingColor3.y));
    fragmentColor0.z = fma(multiplyAddValue27, multiplyAddValue27, fma(varyingColor2.w, fma(-multiplyAddValue24, varyingColor3.z, varyingColor2.z), multiplyAddValue24 * varyingColor3.z));
    fragmentColor0.w = abs(fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, scalarValue3 * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[3u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue38 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x, -fragmentVectorConstants1.packedValues[2u].x), fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y, -fragmentVectorConstants1.packedValues[2u].y), fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z, -fragmentVectorConstants1.packedValues[2u].z), fragmentVectorConstants1.packedValues[2u].z);
    float multiplyAddValue47 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue38, multiplyAddValue38);
    float multiplyAddValue48 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue39, multiplyAddValue39);
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue40, multiplyAddValue40);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    float multiplyAddValue25 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, scalarValue3 * fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[3u].x;
    float multiplyAddValue26 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[3u].y;
    float multiplyAddValue27 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[3u].z;
    fragmentColor0.x = fma(multiplyAddValue25, multiplyAddValue25, fma(varyingColor2.w, fma(-multiplyAddValue47, varyingColor3.x, varyingColor2.x), multiplyAddValue47 * varyingColor3.x));
    fragmentColor0.y = fma(multiplyAddValue26, multiplyAddValue26, fma(varyingColor2.w, fma(-multiplyAddValue48, varyingColor3.y, varyingColor2.y), multiplyAddValue48 * varyingColor3.y));
    fragmentColor0.z = fma(multiplyAddValue27, multiplyAddValue27, fma(varyingColor2.w, fma(-multiplyAddValue49, varyingColor3.z, varyingColor2.z), multiplyAddValue49 * varyingColor3.z));
    fragmentColor0.w = abs(fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, scalarValue3 * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[3u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue50 = fma(scalarValue11, fma(scalarValue8, fragmentVectorConstants1.packedValues[2u].x, -scalarValue8), scalarValue8);
    float multiplyAddValue51 = fma(scalarValue11, fma(scalarValue9, fragmentVectorConstants1.packedValues[2u].y, -scalarValue9), scalarValue9);
    float multiplyAddValue52 = fma(scalarValue11, fma(scalarValue10, fragmentVectorConstants1.packedValues[2u].z, -scalarValue10), scalarValue10);
    float multiplyAddValue53 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue50, multiplyAddValue50);
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue51, multiplyAddValue51);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue52, multiplyAddValue52);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    float multiplyAddValue25 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, scalarValue3 * fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[3u].x;
    float multiplyAddValue26 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[3u].y;
    float multiplyAddValue27 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[3u].z;
    fragmentColor0.x = fma(multiplyAddValue25, multiplyAddValue25, fma(varyingColor2.w, fma(-multiplyAddValue53, varyingColor3.x, varyingColor2.x), multiplyAddValue53 * varyingColor3.x));
    fragmentColor0.y = fma(multiplyAddValue26, multiplyAddValue26, fma(varyingColor2.w, fma(-multiplyAddValue54, varyingColor3.y, varyingColor2.y), multiplyAddValue54 * varyingColor3.y));
    fragmentColor0.z = fma(multiplyAddValue27, multiplyAddValue27, fma(varyingColor2.w, fma(-multiplyAddValue55, varyingColor3.z, varyingColor2.z), multiplyAddValue55 * varyingColor3.z));
    fragmentColor0.w = abs(fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, scalarValue3 * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[3u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue62 = fma(scalarValue11, fma(scalarValue8, sampledTextureValue5.x, -scalarValue8), scalarValue8);
    float multiplyAddValue63 = fma(scalarValue11, fma(scalarValue9, sampledTextureValue5.y, -scalarValue9), scalarValue9);
    float multiplyAddValue64 = fma(scalarValue11, fma(scalarValue10, sampledTextureValue5.z, -scalarValue10), scalarValue10);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue62, multiplyAddValue62);
    float multiplyAddValue66 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue63, multiplyAddValue63);
    float multiplyAddValue67 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue64, multiplyAddValue64);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    float multiplyAddValue68 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, scalarValue3 * fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[2u].x;
    float multiplyAddValue69 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[2u].y;
    float multiplyAddValue70 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[2u].z;
    fragmentColor0.x = fma(multiplyAddValue68, multiplyAddValue68, fma(varyingColor2.w, fma(-multiplyAddValue65, varyingColor3.x, varyingColor2.x), multiplyAddValue65 * varyingColor3.x));
    fragmentColor0.y = fma(multiplyAddValue69, multiplyAddValue69, fma(varyingColor2.w, fma(-multiplyAddValue66, varyingColor3.y, varyingColor2.y), multiplyAddValue66 * varyingColor3.y));
    fragmentColor0.z = fma(multiplyAddValue70, multiplyAddValue70, fma(varyingColor2.w, fma(-multiplyAddValue67, varyingColor3.z, varyingColor2.z), multiplyAddValue67 * varyingColor3.z));
    fragmentColor0.w = abs(fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, scalarValue3 * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[2u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue81 = fma(scalarValue11, fma(scalarValue8, scalarValue8, -scalarValue8), scalarValue8);
    float multiplyAddValue82 = fma(scalarValue11, fma(scalarValue9, scalarValue9, -scalarValue9), scalarValue9);
    float multiplyAddValue83 = fma(scalarValue11, fma(scalarValue10, scalarValue10, -scalarValue10), scalarValue10);
    float multiplyAddValue90 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue81, multiplyAddValue81);
    float multiplyAddValue91 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue82, multiplyAddValue82);
    float multiplyAddValue92 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue83, multiplyAddValue83);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue3 = sampledTextureValue3.x;
    float multiplyAddValue68 = fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].x, scalarValue3 * fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[2u].x;
    float multiplyAddValue69 = fma(sampledTextureValue2.y, fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue3.y * fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[2u].y;
    float multiplyAddValue70 = fma(sampledTextureValue2.z, fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue3.z * fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[2u].z;
    fragmentColor0.x = fma(multiplyAddValue68, multiplyAddValue68, fma(varyingColor2.w, fma(-multiplyAddValue90, varyingColor3.x, varyingColor2.x), multiplyAddValue90 * varyingColor3.x));
    fragmentColor0.y = fma(multiplyAddValue69, multiplyAddValue69, fma(varyingColor2.w, fma(-multiplyAddValue91, varyingColor3.y, varyingColor2.y), multiplyAddValue91 * varyingColor3.y));
    fragmentColor0.z = fma(multiplyAddValue70, multiplyAddValue70, fma(varyingColor2.w, fma(-multiplyAddValue92, varyingColor3.z, varyingColor2.z), multiplyAddValue92 * varyingColor3.z));
    fragmentColor0.w = abs(fma(scalarValue2, fragmentVectorConstants1.packedValues[1u].w, scalarValue3 * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[2u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (((fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[2u].x) - fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[2u].w) + fragmentVectorConstants1.packedValues[2u].x;
    float productValue1 = (((fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[2u].y) - fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[2u].w) + fragmentVectorConstants1.packedValues[2u].y;
    float productValue2 = (((fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[2u].z) - fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[2u].w) + fragmentVectorConstants1.packedValues[2u].z;
    float productValue3 = (((fragmentVectorConstants1.packedValues[0u].x - productValue) * fragmentVectorConstants1.packedValues[0u].w) + productValue) * varyingColor3.x;
    float productValue4 = (((fragmentVectorConstants1.packedValues[0u].y - productValue1) * fragmentVectorConstants1.packedValues[0u].w) + productValue1) * varyingColor3.y;
    float productValue5 = (((fragmentVectorConstants1.packedValues[0u].z - productValue2) * fragmentVectorConstants1.packedValues[0u].w) + productValue2) * varyingColor3.z;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue = sampledTextureValue.x;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue1 = sampledTextureValue1.x;
    float productValue6 = ((fragmentVectorConstants1.packedValues[1u].x * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].x * scalarValue)) * fragmentVectorConstants1.packedValues[4u].x;
    float productValue7 = ((fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue1.y) + (fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y)) * fragmentVectorConstants1.packedValues[4u].y;
    float productValue8 = ((fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue1.z) + (fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z)) * fragmentVectorConstants1.packedValues[4u].z;
    fragmentColor0.x = (((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3) + (productValue6 * productValue6);
    fragmentColor0.y = (((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4) + (productValue7 * productValue7);
    fragmentColor0.z = (((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5) + (productValue8 * productValue8);
    fragmentColor0.w = abs(((fragmentVectorConstants1.packedValues[1u].w * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].w * scalarValue)) * fragmentVectorConstants1.packedValues[4u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue19 = (((sampledTextureValue4.x * fragmentVectorConstants1.packedValues[2u].x) - fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[2u].w) + fragmentVectorConstants1.packedValues[2u].x;
    float productValue20 = (((sampledTextureValue4.y * fragmentVectorConstants1.packedValues[2u].y) - fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[2u].w) + fragmentVectorConstants1.packedValues[2u].y;
    float productValue21 = (((sampledTextureValue4.z * fragmentVectorConstants1.packedValues[2u].z) - fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[2u].w) + fragmentVectorConstants1.packedValues[2u].z;
    float productValue22 = (((fragmentVectorConstants1.packedValues[0u].x - productValue19) * fragmentVectorConstants1.packedValues[0u].w) + productValue19) * varyingColor3.x;
    float productValue23 = (((fragmentVectorConstants1.packedValues[0u].y - productValue20) * fragmentVectorConstants1.packedValues[0u].w) + productValue20) * varyingColor3.y;
    float productValue24 = (((fragmentVectorConstants1.packedValues[0u].z - productValue21) * fragmentVectorConstants1.packedValues[0u].w) + productValue21) * varyingColor3.z;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue = sampledTextureValue.x;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue1 = sampledTextureValue1.x;
    float productValue25 = ((fragmentVectorConstants1.packedValues[1u].x * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].x * scalarValue)) * fragmentVectorConstants1.packedValues[3u].x;
    float productValue26 = ((fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue1.y) + (fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y)) * fragmentVectorConstants1.packedValues[3u].y;
    float productValue27 = ((fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue1.z) + (fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z)) * fragmentVectorConstants1.packedValues[3u].z;
    fragmentColor0.x = (((varyingColor2.x - productValue22) * varyingColor2.w) + productValue22) + (productValue25 * productValue25);
    fragmentColor0.y = (((varyingColor2.y - productValue23) * varyingColor2.w) + productValue23) + (productValue26 * productValue26);
    fragmentColor0.z = (((varyingColor2.z - productValue24) * varyingColor2.w) + productValue24) + (productValue27 * productValue27);
    fragmentColor0.w = abs(((fragmentVectorConstants1.packedValues[1u].w * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].w * scalarValue)) * fragmentVectorConstants1.packedValues[3u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue28 = (((fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[2u].x) - fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[2u].w) + fragmentVectorConstants1.packedValues[2u].x;
    float productValue29 = (((fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[2u].y) - fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[2u].w) + fragmentVectorConstants1.packedValues[2u].y;
    float productValue30 = (((fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[2u].z) - fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[2u].w) + fragmentVectorConstants1.packedValues[2u].z;
    float productValue31 = (((fragmentVectorConstants1.packedValues[0u].x - productValue28) * fragmentVectorConstants1.packedValues[0u].w) + productValue28) * varyingColor3.x;
    float productValue32 = (((fragmentVectorConstants1.packedValues[0u].y - productValue29) * fragmentVectorConstants1.packedValues[0u].w) + productValue29) * varyingColor3.y;
    float productValue33 = (((fragmentVectorConstants1.packedValues[0u].z - productValue30) * fragmentVectorConstants1.packedValues[0u].w) + productValue30) * varyingColor3.z;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue = sampledTextureValue.x;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue1 = sampledTextureValue1.x;
    float productValue25 = ((fragmentVectorConstants1.packedValues[1u].x * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].x * scalarValue)) * fragmentVectorConstants1.packedValues[3u].x;
    float productValue26 = ((fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue1.y) + (fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y)) * fragmentVectorConstants1.packedValues[3u].y;
    float productValue27 = ((fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue1.z) + (fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z)) * fragmentVectorConstants1.packedValues[3u].z;
    fragmentColor0.x = (((varyingColor2.x - productValue31) * varyingColor2.w) + productValue31) + (productValue25 * productValue25);
    fragmentColor0.y = (((varyingColor2.y - productValue32) * varyingColor2.w) + productValue32) + (productValue26 * productValue26);
    fragmentColor0.z = (((varyingColor2.z - productValue33) * varyingColor2.w) + productValue33) + (productValue27 * productValue27);
    fragmentColor0.w = abs(((fragmentVectorConstants1.packedValues[1u].w * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].w * scalarValue)) * fragmentVectorConstants1.packedValues[3u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue43 = (((fragmentVectorConstants1.packedValues[2u].x * scalarValue4) - scalarValue4) * scalarValue7) + scalarValue4;
    float productValue44 = (((fragmentVectorConstants1.packedValues[2u].y * scalarValue5) - scalarValue5) * scalarValue7) + scalarValue5;
    float productValue45 = (((fragmentVectorConstants1.packedValues[2u].z * scalarValue6) - scalarValue6) * scalarValue7) + scalarValue6;
    float productValue46 = (((fragmentVectorConstants1.packedValues[0u].x - productValue43) * fragmentVectorConstants1.packedValues[0u].w) + productValue43) * varyingColor3.x;
    float productValue47 = (((fragmentVectorConstants1.packedValues[0u].y - productValue44) * fragmentVectorConstants1.packedValues[0u].w) + productValue44) * varyingColor3.y;
    float productValue48 = (((fragmentVectorConstants1.packedValues[0u].z - productValue45) * fragmentVectorConstants1.packedValues[0u].w) + productValue45) * varyingColor3.z;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue = sampledTextureValue.x;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue1 = sampledTextureValue1.x;
    float productValue25 = ((fragmentVectorConstants1.packedValues[1u].x * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].x * scalarValue)) * fragmentVectorConstants1.packedValues[3u].x;
    float productValue26 = ((fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue1.y) + (fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y)) * fragmentVectorConstants1.packedValues[3u].y;
    float productValue27 = ((fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue1.z) + (fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z)) * fragmentVectorConstants1.packedValues[3u].z;
    fragmentColor0.x = (((varyingColor2.x - productValue46) * varyingColor2.w) + productValue46) + (productValue25 * productValue25);
    fragmentColor0.y = (((varyingColor2.y - productValue47) * varyingColor2.w) + productValue47) + (productValue26 * productValue26);
    fragmentColor0.z = (((varyingColor2.z - productValue48) * varyingColor2.w) + productValue48) + (productValue27 * productValue27);
    fragmentColor0.w = abs(((fragmentVectorConstants1.packedValues[1u].w * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].w * scalarValue)) * fragmentVectorConstants1.packedValues[3u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue52 = (((sampledTextureValue4.x * scalarValue4) - scalarValue4) * scalarValue7) + scalarValue4;
    float productValue53 = (((sampledTextureValue4.y * scalarValue5) - scalarValue5) * scalarValue7) + scalarValue5;
    float productValue54 = (((sampledTextureValue4.z * scalarValue6) - scalarValue6) * scalarValue7) + scalarValue6;
    float productValue55 = (((fragmentVectorConstants1.packedValues[0u].x - productValue52) * fragmentVectorConstants1.packedValues[0u].w) + productValue52) * varyingColor3.x;
    float productValue56 = (((fragmentVectorConstants1.packedValues[0u].y - productValue53) * fragmentVectorConstants1.packedValues[0u].w) + productValue53) * varyingColor3.y;
    float productValue57 = (((fragmentVectorConstants1.packedValues[0u].z - productValue54) * fragmentVectorConstants1.packedValues[0u].w) + productValue54) * varyingColor3.z;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue = sampledTextureValue.x;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue1 = sampledTextureValue1.x;
    float productValue58 = ((fragmentVectorConstants1.packedValues[1u].x * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].x * scalarValue)) * fragmentVectorConstants1.packedValues[2u].x;
    float productValue59 = ((fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue1.y) + (fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y)) * fragmentVectorConstants1.packedValues[2u].y;
    float productValue60 = ((fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue1.z) + (fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z)) * fragmentVectorConstants1.packedValues[2u].z;
    fragmentColor0.x = (((varyingColor2.x - productValue55) * varyingColor2.w) + productValue55) + (productValue58 * productValue58);
    fragmentColor0.y = (((varyingColor2.y - productValue56) * varyingColor2.w) + productValue56) + (productValue59 * productValue59);
    fragmentColor0.z = (((varyingColor2.z - productValue57) * varyingColor2.w) + productValue57) + (productValue60 * productValue60);
    fragmentColor0.w = abs(((fragmentVectorConstants1.packedValues[1u].w * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].w * scalarValue)) * fragmentVectorConstants1.packedValues[2u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue67 = (((scalarValue4 * scalarValue4) - scalarValue4) * scalarValue7) + scalarValue4;
    float productValue68 = (((scalarValue5 * scalarValue5) - scalarValue5) * scalarValue7) + scalarValue5;
    float productValue69 = (((scalarValue6 * scalarValue6) - scalarValue6) * scalarValue7) + scalarValue6;
    float productValue70 = (((fragmentVectorConstants1.packedValues[0u].x - productValue67) * fragmentVectorConstants1.packedValues[0u].w) + productValue67) * varyingColor3.x;
    float productValue71 = (((fragmentVectorConstants1.packedValues[0u].y - productValue68) * fragmentVectorConstants1.packedValues[0u].w) + productValue68) * varyingColor3.y;
    float productValue72 = (((fragmentVectorConstants1.packedValues[0u].z - productValue69) * fragmentVectorConstants1.packedValues[0u].w) + productValue69) * varyingColor3.z;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue = sampledTextureValue.x;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue1 = sampledTextureValue1.x;
    float productValue58 = ((fragmentVectorConstants1.packedValues[1u].x * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].x * scalarValue)) * fragmentVectorConstants1.packedValues[2u].x;
    float productValue59 = ((fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue1.y) + (fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y)) * fragmentVectorConstants1.packedValues[2u].y;
    float productValue60 = ((fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue1.z) + (fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z)) * fragmentVectorConstants1.packedValues[2u].z;
    fragmentColor0.x = (((varyingColor2.x - productValue70) * varyingColor2.w) + productValue70) + (productValue58 * productValue58);
    fragmentColor0.y = (((varyingColor2.y - productValue71) * varyingColor2.w) + productValue71) + (productValue59 * productValue59);
    fragmentColor0.z = (((varyingColor2.z - productValue72) * varyingColor2.w) + productValue72) + (productValue60 * productValue60);
    fragmentColor0.w = abs(((fragmentVectorConstants1.packedValues[1u].w * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].w * scalarValue)) * fragmentVectorConstants1.packedValues[2u].w);
#endif
    discardIfRequested();
}
