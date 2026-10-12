// Native descriptor classes and spaces are preserved independently.
#include "../../include/ProjectConfig.h"
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

static uint3 gl_WorkGroupID;
static uint3 gl_LocalInvocationID;
struct ComputeStageInput
{
    uint3 gl_WorkGroupID : SV_GroupID;
    uint3 gl_LocalInvocationID : SV_GroupThreadID;
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

uint UDiv(uint num, uint den)
{
    uint intermediateValue5;
    [flatten]
    if (den == 0u)
    {
        intermediateValue5 = 4294967295u;
    }
    else
    {
        intermediateValue5 = num / den;
    }
    return intermediateValue5;
}

uint UMod(uint num, uint den)
{
    uint intermediateValue6;
    [flatten]
    if (den == 0u)
    {
        intermediateValue6 = 4294967295u;
    }
    else
    {
        intermediateValue6 = num % den;
    }
    return intermediateValue6;
}

void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
    uint intermediateValue4 = reinterpretedBits.z;
    uint bitwiseValue = gl_WorkGroupID.y >> 4u;
    uint bitwiseValue1 = ((intermediateValue4 & 1023u) * (gl_WorkGroupID.y & 15u)) + gl_WorkGroupID.x;
    uint comparisonValue = (bitwiseValue == ((intermediateValue4 >> 14u) & 63u)) ? ((intermediateValue4 >> 10u) & 15u) : 16u;
    uint bitwiseValue2 = (UDiv(bitwiseValue1, comparisonValue) << 2u) + gl_LocalInvocationID.x;
    uint bitwiseValue3 = ((UMod(bitwiseValue1, comparisonValue) + (bitwiseValue << 4u)) << 3u) + gl_LocalInvocationID.y;
    bool reinterpretedBits1 = asuint(viewCbConstants[96u]).x != 0u;
    float reinterpretedBits2 = asfloat(rdByteLoad_inputIncidentLight_uint(0u, 0));
    float4 loadedBufferValue = inputBufferPrimaryPathLength.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
    float intermediateValue7 = loadedBufferValue.x;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if (intermediateValue7 == 65504.0f)
    {
        intermediateValue8 = 0.0f;
        intermediateValue9 = 0.0f;
        intermediateValue10 = 0.0f;
        intermediateValue12 = 0.0f;
        intermediateValue13 = 0.0f;
        intermediateValue14 = 0.0f;
        intermediateValue15 = 0.0f;
    }
    else
    {
        float4 loadedBufferValue1 = inputBufferNormal.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float intermediateValue16 = loadedBufferValue1.x;
        float intermediateValue17 = loadedBufferValue1.y;
        precise float sumValue = 1.0f - abs(intermediateValue16);
        float intermediateValue18 = abs(intermediateValue17);
        precise float sumValue1 = sumValue - intermediateValue18;
        bool intermediateValue19 = sumValue1 < 0.0f;
        precise float sumValue2 = 1.0f - intermediateValue18;
        precise float comparisonValue2 = ((intermediateValue16 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue2;
        precise float comparisonValue3 = sumValue * ((intermediateValue17 >= 0.0f) ? 1.0f : (-1.0f));
        float comparisonValue4 = intermediateValue19 ? comparisonValue2 : intermediateValue16;
        float comparisonValue5 = intermediateValue19 ? comparisonValue3 : intermediateValue17;
        float inverseLengthValue = rsqrt(dot(float3(comparisonValue4, comparisonValue5, sumValue1), float3(comparisonValue4, comparisonValue5, sumValue1)));
        precise float productValue2 = inverseLengthValue * comparisonValue4;
        precise float productValue3 = inverseLengthValue * comparisonValue5;
        precise float productValue4 = sumValue1 * inverseLengthValue;
        float comparisonValue6 = ((productValue4 != 0.0f) || ((productValue2 != 0.0f) || (productValue3 != 0.0f))) ? productValue4 : 1.0f;
        float inverseLengthValue1 = rsqrt(dot(float3(productValue2, productValue3, comparisonValue6), float3(productValue2, productValue3, comparisonValue6)));
        precise float productValue5 = productValue3 * inverseLengthValue1;
        float4 loadedBufferValue2 = inputGeometryNormal.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float intermediateValue20 = loadedBufferValue2.x;
        float intermediateValue21 = loadedBufferValue2.y;
        precise float sumValue3 = 1.0f - abs(intermediateValue20);
        float intermediateValue22 = abs(intermediateValue21);
        precise float sumValue4 = sumValue3 - intermediateValue22;
        bool intermediateValue23 = sumValue4 < 0.0f;
        precise float sumValue5 = 1.0f - intermediateValue22;
        precise float comparisonValue7 = ((intermediateValue20 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue5;
        precise float comparisonValue8 = sumValue3 * ((intermediateValue21 >= 0.0f) ? 1.0f : (-1.0f));
        float comparisonValue9 = intermediateValue23 ? comparisonValue7 : intermediateValue20;
        float comparisonValue10 = intermediateValue23 ? comparisonValue8 : intermediateValue21;
        float inverseLengthValue2 = rsqrt(dot(float3(comparisonValue9, comparisonValue10, sumValue4), float3(comparisonValue9, comparisonValue10, sumValue4)));
        precise float productValue6 = inverseLengthValue2 * comparisonValue10;
        float4 loadedBufferValue3 = inputPrimaryWorldPosition.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float intermediateValue24 = loadedBufferValue3.y;
        outputBufferEmissiveAndLinearRoughness[uint2(bitwiseValue2, bitwiseValue3)] = float4(outputBufferEmissiveAndLinearRoughness[uint2(bitwiseValue2, bitwiseValue3)].xxxx).x;
        uint4 reinterpretedBits7 = asuint(viewCbConstants[84u]);
        uint intermediateValue25 = reinterpretedBits7.z;
        precise float productValue7 = productValue2 * inverseLengthValue1;
        precise float productValue8 = inverseLengthValue1 * comparisonValue6;
        precise float productValue9 = inverseLengthValue2 * comparisonValue9;
        precise float productValue10 = sumValue4 * inverseLengthValue2;
        float intermediateValue26 = loadedBufferValue3.x;
        float intermediateValue27 = loadedBufferValue3.z;
        uint productValue11 = uint(int(productValue9 * 256.0f));
        uint productValue12 = uint(int(productValue6 * 256.0f));
        uint productValue13 = uint(int(productValue10 * 256.0f));
        float reinterpretedBits8 = (abs(intermediateValue26) < 0.03125f) ? (intermediateValue26 + (productValue9 * 1.52587890625e-05f)) : asfloat(((intermediateValue26 < 0.0f) ? (-productValue11) : productValue11) + asuint(intermediateValue26));
        float reinterpretedBits9 = (abs(intermediateValue24) < 0.03125f) ? (intermediateValue24 + (productValue6 * 1.52587890625e-05f)) : asfloat(((intermediateValue24 < 0.0f) ? (-productValue12) : productValue12) + asuint(intermediateValue24));
        float reinterpretedBits10 = (abs(intermediateValue27) < 0.03125f) ? (intermediateValue27 + (productValue10 * 1.52587890625e-05f)) : asfloat(((intermediateValue27 < 0.0f) ? (-productValue13) : productValue13) + asuint(intermediateValue27));
        float4 loadedBufferValue4 = blueNoiseTexture.Load(int4(uint3(bitwiseValue2 & 255u, bitwiseValue3 & 255u, (intermediateValue25 >> 1u) & 127u), 0u));
        bool comparisonValue11 = (intermediateValue25 & 1u) == 0u;
        float comparisonValue12 = comparisonValue11 ? loadedBufferValue4.x : loadedBufferValue4.z;
        float nonlinearValue = sqrt(comparisonValue12);
        precise float comparisonValue13 = (comparisonValue11 ? loadedBufferValue4.y : loadedBufferValue4.w) * 6.283185482025146484375f;
        precise float wavePhaseValue = nonlinearValue * cos(comparisonValue13);
        precise float wavePhaseValue1 = nonlinearValue * sin(comparisonValue13);
        precise float sumValue6 = 1.0f - comparisonValue12;
        float nonlinearValue1 = sqrt(sumValue6);
        float branchMergedValue12;
        float branchMergedValue26;
        float branchMergedValue27;
        float branchMergedValue28;
        float branchMergedValue29;
        float branchMergedValue30;
        float branchMergedValue31;
        if (reinterpretedBits1)
        {
            bool dotProductValue = dot(float3(0.847100675106048583984375f, 0.2079117000102996826171875f, 0.489073812961578369140625f), float3(productValue9, productValue6, productValue10)) > 0.949999988079071044921875f;
            float comparisonValue14 = dotProductValue ? (-0.639436304569244384765625f) : 0.847100675106048583984375f;
            float comparisonValue15 = dotProductValue ? (-0.3907311260700225830078125f) : 0.2079117000102996826171875f;
            float comparisonValue16 = dotProductValue ? 0.6621558666229248046875f : 0.489073812961578369140625f;
            precise float dotProductValue1 = dot(float3(comparisonValue14, comparisonValue15, comparisonValue16), float3(productValue9, productValue6, productValue10));
            precise float productValue14 = productValue9 * dotProductValue1;
            precise float productValue15 = productValue6 * dotProductValue1;
            precise float productValue16 = productValue10 * dotProductValue1;
            precise float sumValue7 = comparisonValue14 - productValue14;
            precise float sumValue8 = comparisonValue15 - productValue15;
            precise float sumValue9 = comparisonValue16 - productValue16;
            float inverseLengthValue3 = rsqrt(dot(float3(sumValue7, sumValue8, sumValue9), float3(sumValue7, sumValue8, sumValue9)));
            precise float productValue17 = sumValue7 * inverseLengthValue3;
            precise float productValue18 = sumValue8 * inverseLengthValue3;
            precise float productValue19 = sumValue9 * inverseLengthValue3;
            precise float productValue20 = productValue6 * productValue19;
            precise float productValue21 = productValue10 * productValue18;
            precise float sumValue10 = productValue20 - productValue21;
            precise float productValue22 = productValue10 * productValue17;
            precise float productValue23 = productValue9 * productValue19;
            precise float sumValue11 = productValue22 - productValue23;
            precise float productValue24 = productValue9 * productValue18;
            precise float productValue25 = productValue6 * productValue17;
            precise float sumValue12 = productValue24 - productValue25;
            precise float productValue26 = wavePhaseValue * productValue17;
            precise float productValue27 = wavePhaseValue1 * sumValue10;
            precise float sumValue13 = productValue27 + productValue26;
            precise float productValue28 = nonlinearValue1 * productValue9;
            precise float sumValue14 = productValue28 + sumValue13;
            precise float productValue29 = wavePhaseValue * productValue18;
            precise float productValue30 = wavePhaseValue1 * sumValue11;
            precise float sumValue15 = productValue30 + productValue29;
            precise float productValue31 = nonlinearValue1 * productValue6;
            precise float sumValue16 = productValue31 + sumValue15;
            precise float productValue32 = wavePhaseValue * productValue19;
            precise float productValue33 = wavePhaseValue1 * sumValue12;
            precise float sumValue17 = productValue33 + productValue32;
            precise float productValue34 = nonlinearValue1 * productValue10;
            precise float sumValue18 = productValue34 + sumValue17;
            RayDesc _12ident = {float3(reinterpretedBits8, reinterpretedBits9, reinterpretedBits10), 0.0f, float3(sumValue14, sumValue16, sumValue18), 10000.0f};
            intermediateValue28.TraceRayInline(SceneBVH, 512u, 2u, _12ident);
            bool intermediateValue29 = intermediateValue28.Proceed();
            if (intermediateValue29)
            {
                bool intermediateValue62;
                bool comparisonValue21;
                for (;;)
                {
                    uint intermediateValue35 = intermediateValue28.CandidateType();
                    comparisonValue21 = intermediateValue35 == 0u;
                    if (comparisonValue21)
                    {
                        float2 intermediateValue57 = intermediateValue28.CandidateTriangleBarycentrics();
                        float2 intermediateValue58 = intermediateValue28.CandidateTriangleBarycentrics();
                        uint intermediateValue59 = intermediateValue28.CandidatePrimitiveIndex();
                        uint intermediateValue60 = intermediateValue28.CandidateInstanceID();
                        uint intermediateValue61 = intermediateValue28.CandidateInstanceIndex();
                        uint productValue56 = (intermediateValue61 * 76u) + 58u;
                        uint productValue57 = (intermediateValue61 * 76u) + 61u;
                        precise float sumValue31 = 1.0f - intermediateValue57.x;
                        precise float sumValue32 = sumValue31 - intermediateValue58.y;
                        uint bitwiseValue6 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue61 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue59 >> 1u);
                        uint productValue58 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue61 * 76u) + 54u) * 2 + 0)) + 0u;
                        bool comparisonValue23 = (intermediateValue59 & 1u) == 0u;
                        uint comparisonValue24 = comparisonValue23 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue58), bitwiseValue6 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue58), bitwiseValue6 * 16 + 0).x;
                        uint comparisonValue25 = comparisonValue23 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue58), bitwiseValue6 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue58), bitwiseValue6 * 16 + 0).w;
                        uint comparisonValue26 = comparisonValue23 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue58), bitwiseValue6 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue58), bitwiseValue6 * 16 + 0).z;
                        bool productValue59 = rdByteLoad_objectInstances_uint16_t(0u, productValue57 * 2 + 0) < 0u;
                        float intermediateValue93;
                        float intermediateValue94;
                        if (productValue59)
                        {
                            uint bitwiseValue8 = comparisonValue26 >> 15u;
                            precise float bitwiseValue9 = float(bitwiseValue8 & 1u) * 2.0f;
                            precise float sumValue35 = bitwiseValue9 + (-1.0f);
                            precise float bitwiseValue10 = float(comparisonValue26 >> 31u) * 2.0f;
                            precise float sumValue36 = bitwiseValue10 + (-1.0f);
                            precise float bitwiseValue11 = float((comparisonValue26 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue12 = float(bitwiseValue8 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue64 = sumValue35 * 3.0517578125e-05f;
                            precise float productValue65 = sumValue36 * 3.0517578125e-05f;
                            precise float sumValue37 = bitwiseValue11 + productValue64;
                            precise float sumValue38 = bitwiseValue12 + productValue65;
                            intermediateValue93 = sumValue37;
                            intermediateValue94 = sumValue38;
                        }
                        else
                        {
                            precise float bitwiseValue13 = float(comparisonValue26 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue14 = float(comparisonValue26 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue66 = bitwiseValue13 * 16384.0f;
                            precise float sumValue39 = productValue66 + 0.5f;
                            precise float productValue67 = bitwiseValue14 * 16384.0f;
                            precise float sumValue40 = productValue67 + 0.5f;
                            precise float productValue68 = floor(sumValue39) * 6.103515625e-05f;
                            precise float productValue69 = floor(sumValue40) * 6.103515625e-05f;
                            intermediateValue93 = productValue68;
                            intermediateValue94 = productValue69;
                        }
                        precise float productValue86 = sumValue32 * intermediateValue93;
                        precise float productValue87 = sumValue32 * intermediateValue94;
                        precise float sumValue53 = productValue86 + 0.0f;
                        precise float sumValue54 = productValue87 + 0.0f;
                        float intermediateValue157;
                        float intermediateValue158;
                        if (productValue59)
                        {
                            uint bitwiseValue28 = comparisonValue25 >> 15u;
                            precise float bitwiseValue29 = float(bitwiseValue28 & 1u) * 2.0f;
                            precise float sumValue61 = bitwiseValue29 + (-1.0f);
                            precise float bitwiseValue30 = float(comparisonValue25 >> 31u) * 2.0f;
                            precise float sumValue62 = bitwiseValue30 + (-1.0f);
                            precise float bitwiseValue31 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue32 = float(bitwiseValue28 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue108 = sumValue61 * 3.0517578125e-05f;
                            precise float productValue109 = sumValue62 * 3.0517578125e-05f;
                            precise float sumValue63 = bitwiseValue31 + productValue108;
                            precise float sumValue64 = bitwiseValue32 + productValue109;
                            intermediateValue157 = sumValue63;
                            intermediateValue158 = sumValue64;
                        }
                        else
                        {
                            precise float bitwiseValue33 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue34 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue110 = bitwiseValue33 * 16384.0f;
                            precise float sumValue65 = productValue110 + 0.5f;
                            precise float productValue111 = bitwiseValue34 * 16384.0f;
                            precise float sumValue66 = productValue111 + 0.5f;
                            precise float productValue112 = floor(sumValue65) * 6.103515625e-05f;
                            precise float productValue113 = floor(sumValue66) * 6.103515625e-05f;
                            intermediateValue157 = productValue112;
                            intermediateValue158 = productValue113;
                        }
                        precise float productValue162 = intermediateValue57.x * intermediateValue157;
                        precise float productValue163 = intermediateValue57.x * intermediateValue158;
                        precise float sumValue99 = sumValue53 + productValue162;
                        precise float sumValue100 = sumValue54 + productValue163;
                        float intermediateValue195;
                        float intermediateValue196;
                        if (productValue59)
                        {
                            uint bitwiseValue84 = comparisonValue24 >> 15u;
                            precise float bitwiseValue85 = float(bitwiseValue84 & 1u) * 2.0f;
                            precise float sumValue107 = bitwiseValue85 + (-1.0f);
                            precise float bitwiseValue86 = float(comparisonValue24 >> 31u) * 2.0f;
                            precise float sumValue108 = bitwiseValue86 + (-1.0f);
                            precise float bitwiseValue87 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue88 = float(bitwiseValue84 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue170 = sumValue107 * 3.0517578125e-05f;
                            precise float productValue171 = sumValue108 * 3.0517578125e-05f;
                            precise float sumValue109 = bitwiseValue87 + productValue170;
                            precise float sumValue110 = bitwiseValue88 + productValue171;
                            intermediateValue195 = sumValue109;
                            intermediateValue196 = sumValue110;
                        }
                        else
                        {
                            precise float bitwiseValue89 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue90 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue172 = bitwiseValue89 * 16384.0f;
                            precise float sumValue111 = productValue172 + 0.5f;
                            precise float productValue173 = bitwiseValue90 * 16384.0f;
                            precise float sumValue112 = productValue173 + 0.5f;
                            precise float productValue174 = floor(sumValue111) * 6.103515625e-05f;
                            precise float productValue175 = floor(sumValue112) * 6.103515625e-05f;
                            intermediateValue195 = productValue174;
                            intermediateValue196 = productValue175;
                        }
                        precise float productValue214 = intermediateValue58.y * intermediateValue195;
                        precise float productValue215 = intermediateValue58.y * intermediateValue196;
                        precise float sumValue131 = sumValue99 + productValue214;
                        precise float sumValue132 = sumValue100 + productValue215;
                        float intermediateValue209;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue56 * 2 + 0) == 65535u)
                        {
                            intermediateValue209 = 1.0f;
                        }
                        else
                        {
                            uint reinterpretedBits26;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue56 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits26 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits26 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue56 * 2 + 0));
                            }
                            intermediateValue209 = textures[NonUniformResourceIndex(reinterpretedBits26 + 0u)].SampleLevel(defaultSampler, float2(sumValue131, sumValue132), -0.25f).w;
                        }
                        uint comparisonValue57;
                        if (intermediateValue60 == 2u)
                        {
                            comparisonValue57 = 0u;
                        }
                        else
                        {
                            comparisonValue57 = uint(intermediateValue209 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue57 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                        }
                        if (comparisonValue57 == 0u)
                        {
                            intermediateValue28.CommitNonOpaqueTriangleHit();
                        }
                    }
                    intermediateValue62 = intermediateValue28.Proceed();
                    if (intermediateValue62)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint intermediateValue33 = intermediateValue28.CommittedStatus();
            float intermediateValue41;
            float intermediateValue42;
            float intermediateValue43;
            uint bitwiseValue4;
            if (intermediateValue33 == 1u)
            {
                float2 intermediateValue36 = intermediateValue28.CommittedTriangleBarycentrics();
                float2 intermediateValue37 = intermediateValue28.CommittedTriangleBarycentrics();
                float intermediateValue38 = intermediateValue28.CommittedRayT();
                uint intermediateValue39 = intermediateValue28.CommittedPrimitiveIndex();
                uint intermediateValue40 = intermediateValue28.CommittedInstanceIndex();
                intermediateValue41 = intermediateValue36.x;
                intermediateValue42 = intermediateValue37.y;
                intermediateValue43 = intermediateValue38;
                bitwiseValue4 = ((intermediateValue39 << 14u) & 1073725440u) | (intermediateValue40 & 16383u);
            }
            else
            {
                intermediateValue41 = 0.0f;
                intermediateValue42 = 0.0f;
                intermediateValue43 = 10000.0f;
                bitwiseValue4 = 1073741823u;
            }
            RayDesc _13ident = {float3(reinterpretedBits8, reinterpretedBits9, reinterpretedBits10), 0.0f, float3(sumValue14, sumValue16, sumValue18), intermediateValue43};
            intermediateValue44.TraceRayInline(SceneBVH, 512u, 16u, _13ident);
            bool intermediateValue45 = intermediateValue44.Proceed();
            float intermediateValue63;
            float intermediateValue65;
            float intermediateValue67;
            if (intermediateValue45)
            {
                float intermediateValue64;
                float intermediateValue66;
                float intermediateValue68;
                float intermediateValue83 = 1.0f;
                float intermediateValue84 = 1.0f;
                float intermediateValue85 = 1.0f;
                bool comparisonValue39;
                for (;;)
                {
                    uint intermediateValue86 = intermediateValue44.CandidateType();
                    comparisonValue39 = intermediateValue86 == 0u;
                    float branchMergedValue;
                    float branchMergedValue8;
                    float branchMergedValue9;
                    if (comparisonValue39)
                    {
                        float2 intermediateValue95 = intermediateValue44.CandidateTriangleBarycentrics();
                        float2 intermediateValue96 = intermediateValue44.CandidateTriangleBarycentrics();
                        float intermediateValue97 = intermediateValue44.CandidateTriangleRayT();
                        uint intermediateValue98 = intermediateValue44.CandidatePrimitiveIndex();
                        uint intermediateValue99 = intermediateValue44.CandidateInstanceID();
                        uint intermediateValue100 = intermediateValue44.CandidateInstanceIndex();
                        uint productValue88 = (intermediateValue100 * 76u) + 58u;
                        uint productValue89 = (intermediateValue100 * 76u) + 61u;
                        precise float sumValue55 = 1.0f - intermediateValue95.x;
                        precise float sumValue56 = sumValue55 - intermediateValue96.y;
                        uint bitwiseValue24 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue100 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue98 >> 1u);
                        uint productValue90 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue100 * 76u) + 54u) * 2 + 0)) + 0u;
                        bool comparisonValue41 = (intermediateValue98 & 1u) == 0u;
                        uint comparisonValue42 = comparisonValue41 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue90), bitwiseValue24 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue90), bitwiseValue24 * 16 + 0).x;
                        uint comparisonValue43 = comparisonValue41 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue90), bitwiseValue24 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue90), bitwiseValue24 * 16 + 0).w;
                        uint comparisonValue44 = comparisonValue41 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue90), bitwiseValue24 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue90), bitwiseValue24 * 16 + 0).z;
                        bool productValue91 = rdByteLoad_objectInstances_uint16_t(0u, productValue89 * 2 + 0) < 0u;
                        float intermediateValue159;
                        float intermediateValue160;
                        if (productValue91)
                        {
                            uint bitwiseValue35 = comparisonValue44 >> 15u;
                            precise float bitwiseValue36 = float(bitwiseValue35 & 1u) * 2.0f;
                            precise float sumValue67 = bitwiseValue36 + (-1.0f);
                            precise float bitwiseValue37 = float(comparisonValue44 >> 31u) * 2.0f;
                            precise float sumValue68 = bitwiseValue37 + (-1.0f);
                            precise float bitwiseValue38 = float((comparisonValue44 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue39 = float(bitwiseValue35 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue114 = sumValue67 * 3.0517578125e-05f;
                            precise float productValue115 = sumValue68 * 3.0517578125e-05f;
                            precise float sumValue69 = bitwiseValue38 + productValue114;
                            precise float sumValue70 = bitwiseValue39 + productValue115;
                            intermediateValue159 = sumValue69;
                            intermediateValue160 = sumValue70;
                        }
                        else
                        {
                            precise float bitwiseValue40 = float(comparisonValue44 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue41 = float(comparisonValue44 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue116 = bitwiseValue40 * 16384.0f;
                            precise float sumValue71 = productValue116 + 0.5f;
                            precise float productValue117 = bitwiseValue41 * 16384.0f;
                            precise float sumValue72 = productValue117 + 0.5f;
                            precise float productValue118 = floor(sumValue71) * 6.103515625e-05f;
                            precise float productValue119 = floor(sumValue72) * 6.103515625e-05f;
                            intermediateValue159 = productValue118;
                            intermediateValue160 = productValue119;
                        }
                        precise float productValue164 = sumValue56 * intermediateValue159;
                        precise float productValue165 = sumValue56 * intermediateValue160;
                        precise float sumValue101 = productValue164 + 0.0f;
                        precise float sumValue102 = productValue165 + 0.0f;
                        float intermediateValue197;
                        float intermediateValue198;
                        if (productValue91)
                        {
                            uint bitwiseValue91 = comparisonValue43 >> 15u;
                            precise float bitwiseValue92 = float(bitwiseValue91 & 1u) * 2.0f;
                            precise float sumValue113 = bitwiseValue92 + (-1.0f);
                            precise float bitwiseValue93 = float(comparisonValue43 >> 31u) * 2.0f;
                            precise float sumValue114 = bitwiseValue93 + (-1.0f);
                            precise float bitwiseValue94 = float((comparisonValue43 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue95 = float(bitwiseValue91 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue176 = sumValue113 * 3.0517578125e-05f;
                            precise float productValue177 = sumValue114 * 3.0517578125e-05f;
                            precise float sumValue115 = bitwiseValue94 + productValue176;
                            precise float sumValue116 = bitwiseValue95 + productValue177;
                            intermediateValue197 = sumValue115;
                            intermediateValue198 = sumValue116;
                        }
                        else
                        {
                            precise float bitwiseValue96 = float(comparisonValue43 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue97 = float(comparisonValue43 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue178 = bitwiseValue96 * 16384.0f;
                            precise float sumValue117 = productValue178 + 0.5f;
                            precise float productValue179 = bitwiseValue97 * 16384.0f;
                            precise float sumValue118 = productValue179 + 0.5f;
                            precise float productValue180 = floor(sumValue117) * 6.103515625e-05f;
                            precise float productValue181 = floor(sumValue118) * 6.103515625e-05f;
                            intermediateValue197 = productValue180;
                            intermediateValue198 = productValue181;
                        }
                        precise float productValue216 = intermediateValue95.x * intermediateValue197;
                        precise float productValue217 = intermediateValue95.x * intermediateValue198;
                        precise float sumValue133 = sumValue101 + productValue216;
                        precise float sumValue134 = sumValue102 + productValue217;
                        float intermediateValue211;
                        float intermediateValue212;
                        if (productValue91)
                        {
                            uint bitwiseValue122 = comparisonValue42 >> 15u;
                            precise float bitwiseValue123 = float(bitwiseValue122 & 1u) * 2.0f;
                            precise float sumValue145 = bitwiseValue123 + (-1.0f);
                            precise float bitwiseValue124 = float(comparisonValue42 >> 31u) * 2.0f;
                            precise float sumValue146 = bitwiseValue124 + (-1.0f);
                            precise float bitwiseValue125 = float((comparisonValue42 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue126 = float(bitwiseValue122 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue232 = sumValue145 * 3.0517578125e-05f;
                            precise float productValue233 = sumValue146 * 3.0517578125e-05f;
                            precise float sumValue147 = bitwiseValue125 + productValue232;
                            precise float sumValue148 = bitwiseValue126 + productValue233;
                            intermediateValue211 = sumValue147;
                            intermediateValue212 = sumValue148;
                        }
                        else
                        {
                            precise float bitwiseValue127 = float(comparisonValue42 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue128 = float(comparisonValue42 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue234 = bitwiseValue127 * 16384.0f;
                            precise float sumValue149 = productValue234 + 0.5f;
                            precise float productValue235 = bitwiseValue128 * 16384.0f;
                            precise float sumValue150 = productValue235 + 0.5f;
                            precise float productValue236 = floor(sumValue149) * 6.103515625e-05f;
                            precise float productValue237 = floor(sumValue150) * 6.103515625e-05f;
                            intermediateValue211 = productValue236;
                            intermediateValue212 = productValue237;
                        }
                        precise float productValue244 = intermediateValue96.y * intermediateValue211;
                        precise float productValue245 = intermediateValue96.y * intermediateValue212;
                        precise float sumValue157 = sumValue133 + productValue244;
                        precise float sumValue158 = sumValue134 + productValue245;
                        float intermediateValue215;
                        float intermediateValue216;
                        float intermediateValue217;
                        float intermediateValue218;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) == 65535u)
                        {
                            intermediateValue215 = 1.0f;
                            intermediateValue216 = 1.0f;
                            intermediateValue217 = 1.0f;
                            intermediateValue218 = 1.0f;
                        }
                        else
                        {
                            uint reinterpretedBits28;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits28 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits28 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0));
                            }
                            float4 sampledTextureValue6 = textures[NonUniformResourceIndex(reinterpretedBits28 + 0u)].SampleLevel(defaultSampler, float2(sumValue157, sumValue158), min(mad(intermediateValue97, 0.083333335816860198974609375f, -0.25f), 2.0f));
                            intermediateValue215 = sampledTextureValue6.x;
                            intermediateValue216 = sampledTextureValue6.y;
                            intermediateValue217 = sampledTextureValue6.z;
                            intermediateValue218 = sampledTextureValue6.w;
                        }
                        float intermediateValue223;
                        float intermediateValue224;
                        float intermediateValue225;
                        if (intermediateValue99 == 2u)
                        {
                            float branchMergedValue38;
                            float branchMergedValue61;
                            float branchMergedValue62;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue89 * 2 + 0) & 128u) == 0u)
                            {
                                float intermediateValue235;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue89 * 2 + 0) & 2048u) == 0u)
                                {
                                    intermediateValue235 = intermediateValue218;
                                }
                                else
                                {
                                    intermediateValue235 = clamp(mad(intermediateValue218, 2.0f, -1.0f), 0.0f, 1.0f);
                                }
                                branchMergedValue38 = intermediateValue217 - (intermediateValue235 * intermediateValue217);
                                branchMergedValue61 = intermediateValue216 - (intermediateValue235 * intermediateValue216);
                                branchMergedValue62 = intermediateValue215 - (intermediateValue235 * intermediateValue215);
                            }
                            else
                            {
                                branchMergedValue38 = 0.33399999141693115234375f;
                                branchMergedValue61 = 0.33399999141693115234375f;
                                branchMergedValue62 = 0.33399999141693115234375f;
                            }
                            intermediateValue223 = branchMergedValue62;
                            intermediateValue224 = branchMergedValue61;
                            intermediateValue225 = branchMergedValue38;
                        }
                        else
                        {
                            float sumValue167 = 1.0f - intermediateValue218;
                            intermediateValue223 = sumValue167;
                            intermediateValue224 = sumValue167;
                            intermediateValue225 = sumValue167;
                        }
                        float productValue316 = intermediateValue223 * intermediateValue83;
                        float productValue317 = intermediateValue224 * intermediateValue84;
                        float productValue318 = intermediateValue225 * intermediateValue85;
                        float intermediateValue101;
                        float intermediateValue102;
                        float intermediateValue103;
                        bool intermediateValue236;
                        if (!(dot(float3(productValue316, productValue317, productValue318), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                        {
                            intermediateValue236 = false;
                            intermediateValue101 = productValue316;
                            intermediateValue102 = productValue317;
                            intermediateValue103 = productValue318;
                        }
                        else
                        {
                            intermediateValue236 = true;
                            intermediateValue101 = 0.0f;
                            intermediateValue102 = 0.0f;
                            intermediateValue103 = 0.0f;
                        }
                        float branchMergedValue81;
                        float branchMergedValue89;
                        float branchMergedValue90;
                        if (intermediateValue236)
                        {
                            intermediateValue44.CommitNonOpaqueTriangleHit();
                            branchMergedValue81 = intermediateValue102;
                            branchMergedValue89 = intermediateValue101;
                            branchMergedValue90 = intermediateValue103;
                        }
                        else
                        {
                            branchMergedValue81 = intermediateValue102;
                            branchMergedValue89 = intermediateValue101;
                            branchMergedValue90 = intermediateValue103;
                        }
                        branchMergedValue = branchMergedValue81;
                        branchMergedValue8 = branchMergedValue89;
                        branchMergedValue9 = branchMergedValue90;
                    }
                    else
                    {
                        branchMergedValue = intermediateValue84;
                        branchMergedValue8 = intermediateValue83;
                        branchMergedValue9 = intermediateValue85;
                    }
                    intermediateValue66 = branchMergedValue;
                    intermediateValue64 = branchMergedValue8;
                    intermediateValue68 = branchMergedValue9;
                    bool intermediateValue104 = intermediateValue44.Proceed();
                    if (intermediateValue104)
                    {
                        intermediateValue83 = intermediateValue64;
                        intermediateValue84 = intermediateValue66;
                        intermediateValue85 = intermediateValue68;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue63 = intermediateValue64;
                intermediateValue65 = intermediateValue66;
                intermediateValue67 = intermediateValue68;
            }
            else
            {
                intermediateValue63 = 1.0f;
                intermediateValue65 = 1.0f;
                intermediateValue67 = 1.0f;
            }
            uint intermediateValue69 = intermediateValue44.CommittedStatus();
            bool comparisonValue27 = intermediateValue69 == 1u;
            float comparisonValue28 = comparisonValue27 ? 0.0f : intermediateValue63;
            float comparisonValue29 = comparisonValue27 ? 0.0f : intermediateValue65;
            float comparisonValue30 = comparisonValue27 ? 0.0f : intermediateValue67;
            float intermediateValue11;
            float intermediateValue117;
            float intermediateValue119;
            float intermediateValue121;
            if (intermediateValue43 < 10000.0f)
            {
                uint bitwiseValue15 = bitwiseValue4 & 16383u;
                uint productValue70 = (bitwiseValue15 * 76u) + 58u;
                uint productValue71 = (bitwiseValue15 * 76u) + 59u;
                uint productValue72 = (bitwiseValue15 * 76u) + 61u;
                uint productValue73 = (bitwiseValue15 * 38u) + 32u;
                bool reinterpretedBits14 = (intermediateValue43 > 1.0f) && (((rdByteLoad_objectInstances_uint16_t(0u, productValue72 * 2 + 0) & 1u) != 0u) && (asuint(viewCbConstants[86u]).y != 0u));
                float productValue94;
                float productValue95;
                float productValue96;
                if (reinterpretedBits14)
                {
                    uint productValue92 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue15 * 76u) + 54u) * 2 + 0)) + 0u;
                    uint bitwiseValue25 = ((rdByteLoad_objectInstances_uint(0u, ((bitwiseValue15 * 38u) + 25u) * 4 + 0) >> 2u) + ((bitwiseValue4 >> 15u) & 32767u)) * 8u;
                    half3 productValue93 = (half3)f16tof32(uint16_t3(rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue92), bitwiseValue25 * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue92), (bitwiseValue25 + 1u) * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue92), (bitwiseValue25 + 2u) * 2 + 0)));
                    productValue94 = float(productValue93.x) * comparisonValue28;
                    productValue95 = float(productValue93.y) * comparisonValue29;
                    productValue96 = float(productValue93.z) * comparisonValue30;
                }
                else
                {
                    productValue94 = 0.0f;
                    productValue95 = 0.0f;
                    productValue96 = 0.0f;
                }
                float branchMergedValue32;
                float branchMergedValue48;
                float branchMergedValue49;
                float branchMergedValue50;
                if (reinterpretedBits14)
                {
                    branchMergedValue32 = productValue95;
                    branchMergedValue48 = productValue94;
                    branchMergedValue49 = 0.0f;
                    branchMergedValue50 = productValue96;
                }
                else
                {
                    uint productValue124 = bitwiseValue15 * 38u;
                    float4 reinterpretedBits18 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue124 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue124 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue124 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue124 + 3u) * 4 + 0)));
                    float intermediateValue123 = reinterpretedBits18.x;
                    float intermediateValue124 = reinterpretedBits18.y;
                    float intermediateValue125 = reinterpretedBits18.z;
                    uint productValue125 = (bitwiseValue15 * 38u) + 4u;
                    float4 reinterpretedBits19 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue125 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue125 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue125 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue125 + 3u) * 4 + 0)));
                    float intermediateValue126 = reinterpretedBits19.x;
                    float intermediateValue127 = reinterpretedBits19.y;
                    float intermediateValue128 = reinterpretedBits19.z;
                    uint productValue126 = (bitwiseValue15 * 38u) + 8u;
                    float4 reinterpretedBits20 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue126 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue126 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue126 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue126 + 3u) * 4 + 0)));
                    float intermediateValue129 = reinterpretedBits20.x;
                    float intermediateValue130 = reinterpretedBits20.y;
                    float intermediateValue131 = reinterpretedBits20.z;
                    uint productValue127 = (bitwiseValue15 * 38u) + 24u;
                    uint productValue128 = (bitwiseValue15 * 38u) + 25u;
                    uint productValue129 = (bitwiseValue15 * 76u) + 61u;
                    uint productValue130 = (bitwiseValue15 * 76u) + 72u;
                    uint bitwiseValue42 = ((bitwiseValue4 >> 13u) & 2u) | ((bitwiseValue4 >> 13u) & 131068u);
                    uint bitwiseValue43 = bitwiseValue42 | 1u;
                    uint bitwiseValue44 = bitwiseValue42 ^ 2u;
                    uint intermediateValue2[3];
                    intermediateValue2[0u] = bitwiseValue42;
                    intermediateValue2[1u] = bitwiseValue43;
                    intermediateValue2[2u] = bitwiseValue44;
                    uint productValue131 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue15 * 76u) + 54u) * 2 + 0));
                    uint sumValue73 = productValue131 + 0u;
                    uint bitwiseValue45 = (rdByteLoad_objectInstances_uint(0u, productValue128 * 4 + 0) >> 2u) + ((bitwiseValue4 >> 15u) & 32767u);
                    uint productValue132 = bitwiseValue45 * 4u;
                    precise float bitwiseValue46 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue73), productValue132 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
                    precise float sumValue74 = bitwiseValue46 + (-1.0f);
                    precise float bitwiseValue47 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue73), productValue132 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
                    precise float sumValue75 = bitwiseValue47 + (-1.0f);
                    precise float bitwiseValue48 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue73), productValue132 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
                    precise float sumValue76 = bitwiseValue48 + (-1.0f);
                    precise float sumValue77 = 1.0f - intermediateValue41;
                    precise float sumValue78 = sumValue77 - intermediateValue42;
                    float intermediateValue3[3];
                    intermediateValue3[0u] = sumValue78;
                    intermediateValue3[1u] = intermediateValue41;
                    intermediateValue3[2u] = intermediateValue42;
                    uint sumValue79 = productValue131 + 0u;
                    uint productValue133 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue15 * 76u) + 56u) * 2 + 0));
                    uint productValue134 = productValue133 * (rdByteLoad_objectInstances_uint(0u, productValue127 * 4 + 0) + bitwiseValue42);
                    uint bitwiseValue49 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue15 * 76u) + 71u) * 2 + 0) & 255u);
                    uint bitwiseValue50 = (bitwiseValue49 + productValue134) >> 1u;
                    half3 productValue135 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue79), bitwiseValue50 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue79), (bitwiseValue50 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue79), (bitwiseValue50 + 2u) * 2 + 0)));
                    uint bitwiseValue51 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue130 * 2 + 0) & 255u);
                    uint bitwiseValue52 = (bitwiseValue51 + productValue134) >> 2u;
                    uint bitwiseValue53 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue130 * 2 + 0) >> 8u);
                    uint bitwiseValue54 = (bitwiseValue53 + productValue134) >> 2u;
                    bool productValue136 = rdByteLoad_objectInstances_uint16_t(0u, productValue129 * 2 + 0) < 0u;
                    float bitwiseValue98;
                    float bitwiseValue99;
                    if (productValue136)
                    {
                        uint bitwiseValue82 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue54 * 4 + 0) >> 15u;
                        bitwiseValue98 = ((float(bitwiseValue82 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue54 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                        bitwiseValue99 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue54 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue82 & 65534u) * 1.525902189314365386962890625e-05f);
                    }
                    else
                    {
                        bitwiseValue98 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue54 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        bitwiseValue99 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue54 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                    }
                    uint intermediateValue199;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue129 * 2 + 0) & 256u) == 0u)
                    {
                        intermediateValue199 = 0u;
                    }
                    else
                    {
                        intermediateValue199 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), ((uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue15 * 76u) + 74u) * 2 + 0) >> 8u) + productValue134) >> 2u) * 4 + 0) & 65535u;
                    }
                    precise float productValue218 = sumValue78 * float(productValue135.x);
                    precise float productValue219 = sumValue78 * float(productValue135.y);
                    precise float productValue220 = sumValue78 * float(productValue135.z);
                    precise float sumValue135 = productValue218 + 0.0f;
                    precise float sumValue136 = productValue219 + 0.0f;
                    precise float sumValue137 = productValue220 + 0.0f;
                    uint productValue221 = productValue133 * (rdByteLoad_objectInstances_uint(0u, productValue127 * 4 + 0) + bitwiseValue43);
                    uint bitwiseValue116 = (bitwiseValue49 + productValue221) >> 1u;
                    half3 productValue222 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue79), bitwiseValue116 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue79), (bitwiseValue116 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue79), (bitwiseValue116 + 2u) * 2 + 0)));
                    uint bitwiseValue117 = (bitwiseValue51 + productValue221) >> 2u;
                    uint bitwiseValue118 = (bitwiseValue53 + productValue221) >> 2u;
                    float bitwiseValue138;
                    float bitwiseValue139;
                    if (productValue136)
                    {
                        uint bitwiseValue129 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue118 * 4 + 0) >> 15u;
                        bitwiseValue138 = ((float(bitwiseValue129 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue118 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                        bitwiseValue139 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue118 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue129 & 65534u) * 1.525902189314365386962890625e-05f);
                    }
                    else
                    {
                        bitwiseValue138 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue118 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        bitwiseValue139 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue118 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                    }
                    precise float productValue246 = intermediateValue41 * float(productValue222.x);
                    precise float productValue247 = intermediateValue41 * float(productValue222.y);
                    precise float productValue248 = intermediateValue41 * float(productValue222.z);
                    precise float sumValue159 = sumValue135 + productValue246;
                    precise float sumValue160 = sumValue136 + productValue247;
                    precise float sumValue161 = sumValue137 + productValue248;
                    uint productValue249 = productValue133 * (rdByteLoad_objectInstances_uint(0u, productValue127 * 4 + 0) + bitwiseValue44);
                    uint bitwiseValue140 = (bitwiseValue49 + productValue249) >> 1u;
                    half3 productValue250 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue79), bitwiseValue140 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue79), (bitwiseValue140 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue79), (bitwiseValue140 + 2u) * 2 + 0)));
                    uint bitwiseValue141 = (bitwiseValue51 + productValue249) >> 2u;
                    uint bitwiseValue142 = (bitwiseValue53 + productValue249) >> 2u;
                    float bitwiseValue150;
                    float bitwiseValue151;
                    if (productValue136)
                    {
                        uint bitwiseValue148 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue142 * 4 + 0) >> 15u;
                        bitwiseValue150 = ((float(bitwiseValue148 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue142 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                        bitwiseValue151 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue142 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue148 & 65534u) * 1.525902189314365386962890625e-05f);
                    }
                    else
                    {
                        bitwiseValue150 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue142 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        bitwiseValue151 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue142 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                    }
                    precise float productValue258 = intermediateValue42 * float(productValue250.x);
                    precise float productValue259 = intermediateValue42 * float(productValue250.y);
                    precise float productValue260 = intermediateValue42 * float(productValue250.z);
                    precise float sumValue168 = sumValue159 + productValue258;
                    precise float sumValue169 = sumValue160 + productValue259;
                    precise float sumValue170 = sumValue161 + productValue260;
                    float productValue261 = ((bitwiseValue138 * intermediateValue41) + (bitwiseValue98 * sumValue78)) + (bitwiseValue150 * intermediateValue42);
                    float productValue262 = ((bitwiseValue139 * intermediateValue41) + (bitwiseValue99 * sumValue78)) + (bitwiseValue151 * intermediateValue42);
                    float bitwiseValue152 = (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue117 * 4 + 0) & 255u) * intermediateValue41) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue52 * 4 + 0) & 255u) * sumValue78)) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue141 * 4 + 0) & 255u) * intermediateValue42)) * 0.0039215688593685626983642578125f;
                    float bitwiseValue153 = (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue117 * 4 + 0) >> 8u) & 255u) * intermediateValue41) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue52 * 4 + 0) >> 8u) & 255u) * sumValue78)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue141 * 4 + 0) >> 8u) & 255u) * intermediateValue42)) * 0.0039215688593685626983642578125f;
                    float bitwiseValue154 = (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue117 * 4 + 0) >> 16u) & 255u) * intermediateValue41) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue52 * 4 + 0) >> 16u) & 255u) * sumValue78)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue141 * 4 + 0) >> 16u) & 255u) * intermediateValue42)) * 0.0039215688593685626983642578125f;
                    float bitwiseValue155 = (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue117 * 4 + 0) >> 24u) * intermediateValue41) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue52 * 4 + 0) >> 24u) * sumValue78)) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue79), bitwiseValue141 * 4 + 0) >> 24u) * intermediateValue42)) * 0.0039215688593685626983642578125f;
                    precise float productValue263 = intermediateValue123 * sumValue168;
                    precise float productValue264 = sumValue169 * intermediateValue124;
                    precise float sumValue171 = productValue264 + productValue263;
                    precise float productValue265 = sumValue170 * intermediateValue125;
                    precise float sumValue172 = productValue265 + sumValue171;
                    precise float productValue266 = 1.0f * reinterpretedBits18.w;
                    precise float sumValue173 = productValue266 + sumValue172;
                    precise float productValue267 = intermediateValue126 * sumValue168;
                    precise float productValue268 = sumValue169 * intermediateValue127;
                    precise float sumValue174 = productValue268 + productValue267;
                    precise float productValue269 = sumValue170 * intermediateValue128;
                    precise float sumValue175 = productValue269 + sumValue174;
                    precise float productValue270 = 1.0f * reinterpretedBits19.w;
                    precise float sumValue176 = productValue270 + sumValue175;
                    precise float productValue271 = intermediateValue129 * sumValue168;
                    precise float productValue272 = sumValue169 * intermediateValue130;
                    precise float sumValue177 = productValue272 + productValue271;
                    precise float productValue273 = sumValue170 * intermediateValue131;
                    precise float sumValue178 = productValue273 + sumValue177;
                    precise float productValue274 = 1.0f * reinterpretedBits20.w;
                    precise float sumValue179 = productValue274 + sumValue178;
                    precise float productValue275 = intermediateValue123 * sumValue74;
                    precise float productValue276 = sumValue75 * intermediateValue124;
                    precise float sumValue180 = productValue276 + productValue275;
                    precise float productValue277 = sumValue76 * intermediateValue125;
                    precise float sumValue181 = productValue277 + sumValue180;
                    precise float productValue278 = intermediateValue126 * sumValue74;
                    precise float productValue279 = sumValue75 * intermediateValue127;
                    precise float sumValue182 = productValue279 + productValue278;
                    precise float productValue280 = sumValue76 * intermediateValue128;
                    precise float sumValue183 = productValue280 + sumValue182;
                    precise float productValue281 = intermediateValue129 * sumValue74;
                    precise float productValue282 = sumValue75 * intermediateValue130;
                    precise float sumValue184 = productValue282 + productValue281;
                    precise float productValue283 = sumValue76 * intermediateValue131;
                    precise float sumValue185 = productValue283 + sumValue184;
                    float inverseLengthValue5 = rsqrt(dot(float3(sumValue181, sumValue183, sumValue185), float3(sumValue181, sumValue183, sumValue185)));
                    precise float productValue284 = sumValue181 * inverseLengthValue5;
                    precise float productValue285 = sumValue183 * inverseLengthValue5;
                    precise float productValue286 = sumValue185 * inverseLengthValue5;
                    bool dotProductValue6 = dot(float3(sumValue14, sumValue16, sumValue18), float3(productValue284, productValue285, productValue286)) > 0.0f;
                    precise float sumValue186 = (-0.0f) - productValue284;
                    precise float sumValue187 = (-0.0f) - productValue285;
                    precise float sumValue188 = (-0.0f) - productValue286;
                    float comparisonValue59 = dotProductValue6 ? sumValue186 : productValue284;
                    float comparisonValue60 = dotProductValue6 ? sumValue187 : productValue285;
                    float comparisonValue61 = dotProductValue6 ? sumValue188 : productValue286;
                    float intermediateValue226;
                    float intermediateValue227;
                    float intermediateValue228;
                    if (((rdByteLoad_objectInstances_uint16_t(0u, productValue129 * 2 + 0) & 1u) != 0u) && (asuint(viewCbConstants[86u]).y != 0u))
                    {
                        uint sumValue211 = productValue131 + 0u;
                        float sumValue212;
                        float sumValue213;
                        float sumValue214;
                        uint sumValue219;
                        float intermediateValue237 = sumValue78;
                        uint intermediateValue238 = bitwiseValue42;
                        float intermediateValue239 = 0.0f;
                        float intermediateValue240 = 0.0f;
                        float intermediateValue241 = 0.0f;
                        uint intermediateValue242 = 0u;
                        half3 productValue324;
                        half3 productValue326;
                        for (;;)
                        {
                            uint productValue322 = intermediateValue238 + rdByteLoad_objectInstances_uint(0u, productValue128 * 4 + 0);
                            uint productValue323 = productValue322 * 8u;
                            productValue324 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue211), productValue323 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue211), (productValue323 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue211), (productValue323 + 2u) * 2 + 0)));
                            uint productValue325 = (productValue322 * 8u) + 4u;
                            productValue326 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue211), productValue325 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue211), (productValue325 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue211), (productValue325 + 2u) * 2 + 0)));
                            half intermediateValue259;
                            half intermediateValue260;
                            half intermediateValue261;
                            if (dotProductValue6)
                            {
                                intermediateValue259 = productValue326.x;
                                intermediateValue260 = productValue326.y;
                                intermediateValue261 = productValue326.z;
                            }
                            else
                            {
                                intermediateValue259 = productValue324.x;
                                intermediateValue260 = productValue324.y;
                                intermediateValue261 = productValue324.z;
                            }
                            precise float productValue332 = float(intermediateValue261) * intermediateValue237;
                            precise float productValue333 = float(intermediateValue260) * intermediateValue237;
                            precise float productValue334 = float(intermediateValue259) * intermediateValue237;
                            sumValue212 = productValue334 + intermediateValue239;
                            sumValue213 = productValue333 + intermediateValue240;
                            sumValue214 = productValue332 + intermediateValue241;
                            sumValue219 = intermediateValue242 + 1u;
                            if (sumValue219 == 3u)
                            {
                                break;
                            }
                            intermediateValue237 = intermediateValue3[sumValue219];
                            intermediateValue238 = intermediateValue2[sumValue219];
                            intermediateValue239 = sumValue212;
                            intermediateValue240 = sumValue213;
                            intermediateValue241 = sumValue214;
                            intermediateValue242 = sumValue219;
                            continue;
                        }
                        intermediateValue226 = sumValue212;
                        intermediateValue227 = sumValue213;
                        intermediateValue228 = sumValue214;
                    }
                    else
                    {
                        intermediateValue226 = 0.0f;
                        intermediateValue227 = 0.0f;
                        intermediateValue228 = 0.0f;
                    }
                    float2 reinterpretedBits30 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, (intermediateValue199 * 8u) * 8 + 0));
                    float2 reinterpretedBits31 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue199 * 8u) + 1u) * 8 + 0));
                    float reinterpretedBits32 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue199 * 16u) + 13u) * 4 + 0));
                    float reinterpretedBits33 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue199 * 16u) + 14u) * 4 + 0));
                    float nonlinearValue2 = max(0.0f, log2(abs((viewCbConstants[89u].y * intermediateValue7) + (intermediateValue43 * 0.100000001490116119384765625f))) + float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue73), ((bitwiseValue45 * 8u) + 6u) * 2 + 0))));
                    uint reinterpretedBits38;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue70 * 2 + 0) > 4095u)
                    {
                        reinterpretedBits38 = asuint(viewCbConstants[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits38 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue70 * 2 + 0));
                    }
                    uint sumValue220 = reinterpretedBits38 + 0u;
                    float intermediateValue251;
                    float intermediateValue252;
                    float intermediateValue253;
                    float intermediateValue254;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue70 * 2 + 0) == 65535u)
                    {
                        intermediateValue251 = 1.0f;
                        intermediateValue252 = 1.0f;
                        intermediateValue253 = 1.0f;
                        intermediateValue254 = 1.0f;
                    }
                    else
                    {
                        float4 sampledTextureValue8 = textures[NonUniformResourceIndex(sumValue220)].SampleLevel(defaultSampler, float2(productValue261, productValue262), min(nonlinearValue2, reinterpretedBits32));
                        intermediateValue251 = sampledTextureValue8.x;
                        intermediateValue252 = sampledTextureValue8.y;
                        intermediateValue253 = sampledTextureValue8.z;
                        intermediateValue254 = sampledTextureValue8.w;
                    }
                    float productValue335;
                    float productValue336;
                    float productValue337;
                    float productValue338;
                    float productValue339;
                    float productValue340;
                    float productValue341;
                    float productValue342;
                    float productValue343;
                    float productValue344;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue72 * 2 + 0) & 1536u) == 0u)
                    {
                        float intermediateValue266;
                        float intermediateValue267;
                        float intermediateValue268;
                        float intermediateValue269;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue72 * 2 + 0) & 4u) == 0u)
                        {
                            intermediateValue266 = intermediateValue254;
                            intermediateValue267 = bitwiseValue152;
                            intermediateValue268 = bitwiseValue153;
                            intermediateValue269 = bitwiseValue154;
                        }
                        else
                        {
                            uint reinterpretedBits46;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue71 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits46 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits46 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue71 * 2 + 0));
                            }
                            float4 sampledTextureValue10 = textures[NonUniformResourceIndex(reinterpretedBits46 + 0u)].SampleLevel(defaultSampler, float2(bitwiseValue152, bitwiseValue153), 0.0f);
                            intermediateValue266 = 1.0f;
                            intermediateValue267 = ((((sampledTextureValue10.x * 2.0f) + (-1.0f)) * bitwiseValue154) + 1.0f) * bitwiseValue155;
                            intermediateValue268 = ((((sampledTextureValue10.y * 2.0f) + (-1.0f)) * bitwiseValue154) + 1.0f) * bitwiseValue155;
                            intermediateValue269 = ((((sampledTextureValue10.z * 2.0f) + (-1.0f)) * bitwiseValue154) + 1.0f) * bitwiseValue155;
                        }
                        float intermediateValue280;
                        float intermediateValue281;
                        float intermediateValue282;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue72 * 2 + 0) & 8192u) == 0u)
                        {
                            intermediateValue280 = intermediateValue267;
                            intermediateValue281 = intermediateValue268;
                            intermediateValue282 = intermediateValue269;
                        }
                        else
                        {
                            intermediateValue280 = ((1.0f - intermediateValue267) * intermediateValue266) + intermediateValue267;
                            intermediateValue281 = ((1.0f - intermediateValue268) * intermediateValue266) + intermediateValue268;
                            intermediateValue282 = ((1.0f - intermediateValue269) * intermediateValue266) + intermediateValue269;
                        }
                        float intermediateValue296;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue72 * 2 + 0) & 2048u) == 0u)
                        {
                            intermediateValue296 = intermediateValue266;
                        }
                        else
                        {
                            intermediateValue296 = clamp(mad(intermediateValue266, 2.0f, -1.0f), 0.0f, 1.0f);
                        }
                        float bitwiseValue162 = (intermediateValue280 * intermediateValue251) * ((intermediateValue296 * ((float(rdByteLoad_objectInstances_uint(0u, productValue73 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                        float bitwiseValue163 = (intermediateValue281 * intermediateValue252) * ((intermediateValue296 * ((float((rdByteLoad_objectInstances_uint(0u, productValue73 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                        float bitwiseValue164 = (intermediateValue282 * intermediateValue253) * ((intermediateValue296 * ((float((rdByteLoad_objectInstances_uint(0u, productValue73 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                        float productValue398;
                        if (bitwiseValue162 < 0.040449999272823333740234375f)
                        {
                            productValue398 = bitwiseValue162 * 0.077399380505084991455078125f;
                        }
                        else
                        {
                            productValue398 = exp2(log2((bitwiseValue162 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                        }
                        float productValue458;
                        if (bitwiseValue163 < 0.040449999272823333740234375f)
                        {
                            productValue458 = bitwiseValue163 * 0.077399380505084991455078125f;
                        }
                        else
                        {
                            productValue458 = exp2(log2((bitwiseValue163 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                        }
                        float productValue492;
                        if (bitwiseValue164 < 0.040449999272823333740234375f)
                        {
                            productValue492 = bitwiseValue164 * 0.077399380505084991455078125f;
                        }
                        else
                        {
                            productValue492 = exp2(log2((bitwiseValue164 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                        }
                        float reinterpretedBits48;
                        float reinterpretedBits49;
                        float reinterpretedBits50;
                        if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue199 * 16u) + 8u) * 4 + 0) & 1u) == 0u)
                        {
                            reinterpretedBits48 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue199 * 16u) + 11u) * 4 + 0));
                            reinterpretedBits49 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue199 * 16u) + 9u) * 4 + 0));
                            reinterpretedBits50 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue199 * 16u) + 10u) * 4 + 0));
                        }
                        else
                        {
                            float4 sampledTextureValue18 = textures[NonUniformResourceIndex(sumValue220)].SampleLevel(defaultSampler, float2(mad(productValue261, reinterpretedBits30.x, reinterpretedBits31.x), mad(productValue262, reinterpretedBits30.y, reinterpretedBits31.y)), min((reinterpretedBits33 - reinterpretedBits32) + nonlinearValue2, reinterpretedBits33));
                            float intermediateValue452 = sampledTextureValue18.y;
                            reinterpretedBits48 = sampledTextureValue18.x;
                            reinterpretedBits49 = sampledTextureValue18.z;
                            reinterpretedBits50 = mad(intermediateValue452, intermediateValue452, 0.0f);
                        }
                        float sumValue343 = 1.0f - reinterpretedBits48;
                        float productValue522 = sumValue343 * productValue398;
                        float productValue523 = sumValue343 * productValue458;
                        float productValue524 = sumValue343 * productValue492;
                        float dotProductValue8 = dot(float3(productValue398, productValue458, productValue492), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                        float productValue525 = (reinterpretedBits50 * 5.0f) * viewCbConstants[84u].w;
                        productValue335 = reinterpretedBits49 - (viewCbConstants[85u].w * reinterpretedBits49);
                        productValue336 = productValue525 * (((dotProductValue8 - productValue398) * viewCbConstants[85u].x) + productValue398);
                        productValue337 = productValue525 * (((dotProductValue8 - productValue458) * viewCbConstants[85u].x) + productValue458);
                        productValue338 = productValue525 * (((dotProductValue8 - productValue492) * viewCbConstants[85u].x) + productValue492);
                        productValue339 = (reinterpretedBits48 * (productValue398 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                        productValue340 = (reinterpretedBits48 * (productValue458 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                        productValue341 = (reinterpretedBits48 * (productValue492 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                        productValue342 = productValue522 - (productValue522 * reinterpretedBits50);
                        productValue343 = productValue523 - (productValue523 * reinterpretedBits50);
                        productValue344 = productValue524 - (productValue524 * reinterpretedBits50);
                    }
                    else
                    {
                        productValue335 = intermediateValue262;
                        productValue336 = intermediateValue262;
                        productValue337 = intermediateValue262;
                        productValue338 = intermediateValue262;
                        productValue339 = intermediateValue262;
                        productValue340 = intermediateValue262;
                        productValue341 = intermediateValue262;
                        productValue342 = intermediateValue262;
                        productValue343 = intermediateValue262;
                        productValue344 = intermediateValue262;
                    }
                    float productValue345 = ((productValue336 * comparisonValue28) * viewCbConstants[85u].y) + productValue94;
                    float productValue346 = ((productValue337 * comparisonValue29) * viewCbConstants[85u].y) + productValue95;
                    float productValue347 = ((productValue338 * comparisonValue30) * viewCbConstants[85u].y) + productValue96;
                    float intermediateValue118;
                    float intermediateValue120;
                    float intermediateValue122;
                    if (asuint(viewCbConstants[86u]).y == 0u)
                    {
                        intermediateValue118 = productValue345;
                        intermediateValue120 = productValue346;
                        intermediateValue122 = productValue347;
                    }
                    else
                    {
                        intermediateValue118 = productValue345 + ((intermediateValue226 * comparisonValue28) * productValue342);
                        intermediateValue120 = productValue346 + ((intermediateValue227 * comparisonValue29) * productValue343);
                        intermediateValue122 = productValue347 + ((intermediateValue228 * comparisonValue30) * productValue344);
                    }
                    precise float productValue364 = comparisonValue59 * 256.0f;
                    uint intermediateValue270 = uint(int(productValue364));
                    precise float productValue365 = comparisonValue60 * 256.0f;
                    uint intermediateValue271 = uint(int(productValue365));
                    precise float productValue366 = comparisonValue61 * 256.0f;
                    uint intermediateValue272 = uint(int(productValue366));
                    precise float productValue367 = comparisonValue59 * 1.52587890625e-05f;
                    precise float sumValue223 = sumValue173 + productValue367;
                    float reinterpretedBits40 = (abs(sumValue173) < 0.03125f) ? sumValue223 : asfloat(((sumValue173 < 0.0f) ? (-intermediateValue270) : intermediateValue270) + asuint(sumValue173));
                    precise float productValue368 = comparisonValue60 * 1.52587890625e-05f;
                    precise float sumValue224 = sumValue176 + productValue368;
                    float reinterpretedBits41 = (abs(sumValue176) < 0.03125f) ? sumValue224 : asfloat(((sumValue176 < 0.0f) ? (-intermediateValue271) : intermediateValue271) + asuint(sumValue176));
                    precise float productValue369 = comparisonValue61 * 1.52587890625e-05f;
                    precise float sumValue225 = sumValue179 + productValue369;
                    float reinterpretedBits42 = (abs(sumValue179) < 0.03125f) ? sumValue225 : asfloat(((sumValue179 < 0.0f) ? (-intermediateValue272) : intermediateValue272) + asuint(sumValue179));
                    float intermediateValue283;
                    float intermediateValue284;
                    float intermediateValue285;
                    if (dot(float3(viewCbConstants[52u].xyz), float3(comparisonValue59, comparisonValue60, comparisonValue61)) < 0.0f)
                    {
                        intermediateValue283 = 0.0f;
                        intermediateValue284 = 0.0f;
                        intermediateValue285 = 0.0f;
                    }
                    else
                    {
                        RayDesc _14ident = {float3(reinterpretedBits40, reinterpretedBits41, reinterpretedBits42), 0.0f, float3(viewCbConstants[53u].xyz), 10000.0f};
                        intermediateValue286.TraceRayInline(SceneBVH, 512u, 32u, _14ident);
                        bool intermediateValue287 = intermediateValue286.Proceed();
                        if (intermediateValue287)
                        {
                            bool intermediateValue313;
                            bool comparisonValue71;
                            for (;;)
                            {
                                uint intermediateValue302 = intermediateValue286.CandidateType();
                                comparisonValue71 = intermediateValue302 == 0u;
                                if (comparisonValue71)
                                {
                                    float2 intermediateValue308 = intermediateValue286.CandidateTriangleBarycentrics();
                                    float2 intermediateValue309 = intermediateValue286.CandidateTriangleBarycentrics();
                                    uint intermediateValue310 = intermediateValue286.CandidatePrimitiveIndex();
                                    uint intermediateValue311 = intermediateValue286.CandidateInstanceID();
                                    uint intermediateValue312 = intermediateValue286.CandidateInstanceIndex();
                                    uint productValue399 = (intermediateValue312 * 76u) + 58u;
                                    uint productValue400 = (intermediateValue312 * 76u) + 61u;
                                    precise float sumValue243 = 1.0f - intermediateValue308.x;
                                    precise float sumValue244 = sumValue243 - intermediateValue309.y;
                                    uint bitwiseValue168 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue312 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue310 >> 1u);
                                    uint productValue401 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue312 * 76u) + 54u) * 2 + 0)) + 0u;
                                    bool comparisonValue73 = (intermediateValue310 & 1u) == 0u;
                                    uint comparisonValue74 = comparisonValue73 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue401), bitwiseValue168 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue401), bitwiseValue168 * 16 + 0).x;
                                    uint comparisonValue75 = comparisonValue73 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue401), bitwiseValue168 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue401), bitwiseValue168 * 16 + 0).w;
                                    uint comparisonValue76 = comparisonValue73 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue401), bitwiseValue168 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue401), bitwiseValue168 * 16 + 0).z;
                                    bool productValue402 = rdByteLoad_objectInstances_uint16_t(0u, productValue400 * 2 + 0) < 0u;
                                    float intermediateValue362;
                                    float intermediateValue363;
                                    if (productValue402)
                                    {
                                        uint bitwiseValue170 = comparisonValue76 >> 15u;
                                        precise float bitwiseValue171 = float(bitwiseValue170 & 1u) * 2.0f;
                                        precise float sumValue279 = bitwiseValue171 + (-1.0f);
                                        precise float bitwiseValue172 = float(comparisonValue76 >> 31u) * 2.0f;
                                        precise float sumValue280 = bitwiseValue172 + (-1.0f);
                                        precise float bitwiseValue173 = float((comparisonValue76 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue174 = float(bitwiseValue170 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue446 = sumValue279 * 3.0517578125e-05f;
                                        precise float productValue447 = sumValue280 * 3.0517578125e-05f;
                                        precise float sumValue281 = bitwiseValue173 + productValue446;
                                        precise float sumValue282 = bitwiseValue174 + productValue447;
                                        intermediateValue362 = sumValue281;
                                        intermediateValue363 = sumValue282;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue175 = float(comparisonValue76 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue176 = float(comparisonValue76 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue448 = bitwiseValue175 * 16384.0f;
                                        precise float sumValue283 = productValue448 + 0.5f;
                                        precise float productValue449 = bitwiseValue176 * 16384.0f;
                                        precise float sumValue284 = productValue449 + 0.5f;
                                        precise float productValue450 = floor(sumValue283) * 6.103515625e-05f;
                                        precise float productValue451 = floor(sumValue284) * 6.103515625e-05f;
                                        intermediateValue362 = productValue450;
                                        intermediateValue363 = productValue451;
                                    }
                                    precise float productValue459 = sumValue244 * intermediateValue362;
                                    precise float productValue460 = sumValue244 * intermediateValue363;
                                    precise float sumValue291 = productValue459 + 0.0f;
                                    precise float sumValue292 = productValue460 + 0.0f;
                                    float intermediateValue440;
                                    float intermediateValue441;
                                    if (productValue402)
                                    {
                                        uint bitwiseValue184 = comparisonValue75 >> 15u;
                                        precise float bitwiseValue185 = float(bitwiseValue184 & 1u) * 2.0f;
                                        precise float sumValue295 = bitwiseValue185 + (-1.0f);
                                        precise float bitwiseValue186 = float(comparisonValue75 >> 31u) * 2.0f;
                                        precise float sumValue296 = bitwiseValue186 + (-1.0f);
                                        precise float bitwiseValue187 = float((comparisonValue75 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue188 = float(bitwiseValue184 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue464 = sumValue295 * 3.0517578125e-05f;
                                        precise float productValue465 = sumValue296 * 3.0517578125e-05f;
                                        precise float sumValue297 = bitwiseValue187 + productValue464;
                                        precise float sumValue298 = bitwiseValue188 + productValue465;
                                        intermediateValue440 = sumValue297;
                                        intermediateValue441 = sumValue298;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue189 = float(comparisonValue75 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue190 = float(comparisonValue75 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue466 = bitwiseValue189 * 16384.0f;
                                        precise float sumValue299 = productValue466 + 0.5f;
                                        precise float productValue467 = bitwiseValue190 * 16384.0f;
                                        precise float sumValue300 = productValue467 + 0.5f;
                                        precise float productValue468 = floor(sumValue299) * 6.103515625e-05f;
                                        precise float productValue469 = floor(sumValue300) * 6.103515625e-05f;
                                        intermediateValue440 = productValue468;
                                        intermediateValue441 = productValue469;
                                    }
                                    precise float productValue493 = intermediateValue308.x * intermediateValue440;
                                    precise float productValue494 = intermediateValue308.x * intermediateValue441;
                                    precise float sumValue315 = sumValue291 + productValue493;
                                    precise float sumValue316 = sumValue292 + productValue494;
                                    float intermediateValue482;
                                    float intermediateValue483;
                                    if (productValue402)
                                    {
                                        uint bitwiseValue230 = comparisonValue74 >> 15u;
                                        precise float bitwiseValue231 = float(bitwiseValue230 & 1u) * 2.0f;
                                        precise float sumValue344 = bitwiseValue231 + (-1.0f);
                                        precise float bitwiseValue232 = float(comparisonValue74 >> 31u) * 2.0f;
                                        precise float sumValue345 = bitwiseValue232 + (-1.0f);
                                        precise float bitwiseValue233 = float((comparisonValue74 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue234 = float(bitwiseValue230 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue526 = sumValue344 * 3.0517578125e-05f;
                                        precise float productValue527 = sumValue345 * 3.0517578125e-05f;
                                        precise float sumValue346 = bitwiseValue233 + productValue526;
                                        precise float sumValue347 = bitwiseValue234 + productValue527;
                                        intermediateValue482 = sumValue346;
                                        intermediateValue483 = sumValue347;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue235 = float(comparisonValue74 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue236 = float(comparisonValue74 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue528 = bitwiseValue235 * 16384.0f;
                                        precise float sumValue348 = productValue528 + 0.5f;
                                        precise float productValue529 = bitwiseValue236 * 16384.0f;
                                        precise float sumValue349 = productValue529 + 0.5f;
                                        precise float productValue530 = floor(sumValue348) * 6.103515625e-05f;
                                        precise float productValue531 = floor(sumValue349) * 6.103515625e-05f;
                                        intermediateValue482 = productValue530;
                                        intermediateValue483 = productValue531;
                                    }
                                    precise float productValue558 = intermediateValue309.y * intermediateValue482;
                                    precise float productValue559 = intermediateValue309.y * intermediateValue483;
                                    precise float sumValue369 = sumValue315 + productValue558;
                                    precise float sumValue370 = sumValue316 + productValue559;
                                    float intermediateValue486;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue399 * 2 + 0) == 65535u)
                                    {
                                        intermediateValue486 = 1.0f;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits54;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue399 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits54 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits54 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue399 * 2 + 0));
                                        }
                                        intermediateValue486 = textures[NonUniformResourceIndex(reinterpretedBits54 + 0u)].SampleLevel(defaultSampler, float2(sumValue369, sumValue370), -0.25f).w;
                                    }
                                    uint comparisonValue119;
                                    if (intermediateValue311 == 2u)
                                    {
                                        comparisonValue119 = 0u;
                                    }
                                    else
                                    {
                                        comparisonValue119 = uint(intermediateValue486 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue400 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                                    }
                                    if (comparisonValue119 == 0u)
                                    {
                                        intermediateValue286.CommitNonOpaqueTriangleHit();
                                    }
                                }
                                intermediateValue313 = intermediateValue286.Proceed();
                                if (intermediateValue313)
                                {
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                        uint intermediateValue298 = intermediateValue286.CommittedStatus();
                        float intermediateValue304;
                        if (intermediateValue298 == 1u)
                        {
                            float intermediateValue303 = intermediateValue286.CommittedRayT();
                            intermediateValue304 = intermediateValue303;
                        }
                        else
                        {
                            intermediateValue304 = 10000.0f;
                        }
                        float branchMergedValue40;
                        float branchMergedValue65;
                        float branchMergedValue66;
                        if (intermediateValue304 < 10000.0f)
                        {
                            precise float productValue403 = intermediateValue304 * viewCbConstants[63u].x;
                            precise float productValue404 = intermediateValue304 * viewCbConstants[63u].y;
                            precise float productValue405 = intermediateValue304 * viewCbConstants[63u].z;
                            precise float productValue406 = productValue403 * (-1.44269502162933349609375f);
                            precise float productValue407 = productValue404 * (-1.44269502162933349609375f);
                            precise float productValue408 = productValue405 * (-1.44269502162933349609375f);
                            precise float productValue409 = viewCbConstants[53u].x * intermediateValue304;
                            precise float sumValue245 = productValue409 + reinterpretedBits40;
                            precise float productValue410 = viewCbConstants[53u].z * intermediateValue304;
                            precise float sumValue246 = productValue410 + reinterpretedBits42;
                            precise float productValue411 = sumValue245 * viewCbConstants[83u].z;
                            precise float sumValue247 = productValue411 + viewCbConstants[84u].x;
                            precise float productValue412 = sumValue246 * viewCbConstants[83u].w;
                            precise float sumValue248 = productValue412 + viewCbConstants[84u].y;
                            float4 sampledTextureValue12 = wibblyTexture.SampleLevel(linearWrapSampler, float2(sumValue247, sumValue248), 0.0f);
                            precise float sumValue249 = sampledTextureValue12.x + (-0.5f);
                            precise float sumValue250 = sampledTextureValue12.y + (-0.5f);
                            precise float productValue413 = sumValue245 * viewCbConstants[82u].z;
                            precise float sumValue251 = productValue413 + viewCbConstants[83u].x;
                            precise float productValue414 = sumValue246 * viewCbConstants[82u].w;
                            precise float sumValue252 = productValue414 + viewCbConstants[83u].y;
                            precise float productValue415 = sumValue249 * 0.4000000059604644775390625f;
                            precise float productValue416 = sumValue250 * 0.4000000059604644775390625f;
                            precise float sumValue253 = sumValue251 + productValue415;
                            precise float sumValue254 = productValue416 + sumValue252;
                            precise float productValue417 = viewCbConstants[68u].w * 63.0f;
                            uint intermediateValue314 = uint(int(floor(productValue417)));
                            precise float productValue418 = float(int(intermediateValue314 + 1u)) * 0.015625f;
                            precise float sumValue255 = (-0.0f) - productValue418;
                            float intermediateValue315 = frac(abs(productValue418));
                            precise float sumValue256 = (-0.0f) - intermediateValue315;
                            precise float comparisonValue77 = ((productValue418 >= sumValue255) ? intermediateValue315 : sumValue256) * 64.0f;
                            float4 sampledTextureValue13 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue253, sumValue254, float(int(intermediateValue314))), 0.0f);
                            float intermediateValue316 = sampledTextureValue13.x;
                            precise float sampledTextureValue14 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue253, sumValue254, float(int(uint(int(comparisonValue77))))), 0.0f).x - intermediateValue316;
                            precise float productValue419 = frac(productValue417) * sampledTextureValue14;
                            precise float sumValue257 = intermediateValue316 + productValue419;
                            precise float productValue420 = sumValue257 * 7.0f;
                            precise float sumValue258 = productValue420 + 0.800000011920928955078125f;
                            precise float productValue421 = intermediateValue304 * (-0.100000001490116119384765625f);
                            precise float sumValue259 = sumValue258 + (-1.0f);
                            precise float exponentialValue = exp2(productValue421) * sumValue259;
                            precise float sumValue260 = exponentialValue + 1.0f;
                            precise float exponentialValue1 = exp2(productValue406) * sumValue260;
                            precise float exponentialValue2 = exp2(productValue407) * sumValue260;
                            precise float exponentialValue3 = exp2(productValue408) * sumValue260;
                            RayDesc _15ident = {float3(reinterpretedBits40, reinterpretedBits41, reinterpretedBits42), 0.0f, float3(viewCbConstants[53u].xyz), intermediateValue304};
                            intermediateValue317.TraceRayInline(SceneBVH, 512u, 22u, _15ident);
                            bool intermediateValue318 = intermediateValue317.Proceed();
                            float intermediateValue334;
                            float intermediateValue336;
                            float intermediateValue338;
                            if (intermediateValue318)
                            {
                                float intermediateValue335;
                                float intermediateValue337;
                                float intermediateValue339;
                                float intermediateValue364 = exponentialValue1;
                                float intermediateValue365 = exponentialValue2;
                                float intermediateValue366 = exponentialValue3;
                                bool comparisonValue87;
                                for (;;)
                                {
                                    uint intermediateValue367 = intermediateValue317.CandidateType();
                                    comparisonValue87 = intermediateValue367 == 0u;
                                    float branchMergedValue2;
                                    float branchMergedValue13;
                                    float branchMergedValue14;
                                    if (comparisonValue87)
                                    {
                                        float2 intermediateValue386 = intermediateValue317.CandidateTriangleBarycentrics();
                                        float2 intermediateValue387 = intermediateValue317.CandidateTriangleBarycentrics();
                                        float intermediateValue388 = intermediateValue317.CandidateTriangleRayT();
                                        uint intermediateValue389 = intermediateValue317.CandidatePrimitiveIndex();
                                        uint intermediateValue390 = intermediateValue317.CandidateInstanceID();
                                        uint intermediateValue391 = intermediateValue317.CandidateInstanceIndex();
                                        uint productValue470 = (intermediateValue391 * 76u) + 58u;
                                        uint productValue471 = (intermediateValue391 * 76u) + 61u;
                                        precise float sumValue301 = 1.0f - intermediateValue386.x;
                                        precise float sumValue302 = sumValue301 - intermediateValue387.y;
                                        uint bitwiseValue191 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue391 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue389 >> 1u);
                                        uint productValue472 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue391 * 76u) + 54u) * 2 + 0)) + 0u;
                                        bool comparisonValue91 = (intermediateValue389 & 1u) == 0u;
                                        uint comparisonValue92 = comparisonValue91 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue472), bitwiseValue191 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue472), bitwiseValue191 * 16 + 0).x;
                                        uint comparisonValue93 = comparisonValue91 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue472), bitwiseValue191 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue472), bitwiseValue191 * 16 + 0).w;
                                        uint comparisonValue94 = comparisonValue91 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue472), bitwiseValue191 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue472), bitwiseValue191 * 16 + 0).z;
                                        bool productValue473 = rdByteLoad_objectInstances_uint16_t(0u, productValue471 * 2 + 0) < 0u;
                                        float intermediateValue453;
                                        float intermediateValue454;
                                        if (productValue473)
                                        {
                                            uint bitwiseValue202 = comparisonValue94 >> 15u;
                                            precise float bitwiseValue203 = float(bitwiseValue202 & 1u) * 2.0f;
                                            precise float sumValue317 = bitwiseValue203 + (-1.0f);
                                            precise float bitwiseValue204 = float(comparisonValue94 >> 31u) * 2.0f;
                                            precise float sumValue318 = bitwiseValue204 + (-1.0f);
                                            precise float bitwiseValue205 = float((comparisonValue94 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue206 = float(bitwiseValue202 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue495 = sumValue317 * 3.0517578125e-05f;
                                            precise float productValue496 = sumValue318 * 3.0517578125e-05f;
                                            precise float sumValue319 = bitwiseValue205 + productValue495;
                                            precise float sumValue320 = bitwiseValue206 + productValue496;
                                            intermediateValue453 = sumValue319;
                                            intermediateValue454 = sumValue320;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue207 = float(comparisonValue94 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue208 = float(comparisonValue94 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue497 = bitwiseValue207 * 16384.0f;
                                            precise float sumValue321 = productValue497 + 0.5f;
                                            precise float productValue498 = bitwiseValue208 * 16384.0f;
                                            precise float sumValue322 = productValue498 + 0.5f;
                                            precise float productValue499 = floor(sumValue321) * 6.103515625e-05f;
                                            precise float productValue500 = floor(sumValue322) * 6.103515625e-05f;
                                            intermediateValue453 = productValue499;
                                            intermediateValue454 = productValue500;
                                        }
                                        precise float productValue532 = sumValue302 * intermediateValue453;
                                        precise float productValue533 = sumValue302 * intermediateValue454;
                                        precise float sumValue350 = productValue532 + 0.0f;
                                        precise float sumValue351 = productValue533 + 0.0f;
                                        float intermediateValue487;
                                        float intermediateValue488;
                                        if (productValue473)
                                        {
                                            uint bitwiseValue246 = comparisonValue93 >> 15u;
                                            precise float bitwiseValue247 = float(bitwiseValue246 & 1u) * 2.0f;
                                            precise float sumValue371 = bitwiseValue247 + (-1.0f);
                                            precise float bitwiseValue248 = float(comparisonValue93 >> 31u) * 2.0f;
                                            precise float sumValue372 = bitwiseValue248 + (-1.0f);
                                            precise float bitwiseValue249 = float((comparisonValue93 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue250 = float(bitwiseValue246 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue560 = sumValue371 * 3.0517578125e-05f;
                                            precise float productValue561 = sumValue372 * 3.0517578125e-05f;
                                            precise float sumValue373 = bitwiseValue249 + productValue560;
                                            precise float sumValue374 = bitwiseValue250 + productValue561;
                                            intermediateValue487 = sumValue373;
                                            intermediateValue488 = sumValue374;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue251 = float(comparisonValue93 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue252 = float(comparisonValue93 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue562 = bitwiseValue251 * 16384.0f;
                                            precise float sumValue375 = productValue562 + 0.5f;
                                            precise float productValue563 = bitwiseValue252 * 16384.0f;
                                            precise float sumValue376 = productValue563 + 0.5f;
                                            precise float productValue564 = floor(sumValue375) * 6.103515625e-05f;
                                            precise float productValue565 = floor(sumValue376) * 6.103515625e-05f;
                                            intermediateValue487 = productValue564;
                                            intermediateValue488 = productValue565;
                                        }
                                        precise float productValue598 = intermediateValue386.x * intermediateValue487;
                                        precise float productValue599 = intermediateValue386.x * intermediateValue488;
                                        precise float sumValue409 = sumValue350 + productValue598;
                                        precise float sumValue410 = sumValue351 + productValue599;
                                        float intermediateValue500;
                                        float intermediateValue501;
                                        if (productValue473)
                                        {
                                            uint bitwiseValue288 = comparisonValue92 >> 15u;
                                            precise float bitwiseValue289 = float(bitwiseValue288 & 1u) * 2.0f;
                                            precise float sumValue421 = bitwiseValue289 + (-1.0f);
                                            precise float bitwiseValue290 = float(comparisonValue92 >> 31u) * 2.0f;
                                            precise float sumValue422 = bitwiseValue290 + (-1.0f);
                                            precise float bitwiseValue291 = float((comparisonValue92 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue292 = float(bitwiseValue288 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue610 = sumValue421 * 3.0517578125e-05f;
                                            precise float productValue611 = sumValue422 * 3.0517578125e-05f;
                                            precise float sumValue423 = bitwiseValue291 + productValue610;
                                            precise float sumValue424 = bitwiseValue292 + productValue611;
                                            intermediateValue500 = sumValue423;
                                            intermediateValue501 = sumValue424;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue293 = float(comparisonValue92 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue294 = float(comparisonValue92 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue612 = bitwiseValue293 * 16384.0f;
                                            precise float sumValue425 = productValue612 + 0.5f;
                                            precise float productValue613 = bitwiseValue294 * 16384.0f;
                                            precise float sumValue426 = productValue613 + 0.5f;
                                            precise float productValue614 = floor(sumValue425) * 6.103515625e-05f;
                                            precise float productValue615 = floor(sumValue426) * 6.103515625e-05f;
                                            intermediateValue500 = productValue614;
                                            intermediateValue501 = productValue615;
                                        }
                                        precise float productValue646 = intermediateValue387.y * intermediateValue500;
                                        precise float productValue647 = intermediateValue387.y * intermediateValue501;
                                        precise float sumValue457 = sumValue409 + productValue646;
                                        precise float sumValue458 = sumValue410 + productValue647;
                                        precise float productValue648 = intermediateValue388 * 0.083333335816860198974609375f;
                                        precise float sumValue459 = productValue648 + (-0.25f);
                                        float intermediateValue512;
                                        float intermediateValue513;
                                        float intermediateValue514;
                                        float intermediateValue515;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue470 * 2 + 0) == 65535u)
                                        {
                                            intermediateValue512 = 1.0f;
                                            intermediateValue513 = 1.0f;
                                            intermediateValue514 = 1.0f;
                                            intermediateValue515 = 1.0f;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits56;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue470 * 2 + 0) > 4095u)
                                            {
                                                reinterpretedBits56 = asuint(viewCbConstants[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits56 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue470 * 2 + 0));
                                            }
                                            float4 sampledTextureValue20 = textures[NonUniformResourceIndex(reinterpretedBits56 + 0u)].SampleLevel(defaultSampler, float2(sumValue457, sumValue458), min(sumValue459, 2.0f));
                                            intermediateValue512 = sampledTextureValue20.x;
                                            intermediateValue513 = sampledTextureValue20.y;
                                            intermediateValue514 = sampledTextureValue20.z;
                                            intermediateValue515 = sampledTextureValue20.w;
                                        }
                                        float intermediateValue532;
                                        float intermediateValue533;
                                        float intermediateValue534;
                                        if (intermediateValue390 == 2u)
                                        {
                                            float branchMergedValue42;
                                            float branchMergedValue69;
                                            float branchMergedValue70;
                                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue471 * 2 + 0) & 128u) == 0u)
                                            {
                                                float intermediateValue552;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue471 * 2 + 0) & 2048u) == 0u)
                                                {
                                                    intermediateValue552 = intermediateValue515;
                                                }
                                                else
                                                {
                                                    precise float productValue695 = intermediateValue515 * 2.0f;
                                                    precise float sumValue510 = productValue695 + (-1.0f);
                                                    intermediateValue552 = clamp(sumValue510, 0.0f, 1.0f);
                                                }
                                                precise float sumValue507 = 0.0f - intermediateValue512;
                                                precise float sumValue508 = 0.0f - intermediateValue513;
                                                precise float sumValue509 = 0.0f - intermediateValue514;
                                                precise float productValue692 = sumValue507 * intermediateValue552;
                                                precise float productValue693 = sumValue508 * intermediateValue552;
                                                precise float productValue694 = sumValue509 * intermediateValue552;
                                                precise float sumValue495 = intermediateValue512 + productValue692;
                                                precise float sumValue496 = intermediateValue513 + productValue693;
                                                precise float sumValue497 = intermediateValue514 + productValue694;
                                                branchMergedValue42 = sumValue497;
                                                branchMergedValue69 = sumValue496;
                                                branchMergedValue70 = sumValue495;
                                            }
                                            else
                                            {
                                                branchMergedValue42 = 0.33399999141693115234375f;
                                                branchMergedValue69 = 0.33399999141693115234375f;
                                                branchMergedValue70 = 0.33399999141693115234375f;
                                            }
                                            intermediateValue532 = branchMergedValue70;
                                            intermediateValue533 = branchMergedValue69;
                                            intermediateValue534 = branchMergedValue42;
                                        }
                                        else
                                        {
                                            precise float sumValue485 = 1.0f - intermediateValue515;
                                            intermediateValue532 = sumValue485;
                                            intermediateValue533 = sumValue485;
                                            intermediateValue534 = sumValue485;
                                        }
                                        precise float productValue680 = intermediateValue364 * intermediateValue532;
                                        precise float productValue681 = intermediateValue365 * intermediateValue533;
                                        precise float productValue682 = intermediateValue366 * intermediateValue534;
                                        float intermediateValue392;
                                        float intermediateValue393;
                                        float intermediateValue394;
                                        bool intermediateValue553;
                                        if (!(dot(float3(productValue680, productValue681, productValue682), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                        {
                                            intermediateValue553 = false;
                                            intermediateValue392 = productValue680;
                                            intermediateValue393 = productValue681;
                                            intermediateValue394 = productValue682;
                                        }
                                        else
                                        {
                                            intermediateValue553 = true;
                                            intermediateValue392 = 0.0f;
                                            intermediateValue393 = 0.0f;
                                            intermediateValue394 = 0.0f;
                                        }
                                        float branchMergedValue83;
                                        float branchMergedValue93;
                                        float branchMergedValue94;
                                        if (intermediateValue553)
                                        {
                                            intermediateValue317.CommitNonOpaqueTriangleHit();
                                            branchMergedValue83 = intermediateValue394;
                                            branchMergedValue93 = intermediateValue393;
                                            branchMergedValue94 = intermediateValue392;
                                        }
                                        else
                                        {
                                            branchMergedValue83 = intermediateValue394;
                                            branchMergedValue93 = intermediateValue393;
                                            branchMergedValue94 = intermediateValue392;
                                        }
                                        branchMergedValue2 = branchMergedValue83;
                                        branchMergedValue13 = branchMergedValue93;
                                        branchMergedValue14 = branchMergedValue94;
                                    }
                                    else
                                    {
                                        branchMergedValue2 = intermediateValue366;
                                        branchMergedValue13 = intermediateValue365;
                                        branchMergedValue14 = intermediateValue364;
                                    }
                                    intermediateValue339 = branchMergedValue2;
                                    intermediateValue337 = branchMergedValue13;
                                    intermediateValue335 = branchMergedValue14;
                                    bool intermediateValue395 = intermediateValue317.Proceed();
                                    if (intermediateValue395)
                                    {
                                        intermediateValue364 = intermediateValue335;
                                        intermediateValue365 = intermediateValue337;
                                        intermediateValue366 = intermediateValue339;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue334 = intermediateValue335;
                                intermediateValue336 = intermediateValue337;
                                intermediateValue338 = intermediateValue339;
                            }
                            else
                            {
                                intermediateValue334 = exponentialValue1;
                                intermediateValue336 = exponentialValue2;
                                intermediateValue338 = exponentialValue3;
                            }
                            uint intermediateValue340 = intermediateValue317.CommittedStatus();
                            bool comparisonValue83 = intermediateValue340 == 1u;
                            float comparisonValue65 = comparisonValue83 ? 0.0f : intermediateValue334;
                            float comparisonValue66 = comparisonValue83 ? 0.0f : intermediateValue336;
                            float comparisonValue67 = comparisonValue83 ? 0.0f : intermediateValue338;
                            float branchMergedValue113;
                            float branchMergedValue120;
                            float branchMergedValue121;
                            if (dot(float3(comparisonValue65, comparisonValue66, comparisonValue67), 1.0f.xxx) > 0.00999999977648258209228515625f)
                            {
                                RayDesc _16ident = {float3(sumValue245, mad(viewCbConstants[53u].y, intermediateValue304, reinterpretedBits41), sumValue246), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                                intermediateValue368.TraceRayInline(SceneBVH, 512u, 22u, _16ident);
                                bool intermediateValue369 = intermediateValue368.Proceed();
                                float intermediateValue396;
                                float intermediateValue398;
                                float intermediateValue400;
                                if (intermediateValue369)
                                {
                                    float intermediateValue397;
                                    float intermediateValue399;
                                    float intermediateValue401;
                                    float intermediateValue442 = comparisonValue65;
                                    float intermediateValue443 = comparisonValue66;
                                    float intermediateValue444 = comparisonValue67;
                                    bool comparisonValue109;
                                    for (;;)
                                    {
                                        uint intermediateValue445 = intermediateValue368.CandidateType();
                                        comparisonValue109 = intermediateValue445 == 0u;
                                        float branchMergedValue6;
                                        float branchMergedValue21;
                                        float branchMergedValue22;
                                        if (comparisonValue109)
                                        {
                                            float2 intermediateValue455 = intermediateValue368.CandidateTriangleBarycentrics();
                                            float2 intermediateValue456 = intermediateValue368.CandidateTriangleBarycentrics();
                                            float intermediateValue457 = intermediateValue368.CandidateTriangleRayT();
                                            uint intermediateValue458 = intermediateValue368.CandidatePrimitiveIndex();
                                            uint intermediateValue459 = intermediateValue368.CandidateInstanceID();
                                            uint intermediateValue460 = intermediateValue368.CandidateInstanceIndex();
                                            uint productValue534 = (intermediateValue460 * 76u) + 58u;
                                            uint productValue535 = (intermediateValue460 * 76u) + 61u;
                                            precise float sumValue352 = 1.0f - intermediateValue455.x;
                                            precise float sumValue353 = sumValue352 - intermediateValue456.y;
                                            uint bitwiseValue237 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue460 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue458 >> 1u);
                                            uint productValue536 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue460 * 76u) + 54u) * 2 + 0)) + 0u;
                                            bool comparisonValue111 = (intermediateValue458 & 1u) == 0u;
                                            uint comparisonValue112 = comparisonValue111 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue536), bitwiseValue237 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue536), bitwiseValue237 * 16 + 0).x;
                                            uint comparisonValue113 = comparisonValue111 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue536), bitwiseValue237 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue536), bitwiseValue237 * 16 + 0).w;
                                            uint comparisonValue114 = comparisonValue111 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue536), bitwiseValue237 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue536), bitwiseValue237 * 16 + 0).z;
                                            bool productValue537 = rdByteLoad_objectInstances_uint16_t(0u, productValue535 * 2 + 0) < 0u;
                                            float intermediateValue489;
                                            float intermediateValue490;
                                            if (productValue537)
                                            {
                                                uint bitwiseValue253 = comparisonValue114 >> 15u;
                                                precise float bitwiseValue254 = float(bitwiseValue253 & 1u) * 2.0f;
                                                precise float sumValue377 = bitwiseValue254 + (-1.0f);
                                                precise float bitwiseValue255 = float(comparisonValue114 >> 31u) * 2.0f;
                                                precise float sumValue378 = bitwiseValue255 + (-1.0f);
                                                precise float bitwiseValue256 = float((comparisonValue114 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue257 = float(bitwiseValue253 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue566 = sumValue377 * 3.0517578125e-05f;
                                                precise float productValue567 = sumValue378 * 3.0517578125e-05f;
                                                precise float sumValue379 = bitwiseValue256 + productValue566;
                                                precise float sumValue380 = bitwiseValue257 + productValue567;
                                                intermediateValue489 = sumValue379;
                                                intermediateValue490 = sumValue380;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue258 = float(comparisonValue114 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue259 = float(comparisonValue114 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue568 = bitwiseValue258 * 16384.0f;
                                                precise float sumValue381 = productValue568 + 0.5f;
                                                precise float productValue569 = bitwiseValue259 * 16384.0f;
                                                precise float sumValue382 = productValue569 + 0.5f;
                                                precise float productValue570 = floor(sumValue381) * 6.103515625e-05f;
                                                precise float productValue571 = floor(sumValue382) * 6.103515625e-05f;
                                                intermediateValue489 = productValue570;
                                                intermediateValue490 = productValue571;
                                            }
                                            precise float productValue600 = sumValue353 * intermediateValue489;
                                            precise float productValue601 = sumValue353 * intermediateValue490;
                                            precise float sumValue411 = productValue600 + 0.0f;
                                            precise float sumValue412 = productValue601 + 0.0f;
                                            float intermediateValue502;
                                            float intermediateValue503;
                                            if (productValue537)
                                            {
                                                uint bitwiseValue295 = comparisonValue113 >> 15u;
                                                precise float bitwiseValue296 = float(bitwiseValue295 & 1u) * 2.0f;
                                                precise float sumValue427 = bitwiseValue296 + (-1.0f);
                                                precise float bitwiseValue297 = float(comparisonValue113 >> 31u) * 2.0f;
                                                precise float sumValue428 = bitwiseValue297 + (-1.0f);
                                                precise float bitwiseValue298 = float((comparisonValue113 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue299 = float(bitwiseValue295 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue616 = sumValue427 * 3.0517578125e-05f;
                                                precise float productValue617 = sumValue428 * 3.0517578125e-05f;
                                                precise float sumValue429 = bitwiseValue298 + productValue616;
                                                precise float sumValue430 = bitwiseValue299 + productValue617;
                                                intermediateValue502 = sumValue429;
                                                intermediateValue503 = sumValue430;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue300 = float(comparisonValue113 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue301 = float(comparisonValue113 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue618 = bitwiseValue300 * 16384.0f;
                                                precise float sumValue431 = productValue618 + 0.5f;
                                                precise float productValue619 = bitwiseValue301 * 16384.0f;
                                                precise float sumValue432 = productValue619 + 0.5f;
                                                precise float productValue620 = floor(sumValue431) * 6.103515625e-05f;
                                                precise float productValue621 = floor(sumValue432) * 6.103515625e-05f;
                                                intermediateValue502 = productValue620;
                                                intermediateValue503 = productValue621;
                                            }
                                            precise float productValue649 = intermediateValue455.x * intermediateValue502;
                                            precise float productValue650 = intermediateValue455.x * intermediateValue503;
                                            precise float sumValue460 = sumValue411 + productValue649;
                                            precise float sumValue461 = sumValue412 + productValue650;
                                            float intermediateValue528;
                                            float intermediateValue529;
                                            if (productValue537)
                                            {
                                                uint bitwiseValue330 = comparisonValue112 >> 15u;
                                                precise float bitwiseValue331 = float(bitwiseValue330 & 1u) * 2.0f;
                                                precise float sumValue473 = bitwiseValue331 + (-1.0f);
                                                precise float bitwiseValue332 = float(comparisonValue112 >> 31u) * 2.0f;
                                                precise float sumValue474 = bitwiseValue332 + (-1.0f);
                                                precise float bitwiseValue333 = float((comparisonValue112 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue334 = float(bitwiseValue330 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue662 = sumValue473 * 3.0517578125e-05f;
                                                precise float productValue663 = sumValue474 * 3.0517578125e-05f;
                                                precise float sumValue475 = bitwiseValue333 + productValue662;
                                                precise float sumValue476 = bitwiseValue334 + productValue663;
                                                intermediateValue528 = sumValue475;
                                                intermediateValue529 = sumValue476;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue335 = float(comparisonValue112 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue336 = float(comparisonValue112 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue664 = bitwiseValue335 * 16384.0f;
                                                precise float sumValue477 = productValue664 + 0.5f;
                                                precise float productValue665 = bitwiseValue336 * 16384.0f;
                                                precise float sumValue478 = productValue665 + 0.5f;
                                                precise float productValue666 = floor(sumValue477) * 6.103515625e-05f;
                                                precise float productValue667 = floor(sumValue478) * 6.103515625e-05f;
                                                intermediateValue528 = productValue666;
                                                intermediateValue529 = productValue667;
                                            }
                                            precise float productValue674 = intermediateValue456.y * intermediateValue528;
                                            precise float productValue675 = intermediateValue456.y * intermediateValue529;
                                            precise float sumValue486 = sumValue460 + productValue674;
                                            precise float sumValue487 = sumValue461 + productValue675;
                                            precise float productValue676 = intermediateValue457 * 0.083333335816860198974609375f;
                                            precise float sumValue488 = productValue676 + (-0.25f);
                                            float intermediateValue535;
                                            float intermediateValue536;
                                            float intermediateValue537;
                                            float intermediateValue538;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue534 * 2 + 0) == 65535u)
                                            {
                                                intermediateValue535 = 1.0f;
                                                intermediateValue536 = 1.0f;
                                                intermediateValue537 = 1.0f;
                                                intermediateValue538 = 1.0f;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits60;
                                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue534 * 2 + 0) > 4095u)
                                                {
                                                    reinterpretedBits60 = asuint(viewCbConstants[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits60 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue534 * 2 + 0));
                                                }
                                                float4 sampledTextureValue24 = textures[NonUniformResourceIndex(reinterpretedBits60 + 0u)].SampleLevel(defaultSampler, float2(sumValue486, sumValue487), min(sumValue488, 2.0f));
                                                intermediateValue535 = sampledTextureValue24.x;
                                                intermediateValue536 = sampledTextureValue24.y;
                                                intermediateValue537 = sampledTextureValue24.z;
                                                intermediateValue538 = sampledTextureValue24.w;
                                            }
                                            float intermediateValue560;
                                            float intermediateValue561;
                                            float intermediateValue562;
                                            if (intermediateValue459 == 2u)
                                            {
                                                float branchMergedValue46;
                                                float branchMergedValue77;
                                                float branchMergedValue78;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue535 * 2 + 0) & 128u) == 0u)
                                                {
                                                    float intermediateValue566;
                                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue535 * 2 + 0) & 2048u) == 0u)
                                                    {
                                                        intermediateValue566 = intermediateValue538;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue717 = intermediateValue538 * 2.0f;
                                                        precise float sumValue534 = productValue717 + (-1.0f);
                                                        intermediateValue566 = clamp(sumValue534, 0.0f, 1.0f);
                                                    }
                                                    precise float sumValue531 = 0.0f - intermediateValue535;
                                                    precise float sumValue532 = 0.0f - intermediateValue536;
                                                    precise float sumValue533 = 0.0f - intermediateValue537;
                                                    precise float productValue714 = sumValue531 * intermediateValue566;
                                                    precise float productValue715 = sumValue532 * intermediateValue566;
                                                    precise float productValue716 = sumValue533 * intermediateValue566;
                                                    precise float sumValue525 = intermediateValue535 + productValue714;
                                                    precise float sumValue526 = intermediateValue536 + productValue715;
                                                    precise float sumValue527 = intermediateValue537 + productValue716;
                                                    branchMergedValue46 = sumValue527;
                                                    branchMergedValue77 = sumValue526;
                                                    branchMergedValue78 = sumValue525;
                                                }
                                                else
                                                {
                                                    branchMergedValue46 = 0.33399999141693115234375f;
                                                    branchMergedValue77 = 0.33399999141693115234375f;
                                                    branchMergedValue78 = 0.33399999141693115234375f;
                                                }
                                                intermediateValue560 = branchMergedValue78;
                                                intermediateValue561 = branchMergedValue77;
                                                intermediateValue562 = branchMergedValue46;
                                            }
                                            else
                                            {
                                                precise float sumValue511 = 1.0f - intermediateValue538;
                                                intermediateValue560 = sumValue511;
                                                intermediateValue561 = sumValue511;
                                                intermediateValue562 = sumValue511;
                                            }
                                            precise float productValue708 = intermediateValue442 * intermediateValue560;
                                            precise float productValue709 = intermediateValue443 * intermediateValue561;
                                            precise float productValue710 = intermediateValue444 * intermediateValue562;
                                            float intermediateValue461;
                                            float intermediateValue462;
                                            float intermediateValue463;
                                            bool intermediateValue567;
                                            if (!(dot(float3(productValue708, productValue709, productValue710), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                            {
                                                intermediateValue567 = false;
                                                intermediateValue461 = productValue708;
                                                intermediateValue462 = productValue709;
                                                intermediateValue463 = productValue710;
                                            }
                                            else
                                            {
                                                intermediateValue567 = true;
                                                intermediateValue461 = 0.0f;
                                                intermediateValue462 = 0.0f;
                                                intermediateValue463 = 0.0f;
                                            }
                                            float branchMergedValue87;
                                            float branchMergedValue101;
                                            float branchMergedValue102;
                                            if (intermediateValue567)
                                            {
                                                intermediateValue368.CommitNonOpaqueTriangleHit();
                                                branchMergedValue87 = intermediateValue463;
                                                branchMergedValue101 = intermediateValue462;
                                                branchMergedValue102 = intermediateValue461;
                                            }
                                            else
                                            {
                                                branchMergedValue87 = intermediateValue463;
                                                branchMergedValue101 = intermediateValue462;
                                                branchMergedValue102 = intermediateValue461;
                                            }
                                            branchMergedValue6 = branchMergedValue87;
                                            branchMergedValue21 = branchMergedValue101;
                                            branchMergedValue22 = branchMergedValue102;
                                        }
                                        else
                                        {
                                            branchMergedValue6 = intermediateValue444;
                                            branchMergedValue21 = intermediateValue443;
                                            branchMergedValue22 = intermediateValue442;
                                        }
                                        intermediateValue401 = branchMergedValue6;
                                        intermediateValue399 = branchMergedValue21;
                                        intermediateValue397 = branchMergedValue22;
                                        bool intermediateValue464 = intermediateValue368.Proceed();
                                        if (intermediateValue464)
                                        {
                                            intermediateValue442 = intermediateValue397;
                                            intermediateValue443 = intermediateValue399;
                                            intermediateValue444 = intermediateValue401;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue396 = intermediateValue397;
                                    intermediateValue398 = intermediateValue399;
                                    intermediateValue400 = intermediateValue401;
                                }
                                else
                                {
                                    intermediateValue396 = comparisonValue65;
                                    intermediateValue398 = comparisonValue66;
                                    intermediateValue400 = comparisonValue67;
                                }
                                uint intermediateValue402 = intermediateValue368.CommittedStatus();
                                bool comparisonValue95 = intermediateValue402 == 1u;
                                branchMergedValue113 = comparisonValue95 ? 0.0f : intermediateValue398;
                                branchMergedValue120 = comparisonValue95 ? 0.0f : intermediateValue396;
                                branchMergedValue121 = comparisonValue95 ? 0.0f : intermediateValue400;
                            }
                            else
                            {
                                branchMergedValue113 = comparisonValue66;
                                branchMergedValue120 = comparisonValue65;
                                branchMergedValue121 = comparisonValue67;
                            }
                            branchMergedValue40 = branchMergedValue113;
                            branchMergedValue65 = branchMergedValue120;
                            branchMergedValue66 = branchMergedValue121;
                        }
                        else
                        {
                            RayDesc _17ident = {float3(reinterpretedBits40, reinterpretedBits41, reinterpretedBits42), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                            intermediateValue319.TraceRayInline(SceneBVH, 512u, 22u, _17ident);
                            bool intermediateValue320 = intermediateValue319.Proceed();
                            float intermediateValue341;
                            float intermediateValue343;
                            float intermediateValue345;
                            if (intermediateValue320)
                            {
                                float intermediateValue342;
                                float intermediateValue344;
                                float intermediateValue346;
                                float intermediateValue370 = 1.0f;
                                float intermediateValue371 = 1.0f;
                                float intermediateValue372 = 1.0f;
                                bool comparisonValue88;
                                for (;;)
                                {
                                    uint intermediateValue373 = intermediateValue319.CandidateType();
                                    comparisonValue88 = intermediateValue373 == 0u;
                                    float branchMergedValue3;
                                    float branchMergedValue15;
                                    float branchMergedValue16;
                                    if (comparisonValue88)
                                    {
                                        float2 intermediateValue403 = intermediateValue319.CandidateTriangleBarycentrics();
                                        float2 intermediateValue404 = intermediateValue319.CandidateTriangleBarycentrics();
                                        float intermediateValue405 = intermediateValue319.CandidateTriangleRayT();
                                        uint intermediateValue406 = intermediateValue319.CandidatePrimitiveIndex();
                                        uint intermediateValue407 = intermediateValue319.CandidateInstanceID();
                                        uint intermediateValue408 = intermediateValue319.CandidateInstanceIndex();
                                        uint productValue474 = (intermediateValue408 * 76u) + 58u;
                                        uint productValue475 = (intermediateValue408 * 76u) + 61u;
                                        precise float sumValue303 = 1.0f - intermediateValue403.x;
                                        precise float sumValue304 = sumValue303 - intermediateValue404.y;
                                        uint bitwiseValue192 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue408 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue406 >> 1u);
                                        uint productValue476 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue408 * 76u) + 54u) * 2 + 0)) + 0u;
                                        bool comparisonValue96 = (intermediateValue406 & 1u) == 0u;
                                        uint comparisonValue97 = comparisonValue96 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue476), bitwiseValue192 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue476), bitwiseValue192 * 16 + 0).x;
                                        uint comparisonValue98 = comparisonValue96 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue476), bitwiseValue192 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue476), bitwiseValue192 * 16 + 0).w;
                                        uint comparisonValue99 = comparisonValue96 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue476), bitwiseValue192 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue476), bitwiseValue192 * 16 + 0).z;
                                        bool productValue477 = rdByteLoad_objectInstances_uint16_t(0u, productValue475 * 2 + 0) < 0u;
                                        float intermediateValue465;
                                        float intermediateValue466;
                                        if (productValue477)
                                        {
                                            uint bitwiseValue209 = comparisonValue99 >> 15u;
                                            precise float bitwiseValue210 = float(bitwiseValue209 & 1u) * 2.0f;
                                            precise float sumValue323 = bitwiseValue210 + (-1.0f);
                                            precise float bitwiseValue211 = float(comparisonValue99 >> 31u) * 2.0f;
                                            precise float sumValue324 = bitwiseValue211 + (-1.0f);
                                            precise float bitwiseValue212 = float((comparisonValue99 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue213 = float(bitwiseValue209 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue501 = sumValue323 * 3.0517578125e-05f;
                                            precise float productValue502 = sumValue324 * 3.0517578125e-05f;
                                            precise float sumValue325 = bitwiseValue212 + productValue501;
                                            precise float sumValue326 = bitwiseValue213 + productValue502;
                                            intermediateValue465 = sumValue325;
                                            intermediateValue466 = sumValue326;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue214 = float(comparisonValue99 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue215 = float(comparisonValue99 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue503 = bitwiseValue214 * 16384.0f;
                                            precise float sumValue327 = productValue503 + 0.5f;
                                            precise float productValue504 = bitwiseValue215 * 16384.0f;
                                            precise float sumValue328 = productValue504 + 0.5f;
                                            precise float productValue505 = floor(sumValue327) * 6.103515625e-05f;
                                            precise float productValue506 = floor(sumValue328) * 6.103515625e-05f;
                                            intermediateValue465 = productValue505;
                                            intermediateValue466 = productValue506;
                                        }
                                        precise float productValue538 = sumValue304 * intermediateValue465;
                                        precise float productValue539 = sumValue304 * intermediateValue466;
                                        precise float sumValue354 = productValue538 + 0.0f;
                                        precise float sumValue355 = productValue539 + 0.0f;
                                        float intermediateValue491;
                                        float intermediateValue492;
                                        if (productValue477)
                                        {
                                            uint bitwiseValue260 = comparisonValue98 >> 15u;
                                            precise float bitwiseValue261 = float(bitwiseValue260 & 1u) * 2.0f;
                                            precise float sumValue383 = bitwiseValue261 + (-1.0f);
                                            precise float bitwiseValue262 = float(comparisonValue98 >> 31u) * 2.0f;
                                            precise float sumValue384 = bitwiseValue262 + (-1.0f);
                                            precise float bitwiseValue263 = float((comparisonValue98 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue264 = float(bitwiseValue260 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue572 = sumValue383 * 3.0517578125e-05f;
                                            precise float productValue573 = sumValue384 * 3.0517578125e-05f;
                                            precise float sumValue385 = bitwiseValue263 + productValue572;
                                            precise float sumValue386 = bitwiseValue264 + productValue573;
                                            intermediateValue491 = sumValue385;
                                            intermediateValue492 = sumValue386;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue265 = float(comparisonValue98 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue266 = float(comparisonValue98 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue574 = bitwiseValue265 * 16384.0f;
                                            precise float sumValue387 = productValue574 + 0.5f;
                                            precise float productValue575 = bitwiseValue266 * 16384.0f;
                                            precise float sumValue388 = productValue575 + 0.5f;
                                            precise float productValue576 = floor(sumValue387) * 6.103515625e-05f;
                                            precise float productValue577 = floor(sumValue388) * 6.103515625e-05f;
                                            intermediateValue491 = productValue576;
                                            intermediateValue492 = productValue577;
                                        }
                                        precise float productValue602 = intermediateValue403.x * intermediateValue491;
                                        precise float productValue603 = intermediateValue403.x * intermediateValue492;
                                        precise float sumValue413 = sumValue354 + productValue602;
                                        precise float sumValue414 = sumValue355 + productValue603;
                                        float intermediateValue504;
                                        float intermediateValue505;
                                        if (productValue477)
                                        {
                                            uint bitwiseValue302 = comparisonValue97 >> 15u;
                                            precise float bitwiseValue303 = float(bitwiseValue302 & 1u) * 2.0f;
                                            precise float sumValue433 = bitwiseValue303 + (-1.0f);
                                            precise float bitwiseValue304 = float(comparisonValue97 >> 31u) * 2.0f;
                                            precise float sumValue434 = bitwiseValue304 + (-1.0f);
                                            precise float bitwiseValue305 = float((comparisonValue97 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue306 = float(bitwiseValue302 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue622 = sumValue433 * 3.0517578125e-05f;
                                            precise float productValue623 = sumValue434 * 3.0517578125e-05f;
                                            precise float sumValue435 = bitwiseValue305 + productValue622;
                                            precise float sumValue436 = bitwiseValue306 + productValue623;
                                            intermediateValue504 = sumValue435;
                                            intermediateValue505 = sumValue436;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue307 = float(comparisonValue97 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue308 = float(comparisonValue97 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue624 = bitwiseValue307 * 16384.0f;
                                            precise float sumValue437 = productValue624 + 0.5f;
                                            precise float productValue625 = bitwiseValue308 * 16384.0f;
                                            precise float sumValue438 = productValue625 + 0.5f;
                                            precise float productValue626 = floor(sumValue437) * 6.103515625e-05f;
                                            precise float productValue627 = floor(sumValue438) * 6.103515625e-05f;
                                            intermediateValue504 = productValue626;
                                            intermediateValue505 = productValue627;
                                        }
                                        precise float productValue651 = intermediateValue404.y * intermediateValue504;
                                        precise float productValue652 = intermediateValue404.y * intermediateValue505;
                                        precise float sumValue462 = sumValue413 + productValue651;
                                        precise float sumValue463 = sumValue414 + productValue652;
                                        precise float productValue653 = intermediateValue405 * 0.083333335816860198974609375f;
                                        precise float sumValue464 = productValue653 + (-0.25f);
                                        float intermediateValue516;
                                        float intermediateValue517;
                                        float intermediateValue518;
                                        float intermediateValue519;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue474 * 2 + 0) == 65535u)
                                        {
                                            intermediateValue516 = 1.0f;
                                            intermediateValue517 = 1.0f;
                                            intermediateValue518 = 1.0f;
                                            intermediateValue519 = 1.0f;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits57;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue474 * 2 + 0) > 4095u)
                                            {
                                                reinterpretedBits57 = asuint(viewCbConstants[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits57 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue474 * 2 + 0));
                                            }
                                            float4 sampledTextureValue21 = textures[NonUniformResourceIndex(reinterpretedBits57 + 0u)].SampleLevel(defaultSampler, float2(sumValue462, sumValue463), min(sumValue464, 2.0f));
                                            intermediateValue516 = sampledTextureValue21.x;
                                            intermediateValue517 = sampledTextureValue21.y;
                                            intermediateValue518 = sampledTextureValue21.z;
                                            intermediateValue519 = sampledTextureValue21.w;
                                        }
                                        float intermediateValue539;
                                        float intermediateValue540;
                                        float intermediateValue541;
                                        if (intermediateValue407 == 2u)
                                        {
                                            float branchMergedValue43;
                                            float branchMergedValue71;
                                            float branchMergedValue72;
                                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue475 * 2 + 0) & 128u) == 0u)
                                            {
                                                float intermediateValue554;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue475 * 2 + 0) & 2048u) == 0u)
                                                {
                                                    intermediateValue554 = intermediateValue519;
                                                }
                                                else
                                                {
                                                    precise float productValue699 = intermediateValue519 * 2.0f;
                                                    precise float sumValue515 = productValue699 + (-1.0f);
                                                    intermediateValue554 = clamp(sumValue515, 0.0f, 1.0f);
                                                }
                                                precise float sumValue512 = 0.0f - intermediateValue516;
                                                precise float sumValue513 = 0.0f - intermediateValue517;
                                                precise float sumValue514 = 0.0f - intermediateValue518;
                                                precise float productValue696 = sumValue512 * intermediateValue554;
                                                precise float productValue697 = sumValue513 * intermediateValue554;
                                                precise float productValue698 = sumValue514 * intermediateValue554;
                                                precise float sumValue498 = intermediateValue516 + productValue696;
                                                precise float sumValue499 = intermediateValue517 + productValue697;
                                                precise float sumValue500 = intermediateValue518 + productValue698;
                                                branchMergedValue43 = sumValue500;
                                                branchMergedValue71 = sumValue499;
                                                branchMergedValue72 = sumValue498;
                                            }
                                            else
                                            {
                                                branchMergedValue43 = 0.33399999141693115234375f;
                                                branchMergedValue71 = 0.33399999141693115234375f;
                                                branchMergedValue72 = 0.33399999141693115234375f;
                                            }
                                            intermediateValue539 = branchMergedValue72;
                                            intermediateValue540 = branchMergedValue71;
                                            intermediateValue541 = branchMergedValue43;
                                        }
                                        else
                                        {
                                            precise float sumValue489 = 1.0f - intermediateValue519;
                                            intermediateValue539 = sumValue489;
                                            intermediateValue540 = sumValue489;
                                            intermediateValue541 = sumValue489;
                                        }
                                        precise float productValue683 = intermediateValue370 * intermediateValue539;
                                        precise float productValue684 = intermediateValue371 * intermediateValue540;
                                        precise float productValue685 = intermediateValue372 * intermediateValue541;
                                        float intermediateValue409;
                                        float intermediateValue410;
                                        float intermediateValue411;
                                        bool intermediateValue555;
                                        if (!(dot(float3(productValue683, productValue684, productValue685), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                        {
                                            intermediateValue555 = false;
                                            intermediateValue409 = productValue683;
                                            intermediateValue410 = productValue684;
                                            intermediateValue411 = productValue685;
                                        }
                                        else
                                        {
                                            intermediateValue555 = true;
                                            intermediateValue409 = 0.0f;
                                            intermediateValue410 = 0.0f;
                                            intermediateValue411 = 0.0f;
                                        }
                                        float branchMergedValue84;
                                        float branchMergedValue95;
                                        float branchMergedValue96;
                                        if (intermediateValue555)
                                        {
                                            intermediateValue319.CommitNonOpaqueTriangleHit();
                                            branchMergedValue84 = intermediateValue411;
                                            branchMergedValue95 = intermediateValue410;
                                            branchMergedValue96 = intermediateValue409;
                                        }
                                        else
                                        {
                                            branchMergedValue84 = intermediateValue411;
                                            branchMergedValue95 = intermediateValue410;
                                            branchMergedValue96 = intermediateValue409;
                                        }
                                        branchMergedValue3 = branchMergedValue84;
                                        branchMergedValue15 = branchMergedValue95;
                                        branchMergedValue16 = branchMergedValue96;
                                    }
                                    else
                                    {
                                        branchMergedValue3 = intermediateValue372;
                                        branchMergedValue15 = intermediateValue371;
                                        branchMergedValue16 = intermediateValue370;
                                    }
                                    intermediateValue346 = branchMergedValue3;
                                    intermediateValue344 = branchMergedValue15;
                                    intermediateValue342 = branchMergedValue16;
                                    bool intermediateValue412 = intermediateValue319.Proceed();
                                    if (intermediateValue412)
                                    {
                                        intermediateValue370 = intermediateValue342;
                                        intermediateValue371 = intermediateValue344;
                                        intermediateValue372 = intermediateValue346;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue341 = intermediateValue342;
                                intermediateValue343 = intermediateValue344;
                                intermediateValue345 = intermediateValue346;
                            }
                            else
                            {
                                intermediateValue341 = 1.0f;
                                intermediateValue343 = 1.0f;
                                intermediateValue345 = 1.0f;
                            }
                            uint intermediateValue347 = intermediateValue319.CommittedStatus();
                            bool comparisonValue84 = intermediateValue347 == 1u;
                            branchMergedValue40 = comparisonValue84 ? 0.0f : intermediateValue343;
                            branchMergedValue65 = comparisonValue84 ? 0.0f : intermediateValue341;
                            branchMergedValue66 = comparisonValue84 ? 0.0f : intermediateValue345;
                        }
                        intermediateValue283 = branchMergedValue65;
                        intermediateValue284 = branchMergedValue40;
                        intermediateValue285 = branchMergedValue66;
                    }
                    float branchMergedValue107;
                    float branchMergedValue115;
                    float branchMergedValue116;
                    float branchMergedValue117;
                    if (dot(float3(intermediateValue283, intermediateValue284, intermediateValue285), 1.0f.xxx) > 0.0f)
                    {
                        float sumValue229 = (-0.0f) - sumValue14;
                        float sumValue230 = (-0.0f) - sumValue16;
                        float sumValue231 = (-0.0f) - sumValue18;
                        float intermediateValue297 = max(max(productValue335, 0.25f), 0.00999999977648258209228515625f);
                        float sumValue232 = viewCbConstants[52u].x - sumValue14;
                        float sumValue233 = viewCbConstants[52u].y - sumValue16;
                        float sumValue234 = viewCbConstants[52u].z - sumValue18;
                        float inverseLengthValue7 = rsqrt(dot(float3(sumValue232, sumValue233, sumValue234), float3(sumValue232, sumValue233, sumValue234)));
                        float productValue376 = inverseLengthValue7 * sumValue232;
                        float productValue377 = inverseLengthValue7 * sumValue233;
                        float productValue378 = inverseLengthValue7 * sumValue234;
                        float clampedValue2 = clamp(dot(float3(comparisonValue59, comparisonValue60, comparisonValue61), float3(viewCbConstants[52u].xyz)), 0.0f, 1.0f);
                        float clampedValue3 = clamp(dot(float3(comparisonValue59, comparisonValue60, comparisonValue61), float3(sumValue229, sumValue230, sumValue231)), 0.0f, 1.0f);
                        float clampedValue4 = clamp(dot(float3(comparisonValue59, comparisonValue60, comparisonValue61), float3(productValue376, productValue377, productValue378)), 0.0f, 1.0f);
                        float clampedValue5 = clamp(dot(float3(sumValue229, sumValue230, sumValue231), float3(productValue376, productValue377, productValue378)), 0.0f, 1.0f);
                        float productValue379 = intermediateValue297 * intermediateValue297;
                        float productValue380 = productValue379 * productValue379;
                        float productValue381 = (((clampedValue4 * productValue380) - clampedValue4) * clampedValue4) + 1.0f;
                        float productValue382 = productValue379 * 0.5f;
                        float sumValue235 = 1.0f - productValue382;
                        float clampedValue6 = clamp(dot(float3(productValue339, productValue340, productValue341), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f, 0.0f, 1.0f);
                        float clampedValue7 = exp2(log2(clamp(1.0f - clampedValue5, 0.0f, 1.0f)) * 5.0f);
                        float productValue383 = (clampedValue7 * (clampedValue6 - productValue339)) + productValue339;
                        float productValue384 = (clampedValue7 * (clampedValue6 - productValue340)) + productValue340;
                        float productValue385 = (clampedValue7 * (clampedValue6 - productValue341)) + productValue341;
                        float productValue386 = ((clampedValue5 * clampedValue5) * (intermediateValue297 * 2.0f)) + (-0.5f);
                        float clampedValue8 = (((exp2(log2(clamp(1.0f - clampedValue3, 0.0f, 1.0f)) * 5.0f) * productValue386) + 1.0f) * 0.3183098733425140380859375f) * ((exp2(log2(clamp(1.0f - clampedValue2, 0.0f, 1.0f)) * 5.0f) * productValue386) + 1.0f);
                        float quotientValue4 = ((productValue380 / ((productValue381 * productValue381) + 1.0000000133514319600180897396058e-10f)) * 0.3183098733425140380859375f) * (0.25f / ((((clampedValue3 * sumValue235) + productValue382) * ((clampedValue2 * sumValue235) + productValue382)) + 1.0000000133514319600180897396058e-10f));
                        branchMergedValue107 = ((((intermediateValue284 * comparisonValue29) * viewCbConstants[50u].y) * clampedValue2) * ((((1.0f - productValue384) * productValue343) * clampedValue8) + (productValue384 * quotientValue4))) + intermediateValue120;
                        branchMergedValue115 = ((((intermediateValue283 * comparisonValue28) * viewCbConstants[50u].x) * clampedValue2) * ((((1.0f - productValue383) * productValue342) * clampedValue8) + (productValue383 * quotientValue4))) + intermediateValue118;
                        branchMergedValue116 = 1.0f;
                        branchMergedValue117 = ((((intermediateValue285 * comparisonValue30) * viewCbConstants[50u].z) * clampedValue2) * ((((1.0f - productValue385) * productValue344) * clampedValue8) + (productValue385 * quotientValue4))) + intermediateValue122;
                    }
                    else
                    {
                        branchMergedValue107 = intermediateValue120;
                        branchMergedValue115 = intermediateValue118;
                        branchMergedValue116 = 1.0f;
                        branchMergedValue117 = intermediateValue122;
                    }
                    branchMergedValue32 = branchMergedValue107;
                    branchMergedValue48 = branchMergedValue115;
                    branchMergedValue49 = branchMergedValue116;
                    branchMergedValue50 = branchMergedValue117;
                }
                intermediateValue11 = branchMergedValue49;
                intermediateValue117 = branchMergedValue48;
                intermediateValue119 = branchMergedValue32;
                intermediateValue121 = branchMergedValue50;
            }
            else
            {
                uint4 reinterpretedBits15 = asuint(viewCbConstants[75u]);
                uint intermediateValue87 = reinterpretedBits15.w;
                float sumValue41 = (-0.0f) - sumValue14;
                float sumValue42 = (-0.0f) - sumValue16;
                float sumValue43 = (-0.0f) - sumValue18;
                float productValue74 = viewCbConstants[60u].w * viewCbConstants[60u].w;
                float clampedValue = (clamp(viewCbConstants[90u].w, 0.0f, 1.0f) * 15.9154567718505859375f) * ((1.0f - productValue74) / exp2(log2(abs((productValue74 + 1.0f) - ((viewCbConstants[60u].w * 2.0f) * min(max((-0.0f) - dot(float3(viewCbConstants[52u].xyz), float3(sumValue41, sumValue42, sumValue43)), -1.0f), 1.0f)))) * 1.5f));
                float intermediateValue132;
                float intermediateValue133;
                float intermediateValue134;
                if (intermediateValue87 == 1u)
                {
                    intermediateValue132 = viewCbConstants[58u].x;
                    intermediateValue133 = viewCbConstants[58u].y;
                    intermediateValue134 = viewCbConstants[58u].z;
                }
                else
                {
                    float branchMergedValue33;
                    float branchMergedValue51;
                    float branchMergedValue52;
                    if (intermediateValue87 == 2u)
                    {
                        uint4 intermediateValue135 = asuint(viewCbConstants[74u]);
                        uint intermediateValue136 = intermediateValue135.z;
                        uint reinterpretedBits24;
                        if (intermediateValue136 > 4095u)
                        {
                            reinterpretedBits24 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits24 = intermediateValue136;
                        }
                        float intermediateValue161 = abs(sumValue14);
                        float intermediateValue162 = abs(sumValue16);
                        float intermediateValue163 = abs(sumValue18);
                        float intermediateValue200;
                        float comparisonValue55;
                        float intermediateValue201;
                        if ((intermediateValue161 >= intermediateValue162) && (intermediateValue161 >= intermediateValue163))
                        {
                            intermediateValue200 = intermediateValue161;
                            comparisonValue55 = (sumValue14 < 0.0f) ? sumValue43 : sumValue18;
                            intermediateValue201 = sumValue42;
                        }
                        else
                        {
                            float branchMergedValue36;
                            float branchMergedValue57;
                            float branchMergedValue58;
                            if (!(intermediateValue162 >= intermediateValue163))
                            {
                                branchMergedValue36 = sumValue42;
                                branchMergedValue57 = (sumValue18 < 0.0f) ? sumValue14 : sumValue41;
                                branchMergedValue58 = intermediateValue163;
                            }
                            else
                            {
                                branchMergedValue36 = (sumValue16 < 0.0f) ? sumValue43 : sumValue18;
                                branchMergedValue57 = sumValue41;
                                branchMergedValue58 = intermediateValue162;
                            }
                            intermediateValue200 = branchMergedValue58;
                            comparisonValue55 = branchMergedValue57;
                            intermediateValue201 = branchMergedValue36;
                        }
                        precise float quotientValue2 = 0.5f / intermediateValue200;
                        float4 sampledTextureValue4 = textures[NonUniformResourceIndex(reinterpretedBits24 + 0u)].SampleLevel(linearSampler, float2(frac(mad(comparisonValue55, quotientValue2, 0.5f) * viewCbConstants[74u].x), frac(mad(intermediateValue201, quotientValue2, 0.5f) * viewCbConstants[74u].y)), 0.0f);
                        branchMergedValue33 = (viewCbConstants[58u].z * sampledTextureValue4.z) * viewCbConstants[97u].w;
                        branchMergedValue51 = (viewCbConstants[58u].x * sampledTextureValue4.x) * viewCbConstants[97u].w;
                        branchMergedValue52 = (viewCbConstants[58u].y * sampledTextureValue4.y) * viewCbConstants[97u].w;
                    }
                    else
                    {
                        float branchMergedValue105;
                        float branchMergedValue109;
                        float branchMergedValue110;
                        if (intermediateValue87 == 4u)
                        {
                            float intermediateValue164 = (dot(float3(sumValue14, sumValue16, sumValue18), float3(viewCbConstants[52u].xyz)) * 0.5f) + 0.5f;
                            branchMergedValue105 = ((viewCbConstants[75u].z - viewCbConstants[76u].z) * intermediateValue164) + viewCbConstants[76u].z;
                            branchMergedValue109 = ((viewCbConstants[75u].x - viewCbConstants[76u].x) * intermediateValue164) + viewCbConstants[76u].x;
                            branchMergedValue110 = ((viewCbConstants[75u].y - viewCbConstants[76u].y) * intermediateValue164) + viewCbConstants[76u].y;
                        }
                        else
                        {
                            float comparisonValue51;
                            if (abs(sumValue16) < 1.0f)
                            {
                                float quotientValue = atan(sumValue18 / sumValue14);
                                bool intermediateValue173 = sumValue14 < 0.0f;
                                bool comparisonValue49 = sumValue14 == 0.0f;
                                bool comparisonValue50 = sumValue18 >= 0.0f;
                                bool intermediateValue174 = sumValue18 < 0.0f;
                                comparisonValue51 = (comparisonValue49 && comparisonValue50) ? 1.57079637050628662109375f : ((comparisonValue49 && intermediateValue174) ? (-1.57079637050628662109375f) : ((intermediateValue173 && intermediateValue174) ? (quotientValue + (-3.1415927410125732421875f)) : ((intermediateValue173 && comparisonValue50) ? (quotientValue + 3.1415927410125732421875f) : quotientValue)));
                            }
                            else
                            {
                                comparisonValue51 = 0.0f;
                            }
                            float multiplyAddValue = mad(abs((frac((comparisonValue51 - viewCbConstants[50u].w) * 0.15915493667125701904296875f) * 2.0f) + (-1.0f)), 0.984375f, 0.0078125f);
                            float multiplyAddValue1 = mad(0.5f - (asin(sumValue16) * 0.3183098733425140380859375f), 0.96875f, 0.015625f);
                            float productValue182 = viewCbConstants[51u].w * 7.0f;
                            float intermediateValue175 = frac(productValue182);
                            uint intermediateValue176 = uint(int(floor(productValue182)));
                            float productValue183 = float(int(intermediateValue176 + 1u)) * 0.125f;
                            float intermediateValue177 = frac(abs(productValue183));
                            float4 sampledTextureValue = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue, multiplyAddValue1, float(int(intermediateValue176))), 0.0f);
                            float intermediateValue178 = sampledTextureValue.x;
                            float intermediateValue179 = sampledTextureValue.y;
                            float intermediateValue180 = sampledTextureValue.z;
                            float productValue184 = intermediateValue178 * intermediateValue178;
                            float productValue185 = intermediateValue179 * intermediateValue179;
                            float productValue186 = intermediateValue180 * intermediateValue180;
                            float4 sampledTextureValue1 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue, multiplyAddValue1, float(int(uint(int(((productValue183 >= ((-0.0f) - productValue183)) ? intermediateValue177 : ((-0.0f) - intermediateValue177)) * 8.0f))))), 0.0f);
                            float intermediateValue181 = sampledTextureValue1.x;
                            float intermediateValue182 = sampledTextureValue1.y;
                            float intermediateValue183 = sampledTextureValue1.z;
                            float dotProductValue4 = exp2(log2(max(dot(float3(sumValue14, sumValue16, sumValue18), float3(viewCbConstants[52u].xyz)), 0.0f)) * 7.0f);
                            float productValue187 = dotProductValue4 * 0.0500000007450580596923828125f;
                            float productValue188 = ((((intermediateValue181 * intermediateValue181) - productValue184) * intermediateValue175) + productValue184) + (productValue187 * viewCbConstants[50u].x);
                            float productValue189 = ((((intermediateValue182 * intermediateValue182) - productValue185) * intermediateValue175) + productValue185) + (productValue187 * viewCbConstants[50u].y);
                            float productValue190 = ((((intermediateValue183 * intermediateValue183) - productValue186) * intermediateValue175) + productValue186) + (productValue187 * viewCbConstants[50u].z);
                            float productValue191 = (dotProductValue4 * 0.64999997615814208984375f) + 0.3499999940395355224609375f;
                            branchMergedValue105 = ((((viewCbConstants[58u].z * productValue191) - productValue190) * viewCbConstants[58u].w) + productValue190) * viewCbConstants[97u].w;
                            branchMergedValue109 = ((((viewCbConstants[58u].x * productValue191) - productValue188) * viewCbConstants[58u].w) + productValue188) * viewCbConstants[97u].w;
                            branchMergedValue110 = ((((viewCbConstants[58u].y * productValue191) - productValue189) * viewCbConstants[58u].w) + productValue189) * viewCbConstants[97u].w;
                        }
                        branchMergedValue33 = branchMergedValue105;
                        branchMergedValue51 = branchMergedValue109;
                        branchMergedValue52 = branchMergedValue110;
                    }
                    intermediateValue132 = branchMergedValue51;
                    intermediateValue133 = branchMergedValue52;
                    intermediateValue134 = branchMergedValue33;
                }
                intermediateValue11 = 0.0f;
                intermediateValue117 = (intermediateValue132 + (((viewCbConstants[50u].x * clampedValue) * viewCbConstants[61u].x) * exp2(viewCbConstants[62u].x * (-72.1347503662109375f)))) * comparisonValue28;
                intermediateValue119 = (intermediateValue133 + (((viewCbConstants[50u].y * clampedValue) * viewCbConstants[61u].y) * exp2(viewCbConstants[62u].y * (-72.1347503662109375f)))) * comparisonValue29;
                intermediateValue121 = (intermediateValue134 + (((viewCbConstants[50u].z * clampedValue) * viewCbConstants[61u].z) * exp2(viewCbConstants[62u].z * (-72.1347503662109375f)))) * comparisonValue30;
            }
            float productValue120 = (viewCbConstants[59u].z * comparisonValue30) + intermediateValue121;
            float productValue = (((viewCbConstants[59u].x * comparisonValue28) + intermediateValue117) - productValue120) * reinterpretedBits2;
            float productValue121 = (productValue * 0.5f) + (productValue120 * reinterpretedBits2);
            float productValue1 = (((viewCbConstants[59u].y * comparisonValue29) + intermediateValue119) * reinterpretedBits2) - productValue121;
            float productValue122 = max((productValue1 * 0.5f) + productValue121, 0.0f);
            float productValue123 = productValue122 * 0.48860299587249755859375f;
            branchMergedValue12 = productValue122 * 0.2820949852466583251953125f;
            branchMergedValue26 = productValue123 * sumValue18;
            branchMergedValue27 = productValue123 * sumValue16;
            branchMergedValue28 = productValue123 * sumValue14;
            branchMergedValue29 = intermediateValue11;
            branchMergedValue30 = productValue1;
            branchMergedValue31 = productValue;
        }
        else
        {
            bool dotProductValue2 = dot(float3(0.847100675106048583984375f, 0.2079117000102996826171875f, 0.489073812961578369140625f), float3(productValue7, productValue5, productValue8)) > 0.949999988079071044921875f;
            float comparisonValue17 = dotProductValue2 ? (-0.639436304569244384765625f) : 0.847100675106048583984375f;
            float comparisonValue18 = dotProductValue2 ? (-0.3907311260700225830078125f) : 0.2079117000102996826171875f;
            float comparisonValue19 = dotProductValue2 ? 0.6621558666229248046875f : 0.489073812961578369140625f;
            precise float dotProductValue3 = dot(float3(comparisonValue17, comparisonValue18, comparisonValue19), float3(productValue7, productValue5, productValue8));
            precise float productValue35 = productValue7 * dotProductValue3;
            precise float productValue36 = productValue5 * dotProductValue3;
            precise float productValue37 = productValue8 * dotProductValue3;
            precise float sumValue19 = comparisonValue17 - productValue35;
            precise float sumValue20 = comparisonValue18 - productValue36;
            precise float sumValue21 = comparisonValue19 - productValue37;
            float inverseLengthValue4 = rsqrt(dot(float3(sumValue19, sumValue20, sumValue21), float3(sumValue19, sumValue20, sumValue21)));
            precise float productValue38 = sumValue19 * inverseLengthValue4;
            precise float productValue39 = sumValue20 * inverseLengthValue4;
            precise float productValue40 = sumValue21 * inverseLengthValue4;
            precise float productValue41 = productValue5 * productValue40;
            precise float productValue42 = productValue8 * productValue39;
            precise float sumValue22 = productValue41 - productValue42;
            precise float productValue43 = productValue8 * productValue38;
            precise float productValue44 = productValue7 * productValue40;
            precise float sumValue23 = productValue43 - productValue44;
            precise float productValue45 = productValue7 * productValue39;
            precise float productValue46 = productValue5 * productValue38;
            precise float sumValue24 = productValue45 - productValue46;
            precise float productValue47 = wavePhaseValue * productValue38;
            precise float productValue48 = wavePhaseValue1 * sumValue22;
            precise float sumValue25 = productValue48 + productValue47;
            precise float productValue49 = nonlinearValue1 * productValue7;
            precise float sumValue26 = productValue49 + sumValue25;
            precise float productValue50 = wavePhaseValue * productValue39;
            precise float productValue51 = wavePhaseValue1 * sumValue23;
            precise float sumValue27 = productValue51 + productValue50;
            precise float productValue52 = nonlinearValue1 * productValue5;
            precise float sumValue28 = productValue52 + sumValue27;
            precise float productValue53 = wavePhaseValue * productValue40;
            precise float productValue54 = wavePhaseValue1 * sumValue24;
            precise float sumValue29 = productValue54 + productValue53;
            precise float productValue55 = nonlinearValue1 * productValue8;
            precise float sumValue30 = productValue55 + sumValue29;
            RayDesc _18ident = {float3(reinterpretedBits8, reinterpretedBits9, reinterpretedBits10), 0.0f, float3(sumValue26, sumValue28, sumValue30), 10000.0f};
            intermediateValue30.TraceRayInline(SceneBVH, 512u, 2u, _18ident);
            bool intermediateValue31 = intermediateValue30.Proceed();
            if (intermediateValue31)
            {
                bool intermediateValue75;
                bool comparisonValue22;
                for (;;)
                {
                    uint intermediateValue46 = intermediateValue30.CandidateType();
                    comparisonValue22 = intermediateValue46 == 0u;
                    if (comparisonValue22)
                    {
                        float2 intermediateValue70 = intermediateValue30.CandidateTriangleBarycentrics();
                        float2 intermediateValue71 = intermediateValue30.CandidateTriangleBarycentrics();
                        uint intermediateValue72 = intermediateValue30.CandidatePrimitiveIndex();
                        uint intermediateValue73 = intermediateValue30.CandidateInstanceID();
                        uint intermediateValue74 = intermediateValue30.CandidateInstanceIndex();
                        uint productValue60 = (intermediateValue74 * 76u) + 58u;
                        uint productValue61 = (intermediateValue74 * 76u) + 61u;
                        precise float sumValue33 = 1.0f - intermediateValue70.x;
                        precise float sumValue34 = sumValue33 - intermediateValue71.y;
                        uint bitwiseValue7 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue74 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue72 >> 1u);
                        uint productValue62 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue74 * 76u) + 54u) * 2 + 0)) + 0u;
                        bool comparisonValue31 = (intermediateValue72 & 1u) == 0u;
                        uint comparisonValue32 = comparisonValue31 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue62), bitwiseValue7 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue62), bitwiseValue7 * 16 + 0).x;
                        uint comparisonValue33 = comparisonValue31 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue62), bitwiseValue7 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue62), bitwiseValue7 * 16 + 0).w;
                        uint comparisonValue34 = comparisonValue31 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue62), bitwiseValue7 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue62), bitwiseValue7 * 16 + 0).z;
                        bool productValue63 = rdByteLoad_objectInstances_uint16_t(0u, productValue61 * 2 + 0) < 0u;
                        float intermediateValue105;
                        float intermediateValue106;
                        if (productValue63)
                        {
                            uint bitwiseValue16 = comparisonValue34 >> 15u;
                            precise float bitwiseValue17 = float(bitwiseValue16 & 1u) * 2.0f;
                            precise float sumValue44 = bitwiseValue17 + (-1.0f);
                            precise float bitwiseValue18 = float(comparisonValue34 >> 31u) * 2.0f;
                            precise float sumValue45 = bitwiseValue18 + (-1.0f);
                            precise float bitwiseValue19 = float((comparisonValue34 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue20 = float(bitwiseValue16 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue75 = sumValue44 * 3.0517578125e-05f;
                            precise float productValue76 = sumValue45 * 3.0517578125e-05f;
                            precise float sumValue46 = bitwiseValue19 + productValue75;
                            precise float sumValue47 = bitwiseValue20 + productValue76;
                            intermediateValue105 = sumValue46;
                            intermediateValue106 = sumValue47;
                        }
                        else
                        {
                            precise float bitwiseValue21 = float(comparisonValue34 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue22 = float(comparisonValue34 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue77 = bitwiseValue21 * 16384.0f;
                            precise float sumValue48 = productValue77 + 0.5f;
                            precise float productValue78 = bitwiseValue22 * 16384.0f;
                            precise float sumValue49 = productValue78 + 0.5f;
                            precise float productValue79 = floor(sumValue48) * 6.103515625e-05f;
                            precise float productValue80 = floor(sumValue49) * 6.103515625e-05f;
                            intermediateValue105 = productValue79;
                            intermediateValue106 = productValue80;
                        }
                        precise float productValue97 = sumValue34 * intermediateValue105;
                        precise float productValue98 = sumValue34 * intermediateValue106;
                        precise float sumValue57 = productValue97 + 0.0f;
                        precise float sumValue58 = productValue98 + 0.0f;
                        float intermediateValue165;
                        float intermediateValue166;
                        if (productValue63)
                        {
                            uint bitwiseValue55 = comparisonValue33 >> 15u;
                            precise float bitwiseValue56 = float(bitwiseValue55 & 1u) * 2.0f;
                            precise float sumValue80 = bitwiseValue56 + (-1.0f);
                            precise float bitwiseValue57 = float(comparisonValue33 >> 31u) * 2.0f;
                            precise float sumValue81 = bitwiseValue57 + (-1.0f);
                            precise float bitwiseValue58 = float((comparisonValue33 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue59 = float(bitwiseValue55 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue137 = sumValue80 * 3.0517578125e-05f;
                            precise float productValue138 = sumValue81 * 3.0517578125e-05f;
                            precise float sumValue82 = bitwiseValue58 + productValue137;
                            precise float sumValue83 = bitwiseValue59 + productValue138;
                            intermediateValue165 = sumValue82;
                            intermediateValue166 = sumValue83;
                        }
                        else
                        {
                            precise float bitwiseValue60 = float(comparisonValue33 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue61 = float(comparisonValue33 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue139 = bitwiseValue60 * 16384.0f;
                            precise float sumValue84 = productValue139 + 0.5f;
                            precise float productValue140 = bitwiseValue61 * 16384.0f;
                            precise float sumValue85 = productValue140 + 0.5f;
                            precise float productValue141 = floor(sumValue84) * 6.103515625e-05f;
                            precise float productValue142 = floor(sumValue85) * 6.103515625e-05f;
                            intermediateValue165 = productValue141;
                            intermediateValue166 = productValue142;
                        }
                        precise float productValue166 = intermediateValue70.x * intermediateValue165;
                        precise float productValue167 = intermediateValue70.x * intermediateValue166;
                        precise float sumValue103 = sumValue57 + productValue166;
                        precise float sumValue104 = sumValue58 + productValue167;
                        float intermediateValue202;
                        float intermediateValue203;
                        if (productValue63)
                        {
                            uint bitwiseValue100 = comparisonValue32 >> 15u;
                            precise float bitwiseValue101 = float(bitwiseValue100 & 1u) * 2.0f;
                            precise float sumValue119 = bitwiseValue101 + (-1.0f);
                            precise float bitwiseValue102 = float(comparisonValue32 >> 31u) * 2.0f;
                            precise float sumValue120 = bitwiseValue102 + (-1.0f);
                            precise float bitwiseValue103 = float((comparisonValue32 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue104 = float(bitwiseValue100 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue192 = sumValue119 * 3.0517578125e-05f;
                            precise float productValue193 = sumValue120 * 3.0517578125e-05f;
                            precise float sumValue121 = bitwiseValue103 + productValue192;
                            precise float sumValue122 = bitwiseValue104 + productValue193;
                            intermediateValue202 = sumValue121;
                            intermediateValue203 = sumValue122;
                        }
                        else
                        {
                            precise float bitwiseValue105 = float(comparisonValue32 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue106 = float(comparisonValue32 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue194 = bitwiseValue105 * 16384.0f;
                            precise float sumValue123 = productValue194 + 0.5f;
                            precise float productValue195 = bitwiseValue106 * 16384.0f;
                            precise float sumValue124 = productValue195 + 0.5f;
                            precise float productValue196 = floor(sumValue123) * 6.103515625e-05f;
                            precise float productValue197 = floor(sumValue124) * 6.103515625e-05f;
                            intermediateValue202 = productValue196;
                            intermediateValue203 = productValue197;
                        }
                        precise float productValue223 = intermediateValue71.y * intermediateValue202;
                        precise float productValue224 = intermediateValue71.y * intermediateValue203;
                        precise float sumValue138 = sumValue103 + productValue223;
                        precise float sumValue139 = sumValue104 + productValue224;
                        float intermediateValue210;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue60 * 2 + 0) == 65535u)
                        {
                            intermediateValue210 = 1.0f;
                        }
                        else
                        {
                            uint reinterpretedBits27;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue60 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits27 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits27 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue60 * 2 + 0));
                            }
                            intermediateValue210 = textures[NonUniformResourceIndex(reinterpretedBits27 + 0u)].SampleLevel(defaultSampler, float2(sumValue138, sumValue139), -0.25f).w;
                        }
                        uint comparisonValue58;
                        if (intermediateValue73 == 2u)
                        {
                            comparisonValue58 = 0u;
                        }
                        else
                        {
                            comparisonValue58 = uint(intermediateValue210 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue61 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                        }
                        if (comparisonValue58 == 0u)
                        {
                            intermediateValue30.CommitNonOpaqueTriangleHit();
                        }
                    }
                    intermediateValue75 = intermediateValue30.Proceed();
                    if (intermediateValue75)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint intermediateValue34 = intermediateValue30.CommittedStatus();
            float intermediateValue52;
            float intermediateValue53;
            float intermediateValue54;
            uint bitwiseValue5;
            if (intermediateValue34 == 1u)
            {
                float2 intermediateValue47 = intermediateValue30.CommittedTriangleBarycentrics();
                float2 intermediateValue48 = intermediateValue30.CommittedTriangleBarycentrics();
                float intermediateValue49 = intermediateValue30.CommittedRayT();
                uint intermediateValue50 = intermediateValue30.CommittedPrimitiveIndex();
                uint intermediateValue51 = intermediateValue30.CommittedInstanceIndex();
                intermediateValue52 = intermediateValue47.x;
                intermediateValue53 = intermediateValue48.y;
                intermediateValue54 = intermediateValue49;
                bitwiseValue5 = ((intermediateValue50 << 14u) & 1073725440u) | (intermediateValue51 & 16383u);
            }
            else
            {
                intermediateValue52 = 0.0f;
                intermediateValue53 = 0.0f;
                intermediateValue54 = 10000.0f;
                bitwiseValue5 = 1073741823u;
            }
            RayDesc _19ident = {float3(reinterpretedBits8, reinterpretedBits9, reinterpretedBits10), 0.0f, float3(sumValue26, sumValue28, sumValue30), intermediateValue54};
            intermediateValue55.TraceRayInline(SceneBVH, 512u, 16u, _19ident);
            bool intermediateValue56 = intermediateValue55.Proceed();
            float intermediateValue76;
            float intermediateValue78;
            float intermediateValue80;
            if (intermediateValue56)
            {
                float intermediateValue77;
                float intermediateValue79;
                float intermediateValue81;
                float intermediateValue88 = 1.0f;
                float intermediateValue89 = 1.0f;
                float intermediateValue90 = 1.0f;
                bool comparisonValue40;
                for (;;)
                {
                    uint intermediateValue91 = intermediateValue55.CandidateType();
                    comparisonValue40 = intermediateValue91 == 0u;
                    float branchMergedValue1;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if (comparisonValue40)
                    {
                        float2 intermediateValue107 = intermediateValue55.CandidateTriangleBarycentrics();
                        float2 intermediateValue108 = intermediateValue55.CandidateTriangleBarycentrics();
                        float intermediateValue109 = intermediateValue55.CandidateTriangleRayT();
                        uint intermediateValue110 = intermediateValue55.CandidatePrimitiveIndex();
                        uint intermediateValue111 = intermediateValue55.CandidateInstanceID();
                        uint intermediateValue112 = intermediateValue55.CandidateInstanceIndex();
                        uint productValue99 = (intermediateValue112 * 76u) + 58u;
                        uint productValue100 = (intermediateValue112 * 76u) + 61u;
                        precise float sumValue59 = 1.0f - intermediateValue107.x;
                        precise float sumValue60 = sumValue59 - intermediateValue108.y;
                        uint bitwiseValue26 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue112 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue110 >> 1u);
                        uint productValue101 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue112 * 76u) + 54u) * 2 + 0)) + 0u;
                        bool comparisonValue45 = (intermediateValue110 & 1u) == 0u;
                        uint comparisonValue46 = comparisonValue45 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue101), bitwiseValue26 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue101), bitwiseValue26 * 16 + 0).x;
                        uint comparisonValue47 = comparisonValue45 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue101), bitwiseValue26 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue101), bitwiseValue26 * 16 + 0).w;
                        uint comparisonValue48 = comparisonValue45 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue101), bitwiseValue26 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue101), bitwiseValue26 * 16 + 0).z;
                        bool productValue102 = rdByteLoad_objectInstances_uint16_t(0u, productValue100 * 2 + 0) < 0u;
                        float intermediateValue167;
                        float intermediateValue168;
                        if (productValue102)
                        {
                            uint bitwiseValue62 = comparisonValue48 >> 15u;
                            precise float bitwiseValue63 = float(bitwiseValue62 & 1u) * 2.0f;
                            precise float sumValue86 = bitwiseValue63 + (-1.0f);
                            precise float bitwiseValue64 = float(comparisonValue48 >> 31u) * 2.0f;
                            precise float sumValue87 = bitwiseValue64 + (-1.0f);
                            precise float bitwiseValue65 = float((comparisonValue48 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue66 = float(bitwiseValue62 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue143 = sumValue86 * 3.0517578125e-05f;
                            precise float productValue144 = sumValue87 * 3.0517578125e-05f;
                            precise float sumValue88 = bitwiseValue65 + productValue143;
                            precise float sumValue89 = bitwiseValue66 + productValue144;
                            intermediateValue167 = sumValue88;
                            intermediateValue168 = sumValue89;
                        }
                        else
                        {
                            precise float bitwiseValue67 = float(comparisonValue48 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue68 = float(comparisonValue48 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue145 = bitwiseValue67 * 16384.0f;
                            precise float sumValue90 = productValue145 + 0.5f;
                            precise float productValue146 = bitwiseValue68 * 16384.0f;
                            precise float sumValue91 = productValue146 + 0.5f;
                            precise float productValue147 = floor(sumValue90) * 6.103515625e-05f;
                            precise float productValue148 = floor(sumValue91) * 6.103515625e-05f;
                            intermediateValue167 = productValue147;
                            intermediateValue168 = productValue148;
                        }
                        precise float productValue168 = sumValue60 * intermediateValue167;
                        precise float productValue169 = sumValue60 * intermediateValue168;
                        precise float sumValue105 = productValue168 + 0.0f;
                        precise float sumValue106 = productValue169 + 0.0f;
                        float intermediateValue204;
                        float intermediateValue205;
                        if (productValue102)
                        {
                            uint bitwiseValue107 = comparisonValue47 >> 15u;
                            precise float bitwiseValue108 = float(bitwiseValue107 & 1u) * 2.0f;
                            precise float sumValue125 = bitwiseValue108 + (-1.0f);
                            precise float bitwiseValue109 = float(comparisonValue47 >> 31u) * 2.0f;
                            precise float sumValue126 = bitwiseValue109 + (-1.0f);
                            precise float bitwiseValue110 = float((comparisonValue47 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue111 = float(bitwiseValue107 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue198 = sumValue125 * 3.0517578125e-05f;
                            precise float productValue199 = sumValue126 * 3.0517578125e-05f;
                            precise float sumValue127 = bitwiseValue110 + productValue198;
                            precise float sumValue128 = bitwiseValue111 + productValue199;
                            intermediateValue204 = sumValue127;
                            intermediateValue205 = sumValue128;
                        }
                        else
                        {
                            precise float bitwiseValue112 = float(comparisonValue47 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue113 = float(comparisonValue47 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue200 = bitwiseValue112 * 16384.0f;
                            precise float sumValue129 = productValue200 + 0.5f;
                            precise float productValue201 = bitwiseValue113 * 16384.0f;
                            precise float sumValue130 = productValue201 + 0.5f;
                            precise float productValue202 = floor(sumValue129) * 6.103515625e-05f;
                            precise float productValue203 = floor(sumValue130) * 6.103515625e-05f;
                            intermediateValue204 = productValue202;
                            intermediateValue205 = productValue203;
                        }
                        precise float productValue225 = intermediateValue107.x * intermediateValue204;
                        precise float productValue226 = intermediateValue107.x * intermediateValue205;
                        precise float sumValue140 = sumValue105 + productValue225;
                        precise float sumValue141 = sumValue106 + productValue226;
                        float intermediateValue213;
                        float intermediateValue214;
                        if (productValue102)
                        {
                            uint bitwiseValue130 = comparisonValue46 >> 15u;
                            precise float bitwiseValue131 = float(bitwiseValue130 & 1u) * 2.0f;
                            precise float sumValue151 = bitwiseValue131 + (-1.0f);
                            precise float bitwiseValue132 = float(comparisonValue46 >> 31u) * 2.0f;
                            precise float sumValue152 = bitwiseValue132 + (-1.0f);
                            precise float bitwiseValue133 = float((comparisonValue46 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue134 = float(bitwiseValue130 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue238 = sumValue151 * 3.0517578125e-05f;
                            precise float productValue239 = sumValue152 * 3.0517578125e-05f;
                            precise float sumValue153 = bitwiseValue133 + productValue238;
                            precise float sumValue154 = bitwiseValue134 + productValue239;
                            intermediateValue213 = sumValue153;
                            intermediateValue214 = sumValue154;
                        }
                        else
                        {
                            precise float bitwiseValue135 = float(comparisonValue46 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue136 = float(comparisonValue46 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue240 = bitwiseValue135 * 16384.0f;
                            precise float sumValue155 = productValue240 + 0.5f;
                            precise float productValue241 = bitwiseValue136 * 16384.0f;
                            precise float sumValue156 = productValue241 + 0.5f;
                            precise float productValue242 = floor(sumValue155) * 6.103515625e-05f;
                            precise float productValue243 = floor(sumValue156) * 6.103515625e-05f;
                            intermediateValue213 = productValue242;
                            intermediateValue214 = productValue243;
                        }
                        precise float productValue251 = intermediateValue108.y * intermediateValue213;
                        precise float productValue252 = intermediateValue108.y * intermediateValue214;
                        precise float sumValue162 = sumValue140 + productValue251;
                        precise float sumValue163 = sumValue141 + productValue252;
                        float intermediateValue219;
                        float intermediateValue220;
                        float intermediateValue221;
                        float intermediateValue222;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue99 * 2 + 0) == 65535u)
                        {
                            intermediateValue219 = 1.0f;
                            intermediateValue220 = 1.0f;
                            intermediateValue221 = 1.0f;
                            intermediateValue222 = 1.0f;
                        }
                        else
                        {
                            uint reinterpretedBits29;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue99 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits29 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits29 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue99 * 2 + 0));
                            }
                            float4 sampledTextureValue7 = textures[NonUniformResourceIndex(reinterpretedBits29 + 0u)].SampleLevel(defaultSampler, float2(sumValue162, sumValue163), min(mad(intermediateValue109, 0.083333335816860198974609375f, -0.25f), 2.0f));
                            intermediateValue219 = sampledTextureValue7.x;
                            intermediateValue220 = sampledTextureValue7.y;
                            intermediateValue221 = sampledTextureValue7.z;
                            intermediateValue222 = sampledTextureValue7.w;
                        }
                        float intermediateValue229;
                        float intermediateValue230;
                        float intermediateValue231;
                        if (intermediateValue111 == 2u)
                        {
                            float branchMergedValue39;
                            float branchMergedValue63;
                            float branchMergedValue64;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue100 * 2 + 0) & 128u) == 0u)
                            {
                                float intermediateValue243;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue100 * 2 + 0) & 2048u) == 0u)
                                {
                                    intermediateValue243 = intermediateValue222;
                                }
                                else
                                {
                                    intermediateValue243 = clamp(mad(intermediateValue222, 2.0f, -1.0f), 0.0f, 1.0f);
                                }
                                branchMergedValue39 = intermediateValue220 - (intermediateValue243 * intermediateValue220);
                                branchMergedValue63 = intermediateValue219 - (intermediateValue243 * intermediateValue219);
                                branchMergedValue64 = intermediateValue221 - (intermediateValue243 * intermediateValue221);
                            }
                            else
                            {
                                branchMergedValue39 = 0.33399999141693115234375f;
                                branchMergedValue63 = 0.33399999141693115234375f;
                                branchMergedValue64 = 0.33399999141693115234375f;
                            }
                            intermediateValue229 = branchMergedValue63;
                            intermediateValue230 = branchMergedValue39;
                            intermediateValue231 = branchMergedValue64;
                        }
                        else
                        {
                            float sumValue189 = 1.0f - intermediateValue222;
                            intermediateValue229 = sumValue189;
                            intermediateValue230 = sumValue189;
                            intermediateValue231 = sumValue189;
                        }
                        float productValue319 = intermediateValue229 * intermediateValue88;
                        float productValue320 = intermediateValue230 * intermediateValue89;
                        float productValue321 = intermediateValue231 * intermediateValue90;
                        float intermediateValue113;
                        float intermediateValue114;
                        float intermediateValue115;
                        bool intermediateValue244;
                        if (!(dot(float3(productValue319, productValue320, productValue321), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                        {
                            intermediateValue244 = false;
                            intermediateValue113 = productValue319;
                            intermediateValue114 = productValue320;
                            intermediateValue115 = productValue321;
                        }
                        else
                        {
                            intermediateValue244 = true;
                            intermediateValue113 = 0.0f;
                            intermediateValue114 = 0.0f;
                            intermediateValue115 = 0.0f;
                        }
                        float branchMergedValue82;
                        float branchMergedValue91;
                        float branchMergedValue92;
                        if (intermediateValue244)
                        {
                            intermediateValue55.CommitNonOpaqueTriangleHit();
                            branchMergedValue82 = intermediateValue115;
                            branchMergedValue91 = intermediateValue114;
                            branchMergedValue92 = intermediateValue113;
                        }
                        else
                        {
                            branchMergedValue82 = intermediateValue115;
                            branchMergedValue91 = intermediateValue114;
                            branchMergedValue92 = intermediateValue113;
                        }
                        branchMergedValue1 = branchMergedValue82;
                        branchMergedValue10 = branchMergedValue91;
                        branchMergedValue11 = branchMergedValue92;
                    }
                    else
                    {
                        branchMergedValue1 = intermediateValue90;
                        branchMergedValue10 = intermediateValue89;
                        branchMergedValue11 = intermediateValue88;
                    }
                    intermediateValue81 = branchMergedValue1;
                    intermediateValue79 = branchMergedValue10;
                    intermediateValue77 = branchMergedValue11;
                    bool intermediateValue116 = intermediateValue55.Proceed();
                    if (intermediateValue116)
                    {
                        intermediateValue88 = intermediateValue77;
                        intermediateValue89 = intermediateValue79;
                        intermediateValue90 = intermediateValue81;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue76 = intermediateValue77;
                intermediateValue78 = intermediateValue79;
                intermediateValue80 = intermediateValue81;
            }
            else
            {
                intermediateValue76 = 1.0f;
                intermediateValue78 = 1.0f;
                intermediateValue80 = 1.0f;
            }
            uint intermediateValue82 = intermediateValue55.CommittedStatus();
            bool comparisonValue35 = intermediateValue82 == 1u;
            float comparisonValue36 = comparisonValue35 ? 0.0f : intermediateValue76;
            float comparisonValue37 = comparisonValue35 ? 0.0f : intermediateValue78;
            float comparisonValue38 = comparisonValue35 ? 0.0f : intermediateValue80;
            float intermediateValue137;
            float intermediateValue139;
            float intermediateValue141;
            if (intermediateValue54 < 10000.0f)
            {
                uint bitwiseValue23 = bitwiseValue5 & 16383u;
                uint productValue81 = (bitwiseValue23 * 76u) + 58u;
                uint productValue82 = (bitwiseValue23 * 76u) + 59u;
                uint productValue83 = (bitwiseValue23 * 76u) + 61u;
                uint productValue84 = (bitwiseValue23 * 38u) + 32u;
                bool reinterpretedBits16 = (intermediateValue54 > 1.0f) && (((rdByteLoad_objectInstances_uint16_t(0u, productValue83 * 2 + 0) & 1u) != 0u) && (asuint(viewCbConstants[86u]).y != 0u));
                float productValue105;
                float productValue106;
                float productValue107;
                if (reinterpretedBits16)
                {
                    uint productValue103 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue23 * 76u) + 54u) * 2 + 0)) + 0u;
                    uint bitwiseValue27 = ((rdByteLoad_objectInstances_uint(0u, ((bitwiseValue23 * 38u) + 25u) * 4 + 0) >> 2u) + ((bitwiseValue5 >> 15u) & 32767u)) * 8u;
                    half3 productValue104 = (half3)f16tof32(uint16_t3(rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue103), bitwiseValue27 * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue103), (bitwiseValue27 + 1u) * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue103), (bitwiseValue27 + 2u) * 2 + 0)));
                    productValue105 = float(productValue104.x) * comparisonValue36;
                    productValue106 = float(productValue104.y) * comparisonValue37;
                    productValue107 = float(productValue104.z) * comparisonValue38;
                }
                else
                {
                    productValue105 = 0.0f;
                    productValue106 = 0.0f;
                    productValue107 = 0.0f;
                }
                float branchMergedValue34;
                float branchMergedValue53;
                float branchMergedValue54;
                if (reinterpretedBits16)
                {
                    branchMergedValue34 = productValue107;
                    branchMergedValue53 = productValue105;
                    branchMergedValue54 = productValue106;
                }
                else
                {
                    uint productValue149 = bitwiseValue23 * 38u;
                    float4 reinterpretedBits21 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue149 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue149 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue149 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue149 + 3u) * 4 + 0)));
                    float intermediateValue143 = reinterpretedBits21.x;
                    float intermediateValue144 = reinterpretedBits21.y;
                    float intermediateValue145 = reinterpretedBits21.z;
                    uint productValue150 = (bitwiseValue23 * 38u) + 4u;
                    float4 reinterpretedBits22 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue150 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue150 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue150 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue150 + 3u) * 4 + 0)));
                    float intermediateValue146 = reinterpretedBits22.x;
                    float intermediateValue147 = reinterpretedBits22.y;
                    float intermediateValue148 = reinterpretedBits22.z;
                    uint productValue151 = (bitwiseValue23 * 38u) + 8u;
                    float4 reinterpretedBits23 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue151 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue151 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue151 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue151 + 3u) * 4 + 0)));
                    float intermediateValue149 = reinterpretedBits23.x;
                    float intermediateValue150 = reinterpretedBits23.y;
                    float intermediateValue151 = reinterpretedBits23.z;
                    uint productValue152 = (bitwiseValue23 * 38u) + 24u;
                    uint productValue153 = (bitwiseValue23 * 38u) + 25u;
                    uint productValue154 = (bitwiseValue23 * 76u) + 61u;
                    uint productValue155 = (bitwiseValue23 * 76u) + 72u;
                    uint bitwiseValue69 = ((bitwiseValue5 >> 13u) & 2u) | ((bitwiseValue5 >> 13u) & 131068u);
                    uint bitwiseValue70 = bitwiseValue69 | 1u;
                    uint bitwiseValue71 = bitwiseValue69 ^ 2u;
                    uint intermediateValue[3];
                    intermediateValue[0u] = bitwiseValue69;
                    intermediateValue[1u] = bitwiseValue70;
                    intermediateValue[2u] = bitwiseValue71;
                    uint productValue156 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue23 * 76u) + 54u) * 2 + 0));
                    uint sumValue92 = productValue156 + 0u;
                    uint bitwiseValue72 = (rdByteLoad_objectInstances_uint(0u, productValue153 * 4 + 0) >> 2u) + ((bitwiseValue5 >> 15u) & 32767u);
                    uint productValue157 = bitwiseValue72 * 4u;
                    precise float bitwiseValue73 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue92), productValue157 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
                    precise float sumValue93 = bitwiseValue73 + (-1.0f);
                    precise float bitwiseValue74 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue92), productValue157 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
                    precise float sumValue94 = bitwiseValue74 + (-1.0f);
                    precise float bitwiseValue75 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue92), productValue157 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
                    precise float sumValue95 = bitwiseValue75 + (-1.0f);
                    precise float sumValue96 = 1.0f - intermediateValue52;
                    precise float sumValue97 = sumValue96 - intermediateValue53;
                    float intermediateValue1[3];
                    intermediateValue1[0u] = sumValue97;
                    intermediateValue1[1u] = intermediateValue52;
                    intermediateValue1[2u] = intermediateValue53;
                    uint sumValue98 = productValue156 + 0u;
                    uint productValue158 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue23 * 76u) + 56u) * 2 + 0));
                    uint productValue159 = productValue158 * (rdByteLoad_objectInstances_uint(0u, productValue152 * 4 + 0) + bitwiseValue69);
                    uint bitwiseValue76 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue23 * 76u) + 71u) * 2 + 0) & 255u);
                    uint bitwiseValue77 = (bitwiseValue76 + productValue159) >> 1u;
                    half3 productValue160 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue98), bitwiseValue77 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue98), (bitwiseValue77 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue98), (bitwiseValue77 + 2u) * 2 + 0)));
                    uint bitwiseValue78 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue155 * 2 + 0) & 255u);
                    uint bitwiseValue79 = (bitwiseValue78 + productValue159) >> 2u;
                    uint bitwiseValue80 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue155 * 2 + 0) >> 8u);
                    uint bitwiseValue81 = (bitwiseValue80 + productValue159) >> 2u;
                    bool productValue161 = rdByteLoad_objectInstances_uint16_t(0u, productValue154 * 2 + 0) < 0u;
                    float bitwiseValue114;
                    float bitwiseValue115;
                    if (productValue161)
                    {
                        uint bitwiseValue83 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue81 * 4 + 0) >> 15u;
                        bitwiseValue114 = ((float(bitwiseValue83 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue81 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                        bitwiseValue115 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue81 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue83 & 65534u) * 1.525902189314365386962890625e-05f);
                    }
                    else
                    {
                        bitwiseValue114 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue81 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        bitwiseValue115 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue81 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                    }
                    uint intermediateValue206;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue154 * 2 + 0) & 256u) == 0u)
                    {
                        intermediateValue206 = 0u;
                    }
                    else
                    {
                        intermediateValue206 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), ((uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue23 * 76u) + 74u) * 2 + 0) >> 8u) + productValue159) >> 2u) * 4 + 0) & 65535u;
                    }
                    precise float productValue227 = sumValue97 * float(productValue160.x);
                    precise float productValue228 = sumValue97 * float(productValue160.y);
                    precise float productValue229 = sumValue97 * float(productValue160.z);
                    precise float sumValue142 = productValue227 + 0.0f;
                    precise float sumValue143 = productValue228 + 0.0f;
                    precise float sumValue144 = productValue229 + 0.0f;
                    uint productValue230 = productValue158 * (rdByteLoad_objectInstances_uint(0u, productValue152 * 4 + 0) + bitwiseValue70);
                    uint bitwiseValue119 = (bitwiseValue76 + productValue230) >> 1u;
                    half3 productValue231 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue98), bitwiseValue119 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue98), (bitwiseValue119 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue98), (bitwiseValue119 + 2u) * 2 + 0)));
                    uint bitwiseValue120 = (bitwiseValue78 + productValue230) >> 2u;
                    uint bitwiseValue121 = (bitwiseValue80 + productValue230) >> 2u;
                    float bitwiseValue143;
                    float bitwiseValue144;
                    if (productValue161)
                    {
                        uint bitwiseValue137 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue121 * 4 + 0) >> 15u;
                        bitwiseValue143 = ((float(bitwiseValue137 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue121 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                        bitwiseValue144 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue121 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue137 & 65534u) * 1.525902189314365386962890625e-05f);
                    }
                    else
                    {
                        bitwiseValue143 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue121 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        bitwiseValue144 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue121 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                    }
                    precise float productValue253 = intermediateValue52 * float(productValue231.x);
                    precise float productValue254 = intermediateValue52 * float(productValue231.y);
                    precise float productValue255 = intermediateValue52 * float(productValue231.z);
                    precise float sumValue164 = sumValue142 + productValue253;
                    precise float sumValue165 = sumValue143 + productValue254;
                    precise float sumValue166 = sumValue144 + productValue255;
                    uint productValue256 = productValue158 * (rdByteLoad_objectInstances_uint(0u, productValue152 * 4 + 0) + bitwiseValue71);
                    uint bitwiseValue145 = (bitwiseValue76 + productValue256) >> 1u;
                    half3 productValue257 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue98), bitwiseValue145 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue98), (bitwiseValue145 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue98), (bitwiseValue145 + 2u) * 2 + 0)));
                    uint bitwiseValue146 = (bitwiseValue78 + productValue256) >> 2u;
                    uint bitwiseValue147 = (bitwiseValue80 + productValue256) >> 2u;
                    float bitwiseValue156;
                    float bitwiseValue157;
                    if (productValue161)
                    {
                        uint bitwiseValue149 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue147 * 4 + 0) >> 15u;
                        bitwiseValue156 = ((float(bitwiseValue149 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue147 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                        bitwiseValue157 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue147 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue149 & 65534u) * 1.525902189314365386962890625e-05f);
                    }
                    else
                    {
                        bitwiseValue156 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue147 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        bitwiseValue157 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue147 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                    }
                    precise float productValue287 = intermediateValue53 * float(productValue257.x);
                    precise float productValue288 = intermediateValue53 * float(productValue257.y);
                    precise float productValue289 = intermediateValue53 * float(productValue257.z);
                    precise float sumValue190 = sumValue164 + productValue287;
                    precise float sumValue191 = sumValue165 + productValue288;
                    precise float sumValue192 = sumValue166 + productValue289;
                    float productValue290 = ((bitwiseValue143 * intermediateValue52) + (bitwiseValue114 * sumValue97)) + (bitwiseValue156 * intermediateValue53);
                    float productValue291 = ((bitwiseValue144 * intermediateValue52) + (bitwiseValue115 * sumValue97)) + (bitwiseValue157 * intermediateValue53);
                    float bitwiseValue158 = (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue120 * 4 + 0) & 255u) * intermediateValue52) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue79 * 4 + 0) & 255u) * sumValue97)) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue146 * 4 + 0) & 255u) * intermediateValue53)) * 0.0039215688593685626983642578125f;
                    float bitwiseValue159 = (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue120 * 4 + 0) >> 8u) & 255u) * intermediateValue52) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue79 * 4 + 0) >> 8u) & 255u) * sumValue97)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue146 * 4 + 0) >> 8u) & 255u) * intermediateValue53)) * 0.0039215688593685626983642578125f;
                    float bitwiseValue160 = (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue120 * 4 + 0) >> 16u) & 255u) * intermediateValue52) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue79 * 4 + 0) >> 16u) & 255u) * sumValue97)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue146 * 4 + 0) >> 16u) & 255u) * intermediateValue53)) * 0.0039215688593685626983642578125f;
                    float bitwiseValue161 = (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue120 * 4 + 0) >> 24u) * intermediateValue52) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue79 * 4 + 0) >> 24u) * sumValue97)) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue98), bitwiseValue146 * 4 + 0) >> 24u) * intermediateValue53)) * 0.0039215688593685626983642578125f;
                    precise float productValue292 = intermediateValue143 * sumValue190;
                    precise float productValue293 = sumValue191 * intermediateValue144;
                    precise float sumValue193 = productValue293 + productValue292;
                    precise float productValue294 = sumValue192 * intermediateValue145;
                    precise float sumValue194 = productValue294 + sumValue193;
                    precise float productValue295 = 1.0f * reinterpretedBits21.w;
                    precise float sumValue195 = productValue295 + sumValue194;
                    precise float productValue296 = intermediateValue146 * sumValue190;
                    precise float productValue297 = sumValue191 * intermediateValue147;
                    precise float sumValue196 = productValue297 + productValue296;
                    precise float productValue298 = sumValue192 * intermediateValue148;
                    precise float sumValue197 = productValue298 + sumValue196;
                    precise float productValue299 = 1.0f * reinterpretedBits22.w;
                    precise float sumValue198 = productValue299 + sumValue197;
                    precise float productValue300 = intermediateValue149 * sumValue190;
                    precise float productValue301 = sumValue191 * intermediateValue150;
                    precise float sumValue199 = productValue301 + productValue300;
                    precise float productValue302 = sumValue192 * intermediateValue151;
                    precise float sumValue200 = productValue302 + sumValue199;
                    precise float productValue303 = 1.0f * reinterpretedBits23.w;
                    precise float sumValue201 = productValue303 + sumValue200;
                    precise float productValue304 = intermediateValue143 * sumValue93;
                    precise float productValue305 = sumValue94 * intermediateValue144;
                    precise float sumValue202 = productValue305 + productValue304;
                    precise float productValue306 = sumValue95 * intermediateValue145;
                    precise float sumValue203 = productValue306 + sumValue202;
                    precise float productValue307 = intermediateValue146 * sumValue93;
                    precise float productValue308 = sumValue94 * intermediateValue147;
                    precise float sumValue204 = productValue308 + productValue307;
                    precise float productValue309 = sumValue95 * intermediateValue148;
                    precise float sumValue205 = productValue309 + sumValue204;
                    precise float productValue310 = intermediateValue149 * sumValue93;
                    precise float productValue311 = sumValue94 * intermediateValue150;
                    precise float sumValue206 = productValue311 + productValue310;
                    precise float productValue312 = sumValue95 * intermediateValue151;
                    precise float sumValue207 = productValue312 + sumValue206;
                    float inverseLengthValue6 = rsqrt(dot(float3(sumValue203, sumValue205, sumValue207), float3(sumValue203, sumValue205, sumValue207)));
                    precise float productValue313 = sumValue203 * inverseLengthValue6;
                    precise float productValue314 = sumValue205 * inverseLengthValue6;
                    precise float productValue315 = sumValue207 * inverseLengthValue6;
                    bool dotProductValue7 = dot(float3(sumValue26, sumValue28, sumValue30), float3(productValue313, productValue314, productValue315)) > 0.0f;
                    precise float sumValue208 = (-0.0f) - productValue313;
                    precise float sumValue209 = (-0.0f) - productValue314;
                    precise float sumValue210 = (-0.0f) - productValue315;
                    float comparisonValue62 = dotProductValue7 ? sumValue208 : productValue313;
                    float comparisonValue63 = dotProductValue7 ? sumValue209 : productValue314;
                    float comparisonValue64 = dotProductValue7 ? sumValue210 : productValue315;
                    float intermediateValue232;
                    float intermediateValue233;
                    float intermediateValue234;
                    if (((rdByteLoad_objectInstances_uint16_t(0u, productValue154 * 2 + 0) & 1u) != 0u) && (asuint(viewCbConstants[86u]).y != 0u))
                    {
                        uint sumValue215 = productValue156 + 0u;
                        float sumValue216;
                        float sumValue217;
                        float sumValue218;
                        uint sumValue221;
                        float intermediateValue245 = sumValue97;
                        uint intermediateValue246 = bitwiseValue69;
                        float intermediateValue247 = 0.0f;
                        float intermediateValue248 = 0.0f;
                        float intermediateValue249 = 0.0f;
                        uint intermediateValue250 = 0u;
                        half3 productValue329;
                        half3 productValue331;
                        for (;;)
                        {
                            uint productValue327 = intermediateValue246 + rdByteLoad_objectInstances_uint(0u, productValue153 * 4 + 0);
                            uint productValue328 = productValue327 * 8u;
                            productValue329 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue215), productValue328 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue215), (productValue328 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue215), (productValue328 + 2u) * 2 + 0)));
                            uint productValue330 = (productValue327 * 8u) + 4u;
                            productValue331 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue215), productValue330 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue215), (productValue330 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue215), (productValue330 + 2u) * 2 + 0)));
                            half intermediateValue263;
                            half intermediateValue264;
                            half intermediateValue265;
                            if (dotProductValue7)
                            {
                                intermediateValue263 = productValue331.x;
                                intermediateValue264 = productValue331.y;
                                intermediateValue265 = productValue331.z;
                            }
                            else
                            {
                                intermediateValue263 = productValue329.x;
                                intermediateValue264 = productValue329.y;
                                intermediateValue265 = productValue329.z;
                            }
                            precise float productValue348 = float(intermediateValue265) * intermediateValue245;
                            precise float productValue349 = float(intermediateValue264) * intermediateValue245;
                            precise float productValue350 = float(intermediateValue263) * intermediateValue245;
                            sumValue216 = productValue350 + intermediateValue247;
                            sumValue217 = productValue349 + intermediateValue248;
                            sumValue218 = productValue348 + intermediateValue249;
                            sumValue221 = intermediateValue250 + 1u;
                            if (sumValue221 == 3u)
                            {
                                break;
                            }
                            intermediateValue245 = intermediateValue1[sumValue221];
                            intermediateValue246 = intermediateValue[sumValue221];
                            intermediateValue247 = sumValue216;
                            intermediateValue248 = sumValue217;
                            intermediateValue249 = sumValue218;
                            intermediateValue250 = sumValue221;
                            continue;
                        }
                        intermediateValue232 = sumValue216;
                        intermediateValue233 = sumValue217;
                        intermediateValue234 = sumValue218;
                    }
                    else
                    {
                        intermediateValue232 = 0.0f;
                        intermediateValue233 = 0.0f;
                        intermediateValue234 = 0.0f;
                    }
                    float2 reinterpretedBits34 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, (intermediateValue206 * 8u) * 8 + 0));
                    float2 reinterpretedBits35 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue206 * 8u) + 1u) * 8 + 0));
                    float reinterpretedBits36 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue206 * 16u) + 13u) * 4 + 0));
                    float reinterpretedBits37 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue206 * 16u) + 14u) * 4 + 0));
                    float nonlinearValue3 = max(0.0f, log2(abs((viewCbConstants[89u].y * intermediateValue7) + (intermediateValue54 * 0.100000001490116119384765625f))) + float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue92), ((bitwiseValue72 * 8u) + 6u) * 2 + 0))));
                    uint reinterpretedBits39;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue81 * 2 + 0) > 4095u)
                    {
                        reinterpretedBits39 = asuint(viewCbConstants[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits39 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue81 * 2 + 0));
                    }
                    uint sumValue222 = reinterpretedBits39 + 0u;
                    float intermediateValue255;
                    float intermediateValue256;
                    float intermediateValue257;
                    float intermediateValue258;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue81 * 2 + 0) == 65535u)
                    {
                        intermediateValue255 = 1.0f;
                        intermediateValue256 = 1.0f;
                        intermediateValue257 = 1.0f;
                        intermediateValue258 = 1.0f;
                    }
                    else
                    {
                        float4 sampledTextureValue9 = textures[NonUniformResourceIndex(sumValue222)].SampleLevel(defaultSampler, float2(productValue290, productValue291), min(nonlinearValue3, reinterpretedBits36));
                        intermediateValue255 = sampledTextureValue9.x;
                        intermediateValue256 = sampledTextureValue9.y;
                        intermediateValue257 = sampledTextureValue9.z;
                        intermediateValue258 = sampledTextureValue9.w;
                    }
                    float productValue351;
                    float productValue352;
                    float productValue353;
                    float productValue354;
                    float productValue355;
                    float productValue356;
                    float productValue357;
                    float productValue358;
                    float productValue359;
                    float productValue360;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue83 * 2 + 0) & 1536u) == 0u)
                    {
                        float intermediateValue273;
                        float intermediateValue274;
                        float intermediateValue275;
                        float intermediateValue276;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue83 * 2 + 0) & 4u) == 0u)
                        {
                            intermediateValue273 = intermediateValue258;
                            intermediateValue274 = bitwiseValue158;
                            intermediateValue275 = bitwiseValue159;
                            intermediateValue276 = bitwiseValue160;
                        }
                        else
                        {
                            uint reinterpretedBits47;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue82 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits47 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits47 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue82 * 2 + 0));
                            }
                            float4 sampledTextureValue11 = textures[NonUniformResourceIndex(reinterpretedBits47 + 0u)].SampleLevel(defaultSampler, float2(bitwiseValue158, bitwiseValue159), 0.0f);
                            intermediateValue273 = 1.0f;
                            intermediateValue274 = ((((sampledTextureValue11.x * 2.0f) + (-1.0f)) * bitwiseValue160) + 1.0f) * bitwiseValue161;
                            intermediateValue275 = ((((sampledTextureValue11.y * 2.0f) + (-1.0f)) * bitwiseValue160) + 1.0f) * bitwiseValue161;
                            intermediateValue276 = ((((sampledTextureValue11.z * 2.0f) + (-1.0f)) * bitwiseValue160) + 1.0f) * bitwiseValue161;
                        }
                        float intermediateValue288;
                        float intermediateValue289;
                        float intermediateValue290;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue83 * 2 + 0) & 8192u) == 0u)
                        {
                            intermediateValue288 = intermediateValue274;
                            intermediateValue289 = intermediateValue275;
                            intermediateValue290 = intermediateValue276;
                        }
                        else
                        {
                            intermediateValue288 = ((1.0f - intermediateValue274) * intermediateValue273) + intermediateValue274;
                            intermediateValue289 = ((1.0f - intermediateValue275) * intermediateValue273) + intermediateValue275;
                            intermediateValue290 = ((1.0f - intermediateValue276) * intermediateValue273) + intermediateValue276;
                        }
                        float intermediateValue299;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue83 * 2 + 0) & 2048u) == 0u)
                        {
                            intermediateValue299 = intermediateValue273;
                        }
                        else
                        {
                            intermediateValue299 = clamp(mad(intermediateValue273, 2.0f, -1.0f), 0.0f, 1.0f);
                        }
                        float bitwiseValue165 = (intermediateValue288 * intermediateValue255) * ((intermediateValue299 * ((float(rdByteLoad_objectInstances_uint(0u, productValue84 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                        float bitwiseValue166 = (intermediateValue289 * intermediateValue256) * ((intermediateValue299 * ((float((rdByteLoad_objectInstances_uint(0u, productValue84 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                        float bitwiseValue167 = (intermediateValue290 * intermediateValue257) * ((intermediateValue299 * ((float((rdByteLoad_objectInstances_uint(0u, productValue84 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                        float productValue422;
                        if (bitwiseValue165 < 0.040449999272823333740234375f)
                        {
                            productValue422 = bitwiseValue165 * 0.077399380505084991455078125f;
                        }
                        else
                        {
                            productValue422 = exp2(log2((bitwiseValue165 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                        }
                        float productValue461;
                        if (bitwiseValue166 < 0.040449999272823333740234375f)
                        {
                            productValue461 = bitwiseValue166 * 0.077399380505084991455078125f;
                        }
                        else
                        {
                            productValue461 = exp2(log2((bitwiseValue166 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                        }
                        float productValue507;
                        if (bitwiseValue167 < 0.040449999272823333740234375f)
                        {
                            productValue507 = bitwiseValue167 * 0.077399380505084991455078125f;
                        }
                        else
                        {
                            productValue507 = exp2(log2((bitwiseValue167 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                        }
                        float reinterpretedBits51;
                        float reinterpretedBits52;
                        float reinterpretedBits53;
                        if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue206 * 16u) + 8u) * 4 + 0) & 1u) == 0u)
                        {
                            reinterpretedBits51 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue206 * 16u) + 11u) * 4 + 0));
                            reinterpretedBits52 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue206 * 16u) + 9u) * 4 + 0));
                            reinterpretedBits53 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue206 * 16u) + 10u) * 4 + 0));
                        }
                        else
                        {
                            float4 sampledTextureValue19 = textures[NonUniformResourceIndex(sumValue222)].SampleLevel(defaultSampler, float2(mad(productValue290, reinterpretedBits34.x, reinterpretedBits35.x), mad(productValue291, reinterpretedBits34.y, reinterpretedBits35.y)), min((reinterpretedBits37 - reinterpretedBits36) + nonlinearValue3, reinterpretedBits37));
                            float intermediateValue467 = sampledTextureValue19.y;
                            reinterpretedBits51 = sampledTextureValue19.x;
                            reinterpretedBits52 = sampledTextureValue19.z;
                            reinterpretedBits53 = mad(intermediateValue467, intermediateValue467, 0.0f);
                        }
                        float sumValue356 = 1.0f - reinterpretedBits51;
                        float productValue540 = sumValue356 * productValue422;
                        float productValue541 = sumValue356 * productValue461;
                        float productValue542 = sumValue356 * productValue507;
                        float dotProductValue9 = dot(float3(productValue422, productValue461, productValue507), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                        float productValue543 = (reinterpretedBits53 * 5.0f) * viewCbConstants[84u].w;
                        productValue351 = reinterpretedBits52 - (viewCbConstants[85u].w * reinterpretedBits52);
                        productValue352 = productValue543 * (((dotProductValue9 - productValue422) * viewCbConstants[85u].x) + productValue422);
                        productValue353 = productValue543 * (((dotProductValue9 - productValue461) * viewCbConstants[85u].x) + productValue461);
                        productValue354 = productValue543 * (((dotProductValue9 - productValue507) * viewCbConstants[85u].x) + productValue507);
                        productValue355 = (reinterpretedBits51 * (productValue422 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                        productValue356 = (reinterpretedBits51 * (productValue461 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                        productValue357 = (reinterpretedBits51 * (productValue507 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                        productValue358 = productValue540 - (productValue540 * reinterpretedBits53);
                        productValue359 = productValue541 - (productValue541 * reinterpretedBits53);
                        productValue360 = productValue542 - (productValue542 * reinterpretedBits53);
                    }
                    else
                    {
                        productValue351 = intermediateValue262;
                        productValue352 = intermediateValue262;
                        productValue353 = intermediateValue262;
                        productValue354 = intermediateValue262;
                        productValue355 = intermediateValue262;
                        productValue356 = intermediateValue262;
                        productValue357 = intermediateValue262;
                        productValue358 = intermediateValue262;
                        productValue359 = intermediateValue262;
                        productValue360 = intermediateValue262;
                    }
                    float productValue361 = ((productValue352 * comparisonValue36) * viewCbConstants[85u].y) + productValue105;
                    float productValue362 = ((productValue353 * comparisonValue37) * viewCbConstants[85u].y) + productValue106;
                    float productValue363 = ((productValue354 * comparisonValue38) * viewCbConstants[85u].y) + productValue107;
                    float intermediateValue138;
                    float intermediateValue140;
                    float intermediateValue142;
                    if (asuint(viewCbConstants[86u]).y == 0u)
                    {
                        intermediateValue138 = productValue361;
                        intermediateValue140 = productValue362;
                        intermediateValue142 = productValue363;
                    }
                    else
                    {
                        intermediateValue138 = productValue361 + ((intermediateValue232 * comparisonValue36) * productValue358);
                        intermediateValue140 = productValue362 + ((intermediateValue233 * comparisonValue37) * productValue359);
                        intermediateValue142 = productValue363 + ((intermediateValue234 * comparisonValue38) * productValue360);
                    }
                    precise float productValue370 = comparisonValue62 * 256.0f;
                    uint intermediateValue277 = uint(int(productValue370));
                    precise float productValue371 = comparisonValue63 * 256.0f;
                    uint intermediateValue278 = uint(int(productValue371));
                    precise float productValue372 = comparisonValue64 * 256.0f;
                    uint intermediateValue279 = uint(int(productValue372));
                    precise float productValue373 = comparisonValue62 * 1.52587890625e-05f;
                    precise float sumValue226 = sumValue195 + productValue373;
                    float reinterpretedBits43 = (abs(sumValue195) < 0.03125f) ? sumValue226 : asfloat(((sumValue195 < 0.0f) ? (-intermediateValue277) : intermediateValue277) + asuint(sumValue195));
                    precise float productValue374 = comparisonValue63 * 1.52587890625e-05f;
                    precise float sumValue227 = sumValue198 + productValue374;
                    float reinterpretedBits44 = (abs(sumValue198) < 0.03125f) ? sumValue227 : asfloat(((sumValue198 < 0.0f) ? (-intermediateValue278) : intermediateValue278) + asuint(sumValue198));
                    precise float productValue375 = comparisonValue64 * 1.52587890625e-05f;
                    precise float sumValue228 = sumValue201 + productValue375;
                    float reinterpretedBits45 = (abs(sumValue201) < 0.03125f) ? sumValue228 : asfloat(((sumValue201 < 0.0f) ? (-intermediateValue279) : intermediateValue279) + asuint(sumValue201));
                    float intermediateValue291;
                    float intermediateValue292;
                    float intermediateValue293;
                    if (dot(float3(viewCbConstants[52u].xyz), float3(comparisonValue62, comparisonValue63, comparisonValue64)) < 0.0f)
                    {
                        intermediateValue291 = 0.0f;
                        intermediateValue292 = 0.0f;
                        intermediateValue293 = 0.0f;
                    }
                    else
                    {
                        RayDesc _20ident = {float3(reinterpretedBits43, reinterpretedBits44, reinterpretedBits45), 0.0f, float3(viewCbConstants[53u].xyz), 10000.0f};
                        intermediateValue294.TraceRayInline(SceneBVH, 512u, 32u, _20ident);
                        bool intermediateValue295 = intermediateValue294.Proceed();
                        if (intermediateValue295)
                        {
                            bool intermediateValue326;
                            bool comparisonValue72;
                            for (;;)
                            {
                                uint intermediateValue305 = intermediateValue294.CandidateType();
                                comparisonValue72 = intermediateValue305 == 0u;
                                if (comparisonValue72)
                                {
                                    float2 intermediateValue321 = intermediateValue294.CandidateTriangleBarycentrics();
                                    float2 intermediateValue322 = intermediateValue294.CandidateTriangleBarycentrics();
                                    uint intermediateValue323 = intermediateValue294.CandidatePrimitiveIndex();
                                    uint intermediateValue324 = intermediateValue294.CandidateInstanceID();
                                    uint intermediateValue325 = intermediateValue294.CandidateInstanceIndex();
                                    uint productValue423 = (intermediateValue325 * 76u) + 58u;
                                    uint productValue424 = (intermediateValue325 * 76u) + 61u;
                                    precise float sumValue261 = 1.0f - intermediateValue321.x;
                                    precise float sumValue262 = sumValue261 - intermediateValue322.y;
                                    uint bitwiseValue169 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue325 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue323 >> 1u);
                                    uint productValue425 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue325 * 76u) + 54u) * 2 + 0)) + 0u;
                                    bool comparisonValue78 = (intermediateValue323 & 1u) == 0u;
                                    uint comparisonValue79 = comparisonValue78 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue425), bitwiseValue169 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue425), bitwiseValue169 * 16 + 0).x;
                                    uint comparisonValue80 = comparisonValue78 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue425), bitwiseValue169 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue425), bitwiseValue169 * 16 + 0).w;
                                    uint comparisonValue81 = comparisonValue78 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue425), bitwiseValue169 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue425), bitwiseValue169 * 16 + 0).z;
                                    bool productValue426 = rdByteLoad_objectInstances_uint16_t(0u, productValue424 * 2 + 0) < 0u;
                                    float intermediateValue374;
                                    float intermediateValue375;
                                    if (productValue426)
                                    {
                                        uint bitwiseValue177 = comparisonValue81 >> 15u;
                                        precise float bitwiseValue178 = float(bitwiseValue177 & 1u) * 2.0f;
                                        precise float sumValue285 = bitwiseValue178 + (-1.0f);
                                        precise float bitwiseValue179 = float(comparisonValue81 >> 31u) * 2.0f;
                                        precise float sumValue286 = bitwiseValue179 + (-1.0f);
                                        precise float bitwiseValue180 = float((comparisonValue81 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue181 = float(bitwiseValue177 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue452 = sumValue285 * 3.0517578125e-05f;
                                        precise float productValue453 = sumValue286 * 3.0517578125e-05f;
                                        precise float sumValue287 = bitwiseValue180 + productValue452;
                                        precise float sumValue288 = bitwiseValue181 + productValue453;
                                        intermediateValue374 = sumValue287;
                                        intermediateValue375 = sumValue288;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue182 = float(comparisonValue81 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue183 = float(comparisonValue81 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue454 = bitwiseValue182 * 16384.0f;
                                        precise float sumValue289 = productValue454 + 0.5f;
                                        precise float productValue455 = bitwiseValue183 * 16384.0f;
                                        precise float sumValue290 = productValue455 + 0.5f;
                                        precise float productValue456 = floor(sumValue289) * 6.103515625e-05f;
                                        precise float productValue457 = floor(sumValue290) * 6.103515625e-05f;
                                        intermediateValue374 = productValue456;
                                        intermediateValue375 = productValue457;
                                    }
                                    precise float productValue462 = sumValue262 * intermediateValue374;
                                    precise float productValue463 = sumValue262 * intermediateValue375;
                                    precise float sumValue293 = productValue462 + 0.0f;
                                    precise float sumValue294 = productValue463 + 0.0f;
                                    float intermediateValue446;
                                    float intermediateValue447;
                                    if (productValue426)
                                    {
                                        uint bitwiseValue193 = comparisonValue80 >> 15u;
                                        precise float bitwiseValue194 = float(bitwiseValue193 & 1u) * 2.0f;
                                        precise float sumValue305 = bitwiseValue194 + (-1.0f);
                                        precise float bitwiseValue195 = float(comparisonValue80 >> 31u) * 2.0f;
                                        precise float sumValue306 = bitwiseValue195 + (-1.0f);
                                        precise float bitwiseValue196 = float((comparisonValue80 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue197 = float(bitwiseValue193 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue478 = sumValue305 * 3.0517578125e-05f;
                                        precise float productValue479 = sumValue306 * 3.0517578125e-05f;
                                        precise float sumValue307 = bitwiseValue196 + productValue478;
                                        precise float sumValue308 = bitwiseValue197 + productValue479;
                                        intermediateValue446 = sumValue307;
                                        intermediateValue447 = sumValue308;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue198 = float(comparisonValue80 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue199 = float(comparisonValue80 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue480 = bitwiseValue198 * 16384.0f;
                                        precise float sumValue309 = productValue480 + 0.5f;
                                        precise float productValue481 = bitwiseValue199 * 16384.0f;
                                        precise float sumValue310 = productValue481 + 0.5f;
                                        precise float productValue482 = floor(sumValue309) * 6.103515625e-05f;
                                        precise float productValue483 = floor(sumValue310) * 6.103515625e-05f;
                                        intermediateValue446 = productValue482;
                                        intermediateValue447 = productValue483;
                                    }
                                    precise float productValue508 = intermediateValue321.x * intermediateValue446;
                                    precise float productValue509 = intermediateValue321.x * intermediateValue447;
                                    precise float sumValue329 = sumValue293 + productValue508;
                                    precise float sumValue330 = sumValue294 + productValue509;
                                    float intermediateValue484;
                                    float intermediateValue485;
                                    if (productValue426)
                                    {
                                        uint bitwiseValue238 = comparisonValue79 >> 15u;
                                        precise float bitwiseValue239 = float(bitwiseValue238 & 1u) * 2.0f;
                                        precise float sumValue357 = bitwiseValue239 + (-1.0f);
                                        precise float bitwiseValue240 = float(comparisonValue79 >> 31u) * 2.0f;
                                        precise float sumValue358 = bitwiseValue240 + (-1.0f);
                                        precise float bitwiseValue241 = float((comparisonValue79 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue242 = float(bitwiseValue238 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue544 = sumValue357 * 3.0517578125e-05f;
                                        precise float productValue545 = sumValue358 * 3.0517578125e-05f;
                                        precise float sumValue359 = bitwiseValue241 + productValue544;
                                        precise float sumValue360 = bitwiseValue242 + productValue545;
                                        intermediateValue484 = sumValue359;
                                        intermediateValue485 = sumValue360;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue243 = float(comparisonValue79 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue244 = float(comparisonValue79 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue546 = bitwiseValue243 * 16384.0f;
                                        precise float sumValue361 = productValue546 + 0.5f;
                                        precise float productValue547 = bitwiseValue244 * 16384.0f;
                                        precise float sumValue362 = productValue547 + 0.5f;
                                        precise float productValue548 = floor(sumValue361) * 6.103515625e-05f;
                                        precise float productValue549 = floor(sumValue362) * 6.103515625e-05f;
                                        intermediateValue484 = productValue548;
                                        intermediateValue485 = productValue549;
                                    }
                                    precise float productValue578 = intermediateValue322.y * intermediateValue484;
                                    precise float productValue579 = intermediateValue322.y * intermediateValue485;
                                    precise float sumValue389 = sumValue329 + productValue578;
                                    precise float sumValue390 = sumValue330 + productValue579;
                                    float intermediateValue493;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue423 * 2 + 0) == 65535u)
                                    {
                                        intermediateValue493 = 1.0f;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits55;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue423 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits55 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits55 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue423 * 2 + 0));
                                        }
                                        intermediateValue493 = textures[NonUniformResourceIndex(reinterpretedBits55 + 0u)].SampleLevel(defaultSampler, float2(sumValue389, sumValue390), -0.25f).w;
                                    }
                                    uint comparisonValue120;
                                    if (intermediateValue324 == 2u)
                                    {
                                        comparisonValue120 = 0u;
                                    }
                                    else
                                    {
                                        comparisonValue120 = uint(intermediateValue493 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue424 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                                    }
                                    if (comparisonValue120 == 0u)
                                    {
                                        intermediateValue294.CommitNonOpaqueTriangleHit();
                                    }
                                }
                                intermediateValue326 = intermediateValue294.Proceed();
                                if (intermediateValue326)
                                {
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                        uint intermediateValue301 = intermediateValue294.CommittedStatus();
                        float intermediateValue307;
                        if (intermediateValue301 == 1u)
                        {
                            float intermediateValue306 = intermediateValue294.CommittedRayT();
                            intermediateValue307 = intermediateValue306;
                        }
                        else
                        {
                            intermediateValue307 = 10000.0f;
                        }
                        float branchMergedValue41;
                        float branchMergedValue67;
                        float branchMergedValue68;
                        if (intermediateValue307 < 10000.0f)
                        {
                            precise float productValue427 = intermediateValue307 * viewCbConstants[63u].x;
                            precise float productValue428 = intermediateValue307 * viewCbConstants[63u].y;
                            precise float productValue429 = intermediateValue307 * viewCbConstants[63u].z;
                            precise float productValue430 = productValue427 * (-1.44269502162933349609375f);
                            precise float productValue431 = productValue428 * (-1.44269502162933349609375f);
                            precise float productValue432 = productValue429 * (-1.44269502162933349609375f);
                            precise float productValue433 = viewCbConstants[53u].x * intermediateValue307;
                            precise float sumValue263 = productValue433 + reinterpretedBits43;
                            precise float productValue434 = viewCbConstants[53u].z * intermediateValue307;
                            precise float sumValue264 = productValue434 + reinterpretedBits45;
                            precise float productValue435 = sumValue263 * viewCbConstants[83u].z;
                            precise float sumValue265 = productValue435 + viewCbConstants[84u].x;
                            precise float productValue436 = sumValue264 * viewCbConstants[83u].w;
                            precise float sumValue266 = productValue436 + viewCbConstants[84u].y;
                            float4 sampledTextureValue15 = wibblyTexture.SampleLevel(linearWrapSampler, float2(sumValue265, sumValue266), 0.0f);
                            precise float sumValue267 = sampledTextureValue15.x + (-0.5f);
                            precise float sumValue268 = sampledTextureValue15.y + (-0.5f);
                            precise float productValue437 = sumValue263 * viewCbConstants[82u].z;
                            precise float sumValue269 = productValue437 + viewCbConstants[83u].x;
                            precise float productValue438 = sumValue264 * viewCbConstants[82u].w;
                            precise float sumValue270 = productValue438 + viewCbConstants[83u].y;
                            precise float productValue439 = sumValue267 * 0.4000000059604644775390625f;
                            precise float productValue440 = sumValue268 * 0.4000000059604644775390625f;
                            precise float sumValue271 = sumValue269 + productValue439;
                            precise float sumValue272 = productValue440 + sumValue270;
                            precise float productValue441 = viewCbConstants[68u].w * 63.0f;
                            uint intermediateValue327 = uint(int(floor(productValue441)));
                            precise float productValue442 = float(int(intermediateValue327 + 1u)) * 0.015625f;
                            precise float sumValue273 = (-0.0f) - productValue442;
                            float intermediateValue328 = frac(abs(productValue442));
                            precise float sumValue274 = (-0.0f) - intermediateValue328;
                            precise float comparisonValue82 = ((productValue442 >= sumValue273) ? intermediateValue328 : sumValue274) * 64.0f;
                            float4 sampledTextureValue16 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue271, sumValue272, float(int(intermediateValue327))), 0.0f);
                            float intermediateValue329 = sampledTextureValue16.x;
                            precise float sampledTextureValue17 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue271, sumValue272, float(int(uint(int(comparisonValue82))))), 0.0f).x - intermediateValue329;
                            precise float productValue443 = frac(productValue441) * sampledTextureValue17;
                            precise float sumValue275 = intermediateValue329 + productValue443;
                            precise float productValue444 = sumValue275 * 7.0f;
                            precise float sumValue276 = productValue444 + 0.800000011920928955078125f;
                            precise float productValue445 = intermediateValue307 * (-0.100000001490116119384765625f);
                            precise float sumValue277 = sumValue276 + (-1.0f);
                            precise float exponentialValue4 = exp2(productValue445) * sumValue277;
                            precise float sumValue278 = exponentialValue4 + 1.0f;
                            precise float exponentialValue5 = exp2(productValue430) * sumValue278;
                            precise float exponentialValue6 = exp2(productValue431) * sumValue278;
                            precise float exponentialValue7 = exp2(productValue432) * sumValue278;
                            RayDesc _21ident = {float3(reinterpretedBits43, reinterpretedBits44, reinterpretedBits45), 0.0f, float3(viewCbConstants[53u].xyz), intermediateValue307};
                            intermediateValue330.TraceRayInline(SceneBVH, 512u, 22u, _21ident);
                            bool intermediateValue331 = intermediateValue330.Proceed();
                            float intermediateValue348;
                            float intermediateValue350;
                            float intermediateValue352;
                            if (intermediateValue331)
                            {
                                float intermediateValue349;
                                float intermediateValue351;
                                float intermediateValue353;
                                float intermediateValue376 = exponentialValue5;
                                float intermediateValue377 = exponentialValue6;
                                float intermediateValue378 = exponentialValue7;
                                bool comparisonValue89;
                                for (;;)
                                {
                                    uint intermediateValue379 = intermediateValue330.CandidateType();
                                    comparisonValue89 = intermediateValue379 == 0u;
                                    float branchMergedValue4;
                                    float branchMergedValue17;
                                    float branchMergedValue18;
                                    if (comparisonValue89)
                                    {
                                        float2 intermediateValue413 = intermediateValue330.CandidateTriangleBarycentrics();
                                        float2 intermediateValue414 = intermediateValue330.CandidateTriangleBarycentrics();
                                        float intermediateValue415 = intermediateValue330.CandidateTriangleRayT();
                                        uint intermediateValue416 = intermediateValue330.CandidatePrimitiveIndex();
                                        uint intermediateValue417 = intermediateValue330.CandidateInstanceID();
                                        uint intermediateValue418 = intermediateValue330.CandidateInstanceIndex();
                                        uint productValue484 = (intermediateValue418 * 76u) + 58u;
                                        uint productValue485 = (intermediateValue418 * 76u) + 61u;
                                        precise float sumValue311 = 1.0f - intermediateValue413.x;
                                        precise float sumValue312 = sumValue311 - intermediateValue414.y;
                                        uint bitwiseValue200 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue418 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue416 >> 1u);
                                        uint productValue486 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue418 * 76u) + 54u) * 2 + 0)) + 0u;
                                        bool comparisonValue100 = (intermediateValue416 & 1u) == 0u;
                                        uint comparisonValue101 = comparisonValue100 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue486), bitwiseValue200 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue486), bitwiseValue200 * 16 + 0).x;
                                        uint comparisonValue102 = comparisonValue100 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue486), bitwiseValue200 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue486), bitwiseValue200 * 16 + 0).w;
                                        uint comparisonValue103 = comparisonValue100 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue486), bitwiseValue200 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue486), bitwiseValue200 * 16 + 0).z;
                                        bool productValue487 = rdByteLoad_objectInstances_uint16_t(0u, productValue485 * 2 + 0) < 0u;
                                        float intermediateValue468;
                                        float intermediateValue469;
                                        if (productValue487)
                                        {
                                            uint bitwiseValue216 = comparisonValue103 >> 15u;
                                            precise float bitwiseValue217 = float(bitwiseValue216 & 1u) * 2.0f;
                                            precise float sumValue331 = bitwiseValue217 + (-1.0f);
                                            precise float bitwiseValue218 = float(comparisonValue103 >> 31u) * 2.0f;
                                            precise float sumValue332 = bitwiseValue218 + (-1.0f);
                                            precise float bitwiseValue219 = float((comparisonValue103 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue220 = float(bitwiseValue216 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue510 = sumValue331 * 3.0517578125e-05f;
                                            precise float productValue511 = sumValue332 * 3.0517578125e-05f;
                                            precise float sumValue333 = bitwiseValue219 + productValue510;
                                            precise float sumValue334 = bitwiseValue220 + productValue511;
                                            intermediateValue468 = sumValue333;
                                            intermediateValue469 = sumValue334;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue221 = float(comparisonValue103 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue222 = float(comparisonValue103 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue512 = bitwiseValue221 * 16384.0f;
                                            precise float sumValue335 = productValue512 + 0.5f;
                                            precise float productValue513 = bitwiseValue222 * 16384.0f;
                                            precise float sumValue336 = productValue513 + 0.5f;
                                            precise float productValue514 = floor(sumValue335) * 6.103515625e-05f;
                                            precise float productValue515 = floor(sumValue336) * 6.103515625e-05f;
                                            intermediateValue468 = productValue514;
                                            intermediateValue469 = productValue515;
                                        }
                                        precise float productValue550 = sumValue312 * intermediateValue468;
                                        precise float productValue551 = sumValue312 * intermediateValue469;
                                        precise float sumValue363 = productValue550 + 0.0f;
                                        precise float sumValue364 = productValue551 + 0.0f;
                                        float intermediateValue494;
                                        float intermediateValue495;
                                        if (productValue487)
                                        {
                                            uint bitwiseValue267 = comparisonValue102 >> 15u;
                                            precise float bitwiseValue268 = float(bitwiseValue267 & 1u) * 2.0f;
                                            precise float sumValue391 = bitwiseValue268 + (-1.0f);
                                            precise float bitwiseValue269 = float(comparisonValue102 >> 31u) * 2.0f;
                                            precise float sumValue392 = bitwiseValue269 + (-1.0f);
                                            precise float bitwiseValue270 = float((comparisonValue102 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue271 = float(bitwiseValue267 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue580 = sumValue391 * 3.0517578125e-05f;
                                            precise float productValue581 = sumValue392 * 3.0517578125e-05f;
                                            precise float sumValue393 = bitwiseValue270 + productValue580;
                                            precise float sumValue394 = bitwiseValue271 + productValue581;
                                            intermediateValue494 = sumValue393;
                                            intermediateValue495 = sumValue394;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue272 = float(comparisonValue102 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue273 = float(comparisonValue102 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue582 = bitwiseValue272 * 16384.0f;
                                            precise float sumValue395 = productValue582 + 0.5f;
                                            precise float productValue583 = bitwiseValue273 * 16384.0f;
                                            precise float sumValue396 = productValue583 + 0.5f;
                                            precise float productValue584 = floor(sumValue395) * 6.103515625e-05f;
                                            precise float productValue585 = floor(sumValue396) * 6.103515625e-05f;
                                            intermediateValue494 = productValue584;
                                            intermediateValue495 = productValue585;
                                        }
                                        precise float productValue604 = intermediateValue413.x * intermediateValue494;
                                        precise float productValue605 = intermediateValue413.x * intermediateValue495;
                                        precise float sumValue415 = sumValue363 + productValue604;
                                        precise float sumValue416 = sumValue364 + productValue605;
                                        float intermediateValue506;
                                        float intermediateValue507;
                                        if (productValue487)
                                        {
                                            uint bitwiseValue309 = comparisonValue101 >> 15u;
                                            precise float bitwiseValue310 = float(bitwiseValue309 & 1u) * 2.0f;
                                            precise float sumValue439 = bitwiseValue310 + (-1.0f);
                                            precise float bitwiseValue311 = float(comparisonValue101 >> 31u) * 2.0f;
                                            precise float sumValue440 = bitwiseValue311 + (-1.0f);
                                            precise float bitwiseValue312 = float((comparisonValue101 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue313 = float(bitwiseValue309 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue628 = sumValue439 * 3.0517578125e-05f;
                                            precise float productValue629 = sumValue440 * 3.0517578125e-05f;
                                            precise float sumValue441 = bitwiseValue312 + productValue628;
                                            precise float sumValue442 = bitwiseValue313 + productValue629;
                                            intermediateValue506 = sumValue441;
                                            intermediateValue507 = sumValue442;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue314 = float(comparisonValue101 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue315 = float(comparisonValue101 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue630 = bitwiseValue314 * 16384.0f;
                                            precise float sumValue443 = productValue630 + 0.5f;
                                            precise float productValue631 = bitwiseValue315 * 16384.0f;
                                            precise float sumValue444 = productValue631 + 0.5f;
                                            precise float productValue632 = floor(sumValue443) * 6.103515625e-05f;
                                            precise float productValue633 = floor(sumValue444) * 6.103515625e-05f;
                                            intermediateValue506 = productValue632;
                                            intermediateValue507 = productValue633;
                                        }
                                        precise float productValue654 = intermediateValue414.y * intermediateValue506;
                                        precise float productValue655 = intermediateValue414.y * intermediateValue507;
                                        precise float sumValue465 = sumValue415 + productValue654;
                                        precise float sumValue466 = sumValue416 + productValue655;
                                        precise float productValue656 = intermediateValue415 * 0.083333335816860198974609375f;
                                        precise float sumValue467 = productValue656 + (-0.25f);
                                        float intermediateValue520;
                                        float intermediateValue521;
                                        float intermediateValue522;
                                        float intermediateValue523;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue484 * 2 + 0) == 65535u)
                                        {
                                            intermediateValue520 = 1.0f;
                                            intermediateValue521 = 1.0f;
                                            intermediateValue522 = 1.0f;
                                            intermediateValue523 = 1.0f;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits58;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue484 * 2 + 0) > 4095u)
                                            {
                                                reinterpretedBits58 = asuint(viewCbConstants[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits58 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue484 * 2 + 0));
                                            }
                                            float4 sampledTextureValue22 = textures[NonUniformResourceIndex(reinterpretedBits58 + 0u)].SampleLevel(defaultSampler, float2(sumValue465, sumValue466), min(sumValue467, 2.0f));
                                            intermediateValue520 = sampledTextureValue22.x;
                                            intermediateValue521 = sampledTextureValue22.y;
                                            intermediateValue522 = sampledTextureValue22.z;
                                            intermediateValue523 = sampledTextureValue22.w;
                                        }
                                        float intermediateValue542;
                                        float intermediateValue543;
                                        float intermediateValue544;
                                        if (intermediateValue417 == 2u)
                                        {
                                            float branchMergedValue44;
                                            float branchMergedValue73;
                                            float branchMergedValue74;
                                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue485 * 2 + 0) & 128u) == 0u)
                                            {
                                                float intermediateValue556;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue485 * 2 + 0) & 2048u) == 0u)
                                                {
                                                    intermediateValue556 = intermediateValue523;
                                                }
                                                else
                                                {
                                                    precise float productValue703 = intermediateValue523 * 2.0f;
                                                    precise float sumValue519 = productValue703 + (-1.0f);
                                                    intermediateValue556 = clamp(sumValue519, 0.0f, 1.0f);
                                                }
                                                precise float sumValue516 = 0.0f - intermediateValue520;
                                                precise float sumValue517 = 0.0f - intermediateValue521;
                                                precise float sumValue518 = 0.0f - intermediateValue522;
                                                precise float productValue700 = sumValue516 * intermediateValue556;
                                                precise float productValue701 = sumValue517 * intermediateValue556;
                                                precise float productValue702 = sumValue518 * intermediateValue556;
                                                precise float sumValue501 = intermediateValue520 + productValue700;
                                                precise float sumValue502 = intermediateValue521 + productValue701;
                                                precise float sumValue503 = intermediateValue522 + productValue702;
                                                branchMergedValue44 = sumValue502;
                                                branchMergedValue73 = sumValue501;
                                                branchMergedValue74 = sumValue503;
                                            }
                                            else
                                            {
                                                branchMergedValue44 = 0.33399999141693115234375f;
                                                branchMergedValue73 = 0.33399999141693115234375f;
                                                branchMergedValue74 = 0.33399999141693115234375f;
                                            }
                                            intermediateValue542 = branchMergedValue73;
                                            intermediateValue543 = branchMergedValue44;
                                            intermediateValue544 = branchMergedValue74;
                                        }
                                        else
                                        {
                                            precise float sumValue490 = 1.0f - intermediateValue523;
                                            intermediateValue542 = sumValue490;
                                            intermediateValue543 = sumValue490;
                                            intermediateValue544 = sumValue490;
                                        }
                                        precise float productValue686 = intermediateValue376 * intermediateValue542;
                                        precise float productValue687 = intermediateValue377 * intermediateValue543;
                                        precise float productValue688 = intermediateValue378 * intermediateValue544;
                                        float intermediateValue419;
                                        float intermediateValue420;
                                        float intermediateValue421;
                                        bool intermediateValue557;
                                        if (!(dot(float3(productValue686, productValue687, productValue688), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                        {
                                            intermediateValue557 = false;
                                            intermediateValue419 = productValue686;
                                            intermediateValue420 = productValue687;
                                            intermediateValue421 = productValue688;
                                        }
                                        else
                                        {
                                            intermediateValue557 = true;
                                            intermediateValue419 = 0.0f;
                                            intermediateValue420 = 0.0f;
                                            intermediateValue421 = 0.0f;
                                        }
                                        float branchMergedValue85;
                                        float branchMergedValue97;
                                        float branchMergedValue98;
                                        if (intermediateValue557)
                                        {
                                            intermediateValue330.CommitNonOpaqueTriangleHit();
                                            branchMergedValue85 = intermediateValue421;
                                            branchMergedValue97 = intermediateValue420;
                                            branchMergedValue98 = intermediateValue419;
                                        }
                                        else
                                        {
                                            branchMergedValue85 = intermediateValue421;
                                            branchMergedValue97 = intermediateValue420;
                                            branchMergedValue98 = intermediateValue419;
                                        }
                                        branchMergedValue4 = branchMergedValue85;
                                        branchMergedValue17 = branchMergedValue97;
                                        branchMergedValue18 = branchMergedValue98;
                                    }
                                    else
                                    {
                                        branchMergedValue4 = intermediateValue378;
                                        branchMergedValue17 = intermediateValue377;
                                        branchMergedValue18 = intermediateValue376;
                                    }
                                    intermediateValue353 = branchMergedValue4;
                                    intermediateValue351 = branchMergedValue17;
                                    intermediateValue349 = branchMergedValue18;
                                    bool intermediateValue422 = intermediateValue330.Proceed();
                                    if (intermediateValue422)
                                    {
                                        intermediateValue376 = intermediateValue349;
                                        intermediateValue377 = intermediateValue351;
                                        intermediateValue378 = intermediateValue353;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue348 = intermediateValue349;
                                intermediateValue350 = intermediateValue351;
                                intermediateValue352 = intermediateValue353;
                            }
                            else
                            {
                                intermediateValue348 = exponentialValue5;
                                intermediateValue350 = exponentialValue6;
                                intermediateValue352 = exponentialValue7;
                            }
                            uint intermediateValue354 = intermediateValue330.CommittedStatus();
                            bool comparisonValue85 = intermediateValue354 == 1u;
                            float comparisonValue68 = comparisonValue85 ? 0.0f : intermediateValue348;
                            float comparisonValue69 = comparisonValue85 ? 0.0f : intermediateValue350;
                            float comparisonValue70 = comparisonValue85 ? 0.0f : intermediateValue352;
                            float branchMergedValue114;
                            float branchMergedValue122;
                            float branchMergedValue123;
                            if (dot(float3(comparisonValue68, comparisonValue69, comparisonValue70), 1.0f.xxx) > 0.00999999977648258209228515625f)
                            {
                                RayDesc _22ident = {float3(sumValue263, mad(viewCbConstants[53u].y, intermediateValue307, reinterpretedBits44), sumValue264), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                                intermediateValue380.TraceRayInline(SceneBVH, 512u, 22u, _22ident);
                                bool intermediateValue381 = intermediateValue380.Proceed();
                                float intermediateValue423;
                                float intermediateValue425;
                                float intermediateValue427;
                                if (intermediateValue381)
                                {
                                    float intermediateValue424;
                                    float intermediateValue426;
                                    float intermediateValue428;
                                    float intermediateValue448 = comparisonValue68;
                                    float intermediateValue449 = comparisonValue69;
                                    float intermediateValue450 = comparisonValue70;
                                    bool comparisonValue110;
                                    for (;;)
                                    {
                                        uint intermediateValue451 = intermediateValue380.CandidateType();
                                        comparisonValue110 = intermediateValue451 == 0u;
                                        float branchMergedValue7;
                                        float branchMergedValue23;
                                        float branchMergedValue24;
                                        if (comparisonValue110)
                                        {
                                            float2 intermediateValue470 = intermediateValue380.CandidateTriangleBarycentrics();
                                            float2 intermediateValue471 = intermediateValue380.CandidateTriangleBarycentrics();
                                            float intermediateValue472 = intermediateValue380.CandidateTriangleRayT();
                                            uint intermediateValue473 = intermediateValue380.CandidatePrimitiveIndex();
                                            uint intermediateValue474 = intermediateValue380.CandidateInstanceID();
                                            uint intermediateValue475 = intermediateValue380.CandidateInstanceIndex();
                                            uint productValue552 = (intermediateValue475 * 76u) + 58u;
                                            uint productValue553 = (intermediateValue475 * 76u) + 61u;
                                            precise float sumValue365 = 1.0f - intermediateValue470.x;
                                            precise float sumValue366 = sumValue365 - intermediateValue471.y;
                                            uint bitwiseValue245 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue475 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue473 >> 1u);
                                            uint productValue554 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue475 * 76u) + 54u) * 2 + 0)) + 0u;
                                            bool comparisonValue115 = (intermediateValue473 & 1u) == 0u;
                                            uint comparisonValue116 = comparisonValue115 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue554), bitwiseValue245 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue554), bitwiseValue245 * 16 + 0).x;
                                            uint comparisonValue117 = comparisonValue115 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue554), bitwiseValue245 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue554), bitwiseValue245 * 16 + 0).w;
                                            uint comparisonValue118 = comparisonValue115 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue554), bitwiseValue245 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue554), bitwiseValue245 * 16 + 0).z;
                                            bool productValue555 = rdByteLoad_objectInstances_uint16_t(0u, productValue553 * 2 + 0) < 0u;
                                            float intermediateValue496;
                                            float intermediateValue497;
                                            if (productValue555)
                                            {
                                                uint bitwiseValue274 = comparisonValue118 >> 15u;
                                                precise float bitwiseValue275 = float(bitwiseValue274 & 1u) * 2.0f;
                                                precise float sumValue397 = bitwiseValue275 + (-1.0f);
                                                precise float bitwiseValue276 = float(comparisonValue118 >> 31u) * 2.0f;
                                                precise float sumValue398 = bitwiseValue276 + (-1.0f);
                                                precise float bitwiseValue277 = float((comparisonValue118 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue278 = float(bitwiseValue274 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue586 = sumValue397 * 3.0517578125e-05f;
                                                precise float productValue587 = sumValue398 * 3.0517578125e-05f;
                                                precise float sumValue399 = bitwiseValue277 + productValue586;
                                                precise float sumValue400 = bitwiseValue278 + productValue587;
                                                intermediateValue496 = sumValue399;
                                                intermediateValue497 = sumValue400;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue279 = float(comparisonValue118 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue280 = float(comparisonValue118 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue588 = bitwiseValue279 * 16384.0f;
                                                precise float sumValue401 = productValue588 + 0.5f;
                                                precise float productValue589 = bitwiseValue280 * 16384.0f;
                                                precise float sumValue402 = productValue589 + 0.5f;
                                                precise float productValue590 = floor(sumValue401) * 6.103515625e-05f;
                                                precise float productValue591 = floor(sumValue402) * 6.103515625e-05f;
                                                intermediateValue496 = productValue590;
                                                intermediateValue497 = productValue591;
                                            }
                                            precise float productValue606 = sumValue366 * intermediateValue496;
                                            precise float productValue607 = sumValue366 * intermediateValue497;
                                            precise float sumValue417 = productValue606 + 0.0f;
                                            precise float sumValue418 = productValue607 + 0.0f;
                                            float intermediateValue508;
                                            float intermediateValue509;
                                            if (productValue555)
                                            {
                                                uint bitwiseValue316 = comparisonValue117 >> 15u;
                                                precise float bitwiseValue317 = float(bitwiseValue316 & 1u) * 2.0f;
                                                precise float sumValue445 = bitwiseValue317 + (-1.0f);
                                                precise float bitwiseValue318 = float(comparisonValue117 >> 31u) * 2.0f;
                                                precise float sumValue446 = bitwiseValue318 + (-1.0f);
                                                precise float bitwiseValue319 = float((comparisonValue117 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue320 = float(bitwiseValue316 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue634 = sumValue445 * 3.0517578125e-05f;
                                                precise float productValue635 = sumValue446 * 3.0517578125e-05f;
                                                precise float sumValue447 = bitwiseValue319 + productValue634;
                                                precise float sumValue448 = bitwiseValue320 + productValue635;
                                                intermediateValue508 = sumValue447;
                                                intermediateValue509 = sumValue448;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue321 = float(comparisonValue117 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue322 = float(comparisonValue117 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue636 = bitwiseValue321 * 16384.0f;
                                                precise float sumValue449 = productValue636 + 0.5f;
                                                precise float productValue637 = bitwiseValue322 * 16384.0f;
                                                precise float sumValue450 = productValue637 + 0.5f;
                                                precise float productValue638 = floor(sumValue449) * 6.103515625e-05f;
                                                precise float productValue639 = floor(sumValue450) * 6.103515625e-05f;
                                                intermediateValue508 = productValue638;
                                                intermediateValue509 = productValue639;
                                            }
                                            precise float productValue657 = intermediateValue470.x * intermediateValue508;
                                            precise float productValue658 = intermediateValue470.x * intermediateValue509;
                                            precise float sumValue468 = sumValue417 + productValue657;
                                            precise float sumValue469 = sumValue418 + productValue658;
                                            float intermediateValue530;
                                            float intermediateValue531;
                                            if (productValue555)
                                            {
                                                uint bitwiseValue337 = comparisonValue116 >> 15u;
                                                precise float bitwiseValue338 = float(bitwiseValue337 & 1u) * 2.0f;
                                                precise float sumValue479 = bitwiseValue338 + (-1.0f);
                                                precise float bitwiseValue339 = float(comparisonValue116 >> 31u) * 2.0f;
                                                precise float sumValue480 = bitwiseValue339 + (-1.0f);
                                                precise float bitwiseValue340 = float((comparisonValue116 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue341 = float(bitwiseValue337 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue668 = sumValue479 * 3.0517578125e-05f;
                                                precise float productValue669 = sumValue480 * 3.0517578125e-05f;
                                                precise float sumValue481 = bitwiseValue340 + productValue668;
                                                precise float sumValue482 = bitwiseValue341 + productValue669;
                                                intermediateValue530 = sumValue481;
                                                intermediateValue531 = sumValue482;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue342 = float(comparisonValue116 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue343 = float(comparisonValue116 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue670 = bitwiseValue342 * 16384.0f;
                                                precise float sumValue483 = productValue670 + 0.5f;
                                                precise float productValue671 = bitwiseValue343 * 16384.0f;
                                                precise float sumValue484 = productValue671 + 0.5f;
                                                precise float productValue672 = floor(sumValue483) * 6.103515625e-05f;
                                                precise float productValue673 = floor(sumValue484) * 6.103515625e-05f;
                                                intermediateValue530 = productValue672;
                                                intermediateValue531 = productValue673;
                                            }
                                            precise float productValue677 = intermediateValue471.y * intermediateValue530;
                                            precise float productValue678 = intermediateValue471.y * intermediateValue531;
                                            precise float sumValue491 = sumValue468 + productValue677;
                                            precise float sumValue492 = sumValue469 + productValue678;
                                            precise float productValue679 = intermediateValue472 * 0.083333335816860198974609375f;
                                            precise float sumValue493 = productValue679 + (-0.25f);
                                            float intermediateValue545;
                                            float intermediateValue546;
                                            float intermediateValue547;
                                            float intermediateValue548;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue552 * 2 + 0) == 65535u)
                                            {
                                                intermediateValue545 = 1.0f;
                                                intermediateValue546 = 1.0f;
                                                intermediateValue547 = 1.0f;
                                                intermediateValue548 = 1.0f;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits61;
                                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue552 * 2 + 0) > 4095u)
                                                {
                                                    reinterpretedBits61 = asuint(viewCbConstants[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits61 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue552 * 2 + 0));
                                                }
                                                float4 sampledTextureValue25 = textures[NonUniformResourceIndex(reinterpretedBits61 + 0u)].SampleLevel(defaultSampler, float2(sumValue491, sumValue492), min(sumValue493, 2.0f));
                                                intermediateValue545 = sampledTextureValue25.x;
                                                intermediateValue546 = sampledTextureValue25.y;
                                                intermediateValue547 = sampledTextureValue25.z;
                                                intermediateValue548 = sampledTextureValue25.w;
                                            }
                                            float intermediateValue563;
                                            float intermediateValue564;
                                            float intermediateValue565;
                                            if (intermediateValue474 == 2u)
                                            {
                                                float branchMergedValue47;
                                                float branchMergedValue79;
                                                float branchMergedValue80;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue553 * 2 + 0) & 128u) == 0u)
                                                {
                                                    float intermediateValue568;
                                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue553 * 2 + 0) & 2048u) == 0u)
                                                    {
                                                        intermediateValue568 = intermediateValue548;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue721 = intermediateValue548 * 2.0f;
                                                        precise float sumValue538 = productValue721 + (-1.0f);
                                                        intermediateValue568 = clamp(sumValue538, 0.0f, 1.0f);
                                                    }
                                                    precise float sumValue535 = 0.0f - intermediateValue545;
                                                    precise float sumValue536 = 0.0f - intermediateValue546;
                                                    precise float sumValue537 = 0.0f - intermediateValue547;
                                                    precise float productValue718 = sumValue535 * intermediateValue568;
                                                    precise float productValue719 = sumValue536 * intermediateValue568;
                                                    precise float productValue720 = sumValue537 * intermediateValue568;
                                                    precise float sumValue528 = intermediateValue545 + productValue718;
                                                    precise float sumValue529 = intermediateValue546 + productValue719;
                                                    precise float sumValue530 = intermediateValue547 + productValue720;
                                                    branchMergedValue47 = sumValue529;
                                                    branchMergedValue79 = sumValue528;
                                                    branchMergedValue80 = sumValue530;
                                                }
                                                else
                                                {
                                                    branchMergedValue47 = 0.33399999141693115234375f;
                                                    branchMergedValue79 = 0.33399999141693115234375f;
                                                    branchMergedValue80 = 0.33399999141693115234375f;
                                                }
                                                intermediateValue563 = branchMergedValue79;
                                                intermediateValue564 = branchMergedValue47;
                                                intermediateValue565 = branchMergedValue80;
                                            }
                                            else
                                            {
                                                precise float sumValue520 = 1.0f - intermediateValue548;
                                                intermediateValue563 = sumValue520;
                                                intermediateValue564 = sumValue520;
                                                intermediateValue565 = sumValue520;
                                            }
                                            precise float productValue711 = intermediateValue448 * intermediateValue563;
                                            precise float productValue712 = intermediateValue449 * intermediateValue564;
                                            precise float productValue713 = intermediateValue450 * intermediateValue565;
                                            float intermediateValue476;
                                            float intermediateValue477;
                                            float intermediateValue478;
                                            bool intermediateValue569;
                                            if (!(dot(float3(productValue711, productValue712, productValue713), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                            {
                                                intermediateValue569 = false;
                                                intermediateValue476 = productValue711;
                                                intermediateValue477 = productValue712;
                                                intermediateValue478 = productValue713;
                                            }
                                            else
                                            {
                                                intermediateValue569 = true;
                                                intermediateValue476 = 0.0f;
                                                intermediateValue477 = 0.0f;
                                                intermediateValue478 = 0.0f;
                                            }
                                            float branchMergedValue88;
                                            float branchMergedValue103;
                                            float branchMergedValue104;
                                            if (intermediateValue569)
                                            {
                                                intermediateValue380.CommitNonOpaqueTriangleHit();
                                                branchMergedValue88 = intermediateValue478;
                                                branchMergedValue103 = intermediateValue477;
                                                branchMergedValue104 = intermediateValue476;
                                            }
                                            else
                                            {
                                                branchMergedValue88 = intermediateValue478;
                                                branchMergedValue103 = intermediateValue477;
                                                branchMergedValue104 = intermediateValue476;
                                            }
                                            branchMergedValue7 = branchMergedValue88;
                                            branchMergedValue23 = branchMergedValue103;
                                            branchMergedValue24 = branchMergedValue104;
                                        }
                                        else
                                        {
                                            branchMergedValue7 = intermediateValue450;
                                            branchMergedValue23 = intermediateValue449;
                                            branchMergedValue24 = intermediateValue448;
                                        }
                                        intermediateValue428 = branchMergedValue7;
                                        intermediateValue426 = branchMergedValue23;
                                        intermediateValue424 = branchMergedValue24;
                                        bool intermediateValue479 = intermediateValue380.Proceed();
                                        if (intermediateValue479)
                                        {
                                            intermediateValue448 = intermediateValue424;
                                            intermediateValue449 = intermediateValue426;
                                            intermediateValue450 = intermediateValue428;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue423 = intermediateValue424;
                                    intermediateValue425 = intermediateValue426;
                                    intermediateValue427 = intermediateValue428;
                                }
                                else
                                {
                                    intermediateValue423 = comparisonValue68;
                                    intermediateValue425 = comparisonValue69;
                                    intermediateValue427 = comparisonValue70;
                                }
                                uint intermediateValue429 = intermediateValue380.CommittedStatus();
                                bool comparisonValue104 = intermediateValue429 == 1u;
                                branchMergedValue114 = comparisonValue104 ? 0.0f : intermediateValue427;
                                branchMergedValue122 = comparisonValue104 ? 0.0f : intermediateValue425;
                                branchMergedValue123 = comparisonValue104 ? 0.0f : intermediateValue423;
                            }
                            else
                            {
                                branchMergedValue114 = comparisonValue70;
                                branchMergedValue122 = comparisonValue69;
                                branchMergedValue123 = comparisonValue68;
                            }
                            branchMergedValue41 = branchMergedValue114;
                            branchMergedValue67 = branchMergedValue122;
                            branchMergedValue68 = branchMergedValue123;
                        }
                        else
                        {
                            RayDesc _23ident = {float3(reinterpretedBits43, reinterpretedBits44, reinterpretedBits45), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                            intermediateValue332.TraceRayInline(SceneBVH, 512u, 22u, _23ident);
                            bool intermediateValue333 = intermediateValue332.Proceed();
                            float intermediateValue355;
                            float intermediateValue357;
                            float intermediateValue359;
                            if (intermediateValue333)
                            {
                                float intermediateValue356;
                                float intermediateValue358;
                                float intermediateValue360;
                                float intermediateValue382 = 1.0f;
                                float intermediateValue383 = 1.0f;
                                float intermediateValue384 = 1.0f;
                                bool comparisonValue90;
                                for (;;)
                                {
                                    uint intermediateValue385 = intermediateValue332.CandidateType();
                                    comparisonValue90 = intermediateValue385 == 0u;
                                    float branchMergedValue5;
                                    float branchMergedValue19;
                                    float branchMergedValue20;
                                    if (comparisonValue90)
                                    {
                                        float2 intermediateValue430 = intermediateValue332.CandidateTriangleBarycentrics();
                                        float2 intermediateValue431 = intermediateValue332.CandidateTriangleBarycentrics();
                                        float intermediateValue432 = intermediateValue332.CandidateTriangleRayT();
                                        uint intermediateValue433 = intermediateValue332.CandidatePrimitiveIndex();
                                        uint intermediateValue434 = intermediateValue332.CandidateInstanceID();
                                        uint intermediateValue435 = intermediateValue332.CandidateInstanceIndex();
                                        uint productValue488 = (intermediateValue435 * 76u) + 58u;
                                        uint productValue489 = (intermediateValue435 * 76u) + 61u;
                                        precise float sumValue313 = 1.0f - intermediateValue430.x;
                                        precise float sumValue314 = sumValue313 - intermediateValue431.y;
                                        uint bitwiseValue201 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue435 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue433 >> 1u);
                                        uint productValue490 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue435 * 76u) + 54u) * 2 + 0)) + 0u;
                                        bool comparisonValue105 = (intermediateValue433 & 1u) == 0u;
                                        uint comparisonValue106 = comparisonValue105 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue490), bitwiseValue201 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue490), bitwiseValue201 * 16 + 0).x;
                                        uint comparisonValue107 = comparisonValue105 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue490), bitwiseValue201 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue490), bitwiseValue201 * 16 + 0).w;
                                        uint comparisonValue108 = comparisonValue105 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue490), bitwiseValue201 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue490), bitwiseValue201 * 16 + 0).z;
                                        bool productValue491 = rdByteLoad_objectInstances_uint16_t(0u, productValue489 * 2 + 0) < 0u;
                                        float intermediateValue480;
                                        float intermediateValue481;
                                        if (productValue491)
                                        {
                                            uint bitwiseValue223 = comparisonValue108 >> 15u;
                                            precise float bitwiseValue224 = float(bitwiseValue223 & 1u) * 2.0f;
                                            precise float sumValue337 = bitwiseValue224 + (-1.0f);
                                            precise float bitwiseValue225 = float(comparisonValue108 >> 31u) * 2.0f;
                                            precise float sumValue338 = bitwiseValue225 + (-1.0f);
                                            precise float bitwiseValue226 = float((comparisonValue108 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue227 = float(bitwiseValue223 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue516 = sumValue337 * 3.0517578125e-05f;
                                            precise float productValue517 = sumValue338 * 3.0517578125e-05f;
                                            precise float sumValue339 = bitwiseValue226 + productValue516;
                                            precise float sumValue340 = bitwiseValue227 + productValue517;
                                            intermediateValue480 = sumValue339;
                                            intermediateValue481 = sumValue340;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue228 = float(comparisonValue108 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue229 = float(comparisonValue108 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue518 = bitwiseValue228 * 16384.0f;
                                            precise float sumValue341 = productValue518 + 0.5f;
                                            precise float productValue519 = bitwiseValue229 * 16384.0f;
                                            precise float sumValue342 = productValue519 + 0.5f;
                                            precise float productValue520 = floor(sumValue341) * 6.103515625e-05f;
                                            precise float productValue521 = floor(sumValue342) * 6.103515625e-05f;
                                            intermediateValue480 = productValue520;
                                            intermediateValue481 = productValue521;
                                        }
                                        precise float productValue556 = sumValue314 * intermediateValue480;
                                        precise float productValue557 = sumValue314 * intermediateValue481;
                                        precise float sumValue367 = productValue556 + 0.0f;
                                        precise float sumValue368 = productValue557 + 0.0f;
                                        float intermediateValue498;
                                        float intermediateValue499;
                                        if (productValue491)
                                        {
                                            uint bitwiseValue281 = comparisonValue107 >> 15u;
                                            precise float bitwiseValue282 = float(bitwiseValue281 & 1u) * 2.0f;
                                            precise float sumValue403 = bitwiseValue282 + (-1.0f);
                                            precise float bitwiseValue283 = float(comparisonValue107 >> 31u) * 2.0f;
                                            precise float sumValue404 = bitwiseValue283 + (-1.0f);
                                            precise float bitwiseValue284 = float((comparisonValue107 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue285 = float(bitwiseValue281 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue592 = sumValue403 * 3.0517578125e-05f;
                                            precise float productValue593 = sumValue404 * 3.0517578125e-05f;
                                            precise float sumValue405 = bitwiseValue284 + productValue592;
                                            precise float sumValue406 = bitwiseValue285 + productValue593;
                                            intermediateValue498 = sumValue405;
                                            intermediateValue499 = sumValue406;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue286 = float(comparisonValue107 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue287 = float(comparisonValue107 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue594 = bitwiseValue286 * 16384.0f;
                                            precise float sumValue407 = productValue594 + 0.5f;
                                            precise float productValue595 = bitwiseValue287 * 16384.0f;
                                            precise float sumValue408 = productValue595 + 0.5f;
                                            precise float productValue596 = floor(sumValue407) * 6.103515625e-05f;
                                            precise float productValue597 = floor(sumValue408) * 6.103515625e-05f;
                                            intermediateValue498 = productValue596;
                                            intermediateValue499 = productValue597;
                                        }
                                        precise float productValue608 = intermediateValue430.x * intermediateValue498;
                                        precise float productValue609 = intermediateValue430.x * intermediateValue499;
                                        precise float sumValue419 = sumValue367 + productValue608;
                                        precise float sumValue420 = sumValue368 + productValue609;
                                        float intermediateValue510;
                                        float intermediateValue511;
                                        if (productValue491)
                                        {
                                            uint bitwiseValue323 = comparisonValue106 >> 15u;
                                            precise float bitwiseValue324 = float(bitwiseValue323 & 1u) * 2.0f;
                                            precise float sumValue451 = bitwiseValue324 + (-1.0f);
                                            precise float bitwiseValue325 = float(comparisonValue106 >> 31u) * 2.0f;
                                            precise float sumValue452 = bitwiseValue325 + (-1.0f);
                                            precise float bitwiseValue326 = float((comparisonValue106 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue327 = float(bitwiseValue323 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue640 = sumValue451 * 3.0517578125e-05f;
                                            precise float productValue641 = sumValue452 * 3.0517578125e-05f;
                                            precise float sumValue453 = bitwiseValue326 + productValue640;
                                            precise float sumValue454 = bitwiseValue327 + productValue641;
                                            intermediateValue510 = sumValue453;
                                            intermediateValue511 = sumValue454;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue328 = float(comparisonValue106 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue329 = float(comparisonValue106 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue642 = bitwiseValue328 * 16384.0f;
                                            precise float sumValue455 = productValue642 + 0.5f;
                                            precise float productValue643 = bitwiseValue329 * 16384.0f;
                                            precise float sumValue456 = productValue643 + 0.5f;
                                            precise float productValue644 = floor(sumValue455) * 6.103515625e-05f;
                                            precise float productValue645 = floor(sumValue456) * 6.103515625e-05f;
                                            intermediateValue510 = productValue644;
                                            intermediateValue511 = productValue645;
                                        }
                                        precise float productValue659 = intermediateValue431.y * intermediateValue510;
                                        precise float productValue660 = intermediateValue431.y * intermediateValue511;
                                        precise float sumValue470 = sumValue419 + productValue659;
                                        precise float sumValue471 = sumValue420 + productValue660;
                                        precise float productValue661 = intermediateValue432 * 0.083333335816860198974609375f;
                                        precise float sumValue472 = productValue661 + (-0.25f);
                                        float intermediateValue524;
                                        float intermediateValue525;
                                        float intermediateValue526;
                                        float intermediateValue527;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue488 * 2 + 0) == 65535u)
                                        {
                                            intermediateValue524 = 1.0f;
                                            intermediateValue525 = 1.0f;
                                            intermediateValue526 = 1.0f;
                                            intermediateValue527 = 1.0f;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits59;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue488 * 2 + 0) > 4095u)
                                            {
                                                reinterpretedBits59 = asuint(viewCbConstants[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits59 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue488 * 2 + 0));
                                            }
                                            float4 sampledTextureValue23 = textures[NonUniformResourceIndex(reinterpretedBits59 + 0u)].SampleLevel(defaultSampler, float2(sumValue470, sumValue471), min(sumValue472, 2.0f));
                                            intermediateValue524 = sampledTextureValue23.x;
                                            intermediateValue525 = sampledTextureValue23.y;
                                            intermediateValue526 = sampledTextureValue23.z;
                                            intermediateValue527 = sampledTextureValue23.w;
                                        }
                                        float intermediateValue549;
                                        float intermediateValue550;
                                        float intermediateValue551;
                                        if (intermediateValue434 == 2u)
                                        {
                                            float branchMergedValue45;
                                            float branchMergedValue75;
                                            float branchMergedValue76;
                                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue489 * 2 + 0) & 128u) == 0u)
                                            {
                                                float intermediateValue558;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue489 * 2 + 0) & 2048u) == 0u)
                                                {
                                                    intermediateValue558 = intermediateValue527;
                                                }
                                                else
                                                {
                                                    precise float productValue707 = intermediateValue527 * 2.0f;
                                                    precise float sumValue524 = productValue707 + (-1.0f);
                                                    intermediateValue558 = clamp(sumValue524, 0.0f, 1.0f);
                                                }
                                                precise float sumValue521 = 0.0f - intermediateValue524;
                                                precise float sumValue522 = 0.0f - intermediateValue525;
                                                precise float sumValue523 = 0.0f - intermediateValue526;
                                                precise float productValue704 = sumValue521 * intermediateValue558;
                                                precise float productValue705 = sumValue522 * intermediateValue558;
                                                precise float productValue706 = sumValue523 * intermediateValue558;
                                                precise float sumValue504 = intermediateValue524 + productValue704;
                                                precise float sumValue505 = intermediateValue525 + productValue705;
                                                precise float sumValue506 = intermediateValue526 + productValue706;
                                                branchMergedValue45 = sumValue506;
                                                branchMergedValue75 = sumValue505;
                                                branchMergedValue76 = sumValue504;
                                            }
                                            else
                                            {
                                                branchMergedValue45 = 0.33399999141693115234375f;
                                                branchMergedValue75 = 0.33399999141693115234375f;
                                                branchMergedValue76 = 0.33399999141693115234375f;
                                            }
                                            intermediateValue549 = branchMergedValue76;
                                            intermediateValue550 = branchMergedValue75;
                                            intermediateValue551 = branchMergedValue45;
                                        }
                                        else
                                        {
                                            precise float sumValue494 = 1.0f - intermediateValue527;
                                            intermediateValue549 = sumValue494;
                                            intermediateValue550 = sumValue494;
                                            intermediateValue551 = sumValue494;
                                        }
                                        precise float productValue689 = intermediateValue382 * intermediateValue549;
                                        precise float productValue690 = intermediateValue383 * intermediateValue550;
                                        precise float productValue691 = intermediateValue384 * intermediateValue551;
                                        float intermediateValue436;
                                        float intermediateValue437;
                                        float intermediateValue438;
                                        bool intermediateValue559;
                                        if (!(dot(float3(productValue689, productValue690, productValue691), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                        {
                                            intermediateValue559 = false;
                                            intermediateValue436 = productValue689;
                                            intermediateValue437 = productValue690;
                                            intermediateValue438 = productValue691;
                                        }
                                        else
                                        {
                                            intermediateValue559 = true;
                                            intermediateValue436 = 0.0f;
                                            intermediateValue437 = 0.0f;
                                            intermediateValue438 = 0.0f;
                                        }
                                        float branchMergedValue86;
                                        float branchMergedValue99;
                                        float branchMergedValue100;
                                        if (intermediateValue559)
                                        {
                                            intermediateValue332.CommitNonOpaqueTriangleHit();
                                            branchMergedValue86 = intermediateValue437;
                                            branchMergedValue99 = intermediateValue436;
                                            branchMergedValue100 = intermediateValue438;
                                        }
                                        else
                                        {
                                            branchMergedValue86 = intermediateValue437;
                                            branchMergedValue99 = intermediateValue436;
                                            branchMergedValue100 = intermediateValue438;
                                        }
                                        branchMergedValue5 = branchMergedValue86;
                                        branchMergedValue19 = branchMergedValue99;
                                        branchMergedValue20 = branchMergedValue100;
                                    }
                                    else
                                    {
                                        branchMergedValue5 = intermediateValue383;
                                        branchMergedValue19 = intermediateValue382;
                                        branchMergedValue20 = intermediateValue384;
                                    }
                                    intermediateValue358 = branchMergedValue5;
                                    intermediateValue356 = branchMergedValue19;
                                    intermediateValue360 = branchMergedValue20;
                                    bool intermediateValue439 = intermediateValue332.Proceed();
                                    if (intermediateValue439)
                                    {
                                        intermediateValue382 = intermediateValue356;
                                        intermediateValue383 = intermediateValue358;
                                        intermediateValue384 = intermediateValue360;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue355 = intermediateValue356;
                                intermediateValue357 = intermediateValue358;
                                intermediateValue359 = intermediateValue360;
                            }
                            else
                            {
                                intermediateValue355 = 1.0f;
                                intermediateValue357 = 1.0f;
                                intermediateValue359 = 1.0f;
                            }
                            uint intermediateValue361 = intermediateValue332.CommittedStatus();
                            bool comparisonValue86 = intermediateValue361 == 1u;
                            branchMergedValue41 = comparisonValue86 ? 0.0f : intermediateValue359;
                            branchMergedValue67 = comparisonValue86 ? 0.0f : intermediateValue357;
                            branchMergedValue68 = comparisonValue86 ? 0.0f : intermediateValue355;
                        }
                        intermediateValue291 = branchMergedValue68;
                        intermediateValue292 = branchMergedValue67;
                        intermediateValue293 = branchMergedValue41;
                    }
                    float branchMergedValue108;
                    float branchMergedValue118;
                    float branchMergedValue119;
                    if (dot(float3(intermediateValue291, intermediateValue292, intermediateValue293), 1.0f.xxx) > 0.0f)
                    {
                        float sumValue236 = (-0.0f) - sumValue26;
                        float sumValue237 = (-0.0f) - sumValue28;
                        float sumValue238 = (-0.0f) - sumValue30;
                        float intermediateValue300 = max(max(productValue351, 0.25f), 0.00999999977648258209228515625f);
                        float sumValue239 = viewCbConstants[52u].x - sumValue26;
                        float sumValue240 = viewCbConstants[52u].y - sumValue28;
                        float sumValue241 = viewCbConstants[52u].z - sumValue30;
                        float inverseLengthValue8 = rsqrt(dot(float3(sumValue239, sumValue240, sumValue241), float3(sumValue239, sumValue240, sumValue241)));
                        float productValue387 = inverseLengthValue8 * sumValue239;
                        float productValue388 = inverseLengthValue8 * sumValue240;
                        float productValue389 = inverseLengthValue8 * sumValue241;
                        float clampedValue9 = clamp(dot(float3(comparisonValue62, comparisonValue63, comparisonValue64), float3(viewCbConstants[52u].xyz)), 0.0f, 1.0f);
                        float clampedValue10 = clamp(dot(float3(comparisonValue62, comparisonValue63, comparisonValue64), float3(sumValue236, sumValue237, sumValue238)), 0.0f, 1.0f);
                        float clampedValue11 = clamp(dot(float3(comparisonValue62, comparisonValue63, comparisonValue64), float3(productValue387, productValue388, productValue389)), 0.0f, 1.0f);
                        float clampedValue12 = clamp(dot(float3(sumValue236, sumValue237, sumValue238), float3(productValue387, productValue388, productValue389)), 0.0f, 1.0f);
                        float productValue390 = intermediateValue300 * intermediateValue300;
                        float productValue391 = productValue390 * productValue390;
                        float productValue392 = (((clampedValue11 * productValue391) - clampedValue11) * clampedValue11) + 1.0f;
                        float productValue393 = productValue390 * 0.5f;
                        float sumValue242 = 1.0f - productValue393;
                        float clampedValue13 = clamp(dot(float3(productValue355, productValue356, productValue357), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f, 0.0f, 1.0f);
                        float clampedValue14 = exp2(log2(clamp(1.0f - clampedValue12, 0.0f, 1.0f)) * 5.0f);
                        float productValue394 = (clampedValue14 * (clampedValue13 - productValue355)) + productValue355;
                        float productValue395 = (clampedValue14 * (clampedValue13 - productValue356)) + productValue356;
                        float productValue396 = (clampedValue14 * (clampedValue13 - productValue357)) + productValue357;
                        float productValue397 = ((clampedValue12 * clampedValue12) * (intermediateValue300 * 2.0f)) + (-0.5f);
                        float clampedValue15 = (((exp2(log2(clamp(1.0f - clampedValue10, 0.0f, 1.0f)) * 5.0f) * productValue397) + 1.0f) * 0.3183098733425140380859375f) * ((exp2(log2(clamp(1.0f - clampedValue9, 0.0f, 1.0f)) * 5.0f) * productValue397) + 1.0f);
                        float quotientValue5 = ((productValue391 / ((productValue392 * productValue392) + 1.0000000133514319600180897396058e-10f)) * 0.3183098733425140380859375f) * (0.25f / ((((clampedValue10 * sumValue242) + productValue393) * ((clampedValue9 * sumValue242) + productValue393)) + 1.0000000133514319600180897396058e-10f));
                        branchMergedValue108 = ((((intermediateValue293 * comparisonValue38) * viewCbConstants[50u].z) * clampedValue9) * ((((1.0f - productValue396) * productValue360) * clampedValue15) + (productValue396 * quotientValue5))) + intermediateValue142;
                        branchMergedValue118 = ((((intermediateValue291 * comparisonValue36) * viewCbConstants[50u].x) * clampedValue9) * ((((1.0f - productValue394) * productValue358) * clampedValue15) + (productValue394 * quotientValue5))) + intermediateValue138;
                        branchMergedValue119 = ((((intermediateValue292 * comparisonValue37) * viewCbConstants[50u].y) * clampedValue9) * ((((1.0f - productValue395) * productValue359) * clampedValue15) + (productValue395 * quotientValue5))) + intermediateValue140;
                    }
                    else
                    {
                        branchMergedValue108 = intermediateValue142;
                        branchMergedValue118 = intermediateValue138;
                        branchMergedValue119 = intermediateValue140;
                    }
                    branchMergedValue34 = branchMergedValue108;
                    branchMergedValue53 = branchMergedValue118;
                    branchMergedValue54 = branchMergedValue119;
                }
                intermediateValue137 = branchMergedValue53;
                intermediateValue139 = branchMergedValue54;
                intermediateValue141 = branchMergedValue34;
            }
            else
            {
                uint4 reinterpretedBits17 = asuint(viewCbConstants[75u]);
                uint intermediateValue92 = reinterpretedBits17.w;
                float sumValue50 = (-0.0f) - sumValue26;
                float sumValue51 = (-0.0f) - sumValue28;
                float sumValue52 = (-0.0f) - sumValue30;
                float productValue85 = viewCbConstants[60u].w * viewCbConstants[60u].w;
                float clampedValue1 = (clamp(viewCbConstants[90u].w, 0.0f, 1.0f) * 15.9154567718505859375f) * ((1.0f - productValue85) / exp2(log2(abs((productValue85 + 1.0f) - ((viewCbConstants[60u].w * 2.0f) * min(max((-0.0f) - dot(float3(viewCbConstants[52u].xyz), float3(sumValue50, sumValue51, sumValue52)), -1.0f), 1.0f)))) * 1.5f));
                float intermediateValue152;
                float intermediateValue153;
                float intermediateValue154;
                if (intermediateValue92 == 1u)
                {
                    intermediateValue152 = viewCbConstants[58u].x;
                    intermediateValue153 = viewCbConstants[58u].y;
                    intermediateValue154 = viewCbConstants[58u].z;
                }
                else
                {
                    float branchMergedValue35;
                    float branchMergedValue55;
                    float branchMergedValue56;
                    if (intermediateValue92 == 2u)
                    {
                        uint4 intermediateValue155 = asuint(viewCbConstants[74u]);
                        uint intermediateValue156 = intermediateValue155.z;
                        uint reinterpretedBits25;
                        if (intermediateValue156 > 4095u)
                        {
                            reinterpretedBits25 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits25 = intermediateValue156;
                        }
                        float intermediateValue169 = abs(sumValue26);
                        float intermediateValue170 = abs(sumValue28);
                        float intermediateValue171 = abs(sumValue30);
                        float intermediateValue207;
                        float comparisonValue56;
                        float intermediateValue208;
                        if ((intermediateValue169 >= intermediateValue170) && (intermediateValue169 >= intermediateValue171))
                        {
                            intermediateValue207 = intermediateValue169;
                            comparisonValue56 = (sumValue26 < 0.0f) ? sumValue52 : sumValue30;
                            intermediateValue208 = sumValue51;
                        }
                        else
                        {
                            float branchMergedValue37;
                            float branchMergedValue59;
                            float branchMergedValue60;
                            if (!(intermediateValue170 >= intermediateValue171))
                            {
                                branchMergedValue37 = sumValue51;
                                branchMergedValue59 = (sumValue30 < 0.0f) ? sumValue26 : sumValue50;
                                branchMergedValue60 = intermediateValue171;
                            }
                            else
                            {
                                branchMergedValue37 = (sumValue28 < 0.0f) ? sumValue52 : sumValue30;
                                branchMergedValue59 = sumValue50;
                                branchMergedValue60 = intermediateValue170;
                            }
                            intermediateValue207 = branchMergedValue60;
                            comparisonValue56 = branchMergedValue59;
                            intermediateValue208 = branchMergedValue37;
                        }
                        precise float quotientValue3 = 0.5f / intermediateValue207;
                        float4 sampledTextureValue5 = textures[NonUniformResourceIndex(reinterpretedBits25 + 0u)].SampleLevel(linearSampler, float2(frac(mad(comparisonValue56, quotientValue3, 0.5f) * viewCbConstants[74u].x), frac(mad(intermediateValue208, quotientValue3, 0.5f) * viewCbConstants[74u].y)), 0.0f);
                        branchMergedValue35 = (viewCbConstants[58u].y * sampledTextureValue5.y) * viewCbConstants[97u].w;
                        branchMergedValue55 = (viewCbConstants[58u].x * sampledTextureValue5.x) * viewCbConstants[97u].w;
                        branchMergedValue56 = (viewCbConstants[58u].z * sampledTextureValue5.z) * viewCbConstants[97u].w;
                    }
                    else
                    {
                        float branchMergedValue106;
                        float branchMergedValue111;
                        float branchMergedValue112;
                        if (intermediateValue92 == 4u)
                        {
                            float intermediateValue172 = (dot(float3(sumValue26, sumValue28, sumValue30), float3(viewCbConstants[52u].xyz)) * 0.5f) + 0.5f;
                            branchMergedValue106 = ((viewCbConstants[75u].y - viewCbConstants[76u].y) * intermediateValue172) + viewCbConstants[76u].y;
                            branchMergedValue111 = ((viewCbConstants[75u].x - viewCbConstants[76u].x) * intermediateValue172) + viewCbConstants[76u].x;
                            branchMergedValue112 = ((viewCbConstants[75u].z - viewCbConstants[76u].z) * intermediateValue172) + viewCbConstants[76u].z;
                        }
                        else
                        {
                            float comparisonValue54;
                            if (abs(sumValue28) < 1.0f)
                            {
                                float quotientValue1 = atan(sumValue30 / sumValue26);
                                bool intermediateValue184 = sumValue26 < 0.0f;
                                bool comparisonValue52 = sumValue26 == 0.0f;
                                bool comparisonValue53 = sumValue30 >= 0.0f;
                                bool intermediateValue185 = sumValue30 < 0.0f;
                                comparisonValue54 = (comparisonValue52 && comparisonValue53) ? 1.57079637050628662109375f : ((comparisonValue52 && intermediateValue185) ? (-1.57079637050628662109375f) : ((intermediateValue184 && intermediateValue185) ? (quotientValue1 + (-3.1415927410125732421875f)) : ((intermediateValue184 && comparisonValue53) ? (quotientValue1 + 3.1415927410125732421875f) : quotientValue1)));
                            }
                            else
                            {
                                comparisonValue54 = 0.0f;
                            }
                            float multiplyAddValue2 = mad(abs((frac((comparisonValue54 - viewCbConstants[50u].w) * 0.15915493667125701904296875f) * 2.0f) + (-1.0f)), 0.984375f, 0.0078125f);
                            float multiplyAddValue3 = mad(0.5f - (asin(sumValue28) * 0.3183098733425140380859375f), 0.96875f, 0.015625f);
                            float productValue204 = viewCbConstants[51u].w * 7.0f;
                            float intermediateValue186 = frac(productValue204);
                            uint intermediateValue187 = uint(int(floor(productValue204)));
                            float productValue205 = float(int(intermediateValue187 + 1u)) * 0.125f;
                            float intermediateValue188 = frac(abs(productValue205));
                            float4 sampledTextureValue2 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue2, multiplyAddValue3, float(int(intermediateValue187))), 0.0f);
                            float intermediateValue189 = sampledTextureValue2.x;
                            float intermediateValue190 = sampledTextureValue2.y;
                            float intermediateValue191 = sampledTextureValue2.z;
                            float productValue206 = intermediateValue189 * intermediateValue189;
                            float productValue207 = intermediateValue190 * intermediateValue190;
                            float productValue208 = intermediateValue191 * intermediateValue191;
                            float4 sampledTextureValue3 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue2, multiplyAddValue3, float(int(uint(int(((productValue205 >= ((-0.0f) - productValue205)) ? intermediateValue188 : ((-0.0f) - intermediateValue188)) * 8.0f))))), 0.0f);
                            float intermediateValue192 = sampledTextureValue3.x;
                            float intermediateValue193 = sampledTextureValue3.y;
                            float intermediateValue194 = sampledTextureValue3.z;
                            float dotProductValue5 = exp2(log2(max(dot(float3(sumValue26, sumValue28, sumValue30), float3(viewCbConstants[52u].xyz)), 0.0f)) * 7.0f);
                            float productValue209 = dotProductValue5 * 0.0500000007450580596923828125f;
                            float productValue210 = ((((intermediateValue192 * intermediateValue192) - productValue206) * intermediateValue186) + productValue206) + (productValue209 * viewCbConstants[50u].x);
                            float productValue211 = ((((intermediateValue193 * intermediateValue193) - productValue207) * intermediateValue186) + productValue207) + (productValue209 * viewCbConstants[50u].y);
                            float productValue212 = ((((intermediateValue194 * intermediateValue194) - productValue208) * intermediateValue186) + productValue208) + (productValue209 * viewCbConstants[50u].z);
                            float productValue213 = (dotProductValue5 * 0.64999997615814208984375f) + 0.3499999940395355224609375f;
                            branchMergedValue106 = ((((viewCbConstants[58u].y * productValue213) - productValue211) * viewCbConstants[58u].w) + productValue211) * viewCbConstants[97u].w;
                            branchMergedValue111 = ((((viewCbConstants[58u].x * productValue213) - productValue210) * viewCbConstants[58u].w) + productValue210) * viewCbConstants[97u].w;
                            branchMergedValue112 = ((((viewCbConstants[58u].z * productValue213) - productValue212) * viewCbConstants[58u].w) + productValue212) * viewCbConstants[97u].w;
                        }
                        branchMergedValue35 = branchMergedValue106;
                        branchMergedValue55 = branchMergedValue111;
                        branchMergedValue56 = branchMergedValue112;
                    }
                    intermediateValue152 = branchMergedValue55;
                    intermediateValue153 = branchMergedValue35;
                    intermediateValue154 = branchMergedValue56;
                }
                intermediateValue137 = (intermediateValue152 + (((viewCbConstants[50u].x * clampedValue1) * viewCbConstants[61u].x) * exp2(viewCbConstants[62u].x * (-72.1347503662109375f)))) * comparisonValue36;
                intermediateValue139 = (intermediateValue153 + (((viewCbConstants[50u].y * clampedValue1) * viewCbConstants[61u].y) * exp2(viewCbConstants[62u].y * (-72.1347503662109375f)))) * comparisonValue37;
                intermediateValue141 = (intermediateValue154 + (((viewCbConstants[50u].z * clampedValue1) * viewCbConstants[61u].z) * exp2(viewCbConstants[62u].z * (-72.1347503662109375f)))) * comparisonValue38;
            }
            branchMergedValue12 = 0.0f;
            branchMergedValue26 = ((viewCbConstants[59u].z * comparisonValue38) + intermediateValue141) * reinterpretedBits2;
            branchMergedValue27 = ((viewCbConstants[59u].y * comparisonValue37) + intermediateValue139) * reinterpretedBits2;
            branchMergedValue28 = ((viewCbConstants[59u].x * comparisonValue36) + intermediateValue137) * reinterpretedBits2;
            branchMergedValue29 = 0.0f;
            branchMergedValue30 = 0.0f;
            branchMergedValue31 = 0.0f;
        }
        intermediateValue8 = branchMergedValue31;
        intermediateValue9 = branchMergedValue30;
        intermediateValue10 = branchMergedValue29;
        intermediateValue12 = branchMergedValue28;
        intermediateValue13 = branchMergedValue27;
        intermediateValue14 = branchMergedValue26;
        intermediateValue15 = branchMergedValue12;
    }
    uint reinterpretedBits3 = asuint(intermediateValue12) & 2147483647u;
    uint reinterpretedBits4 = asuint(intermediateValue13) & 2147483647u;
    uint reinterpretedBits5 = asuint(intermediateValue14) & 2147483647u;
    uint reinterpretedBits6 = asuint(intermediateValue15) & 2147483647u;
    bool comparisonValue1 = ((((reinterpretedBits3 > 2139095040u) || (reinterpretedBits4 > 2139095040u)) || (reinterpretedBits5 > 2139095040u)) || (reinterpretedBits6 > 2139095040u)) || ((((reinterpretedBits3 == 2139095040u) || (reinterpretedBits4 == 2139095040u)) || (reinterpretedBits5 == 2139095040u)) || (reinterpretedBits6 == 2139095040u));
    if (reinterpretedBits1)
    {
        if (comparisonValue1)
        {
            if (outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)].xxxx.w == 0.0f)
            {
                outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 0.0f, 1.0f, 1.0f).x;
                outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
            }
        }
        uint reinterpretedBits11 = asuint(intermediateValue8) & 2147483647u;
        uint reinterpretedBits12 = asuint(intermediateValue9) & 2147483647u;
        uint reinterpretedBits13 = asuint(intermediateValue10) & 2147483647u;
        bool comparisonValue20 = (((reinterpretedBits11 > 2139095040u) || (reinterpretedBits12 > 2139095040u)) || (reinterpretedBits13 > 2139095040u)) || (((reinterpretedBits11 == 2139095040u) || (reinterpretedBits12 == 2139095040u)) || (reinterpretedBits13 == 2139095040u));
        if (comparisonValue20)
        {
            if (outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)].xxxx.w == 0.0f)
            {
                outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 0.0f, 1.0f, 1.0f).x;
                outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
            }
        }
        if (!comparisonValue1)
        {
            outputBufferIndirectDiffuse[uint2(bitwiseValue2, bitwiseValue3)] = float4(intermediateValue12, intermediateValue13, intermediateValue14, intermediateValue15);
        }
        if (!comparisonValue20)
        {
            outputBufferIndirectDiffuseChroma[uint2(bitwiseValue2, bitwiseValue3)] = float4(intermediateValue8, intermediateValue9, intermediateValue10, intermediateValue8);
        }
    }
    else
    {
        bool intermediateValue32;
        if (comparisonValue1)
        {
            bool branchMergedValue25;
            if (outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)].xxxx.w == 0.0f)
            {
                outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 0.0f, 1.0f, 1.0f).x;
                outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
                branchMergedValue25 = comparisonValue1;
            }
            else
            {
                branchMergedValue25 = comparisonValue1;
            }
            intermediateValue32 = branchMergedValue25;
        }
        else
        {
            intermediateValue32 = false;
        }
        if (!intermediateValue32)
        {
            outputBufferIndirectDiffuse[uint2(bitwiseValue2, bitwiseValue3)] = float4(intermediateValue12, intermediateValue13, intermediateValue14, intermediateValue15);
        }
    }
}

[numthreads(4, 8, 1)]
void main(ComputeStageInput stage_input)
{
    gl_WorkGroupID = stage_input.gl_WorkGroupID;
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    executeComputeStage();
}
