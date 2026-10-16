#version 460
#extension GL_GOOGLE_include_directive : require
// LegacyCubemap / TransparentDegamma / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/LegacyCubemap/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.x;
    float scalarValue4 = sampledTextureValue1.y;
    float scalarValue5 = sampledTextureValue1.z;
    precise float sumValue = scalarValue3 + 0.054999999701976776123046875;
    precise float sumValue1 = scalarValue4 + 0.054999999701976776123046875;
    precise float sumValue2 = scalarValue5 + 0.054999999701976776123046875;
    precise float productValue = sumValue * 0.947867333889007568359375;
    precise float productValue1 = sumValue1 * 0.947867333889007568359375;
    precise float productValue2 = sumValue2 * 0.947867333889007568359375;
    precise float nonlinearValue = log2(productValue) * 2.400000095367431640625;
    precise float nonlinearValue1 = log2(productValue1) * 2.400000095367431640625;
    precise float nonlinearValue2 = log2(productValue2) * 2.400000095367431640625;
    precise float productValue3 = scalarValue3 * 0.077399380505084991455078125;
    precise float productValue4 = scalarValue4 * 0.077399380505084991455078125;
    precise float productValue5 = scalarValue5 * 0.077399380505084991455078125;
    bool comparisonValue = fragmentScalarConstants1.packedValues[0u] != 0.0;
    fragmentColor0.w = sampledTextureValue1.w;
    precise float nonlinearValue3 = log2(spvNMax(scalarValue3, 0.0)) * 2.2000000476837158203125;
    precise float nonlinearValue4 = log2(spvNMax(scalarValue4, 0.0)) * 2.2000000476837158203125;
    precise float nonlinearValue5 = log2(spvNMax(scalarValue5, 0.0)) * 2.2000000476837158203125;
    fragmentColor0.x = comparisonValue ? exp2(nonlinearValue3) : ((scalarValue3 <= 0.040449999272823333740234375) ? productValue3 : exp2(nonlinearValue));
    fragmentColor0.y = comparisonValue ? exp2(nonlinearValue4) : ((scalarValue4 <= 0.040449999272823333740234375) ? productValue4 : exp2(nonlinearValue1));
    fragmentColor0.z = comparisonValue ? exp2(nonlinearValue5) : ((scalarValue5 <= 0.040449999272823333740234375) ? productValue5 : exp2(nonlinearValue2));
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.x;
    float scalarValue4 = sampledTextureValue1.y;
    float scalarValue5 = sampledTextureValue1.z;
    bool comparisonValue = fragmentScalarConstants1.packedValues[0u] != 0.0;
    fragmentColor0.w = sampledTextureValue1.w;
    fragmentColor0.x = comparisonValue ? exp2(log2(spvNMax(scalarValue3, 0.0)) * 2.2000000476837158203125) : ((scalarValue3 <= 0.040449999272823333740234375) ? (scalarValue3 * 0.077399380505084991455078125) : exp2(log2((scalarValue3 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    fragmentColor0.y = comparisonValue ? exp2(log2(spvNMax(scalarValue4, 0.0)) * 2.2000000476837158203125) : ((scalarValue4 <= 0.040449999272823333740234375) ? (scalarValue4 * 0.077399380505084991455078125) : exp2(log2((scalarValue4 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    fragmentColor0.z = comparisonValue ? exp2(log2(spvNMax(scalarValue5, 0.0)) * 2.2000000476837158203125) : ((scalarValue5 <= 0.040449999272823333740234375) ? (scalarValue5 * 0.077399380505084991455078125) : exp2(log2((scalarValue5 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[0u].x != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(scalarValue, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue1, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue2, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue <= 0.040449999272823333740234375) ? (scalarValue * 0.077399380505084991455078125) : exp2(log2((scalarValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue1 <= 0.040449999272823333740234375) ? (scalarValue1 * 0.077399380505084991455078125) : exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue2 <= 0.040449999272823333740234375) ? (scalarValue2 * 0.077399380505084991455078125) : exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    fragmentColor0.x = exponentialValue;
    fragmentColor0.y = exponentialValue1;
    fragmentColor0.z = exponentialValue2;
    fragmentColor0.w = sampledTextureValue.w;
#endif
}
