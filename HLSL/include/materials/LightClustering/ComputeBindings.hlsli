// Native resource and stage-interface layouts for LightClustering / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS vertexConstants[0]
#define RD_UNIFORM_LIGHTS_PER_CLUSTER vertexConstants[1]
#define RD_UNIFORM_CLUSTER_DIMENSIONS vertexConstants[2]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES vertexConstants[3]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS computeVectorConstants0[0]
#define RD_UNIFORM_LIGHTS_PER_CLUSTER computeVectorConstants0[1]
#define RD_UNIFORM_CLUSTER_DIMENSIONS computeVectorConstants0[2]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES computeVectorConstants0[3]
cbuffer ComputeVectorConstants0Buffer : register(b0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 vertexConstants[4] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
    float4 computeVectorConstants0[4] : packoffset(c0);
#endif
};
#if RD_BINDING_LAYOUT == 0
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T0_WORDS)
struct RdNativeElement_extends { uint words[RD_NATIVE_T0_WORDS]; };
StructuredBuffer<RdNativeElement_extends> extends : register(t0, space0);
#define rdAccess_extends(index) extends[(index) / RD_NATIVE_T0_WORDS].words[(index) % RD_NATIVE_T0_WORDS]
uint4 rdLoad_extends(uint wordIndex) { return uint4(rdAccess_extends(wordIndex), rdAccess_extends(wordIndex + 1u), rdAccess_extends(wordIndex + 2u), rdAccess_extends(wordIndex + 3u)); }
#else
Buffer<uint4> extends : register(t0, space0);
#define rdAccess_extends(index) extends[index]
#define rdLoad_extends(index) extends.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U1_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(u1, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_U1_WORDS].words[(index) % RD_NATIVE_U1_WORDS]
uint rdLoad_zLightLookupArray(uint wordIndex) { return rdAccess_zLightLookupArray(wordIndex); }
#else
RWBuffer<uint> zLightLookupArray : register(u1, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
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
#if defined(RD_NATIVE_U1_WORDS)
struct RdNativeElement_intermediateValue1 { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdNativeElement_intermediateValue1> intermediateValue1 : register(u1);
#define rdAccess_intermediateValue1(index) intermediateValue1[(index) / RD_NATIVE_U1_WORDS].words[(index) % RD_NATIVE_U1_WORDS]
uint rdLoad_intermediateValue1(uint wordIndex) { return rdAccess_intermediateValue1(wordIndex); }
#else
RWBuffer<uint> intermediateValue1 : register(u1);
#define rdAccess_intermediateValue1(index) intermediateValue1[index]
#define rdLoad_intermediateValue1(index) intermediateValue1.Load(index)
#endif
#endif
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#if RD_BINDING_LAYOUT == 1
static uint intermediateValue2[129];
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_extends
#define rdAccess_extends(index) extends[index]
#endif
#ifndef rdAccess_intermediateValue
#define rdAccess_intermediateValue(index) intermediateValue[index]
#endif
#ifndef rdAccess_intermediateValue1
#define rdAccess_intermediateValue1(index) intermediateValue1[index]
#endif
#ifndef rdAccess_zLightLookupArray
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#endif
