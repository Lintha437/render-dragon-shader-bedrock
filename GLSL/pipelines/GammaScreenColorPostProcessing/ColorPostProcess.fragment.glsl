#version 460
#extension GL_GOOGLE_include_directive : require
// GammaScreenColorPostProcessing / ColorPostProcess / fragment forward pipeline.
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

#include "../../include/materials/GammaScreenColorPostProcessing/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    precise float sumValue = scalarValue + 0.054999999701976776123046875;
    precise float sumValue1 = scalarValue1 + 0.054999999701976776123046875;
    precise float sumValue2 = scalarValue2 + 0.054999999701976776123046875;
    precise float productValue1 = sumValue * 0.947867333889007568359375;
    precise float productValue2 = sumValue1 * 0.947867333889007568359375;
    precise float productValue3 = sumValue2 * 0.947867333889007568359375;
    precise float nonlinearValue3 = log2(productValue1) * 2.400000095367431640625;
    precise float nonlinearValue4 = log2(productValue2) * 2.400000095367431640625;
    precise float nonlinearValue5 = log2(productValue3) * 2.400000095367431640625;
    precise float productValue4 = scalarValue * 0.077399380505084991455078125;
    precise float productValue5 = scalarValue1 * 0.077399380505084991455078125;
    precise float productValue6 = scalarValue2 * 0.077399380505084991455078125;
    precise float nonlinearValue6 = log2(spvNMax(scalarValue, 0.0)) * 2.2000000476837158203125;
    precise float nonlinearValue7 = log2(spvNMax(scalarValue1, 0.0)) * 2.2000000476837158203125;
    precise float nonlinearValue8 = log2(spvNMax(scalarValue2, 0.0)) * 2.2000000476837158203125;
    bool comparisonValue = fragmentScalarConstants1.packedValues[1u] != 0.0;
    float exponentialValue6 = comparisonValue ? exp2(nonlinearValue6) : ((scalarValue <= 0.040449999272823333740234375) ? productValue4 : exp2(nonlinearValue3));
    float exponentialValue7 = comparisonValue ? exp2(nonlinearValue7) : ((scalarValue1 <= 0.040449999272823333740234375) ? productValue5 : exp2(nonlinearValue4));
    float exponentialValue8 = comparisonValue ? exp2(nonlinearValue8) : ((scalarValue2 <= 0.040449999272823333740234375) ? productValue6 : exp2(nonlinearValue5));
    precise float nonlinearValue9 = log2(abs(exponentialValue6)) * 0.4166666567325592041015625;
    precise float nonlinearValue10 = log2(abs(exponentialValue7)) * 0.4166666567325592041015625;
    precise float nonlinearValue11 = log2(abs(exponentialValue8)) * 0.4166666567325592041015625;
    precise float productValue7 = exponentialValue6 * 12.9200000762939453125;
    precise float productValue8 = exponentialValue7 * 12.9200000762939453125;
    precise float productValue9 = exponentialValue8 * 12.9200000762939453125;
    precise float productValue10 = fragmentScalarConstants1.packedValues[0u] * 2.2000000476837158203125;
    precise float quotientValue4 = 2.2000000476837158203125 / productValue10;
    precise float quotientValue5 = 1.0 / productValue10;
    precise float nonlinearValue12 = log2(spvNMax(exponentialValue6, 0.0)) * quotientValue5;
    precise float nonlinearValue13 = log2(spvNMax(exponentialValue7, 0.0)) * quotientValue5;
    precise float nonlinearValue14 = log2(spvNMax(exponentialValue8, 0.0)) * quotientValue5;
    precise float multiplyAddValue = log2((exponentialValue6 <= 0.003130800090730190277099609375) ? productValue7 : fma(exp2(nonlinearValue9), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue4;
    precise float multiplyAddValue1 = log2((exponentialValue7 <= 0.003130800090730190277099609375) ? productValue8 : fma(exp2(nonlinearValue10), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue4;
    precise float multiplyAddValue2 = log2((exponentialValue8 <= 0.003130800090730190277099609375) ? productValue9 : fma(exp2(nonlinearValue11), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue4;
    fragmentColor0.x = spvNMin(comparisonValue ? exp2(nonlinearValue12) : exp2(multiplyAddValue), 1.0);
    fragmentColor0.y = spvNMin(comparisonValue ? exp2(nonlinearValue13) : exp2(multiplyAddValue1), 1.0);
    fragmentColor0.z = spvNMin(comparisonValue ? exp2(nonlinearValue14) : exp2(multiplyAddValue2), 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    bool comparisonValue = fragmentScalarConstants1.packedValues[1u] != 0.0;
    float exponentialValue3 = comparisonValue ? exp2(log2(spvNMax(scalarValue, 0.0)) * 2.2000000476837158203125) : ((scalarValue <= 0.040449999272823333740234375) ? (scalarValue * 0.077399380505084991455078125) : exp2(log2((scalarValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue4 = comparisonValue ? exp2(log2(spvNMax(scalarValue1, 0.0)) * 2.2000000476837158203125) : ((scalarValue1 <= 0.040449999272823333740234375) ? (scalarValue1 * 0.077399380505084991455078125) : exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue5 = comparisonValue ? exp2(log2(spvNMax(scalarValue2, 0.0)) * 2.2000000476837158203125) : ((scalarValue2 <= 0.040449999272823333740234375) ? (scalarValue2 * 0.077399380505084991455078125) : exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float productValue = fragmentScalarConstants1.packedValues[0u] * 2.2000000476837158203125;
    float quotientValue = 2.2000000476837158203125 / productValue;
    float quotientValue1 = 1.0 / productValue;
    fragmentColor0.x = spvNMin(comparisonValue ? exp2(log2(spvNMax(exponentialValue3, 0.0)) * quotientValue1) : exp2(log2((exponentialValue3 <= 0.003130800090730190277099609375) ? (exponentialValue3 * 12.9200000762939453125) : fma(exp2(log2(abs(exponentialValue3)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue), 1.0);
    fragmentColor0.y = spvNMin(comparisonValue ? exp2(log2(spvNMax(exponentialValue4, 0.0)) * quotientValue1) : exp2(log2((exponentialValue4 <= 0.003130800090730190277099609375) ? (exponentialValue4 * 12.9200000762939453125) : fma(exp2(log2(abs(exponentialValue4)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue), 1.0);
    fragmentColor0.z = spvNMin(comparisonValue ? exp2(log2(spvNMax(exponentialValue5, 0.0)) * quotientValue1) : exp2(log2((exponentialValue5 <= 0.003130800090730190277099609375) ? (exponentialValue5 * 12.9200000762939453125) : fma(exp2(log2(abs(exponentialValue5)) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875)) * quotientValue), 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue1 = texture(sampler2D(colorTextureTexture, colorTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.x;
    float scalarValue4 = sampledTextureValue1.y;
    float scalarValue5 = sampledTextureValue1.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[0u].y != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(scalarValue3, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue4, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue5, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue3 <= 0.040449999272823333740234375) ? (scalarValue3 * 0.077399380505084991455078125) : exp2(log2((scalarValue3 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue4 <= 0.040449999272823333740234375) ? (scalarValue4 * 0.077399380505084991455078125) : exp2(log2((scalarValue4 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue5 <= 0.040449999272823333740234375) ? (scalarValue5 * 0.077399380505084991455078125) : exp2(log2((scalarValue5 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float nonlinearValue;
    float nonlinearValue1;
    float nonlinearValue2;
    if (fragmentVectorConstants1.packedValues[0u].y != 0.0)
    {
        float quotientValue2 = 0.454545438289642333984375 / fragmentVectorConstants1.packedValues[0u].x;
        nonlinearValue = log2(spvNMax(exponentialValue, 0.0)) * quotientValue2;
        nonlinearValue1 = log2(spvNMax(exponentialValue1, 0.0)) * quotientValue2;
        nonlinearValue2 = log2(spvNMax(exponentialValue2, 0.0)) * quotientValue2;
    }
    else
    {
        float quotientValue3 = 1.0 / fragmentVectorConstants1.packedValues[0u].x;
        nonlinearValue = log2((exponentialValue <= 0.003130800090730190277099609375) ? (exponentialValue * 12.9200000762939453125) : ((exp2(log2(abs(exponentialValue)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * quotientValue3;
        nonlinearValue1 = log2((exponentialValue1 <= 0.003130800090730190277099609375) ? (exponentialValue1 * 12.9200000762939453125) : ((exp2(log2(abs(exponentialValue1)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * quotientValue3;
        nonlinearValue2 = log2((exponentialValue2 <= 0.003130800090730190277099609375) ? (exponentialValue2 * 12.9200000762939453125) : ((exp2(log2(abs(exponentialValue2)) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875))) * quotientValue3;
    }
    fragmentColor0.x = spvNMin(spvNMax(exp2(nonlinearValue), 0.0), 1.0);
    fragmentColor0.y = spvNMin(spvNMax(exp2(nonlinearValue1), 0.0), 1.0);
    fragmentColor0.z = spvNMin(spvNMax(exp2(nonlinearValue2), 0.0), 1.0);
#endif
    fragmentColor0.w = 1.0;
}
