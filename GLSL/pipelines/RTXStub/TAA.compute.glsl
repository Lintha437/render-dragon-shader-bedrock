#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / TAA / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 21
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    float sumValue = float(int(gl_GlobalInvocationID.x)) + 0.5;
    float sumValue1 = float(int(gl_GlobalInvocationID.y)) + 0.5;
    float productValue = ((ViewCB.packedValues[87u].y * sumValue) - ViewCB.packedValues[81u].z) + (-0.5);
    float productValue1 = ((sumValue1 * ViewCB.packedValues[87u].y) - ViewCB.packedValues[81u].w) + (-0.5);
    uint scalarValue = uint(int(roundEven(productValue)));
    uint scalarValue1 = uint(int(roundEven(productValue1)));
    vec4 sampledTextureValue = texelFetch(inputFinalColour, ivec2(uvec2(scalarValue, scalarValue1)), int(0u));
    float scalarValue2 = sampledTextureValue.x;
    float scalarValue3 = sampledTextureValue.y;
    float scalarValue4 = sampledTextureValue.z;
    vec4 sampledTextureValue1 = texelFetch(inputBufferMotionVectors, ivec2(uvec2(scalarValue, scalarValue1)), int(0u));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float productValue2 = scalarValue2 * scalarValue2;
    float productValue3 = scalarValue3 * scalarValue3;
    float productValue4 = scalarValue4 * scalarValue4;
    float intermediateValue8;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue14;
    float intermediateValue16;
    float intermediateValue18;
    float intermediateValue20;
    float intermediateValue22;
    float intermediateValue24;
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    float intermediateValue28;
    float intermediateValue29;
    float intermediateValue30;
    float intermediateValue31;
    uint intermediateValue32;
    float scalarValue7 = scalarValue5;
    float scalarValue8 = scalarValue6;
    float scalarValue9 = scalarValue2;
    float scalarValue10 = scalarValue3;
    float scalarValue11 = scalarValue4;
    float scalarValue12 = productValue2;
    float scalarValue13 = productValue3;
    float scalarValue14 = productValue4;
    uint scalarValue15 = 4294967295u;
    for (;;)
    {
        intermediateValue24 = scalarValue7;
        intermediateValue25 = scalarValue8;
        intermediateValue26 = scalarValue9;
        intermediateValue27 = scalarValue10;
        intermediateValue28 = scalarValue11;
        intermediateValue29 = scalarValue12;
        intermediateValue30 = scalarValue13;
        intermediateValue31 = scalarValue14;
        intermediateValue32 = 4294967295u;
        bool comparisonValue;
        for (;;)
        {
            comparisonValue = (intermediateValue32 | scalarValue15) == 0u;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            float branchMergedValue3;
            float branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            if (comparisonValue)
            {
                branchMergedValue = intermediateValue24;
                branchMergedValue1 = intermediateValue25;
                branchMergedValue2 = intermediateValue26;
                branchMergedValue3 = intermediateValue27;
                branchMergedValue4 = intermediateValue28;
                branchMergedValue5 = intermediateValue29;
                branchMergedValue6 = intermediateValue30;
                branchMergedValue7 = intermediateValue31;
            }
            else
            {
                uint sumValue2 = scalarValue15 + scalarValue;
                uint sumValue3 = intermediateValue32 + scalarValue1;
                vec4 sampledTextureValue2 = texelFetch(inputFinalColour, ivec2(uvec2(sumValue2, sumValue3)), int(0u));
                float scalarValue16 = sampledTextureValue2.x;
                float scalarValue17 = sampledTextureValue2.y;
                float scalarValue18 = sampledTextureValue2.z;
                vec4 sampledTextureValue3 = texelFetch(inputBufferMotionVectors, ivec2(uvec2(sumValue2, sumValue3)), int(0u));
                float scalarValue19 = sampledTextureValue3.x;
                float sumValue4 = scalarValue16 + intermediateValue26;
                float sumValue5 = scalarValue17 + intermediateValue27;
                float sumValue6 = scalarValue18 + intermediateValue28;
                float productValue5 = (scalarValue16 * scalarValue16) + intermediateValue29;
                float productValue6 = (scalarValue17 * scalarValue17) + intermediateValue30;
                float productValue7 = (scalarValue18 * scalarValue18) + intermediateValue31;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                float branchMergedValue12;
                float branchMergedValue13;
                float branchMergedValue14;
                float branchMergedValue15;
                if (dot(vec2(scalarValue19, sampledTextureValue3.y), vec2(scalarValue19, sampledTextureValue3.y)) > dot(vec2(intermediateValue24, intermediateValue25), vec2(intermediateValue24, intermediateValue25)))
                {
                    branchMergedValue8 = scalarValue19;
                    branchMergedValue9 = sampledTextureValue3.y;
                    branchMergedValue10 = sumValue4;
                    branchMergedValue11 = sumValue5;
                    branchMergedValue12 = sumValue6;
                    branchMergedValue13 = productValue5;
                    branchMergedValue14 = productValue6;
                    branchMergedValue15 = productValue7;
                }
                else
                {
                    branchMergedValue8 = intermediateValue24;
                    branchMergedValue9 = intermediateValue25;
                    branchMergedValue10 = sumValue4;
                    branchMergedValue11 = sumValue5;
                    branchMergedValue12 = sumValue6;
                    branchMergedValue13 = productValue5;
                    branchMergedValue14 = productValue6;
                    branchMergedValue15 = productValue7;
                }
                branchMergedValue = branchMergedValue8;
                branchMergedValue1 = branchMergedValue9;
                branchMergedValue2 = branchMergedValue10;
                branchMergedValue3 = branchMergedValue11;
                branchMergedValue4 = branchMergedValue12;
                branchMergedValue5 = branchMergedValue13;
                branchMergedValue6 = branchMergedValue14;
                branchMergedValue7 = branchMergedValue15;
            }
            intermediateValue8 = branchMergedValue;
            intermediateValue10 = branchMergedValue1;
            intermediateValue12 = branchMergedValue2;
            intermediateValue14 = branchMergedValue3;
            intermediateValue16 = branchMergedValue4;
            intermediateValue18 = branchMergedValue5;
            intermediateValue20 = branchMergedValue6;
            intermediateValue22 = branchMergedValue7;
            uint sumValue7 = intermediateValue32 + 1u;
            if (sumValue7 == 2u)
            {
                break;
            }
            else
            {
                intermediateValue24 = intermediateValue8;
                intermediateValue25 = intermediateValue10;
                intermediateValue26 = intermediateValue12;
                intermediateValue27 = intermediateValue14;
                intermediateValue28 = intermediateValue16;
                intermediateValue29 = intermediateValue18;
                intermediateValue30 = intermediateValue20;
                intermediateValue31 = intermediateValue22;
                intermediateValue32 = sumValue7;
                continue;
            }
        }
        uint sumValue8 = scalarValue15 + 1u;
        if (sumValue8 == 2u)
        {
            break;
        }
        else
        {
            scalarValue7 = intermediateValue8;
            scalarValue8 = intermediateValue10;
            scalarValue9 = intermediateValue12;
            scalarValue10 = intermediateValue14;
            scalarValue11 = intermediateValue16;
            scalarValue12 = intermediateValue18;
            scalarValue13 = intermediateValue20;
            scalarValue14 = intermediateValue22;
            scalarValue15 = sumValue8;
            continue;
        }
    }
    float productValue8 = ViewCB.packedValues[78u].x * intermediateValue8;
    float productValue9 = ViewCB.packedValues[78u].y * intermediateValue10;
    float productValue10 = intermediateValue12 * 0.111111111938953399658203125;
    float productValue11 = intermediateValue14 * 0.111111111938953399658203125;
    float productValue12 = intermediateValue16 * 0.111111111938953399658203125;
    float dotProductValue = spvNClamp(sqrt(dot(vec2(productValue8, productValue9), vec2(productValue8, productValue9))), 0.0, 1.0);
    float productValue13 = (dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0));
    float productValue14 = 4.0 - (productValue13 * 3.0);
    float nonlinearValue = productValue14 * sqrt(spvNMax(0.0, (intermediateValue18 * 0.111111111938953399658203125) - (productValue10 * productValue10)));
    float nonlinearValue1 = productValue14 * sqrt(spvNMax(0.0, (intermediateValue20 * 0.111111111938953399658203125) - (productValue11 * productValue11)));
    float nonlinearValue2 = productValue14 * sqrt(spvNMax(0.0, (intermediateValue22 * 0.111111111938953399658203125) - (productValue12 * productValue12)));
    float productValue15 = spvNMin(spvNMax((productValue8 * ViewCB.packedValues[87u].z) + sumValue, 0.0), ViewCB.packedValues[79u].x + (-1.0));
    float productValue16 = spvNMin(spvNMax((productValue9 * ViewCB.packedValues[87u].z) + sumValue1, 0.0), ViewCB.packedValues[79u].y + (-1.0));
    float sumValue9 = floor(productValue15 + (-0.5));
    float sumValue10 = floor(productValue16 + (-0.5));
    float sumValue11 = sumValue9 + 0.5;
    float sumValue12 = sumValue10 + 0.5;
    float sumValue13 = spvNClamp(productValue15 - sumValue11, 0.0, 1.0);
    float sumValue14 = spvNClamp(productValue16 - sumValue12, 0.0, 1.0);
    float productValue17 = sumValue13 * sumValue13;
    float productValue18 = sumValue14 * sumValue14;
    float productValue19 = productValue17 * sumValue13;
    float productValue20 = productValue18 * sumValue14;
    float productValue21 = productValue17 - ((productValue19 + sumValue13) * 0.5);
    float productValue22 = productValue18 - ((productValue20 + sumValue14) * 0.5);
    float productValue23 = (sumValue13 * 0.5) * (productValue17 - sumValue13);
    float productValue24 = (sumValue14 * 0.5) * (productValue18 - sumValue14);
    float sumValue15 = (1.0 - productValue23) - productValue21;
    float sumValue16 = (1.0 - productValue24) - productValue22;
    float productValue25 = (sumValue9 + (-0.5)) * ViewCB.packedValues[79u].z;
    float productValue26 = (sumValue10 + (-0.5)) * ViewCB.packedValues[79u].w;
    float quotientValue = ((((((productValue17 * 2.5) + (-1.0)) - (productValue19 * 1.5)) + sumValue15) / sumValue15) + sumValue11) * ViewCB.packedValues[79u].z;
    float quotientValue1 = ((((((productValue18 * 2.5) + (-1.0)) - (productValue20 * 1.5)) + sumValue16) / sumValue16) + sumValue12) * ViewCB.packedValues[79u].w;
    float productValue27 = (sumValue9 + 2.5) * ViewCB.packedValues[79u].z;
    float productValue28 = (sumValue10 + 2.5) * ViewCB.packedValues[79u].w;
    vec4 sampledTextureValue4 = textureLod(sampler2D(inputTAAHistory, linearSampler), vec2(productValue25, productValue26), 0.0);
    float productValue29 = productValue22 * productValue21;
    vec4 sampledTextureValue5 = textureLod(sampler2D(inputTAAHistory, linearSampler), vec2(productValue25, quotientValue1), 0.0);
    float productValue30 = sumValue16 * productValue21;
    vec4 sampledTextureValue6 = textureLod(sampler2D(inputTAAHistory, linearSampler), vec2(productValue25, productValue28), 0.0);
    float productValue31 = productValue21 * productValue24;
    vec4 sampledTextureValue7 = textureLod(sampler2D(inputTAAHistory, linearSampler), vec2(quotientValue, productValue26), 0.0);
    float productValue32 = sumValue15 * productValue22;
    vec4 sampledTextureValue8 = textureLod(sampler2D(inputTAAHistory, linearSampler), vec2(quotientValue, quotientValue1), 0.0);
    float productValue33 = sumValue16 * sumValue15;
    vec4 sampledTextureValue9 = textureLod(sampler2D(inputTAAHistory, linearSampler), vec2(quotientValue, productValue28), 0.0);
    float productValue34 = sumValue15 * productValue24;
    vec4 sampledTextureValue10 = textureLod(sampler2D(inputTAAHistory, linearSampler), vec2(productValue27, productValue26), 0.0);
    float productValue35 = productValue22 * productValue23;
    vec4 sampledTextureValue11 = textureLod(sampler2D(inputTAAHistory, linearSampler), vec2(productValue27, quotientValue1), 0.0);
    float productValue36 = sumValue16 * productValue23;
    vec4 sampledTextureValue12 = textureLod(sampler2D(inputTAAHistory, linearSampler), vec2(productValue27, productValue28), 0.0);
    float productValue37 = productValue24 * productValue23;
    float productValue38 = spvNMin(nonlinearValue + productValue10, spvNMax(productValue10 - nonlinearValue, spvNMax(0.0, ((((((((sampledTextureValue5.x * productValue30) + (sampledTextureValue4.x * productValue29)) + (sampledTextureValue6.x * productValue31)) + (sampledTextureValue7.x * productValue32)) + (sampledTextureValue8.x * productValue33)) + (sampledTextureValue9.x * productValue34)) + (sampledTextureValue10.x * productValue35)) + (sampledTextureValue11.x * productValue36)) + (sampledTextureValue12.x * productValue37))));
    float productValue39 = spvNMin(nonlinearValue1 + productValue11, spvNMax(productValue11 - nonlinearValue1, spvNMax(0.0, ((((((((sampledTextureValue5.y * productValue30) + (sampledTextureValue4.y * productValue29)) + (sampledTextureValue6.y * productValue31)) + (sampledTextureValue7.y * productValue32)) + (sampledTextureValue8.y * productValue33)) + (sampledTextureValue9.y * productValue34)) + (sampledTextureValue10.y * productValue35)) + (sampledTextureValue11.y * productValue36)) + (sampledTextureValue12.y * productValue37))));
    float productValue40 = spvNMin(nonlinearValue2 + productValue12, spvNMax(productValue12 - nonlinearValue2, spvNMax(0.0, ((((((((sampledTextureValue5.z * productValue30) + (sampledTextureValue4.z * productValue29)) + (sampledTextureValue6.z * productValue31)) + (sampledTextureValue7.z * productValue32)) + (sampledTextureValue8.z * productValue33)) + (sampledTextureValue9.z * productValue34)) + (sampledTextureValue10.z * productValue35)) + (sampledTextureValue11.z * productValue36)) + (sampledTextureValue12.z * productValue37))));
    float sumValue17;
    float sumValue18;
    if ((sampledTextureValue.w != 0.0) && (floatBitsToUint(ViewCB.packedValues[91u]).y == 0u))
    {
        sumValue17 = (productValue + ViewCB.packedValues[81u].z) - ViewCB.packedValues[82u].x;
        sumValue18 = (productValue1 + ViewCB.packedValues[81u].w) - ViewCB.packedValues[82u].y;
    }
    else
    {
        sumValue17 = productValue;
        sumValue18 = productValue1;
    }
    float sumValue19 = sumValue17 - float(int(scalarValue));
    float sumValue20 = sumValue18 - float(int(scalarValue1));
    float dotProductValue1 = spvNMax(productValue13, spvNMin(spvNMax(1.0 - (dot(vec2(sumValue19, sumValue20), vec2(sumValue19, sumValue20)) * ViewCB.packedValues[87u].z), 0.0500000007450580596923828125), 1.0)) * 0.100000001490116119384765625;
    imageStore(outputBufferTAAHistory, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4((dotProductValue1 * (scalarValue2 - productValue38)) + productValue38, (dotProductValue1 * (scalarValue3 - productValue39)) + productValue39, (dotProductValue1 * (scalarValue4 - productValue40)) + productValue40, 0.0));
}
