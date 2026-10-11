#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / BlurGradients / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 14
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
    uint scalarValue = reinterpretedBits.x;
    uint bitwiseValue = (scalarValue >> 24u) & 1u;
    uint scalarValue1 = uint(int(ViewCB.packedValues[78u].x));
    uint reinterpretedBits1 = (floatBitsToUint(ViewCB.packedValues[91u]).y != 2u) ? uint(int(scalarValue1) / int(2u)) : scalarValue1;
    bool comparisonValue = bitwiseValue != 0u;
    uint comparisonValue1 = comparisonValue ? gl_GlobalInvocationID.y : gl_GlobalInvocationID.x;
    uint comparisonValue2 = comparisonValue ? gl_GlobalInvocationID.x : gl_GlobalInvocationID.y;
    uint bitwiseValue1 = -(bitwiseValue ^ 1u);
    uint scalarValue2 = -bitwiseValue;
    uint bitwiseValue2 = comparisonValue1 - (bitwiseValue1 & 5u);
    uint bitwiseValue3 = comparisonValue2 - (scalarValue2 & 5u);
    uint bitwiseValue4 = scalarValue & 255u;
    float intermediateValue6;
    float intermediateValue7;
    uint comparisonValue3;
    if (int(bitwiseValue2 | bitwiseValue3) > int(4294967295u))
    {
        vec4 loadedBufferValue = imageLoad(outputAdaptiveDenoiserGradients[bitwiseValue4], ivec2(uvec2(bitwiseValue2, bitwiseValue3)));
        uvec4 sampledTextureValue = uvec4(texelFetch(inputAdaptiveDenoiserPlaneIdentifier, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u)));
        uint scalarValue3 = sampledTextureValue.x;
        intermediateValue6 = loadedBufferValue.x;
        intermediateValue7 = loadedBufferValue.y;
        comparisonValue3 = ((int(comparisonValue ? bitwiseValue3 : bitwiseValue2) >= int(reinterpretedBits1)) && (scalarValue3 != 0u)) ? (scalarValue3 ^ 2147483648u) : scalarValue3;
    }
    else
    {
        intermediateValue6 = 0.0;
        intermediateValue7 = 0.0;
        comparisonValue3 = 0u;
    }
    intermediateValue1[0u + (gl_LocalInvocationID.x * 2u)] = intermediateValue6;
    intermediateValue1[1u + (gl_LocalInvocationID.x * 2u)] = intermediateValue7;
    intermediateValue[gl_LocalInvocationID.x] = comparisonValue3;
    if (int(gl_LocalInvocationID.x) < int(10u))
    {
        uint bitwiseValue5 = comparisonValue1 + (bitwiseValue1 & 123u);
        uint bitwiseValue6 = comparisonValue2 + (scalarValue2 & 123u);
        float intermediateValue9;
        float intermediateValue10;
        uint comparisonValue4;
        if ((int(bitwiseValue5) < int(uint(int(scalarValue1) / int(4u)))) && (int(bitwiseValue6) < int(uint(int(uint(int(ViewCB.packedValues[78u].y))) / int(4u)))))
        {
            vec4 loadedBufferValue1 = imageLoad(outputAdaptiveDenoiserGradients[bitwiseValue4], ivec2(uvec2(bitwiseValue5, bitwiseValue6)));
            uvec4 sampledTextureValue1 = uvec4(texelFetch(inputAdaptiveDenoiserPlaneIdentifier, ivec2(uvec2(bitwiseValue5, bitwiseValue6)), int(0u)));
            uint scalarValue4 = sampledTextureValue1.x;
            intermediateValue9 = loadedBufferValue1.x;
            intermediateValue10 = loadedBufferValue1.y;
            comparisonValue4 = ((int(comparisonValue ? bitwiseValue6 : bitwiseValue5) >= int(reinterpretedBits1)) && (scalarValue4 != 0u)) ? (scalarValue4 ^ 2147483648u) : scalarValue4;
        }
        else
        {
            intermediateValue9 = 0.0;
            intermediateValue10 = 0.0;
            comparisonValue4 = 0u;
        }
        uint sumValue = gl_LocalInvocationID.x + 128u;
        intermediateValue1[0u + (sumValue * 2u)] = intermediateValue9;
        intermediateValue1[1u + (sumValue * 2u)] = intermediateValue10;
        intermediateValue[sumValue] = comparisonValue4;
    }
    barrier();
    uint reinterpretedBits2 = (floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u;
    uint sumValue1 = gl_LocalInvocationID.x + 5u;
    if (intermediateValue[sumValue1] == 0u)
    {
        imageStore(outputAdaptiveDenoiserGradients[reinterpretedBits2], ivec2(uvec2(comparisonValue1, comparisonValue2)), vec4(0.0));
    }
    else
    {
        float intermediateValue11;
        float productValue;
        float productValue2;
        uint intermediateValue12;
        intermediateValue11 = 1.0;
        productValue = intermediateValue1[0u + (sumValue1 * 2u)];
        productValue2 = intermediateValue1[1u + (sumValue1 * 2u)];
        intermediateValue12 = 0u;
        float sumValue2;
        float productValue1;
        float productValue3;
        for (;;)
        {
            uint sumValue3 = intermediateValue12 + 1u;
            uint sumValue4 = sumValue3 + sumValue1;
            uint sumValue5 = intermediateValue[sumValue4] - intermediateValue[sumValue1];
            float multiplyAddValue = spvNClamp(fma(float(int(intermediateValue12)), -0.3333333432674407958984375, 1.66666662693023681640625), 0.0, 1.0);
            float productValue4 = float(int(uint(abs(int(sumValue5)))) < int(100u)) * multiplyAddValue;
            uint sumValue6 = (sumValue1 - intermediateValue12) + 4294967295u;
            uint sumValue7 = intermediateValue[sumValue6] - intermediateValue[sumValue1];
            float productValue5 = float(int(uint(abs(int(sumValue7)))) < int(100u)) * multiplyAddValue;
            productValue1 = ((intermediateValue1[0u + (sumValue4 * 2u)] * productValue4) + productValue) + (productValue5 * intermediateValue1[0u + (sumValue6 * 2u)]);
            productValue3 = ((intermediateValue1[1u + (sumValue4 * 2u)] * productValue4) + productValue2) + (productValue5 * intermediateValue1[1u + (sumValue6 * 2u)]);
            sumValue2 = (productValue4 + intermediateValue11) + productValue5;
            if (sumValue3 == 5u)
            {
                break;
            }
            else
            {
                intermediateValue11 = sumValue2;
                productValue = productValue1;
                productValue2 = productValue3;
                intermediateValue12 = sumValue3;
            }
        }
        float quotientValue = productValue1 / sumValue2;
        imageStore(outputAdaptiveDenoiserGradients[reinterpretedBits2], ivec2(uvec2(comparisonValue1, comparisonValue2)), vec4(quotientValue, productValue3 / sumValue2, quotientValue, quotientValue));
    }
}
