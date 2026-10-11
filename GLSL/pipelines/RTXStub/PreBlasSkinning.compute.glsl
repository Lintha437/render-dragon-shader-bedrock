#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / PreBlasSkinning / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 15
#endif

#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uint bitwiseValue = (gl_WorkGroupID.x << 6u) + gl_LocalInvocationIndex;
    uvec4 reinterpretedBits = floatBitsToUint(PreBlasSkinningCB.packedValues[1u]);
    if (bitwiseValue < reinterpretedBits.y)
    {
        uvec4 reinterpretedBits1 = floatBitsToUint(PreBlasSkinningCB.packedValues[0u]);
        uint scalarValue = reinterpretedBits1.x;
        uint productValue = scalarValue * bitwiseValue;
        uint sumValue = productValue + reinterpretedBits.w;
        uint reinterpretedBits2 = floatBitsToUint(PreBlasSkinningCB.packedValues[2u]).y + productValue;
        uint bitwiseValue1 = scalarValue >> 2u;
        uint bitwiseValue2 = scalarValue >> 4u;
        uint bitwiseValue3 = bitwiseValue2 << 2u;
        uint sumValue1 = bitwiseValue1 - bitwiseValue3;
        bool comparisonValue = bitwiseValue2 == 0u;
        uint intermediateValue[10];
        uint intermediateValue2;
        if (comparisonValue)
        {
            intermediateValue2 = 0u;
        }
        else
        {
            uint intermediateValue4;
            uint intermediateValue5;
            intermediateValue4 = 0u;
            intermediateValue5 = 0u;
            for (;;)
            {
                uint reinterpretedBits3 = floatBitsToUint(PreBlasSkinningCB.packedValues[1u]).z + 0u;
                uint bitwiseValue4 = ((intermediateValue5 << 4u) + sumValue) >> 2u;
                uvec4 loadedBufferValue = uvec4(imageLoad(vertexBuffersRW[reinterpretedBits3], int(bitwiseValue4)).x, imageLoad(vertexBuffersRW[reinterpretedBits3], int(bitwiseValue4 + 1u)).x, imageLoad(vertexBuffersRW[reinterpretedBits3], int(bitwiseValue4 + 2u)).x, imageLoad(vertexBuffersRW[reinterpretedBits3], int(bitwiseValue4 + 3u)).x);
                intermediateValue[intermediateValue4] = loadedBufferValue.x;
                intermediateValue[intermediateValue4 | 1u] = loadedBufferValue.y;
                intermediateValue[intermediateValue4 | 2u] = loadedBufferValue.z;
                intermediateValue[intermediateValue4 | 3u] = loadedBufferValue.w;
                uint sumValue2 = intermediateValue5 + 1u;
                if (sumValue2 == bitwiseValue2)
                {
                    break;
                }
                else
                {
                    intermediateValue4 += 4u;
                    intermediateValue5 = sumValue2;
                }
            }
            intermediateValue2 = bitwiseValue3;
        }
        bool comparisonValue1 = bitwiseValue1 == bitwiseValue3;
        if (!comparisonValue1)
        {
            uint intermediateValue7;
            uint intermediateValue8;
            intermediateValue7 = intermediateValue2;
            intermediateValue8 = 0u;
            for (;;)
            {
                intermediateValue[intermediateValue7] = imageLoad(vertexBuffersRW[floatBitsToUint(PreBlasSkinningCB.packedValues[1u]).z + 0u], int((((bitwiseValue2 << 4u) + sumValue) + (intermediateValue8 << 2u)) >> 2u)).x;
                uint sumValue3 = intermediateValue8 + 1u;
                if (sumValue3 < sumValue1)
                {
                    intermediateValue7++;
                    intermediateValue8 = sumValue3;
                }
                else
                {
                    break;
                }
            }
        }
        uvec4 reinterpretedBits4 = floatBitsToUint(PreBlasSkinningCB.packedValues[0u]);
        uint scalarValue1 = reinterpretedBits4.z;
        if (!(scalarValue1 == 4294967295u))
        {
            uint scalarValue2 = scalarValue1 >> 2u;
            uint reinterpretedBits5 = floatBitsToUint(PreBlasSkinningCB.packedValues[2u]).x + 0u;
            uint bitwiseValue5 = (reinterpretedBits4.y + productValue) >> 2u;
            uvec2 loadedBufferValue1 = uvec2(imageLoad(vertexBuffersRW[reinterpretedBits5], int(bitwiseValue5)).x, imageLoad(vertexBuffersRW[reinterpretedBits5], int(bitwiseValue5 + 1u)).x);
            intermediateValue[scalarValue2] = loadedBufferValue1.x;
            intermediateValue[scalarValue2 + 1u] = loadedBufferValue1.y;
        }
        uint reinterpretedBits6 = intermediateValue[floatBitsToUint(PreBlasSkinningCB.packedValues[1u]).x >> 2u];
        uint bitwiseValue6 = reinterpretedBits6 & 65535u;
        if (bitwiseValue6 < 8u)
        {
            uint bitwiseValue7 = (bitwiseValue6 << 2u) | 3u;
            uint sumValue4 = bitwiseValue7 + 1u;
            uint sumValue5 = bitwiseValue7 + 2u;
            uint sumValue6 = bitwiseValue7 + 3u;
            uvec4 reinterpretedBits7 = floatBitsToUint(PreBlasSkinningCB.packedValues[0u]);
            uint bitwiseValue8 = reinterpretedBits7.y >> 2u;
            uint scalarValue3 = intermediateValue[bitwiseValue8];
            uint sumValue7 = bitwiseValue8 + 1u;
            uint scalarValue4 = intermediateValue[sumValue7];
            vec2 bitwiseValue9 = unpackHalf2x16(scalarValue3 & 65535u);
            float scalarValue5 = bitwiseValue9.x;
            vec2 bitwiseValue10 = unpackHalf2x16(scalarValue3 >> 16u);
            float scalarValue6 = bitwiseValue10.x;
            vec2 bitwiseValue11 = unpackHalf2x16(scalarValue4 & 65535u);
            float scalarValue7 = bitwiseValue11.x;
            vec2 bitwiseValue12 = unpackHalf2x16(scalarValue4 >> 16u);
            float scalarValue8 = bitwiseValue12.x;
            intermediateValue[bitwiseValue8] = (packHalf2x16(vec2(fma(PreBlasSkinningCB.packedValues[sumValue6].y, scalarValue8, fma(PreBlasSkinningCB.packedValues[sumValue5].y, scalarValue7, fma(PreBlasSkinningCB.packedValues[sumValue4].y, scalarValue6, scalarValue5 * PreBlasSkinningCB.packedValues[bitwiseValue7].y))), 0.0)) << 16u) | packHalf2x16(vec2(fma(PreBlasSkinningCB.packedValues[sumValue6].x, scalarValue8, fma(PreBlasSkinningCB.packedValues[sumValue5].x, scalarValue7, fma(PreBlasSkinningCB.packedValues[sumValue4].x, scalarValue6, scalarValue5 * PreBlasSkinningCB.packedValues[bitwiseValue7].x))), 0.0));
            intermediateValue[sumValue7] = (packHalf2x16(vec2(fma(PreBlasSkinningCB.packedValues[sumValue6].w, scalarValue8, fma(PreBlasSkinningCB.packedValues[sumValue5].w, scalarValue7, fma(PreBlasSkinningCB.packedValues[sumValue4].w, scalarValue6, scalarValue5 * PreBlasSkinningCB.packedValues[bitwiseValue7].w))), 0.0)) << 16u) | packHalf2x16(vec2(fma(PreBlasSkinningCB.packedValues[sumValue6].z, scalarValue8, fma(PreBlasSkinningCB.packedValues[sumValue5].z, scalarValue7, fma(PreBlasSkinningCB.packedValues[sumValue4].z, scalarValue6, scalarValue5 * PreBlasSkinningCB.packedValues[bitwiseValue7].z))), 0.0));
            uint bitwiseValue13 = reinterpretedBits7.w >> 2u;
            uint bitwiseValue14 = intermediateValue[bitwiseValue13] & 255u;
            float comparisonValue2 = float(int((bitwiseValue14 == (intermediateValue[bitwiseValue13] & 127u)) ? bitwiseValue14 : (intermediateValue[bitwiseValue13] | 4294967040u))) * 0.0078740157186985015869140625;
            uint bitwiseValue15 = intermediateValue[bitwiseValue13] >> 8u;
            uint bitwiseValue16 = bitwiseValue15 & 255u;
            float comparisonValue3 = float(int((bitwiseValue16 == (bitwiseValue15 & 127u)) ? bitwiseValue16 : (bitwiseValue15 | 4294967040u))) * 0.0078740157186985015869140625;
            uint bitwiseValue17 = intermediateValue[bitwiseValue13] >> 16u;
            uint bitwiseValue18 = bitwiseValue17 & 255u;
            float comparisonValue4 = float(int((bitwiseValue18 == (bitwiseValue17 & 127u)) ? bitwiseValue18 : (bitwiseValue17 | 4294967040u))) * 0.0078740157186985015869140625;
            uint bitwiseValue19 = intermediateValue[bitwiseValue13] >> 24u;
            float comparisonValue5 = float(int((bitwiseValue19 == (bitwiseValue19 & 127u)) ? bitwiseValue19 : (bitwiseValue19 | 4294967040u))) * 0.0078740157186985015869140625;
            intermediateValue[bitwiseValue13] = ((((uint(int(spvNMin(spvNMax(fma(PreBlasSkinningCB.packedValues[sumValue6].z, comparisonValue5, fma(PreBlasSkinningCB.packedValues[sumValue5].z, comparisonValue4, fma(PreBlasSkinningCB.packedValues[sumValue4].z, comparisonValue3, comparisonValue2 * PreBlasSkinningCB.packedValues[bitwiseValue7].z))) * 127.0, -127.0), 127.0))) << 16u) & 16711680u) | (uint(int(spvNMin(spvNMax(fma(PreBlasSkinningCB.packedValues[sumValue6].w, comparisonValue5, fma(PreBlasSkinningCB.packedValues[sumValue5].w, comparisonValue4, fma(PreBlasSkinningCB.packedValues[sumValue4].w, comparisonValue3, comparisonValue2 * PreBlasSkinningCB.packedValues[bitwiseValue7].w))) * 127.0, -127.0), 127.0))) << 24u)) | ((uint(int(spvNMin(spvNMax(fma(PreBlasSkinningCB.packedValues[sumValue6].y, comparisonValue5, fma(PreBlasSkinningCB.packedValues[sumValue5].y, comparisonValue4, fma(PreBlasSkinningCB.packedValues[sumValue4].y, comparisonValue3, comparisonValue2 * PreBlasSkinningCB.packedValues[bitwiseValue7].y))) * 127.0, -127.0), 127.0))) << 8u) & 65280u)) | (uint(int(spvNMin(spvNMax(fma(PreBlasSkinningCB.packedValues[sumValue6].x, comparisonValue5, fma(PreBlasSkinningCB.packedValues[sumValue5].x, comparisonValue4, fma(PreBlasSkinningCB.packedValues[sumValue4].x, comparisonValue3, comparisonValue2 * PreBlasSkinningCB.packedValues[bitwiseValue7].x))) * 127.0, -127.0), 127.0))) & 255u);
        }
        uint intermediateValue15;
        if (comparisonValue)
        {
            intermediateValue15 = 0u;
        }
        else
        {
            uint intermediateValue16;
            uint intermediateValue17;
            intermediateValue16 = 0u;
            intermediateValue17 = 0u;
            for (;;)
            {
                uint reinterpretedBits8 = floatBitsToUint(PreBlasSkinningCB.packedValues[2u]).x + 0u;
                uint bitwiseValue20 = ((intermediateValue17 << 4u) + reinterpretedBits2) >> 2u;
                imageStore(vertexBuffersRW[reinterpretedBits8], int(bitwiseValue20), uvec4(intermediateValue[intermediateValue16]));
                imageStore(vertexBuffersRW[reinterpretedBits8], int(bitwiseValue20 + 1u), uvec4(intermediateValue[intermediateValue16 | 1u]));
                imageStore(vertexBuffersRW[reinterpretedBits8], int(bitwiseValue20 + 2u), uvec4(intermediateValue[intermediateValue16 | 2u]));
                imageStore(vertexBuffersRW[reinterpretedBits8], int(bitwiseValue20 + 3u), uvec4(intermediateValue[intermediateValue16 | 3u]));
                uint sumValue8 = intermediateValue17 + 1u;
                if (sumValue8 == bitwiseValue2)
                {
                    break;
                }
                else
                {
                    intermediateValue16 += 4u;
                    intermediateValue17 = sumValue8;
                }
            }
            intermediateValue15 = bitwiseValue3;
        }
        if (!comparisonValue1)
        {
            uint intermediateValue18;
            uint intermediateValue19;
            intermediateValue18 = intermediateValue15;
            intermediateValue19 = 0u;
            for (;;)
            {
                imageStore(vertexBuffersRW[floatBitsToUint(PreBlasSkinningCB.packedValues[2u]).x + 0u], int((((bitwiseValue2 << 4u) + reinterpretedBits2) + (intermediateValue19 << 2u)) >> 2u), uvec4(intermediateValue[intermediateValue18]));
                uint sumValue9 = intermediateValue19 + 1u;
                if (sumValue9 < sumValue1)
                {
                    intermediateValue18++;
                    intermediateValue19 = sumValue9;
                }
                else
                {
                    break;
                }
            }
        }
    }
}
