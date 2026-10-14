#version 460
#extension GL_GOOGLE_include_directive : require
// CombineVoxelLighting / Combine / compute forward pipeline.
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
#endif
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/CombineVoxelLighting/ComputeBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    bool conditionValue1 = uint(computeScalarConstants0.packedValues[12u]) > gl_GlobalInvocationID.y;
    uint productValue22 = gl_GlobalInvocationID.y * 4u;
    uint sampledTextureValue24 = conditionValue1 ? texelFetch(intermediateValue, int(gl_GlobalInvocationID.y * 4u)).x : 0u;
    uint sampledTextureValue25 = conditionValue1 ? texelFetch(intermediateValue, int((gl_GlobalInvocationID.y * 4u) + 1u)).x : 0u;
    uint sampledTextureValue26 = conditionValue1 ? texelFetch(intermediateValue, int((gl_GlobalInvocationID.y * 4u) + 2u)).x : 0u;
    uint intermediateValue11;
    uint intermediateValue13;
    uint intermediateValue15;
    uint bitwiseValue16;
    uint bitwiseValue17;
    uint bitwiseValue18;
    uint intermediateValue17;
    if (conditionValue1)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool conditionValue = gl_GlobalInvocationID.y < uint(computeVectorConstants0.packedValues[3u].x);
    uint sampledTextureValue;
    uint sampledTextureValue1;
    uint sampledTextureValue2;
    if (conditionValue)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint scalarValue31 = bitfieldInsert(sampledTextureValue24, sampledTextureValue25, int(16u), int(16u));
        uint bitwiseValue67 = sampledTextureValue26 & 65535u;
        uint productValue23 = sampledTextureValue24 * 1540483477u;
        uint productValue24 = sampledTextureValue25 * 1540483477u;
        uint productValue25 = sampledTextureValue26 * 1540483477u;
        uint bitwiseValue68 = (((((((productValue23 ^ (productValue23 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue24 >> 24u) ^ productValue24) * 1540483477u)) * 1540483477u) ^ (((productValue25 >> 24u) ^ productValue25) * 1540483477u)) * 1540483477u;
        uint bitwiseValue69 = bitwiseValue68 ^ 2586284774u;
        uint bitwiseValue70 = bitwiseValue68 ^ 2418085729u;
        uint bitwiseValue71 = (bitwiseValue68 ^ (bitwiseValue68 >> 13u)) * 1540483477u;
        uint bitwiseValue72 = ((bitwiseValue69 >> 13u) ^ bitwiseValue69) * 1540483477u;
        uint bitwiseValue73 = (bitwiseValue70 ^ (bitwiseValue70 >> 13u)) * 1540483477u;
        uint bitwiseValue74 = bitwiseValue71 ^ (bitwiseValue71 >> 15u);
        uint bitwiseValue75 = bitwiseValue72 ^ (bitwiseValue72 >> 15u);
        uint bitwiseValue76 = bitwiseValue73 ^ (bitwiseValue73 >> 15u);
        uint bitwiseValue77 = (bitwiseValue74 ^ (bitwiseValue74 >> 16u)) & 65535u;
        uint bitwiseValue78 = ((bitwiseValue75 >> 16u) ^ bitwiseValue75) & 65535u;
        uint bitwiseValue79 = ((bitwiseValue76 >> 16u) ^ bitwiseValue76) & 65535u;
        bool comparisonValue12 = bitwiseValue77 != 0u;
        bool comparisonValue13 = bitwiseValue78 != 0u;
        bool comparisonValue14 = bitwiseValue79 != 0u;
        uint bitwiseValue80 = bitwiseValue77 | 1u;
        uint bitwiseValue81 = bitwiseValue78 | 1u;
        uint bitwiseValue82 = bitwiseValue79 | 1u;
        uint sumValue19 = uint(computeScalarConstants0.packedValues[4u]) - 1u;
        uint comparisonValue15 = (comparisonValue12 ? bitwiseValue77 : bitwiseValue80) & sumValue19;
        uint comparisonValue16 = sumValue19 & (comparisonValue13 ? bitwiseValue78 : bitwiseValue81);
        uint comparisonValue17 = sumValue19 & (comparisonValue14 ? bitwiseValue79 : bitwiseValue82);
        uint comparisonValue6;
        uint comparisonValue7;
        uint bitwiseValue19;
        uint sumValue1;
        uint intermediateValue12;
        uint intermediateValue30;
        uint scalarValue2 = 0u;
        uint scalarValue3 = 0u;
        uint scalarValue32 = comparisonValue15;
        uint scalarValue5 = 0u;
        for (;;)
        {
            if (int(scalarValue5) >= int(8u))
            {
                intermediateValue30 = scalarValue3;
                intermediateValue12 = scalarValue2;
                break;
            }
            uint productValue26 = scalarValue32 * 4u;
            uvec4 sampledTextureValue27 = uvec4(texelFetch(intermediateValue1, int(productValue26)).x, texelFetch(intermediateValue1, int(productValue26 + 1u)).x, texelFetch(intermediateValue1, int(productValue26 + 2u)).x, texelFetch(intermediateValue1, int(productValue26 + 3u)).x);
            uint bitwiseValue83 = sampledTextureValue27.z & 65535u;
            bool comparisonValue20 = ((((bitwiseValue83 == bitwiseValue80) && (!comparisonValue12)) || (comparisonValue12 && (bitwiseValue77 == bitwiseValue83))) && (scalarValue31 == sampledTextureValue27.x)) && (bitwiseValue67 == sampledTextureValue27.y);
            bool comparisonValue21 = scalarValue2 != 0u;
            comparisonValue7 = (comparisonValue21 || (!comparisonValue20)) ? scalarValue3 : sampledTextureValue27.w;
            comparisonValue6 = comparisonValue20 ? 4294967295u : scalarValue2;
            bitwiseValue19 = sumValue19 & (scalarValue32 + 1u);
            bool comparisonValue22 = comparisonValue20 || (bitwiseValue83 == 0u);
            if (((!comparisonValue22) && comparisonValue21) || comparisonValue22)
            {
                intermediateValue30 = comparisonValue7;
                intermediateValue12 = comparisonValue6;
                break;
            }
            sumValue1 = scalarValue5 + 1u;
            scalarValue2 = comparisonValue6;
            scalarValue3 = comparisonValue7;
            scalarValue32 = bitwiseValue19;
            scalarValue5 = sumValue1;
            continue;
        }
        uint scalarValue33 = bitfieldInsert(65536u, sampledTextureValue26, int(0u), int(16u));
        uint comparisonValue18;
        uint comparisonValue19;
        uint bitwiseValue32;
        uint sumValue8;
        uint intermediateValue16;
        uint intermediateValue46;
        uint scalarValue6 = 0u;
        uint scalarValue8 = 0u;
        uint scalarValue34 = comparisonValue16;
        uint scalarValue9 = 0u;
        for (;;)
        {
            if (int(scalarValue9) >= int(8u))
            {
                intermediateValue16 = scalarValue6;
                intermediateValue46 = scalarValue8;
                break;
            }
            uint productValue27 = scalarValue34 * 4u;
            uvec4 sampledTextureValue28 = uvec4(texelFetch(intermediateValue1, int(productValue27)).x, texelFetch(intermediateValue1, int(productValue27 + 1u)).x, texelFetch(intermediateValue1, int(productValue27 + 2u)).x, texelFetch(intermediateValue1, int(productValue27 + 3u)).x);
            uint bitwiseValue84 = sampledTextureValue28.z & 65535u;
            bool comparisonValue23 = (scalarValue33 == sampledTextureValue28.y) && ((((!comparisonValue13) && (bitwiseValue81 == bitwiseValue84)) || ((bitwiseValue84 == bitwiseValue78) && comparisonValue13)) && (scalarValue31 == sampledTextureValue28.x));
            bool comparisonValue26 = scalarValue6 != 0u;
            comparisonValue19 = (comparisonValue26 || (!comparisonValue23)) ? scalarValue8 : sampledTextureValue28.w;
            comparisonValue18 = comparisonValue23 ? 4294967295u : scalarValue6;
            bitwiseValue32 = sumValue19 & (scalarValue34 + 1u);
            bool comparisonValue28 = (bitwiseValue84 == 0u) || comparisonValue23;
            if (comparisonValue28 || (comparisonValue26 && (!comparisonValue28)))
            {
                intermediateValue16 = comparisonValue18;
                intermediateValue46 = comparisonValue19;
                break;
            }
            sumValue8 = scalarValue9 + 1u;
            scalarValue6 = comparisonValue18;
            scalarValue8 = comparisonValue19;
            scalarValue34 = bitwiseValue32;
            scalarValue9 = sumValue8;
            continue;
        }
        uint sumValue20 = bitwiseValue67 + 131072u;
        uint comparisonValue24;
        uint comparisonValue25;
        uint bitwiseValue38;
        uint sumValue11;
        uint intermediateValue14;
        uint intermediateValue62;
        uint scalarValue12 = 0u;
        uint scalarValue13 = 0u;
        uint scalarValue35 = comparisonValue17;
        uint scalarValue20 = 0u;
        for (;;)
        {
            if (int(scalarValue20) >= int(8u))
            {
                intermediateValue14 = scalarValue12;
                intermediateValue62 = scalarValue13;
                break;
            }
            uint productValue28 = scalarValue35 * 4u;
            uvec4 sampledTextureValue29 = uvec4(texelFetch(intermediateValue1, int(productValue28)).x, texelFetch(intermediateValue1, int(productValue28 + 1u)).x, texelFetch(intermediateValue1, int(productValue28 + 2u)).x, texelFetch(intermediateValue1, int(productValue28 + 3u)).x);
            uint bitwiseValue85 = sampledTextureValue29.z & 65535u;
            bool comparisonValue29 = (sumValue20 == sampledTextureValue29.y) && ((((bitwiseValue85 == bitwiseValue79) && comparisonValue14) || ((bitwiseValue85 == bitwiseValue82) && (!comparisonValue14))) && (scalarValue31 == sampledTextureValue29.x));
            bool comparisonValue30 = scalarValue12 != 0u;
            comparisonValue25 = (comparisonValue30 || (!comparisonValue29)) ? scalarValue13 : sampledTextureValue29.w;
            comparisonValue24 = comparisonValue29 ? 4294967295u : scalarValue12;
            bitwiseValue38 = sumValue19 & (scalarValue35 + 1u);
            bool comparisonValue31 = (bitwiseValue85 == 0u) || comparisonValue29;
            if ((comparisonValue30 && (!comparisonValue31)) || comparisonValue31)
            {
                intermediateValue14 = comparisonValue24;
                intermediateValue62 = comparisonValue25;
                break;
            }
            sumValue11 = scalarValue20 + 1u;
            scalarValue12 = comparisonValue24;
            scalarValue13 = comparisonValue25;
            scalarValue35 = bitwiseValue38;
            scalarValue20 = sumValue11;
            continue;
        }
        intermediateValue11 = intermediateValue12;
        intermediateValue13 = intermediateValue14;
        intermediateValue15 = intermediateValue16;
        bitwiseValue16 = intermediateValue30 >> 2u;
        bitwiseValue17 = intermediateValue46 >> 2u;
        bitwiseValue18 = intermediateValue62 >> 2u;
        intermediateValue17 = uint(computeScalarConstants0.packedValues[16u]);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint bitwiseValue = gl_GlobalInvocationID.y << 2u;
        sampledTextureValue = texelFetch(dirtyVolumeKeys, int(gl_GlobalInvocationID.y * 4u)).x;
        sampledTextureValue1 = texelFetch(dirtyVolumeKeys, int((gl_GlobalInvocationID.y * 4u) + 1u)).x;
        sampledTextureValue2 = texelFetch(dirtyVolumeKeys, int((gl_GlobalInvocationID.y * 4u) + 2u)).x;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue11 = 0u;
        intermediateValue13 = 0u;
        intermediateValue15 = 0u;
        bitwiseValue16 = 0u;
        bitwiseValue17 = 0u;
        bitwiseValue18 = 0u;
        intermediateValue17 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        sampledTextureValue = 0u;
        sampledTextureValue1 = 0u;
        sampledTextureValue2 = 0u;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    if (conditionValue1 && (min(intermediateValue17, 32u) > gl_LocalInvocationIndex))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint bitwiseValue9;
    uint bitwiseValue10;
    uint bitwiseValue11;
    uint intermediateValue3;
    uint intermediateValue4;
    uint intermediateValue5;
    uint intermediateValue6;
    if (conditionValue)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint scalarValue36 = bitfieldInsert(sampledTextureValue24, sampledTextureValue25, int(16u), int(16u));
        uint scalarValue37 = bitfieldInsert(sampledTextureValue26, gl_LocalInvocationIndex, int(16u), int(16u));
        uint productValue29 = sampledTextureValue24 * 1540483477u;
        uint productValue30 = sampledTextureValue25 * 1540483477u;
        uint productValue31 = sampledTextureValue26 * 1540483477u;
        uint productValue6 = gl_LocalInvocationIndex * 1540483477u;
        uint bitwiseValue86 = ((productValue6 ^ (productValue6 >> 24u)) * 1540483477u) ^ ((((((((productValue29 ^ (productValue29 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ ((productValue30 ^ (productValue30 >> 24u)) * 1540483477u)) * 1540483477u) ^ ((productValue31 ^ (productValue31 >> 24u)) * 1540483477u)) * 1540483477u);
        uint bitwiseValue87 = (bitwiseValue86 ^ (bitwiseValue86 >> 13u)) * 1540483477u;
        uint bitwiseValue88 = bitwiseValue87 ^ (bitwiseValue87 >> 15u);
        uint bitwiseValue89 = (bitwiseValue88 ^ (bitwiseValue88 >> 16u)) & 65535u;
        bool comparisonValue32 = bitwiseValue89 != 0u;
        uint bitwiseValue90 = bitwiseValue89 | 1u;
        uint sumValue21 = uint(computeScalarConstants0.packedValues[0u]) - 1u;
        uint comparisonValue33 = (comparisonValue32 ? bitwiseValue89 : bitwiseValue90) & sumValue21;
        uint comparisonValue10;
        uint comparisonValue11;
        uint bitwiseValue25;
        uint sumValue3;
        uint intermediateValue36;
        uint intermediateValue37;
        uint scalarValue23 = 0u;
        uint scalarValue24 = 0u;
        uint scalarValue38 = comparisonValue33;
        uint scalarValue28 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint bitwiseValue1 = (sampledTextureValue1 << 16u) | (sampledTextureValue & 65535u);
        uint bitwiseValue2 = sampledTextureValue2 & 65535u;
        uint productValue = sampledTextureValue * 1540483477u;
        uint productValue1 = sampledTextureValue1 * 1540483477u;
        uint productValue2 = sampledTextureValue2 * 1540483477u;
        uint bitwiseValue3 = ((((((((productValue >> 24u) ^ productValue) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue1 >> 24u) ^ productValue1) * 1540483477u)) * 1540483477u) ^ (((productValue2 >> 24u) ^ productValue2) * 1540483477u)) * 1540483477u;
        uint bitwiseValue4 = ((bitwiseValue3 >> 13u) ^ bitwiseValue3) * 1540483477u;
        uint bitwiseValue5 = (bitwiseValue4 >> 15u) ^ bitwiseValue4;
        uint bitwiseValue6 = bitwiseValue5 >> 16u;
        uint bitwiseValue7 = bitwiseValue5 & 65535u;
        uint comparisonValue = uint(bitwiseValue7 == bitwiseValue6) | (bitwiseValue7 ^ bitwiseValue6);
        uint scalarValue = uint(computeVectorConstants0.packedValues[1u].x);
        uint sumValue = scalarValue + 65535u;
        uint bitwiseValue8 = sumValue & comparisonValue;
        bool intermediateValue11;
        uint scalarValue1 = bitwiseValue8;
        uint scalarValue2 = 0u;
        uint scalarValue3 = 0u;
        uint sampledTextureValue3;
#endif
        for (;;)
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            if (int(scalarValue28) >= int(8u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint sampledTextureValue4 = texelFetch(gpuEntryBuffer, int((scalarValue1 * 4u) + 2u)).x & 65535u;
            bool sampledTextureValue5 = (texelFetch(gpuEntryBuffer, int((scalarValue1 * 4u) + 1u)).x == bitwiseValue2) && ((texelFetch(gpuEntryBuffer, int(scalarValue1 * 4u)).x == bitwiseValue1) && (sampledTextureValue4 == comparisonValue));
            sampledTextureValue3 = sampledTextureValue5 ? texelFetch(gpuEntryBuffer, int((scalarValue1 * 4u) + 3u)).x : scalarValue2;
            if ((sampledTextureValue4 == 0u) || sampledTextureValue5)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue36 = scalarValue23;
                intermediateValue37 = scalarValue24;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue11 = sampledTextureValue5;
#endif
                break;
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            uint productValue32 = scalarValue38 * 4u;
            uvec4 sampledTextureValue30 = uvec4(texelFetch(intermediateValue3, int(productValue32)).x, texelFetch(intermediateValue3, int(productValue32 + 1u)).x, texelFetch(intermediateValue3, int(productValue32 + 2u)).x, texelFetch(intermediateValue3, int(productValue32 + 3u)).x);
            uint bitwiseValue91 = sampledTextureValue30.z & 65535u;
            bool comparisonValue37 = (((comparisonValue32 && (bitwiseValue89 == bitwiseValue91)) || ((bitwiseValue90 == bitwiseValue91) && (!comparisonValue32))) && (scalarValue36 == sampledTextureValue30.x)) && (scalarValue37 == sampledTextureValue30.y);
            bool comparisonValue38 = scalarValue23 != 0u;
            comparisonValue11 = ((!comparisonValue37) || comparisonValue38) ? scalarValue24 : sampledTextureValue30.w;
            comparisonValue10 = comparisonValue37 ? 4294967295u : scalarValue23;
            bitwiseValue25 = sumValue21 & (scalarValue38 + 1u);
            bool comparisonValue39 = comparisonValue37 || (bitwiseValue91 == 0u);
            if (comparisonValue39 || (comparisonValue38 && (!comparisonValue39)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            else
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue36 = comparisonValue10;
                intermediateValue37 = comparisonValue11;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                uint sumValue2 = scalarValue3 + 1u;
                if (int(sumValue2) < int(8u))
                {
                    scalarValue1 = (scalarValue1 + 1u) & (scalarValue + 4294967295u);
                    scalarValue2 = sampledTextureValue3;
                    scalarValue3 = sumValue2;
                    continue;
                }
                else
                {
                    intermediateValue11 = false;
                    break;
                }
            }
        }
        uint bitwiseValue12 = bitwiseValue2 | 65536u;
        uint bitwiseValue13 = bitwiseValue3 ^ 2586284774u;
        uint bitwiseValue14 = ((bitwiseValue13 >> 13u) ^ bitwiseValue13) * 1540483477u;
        uint bitwiseValue15 = (bitwiseValue14 >> 15u) ^ bitwiseValue14;
        uint bitwiseValue20 = bitwiseValue15 >> 16u;
        uint bitwiseValue21 = bitwiseValue15 & 65535u;
        uint comparisonValue1 = uint(bitwiseValue21 == bitwiseValue20) | (bitwiseValue21 ^ bitwiseValue20);
        uint bitwiseValue22 = sumValue & comparisonValue1;
        bool intermediateValue20;
        uint scalarValue4 = bitwiseValue22;
        uint scalarValue5 = 0u;
        uint scalarValue6 = 0u;
        uint sampledTextureValue9;
        for (;;)
        {
            uint sampledTextureValue7 = texelFetch(gpuEntryBuffer, int((scalarValue4 * 4u) + 2u)).x & 65535u;
            bool sampledTextureValue8 = (texelFetch(gpuEntryBuffer, int((scalarValue4 * 4u) + 1u)).x == bitwiseValue12) && ((texelFetch(gpuEntryBuffer, int(scalarValue4 * 4u)).x == bitwiseValue1) && (sampledTextureValue7 == comparisonValue1));
            sampledTextureValue9 = sampledTextureValue8 ? texelFetch(gpuEntryBuffer, int((scalarValue4 * 4u) + 3u)).x : scalarValue5;
            if ((sampledTextureValue7 == 0u) || sampledTextureValue8)
            {
                intermediateValue20 = sampledTextureValue8;
#endif
                break;
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            sumValue3 = scalarValue28 + 1u;
            scalarValue23 = comparisonValue10;
            scalarValue24 = comparisonValue11;
            scalarValue38 = bitwiseValue25;
            scalarValue28 = sumValue3;
            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            else
            {
                uint sumValue4 = scalarValue6 + 1u;
                if (int(sumValue4) < int(8u))
                {
                    scalarValue4 = (scalarValue4 + 1u) & (scalarValue + 4294967295u);
                    scalarValue5 = sampledTextureValue9;
                    scalarValue6 = sumValue4;
                    continue;
                }
                else
                {
                    intermediateValue20 = false;
                    break;
                }
            }
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue7[gl_LocalInvocationIndex] = (intermediateValue36 != 0u) ? (intermediateValue37 >> 2u) : 4294967295u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint bitwiseValue23 = bitwiseValue2 | 131072u;
        uint bitwiseValue24 = bitwiseValue3 ^ 2418085729u;
        uint bitwiseValue26 = ((bitwiseValue24 >> 13u) ^ bitwiseValue24) * 1540483477u;
        uint bitwiseValue27 = (bitwiseValue26 >> 15u) ^ bitwiseValue26;
        uint bitwiseValue28 = bitwiseValue27 >> 16u;
        uint bitwiseValue29 = bitwiseValue27 & 65535u;
        uint comparisonValue2 = uint(bitwiseValue29 == bitwiseValue28) | (bitwiseValue29 ^ bitwiseValue28);
        uint bitwiseValue30 = sumValue & comparisonValue2;
        bool intermediateValue28;
        uint scalarValue7 = bitwiseValue30;
        uint scalarValue8 = 0u;
        uint scalarValue9 = 0u;
        uint sampledTextureValue12;
        for (;;)
        {
            uint sampledTextureValue10 = texelFetch(gpuEntryBuffer, int((scalarValue7 * 4u) + 2u)).x & 65535u;
            bool sampledTextureValue11 = (texelFetch(gpuEntryBuffer, int((scalarValue7 * 4u) + 1u)).x == bitwiseValue23) && ((texelFetch(gpuEntryBuffer, int(scalarValue7 * 4u)).x == bitwiseValue1) && (sampledTextureValue10 == comparisonValue2));
            sampledTextureValue12 = sampledTextureValue11 ? texelFetch(gpuEntryBuffer, int((scalarValue7 * 4u) + 3u)).x : scalarValue8;
            if ((sampledTextureValue10 == 0u) || sampledTextureValue11)
            {
                intermediateValue28 = sampledTextureValue11;
                break;
            }
            else
            {
                uint sumValue5 = scalarValue9 + 1u;
                if (int(sumValue5) < int(8u))
                {
                    scalarValue7 = (scalarValue7 + 1u) & (scalarValue + 4294967295u);
                    scalarValue8 = sampledTextureValue12;
                    scalarValue9 = sumValue5;
                    continue;
                }
                else
                {
                    intermediateValue28 = false;
                    break;
                }
            }
        }
        bitwiseValue9 = sampledTextureValue3 >> 2u;
        bitwiseValue10 = sampledTextureValue9 >> 2u;
        bitwiseValue11 = sampledTextureValue12 >> 2u;
        intermediateValue3 = uint(intermediateValue11);
        intermediateValue4 = uint(intermediateValue20);
        intermediateValue5 = uint(intermediateValue28);
        intermediateValue6 = uint(computeVectorConstants0.packedValues[4u].x);
    }
    else
    {
        bitwiseValue9 = 0u;
        bitwiseValue10 = 0u;
        bitwiseValue11 = 0u;
        intermediateValue3 = 0u;
        intermediateValue4 = 0u;
        intermediateValue5 = 0u;
        intermediateValue6 = 0u;
    }
    if (conditionValue && (gl_LocalInvocationIndex < min(intermediateValue6, 32u)))
    {
        uint bitwiseValue31 = (sampledTextureValue1 << 16u) | (sampledTextureValue & 65535u);
        uint bitwiseValue33 = (sampledTextureValue2 & 65535u) | (gl_LocalInvocationIndex << 16u);
        uint productValue3 = sampledTextureValue * 1540483477u;
        uint productValue4 = sampledTextureValue1 * 1540483477u;
        uint productValue5 = sampledTextureValue2 * 1540483477u;
        uint productValue6 = gl_LocalInvocationIndex * 1540483477u;
        uint bitwiseValue34 = (((((((((productValue3 >> 24u) ^ productValue3) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue4 >> 24u) ^ productValue4) * 1540483477u)) * 1540483477u) ^ (((productValue5 >> 24u) ^ productValue5) * 1540483477u)) * 1540483477u) ^ (((productValue6 >> 24u) ^ productValue6) * 1540483477u);
        uint bitwiseValue35 = ((bitwiseValue34 >> 13u) ^ bitwiseValue34) * 1540483477u;
        uint bitwiseValue36 = (bitwiseValue35 >> 15u) ^ bitwiseValue35;
        uint bitwiseValue39 = bitwiseValue36 >> 16u;
        uint bitwiseValue40 = bitwiseValue36 & 65535u;
        uint comparisonValue3 = uint(bitwiseValue40 == bitwiseValue39) | (bitwiseValue40 ^ bitwiseValue39);
        uint scalarValue10 = uint(computeVectorConstants0.packedValues[0u].x);
        uint bitwiseValue41 = (scalarValue10 + 65535u) & comparisonValue3;
        bool intermediateValue19;
        uint scalarValue11 = bitwiseValue41;
        uint scalarValue12 = 0u;
        uint scalarValue13 = 0u;
        uint sampledTextureValue6;
        for (;;)
        {
            uint sampledTextureValue13 = texelFetch(transitioningGpuEntryBuffer, int((scalarValue11 * 4u) + 2u)).x & 65535u;
            bool sampledTextureValue14 = (texelFetch(transitioningGpuEntryBuffer, int((scalarValue11 * 4u) + 1u)).x == bitwiseValue33) && ((texelFetch(transitioningGpuEntryBuffer, int(scalarValue11 * 4u)).x == bitwiseValue31) && (sampledTextureValue13 == comparisonValue3));
            sampledTextureValue6 = sampledTextureValue14 ? texelFetch(transitioningGpuEntryBuffer, int((scalarValue11 * 4u) + 3u)).x : scalarValue12;
            if ((sampledTextureValue13 == 0u) || sampledTextureValue14)
            {
                intermediateValue19 = sampledTextureValue14;
                break;
            }
            else
            {
                uint sumValue6 = scalarValue13 + 1u;
                if (int(sumValue6) < int(8u))
                {
                    scalarValue11 = (scalarValue11 + 1u) & (scalarValue10 + 4294967295u);
                    scalarValue12 = sampledTextureValue6;
                    scalarValue13 = sumValue6;
                    continue;
                }
                else
                {
                    intermediateValue19 = false;
                    break;
                }
            }
        }
        intermediateValue[gl_LocalInvocationIndex] = intermediateValue19 ? (sampledTextureValue6 >> 2u) : 4294967295u;
#endif
    }
    barrier();
#if RD_PLATFORM == RD_PLATFORM_SM50
    if (!((!conditionValue1) || (conditionValue1 && (((~intermediateValue13) != 0u) || ((~intermediateValue11) != 0u)))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if (!(((intermediateValue3 == 0u) || (!conditionValue)) || (intermediateValue5 == 0u)))
#endif
    {
        uint scalarValue14 = gl_GlobalInvocationID.x << 4u;
        uint sumValue10 = min((scalarValue14 + 16u), 4096u);
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint bitwiseValue92 = intermediateValue17 >> 1u;
        float sumValue22 = 1.0 - computeScalarConstants0.packedValues[8u];
        uint scalarValue39 = bitfieldInsert(sampledTextureValue24, sampledTextureValue25, int(16u), int(16u));
        uint bitwiseValue93 = sampledTextureValue26 & 65535u;
        uint productValue33 = sampledTextureValue24 * 1540483477u;
        uint productValue34 = sampledTextureValue25 * 1540483477u;
        uint productValue35 = sampledTextureValue26 * 1540483477u;
        uint bitwiseValue94 = (((((((productValue33 ^ (productValue33 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ ((productValue34 ^ (productValue34 >> 24u)) * 1540483477u)) * 1540483477u) ^ ((productValue35 ^ (productValue35 >> 24u)) * 1540483477u)) * 1540483477u;
        uint sumValue23 = uint(computeScalarConstants0.packedValues[0u]) - 1u;
        uint sumValue7;
        uint scalarValue15 = scalarValue14;
        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        if (scalarValue14 < sumValue10)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            if (sumValue10 <= scalarValue15)
            {
                break;
            }
            uvec4 loadedBufferValue2 = imageLoad(intermediateValue5, int(bitwiseValue16 + scalarValue15));
            uint scalarValue40 = loadedBufferValue2.x;
            float bitwiseValue95 = rdEvaluateFloatExpression((scalarValue40 >> 24u) & 255u) * 0.0039215688593685626983642578125;
            uvec4 loadedBufferValue3 = imageLoad(intermediateValue5, int(bitwiseValue17 + scalarValue15));
            uint scalarValue41 = loadedBufferValue3.x;
            float bitwiseValue96 = rdEvaluateFloatExpression((scalarValue41 >> 16u) & 255u) * 0.0039215688593685626983642578125;
            float bitwiseValue97 = rdEvaluateFloatExpression((scalarValue41 >> 24u) & 255u) * 0.0039215688593685626983642578125;
            uint reinterpretedBits = floatBitsToUint(bitwiseValue96);
            bool comparisonValue40 = scalarValue41 != 0u;
            float intermediateValue42;
            float intermediateValue43;
            float intermediateValue44;
            intermediateValue42 = 0.0;
            intermediateValue43 = 0.0;
            intermediateValue44 = 0.0;
            float multiplyAddValue;
            float multiplyAddValue1;
            float multiplyAddValue2;
            uint sumValue9;
            uint intermediateValue41;
            uint scalarValue42 = reinterpretedBits;
            uint scalarValue29 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint bitwiseValue42 = intermediateValue6 >> 1u;
            float intermediateValue33;
            float intermediateValue34;
            float intermediateValue35;
            float intermediateValue25;
            float intermediateValue26;
            float intermediateValue27;
            float intermediateValue29;
            float intermediateValue30;
            float intermediateValue31;
            uint scalarValue15 = scalarValue14;
            uint loadedBufferValue;
            bool comparisonValue4;
#endif
            for (;;)
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                if (bitwiseValue92 <= scalarValue29)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                loadedBufferValue = imageLoad(voxelBuffer, int(scalarValue15 + bitwiseValue9)).x;
                comparisonValue4 = loadedBufferValue == 0u;
                if (comparisonValue4)
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    break;
                }
                uint bitwiseValue98 = scalarValue29 << 1u;
                uint scalarValue43 = bitfieldInsert(1u, scalarValue29, int(1u), int(31u));
                bool conditionValue2 = bitwiseValue98 < 32u;
                uint intermediateValue53;
                uint comparisonValue27;
                if (conditionValue2)
                {
                    intermediateValue53 = intermediateValue7[bitwiseValue98];
                    comparisonValue27 = (intermediateValue7[bitwiseValue98] != 4294967295u) ? 4294967295u : 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    intermediateValue25 = 0.0;
                    intermediateValue26 = 0.0;
                    intermediateValue27 = 0.0;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue53 = 0u;
                    comparisonValue27 = scalarValue42;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float bitwiseValue43 = float(loadedBufferValue >> 24u) * 9.2272217443678528070449829101562e-05;
                    intermediateValue25 = bitwiseValue43 * float(loadedBufferValue & 255u);
                    intermediateValue26 = bitwiseValue43 * float((loadedBufferValue >> 8u) & 255u);
                    intermediateValue27 = bitwiseValue43 * float((loadedBufferValue >> 16u) & 255u);
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                uint bitwiseValue45;
                if (!conditionValue2)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                if (intermediateValue4 == 0u)
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    uint bitwiseValue99 = bitwiseValue93 + (bitwiseValue98 << 16u);
                    uint productValue36 = scalarValue29 * 3080966954u;
                    uint bitwiseValue100 = ((productValue36 ^ (productValue36 >> 24u)) * 1540483477u) ^ bitwiseValue94;
                    uint bitwiseValue101 = ((bitwiseValue100 >> 13u) ^ bitwiseValue100) * 1540483477u;
                    uint bitwiseValue102 = bitwiseValue101 ^ (bitwiseValue101 >> 15u);
                    uint bitwiseValue103 = (bitwiseValue102 ^ (bitwiseValue102 >> 16u)) & 65535u;
                    bool comparisonValue41 = bitwiseValue103 != 0u;
                    uint bitwiseValue104 = bitwiseValue103 | 1u;
                    uint comparisonValue42 = sumValue23 & (comparisonValue41 ? bitwiseValue103 : bitwiseValue104);
                    uint comparisonValue34;
                    uint comparisonValue35;
                    uint bitwiseValue49;
                    uint sumValue12;
                    uint intermediateValue54;
                    uint intermediateValue71;
                    uint scalarValue44 = 0u;
                    uint scalarValue45 = 0u;
                    uint scalarValue46 = comparisonValue42;
                    uint scalarValue47 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    intermediateValue29 = 0.0;
                    intermediateValue30 = 0.0;
                    intermediateValue31 = 0.0;
                }
                else
                {
                    uvec4 loadedBufferValue1 = imageLoad(voxelBuffer, int(scalarValue15 + bitwiseValue10));
                    uint scalarValue16 = loadedBufferValue1.x;
                    float branchMergedValue6;
                    float branchMergedValue8;
                    float branchMergedValue9;
                    if (scalarValue16 == 0u)
                    {
                        branchMergedValue6 = 0.0;
                        branchMergedValue8 = 0.0;
                        branchMergedValue9 = 0.0;
                    }
                    else
                    {
                        float bitwiseValue44 = float(scalarValue16 >> 24u) * 9.2272217443678528070449829101562e-05;
                        branchMergedValue6 = bitwiseValue44 * float((scalarValue16 >> 16u) & 255u);
                        branchMergedValue8 = bitwiseValue44 * float((scalarValue16 >> 8u) & 255u);
                        branchMergedValue9 = bitwiseValue44 * float(scalarValue16 & 255u);
                    }
                    intermediateValue29 = branchMergedValue9;
                    intermediateValue30 = branchMergedValue8;
                    intermediateValue31 = branchMergedValue6;
                }
                float branchMergedValue;
                float branchMergedValue2;
                float branchMergedValue3;
                if (bitwiseValue42 == 0u)
                {
                    branchMergedValue = 0.0;
                    branchMergedValue2 = 0.0;
                    branchMergedValue3 = 0.0;
                }
                else
                {
                    float productValue7;
                    float productValue8;
                    float productValue9;
                    float intermediateValue58;
                    float intermediateValue59;
                    float intermediateValue60;
                    float intermediateValue48;
                    float intermediateValue49;
                    float intermediateValue50;
                    float scalarValue17 = 0.0;
                    float scalarValue18 = 0.0;
                    float scalarValue19 = 0.0;
                    uint scalarValue20 = 0u;
                    uint bitwiseValue37;
                    uint bitwiseValue38;
                    bool intermediateValue40;
#endif
                    for (;;)
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        if (int(scalarValue47) >= int(8u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        bitwiseValue37 = scalarValue20 << 1u;
                        bitwiseValue38 = bitwiseValue37 | 1u;
                        intermediateValue40 = bitwiseValue37 < 32u;
                        bool comparisonValue6;
                        uint intermediateValue43;
                        if (intermediateValue40)
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            intermediateValue54 = scalarValue44;
                            intermediateValue71 = scalarValue45;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            comparisonValue6 = intermediateValue[bitwiseValue37] != 4294967295u;
                            intermediateValue43 = intermediateValue[bitwiseValue37];
                        }
                        else
                        {
                            uint bitwiseValue46 = (sampledTextureValue1 << 16u) | (sampledTextureValue & 65535u);
                            uint bitwiseValue47 = (scalarValue20 << 17u) | (sampledTextureValue2 & 65535u);
                            uint productValue10 = sampledTextureValue * 1540483477u;
                            uint productValue11 = sampledTextureValue1 * 1540483477u;
                            uint productValue12 = sampledTextureValue2 * 1540483477u;
                            uint productValue13 = scalarValue20 * 3080966954u;
                            uint bitwiseValue48 = (((productValue13 >> 24u) ^ productValue13) * 1540483477u) ^ (((((((((productValue10 >> 24u) ^ productValue10) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue11 >> 24u) ^ productValue11) * 1540483477u)) * 1540483477u) ^ (((productValue12 >> 24u) ^ productValue12) * 1540483477u)) * 1540483477u);
                            uint bitwiseValue50 = ((bitwiseValue48 >> 13u) ^ bitwiseValue48) * 1540483477u;
                            uint bitwiseValue51 = (bitwiseValue50 >> 15u) ^ bitwiseValue50;
                            uint bitwiseValue52 = bitwiseValue51 >> 16u;
                            uint bitwiseValue53 = bitwiseValue51 & 65535u;
                            uint comparisonValue5 = uint(bitwiseValue53 == bitwiseValue52) | (bitwiseValue53 ^ bitwiseValue52);
                            uint scalarValue21 = uint(computeVectorConstants0.packedValues[0u].x);
                            uint bitwiseValue54 = (scalarValue21 + 65535u) & comparisonValue5;
                            bool intermediateValue42;
                            uint scalarValue22 = bitwiseValue54;
                            uint scalarValue23 = 0u;
                            uint scalarValue24 = 0u;
                            uint sampledTextureValue15;
                            for (;;)
                            {
                                uint sampledTextureValue16 = texelFetch(transitioningGpuEntryBuffer, int((scalarValue22 * 4u) + 2u)).x & 65535u;
                                bool sampledTextureValue17 = (texelFetch(transitioningGpuEntryBuffer, int((scalarValue22 * 4u) + 1u)).x == bitwiseValue47) && ((texelFetch(transitioningGpuEntryBuffer, int(scalarValue22 * 4u)).x == bitwiseValue46) && (sampledTextureValue16 == comparisonValue5));
                                sampledTextureValue15 = sampledTextureValue17 ? texelFetch(transitioningGpuEntryBuffer, int((scalarValue22 * 4u) + 3u)).x : scalarValue23;
                                if ((sampledTextureValue16 == 0u) || sampledTextureValue17)
                                {
                                    intermediateValue42 = sampledTextureValue17;
                                    break;
                                }
                                else
                                {
                                    uint sumValue14 = scalarValue24 + 1u;
                                    if (int(sumValue14) < int(8u))
                                    {
                                        scalarValue22 = (scalarValue22 + 1u) & (scalarValue21 + 4294967295u);
                                        scalarValue23 = sampledTextureValue15;
                                        scalarValue24 = sumValue14;
                                        continue;
                                    }
                                    else
                                    {
                                        intermediateValue42 = false;
                                        break;
                                    }
                                }
                            }
                            comparisonValue6 = intermediateValue42;
                            intermediateValue43 = sampledTextureValue15 >> 2u;
                        }
                        if (comparisonValue6)
                        {
                            uvec4 sampledTextureValue18 = texelFetch(transitioningVoxelBuffer, int(intermediateValue43 + scalarValue15));
                            uint scalarValue25 = sampledTextureValue18.x;
                            float branchMergedValue7;
                            float branchMergedValue10;
                            float branchMergedValue11;
                            if (scalarValue25 == 0u)
                            {
                                branchMergedValue7 = 0.0;
                                branchMergedValue10 = 0.0;
                                branchMergedValue11 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue56 = float(scalarValue25 >> 24u) * 9.2272217443678528070449829101562e-05;
                                branchMergedValue7 = bitwiseValue56 * float((scalarValue25 >> 16u) & 255u);
                                branchMergedValue10 = bitwiseValue56 * float((scalarValue25 >> 8u) & 255u);
                                branchMergedValue11 = bitwiseValue56 * float(scalarValue25 & 255u);
                            }
                            intermediateValue48 = branchMergedValue11;
                            intermediateValue49 = branchMergedValue10;
                            intermediateValue50 = branchMergedValue7;
                        }
                        else
                        {
                            intermediateValue48 = 0.0;
                            intermediateValue49 = 0.0;
                            intermediateValue50 = 0.0;
                        }
                        bool comparisonValue8;
                        uint intermediateValue53;
                        if (bitwiseValue38 < 32u)
                        {
                            comparisonValue8 = intermediateValue[bitwiseValue38] != 4294967295u;
                            intermediateValue53 = intermediateValue[bitwiseValue38];
                        }
                        else
                        {
                            uint bitwiseValue57 = (sampledTextureValue1 << 16u) | (sampledTextureValue & 65535u);
                            uint bitwiseValue59 = (bitwiseValue38 << 16u) | (sampledTextureValue2 & 65535u);
                            uint productValue14 = sampledTextureValue * 1540483477u;
                            uint productValue15 = sampledTextureValue1 * 1540483477u;
                            uint productValue16 = sampledTextureValue2 * 1540483477u;
                            uint productValue17 = bitwiseValue38 * 1540483477u;
                            uint bitwiseValue60 = (((productValue17 >> 24u) ^ productValue17) * 1540483477u) ^ (((((((((productValue14 >> 24u) ^ productValue14) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue15 >> 24u) ^ productValue15) * 1540483477u)) * 1540483477u) ^ (((productValue16 >> 24u) ^ productValue16) * 1540483477u)) * 1540483477u);
                            uint bitwiseValue61 = ((bitwiseValue60 >> 13u) ^ bitwiseValue60) * 1540483477u;
                            uint bitwiseValue62 = (bitwiseValue61 >> 15u) ^ bitwiseValue61;
                            uint bitwiseValue63 = bitwiseValue62 >> 16u;
                            uint bitwiseValue64 = bitwiseValue62 & 65535u;
                            uint comparisonValue9 = uint(bitwiseValue64 == bitwiseValue63) | (bitwiseValue64 ^ bitwiseValue63);
                            uint scalarValue26 = uint(computeVectorConstants0.packedValues[0u].x);
                            uint bitwiseValue65 = (scalarValue26 + 65535u) & comparisonValue9;
                            bool intermediateValue52;
                            uint scalarValue27 = bitwiseValue65;
                            uint scalarValue28 = 0u;
                            uint scalarValue29 = 0u;
                            uint sampledTextureValue19;
                            for (;;)
                            {
                                uint sampledTextureValue20 = texelFetch(transitioningGpuEntryBuffer, int((scalarValue27 * 4u) + 2u)).x & 65535u;
                                bool sampledTextureValue21 = (texelFetch(transitioningGpuEntryBuffer, int((scalarValue27 * 4u) + 1u)).x == bitwiseValue59) && ((texelFetch(transitioningGpuEntryBuffer, int(scalarValue27 * 4u)).x == bitwiseValue57) && (sampledTextureValue20 == comparisonValue9));
                                sampledTextureValue19 = sampledTextureValue21 ? texelFetch(transitioningGpuEntryBuffer, int((scalarValue27 * 4u) + 3u)).x : scalarValue28;
                                if ((sampledTextureValue20 == 0u) || sampledTextureValue21)
                                {
                                    intermediateValue52 = sampledTextureValue21;
                                    break;
                                }
                                else
                                {
                                    uint sumValue15 = scalarValue29 + 1u;
                                    if (int(sumValue15) < int(8u))
                                    {
                                        scalarValue27 = (scalarValue27 + 1u) & (scalarValue26 + 4294967295u);
                                        scalarValue28 = sampledTextureValue19;
                                        scalarValue29 = sumValue15;
                                        continue;
                                    }
                                    else
                                    {
                                        intermediateValue52 = false;
                                        break;
                                    }
                                }
                            }
                            comparisonValue8 = intermediateValue52;
                            intermediateValue53 = sampledTextureValue19 >> 2u;
                        }
                        float branchMergedValue1;
                        float branchMergedValue4;
                        float branchMergedValue5;
                        if (comparisonValue8)
                        {
                            uvec4 sampledTextureValue22 = texelFetch(transitioningVoxelBuffer, int(intermediateValue53 + scalarValue15));
                            uint scalarValue30 = sampledTextureValue22.x;
                            float branchMergedValue12;
                            float branchMergedValue13;
                            float branchMergedValue14;
                            if (scalarValue30 == 0u)
                            {
                                branchMergedValue12 = 0.0;
                                branchMergedValue13 = 0.0;
                                branchMergedValue14 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue66 = float(scalarValue30 >> 24u) * 9.2272217443678528070449829101562e-05;
                                branchMergedValue12 = bitwiseValue66 * float((scalarValue30 >> 16u) & 255u);
                                branchMergedValue13 = bitwiseValue66 * float((scalarValue30 >> 8u) & 255u);
                                branchMergedValue14 = bitwiseValue66 * float(scalarValue30 & 255u);
                            }
                            branchMergedValue1 = branchMergedValue12;
                            branchMergedValue4 = branchMergedValue13;
                            branchMergedValue5 = branchMergedValue14;
                        }
                        else
                        {
                            branchMergedValue1 = 0.0;
                            branchMergedValue4 = 0.0;
                            branchMergedValue5 = 0.0;
                        }
                        intermediateValue60 = branchMergedValue1;
                        intermediateValue59 = branchMergedValue4;
                        intermediateValue58 = branchMergedValue5;
                        float sampledTextureValue23 = uintBitsToFloat(texelFetch(perGroupLerps, int(scalarValue20)).x);
                        productValue7 = (intermediateValue48 + scalarValue17) + (sampledTextureValue23 * (intermediateValue58 - intermediateValue48));
                        productValue8 = (intermediateValue49 + scalarValue18) + (sampledTextureValue23 * (intermediateValue59 - intermediateValue49));
                        productValue9 = (intermediateValue50 + scalarValue19) + (sampledTextureValue23 * (intermediateValue60 - intermediateValue50));
                        uint sumValue16 = scalarValue20 + 1u;
                        if (sumValue16 == bitwiseValue42)
                        {
#endif
                            break;
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        uint productValue37 = scalarValue46 * 4u;
                        uvec4 sampledTextureValue31 = uvec4(texelFetch(intermediateValue3, int(productValue37)).x, texelFetch(intermediateValue3, int(productValue37 + 1u)).x, texelFetch(intermediateValue3, int(productValue37 + 2u)).x, texelFetch(intermediateValue3, int(productValue37 + 3u)).x);
                        uint bitwiseValue105 = sampledTextureValue31.z & 65535u;
                        bool comparisonValue45 = (bitwiseValue99 == sampledTextureValue31.y) && (((comparisonValue41 && (bitwiseValue103 == bitwiseValue105)) || ((bitwiseValue104 == bitwiseValue105) && (!comparisonValue41))) && (scalarValue39 == sampledTextureValue31.x));
                        bool comparisonValue46 = scalarValue44 != 0u;
                        comparisonValue35 = (comparisonValue46 || (!comparisonValue45)) ? scalarValue45 : sampledTextureValue31.w;
                        comparisonValue34 = comparisonValue45 ? 4294967295u : scalarValue44;
                        bitwiseValue49 = sumValue23 & (scalarValue46 + 1u);
                        bool comparisonValue47 = (bitwiseValue105 == 0u) || comparisonValue45;
                        if ((comparisonValue46 && (!comparisonValue47)) || comparisonValue47)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        else
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            intermediateValue54 = comparisonValue34;
                            intermediateValue71 = comparisonValue35;
                            break;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            scalarValue17 = productValue7;
                            scalarValue18 = productValue8;
                            scalarValue19 = productValue9;
                            scalarValue20 = sumValue16;
                            continue;
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        sumValue12 = scalarValue47 + 1u;
                        scalarValue44 = comparisonValue34;
                        scalarValue45 = comparisonValue35;
                        scalarValue46 = bitwiseValue49;
                        scalarValue47 = sumValue12;
                        continue;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue41 = intermediateValue54;
                    bitwiseValue45 = intermediateValue71 >> 2u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue = productValue7;
                    branchMergedValue2 = productValue9;
                    branchMergedValue3 = productValue8;
                }
                intermediateValue33 = branchMergedValue;
                intermediateValue35 = branchMergedValue2;
                intermediateValue34 = branchMergedValue3;
                float sumValue17 = 1.0 - computeVectorConstants0.packedValues[2u].x;
                float productValue18 = ((sumValue17 * (intermediateValue33 + intermediateValue29)) + (computeVectorConstants0.packedValues[2u].x * intermediateValue25)) * 0.16666667163372039794921875;
                float productValue19 = ((sumValue17 * (intermediateValue34 + intermediateValue30)) + (computeVectorConstants0.packedValues[2u].x * intermediateValue26)) * 0.16666667163372039794921875;
                float productValue20 = ((sumValue17 * (intermediateValue35 + intermediateValue31)) + (computeVectorConstants0.packedValues[2u].x * intermediateValue27)) * 0.16666667163372039794921875;
                float productValue21 = ceil(spvNClamp(spvNMax(spvNMax(productValue18, productValue20), spvNMax(productValue19, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
                imageStore(voxelBuffer, int(scalarValue15 + bitwiseValue11), uvec4((((uint(spvNClamp(productValue19 / productValue21, 0.0, 1.0) * 255.0) << 8u) | uint(spvNClamp(productValue18 / productValue21, 0.0, 1.0) * 255.0)) | (uint(spvNClamp(productValue20 / productValue21, 0.0, 1.0) * 255.0) << 16u)) | (uint(spvNClamp(productValue21, 0.0, 1.0) * 255.0) << 24u)));
                uint sumValue18 = scalarValue15 + 1u;
                if (sumValue18 == sumValue10)
                {
                    break;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue41 = comparisonValue27;
                    bitwiseValue45 = intermediateValue53;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    scalarValue15 = sumValue18;
                    continue;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                uvec4 sampledTextureValue32 = texelFetch(intermediateValue4, int(scalarValue15 + bitwiseValue45));
                uint scalarValue48 = sampledTextureValue32.x;
                float bitwiseValue106 = rdEvaluateFloatExpression(scalarValue48 & 255u) * 0.0039215688593685626983642578125;
                float bitwiseValue107 = rdEvaluateFloatExpression((scalarValue48 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                bool comparisonValue48 = scalarValue48 != 0u;
                float reinterpretedBits1 = comparisonValue48 ? uintBitsToFloat(floatBitsToUint((bitwiseValue107 * bitwiseValue106) * 6.0) & intermediateValue41) : 0.0;
                float reinterpretedBits2 = comparisonValue48 ? uintBitsToFloat(floatBitsToUint((bitwiseValue107 * (rdEvaluateFloatExpression((scalarValue48 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) & intermediateValue41) : 0.0;
                float reinterpretedBits3 = comparisonValue48 ? uintBitsToFloat(floatBitsToUint((bitwiseValue107 * (rdEvaluateFloatExpression((scalarValue48 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) & intermediateValue41) : 0.0;
                bool conditionValue3 = scalarValue43 < 32u;
                uint intermediateValue61;
                uint comparisonValue36;
                if (conditionValue3)
                {
                    intermediateValue61 = intermediateValue7[scalarValue43];
                    comparisonValue36 = (intermediateValue7[scalarValue43] != 4294967295u) ? 4294967295u : 0u;
                }
                else
                {
                    intermediateValue61 = 0u;
                    comparisonValue36 = floatBitsToUint(bitwiseValue106);
                }
                uint intermediateValue64;
                uint bitwiseValue55;
                if (!conditionValue3)
                {
                    uint scalarValue49 = bitfieldInsert(bitfieldInsert(65536u, scalarValue29, int(17u), int(31u)), sampledTextureValue26, int(0u), int(16u));
                    uint productValue38 = scalarValue43 * 1540483477u;
                    uint bitwiseValue108 = bitwiseValue94 ^ ((productValue38 ^ (productValue38 >> 24u)) * 1540483477u);
                    uint bitwiseValue109 = (bitwiseValue108 ^ (bitwiseValue108 >> 13u)) * 1540483477u;
                    uint bitwiseValue110 = bitwiseValue109 ^ (bitwiseValue109 >> 15u);
                    uint bitwiseValue111 = (bitwiseValue110 ^ (bitwiseValue110 >> 16u)) & 65535u;
                    bool comparisonValue49 = bitwiseValue111 != 0u;
                    uint bitwiseValue112 = bitwiseValue111 | 1u;
                    uint comparisonValue50 = sumValue23 & (comparisonValue49 ? bitwiseValue111 : bitwiseValue112);
                    uint comparisonValue43;
                    uint comparisonValue44;
                    uint bitwiseValue58;
                    uint sumValue13;
                    uint intermediateValue65;
                    uint intermediateValue72;
                    uint scalarValue50 = 0u;
                    uint scalarValue51 = 0u;
                    uint scalarValue52 = comparisonValue50;
                    uint scalarValue53 = 0u;
                    for (;;)
                    {
                        if (int(scalarValue53) >= int(8u))
                        {
                            intermediateValue65 = scalarValue50;
                            intermediateValue72 = scalarValue51;
                            break;
                        }
                        uint productValue39 = scalarValue52 * 4u;
                        uvec4 sampledTextureValue33 = uvec4(texelFetch(intermediateValue3, int(productValue39)).x, texelFetch(intermediateValue3, int(productValue39 + 1u)).x, texelFetch(intermediateValue3, int(productValue39 + 2u)).x, texelFetch(intermediateValue3, int(productValue39 + 3u)).x);
                        uint bitwiseValue113 = sampledTextureValue33.z & 65535u;
                        bool comparisonValue51 = ((((!comparisonValue49) && (bitwiseValue112 == bitwiseValue113)) || (comparisonValue49 && (bitwiseValue111 == bitwiseValue113))) && (scalarValue39 == sampledTextureValue33.x)) && (scalarValue49 == sampledTextureValue33.y);
                        bool comparisonValue52 = scalarValue50 != 0u;
                        comparisonValue44 = ((!comparisonValue51) || comparisonValue52) ? scalarValue51 : sampledTextureValue33.w;
                        comparisonValue43 = comparisonValue51 ? 4294967295u : scalarValue50;
                        bitwiseValue58 = sumValue23 & (scalarValue52 + 1u);
                        bool comparisonValue53 = comparisonValue51 || (bitwiseValue113 == 0u);
                        if ((comparisonValue52 && (!comparisonValue53)) || comparisonValue53)
                        {
                            intermediateValue65 = comparisonValue43;
                            intermediateValue72 = comparisonValue44;
                            break;
                        }
                        sumValue13 = scalarValue53 + 1u;
                        scalarValue50 = comparisonValue43;
                        scalarValue51 = comparisonValue44;
                        scalarValue52 = bitwiseValue58;
                        scalarValue53 = sumValue13;
                        continue;
                    }
                    intermediateValue64 = intermediateValue65;
                    bitwiseValue55 = intermediateValue72 >> 2u;
                }
                else
                {
                    intermediateValue64 = comparisonValue36;
                    bitwiseValue55 = intermediateValue61;
                }
                uvec4 sampledTextureValue34 = texelFetch(intermediateValue4, int(scalarValue15 + bitwiseValue55));
                uint scalarValue54 = sampledTextureValue34.x;
                float bitwiseValue114 = rdEvaluateFloatExpression((scalarValue54 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                bool comparisonValue54 = scalarValue54 != 0u;
                float sampledTextureValue35 = uintBitsToFloat(texelFetch(intermediateValue2, int(scalarValue29)).x);
                multiplyAddValue2 = intermediateValue44 + fma(sampledTextureValue35, (comparisonValue54 ? uintBitsToFloat(floatBitsToUint((bitwiseValue114 * (rdEvaluateFloatExpression(scalarValue54 & 255u) * 0.0039215688593685626983642578125)) * 6.0) & intermediateValue64) : 0.0) - reinterpretedBits1, reinterpretedBits1);
                multiplyAddValue1 = intermediateValue43 + fma(sampledTextureValue35, (comparisonValue54 ? uintBitsToFloat(floatBitsToUint((bitwiseValue114 * (rdEvaluateFloatExpression((scalarValue54 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) & intermediateValue64) : 0.0) - reinterpretedBits2, reinterpretedBits2);
                multiplyAddValue = intermediateValue42 + fma(sampledTextureValue35, (comparisonValue54 ? uintBitsToFloat(floatBitsToUint((bitwiseValue114 * (rdEvaluateFloatExpression((scalarValue54 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) & intermediateValue64) : 0.0) - reinterpretedBits3, reinterpretedBits3);
                sumValue9 = scalarValue29 + 1u;
                scalarValue42 = intermediateValue41;
                intermediateValue42 = multiplyAddValue;
                intermediateValue43 = multiplyAddValue1;
                intermediateValue44 = multiplyAddValue2;
                scalarValue29 = sumValue9;
                continue;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            bool comparisonValue55 = scalarValue40 != 0u;
            float multiplyAddValue3 = fma(sumValue22, comparisonValue40 ? (uintBitsToFloat(intermediateValue15 & floatBitsToUint((bitwiseValue97 * (rdEvaluateFloatExpression(scalarValue41 & 255u) * 0.0039215688593685626983642578125)) * 6.0)) + intermediateValue44) : intermediateValue44, comparisonValue55 ? (((bitwiseValue95 * (rdEvaluateFloatExpression(scalarValue40 & 255u) * 0.0039215688593685626983642578125)) * computeScalarConstants0.packedValues[8u]) * 6.0) : 0.0) * 0.16666667163372039794921875;
            float multiplyAddValue4 = fma(sumValue22, comparisonValue40 ? (uintBitsToFloat(floatBitsToUint((bitwiseValue97 * (rdEvaluateFloatExpression((scalarValue41 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) & intermediateValue15) + intermediateValue43) : intermediateValue43, comparisonValue55 ? (((bitwiseValue95 * (rdEvaluateFloatExpression((scalarValue40 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * computeScalarConstants0.packedValues[8u]) * 6.0) : 0.0) * 0.16666667163372039794921875;
            float multiplyAddValue5 = fma(sumValue22, comparisonValue40 ? (uintBitsToFloat(floatBitsToUint((bitwiseValue97 * bitwiseValue96) * 6.0) & intermediateValue15) + intermediateValue42) : intermediateValue42, comparisonValue55 ? (((bitwiseValue95 * (rdEvaluateFloatExpression((scalarValue40 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * computeScalarConstants0.packedValues[8u]) * 6.0) : 0.0) * 0.16666667163372039794921875;
            float productValue40 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue4, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue5, multiplyAddValue3)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
            imageStore(intermediateValue5, int(bitwiseValue18 + scalarValue15), uvec4(((uint(spvNClamp(multiplyAddValue3 / productValue40, 0.0, 1.0) * 255.0) + (uint(spvNClamp(multiplyAddValue4 / productValue40, 0.0, 1.0) * 255.0) * 256u)) + (uint(spvNClamp(multiplyAddValue5 / productValue40, 0.0, 1.0) * 255.0) * 65536u)) + (uint(spvNClamp(productValue40, 0.0, 1.0) * 255.0) * 16777216u)));
            sumValue7 = scalarValue15 + 1u;
            scalarValue15 = sumValue7;
            continue;
#endif
        }
    }
}
