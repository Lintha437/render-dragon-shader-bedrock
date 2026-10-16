#version 460
#extension GL_GOOGLE_include_directive : require
// ParticlePrepass / Transparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 4
#endif


#include "../../include/materials/ParticlePrepass/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(particleTextureTexture, particleTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
    float productValue3 = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    float productValue4 = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    float productValue5 = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
#endif
    fragmentColor0.x = 0u;
    fragmentColor0.y = 0u;
    fragmentColor0.z = 0u;
    fragmentColor0.w = 0u;
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    precise float productValue6 = scalarValue * varyingColor0.x;
    precise float productValue7 = scalarValue1 * varyingColor0.y;
    precise float productValue8 = scalarValue2 * varyingColor0.z;
    precise float productValue9 = sampledTextureValue1.w * varyingColor0.w;
    float multiplyAddValue = fma(varyingColor1.w, fma(-scalarValue, varyingColor0.x, varyingColor1.x), productValue6);
    float multiplyAddValue1 = fma(varyingColor1.w, fma(-scalarValue1, varyingColor0.y, varyingColor1.y), productValue7);
    float multiplyAddValue2 = fma(varyingColor1.w, fma(-scalarValue2, varyingColor0.z, varyingColor1.z), productValue8);
    fragmentColor1.w = productValue9;
    precise float sumValue = varyingColor1.x - multiplyAddValue;
    precise float sumValue1 = varyingColor1.y - multiplyAddValue1;
    precise float sumValue2 = varyingColor1.z - multiplyAddValue2;
    fragmentColor1.x = fma(varyingColor1.w, sumValue, multiplyAddValue);
    fragmentColor1.y = fma(varyingColor1.w, sumValue1, multiplyAddValue1);
    fragmentColor1.z = fma(varyingColor1.w, sumValue2, multiplyAddValue2);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    float multiplyAddValue3 = fma(varyingColor1.w, fma(-scalarValue, varyingColor0.x, varyingColor1.x), scalarValue * varyingColor0.x);
    float multiplyAddValue4 = fma(varyingColor1.w, fma(-scalarValue1, varyingColor0.y, varyingColor1.y), scalarValue1 * varyingColor0.y);
    float multiplyAddValue5 = fma(varyingColor1.w, fma(-scalarValue2, varyingColor0.z, varyingColor1.z), scalarValue2 * varyingColor0.z);
    fragmentColor1.w = sampledTextureValue1.w * varyingColor0.w;
    fragmentColor1.x = fma(varyingColor1.w, varyingColor1.x - multiplyAddValue3, multiplyAddValue3);
    fragmentColor1.y = fma(varyingColor1.w, varyingColor1.y - multiplyAddValue4, multiplyAddValue4);
    fragmentColor1.z = fma(varyingColor1.w, varyingColor1.z - multiplyAddValue5, multiplyAddValue5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor1.x = ((varyingColor1.x - productValue3) * varyingColor1.w) + productValue3;
    fragmentColor1.y = ((varyingColor1.y - productValue4) * varyingColor1.w) + productValue4;
    fragmentColor1.z = ((varyingColor1.z - productValue5) * varyingColor1.w) + productValue5;
    fragmentColor1.w = sampledTextureValue.w * varyingColor0.w;
#endif
    fragmentColor2.x = 0.0;
    fragmentColor2.y = 0.0;
    fragmentColor2.z = 0.0;
    fragmentColor2.w = 0.0;
}
