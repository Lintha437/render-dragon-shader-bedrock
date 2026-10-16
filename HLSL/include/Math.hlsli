// Shared arithmetic and texture-query helpers.
// Each selected overload preserves the recovered operation order and precision.
#if defined(RD_USE_TEXTURE_SIZE_UINT2_0)
uint2 rdTextureSize(Texture2D<float4> textureObject, uint mipLevel, out uint mipLevelCount);
#endif
#if defined(RD_USE_DOT3_PRECISE_FLOAT_1)
float rdDot3Precise(float3 leftVector, float3 rightVector);
#endif
#if defined(RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2)
float rdUnsignedToFloat(uint sourceValue);
#endif
#if defined(RD_USE_DOT2_PRECISE_FLOAT_3)
float rdDot2Precise(float2 leftVector, float2 rightVector);
#endif
#if defined(RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_4)
float rdSignedBitsToFloat(uint sourceValue);
#endif
#if defined(RD_USE_DOT4_PRECISE_FLOAT_5)
float rdDot4Precise(float4 leftVector, float4 rightVector);
#endif
#if defined(RD_USE_BITFIELD_INSERT_UINT_6)
uint rdBitfieldInsert(uint baseValue, uint insertedValue, uint bitOffset, uint bitCount);
#endif
#if defined(RD_USE_BITFIELD_INSERT_UINT2_7)
uint2 rdBitfieldInsert(uint2 baseValue, uint2 insertedValue, uint bitOffset, uint bitCount);
#endif
#if defined(RD_USE_BITFIELD_INSERT_UINT3_8)
uint3 rdBitfieldInsert(uint3 baseValue, uint3 insertedValue, uint bitOffset, uint bitCount);
#endif
#if defined(RD_USE_BITFIELD_INSERT_UINT4_9)
uint4 rdBitfieldInsert(uint4 baseValue, uint4 insertedValue, uint bitOffset, uint bitCount);
#endif
#if defined(RD_USE_TEXTURE_SIZE_UINT2_10)
uint2 rdTextureSize(Texture2D<uint4> textureObject, uint mipLevel, out uint mipLevelCount);
#endif
#if defined(RD_USE_BITFIELD_UEXTRACT_UINT_11)
uint rdBitfieldUExtract(uint baseValue, uint bitOffset, uint bitCount);
#endif
#if defined(RD_USE_BITFIELD_UEXTRACT_UINT2_12)
uint2 rdBitfieldUExtract(uint2 baseValue, uint bitOffset, uint bitCount);
#endif
#if defined(RD_USE_BITFIELD_UEXTRACT_UINT3_13)
uint3 rdBitfieldUExtract(uint3 baseValue, uint bitOffset, uint bitCount);
#endif
#if defined(RD_USE_BITFIELD_UEXTRACT_UINT4_14)
uint4 rdBitfieldUExtract(uint4 baseValue, uint bitOffset, uint bitCount);
#endif
#if defined(RD_USE_BITFIELD_SEXTRACT_INT_15)
int rdBitfieldSExtract(int baseValue, int bitOffset, int bitCount);
#endif
#if defined(RD_USE_BITFIELD_SEXTRACT_INT2_16)
int2 rdBitfieldSExtract(int2 baseValue, int bitOffset, int bitCount);
#endif
#if defined(RD_USE_BITFIELD_SEXTRACT_INT3_17)
int3 rdBitfieldSExtract(int3 baseValue, int bitOffset, int bitCount);
#endif
#if defined(RD_USE_BITFIELD_SEXTRACT_INT4_18)
int4 rdBitfieldSExtract(int4 baseValue, int bitOffset, int bitCount);
#endif
#if defined(RD_USE_DIVIDE_UNSIGNED_UINT_19)
uint rdDivideUnsigned(uint numerator, uint denominator);
#endif
#if defined(RD_USE_MODULO_UNSIGNED_UINT_20)
uint rdModuloUnsigned(uint numerator, uint denominator);
#endif
#if defined(RD_USE_PACK_HALF2X16_UINT_21)
uint rdPackHalf2x16(float2 sourceValue);
#endif
#if defined(RD_USE_UNPACK_HALF2X16_FLOAT2_22)
float2 rdUnpackHalf2x16(uint sourceValue);
#endif
#if defined(RD_USE_DOT2_PRECISE2_FLOAT_23)
float rdDot2Precise2(float2 leftVector, float2 rightVector);
#endif
#if defined(RD_USE_UNSIGNED_TO_FLOAT2_FLOAT_24)
float rdUnsignedToFloat2(uint sourceValue);
#endif
#if defined(RD_USE_DOT3_PRECISE2_FLOAT_25)
float rdDot3Precise2(float3 leftVector, float3 rightVector);
#endif

#if defined(RD_USE_TEXTURE_SIZE_UINT2_0)
uint2 rdTextureSize(Texture2D<float4> textureObject, uint mipLevel, out uint mipLevelCount)
{
    uint2 resultValue;
    textureObject.GetDimensions(mipLevel, resultValue.x, resultValue.y, mipLevelCount);
    return resultValue;
}
#endif

#if defined(RD_USE_DOT3_PRECISE_FLOAT_1)
float rdDot3Precise(float3 leftVector, float3 rightVector)
{
    precise float productValue = leftVector.x * rightVector.x;
    return mad(leftVector.z, rightVector.z, mad(leftVector.y, rightVector.y, productValue));
}
#endif

#if defined(RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2)
float rdUnsignedToFloat(uint sourceValue)
{
    return float(sourceValue);
}
#endif

#if defined(RD_USE_DOT2_PRECISE_FLOAT_3)
float rdDot2Precise(float2 leftVector, float2 rightVector)
{
    precise float productValue1 = leftVector.x * rightVector.x;
    return mad(leftVector.y, rightVector.y, productValue1);
}
#endif

#if defined(RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_4)
float rdSignedBitsToFloat(uint sourceValue)
{
    return float(int(sourceValue));
}
#endif

#if defined(RD_USE_DOT4_PRECISE_FLOAT_5)
float rdDot4Precise(float4 leftVector, float4 rightVector)
{
    precise float productValue = leftVector.x * rightVector.x;
    return mad(leftVector.w, rightVector.w, mad(leftVector.z, rightVector.z, mad(leftVector.y, rightVector.y, productValue)));
}
#endif

#if defined(RD_USE_BITFIELD_INSERT_UINT_6)
uint rdBitfieldInsert(uint baseValue, uint insertedValue, uint bitOffset, uint bitCount)
{
    uint bitMask = bitCount == 32 ? 0xffffffff : (((1u << bitCount) - 1) << (bitOffset & 31));
    return (baseValue & ~bitMask) | ((insertedValue << bitOffset) & bitMask);
}
#endif

#if defined(RD_USE_BITFIELD_INSERT_UINT2_7)
uint2 rdBitfieldInsert(uint2 baseValue, uint2 insertedValue, uint bitOffset, uint bitCount)
{
    uint bitMask = bitCount == 32 ? 0xffffffff : (((1u << bitCount) - 1) << (bitOffset & 31));
    return (baseValue & ~bitMask) | ((insertedValue << bitOffset) & bitMask);
}
#endif

#if defined(RD_USE_BITFIELD_INSERT_UINT3_8)
uint3 rdBitfieldInsert(uint3 baseValue, uint3 insertedValue, uint bitOffset, uint bitCount)
{
    uint bitMask = bitCount == 32 ? 0xffffffff : (((1u << bitCount) - 1) << (bitOffset & 31));
    return (baseValue & ~bitMask) | ((insertedValue << bitOffset) & bitMask);
}
#endif

#if defined(RD_USE_BITFIELD_INSERT_UINT4_9)
uint4 rdBitfieldInsert(uint4 baseValue, uint4 insertedValue, uint bitOffset, uint bitCount)
{
    uint bitMask = bitCount == 32 ? 0xffffffff : (((1u << bitCount) - 1) << (bitOffset & 31));
    return (baseValue & ~bitMask) | ((insertedValue << bitOffset) & bitMask);
}
#endif

#if defined(RD_USE_TEXTURE_SIZE_UINT2_10)
uint2 rdTextureSize(Texture2D<uint4> textureObject, uint mipLevel, out uint mipLevelCount)
{
    uint2 resultValue;
    textureObject.GetDimensions(mipLevel, resultValue.x, resultValue.y, mipLevelCount);
    return resultValue;
}
#endif

#if defined(RD_USE_BITFIELD_UEXTRACT_UINT_11)
uint rdBitfieldUExtract(uint baseValue, uint bitOffset, uint bitCount)
{
    uint bitMask = bitCount == 32 ? 0xffffffff : ((1 << bitCount) - 1);
    return (baseValue >> bitOffset) & bitMask;
}
#endif

#if defined(RD_USE_BITFIELD_UEXTRACT_UINT2_12)
uint2 rdBitfieldUExtract(uint2 baseValue, uint bitOffset, uint bitCount)
{
    uint bitMask = bitCount == 32 ? 0xffffffff : ((1 << bitCount) - 1);
    return (baseValue >> bitOffset) & bitMask;
}
#endif

#if defined(RD_USE_BITFIELD_UEXTRACT_UINT3_13)
uint3 rdBitfieldUExtract(uint3 baseValue, uint bitOffset, uint bitCount)
{
    uint bitMask = bitCount == 32 ? 0xffffffff : ((1 << bitCount) - 1);
    return (baseValue >> bitOffset) & bitMask;
}
#endif

#if defined(RD_USE_BITFIELD_UEXTRACT_UINT4_14)
uint4 rdBitfieldUExtract(uint4 baseValue, uint bitOffset, uint bitCount)
{
    uint bitMask = bitCount == 32 ? 0xffffffff : ((1 << bitCount) - 1);
    return (baseValue >> bitOffset) & bitMask;
}
#endif

#if defined(RD_USE_BITFIELD_SEXTRACT_INT_15)
int rdBitfieldSExtract(int baseValue, int bitOffset, int bitCount)
{
    int bitMask = bitCount == 32 ? -1 : ((1 << bitCount) - 1);
    int maskedValue = (baseValue >> bitOffset) & bitMask;
    int signExtensionShift = (32 - bitCount) & 31;
    return (maskedValue << signExtensionShift) >> signExtensionShift;
}
#endif

#if defined(RD_USE_BITFIELD_SEXTRACT_INT2_16)
int2 rdBitfieldSExtract(int2 baseValue, int bitOffset, int bitCount)
{
    int bitMask = bitCount == 32 ? -1 : ((1 << bitCount) - 1);
    int2 maskedValue = (baseValue >> bitOffset) & bitMask;
    int signExtensionShift = (32 - bitCount) & 31;
    return (maskedValue << signExtensionShift) >> signExtensionShift;
}
#endif

#if defined(RD_USE_BITFIELD_SEXTRACT_INT3_17)
int3 rdBitfieldSExtract(int3 baseValue, int bitOffset, int bitCount)
{
    int bitMask = bitCount == 32 ? -1 : ((1 << bitCount) - 1);
    int3 maskedValue = (baseValue >> bitOffset) & bitMask;
    int signExtensionShift = (32 - bitCount) & 31;
    return (maskedValue << signExtensionShift) >> signExtensionShift;
}
#endif

#if defined(RD_USE_BITFIELD_SEXTRACT_INT4_18)
int4 rdBitfieldSExtract(int4 baseValue, int bitOffset, int bitCount)
{
    int bitMask = bitCount == 32 ? -1 : ((1 << bitCount) - 1);
    int4 maskedValue = (baseValue >> bitOffset) & bitMask;
    int signExtensionShift = (32 - bitCount) & 31;
    return (maskedValue << signExtensionShift) >> signExtensionShift;
}
#endif

#if defined(RD_USE_DIVIDE_UNSIGNED_UINT_19)
uint rdDivideUnsigned(uint numerator, uint denominator)
{
    uint resultValue;
    [flatten]
    if (denominator == 0u)
    {
        resultValue = 4294967295u;
    }
    else
    {
        resultValue = numerator / denominator;
    }
    return resultValue;
}
#endif

#if defined(RD_USE_MODULO_UNSIGNED_UINT_20)
uint rdModuloUnsigned(uint numerator, uint denominator)
{
    uint resultValue;
    [flatten]
    if (denominator == 0u)
    {
        resultValue = 4294967295u;
    }
    else
    {
        resultValue = numerator % denominator;
    }
    return resultValue;
}
#endif

#if defined(RD_USE_PACK_HALF2X16_UINT_21)
uint rdPackHalf2x16(float2 sourceValue)
{
    uint2 packedHalfBits = f32tof16(sourceValue);
    return packedHalfBits.x | (packedHalfBits.y << 16);
}
#endif

#if defined(RD_USE_UNPACK_HALF2X16_FLOAT2_22)
float2 rdUnpackHalf2x16(uint sourceValue)
{
    return f16tof32(uint2(sourceValue & 0xffff, sourceValue >> 16));
}
#endif

#if defined(RD_USE_DOT2_PRECISE2_FLOAT_23)
float rdDot2Precise2(float2 leftVector, float2 rightVector)
{
    precise float productValue = leftVector.x * rightVector.x;
    discardIfRequested();
    return mad(leftVector.y, rightVector.y, productValue);
}
#endif

#if defined(RD_USE_UNSIGNED_TO_FLOAT2_FLOAT_24)
float rdUnsignedToFloat2(uint sourceValue)
{
    discardIfRequested();
    return float(sourceValue);
}
#endif

#if defined(RD_USE_DOT3_PRECISE2_FLOAT_25)
float rdDot3Precise2(float3 leftVector, float3 rightVector)
{
    precise float productValue1 = leftVector.x * rightVector.x;
    discardIfRequested();
    return mad(leftVector.z, rightVector.z, mad(leftVector.y, rightVector.y, productValue1));
}
#endif
