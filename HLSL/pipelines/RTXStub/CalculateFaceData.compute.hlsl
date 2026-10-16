// RTXStub / CalculateFaceData / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 16
#endif

#define RD_USE_TEXTURE_SIZE_UINT2_0 1

#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

#include "../../include/Math.hlsli"
void executeComputeStage()
{
    if (dispatchThreadId.x < asuint(rootConstantsConstants[0u]).y)
    {
        uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
        uint scalarValue = reinterpretedBits.x;
        uint productValue = (scalarValue * 38u) + 24u;
        uint productValue1 = (scalarValue * 76u) + 58u;
        uint productValue2 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue * 76u) + 54u) * 2 + 0));
        uint sumValue = productValue2 + 0u;
        uint bitwiseValue = dispatchThreadId.x << 2u;
        uint bitwiseValue1 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue * 38u) + 25u) * 4 + 0) >> 2u) + dispatchThreadId.x;
        uint productValue3 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue * 76u) + 56u) * 2 + 0));
        uint productValue4 = productValue3 * (rdByteLoad_objectInstances_uint(0u, productValue * 4 + 0) + bitwiseValue);
        uint bitwiseValue2 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue * 76u) + 72u) * 2 + 0) >> 8u);
        uint bitwiseValue3 = (bitwiseValue2 + productValue4) >> 2u;
        uint bitwiseValue4 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue * 76u) + 71u) * 2 + 0) & 255u);
        uint bitwiseValue5 = (bitwiseValue4 + productValue4) >> 1u;
        half3 productValue5 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), bitwiseValue5 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue5 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue5 + 2u) * 2 + 0)));
        float scalarValue1 = float(productValue5.x);
        float scalarValue2 = float(productValue5.y);
        float scalarValue3 = float(productValue5.z);
        bool productValue6 = rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue * 76u) + 61u) * 2 + 0) < 0u;
        float bitwiseValue7;
        float bitwiseValue8;
        if (productValue6)
        {
            uint bitwiseValue6 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue3 * 4 + 0) >> 15u;
            bitwiseValue7 = ((float(bitwiseValue6 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue3 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
            bitwiseValue8 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue3 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue6 & 65534u) * 1.525902189314365386962890625e-05f);
        }
        else
        {
            bitwiseValue7 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue3 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
            bitwiseValue8 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue3 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
        }
        uint sumValue1 = productValue2 + 0u;
        rdByteStore_faceUvBuffersRW_uint(NonUniformResourceIndex(sumValue1), (bitwiseValue1 * 4u) * 4 + 0, rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue3 * 4 + 0));
        uint bitwiseValue9 = productValue3 * (rdByteLoad_objectInstances_uint(0u, productValue * 4 + 0) + (bitwiseValue | 1u));
        uint bitwiseValue10 = (bitwiseValue2 + bitwiseValue9) >> 2u;
        uint bitwiseValue11 = (bitwiseValue4 + bitwiseValue9) >> 1u;
        half3 productValue7 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), bitwiseValue11 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue11 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue11 + 2u) * 2 + 0)));
        float bitwiseValue13;
        float bitwiseValue14;
        if (productValue6)
        {
            uint bitwiseValue12 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue10 * 4 + 0) >> 15u;
            bitwiseValue13 = ((float(bitwiseValue12 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue10 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
            bitwiseValue14 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue10 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue12 & 65534u) * 1.525902189314365386962890625e-05f);
        }
        else
        {
            bitwiseValue13 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue10 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
            bitwiseValue14 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue10 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
        }
        rdByteStore_faceUvBuffersRW_uint(NonUniformResourceIndex(sumValue1), ((bitwiseValue1 * 4u) + 1u) * 4 + 0, rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue10 * 4 + 0));
        uint bitwiseValue15 = productValue3 * (rdByteLoad_objectInstances_uint(0u, productValue * 4 + 0) + (bitwiseValue | 2u));
        uint bitwiseValue16 = (bitwiseValue2 + bitwiseValue15) >> 2u;
        uint bitwiseValue17 = (bitwiseValue4 + bitwiseValue15) >> 1u;
        half3 productValue8 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), bitwiseValue17 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue17 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue17 + 2u) * 2 + 0)));
        float bitwiseValue19;
        float bitwiseValue20;
        if (productValue6)
        {
            uint bitwiseValue18 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue16 * 4 + 0) >> 15u;
            bitwiseValue19 = ((float(bitwiseValue18 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue16 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
            bitwiseValue20 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue16 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue18 & 65534u) * 1.525902189314365386962890625e-05f);
        }
        else
        {
            bitwiseValue19 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue16 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
            bitwiseValue20 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue16 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
        }
        rdByteStore_faceUvBuffersRW_uint(NonUniformResourceIndex(sumValue1), ((bitwiseValue1 * 4u) + 2u) * 4 + 0, rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), bitwiseValue16 * 4 + 0));
        rdByteStore_faceUvBuffersRW_uint(NonUniformResourceIndex(sumValue1), ((bitwiseValue1 * 4u) + 3u) * 4 + 0, rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), ((bitwiseValue2 + (productValue3 * (rdByteLoad_objectInstances_uint(0u, productValue * 4 + 0) + (bitwiseValue | 3u)))) >> 2u) * 4 + 0));
        float sumValue2 = float(productValue7.x) - scalarValue1;
        float sumValue3 = float(productValue7.y) - scalarValue2;
        float sumValue4 = float(productValue7.z) - scalarValue3;
        float sumValue5 = float(productValue8.x) - scalarValue1;
        float sumValue6 = float(productValue8.y) - scalarValue2;
        float sumValue7 = float(productValue8.z) - scalarValue3;
        float sumValue8 = bitwiseValue13 - bitwiseValue7;
        float sumValue9 = bitwiseValue14 - bitwiseValue8;
        float sumValue10 = bitwiseValue19 - bitwiseValue7;
        float sumValue11 = bitwiseValue20 - bitwiseValue8;
        float productValue9 = (sumValue11 * sumValue8) - (sumValue10 * sumValue9);
        float productValue10;
        float intermediateValue4;
        float intermediateValue5;
        float intermediateValue6;
        float intermediateValue7;
        float intermediateValue8;
        if (productValue9 == 0.0f)
        {
            productValue10 = 1.0f;
            intermediateValue4 = 0.0f;
            intermediateValue5 = 0.0f;
            intermediateValue6 = 0.0f;
            intermediateValue7 = 1.0f;
            intermediateValue8 = 0.0f;
        }
        else
        {
            float comparisonValue = (productValue9 < 0.0f) ? (-1.0f) : 1.0f;
            float productValue11 = comparisonValue * ((sumValue11 * sumValue2) - (sumValue5 * sumValue9));
            float productValue12 = comparisonValue * ((sumValue11 * sumValue3) - (sumValue6 * sumValue9));
            float productValue13 = comparisonValue * ((sumValue11 * sumValue4) - (sumValue7 * sumValue9));
            float inverseLengthValue = rsqrt(dot(float3(productValue11, productValue12, productValue13), float3(productValue11, productValue12, productValue13)));
            float productValue14 = comparisonValue * ((sumValue5 * sumValue8) - (sumValue10 * sumValue2));
            float productValue15 = comparisonValue * ((sumValue6 * sumValue8) - (sumValue10 * sumValue3));
            float productValue16 = comparisonValue * ((sumValue7 * sumValue8) - (sumValue10 * sumValue4));
            float inverseLengthValue1 = rsqrt(dot(float3(productValue14, productValue15, productValue16), float3(productValue14, productValue15, productValue16)));
            productValue10 = inverseLengthValue * productValue11;
            intermediateValue4 = inverseLengthValue * productValue12;
            intermediateValue5 = inverseLengthValue * productValue13;
            intermediateValue6 = inverseLengthValue1 * productValue14;
            intermediateValue7 = inverseLengthValue1 * productValue15;
            intermediateValue8 = inverseLengthValue1 * productValue16;
        }
        float productValue17 = (sumValue7 * sumValue3) - (sumValue6 * sumValue4);
        float productValue18 = (sumValue5 * sumValue4) - (sumValue7 * sumValue2);
        float productValue19 = (sumValue6 * sumValue2) - (sumValue5 * sumValue3);
        float inverseLengthValue2 = rsqrt(dot(float3(productValue17, productValue18, productValue19), float3(productValue17, productValue18, productValue19)));
        uint16_t intermediateValue9;
        half intermediateValue10;
        if (rdByteLoad_objectInstances_uint16_t(0u, productValue1 * 2 + 0) == 65535u)
        {
            intermediateValue9 = 0u;
            intermediateValue10 = half(0.0);
        }
        else
        {
            uint reinterpretedBits1;
            if (rdByteLoad_objectInstances_uint16_t(0u, productValue1 * 2 + 0) > 4095u)
            {
                reinterpretedBits1 = asuint(viewCbConstants[98u]).w;
            }
            else
            {
                reinterpretedBits1 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue1 * 2 + 0));
            }
            uint unusedTextureMipCount549;
            uint2 sumValue12 = rdTextureSize(textures[NonUniformResourceIndex(reinterpretedBits1 + 0u)], 0u, unusedTextureMipCount549);
            intermediateValue9 = uint16_t(half(asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, (((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue), ((uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue * 76u) + 74u) * 2 + 0) >> 8u) + productValue4) >> 2u) * 4 + 0) & 65535u) * 16u) + 13u) * 4 + 0))));
            intermediateValue10 = half((log2(float(sumValue12.x * sumValue12.y)) + log2((sqrt(productValue9 * productValue9) * 0.5f) / (sqrt(((productValue17 * productValue17) + (productValue18 * productValue18)) + (productValue19 * productValue19)) * 0.5f))) * 0.5f);
        }
        uint sumValue13 = productValue2 + 0u;
        rdByteStore_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue13), (bitwiseValue1 * 4u) * 4 + 0, ((uint(clamp(mad(inverseLengthValue2 * productValue18, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f) << 10u) | uint(clamp(mad(inverseLengthValue2 * productValue17, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f)) | (uint(clamp(mad(inverseLengthValue2 * productValue19, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f) << 20u));
        rdByteStore_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue13), ((bitwiseValue1 * 4u) + 1u) * 4 + 0, ((uint(clamp(mad(intermediateValue4, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f) << 10u) | uint(clamp(mad(productValue10, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f)) | (uint(clamp(mad(intermediateValue5, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f) << 20u));
        rdByteStore_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue13), ((bitwiseValue1 * 4u) + 2u) * 4 + 0, ((uint(clamp(mad(intermediateValue7, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f) << 10u) | uint(clamp(mad(intermediateValue6, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f)) | (uint(clamp(mad(intermediateValue8, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f) << 20u));
        rdByteStore_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue13), ((bitwiseValue1 * 8u) + 6u) * 2 + 0, (uint16_t)f32tof16(intermediateValue10));
        rdByteStore_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue13), ((bitwiseValue1 * 8u) + 7u) * 2 + 0, intermediateValue9);
    }
}
[numthreads(128, 1, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
