#version 460
#extension GL_GOOGLE_include_directive : require
// WeatherForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/WeatherForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    bool comparisonValue = fragmentScalarConstants1.packedValues[156u] != 0.0;
    float exponentialValue3 = comparisonValue ? exp2(log2(spvNMax(scalarValue, 0.0)) * 2.2000000476837158203125) : ((scalarValue <= 0.040449999272823333740234375) ? (scalarValue * 0.077399380505084991455078125) : exp2(log2((scalarValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue4 = comparisonValue ? exp2(log2(spvNMax(scalarValue1, 0.0)) * 2.2000000476837158203125) : ((scalarValue1 <= 0.040449999272823333740234375) ? (scalarValue1 * 0.077399380505084991455078125) : exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue5 = comparisonValue ? exp2(log2(spvNMax(scalarValue2, 0.0)) * 2.2000000476837158203125) : ((scalarValue2 <= 0.040449999272823333740234375) ? (scalarValue2 * 0.077399380505084991455078125) : exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    uint productValue = uint(roundEven(sampledTextureValue1.y * 255.0));
    uint productValue1 = uint(roundEven(sampledTextureValue1.w * 255.0));
    float bitwiseValue = rdEvaluateFloatExpression((uint(roundEven(sampledTextureValue1.x * 255.0)) | (productValue << 8u)) & 1023u) + fragmentScalarConstants1.packedValues[140u];
    bool comparisonValue1 = (varyingTexCoord2 < (bitwiseValue * 0.0039215688593685626983642578125)) && ((varyingTexCoord1.y <= 1.0) && (((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0)));
    float bitwiseValue1 = rdEvaluateFloatExpression(productValue >> 2u) * 0.01587301678955554962158203125;
    float bitwiseValue2 = (bitwiseValue1 * (rdEvaluateFloatExpression(uint(roundEven(sampledTextureValue1.z * 255.0)) >> 4u) * 0.066666670143604278564453125)) * 6.0;
    float bitwiseValue3 = (bitwiseValue1 * (rdEvaluateFloatExpression(productValue1 & 15u) * 0.066666670143604278564453125)) * 6.0;
    float bitwiseValue4 = (bitwiseValue1 * (rdEvaluateFloatExpression(productValue1 >> 4u) * 0.066666670143604278564453125)) * 6.0;
    float multiplyAddValue = -spvNClamp(fma(-bitwiseValue, 0.0039215688593685626983642578125, varyingTexCoord2) * 25.0, 0.0, 1.0);
    float productValue2 = fragmentScalarConstants1.packedValues[119u] * fragmentVectorConstants1.packedValues[29u].x;
    float productValue3 = fragmentScalarConstants1.packedValues[119u] * fragmentVectorConstants1.packedValues[29u].y;
    float productValue4 = fragmentScalarConstants1.packedValues[119u] * fragmentVectorConstants1.packedValues[29u].z;
    float multiplyAddValue1 = fma(exponentialValue3 * (((fragmentScalarConstants1.packedValues[155u] * fragmentVectorConstants1.packedValues[38u].x) * (exponentialValue3 * fragmentScalarConstants1.packedValues[160u])) * fragmentScalarConstants1.packedValues[164u]), 0.3183098733425140380859375, exponentialValue3 * spvNMax(comparisonValue1 ? 0.0 : fma(fragmentScalarConstants1.packedValues[115u], fma(multiplyAddValue, bitwiseValue2, bitwiseValue2), comparisonValue1 ? 0.0 : (fragmentScalarConstants1.packedValues[191u] * fragmentVectorConstants1.packedValues[47u].x)), productValue2));
    float multiplyAddValue2 = fma(exponentialValue4 * (((fragmentScalarConstants1.packedValues[155u] * fragmentVectorConstants1.packedValues[38u].y) * (exponentialValue4 * fragmentScalarConstants1.packedValues[160u])) * fragmentScalarConstants1.packedValues[164u]), 0.3183098733425140380859375, exponentialValue4 * spvNMax(comparisonValue1 ? 0.0 : fma(fragmentScalarConstants1.packedValues[115u], fma(multiplyAddValue, bitwiseValue3, bitwiseValue3), comparisonValue1 ? 0.0 : (fragmentScalarConstants1.packedValues[191u] * fragmentVectorConstants1.packedValues[47u].y)), productValue3));
    float multiplyAddValue3 = fma(exponentialValue5 * (((fragmentScalarConstants1.packedValues[155u] * fragmentVectorConstants1.packedValues[38u].z) * (exponentialValue5 * fragmentScalarConstants1.packedValues[160u])) * fragmentScalarConstants1.packedValues[164u]), 0.3183098733425140380859375, exponentialValue5 * spvNMax(comparisonValue1 ? 0.0 : fma(fragmentScalarConstants1.packedValues[115u], fma(multiplyAddValue, bitwiseValue4, bitwiseValue4), comparisonValue1 ? 0.0 : (fragmentScalarConstants1.packedValues[191u] * fragmentVectorConstants1.packedValues[47u].z)), productValue4));
    fragmentColor0.w = comparisonValue1 ? 0.0 : sampledTextureValue.w;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    bool comparisonValue = fragmentScalarConstants1.packedValues[156u] != 0.0;
    float exponentialValue3 = comparisonValue ? exp2(log2(spvNMax(scalarValue, 0.0)) * 2.2000000476837158203125) : ((scalarValue <= 0.040449999272823333740234375) ? (scalarValue * 0.077399380505084991455078125) : exp2(log2((scalarValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue4 = comparisonValue ? exp2(log2(spvNMax(scalarValue1, 0.0)) * 2.2000000476837158203125) : ((scalarValue1 <= 0.040449999272823333740234375) ? (scalarValue1 * 0.077399380505084991455078125) : exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue5 = comparisonValue ? exp2(log2(spvNMax(scalarValue2, 0.0)) * 2.2000000476837158203125) : ((scalarValue2 <= 0.040449999272823333740234375) ? (scalarValue2 * 0.077399380505084991455078125) : exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    uint productValue = uint(roundEven(sampledTextureValue1.y * 255.0));
    uint productValue1 = uint(roundEven(sampledTextureValue1.w * 255.0));
    float bitwiseValue1 = rdEvaluateFloatExpression(productValue >> 2u) * 0.01587301678955554962158203125;
    float bitwiseValue2 = (bitwiseValue1 * (rdEvaluateFloatExpression(uint(roundEven(sampledTextureValue1.z * 255.0)) >> 4u) * 0.066666670143604278564453125)) * 6.0;
    float bitwiseValue3 = (bitwiseValue1 * (rdEvaluateFloatExpression(productValue1 & 15u) * 0.066666670143604278564453125)) * 6.0;
    float bitwiseValue4 = (bitwiseValue1 * (rdEvaluateFloatExpression(productValue1 >> 4u) * 0.066666670143604278564453125)) * 6.0;
    float multiplyAddValue41 = -spvNClamp(fma(-(rdEvaluateFloatExpression((uint(roundEven(sampledTextureValue1.x * 255.0)) | (productValue << 8u)) & 1023u) + fragmentScalarConstants1.packedValues[140u]), 0.0039215688593685626983642578125, varyingTexCoord2) * 25.0, 0.0, 1.0);
    float productValue2 = fragmentScalarConstants1.packedValues[119u] * fragmentVectorConstants1.packedValues[29u].x;
    float productValue3 = fragmentScalarConstants1.packedValues[119u] * fragmentVectorConstants1.packedValues[29u].y;
    float productValue4 = fragmentScalarConstants1.packedValues[119u] * fragmentVectorConstants1.packedValues[29u].z;
    float multiplyAddValue42 = fma(exponentialValue3 * (((fragmentScalarConstants1.packedValues[155u] * fragmentVectorConstants1.packedValues[38u].x) * (exponentialValue3 * fragmentScalarConstants1.packedValues[160u])) * fragmentScalarConstants1.packedValues[164u]), 0.3183098733425140380859375, exponentialValue3 * spvNMax(fma(fma(multiplyAddValue41, bitwiseValue2, bitwiseValue2), fragmentScalarConstants1.packedValues[115u], fragmentScalarConstants1.packedValues[191u] * fragmentVectorConstants1.packedValues[47u].x), productValue2));
    float multiplyAddValue43 = fma(exponentialValue4 * (((fragmentScalarConstants1.packedValues[155u] * fragmentVectorConstants1.packedValues[38u].y) * (exponentialValue4 * fragmentScalarConstants1.packedValues[160u])) * fragmentScalarConstants1.packedValues[164u]), 0.3183098733425140380859375, exponentialValue4 * spvNMax(fma(fma(multiplyAddValue41, bitwiseValue3, bitwiseValue3), fragmentScalarConstants1.packedValues[115u], fragmentScalarConstants1.packedValues[191u] * fragmentVectorConstants1.packedValues[47u].y), productValue3));
    float multiplyAddValue44 = fma(exponentialValue5 * (((fragmentScalarConstants1.packedValues[155u] * fragmentVectorConstants1.packedValues[38u].z) * (exponentialValue5 * fragmentScalarConstants1.packedValues[160u])) * fragmentScalarConstants1.packedValues[164u]), 0.3183098733425140380859375, exponentialValue5 * spvNMax(fma(fma(multiplyAddValue41, bitwiseValue4, bitwiseValue4), fragmentScalarConstants1.packedValues[115u], fragmentScalarConstants1.packedValues[191u] * fragmentVectorConstants1.packedValues[47u].z), productValue4));
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    bool comparisonValue = fragmentScalarConstants1.packedValues[156u] != 0.0;
    float exponentialValue3 = comparisonValue ? exp2(log2(spvNMax(scalarValue, 0.0)) * 2.2000000476837158203125) : ((scalarValue <= 0.040449999272823333740234375) ? (scalarValue * 0.077399380505084991455078125) : exp2(log2((scalarValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue4 = comparisonValue ? exp2(log2(spvNMax(scalarValue1, 0.0)) * 2.2000000476837158203125) : ((scalarValue1 <= 0.040449999272823333740234375) ? (scalarValue1 * 0.077399380505084991455078125) : exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue5 = comparisonValue ? exp2(log2(spvNMax(scalarValue2, 0.0)) * 2.2000000476837158203125) : ((scalarValue2 <= 0.040449999272823333740234375) ? (scalarValue2 * 0.077399380505084991455078125) : exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    uint productValue = uint(roundEven(sampledTextureValue1.y * 255.0));
    uint productValue1 = uint(roundEven(sampledTextureValue1.w * 255.0));
    float bitwiseValue = rdEvaluateFloatExpression((uint(roundEven(sampledTextureValue1.x * 255.0)) | (productValue << 8u)) & 1023u) + fragmentScalarConstants1.packedValues[140u];
    bool comparisonValue4 = ((bitwiseValue * 0.0039215688593685626983642578125) < varyingTexCoord2) && ((varyingTexCoord1.y <= 1.0) && (((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0)));
    float bitwiseValue1 = rdEvaluateFloatExpression(productValue >> 2u) * 0.01587301678955554962158203125;
    float bitwiseValue2 = (bitwiseValue1 * (rdEvaluateFloatExpression(uint(roundEven(sampledTextureValue1.z * 255.0)) >> 4u) * 0.066666670143604278564453125)) * 6.0;
    float bitwiseValue3 = (bitwiseValue1 * (rdEvaluateFloatExpression(productValue1 & 15u) * 0.066666670143604278564453125)) * 6.0;
    float bitwiseValue4 = (bitwiseValue1 * (rdEvaluateFloatExpression(productValue1 >> 4u) * 0.066666670143604278564453125)) * 6.0;
    float multiplyAddValue = -spvNClamp(fma(-bitwiseValue, 0.0039215688593685626983642578125, varyingTexCoord2) * 25.0, 0.0, 1.0);
    float productValue2 = fragmentScalarConstants1.packedValues[119u] * fragmentVectorConstants1.packedValues[29u].x;
    float productValue3 = fragmentScalarConstants1.packedValues[119u] * fragmentVectorConstants1.packedValues[29u].y;
    float productValue4 = fragmentScalarConstants1.packedValues[119u] * fragmentVectorConstants1.packedValues[29u].z;
    float multiplyAddValue48 = fma(exponentialValue3 * (((fragmentScalarConstants1.packedValues[155u] * fragmentVectorConstants1.packedValues[38u].x) * (exponentialValue3 * fragmentScalarConstants1.packedValues[160u])) * fragmentScalarConstants1.packedValues[164u]), 0.3183098733425140380859375, exponentialValue3 * spvNMax(comparisonValue4 ? 0.0 : fma(fragmentScalarConstants1.packedValues[115u], fma(multiplyAddValue, bitwiseValue2, bitwiseValue2), comparisonValue4 ? 0.0 : (fragmentScalarConstants1.packedValues[191u] * fragmentVectorConstants1.packedValues[47u].x)), productValue2));
    float multiplyAddValue49 = fma(exponentialValue4 * (((fragmentScalarConstants1.packedValues[155u] * fragmentVectorConstants1.packedValues[38u].y) * (exponentialValue4 * fragmentScalarConstants1.packedValues[160u])) * fragmentScalarConstants1.packedValues[164u]), 0.3183098733425140380859375, exponentialValue4 * spvNMax(comparisonValue4 ? 0.0 : fma(fragmentScalarConstants1.packedValues[115u], fma(multiplyAddValue, bitwiseValue3, bitwiseValue3), comparisonValue4 ? 0.0 : (fragmentScalarConstants1.packedValues[191u] * fragmentVectorConstants1.packedValues[47u].y)), productValue3));
    float multiplyAddValue50 = fma(exponentialValue5 * (((fragmentScalarConstants1.packedValues[155u] * fragmentVectorConstants1.packedValues[38u].z) * (exponentialValue5 * fragmentScalarConstants1.packedValues[160u])) * fragmentScalarConstants1.packedValues[164u]), 0.3183098733425140380859375, exponentialValue5 * spvNMax(comparisonValue4 ? 0.0 : fma(fragmentScalarConstants1.packedValues[115u], fma(multiplyAddValue, bitwiseValue4, bitwiseValue4), comparisonValue4 ? 0.0 : (fragmentScalarConstants1.packedValues[191u] * fragmentVectorConstants1.packedValues[47u].z)), productValue4));
    fragmentColor0.w = comparisonValue4 ? 0.0 : sampledTextureValue.w;
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue5 = texture(sampler2D(weatherTextureTexture, weatherTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue5.x;
    float scalarValue12 = sampledTextureValue5.y;
    float scalarValue13 = sampledTextureValue5.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[40u].x != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(scalarValue11, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue12, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue13, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue11 <= 0.040449999272823333740234375) ? (scalarValue11 * 0.077399380505084991455078125) : exp2(log2((scalarValue11 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue12 <= 0.040449999272823333740234375) ? (scalarValue12 * 0.077399380505084991455078125) : exp2(log2((scalarValue12 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue13 <= 0.040449999272823333740234375) ? (scalarValue13 * 0.077399380505084991455078125) : exp2(log2((scalarValue13 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    vec4 sampledTextureValue6 = texture(sampler2D(occlusionTextureTexture, occlusionTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    uint productValue11 = uint(roundEven(sampledTextureValue6.y * 255.0));
    uint productValue16 = uint(roundEven(sampledTextureValue6.w * 255.0));
    float bitwiseValue5 = (float(((productValue11 << 8u) | uint(roundEven(sampledTextureValue6.x * 255.0))) & 1023u) + fragmentVectorConstants1.packedValues[35u].x) * 0.0039215688593685626983642578125;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (((varyingTexCoord1.y <= 1.0) && (((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0))) && (varyingTexCoord2 < bitwiseValue5))
    {
        intermediateValue3 = 0.0;
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
        intermediateValue6 = 0.0;
    }
    else
    {
        float productValue20 = spvNClamp((varyingTexCoord2 - bitwiseValue5) * 25.0, 0.0, 1.0);
        float bitwiseValue6 = float(productValue11 >> 2u);
        float bitwiseValue7 = (bitwiseValue6 * 0.0063492073677480220794677734375) * float(uint(roundEven(sampledTextureValue6.z * 255.0)) >> 4u);
        float productValue21 = bitwiseValue6 * 0.0063492073677480220794677734375;
        float bitwiseValue8 = productValue21 * float(productValue16 & 15u);
        float bitwiseValue9 = productValue21 * float(productValue16 >> 4u);
        intermediateValue3 = bitwiseValue7 - (bitwiseValue7 * productValue20);
        intermediateValue4 = bitwiseValue8 - (productValue20 * bitwiseValue8);
        intermediateValue5 = bitwiseValue9 - (productValue20 * bitwiseValue9);
        intermediateValue6 = 1.0;
    }
    float productValue22 = fragmentVectorConstants1.packedValues[41u].x * (fragmentVectorConstants1.packedValues[39u].w * 0.3183098733425140380859375);
    float productValue27 = intermediateValue6 * intermediateValue6;
    float productValue32 = productValue27 * productValue27;
    float productValue33 = ((fragmentVectorConstants1.packedValues[37u].y * (productValue27 - productValue32)) + productValue32) * intermediateValue6;
    float productValue34 = fragmentVectorConstants1.packedValues[48u].w * fragmentVectorConstants1.packedValues[48u].x;
    float productValue35 = fragmentVectorConstants1.packedValues[48u].w * fragmentVectorConstants1.packedValues[48u].y;
    float productValue36 = fragmentVectorConstants1.packedValues[48u].w * fragmentVectorConstants1.packedValues[48u].z;
    float productValue37 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].w;
    float productValue38 = fragmentVectorConstants1.packedValues[29u].y * fragmentVectorConstants1.packedValues[29u].w;
    float productValue42 = fragmentVectorConstants1.packedValues[29u].z * fragmentVectorConstants1.packedValues[29u].w;
    float productValue43 = (spvNMax((productValue33 * productValue34) + (fragmentVectorConstants1.packedValues[28u].w * intermediateValue3), productValue37) + (((productValue22 * exponentialValue) * fragmentVectorConstants1.packedValues[39u].x) * fragmentVectorConstants1.packedValues[42u].x)) * exponentialValue;
    float productValue47 = (spvNMax((productValue33 * productValue35) + (fragmentVectorConstants1.packedValues[28u].w * intermediateValue4), productValue38) + (((productValue22 * exponentialValue1) * fragmentVectorConstants1.packedValues[39u].y) * fragmentVectorConstants1.packedValues[42u].x)) * exponentialValue1;
    float productValue48 = (spvNMax((productValue33 * productValue36) + (fragmentVectorConstants1.packedValues[28u].w * intermediateValue5), productValue42) + (((productValue22 * exponentialValue2) * fragmentVectorConstants1.packedValues[39u].z) * fragmentVectorConstants1.packedValues[42u].x)) * exponentialValue2;
    float multiplyAddValue31 = fma(fragmentVectorConstants1.packedValues[14u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].x;
    float multiplyAddValue32 = fma(fragmentVectorConstants1.packedValues[14u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].y;
    float multiplyAddValue33 = fma(fragmentVectorConstants1.packedValues[14u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].z;
    float multiplyAddValue34 = fma(fragmentVectorConstants1.packedValues[14u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].w;
    float multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].x)));
    float multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].y)));
    float multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].z)));
    float multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].w)));
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue5 = texture(sampler2D(weatherTextureTexture, weatherTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue5.x;
    float scalarValue12 = sampledTextureValue5.y;
    float scalarValue13 = sampledTextureValue5.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[39u].x != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(scalarValue11, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue12, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue13, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue11 <= 0.040449999272823333740234375) ? (scalarValue11 * 0.077399380505084991455078125) : exp2(log2((scalarValue11 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue12 <= 0.040449999272823333740234375) ? (scalarValue12 * 0.077399380505084991455078125) : exp2(log2((scalarValue12 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue13 <= 0.040449999272823333740234375) ? (scalarValue13 * 0.077399380505084991455078125) : exp2(log2((scalarValue13 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    vec4 sampledTextureValue6 = texture(sampler2D(occlusionTextureTexture, occlusionTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    uint productValue11 = uint(roundEven(sampledTextureValue6.y * 255.0));
    uint productValue16 = uint(roundEven(sampledTextureValue6.w * 255.0));
    float bitwiseValue10 = spvNClamp((varyingTexCoord2 - ((float(((productValue11 << 8u) | uint(roundEven(sampledTextureValue6.x * 255.0))) & 1023u) + fragmentVectorConstants1.packedValues[35u].x) * 0.0039215688593685626983642578125)) * 25.0, 0.0, 1.0);
    float bitwiseValue11 = float(productValue11 >> 2u) * 0.0063492073677480220794677734375;
    float bitwiseValue12 = bitwiseValue11 * float(uint(roundEven(sampledTextureValue6.z * 255.0)) >> 4u);
    float bitwiseValue13 = float(productValue16 & 15u) * bitwiseValue11;
    float bitwiseValue14 = float(productValue16 >> 4u) * bitwiseValue11;
    float productValue69 = fragmentVectorConstants1.packedValues[40u].x * (fragmentVectorConstants1.packedValues[38u].w * 0.3183098733425140380859375);
    float productValue70 = fragmentVectorConstants1.packedValues[47u].x * fragmentVectorConstants1.packedValues[47u].w;
    float productValue71 = fragmentVectorConstants1.packedValues[47u].y * fragmentVectorConstants1.packedValues[47u].w;
    float productValue72 = fragmentVectorConstants1.packedValues[47u].z * fragmentVectorConstants1.packedValues[47u].w;
    float productValue37 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].w;
    float productValue38 = fragmentVectorConstants1.packedValues[29u].y * fragmentVectorConstants1.packedValues[29u].w;
    float productValue42 = fragmentVectorConstants1.packedValues[29u].z * fragmentVectorConstants1.packedValues[29u].w;
    float productValue73 = (spvNMax((fragmentVectorConstants1.packedValues[28u].w * (bitwiseValue12 - (bitwiseValue12 * bitwiseValue10))) + productValue70, productValue37) + (((productValue69 * exponentialValue) * fragmentVectorConstants1.packedValues[38u].x) * fragmentVectorConstants1.packedValues[41u].x)) * exponentialValue;
    float productValue74 = (spvNMax((fragmentVectorConstants1.packedValues[28u].w * (bitwiseValue13 - (bitwiseValue13 * bitwiseValue10))) + productValue71, productValue38) + (((productValue69 * exponentialValue1) * fragmentVectorConstants1.packedValues[38u].y) * fragmentVectorConstants1.packedValues[41u].x)) * exponentialValue1;
    float productValue75 = (spvNMax((fragmentVectorConstants1.packedValues[28u].w * (bitwiseValue14 - (bitwiseValue14 * bitwiseValue10))) + productValue72, productValue42) + (((productValue69 * exponentialValue2) * fragmentVectorConstants1.packedValues[38u].z) * fragmentVectorConstants1.packedValues[41u].x)) * exponentialValue2;
    float multiplyAddValue31 = fma(fragmentVectorConstants1.packedValues[14u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].x;
    float multiplyAddValue32 = fma(fragmentVectorConstants1.packedValues[14u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].y;
    float multiplyAddValue33 = fma(fragmentVectorConstants1.packedValues[14u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].z;
    float multiplyAddValue34 = fma(fragmentVectorConstants1.packedValues[14u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].w;
    float multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].x)));
    float multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].y)));
    float multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].z)));
    float multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].w)));
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue5 = texture(sampler2D(weatherTextureTexture, weatherTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue5.x;
    float scalarValue12 = sampledTextureValue5.y;
    float scalarValue13 = sampledTextureValue5.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[40u].x != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(scalarValue11, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue12, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue13, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue11 <= 0.040449999272823333740234375) ? (scalarValue11 * 0.077399380505084991455078125) : exp2(log2((scalarValue11 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue12 <= 0.040449999272823333740234375) ? (scalarValue12 * 0.077399380505084991455078125) : exp2(log2((scalarValue12 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue13 <= 0.040449999272823333740234375) ? (scalarValue13 * 0.077399380505084991455078125) : exp2(log2((scalarValue13 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    vec4 sampledTextureValue6 = texture(sampler2D(occlusionTextureTexture, occlusionTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    uint productValue11 = uint(roundEven(sampledTextureValue6.y * 255.0));
    uint productValue16 = uint(roundEven(sampledTextureValue6.w * 255.0));
    float bitwiseValue5 = (float(((productValue11 << 8u) | uint(roundEven(sampledTextureValue6.x * 255.0))) & 1023u) + fragmentVectorConstants1.packedValues[35u].x) * 0.0039215688593685626983642578125;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (((varyingTexCoord1.y <= 1.0) && (((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0))) && (varyingTexCoord2 > bitwiseValue5))
    {
        intermediateValue3 = 0.0;
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
        intermediateValue6 = 0.0;
    }
    else
    {
        float productValue20 = spvNClamp((varyingTexCoord2 - bitwiseValue5) * 25.0, 0.0, 1.0);
        float bitwiseValue6 = float(productValue11 >> 2u);
        float bitwiseValue7 = (bitwiseValue6 * 0.0063492073677480220794677734375) * float(uint(roundEven(sampledTextureValue6.z * 255.0)) >> 4u);
        float productValue21 = bitwiseValue6 * 0.0063492073677480220794677734375;
        float bitwiseValue8 = productValue21 * float(productValue16 & 15u);
        float bitwiseValue9 = productValue21 * float(productValue16 >> 4u);
        intermediateValue3 = bitwiseValue7 - (bitwiseValue7 * productValue20);
        intermediateValue4 = bitwiseValue8 - (productValue20 * bitwiseValue8);
        intermediateValue5 = bitwiseValue9 - (productValue20 * bitwiseValue9);
        intermediateValue6 = 1.0;
    }
    float productValue22 = fragmentVectorConstants1.packedValues[41u].x * (fragmentVectorConstants1.packedValues[39u].w * 0.3183098733425140380859375);
    float productValue27 = intermediateValue6 * intermediateValue6;
    float productValue32 = productValue27 * productValue27;
    float productValue33 = ((fragmentVectorConstants1.packedValues[37u].y * (productValue27 - productValue32)) + productValue32) * intermediateValue6;
    float productValue34 = fragmentVectorConstants1.packedValues[48u].w * fragmentVectorConstants1.packedValues[48u].x;
    float productValue35 = fragmentVectorConstants1.packedValues[48u].w * fragmentVectorConstants1.packedValues[48u].y;
    float productValue36 = fragmentVectorConstants1.packedValues[48u].w * fragmentVectorConstants1.packedValues[48u].z;
    float productValue37 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].w;
    float productValue38 = fragmentVectorConstants1.packedValues[29u].y * fragmentVectorConstants1.packedValues[29u].w;
    float productValue42 = fragmentVectorConstants1.packedValues[29u].z * fragmentVectorConstants1.packedValues[29u].w;
    float productValue43 = (spvNMax((productValue33 * productValue34) + (fragmentVectorConstants1.packedValues[28u].w * intermediateValue3), productValue37) + (((productValue22 * exponentialValue) * fragmentVectorConstants1.packedValues[39u].x) * fragmentVectorConstants1.packedValues[42u].x)) * exponentialValue;
    float productValue47 = (spvNMax((productValue33 * productValue35) + (fragmentVectorConstants1.packedValues[28u].w * intermediateValue4), productValue38) + (((productValue22 * exponentialValue1) * fragmentVectorConstants1.packedValues[39u].y) * fragmentVectorConstants1.packedValues[42u].x)) * exponentialValue1;
    float productValue48 = (spvNMax((productValue33 * productValue36) + (fragmentVectorConstants1.packedValues[28u].w * intermediateValue5), productValue42) + (((productValue22 * exponentialValue2) * fragmentVectorConstants1.packedValues[39u].z) * fragmentVectorConstants1.packedValues[42u].x)) * exponentialValue2;
    float multiplyAddValue31 = fma(fragmentVectorConstants1.packedValues[14u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].x;
    float multiplyAddValue32 = fma(fragmentVectorConstants1.packedValues[14u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].y;
    float multiplyAddValue33 = fma(fragmentVectorConstants1.packedValues[14u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].z;
    float multiplyAddValue34 = fma(fragmentVectorConstants1.packedValues[14u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[13u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[12u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[15u].w;
    float multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].x)));
    float multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].y)));
    float multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].z)));
    float multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue34, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue33, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue32, multiplyAddValue31 * fragmentVectorConstants1.packedValues[0u].w)));
#endif
    bool comparisonValue2 = fragmentVectorConstants1.packedValues[33u].y != 0.0;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue4;
    float multiplyAddValue5;
    float multiplyAddValue6;
    if ((fragmentScalarConstants1.packedValues[163u] != 0.0) && (comparisonValue2 && (fragmentVectorConstants1.packedValues[33u].z != 0.0)))
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue17;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[41u].w != 0.0) && (comparisonValue2 && (fragmentVectorConstants1.packedValues[33u].z != 0.0)))
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue12;
    float productValue13;
    float productValue14;
    if ((fragmentVectorConstants1.packedValues[40u].w != 0.0) && (comparisonValue2 && (fragmentVectorConstants1.packedValues[33u].z != 0.0)))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue4 = spvNMax(productValue4, fma(fragmentVectorConstants1.packedValues[47u].z, fragmentScalarConstants1.packedValues[191u], fragmentScalarConstants1.packedValues[115u])) * fragmentScalarConstants1.packedValues[134u];
        multiplyAddValue5 = spvNMax(productValue3, fma(fragmentVectorConstants1.packedValues[47u].y, fragmentScalarConstants1.packedValues[191u], fragmentScalarConstants1.packedValues[115u])) * fragmentScalarConstants1.packedValues[134u];
        multiplyAddValue6 = spvNMax(productValue2, fma(fragmentVectorConstants1.packedValues[47u].x, fragmentScalarConstants1.packedValues[191u], fragmentScalarConstants1.packedValues[115u])) * fragmentScalarConstants1.packedValues[134u];
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue17 = spvNMax(fragmentVectorConstants1.packedValues[28u].w + productValue34, productValue37) * fragmentVectorConstants1.packedValues[33u].z;
        productValue18 = spvNMax(fragmentVectorConstants1.packedValues[28u].w + productValue35, productValue38) * fragmentVectorConstants1.packedValues[33u].z;
        productValue19 = spvNMax(fragmentVectorConstants1.packedValues[28u].w + productValue36, productValue42) * fragmentVectorConstants1.packedValues[33u].z;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue12 = spvNMax(fragmentVectorConstants1.packedValues[28u].w + productValue70, productValue37) * fragmentVectorConstants1.packedValues[33u].z;
        productValue13 = spvNMax(fragmentVectorConstants1.packedValues[28u].w + productValue71, productValue38) * fragmentVectorConstants1.packedValues[33u].z;
        productValue14 = spvNMax(fragmentVectorConstants1.packedValues[28u].w + productValue72, productValue42) * fragmentVectorConstants1.packedValues[33u].z;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue4 = 0.0;
        multiplyAddValue5 = 0.0;
        multiplyAddValue6 = 0.0;
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue17 = 0.0;
        productValue18 = 0.0;
        productValue19 = 0.0;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue12 = 0.0;
        productValue13 = 0.0;
        productValue14 = 0.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue19;
    float intermediateValue20;
    float intermediateValue22;
    float intermediateValue24;
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x;
    float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y;
    float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue, sumValue1, sumValue2), vec3(sumValue, sumValue1, sumValue2)));
    float productValue49 = inverseLengthValue1 * sumValue;
    float productValue50 = inverseLengthValue1 * sumValue1;
    float productValue51 = inverseLengthValue1 * sumValue2;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x;
    float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y;
    float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue, sumValue1, sumValue2), vec3(sumValue, sumValue1, sumValue2)));
    float productValue49 = inverseLengthValue1 * sumValue;
    float productValue50 = inverseLengthValue1 * sumValue1;
    float productValue51 = inverseLengthValue1 * sumValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
#endif
    if (fragmentVectorConstants1.packedValues[33u].x != 0.0)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[14u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[13u].x)) + fragmentVectorConstants1.packedValues[15u].x;
        float multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[14u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[13u].y)) + fragmentVectorConstants1.packedValues[15u].y;
        float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[14u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z;
        float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[14u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w;
        vec4 multiplyAddValue11 = vec4(fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue10, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue9, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue7, multiplyAddValue8 * fragmentVectorConstants1.packedValues[1u].x))), fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue10, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue9, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue7, multiplyAddValue8 * fragmentVectorConstants1.packedValues[1u].y))), fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue10, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue9, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue7, multiplyAddValue8 * fragmentVectorConstants1.packedValues[1u].z))), fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue10, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue9, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue7, multiplyAddValue8 * fragmentVectorConstants1.packedValues[1u].w))));
        float nonlinearValue = spvNClamp((((sqrt(rdDot4Precise(multiplyAddValue11, multiplyAddValue11)) / fragmentScalarConstants1.packedValues[122u]) + fragmentScalarConstants1.packedValues[184u]) - fragmentScalarConstants1.packedValues[120u]) * fragmentScalarConstants1.packedValues[121u], 0.0, 1.0);
        float intermediateValue21;
        float intermediateValue23;
        float intermediateValue25;
        if (nonlinearValue > 0.0)
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float nonlinearValue3 = spvNClamp(((fragmentVectorConstants1.packedValues[47u].x - fragmentVectorConstants1.packedValues[30u].x) + (sqrt((((multiplyAddValue36 * multiplyAddValue36) + (multiplyAddValue35 * multiplyAddValue35)) + (multiplyAddValue37 * multiplyAddValue37)) + (multiplyAddValue38 * multiplyAddValue38)) / fragmentVectorConstants1.packedValues[30u].z)) * fragmentVectorConstants1.packedValues[30u].y, 0.0, 1.0);
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (nonlinearValue3 > 0.0)
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float nonlinearValue6 = spvNClamp(((fragmentVectorConstants1.packedValues[46u].x - fragmentVectorConstants1.packedValues[30u].x) + (sqrt((((multiplyAddValue36 * multiplyAddValue36) + (multiplyAddValue35 * multiplyAddValue35)) + (multiplyAddValue37 * multiplyAddValue37)) + (multiplyAddValue38 * multiplyAddValue38)) / fragmentVectorConstants1.packedValues[30u].z)) * fragmentVectorConstants1.packedValues[30u].y, 0.0, 1.0);
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (nonlinearValue6 > 0.0)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float productValue7;
            float productValue8;
            float productValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
#endif
            if (comparisonValue2)
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                productValue7 = spvNMax(multiplyAddValue6, 1.0) * fragmentVectorConstants1.packedValues[34u].x;
                productValue8 = spvNMax(multiplyAddValue5, 1.0) * fragmentVectorConstants1.packedValues[34u].y;
                productValue9 = spvNMax(multiplyAddValue4, 1.0) * fragmentVectorConstants1.packedValues[34u].z;
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue4 = nonlinearValue3;
                branchMergedValue5 = fragmentVectorConstants1.packedValues[34u].x * spvNMax(productValue17, 1.0);
                branchMergedValue6 = spvNMax(productValue18, 1.0) * fragmentVectorConstants1.packedValues[34u].y;
                branchMergedValue7 = spvNMax(productValue19, 1.0) * fragmentVectorConstants1.packedValues[34u].z;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue4 = nonlinearValue6;
                branchMergedValue5 = fragmentVectorConstants1.packedValues[34u].x * spvNMax(productValue12, 1.0);
                branchMergedValue6 = spvNMax(productValue13, 1.0) * fragmentVectorConstants1.packedValues[34u].y;
                branchMergedValue7 = spvNMax(productValue14, 1.0) * fragmentVectorConstants1.packedValues[34u].z;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x;
                float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y;
                float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z;
                vec3 vectorValue = vec3(sumValue, sumValue1, sumValue2);
                float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                float sumValue3 = fragmentScalarConstants1.packedValues[171u] - fragmentScalarConstants1.packedValues[168u];
                float multiplyAddValue12 = fma(sumValue1, inverseLengthValue, sumValue3);
                float quotientValue = spvNClamp((1.0 / (sumValue3 + (fragmentScalarConstants1.packedValues[170u] - fragmentScalarConstants1.packedValues[171u]))) * multiplyAddValue12, 0.0, 1.0);
                float multiplyAddValue13 = fma(-fma(quotientValue, -2.0, 3.0), quotientValue * quotientValue, 1.0);
                float productValue5 = multiplyAddValue13 * (multiplyAddValue13 * multiplyAddValue13);
                vec3 productValue6 = vec3(inverseLengthValue * sumValue, inverseLengthValue * sumValue1, inverseLengthValue * sumValue2);
                float scalarValue3 = rdDot3Precise2(productValue6, vec3(fragmentVectorConstants1.packedValues[44u].xyz));
                float scalarValue4 = rdDot3Precise2(productValue6, vec3(fragmentVectorConstants1.packedValues[37u].xyz));
                float quotientValue1 = spvNClamp((1.0 / (sumValue3 + fragmentScalarConstants1.packedValues[169u])) * multiplyAddValue12, 0.0, 1.0);
                float multiplyAddValue14 = fma(-fma(quotientValue1, -2.0, 3.0), quotientValue1 * quotientValue1, 1.0);
                float productValue10 = multiplyAddValue14 * (multiplyAddValue14 * multiplyAddValue14);
                float multiplyAddValue19 = fma(fma(scalarValue3, scalarValue3, 1.0) * fragmentScalarConstants1.packedValues[199u], 0.75, (fma(scalarValue4, scalarValue4, 1.0) * fragmentScalarConstants1.packedValues[175u]) * 0.75);
                float exponentialValue6 = spvNMin(exp2(log2(spvNMax(scalarValue3, 0.0)) * fragmentScalarConstants1.packedValues[127u]), 1.0);
                float exponentialValue7 = spvNMin(exp2(log2(spvNMax(scalarValue4, 0.0)) * fragmentScalarConstants1.packedValues[127u]), 1.0);
                float multiplyAddValue20 = fma(-exponentialValue6, 1.7999999523162841796875, 1.809999942779541015625);
                float multiplyAddValue21 = fma(-exponentialValue7, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue1 = 0.0361000001430511474609375 / (sqrt(multiplyAddValue20) * multiplyAddValue20);
                float nonlinearValue2 = 0.0361000001430511474609375 / (sqrt(multiplyAddValue21) * multiplyAddValue21);
                float multiplyAddValue22 = fma((fma(productValue10, fragmentVectorConstants1.packedValues[48u].x - fragmentVectorConstants1.packedValues[32u].x, fragmentVectorConstants1.packedValues[32u].x) * fragmentScalarConstants1.packedValues[124u]) * 0.079577468335628509521484375, multiplyAddValue19, ((productValue5 * fragmentVectorConstants1.packedValues[48u].x) * 0.079577468335628509521484375) * fma(exponentialValue6 * ((fragmentVectorConstants1.packedValues[49u].x * fragmentScalarConstants1.packedValues[199u]) * fragmentScalarConstants1.packedValues[125u]), nonlinearValue1, nonlinearValue2 * (exponentialValue7 * ((fragmentVectorConstants1.packedValues[43u].x * fragmentScalarConstants1.packedValues[175u]) * fragmentScalarConstants1.packedValues[126u]))));
                float multiplyAddValue23 = fma((fma(productValue10, fragmentVectorConstants1.packedValues[48u].y - fragmentVectorConstants1.packedValues[32u].y, fragmentVectorConstants1.packedValues[32u].y) * fragmentScalarConstants1.packedValues[124u]) * 0.079577468335628509521484375, multiplyAddValue19, ((productValue5 * fragmentVectorConstants1.packedValues[48u].y) * 0.079577468335628509521484375) * fma(exponentialValue6 * ((fragmentVectorConstants1.packedValues[49u].y * fragmentScalarConstants1.packedValues[199u]) * fragmentScalarConstants1.packedValues[125u]), nonlinearValue1, nonlinearValue2 * (exponentialValue7 * ((fragmentVectorConstants1.packedValues[43u].y * fragmentScalarConstants1.packedValues[175u]) * fragmentScalarConstants1.packedValues[126u]))));
                float multiplyAddValue24 = fma((fma(productValue10, fragmentVectorConstants1.packedValues[48u].z - fragmentVectorConstants1.packedValues[32u].z, fragmentVectorConstants1.packedValues[32u].z) * fragmentScalarConstants1.packedValues[124u]) * 0.079577468335628509521484375, multiplyAddValue19, ((productValue5 * fragmentVectorConstants1.packedValues[48u].z) * 0.079577468335628509521484375) * fma(exponentialValue6 * ((fragmentVectorConstants1.packedValues[49u].z * fragmentScalarConstants1.packedValues[199u]) * fragmentScalarConstants1.packedValues[125u]), nonlinearValue1, nonlinearValue2 * (exponentialValue7 * ((fragmentVectorConstants1.packedValues[43u].z * fragmentScalarConstants1.packedValues[175u]) * fragmentScalarConstants1.packedValues[126u]))));
                bool comparisonValue3 = fragmentScalarConstants1.packedValues[135u] != 0.0;
                float scalarValue5 = spvNMax(fragmentScalarConstants1.packedValues[145u], 1.0);
                productValue7 = comparisonValue3 ? fma(scalarValue5, multiplyAddValue22 - fragmentVectorConstants1.packedValues[50u].x, fragmentVectorConstants1.packedValues[50u].x) : multiplyAddValue22;
                productValue8 = comparisonValue3 ? fma(scalarValue5, multiplyAddValue23 - fragmentVectorConstants1.packedValues[50u].y, fragmentVectorConstants1.packedValues[50u].y) : multiplyAddValue23;
                productValue9 = comparisonValue3 ? fma(scalarValue5, multiplyAddValue24 - fragmentVectorConstants1.packedValues[50u].z, fragmentVectorConstants1.packedValues[50u].z) : multiplyAddValue24;
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float quotientValue2 = spvNClamp(((productValue50 - fragmentVectorConstants1.packedValues[43u].x) + fragmentVectorConstants1.packedValues[43u].w) / (fragmentVectorConstants1.packedValues[43u].z - fragmentVectorConstants1.packedValues[43u].x), 0.0, 1.0);
                float productValue52 = 1.0 - ((quotientValue2 * quotientValue2) * (3.0 - (quotientValue2 * 2.0)));
                float productValue53 = (productValue52 * productValue52) * productValue52;
                float dotProductValue = dot(vec3(productValue49, productValue50, productValue51), vec3(fragmentVectorConstants1.packedValues[45u].xyz));
                float dotProductValue1 = dot(vec3(productValue49, productValue50, productValue51), vec3(fragmentVectorConstants1.packedValues[38u].xyz));
                float sumValue6 = fragmentVectorConstants1.packedValues[43u].x - fragmentVectorConstants1.packedValues[43u].w;
                float quotientValue3 = spvNClamp((productValue50 - sumValue6) / (fragmentVectorConstants1.packedValues[43u].y - sumValue6), 0.0, 1.0);
                float productValue54 = 1.0 - ((quotientValue3 * quotientValue3) * (3.0 - (quotientValue3 * 2.0)));
                float productValue55 = (productValue54 * productValue54) * productValue54;
                float productValue56 = (fragmentVectorConstants1.packedValues[31u].x * 0.75) * ((((dotProductValue1 * dotProductValue1) + 1.0) * fragmentVectorConstants1.packedValues[44u].w) + (((dotProductValue * dotProductValue) + 1.0) * fragmentVectorConstants1.packedValues[50u].w));
                float exponentialValue8 = spvNClamp(exp2(log2(spvNMax(dotProductValue, 0.0)) * fragmentVectorConstants1.packedValues[31u].w), 0.0, 1.0);
                float exponentialValue9 = spvNClamp(exp2(log2(spvNMax(dotProductValue1, 0.0)) * fragmentVectorConstants1.packedValues[31u].w), 0.0, 1.0);
                float productValue57 = 1.809999942779541015625 - (exponentialValue8 * 1.7999999523162841796875);
                float nonlinearValue4 = 0.036100022494792938232421875 / (sqrt(productValue57) * productValue57);
                float productValue58 = 1.809999942779541015625 - (exponentialValue9 * 1.7999999523162841796875);
                float nonlinearValue5 = 0.036100022494792938232421875 / (sqrt(productValue58) * productValue58);
                float productValue59 = exponentialValue8 * (fragmentVectorConstants1.packedValues[31u].y * fragmentVectorConstants1.packedValues[50u].w);
                float productValue60 = exponentialValue9 * (fragmentVectorConstants1.packedValues[31u].z * fragmentVectorConstants1.packedValues[44u].w);
                float productValue61 = (((productValue53 * fragmentVectorConstants1.packedValues[49u].x) * (((productValue60 * fragmentVectorConstants1.packedValues[44u].x) * nonlinearValue5) + ((productValue59 * fragmentVectorConstants1.packedValues[50u].x) * nonlinearValue4))) + (((productValue55 * (fragmentVectorConstants1.packedValues[49u].x - fragmentVectorConstants1.packedValues[32u].x)) + fragmentVectorConstants1.packedValues[32u].x) * productValue56)) * 0.079577468335628509521484375;
                float productValue62 = (((productValue53 * fragmentVectorConstants1.packedValues[49u].y) * (((productValue60 * fragmentVectorConstants1.packedValues[44u].y) * nonlinearValue5) + ((productValue59 * fragmentVectorConstants1.packedValues[50u].y) * nonlinearValue4))) + (((productValue55 * (fragmentVectorConstants1.packedValues[49u].y - fragmentVectorConstants1.packedValues[32u].y)) + fragmentVectorConstants1.packedValues[32u].y) * productValue56)) * 0.079577468335628509521484375;
                float productValue63 = (((productValue53 * fragmentVectorConstants1.packedValues[49u].z) * (((productValue60 * fragmentVectorConstants1.packedValues[44u].z) * nonlinearValue5) + ((productValue59 * fragmentVectorConstants1.packedValues[50u].z) * nonlinearValue4))) + (((productValue55 * (fragmentVectorConstants1.packedValues[49u].z - fragmentVectorConstants1.packedValues[32u].z)) + fragmentVectorConstants1.packedValues[32u].z) * productValue56)) * 0.079577468335628509521484375;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                if (fragmentVectorConstants1.packedValues[33u].w != 0.0)
                {
                    float scalarValue14 = spvNMax(fragmentVectorConstants1.packedValues[36u].y, 1.0);
                    branchMergedValue8 = nonlinearValue3;
                    branchMergedValue9 = ((productValue61 - fragmentVectorConstants1.packedValues[51u].x) * scalarValue14) + fragmentVectorConstants1.packedValues[51u].x;
                    branchMergedValue10 = ((productValue62 - fragmentVectorConstants1.packedValues[51u].y) * scalarValue14) + fragmentVectorConstants1.packedValues[51u].y;
                    branchMergedValue11 = ((productValue63 - fragmentVectorConstants1.packedValues[51u].z) * scalarValue14) + fragmentVectorConstants1.packedValues[51u].z;
                }
                else
                {
                    branchMergedValue8 = nonlinearValue3;
                    branchMergedValue9 = productValue61;
                    branchMergedValue10 = productValue62;
                    branchMergedValue11 = productValue63;
                }
                branchMergedValue4 = branchMergedValue8;
                branchMergedValue5 = branchMergedValue9;
                branchMergedValue6 = branchMergedValue10;
                branchMergedValue7 = branchMergedValue11;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                float quotientValue4 = spvNClamp(((productValue50 - fragmentVectorConstants1.packedValues[42u].x) + fragmentVectorConstants1.packedValues[42u].w) / (fragmentVectorConstants1.packedValues[42u].z - fragmentVectorConstants1.packedValues[42u].x), 0.0, 1.0);
                float productValue76 = 1.0 - ((quotientValue4 * quotientValue4) * (3.0 - (quotientValue4 * 2.0)));
                float productValue77 = (productValue76 * productValue76) * productValue76;
                float dotProductValue2 = dot(vec3(productValue49, productValue50, productValue51), vec3(fragmentVectorConstants1.packedValues[44u].xyz));
                float dotProductValue3 = dot(vec3(productValue49, productValue50, productValue51), vec3(fragmentVectorConstants1.packedValues[37u].xyz));
                float sumValue9 = fragmentVectorConstants1.packedValues[42u].x - fragmentVectorConstants1.packedValues[42u].w;
                float quotientValue5 = spvNClamp((productValue50 - sumValue9) / (fragmentVectorConstants1.packedValues[42u].y - sumValue9), 0.0, 1.0);
                float productValue78 = 1.0 - ((quotientValue5 * quotientValue5) * (3.0 - (quotientValue5 * 2.0)));
                float productValue79 = (productValue78 * productValue78) * productValue78;
                float productValue80 = (fragmentVectorConstants1.packedValues[31u].x * 0.75) * ((((dotProductValue3 * dotProductValue3) + 1.0) * fragmentVectorConstants1.packedValues[43u].w) + (((dotProductValue2 * dotProductValue2) + 1.0) * fragmentVectorConstants1.packedValues[49u].w));
                float exponentialValue10 = spvNClamp(exp2(log2(spvNMax(dotProductValue2, 0.0)) * fragmentVectorConstants1.packedValues[31u].w), 0.0, 1.0);
                float exponentialValue11 = spvNClamp(exp2(log2(spvNMax(dotProductValue3, 0.0)) * fragmentVectorConstants1.packedValues[31u].w), 0.0, 1.0);
                float productValue81 = 1.809999942779541015625 - (exponentialValue10 * 1.7999999523162841796875);
                float nonlinearValue7 = 0.036100022494792938232421875 / (sqrt(productValue81) * productValue81);
                float productValue82 = 1.809999942779541015625 - (exponentialValue11 * 1.7999999523162841796875);
                float nonlinearValue8 = 0.036100022494792938232421875 / (sqrt(productValue82) * productValue82);
                float productValue83 = exponentialValue10 * (fragmentVectorConstants1.packedValues[31u].y * fragmentVectorConstants1.packedValues[49u].w);
                float productValue84 = exponentialValue11 * (fragmentVectorConstants1.packedValues[31u].z * fragmentVectorConstants1.packedValues[43u].w);
                float productValue85 = (((productValue77 * fragmentVectorConstants1.packedValues[48u].x) * (((productValue84 * fragmentVectorConstants1.packedValues[43u].x) * nonlinearValue8) + ((productValue83 * fragmentVectorConstants1.packedValues[49u].x) * nonlinearValue7))) + (((productValue79 * (fragmentVectorConstants1.packedValues[48u].x - fragmentVectorConstants1.packedValues[32u].x)) + fragmentVectorConstants1.packedValues[32u].x) * productValue80)) * 0.079577468335628509521484375;
                float productValue86 = (((productValue77 * fragmentVectorConstants1.packedValues[48u].y) * (((productValue84 * fragmentVectorConstants1.packedValues[43u].y) * nonlinearValue8) + ((productValue83 * fragmentVectorConstants1.packedValues[49u].y) * nonlinearValue7))) + (((productValue79 * (fragmentVectorConstants1.packedValues[48u].y - fragmentVectorConstants1.packedValues[32u].y)) + fragmentVectorConstants1.packedValues[32u].y) * productValue80)) * 0.079577468335628509521484375;
                float productValue87 = (((productValue77 * fragmentVectorConstants1.packedValues[48u].z) * (((productValue84 * fragmentVectorConstants1.packedValues[43u].z) * nonlinearValue8) + ((productValue83 * fragmentVectorConstants1.packedValues[49u].z) * nonlinearValue7))) + (((productValue79 * (fragmentVectorConstants1.packedValues[48u].z - fragmentVectorConstants1.packedValues[32u].z)) + fragmentVectorConstants1.packedValues[32u].z) * productValue80)) * 0.079577468335628509521484375;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                if (fragmentVectorConstants1.packedValues[33u].w != 0.0)
                {
                    float scalarValue14 = spvNMax(fragmentVectorConstants1.packedValues[36u].y, 1.0);
                    branchMergedValue8 = nonlinearValue6;
                    branchMergedValue9 = ((productValue85 - fragmentVectorConstants1.packedValues[50u].x) * scalarValue14) + fragmentVectorConstants1.packedValues[50u].x;
                    branchMergedValue10 = ((productValue86 - fragmentVectorConstants1.packedValues[50u].y) * scalarValue14) + fragmentVectorConstants1.packedValues[50u].y;
                    branchMergedValue11 = ((productValue87 - fragmentVectorConstants1.packedValues[50u].z) * scalarValue14) + fragmentVectorConstants1.packedValues[50u].z;
                }
                else
                {
                    branchMergedValue8 = nonlinearValue6;
                    branchMergedValue9 = productValue85;
                    branchMergedValue10 = productValue86;
                    branchMergedValue11 = productValue87;
                }
                branchMergedValue4 = branchMergedValue8;
                branchMergedValue5 = branchMergedValue9;
                branchMergedValue6 = branchMergedValue10;
                branchMergedValue7 = branchMergedValue11;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue25 = productValue7;
            intermediateValue23 = productValue8;
            intermediateValue21 = productValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = branchMergedValue4;
            branchMergedValue1 = branchMergedValue5;
            branchMergedValue2 = branchMergedValue6;
            branchMergedValue3 = branchMergedValue7;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue25 = 0.0;
            intermediateValue23 = 0.0;
            intermediateValue21 = 0.0;
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            branchMergedValue = nonlinearValue3;
            branchMergedValue1 = 0.0;
            branchMergedValue2 = 0.0;
            branchMergedValue3 = 0.0;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            branchMergedValue = nonlinearValue6;
            branchMergedValue1 = 0.0;
            branchMergedValue2 = 0.0;
            branchMergedValue3 = 0.0;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue19 = nonlinearValue;
        intermediateValue20 = intermediateValue21;
        intermediateValue22 = intermediateValue23;
        intermediateValue24 = intermediateValue25;
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue7 = branchMergedValue;
        intermediateValue8 = branchMergedValue1;
        intermediateValue9 = branchMergedValue2;
        intermediateValue10 = branchMergedValue3;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue3 = branchMergedValue;
        intermediateValue4 = branchMergedValue1;
        intermediateValue5 = branchMergedValue2;
        intermediateValue6 = branchMergedValue3;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue19 = 0.0;
        intermediateValue20 = 0.0;
        intermediateValue22 = 0.0;
        intermediateValue24 = 0.0;
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue7 = 0.0;
        intermediateValue8 = 0.0;
        intermediateValue9 = 0.0;
        intermediateValue10 = 0.0;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue3 = 0.0;
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
        intermediateValue6 = 0.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue15;
    float multiplyAddValue16;
    float multiplyAddValue17;
    float multiplyAddValue18;
    if (fragmentScalarConstants1.packedValues[212u] != 0.0)
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue28;
    float productValue29;
    float productValue30;
    float productValue31;
    if (fragmentVectorConstants1.packedValues[54u].x != 0.0)
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue23;
    float productValue24;
    float productValue25;
    float productValue26;
    if (fragmentVectorConstants1.packedValues[53u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue25 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[10u].z, varyingColor2.z, fma(fragmentVectorConstants1.packedValues[8u].z, varyingColor2.x, varyingColor2.y * fragmentVectorConstants1.packedValues[9u].z)) + fragmentVectorConstants1.packedValues[11u].z)) / (fma(fragmentVectorConstants1.packedValues[10u].w, varyingColor2.z, fma(fragmentVectorConstants1.packedValues[8u].w, varyingColor2.x, varyingColor2.y * fragmentVectorConstants1.packedValues[9u].w)) + fragmentVectorConstants1.packedValues[11u].w)) - fragmentScalarConstants1.packedValues[208u]) / (fragmentScalarConstants1.packedValues[209u] - fragmentScalarConstants1.packedValues[208u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[206u]), -0.5);
        uint sumValue4 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[206u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue25))), int(0u))))));
        float scalarValue6 = rdSignedBitsToFloat(sumValue4);
        float sumValue5 = spvNClamp(multiplyAddValue25 - scalarValue6, 0.0, 1.0);
        float multiplyAddValue26 = fma(varyingColor2.x, 0.5, 0.5);
        float multiplyAddValue27 = fma(varyingColor2.y, 0.5, 0.5);
        vec4 sampledTextureValue2 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(multiplyAddValue26, multiplyAddValue27, scalarValue6), 0.0);
        float scalarValue7 = sampledTextureValue2.x;
        float scalarValue8 = sampledTextureValue2.y;
        float scalarValue9 = sampledTextureValue2.z;
        float scalarValue10 = sampledTextureValue2.w;
        vec4 sampledTextureValue3 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(multiplyAddValue26, multiplyAddValue27, rdSignedBitsToFloat(sumValue4 + 1u)), 0.0);
        multiplyAddValue15 = fma(sumValue5, sampledTextureValue3.z - scalarValue9, scalarValue9);
        multiplyAddValue16 = fma(sumValue5, sampledTextureValue3.y - scalarValue8, scalarValue8);
        multiplyAddValue17 = fma(sumValue5, sampledTextureValue3.x - scalarValue7, scalarValue7);
        multiplyAddValue18 = fma(sumValue5, sampledTextureValue3.w - scalarValue10, scalarValue10);
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float productValue64 = (varyingColor2.x + 1.0) * 0.5;
        float productValue65 = (varyingColor2.y + 1.0) * 0.5;
        uint scalarValue15 = uint(int(fragmentVectorConstants1.packedValues[52u].z));
        float multiplyAddValue39 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[11u].z + fma(fragmentVectorConstants1.packedValues[10u].z, varyingColor2.z, fma(fragmentVectorConstants1.packedValues[9u].z, varyingColor2.y, fragmentVectorConstants1.packedValues[8u].z * varyingColor2.x)))) / (fma(fragmentVectorConstants1.packedValues[10u].w, varyingColor2.z, fma(fragmentVectorConstants1.packedValues[9u].w, varyingColor2.y, fragmentVectorConstants1.packedValues[8u].w * varyingColor2.x)) + fragmentVectorConstants1.packedValues[11u].w)) - fragmentVectorConstants1.packedValues[53u].x) / (fragmentVectorConstants1.packedValues[53u].y - fragmentVectorConstants1.packedValues[53u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue15))) + (-0.5);
        uint sumValue7 = uint(min(int(uint(max(int(uint(int(multiplyAddValue39))), int(0u)))), int(scalarValue15 + 4294967294u)));
        float scalarValue16 = float(int(sumValue7));
        float sumValue8 = spvNMin(spvNMax(multiplyAddValue39 - scalarValue16, 0.0), 1.0);
        vec4 sampledTextureValue7 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue64, productValue65, scalarValue16), 0.0);
        float scalarValue17 = sampledTextureValue7.x;
        float scalarValue18 = sampledTextureValue7.y;
        float scalarValue19 = sampledTextureValue7.z;
        float scalarValue20 = sampledTextureValue7.w;
        vec4 sampledTextureValue8 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue64, productValue65, float(int(sumValue7 + 1u))), 0.0);
        productValue28 = ((sampledTextureValue8.x - scalarValue17) * sumValue8) + scalarValue17;
        productValue29 = ((sampledTextureValue8.y - scalarValue18) * sumValue8) + scalarValue18;
        productValue30 = ((sampledTextureValue8.z - scalarValue19) * sumValue8) + scalarValue19;
        productValue31 = ((sampledTextureValue8.w - scalarValue20) * sumValue8) + scalarValue20;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float productValue64 = (varyingColor2.x + 1.0) * 0.5;
        float productValue65 = (varyingColor2.y + 1.0) * 0.5;
        uint scalarValue21 = uint(int(fragmentVectorConstants1.packedValues[51u].z));
        float multiplyAddValue40 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[11u].z + fma(fragmentVectorConstants1.packedValues[10u].z, varyingColor2.z, fma(fragmentVectorConstants1.packedValues[9u].z, varyingColor2.y, fragmentVectorConstants1.packedValues[8u].z * varyingColor2.x)))) / (fma(fragmentVectorConstants1.packedValues[10u].w, varyingColor2.z, fma(fragmentVectorConstants1.packedValues[9u].w, varyingColor2.y, fragmentVectorConstants1.packedValues[8u].w * varyingColor2.x)) + fragmentVectorConstants1.packedValues[11u].w)) - fragmentVectorConstants1.packedValues[52u].x) / (fragmentVectorConstants1.packedValues[52u].y - fragmentVectorConstants1.packedValues[52u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue21))) + (-0.5);
        uint sumValue10 = uint(min(int(uint(max(int(uint(int(multiplyAddValue40))), int(0u)))), int(scalarValue21 + 4294967294u)));
        float scalarValue22 = float(int(sumValue10));
        float sumValue11 = spvNMin(spvNMax(multiplyAddValue40 - scalarValue22, 0.0), 1.0);
        vec4 sampledTextureValue10 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue64, productValue65, scalarValue22), 0.0);
        float scalarValue23 = sampledTextureValue10.x;
        float scalarValue24 = sampledTextureValue10.y;
        float scalarValue25 = sampledTextureValue10.z;
        float scalarValue26 = sampledTextureValue10.w;
        vec4 sampledTextureValue11 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue64, productValue65, float(int(sumValue10 + 1u))), 0.0);
        productValue23 = ((sampledTextureValue11.x - scalarValue23) * sumValue11) + scalarValue23;
        productValue24 = ((sampledTextureValue11.y - scalarValue24) * sumValue11) + scalarValue24;
        productValue25 = ((sampledTextureValue11.z - scalarValue25) * sumValue11) + scalarValue25;
        productValue26 = ((sampledTextureValue11.w - scalarValue26) * sumValue11) + scalarValue26;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue15 = 0.0;
        multiplyAddValue16 = 0.0;
        multiplyAddValue17 = 0.0;
        multiplyAddValue18 = 1.0;
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue28 = 0.0;
        productValue29 = 0.0;
        productValue30 = 0.0;
        productValue31 = 1.0;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue23 = 0.0;
        productValue24 = 0.0;
        productValue25 = 0.0;
        productValue26 = 1.0;
#endif
    }
#if (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue28 = fma(multiplyAddValue18, fma(intermediateValue19, intermediateValue24 - multiplyAddValue1, multiplyAddValue1), multiplyAddValue17);
    float multiplyAddValue29 = fma(multiplyAddValue18, fma(intermediateValue19, intermediateValue22 - multiplyAddValue2, multiplyAddValue2), multiplyAddValue16);
    float multiplyAddValue30 = fma(multiplyAddValue18, fma(intermediateValue19, intermediateValue20 - multiplyAddValue3, multiplyAddValue3), multiplyAddValue15);
    if (fragmentScalarConstants1.packedValues[180u] > 0.0)
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue45 = fma(multiplyAddValue18, fma(intermediateValue19, intermediateValue24 - multiplyAddValue42, multiplyAddValue42), multiplyAddValue17);
    float multiplyAddValue46 = fma(multiplyAddValue18, fma(intermediateValue19, intermediateValue22 - multiplyAddValue43, multiplyAddValue43), multiplyAddValue16);
    float multiplyAddValue47 = fma(multiplyAddValue18, fma(intermediateValue19, intermediateValue20 - multiplyAddValue44, multiplyAddValue44), multiplyAddValue15);
    float productValue13;
    float productValue14;
    float productValue15;
    if (fragmentScalarConstants1.packedValues[180u] > 0.0)
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue51 = fma(multiplyAddValue18, fma(intermediateValue19, intermediateValue24 - multiplyAddValue48, multiplyAddValue48), multiplyAddValue17);
    float multiplyAddValue52 = fma(multiplyAddValue18, fma(intermediateValue19, intermediateValue22 - multiplyAddValue49, multiplyAddValue49), multiplyAddValue16);
    float multiplyAddValue53 = fma(multiplyAddValue18, fma(intermediateValue19, intermediateValue20 - multiplyAddValue50, multiplyAddValue50), multiplyAddValue15);
    if (fragmentScalarConstants1.packedValues[180u] > 0.0)
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue66 = (productValue31 * (((intermediateValue8 - productValue43) * intermediateValue7) + productValue43)) + productValue28;
    float productValue67 = (productValue31 * (((intermediateValue9 - productValue47) * intermediateValue7) + productValue47)) + productValue29;
    float productValue68 = (productValue31 * (((intermediateValue10 - productValue48) * intermediateValue7) + productValue48)) + productValue30;
    float productValue44;
    float productValue45;
    float productValue46;
    if (fragmentVectorConstants1.packedValues[46u].x > 0.0)
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue88 = (productValue26 * (((intermediateValue4 - productValue73) * intermediateValue3) + productValue73)) + productValue23;
    float productValue89 = (productValue26 * (((intermediateValue5 - productValue74) * intermediateValue3) + productValue74)) + productValue24;
    float productValue90 = (productValue26 * (((intermediateValue6 - productValue75) * intermediateValue3) + productValue75)) + productValue25;
    float productValue39;
    float productValue40;
    float productValue41;
    if (fragmentVectorConstants1.packedValues[45u].x > 0.0)
#endif
    {
#if (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float sampledTextureValue4 = (0.180000007152557373046875 / texture(sampler2D(materialTexture4, textureSampler4), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        fragmentColor0.x = sampledTextureValue4 * multiplyAddValue28;
        fragmentColor0.y = sampledTextureValue4 * multiplyAddValue29;
        fragmentColor0.z = sampledTextureValue4 * multiplyAddValue30;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float sampledTextureValue4 = (0.180000007152557373046875 / texture(sampler2D(materialTexture4, textureSampler4), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue13 = multiplyAddValue47 * sampledTextureValue4;
        productValue14 = multiplyAddValue46 * sampledTextureValue4;
        productValue15 = multiplyAddValue45 * sampledTextureValue4;
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float sampledTextureValue4 = (0.180000007152557373046875 / texture(sampler2D(materialTexture4, textureSampler4), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        fragmentColor0.x = sampledTextureValue4 * multiplyAddValue51;
        fragmentColor0.y = sampledTextureValue4 * multiplyAddValue52;
        fragmentColor0.z = sampledTextureValue4 * multiplyAddValue53;
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue9 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue44 = sampledTextureValue9 * productValue66;
        productValue45 = sampledTextureValue9 * productValue67;
        productValue46 = sampledTextureValue9 * productValue68;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue9 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue39 = sampledTextureValue9 * productValue88;
        productValue40 = sampledTextureValue9 * productValue89;
        productValue41 = sampledTextureValue9 * productValue90;
#endif
    }
    else
    {
#if (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        fragmentColor0.x = multiplyAddValue28;
        fragmentColor0.y = multiplyAddValue29;
        fragmentColor0.z = multiplyAddValue30;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue13 = multiplyAddValue47;
        productValue14 = multiplyAddValue46;
        productValue15 = multiplyAddValue45;
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        fragmentColor0.x = multiplyAddValue51;
        fragmentColor0.y = multiplyAddValue52;
        fragmentColor0.z = multiplyAddValue53;
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue44 = productValue66;
        productValue45 = productValue67;
        productValue46 = productValue68;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue39 = productValue88;
        productValue40 = productValue89;
        productValue41 = productValue90;
#endif
    }
#if (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = productValue15;
    fragmentColor0.y = productValue14;
    fragmentColor0.z = productValue13;
    fragmentColor0.w = sampledTextureValue.w;
#elif (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = productValue44;
    fragmentColor0.y = productValue45;
    fragmentColor0.z = productValue46;
    fragmentColor0.w = intermediateValue6 * sampledTextureValue5.w;
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = productValue39;
    fragmentColor0.y = productValue40;
    fragmentColor0.z = productValue41;
    fragmentColor0.w = sampledTextureValue5.w;
#endif
}
