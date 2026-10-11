#version 460
#extension GL_GOOGLE_include_directive : require
// VolumeScattering / Scattering / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_samplerless_texture_functions : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/VolumeScattering/ComputeBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint scalarValue = uint(int(computeVectorConstants0.packedValues[1u].z));
#endif
    if (!((int(gl_GlobalInvocationID.x) >= int(uint(int(computeVectorConstants0.packedValues[1u].x)))) || (int(gl_GlobalInvocationID.y) >= int(uint(int(computeVectorConstants0.packedValues[1u].y))))))
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint scalarValue2 = uint(int(computeScalarConstants0.packedValues[6u]));
        float exponentialValue3 = exp2(((-0.5) / computeScalarConstants0.packedValues[6u]) * 5.770780086517333984375);
        float multiplyAddValue = fma(fma(1.0 - exponentialValue3, 0.0186573602259159088134765625, 1.0), computeScalarConstants0.packedValues[0u], ((exponentialValue3 - 1.0) * 0.0186573602259159088134765625) * computeScalarConstants0.packedValues[1u]);
        float multiplyAddValue1;
        float multiplyAddValue2;
        float multiplyAddValue3;
        float productValue;
        float multiplyAddValue4;
        uint sumValue;
        float scalarValue3 = 0.0;
        float scalarValue4 = 0.0;
        float scalarValue5 = 0.0;
        float scalarValue6 = 1.0;
        float scalarValue7 = multiplyAddValue;
        uint scalarValue8 = 0u;
        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float exponentialValue = (exp2((-2.8853900432586669921875) / computeVectorConstants0.packedValues[1u].z) + (-1.0)) * 0.0186573602259159088134765625;
        if (int(scalarValue) > int(0u))
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            if (int(scalarValue2) <= int(scalarValue8))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue;
            float intermediateValue1;
            float intermediateValue2;
            float intermediateValue3;
            float intermediateValue4;
            uint intermediateValue5;
            productValue = (computeVectorConstants0.packedValues[0u].x * (1.0 - exponentialValue)) + (computeVectorConstants0.packedValues[0u].y * exponentialValue);
            intermediateValue1 = 0.0;
            intermediateValue2 = 0.0;
            intermediateValue3 = 0.0;
            intermediateValue4 = 1.0;
            intermediateValue5 = 0u;
            for (;;)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                break;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float exponentialValue1 = (exp2(((float(int(intermediateValue5)) + 0.5) / computeVectorConstants0.packedValues[1u].z) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625;
                float productValue1 = ((1.0 - exponentialValue1) * computeVectorConstants0.packedValues[0u].x) + (computeVectorConstants0.packedValues[0u].y * exponentialValue1);
                float sumValue1 = productValue1 - productValue;
                vec4 sampledTextureValue = texelFetch(scatteringBufferInTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, intermediateValue5)), int(0u));
                float scalarValue1 = sampledTextureValue.w;
                float exponentialValue2 = exp2((scalarValue1 * (-1.44269502162933349609375)) * sumValue1);
                float comparisonValue = ((abs(scalarValue1) > 9.9999999747524270787835121154785e-07) ? ((1.0 - exponentialValue2) / scalarValue1) : sumValue1) * intermediateValue4;
                float productValue2 = (comparisonValue * sampledTextureValue.x) + intermediateValue1;
                float productValue3 = (comparisonValue * sampledTextureValue.y) + intermediateValue2;
                float productValue4 = (comparisonValue * sampledTextureValue.z) + intermediateValue3;
                float productValue5 = exponentialValue2 * intermediateValue4;
                imageStore(scatteringBufferOutTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, intermediateValue5)), vec4(productValue2, productValue3, productValue4, productValue5));
                uint sumValue2 = intermediateValue5 + 1u;
                if (sumValue2 == scalarValue)
                {
                    break;
                }
                else
                {
                    productValue = productValue1;
                    intermediateValue1 = productValue2;
                    intermediateValue2 = productValue3;
                    intermediateValue3 = productValue4;
                    intermediateValue4 = productValue5;
                    intermediateValue5 = sumValue2;
                }
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            float exponentialValue4 = exp2(((rdSignedBitsToFloat(scalarValue8) + 0.5) / computeScalarConstants0.packedValues[6u]) * 5.770780086517333984375);
            multiplyAddValue4 = fma(fma(1.0 - exponentialValue4, 0.0186573602259159088134765625, 1.0), computeScalarConstants0.packedValues[0u], ((exponentialValue4 - 1.0) * 0.0186573602259159088134765625) * computeScalarConstants0.packedValues[1u]);
            float sumValue3 = multiplyAddValue4 - scalarValue7;
            vec4 sampledTextureValue1 = texelFetch(materialTexture0, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, scalarValue8)), int(0u));
            float scalarValue9 = sampledTextureValue1.w;
            float exponentialValue5 = exp2((sumValue3 * (-scalarValue9)) * 1.44269502162933349609375);
            float comparisonValue1 = scalarValue6 * ((abs(scalarValue9) > 9.9999999747524270787835121154785e-07) ? ((1.0 - exponentialValue5) / scalarValue9) : sumValue3);
            multiplyAddValue3 = fma(comparisonValue1, sampledTextureValue1.x, scalarValue5);
            multiplyAddValue2 = fma(comparisonValue1, sampledTextureValue1.y, scalarValue4);
            multiplyAddValue1 = fma(comparisonValue1, sampledTextureValue1.z, scalarValue3);
            productValue = scalarValue6 * exponentialValue5;
            imageStore(intermediateValue1, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, scalarValue8)), vec4(multiplyAddValue3, multiplyAddValue2, multiplyAddValue1, productValue));
            sumValue = scalarValue8 + 1u;
            scalarValue3 = multiplyAddValue1;
            scalarValue4 = multiplyAddValue2;
            scalarValue5 = multiplyAddValue3;
            scalarValue6 = productValue;
            scalarValue7 = multiplyAddValue4;
            scalarValue8 = sumValue;
            continue;
#endif
        }
    }
}
