// Native resource and stage-interface layouts for GPUDebugUtils / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U0_WORDS)
struct RdNativeElement_intermediateValue { uint words[RD_NATIVE_U0_WORDS]; };
RWStructuredBuffer<RdNativeElement_intermediateValue> intermediateValue : register(u0);
#define rdAccess_intermediateValue(index) intermediateValue[(index) / RD_NATIVE_U0_WORDS].words[(index) % RD_NATIVE_U0_WORDS]
int4 rdLoad_intermediateValue(uint wordIndex) { return asint(uint4(rdAccess_intermediateValue(wordIndex), rdAccess_intermediateValue(wordIndex + 1u), rdAccess_intermediateValue(wordIndex + 2u), rdAccess_intermediateValue(wordIndex + 3u))); }
#else
RWBuffer<int4> intermediateValue : register(u0);
#define rdAccess_intermediateValue(index) intermediateValue[index]
#define rdLoad_intermediateValue(index) intermediateValue.Load(index)
#endif
#elif RD_BINDING_LAYOUT == 1
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U0_WORDS)
struct RdNativeElement_fakeRwBuffer { uint words[RD_NATIVE_U0_WORDS]; };
RWStructuredBuffer<RdNativeElement_fakeRwBuffer> fakeRwBuffer : register(u0, space0);
#define rdAccess_fakeRwBuffer(index) fakeRwBuffer[(index) / RD_NATIVE_U0_WORDS].words[(index) % RD_NATIVE_U0_WORDS]
int4 rdLoad_fakeRwBuffer(uint wordIndex) { return asint(uint4(rdAccess_fakeRwBuffer(wordIndex), rdAccess_fakeRwBuffer(wordIndex + 1u), rdAccess_fakeRwBuffer(wordIndex + 2u), rdAccess_fakeRwBuffer(wordIndex + 3u))); }
#else
RWBuffer<int4> fakeRwBuffer : register(u0, space0);
#define rdAccess_fakeRwBuffer(index) fakeRwBuffer[index]
#define rdLoad_fakeRwBuffer(index) fakeRwBuffer.Load(index)
#endif
#elif RD_BINDING_LAYOUT == 2
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U0_WORDS)
struct RdNativeElement_intermediateValue { uint words[RD_NATIVE_U0_WORDS]; };
RWStructuredBuffer<RdNativeElement_intermediateValue> intermediateValue : register(u0);
#define rdAccess_intermediateValue(index) intermediateValue[(index) / RD_NATIVE_U0_WORDS].words[(index) % RD_NATIVE_U0_WORDS]
int rdLoad_intermediateValue(uint wordIndex) { return asint(rdAccess_intermediateValue(wordIndex)); }
#else
RWBuffer<int> intermediateValue : register(u0);
#define rdAccess_intermediateValue(index) intermediateValue[index]
#define rdLoad_intermediateValue(index) intermediateValue.Load(index)
#endif
#elif RD_BINDING_LAYOUT == 3
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U0_WORDS)
struct RdNativeElement_fakeRwBuffer { uint words[RD_NATIVE_U0_WORDS]; };
RWStructuredBuffer<RdNativeElement_fakeRwBuffer> fakeRwBuffer : register(u0, space0);
#define rdAccess_fakeRwBuffer(index) fakeRwBuffer[(index) / RD_NATIVE_U0_WORDS].words[(index) % RD_NATIVE_U0_WORDS]
int rdLoad_fakeRwBuffer(uint wordIndex) { return asint(rdAccess_fakeRwBuffer(wordIndex)); }
#else
RWBuffer<int> fakeRwBuffer : register(u0, space0);
#define rdAccess_fakeRwBuffer(index) fakeRwBuffer[index]
#define rdLoad_fakeRwBuffer(index) fakeRwBuffer.Load(index)
#endif
#endif
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_fakeRwBuffer
#define rdAccess_fakeRwBuffer(index) fakeRwBuffer[index]
#endif
#ifndef rdAccess_intermediateValue
#define rdAccess_intermediateValue(index) intermediateValue[index]
#endif
