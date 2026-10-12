#version 460
#extension GL_GOOGLE_include_directive : require
// ParticleForwardPBR / AlphaTest / fragment forward pipeline.
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
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/ParticleForwardPBR/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    if (sampledTextureValue.w < 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue1 = texture(sampler2D(particleTextureTexture, particleTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue1.w < 0.5)
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue3 = scalarValue * varyingColor0.x;
    precise float productValue4 = scalarValue1 * varyingColor0.y;
    precise float productValue5 = scalarValue2 * varyingColor0.z;
    fragmentColor0.x = fma(varyingColor1.w, fma(-scalarValue, varyingColor0.x, varyingColor1.x), productValue3);
    fragmentColor0.y = fma(varyingColor1.w, fma(-scalarValue1, varyingColor0.y, varyingColor1.y), productValue4);
    fragmentColor0.z = fma(varyingColor1.w, fma(-scalarValue2, varyingColor0.z, varyingColor1.z), productValue5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = fma(varyingColor1.w, fma(-scalarValue, varyingColor0.x, varyingColor1.x), scalarValue * varyingColor0.x);
    fragmentColor0.y = fma(varyingColor1.w, fma(-scalarValue1, varyingColor0.y, varyingColor1.y), scalarValue1 * varyingColor0.y);
    fragmentColor0.z = fma(varyingColor1.w, fma(-scalarValue2, varyingColor0.z, varyingColor1.z), scalarValue2 * varyingColor0.z);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = sampledTextureValue1.x * varyingColor0.x;
    float productValue1 = sampledTextureValue1.y * varyingColor0.y;
    float productValue2 = sampledTextureValue1.z * varyingColor0.z;
    fragmentColor0.x = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    fragmentColor0.y = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    fragmentColor0.z = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
#endif
    fragmentColor0.w = 1.0;
    discardIfRequested();
}
