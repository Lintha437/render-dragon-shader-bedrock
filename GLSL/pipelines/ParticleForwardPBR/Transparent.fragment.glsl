#version 460
#extension GL_GOOGLE_include_directive : require
// ParticleForwardPBR / Transparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 5
#endif


#include "../../include/materials/ParticleForwardPBR/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    precise float productValue = scalarValue * varyingColor0.x;
    precise float productValue1 = scalarValue1 * varyingColor0.y;
    precise float productValue2 = scalarValue2 * varyingColor0.z;
    precise float productValue3 = sampledTextureValue.w * varyingColor0.w;
    float multiplyAddValue3 = fma(varyingColor1.w, fma(-scalarValue, varyingColor0.x, varyingColor1.x), productValue);
    float multiplyAddValue4 = fma(varyingColor1.w, fma(-scalarValue1, varyingColor0.y, varyingColor1.y), productValue1);
    float multiplyAddValue5 = fma(varyingColor1.w, fma(-scalarValue2, varyingColor0.z, varyingColor1.z), productValue2);
    fragmentColor0.w = productValue3;
    precise float sumValue = varyingColor1.x - multiplyAddValue3;
    precise float sumValue1 = varyingColor1.y - multiplyAddValue4;
    precise float sumValue2 = varyingColor1.z - multiplyAddValue5;
    fragmentColor0.x = fma(varyingColor1.w, sumValue, multiplyAddValue3);
    fragmentColor0.y = fma(varyingColor1.w, sumValue1, multiplyAddValue4);
    fragmentColor0.z = fma(varyingColor1.w, sumValue2, multiplyAddValue5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float multiplyAddValue = fma(varyingColor1.w, fma(-scalarValue, varyingColor0.x, varyingColor1.x), scalarValue * varyingColor0.x);
    float multiplyAddValue1 = fma(varyingColor1.w, fma(-scalarValue1, varyingColor0.y, varyingColor1.y), scalarValue1 * varyingColor0.y);
    float multiplyAddValue2 = fma(varyingColor1.w, fma(-scalarValue2, varyingColor0.z, varyingColor1.z), scalarValue2 * varyingColor0.z);
    fragmentColor0.w = sampledTextureValue.w * varyingColor0.w;
    fragmentColor0.x = fma(varyingColor1.w, varyingColor1.x - multiplyAddValue, multiplyAddValue);
    fragmentColor0.y = fma(varyingColor1.w, varyingColor1.y - multiplyAddValue1, multiplyAddValue1);
    fragmentColor0.z = fma(varyingColor1.w, varyingColor1.z - multiplyAddValue2, multiplyAddValue2);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue1 = texture(sampler2D(particleTextureTexture, particleTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue4 = sampledTextureValue1.x * varyingColor0.x;
    float productValue5 = sampledTextureValue1.y * varyingColor0.y;
    float productValue6 = sampledTextureValue1.z * varyingColor0.z;
    float productValue7 = ((varyingColor1.x - productValue4) * varyingColor1.w) + productValue4;
    float productValue8 = ((varyingColor1.y - productValue5) * varyingColor1.w) + productValue5;
    float productValue9 = ((varyingColor1.z - productValue6) * varyingColor1.w) + productValue6;
    fragmentColor0.x = ((varyingColor1.x - productValue7) * varyingColor1.w) + productValue7;
    fragmentColor0.y = ((varyingColor1.y - productValue8) * varyingColor1.w) + productValue8;
    fragmentColor0.z = ((varyingColor1.z - productValue9) * varyingColor1.w) + productValue9;
    fragmentColor0.w = sampledTextureValue1.w * varyingColor0.w;
#endif
}
