#version 460
#extension GL_GOOGLE_include_directive : require
// Basic / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_SAMPLE_MAT_TEXTURE
#define RD_FEATURE_SAMPLE_MAT_TEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_TRANSFORM_UV0
#define RD_FEATURE_TRANSFORM_UV0 RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif


#include "../../include/materials/Basic/FragmentBindings.glsli"

void main()
{
#if (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue1 = varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue2 = varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue3 = varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w;
    fragmentColor0.x = productValue;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue2;
    fragmentColor0.w = productValue3;
#elif (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue4 = sampledTextureValue1.x * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue5 = sampledTextureValue1.y * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue6 = sampledTextureValue1.z * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue7 = sampledTextureValue1.w * fragmentVectorConstants1.packedValues[0u].w;
    precise float productValue8 = productValue4 * varyingColor0.x;
    precise float productValue9 = productValue5 * varyingColor0.y;
    precise float productValue10 = productValue6 * varyingColor0.z;
    precise float productValue11 = productValue7 * varyingColor0.w;
    fragmentColor0.x = productValue8;
    fragmentColor0.y = productValue9;
    fragmentColor0.z = productValue10;
    fragmentColor0.w = productValue11;
#elif (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z;
    fragmentColor0.w = varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w;
#elif (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = (sampledTextureValue1.x * fragmentVectorConstants1.packedValues[0u].x) * varyingColor0.x;
    fragmentColor0.y = (sampledTextureValue1.y * fragmentVectorConstants1.packedValues[0u].y) * varyingColor0.y;
    fragmentColor0.z = (sampledTextureValue1.z * fragmentVectorConstants1.packedValues[0u].z) * varyingColor0.z;
    fragmentColor0.w = (sampledTextureValue1.w * fragmentVectorConstants1.packedValues[0u].w) * varyingColor0.w;
#elif (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = fragmentVectorConstants1.packedValues[0u].x * varyingColor0.x;
    fragmentColor0.y = fragmentVectorConstants1.packedValues[0u].y * varyingColor0.y;
    fragmentColor0.z = fragmentVectorConstants1.packedValues[0u].z * varyingColor0.z;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[0u].w * varyingColor0.w;
#elif (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = (fragmentVectorConstants1.packedValues[0u].x * varyingColor0.x) * sampledTextureValue.x;
    fragmentColor0.y = (fragmentVectorConstants1.packedValues[0u].y * varyingColor0.y) * sampledTextureValue.y;
    fragmentColor0.z = (fragmentVectorConstants1.packedValues[0u].z * varyingColor0.z) * sampledTextureValue.z;
    fragmentColor0.w = (fragmentVectorConstants1.packedValues[0u].w * varyingColor0.w) * sampledTextureValue.w;
#endif
}
