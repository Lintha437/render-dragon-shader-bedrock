#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / DrawLights / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 30
#endif

#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
#extension GL_EXT_shader_16bit_storage : require
#if defined(GL_AMD_gpu_shader_half_float)
#extension GL_AMD_gpu_shader_half_float : require
#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
#else
#error No extension available for FP16.
#endif
#extension GL_EXT_scalar_block_layout : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uint scalarValue = 0u;
    f16vec3 productValue;
    uint productValue1;
    for (;;)
    {
        uint bitwiseValue = scalarValue + (gl_WorkGroupID.z << 6u);
        productValue = uint16BitsToFloat16(inputLightsBuffer.packedValues[bitwiseValue * 2u]);
        productValue1 = inputLightsBuffer_2.packedValues[(bitwiseValue * 3u) + 2u];
        if (productValue1 == 0u)
        {
            break;
        }
        else
        {
            float scalarValue1 = float(productValue.x);
            float scalarValue2 = float(productValue.y);
            float scalarValue3 = float(productValue.z);
            float multiplyAddValue = fma(scalarValue3, ViewCB.packedValues[6u].w, fma(scalarValue2, ViewCB.packedValues[5u].w, ViewCB.packedValues[4u].w * scalarValue1)) + ViewCB.packedValues[7u].w;
            if ((multiplyAddValue > 0.0) && (((fma(scalarValue3, ViewCB.packedValues[6u].z, fma(scalarValue2, ViewCB.packedValues[5u].z, ViewCB.packedValues[4u].z * scalarValue1)) + ViewCB.packedValues[7u].z) / multiplyAddValue) > 0.0))
            {
                float multiplyAddValue1 = (((((fma(scalarValue3, ViewCB.packedValues[6u].x, fma(scalarValue2, ViewCB.packedValues[5u].x, ViewCB.packedValues[4u].x * scalarValue1)) + ViewCB.packedValues[7u].x) / multiplyAddValue) * 0.5) + 0.5) * ViewCB.packedValues[78u].x) - float(int(gl_GlobalInvocationID.x));
                float multiplyAddValue2 = (ViewCB.packedValues[78u].y * (0.5 - (((fma(scalarValue3, ViewCB.packedValues[6u].y, fma(scalarValue2, ViewCB.packedValues[5u].y, ViewCB.packedValues[4u].y * scalarValue1)) + ViewCB.packedValues[7u].y) / multiplyAddValue) * 0.5))) - float(int(gl_GlobalInvocationID.y));
                if (!(!(sqrt((multiplyAddValue1 * multiplyAddValue1) + (multiplyAddValue2 * multiplyAddValue2)) <= 10.0)))
                {
                    float bitwiseValue1 = float(productValue1 & 255u);
                    float productValue2 = bitwiseValue1 * 0.0001537870266474783420562744140625;
                    imageStore(outputBufferFinal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4((bitwiseValue1 * 0.0003087849472649395465850830078125) * float((productValue1 >> 24u) & 127u), productValue2 * float((productValue1 >> 16u) & 255u), productValue2 * float((productValue1 >> 8u) & 255u), 1.0));
                }
            }
            uint sumValue = scalarValue + 1u;
            if (int(sumValue) < int(64u))
            {
                scalarValue = sumValue;
                continue;
            }
            else
            {
                break;
            }
        }
    }
}
