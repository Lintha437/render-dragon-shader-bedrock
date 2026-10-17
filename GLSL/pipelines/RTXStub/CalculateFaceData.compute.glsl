#version 460
#extension GL_GOOGLE_include_directive : require
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

#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
#extension GL_EXT_shader_16bit_storage : require
#if defined(GL_AMD_gpu_shader_half_float)
#extension GL_AMD_gpu_shader_half_float : require
#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
#else
#error No extension available for FP16.
#endif
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_samplerless_texture_functions : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    if (gl_GlobalInvocationID.x < floatBitsToUint(RootConstants.packedValues[0u]).y)
    {
        uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
        uint scalarValue = reinterpretedBits.x;
        uint productValue = (scalarValue * 38u) + 24u;
        uint productValue1 = (scalarValue * 76u) + 58u;
        uint productValue2 = uint(objectInstances.packedValues[(scalarValue * 76u) + 54u]);
        uint sumValue = productValue2 + 0u;
        uint bitwiseValue = gl_GlobalInvocationID.x << 2u;
        uint bitwiseValue1 = (objectInstances_2.packedValues[(scalarValue * 38u) + 25u] >> 2u) + gl_GlobalInvocationID.x;
        uint productValue3 = uint(objectInstances.packedValues[(scalarValue * 76u) + 56u]);
        uint productValue4 = productValue3 * (objectInstances_2.packedValues[productValue] + bitwiseValue);
        uint bitwiseValue2 = uint(objectInstances.packedValues[(scalarValue * 76u) + 72u] >> 8us);
        uint bitwiseValue3 = (bitwiseValue2 + productValue4) >> 2u;
        uint bitwiseValue4 = uint(objectInstances.packedValues[(scalarValue * 76u) + 71u] & 255us);
        uint bitwiseValue5 = (bitwiseValue4 + productValue4) >> 1u;
        f16vec3 sumValue1 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue5], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue5 + 1u], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue5 + 2u]));
        float scalarValue1 = float(sumValue1.x);
        float scalarValue2 = float(sumValue1.y);
        float scalarValue3 = float(sumValue1.z);
        bool productValue5 = int16_t(objectInstances.packedValues[(scalarValue * 76u) + 61u]) < int16_t(0us);
        float bitwiseValue7;
        float bitwiseValue8;
        if (productValue5)
        {
            uint bitwiseValue6 = vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue3] >> 15u;
            bitwiseValue7 = ((float(bitwiseValue6 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue3] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
            bitwiseValue8 = ((float(vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue3] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue6 & 65534u) * 1.525902189314365386962890625e-05);
        }
        else
        {
            bitwiseValue7 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue3] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
            bitwiseValue8 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue3] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
        }
        uint sumValue2 = productValue2 + 0u;
        faceUvBuffersRW[nonuniformEXT(sumValue2)].packedValues[bitwiseValue1 * 4u] = vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue3];
        uint bitwiseValue9 = productValue3 * (objectInstances_2.packedValues[productValue] + (bitwiseValue | 1u));
        uint bitwiseValue10 = (bitwiseValue2 + bitwiseValue9) >> 2u;
        uint bitwiseValue11 = (bitwiseValue4 + bitwiseValue9) >> 1u;
        f16vec3 sumValue3 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue11], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue11 + 1u], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue11 + 2u]));
        float bitwiseValue13;
        float bitwiseValue14;
        if (productValue5)
        {
            uint bitwiseValue12 = vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue10] >> 15u;
            bitwiseValue13 = ((float(bitwiseValue12 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue10] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
            bitwiseValue14 = ((float(vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue10] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue12 & 65534u) * 1.525902189314365386962890625e-05);
        }
        else
        {
            bitwiseValue13 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue10] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
            bitwiseValue14 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue10] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
        }
        faceUvBuffersRW[nonuniformEXT(sumValue2)].packedValues[(bitwiseValue1 * 4u) + 1u] = vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue10];
        uint bitwiseValue15 = productValue3 * (objectInstances_2.packedValues[productValue] + (bitwiseValue | 2u));
        uint bitwiseValue16 = (bitwiseValue2 + bitwiseValue15) >> 2u;
        uint bitwiseValue17 = (bitwiseValue4 + bitwiseValue15) >> 1u;
        f16vec3 sumValue4 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue17], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue17 + 1u], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue17 + 2u]));
        float bitwiseValue19;
        float bitwiseValue20;
        if (productValue5)
        {
            uint bitwiseValue18 = vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue16] >> 15u;
            bitwiseValue19 = ((float(bitwiseValue18 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue16] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
            bitwiseValue20 = ((float(vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue16] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue18 & 65534u) * 1.525902189314365386962890625e-05);
        }
        else
        {
            bitwiseValue19 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue16] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
            bitwiseValue20 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue16] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
        }
        faceUvBuffersRW[nonuniformEXT(sumValue2)].packedValues[(bitwiseValue1 * 4u) + 2u] = vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[bitwiseValue16];
        faceUvBuffersRW[nonuniformEXT(sumValue2)].packedValues[(bitwiseValue1 * 4u) + 3u] = vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[(bitwiseValue2 + (productValue3 * (objectInstances_2.packedValues[productValue] + (bitwiseValue | 3u)))) >> 2u];
        float sumValue5 = float(sumValue3.x) - scalarValue1;
        float sumValue6 = float(sumValue3.y) - scalarValue2;
        float sumValue7 = float(sumValue3.z) - scalarValue3;
        float sumValue8 = float(sumValue4.x) - scalarValue1;
        float sumValue9 = float(sumValue4.y) - scalarValue2;
        float sumValue10 = float(sumValue4.z) - scalarValue3;
        float sumValue11 = bitwiseValue13 - bitwiseValue7;
        float sumValue12 = bitwiseValue14 - bitwiseValue8;
        float sumValue13 = bitwiseValue19 - bitwiseValue7;
        float sumValue14 = bitwiseValue20 - bitwiseValue8;
        float productValue6 = (sumValue14 * sumValue11) - (sumValue13 * sumValue12);
        float productValue7;
        float intermediateValue4;
        float intermediateValue5;
        float intermediateValue6;
        float intermediateValue7;
        float intermediateValue8;
        if (productValue6 == 0.0)
        {
            productValue7 = 1.0;
            intermediateValue4 = 0.0;
            intermediateValue5 = 0.0;
            intermediateValue6 = 0.0;
            intermediateValue7 = 1.0;
            intermediateValue8 = 0.0;
        }
        else
        {
            float comparisonValue = (productValue6 < 0.0) ? (-1.0) : 1.0;
            float productValue8 = comparisonValue * ((sumValue14 * sumValue5) - (sumValue8 * sumValue12));
            float productValue9 = comparisonValue * ((sumValue14 * sumValue6) - (sumValue9 * sumValue12));
            float productValue10 = comparisonValue * ((sumValue14 * sumValue7) - (sumValue10 * sumValue12));
            float inverseLengthValue = inversesqrt(dot(vec3(productValue8, productValue9, productValue10), vec3(productValue8, productValue9, productValue10)));
            float productValue11 = comparisonValue * ((sumValue8 * sumValue11) - (sumValue13 * sumValue5));
            float productValue12 = comparisonValue * ((sumValue9 * sumValue11) - (sumValue13 * sumValue6));
            float productValue13 = comparisonValue * ((sumValue10 * sumValue11) - (sumValue13 * sumValue7));
            float inverseLengthValue1 = inversesqrt(dot(vec3(productValue11, productValue12, productValue13), vec3(productValue11, productValue12, productValue13)));
            productValue7 = inverseLengthValue * productValue8;
            intermediateValue4 = inverseLengthValue * productValue9;
            intermediateValue5 = inverseLengthValue * productValue10;
            intermediateValue6 = inverseLengthValue1 * productValue11;
            intermediateValue7 = inverseLengthValue1 * productValue12;
            intermediateValue8 = inverseLengthValue1 * productValue13;
        }
        float productValue14 = (sumValue10 * sumValue6) - (sumValue9 * sumValue7);
        float productValue15 = (sumValue8 * sumValue7) - (sumValue10 * sumValue5);
        float productValue16 = (sumValue9 * sumValue5) - (sumValue8 * sumValue6);
        float inverseLengthValue2 = inversesqrt(dot(vec3(productValue14, productValue15, productValue16), vec3(productValue14, productValue15, productValue16)));
        uint16_t intermediateValue9;
        float16_t intermediateValue10;
        if (objectInstances.packedValues[productValue1] == 65535us)
        {
            intermediateValue9 = 0us;
            intermediateValue10 = float16_t(0.0);
        }
        else
        {
            uint reinterpretedBits1;
            if (objectInstances.packedValues[productValue1] > 4095us)
            {
                reinterpretedBits1 = floatBitsToUint(ViewCB.packedValues[98u]).w;
            }
            else
            {
                reinterpretedBits1 = uint(objectInstances.packedValues[productValue1]);
            }
            uvec2 sampledTextureValue = uvec2(textureSize(textures[nonuniformEXT(reinterpretedBits1 + 0u)], int(0u)));
            intermediateValue9 = uint16_t(float16_t(uintBitsToFloat(pbrTextureDataBuffer.packedValues[((vertexBuffers_2[nonuniformEXT(sumValue)].packedValues[(uint(objectInstances.packedValues[(scalarValue * 76u) + 74u] >> 8us) + productValue4) >> 2u] & 65535u) * 16u) + 13u])));
            intermediateValue10 = float16_t((log2(float(sampledTextureValue.x * sampledTextureValue.y)) + log2((sqrt(productValue6 * productValue6) * 0.5) / (sqrt(((productValue14 * productValue14) + (productValue15 * productValue15)) + (productValue16 * productValue16)) * 0.5))) * 0.5);
        }
        uint sumValue15 = productValue2 + 0u;
        faceDataBuffersRW_2[nonuniformEXT(sumValue15)].packedValues[bitwiseValue1 * 4u] = ((uint(spvNClamp(fma(inverseLengthValue2 * productValue15, 0.5, 0.5), 0.0, 1.0) * 1023.0) << 10u) | uint(spvNClamp(fma(inverseLengthValue2 * productValue14, 0.5, 0.5), 0.0, 1.0) * 1023.0)) | (uint(spvNClamp(fma(inverseLengthValue2 * productValue16, 0.5, 0.5), 0.0, 1.0) * 1023.0) << 20u);
        faceDataBuffersRW_2[nonuniformEXT(sumValue15)].packedValues[(bitwiseValue1 * 4u) + 1u] = ((uint(spvNClamp(fma(intermediateValue4, 0.5, 0.5), 0.0, 1.0) * 1023.0) << 10u) | uint(spvNClamp(fma(productValue7, 0.5, 0.5), 0.0, 1.0) * 1023.0)) | (uint(spvNClamp(fma(intermediateValue5, 0.5, 0.5), 0.0, 1.0) * 1023.0) << 20u);
        faceDataBuffersRW_2[nonuniformEXT(sumValue15)].packedValues[(bitwiseValue1 * 4u) + 2u] = ((uint(spvNClamp(fma(intermediateValue7, 0.5, 0.5), 0.0, 1.0) * 1023.0) << 10u) | uint(spvNClamp(fma(intermediateValue6, 0.5, 0.5), 0.0, 1.0) * 1023.0)) | (uint(spvNClamp(fma(intermediateValue8, 0.5, 0.5), 0.0, 1.0) * 1023.0) << 20u);
        faceDataBuffersRW[nonuniformEXT(sumValue15)].packedValues[(bitwiseValue1 * 8u) + 6u] = float16BitsToUint16(intermediateValue10);
        faceDataBuffersRW[nonuniformEXT(sumValue15)].packedValues[(bitwiseValue1 * 8u) + 7u] = intermediateValue9;
    }
}
