#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / ToneCurve / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 46
#endif

#if defined(GL_EXT_control_flow_attributes)
#extension GL_EXT_control_flow_attributes : require
#define SPIRV_CROSS_FLATTEN [[flatten]]
#define SPIRV_CROSS_BRANCH [[dont_flatten]]
#define SPIRV_CROSS_UNROLL [[unroll]]
#define SPIRV_CROSS_LOOP [[dont_unroll]]
#else
#define SPIRV_CROSS_FLATTEN
#define SPIRV_CROSS_BRANCH
#define SPIRV_CROSS_UNROLL
#define SPIRV_CROSS_LOOP
#endif
#extension GL_EXT_spirv_intrinsics : require
#extension GL_KHR_shader_subgroup_basic : require
#extension GL_KHR_shader_subgroup_arithmetic : require
#define RD_USE_DIVIDE_UNSIGNED_UINT_11 1

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

#include "../../include/Math.glsli"
void main()
{
    if (!(gl_LocalInvocationIndex > 255u))
    {
        float productValue = (float(gl_LocalInvocationIndex) * 0.109375) + (-24.0);
        uvec4 loadedBufferValue = imageLoad(outputBufferToneMappingHistogram, ivec2(uvec2(gl_LocalInvocationIndex, 0u)));
        float productValue1 = (float(loadedBufferValue.x) * 0.015625) + 1.0;
        float comparisonValue = (gl_LocalInvocationIndex > 196u) ? 0.0 : productValue1;
        intermediateValue[gl_LocalInvocationIndex] = subgroupAdd(comparisonValue);
        barrier();
        bool conditionValue = gl_SubgroupSize < 129u;
        if (conditionValue)
        {
            uint scalarValue = 128u;
            bool intermediateValue4;
            for (;;)
            {
                intermediateValue4 = gl_LocalInvocationIndex < scalarValue;
                if (intermediateValue4)
                {
                    intermediateValue[gl_LocalInvocationIndex] += intermediateValue[scalarValue + gl_LocalInvocationIndex];
                }
                barrier();
                uint bitwiseValue = scalarValue >> 1u;
                if (bitwiseValue < gl_SubgroupSize)
                {
                    break;
                }
                else
                {
                    scalarValue = bitwiseValue;
                    continue;
                }
            }
        }
        float scalarValue1 = intermediateValue[0u];
        barrier();
        float quotientValue = comparisonValue / scalarValue1;
        float productValue2 = ((-2.4739310741424560546875) - spvNMin((-0.0) - ViewCB.packedValues[94u].w, -2.5563933849334716796875)) * 9.14285755157470703125;
        float comparisonValue1 = (quotientValue > 0.0) ? (1.0 / quotientValue) : 0.0;
        float quotientValue1;
        float intermediateValue7;
        float scalarValue2 = 1.000000016862383526387164645044e-16;
        uint scalarValue3 = 0u;
        float comparisonValue2;
        for (;;)
        {
            comparisonValue2 = (quotientValue < scalarValue2) ? 0.0 : 1.0;
            intermediateValue[gl_LocalInvocationIndex] = subgroupAdd(comparisonValue2);
            barrier();
            if (conditionValue)
            {
                uint scalarValue4 = 128u;
                bool intermediateValue9;
                for (;;)
                {
                    intermediateValue9 = gl_LocalInvocationIndex < scalarValue4;
                    if (intermediateValue9)
                    {
                        intermediateValue[gl_LocalInvocationIndex] += intermediateValue[scalarValue4 + gl_LocalInvocationIndex];
                    }
                    barrier();
                    uint bitwiseValue1 = scalarValue4 >> 1u;
                    if (bitwiseValue1 < gl_SubgroupSize)
                    {
                        break;
                    }
                    else
                    {
                        scalarValue4 = bitwiseValue1;
                        continue;
                    }
                }
            }
            intermediateValue7 = intermediateValue[0u];
            barrier();
            intermediateValue[gl_LocalInvocationIndex] = subgroupAdd(comparisonValue2 * comparisonValue1);
            barrier();
            if (conditionValue)
            {
                uint scalarValue5 = 128u;
                bool intermediateValue12;
                for (;;)
                {
                    intermediateValue12 = gl_LocalInvocationIndex < scalarValue5;
                    if (intermediateValue12)
                    {
                        intermediateValue[gl_LocalInvocationIndex] += intermediateValue[scalarValue5 + gl_LocalInvocationIndex];
                    }
                    barrier();
                    uint bitwiseValue2 = scalarValue5 >> 1u;
                    if (bitwiseValue2 < gl_SubgroupSize)
                    {
                        break;
                    }
                    else
                    {
                        scalarValue5 = bitwiseValue2;
                        continue;
                    }
                }
            }
            float scalarValue6 = intermediateValue[0u];
            barrier();
            quotientValue1 = (intermediateValue7 - productValue2) / scalarValue6;
            uint sumValue = scalarValue3 + 1u;
            if (sumValue == 16u)
            {
                break;
            }
            else
            {
                scalarValue2 = quotientValue1;
                scalarValue3 = sumValue;
                continue;
            }
        }
        float comparisonValue3 = (quotientValue < quotientValue1) ? 0.0 : 1.0;
        intermediateValue[gl_LocalInvocationIndex] = subgroupAdd(comparisonValue3);
        barrier();
        if (conditionValue)
        {
            uint scalarValue7 = 128u;
            bool intermediateValue15;
            for (;;)
            {
                intermediateValue15 = gl_LocalInvocationIndex < scalarValue7;
                if (intermediateValue15)
                {
                    intermediateValue[gl_LocalInvocationIndex] += intermediateValue[scalarValue7 + gl_LocalInvocationIndex];
                }
                barrier();
                uint bitwiseValue3 = scalarValue7 >> 1u;
                if (bitwiseValue3 < gl_SubgroupSize)
                {
                    break;
                }
                else
                {
                    scalarValue7 = bitwiseValue3;
                    continue;
                }
            }
        }
        float scalarValue8 = intermediateValue[0u];
        barrier();
        intermediateValue[gl_LocalInvocationIndex] = subgroupAdd(comparisonValue3 * comparisonValue1);
        barrier();
        if (conditionValue)
        {
            uint scalarValue9 = 128u;
            bool intermediateValue18;
            for (;;)
            {
                intermediateValue18 = gl_LocalInvocationIndex < scalarValue9;
                if (intermediateValue18)
                {
                    intermediateValue[gl_LocalInvocationIndex] += intermediateValue[scalarValue9 + gl_LocalInvocationIndex];
                }
                barrier();
                uint bitwiseValue4 = scalarValue9 >> 1u;
                if (bitwiseValue4 < gl_SubgroupSize)
                {
                    break;
                }
                else
                {
                    scalarValue9 = bitwiseValue4;
                    continue;
                }
            }
        }
        float scalarValue10 = intermediateValue[0u];
        barrier();
        float comparisonValue4 = ((gl_LocalInvocationIndex + 4294967099u) > 58u) ? 0.0 : productValue1;
        intermediateValue[gl_LocalInvocationIndex] = subgroupAdd(comparisonValue4);
        barrier();
        if (conditionValue)
        {
            uint scalarValue11 = 128u;
            bool intermediateValue21;
            for (;;)
            {
                intermediateValue21 = gl_LocalInvocationIndex < scalarValue11;
                if (intermediateValue21)
                {
                    intermediateValue[gl_LocalInvocationIndex] += intermediateValue[scalarValue11 + gl_LocalInvocationIndex];
                }
                barrier();
                uint bitwiseValue5 = scalarValue11 >> 1u;
                if (bitwiseValue5 < gl_SubgroupSize)
                {
                    break;
                }
                else
                {
                    scalarValue11 = bitwiseValue5;
                    continue;
                }
            }
        }
        float scalarValue12 = intermediateValue[0u];
        barrier();
        float quotientValue2 = comparisonValue4 / scalarValue12;
        float comparisonValue5 = (quotientValue2 > 0.0) ? (1.0 / quotientValue2) : 0.0;
        float quotientValue3;
        float intermediateValue24;
        float scalarValue13 = 1.000000016862383526387164645044e-16;
        uint scalarValue14 = 0u;
        float comparisonValue6;
        for (;;)
        {
            comparisonValue6 = (quotientValue2 < scalarValue13) ? 0.0 : 1.0;
            intermediateValue[gl_LocalInvocationIndex] = subgroupAdd(comparisonValue6);
            barrier();
            if (conditionValue)
            {
                uint scalarValue15 = 128u;
                bool intermediateValue26;
                for (;;)
                {
                    intermediateValue26 = gl_LocalInvocationIndex < scalarValue15;
                    if (intermediateValue26)
                    {
                        intermediateValue[gl_LocalInvocationIndex] += intermediateValue[scalarValue15 + gl_LocalInvocationIndex];
                    }
                    barrier();
                    uint bitwiseValue6 = scalarValue15 >> 1u;
                    if (bitwiseValue6 < gl_SubgroupSize)
                    {
                        break;
                    }
                    else
                    {
                        scalarValue15 = bitwiseValue6;
                        continue;
                    }
                }
            }
            intermediateValue24 = intermediateValue[0u];
            barrier();
            intermediateValue[gl_LocalInvocationIndex] = subgroupAdd(comparisonValue6 * comparisonValue5);
            barrier();
            if (conditionValue)
            {
                uint scalarValue16 = 128u;
                bool intermediateValue29;
                for (;;)
                {
                    intermediateValue29 = gl_LocalInvocationIndex < scalarValue16;
                    if (intermediateValue29)
                    {
                        intermediateValue[gl_LocalInvocationIndex] += intermediateValue[scalarValue16 + gl_LocalInvocationIndex];
                    }
                    barrier();
                    uint bitwiseValue7 = scalarValue16 >> 1u;
                    if (bitwiseValue7 < gl_SubgroupSize)
                    {
                        break;
                    }
                    else
                    {
                        scalarValue16 = bitwiseValue7;
                        continue;
                    }
                }
            }
            float scalarValue17 = intermediateValue[0u];
            barrier();
            quotientValue3 = (intermediateValue24 + (-22.6187992095947265625)) / scalarValue17;
            uint sumValue1 = scalarValue14 + 1u;
            if (sumValue1 == 16u)
            {
                break;
            }
            else
            {
                scalarValue13 = quotientValue3;
                scalarValue14 = sumValue1;
                continue;
            }
        }
        float comparisonValue7 = (quotientValue2 < quotientValue3) ? 0.0 : 1.0;
        intermediateValue[gl_LocalInvocationIndex] = subgroupAdd(comparisonValue7);
        barrier();
        if (conditionValue)
        {
            uint scalarValue18 = 128u;
            bool intermediateValue32;
            for (;;)
            {
                intermediateValue32 = gl_LocalInvocationIndex < scalarValue18;
                if (intermediateValue32)
                {
                    intermediateValue[gl_LocalInvocationIndex] += intermediateValue[scalarValue18 + gl_LocalInvocationIndex];
                }
                barrier();
                uint bitwiseValue8 = scalarValue18 >> 1u;
                if (bitwiseValue8 < gl_SubgroupSize)
                {
                    break;
                }
                else
                {
                    scalarValue18 = bitwiseValue8;
                    continue;
                }
            }
        }
        float scalarValue19 = intermediateValue[0u];
        barrier();
        intermediateValue[gl_LocalInvocationIndex] = subgroupAdd(comparisonValue7 * comparisonValue5);
        barrier();
        if (conditionValue)
        {
            uint scalarValue20 = 128u;
            bool intermediateValue36;
            for (;;)
            {
                intermediateValue36 = gl_LocalInvocationIndex < scalarValue20;
                if (intermediateValue36)
                {
                    intermediateValue[gl_LocalInvocationIndex] += intermediateValue[scalarValue20 + gl_LocalInvocationIndex];
                }
                barrier();
                uint bitwiseValue9 = scalarValue20 >> 1u;
                if (bitwiseValue9 < gl_SubgroupSize)
                {
                    break;
                }
                else
                {
                    scalarValue20 = bitwiseValue9;
                    continue;
                }
            }
        }
        float scalarValue21 = intermediateValue[0u];
        barrier();
        float quotientValue4 = ((((22.6187992095947265625 - scalarValue19) * comparisonValue5) / scalarValue21) + 1.0) * comparisonValue7;
        bool conditionValue1 = gl_LocalInvocationIndex < 197u;
        float comparisonValue8;
        if (conditionValue1)
        {
            comparisonValue8 = spvNMax(conditionValue1 ? (((((productValue2 - scalarValue8) * comparisonValue1) / scalarValue10) + 1.0) * comparisonValue3) : quotientValue4, ViewCB.packedValues[95u].x);
        }
        else
        {
            comparisonValue8 = quotientValue4;
        }
        intermediateValue[gl_LocalInvocationIndex] = subgroupExclusiveAdd(comparisonValue8) + comparisonValue8;
        barrier();
        bool conditionValue2 = gl_SubgroupSize < 256u;
        if (conditionValue2)
        {
            uint scalarValue22 = gl_SubgroupSize;
            uint intermediateValue41;
            bool comparisonValue9;
            for (;;)
            {
                intermediateValue41 = rdDivideUnsigned(gl_LocalInvocationIndex, scalarValue22);
                comparisonValue9 = (intermediateValue41 & 1u) == 0u;
                if (!comparisonValue9)
                {
                    intermediateValue[gl_LocalInvocationIndex] += intermediateValue[(intermediateValue41 * scalarValue22) + 4294967295u];
                }
                barrier();
                uint bitwiseValue10 = scalarValue22 << 1u;
                if (bitwiseValue10 < 256u)
                {
                    scalarValue22 = bitwiseValue10;
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        float scalarValue23 = intermediateValue[gl_LocalInvocationIndex];
        barrier();
        float productValue3 = spvNMin((((scalarValue23 - comparisonValue8) - intermediateValue[255u]) * 0.109375) - (spvNMax(0.0, ViewCB.packedValues[94u].y - productValue) * ViewCB.packedValues[94u].x), ViewCB.packedValues[95u].y + productValue);
        intermediateValue[gl_LocalInvocationIndex] = subgroupExclusiveAdd(productValue3) + productValue3;
        barrier();
        if (conditionValue2)
        {
            uint scalarValue24 = gl_SubgroupSize;
            uint intermediateValue43;
            bool comparisonValue10;
            for (;;)
            {
                intermediateValue43 = rdDivideUnsigned(gl_LocalInvocationIndex, scalarValue24);
                comparisonValue10 = (intermediateValue43 & 1u) == 0u;
                if (!comparisonValue10)
                {
                    intermediateValue[gl_LocalInvocationIndex] += intermediateValue[(intermediateValue43 * scalarValue24) + 4294967295u];
                }
                barrier();
                uint bitwiseValue11 = scalarValue24 << 1u;
                if (bitwiseValue11 < 256u)
                {
                    scalarValue24 = bitwiseValue11;
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        barrier();
        uint sumValue2 = min((gl_LocalInvocationIndex + 12u), 255u);
        uint sumValue3 = uint(max(int(0u), int(gl_LocalInvocationIndex + 4294967283u)));
        float quotientValue5 = ViewCB.packedValues[94u].z + ((intermediateValue[sumValue2] - intermediateValue[sumValue3]) / float(sumValue2 - sumValue3));
        float loadedBufferValue1;
        if (floatBitsToUint(ViewCB.packedValues[95u]).z == 0u)
        {
            loadedBufferValue1 = ((imageLoad(outputBufferToneCurve, ivec2(uvec2(gl_LocalInvocationIndex, 0u))).x - quotientValue5) * 0.932393848896026611328125) + quotientValue5;
        }
        else
        {
            loadedBufferValue1 = quotientValue5;
        }
        imageStore(outputBufferToneCurve, ivec2(uvec2(gl_LocalInvocationIndex, 0u)), vec4(loadedBufferValue1));
        imageStore(outputBufferToneMappingHistogram, ivec2(uvec2(gl_LocalInvocationIndex, 0u)), uvec4(0u));
    }
}
