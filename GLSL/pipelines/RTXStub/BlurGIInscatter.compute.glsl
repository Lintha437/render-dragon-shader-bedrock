#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / BlurGIInscatter / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 12
#endif

#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
    uint scalarValue = reinterpretedBits.x;
    uint reinterpretedBits1 = 1u - floatBitsToUint(RootConstants.packedValues[0u]).x;
    uvec4 reinterpretedBits2 = floatBitsToUint(RootConstants.packedValues[0u]);
    uint scalarValue1 = reinterpretedBits2.x;
    uint sumValue = 1u - scalarValue1;
    vec4 loadedBufferValue = imageLoad(volumetricGIInscatterRW[reinterpretedBits1], ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)));
    float scalarValue2 = loadedBufferValue.w;
    float multiplyAddValue = spvNClamp(fma(scalarValue2, 0.3333333432674407958984375, -0.3333333432674407958984375), 0.0, 1.0) + 0.001000000047497451305389404296875;
    float productValue = multiplyAddValue * loadedBufferValue.x;
    float productValue1 = multiplyAddValue * loadedBufferValue.y;
    float productValue2 = multiplyAddValue * loadedBufferValue.z;
    float productValue3 = multiplyAddValue * scalarValue2;
    uint multiplyAddValue1 = uint(int(spvNClamp(fma(productValue3, -0.008333333767950534820556640625, 0.833333313465118408203125), 0.0, 1.0) * 5.0));
    float intermediateValue3;
    float intermediateValue5;
    float intermediateValue7;
    float intermediateValue9;
    float intermediateValue11;
    if (int(multiplyAddValue1 + 2u) > int(1u))
    {
        float intermediateValue4;
        float intermediateValue6;
        float intermediateValue8;
        float intermediateValue10;
        float intermediateValue12;
        float scalarValue3 = productValue;
        float scalarValue4 = productValue1;
        float scalarValue5 = productValue2;
        float scalarValue6 = productValue3;
        float scalarValue7 = multiplyAddValue;
        uint scalarValue8 = 1u;
        uint productValue4;
        uint productValue5;
        uint intermediateValue19;
        uint intermediateValue20;
        bool bitwiseValue;
        for (;;)
        {
            productValue4 = (scalarValue1 * scalarValue8) + gl_GlobalInvocationID.x;
            productValue5 = (sumValue * scalarValue8) + gl_GlobalInvocationID.y;
            intermediateValue19 = uint(ViewCB.packedValues[56u].x);
            intermediateValue20 = uint(ViewCB.packedValues[56u].y);
            bitwiseValue = (productValue4 < intermediateValue19) && (productValue5 < intermediateValue20);
            float productValue6;
            float productValue7;
            float productValue8;
            float productValue9;
            float sumValue1;
            if (bitwiseValue)
            {
                vec4 loadedBufferValue1 = imageLoad(volumetricGIInscatterRW[reinterpretedBits1], ivec3(uvec3(productValue4, productValue5, gl_GlobalInvocationID.z)));
                float scalarValue9 = loadedBufferValue1.w;
                float multiplyAddValue2 = spvNClamp(fma(scalarValue9, 0.3333333432674407958984375, -0.3333333432674407958984375), 0.0, 1.0) + 0.001000000047497451305389404296875;
                productValue6 = (multiplyAddValue2 * loadedBufferValue1.x) + scalarValue3;
                productValue7 = (multiplyAddValue2 * loadedBufferValue1.y) + scalarValue4;
                productValue8 = (multiplyAddValue2 * loadedBufferValue1.z) + scalarValue5;
                productValue9 = (multiplyAddValue2 * scalarValue9) + scalarValue6;
                sumValue1 = multiplyAddValue2 + scalarValue7;
            }
            else
            {
                productValue6 = scalarValue3;
                productValue7 = scalarValue4;
                productValue8 = scalarValue5;
                productValue9 = scalarValue6;
                sumValue1 = scalarValue7;
            }
            uint scalarValue10 = -scalarValue8;
            uint productValue10 = (scalarValue1 * scalarValue10) + gl_GlobalInvocationID.x;
            uint productValue11 = (sumValue * scalarValue10) + gl_GlobalInvocationID.y;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            float branchMergedValue3;
            float branchMergedValue4;
            if ((productValue10 < intermediateValue19) && (productValue11 < intermediateValue20))
            {
                vec4 loadedBufferValue2 = imageLoad(volumetricGIInscatterRW[reinterpretedBits1], ivec3(uvec3(productValue10, productValue11, gl_GlobalInvocationID.z)));
                float scalarValue11 = loadedBufferValue2.w;
                float multiplyAddValue3 = spvNClamp(fma(scalarValue11, 0.3333333432674407958984375, -0.3333333432674407958984375), 0.0, 1.0) + 0.001000000047497451305389404296875;
                branchMergedValue = (multiplyAddValue3 * loadedBufferValue2.x) + productValue6;
                branchMergedValue1 = (multiplyAddValue3 * loadedBufferValue2.y) + productValue7;
                branchMergedValue2 = (multiplyAddValue3 * loadedBufferValue2.z) + productValue8;
                branchMergedValue3 = (multiplyAddValue3 * scalarValue11) + productValue9;
                branchMergedValue4 = multiplyAddValue3 + sumValue1;
            }
            else
            {
                branchMergedValue = productValue6;
                branchMergedValue1 = productValue7;
                branchMergedValue2 = productValue8;
                branchMergedValue3 = productValue9;
                branchMergedValue4 = sumValue1;
            }
            intermediateValue4 = branchMergedValue;
            intermediateValue6 = branchMergedValue1;
            intermediateValue8 = branchMergedValue2;
            intermediateValue10 = branchMergedValue3;
            intermediateValue12 = branchMergedValue4;
            if (int(scalarValue8) < int(multiplyAddValue1 + 1u))
            {
                scalarValue3 = intermediateValue4;
                scalarValue4 = intermediateValue6;
                scalarValue5 = intermediateValue8;
                scalarValue6 = intermediateValue10;
                scalarValue7 = intermediateValue12;
                scalarValue8++;
                continue;
            }
            else
            {
                break;
            }
        }
        intermediateValue3 = intermediateValue4;
        intermediateValue5 = intermediateValue6;
        intermediateValue7 = intermediateValue8;
        intermediateValue9 = intermediateValue10;
        intermediateValue11 = intermediateValue12;
    }
    else
    {
        intermediateValue3 = productValue;
        intermediateValue5 = productValue1;
        intermediateValue7 = productValue2;
        intermediateValue9 = productValue3;
        intermediateValue11 = multiplyAddValue;
    }
    float quotientValue;
    float quotientValue1;
    float quotientValue2;
    float quotientValue3;
    if (intermediateValue11 > 0.0)
    {
        quotientValue = intermediateValue3 / intermediateValue11;
        quotientValue1 = intermediateValue5 / intermediateValue11;
        quotientValue2 = intermediateValue7 / intermediateValue11;
        quotientValue3 = intermediateValue9 / intermediateValue11;
    }
    else
    {
        quotientValue = 0.0;
        quotientValue1 = 0.0;
        quotientValue2 = 0.0;
        quotientValue3 = 0.0;
    }
    imageStore(volumetricGIInscatterRW[scalarValue], ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(quotientValue, quotientValue1, quotientValue2, quotientValue3));
}
