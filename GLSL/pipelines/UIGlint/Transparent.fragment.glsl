#version 460
#extension GL_GOOGLE_include_directive : require
// UIGlint / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/UIGlint/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    if (scalarValue <= 0.00390625)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.w;
    if (!(!(scalarValue1 <= 0.00390625)))
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float sumValue = sampledTextureValue2.x + sampledTextureValue1.x;
    precise float sumValue1 = sampledTextureValue2.y + sampledTextureValue1.y;
    precise float sumValue2 = sampledTextureValue2.z + sampledTextureValue1.z;
    precise float productValue7 = sumValue * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue8 = sumValue1 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue9 = sumValue2 * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue10 = productValue7 * fragmentVectorConstants1.packedValues[2u].x;
    precise float productValue11 = productValue8 * fragmentVectorConstants1.packedValues[2u].y;
    precise float productValue12 = productValue9 * fragmentVectorConstants1.packedValues[2u].z;
    precise float productValue13 = scalarValue * fragmentVectorConstants1.packedValues[2u].w;
    precise float productValue14 = productValue10 * productValue10;
    precise float productValue15 = productValue11 * productValue11;
    precise float productValue16 = productValue12 * productValue12;
    precise float productValue17 = productValue14 * fragmentScalarConstants1.packedValues[11u];
    precise float productValue18 = productValue15 * fragmentScalarConstants1.packedValues[11u];
    precise float productValue19 = productValue16 * fragmentScalarConstants1.packedValues[11u];
    precise float productValue20 = productValue17 * fragmentScalarConstants1.packedValues[4u];
    precise float productValue21 = productValue18 * fragmentScalarConstants1.packedValues[4u];
    precise float productValue22 = productValue19 * fragmentScalarConstants1.packedValues[4u];
    precise float productValue23 = productValue13 * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.x = productValue20;
    fragmentColor0.y = productValue21;
    fragmentColor0.z = productValue22;
    fragmentColor0.w = productValue23;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float productValue = ((sampledTextureValue2.x + sampledTextureValue1.x) * fragmentVectorConstants1.packedValues[0u].x) * fragmentVectorConstants1.packedValues[2u].x;
    float productValue1 = ((sampledTextureValue2.y + sampledTextureValue1.y) * fragmentVectorConstants1.packedValues[0u].y) * fragmentVectorConstants1.packedValues[2u].y;
    float productValue2 = ((sampledTextureValue2.z + sampledTextureValue1.z) * fragmentVectorConstants1.packedValues[0u].z) * fragmentVectorConstants1.packedValues[2u].z;
    fragmentColor0.x = ((productValue * productValue) * fragmentScalarConstants1.packedValues[11u]) * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.y = ((productValue1 * productValue1) * fragmentScalarConstants1.packedValues[11u]) * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.z = ((productValue2 * productValue2) * fragmentScalarConstants1.packedValues[11u]) * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.w = (scalarValue * fragmentVectorConstants1.packedValues[2u].w) * fragmentScalarConstants1.packedValues[4u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue4 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float productValue3 = ((sampledTextureValue5.x + sampledTextureValue4.x) * fragmentVectorConstants1.packedValues[0u].x) * fragmentVectorConstants1.packedValues[2u].x;
    float productValue4 = ((sampledTextureValue5.y + sampledTextureValue4.y) * fragmentVectorConstants1.packedValues[0u].y) * fragmentVectorConstants1.packedValues[2u].y;
    float productValue5 = ((sampledTextureValue5.z + sampledTextureValue4.z) * fragmentVectorConstants1.packedValues[0u].z) * fragmentVectorConstants1.packedValues[2u].z;
    float productValue6 = fragmentVectorConstants1.packedValues[1u].x * fragmentVectorConstants1.packedValues[2u].w;
    fragmentColor0.x = (productValue3 * productValue3) * productValue6;
    fragmentColor0.y = (productValue4 * productValue4) * productValue6;
    fragmentColor0.z = (productValue5 * productValue5) * productValue6;
    fragmentColor0.w = productValue6 * scalarValue1;
#endif
    discardIfRequested();
}
