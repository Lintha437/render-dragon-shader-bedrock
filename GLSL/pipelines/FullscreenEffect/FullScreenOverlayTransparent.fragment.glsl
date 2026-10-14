#version 460
#extension GL_GOOGLE_include_directive : require
// FullscreenEffect / FullScreenOverlayTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 15
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/FullscreenEffect/FragmentBindings.glsli"

void main()
{
#if (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue = varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue1 = varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue2 = varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue3 = varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w;
    precise float productValue4 = sampledTextureValue1.x * productValue;
    precise float productValue5 = sampledTextureValue1.y * productValue1;
    precise float productValue6 = sampledTextureValue1.z * productValue2;
    precise float productValue7 = sampledTextureValue1.w * productValue3;
    precise float productValue8 = productValue7 * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.w = productValue8;
    fragmentColor0.x = productValue4;
    fragmentColor0.y = productValue5;
    fragmentColor0.z = productValue6;
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue1 = varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue2 = varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue3 = varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w;
    precise float productValue9 = productValue3 * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.w = productValue9;
    fragmentColor0.x = productValue;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue2;
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    if (scalarValue1 <= 0.0)
    {
        isFragmentDiscarded = true;
    }
    precise float productValue = varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue1 = varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue2 = varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue3 = varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w;
    precise float productValue4 = sampledTextureValue1.x * productValue;
    precise float productValue5 = sampledTextureValue1.y * productValue1;
    precise float productValue6 = sampledTextureValue1.z * productValue2;
    precise float productValue10 = scalarValue1 * productValue3;
    precise float productValue11 = productValue10 * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.w = productValue11;
    fragmentColor0.x = productValue4;
    fragmentColor0.y = productValue5;
    fragmentColor0.z = productValue6;
    discardIfRequested();
#elif (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    if (scalarValue1 < fragmentScalarConstants1.packedValues[4u])
    {
        isFragmentDiscarded = true;
    }
    precise float productValue = varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue1 = varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue2 = varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue3 = varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w;
    precise float productValue4 = sampledTextureValue1.x * productValue;
    precise float productValue5 = sampledTextureValue1.y * productValue1;
    precise float productValue6 = sampledTextureValue1.z * productValue2;
    precise float productValue10 = scalarValue1 * productValue3;
    precise float productValue12 = productValue10 * fragmentScalarConstants1.packedValues[8u];
    fragmentColor0.w = productValue12;
    fragmentColor0.x = productValue4;
    fragmentColor0.y = productValue5;
    fragmentColor0.z = productValue6;
    discardIfRequested();
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    if (fragmentScalarConstants1.packedValues[4u] > 1.0)
    {
        isFragmentDiscarded = true;
    }
    precise float productValue = varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue1 = varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue2 = varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue3 = varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w;
    precise float productValue13 = productValue3 * fragmentScalarConstants1.packedValues[8u];
    fragmentColor0.w = productValue13;
    fragmentColor0.x = productValue;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue2;
    discardIfRequested();
#elif (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.w = (sampledTextureValue1.w * (varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w)) * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.x = sampledTextureValue1.x * (varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x);
    fragmentColor0.y = sampledTextureValue1.y * (varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y);
    fragmentColor0.z = sampledTextureValue1.z * (varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z);
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.w = (varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w) * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.x = varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z;
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    if (scalarValue1 <= 0.0)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.w = (scalarValue1 * (varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w)) * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.x = sampledTextureValue1.x * (varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x);
    fragmentColor0.y = sampledTextureValue1.y * (varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y);
    fragmentColor0.z = sampledTextureValue1.z * (varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z);
    discardIfRequested();
#elif (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    if (scalarValue1 < fragmentScalarConstants1.packedValues[4u])
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.w = (scalarValue1 * (varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w)) * fragmentScalarConstants1.packedValues[8u];
    fragmentColor0.x = sampledTextureValue1.x * (varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x);
    fragmentColor0.y = sampledTextureValue1.y * (varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y);
    fragmentColor0.z = sampledTextureValue1.z * (varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z);
    discardIfRequested();
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    if (fragmentScalarConstants1.packedValues[4u] > 1.0)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.w = (varyingColor0.w * fragmentVectorConstants1.packedValues[0u].w) * fragmentScalarConstants1.packedValues[8u];
    fragmentColor0.x = varyingColor0.x * fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = varyingColor0.y * fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = varyingColor0.z * fragmentVectorConstants1.packedValues[0u].z;
    discardIfRequested();
#elif (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = (sampledTextureValue.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = (sampledTextureValue.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = (sampledTextureValue.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[0u].z;
    fragmentColor0.w = ((sampledTextureValue.w * varyingColor0.w) * fragmentVectorConstants1.packedValues[0u].w) * fragmentVectorConstants1.packedValues[1u].x;
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = fragmentVectorConstants1.packedValues[0u].x * varyingColor0.x;
    fragmentColor0.y = fragmentVectorConstants1.packedValues[0u].y * varyingColor0.y;
    fragmentColor0.z = fragmentVectorConstants1.packedValues[0u].z * varyingColor0.z;
    fragmentColor0.w = (fragmentVectorConstants1.packedValues[0u].w * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].x;
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    if (!(!(scalarValue <= 0.0)))
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = (sampledTextureValue.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = (sampledTextureValue.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = (sampledTextureValue.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[0u].z;
    fragmentColor0.w = ((scalarValue * varyingColor0.w) * fragmentVectorConstants1.packedValues[0u].w) * fragmentVectorConstants1.packedValues[1u].x;
    discardIfRequested();
#elif (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    if (scalarValue < fragmentVectorConstants1.packedValues[1u].x)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = (sampledTextureValue.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = (sampledTextureValue.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = (sampledTextureValue.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[0u].z;
    fragmentColor0.w = ((scalarValue * varyingColor0.w) * fragmentVectorConstants1.packedValues[0u].w) * fragmentVectorConstants1.packedValues[2u].x;
    discardIfRequested();
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    if (fragmentVectorConstants1.packedValues[1u].x > 1.0)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = fragmentVectorConstants1.packedValues[0u].x * varyingColor0.x;
    fragmentColor0.y = fragmentVectorConstants1.packedValues[0u].y * varyingColor0.y;
    fragmentColor0.z = fragmentVectorConstants1.packedValues[0u].z * varyingColor0.z;
    fragmentColor0.w = (fragmentVectorConstants1.packedValues[0u].w * varyingColor0.w) * fragmentVectorConstants1.packedValues[2u].x;
    discardIfRequested();
#endif
}
