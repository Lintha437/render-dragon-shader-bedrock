#version 460
#extension GL_GOOGLE_include_directive : require
// EndPortal / Opaque / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/EndPortal/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    precise float sumValue2 = 1.0 - varyingTexCoord2;
    precise float productValue4 = sampledTextureValue.x * sumValue2;
    precise float productValue5 = sampledTextureValue.y * sumValue2;
    precise float productValue6 = sampledTextureValue.z * sumValue2;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue7 = productValue4 * sampledTextureValue1.x;
    precise float productValue8 = productValue5 * sampledTextureValue1.y;
    precise float productValue9 = productValue6 * sampledTextureValue1.z;
    precise float sumValue3 = 1.0 - varyingColor0.w;
    precise float productValue10 = sumValue3 * productValue7;
    precise float productValue11 = sumValue3 * productValue8;
    precise float productValue12 = sumValue3 * productValue9;
    bool conditionValue = varyingTexCoord2 > 0.96875;
    precise float productValue13 = varyingColor0.w * varyingColor0.x;
    precise float productValue14 = varyingColor0.w * varyingColor0.y;
    precise float productValue15 = varyingColor0.w * varyingColor0.z;
    fragmentColor0.x = conditionValue ? productValue13 : productValue10;
    fragmentColor0.y = conditionValue ? productValue14 : productValue11;
    fragmentColor0.z = conditionValue ? productValue15 : productValue12;
    fragmentColor0.w = float(conditionValue);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float sumValue = 1.0 - varyingTexCoord2;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float sumValue1 = 1.0 - varyingColor0.w;
    bool conditionValue = varyingTexCoord2 > 0.96875;
    fragmentColor0.x = conditionValue ? (varyingColor0.w * varyingColor0.x) : (sumValue1 * ((sampledTextureValue.x * sumValue) * sampledTextureValue1.x));
    fragmentColor0.y = conditionValue ? (varyingColor0.w * varyingColor0.y) : (sumValue1 * ((sampledTextureValue.y * sumValue) * sampledTextureValue1.y));
    fragmentColor0.z = conditionValue ? (varyingColor0.w * varyingColor0.z) : (sumValue1 * ((sampledTextureValue.z * sumValue) * sampledTextureValue1.z));
    fragmentColor0.w = float(conditionValue);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue2 = texture(sampler2D(colorTextureTexture, colorTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(parallaxTextureTexture, parallaxTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue1;
    float productValue2;
    float productValue3;
    float intermediateValue;
    if ((varyingTexCoord2 * 32.0) > 31.0)
    {
        productValue1 = varyingColor0.x * varyingColor0.w;
        productValue2 = varyingColor0.y * varyingColor0.w;
        productValue3 = varyingColor0.z * varyingColor0.w;
        intermediateValue = 1.0;
    }
    else
    {
        float productValue = (1.0 - varyingTexCoord2) * (1.0 - varyingColor0.w);
        productValue1 = (sampledTextureValue2.x * productValue) * sampledTextureValue3.x;
        productValue2 = (sampledTextureValue2.y * productValue) * sampledTextureValue3.y;
        productValue3 = (sampledTextureValue2.z * productValue) * sampledTextureValue3.z;
        intermediateValue = 0.0;
    }
    fragmentColor0.x = productValue1;
    fragmentColor0.y = productValue2;
    fragmentColor0.z = productValue3;
    fragmentColor0.w = intermediateValue;
#endif
}
