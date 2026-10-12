#version 460
#extension GL_GOOGLE_include_directive : require
// TextureShiftRenderChunk / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
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
#define RD_BINDING_LAYOUT 8
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#extension GL_EXT_samplerless_texture_functions : require
#endif
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/TextureShiftRenderChunk/FragmentBindings.glsli"

void main()
{
    uint productValue = uint(int(varyingTexCoord5.y * 65535.0));
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue13 = (productValue * 8u) + 5u;
    vec3 reinterpretedBits = uintBitsToFloat(uvec3(intermediateValue2.packedValues[productValue13], intermediateValue2.packedValues[productValue13 + 1u], intermediateValue2.packedValues[productValue13 + 2u]));
    float scalarValue3 = reinterpretedBits.x;
    float scalarValue4 = reinterpretedBits.y;
    vec4 reinterpretedBits1 = uintBitsToFloat(intermediateValue3.packedValues[productValue * 2u]);
    float multiplyAddValue = fma(-varyingTexCoord5.x, reinterpretedBits.z, 1.0);
    float comparisonValue1 = (scalarValue4 == 0.0) ? float(scalarValue3 >= multiplyAddValue) : (1.0 - spvNClamp((multiplyAddValue - scalarValue3) / scalarValue4, 0.0, 1.0));
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits1.z + varyingTexCoord0.x, reinterpretedBits1.w + varyingTexCoord0.y));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits1.x + varyingTexCoord0.x, reinterpretedBits1.y + varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue7.x;
    float scalarValue6 = sampledTextureValue7.y;
    float scalarValue7 = sampledTextureValue7.z;
    float comparisonValue2 = (comparisonValue1 > 0.5) ? sampledTextureValue6.w : sampledTextureValue7.w;
    float multiplyAddValue1 = fma(comparisonValue1, sampledTextureValue6.x - scalarValue5, scalarValue5);
    float multiplyAddValue2 = fma(comparisonValue1, sampledTextureValue6.y - scalarValue6, scalarValue6);
    float multiplyAddValue3 = fma(comparisonValue1, sampledTextureValue6.z - scalarValue7, scalarValue7);
    bool conditionValue = varyingTexCoord2.y > 0.5;
    float multiplyAddValue4 = conditionValue ? (fma(comparisonValue2, fma(multiplyAddValue1, varyingColor0.x, -multiplyAddValue1), multiplyAddValue1) * varyingColor0.w) : (multiplyAddValue1 * varyingColor0.x);
    float multiplyAddValue5 = conditionValue ? (fma(comparisonValue2, fma(multiplyAddValue2, varyingColor0.y, -multiplyAddValue2), multiplyAddValue2) * varyingColor0.w) : (multiplyAddValue2 * varyingColor0.y);
    float multiplyAddValue6 = conditionValue ? (fma(comparisonValue2, fma(multiplyAddValue3, varyingColor0.z, -multiplyAddValue3), multiplyAddValue3) * varyingColor0.w) : (multiplyAddValue3 * varyingColor0.z);
    vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue8 = sampledTextureValue8.x;
    float scalarValue9 = sampledTextureValue8.y;
    float scalarValue10 = sampledTextureValue8.z;
    fragmentColor0.w = conditionValue ? 1.0 : varyingColor0.w;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue8, multiplyAddValue4, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue4 * scalarValue8);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue9, multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue5 * scalarValue9);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue10, multiplyAddValue6, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue6 * scalarValue10);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sampledTextureValue = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 5u)).x);
    float sampledTextureValue1 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 6u)).x);
    float sampledTextureValue2 = 1.0 - (uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 7u)).x) * varyingTexCoord5.x);
    float quotientValue;
    if (sampledTextureValue1 == 0.0)
    {
        quotientValue = (sampledTextureValue < sampledTextureValue2) ? 0.0 : 1.0;
    }
    else
    {
        quotientValue = 1.0 - spvNMin(spvNMax((sampledTextureValue2 - sampledTextureValue) / sampledTextureValue1, 0.0), 1.0);
    }
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(uintBitsToFloat(texelFetch(textureShiftBufferData, int(productValue * 8u)).x) + varyingTexCoord0.x, uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 1u)).x) + varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.x;
    float scalarValue1 = sampledTextureValue3.y;
    float scalarValue2 = sampledTextureValue3.z;
    vec4 sampledTextureValue4 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 2u)).x) + varyingTexCoord0.x, uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 3u)).x) + varyingTexCoord0.y));
    float productValue1 = ((sampledTextureValue4.x - scalarValue) * quotientValue) + scalarValue;
    float productValue2 = ((sampledTextureValue4.y - scalarValue1) * quotientValue) + scalarValue1;
    float productValue3 = ((sampledTextureValue4.z - scalarValue2) * quotientValue) + scalarValue2;
    float comparisonValue = (quotientValue > 0.5) ? sampledTextureValue4.w : sampledTextureValue3.w;
    float productValue4 = productValue1 * varyingColor0.x;
    float productValue5 = productValue2 * varyingColor0.y;
    float productValue6 = productValue3 * varyingColor0.z;
    float productValue7;
    float productValue8;
    float productValue9;
    float intermediateValue3;
    if (varyingTexCoord2.y > 0.5)
    {
        productValue7 = (((productValue4 - productValue1) * comparisonValue) + productValue1) * varyingColor0.w;
        productValue8 = (((productValue5 - productValue2) * comparisonValue) + productValue2) * varyingColor0.w;
        productValue9 = (((productValue6 - productValue3) * comparisonValue) + productValue3) * varyingColor0.w;
        intermediateValue3 = 1.0;
    }
    else
    {
        productValue7 = productValue4;
        productValue8 = productValue5;
        productValue9 = productValue6;
        intermediateValue3 = varyingColor0.w;
    }
    vec4 sampledTextureValue5 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue10 = sampledTextureValue5.x * productValue7;
    float productValue11 = sampledTextureValue5.y * productValue8;
    float productValue12 = sampledTextureValue5.z * productValue9;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[0u].x - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[0u].y - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[0u].z - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.w = intermediateValue3;
#endif
}
