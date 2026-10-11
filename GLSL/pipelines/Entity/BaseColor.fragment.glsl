#version 460
#extension GL_GOOGLE_include_directive : require
// Entity / BaseColor / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 16
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/Entity/FragmentBindings.glsli"

void main()
{
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[1u].x;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[1u].y;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[1u].z;
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[3u], sumValue, fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[3u], sumValue1, fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[3u], sumValue2, fragmentVectorConstants1.packedValues[1u].z);
    precise float productValue3 = multiplyAddValue3 * varyingColor3.x;
    precise float productValue4 = multiplyAddValue4 * varyingColor3.y;
    precise float productValue5 = multiplyAddValue5 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue3, varyingColor3.x, varyingColor2.x), productValue3);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue4, varyingColor3.y, varyingColor2.y), productValue4);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue5, varyingColor3.z, varyingColor2.z), productValue5);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.x;
    float scalarValue4 = sampledTextureValue1.y;
    float scalarValue5 = sampledTextureValue1.z;
    precise float sumValue3 = fragmentVectorConstants1.packedValues[0u].x - scalarValue3;
    precise float sumValue4 = fragmentVectorConstants1.packedValues[0u].y - scalarValue4;
    precise float sumValue5 = fragmentVectorConstants1.packedValues[0u].z - scalarValue5;
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[3u], sumValue3, scalarValue3);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[3u], sumValue4, scalarValue4);
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[3u], sumValue5, scalarValue5);
    fragmentColor0.w = sampledTextureValue1.w;
    precise float productValue9 = multiplyAddValue9 * varyingColor3.x;
    precise float productValue10 = multiplyAddValue10 * varyingColor3.y;
    precise float productValue11 = multiplyAddValue11 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue9, varyingColor3.x, varyingColor2.x), productValue9);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue10, varyingColor3.y, varyingColor2.y), productValue10);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue11, varyingColor3.z, varyingColor2.z), productValue11);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[1u].z);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue, varyingColor3.x, varyingColor2.x), multiplyAddValue * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue1, varyingColor3.y, varyingColor2.y), multiplyAddValue1 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue2, varyingColor3.z, varyingColor2.z), multiplyAddValue2 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.x;
    float scalarValue4 = sampledTextureValue1.y;
    float scalarValue5 = sampledTextureValue1.z;
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - scalarValue3, scalarValue3);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - scalarValue4, scalarValue4);
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - scalarValue5, scalarValue5);
    fragmentColor0.w = sampledTextureValue1.w;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue6, varyingColor3.x, varyingColor2.x), multiplyAddValue6 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue7, varyingColor3.y, varyingColor2.y), multiplyAddValue7 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue8, varyingColor3.z, varyingColor2.z), multiplyAddValue8 * varyingColor3.z);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (((fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[1u].x) * varyingColor3.x;
    float productValue1 = (((fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[1u].y) * varyingColor3.y;
    float productValue2 = (((fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[1u].z) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue) * varyingColor2.w) + productValue;
    fragmentColor0.y = ((varyingColor2.y - productValue1) * varyingColor2.w) + productValue1;
    fragmentColor0.z = ((varyingColor2.z - productValue2) * varyingColor2.w) + productValue2;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float productValue6 = (((fragmentVectorConstants1.packedValues[0u].x - scalarValue) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue) * varyingColor3.x;
    float productValue7 = (((fragmentVectorConstants1.packedValues[0u].y - scalarValue1) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue1) * varyingColor3.y;
    float productValue8 = (((fragmentVectorConstants1.packedValues[0u].z - scalarValue2) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue2) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = sampledTextureValue.w;
#endif
}
