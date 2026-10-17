#version 460
#extension GL_GOOGLE_include_directive : require
// ParticlePrepass / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/ParticlePrepass/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    if (sampledTextureValue1.w < 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(particleTextureTexture, particleTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue.w < 0.5)
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue3 = scalarValue * varyingColor0.x;
    precise float productValue4 = scalarValue1 * varyingColor0.y;
    precise float productValue5 = scalarValue2 * varyingColor0.z;
    fragmentColor1.x = fma(varyingColor1.w, fma(-scalarValue, varyingColor0.x, varyingColor1.x), productValue3);
    fragmentColor1.y = fma(varyingColor1.w, fma(-scalarValue1, varyingColor0.y, varyingColor1.y), productValue4);
    fragmentColor1.z = fma(varyingColor1.w, fma(-scalarValue2, varyingColor0.z, varyingColor1.z), productValue5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor1.x = fma(varyingColor1.w, fma(-scalarValue, varyingColor0.x, varyingColor1.x), scalarValue * varyingColor0.x);
    fragmentColor1.y = fma(varyingColor1.w, fma(-scalarValue1, varyingColor0.y, varyingColor1.y), scalarValue1 * varyingColor0.y);
    fragmentColor1.z = fma(varyingColor1.w, fma(-scalarValue2, varyingColor0.z, varyingColor1.z), scalarValue2 * varyingColor0.z);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
#endif
    fragmentColor0.x = 0u;
    fragmentColor0.y = 0u;
    fragmentColor0.z = 0u;
    fragmentColor0.w = 0u;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor1.x = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    fragmentColor1.y = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    fragmentColor1.z = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
#endif
    fragmentColor1.w = 1.0;
    fragmentColor2.x = 0.0;
    fragmentColor2.y = 0.0;
    fragmentColor2.z = 0.0;
    fragmentColor2.w = 0.0;
    discardIfRequested();
}
