#version 460
#extension GL_GOOGLE_include_directive : require
// EndPortalForwardPBR / ForceForwardPBROpaque / fragment forward pipeline.
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

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/EndPortalForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    precise float sumValue = 1.0 - varyingTexCoord2;
    precise float productValue4 = sampledTextureValue2.x * sumValue;
    precise float productValue5 = sampledTextureValue2.y * sumValue;
    precise float productValue6 = sampledTextureValue2.z * sumValue;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue7 = productValue4 * sampledTextureValue3.x;
    precise float productValue8 = productValue5 * sampledTextureValue3.y;
    precise float productValue9 = productValue6 * sampledTextureValue3.z;
    precise float sumValue1 = 1.0 - varyingColor0.w;
    precise float productValue10 = sumValue1 * productValue7;
    precise float productValue11 = sumValue1 * productValue8;
    precise float productValue12 = sumValue1 * productValue9;
    bool conditionValue = varyingTexCoord2 > 0.96875;
    precise float productValue13 = varyingColor0.w * varyingColor0.x;
    precise float productValue14 = varyingColor0.w * varyingColor0.y;
    precise float productValue15 = varyingColor0.w * varyingColor0.z;
    float comparisonValue = conditionValue ? productValue13 : productValue10;
    float comparisonValue1 = conditionValue ? productValue14 : productValue11;
    float comparisonValue2 = conditionValue ? productValue15 : productValue12;
    precise float sumValue2 = comparisonValue + 0.054999999701976776123046875;
    precise float sumValue3 = comparisonValue1 + 0.054999999701976776123046875;
    precise float sumValue4 = comparisonValue2 + 0.054999999701976776123046875;
    precise float productValue16 = sumValue2 * 0.947867333889007568359375;
    precise float productValue17 = sumValue3 * 0.947867333889007568359375;
    precise float productValue18 = sumValue4 * 0.947867333889007568359375;
    precise float nonlinearValue = log2(productValue16) * 2.400000095367431640625;
    precise float nonlinearValue1 = log2(productValue17) * 2.400000095367431640625;
    precise float nonlinearValue2 = log2(productValue18) * 2.400000095367431640625;
    precise float productValue19 = comparisonValue * 0.077399380505084991455078125;
    precise float productValue20 = comparisonValue1 * 0.077399380505084991455078125;
    precise float productValue21 = comparisonValue2 * 0.077399380505084991455078125;
    fragmentColor0.w = float(conditionValue);
    precise float nonlinearValue3 = log2(spvNMax(comparisonValue, 0.0)) * 2.2000000476837158203125;
    precise float nonlinearValue4 = log2(spvNMax(comparisonValue1, 0.0)) * 2.2000000476837158203125;
    precise float nonlinearValue5 = log2(spvNMax(comparisonValue2, 0.0)) * 2.2000000476837158203125;
    bool comparisonValue3 = fragmentScalarConstants1.packedValues[4u] != 0.0;
    float exponentialValue3 = comparisonValue3 ? exp2(nonlinearValue3) : ((comparisonValue <= 0.040449999272823333740234375) ? productValue19 : exp2(nonlinearValue));
    float exponentialValue4 = comparisonValue3 ? exp2(nonlinearValue4) : ((comparisonValue1 <= 0.040449999272823333740234375) ? productValue20 : exp2(nonlinearValue1));
    float exponentialValue5 = comparisonValue3 ? exp2(nonlinearValue5) : ((comparisonValue2 <= 0.040449999272823333740234375) ? productValue21 : exp2(nonlinearValue2));
    float scalarValue = rdDot3Precise2(vec3(exponentialValue3, exponentialValue4, exponentialValue5), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    precise float sumValue5 = scalarValue - exponentialValue3;
    precise float sumValue6 = scalarValue - exponentialValue4;
    precise float sumValue7 = scalarValue - exponentialValue5;
    fragmentColor0.x = fma(fma(fragmentScalarConstants1.packedValues[1u], sumValue5, exponentialValue3), fragmentScalarConstants1.packedValues[0u], exponentialValue3);
    fragmentColor0.y = fma(fma(fragmentScalarConstants1.packedValues[1u], sumValue6, exponentialValue4), fragmentScalarConstants1.packedValues[0u], exponentialValue4);
    fragmentColor0.z = fma(fma(fragmentScalarConstants1.packedValues[1u], sumValue7, exponentialValue5), fragmentScalarConstants1.packedValues[0u], exponentialValue5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float sumValue8 = 1.0 - varyingTexCoord2;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float sumValue9 = 1.0 - varyingColor0.w;
    bool conditionValue = varyingTexCoord2 > 0.96875;
    float comparisonValue4 = conditionValue ? (varyingColor0.w * varyingColor0.x) : (sumValue9 * ((sampledTextureValue2.x * sumValue8) * sampledTextureValue3.x));
    float comparisonValue5 = conditionValue ? (varyingColor0.w * varyingColor0.y) : (sumValue9 * ((sampledTextureValue2.y * sumValue8) * sampledTextureValue3.y));
    float comparisonValue6 = conditionValue ? (varyingColor0.w * varyingColor0.z) : (sumValue9 * ((sampledTextureValue2.z * sumValue8) * sampledTextureValue3.z));
    fragmentColor0.w = float(conditionValue);
    bool comparisonValue3 = fragmentScalarConstants1.packedValues[4u] != 0.0;
    float exponentialValue6 = comparisonValue3 ? exp2(log2(spvNMax(comparisonValue4, 0.0)) * 2.2000000476837158203125) : ((comparisonValue4 <= 0.040449999272823333740234375) ? (comparisonValue4 * 0.077399380505084991455078125) : exp2(log2((comparisonValue4 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue7 = comparisonValue3 ? exp2(log2(spvNMax(comparisonValue5, 0.0)) * 2.2000000476837158203125) : ((comparisonValue5 <= 0.040449999272823333740234375) ? (comparisonValue5 * 0.077399380505084991455078125) : exp2(log2((comparisonValue5 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue8 = comparisonValue3 ? exp2(log2(spvNMax(comparisonValue6, 0.0)) * 2.2000000476837158203125) : ((comparisonValue6 <= 0.040449999272823333740234375) ? (comparisonValue6 * 0.077399380505084991455078125) : exp2(log2((comparisonValue6 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float scalarValue1 = rdDot3Precise2(vec3(exponentialValue6, exponentialValue7, exponentialValue8), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    fragmentColor0.x = fma(fma(fragmentScalarConstants1.packedValues[1u], scalarValue1 - exponentialValue6, exponentialValue6), fragmentScalarConstants1.packedValues[0u], exponentialValue6);
    fragmentColor0.y = fma(fma(fragmentScalarConstants1.packedValues[1u], scalarValue1 - exponentialValue7, exponentialValue7), fragmentScalarConstants1.packedValues[0u], exponentialValue7);
    fragmentColor0.z = fma(fma(fragmentScalarConstants1.packedValues[1u], scalarValue1 - exponentialValue8, exponentialValue8), fragmentScalarConstants1.packedValues[0u], exponentialValue8);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(colorTextureTexture, colorTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(parallaxTextureTexture, parallaxTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
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
        productValue1 = (sampledTextureValue.x * productValue) * sampledTextureValue1.x;
        productValue2 = (sampledTextureValue.y * productValue) * sampledTextureValue1.y;
        productValue3 = (sampledTextureValue.z * productValue) * sampledTextureValue1.z;
        intermediateValue = 0.0;
    }
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[1u].x != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(productValue1, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(productValue2, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(productValue3, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (productValue1 <= 0.040449999272823333740234375) ? (productValue1 * 0.077399380505084991455078125) : exp2(log2((productValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (productValue2 <= 0.040449999272823333740234375) ? (productValue2 * 0.077399380505084991455078125) : exp2(log2((productValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (productValue3 <= 0.040449999272823333740234375) ? (productValue3 * 0.077399380505084991455078125) : exp2(log2((productValue3 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float dotProductValue = dot(vec3(exponentialValue, exponentialValue1, exponentialValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    fragmentColor0.x = ((((dotProductValue - exponentialValue) * fragmentVectorConstants1.packedValues[0u].y) + exponentialValue) * fragmentVectorConstants1.packedValues[0u].x) + exponentialValue;
    fragmentColor0.y = ((((dotProductValue - exponentialValue1) * fragmentVectorConstants1.packedValues[0u].y) + exponentialValue1) * fragmentVectorConstants1.packedValues[0u].x) + exponentialValue1;
    fragmentColor0.z = ((((dotProductValue - exponentialValue2) * fragmentVectorConstants1.packedValues[0u].y) + exponentialValue2) * fragmentVectorConstants1.packedValues[0u].x) + exponentialValue2;
    fragmentColor0.w = intermediateValue;
#endif
}
