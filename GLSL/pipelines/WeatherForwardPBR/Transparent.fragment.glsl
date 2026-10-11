#version 460
#extension GL_GOOGLE_include_directive : require
// WeatherForwardPBR / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 9
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FLIP_OCCLUSION
#define RD_FEATURE_FLIP_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_NO_OCCLUSION
#define RD_FEATURE_NO_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_NO_VARIETY
#define RD_FEATURE_NO_VARIETY RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/WeatherForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    precise float productValue3 = sampledTextureValue.x * 255.0;
    precise float productValue4 = sampledTextureValue.y * 255.0;
    precise float productValue5 = sampledTextureValue.z * 255.0;
    precise float bitwiseValue4 = rdEvaluateFloatExpression((uint(roundEven(productValue3)) | (uint(roundEven(productValue4)) << 8u)) & 1023u) + fragmentScalarConstants1.packedValues[0u];
    precise float productValue6 = bitwiseValue4 * 0.0039215688593685626983642578125;
    precise float bitwiseValue5 = rdEvaluateFloatExpression(uint(roundEven(productValue5)) & 15u) * 0.066666670143604278564453125;
    precise float multiplyAddValue = fma(-bitwiseValue4, 0.0039215688593685626983642578125, varyingTexCoord2) * 25.0;
    bool comparisonValue1 = ((((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0)) && (varyingTexCoord1.y <= 1.0)) && (varyingTexCoord2 < productValue6);
    float comparisonValue2 = comparisonValue1 ? 0.0 : 1.0;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(comparisonValue1 ? 0.0 : fma(-spvNClamp(multiplyAddValue, 0.0, 1.0), bitwiseValue5, bitwiseValue5), comparisonValue2));
    float scalarValue6 = sampledTextureValue6.x;
    float scalarValue7 = sampledTextureValue6.y;
    float scalarValue8 = sampledTextureValue6.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue2.x;
    float scalarValue4 = sampledTextureValue2.y;
    float scalarValue5 = sampledTextureValue2.z;
    precise float productValue7 = scalarValue6 * scalarValue3;
    precise float productValue8 = scalarValue7 * scalarValue4;
    precise float productValue9 = scalarValue8 * scalarValue5;
    precise float productValue10 = comparisonValue2 * sampledTextureValue2.w;
    fragmentColor0.w = productValue10;
    fragmentColor0.x = fma(varyingColor1.w, fma(-scalarValue3, scalarValue6, varyingColor1.x), productValue7);
    fragmentColor0.y = fma(varyingColor1.w, fma(-scalarValue4, scalarValue7, varyingColor1.y), productValue8);
    fragmentColor0.z = fma(varyingColor1.w, fma(-scalarValue5, scalarValue8, varyingColor1.z), productValue9);
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    precise float productValue3 = sampledTextureValue.x * 255.0;
    precise float productValue4 = sampledTextureValue.y * 255.0;
    precise float productValue5 = sampledTextureValue.z * 255.0;
    precise float bitwiseValue5 = rdEvaluateFloatExpression(uint(roundEven(productValue5)) & 15u) * 0.066666670143604278564453125;
    precise float bitwiseValue4 = rdEvaluateFloatExpression((uint(roundEven(productValue3)) | (uint(roundEven(productValue4)) << 8u)) & 1023u) + fragmentScalarConstants1.packedValues[0u];
    precise float multiplyAddValue = fma(-bitwiseValue4, 0.0039215688593685626983642578125, varyingTexCoord2) * 25.0;
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(-spvNClamp(multiplyAddValue, 0.0, 1.0), bitwiseValue5, bitwiseValue5), 1.0));
    float scalarValue12 = sampledTextureValue9.x;
    float scalarValue13 = sampledTextureValue9.y;
    float scalarValue14 = sampledTextureValue9.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue2.x;
    float scalarValue4 = sampledTextureValue2.y;
    float scalarValue5 = sampledTextureValue2.z;
    precise float productValue14 = scalarValue12 * scalarValue3;
    precise float productValue15 = scalarValue13 * scalarValue4;
    precise float productValue16 = scalarValue14 * scalarValue5;
    fragmentColor0.w = sampledTextureValue2.w;
    fragmentColor0.x = fma(varyingColor1.w, fma(-scalarValue3, scalarValue12, varyingColor1.x), productValue14);
    fragmentColor0.y = fma(varyingColor1.w, fma(-scalarValue4, scalarValue13, varyingColor1.y), productValue15);
    fragmentColor0.z = fma(varyingColor1.w, fma(-scalarValue5, scalarValue14, varyingColor1.z), productValue16);
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    precise float productValue3 = sampledTextureValue.x * 255.0;
    precise float productValue4 = sampledTextureValue.y * 255.0;
    precise float productValue5 = sampledTextureValue.z * 255.0;
    precise float bitwiseValue4 = rdEvaluateFloatExpression((uint(roundEven(productValue3)) | (uint(roundEven(productValue4)) << 8u)) & 1023u) + fragmentScalarConstants1.packedValues[0u];
    precise float productValue6 = bitwiseValue4 * 0.0039215688593685626983642578125;
    precise float bitwiseValue5 = rdEvaluateFloatExpression(uint(roundEven(productValue5)) & 15u) * 0.066666670143604278564453125;
    precise float multiplyAddValue = fma(-bitwiseValue4, 0.0039215688593685626983642578125, varyingTexCoord2) * 25.0;
    bool comparisonValue3 = ((((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0)) && (varyingTexCoord1.y <= 1.0)) && (productValue6 < varyingTexCoord2);
    float comparisonValue4 = comparisonValue3 ? 0.0 : 1.0;
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(comparisonValue3 ? 0.0 : fma(-spvNClamp(multiplyAddValue, 0.0, 1.0), bitwiseValue5, bitwiseValue5), comparisonValue4));
    float scalarValue15 = sampledTextureValue10.x;
    float scalarValue16 = sampledTextureValue10.y;
    float scalarValue17 = sampledTextureValue10.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue2.x;
    float scalarValue4 = sampledTextureValue2.y;
    float scalarValue5 = sampledTextureValue2.z;
    precise float productValue17 = scalarValue15 * scalarValue3;
    precise float productValue18 = scalarValue16 * scalarValue4;
    precise float productValue19 = scalarValue17 * scalarValue5;
    precise float productValue20 = comparisonValue4 * sampledTextureValue2.w;
    fragmentColor0.w = productValue20;
    fragmentColor0.x = fma(varyingColor1.w, fma(-scalarValue3, scalarValue15, varyingColor1.x), productValue17);
    fragmentColor0.y = fma(varyingColor1.w, fma(-scalarValue4, scalarValue16, varyingColor1.y), productValue18);
    fragmentColor0.z = fma(varyingColor1.w, fma(-scalarValue5, scalarValue17, varyingColor1.z), productValue19);
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float bitwiseValue = rdEvaluateFloatExpression((uint(roundEven(sampledTextureValue.x * 255.0)) | (uint(roundEven(sampledTextureValue.y * 255.0)) << 8u)) & 1023u) + fragmentScalarConstants1.packedValues[0u];
    float bitwiseValue1 = rdEvaluateFloatExpression(uint(roundEven(sampledTextureValue.z * 255.0)) & 15u) * 0.066666670143604278564453125;
    bool comparisonValue = (varyingTexCoord2 < (bitwiseValue * 0.0039215688593685626983642578125)) && ((((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0)) && (varyingTexCoord1.y <= 1.0));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(comparisonValue ? 0.0 : fma(-spvNClamp(fma(-bitwiseValue, 0.0039215688593685626983642578125, varyingTexCoord2) * 25.0, 0.0, 1.0), bitwiseValue1, bitwiseValue1), comparisonValue ? 0.0 : 1.0));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue2.x;
    float scalarValue4 = sampledTextureValue2.y;
    float scalarValue5 = sampledTextureValue2.z;
    fragmentColor0.w = comparisonValue ? 0.0 : sampledTextureValue2.w;
    fragmentColor0.x = fma(varyingColor1.w, fma(-scalarValue3, scalarValue, varyingColor1.x), scalarValue * scalarValue3);
    fragmentColor0.y = fma(varyingColor1.w, fma(-scalarValue4, scalarValue1, varyingColor1.y), scalarValue1 * scalarValue4);
    fragmentColor0.z = fma(varyingColor1.w, fma(-scalarValue5, scalarValue2, varyingColor1.z), scalarValue2 * scalarValue5);
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float bitwiseValue1 = rdEvaluateFloatExpression(uint(roundEven(sampledTextureValue.z * 255.0)) & 15u) * 0.066666670143604278564453125;
    vec4 sampledTextureValue8 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(-spvNClamp(fma(-(rdEvaluateFloatExpression((uint(roundEven(sampledTextureValue.x * 255.0)) | (uint(roundEven(sampledTextureValue.y * 255.0)) << 8u)) & 1023u) + fragmentScalarConstants1.packedValues[0u]), 0.0039215688593685626983642578125, varyingTexCoord2) * 25.0, 0.0, 1.0), bitwiseValue1, bitwiseValue1), 1.0));
    float scalarValue9 = sampledTextureValue8.x;
    float scalarValue10 = sampledTextureValue8.y;
    float scalarValue11 = sampledTextureValue8.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue2.x;
    float scalarValue4 = sampledTextureValue2.y;
    float scalarValue5 = sampledTextureValue2.z;
    fragmentColor0.w = sampledTextureValue2.w;
    fragmentColor0.x = fma(varyingColor1.w, fma(-scalarValue3, scalarValue9, varyingColor1.x), scalarValue9 * scalarValue3);
    fragmentColor0.y = fma(varyingColor1.w, fma(-scalarValue4, scalarValue10, varyingColor1.y), scalarValue10 * scalarValue4);
    fragmentColor0.z = fma(varyingColor1.w, fma(-scalarValue5, scalarValue11, varyingColor1.z), scalarValue11 * scalarValue5);
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float bitwiseValue = rdEvaluateFloatExpression((uint(roundEven(sampledTextureValue.x * 255.0)) | (uint(roundEven(sampledTextureValue.y * 255.0)) << 8u)) & 1023u) + fragmentScalarConstants1.packedValues[0u];
    float bitwiseValue1 = rdEvaluateFloatExpression(uint(roundEven(sampledTextureValue.z * 255.0)) & 15u) * 0.066666670143604278564453125;
    bool comparisonValue5 = ((bitwiseValue * 0.0039215688593685626983642578125) < varyingTexCoord2) && ((((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0)) && (varyingTexCoord1.y <= 1.0));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture1, textureSampler1), vec2(comparisonValue5 ? 0.0 : fma(-spvNClamp(fma(-bitwiseValue, 0.0039215688593685626983642578125, varyingTexCoord2) * 25.0, 0.0, 1.0), bitwiseValue1, bitwiseValue1), comparisonValue5 ? 0.0 : 1.0));
    float scalarValue18 = sampledTextureValue11.x;
    float scalarValue19 = sampledTextureValue11.y;
    float scalarValue20 = sampledTextureValue11.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue2.x;
    float scalarValue4 = sampledTextureValue2.y;
    float scalarValue5 = sampledTextureValue2.z;
    fragmentColor0.w = comparisonValue5 ? 0.0 : sampledTextureValue2.w;
    fragmentColor0.x = fma(varyingColor1.w, fma(-scalarValue3, scalarValue18, varyingColor1.x), scalarValue18 * scalarValue3);
    fragmentColor0.y = fma(varyingColor1.w, fma(-scalarValue4, scalarValue19, varyingColor1.y), scalarValue19 * scalarValue4);
    fragmentColor0.z = fma(varyingColor1.w, fma(-scalarValue5, scalarValue20, varyingColor1.z), scalarValue20 * scalarValue5);
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(weatherTextureTexture, weatherTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue4 = texture(sampler2D(occlusionTextureTexture, occlusionTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float bitwiseValue2 = float(uint(roundEven(sampledTextureValue4.z * 255.0)) & 15u) * 0.066666670143604278564453125;
    float bitwiseValue3 = (float(((uint(roundEven(sampledTextureValue4.y * 255.0)) << 8u) | uint(roundEven(sampledTextureValue4.x * 255.0))) & 1023u) + fragmentVectorConstants1.packedValues[0u].x) * 0.0039215688593685626983642578125;
    float intermediateValue;
    float intermediateValue1;
    if (((varyingTexCoord1.y <= 1.0) && (((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0))) && (varyingTexCoord2 < bitwiseValue3))
    {
        intermediateValue = 0.0;
        intermediateValue1 = 0.0;
    }
    else
    {
        intermediateValue = bitwiseValue2 - (spvNClamp((varyingTexCoord2 - bitwiseValue3) * 25.0, 0.0, 1.0) * bitwiseValue2);
        intermediateValue1 = 1.0;
    }
    vec4 sampledTextureValue5 = texture(sampler2D(lightingTextureTexture, lightingTextureSampler), vec2(intermediateValue, intermediateValue1));
    float productValue = sampledTextureValue5.x * sampledTextureValue3.x;
    float productValue1 = sampledTextureValue5.y * sampledTextureValue3.y;
    float productValue2 = sampledTextureValue5.z * sampledTextureValue3.z;
    fragmentColor0.x = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    fragmentColor0.y = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    fragmentColor0.z = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    fragmentColor0.w = intermediateValue1 * sampledTextureValue3.w;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(weatherTextureTexture, weatherTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue4 = texture(sampler2D(occlusionTextureTexture, occlusionTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float bitwiseValue2 = float(uint(roundEven(sampledTextureValue4.z * 255.0)) & 15u) * 0.066666670143604278564453125;
    vec4 sampledTextureValue7 = texture(sampler2D(lightingTextureTexture, lightingTextureSampler), vec2(bitwiseValue2 - (bitwiseValue2 * spvNClamp((varyingTexCoord2 - ((float(((uint(roundEven(sampledTextureValue4.y * 255.0)) << 8u) | uint(roundEven(sampledTextureValue4.x * 255.0))) & 1023u) + fragmentVectorConstants1.packedValues[0u].x) * 0.0039215688593685626983642578125)) * 25.0, 0.0, 1.0)), 1.0));
    float productValue11 = sampledTextureValue7.x * sampledTextureValue3.x;
    float productValue12 = sampledTextureValue7.y * sampledTextureValue3.y;
    float productValue13 = sampledTextureValue7.z * sampledTextureValue3.z;
    fragmentColor0.x = ((varyingColor1.x - productValue11) * varyingColor1.w) + productValue11;
    fragmentColor0.y = ((varyingColor1.y - productValue12) * varyingColor1.w) + productValue12;
    fragmentColor0.z = ((varyingColor1.z - productValue13) * varyingColor1.w) + productValue13;
    fragmentColor0.w = sampledTextureValue3.w;
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(weatherTextureTexture, weatherTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue4 = texture(sampler2D(occlusionTextureTexture, occlusionTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float bitwiseValue2 = float(uint(roundEven(sampledTextureValue4.z * 255.0)) & 15u) * 0.066666670143604278564453125;
    float bitwiseValue3 = (float(((uint(roundEven(sampledTextureValue4.y * 255.0)) << 8u) | uint(roundEven(sampledTextureValue4.x * 255.0))) & 1023u) + fragmentVectorConstants1.packedValues[0u].x) * 0.0039215688593685626983642578125;
    float intermediateValue;
    float intermediateValue1;
    if (((varyingTexCoord1.y <= 1.0) && (((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0))) && (varyingTexCoord2 > bitwiseValue3))
    {
        intermediateValue = 0.0;
        intermediateValue1 = 0.0;
    }
    else
    {
        intermediateValue = bitwiseValue2 - (spvNClamp((varyingTexCoord2 - bitwiseValue3) * 25.0, 0.0, 1.0) * bitwiseValue2);
        intermediateValue1 = 1.0;
    }
    vec4 sampledTextureValue5 = texture(sampler2D(lightingTextureTexture, lightingTextureSampler), vec2(intermediateValue, intermediateValue1));
    float productValue = sampledTextureValue5.x * sampledTextureValue3.x;
    float productValue1 = sampledTextureValue5.y * sampledTextureValue3.y;
    float productValue2 = sampledTextureValue5.z * sampledTextureValue3.z;
    fragmentColor0.x = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    fragmentColor0.y = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    fragmentColor0.z = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    fragmentColor0.w = intermediateValue1 * sampledTextureValue3.w;
#endif
}
