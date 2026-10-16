#version 460
#extension GL_GOOGLE_include_directive : require
// UISprite / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/UISprite/FragmentBindings.glsli"

void main()
{
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    precise float multiplyAddValue = fma(scalarValue7, fma(scalarValue4, varyingColor0.x, -scalarValue4), scalarValue4) * fragmentVectorConstants1.packedValues[1u].x;
    precise float multiplyAddValue1 = fma(scalarValue7, fma(scalarValue5, varyingColor0.y, -scalarValue5), scalarValue5) * fragmentVectorConstants1.packedValues[1u].y;
    precise float multiplyAddValue2 = fma(scalarValue7, fma(scalarValue6, varyingColor0.z, -scalarValue6), scalarValue6) * fragmentVectorConstants1.packedValues[1u].z;
    precise float comparisonValue = ((varyingColor0.w > 0.0) ? ceil(scalarValue7) : scalarValue7) * fragmentVectorConstants1.packedValues[1u].w;
    precise float productValue = comparisonValue * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.w = productValue;
    fragmentColor0.x = multiplyAddValue;
    fragmentColor0.y = multiplyAddValue1;
    fragmentColor0.z = multiplyAddValue2;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.w;
    precise float productValue4 = scalarValue4 * varyingColor0.x;
    precise float productValue5 = scalarValue4 * varyingColor0.y;
    precise float productValue6 = scalarValue4 * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue5);
    precise float multiplyAddValue3 = fma(scalarValue9, fma(scalarValue5, fragmentVectorConstants1.packedValues[0u].x, -productValue4), productValue4) * fragmentVectorConstants1.packedValues[2u].x;
    precise float multiplyAddValue4 = fma(scalarValue9, fma(scalarValue5, fragmentVectorConstants1.packedValues[0u].y, -productValue5), productValue5) * fragmentVectorConstants1.packedValues[2u].y;
    precise float multiplyAddValue5 = fma(scalarValue9, fma(scalarValue5, fragmentVectorConstants1.packedValues[0u].z, -productValue6), productValue6) * fragmentVectorConstants1.packedValues[2u].z;
    precise float comparisonValue1 = ((varyingColor0.w > 0.0) ? ceil(scalarValue7) : scalarValue7) * fragmentVectorConstants1.packedValues[2u].w;
    precise float productValue7 = comparisonValue1 * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.w = productValue7;
    fragmentColor0.x = multiplyAddValue3;
    fragmentColor0.y = multiplyAddValue4;
    fragmentColor0.z = multiplyAddValue5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    fragmentColor0.w = (((varyingColor0.w > 0.0) ? ceil(scalarValue7) : scalarValue7) * fragmentVectorConstants1.packedValues[1u].w) * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.x = fma(scalarValue7, fma(scalarValue4, varyingColor0.x, -scalarValue4), scalarValue4) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = fma(scalarValue7, fma(scalarValue5, varyingColor0.y, -scalarValue5), scalarValue5) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = fma(scalarValue7, fma(scalarValue6, varyingColor0.z, -scalarValue6), scalarValue6) * fragmentVectorConstants1.packedValues[1u].z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.w;
    float productValue8 = scalarValue4 * varyingColor0.x;
    float productValue9 = scalarValue4 * varyingColor0.y;
    float productValue10 = scalarValue4 * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue5);
    fragmentColor0.w = (((varyingColor0.w > 0.0) ? ceil(scalarValue7) : scalarValue7) * fragmentVectorConstants1.packedValues[2u].w) * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.x = fma(scalarValue9, fma(scalarValue5, fragmentVectorConstants1.packedValues[0u].x, -productValue8), productValue8) * fragmentVectorConstants1.packedValues[2u].x;
    fragmentColor0.y = fma(scalarValue9, fma(scalarValue5, fragmentVectorConstants1.packedValues[0u].y, -productValue9), productValue9) * fragmentVectorConstants1.packedValues[2u].y;
    fragmentColor0.z = fma(scalarValue9, fma(scalarValue5, fragmentVectorConstants1.packedValues[0u].z, -productValue10), productValue10) * fragmentVectorConstants1.packedValues[2u].z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float intermediateValue4;
    if (varyingColor0.w > 0.0)
    {
        intermediateValue4 = ceil(scalarValue3);
    }
    else
    {
        intermediateValue4 = scalarValue3;
    }
    fragmentColor0.x = fragmentVectorConstants1.packedValues[1u].x * ((((scalarValue * varyingColor0.x) - scalarValue) * scalarValue3) + scalarValue);
    fragmentColor0.y = fragmentVectorConstants1.packedValues[1u].y * ((((scalarValue1 * varyingColor0.y) - scalarValue1) * scalarValue3) + scalarValue1);
    fragmentColor0.z = fragmentVectorConstants1.packedValues[1u].z * ((((scalarValue2 * varyingColor0.z) - scalarValue2) * scalarValue3) + scalarValue2);
    fragmentColor0.w = (fragmentVectorConstants1.packedValues[1u].w * intermediateValue4) * fragmentVectorConstants1.packedValues[0u].x;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    float productValue1 = scalarValue * varyingColor0.x;
    float productValue2 = scalarValue * varyingColor0.y;
    float productValue3 = scalarValue * varyingColor0.z;
    float scalarValue8 = ceil(scalarValue1);
    float intermediateValue4;
    if (varyingColor0.w > 0.0)
    {
        intermediateValue4 = ceil(scalarValue3);
    }
    else
    {
        intermediateValue4 = scalarValue3;
    }
    fragmentColor0.x = fragmentVectorConstants1.packedValues[2u].x * ((((fragmentVectorConstants1.packedValues[0u].x * scalarValue1) - productValue1) * scalarValue8) + productValue1);
    fragmentColor0.y = fragmentVectorConstants1.packedValues[2u].y * ((((fragmentVectorConstants1.packedValues[0u].y * scalarValue1) - productValue2) * scalarValue8) + productValue2);
    fragmentColor0.z = fragmentVectorConstants1.packedValues[2u].z * ((((fragmentVectorConstants1.packedValues[0u].z * scalarValue1) - productValue3) * scalarValue8) + productValue3);
    fragmentColor0.w = (fragmentVectorConstants1.packedValues[2u].w * intermediateValue4) * fragmentVectorConstants1.packedValues[1u].x;
#endif
}
