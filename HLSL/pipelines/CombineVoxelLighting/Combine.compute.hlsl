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
#define RD_USE_BITFIELD_INSERT_UINT2_7 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT3_8 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT4_9 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT_6 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/CombineVoxelLighting/ComputeBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeComputeStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    bool conditionValue1 = uint(RD_UNIFORM_DIRTY_VOLUME_COUNT.x) > dispatchThreadId.y;
    uint productValue21 = dispatchThreadId.y * 4u;
    uint loadedBufferValue24 = conditionValue1 ? rdLoad_intermediateValue(dispatchThreadId.y * 4u).x : 0u;
    uint loadedBufferValue25 = conditionValue1 ? rdLoad_intermediateValue((dispatchThreadId.y * 4u) + 1u).x : 0u;
    uint loadedBufferValue26 = conditionValue1 ? rdLoad_intermediateValue((dispatchThreadId.y * 4u) + 2u).x : 0u;
    uint intermediateValue10;
    uint intermediateValue12;
    uint intermediateValue14;
    uint bitwiseValue16;
    uint bitwiseValue17;
    uint bitwiseValue18;
    uint intermediateValue16;
    if (conditionValue1)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool conditionValue = dispatchThreadId.y < uint(RD_UNIFORM_DIRTY_VOLUME_COUNT.x);
    uint loadedBufferValue;
    uint loadedBufferValue1;
    uint loadedBufferValue2;
    if (conditionValue)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint scalarValue31 = rdBitfieldInsert(loadedBufferValue24, loadedBufferValue25, 16u, 16u);
        uint bitwiseValue67 = loadedBufferValue26 & 65535u;
        uint productValue22 = loadedBufferValue24 * 1540483477u;
        uint productValue23 = loadedBufferValue25 * 1540483477u;
        uint productValue24 = loadedBufferValue26 * 1540483477u;
        uint bitwiseValue68 = (((((((productValue22 ^ (productValue22 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue23 >> 24u) ^ productValue23) * 1540483477u)) * 1540483477u) ^ (((productValue24 >> 24u) ^ productValue24) * 1540483477u)) * 1540483477u;
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
        uint sumValue21 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) - 1u;
        uint comparisonValue15 = (comparisonValue12 ? bitwiseValue77 : bitwiseValue80) & sumValue21;
        uint comparisonValue16 = sumValue21 & (comparisonValue13 ? bitwiseValue78 : bitwiseValue81);
        uint comparisonValue17 = sumValue21 & (comparisonValue14 ? bitwiseValue79 : bitwiseValue82);
        uint comparisonValue6;
        uint comparisonValue7;
        uint bitwiseValue19;
        uint sumValue1;
        uint intermediateValue11;
        uint intermediateValue29;
        uint scalarValue2 = 0u;
        uint scalarValue3 = 0u;
        uint scalarValue32 = comparisonValue15;
        uint scalarValue5 = 0u;
        for (;;)
        {
            if (int(scalarValue5) >= int(8u))
            {
                intermediateValue29 = scalarValue3;
                intermediateValue11 = scalarValue2;
                break;
            }
            uint productValue25 = scalarValue32 * 4u;
            uint4 loadedBufferValue27 = uint4(rdLoad_intermediateValue1(productValue25).x, rdLoad_intermediateValue1(productValue25 + 1u).x, rdLoad_intermediateValue1(productValue25 + 2u).x, rdLoad_intermediateValue1(productValue25 + 3u).x);
            uint bitwiseValue83 = loadedBufferValue27.z & 65535u;
            bool comparisonValue20 = ((((bitwiseValue83 == bitwiseValue80) && (!comparisonValue12)) || (comparisonValue12 && (bitwiseValue77 == bitwiseValue83))) && (scalarValue31 == loadedBufferValue27.x)) && (bitwiseValue67 == loadedBufferValue27.y);
            bool comparisonValue21 = scalarValue2 != 0u;
            comparisonValue7 = (comparisonValue21 || (!comparisonValue20)) ? scalarValue3 : loadedBufferValue27.w;
            comparisonValue6 = comparisonValue20 ? 4294967295u : scalarValue2;
            bitwiseValue19 = sumValue21 & (scalarValue32 + 1u);
            bool comparisonValue22 = comparisonValue20 || (bitwiseValue83 == 0u);
            if (((!comparisonValue22) && comparisonValue21) || comparisonValue22)
            {
                intermediateValue29 = comparisonValue7;
                intermediateValue11 = comparisonValue6;
                break;
            }
            sumValue1 = scalarValue5 + 1u;
            scalarValue2 = comparisonValue6;
            scalarValue3 = comparisonValue7;
            scalarValue32 = bitwiseValue19;
            scalarValue5 = sumValue1;
            continue;
        }
        uint scalarValue33 = rdBitfieldInsert(65536u, loadedBufferValue26, 0u, 16u);
        uint comparisonValue18;
        uint comparisonValue19;
        uint bitwiseValue32;
        uint sumValue8;
        uint intermediateValue15;
        uint intermediateValue45;
        uint scalarValue6 = 0u;
        uint scalarValue8 = 0u;
        uint scalarValue34 = comparisonValue16;
        uint scalarValue9 = 0u;
        for (;;)
        {
            if (int(scalarValue9) >= int(8u))
            {
                intermediateValue15 = scalarValue6;
                intermediateValue45 = scalarValue8;
                break;
            }
            uint productValue26 = scalarValue34 * 4u;
            uint4 loadedBufferValue28 = uint4(rdLoad_intermediateValue1(productValue26).x, rdLoad_intermediateValue1(productValue26 + 1u).x, rdLoad_intermediateValue1(productValue26 + 2u).x, rdLoad_intermediateValue1(productValue26 + 3u).x);
            uint bitwiseValue84 = loadedBufferValue28.z & 65535u;
            bool comparisonValue23 = (scalarValue33 == loadedBufferValue28.y) && ((((!comparisonValue13) && (bitwiseValue81 == bitwiseValue84)) || ((bitwiseValue84 == bitwiseValue78) && comparisonValue13)) && (scalarValue31 == loadedBufferValue28.x));
            bool comparisonValue26 = scalarValue6 != 0u;
            comparisonValue19 = (comparisonValue26 || (!comparisonValue23)) ? scalarValue8 : loadedBufferValue28.w;
            comparisonValue18 = comparisonValue23 ? 4294967295u : scalarValue6;
            bitwiseValue32 = sumValue21 & (scalarValue34 + 1u);
            bool comparisonValue28 = (bitwiseValue84 == 0u) || comparisonValue23;
            if (comparisonValue28 || (comparisonValue26 && (!comparisonValue28)))
            {
                intermediateValue15 = comparisonValue18;
                intermediateValue45 = comparisonValue19;
                break;
            }
            sumValue8 = scalarValue9 + 1u;
            scalarValue6 = comparisonValue18;
            scalarValue8 = comparisonValue19;
            scalarValue34 = bitwiseValue32;
            scalarValue9 = sumValue8;
            continue;
        }
        uint sumValue22 = bitwiseValue67 + 131072u;
        uint comparisonValue24;
        uint comparisonValue25;
        uint bitwiseValue38;
        uint sumValue13;
        uint intermediateValue13;
        uint intermediateValue61;
        uint scalarValue12 = 0u;
        uint scalarValue13 = 0u;
        uint scalarValue35 = comparisonValue17;
        uint scalarValue20 = 0u;
        for (;;)
        {
            if (int(scalarValue20) >= int(8u))
            {
                intermediateValue13 = scalarValue12;
                intermediateValue61 = scalarValue13;
                break;
            }
            uint productValue27 = scalarValue35 * 4u;
            uint4 loadedBufferValue29 = uint4(rdLoad_intermediateValue1(productValue27).x, rdLoad_intermediateValue1(productValue27 + 1u).x, rdLoad_intermediateValue1(productValue27 + 2u).x, rdLoad_intermediateValue1(productValue27 + 3u).x);
            uint bitwiseValue85 = loadedBufferValue29.z & 65535u;
            bool comparisonValue29 = (sumValue22 == loadedBufferValue29.y) && ((((bitwiseValue85 == bitwiseValue79) && comparisonValue14) || ((bitwiseValue85 == bitwiseValue82) && (!comparisonValue14))) && (scalarValue31 == loadedBufferValue29.x));
            bool comparisonValue30 = scalarValue12 != 0u;
            comparisonValue25 = (comparisonValue30 || (!comparisonValue29)) ? scalarValue13 : loadedBufferValue29.w;
            comparisonValue24 = comparisonValue29 ? 4294967295u : scalarValue12;
            bitwiseValue38 = sumValue21 & (scalarValue35 + 1u);
            bool comparisonValue31 = (bitwiseValue85 == 0u) || comparisonValue29;
            if ((comparisonValue30 && (!comparisonValue31)) || comparisonValue31)
            {
                intermediateValue13 = comparisonValue24;
                intermediateValue61 = comparisonValue25;
                break;
            }
            sumValue13 = scalarValue20 + 1u;
            scalarValue12 = comparisonValue24;
            scalarValue13 = comparisonValue25;
            scalarValue35 = bitwiseValue38;
            scalarValue20 = sumValue13;
            continue;
        }
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = intermediateValue13;
        intermediateValue14 = intermediateValue15;
        bitwiseValue16 = intermediateValue29 >> 2u;
        bitwiseValue17 = intermediateValue45 >> 2u;
        bitwiseValue18 = intermediateValue61 >> 2u;
        intermediateValue16 = uint(RD_UNIFORM_TRANSITIONING_VOLUMES_LAYER_COUNT.x);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint bitwiseValue = dispatchThreadId.y << 2u;
        loadedBufferValue = rdLoad_dirtyVolumeKeys(dispatchThreadId.y * 4u).x;
        loadedBufferValue1 = rdLoad_dirtyVolumeKeys((dispatchThreadId.y * 4u) + 1u).x;
        loadedBufferValue2 = rdLoad_dirtyVolumeKeys((dispatchThreadId.y * 4u) + 2u).x;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue10 = 0u;
        intermediateValue12 = 0u;
        intermediateValue14 = 0u;
        bitwiseValue16 = 0u;
        bitwiseValue17 = 0u;
        bitwiseValue18 = 0u;
        intermediateValue16 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        loadedBufferValue = 0u;
        loadedBufferValue1 = 0u;
        loadedBufferValue2 = 0u;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    if (conditionValue1 && (min(intermediateValue16, 32u) > localThreadIndex))
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
        uint scalarValue36 = rdBitfieldInsert(loadedBufferValue24, loadedBufferValue25, 16u, 16u);
        uint scalarValue37 = rdBitfieldInsert(loadedBufferValue26, localThreadIndex, 16u, 16u);
        uint productValue28 = loadedBufferValue24 * 1540483477u;
        uint productValue29 = loadedBufferValue25 * 1540483477u;
        uint productValue30 = loadedBufferValue26 * 1540483477u;
        uint productValue6 = localThreadIndex * 1540483477u;
        uint bitwiseValue86 = ((productValue6 ^ (productValue6 >> 24u)) * 1540483477u) ^ ((((((((productValue28 ^ (productValue28 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ ((productValue29 ^ (productValue29 >> 24u)) * 1540483477u)) * 1540483477u) ^ ((productValue30 ^ (productValue30 >> 24u)) * 1540483477u)) * 1540483477u);
        uint bitwiseValue87 = (bitwiseValue86 ^ (bitwiseValue86 >> 13u)) * 1540483477u;
        uint bitwiseValue88 = bitwiseValue87 ^ (bitwiseValue87 >> 15u);
        uint bitwiseValue89 = (bitwiseValue88 ^ (bitwiseValue88 >> 16u)) & 65535u;
        bool comparisonValue32 = bitwiseValue89 != 0u;
        uint bitwiseValue90 = bitwiseValue89 | 1u;
        uint sumValue23 = uint(RD_UNIFORM_TRANSITIONING_GPU_ENTRY_BUFFER_CAPACITY.x) - 1u;
        uint comparisonValue33 = (comparisonValue32 ? bitwiseValue89 : bitwiseValue90) & sumValue23;
        uint comparisonValue10;
        uint comparisonValue11;
        uint bitwiseValue25;
        uint sumValue3;
        uint intermediateValue35;
        uint intermediateValue36;
        uint scalarValue23 = 0u;
        uint scalarValue24 = 0u;
        uint scalarValue38 = comparisonValue33;
        uint scalarValue28 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint bitwiseValue1 = (loadedBufferValue1 << 16u) | (loadedBufferValue & 65535u);
        uint bitwiseValue2 = loadedBufferValue2 & 65535u;
        uint productValue = loadedBufferValue * 1540483477u;
        uint productValue1 = loadedBufferValue1 * 1540483477u;
        uint productValue2 = loadedBufferValue2 * 1540483477u;
        uint bitwiseValue3 = ((((((((productValue >> 24u) ^ productValue) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue1 >> 24u) ^ productValue1) * 1540483477u)) * 1540483477u) ^ (((productValue2 >> 24u) ^ productValue2) * 1540483477u)) * 1540483477u;
        uint bitwiseValue4 = ((bitwiseValue3 >> 13u) ^ bitwiseValue3) * 1540483477u;
        uint bitwiseValue5 = (bitwiseValue4 >> 15u) ^ bitwiseValue4;
        uint bitwiseValue6 = bitwiseValue5 >> 16u;
        uint bitwiseValue7 = bitwiseValue5 & 65535u;
        uint comparisonValue = uint(bitwiseValue7 == bitwiseValue6) | (bitwiseValue7 ^ bitwiseValue6);
        uint scalarValue = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x);
        uint sumValue = scalarValue + 65535u;
        uint bitwiseValue8 = sumValue & comparisonValue;
        bool intermediateValue11;
        uint scalarValue1 = bitwiseValue8;
        uint scalarValue2 = 0u;
        uint scalarValue3 = 0u;
        uint loadedBufferValue3;
#endif
        for (;;)
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            if (int(scalarValue28) >= int(8u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint loadedBufferValue4 = rdLoad_gpuEntryBuffer((scalarValue1 * 4u) + 2u).x & 65535u;
            bool loadedBufferValue5 = (rdLoad_gpuEntryBuffer((scalarValue1 * 4u) + 1u).x == bitwiseValue2) && ((rdLoad_gpuEntryBuffer(scalarValue1 * 4u).x == bitwiseValue1) && (loadedBufferValue4 == comparisonValue));
            loadedBufferValue3 = loadedBufferValue5 ? rdLoad_gpuEntryBuffer((scalarValue1 * 4u) + 3u).x : scalarValue2;
            if ((loadedBufferValue4 == 0u) || loadedBufferValue5)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue35 = scalarValue23;
                intermediateValue36 = scalarValue24;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue11 = loadedBufferValue5;
#endif
                break;
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            uint productValue31 = scalarValue38 * 4u;
            uint4 loadedBufferValue30 = uint4(rdLoad_intermediateValue3(productValue31).x, rdLoad_intermediateValue3(productValue31 + 1u).x, rdLoad_intermediateValue3(productValue31 + 2u).x, rdLoad_intermediateValue3(productValue31 + 3u).x);
            uint bitwiseValue91 = loadedBufferValue30.z & 65535u;
            bool comparisonValue37 = (((comparisonValue32 && (bitwiseValue89 == bitwiseValue91)) || ((bitwiseValue90 == bitwiseValue91) && (!comparisonValue32))) && (scalarValue36 == loadedBufferValue30.x)) && (scalarValue37 == loadedBufferValue30.y);
            bool comparisonValue38 = scalarValue23 != 0u;
            comparisonValue11 = ((!comparisonValue37) || comparisonValue38) ? scalarValue24 : loadedBufferValue30.w;
            comparisonValue10 = comparisonValue37 ? 4294967295u : scalarValue23;
            bitwiseValue25 = sumValue23 & (scalarValue38 + 1u);
            bool comparisonValue39 = comparisonValue37 || (bitwiseValue91 == 0u);
            if (comparisonValue39 || (comparisonValue38 && (!comparisonValue39)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            else
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue35 = comparisonValue10;
                intermediateValue36 = comparisonValue11;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                uint sumValue2 = scalarValue3 + 1u;
                if (int(sumValue2) < int(8u))
                {
                    scalarValue1 = (scalarValue1 + 1u) & (scalarValue + 4294967295u);
                    scalarValue2 = loadedBufferValue3;
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
        uint loadedBufferValue9;
        for (;;)
        {
            uint loadedBufferValue7 = rdLoad_gpuEntryBuffer((scalarValue4 * 4u) + 2u).x & 65535u;
            bool loadedBufferValue8 = (rdLoad_gpuEntryBuffer((scalarValue4 * 4u) + 1u).x == bitwiseValue12) && ((rdLoad_gpuEntryBuffer(scalarValue4 * 4u).x == bitwiseValue1) && (loadedBufferValue7 == comparisonValue1));
            loadedBufferValue9 = loadedBufferValue8 ? rdLoad_gpuEntryBuffer((scalarValue4 * 4u) + 3u).x : scalarValue5;
            if ((loadedBufferValue7 == 0u) || loadedBufferValue8)
            {
                intermediateValue20 = loadedBufferValue8;
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
                    scalarValue5 = loadedBufferValue9;
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
        intermediateValue6[localThreadIndex] = (intermediateValue35 != 0u) ? (intermediateValue36 >> 2u) : 4294967295u;
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
        uint loadedBufferValue12;
        for (;;)
        {
            uint loadedBufferValue10 = rdLoad_gpuEntryBuffer((scalarValue7 * 4u) + 2u).x & 65535u;
            bool loadedBufferValue11 = (rdLoad_gpuEntryBuffer((scalarValue7 * 4u) + 1u).x == bitwiseValue23) && ((rdLoad_gpuEntryBuffer(scalarValue7 * 4u).x == bitwiseValue1) && (loadedBufferValue10 == comparisonValue2));
            loadedBufferValue12 = loadedBufferValue11 ? rdLoad_gpuEntryBuffer((scalarValue7 * 4u) + 3u).x : scalarValue8;
            if ((loadedBufferValue10 == 0u) || loadedBufferValue11)
            {
                intermediateValue28 = loadedBufferValue11;
                break;
            }
            else
            {
                uint sumValue5 = scalarValue9 + 1u;
                if (int(sumValue5) < int(8u))
                {
                    scalarValue7 = (scalarValue7 + 1u) & (scalarValue + 4294967295u);
                    scalarValue8 = loadedBufferValue12;
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
        bitwiseValue9 = loadedBufferValue3 >> 2u;
        bitwiseValue10 = loadedBufferValue9 >> 2u;
        bitwiseValue11 = loadedBufferValue12 >> 2u;
        intermediateValue3 = uint(intermediateValue11);
        intermediateValue4 = uint(intermediateValue20);
        intermediateValue5 = uint(intermediateValue28);
        intermediateValue6 = uint(RD_UNIFORM_TRANSITIONING_VOLUMES_LAYER_COUNT.x);
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
    if (conditionValue && (localThreadIndex < min(intermediateValue6, 32u)))
    {
        uint bitwiseValue31 = (loadedBufferValue1 << 16u) | (loadedBufferValue & 65535u);
        uint bitwiseValue33 = (loadedBufferValue2 & 65535u) | (localThreadIndex << 16u);
        uint productValue3 = loadedBufferValue * 1540483477u;
        uint productValue4 = loadedBufferValue1 * 1540483477u;
        uint productValue5 = loadedBufferValue2 * 1540483477u;
        uint productValue6 = localThreadIndex * 1540483477u;
        uint bitwiseValue34 = (((((((((productValue3 >> 24u) ^ productValue3) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue4 >> 24u) ^ productValue4) * 1540483477u)) * 1540483477u) ^ (((productValue5 >> 24u) ^ productValue5) * 1540483477u)) * 1540483477u) ^ (((productValue6 >> 24u) ^ productValue6) * 1540483477u);
        uint bitwiseValue35 = ((bitwiseValue34 >> 13u) ^ bitwiseValue34) * 1540483477u;
        uint bitwiseValue36 = (bitwiseValue35 >> 15u) ^ bitwiseValue35;
        uint bitwiseValue39 = bitwiseValue36 >> 16u;
        uint bitwiseValue40 = bitwiseValue36 & 65535u;
        uint comparisonValue3 = uint(bitwiseValue40 == bitwiseValue39) | (bitwiseValue40 ^ bitwiseValue39);
        uint scalarValue10 = uint(RD_UNIFORM_TRANSITIONING_GPU_ENTRY_BUFFER_CAPACITY.x);
        uint bitwiseValue41 = (scalarValue10 + 65535u) & comparisonValue3;
        bool intermediateValue19;
        uint scalarValue11 = bitwiseValue41;
        uint scalarValue12 = 0u;
        uint scalarValue13 = 0u;
        uint loadedBufferValue6;
        for (;;)
        {
            uint loadedBufferValue13 = rdLoad_transitioningGpuEntryBuffer((scalarValue11 * 4u) + 2u).x & 65535u;
            bool loadedBufferValue14 = (rdLoad_transitioningGpuEntryBuffer((scalarValue11 * 4u) + 1u).x == bitwiseValue33) && ((rdLoad_transitioningGpuEntryBuffer(scalarValue11 * 4u).x == bitwiseValue31) && (loadedBufferValue13 == comparisonValue3));
            loadedBufferValue6 = loadedBufferValue14 ? rdLoad_transitioningGpuEntryBuffer((scalarValue11 * 4u) + 3u).x : scalarValue12;
            if ((loadedBufferValue13 == 0u) || loadedBufferValue14)
            {
                intermediateValue19 = loadedBufferValue14;
                break;
            }
            else
            {
                uint sumValue9 = scalarValue13 + 1u;
                if (int(sumValue9) < int(8u))
                {
                    scalarValue11 = (scalarValue11 + 1u) & (scalarValue10 + 4294967295u);
                    scalarValue12 = loadedBufferValue6;
                    scalarValue13 = sumValue9;
                    continue;
                }
                else
                {
                    intermediateValue19 = false;
                    break;
                }
            }
        }
        rdAccess_intermediateValue(localThreadIndex) = intermediateValue19 ? (loadedBufferValue6 >> 2u) : 4294967295u;
#endif
    }
    GroupMemoryBarrierWithGroupSync();
#if RD_PLATFORM == RD_PLATFORM_SM50
    if (!((!conditionValue1) || (conditionValue1 && (((~intermediateValue12) != 0u) || ((~intermediateValue10) != 0u)))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if (!(((intermediateValue3 == 0u) || (!conditionValue)) || (intermediateValue5 == 0u)))
#endif
    {
        uint scalarValue14 = dispatchThreadId.x << 4u;
        uint sumValue10 = min((scalarValue14 + 16u), 4096u);
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint bitwiseValue92 = intermediateValue16 >> 1u;
        float sumValue19 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
        uint scalarValue39 = rdBitfieldInsert(loadedBufferValue24, loadedBufferValue25, 16u, 16u);
        uint bitwiseValue93 = loadedBufferValue26 & 65535u;
        uint productValue32 = loadedBufferValue24 * 1540483477u;
        uint productValue33 = loadedBufferValue25 * 1540483477u;
        uint productValue34 = loadedBufferValue26 * 1540483477u;
        uint bitwiseValue94 = (((((((productValue32 ^ (productValue32 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ ((productValue33 ^ (productValue33 >> 24u)) * 1540483477u)) * 1540483477u) ^ ((productValue34 ^ (productValue34 >> 24u)) * 1540483477u)) * 1540483477u;
        uint sumValue24 = uint(RD_UNIFORM_TRANSITIONING_GPU_ENTRY_BUFFER_CAPACITY.x) - 1u;
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
            uint4 sumValue25 = rdAccess_intermediateValue5(bitwiseValue16 + scalarValue15).xxxx;
            uint scalarValue40 = sumValue25.x;
            float bitwiseValue95 = rdUnsignedToFloat((scalarValue40 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
            uint4 sumValue26 = rdAccess_intermediateValue5(bitwiseValue17 + scalarValue15).xxxx;
            uint scalarValue41 = sumValue26.x;
            float bitwiseValue96 = rdUnsignedToFloat((scalarValue41 >> 16u) & 255u) * 0.0039215688593685626983642578125f;
            float bitwiseValue97 = rdUnsignedToFloat((scalarValue41 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
            uint reinterpretedBits = asuint(bitwiseValue96);
            bool comparisonValue40 = scalarValue41 != 0u;
            float intermediateValue41;
            float intermediateValue42;
            float intermediateValue43;
            intermediateValue41 = 0.0f;
            intermediateValue42 = 0.0f;
            intermediateValue43 = 0.0f;
            float multiplyAddValue;
            float multiplyAddValue1;
            float multiplyAddValue2;
            uint sumValue11;
            uint intermediateValue40;
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
            uint sumValue6;
            bool comparisonValue4;
#endif
            for (;;)
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                if (bitwiseValue92 <= scalarValue29)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                sumValue6 = rdAccess_voxelBuffer(scalarValue15 + bitwiseValue9).xxxx.x;
                comparisonValue4 = sumValue6 == 0u;
                if (comparisonValue4)
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    break;
                }
                uint bitwiseValue98 = scalarValue29 << 1u;
                uint scalarValue43 = rdBitfieldInsert(1u, scalarValue29, 1u, 31u);
                bool conditionValue2 = bitwiseValue98 < 32u;
                uint intermediateValue52;
                uint comparisonValue27;
                if (conditionValue2)
                {
                    intermediateValue52 = intermediateValue6[bitwiseValue98];
                    comparisonValue27 = (intermediateValue6[bitwiseValue98] != 4294967295u) ? 4294967295u : 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    intermediateValue25 = 0.0f;
                    intermediateValue26 = 0.0f;
                    intermediateValue27 = 0.0f;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue52 = 0u;
                    comparisonValue27 = scalarValue42;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float bitwiseValue43 = float(sumValue6 >> 24u) * 9.2272217443678528070449829101562e-05f;
                    intermediateValue25 = bitwiseValue43 * float(sumValue6 & 255u);
                    intermediateValue26 = bitwiseValue43 * float((sumValue6 >> 8u) & 255u);
                    intermediateValue27 = bitwiseValue43 * float((sumValue6 >> 16u) & 255u);
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
                    uint productValue35 = scalarValue29 * 3080966954u;
                    uint bitwiseValue100 = ((productValue35 ^ (productValue35 >> 24u)) * 1540483477u) ^ bitwiseValue94;
                    uint bitwiseValue101 = ((bitwiseValue100 >> 13u) ^ bitwiseValue100) * 1540483477u;
                    uint bitwiseValue102 = bitwiseValue101 ^ (bitwiseValue101 >> 15u);
                    uint bitwiseValue103 = (bitwiseValue102 ^ (bitwiseValue102 >> 16u)) & 65535u;
                    bool comparisonValue41 = bitwiseValue103 != 0u;
                    uint bitwiseValue104 = bitwiseValue103 | 1u;
                    uint comparisonValue42 = sumValue24 & (comparisonValue41 ? bitwiseValue103 : bitwiseValue104);
                    uint comparisonValue34;
                    uint comparisonValue35;
                    uint bitwiseValue49;
                    uint sumValue14;
                    uint intermediateValue53;
                    uint intermediateValue70;
                    uint scalarValue44 = 0u;
                    uint scalarValue45 = 0u;
                    uint scalarValue46 = comparisonValue42;
                    uint scalarValue47 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    intermediateValue29 = 0.0f;
                    intermediateValue30 = 0.0f;
                    intermediateValue31 = 0.0f;
                }
                else
                {
                    uint4 sumValue12 = rdAccess_voxelBuffer(scalarValue15 + bitwiseValue10).xxxx;
                    uint scalarValue16 = sumValue12.x;
                    float branchMergedValue6;
                    float branchMergedValue8;
                    float branchMergedValue9;
                    if (scalarValue16 == 0u)
                    {
                        branchMergedValue6 = 0.0f;
                        branchMergedValue8 = 0.0f;
                        branchMergedValue9 = 0.0f;
                    }
                    else
                    {
                        float bitwiseValue44 = float(scalarValue16 >> 24u) * 9.2272217443678528070449829101562e-05f;
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
                    branchMergedValue = 0.0f;
                    branchMergedValue2 = 0.0f;
                    branchMergedValue3 = 0.0f;
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
                    float scalarValue17 = 0.0f;
                    float scalarValue18 = 0.0f;
                    float scalarValue19 = 0.0f;
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
                            intermediateValue53 = scalarValue44;
                            intermediateValue70 = scalarValue45;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            comparisonValue6 = rdAccess_intermediateValue(bitwiseValue37) != 4294967295u;
                            intermediateValue43 = rdAccess_intermediateValue(bitwiseValue37);
                        }
                        else
                        {
                            uint bitwiseValue46 = (loadedBufferValue1 << 16u) | (loadedBufferValue & 65535u);
                            uint bitwiseValue47 = (scalarValue20 << 17u) | (loadedBufferValue2 & 65535u);
                            uint productValue10 = loadedBufferValue * 1540483477u;
                            uint productValue11 = loadedBufferValue1 * 1540483477u;
                            uint productValue12 = loadedBufferValue2 * 1540483477u;
                            uint productValue13 = scalarValue20 * 3080966954u;
                            uint bitwiseValue48 = (((productValue13 >> 24u) ^ productValue13) * 1540483477u) ^ (((((((((productValue10 >> 24u) ^ productValue10) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue11 >> 24u) ^ productValue11) * 1540483477u)) * 1540483477u) ^ (((productValue12 >> 24u) ^ productValue12) * 1540483477u)) * 1540483477u);
                            uint bitwiseValue50 = ((bitwiseValue48 >> 13u) ^ bitwiseValue48) * 1540483477u;
                            uint bitwiseValue51 = (bitwiseValue50 >> 15u) ^ bitwiseValue50;
                            uint bitwiseValue52 = bitwiseValue51 >> 16u;
                            uint bitwiseValue53 = bitwiseValue51 & 65535u;
                            uint comparisonValue5 = uint(bitwiseValue53 == bitwiseValue52) | (bitwiseValue53 ^ bitwiseValue52);
                            uint scalarValue21 = uint(RD_UNIFORM_TRANSITIONING_GPU_ENTRY_BUFFER_CAPACITY.x);
                            uint bitwiseValue54 = (scalarValue21 + 65535u) & comparisonValue5;
                            bool intermediateValue42;
                            uint scalarValue22 = bitwiseValue54;
                            uint scalarValue23 = 0u;
                            uint scalarValue24 = 0u;
                            uint loadedBufferValue15;
                            for (;;)
                            {
                                uint loadedBufferValue16 = rdLoad_transitioningGpuEntryBuffer((scalarValue22 * 4u) + 2u).x & 65535u;
                                bool loadedBufferValue17 = (rdLoad_transitioningGpuEntryBuffer((scalarValue22 * 4u) + 1u).x == bitwiseValue47) && ((rdLoad_transitioningGpuEntryBuffer(scalarValue22 * 4u).x == bitwiseValue46) && (loadedBufferValue16 == comparisonValue5));
                                loadedBufferValue15 = loadedBufferValue17 ? rdLoad_transitioningGpuEntryBuffer((scalarValue22 * 4u) + 3u).x : scalarValue23;
                                if ((loadedBufferValue16 == 0u) || loadedBufferValue17)
                                {
                                    intermediateValue42 = loadedBufferValue17;
                                    break;
                                }
                                else
                                {
                                    uint sumValue16 = scalarValue24 + 1u;
                                    if (int(sumValue16) < int(8u))
                                    {
                                        scalarValue22 = (scalarValue22 + 1u) & (scalarValue21 + 4294967295u);
                                        scalarValue23 = loadedBufferValue15;
                                        scalarValue24 = sumValue16;
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
                            intermediateValue43 = loadedBufferValue15 >> 2u;
                        }
                        if (comparisonValue6)
                        {
                            uint4 loadedBufferValue18 = rdLoad_transitioningVoxelBuffer(intermediateValue43 + scalarValue15);
                            uint scalarValue25 = loadedBufferValue18.x;
                            float branchMergedValue7;
                            float branchMergedValue10;
                            float branchMergedValue11;
                            if (scalarValue25 == 0u)
                            {
                                branchMergedValue7 = 0.0f;
                                branchMergedValue10 = 0.0f;
                                branchMergedValue11 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue56 = float(scalarValue25 >> 24u) * 9.2272217443678528070449829101562e-05f;
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
                            intermediateValue48 = 0.0f;
                            intermediateValue49 = 0.0f;
                            intermediateValue50 = 0.0f;
                        }
                        bool comparisonValue8;
                        uint intermediateValue53;
                        if (bitwiseValue38 < 32u)
                        {
                            comparisonValue8 = rdAccess_intermediateValue(bitwiseValue38) != 4294967295u;
                            intermediateValue53 = rdAccess_intermediateValue(bitwiseValue38);
                        }
                        else
                        {
                            uint bitwiseValue57 = (loadedBufferValue1 << 16u) | (loadedBufferValue & 65535u);
                            uint bitwiseValue59 = (bitwiseValue38 << 16u) | (loadedBufferValue2 & 65535u);
                            uint productValue14 = loadedBufferValue * 1540483477u;
                            uint productValue15 = loadedBufferValue1 * 1540483477u;
                            uint productValue16 = loadedBufferValue2 * 1540483477u;
                            uint productValue17 = bitwiseValue38 * 1540483477u;
                            uint bitwiseValue60 = (((productValue17 >> 24u) ^ productValue17) * 1540483477u) ^ (((((((((productValue14 >> 24u) ^ productValue14) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue15 >> 24u) ^ productValue15) * 1540483477u)) * 1540483477u) ^ (((productValue16 >> 24u) ^ productValue16) * 1540483477u)) * 1540483477u);
                            uint bitwiseValue61 = ((bitwiseValue60 >> 13u) ^ bitwiseValue60) * 1540483477u;
                            uint bitwiseValue62 = (bitwiseValue61 >> 15u) ^ bitwiseValue61;
                            uint bitwiseValue63 = bitwiseValue62 >> 16u;
                            uint bitwiseValue64 = bitwiseValue62 & 65535u;
                            uint comparisonValue9 = uint(bitwiseValue64 == bitwiseValue63) | (bitwiseValue64 ^ bitwiseValue63);
                            uint scalarValue26 = uint(RD_UNIFORM_TRANSITIONING_GPU_ENTRY_BUFFER_CAPACITY.x);
                            uint bitwiseValue65 = (scalarValue26 + 65535u) & comparisonValue9;
                            bool intermediateValue52;
                            uint scalarValue27 = bitwiseValue65;
                            uint scalarValue28 = 0u;
                            uint scalarValue29 = 0u;
                            uint loadedBufferValue19;
                            for (;;)
                            {
                                uint loadedBufferValue20 = rdLoad_transitioningGpuEntryBuffer((scalarValue27 * 4u) + 2u).x & 65535u;
                                bool loadedBufferValue21 = (rdLoad_transitioningGpuEntryBuffer((scalarValue27 * 4u) + 1u).x == bitwiseValue59) && ((rdLoad_transitioningGpuEntryBuffer(scalarValue27 * 4u).x == bitwiseValue57) && (loadedBufferValue20 == comparisonValue9));
                                loadedBufferValue19 = loadedBufferValue21 ? rdLoad_transitioningGpuEntryBuffer((scalarValue27 * 4u) + 3u).x : scalarValue28;
                                if ((loadedBufferValue20 == 0u) || loadedBufferValue21)
                                {
                                    intermediateValue52 = loadedBufferValue21;
                                    break;
                                }
                                else
                                {
                                    uint sumValue17 = scalarValue29 + 1u;
                                    if (int(sumValue17) < int(8u))
                                    {
                                        scalarValue27 = (scalarValue27 + 1u) & (scalarValue26 + 4294967295u);
                                        scalarValue28 = loadedBufferValue19;
                                        scalarValue29 = sumValue17;
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
                            intermediateValue53 = loadedBufferValue19 >> 2u;
                        }
                        float branchMergedValue1;
                        float branchMergedValue4;
                        float branchMergedValue5;
                        if (comparisonValue8)
                        {
                            uint4 loadedBufferValue22 = rdLoad_transitioningVoxelBuffer(intermediateValue53 + scalarValue15);
                            uint scalarValue30 = loadedBufferValue22.x;
                            float branchMergedValue12;
                            float branchMergedValue13;
                            float branchMergedValue14;
                            if (scalarValue30 == 0u)
                            {
                                branchMergedValue12 = 0.0f;
                                branchMergedValue13 = 0.0f;
                                branchMergedValue14 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue66 = float(scalarValue30 >> 24u) * 9.2272217443678528070449829101562e-05f;
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
                            branchMergedValue1 = 0.0f;
                            branchMergedValue4 = 0.0f;
                            branchMergedValue5 = 0.0f;
                        }
                        intermediateValue60 = branchMergedValue1;
                        intermediateValue59 = branchMergedValue4;
                        intermediateValue58 = branchMergedValue5;
                        float loadedBufferValue23 = asfloat(rdLoad_perGroupLerps(scalarValue20).x);
                        productValue7 = (intermediateValue48 + scalarValue17) + (loadedBufferValue23 * (intermediateValue58 - intermediateValue48));
                        productValue8 = (intermediateValue49 + scalarValue18) + (loadedBufferValue23 * (intermediateValue59 - intermediateValue49));
                        productValue9 = (intermediateValue50 + scalarValue19) + (loadedBufferValue23 * (intermediateValue60 - intermediateValue50));
                        uint sumValue18 = scalarValue20 + 1u;
                        if (sumValue18 == bitwiseValue42)
                        {
#endif
                            break;
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        uint productValue36 = scalarValue46 * 4u;
                        uint4 loadedBufferValue31 = uint4(rdLoad_intermediateValue3(productValue36).x, rdLoad_intermediateValue3(productValue36 + 1u).x, rdLoad_intermediateValue3(productValue36 + 2u).x, rdLoad_intermediateValue3(productValue36 + 3u).x);
                        uint bitwiseValue105 = loadedBufferValue31.z & 65535u;
                        bool comparisonValue45 = (bitwiseValue99 == loadedBufferValue31.y) && (((comparisonValue41 && (bitwiseValue103 == bitwiseValue105)) || ((bitwiseValue104 == bitwiseValue105) && (!comparisonValue41))) && (scalarValue39 == loadedBufferValue31.x));
                        bool comparisonValue46 = scalarValue44 != 0u;
                        comparisonValue35 = (comparisonValue46 || (!comparisonValue45)) ? scalarValue45 : loadedBufferValue31.w;
                        comparisonValue34 = comparisonValue45 ? 4294967295u : scalarValue44;
                        bitwiseValue49 = sumValue24 & (scalarValue46 + 1u);
                        bool comparisonValue47 = (bitwiseValue105 == 0u) || comparisonValue45;
                        if ((comparisonValue46 && (!comparisonValue47)) || comparisonValue47)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        else
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            intermediateValue53 = comparisonValue34;
                            intermediateValue70 = comparisonValue35;
                            break;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            scalarValue17 = productValue7;
                            scalarValue18 = productValue8;
                            scalarValue19 = productValue9;
                            scalarValue20 = sumValue18;
                            continue;
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        sumValue14 = scalarValue47 + 1u;
                        scalarValue44 = comparisonValue34;
                        scalarValue45 = comparisonValue35;
                        scalarValue46 = bitwiseValue49;
                        scalarValue47 = sumValue14;
                        continue;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue40 = intermediateValue53;
                    bitwiseValue45 = intermediateValue70 >> 2u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue = productValue7;
                    branchMergedValue2 = productValue9;
                    branchMergedValue3 = productValue8;
                }
                intermediateValue33 = branchMergedValue;
                intermediateValue35 = branchMergedValue2;
                intermediateValue34 = branchMergedValue3;
                float sumValue19 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
                float productValue18 = ((sumValue19 * (intermediateValue33 + intermediateValue29)) + (RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x * intermediateValue25)) * 0.16666667163372039794921875f;
                float productValue19 = ((sumValue19 * (intermediateValue34 + intermediateValue30)) + (RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x * intermediateValue26)) * 0.16666667163372039794921875f;
                float productValue20 = ((sumValue19 * (intermediateValue35 + intermediateValue31)) + (RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x * intermediateValue27)) * 0.16666667163372039794921875f;
                float clampedValue = ceil(clamp(max(max(productValue18, productValue20), max(productValue19, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
                rdAccess_voxelBuffer(scalarValue15 + bitwiseValue11) = ((((uint(clamp(productValue19 / clampedValue, 0.0f, 1.0f) * 255.0f) << 8u) | uint(clamp(productValue18 / clampedValue, 0.0f, 1.0f) * 255.0f)) | (uint(clamp(productValue20 / clampedValue, 0.0f, 1.0f) * 255.0f) << 16u)) | (uint(clamp(clampedValue, 0.0f, 1.0f) * 255.0f) << 24u)).x;
                uint sumValue20 = scalarValue15 + 1u;
                if (sumValue20 == sumValue10)
                {
                    break;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue40 = comparisonValue27;
                    bitwiseValue45 = intermediateValue52;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    scalarValue15 = sumValue20;
                    continue;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                uint4 loadedBufferValue32 = rdLoad_intermediateValue4(scalarValue15 + bitwiseValue45);
                uint scalarValue48 = loadedBufferValue32.x;
                float bitwiseValue106 = rdUnsignedToFloat(scalarValue48 & 255u) * 0.0039215688593685626983642578125f;
                float bitwiseValue107 = rdUnsignedToFloat((scalarValue48 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                bool comparisonValue48 = scalarValue48 != 0u;
                float reinterpretedBits1 = comparisonValue48 ? asfloat(asuint((bitwiseValue107 * bitwiseValue106) * 6.0f) & intermediateValue40) : 0.0f;
                float reinterpretedBits2 = comparisonValue48 ? asfloat(asuint((bitwiseValue107 * (rdUnsignedToFloat((scalarValue48 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) & intermediateValue40) : 0.0f;
                float reinterpretedBits3 = comparisonValue48 ? asfloat(asuint((bitwiseValue107 * (rdUnsignedToFloat((scalarValue48 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) & intermediateValue40) : 0.0f;
                bool conditionValue3 = scalarValue43 < 32u;
                uint intermediateValue60;
                uint comparisonValue36;
                if (conditionValue3)
                {
                    intermediateValue60 = intermediateValue6[scalarValue43];
                    comparisonValue36 = (intermediateValue6[scalarValue43] != 4294967295u) ? 4294967295u : 0u;
                }
                else
                {
                    intermediateValue60 = 0u;
                    comparisonValue36 = asuint(bitwiseValue106);
                }
                uint intermediateValue63;
                uint bitwiseValue55;
                if (!conditionValue3)
                {
                    uint scalarValue49 = rdBitfieldInsert(rdBitfieldInsert(65536u, scalarValue29, 17u, 31u), loadedBufferValue26, 0u, 16u);
                    uint productValue37 = scalarValue43 * 1540483477u;
                    uint bitwiseValue108 = bitwiseValue94 ^ ((productValue37 ^ (productValue37 >> 24u)) * 1540483477u);
                    uint bitwiseValue109 = (bitwiseValue108 ^ (bitwiseValue108 >> 13u)) * 1540483477u;
                    uint bitwiseValue110 = bitwiseValue109 ^ (bitwiseValue109 >> 15u);
                    uint bitwiseValue111 = (bitwiseValue110 ^ (bitwiseValue110 >> 16u)) & 65535u;
                    bool comparisonValue49 = bitwiseValue111 != 0u;
                    uint bitwiseValue112 = bitwiseValue111 | 1u;
                    uint comparisonValue50 = sumValue24 & (comparisonValue49 ? bitwiseValue111 : bitwiseValue112);
                    uint comparisonValue43;
                    uint comparisonValue44;
                    uint bitwiseValue58;
                    uint sumValue15;
                    uint intermediateValue64;
                    uint intermediateValue71;
                    uint scalarValue50 = 0u;
                    uint scalarValue51 = 0u;
                    uint scalarValue52 = comparisonValue50;
                    uint scalarValue53 = 0u;
                    for (;;)
                    {
                        if (int(scalarValue53) >= int(8u))
                        {
                            intermediateValue64 = scalarValue50;
                            intermediateValue71 = scalarValue51;
                            break;
                        }
                        uint productValue38 = scalarValue52 * 4u;
                        uint4 loadedBufferValue33 = uint4(rdLoad_intermediateValue3(productValue38).x, rdLoad_intermediateValue3(productValue38 + 1u).x, rdLoad_intermediateValue3(productValue38 + 2u).x, rdLoad_intermediateValue3(productValue38 + 3u).x);
                        uint bitwiseValue113 = loadedBufferValue33.z & 65535u;
                        bool comparisonValue51 = ((((!comparisonValue49) && (bitwiseValue112 == bitwiseValue113)) || (comparisonValue49 && (bitwiseValue111 == bitwiseValue113))) && (scalarValue39 == loadedBufferValue33.x)) && (scalarValue49 == loadedBufferValue33.y);
                        bool comparisonValue52 = scalarValue50 != 0u;
                        comparisonValue44 = ((!comparisonValue51) || comparisonValue52) ? scalarValue51 : loadedBufferValue33.w;
                        comparisonValue43 = comparisonValue51 ? 4294967295u : scalarValue50;
                        bitwiseValue58 = sumValue24 & (scalarValue52 + 1u);
                        bool comparisonValue53 = comparisonValue51 || (bitwiseValue113 == 0u);
                        if ((comparisonValue52 && (!comparisonValue53)) || comparisonValue53)
                        {
                            intermediateValue64 = comparisonValue43;
                            intermediateValue71 = comparisonValue44;
                            break;
                        }
                        sumValue15 = scalarValue53 + 1u;
                        scalarValue50 = comparisonValue43;
                        scalarValue51 = comparisonValue44;
                        scalarValue52 = bitwiseValue58;
                        scalarValue53 = sumValue15;
                        continue;
                    }
                    intermediateValue63 = intermediateValue64;
                    bitwiseValue55 = intermediateValue71 >> 2u;
                }
                else
                {
                    intermediateValue63 = comparisonValue36;
                    bitwiseValue55 = intermediateValue60;
                }
                uint4 loadedBufferValue34 = rdLoad_intermediateValue4(scalarValue15 + bitwiseValue55);
                uint scalarValue54 = loadedBufferValue34.x;
                float bitwiseValue114 = rdUnsignedToFloat((scalarValue54 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                bool comparisonValue54 = scalarValue54 != 0u;
                float loadedBufferValue35 = asfloat(rdLoad_intermediateValue2(scalarValue29).x);
                multiplyAddValue2 = intermediateValue43 + mad(loadedBufferValue35, (comparisonValue54 ? asfloat(asuint((bitwiseValue114 * (rdUnsignedToFloat(scalarValue54 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) & intermediateValue63) : 0.0f) - reinterpretedBits1, reinterpretedBits1);
                multiplyAddValue1 = intermediateValue42 + mad(loadedBufferValue35, (comparisonValue54 ? asfloat(asuint((bitwiseValue114 * (rdUnsignedToFloat((scalarValue54 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) & intermediateValue63) : 0.0f) - reinterpretedBits2, reinterpretedBits2);
                multiplyAddValue = intermediateValue41 + mad(loadedBufferValue35, (comparisonValue54 ? asfloat(asuint((bitwiseValue114 * (rdUnsignedToFloat((scalarValue54 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) & intermediateValue63) : 0.0f) - reinterpretedBits3, reinterpretedBits3);
                sumValue11 = scalarValue29 + 1u;
                scalarValue42 = intermediateValue40;
                intermediateValue41 = multiplyAddValue;
                intermediateValue42 = multiplyAddValue1;
                intermediateValue43 = multiplyAddValue2;
                scalarValue29 = sumValue11;
                continue;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            bool comparisonValue55 = scalarValue40 != 0u;
            float multiplyAddValue3 = mad(sumValue19, comparisonValue40 ? (asfloat(intermediateValue14 & asuint((bitwiseValue97 * (rdUnsignedToFloat(scalarValue41 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f)) + intermediateValue43) : intermediateValue43, comparisonValue55 ? (((bitwiseValue95 * (rdUnsignedToFloat(scalarValue40 & 255u) * 0.0039215688593685626983642578125f)) * RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x) * 6.0f) : 0.0f) * 0.16666667163372039794921875f;
            float multiplyAddValue4 = mad(sumValue19, comparisonValue40 ? (asfloat(asuint((bitwiseValue97 * (rdUnsignedToFloat((scalarValue41 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) & intermediateValue14) + intermediateValue42) : intermediateValue42, comparisonValue55 ? (((bitwiseValue95 * (rdUnsignedToFloat((scalarValue40 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x) * 6.0f) : 0.0f) * 0.16666667163372039794921875f;
            float multiplyAddValue5 = mad(sumValue19, comparisonValue40 ? (asfloat(asuint((bitwiseValue97 * bitwiseValue96) * 6.0f) & intermediateValue14) + intermediateValue41) : intermediateValue41, comparisonValue55 ? (((bitwiseValue95 * (rdUnsignedToFloat((scalarValue40 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x) * 6.0f) : 0.0f) * 0.16666667163372039794921875f;
            float productValue39 = ceil(min(max(max(multiplyAddValue4, 0.0039215688593685626983642578125f), max(multiplyAddValue5, multiplyAddValue3)), 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
            rdAccess_intermediateValue5(bitwiseValue18 + scalarValue15) = (((uint(clamp(multiplyAddValue3 / productValue39, 0.0f, 1.0f) * 255.0f) + (uint(clamp(multiplyAddValue4 / productValue39, 0.0f, 1.0f) * 255.0f) * 256u)) + (uint(clamp(multiplyAddValue5 / productValue39, 0.0f, 1.0f) * 255.0f) * 65536u)) + (uint(clamp(productValue39, 0.0f, 1.0f) * 255.0f) * 16777216u)).x;
            sumValue7 = scalarValue15 + 1u;
            scalarValue15 = sumValue7;
            continue;
#endif
        }
    }
}
[numthreads(256, 1, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    localThreadIndex = stage_input.localThreadIndex;
    executeComputeStage();
}
