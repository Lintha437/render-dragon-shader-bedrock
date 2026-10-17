#version 460
#extension GL_GOOGLE_include_directive : require
// FlameBillboard / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/FlameBillboard/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue = varyingTexCoord0.x + fragmentVectorConstants1.packedValues[0u].x;
    precise float sumValue1 = varyingTexCoord0.y + fragmentVectorConstants1.packedValues[0u].y;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(sumValue, sumValue1));
    float scalarValue8 = sampledTextureValue2.x;
    float scalarValue9 = sampledTextureValue2.y;
    float scalarValue10 = sampledTextureValue2.z;
    float scalarValue11 = sampledTextureValue2.w;
    if (scalarValue11 < 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x + fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord0.y + fragmentVectorConstants1.packedValues[0u].y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    if (scalarValue7 < 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(flameAtlasTexture, flameAtlasSampler), vec2(fragmentVectorConstants1.packedValues[0u].x + varyingTexCoord0.x, fragmentVectorConstants1.packedValues[0u].y + varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if (scalarValue3 < 0.5)
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue2 = varyingColor0.x - scalarValue8;
    precise float sumValue3 = varyingColor0.y - scalarValue9;
    precise float sumValue4 = varyingColor0.z - scalarValue10;
    fragmentColor0.x = fma(varyingColor0.w, sumValue2, scalarValue8);
    fragmentColor0.y = fma(varyingColor0.w, sumValue3, scalarValue9);
    fragmentColor0.z = fma(varyingColor0.w, sumValue4, scalarValue10);
    fragmentColor0.w = scalarValue11;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = fma(varyingColor0.w, varyingColor0.x - scalarValue4, scalarValue4);
    fragmentColor0.y = fma(varyingColor0.w, varyingColor0.y - scalarValue5, scalarValue5);
    fragmentColor0.z = fma(varyingColor0.w, varyingColor0.z - scalarValue6, scalarValue6);
    fragmentColor0.w = scalarValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = ((varyingColor0.x - scalarValue) * varyingColor0.w) + scalarValue;
    fragmentColor0.y = ((varyingColor0.y - scalarValue1) * varyingColor0.w) + scalarValue1;
    fragmentColor0.z = ((varyingColor0.z - scalarValue2) * varyingColor0.w) + scalarValue2;
    fragmentColor0.w = scalarValue3;
#endif
    discardIfRequested();
}
