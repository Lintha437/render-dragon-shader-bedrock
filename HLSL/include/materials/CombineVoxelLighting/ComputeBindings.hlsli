// Native resource and stage-interface layouts for CombineVoxelLighting / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_TRANSITIONING_GPU_ENTRY_BUFFER_CAPACITY vertexConstants[0]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY vertexConstants[1]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR vertexConstants[2]
#define RD_UNIFORM_DIRTY_VOLUME_COUNT vertexConstants[3]
#define RD_UNIFORM_TRANSITIONING_VOLUMES_LAYER_COUNT vertexConstants[4]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_TRANSITIONING_GPU_ENTRY_BUFFER_CAPACITY computeVectorConstants0[0]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY computeVectorConstants0[1]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR computeVectorConstants0[2]
#define RD_UNIFORM_DIRTY_VOLUME_COUNT computeVectorConstants0[3]
#define RD_UNIFORM_TRANSITIONING_VOLUMES_LAYER_COUNT computeVectorConstants0[4]
cbuffer ComputeVectorConstants0Buffer : register(b0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 vertexConstants[5] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
    float4 computeVectorConstants0[5] : packoffset(c0);
#endif
};
#if RD_BINDING_LAYOUT == 0
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T0_WORDS)
struct RdNativeElement_dirtyVolumeKeys { uint words[RD_NATIVE_T0_WORDS]; };
StructuredBuffer<RdNativeElement_dirtyVolumeKeys> dirtyVolumeKeys : register(t0, space0);
#define rdAccess_dirtyVolumeKeys(index) dirtyVolumeKeys[(index) / RD_NATIVE_T0_WORDS].words[(index) % RD_NATIVE_T0_WORDS]
uint4 rdLoad_dirtyVolumeKeys(uint wordIndex) { return uint4(rdAccess_dirtyVolumeKeys(wordIndex), rdAccess_dirtyVolumeKeys(wordIndex + 1u), rdAccess_dirtyVolumeKeys(wordIndex + 2u), rdAccess_dirtyVolumeKeys(wordIndex + 3u)); }
#else
Buffer<uint4> dirtyVolumeKeys : register(t0, space0);
#define rdAccess_dirtyVolumeKeys(index) dirtyVolumeKeys[index]
#define rdLoad_dirtyVolumeKeys(index) dirtyVolumeKeys.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T1_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t1, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T1_WORDS].words[(index) % RD_NATIVE_T1_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t1, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T2_WORDS)
struct RdNativeElement_perGroupLerps { uint words[RD_NATIVE_T2_WORDS]; };
StructuredBuffer<RdNativeElement_perGroupLerps> perGroupLerps : register(t2, space0);
#define rdAccess_perGroupLerps(index) perGroupLerps[(index) / RD_NATIVE_T2_WORDS].words[(index) % RD_NATIVE_T2_WORDS]
uint4 rdLoad_perGroupLerps(uint wordIndex) { return uint4(rdAccess_perGroupLerps(wordIndex), rdAccess_perGroupLerps(wordIndex + 1u), rdAccess_perGroupLerps(wordIndex + 2u), rdAccess_perGroupLerps(wordIndex + 3u)); }
#else
Buffer<uint4> perGroupLerps : register(t2, space0);
#define rdAccess_perGroupLerps(index) perGroupLerps[index]
#define rdLoad_perGroupLerps(index) perGroupLerps.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_transitioningGpuEntryBuffer { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_transitioningGpuEntryBuffer> transitioningGpuEntryBuffer : register(t3, space0);
#define rdAccess_transitioningGpuEntryBuffer(index) transitioningGpuEntryBuffer[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_transitioningGpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_transitioningGpuEntryBuffer(wordIndex), rdAccess_transitioningGpuEntryBuffer(wordIndex + 1u), rdAccess_transitioningGpuEntryBuffer(wordIndex + 2u), rdAccess_transitioningGpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> transitioningGpuEntryBuffer : register(t3, space0);
#define rdAccess_transitioningGpuEntryBuffer(index) transitioningGpuEntryBuffer[index]
#define rdLoad_transitioningGpuEntryBuffer(index) transitioningGpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T4_WORDS)
struct RdNativeElement_transitioningVoxelBuffer { uint words[RD_NATIVE_T4_WORDS]; };
StructuredBuffer<RdNativeElement_transitioningVoxelBuffer> transitioningVoxelBuffer : register(t4, space0);
#define rdAccess_transitioningVoxelBuffer(index) transitioningVoxelBuffer[(index) / RD_NATIVE_T4_WORDS].words[(index) % RD_NATIVE_T4_WORDS]
uint4 rdLoad_transitioningVoxelBuffer(uint wordIndex) { return uint4(rdAccess_transitioningVoxelBuffer(wordIndex), rdAccess_transitioningVoxelBuffer(wordIndex + 1u), rdAccess_transitioningVoxelBuffer(wordIndex + 2u), rdAccess_transitioningVoxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> transitioningVoxelBuffer : register(t4, space0);
#define rdAccess_transitioningVoxelBuffer(index) transitioningVoxelBuffer[index]
#define rdLoad_transitioningVoxelBuffer(index) transitioningVoxelBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U5_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_U5_WORDS]; };
RWStructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(u5, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_U5_WORDS].words[(index) % RD_NATIVE_U5_WORDS]
uint rdLoad_voxelBuffer(uint wordIndex) { return rdAccess_voxelBuffer(wordIndex); }
#else
RWBuffer<uint> voxelBuffer : register(u5, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
#elif RD_BINDING_LAYOUT == 1
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T0_WORDS)
struct RdNativeElement_intermediateValue { uint words[RD_NATIVE_T0_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue> intermediateValue : register(t0);
#define rdAccess_intermediateValue(index) intermediateValue[(index) / RD_NATIVE_T0_WORDS].words[(index) % RD_NATIVE_T0_WORDS]
uint4 rdLoad_intermediateValue(uint wordIndex) { return uint4(rdAccess_intermediateValue(wordIndex), rdAccess_intermediateValue(wordIndex + 1u), rdAccess_intermediateValue(wordIndex + 2u), rdAccess_intermediateValue(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue : register(t0);
#define rdAccess_intermediateValue(index) intermediateValue[index]
#define rdLoad_intermediateValue(index) intermediateValue.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T1_WORDS)
struct RdNativeElement_intermediateValue1 { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue1> intermediateValue1 : register(t1);
#define rdAccess_intermediateValue1(index) intermediateValue1[(index) / RD_NATIVE_T1_WORDS].words[(index) % RD_NATIVE_T1_WORDS]
uint4 rdLoad_intermediateValue1(uint wordIndex) { return uint4(rdAccess_intermediateValue1(wordIndex), rdAccess_intermediateValue1(wordIndex + 1u), rdAccess_intermediateValue1(wordIndex + 2u), rdAccess_intermediateValue1(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue1 : register(t1);
#define rdAccess_intermediateValue1(index) intermediateValue1[index]
#define rdLoad_intermediateValue1(index) intermediateValue1.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T2_WORDS)
struct RdNativeElement_intermediateValue2 { uint words[RD_NATIVE_T2_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue2> intermediateValue2 : register(t2);
#define rdAccess_intermediateValue2(index) intermediateValue2[(index) / RD_NATIVE_T2_WORDS].words[(index) % RD_NATIVE_T2_WORDS]
uint4 rdLoad_intermediateValue2(uint wordIndex) { return uint4(rdAccess_intermediateValue2(wordIndex), rdAccess_intermediateValue2(wordIndex + 1u), rdAccess_intermediateValue2(wordIndex + 2u), rdAccess_intermediateValue2(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue2 : register(t2);
#define rdAccess_intermediateValue2(index) intermediateValue2[index]
#define rdLoad_intermediateValue2(index) intermediateValue2.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_intermediateValue3 { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue3> intermediateValue3 : register(t3);
#define rdAccess_intermediateValue3(index) intermediateValue3[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_intermediateValue3(uint wordIndex) { return uint4(rdAccess_intermediateValue3(wordIndex), rdAccess_intermediateValue3(wordIndex + 1u), rdAccess_intermediateValue3(wordIndex + 2u), rdAccess_intermediateValue3(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue3 : register(t3);
#define rdAccess_intermediateValue3(index) intermediateValue3[index]
#define rdLoad_intermediateValue3(index) intermediateValue3.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T4_WORDS)
struct RdNativeElement_intermediateValue4 { uint words[RD_NATIVE_T4_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue4> intermediateValue4 : register(t4);
#define rdAccess_intermediateValue4(index) intermediateValue4[(index) / RD_NATIVE_T4_WORDS].words[(index) % RD_NATIVE_T4_WORDS]
uint4 rdLoad_intermediateValue4(uint wordIndex) { return uint4(rdAccess_intermediateValue4(wordIndex), rdAccess_intermediateValue4(wordIndex + 1u), rdAccess_intermediateValue4(wordIndex + 2u), rdAccess_intermediateValue4(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue4 : register(t4);
#define rdAccess_intermediateValue4(index) intermediateValue4[index]
#define rdLoad_intermediateValue4(index) intermediateValue4.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U5_WORDS)
struct RdNativeElement_intermediateValue5 { uint words[RD_NATIVE_U5_WORDS]; };
RWStructuredBuffer<RdNativeElement_intermediateValue5> intermediateValue5 : register(u5);
#define rdAccess_intermediateValue5(index) intermediateValue5[(index) / RD_NATIVE_U5_WORDS].words[(index) % RD_NATIVE_U5_WORDS]
uint rdLoad_intermediateValue5(uint wordIndex) { return rdAccess_intermediateValue5(wordIndex); }
#else
RWBuffer<uint> intermediateValue5 : register(u5);
#define rdAccess_intermediateValue5(index) intermediateValue5[index]
#define rdLoad_intermediateValue5(index) intermediateValue5.Load(index)
#endif
#endif
static uint3 dispatchThreadId;
static uint localThreadIndex;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
    uint localThreadIndex : SV_GroupIndex;
};
#if RD_BINDING_LAYOUT == 0
groupshared uint intermediateValue[32];
#elif RD_BINDING_LAYOUT == 1
groupshared uint intermediateValue6[32];
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_dirtyVolumeKeys
#define rdAccess_dirtyVolumeKeys(index) dirtyVolumeKeys[index]
#endif
#ifndef rdAccess_gpuEntryBuffer
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#endif
#ifndef rdAccess_intermediateValue
#define rdAccess_intermediateValue(index) intermediateValue[index]
#endif
#ifndef rdAccess_intermediateValue1
#define rdAccess_intermediateValue1(index) intermediateValue1[index]
#endif
#ifndef rdAccess_intermediateValue2
#define rdAccess_intermediateValue2(index) intermediateValue2[index]
#endif
#ifndef rdAccess_intermediateValue3
#define rdAccess_intermediateValue3(index) intermediateValue3[index]
#endif
#ifndef rdAccess_intermediateValue4
#define rdAccess_intermediateValue4(index) intermediateValue4[index]
#endif
#ifndef rdAccess_intermediateValue5
#define rdAccess_intermediateValue5(index) intermediateValue5[index]
#endif
#ifndef rdAccess_perGroupLerps
#define rdAccess_perGroupLerps(index) perGroupLerps[index]
#endif
#ifndef rdAccess_transitioningGpuEntryBuffer
#define rdAccess_transitioningGpuEntryBuffer(index) transitioningGpuEntryBuffer[index]
#endif
#ifndef rdAccess_transitioningVoxelBuffer
#define rdAccess_transitioningVoxelBuffer(index) transitioningVoxelBuffer[index]
#endif
#ifndef rdAccess_voxelBuffer
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#endif
