#version 460
#extension GL_GOOGLE_include_directive : require
// Entity / AlphaTestEmissive / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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
#define RD_BINDING_LAYOUT 12
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/Entity/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = fragmentScalarConstants1.packedValues[5u] + fragmentScalarConstants1.packedValues[4u];
    precise float sumValue1 = sumValue + fragmentScalarConstants1.packedValues[6u];
    precise float sumValue2 = sumValue1 + fragmentScalarConstants1.packedValues[7u];
    if (sumValue2 <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    precise float sumValue9 = scalarValue5 + scalarValue4;
    precise float sumValue10 = scalarValue6 + sumValue9;
    precise float sumValue11 = scalarValue7 + sumValue10;
    if (sumValue11 <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    if ((((fragmentScalarConstants1.packedValues[5u] + fragmentScalarConstants1.packedValues[4u]) + fragmentScalarConstants1.packedValues[6u]) + fragmentScalarConstants1.packedValues[7u]) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    if ((scalarValue7 + (scalarValue6 + (scalarValue5 + scalarValue4))) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    if (!(!((((fragmentVectorConstants1.packedValues[1u].x + fragmentVectorConstants1.packedValues[1u].y) + fragmentVectorConstants1.packedValues[1u].z) + fragmentVectorConstants1.packedValues[1u].w) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if (!(!((((scalarValue + scalarValue1) + scalarValue2) + scalarValue3) <= 0.0)))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[1u].x;
    precise float sumValue4 = fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[1u].y;
    precise float sumValue5 = fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[1u].z;
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[3u], sumValue3, fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[3u], sumValue4, fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[3u], sumValue5, fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[7u], fma(multiplyAddValue6, varyingColor3.x, -multiplyAddValue6), multiplyAddValue6);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[7u], fma(multiplyAddValue7, varyingColor3.y, -multiplyAddValue7), multiplyAddValue7);
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[7u], fma(multiplyAddValue8, varyingColor3.z, -multiplyAddValue8), multiplyAddValue8);
    precise float sumValue6 = varyingColor2.x - multiplyAddValue9;
    precise float sumValue7 = varyingColor2.y - multiplyAddValue10;
    precise float sumValue8 = varyingColor2.z - multiplyAddValue11;
    fragmentColor0.x = fma(varyingColor2.w, sumValue6, multiplyAddValue9);
    fragmentColor0.y = fma(varyingColor2.w, sumValue7, multiplyAddValue10);
    fragmentColor0.z = fma(varyingColor2.w, sumValue8, multiplyAddValue11);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue12 = fragmentVectorConstants1.packedValues[0u].x - scalarValue4;
    precise float sumValue13 = fragmentVectorConstants1.packedValues[0u].y - scalarValue5;
    precise float sumValue14 = fragmentVectorConstants1.packedValues[0u].z - scalarValue6;
    float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[3u], sumValue12, scalarValue4);
    float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[3u], sumValue13, scalarValue5);
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[3u], sumValue14, scalarValue6);
    float multiplyAddValue21 = fma(scalarValue7, fma(multiplyAddValue18, varyingColor3.x, -multiplyAddValue18), multiplyAddValue18);
    float multiplyAddValue22 = fma(scalarValue7, fma(multiplyAddValue19, varyingColor3.y, -multiplyAddValue19), multiplyAddValue19);
    float multiplyAddValue23 = fma(scalarValue7, fma(multiplyAddValue20, varyingColor3.z, -multiplyAddValue20), multiplyAddValue20);
    precise float sumValue15 = varyingColor2.x - multiplyAddValue21;
    precise float sumValue16 = varyingColor2.y - multiplyAddValue22;
    precise float sumValue17 = varyingColor2.z - multiplyAddValue23;
    fragmentColor0.x = fma(varyingColor2.w, sumValue15, multiplyAddValue21);
    fragmentColor0.y = fma(varyingColor2.w, sumValue16, multiplyAddValue22);
    fragmentColor0.z = fma(varyingColor2.w, sumValue17, multiplyAddValue23);
    fragmentColor0.w = scalarValue7;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[7u], fma(multiplyAddValue, varyingColor3.x, -multiplyAddValue), multiplyAddValue);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[7u], fma(multiplyAddValue1, varyingColor3.y, -multiplyAddValue1), multiplyAddValue1);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[7u], fma(multiplyAddValue2, varyingColor3.z, -multiplyAddValue2), multiplyAddValue2);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue3, multiplyAddValue3);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue4, multiplyAddValue4);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue5, multiplyAddValue5);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - scalarValue4, scalarValue4);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - scalarValue5, scalarValue5);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - scalarValue6, scalarValue6);
    float multiplyAddValue15 = fma(scalarValue7, fma(multiplyAddValue12, varyingColor3.x, -multiplyAddValue12), multiplyAddValue12);
    float multiplyAddValue16 = fma(scalarValue7, fma(multiplyAddValue13, varyingColor3.y, -multiplyAddValue13), multiplyAddValue13);
    float multiplyAddValue17 = fma(scalarValue7, fma(multiplyAddValue14, varyingColor3.z, -multiplyAddValue14), multiplyAddValue14);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue15, multiplyAddValue15);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue16, multiplyAddValue16);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue17, multiplyAddValue17);
    fragmentColor0.w = scalarValue7;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = ((fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue1 = ((fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue2 = ((fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue3 = (((productValue * varyingColor3.x) - productValue) * fragmentVectorConstants1.packedValues[1u].w) + productValue;
    float productValue4 = (((productValue1 * varyingColor3.y) - productValue1) * fragmentVectorConstants1.packedValues[1u].w) + productValue1;
    float productValue5 = (((productValue2 * varyingColor3.z) - productValue2) * fragmentVectorConstants1.packedValues[1u].w) + productValue2;
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue6 = ((fragmentVectorConstants1.packedValues[0u].x - scalarValue) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue;
    float productValue7 = ((fragmentVectorConstants1.packedValues[0u].y - scalarValue1) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue1;
    float productValue8 = ((fragmentVectorConstants1.packedValues[0u].z - scalarValue2) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue2;
    float productValue9 = (((productValue6 * varyingColor3.x) - productValue6) * scalarValue3) + productValue6;
    float productValue10 = (((productValue7 * varyingColor3.y) - productValue7) * scalarValue3) + productValue7;
    float productValue11 = (((productValue8 * varyingColor3.z) - productValue8) * scalarValue3) + productValue8;
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = scalarValue3;
#endif
    discardIfRequested();
}
