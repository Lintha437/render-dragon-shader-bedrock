#version 460
#extension GL_GOOGLE_include_directive : require
// CubemapHDRi / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/CubemapHDRi/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec3 vectorValue = vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue4 = inverseLengthValue1 * varyingTexCoord0.x;
    precise float productValue5 = inverseLengthValue1 * varyingTexCoord0.y;
    precise float productValue6 = inverseLengthValue1 * varyingTexCoord0.z;
    vec4 sampledTextureValue4 = texture(samplerCube(materialTexture1, textureSampler1), vec3(-productValue4, productValue5, productValue6));
    float scalarValue6 = sampledTextureValue4.x;
    float scalarValue7 = sampledTextureValue4.y;
    float scalarValue8 = sampledTextureValue4.z;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if (fragmentScalarConstants1.packedValues[4u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec3 vectorValue = vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    vec4 sampledTextureValue2 = texture(samplerCube(materialTexture1, textureSampler1), vec3(-(inverseLengthValue1 * varyingTexCoord0.x), inverseLengthValue1 * varyingTexCoord0.y, inverseLengthValue1 * varyingTexCoord0.z));
    float scalarValue3 = sampledTextureValue2.x;
    float scalarValue4 = sampledTextureValue2.y;
    float scalarValue5 = sampledTextureValue2.z;
    float productValue1;
    float productValue2;
    float productValue3;
    if (fragmentScalarConstants1.packedValues[4u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float inverseLengthValue = inversesqrt(dot(vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z), vec3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z)));
    vec4 sampledTextureValue = texture(samplerCube(matTextureTexture, matTextureSampler), vec3((-0.0) - (varyingTexCoord0.x * inverseLengthValue), inverseLengthValue * varyingTexCoord0.y, inverseLengthValue * varyingTexCoord0.z));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float productValue;
    float productValue1;
    float productValue2;
    if (fragmentVectorConstants1.packedValues[1u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float sampledTextureValue5 = 0.180000007152557373046875 / texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x;
        precise float sumValue = sampledTextureValue5 + 9.9999997473787516355514526367188e-05;
        precise float productValue7 = scalarValue6 * sumValue;
        precise float productValue8 = scalarValue7 * sumValue;
        precise float productValue9 = scalarValue8 * sumValue;
        intermediateValue11 = productValue9;
        intermediateValue12 = productValue8;
        intermediateValue13 = productValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue3 = (0.180000007152557373046875 / texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue1 = scalarValue5 * sampledTextureValue3;
        productValue2 = scalarValue4 * sampledTextureValue3;
        productValue3 = scalarValue3 * sampledTextureValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue1 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue = sampledTextureValue1 * scalarValue;
        productValue1 = sampledTextureValue1 * scalarValue1;
        productValue2 = sampledTextureValue1 * scalarValue2;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        bool comparisonValue = fragmentScalarConstants1.packedValues[0u] != 0.0;
        precise float nonlinearValue = log2(spvNMax(scalarValue6, 0.0)) * 2.2000000476837158203125;
        precise float nonlinearValue1 = log2(spvNMax(scalarValue7, 0.0)) * 2.2000000476837158203125;
        precise float nonlinearValue2 = log2(spvNMax(scalarValue8, 0.0)) * 2.2000000476837158203125;
        precise float productValue10 = scalarValue6 * 0.077399380505084991455078125;
        precise float productValue11 = scalarValue7 * 0.077399380505084991455078125;
        precise float productValue12 = scalarValue8 * 0.077399380505084991455078125;
        precise float sumValue1 = scalarValue6 + 0.054999999701976776123046875;
        precise float sumValue2 = scalarValue7 + 0.054999999701976776123046875;
        precise float sumValue3 = scalarValue8 + 0.054999999701976776123046875;
        precise float productValue13 = sumValue1 * 0.947867333889007568359375;
        precise float productValue14 = sumValue2 * 0.947867333889007568359375;
        precise float productValue15 = sumValue3 * 0.947867333889007568359375;
        precise float nonlinearValue3 = log2(productValue13) * 2.400000095367431640625;
        precise float nonlinearValue4 = log2(productValue14) * 2.400000095367431640625;
        precise float nonlinearValue5 = log2(productValue15) * 2.400000095367431640625;
        intermediateValue11 = comparisonValue ? exp2(nonlinearValue2) : ((scalarValue8 <= 0.040449999272823333740234375) ? productValue12 : exp2(nonlinearValue5));
        intermediateValue12 = comparisonValue ? exp2(nonlinearValue1) : ((scalarValue7 <= 0.040449999272823333740234375) ? productValue11 : exp2(nonlinearValue4));
        intermediateValue13 = comparisonValue ? exp2(nonlinearValue) : ((scalarValue6 <= 0.040449999272823333740234375) ? productValue10 : exp2(nonlinearValue3));
#elif RD_PLATFORM == RD_PLATFORM_SM50
        bool comparisonValue = fragmentScalarConstants1.packedValues[0u] != 0.0;
        productValue1 = comparisonValue ? exp2(log2(spvNMax(scalarValue5, 0.0)) * 2.2000000476837158203125) : ((scalarValue5 <= 0.040449999272823333740234375) ? (scalarValue5 * 0.077399380505084991455078125) : exp2(log2((scalarValue5 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
        productValue2 = comparisonValue ? exp2(log2(spvNMax(scalarValue4, 0.0)) * 2.2000000476837158203125) : ((scalarValue4 <= 0.040449999272823333740234375) ? (scalarValue4 * 0.077399380505084991455078125) : exp2(log2((scalarValue4 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
        productValue3 = comparisonValue ? exp2(log2(spvNMax(scalarValue3, 0.0)) * 2.2000000476837158203125) : ((scalarValue3 <= 0.040449999272823333740234375) ? (scalarValue3 * 0.077399380505084991455078125) : exp2(log2((scalarValue3 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (fragmentVectorConstants1.packedValues[0u].x != 0.0)
        {
            branchMergedValue = exp2(log2(spvNMax(scalarValue, 0.0)) * 2.2000000476837158203125);
            branchMergedValue1 = exp2(log2(spvNMax(scalarValue1, 0.0)) * 2.2000000476837158203125);
            branchMergedValue2 = exp2(log2(spvNMax(scalarValue2, 0.0)) * 2.2000000476837158203125);
        }
        else
        {
            branchMergedValue = (scalarValue <= 0.040449999272823333740234375) ? (scalarValue * 0.077399380505084991455078125) : exp2(log2((scalarValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
            branchMergedValue1 = (scalarValue1 <= 0.040449999272823333740234375) ? (scalarValue1 * 0.077399380505084991455078125) : exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
            branchMergedValue2 = (scalarValue2 <= 0.040449999272823333740234375) ? (scalarValue2 * 0.077399380505084991455078125) : exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        }
        productValue = branchMergedValue;
        productValue1 = branchMergedValue1;
        productValue2 = branchMergedValue2;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    fragmentColor0.x = intermediateValue13;
    fragmentColor0.y = intermediateValue12;
    fragmentColor0.z = intermediateValue11;
    fragmentColor0.w = sampledTextureValue4.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = productValue3;
    fragmentColor0.y = productValue2;
    fragmentColor0.z = productValue1;
    fragmentColor0.w = sampledTextureValue2.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = productValue;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue2;
    fragmentColor0.w = sampledTextureValue.w;
#endif
}
