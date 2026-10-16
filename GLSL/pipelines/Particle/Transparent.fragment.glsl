#version 460
#extension GL_GOOGLE_include_directive : require
// Particle / Transparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/Particle/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    precise float productValue6 = scalarValue * varyingColor0.x;
    precise float productValue7 = scalarValue1 * varyingColor0.y;
    precise float productValue8 = scalarValue2 * varyingColor0.z;
    precise float productValue9 = sampledTextureValue1.w * varyingColor0.w;
    float multiplyAddValue3 = fma(varyingColor1.w, fma(-scalarValue, varyingColor0.x, varyingColor1.x), productValue6);
    float multiplyAddValue4 = fma(varyingColor1.w, fma(-scalarValue1, varyingColor0.y, varyingColor1.y), productValue7);
    float multiplyAddValue5 = fma(varyingColor1.w, fma(-scalarValue2, varyingColor0.z, varyingColor1.z), productValue8);
    fragmentColor0.w = productValue9;
    precise float sumValue = varyingColor1.x - multiplyAddValue3;
    precise float sumValue1 = varyingColor1.y - multiplyAddValue4;
    precise float sumValue2 = varyingColor1.z - multiplyAddValue5;
    fragmentColor0.x = fma(varyingColor1.w, sumValue, multiplyAddValue3);
    fragmentColor0.y = fma(varyingColor1.w, sumValue1, multiplyAddValue4);
    fragmentColor0.z = fma(varyingColor1.w, sumValue2, multiplyAddValue5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    float multiplyAddValue = fma(varyingColor1.w, fma(-scalarValue, varyingColor0.x, varyingColor1.x), scalarValue * varyingColor0.x);
    float multiplyAddValue1 = fma(varyingColor1.w, fma(-scalarValue1, varyingColor0.y, varyingColor1.y), scalarValue1 * varyingColor0.y);
    float multiplyAddValue2 = fma(varyingColor1.w, fma(-scalarValue2, varyingColor0.z, varyingColor1.z), scalarValue2 * varyingColor0.z);
    fragmentColor0.w = sampledTextureValue1.w * varyingColor0.w;
    fragmentColor0.x = fma(varyingColor1.w, varyingColor1.x - multiplyAddValue, multiplyAddValue);
    fragmentColor0.y = fma(varyingColor1.w, varyingColor1.y - multiplyAddValue1, multiplyAddValue1);
    fragmentColor0.z = fma(varyingColor1.w, varyingColor1.z - multiplyAddValue2, multiplyAddValue2);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(particleTextureTexture, particleTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
    float productValue3 = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    float productValue4 = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    float productValue5 = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    fragmentColor0.x = ((varyingColor1.x - productValue3) * varyingColor1.w) + productValue3;
    fragmentColor0.y = ((varyingColor1.y - productValue4) * varyingColor1.w) + productValue4;
    fragmentColor0.z = ((varyingColor1.z - productValue5) * varyingColor1.w) + productValue5;
    fragmentColor0.w = sampledTextureValue.w * varyingColor0.w;
#endif
}
