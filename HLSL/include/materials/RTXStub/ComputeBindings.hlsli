// Native resource and stage-interface layouts for RTXStub / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
RWTexture3D<float4> volumetricResolvedInscatterRW : register(u60, space0);
RWTexture3D<float4> volumetricResolvedTransmissionRW : register(u61, space0);
RWTexture3D<float> volumetricInscatterRW : register(u62, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 1
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
RWTexture3D<float4> volumetricGIResolvedInscatterRW : register(u63, space0);
RWTexture3D<float> volumetricGIInscatterRW[2] : register(u64, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 2
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferNormal : register(t15, space0);
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
RWTexture2D<float> outputBufferHistoryLength : register(u2, space0);
RWTexture2D<float> outputDenoisingMoments[4] : register(u40, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 3
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
RWTexture2D<float> denoisingOutputs[8] : register(u0, space3);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 4
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferNormal : register(t15, space0);
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
Texture2D<float4> inputPrimaryThroughput : register(t47, space0);
Texture2DArray<float4> blueNoiseTexture : register(t58, space0);
RWTexture2D<float> outputBufferHistoryLength : register(u2, space0);
RWTexture2D<float> denoisingOutputs[8] : register(u0, space3);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 5
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
RWTexture2D<float> outputBufferHistoryLength : register(u2, space0);
RWTexture2D<float> outputDenoisingMoments[4] : register(u40, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 6
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
Texture2D<float4> inputPrimaryThroughput : register(t47, space0);
Texture2DArray<float4> blueNoiseTexture : register(t58, space0);
RWTexture2D<float> denoisingOutputs[8] : register(u0, space3);
RWTexture2D<float> denoisingChromaAndVarianceOutputs[4] : register(u8, space3);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 7
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T19_WORDS)
struct RdNativeElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdNativeElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define rdAccess_inputIncidentLight(index) inputIncidentLight[(index) / RD_NATIVE_T19_WORDS].words[(index) % RD_NATIVE_T19_WORDS]
uint4 rdLoad_inputIncidentLight(uint wordIndex) { return uint4(rdAccess_inputIncidentLight(wordIndex), rdAccess_inputIncidentLight(wordIndex + 1u), rdAccess_inputIncidentLight(wordIndex + 2u), rdAccess_inputIncidentLight(wordIndex + 3u)); }
#else
Buffer<uint4> inputIncidentLight : register(t19, space0);
#define rdAccess_inputIncidentLight(index) inputIncidentLight[index]
#define rdLoad_inputIncidentLight(index) inputIncidentLight.Load(index)
#endif
Texture2D<float4> inputThisFrameTAAHistory : register(t41, space0);
RWTexture2D<float4> outputBufferFinal : register(u12, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 8
static float intermediateValue103;
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T35_WORDS)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_T35_WORDS]; };
StructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(t35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_T35_WORDS].words[(wordIndex) % RD_NATIVE_T35_WORDS]
#elif defined(RD_NATIVE_U35_WORDS) && !defined(RD_NATIVE_RAW_T35)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_U35_WORDS]; };
RWStructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(u35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_U35_WORDS].words[(wordIndex) % RD_NATIVE_U35_WORDS]
#define RD_BYTE_WRITABLE_pbrTextureDataBuffer 1
#else
ByteAddressBuffer pbrTextureDataBuffer : register(t35, space0);
#endif
uint rdByteLoad_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    return rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
#else
    return pbrTextureDataBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_pbrTextureDataBuffer)
void rdByteStore_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    pbrTextureDataBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    pbrTextureDataBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE2_WORDS)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#elif defined(RD_NATIVE_U0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE2)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_vertexBuffers 1
#else
ByteAddressBuffer vertexBuffers[4096] : register(t0, space2);
#endif
uint rdByteLoad_vertexBuffers_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    return rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
#else
    return vertexBuffers[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexBuffers_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexBuffers_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexBuffers_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexBuffers)
void rdByteStore_vertexBuffers_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexBuffers[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexBuffers[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexBuffers_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexBuffers_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T2_SPACE13_WORDS)
struct RdByteElement_inputTemporallyStableLights { uint words[RD_NATIVE_T2_SPACE13_WORDS]; };
StructuredBuffer<RdByteElement_inputTemporallyStableLights> inputTemporallyStableLights : register(t2, space13);
#define RD_BYTE_STRUCT_inputTemporallyStableLights 1
#define rdByteWord_inputTemporallyStableLights(resourceIndex, wordIndex) inputTemporallyStableLights[(wordIndex) / RD_NATIVE_T2_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_T2_SPACE13_WORDS]
#elif defined(RD_NATIVE_U2_SPACE13_WORDS) && !defined(RD_NATIVE_RAW_T2_SPACE13)
struct RdByteElement_inputTemporallyStableLights { uint words[RD_NATIVE_U2_SPACE13_WORDS]; };
RWStructuredBuffer<RdByteElement_inputTemporallyStableLights> inputTemporallyStableLights : register(u2, space13);
#define RD_BYTE_STRUCT_inputTemporallyStableLights 1
#define rdByteWord_inputTemporallyStableLights(resourceIndex, wordIndex) inputTemporallyStableLights[(wordIndex) / RD_NATIVE_U2_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_U2_SPACE13_WORDS]
#define RD_BYTE_WRITABLE_inputTemporallyStableLights 1
#else
ByteAddressBuffer inputTemporallyStableLights : register(t2, space13);
#endif
uint rdByteLoad_inputTemporallyStableLights_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputTemporallyStableLights)
    return rdByteWord_inputTemporallyStableLights(resourceIndex, byteOffset >> 2u);
#else
    return inputTemporallyStableLights.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputTemporallyStableLights_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputTemporallyStableLights_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputTemporallyStableLights_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputTemporallyStableLights_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputTemporallyStableLights_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputTemporallyStableLights_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputTemporallyStableLights_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputTemporallyStableLights)
void rdByteStore_inputTemporallyStableLights_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputTemporallyStableLights)
    rdByteWord_inputTemporallyStableLights(resourceIndex, byteOffset >> 2u) = value;
#else
    inputTemporallyStableLights.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputTemporallyStableLights_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputTemporallyStableLights)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputTemporallyStableLights(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputTemporallyStableLights(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputTemporallyStableLights.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputTemporallyStableLights_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputTemporallyStableLights_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputTemporallyStableLights_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputTemporallyStableLights_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputTemporallyStableLights_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputTemporallyStableLights_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE10_WORDS)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_T0_SPACE10_WORDS]; };
StructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(t0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE10_WORDS]
#elif defined(RD_NATIVE_U0_SPACE10_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE10)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_U0_SPACE10_WORDS]; };
RWStructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(u0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE10_WORDS]
#define RD_BYTE_WRITABLE_faceDataBuffersRW 1
#else
ByteAddressBuffer faceDataBuffersRW[4096] : register(t0, space10);
#endif
uint rdByteLoad_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    return rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceDataBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceDataBuffersRW)
void rdByteStore_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceDataBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceDataBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferNormal : register(t15, space0);
Texture2D<float4> inputGeometryNormal : register(t43, space0);
Texture2D<float4> inputPrimaryWorldPosition : register(t45, space0);
Texture2DArray<float4> blueNoiseTexture : register(t58, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
RWTexture2D<float> outputBufferDebug : register(u14, space0);
RWTexture2D<float4> outputAdaptiveDenoiserReference : register(u38, space0);
SamplerState defaultSampler : register(s0, space0);
static uint3 workgroupId;
static uint3 localThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue18;
static RayQuery<RAY_FLAG_NONE> intermediateValue30;
static RayQuery<RAY_FLAG_NONE> intermediateValue64;
#elif RD_BINDING_LAYOUT == 9
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
RWTexture2D<float> denoisingOutputs[8] : register(u0, space3);
RWTexture2D<float> denoisingChromaAndVarianceOutputs[4] : register(u8, space3);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 10
static float intermediateValue102;
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T19_WORDS)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_T19_WORDS].words[(wordIndex) % RD_NATIVE_T19_WORDS]
#elif defined(RD_NATIVE_U19_WORDS) && !defined(RD_NATIVE_RAW_T19)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_U19_WORDS]; };
RWStructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(u19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_U19_WORDS].words[(wordIndex) % RD_NATIVE_U19_WORDS]
#define RD_BYTE_WRITABLE_inputIncidentLight 1
#else
ByteAddressBuffer inputIncidentLight : register(t19, space0);
#endif
uint rdByteLoad_inputIncidentLight_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    return rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
#else
    return inputIncidentLight.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputIncidentLight)
void rdByteStore_inputIncidentLight_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u) = value;
#else
    inputIncidentLight.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputIncidentLight.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T35_WORDS)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_T35_WORDS]; };
StructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(t35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_T35_WORDS].words[(wordIndex) % RD_NATIVE_T35_WORDS]
#elif defined(RD_NATIVE_U35_WORDS) && !defined(RD_NATIVE_RAW_T35)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_U35_WORDS]; };
RWStructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(u35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_U35_WORDS].words[(wordIndex) % RD_NATIVE_U35_WORDS]
#define RD_BYTE_WRITABLE_pbrTextureDataBuffer 1
#else
ByteAddressBuffer pbrTextureDataBuffer : register(t35, space0);
#endif
uint rdByteLoad_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    return rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
#else
    return pbrTextureDataBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_pbrTextureDataBuffer)
void rdByteStore_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    pbrTextureDataBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    pbrTextureDataBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE2_WORDS)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#elif defined(RD_NATIVE_U0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE2)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_vertexBuffers 1
#else
ByteAddressBuffer vertexBuffers[4096] : register(t0, space2);
#endif
uint rdByteLoad_vertexBuffers_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    return rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
#else
    return vertexBuffers[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexBuffers_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexBuffers_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexBuffers_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexBuffers)
void rdByteStore_vertexBuffers_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexBuffers[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexBuffers[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexBuffers_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexBuffers_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T2_SPACE13_WORDS)
struct RdByteElement_inputTemporallyStableLights { uint words[RD_NATIVE_T2_SPACE13_WORDS]; };
StructuredBuffer<RdByteElement_inputTemporallyStableLights> inputTemporallyStableLights : register(t2, space13);
#define RD_BYTE_STRUCT_inputTemporallyStableLights 1
#define rdByteWord_inputTemporallyStableLights(resourceIndex, wordIndex) inputTemporallyStableLights[(wordIndex) / RD_NATIVE_T2_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_T2_SPACE13_WORDS]
#elif defined(RD_NATIVE_U2_SPACE13_WORDS) && !defined(RD_NATIVE_RAW_T2_SPACE13)
struct RdByteElement_inputTemporallyStableLights { uint words[RD_NATIVE_U2_SPACE13_WORDS]; };
RWStructuredBuffer<RdByteElement_inputTemporallyStableLights> inputTemporallyStableLights : register(u2, space13);
#define RD_BYTE_STRUCT_inputTemporallyStableLights 1
#define rdByteWord_inputTemporallyStableLights(resourceIndex, wordIndex) inputTemporallyStableLights[(wordIndex) / RD_NATIVE_U2_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_U2_SPACE13_WORDS]
#define RD_BYTE_WRITABLE_inputTemporallyStableLights 1
#else
ByteAddressBuffer inputTemporallyStableLights : register(t2, space13);
#endif
uint rdByteLoad_inputTemporallyStableLights_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputTemporallyStableLights)
    return rdByteWord_inputTemporallyStableLights(resourceIndex, byteOffset >> 2u);
#else
    return inputTemporallyStableLights.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputTemporallyStableLights_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputTemporallyStableLights_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputTemporallyStableLights_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputTemporallyStableLights_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputTemporallyStableLights_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputTemporallyStableLights_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputTemporallyStableLights_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputTemporallyStableLights)
void rdByteStore_inputTemporallyStableLights_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputTemporallyStableLights)
    rdByteWord_inputTemporallyStableLights(resourceIndex, byteOffset >> 2u) = value;
#else
    inputTemporallyStableLights.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputTemporallyStableLights_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputTemporallyStableLights)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputTemporallyStableLights(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputTemporallyStableLights(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputTemporallyStableLights.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputTemporallyStableLights_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputTemporallyStableLights_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputTemporallyStableLights_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputTemporallyStableLights_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputTemporallyStableLights_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputTemporallyStableLights_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputTemporallyStableLights_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputTemporallyStableLights_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE10_WORDS)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_T0_SPACE10_WORDS]; };
StructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(t0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE10_WORDS]
#elif defined(RD_NATIVE_U0_SPACE10_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE10)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_U0_SPACE10_WORDS]; };
RWStructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(u0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE10_WORDS]
#define RD_BYTE_WRITABLE_faceDataBuffersRW 1
#else
ByteAddressBuffer faceDataBuffersRW[4096] : register(t0, space10);
#endif
uint rdByteLoad_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    return rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceDataBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceDataBuffersRW)
void rdByteStore_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceDataBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceDataBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2D<float4> previousPrimaryNormalBuffer : register(t5, space0);
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferSurfaceOpacityAndObjectCategory : register(t17, space0);
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
Texture2D<float4> inputPrimaryWorldPosition : register(t45, space0);
Texture2D<float4> inputPreviousGeometryNormal : register(t49, space0);
Texture2D<float4> inputAdaptiveDenoiserReference : register(t53, space0);
Texture2DArray<float4> blueNoiseTexture : register(t58, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
RWTexture2D<float> outputBufferDebug : register(u14, space0);
RWTexture2D<float4> outputAdaptiveDenoiserGradients[2] : register(u36, space0);
RWTexture2D<int4> outputAdaptiveDenoiserPlaneIdentifier : register(u39, space0);
RWTexture2D<float> denoisingOutputs[8] : register(u0, space3);
SamplerState defaultSampler : register(s0, space0);
static uint3 workgroupId;
static uint3 localThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue16;
static RayQuery<RAY_FLAG_NONE> intermediateValue30;
static RayQuery<RAY_FLAG_NONE> intermediateValue63;
#elif RD_BINDING_LAYOUT == 11
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
RWTexture2D<float> shadowDenoisingOutputs[2] : register(u0, space4);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 12
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
RWTexture3D<float> volumetricGIInscatterRW[2] : register(u64, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 13
static float intermediateValue13;
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T2_WORDS)
struct RdByteElement_vertexIrradianceCacheUpdateChunks { uint words[RD_NATIVE_T2_WORDS]; };
StructuredBuffer<RdByteElement_vertexIrradianceCacheUpdateChunks> vertexIrradianceCacheUpdateChunks : register(t2, space0);
#define RD_BYTE_STRUCT_vertexIrradianceCacheUpdateChunks 1
#define rdByteWord_vertexIrradianceCacheUpdateChunks(resourceIndex, wordIndex) vertexIrradianceCacheUpdateChunks[(wordIndex) / RD_NATIVE_T2_WORDS].words[(wordIndex) % RD_NATIVE_T2_WORDS]
#elif defined(RD_NATIVE_U2_WORDS) && !defined(RD_NATIVE_RAW_T2)
struct RdByteElement_vertexIrradianceCacheUpdateChunks { uint words[RD_NATIVE_U2_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexIrradianceCacheUpdateChunks> vertexIrradianceCacheUpdateChunks : register(u2, space0);
#define RD_BYTE_STRUCT_vertexIrradianceCacheUpdateChunks 1
#define rdByteWord_vertexIrradianceCacheUpdateChunks(resourceIndex, wordIndex) vertexIrradianceCacheUpdateChunks[(wordIndex) / RD_NATIVE_U2_WORDS].words[(wordIndex) % RD_NATIVE_U2_WORDS]
#define RD_BYTE_WRITABLE_vertexIrradianceCacheUpdateChunks 1
#else
ByteAddressBuffer vertexIrradianceCacheUpdateChunks : register(t2, space0);
#endif
uint rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCacheUpdateChunks)
    return rdByteWord_vertexIrradianceCacheUpdateChunks(resourceIndex, byteOffset >> 2u);
#else
    return vertexIrradianceCacheUpdateChunks.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexIrradianceCacheUpdateChunks_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexIrradianceCacheUpdateChunks_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexIrradianceCacheUpdateChunks_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexIrradianceCacheUpdateChunks)
void rdByteStore_vertexIrradianceCacheUpdateChunks_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCacheUpdateChunks)
    rdByteWord_vertexIrradianceCacheUpdateChunks(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexIrradianceCacheUpdateChunks.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCacheUpdateChunks)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexIrradianceCacheUpdateChunks(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexIrradianceCacheUpdateChunks(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexIrradianceCacheUpdateChunks.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCacheUpdateChunks_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexIrradianceCacheUpdateChunks_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexIrradianceCacheUpdateChunks_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T19_WORDS)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_T19_WORDS].words[(wordIndex) % RD_NATIVE_T19_WORDS]
#elif defined(RD_NATIVE_U19_WORDS) && !defined(RD_NATIVE_RAW_T19)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_U19_WORDS]; };
RWStructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(u19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_U19_WORDS].words[(wordIndex) % RD_NATIVE_U19_WORDS]
#define RD_BYTE_WRITABLE_inputIncidentLight 1
#else
ByteAddressBuffer inputIncidentLight : register(t19, space0);
#endif
uint rdByteLoad_inputIncidentLight_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    return rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
#else
    return inputIncidentLight.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputIncidentLight)
void rdByteStore_inputIncidentLight_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u) = value;
#else
    inputIncidentLight.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputIncidentLight.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T35_WORDS)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_T35_WORDS]; };
StructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(t35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_T35_WORDS].words[(wordIndex) % RD_NATIVE_T35_WORDS]
#elif defined(RD_NATIVE_U35_WORDS) && !defined(RD_NATIVE_RAW_T35)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_U35_WORDS]; };
RWStructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(u35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_U35_WORDS].words[(wordIndex) % RD_NATIVE_U35_WORDS]
#define RD_BYTE_WRITABLE_pbrTextureDataBuffer 1
#else
ByteAddressBuffer pbrTextureDataBuffer : register(t35, space0);
#endif
uint rdByteLoad_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    return rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
#else
    return pbrTextureDataBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_pbrTextureDataBuffer)
void rdByteStore_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    pbrTextureDataBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    pbrTextureDataBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE2_WORDS)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#elif defined(RD_NATIVE_U0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE2)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_vertexBuffers 1
#else
ByteAddressBuffer vertexBuffers[4096] : register(t0, space2);
#endif
uint rdByteLoad_vertexBuffers_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    return rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
#else
    return vertexBuffers[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexBuffers_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexBuffers_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexBuffers_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexBuffers)
void rdByteStore_vertexBuffers_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexBuffers[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexBuffers[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexBuffers_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexBuffers_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE13_WORDS)
struct RdByteElement_inputLightsBuffer { uint words[RD_NATIVE_T0_SPACE13_WORDS]; };
StructuredBuffer<RdByteElement_inputLightsBuffer> inputLightsBuffer : register(t0, space13);
#define RD_BYTE_STRUCT_inputLightsBuffer 1
#define rdByteWord_inputLightsBuffer(resourceIndex, wordIndex) inputLightsBuffer[(wordIndex) / RD_NATIVE_T0_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE13_WORDS]
#elif defined(RD_NATIVE_U0_SPACE13_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE13)
struct RdByteElement_inputLightsBuffer { uint words[RD_NATIVE_U0_SPACE13_WORDS]; };
RWStructuredBuffer<RdByteElement_inputLightsBuffer> inputLightsBuffer : register(u0, space13);
#define RD_BYTE_STRUCT_inputLightsBuffer 1
#define rdByteWord_inputLightsBuffer(resourceIndex, wordIndex) inputLightsBuffer[(wordIndex) / RD_NATIVE_U0_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE13_WORDS]
#define RD_BYTE_WRITABLE_inputLightsBuffer 1
#else
ByteAddressBuffer inputLightsBuffer : register(t0, space13);
#endif
uint rdByteLoad_inputLightsBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputLightsBuffer)
    return rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u);
#else
    return inputLightsBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputLightsBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputLightsBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputLightsBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputLightsBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputLightsBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputLightsBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputLightsBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputLightsBuffer)
void rdByteStore_inputLightsBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputLightsBuffer)
    rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    inputLightsBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputLightsBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputLightsBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputLightsBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputLightsBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputLightsBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputLightsBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputLightsBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputLightsBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputLightsBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_U0_SPACE1_WORDS)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_U0_SPACE1_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(u0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE1_WORDS]
#define RD_BYTE_WRITABLE_vertexIrradianceCache 1
#elif defined(RD_NATIVE_T0_SPACE1_WORDS) && !defined(RD_NATIVE_RAW_U0_SPACE1)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_T0_SPACE1_WORDS]; };
StructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(t0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE1_WORDS]
#else
RWByteAddressBuffer vertexIrradianceCache[4096] : register(u0, space1);
#endif
uint rdByteLoad_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    return rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
#else
    return vertexIrradianceCache[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u)); }
#if !defined(RD_BYTE_STRUCT_vertexIrradianceCache) || defined(RD_BYTE_WRITABLE_vertexIrradianceCache)
void rdByteStore_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexIrradianceCache[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexIrradianceCache[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE10_WORDS)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_T0_SPACE10_WORDS]; };
StructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(t0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE10_WORDS]
#elif defined(RD_NATIVE_U0_SPACE10_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE10)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_U0_SPACE10_WORDS]; };
RWStructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(u0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE10_WORDS]
#define RD_BYTE_WRITABLE_faceDataBuffersRW 1
#else
ByteAddressBuffer faceDataBuffersRW[4096] : register(t0, space10);
#endif
uint rdByteLoad_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    return rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceDataBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceDataBuffersRW)
void rdByteStore_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceDataBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceDataBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2DArray<float4> skyTexture : register(t59, space0);
Texture2DArray<float4> causticsTexture : register(t60, space0);
Texture2D<float4> wibblyTexture : register(t61, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
SamplerState defaultSampler : register(s0, space0);
SamplerState linearSampler : register(s1, space0);
SamplerState linearWrapSampler : register(s2, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue55;
static RayQuery<RAY_FLAG_NONE> intermediateValue82;
static RayQuery<RAY_FLAG_NONE> intermediateValue243;
static RayQuery<RAY_FLAG_NONE> intermediateValue258;
static RayQuery<RAY_FLAG_NONE> intermediateValue293;
static RayQuery<RAY_FLAG_NONE> intermediateValue295;
static RayQuery<RAY_FLAG_NONE> intermediateValue326;
#elif RD_BINDING_LAYOUT == 14
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<int4> inputAdaptiveDenoiserPlaneIdentifier : register(t54, space0);
RWTexture2D<float> outputAdaptiveDenoiserGradients[2] : register(u36, space0);
static uint3 localThreadId;
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 localThreadId : SV_GroupThreadID;
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
groupshared uint intermediateValue[138];
groupshared float intermediateValue1[276];
#elif RD_BINDING_LAYOUT == 15
cbuffer PreBlasSkinningCBUBO : register(b0, space99)
{
    float4 preBlasSkinningCbConstants[35] : packoffset(c0);
};
RWByteAddressBuffer vertexBuffersRW[4096] : register(u0, space9);
static uint3 workgroupId;
static uint localThreadIndex;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint localThreadIndex : SV_GroupIndex;
};
#elif RD_BINDING_LAYOUT == 16
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T35_WORDS)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_T35_WORDS]; };
StructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(t35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_T35_WORDS].words[(wordIndex) % RD_NATIVE_T35_WORDS]
#elif defined(RD_NATIVE_U35_WORDS) && !defined(RD_NATIVE_RAW_T35)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_U35_WORDS]; };
RWStructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(u35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_U35_WORDS].words[(wordIndex) % RD_NATIVE_U35_WORDS]
#define RD_BYTE_WRITABLE_pbrTextureDataBuffer 1
#else
ByteAddressBuffer pbrTextureDataBuffer : register(t35, space0);
#endif
uint rdByteLoad_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    return rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
#else
    return pbrTextureDataBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_pbrTextureDataBuffer)
void rdByteStore_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    pbrTextureDataBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    pbrTextureDataBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE2_WORDS)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#elif defined(RD_NATIVE_U0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE2)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_vertexBuffers 1
#else
ByteAddressBuffer vertexBuffers[4096] : register(t0, space2);
#endif
uint rdByteLoad_vertexBuffers_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    return rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
#else
    return vertexBuffers[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexBuffers_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexBuffers_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexBuffers_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexBuffers)
void rdByteStore_vertexBuffers_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexBuffers[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexBuffers[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexBuffers_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexBuffers_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_U0_SPACE10_WORDS)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_U0_SPACE10_WORDS]; };
RWStructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(u0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE10_WORDS]
#define RD_BYTE_WRITABLE_faceDataBuffersRW 1
#elif defined(RD_NATIVE_T0_SPACE10_WORDS) && !defined(RD_NATIVE_RAW_U0_SPACE10)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_T0_SPACE10_WORDS]; };
StructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(t0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE10_WORDS]
#else
RWByteAddressBuffer faceDataBuffersRW[4096] : register(u0, space10);
#endif
uint rdByteLoad_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    return rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceDataBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if !defined(RD_BYTE_STRUCT_faceDataBuffersRW) || defined(RD_BYTE_WRITABLE_faceDataBuffersRW)
void rdByteStore_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceDataBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceDataBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_U0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#elif defined(RD_NATIVE_T0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_U0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#else
RWByteAddressBuffer faceUvBuffersRW[4096] : register(u0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if !defined(RD_BYTE_STRUCT_faceUvBuffersRW) || defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> textures[4096] : register(t0, space6);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 17

#elif RD_BINDING_LAYOUT == 18
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
Texture2D<float4> shadowDenoisingInputs[2] : register(t0, space4);
RWTexture2D<int4> outputTileClassification : register(u44, space0);
static uint3 dispatchThreadId;
static uint localThreadIndex;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
    uint localThreadIndex : SV_GroupIndex;
};
groupshared uint intermediateValue[16];
groupshared uint intermediateValue1[16];
#elif RD_BINDING_LAYOUT == 19
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_U0_SPACE1_WORDS)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_U0_SPACE1_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(u0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE1_WORDS]
#define RD_BYTE_WRITABLE_vertexIrradianceCache 1
#elif defined(RD_NATIVE_T0_SPACE1_WORDS) && !defined(RD_NATIVE_RAW_U0_SPACE1)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_T0_SPACE1_WORDS]; };
StructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(t0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE1_WORDS]
#else
RWByteAddressBuffer vertexIrradianceCache[4096] : register(u0, space1);
#endif
uint rdByteLoad_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    return rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
#else
    return vertexIrradianceCache[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u)); }
#if !defined(RD_BYTE_STRUCT_vertexIrradianceCache) || defined(RD_BYTE_WRITABLE_vertexIrradianceCache)
void rdByteStore_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexIrradianceCache[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexIrradianceCache[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 20
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferIncomingIrradianceCache : register(t18, space0);
Texture2D<float4> inputBufferReflectionMotionVectors : register(t22, space0);
Texture2D<float4> inputBufferPreInterleaveCurrent : register(t25, space0);
Texture2D<float4> inputBufferPreInterleavePrevious : register(t26, space0);
RWTexture2D<float4> outputBufferMotionVectors : register(u10, space0);
RWTexture2D<float4> outputBufferFinal : register(u12, space0);
RWTexture2D<float4> outputBufferReprojectedPathLength : register(u20, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 21
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
Texture2D<float4> inputBufferMotionVectors : register(t21, space0);
Texture2D<float4> inputTAAHistory : register(t40, space0);
Texture2D<float4> inputFinalColour : register(t42, space0);
RWTexture2D<float4> outputBufferTAAHistory : register(u30, space0);
SamplerState linearSampler : register(s1, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 22
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE2_WORDS)
struct RdByteElement_faceIrradianceCache { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_faceIrradianceCache> faceIrradianceCache[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_faceIrradianceCache 1
#define rdByteWord_faceIrradianceCache(resourceIndex, wordIndex) faceIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#elif defined(RD_NATIVE_U0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE2)
struct RdByteElement_faceIrradianceCache { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_faceIrradianceCache> faceIrradianceCache[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_faceIrradianceCache 1
#define rdByteWord_faceIrradianceCache(resourceIndex, wordIndex) faceIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_faceIrradianceCache 1
#else
ByteAddressBuffer faceIrradianceCache[4096] : register(t0, space2);
#endif
uint rdByteLoad_faceIrradianceCache_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCache)
    return rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u);
#else
    return faceIrradianceCache[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceIrradianceCache_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceIrradianceCache_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceIrradianceCache_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceIrradianceCache)
void rdByteStore_faceIrradianceCache_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCache)
    rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u) = value;
#else
    faceIrradianceCache[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCache)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceIrradianceCache[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceIrradianceCache_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceIrradianceCache_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceIrradianceCache_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2D<float4> inputPrimaryWorldPosition : register(t45, space0);
Texture2DArray<float4> blueNoiseTexture : register(t58, space0);
Texture2DArray<float4> skyTexture : register(t59, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
Texture3D<float4> volumetricGIInscatterPrevious : register(t39, space0);
RWTexture3D<float4> volumetricGIInscatterRW[2] : register(u64, space0);
SamplerState defaultSampler : register(s0, space0);
SamplerState linearSampler : register(s1, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue22;
#elif RD_BINDING_LAYOUT == 23
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_U0_SPACE2_WORDS)
struct RdByteElement_faceIrradianceCache { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_faceIrradianceCache> faceIrradianceCache[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_faceIrradianceCache 1
#define rdByteWord_faceIrradianceCache(resourceIndex, wordIndex) faceIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_faceIrradianceCache 1
#elif defined(RD_NATIVE_T0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_U0_SPACE2)
struct RdByteElement_faceIrradianceCache { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_faceIrradianceCache> faceIrradianceCache[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_faceIrradianceCache 1
#define rdByteWord_faceIrradianceCache(resourceIndex, wordIndex) faceIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#else
RWByteAddressBuffer faceIrradianceCache[4096] : register(u0, space2);
#endif
uint rdByteLoad_faceIrradianceCache_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCache)
    return rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u);
#else
    return faceIrradianceCache[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceIrradianceCache_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceIrradianceCache_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceIrradianceCache_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u)); }
#if !defined(RD_BYTE_STRUCT_faceIrradianceCache) || defined(RD_BYTE_WRITABLE_faceIrradianceCache)
void rdByteStore_faceIrradianceCache_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCache)
    rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u) = value;
#else
    faceIrradianceCache[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCache)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceIrradianceCache[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceIrradianceCache_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceIrradianceCache_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceIrradianceCache_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 24
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2D<float4> inputPrimaryWorldPosition : register(t45, space0);
Texture2DArray<float4> blueNoiseTexture : register(t58, space0);
Texture2DArray<float4> causticsTexture : register(t60, space0);
Texture2D<float4> wibblyTexture : register(t61, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
Texture3D<float4> volumetricInscatterPrevious : register(t13, space0);
RWTexture3D<float4> volumetricInscatterRW : register(u62, space0);
SamplerState defaultSampler : register(s0, space0);
SamplerState linearSampler : register(s1, space0);
SamplerState linearWrapSampler : register(s2, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue14;
static RayQuery<RAY_FLAG_NONE> intermediateValue33;
static RayQuery<RAY_FLAG_NONE> intermediateValue42;
static RayQuery<RAY_FLAG_NONE> intermediateValue53;
#elif RD_BINDING_LAYOUT == 25
static uint intermediateValue66;
static uint intermediateValue67;
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferNormal : register(t15, space0);
Texture2D<float4> inputBufferColourAndMetallic : register(t16, space0);
Texture2D<float4> inputBufferSurfaceOpacityAndObjectCategory : register(t17, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T19_WORDS)
struct RdNativeElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdNativeElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define rdAccess_inputIncidentLight(index) inputIncidentLight[(index) / RD_NATIVE_T19_WORDS].words[(index) % RD_NATIVE_T19_WORDS]
uint4 rdLoad_inputIncidentLight(uint wordIndex) { return uint4(rdAccess_inputIncidentLight(wordIndex), rdAccess_inputIncidentLight(wordIndex + 1u), rdAccess_inputIncidentLight(wordIndex + 2u), rdAccess_inputIncidentLight(wordIndex + 3u)); }
#else
Buffer<uint4> inputIncidentLight : register(t19, space0);
#define rdAccess_inputIncidentLight(index) inputIncidentLight[index]
#define rdLoad_inputIncidentLight(index) inputIncidentLight.Load(index)
#endif
Texture2D<float4> inputBufferMotionVectors : register(t21, space0);
Texture2D<float4> inputEmissiveAndLinearRoughness : register(t44, space0);
Texture2D<float4> inputPrimaryViewDirection : register(t46, space0);
Texture2D<float4> inputPrimaryThroughput : register(t47, space0);
Texture2D<float4> inputPrimaryPosLowPrecision : register(t50, space0);
Texture2DArray<float4> skyTexture : register(t59, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
Texture3D<float4> volumetricResolvedInscatter : register(t11, space0);
Texture3D<float4> volumetricResolvedTransmission : register(t12, space0);
Texture3D<float4> volumetricGIResolvedInscatter : register(t38, space0);
Texture2D<float4> shadowDenoisingInputs[2] : register(t0, space4);
RWTexture2D<float4> outputBufferFinal : register(u12, space0);
RWTexture2D<float> outputBufferDebug : register(u14, space0);
RWTexture2D<float4> outputBufferReflectionMotionVectors : register(u16, space0);
RWTexture2D<float4> outputBufferPreviousLinearRoughness : register(u17, space0);
RWTexture2D<float4> outputBufferPreInterleave : register(u18, space0);
RWTexture2D<float> outputBufferReferencePathTracer : register(u23, space0);
RWTexture2D<float> denoisingOutputs[8] : register(u0, space3);
RWTexture2D<float> denoisingChromaAndVarianceOutputs[4] : register(u8, space3);
SamplerState linearSampler : register(s1, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 26
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
Texture2D<float4> inputGeometryNormal : register(t43, space0);
Texture2D<int4> inputTileClassification : register(t57, space0);
RWTexture2D<float> shadowDenoisingOutputs[2] : register(u0, space4);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 27
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
RWTexture2D<float> outputBufferHistoryLength : register(u2, space0);
RWTexture2D<float> denoisingOutputs[8] : register(u0, space3);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 28
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> previousPrimaryPathLengthBuffer : register(t4, space0);
Texture2D<float4> previousDiffuseBuffer : register(t7, space0);
Texture2D<float4> previousSunLightShadowBuffer : register(t30, space0);
Texture2D<float4> previousDiffuseChromaBuffer : register(t48, space0);
Texture2D<float4> inputPreviousGeometryNormal : register(t49, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U0_SPACE14_WORDS)
struct RdNativeElement_bufferIncidentLight { uint words[RD_NATIVE_U0_SPACE14_WORDS]; };
RWStructuredBuffer<RdNativeElement_bufferIncidentLight> bufferIncidentLight : register(u0, space14);
#define rdAccess_bufferIncidentLight(index) bufferIncidentLight[(index) / RD_NATIVE_U0_SPACE14_WORDS].words[(index) % RD_NATIVE_U0_SPACE14_WORDS]
uint rdLoad_bufferIncidentLight(uint wordIndex) { return rdAccess_bufferIncidentLight(wordIndex); }
#else
RWBuffer<uint> bufferIncidentLight : register(u0, space14);
#define rdAccess_bufferIncidentLight(index) bufferIncidentLight[index]
#define rdLoad_bufferIncidentLight(index) bufferIncidentLight.Load(index)
#endif
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 29
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
RWTexture2D<float> outputBufferHistoryLength : register(u2, space0);
RWTexture2D<float> denoisingOutputs[8] : register(u0, space3);
RWTexture2D<float> denoisingChromaAndVarianceOutputs[4] : register(u8, space3);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 30
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE13_WORDS)
struct RdByteElement_inputLightsBuffer { uint words[RD_NATIVE_T0_SPACE13_WORDS]; };
StructuredBuffer<RdByteElement_inputLightsBuffer> inputLightsBuffer : register(t0, space13);
#define RD_BYTE_STRUCT_inputLightsBuffer 1
#define rdByteWord_inputLightsBuffer(resourceIndex, wordIndex) inputLightsBuffer[(wordIndex) / RD_NATIVE_T0_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE13_WORDS]
#elif defined(RD_NATIVE_U0_SPACE13_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE13)
struct RdByteElement_inputLightsBuffer { uint words[RD_NATIVE_U0_SPACE13_WORDS]; };
RWStructuredBuffer<RdByteElement_inputLightsBuffer> inputLightsBuffer : register(u0, space13);
#define RD_BYTE_STRUCT_inputLightsBuffer 1
#define rdByteWord_inputLightsBuffer(resourceIndex, wordIndex) inputLightsBuffer[(wordIndex) / RD_NATIVE_U0_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE13_WORDS]
#define RD_BYTE_WRITABLE_inputLightsBuffer 1
#else
ByteAddressBuffer inputLightsBuffer : register(t0, space13);
#endif
uint rdByteLoad_inputLightsBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputLightsBuffer)
    return rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u);
#else
    return inputLightsBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputLightsBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputLightsBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputLightsBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputLightsBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputLightsBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputLightsBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputLightsBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputLightsBuffer)
void rdByteStore_inputLightsBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputLightsBuffer)
    rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    inputLightsBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputLightsBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputLightsBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputLightsBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputLightsBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputLightsBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputLightsBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputLightsBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputLightsBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputLightsBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
RWTexture2D<float4> outputBufferFinal : register(u12, space0);
static uint3 workgroupId;
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 31
static float intermediateValue13;
static bool intermediateValue352;
static float intermediateValue353;
static uint intermediateValue354;
static uint intermediateValue355;
static uint intermediateValue356;
static half intermediateValue357;
static half intermediateValue358;
static half intermediateValue359;
static half intermediateValue360;
static half intermediateValue361;
static half intermediateValue362;
static float intermediateValue363;
static uint intermediateValue364;
static float intermediateValue365;
static float intermediateValue366;
static float intermediateValue367;
static float intermediateValue368;
static float intermediateValue369;
static float intermediateValue370;
static float intermediateValue371;
static float intermediateValue372;
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T19_WORDS)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_T19_WORDS].words[(wordIndex) % RD_NATIVE_T19_WORDS]
#elif defined(RD_NATIVE_U19_WORDS) && !defined(RD_NATIVE_RAW_T19)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_U19_WORDS]; };
RWStructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(u19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_U19_WORDS].words[(wordIndex) % RD_NATIVE_U19_WORDS]
#define RD_BYTE_WRITABLE_inputIncidentLight 1
#else
ByteAddressBuffer inputIncidentLight : register(t19, space0);
#endif
uint rdByteLoad_inputIncidentLight_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    return rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
#else
    return inputIncidentLight.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputIncidentLight)
void rdByteStore_inputIncidentLight_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u) = value;
#else
    inputIncidentLight.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputIncidentLight.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T35_WORDS)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_T35_WORDS]; };
StructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(t35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_T35_WORDS].words[(wordIndex) % RD_NATIVE_T35_WORDS]
#elif defined(RD_NATIVE_U35_WORDS) && !defined(RD_NATIVE_RAW_T35)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_U35_WORDS]; };
RWStructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(u35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_U35_WORDS].words[(wordIndex) % RD_NATIVE_U35_WORDS]
#define RD_BYTE_WRITABLE_pbrTextureDataBuffer 1
#else
ByteAddressBuffer pbrTextureDataBuffer : register(t35, space0);
#endif
uint rdByteLoad_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    return rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
#else
    return pbrTextureDataBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_pbrTextureDataBuffer)
void rdByteStore_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    pbrTextureDataBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    pbrTextureDataBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T55_WORDS)
struct RdByteElement_checkerboardActionsBuffer { uint words[RD_NATIVE_T55_WORDS]; };
StructuredBuffer<RdByteElement_checkerboardActionsBuffer> checkerboardActionsBuffer : register(t55, space0);
#define RD_BYTE_STRUCT_checkerboardActionsBuffer 1
#define rdByteWord_checkerboardActionsBuffer(resourceIndex, wordIndex) checkerboardActionsBuffer[(wordIndex) / RD_NATIVE_T55_WORDS].words[(wordIndex) % RD_NATIVE_T55_WORDS]
#elif defined(RD_NATIVE_U55_WORDS) && !defined(RD_NATIVE_RAW_T55)
struct RdByteElement_checkerboardActionsBuffer { uint words[RD_NATIVE_U55_WORDS]; };
RWStructuredBuffer<RdByteElement_checkerboardActionsBuffer> checkerboardActionsBuffer : register(u55, space0);
#define RD_BYTE_STRUCT_checkerboardActionsBuffer 1
#define rdByteWord_checkerboardActionsBuffer(resourceIndex, wordIndex) checkerboardActionsBuffer[(wordIndex) / RD_NATIVE_U55_WORDS].words[(wordIndex) % RD_NATIVE_U55_WORDS]
#define RD_BYTE_WRITABLE_checkerboardActionsBuffer 1
#else
ByteAddressBuffer checkerboardActionsBuffer : register(t55, space0);
#endif
uint rdByteLoad_checkerboardActionsBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_checkerboardActionsBuffer)
    return rdByteWord_checkerboardActionsBuffer(resourceIndex, byteOffset >> 2u);
#else
    return checkerboardActionsBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_checkerboardActionsBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_checkerboardActionsBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_checkerboardActionsBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_checkerboardActionsBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_checkerboardActionsBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_checkerboardActionsBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_checkerboardActionsBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_checkerboardActionsBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_checkerboardActionsBuffer)
void rdByteStore_checkerboardActionsBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_checkerboardActionsBuffer)
    rdByteWord_checkerboardActionsBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    checkerboardActionsBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_checkerboardActionsBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_checkerboardActionsBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_checkerboardActionsBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_checkerboardActionsBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    checkerboardActionsBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_checkerboardActionsBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_checkerboardActionsBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_checkerboardActionsBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_checkerboardActionsBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_checkerboardActionsBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_checkerboardActionsBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_checkerboardActionsBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_checkerboardActionsBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T56_WORDS)
struct RdByteElement_refractionIndicesBuffer { uint words[RD_NATIVE_T56_WORDS]; };
StructuredBuffer<RdByteElement_refractionIndicesBuffer> refractionIndicesBuffer : register(t56, space0);
#define RD_BYTE_STRUCT_refractionIndicesBuffer 1
#define rdByteWord_refractionIndicesBuffer(resourceIndex, wordIndex) refractionIndicesBuffer[(wordIndex) / RD_NATIVE_T56_WORDS].words[(wordIndex) % RD_NATIVE_T56_WORDS]
#elif defined(RD_NATIVE_U56_WORDS) && !defined(RD_NATIVE_RAW_T56)
struct RdByteElement_refractionIndicesBuffer { uint words[RD_NATIVE_U56_WORDS]; };
RWStructuredBuffer<RdByteElement_refractionIndicesBuffer> refractionIndicesBuffer : register(u56, space0);
#define RD_BYTE_STRUCT_refractionIndicesBuffer 1
#define rdByteWord_refractionIndicesBuffer(resourceIndex, wordIndex) refractionIndicesBuffer[(wordIndex) / RD_NATIVE_U56_WORDS].words[(wordIndex) % RD_NATIVE_U56_WORDS]
#define RD_BYTE_WRITABLE_refractionIndicesBuffer 1
#else
ByteAddressBuffer refractionIndicesBuffer : register(t56, space0);
#endif
uint rdByteLoad_refractionIndicesBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_refractionIndicesBuffer)
    return rdByteWord_refractionIndicesBuffer(resourceIndex, byteOffset >> 2u);
#else
    return refractionIndicesBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_refractionIndicesBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_refractionIndicesBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_refractionIndicesBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_refractionIndicesBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_refractionIndicesBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_refractionIndicesBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_refractionIndicesBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_refractionIndicesBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_refractionIndicesBuffer)
void rdByteStore_refractionIndicesBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_refractionIndicesBuffer)
    rdByteWord_refractionIndicesBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    refractionIndicesBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_refractionIndicesBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_refractionIndicesBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_refractionIndicesBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_refractionIndicesBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    refractionIndicesBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_refractionIndicesBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_refractionIndicesBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_refractionIndicesBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_refractionIndicesBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_refractionIndicesBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_refractionIndicesBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_refractionIndicesBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_refractionIndicesBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE2_WORDS)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#elif defined(RD_NATIVE_U0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE2)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_vertexBuffers 1
#else
ByteAddressBuffer vertexBuffers[4096] : register(t0, space2);
#endif
uint rdByteLoad_vertexBuffers_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    return rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
#else
    return vertexBuffers[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexBuffers_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexBuffers_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexBuffers_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexBuffers)
void rdByteStore_vertexBuffers_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexBuffers[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexBuffers[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexBuffers_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexBuffers_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_U32_WORDS)
struct RdByteElement_outputVisibleBLASs { uint words[RD_NATIVE_U32_WORDS]; };
RWStructuredBuffer<RdByteElement_outputVisibleBLASs> outputVisibleBLASs : register(u32, space0);
#define RD_BYTE_STRUCT_outputVisibleBLASs 1
#define rdByteWord_outputVisibleBLASs(resourceIndex, wordIndex) outputVisibleBLASs[(wordIndex) / RD_NATIVE_U32_WORDS].words[(wordIndex) % RD_NATIVE_U32_WORDS]
#define RD_BYTE_WRITABLE_outputVisibleBLASs 1
#elif defined(RD_NATIVE_T32_WORDS) && !defined(RD_NATIVE_RAW_U32)
struct RdByteElement_outputVisibleBLASs { uint words[RD_NATIVE_T32_WORDS]; };
StructuredBuffer<RdByteElement_outputVisibleBLASs> outputVisibleBLASs : register(t32, space0);
#define RD_BYTE_STRUCT_outputVisibleBLASs 1
#define rdByteWord_outputVisibleBLASs(resourceIndex, wordIndex) outputVisibleBLASs[(wordIndex) / RD_NATIVE_T32_WORDS].words[(wordIndex) % RD_NATIVE_T32_WORDS]
#else
RWByteAddressBuffer outputVisibleBLASs : register(u32, space0);
#endif
uint rdByteLoad_outputVisibleBLASs_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_outputVisibleBLASs)
    return rdByteWord_outputVisibleBLASs(resourceIndex, byteOffset >> 2u);
#else
    return outputVisibleBLASs.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_outputVisibleBLASs_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_outputVisibleBLASs_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_outputVisibleBLASs_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_outputVisibleBLASs_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 8u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_outputVisibleBLASs_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_outputVisibleBLASs_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_outputVisibleBLASs_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 6u)); }
#if !defined(RD_BYTE_STRUCT_outputVisibleBLASs) || defined(RD_BYTE_WRITABLE_outputVisibleBLASs)
void rdByteStore_outputVisibleBLASs_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_outputVisibleBLASs)
    rdByteWord_outputVisibleBLASs(resourceIndex, byteOffset >> 2u) = value;
#else
    outputVisibleBLASs.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_outputVisibleBLASs_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_outputVisibleBLASs)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_outputVisibleBLASs(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_outputVisibleBLASs(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    outputVisibleBLASs.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_outputVisibleBLASs_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_outputVisibleBLASs_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_outputVisibleBLASs_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_outputVisibleBLASs_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_outputVisibleBLASs_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_outputVisibleBLASs_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE1_WORDS)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_T0_SPACE1_WORDS]; };
StructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(t0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE1_WORDS]
#elif defined(RD_NATIVE_U0_SPACE1_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE1)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_U0_SPACE1_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(u0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE1_WORDS]
#define RD_BYTE_WRITABLE_vertexIrradianceCache 1
#else
ByteAddressBuffer vertexIrradianceCache[4096] : register(t0, space1);
#endif
uint rdByteLoad_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    return rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
#else
    return vertexIrradianceCache[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexIrradianceCache)
void rdByteStore_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexIrradianceCache[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexIrradianceCache[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE10_WORDS)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_T0_SPACE10_WORDS]; };
StructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(t0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE10_WORDS]
#elif defined(RD_NATIVE_U0_SPACE10_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE10)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_U0_SPACE10_WORDS]; };
RWStructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(u0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE10_WORDS]
#define RD_BYTE_WRITABLE_faceDataBuffersRW 1
#else
ByteAddressBuffer faceDataBuffersRW[4096] : register(t0, space10);
#endif
uint rdByteLoad_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    return rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceDataBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceDataBuffersRW)
void rdByteStore_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceDataBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceDataBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2D<float4> waterNormalsTexture : register(t62, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
RWTexture2D<float4> outputBufferPrimaryPathLength : register(u0, space0);
RWTexture2D<float4> outputBufferNormal : register(u1, space0);
RWTexture2D<float4> outputBufferColourAndMetallic : register(u3, space0);
RWTexture2D<float4> outputBufferEmissiveAndLinearRoughness : register(u4, space0);
RWTexture2D<float4> outputBufferSurfaceOpacityAndObjectCategory : register(u7, space0);
RWTexture2D<float4> outputBufferMotionVectors : register(u10, space0);
RWTexture2D<float4> outputBufferIncomingIrradianceCache : register(u11, space0);
RWTexture2D<float> outputBufferDebug : register(u14, space0);
RWTexture2D<int4> outputPlaneIdentifier : register(u19, space0);
RWTexture2D<float4> outputBufferReprojectedPathLength : register(u20, space0);
RWTexture2D<float4> outputBufferPrimaryPosLowPrecision : register(u29, space0);
RWTexture2D<float4> outputGeometryNormal : register(u31, space0);
RWTexture2D<float4> outputPrimaryWorldPosition : register(u33, space0);
RWTexture2D<float4> outputPrimaryViewDirection : register(u34, space0);
RWTexture2D<float4> outputPrimaryThroughput : register(u35, space0);
RWTexture2D<int4> outputBufferPreviousMedium : register(u45, space0);
SamplerState defaultSampler : register(s0, space0);
SamplerState linearWrapSampler : register(s2, space0);
static uint3 workgroupId;
static uint3 localThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue74;
static RayQuery<RAY_FLAG_NONE> intermediateValue95;
#elif RD_BINDING_LAYOUT == 32
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
RWTexture2D<float4> outputBufferPreviousSunLightShadow : register(u22, space0);
RWTexture2D<float> shadowDenoisingOutputs[2] : register(u0, space4);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 33
static float intermediateValue79;
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T19_WORDS)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_T19_WORDS].words[(wordIndex) % RD_NATIVE_T19_WORDS]
#elif defined(RD_NATIVE_U19_WORDS) && !defined(RD_NATIVE_RAW_T19)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_U19_WORDS]; };
RWStructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(u19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_U19_WORDS].words[(wordIndex) % RD_NATIVE_U19_WORDS]
#define RD_BYTE_WRITABLE_inputIncidentLight 1
#else
ByteAddressBuffer inputIncidentLight : register(t19, space0);
#endif
uint rdByteLoad_inputIncidentLight_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    return rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
#else
    return inputIncidentLight.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputIncidentLight)
void rdByteStore_inputIncidentLight_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u) = value;
#else
    inputIncidentLight.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputIncidentLight.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_SPACE13_WORDS)
struct RdByteElement_inputReducedLightsBuffer { uint words[RD_NATIVE_T1_SPACE13_WORDS]; };
StructuredBuffer<RdByteElement_inputReducedLightsBuffer> inputReducedLightsBuffer : register(t1, space13);
#define RD_BYTE_STRUCT_inputReducedLightsBuffer 1
#define rdByteWord_inputReducedLightsBuffer(resourceIndex, wordIndex) inputReducedLightsBuffer[(wordIndex) / RD_NATIVE_T1_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_T1_SPACE13_WORDS]
#elif defined(RD_NATIVE_U1_SPACE13_WORDS) && !defined(RD_NATIVE_RAW_T1_SPACE13)
struct RdByteElement_inputReducedLightsBuffer { uint words[RD_NATIVE_U1_SPACE13_WORDS]; };
RWStructuredBuffer<RdByteElement_inputReducedLightsBuffer> inputReducedLightsBuffer : register(u1, space13);
#define RD_BYTE_STRUCT_inputReducedLightsBuffer 1
#define rdByteWord_inputReducedLightsBuffer(resourceIndex, wordIndex) inputReducedLightsBuffer[(wordIndex) / RD_NATIVE_U1_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_U1_SPACE13_WORDS]
#define RD_BYTE_WRITABLE_inputReducedLightsBuffer 1
#else
ByteAddressBuffer inputReducedLightsBuffer : register(t1, space13);
#endif
uint rdByteLoad_inputReducedLightsBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputReducedLightsBuffer)
    return rdByteWord_inputReducedLightsBuffer(resourceIndex, byteOffset >> 2u);
#else
    return inputReducedLightsBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputReducedLightsBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputReducedLightsBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputReducedLightsBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputReducedLightsBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputReducedLightsBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputReducedLightsBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputReducedLightsBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputReducedLightsBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputReducedLightsBuffer)
void rdByteStore_inputReducedLightsBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputReducedLightsBuffer)
    rdByteWord_inputReducedLightsBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    inputReducedLightsBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputReducedLightsBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputReducedLightsBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputReducedLightsBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputReducedLightsBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputReducedLightsBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputReducedLightsBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputReducedLightsBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputReducedLightsBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputReducedLightsBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputReducedLightsBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputReducedLightsBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputReducedLightsBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputReducedLightsBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferNormal : register(t15, space0);
Texture2D<float4> inputBufferColourAndMetallic : register(t16, space0);
Texture2D<float4> inputGeometryNormal : register(t43, space0);
Texture2D<float4> inputEmissiveAndLinearRoughness : register(t44, space0);
Texture2D<float4> inputPrimaryWorldPosition : register(t45, space0);
Texture2D<float4> inputPrimaryViewDirection : register(t46, space0);
Texture2DArray<float4> blueNoiseTexture : register(t58, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
RWTexture2D<float> outputBufferIndirectDiffuse : register(u5, space0);
RWTexture2D<float4> outputBufferIndirectSpecular : register(u6, space0);
RWTexture2D<float> outputBufferDebug : register(u14, space0);
RWTexture2D<float> outputBufferIndirectDiffuseChroma : register(u28, space0);
SamplerState defaultSampler : register(s0, space0);
static uint3 workgroupId;
static uint3 localThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue89;
#elif RD_BINDING_LAYOUT == 34
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> previousPrimaryPathLengthBuffer : register(t4, space0);
Texture2D<float4> previousPrimaryNormalBuffer : register(t5, space0);
Texture2D<float4> previousHistoryLengthBuffer : register(t6, space0);
Texture2D<float4> previousDiffuseBuffer : register(t7, space0);
Texture2D<float4> previousSpecularBuffer : register(t8, space0);
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferNormal : register(t15, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T19_WORDS)
struct RdNativeElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdNativeElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define rdAccess_inputIncidentLight(index) inputIncidentLight[(index) / RD_NATIVE_T19_WORDS].words[(index) % RD_NATIVE_T19_WORDS]
uint4 rdLoad_inputIncidentLight(uint wordIndex) { return uint4(rdAccess_inputIncidentLight(wordIndex), rdAccess_inputIncidentLight(wordIndex + 1u), rdAccess_inputIncidentLight(wordIndex + 2u), rdAccess_inputIncidentLight(wordIndex + 3u)); }
#else
Buffer<uint4> inputIncidentLight : register(t19, space0);
#define rdAccess_inputIncidentLight(index) inputIncidentLight[index]
#define rdLoad_inputIncidentLight(index) inputIncidentLight.Load(index)
#endif
Texture2D<float4> inputBufferMotionVectors : register(t21, space0);
Texture2D<float4> previousReflectionDistanceBuffer : register(t23, space0);
Texture2D<float4> previousLinearRoughnessBuffer : register(t24, space0);
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
Texture2D<float4> inputBufferReprojectedPathLength : register(t29, space0);
Texture2D<float4> inputGeometryNormal : register(t43, space0);
Texture2D<float4> inputEmissiveAndLinearRoughness : register(t44, space0);
Texture2D<float4> inputPrimaryThroughput : register(t47, space0);
Texture2D<float4> inputAdaptiveDenoiserGradients[2] : register(t51, space0);
Texture2D<int4> inputAdaptiveDenoiserPlaneIdentifier : register(t54, space0);
Texture2D<float4> inputFinalDiffuseMoments : register(t1, space9);
Texture2D<float4> inputFinalSpecularMoments : register(t3, space9);
RWTexture2D<float4> outputBufferHistoryLength : register(u2, space0);
RWTexture2D<float> outputBufferIndirectDiffuse : register(u5, space0);
RWTexture2D<float> outputBufferIndirectSpecular : register(u6, space0);
RWTexture2D<float> outputBufferReflectionDistance : register(u15, space0);
RWTexture2D<float4> outputBufferDiffuseMoments : register(u40, space0);
RWTexture2D<float4> outputBufferSpecularMoments : register(u42, space0);
RWTexture2D<float4> denoisingOutputs[8] : register(u0, space3);
static uint3 workgroupId;
static uint3 localThreadId;
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
groupshared uint intermediateValue[25];
groupshared float intermediateValue1[25];
#elif RD_BINDING_LAYOUT == 35
static float intermediateValue262;
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T19_WORDS)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_T19_WORDS].words[(wordIndex) % RD_NATIVE_T19_WORDS]
#elif defined(RD_NATIVE_U19_WORDS) && !defined(RD_NATIVE_RAW_T19)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_U19_WORDS]; };
RWStructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(u19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_U19_WORDS].words[(wordIndex) % RD_NATIVE_U19_WORDS]
#define RD_BYTE_WRITABLE_inputIncidentLight 1
#else
ByteAddressBuffer inputIncidentLight : register(t19, space0);
#endif
uint rdByteLoad_inputIncidentLight_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    return rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
#else
    return inputIncidentLight.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputIncidentLight)
void rdByteStore_inputIncidentLight_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u) = value;
#else
    inputIncidentLight.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputIncidentLight.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T35_WORDS)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_T35_WORDS]; };
StructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(t35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_T35_WORDS].words[(wordIndex) % RD_NATIVE_T35_WORDS]
#elif defined(RD_NATIVE_U35_WORDS) && !defined(RD_NATIVE_RAW_T35)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_U35_WORDS]; };
RWStructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(u35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_U35_WORDS].words[(wordIndex) % RD_NATIVE_U35_WORDS]
#define RD_BYTE_WRITABLE_pbrTextureDataBuffer 1
#else
ByteAddressBuffer pbrTextureDataBuffer : register(t35, space0);
#endif
uint rdByteLoad_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    return rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
#else
    return pbrTextureDataBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_pbrTextureDataBuffer)
void rdByteStore_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    pbrTextureDataBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    pbrTextureDataBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE2_WORDS)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#elif defined(RD_NATIVE_U0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE2)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_vertexBuffers 1
#else
ByteAddressBuffer vertexBuffers[4096] : register(t0, space2);
#endif
uint rdByteLoad_vertexBuffers_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    return rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
#else
    return vertexBuffers[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexBuffers_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexBuffers_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexBuffers_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexBuffers)
void rdByteStore_vertexBuffers_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexBuffers[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexBuffers[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexBuffers_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexBuffers_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE1_WORDS)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_T0_SPACE1_WORDS]; };
StructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(t0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE1_WORDS]
#elif defined(RD_NATIVE_U0_SPACE1_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE1)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_U0_SPACE1_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(u0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE1_WORDS]
#define RD_BYTE_WRITABLE_vertexIrradianceCache 1
#else
ByteAddressBuffer vertexIrradianceCache[4096] : register(t0, space1);
#endif
uint rdByteLoad_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    return rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
#else
    return vertexIrradianceCache[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexIrradianceCache)
void rdByteStore_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexIrradianceCache[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexIrradianceCache[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE10_WORDS)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_T0_SPACE10_WORDS]; };
StructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(t0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE10_WORDS]
#elif defined(RD_NATIVE_U0_SPACE10_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE10)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_U0_SPACE10_WORDS]; };
RWStructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(u0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE10_WORDS]
#define RD_BYTE_WRITABLE_faceDataBuffersRW 1
#else
ByteAddressBuffer faceDataBuffersRW[4096] : register(t0, space10);
#endif
uint rdByteLoad_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    return rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceDataBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceDataBuffersRW)
void rdByteStore_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceDataBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceDataBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferNormal : register(t15, space0);
Texture2D<float4> inputGeometryNormal : register(t43, space0);
Texture2D<float4> inputPrimaryWorldPosition : register(t45, space0);
Texture2DArray<float4> blueNoiseTexture : register(t58, space0);
Texture2DArray<float4> skyTexture : register(t59, space0);
Texture2DArray<float4> causticsTexture : register(t60, space0);
Texture2D<float4> wibblyTexture : register(t61, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
RWTexture2D<float> outputBufferEmissiveAndLinearRoughness : register(u4, space0);
RWTexture2D<float4> outputBufferIndirectDiffuse : register(u5, space0);
RWTexture2D<float> outputBufferDebug : register(u14, space0);
RWTexture2D<float4> outputBufferIndirectDiffuseChroma : register(u28, space0);
SamplerState defaultSampler : register(s0, space0);
SamplerState linearSampler : register(s1, space0);
SamplerState linearWrapSampler : register(s2, space0);
static uint3 workgroupId;
static uint3 localThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue28;
static RayQuery<RAY_FLAG_NONE> intermediateValue30;
static RayQuery<RAY_FLAG_NONE> intermediateValue44;
static RayQuery<RAY_FLAG_NONE> intermediateValue55;
static RayQuery<RAY_FLAG_NONE> intermediateValue286;
static RayQuery<RAY_FLAG_NONE> intermediateValue294;
static RayQuery<RAY_FLAG_NONE> intermediateValue317;
static RayQuery<RAY_FLAG_NONE> intermediateValue319;
static RayQuery<RAY_FLAG_NONE> intermediateValue330;
static RayQuery<RAY_FLAG_NONE> intermediateValue332;
static RayQuery<RAY_FLAG_NONE> intermediateValue368;
static RayQuery<RAY_FLAG_NONE> intermediateValue380;
#elif RD_BINDING_LAYOUT == 36
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> previousPrimaryPathLengthBuffer : register(t4, space0);
Texture2D<float4> previousPrimaryNormalBuffer : register(t5, space0);
Texture2D<float4> previousHistoryLengthBuffer : register(t6, space0);
Texture2D<float4> previousDiffuseBuffer : register(t7, space0);
Texture2D<float4> previousSpecularBuffer : register(t8, space0);
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferNormal : register(t15, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T19_WORDS)
struct RdNativeElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdNativeElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define rdAccess_inputIncidentLight(index) inputIncidentLight[(index) / RD_NATIVE_T19_WORDS].words[(index) % RD_NATIVE_T19_WORDS]
uint4 rdLoad_inputIncidentLight(uint wordIndex) { return uint4(rdAccess_inputIncidentLight(wordIndex), rdAccess_inputIncidentLight(wordIndex + 1u), rdAccess_inputIncidentLight(wordIndex + 2u), rdAccess_inputIncidentLight(wordIndex + 3u)); }
#else
Buffer<uint4> inputIncidentLight : register(t19, space0);
#define rdAccess_inputIncidentLight(index) inputIncidentLight[index]
#define rdLoad_inputIncidentLight(index) inputIncidentLight.Load(index)
#endif
Texture2D<float4> inputBufferMotionVectors : register(t21, space0);
Texture2D<float4> previousReflectionDistanceBuffer : register(t23, space0);
Texture2D<float4> previousLinearRoughnessBuffer : register(t24, space0);
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
Texture2D<float4> inputBufferReprojectedPathLength : register(t29, space0);
Texture2D<float4> inputGeometryNormal : register(t43, space0);
Texture2D<float4> inputEmissiveAndLinearRoughness : register(t44, space0);
Texture2D<float4> inputPrimaryThroughput : register(t47, space0);
Texture2D<float4> previousDiffuseChromaBuffer : register(t48, space0);
Texture2D<float4> inputPreviousGeometryNormal : register(t49, space0);
Texture2D<float4> inputAdaptiveDenoiserGradients[2] : register(t51, space0);
Texture2D<int4> inputAdaptiveDenoiserPlaneIdentifier : register(t54, space0);
Texture2D<float4> inputFinalDiffuseMoments : register(t1, space9);
Texture2D<float4> inputFinalSpecularMoments : register(t3, space9);
RWTexture2D<float4> outputBufferHistoryLength : register(u2, space0);
RWTexture2D<float> outputBufferIndirectDiffuse : register(u5, space0);
RWTexture2D<float> outputBufferIndirectSpecular : register(u6, space0);
RWTexture2D<float> outputBufferReflectionDistance : register(u15, space0);
RWTexture2D<float> outputBufferIndirectDiffuseChroma : register(u28, space0);
RWTexture2D<float4> outputBufferDiffuseMoments : register(u40, space0);
RWTexture2D<float4> outputBufferSpecularMoments : register(u42, space0);
RWTexture2D<float4> denoisingOutputs[8] : register(u0, space3);
RWTexture2D<float4> denoisingChromaAndVarianceOutputs[4] : register(u8, space3);
static uint3 workgroupId;
static uint3 localThreadId;
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
groupshared uint intermediateValue[25];
groupshared float intermediateValue1[25];
#elif RD_BINDING_LAYOUT == 37
static float intermediateValue54;
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T19_WORDS)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_T19_WORDS].words[(wordIndex) % RD_NATIVE_T19_WORDS]
#elif defined(RD_NATIVE_U19_WORDS) && !defined(RD_NATIVE_RAW_T19)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_U19_WORDS]; };
RWStructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(u19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_U19_WORDS].words[(wordIndex) % RD_NATIVE_U19_WORDS]
#define RD_BYTE_WRITABLE_inputIncidentLight 1
#else
ByteAddressBuffer inputIncidentLight : register(t19, space0);
#endif
uint rdByteLoad_inputIncidentLight_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    return rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
#else
    return inputIncidentLight.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputIncidentLight)
void rdByteStore_inputIncidentLight_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u) = value;
#else
    inputIncidentLight.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputIncidentLight.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T35_WORDS)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_T35_WORDS]; };
StructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(t35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_T35_WORDS].words[(wordIndex) % RD_NATIVE_T35_WORDS]
#elif defined(RD_NATIVE_U35_WORDS) && !defined(RD_NATIVE_RAW_T35)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_U35_WORDS]; };
RWStructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(u35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_U35_WORDS].words[(wordIndex) % RD_NATIVE_U35_WORDS]
#define RD_BYTE_WRITABLE_pbrTextureDataBuffer 1
#else
ByteAddressBuffer pbrTextureDataBuffer : register(t35, space0);
#endif
uint rdByteLoad_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    return rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
#else
    return pbrTextureDataBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_pbrTextureDataBuffer)
void rdByteStore_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    pbrTextureDataBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    pbrTextureDataBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE2_WORDS)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#elif defined(RD_NATIVE_U0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE2)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_vertexBuffers 1
#else
ByteAddressBuffer vertexBuffers[4096] : register(t0, space2);
#endif
uint rdByteLoad_vertexBuffers_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    return rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
#else
    return vertexBuffers[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexBuffers_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexBuffers_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexBuffers_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexBuffers)
void rdByteStore_vertexBuffers_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexBuffers[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexBuffers[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexBuffers_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexBuffers_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_U32_WORDS)
struct RdByteElement_outputVisibleBLASs { uint words[RD_NATIVE_U32_WORDS]; };
RWStructuredBuffer<RdByteElement_outputVisibleBLASs> outputVisibleBLASs : register(u32, space0);
#define RD_BYTE_STRUCT_outputVisibleBLASs 1
#define rdByteWord_outputVisibleBLASs(resourceIndex, wordIndex) outputVisibleBLASs[(wordIndex) / RD_NATIVE_U32_WORDS].words[(wordIndex) % RD_NATIVE_U32_WORDS]
#define RD_BYTE_WRITABLE_outputVisibleBLASs 1
#elif defined(RD_NATIVE_T32_WORDS) && !defined(RD_NATIVE_RAW_U32)
struct RdByteElement_outputVisibleBLASs { uint words[RD_NATIVE_T32_WORDS]; };
StructuredBuffer<RdByteElement_outputVisibleBLASs> outputVisibleBLASs : register(t32, space0);
#define RD_BYTE_STRUCT_outputVisibleBLASs 1
#define rdByteWord_outputVisibleBLASs(resourceIndex, wordIndex) outputVisibleBLASs[(wordIndex) / RD_NATIVE_T32_WORDS].words[(wordIndex) % RD_NATIVE_T32_WORDS]
#else
RWByteAddressBuffer outputVisibleBLASs : register(u32, space0);
#endif
uint rdByteLoad_outputVisibleBLASs_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_outputVisibleBLASs)
    return rdByteWord_outputVisibleBLASs(resourceIndex, byteOffset >> 2u);
#else
    return outputVisibleBLASs.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_outputVisibleBLASs_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_outputVisibleBLASs_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_outputVisibleBLASs_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_outputVisibleBLASs_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 8u), rdByteLoad_outputVisibleBLASs_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_outputVisibleBLASs_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_outputVisibleBLASs_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_outputVisibleBLASs_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 6u)); }
#if !defined(RD_BYTE_STRUCT_outputVisibleBLASs) || defined(RD_BYTE_WRITABLE_outputVisibleBLASs)
void rdByteStore_outputVisibleBLASs_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_outputVisibleBLASs)
    rdByteWord_outputVisibleBLASs(resourceIndex, byteOffset >> 2u) = value;
#else
    outputVisibleBLASs.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_outputVisibleBLASs_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_outputVisibleBLASs)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_outputVisibleBLASs(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_outputVisibleBLASs(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    outputVisibleBLASs.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_outputVisibleBLASs_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_outputVisibleBLASs_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_outputVisibleBLASs_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_outputVisibleBLASs_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_outputVisibleBLASs_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_outputVisibleBLASs_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_outputVisibleBLASs_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_outputVisibleBLASs_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE1_WORDS)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_T0_SPACE1_WORDS]; };
StructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(t0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE1_WORDS]
#elif defined(RD_NATIVE_U0_SPACE1_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE1)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_U0_SPACE1_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(u0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE1_WORDS]
#define RD_BYTE_WRITABLE_vertexIrradianceCache 1
#else
ByteAddressBuffer vertexIrradianceCache[4096] : register(t0, space1);
#endif
uint rdByteLoad_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    return rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
#else
    return vertexIrradianceCache[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexIrradianceCache)
void rdByteStore_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexIrradianceCache[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexIrradianceCache[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE10_WORDS)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_T0_SPACE10_WORDS]; };
StructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(t0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE10_WORDS]
#elif defined(RD_NATIVE_U0_SPACE10_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE10)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_U0_SPACE10_WORDS]; };
RWStructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(u0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE10_WORDS]
#define RD_BYTE_WRITABLE_faceDataBuffersRW 1
#else
ByteAddressBuffer faceDataBuffersRW[4096] : register(t0, space10);
#endif
uint rdByteLoad_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    return rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceDataBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceDataBuffersRW)
void rdByteStore_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceDataBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceDataBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferColourAndMetallic : register(t16, space0);
Texture2D<float4> inputBufferSurfaceOpacityAndObjectCategory : register(t17, space0);
Texture2D<float4> inputGeometryNormal : register(t43, space0);
Texture2D<float4> inputPrimaryWorldPosition : register(t45, space0);
Texture2D<float4> inputPrimaryViewDirection : register(t46, space0);
Texture2D<float4> inputPrimaryThroughput : register(t47, space0);
Texture2DArray<float4> skyTexture : register(t59, space0);
Texture2DArray<float4> causticsTexture : register(t60, space0);
Texture2D<float4> wibblyTexture : register(t61, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
RWTexture2D<float> outputBufferEmissiveAndLinearRoughness : register(u4, space0);
SamplerState defaultSampler : register(s0, space0);
SamplerState linearSampler : register(s1, space0);
SamplerState linearWrapSampler : register(s2, space0);
static uint3 workgroupId;
static uint3 localThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue87;
static RayQuery<RAY_FLAG_NONE> intermediateValue96;
static RayQuery<RAY_FLAG_NONE> intermediateValue130;
static RayQuery<RAY_FLAG_NONE> intermediateValue260;
static RayQuery<RAY_FLAG_NONE> intermediateValue285;
static RayQuery<RAY_FLAG_NONE> intermediateValue287;
static RayQuery<RAY_FLAG_NONE> intermediateValue316;
#elif RD_BINDING_LAYOUT == 38
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> previousPrimaryPathLengthBuffer : register(t4, space0);
Texture2D<float4> previousPrimaryNormalBuffer : register(t5, space0);
Texture2D<float4> previousHistoryLengthBuffer : register(t6, space0);
Texture2D<float4> previousSpecularBuffer : register(t8, space0);
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferNormal : register(t15, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T19_WORDS)
struct RdNativeElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdNativeElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define rdAccess_inputIncidentLight(index) inputIncidentLight[(index) / RD_NATIVE_T19_WORDS].words[(index) % RD_NATIVE_T19_WORDS]
uint4 rdLoad_inputIncidentLight(uint wordIndex) { return uint4(rdAccess_inputIncidentLight(wordIndex), rdAccess_inputIncidentLight(wordIndex + 1u), rdAccess_inputIncidentLight(wordIndex + 2u), rdAccess_inputIncidentLight(wordIndex + 3u)); }
#else
Buffer<uint4> inputIncidentLight : register(t19, space0);
#define rdAccess_inputIncidentLight(index) inputIncidentLight[index]
#define rdLoad_inputIncidentLight(index) inputIncidentLight.Load(index)
#endif
Texture2D<float4> inputBufferMotionVectors : register(t21, space0);
Texture2D<float4> previousReflectionDistanceBuffer : register(t23, space0);
Texture2D<float4> previousLinearRoughnessBuffer : register(t24, space0);
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
Texture2D<float4> inputBufferReprojectedPathLength : register(t29, space0);
Texture2D<float4> inputGeometryNormal : register(t43, space0);
Texture2D<float4> inputEmissiveAndLinearRoughness : register(t44, space0);
Texture2D<float4> inputPrimaryThroughput : register(t47, space0);
Texture2D<float4> inputAdaptiveDenoiserGradients[2] : register(t51, space0);
Texture2D<int4> inputAdaptiveDenoiserPlaneIdentifier : register(t54, space0);
Texture2D<float4> inputFinalSpecularMoments : register(t3, space9);
RWTexture2D<float4> outputBufferHistoryLength : register(u2, space0);
RWTexture2D<float> outputBufferIndirectSpecular : register(u6, space0);
RWTexture2D<float> outputBufferReflectionDistance : register(u15, space0);
RWTexture2D<float4> outputBufferSpecularMoments : register(u42, space0);
RWTexture2D<float4> denoisingOutputs[8] : register(u0, space3);
static uint3 workgroupId;
static uint3 localThreadId;
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
groupshared uint intermediateValue[25];
groupshared float intermediateValue1[25];
#elif RD_BINDING_LAYOUT == 39
cbuffer LightMeterDataCBUBO : register(b3, space0)
{
    float4 lightMeterDataCbConstants[2] : packoffset(c0);
};
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U0_SPACE14_WORDS)
struct RdNativeElement_bufferIncidentLight { uint words[RD_NATIVE_U0_SPACE14_WORDS]; };
RWStructuredBuffer<RdNativeElement_bufferIncidentLight> bufferIncidentLight : register(u0, space14);
#define rdAccess_bufferIncidentLight(index) bufferIncidentLight[(index) / RD_NATIVE_U0_SPACE14_WORDS].words[(index) % RD_NATIVE_U0_SPACE14_WORDS]
uint rdLoad_bufferIncidentLight(uint wordIndex) { return rdAccess_bufferIncidentLight(wordIndex); }
#else
RWBuffer<uint> bufferIncidentLight : register(u0, space14);
#define rdAccess_bufferIncidentLight(index) bufferIncidentLight[index]
#define rdLoad_bufferIncidentLight(index) bufferIncidentLight.Load(index)
#endif
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 40
static float intermediateValue46;
static float intermediateValue667;
static float intermediateValue668;
static float intermediateValue669;
static float intermediateValue670;
static float intermediateValue671;
static float intermediateValue672;
static float intermediateValue673;
static float intermediateValue674;
static float intermediateValue675;
static float intermediateValue676;
static float intermediateValue677;
static float intermediateValue678;
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T19_WORDS)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_T19_WORDS].words[(wordIndex) % RD_NATIVE_T19_WORDS]
#elif defined(RD_NATIVE_U19_WORDS) && !defined(RD_NATIVE_RAW_T19)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_U19_WORDS]; };
RWStructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(u19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_U19_WORDS].words[(wordIndex) % RD_NATIVE_U19_WORDS]
#define RD_BYTE_WRITABLE_inputIncidentLight 1
#else
ByteAddressBuffer inputIncidentLight : register(t19, space0);
#endif
uint rdByteLoad_inputIncidentLight_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    return rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
#else
    return inputIncidentLight.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputIncidentLight)
void rdByteStore_inputIncidentLight_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u) = value;
#else
    inputIncidentLight.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputIncidentLight.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T35_WORDS)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_T35_WORDS]; };
StructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(t35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_T35_WORDS].words[(wordIndex) % RD_NATIVE_T35_WORDS]
#elif defined(RD_NATIVE_U35_WORDS) && !defined(RD_NATIVE_RAW_T35)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_U35_WORDS]; };
RWStructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(u35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_U35_WORDS].words[(wordIndex) % RD_NATIVE_U35_WORDS]
#define RD_BYTE_WRITABLE_pbrTextureDataBuffer 1
#else
ByteAddressBuffer pbrTextureDataBuffer : register(t35, space0);
#endif
uint rdByteLoad_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    return rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
#else
    return pbrTextureDataBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_pbrTextureDataBuffer)
void rdByteStore_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    pbrTextureDataBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    pbrTextureDataBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE2_WORDS)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#elif defined(RD_NATIVE_U0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE2)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_vertexBuffers 1
#else
ByteAddressBuffer vertexBuffers[4096] : register(t0, space2);
#endif
uint rdByteLoad_vertexBuffers_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    return rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
#else
    return vertexBuffers[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexBuffers_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexBuffers_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexBuffers_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexBuffers)
void rdByteStore_vertexBuffers_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexBuffers[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexBuffers[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexBuffers_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexBuffers_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE13_WORDS)
struct RdByteElement_inputLightsBuffer { uint words[RD_NATIVE_T0_SPACE13_WORDS]; };
StructuredBuffer<RdByteElement_inputLightsBuffer> inputLightsBuffer : register(t0, space13);
#define RD_BYTE_STRUCT_inputLightsBuffer 1
#define rdByteWord_inputLightsBuffer(resourceIndex, wordIndex) inputLightsBuffer[(wordIndex) / RD_NATIVE_T0_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE13_WORDS]
#elif defined(RD_NATIVE_U0_SPACE13_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE13)
struct RdByteElement_inputLightsBuffer { uint words[RD_NATIVE_U0_SPACE13_WORDS]; };
RWStructuredBuffer<RdByteElement_inputLightsBuffer> inputLightsBuffer : register(u0, space13);
#define RD_BYTE_STRUCT_inputLightsBuffer 1
#define rdByteWord_inputLightsBuffer(resourceIndex, wordIndex) inputLightsBuffer[(wordIndex) / RD_NATIVE_U0_SPACE13_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE13_WORDS]
#define RD_BYTE_WRITABLE_inputLightsBuffer 1
#else
ByteAddressBuffer inputLightsBuffer : register(t0, space13);
#endif
uint rdByteLoad_inputLightsBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputLightsBuffer)
    return rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u);
#else
    return inputLightsBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputLightsBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputLightsBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputLightsBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputLightsBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputLightsBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputLightsBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputLightsBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputLightsBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputLightsBuffer)
void rdByteStore_inputLightsBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputLightsBuffer)
    rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    inputLightsBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputLightsBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputLightsBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputLightsBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputLightsBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputLightsBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputLightsBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputLightsBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputLightsBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputLightsBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputLightsBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputLightsBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputLightsBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE10_WORDS)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_T0_SPACE10_WORDS]; };
StructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(t0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE10_WORDS]
#elif defined(RD_NATIVE_U0_SPACE10_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE10)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_U0_SPACE10_WORDS]; };
RWStructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(u0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE10_WORDS]
#define RD_BYTE_WRITABLE_faceDataBuffersRW 1
#else
ByteAddressBuffer faceDataBuffersRW[4096] : register(t0, space10);
#endif
uint rdByteLoad_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    return rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceDataBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceDataBuffersRW)
void rdByteStore_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceDataBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceDataBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2DArray<float4> blueNoiseTexture : register(t58, space0);
Texture2DArray<float4> skyTexture : register(t59, space0);
Texture2DArray<float4> causticsTexture : register(t60, space0);
Texture2D<float4> wibblyTexture : register(t61, space0);
Texture2D<float4> waterNormalsTexture : register(t62, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
RWTexture2D<float> outputBufferPrimaryPathLength : register(u0, space0);
RWTexture2D<float4> outputBufferEmissiveAndLinearRoughness : register(u4, space0);
RWTexture2D<float4> outputBufferPrimaryPosLowPrecision : register(u29, space0);
RWTexture2D<float4> outputPrimaryWorldPosition : register(u33, space0);
SamplerState defaultSampler : register(s0, space0);
SamplerState linearSampler : register(s1, space0);
SamplerState linearWrapSampler : register(s2, space0);
static uint3 workgroupId;
static uint3 localThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue14;
static RayQuery<RAY_FLAG_NONE> intermediateValue253;
static RayQuery<RAY_FLAG_NONE> intermediateValue305;
static RayQuery<RAY_FLAG_NONE> intermediateValue307;
static RayQuery<RAY_FLAG_NONE> intermediateValue340;
static RayQuery<RAY_FLAG_NONE> intermediateValue350;
static RayQuery<RAY_FLAG_NONE> intermediateValue406;
static RayQuery<RAY_FLAG_NONE> intermediateValue450;
static RayQuery<RAY_FLAG_NONE> intermediateValue505;
static RayQuery<RAY_FLAG_NONE> intermediateValue639;
#elif RD_BINDING_LAYOUT == 41
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<int4> inputPlaneIdentifier : register(t27, space0);
RWTexture2D<float> outputBufferHistoryLength : register(u2, space0);
RWTexture2D<float> denoisingOutputs[8] : register(u0, space3);
static uint3 workgroupId;
static uint3 localThreadId;
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
groupshared uint intermediateValue[324];
groupshared float intermediateValue1[972];
#elif RD_BINDING_LAYOUT == 42
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
Texture2D<float4> previousPrimaryPathLengthBuffer : register(t4, space0);
Texture2D<float4> previousPrimaryNormalBuffer : register(t5, space0);
Texture2D<float4> inputBufferMotionVectors : register(t21, space0);
Texture2D<float4> inputBufferReprojectedPathLength : register(t29, space0);
Texture2D<float4> previousSunLightShadowBuffer : register(t30, space0);
Texture2D<float4> inputGeometryNormal : register(t43, space0);
Texture2D<int4> inputTileClassification : register(t57, space0);
RWTexture2D<float> shadowDenoisingOutputs[2] : register(u0, space4);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 43
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2D<float4> inputGeometryNormal : register(t43, space0);
Texture2D<float4> inputPrimaryWorldPosition : register(t45, space0);
Texture2DArray<float4> blueNoiseTexture : register(t58, space0);
Texture2DArray<float4> causticsTexture : register(t60, space0);
Texture2D<float4> wibblyTexture : register(t61, space0);
Texture2D<int4> inputBufferPreviousMedium : register(t63, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
RWTexture2D<float> outputBufferDebug : register(u14, space0);
RWTexture2D<float4> outputBufferSunLightShadow : register(u21, space0);
SamplerState defaultSampler : register(s0, space0);
SamplerState linearWrapSampler : register(s2, space0);
static uint3 workgroupId;
static uint3 localThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue29;
static RayQuery<RAY_FLAG_NONE> intermediateValue45;
static RayQuery<RAY_FLAG_NONE> intermediateValue54;
static RayQuery<RAY_FLAG_NONE> intermediateValue77;
#elif RD_BINDING_LAYOUT == 44
static float intermediateValue132;
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T19_WORDS)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_T19_WORDS]; };
StructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(t19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_T19_WORDS].words[(wordIndex) % RD_NATIVE_T19_WORDS]
#elif defined(RD_NATIVE_U19_WORDS) && !defined(RD_NATIVE_RAW_T19)
struct RdByteElement_inputIncidentLight { uint words[RD_NATIVE_U19_WORDS]; };
RWStructuredBuffer<RdByteElement_inputIncidentLight> inputIncidentLight : register(u19, space0);
#define RD_BYTE_STRUCT_inputIncidentLight 1
#define rdByteWord_inputIncidentLight(resourceIndex, wordIndex) inputIncidentLight[(wordIndex) / RD_NATIVE_U19_WORDS].words[(wordIndex) % RD_NATIVE_U19_WORDS]
#define RD_BYTE_WRITABLE_inputIncidentLight 1
#else
ByteAddressBuffer inputIncidentLight : register(t19, space0);
#endif
uint rdByteLoad_inputIncidentLight_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    return rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
#else
    return inputIncidentLight.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 8u), rdByteLoad_inputIncidentLight_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_inputIncidentLight)
void rdByteStore_inputIncidentLight_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u) = value;
#else
    inputIncidentLight.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_inputIncidentLight)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_inputIncidentLight(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    inputIncidentLight.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_inputIncidentLight_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_inputIncidentLight_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_inputIncidentLight_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_inputIncidentLight_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_inputIncidentLight_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_inputIncidentLight_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_inputIncidentLight_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_inputIncidentLight_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T35_WORDS)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_T35_WORDS]; };
StructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(t35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_T35_WORDS].words[(wordIndex) % RD_NATIVE_T35_WORDS]
#elif defined(RD_NATIVE_U35_WORDS) && !defined(RD_NATIVE_RAW_T35)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_U35_WORDS]; };
RWStructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(u35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_U35_WORDS].words[(wordIndex) % RD_NATIVE_U35_WORDS]
#define RD_BYTE_WRITABLE_pbrTextureDataBuffer 1
#else
ByteAddressBuffer pbrTextureDataBuffer : register(t35, space0);
#endif
uint rdByteLoad_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    return rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
#else
    return pbrTextureDataBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_pbrTextureDataBuffer)
void rdByteStore_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    pbrTextureDataBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    pbrTextureDataBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE2_WORDS)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#elif defined(RD_NATIVE_U0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE2)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_vertexBuffers 1
#else
ByteAddressBuffer vertexBuffers[4096] : register(t0, space2);
#endif
uint rdByteLoad_vertexBuffers_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    return rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
#else
    return vertexBuffers[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexBuffers_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexBuffers_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexBuffers_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexBuffers)
void rdByteStore_vertexBuffers_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexBuffers[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexBuffers[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexBuffers_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexBuffers_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE1_WORDS)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_T0_SPACE1_WORDS]; };
StructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(t0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE1_WORDS]
#elif defined(RD_NATIVE_U0_SPACE1_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE1)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_U0_SPACE1_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(u0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE1_WORDS]
#define RD_BYTE_WRITABLE_vertexIrradianceCache 1
#else
ByteAddressBuffer vertexIrradianceCache[4096] : register(t0, space1);
#endif
uint rdByteLoad_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    return rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
#else
    return vertexIrradianceCache[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexIrradianceCache)
void rdByteStore_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexIrradianceCache[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexIrradianceCache[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE10_WORDS)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_T0_SPACE10_WORDS]; };
StructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(t0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE10_WORDS]
#elif defined(RD_NATIVE_U0_SPACE10_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE10)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_U0_SPACE10_WORDS]; };
RWStructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(u0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE10_WORDS]
#define RD_BYTE_WRITABLE_faceDataBuffersRW 1
#else
ByteAddressBuffer faceDataBuffersRW[4096] : register(t0, space10);
#endif
uint rdByteLoad_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    return rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceDataBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceDataBuffersRW)
void rdByteStore_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceDataBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceDataBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
cbuffer RootConstantsUBO : register(b2, space0)
{
    float4 rootConstantsConstants[1] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2D<float4> inputBufferPrimaryPathLength : register(t14, space0);
Texture2D<float4> inputBufferNormal : register(t15, space0);
Texture2D<float4> inputGeometryNormal : register(t43, space0);
Texture2D<float4> inputPrimaryWorldPosition : register(t45, space0);
Texture2D<float4> inputPrimaryViewDirection : register(t46, space0);
Texture2DArray<float4> blueNoiseTexture : register(t58, space0);
Texture2DArray<float4> skyTexture : register(t59, space0);
Texture2DArray<float4> causticsTexture : register(t60, space0);
Texture2D<float4> wibblyTexture : register(t61, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
RWTexture2D<float> outputBufferEmissiveAndLinearRoughness : register(u4, space0);
RWTexture2D<float> outputBufferIndirectSpecular : register(u6, space0);
RWTexture2D<float> outputBufferDebug : register(u14, space0);
RWTexture2D<float4> outputBufferReflectionDistance : register(u15, space0);
SamplerState defaultSampler : register(s0, space0);
SamplerState linearSampler : register(s1, space0);
SamplerState linearWrapSampler : register(s2, space0);
static uint3 workgroupId;
static uint3 localThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue46;
static RayQuery<RAY_FLAG_NONE> intermediateValue158;
static RayQuery<RAY_FLAG_NONE> intermediateValue173;
static RayQuery<RAY_FLAG_NONE> intermediateValue175;
static RayQuery<RAY_FLAG_NONE> intermediateValue197;
#elif RD_BINDING_LAYOUT == 45
static float intermediateValue6;
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
RWTexture2D<float4> outputBufferFinal : register(u12, space0);
RWTexture2D<float> outputBufferReferencePathTracer : register(u23, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 46
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
RWTexture2D<uint> outputBufferToneMappingHistogram : register(u26, space0);
RWTexture2D<float> outputBufferToneCurve : register(u27, space0);
static uint localThreadIndex;
struct ComputeStageInput
{
    uint localThreadIndex : SV_GroupIndex;
};
groupshared float intermediateValue[256];
#elif RD_BINDING_LAYOUT == 47
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
Texture2D<float4> inputFinalColour : register(t42, space0);
RWTexture2D<uint> outputBufferToneMappingHistogram : register(u26, space0);
static uint3 dispatchThreadId;
static uint localThreadIndex;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
    uint localThreadIndex : SV_GroupIndex;
};
groupshared uint intermediateValue[256];
#elif RD_BINDING_LAYOUT == 48
static float intermediateValue33;
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T1_WORDS)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_T1_WORDS]; };
StructuredBuffer<RdByteElement_objectInstances> objectInstances : register(t1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_T1_WORDS].words[(wordIndex) % RD_NATIVE_T1_WORDS]
#elif defined(RD_NATIVE_U1_WORDS) && !defined(RD_NATIVE_RAW_T1)
struct RdByteElement_objectInstances { uint words[RD_NATIVE_U1_WORDS]; };
RWStructuredBuffer<RdByteElement_objectInstances> objectInstances : register(u1, space0);
#define RD_BYTE_STRUCT_objectInstances 1
#define rdByteWord_objectInstances(resourceIndex, wordIndex) objectInstances[(wordIndex) / RD_NATIVE_U1_WORDS].words[(wordIndex) % RD_NATIVE_U1_WORDS]
#define RD_BYTE_WRITABLE_objectInstances 1
#else
ByteAddressBuffer objectInstances : register(t1, space0);
#endif
uint rdByteLoad_objectInstances_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    return rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
#else
    return objectInstances.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_objectInstances_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_objectInstances_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_objectInstances_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_objectInstances_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_objectInstances_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 8u), rdByteLoad_objectInstances_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_objectInstances_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_objectInstances)
void rdByteStore_objectInstances_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u) = value;
#else
    objectInstances.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_objectInstances)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_objectInstances(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    objectInstances.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_objectInstances_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_objectInstances_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_objectInstances_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_objectInstances_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_objectInstances_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_objectInstances_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_objectInstances_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_objectInstances_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T3_WORDS)
struct RdByteElement_faceIrradianceCacheUpdateChunks { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdByteElement_faceIrradianceCacheUpdateChunks> faceIrradianceCacheUpdateChunks : register(t3, space0);
#define RD_BYTE_STRUCT_faceIrradianceCacheUpdateChunks 1
#define rdByteWord_faceIrradianceCacheUpdateChunks(resourceIndex, wordIndex) faceIrradianceCacheUpdateChunks[(wordIndex) / RD_NATIVE_T3_WORDS].words[(wordIndex) % RD_NATIVE_T3_WORDS]
#elif defined(RD_NATIVE_U3_WORDS) && !defined(RD_NATIVE_RAW_T3)
struct RdByteElement_faceIrradianceCacheUpdateChunks { uint words[RD_NATIVE_U3_WORDS]; };
RWStructuredBuffer<RdByteElement_faceIrradianceCacheUpdateChunks> faceIrradianceCacheUpdateChunks : register(u3, space0);
#define RD_BYTE_STRUCT_faceIrradianceCacheUpdateChunks 1
#define rdByteWord_faceIrradianceCacheUpdateChunks(resourceIndex, wordIndex) faceIrradianceCacheUpdateChunks[(wordIndex) / RD_NATIVE_U3_WORDS].words[(wordIndex) % RD_NATIVE_U3_WORDS]
#define RD_BYTE_WRITABLE_faceIrradianceCacheUpdateChunks 1
#else
ByteAddressBuffer faceIrradianceCacheUpdateChunks : register(t3, space0);
#endif
uint rdByteLoad_faceIrradianceCacheUpdateChunks_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCacheUpdateChunks)
    return rdByteWord_faceIrradianceCacheUpdateChunks(resourceIndex, byteOffset >> 2u);
#else
    return faceIrradianceCacheUpdateChunks.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceIrradianceCacheUpdateChunks_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceIrradianceCacheUpdateChunks_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceIrradianceCacheUpdateChunks_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceIrradianceCacheUpdateChunks)
void rdByteStore_faceIrradianceCacheUpdateChunks_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCacheUpdateChunks)
    rdByteWord_faceIrradianceCacheUpdateChunks(resourceIndex, byteOffset >> 2u) = value;
#else
    faceIrradianceCacheUpdateChunks.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCacheUpdateChunks)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceIrradianceCacheUpdateChunks(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceIrradianceCacheUpdateChunks(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceIrradianceCacheUpdateChunks.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceIrradianceCacheUpdateChunks_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceIrradianceCacheUpdateChunks_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceIrradianceCacheUpdateChunks_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceIrradianceCacheUpdateChunks_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T35_WORDS)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_T35_WORDS]; };
StructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(t35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_T35_WORDS].words[(wordIndex) % RD_NATIVE_T35_WORDS]
#elif defined(RD_NATIVE_U35_WORDS) && !defined(RD_NATIVE_RAW_T35)
struct RdByteElement_pbrTextureDataBuffer { uint words[RD_NATIVE_U35_WORDS]; };
RWStructuredBuffer<RdByteElement_pbrTextureDataBuffer> pbrTextureDataBuffer : register(u35, space0);
#define RD_BYTE_STRUCT_pbrTextureDataBuffer 1
#define rdByteWord_pbrTextureDataBuffer(resourceIndex, wordIndex) pbrTextureDataBuffer[(wordIndex) / RD_NATIVE_U35_WORDS].words[(wordIndex) % RD_NATIVE_U35_WORDS]
#define RD_BYTE_WRITABLE_pbrTextureDataBuffer 1
#else
ByteAddressBuffer pbrTextureDataBuffer : register(t35, space0);
#endif
uint rdByteLoad_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    return rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
#else
    return pbrTextureDataBuffer.Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u), rdByteLoad_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_pbrTextureDataBuffer)
void rdByteStore_pbrTextureDataBuffer_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u) = value;
#else
    pbrTextureDataBuffer.Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_pbrTextureDataBuffer)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_pbrTextureDataBuffer(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    pbrTextureDataBuffer.Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_pbrTextureDataBuffer_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_pbrTextureDataBuffer_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_pbrTextureDataBuffer_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE2_WORDS)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#elif defined(RD_NATIVE_U0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE2)
struct RdByteElement_vertexBuffers { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexBuffers> vertexBuffers[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_vertexBuffers 1
#define rdByteWord_vertexBuffers(resourceIndex, wordIndex) vertexBuffers[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_vertexBuffers 1
#else
ByteAddressBuffer vertexBuffers[4096] : register(t0, space2);
#endif
uint rdByteLoad_vertexBuffers_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    return rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
#else
    return vertexBuffers[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexBuffers_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexBuffers_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexBuffers_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexBuffers_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexBuffers)
void rdByteStore_vertexBuffers_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexBuffers[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexBuffers)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexBuffers(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexBuffers[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexBuffers_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexBuffers_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexBuffers_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexBuffers_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexBuffers_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexBuffers_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexBuffers_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexBuffers_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE1_WORDS)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_T0_SPACE1_WORDS]; };
StructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(t0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE1_WORDS]
#elif defined(RD_NATIVE_U0_SPACE1_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE1)
struct RdByteElement_vertexIrradianceCache { uint words[RD_NATIVE_U0_SPACE1_WORDS]; };
RWStructuredBuffer<RdByteElement_vertexIrradianceCache> vertexIrradianceCache[4096] : register(u0, space1);
#define RD_BYTE_STRUCT_vertexIrradianceCache 1
#define rdByteWord_vertexIrradianceCache(resourceIndex, wordIndex) vertexIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE1_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE1_WORDS]
#define RD_BYTE_WRITABLE_vertexIrradianceCache 1
#else
ByteAddressBuffer vertexIrradianceCache[4096] : register(t0, space1);
#endif
uint rdByteLoad_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    return rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
#else
    return vertexIrradianceCache[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u), rdByteLoad_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_vertexIrradianceCache)
void rdByteStore_vertexIrradianceCache_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u) = value;
#else
    vertexIrradianceCache[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_vertexIrradianceCache)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_vertexIrradianceCache(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    vertexIrradianceCache[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_vertexIrradianceCache_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_vertexIrradianceCache_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_vertexIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_vertexIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_vertexIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_vertexIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_U0_SPACE2_WORDS)
struct RdByteElement_faceIrradianceCache { uint words[RD_NATIVE_U0_SPACE2_WORDS]; };
RWStructuredBuffer<RdByteElement_faceIrradianceCache> faceIrradianceCache[4096] : register(u0, space2);
#define RD_BYTE_STRUCT_faceIrradianceCache 1
#define rdByteWord_faceIrradianceCache(resourceIndex, wordIndex) faceIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE2_WORDS]
#define RD_BYTE_WRITABLE_faceIrradianceCache 1
#elif defined(RD_NATIVE_T0_SPACE2_WORDS) && !defined(RD_NATIVE_RAW_U0_SPACE2)
struct RdByteElement_faceIrradianceCache { uint words[RD_NATIVE_T0_SPACE2_WORDS]; };
StructuredBuffer<RdByteElement_faceIrradianceCache> faceIrradianceCache[4096] : register(t0, space2);
#define RD_BYTE_STRUCT_faceIrradianceCache 1
#define rdByteWord_faceIrradianceCache(resourceIndex, wordIndex) faceIrradianceCache[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE2_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE2_WORDS]
#else
RWByteAddressBuffer faceIrradianceCache[4096] : register(u0, space2);
#endif
uint rdByteLoad_faceIrradianceCache_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCache)
    return rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u);
#else
    return faceIrradianceCache[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceIrradianceCache_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceIrradianceCache_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceIrradianceCache_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceIrradianceCache_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u)); }
#if !defined(RD_BYTE_STRUCT_faceIrradianceCache) || defined(RD_BYTE_WRITABLE_faceIrradianceCache)
void rdByteStore_faceIrradianceCache_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCache)
    rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u) = value;
#else
    faceIrradianceCache[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceIrradianceCache_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceIrradianceCache)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceIrradianceCache(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceIrradianceCache[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceIrradianceCache_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceIrradianceCache_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceIrradianceCache_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceIrradianceCache_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceIrradianceCache_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceIrradianceCache_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceIrradianceCache_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceIrradianceCache_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE10_WORDS)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_T0_SPACE10_WORDS]; };
StructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(t0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE10_WORDS]
#elif defined(RD_NATIVE_U0_SPACE10_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE10)
struct RdByteElement_faceDataBuffersRW { uint words[RD_NATIVE_U0_SPACE10_WORDS]; };
RWStructuredBuffer<RdByteElement_faceDataBuffersRW> faceDataBuffersRW[4096] : register(u0, space10);
#define RD_BYTE_STRUCT_faceDataBuffersRW 1
#define rdByteWord_faceDataBuffersRW(resourceIndex, wordIndex) faceDataBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE10_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE10_WORDS]
#define RD_BYTE_WRITABLE_faceDataBuffersRW 1
#else
ByteAddressBuffer faceDataBuffersRW[4096] : register(t0, space10);
#endif
uint rdByteLoad_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    return rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceDataBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceDataBuffersRW)
void rdByteStore_faceDataBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceDataBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceDataBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceDataBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceDataBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceDataBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceDataBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceDataBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceDataBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceDataBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceDataBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
// Recovered byte access over original native descriptors.
#if defined(RD_NATIVE_T0_SPACE11_WORDS)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_T0_SPACE11_WORDS]; };
StructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(t0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_T0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_T0_SPACE11_WORDS]
#elif defined(RD_NATIVE_U0_SPACE11_WORDS) && !defined(RD_NATIVE_RAW_T0_SPACE11)
struct RdByteElement_faceUvBuffersRW { uint words[RD_NATIVE_U0_SPACE11_WORDS]; };
RWStructuredBuffer<RdByteElement_faceUvBuffersRW> faceUvBuffersRW[4096] : register(u0, space11);
#define RD_BYTE_STRUCT_faceUvBuffersRW 1
#define rdByteWord_faceUvBuffersRW(resourceIndex, wordIndex) faceUvBuffersRW[resourceIndex][(wordIndex) / RD_NATIVE_U0_SPACE11_WORDS].words[(wordIndex) % RD_NATIVE_U0_SPACE11_WORDS]
#define RD_BYTE_WRITABLE_faceUvBuffersRW 1
#else
ByteAddressBuffer faceUvBuffersRW[4096] : register(t0, space11);
#endif
uint rdByteLoad_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    return rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
#else
    return faceUvBuffersRW[resourceIndex].Load<uint>(byteOffset);
#endif
}
uint16_t rdByteLoad_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset)
{
    return uint16_t((rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset & ~3u) >> ((byteOffset & 3u) * 8u)) & 65535u);
}
uint2 rdByteLoad_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset) { return uint2(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u)); }
uint3 rdByteLoad_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset) { return uint3(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u)); }
uint4 rdByteLoad_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset) { return uint4(rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u), rdByteLoad_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u)); }
uint16_t2 rdByteLoad_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset) { return uint16_t2(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u)); }
uint16_t3 rdByteLoad_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset) { return uint16_t3(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u)); }
uint16_t4 rdByteLoad_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset) { return uint16_t4(rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u), rdByteLoad_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u)); }
#if defined(RD_BYTE_WRITABLE_faceUvBuffersRW)
void rdByteStore_faceUvBuffersRW_uint(uint resourceIndex, uint byteOffset, uint value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u) = value;
#else
    faceUvBuffersRW[resourceIndex].Store<uint>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint16_t(uint resourceIndex, uint byteOffset, uint16_t value)
{
#if defined(RD_BYTE_STRUCT_faceUvBuffersRW)
    uint shift = (byteOffset & 3u) * 8u;
    uint mask = 65535u << shift;
    uint previous = rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u);
    uint observed;
    do
    {
        uint expected = previous;
        uint replacement = (expected & ~mask) | ((uint(value) << shift) & mask);
        InterlockedCompareExchange(rdByteWord_faceUvBuffersRW(resourceIndex, byteOffset >> 2u), expected, replacement, observed);
        if (observed == expected) break;
        previous = observed;
    } while (true);
#else
    faceUvBuffersRW[resourceIndex].Store<uint16_t>(byteOffset, value);
#endif
}
void rdByteStore_faceUvBuffersRW_uint2(uint resourceIndex, uint byteOffset, uint2 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint3(uint resourceIndex, uint byteOffset, uint3 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint4(uint resourceIndex, uint byteOffset, uint4 value)
{
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 4u, value.y);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 8u, value.z);
    rdByteStore_faceUvBuffersRW_uint(resourceIndex, byteOffset + 12u, value.w);
}
void rdByteStore_faceUvBuffersRW_uint16_t2(uint resourceIndex, uint byteOffset, uint16_t2 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
}
void rdByteStore_faceUvBuffersRW_uint16_t3(uint resourceIndex, uint byteOffset, uint16_t3 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
}
void rdByteStore_faceUvBuffersRW_uint16_t4(uint resourceIndex, uint byteOffset, uint16_t4 value)
{
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 0u, value.x);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 2u, value.y);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 4u, value.z);
    rdByteStore_faceUvBuffersRW_uint16_t(resourceIndex, byteOffset + 6u, value.w);
}
#endif
cbuffer ViewCBUBO : register(b0, space0)
{
    float4 viewCbConstants[100] : packoffset(c0);
};
uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2DArray<float4> causticsTexture : register(t60, space0);
Texture2D<float4> wibblyTexture : register(t61, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
SamplerState defaultSampler : register(s0, space0);
SamplerState linearWrapSampler : register(s2, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
static RayQuery<RAY_FLAG_NONE> intermediateValue34;
static RayQuery<RAY_FLAG_NONE> intermediateValue57;
static RayQuery<RAY_FLAG_NONE> intermediateValue59;
static RayQuery<RAY_FLAG_NONE> intermediateValue81;
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_bufferIncidentLight
#define rdAccess_bufferIncidentLight(index) bufferIncidentLight[index]
#endif
#ifndef rdAccess_inputIncidentLight
#define rdAccess_inputIncidentLight(index) inputIncidentLight[index]
#endif
