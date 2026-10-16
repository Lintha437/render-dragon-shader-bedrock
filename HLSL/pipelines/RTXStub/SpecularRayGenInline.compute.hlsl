// Native descriptor classes and spaces are preserved independently.
#include "../../include/ProjectConfig.h"
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

static uint3 gl_WorkGroupID;
static uint3 gl_LocalInvocationID;
struct ComputeStageInput
{
    uint3 gl_WorkGroupID : SV_GroupID;
    uint3 gl_LocalInvocationID : SV_GroupThreadID;
};

static RayQuery<RAY_FLAG_NONE> intermediateValue46;
static RayQuery<RAY_FLAG_NONE> intermediateValue158;
static RayQuery<RAY_FLAG_NONE> intermediateValue173;
static RayQuery<RAY_FLAG_NONE> intermediateValue175;
static RayQuery<RAY_FLAG_NONE> intermediateValue197;

uint UDiv(uint num, uint den)
{
    uint intermediateValue3;
    [flatten]
    if (den == 0u)
    {
        intermediateValue3 = 4294967295u;
    }
    else
    {
        intermediateValue3 = num / den;
    }
    return intermediateValue3;
}

uint UMod(uint num, uint den)
{
    uint intermediateValue4;
    [flatten]
    if (den == 0u)
    {
        intermediateValue4 = 4294967295u;
    }
    else
    {
        intermediateValue4 = num % den;
    }
    return intermediateValue4;
}

void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
    uint intermediateValue2 = reinterpretedBits.z;
    uint bitwiseValue = gl_WorkGroupID.y >> 4u;
    uint bitwiseValue1 = ((intermediateValue2 & 1023u) * (gl_WorkGroupID.y & 15u)) + gl_WorkGroupID.x;
    uint comparisonValue = (bitwiseValue == ((intermediateValue2 >> 14u) & 63u)) ? ((intermediateValue2 >> 10u) & 15u) : 16u;
    uint bitwiseValue2 = (UDiv(bitwiseValue1, comparisonValue) << 2u) + gl_LocalInvocationID.x;
    uint bitwiseValue3 = ((UMod(bitwiseValue1, comparisonValue) + (bitwiseValue << 4u)) << 3u) + gl_LocalInvocationID.y;
    float4 loadedBufferValue = inputBufferPrimaryPathLength.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
    float intermediateValue5 = loadedBufferValue.x;
    if (!(intermediateValue5 == 65504.0f))
    {
        float4 intermediateValue6 = inputBufferNormal.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float intermediateValue7 = intermediateValue6.x;
        float intermediateValue8 = intermediateValue6.y;
        precise float sumValue = 1.0f - abs(intermediateValue7);
        float intermediateValue9 = abs(intermediateValue8);
        precise float sumValue1 = sumValue - intermediateValue9;
        bool intermediateValue10 = sumValue1 < 0.0f;
        precise float sumValue2 = 1.0f - intermediateValue9;
        precise float comparisonValue1 = ((intermediateValue7 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue2;
        precise float comparisonValue2 = sumValue * ((intermediateValue8 >= 0.0f) ? 1.0f : (-1.0f));
        float comparisonValue3 = intermediateValue10 ? comparisonValue1 : intermediateValue7;
        float comparisonValue4 = intermediateValue10 ? comparisonValue2 : intermediateValue8;
        float inverseLengthValue = rsqrt(dot(float3(comparisonValue3, comparisonValue4, sumValue1), float3(comparisonValue3, comparisonValue4, sumValue1)));
        precise float productValue = inverseLengthValue * comparisonValue3;
        precise float productValue1 = inverseLengthValue * comparisonValue4;
        precise float productValue2 = sumValue1 * inverseLengthValue;
        float comparisonValue5 = ((productValue2 != 0.0f) || ((productValue != 0.0f) || (productValue1 != 0.0f))) ? productValue2 : 1.0f;
        float inverseLengthValue1 = rsqrt(dot(float3(productValue, productValue1, comparisonValue5), float3(productValue, productValue1, comparisonValue5)));
        precise float productValue3 = productValue * inverseLengthValue1;
        precise float productValue4 = productValue1 * inverseLengthValue1;
        precise float productValue5 = inverseLengthValue1 * comparisonValue5;
        float4 intermediateValue11 = outputBufferEmissiveAndLinearRoughness[uint2(bitwiseValue2, bitwiseValue3)].xxxx;
        float intermediateValue12 = intermediateValue11.x;
        float intermediateValue13 = intermediateValue11.w;
        float4 loadedBufferValue1 = inputGeometryNormal.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float intermediateValue14 = loadedBufferValue1.x;
        float intermediateValue15 = loadedBufferValue1.y;
        float sumValue3 = 1.0f - abs(intermediateValue14);
        float intermediateValue16 = abs(intermediateValue15);
        float sumValue4 = sumValue3 - intermediateValue16;
        bool intermediateValue17 = sumValue4 < 0.0f;
        float comparisonValue6 = intermediateValue17 ? ((1.0f - intermediateValue16) * ((intermediateValue14 >= 0.0f) ? 1.0f : (-1.0f))) : intermediateValue14;
        float comparisonValue7 = intermediateValue17 ? (((intermediateValue15 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue3) : intermediateValue15;
        float inverseLengthValue2 = rsqrt(dot(float3(comparisonValue6, comparisonValue7, sumValue4), float3(comparisonValue6, comparisonValue7, sumValue4)));
        float productValue6 = comparisonValue6 * inverseLengthValue2;
        float productValue7 = comparisonValue7 * inverseLengthValue2;
        float productValue8 = inverseLengthValue2 * sumValue4;
        float4 loadedBufferValue2 = inputPrimaryWorldPosition.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float intermediateValue18 = loadedBufferValue2.x;
        float intermediateValue19 = loadedBufferValue2.y;
        float intermediateValue20 = loadedBufferValue2.z;
        float4 loadedBufferValue3 = inputPrimaryViewDirection.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float intermediateValue21 = loadedBufferValue3.x;
        float intermediateValue22 = loadedBufferValue3.y;
        float intermediateValue23 = loadedBufferValue3.z;
        float reinterpretedBits1 = asfloat(rdByteLoad_inputIncidentLight_uint(0u, 0));
        uint reinterpretedBits2 = asuint(intermediateValue12) & 2147483647u;
        uint reinterpretedBits3 = asuint(intermediateValue11.y) & 2147483647u;
        uint reinterpretedBits4 = asuint(intermediateValue11.z) & 2147483647u;
        uint reinterpretedBits5 = asuint(intermediateValue13) & 2147483647u;
        bool comparisonValue8 = ((reinterpretedBits5 > 2139095040u) || ((reinterpretedBits4 > 2139095040u) || ((reinterpretedBits2 > 2139095040u) || (reinterpretedBits3 > 2139095040u)))) || ((reinterpretedBits5 == 2139095040u) || ((reinterpretedBits4 == 2139095040u) || ((reinterpretedBits2 == 2139095040u) || (reinterpretedBits3 == 2139095040u))));
        bool intermediateValue24;
        if (comparisonValue8)
        {
            bool branchMergedValue9;
            if (outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)].xxxx.w == 0.0f)
            {
                outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 1.0f, 0.0f, 1.0f).x;
                outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
                branchMergedValue9 = comparisonValue8;
            }
            else
            {
                branchMergedValue9 = comparisonValue8;
            }
            intermediateValue24 = branchMergedValue9;
        }
        else
        {
            intermediateValue24 = false;
        }
        if (!intermediateValue24)
        {
            outputBufferEmissiveAndLinearRoughness[uint2(bitwiseValue2, bitwiseValue3)] = float4(intermediateValue12, intermediateValue11.yz, intermediateValue13).x;
        }
        uint4 reinterpretedBits6 = asuint(viewCbConstants[84u]);
        uint intermediateValue25 = reinterpretedBits6.z;
        uint loadedBufferValue4 = uint(inputPrimaryViewDirection.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u)).w);
        uint productValue9 = uint(int(productValue6 * 256.0f));
        uint productValue10 = uint(int(productValue7 * 256.0f));
        uint productValue11 = uint(int(productValue8 * 256.0f));
        precise float productValue12 = intermediateValue13 * intermediateValue13;
        precise float sumValue5 = productValue12 + 9.9999997473787516355514526367188e-05f;
        precise float quotientValue = 0.5f / sumValue5;
        float4 loadedBufferValue5 = blueNoiseTexture.Load(int4(uint3(bitwiseValue2 & 255u, bitwiseValue3 & 255u, (intermediateValue25 >> 1u) & 127u), 0u));
        bool comparisonValue9 = (intermediateValue25 & 1u) == 0u;
        float intermediateValue29;
        float intermediateValue30;
        float intermediateValue31;
        float intermediateValue32;
        bool intermediateValue33;
        if (intermediateValue13 == 0.0f)
        {
            precise float intermediateValue26 = dot(float3(intermediateValue21, intermediateValue22, intermediateValue23), float3(productValue3, productValue4, productValue5)) * 2.0f;
            precise float productValue13 = productValue3 * intermediateValue26;
            precise float productValue14 = productValue4 * intermediateValue26;
            precise float productValue15 = productValue5 * intermediateValue26;
            precise float sumValue6 = intermediateValue21 - productValue13;
            precise float sumValue7 = intermediateValue22 - productValue14;
            precise float sumValue8 = intermediateValue23 - productValue15;
            intermediateValue29 = sumValue6;
            intermediateValue30 = sumValue7;
            intermediateValue31 = sumValue8;
            intermediateValue32 = 1.0f;
            intermediateValue33 = false;
        }
        else
        {
            float intermediateValue27 = max(0.001000000047497451305389404296875f, productValue12);
            precise float dotProductValue = dot(float3(0.0f, 0.0f, 1.0f), float3(productValue3, productValue4, productValue5));
            bool intermediateValue28 = dotProductValue < 0.0f;
            float comparisonValue10 = intermediateValue28 ? (-0.0f) : 0.0f;
            float comparisonValue11 = intermediateValue28 ? (-1.0f) : 1.0f;
            precise float productValue16 = productValue5 * comparisonValue10;
            precise float productValue17 = productValue4 * comparisonValue11;
            precise float sumValue9 = productValue16 - productValue17;
            precise float productValue18 = productValue3 * comparisonValue11;
            precise float productValue19 = productValue5 * 0.0f;
            precise float sumValue10 = productValue18 - productValue19;
            precise float productValue20 = productValue4 * 0.0f;
            precise float productValue21 = productValue3 * comparisonValue10;
            precise float sumValue11 = productValue20 - productValue21;
            precise float sumValue12 = abs(dotProductValue) + 1.0f;
            precise float productValue22 = sumValue12 * 0.5f;
            float nonlinearValue = sqrt(productValue22);
            precise float productValue23 = nonlinearValue * 2.0f;
            precise float quotientValue1 = sumValue9 / productValue23;
            precise float quotientValue2 = sumValue10 / productValue23;
            precise float quotientValue3 = sumValue11 / productValue23;
            float intermediateValue34;
            float intermediateValue35;
            float intermediateValue36;
            float intermediateValue37;
            if (intermediateValue28)
            {
                precise float sumValue16 = (-0.0f) - quotientValue2;
                precise float sumValue17 = (-0.0f) - quotientValue1;
                intermediateValue34 = nonlinearValue;
                intermediateValue35 = quotientValue3;
                intermediateValue36 = sumValue16;
                intermediateValue37 = sumValue17;
            }
            else
            {
                intermediateValue34 = quotientValue1;
                intermediateValue35 = quotientValue2;
                intermediateValue36 = quotientValue3;
                intermediateValue37 = nonlinearValue;
            }
            precise float sumValue18 = (-0.0f) - intermediateValue34;
            precise float sumValue19 = (-0.0f) - intermediateValue35;
            precise float sumValue20 = (-0.0f) - intermediateValue36;
            precise float productValue24 = intermediateValue23 * intermediateValue35;
            precise float productValue25 = intermediateValue22 * intermediateValue36;
            precise float sumValue21 = productValue24 - productValue25;
            precise float productValue26 = intermediateValue21 * intermediateValue36;
            precise float productValue27 = intermediateValue23 * intermediateValue34;
            precise float sumValue22 = productValue26 - productValue27;
            precise float productValue28 = intermediateValue22 * intermediateValue34;
            precise float productValue29 = intermediateValue21 * intermediateValue35;
            precise float sumValue23 = productValue28 - productValue29;
            precise float productValue30 = intermediateValue21 * intermediateValue37;
            precise float productValue31 = intermediateValue22 * intermediateValue37;
            precise float productValue32 = intermediateValue23 * intermediateValue37;
            precise float sumValue24 = sumValue21 - productValue30;
            precise float sumValue25 = sumValue22 - productValue31;
            precise float sumValue26 = sumValue23 - productValue32;
            precise float productValue33 = sumValue26 * sumValue19;
            precise float productValue34 = sumValue25 * sumValue20;
            precise float sumValue27 = productValue33 - productValue34;
            precise float productValue35 = sumValue24 * sumValue20;
            precise float productValue36 = sumValue26 * sumValue18;
            precise float sumValue28 = productValue35 - productValue36;
            precise float productValue37 = sumValue25 * sumValue18;
            precise float productValue38 = sumValue24 * sumValue19;
            precise float sumValue29 = productValue37 - productValue38;
            precise float productValue39 = sumValue27 * 2.0f;
            precise float productValue40 = sumValue28 * 2.0f;
            precise float productValue41 = sumValue29 * 2.0f;
            precise float sumValue30 = productValue39 - intermediateValue21;
            precise float sumValue31 = productValue40 - intermediateValue22;
            precise float sumValue32 = productValue41 - intermediateValue23;
            precise float productValue42 = intermediateValue27 * sumValue30;
            precise float productValue43 = intermediateValue27 * sumValue31;
            float inverseLengthValue3 = rsqrt(dot(float3(productValue42, productValue43, sumValue32), float3(productValue42, productValue43, sumValue32)));
            precise float productValue44 = inverseLengthValue3 * productValue42;
            precise float productValue45 = inverseLengthValue3 * productValue43;
            precise float productValue46 = inverseLengthValue3 * sumValue32;
            bool intermediateValue38 = productValue46 < 0.99989998340606689453125f;
            precise float productValue47 = productValue46 * 0.0f;
            precise float sumValue33 = productValue47 - productValue45;
            precise float sumValue34 = productValue44 - productValue47;
            precise float productValue48 = productValue45 * 0.0f;
            precise float productValue49 = productValue44 * 0.0f;
            precise float sumValue35 = productValue48 - productValue49;
            float inverseLengthValue4 = rsqrt(dot(float3(sumValue33, sumValue34, sumValue35), float3(sumValue33, sumValue34, sumValue35)));
            precise float productValue50 = inverseLengthValue4 * sumValue33;
            precise float productValue51 = inverseLengthValue4 * sumValue34;
            precise float productValue52 = inverseLengthValue4 * sumValue35;
            float comparisonValue12 = intermediateValue38 ? productValue50 : 1.0f;
            float comparisonValue13 = intermediateValue38 ? productValue51 : 0.0f;
            float comparisonValue14 = intermediateValue38 ? productValue52 : 0.0f;
            precise float productValue53 = productValue45 * comparisonValue14;
            precise float productValue54 = productValue46 * comparisonValue13;
            precise float sumValue36 = productValue53 - productValue54;
            precise float productValue55 = productValue46 * comparisonValue12;
            precise float productValue56 = productValue44 * comparisonValue14;
            precise float sumValue37 = productValue55 - productValue56;
            precise float productValue57 = productValue44 * comparisonValue13;
            precise float productValue58 = productValue45 * comparisonValue12;
            precise float sumValue38 = productValue57 - productValue58;
            float nonlinearValue1 = sqrt(comparisonValue9 ? loadedBufferValue5.x : loadedBufferValue5.z);
            precise float comparisonValue15 = (comparisonValue9 ? loadedBufferValue5.y : loadedBufferValue5.w) * 6.283185482025146484375f;
            precise float wavePhaseValue = nonlinearValue1 * cos(comparisonValue15);
            precise float wavePhaseValue1 = nonlinearValue1 * sin(comparisonValue15);
            precise float sumValue39 = productValue46 + 1.0f;
            precise float productValue59 = sumValue39 * 0.5f;
            precise float sumValue40 = (-0.0f) - wavePhaseValue;
            precise float productValue60 = sumValue40 * wavePhaseValue;
            precise float sumValue41 = productValue60 + 1.0f;
            float nonlinearValue2 = sqrt(max(sumValue41, 0.0f));
            precise float sumValue42 = wavePhaseValue1 - nonlinearValue2;
            precise float productValue61 = productValue59 * sumValue42;
            precise float sumValue43 = nonlinearValue2 + productValue61;
            precise float productValue62 = wavePhaseValue * comparisonValue12;
            precise float productValue63 = wavePhaseValue * comparisonValue13;
            precise float productValue64 = wavePhaseValue * comparisonValue14;
            precise float productValue65 = sumValue43 * sumValue36;
            precise float productValue66 = sumValue43 * sumValue37;
            precise float productValue67 = sumValue43 * sumValue38;
            precise float sumValue44 = productValue62 + productValue65;
            precise float sumValue45 = productValue63 + productValue66;
            precise float sumValue46 = productValue64 + productValue67;
            precise float sumValue47 = (-0.0f) - sumValue43;
            precise float productValue68 = sumValue47 * sumValue43;
            precise float sumValue48 = productValue68 + 1.0f;
            precise float productValue69 = sumValue40 * wavePhaseValue;
            precise float sumValue49 = productValue69 + sumValue48;
            float nonlinearValue3 = sqrt(max(0.0f, sumValue49));
            precise float productValue70 = productValue44 * nonlinearValue3;
            precise float productValue71 = productValue45 * nonlinearValue3;
            precise float productValue72 = productValue46 * nonlinearValue3;
            precise float sumValue50 = productValue70 + sumValue44;
            precise float sumValue51 = productValue71 + sumValue45;
            precise float sumValue52 = sumValue46 + productValue72;
            precise float productValue73 = intermediateValue27 * sumValue50;
            precise float productValue74 = intermediateValue27 * sumValue51;
            float intermediateValue39 = max(0.0f, sumValue52);
            float inverseLengthValue5 = rsqrt(dot(float3(productValue73, productValue74, intermediateValue39), float3(productValue73, productValue74, intermediateValue39)));
            precise float productValue75 = inverseLengthValue5 * productValue73;
            precise float productValue76 = inverseLengthValue5 * productValue74;
            precise float productValue77 = intermediateValue39 * inverseLengthValue5;
            precise float sumValue53 = (-0.0f) - sumValue30;
            precise float sumValue54 = (-0.0f) - sumValue31;
            precise float sumValue55 = (-0.0f) - sumValue32;
            precise float dotProductValue1 = dot(float3(sumValue53, sumValue54, sumValue55), float3(productValue75, productValue76, productValue77)) * 2.0f;
            precise float productValue78 = dotProductValue1 * productValue75;
            precise float productValue79 = dotProductValue1 * productValue76;
            precise float productValue80 = productValue77 * dotProductValue1;
            precise float sumValue56 = sumValue53 - productValue78;
            precise float sumValue57 = sumValue54 - productValue79;
            precise float sumValue58 = sumValue55 - productValue80;
            float branchMergedValue10;
            bool branchMergedValue18;
            float branchMergedValue19;
            float branchMergedValue20;
            float branchMergedValue21;
            if (clamp(dot(float3(productValue75, productValue76, productValue77), float3(sumValue56, sumValue57, sumValue58)), 0.0f, 1.0f) < 9.9999997473787516355514526367188e-06f)
            {
                branchMergedValue10 = 0.0f;
                branchMergedValue18 = true;
                branchMergedValue19 = 0.0f;
                branchMergedValue20 = 0.0f;
                branchMergedValue21 = 0.0f;
            }
            else
            {
                float productValue87 = intermediateValue27 * intermediateValue27;
                float multiplyAddValue = 1.0f / mad(sqrt((dot(productValue87.xx, float2(sumValue30 * sumValue30, sumValue31 * sumValue31)) / (sumValue32 * sumValue32)) + 1.0f), 0.5f, 0.5f);
                float multiplyAddValue1 = 1.0f / mad(sqrt((dot(productValue87.xx, float2(sumValue56 * sumValue56, sumValue57 * sumValue57)) / (sumValue58 * sumValue58)) + 1.0f), 0.5f, 0.5f);
                precise float productValue88 = intermediateValue35 * sumValue58;
                precise float productValue89 = intermediateValue36 * sumValue57;
                precise float sumValue59 = productValue88 - productValue89;
                precise float productValue90 = intermediateValue36 * sumValue56;
                precise float productValue91 = intermediateValue34 * sumValue58;
                precise float sumValue60 = productValue90 - productValue91;
                precise float productValue92 = intermediateValue34 * sumValue57;
                precise float productValue93 = intermediateValue35 * sumValue56;
                precise float sumValue61 = productValue92 - productValue93;
                precise float productValue94 = intermediateValue37 * sumValue56;
                precise float productValue95 = intermediateValue37 * sumValue57;
                precise float productValue96 = intermediateValue37 * sumValue58;
                precise float sumValue62 = productValue94 + sumValue59;
                precise float sumValue63 = productValue95 + sumValue60;
                precise float sumValue64 = productValue96 + sumValue61;
                precise float productValue97 = intermediateValue35 * sumValue64;
                precise float productValue98 = intermediateValue36 * sumValue63;
                precise float sumValue65 = productValue97 - productValue98;
                precise float productValue99 = intermediateValue36 * sumValue62;
                precise float productValue100 = intermediateValue34 * sumValue64;
                precise float sumValue66 = productValue99 - productValue100;
                precise float productValue101 = intermediateValue34 * sumValue63;
                precise float productValue102 = intermediateValue35 * sumValue62;
                precise float sumValue67 = productValue101 - productValue102;
                precise float productValue103 = sumValue65 * 2.0f;
                precise float productValue104 = sumValue66 * 2.0f;
                precise float productValue105 = sumValue67 * 2.0f;
                precise float sumValue13 = sumValue56 + productValue103;
                precise float sumValue14 = sumValue57 + productValue104;
                precise float sumValue15 = sumValue58 + productValue105;
                branchMergedValue10 = sumValue14;
                branchMergedValue18 = false;
                branchMergedValue19 = multiplyAddValue1 / ((multiplyAddValue1 + multiplyAddValue) - (multiplyAddValue1 * multiplyAddValue));
                branchMergedValue20 = sumValue15;
                branchMergedValue21 = sumValue13;
            }
            intermediateValue29 = branchMergedValue21;
            intermediateValue30 = branchMergedValue10;
            intermediateValue31 = branchMergedValue20;
            intermediateValue32 = branchMergedValue19;
            intermediateValue33 = branchMergedValue18;
        }
        float intermediateValue40;
        float intermediateValue42;
        float intermediateValue43;
        float intermediateValue44;
        uint intermediateValue45;
        if (intermediateValue33)
        {
            intermediateValue40 = 0.0f;
            intermediateValue42 = 0.0f;
            intermediateValue43 = 0.0f;
            intermediateValue44 = 0.0f;
            intermediateValue45 = 0u;
        }
        else
        {
            RayDesc _5ident = {float3((abs(intermediateValue18) < 0.03125f) ? (intermediateValue18 + (productValue6 * 1.52587890625e-05f)) : asfloat(((intermediateValue18 < 0.0f) ? (-productValue9) : productValue9) + asuint(intermediateValue18)), (abs(intermediateValue19) < 0.03125f) ? (intermediateValue19 + (productValue7 * 1.52587890625e-05f)) : asfloat(((intermediateValue19 < 0.0f) ? (-productValue10) : productValue10) + asuint(intermediateValue19)), (abs(intermediateValue20) < 0.03125f) ? (intermediateValue20 + (productValue8 * 1.52587890625e-05f)) : asfloat(((intermediateValue20 < 0.0f) ? (-productValue11) : productValue11) + asuint(intermediateValue20))), 0.0f, float3(intermediateValue29, intermediateValue30, intermediateValue31), 10000.0f};
            intermediateValue46.TraceRayInline(SceneBVH, 512u, 118u, _5ident);
            bool intermediateValue47 = intermediateValue46.Proceed();
            if (intermediateValue47)
            {
                bool intermediateValue65;
                bool comparisonValue21;
                for (;;)
                {
                    uint intermediateValue51 = intermediateValue46.CandidateType();
                    comparisonValue21 = intermediateValue51 == 0u;
                    if (comparisonValue21)
                    {
                        float2 intermediateValue60 = intermediateValue46.CandidateTriangleBarycentrics();
                        float2 intermediateValue61 = intermediateValue46.CandidateTriangleBarycentrics();
                        uint intermediateValue62 = intermediateValue46.CandidatePrimitiveIndex();
                        uint intermediateValue63 = intermediateValue46.CandidateInstanceID();
                        uint intermediateValue64 = intermediateValue46.CandidateInstanceIndex();
                        uint productValue106 = (intermediateValue64 * 76u) + 58u;
                        uint productValue107 = (intermediateValue64 * 76u) + 61u;
                        precise float sumValue68 = 1.0f - intermediateValue60.x;
                        precise float sumValue69 = sumValue68 - intermediateValue61.y;
                        uint bitwiseValue5 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue64 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue62 >> 1u);
                        uint productValue108 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue64 * 76u) + 54u) * 2 + 0)) + 0u;
                        bool comparisonValue22 = (intermediateValue62 & 1u) == 0u;
                        uint comparisonValue23 = comparisonValue22 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue108), bitwiseValue5 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue108), bitwiseValue5 * 16 + 0).x;
                        uint comparisonValue24 = comparisonValue22 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue108), bitwiseValue5 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue108), bitwiseValue5 * 16 + 0).w;
                        uint comparisonValue25 = comparisonValue22 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue108), bitwiseValue5 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue108), bitwiseValue5 * 16 + 0).z;
                        bool productValue109 = rdByteLoad_objectInstances_uint16_t(0u, productValue107 * 2 + 0) < 0u;
                        float intermediateValue77;
                        float intermediateValue78;
                        if (productValue109)
                        {
                            uint bitwiseValue7 = comparisonValue25 >> 15u;
                            precise float bitwiseValue8 = float(bitwiseValue7 & 1u) * 2.0f;
                            precise float sumValue70 = bitwiseValue8 + (-1.0f);
                            precise float bitwiseValue9 = float(comparisonValue25 >> 31u) * 2.0f;
                            precise float sumValue71 = bitwiseValue9 + (-1.0f);
                            precise float bitwiseValue10 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue11 = float(bitwiseValue7 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue115 = sumValue70 * 3.0517578125e-05f;
                            precise float productValue116 = sumValue71 * 3.0517578125e-05f;
                            precise float sumValue72 = bitwiseValue10 + productValue115;
                            precise float sumValue73 = bitwiseValue11 + productValue116;
                            intermediateValue77 = sumValue72;
                            intermediateValue78 = sumValue73;
                        }
                        else
                        {
                            precise float bitwiseValue12 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue13 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue117 = bitwiseValue12 * 16384.0f;
                            precise float sumValue74 = productValue117 + 0.5f;
                            precise float productValue118 = bitwiseValue13 * 16384.0f;
                            precise float sumValue75 = productValue118 + 0.5f;
                            precise float productValue119 = floor(sumValue74) * 6.103515625e-05f;
                            precise float productValue120 = floor(sumValue75) * 6.103515625e-05f;
                            intermediateValue77 = productValue119;
                            intermediateValue78 = productValue120;
                        }
                        precise float productValue123 = sumValue69 * intermediateValue77;
                        precise float productValue124 = sumValue69 * intermediateValue78;
                        precise float sumValue76 = productValue123 + 0.0f;
                        precise float sumValue77 = productValue124 + 0.0f;
                        float intermediateValue93;
                        float intermediateValue94;
                        if (productValue109)
                        {
                            uint bitwiseValue27 = comparisonValue24 >> 15u;
                            precise float bitwiseValue28 = float(bitwiseValue27 & 1u) * 2.0f;
                            precise float sumValue87 = bitwiseValue28 + (-1.0f);
                            precise float bitwiseValue29 = float(comparisonValue24 >> 31u) * 2.0f;
                            precise float sumValue88 = bitwiseValue29 + (-1.0f);
                            precise float bitwiseValue30 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue31 = float(bitwiseValue27 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue138 = sumValue87 * 3.0517578125e-05f;
                            precise float productValue139 = sumValue88 * 3.0517578125e-05f;
                            precise float sumValue89 = bitwiseValue30 + productValue138;
                            precise float sumValue90 = bitwiseValue31 + productValue139;
                            intermediateValue93 = sumValue89;
                            intermediateValue94 = sumValue90;
                        }
                        else
                        {
                            precise float bitwiseValue32 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue33 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue140 = bitwiseValue32 * 16384.0f;
                            precise float sumValue91 = productValue140 + 0.5f;
                            precise float productValue141 = bitwiseValue33 * 16384.0f;
                            precise float sumValue92 = productValue141 + 0.5f;
                            precise float productValue142 = floor(sumValue91) * 6.103515625e-05f;
                            precise float productValue143 = floor(sumValue92) * 6.103515625e-05f;
                            intermediateValue93 = productValue142;
                            intermediateValue94 = productValue143;
                        }
                        precise float productValue144 = intermediateValue60.x * intermediateValue93;
                        precise float productValue145 = intermediateValue60.x * intermediateValue94;
                        precise float sumValue93 = sumValue76 + productValue144;
                        precise float sumValue94 = sumValue77 + productValue145;
                        float intermediateValue111;
                        float intermediateValue112;
                        if (productValue109)
                        {
                            uint bitwiseValue37 = comparisonValue23 >> 15u;
                            precise float bitwiseValue38 = float(bitwiseValue37 & 1u) * 2.0f;
                            precise float sumValue95 = bitwiseValue38 + (-1.0f);
                            precise float bitwiseValue39 = float(comparisonValue23 >> 31u) * 2.0f;
                            precise float sumValue96 = bitwiseValue39 + (-1.0f);
                            precise float bitwiseValue40 = float((comparisonValue23 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue41 = float(bitwiseValue37 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue146 = sumValue95 * 3.0517578125e-05f;
                            precise float productValue147 = sumValue96 * 3.0517578125e-05f;
                            precise float sumValue97 = bitwiseValue40 + productValue146;
                            precise float sumValue98 = bitwiseValue41 + productValue147;
                            intermediateValue111 = sumValue97;
                            intermediateValue112 = sumValue98;
                        }
                        else
                        {
                            precise float bitwiseValue42 = float(comparisonValue23 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue43 = float(comparisonValue23 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue148 = bitwiseValue42 * 16384.0f;
                            precise float sumValue99 = productValue148 + 0.5f;
                            precise float productValue149 = bitwiseValue43 * 16384.0f;
                            precise float sumValue100 = productValue149 + 0.5f;
                            precise float productValue150 = floor(sumValue99) * 6.103515625e-05f;
                            precise float productValue151 = floor(sumValue100) * 6.103515625e-05f;
                            intermediateValue111 = productValue150;
                            intermediateValue112 = productValue151;
                        }
                        precise float productValue167 = intermediateValue61.y * intermediateValue111;
                        precise float productValue168 = intermediateValue61.y * intermediateValue112;
                        precise float sumValue105 = sumValue93 + productValue167;
                        precise float sumValue106 = sumValue94 + productValue168;
                        float intermediateValue114;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue106 * 2 + 0) == 65535u)
                        {
                            intermediateValue114 = 1.0f;
                        }
                        else
                        {
                            uint reinterpretedBits18;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue106 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits18 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits18 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue106 * 2 + 0));
                            }
                            intermediateValue114 = textures[NonUniformResourceIndex(reinterpretedBits18 + 0u)].SampleLevel(defaultSampler, float2(sumValue105, sumValue106), -0.25f).w;
                        }
                        uint comparisonValue31;
                        if (intermediateValue63 == 2u)
                        {
                            comparisonValue31 = 0u;
                        }
                        else
                        {
                            comparisonValue31 = uint(intermediateValue114 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue107 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                        }
                        if (comparisonValue31 == 0u)
                        {
                            intermediateValue46.CommitNonOpaqueTriangleHit();
                        }
                    }
                    intermediateValue65 = intermediateValue46.Proceed();
                    if (intermediateValue65)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint intermediateValue49 = intermediateValue46.CommittedStatus();
            float intermediateValue57;
            float intermediateValue58;
            float intermediateValue59;
            uint bitwiseValue4;
            if (intermediateValue49 == 1u)
            {
                float2 intermediateValue52 = intermediateValue46.CommittedTriangleBarycentrics();
                float2 intermediateValue53 = intermediateValue46.CommittedTriangleBarycentrics();
                float intermediateValue54 = intermediateValue46.CommittedRayT();
                uint intermediateValue55 = intermediateValue46.CommittedPrimitiveIndex();
                uint intermediateValue56 = intermediateValue46.CommittedInstanceIndex();
                intermediateValue57 = intermediateValue52.x;
                intermediateValue58 = intermediateValue53.y;
                intermediateValue59 = intermediateValue54;
                bitwiseValue4 = ((intermediateValue55 << 14u) & 1073725440u) | (intermediateValue56 & 16383u);
            }
            else
            {
                intermediateValue57 = 0.0f;
                intermediateValue58 = 0.0f;
                intermediateValue59 = 10000.0f;
                bitwiseValue4 = 1073741823u;
            }
            float intermediateValue41;
            float intermediateValue66;
            float intermediateValue67;
            float intermediateValue68;
            float intermediateValue69;
            float intermediateValue71;
            float intermediateValue73;
            float intermediateValue75;
            if (intermediateValue59 < 10000.0f)
            {
                uint bitwiseValue6 = bitwiseValue4 & 16383u;
                uint productValue110 = (bitwiseValue6 * 38u) + 25u;
                uint productValue111 = (bitwiseValue6 * 76u) + 58u;
                uint productValue112 = (bitwiseValue6 * 76u) + 59u;
                uint productValue113 = (bitwiseValue6 * 76u) + 61u;
                uint productValue114 = (bitwiseValue6 * 38u) + 32u;
                float intermediateValue70;
                float intermediateValue72;
                float intermediateValue74;
                if (asuint(viewCbConstants[54u]).w == 0u)
                {
                    intermediateValue70 = intermediateValue32;
                    intermediateValue72 = intermediateValue32;
                    intermediateValue74 = intermediateValue32;
                }
                else
                {
                    float productValue122 = intermediateValue59 * (-1.44269502162933349609375f);
                    intermediateValue70 = exp2(viewCbConstants[63u].x * productValue122) * intermediateValue32;
                    intermediateValue72 = exp2(viewCbConstants[63u].y * productValue122) * intermediateValue32;
                    intermediateValue74 = exp2(viewCbConstants[63u].z * productValue122) * intermediateValue32;
                }
                bool comparisonValue26 = (rdByteLoad_objectInstances_uint16_t(0u, productValue113 * 2 + 0) & 1u) != 0u;
                uint productValue121 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue6 * 76u) + 54u) * 2 + 0));
                uint bitwiseValue14 = (rdByteLoad_objectInstances_uint(0u, productValue110 * 4 + 0) >> 2u) + ((bitwiseValue4 >> 15u) & 32767u);
                float branchMergedValue13;
                float branchMergedValue29;
                float branchMergedValue30;
                float branchMergedValue31;
                float branchMergedValue32;
                float branchMergedValue33;
                float branchMergedValue34;
                float branchMergedValue35;
                if ((intermediateValue59 > quotientValue) && (comparisonValue26 && (asuint(viewCbConstants[86u]).y != 0u)))
                {
                    uint sumValue78 = productValue121 + 0u;
                    uint productValue125 = bitwiseValue14 * 8u;
                    half3 productValue126 = (half3)f16tof32(uint16_t3(rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue78), productValue125 * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue78), (productValue125 + 1u) * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue78), (productValue125 + 2u) * 2 + 0)));
                    branchMergedValue13 = intermediateValue59;
                    branchMergedValue29 = 0.0f;
                    branchMergedValue30 = intermediateValue74;
                    branchMergedValue31 = intermediateValue72;
                    branchMergedValue32 = intermediateValue70;
                    branchMergedValue33 = float(productValue126.z) * intermediateValue74;
                    branchMergedValue34 = float(productValue126.y) * intermediateValue72;
                    branchMergedValue35 = float(productValue126.x) * intermediateValue70;
                }
                else
                {
                    uint productValue127 = bitwiseValue6 * 38u;
                    float4 reinterpretedBits14 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue127 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue127 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue127 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue127 + 3u) * 4 + 0)));
                    float intermediateValue79 = reinterpretedBits14.x;
                    float intermediateValue80 = reinterpretedBits14.y;
                    float intermediateValue81 = reinterpretedBits14.z;
                    uint productValue128 = (bitwiseValue6 * 38u) + 4u;
                    float4 reinterpretedBits15 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue128 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue128 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue128 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue128 + 3u) * 4 + 0)));
                    float intermediateValue82 = reinterpretedBits15.x;
                    float intermediateValue83 = reinterpretedBits15.y;
                    float intermediateValue84 = reinterpretedBits15.z;
                    uint productValue129 = (bitwiseValue6 * 38u) + 8u;
                    float4 reinterpretedBits16 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue129 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue129 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue129 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue129 + 3u) * 4 + 0)));
                    float intermediateValue85 = reinterpretedBits16.x;
                    float intermediateValue86 = reinterpretedBits16.y;
                    float intermediateValue87 = reinterpretedBits16.z;
                    uint productValue130 = (bitwiseValue6 * 38u) + 24u;
                    uint productValue131 = (bitwiseValue6 * 76u) + 72u;
                    uint bitwiseValue15 = ((bitwiseValue4 >> 13u) & 2u) | ((bitwiseValue4 >> 13u) & 131068u);
                    uint bitwiseValue16 = bitwiseValue15 | 1u;
                    uint bitwiseValue17 = bitwiseValue15 ^ 2u;
                    uint intermediateValue[3];
                    intermediateValue[0u] = bitwiseValue15;
                    intermediateValue[1u] = bitwiseValue16;
                    intermediateValue[2u] = bitwiseValue17;
                    uint sumValue79 = productValue121 + 0u;
                    uint productValue132 = bitwiseValue14 * 4u;
                    precise float bitwiseValue18 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue132 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
                    precise float sumValue80 = bitwiseValue18 + (-1.0f);
                    precise float bitwiseValue19 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue132 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
                    precise float sumValue81 = bitwiseValue19 + (-1.0f);
                    precise float bitwiseValue20 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue132 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
                    precise float sumValue82 = bitwiseValue20 + (-1.0f);
                    precise float sumValue83 = 1.0f - intermediateValue57;
                    precise float sumValue84 = sumValue83 - intermediateValue58;
                    float intermediateValue1[3];
                    intermediateValue1[0u] = sumValue84;
                    intermediateValue1[1u] = intermediateValue57;
                    intermediateValue1[2u] = intermediateValue58;
                    uint sumValue85 = productValue121 + 0u;
                    uint productValue133 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue6 * 76u) + 56u) * 2 + 0));
                    uint productValue134 = productValue133 * (rdByteLoad_objectInstances_uint(0u, productValue130 * 4 + 0) + bitwiseValue15);
                    uint bitwiseValue21 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue6 * 76u) + 71u) * 2 + 0) & 255u);
                    uint bitwiseValue22 = (bitwiseValue21 + productValue134) >> 1u;
                    half3 productValue135 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue85), bitwiseValue22 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue85), (bitwiseValue22 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue85), (bitwiseValue22 + 2u) * 2 + 0)));
                    uint bitwiseValue23 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue131 * 2 + 0) & 255u);
                    uint bitwiseValue24 = (bitwiseValue23 + productValue134) >> 2u;
                    uint bitwiseValue25 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue131 * 2 + 0) >> 8u);
                    uint bitwiseValue26 = (bitwiseValue25 + productValue134) >> 2u;
                    bool productValue136 = rdByteLoad_objectInstances_uint16_t(0u, productValue113 * 2 + 0) < 0u;
                    float bitwiseValue35;
                    float bitwiseValue36;
                    if (productValue136)
                    {
                        uint bitwiseValue34 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue26 * 4 + 0) >> 15u;
                        bitwiseValue35 = ((float(bitwiseValue34 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue26 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                        bitwiseValue36 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue26 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue34 & 65534u) * 1.525902189314365386962890625e-05f);
                    }
                    else
                    {
                        bitwiseValue35 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue26 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        bitwiseValue36 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue26 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                    }
                    uint intermediateValue99;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue113 * 2 + 0) & 256u) == 0u)
                    {
                        intermediateValue99 = 0u;
                    }
                    else
                    {
                        intermediateValue99 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), ((uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue6 * 76u) + 74u) * 2 + 0) >> 8u) + productValue134) >> 2u) * 4 + 0) & 65535u;
                    }
                    precise float productValue152 = sumValue84 * float(productValue135.x);
                    precise float productValue153 = sumValue84 * float(productValue135.y);
                    precise float productValue154 = sumValue84 * float(productValue135.z);
                    precise float sumValue101 = productValue152 + 0.0f;
                    precise float sumValue102 = productValue153 + 0.0f;
                    precise float sumValue103 = productValue154 + 0.0f;
                    uint productValue155 = productValue133 * (rdByteLoad_objectInstances_uint(0u, productValue130 * 4 + 0) + bitwiseValue16);
                    uint bitwiseValue44 = (bitwiseValue21 + productValue155) >> 1u;
                    half3 productValue156 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue85), bitwiseValue44 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue85), (bitwiseValue44 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue85), (bitwiseValue44 + 2u) * 2 + 0)));
                    uint bitwiseValue45 = (bitwiseValue23 + productValue155) >> 2u;
                    uint bitwiseValue46 = (bitwiseValue25 + productValue155) >> 2u;
                    float bitwiseValue48;
                    float bitwiseValue49;
                    if (productValue136)
                    {
                        uint bitwiseValue47 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue46 * 4 + 0) >> 15u;
                        bitwiseValue48 = ((float(bitwiseValue47 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue46 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                        bitwiseValue49 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue46 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue47 & 65534u) * 1.525902189314365386962890625e-05f);
                    }
                    else
                    {
                        bitwiseValue48 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue46 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        bitwiseValue49 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue46 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                    }
                    precise float productValue169 = intermediateValue57 * float(productValue156.x);
                    precise float productValue170 = intermediateValue57 * float(productValue156.y);
                    precise float productValue171 = intermediateValue57 * float(productValue156.z);
                    precise float sumValue108 = sumValue101 + productValue169;
                    precise float sumValue109 = sumValue102 + productValue170;
                    precise float sumValue110 = sumValue103 + productValue171;
                    uint productValue172 = productValue133 * (rdByteLoad_objectInstances_uint(0u, productValue130 * 4 + 0) + bitwiseValue17);
                    uint bitwiseValue50 = (bitwiseValue21 + productValue172) >> 1u;
                    half3 productValue173 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue85), bitwiseValue50 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue85), (bitwiseValue50 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue85), (bitwiseValue50 + 2u) * 2 + 0)));
                    uint bitwiseValue51 = (bitwiseValue23 + productValue172) >> 2u;
                    uint bitwiseValue52 = (bitwiseValue25 + productValue172) >> 2u;
                    float bitwiseValue54;
                    float bitwiseValue55;
                    if (productValue136)
                    {
                        uint bitwiseValue53 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue52 * 4 + 0) >> 15u;
                        bitwiseValue54 = ((float(bitwiseValue53 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue52 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                        bitwiseValue55 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue52 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue53 & 65534u) * 1.525902189314365386962890625e-05f);
                    }
                    else
                    {
                        bitwiseValue54 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue52 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                        bitwiseValue55 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue52 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                    }
                    precise float productValue174 = intermediateValue58 * float(productValue173.x);
                    precise float productValue175 = intermediateValue58 * float(productValue173.y);
                    precise float productValue176 = intermediateValue58 * float(productValue173.z);
                    precise float sumValue111 = sumValue108 + productValue174;
                    precise float sumValue112 = sumValue109 + productValue175;
                    precise float sumValue113 = sumValue110 + productValue176;
                    float productValue177 = ((bitwiseValue48 * intermediateValue57) + (bitwiseValue35 * sumValue84)) + (bitwiseValue54 * intermediateValue58);
                    float productValue178 = ((bitwiseValue49 * intermediateValue57) + (bitwiseValue36 * sumValue84)) + (bitwiseValue55 * intermediateValue58);
                    float bitwiseValue56 = (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue45 * 4 + 0) & 255u) * intermediateValue57) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue24 * 4 + 0) & 255u) * sumValue84)) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue51 * 4 + 0) & 255u) * intermediateValue58)) * 0.0039215688593685626983642578125f;
                    float bitwiseValue57 = (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue45 * 4 + 0) >> 8u) & 255u) * intermediateValue57) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue24 * 4 + 0) >> 8u) & 255u) * sumValue84)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue51 * 4 + 0) >> 8u) & 255u) * intermediateValue58)) * 0.0039215688593685626983642578125f;
                    float bitwiseValue58 = (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue45 * 4 + 0) >> 16u) & 255u) * intermediateValue57) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue24 * 4 + 0) >> 16u) & 255u) * sumValue84)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue51 * 4 + 0) >> 16u) & 255u) * intermediateValue58)) * 0.0039215688593685626983642578125f;
                    float bitwiseValue59 = (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue45 * 4 + 0) >> 24u) * intermediateValue57) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue24 * 4 + 0) >> 24u) * sumValue84)) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue85), bitwiseValue51 * 4 + 0) >> 24u) * intermediateValue58)) * 0.0039215688593685626983642578125f;
                    precise float productValue179 = intermediateValue79 * sumValue111;
                    precise float productValue180 = sumValue112 * intermediateValue80;
                    precise float sumValue114 = productValue180 + productValue179;
                    precise float productValue181 = sumValue113 * intermediateValue81;
                    precise float sumValue115 = productValue181 + sumValue114;
                    precise float productValue182 = 1.0f * reinterpretedBits14.w;
                    precise float sumValue116 = productValue182 + sumValue115;
                    precise float productValue183 = intermediateValue82 * sumValue111;
                    precise float productValue184 = sumValue112 * intermediateValue83;
                    precise float sumValue117 = productValue184 + productValue183;
                    precise float productValue185 = sumValue113 * intermediateValue84;
                    precise float sumValue118 = productValue185 + sumValue117;
                    precise float productValue186 = 1.0f * reinterpretedBits15.w;
                    precise float sumValue119 = productValue186 + sumValue118;
                    precise float productValue187 = intermediateValue85 * sumValue111;
                    precise float productValue188 = sumValue112 * intermediateValue86;
                    precise float sumValue120 = productValue188 + productValue187;
                    precise float productValue189 = sumValue113 * intermediateValue87;
                    precise float sumValue121 = productValue189 + sumValue120;
                    precise float productValue190 = 1.0f * reinterpretedBits16.w;
                    precise float sumValue122 = productValue190 + sumValue121;
                    precise float productValue191 = intermediateValue79 * sumValue80;
                    precise float productValue192 = sumValue81 * intermediateValue80;
                    precise float sumValue123 = productValue192 + productValue191;
                    precise float productValue193 = sumValue82 * intermediateValue81;
                    precise float sumValue124 = productValue193 + sumValue123;
                    precise float productValue194 = intermediateValue82 * sumValue80;
                    precise float productValue195 = sumValue81 * intermediateValue83;
                    precise float sumValue125 = productValue195 + productValue194;
                    precise float productValue196 = sumValue82 * intermediateValue84;
                    precise float sumValue126 = productValue196 + sumValue125;
                    precise float productValue197 = intermediateValue85 * sumValue80;
                    precise float productValue198 = sumValue81 * intermediateValue86;
                    precise float sumValue127 = productValue198 + productValue197;
                    precise float productValue199 = sumValue82 * intermediateValue87;
                    precise float sumValue128 = productValue199 + sumValue127;
                    float inverseLengthValue6 = rsqrt(dot(float3(sumValue124, sumValue126, sumValue128), float3(sumValue124, sumValue126, sumValue128)));
                    precise float productValue200 = sumValue124 * inverseLengthValue6;
                    precise float productValue201 = sumValue126 * inverseLengthValue6;
                    precise float productValue202 = sumValue128 * inverseLengthValue6;
                    bool dotProductValue3 = dot(float3(intermediateValue29, intermediateValue30, intermediateValue31), float3(productValue200, productValue201, productValue202)) > 0.0f;
                    precise float sumValue129 = (-0.0f) - productValue200;
                    precise float sumValue130 = (-0.0f) - productValue201;
                    precise float sumValue131 = (-0.0f) - productValue202;
                    float comparisonValue32 = dotProductValue3 ? sumValue129 : productValue200;
                    float comparisonValue33 = dotProductValue3 ? sumValue130 : productValue201;
                    float comparisonValue34 = dotProductValue3 ? sumValue131 : productValue202;
                    float intermediateValue115;
                    float intermediateValue116;
                    float intermediateValue117;
                    if (comparisonValue26 && (asuint(viewCbConstants[86u]).y != 0u))
                    {
                        uint sumValue132 = productValue121 + 0u;
                        float sumValue133;
                        float sumValue134;
                        float sumValue135;
                        uint sumValue136;
                        float intermediateValue118 = sumValue84;
                        uint intermediateValue119 = bitwiseValue15;
                        float intermediateValue120 = 0.0f;
                        float intermediateValue121 = 0.0f;
                        float intermediateValue122 = 0.0f;
                        uint intermediateValue123 = 0u;
                        half3 productValue205;
                        half3 productValue207;
                        for (;;)
                        {
                            uint productValue203 = intermediateValue119 + rdByteLoad_objectInstances_uint(0u, productValue110 * 4 + 0);
                            uint productValue204 = productValue203 * 8u;
                            productValue205 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue132), productValue204 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue132), (productValue204 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue132), (productValue204 + 2u) * 2 + 0)));
                            uint productValue206 = (productValue203 * 8u) + 4u;
                            productValue207 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue132), productValue206 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue132), (productValue206 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue132), (productValue206 + 2u) * 2 + 0)));
                            half intermediateValue128;
                            half intermediateValue129;
                            half intermediateValue130;
                            if (dotProductValue3)
                            {
                                intermediateValue128 = productValue207.x;
                                intermediateValue129 = productValue207.y;
                                intermediateValue130 = productValue207.z;
                            }
                            else
                            {
                                intermediateValue128 = productValue205.x;
                                intermediateValue129 = productValue205.y;
                                intermediateValue130 = productValue205.z;
                            }
                            precise float productValue208 = float(intermediateValue130) * intermediateValue118;
                            precise float productValue209 = float(intermediateValue129) * intermediateValue118;
                            precise float productValue210 = float(intermediateValue128) * intermediateValue118;
                            sumValue133 = productValue210 + intermediateValue120;
                            sumValue134 = productValue209 + intermediateValue121;
                            sumValue135 = productValue208 + intermediateValue122;
                            sumValue136 = intermediateValue123 + 1u;
                            if (sumValue136 == 3u)
                            {
                                break;
                            }
                            intermediateValue118 = intermediateValue1[sumValue136];
                            intermediateValue119 = intermediateValue[sumValue136];
                            intermediateValue120 = sumValue133;
                            intermediateValue121 = sumValue134;
                            intermediateValue122 = sumValue135;
                            intermediateValue123 = sumValue136;
                            continue;
                        }
                        intermediateValue115 = sumValue133;
                        intermediateValue116 = sumValue134;
                        intermediateValue117 = sumValue135;
                    }
                    else
                    {
                        intermediateValue115 = 0.0f;
                        intermediateValue116 = 0.0f;
                        intermediateValue117 = 0.0f;
                    }
                    float2 reinterpretedBits19 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, (intermediateValue99 * 8u) * 8 + 0));
                    float2 reinterpretedBits20 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue99 * 8u) + 1u) * 8 + 0));
                    float reinterpretedBits21 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue99 * 16u) + 13u) * 4 + 0));
                    float reinterpretedBits22 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue99 * 16u) + 14u) * 4 + 0));
                    float nonlinearValue4 = max(0.0f, log2(abs((viewCbConstants[89u].y * intermediateValue5) + (productValue12 * 0.100000001490116119384765625f))) + float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue79), ((bitwiseValue14 * 8u) + 6u) * 2 + 0))));
                    uint reinterpretedBits23;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue111 * 2 + 0) > 4095u)
                    {
                        reinterpretedBits23 = asuint(viewCbConstants[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits23 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue111 * 2 + 0));
                    }
                    uint sumValue137 = reinterpretedBits23 + 0u;
                    float intermediateValue124;
                    float intermediateValue125;
                    float intermediateValue126;
                    float intermediateValue127;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue111 * 2 + 0) == 65535u)
                    {
                        intermediateValue124 = 1.0f;
                        intermediateValue125 = 1.0f;
                        intermediateValue126 = 1.0f;
                        intermediateValue127 = 1.0f;
                    }
                    else
                    {
                        float4 sampledTextureValue3 = textures[NonUniformResourceIndex(sumValue137)].SampleLevel(defaultSampler, float2(productValue177, productValue178), min(nonlinearValue4, reinterpretedBits21));
                        intermediateValue124 = sampledTextureValue3.x;
                        intermediateValue125 = sampledTextureValue3.y;
                        intermediateValue126 = sampledTextureValue3.z;
                        intermediateValue127 = sampledTextureValue3.w;
                    }
                    float intermediateValue131;
                    float intermediateValue134;
                    float intermediateValue135;
                    float intermediateValue136;
                    float intermediateValue137;
                    float intermediateValue138;
                    float intermediateValue139;
                    float intermediateValue140;
                    float intermediateValue141;
                    float intermediateValue142;
                    float intermediateValue143;
                    float intermediateValue144;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue113 * 2 + 0) & 1024u) == 0u)
                    {
                        float branchMergedValue16;
                        float branchMergedValue40;
                        float branchMergedValue41;
                        float branchMergedValue42;
                        float branchMergedValue43;
                        float branchMergedValue44;
                        float branchMergedValue45;
                        float branchMergedValue46;
                        float branchMergedValue47;
                        float branchMergedValue48;
                        float branchMergedValue49;
                        float branchMergedValue50;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue113 * 2 + 0) & 512u) == 0u)
                        {
                            float intermediateValue145;
                            float intermediateValue146;
                            float intermediateValue147;
                            float intermediateValue148;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue113 * 2 + 0) & 4u) == 0u)
                            {
                                intermediateValue145 = intermediateValue127;
                                intermediateValue146 = bitwiseValue56;
                                intermediateValue147 = bitwiseValue57;
                                intermediateValue148 = bitwiseValue58;
                            }
                            else
                            {
                                uint reinterpretedBits28;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue112 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits28 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits28 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue112 * 2 + 0));
                                }
                                float4 sampledTextureValue4 = textures[NonUniformResourceIndex(reinterpretedBits28 + 0u)].SampleLevel(defaultSampler, float2(bitwiseValue56, bitwiseValue57), 0.0f);
                                intermediateValue145 = 1.0f;
                                intermediateValue146 = ((((sampledTextureValue4.x * 2.0f) + (-1.0f)) * bitwiseValue58) + 1.0f) * bitwiseValue59;
                                intermediateValue147 = ((((sampledTextureValue4.y * 2.0f) + (-1.0f)) * bitwiseValue58) + 1.0f) * bitwiseValue59;
                                intermediateValue148 = ((((sampledTextureValue4.z * 2.0f) + (-1.0f)) * bitwiseValue58) + 1.0f) * bitwiseValue59;
                            }
                            float intermediateValue152;
                            float intermediateValue153;
                            float intermediateValue154;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue113 * 2 + 0) & 8192u) == 0u)
                            {
                                intermediateValue152 = intermediateValue146;
                                intermediateValue153 = intermediateValue147;
                                intermediateValue154 = intermediateValue148;
                            }
                            else
                            {
                                intermediateValue152 = ((1.0f - intermediateValue146) * intermediateValue145) + intermediateValue146;
                                intermediateValue153 = ((1.0f - intermediateValue147) * intermediateValue145) + intermediateValue147;
                                intermediateValue154 = ((1.0f - intermediateValue148) * intermediateValue145) + intermediateValue148;
                            }
                            float intermediateValue133;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue113 * 2 + 0) & 2048u) == 0u)
                            {
                                intermediateValue133 = intermediateValue145;
                            }
                            else
                            {
                                intermediateValue133 = clamp(mad(intermediateValue145, 2.0f, -1.0f), 0.0f, 1.0f);
                            }
                            float bitwiseValue60 = (intermediateValue152 * intermediateValue124) * ((intermediateValue133 * ((float(rdByteLoad_objectInstances_uint(0u, productValue114 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                            float bitwiseValue61 = (intermediateValue153 * intermediateValue125) * ((intermediateValue133 * ((float((rdByteLoad_objectInstances_uint(0u, productValue114 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                            float bitwiseValue62 = (intermediateValue154 * intermediateValue126) * ((intermediateValue133 * ((float((rdByteLoad_objectInstances_uint(0u, productValue114 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                            float productValue211;
                            if (bitwiseValue60 < 0.040449999272823333740234375f)
                            {
                                productValue211 = bitwiseValue60 * 0.077399380505084991455078125f;
                            }
                            else
                            {
                                productValue211 = exp2(log2((bitwiseValue60 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                            }
                            float productValue212;
                            if (bitwiseValue61 < 0.040449999272823333740234375f)
                            {
                                productValue212 = bitwiseValue61 * 0.077399380505084991455078125f;
                            }
                            else
                            {
                                productValue212 = exp2(log2((bitwiseValue61 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                            }
                            float productValue213;
                            if (bitwiseValue62 < 0.040449999272823333740234375f)
                            {
                                productValue213 = bitwiseValue62 * 0.077399380505084991455078125f;
                            }
                            else
                            {
                                productValue213 = exp2(log2((bitwiseValue62 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                            }
                            float reinterpretedBits24;
                            float reinterpretedBits29;
                            float reinterpretedBits30;
                            if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue99 * 16u) + 8u) * 4 + 0) & 1u) == 0u)
                            {
                                reinterpretedBits24 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue99 * 16u) + 11u) * 4 + 0));
                                reinterpretedBits29 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue99 * 16u) + 9u) * 4 + 0));
                                reinterpretedBits30 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue99 * 16u) + 10u) * 4 + 0));
                            }
                            else
                            {
                                float4 sampledTextureValue8 = textures[NonUniformResourceIndex(sumValue137)].SampleLevel(defaultSampler, float2(mad(productValue177, reinterpretedBits19.x, reinterpretedBits20.x), mad(productValue178, reinterpretedBits19.y, reinterpretedBits20.y)), min((reinterpretedBits22 - reinterpretedBits21) + nonlinearValue4, reinterpretedBits22));
                                float intermediateValue236 = sampledTextureValue8.y;
                                reinterpretedBits24 = sampledTextureValue8.x;
                                reinterpretedBits29 = sampledTextureValue8.z;
                                reinterpretedBits30 = mad(intermediateValue236, intermediateValue236, 0.0f);
                            }
                            float dotProductValue4 = dot(float3(productValue211, productValue212, productValue213), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                            float productValue303 = (reinterpretedBits30 * 5.0f) * viewCbConstants[84u].w;
                            branchMergedValue16 = productValue303 * (((dotProductValue4 - productValue212) * viewCbConstants[85u].x) + productValue212);
                            branchMergedValue40 = productValue303 * (((dotProductValue4 - productValue211) * viewCbConstants[85u].x) + productValue211);
                            branchMergedValue41 = reinterpretedBits29 - (viewCbConstants[85u].w * reinterpretedBits29);
                            branchMergedValue42 = intermediateValue133;
                            branchMergedValue43 = productValue213;
                            branchMergedValue44 = productValue212;
                            branchMergedValue45 = productValue211;
                            branchMergedValue46 = (reinterpretedBits24 * (productValue213 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                            branchMergedValue47 = (reinterpretedBits24 * (productValue212 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                            branchMergedValue48 = (reinterpretedBits24 * (productValue211 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                            branchMergedValue49 = productValue303 * (((dotProductValue4 - productValue213) * viewCbConstants[85u].x) + productValue213);
                            branchMergedValue50 = reinterpretedBits24;
                        }
                        else
                        {
                            branchMergedValue16 = intermediateValue132;
                            branchMergedValue40 = intermediateValue132;
                            branchMergedValue41 = intermediateValue132;
                            branchMergedValue42 = intermediateValue132;
                            branchMergedValue43 = exp2(log2(viewCbConstants[98u].y * intermediateValue126) * 1.39999997615814208984375f);
                            branchMergedValue44 = exp2(log2(viewCbConstants[98u].y * intermediateValue125) * 1.39999997615814208984375f);
                            branchMergedValue45 = exp2(log2(viewCbConstants[98u].y * intermediateValue124) * 1.39999997615814208984375f);
                            branchMergedValue46 = intermediateValue132;
                            branchMergedValue47 = intermediateValue132;
                            branchMergedValue48 = intermediateValue132;
                            branchMergedValue49 = intermediateValue132;
                            branchMergedValue50 = intermediateValue132;
                        }
                        intermediateValue131 = branchMergedValue42;
                        intermediateValue134 = branchMergedValue50;
                        intermediateValue135 = branchMergedValue41;
                        intermediateValue136 = branchMergedValue40;
                        intermediateValue137 = branchMergedValue16;
                        intermediateValue138 = branchMergedValue49;
                        intermediateValue139 = branchMergedValue48;
                        intermediateValue140 = branchMergedValue47;
                        intermediateValue141 = branchMergedValue46;
                        intermediateValue142 = branchMergedValue45;
                        intermediateValue143 = branchMergedValue44;
                        intermediateValue144 = branchMergedValue43;
                    }
                    else
                    {
                        intermediateValue131 = intermediateValue132;
                        intermediateValue134 = intermediateValue132;
                        intermediateValue135 = intermediateValue132;
                        intermediateValue136 = intermediateValue132;
                        intermediateValue137 = intermediateValue132;
                        intermediateValue138 = intermediateValue132;
                        intermediateValue139 = intermediateValue132;
                        intermediateValue140 = intermediateValue132;
                        intermediateValue141 = intermediateValue132;
                        intermediateValue142 = exp2(log2(viewCbConstants[98u].x * intermediateValue124) * 1.7999999523162841796875f);
                        intermediateValue143 = exp2(log2(viewCbConstants[98u].x * intermediateValue125) * 1.7999999523162841796875f);
                        intermediateValue144 = exp2(log2(viewCbConstants[98u].x * intermediateValue126) * 1.7999999523162841796875f);
                    }
                    float branchMergedValue68;
                    float branchMergedValue70;
                    float branchMergedValue71;
                    float branchMergedValue72;
                    float branchMergedValue73;
                    float branchMergedValue74;
                    float branchMergedValue75;
                    float branchMergedValue76;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue113 * 2 + 0) & 1536u) == 0u)
                    {
                        float productValue214 = (((1.0f - intermediateValue131) * 0.100000001490116119384765625f) + intermediateValue131) * (1.0f - (intermediateValue134 * 0.800000011920928955078125f));
                        float productValue215 = intermediateValue142 * productValue214;
                        float productValue216 = intermediateValue143 * productValue214;
                        float productValue217 = intermediateValue144 * productValue214;
                        float productValue218 = (productValue215 * intermediateValue115) + intermediateValue136;
                        float productValue219 = (productValue216 * intermediateValue116) + intermediateValue137;
                        float productValue220 = (productValue217 * intermediateValue117) + intermediateValue138;
                        precise float productValue221 = comparisonValue32 * 256.0f;
                        uint intermediateValue149 = uint(int(productValue221));
                        precise float productValue222 = comparisonValue33 * 256.0f;
                        uint intermediateValue150 = uint(int(productValue222));
                        precise float productValue223 = comparisonValue34 * 256.0f;
                        uint intermediateValue151 = uint(int(productValue223));
                        precise float productValue224 = comparisonValue32 * 1.52587890625e-05f;
                        precise float sumValue138 = sumValue116 + productValue224;
                        float reinterpretedBits25 = (abs(sumValue116) < 0.03125f) ? sumValue138 : asfloat(((sumValue116 < 0.0f) ? (-intermediateValue149) : intermediateValue149) + asuint(sumValue116));
                        precise float productValue225 = comparisonValue33 * 1.52587890625e-05f;
                        precise float sumValue139 = sumValue119 + productValue225;
                        float reinterpretedBits26 = (abs(sumValue119) < 0.03125f) ? sumValue139 : asfloat(((sumValue119 < 0.0f) ? (-intermediateValue150) : intermediateValue150) + asuint(sumValue119));
                        precise float productValue226 = comparisonValue34 * 1.52587890625e-05f;
                        precise float sumValue140 = sumValue122 + productValue226;
                        float reinterpretedBits27 = (abs(sumValue122) < 0.03125f) ? sumValue140 : asfloat(((sumValue122 < 0.0f) ? (-intermediateValue151) : intermediateValue151) + asuint(sumValue122));
                        float intermediateValue155;
                        float intermediateValue156;
                        float intermediateValue157;
                        if (dot(float3(viewCbConstants[52u].xyz), float3(comparisonValue32, comparisonValue33, comparisonValue34)) < 0.0f)
                        {
                            intermediateValue155 = 0.0f;
                            intermediateValue156 = 0.0f;
                            intermediateValue157 = 0.0f;
                        }
                        else
                        {
                            RayDesc _6ident = {float3(reinterpretedBits25, reinterpretedBits26, reinterpretedBits27), 0.0f, float3(viewCbConstants[53u].xyz), 10000.0f};
                            intermediateValue158.TraceRayInline(SceneBVH, 512u, 32u, _6ident);
                            bool intermediateValue159 = intermediateValue158.Proceed();
                            if (intermediateValue159)
                            {
                                bool intermediateValue169;
                                bool comparisonValue38;
                                for (;;)
                                {
                                    uint intermediateValue161 = intermediateValue158.CandidateType();
                                    comparisonValue38 = intermediateValue161 == 0u;
                                    if (comparisonValue38)
                                    {
                                        float2 intermediateValue164 = intermediateValue158.CandidateTriangleBarycentrics();
                                        float2 intermediateValue165 = intermediateValue158.CandidateTriangleBarycentrics();
                                        uint intermediateValue166 = intermediateValue158.CandidatePrimitiveIndex();
                                        uint intermediateValue167 = intermediateValue158.CandidateInstanceID();
                                        uint intermediateValue168 = intermediateValue158.CandidateInstanceIndex();
                                        uint productValue244 = (intermediateValue168 * 76u) + 58u;
                                        uint productValue245 = (intermediateValue168 * 76u) + 61u;
                                        precise float sumValue149 = 1.0f - intermediateValue164.x;
                                        precise float sumValue150 = sumValue149 - intermediateValue165.y;
                                        uint bitwiseValue63 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue168 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue166 >> 1u);
                                        uint productValue246 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue168 * 76u) + 54u) * 2 + 0)) + 0u;
                                        bool comparisonValue39 = (intermediateValue166 & 1u) == 0u;
                                        uint comparisonValue40 = comparisonValue39 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue246), bitwiseValue63 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue246), bitwiseValue63 * 16 + 0).x;
                                        uint comparisonValue41 = comparisonValue39 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue246), bitwiseValue63 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue246), bitwiseValue63 * 16 + 0).w;
                                        uint comparisonValue42 = comparisonValue39 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue246), bitwiseValue63 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue246), bitwiseValue63 * 16 + 0).z;
                                        bool productValue247 = rdByteLoad_objectInstances_uint16_t(0u, productValue245 * 2 + 0) < 0u;
                                        float intermediateValue191;
                                        float intermediateValue192;
                                        if (productValue247)
                                        {
                                            uint bitwiseValue64 = comparisonValue42 >> 15u;
                                            precise float bitwiseValue65 = float(bitwiseValue64 & 1u) * 2.0f;
                                            precise float sumValue167 = bitwiseValue65 + (-1.0f);
                                            precise float bitwiseValue66 = float(comparisonValue42 >> 31u) * 2.0f;
                                            precise float sumValue168 = bitwiseValue66 + (-1.0f);
                                            precise float bitwiseValue67 = float((comparisonValue42 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue68 = float(bitwiseValue64 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue267 = sumValue167 * 3.0517578125e-05f;
                                            precise float productValue268 = sumValue168 * 3.0517578125e-05f;
                                            precise float sumValue169 = bitwiseValue67 + productValue267;
                                            precise float sumValue170 = bitwiseValue68 + productValue268;
                                            intermediateValue191 = sumValue169;
                                            intermediateValue192 = sumValue170;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue69 = float(comparisonValue42 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue70 = float(comparisonValue42 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue269 = bitwiseValue69 * 16384.0f;
                                            precise float sumValue171 = productValue269 + 0.5f;
                                            precise float productValue270 = bitwiseValue70 * 16384.0f;
                                            precise float sumValue172 = productValue270 + 0.5f;
                                            precise float productValue271 = floor(sumValue171) * 6.103515625e-05f;
                                            precise float productValue272 = floor(sumValue172) * 6.103515625e-05f;
                                            intermediateValue191 = productValue271;
                                            intermediateValue192 = productValue272;
                                        }
                                        precise float productValue273 = sumValue150 * intermediateValue191;
                                        precise float productValue274 = sumValue150 * intermediateValue192;
                                        precise float sumValue173 = productValue273 + 0.0f;
                                        precise float sumValue174 = productValue274 + 0.0f;
                                        float intermediateValue230;
                                        float intermediateValue231;
                                        if (productValue247)
                                        {
                                            uint bitwiseValue71 = comparisonValue41 >> 15u;
                                            precise float bitwiseValue72 = float(bitwiseValue71 & 1u) * 2.0f;
                                            precise float sumValue175 = bitwiseValue72 + (-1.0f);
                                            precise float bitwiseValue73 = float(comparisonValue41 >> 31u) * 2.0f;
                                            precise float sumValue176 = bitwiseValue73 + (-1.0f);
                                            precise float bitwiseValue74 = float((comparisonValue41 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue75 = float(bitwiseValue71 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue275 = sumValue175 * 3.0517578125e-05f;
                                            precise float productValue276 = sumValue176 * 3.0517578125e-05f;
                                            precise float sumValue177 = bitwiseValue74 + productValue275;
                                            precise float sumValue178 = bitwiseValue75 + productValue276;
                                            intermediateValue230 = sumValue177;
                                            intermediateValue231 = sumValue178;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue76 = float(comparisonValue41 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue77 = float(comparisonValue41 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue277 = bitwiseValue76 * 16384.0f;
                                            precise float sumValue179 = productValue277 + 0.5f;
                                            precise float productValue278 = bitwiseValue77 * 16384.0f;
                                            precise float sumValue180 = productValue278 + 0.5f;
                                            precise float productValue279 = floor(sumValue179) * 6.103515625e-05f;
                                            precise float productValue280 = floor(sumValue180) * 6.103515625e-05f;
                                            intermediateValue230 = productValue279;
                                            intermediateValue231 = productValue280;
                                        }
                                        precise float productValue289 = intermediateValue164.x * intermediateValue230;
                                        precise float productValue290 = intermediateValue164.x * intermediateValue231;
                                        precise float sumValue185 = sumValue173 + productValue289;
                                        precise float sumValue186 = sumValue174 + productValue290;
                                        float intermediateValue251;
                                        float intermediateValue252;
                                        if (productValue247)
                                        {
                                            uint bitwiseValue94 = comparisonValue40 >> 15u;
                                            precise float bitwiseValue95 = float(bitwiseValue94 & 1u) * 2.0f;
                                            precise float sumValue199 = bitwiseValue95 + (-1.0f);
                                            precise float bitwiseValue96 = float(comparisonValue40 >> 31u) * 2.0f;
                                            precise float sumValue200 = bitwiseValue96 + (-1.0f);
                                            precise float bitwiseValue97 = float((comparisonValue40 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue98 = float(bitwiseValue94 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue304 = sumValue199 * 3.0517578125e-05f;
                                            precise float productValue305 = sumValue200 * 3.0517578125e-05f;
                                            precise float sumValue201 = bitwiseValue97 + productValue304;
                                            precise float sumValue202 = bitwiseValue98 + productValue305;
                                            intermediateValue251 = sumValue201;
                                            intermediateValue252 = sumValue202;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue99 = float(comparisonValue40 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue100 = float(comparisonValue40 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue306 = bitwiseValue99 * 16384.0f;
                                            precise float sumValue203 = productValue306 + 0.5f;
                                            precise float productValue307 = bitwiseValue100 * 16384.0f;
                                            precise float sumValue204 = productValue307 + 0.5f;
                                            precise float productValue308 = floor(sumValue203) * 6.103515625e-05f;
                                            precise float productValue309 = floor(sumValue204) * 6.103515625e-05f;
                                            intermediateValue251 = productValue308;
                                            intermediateValue252 = productValue309;
                                        }
                                        precise float productValue318 = intermediateValue165.y * intermediateValue251;
                                        precise float productValue319 = intermediateValue165.y * intermediateValue252;
                                        precise float sumValue211 = sumValue185 + productValue318;
                                        precise float sumValue212 = sumValue186 + productValue319;
                                        float intermediateValue253;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue244 * 2 + 0) == 65535u)
                                        {
                                            intermediateValue253 = 1.0f;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits31;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue244 * 2 + 0) > 4095u)
                                            {
                                                reinterpretedBits31 = asuint(viewCbConstants[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits31 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue244 * 2 + 0));
                                            }
                                            intermediateValue253 = textures[NonUniformResourceIndex(reinterpretedBits31 + 0u)].SampleLevel(defaultSampler, float2(sumValue211, sumValue212), -0.25f).w;
                                        }
                                        uint comparisonValue62;
                                        if (intermediateValue167 == 2u)
                                        {
                                            comparisonValue62 = 0u;
                                        }
                                        else
                                        {
                                            comparisonValue62 = uint(intermediateValue253 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue245 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                                        }
                                        if (comparisonValue62 == 0u)
                                        {
                                            intermediateValue158.CommitNonOpaqueTriangleHit();
                                        }
                                    }
                                    intermediateValue169 = intermediateValue158.Proceed();
                                    if (intermediateValue169)
                                    {
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }
                            uint intermediateValue160 = intermediateValue158.CommittedStatus();
                            float intermediateValue163;
                            if (intermediateValue160 == 1u)
                            {
                                float intermediateValue162 = intermediateValue158.CommittedRayT();
                                intermediateValue163 = intermediateValue162;
                            }
                            else
                            {
                                intermediateValue163 = 10000.0f;
                            }
                            float branchMergedValue17;
                            float branchMergedValue51;
                            float branchMergedValue52;
                            if (intermediateValue163 < 10000.0f)
                            {
                                precise float productValue248 = intermediateValue163 * viewCbConstants[63u].x;
                                precise float productValue249 = intermediateValue163 * viewCbConstants[63u].y;
                                precise float productValue250 = intermediateValue163 * viewCbConstants[63u].z;
                                precise float productValue251 = productValue248 * (-1.44269502162933349609375f);
                                precise float productValue252 = productValue249 * (-1.44269502162933349609375f);
                                precise float productValue253 = productValue250 * (-1.44269502162933349609375f);
                                precise float productValue254 = viewCbConstants[53u].x * intermediateValue163;
                                precise float sumValue151 = productValue254 + reinterpretedBits25;
                                precise float productValue255 = viewCbConstants[53u].z * intermediateValue163;
                                precise float sumValue152 = productValue255 + reinterpretedBits27;
                                precise float productValue256 = sumValue151 * viewCbConstants[83u].z;
                                precise float sumValue153 = productValue256 + viewCbConstants[84u].x;
                                precise float productValue257 = sumValue152 * viewCbConstants[83u].w;
                                precise float sumValue154 = productValue257 + viewCbConstants[84u].y;
                                float4 sampledTextureValue5 = wibblyTexture.SampleLevel(linearWrapSampler, float2(sumValue153, sumValue154), 0.0f);
                                precise float sumValue155 = sampledTextureValue5.x + (-0.5f);
                                precise float sumValue156 = sampledTextureValue5.y + (-0.5f);
                                precise float productValue258 = sumValue151 * viewCbConstants[82u].z;
                                precise float sumValue157 = productValue258 + viewCbConstants[83u].x;
                                precise float productValue259 = sumValue152 * viewCbConstants[82u].w;
                                precise float sumValue158 = productValue259 + viewCbConstants[83u].y;
                                precise float productValue260 = sumValue155 * 0.4000000059604644775390625f;
                                precise float productValue261 = sumValue156 * 0.4000000059604644775390625f;
                                precise float sumValue159 = sumValue157 + productValue260;
                                precise float sumValue160 = productValue261 + sumValue158;
                                precise float productValue262 = viewCbConstants[68u].w * 63.0f;
                                uint intermediateValue170 = uint(int(floor(productValue262)));
                                precise float productValue263 = float(int(intermediateValue170 + 1u)) * 0.015625f;
                                precise float sumValue161 = (-0.0f) - productValue263;
                                float intermediateValue171 = frac(abs(productValue263));
                                precise float sumValue162 = (-0.0f) - intermediateValue171;
                                precise float comparisonValue43 = ((productValue263 >= sumValue161) ? intermediateValue171 : sumValue162) * 64.0f;
                                float4 sampledTextureValue6 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue159, sumValue160, float(int(intermediateValue170))), 0.0f);
                                float intermediateValue172 = sampledTextureValue6.x;
                                precise float sampledTextureValue7 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue159, sumValue160, float(int(uint(int(comparisonValue43))))), 0.0f).x - intermediateValue172;
                                precise float productValue264 = frac(productValue262) * sampledTextureValue7;
                                precise float sumValue163 = intermediateValue172 + productValue264;
                                precise float productValue265 = sumValue163 * 7.0f;
                                precise float sumValue164 = productValue265 + 0.800000011920928955078125f;
                                precise float productValue266 = intermediateValue163 * (-0.100000001490116119384765625f);
                                precise float sumValue165 = sumValue164 + (-1.0f);
                                precise float exponentialValue = exp2(productValue266) * sumValue165;
                                precise float sumValue166 = exponentialValue + 1.0f;
                                precise float exponentialValue1 = exp2(productValue251) * sumValue166;
                                precise float exponentialValue2 = exp2(productValue252) * sumValue166;
                                precise float exponentialValue3 = exp2(productValue253) * sumValue166;
                                RayDesc _7ident = {float3(reinterpretedBits25, reinterpretedBits26, reinterpretedBits27), 0.0f, float3(viewCbConstants[53u].xyz), intermediateValue163};
                                intermediateValue173.TraceRayInline(SceneBVH, 512u, 22u, _7ident);
                                bool intermediateValue174 = intermediateValue173.Proceed();
                                float intermediateValue177;
                                float intermediateValue179;
                                float intermediateValue181;
                                if (intermediateValue174)
                                {
                                    float intermediateValue178;
                                    float intermediateValue180;
                                    float intermediateValue182;
                                    float intermediateValue193 = exponentialValue1;
                                    float intermediateValue194 = exponentialValue2;
                                    float intermediateValue195 = exponentialValue3;
                                    bool comparisonValue46;
                                    for (;;)
                                    {
                                        uint intermediateValue196 = intermediateValue173.CandidateType();
                                        comparisonValue46 = intermediateValue196 == 0u;
                                        float branchMergedValue;
                                        float branchMergedValue3;
                                        float branchMergedValue4;
                                        if (comparisonValue46)
                                        {
                                            float2 intermediateValue203 = intermediateValue173.CandidateTriangleBarycentrics();
                                            float2 intermediateValue204 = intermediateValue173.CandidateTriangleBarycentrics();
                                            float intermediateValue205 = intermediateValue173.CandidateTriangleRayT();
                                            uint intermediateValue206 = intermediateValue173.CandidatePrimitiveIndex();
                                            uint intermediateValue207 = intermediateValue173.CandidateInstanceID();
                                            uint intermediateValue208 = intermediateValue173.CandidateInstanceIndex();
                                            uint productValue281 = (intermediateValue208 * 76u) + 58u;
                                            uint productValue282 = (intermediateValue208 * 76u) + 61u;
                                            precise float sumValue181 = 1.0f - intermediateValue203.x;
                                            precise float sumValue182 = sumValue181 - intermediateValue204.y;
                                            uint bitwiseValue78 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue208 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue206 >> 1u);
                                            uint productValue283 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue208 * 76u) + 54u) * 2 + 0)) + 0u;
                                            bool comparisonValue48 = (intermediateValue206 & 1u) == 0u;
                                            uint comparisonValue49 = comparisonValue48 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue283), bitwiseValue78 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue283), bitwiseValue78 * 16 + 0).x;
                                            uint comparisonValue50 = comparisonValue48 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue283), bitwiseValue78 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue283), bitwiseValue78 * 16 + 0).w;
                                            uint comparisonValue51 = comparisonValue48 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue283), bitwiseValue78 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue283), bitwiseValue78 * 16 + 0).z;
                                            bool productValue284 = rdByteLoad_objectInstances_uint16_t(0u, productValue282 * 2 + 0) < 0u;
                                            float intermediateValue237;
                                            float intermediateValue238;
                                            if (productValue284)
                                            {
                                                uint bitwiseValue80 = comparisonValue51 >> 15u;
                                                precise float bitwiseValue81 = float(bitwiseValue80 & 1u) * 2.0f;
                                                precise float sumValue187 = bitwiseValue81 + (-1.0f);
                                                precise float bitwiseValue82 = float(comparisonValue51 >> 31u) * 2.0f;
                                                precise float sumValue188 = bitwiseValue82 + (-1.0f);
                                                precise float bitwiseValue83 = float((comparisonValue51 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue84 = float(bitwiseValue80 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue291 = sumValue187 * 3.0517578125e-05f;
                                                precise float productValue292 = sumValue188 * 3.0517578125e-05f;
                                                precise float sumValue189 = bitwiseValue83 + productValue291;
                                                precise float sumValue190 = bitwiseValue84 + productValue292;
                                                intermediateValue237 = sumValue189;
                                                intermediateValue238 = sumValue190;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue85 = float(comparisonValue51 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue86 = float(comparisonValue51 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue293 = bitwiseValue85 * 16384.0f;
                                                precise float sumValue191 = productValue293 + 0.5f;
                                                precise float productValue294 = bitwiseValue86 * 16384.0f;
                                                precise float sumValue192 = productValue294 + 0.5f;
                                                precise float productValue295 = floor(sumValue191) * 6.103515625e-05f;
                                                precise float productValue296 = floor(sumValue192) * 6.103515625e-05f;
                                                intermediateValue237 = productValue295;
                                                intermediateValue238 = productValue296;
                                            }
                                            precise float productValue310 = sumValue182 * intermediateValue237;
                                            precise float productValue311 = sumValue182 * intermediateValue238;
                                            precise float sumValue205 = productValue310 + 0.0f;
                                            precise float sumValue206 = productValue311 + 0.0f;
                                            float intermediateValue254;
                                            float intermediateValue255;
                                            if (productValue284)
                                            {
                                                uint bitwiseValue102 = comparisonValue50 >> 15u;
                                                precise float bitwiseValue103 = float(bitwiseValue102 & 1u) * 2.0f;
                                                precise float sumValue213 = bitwiseValue103 + (-1.0f);
                                                precise float bitwiseValue104 = float(comparisonValue50 >> 31u) * 2.0f;
                                                precise float sumValue214 = bitwiseValue104 + (-1.0f);
                                                precise float bitwiseValue105 = float((comparisonValue50 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue106 = float(bitwiseValue102 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue320 = sumValue213 * 3.0517578125e-05f;
                                                precise float productValue321 = sumValue214 * 3.0517578125e-05f;
                                                precise float sumValue215 = bitwiseValue105 + productValue320;
                                                precise float sumValue216 = bitwiseValue106 + productValue321;
                                                intermediateValue254 = sumValue215;
                                                intermediateValue255 = sumValue216;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue107 = float(comparisonValue50 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue108 = float(comparisonValue50 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue322 = bitwiseValue107 * 16384.0f;
                                                precise float sumValue217 = productValue322 + 0.5f;
                                                precise float productValue323 = bitwiseValue108 * 16384.0f;
                                                precise float sumValue218 = productValue323 + 0.5f;
                                                precise float productValue324 = floor(sumValue217) * 6.103515625e-05f;
                                                precise float productValue325 = floor(sumValue218) * 6.103515625e-05f;
                                                intermediateValue254 = productValue324;
                                                intermediateValue255 = productValue325;
                                            }
                                            precise float productValue338 = intermediateValue203.x * intermediateValue254;
                                            precise float productValue339 = intermediateValue203.x * intermediateValue255;
                                            precise float sumValue231 = sumValue205 + productValue338;
                                            precise float sumValue232 = sumValue206 + productValue339;
                                            float intermediateValue260;
                                            float intermediateValue261;
                                            if (productValue284)
                                            {
                                                uint bitwiseValue123 = comparisonValue49 >> 15u;
                                                precise float bitwiseValue124 = float(bitwiseValue123 & 1u) * 2.0f;
                                                precise float sumValue237 = bitwiseValue124 + (-1.0f);
                                                precise float bitwiseValue125 = float(comparisonValue49 >> 31u) * 2.0f;
                                                precise float sumValue238 = bitwiseValue125 + (-1.0f);
                                                precise float bitwiseValue126 = float((comparisonValue49 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue127 = float(bitwiseValue123 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue344 = sumValue237 * 3.0517578125e-05f;
                                                precise float productValue345 = sumValue238 * 3.0517578125e-05f;
                                                precise float sumValue239 = bitwiseValue126 + productValue344;
                                                precise float sumValue240 = bitwiseValue127 + productValue345;
                                                intermediateValue260 = sumValue239;
                                                intermediateValue261 = sumValue240;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue128 = float(comparisonValue49 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue129 = float(comparisonValue49 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue346 = bitwiseValue128 * 16384.0f;
                                                precise float sumValue241 = productValue346 + 0.5f;
                                                precise float productValue347 = bitwiseValue129 * 16384.0f;
                                                precise float sumValue242 = productValue347 + 0.5f;
                                                precise float productValue348 = floor(sumValue241) * 6.103515625e-05f;
                                                precise float productValue349 = floor(sumValue242) * 6.103515625e-05f;
                                                intermediateValue260 = productValue348;
                                                intermediateValue261 = productValue349;
                                            }
                                            precise float productValue362 = intermediateValue204.y * intermediateValue260;
                                            precise float productValue363 = intermediateValue204.y * intermediateValue261;
                                            precise float sumValue255 = sumValue231 + productValue362;
                                            precise float sumValue256 = sumValue232 + productValue363;
                                            precise float productValue364 = intermediateValue205 * 0.083333335816860198974609375f;
                                            precise float sumValue257 = productValue364 + (-0.25f);
                                            float intermediateValue266;
                                            float intermediateValue267;
                                            float intermediateValue268;
                                            float intermediateValue269;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue281 * 2 + 0) == 65535u)
                                            {
                                                intermediateValue266 = 1.0f;
                                                intermediateValue267 = 1.0f;
                                                intermediateValue268 = 1.0f;
                                                intermediateValue269 = 1.0f;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits32;
                                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue281 * 2 + 0) > 4095u)
                                                {
                                                    reinterpretedBits32 = asuint(viewCbConstants[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits32 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue281 * 2 + 0));
                                                }
                                                float4 sampledTextureValue9 = textures[NonUniformResourceIndex(reinterpretedBits32 + 0u)].SampleLevel(defaultSampler, float2(sumValue255, sumValue256), min(sumValue257, 2.0f));
                                                intermediateValue266 = sampledTextureValue9.x;
                                                intermediateValue267 = sampledTextureValue9.y;
                                                intermediateValue268 = sampledTextureValue9.z;
                                                intermediateValue269 = sampledTextureValue9.w;
                                            }
                                            float intermediateValue276;
                                            float intermediateValue277;
                                            float intermediateValue278;
                                            if (intermediateValue207 == 2u)
                                            {
                                                float branchMergedValue26;
                                                float branchMergedValue53;
                                                float branchMergedValue54;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue282 * 2 + 0) & 128u) == 0u)
                                                {
                                                    float intermediateValue286;
                                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue282 * 2 + 0) & 2048u) == 0u)
                                                    {
                                                        intermediateValue286 = intermediateValue269;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue388 = intermediateValue269 * 2.0f;
                                                        precise float sumValue283 = productValue388 + (-1.0f);
                                                        intermediateValue286 = clamp(sumValue283, 0.0f, 1.0f);
                                                    }
                                                    precise float sumValue280 = 0.0f - intermediateValue266;
                                                    precise float sumValue281 = 0.0f - intermediateValue267;
                                                    precise float sumValue282 = 0.0f - intermediateValue268;
                                                    precise float productValue385 = sumValue280 * intermediateValue286;
                                                    precise float productValue386 = sumValue281 * intermediateValue286;
                                                    precise float productValue387 = sumValue282 * intermediateValue286;
                                                    precise float sumValue274 = intermediateValue266 + productValue385;
                                                    precise float sumValue275 = intermediateValue267 + productValue386;
                                                    precise float sumValue276 = intermediateValue268 + productValue387;
                                                    branchMergedValue26 = sumValue276;
                                                    branchMergedValue53 = sumValue275;
                                                    branchMergedValue54 = sumValue274;
                                                }
                                                else
                                                {
                                                    branchMergedValue26 = 0.33399999141693115234375f;
                                                    branchMergedValue53 = 0.33399999141693115234375f;
                                                    branchMergedValue54 = 0.33399999141693115234375f;
                                                }
                                                intermediateValue276 = branchMergedValue54;
                                                intermediateValue277 = branchMergedValue53;
                                                intermediateValue278 = branchMergedValue26;
                                            }
                                            else
                                            {
                                                precise float sumValue269 = 1.0f - intermediateValue269;
                                                intermediateValue276 = sumValue269;
                                                intermediateValue277 = sumValue269;
                                                intermediateValue278 = sumValue269;
                                            }
                                            precise float productValue379 = intermediateValue193 * intermediateValue276;
                                            precise float productValue380 = intermediateValue194 * intermediateValue277;
                                            precise float productValue381 = intermediateValue195 * intermediateValue278;
                                            float intermediateValue209;
                                            float intermediateValue210;
                                            float intermediateValue211;
                                            bool intermediateValue287;
                                            if (!(dot(float3(productValue379, productValue380, productValue381), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                            {
                                                intermediateValue287 = false;
                                                intermediateValue209 = productValue379;
                                                intermediateValue210 = productValue380;
                                                intermediateValue211 = productValue381;
                                            }
                                            else
                                            {
                                                intermediateValue287 = true;
                                                intermediateValue209 = 0.0f;
                                                intermediateValue210 = 0.0f;
                                                intermediateValue211 = 0.0f;
                                            }
                                            float branchMergedValue59;
                                            float branchMergedValue62;
                                            float branchMergedValue63;
                                            if (intermediateValue287)
                                            {
                                                intermediateValue173.CommitNonOpaqueTriangleHit();
                                                branchMergedValue59 = intermediateValue211;
                                                branchMergedValue62 = intermediateValue210;
                                                branchMergedValue63 = intermediateValue209;
                                            }
                                            else
                                            {
                                                branchMergedValue59 = intermediateValue211;
                                                branchMergedValue62 = intermediateValue210;
                                                branchMergedValue63 = intermediateValue209;
                                            }
                                            branchMergedValue = branchMergedValue59;
                                            branchMergedValue3 = branchMergedValue62;
                                            branchMergedValue4 = branchMergedValue63;
                                        }
                                        else
                                        {
                                            branchMergedValue = intermediateValue195;
                                            branchMergedValue3 = intermediateValue194;
                                            branchMergedValue4 = intermediateValue193;
                                        }
                                        intermediateValue182 = branchMergedValue;
                                        intermediateValue180 = branchMergedValue3;
                                        intermediateValue178 = branchMergedValue4;
                                        bool intermediateValue212 = intermediateValue173.Proceed();
                                        if (intermediateValue212)
                                        {
                                            intermediateValue193 = intermediateValue178;
                                            intermediateValue194 = intermediateValue180;
                                            intermediateValue195 = intermediateValue182;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue177 = intermediateValue178;
                                    intermediateValue179 = intermediateValue180;
                                    intermediateValue181 = intermediateValue182;
                                }
                                else
                                {
                                    intermediateValue177 = exponentialValue1;
                                    intermediateValue179 = exponentialValue2;
                                    intermediateValue181 = exponentialValue3;
                                }
                                uint intermediateValue183 = intermediateValue173.CommittedStatus();
                                bool comparisonValue44 = intermediateValue183 == 1u;
                                float comparisonValue35 = comparisonValue44 ? 0.0f : intermediateValue177;
                                float comparisonValue36 = comparisonValue44 ? 0.0f : intermediateValue179;
                                float comparisonValue37 = comparisonValue44 ? 0.0f : intermediateValue181;
                                float branchMergedValue79;
                                float branchMergedValue80;
                                float branchMergedValue81;
                                if (dot(float3(comparisonValue35, comparisonValue36, comparisonValue37), 1.0f.xxx) > 0.00999999977648258209228515625f)
                                {
                                    RayDesc _8ident = {float3(sumValue151, mad(viewCbConstants[53u].y, intermediateValue163, reinterpretedBits26), sumValue152), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                                    intermediateValue197.TraceRayInline(SceneBVH, 512u, 22u, _8ident);
                                    bool intermediateValue198 = intermediateValue197.Proceed();
                                    float intermediateValue213;
                                    float intermediateValue215;
                                    float intermediateValue217;
                                    if (intermediateValue198)
                                    {
                                        float intermediateValue214;
                                        float intermediateValue216;
                                        float intermediateValue218;
                                        float intermediateValue232 = comparisonValue35;
                                        float intermediateValue233 = comparisonValue36;
                                        float intermediateValue234 = comparisonValue37;
                                        bool comparisonValue57;
                                        for (;;)
                                        {
                                            uint intermediateValue235 = intermediateValue197.CandidateType();
                                            comparisonValue57 = intermediateValue235 == 0u;
                                            float branchMergedValue2;
                                            float branchMergedValue7;
                                            float branchMergedValue8;
                                            if (comparisonValue57)
                                            {
                                                float2 intermediateValue239 = intermediateValue197.CandidateTriangleBarycentrics();
                                                float2 intermediateValue240 = intermediateValue197.CandidateTriangleBarycentrics();
                                                float intermediateValue241 = intermediateValue197.CandidateTriangleRayT();
                                                uint intermediateValue242 = intermediateValue197.CandidatePrimitiveIndex();
                                                uint intermediateValue243 = intermediateValue197.CandidateInstanceID();
                                                uint intermediateValue244 = intermediateValue197.CandidateInstanceIndex();
                                                uint productValue312 = (intermediateValue244 * 76u) + 58u;
                                                uint productValue313 = (intermediateValue244 * 76u) + 61u;
                                                precise float sumValue207 = 1.0f - intermediateValue239.x;
                                                precise float sumValue208 = sumValue207 - intermediateValue240.y;
                                                uint bitwiseValue101 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue244 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue242 >> 1u);
                                                uint productValue314 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue244 * 76u) + 54u) * 2 + 0)) + 0u;
                                                bool comparisonValue58 = (intermediateValue242 & 1u) == 0u;
                                                uint comparisonValue59 = comparisonValue58 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue314), bitwiseValue101 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue314), bitwiseValue101 * 16 + 0).x;
                                                uint comparisonValue60 = comparisonValue58 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue314), bitwiseValue101 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue314), bitwiseValue101 * 16 + 0).w;
                                                uint comparisonValue61 = comparisonValue58 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue314), bitwiseValue101 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue314), bitwiseValue101 * 16 + 0).z;
                                                bool productValue315 = rdByteLoad_objectInstances_uint16_t(0u, productValue313 * 2 + 0) < 0u;
                                                float intermediateValue256;
                                                float intermediateValue257;
                                                if (productValue315)
                                                {
                                                    uint bitwiseValue109 = comparisonValue61 >> 15u;
                                                    precise float bitwiseValue110 = float(bitwiseValue109 & 1u) * 2.0f;
                                                    precise float sumValue219 = bitwiseValue110 + (-1.0f);
                                                    precise float bitwiseValue111 = float(comparisonValue61 >> 31u) * 2.0f;
                                                    precise float sumValue220 = bitwiseValue111 + (-1.0f);
                                                    precise float bitwiseValue112 = float((comparisonValue61 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue113 = float(bitwiseValue109 & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue326 = sumValue219 * 3.0517578125e-05f;
                                                    precise float productValue327 = sumValue220 * 3.0517578125e-05f;
                                                    precise float sumValue221 = bitwiseValue112 + productValue326;
                                                    precise float sumValue222 = bitwiseValue113 + productValue327;
                                                    intermediateValue256 = sumValue221;
                                                    intermediateValue257 = sumValue222;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue114 = float(comparisonValue61 & 65535u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue115 = float(comparisonValue61 >> 16u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue328 = bitwiseValue114 * 16384.0f;
                                                    precise float sumValue223 = productValue328 + 0.5f;
                                                    precise float productValue329 = bitwiseValue115 * 16384.0f;
                                                    precise float sumValue224 = productValue329 + 0.5f;
                                                    precise float productValue330 = floor(sumValue223) * 6.103515625e-05f;
                                                    precise float productValue331 = floor(sumValue224) * 6.103515625e-05f;
                                                    intermediateValue256 = productValue330;
                                                    intermediateValue257 = productValue331;
                                                }
                                                precise float productValue340 = sumValue208 * intermediateValue256;
                                                precise float productValue341 = sumValue208 * intermediateValue257;
                                                precise float sumValue233 = productValue340 + 0.0f;
                                                precise float sumValue234 = productValue341 + 0.0f;
                                                float intermediateValue262;
                                                float intermediateValue263;
                                                if (productValue315)
                                                {
                                                    uint bitwiseValue130 = comparisonValue60 >> 15u;
                                                    precise float bitwiseValue131 = float(bitwiseValue130 & 1u) * 2.0f;
                                                    precise float sumValue243 = bitwiseValue131 + (-1.0f);
                                                    precise float bitwiseValue132 = float(comparisonValue60 >> 31u) * 2.0f;
                                                    precise float sumValue244 = bitwiseValue132 + (-1.0f);
                                                    precise float bitwiseValue133 = float((comparisonValue60 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue134 = float(bitwiseValue130 & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue350 = sumValue243 * 3.0517578125e-05f;
                                                    precise float productValue351 = sumValue244 * 3.0517578125e-05f;
                                                    precise float sumValue245 = bitwiseValue133 + productValue350;
                                                    precise float sumValue246 = bitwiseValue134 + productValue351;
                                                    intermediateValue262 = sumValue245;
                                                    intermediateValue263 = sumValue246;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue135 = float(comparisonValue60 & 65535u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue136 = float(comparisonValue60 >> 16u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue352 = bitwiseValue135 * 16384.0f;
                                                    precise float sumValue247 = productValue352 + 0.5f;
                                                    precise float productValue353 = bitwiseValue136 * 16384.0f;
                                                    precise float sumValue248 = productValue353 + 0.5f;
                                                    precise float productValue354 = floor(sumValue247) * 6.103515625e-05f;
                                                    precise float productValue355 = floor(sumValue248) * 6.103515625e-05f;
                                                    intermediateValue262 = productValue354;
                                                    intermediateValue263 = productValue355;
                                                }
                                                precise float productValue365 = intermediateValue239.x * intermediateValue262;
                                                precise float productValue366 = intermediateValue239.x * intermediateValue263;
                                                precise float sumValue258 = sumValue233 + productValue365;
                                                precise float sumValue259 = sumValue234 + productValue366;
                                                float intermediateValue274;
                                                float intermediateValue275;
                                                if (productValue315)
                                                {
                                                    uint bitwiseValue144 = comparisonValue59 >> 15u;
                                                    precise float bitwiseValue145 = float(bitwiseValue144 & 1u) * 2.0f;
                                                    precise float sumValue263 = bitwiseValue145 + (-1.0f);
                                                    precise float bitwiseValue146 = float(comparisonValue59 >> 31u) * 2.0f;
                                                    precise float sumValue264 = bitwiseValue146 + (-1.0f);
                                                    precise float bitwiseValue147 = float((comparisonValue59 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue148 = float(bitwiseValue144 & 65534u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue370 = sumValue263 * 3.0517578125e-05f;
                                                    precise float productValue371 = sumValue264 * 3.0517578125e-05f;
                                                    precise float sumValue265 = bitwiseValue147 + productValue370;
                                                    precise float sumValue266 = bitwiseValue148 + productValue371;
                                                    intermediateValue274 = sumValue265;
                                                    intermediateValue275 = sumValue266;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue149 = float(comparisonValue59 & 65535u) * 1.525902189314365386962890625e-05f;
                                                    precise float bitwiseValue150 = float(comparisonValue59 >> 16u) * 1.525902189314365386962890625e-05f;
                                                    precise float productValue372 = bitwiseValue149 * 16384.0f;
                                                    precise float sumValue267 = productValue372 + 0.5f;
                                                    precise float productValue373 = bitwiseValue150 * 16384.0f;
                                                    precise float sumValue268 = productValue373 + 0.5f;
                                                    precise float productValue374 = floor(sumValue267) * 6.103515625e-05f;
                                                    precise float productValue375 = floor(sumValue268) * 6.103515625e-05f;
                                                    intermediateValue274 = productValue374;
                                                    intermediateValue275 = productValue375;
                                                }
                                                precise float productValue376 = intermediateValue240.y * intermediateValue274;
                                                precise float productValue377 = intermediateValue240.y * intermediateValue275;
                                                precise float sumValue270 = sumValue258 + productValue376;
                                                precise float sumValue271 = sumValue259 + productValue377;
                                                precise float productValue378 = intermediateValue241 * 0.083333335816860198974609375f;
                                                precise float sumValue272 = productValue378 + (-0.25f);
                                                float intermediateValue279;
                                                float intermediateValue280;
                                                float intermediateValue281;
                                                float intermediateValue282;
                                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue312 * 2 + 0) == 65535u)
                                                {
                                                    intermediateValue279 = 1.0f;
                                                    intermediateValue280 = 1.0f;
                                                    intermediateValue281 = 1.0f;
                                                    intermediateValue282 = 1.0f;
                                                }
                                                else
                                                {
                                                    uint reinterpretedBits34;
                                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue312 * 2 + 0) > 4095u)
                                                    {
                                                        reinterpretedBits34 = asuint(viewCbConstants[98u]).w;
                                                    }
                                                    else
                                                    {
                                                        reinterpretedBits34 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue312 * 2 + 0));
                                                    }
                                                    float4 sampledTextureValue11 = textures[NonUniformResourceIndex(reinterpretedBits34 + 0u)].SampleLevel(defaultSampler, float2(sumValue270, sumValue271), min(sumValue272, 2.0f));
                                                    intermediateValue279 = sampledTextureValue11.x;
                                                    intermediateValue280 = sampledTextureValue11.y;
                                                    intermediateValue281 = sampledTextureValue11.z;
                                                    intermediateValue282 = sampledTextureValue11.w;
                                                }
                                                float intermediateValue290;
                                                float intermediateValue291;
                                                float intermediateValue292;
                                                if (intermediateValue243 == 2u)
                                                {
                                                    float branchMergedValue28;
                                                    float branchMergedValue57;
                                                    float branchMergedValue58;
                                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue313 * 2 + 0) & 128u) == 0u)
                                                    {
                                                        float intermediateValue293;
                                                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue313 * 2 + 0) & 2048u) == 0u)
                                                        {
                                                            intermediateValue293 = intermediateValue282;
                                                        }
                                                        else
                                                        {
                                                            precise float productValue399 = intermediateValue282 * 2.0f;
                                                            precise float sumValue295 = productValue399 + (-1.0f);
                                                            intermediateValue293 = clamp(sumValue295, 0.0f, 1.0f);
                                                        }
                                                        precise float sumValue292 = 0.0f - intermediateValue279;
                                                        precise float sumValue293 = 0.0f - intermediateValue280;
                                                        precise float sumValue294 = 0.0f - intermediateValue281;
                                                        precise float productValue396 = sumValue292 * intermediateValue293;
                                                        precise float productValue397 = sumValue293 * intermediateValue293;
                                                        precise float productValue398 = sumValue294 * intermediateValue293;
                                                        precise float sumValue289 = intermediateValue279 + productValue396;
                                                        precise float sumValue290 = intermediateValue280 + productValue397;
                                                        precise float sumValue291 = intermediateValue281 + productValue398;
                                                        branchMergedValue28 = sumValue291;
                                                        branchMergedValue57 = sumValue290;
                                                        branchMergedValue58 = sumValue289;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue28 = 0.33399999141693115234375f;
                                                        branchMergedValue57 = 0.33399999141693115234375f;
                                                        branchMergedValue58 = 0.33399999141693115234375f;
                                                    }
                                                    intermediateValue290 = branchMergedValue58;
                                                    intermediateValue291 = branchMergedValue57;
                                                    intermediateValue292 = branchMergedValue28;
                                                }
                                                else
                                                {
                                                    precise float sumValue284 = 1.0f - intermediateValue282;
                                                    intermediateValue290 = sumValue284;
                                                    intermediateValue291 = sumValue284;
                                                    intermediateValue292 = sumValue284;
                                                }
                                                precise float productValue393 = intermediateValue232 * intermediateValue290;
                                                precise float productValue394 = intermediateValue233 * intermediateValue291;
                                                precise float productValue395 = intermediateValue234 * intermediateValue292;
                                                float intermediateValue245;
                                                float intermediateValue246;
                                                float intermediateValue247;
                                                bool intermediateValue294;
                                                if (!(dot(float3(productValue393, productValue394, productValue395), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                                {
                                                    intermediateValue294 = false;
                                                    intermediateValue245 = productValue393;
                                                    intermediateValue246 = productValue394;
                                                    intermediateValue247 = productValue395;
                                                }
                                                else
                                                {
                                                    intermediateValue294 = true;
                                                    intermediateValue245 = 0.0f;
                                                    intermediateValue246 = 0.0f;
                                                    intermediateValue247 = 0.0f;
                                                }
                                                float branchMergedValue61;
                                                float branchMergedValue66;
                                                float branchMergedValue67;
                                                if (intermediateValue294)
                                                {
                                                    intermediateValue197.CommitNonOpaqueTriangleHit();
                                                    branchMergedValue61 = intermediateValue245;
                                                    branchMergedValue66 = intermediateValue247;
                                                    branchMergedValue67 = intermediateValue246;
                                                }
                                                else
                                                {
                                                    branchMergedValue61 = intermediateValue245;
                                                    branchMergedValue66 = intermediateValue247;
                                                    branchMergedValue67 = intermediateValue246;
                                                }
                                                branchMergedValue2 = branchMergedValue61;
                                                branchMergedValue7 = branchMergedValue66;
                                                branchMergedValue8 = branchMergedValue67;
                                            }
                                            else
                                            {
                                                branchMergedValue2 = intermediateValue232;
                                                branchMergedValue7 = intermediateValue234;
                                                branchMergedValue8 = intermediateValue233;
                                            }
                                            intermediateValue214 = branchMergedValue2;
                                            intermediateValue218 = branchMergedValue7;
                                            intermediateValue216 = branchMergedValue8;
                                            bool intermediateValue248 = intermediateValue197.Proceed();
                                            if (intermediateValue248)
                                            {
                                                intermediateValue232 = intermediateValue214;
                                                intermediateValue233 = intermediateValue216;
                                                intermediateValue234 = intermediateValue218;
                                                continue;
                                            }
                                            else
                                            {
                                                break;
                                            }
                                        }
                                        intermediateValue213 = intermediateValue214;
                                        intermediateValue215 = intermediateValue216;
                                        intermediateValue217 = intermediateValue218;
                                    }
                                    else
                                    {
                                        intermediateValue213 = comparisonValue35;
                                        intermediateValue215 = comparisonValue36;
                                        intermediateValue217 = comparisonValue37;
                                    }
                                    uint intermediateValue219 = intermediateValue197.CommittedStatus();
                                    bool comparisonValue52 = intermediateValue219 == 1u;
                                    branchMergedValue79 = comparisonValue52 ? 0.0f : intermediateValue213;
                                    branchMergedValue80 = comparisonValue52 ? 0.0f : intermediateValue217;
                                    branchMergedValue81 = comparisonValue52 ? 0.0f : intermediateValue215;
                                }
                                else
                                {
                                    branchMergedValue79 = comparisonValue35;
                                    branchMergedValue80 = comparisonValue37;
                                    branchMergedValue81 = comparisonValue36;
                                }
                                branchMergedValue17 = branchMergedValue79;
                                branchMergedValue51 = branchMergedValue80;
                                branchMergedValue52 = branchMergedValue81;
                            }
                            else
                            {
                                RayDesc _9ident = {float3(reinterpretedBits25, reinterpretedBits26, reinterpretedBits27), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                                intermediateValue175.TraceRayInline(SceneBVH, 512u, 22u, _9ident);
                                bool intermediateValue176 = intermediateValue175.Proceed();
                                float intermediateValue184;
                                float intermediateValue186;
                                float intermediateValue188;
                                if (intermediateValue176)
                                {
                                    float intermediateValue185;
                                    float intermediateValue187;
                                    float intermediateValue189;
                                    float intermediateValue199 = 1.0f;
                                    float intermediateValue200 = 1.0f;
                                    float intermediateValue201 = 1.0f;
                                    bool comparisonValue47;
                                    for (;;)
                                    {
                                        uint intermediateValue202 = intermediateValue175.CandidateType();
                                        comparisonValue47 = intermediateValue202 == 0u;
                                        float branchMergedValue1;
                                        float branchMergedValue5;
                                        float branchMergedValue6;
                                        if (comparisonValue47)
                                        {
                                            float2 intermediateValue220 = intermediateValue175.CandidateTriangleBarycentrics();
                                            float2 intermediateValue221 = intermediateValue175.CandidateTriangleBarycentrics();
                                            float intermediateValue222 = intermediateValue175.CandidateTriangleRayT();
                                            uint intermediateValue223 = intermediateValue175.CandidatePrimitiveIndex();
                                            uint intermediateValue224 = intermediateValue175.CandidateInstanceID();
                                            uint intermediateValue225 = intermediateValue175.CandidateInstanceIndex();
                                            uint productValue285 = (intermediateValue225 * 76u) + 58u;
                                            uint productValue286 = (intermediateValue225 * 76u) + 61u;
                                            precise float sumValue183 = 1.0f - intermediateValue220.x;
                                            precise float sumValue184 = sumValue183 - intermediateValue221.y;
                                            uint bitwiseValue79 = (rdByteLoad_objectInstances_uint(0u, ((intermediateValue225 * 38u) + 25u) * 4 + 0) >> 2u) + (intermediateValue223 >> 1u);
                                            uint productValue287 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((intermediateValue225 * 76u) + 54u) * 2 + 0)) + 0u;
                                            bool comparisonValue53 = (intermediateValue223 & 1u) == 0u;
                                            uint comparisonValue54 = comparisonValue53 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue287), bitwiseValue79 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue287), bitwiseValue79 * 16 + 0).x;
                                            uint comparisonValue55 = comparisonValue53 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue287), bitwiseValue79 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue287), bitwiseValue79 * 16 + 0).w;
                                            uint comparisonValue56 = comparisonValue53 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue287), bitwiseValue79 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue287), bitwiseValue79 * 16 + 0).z;
                                            bool productValue288 = rdByteLoad_objectInstances_uint16_t(0u, productValue286 * 2 + 0) < 0u;
                                            float intermediateValue249;
                                            float intermediateValue250;
                                            if (productValue288)
                                            {
                                                uint bitwiseValue87 = comparisonValue56 >> 15u;
                                                precise float bitwiseValue88 = float(bitwiseValue87 & 1u) * 2.0f;
                                                precise float sumValue193 = bitwiseValue88 + (-1.0f);
                                                precise float bitwiseValue89 = float(comparisonValue56 >> 31u) * 2.0f;
                                                precise float sumValue194 = bitwiseValue89 + (-1.0f);
                                                precise float bitwiseValue90 = float((comparisonValue56 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue91 = float(bitwiseValue87 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue297 = sumValue193 * 3.0517578125e-05f;
                                                precise float productValue298 = sumValue194 * 3.0517578125e-05f;
                                                precise float sumValue195 = bitwiseValue90 + productValue297;
                                                precise float sumValue196 = bitwiseValue91 + productValue298;
                                                intermediateValue249 = sumValue195;
                                                intermediateValue250 = sumValue196;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue92 = float(comparisonValue56 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue93 = float(comparisonValue56 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue299 = bitwiseValue92 * 16384.0f;
                                                precise float sumValue197 = productValue299 + 0.5f;
                                                precise float productValue300 = bitwiseValue93 * 16384.0f;
                                                precise float sumValue198 = productValue300 + 0.5f;
                                                precise float productValue301 = floor(sumValue197) * 6.103515625e-05f;
                                                precise float productValue302 = floor(sumValue198) * 6.103515625e-05f;
                                                intermediateValue249 = productValue301;
                                                intermediateValue250 = productValue302;
                                            }
                                            precise float productValue316 = sumValue184 * intermediateValue249;
                                            precise float productValue317 = sumValue184 * intermediateValue250;
                                            precise float sumValue209 = productValue316 + 0.0f;
                                            precise float sumValue210 = productValue317 + 0.0f;
                                            float intermediateValue258;
                                            float intermediateValue259;
                                            if (productValue288)
                                            {
                                                uint bitwiseValue116 = comparisonValue55 >> 15u;
                                                precise float bitwiseValue117 = float(bitwiseValue116 & 1u) * 2.0f;
                                                precise float sumValue225 = bitwiseValue117 + (-1.0f);
                                                precise float bitwiseValue118 = float(comparisonValue55 >> 31u) * 2.0f;
                                                precise float sumValue226 = bitwiseValue118 + (-1.0f);
                                                precise float bitwiseValue119 = float((comparisonValue55 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue120 = float(bitwiseValue116 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue332 = sumValue225 * 3.0517578125e-05f;
                                                precise float productValue333 = sumValue226 * 3.0517578125e-05f;
                                                precise float sumValue227 = bitwiseValue119 + productValue332;
                                                precise float sumValue228 = bitwiseValue120 + productValue333;
                                                intermediateValue258 = sumValue227;
                                                intermediateValue259 = sumValue228;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue121 = float(comparisonValue55 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue122 = float(comparisonValue55 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue334 = bitwiseValue121 * 16384.0f;
                                                precise float sumValue229 = productValue334 + 0.5f;
                                                precise float productValue335 = bitwiseValue122 * 16384.0f;
                                                precise float sumValue230 = productValue335 + 0.5f;
                                                precise float productValue336 = floor(sumValue229) * 6.103515625e-05f;
                                                precise float productValue337 = floor(sumValue230) * 6.103515625e-05f;
                                                intermediateValue258 = productValue336;
                                                intermediateValue259 = productValue337;
                                            }
                                            precise float productValue342 = intermediateValue220.x * intermediateValue258;
                                            precise float productValue343 = intermediateValue220.x * intermediateValue259;
                                            precise float sumValue235 = sumValue209 + productValue342;
                                            precise float sumValue236 = sumValue210 + productValue343;
                                            float intermediateValue264;
                                            float intermediateValue265;
                                            if (productValue288)
                                            {
                                                uint bitwiseValue137 = comparisonValue54 >> 15u;
                                                precise float bitwiseValue138 = float(bitwiseValue137 & 1u) * 2.0f;
                                                precise float sumValue249 = bitwiseValue138 + (-1.0f);
                                                precise float bitwiseValue139 = float(comparisonValue54 >> 31u) * 2.0f;
                                                precise float sumValue250 = bitwiseValue139 + (-1.0f);
                                                precise float bitwiseValue140 = float((comparisonValue54 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue141 = float(bitwiseValue137 & 65534u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue356 = sumValue249 * 3.0517578125e-05f;
                                                precise float productValue357 = sumValue250 * 3.0517578125e-05f;
                                                precise float sumValue251 = bitwiseValue140 + productValue356;
                                                precise float sumValue252 = bitwiseValue141 + productValue357;
                                                intermediateValue264 = sumValue251;
                                                intermediateValue265 = sumValue252;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue142 = float(comparisonValue54 & 65535u) * 1.525902189314365386962890625e-05f;
                                                precise float bitwiseValue143 = float(comparisonValue54 >> 16u) * 1.525902189314365386962890625e-05f;
                                                precise float productValue358 = bitwiseValue142 * 16384.0f;
                                                precise float sumValue253 = productValue358 + 0.5f;
                                                precise float productValue359 = bitwiseValue143 * 16384.0f;
                                                precise float sumValue254 = productValue359 + 0.5f;
                                                precise float productValue360 = floor(sumValue253) * 6.103515625e-05f;
                                                precise float productValue361 = floor(sumValue254) * 6.103515625e-05f;
                                                intermediateValue264 = productValue360;
                                                intermediateValue265 = productValue361;
                                            }
                                            precise float productValue367 = intermediateValue221.y * intermediateValue264;
                                            precise float productValue368 = intermediateValue221.y * intermediateValue265;
                                            precise float sumValue260 = sumValue235 + productValue367;
                                            precise float sumValue261 = sumValue236 + productValue368;
                                            precise float productValue369 = intermediateValue222 * 0.083333335816860198974609375f;
                                            precise float sumValue262 = productValue369 + (-0.25f);
                                            float intermediateValue270;
                                            float intermediateValue271;
                                            float intermediateValue272;
                                            float intermediateValue273;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue285 * 2 + 0) == 65535u)
                                            {
                                                intermediateValue270 = 1.0f;
                                                intermediateValue271 = 1.0f;
                                                intermediateValue272 = 1.0f;
                                                intermediateValue273 = 1.0f;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits33;
                                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue285 * 2 + 0) > 4095u)
                                                {
                                                    reinterpretedBits33 = asuint(viewCbConstants[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits33 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue285 * 2 + 0));
                                                }
                                                float4 sampledTextureValue10 = textures[NonUniformResourceIndex(reinterpretedBits33 + 0u)].SampleLevel(defaultSampler, float2(sumValue260, sumValue261), min(sumValue262, 2.0f));
                                                intermediateValue270 = sampledTextureValue10.x;
                                                intermediateValue271 = sampledTextureValue10.y;
                                                intermediateValue272 = sampledTextureValue10.z;
                                                intermediateValue273 = sampledTextureValue10.w;
                                            }
                                            float intermediateValue283;
                                            float intermediateValue284;
                                            float intermediateValue285;
                                            if (intermediateValue224 == 2u)
                                            {
                                                float branchMergedValue27;
                                                float branchMergedValue55;
                                                float branchMergedValue56;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue286 * 2 + 0) & 128u) == 0u)
                                                {
                                                    float intermediateValue288;
                                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue286 * 2 + 0) & 2048u) == 0u)
                                                    {
                                                        intermediateValue288 = intermediateValue273;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue392 = intermediateValue273 * 2.0f;
                                                        precise float sumValue288 = productValue392 + (-1.0f);
                                                        intermediateValue288 = clamp(sumValue288, 0.0f, 1.0f);
                                                    }
                                                    precise float sumValue285 = 0.0f - intermediateValue270;
                                                    precise float sumValue286 = 0.0f - intermediateValue271;
                                                    precise float sumValue287 = 0.0f - intermediateValue272;
                                                    precise float productValue389 = sumValue285 * intermediateValue288;
                                                    precise float productValue390 = sumValue286 * intermediateValue288;
                                                    precise float productValue391 = sumValue287 * intermediateValue288;
                                                    precise float sumValue277 = intermediateValue270 + productValue389;
                                                    precise float sumValue278 = intermediateValue271 + productValue390;
                                                    precise float sumValue279 = intermediateValue272 + productValue391;
                                                    branchMergedValue27 = sumValue279;
                                                    branchMergedValue55 = sumValue278;
                                                    branchMergedValue56 = sumValue277;
                                                }
                                                else
                                                {
                                                    branchMergedValue27 = 0.33399999141693115234375f;
                                                    branchMergedValue55 = 0.33399999141693115234375f;
                                                    branchMergedValue56 = 0.33399999141693115234375f;
                                                }
                                                intermediateValue283 = branchMergedValue56;
                                                intermediateValue284 = branchMergedValue55;
                                                intermediateValue285 = branchMergedValue27;
                                            }
                                            else
                                            {
                                                precise float sumValue273 = 1.0f - intermediateValue273;
                                                intermediateValue283 = sumValue273;
                                                intermediateValue284 = sumValue273;
                                                intermediateValue285 = sumValue273;
                                            }
                                            precise float productValue382 = intermediateValue199 * intermediateValue283;
                                            precise float productValue383 = intermediateValue200 * intermediateValue284;
                                            precise float productValue384 = intermediateValue201 * intermediateValue285;
                                            float intermediateValue226;
                                            float intermediateValue227;
                                            float intermediateValue228;
                                            bool intermediateValue289;
                                            if (!(dot(float3(productValue382, productValue383, productValue384), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                            {
                                                intermediateValue289 = false;
                                                intermediateValue226 = productValue382;
                                                intermediateValue227 = productValue383;
                                                intermediateValue228 = productValue384;
                                            }
                                            else
                                            {
                                                intermediateValue289 = true;
                                                intermediateValue226 = 0.0f;
                                                intermediateValue227 = 0.0f;
                                                intermediateValue228 = 0.0f;
                                            }
                                            float branchMergedValue60;
                                            float branchMergedValue64;
                                            float branchMergedValue65;
                                            if (intermediateValue289)
                                            {
                                                intermediateValue175.CommitNonOpaqueTriangleHit();
                                                branchMergedValue60 = intermediateValue228;
                                                branchMergedValue64 = intermediateValue227;
                                                branchMergedValue65 = intermediateValue226;
                                            }
                                            else
                                            {
                                                branchMergedValue60 = intermediateValue228;
                                                branchMergedValue64 = intermediateValue227;
                                                branchMergedValue65 = intermediateValue226;
                                            }
                                            branchMergedValue1 = branchMergedValue60;
                                            branchMergedValue5 = branchMergedValue64;
                                            branchMergedValue6 = branchMergedValue65;
                                        }
                                        else
                                        {
                                            branchMergedValue1 = intermediateValue201;
                                            branchMergedValue5 = intermediateValue200;
                                            branchMergedValue6 = intermediateValue199;
                                        }
                                        intermediateValue189 = branchMergedValue1;
                                        intermediateValue187 = branchMergedValue5;
                                        intermediateValue185 = branchMergedValue6;
                                        bool intermediateValue229 = intermediateValue175.Proceed();
                                        if (intermediateValue229)
                                        {
                                            intermediateValue199 = intermediateValue185;
                                            intermediateValue200 = intermediateValue187;
                                            intermediateValue201 = intermediateValue189;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue184 = intermediateValue185;
                                    intermediateValue186 = intermediateValue187;
                                    intermediateValue188 = intermediateValue189;
                                }
                                else
                                {
                                    intermediateValue184 = 1.0f;
                                    intermediateValue186 = 1.0f;
                                    intermediateValue188 = 1.0f;
                                }
                                uint intermediateValue190 = intermediateValue175.CommittedStatus();
                                bool comparisonValue45 = intermediateValue190 == 1u;
                                branchMergedValue17 = comparisonValue45 ? 0.0f : intermediateValue184;
                                branchMergedValue51 = comparisonValue45 ? 0.0f : intermediateValue188;
                                branchMergedValue52 = comparisonValue45 ? 0.0f : intermediateValue186;
                            }
                            intermediateValue155 = branchMergedValue17;
                            intermediateValue156 = branchMergedValue52;
                            intermediateValue157 = branchMergedValue51;
                        }
                        float productValue238;
                        float productValue239;
                        float productValue240;
                        if (dot(float3(intermediateValue155, intermediateValue156, intermediateValue157), 1.0f.xxx) > 0.0f)
                        {
                            float sumValue141 = (-0.0f) - intermediateValue29;
                            float sumValue142 = (-0.0f) - intermediateValue30;
                            float sumValue143 = (-0.0f) - intermediateValue31;
                            float clampedValue = max((((1.0f - intermediateValue135) * 0.5f) * clamp(intermediateValue135 * 1.5f, 0.0f, 1.0f)) + intermediateValue135, 0.00999999977648258209228515625f);
                            float sumValue144 = viewCbConstants[52u].x - intermediateValue29;
                            float sumValue145 = viewCbConstants[52u].y - intermediateValue30;
                            float sumValue146 = viewCbConstants[52u].z - intermediateValue31;
                            float inverseLengthValue7 = rsqrt(dot(float3(sumValue144, sumValue145, sumValue146), float3(sumValue144, sumValue145, sumValue146)));
                            float productValue227 = inverseLengthValue7 * sumValue144;
                            float productValue228 = inverseLengthValue7 * sumValue145;
                            float productValue229 = inverseLengthValue7 * sumValue146;
                            float clampedValue1 = clamp(dot(float3(comparisonValue32, comparisonValue33, comparisonValue34), float3(viewCbConstants[52u].xyz)), 0.0f, 1.0f);
                            float clampedValue2 = clamp(dot(float3(comparisonValue32, comparisonValue33, comparisonValue34), float3(sumValue141, sumValue142, sumValue143)), 0.0f, 1.0f);
                            float clampedValue3 = clamp(dot(float3(comparisonValue32, comparisonValue33, comparisonValue34), float3(productValue227, productValue228, productValue229)), 0.0f, 1.0f);
                            float clampedValue4 = clamp(dot(float3(sumValue141, sumValue142, sumValue143), float3(productValue227, productValue228, productValue229)), 0.0f, 1.0f);
                            float productValue230 = clampedValue * clampedValue;
                            float productValue231 = productValue230 * productValue230;
                            float productValue232 = (((clampedValue3 * productValue231) - clampedValue3) * clampedValue3) + 1.0f;
                            float productValue233 = productValue230 * 0.5f;
                            float sumValue147 = 1.0f - productValue233;
                            float clampedValue5 = clamp(dot(float3(intermediateValue139, intermediateValue140, intermediateValue141), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f, 0.0f, 1.0f);
                            float clampedValue6 = exp2(log2(clamp(1.0f - clampedValue4, 0.0f, 1.0f)) * 5.0f);
                            float productValue234 = (clampedValue6 * (clampedValue5 - intermediateValue139)) + intermediateValue139;
                            float productValue235 = (clampedValue6 * (clampedValue5 - intermediateValue140)) + intermediateValue140;
                            float productValue236 = (clampedValue6 * (clampedValue5 - intermediateValue141)) + intermediateValue141;
                            float productValue237 = ((clampedValue4 * clampedValue4) * (clampedValue * 2.0f)) + (-0.5f);
                            float clampedValue7 = (((exp2(log2(clamp(1.0f - clampedValue2, 0.0f, 1.0f)) * 5.0f) * productValue237) + 1.0f) * 0.3183098733425140380859375f) * ((exp2(log2(clamp(1.0f - clampedValue1, 0.0f, 1.0f)) * 5.0f) * productValue237) + 1.0f);
                            float quotientValue6 = ((productValue231 / ((productValue232 * productValue232) + 1.0000000133514319600180897396058e-10f)) * 0.3183098733425140380859375f) * (0.25f / ((((clampedValue2 * sumValue147) + productValue233) * ((clampedValue1 * sumValue147) + productValue233)) + 1.0000000133514319600180897396058e-10f));
                            productValue238 = (((viewCbConstants[50u].x * intermediateValue155) * clampedValue1) * ((((1.0f - productValue234) * productValue215) * clampedValue7) + (productValue234 * quotientValue6))) + productValue218;
                            productValue239 = (((viewCbConstants[50u].y * intermediateValue156) * clampedValue1) * ((((1.0f - productValue235) * productValue216) * clampedValue7) + (productValue235 * quotientValue6))) + productValue219;
                            productValue240 = (((viewCbConstants[50u].z * intermediateValue157) * clampedValue1) * ((((1.0f - productValue236) * productValue217) * clampedValue7) + (productValue236 * quotientValue6))) + productValue220;
                        }
                        else
                        {
                            productValue238 = productValue218;
                            productValue239 = productValue219;
                            productValue240 = productValue220;
                        }
                        precise float productValue241 = intermediateValue74 * productValue240;
                        precise float productValue242 = intermediateValue72 * productValue239;
                        precise float productValue243 = intermediateValue70 * productValue238;
                        float multiplyAddValue2 = clamp(mad(intermediateValue59 + intermediateValue5, viewCbConstants[51u].x, viewCbConstants[51u].y), 0.0f, 1.0f);
                        float sumValue148 = 1.0f - multiplyAddValue2;
                        branchMergedValue68 = intermediateValue59;
                        branchMergedValue70 = multiplyAddValue2;
                        branchMergedValue71 = intermediateValue74;
                        branchMergedValue72 = intermediateValue72;
                        branchMergedValue73 = intermediateValue70;
                        branchMergedValue74 = sumValue148 * productValue241;
                        branchMergedValue75 = sumValue148 * productValue242;
                        branchMergedValue76 = sumValue148 * productValue243;
                    }
                    else
                    {
                        branchMergedValue68 = intermediateValue59;
                        branchMergedValue70 = 1.0f;
                        branchMergedValue71 = intermediateValue74;
                        branchMergedValue72 = intermediateValue72;
                        branchMergedValue73 = intermediateValue70;
                        branchMergedValue74 = intermediateValue144 * intermediateValue74;
                        branchMergedValue75 = intermediateValue143 * intermediateValue72;
                        branchMergedValue76 = intermediateValue142 * intermediateValue70;
                    }
                    branchMergedValue13 = branchMergedValue68;
                    branchMergedValue29 = branchMergedValue70;
                    branchMergedValue30 = branchMergedValue71;
                    branchMergedValue31 = branchMergedValue72;
                    branchMergedValue32 = branchMergedValue73;
                    branchMergedValue33 = branchMergedValue74;
                    branchMergedValue34 = branchMergedValue75;
                    branchMergedValue35 = branchMergedValue76;
                }
                intermediateValue66 = branchMergedValue35;
                intermediateValue67 = branchMergedValue34;
                intermediateValue68 = branchMergedValue33;
                intermediateValue69 = branchMergedValue32;
                intermediateValue71 = branchMergedValue31;
                intermediateValue73 = branchMergedValue30;
                intermediateValue75 = branchMergedValue29;
                intermediateValue41 = branchMergedValue13;
            }
            else
            {
                intermediateValue66 = 0.0f;
                intermediateValue67 = 0.0f;
                intermediateValue68 = 0.0f;
                intermediateValue69 = intermediateValue32;
                intermediateValue71 = intermediateValue32;
                intermediateValue73 = intermediateValue32;
                intermediateValue75 = 1.0f;
                intermediateValue41 = viewCbConstants[51u].z;
            }
            float productValue81;
            float productValue82;
            float productValue83;
            if (intermediateValue75 > 0.0f)
            {
                uint4 reinterpretedBits13 = asuint(viewCbConstants[75u]);
                uint intermediateValue76 = reinterpretedBits13.w;
                float intermediateValue88;
                float intermediateValue89;
                float intermediateValue90;
                if (intermediateValue76 == 1u)
                {
                    intermediateValue88 = viewCbConstants[58u].x;
                    intermediateValue89 = viewCbConstants[58u].y;
                    intermediateValue90 = viewCbConstants[58u].z;
                }
                else
                {
                    float branchMergedValue14;
                    float branchMergedValue36;
                    float branchMergedValue37;
                    if (intermediateValue76 == 2u)
                    {
                        uint4 intermediateValue91 = asuint(viewCbConstants[74u]);
                        uint intermediateValue92 = intermediateValue91.z;
                        uint reinterpretedBits17;
                        if (intermediateValue92 > 4095u)
                        {
                            reinterpretedBits17 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits17 = intermediateValue92;
                        }
                        float intermediateValue95 = abs(intermediateValue29);
                        float intermediateValue96 = abs(intermediateValue30);
                        float intermediateValue97 = abs(intermediateValue31);
                        float intermediateValue113;
                        float comparisonValue30;
                        float sumValue107;
                        if ((intermediateValue95 >= intermediateValue96) && (intermediateValue95 >= intermediateValue97))
                        {
                            intermediateValue113 = intermediateValue95;
                            comparisonValue30 = (intermediateValue29 < 0.0f) ? ((-0.0f) - intermediateValue31) : intermediateValue31;
                            sumValue107 = (-0.0f) - intermediateValue30;
                        }
                        else
                        {
                            float sumValue104 = (-0.0f) - intermediateValue29;
                            float branchMergedValue15;
                            float branchMergedValue38;
                            float branchMergedValue39;
                            if (!(intermediateValue96 >= intermediateValue97))
                            {
                                branchMergedValue15 = (-0.0f) - intermediateValue30;
                                branchMergedValue38 = (intermediateValue31 < 0.0f) ? intermediateValue29 : sumValue104;
                                branchMergedValue39 = intermediateValue97;
                            }
                            else
                            {
                                branchMergedValue15 = (intermediateValue30 < 0.0f) ? ((-0.0f) - intermediateValue31) : intermediateValue31;
                                branchMergedValue38 = sumValue104;
                                branchMergedValue39 = intermediateValue96;
                            }
                            intermediateValue113 = branchMergedValue39;
                            comparisonValue30 = branchMergedValue38;
                            sumValue107 = branchMergedValue15;
                        }
                        precise float quotientValue5 = 0.5f / intermediateValue113;
                        float4 sampledTextureValue2 = textures[NonUniformResourceIndex(reinterpretedBits17 + 0u)].SampleLevel(linearSampler, float2(frac(mad(comparisonValue30, quotientValue5, 0.5f) * viewCbConstants[74u].x), frac(mad(sumValue107, quotientValue5, 0.5f) * viewCbConstants[74u].y)), 0.0f);
                        branchMergedValue14 = (viewCbConstants[58u].z * sampledTextureValue2.z) * viewCbConstants[97u].w;
                        branchMergedValue36 = (viewCbConstants[58u].y * sampledTextureValue2.y) * viewCbConstants[97u].w;
                        branchMergedValue37 = (viewCbConstants[58u].x * sampledTextureValue2.x) * viewCbConstants[97u].w;
                    }
                    else
                    {
                        float branchMergedValue69;
                        float branchMergedValue77;
                        float branchMergedValue78;
                        if (intermediateValue76 == 4u)
                        {
                            float intermediateValue98 = (dot(float3(intermediateValue29, intermediateValue30, intermediateValue31), float3(viewCbConstants[52u].xyz)) * 0.5f) + 0.5f;
                            branchMergedValue69 = ((viewCbConstants[75u].z - viewCbConstants[76u].z) * intermediateValue98) + viewCbConstants[76u].z;
                            branchMergedValue77 = ((viewCbConstants[75u].y - viewCbConstants[76u].y) * intermediateValue98) + viewCbConstants[76u].y;
                            branchMergedValue78 = ((viewCbConstants[75u].x - viewCbConstants[76u].x) * intermediateValue98) + viewCbConstants[76u].x;
                        }
                        else
                        {
                            float comparisonValue29;
                            if (abs(intermediateValue30) < 1.0f)
                            {
                                float quotientValue4 = atan(intermediateValue31 / intermediateValue29);
                                bool intermediateValue100 = intermediateValue29 < 0.0f;
                                bool comparisonValue27 = intermediateValue29 == 0.0f;
                                bool comparisonValue28 = intermediateValue31 >= 0.0f;
                                bool intermediateValue101 = intermediateValue31 < 0.0f;
                                comparisonValue29 = (comparisonValue27 && comparisonValue28) ? 1.57079637050628662109375f : ((comparisonValue27 && intermediateValue101) ? (-1.57079637050628662109375f) : ((intermediateValue100 && intermediateValue101) ? (quotientValue4 + (-3.1415927410125732421875f)) : ((intermediateValue100 && comparisonValue28) ? (quotientValue4 + 3.1415927410125732421875f) : quotientValue4)));
                            }
                            else
                            {
                                comparisonValue29 = 0.0f;
                            }
                            float multiplyAddValue3 = mad(abs((frac((comparisonValue29 - viewCbConstants[50u].w) * 0.15915493667125701904296875f) * 2.0f) + (-1.0f)), 0.984375f, 0.0078125f);
                            float multiplyAddValue4 = mad(0.5f - (asin(intermediateValue30) * 0.3183098733425140380859375f), 0.96875f, 0.015625f);
                            float productValue157 = viewCbConstants[51u].w * 7.0f;
                            float intermediateValue102 = frac(productValue157);
                            uint intermediateValue103 = uint(int(floor(productValue157)));
                            float productValue158 = float(int(intermediateValue103 + 1u)) * 0.125f;
                            float intermediateValue104 = frac(abs(productValue158));
                            float4 sampledTextureValue = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue3, multiplyAddValue4, float(int(intermediateValue103))), 0.0f);
                            float intermediateValue105 = sampledTextureValue.x;
                            float intermediateValue106 = sampledTextureValue.y;
                            float intermediateValue107 = sampledTextureValue.z;
                            float productValue159 = intermediateValue105 * intermediateValue105;
                            float productValue160 = intermediateValue106 * intermediateValue106;
                            float productValue161 = intermediateValue107 * intermediateValue107;
                            float4 sampledTextureValue1 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue3, multiplyAddValue4, float(int(uint(int(((productValue158 >= ((-0.0f) - productValue158)) ? intermediateValue104 : ((-0.0f) - intermediateValue104)) * 8.0f))))), 0.0f);
                            float intermediateValue108 = sampledTextureValue1.x;
                            float intermediateValue109 = sampledTextureValue1.y;
                            float intermediateValue110 = sampledTextureValue1.z;
                            float dotProductValue2 = exp2(log2(max(dot(float3(intermediateValue29, intermediateValue30, intermediateValue31), float3(viewCbConstants[52u].xyz)), 0.0f)) * 7.0f);
                            float productValue162 = dotProductValue2 * 0.0500000007450580596923828125f;
                            float productValue163 = ((((intermediateValue108 * intermediateValue108) - productValue159) * intermediateValue102) + productValue159) + (productValue162 * viewCbConstants[50u].x);
                            float productValue164 = ((((intermediateValue109 * intermediateValue109) - productValue160) * intermediateValue102) + productValue160) + (productValue162 * viewCbConstants[50u].y);
                            float productValue165 = ((((intermediateValue110 * intermediateValue110) - productValue161) * intermediateValue102) + productValue161) + (productValue162 * viewCbConstants[50u].z);
                            float productValue166 = (dotProductValue2 * 0.64999997615814208984375f) + 0.3499999940395355224609375f;
                            branchMergedValue69 = ((((viewCbConstants[58u].z * productValue166) - productValue165) * viewCbConstants[58u].w) + productValue165) * viewCbConstants[97u].w;
                            branchMergedValue77 = ((((viewCbConstants[58u].y * productValue166) - productValue164) * viewCbConstants[58u].w) + productValue164) * viewCbConstants[97u].w;
                            branchMergedValue78 = ((((viewCbConstants[58u].x * productValue166) - productValue163) * viewCbConstants[58u].w) + productValue163) * viewCbConstants[97u].w;
                        }
                        branchMergedValue14 = branchMergedValue69;
                        branchMergedValue36 = branchMergedValue77;
                        branchMergedValue37 = branchMergedValue78;
                    }
                    intermediateValue88 = branchMergedValue37;
                    intermediateValue89 = branchMergedValue36;
                    intermediateValue90 = branchMergedValue14;
                }
                productValue81 = ((intermediateValue75 * intermediateValue69) * intermediateValue88) + intermediateValue66;
                productValue82 = ((intermediateValue75 * intermediateValue71) * intermediateValue89) + intermediateValue67;
                productValue83 = ((intermediateValue75 * intermediateValue73) * intermediateValue90) + intermediateValue68;
            }
            else
            {
                productValue81 = intermediateValue66;
                productValue82 = intermediateValue67;
                productValue83 = intermediateValue68;
            }
            float branchMergedValue11;
            float branchMergedValue22;
            float branchMergedValue23;
            uint branchMergedValue24;
            float branchMergedValue25;
            if (loadedBufferValue4 == 1u)
            {
                branchMergedValue11 = productValue81;
                branchMergedValue22 = productValue82;
                branchMergedValue23 = intermediateValue41;
                branchMergedValue24 = 1u;
                branchMergedValue25 = productValue83;
            }
            else
            {
                uint sumValue86 = loadedBufferValue4 + 63u;
                float productValue137 = min(intermediateValue41, 50.0f) * (-1.44269502162933349609375f);
                branchMergedValue11 = float(half(exp2(productValue137 * viewCbConstants[sumValue86].x))) * productValue81;
                branchMergedValue22 = float(half(exp2(productValue137 * viewCbConstants[sumValue86].y))) * productValue82;
                branchMergedValue23 = intermediateValue41;
                branchMergedValue24 = 1u;
                branchMergedValue25 = float(half(exp2(productValue137 * viewCbConstants[sumValue86].z))) * productValue83;
            }
            intermediateValue40 = branchMergedValue23;
            intermediateValue42 = branchMergedValue11;
            intermediateValue43 = branchMergedValue22;
            intermediateValue44 = branchMergedValue25;
            intermediateValue45 = branchMergedValue24;
        }
        outputBufferReflectionDistance[uint2(bitwiseValue2, bitwiseValue3)] = ((intermediateValue45 != 0u) ? (intermediateValue40 / float(int(intermediateValue45))) : 0.0f).xxxx;
        float productValue84 = intermediateValue42 * reinterpretedBits1;
        float productValue85 = intermediateValue43 * reinterpretedBits1;
        float productValue86 = intermediateValue44 * reinterpretedBits1;
        if (asuint(viewCbConstants[92u]).z == 0u)
        {
            uint reinterpretedBits7 = asuint(productValue84) & 2147483647u;
            uint reinterpretedBits8 = asuint(productValue85) & 2147483647u;
            uint reinterpretedBits9 = asuint(productValue86) & 2147483647u;
            if (!((((reinterpretedBits7 > 2139095040u) || (reinterpretedBits8 > 2139095040u)) || (reinterpretedBits9 > 2139095040u)) || (((reinterpretedBits7 == 2139095040u) || (reinterpretedBits8 == 2139095040u)) || (reinterpretedBits9 == 2139095040u))))
            {
                outputBufferIndirectSpecular[uint2(bitwiseValue2, bitwiseValue3)] = float4(productValue84, productValue85, productValue86, 1.0f).x;
            }
        }
        else
        {
            float4 intermediateValue48 = outputBufferIndirectSpecular[uint2(bitwiseValue2, bitwiseValue3)].xxxx;
            bool comparisonValue16 = intermediateValue48.w != 0.0f;
            float comparisonValue17 = comparisonValue16 ? (intermediateValue48.x + productValue84) : productValue84;
            float comparisonValue18 = comparisonValue16 ? (intermediateValue48.y + productValue85) : productValue85;
            float comparisonValue19 = comparisonValue16 ? (intermediateValue48.z + productValue86) : productValue86;
            uint reinterpretedBits10 = asuint(comparisonValue17) & 2147483647u;
            uint reinterpretedBits11 = asuint(comparisonValue18) & 2147483647u;
            uint reinterpretedBits12 = asuint(comparisonValue19) & 2147483647u;
            bool comparisonValue20 = ((reinterpretedBits12 > 2139095040u) || ((reinterpretedBits10 > 2139095040u) || (reinterpretedBits11 > 2139095040u))) || ((reinterpretedBits12 == 2139095040u) || ((reinterpretedBits10 == 2139095040u) || (reinterpretedBits11 == 2139095040u)));
            bool intermediateValue50;
            if (comparisonValue20)
            {
                bool branchMergedValue12;
                if (outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)].xxxx.w == 0.0f)
                {
                    outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 1.0f, 0.0f, 1.0f).x;
                    outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
                    branchMergedValue12 = comparisonValue20;
                }
                else
                {
                    branchMergedValue12 = comparisonValue20;
                }
                intermediateValue50 = branchMergedValue12;
            }
            else
            {
                intermediateValue50 = false;
            }
            if (!intermediateValue50)
            {
                outputBufferIndirectSpecular[uint2(bitwiseValue2, bitwiseValue3)] = float4(comparisonValue17, comparisonValue18, comparisonValue19, 1.0f).x;
            }
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
