#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunk / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 12
#endif


#include "../../include/materials/RenderChunk/FragmentBindings.glsli"

void main()
{
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue2.x;
    float scalarValue5 = sampledTextureValue2.y;
    float scalarValue6 = sampledTextureValue2.z;
    float scalarValue7 = sampledTextureValue2.w;
    precise float productValue9 = scalarValue4 * varyingColor0.x;
    precise float productValue10 = scalarValue5 * varyingColor0.y;
    precise float productValue11 = scalarValue6 * varyingColor0.z;
    precise float multiplyAddValue3 = fma(scalarValue7, fma(scalarValue4, varyingColor0.x, -scalarValue4), scalarValue4) * varyingColor0.w;
    precise float multiplyAddValue4 = fma(scalarValue7, fma(scalarValue5, varyingColor0.y, -scalarValue5), scalarValue5) * varyingColor0.w;
    precise float multiplyAddValue5 = fma(scalarValue7, fma(scalarValue6, varyingColor0.z, -scalarValue6), scalarValue6) * varyingColor0.w;
    bool conditionValue = varyingTexCoord2.y > 0.5;
    float comparisonValue = conditionValue ? multiplyAddValue3 : productValue9;
    float comparisonValue1 = conditionValue ? multiplyAddValue4 : productValue10;
    float comparisonValue2 = conditionValue ? multiplyAddValue5 : productValue11;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue8 = sampledTextureValue3.x;
    float scalarValue9 = sampledTextureValue3.y;
    float scalarValue10 = sampledTextureValue3.z;
    precise float productValue12 = comparisonValue * scalarValue8;
    precise float productValue13 = comparisonValue1 * scalarValue9;
    precise float productValue14 = comparisonValue2 * scalarValue10;
    fragmentColor0.w = conditionValue ? 1.0 : varyingColor0.w;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue8, comparisonValue, fragmentVectorConstants1.packedValues[0u].x), productValue12);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue9, comparisonValue1, fragmentVectorConstants1.packedValues[0u].y), productValue13);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue10, comparisonValue2, fragmentVectorConstants1.packedValues[0u].z), productValue14);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingColor0.x, varyingColor0.y));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float multiplyAddValue9 = fma(varyingColor0.z, fma(sampledTextureValue4.x, 2.0, -1.0), 1.0) * sampledTextureValue2.x;
    precise float multiplyAddValue10 = fma(varyingColor0.z, fma(sampledTextureValue4.y, 2.0, -1.0), 1.0) * sampledTextureValue2.y;
    precise float multiplyAddValue11 = fma(varyingColor0.z, fma(sampledTextureValue4.z, 2.0, -1.0), 1.0) * sampledTextureValue2.z;
    precise float productValue18 = multiplyAddValue9 * varyingColor0.w;
    precise float productValue19 = multiplyAddValue10 * varyingColor0.w;
    precise float productValue20 = multiplyAddValue11 * varyingColor0.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue8 = sampledTextureValue3.x;
    float scalarValue9 = sampledTextureValue3.y;
    float scalarValue10 = sampledTextureValue3.z;
    precise float productValue21 = productValue18 * scalarValue8;
    precise float productValue22 = productValue19 * scalarValue9;
    precise float productValue23 = productValue20 * scalarValue10;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue8, productValue18, fragmentVectorConstants1.packedValues[0u].x), productValue21);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue9, productValue19, fragmentVectorConstants1.packedValues[0u].y), productValue22);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue10, productValue20, fragmentVectorConstants1.packedValues[0u].z), productValue23);
    fragmentColor0.w = 1.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue2.x;
    float scalarValue5 = sampledTextureValue2.y;
    float scalarValue6 = sampledTextureValue2.z;
    float scalarValue7 = sampledTextureValue2.w;
    bool conditionValue = varyingTexCoord2.y > 0.5;
    float multiplyAddValue = conditionValue ? (fma(scalarValue7, fma(scalarValue4, varyingColor0.x, -scalarValue4), scalarValue4) * varyingColor0.w) : (scalarValue4 * varyingColor0.x);
    float multiplyAddValue1 = conditionValue ? (fma(scalarValue7, fma(scalarValue5, varyingColor0.y, -scalarValue5), scalarValue5) * varyingColor0.w) : (scalarValue5 * varyingColor0.y);
    float multiplyAddValue2 = conditionValue ? (fma(scalarValue7, fma(scalarValue6, varyingColor0.z, -scalarValue6), scalarValue6) * varyingColor0.w) : (scalarValue6 * varyingColor0.z);
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue8 = sampledTextureValue3.x;
    float scalarValue9 = sampledTextureValue3.y;
    float scalarValue10 = sampledTextureValue3.z;
    fragmentColor0.w = conditionValue ? 1.0 : varyingColor0.w;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue8, multiplyAddValue, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue * scalarValue8);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue9, multiplyAddValue1, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue1 * scalarValue9);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue10, multiplyAddValue2, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue2 * scalarValue10);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingColor0.x, varyingColor0.y));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue6 = (fma(varyingColor0.z, fma(sampledTextureValue4.x, 2.0, -1.0), 1.0) * sampledTextureValue2.x) * varyingColor0.w;
    float multiplyAddValue7 = (fma(varyingColor0.z, fma(sampledTextureValue4.y, 2.0, -1.0), 1.0) * sampledTextureValue2.y) * varyingColor0.w;
    float multiplyAddValue8 = (fma(varyingColor0.z, fma(sampledTextureValue4.z, 2.0, -1.0), 1.0) * sampledTextureValue2.z) * varyingColor0.w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue8 = sampledTextureValue3.x;
    float scalarValue9 = sampledTextureValue3.y;
    float scalarValue10 = sampledTextureValue3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue8, multiplyAddValue6, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue6 * scalarValue8);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue9, multiplyAddValue7, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue7 * scalarValue9);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue10, multiplyAddValue8, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue8 * scalarValue10);
    fragmentColor0.w = 1.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = scalarValue * varyingColor0.x;
    float productValue1 = scalarValue1 * varyingColor0.y;
    float productValue2 = scalarValue2 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue4;
    if (varyingTexCoord2.y > 0.5)
    {
        productValue3 = (((productValue - scalarValue) * scalarValue3) + scalarValue) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue1) * scalarValue3) + scalarValue1) * varyingColor0.w;
        productValue5 = (((productValue2 - scalarValue2) * scalarValue3) + scalarValue2) * varyingColor0.w;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue2;
        intermediateValue4 = varyingColor0.w;
    }
    vec4 sampledTextureValue1 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue6 = sampledTextureValue1.x * productValue3;
    float productValue7 = sampledTextureValue1.y * productValue4;
    float productValue8 = sampledTextureValue1.z * productValue5;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[0u].x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[0u].y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[0u].z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = intermediateValue4;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue5 = texture(sampler2D(seasonsTextureTexture, seasonsTextureSampler), vec2(varyingColor0.x, varyingColor0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue15 = ((sampledTextureValue.x * varyingColor0.w) * ((((sampledTextureValue5.x * 2.0) + (-1.0)) * varyingColor0.z) + 1.0)) * sampledTextureValue1.x;
    float productValue16 = ((sampledTextureValue.y * varyingColor0.w) * ((((sampledTextureValue5.y * 2.0) + (-1.0)) * varyingColor0.z) + 1.0)) * sampledTextureValue1.y;
    float productValue17 = ((sampledTextureValue.z * varyingColor0.w) * ((((sampledTextureValue5.z * 2.0) + (-1.0)) * varyingColor0.z) + 1.0)) * sampledTextureValue1.z;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[0u].x - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[0u].y - productValue16) * varyingColor2.w) + productValue16;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[0u].z - productValue17) * varyingColor2.w) + productValue17;
    fragmentColor0.w = 1.0;
#endif
}
