#version 460
#extension GL_GOOGLE_include_directive : require
// Mip / MipDistance / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#endif

#include "../../include/materials/Mip/ComputeBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint productValue = uint(int(computeVectorConstants0.packedValues[1u].x * 2.0));
    uint productValue1 = uint(int(computeVectorConstants0.packedValues[1u].y * 2.0));
    uint scalarValue = uint(int(float(gl_GlobalInvocationID.x)));
    uint scalarValue1 = uint(int(float(gl_GlobalInvocationID.y)));
    uint bitwiseValue = scalarValue << 1u;
    uint bitwiseValue1 = scalarValue1 << 1u;
    bool comparisonValue = ((productValue & 1u) != 0u) && (scalarValue == (productValue + 4294967293u));
    bool comparisonValue1 = ((productValue1 & 1u) != 0u) && (scalarValue1 == (productValue1 + 4294967293u));
    float intermediateValue17;
    float intermediateValue18;
    if (uint(int(computeVectorConstants0.packedValues[0u].x)) == 0u)
    {
        vec4 sampledTextureValue = texelFetch(framebufferDepthTexture, ivec2(uvec2(bitwiseValue, bitwiseValue1)), int(0u));
        float scalarValue2 = sampledTextureValue.x;
        float quotientValue = (((float(int(bitwiseValue)) + 0.5) / computeVectorConstants0.packedValues[1u].x) * 2.0) + (-1.0);
        float quotientValue1 = ((1.0 - ((float(int(bitwiseValue1)) + 0.5) / computeVectorConstants0.packedValues[1u].y)) * 2.0) + (-1.0);
        float multiplyAddValue = (fma(computeVectorConstants0.packedValues[4u].z, scalarValue2, fma(computeVectorConstants0.packedValues[3u].z, quotientValue1, quotientValue * computeVectorConstants0.packedValues[2u].z)) + computeVectorConstants0.packedValues[5u].z) / (fma(computeVectorConstants0.packedValues[4u].w, scalarValue2, fma(computeVectorConstants0.packedValues[3u].w, quotientValue1, quotientValue * computeVectorConstants0.packedValues[2u].w)) + computeVectorConstants0.packedValues[5u].w);
        uint bitwiseValue2 = bitwiseValue1 | 1u;
        vec4 sampledTextureValue1 = texelFetch(framebufferDepthTexture, ivec2(uvec2(bitwiseValue, bitwiseValue2)), int(0u));
        float scalarValue3 = sampledTextureValue1.x;
        float quotientValue2 = (((float(int(bitwiseValue)) + 0.5) / computeVectorConstants0.packedValues[1u].x) * 2.0) + (-1.0);
        float quotientValue3 = ((1.0 - ((float(int(bitwiseValue2)) + 0.5) / computeVectorConstants0.packedValues[1u].y)) * 2.0) + (-1.0);
        float multiplyAddValue1 = (fma(computeVectorConstants0.packedValues[4u].z, scalarValue3, fma(computeVectorConstants0.packedValues[3u].z, quotientValue3, quotientValue2 * computeVectorConstants0.packedValues[2u].z)) + computeVectorConstants0.packedValues[5u].z) / (fma(computeVectorConstants0.packedValues[4u].w, scalarValue3, fma(computeVectorConstants0.packedValues[3u].w, quotientValue3, quotientValue2 * computeVectorConstants0.packedValues[2u].w)) + computeVectorConstants0.packedValues[5u].w);
        vec4 sampledTextureValue2 = texelFetch(framebufferDepthTexture, ivec2(uvec2(bitwiseValue, bitwiseValue1)), int(0u));
        float scalarValue4 = sampledTextureValue2.x;
        float quotientValue4 = (((float(int(bitwiseValue)) + 0.5) / computeVectorConstants0.packedValues[1u].x) * 2.0) + (-1.0);
        float quotientValue5 = ((1.0 - ((float(int(bitwiseValue1)) + 0.5) / computeVectorConstants0.packedValues[1u].y)) * 2.0) + (-1.0);
        float multiplyAddValue2 = (fma(computeVectorConstants0.packedValues[4u].z, scalarValue4, fma(computeVectorConstants0.packedValues[3u].z, quotientValue5, quotientValue4 * computeVectorConstants0.packedValues[2u].z)) + computeVectorConstants0.packedValues[5u].z) / (fma(computeVectorConstants0.packedValues[4u].w, scalarValue4, fma(computeVectorConstants0.packedValues[3u].w, quotientValue5, quotientValue4 * computeVectorConstants0.packedValues[2u].w)) + computeVectorConstants0.packedValues[5u].w);
        uint bitwiseValue3 = bitwiseValue | 1u;
        vec4 sampledTextureValue3 = texelFetch(framebufferDepthTexture, ivec2(uvec2(bitwiseValue3, bitwiseValue2)), int(0u));
        float scalarValue5 = sampledTextureValue3.x;
        float quotientValue6 = (((float(int(bitwiseValue3)) + 0.5) / computeVectorConstants0.packedValues[1u].x) * 2.0) + (-1.0);
        float quotientValue7 = ((1.0 - ((float(int(bitwiseValue2)) + 0.5) / computeVectorConstants0.packedValues[1u].y)) * 2.0) + (-1.0);
        float multiplyAddValue3 = (fma(computeVectorConstants0.packedValues[4u].z, scalarValue5, fma(computeVectorConstants0.packedValues[3u].z, quotientValue7, quotientValue6 * computeVectorConstants0.packedValues[2u].z)) + computeVectorConstants0.packedValues[5u].z) / (fma(computeVectorConstants0.packedValues[4u].w, scalarValue5, fma(computeVectorConstants0.packedValues[3u].w, quotientValue7, quotientValue6 * computeVectorConstants0.packedValues[2u].w)) + computeVectorConstants0.packedValues[5u].w);
        float scalarValue6 = spvNMin(multiplyAddValue, spvNMin(multiplyAddValue1, spvNMin(multiplyAddValue2, multiplyAddValue3)));
        float scalarValue7 = spvNMax(multiplyAddValue, spvNMax(multiplyAddValue1, spvNMax(multiplyAddValue2, multiplyAddValue3)));
        float intermediateValue10;
        float intermediateValue11;
        if (comparisonValue)
        {
            uint sumValue = bitwiseValue + 2u;
            vec4 sampledTextureValue4 = texelFetch(framebufferDepthTexture, ivec2(uvec2(sumValue, bitwiseValue1)), int(0u));
            float scalarValue8 = sampledTextureValue4.x;
            float quotientValue8 = (((float(int(sumValue)) + 0.5) / computeVectorConstants0.packedValues[1u].x) * 2.0) + (-1.0);
            float quotientValue9 = ((1.0 - ((float(int(bitwiseValue1)) + 0.5) / computeVectorConstants0.packedValues[1u].y)) * 2.0) + (-1.0);
            vec4 sampledTextureValue5 = texelFetch(framebufferDepthTexture, ivec2(uvec2(sumValue, bitwiseValue2)), int(0u));
            float scalarValue9 = sampledTextureValue5.x;
            float quotientValue10 = (((float(int(sumValue)) + 0.5) / computeVectorConstants0.packedValues[1u].x) * 2.0) + (-1.0);
            float quotientValue11 = ((1.0 - ((float(int(bitwiseValue2)) + 0.5) / computeVectorConstants0.packedValues[1u].y)) * 2.0) + (-1.0);
            float intermediateValue13;
            float intermediateValue14;
            if (comparisonValue1)
            {
                uint sumValue1 = bitwiseValue1 + 2u;
                vec4 sampledTextureValue6 = texelFetch(framebufferDepthTexture, ivec2(uvec2(sumValue, sumValue1)), int(0u));
                float scalarValue10 = sampledTextureValue6.x;
                float quotientValue12 = (((float(int(sumValue)) + 0.5) / computeVectorConstants0.packedValues[1u].x) * 2.0) + (-1.0);
                float quotientValue13 = ((1.0 - ((float(int(sumValue1)) + 0.5) / computeVectorConstants0.packedValues[1u].y)) * 2.0) + (-1.0);
                float multiplyAddValue4 = (fma(computeVectorConstants0.packedValues[4u].z, scalarValue10, fma(computeVectorConstants0.packedValues[3u].z, quotientValue13, quotientValue12 * computeVectorConstants0.packedValues[2u].z)) + computeVectorConstants0.packedValues[5u].z) / (fma(computeVectorConstants0.packedValues[4u].w, scalarValue10, fma(computeVectorConstants0.packedValues[3u].w, quotientValue13, quotientValue12 * computeVectorConstants0.packedValues[2u].w)) + computeVectorConstants0.packedValues[5u].w);
                intermediateValue13 = spvNMin(scalarValue6, multiplyAddValue4);
                intermediateValue14 = spvNMin(scalarValue7, multiplyAddValue4);
            }
            else
            {
                intermediateValue13 = scalarValue6;
                intermediateValue14 = scalarValue7;
            }
            float multiplyAddValue5 = spvNMin((fma(computeVectorConstants0.packedValues[4u].z, scalarValue8, fma(computeVectorConstants0.packedValues[3u].z, quotientValue9, quotientValue8 * computeVectorConstants0.packedValues[2u].z)) + computeVectorConstants0.packedValues[5u].z) / (fma(computeVectorConstants0.packedValues[4u].w, scalarValue8, fma(computeVectorConstants0.packedValues[3u].w, quotientValue9, quotientValue8 * computeVectorConstants0.packedValues[2u].w)) + computeVectorConstants0.packedValues[5u].w), (fma(computeVectorConstants0.packedValues[4u].z, scalarValue9, fma(computeVectorConstants0.packedValues[3u].z, quotientValue11, quotientValue10 * computeVectorConstants0.packedValues[2u].z)) + computeVectorConstants0.packedValues[5u].z) / (fma(computeVectorConstants0.packedValues[4u].w, scalarValue9, fma(computeVectorConstants0.packedValues[3u].w, quotientValue11, quotientValue10 * computeVectorConstants0.packedValues[2u].w)) + computeVectorConstants0.packedValues[5u].w));
            intermediateValue10 = spvNMin(intermediateValue13, multiplyAddValue5);
            intermediateValue11 = spvNMin(intermediateValue14, multiplyAddValue5);
        }
        else
        {
            intermediateValue10 = scalarValue6;
            intermediateValue11 = scalarValue7;
        }
        float branchMergedValue;
        float branchMergedValue2;
        if (comparisonValue1)
        {
            uint sumValue2 = bitwiseValue1 + 2u;
            vec4 sampledTextureValue8 = texelFetch(framebufferDepthTexture, ivec2(uvec2(bitwiseValue, sumValue2)), int(0u));
            float scalarValue11 = sampledTextureValue8.x;
            float quotientValue14 = (((float(int(bitwiseValue)) + 0.5) / computeVectorConstants0.packedValues[1u].x) * 2.0) + (-1.0);
            float quotientValue15 = ((1.0 - ((float(int(sumValue2)) + 0.5) / computeVectorConstants0.packedValues[1u].y)) * 2.0) + (-1.0);
            vec4 sampledTextureValue9 = texelFetch(framebufferDepthTexture, ivec2(uvec2(bitwiseValue3, sumValue2)), int(0u));
            float scalarValue12 = sampledTextureValue9.x;
            float quotientValue16 = (((float(int(bitwiseValue3)) + 0.5) / computeVectorConstants0.packedValues[1u].x) * 2.0) + (-1.0);
            float quotientValue17 = ((1.0 - ((float(int(sumValue2)) + 0.5) / computeVectorConstants0.packedValues[1u].y)) * 2.0) + (-1.0);
            float multiplyAddValue6 = spvNMin((fma(computeVectorConstants0.packedValues[4u].z, scalarValue11, fma(computeVectorConstants0.packedValues[3u].z, quotientValue15, quotientValue14 * computeVectorConstants0.packedValues[2u].z)) + computeVectorConstants0.packedValues[5u].z) / (fma(computeVectorConstants0.packedValues[4u].w, scalarValue11, fma(computeVectorConstants0.packedValues[3u].w, quotientValue15, quotientValue14 * computeVectorConstants0.packedValues[2u].w)) + computeVectorConstants0.packedValues[5u].w), (fma(computeVectorConstants0.packedValues[4u].z, scalarValue12, fma(computeVectorConstants0.packedValues[3u].z, quotientValue17, quotientValue16 * computeVectorConstants0.packedValues[2u].z)) + computeVectorConstants0.packedValues[5u].z) / (fma(computeVectorConstants0.packedValues[4u].w, scalarValue12, fma(computeVectorConstants0.packedValues[3u].w, quotientValue17, quotientValue16 * computeVectorConstants0.packedValues[2u].w)) + computeVectorConstants0.packedValues[5u].w));
            branchMergedValue = spvNMin(intermediateValue10, multiplyAddValue6);
            branchMergedValue2 = spvNMin(intermediateValue11, multiplyAddValue6);
        }
        else
        {
            branchMergedValue = intermediateValue10;
            branchMergedValue2 = intermediateValue11;
        }
        intermediateValue17 = branchMergedValue;
        intermediateValue18 = branchMergedValue2;
    }
    else
    {
        uint bitwiseValue4 = bitwiseValue1 | 1u;
        uint bitwiseValue5 = bitwiseValue | 1u;
        float sampledTextureValue10 = spvNMin(texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue, bitwiseValue1)), int(0u)).x, spvNMin(texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue, bitwiseValue4)), int(0u)).x, spvNMin(texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue5, bitwiseValue1)), int(0u)).x, texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue5, bitwiseValue4)), int(0u)).x)));
        float sampledTextureValue7;
        if (comparisonValue)
        {
            uint sumValue3 = bitwiseValue + 2u;
            float sampledTextureValue13;
            if (comparisonValue1)
            {
                sampledTextureValue13 = spvNMin(sampledTextureValue10, texelFetch(inputMipTexture, ivec2(uvec2(sumValue3, bitwiseValue1 + 2u)), int(0u)).x);
            }
            else
            {
                sampledTextureValue13 = sampledTextureValue10;
            }
            sampledTextureValue7 = spvNMin(sampledTextureValue13, spvNMin(texelFetch(inputMipTexture, ivec2(uvec2(sumValue3, bitwiseValue1)), int(0u)).x, texelFetch(inputMipTexture, ivec2(uvec2(sumValue3, bitwiseValue4)), int(0u)).x));
        }
        else
        {
            sampledTextureValue7 = sampledTextureValue10;
        }
        float sampledTextureValue11;
        if (comparisonValue1)
        {
            uint sumValue4 = bitwiseValue1 + 2u;
            sampledTextureValue11 = spvNMin(sampledTextureValue7, spvNMin(texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue, sumValue4)), int(0u)).x, texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue5, sumValue4)), int(0u)).x));
        }
        else
        {
            sampledTextureValue11 = sampledTextureValue7;
        }
        float sampledTextureValue14 = spvNMax(texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue, bitwiseValue1)), int(0u)).y, spvNMax(texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue, bitwiseValue4)), int(0u)).y, spvNMax(texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue5, bitwiseValue1)), int(0u)).y, texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue5, bitwiseValue4)), int(0u)).y)));
        float sampledTextureValue12;
        if (comparisonValue)
        {
            uint sumValue5 = bitwiseValue + 2u;
            float sampledTextureValue15;
            if (comparisonValue1)
            {
                sampledTextureValue15 = spvNMin(sampledTextureValue14, texelFetch(inputMipTexture, ivec2(uvec2(sumValue5, bitwiseValue1 + 2u)), int(0u)).y);
            }
            else
            {
                sampledTextureValue15 = sampledTextureValue14;
            }
            sampledTextureValue12 = spvNMin(sampledTextureValue15, spvNMin(texelFetch(inputMipTexture, ivec2(uvec2(sumValue5, bitwiseValue1)), int(0u)).y, texelFetch(inputMipTexture, ivec2(uvec2(sumValue5, bitwiseValue4)), int(0u)).y));
        }
        else
        {
            sampledTextureValue12 = sampledTextureValue14;
        }
        float branchMergedValue1;
        float branchMergedValue3;
        if (comparisonValue1)
        {
            uint sumValue6 = bitwiseValue1 + 2u;
            branchMergedValue1 = sampledTextureValue11;
            branchMergedValue3 = spvNMin(sampledTextureValue12, spvNMin(texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue, sumValue6)), int(0u)).y, texelFetch(inputMipTexture, ivec2(uvec2(bitwiseValue5, sumValue6)), int(0u)).y));
        }
        else
        {
            branchMergedValue1 = sampledTextureValue11;
            branchMergedValue3 = sampledTextureValue12;
        }
        intermediateValue17 = branchMergedValue1;
        intermediateValue18 = branchMergedValue3;
    }
    imageStore(outputMipTexture, ivec2(uvec2(scalarValue, scalarValue1)), vec4(intermediateValue17, intermediateValue18, 0.0, 0.0));
#endif
}
