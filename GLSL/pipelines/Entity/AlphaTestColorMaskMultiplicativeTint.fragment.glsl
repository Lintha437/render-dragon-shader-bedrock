#version 460
#extension GL_GOOGLE_include_directive : require
// Entity / AlphaTestColorMaskMultiplicativeTint / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 23
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/Entity/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    precise float productValue10 = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[11u];
    if (fma(fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[11u], scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue10 = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[11u];
    if (fma(fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[11u], fragmentScalarConstants1.packedValues[7u]) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue10 = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[11u];
    if (fma(fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[11u], fragmentScalarConstants1.packedValues[11u]) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    precise float productValue42 = scalarValue2 * fragmentScalarConstants1.packedValues[7u];
    if (fma(fragmentScalarConstants1.packedValues[7u], scalarValue2, scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.w;
    precise float productValue42 = scalarValue2 * fragmentScalarConstants1.packedValues[7u];
    if (fma(fragmentScalarConstants1.packedValues[7u], scalarValue2, fragmentScalarConstants1.packedValues[7u]) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue3.x;
    float scalarValue8 = sampledTextureValue3.y;
    float scalarValue9 = sampledTextureValue3.z;
    float scalarValue2 = sampledTextureValue3.w;
    precise float productValue42 = scalarValue2 * fragmentScalarConstants1.packedValues[7u];
    if (fma(fragmentScalarConstants1.packedValues[7u], scalarValue2, scalarValue2) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    precise float productValue84 = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[7u];
    if (fma(fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[7u], scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue84 = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[7u];
    if (fma(fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[7u]) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    precise float productValue107 = scalarValue17 * fragmentScalarConstants1.packedValues[7u];
    if (fma(scalarValue17, fragmentScalarConstants1.packedValues[7u], scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    precise float productValue107 = scalarValue17 * fragmentScalarConstants1.packedValues[7u];
    if (fma(scalarValue17, fragmentScalarConstants1.packedValues[7u], scalarValue17) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    precise float productValue107 = scalarValue17 * fragmentScalarConstants1.packedValues[7u];
    if (fma(scalarValue17, fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[7u]) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    precise float productValue133 = scalarValue17 * scalarValue2;
    if (fma(scalarValue17, scalarValue2, scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.w;
    precise float productValue133 = scalarValue17 * scalarValue2;
    if (fma(scalarValue17, scalarValue2, scalarValue17) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue3.x;
    float scalarValue8 = sampledTextureValue3.y;
    float scalarValue9 = sampledTextureValue3.z;
    float scalarValue2 = sampledTextureValue3.w;
    precise float productValue133 = scalarValue17 * scalarValue2;
    if (fma(scalarValue17, scalarValue2, scalarValue2) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    precise float productValue175 = scalarValue17 * scalarValue17;
    if (fma(scalarValue17, scalarValue17, scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    precise float productValue175 = scalarValue17 * scalarValue17;
    if (fma(scalarValue17, scalarValue17, scalarValue17) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    if (fma(fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[11u], scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    if (fma(fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[11u], fragmentScalarConstants1.packedValues[7u]) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    if (fma(fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[11u], fragmentScalarConstants1.packedValues[11u]) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    if (fma(fragmentScalarConstants1.packedValues[7u], scalarValue2, scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.w;
    if (fma(fragmentScalarConstants1.packedValues[7u], scalarValue2, fragmentScalarConstants1.packedValues[7u]) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue3.x;
    float scalarValue8 = sampledTextureValue3.y;
    float scalarValue9 = sampledTextureValue3.z;
    float scalarValue2 = sampledTextureValue3.w;
    if (fma(fragmentScalarConstants1.packedValues[7u], scalarValue2, scalarValue2) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    if (fma(fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[7u], scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    if (fma(fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[7u]) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    if (fma(scalarValue17, fragmentScalarConstants1.packedValues[7u], scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    if (fma(scalarValue17, fragmentScalarConstants1.packedValues[7u], scalarValue17) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    if (fma(scalarValue17, fragmentScalarConstants1.packedValues[7u], fragmentScalarConstants1.packedValues[7u]) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    if (fma(scalarValue17, scalarValue2, scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.w;
    if (fma(scalarValue17, scalarValue2, scalarValue17) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue3.x;
    float scalarValue8 = sampledTextureValue3.y;
    float scalarValue9 = sampledTextureValue3.z;
    float scalarValue2 = sampledTextureValue3.w;
    if (fma(scalarValue17, scalarValue2, scalarValue2) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    if (fma(scalarValue17, scalarValue17, scalarValue1) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue5.x;
    float scalarValue15 = sampledTextureValue5.y;
    float scalarValue16 = sampledTextureValue5.z;
    float scalarValue17 = sampledTextureValue5.w;
    if (fma(scalarValue17, scalarValue17, scalarValue17) <= 0.0)
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue = (((fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[1u].x) - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue1 = (((fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[1u].y) - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue2 = (((fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[1u].z) - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue3 = fragmentVectorConstants1.packedValues[2u].w * fragmentVectorConstants1.packedValues[1u].w;
    float productValue4 = (((fragmentVectorConstants1.packedValues[3u].x * sampledTextureValue.x) - productValue) * scalarValue) + productValue;
    float productValue5 = (((fragmentVectorConstants1.packedValues[3u].y * sampledTextureValue.y) - productValue1) * scalarValue) + productValue1;
    float productValue6 = (((fragmentVectorConstants1.packedValues[3u].z * sampledTextureValue.z) - productValue2) * scalarValue) + productValue2;
    if (!(!((scalarValue + productValue3) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (((fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[1u].x) - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue1 = (((fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[1u].y) - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue2 = (((fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[1u].z) - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue3 = fragmentVectorConstants1.packedValues[2u].w * fragmentVectorConstants1.packedValues[1u].w;
    float productValue14 = (((fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[1u].x) - productValue) * fragmentVectorConstants1.packedValues[1u].w) + productValue;
    float productValue15 = (((fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[1u].y) - productValue1) * fragmentVectorConstants1.packedValues[1u].w) + productValue1;
    float productValue16 = (((fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[1u].z) - productValue2) * fragmentVectorConstants1.packedValues[1u].w) + productValue2;
    if (!(!((productValue3 + fragmentVectorConstants1.packedValues[1u].w) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (((fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[1u].x) - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue1 = (((fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[1u].y) - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue2 = (((fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[1u].z) - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue3 = fragmentVectorConstants1.packedValues[2u].w * fragmentVectorConstants1.packedValues[1u].w;
    float productValue20 = (((fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[2u].x) - productValue) * fragmentVectorConstants1.packedValues[2u].w) + productValue;
    float productValue21 = (((fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[2u].y) - productValue1) * fragmentVectorConstants1.packedValues[2u].w) + productValue1;
    float productValue22 = (((fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[2u].z) - productValue2) * fragmentVectorConstants1.packedValues[2u].w) + productValue2;
    if (!(!((productValue3 + fragmentVectorConstants1.packedValues[2u].w) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue29 = (((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[1u].x) - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue30 = (((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[1u].y) - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue31 = (((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[1u].z) - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue32 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[1u].w;
    float productValue33 = (((fragmentVectorConstants1.packedValues[2u].x * sampledTextureValue.x) - productValue29) * scalarValue) + productValue29;
    float productValue34 = (((fragmentVectorConstants1.packedValues[2u].y * sampledTextureValue.y) - productValue30) * scalarValue) + productValue30;
    float productValue35 = (((fragmentVectorConstants1.packedValues[2u].z * sampledTextureValue.z) - productValue31) * scalarValue) + productValue31;
    if (!(!((scalarValue + productValue32) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue29 = (((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[1u].x) - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue30 = (((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[1u].y) - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue31 = (((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[1u].z) - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue32 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[1u].w;
    float productValue46 = (((fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[1u].x) - productValue29) * fragmentVectorConstants1.packedValues[1u].w) + productValue29;
    float productValue47 = (((fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[1u].y) - productValue30) * fragmentVectorConstants1.packedValues[1u].w) + productValue30;
    float productValue48 = (((fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[1u].z) - productValue31) * fragmentVectorConstants1.packedValues[1u].w) + productValue31;
    if (!(!((productValue32 + fragmentVectorConstants1.packedValues[1u].w) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue2.x;
    float scalarValue4 = sampledTextureValue2.y;
    float scalarValue5 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    float productValue52 = (((scalarValue3 * fragmentVectorConstants1.packedValues[1u].x) - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue53 = (((scalarValue4 * fragmentVectorConstants1.packedValues[1u].y) - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue54 = (((scalarValue5 * fragmentVectorConstants1.packedValues[1u].z) - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue55 = scalarValue6 * fragmentVectorConstants1.packedValues[1u].w;
    float productValue56 = (((fragmentVectorConstants1.packedValues[2u].x * scalarValue3) - productValue52) * scalarValue6) + productValue52;
    float productValue57 = (((fragmentVectorConstants1.packedValues[2u].y * scalarValue4) - productValue53) * scalarValue6) + productValue53;
    float productValue58 = (((fragmentVectorConstants1.packedValues[2u].z * scalarValue5) - productValue54) * scalarValue6) + productValue54;
    if (!(!((productValue55 + scalarValue6) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue65 = (((fragmentVectorConstants1.packedValues[1u].x * fragmentVectorConstants1.packedValues[1u].x) - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue66 = (((fragmentVectorConstants1.packedValues[1u].y * fragmentVectorConstants1.packedValues[1u].y) - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue67 = (((fragmentVectorConstants1.packedValues[1u].z * fragmentVectorConstants1.packedValues[1u].z) - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue68 = fragmentVectorConstants1.packedValues[1u].w * fragmentVectorConstants1.packedValues[1u].w;
    float productValue69 = (((fragmentVectorConstants1.packedValues[2u].x * sampledTextureValue.x) - productValue65) * scalarValue) + productValue65;
    float productValue70 = (((fragmentVectorConstants1.packedValues[2u].y * sampledTextureValue.y) - productValue66) * scalarValue) + productValue66;
    float productValue71 = (((fragmentVectorConstants1.packedValues[2u].z * sampledTextureValue.z) - productValue67) * scalarValue) + productValue67;
    if (!(!((scalarValue + productValue68) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue65 = (((fragmentVectorConstants1.packedValues[1u].x * fragmentVectorConstants1.packedValues[1u].x) - fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].x;
    float productValue66 = (((fragmentVectorConstants1.packedValues[1u].y * fragmentVectorConstants1.packedValues[1u].y) - fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].y;
    float productValue67 = (((fragmentVectorConstants1.packedValues[1u].z * fragmentVectorConstants1.packedValues[1u].z) - fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[1u].z;
    float productValue68 = fragmentVectorConstants1.packedValues[1u].w * fragmentVectorConstants1.packedValues[1u].w;
    float productValue78 = (((fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[1u].x) - productValue65) * fragmentVectorConstants1.packedValues[1u].w) + productValue65;
    float productValue79 = (((fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[1u].y) - productValue66) * fragmentVectorConstants1.packedValues[1u].w) + productValue66;
    float productValue80 = (((fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[1u].z) - productValue67) * fragmentVectorConstants1.packedValues[1u].w) + productValue67;
    if (!(!((productValue68 + fragmentVectorConstants1.packedValues[1u].w) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue13 = sampledTextureValue4.w;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue91 = (((fragmentVectorConstants1.packedValues[1u].x * scalarValue10) - scalarValue10) * scalarValue13) + scalarValue10;
    float productValue92 = (((fragmentVectorConstants1.packedValues[1u].y * scalarValue11) - scalarValue11) * scalarValue13) + scalarValue11;
    float productValue93 = (((fragmentVectorConstants1.packedValues[1u].z * scalarValue12) - scalarValue12) * scalarValue13) + scalarValue12;
    float productValue94 = fragmentVectorConstants1.packedValues[1u].w * scalarValue13;
    float productValue95 = (((fragmentVectorConstants1.packedValues[2u].x * sampledTextureValue.x) - productValue91) * scalarValue) + productValue91;
    float productValue96 = (((fragmentVectorConstants1.packedValues[2u].y * sampledTextureValue.y) - productValue92) * scalarValue) + productValue92;
    float productValue97 = (((fragmentVectorConstants1.packedValues[2u].z * sampledTextureValue.z) - productValue93) * scalarValue) + productValue93;
    if (!(!((scalarValue + productValue94) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue13 = sampledTextureValue4.w;
    float productValue91 = (((fragmentVectorConstants1.packedValues[1u].x * scalarValue10) - scalarValue10) * scalarValue13) + scalarValue10;
    float productValue92 = (((fragmentVectorConstants1.packedValues[1u].y * scalarValue11) - scalarValue11) * scalarValue13) + scalarValue11;
    float productValue93 = (((fragmentVectorConstants1.packedValues[1u].z * scalarValue12) - scalarValue12) * scalarValue13) + scalarValue12;
    float productValue94 = fragmentVectorConstants1.packedValues[1u].w * scalarValue13;
    float productValue101 = (((fragmentVectorConstants1.packedValues[2u].x * scalarValue10) - productValue91) * scalarValue13) + productValue91;
    float productValue102 = (((fragmentVectorConstants1.packedValues[2u].y * scalarValue11) - productValue92) * scalarValue13) + productValue92;
    float productValue103 = (((fragmentVectorConstants1.packedValues[2u].z * scalarValue12) - productValue93) * scalarValue13) + productValue93;
    if (!(!((productValue94 + scalarValue13) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue13 = sampledTextureValue4.w;
    float productValue91 = (((fragmentVectorConstants1.packedValues[1u].x * scalarValue10) - scalarValue10) * scalarValue13) + scalarValue10;
    float productValue92 = (((fragmentVectorConstants1.packedValues[1u].y * scalarValue11) - scalarValue11) * scalarValue13) + scalarValue11;
    float productValue93 = (((fragmentVectorConstants1.packedValues[1u].z * scalarValue12) - scalarValue12) * scalarValue13) + scalarValue12;
    float productValue94 = fragmentVectorConstants1.packedValues[1u].w * scalarValue13;
    float productValue111 = (((fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[1u].x) - productValue91) * fragmentVectorConstants1.packedValues[1u].w) + productValue91;
    float productValue112 = (((fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[1u].y) - productValue92) * fragmentVectorConstants1.packedValues[1u].w) + productValue92;
    float productValue113 = (((fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[1u].z) - productValue93) * fragmentVectorConstants1.packedValues[1u].w) + productValue93;
    if (!(!((productValue94 + fragmentVectorConstants1.packedValues[1u].w) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue13 = sampledTextureValue4.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue123 = (((sampledTextureValue2.x * scalarValue10) - scalarValue10) * scalarValue13) + scalarValue10;
    float productValue124 = (((sampledTextureValue2.y * scalarValue11) - scalarValue11) * scalarValue13) + scalarValue11;
    float productValue125 = (((sampledTextureValue2.z * scalarValue12) - scalarValue12) * scalarValue13) + scalarValue12;
    float productValue126 = sampledTextureValue2.w * scalarValue13;
    float productValue127 = (((fragmentVectorConstants1.packedValues[1u].x * sampledTextureValue.x) - productValue123) * scalarValue) + productValue123;
    float productValue128 = (((fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y) - productValue124) * scalarValue) + productValue124;
    float productValue129 = (((fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z) - productValue125) * scalarValue) + productValue125;
    if (!(!((scalarValue + productValue126) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue13 = sampledTextureValue4.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue123 = (((sampledTextureValue2.x * scalarValue10) - scalarValue10) * scalarValue13) + scalarValue10;
    float productValue124 = (((sampledTextureValue2.y * scalarValue11) - scalarValue11) * scalarValue13) + scalarValue11;
    float productValue125 = (((sampledTextureValue2.z * scalarValue12) - scalarValue12) * scalarValue13) + scalarValue12;
    float productValue126 = sampledTextureValue2.w * scalarValue13;
    float productValue137 = (((fragmentVectorConstants1.packedValues[1u].x * scalarValue10) - productValue123) * scalarValue13) + productValue123;
    float productValue138 = (((fragmentVectorConstants1.packedValues[1u].y * scalarValue11) - productValue124) * scalarValue13) + productValue124;
    float productValue139 = (((fragmentVectorConstants1.packedValues[1u].z * scalarValue12) - productValue125) * scalarValue13) + productValue125;
    if (!(!((productValue126 + scalarValue13) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue13 = sampledTextureValue4.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue2.x;
    float scalarValue4 = sampledTextureValue2.y;
    float scalarValue5 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    float productValue146 = (((scalarValue3 * scalarValue10) - scalarValue10) * scalarValue13) + scalarValue10;
    float productValue147 = (((scalarValue4 * scalarValue11) - scalarValue11) * scalarValue13) + scalarValue11;
    float productValue148 = (((scalarValue5 * scalarValue12) - scalarValue12) * scalarValue13) + scalarValue12;
    float productValue149 = scalarValue6 * scalarValue13;
    float productValue150 = (((fragmentVectorConstants1.packedValues[1u].x * scalarValue3) - productValue146) * scalarValue6) + productValue146;
    float productValue151 = (((fragmentVectorConstants1.packedValues[1u].y * scalarValue4) - productValue147) * scalarValue6) + productValue147;
    float productValue152 = (((fragmentVectorConstants1.packedValues[1u].z * scalarValue5) - productValue148) * scalarValue6) + productValue148;
    if (!(!((productValue149 + scalarValue6) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue13 = sampledTextureValue4.w;
    vec4 sampledTextureValue = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue159 = (((scalarValue10 * scalarValue10) - scalarValue10) * scalarValue13) + scalarValue10;
    float productValue160 = (((scalarValue11 * scalarValue11) - scalarValue11) * scalarValue13) + scalarValue11;
    float productValue161 = (((scalarValue12 * scalarValue12) - scalarValue12) * scalarValue13) + scalarValue12;
    float productValue162 = scalarValue13 * scalarValue13;
    float productValue163 = (((fragmentVectorConstants1.packedValues[1u].x * sampledTextureValue.x) - productValue159) * scalarValue) + productValue159;
    float productValue164 = (((fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y) - productValue160) * scalarValue) + productValue160;
    float productValue165 = (((fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z) - productValue161) * scalarValue) + productValue161;
    if (!(!((scalarValue + productValue162) <= 0.0)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue13 = sampledTextureValue4.w;
    float productValue159 = (((scalarValue10 * scalarValue10) - scalarValue10) * scalarValue13) + scalarValue10;
    float productValue160 = (((scalarValue11 * scalarValue11) - scalarValue11) * scalarValue13) + scalarValue11;
    float productValue161 = (((scalarValue12 * scalarValue12) - scalarValue12) * scalarValue13) + scalarValue12;
    float productValue162 = scalarValue13 * scalarValue13;
    float productValue169 = (((fragmentVectorConstants1.packedValues[1u].x * scalarValue10) - productValue159) * scalarValue13) + productValue159;
    float productValue170 = (((fragmentVectorConstants1.packedValues[1u].y * scalarValue11) - productValue160) * scalarValue13) + productValue160;
    float productValue171 = (((fragmentVectorConstants1.packedValues[1u].z * scalarValue12) - productValue161) * scalarValue13) + productValue161;
    if (!(!((productValue162 + scalarValue13) <= 0.0)))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue3 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, -multiplyAddValue), multiplyAddValue);
    float multiplyAddValue4 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, -multiplyAddValue1), multiplyAddValue1);
    float multiplyAddValue5 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, -multiplyAddValue2), multiplyAddValue2);
    precise float sumValue = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue3;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue4;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue5;
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[3u], sumValue, multiplyAddValue3);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[3u], sumValue1, multiplyAddValue4);
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[3u], sumValue2, multiplyAddValue5);
    precise float productValue11 = multiplyAddValue6 * varyingColor3.x;
    precise float productValue12 = multiplyAddValue7 * varyingColor3.y;
    precise float productValue13 = multiplyAddValue8 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue6, varyingColor3.x, varyingColor2.x), productValue11);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue7, varyingColor3.y, varyingColor2.y), productValue12);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue8, varyingColor3.z, varyingColor2.z), productValue13);
    fragmentColor0.w = productValue10;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[3u].x, -multiplyAddValue), multiplyAddValue);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[3u].y, -multiplyAddValue1), multiplyAddValue1);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[3u].z, -multiplyAddValue2), multiplyAddValue2);
    precise float sumValue3 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue12;
    precise float sumValue4 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue13;
    precise float sumValue5 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue14;
    float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[3u], sumValue3, multiplyAddValue12);
    float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[3u], sumValue4, multiplyAddValue13);
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[3u], sumValue5, multiplyAddValue14);
    precise float productValue26 = multiplyAddValue18 * varyingColor3.x;
    precise float productValue27 = multiplyAddValue19 * varyingColor3.y;
    precise float productValue28 = multiplyAddValue20 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue18, varyingColor3.x, varyingColor2.x), productValue26);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue19, varyingColor3.y, varyingColor2.y), productValue27);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue20, varyingColor3.z, varyingColor2.z), productValue28);
    fragmentColor0.w = productValue10;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue21 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[3u].x, -multiplyAddValue), multiplyAddValue);
    float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[3u].y, -multiplyAddValue1), multiplyAddValue1);
    float multiplyAddValue23 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z, -multiplyAddValue2), multiplyAddValue2);
    precise float sumValue6 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue21;
    precise float sumValue7 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue22;
    precise float sumValue8 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue23;
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[3u], sumValue6, multiplyAddValue21);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[3u], sumValue7, multiplyAddValue22);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[3u], sumValue8, multiplyAddValue23);
    precise float productValue39 = multiplyAddValue27 * varyingColor3.x;
    precise float productValue40 = multiplyAddValue28 * varyingColor3.y;
    precise float productValue41 = multiplyAddValue29 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue27, varyingColor3.x, varyingColor2.x), productValue39);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue28, varyingColor3.y, varyingColor2.y), productValue40);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue29, varyingColor3.z, varyingColor2.z), productValue41);
    fragmentColor0.w = productValue10;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue3.x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue3.y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue3.z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue33 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue30), multiplyAddValue30);
    float multiplyAddValue34 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue31), multiplyAddValue31);
    float multiplyAddValue35 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue32), multiplyAddValue32);
    precise float sumValue9 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue33;
    precise float sumValue10 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue34;
    precise float sumValue11 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue35;
    float multiplyAddValue36 = fma(fragmentScalarConstants1.packedValues[3u], sumValue9, multiplyAddValue33);
    float multiplyAddValue37 = fma(fragmentScalarConstants1.packedValues[3u], sumValue10, multiplyAddValue34);
    float multiplyAddValue38 = fma(fragmentScalarConstants1.packedValues[3u], sumValue11, multiplyAddValue35);
    precise float productValue43 = multiplyAddValue36 * varyingColor3.x;
    precise float productValue44 = multiplyAddValue37 * varyingColor3.y;
    precise float productValue45 = multiplyAddValue38 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue36, varyingColor3.x, varyingColor2.x), productValue43);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue37, varyingColor3.y, varyingColor2.y), productValue44);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue38, varyingColor3.z, varyingColor2.z), productValue45);
    fragmentColor0.w = productValue42;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue3.x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue3.y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue3.z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue30), multiplyAddValue30);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue31), multiplyAddValue31);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue32), multiplyAddValue32);
    precise float sumValue12 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue42;
    precise float sumValue13 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue43;
    precise float sumValue14 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue44;
    float multiplyAddValue48 = fma(fragmentScalarConstants1.packedValues[3u], sumValue12, multiplyAddValue42);
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[3u], sumValue13, multiplyAddValue43);
    float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[3u], sumValue14, multiplyAddValue44);
    precise float productValue62 = multiplyAddValue48 * varyingColor3.x;
    precise float productValue63 = multiplyAddValue49 * varyingColor3.y;
    precise float productValue64 = multiplyAddValue50 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue48, varyingColor3.x, varyingColor2.x), productValue62);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue49, varyingColor3.y, varyingColor2.y), productValue63);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue50, varyingColor3.z, varyingColor2.z), productValue64);
    fragmentColor0.w = productValue42;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, scalarValue7, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, scalarValue8, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue53 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, scalarValue9, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue54 = fma(scalarValue2, fma(scalarValue7, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue51), multiplyAddValue51);
    float multiplyAddValue55 = fma(scalarValue2, fma(scalarValue8, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue52), multiplyAddValue52);
    float multiplyAddValue56 = fma(scalarValue2, fma(scalarValue9, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue53), multiplyAddValue53);
    precise float sumValue15 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue54;
    precise float sumValue16 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue55;
    precise float sumValue17 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue56;
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[3u], sumValue15, multiplyAddValue54);
    float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[3u], sumValue16, multiplyAddValue55);
    float multiplyAddValue62 = fma(fragmentScalarConstants1.packedValues[3u], sumValue17, multiplyAddValue56);
    precise float productValue75 = multiplyAddValue60 * varyingColor3.x;
    precise float productValue76 = multiplyAddValue61 * varyingColor3.y;
    precise float productValue77 = multiplyAddValue62 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue60, varyingColor3.x, varyingColor2.x), productValue75);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue61, varyingColor3.y, varyingColor2.y), productValue76);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue62, varyingColor3.z, varyingColor2.z), productValue77);
    fragmentColor0.w = productValue42;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[1u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[1u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[1u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue66 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue63), multiplyAddValue63);
    float multiplyAddValue67 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue64), multiplyAddValue64);
    float multiplyAddValue68 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue65), multiplyAddValue65);
    precise float sumValue18 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue66;
    precise float sumValue19 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue67;
    precise float sumValue20 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue68;
    float multiplyAddValue72 = fma(fragmentScalarConstants1.packedValues[3u], sumValue18, multiplyAddValue66);
    float multiplyAddValue73 = fma(fragmentScalarConstants1.packedValues[3u], sumValue19, multiplyAddValue67);
    float multiplyAddValue74 = fma(fragmentScalarConstants1.packedValues[3u], sumValue20, multiplyAddValue68);
    precise float productValue85 = multiplyAddValue72 * varyingColor3.x;
    precise float productValue86 = multiplyAddValue73 * varyingColor3.y;
    precise float productValue87 = multiplyAddValue74 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue72, varyingColor3.x, varyingColor2.x), productValue85);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue73, varyingColor3.y, varyingColor2.y), productValue86);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue74, varyingColor3.z, varyingColor2.z), productValue87);
    fragmentColor0.w = productValue84;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[1u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[1u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[1u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue75 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue63), multiplyAddValue63);
    float multiplyAddValue76 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue64), multiplyAddValue64);
    float multiplyAddValue77 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue65), multiplyAddValue65);
    precise float sumValue21 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue75;
    precise float sumValue22 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue76;
    precise float sumValue23 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue77;
    float multiplyAddValue78 = fma(fragmentScalarConstants1.packedValues[3u], sumValue21, multiplyAddValue75);
    float multiplyAddValue79 = fma(fragmentScalarConstants1.packedValues[3u], sumValue22, multiplyAddValue76);
    float multiplyAddValue80 = fma(fragmentScalarConstants1.packedValues[3u], sumValue23, multiplyAddValue77);
    precise float productValue88 = multiplyAddValue78 * varyingColor3.x;
    precise float productValue89 = multiplyAddValue79 * varyingColor3.y;
    precise float productValue90 = multiplyAddValue80 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue78, varyingColor3.x, varyingColor2.x), productValue88);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue79, varyingColor3.y, varyingColor2.y), productValue89);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue80, varyingColor3.z, varyingColor2.z), productValue90);
    fragmentColor0.w = productValue84;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue84 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[1u].x, -scalarValue14), scalarValue14);
    float multiplyAddValue85 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[1u].y, -scalarValue15), scalarValue15);
    float multiplyAddValue86 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[1u].z, -scalarValue16), scalarValue16);
    float multiplyAddValue87 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue84), multiplyAddValue84);
    float multiplyAddValue88 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue85), multiplyAddValue85);
    float multiplyAddValue89 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue86), multiplyAddValue86);
    precise float sumValue24 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue87;
    precise float sumValue25 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue88;
    precise float sumValue26 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue89;
    float multiplyAddValue90 = fma(fragmentScalarConstants1.packedValues[3u], sumValue24, multiplyAddValue87);
    float multiplyAddValue91 = fma(fragmentScalarConstants1.packedValues[3u], sumValue25, multiplyAddValue88);
    float multiplyAddValue92 = fma(fragmentScalarConstants1.packedValues[3u], sumValue26, multiplyAddValue89);
    precise float productValue108 = multiplyAddValue90 * varyingColor3.x;
    precise float productValue109 = multiplyAddValue91 * varyingColor3.y;
    precise float productValue110 = multiplyAddValue92 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue90, varyingColor3.x, varyingColor2.x), productValue108);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue91, varyingColor3.y, varyingColor2.y), productValue109);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue92, varyingColor3.z, varyingColor2.z), productValue110);
    fragmentColor0.w = productValue107;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue84 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[1u].x, -scalarValue14), scalarValue14);
    float multiplyAddValue85 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[1u].y, -scalarValue15), scalarValue15);
    float multiplyAddValue86 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[1u].z, -scalarValue16), scalarValue16);
    float multiplyAddValue96 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue84), multiplyAddValue84);
    float multiplyAddValue97 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue85), multiplyAddValue85);
    float multiplyAddValue98 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue86), multiplyAddValue86);
    precise float sumValue27 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue96;
    precise float sumValue28 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue97;
    precise float sumValue29 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue98;
    float multiplyAddValue102 = fma(fragmentScalarConstants1.packedValues[3u], sumValue27, multiplyAddValue96);
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[3u], sumValue28, multiplyAddValue97);
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[3u], sumValue29, multiplyAddValue98);
    precise float productValue117 = multiplyAddValue102 * varyingColor3.x;
    precise float productValue118 = multiplyAddValue103 * varyingColor3.y;
    precise float productValue119 = multiplyAddValue104 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue102, varyingColor3.x, varyingColor2.x), productValue117);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue103, varyingColor3.y, varyingColor2.y), productValue118);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue104, varyingColor3.z, varyingColor2.z), productValue119);
    fragmentColor0.w = productValue107;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue84 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[1u].x, -scalarValue14), scalarValue14);
    float multiplyAddValue85 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[1u].y, -scalarValue15), scalarValue15);
    float multiplyAddValue86 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[1u].z, -scalarValue16), scalarValue16);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue84), multiplyAddValue84);
    float multiplyAddValue106 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue85), multiplyAddValue85);
    float multiplyAddValue107 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue86), multiplyAddValue86);
    precise float sumValue30 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue105;
    precise float sumValue31 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue106;
    precise float sumValue32 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue107;
    float multiplyAddValue111 = fma(fragmentScalarConstants1.packedValues[3u], sumValue30, multiplyAddValue105);
    float multiplyAddValue112 = fma(fragmentScalarConstants1.packedValues[3u], sumValue31, multiplyAddValue106);
    float multiplyAddValue113 = fma(fragmentScalarConstants1.packedValues[3u], sumValue32, multiplyAddValue107);
    precise float productValue120 = multiplyAddValue111 * varyingColor3.x;
    precise float productValue121 = multiplyAddValue112 * varyingColor3.y;
    precise float productValue122 = multiplyAddValue113 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue111, varyingColor3.x, varyingColor2.x), productValue120);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue112, varyingColor3.y, varyingColor2.y), productValue121);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue113, varyingColor3.z, varyingColor2.z), productValue122);
    fragmentColor0.w = productValue107;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue114 = fma(scalarValue17, fma(scalarValue14, sampledTextureValue3.x, -scalarValue14), scalarValue14);
    float multiplyAddValue115 = fma(scalarValue17, fma(scalarValue15, sampledTextureValue3.y, -scalarValue15), scalarValue15);
    float multiplyAddValue116 = fma(scalarValue17, fma(scalarValue16, sampledTextureValue3.z, -scalarValue16), scalarValue16);
    float multiplyAddValue117 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[1u].x, -multiplyAddValue114), multiplyAddValue114);
    float multiplyAddValue118 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[1u].y, -multiplyAddValue115), multiplyAddValue115);
    float multiplyAddValue119 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[1u].z, -multiplyAddValue116), multiplyAddValue116);
    precise float sumValue33 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue117;
    precise float sumValue34 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue118;
    precise float sumValue35 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue119;
    float multiplyAddValue123 = fma(fragmentScalarConstants1.packedValues[3u], sumValue33, multiplyAddValue117);
    float multiplyAddValue124 = fma(fragmentScalarConstants1.packedValues[3u], sumValue34, multiplyAddValue118);
    float multiplyAddValue125 = fma(fragmentScalarConstants1.packedValues[3u], sumValue35, multiplyAddValue119);
    precise float productValue134 = multiplyAddValue123 * varyingColor3.x;
    precise float productValue135 = multiplyAddValue124 * varyingColor3.y;
    precise float productValue136 = multiplyAddValue125 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue123, varyingColor3.x, varyingColor2.x), productValue134);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue124, varyingColor3.y, varyingColor2.y), productValue135);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue125, varyingColor3.z, varyingColor2.z), productValue136);
    fragmentColor0.w = productValue133;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue114 = fma(scalarValue17, fma(scalarValue14, sampledTextureValue3.x, -scalarValue14), scalarValue14);
    float multiplyAddValue115 = fma(scalarValue17, fma(scalarValue15, sampledTextureValue3.y, -scalarValue15), scalarValue15);
    float multiplyAddValue116 = fma(scalarValue17, fma(scalarValue16, sampledTextureValue3.z, -scalarValue16), scalarValue16);
    float multiplyAddValue126 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[1u].x, -multiplyAddValue114), multiplyAddValue114);
    float multiplyAddValue127 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[1u].y, -multiplyAddValue115), multiplyAddValue115);
    float multiplyAddValue128 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[1u].z, -multiplyAddValue116), multiplyAddValue116);
    precise float sumValue36 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue126;
    precise float sumValue37 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue127;
    precise float sumValue38 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue128;
    float multiplyAddValue132 = fma(fragmentScalarConstants1.packedValues[3u], sumValue36, multiplyAddValue126);
    float multiplyAddValue133 = fma(fragmentScalarConstants1.packedValues[3u], sumValue37, multiplyAddValue127);
    float multiplyAddValue134 = fma(fragmentScalarConstants1.packedValues[3u], sumValue38, multiplyAddValue128);
    precise float productValue143 = multiplyAddValue132 * varyingColor3.x;
    precise float productValue144 = multiplyAddValue133 * varyingColor3.y;
    precise float productValue145 = multiplyAddValue134 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue132, varyingColor3.x, varyingColor2.x), productValue143);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue133, varyingColor3.y, varyingColor2.y), productValue144);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue134, varyingColor3.z, varyingColor2.z), productValue145);
    fragmentColor0.w = productValue133;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue135 = fma(scalarValue17, fma(scalarValue14, scalarValue7, -scalarValue14), scalarValue14);
    float multiplyAddValue136 = fma(scalarValue17, fma(scalarValue15, scalarValue8, -scalarValue15), scalarValue15);
    float multiplyAddValue137 = fma(scalarValue17, fma(scalarValue16, scalarValue9, -scalarValue16), scalarValue16);
    float multiplyAddValue138 = fma(scalarValue2, fma(scalarValue7, fragmentVectorConstants1.packedValues[1u].x, -multiplyAddValue135), multiplyAddValue135);
    float multiplyAddValue139 = fma(scalarValue2, fma(scalarValue8, fragmentVectorConstants1.packedValues[1u].y, -multiplyAddValue136), multiplyAddValue136);
    float multiplyAddValue140 = fma(scalarValue2, fma(scalarValue9, fragmentVectorConstants1.packedValues[1u].z, -multiplyAddValue137), multiplyAddValue137);
    precise float sumValue39 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue138;
    precise float sumValue40 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue139;
    precise float sumValue41 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue140;
    float multiplyAddValue144 = fma(fragmentScalarConstants1.packedValues[3u], sumValue39, multiplyAddValue138);
    float multiplyAddValue145 = fma(fragmentScalarConstants1.packedValues[3u], sumValue40, multiplyAddValue139);
    float multiplyAddValue146 = fma(fragmentScalarConstants1.packedValues[3u], sumValue41, multiplyAddValue140);
    precise float productValue156 = multiplyAddValue144 * varyingColor3.x;
    precise float productValue157 = multiplyAddValue145 * varyingColor3.y;
    precise float productValue158 = multiplyAddValue146 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue144, varyingColor3.x, varyingColor2.x), productValue156);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue145, varyingColor3.y, varyingColor2.y), productValue157);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue146, varyingColor3.z, varyingColor2.z), productValue158);
    fragmentColor0.w = productValue133;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue147 = fma(scalarValue17, fma(scalarValue14, scalarValue14, -scalarValue14), scalarValue14);
    float multiplyAddValue148 = fma(scalarValue17, fma(scalarValue15, scalarValue15, -scalarValue15), scalarValue15);
    float multiplyAddValue149 = fma(scalarValue17, fma(scalarValue16, scalarValue16, -scalarValue16), scalarValue16);
    float multiplyAddValue150 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[1u].x, -multiplyAddValue147), multiplyAddValue147);
    float multiplyAddValue151 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[1u].y, -multiplyAddValue148), multiplyAddValue148);
    float multiplyAddValue152 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[1u].z, -multiplyAddValue149), multiplyAddValue149);
    precise float sumValue42 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue150;
    precise float sumValue43 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue151;
    precise float sumValue44 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue152;
    float multiplyAddValue156 = fma(fragmentScalarConstants1.packedValues[3u], sumValue42, multiplyAddValue150);
    float multiplyAddValue157 = fma(fragmentScalarConstants1.packedValues[3u], sumValue43, multiplyAddValue151);
    float multiplyAddValue158 = fma(fragmentScalarConstants1.packedValues[3u], sumValue44, multiplyAddValue152);
    precise float productValue176 = multiplyAddValue156 * varyingColor3.x;
    precise float productValue177 = multiplyAddValue157 * varyingColor3.y;
    precise float productValue178 = multiplyAddValue158 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue156, varyingColor3.x, varyingColor2.x), productValue176);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue157, varyingColor3.y, varyingColor2.y), productValue177);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue158, varyingColor3.z, varyingColor2.z), productValue178);
    fragmentColor0.w = productValue175;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue147 = fma(scalarValue17, fma(scalarValue14, scalarValue14, -scalarValue14), scalarValue14);
    float multiplyAddValue148 = fma(scalarValue17, fma(scalarValue15, scalarValue15, -scalarValue15), scalarValue15);
    float multiplyAddValue149 = fma(scalarValue17, fma(scalarValue16, scalarValue16, -scalarValue16), scalarValue16);
    float multiplyAddValue159 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[1u].x, -multiplyAddValue147), multiplyAddValue147);
    float multiplyAddValue160 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[1u].y, -multiplyAddValue148), multiplyAddValue148);
    float multiplyAddValue161 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[1u].z, -multiplyAddValue149), multiplyAddValue149);
    precise float sumValue45 = fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue159;
    precise float sumValue46 = fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue160;
    precise float sumValue47 = fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue161;
    float multiplyAddValue165 = fma(fragmentScalarConstants1.packedValues[3u], sumValue45, multiplyAddValue159);
    float multiplyAddValue166 = fma(fragmentScalarConstants1.packedValues[3u], sumValue46, multiplyAddValue160);
    float multiplyAddValue167 = fma(fragmentScalarConstants1.packedValues[3u], sumValue47, multiplyAddValue161);
    precise float productValue179 = multiplyAddValue165 * varyingColor3.x;
    precise float productValue180 = multiplyAddValue166 * varyingColor3.y;
    precise float productValue181 = multiplyAddValue167 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue165, varyingColor3.x, varyingColor2.x), productValue179);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue166, varyingColor3.y, varyingColor2.y), productValue180);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue167, varyingColor3.z, varyingColor2.z), productValue181);
    fragmentColor0.w = productValue175;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue3 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, -multiplyAddValue), multiplyAddValue);
    float multiplyAddValue4 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, -multiplyAddValue1), multiplyAddValue1);
    float multiplyAddValue5 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, -multiplyAddValue2), multiplyAddValue2);
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue3, multiplyAddValue3);
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue4, multiplyAddValue4);
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue5, multiplyAddValue5);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue9, varyingColor3.x, varyingColor2.x), multiplyAddValue9 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue10, varyingColor3.y, varyingColor2.y), multiplyAddValue10 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue11, varyingColor3.z, varyingColor2.z), multiplyAddValue11 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[3u].x, -multiplyAddValue), multiplyAddValue);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[3u].y, -multiplyAddValue1), multiplyAddValue1);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[3u].z, -multiplyAddValue2), multiplyAddValue2);
    float multiplyAddValue15 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue12, multiplyAddValue12);
    float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue13, multiplyAddValue13);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue14, multiplyAddValue14);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue15, varyingColor3.x, varyingColor2.x), multiplyAddValue15 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue16, varyingColor3.y, varyingColor2.y), multiplyAddValue16 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue17, varyingColor3.z, varyingColor2.z), multiplyAddValue17 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue21 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[3u].x, -multiplyAddValue), multiplyAddValue);
    float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[3u].y, -multiplyAddValue1), multiplyAddValue1);
    float multiplyAddValue23 = fma(fragmentScalarConstants1.packedValues[11u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z, -multiplyAddValue2), multiplyAddValue2);
    float multiplyAddValue24 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue21, multiplyAddValue21);
    float multiplyAddValue25 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue22, multiplyAddValue22);
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue23, multiplyAddValue23);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue24, varyingColor3.x, varyingColor2.x), multiplyAddValue24 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue25, varyingColor3.y, varyingColor2.y), multiplyAddValue25 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue26, varyingColor3.z, varyingColor2.z), multiplyAddValue26 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[11u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue3.x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue3.y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue3.z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue33 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue30), multiplyAddValue30);
    float multiplyAddValue34 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue31), multiplyAddValue31);
    float multiplyAddValue35 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue32), multiplyAddValue32);
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue33, multiplyAddValue33);
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue34, multiplyAddValue34);
    float multiplyAddValue41 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue35, multiplyAddValue35);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue39, varyingColor3.x, varyingColor2.x), multiplyAddValue39 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue40, varyingColor3.y, varyingColor2.y), multiplyAddValue40 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue41, varyingColor3.z, varyingColor2.z), multiplyAddValue41 * varyingColor3.z);
    fragmentColor0.w = scalarValue2 * fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue3.x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue3.y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue3.z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue30), multiplyAddValue30);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue31), multiplyAddValue31);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue32), multiplyAddValue32);
    float multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue42, multiplyAddValue42);
    float multiplyAddValue46 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue43, multiplyAddValue43);
    float multiplyAddValue47 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue44, multiplyAddValue44);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue45, varyingColor3.x, varyingColor2.x), multiplyAddValue45 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue46, varyingColor3.y, varyingColor2.y), multiplyAddValue46 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue47, varyingColor3.z, varyingColor2.z), multiplyAddValue47 * varyingColor3.z);
    fragmentColor0.w = scalarValue2 * fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, scalarValue7, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, scalarValue8, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue53 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, scalarValue9, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue54 = fma(scalarValue2, fma(scalarValue7, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue51), multiplyAddValue51);
    float multiplyAddValue55 = fma(scalarValue2, fma(scalarValue8, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue52), multiplyAddValue52);
    float multiplyAddValue56 = fma(scalarValue2, fma(scalarValue9, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue53), multiplyAddValue53);
    float multiplyAddValue57 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue54, multiplyAddValue54);
    float multiplyAddValue58 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue55, multiplyAddValue55);
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue56, multiplyAddValue56);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue57, varyingColor3.x, varyingColor2.x), multiplyAddValue57 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue58, varyingColor3.y, varyingColor2.y), multiplyAddValue58 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue59, varyingColor3.z, varyingColor2.z), multiplyAddValue59 * varyingColor3.z);
    fragmentColor0.w = scalarValue2 * fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[1u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[1u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[1u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue66 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue63), multiplyAddValue63);
    float multiplyAddValue67 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue64), multiplyAddValue64);
    float multiplyAddValue68 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue65), multiplyAddValue65);
    float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue66, multiplyAddValue66);
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue67, multiplyAddValue67);
    float multiplyAddValue71 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue68, multiplyAddValue68);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue69, varyingColor3.x, varyingColor2.x), multiplyAddValue69 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue70, varyingColor3.y, varyingColor2.y), multiplyAddValue70 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue71, varyingColor3.z, varyingColor2.z), multiplyAddValue71 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[1u].x, -fragmentVectorConstants1.packedValues[1u].x), fragmentVectorConstants1.packedValues[1u].x);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[1u].y, -fragmentVectorConstants1.packedValues[1u].y), fragmentVectorConstants1.packedValues[1u].y);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[1u].z, -fragmentVectorConstants1.packedValues[1u].z), fragmentVectorConstants1.packedValues[1u].z);
    float multiplyAddValue75 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue63), multiplyAddValue63);
    float multiplyAddValue76 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue64), multiplyAddValue64);
    float multiplyAddValue77 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue65), multiplyAddValue65);
    float multiplyAddValue81 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue75, multiplyAddValue75);
    float multiplyAddValue82 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue76, multiplyAddValue76);
    float multiplyAddValue83 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue77, multiplyAddValue77);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue81, varyingColor3.x, varyingColor2.x), multiplyAddValue81 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue82, varyingColor3.y, varyingColor2.y), multiplyAddValue82 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue83, varyingColor3.z, varyingColor2.z), multiplyAddValue83 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[7u] * fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue84 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[1u].x, -scalarValue14), scalarValue14);
    float multiplyAddValue85 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[1u].y, -scalarValue15), scalarValue15);
    float multiplyAddValue86 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[1u].z, -scalarValue16), scalarValue16);
    float multiplyAddValue87 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue84), multiplyAddValue84);
    float multiplyAddValue88 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue85), multiplyAddValue85);
    float multiplyAddValue89 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue86), multiplyAddValue86);
    float multiplyAddValue93 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue87, multiplyAddValue87);
    float multiplyAddValue94 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue88, multiplyAddValue88);
    float multiplyAddValue95 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue89, multiplyAddValue89);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue93, varyingColor3.x, varyingColor2.x), multiplyAddValue93 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue94, varyingColor3.y, varyingColor2.y), multiplyAddValue94 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue95, varyingColor3.z, varyingColor2.z), multiplyAddValue95 * varyingColor3.z);
    fragmentColor0.w = scalarValue17 * fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue84 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[1u].x, -scalarValue14), scalarValue14);
    float multiplyAddValue85 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[1u].y, -scalarValue15), scalarValue15);
    float multiplyAddValue86 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[1u].z, -scalarValue16), scalarValue16);
    float multiplyAddValue96 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue84), multiplyAddValue84);
    float multiplyAddValue97 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue85), multiplyAddValue85);
    float multiplyAddValue98 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue86), multiplyAddValue86);
    float multiplyAddValue99 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue96, multiplyAddValue96);
    float multiplyAddValue100 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue97, multiplyAddValue97);
    float multiplyAddValue101 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue98, multiplyAddValue98);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue99, varyingColor3.x, varyingColor2.x), multiplyAddValue99 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue100, varyingColor3.y, varyingColor2.y), multiplyAddValue100 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue101, varyingColor3.z, varyingColor2.z), multiplyAddValue101 * varyingColor3.z);
    fragmentColor0.w = scalarValue17 * fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue84 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[1u].x, -scalarValue14), scalarValue14);
    float multiplyAddValue85 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[1u].y, -scalarValue15), scalarValue15);
    float multiplyAddValue86 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[1u].z, -scalarValue16), scalarValue16);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[2u].x, -multiplyAddValue84), multiplyAddValue84);
    float multiplyAddValue106 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[2u].y, -multiplyAddValue85), multiplyAddValue85);
    float multiplyAddValue107 = fma(fragmentScalarConstants1.packedValues[7u], fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, -multiplyAddValue86), multiplyAddValue86);
    float multiplyAddValue108 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue105, multiplyAddValue105);
    float multiplyAddValue109 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue106, multiplyAddValue106);
    float multiplyAddValue110 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue107, multiplyAddValue107);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue108, varyingColor3.x, varyingColor2.x), multiplyAddValue108 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue109, varyingColor3.y, varyingColor2.y), multiplyAddValue109 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue110, varyingColor3.z, varyingColor2.z), multiplyAddValue110 * varyingColor3.z);
    fragmentColor0.w = scalarValue17 * fragmentScalarConstants1.packedValues[7u];
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue114 = fma(scalarValue17, fma(scalarValue14, sampledTextureValue3.x, -scalarValue14), scalarValue14);
    float multiplyAddValue115 = fma(scalarValue17, fma(scalarValue15, sampledTextureValue3.y, -scalarValue15), scalarValue15);
    float multiplyAddValue116 = fma(scalarValue17, fma(scalarValue16, sampledTextureValue3.z, -scalarValue16), scalarValue16);
    float multiplyAddValue117 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[1u].x, -multiplyAddValue114), multiplyAddValue114);
    float multiplyAddValue118 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[1u].y, -multiplyAddValue115), multiplyAddValue115);
    float multiplyAddValue119 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[1u].z, -multiplyAddValue116), multiplyAddValue116);
    float multiplyAddValue120 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue117, multiplyAddValue117);
    float multiplyAddValue121 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue118, multiplyAddValue118);
    float multiplyAddValue122 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue119, multiplyAddValue119);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue120, varyingColor3.x, varyingColor2.x), multiplyAddValue120 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue121, varyingColor3.y, varyingColor2.y), multiplyAddValue121 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue122, varyingColor3.z, varyingColor2.z), multiplyAddValue122 * varyingColor3.z);
    fragmentColor0.w = scalarValue17 * scalarValue2;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue114 = fma(scalarValue17, fma(scalarValue14, sampledTextureValue3.x, -scalarValue14), scalarValue14);
    float multiplyAddValue115 = fma(scalarValue17, fma(scalarValue15, sampledTextureValue3.y, -scalarValue15), scalarValue15);
    float multiplyAddValue116 = fma(scalarValue17, fma(scalarValue16, sampledTextureValue3.z, -scalarValue16), scalarValue16);
    float multiplyAddValue126 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[1u].x, -multiplyAddValue114), multiplyAddValue114);
    float multiplyAddValue127 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[1u].y, -multiplyAddValue115), multiplyAddValue115);
    float multiplyAddValue128 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[1u].z, -multiplyAddValue116), multiplyAddValue116);
    float multiplyAddValue129 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue126, multiplyAddValue126);
    float multiplyAddValue130 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue127, multiplyAddValue127);
    float multiplyAddValue131 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue128, multiplyAddValue128);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue129, varyingColor3.x, varyingColor2.x), multiplyAddValue129 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue130, varyingColor3.y, varyingColor2.y), multiplyAddValue130 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue131, varyingColor3.z, varyingColor2.z), multiplyAddValue131 * varyingColor3.z);
    fragmentColor0.w = scalarValue17 * scalarValue2;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue135 = fma(scalarValue17, fma(scalarValue14, scalarValue7, -scalarValue14), scalarValue14);
    float multiplyAddValue136 = fma(scalarValue17, fma(scalarValue15, scalarValue8, -scalarValue15), scalarValue15);
    float multiplyAddValue137 = fma(scalarValue17, fma(scalarValue16, scalarValue9, -scalarValue16), scalarValue16);
    float multiplyAddValue138 = fma(scalarValue2, fma(scalarValue7, fragmentVectorConstants1.packedValues[1u].x, -multiplyAddValue135), multiplyAddValue135);
    float multiplyAddValue139 = fma(scalarValue2, fma(scalarValue8, fragmentVectorConstants1.packedValues[1u].y, -multiplyAddValue136), multiplyAddValue136);
    float multiplyAddValue140 = fma(scalarValue2, fma(scalarValue9, fragmentVectorConstants1.packedValues[1u].z, -multiplyAddValue137), multiplyAddValue137);
    float multiplyAddValue141 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue138, multiplyAddValue138);
    float multiplyAddValue142 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue139, multiplyAddValue139);
    float multiplyAddValue143 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue140, multiplyAddValue140);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue141, varyingColor3.x, varyingColor2.x), multiplyAddValue141 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue142, varyingColor3.y, varyingColor2.y), multiplyAddValue142 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue143, varyingColor3.z, varyingColor2.z), multiplyAddValue143 * varyingColor3.z);
    fragmentColor0.w = scalarValue17 * scalarValue2;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue147 = fma(scalarValue17, fma(scalarValue14, scalarValue14, -scalarValue14), scalarValue14);
    float multiplyAddValue148 = fma(scalarValue17, fma(scalarValue15, scalarValue15, -scalarValue15), scalarValue15);
    float multiplyAddValue149 = fma(scalarValue17, fma(scalarValue16, scalarValue16, -scalarValue16), scalarValue16);
    float multiplyAddValue150 = fma(scalarValue1, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[1u].x, -multiplyAddValue147), multiplyAddValue147);
    float multiplyAddValue151 = fma(scalarValue1, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[1u].y, -multiplyAddValue148), multiplyAddValue148);
    float multiplyAddValue152 = fma(scalarValue1, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[1u].z, -multiplyAddValue149), multiplyAddValue149);
    float multiplyAddValue153 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue150, multiplyAddValue150);
    float multiplyAddValue154 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue151, multiplyAddValue151);
    float multiplyAddValue155 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue152, multiplyAddValue152);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue153, varyingColor3.x, varyingColor2.x), multiplyAddValue153 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue154, varyingColor3.y, varyingColor2.y), multiplyAddValue154 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue155, varyingColor3.z, varyingColor2.z), multiplyAddValue155 * varyingColor3.z);
    fragmentColor0.w = scalarValue17 * scalarValue17;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue147 = fma(scalarValue17, fma(scalarValue14, scalarValue14, -scalarValue14), scalarValue14);
    float multiplyAddValue148 = fma(scalarValue17, fma(scalarValue15, scalarValue15, -scalarValue15), scalarValue15);
    float multiplyAddValue149 = fma(scalarValue17, fma(scalarValue16, scalarValue16, -scalarValue16), scalarValue16);
    float multiplyAddValue159 = fma(scalarValue17, fma(scalarValue14, fragmentVectorConstants1.packedValues[1u].x, -multiplyAddValue147), multiplyAddValue147);
    float multiplyAddValue160 = fma(scalarValue17, fma(scalarValue15, fragmentVectorConstants1.packedValues[1u].y, -multiplyAddValue148), multiplyAddValue148);
    float multiplyAddValue161 = fma(scalarValue17, fma(scalarValue16, fragmentVectorConstants1.packedValues[1u].z, -multiplyAddValue149), multiplyAddValue149);
    float multiplyAddValue162 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - multiplyAddValue159, multiplyAddValue159);
    float multiplyAddValue163 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - multiplyAddValue160, multiplyAddValue160);
    float multiplyAddValue164 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - multiplyAddValue161, multiplyAddValue161);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue162, varyingColor3.x, varyingColor2.x), multiplyAddValue162 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue163, varyingColor3.y, varyingColor2.y), multiplyAddValue163 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue164, varyingColor3.z, varyingColor2.z), multiplyAddValue164 * varyingColor3.z);
    fragmentColor0.w = scalarValue17 * scalarValue17;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue7 = (((fragmentVectorConstants1.packedValues[0u].x - productValue4) * fragmentVectorConstants1.packedValues[0u].w) + productValue4) * varyingColor3.x;
    float productValue8 = (((fragmentVectorConstants1.packedValues[0u].y - productValue5) * fragmentVectorConstants1.packedValues[0u].w) + productValue5) * varyingColor3.y;
    float productValue9 = (((fragmentVectorConstants1.packedValues[0u].z - productValue6) * fragmentVectorConstants1.packedValues[0u].w) + productValue6) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.y = ((varyingColor2.y - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.z = ((varyingColor2.z - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.w = productValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue17 = (((fragmentVectorConstants1.packedValues[0u].x - productValue14) * fragmentVectorConstants1.packedValues[0u].w) + productValue14) * varyingColor3.x;
    float productValue18 = (((fragmentVectorConstants1.packedValues[0u].y - productValue15) * fragmentVectorConstants1.packedValues[0u].w) + productValue15) * varyingColor3.y;
    float productValue19 = (((fragmentVectorConstants1.packedValues[0u].z - productValue16) * fragmentVectorConstants1.packedValues[0u].w) + productValue16) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue17) * varyingColor2.w) + productValue17;
    fragmentColor0.y = ((varyingColor2.y - productValue18) * varyingColor2.w) + productValue18;
    fragmentColor0.z = ((varyingColor2.z - productValue19) * varyingColor2.w) + productValue19;
    fragmentColor0.w = productValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue23 = (((fragmentVectorConstants1.packedValues[0u].x - productValue20) * fragmentVectorConstants1.packedValues[0u].w) + productValue20) * varyingColor3.x;
    float productValue24 = (((fragmentVectorConstants1.packedValues[0u].y - productValue21) * fragmentVectorConstants1.packedValues[0u].w) + productValue21) * varyingColor3.y;
    float productValue25 = (((fragmentVectorConstants1.packedValues[0u].z - productValue22) * fragmentVectorConstants1.packedValues[0u].w) + productValue22) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue23) * varyingColor2.w) + productValue23;
    fragmentColor0.y = ((varyingColor2.y - productValue24) * varyingColor2.w) + productValue24;
    fragmentColor0.z = ((varyingColor2.z - productValue25) * varyingColor2.w) + productValue25;
    fragmentColor0.w = productValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue36 = (((fragmentVectorConstants1.packedValues[0u].x - productValue33) * fragmentVectorConstants1.packedValues[0u].w) + productValue33) * varyingColor3.x;
    float productValue37 = (((fragmentVectorConstants1.packedValues[0u].y - productValue34) * fragmentVectorConstants1.packedValues[0u].w) + productValue34) * varyingColor3.y;
    float productValue38 = (((fragmentVectorConstants1.packedValues[0u].z - productValue35) * fragmentVectorConstants1.packedValues[0u].w) + productValue35) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue36) * varyingColor2.w) + productValue36;
    fragmentColor0.y = ((varyingColor2.y - productValue37) * varyingColor2.w) + productValue37;
    fragmentColor0.z = ((varyingColor2.z - productValue38) * varyingColor2.w) + productValue38;
    fragmentColor0.w = productValue32;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue49 = (((fragmentVectorConstants1.packedValues[0u].x - productValue46) * fragmentVectorConstants1.packedValues[0u].w) + productValue46) * varyingColor3.x;
    float productValue50 = (((fragmentVectorConstants1.packedValues[0u].y - productValue47) * fragmentVectorConstants1.packedValues[0u].w) + productValue47) * varyingColor3.y;
    float productValue51 = (((fragmentVectorConstants1.packedValues[0u].z - productValue48) * fragmentVectorConstants1.packedValues[0u].w) + productValue48) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue49) * varyingColor2.w) + productValue49;
    fragmentColor0.y = ((varyingColor2.y - productValue50) * varyingColor2.w) + productValue50;
    fragmentColor0.z = ((varyingColor2.z - productValue51) * varyingColor2.w) + productValue51;
    fragmentColor0.w = productValue32;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue59 = (((fragmentVectorConstants1.packedValues[0u].x - productValue56) * fragmentVectorConstants1.packedValues[0u].w) + productValue56) * varyingColor3.x;
    float productValue60 = (((fragmentVectorConstants1.packedValues[0u].y - productValue57) * fragmentVectorConstants1.packedValues[0u].w) + productValue57) * varyingColor3.y;
    float productValue61 = (((fragmentVectorConstants1.packedValues[0u].z - productValue58) * fragmentVectorConstants1.packedValues[0u].w) + productValue58) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue59) * varyingColor2.w) + productValue59;
    fragmentColor0.y = ((varyingColor2.y - productValue60) * varyingColor2.w) + productValue60;
    fragmentColor0.z = ((varyingColor2.z - productValue61) * varyingColor2.w) + productValue61;
    fragmentColor0.w = productValue55;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue72 = (((fragmentVectorConstants1.packedValues[0u].x - productValue69) * fragmentVectorConstants1.packedValues[0u].w) + productValue69) * varyingColor3.x;
    float productValue73 = (((fragmentVectorConstants1.packedValues[0u].y - productValue70) * fragmentVectorConstants1.packedValues[0u].w) + productValue70) * varyingColor3.y;
    float productValue74 = (((fragmentVectorConstants1.packedValues[0u].z - productValue71) * fragmentVectorConstants1.packedValues[0u].w) + productValue71) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue72) * varyingColor2.w) + productValue72;
    fragmentColor0.y = ((varyingColor2.y - productValue73) * varyingColor2.w) + productValue73;
    fragmentColor0.z = ((varyingColor2.z - productValue74) * varyingColor2.w) + productValue74;
    fragmentColor0.w = productValue68;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue81 = (((fragmentVectorConstants1.packedValues[0u].x - productValue78) * fragmentVectorConstants1.packedValues[0u].w) + productValue78) * varyingColor3.x;
    float productValue82 = (((fragmentVectorConstants1.packedValues[0u].y - productValue79) * fragmentVectorConstants1.packedValues[0u].w) + productValue79) * varyingColor3.y;
    float productValue83 = (((fragmentVectorConstants1.packedValues[0u].z - productValue80) * fragmentVectorConstants1.packedValues[0u].w) + productValue80) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue81) * varyingColor2.w) + productValue81;
    fragmentColor0.y = ((varyingColor2.y - productValue82) * varyingColor2.w) + productValue82;
    fragmentColor0.z = ((varyingColor2.z - productValue83) * varyingColor2.w) + productValue83;
    fragmentColor0.w = productValue68;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue98 = (((fragmentVectorConstants1.packedValues[0u].x - productValue95) * fragmentVectorConstants1.packedValues[0u].w) + productValue95) * varyingColor3.x;
    float productValue99 = (((fragmentVectorConstants1.packedValues[0u].y - productValue96) * fragmentVectorConstants1.packedValues[0u].w) + productValue96) * varyingColor3.y;
    float productValue100 = (((fragmentVectorConstants1.packedValues[0u].z - productValue97) * fragmentVectorConstants1.packedValues[0u].w) + productValue97) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue98) * varyingColor2.w) + productValue98;
    fragmentColor0.y = ((varyingColor2.y - productValue99) * varyingColor2.w) + productValue99;
    fragmentColor0.z = ((varyingColor2.z - productValue100) * varyingColor2.w) + productValue100;
    fragmentColor0.w = productValue94;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue104 = (((fragmentVectorConstants1.packedValues[0u].x - productValue101) * fragmentVectorConstants1.packedValues[0u].w) + productValue101) * varyingColor3.x;
    float productValue105 = (((fragmentVectorConstants1.packedValues[0u].y - productValue102) * fragmentVectorConstants1.packedValues[0u].w) + productValue102) * varyingColor3.y;
    float productValue106 = (((fragmentVectorConstants1.packedValues[0u].z - productValue103) * fragmentVectorConstants1.packedValues[0u].w) + productValue103) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue104) * varyingColor2.w) + productValue104;
    fragmentColor0.y = ((varyingColor2.y - productValue105) * varyingColor2.w) + productValue105;
    fragmentColor0.z = ((varyingColor2.z - productValue106) * varyingColor2.w) + productValue106;
    fragmentColor0.w = productValue94;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue114 = (((fragmentVectorConstants1.packedValues[0u].x - productValue111) * fragmentVectorConstants1.packedValues[0u].w) + productValue111) * varyingColor3.x;
    float productValue115 = (((fragmentVectorConstants1.packedValues[0u].y - productValue112) * fragmentVectorConstants1.packedValues[0u].w) + productValue112) * varyingColor3.y;
    float productValue116 = (((fragmentVectorConstants1.packedValues[0u].z - productValue113) * fragmentVectorConstants1.packedValues[0u].w) + productValue113) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue114) * varyingColor2.w) + productValue114;
    fragmentColor0.y = ((varyingColor2.y - productValue115) * varyingColor2.w) + productValue115;
    fragmentColor0.z = ((varyingColor2.z - productValue116) * varyingColor2.w) + productValue116;
    fragmentColor0.w = productValue94;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue130 = (((fragmentVectorConstants1.packedValues[0u].x - productValue127) * fragmentVectorConstants1.packedValues[0u].w) + productValue127) * varyingColor3.x;
    float productValue131 = (((fragmentVectorConstants1.packedValues[0u].y - productValue128) * fragmentVectorConstants1.packedValues[0u].w) + productValue128) * varyingColor3.y;
    float productValue132 = (((fragmentVectorConstants1.packedValues[0u].z - productValue129) * fragmentVectorConstants1.packedValues[0u].w) + productValue129) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue130) * varyingColor2.w) + productValue130;
    fragmentColor0.y = ((varyingColor2.y - productValue131) * varyingColor2.w) + productValue131;
    fragmentColor0.z = ((varyingColor2.z - productValue132) * varyingColor2.w) + productValue132;
    fragmentColor0.w = productValue126;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue140 = (((fragmentVectorConstants1.packedValues[0u].x - productValue137) * fragmentVectorConstants1.packedValues[0u].w) + productValue137) * varyingColor3.x;
    float productValue141 = (((fragmentVectorConstants1.packedValues[0u].y - productValue138) * fragmentVectorConstants1.packedValues[0u].w) + productValue138) * varyingColor3.y;
    float productValue142 = (((fragmentVectorConstants1.packedValues[0u].z - productValue139) * fragmentVectorConstants1.packedValues[0u].w) + productValue139) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue140) * varyingColor2.w) + productValue140;
    fragmentColor0.y = ((varyingColor2.y - productValue141) * varyingColor2.w) + productValue141;
    fragmentColor0.z = ((varyingColor2.z - productValue142) * varyingColor2.w) + productValue142;
    fragmentColor0.w = productValue126;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue153 = (((fragmentVectorConstants1.packedValues[0u].x - productValue150) * fragmentVectorConstants1.packedValues[0u].w) + productValue150) * varyingColor3.x;
    float productValue154 = (((fragmentVectorConstants1.packedValues[0u].y - productValue151) * fragmentVectorConstants1.packedValues[0u].w) + productValue151) * varyingColor3.y;
    float productValue155 = (((fragmentVectorConstants1.packedValues[0u].z - productValue152) * fragmentVectorConstants1.packedValues[0u].w) + productValue152) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue153) * varyingColor2.w) + productValue153;
    fragmentColor0.y = ((varyingColor2.y - productValue154) * varyingColor2.w) + productValue154;
    fragmentColor0.z = ((varyingColor2.z - productValue155) * varyingColor2.w) + productValue155;
    fragmentColor0.w = productValue149;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue166 = (((fragmentVectorConstants1.packedValues[0u].x - productValue163) * fragmentVectorConstants1.packedValues[0u].w) + productValue163) * varyingColor3.x;
    float productValue167 = (((fragmentVectorConstants1.packedValues[0u].y - productValue164) * fragmentVectorConstants1.packedValues[0u].w) + productValue164) * varyingColor3.y;
    float productValue168 = (((fragmentVectorConstants1.packedValues[0u].z - productValue165) * fragmentVectorConstants1.packedValues[0u].w) + productValue165) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue166) * varyingColor2.w) + productValue166;
    fragmentColor0.y = ((varyingColor2.y - productValue167) * varyingColor2.w) + productValue167;
    fragmentColor0.z = ((varyingColor2.z - productValue168) * varyingColor2.w) + productValue168;
    fragmentColor0.w = productValue162;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue172 = (((fragmentVectorConstants1.packedValues[0u].x - productValue169) * fragmentVectorConstants1.packedValues[0u].w) + productValue169) * varyingColor3.x;
    float productValue173 = (((fragmentVectorConstants1.packedValues[0u].y - productValue170) * fragmentVectorConstants1.packedValues[0u].w) + productValue170) * varyingColor3.y;
    float productValue174 = (((fragmentVectorConstants1.packedValues[0u].z - productValue171) * fragmentVectorConstants1.packedValues[0u].w) + productValue171) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue172) * varyingColor2.w) + productValue172;
    fragmentColor0.y = ((varyingColor2.y - productValue173) * varyingColor2.w) + productValue173;
    fragmentColor0.z = ((varyingColor2.z - productValue174) * varyingColor2.w) + productValue174;
    fragmentColor0.w = productValue162;
#endif
    discardIfRequested();
}
