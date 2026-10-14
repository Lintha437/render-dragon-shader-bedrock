// Native descriptor classes and spaces are preserved independently.
#include "../../include/ProjectConfig.h"
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

uniform RaytracingAccelerationStructure SceneBVH : register(t0, space0);
Texture2DArray<float4> skyTexture : register(t59, space0);
Texture2DArray<float4> causticsTexture : register(t60, space0);
Texture2D<float4> wibblyTexture : register(t61, space0);
Texture2D<float4> textures[4096] : register(t0, space6);
SamplerState defaultSampler : register(s0, space0);
SamplerState linearSampler : register(s1, space0);
SamplerState linearWrapSampler : register(s2, space0);

static uint3 gl_GlobalInvocationID;
struct ComputeStageInput
{
    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
};

static RayQuery<RAY_FLAG_NONE> intermediateValue55;
static RayQuery<RAY_FLAG_NONE> intermediateValue82;
static RayQuery<RAY_FLAG_NONE> intermediateValue243;
static RayQuery<RAY_FLAG_NONE> intermediateValue258;
static RayQuery<RAY_FLAG_NONE> intermediateValue293;
static RayQuery<RAY_FLAG_NONE> intermediateValue295;
static RayQuery<RAY_FLAG_NONE> intermediateValue326;

void executeComputeStage()
{
    uint bitwiseValue = gl_GlobalInvocationID.x >> 4u;
    uint productValue = bitwiseValue * 2u;
    uint productValue1 = (bitwiseValue * 2u) + 1u;
    uint bitwiseValue1 = gl_GlobalInvocationID.x & 15u;
    uint bitwiseValue2 = rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(0u, productValue * 4 + 0) & 65535u;
    if (bitwiseValue1 < (rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(0u, productValue * 4 + 0) >> 16u))
    {
        uint productValue2 = bitwiseValue2 * 38u;
        float4 reinterpretedBits = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue2 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue2 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue2 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue2 + 3u) * 4 + 0)));
        float intermediateValue3 = reinterpretedBits.x;
        float intermediateValue4 = reinterpretedBits.y;
        float intermediateValue5 = reinterpretedBits.z;
        uint productValue3 = (bitwiseValue2 * 38u) + 4u;
        float4 reinterpretedBits1 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue3 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue3 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue3 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue3 + 3u) * 4 + 0)));
        float intermediateValue6 = reinterpretedBits1.x;
        float intermediateValue7 = reinterpretedBits1.y;
        float intermediateValue8 = reinterpretedBits1.z;
        uint productValue4 = (bitwiseValue2 * 38u) + 8u;
        float4 reinterpretedBits2 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue4 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue4 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue4 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue4 + 3u) * 4 + 0)));
        float intermediateValue9 = reinterpretedBits2.x;
        float intermediateValue10 = reinterpretedBits2.y;
        float intermediateValue11 = reinterpretedBits2.z;
        uint productValue5 = (bitwiseValue2 * 38u) + 25u;
        uint productValue6 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue2 * 76u) + 54u) * 2 + 0));
        uint sumValue = productValue6 + 0u;
        uint sumValue1 = productValue6 + 0u;
        uint productValue7 = rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(0u, productValue1 * 4 + 0) + bitwiseValue1;
        uint bitwiseValue3 = rdByteLoad_objectInstances_uint(0u, ((bitwiseValue2 * 38u) + 24u) * 4 + 0) + (productValue7 & 4294967292u);
        uint bitwiseValue4 = (rdByteLoad_vertexIrradianceCacheUpdateChunks_uint(0u, productValue1 * 4 + 0) + gl_GlobalInvocationID.x) & 3u;
        uint productValue8 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue2 * 76u) + 56u) * 2 + 0));
        float comparisonValue = (bitwiseValue4 == 0u) ? 0.85000002384185791015625f : 0.0500000007450580596923828125f;
        uint bitwiseValue5 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue2 * 76u) + 71u) * 2 + 0) & 255u);
        uint bitwiseValue6 = (bitwiseValue5 + (productValue8 * bitwiseValue3)) >> 1u;
        half3 productValue9 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), bitwiseValue6 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue6 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue6 + 2u) * 2 + 0)));
        precise float productValue10 = comparisonValue * float(productValue9.x);
        precise float productValue11 = comparisonValue * float(productValue9.y);
        precise float productValue12 = comparisonValue * float(productValue9.z);
        precise float sumValue2 = productValue10 + 0.0f;
        precise float sumValue3 = productValue11 + 0.0f;
        precise float sumValue4 = productValue12 + 0.0f;
        float comparisonValue1 = (bitwiseValue4 == 1u) ? 0.85000002384185791015625f : 0.0500000007450580596923828125f;
        uint bitwiseValue7 = (bitwiseValue5 + (productValue8 * (bitwiseValue3 + 1u))) >> 1u;
        half3 productValue13 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), bitwiseValue7 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue7 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue7 + 2u) * 2 + 0)));
        precise float productValue14 = comparisonValue1 * float(productValue13.x);
        precise float productValue15 = comparisonValue1 * float(productValue13.y);
        precise float productValue16 = comparisonValue1 * float(productValue13.z);
        precise float sumValue5 = sumValue2 + productValue14;
        precise float sumValue6 = sumValue3 + productValue15;
        precise float sumValue7 = sumValue4 + productValue16;
        float comparisonValue2 = (bitwiseValue4 == 2u) ? 0.85000002384185791015625f : 0.0500000007450580596923828125f;
        uint bitwiseValue8 = (bitwiseValue5 + (productValue8 * (bitwiseValue3 + 2u))) >> 1u;
        half3 productValue17 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), bitwiseValue8 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue8 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue8 + 2u) * 2 + 0)));
        precise float productValue18 = comparisonValue2 * float(productValue17.x);
        precise float productValue19 = comparisonValue2 * float(productValue17.y);
        precise float productValue20 = comparisonValue2 * float(productValue17.z);
        precise float sumValue8 = sumValue5 + productValue18;
        precise float sumValue9 = sumValue6 + productValue19;
        precise float sumValue10 = sumValue7 + productValue20;
        float comparisonValue3 = (bitwiseValue4 == 3u) ? 0.85000002384185791015625f : 0.0500000007450580596923828125f;
        uint bitwiseValue9 = (bitwiseValue5 + (productValue8 * (bitwiseValue3 + 3u))) >> 1u;
        half3 productValue21 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), bitwiseValue9 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue9 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue), (bitwiseValue9 + 2u) * 2 + 0)));
        precise float productValue22 = comparisonValue3 * float(productValue21.x);
        precise float productValue23 = comparisonValue3 * float(productValue21.y);
        precise float productValue24 = comparisonValue3 * float(productValue21.z);
        precise float sumValue11 = sumValue8 + productValue22;
        precise float sumValue12 = sumValue9 + productValue23;
        precise float sumValue13 = sumValue10 + productValue24;
        precise float productValue25 = intermediateValue3 * sumValue11;
        precise float productValue26 = sumValue12 * intermediateValue4;
        precise float sumValue14 = productValue26 + productValue25;
        precise float productValue27 = sumValue13 * intermediateValue5;
        precise float sumValue15 = productValue27 + sumValue14;
        precise float productValue28 = 1.0f * reinterpretedBits.w;
        precise float sumValue16 = productValue28 + sumValue15;
        precise float productValue29 = intermediateValue6 * sumValue11;
        precise float productValue30 = sumValue12 * intermediateValue7;
        precise float sumValue17 = productValue30 + productValue29;
        precise float productValue31 = sumValue13 * intermediateValue8;
        precise float sumValue18 = productValue31 + sumValue17;
        precise float productValue32 = 1.0f * reinterpretedBits1.w;
        precise float sumValue19 = productValue32 + sumValue18;
        precise float productValue33 = intermediateValue9 * sumValue11;
        precise float productValue34 = sumValue12 * intermediateValue10;
        precise float sumValue20 = productValue34 + productValue33;
        precise float productValue35 = sumValue13 * intermediateValue11;
        precise float sumValue21 = productValue35 + sumValue20;
        precise float productValue36 = 1.0f * reinterpretedBits2.w;
        precise float sumValue22 = productValue36 + sumValue21;
        uint sumValue23 = productValue6 + 0u;
        uint bitwiseValue10 = ((rdByteLoad_objectInstances_uint(0u, productValue5 * 4 + 0) >> 2u) + ((productValue7 >> 2u) & 536870911u)) * 4u;
        precise float bitwiseValue11 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue23), bitwiseValue10 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
        precise float sumValue24 = bitwiseValue11 + (-1.0f);
        precise float bitwiseValue12 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue23), bitwiseValue10 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
        precise float sumValue25 = bitwiseValue12 + (-1.0f);
        precise float bitwiseValue13 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue23), bitwiseValue10 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
        precise float sumValue26 = bitwiseValue13 + (-1.0f);
        precise float productValue37 = intermediateValue3 * sumValue24;
        precise float productValue38 = sumValue25 * intermediateValue4;
        precise float sumValue27 = productValue38 + productValue37;
        precise float productValue39 = sumValue26 * intermediateValue5;
        precise float sumValue28 = productValue39 + sumValue27;
        precise float productValue40 = intermediateValue6 * sumValue24;
        precise float productValue41 = sumValue25 * intermediateValue7;
        precise float sumValue29 = productValue41 + productValue40;
        precise float productValue42 = sumValue26 * intermediateValue8;
        precise float sumValue30 = productValue42 + sumValue29;
        precise float productValue43 = intermediateValue9 * sumValue24;
        precise float productValue44 = sumValue25 * intermediateValue10;
        precise float sumValue31 = productValue44 + productValue43;
        precise float productValue45 = sumValue26 * intermediateValue11;
        precise float sumValue32 = productValue45 + sumValue31;
        float inverseLengthValue = rsqrt(dot(float3(sumValue28, sumValue30, sumValue32), float3(sumValue28, sumValue30, sumValue32)));
        precise float productValue46 = sumValue28 * inverseLengthValue;
        precise float productValue47 = sumValue30 * inverseLengthValue;
        precise float productValue48 = sumValue32 * inverseLengthValue;
        uint reinterpretedBits3 = (((uint(int(sumValue19)) << 6u) ^ uint(int(sumValue16))) ^ (uint(int(sumValue22)) << 12u)) ^ asuint(rootConstantsConstants[0u]).x;
        bool dotProductValue = dot(float3(0.847100675106048583984375f, 0.2079117000102996826171875f, 0.489073812961578369140625f), float3(productValue46, productValue47, productValue48)) > 0.949999988079071044921875f;
        float comparisonValue4 = dotProductValue ? (-0.639436304569244384765625f) : 0.847100675106048583984375f;
        float comparisonValue5 = dotProductValue ? (-0.3907311260700225830078125f) : 0.2079117000102996826171875f;
        float comparisonValue6 = dotProductValue ? 0.6621558666229248046875f : 0.489073812961578369140625f;
        precise float dotProductValue1 = dot(float3(comparisonValue4, comparisonValue5, comparisonValue6), float3(productValue46, productValue47, productValue48));
        precise float productValue49 = productValue46 * dotProductValue1;
        precise float productValue50 = productValue47 * dotProductValue1;
        precise float productValue51 = productValue48 * dotProductValue1;
        precise float sumValue33 = comparisonValue4 - productValue49;
        precise float sumValue34 = comparisonValue5 - productValue50;
        precise float sumValue35 = comparisonValue6 - productValue51;
        float inverseLengthValue1 = rsqrt(dot(float3(sumValue33, sumValue34, sumValue35), float3(sumValue33, sumValue34, sumValue35)));
        precise float productValue52 = sumValue33 * inverseLengthValue1;
        precise float productValue53 = sumValue34 * inverseLengthValue1;
        precise float productValue54 = sumValue35 * inverseLengthValue1;
        precise float productValue55 = productValue47 * productValue54;
        precise float productValue56 = productValue48 * productValue53;
        precise float sumValue36 = productValue55 - productValue56;
        precise float productValue57 = productValue48 * productValue52;
        precise float productValue58 = productValue46 * productValue54;
        precise float sumValue37 = productValue57 - productValue58;
        precise float productValue59 = productValue46 * productValue53;
        precise float productValue60 = productValue47 * productValue52;
        precise float sumValue38 = productValue59 - productValue60;
        float multiplyAddValue = mad(productValue46, 0.004999999888241291046142578125f, sumValue16);
        float multiplyAddValue1 = mad(productValue47, 0.004999999888241291046142578125f, sumValue19);
        float multiplyAddValue2 = mad(productValue48, 0.004999999888241291046142578125f, sumValue22);
        float multiplyAddValue3 = mad(productValue46, -0.004999999888241291046142578125f, sumValue16);
        float multiplyAddValue4 = mad(productValue47, -0.004999999888241291046142578125f, sumValue19);
        float multiplyAddValue5 = mad(productValue48, -0.004999999888241291046142578125f, sumValue22);
        bool comparisonValue7 = rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue2 * 76u) + 70u) * 2 + 0) != 0u;
        float intermediateValue14;
        float intermediateValue16;
        float intermediateValue18;
        float intermediateValue20;
        float intermediateValue22;
        float intermediateValue24;
        float intermediateValue26;
        float intermediateValue28;
        float intermediateValue30;
        float intermediateValue32;
        float intermediateValue34;
        float intermediateValue36;
        float comparisonValue8;
        float comparisonValue9;
        float comparisonValue10;
        float comparisonValue11;
        float comparisonValue12;
        float comparisonValue13;
        float intermediateValue69;
        float intermediateValue70;
        float intermediateValue71;
        uint intermediateValue1[3];
        float intermediateValue2[3];
        float intermediateValue38;
        float intermediateValue40;
        float intermediateValue42;
        uint intermediateValue44;
        float intermediateValue12 = 0.0f;
        float intermediateValue15 = 0.0f;
        float intermediateValue17 = 0.0f;
        float intermediateValue19 = 0.0f;
        float intermediateValue21 = 0.0f;
        float intermediateValue23 = 0.0f;
        float intermediateValue25 = 0.0f;
        float intermediateValue27 = 0.0f;
        float intermediateValue29 = 0.0f;
        float intermediateValue31 = 0.0f;
        float intermediateValue33 = 0.0f;
        float intermediateValue35 = 0.0f;
        float intermediateValue37 = 0.0f;
        float intermediateValue39 = 0.0f;
        float intermediateValue41 = 0.0f;
        uint intermediateValue43 = reinterpretedBits3;
        float intermediateValue45 = 0.0f;
        float intermediateValue46 = 0.0f;
        float intermediateValue47 = 0.0f;
        float intermediateValue48 = 0.0f;
        float intermediateValue49 = 0.0f;
        float intermediateValue50 = 0.0f;
        uint intermediateValue51 = 0u;
        bool comparisonValue14;
        for (;;)
        {
            comparisonValue14 = (intermediateValue51 & 1u) == 0u;
            float intermediateValue52;
            float intermediateValue53;
            float intermediateValue54;
            if (comparisonValue14)
            {
                uint productValue61 = (intermediateValue43 * 1664525u) + 1013904223u;
                precise float bitwiseValue14 = float(productValue61 & 16777215u) * 5.9604644775390625e-08f;
                uint productValue62 = (productValue61 * 1664525u) + 1013904223u;
                precise float bitwiseValue15 = float(productValue62 & 16777215u) * 5.9604644775390625e-08f;
                float nonlinearValue = sqrt(bitwiseValue14);
                precise float productValue63 = bitwiseValue15 * 6.283185482025146484375f;
                precise float wavePhaseValue = nonlinearValue * cos(productValue63);
                precise float wavePhaseValue1 = nonlinearValue * sin(productValue63);
                precise float sumValue40 = 1.0f - bitwiseValue14;
                float nonlinearValue1 = sqrt(sumValue40);
                precise float productValue64 = productValue52 * wavePhaseValue;
                precise float productValue65 = wavePhaseValue1 * sumValue36;
                precise float sumValue41 = productValue65 + productValue64;
                precise float productValue66 = nonlinearValue1 * productValue46;
                precise float sumValue42 = productValue66 + sumValue41;
                precise float productValue67 = productValue53 * wavePhaseValue;
                precise float productValue68 = wavePhaseValue1 * sumValue37;
                precise float sumValue43 = productValue68 + productValue67;
                precise float productValue69 = nonlinearValue1 * productValue47;
                precise float sumValue44 = productValue69 + sumValue43;
                precise float productValue70 = productValue54 * wavePhaseValue;
                precise float productValue71 = wavePhaseValue1 * sumValue38;
                precise float sumValue45 = productValue71 + productValue70;
                precise float productValue72 = nonlinearValue1 * productValue48;
                precise float sumValue46 = productValue72 + sumValue45;
                intermediateValue38 = sumValue42;
                intermediateValue40 = sumValue44;
                intermediateValue42 = sumValue46;
                intermediateValue52 = multiplyAddValue;
                intermediateValue53 = multiplyAddValue1;
                intermediateValue54 = multiplyAddValue2;
                intermediateValue44 = productValue62;
            }
            else
            {
                precise float dotProductValue2 = dot(float3(intermediateValue37, intermediateValue39, intermediateValue41), float3(productValue46, productValue47, productValue48));
                precise float productValue73 = productValue46 * dotProductValue2;
                precise float productValue74 = productValue47 * dotProductValue2;
                precise float productValue75 = productValue48 * dotProductValue2;
                precise float productValue76 = productValue73 * 2.0f;
                precise float productValue77 = productValue74 * 2.0f;
                precise float productValue78 = productValue75 * 2.0f;
                precise float sumValue47 = intermediateValue37 - productValue76;
                precise float sumValue48 = intermediateValue39 - productValue77;
                precise float sumValue49 = intermediateValue41 - productValue78;
                intermediateValue38 = sumValue47;
                intermediateValue40 = sumValue48;
                intermediateValue42 = sumValue49;
                intermediateValue52 = multiplyAddValue3;
                intermediateValue53 = multiplyAddValue4;
                intermediateValue54 = multiplyAddValue5;
                intermediateValue44 = intermediateValue43;
            }
            float branchMergedValue;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            float branchMergedValue8;
            float branchMergedValue9;
            float branchMergedValue10;
            float branchMergedValue11;
            float branchMergedValue12;
            float branchMergedValue13;
            float branchMergedValue16;
            float branchMergedValue17;
            float branchMergedValue18;
            float branchMergedValue19;
            float branchMergedValue20;
            if (comparisonValue7 || comparisonValue14)
            {
                RayDesc _7ident = {float3(intermediateValue52, intermediateValue53, intermediateValue54), 0.0f, float3(intermediateValue38, intermediateValue40, intermediateValue42), 221.6999969482421875f};
                intermediateValue55.TraceRayInline(SceneBVH, 512u, 4u, _7ident);
                bool intermediateValue56 = intermediateValue55.Proceed();
                if (intermediateValue56)
                {
                    bool intermediateValue105;
                    bool comparisonValue15;
                    for (;;)
                    {
                        uint intermediateValue73 = intermediateValue55.CandidateType();
                        comparisonValue15 = intermediateValue73 == 0u;
                        if (comparisonValue15)
                        {
                            float2 intermediateValue100 = intermediateValue55.CandidateTriangleBarycentrics();
                            float2 intermediateValue101 = intermediateValue55.CandidateTriangleBarycentrics();
                            uint intermediateValue102 = intermediateValue55.CandidatePrimitiveIndex();
                            uint intermediateValue103 = intermediateValue55.CandidateInstanceID();
                            uint intermediateValue104 = intermediateValue55.CandidateInstanceIndex();
                            uint productValue98 = (intermediateValue104 * 76u) + 58u;
                            uint productValue99 = (intermediateValue104 * 76u) + 61u;
                            precise float sumValue57 = 1.0f - intermediateValue100.x;
                            precise float sumValue58 = sumValue57 - intermediateValue101.y;
                            uint bitwiseValue17 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue104 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue102 >> 1u);
                            uint productValue100 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue104 * 76u) + 54u) * 2 + 0)) + 0u;
                            bool comparisonValue18 = (intermediateValue102 & 1u) == 0u;
                            uint comparisonValue19 = comparisonValue18 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue17 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue17 * 16 + 0).x;
                            uint comparisonValue20 = comparisonValue18 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue17 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue17 * 16 + 0).w;
                            uint comparisonValue21 = comparisonValue18 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue17 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue17 * 16 + 0).z;
                            bool productValue101 = rdByteLoad_objectInstances_uint16_t(0u, productValue99 * 2 + 0) < 0u;
                            float intermediateValue142;
                            float intermediateValue143;
                            if (productValue101)
                            {
                                uint bitwiseValue19 = comparisonValue21 >> 15u;
                                precise float bitwiseValue20 = float(bitwiseValue19 & 1u) * 2.0f;
                                precise float sumValue63 = bitwiseValue20 + (-1.0f);
                                precise float bitwiseValue21 = float(comparisonValue21 >> 31u) * 2.0f;
                                precise float sumValue64 = bitwiseValue21 + (-1.0f);
                                precise float bitwiseValue22 = float((comparisonValue21 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue23 = float(bitwiseValue19 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue108 = sumValue63 * 3.0517578125e-05f;
                                precise float productValue109 = sumValue64 * 3.0517578125e-05f;
                                precise float sumValue65 = bitwiseValue22 + productValue108;
                                precise float sumValue66 = bitwiseValue23 + productValue109;
                                intermediateValue142 = sumValue65;
                                intermediateValue143 = sumValue66;
                            }
                            else
                            {
                                precise float bitwiseValue24 = float(comparisonValue21 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue25 = float(comparisonValue21 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue110 = bitwiseValue24 * 16384.0f;
                                precise float sumValue67 = productValue110 + 0.5f;
                                precise float productValue111 = bitwiseValue25 * 16384.0f;
                                precise float sumValue68 = productValue111 + 0.5f;
                                precise float productValue112 = floor(sumValue67) * 6.103515625e-05f;
                                precise float productValue113 = floor(sumValue68) * 6.103515625e-05f;
                                intermediateValue142 = productValue112;
                                intermediateValue143 = productValue113;
                            }
                            precise float productValue127 = sumValue58 * intermediateValue142;
                            precise float productValue128 = sumValue58 * intermediateValue143;
                            precise float sumValue76 = productValue127 + 0.0f;
                            precise float sumValue77 = productValue128 + 0.0f;
                            float intermediateValue180;
                            float intermediateValue181;
                            if (productValue101)
                            {
                                uint bitwiseValue45 = comparisonValue20 >> 15u;
                                precise float bitwiseValue46 = float(bitwiseValue45 & 1u) * 2.0f;
                                precise float sumValue92 = bitwiseValue46 + (-1.0f);
                                precise float bitwiseValue47 = float(comparisonValue20 >> 31u) * 2.0f;
                                precise float sumValue93 = bitwiseValue47 + (-1.0f);
                                precise float bitwiseValue48 = float((comparisonValue20 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue49 = float(bitwiseValue45 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue148 = sumValue92 * 3.0517578125e-05f;
                                precise float productValue149 = sumValue93 * 3.0517578125e-05f;
                                precise float sumValue94 = bitwiseValue48 + productValue148;
                                precise float sumValue95 = bitwiseValue49 + productValue149;
                                intermediateValue180 = sumValue94;
                                intermediateValue181 = sumValue95;
                            }
                            else
                            {
                                precise float bitwiseValue50 = float(comparisonValue20 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue51 = float(comparisonValue20 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue150 = bitwiseValue50 * 16384.0f;
                                precise float sumValue96 = productValue150 + 0.5f;
                                precise float productValue151 = bitwiseValue51 * 16384.0f;
                                precise float sumValue97 = productValue151 + 0.5f;
                                precise float productValue152 = floor(sumValue96) * 6.103515625e-05f;
                                precise float productValue153 = floor(sumValue97) * 6.103515625e-05f;
                                intermediateValue180 = productValue152;
                                intermediateValue181 = productValue153;
                            }
                            precise float productValue178 = intermediateValue100.x * intermediateValue180;
                            precise float productValue179 = intermediateValue100.x * intermediateValue181;
                            precise float sumValue109 = sumValue76 + productValue178;
                            precise float sumValue110 = sumValue77 + productValue179;
                            float intermediateValue206;
                            float intermediateValue207;
                            if (productValue101)
                            {
                                uint bitwiseValue64 = comparisonValue19 >> 15u;
                                precise float bitwiseValue65 = float(bitwiseValue64 & 1u) * 2.0f;
                                precise float sumValue118 = bitwiseValue65 + (-1.0f);
                                precise float bitwiseValue66 = float(comparisonValue19 >> 31u) * 2.0f;
                                precise float sumValue119 = bitwiseValue66 + (-1.0f);
                                precise float bitwiseValue67 = float((comparisonValue19 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue68 = float(bitwiseValue64 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue188 = sumValue118 * 3.0517578125e-05f;
                                precise float productValue189 = sumValue119 * 3.0517578125e-05f;
                                precise float sumValue120 = bitwiseValue67 + productValue188;
                                precise float sumValue121 = bitwiseValue68 + productValue189;
                                intermediateValue206 = sumValue120;
                                intermediateValue207 = sumValue121;
                            }
                            else
                            {
                                precise float bitwiseValue69 = float(comparisonValue19 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue70 = float(comparisonValue19 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue190 = bitwiseValue69 * 16384.0f;
                                precise float sumValue122 = productValue190 + 0.5f;
                                precise float productValue191 = bitwiseValue70 * 16384.0f;
                                precise float sumValue123 = productValue191 + 0.5f;
                                precise float productValue192 = floor(sumValue122) * 6.103515625e-05f;
                                precise float productValue193 = floor(sumValue123) * 6.103515625e-05f;
                                intermediateValue206 = productValue192;
                                intermediateValue207 = productValue193;
                            }
                            precise float productValue218 = intermediateValue101.y * intermediateValue206;
                            precise float productValue219 = intermediateValue101.y * intermediateValue207;
                            precise float sumValue138 = sumValue109 + productValue218;
                            precise float sumValue139 = sumValue110 + productValue219;
                            float intermediateValue215;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue98 * 2 + 0) == 65535u)
                            {
                                intermediateValue215 = 1.0f;
                            }
                            else
                            {
                                uint reinterpretedBits12;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue98 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits12 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits12 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue98 * 2 + 0));
                                }
                                intermediateValue215 = textures[NonUniformResourceIndex(reinterpretedBits12 + 0u)].SampleLevel(defaultSampler, float2(sumValue138, sumValue139), -0.25f).w;
                            }
                            uint comparisonValue41;
                            if (intermediateValue103 == 2u)
                            {
                                comparisonValue41 = 0u;
                            }
                            else
                            {
                                comparisonValue41 = uint(intermediateValue215 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue99 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                            }
                            if (comparisonValue41 == 0u)
                            {
                                intermediateValue55.CommitNonOpaqueTriangleHit();
                            }
                        }
                        intermediateValue105 = intermediateValue55.Proceed();
                        if (intermediateValue105)
                        {
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                uint intermediateValue72 = intermediateValue55.CommittedStatus();
                float intermediateValue79;
                float intermediateValue80;
                float intermediateValue81;
                uint bitwiseValue16;
                if (intermediateValue72 == 1u)
                {
                    float2 intermediateValue74 = intermediateValue55.CommittedTriangleBarycentrics();
                    float2 intermediateValue75 = intermediateValue55.CommittedTriangleBarycentrics();
                    float intermediateValue76 = intermediateValue55.CommittedRayT();
                    uint intermediateValue77 = intermediateValue55.CommittedPrimitiveIndex();
                    uint intermediateValue78 = intermediateValue55.CommittedInstanceIndex();
                    intermediateValue79 = intermediateValue74.x;
                    intermediateValue80 = intermediateValue75.y;
                    intermediateValue81 = intermediateValue76;
                    bitwiseValue16 = ((intermediateValue77 << 14u) & 1073725440u) | (intermediateValue78 & 16383u);
                }
                else
                {
                    intermediateValue79 = 0.0f;
                    intermediateValue80 = 0.0f;
                    intermediateValue81 = 10000.0f;
                    bitwiseValue16 = 1073741823u;
                }
                RayDesc _8ident = {float3(intermediateValue52, intermediateValue53, intermediateValue54), 0.0f, float3(intermediateValue38, intermediateValue40, intermediateValue42), intermediateValue81};
                intermediateValue82.TraceRayInline(SceneBVH, 512u, 16u, _8ident);
                bool intermediateValue83 = intermediateValue82.Proceed();
                float intermediateValue106;
                float intermediateValue108;
                float intermediateValue110;
                if (intermediateValue83)
                {
                    float intermediateValue107;
                    float intermediateValue109;
                    float intermediateValue111;
                    float intermediateValue123 = 1.0f;
                    float intermediateValue124 = 1.0f;
                    float intermediateValue125 = 1.0f;
                    bool comparisonValue26;
                    for (;;)
                    {
                        uint intermediateValue126 = intermediateValue82.CandidateType();
                        comparisonValue26 = intermediateValue126 == 0u;
                        float branchMergedValue1;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (comparisonValue26)
                        {
                            float2 intermediateValue144 = intermediateValue82.CandidateTriangleBarycentrics();
                            float2 intermediateValue145 = intermediateValue82.CandidateTriangleBarycentrics();
                            float intermediateValue146 = intermediateValue82.CandidateTriangleRayT();
                            uint intermediateValue147 = intermediateValue82.CandidatePrimitiveIndex();
                            uint intermediateValue148 = intermediateValue82.CandidateInstanceID();
                            uint intermediateValue149 = intermediateValue82.CandidateInstanceIndex();
                            uint productValue129 = (intermediateValue149 * 76u) + 58u;
                            uint productValue130 = (intermediateValue149 * 76u) + 61u;
                            precise float sumValue78 = 1.0f - intermediateValue144.x;
                            precise float sumValue79 = sumValue78 - intermediateValue145.y;
                            uint bitwiseValue29 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue149 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue147 >> 1u);
                            uint productValue131 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue149 * 76u) + 54u) * 2 + 0)) + 0u;
                            bool comparisonValue30 = (intermediateValue147 & 1u) == 0u;
                            uint comparisonValue31 = comparisonValue30 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue131), bitwiseValue29 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue131), bitwiseValue29 * 16 + 0).x;
                            uint comparisonValue32 = comparisonValue30 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue131), bitwiseValue29 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue131), bitwiseValue29 * 16 + 0).w;
                            uint comparisonValue33 = comparisonValue30 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue131), bitwiseValue29 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue131), bitwiseValue29 * 16 + 0).z;
                            bool productValue132 = rdByteLoad_objectInstances_uint16_t(0u, productValue130 * 2 + 0) < 0u;
                            float intermediateValue182;
                            float intermediateValue183;
                            if (productValue132)
                            {
                                uint bitwiseValue52 = comparisonValue33 >> 15u;
                                precise float bitwiseValue53 = float(bitwiseValue52 & 1u) * 2.0f;
                                precise float sumValue98 = bitwiseValue53 + (-1.0f);
                                precise float bitwiseValue54 = float(comparisonValue33 >> 31u) * 2.0f;
                                precise float sumValue99 = bitwiseValue54 + (-1.0f);
                                precise float bitwiseValue55 = float((comparisonValue33 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue56 = float(bitwiseValue52 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue154 = sumValue98 * 3.0517578125e-05f;
                                precise float productValue155 = sumValue99 * 3.0517578125e-05f;
                                precise float sumValue100 = bitwiseValue55 + productValue154;
                                precise float sumValue101 = bitwiseValue56 + productValue155;
                                intermediateValue182 = sumValue100;
                                intermediateValue183 = sumValue101;
                            }
                            else
                            {
                                precise float bitwiseValue57 = float(comparisonValue33 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue58 = float(comparisonValue33 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue156 = bitwiseValue57 * 16384.0f;
                                precise float sumValue102 = productValue156 + 0.5f;
                                precise float productValue157 = bitwiseValue58 * 16384.0f;
                                precise float sumValue103 = productValue157 + 0.5f;
                                precise float productValue158 = floor(sumValue102) * 6.103515625e-05f;
                                precise float productValue159 = floor(sumValue103) * 6.103515625e-05f;
                                intermediateValue182 = productValue158;
                                intermediateValue183 = productValue159;
                            }
                            precise float productValue180 = sumValue79 * intermediateValue182;
                            precise float productValue181 = sumValue79 * intermediateValue183;
                            precise float sumValue111 = productValue180 + 0.0f;
                            precise float sumValue112 = productValue181 + 0.0f;
                            float intermediateValue208;
                            float intermediateValue209;
                            if (productValue132)
                            {
                                uint bitwiseValue71 = comparisonValue32 >> 15u;
                                precise float bitwiseValue72 = float(bitwiseValue71 & 1u) * 2.0f;
                                precise float sumValue124 = bitwiseValue72 + (-1.0f);
                                precise float bitwiseValue73 = float(comparisonValue32 >> 31u) * 2.0f;
                                precise float sumValue125 = bitwiseValue73 + (-1.0f);
                                precise float bitwiseValue74 = float((comparisonValue32 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue75 = float(bitwiseValue71 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue194 = sumValue124 * 3.0517578125e-05f;
                                precise float productValue195 = sumValue125 * 3.0517578125e-05f;
                                precise float sumValue126 = bitwiseValue74 + productValue194;
                                precise float sumValue127 = bitwiseValue75 + productValue195;
                                intermediateValue208 = sumValue126;
                                intermediateValue209 = sumValue127;
                            }
                            else
                            {
                                precise float bitwiseValue76 = float(comparisonValue32 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue77 = float(comparisonValue32 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue196 = bitwiseValue76 * 16384.0f;
                                precise float sumValue128 = productValue196 + 0.5f;
                                precise float productValue197 = bitwiseValue77 * 16384.0f;
                                precise float sumValue129 = productValue197 + 0.5f;
                                precise float productValue198 = floor(sumValue128) * 6.103515625e-05f;
                                precise float productValue199 = floor(sumValue129) * 6.103515625e-05f;
                                intermediateValue208 = productValue198;
                                intermediateValue209 = productValue199;
                            }
                            precise float productValue220 = intermediateValue144.x * intermediateValue208;
                            precise float productValue221 = intermediateValue144.x * intermediateValue209;
                            precise float sumValue140 = sumValue111 + productValue220;
                            precise float sumValue141 = sumValue112 + productValue221;
                            float intermediateValue219;
                            float intermediateValue220;
                            if (productValue132)
                            {
                                uint bitwiseValue84 = comparisonValue31 >> 15u;
                                precise float bitwiseValue85 = float(bitwiseValue84 & 1u) * 2.0f;
                                precise float sumValue147 = bitwiseValue85 + (-1.0f);
                                precise float bitwiseValue86 = float(comparisonValue31 >> 31u) * 2.0f;
                                precise float sumValue148 = bitwiseValue86 + (-1.0f);
                                precise float bitwiseValue87 = float((comparisonValue31 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue88 = float(bitwiseValue84 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue225 = sumValue147 * 3.0517578125e-05f;
                                precise float productValue226 = sumValue148 * 3.0517578125e-05f;
                                precise float sumValue149 = bitwiseValue87 + productValue225;
                                precise float sumValue150 = bitwiseValue88 + productValue226;
                                intermediateValue219 = sumValue149;
                                intermediateValue220 = sumValue150;
                            }
                            else
                            {
                                precise float bitwiseValue89 = float(comparisonValue31 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue90 = float(comparisonValue31 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue227 = bitwiseValue89 * 16384.0f;
                                precise float sumValue151 = productValue227 + 0.5f;
                                precise float productValue228 = bitwiseValue90 * 16384.0f;
                                precise float sumValue152 = productValue228 + 0.5f;
                                precise float productValue229 = floor(sumValue151) * 6.103515625e-05f;
                                precise float productValue230 = floor(sumValue152) * 6.103515625e-05f;
                                intermediateValue219 = productValue229;
                                intermediateValue220 = productValue230;
                            }
                            precise float productValue239 = intermediateValue145.y * intermediateValue219;
                            precise float productValue240 = intermediateValue145.y * intermediateValue220;
                            precise float sumValue161 = sumValue140 + productValue239;
                            precise float sumValue162 = sumValue141 + productValue240;
                            float intermediateValue223;
                            float intermediateValue224;
                            float intermediateValue225;
                            float intermediateValue226;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue129 * 2 + 0) == 65535u)
                            {
                                intermediateValue223 = 1.0f;
                                intermediateValue224 = 1.0f;
                                intermediateValue225 = 1.0f;
                                intermediateValue226 = 1.0f;
                            }
                            else
                            {
                                uint reinterpretedBits13;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue129 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits13 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits13 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue129 * 2 + 0));
                                }
                                float4 sampledTextureValue3 = textures[NonUniformResourceIndex(reinterpretedBits13 + 0u)].SampleLevel(defaultSampler, float2(sumValue161, sumValue162), min(mad(intermediateValue146, 0.083333335816860198974609375f, -0.25f), 2.0f));
                                intermediateValue223 = sampledTextureValue3.x;
                                intermediateValue224 = sampledTextureValue3.y;
                                intermediateValue225 = sampledTextureValue3.z;
                                intermediateValue226 = sampledTextureValue3.w;
                            }
                            float intermediateValue246;
                            float intermediateValue247;
                            float intermediateValue248;
                            if (intermediateValue148 == 2u)
                            {
                                float branchMergedValue33;
                                float branchMergedValue63;
                                float branchMergedValue64;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue130 * 2 + 0) & 128u) == 0u)
                                {
                                    float intermediateValue262;
                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue130 * 2 + 0) & 2048u) == 0u)
                                    {
                                        intermediateValue262 = intermediateValue226;
                                    }
                                    else
                                    {
                                        intermediateValue262 = clamp(mad(intermediateValue226, 2.0f, -1.0f), 0.0f, 1.0f);
                                    }
                                    branchMergedValue33 = intermediateValue225 - (intermediateValue262 * intermediateValue225);
                                    branchMergedValue63 = intermediateValue224 - (intermediateValue262 * intermediateValue224);
                                    branchMergedValue64 = intermediateValue223 - (intermediateValue262 * intermediateValue223);
                                }
                                else
                                {
                                    branchMergedValue33 = 0.33399999141693115234375f;
                                    branchMergedValue63 = 0.33399999141693115234375f;
                                    branchMergedValue64 = 0.33399999141693115234375f;
                                }
                                intermediateValue246 = branchMergedValue64;
                                intermediateValue247 = branchMergedValue63;
                                intermediateValue248 = branchMergedValue33;
                            }
                            else
                            {
                                float sumValue186 = 1.0f - intermediateValue226;
                                intermediateValue246 = sumValue186;
                                intermediateValue247 = sumValue186;
                                intermediateValue248 = sumValue186;
                            }
                            float productValue284 = intermediateValue246 * intermediateValue123;
                            float productValue285 = intermediateValue247 * intermediateValue124;
                            float productValue286 = intermediateValue248 * intermediateValue125;
                            float intermediateValue150;
                            float intermediateValue151;
                            float intermediateValue152;
                            bool intermediateValue263;
                            if (!(dot(float3(productValue284, productValue285, productValue286), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                            {
                                intermediateValue263 = false;
                                intermediateValue150 = productValue284;
                                intermediateValue151 = productValue285;
                                intermediateValue152 = productValue286;
                            }
                            else
                            {
                                intermediateValue263 = true;
                                intermediateValue150 = 0.0f;
                                intermediateValue151 = 0.0f;
                                intermediateValue152 = 0.0f;
                            }
                            float branchMergedValue78;
                            float branchMergedValue82;
                            float branchMergedValue83;
                            if (intermediateValue263)
                            {
                                intermediateValue82.CommitNonOpaqueTriangleHit();
                                branchMergedValue78 = intermediateValue152;
                                branchMergedValue82 = intermediateValue151;
                                branchMergedValue83 = intermediateValue150;
                            }
                            else
                            {
                                branchMergedValue78 = intermediateValue152;
                                branchMergedValue82 = intermediateValue151;
                                branchMergedValue83 = intermediateValue150;
                            }
                            branchMergedValue1 = branchMergedValue78;
                            branchMergedValue14 = branchMergedValue82;
                            branchMergedValue15 = branchMergedValue83;
                        }
                        else
                        {
                            branchMergedValue1 = intermediateValue125;
                            branchMergedValue14 = intermediateValue124;
                            branchMergedValue15 = intermediateValue123;
                        }
                        intermediateValue111 = branchMergedValue1;
                        intermediateValue109 = branchMergedValue14;
                        intermediateValue107 = branchMergedValue15;
                        bool intermediateValue153 = intermediateValue82.Proceed();
                        if (intermediateValue153)
                        {
                            intermediateValue123 = intermediateValue107;
                            intermediateValue124 = intermediateValue109;
                            intermediateValue125 = intermediateValue111;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue106 = intermediateValue107;
                    intermediateValue108 = intermediateValue109;
                    intermediateValue110 = intermediateValue111;
                }
                else
                {
                    intermediateValue106 = 1.0f;
                    intermediateValue108 = 1.0f;
                    intermediateValue110 = 1.0f;
                }
                uint intermediateValue112 = intermediateValue82.CommittedStatus();
                bool comparisonValue22 = intermediateValue112 == 1u;
                float comparisonValue23 = comparisonValue22 ? 0.0f : intermediateValue106;
                float comparisonValue24 = comparisonValue22 ? 0.0f : intermediateValue108;
                float comparisonValue25 = comparisonValue22 ? 0.0f : intermediateValue110;
                float intermediateValue57;
                float intermediateValue58;
                float intermediateValue59;
                float intermediateValue60;
                float intermediateValue61;
                float intermediateValue62;
                float intermediateValue63;
                float intermediateValue64;
                float intermediateValue65;
                float intermediateValue66;
                float intermediateValue67;
                float intermediateValue68;
                float productValue182;
                float productValue183;
                float productValue184;
                if (intermediateValue81 < 10000.0f)
                {
                    uint bitwiseValue26 = bitwiseValue16 & 16383u;
                    uint productValue114 = bitwiseValue26 * 38u;
                    float4 reinterpretedBits7 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue114 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue114 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue114 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue114 + 3u) * 4 + 0)));
                    uint productValue115 = (bitwiseValue26 * 38u) + 4u;
                    float4 reinterpretedBits8 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue115 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue115 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue115 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue115 + 3u) * 4 + 0)));
                    uint productValue116 = (bitwiseValue26 * 38u) + 8u;
                    float4 reinterpretedBits9 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue116 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue116 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue116 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue116 + 3u) * 4 + 0)));
                    uint productValue117 = (bitwiseValue26 * 76u) + 58u;
                    uint productValue118 = (bitwiseValue26 * 76u) + 59u;
                    uint productValue119 = (bitwiseValue26 * 76u) + 61u;
                    uint productValue120 = (bitwiseValue26 * 38u) + 32u;
                    float intermediateValue127 = reinterpretedBits7.x;
                    float intermediateValue128 = reinterpretedBits7.y;
                    float intermediateValue129 = reinterpretedBits7.z;
                    float intermediateValue130 = reinterpretedBits8.x;
                    float intermediateValue131 = reinterpretedBits8.y;
                    float intermediateValue132 = reinterpretedBits8.z;
                    float intermediateValue133 = reinterpretedBits9.x;
                    float intermediateValue134 = reinterpretedBits9.y;
                    float intermediateValue135 = reinterpretedBits9.z;
                    uint bitwiseValue27 = (bitwiseValue16 >> 15u) & 32767u;
                    uint productValue121 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue26 * 76u) + 54u) * 2 + 0));
                    uint sumValue69 = productValue121 + 0u;
                    float intermediateValue157;
                    float intermediateValue159;
                    float intermediateValue161;
                    float intermediateValue163;
                    float intermediateValue164;
                    float intermediateValue165;
                    float intermediateValue166;
                    float intermediateValue167;
                    float intermediateValue168;
                    float intermediateValue169;
                    float intermediateValue170;
                    float intermediateValue171;
                    float comparisonValue34;
                    float comparisonValue35;
                    float comparisonValue36;
                    if ((intermediateValue81 > 1.0f) && (asuint(viewCbConstants[86u]).y != 0u))
                    {
                        uint bitwiseValue30 = (rdByteLoad_objectInstances_uint(0u, ((bitwiseValue26 * 38u) + 25u) * 4 + 0) >> 2u) + bitwiseValue27;
                        uint productValue133 = bitwiseValue30 * 4u;
                        float multiplyAddValue6 = mad(float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue69), productValue133 * 4 + 0) & 1023u), 0.00195503421127796173095703125f, -1.0f);
                        float multiplyAddValue7 = mad(float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue69), productValue133 * 4 + 0) >> 10u) & 1023u), 0.00195503421127796173095703125f, -1.0f);
                        float multiplyAddValue8 = mad(float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue69), productValue133 * 4 + 0) >> 20u) & 1023u), 0.00195503421127796173095703125f, -1.0f);
                        float multiplyAddValue9 = mad(multiplyAddValue8, intermediateValue129, mad(multiplyAddValue7, intermediateValue128, multiplyAddValue6 * intermediateValue127));
                        float multiplyAddValue10 = mad(multiplyAddValue8, intermediateValue132, mad(multiplyAddValue7, intermediateValue131, multiplyAddValue6 * intermediateValue130));
                        float multiplyAddValue11 = mad(multiplyAddValue8, intermediateValue135, mad(multiplyAddValue7, intermediateValue134, multiplyAddValue6 * intermediateValue133));
                        float inverseLengthValue2 = rsqrt(dot(float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
                        bool dotProductValue10 = dot(float3(intermediateValue38, intermediateValue40, intermediateValue42), float3(inverseLengthValue2 * multiplyAddValue9, inverseLengthValue2 * multiplyAddValue10, inverseLengthValue2 * multiplyAddValue11)) < 0.0f;
                        uint sumValue80 = productValue121 + 0u;
                        uint productValue134 = bitwiseValue30 * 8u;
                        half3 productValue135 = (half3)f16tof32(uint16_t3(rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue80), productValue134 * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue80), (productValue134 + 1u) * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue80), (productValue134 + 2u) * 2 + 0)));
                        uint productValue136 = (bitwiseValue30 * 8u) + 4u;
                        half3 productValue137 = (half3)f16tof32(uint16_t3(rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue80), productValue136 * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue80), (productValue136 + 1u) * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue80), (productValue136 + 2u) * 2 + 0)));
                        intermediateValue157 = intermediateValue12;
                        intermediateValue159 = intermediateValue15;
                        intermediateValue161 = intermediateValue17;
                        intermediateValue163 = intermediateValue19;
                        intermediateValue164 = intermediateValue21;
                        intermediateValue165 = intermediateValue23;
                        intermediateValue166 = intermediateValue25;
                        intermediateValue167 = intermediateValue27;
                        intermediateValue168 = intermediateValue29;
                        intermediateValue169 = intermediateValue31;
                        intermediateValue170 = intermediateValue33;
                        intermediateValue171 = intermediateValue35;
                        comparisonValue34 = float(dotProductValue10 ? productValue135.x : productValue137.x);
                        comparisonValue35 = float(dotProductValue10 ? productValue135.y : productValue137.y);
                        comparisonValue36 = float(dotProductValue10 ? productValue135.z : productValue137.z);
                    }
                    else
                    {
                        uint productValue138 = (bitwiseValue26 * 38u) + 24u;
                        uint productValue139 = (bitwiseValue26 * 38u) + 25u;
                        uint productValue140 = (bitwiseValue26 * 76u) + 72u;
                        uint bitwiseValue31 = ((bitwiseValue16 >> 13u) & 2u) | ((bitwiseValue16 >> 13u) & 131068u);
                        uint bitwiseValue32 = bitwiseValue31 | 1u;
                        uint bitwiseValue33 = bitwiseValue31 ^ 2u;
                        intermediateValue1[0u] = bitwiseValue31;
                        intermediateValue1[1u] = bitwiseValue32;
                        intermediateValue1[2u] = bitwiseValue33;
                        uint bitwiseValue34 = ((rdByteLoad_objectInstances_uint(0u, productValue139 * 4 + 0) >> 2u) + bitwiseValue27) * 4u;
                        precise float bitwiseValue35 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue69), bitwiseValue34 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
                        precise float sumValue81 = bitwiseValue35 + (-1.0f);
                        precise float bitwiseValue36 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue69), bitwiseValue34 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
                        precise float sumValue82 = bitwiseValue36 + (-1.0f);
                        precise float bitwiseValue37 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue69), bitwiseValue34 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
                        precise float sumValue83 = bitwiseValue37 + (-1.0f);
                        precise float sumValue84 = 1.0f - intermediateValue79;
                        precise float sumValue85 = sumValue84 - intermediateValue80;
                        intermediateValue2[0u] = sumValue85;
                        intermediateValue2[1u] = intermediateValue79;
                        intermediateValue2[2u] = intermediateValue80;
                        uint sumValue86 = productValue121 + 0u;
                        uint productValue141 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue26 * 76u) + 56u) * 2 + 0));
                        uint productValue142 = productValue141 * (rdByteLoad_objectInstances_uint(0u, productValue138 * 4 + 0) + bitwiseValue31);
                        uint bitwiseValue38 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue26 * 76u) + 71u) * 2 + 0) & 255u);
                        uint bitwiseValue39 = (bitwiseValue38 + productValue142) >> 1u;
                        half3 productValue143 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue86), bitwiseValue39 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue86), (bitwiseValue39 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue86), (bitwiseValue39 + 2u) * 2 + 0)));
                        uint bitwiseValue40 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue140 * 2 + 0) & 255u);
                        uint bitwiseValue41 = (bitwiseValue40 + productValue142) >> 2u;
                        uint bitwiseValue42 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue140 * 2 + 0) >> 8u);
                        uint bitwiseValue43 = (bitwiseValue42 + productValue142) >> 2u;
                        bool productValue144 = rdByteLoad_objectInstances_uint16_t(0u, productValue119 * 2 + 0) < 0u;
                        float bitwiseValue61;
                        float bitwiseValue62;
                        if (productValue144)
                        {
                            uint bitwiseValue59 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue43 * 4 + 0) >> 15u;
                            bitwiseValue61 = ((float(bitwiseValue59 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue43 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                            bitwiseValue62 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue43 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue59 & 65534u) * 1.525902189314365386962890625e-05f);
                        }
                        else
                        {
                            bitwiseValue61 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue43 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                            bitwiseValue62 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue43 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        }
                        uint intermediateValue191;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue119 * 2 + 0) & 256u) == 0u)
                        {
                            intermediateValue191 = 0u;
                        }
                        else
                        {
                            intermediateValue191 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), ((uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue26 * 76u) + 74u) * 2 + 0) >> 8u) + productValue142) >> 2u) * 4 + 0) & 65535u;
                        }
                        precise float productValue200 = sumValue85 * float(productValue143.x);
                        precise float productValue201 = sumValue85 * float(productValue143.y);
                        precise float productValue202 = sumValue85 * float(productValue143.z);
                        precise float sumValue130 = productValue200 + 0.0f;
                        precise float sumValue131 = productValue201 + 0.0f;
                        precise float sumValue132 = productValue202 + 0.0f;
                        uint productValue203 = productValue141 * (rdByteLoad_objectInstances_uint(0u, productValue138 * 4 + 0) + bitwiseValue32);
                        uint bitwiseValue78 = (bitwiseValue38 + productValue203) >> 1u;
                        half3 productValue204 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue86), bitwiseValue78 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue86), (bitwiseValue78 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue86), (bitwiseValue78 + 2u) * 2 + 0)));
                        uint bitwiseValue79 = (bitwiseValue40 + productValue203) >> 2u;
                        uint bitwiseValue80 = (bitwiseValue42 + productValue203) >> 2u;
                        float bitwiseValue91;
                        float bitwiseValue92;
                        if (productValue144)
                        {
                            uint bitwiseValue82 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue80 * 4 + 0) >> 15u;
                            bitwiseValue91 = ((float(bitwiseValue82 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue80 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                            bitwiseValue92 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue80 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue82 & 65534u) * 1.525902189314365386962890625e-05f);
                        }
                        else
                        {
                            bitwiseValue91 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue80 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                            bitwiseValue92 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue80 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        }
                        precise float productValue231 = intermediateValue79 * float(productValue204.x);
                        precise float productValue232 = intermediateValue79 * float(productValue204.y);
                        precise float productValue233 = intermediateValue79 * float(productValue204.z);
                        precise float sumValue153 = sumValue130 + productValue231;
                        precise float sumValue154 = sumValue131 + productValue232;
                        precise float sumValue155 = sumValue132 + productValue233;
                        uint productValue234 = productValue141 * (rdByteLoad_objectInstances_uint(0u, productValue138 * 4 + 0) + bitwiseValue33);
                        uint bitwiseValue93 = (bitwiseValue38 + productValue234) >> 1u;
                        half3 productValue235 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue86), bitwiseValue93 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue86), (bitwiseValue93 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue86), (bitwiseValue93 + 2u) * 2 + 0)));
                        uint bitwiseValue94 = (bitwiseValue40 + productValue234) >> 2u;
                        uint bitwiseValue95 = (bitwiseValue42 + productValue234) >> 2u;
                        float bitwiseValue98;
                        float bitwiseValue99;
                        if (productValue144)
                        {
                            uint bitwiseValue97 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue95 * 4 + 0) >> 15u;
                            bitwiseValue98 = ((float(bitwiseValue97 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue95 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                            bitwiseValue99 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue95 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue97 & 65534u) * 1.525902189314365386962890625e-05f);
                        }
                        else
                        {
                            bitwiseValue98 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue95 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                            bitwiseValue99 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue95 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        }
                        precise float productValue241 = intermediateValue80 * float(productValue235.x);
                        precise float productValue242 = intermediateValue80 * float(productValue235.y);
                        precise float productValue243 = intermediateValue80 * float(productValue235.z);
                        precise float sumValue165 = sumValue153 + productValue241;
                        precise float sumValue166 = sumValue154 + productValue242;
                        precise float sumValue167 = sumValue155 + productValue243;
                        float productValue244 = ((bitwiseValue91 * intermediateValue79) + (bitwiseValue61 * sumValue85)) + (bitwiseValue98 * intermediateValue80);
                        float productValue245 = ((bitwiseValue92 * intermediateValue79) + (bitwiseValue62 * sumValue85)) + (bitwiseValue99 * intermediateValue80);
                        float bitwiseValue100 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue94 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f) * intermediateValue80) + (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue79 * 4 + 0) & 255u) * intermediateValue79) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue41 * 4 + 0) & 255u) * sumValue85)) * 0.0039215688593685626983642578125f);
                        float bitwiseValue101 = ((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue94 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f) * intermediateValue80) + (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue79 * 4 + 0) >> 8u) & 255u) * intermediateValue79) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue41 * 4 + 0) >> 8u) & 255u) * sumValue85)) * 0.0039215688593685626983642578125f);
                        float bitwiseValue102 = ((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue94 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f) * intermediateValue80) + (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue79 * 4 + 0) >> 16u) & 255u) * intermediateValue79) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue41 * 4 + 0) >> 16u) & 255u) * sumValue85)) * 0.0039215688593685626983642578125f);
                        float bitwiseValue103 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue94 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f) * intermediateValue80) + (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue79 * 4 + 0) >> 24u) * intermediateValue79) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue86), bitwiseValue41 * 4 + 0) >> 24u) * sumValue85)) * 0.0039215688593685626983642578125f);
                        precise float productValue246 = intermediateValue127 * sumValue165;
                        precise float productValue247 = sumValue166 * intermediateValue128;
                        precise float sumValue168 = productValue247 + productValue246;
                        precise float productValue248 = sumValue167 * intermediateValue129;
                        precise float sumValue169 = productValue248 + sumValue168;
                        precise float productValue249 = 1.0f * reinterpretedBits7.w;
                        precise float sumValue170 = productValue249 + sumValue169;
                        precise float productValue250 = intermediateValue130 * sumValue165;
                        precise float productValue251 = sumValue166 * intermediateValue131;
                        precise float sumValue171 = productValue251 + productValue250;
                        precise float productValue252 = sumValue167 * intermediateValue132;
                        precise float sumValue172 = productValue252 + sumValue171;
                        precise float productValue253 = 1.0f * reinterpretedBits8.w;
                        precise float sumValue173 = productValue253 + sumValue172;
                        precise float productValue254 = intermediateValue133 * sumValue165;
                        precise float productValue255 = sumValue166 * intermediateValue134;
                        precise float sumValue174 = productValue255 + productValue254;
                        precise float productValue256 = sumValue167 * intermediateValue135;
                        precise float sumValue175 = productValue256 + sumValue174;
                        precise float productValue257 = 1.0f * reinterpretedBits9.w;
                        precise float sumValue176 = productValue257 + sumValue175;
                        precise float productValue258 = intermediateValue127 * sumValue81;
                        precise float productValue259 = sumValue82 * intermediateValue128;
                        precise float sumValue177 = productValue259 + productValue258;
                        precise float productValue260 = sumValue83 * intermediateValue129;
                        precise float sumValue178 = productValue260 + sumValue177;
                        precise float productValue261 = intermediateValue130 * sumValue81;
                        precise float productValue262 = sumValue82 * intermediateValue131;
                        precise float sumValue179 = productValue262 + productValue261;
                        precise float productValue263 = sumValue83 * intermediateValue132;
                        precise float sumValue180 = productValue263 + sumValue179;
                        precise float productValue264 = intermediateValue133 * sumValue81;
                        precise float productValue265 = sumValue82 * intermediateValue134;
                        precise float sumValue181 = productValue265 + productValue264;
                        precise float productValue266 = sumValue83 * intermediateValue135;
                        precise float sumValue182 = productValue266 + sumValue181;
                        float inverseLengthValue3 = rsqrt(dot(float3(sumValue178, sumValue180, sumValue182), float3(sumValue178, sumValue180, sumValue182)));
                        precise float productValue267 = sumValue178 * inverseLengthValue3;
                        precise float productValue268 = sumValue180 * inverseLengthValue3;
                        precise float productValue269 = sumValue182 * inverseLengthValue3;
                        bool dotProductValue18 = dot(float3(intermediateValue38, intermediateValue40, intermediateValue42), float3(productValue267, productValue268, productValue269)) > 0.0f;
                        precise float sumValue183 = (-0.0f) - productValue267;
                        precise float sumValue184 = (-0.0f) - productValue268;
                        precise float sumValue185 = (-0.0f) - productValue269;
                        float comparisonValue43 = dotProductValue18 ? sumValue183 : productValue267;
                        float comparisonValue44 = dotProductValue18 ? sumValue184 : productValue268;
                        float comparisonValue45 = dotProductValue18 ? sumValue185 : productValue269;
                        float intermediateValue237;
                        float intermediateValue238;
                        float intermediateValue239;
                        if (((rdByteLoad_objectInstances_uint16_t(0u, productValue119 * 2 + 0) & 1u) != 0u) && (asuint(viewCbConstants[86u]).y != 0u))
                        {
                            uint sumValue187 = productValue121 + 0u;
                            float sumValue188;
                            float sumValue189;
                            float sumValue190;
                            uint sumValue194;
                            float intermediateValue249 = sumValue85;
                            uint intermediateValue250 = bitwiseValue31;
                            float intermediateValue251 = 0.0f;
                            float intermediateValue252 = 0.0f;
                            float intermediateValue253 = 0.0f;
                            uint intermediateValue254 = 0u;
                            half3 productValue289;
                            half3 productValue291;
                            for (;;)
                            {
                                uint productValue287 = intermediateValue250 + rdByteLoad_objectInstances_uint(0u, productValue139 * 4 + 0);
                                uint productValue288 = productValue287 * 8u;
                                productValue289 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue187), productValue288 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue187), (productValue288 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue187), (productValue288 + 2u) * 2 + 0)));
                                uint productValue290 = (productValue287 * 8u) + 4u;
                                productValue291 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue187), productValue290 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue187), (productValue290 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue187), (productValue290 + 2u) * 2 + 0)));
                                half intermediateValue268;
                                half intermediateValue269;
                                half intermediateValue270;
                                if (dotProductValue18)
                                {
                                    intermediateValue268 = productValue291.x;
                                    intermediateValue269 = productValue291.y;
                                    intermediateValue270 = productValue291.z;
                                }
                                else
                                {
                                    intermediateValue268 = productValue289.x;
                                    intermediateValue269 = productValue289.y;
                                    intermediateValue270 = productValue289.z;
                                }
                                precise float productValue293 = float(intermediateValue270) * intermediateValue249;
                                precise float productValue294 = float(intermediateValue269) * intermediateValue249;
                                precise float productValue295 = float(intermediateValue268) * intermediateValue249;
                                sumValue188 = productValue295 + intermediateValue251;
                                sumValue189 = productValue294 + intermediateValue252;
                                sumValue190 = productValue293 + intermediateValue253;
                                sumValue194 = intermediateValue254 + 1u;
                                if (sumValue194 == 3u)
                                {
                                    break;
                                }
                                intermediateValue249 = intermediateValue2[sumValue194];
                                intermediateValue250 = intermediateValue1[sumValue194];
                                intermediateValue251 = sumValue188;
                                intermediateValue252 = sumValue189;
                                intermediateValue253 = sumValue190;
                                intermediateValue254 = sumValue194;
                                continue;
                            }
                            intermediateValue237 = sumValue188;
                            intermediateValue238 = sumValue189;
                            intermediateValue239 = sumValue190;
                        }
                        else
                        {
                            intermediateValue237 = 0.0f;
                            intermediateValue238 = 0.0f;
                            intermediateValue239 = 0.0f;
                        }
                        precise float productValue271 = comparisonValue43 * 256.0f;
                        uint intermediateValue240 = uint(int(productValue271));
                        precise float productValue272 = comparisonValue44 * 256.0f;
                        uint intermediateValue241 = uint(int(productValue272));
                        precise float productValue273 = comparisonValue45 * 256.0f;
                        uint intermediateValue242 = uint(int(productValue273));
                        precise float productValue274 = comparisonValue43 * 1.52587890625e-05f;
                        precise float sumValue191 = sumValue170 + productValue274;
                        float reinterpretedBits14 = (abs(sumValue170) < 0.03125f) ? sumValue191 : asfloat(((sumValue170 < 0.0f) ? (-intermediateValue240) : intermediateValue240) + asuint(sumValue170));
                        precise float productValue275 = comparisonValue44 * 1.52587890625e-05f;
                        precise float sumValue192 = sumValue173 + productValue275;
                        float reinterpretedBits15 = (abs(sumValue173) < 0.03125f) ? sumValue192 : asfloat(((sumValue173 < 0.0f) ? (-intermediateValue241) : intermediateValue241) + asuint(sumValue173));
                        precise float productValue276 = comparisonValue45 * 1.52587890625e-05f;
                        precise float sumValue193 = sumValue176 + productValue276;
                        float reinterpretedBits16 = (abs(sumValue176) < 0.03125f) ? sumValue193 : asfloat(((sumValue176 < 0.0f) ? (-intermediateValue242) : intermediateValue242) + asuint(sumValue176));
                        float intermediateValue255;
                        float intermediateValue256;
                        float intermediateValue257;
                        if (dot(float3(viewCbConstants[52u].xyz), float3(comparisonValue43, comparisonValue44, comparisonValue45)) < 0.0f)
                        {
                            intermediateValue255 = 0.0f;
                            intermediateValue256 = 0.0f;
                            intermediateValue257 = 0.0f;
                        }
                        else
                        {
                            RayDesc _9ident = {float3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16), 0.0f, float3(viewCbConstants[53u].xyz), 10000.0f};
                            intermediateValue258.TraceRayInline(SceneBVH, 512u, 32u, _9ident);
                            bool intermediateValue259 = intermediateValue258.Proceed();
                            if (intermediateValue259)
                            {
                                bool intermediateValue289;
                                bool comparisonValue54;
                                for (;;)
                                {
                                    uint intermediateValue275 = intermediateValue258.CandidateType();
                                    comparisonValue54 = intermediateValue275 == 0u;
                                    if (comparisonValue54)
                                    {
                                        float2 intermediateValue284 = intermediateValue258.CandidateTriangleBarycentrics();
                                        float2 intermediateValue285 = intermediateValue258.CandidateTriangleBarycentrics();
                                        uint intermediateValue286 = intermediateValue258.CandidatePrimitiveIndex();
                                        uint intermediateValue287 = intermediateValue258.CandidateInstanceID();
                                        uint intermediateValue288 = intermediateValue258.CandidateInstanceIndex();
                                        uint productValue301 = (intermediateValue288 * 76u) + 58u;
                                        uint productValue302 = (intermediateValue288 * 76u) + 61u;
                                        precise float sumValue201 = 1.0f - intermediateValue284.x;
                                        precise float sumValue202 = sumValue201 - intermediateValue285.y;
                                        uint bitwiseValue108 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue288 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue286 >> 1u);
                                        uint productValue303 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue288 * 76u) + 54u) * 2 + 0)) + 0u;
                                        bool comparisonValue59 = (intermediateValue286 & 1u) == 0u;
                                        uint comparisonValue60 = comparisonValue59 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue303), bitwiseValue108 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue303), bitwiseValue108 * 16 + 0).x;
                                        uint comparisonValue61 = comparisonValue59 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue303), bitwiseValue108 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue303), bitwiseValue108 * 16 + 0).w;
                                        uint comparisonValue62 = comparisonValue59 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue303), bitwiseValue108 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue303), bitwiseValue108 * 16 + 0).z;
                                        bool productValue304 = rdByteLoad_objectInstances_uint16_t(0u, productValue302 * 2 + 0) < 0u;
                                        float intermediateValue320;
                                        float intermediateValue321;
                                        if (productValue304)
                                        {
                                            uint bitwiseValue116 = comparisonValue62 >> 15u;
                                            precise float bitwiseValue117 = float(bitwiseValue116 & 1u) * 2.0f;
                                            precise float sumValue231 = bitwiseValue117 + (-1.0f);
                                            precise float bitwiseValue118 = float(comparisonValue62 >> 31u) * 2.0f;
                                            precise float sumValue232 = bitwiseValue118 + (-1.0f);
                                            precise float bitwiseValue119 = float((comparisonValue62 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue120 = float(bitwiseValue116 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue334 = sumValue231 * 3.0517578125e-05f;
                                            precise float productValue335 = sumValue232 * 3.0517578125e-05f;
                                            precise float sumValue233 = bitwiseValue119 + productValue334;
                                            precise float sumValue234 = bitwiseValue120 + productValue335;
                                            intermediateValue320 = sumValue233;
                                            intermediateValue321 = sumValue234;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue121 = float(comparisonValue62 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue122 = float(comparisonValue62 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue336 = bitwiseValue121 * 16384.0f;
                                            precise float sumValue235 = productValue336 + 0.5f;
                                            precise float productValue337 = bitwiseValue122 * 16384.0f;
                                            precise float sumValue236 = productValue337 + 0.5f;
                                            precise float productValue338 = floor(sumValue235) * 6.103515625e-05f;
                                            precise float productValue339 = floor(sumValue236) * 6.103515625e-05f;
                                            intermediateValue320 = productValue338;
                                            intermediateValue321 = productValue339;
                                        }
                                        precise float productValue342 = sumValue202 * intermediateValue320;
                                        precise float productValue343 = sumValue202 * intermediateValue321;
                                        precise float sumValue239 = productValue342 + 0.0f;
                                        precise float sumValue240 = productValue343 + 0.0f;
                                        float intermediateValue362;
                                        float intermediateValue363;
                                        if (productValue304)
                                        {
                                            uint bitwiseValue133 = comparisonValue61 >> 15u;
                                            precise float bitwiseValue134 = float(bitwiseValue133 & 1u) * 2.0f;
                                            precise float sumValue247 = bitwiseValue134 + (-1.0f);
                                            precise float bitwiseValue135 = float(comparisonValue61 >> 31u) * 2.0f;
                                            precise float sumValue248 = bitwiseValue135 + (-1.0f);
                                            precise float bitwiseValue136 = float((comparisonValue61 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue137 = float(bitwiseValue133 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue350 = sumValue247 * 3.0517578125e-05f;
                                            precise float productValue351 = sumValue248 * 3.0517578125e-05f;
                                            precise float sumValue249 = bitwiseValue136 + productValue350;
                                            precise float sumValue250 = bitwiseValue137 + productValue351;
                                            intermediateValue362 = sumValue249;
                                            intermediateValue363 = sumValue250;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue138 = float(comparisonValue61 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue139 = float(comparisonValue61 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue352 = bitwiseValue138 * 16384.0f;
                                            precise float sumValue251 = productValue352 + 0.5f;
                                            precise float productValue353 = bitwiseValue139 * 16384.0f;
                                            precise float sumValue252 = productValue353 + 0.5f;
                                            precise float productValue354 = floor(sumValue251) * 6.103515625e-05f;
                                            precise float productValue355 = floor(sumValue252) * 6.103515625e-05f;
                                            intermediateValue362 = productValue354;
                                            intermediateValue363 = productValue355;
                                        }
                                        precise float productValue366 = intermediateValue284.x * intermediateValue362;
                                        precise float productValue367 = intermediateValue284.x * intermediateValue363;
                                        precise float sumValue259 = sumValue239 + productValue366;
                                        precise float sumValue260 = sumValue240 + productValue367;
                                        float intermediateValue384;
                                        float intermediateValue385;
                                        if (productValue304)
                                        {
                                            uint bitwiseValue163 = comparisonValue60 >> 15u;
                                            precise float bitwiseValue164 = float(bitwiseValue163 & 1u) * 2.0f;
                                            precise float sumValue279 = bitwiseValue164 + (-1.0f);
                                            precise float bitwiseValue165 = float(comparisonValue60 >> 31u) * 2.0f;
                                            precise float sumValue280 = bitwiseValue165 + (-1.0f);
                                            precise float bitwiseValue166 = float((comparisonValue60 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue167 = float(bitwiseValue163 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue387 = sumValue279 * 3.0517578125e-05f;
                                            precise float productValue388 = sumValue280 * 3.0517578125e-05f;
                                            precise float sumValue281 = bitwiseValue166 + productValue387;
                                            precise float sumValue282 = bitwiseValue167 + productValue388;
                                            intermediateValue384 = sumValue281;
                                            intermediateValue385 = sumValue282;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue168 = float(comparisonValue60 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue169 = float(comparisonValue60 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue389 = bitwiseValue168 * 16384.0f;
                                            precise float sumValue283 = productValue389 + 0.5f;
                                            precise float productValue390 = bitwiseValue169 * 16384.0f;
                                            precise float sumValue284 = productValue390 + 0.5f;
                                            precise float productValue391 = floor(sumValue283) * 6.103515625e-05f;
                                            precise float productValue392 = floor(sumValue284) * 6.103515625e-05f;
                                            intermediateValue384 = productValue391;
                                            intermediateValue385 = productValue392;
                                        }
                                        precise float productValue403 = intermediateValue285.y * intermediateValue384;
                                        precise float productValue404 = intermediateValue285.y * intermediateValue385;
                                        precise float sumValue293 = sumValue259 + productValue403;
                                        precise float sumValue294 = sumValue260 + productValue404;
                                        float intermediateValue387;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue301 * 2 + 0) == 65535u)
                                        {
                                            intermediateValue387 = 1.0f;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits24;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue301 * 2 + 0) > 4095u)
                                            {
                                                reinterpretedBits24 = asuint(viewCbConstants[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits24 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue301 * 2 + 0));
                                            }
                                            intermediateValue387 = textures[NonUniformResourceIndex(reinterpretedBits24 + 0u)].SampleLevel(defaultSampler, float2(sumValue293, sumValue294), -0.25f).w;
                                        }
                                        uint comparisonValue83;
                                        if (intermediateValue287 == 2u)
                                        {
                                            comparisonValue83 = 0u;
                                        }
                                        else
                                        {
                                            comparisonValue83 = uint(intermediateValue387 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue302 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                                        }
                                        if (comparisonValue83 == 0u)
                                        {
                                            intermediateValue258.CommitNonOpaqueTriangleHit();
                                        }
                                    }
                                    intermediateValue289 = intermediateValue258.Proceed();
                                    if (intermediateValue289)
                                    {
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }
                            uint intermediateValue264 = intermediateValue258.CommittedStatus();
                            float intermediateValue277;
                            if (intermediateValue264 == 1u)
                            {
                                float intermediateValue276 = intermediateValue258.CommittedRayT();
                                intermediateValue277 = intermediateValue276;
                            }
                            else
                            {
                                intermediateValue277 = 10000.0f;
                            }
                            float branchMergedValue34;
                            float branchMergedValue65;
                            float branchMergedValue66;
                            if (intermediateValue277 < 10000.0f)
                            {
                                precise float productValue305 = intermediateValue277 * viewCbConstants[63u].x;
                                precise float productValue306 = intermediateValue277 * viewCbConstants[63u].y;
                                precise float productValue307 = intermediateValue277 * viewCbConstants[63u].z;
                                precise float productValue308 = productValue305 * (-1.44269502162933349609375f);
                                precise float productValue309 = productValue306 * (-1.44269502162933349609375f);
                                precise float productValue310 = productValue307 * (-1.44269502162933349609375f);
                                precise float productValue311 = viewCbConstants[53u].x * intermediateValue277;
                                precise float sumValue203 = productValue311 + reinterpretedBits14;
                                precise float productValue312 = viewCbConstants[53u].z * intermediateValue277;
                                precise float sumValue204 = productValue312 + reinterpretedBits16;
                                precise float productValue313 = sumValue203 * viewCbConstants[83u].z;
                                precise float sumValue205 = productValue313 + viewCbConstants[84u].x;
                                precise float productValue314 = sumValue204 * viewCbConstants[83u].w;
                                precise float sumValue206 = productValue314 + viewCbConstants[84u].y;
                                float4 sampledTextureValue5 = wibblyTexture.SampleLevel(linearWrapSampler, float2(sumValue205, sumValue206), 0.0f);
                                precise float sumValue207 = sampledTextureValue5.x + (-0.5f);
                                precise float sumValue208 = sampledTextureValue5.y + (-0.5f);
                                precise float productValue315 = sumValue203 * viewCbConstants[82u].z;
                                precise float sumValue209 = productValue315 + viewCbConstants[83u].x;
                                precise float productValue316 = sumValue204 * viewCbConstants[82u].w;
                                precise float sumValue210 = productValue316 + viewCbConstants[83u].y;
                                precise float productValue317 = sumValue207 * 0.4000000059604644775390625f;
                                precise float productValue318 = sumValue208 * 0.4000000059604644775390625f;
                                precise float sumValue211 = sumValue209 + productValue317;
                                precise float sumValue212 = productValue318 + sumValue210;
                                precise float productValue319 = viewCbConstants[68u].w * 63.0f;
                                uint intermediateValue290 = uint(int(floor(productValue319)));
                                precise float productValue320 = float(int(intermediateValue290 + 1u)) * 0.015625f;
                                precise float sumValue213 = (-0.0f) - productValue320;
                                float intermediateValue291 = frac(abs(productValue320));
                                precise float sumValue214 = (-0.0f) - intermediateValue291;
                                precise float comparisonValue63 = ((productValue320 >= sumValue213) ? intermediateValue291 : sumValue214) * 64.0f;
                                float4 sampledTextureValue6 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue211, sumValue212, float(int(intermediateValue290))), 0.0f);
                                float intermediateValue292 = sampledTextureValue6.x;
                                precise float sampledTextureValue7 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue211, sumValue212, float(int(uint(int(comparisonValue63))))), 0.0f).x - intermediateValue292;
                                precise float productValue321 = frac(productValue319) * sampledTextureValue7;
                                precise float sumValue215 = intermediateValue292 + productValue321;
                                precise float productValue322 = sumValue215 * 7.0f;
                                precise float sumValue216 = productValue322 + 0.800000011920928955078125f;
                                precise float productValue323 = intermediateValue277 * (-0.100000001490116119384765625f);
                                precise float sumValue217 = sumValue216 + (-1.0f);
                                precise float exponentialValue = exp2(productValue323) * sumValue217;
                                precise float sumValue218 = exponentialValue + 1.0f;
                                precise float exponentialValue1 = exp2(productValue308) * sumValue218;
                                precise float exponentialValue2 = exp2(productValue309) * sumValue218;
                                precise float exponentialValue3 = exp2(productValue310) * sumValue218;
                                RayDesc _10ident = {float3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16), 0.0f, float3(viewCbConstants[53u].xyz), intermediateValue277};
                                intermediateValue293.TraceRayInline(SceneBVH, 512u, 22u, _10ident);
                                bool intermediateValue294 = intermediateValue293.Proceed();
                                float intermediateValue301;
                                float intermediateValue303;
                                float intermediateValue305;
                                if (intermediateValue294)
                                {
                                    float intermediateValue302;
                                    float intermediateValue304;
                                    float intermediateValue306;
                                    float intermediateValue322 = exponentialValue1;
                                    float intermediateValue323 = exponentialValue2;
                                    float intermediateValue324 = exponentialValue3;
                                    bool comparisonValue66;
                                    for (;;)
                                    {
                                        uint intermediateValue325 = intermediateValue293.CandidateType();
                                        comparisonValue66 = intermediateValue325 == 0u;
                                        float branchMergedValue2;
                                        float branchMergedValue21;
                                        float branchMergedValue22;
                                        if (comparisonValue66)
                                        {
                                            float2 intermediateValue333 = intermediateValue293.CandidateTriangleBarycentrics();
                                            float2 intermediateValue334 = intermediateValue293.CandidateTriangleBarycentrics();
                                            float intermediateValue335 = intermediateValue293.CandidateTriangleRayT();
                                            uint intermediateValue336 = intermediateValue293.CandidatePrimitiveIndex();
                                            uint intermediateValue337 = intermediateValue293.CandidateInstanceID();
                                            uint intermediateValue338 = intermediateValue293.CandidateInstanceIndex();
                                            uint productValue356 = (intermediateValue338 * 76u) + 58u;
                                            uint productValue357 = (intermediateValue338 * 76u) + 61u;
                                            precise float sumValue253 = 1.0f - intermediateValue333.x;
                                            precise float sumValue254 = sumValue253 - intermediateValue334.y;
                                            uint bitwiseValue140 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue338 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue336 >> 1u);
                                            uint productValue358 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue338 * 76u) + 54u) * 2 + 0)) + 0u;
                                            bool comparisonValue68 = (intermediateValue336 & 1u) == 0u;
                                            uint comparisonValue69 = comparisonValue68 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue358), bitwiseValue140 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue358), bitwiseValue140 * 16 + 0).x;
                                            uint comparisonValue70 = comparisonValue68 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue358), bitwiseValue140 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue358), bitwiseValue140 * 16 + 0).w;
                                            uint comparisonValue71 = comparisonValue68 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue358), bitwiseValue140 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue358), bitwiseValue140 * 16 + 0).z;
                                            bool productValue359 = rdByteLoad_objectInstances_uint16_t(0u, productValue357 * 2 + 0) < 0u;
                                            float intermediateValue368;
                                            float intermediateValue369;
                                            if (productValue359)
                                            {
                                                uint bitwiseValue142 = comparisonValue71 >> 15u;
                                                precise float bitwiseValue143 = float(bitwiseValue142 & 1u) * 2.0f;
                                                precise float sumValue261 = bitwiseValue143 + (-1.0f);
                                                precise float bitwiseValue144 = float(comparisonValue71 >> 31u) * 2.0f;
                                                precise float sumValue262 = bitwiseValue144 + (-1.0f);
                                                precise float bitwiseValue145 = float((comparisonValue71 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue146 = float(bitwiseValue142 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue368 = sumValue261 * 3.0517578125e-05f;
                                                precise float productValue369 = sumValue262 * 3.0517578125e-05f;
                                                precise float sumValue263 = bitwiseValue145 + productValue368;
                                                precise float sumValue264 = bitwiseValue146 + productValue369;
                                                intermediateValue368 = sumValue263;
                                                intermediateValue369 = sumValue264;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue147 = float(comparisonValue71 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue148 = float(comparisonValue71 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue370 = bitwiseValue147 * 16384.0f;
                                                precise float sumValue265 = productValue370 + 0.5f;
                                                precise float productValue371 = bitwiseValue148 * 16384.0f;
                                                precise float sumValue266 = productValue371 + 0.5f;
                                                precise float productValue372 = floor(sumValue265) * 6.103515625e-05f;
                                                precise float productValue373 = floor(sumValue266) * 6.103515625e-05f;
                                                intermediateValue368 = productValue372;
                                                intermediateValue369 = productValue373;
                                            }
                                            precise float productValue393 = sumValue254 * intermediateValue368;
                                            precise float productValue394 = sumValue254 * intermediateValue369;
                                            precise float sumValue285 = productValue393 + 0.0f;
                                            precise float sumValue286 = productValue394 + 0.0f;
                                            float intermediateValue388;
                                            float intermediateValue389;
                                            if (productValue359)
                                            {
                                                uint bitwiseValue171 = comparisonValue70 >> 15u;
                                                precise float bitwiseValue172 = float(bitwiseValue171 & 1u) * 2.0f;
                                                precise float sumValue295 = bitwiseValue172 + (-1.0f);
                                                precise float bitwiseValue173 = float(comparisonValue70 >> 31u) * 2.0f;
                                                precise float sumValue296 = bitwiseValue173 + (-1.0f);
                                                precise float bitwiseValue174 = float((comparisonValue70 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue175 = float(bitwiseValue171 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue405 = sumValue295 * 3.0517578125e-05f;
                                                precise float productValue406 = sumValue296 * 3.0517578125e-05f;
                                                precise float sumValue297 = bitwiseValue174 + productValue405;
                                                precise float sumValue298 = bitwiseValue175 + productValue406;
                                                intermediateValue388 = sumValue297;
                                                intermediateValue389 = sumValue298;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue176 = float(comparisonValue70 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue177 = float(comparisonValue70 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue407 = bitwiseValue176 * 16384.0f;
                                                precise float sumValue299 = productValue407 + 0.5f;
                                                precise float productValue408 = bitwiseValue177 * 16384.0f;
                                                precise float sumValue300 = productValue408 + 0.5f;
                                                precise float productValue409 = floor(sumValue299) * 6.103515625e-05f;
                                                precise float productValue410 = floor(sumValue300) * 6.103515625e-05f;
                                                intermediateValue388 = productValue409;
                                                intermediateValue389 = productValue410;
                                            }
                                            precise float productValue424 = intermediateValue333.x * intermediateValue388;
                                            precise float productValue425 = intermediateValue333.x * intermediateValue389;
                                            precise float sumValue313 = sumValue285 + productValue424;
                                            precise float sumValue314 = sumValue286 + productValue425;
                                            float intermediateValue394;
                                            float intermediateValue395;
                                            if (productValue359)
                                            {
                                                uint bitwiseValue192 = comparisonValue69 >> 15u;
                                                precise float bitwiseValue193 = float(bitwiseValue192 & 1u) * 2.0f;
                                                precise float sumValue319 = bitwiseValue193 + (-1.0f);
                                                precise float bitwiseValue194 = float(comparisonValue69 >> 31u) * 2.0f;
                                                precise float sumValue320 = bitwiseValue194 + (-1.0f);
                                                precise float bitwiseValue195 = float((comparisonValue69 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue196 = float(bitwiseValue192 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue430 = sumValue319 * 3.0517578125e-05f;
                                                precise float productValue431 = sumValue320 * 3.0517578125e-05f;
                                                precise float sumValue321 = bitwiseValue195 + productValue430;
                                                precise float sumValue322 = bitwiseValue196 + productValue431;
                                                intermediateValue394 = sumValue321;
                                                intermediateValue395 = sumValue322;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue197 = float(comparisonValue69 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue198 = float(comparisonValue69 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue432 = bitwiseValue197 * 16384.0f;
                                                precise float sumValue323 = productValue432 + 0.5f;
                                                precise float productValue433 = bitwiseValue198 * 16384.0f;
                                                precise float sumValue324 = productValue433 + 0.5f;
                                                precise float productValue434 = floor(sumValue323) * 6.103515625e-05f;
                                                precise float productValue435 = floor(sumValue324) * 6.103515625e-05f;
                                                intermediateValue394 = productValue434;
                                                intermediateValue395 = productValue435;
                                            }
                                            precise float productValue449 = intermediateValue334.y * intermediateValue394;
                                            precise float productValue450 = intermediateValue334.y * intermediateValue395;
                                            precise float sumValue337 = sumValue313 + productValue449;
                                            precise float sumValue338 = sumValue314 + productValue450;
                                            precise float productValue451 = intermediateValue335 * 0.083333335816860198974609375f;
                                            precise float sumValue339 = productValue451 + (-0.25f);
                                            float intermediateValue401;
                                            float intermediateValue402;
                                            float intermediateValue403;
                                            float intermediateValue404;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue356 * 2 + 0) == 65535u)
                                            {
                                                intermediateValue401 = 1.0f;
                                                intermediateValue402 = 1.0f;
                                                intermediateValue403 = 1.0f;
                                                intermediateValue404 = 1.0f;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits27;
                                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue356 * 2 + 0) > 4095u)
                                                {
                                                    reinterpretedBits27 = asuint(viewCbConstants[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits27 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue356 * 2 + 0));
                                                }
                                                float4 sampledTextureValue10 = textures[NonUniformResourceIndex(reinterpretedBits27 + 0u)].SampleLevel(defaultSampler, float2(sumValue337, sumValue338), min(sumValue339, 2.0f));
                                                intermediateValue401 = sampledTextureValue10.x;
                                                intermediateValue402 = sampledTextureValue10.y;
                                                intermediateValue403 = sampledTextureValue10.z;
                                                intermediateValue404 = sampledTextureValue10.w;
                                            }
                                            float intermediateValue411;
                                            float intermediateValue412;
                                            float intermediateValue413;
                                            if (intermediateValue337 == 2u)
                                            {
                                                float branchMergedValue41;
                                                float branchMergedValue67;
                                                float branchMergedValue68;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue357 * 2 + 0) & 128u) == 0u)
                                                {
                                                    float intermediateValue421;
                                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue357 * 2 + 0) & 2048u) == 0u)
                                                    {
                                                        intermediateValue421 = intermediateValue404;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue479 = intermediateValue404 * 2.0f;
                                                        precise float sumValue366 = productValue479 + (-1.0f);
                                                        intermediateValue421 = clamp(sumValue366, 0.0f, 1.0f);
                                                    }
                                                    precise float sumValue363 = 0.0f - intermediateValue401;
                                                    precise float sumValue364 = 0.0f - intermediateValue402;
                                                    precise float sumValue365 = 0.0f - intermediateValue403;
                                                    precise float productValue476 = sumValue363 * intermediateValue421;
                                                    precise float productValue477 = sumValue364 * intermediateValue421;
                                                    precise float productValue478 = sumValue365 * intermediateValue421;
                                                    precise float sumValue357 = intermediateValue401 + productValue476;
                                                    precise float sumValue358 = intermediateValue402 + productValue477;
                                                    precise float sumValue359 = intermediateValue403 + productValue478;
                                                    branchMergedValue41 = sumValue359;
                                                    branchMergedValue67 = sumValue358;
                                                    branchMergedValue68 = sumValue357;
                                                }
                                                else
                                                {
                                                    branchMergedValue41 = 0.33399999141693115234375f;
                                                    branchMergedValue67 = 0.33399999141693115234375f;
                                                    branchMergedValue68 = 0.33399999141693115234375f;
                                                }
                                                intermediateValue411 = branchMergedValue68;
                                                intermediateValue412 = branchMergedValue67;
                                                intermediateValue413 = branchMergedValue41;
                                            }
                                            else
                                            {
                                                precise float sumValue352 = 1.0f - intermediateValue404;
                                                intermediateValue411 = sumValue352;
                                                intermediateValue412 = sumValue352;
                                                intermediateValue413 = sumValue352;
                                            }
                                            precise float productValue470 = intermediateValue322 * intermediateValue411;
                                            precise float productValue471 = intermediateValue323 * intermediateValue412;
                                            precise float productValue472 = intermediateValue324 * intermediateValue413;
                                            float intermediateValue339;
                                            float intermediateValue340;
                                            float intermediateValue341;
                                            bool intermediateValue422;
                                            if (!(dot(float3(productValue470, productValue471, productValue472), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                            {
                                                intermediateValue422 = false;
                                                intermediateValue339 = productValue470;
                                                intermediateValue340 = productValue471;
                                                intermediateValue341 = productValue472;
                                            }
                                            else
                                            {
                                                intermediateValue422 = true;
                                                intermediateValue339 = 0.0f;
                                                intermediateValue340 = 0.0f;
                                                intermediateValue341 = 0.0f;
                                            }
                                            float branchMergedValue79;
                                            float branchMergedValue84;
                                            float branchMergedValue85;
                                            if (intermediateValue422)
                                            {
                                                intermediateValue293.CommitNonOpaqueTriangleHit();
                                                branchMergedValue79 = intermediateValue339;
                                                branchMergedValue84 = intermediateValue340;
                                                branchMergedValue85 = intermediateValue341;
                                            }
                                            else
                                            {
                                                branchMergedValue79 = intermediateValue339;
                                                branchMergedValue84 = intermediateValue340;
                                                branchMergedValue85 = intermediateValue341;
                                            }
                                            branchMergedValue2 = branchMergedValue79;
                                            branchMergedValue21 = branchMergedValue84;
                                            branchMergedValue22 = branchMergedValue85;
                                        }
                                        else
                                        {
                                            branchMergedValue2 = intermediateValue322;
                                            branchMergedValue21 = intermediateValue323;
                                            branchMergedValue22 = intermediateValue324;
                                        }
                                        intermediateValue302 = branchMergedValue2;
                                        intermediateValue304 = branchMergedValue21;
                                        intermediateValue306 = branchMergedValue22;
                                        bool intermediateValue342 = intermediateValue293.Proceed();
                                        if (intermediateValue342)
                                        {
                                            intermediateValue322 = intermediateValue302;
                                            intermediateValue323 = intermediateValue304;
                                            intermediateValue324 = intermediateValue306;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue301 = intermediateValue302;
                                    intermediateValue303 = intermediateValue304;
                                    intermediateValue305 = intermediateValue306;
                                }
                                else
                                {
                                    intermediateValue301 = exponentialValue1;
                                    intermediateValue303 = exponentialValue2;
                                    intermediateValue305 = exponentialValue3;
                                }
                                uint intermediateValue307 = intermediateValue293.CommittedStatus();
                                bool comparisonValue64 = intermediateValue307 == 1u;
                                float comparisonValue50 = comparisonValue64 ? 0.0f : intermediateValue301;
                                float comparisonValue51 = comparisonValue64 ? 0.0f : intermediateValue303;
                                float comparisonValue52 = comparisonValue64 ? 0.0f : intermediateValue305;
                                float branchMergedValue95;
                                float branchMergedValue102;
                                float branchMergedValue103;
                                if (dot(float3(comparisonValue50, comparisonValue51, comparisonValue52), 1.0f.xxx) > 0.00999999977648258209228515625f)
                                {
                                    RayDesc _11ident = {float3(sumValue203, mad(viewCbConstants[53u].y, intermediateValue277, reinterpretedBits15), sumValue204), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                                    intermediateValue326.TraceRayInline(SceneBVH, 512u, 22u, _11ident);
                                    bool intermediateValue327 = intermediateValue326.Proceed();
                                    float intermediateValue343;
                                    float intermediateValue345;
                                    float intermediateValue347;
                                    if (intermediateValue327)
                                    {
                                        float intermediateValue344;
                                        float intermediateValue346;
                                        float intermediateValue348;
                                        float intermediateValue364 = comparisonValue50;
                                        float intermediateValue365 = comparisonValue51;
                                        float intermediateValue366 = comparisonValue52;
                                        bool comparisonValue77;
                                        for (;;)
                                        {
                                            uint intermediateValue367 = intermediateValue326.CandidateType();
                                            comparisonValue77 = intermediateValue367 == 0u;
                                            float branchMergedValue4;
                                            float branchMergedValue25;
                                            float branchMergedValue26;
                                            if (comparisonValue77)
                                            {
                                                float2 intermediateValue370 = intermediateValue326.CandidateTriangleBarycentrics();
                                                float2 intermediateValue371 = intermediateValue326.CandidateTriangleBarycentrics();
                                                float intermediateValue372 = intermediateValue326.CandidateTriangleRayT();
                                                uint intermediateValue373 = intermediateValue326.CandidatePrimitiveIndex();
                                                uint intermediateValue374 = intermediateValue326.CandidateInstanceID();
                                                uint intermediateValue375 = intermediateValue326.CandidateInstanceIndex();
                                                uint productValue395 = (intermediateValue375 * 76u) + 58u;
                                                uint productValue396 = (intermediateValue375 * 76u) + 61u;
                                                precise float sumValue287 = 1.0f - intermediateValue370.x;
                                                precise float sumValue288 = sumValue287 - intermediateValue371.y;
                                                uint bitwiseValue170 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue375 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue373 >> 1u);
                                                uint productValue397 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue375 * 76u) + 54u) * 2 + 0)) + 0u;
                                                bool comparisonValue78 = (intermediateValue373 & 1u) == 0u;
                                                uint comparisonValue79 = comparisonValue78 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue397), bitwiseValue170 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue397), bitwiseValue170 * 16 + 0).x;
                                                uint comparisonValue80 = comparisonValue78 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue397), bitwiseValue170 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue397), bitwiseValue170 * 16 + 0).w;
                                                uint comparisonValue81 = comparisonValue78 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue397), bitwiseValue170 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue397), bitwiseValue170 * 16 + 0).z;
                                                bool productValue398 = rdByteLoad_objectInstances_uint16_t(0u, productValue396 * 2 + 0) < 0u;
                                                float intermediateValue390;
                                                float intermediateValue391;
                                                if (productValue398)
                                                {
                                                    uint bitwiseValue178 = comparisonValue81 >> 15u;
                                                    precise float bitwiseValue179 = float(bitwiseValue178 & 1u) * 2.0f;
                                                    precise float sumValue301 = bitwiseValue179 + (-1.0f);
                                                    precise float bitwiseValue180 = float(comparisonValue81 >> 31u) * 2.0f;
                                                    precise float sumValue302 = bitwiseValue180 + (-1.0f);
                                                    precise float bitwiseValue181 = float((comparisonValue81 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue182 = float(bitwiseValue178 & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue411 = sumValue301 * 3.0517578125e-05f;
                                                    precise float productValue412 = sumValue302 * 3.0517578125e-05f;
                                                    precise float sumValue303 = bitwiseValue181 + productValue411;
                                                    precise float sumValue304 = bitwiseValue182 + productValue412;
                                                    intermediateValue390 = sumValue303;
                                                    intermediateValue391 = sumValue304;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue183 = float(comparisonValue81 & 65535u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue184 = float(comparisonValue81 >> 16u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue413 = bitwiseValue183 * 16384.0f;
                                                    precise float sumValue305 = productValue413 + 0.5f;
                                                    precise float productValue414 = bitwiseValue184 * 16384.0f;
                                                    precise float sumValue306 = productValue414 + 0.5f;
                                                    precise float productValue415 = floor(sumValue305) * 6.103515625e-05f;
                                                    precise float productValue416 = floor(sumValue306) * 6.103515625e-05f;
                                                    intermediateValue390 = productValue415;
                                                    intermediateValue391 = productValue416;
                                                }
                                                precise float productValue426 = sumValue288 * intermediateValue390;
                                                precise float productValue427 = sumValue288 * intermediateValue391;
                                                precise float sumValue315 = productValue426 + 0.0f;
                                                precise float sumValue316 = productValue427 + 0.0f;
                                                float intermediateValue396;
                                                float intermediateValue397;
                                                if (productValue398)
                                                {
                                                    uint bitwiseValue199 = comparisonValue80 >> 15u;
                                                    precise float bitwiseValue200 = float(bitwiseValue199 & 1u) * 2.0f;
                                                    precise float sumValue325 = bitwiseValue200 + (-1.0f);
                                                    precise float bitwiseValue201 = float(comparisonValue80 >> 31u) * 2.0f;
                                                    precise float sumValue326 = bitwiseValue201 + (-1.0f);
                                                    precise float bitwiseValue202 = float((comparisonValue80 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue203 = float(bitwiseValue199 & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue436 = sumValue325 * 3.0517578125e-05f;
                                                    precise float productValue437 = sumValue326 * 3.0517578125e-05f;
                                                    precise float sumValue327 = bitwiseValue202 + productValue436;
                                                    precise float sumValue328 = bitwiseValue203 + productValue437;
                                                    intermediateValue396 = sumValue327;
                                                    intermediateValue397 = sumValue328;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue204 = float(comparisonValue80 & 65535u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue205 = float(comparisonValue80 >> 16u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue438 = bitwiseValue204 * 16384.0f;
                                                    precise float sumValue329 = productValue438 + 0.5f;
                                                    precise float productValue439 = bitwiseValue205 * 16384.0f;
                                                    precise float sumValue330 = productValue439 + 0.5f;
                                                    precise float productValue440 = floor(sumValue329) * 6.103515625e-05f;
                                                    precise float productValue441 = floor(sumValue330) * 6.103515625e-05f;
                                                    intermediateValue396 = productValue440;
                                                    intermediateValue397 = productValue441;
                                                }
                                                precise float productValue452 = intermediateValue370.x * intermediateValue396;
                                                precise float productValue453 = intermediateValue370.x * intermediateValue397;
                                                precise float sumValue340 = sumValue315 + productValue452;
                                                precise float sumValue341 = sumValue316 + productValue453;
                                                float intermediateValue409;
                                                float intermediateValue410;
                                                if (productValue398)
                                                {
                                                    uint bitwiseValue213 = comparisonValue79 >> 15u;
                                                    precise float bitwiseValue214 = float(bitwiseValue213 & 1u) * 2.0f;
                                                    precise float sumValue346 = bitwiseValue214 + (-1.0f);
                                                    precise float bitwiseValue215 = float(comparisonValue79 >> 31u) * 2.0f;
                                                    precise float sumValue347 = bitwiseValue215 + (-1.0f);
                                                    precise float bitwiseValue216 = float((comparisonValue79 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue217 = float(bitwiseValue213 & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue461 = sumValue346 * 3.0517578125e-05f;
                                                    precise float productValue462 = sumValue347 * 3.0517578125e-05f;
                                                    precise float sumValue348 = bitwiseValue216 + productValue461;
                                                    precise float sumValue349 = bitwiseValue217 + productValue462;
                                                    intermediateValue409 = sumValue348;
                                                    intermediateValue410 = sumValue349;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue218 = float(comparisonValue79 & 65535u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue219 = float(comparisonValue79 >> 16u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue463 = bitwiseValue218 * 16384.0f;
                                                    precise float sumValue350 = productValue463 + 0.5f;
                                                    precise float productValue464 = bitwiseValue219 * 16384.0f;
                                                    precise float sumValue351 = productValue464 + 0.5f;
                                                    precise float productValue465 = floor(sumValue350) * 6.103515625e-05f;
                                                    precise float productValue466 = floor(sumValue351) * 6.103515625e-05f;
                                                    intermediateValue409 = productValue465;
                                                    intermediateValue410 = productValue466;
                                                }
                                                precise float productValue467 = intermediateValue371.y * intermediateValue409;
                                                precise float productValue468 = intermediateValue371.y * intermediateValue410;
                                                precise float sumValue353 = sumValue340 + productValue467;
                                                precise float sumValue354 = sumValue341 + productValue468;
                                                precise float productValue469 = intermediateValue372 * 0.083333335816860198974609375f;
                                                precise float sumValue355 = productValue469 + (-0.25f);
                                                float intermediateValue414;
                                                float intermediateValue415;
                                                float intermediateValue416;
                                                float intermediateValue417;
                                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue395 * 2 + 0) == 65535u)
                                                {
                                                    intermediateValue414 = 1.0f;
                                                    intermediateValue415 = 1.0f;
                                                    intermediateValue416 = 1.0f;
                                                    intermediateValue417 = 1.0f;
                                                }
                                                else
                                                {
                                                    uint reinterpretedBits29;
                                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue395 * 2 + 0) > 4095u)
                                                    {
                                                        reinterpretedBits29 = asuint(viewCbConstants[98u]).w;
                                                    }
                                                    else
                                                    {
                                                        reinterpretedBits29 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue395 * 2 + 0));
                                                    }
                                                    float4 sampledTextureValue12 = textures[NonUniformResourceIndex(reinterpretedBits29 + 0u)].SampleLevel(defaultSampler, float2(sumValue353, sumValue354), min(sumValue355, 2.0f));
                                                    intermediateValue414 = sampledTextureValue12.x;
                                                    intermediateValue415 = sampledTextureValue12.y;
                                                    intermediateValue416 = sampledTextureValue12.z;
                                                    intermediateValue417 = sampledTextureValue12.w;
                                                }
                                                float intermediateValue425;
                                                float intermediateValue426;
                                                float intermediateValue427;
                                                if (intermediateValue374 == 2u)
                                                {
                                                    float branchMergedValue43;
                                                    float branchMergedValue71;
                                                    float branchMergedValue72;
                                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue396 * 2 + 0) & 128u) == 0u)
                                                    {
                                                        float intermediateValue428;
                                                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue396 * 2 + 0) & 2048u) == 0u)
                                                        {
                                                            intermediateValue428 = intermediateValue417;
                                                        }
                                                        else
                                                        {
                                                            precise float productValue490 = intermediateValue417 * 2.0f;
                                                            precise float sumValue378 = productValue490 + (-1.0f);
                                                            intermediateValue428 = clamp(sumValue378, 0.0f, 1.0f);
                                                        }
                                                        precise float sumValue375 = 0.0f - intermediateValue414;
                                                        precise float sumValue376 = 0.0f - intermediateValue415;
                                                        precise float sumValue377 = 0.0f - intermediateValue416;
                                                        precise float productValue487 = sumValue375 * intermediateValue428;
                                                        precise float productValue488 = sumValue376 * intermediateValue428;
                                                        precise float productValue489 = sumValue377 * intermediateValue428;
                                                        precise float sumValue372 = intermediateValue414 + productValue487;
                                                        precise float sumValue373 = intermediateValue415 + productValue488;
                                                        precise float sumValue374 = intermediateValue416 + productValue489;
                                                        branchMergedValue43 = sumValue372;
                                                        branchMergedValue71 = sumValue373;
                                                        branchMergedValue72 = sumValue374;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue43 = 0.33399999141693115234375f;
                                                        branchMergedValue71 = 0.33399999141693115234375f;
                                                        branchMergedValue72 = 0.33399999141693115234375f;
                                                    }
                                                    intermediateValue425 = branchMergedValue43;
                                                    intermediateValue426 = branchMergedValue71;
                                                    intermediateValue427 = branchMergedValue72;
                                                }
                                                else
                                                {
                                                    precise float sumValue367 = 1.0f - intermediateValue417;
                                                    intermediateValue425 = sumValue367;
                                                    intermediateValue426 = sumValue367;
                                                    intermediateValue427 = sumValue367;
                                                }
                                                precise float productValue484 = intermediateValue364 * intermediateValue425;
                                                precise float productValue485 = intermediateValue365 * intermediateValue426;
                                                precise float productValue486 = intermediateValue366 * intermediateValue427;
                                                float intermediateValue376;
                                                float intermediateValue377;
                                                float intermediateValue378;
                                                bool intermediateValue429;
                                                if (!(dot(float3(productValue484, productValue485, productValue486), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                                {
                                                    intermediateValue429 = false;
                                                    intermediateValue376 = productValue484;
                                                    intermediateValue377 = productValue485;
                                                    intermediateValue378 = productValue486;
                                                }
                                                else
                                                {
                                                    intermediateValue429 = true;
                                                    intermediateValue376 = 0.0f;
                                                    intermediateValue377 = 0.0f;
                                                    intermediateValue378 = 0.0f;
                                                }
                                                float branchMergedValue81;
                                                float branchMergedValue88;
                                                float branchMergedValue89;
                                                if (intermediateValue429)
                                                {
                                                    intermediateValue326.CommitNonOpaqueTriangleHit();
                                                    branchMergedValue81 = intermediateValue378;
                                                    branchMergedValue88 = intermediateValue377;
                                                    branchMergedValue89 = intermediateValue376;
                                                }
                                                else
                                                {
                                                    branchMergedValue81 = intermediateValue378;
                                                    branchMergedValue88 = intermediateValue377;
                                                    branchMergedValue89 = intermediateValue376;
                                                }
                                                branchMergedValue4 = branchMergedValue81;
                                                branchMergedValue25 = branchMergedValue88;
                                                branchMergedValue26 = branchMergedValue89;
                                            }
                                            else
                                            {
                                                branchMergedValue4 = intermediateValue366;
                                                branchMergedValue25 = intermediateValue365;
                                                branchMergedValue26 = intermediateValue364;
                                            }
                                            intermediateValue348 = branchMergedValue4;
                                            intermediateValue346 = branchMergedValue25;
                                            intermediateValue344 = branchMergedValue26;
                                            bool intermediateValue379 = intermediateValue326.Proceed();
                                            if (intermediateValue379)
                                            {
                                                intermediateValue364 = intermediateValue344;
                                                intermediateValue365 = intermediateValue346;
                                                intermediateValue366 = intermediateValue348;
                                                continue;
                                            }
                                            else
                                            {
                                                break;
                                            }
                                        }
                                        intermediateValue343 = intermediateValue344;
                                        intermediateValue345 = intermediateValue346;
                                        intermediateValue347 = intermediateValue348;
                                    }
                                    else
                                    {
                                        intermediateValue343 = comparisonValue50;
                                        intermediateValue345 = comparisonValue51;
                                        intermediateValue347 = comparisonValue52;
                                    }
                                    uint intermediateValue349 = intermediateValue326.CommittedStatus();
                                    bool comparisonValue72 = intermediateValue349 == 1u;
                                    branchMergedValue95 = comparisonValue72 ? 0.0f : intermediateValue347;
                                    branchMergedValue102 = comparisonValue72 ? 0.0f : intermediateValue345;
                                    branchMergedValue103 = comparisonValue72 ? 0.0f : intermediateValue343;
                                }
                                else
                                {
                                    branchMergedValue95 = comparisonValue52;
                                    branchMergedValue102 = comparisonValue51;
                                    branchMergedValue103 = comparisonValue50;
                                }
                                branchMergedValue34 = branchMergedValue95;
                                branchMergedValue65 = branchMergedValue102;
                                branchMergedValue66 = branchMergedValue103;
                            }
                            else
                            {
                                RayDesc _12ident = {float3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                                intermediateValue295.TraceRayInline(SceneBVH, 512u, 22u, _12ident);
                                bool intermediateValue296 = intermediateValue295.Proceed();
                                float intermediateValue308;
                                float intermediateValue310;
                                float intermediateValue312;
                                if (intermediateValue296)
                                {
                                    float intermediateValue309;
                                    float intermediateValue311;
                                    float intermediateValue313;
                                    float intermediateValue328 = 1.0f;
                                    float intermediateValue329 = 1.0f;
                                    float intermediateValue330 = 1.0f;
                                    bool comparisonValue67;
                                    for (;;)
                                    {
                                        uint intermediateValue331 = intermediateValue295.CandidateType();
                                        comparisonValue67 = intermediateValue331 == 0u;
                                        float branchMergedValue3;
                                        float branchMergedValue23;
                                        float branchMergedValue24;
                                        if (comparisonValue67)
                                        {
                                            float2 intermediateValue350 = intermediateValue295.CandidateTriangleBarycentrics();
                                            float2 intermediateValue351 = intermediateValue295.CandidateTriangleBarycentrics();
                                            float intermediateValue352 = intermediateValue295.CandidateTriangleRayT();
                                            uint intermediateValue353 = intermediateValue295.CandidatePrimitiveIndex();
                                            uint intermediateValue354 = intermediateValue295.CandidateInstanceID();
                                            uint intermediateValue355 = intermediateValue295.CandidateInstanceIndex();
                                            uint productValue360 = (intermediateValue355 * 76u) + 58u;
                                            uint productValue361 = (intermediateValue355 * 76u) + 61u;
                                            precise float sumValue255 = 1.0f - intermediateValue350.x;
                                            precise float sumValue256 = sumValue255 - intermediateValue351.y;
                                            uint bitwiseValue141 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue355 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue353 >> 1u);
                                            uint productValue362 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue355 * 76u) + 54u) * 2 + 0)) + 0u;
                                            bool comparisonValue73 = (intermediateValue353 & 1u) == 0u;
                                            uint comparisonValue74 = comparisonValue73 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue362), bitwiseValue141 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue362), bitwiseValue141 * 16 + 0).x;
                                            uint comparisonValue75 = comparisonValue73 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue362), bitwiseValue141 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue362), bitwiseValue141 * 16 + 0).w;
                                            uint comparisonValue76 = comparisonValue73 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue362), bitwiseValue141 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue362), bitwiseValue141 * 16 + 0).z;
                                            bool productValue363 = rdByteLoad_objectInstances_uint16_t(0u, productValue361 * 2 + 0) < 0u;
                                            float intermediateValue380;
                                            float intermediateValue381;
                                            if (productValue363)
                                            {
                                                uint bitwiseValue149 = comparisonValue76 >> 15u;
                                                precise float bitwiseValue150 = float(bitwiseValue149 & 1u) * 2.0f;
                                                precise float sumValue267 = bitwiseValue150 + (-1.0f);
                                                precise float bitwiseValue151 = float(comparisonValue76 >> 31u) * 2.0f;
                                                precise float sumValue268 = bitwiseValue151 + (-1.0f);
                                                precise float bitwiseValue152 = float((comparisonValue76 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue153 = float(bitwiseValue149 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue374 = sumValue267 * 3.0517578125e-05f;
                                                precise float productValue375 = sumValue268 * 3.0517578125e-05f;
                                                precise float sumValue269 = bitwiseValue152 + productValue374;
                                                precise float sumValue270 = bitwiseValue153 + productValue375;
                                                intermediateValue380 = sumValue269;
                                                intermediateValue381 = sumValue270;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue154 = float(comparisonValue76 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue155 = float(comparisonValue76 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue376 = bitwiseValue154 * 16384.0f;
                                                precise float sumValue271 = productValue376 + 0.5f;
                                                precise float productValue377 = bitwiseValue155 * 16384.0f;
                                                precise float sumValue272 = productValue377 + 0.5f;
                                                precise float productValue378 = floor(sumValue271) * 6.103515625e-05f;
                                                precise float productValue379 = floor(sumValue272) * 6.103515625e-05f;
                                                intermediateValue380 = productValue378;
                                                intermediateValue381 = productValue379;
                                            }
                                            precise float productValue399 = sumValue256 * intermediateValue380;
                                            precise float productValue400 = sumValue256 * intermediateValue381;
                                            precise float sumValue289 = productValue399 + 0.0f;
                                            precise float sumValue290 = productValue400 + 0.0f;
                                            float intermediateValue392;
                                            float intermediateValue393;
                                            if (productValue363)
                                            {
                                                uint bitwiseValue185 = comparisonValue75 >> 15u;
                                                precise float bitwiseValue186 = float(bitwiseValue185 & 1u) * 2.0f;
                                                precise float sumValue307 = bitwiseValue186 + (-1.0f);
                                                precise float bitwiseValue187 = float(comparisonValue75 >> 31u) * 2.0f;
                                                precise float sumValue308 = bitwiseValue187 + (-1.0f);
                                                precise float bitwiseValue188 = float((comparisonValue75 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue189 = float(bitwiseValue185 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue417 = sumValue307 * 3.0517578125e-05f;
                                                precise float productValue418 = sumValue308 * 3.0517578125e-05f;
                                                precise float sumValue309 = bitwiseValue188 + productValue417;
                                                precise float sumValue310 = bitwiseValue189 + productValue418;
                                                intermediateValue392 = sumValue309;
                                                intermediateValue393 = sumValue310;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue190 = float(comparisonValue75 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue191 = float(comparisonValue75 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue419 = bitwiseValue190 * 16384.0f;
                                                precise float sumValue311 = productValue419 + 0.5f;
                                                precise float productValue420 = bitwiseValue191 * 16384.0f;
                                                precise float sumValue312 = productValue420 + 0.5f;
                                                precise float productValue421 = floor(sumValue311) * 6.103515625e-05f;
                                                precise float productValue422 = floor(sumValue312) * 6.103515625e-05f;
                                                intermediateValue392 = productValue421;
                                                intermediateValue393 = productValue422;
                                            }
                                            precise float productValue428 = intermediateValue350.x * intermediateValue392;
                                            precise float productValue429 = intermediateValue350.x * intermediateValue393;
                                            precise float sumValue317 = sumValue289 + productValue428;
                                            precise float sumValue318 = sumValue290 + productValue429;
                                            float intermediateValue398;
                                            float intermediateValue399;
                                            if (productValue363)
                                            {
                                                uint bitwiseValue206 = comparisonValue74 >> 15u;
                                                precise float bitwiseValue207 = float(bitwiseValue206 & 1u) * 2.0f;
                                                precise float sumValue331 = bitwiseValue207 + (-1.0f);
                                                precise float bitwiseValue208 = float(comparisonValue74 >> 31u) * 2.0f;
                                                precise float sumValue332 = bitwiseValue208 + (-1.0f);
                                                precise float bitwiseValue209 = float((comparisonValue74 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue210 = float(bitwiseValue206 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue442 = sumValue331 * 3.0517578125e-05f;
                                                precise float productValue443 = sumValue332 * 3.0517578125e-05f;
                                                precise float sumValue333 = bitwiseValue209 + productValue442;
                                                precise float sumValue334 = bitwiseValue210 + productValue443;
                                                intermediateValue398 = sumValue333;
                                                intermediateValue399 = sumValue334;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue211 = float(comparisonValue74 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue212 = float(comparisonValue74 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue444 = bitwiseValue211 * 16384.0f;
                                                precise float sumValue335 = productValue444 + 0.5f;
                                                precise float productValue445 = bitwiseValue212 * 16384.0f;
                                                precise float sumValue336 = productValue445 + 0.5f;
                                                precise float productValue446 = floor(sumValue335) * 6.103515625e-05f;
                                                precise float productValue447 = floor(sumValue336) * 6.103515625e-05f;
                                                intermediateValue398 = productValue446;
                                                intermediateValue399 = productValue447;
                                            }
                                            precise float productValue454 = intermediateValue351.y * intermediateValue398;
                                            precise float productValue455 = intermediateValue351.y * intermediateValue399;
                                            precise float sumValue342 = sumValue317 + productValue454;
                                            precise float sumValue343 = sumValue318 + productValue455;
                                            precise float productValue456 = intermediateValue352 * 0.083333335816860198974609375f;
                                            precise float sumValue344 = productValue456 + (-0.25f);
                                            float intermediateValue405;
                                            float intermediateValue406;
                                            float intermediateValue407;
                                            float intermediateValue408;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue360 * 2 + 0) == 65535u)
                                            {
                                                intermediateValue405 = 1.0f;
                                                intermediateValue406 = 1.0f;
                                                intermediateValue407 = 1.0f;
                                                intermediateValue408 = 1.0f;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits28;
                                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue360 * 2 + 0) > 4095u)
                                                {
                                                    reinterpretedBits28 = asuint(viewCbConstants[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits28 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue360 * 2 + 0));
                                                }
                                                float4 sampledTextureValue11 = textures[NonUniformResourceIndex(reinterpretedBits28 + 0u)].SampleLevel(defaultSampler, float2(sumValue342, sumValue343), min(sumValue344, 2.0f));
                                                intermediateValue405 = sampledTextureValue11.x;
                                                intermediateValue406 = sampledTextureValue11.y;
                                                intermediateValue407 = sampledTextureValue11.z;
                                                intermediateValue408 = sampledTextureValue11.w;
                                            }
                                            float intermediateValue418;
                                            float intermediateValue419;
                                            float intermediateValue420;
                                            if (intermediateValue354 == 2u)
                                            {
                                                float branchMergedValue42;
                                                float branchMergedValue69;
                                                float branchMergedValue70;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue361 * 2 + 0) & 128u) == 0u)
                                                {
                                                    float intermediateValue423;
                                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue361 * 2 + 0) & 2048u) == 0u)
                                                    {
                                                        intermediateValue423 = intermediateValue408;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue483 = intermediateValue408 * 2.0f;
                                                        precise float sumValue371 = productValue483 + (-1.0f);
                                                        intermediateValue423 = clamp(sumValue371, 0.0f, 1.0f);
                                                    }
                                                    precise float sumValue368 = 0.0f - intermediateValue405;
                                                    precise float sumValue369 = 0.0f - intermediateValue406;
                                                    precise float sumValue370 = 0.0f - intermediateValue407;
                                                    precise float productValue480 = sumValue368 * intermediateValue423;
                                                    precise float productValue481 = sumValue369 * intermediateValue423;
                                                    precise float productValue482 = sumValue370 * intermediateValue423;
                                                    precise float sumValue360 = intermediateValue405 + productValue480;
                                                    precise float sumValue361 = intermediateValue406 + productValue481;
                                                    precise float sumValue362 = intermediateValue407 + productValue482;
                                                    branchMergedValue42 = sumValue362;
                                                    branchMergedValue69 = sumValue361;
                                                    branchMergedValue70 = sumValue360;
                                                }
                                                else
                                                {
                                                    branchMergedValue42 = 0.33399999141693115234375f;
                                                    branchMergedValue69 = 0.33399999141693115234375f;
                                                    branchMergedValue70 = 0.33399999141693115234375f;
                                                }
                                                intermediateValue418 = branchMergedValue70;
                                                intermediateValue419 = branchMergedValue69;
                                                intermediateValue420 = branchMergedValue42;
                                            }
                                            else
                                            {
                                                precise float sumValue356 = 1.0f - intermediateValue408;
                                                intermediateValue418 = sumValue356;
                                                intermediateValue419 = sumValue356;
                                                intermediateValue420 = sumValue356;
                                            }
                                            precise float productValue473 = intermediateValue328 * intermediateValue418;
                                            precise float productValue474 = intermediateValue329 * intermediateValue419;
                                            precise float productValue475 = intermediateValue330 * intermediateValue420;
                                            float intermediateValue356;
                                            float intermediateValue357;
                                            float intermediateValue358;
                                            bool intermediateValue424;
                                            if (!(dot(float3(productValue473, productValue474, productValue475), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                            {
                                                intermediateValue424 = false;
                                                intermediateValue356 = productValue473;
                                                intermediateValue357 = productValue474;
                                                intermediateValue358 = productValue475;
                                            }
                                            else
                                            {
                                                intermediateValue424 = true;
                                                intermediateValue356 = 0.0f;
                                                intermediateValue357 = 0.0f;
                                                intermediateValue358 = 0.0f;
                                            }
                                            float branchMergedValue80;
                                            float branchMergedValue86;
                                            float branchMergedValue87;
                                            if (intermediateValue424)
                                            {
                                                intermediateValue295.CommitNonOpaqueTriangleHit();
                                                branchMergedValue80 = intermediateValue358;
                                                branchMergedValue86 = intermediateValue357;
                                                branchMergedValue87 = intermediateValue356;
                                            }
                                            else
                                            {
                                                branchMergedValue80 = intermediateValue358;
                                                branchMergedValue86 = intermediateValue357;
                                                branchMergedValue87 = intermediateValue356;
                                            }
                                            branchMergedValue3 = branchMergedValue80;
                                            branchMergedValue23 = branchMergedValue86;
                                            branchMergedValue24 = branchMergedValue87;
                                        }
                                        else
                                        {
                                            branchMergedValue3 = intermediateValue330;
                                            branchMergedValue23 = intermediateValue329;
                                            branchMergedValue24 = intermediateValue328;
                                        }
                                        intermediateValue313 = branchMergedValue3;
                                        intermediateValue311 = branchMergedValue23;
                                        intermediateValue309 = branchMergedValue24;
                                        bool intermediateValue359 = intermediateValue295.Proceed();
                                        if (intermediateValue359)
                                        {
                                            intermediateValue328 = intermediateValue309;
                                            intermediateValue329 = intermediateValue311;
                                            intermediateValue330 = intermediateValue313;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue308 = intermediateValue309;
                                    intermediateValue310 = intermediateValue311;
                                    intermediateValue312 = intermediateValue313;
                                }
                                else
                                {
                                    intermediateValue308 = 1.0f;
                                    intermediateValue310 = 1.0f;
                                    intermediateValue312 = 1.0f;
                                }
                                uint intermediateValue314 = intermediateValue295.CommittedStatus();
                                bool comparisonValue65 = intermediateValue314 == 1u;
                                branchMergedValue34 = comparisonValue65 ? 0.0f : intermediateValue312;
                                branchMergedValue65 = comparisonValue65 ? 0.0f : intermediateValue310;
                                branchMergedValue66 = comparisonValue65 ? 0.0f : intermediateValue308;
                            }
                            intermediateValue255 = branchMergedValue66;
                            intermediateValue256 = branchMergedValue65;
                            intermediateValue257 = branchMergedValue34;
                        }
                        float2 reinterpretedBits17 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, (intermediateValue191 * 8u) * 8 + 0));
                        float2 reinterpretedBits18 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue191 * 8u) + 1u) * 8 + 0));
                        float reinterpretedBits19 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue191 * 16u) + 13u) * 4 + 0));
                        float reinterpretedBits20 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue191 * 16u) + 14u) * 4 + 0));
                        uint reinterpretedBits21;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue117 * 2 + 0) > 4095u)
                        {
                            reinterpretedBits21 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits21 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue117 * 2 + 0));
                        }
                        uint sumValue198 = reinterpretedBits21 + 0u;
                        float intermediateValue271;
                        float intermediateValue272;
                        float intermediateValue273;
                        float intermediateValue274;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue117 * 2 + 0) == 65535u)
                        {
                            intermediateValue271 = 1.0f;
                            intermediateValue272 = 1.0f;
                            intermediateValue273 = 1.0f;
                            intermediateValue274 = 1.0f;
                        }
                        else
                        {
                            float4 sampledTextureValue4 = textures[NonUniformResourceIndex(sumValue198)].SampleLevel(defaultSampler, float2(productValue244, productValue245), min(100.0f, reinterpretedBits19));
                            intermediateValue271 = sampledTextureValue4.x;
                            intermediateValue272 = sampledTextureValue4.y;
                            intermediateValue273 = sampledTextureValue4.z;
                            intermediateValue274 = sampledTextureValue4.w;
                        }
                        float intermediateValue158;
                        float intermediateValue160;
                        float intermediateValue162;
                        float productValue160;
                        float productValue161;
                        float productValue162;
                        float productValue163;
                        float productValue164;
                        float productValue165;
                        float productValue166;
                        float productValue167;
                        float productValue168;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue119 * 2 + 0) & 1536u) == 0u)
                        {
                            float intermediateValue297;
                            float intermediateValue298;
                            float intermediateValue299;
                            float intermediateValue300;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue119 * 2 + 0) & 4u) == 0u)
                            {
                                intermediateValue297 = intermediateValue274;
                                intermediateValue298 = bitwiseValue100;
                                intermediateValue299 = bitwiseValue101;
                                intermediateValue300 = bitwiseValue102;
                            }
                            else
                            {
                                uint reinterpretedBits22;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue118 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits22 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits22 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue118 * 2 + 0));
                                }
                                float4 sampledTextureValue8 = textures[NonUniformResourceIndex(reinterpretedBits22 + 0u)].SampleLevel(defaultSampler, float2(bitwiseValue100, bitwiseValue101), 0.0f);
                                intermediateValue297 = 1.0f;
                                intermediateValue298 = ((((sampledTextureValue8.x * 2.0f) + (-1.0f)) * bitwiseValue102) + 1.0f) * bitwiseValue103;
                                intermediateValue299 = ((((sampledTextureValue8.y * 2.0f) + (-1.0f)) * bitwiseValue102) + 1.0f) * bitwiseValue103;
                                intermediateValue300 = ((((sampledTextureValue8.z * 2.0f) + (-1.0f)) * bitwiseValue102) + 1.0f) * bitwiseValue103;
                            }
                            float intermediateValue317;
                            float intermediateValue318;
                            float intermediateValue319;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue119 * 2 + 0) & 8192u) == 0u)
                            {
                                intermediateValue317 = intermediateValue298;
                                intermediateValue318 = intermediateValue299;
                                intermediateValue319 = intermediateValue300;
                            }
                            else
                            {
                                intermediateValue317 = ((1.0f - intermediateValue298) * intermediateValue297) + intermediateValue298;
                                intermediateValue318 = ((1.0f - intermediateValue299) * intermediateValue297) + intermediateValue299;
                                intermediateValue319 = ((1.0f - intermediateValue300) * intermediateValue297) + intermediateValue300;
                            }
                            float intermediateValue332;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue119 * 2 + 0) & 2048u) == 0u)
                            {
                                intermediateValue332 = intermediateValue297;
                            }
                            else
                            {
                                intermediateValue332 = clamp(mad(intermediateValue297, 2.0f, -1.0f), 0.0f, 1.0f);
                            }
                            float bitwiseValue130 = (intermediateValue317 * intermediateValue271) * ((intermediateValue332 * ((float(rdByteLoad_objectInstances_uint(0u, productValue120 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                            float bitwiseValue131 = (intermediateValue318 * intermediateValue272) * ((intermediateValue332 * ((float((rdByteLoad_objectInstances_uint(0u, productValue120 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                            float bitwiseValue132 = (intermediateValue319 * intermediateValue273) * ((intermediateValue332 * ((float((rdByteLoad_objectInstances_uint(0u, productValue120 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                            float productValue386;
                            if (bitwiseValue130 < 0.040449999272823333740234375f)
                            {
                                productValue386 = bitwiseValue130 * 0.077399380505084991455078125f;
                            }
                            else
                            {
                                productValue386 = exp2(log2((bitwiseValue130 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                            }
                            float productValue423;
                            if (bitwiseValue131 < 0.040449999272823333740234375f)
                            {
                                productValue423 = bitwiseValue131 * 0.077399380505084991455078125f;
                            }
                            else
                            {
                                productValue423 = exp2(log2((bitwiseValue131 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                            }
                            float productValue448;
                            if (bitwiseValue132 < 0.040449999272823333740234375f)
                            {
                                productValue448 = bitwiseValue132 * 0.077399380505084991455078125f;
                            }
                            else
                            {
                                productValue448 = exp2(log2((bitwiseValue132 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                            }
                            float reinterpretedBits25;
                            float reinterpretedBits26;
                            if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue191 * 16u) + 8u) * 4 + 0) & 1u) == 0u)
                            {
                                reinterpretedBits25 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue191 * 16u) + 11u) * 4 + 0));
                                reinterpretedBits26 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue191 * 16u) + 10u) * 4 + 0));
                            }
                            else
                            {
                                float4 sampledTextureValue9 = textures[NonUniformResourceIndex(sumValue198)].SampleLevel(defaultSampler, float2(mad(productValue244, reinterpretedBits17.x, reinterpretedBits18.x), mad(productValue245, reinterpretedBits17.y, reinterpretedBits18.y)), min((100.0f - reinterpretedBits19) + reinterpretedBits20, reinterpretedBits20));
                                float intermediateValue400 = sampledTextureValue9.y;
                                reinterpretedBits25 = sampledTextureValue9.x;
                                reinterpretedBits26 = mad(intermediateValue400, intermediateValue400, 0.0f);
                            }
                            float sumValue345 = 1.0f - reinterpretedBits25;
                            float productValue457 = sumValue345 * productValue386;
                            float productValue458 = sumValue345 * productValue423;
                            float productValue459 = sumValue345 * productValue448;
                            float dotProductValue20 = dot(float3(productValue386, productValue423, productValue448), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                            float productValue460 = (reinterpretedBits26 * 5.0f) * viewCbConstants[84u].w;
                            intermediateValue158 = comparisonValue43;
                            intermediateValue160 = comparisonValue44;
                            intermediateValue162 = comparisonValue45;
                            productValue160 = productValue460 * (((dotProductValue20 - productValue386) * viewCbConstants[85u].x) + productValue386);
                            productValue161 = productValue460 * (((dotProductValue20 - productValue423) * viewCbConstants[85u].x) + productValue423);
                            productValue162 = productValue460 * (((dotProductValue20 - productValue448) * viewCbConstants[85u].x) + productValue448);
                            productValue163 = (reinterpretedBits25 * (productValue386 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                            productValue164 = (reinterpretedBits25 * (productValue423 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                            productValue165 = (reinterpretedBits25 * (productValue448 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                            productValue166 = productValue457 - (productValue457 * reinterpretedBits26);
                            productValue167 = productValue458 - (productValue458 * reinterpretedBits26);
                            productValue168 = productValue459 - (productValue459 * reinterpretedBits26);
                        }
                        else
                        {
                            intermediateValue158 = intermediateValue12;
                            intermediateValue160 = intermediateValue15;
                            intermediateValue162 = intermediateValue17;
                            productValue160 = intermediateValue19;
                            productValue161 = intermediateValue21;
                            productValue162 = intermediateValue23;
                            productValue163 = intermediateValue25;
                            productValue164 = intermediateValue27;
                            productValue165 = intermediateValue29;
                            productValue166 = intermediateValue31;
                            productValue167 = intermediateValue33;
                            productValue168 = intermediateValue35;
                        }
                        float productValue169 = (viewCbConstants[85u].y * productValue160) + (productValue166 * intermediateValue237);
                        float productValue170 = (viewCbConstants[85u].y * productValue161) + (productValue167 * intermediateValue238);
                        float productValue171 = (viewCbConstants[85u].y * productValue162) + (productValue168 * intermediateValue239);
                        float branchMergedValue31;
                        float branchMergedValue54;
                        float branchMergedValue55;
                        float branchMergedValue56;
                        float branchMergedValue57;
                        float branchMergedValue58;
                        float branchMergedValue59;
                        float branchMergedValue60;
                        float branchMergedValue61;
                        float branchMergedValue62;
                        float branchMergedValue73;
                        float branchMergedValue74;
                        float branchMergedValue75;
                        float branchMergedValue76;
                        float branchMergedValue77;
                        if (dot(float3(intermediateValue255, intermediateValue256, intermediateValue257), 1.0f.xxx) > 0.0f)
                        {
                            float sumValue225 = (-0.0f) - intermediateValue38;
                            float sumValue226 = (-0.0f) - intermediateValue40;
                            float sumValue227 = (-0.0f) - intermediateValue42;
                            float sumValue228 = viewCbConstants[52u].x - intermediateValue38;
                            float sumValue229 = viewCbConstants[52u].y - intermediateValue40;
                            float sumValue230 = viewCbConstants[52u].z - intermediateValue42;
                            float inverseLengthValue5 = rsqrt(dot(float3(sumValue228, sumValue229, sumValue230), float3(sumValue228, sumValue229, sumValue230)));
                            float clampedValue4 = clamp(dot(float3(intermediateValue158, intermediateValue160, intermediateValue162), float3(viewCbConstants[52u].xyz)), 0.0f, 1.0f);
                            float clampedValue5 = clamp(dot(float3(intermediateValue158, intermediateValue160, intermediateValue162), float3(sumValue225, sumValue226, sumValue227)), 0.0f, 1.0f);
                            float clampedValue6 = clamp(dot(float3(sumValue225, sumValue226, sumValue227), float3(inverseLengthValue5 * sumValue228, inverseLengthValue5 * sumValue229, inverseLengthValue5 * sumValue230)), 0.0f, 1.0f);
                            float clampedValue7 = clamp(dot(float3(productValue163, productValue164, productValue165), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f, 0.0f, 1.0f);
                            float clampedValue8 = exp2(log2(clamp(1.0f - clampedValue6, 0.0f, 1.0f)) * 5.0f);
                            float productValue330 = (clampedValue8 * (clampedValue7 - productValue163)) + productValue163;
                            float productValue331 = (clampedValue8 * (clampedValue7 - productValue164)) + productValue164;
                            float productValue332 = (clampedValue8 * (clampedValue7 - productValue165)) + productValue165;
                            float productValue333 = ((clampedValue6 * clampedValue6) * 2.0f) + (-0.5f);
                            float clampedValue9 = (((exp2(log2(clamp(1.0f - clampedValue5, 0.0f, 1.0f)) * 5.0f) * productValue333) + 1.0f) * 0.3183098733425140380859375f) * ((exp2(log2(clamp(1.0f - clampedValue4, 0.0f, 1.0f)) * 5.0f) * productValue333) + 1.0f);
                            float quotientValue10 = 0.079577468335628509521484375f / ((((clampedValue5 * 0.5f) + 0.5f) * ((clampedValue4 * 0.5f) + 0.5f)) + 1.0000000133514319600180897396058e-10f);
                            branchMergedValue31 = intermediateValue158;
                            branchMergedValue54 = intermediateValue160;
                            branchMergedValue55 = (((viewCbConstants[50u].z * intermediateValue257) * clampedValue4) * ((((1.0f - productValue332) * productValue168) * clampedValue9) + (productValue332 * quotientValue10))) + productValue171;
                            branchMergedValue56 = (((viewCbConstants[50u].y * intermediateValue256) * clampedValue4) * ((((1.0f - productValue331) * productValue167) * clampedValue9) + (productValue331 * quotientValue10))) + productValue170;
                            branchMergedValue57 = (((viewCbConstants[50u].x * intermediateValue255) * clampedValue4) * ((((1.0f - productValue330) * productValue166) * clampedValue9) + (productValue330 * quotientValue10))) + productValue169;
                            branchMergedValue58 = productValue168;
                            branchMergedValue59 = productValue167;
                            branchMergedValue60 = productValue166;
                            branchMergedValue61 = productValue165;
                            branchMergedValue62 = productValue164;
                            branchMergedValue73 = productValue163;
                            branchMergedValue74 = productValue162;
                            branchMergedValue75 = productValue161;
                            branchMergedValue76 = productValue160;
                            branchMergedValue77 = intermediateValue162;
                        }
                        else
                        {
                            branchMergedValue31 = intermediateValue158;
                            branchMergedValue54 = intermediateValue160;
                            branchMergedValue55 = productValue171;
                            branchMergedValue56 = productValue170;
                            branchMergedValue57 = productValue169;
                            branchMergedValue58 = productValue168;
                            branchMergedValue59 = productValue167;
                            branchMergedValue60 = productValue166;
                            branchMergedValue61 = productValue165;
                            branchMergedValue62 = productValue164;
                            branchMergedValue73 = productValue163;
                            branchMergedValue74 = productValue162;
                            branchMergedValue75 = productValue161;
                            branchMergedValue76 = productValue160;
                            branchMergedValue77 = intermediateValue162;
                        }
                        intermediateValue157 = branchMergedValue31;
                        intermediateValue159 = branchMergedValue54;
                        intermediateValue161 = branchMergedValue77;
                        intermediateValue163 = branchMergedValue76;
                        intermediateValue164 = branchMergedValue75;
                        intermediateValue165 = branchMergedValue74;
                        intermediateValue166 = branchMergedValue73;
                        intermediateValue167 = branchMergedValue62;
                        intermediateValue168 = branchMergedValue61;
                        intermediateValue169 = branchMergedValue60;
                        intermediateValue170 = branchMergedValue59;
                        intermediateValue171 = branchMergedValue58;
                        comparisonValue34 = branchMergedValue57;
                        comparisonValue35 = branchMergedValue56;
                        comparisonValue36 = branchMergedValue55;
                    }
                    precise float productValue172 = comparisonValue25 * comparisonValue36;
                    precise float productValue173 = comparisonValue24 * comparisonValue35;
                    precise float productValue174 = comparisonValue23 * comparisonValue34;
                    float clampedValue2 = 1.0f - exp2(log2(clamp(intermediateValue81 * 0.0045106001198291778564453125f, 0.0f, 1.0f)) * 3.0f);
                    intermediateValue57 = intermediateValue157;
                    intermediateValue58 = intermediateValue159;
                    intermediateValue59 = intermediateValue161;
                    intermediateValue60 = intermediateValue163;
                    intermediateValue61 = intermediateValue164;
                    intermediateValue62 = intermediateValue165;
                    intermediateValue63 = intermediateValue166;
                    intermediateValue64 = intermediateValue167;
                    intermediateValue65 = intermediateValue168;
                    intermediateValue66 = intermediateValue169;
                    intermediateValue67 = intermediateValue170;
                    intermediateValue68 = intermediateValue171;
                    productValue182 = clampedValue2 * productValue174;
                    productValue183 = clampedValue2 * productValue173;
                    productValue184 = clampedValue2 * productValue172;
                }
                else
                {
                    uint4 reinterpretedBits10 = asuint(viewCbConstants[75u]);
                    uint intermediateValue136 = reinterpretedBits10.w;
                    float sumValue70 = (-0.0f) - intermediateValue38;
                    float sumValue71 = (-0.0f) - intermediateValue40;
                    float sumValue72 = (-0.0f) - intermediateValue42;
                    float productValue122 = viewCbConstants[60u].w * viewCbConstants[60u].w;
                    float clampedValue1 = (clamp(viewCbConstants[90u].w, 0.0f, 1.0f) * 15.9154567718505859375f) * ((1.0f - productValue122) / exp2(log2(abs((productValue122 + 1.0f) - ((viewCbConstants[60u].w * 2.0f) * min(max((-0.0f) - dot(float3(viewCbConstants[52u].xyz), float3(sumValue70, sumValue71, sumValue72)), -1.0f), 1.0f)))) * 1.5f));
                    float intermediateValue172;
                    float intermediateValue173;
                    float intermediateValue174;
                    if (intermediateValue136 == 1u)
                    {
                        intermediateValue172 = viewCbConstants[58u].x;
                        intermediateValue173 = viewCbConstants[58u].y;
                        intermediateValue174 = viewCbConstants[58u].z;
                    }
                    else
                    {
                        float branchMergedValue28;
                        float branchMergedValue44;
                        float branchMergedValue45;
                        if (intermediateValue136 == 2u)
                        {
                            uint4 intermediateValue175 = asuint(viewCbConstants[74u]);
                            uint intermediateValue176 = intermediateValue175.z;
                            uint reinterpretedBits11;
                            if (intermediateValue176 > 4095u)
                            {
                                reinterpretedBits11 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits11 = intermediateValue176;
                            }
                            float intermediateValue184 = abs(intermediateValue38);
                            float intermediateValue185 = abs(intermediateValue40);
                            float intermediateValue186 = abs(intermediateValue42);
                            float intermediateValue210;
                            float comparisonValue40;
                            float intermediateValue211;
                            if ((intermediateValue184 >= intermediateValue185) && (intermediateValue184 >= intermediateValue186))
                            {
                                intermediateValue210 = intermediateValue184;
                                comparisonValue40 = (intermediateValue38 < 0.0f) ? sumValue72 : intermediateValue42;
                                intermediateValue211 = sumValue71;
                            }
                            else
                            {
                                float branchMergedValue29;
                                float branchMergedValue46;
                                float branchMergedValue47;
                                if (!(intermediateValue185 >= intermediateValue186))
                                {
                                    branchMergedValue29 = intermediateValue186;
                                    branchMergedValue46 = (intermediateValue42 < 0.0f) ? intermediateValue38 : sumValue70;
                                    branchMergedValue47 = sumValue71;
                                }
                                else
                                {
                                    branchMergedValue29 = intermediateValue185;
                                    branchMergedValue46 = sumValue70;
                                    branchMergedValue47 = (intermediateValue40 < 0.0f) ? sumValue72 : intermediateValue42;
                                }
                                intermediateValue210 = branchMergedValue29;
                                comparisonValue40 = branchMergedValue46;
                                intermediateValue211 = branchMergedValue47;
                            }
                            precise float quotientValue9 = 0.5f / intermediateValue210;
                            float4 sampledTextureValue2 = textures[NonUniformResourceIndex(reinterpretedBits11 + 0u)].SampleLevel(linearSampler, float2(frac(mad(comparisonValue40, quotientValue9, 0.5f) * viewCbConstants[74u].x), frac(mad(intermediateValue211, quotientValue9, 0.5f) * viewCbConstants[74u].y)), 0.0f);
                            branchMergedValue28 = (viewCbConstants[58u].y * sampledTextureValue2.y) * viewCbConstants[97u].w;
                            branchMergedValue44 = (viewCbConstants[58u].x * sampledTextureValue2.x) * viewCbConstants[97u].w;
                            branchMergedValue45 = (viewCbConstants[58u].z * sampledTextureValue2.z) * viewCbConstants[97u].w;
                        }
                        else
                        {
                            float branchMergedValue90;
                            float branchMergedValue92;
                            float branchMergedValue93;
                            if (intermediateValue136 == 4u)
                            {
                                float intermediateValue187 = (dot(float3(intermediateValue38, intermediateValue40, intermediateValue42), float3(viewCbConstants[52u].xyz)) * 0.5f) + 0.5f;
                                branchMergedValue90 = ((viewCbConstants[75u].y - viewCbConstants[76u].y) * intermediateValue187) + viewCbConstants[76u].y;
                                branchMergedValue92 = ((viewCbConstants[75u].x - viewCbConstants[76u].x) * intermediateValue187) + viewCbConstants[76u].x;
                                branchMergedValue93 = ((viewCbConstants[75u].z - viewCbConstants[76u].z) * intermediateValue187) + viewCbConstants[76u].z;
                            }
                            else
                            {
                                float comparisonValue39;
                                if (abs(intermediateValue40) < 1.0f)
                                {
                                    float quotientValue8 = atan(intermediateValue42 / intermediateValue38);
                                    bool intermediateValue192 = intermediateValue38 < 0.0f;
                                    bool comparisonValue37 = intermediateValue38 == 0.0f;
                                    bool comparisonValue38 = intermediateValue42 >= 0.0f;
                                    bool intermediateValue193 = intermediateValue42 < 0.0f;
                                    comparisonValue39 = (comparisonValue37 && comparisonValue38) ? 1.57079637050628662109375f : ((comparisonValue37 && intermediateValue193) ? (-1.57079637050628662109375f) : ((intermediateValue192 && intermediateValue193) ? (quotientValue8 + (-3.1415927410125732421875f)) : ((intermediateValue192 && comparisonValue38) ? (quotientValue8 + 3.1415927410125732421875f) : quotientValue8)));
                                }
                                else
                                {
                                    comparisonValue39 = 0.0f;
                                }
                                float multiplyAddValue12 = mad(abs((frac((comparisonValue39 - viewCbConstants[50u].w) * 0.15915493667125701904296875f) * 2.0f) + (-1.0f)), 0.984375f, 0.0078125f);
                                float multiplyAddValue13 = mad(0.5f - (asin(intermediateValue40) * 0.3183098733425140380859375f), 0.96875f, 0.015625f);
                                float productValue205 = viewCbConstants[51u].w * 7.0f;
                                float intermediateValue194 = frac(productValue205);
                                uint intermediateValue195 = uint(int(floor(productValue205)));
                                float productValue206 = float(int(intermediateValue195 + 1u)) * 0.125f;
                                float intermediateValue196 = frac(abs(productValue206));
                                float4 sampledTextureValue = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue12, multiplyAddValue13, float(int(intermediateValue195))), 0.0f);
                                float intermediateValue197 = sampledTextureValue.x;
                                float intermediateValue198 = sampledTextureValue.y;
                                float intermediateValue199 = sampledTextureValue.z;
                                float productValue207 = intermediateValue197 * intermediateValue197;
                                float productValue208 = intermediateValue198 * intermediateValue198;
                                float productValue209 = intermediateValue199 * intermediateValue199;
                                float4 sampledTextureValue1 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue12, multiplyAddValue13, float(int(uint(int(((productValue206 >= ((-0.0f) - productValue206)) ? intermediateValue196 : ((-0.0f) - intermediateValue196)) * 8.0f))))), 0.0f);
                                float intermediateValue200 = sampledTextureValue1.x;
                                float intermediateValue201 = sampledTextureValue1.y;
                                float intermediateValue202 = sampledTextureValue1.z;
                                float dotProductValue14 = exp2(log2(max(dot(float3(intermediateValue38, intermediateValue40, intermediateValue42), float3(viewCbConstants[52u].xyz)), 0.0f)) * 7.0f);
                                float productValue210 = dotProductValue14 * 0.0500000007450580596923828125f;
                                float productValue211 = ((((intermediateValue200 * intermediateValue200) - productValue207) * intermediateValue194) + productValue207) + (productValue210 * viewCbConstants[50u].x);
                                float productValue212 = ((((intermediateValue201 * intermediateValue201) - productValue208) * intermediateValue194) + productValue208) + (productValue210 * viewCbConstants[50u].y);
                                float productValue213 = ((((intermediateValue202 * intermediateValue202) - productValue209) * intermediateValue194) + productValue209) + (productValue210 * viewCbConstants[50u].z);
                                float productValue214 = (dotProductValue14 * 0.64999997615814208984375f) + 0.3499999940395355224609375f;
                                branchMergedValue90 = ((((viewCbConstants[58u].y * productValue214) - productValue212) * viewCbConstants[58u].w) + productValue212) * viewCbConstants[97u].w;
                                branchMergedValue92 = ((((viewCbConstants[58u].x * productValue214) - productValue211) * viewCbConstants[58u].w) + productValue211) * viewCbConstants[97u].w;
                                branchMergedValue93 = ((((viewCbConstants[58u].z * productValue214) - productValue213) * viewCbConstants[58u].w) + productValue213) * viewCbConstants[97u].w;
                            }
                            branchMergedValue28 = branchMergedValue90;
                            branchMergedValue44 = branchMergedValue92;
                            branchMergedValue45 = branchMergedValue93;
                        }
                        intermediateValue172 = branchMergedValue44;
                        intermediateValue173 = branchMergedValue28;
                        intermediateValue174 = branchMergedValue45;
                    }
                    intermediateValue57 = intermediateValue12;
                    intermediateValue58 = intermediateValue15;
                    intermediateValue59 = intermediateValue17;
                    intermediateValue60 = intermediateValue19;
                    intermediateValue61 = intermediateValue21;
                    intermediateValue62 = intermediateValue23;
                    intermediateValue63 = intermediateValue25;
                    intermediateValue64 = intermediateValue27;
                    intermediateValue65 = intermediateValue29;
                    intermediateValue66 = intermediateValue31;
                    intermediateValue67 = intermediateValue33;
                    intermediateValue68 = intermediateValue35;
                    productValue182 = (intermediateValue172 + (((viewCbConstants[50u].x * clampedValue1) * viewCbConstants[61u].x) * exp2(viewCbConstants[62u].x * (-72.1347503662109375f)))) * comparisonValue23;
                    productValue183 = (intermediateValue173 + (((viewCbConstants[50u].y * clampedValue1) * viewCbConstants[61u].y) * exp2(viewCbConstants[62u].y * (-72.1347503662109375f)))) * comparisonValue24;
                    productValue184 = (intermediateValue174 + (((viewCbConstants[50u].z * clampedValue1) * viewCbConstants[61u].z) * exp2(viewCbConstants[62u].z * (-72.1347503662109375f)))) * comparisonValue25;
                }
                branchMergedValue = intermediateValue65;
                branchMergedValue5 = (viewCbConstants[59u].z * comparisonValue25) + productValue184;
                branchMergedValue6 = (viewCbConstants[59u].y * comparisonValue24) + productValue183;
                branchMergedValue7 = (viewCbConstants[59u].x * comparisonValue23) + productValue182;
                branchMergedValue8 = intermediateValue68;
                branchMergedValue9 = intermediateValue67;
                branchMergedValue10 = intermediateValue66;
                branchMergedValue11 = intermediateValue57;
                branchMergedValue12 = intermediateValue64;
                branchMergedValue13 = intermediateValue63;
                branchMergedValue16 = intermediateValue62;
                branchMergedValue17 = intermediateValue61;
                branchMergedValue18 = intermediateValue60;
                branchMergedValue19 = intermediateValue59;
                branchMergedValue20 = intermediateValue58;
            }
            else
            {
                branchMergedValue = intermediateValue29;
                branchMergedValue5 = 0.0f;
                branchMergedValue6 = 0.0f;
                branchMergedValue7 = 0.0f;
                branchMergedValue8 = intermediateValue35;
                branchMergedValue9 = intermediateValue33;
                branchMergedValue10 = intermediateValue31;
                branchMergedValue11 = intermediateValue12;
                branchMergedValue12 = intermediateValue27;
                branchMergedValue13 = intermediateValue25;
                branchMergedValue16 = intermediateValue23;
                branchMergedValue17 = intermediateValue21;
                branchMergedValue18 = intermediateValue19;
                branchMergedValue19 = intermediateValue17;
                branchMergedValue20 = intermediateValue15;
            }
            intermediateValue30 = branchMergedValue;
            intermediateValue71 = branchMergedValue5;
            intermediateValue70 = branchMergedValue6;
            intermediateValue69 = branchMergedValue7;
            intermediateValue36 = branchMergedValue8;
            intermediateValue34 = branchMergedValue9;
            intermediateValue32 = branchMergedValue10;
            intermediateValue14 = branchMergedValue11;
            intermediateValue28 = branchMergedValue12;
            intermediateValue26 = branchMergedValue13;
            intermediateValue24 = branchMergedValue16;
            intermediateValue22 = branchMergedValue17;
            intermediateValue20 = branchMergedValue18;
            intermediateValue18 = branchMergedValue19;
            intermediateValue16 = branchMergedValue20;
            comparisonValue8 = comparisonValue14 ? (intermediateValue69 + intermediateValue45) : intermediateValue45;
            comparisonValue9 = comparisonValue14 ? (intermediateValue70 + intermediateValue46) : intermediateValue46;
            comparisonValue10 = comparisonValue14 ? (intermediateValue71 + intermediateValue47) : intermediateValue47;
            comparisonValue11 = comparisonValue14 ? intermediateValue48 : (intermediateValue69 + intermediateValue48);
            comparisonValue12 = comparisonValue14 ? intermediateValue49 : (intermediateValue70 + intermediateValue49);
            comparisonValue13 = comparisonValue14 ? intermediateValue50 : (intermediateValue71 + intermediateValue50);
            uint sumValue39 = intermediateValue51 + 1u;
            if (sumValue39 == 4u)
            {
                break;
            }
            else
            {
                intermediateValue12 = intermediateValue14;
                intermediateValue15 = intermediateValue16;
                intermediateValue17 = intermediateValue18;
                intermediateValue19 = intermediateValue20;
                intermediateValue21 = intermediateValue22;
                intermediateValue23 = intermediateValue24;
                intermediateValue25 = intermediateValue26;
                intermediateValue27 = intermediateValue28;
                intermediateValue29 = intermediateValue30;
                intermediateValue31 = intermediateValue32;
                intermediateValue33 = intermediateValue34;
                intermediateValue35 = intermediateValue36;
                intermediateValue37 = intermediateValue38;
                intermediateValue39 = intermediateValue40;
                intermediateValue41 = intermediateValue42;
                intermediateValue43 = intermediateValue44;
                intermediateValue45 = comparisonValue8;
                intermediateValue46 = comparisonValue9;
                intermediateValue47 = comparisonValue10;
                intermediateValue48 = comparisonValue11;
                intermediateValue49 = comparisonValue12;
                intermediateValue50 = comparisonValue13;
                intermediateValue51 = sumValue39;
                continue;
            }
        }
        uint productValue79 = rdByteLoad_objectInstances_uint(0u, productValue5 * 4 + 0) + productValue7;
        precise float productValue80 = sumValue16 * sumValue16;
        precise float productValue81 = sumValue19 * sumValue19;
        precise float sumValue50 = productValue80 + productValue81;
        precise float productValue82 = sumValue22 * sumValue22;
        precise float sumValue51 = sumValue50 + productValue82;
        precise float sumValue52 = viewCbConstants[97u].y + 10.0f;
        precise float sumValue53 = viewCbConstants[97u].y + (-10.0f);
        precise float sumValue54 = sumValue52 - sumValue53;
        precise float nonlinearValue2 = sqrt(sumValue51) - sumValue53;
        precise float quotientValue = nonlinearValue2 / sumValue54;
        float clampedValue = clamp(quotientValue, 0.0f, 1.0f);
        precise float productValue83 = clampedValue * 2.0f;
        precise float sumValue55 = 3.0f - productValue83;
        precise float productValue84 = clampedValue * sumValue55;
        precise float productValue85 = clampedValue * productValue84;
        precise float sumValue56 = 1.0f - productValue85;
        float intermediateValue85;
        float intermediateValue86;
        float intermediateValue87;
        float intermediateValue88;
        float intermediateValue89;
        float intermediateValue90;
        float intermediateValue91;
        if (sumValue56 > 0.0f)
        {
            uint4 reinterpretedBits4 = asuint(viewCbConstants[92u]);
            uint intermediateValue84 = reinterpretedBits4.w;
            float intermediateValue113;
            float intermediateValue114;
            float intermediateValue115;
            uint intermediateValue116;
            float intermediateValue118;
            float intermediateValue119;
            float intermediateValue120;
            if (intermediateValue84 == 0u)
            {
                intermediateValue113 = 0.0f;
                intermediateValue114 = 0.0f;
                intermediateValue115 = 0.0f;
                intermediateValue116 = 0u;
                intermediateValue118 = 0.0f;
                intermediateValue119 = 0.0f;
                intermediateValue120 = 0.0f;
            }
            else
            {
                uint intermediateValue[8];
                intermediateValue[0u] = 0u;
                uint sumValue59 = intermediateValue84 + 4294967295u;
                uint productValue105 = (intermediateValue44 * 1664525u) + 1013904223u;
                precise float bitwiseValue18 = float(productValue105 & 16777215u) * 5.9604644775390625e-08f;
                float intermediateValue121 = float(int(intermediateValue84));
                precise float productValue106 = bitwiseValue18 * intermediateValue121;
                uint intermediateValue122 = uint(min(int(uint(int(productValue106))), int(sumValue59)));
                half3 productValue107 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (intermediateValue122 * 2u) * 6 + 0));
                precise float sumValue60 = float(productValue107.x) - sumValue16;
                precise float sumValue61 = float(productValue107.y) - sumValue19;
                precise float sumValue62 = float(productValue107.z) - sumValue22;
                precise float dotProductValue7 = 1.0f / dot(float3(sumValue60, sumValue61, sumValue62), float3(sumValue60, sumValue61, sumValue62));
                float intermediateValue138;
                uint intermediateValue139;
                float intermediateValue140;
                if (dotProductValue7 > 0.0f)
                {
                    intermediateValue[0u] = intermediateValue122;
                    intermediateValue138 = dotProductValue7;
                    intermediateValue139 = 1u;
                    intermediateValue140 = dotProductValue7;
                }
                else
                {
                    intermediateValue138 = -1.0f;
                    intermediateValue139 = 0u;
                    intermediateValue140 = 0.0f;
                }
                intermediateValue[1u] = 0u;
                uint productValue124 = (productValue105 * 1664525u) + 1013904223u;
                precise float bitwiseValue28 = float(productValue124 & 16777215u) * 5.9604644775390625e-08f;
                precise float productValue125 = bitwiseValue28 * intermediateValue121;
                uint intermediateValue141 = uint(min(int(uint(int(productValue125))), int(sumValue59)));
                half3 productValue126 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (intermediateValue141 * 2u) * 6 + 0));
                precise float sumValue73 = float(productValue126.x) - sumValue16;
                precise float sumValue74 = float(productValue126.y) - sumValue19;
                precise float sumValue75 = float(productValue126.z) - sumValue22;
                precise float dotProductValue9 = 1.0f / dot(float3(sumValue73, sumValue74, sumValue75), float3(sumValue73, sumValue74, sumValue75));
                float intermediateValue154;
                uint sumValue88;
                float intermediateValue155;
                if (dotProductValue9 > 0.0f)
                {
                    float sumValue87 = dotProductValue9 + intermediateValue140;
                    intermediateValue[1u] = intermediateValue141;
                    intermediateValue154 = sumValue87;
                    sumValue88 = intermediateValue139 + 1u;
                    intermediateValue155 = sumValue87;
                }
                else
                {
                    intermediateValue154 = -1.0f;
                    sumValue88 = intermediateValue139;
                    intermediateValue155 = intermediateValue140;
                }
                intermediateValue[2u] = 0u;
                uint productValue145 = (productValue124 * 1664525u) + 1013904223u;
                precise float bitwiseValue44 = float(productValue145 & 16777215u) * 5.9604644775390625e-08f;
                precise float productValue146 = bitwiseValue44 * intermediateValue121;
                uint intermediateValue156 = uint(min(int(uint(int(productValue146))), int(sumValue59)));
                half3 productValue147 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (intermediateValue156 * 2u) * 6 + 0));
                precise float sumValue89 = float(productValue147.x) - sumValue16;
                precise float sumValue90 = float(productValue147.y) - sumValue19;
                precise float sumValue91 = float(productValue147.z) - sumValue22;
                precise float dotProductValue11 = 1.0f / dot(float3(sumValue89, sumValue90, sumValue91), float3(sumValue89, sumValue90, sumValue91));
                float intermediateValue177;
                uint sumValue105;
                float intermediateValue178;
                if (dotProductValue11 > 0.0f)
                {
                    float sumValue104 = dotProductValue11 + intermediateValue155;
                    intermediateValue[2u] = intermediateValue156;
                    intermediateValue177 = sumValue104;
                    sumValue105 = sumValue88 + 1u;
                    intermediateValue178 = sumValue104;
                }
                else
                {
                    intermediateValue177 = -1.0f;
                    sumValue105 = sumValue88;
                    intermediateValue178 = intermediateValue155;
                }
                intermediateValue[3u] = 0u;
                uint productValue175 = (productValue145 * 1664525u) + 1013904223u;
                precise float bitwiseValue60 = float(productValue175 & 16777215u) * 5.9604644775390625e-08f;
                precise float productValue176 = bitwiseValue60 * intermediateValue121;
                uint intermediateValue179 = uint(min(int(uint(int(productValue176))), int(sumValue59)));
                half3 productValue177 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (intermediateValue179 * 2u) * 6 + 0));
                precise float sumValue106 = float(productValue177.x) - sumValue16;
                precise float sumValue107 = float(productValue177.y) - sumValue19;
                precise float sumValue108 = float(productValue177.z) - sumValue22;
                precise float dotProductValue12 = 1.0f / dot(float3(sumValue106, sumValue107, sumValue108), float3(sumValue106, sumValue107, sumValue108));
                float intermediateValue188;
                uint sumValue114;
                float intermediateValue189;
                if (dotProductValue12 > 0.0f)
                {
                    float sumValue113 = dotProductValue12 + intermediateValue178;
                    intermediateValue[3u] = intermediateValue179;
                    intermediateValue188 = sumValue113;
                    sumValue114 = sumValue105 + 1u;
                    intermediateValue189 = sumValue113;
                }
                else
                {
                    intermediateValue188 = -1.0f;
                    sumValue114 = sumValue105;
                    intermediateValue189 = intermediateValue178;
                }
                intermediateValue[4u] = 0u;
                uint productValue185 = (productValue175 * 1664525u) + 1013904223u;
                precise float bitwiseValue63 = float(productValue185 & 16777215u) * 5.9604644775390625e-08f;
                precise float productValue186 = bitwiseValue63 * intermediateValue121;
                uint intermediateValue190 = uint(min(int(uint(int(productValue186))), int(sumValue59)));
                half3 productValue187 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (intermediateValue190 * 2u) * 6 + 0));
                precise float sumValue115 = float(productValue187.x) - sumValue16;
                precise float sumValue116 = float(productValue187.y) - sumValue19;
                precise float sumValue117 = float(productValue187.z) - sumValue22;
                precise float dotProductValue13 = 1.0f / dot(float3(sumValue115, sumValue116, sumValue117), float3(sumValue115, sumValue116, sumValue117));
                float intermediateValue203;
                uint sumValue134;
                float intermediateValue204;
                if (dotProductValue13 > 0.0f)
                {
                    float sumValue133 = dotProductValue13 + intermediateValue189;
                    intermediateValue[4u] = intermediateValue190;
                    intermediateValue203 = sumValue133;
                    sumValue134 = sumValue114 + 1u;
                    intermediateValue204 = sumValue133;
                }
                else
                {
                    intermediateValue203 = -1.0f;
                    sumValue134 = sumValue114;
                    intermediateValue204 = intermediateValue189;
                }
                intermediateValue[5u] = 0u;
                uint productValue215 = (productValue185 * 1664525u) + 1013904223u;
                precise float bitwiseValue81 = float(productValue215 & 16777215u) * 5.9604644775390625e-08f;
                precise float productValue216 = bitwiseValue81 * intermediateValue121;
                uint intermediateValue205 = uint(min(int(uint(int(productValue216))), int(sumValue59)));
                half3 productValue217 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (intermediateValue205 * 2u) * 6 + 0));
                precise float sumValue135 = float(productValue217.x) - sumValue16;
                precise float sumValue136 = float(productValue217.y) - sumValue19;
                precise float sumValue137 = float(productValue217.z) - sumValue22;
                precise float dotProductValue15 = 1.0f / dot(float3(sumValue135, sumValue136, sumValue137), float3(sumValue135, sumValue136, sumValue137));
                float intermediateValue212;
                uint sumValue143;
                float intermediateValue213;
                if (dotProductValue15 > 0.0f)
                {
                    float sumValue142 = dotProductValue15 + intermediateValue204;
                    intermediateValue[5u] = intermediateValue205;
                    intermediateValue212 = sumValue142;
                    sumValue143 = sumValue134 + 1u;
                    intermediateValue213 = sumValue142;
                }
                else
                {
                    intermediateValue212 = -1.0f;
                    sumValue143 = sumValue134;
                    intermediateValue213 = intermediateValue204;
                }
                intermediateValue[6u] = 0u;
                uint productValue222 = (productValue215 * 1664525u) + 1013904223u;
                precise float bitwiseValue83 = float(productValue222 & 16777215u) * 5.9604644775390625e-08f;
                precise float productValue223 = bitwiseValue83 * intermediateValue121;
                uint intermediateValue214 = uint(min(int(uint(int(productValue223))), int(sumValue59)));
                half3 productValue224 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (intermediateValue214 * 2u) * 6 + 0));
                precise float sumValue144 = float(productValue224.x) - sumValue16;
                precise float sumValue145 = float(productValue224.y) - sumValue19;
                precise float sumValue146 = float(productValue224.z) - sumValue22;
                precise float dotProductValue16 = 1.0f / dot(float3(sumValue144, sumValue145, sumValue146), float3(sumValue144, sumValue145, sumValue146));
                float intermediateValue216;
                uint sumValue157;
                float intermediateValue217;
                if (dotProductValue16 > 0.0f)
                {
                    float sumValue156 = dotProductValue16 + intermediateValue213;
                    intermediateValue[6u] = intermediateValue214;
                    intermediateValue216 = sumValue156;
                    sumValue157 = sumValue143 + 1u;
                    intermediateValue217 = sumValue156;
                }
                else
                {
                    intermediateValue216 = -1.0f;
                    sumValue157 = sumValue143;
                    intermediateValue217 = intermediateValue213;
                }
                intermediateValue[7u] = 0u;
                uint productValue236 = (productValue222 * 1664525u) + 1013904223u;
                precise float bitwiseValue96 = float(productValue236 & 16777215u) * 5.9604644775390625e-08f;
                precise float productValue237 = bitwiseValue96 * intermediateValue121;
                uint intermediateValue218 = uint(min(int(uint(int(productValue237))), int(sumValue59)));
                half3 productValue238 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (intermediateValue218 * 2u) * 6 + 0));
                precise float sumValue158 = float(productValue238.x) - sumValue16;
                precise float sumValue159 = float(productValue238.y) - sumValue19;
                precise float sumValue160 = float(productValue238.z) - sumValue22;
                precise float dotProductValue17 = 1.0f / dot(float3(sumValue158, sumValue159, sumValue160), float3(sumValue158, sumValue159, sumValue160));
                float intermediateValue221;
                uint sumValue164;
                float intermediateValue222;
                if (dotProductValue17 > 0.0f)
                {
                    float sumValue163 = dotProductValue17 + intermediateValue217;
                    intermediateValue[7u] = intermediateValue218;
                    intermediateValue221 = sumValue163;
                    sumValue164 = sumValue157 + 1u;
                    intermediateValue222 = sumValue163;
                }
                else
                {
                    intermediateValue221 = -1.0f;
                    sumValue164 = sumValue157;
                    intermediateValue222 = intermediateValue217;
                }
                bool comparisonValue42 = sumValue164 == 0u;
                float intermediateValue227;
                uint intermediateValue228;
                half intermediateValue229;
                half intermediateValue231;
                half intermediateValue233;
                uint intermediateValue235;
                if (comparisonValue42)
                {
                    intermediateValue227 = intermediateValue13;
                    intermediateValue228 = 0u;
                    intermediateValue229 = half(0.0);
                    intermediateValue231 = half(0.0);
                    intermediateValue233 = half(0.0);
                    intermediateValue235 = productValue236;
                }
                else
                {
                    uint intermediateValue261;
                    uint productValue270;
                    float bitwiseValue104;
                    bool intermediateValue236;
                    for (;;)
                    {
                        productValue270 = (productValue236 * 1664525u) + 1013904223u;
                        bitwiseValue104 = (float(productValue270 & 16777215u) * 5.9604584379258085391484200954437e-08f) * intermediateValue222;
                        intermediateValue236 = intermediateValue138 > bitwiseValue104;
                        uint intermediateValue245;
                        if (intermediateValue236)
                        {
                            intermediateValue245 = 0u;
                        }
                        else
                        {
                            uint branchMergedValue32;
                            if (intermediateValue154 > bitwiseValue104)
                            {
                                branchMergedValue32 = 1u;
                            }
                            else
                            {
                                uint branchMergedValue94;
                                if (intermediateValue177 > bitwiseValue104)
                                {
                                    branchMergedValue94 = 2u;
                                }
                                else
                                {
                                    uint branchMergedValue104;
                                    if (intermediateValue188 > bitwiseValue104)
                                    {
                                        branchMergedValue104 = 3u;
                                    }
                                    else
                                    {
                                        uint branchMergedValue105;
                                        if (intermediateValue203 > bitwiseValue104)
                                        {
                                            branchMergedValue105 = 4u;
                                        }
                                        else
                                        {
                                            uint branchMergedValue106;
                                            if (intermediateValue212 > bitwiseValue104)
                                            {
                                                branchMergedValue106 = 5u;
                                            }
                                            else
                                            {
                                                uint branchMergedValue107;
                                                if (intermediateValue216 > bitwiseValue104)
                                                {
                                                    branchMergedValue107 = 6u;
                                                }
                                                else
                                                {
                                                    if (!(intermediateValue221 > bitwiseValue104))
                                                    {
                                                        intermediateValue261 = 0u;
                                                        break;
                                                    }
                                                    branchMergedValue107 = 7u;
                                                }
                                                branchMergedValue106 = branchMergedValue107;
                                            }
                                            branchMergedValue105 = branchMergedValue106;
                                        }
                                        branchMergedValue104 = branchMergedValue105;
                                    }
                                    branchMergedValue94 = branchMergedValue104;
                                }
                                branchMergedValue32 = branchMergedValue94;
                            }
                            intermediateValue245 = branchMergedValue32;
                        }
                        intermediateValue261 = intermediateValue[intermediateValue245];
                        break;
                    }
                    half3 productValue292 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (intermediateValue261 * 2u) * 6 + 0));
                    half intermediateValue230 = productValue292.x;
                    half intermediateValue232 = productValue292.y;
                    half intermediateValue234 = productValue292.z;
                    float sumValue195 = float(intermediateValue230) - sumValue16;
                    float sumValue196 = float(intermediateValue232) - sumValue19;
                    float sumValue197 = float(intermediateValue234) - sumValue22;
                    intermediateValue227 = 1.0f / (viewCbConstants[96u].z * dot(float3(sumValue195, sumValue196, sumValue197), float3(sumValue195, sumValue196, sumValue197)));
                    intermediateValue228 = rdByteLoad_inputLightsBuffer_uint(0u, ((intermediateValue261 * 3u) + 2u) * 4 + 0);
                    intermediateValue229 = intermediateValue230;
                    intermediateValue231 = intermediateValue232;
                    intermediateValue233 = intermediateValue234;
                    intermediateValue235 = productValue270;
                }
                float branchMergedValue30;
                float branchMergedValue48;
                float branchMergedValue49;
                uint branchMergedValue50;
                float branchMergedValue51;
                float branchMergedValue52;
                float branchMergedValue53;
                if (comparisonValue42)
                {
                    branchMergedValue30 = 0.0f;
                    branchMergedValue48 = 0.0f;
                    branchMergedValue49 = 0.0f;
                    branchMergedValue50 = 0u;
                    branchMergedValue51 = 0.0f;
                    branchMergedValue52 = 0.0f;
                    branchMergedValue53 = 0.0f;
                }
                else
                {
                    float comparisonValue46 = (int(intermediateValue228) < int(0u)) ? 0.23000000417232513427734375f : 0.115000002086162567138671875f;
                    float bitwiseValue105 = float(((intermediateValue235 * 1664525u) + 7271263u) & 16777215u);
                    float productValue277 = bitwiseValue105 * 0.002414158545434474945068359375f;
                    float productValue278 = (productValue277 - floor(productValue277)) * 6.283185482025146484375f;
                    float productValue279 = 0.9999847412109375f - (bitwiseValue105 * 1.1920928955078125e-07f);
                    float clampedValue3 = sqrt(clamp(1.0f - (productValue279 * productValue279), 0.0f, 1.0f)) * comparisonValue46;
                    float wavePhaseValue2 = clampedValue3 * cos(productValue278);
                    float wavePhaseValue3 = sin(productValue278) * clampedValue3;
                    float productValue280 = productValue279 * comparisonValue46;
                    bool dotProductValue19 = dot(float3(wavePhaseValue2, wavePhaseValue3, productValue280), float3(float(intermediateValue229) - sumValue16, float(intermediateValue231) - sumValue19, float(intermediateValue233) - sumValue22)) > 0.0f;
                    float comparisonValue47 = float(half(dotProductValue19 ? ((-0.0f) - wavePhaseValue2) : wavePhaseValue2) + intermediateValue229) - sumValue16;
                    float comparisonValue48 = float(half(dotProductValue19 ? ((-0.0f) - wavePhaseValue3) : wavePhaseValue3) + intermediateValue231) - sumValue19;
                    float comparisonValue49 = float(half(dotProductValue19 ? ((-0.0f) - productValue280) : productValue280) + intermediateValue233) - sumValue22;
                    float inverseLengthValue4 = rsqrt(dot(float3(comparisonValue47, comparisonValue48, comparisonValue49), float3(comparisonValue47, comparisonValue48, comparisonValue49)));
                    float productValue102 = comparisonValue47 * inverseLengthValue4;
                    float productValue103 = comparisonValue48 * inverseLengthValue4;
                    float productValue104 = comparisonValue49 * inverseLengthValue4;
                    uint productValue281 = uint(int(productValue46 * 256.0f));
                    uint productValue282 = uint(int(productValue47 * 256.0f));
                    uint productValue283 = uint(int(productValue48 * 256.0f));
                    RayDesc _13ident = {float3((abs(sumValue16) < 0.03125f) ? ((productValue46 * 1.52587890625e-05f) + sumValue16) : asfloat(((sumValue16 < 0.0f) ? (-productValue281) : productValue281) + asuint(sumValue16)), (abs(sumValue19) < 0.03125f) ? ((productValue47 * 1.52587890625e-05f) + sumValue19) : asfloat(((sumValue19 < 0.0f) ? (-productValue282) : productValue282) + asuint(sumValue19)), (abs(sumValue22) < 0.03125f) ? ((productValue48 * 1.52587890625e-05f) + sumValue22) : asfloat(((sumValue22 < 0.0f) ? (-productValue283) : productValue283) + asuint(sumValue22))), 0.00999999977648258209228515625f, float3(productValue102, productValue103, productValue104), sqrt(((comparisonValue47 * comparisonValue47) + (comparisonValue48 * comparisonValue48)) + (comparisonValue49 * comparisonValue49)) + (-0.00999999977648258209228515625f)};
                    intermediateValue243.TraceRayInline(SceneBVH, 512u, 2u, _13ident);
                    bool intermediateValue244 = intermediateValue243.Proceed();
                    if (intermediateValue244)
                    {
                        bool intermediateValue283;
                        bool comparisonValue53;
                        for (;;)
                        {
                            uint intermediateValue265 = intermediateValue243.CandidateType();
                            comparisonValue53 = intermediateValue265 == 0u;
                            if (comparisonValue53)
                            {
                                float2 intermediateValue278 = intermediateValue243.CandidateTriangleBarycentrics();
                                float2 intermediateValue279 = intermediateValue243.CandidateTriangleBarycentrics();
                                uint intermediateValue280 = intermediateValue243.CandidatePrimitiveIndex();
                                uint intermediateValue281 = intermediateValue243.CandidateInstanceID();
                                uint intermediateValue282 = intermediateValue243.CandidateInstanceIndex();
                                uint productValue296 = (intermediateValue282 * 76u) + 58u;
                                uint productValue297 = (intermediateValue282 * 76u) + 61u;
                                precise float sumValue199 = 1.0f - intermediateValue278.x;
                                precise float sumValue200 = sumValue199 - intermediateValue279.y;
                                uint bitwiseValue106 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue282 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue280 >> 1u);
                                uint productValue298 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue282 * 76u) + 54u) * 2 + 0)) + 0u;
                                bool comparisonValue55 = (intermediateValue280 & 1u) == 0u;
                                uint comparisonValue56 = comparisonValue55 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue298), bitwiseValue106 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue298), bitwiseValue106 * 16 + 0).x;
                                uint comparisonValue57 = comparisonValue55 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue298), bitwiseValue106 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue298), bitwiseValue106 * 16 + 0).w;
                                uint comparisonValue58 = comparisonValue55 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue298), bitwiseValue106 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue298), bitwiseValue106 * 16 + 0).z;
                                bool productValue299 = rdByteLoad_objectInstances_uint16_t(0u, productValue297 * 2 + 0) < 0u;
                                float intermediateValue315;
                                float intermediateValue316;
                                if (productValue299)
                                {
                                    uint bitwiseValue109 = comparisonValue58 >> 15u;
                                    precise float bitwiseValue110 = float(bitwiseValue109 & 1u) * 2.0f;
                                    precise float sumValue219 = bitwiseValue110 + (-1.0f);
                                    precise float bitwiseValue111 = float(comparisonValue58 >> 31u) * 2.0f;
                                    precise float sumValue220 = bitwiseValue111 + (-1.0f);
                                    precise float bitwiseValue112 = float((comparisonValue58 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue113 = float(bitwiseValue109 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue324 = sumValue219 * 3.0517578125e-05f;
                                    precise float productValue325 = sumValue220 * 3.0517578125e-05f;
                                    precise float sumValue221 = bitwiseValue112 + productValue324;
                                    precise float sumValue222 = bitwiseValue113 + productValue325;
                                    intermediateValue315 = sumValue221;
                                    intermediateValue316 = sumValue222;
                                }
                                else
                                {
                                    precise float bitwiseValue114 = float(comparisonValue58 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue115 = float(comparisonValue58 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue326 = bitwiseValue114 * 16384.0f;
                                    precise float sumValue223 = productValue326 + 0.5f;
                                    precise float productValue327 = bitwiseValue115 * 16384.0f;
                                    precise float sumValue224 = productValue327 + 0.5f;
                                    precise float productValue328 = floor(sumValue223) * 6.103515625e-05f;
                                    precise float productValue329 = floor(sumValue224) * 6.103515625e-05f;
                                    intermediateValue315 = productValue328;
                                    intermediateValue316 = productValue329;
                                }
                                precise float productValue340 = sumValue200 * intermediateValue315;
                                precise float productValue341 = sumValue200 * intermediateValue316;
                                precise float sumValue237 = productValue340 + 0.0f;
                                precise float sumValue238 = productValue341 + 0.0f;
                                float intermediateValue360;
                                float intermediateValue361;
                                if (productValue299)
                                {
                                    uint bitwiseValue123 = comparisonValue57 >> 15u;
                                    precise float bitwiseValue124 = float(bitwiseValue123 & 1u) * 2.0f;
                                    precise float sumValue241 = bitwiseValue124 + (-1.0f);
                                    precise float bitwiseValue125 = float(comparisonValue57 >> 31u) * 2.0f;
                                    precise float sumValue242 = bitwiseValue125 + (-1.0f);
                                    precise float bitwiseValue126 = float((comparisonValue57 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue127 = float(bitwiseValue123 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue344 = sumValue241 * 3.0517578125e-05f;
                                    precise float productValue345 = sumValue242 * 3.0517578125e-05f;
                                    precise float sumValue243 = bitwiseValue126 + productValue344;
                                    precise float sumValue244 = bitwiseValue127 + productValue345;
                                    intermediateValue360 = sumValue243;
                                    intermediateValue361 = sumValue244;
                                }
                                else
                                {
                                    precise float bitwiseValue128 = float(comparisonValue57 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue129 = float(comparisonValue57 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue346 = bitwiseValue128 * 16384.0f;
                                    precise float sumValue245 = productValue346 + 0.5f;
                                    precise float productValue347 = bitwiseValue129 * 16384.0f;
                                    precise float sumValue246 = productValue347 + 0.5f;
                                    precise float productValue348 = floor(sumValue245) * 6.103515625e-05f;
                                    precise float productValue349 = floor(sumValue246) * 6.103515625e-05f;
                                    intermediateValue360 = productValue348;
                                    intermediateValue361 = productValue349;
                                }
                                precise float productValue364 = intermediateValue278.x * intermediateValue360;
                                precise float productValue365 = intermediateValue278.x * intermediateValue361;
                                precise float sumValue257 = sumValue237 + productValue364;
                                precise float sumValue258 = sumValue238 + productValue365;
                                float intermediateValue382;
                                float intermediateValue383;
                                if (productValue299)
                                {
                                    uint bitwiseValue156 = comparisonValue56 >> 15u;
                                    precise float bitwiseValue157 = float(bitwiseValue156 & 1u) * 2.0f;
                                    precise float sumValue273 = bitwiseValue157 + (-1.0f);
                                    precise float bitwiseValue158 = float(comparisonValue56 >> 31u) * 2.0f;
                                    precise float sumValue274 = bitwiseValue158 + (-1.0f);
                                    precise float bitwiseValue159 = float((comparisonValue56 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue160 = float(bitwiseValue156 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue380 = sumValue273 * 3.0517578125e-05f;
                                    precise float productValue381 = sumValue274 * 3.0517578125e-05f;
                                    precise float sumValue275 = bitwiseValue159 + productValue380;
                                    precise float sumValue276 = bitwiseValue160 + productValue381;
                                    intermediateValue382 = sumValue275;
                                    intermediateValue383 = sumValue276;
                                }
                                else
                                {
                                    precise float bitwiseValue161 = float(comparisonValue56 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue162 = float(comparisonValue56 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue382 = bitwiseValue161 * 16384.0f;
                                    precise float sumValue277 = productValue382 + 0.5f;
                                    precise float productValue383 = bitwiseValue162 * 16384.0f;
                                    precise float sumValue278 = productValue383 + 0.5f;
                                    precise float productValue384 = floor(sumValue277) * 6.103515625e-05f;
                                    precise float productValue385 = floor(sumValue278) * 6.103515625e-05f;
                                    intermediateValue382 = productValue384;
                                    intermediateValue383 = productValue385;
                                }
                                precise float productValue401 = intermediateValue279.y * intermediateValue382;
                                precise float productValue402 = intermediateValue279.y * intermediateValue383;
                                precise float sumValue291 = sumValue257 + productValue401;
                                precise float sumValue292 = sumValue258 + productValue402;
                                float intermediateValue386;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue296 * 2 + 0) == 65535u)
                                {
                                    intermediateValue386 = 1.0f;
                                }
                                else
                                {
                                    uint reinterpretedBits23;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue296 * 2 + 0) > 4095u)
                                    {
                                        reinterpretedBits23 = asuint(viewCbConstants[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits23 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue296 * 2 + 0));
                                    }
                                    intermediateValue386 = textures[NonUniformResourceIndex(reinterpretedBits23 + 0u)].SampleLevel(defaultSampler, float2(sumValue291, sumValue292), -0.25f).w;
                                }
                                uint comparisonValue82;
                                if (intermediateValue281 == 2u)
                                {
                                    comparisonValue82 = 0u;
                                }
                                else
                                {
                                    comparisonValue82 = uint(intermediateValue386 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue297 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                                }
                                if (comparisonValue82 == 0u)
                                {
                                    intermediateValue243.CommitNonOpaqueTriangleHit();
                                }
                            }
                            intermediateValue283 = intermediateValue243.Proceed();
                            if (intermediateValue283)
                            {
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                    uint intermediateValue260 = intermediateValue243.CommittedStatus();
                    bool intermediateValue267;
                    if (intermediateValue260 == 1u)
                    {
                        float intermediateValue266 = intermediateValue243.CommittedRayT();
                        intermediateValue267 = !(intermediateValue266 < 10000.0f);
                    }
                    else
                    {
                        intermediateValue267 = true;
                    }
                    uint intermediateValue117 = uint(intermediateValue267);
                    float branchMergedValue91;
                    float branchMergedValue96;
                    float branchMergedValue97;
                    uint branchMergedValue98;
                    float branchMergedValue99;
                    float branchMergedValue100;
                    float branchMergedValue101;
                    if (intermediateValue267)
                    {
                        float bitwiseValue107 = (intermediateValue227 * 0.0392156876623630523681640625f) * float(intermediateValue228 & 255u);
                        float productValue300 = bitwiseValue107 * 0.00117647065781056880950927734375f;
                        branchMergedValue91 = productValue300 * float((intermediateValue228 >> 8u) & 255u);
                        branchMergedValue96 = productValue300 * float((intermediateValue228 >> 16u) & 255u);
                        branchMergedValue97 = (float((intermediateValue228 >> 24u) & 127u) * 0.00236220471560955047607421875f) * bitwiseValue107;
                        branchMergedValue98 = intermediateValue117;
                        branchMergedValue99 = productValue104;
                        branchMergedValue100 = productValue103;
                        branchMergedValue101 = productValue102;
                    }
                    else
                    {
                        branchMergedValue91 = 0.0f;
                        branchMergedValue96 = 0.0f;
                        branchMergedValue97 = 0.0f;
                        branchMergedValue98 = intermediateValue117;
                        branchMergedValue99 = productValue104;
                        branchMergedValue100 = productValue103;
                        branchMergedValue101 = productValue102;
                    }
                    branchMergedValue30 = branchMergedValue91;
                    branchMergedValue48 = branchMergedValue96;
                    branchMergedValue49 = branchMergedValue97;
                    branchMergedValue50 = branchMergedValue98;
                    branchMergedValue51 = branchMergedValue99;
                    branchMergedValue52 = branchMergedValue100;
                    branchMergedValue53 = branchMergedValue101;
                }
                intermediateValue113 = branchMergedValue53;
                intermediateValue114 = branchMergedValue52;
                intermediateValue115 = branchMergedValue51;
                intermediateValue116 = branchMergedValue50;
                intermediateValue118 = branchMergedValue49;
                intermediateValue119 = branchMergedValue48;
                intermediateValue120 = branchMergedValue30;
            }
            bool reinterpretedBits6 = (((asuint(intermediateValue118) & 2147483647u) > 2139095040u) || ((asuint(intermediateValue119) & 2147483647u) > 2139095040u)) || ((asuint(intermediateValue120) & 2147483647u) > 2139095040u);
            float branchMergedValue27;
            float branchMergedValue35;
            float branchMergedValue36;
            float branchMergedValue37;
            float branchMergedValue38;
            float branchMergedValue39;
            float branchMergedValue40;
            if (intermediateValue116 == 0u)
            {
                branchMergedValue27 = comparisonValue9;
                branchMergedValue35 = comparisonValue8;
                branchMergedValue36 = 2.0f;
                branchMergedValue37 = comparisonValue13;
                branchMergedValue38 = comparisonValue12;
                branchMergedValue39 = comparisonValue11;
                branchMergedValue40 = comparisonValue10;
            }
            else
            {
                float dotProductValue8 = dot(float3(productValue46, productValue47, productValue48), float3(intermediateValue113, intermediateValue114, intermediateValue115));
                float productValue123 = abs(dotProductValue8) * sumValue56;
                float comparisonValue27 = productValue123 * (reinterpretedBits6 ? 0.0f : intermediateValue118);
                float comparisonValue28 = productValue123 * (reinterpretedBits6 ? 0.0f : intermediateValue119);
                float comparisonValue29 = productValue123 * (reinterpretedBits6 ? 0.0f : intermediateValue120);
                bool intermediateValue137 = dotProductValue8 < 0.0f;
                branchMergedValue27 = intermediateValue137 ? comparisonValue9 : (comparisonValue28 + comparisonValue9);
                branchMergedValue35 = intermediateValue137 ? comparisonValue8 : (comparisonValue27 + comparisonValue8);
                branchMergedValue36 = 3.0f;
                branchMergedValue37 = intermediateValue137 ? (comparisonValue29 + comparisonValue13) : comparisonValue13;
                branchMergedValue38 = intermediateValue137 ? (comparisonValue28 + comparisonValue12) : comparisonValue12;
                branchMergedValue39 = intermediateValue137 ? (comparisonValue27 + comparisonValue11) : comparisonValue11;
                branchMergedValue40 = intermediateValue137 ? comparisonValue10 : (comparisonValue29 + comparisonValue10);
            }
            intermediateValue85 = branchMergedValue35;
            intermediateValue86 = branchMergedValue27;
            intermediateValue87 = branchMergedValue40;
            intermediateValue88 = branchMergedValue39;
            intermediateValue89 = branchMergedValue38;
            intermediateValue90 = branchMergedValue37;
            intermediateValue91 = branchMergedValue36;
        }
        else
        {
            intermediateValue85 = comparisonValue8;
            intermediateValue86 = comparisonValue9;
            intermediateValue87 = comparisonValue10;
            intermediateValue88 = comparisonValue11;
            intermediateValue89 = comparisonValue12;
            intermediateValue90 = comparisonValue13;
            intermediateValue91 = 2.0f;
        }
        uint16_t4 productValue86 = rdByteLoad_vertexIrradianceCache_uint16_t4(NonUniformResourceIndex(sumValue1), (productValue79 * 2u) * 8 + 0);
        half4 intermediateValue92 = (half4)f16tof32(productValue86);
        uint productValue87 = (productValue79 * 8u) + 4u;
        uint16_t productValue88 = rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue1), productValue87 * 2 + 0);
        uint16_t productValue89 = rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue1), (productValue87 + 1u) * 2 + 0);
        uint16_t productValue90 = rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue1), (productValue87 + 2u) * 2 + 0);
        half3 intermediateValue93 = (half3)f16tof32(uint16_t3(productValue88, productValue89, productValue90));
        uint productValue91 = min((uint(intermediateValue92.w) + 1u), uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue2 * 76u) + 63u) * 2 + 0)));
        float quotientValue1 = 1.0f / float(productValue91);
        float quotientValue2 = intermediateValue85 / intermediateValue91;
        float quotientValue3 = intermediateValue86 / intermediateValue91;
        float quotientValue4 = intermediateValue87 / intermediateValue91;
        float intermediateValue94 = float(intermediateValue92.x);
        float intermediateValue95 = float(intermediateValue92.y);
        float intermediateValue96 = float(intermediateValue92.z);
        float dotProductValue3 = dot(float3(intermediateValue94, intermediateValue95, intermediateValue96), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        float reinterpretedBits5 = asfloat(rdByteLoad_inputIncidentLight_uint(0u, 0));
        float dotProductValue4 = exp2(log2(reinterpretedBits5 * (((dot(float3(quotientValue2, quotientValue3, quotientValue4), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) - dotProductValue3) * quotientValue1) + dotProductValue3)) * 0.454545438289642333984375f) - exp2(log2(reinterpretedBits5 * dotProductValue3) * 0.454545438289642333984375f);
        float comparisonValue16 = (dotProductValue4 > 0.20000000298023223876953125f) ? ((0.20000000298023223876953125f / dotProductValue4) * quotientValue1) : quotientValue1;
        precise half productValue92 = half((comparisonValue16 * (quotientValue2 - intermediateValue94)) + intermediateValue94);
        precise half productValue93 = half((comparisonValue16 * (quotientValue3 - intermediateValue95)) + intermediateValue95);
        precise half productValue94 = half((comparisonValue16 * (quotientValue4 - intermediateValue96)) + intermediateValue96);
        float quotientValue5 = intermediateValue88 / intermediateValue91;
        float quotientValue6 = intermediateValue89 / intermediateValue91;
        float quotientValue7 = intermediateValue90 / intermediateValue91;
        float intermediateValue97 = float(intermediateValue93.x);
        float intermediateValue98 = float(intermediateValue93.y);
        float intermediateValue99 = float(intermediateValue93.z);
        float dotProductValue5 = dot(float3(intermediateValue97, intermediateValue98, intermediateValue99), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        float dotProductValue6 = exp2(log2((((dot(float3(quotientValue5, quotientValue6, quotientValue7), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) - dotProductValue5) * quotientValue1) + dotProductValue5) * reinterpretedBits5) * 0.454545438289642333984375f) - exp2(log2(dotProductValue5 * reinterpretedBits5) * 0.454545438289642333984375f);
        float comparisonValue17 = (dotProductValue6 > 0.20000000298023223876953125f) ? ((0.20000000298023223876953125f / dotProductValue6) * quotientValue1) : quotientValue1;
        precise half productValue95 = half((comparisonValue17 * (quotientValue5 - intermediateValue97)) + intermediateValue97);
        precise half productValue96 = half((comparisonValue17 * (quotientValue6 - intermediateValue98)) + intermediateValue98);
        precise half productValue97 = half((comparisonValue17 * (quotientValue7 - intermediateValue99)) + intermediateValue99);
        if (!((((asuint(float(productValue94)) & 2147483647u) > 2139095040u) || (((asuint(float(productValue92)) & 2147483647u) > 2139095040u) || ((asuint(float(productValue93)) & 2147483647u) > 2139095040u))) || (((asuint(float(productValue97)) & 2147483647u) > 2139095040u) || (((asuint(float(productValue95)) & 2147483647u) > 2139095040u) || ((asuint(float(productValue96)) & 2147483647u) > 2139095040u)))))
        {
            rdByteStore_vertexIrradianceCache_uint16_t4(NonUniformResourceIndex(sumValue1), (productValue79 * 2u) * 8 + 0, uint16_t4((uint16_t)f32tof16(productValue92), (uint16_t)f32tof16(productValue93), (uint16_t)f32tof16(productValue94), (uint16_t)f32tof16(half(productValue91))));
            rdByteStore_vertexIrradianceCache_uint16_t4(NonUniformResourceIndex(sumValue1), ((productValue79 * 2u) + 1u) * 8 + 0, uint16_t4((uint16_t)f32tof16(productValue95), (uint16_t)f32tof16(productValue96), (uint16_t)f32tof16(productValue97), (uint16_t)f32tof16(half(0.0))));
        }
    }
}

[numthreads(32, 1, 1)]
void main(ComputeStageInput stage_input)
{
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    executeComputeStage();
}
