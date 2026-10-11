#version 460
#extension GL_GOOGLE_include_directive : require
// PostFX.Debug.VoxelBuffer / DebugBlitVoxel / fragment forward pipeline.
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
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#extension GL_EXT_samplerless_texture_functions : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/PostFX.Debug.VoxelBuffer/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue3 = fma(sampledTextureValue6.x, fragmentScalarConstants1.packedValues[27u], fragmentScalarConstants1.packedValues[31u]);
    float multiplyAddValue4 = (fma(varyingTexCoord0.x, 2.0, -1.0) * fragmentScalarConstants1.packedValues[16u]) / multiplyAddValue3;
    float multiplyAddValue5 = (fma(1.0 - varyingTexCoord0.y, 2.0, -1.0) * fragmentScalarConstants1.packedValues[21u]) / multiplyAddValue3;
    float quotientValue3 = fragmentScalarConstants1.packedValues[30u] / multiplyAddValue3;
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue7.x;
    float scalarValue9 = sampledTextureValue7.y;
    float scalarValue10 = abs(scalarValue9);
    float sumValue5 = 1.0 - abs(scalarValue8);
    float sumValue6 = sumValue5 - scalarValue10;
    bool conditionValue1 = sumValue6 < 0.0;
    float sumValue7 = 2.0 - 1.0;
    float comparisonValue3 = conditionValue1 ? (((scalarValue8 >= 0.0) ? sumValue7 : (-1.0)) * (1.0 - scalarValue10)) : scalarValue8;
    float comparisonValue6 = conditionValue1 ? (((scalarValue9 >= 0.0) ? sumValue7 : (-1.0)) * sumValue5) : scalarValue9;
    vec3 vectorValue = vec3(comparisonValue3, comparisonValue6, sumValue6);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float multiplyAddValue6 = fma(inverseLengthValue1 * comparisonValue3, 0.20000000298023223876953125, (fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue3, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue4, multiplyAddValue5 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) - fragmentVectorConstants1.packedValues[10u].x);
    float multiplyAddValue7 = fma(inverseLengthValue1 * comparisonValue6, 0.20000000298023223876953125, (fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue3, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue4, multiplyAddValue5 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) - fragmentVectorConstants1.packedValues[10u].y);
    float multiplyAddValue8 = fma(inverseLengthValue1 * sumValue6, 0.20000000298023223876953125, (fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue3, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue4, multiplyAddValue5 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) - fragmentVectorConstants1.packedValues[10u].z);
    uint productValue8 = uint(int(floor(floor(multiplyAddValue6) * 0.0625)));
    uint productValue9 = uint(int(floor(floor(multiplyAddValue7) * 0.0625)));
    uint productValue10 = uint(int(floor(floor(multiplyAddValue8) * 0.0625)));
    uint scalarValue11 = uint(int(fragmentScalarConstants1.packedValues[36u]));
    uint scalarValue12 = bitfieldInsert(productValue8, productValue9, int(16u), int(16u));
    uint scalarValue13 = bitfieldInsert(productValue10, scalarValue11, int(16u), int(16u));
    uint productValue11 = productValue8 * 1540483477u;
    uint productValue12 = productValue9 * 1540483477u;
    uint productValue13 = productValue10 * 1540483477u;
    uint productValue14 = scalarValue11 * 1540483477u;
    uint bitwiseValue10 = ((productValue14 ^ (productValue14 >> 24u)) * 1540483477u) ^ (((((productValue13 >> 24u) ^ productValue13) * 1540483477u) ^ ((((productValue12 ^ (productValue12 >> 24u)) * 1540483477u) ^ ((((productValue11 ^ (productValue11 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u)) * 1540483477u)) * 1540483477u);
    uint bitwiseValue11 = ((bitwiseValue10 >> 13u) ^ bitwiseValue10) * 1540483477u;
    uint bitwiseValue12 = (bitwiseValue11 >> 15u) ^ bitwiseValue11;
    uint bitwiseValue13 = (bitwiseValue12 ^ (bitwiseValue12 >> 16u)) & 65535u;
    bool comparisonValue7 = bitwiseValue13 != 0u;
    uint bitwiseValue14 = bitwiseValue13 | 1u;
    uint sumValue8 = uint(fragmentScalarConstants1.packedValues[32u]) - 1u;
    uint comparisonValue8 = (comparisonValue7 ? bitwiseValue13 : bitwiseValue14) & sumValue8;
    uint comparisonValue4;
    uint comparisonValue5;
    uint bitwiseValue5;
    uint sumValue4;
    uint intermediateValue23;
    uint intermediateValue24;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(rasterColorTexture, rasterColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = (sampledTextureValue.x * fragmentVectorConstants1.packedValues[6u].w) + fragmentVectorConstants1.packedValues[7u].w;
    float quotientValue = (((varyingTexCoord0.x * 2.0) + (-1.0)) * fragmentVectorConstants1.packedValues[4u].x) / productValue;
    float quotientValue1 = ((((1.0 - varyingTexCoord0.y) * 2.0) + (-1.0)) * fragmentVectorConstants1.packedValues[5u].y) / productValue;
    float quotientValue2 = fragmentVectorConstants1.packedValues[7u].z / productValue;
    vec4 sampledTextureValue1 = texture(sampler2D(normalTexture, normalSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float sumValue = 1.0 - abs(scalarValue);
    float scalarValue2 = abs(scalarValue1);
    float sumValue1 = sumValue - scalarValue2;
    bool conditionValue = sumValue1 < 0.0;
    float comparisonValue = conditionValue ? ((1.0 - scalarValue2) * ((scalarValue < 0.0) ? (-1.0) : 1.0)) : scalarValue;
    float comparisonValue1 = conditionValue ? (((scalarValue1 < 0.0) ? (-1.0) : 1.0) * sumValue) : scalarValue1;
    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue, comparisonValue1, sumValue1), vec3(comparisonValue, comparisonValue1, sumValue1))) * 0.20000000298023223876953125;
    float multiplyAddValue = ((fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[1u].x, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x) - fragmentVectorConstants1.packedValues[10u].x) + (inverseLengthValue * comparisonValue);
    float multiplyAddValue1 = ((fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[1u].y, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y) - fragmentVectorConstants1.packedValues[10u].y) + (inverseLengthValue * comparisonValue1);
    float multiplyAddValue2 = ((fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[1u].z, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z) - fragmentVectorConstants1.packedValues[10u].z) + (inverseLengthValue * sumValue1);
    uint productValue1 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue))))) * 0.0625)));
    uint productValue2 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue1))))) * 0.0625)));
    uint productValue3 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue2))))) * 0.0625)));
    uint scalarValue3 = uint(int(fragmentVectorConstants1.packedValues[9u].x));
    uint bitwiseValue = (productValue2 << 16u) | (productValue1 & 65535u);
    uint bitwiseValue1 = (scalarValue3 << 16u) | (productValue3 & 65535u);
    uint productValue4 = productValue1 * 1540483477u;
    uint productValue5 = productValue2 * 1540483477u;
    uint productValue6 = productValue3 * 1540483477u;
    uint productValue7 = scalarValue3 * 1540483477u;
    uint bitwiseValue2 = (((((((((productValue4 >> 24u) ^ productValue4) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue5 >> 24u) ^ productValue5) * 1540483477u)) * 1540483477u) ^ (((productValue6 >> 24u) ^ productValue6) * 1540483477u)) * 1540483477u) ^ (((productValue7 >> 24u) ^ productValue7) * 1540483477u);
    uint bitwiseValue3 = ((bitwiseValue2 >> 13u) ^ bitwiseValue2) * 1540483477u;
    uint bitwiseValue4 = (bitwiseValue3 >> 15u) ^ bitwiseValue3;
    uint bitwiseValue6 = bitwiseValue4 >> 16u;
    uint bitwiseValue8 = bitwiseValue4 & 65535u;
    uint comparisonValue2 = uint(bitwiseValue8 == bitwiseValue6) | (bitwiseValue8 ^ bitwiseValue6);
    uint sumValue2 = uint(fragmentVectorConstants1.packedValues[8u].x) + 4294967295u;
    bool intermediateValue8;
    uint scalarValue4 = comparisonValue2;
#endif
    uint scalarValue5 = 0u;
    uint scalarValue6 = 0u;
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue14 = comparisonValue8;
    uint scalarValue15 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint sampledTextureValue2;
    uint bitwiseValue7;
#endif
    for (;;)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        if (int(scalarValue15) >= int(8u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        bitwiseValue7 = scalarValue4 & sumValue2;
        uint sampledTextureValue3 = texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 2u)).x & 65535u;
        bool sampledTextureValue4 = (texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 1u)).x == bitwiseValue1) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue7 * 4u)).x == bitwiseValue) && (sampledTextureValue3 == comparisonValue2));
        sampledTextureValue2 = sampledTextureValue4 ? texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 3u)).x : scalarValue5;
        if ((sampledTextureValue3 == 0u) || sampledTextureValue4)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue23 = scalarValue5;
            intermediateValue24 = scalarValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue8 = sampledTextureValue4;
#endif
            break;
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint bitwiseValue15 = intermediateValue2.packedValues[scalarValue14].z & 65535u;
        bool comparisonValue9 = ((((bitwiseValue15 == bitwiseValue14) && (!comparisonValue7)) || (comparisonValue7 && (bitwiseValue13 == bitwiseValue15))) && (scalarValue12 == intermediateValue2.packedValues[scalarValue14].x)) && (scalarValue13 == intermediateValue2.packedValues[scalarValue14].y);
        bool comparisonValue10 = scalarValue5 != 0u;
        comparisonValue5 = (comparisonValue10 || (!comparisonValue9)) ? scalarValue6 : intermediateValue2.packedValues[scalarValue14].w;
        comparisonValue4 = comparisonValue9 ? 4294967295u : scalarValue5;
        bitwiseValue5 = sumValue8 & (scalarValue14 + 1u);
        bool comparisonValue11 = (bitwiseValue15 == 0u) || comparisonValue9;
        if (comparisonValue11 || ((!comparisonValue11) && comparisonValue10))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        else
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue23 = comparisonValue4;
            intermediateValue24 = comparisonValue5;
            break;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint sumValue3 = scalarValue6 + 1u;
            if (int(sumValue3) < int(8u))
            {
                scalarValue4 = bitwiseValue7 + 1u;
                scalarValue5 = sampledTextureValue2;
                scalarValue6 = sumValue3;
                continue;
            }
            else
            {
                intermediateValue8 = false;
                break;
            }
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        sumValue4 = scalarValue15 + 1u;
        scalarValue5 = comparisonValue4;
        scalarValue6 = comparisonValue5;
        scalarValue14 = bitwiseValue5;
        scalarValue15 = sumValue4;
        continue;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint multiplyAddValue9 = (intermediateValue24 >> 2u) + (bitfieldInsert(0u, uint(floor(fma(-floor(multiplyAddValue6 * 0.0625), 16.0, multiplyAddValue6))), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(floor(fma(-floor(multiplyAddValue8 * 0.0625), 16.0, multiplyAddValue8))), int(4u), int(4u)), uint(floor(fma(-floor(multiplyAddValue7 * 0.0625), 16.0, multiplyAddValue7))), int(0u), int(4u)));
    float bitwiseValue16 = rdEvaluateFloatExpression((intermediateValue3.packedValues[multiplyAddValue9] >> 24u) & 255u) * 0.0039215688593685626983642578125;
    bool comparisonValue12 = intermediateValue3.packedValues[multiplyAddValue9] != 0u;
    fragmentColor0.x = exp2(log2(comparisonValue12 ? uintBitsToFloat(floatBitsToUint((bitwiseValue16 * (rdEvaluateFloatExpression(intermediateValue3.packedValues[multiplyAddValue9] & 255u) * 0.0039215688593685626983642578125)) * 6.0) & intermediateValue23) : 0.0) * 0.4545454680919647216796875);
    fragmentColor0.y = exp2(log2(comparisonValue12 ? uintBitsToFloat(floatBitsToUint((bitwiseValue16 * (rdEvaluateFloatExpression((intermediateValue3.packedValues[multiplyAddValue9] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) & intermediateValue23) : 0.0) * 0.4545454680919647216796875);
    fragmentColor0.z = exp2(log2(comparisonValue12 ? uintBitsToFloat(floatBitsToUint((bitwiseValue16 * (rdEvaluateFloatExpression((intermediateValue3.packedValues[multiplyAddValue9] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) & intermediateValue23) : 0.0) * 0.4545454680919647216796875);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    if (intermediateValue8)
    {
        uvec4 sampledTextureValue5 = texelFetch(voxelBuffer, int(((((uint(floor(multiplyAddValue - (floor(multiplyAddValue * 0.0625) * 16.0))) << 8u) & 3840u) | (uint(floor(multiplyAddValue1 - (floor(multiplyAddValue1 * 0.0625) * 16.0))) & 15u)) | ((uint(floor(multiplyAddValue2 - (floor(multiplyAddValue2 * 0.0625) * 16.0))) << 4u) & 240u)) + (sampledTextureValue2 >> 2u)));
        uint scalarValue7 = sampledTextureValue5.x;
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (scalarValue7 == 0u)
        {
            branchMergedValue = 0.0;
            branchMergedValue1 = 0.0;
            branchMergedValue2 = 0.0;
        }
        else
        {
            float bitwiseValue9 = float(scalarValue7 >> 24u) * 9.2272217443678528070449829101562e-05;
            branchMergedValue = bitwiseValue9 * float(scalarValue7 & 255u);
            branchMergedValue1 = bitwiseValue9 * float((scalarValue7 >> 8u) & 255u);
            branchMergedValue2 = bitwiseValue9 * float((scalarValue7 >> 16u) & 255u);
        }
        intermediateValue10 = branchMergedValue;
        intermediateValue11 = branchMergedValue1;
        intermediateValue12 = branchMergedValue2;
    }
    else
    {
        intermediateValue10 = 0.0;
        intermediateValue11 = 0.0;
        intermediateValue12 = 0.0;
    }
    fragmentColor0.x = exp2(log2(intermediateValue10) * 0.4545454680919647216796875);
    fragmentColor0.y = exp2(log2(intermediateValue11) * 0.4545454680919647216796875);
    fragmentColor0.z = exp2(log2(intermediateValue12) * 0.4545454680919647216796875);
#endif
    fragmentColor0.w = 1.0;
}
