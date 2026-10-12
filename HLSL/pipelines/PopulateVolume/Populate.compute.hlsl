// PopulateVolume / Populate / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 24
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_GPUBLOCK_LIGHTING
#define RD_FEATURE_GPUBLOCK_LIGHTING RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT128
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_BITFIELD_INSERT_UINT2_7 1
#endif
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_BITFIELD_INSERT_UINT3_8 1
#endif
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_BITFIELD_INSERT_UINT4_9 1
#endif
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_BITFIELD_INSERT_UINT_6 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_4 1
#endif
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/PopulateVolume/ComputeBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeComputeStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint4 reinterpretedBits = asuint(RD_UNIFORM_VOLUME_DIMENSIONS);
    float reinterpretedBits1 = asfloat(reinterpretedBits.x);
    float reinterpretedBits2 = asfloat(reinterpretedBits.y);
    float reinterpretedBits3 = asfloat(reinterpretedBits.z);
    uint scalarValue4 = uint(int(reinterpretedBits2));
    if (!(((int(dispatchThreadId.x) >= int(uint(int(reinterpretedBits1)))) || (int(dispatchThreadId.y) >= int(scalarValue4))) || (int(dispatchThreadId.z) >= int(uint(int(reinterpretedBits3))))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if (!((int(dispatchThreadId.z) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z)))) || ((int(dispatchThreadId.x) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.x)))) || (int(dispatchThreadId.y) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.y)))))))
#endif
    {
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue5 = (rdSignedBitsToFloat(dispatchThreadId.x) + 0.5f) / reinterpretedBits1;
        float quotientValue6 = (rdSignedBitsToFloat(dispatchThreadId.y) + 0.5f) / reinterpretedBits2;
        float quotientValue7 = (rdSignedBitsToFloat(dispatchThreadId.z) + 0.5f) / reinterpretedBits3;
        float multiplyAddValue11 = mad(quotientValue5, 2.0f, -1.0f);
        float multiplyAddValue16 = mad(quotientValue6, 2.0f, -1.0f);
        float exponentialValue1 = exp2(quotientValue7 * 5.770780086517333984375f);
        uint4 reinterpretedBits4 = asuint(RD_UNIFORM_PROJECTION_MATRIX_ROW_2);
        float multiplyAddValue17 = -mad(mad(1.0f - exponentialValue1, 0.0186573602259159088134765625f, 1.0f), asfloat(asuint(RD_UNIFORM_VOLUME_NEAR_FAR.x)), ((exponentialValue1 - 1.0f) * 0.0186573602259159088134765625f) * asfloat(asuint(RD_UNIFORM_VOLUME_NEAR_FAR.y)));
        uint4 reinterpretedBits5 = asuint(RD_UNIFORM_PROJECTION_MATRIX_ROW_3);
        float multiplyAddValue18 = mad(asfloat(reinterpretedBits4.z), multiplyAddValue17, asfloat(reinterpretedBits5.z)) / mad(asfloat(reinterpretedBits4.w), multiplyAddValue17, asfloat(reinterpretedBits5.w));
        uint4 reinterpretedBits6 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1);
        uint4 reinterpretedBits7 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0);
        uint4 reinterpretedBits8 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2);
        uint4 reinterpretedBits9 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3);
        float multiplyAddValue19 = mad(asfloat(reinterpretedBits8.w), multiplyAddValue18, mad(asfloat(reinterpretedBits7.w), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.w))) + asfloat(reinterpretedBits9.w);
        float multiplyAddValue20 = (mad(asfloat(reinterpretedBits8.x), multiplyAddValue18, mad(asfloat(reinterpretedBits7.x), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.x))) + asfloat(reinterpretedBits9.x)) / multiplyAddValue19;
        float multiplyAddValue21 = (mad(asfloat(reinterpretedBits8.y), multiplyAddValue18, mad(asfloat(reinterpretedBits7.y), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.y))) + asfloat(reinterpretedBits9.y)) / multiplyAddValue19;
        float multiplyAddValue22 = (mad(asfloat(reinterpretedBits8.z), multiplyAddValue18, mad(asfloat(reinterpretedBits7.z), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.z))) + asfloat(reinterpretedBits9.z)) / multiplyAddValue19;
        uint4 reinterpretedBits10 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_1);
        float reinterpretedBits11 = asfloat(reinterpretedBits10.x);
        float reinterpretedBits12 = asfloat(reinterpretedBits10.y);
        float reinterpretedBits13 = asfloat(reinterpretedBits10.z);
        uint4 reinterpretedBits14 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_0);
        float reinterpretedBits15 = asfloat(reinterpretedBits14.x);
        float reinterpretedBits16 = asfloat(reinterpretedBits14.y);
        float reinterpretedBits17 = asfloat(reinterpretedBits14.z);
        uint4 reinterpretedBits18 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_2);
        float reinterpretedBits19 = asfloat(reinterpretedBits18.x);
        float reinterpretedBits20 = asfloat(reinterpretedBits18.y);
        float reinterpretedBits21 = asfloat(reinterpretedBits18.z);
        uint4 reinterpretedBits22 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_3);
        float reinterpretedBits23 = asfloat(reinterpretedBits22.x);
        float reinterpretedBits24 = asfloat(reinterpretedBits22.y);
        float reinterpretedBits25 = asfloat(reinterpretedBits22.z);
        float multiplyAddValue23 = mad(reinterpretedBits19, multiplyAddValue22, mad(reinterpretedBits15, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits11)) + reinterpretedBits23;
        float multiplyAddValue24 = mad(reinterpretedBits20, multiplyAddValue22, mad(reinterpretedBits16, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits12)) + reinterpretedBits24;
        float multiplyAddValue25 = mad(reinterpretedBits21, multiplyAddValue22, mad(reinterpretedBits17, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits13)) + reinterpretedBits25;
        uint sumValue10 = (scalarValue4 - 1u) - dispatchThreadId.y;
        float4 loadedBufferValue14 = materialTexture5.Load(int3(uint2(dispatchThreadId.x, sumValue10), 0u));
        float scalarValue5 = loadedBufferValue14.x;
        float scalarValue6 = loadedBufferValue14.y;
        float multiplyAddValue26 = clamp((mad((quotientValue7 - scalarValue5) * asfloat(asuint(RD_UNIFORM_VOLUME_DIMENSIONS.z)), scalarValue6, -asfloat(asuint(RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.y))) / asfloat(asuint(RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.z))) + 0.5f, 0.0f, 1.0f);
        float loadedBufferValue15 = ((quotientValue7 - materialTexture4.Load(int3(uint2(dispatchThreadId.x, sumValue10), 0u)).x) >= 0.0f) ? 0.0f : ((multiplyAddValue26 * multiplyAddValue26) * mad(multiplyAddValue26, -2.0f, 3.0f));
        float reinterpretedBits26 = (asfloat(asuint(RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.x)) != 0.0f) ? (1.0f - loadedBufferValue15) : loadedBufferValue15;
        bool reinterpretedBits27 = asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.x)) > 0.0f;
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
        float intermediateValue23;
        if (reinterpretedBits27)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue5 = (rdSignedBitsToFloat(dispatchThreadId.x) + 0.5f) / reinterpretedBits1;
        float quotientValue6 = (rdSignedBitsToFloat(dispatchThreadId.y) + 0.5f) / reinterpretedBits2;
        float quotientValue7 = (rdSignedBitsToFloat(dispatchThreadId.z) + 0.5f) / reinterpretedBits3;
        float multiplyAddValue11 = mad(quotientValue5, 2.0f, -1.0f);
        float multiplyAddValue16 = mad(quotientValue6, 2.0f, -1.0f);
        float exponentialValue1 = exp2(quotientValue7 * 5.770780086517333984375f);
        uint4 reinterpretedBits4 = asuint(RD_UNIFORM_PROJECTION_MATRIX_ROW_2);
        float multiplyAddValue17 = -mad(mad(1.0f - exponentialValue1, 0.0186573602259159088134765625f, 1.0f), asfloat(asuint(RD_UNIFORM_VOLUME_NEAR_FAR.x)), ((exponentialValue1 - 1.0f) * 0.0186573602259159088134765625f) * asfloat(asuint(RD_UNIFORM_VOLUME_NEAR_FAR.y)));
        uint4 reinterpretedBits5 = asuint(RD_UNIFORM_PROJECTION_MATRIX_ROW_3);
        float multiplyAddValue18 = mad(asfloat(reinterpretedBits4.z), multiplyAddValue17, asfloat(reinterpretedBits5.z)) / mad(asfloat(reinterpretedBits4.w), multiplyAddValue17, asfloat(reinterpretedBits5.w));
        uint4 reinterpretedBits6 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1);
        uint4 reinterpretedBits7 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0);
        uint4 reinterpretedBits8 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2);
        uint4 reinterpretedBits9 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3);
        float multiplyAddValue19 = mad(asfloat(reinterpretedBits8.w), multiplyAddValue18, mad(asfloat(reinterpretedBits7.w), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.w))) + asfloat(reinterpretedBits9.w);
        float multiplyAddValue20 = (mad(asfloat(reinterpretedBits8.x), multiplyAddValue18, mad(asfloat(reinterpretedBits7.x), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.x))) + asfloat(reinterpretedBits9.x)) / multiplyAddValue19;
        float multiplyAddValue21 = (mad(asfloat(reinterpretedBits8.y), multiplyAddValue18, mad(asfloat(reinterpretedBits7.y), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.y))) + asfloat(reinterpretedBits9.y)) / multiplyAddValue19;
        float multiplyAddValue22 = (mad(asfloat(reinterpretedBits8.z), multiplyAddValue18, mad(asfloat(reinterpretedBits7.z), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.z))) + asfloat(reinterpretedBits9.z)) / multiplyAddValue19;
        uint4 reinterpretedBits10 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_1);
        float reinterpretedBits11 = asfloat(reinterpretedBits10.x);
        float reinterpretedBits12 = asfloat(reinterpretedBits10.y);
        float reinterpretedBits13 = asfloat(reinterpretedBits10.z);
        uint4 reinterpretedBits14 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_0);
        float reinterpretedBits15 = asfloat(reinterpretedBits14.x);
        float reinterpretedBits16 = asfloat(reinterpretedBits14.y);
        float reinterpretedBits17 = asfloat(reinterpretedBits14.z);
        uint4 reinterpretedBits18 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_2);
        float reinterpretedBits19 = asfloat(reinterpretedBits18.x);
        float reinterpretedBits20 = asfloat(reinterpretedBits18.y);
        float reinterpretedBits21 = asfloat(reinterpretedBits18.z);
        uint4 reinterpretedBits22 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_3);
        float reinterpretedBits23 = asfloat(reinterpretedBits22.x);
        float reinterpretedBits24 = asfloat(reinterpretedBits22.y);
        float reinterpretedBits25 = asfloat(reinterpretedBits22.z);
        float multiplyAddValue23 = mad(reinterpretedBits19, multiplyAddValue22, mad(reinterpretedBits15, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits11)) + reinterpretedBits23;
        float multiplyAddValue24 = mad(reinterpretedBits20, multiplyAddValue22, mad(reinterpretedBits16, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits12)) + reinterpretedBits24;
        float multiplyAddValue25 = mad(reinterpretedBits21, multiplyAddValue22, mad(reinterpretedBits17, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits13)) + reinterpretedBits25;
        uint sumValue10 = (scalarValue4 - 1u) - dispatchThreadId.y;
        float4 loadedBufferValue14 = materialTexture5.Load(int3(uint2(dispatchThreadId.x, sumValue10), 0u));
        float multiplyAddValue67 = clamp((mad((quotientValue7 - loadedBufferValue14.x) * asfloat(asuint(RD_UNIFORM_VOLUME_DIMENSIONS.z)), loadedBufferValue14.y, -asfloat(asuint(RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.y))) / asfloat(asuint(RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.z))) + 0.5f, 0.0f, 1.0f);
        float loadedBufferValue41 = ((quotientValue7 - materialTexture4.Load(int3(uint2(dispatchThreadId.x, sumValue10), 0u)).x) >= 0.0f) ? 0.0f : ((multiplyAddValue67 * multiplyAddValue67) * mad(multiplyAddValue67, -2.0f, 3.0f));
        float reinterpretedBits62 = (asfloat(asuint(RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.x)) != 0.0f) ? (1.0f - loadedBufferValue41) : loadedBufferValue41;
        bool reinterpretedBits27 = asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.x)) > 0.0f;
        float intermediateValue21;
        float intermediateValue23;
        float intermediateValue24;
        float intermediateValue25;
        if (reinterpretedBits27)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue5 = (rdSignedBitsToFloat(dispatchThreadId.x) + 0.5f) / reinterpretedBits1;
        float quotientValue6 = (rdSignedBitsToFloat(dispatchThreadId.y) + 0.5f) / reinterpretedBits2;
        float quotientValue7 = (rdSignedBitsToFloat(dispatchThreadId.z) + 0.5f) / reinterpretedBits3;
        float multiplyAddValue11 = mad(quotientValue5, 2.0f, -1.0f);
        float multiplyAddValue16 = mad(quotientValue6, 2.0f, -1.0f);
        float exponentialValue1 = exp2(quotientValue7 * 5.770780086517333984375f);
        uint4 reinterpretedBits4 = asuint(RD_UNIFORM_PROJECTION_MATRIX_ROW_2);
        float multiplyAddValue17 = -mad(mad(1.0f - exponentialValue1, 0.0186573602259159088134765625f, 1.0f), asfloat(asuint(RD_UNIFORM_VOLUME_NEAR_FAR.x)), ((exponentialValue1 - 1.0f) * 0.0186573602259159088134765625f) * asfloat(asuint(RD_UNIFORM_VOLUME_NEAR_FAR.y)));
        uint4 reinterpretedBits5 = asuint(RD_UNIFORM_PROJECTION_MATRIX_ROW_3);
        float multiplyAddValue18 = mad(asfloat(reinterpretedBits4.z), multiplyAddValue17, asfloat(reinterpretedBits5.z)) / mad(asfloat(reinterpretedBits4.w), multiplyAddValue17, asfloat(reinterpretedBits5.w));
        uint4 reinterpretedBits6 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1);
        uint4 reinterpretedBits7 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0);
        uint4 reinterpretedBits8 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2);
        uint4 reinterpretedBits9 = asuint(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3);
        float multiplyAddValue19 = mad(asfloat(reinterpretedBits8.w), multiplyAddValue18, mad(asfloat(reinterpretedBits7.w), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.w))) + asfloat(reinterpretedBits9.w);
        float multiplyAddValue20 = (mad(asfloat(reinterpretedBits8.x), multiplyAddValue18, mad(asfloat(reinterpretedBits7.x), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.x))) + asfloat(reinterpretedBits9.x)) / multiplyAddValue19;
        float multiplyAddValue21 = (mad(asfloat(reinterpretedBits8.y), multiplyAddValue18, mad(asfloat(reinterpretedBits7.y), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.y))) + asfloat(reinterpretedBits9.y)) / multiplyAddValue19;
        float multiplyAddValue22 = (mad(asfloat(reinterpretedBits8.z), multiplyAddValue18, mad(asfloat(reinterpretedBits7.z), multiplyAddValue11, multiplyAddValue16 * asfloat(reinterpretedBits6.z))) + asfloat(reinterpretedBits9.z)) / multiplyAddValue19;
        uint4 reinterpretedBits10 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_1);
        float reinterpretedBits11 = asfloat(reinterpretedBits10.x);
        float reinterpretedBits12 = asfloat(reinterpretedBits10.y);
        float reinterpretedBits13 = asfloat(reinterpretedBits10.z);
        uint4 reinterpretedBits14 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_0);
        float reinterpretedBits15 = asfloat(reinterpretedBits14.x);
        float reinterpretedBits16 = asfloat(reinterpretedBits14.y);
        float reinterpretedBits17 = asfloat(reinterpretedBits14.z);
        uint4 reinterpretedBits18 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_2);
        float reinterpretedBits19 = asfloat(reinterpretedBits18.x);
        float reinterpretedBits20 = asfloat(reinterpretedBits18.y);
        float reinterpretedBits21 = asfloat(reinterpretedBits18.z);
        uint4 reinterpretedBits22 = asuint(RD_UNIFORM_VIEW_MATRIX_ROW_3);
        float reinterpretedBits23 = asfloat(reinterpretedBits22.x);
        float reinterpretedBits24 = asfloat(reinterpretedBits22.y);
        float reinterpretedBits25 = asfloat(reinterpretedBits22.z);
        float multiplyAddValue23 = mad(reinterpretedBits19, multiplyAddValue22, mad(reinterpretedBits15, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits11)) + reinterpretedBits23;
        float multiplyAddValue24 = mad(reinterpretedBits20, multiplyAddValue22, mad(reinterpretedBits16, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits12)) + reinterpretedBits24;
        float multiplyAddValue25 = mad(reinterpretedBits21, multiplyAddValue22, mad(reinterpretedBits17, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits13)) + reinterpretedBits25;
        uint sumValue10 = (scalarValue4 - 1u) - dispatchThreadId.y;
        float4 loadedBufferValue14 = materialTexture5.Load(int3(uint2(dispatchThreadId.x, sumValue10), 0u));
        float multiplyAddValue67 = clamp((mad((quotientValue7 - loadedBufferValue14.x) * asfloat(asuint(RD_UNIFORM_VOLUME_DIMENSIONS.z)), loadedBufferValue14.y, -asfloat(asuint(RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.y))) / asfloat(asuint(RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.z))) + 0.5f, 0.0f, 1.0f);
        float loadedBufferValue41 = ((quotientValue7 - materialTexture4.Load(int3(uint2(dispatchThreadId.x, sumValue10), 0u)).x) >= 0.0f) ? 0.0f : ((multiplyAddValue67 * multiplyAddValue67) * mad(multiplyAddValue67, -2.0f, 3.0f));
        float reinterpretedBits62 = (asfloat(asuint(RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.x)) != 0.0f) ? (1.0f - loadedBufferValue41) : loadedBufferValue41;
        bool reinterpretedBits27 = asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.x)) > 0.0f;
        float intermediateValue24;
        float intermediateValue26;
        float intermediateValue27;
        float intermediateValue28;
        if (reinterpretedBits27)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue = (float(int(dispatchThreadId.x)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.x;
        float quotientValue1 = (float(int(dispatchThreadId.y)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.y;
        float quotientValue2 = (float(int(dispatchThreadId.z)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.z;
        float productValue = (quotientValue * 2.0f) + (-1.0f);
        float productValue1 = (quotientValue1 * 2.0f) + (-1.0f);
        float exponentialValue = (exp2(quotientValue2 * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f;
        float productValue2 = (-0.0f) - ((exponentialValue * RD_UNIFORM_VOLUME_NEAR_FAR.y) + ((1.0f - exponentialValue) * RD_UNIFORM_VOLUME_NEAR_FAR.x));
        float multiplyAddValue = (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, productValue2, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, productValue2, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w);
        float multiplyAddValue1 = mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.w;
        float multiplyAddValue2 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue1;
        float multiplyAddValue3 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue1;
        float multiplyAddValue4 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue1;
        float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
        float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
        float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
        uint sumValue = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.y)) + (~dispatchThreadId.y);
        float4 loadedBufferValue = screenSpaceWaterFrontFaceDepthAndNormalTexture.Load(int3(uint2(dispatchThreadId.x, sumValue), 0u));
        float clampedValue = clamp(((((loadedBufferValue.y * RD_UNIFORM_VOLUME_DIMENSIONS.z) * (quotientValue2 - loadedBufferValue.x)) - RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.y) / RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.z) + 0.5f, 0.0f, 1.0f);
        float productValue3 = (clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f));
        float loadedBufferValue1 = (((quotientValue2 - screenSpaceWaterBackFaceDepthAndNormalTexture.Load(int3(uint2(dispatchThreadId.x, sumValue), 0u)).x) >= 0.0f) && (productValue3 >= 0.0f)) ? 0.0f : productValue3;
        float comparisonValue = (RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.x != 0.0f) ? (1.0f - loadedBufferValue1) : loadedBufferValue1;
        float intermediateValue4;
        float intermediateValue5;
        float intermediateValue6;
        float intermediateValue7;
        if (RD_UNIFORM_BIOME_BLENDING_PARAMETERS.x > 0.0f)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue = (float(int(dispatchThreadId.x)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.x;
        float quotientValue1 = (float(int(dispatchThreadId.y)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.y;
        float quotientValue2 = (float(int(dispatchThreadId.z)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.z;
        float productValue = (quotientValue * 2.0f) + (-1.0f);
        float productValue1 = (quotientValue1 * 2.0f) + (-1.0f);
        float exponentialValue = (exp2(quotientValue2 * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f;
        float productValue2 = (-0.0f) - ((exponentialValue * RD_UNIFORM_VOLUME_NEAR_FAR.y) + ((1.0f - exponentialValue) * RD_UNIFORM_VOLUME_NEAR_FAR.x));
        float multiplyAddValue = (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, productValue2, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, productValue2, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w);
        float multiplyAddValue1 = mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.w;
        float multiplyAddValue2 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue1;
        float multiplyAddValue3 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue1;
        float multiplyAddValue4 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue1;
        float multiplyAddValue60 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
        float sumValue17 = multiplyAddValue60 + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
        float multiplyAddValue61 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
        float sumValue18 = multiplyAddValue61 + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
        float multiplyAddValue62 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
        float sumValue43 = multiplyAddValue62 + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
        uint sumValue = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.y)) + (~dispatchThreadId.y);
        float4 loadedBufferValue = screenSpaceWaterFrontFaceDepthAndNormalTexture.Load(int3(uint2(dispatchThreadId.x, sumValue), 0u));
        float clampedValue = clamp(((((loadedBufferValue.y * RD_UNIFORM_VOLUME_DIMENSIONS.z) * (quotientValue2 - loadedBufferValue.x)) - RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.y) / RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.z) + 0.5f, 0.0f, 1.0f);
        float productValue3 = (clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f));
        float loadedBufferValue1 = (((quotientValue2 - screenSpaceWaterBackFaceDepthAndNormalTexture.Load(int3(uint2(dispatchThreadId.x, sumValue), 0u)).x) >= 0.0f) && (productValue3 >= 0.0f)) ? 0.0f : productValue3;
        float comparisonValue = (RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.x != 0.0f) ? (1.0f - loadedBufferValue1) : loadedBufferValue1;
        float intermediateValue4;
        float intermediateValue5;
        float intermediateValue6;
        float intermediateValue7;
        if (RD_UNIFORM_BIOME_BLENDING_PARAMETERS.x > 0.0f)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue = (float(int(dispatchThreadId.x)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.x;
        float quotientValue1 = (float(int(dispatchThreadId.y)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.y;
        float quotientValue2 = (float(int(dispatchThreadId.z)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.z;
        float productValue = (quotientValue * 2.0f) + (-1.0f);
        float productValue1 = (quotientValue1 * 2.0f) + (-1.0f);
        float exponentialValue = (exp2(quotientValue2 * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f;
        float productValue2 = (-0.0f) - ((exponentialValue * RD_UNIFORM_VOLUME_NEAR_FAR.y) + ((1.0f - exponentialValue) * RD_UNIFORM_VOLUME_NEAR_FAR.x));
        float multiplyAddValue = (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, productValue2, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, productValue2, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w);
        float multiplyAddValue1 = mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.w;
        float multiplyAddValue2 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue1;
        float multiplyAddValue3 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue1;
        float multiplyAddValue4 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue1;
        float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
        float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
        float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
        uint sumValue = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.y)) + (~dispatchThreadId.y);
        float4 loadedBufferValue = screenSpaceWaterFrontFaceDepthAndNormalTexture.Load(int3(uint2(dispatchThreadId.x, sumValue), 0u));
        float clampedValue = clamp(((((loadedBufferValue.y * RD_UNIFORM_VOLUME_DIMENSIONS.z) * (quotientValue2 - loadedBufferValue.x)) - RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.y) / RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.z) + 0.5f, 0.0f, 1.0f);
        float productValue3 = (clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f));
        float loadedBufferValue1 = (((quotientValue2 - screenSpaceWaterBackFaceDepthAndNormalTexture.Load(int3(uint2(dispatchThreadId.x, sumValue), 0u)).x) >= 0.0f) && (productValue3 >= 0.0f)) ? 0.0f : productValue3;
        float comparisonValue = (RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.x != 0.0f) ? (1.0f - loadedBufferValue1) : loadedBufferValue1;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        if (RD_UNIFORM_BIOME_BLENDING_PARAMETERS.x > 0.0f)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue = (float(int(dispatchThreadId.x)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.x;
        float quotientValue1 = (float(int(dispatchThreadId.y)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.y;
        float quotientValue2 = (float(int(dispatchThreadId.z)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.z;
        float productValue = (quotientValue * 2.0f) + (-1.0f);
        float productValue1 = (quotientValue1 * 2.0f) + (-1.0f);
        float exponentialValue = (exp2(quotientValue2 * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f;
        float productValue2 = (-0.0f) - ((exponentialValue * RD_UNIFORM_VOLUME_NEAR_FAR.y) + ((1.0f - exponentialValue) * RD_UNIFORM_VOLUME_NEAR_FAR.x));
        float multiplyAddValue = (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, productValue2, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, productValue2, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w);
        float multiplyAddValue1 = mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.w;
        float multiplyAddValue2 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue1;
        float multiplyAddValue3 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue1;
        float multiplyAddValue4 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue1, productValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue1;
        float multiplyAddValue60 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
        float sumValue17 = multiplyAddValue60 + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
        float multiplyAddValue61 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
        float sumValue18 = multiplyAddValue61 + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
        float multiplyAddValue62 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue4, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue3, multiplyAddValue2 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
        float sumValue43 = multiplyAddValue62 + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
        uint sumValue = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.y)) + (~dispatchThreadId.y);
        float4 loadedBufferValue = screenSpaceWaterFrontFaceDepthAndNormalTexture.Load(int3(uint2(dispatchThreadId.x, sumValue), 0u));
        float clampedValue = clamp(((((loadedBufferValue.y * RD_UNIFORM_VOLUME_DIMENSIONS.z) * (quotientValue2 - loadedBufferValue.x)) - RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.y) / RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.z) + 0.5f, 0.0f, 1.0f);
        float productValue3 = (clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f));
        float loadedBufferValue1 = (((quotientValue2 - screenSpaceWaterBackFaceDepthAndNormalTexture.Load(int3(uint2(dispatchThreadId.x, sumValue), 0u)).x) >= 0.0f) && (productValue3 >= 0.0f)) ? 0.0f : productValue3;
        float comparisonValue = (RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF.x != 0.0f) ? (1.0f - loadedBufferValue1) : loadedBufferValue1;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        if (RD_UNIFORM_BIOME_BLENDING_PARAMETERS.x > 0.0f)
#endif
        {
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            uint reinterpretedBits28 = uint(int(asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z)) * 0.5f));
            float reinterpretedBits29 = asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w));
            float reinterpretedBits30 = (multiplyAddValue20 - asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.x))) / reinterpretedBits29;
            float reinterpretedBits31 = (multiplyAddValue22 - asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.z))) / reinterpretedBits29;
            uint4 reinterpretedBits32 = asuint(RD_UNIFORM_BIOME_BLENDING_PARAMETERS);
            uint reinterpretedBits33 = uint(int(asfloat(reinterpretedBits32.w)));
            uint reinterpretedBits34 = uint(int(asfloat(reinterpretedBits32.z))) - 1u;
            uint sumValue11 = uint(min(int(uint(max(int(reinterpretedBits28 + uint(int(floor(reinterpretedBits30)))), int(0u)))), int(reinterpretedBits34)));
            uint sumValue12 = uint(min(int(uint(max(int(reinterpretedBits28 + uint(int(floor(reinterpretedBits31)))), int(0u)))), int(reinterpretedBits34)));
            uint loadedBufferValue16 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue11, sumValue12), 0u)).x * 255.0f)));
            bool comparisonValue6 = int(reinterpretedBits33) <= int(loadedBufferValue16);
            bool conditionValue = !comparisonValue6;
            uint comparisonValue8 = comparisonValue6 ? 0u : loadedBufferValue16;
            uint sumValue13 = sumValue12 + 1u;
            uint sumValue14 = sumValue11 + 1u;
            uint loadedBufferValue17 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue14, sumValue12), 0u)).x * 255.0f)));
            bool comparisonValue11 = int(reinterpretedBits33) <= int(loadedBufferValue17);
            bool conditionValue1 = !comparisonValue11;
            uint loadedBufferValue19 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue11, sumValue13), 0u)).x * 255.0f)));
            bool comparisonValue17 = int(reinterpretedBits33) <= int(loadedBufferValue19);
            bool conditionValue2 = !comparisonValue17;
            uint loadedBufferValue22 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue14, sumValue13), 0u)).x * 255.0f)));
            bool comparisonValue18 = int(reinterpretedBits33) <= int(loadedBufferValue22);
            bool comparisonValue20 = loadedBufferValue17 == 0u;
            bool comparisonValue21 = comparisonValue17 || (conditionValue2 && (loadedBufferValue19 == 0u));
            bool comparisonValue22 = (comparisonValue18 && comparisonValue21) || ((!comparisonValue18) && (((loadedBufferValue19 == loadedBufferValue22) && conditionValue2) || (comparisonValue17 && (loadedBufferValue22 == 0u))));
            bool comparisonValue23 = comparisonValue22 && (((conditionValue1 && ((comparisonValue20 && comparisonValue6) || (conditionValue && (loadedBufferValue16 == loadedBufferValue17)))) || (comparisonValue11 && (comparisonValue6 || ((loadedBufferValue16 == 0u) && conditionValue)))) && ((comparisonValue11 && comparisonValue21) || (conditionValue1 && ((comparisonValue20 && comparisonValue17) || (conditionValue2 && (loadedBufferValue17 == loadedBufferValue19))))));
            float reinterpretedBits35;
            float reinterpretedBits36;
            float reinterpretedBits37;
            float reinterpretedBits38;
            if (comparisonValue23)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            uint reinterpretedBits28 = uint(int(asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z)) * 0.5f));
            float reinterpretedBits29 = asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w));
            float reinterpretedBits30 = (multiplyAddValue20 - asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.x))) / reinterpretedBits29;
            float reinterpretedBits31 = (multiplyAddValue22 - asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.z))) / reinterpretedBits29;
            uint4 reinterpretedBits32 = asuint(RD_UNIFORM_BIOME_BLENDING_PARAMETERS);
            uint reinterpretedBits33 = uint(int(asfloat(reinterpretedBits32.w)));
            uint reinterpretedBits34 = uint(int(asfloat(reinterpretedBits32.z))) - 1u;
            uint sumValue11 = uint(min(int(uint(max(int(reinterpretedBits28 + uint(int(floor(reinterpretedBits30)))), int(0u)))), int(reinterpretedBits34)));
            uint sumValue61 = uint(min(int(reinterpretedBits34), int(uint(max(int(reinterpretedBits28 + uint(int(floor(reinterpretedBits31)))), int(0u))))));
            uint loadedBufferValue42 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue11, sumValue61), 0u)).x * 255.0f)));
            bool comparisonValue28 = int(loadedBufferValue42) >= int(reinterpretedBits33);
            bool conditionValue3 = !comparisonValue28;
            uint comparisonValue29 = comparisonValue28 ? 0u : loadedBufferValue42;
            uint sumValue62 = sumValue61 + 1u;
            uint sumValue14 = sumValue11 + 1u;
            uint loadedBufferValue43 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue14, sumValue61), 0u)).x * 255.0f)));
            bool comparisonValue30 = int(loadedBufferValue43) >= int(reinterpretedBits33);
            bool conditionValue4 = !comparisonValue30;
            uint loadedBufferValue44 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue11, sumValue62), 0u)).x * 255.0f)));
            bool comparisonValue44 = int(loadedBufferValue44) >= int(reinterpretedBits33);
            bool conditionValue5 = !comparisonValue44;
            uint loadedBufferValue45 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue14, sumValue62), 0u)).x * 255.0f)));
            bool comparisonValue45 = int(loadedBufferValue45) >= int(reinterpretedBits33);
            bool comparisonValue46 = loadedBufferValue43 == 0u;
            bool comparisonValue47 = loadedBufferValue44 == 0u;
            bool comparisonValue48 = ((comparisonValue45 && (comparisonValue44 || (conditionValue5 && comparisonValue47))) || ((!comparisonValue45) && (((loadedBufferValue44 == loadedBufferValue45) && conditionValue5) || ((loadedBufferValue45 == 0u) && comparisonValue44)))) && (((((comparisonValue46 && comparisonValue28) || (conditionValue3 && (loadedBufferValue42 == loadedBufferValue43))) && conditionValue4) || (comparisonValue30 && (comparisonValue28 || ((loadedBufferValue42 == 0u) && conditionValue3)))) && ((comparisonValue44 && (comparisonValue30 || (comparisonValue46 && conditionValue4))) || (conditionValue5 && ((comparisonValue30 && comparisonValue47) || (conditionValue4 && (loadedBufferValue43 == loadedBufferValue44))))));
            float reinterpretedBits35;
            float reinterpretedBits36;
            float reinterpretedBits37;
            float reinterpretedBits38;
            if (comparisonValue48)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            uint reinterpretedBits28 = uint(int(asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z)) * 0.5f));
            float reinterpretedBits29 = asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w));
            float reinterpretedBits30 = (multiplyAddValue20 - asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.x))) / reinterpretedBits29;
            float reinterpretedBits31 = (multiplyAddValue22 - asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.z))) / reinterpretedBits29;
            uint4 reinterpretedBits32 = asuint(RD_UNIFORM_BIOME_BLENDING_PARAMETERS);
            uint reinterpretedBits33 = uint(int(asfloat(reinterpretedBits32.w)));
            uint reinterpretedBits34 = uint(int(asfloat(reinterpretedBits32.z))) - 1u;
            uint sumValue11 = uint(min(int(uint(max(int(reinterpretedBits28 + uint(int(floor(reinterpretedBits30)))), int(0u)))), int(reinterpretedBits34)));
            uint sumValue61 = uint(min(int(reinterpretedBits34), int(uint(max(int(reinterpretedBits28 + uint(int(floor(reinterpretedBits31)))), int(0u))))));
            uint loadedBufferValue42 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue11, sumValue61), 0u)).x * 255.0f)));
            bool comparisonValue28 = int(loadedBufferValue42) >= int(reinterpretedBits33);
            bool conditionValue3 = !comparisonValue28;
            uint comparisonValue29 = comparisonValue28 ? 0u : loadedBufferValue42;
            uint sumValue62 = sumValue61 + 1u;
            uint sumValue14 = sumValue11 + 1u;
            uint loadedBufferValue43 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue14, sumValue61), 0u)).x * 255.0f)));
            bool comparisonValue30 = int(loadedBufferValue43) >= int(reinterpretedBits33);
            bool conditionValue4 = !comparisonValue30;
            uint loadedBufferValue44 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue11, sumValue62), 0u)).x * 255.0f)));
            bool comparisonValue44 = int(loadedBufferValue44) >= int(reinterpretedBits33);
            bool conditionValue5 = !comparisonValue44;
            uint loadedBufferValue45 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue14, sumValue62), 0u)).x * 255.0f)));
            bool comparisonValue45 = int(loadedBufferValue45) >= int(reinterpretedBits33);
            bool comparisonValue46 = loadedBufferValue43 == 0u;
            bool comparisonValue47 = loadedBufferValue44 == 0u;
            bool comparisonValue73 = (((!comparisonValue45) && (((loadedBufferValue44 == loadedBufferValue45) && conditionValue5) || (comparisonValue44 && (loadedBufferValue45 == 0u)))) || (comparisonValue45 && (comparisonValue44 || (conditionValue5 && comparisonValue47)))) && (((((comparisonValue46 && comparisonValue28) || (conditionValue3 && (loadedBufferValue42 == loadedBufferValue43))) && conditionValue4) || (comparisonValue30 && (comparisonValue28 || ((loadedBufferValue42 == 0u) && conditionValue3)))) && ((comparisonValue44 && (comparisonValue30 || (comparisonValue46 && conditionValue4))) || (conditionValue5 && ((comparisonValue30 && comparisonValue47) || ((loadedBufferValue43 == loadedBufferValue44) && conditionValue4)))));
            float reinterpretedBits35;
            float reinterpretedBits36;
            float reinterpretedBits37;
            float reinterpretedBits38;
            if (comparisonValue73)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            uint reinterpretedBits28 = uint(int(asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z)) * 0.5f));
            float reinterpretedBits29 = asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w));
            float reinterpretedBits30 = (multiplyAddValue20 - asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.x))) / reinterpretedBits29;
            float reinterpretedBits31 = (multiplyAddValue22 - asfloat(asuint(RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.z))) / reinterpretedBits29;
            uint4 reinterpretedBits32 = asuint(RD_UNIFORM_BIOME_BLENDING_PARAMETERS);
            uint reinterpretedBits33 = uint(int(asfloat(reinterpretedBits32.w)));
            uint reinterpretedBits34 = uint(int(asfloat(reinterpretedBits32.z))) - 1u;
            uint sumValue11 = uint(min(int(uint(max(int(reinterpretedBits28 + uint(int(floor(reinterpretedBits30)))), int(0u)))), int(reinterpretedBits34)));
            uint sumValue61 = uint(min(int(reinterpretedBits34), int(uint(max(int(reinterpretedBits28 + uint(int(floor(reinterpretedBits31)))), int(0u))))));
            uint loadedBufferValue42 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue11, sumValue61), 0u)).x * 255.0f)));
            bool comparisonValue28 = int(loadedBufferValue42) >= int(reinterpretedBits33);
            uint comparisonValue29 = comparisonValue28 ? 0u : loadedBufferValue42;
            uint sumValue62 = sumValue61 + 1u;
            uint sumValue14 = sumValue11 + 1u;
            uint loadedBufferValue43 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue14, sumValue61), 0u)).x * 255.0f)));
            bool comparisonValue30 = int(loadedBufferValue43) >= int(reinterpretedBits33);
            bool conditionValue4 = !comparisonValue30;
            uint loadedBufferValue44 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue11, sumValue62), 0u)).x * 255.0f)));
            bool comparisonValue44 = int(loadedBufferValue44) >= int(reinterpretedBits33);
            bool conditionValue5 = !comparisonValue44;
            uint loadedBufferValue45 = uint(int(round(materialTexture0.Load(int3(uint2(sumValue14, sumValue62), 0u)).x * 255.0f)));
            bool comparisonValue45 = int(loadedBufferValue45) >= int(reinterpretedBits33);
            bool comparisonValue99 = comparisonValue30 || ((loadedBufferValue43 == 0u) && conditionValue4);
            bool comparisonValue47 = loadedBufferValue44 == 0u;
            bool comparisonValue100 = ((comparisonValue45 && (comparisonValue44 || (conditionValue5 && comparisonValue47))) || ((!comparisonValue45) && ((comparisonValue44 && (loadedBufferValue45 == 0u)) || (conditionValue5 && (loadedBufferValue44 == loadedBufferValue45))))) && ((((!comparisonValue28) && (((loadedBufferValue42 == 0u) && comparisonValue30) || ((loadedBufferValue42 == loadedBufferValue43) && conditionValue4))) || (comparisonValue28 && comparisonValue99)) && ((comparisonValue44 && comparisonValue99) || (conditionValue5 && (((loadedBufferValue43 == loadedBufferValue44) && conditionValue4) || (comparisonValue30 && comparisonValue47)))));
            float reinterpretedBits35;
            float reinterpretedBits36;
            float reinterpretedBits37;
            float reinterpretedBits38;
            if (comparisonValue100)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            uint productValue4 = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z * 0.5f));
            float quotientValue3 = (multiplyAddValue2 - RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.x) / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w;
            float quotientValue4 = (multiplyAddValue4 - RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.z) / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w;
            uint sumValue1 = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z)) + 4294967295u;
            uint sumValue2 = uint(min(int(uint(max(int(uint(int(floor(quotientValue3))) + productValue4), int(0u)))), int(sumValue1)));
            uint sumValue3 = uint(min(int(uint(max(int(uint(int(floor(quotientValue4))) + productValue4), int(0u)))), int(sumValue1)));
            uint loadedBufferValue2 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue2, sumValue3), 0u)).x * 255.0f)));
            uint scalarValue = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.w));
            uint comparisonValue1 = (int(loadedBufferValue2) >= int(scalarValue)) ? 0u : loadedBufferValue2;
            uint sumValue4 = sumValue2 + 1u;
            uint loadedBufferValue3 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue4, sumValue3), 0u)).x * 255.0f)));
            uint comparisonValue2 = (int(loadedBufferValue3) >= int(scalarValue)) ? 0u : loadedBufferValue3;
            uint sumValue5 = sumValue3 + 1u;
            uint loadedBufferValue4 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue2, sumValue5), 0u)).x * 255.0f)));
            uint comparisonValue3 = (int(loadedBufferValue4) >= int(scalarValue)) ? 0u : loadedBufferValue4;
            uint loadedBufferValue5 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue4, sumValue5), 0u)).x * 255.0f)));
            uint comparisonValue4 = (int(loadedBufferValue5) >= int(scalarValue)) ? 0u : loadedBufferValue5;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            float branchMergedValue3;
            if (((comparisonValue1 == comparisonValue2) && (comparisonValue2 == comparisonValue3)) && (comparisonValue3 == comparisonValue4))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            uint productValue4 = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z * 0.5f));
            float quotientValue3 = (multiplyAddValue2 - RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.x) / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w;
            float quotientValue4 = (multiplyAddValue4 - RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.z) / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w;
            uint sumValue1 = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z)) + 4294967295u;
            uint sumValue2 = uint(min(int(uint(max(int(uint(int(floor(quotientValue3))) + productValue4), int(0u)))), int(sumValue1)));
            uint sumValue3 = uint(min(int(uint(max(int(uint(int(floor(quotientValue4))) + productValue4), int(0u)))), int(sumValue1)));
            uint loadedBufferValue2 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue2, sumValue3), 0u)).x * 255.0f)));
            uint scalarValue = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.w));
            uint comparisonValue1 = (int(loadedBufferValue2) >= int(scalarValue)) ? 0u : loadedBufferValue2;
            uint sumValue4 = sumValue2 + 1u;
            uint loadedBufferValue3 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue4, sumValue3), 0u)).x * 255.0f)));
            uint comparisonValue2 = (int(loadedBufferValue3) >= int(scalarValue)) ? 0u : loadedBufferValue3;
            uint sumValue5 = sumValue3 + 1u;
            uint loadedBufferValue4 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue2, sumValue5), 0u)).x * 255.0f)));
            uint comparisonValue3 = (int(loadedBufferValue4) >= int(scalarValue)) ? 0u : loadedBufferValue4;
            uint loadedBufferValue5 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue4, sumValue5), 0u)).x * 255.0f)));
            uint comparisonValue4 = (int(loadedBufferValue5) >= int(scalarValue)) ? 0u : loadedBufferValue5;
            float branchMergedValue4;
            float branchMergedValue9;
            float branchMergedValue10;
            float branchMergedValue11;
            if (((comparisonValue1 == comparisonValue2) && (comparisonValue2 == comparisonValue3)) && (comparisonValue3 == comparisonValue4))
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            uint productValue4 = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z * 0.5f));
            float quotientValue3 = (multiplyAddValue2 - RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.x) / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w;
            float quotientValue4 = (multiplyAddValue4 - RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.z) / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w;
            uint sumValue1 = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z)) + 4294967295u;
            uint sumValue2 = uint(min(int(uint(max(int(uint(int(floor(quotientValue3))) + productValue4), int(0u)))), int(sumValue1)));
            uint sumValue3 = uint(min(int(uint(max(int(uint(int(floor(quotientValue4))) + productValue4), int(0u)))), int(sumValue1)));
            uint loadedBufferValue2 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue2, sumValue3), 0u)).x * 255.0f)));
            uint scalarValue = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.w));
            uint comparisonValue1 = (int(loadedBufferValue2) >= int(scalarValue)) ? 0u : loadedBufferValue2;
            uint sumValue4 = sumValue2 + 1u;
            uint loadedBufferValue3 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue4, sumValue3), 0u)).x * 255.0f)));
            uint comparisonValue2 = (int(loadedBufferValue3) >= int(scalarValue)) ? 0u : loadedBufferValue3;
            uint sumValue5 = sumValue3 + 1u;
            uint loadedBufferValue4 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue2, sumValue5), 0u)).x * 255.0f)));
            uint comparisonValue3 = (int(loadedBufferValue4) >= int(scalarValue)) ? 0u : loadedBufferValue4;
            uint loadedBufferValue5 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue4, sumValue5), 0u)).x * 255.0f)));
            uint comparisonValue4 = (int(loadedBufferValue5) >= int(scalarValue)) ? 0u : loadedBufferValue5;
            float branchMergedValue;
            float branchMergedValue2;
            float branchMergedValue3;
            float branchMergedValue4;
            if (((comparisonValue1 == comparisonValue2) && (comparisonValue2 == comparisonValue3)) && (comparisonValue3 == comparisonValue4))
#endif
            {
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                uint productValue63 = (comparisonValue8 * 20u) + 4u;
                uint4 loadedBufferValue24 = uint4(rdLoad_intermediateValue5(productValue63).x, rdLoad_intermediateValue5(productValue63 + 1u).x, rdLoad_intermediateValue5(productValue63 + 2u).x, rdLoad_intermediateValue5(productValue63 + 3u).x);
                reinterpretedBits35 = asfloat(loadedBufferValue24.x);
                reinterpretedBits36 = asfloat(loadedBufferValue24.y);
                reinterpretedBits37 = asfloat(loadedBufferValue24.z);
                reinterpretedBits38 = asfloat(loadedBufferValue24.w);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                uint productValue94 = (comparisonValue29 * 20u) + 4u;
                uint4 loadedBufferValue46 = uint4(rdLoad_intermediateValue6(productValue94).x, rdLoad_intermediateValue6(productValue94 + 1u).x, rdLoad_intermediateValue6(productValue94 + 2u).x, rdLoad_intermediateValue6(productValue94 + 3u).x);
                reinterpretedBits35 = asfloat(loadedBufferValue46.x);
                reinterpretedBits36 = asfloat(loadedBufferValue46.y);
                reinterpretedBits37 = asfloat(loadedBufferValue46.z);
                reinterpretedBits38 = asfloat(loadedBufferValue46.w);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                uint productValue94 = (comparisonValue29 * 20u) + 4u;
                uint4 loadedBufferValue72 = uint4(rdLoad_intermediateValue7(productValue94).x, rdLoad_intermediateValue7(productValue94 + 1u).x, rdLoad_intermediateValue7(productValue94 + 2u).x, rdLoad_intermediateValue7(productValue94 + 3u).x);
                reinterpretedBits35 = asfloat(loadedBufferValue72.x);
                reinterpretedBits36 = asfloat(loadedBufferValue72.y);
                reinterpretedBits37 = asfloat(loadedBufferValue72.z);
                reinterpretedBits38 = asfloat(loadedBufferValue72.w);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                uint productValue94 = (comparisonValue29 * 20u) + 4u;
                uint4 loadedBufferValue99 = uint4(rdLoad_intermediateValue8(productValue94).x, rdLoad_intermediateValue8(productValue94 + 1u).x, rdLoad_intermediateValue8(productValue94 + 2u).x, rdLoad_intermediateValue8(productValue94 + 3u).x);
                reinterpretedBits35 = asfloat(loadedBufferValue99.x);
                reinterpretedBits36 = asfloat(loadedBufferValue99.y);
                reinterpretedBits37 = asfloat(loadedBufferValue99.z);
                reinterpretedBits38 = asfloat(loadedBufferValue99.w);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                uint scalarValue1 = (comparisonValue1 * 20u) + 4u;
                float4 loadedBufferValue6 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(scalarValue1).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 1u).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 2u).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 3u).x));
                branchMergedValue = loadedBufferValue6.x;
                branchMergedValue1 = loadedBufferValue6.y;
                branchMergedValue2 = loadedBufferValue6.z;
                branchMergedValue3 = loadedBufferValue6.w;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                uint scalarValue1 = (comparisonValue1 * 20u) + 4u;
                float4 loadedBufferValue6 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(scalarValue1).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 1u).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 2u).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 3u).x));
                branchMergedValue4 = loadedBufferValue6.w;
                branchMergedValue9 = loadedBufferValue6.x;
                branchMergedValue10 = loadedBufferValue6.y;
                branchMergedValue11 = loadedBufferValue6.z;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                uint scalarValue1 = (comparisonValue1 * 20u) + 4u;
                float4 loadedBufferValue6 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(scalarValue1).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 1u).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 2u).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 3u).x));
                branchMergedValue = loadedBufferValue6.y;
                branchMergedValue2 = loadedBufferValue6.x;
                branchMergedValue3 = loadedBufferValue6.w;
                branchMergedValue4 = loadedBufferValue6.z;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                uint scalarValue1 = (comparisonValue1 * 20u) + 4u;
                float4 loadedBufferValue6 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(scalarValue1).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 1u).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 2u).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 3u).x));
                branchMergedValue4 = loadedBufferValue6.z;
                branchMergedValue9 = loadedBufferValue6.y;
                branchMergedValue10 = loadedBufferValue6.x;
                branchMergedValue11 = loadedBufferValue6.w;
#endif
            }
            else
            {
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                reinterpretedBits35 = comparisonValue22 ? asfloat(0xffffffffu ) : 0.0f;
                reinterpretedBits36 = asfloat(sumValue13);
                reinterpretedBits37 = 0.0f;
                reinterpretedBits38 = 0.0f;
            }
            float multiplyAddValue12;
            float multiplyAddValue13;
            float multiplyAddValue14;
            float multiplyAddValue15;
            if (!comparisonValue23)
            {
                uint productValue64 = (comparisonValue8 * 20u) + 4u;
                uint4 loadedBufferValue26 = uint4(rdLoad_intermediateValue5(productValue64).x, rdLoad_intermediateValue5(productValue64 + 1u).x, rdLoad_intermediateValue5(productValue64 + 2u).x, rdLoad_intermediateValue5(productValue64 + 3u).x);
                uint comparisonValue24 = ((comparisonValue11 ? 0u : loadedBufferValue17) * 20u) + 4u;
                uint4 loadedBufferValue27 = uint4(rdLoad_intermediateValue5(comparisonValue24).x, rdLoad_intermediateValue5(comparisonValue24 + 1u).x, rdLoad_intermediateValue5(comparisonValue24 + 2u).x, rdLoad_intermediateValue5(comparisonValue24 + 3u).x);
                uint comparisonValue25 = ((comparisonValue17 ? 0u : loadedBufferValue19) * 20u) + 4u;
                uint4 loadedBufferValue28 = uint4(rdLoad_intermediateValue5(comparisonValue25).x, rdLoad_intermediateValue5(comparisonValue25 + 1u).x, rdLoad_intermediateValue5(comparisonValue25 + 2u).x, rdLoad_intermediateValue5(comparisonValue25 + 3u).x);
                uint comparisonValue26 = ((comparisonValue18 ? 0u : loadedBufferValue22) * 20u) + 4u;
                uint4 loadedBufferValue29 = uint4(rdLoad_intermediateValue5(comparisonValue26).x, rdLoad_intermediateValue5(comparisonValue26 + 1u).x, rdLoad_intermediateValue5(comparisonValue26 + 2u).x, rdLoad_intermediateValue5(comparisonValue26 + 3u).x);
                float scalarValue7 = frac(reinterpretedBits30);
                float scalarValue8 = frac(reinterpretedBits31);
                float sumValue15 = 1.0f - scalarValue8;
                float sumValue16 = 1.0f - scalarValue7;
                float productValue66 = sumValue15 * sumValue16;
                float productValue67 = scalarValue7 * sumValue15;
                float productValue68 = scalarValue8 * sumValue16;
                float productValue69 = scalarValue8 * scalarValue7;
                multiplyAddValue12 = mad(asfloat(loadedBufferValue29.x), productValue69, mad(asfloat(loadedBufferValue28.x), productValue68, mad(asfloat(loadedBufferValue26.x), productValue66, asfloat(loadedBufferValue27.x) * productValue67)));
                multiplyAddValue13 = mad(asfloat(loadedBufferValue29.y), productValue69, mad(asfloat(loadedBufferValue28.y), productValue68, mad(asfloat(loadedBufferValue26.y), productValue66, asfloat(loadedBufferValue27.y) * productValue67)));
                multiplyAddValue14 = mad(asfloat(loadedBufferValue29.z), productValue69, mad(asfloat(loadedBufferValue28.z), productValue68, mad(asfloat(loadedBufferValue26.z), productValue66, asfloat(loadedBufferValue27.z) * productValue67)));
                multiplyAddValue15 = mad(asfloat(loadedBufferValue29.w), productValue69, mad(asfloat(loadedBufferValue28.w), productValue68, mad(asfloat(loadedBufferValue26.w), productValue66, asfloat(loadedBufferValue27.w) * productValue67)));
            }
            else
            {
                multiplyAddValue12 = reinterpretedBits35;
                multiplyAddValue13 = reinterpretedBits36;
                multiplyAddValue14 = reinterpretedBits37;
                multiplyAddValue15 = reinterpretedBits38;
            }
            intermediateValue19 = multiplyAddValue12;
            intermediateValue20 = multiplyAddValue13;
            intermediateValue21 = multiplyAddValue14;
            intermediateValue23 = multiplyAddValue15;
        }
        else
        {
            intermediateValue19 = scalarValue5;
            intermediateValue20 = scalarValue6;
            intermediateValue21 = intermediateValue22;
            intermediateValue23 = intermediateValue22;
        }
        float reinterpretedBits40;
        float reinterpretedBits41;
        float reinterpretedBits42;
        float reinterpretedBits43;
        if (!reinterpretedBits27)
        {
            uint4 reinterpretedBits39 = asuint(RD_UNIFORM_WATER_ALBEDO_EXTINCTION);
            reinterpretedBits40 = asfloat(reinterpretedBits39.w);
            reinterpretedBits41 = asfloat(reinterpretedBits39.z);
            reinterpretedBits42 = asfloat(reinterpretedBits39.y);
            reinterpretedBits43 = asfloat(reinterpretedBits39.x);
        }
        else
        {
            reinterpretedBits40 = intermediateValue23;
            reinterpretedBits41 = intermediateValue21;
            reinterpretedBits42 = intermediateValue20;
            reinterpretedBits43 = intermediateValue19;
        }
        float multiplyAddValue27 = clamp(mad(asfloat(asuint(RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.x)), multiplyAddValue21, asfloat(asuint(RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.y))), 0.0f, 1.0f);
        uint4 reinterpretedBits44 = asuint(RD_UNIFORM_AIR_ALBEDO_EXTINCTION);
        float reinterpretedBits45 = asfloat(asuint(RD_UNIFORM_AIR_ALBEDO_EXTINCTION.w));
        float reinterpretedBits46 = (multiplyAddValue27 * asfloat(reinterpretedBits44.x)) * reinterpretedBits45;
        float reinterpretedBits47 = (multiplyAddValue27 * asfloat(reinterpretedBits44.y)) * reinterpretedBits45;
        float reinterpretedBits48 = (multiplyAddValue27 * asfloat(reinterpretedBits44.z)) * reinterpretedBits45;
        float multiplyAddValue28 = mad(reinterpretedBits26, mad(reinterpretedBits43, reinterpretedBits40, -reinterpretedBits46), reinterpretedBits46);
        float multiplyAddValue29 = mad(reinterpretedBits26, mad(reinterpretedBits42, reinterpretedBits40, -reinterpretedBits47), reinterpretedBits47);
        float multiplyAddValue30 = mad(reinterpretedBits26, mad(reinterpretedBits41, reinterpretedBits40, -reinterpretedBits48), reinterpretedBits48);
        float multiplyAddValue31 = mad(reinterpretedBits26, mad(-multiplyAddValue27, reinterpretedBits45, reinterpretedBits40), multiplyAddValue27 * asfloat(reinterpretedBits44.w));
        float3 vectorValue = float3(multiplyAddValue23, multiplyAddValue24, multiplyAddValue25);
        float nonlinearValue1 = sqrt(rdDot3Precise(vectorValue, vectorValue));
        float clampedValue3 = clamp((((nonlinearValue1 / asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z))) + asfloat(asuint(RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x))) - asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x))) * asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y)), 0.0f, 1.0f);
        float multiplyAddValue32 = mad(clampedValue3, -multiplyAddValue28, multiplyAddValue28);
        float multiplyAddValue36 = mad(clampedValue3, -multiplyAddValue29, multiplyAddValue29);
        float multiplyAddValue37 = mad(clampedValue3, -multiplyAddValue30, multiplyAddValue30);
        float intermediateValue27;
        float intermediateValue28;
        if ((asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.x)) > 0.5f) && (asfloat(asuint(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w)) > 0.5f))
        {
            float4 sampledTextureValue1 = materialTexture9.SampleLevel(textureSampler9, float3(quotientValue5, 1.0f - quotientValue6, (exp2(((asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.y)) > 0.5f) ? (quotientValue7 - asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.z))) : quotientValue7) * 5.770780086517333984375f) - 1.0f) * 0.0186573602259159088134765625f), 0.0f);
            intermediateValue27 = sampledTextureValue1.y;
            intermediateValue28 = sampledTextureValue1.x;
        }
        else
        {
            intermediateValue27 = asfloat(asuint(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y));
            intermediateValue28 = 0.0f;
        }
        uint4 reinterpretedBits49 = asuint(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY);
        uint4 reinterpretedBits50 = asuint(RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY);
        float reinterpretedBits51 = asfloat(asuint(RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w));
        float reinterpretedBits52 = asfloat(asuint(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w));
        float reinterpretedBits53 = asfloat(asuint(RD_UNIFORM_MIN_AMBIENT_VALUE.x));
        float reinterpretedBits54 = asfloat(asuint(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w));
        float multiplyAddValue42 = ((multiplyAddValue32 * max(mad(intermediateValue28 * asfloat(reinterpretedBits49.x), reinterpretedBits52, (intermediateValue27 * asfloat(reinterpretedBits50.x)) * reinterpretedBits51), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float multiplyAddValue43 = ((multiplyAddValue36 * max(mad(intermediateValue28 * asfloat(reinterpretedBits49.y), reinterpretedBits52, (intermediateValue27 * asfloat(reinterpretedBits50.y)) * reinterpretedBits51), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float multiplyAddValue44 = ((multiplyAddValue37 * max(mad(intermediateValue28 * asfloat(reinterpretedBits49.z), reinterpretedBits52, (intermediateValue27 * asfloat(reinterpretedBits50.z)) * reinterpretedBits51), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float multiplyAddValue33;
        float multiplyAddValue34;
        float multiplyAddValue35;
        if ((asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.y)) == 0.0f) || (abs(intermediateValue27) > 9.9999997473787516355514526367188e-05f))
        {
            float reinterpretedBits55 = asfloat(asuint(RD_UNIFORM_HENYEY_GREENSTEIN_G.x));
            float multiplyAddValue54 = mad(reinterpretedBits26, asfloat(asuint(RD_UNIFORM_HENYEY_GREENSTEIN_G.y)) - reinterpretedBits55, reinterpretedBits55);
            float4 loadedBufferValue30 = materialTexture7.Load(int4(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z), 0u));
            float scalarValue9 = loadedBufferValue30.x;
            float reinterpretedBits56 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y));
            float reinterpretedBits57 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x));
            float reinterpretedBits58 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z));
            float reinterpretedBits59 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w));
            float multiplyAddValue55 = mad(reinterpretedBits23, reinterpretedBits59, mad(reinterpretedBits19, reinterpretedBits58, mad(reinterpretedBits15, reinterpretedBits57, reinterpretedBits11 * reinterpretedBits56)));
            float multiplyAddValue56 = mad(reinterpretedBits24, reinterpretedBits59, mad(reinterpretedBits20, reinterpretedBits58, mad(reinterpretedBits16, reinterpretedBits57, reinterpretedBits12 * reinterpretedBits56)));
            float multiplyAddValue57 = mad(reinterpretedBits25, reinterpretedBits59, mad(reinterpretedBits21, reinterpretedBits58, mad(reinterpretedBits17, reinterpretedBits57, reinterpretedBits13 * reinterpretedBits56)));
            float3 vectorValue1 = float3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
            float inverseLengthValue1 = rsqrt(rdDot3Precise(vectorValue1, vectorValue1));
            float multiplyAddValue58 = rdDot2Precise(rdDot3Precise(float3(-(multiplyAddValue23 / nonlinearValue1), -(multiplyAddValue24 / nonlinearValue1), -(multiplyAddValue25 / nonlinearValue1)), float3(inverseLengthValue1 * multiplyAddValue55, inverseLengthValue1 * multiplyAddValue56, inverseLengthValue1 * multiplyAddValue57)).xx, multiplyAddValue54.xx) + mad(multiplyAddValue54, multiplyAddValue54, 1.0f);
            float multiplyAddValue59 = (mad(-multiplyAddValue54, multiplyAddValue54, 1.0f) * 0.079577468335628509521484375f) / (sqrt(multiplyAddValue58) * multiplyAddValue58);
            float reinterpretedBits60 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w));
            uint4 reinterpretedBits61 = asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE);
            multiplyAddValue33 = mad(multiplyAddValue59 * (scalarValue9 * multiplyAddValue37), reinterpretedBits60 * asfloat(reinterpretedBits61.z), multiplyAddValue44);
            multiplyAddValue34 = mad(multiplyAddValue59 * (scalarValue9 * multiplyAddValue36), reinterpretedBits60 * asfloat(reinterpretedBits61.y), multiplyAddValue43);
            multiplyAddValue35 = mad(multiplyAddValue59 * (scalarValue9 * multiplyAddValue32), reinterpretedBits60 * asfloat(reinterpretedBits61.x), multiplyAddValue42);
        }
        else
        {
            multiplyAddValue33 = multiplyAddValue44;
            multiplyAddValue34 = multiplyAddValue43;
            multiplyAddValue35 = multiplyAddValue42;
        }
        rdAccess_intermediateValue6(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)) = float4(multiplyAddValue35, multiplyAddValue34, multiplyAddValue33, mad(clampedValue3, -multiplyAddValue31, multiplyAddValue31));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                reinterpretedBits35 = asfloat(sumValue14);
                reinterpretedBits36 = asfloat(sumValue62);
                reinterpretedBits37 = 0.0f;
                reinterpretedBits38 = 0.0f;
            }
            float multiplyAddValue12;
            float multiplyAddValue13;
            float multiplyAddValue14;
            float multiplyAddValue15;
            if (!comparisonValue48)
            {
                uint productValue95 = (comparisonValue29 * 20u) + 4u;
                uint4 loadedBufferValue47 = uint4(rdLoad_intermediateValue6(productValue95).x, rdLoad_intermediateValue6(productValue95 + 1u).x, rdLoad_intermediateValue6(productValue95 + 2u).x, rdLoad_intermediateValue6(productValue95 + 3u).x);
                uint comparisonValue49 = ((comparisonValue30 ? 0u : loadedBufferValue43) * 20u) + 4u;
                uint4 loadedBufferValue48 = uint4(rdLoad_intermediateValue6(comparisonValue49).x, rdLoad_intermediateValue6(comparisonValue49 + 1u).x, rdLoad_intermediateValue6(comparisonValue49 + 2u).x, rdLoad_intermediateValue6(comparisonValue49 + 3u).x);
                uint comparisonValue50 = ((comparisonValue44 ? 0u : loadedBufferValue44) * 20u) + 4u;
                uint4 loadedBufferValue49 = uint4(rdLoad_intermediateValue6(comparisonValue50).x, rdLoad_intermediateValue6(comparisonValue50 + 1u).x, rdLoad_intermediateValue6(comparisonValue50 + 2u).x, rdLoad_intermediateValue6(comparisonValue50 + 3u).x);
                uint comparisonValue51 = ((comparisonValue45 ? 0u : loadedBufferValue45) * 20u) + 4u;
                uint4 loadedBufferValue50 = uint4(rdLoad_intermediateValue6(comparisonValue51).x, rdLoad_intermediateValue6(comparisonValue51 + 1u).x, rdLoad_intermediateValue6(comparisonValue51 + 2u).x, rdLoad_intermediateValue6(comparisonValue51 + 3u).x);
                float scalarValue7 = frac(reinterpretedBits30);
                float scalarValue8 = frac(reinterpretedBits31);
                float sumValue15 = 1.0f - scalarValue8;
                float sumValue16 = 1.0f - scalarValue7;
                float productValue66 = sumValue15 * sumValue16;
                float productValue96 = sumValue15 * scalarValue7;
                float productValue97 = sumValue16 * scalarValue8;
                float productValue69 = scalarValue8 * scalarValue7;
                multiplyAddValue12 = mad(asfloat(loadedBufferValue50.x), productValue69, mad(asfloat(loadedBufferValue49.x), productValue97, mad(asfloat(loadedBufferValue47.x), productValue66, productValue96 * asfloat(loadedBufferValue48.x))));
                multiplyAddValue13 = mad(asfloat(loadedBufferValue50.y), productValue69, mad(asfloat(loadedBufferValue49.y), productValue97, mad(asfloat(loadedBufferValue47.y), productValue66, productValue96 * asfloat(loadedBufferValue48.y))));
                multiplyAddValue14 = mad(asfloat(loadedBufferValue50.z), productValue69, mad(asfloat(loadedBufferValue49.z), productValue97, mad(asfloat(loadedBufferValue47.z), productValue66, productValue96 * asfloat(loadedBufferValue48.z))));
                multiplyAddValue15 = mad(asfloat(loadedBufferValue50.w), productValue69, mad(asfloat(loadedBufferValue49.w), productValue97, mad(asfloat(loadedBufferValue47.w), productValue66, productValue96 * asfloat(loadedBufferValue48.w))));
            }
            else
            {
                multiplyAddValue12 = reinterpretedBits35;
                multiplyAddValue13 = reinterpretedBits36;
                multiplyAddValue14 = reinterpretedBits37;
                multiplyAddValue15 = reinterpretedBits38;
            }
            intermediateValue21 = multiplyAddValue12;
            intermediateValue23 = multiplyAddValue13;
            intermediateValue24 = multiplyAddValue14;
            intermediateValue25 = multiplyAddValue15;
        }
        else
        {
            intermediateValue21 = intermediateValue22;
            intermediateValue23 = intermediateValue22;
            intermediateValue24 = intermediateValue22;
            intermediateValue25 = intermediateValue22;
        }
        float reinterpretedBits40;
        float reinterpretedBits41;
        float reinterpretedBits42;
        float reinterpretedBits43;
        if (!reinterpretedBits27)
        {
            uint4 reinterpretedBits39 = asuint(RD_UNIFORM_WATER_ALBEDO_EXTINCTION);
            reinterpretedBits40 = asfloat(reinterpretedBits39.w);
            reinterpretedBits41 = asfloat(reinterpretedBits39.z);
            reinterpretedBits42 = asfloat(reinterpretedBits39.y);
            reinterpretedBits43 = asfloat(reinterpretedBits39.x);
        }
        else
        {
            reinterpretedBits40 = intermediateValue25;
            reinterpretedBits41 = intermediateValue24;
            reinterpretedBits42 = intermediateValue23;
            reinterpretedBits43 = intermediateValue21;
        }
        float multiplyAddValue27 = clamp(mad(asfloat(asuint(RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.x)), multiplyAddValue21, asfloat(asuint(RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.y))), 0.0f, 1.0f);
        uint4 reinterpretedBits44 = asuint(RD_UNIFORM_AIR_ALBEDO_EXTINCTION);
        float reinterpretedBits45 = asfloat(asuint(RD_UNIFORM_AIR_ALBEDO_EXTINCTION.w));
        float reinterpretedBits46 = (multiplyAddValue27 * asfloat(reinterpretedBits44.x)) * reinterpretedBits45;
        float reinterpretedBits47 = (multiplyAddValue27 * asfloat(reinterpretedBits44.y)) * reinterpretedBits45;
        float reinterpretedBits48 = (multiplyAddValue27 * asfloat(reinterpretedBits44.z)) * reinterpretedBits45;
        float multiplyAddValue68 = mad(reinterpretedBits62, mad(reinterpretedBits43, reinterpretedBits40, -reinterpretedBits46), reinterpretedBits46);
        float multiplyAddValue69 = mad(reinterpretedBits62, mad(reinterpretedBits42, reinterpretedBits40, -reinterpretedBits47), reinterpretedBits47);
        float multiplyAddValue71 = mad(reinterpretedBits62, mad(reinterpretedBits41, reinterpretedBits40, -reinterpretedBits48), reinterpretedBits48);
        float multiplyAddValue72 = mad(reinterpretedBits62, mad(-multiplyAddValue27, reinterpretedBits45, reinterpretedBits40), multiplyAddValue27 * asfloat(reinterpretedBits44.w));
        float reinterpretedBits55 = asfloat(asuint(RD_UNIFORM_HENYEY_GREENSTEIN_G.x));
        float multiplyAddValue73 = mad(reinterpretedBits62, asfloat(asuint(RD_UNIFORM_HENYEY_GREENSTEIN_G.y)) - reinterpretedBits55, reinterpretedBits55);
        float3 vectorValue = float3(multiplyAddValue23, multiplyAddValue24, multiplyAddValue25);
        float nonlinearValue1 = sqrt(rdDot3Precise(vectorValue, vectorValue));
        float clampedValue3 = clamp((((nonlinearValue1 / asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z))) + asfloat(asuint(RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x))) - asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x))) * asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y)), 0.0f, 1.0f);
        float multiplyAddValue74 = mad(clampedValue3, -multiplyAddValue68, multiplyAddValue68);
        float multiplyAddValue75 = mad(clampedValue3, -multiplyAddValue69, multiplyAddValue69);
        float multiplyAddValue76 = mad(clampedValue3, -multiplyAddValue71, multiplyAddValue71);
        float intermediateValue29;
        float intermediateValue30;
        if ((asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.x)) > 0.5f) && (asfloat(asuint(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w)) > 0.5f))
        {
            float4 sampledTextureValue1 = materialTexture9.SampleLevel(textureSampler9, float3(quotientValue5, 1.0f - quotientValue6, (exp2(((asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.y)) > 0.5f) ? (quotientValue7 - asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.z))) : quotientValue7) * 5.770780086517333984375f) - 1.0f) * 0.0186573602259159088134765625f), 0.0f);
            intermediateValue29 = sampledTextureValue1.y;
            intermediateValue30 = sampledTextureValue1.x;
        }
        else
        {
            intermediateValue29 = asfloat(asuint(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y));
            intermediateValue30 = 0.0f;
        }
        uint4 reinterpretedBits49 = asuint(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY);
        uint4 reinterpretedBits50 = asuint(RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY);
        float reinterpretedBits51 = asfloat(asuint(RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w));
        float reinterpretedBits52 = asfloat(asuint(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w));
        float reinterpretedBits53 = asfloat(asuint(RD_UNIFORM_MIN_AMBIENT_VALUE.x));
        float reinterpretedBits54 = asfloat(asuint(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w));
        float multiplyAddValue77 = ((multiplyAddValue74 * max(mad(intermediateValue30 * asfloat(reinterpretedBits49.x), reinterpretedBits52, (intermediateValue29 * asfloat(reinterpretedBits50.x)) * reinterpretedBits51), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float multiplyAddValue78 = ((multiplyAddValue75 * max(mad(intermediateValue30 * asfloat(reinterpretedBits49.y), reinterpretedBits52, (intermediateValue29 * asfloat(reinterpretedBits50.y)) * reinterpretedBits51), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float multiplyAddValue79 = ((multiplyAddValue76 * max(mad(intermediateValue30 * asfloat(reinterpretedBits49.z), reinterpretedBits52, (intermediateValue29 * asfloat(reinterpretedBits50.z)) * reinterpretedBits51), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float quotientValue17 = multiplyAddValue23 / nonlinearValue1;
        float quotientValue18 = multiplyAddValue24 / nonlinearValue1;
        float quotientValue19 = multiplyAddValue25 / nonlinearValue1;
        float multiplyAddValue33;
        float multiplyAddValue34;
        float multiplyAddValue35;
        if ((abs(intermediateValue29) > 9.9999997473787516355514526367188e-05f) || (asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.y)) == 0.0f))
        {
            float4 loadedBufferValue30 = materialTexture7.Load(int4(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z), 0u));
            float scalarValue9 = loadedBufferValue30.x;
            float reinterpretedBits56 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y));
            float reinterpretedBits57 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x));
            float reinterpretedBits58 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z));
            float reinterpretedBits59 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w));
            float multiplyAddValue55 = mad(reinterpretedBits23, reinterpretedBits59, mad(reinterpretedBits19, reinterpretedBits58, mad(reinterpretedBits15, reinterpretedBits57, reinterpretedBits11 * reinterpretedBits56)));
            float multiplyAddValue56 = mad(reinterpretedBits24, reinterpretedBits59, mad(reinterpretedBits20, reinterpretedBits58, mad(reinterpretedBits16, reinterpretedBits57, reinterpretedBits12 * reinterpretedBits56)));
            float multiplyAddValue57 = mad(reinterpretedBits25, reinterpretedBits59, mad(reinterpretedBits21, reinterpretedBits58, mad(reinterpretedBits17, reinterpretedBits57, reinterpretedBits13 * reinterpretedBits56)));
            float3 vectorValue1 = float3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
            float inverseLengthValue1 = rsqrt(rdDot3Precise(vectorValue1, vectorValue1));
            float multiplyAddValue80 = rdDot2Precise(rdDot3Precise(float3(-quotientValue17, -quotientValue18, -quotientValue19), float3(inverseLengthValue1 * multiplyAddValue55, inverseLengthValue1 * multiplyAddValue56, inverseLengthValue1 * multiplyAddValue57)).xx, multiplyAddValue73.xx) + mad(multiplyAddValue73, multiplyAddValue73, 1.0f);
            float multiplyAddValue81 = (mad(-multiplyAddValue73, multiplyAddValue73, 1.0f) * 0.079577468335628509521484375f) / (multiplyAddValue80 * sqrt(multiplyAddValue80));
            float reinterpretedBits60 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w));
            uint4 reinterpretedBits61 = asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE);
            multiplyAddValue33 = mad(multiplyAddValue81 * (scalarValue9 * multiplyAddValue74), reinterpretedBits60 * asfloat(reinterpretedBits61.x), multiplyAddValue77);
            multiplyAddValue34 = mad(multiplyAddValue81 * (scalarValue9 * multiplyAddValue75), reinterpretedBits60 * asfloat(reinterpretedBits61.y), multiplyAddValue78);
            multiplyAddValue35 = mad(multiplyAddValue81 * (scalarValue9 * multiplyAddValue76), reinterpretedBits60 * asfloat(reinterpretedBits61.z), multiplyAddValue79);
        }
        else
        {
            multiplyAddValue33 = multiplyAddValue77;
            multiplyAddValue34 = multiplyAddValue78;
            multiplyAddValue35 = multiplyAddValue79;
        }
        bool reinterpretedBits63 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z)) != 0.0f;
        float multiplyAddValue38;
        float multiplyAddValue39;
        float multiplyAddValue40;
        if ((asfloat(asuint(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.y)) != 0.0f) && reinterpretedBits63)
        {
            float reinterpretedBits64 = 1.0f - asfloat(asuint(RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x));
            float scalarValue19 = -multiplyAddValue25;
            float reinterpretedBits65 = asfloat(asuint(RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z));
            float productValue98 = scalarValue19 * reinterpretedBits65;
            float reinterpretedBits66 = asfloat(asuint(RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w));
            uint4 reinterpretedBits67 = asuint(RD_UNIFORM_CLUSTER_DEPTH_BOUNDS);
            bool reinterpretedBits68 = scalarValue19 < asfloat(reinterpretedBits67.x);
            bool reinterpretedBits69 = scalarValue19 < asfloat(reinterpretedBits67.y);
            uint4 reinterpretedBits70 = asuint(RD_UNIFORM_CLUSTER_DIMENSIONS);
            float reinterpretedBits71 = asfloat(reinterpretedBits70.x);
            float reinterpretedBits72 = asfloat(reinterpretedBits70.y);
            float reinterpretedBits73 = asfloat(reinterpretedBits70.z);
            float clampedValue8 = min(reinterpretedBits73 - 1.0f, floor(clamp((log2(scalarValue19) - asfloat(asuint(RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z))) * asfloat(asuint(RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x)), 0.0f, 1.0f) * (reinterpretedBits73 - 2.0f)) + 2.0f);
            float comparisonValue52 = reinterpretedBits69 ? 1.0f : clampedValue8;
            float multiplyAddValue82 = min(reinterpretedBits72 - 1.0f, floor(clamp(mad(scalarValue19, reinterpretedBits65, multiplyAddValue24) / (productValue98 + productValue98), 0.0f, 1.0f) * reinterpretedBits72));
            float multiplyAddValue83 = min(reinterpretedBits71 - 1.0f, floor(clamp(mad(productValue98, reinterpretedBits66, multiplyAddValue23) / mad(productValue98, reinterpretedBits66, productValue98 * reinterpretedBits66), 0.0f, 1.0f) * reinterpretedBits71));
            float reinterpretedBits74 = asfloat(asuint(RD_UNIFORM_CLUSTER_DIMENSIONS.x));
            float reinterpretedBits75 = asfloat(asuint(RD_UNIFORM_CLUSTER_DIMENSIONS.y));
            float intermediateValue35;
            float intermediateValue37;
            float intermediateValue39;
            if (!(((reinterpretedBits68 ? 0.0f : comparisonValue52) >= asfloat(asuint(RD_UNIFORM_CLUSTER_DIMENSIONS.z))) || (((multiplyAddValue83 >= reinterpretedBits74) || (((multiplyAddValue83 < 0.0f) || (multiplyAddValue82 < 0.0f)) || (((clampedValue8 < 0.0f) && (!reinterpretedBits69)) && (!reinterpretedBits68)))) || (multiplyAddValue82 >= reinterpretedBits75))))
            {
                float multiplyAddValue84 = mad(multiplyAddValue82, reinterpretedBits74, multiplyAddValue83);
                uint reinterpretedBits76 = uint(int(asfloat(asuint(RD_UNIFORM_CLUSTER_DIMENSIONS.w))));
                uint multiplyAddValue85 = uint(int(reinterpretedBits68 ? multiplyAddValue84 : mad(reinterpretedBits75, reinterpretedBits74 * comparisonValue52, multiplyAddValue84))) * reinterpretedBits76;
                uint sumValue63 = multiplyAddValue85 + reinterpretedBits76;
                bool reinterpretedBits77 = asfloat(asuint(RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x)) > 0.0f;
                bool reinterpretedBits78 = asfloat(asuint(RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x)) > 0.0f;
                float reinterpretedBits79 = asfloat(asuint(RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x));
                float scalarValue20 = -reinterpretedBits79;
                uint4 reinterpretedBits80 = asuint(RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION);
                float reinterpretedBits81 = asfloat(reinterpretedBits80.x);
                float reinterpretedBits82 = asfloat(reinterpretedBits80.y);
                float quotientValue20 = 0.5f / reinterpretedBits81;
                float quotientValue21 = 0.5f / reinterpretedBits82;
                float reinterpretedBits83 = 1.0f / (asfloat(asuint(RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y)) - reinterpretedBits79);
                float multiplyAddValue86 = mad(multiplyAddValue73, multiplyAddValue73, 1.0f);
                float sumValue64 = multiplyAddValue73 + multiplyAddValue73;
                float multiplyAddValue87 = mad(-multiplyAddValue73, multiplyAddValue73, 1.0f) * 0.079577468335628509521484375f;
                float intermediateValue36;
                float intermediateValue38;
                float intermediateValue40;
                intermediateValue40 = 0.0f;
                intermediateValue38 = 0.0f;
                intermediateValue36 = 0.0f;
                float multiplyAddValue45;
                float multiplyAddValue46;
                float multiplyAddValue47;
                uint sumValue9;
                uint scalarValue21 = multiplyAddValue85;
                for (;;)
                {
                    if (int(scalarValue21) >= int(sumValue63))
                    {
                        break;
                    }
                    uint loadedBufferValue51 = uint(int(asfloat(rdLoad_intermediateValue7(scalarValue21).x)));
                    if (int(loadedBufferValue51) < int(0u))
                    {
                        break;
                    }
                    float intermediateValue44;
                    float intermediateValue45;
                    float intermediateValue46;
                    bool intermediateValue47;
                    if (int(loadedBufferValue51) >= int(0u))
                    {
                        uint productValue99 = loadedBufferValue51 * 32u;
                        float4 loadedBufferValue52 = asfloat(uint4(rdLoad_intermediateValue8(productValue99).x, rdLoad_intermediateValue8(productValue99 + 1u).x, rdLoad_intermediateValue8(productValue99 + 2u).x, rdLoad_intermediateValue8(productValue99 + 3u).x));
                        float scalarValue22 = loadedBufferValue52.w;
                        float sumValue65 = loadedBufferValue52.x - multiplyAddValue20;
                        float sumValue66 = loadedBufferValue52.y - multiplyAddValue21;
                        float sumValue67 = loadedBufferValue52.z - multiplyAddValue22;
                        float sumValue68 = abs(sumValue67) + (abs(sumValue66) + abs(sumValue65));
                        float3 vectorValue2 = float3(sumValue65, sumValue66, sumValue67);
                        float comparisonValue53 = reinterpretedBits77 ? (sumValue68 * sumValue68) : rdDot3Precise(vectorValue2, vectorValue2);
                        float productValue10;
                        float productValue11;
                        float productValue12;
                        bool intermediateValue48;
                        if (comparisonValue53 < (scalarValue22 * scalarValue22))
                        {
                            bool intermediateValue53;
                            if (reinterpretedBits63)
                            {
                                uint productValue100 = loadedBufferValue51 * 32u;
                                float3 loadedBufferValue53 = asfloat(uint3(rdLoad_intermediateValue8(productValue100).x, rdLoad_intermediateValue8(productValue100 + 1u).x, rdLoad_intermediateValue8(productValue100 + 2u).x));
                                float scalarValue23 = loadedBufferValue53.x;
                                float scalarValue24 = loadedBufferValue53.y;
                                float scalarValue25 = loadedBufferValue53.z;
                                uint productValue101 = (loadedBufferValue51 * 32u) + 8u;
                                float4 loadedBufferValue54 = asfloat(uint4(rdLoad_intermediateValue8(productValue101).x, rdLoad_intermediateValue8(productValue101 + 1u).x, rdLoad_intermediateValue8(productValue101 + 2u).x, rdLoad_intermediateValue8(productValue101 + 3u).x));
                                uint productValue102 = (loadedBufferValue51 * 32u) + 12u;
                                float4 loadedBufferValue55 = asfloat(uint4(rdLoad_intermediateValue8(productValue102).x, rdLoad_intermediateValue8(productValue102 + 1u).x, rdLoad_intermediateValue8(productValue102 + 2u).x, rdLoad_intermediateValue8(productValue102 + 3u).x));
                                uint productValue103 = (loadedBufferValue51 * 32u) + 16u;
                                float4 loadedBufferValue56 = asfloat(uint4(rdLoad_intermediateValue8(productValue103).x, rdLoad_intermediateValue8(productValue103 + 1u).x, rdLoad_intermediateValue8(productValue103 + 2u).x, rdLoad_intermediateValue8(productValue103 + 3u).x));
                                uint productValue104 = (loadedBufferValue51 * 32u) + 20u;
                                float4 loadedBufferValue57 = asfloat(uint4(rdLoad_intermediateValue8(productValue104).x, rdLoad_intermediateValue8(productValue104 + 1u).x, rdLoad_intermediateValue8(productValue104 + 2u).x, rdLoad_intermediateValue8(productValue104 + 3u).x));
                                uint productValue105 = (loadedBufferValue51 * 32u) + 24u;
                                float4 loadedBufferValue58 = asfloat(uint4(rdLoad_intermediateValue8(productValue105).x, rdLoad_intermediateValue8(productValue105 + 1u).x, rdLoad_intermediateValue8(productValue105 + 2u).x, rdLoad_intermediateValue8(productValue105 + 3u).x));
                                uint productValue106 = (loadedBufferValue51 * 32u) + 28u;
                                float4 loadedBufferValue59 = asfloat(uint4(rdLoad_intermediateValue8(productValue106).x, rdLoad_intermediateValue8(productValue106 + 1u).x, rdLoad_intermediateValue8(productValue106 + 2u).x, rdLoad_intermediateValue8(productValue106 + 3u).x));
                                float sumValue69 = multiplyAddValue20 - scalarValue23;
                                float sumValue70 = multiplyAddValue21 - scalarValue24;
                                float sumValue71 = multiplyAddValue22 - scalarValue25;
                                float scalarValue26 = abs(sumValue69);
                                float scalarValue27 = abs(sumValue70);
                                float scalarValue28 = abs(sumValue71);
                                bool comparisonValue54 = scalarValue27 >= scalarValue28;
                                bool comparisonValue55 = (scalarValue26 >= scalarValue27) && (scalarValue26 >= scalarValue28);
                                bool comparisonValue56 = sumValue70 >= 0.0f;
                                bool comparisonValue57 = sumValue71 >= 0.0f;
                                bool conditionValue6 = !comparisonValue55;
                                bool comparisonValue58 = (!(sumValue69 >= 0.0f)) && comparisonValue55;
                                bool bitwiseValue = (comparisonValue54 && comparisonValue56) && conditionValue6;
                                bool bitwiseValue1 = conditionValue6 && ((!comparisonValue56) && comparisonValue54);
                                bool bitwiseValue2 = ((!comparisonValue54) && comparisonValue57) && conditionValue6;
                                bool bitwiseValue3 = comparisonValue55 || (comparisonValue54 || comparisonValue57);
                                float comparisonValue59 = comparisonValue58 ? loadedBufferValue55.z : (bitwiseValue ? loadedBufferValue56.z : (bitwiseValue1 ? loadedBufferValue57.z : (bitwiseValue2 ? loadedBufferValue58.z : (bitwiseValue3 ? loadedBufferValue54.z : loadedBufferValue59.z))));
                                float comparisonValue60 = comparisonValue58 ? loadedBufferValue55.w : (bitwiseValue ? loadedBufferValue56.w : (bitwiseValue1 ? loadedBufferValue57.w : (bitwiseValue2 ? loadedBufferValue58.w : (bitwiseValue3 ? loadedBufferValue54.w : loadedBufferValue59.w))));
                                bool multiplyAddValue52;
                                if (!((comparisonValue60 == 0.0f) && (comparisonValue59 == 0.0f)))
                                {
                                    float scalarValue29 = scalarValue23 - multiplyAddValue20;
                                    float sumValue72 = scalarValue25 - multiplyAddValue22;
                                    float comparisonValue61 = comparisonValue58 ? loadedBufferValue55.x : (bitwiseValue ? loadedBufferValue56.x : (bitwiseValue1 ? loadedBufferValue57.x : (bitwiseValue2 ? loadedBufferValue58.x : (bitwiseValue3 ? loadedBufferValue54.x : loadedBufferValue59.x))));
                                    float comparisonValue62 = comparisonValue58 ? loadedBufferValue55.y : (bitwiseValue ? loadedBufferValue56.y : (bitwiseValue1 ? loadedBufferValue57.y : (bitwiseValue2 ? loadedBufferValue58.y : (bitwiseValue3 ? loadedBufferValue54.y : loadedBufferValue59.y))));
                                    float comparisonValue63 = comparisonValue58 ? sumValue72 : ((bitwiseValue || (bitwiseValue2 || bitwiseValue1)) ? scalarValue29 : (bitwiseValue3 ? sumValue71 : sumValue69));
                                    float comparisonValue64 = comparisonValue58 ? sumValue70 : (bitwiseValue ? sumValue72 : (bitwiseValue1 ? sumValue71 : sumValue70));
                                    float comparisonValue65 = comparisonValue58 ? sumValue69 : (bitwiseValue ? (scalarValue24 - multiplyAddValue21) : (bitwiseValue1 ? sumValue70 : (bitwiseValue2 ? sumValue72 : (bitwiseValue3 ? scalarValue29 : sumValue71))));
                                    uint4 reinterpretedBits84 = asuint(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1);
                                    uint4 reinterpretedBits85 = asuint(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0);
                                    uint4 reinterpretedBits86 = asuint(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2);
                                    uint4 reinterpretedBits87 = asuint(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3);
                                    float multiplyAddValue88 = mad(asfloat(reinterpretedBits86.w), comparisonValue65, mad(asfloat(reinterpretedBits85.w), comparisonValue63, comparisonValue64 * asfloat(reinterpretedBits84.w))) + asfloat(reinterpretedBits87.w);
                                    float sumValue73 = comparisonValue59 - comparisonValue61;
                                    float sumValue74 = comparisonValue60 - comparisonValue62;
                                    float productValue107 = sumValue73 * reinterpretedBits81;
                                    float productValue108 = sumValue74 * reinterpretedBits82;
                                    float4 sampledTextureValue3 = materialTexture2.SampleLevel(textureSampler2, float2(min(comparisonValue59 - quotientValue20, max(quotientValue20 + comparisonValue61, mad((floor(mad((mad(asfloat(reinterpretedBits86.x), comparisonValue65, mad(asfloat(reinterpretedBits85.x), comparisonValue63, comparisonValue64 * asfloat(reinterpretedBits84.x))) + asfloat(reinterpretedBits87.x)) / multiplyAddValue88, 0.5f, 0.5f) * productValue107) + 0.5f) / productValue107, sumValue73, comparisonValue61))), min(comparisonValue60 - quotientValue21, max(quotientValue21 + comparisonValue62, mad((floor((1.0f - mad((mad(asfloat(reinterpretedBits86.y), comparisonValue65, mad(asfloat(reinterpretedBits85.y), comparisonValue63, comparisonValue64 * asfloat(reinterpretedBits84.y))) + asfloat(reinterpretedBits87.y)) / multiplyAddValue88, 0.5f, 0.5f)) * productValue108) + 0.5f) / productValue108, sumValue74, comparisonValue62)))), 0.0f);
                                    multiplyAddValue52 = sampledTextureValue3.x >= ((mad(asfloat(reinterpretedBits86.z), comparisonValue65, mad(asfloat(reinterpretedBits85.z), comparisonValue63, comparisonValue64 * asfloat(reinterpretedBits84.z))) + asfloat(reinterpretedBits87.z)) / multiplyAddValue88);
                                }
                                else
                                {
                                    multiplyAddValue52 = false;
                                }
                                intermediateValue53 = multiplyAddValue52;
                            }
                            else
                            {
                                intermediateValue53 = true;
                            }
                            float quotientValue22 = 1.0f / max(comparisonValue53, 0.100000001490116119384765625f);
                            float multiplyAddValue89 = comparisonValue53 / mad(scalarValue22, scalarValue22, 9.9999997473787516355514526367188e-05f);
                            float multiplyAddValue90 = max(mad(-multiplyAddValue89, multiplyAddValue89, 1.0f), 0.0f);
                            float productValue109 = multiplyAddValue90 * multiplyAddValue90;
                            float productValue110 = productValue109 * quotientValue22;
                            float multiplyAddValue91 = clamp(reinterpretedBits83 * (mad(-quotientValue22, productValue109, scalarValue20) + 1.0f), 0.0f, 1.0f);
                            float multiplyAddValue92 = reinterpretedBits78 ? (clamp(mad((multiplyAddValue91 * multiplyAddValue91) * mad(multiplyAddValue91, -2.0f, 3.0f), asfloat(asuint(RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z)), asfloat(asuint(RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w))), 0.0f, 1.0f) * productValue110) : productValue110;
                            uint productValue111 = (loadedBufferValue51 * 32u) + 4u;
                            float4 loadedBufferValue60 = asfloat(uint4(rdLoad_intermediateValue8(productValue111).x, rdLoad_intermediateValue8(productValue111 + 1u).x, rdLoad_intermediateValue8(productValue111 + 2u).x, rdLoad_intermediateValue8(productValue111 + 3u).x));
                            float scalarValue30 = loadedBufferValue60.w;
                            intermediateValue48 = intermediateValue53;
                            productValue12 = multiplyAddValue92 * (scalarValue30 * loadedBufferValue60.x);
                            productValue11 = multiplyAddValue92 * (scalarValue30 * loadedBufferValue60.y);
                            productValue10 = multiplyAddValue92 * (scalarValue30 * loadedBufferValue60.z);
                        }
                        else
                        {
                            intermediateValue48 = true;
                            productValue12 = 0.0f;
                            productValue11 = 0.0f;
                            productValue10 = 0.0f;
                        }
                        intermediateValue44 = productValue10;
                        intermediateValue45 = productValue11;
                        intermediateValue46 = productValue12;
                        intermediateValue47 = intermediateValue48;
                    }
                    else
                    {
                        intermediateValue44 = 0.0f;
                        intermediateValue45 = 0.0f;
                        intermediateValue46 = 0.0f;
                        intermediateValue47 = true;
                    }
                    uint productValue112 = loadedBufferValue51 * 32u;
                    float3 loadedBufferValue61 = asfloat(uint3(rdLoad_intermediateValue8(productValue112).x, rdLoad_intermediateValue8(productValue112 + 1u).x, rdLoad_intermediateValue8(productValue112 + 2u).x));
                    float scalarValue31 = loadedBufferValue61.x;
                    float scalarValue32 = loadedBufferValue61.y;
                    float scalarValue33 = loadedBufferValue61.z;
                    float multiplyAddValue93 = (mad(reinterpretedBits19, scalarValue33, mad(reinterpretedBits15, scalarValue31, scalarValue32 * reinterpretedBits11)) + reinterpretedBits23) - multiplyAddValue23;
                    float multiplyAddValue94 = (mad(reinterpretedBits20, scalarValue33, mad(reinterpretedBits16, scalarValue31, scalarValue32 * reinterpretedBits12)) + reinterpretedBits24) - multiplyAddValue24;
                    float multiplyAddValue95 = (mad(reinterpretedBits21, scalarValue33, mad(reinterpretedBits17, scalarValue31, scalarValue32 * reinterpretedBits13)) + reinterpretedBits25) - multiplyAddValue25;
                    float3 vectorValue3 = float3(multiplyAddValue93, multiplyAddValue94, multiplyAddValue95);
                    float inverseLengthValue3 = rsqrt(rdDot3Precise(vectorValue3, vectorValue3));
                    float multiplyAddValue96 = mad(sumValue64, rdDot3Precise(float3(-quotientValue17, -quotientValue18, -quotientValue19), float3(multiplyAddValue93 * inverseLengthValue3, multiplyAddValue94 * inverseLengthValue3, multiplyAddValue95 * inverseLengthValue3)), multiplyAddValue86);
                    float nonlinearValue4 = multiplyAddValue87 / (sqrt(multiplyAddValue96) * multiplyAddValue96);
                    multiplyAddValue45 = intermediateValue47 ? mad(intermediateValue46, multiplyAddValue74 * nonlinearValue4, intermediateValue40) : intermediateValue40;
                    multiplyAddValue46 = intermediateValue47 ? mad(intermediateValue45, multiplyAddValue75 * nonlinearValue4, intermediateValue38) : intermediateValue38;
                    multiplyAddValue47 = intermediateValue47 ? mad(intermediateValue44, multiplyAddValue76 * nonlinearValue4, intermediateValue36) : intermediateValue36;
                    sumValue9 = scalarValue21 + 1u;
                    intermediateValue40 = multiplyAddValue45;
                    intermediateValue38 = multiplyAddValue46;
                    intermediateValue36 = multiplyAddValue47;
                    scalarValue21 = sumValue9;
                    continue;
                }
                intermediateValue35 = intermediateValue36;
                intermediateValue37 = intermediateValue38;
                intermediateValue39 = intermediateValue40;
            }
            else
            {
                intermediateValue35 = 0.0f;
                intermediateValue37 = 0.0f;
                intermediateValue39 = 0.0f;
            }
            multiplyAddValue38 = mad(reinterpretedBits64, intermediateValue35, multiplyAddValue35);
            multiplyAddValue39 = mad(reinterpretedBits64, intermediateValue37, multiplyAddValue34);
            multiplyAddValue40 = mad(reinterpretedBits64, intermediateValue39, multiplyAddValue33);
        }
        else
        {
            multiplyAddValue38 = multiplyAddValue35;
            multiplyAddValue39 = multiplyAddValue34;
            multiplyAddValue40 = multiplyAddValue33;
        }
        rdAccess_intermediateValue9(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)) = float4(multiplyAddValue40, multiplyAddValue39, multiplyAddValue38, mad(clampedValue3, -multiplyAddValue72, multiplyAddValue72));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                reinterpretedBits35 = asfloat(sumValue14);
                reinterpretedBits36 = asfloat(sumValue62);
                reinterpretedBits37 = 0.0f;
                reinterpretedBits38 = 0.0f;
            }
            float multiplyAddValue12;
            float multiplyAddValue13;
            float multiplyAddValue14;
            float multiplyAddValue15;
            if (!comparisonValue73)
            {
                uint productValue95 = (comparisonValue29 * 20u) + 4u;
                uint4 loadedBufferValue73 = uint4(rdLoad_intermediateValue7(productValue95).x, rdLoad_intermediateValue7(productValue95 + 1u).x, rdLoad_intermediateValue7(productValue95 + 2u).x, rdLoad_intermediateValue7(productValue95 + 3u).x);
                uint comparisonValue49 = ((comparisonValue30 ? 0u : loadedBufferValue43) * 20u) + 4u;
                uint4 loadedBufferValue74 = uint4(rdLoad_intermediateValue7(comparisonValue49).x, rdLoad_intermediateValue7(comparisonValue49 + 1u).x, rdLoad_intermediateValue7(comparisonValue49 + 2u).x, rdLoad_intermediateValue7(comparisonValue49 + 3u).x);
                uint comparisonValue50 = ((comparisonValue44 ? 0u : loadedBufferValue44) * 20u) + 4u;
                uint4 loadedBufferValue75 = uint4(rdLoad_intermediateValue7(comparisonValue50).x, rdLoad_intermediateValue7(comparisonValue50 + 1u).x, rdLoad_intermediateValue7(comparisonValue50 + 2u).x, rdLoad_intermediateValue7(comparisonValue50 + 3u).x);
                uint comparisonValue51 = ((comparisonValue45 ? 0u : loadedBufferValue45) * 20u) + 4u;
                uint4 loadedBufferValue76 = uint4(rdLoad_intermediateValue7(comparisonValue51).x, rdLoad_intermediateValue7(comparisonValue51 + 1u).x, rdLoad_intermediateValue7(comparisonValue51 + 2u).x, rdLoad_intermediateValue7(comparisonValue51 + 3u).x);
                float scalarValue7 = frac(reinterpretedBits30);
                float scalarValue8 = frac(reinterpretedBits31);
                float sumValue15 = 1.0f - scalarValue8;
                float sumValue16 = 1.0f - scalarValue7;
                float productValue66 = sumValue15 * sumValue16;
                float productValue96 = sumValue15 * scalarValue7;
                float productValue97 = sumValue16 * scalarValue8;
                float productValue69 = scalarValue8 * scalarValue7;
                multiplyAddValue12 = mad(asfloat(loadedBufferValue76.x), productValue69, mad(asfloat(loadedBufferValue75.x), productValue97, mad(asfloat(loadedBufferValue73.x), productValue66, productValue96 * asfloat(loadedBufferValue74.x))));
                multiplyAddValue13 = mad(asfloat(loadedBufferValue76.y), productValue69, mad(asfloat(loadedBufferValue75.y), productValue97, mad(asfloat(loadedBufferValue73.y), productValue66, productValue96 * asfloat(loadedBufferValue74.y))));
                multiplyAddValue14 = mad(asfloat(loadedBufferValue76.z), productValue69, mad(asfloat(loadedBufferValue75.z), productValue97, mad(asfloat(loadedBufferValue73.z), productValue66, productValue96 * asfloat(loadedBufferValue74.z))));
                multiplyAddValue15 = mad(asfloat(loadedBufferValue76.w), productValue69, mad(asfloat(loadedBufferValue75.w), productValue97, mad(asfloat(loadedBufferValue73.w), productValue66, productValue96 * asfloat(loadedBufferValue74.w))));
            }
            else
            {
                multiplyAddValue12 = reinterpretedBits35;
                multiplyAddValue13 = reinterpretedBits36;
                multiplyAddValue14 = reinterpretedBits37;
                multiplyAddValue15 = reinterpretedBits38;
            }
            intermediateValue21 = multiplyAddValue12;
            intermediateValue23 = multiplyAddValue13;
            intermediateValue24 = multiplyAddValue14;
            intermediateValue25 = multiplyAddValue15;
        }
        else
        {
            intermediateValue21 = intermediateValue22;
            intermediateValue23 = intermediateValue22;
            intermediateValue24 = intermediateValue22;
            intermediateValue25 = intermediateValue22;
        }
        float reinterpretedBits40;
        float reinterpretedBits41;
        float reinterpretedBits42;
        float reinterpretedBits43;
        if (!reinterpretedBits27)
        {
            uint4 reinterpretedBits39 = asuint(RD_UNIFORM_WATER_ALBEDO_EXTINCTION);
            reinterpretedBits40 = asfloat(reinterpretedBits39.w);
            reinterpretedBits41 = asfloat(reinterpretedBits39.z);
            reinterpretedBits42 = asfloat(reinterpretedBits39.y);
            reinterpretedBits43 = asfloat(reinterpretedBits39.x);
        }
        else
        {
            reinterpretedBits40 = intermediateValue25;
            reinterpretedBits41 = intermediateValue24;
            reinterpretedBits42 = intermediateValue23;
            reinterpretedBits43 = intermediateValue21;
        }
        float multiplyAddValue27 = clamp(mad(asfloat(asuint(RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.x)), multiplyAddValue21, asfloat(asuint(RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.y))), 0.0f, 1.0f);
        uint4 reinterpretedBits44 = asuint(RD_UNIFORM_AIR_ALBEDO_EXTINCTION);
        float reinterpretedBits45 = asfloat(asuint(RD_UNIFORM_AIR_ALBEDO_EXTINCTION.w));
        float reinterpretedBits46 = (multiplyAddValue27 * asfloat(reinterpretedBits44.x)) * reinterpretedBits45;
        float reinterpretedBits47 = (multiplyAddValue27 * asfloat(reinterpretedBits44.y)) * reinterpretedBits45;
        float reinterpretedBits48 = (multiplyAddValue27 * asfloat(reinterpretedBits44.z)) * reinterpretedBits45;
        float multiplyAddValue68 = mad(reinterpretedBits62, mad(reinterpretedBits43, reinterpretedBits40, -reinterpretedBits46), reinterpretedBits46);
        float multiplyAddValue69 = mad(reinterpretedBits62, mad(reinterpretedBits42, reinterpretedBits40, -reinterpretedBits47), reinterpretedBits47);
        float multiplyAddValue71 = mad(reinterpretedBits62, mad(reinterpretedBits41, reinterpretedBits40, -reinterpretedBits48), reinterpretedBits48);
        float multiplyAddValue72 = mad(reinterpretedBits62, mad(-multiplyAddValue27, reinterpretedBits45, reinterpretedBits40), multiplyAddValue27 * asfloat(reinterpretedBits44.w));
        float3 vectorValue = float3(multiplyAddValue23, multiplyAddValue24, multiplyAddValue25);
        float nonlinearValue1 = sqrt(rdDot3Precise(vectorValue, vectorValue));
        float clampedValue3 = clamp((((nonlinearValue1 / asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z))) + asfloat(asuint(RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x))) - asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x))) * asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y)), 0.0f, 1.0f);
        float multiplyAddValue74 = mad(clampedValue3, -multiplyAddValue68, multiplyAddValue68);
        float multiplyAddValue75 = mad(clampedValue3, -multiplyAddValue69, multiplyAddValue69);
        float multiplyAddValue76 = mad(clampedValue3, -multiplyAddValue71, multiplyAddValue71);
        float intermediateValue29;
        float intermediateValue30;
        if ((asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.x)) > 0.5f) && (asfloat(asuint(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w)) > 0.5f))
        {
            float4 sampledTextureValue1 = materialTexture9.SampleLevel(textureSampler9, float3(quotientValue5, 1.0f - quotientValue6, (exp2(((asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.y)) > 0.5f) ? (quotientValue7 - asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.z))) : quotientValue7) * 5.770780086517333984375f) - 1.0f) * 0.0186573602259159088134765625f), 0.0f);
            intermediateValue29 = sampledTextureValue1.y;
            intermediateValue30 = sampledTextureValue1.x;
        }
        else
        {
            intermediateValue29 = asfloat(asuint(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y));
            intermediateValue30 = 0.0f;
        }
        float productValue14;
        float productValue15;
        float productValue16;
        if (asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w)) != 0.0f)
        {
            uint4 reinterpretedBits88 = asuint(RD_UNIFORM_WORLD_ORIGIN);
            float reinterpretedBits89 = (multiplyAddValue20 - asfloat(reinterpretedBits88.x)) - 0.5f;
            float reinterpretedBits90 = (multiplyAddValue21 - asfloat(reinterpretedBits88.y)) - 0.5f;
            float reinterpretedBits91 = (multiplyAddValue22 - asfloat(reinterpretedBits88.z)) - 0.5f;
            uint productValue134 = uint(int(floor(floor(reinterpretedBits89) * 0.0625f)));
            uint productValue135 = uint(int(floor(floor(reinterpretedBits90) * 0.0625f)));
            uint productValue136 = uint(int(floor(floor(reinterpretedBits91) * 0.0625f)));
            uint scalarValue49 = rdBitfieldInsert(productValue134, productValue135, 16u, 16u);
            uint bitwiseValue28 = productValue136 & 65535u;
            uint productValue137 = productValue134 * 1540483477u;
            uint productValue138 = productValue135 * 1540483477u;
            uint productValue139 = productValue136 * 1540483477u;
            uint bitwiseValue29 = ((((((productValue138 >> 24u) ^ productValue138) * 1540483477u) ^ ((((productValue137 ^ (productValue137 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u)) * 1540483477u) ^ (((productValue139 >> 24u) ^ productValue139) * 1540483477u)) * 1540483477u;
            uint bitwiseValue30 = ((bitwiseValue29 >> 13u) ^ bitwiseValue29) * 1540483477u;
            uint bitwiseValue31 = (bitwiseValue30 >> 15u) ^ bitwiseValue30;
            uint bitwiseValue32 = (bitwiseValue31 ^ (bitwiseValue31 >> 16u)) & 65535u;
            bool comparisonValue74 = bitwiseValue32 != 0u;
            uint bitwiseValue33 = bitwiseValue32 | 1u;
            uint reinterpretedBits92 = uint(asfloat(asuint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x))) - 1u;
            uint comparisonValue75 = (comparisonValue74 ? bitwiseValue32 : bitwiseValue33) & reinterpretedBits92;
            uint comparisonValue13;
            uint comparisonValue14;
            uint bitwiseValue6;
            uint sumValue7;
            uint intermediateValue38;
            uint intermediateValue39;
            uint scalarValue35 = 0u;
            uint scalarValue36 = 0u;
            uint scalarValue50 = comparisonValue75;
            uint scalarValue51 = 0u;
            for (;;)
            {
                if (int(scalarValue51) >= int(8u))
                {
                    intermediateValue38 = scalarValue36;
                    intermediateValue39 = scalarValue35;
                    break;
                }
                uint productValue140 = scalarValue50 * 4u;
                uint4 loadedBufferValue77 = uint4(rdLoad_intermediateValue5(productValue140).x, rdLoad_intermediateValue5(productValue140 + 1u).x, rdLoad_intermediateValue5(productValue140 + 2u).x, rdLoad_intermediateValue5(productValue140 + 3u).x);
                uint bitwiseValue34 = loadedBufferValue77.z & 65535u;
                bool comparisonValue76 = (bitwiseValue28 == loadedBufferValue77.y) && ((((bitwiseValue33 == bitwiseValue34) && (!comparisonValue74)) || (comparisonValue74 && (bitwiseValue32 == bitwiseValue34))) && (scalarValue49 == loadedBufferValue77.x));
                bool comparisonValue77 = scalarValue35 != 0u;
                comparisonValue14 = (comparisonValue77 || (!comparisonValue76)) ? scalarValue36 : loadedBufferValue77.w;
                comparisonValue13 = comparisonValue76 ? 4294967295u : scalarValue35;
                bitwiseValue6 = reinterpretedBits92 & (scalarValue50 + 1u);
                bool comparisonValue78 = (bitwiseValue34 == 0u) || comparisonValue76;
                if (comparisonValue78 || (comparisonValue77 && (!comparisonValue78)))
                {
                    intermediateValue38 = comparisonValue14;
                    intermediateValue39 = comparisonValue13;
                    break;
                }
                sumValue7 = scalarValue51 + 1u;
                scalarValue35 = comparisonValue13;
                scalarValue36 = comparisonValue14;
                scalarValue50 = bitwiseValue6;
                scalarValue51 = sumValue7;
                continue;
            }
            float multiplyAddValue39;
            float multiplyAddValue40;
            float multiplyAddValue41;
            if (intermediateValue39 != 0u)
            {
                float productValue141 = floor(reinterpretedBits89 * 0.0625f);
                float productValue142 = floor(reinterpretedBits90 * 0.0625f);
                float productValue143 = floor(reinterpretedBits91 * 0.0625f);
                float multiplyAddValue97 = mad(-productValue141, 16.0f, reinterpretedBits89);
                float multiplyAddValue98 = mad(-productValue142, 16.0f, reinterpretedBits90);
                float multiplyAddValue99 = mad(-productValue143, 16.0f, reinterpretedBits91);
                uint bitwiseValue35 = intermediateValue38 >> 2u;
                float scalarValue52 = floor(multiplyAddValue97);
                float scalarValue53 = floor(multiplyAddValue98);
                float scalarValue54 = floor(multiplyAddValue99);
                float sumValue90 = multiplyAddValue97 - scalarValue52;
                float sumValue91 = multiplyAddValue98 - scalarValue53;
                float sumValue92 = multiplyAddValue99 - scalarValue54;
                uint comparisonValue79 = rdBitfieldInsert(rdBitfieldInsert(0u, (sumValue91 >= sumValue92) ? 4294967295u : 0u, 1u, 1u), (sumValue90 >= sumValue91) ? 4294967295u : 0u, 0u, 1u) + rdBitfieldInsert(0u, (sumValue90 >= sumValue92) ? 4294967295u : 0u, 2u, 1u);
                float scalarValue55 = min(sumValue91, sumValue90);
                float scalarValue56 = max(sumValue91, sumValue90);
                float scalarValue57 = min(sumValue92, scalarValue55);
                float scalarValue58 = max(sumValue92, scalarValue56);
                float scalarValue59 = max(scalarValue55, min(sumValue92, scalarValue56));
                float sumValue93 = 1.0f - scalarValue58;
                float sumValue94 = scalarValue58 - scalarValue59;
                float sumValue95 = scalarValue59 - scalarValue57;
                float sumValue96 = scalarValue52 + 1.0f;
                float sumValue97 = scalarValue53 + 1.0f;
                float sumValue98 = scalarValue54 + 1.0f;
                float comparisonValue31;
                float comparisonValue32;
                float comparisonValue33;
                float comparisonValue34;
                float comparisonValue35;
                float comparisonValue36;
                float comparisonValue37;
                float comparisonValue38;
                float comparisonValue39;
                float comparisonValue40;
                float comparisonValue41;
                float comparisonValue42;
                if (((sumValue98 < 16.0f) && ((sumValue96 < 16.0f) && (sumValue97 < 16.0f))) && (((scalarValue52 >= 0.0f) && (scalarValue53 >= 0.0f)) && (scalarValue54 >= 0.0f)))
                {
                    uint scalarValue60 = uint(scalarValue52);
                    uint scalarValue61 = uint(scalarValue53);
                    uint scalarValue62 = uint(scalarValue54);
                    uint scalarValue63 = min(comparisonValue79, 72u);
                    uint sumValue99 = min((comparisonValue79 + 5u), 72u);
                    uint4 loadedBufferValue78 = rdLoad_intermediateValue6(bitwiseValue35 + (((scalarValue62 << 4u) + scalarValue61) + (scalarValue60 << 8u)));
                    uint scalarValue64 = loadedBufferValue78.x;
                    float bitwiseValue36 = rdUnsignedToFloat((scalarValue64 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue80 = scalarValue64 != 0u;
                    uint4 loadedBufferValue79 = rdLoad_intermediateValue6(bitwiseValue35 + ((((uint(comparisonValue79 < 2u) + scalarValue62) << 4u) + (rdAccess_intermediateValue10(scalarValue63).y + scalarValue61)) + ((scalarValue60 + rdAccess_intermediateValue10(scalarValue63).x) << 8u)));
                    uint scalarValue65 = loadedBufferValue79.x;
                    float bitwiseValue37 = rdUnsignedToFloat((scalarValue65 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue81 = scalarValue65 != 0u;
                    uint4 loadedBufferValue80 = rdLoad_intermediateValue6(bitwiseValue35 + ((((uint(comparisonValue79 < 6u) + scalarValue62) << 4u) + (rdAccess_intermediateValue10(sumValue99).x + scalarValue61)) + ((scalarValue60 + rdAccess_intermediateValue10(sumValue99).y) << 8u)));
                    uint scalarValue66 = loadedBufferValue80.x;
                    float bitwiseValue38 = rdUnsignedToFloat((scalarValue66 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue82 = scalarValue66 != 0u;
                    uint4 loadedBufferValue81 = rdLoad_intermediateValue6(bitwiseValue35 + ((((scalarValue62 + 1u) << 4u) + (scalarValue61 + 1u)) + ((scalarValue60 + 1u) << 8u)));
                    uint scalarValue67 = loadedBufferValue81.x;
                    float bitwiseValue39 = rdUnsignedToFloat((scalarValue67 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue83 = scalarValue67 != 0u;
                    comparisonValue31 = comparisonValue83 ? ((bitwiseValue39 * (rdUnsignedToFloat((scalarValue67 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue32 = comparisonValue83 ? ((bitwiseValue39 * (rdUnsignedToFloat((scalarValue67 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue33 = comparisonValue83 ? ((bitwiseValue39 * (rdUnsignedToFloat(scalarValue67 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue34 = comparisonValue82 ? ((bitwiseValue38 * (rdUnsignedToFloat((scalarValue66 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue35 = comparisonValue82 ? ((bitwiseValue38 * (rdUnsignedToFloat((scalarValue66 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue36 = comparisonValue82 ? ((bitwiseValue38 * (rdUnsignedToFloat(scalarValue66 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue37 = comparisonValue80 ? ((bitwiseValue36 * (rdUnsignedToFloat((scalarValue64 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue38 = comparisonValue80 ? ((bitwiseValue36 * (rdUnsignedToFloat((scalarValue64 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue39 = comparisonValue80 ? ((bitwiseValue36 * (rdUnsignedToFloat(scalarValue64 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue40 = comparisonValue81 ? ((bitwiseValue37 * (rdUnsignedToFloat((scalarValue65 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue41 = comparisonValue81 ? ((bitwiseValue37 * (rdUnsignedToFloat((scalarValue65 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue42 = comparisonValue81 ? ((bitwiseValue37 * (rdUnsignedToFloat(scalarValue65 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                }
                else
                {
                    uint scalarValue68 = min(comparisonValue79, 72u);
                    float sumValue100 = scalarValue52 + rdUnsignedToFloat(rdAccess_intermediateValue10(scalarValue68).x);
                    float sumValue101 = scalarValue53 + rdUnsignedToFloat(rdAccess_intermediateValue10(scalarValue68).y);
                    float sumValue102 = scalarValue54 + rdUnsignedToFloat(uint(comparisonValue79 < 2u));
                    uint sumValue103 = min((comparisonValue79 + 5u), 72u);
                    float sumValue104 = scalarValue52 + rdUnsignedToFloat(rdAccess_intermediateValue10(sumValue103).y);
                    float sumValue105 = scalarValue53 + rdUnsignedToFloat(rdAccess_intermediateValue10(sumValue103).x);
                    float sumValue106 = scalarValue54 + rdUnsignedToFloat(uint(comparisonValue79 < 6u));
                    float multiplyAddValue100 = mad(productValue141, 16.0f, scalarValue52);
                    float multiplyAddValue101 = mad(productValue142, 16.0f, scalarValue53);
                    float multiplyAddValue102 = mad(productValue143, 16.0f, scalarValue54);
                    uint comparisonValue84 = min((((((rdBitfieldInsert(rdBitfieldInsert(0u, (scalarValue52 >= 16.0f) ? 4294967295u : 0u, 1u, 1u), (scalarValue52 < 0.0f) ? 4294967295u : 0u, 0u, 1u) + rdBitfieldInsert(0u, (scalarValue53 < 0.0f) ? 4294967295u : 0u, 2u, 1u)) + rdBitfieldInsert(0u, (scalarValue53 >= 16.0f) ? 4294967295u : 0u, 3u, 1u)) + rdBitfieldInsert(0u, (scalarValue54 < 0.0f) ? 4294967295u : 0u, 4u, 1u)) + rdBitfieldInsert(0u, (scalarValue54 >= 16.0f) ? 4294967295u : 0u, 5u, 1u)) + 8u), 72u);
                    bool conditionValue7 = int(rdAccess_intermediateValue10(comparisonValue84).z) < int(0u);
                    uint sumValue107 = bitwiseValue35 + 4097u;
                    uint4 loadedBufferValue82 = rdLoad_intermediateValue6(bitwiseValue35 + 4096u);
                    uint scalarValue69 = loadedBufferValue82.x;
                    uint4 loadedBufferValue83 = rdLoad_intermediateValue6(conditionValue7 ? (bitwiseValue35 + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(scalarValue54), 4u, 4u), uint(scalarValue53), 0u, 4u) + rdBitfieldInsert(0u, uint(scalarValue52), 8u, 4u))) : ((rdLoad_intermediateValue6(sumValue107 + rdAccess_intermediateValue10(comparisonValue84).z).x >> 2u) + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue102 * 0.0625f), 16.0f, multiplyAddValue102)), 4u, 4u), uint(mad(-floor(multiplyAddValue101 * 0.0625f), 16.0f, multiplyAddValue101)), 0u, 4u) + rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue100 * 0.0625f), 16.0f, multiplyAddValue100)), 8u, 4u))));
                    uint scalarValue70 = loadedBufferValue83.x;
                    float bitwiseValue40 = rdUnsignedToFloat((scalarValue70 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue85 = (conditionValue7 || ((scalarValue69 & (1u << (rdAccess_intermediateValue10(comparisonValue84).z & 31u))) != 0u)) && (scalarValue70 != 0u);
                    float multiplyAddValue103 = mad(productValue141, 16.0f, sumValue100);
                    float multiplyAddValue104 = mad(productValue142, 16.0f, sumValue101);
                    float multiplyAddValue105 = mad(productValue143, 16.0f, sumValue102);
                    uint comparisonValue86 = min((((((rdBitfieldInsert(rdBitfieldInsert(0u, (sumValue100 >= 16.0f) ? 4294967295u : 0u, 1u, 1u), (sumValue100 < 0.0f) ? 4294967295u : 0u, 0u, 1u) + rdBitfieldInsert(0u, (sumValue101 < 0.0f) ? 4294967295u : 0u, 2u, 1u)) + rdBitfieldInsert(0u, (sumValue101 >= 16.0f) ? 4294967295u : 0u, 3u, 1u)) + rdBitfieldInsert(0u, (sumValue102 < 0.0f) ? 4294967295u : 0u, 4u, 1u)) + rdBitfieldInsert(0u, (sumValue102 >= 16.0f) ? 4294967295u : 0u, 5u, 1u)) + 8u), 72u);
                    bool conditionValue8 = int(rdAccess_intermediateValue10(comparisonValue86).z) < int(0u);
                    uint4 loadedBufferValue84 = rdLoad_intermediateValue6(conditionValue8 ? (bitwiseValue35 + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(sumValue102), 4u, 4u), uint(sumValue101), 0u, 4u) + rdBitfieldInsert(0u, uint(sumValue100), 8u, 4u))) : ((rdLoad_intermediateValue6(sumValue107 + rdAccess_intermediateValue10(comparisonValue86).z).x >> 2u) + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue105 * 0.0625f), 16.0f, multiplyAddValue105)), 4u, 4u), uint(mad(-floor(multiplyAddValue104 * 0.0625f), 16.0f, multiplyAddValue104)), 0u, 4u) + rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue103 * 0.0625f), 16.0f, multiplyAddValue103)), 8u, 4u))));
                    uint scalarValue71 = loadedBufferValue84.x;
                    float bitwiseValue41 = rdUnsignedToFloat((scalarValue71 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue87 = (conditionValue8 || ((scalarValue69 & (1u << (rdAccess_intermediateValue10(comparisonValue86).z & 31u))) != 0u)) && (scalarValue71 != 0u);
                    float multiplyAddValue106 = mad(productValue141, 16.0f, sumValue104);
                    float multiplyAddValue107 = mad(productValue142, 16.0f, sumValue105);
                    float multiplyAddValue108 = mad(productValue143, 16.0f, sumValue106);
                    uint comparisonValue88 = min((((rdBitfieldInsert(0u, (sumValue106 < 0.0f) ? 4294967295u : 0u, 4u, 1u) + ((rdBitfieldInsert(rdBitfieldInsert(0u, (sumValue104 >= 16.0f) ? 4294967295u : 0u, 1u, 1u), (sumValue104 < 0.0f) ? 4294967295u : 0u, 0u, 1u) + rdBitfieldInsert(0u, (sumValue105 < 0.0f) ? 4294967295u : 0u, 2u, 1u)) + rdBitfieldInsert(0u, (sumValue105 >= 16.0f) ? 4294967295u : 0u, 3u, 1u))) + rdBitfieldInsert(0u, (sumValue106 >= 16.0f) ? 4294967295u : 0u, 5u, 1u)) + 8u), 72u);
                    bool conditionValue9 = int(rdAccess_intermediateValue10(comparisonValue88).z) < int(0u);
                    uint4 loadedBufferValue85 = rdLoad_intermediateValue6(conditionValue9 ? (bitwiseValue35 + (rdBitfieldInsert(0u, uint(sumValue104), 8u, 4u) + rdBitfieldInsert(rdBitfieldInsert(0u, uint(sumValue106), 4u, 4u), uint(sumValue105), 0u, 4u))) : ((rdLoad_intermediateValue6(sumValue107 + rdAccess_intermediateValue10(comparisonValue88).z).x >> 2u) + (rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue106 * 0.0625f), 16.0f, multiplyAddValue106)), 8u, 4u) + rdBitfieldInsert(rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue108 * 0.0625f), 16.0f, multiplyAddValue108)), 4u, 4u), uint(mad(-floor(multiplyAddValue107 * 0.0625f), 16.0f, multiplyAddValue107)), 0u, 4u))));
                    uint scalarValue72 = loadedBufferValue85.x;
                    float bitwiseValue42 = rdUnsignedToFloat((scalarValue72 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue89 = (conditionValue9 || ((scalarValue69 & (1u << (rdAccess_intermediateValue10(comparisonValue88).z & 31u))) != 0u)) && (scalarValue72 != 0u);
                    float multiplyAddValue109 = mad(productValue141, 16.0f, sumValue96);
                    float multiplyAddValue110 = mad(productValue142, 16.0f, sumValue97);
                    float multiplyAddValue111 = mad(productValue143, 16.0f, sumValue98);
                    uint comparisonValue90 = min(((rdBitfieldInsert(0u, (sumValue98 >= 16.0f) ? 4294967295u : 0u, 5u, 1u) + (rdBitfieldInsert(0u, (sumValue98 < 0.0f) ? 4294967295u : 0u, 4u, 1u) + (rdBitfieldInsert(0u, (sumValue97 >= 16.0f) ? 4294967295u : 0u, 3u, 1u) + (rdBitfieldInsert(rdBitfieldInsert(0u, (sumValue96 >= 16.0f) ? 4294967295u : 0u, 1u, 1u), (sumValue96 < 0.0f) ? 4294967295u : 0u, 0u, 1u) + rdBitfieldInsert(0u, (sumValue97 < 0.0f) ? 4294967295u : 0u, 2u, 1u))))) + 8u), 72u);
                    bool conditionValue10 = int(rdAccess_intermediateValue10(comparisonValue90).z) < int(0u);
                    uint4 loadedBufferValue86 = rdLoad_intermediateValue6(conditionValue10 ? (bitwiseValue35 + (rdBitfieldInsert(0u, uint(sumValue96), 8u, 4u) + rdBitfieldInsert(rdBitfieldInsert(0u, uint(sumValue98), 4u, 4u), uint(sumValue97), 0u, 4u))) : ((rdLoad_intermediateValue6(sumValue107 + rdAccess_intermediateValue10(comparisonValue90).z).x >> 2u) + (rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue109 * 0.0625f), 16.0f, multiplyAddValue109)), 8u, 4u) + rdBitfieldInsert(rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue111 * 0.0625f), 16.0f, multiplyAddValue111)), 4u, 4u), uint(mad(-floor(multiplyAddValue110 * 0.0625f), 16.0f, multiplyAddValue110)), 0u, 4u))));
                    uint scalarValue73 = loadedBufferValue86.x;
                    float bitwiseValue43 = rdUnsignedToFloat((scalarValue73 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue91 = (conditionValue10 || ((scalarValue69 & (1u << (rdAccess_intermediateValue10(comparisonValue90).z & 31u))) != 0u)) && (scalarValue73 != 0u);
                    comparisonValue31 = comparisonValue91 ? ((bitwiseValue43 * (rdUnsignedToFloat((scalarValue73 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue32 = comparisonValue91 ? ((bitwiseValue43 * (rdUnsignedToFloat((scalarValue73 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue33 = comparisonValue91 ? ((bitwiseValue43 * (rdUnsignedToFloat(scalarValue73 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue34 = comparisonValue89 ? ((bitwiseValue42 * (rdUnsignedToFloat((scalarValue72 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue35 = comparisonValue89 ? ((bitwiseValue42 * (rdUnsignedToFloat((scalarValue72 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue36 = comparisonValue89 ? ((bitwiseValue42 * (rdUnsignedToFloat(scalarValue72 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue37 = comparisonValue85 ? ((bitwiseValue40 * (rdUnsignedToFloat((scalarValue70 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue38 = comparisonValue85 ? ((bitwiseValue40 * (rdUnsignedToFloat((scalarValue70 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue39 = comparisonValue85 ? ((bitwiseValue40 * (rdUnsignedToFloat(scalarValue70 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue40 = comparisonValue87 ? ((bitwiseValue41 * (rdUnsignedToFloat((scalarValue71 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue41 = comparisonValue87 ? ((bitwiseValue41 * (rdUnsignedToFloat((scalarValue71 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue42 = comparisonValue87 ? ((bitwiseValue41 * (rdUnsignedToFloat(scalarValue71 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                }
                multiplyAddValue39 = mad(comparisonValue31, scalarValue57, mad(comparisonValue34, sumValue95, mad(comparisonValue37, sumValue93, sumValue94 * comparisonValue40)));
                multiplyAddValue40 = mad(comparisonValue32, scalarValue57, mad(comparisonValue35, sumValue95, mad(comparisonValue38, sumValue93, sumValue94 * comparisonValue41)));
                multiplyAddValue41 = mad(comparisonValue33, scalarValue57, mad(comparisonValue36, sumValue95, mad(comparisonValue39, sumValue93, sumValue94 * comparisonValue42)));
            }
            else
            {
                multiplyAddValue39 = 0.0f;
                multiplyAddValue40 = 0.0f;
                multiplyAddValue41 = 0.0f;
            }
            float reinterpretedBits52 = asfloat(asuint(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w));
            productValue14 = multiplyAddValue39 * reinterpretedBits52;
            productValue15 = multiplyAddValue40 * reinterpretedBits52;
            productValue16 = multiplyAddValue41 * reinterpretedBits52;
        }
        else
        {
            uint4 reinterpretedBits49 = asuint(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY);
            float reinterpretedBits93 = asfloat(asuint(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w));
            productValue14 = (intermediateValue30 * asfloat(reinterpretedBits49.z)) * reinterpretedBits93;
            productValue15 = (intermediateValue30 * asfloat(reinterpretedBits49.y)) * reinterpretedBits93;
            productValue16 = (intermediateValue30 * asfloat(reinterpretedBits49.x)) * reinterpretedBits93;
        }
        uint4 reinterpretedBits50 = asuint(RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY);
        float reinterpretedBits51 = asfloat(asuint(RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w));
        float reinterpretedBits53 = asfloat(asuint(RD_UNIFORM_MIN_AMBIENT_VALUE.x));
        float reinterpretedBits54 = asfloat(asuint(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w));
        float multiplyAddValue112 = ((multiplyAddValue74 * max(mad(intermediateValue29 * asfloat(reinterpretedBits50.x), reinterpretedBits51, productValue16), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float multiplyAddValue113 = ((multiplyAddValue75 * max(mad(intermediateValue29 * asfloat(reinterpretedBits50.y), reinterpretedBits51, productValue15), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float multiplyAddValue114 = ((multiplyAddValue76 * max(mad(intermediateValue29 * asfloat(reinterpretedBits50.z), reinterpretedBits51, productValue14), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float multiplyAddValue33;
        float multiplyAddValue34;
        float multiplyAddValue35;
        if ((asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.y)) == 0.0f) || (abs(intermediateValue29) > 9.9999997473787516355514526367188e-05f))
        {
            float reinterpretedBits55 = asfloat(asuint(RD_UNIFORM_HENYEY_GREENSTEIN_G.x));
            float multiplyAddValue73 = mad(reinterpretedBits62, asfloat(asuint(RD_UNIFORM_HENYEY_GREENSTEIN_G.y)) - reinterpretedBits55, reinterpretedBits55);
            float4 loadedBufferValue30 = materialTexture7.Load(int4(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z), 0u));
            float scalarValue9 = loadedBufferValue30.x;
            float reinterpretedBits56 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y));
            float reinterpretedBits57 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x));
            float reinterpretedBits58 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z));
            float reinterpretedBits59 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w));
            float multiplyAddValue55 = mad(reinterpretedBits23, reinterpretedBits59, mad(reinterpretedBits19, reinterpretedBits58, mad(reinterpretedBits15, reinterpretedBits57, reinterpretedBits11 * reinterpretedBits56)));
            float multiplyAddValue56 = mad(reinterpretedBits24, reinterpretedBits59, mad(reinterpretedBits20, reinterpretedBits58, mad(reinterpretedBits16, reinterpretedBits57, reinterpretedBits12 * reinterpretedBits56)));
            float multiplyAddValue57 = mad(reinterpretedBits25, reinterpretedBits59, mad(reinterpretedBits21, reinterpretedBits58, mad(reinterpretedBits17, reinterpretedBits57, reinterpretedBits13 * reinterpretedBits56)));
            float3 vectorValue1 = float3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
            float inverseLengthValue1 = rsqrt(rdDot3Precise(vectorValue1, vectorValue1));
            float multiplyAddValue115 = rdDot2Precise(rdDot3Precise(float3(-(multiplyAddValue23 / nonlinearValue1), -(multiplyAddValue24 / nonlinearValue1), -(multiplyAddValue25 / nonlinearValue1)), float3(multiplyAddValue55 * inverseLengthValue1, multiplyAddValue56 * inverseLengthValue1, multiplyAddValue57 * inverseLengthValue1)).xx, multiplyAddValue73.xx) + mad(multiplyAddValue73, multiplyAddValue73, 1.0f);
            float multiplyAddValue116 = (mad(-multiplyAddValue73, multiplyAddValue73, 1.0f) * 0.079577468335628509521484375f) / (sqrt(multiplyAddValue115) * multiplyAddValue115);
            float reinterpretedBits60 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w));
            uint4 reinterpretedBits61 = asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE);
            multiplyAddValue33 = mad(multiplyAddValue116 * (scalarValue9 * multiplyAddValue76), reinterpretedBits60 * asfloat(reinterpretedBits61.z), multiplyAddValue114);
            multiplyAddValue34 = mad(multiplyAddValue116 * (scalarValue9 * multiplyAddValue75), reinterpretedBits60 * asfloat(reinterpretedBits61.y), multiplyAddValue113);
            multiplyAddValue35 = mad(multiplyAddValue116 * (scalarValue9 * multiplyAddValue74), reinterpretedBits60 * asfloat(reinterpretedBits61.x), multiplyAddValue112);
        }
        else
        {
            multiplyAddValue33 = multiplyAddValue114;
            multiplyAddValue34 = multiplyAddValue113;
            multiplyAddValue35 = multiplyAddValue112;
        }
        rdAccess_intermediateValue8(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)) = float4(multiplyAddValue35, multiplyAddValue34, multiplyAddValue33, mad(clampedValue3, -multiplyAddValue72, multiplyAddValue72));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                reinterpretedBits35 = asfloat(sumValue14);
                reinterpretedBits36 = asfloat(sumValue62);
                reinterpretedBits37 = 0.0f;
                reinterpretedBits38 = 0.0f;
            }
            float multiplyAddValue12;
            float multiplyAddValue13;
            float multiplyAddValue14;
            float multiplyAddValue15;
            if (!comparisonValue100)
            {
                uint productValue95 = (comparisonValue29 * 20u) + 4u;
                uint4 loadedBufferValue100 = uint4(rdLoad_intermediateValue8(productValue95).x, rdLoad_intermediateValue8(productValue95 + 1u).x, rdLoad_intermediateValue8(productValue95 + 2u).x, rdLoad_intermediateValue8(productValue95 + 3u).x);
                uint comparisonValue49 = ((comparisonValue30 ? 0u : loadedBufferValue43) * 20u) + 4u;
                uint4 loadedBufferValue101 = uint4(rdLoad_intermediateValue8(comparisonValue49).x, rdLoad_intermediateValue8(comparisonValue49 + 1u).x, rdLoad_intermediateValue8(comparisonValue49 + 2u).x, rdLoad_intermediateValue8(comparisonValue49 + 3u).x);
                uint comparisonValue50 = ((comparisonValue44 ? 0u : loadedBufferValue44) * 20u) + 4u;
                uint4 loadedBufferValue102 = uint4(rdLoad_intermediateValue8(comparisonValue50).x, rdLoad_intermediateValue8(comparisonValue50 + 1u).x, rdLoad_intermediateValue8(comparisonValue50 + 2u).x, rdLoad_intermediateValue8(comparisonValue50 + 3u).x);
                uint comparisonValue51 = ((comparisonValue45 ? 0u : loadedBufferValue45) * 20u) + 4u;
                uint4 loadedBufferValue103 = uint4(rdLoad_intermediateValue8(comparisonValue51).x, rdLoad_intermediateValue8(comparisonValue51 + 1u).x, rdLoad_intermediateValue8(comparisonValue51 + 2u).x, rdLoad_intermediateValue8(comparisonValue51 + 3u).x);
                float scalarValue7 = frac(reinterpretedBits30);
                float scalarValue8 = frac(reinterpretedBits31);
                float sumValue15 = 1.0f - scalarValue8;
                float sumValue16 = 1.0f - scalarValue7;
                float productValue66 = sumValue15 * sumValue16;
                float productValue96 = sumValue15 * scalarValue7;
                float productValue97 = sumValue16 * scalarValue8;
                float productValue69 = scalarValue8 * scalarValue7;
                multiplyAddValue12 = mad(asfloat(loadedBufferValue103.x), productValue69, mad(asfloat(loadedBufferValue102.x), productValue97, mad(asfloat(loadedBufferValue100.x), productValue66, productValue96 * asfloat(loadedBufferValue101.x))));
                multiplyAddValue13 = mad(asfloat(loadedBufferValue103.y), productValue69, mad(asfloat(loadedBufferValue102.y), productValue97, mad(asfloat(loadedBufferValue100.y), productValue66, productValue96 * asfloat(loadedBufferValue101.y))));
                multiplyAddValue14 = mad(asfloat(loadedBufferValue103.z), productValue69, mad(asfloat(loadedBufferValue102.z), productValue97, mad(asfloat(loadedBufferValue100.z), productValue66, productValue96 * asfloat(loadedBufferValue101.z))));
                multiplyAddValue15 = mad(asfloat(loadedBufferValue103.w), productValue69, mad(asfloat(loadedBufferValue102.w), productValue97, mad(asfloat(loadedBufferValue100.w), productValue66, productValue96 * asfloat(loadedBufferValue101.w))));
            }
            else
            {
                multiplyAddValue12 = reinterpretedBits35;
                multiplyAddValue13 = reinterpretedBits36;
                multiplyAddValue14 = reinterpretedBits37;
                multiplyAddValue15 = reinterpretedBits38;
            }
            intermediateValue24 = multiplyAddValue12;
            intermediateValue26 = multiplyAddValue13;
            intermediateValue27 = multiplyAddValue14;
            intermediateValue28 = multiplyAddValue15;
        }
        else
        {
            intermediateValue24 = intermediateValue25;
            intermediateValue26 = intermediateValue25;
            intermediateValue27 = intermediateValue25;
            intermediateValue28 = intermediateValue25;
        }
        float reinterpretedBits40;
        float reinterpretedBits41;
        float reinterpretedBits42;
        float reinterpretedBits43;
        if (!reinterpretedBits27)
        {
            uint4 reinterpretedBits39 = asuint(RD_UNIFORM_WATER_ALBEDO_EXTINCTION);
            reinterpretedBits40 = asfloat(reinterpretedBits39.w);
            reinterpretedBits41 = asfloat(reinterpretedBits39.z);
            reinterpretedBits42 = asfloat(reinterpretedBits39.y);
            reinterpretedBits43 = asfloat(reinterpretedBits39.x);
        }
        else
        {
            reinterpretedBits40 = intermediateValue28;
            reinterpretedBits41 = intermediateValue27;
            reinterpretedBits42 = intermediateValue26;
            reinterpretedBits43 = intermediateValue24;
        }
        float multiplyAddValue27 = clamp(mad(asfloat(asuint(RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.x)), multiplyAddValue21, asfloat(asuint(RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.y))), 0.0f, 1.0f);
        uint4 reinterpretedBits44 = asuint(RD_UNIFORM_AIR_ALBEDO_EXTINCTION);
        float reinterpretedBits45 = asfloat(asuint(RD_UNIFORM_AIR_ALBEDO_EXTINCTION.w));
        float reinterpretedBits46 = (multiplyAddValue27 * asfloat(reinterpretedBits44.x)) * reinterpretedBits45;
        float reinterpretedBits47 = (multiplyAddValue27 * asfloat(reinterpretedBits44.y)) * reinterpretedBits45;
        float reinterpretedBits48 = (multiplyAddValue27 * asfloat(reinterpretedBits44.z)) * reinterpretedBits45;
        float multiplyAddValue68 = mad(reinterpretedBits62, mad(reinterpretedBits43, reinterpretedBits40, -reinterpretedBits46), reinterpretedBits46);
        float multiplyAddValue69 = mad(reinterpretedBits62, mad(reinterpretedBits42, reinterpretedBits40, -reinterpretedBits47), reinterpretedBits47);
        float multiplyAddValue71 = mad(reinterpretedBits62, mad(reinterpretedBits41, reinterpretedBits40, -reinterpretedBits48), reinterpretedBits48);
        float multiplyAddValue72 = mad(reinterpretedBits62, mad(-multiplyAddValue27, reinterpretedBits45, reinterpretedBits40), multiplyAddValue27 * asfloat(reinterpretedBits44.w));
        float reinterpretedBits55 = asfloat(asuint(RD_UNIFORM_HENYEY_GREENSTEIN_G.x));
        float multiplyAddValue73 = mad(reinterpretedBits62, asfloat(asuint(RD_UNIFORM_HENYEY_GREENSTEIN_G.y)) - reinterpretedBits55, reinterpretedBits55);
        float3 vectorValue = float3(multiplyAddValue23, multiplyAddValue24, multiplyAddValue25);
        float nonlinearValue1 = sqrt(rdDot3Precise(vectorValue, vectorValue));
        float clampedValue3 = clamp((((nonlinearValue1 / asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z))) + asfloat(asuint(RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x))) - asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x))) * asfloat(asuint(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y)), 0.0f, 1.0f);
        float multiplyAddValue74 = mad(clampedValue3, -multiplyAddValue68, multiplyAddValue68);
        float multiplyAddValue75 = mad(clampedValue3, -multiplyAddValue69, multiplyAddValue69);
        float multiplyAddValue76 = mad(clampedValue3, -multiplyAddValue71, multiplyAddValue71);
        float intermediateValue32;
        float intermediateValue33;
        if ((asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.x)) > 0.5f) && (asfloat(asuint(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w)) > 0.5f))
        {
            float4 sampledTextureValue1 = materialTexture9.SampleLevel(textureSampler9, float3(quotientValue5, 1.0f - quotientValue6, (exp2(((asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.y)) > 0.5f) ? (quotientValue7 - asfloat(asuint(RD_UNIFORM_SKY_SAMPLES_CONFIG.z))) : quotientValue7) * 5.770780086517333984375f) - 1.0f) * 0.0186573602259159088134765625f), 0.0f);
            intermediateValue32 = sampledTextureValue1.y;
            intermediateValue33 = sampledTextureValue1.x;
        }
        else
        {
            intermediateValue32 = asfloat(asuint(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y));
            intermediateValue33 = 0.0f;
        }
        bool reinterpretedBits63 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z)) != 0.0f;
        float productValue14;
        float productValue15;
        float productValue16;
        if (reinterpretedBits63 && (asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w)) != 0.0f))
        {
            uint4 reinterpretedBits88 = asuint(RD_UNIFORM_WORLD_ORIGIN);
            float reinterpretedBits89 = (multiplyAddValue20 - asfloat(reinterpretedBits88.x)) - 0.5f;
            float reinterpretedBits90 = (multiplyAddValue21 - asfloat(reinterpretedBits88.y)) - 0.5f;
            float reinterpretedBits94 = (multiplyAddValue22 - asfloat(reinterpretedBits88.z)) - 0.4799999892711639404296875f;
            uint productValue134 = uint(int(floor(floor(reinterpretedBits89) * 0.0625f)));
            uint productValue135 = uint(int(floor(floor(reinterpretedBits90) * 0.0625f)));
            uint productValue170 = uint(int(floor(floor(reinterpretedBits94) * 0.0625f)));
            uint scalarValue49 = rdBitfieldInsert(productValue134, productValue135, 16u, 16u);
            uint scalarValue85 = rdBitfieldInsert(131072u, productValue170, 0u, 16u);
            uint productValue137 = productValue134 * 1540483477u;
            uint productValue138 = productValue135 * 1540483477u;
            uint productValue171 = productValue170 * 1540483477u;
            uint bitwiseValue53 = ((((((((productValue137 ^ (productValue137 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ ((productValue138 ^ (productValue138 >> 24u)) * 1540483477u)) * 1540483477u) ^ ((productValue171 ^ (productValue171 >> 24u)) * 1540483477u)) * 1540483477u) ^ 2418085729u;
            uint bitwiseValue54 = (bitwiseValue53 ^ (bitwiseValue53 >> 13u)) * 1540483477u;
            uint bitwiseValue55 = (bitwiseValue54 >> 15u) ^ bitwiseValue54;
            uint bitwiseValue56 = (bitwiseValue55 ^ (bitwiseValue55 >> 16u)) & 65535u;
            bool comparisonValue101 = bitwiseValue56 != 0u;
            uint bitwiseValue57 = bitwiseValue56 | 1u;
            uint reinterpretedBits92 = uint(asfloat(asuint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x))) - 1u;
            uint comparisonValue102 = (comparisonValue101 ? bitwiseValue56 : bitwiseValue57) & reinterpretedBits92;
            uint comparisonValue13;
            uint comparisonValue14;
            uint bitwiseValue5;
            uint sumValue7;
            uint intermediateValue43;
            uint intermediateValue44;
            uint scalarValue35 = 0u;
            uint scalarValue36 = 0u;
            uint scalarValue86 = comparisonValue102;
            uint scalarValue51 = 0u;
            for (;;)
            {
                if (int(scalarValue51) >= int(8u))
                {
                    intermediateValue43 = scalarValue36;
                    intermediateValue44 = scalarValue35;
                    break;
                }
                uint productValue172 = scalarValue86 * 4u;
                uint4 loadedBufferValue104 = uint4(rdLoad_intermediateValue6(productValue172).x, rdLoad_intermediateValue6(productValue172 + 1u).x, rdLoad_intermediateValue6(productValue172 + 2u).x, rdLoad_intermediateValue6(productValue172 + 3u).x);
                uint bitwiseValue58 = loadedBufferValue104.z & 65535u;
                bool comparisonValue103 = (scalarValue85 == loadedBufferValue104.y) && (((comparisonValue101 && (bitwiseValue56 == bitwiseValue58)) || ((bitwiseValue57 == bitwiseValue58) && (!comparisonValue101))) && (scalarValue49 == loadedBufferValue104.x));
                bool comparisonValue77 = scalarValue35 != 0u;
                comparisonValue14 = (comparisonValue77 || (!comparisonValue103)) ? scalarValue36 : loadedBufferValue104.w;
                comparisonValue13 = comparisonValue103 ? 4294967295u : scalarValue35;
                bitwiseValue5 = reinterpretedBits92 & (scalarValue86 + 1u);
                bool comparisonValue104 = (bitwiseValue58 == 0u) || comparisonValue103;
                if (comparisonValue104 || ((!comparisonValue104) && comparisonValue77))
                {
                    intermediateValue43 = comparisonValue14;
                    intermediateValue44 = comparisonValue13;
                    break;
                }
                sumValue7 = scalarValue51 + 1u;
                scalarValue35 = comparisonValue13;
                scalarValue36 = comparisonValue14;
                scalarValue86 = bitwiseValue5;
                scalarValue51 = sumValue7;
                continue;
            }
            float multiplyAddValue48;
            float multiplyAddValue49;
            float multiplyAddValue50;
            if (intermediateValue44 != 0u)
            {
                float productValue141 = floor(reinterpretedBits89 * 0.0625f);
                float productValue142 = floor(reinterpretedBits90 * 0.0625f);
                float productValue173 = floor(reinterpretedBits94 * 0.0625f);
                float multiplyAddValue97 = mad(-productValue141, 16.0f, reinterpretedBits89);
                float multiplyAddValue98 = mad(-productValue142, 16.0f, reinterpretedBits90);
                float multiplyAddValue121 = mad(-productValue173, 16.0f, reinterpretedBits94);
                uint bitwiseValue59 = intermediateValue43 >> 2u;
                float scalarValue52 = floor(multiplyAddValue97);
                float scalarValue53 = floor(multiplyAddValue98);
                float scalarValue87 = floor(multiplyAddValue121);
                float sumValue90 = multiplyAddValue97 - scalarValue52;
                float sumValue91 = multiplyAddValue98 - scalarValue53;
                float sumValue125 = multiplyAddValue121 - scalarValue87;
                uint comparisonValue105 = rdBitfieldInsert(rdBitfieldInsert(0u, (sumValue91 >= sumValue125) ? 4294967295u : 0u, 1u, 1u), (sumValue90 >= sumValue91) ? 4294967295u : 0u, 0u, 1u) + rdBitfieldInsert(0u, (sumValue90 >= sumValue125) ? 4294967295u : 0u, 2u, 1u);
                float scalarValue55 = min(sumValue91, sumValue90);
                float scalarValue56 = max(sumValue91, sumValue90);
                float scalarValue88 = max(sumValue125, scalarValue56);
                float scalarValue89 = min(sumValue125, scalarValue55);
                float scalarValue90 = max(scalarValue55, min(sumValue125, scalarValue56));
                float sumValue126 = 1.0f - scalarValue88;
                float sumValue127 = scalarValue88 - scalarValue90;
                float sumValue128 = scalarValue90 - scalarValue89;
                float sumValue96 = scalarValue52 + 1.0f;
                float sumValue97 = scalarValue53 + 1.0f;
                float sumValue129 = scalarValue87 + 1.0f;
                float comparisonValue32;
                float comparisonValue33;
                float comparisonValue34;
                float comparisonValue35;
                float comparisonValue36;
                float comparisonValue37;
                float comparisonValue38;
                float comparisonValue39;
                float comparisonValue40;
                float comparisonValue41;
                float comparisonValue42;
                float comparisonValue43;
                if ((((sumValue96 < 16.0f) && (sumValue97 < 16.0f)) && (sumValue129 < 16.0f)) && (((scalarValue52 >= 0.0f) && (scalarValue53 >= 0.0f)) && (scalarValue87 >= 0.0f)))
                {
                    uint scalarValue60 = uint(scalarValue52);
                    uint scalarValue61 = uint(scalarValue53);
                    uint scalarValue91 = uint(scalarValue87);
                    uint scalarValue92 = min(comparisonValue105, 72u);
                    uint sumValue130 = min((comparisonValue105 + 5u), 72u);
                    uint4 loadedBufferValue105 = rdLoad_intermediateValue7(bitwiseValue59 + (((scalarValue91 << 4u) + scalarValue61) + (scalarValue60 << 8u)));
                    uint scalarValue93 = loadedBufferValue105.x;
                    float bitwiseValue60 = rdUnsignedToFloat((scalarValue93 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue106 = scalarValue93 != 0u;
                    uint4 loadedBufferValue106 = rdLoad_intermediateValue7(bitwiseValue59 + ((((uint(comparisonValue105 < 2u) + scalarValue91) << 4u) + (intermediateValue14[scalarValue92].y + scalarValue61)) + ((scalarValue60 + intermediateValue14[scalarValue92].x) << 8u)));
                    uint scalarValue94 = loadedBufferValue106.x;
                    float bitwiseValue61 = rdUnsignedToFloat((scalarValue94 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue107 = scalarValue94 != 0u;
                    uint4 loadedBufferValue107 = rdLoad_intermediateValue7(bitwiseValue59 + ((((uint(comparisonValue105 < 6u) + scalarValue91) << 4u) + (intermediateValue14[sumValue130].x + scalarValue61)) + ((scalarValue60 + intermediateValue14[sumValue130].y) << 8u)));
                    uint scalarValue95 = loadedBufferValue107.x;
                    float bitwiseValue62 = rdUnsignedToFloat((scalarValue95 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue108 = scalarValue95 != 0u;
                    uint4 loadedBufferValue108 = rdLoad_intermediateValue7(bitwiseValue59 + ((((scalarValue91 + 1u) << 4u) + (scalarValue61 + 1u)) + ((scalarValue60 + 1u) << 8u)));
                    uint scalarValue96 = loadedBufferValue108.x;
                    float bitwiseValue63 = rdUnsignedToFloat((scalarValue96 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue109 = scalarValue96 != 0u;
                    comparisonValue32 = comparisonValue109 ? ((bitwiseValue63 * (rdUnsignedToFloat((scalarValue96 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue33 = comparisonValue109 ? ((bitwiseValue63 * (rdUnsignedToFloat((scalarValue96 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue34 = comparisonValue109 ? ((bitwiseValue63 * (rdUnsignedToFloat(scalarValue96 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue35 = comparisonValue108 ? ((bitwiseValue62 * (rdUnsignedToFloat((scalarValue95 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue36 = comparisonValue108 ? ((bitwiseValue62 * (rdUnsignedToFloat((scalarValue95 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue37 = comparisonValue108 ? ((bitwiseValue62 * (rdUnsignedToFloat(scalarValue95 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue38 = comparisonValue106 ? ((bitwiseValue60 * (rdUnsignedToFloat((scalarValue93 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue39 = comparisonValue106 ? ((bitwiseValue60 * (rdUnsignedToFloat((scalarValue93 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue40 = comparisonValue106 ? ((bitwiseValue60 * (rdUnsignedToFloat(scalarValue93 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue41 = comparisonValue107 ? ((bitwiseValue61 * (rdUnsignedToFloat((scalarValue94 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue42 = comparisonValue107 ? ((bitwiseValue61 * (rdUnsignedToFloat((scalarValue94 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue43 = comparisonValue107 ? ((bitwiseValue61 * (rdUnsignedToFloat(scalarValue94 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                }
                else
                {
                    uint scalarValue97 = min(comparisonValue105, 72u);
                    float sumValue131 = scalarValue52 + rdUnsignedToFloat(intermediateValue14[scalarValue97].x);
                    float sumValue132 = scalarValue53 + rdUnsignedToFloat(intermediateValue14[scalarValue97].y);
                    float sumValue133 = scalarValue87 + rdUnsignedToFloat(uint(comparisonValue105 < 2u));
                    uint sumValue134 = min((comparisonValue105 + 5u), 72u);
                    float sumValue135 = scalarValue52 + rdUnsignedToFloat(intermediateValue14[sumValue134].y);
                    float sumValue136 = scalarValue53 + rdUnsignedToFloat(intermediateValue14[sumValue134].x);
                    float sumValue137 = scalarValue87 + rdUnsignedToFloat(uint(comparisonValue105 < 6u));
                    float multiplyAddValue100 = mad(productValue141, 16.0f, scalarValue52);
                    float multiplyAddValue101 = mad(productValue142, 16.0f, scalarValue53);
                    float multiplyAddValue122 = mad(productValue173, 16.0f, scalarValue87);
                    uint comparisonValue110 = min((((((rdBitfieldInsert(rdBitfieldInsert(0u, (scalarValue52 >= 16.0f) ? 4294967295u : 0u, 1u, 1u), (scalarValue52 < 0.0f) ? 4294967295u : 0u, 0u, 1u) + rdBitfieldInsert(0u, (scalarValue53 < 0.0f) ? 4294967295u : 0u, 2u, 1u)) + rdBitfieldInsert(0u, (scalarValue53 >= 16.0f) ? 4294967295u : 0u, 3u, 1u)) + rdBitfieldInsert(0u, (scalarValue87 < 0.0f) ? 4294967295u : 0u, 4u, 1u)) + rdBitfieldInsert(0u, (scalarValue87 >= 16.0f) ? 4294967295u : 0u, 5u, 1u)) + 8u), 72u);
                    bool conditionValue11 = int(intermediateValue14[comparisonValue110].z) < int(0u);
                    uint sumValue138 = bitwiseValue59 + 4097u;
                    uint4 loadedBufferValue109 = rdLoad_intermediateValue7(bitwiseValue59 + 4096u);
                    uint scalarValue98 = loadedBufferValue109.x;
                    uint4 loadedBufferValue110 = rdLoad_intermediateValue7(conditionValue11 ? (bitwiseValue59 + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(scalarValue87), 4u, 4u), uint(scalarValue53), 0u, 4u) + rdBitfieldInsert(0u, uint(scalarValue52), 8u, 4u))) : ((rdLoad_intermediateValue7(intermediateValue14[comparisonValue110].z + sumValue138).x >> 2u) + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue122 * 0.0625f), 16.0f, multiplyAddValue122)), 4u, 4u), uint(mad(-floor(multiplyAddValue101 * 0.0625f), 16.0f, multiplyAddValue101)), 0u, 4u) + rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue100 * 0.0625f), 16.0f, multiplyAddValue100)), 8u, 4u))));
                    uint scalarValue99 = loadedBufferValue110.x;
                    float bitwiseValue64 = rdUnsignedToFloat((scalarValue99 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue111 = (conditionValue11 || ((scalarValue98 & (1u << (intermediateValue14[comparisonValue110].z & 31u))) != 0u)) && (scalarValue99 != 0u);
                    float multiplyAddValue123 = mad(productValue141, 16.0f, sumValue131);
                    float multiplyAddValue124 = mad(productValue142, 16.0f, sumValue132);
                    float multiplyAddValue125 = mad(productValue173, 16.0f, sumValue133);
                    uint comparisonValue112 = min((((((rdBitfieldInsert(rdBitfieldInsert(0u, (sumValue131 >= 16.0f) ? 4294967295u : 0u, 1u, 1u), (sumValue131 < 0.0f) ? 4294967295u : 0u, 0u, 1u) + rdBitfieldInsert(0u, (sumValue132 < 0.0f) ? 4294967295u : 0u, 2u, 1u)) + rdBitfieldInsert(0u, (sumValue132 >= 16.0f) ? 4294967295u : 0u, 3u, 1u)) + rdBitfieldInsert(0u, (sumValue133 < 0.0f) ? 4294967295u : 0u, 4u, 1u)) + rdBitfieldInsert(0u, (sumValue133 >= 16.0f) ? 4294967295u : 0u, 5u, 1u)) + 8u), 72u);
                    bool conditionValue12 = int(intermediateValue14[comparisonValue112].z) < int(0u);
                    uint4 loadedBufferValue111 = rdLoad_intermediateValue7(conditionValue12 ? (bitwiseValue59 + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(sumValue133), 4u, 4u), uint(sumValue132), 0u, 4u) + rdBitfieldInsert(0u, uint(sumValue131), 8u, 4u))) : ((rdLoad_intermediateValue7(intermediateValue14[comparisonValue112].z + sumValue138).x >> 2u) + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue125 * 0.0625f), 16.0f, multiplyAddValue125)), 4u, 4u), uint(mad(-floor(multiplyAddValue124 * 0.0625f), 16.0f, multiplyAddValue124)), 0u, 4u) + rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue123 * 0.0625f), 16.0f, multiplyAddValue123)), 8u, 4u))));
                    uint scalarValue100 = loadedBufferValue111.x;
                    float bitwiseValue65 = rdUnsignedToFloat((scalarValue100 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue113 = (conditionValue12 || ((scalarValue98 & (1u << (intermediateValue14[comparisonValue112].z & 31u))) != 0u)) && (scalarValue100 != 0u);
                    float multiplyAddValue126 = mad(productValue141, 16.0f, sumValue135);
                    float multiplyAddValue127 = mad(productValue142, 16.0f, sumValue136);
                    float multiplyAddValue128 = mad(productValue173, 16.0f, sumValue137);
                    uint comparisonValue114 = min((((((rdBitfieldInsert(rdBitfieldInsert(0u, (sumValue135 >= 16.0f) ? 4294967295u : 0u, 1u, 1u), (sumValue135 < 0.0f) ? 4294967295u : 0u, 0u, 1u) + rdBitfieldInsert(0u, (sumValue136 < 0.0f) ? 4294967295u : 0u, 2u, 1u)) + rdBitfieldInsert(0u, (sumValue136 >= 16.0f) ? 4294967295u : 0u, 3u, 1u)) + rdBitfieldInsert(0u, (sumValue137 < 0.0f) ? 4294967295u : 0u, 4u, 1u)) + rdBitfieldInsert(0u, (sumValue137 >= 16.0f) ? 4294967295u : 0u, 5u, 1u)) + 8u), 72u);
                    bool conditionValue13 = int(intermediateValue14[comparisonValue114].z) < int(0u);
                    uint4 loadedBufferValue112 = rdLoad_intermediateValue7(conditionValue13 ? (bitwiseValue59 + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(sumValue137), 4u, 4u), uint(sumValue136), 0u, 4u) + rdBitfieldInsert(0u, uint(sumValue135), 8u, 4u))) : ((rdLoad_intermediateValue7(intermediateValue14[comparisonValue114].z + sumValue138).x >> 2u) + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue128 * 0.0625f), 16.0f, multiplyAddValue128)), 4u, 4u), uint(mad(-floor(multiplyAddValue127 * 0.0625f), 16.0f, multiplyAddValue127)), 0u, 4u) + rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue126 * 0.0625f), 16.0f, multiplyAddValue126)), 8u, 4u))));
                    uint scalarValue101 = loadedBufferValue112.x;
                    float bitwiseValue66 = rdUnsignedToFloat((scalarValue101 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue115 = (conditionValue13 || ((scalarValue98 & (1u << (intermediateValue14[comparisonValue114].z & 31u))) != 0u)) && (scalarValue101 != 0u);
                    float multiplyAddValue109 = mad(productValue141, 16.0f, sumValue96);
                    float multiplyAddValue110 = mad(productValue142, 16.0f, sumValue97);
                    float multiplyAddValue129 = mad(productValue173, 16.0f, sumValue129);
                    uint comparisonValue116 = min((((((rdBitfieldInsert(rdBitfieldInsert(0u, (sumValue96 >= 16.0f) ? 4294967295u : 0u, 1u, 1u), (sumValue96 < 0.0f) ? 4294967295u : 0u, 0u, 1u) + rdBitfieldInsert(0u, (sumValue97 < 0.0f) ? 4294967295u : 0u, 2u, 1u)) + rdBitfieldInsert(0u, (sumValue97 >= 16.0f) ? 4294967295u : 0u, 3u, 1u)) + rdBitfieldInsert(0u, (sumValue129 < 0.0f) ? 4294967295u : 0u, 4u, 1u)) + rdBitfieldInsert(0u, (sumValue129 >= 16.0f) ? 4294967295u : 0u, 5u, 1u)) + 8u), 72u);
                    bool conditionValue14 = int(intermediateValue14[comparisonValue116].z) < int(0u);
                    uint4 loadedBufferValue113 = rdLoad_intermediateValue7(conditionValue14 ? (bitwiseValue59 + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(sumValue129), 4u, 4u), uint(sumValue97), 0u, 4u) + rdBitfieldInsert(0u, uint(sumValue96), 8u, 4u))) : ((rdLoad_intermediateValue7(intermediateValue14[comparisonValue116].z + sumValue138).x >> 2u) + (rdBitfieldInsert(rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue129 * 0.0625f), 16.0f, multiplyAddValue129)), 4u, 4u), uint(mad(-floor(multiplyAddValue110 * 0.0625f), 16.0f, multiplyAddValue110)), 0u, 4u) + rdBitfieldInsert(0u, uint(mad(-floor(multiplyAddValue109 * 0.0625f), 16.0f, multiplyAddValue109)), 8u, 4u))));
                    uint scalarValue102 = loadedBufferValue113.x;
                    float bitwiseValue67 = rdUnsignedToFloat((scalarValue102 >> 24u) & 255u) * 0.0039215688593685626983642578125f;
                    bool comparisonValue117 = (conditionValue14 || ((scalarValue98 & (1u << (intermediateValue14[comparisonValue116].z & 31u))) != 0u)) && (scalarValue102 != 0u);
                    comparisonValue32 = comparisonValue117 ? ((bitwiseValue67 * (rdUnsignedToFloat((scalarValue102 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue33 = comparisonValue117 ? ((bitwiseValue67 * (rdUnsignedToFloat((scalarValue102 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue34 = comparisonValue117 ? ((bitwiseValue67 * (rdUnsignedToFloat(scalarValue102 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue35 = comparisonValue115 ? ((bitwiseValue66 * (rdUnsignedToFloat((scalarValue101 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue36 = comparisonValue115 ? ((bitwiseValue66 * (rdUnsignedToFloat((scalarValue101 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue37 = comparisonValue115 ? ((bitwiseValue66 * (rdUnsignedToFloat(scalarValue101 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue38 = comparisonValue111 ? ((bitwiseValue64 * (rdUnsignedToFloat((scalarValue99 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue39 = comparisonValue111 ? ((bitwiseValue64 * (rdUnsignedToFloat((scalarValue99 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue40 = comparisonValue111 ? ((bitwiseValue64 * (rdUnsignedToFloat(scalarValue99 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue41 = comparisonValue113 ? ((bitwiseValue65 * (rdUnsignedToFloat((scalarValue100 >> 16u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue42 = comparisonValue113 ? ((bitwiseValue65 * (rdUnsignedToFloat((scalarValue100 >> 8u) & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                    comparisonValue43 = comparisonValue113 ? ((bitwiseValue65 * (rdUnsignedToFloat(scalarValue100 & 255u) * 0.0039215688593685626983642578125f)) * 6.0f) : 0.0f;
                }
                multiplyAddValue48 = mad(comparisonValue32, scalarValue89, mad(comparisonValue35, sumValue128, mad(comparisonValue38, sumValue126, sumValue127 * comparisonValue41)));
                multiplyAddValue49 = mad(comparisonValue33, scalarValue89, mad(comparisonValue36, sumValue128, mad(comparisonValue39, sumValue126, sumValue127 * comparisonValue42)));
                multiplyAddValue50 = mad(comparisonValue34, scalarValue89, mad(comparisonValue37, sumValue128, mad(comparisonValue40, sumValue126, sumValue127 * comparisonValue43)));
            }
            else
            {
                multiplyAddValue48 = 0.0f;
                multiplyAddValue49 = 0.0f;
                multiplyAddValue50 = 0.0f;
            }
            float reinterpretedBits52 = asfloat(asuint(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w));
            float reinterpretedBits95 = asfloat(asuint(RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x));
            productValue14 = (multiplyAddValue48 * reinterpretedBits52) * reinterpretedBits95;
            productValue15 = (multiplyAddValue49 * reinterpretedBits52) * reinterpretedBits95;
            productValue16 = (multiplyAddValue50 * reinterpretedBits52) * reinterpretedBits95;
        }
        else
        {
            uint4 reinterpretedBits49 = asuint(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY);
            float reinterpretedBits93 = asfloat(asuint(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w));
            productValue14 = (intermediateValue33 * asfloat(reinterpretedBits49.z)) * reinterpretedBits93;
            productValue15 = (intermediateValue33 * asfloat(reinterpretedBits49.y)) * reinterpretedBits93;
            productValue16 = (intermediateValue33 * asfloat(reinterpretedBits49.x)) * reinterpretedBits93;
        }
        uint4 reinterpretedBits50 = asuint(RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY);
        float reinterpretedBits51 = asfloat(asuint(RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w));
        float reinterpretedBits53 = asfloat(asuint(RD_UNIFORM_MIN_AMBIENT_VALUE.x));
        float reinterpretedBits54 = asfloat(asuint(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w));
        float multiplyAddValue130 = ((multiplyAddValue74 * max(mad(intermediateValue32 * asfloat(reinterpretedBits50.x), reinterpretedBits51, productValue16), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float multiplyAddValue131 = ((multiplyAddValue75 * max(mad(intermediateValue32 * asfloat(reinterpretedBits50.y), reinterpretedBits51, productValue15), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float multiplyAddValue132 = ((multiplyAddValue76 * max(mad(intermediateValue32 * asfloat(reinterpretedBits50.z), reinterpretedBits51, productValue14), reinterpretedBits53)) * reinterpretedBits54) * 0.079577468335628509521484375f;
        float quotientValue17 = multiplyAddValue23 / nonlinearValue1;
        float quotientValue18 = multiplyAddValue24 / nonlinearValue1;
        float quotientValue19 = multiplyAddValue25 / nonlinearValue1;
        float multiplyAddValue33;
        float multiplyAddValue34;
        float multiplyAddValue35;
        if ((asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.y)) == 0.0f) || (abs(intermediateValue32) > 9.9999997473787516355514526367188e-05f))
        {
            float4 loadedBufferValue30 = materialTexture7.Load(int4(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z), 0u));
            float scalarValue9 = loadedBufferValue30.x;
            float reinterpretedBits56 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y));
            float reinterpretedBits57 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x));
            float reinterpretedBits58 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z));
            float reinterpretedBits59 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w));
            float multiplyAddValue55 = mad(reinterpretedBits23, reinterpretedBits59, mad(reinterpretedBits19, reinterpretedBits58, mad(reinterpretedBits15, reinterpretedBits57, reinterpretedBits11 * reinterpretedBits56)));
            float multiplyAddValue56 = mad(reinterpretedBits24, reinterpretedBits59, mad(reinterpretedBits20, reinterpretedBits58, mad(reinterpretedBits16, reinterpretedBits57, reinterpretedBits12 * reinterpretedBits56)));
            float multiplyAddValue57 = mad(reinterpretedBits25, reinterpretedBits59, mad(reinterpretedBits21, reinterpretedBits58, mad(reinterpretedBits17, reinterpretedBits57, reinterpretedBits13 * reinterpretedBits56)));
            float3 vectorValue1 = float3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
            float inverseLengthValue1 = rsqrt(rdDot3Precise(vectorValue1, vectorValue1));
            float multiplyAddValue80 = rdDot2Precise(rdDot3Precise(float3(-quotientValue17, -quotientValue18, -quotientValue19), float3(inverseLengthValue1 * multiplyAddValue55, inverseLengthValue1 * multiplyAddValue56, inverseLengthValue1 * multiplyAddValue57)).xx, multiplyAddValue73.xx) + mad(multiplyAddValue73, multiplyAddValue73, 1.0f);
            float multiplyAddValue81 = (mad(-multiplyAddValue73, multiplyAddValue73, 1.0f) * 0.079577468335628509521484375f) / (multiplyAddValue80 * sqrt(multiplyAddValue80));
            float reinterpretedBits60 = asfloat(asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w));
            uint4 reinterpretedBits61 = asuint(RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE);
            multiplyAddValue33 = mad(multiplyAddValue81 * (scalarValue9 * multiplyAddValue74), reinterpretedBits60 * asfloat(reinterpretedBits61.x), multiplyAddValue130);
            multiplyAddValue34 = mad(multiplyAddValue81 * (scalarValue9 * multiplyAddValue75), reinterpretedBits60 * asfloat(reinterpretedBits61.y), multiplyAddValue131);
            multiplyAddValue35 = mad(multiplyAddValue81 * (scalarValue9 * multiplyAddValue76), reinterpretedBits60 * asfloat(reinterpretedBits61.z), multiplyAddValue132);
        }
        else
        {
            multiplyAddValue33 = multiplyAddValue130;
            multiplyAddValue34 = multiplyAddValue131;
            multiplyAddValue35 = multiplyAddValue132;
        }
        float multiplyAddValue38;
        float multiplyAddValue39;
        float multiplyAddValue40;
        if (reinterpretedBits63 && (asfloat(asuint(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.y)) != 0.0f))
        {
            float reinterpretedBits64 = 1.0f - asfloat(asuint(RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x));
            float scalarValue19 = -multiplyAddValue25;
            float reinterpretedBits65 = asfloat(asuint(RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z));
            float productValue98 = scalarValue19 * reinterpretedBits65;
            float reinterpretedBits66 = asfloat(asuint(RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w));
            uint4 reinterpretedBits67 = asuint(RD_UNIFORM_CLUSTER_DEPTH_BOUNDS);
            bool reinterpretedBits68 = scalarValue19 < asfloat(reinterpretedBits67.x);
            bool reinterpretedBits69 = scalarValue19 < asfloat(reinterpretedBits67.y);
            uint4 reinterpretedBits70 = asuint(RD_UNIFORM_CLUSTER_DIMENSIONS);
            float reinterpretedBits71 = asfloat(reinterpretedBits70.x);
            float reinterpretedBits72 = asfloat(reinterpretedBits70.y);
            float reinterpretedBits73 = asfloat(reinterpretedBits70.z);
            float clampedValue8 = min(reinterpretedBits73 - 1.0f, floor(clamp((log2(scalarValue19) - asfloat(asuint(RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z))) * asfloat(asuint(RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x)), 0.0f, 1.0f) * (reinterpretedBits73 - 2.0f)) + 2.0f);
            float comparisonValue52 = reinterpretedBits69 ? 1.0f : clampedValue8;
            float multiplyAddValue82 = min(reinterpretedBits72 - 1.0f, floor(clamp(mad(scalarValue19, reinterpretedBits65, multiplyAddValue24) / (productValue98 + productValue98), 0.0f, 1.0f) * reinterpretedBits72));
            float multiplyAddValue83 = min(reinterpretedBits71 - 1.0f, floor(clamp(mad(productValue98, reinterpretedBits66, multiplyAddValue23) / mad(productValue98, reinterpretedBits66, productValue98 * reinterpretedBits66), 0.0f, 1.0f) * reinterpretedBits71));
            float reinterpretedBits74 = asfloat(asuint(RD_UNIFORM_CLUSTER_DIMENSIONS.x));
            float reinterpretedBits75 = asfloat(asuint(RD_UNIFORM_CLUSTER_DIMENSIONS.y));
            float intermediateValue46;
            float intermediateValue48;
            float intermediateValue50;
            if (!(((((((clampedValue8 < 0.0f) && (!reinterpretedBits69)) && (!reinterpretedBits68)) || ((multiplyAddValue83 < 0.0f) || (multiplyAddValue82 < 0.0f))) || (multiplyAddValue83 >= reinterpretedBits74)) || (multiplyAddValue82 >= reinterpretedBits75)) || ((reinterpretedBits68 ? 0.0f : comparisonValue52) >= asfloat(asuint(RD_UNIFORM_CLUSTER_DIMENSIONS.z)))))
            {
                float multiplyAddValue84 = mad(multiplyAddValue82, reinterpretedBits74, multiplyAddValue83);
                uint reinterpretedBits76 = uint(int(asfloat(asuint(RD_UNIFORM_CLUSTER_DIMENSIONS.w))));
                uint multiplyAddValue85 = uint(int(reinterpretedBits68 ? multiplyAddValue84 : mad(reinterpretedBits75, reinterpretedBits74 * comparisonValue52, multiplyAddValue84))) * reinterpretedBits76;
                uint sumValue63 = multiplyAddValue85 + reinterpretedBits76;
                bool reinterpretedBits77 = asfloat(asuint(RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x)) > 0.0f;
                bool reinterpretedBits78 = asfloat(asuint(RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x)) > 0.0f;
                float reinterpretedBits79 = asfloat(asuint(RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x));
                float scalarValue20 = -reinterpretedBits79;
                uint4 reinterpretedBits80 = asuint(RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION);
                float reinterpretedBits81 = asfloat(reinterpretedBits80.x);
                float reinterpretedBits82 = asfloat(reinterpretedBits80.y);
                float quotientValue20 = 0.5f / reinterpretedBits81;
                float quotientValue21 = 0.5f / reinterpretedBits82;
                float reinterpretedBits83 = 1.0f / (asfloat(asuint(RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y)) - reinterpretedBits79);
                float multiplyAddValue86 = mad(multiplyAddValue73, multiplyAddValue73, 1.0f);
                float sumValue64 = multiplyAddValue73 + multiplyAddValue73;
                float multiplyAddValue87 = mad(-multiplyAddValue73, multiplyAddValue73, 1.0f) * 0.079577468335628509521484375f;
                float intermediateValue47;
                float intermediateValue49;
                float intermediateValue51;
                intermediateValue51 = 0.0f;
                intermediateValue49 = 0.0f;
                intermediateValue47 = 0.0f;
                float multiplyAddValue51;
                float multiplyAddValue52;
                float multiplyAddValue53;
                uint sumValue19;
                uint scalarValue21 = multiplyAddValue85;
                for (;;)
                {
                    if (int(sumValue63) <= int(scalarValue21))
                    {
                        break;
                    }
                    uint loadedBufferValue114 = uint(int(asfloat(rdLoad_intermediateValue9(scalarValue21).x)));
                    if (int(loadedBufferValue114) < int(0u))
                    {
                        break;
                    }
                    float intermediateValue81;
                    float intermediateValue82;
                    float intermediateValue83;
                    bool intermediateValue84;
                    if (int(loadedBufferValue114) >= int(0u))
                    {
                        uint productValue174 = loadedBufferValue114 * 32u;
                        float4 loadedBufferValue115 = asfloat(uint4(rdLoad_intermediateValue10(productValue174).x, rdLoad_intermediateValue10(productValue174 + 1u).x, rdLoad_intermediateValue10(productValue174 + 2u).x, rdLoad_intermediateValue10(productValue174 + 3u).x));
                        float scalarValue103 = loadedBufferValue115.w;
                        float sumValue139 = loadedBufferValue115.x - multiplyAddValue20;
                        float sumValue140 = loadedBufferValue115.y - multiplyAddValue21;
                        float sumValue141 = loadedBufferValue115.z - multiplyAddValue22;
                        float sumValue142 = abs(sumValue141) + (abs(sumValue140) + abs(sumValue139));
                        float3 vectorValue4 = float3(sumValue139, sumValue140, sumValue141);
                        float comparisonValue118 = reinterpretedBits77 ? (sumValue142 * sumValue142) : rdDot3Precise(vectorValue4, vectorValue4);
                        float productValue23;
                        float productValue24;
                        float productValue25;
                        bool intermediateValue85;
                        if (comparisonValue118 < (scalarValue103 * scalarValue103))
                        {
                            bool intermediateValue90;
                            if (reinterpretedBits63)
                            {
                                uint productValue175 = loadedBufferValue114 * 32u;
                                float3 loadedBufferValue116 = asfloat(uint3(rdLoad_intermediateValue10(productValue175).x, rdLoad_intermediateValue10(productValue175 + 1u).x, rdLoad_intermediateValue10(productValue175 + 2u).x));
                                float scalarValue104 = loadedBufferValue116.x;
                                float scalarValue105 = loadedBufferValue116.y;
                                float scalarValue106 = loadedBufferValue116.z;
                                uint productValue176 = (loadedBufferValue114 * 32u) + 8u;
                                float4 loadedBufferValue117 = asfloat(uint4(rdLoad_intermediateValue10(productValue176).x, rdLoad_intermediateValue10(productValue176 + 1u).x, rdLoad_intermediateValue10(productValue176 + 2u).x, rdLoad_intermediateValue10(productValue176 + 3u).x));
                                uint productValue177 = (loadedBufferValue114 * 32u) + 12u;
                                float4 loadedBufferValue118 = asfloat(uint4(rdLoad_intermediateValue10(productValue177).x, rdLoad_intermediateValue10(productValue177 + 1u).x, rdLoad_intermediateValue10(productValue177 + 2u).x, rdLoad_intermediateValue10(productValue177 + 3u).x));
                                uint productValue178 = (loadedBufferValue114 * 32u) + 16u;
                                float4 loadedBufferValue119 = asfloat(uint4(rdLoad_intermediateValue10(productValue178).x, rdLoad_intermediateValue10(productValue178 + 1u).x, rdLoad_intermediateValue10(productValue178 + 2u).x, rdLoad_intermediateValue10(productValue178 + 3u).x));
                                uint productValue179 = (loadedBufferValue114 * 32u) + 20u;
                                float4 loadedBufferValue120 = asfloat(uint4(rdLoad_intermediateValue10(productValue179).x, rdLoad_intermediateValue10(productValue179 + 1u).x, rdLoad_intermediateValue10(productValue179 + 2u).x, rdLoad_intermediateValue10(productValue179 + 3u).x));
                                uint productValue180 = (loadedBufferValue114 * 32u) + 24u;
                                float4 loadedBufferValue121 = asfloat(uint4(rdLoad_intermediateValue10(productValue180).x, rdLoad_intermediateValue10(productValue180 + 1u).x, rdLoad_intermediateValue10(productValue180 + 2u).x, rdLoad_intermediateValue10(productValue180 + 3u).x));
                                uint productValue181 = (loadedBufferValue114 * 32u) + 28u;
                                float4 loadedBufferValue122 = asfloat(uint4(rdLoad_intermediateValue10(productValue181).x, rdLoad_intermediateValue10(productValue181 + 1u).x, rdLoad_intermediateValue10(productValue181 + 2u).x, rdLoad_intermediateValue10(productValue181 + 3u).x));
                                float sumValue143 = multiplyAddValue20 - scalarValue104;
                                float sumValue144 = multiplyAddValue21 - scalarValue105;
                                float sumValue145 = multiplyAddValue22 - scalarValue106;
                                float scalarValue107 = abs(sumValue143);
                                float scalarValue108 = abs(sumValue144);
                                float scalarValue109 = abs(sumValue145);
                                bool comparisonValue119 = scalarValue108 >= scalarValue109;
                                bool comparisonValue120 = (scalarValue107 >= scalarValue109) && (scalarValue107 >= scalarValue108);
                                bool comparisonValue121 = sumValue144 >= 0.0f;
                                bool comparisonValue122 = sumValue145 >= 0.0f;
                                bool conditionValue15 = !comparisonValue120;
                                bool comparisonValue123 = (!(sumValue143 >= 0.0f)) && comparisonValue120;
                                bool bitwiseValue68 = (comparisonValue121 && comparisonValue119) && conditionValue15;
                                bool bitwiseValue69 = (comparisonValue119 && (!comparisonValue121)) && conditionValue15;
                                bool bitwiseValue70 = ((!comparisonValue119) && comparisonValue122) && conditionValue15;
                                bool bitwiseValue71 = (comparisonValue122 || comparisonValue119) || comparisonValue120;
                                float comparisonValue124 = comparisonValue123 ? loadedBufferValue118.z : (bitwiseValue68 ? loadedBufferValue119.z : (bitwiseValue69 ? loadedBufferValue120.z : (bitwiseValue70 ? loadedBufferValue121.z : (bitwiseValue71 ? loadedBufferValue117.z : loadedBufferValue122.z))));
                                float comparisonValue125 = comparisonValue123 ? loadedBufferValue118.w : (bitwiseValue68 ? loadedBufferValue119.w : (bitwiseValue69 ? loadedBufferValue120.w : (bitwiseValue70 ? loadedBufferValue121.w : (bitwiseValue71 ? loadedBufferValue117.w : loadedBufferValue122.w))));
                                bool multiplyAddValue70;
                                if (!((comparisonValue125 == 0.0f) && (comparisonValue124 == 0.0f)))
                                {
                                    float scalarValue110 = scalarValue104 - multiplyAddValue20;
                                    float sumValue146 = scalarValue106 - multiplyAddValue22;
                                    float comparisonValue126 = comparisonValue123 ? loadedBufferValue118.x : (bitwiseValue68 ? loadedBufferValue119.x : (bitwiseValue69 ? loadedBufferValue120.x : (bitwiseValue70 ? loadedBufferValue121.x : (bitwiseValue71 ? loadedBufferValue117.x : loadedBufferValue122.x))));
                                    float comparisonValue127 = comparisonValue123 ? loadedBufferValue118.y : (bitwiseValue68 ? loadedBufferValue119.y : (bitwiseValue69 ? loadedBufferValue120.y : (bitwiseValue70 ? loadedBufferValue121.y : (bitwiseValue71 ? loadedBufferValue117.y : loadedBufferValue122.y))));
                                    float comparisonValue128 = comparisonValue123 ? sumValue146 : ((bitwiseValue68 || (bitwiseValue69 || bitwiseValue70)) ? scalarValue110 : (bitwiseValue71 ? sumValue145 : sumValue143));
                                    float comparisonValue129 = comparisonValue123 ? sumValue144 : (bitwiseValue68 ? sumValue146 : (bitwiseValue69 ? sumValue145 : sumValue144));
                                    float comparisonValue130 = comparisonValue123 ? sumValue143 : (bitwiseValue68 ? (scalarValue105 - multiplyAddValue21) : (bitwiseValue69 ? sumValue144 : (bitwiseValue70 ? sumValue146 : (bitwiseValue71 ? scalarValue110 : sumValue145))));
                                    uint4 reinterpretedBits84 = asuint(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1);
                                    uint4 reinterpretedBits85 = asuint(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0);
                                    uint4 reinterpretedBits86 = asuint(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2);
                                    uint4 reinterpretedBits87 = asuint(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3);
                                    float multiplyAddValue133 = mad(asfloat(reinterpretedBits86.w), comparisonValue130, mad(asfloat(reinterpretedBits85.w), comparisonValue128, comparisonValue129 * asfloat(reinterpretedBits84.w))) + asfloat(reinterpretedBits87.w);
                                    float sumValue147 = comparisonValue124 - comparisonValue126;
                                    float sumValue148 = comparisonValue125 - comparisonValue127;
                                    float productValue182 = sumValue147 * reinterpretedBits81;
                                    float productValue183 = sumValue148 * reinterpretedBits82;
                                    float4 sampledTextureValue5 = materialTexture2.SampleLevel(textureSampler2, float2(min(comparisonValue124 - quotientValue20, max(quotientValue20 + comparisonValue126, mad((floor(mad((mad(asfloat(reinterpretedBits86.x), comparisonValue130, mad(asfloat(reinterpretedBits85.x), comparisonValue128, comparisonValue129 * asfloat(reinterpretedBits84.x))) + asfloat(reinterpretedBits87.x)) / multiplyAddValue133, 0.5f, 0.5f) * productValue182) + 0.5f) / productValue182, sumValue147, comparisonValue126))), min(comparisonValue125 - quotientValue21, max(quotientValue21 + comparisonValue127, mad((floor((1.0f - mad((mad(asfloat(reinterpretedBits86.y), comparisonValue130, mad(asfloat(reinterpretedBits85.y), comparisonValue128, comparisonValue129 * asfloat(reinterpretedBits84.y))) + asfloat(reinterpretedBits87.y)) / multiplyAddValue133, 0.5f, 0.5f)) * productValue183) + 0.5f) / productValue183, sumValue148, comparisonValue127)))), 0.0f);
                                    multiplyAddValue70 = sampledTextureValue5.x >= ((mad(asfloat(reinterpretedBits86.z), comparisonValue130, mad(asfloat(reinterpretedBits85.z), comparisonValue128, comparisonValue129 * asfloat(reinterpretedBits84.z))) + asfloat(reinterpretedBits87.z)) / multiplyAddValue133);
                                }
                                else
                                {
                                    multiplyAddValue70 = false;
                                }
                                intermediateValue90 = multiplyAddValue70;
                            }
                            else
                            {
                                intermediateValue90 = true;
                            }
                            float quotientValue25 = 1.0f / max(comparisonValue118, 0.100000001490116119384765625f);
                            float multiplyAddValue134 = comparisonValue118 / mad(scalarValue103, scalarValue103, 9.9999997473787516355514526367188e-05f);
                            float multiplyAddValue135 = max(mad(-multiplyAddValue134, multiplyAddValue134, 1.0f), 0.0f);
                            float productValue184 = multiplyAddValue135 * multiplyAddValue135;
                            float productValue185 = productValue184 * quotientValue25;
                            float multiplyAddValue136 = clamp(reinterpretedBits83 * (mad(-quotientValue25, productValue184, scalarValue20) + 1.0f), 0.0f, 1.0f);
                            float multiplyAddValue137 = reinterpretedBits78 ? (clamp(mad((multiplyAddValue136 * multiplyAddValue136) * mad(multiplyAddValue136, -2.0f, 3.0f), asfloat(asuint(RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z)), asfloat(asuint(RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w))), 0.0f, 1.0f) * productValue185) : productValue185;
                            uint productValue186 = (loadedBufferValue114 * 32u) + 4u;
                            float4 loadedBufferValue123 = asfloat(uint4(rdLoad_intermediateValue10(productValue186).x, rdLoad_intermediateValue10(productValue186 + 1u).x, rdLoad_intermediateValue10(productValue186 + 2u).x, rdLoad_intermediateValue10(productValue186 + 3u).x));
                            float scalarValue111 = loadedBufferValue123.w;
                            intermediateValue85 = intermediateValue90;
                            productValue25 = multiplyAddValue137 * (scalarValue111 * loadedBufferValue123.x);
                            productValue24 = multiplyAddValue137 * (scalarValue111 * loadedBufferValue123.y);
                            productValue23 = multiplyAddValue137 * (scalarValue111 * loadedBufferValue123.z);
                        }
                        else
                        {
                            intermediateValue85 = true;
                            productValue25 = 0.0f;
                            productValue24 = 0.0f;
                            productValue23 = 0.0f;
                        }
                        intermediateValue81 = productValue23;
                        intermediateValue82 = productValue24;
                        intermediateValue83 = productValue25;
                        intermediateValue84 = intermediateValue85;
                    }
                    else
                    {
                        intermediateValue81 = 0.0f;
                        intermediateValue82 = 0.0f;
                        intermediateValue83 = 0.0f;
                        intermediateValue84 = true;
                    }
                    uint productValue187 = loadedBufferValue114 * 32u;
                    float3 loadedBufferValue124 = asfloat(uint3(rdLoad_intermediateValue10(productValue187).x, rdLoad_intermediateValue10(productValue187 + 1u).x, rdLoad_intermediateValue10(productValue187 + 2u).x));
                    float scalarValue112 = loadedBufferValue124.x;
                    float scalarValue113 = loadedBufferValue124.y;
                    float scalarValue114 = loadedBufferValue124.z;
                    float multiplyAddValue138 = (mad(reinterpretedBits19, scalarValue114, mad(reinterpretedBits15, scalarValue112, scalarValue113 * reinterpretedBits11)) + reinterpretedBits23) - multiplyAddValue23;
                    float multiplyAddValue139 = (mad(reinterpretedBits20, scalarValue114, mad(reinterpretedBits16, scalarValue112, scalarValue113 * reinterpretedBits12)) + reinterpretedBits24) - multiplyAddValue24;
                    float multiplyAddValue140 = (mad(reinterpretedBits21, scalarValue114, mad(reinterpretedBits17, scalarValue112, scalarValue113 * reinterpretedBits13)) + reinterpretedBits25) - multiplyAddValue25;
                    float3 vectorValue5 = float3(multiplyAddValue138, multiplyAddValue139, multiplyAddValue140);
                    float inverseLengthValue5 = rsqrt(rdDot3Precise(vectorValue5, vectorValue5));
                    float multiplyAddValue141 = mad(sumValue64, rdDot3Precise(float3(-quotientValue17, -quotientValue18, -quotientValue19), float3(multiplyAddValue138 * inverseLengthValue5, multiplyAddValue139 * inverseLengthValue5, multiplyAddValue140 * inverseLengthValue5)), multiplyAddValue86);
                    float nonlinearValue6 = multiplyAddValue87 / (sqrt(multiplyAddValue141) * multiplyAddValue141);
                    multiplyAddValue51 = intermediateValue84 ? mad(intermediateValue83, multiplyAddValue74 * nonlinearValue6, intermediateValue51) : intermediateValue51;
                    multiplyAddValue52 = intermediateValue84 ? mad(intermediateValue82, multiplyAddValue75 * nonlinearValue6, intermediateValue49) : intermediateValue49;
                    multiplyAddValue53 = intermediateValue84 ? mad(intermediateValue81, multiplyAddValue76 * nonlinearValue6, intermediateValue47) : intermediateValue47;
                    sumValue19 = scalarValue21 + 1u;
                    intermediateValue51 = multiplyAddValue51;
                    intermediateValue49 = multiplyAddValue52;
                    intermediateValue47 = multiplyAddValue53;
                    scalarValue21 = sumValue19;
                    continue;
                }
                intermediateValue46 = intermediateValue47;
                intermediateValue48 = intermediateValue49;
                intermediateValue50 = intermediateValue51;
            }
            else
            {
                intermediateValue46 = 0.0f;
                intermediateValue48 = 0.0f;
                intermediateValue50 = 0.0f;
            }
            multiplyAddValue38 = mad(reinterpretedBits64, intermediateValue46, multiplyAddValue35);
            multiplyAddValue39 = mad(reinterpretedBits64, intermediateValue48, multiplyAddValue34);
            multiplyAddValue40 = mad(reinterpretedBits64, intermediateValue50, multiplyAddValue33);
        }
        else
        {
            multiplyAddValue38 = multiplyAddValue35;
            multiplyAddValue39 = multiplyAddValue34;
            multiplyAddValue40 = multiplyAddValue33;
        }
        intermediateValue11[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = float4(multiplyAddValue40, multiplyAddValue39, multiplyAddValue38, mad(clampedValue3, -multiplyAddValue72, multiplyAddValue72));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                uint productValue5 = (comparisonValue1 * 20u) + 4u;
                float4 loadedBufferValue7 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue5).x, rdLoad_zBiomeInfoBuffer(productValue5 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue5 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue5 + 3u).x));
                uint productValue6 = (comparisonValue2 * 20u) + 4u;
                float4 loadedBufferValue8 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue6).x, rdLoad_zBiomeInfoBuffer(productValue6 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue6 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue6 + 3u).x));
                uint productValue7 = (comparisonValue3 * 20u) + 4u;
                float4 loadedBufferValue9 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue7).x, rdLoad_zBiomeInfoBuffer(productValue7 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue7 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue7 + 3u).x));
                uint productValue8 = (comparisonValue4 * 20u) + 4u;
                float4 loadedBufferValue10 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue8).x, rdLoad_zBiomeInfoBuffer(productValue8 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue8 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue8 + 3u).x));
                float scalarValue2 = frac(quotientValue3);
                float scalarValue3 = frac(quotientValue4);
                float sumValue6 = 1.0f - scalarValue2;
                float sumValue8 = 1.0f - scalarValue3;
                float productValue9 = sumValue8 * sumValue6;
                float productValue13 = sumValue8 * scalarValue2;
                float productValue17 = sumValue6 * scalarValue3;
                float productValue18 = scalarValue3 * scalarValue2;
                branchMergedValue = (((productValue18 * loadedBufferValue10.x) + (productValue17 * loadedBufferValue9.x)) + (productValue13 * loadedBufferValue8.x)) + (productValue9 * loadedBufferValue7.x);
                branchMergedValue1 = (((productValue18 * loadedBufferValue10.y) + (productValue17 * loadedBufferValue9.y)) + (productValue13 * loadedBufferValue8.y)) + (productValue9 * loadedBufferValue7.y);
                branchMergedValue2 = (((productValue18 * loadedBufferValue10.z) + (productValue17 * loadedBufferValue9.z)) + (productValue13 * loadedBufferValue8.z)) + (productValue9 * loadedBufferValue7.z);
                branchMergedValue3 = (((productValue18 * loadedBufferValue10.w) + (productValue17 * loadedBufferValue9.w)) + (productValue13 * loadedBufferValue8.w)) + (productValue9 * loadedBufferValue7.w);
            }
            intermediateValue4 = branchMergedValue;
            intermediateValue5 = branchMergedValue1;
            intermediateValue6 = branchMergedValue2;
            intermediateValue7 = branchMergedValue3;
        }
        else
        {
            intermediateValue4 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.x;
            intermediateValue5 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.y;
            intermediateValue6 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.z;
            intermediateValue7 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.w;
        }
        float clampedValue1 = RD_UNIFORM_AIR_ALBEDO_EXTINCTION.w * clamp((RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.x * multiplyAddValue3) + RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.y, 0.0f, 1.0f);
        float productValue19 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.x;
        float productValue20 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.y;
        float productValue21 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.z;
        float productValue22 = (((intermediateValue7 * intermediateValue4) - productValue19) * comparisonValue) + productValue19;
        float productValue26 = (((intermediateValue7 * intermediateValue5) - productValue20) * comparisonValue) + productValue20;
        float productValue27 = (((intermediateValue7 * intermediateValue6) - productValue21) * comparisonValue) + productValue21;
        float productValue28 = ((intermediateValue7 - clampedValue1) * comparisonValue) + clampedValue1;
        float productValue29 = ((RD_UNIFORM_HENYEY_GREENSTEIN_G.y - RD_UNIFORM_HENYEY_GREENSTEIN_G.x) * comparisonValue) + RD_UNIFORM_HENYEY_GREENSTEIN_G.x;
        float nonlinearValue = sqrt(((multiplyAddValue6 * multiplyAddValue6) + (multiplyAddValue5 * multiplyAddValue5)) + (multiplyAddValue7 * multiplyAddValue7));
        float clampedValue2 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
        float productValue33 = productValue22 - (clampedValue2 * productValue22);
        float productValue38 = productValue26 - (clampedValue2 * productValue26);
        float productValue39 = productValue27 - (clampedValue2 * productValue27);
        float intermediateValue8;
        float intermediateValue9;
        if ((RD_UNIFORM_SKY_SAMPLES_CONFIG.x > 0.5f) && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w > 0.5f))
        {
            float4 sampledTextureValue = skyAmbientSamplesTexture.SampleLevel(skyAmbientSamplesSampler, float3(quotientValue, 1.0f - quotientValue1, (exp2(((RD_UNIFORM_SKY_SAMPLES_CONFIG.y > 0.5f) ? (quotientValue2 - RD_UNIFORM_SKY_SAMPLES_CONFIG.z) : quotientValue2) * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f), 0.0f);
            intermediateValue8 = sampledTextureValue.x;
            intermediateValue9 = sampledTextureValue.y;
        }
        else
        {
            intermediateValue8 = 0.0f;
            intermediateValue9 = RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y;
        }
        float productValue40 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue8;
        float productValue41 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue9;
        float productValue59 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * 0.079577468335628509521484375f;
        float productValue60 = (max((productValue41 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (productValue40 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.x), RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue33) * productValue59;
        float productValue61 = (max((productValue41 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (productValue40 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.y), RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue38) * productValue59;
        float productValue62 = (max((productValue41 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (productValue40 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.z), RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue39) * productValue59;
        float productValue30;
        float productValue31;
        float productValue32;
        if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.y == 0.0f) || (abs(intermediateValue9) > 9.9999997473787516355514526367188e-05f))
        {
            float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
            float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
            float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
            float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
            float dotProductValue = (((dot(float3((-0.0f) - (multiplyAddValue5 / nonlinearValue), (-0.0f) - (multiplyAddValue6 / nonlinearValue), (-0.0f) - (multiplyAddValue7 / nonlinearValue)), float3(inverseLengthValue * multiplyAddValue8, inverseLengthValue * multiplyAddValue9, inverseLengthValue * multiplyAddValue10)) * 2.0f) + productValue29) * productValue29) + 1.0f;
            float loadedBufferValue13 = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * ((((1.0f - (productValue29 * productValue29)) * 0.079577468335628509521484375f) / (dotProductValue * sqrt(dotProductValue))) * cascadedShadowBufferTexture.Load(int4(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z), 0u)).x);
            productValue30 = ((loadedBufferValue13 * productValue33) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x) + productValue60;
            productValue31 = ((loadedBufferValue13 * productValue38) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y) + productValue61;
            productValue32 = ((loadedBufferValue13 * productValue39) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z) + productValue62;
        }
        else
        {
            productValue30 = productValue60;
            productValue31 = productValue61;
            productValue32 = productValue62;
        }
        scatteringBufferOutTexture[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = float4(productValue30, productValue31, productValue32, productValue28 - (clampedValue2 * productValue28));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                uint productValue5 = (comparisonValue1 * 20u) + 4u;
                float4 loadedBufferValue7 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue5).x, rdLoad_zBiomeInfoBuffer(productValue5 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue5 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue5 + 3u).x));
                uint productValue6 = (comparisonValue2 * 20u) + 4u;
                float4 loadedBufferValue8 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue6).x, rdLoad_zBiomeInfoBuffer(productValue6 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue6 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue6 + 3u).x));
                uint productValue7 = (comparisonValue3 * 20u) + 4u;
                float4 loadedBufferValue9 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue7).x, rdLoad_zBiomeInfoBuffer(productValue7 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue7 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue7 + 3u).x));
                uint productValue8 = (comparisonValue4 * 20u) + 4u;
                float4 loadedBufferValue10 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue8).x, rdLoad_zBiomeInfoBuffer(productValue8 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue8 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue8 + 3u).x));
                float scalarValue2 = frac(quotientValue3);
                float scalarValue3 = frac(quotientValue4);
                float sumValue6 = 1.0f - scalarValue2;
                float sumValue8 = 1.0f - scalarValue3;
                float productValue9 = sumValue8 * sumValue6;
                float productValue13 = sumValue8 * scalarValue2;
                float productValue17 = sumValue6 * scalarValue3;
                float productValue18 = scalarValue3 * scalarValue2;
                branchMergedValue4 = (((productValue18 * loadedBufferValue10.w) + (productValue17 * loadedBufferValue9.w)) + (productValue13 * loadedBufferValue8.w)) + (productValue9 * loadedBufferValue7.w);
                branchMergedValue9 = (((productValue18 * loadedBufferValue10.x) + (productValue17 * loadedBufferValue9.x)) + (productValue13 * loadedBufferValue8.x)) + (productValue9 * loadedBufferValue7.x);
                branchMergedValue10 = (((productValue18 * loadedBufferValue10.y) + (productValue17 * loadedBufferValue9.y)) + (productValue13 * loadedBufferValue8.y)) + (productValue9 * loadedBufferValue7.y);
                branchMergedValue11 = (((productValue18 * loadedBufferValue10.z) + (productValue17 * loadedBufferValue9.z)) + (productValue13 * loadedBufferValue8.z)) + (productValue9 * loadedBufferValue7.z);
            }
            intermediateValue4 = branchMergedValue9;
            intermediateValue5 = branchMergedValue10;
            intermediateValue6 = branchMergedValue11;
            intermediateValue7 = branchMergedValue4;
        }
        else
        {
            intermediateValue4 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.x;
            intermediateValue5 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.y;
            intermediateValue6 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.z;
            intermediateValue7 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.w;
        }
        float clampedValue1 = RD_UNIFORM_AIR_ALBEDO_EXTINCTION.w * clamp((RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.x * multiplyAddValue3) + RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.y, 0.0f, 1.0f);
        float productValue19 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.x;
        float productValue20 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.y;
        float productValue21 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.z;
        float productValue22 = (((intermediateValue7 * intermediateValue4) - productValue19) * comparisonValue) + productValue19;
        float productValue26 = (((intermediateValue7 * intermediateValue5) - productValue20) * comparisonValue) + productValue20;
        float productValue27 = (((intermediateValue7 * intermediateValue6) - productValue21) * comparisonValue) + productValue21;
        float productValue28 = ((intermediateValue7 - clampedValue1) * comparisonValue) + clampedValue1;
        float productValue29 = ((RD_UNIFORM_HENYEY_GREENSTEIN_G.y - RD_UNIFORM_HENYEY_GREENSTEIN_G.x) * comparisonValue) + RD_UNIFORM_HENYEY_GREENSTEIN_G.x;
        float nonlinearValue2 = sqrt(((sumValue18 * sumValue18) + (sumValue17 * sumValue17)) + (sumValue43 * sumValue43));
        float clampedValue4 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue2 / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
        float productValue70 = productValue22 - (clampedValue4 * productValue22);
        float productValue71 = productValue26 - (clampedValue4 * productValue26);
        float productValue72 = productValue27 - (clampedValue4 * productValue27);
        float intermediateValue8;
        float intermediateValue9;
        if ((RD_UNIFORM_SKY_SAMPLES_CONFIG.x > 0.5f) && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w > 0.5f))
        {
            float4 sampledTextureValue = skyAmbientSamplesTexture.SampleLevel(skyAmbientSamplesSampler, float3(quotientValue, 1.0f - quotientValue1, (exp2(((RD_UNIFORM_SKY_SAMPLES_CONFIG.y > 0.5f) ? (quotientValue2 - RD_UNIFORM_SKY_SAMPLES_CONFIG.z) : quotientValue2) * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f), 0.0f);
            intermediateValue8 = sampledTextureValue.x;
            intermediateValue9 = sampledTextureValue.y;
        }
        else
        {
            intermediateValue8 = 0.0f;
            intermediateValue9 = RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y;
        }
        float productValue40 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue8;
        float productValue41 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue9;
        float productValue59 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * 0.079577468335628509521484375f;
        float productValue73 = (max((productValue41 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (productValue40 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.x), RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue70) * productValue59;
        float productValue74 = (max((productValue41 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (productValue40 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.y), RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue71) * productValue59;
        float productValue75 = (max((productValue41 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (productValue40 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.z), RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue72) * productValue59;
        float quotientValue8 = (-0.0f) - (sumValue17 / nonlinearValue2);
        float quotientValue9 = (-0.0f) - (sumValue18 / nonlinearValue2);
        float quotientValue10 = (-0.0f) - (sumValue43 / nonlinearValue2);
        float productValue30;
        float productValue31;
        float productValue32;
        if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.y == 0.0f) || (abs(intermediateValue9) > 9.9999997473787516355514526367188e-05f))
        {
            float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
            float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
            float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
            float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
            float dotProductValue1 = (((dot(float3(quotientValue8, quotientValue9, quotientValue10), float3(inverseLengthValue * multiplyAddValue8, inverseLengthValue * multiplyAddValue9, inverseLengthValue * multiplyAddValue10)) * 2.0f) + productValue29) * productValue29) + 1.0f;
            float loadedBufferValue31 = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * ((((1.0f - (productValue29 * productValue29)) * 0.079577468335628509521484375f) / (dotProductValue1 * sqrt(dotProductValue1))) * cascadedShadowBufferTexture.Load(int4(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z), 0u)).x);
            productValue30 = ((loadedBufferValue31 * productValue70) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x) + productValue73;
            productValue31 = ((loadedBufferValue31 * productValue71) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y) + productValue74;
            productValue32 = ((loadedBufferValue31 * productValue72) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z) + productValue75;
        }
        else
        {
            productValue30 = productValue73;
            productValue31 = productValue74;
            productValue32 = productValue75;
        }
        float productValue35;
        float productValue36;
        float productValue37;
        if ((RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.y != 0.0f) && (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f))
        {
            float sumValue44 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
            float sumValue45 = (-0.0f) - sumValue43;
            float productValue76 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue45;
            float productValue77 = productValue76 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
            float intermediateValue10;
            if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue45)
            {
                intermediateValue10 = 0.0f;
            }
            else
            {
                float branchMergedValue5;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue45)
                {
                    branchMergedValue5 = 1.0f;
                }
                else
                {
                    branchMergedValue5 = min(floor(min(max((log2(sumValue45) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                }
                intermediateValue10 = branchMergedValue5;
            }
            float quotientValue11 = min(floor(min(max((productValue77 + sumValue17) / (productValue77 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
            float quotientValue12 = min(floor(min(max((productValue76 + sumValue18) / (productValue76 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
            uint intermediateValue11;
            bool intermediateValue13;
            uint intermediateValue14;
            if ((intermediateValue10 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue12 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue11 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue10 < 0.0f) || ((quotientValue11 < 0.0f) || (quotientValue12 < 0.0f))))))
            {
                intermediateValue11 = intermediateValue12;
                intermediateValue13 = false;
                intermediateValue14 = 0u;
            }
            else
            {
                uint scalarValue10 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                uint productValue78 = uint(int(((quotientValue12 + (intermediateValue10 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue11)) * scalarValue10;
                intermediateValue11 = productValue78;
                intermediateValue13 = true;
                intermediateValue14 = productValue78 + scalarValue10;
            }
            float intermediateValue16;
            float intermediateValue18;
            float intermediateValue20;
            if (intermediateValue13 && (int(intermediateValue11) < int(intermediateValue14)))
            {
                float intermediateValue26;
                float intermediateValue27;
                float intermediateValue28;
                float intermediateValue30;
                float intermediateValue31;
                float intermediateValue32;
                float intermediateValue33;
                float intermediateValue17;
                float intermediateValue19;
                float intermediateValue21;
                float scalarValue11 = 0.0f;
                float scalarValue12 = 0.0f;
                float scalarValue13 = 0.0f;
                uint scalarValue14 = intermediateValue11;
                uint loadedBufferValue12;
                for (;;)
                {
                    loadedBufferValue12 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue14).x)));
                    if (int(loadedBufferValue12) < int(0u))
                    {
                        intermediateValue17 = scalarValue11;
                        intermediateValue19 = scalarValue12;
                        intermediateValue21 = scalarValue13;
                        break;
                    }
                    else
                    {
                        uint productValue79 = loadedBufferValue12 * 32u;
                        float4 loadedBufferValue32 = asfloat(uint4(rdLoad_zLights(productValue79).x, rdLoad_zLights(productValue79 + 1u).x, rdLoad_zLights(productValue79 + 2u).x, rdLoad_zLights(productValue79 + 3u).x));
                        intermediateValue26 = loadedBufferValue32.x;
                        intermediateValue27 = loadedBufferValue32.y;
                        intermediateValue28 = loadedBufferValue32.z;
                        float sumValue46 = intermediateValue26 - multiplyAddValue2;
                        float sumValue50 = intermediateValue27 - multiplyAddValue3;
                        float sumValue51 = intermediateValue28 - multiplyAddValue4;
                        float productValue43;
                        if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                        {
                            float sumValue52 = (abs(sumValue50) + abs(sumValue46)) + abs(sumValue51);
                            productValue43 = sumValue52 * sumValue52;
                        }
                        else
                        {
                            productValue43 = dot(float3(sumValue46, sumValue50, sumValue51), float3(sumValue46, sumValue50, sumValue51));
                        }
                        float scalarValue15 = loadedBufferValue32.w;
                        float productValue80 = scalarValue15 * scalarValue15;
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        if (!(productValue43 >= productValue80))
                        {
                            float intermediateValue34;
                            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                            {
                                uint productValue81 = (loadedBufferValue12 * 32u) + 8u;
                                float4 loadedBufferValue33 = asfloat(uint4(rdLoad_zLights(productValue81).x, rdLoad_zLights(productValue81 + 1u).x, rdLoad_zLights(productValue81 + 2u).x, rdLoad_zLights(productValue81 + 3u).x));
                                uint productValue82 = (loadedBufferValue12 * 32u) + 12u;
                                float4 loadedBufferValue35 = asfloat(uint4(rdLoad_zLights(productValue82).x, rdLoad_zLights(productValue82 + 1u).x, rdLoad_zLights(productValue82 + 2u).x, rdLoad_zLights(productValue82 + 3u).x));
                                uint productValue83 = (loadedBufferValue12 * 32u) + 16u;
                                float4 loadedBufferValue36 = asfloat(uint4(rdLoad_zLights(productValue83).x, rdLoad_zLights(productValue83 + 1u).x, rdLoad_zLights(productValue83 + 2u).x, rdLoad_zLights(productValue83 + 3u).x));
                                uint productValue84 = (loadedBufferValue12 * 32u) + 20u;
                                float4 loadedBufferValue37 = asfloat(uint4(rdLoad_zLights(productValue84).x, rdLoad_zLights(productValue84 + 1u).x, rdLoad_zLights(productValue84 + 2u).x, rdLoad_zLights(productValue84 + 3u).x));
                                uint productValue85 = (loadedBufferValue12 * 32u) + 24u;
                                float4 loadedBufferValue38 = asfloat(uint4(rdLoad_zLights(productValue85).x, rdLoad_zLights(productValue85 + 1u).x, rdLoad_zLights(productValue85 + 2u).x, rdLoad_zLights(productValue85 + 3u).x));
                                uint productValue86 = (loadedBufferValue12 * 32u) + 28u;
                                float4 loadedBufferValue39 = asfloat(uint4(rdLoad_zLights(productValue86).x, rdLoad_zLights(productValue86 + 1u).x, rdLoad_zLights(productValue86 + 2u).x, rdLoad_zLights(productValue86 + 3u).x));
                                float sumValue53 = multiplyAddValue2 - intermediateValue26;
                                float sumValue54 = multiplyAddValue3 - intermediateValue27;
                                float sumValue55 = multiplyAddValue4 - intermediateValue28;
                                float scalarValue16 = abs(sumValue53);
                                float scalarValue17 = abs(sumValue54);
                                float scalarValue18 = abs(sumValue55);
                                uint comparisonValue5;
                                if ((scalarValue16 >= scalarValue17) && (scalarValue16 >= scalarValue18))
                                {
                                    comparisonValue5 = uint(!(sumValue53 >= 0.0f));
                                }
                                else
                                {
                                    uint branchMergedValue7;
                                    if (!(scalarValue17 >= scalarValue18))
                                    {
                                        branchMergedValue7 = (sumValue55 >= 0.0f) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue7 = (sumValue54 >= 0.0f) ? 2u : 3u;
                                    }
                                    comparisonValue5 = branchMergedValue7;
                                }
                                float sumValue56 = (-0.0f) - sumValue53;
                                float intermediateValue38;
                                float intermediateValue39;
                                float intermediateValue40;
                                float intermediateValue41;
                                float sumValue22;
                                float intermediateValue42;
                                float intermediateValue43;
                                if (comparisonValue5 == 1u)
                                {
                                    intermediateValue38 = loadedBufferValue35.x;
                                    intermediateValue39 = loadedBufferValue35.y;
                                    intermediateValue40 = loadedBufferValue35.z;
                                    intermediateValue41 = loadedBufferValue35.w;
                                    sumValue22 = (-0.0f) - sumValue55;
                                    intermediateValue42 = sumValue54;
                                    intermediateValue43 = sumValue53;
                                }
                                else
                                {
                                    float branchMergedValue8;
                                    float branchMergedValue12;
                                    float branchMergedValue13;
                                    float branchMergedValue14;
                                    float branchMergedValue15;
                                    float branchMergedValue16;
                                    float branchMergedValue17;
                                    if (comparisonValue5 == 2u)
                                    {
                                        branchMergedValue8 = sumValue56;
                                        branchMergedValue12 = (-0.0f) - sumValue55;
                                        branchMergedValue13 = (-0.0f) - sumValue54;
                                        branchMergedValue14 = loadedBufferValue36.x;
                                        branchMergedValue15 = loadedBufferValue36.y;
                                        branchMergedValue16 = loadedBufferValue36.z;
                                        branchMergedValue17 = loadedBufferValue36.w;
                                    }
                                    else
                                    {
                                        float branchMergedValue18;
                                        float branchMergedValue19;
                                        float branchMergedValue20;
                                        float branchMergedValue21;
                                        float branchMergedValue22;
                                        float branchMergedValue23;
                                        float branchMergedValue24;
                                        if (comparisonValue5 == 3u)
                                        {
                                            branchMergedValue18 = sumValue56;
                                            branchMergedValue19 = sumValue55;
                                            branchMergedValue20 = sumValue54;
                                            branchMergedValue21 = loadedBufferValue37.x;
                                            branchMergedValue22 = loadedBufferValue37.y;
                                            branchMergedValue23 = loadedBufferValue37.z;
                                            branchMergedValue24 = loadedBufferValue37.w;
                                        }
                                        else
                                        {
                                            float branchMergedValue25;
                                            float branchMergedValue26;
                                            float branchMergedValue27;
                                            float branchMergedValue28;
                                            float branchMergedValue29;
                                            float branchMergedValue30;
                                            float branchMergedValue31;
                                            if (comparisonValue5 == 4u)
                                            {
                                                branchMergedValue25 = sumValue56;
                                                branchMergedValue26 = sumValue54;
                                                branchMergedValue27 = (-0.0f) - sumValue55;
                                                branchMergedValue28 = loadedBufferValue38.x;
                                                branchMergedValue29 = loadedBufferValue38.y;
                                                branchMergedValue30 = loadedBufferValue38.z;
                                                branchMergedValue31 = loadedBufferValue38.w;
                                            }
                                            else
                                            {
                                                bool comparisonValue27 = comparisonValue5 == 5u;
                                                branchMergedValue25 = comparisonValue27 ? sumValue53 : sumValue55;
                                                branchMergedValue26 = sumValue54;
                                                branchMergedValue27 = comparisonValue27 ? sumValue55 : sumValue56;
                                                branchMergedValue28 = comparisonValue27 ? loadedBufferValue39.x : loadedBufferValue33.x;
                                                branchMergedValue29 = comparisonValue27 ? loadedBufferValue39.y : loadedBufferValue33.y;
                                                branchMergedValue30 = comparisonValue27 ? loadedBufferValue39.z : loadedBufferValue33.z;
                                                branchMergedValue31 = comparisonValue27 ? loadedBufferValue39.w : loadedBufferValue33.w;
                                            }
                                            branchMergedValue18 = branchMergedValue25;
                                            branchMergedValue19 = branchMergedValue26;
                                            branchMergedValue20 = branchMergedValue27;
                                            branchMergedValue21 = branchMergedValue28;
                                            branchMergedValue22 = branchMergedValue29;
                                            branchMergedValue23 = branchMergedValue30;
                                            branchMergedValue24 = branchMergedValue31;
                                        }
                                        branchMergedValue8 = branchMergedValue18;
                                        branchMergedValue12 = branchMergedValue19;
                                        branchMergedValue13 = branchMergedValue20;
                                        branchMergedValue14 = branchMergedValue21;
                                        branchMergedValue15 = branchMergedValue22;
                                        branchMergedValue16 = branchMergedValue23;
                                        branchMergedValue17 = branchMergedValue24;
                                    }
                                    intermediateValue38 = branchMergedValue14;
                                    intermediateValue39 = branchMergedValue15;
                                    intermediateValue40 = branchMergedValue16;
                                    intermediateValue41 = branchMergedValue17;
                                    sumValue22 = branchMergedValue8;
                                    intermediateValue42 = branchMergedValue12;
                                    intermediateValue43 = branchMergedValue13;
                                }
                                float branchMergedValue6;
                                if ((intermediateValue40 == 0.0f) && (intermediateValue41 == 0.0f))
                                {
                                    branchMergedValue6 = 0.0f;
                                }
                                else
                                {
                                    float multiplyAddValue63 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue43, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue42, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue22)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                    float quotientValue13 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                    float quotientValue14 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                    float sumValue57 = intermediateValue40 - intermediateValue38;
                                    float sumValue59 = intermediateValue41 - intermediateValue39;
                                    float productValue87 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue57;
                                    float productValue88 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue59;
                                    float sampledTextureValue2 = float(pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(productValue87 * ((((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue43, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue42, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue22)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue63) * 0.5f) + 0.5f)) + 0.5f) / productValue87) * sumValue57) + intermediateValue38, quotientValue13 + intermediateValue38), intermediateValue40 - quotientValue13), min(max((((floor(productValue88 * (0.5f - (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue43, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue42, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue22)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue63) * 0.5f))) + 0.5f) / productValue88) * sumValue59) + intermediateValue39, quotientValue14 + intermediateValue39), intermediateValue41 - quotientValue14)), 0.0f).x >= ((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue43, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue42, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue22)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) / multiplyAddValue63));
                                    branchMergedValue6 = sampledTextureValue2;
                                }
                                intermediateValue34 = branchMergedValue6;
                            }
                            else
                            {
                                intermediateValue34 = 1.0f;
                            }
                            uint productValue89 = (loadedBufferValue12 * 32u) + 4u;
                            float4 loadedBufferValue40 = asfloat(uint4(rdLoad_zLights(productValue89).x, rdLoad_zLights(productValue89 + 1u).x, rdLoad_zLights(productValue89 + 2u).x, rdLoad_zLights(productValue89 + 3u).x));
                            float quotientValue15 = productValue43 / (productValue80 + 9.9999997473787516355514526367188e-05f);
                            float clampedValue6 = clamp(1.0f - (quotientValue15 * quotientValue15), 0.0f, 1.0f);
                            float quotientValue16 = (clampedValue6 * clampedValue6) * (1.0f / max(productValue43, 0.100000001490116119384765625f));
                            float clampedValue5;
                            if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                            {
                                float clampedValue7 = clamp(((1.0f - quotientValue16) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                clampedValue5 = clamp((((clampedValue7 * clampedValue7) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue7 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue16;
                            }
                            else
                            {
                                clampedValue5 = quotientValue16;
                            }
                            float productValue90 = clampedValue5 * loadedBufferValue40.w;
                            branchMergedValue = productValue90 * loadedBufferValue40.y;
                            branchMergedValue1 = productValue90 * loadedBufferValue40.x;
                            branchMergedValue2 = intermediateValue34;
                            branchMergedValue3 = productValue90 * loadedBufferValue40.z;
                        }
                        else
                        {
                            branchMergedValue = 0.0f;
                            branchMergedValue1 = 0.0f;
                            branchMergedValue2 = 1.0f;
                            branchMergedValue3 = 0.0f;
                        }
                        intermediateValue31 = branchMergedValue;
                        intermediateValue30 = branchMergedValue1;
                        intermediateValue33 = branchMergedValue2;
                        intermediateValue32 = branchMergedValue3;
                        float multiplyAddValue64 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, intermediateValue28, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, intermediateValue27, intermediateValue26 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) - multiplyAddValue60;
                        float multiplyAddValue65 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, intermediateValue28, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, intermediateValue27, intermediateValue26 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) - multiplyAddValue61;
                        float multiplyAddValue66 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, intermediateValue28, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, intermediateValue27, intermediateValue26 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) - multiplyAddValue62;
                        float inverseLengthValue2 = rsqrt(dot(float3(multiplyAddValue64, multiplyAddValue65, multiplyAddValue66), float3(multiplyAddValue64, multiplyAddValue65, multiplyAddValue66)));
                        float dotProductValue2 = (((dot(float3(quotientValue8, quotientValue9, quotientValue10), float3(inverseLengthValue2 * multiplyAddValue64, inverseLengthValue2 * multiplyAddValue65, inverseLengthValue2 * multiplyAddValue66)) * 2.0f) + productValue29) * productValue29) + 1.0f;
                        float nonlinearValue3 = (((1.0f - (productValue29 * productValue29)) * 0.079577468335628509521484375f) / (dotProductValue2 * sqrt(dotProductValue2))) * intermediateValue33;
                        float productValue91 = ((intermediateValue30 * productValue70) * nonlinearValue3) + scalarValue11;
                        float productValue92 = ((intermediateValue31 * productValue71) * nonlinearValue3) + scalarValue12;
                        float productValue93 = ((intermediateValue32 * productValue72) * nonlinearValue3) + scalarValue13;
                        uint sumValue60 = scalarValue14 + 1u;
                        if (int(sumValue60) < int(intermediateValue14))
                        {
                            scalarValue11 = productValue91;
                            scalarValue12 = productValue92;
                            scalarValue13 = productValue93;
                            scalarValue14 = sumValue60;
                            continue;
                        }
                        else
                        {
                            intermediateValue17 = productValue91;
                            intermediateValue19 = productValue92;
                            intermediateValue21 = productValue93;
                            break;
                        }
                    }
                }
                intermediateValue16 = intermediateValue17;
                intermediateValue18 = intermediateValue19;
                intermediateValue20 = intermediateValue21;
            }
            else
            {
                intermediateValue16 = 0.0f;
                intermediateValue18 = 0.0f;
                intermediateValue20 = 0.0f;
            }
            productValue35 = (intermediateValue16 * sumValue44) + productValue30;
            productValue36 = (intermediateValue18 * sumValue44) + productValue31;
            productValue37 = (intermediateValue20 * sumValue44) + productValue32;
        }
        else
        {
            productValue35 = productValue30;
            productValue36 = productValue31;
            productValue37 = productValue32;
        }
        scatteringBufferOutTexture[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = float4(productValue35, productValue36, productValue37, productValue28 - (clampedValue4 * productValue28));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                uint productValue5 = (comparisonValue1 * 20u) + 4u;
                float4 loadedBufferValue7 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue5).x, rdLoad_zBiomeInfoBuffer(productValue5 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue5 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue5 + 3u).x));
                uint productValue6 = (comparisonValue2 * 20u) + 4u;
                float4 loadedBufferValue8 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue6).x, rdLoad_zBiomeInfoBuffer(productValue6 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue6 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue6 + 3u).x));
                uint productValue7 = (comparisonValue3 * 20u) + 4u;
                float4 loadedBufferValue9 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue7).x, rdLoad_zBiomeInfoBuffer(productValue7 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue7 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue7 + 3u).x));
                uint productValue8 = (comparisonValue4 * 20u) + 4u;
                float4 loadedBufferValue10 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue8).x, rdLoad_zBiomeInfoBuffer(productValue8 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue8 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue8 + 3u).x));
                float scalarValue2 = frac(quotientValue3);
                float scalarValue3 = frac(quotientValue4);
                float sumValue6 = 1.0f - scalarValue2;
                float sumValue8 = 1.0f - scalarValue3;
                float productValue9 = sumValue8 * sumValue6;
                float productValue13 = sumValue8 * scalarValue2;
                float productValue17 = sumValue6 * scalarValue3;
                float productValue18 = scalarValue3 * scalarValue2;
                branchMergedValue = (((productValue18 * loadedBufferValue10.y) + (productValue17 * loadedBufferValue9.y)) + (productValue13 * loadedBufferValue8.y)) + (productValue9 * loadedBufferValue7.y);
                branchMergedValue2 = (((productValue18 * loadedBufferValue10.x) + (productValue17 * loadedBufferValue9.x)) + (productValue13 * loadedBufferValue8.x)) + (productValue9 * loadedBufferValue7.x);
                branchMergedValue3 = (((productValue18 * loadedBufferValue10.w) + (productValue17 * loadedBufferValue9.w)) + (productValue13 * loadedBufferValue8.w)) + (productValue9 * loadedBufferValue7.w);
                branchMergedValue4 = (((productValue18 * loadedBufferValue10.z) + (productValue17 * loadedBufferValue9.z)) + (productValue13 * loadedBufferValue8.z)) + (productValue9 * loadedBufferValue7.z);
            }
            intermediateValue7 = branchMergedValue2;
            intermediateValue8 = branchMergedValue;
            intermediateValue9 = branchMergedValue4;
            intermediateValue10 = branchMergedValue3;
        }
        else
        {
            intermediateValue7 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.x;
            intermediateValue8 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.y;
            intermediateValue9 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.z;
            intermediateValue10 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.w;
        }
        float clampedValue1 = RD_UNIFORM_AIR_ALBEDO_EXTINCTION.w * clamp((RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.x * multiplyAddValue3) + RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.y, 0.0f, 1.0f);
        float productValue19 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.x;
        float productValue20 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.y;
        float productValue21 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.z;
        float productValue113 = (((intermediateValue10 * intermediateValue7) - productValue19) * comparisonValue) + productValue19;
        float productValue114 = (((intermediateValue10 * intermediateValue8) - productValue20) * comparisonValue) + productValue20;
        float productValue115 = (((intermediateValue10 * intermediateValue9) - productValue21) * comparisonValue) + productValue21;
        float productValue116 = ((intermediateValue10 - clampedValue1) * comparisonValue) + clampedValue1;
        float productValue29 = ((RD_UNIFORM_HENYEY_GREENSTEIN_G.y - RD_UNIFORM_HENYEY_GREENSTEIN_G.x) * comparisonValue) + RD_UNIFORM_HENYEY_GREENSTEIN_G.x;
        float nonlinearValue = sqrt(((multiplyAddValue6 * multiplyAddValue6) + (multiplyAddValue5 * multiplyAddValue5)) + (multiplyAddValue7 * multiplyAddValue7));
        float clampedValue2 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
        float productValue117 = productValue113 - (clampedValue2 * productValue113);
        float productValue118 = productValue114 - (clampedValue2 * productValue114);
        float productValue119 = productValue115 - (clampedValue2 * productValue115);
        float intermediateValue11;
        float intermediateValue12;
        if ((RD_UNIFORM_SKY_SAMPLES_CONFIG.x > 0.5f) && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w > 0.5f))
        {
            float4 sampledTextureValue = skyAmbientSamplesTexture.SampleLevel(skyAmbientSamplesSampler, float3(quotientValue, 1.0f - quotientValue1, (exp2(((RD_UNIFORM_SKY_SAMPLES_CONFIG.y > 0.5f) ? (quotientValue2 - RD_UNIFORM_SKY_SAMPLES_CONFIG.z) : quotientValue2) * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f), 0.0f);
            intermediateValue11 = sampledTextureValue.x;
            intermediateValue12 = sampledTextureValue.y;
        }
        else
        {
            intermediateValue11 = 0.0f;
            intermediateValue12 = RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y;
        }
        float productValue120 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue11;
        float productValue34;
        float productValue35;
        float productValue36;
        if (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f)
        {
            float sumValue75 = (multiplyAddValue2 - RD_UNIFORM_WORLD_ORIGIN.x) + (-0.5f);
            float sumValue76 = (multiplyAddValue3 - RD_UNIFORM_WORLD_ORIGIN.y) + (-0.5f);
            float sumValue77 = (multiplyAddValue4 - RD_UNIFORM_WORLD_ORIGIN.z) + (-0.5f);
            float productValue121 = floor(sumValue75 * 0.0625f) * 16.0f;
            float productValue122 = floor(sumValue76 * 0.0625f) * 16.0f;
            float productValue123 = floor(sumValue77 * 0.0625f) * 16.0f;
            uint productValue124 = uint(int(floor(float(int(uint(int(floor(sumValue75))))) * 0.0625f)));
            uint productValue125 = uint(int(floor(float(int(uint(int(floor(sumValue76))))) * 0.0625f)));
            uint productValue126 = uint(int(floor(float(int(uint(int(floor(sumValue77))))) * 0.0625f)));
            float sumValue78 = sumValue75 - productValue121;
            float sumValue79 = sumValue76 - productValue122;
            float sumValue80 = sumValue77 - productValue123;
            uint bitwiseValue4 = (productValue125 << 16u) | (productValue124 & 65535u);
            uint bitwiseValue8 = productValue126 & 65535u;
            uint productValue127 = productValue124 * 1540483477u;
            uint productValue128 = productValue125 * 1540483477u;
            uint productValue129 = productValue126 * 1540483477u;
            uint bitwiseValue9 = ((((((((productValue127 >> 24u) ^ productValue127) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue128 >> 24u) ^ productValue128) * 1540483477u)) * 1540483477u) ^ (((productValue129 >> 24u) ^ productValue129) * 1540483477u)) * 1540483477u;
            uint bitwiseValue10 = ((bitwiseValue9 >> 13u) ^ bitwiseValue9) * 1540483477u;
            uint bitwiseValue12 = (bitwiseValue10 >> 15u) ^ bitwiseValue10;
            uint bitwiseValue14 = bitwiseValue12 >> 16u;
            uint bitwiseValue16 = bitwiseValue12 & 65535u;
            uint comparisonValue66 = uint(bitwiseValue16 == bitwiseValue14) | (bitwiseValue16 ^ bitwiseValue14);
            uint sumValue81 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) + 4294967295u;
            bool intermediateValue16;
            uint scalarValue34 = comparisonValue66;
            uint scalarValue35 = 0u;
            uint scalarValue36 = 0u;
            uint loadedBufferValue11;
            uint bitwiseValue7;
            for (;;)
            {
                bitwiseValue7 = scalarValue34 & sumValue81;
                uint loadedBufferValue62 = rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 2u).x & 65535u;
                bool loadedBufferValue63 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue8) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue4) && (loadedBufferValue62 == comparisonValue66));
                loadedBufferValue11 = loadedBufferValue63 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue35;
                if ((loadedBufferValue62 == 0u) || loadedBufferValue63)
                {
                    intermediateValue16 = loadedBufferValue63;
                    break;
                }
                else
                {
                    uint sumValue82 = scalarValue36 + 1u;
                    if (int(sumValue82) < int(8u))
                    {
                        scalarValue34 = bitwiseValue7 + 1u;
                        scalarValue35 = loadedBufferValue11;
                        scalarValue36 = sumValue82;
                        continue;
                    }
                    else
                    {
                        intermediateValue16 = false;
                        break;
                    }
                }
            }
            uint bitwiseValue17 = loadedBufferValue11 >> 2u;
            float productValue51;
            float productValue52;
            float productValue53;
            if (intermediateValue16)
            {
                float intermediateValue42;
                float intermediateValue43;
                float intermediateValue44;
                float intermediateValue45;
                float intermediateValue47;
                float intermediateValue49;
                float intermediateValue51;
                float intermediateValue53;
                float intermediateValue55;
                float intermediateValue57;
                float intermediateValue58;
                float intermediateValue59;
                float intermediateValue17;
                float intermediateValue18;
                float intermediateValue19;
                uint intermediateValue20;
                uint intermediateValue21;
                uint intermediateValue22;
                float intermediateValue25;
                float sumValue19;
                float sumValue20;
                float sumValue21;
                float sumValue22;
                float sumValue23;
                float sumValue24;
                bool comparisonValue7;
                uint productValue45;
                uint productValue46;
                uint productValue47;
                uint productValue48;
                uint productValue49;
                uint productValue50;
                for (;;)
                {
                    intermediateValue17 = floor(sumValue78);
                    intermediateValue18 = floor(sumValue79);
                    intermediateValue19 = floor(sumValue80);
                    float sumValue83 = sumValue78 - intermediateValue17;
                    float sumValue84 = sumValue79 - intermediateValue18;
                    float sumValue85 = sumValue80 - intermediateValue19;
                    uint comparisonValue67 = ((uint(sumValue84 >= sumValue85) << 1u) | uint(sumValue83 >= sumValue84)) | (uint(sumValue83 >= sumValue85) << 2u);
                    intermediateValue20 = uint(intermediateValue17);
                    intermediateValue21 = uint(intermediateValue18);
                    intermediateValue22 = uint(intermediateValue19);
                    float scalarValue37 = min(sumValue83, sumValue84);
                    float scalarValue38 = max(sumValue83, sumValue84);
                    intermediateValue25 = min(scalarValue37, sumValue85);
                    float scalarValue39 = max(scalarValue38, sumValue85);
                    float scalarValue40 = max(min(scalarValue38, sumValue85), scalarValue37);
                    sumValue19 = 1.0f - scalarValue39;
                    sumValue20 = scalarValue39 - scalarValue40;
                    sumValue21 = scalarValue40 - intermediateValue25;
                    sumValue22 = intermediateValue17 + 1.0f;
                    sumValue23 = intermediateValue18 + 1.0f;
                    sumValue24 = intermediateValue19 + 1.0f;
                    comparisonValue7 = (((intermediateValue17 >= 0.0f) && (intermediateValue18 >= 0.0f)) && (intermediateValue19 >= 0.0f)) && (((sumValue22 < 16.0f) && (sumValue23 < 16.0f)) && (sumValue24 < 16.0f));
                    productValue45 = 0u + (comparisonValue67 * 3u);
                    productValue46 = 1u + (comparisonValue67 * 3u);
                    productValue47 = 2u + (comparisonValue67 * 3u);
                    productValue48 = 0u + (comparisonValue67 * 3u);
                    productValue49 = 1u + (comparisonValue67 * 3u);
                    productValue50 = 2u + (comparisonValue67 * 3u);
                    if (comparisonValue7)
                    {
                        uint bitwiseValue18 = intermediateValue22 << 4u;
                        uint sumValue86 = intermediateValue21 + bitwiseValue17;
                        uint bitwiseValue19 = sumValue86 + (intermediateValue20 << 8u);
                        uint4 loadedBufferValue64 = rdLoad_voxelBuffer(bitwiseValue19 + bitwiseValue18);
                        uint scalarValue41 = loadedBufferValue64.x;
                        float bitwiseValue11;
                        float intermediateValue29;
                        float intermediateValue30;
                        if (scalarValue41 == 0u)
                        {
                            bitwiseValue11 = 0.0f;
                            intermediateValue29 = 0.0f;
                            intermediateValue30 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue20 = float(scalarValue41 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue11 = bitwiseValue20 * float(scalarValue41 & 255u);
                            intermediateValue29 = bitwiseValue20 * float((scalarValue41 >> 8u) & 255u);
                            intermediateValue30 = bitwiseValue20 * float((scalarValue41 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue65 = rdLoad_voxelBuffer(((intermediateValue1[productValue46] + sumValue86) + ((intermediateValue1[productValue45] + intermediateValue20) << 8u)) + ((intermediateValue1[productValue47] + intermediateValue22) << 4u));
                        uint scalarValue42 = loadedBufferValue65.x;
                        float bitwiseValue13;
                        float intermediateValue32;
                        float intermediateValue33;
                        if (scalarValue42 == 0u)
                        {
                            bitwiseValue13 = 0.0f;
                            intermediateValue32 = 0.0f;
                            intermediateValue33 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue21 = float(scalarValue42 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue13 = bitwiseValue21 * float(scalarValue42 & 255u);
                            intermediateValue32 = bitwiseValue21 * float((scalarValue42 >> 8u) & 255u);
                            intermediateValue33 = bitwiseValue21 * float((scalarValue42 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue66 = rdLoad_voxelBuffer(((intermediateValue2[productValue49] + sumValue86) + ((intermediateValue2[productValue48] + intermediateValue20) << 8u)) + ((intermediateValue2[productValue50] + intermediateValue22) << 4u));
                        uint scalarValue43 = loadedBufferValue66.x;
                        float bitwiseValue15;
                        float intermediateValue39;
                        float intermediateValue40;
                        if (scalarValue43 == 0u)
                        {
                            bitwiseValue15 = 0.0f;
                            intermediateValue39 = 0.0f;
                            intermediateValue40 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue22 = float(scalarValue43 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue15 = bitwiseValue22 * float(scalarValue43 & 255u);
                            intermediateValue39 = bitwiseValue22 * float((scalarValue43 >> 8u) & 255u);
                            intermediateValue40 = bitwiseValue22 * float((scalarValue43 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue67 = rdLoad_voxelBuffer((bitwiseValue19 + 273u) + bitwiseValue18);
                        uint scalarValue44 = loadedBufferValue67.x;
                        float branchMergedValue1;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        float branchMergedValue7;
                        float branchMergedValue8;
                        float branchMergedValue9;
                        float branchMergedValue10;
                        float branchMergedValue11;
                        float branchMergedValue12;
                        float branchMergedValue13;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (scalarValue44 == 0u)
                        {
                            branchMergedValue1 = 0.0f;
                            branchMergedValue5 = 0.0f;
                            branchMergedValue6 = 0.0f;
                            branchMergedValue7 = intermediateValue40;
                            branchMergedValue8 = intermediateValue39;
                            branchMergedValue9 = bitwiseValue15;
                            branchMergedValue10 = intermediateValue33;
                            branchMergedValue11 = intermediateValue32;
                            branchMergedValue12 = intermediateValue30;
                            branchMergedValue13 = intermediateValue29;
                            branchMergedValue14 = bitwiseValue11;
                            branchMergedValue15 = bitwiseValue13;
                        }
                        else
                        {
                            float bitwiseValue23 = float(scalarValue44 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            branchMergedValue1 = bitwiseValue23 * float((scalarValue44 >> 8u) & 255u);
                            branchMergedValue5 = bitwiseValue23 * float(scalarValue44 & 255u);
                            branchMergedValue6 = bitwiseValue23 * float((scalarValue44 >> 16u) & 255u);
                            branchMergedValue7 = intermediateValue40;
                            branchMergedValue8 = intermediateValue39;
                            branchMergedValue9 = bitwiseValue15;
                            branchMergedValue10 = intermediateValue33;
                            branchMergedValue11 = intermediateValue32;
                            branchMergedValue12 = intermediateValue30;
                            branchMergedValue13 = intermediateValue29;
                            branchMergedValue14 = bitwiseValue11;
                            branchMergedValue15 = bitwiseValue13;
                        }
                        intermediateValue42 = branchMergedValue14;
                        intermediateValue43 = branchMergedValue13;
                        intermediateValue44 = branchMergedValue12;
                        intermediateValue45 = branchMergedValue15;
                        intermediateValue47 = branchMergedValue11;
                        intermediateValue49 = branchMergedValue10;
                        intermediateValue51 = branchMergedValue9;
                        intermediateValue53 = branchMergedValue8;
                        intermediateValue55 = branchMergedValue7;
                        intermediateValue57 = branchMergedValue5;
                        intermediateValue58 = branchMergedValue1;
                        intermediateValue59 = branchMergedValue6;
                        break;
                    }
                    else
                    {
                        float intermediateValue35;
                        float intermediateValue36;
                        float intermediateValue37;
                        float sumValue26;
                        float sumValue27;
                        float sumValue28;
                        float sumValue29;
                        float sumValue30;
                        float sumValue31;
                        float sumValue32;
                        float sumValue33;
                        float sumValue34;
                        uint comparisonValue9;
                        bool comparisonValue10;
                        for (;;)
                        {
                            sumValue26 = float(intermediateValue1[productValue45]) + intermediateValue17;
                            sumValue27 = float(intermediateValue1[productValue46]) + intermediateValue18;
                            sumValue28 = float(intermediateValue1[productValue47]) + intermediateValue19;
                            sumValue29 = float(intermediateValue2[productValue48]) + intermediateValue17;
                            sumValue30 = float(intermediateValue2[productValue49]) + intermediateValue18;
                            sumValue31 = float(intermediateValue2[productValue50]) + intermediateValue19;
                            sumValue32 = intermediateValue17 + productValue121;
                            sumValue33 = intermediateValue18 + productValue122;
                            sumValue34 = intermediateValue19 + productValue123;
                            uint comparisonValue68 = ((((uint(intermediateValue17 >= 16.0f) << 1u) | uint(intermediateValue17 < 0.0f)) | (uint(intermediateValue18 < 0.0f) << 2u)) | (uint(intermediateValue18 >= 16.0f) << 3u)) | (uint(intermediateValue19 < 0.0f) << 4u);
                            comparisonValue9 = intermediateValue[comparisonValue68 | (uint(intermediateValue19 >= 16.0f) << 5u)];
                            comparisonValue10 = ((((comparisonValue68 | (uint(intermediateValue19 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue68 & 31u))) == 0u;
                            uint loadedBufferValue18;
                            if (comparisonValue10)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue17 + 4096u).x & (1u << (comparisonValue9 & 31u))) == 0u)
                                {
                                    intermediateValue35 = 0.0f;
                                    intermediateValue36 = 0.0f;
                                    intermediateValue37 = 0.0f;
                                    break;
                                }
                                loadedBufferValue18 = ((((uint(sumValue32 - (floor(sumValue32 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue33 - (floor(sumValue33 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue34 - (floor(sumValue34 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue17 + 4097u) + comparisonValue9).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue18 = ((((intermediateValue20 << 8u) & 3840u) | (intermediateValue21 & 15u)) | ((intermediateValue22 << 4u) & 240u)) + bitwiseValue17;
                            }
                            uint4 loadedBufferValue68 = rdLoad_voxelBuffer(loadedBufferValue18);
                            uint scalarValue45 = loadedBufferValue68.x;
                            if (scalarValue45 == 0u)
                            {
                                intermediateValue35 = 0.0f;
                                intermediateValue36 = 0.0f;
                                intermediateValue37 = 0.0f;
                                break;
                            }
                            float bitwiseValue24 = float(scalarValue45 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue35 = bitwiseValue24 * float(scalarValue45 & 255u);
                            intermediateValue36 = bitwiseValue24 * float((scalarValue45 >> 8u) & 255u);
                            intermediateValue37 = bitwiseValue24 * float((scalarValue45 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue46;
                        float intermediateValue48;
                        float intermediateValue50;
                        float sumValue35;
                        float sumValue36;
                        float sumValue37;
                        uint comparisonValue12;
                        bool comparisonValue13;
                        for (;;)
                        {
                            sumValue35 = sumValue26 + productValue121;
                            sumValue36 = sumValue27 + productValue122;
                            sumValue37 = sumValue28 + productValue123;
                            uint comparisonValue69 = ((((uint(sumValue26 >= 16.0f) << 1u) | uint(sumValue26 < 0.0f)) | (uint(sumValue27 < 0.0f) << 2u)) | (uint(sumValue27 >= 16.0f) << 3u)) | (uint(sumValue28 < 0.0f) << 4u);
                            comparisonValue12 = intermediateValue[comparisonValue69 | (uint(sumValue28 >= 16.0f) << 5u)];
                            comparisonValue13 = ((((comparisonValue69 | (uint(sumValue28 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue69 & 31u))) == 0u;
                            uint loadedBufferValue21;
                            if (comparisonValue13)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue17 + 4096u).x & (1u << (comparisonValue12 & 31u))) == 0u)
                                {
                                    intermediateValue46 = 0.0f;
                                    intermediateValue48 = 0.0f;
                                    intermediateValue50 = 0.0f;
                                    break;
                                }
                                loadedBufferValue21 = ((((uint(sumValue35 - (floor(sumValue35 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue36 - (floor(sumValue36 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue37 - (floor(sumValue37 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue17 + 4097u) + comparisonValue12).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue21 = ((((uint(sumValue26) << 8u) & 3840u) | (uint(sumValue27) & 15u)) | ((uint(sumValue28) << 4u) & 240u)) + bitwiseValue17;
                            }
                            uint4 loadedBufferValue69 = rdLoad_voxelBuffer(loadedBufferValue21);
                            uint scalarValue46 = loadedBufferValue69.x;
                            if (scalarValue46 == 0u)
                            {
                                intermediateValue46 = 0.0f;
                                intermediateValue48 = 0.0f;
                                intermediateValue50 = 0.0f;
                                break;
                            }
                            float bitwiseValue25 = float(scalarValue46 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue46 = bitwiseValue25 * float(scalarValue46 & 255u);
                            intermediateValue48 = bitwiseValue25 * float((scalarValue46 >> 8u) & 255u);
                            intermediateValue50 = bitwiseValue25 * float((scalarValue46 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue52;
                        float intermediateValue54;
                        float intermediateValue56;
                        float sumValue38;
                        float sumValue39;
                        float sumValue40;
                        uint comparisonValue15;
                        bool comparisonValue16;
                        for (;;)
                        {
                            sumValue38 = sumValue29 + productValue121;
                            sumValue39 = sumValue30 + productValue122;
                            sumValue40 = sumValue31 + productValue123;
                            uint comparisonValue70 = ((((uint(sumValue29 >= 16.0f) << 1u) | uint(sumValue29 < 0.0f)) | (uint(sumValue30 < 0.0f) << 2u)) | (uint(sumValue30 >= 16.0f) << 3u)) | (uint(sumValue31 < 0.0f) << 4u);
                            comparisonValue15 = intermediateValue[comparisonValue70 | (uint(sumValue31 >= 16.0f) << 5u)];
                            comparisonValue16 = ((((comparisonValue70 | (uint(sumValue31 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue70 & 31u))) == 0u;
                            uint loadedBufferValue23;
                            if (comparisonValue16)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue17 + 4096u).x & (1u << (comparisonValue15 & 31u))) == 0u)
                                {
                                    intermediateValue52 = 0.0f;
                                    intermediateValue54 = 0.0f;
                                    intermediateValue56 = 0.0f;
                                    break;
                                }
                                loadedBufferValue23 = ((((uint(sumValue38 - (floor(sumValue38 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue39 - (floor(sumValue39 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue40 - (floor(sumValue40 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue17 + 4097u) + comparisonValue15).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue23 = ((((uint(sumValue29) << 8u) & 3840u) | (uint(sumValue30) & 15u)) | ((uint(sumValue31) << 4u) & 240u)) + bitwiseValue17;
                            }
                            uint4 loadedBufferValue70 = rdLoad_voxelBuffer(loadedBufferValue23);
                            uint scalarValue47 = loadedBufferValue70.x;
                            if (scalarValue47 == 0u)
                            {
                                intermediateValue52 = 0.0f;
                                intermediateValue54 = 0.0f;
                                intermediateValue56 = 0.0f;
                                break;
                            }
                            float bitwiseValue26 = float(scalarValue47 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue52 = bitwiseValue26 * float(scalarValue47 & 255u);
                            intermediateValue54 = bitwiseValue26 * float((scalarValue47 >> 8u) & 255u);
                            intermediateValue56 = bitwiseValue26 * float((scalarValue47 >> 16u) & 255u);
                            break;
                        }
                        float sumValue87 = sumValue22 + productValue121;
                        float sumValue88 = sumValue23 + productValue122;
                        float sumValue89 = sumValue24 + productValue123;
                        uint comparisonValue71 = ((((uint(sumValue22 >= 16.0f) << 1u) | uint(sumValue22 < 0.0f)) | (uint(sumValue23 < 0.0f) << 2u)) | (uint(sumValue23 >= 16.0f) << 3u)) | (uint(sumValue24 < 0.0f) << 4u);
                        uint comparisonValue72 = comparisonValue71 | (uint(sumValue24 >= 16.0f) << 5u);
                        uint loadedBufferValue25;
                        if ((((comparisonValue72 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue71 & 31u))) == 0u)
                        {
                            if ((rdLoad_voxelBuffer(bitwiseValue17 + 4096u).x & (1u << (intermediateValue[comparisonValue72] & 31u))) == 0u)
                            {
                                intermediateValue42 = intermediateValue35;
                                intermediateValue43 = intermediateValue36;
                                intermediateValue44 = intermediateValue37;
                                intermediateValue45 = intermediateValue46;
                                intermediateValue47 = intermediateValue48;
                                intermediateValue49 = intermediateValue50;
                                intermediateValue51 = intermediateValue52;
                                intermediateValue53 = intermediateValue54;
                                intermediateValue55 = intermediateValue56;
                                intermediateValue57 = 0.0f;
                                intermediateValue58 = 0.0f;
                                intermediateValue59 = 0.0f;
                                break;
                            }
                            loadedBufferValue25 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue17 + 4097u) + intermediateValue[comparisonValue72]).x >> 2u);
                        }
                        else
                        {
                            loadedBufferValue25 = ((((uint(sumValue22) << 8u) & 3840u) | (uint(sumValue23) & 15u)) | ((uint(sumValue24) << 4u) & 240u)) + bitwiseValue17;
                        }
                        uint4 loadedBufferValue71 = rdLoad_voxelBuffer(loadedBufferValue25);
                        uint scalarValue48 = loadedBufferValue71.x;
                        if (scalarValue48 == 0u)
                        {
                            intermediateValue42 = intermediateValue35;
                            intermediateValue43 = intermediateValue36;
                            intermediateValue44 = intermediateValue37;
                            intermediateValue45 = intermediateValue46;
                            intermediateValue47 = intermediateValue48;
                            intermediateValue49 = intermediateValue50;
                            intermediateValue51 = intermediateValue52;
                            intermediateValue53 = intermediateValue54;
                            intermediateValue55 = intermediateValue56;
                            intermediateValue57 = 0.0f;
                            intermediateValue58 = 0.0f;
                            intermediateValue59 = 0.0f;
                            break;
                        }
                        float bitwiseValue27 = float(scalarValue48 >> 24u) * 9.2272217443678528070449829101562e-05f;
                        intermediateValue42 = intermediateValue35;
                        intermediateValue43 = intermediateValue36;
                        intermediateValue44 = intermediateValue37;
                        intermediateValue45 = intermediateValue46;
                        intermediateValue47 = intermediateValue48;
                        intermediateValue49 = intermediateValue50;
                        intermediateValue51 = intermediateValue52;
                        intermediateValue53 = intermediateValue54;
                        intermediateValue55 = intermediateValue56;
                        intermediateValue57 = bitwiseValue27 * float(scalarValue48 & 255u);
                        intermediateValue58 = bitwiseValue27 * float((scalarValue48 >> 8u) & 255u);
                        intermediateValue59 = bitwiseValue27 * float((scalarValue48 >> 16u) & 255u);
                        break;
                    }
                }
                productValue51 = (((intermediateValue45 * sumValue20) + (intermediateValue42 * sumValue19)) + (intermediateValue51 * sumValue21)) + (intermediateValue57 * intermediateValue25);
                productValue52 = (((intermediateValue47 * sumValue20) + (intermediateValue43 * sumValue19)) + (intermediateValue53 * sumValue21)) + (intermediateValue58 * intermediateValue25);
                productValue53 = (((intermediateValue49 * sumValue20) + (intermediateValue44 * sumValue19)) + (intermediateValue55 * sumValue21)) + (intermediateValue59 * intermediateValue25);
            }
            else
            {
                productValue51 = 0.0f;
                productValue52 = 0.0f;
                productValue53 = 0.0f;
            }
            productValue34 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * productValue51;
            productValue35 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * productValue52;
            productValue36 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * productValue53;
        }
        else
        {
            productValue34 = productValue120 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.x;
            productValue35 = productValue120 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.y;
            productValue36 = productValue120 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.z;
        }
        float productValue130 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue12;
        float productValue59 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * 0.079577468335628509521484375f;
        float productValue131 = (max((productValue130 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + productValue34, RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue117) * productValue59;
        float productValue132 = (max((productValue130 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + productValue35, RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue118) * productValue59;
        float productValue133 = (max((productValue130 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + productValue36, RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue119) * productValue59;
        float productValue42;
        float productValue43;
        float productValue44;
        if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.y == 0.0f) || (abs(intermediateValue12) > 9.9999997473787516355514526367188e-05f))
        {
            float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
            float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
            float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
            float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
            float dotProductValue = (((dot(float3((-0.0f) - (multiplyAddValue5 / nonlinearValue), (-0.0f) - (multiplyAddValue6 / nonlinearValue), (-0.0f) - (multiplyAddValue7 / nonlinearValue)), float3(inverseLengthValue * multiplyAddValue8, inverseLengthValue * multiplyAddValue9, inverseLengthValue * multiplyAddValue10)) * 2.0f) + productValue29) * productValue29) + 1.0f;
            float loadedBufferValue13 = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * ((((1.0f - (productValue29 * productValue29)) * 0.079577468335628509521484375f) / (dotProductValue * sqrt(dotProductValue))) * cascadedShadowBufferTexture.Load(int4(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z), 0u)).x);
            productValue42 = ((loadedBufferValue13 * productValue117) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x) + productValue131;
            productValue43 = ((loadedBufferValue13 * productValue118) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y) + productValue132;
            productValue44 = ((loadedBufferValue13 * productValue119) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z) + productValue133;
        }
        else
        {
            productValue42 = productValue131;
            productValue43 = productValue132;
            productValue44 = productValue133;
        }
        scatteringBufferOutTexture[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = float4(productValue42, productValue43, productValue44, productValue116 - (clampedValue2 * productValue116));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                uint productValue5 = (comparisonValue1 * 20u) + 4u;
                float4 loadedBufferValue7 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue5).x, rdLoad_zBiomeInfoBuffer(productValue5 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue5 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue5 + 3u).x));
                uint productValue6 = (comparisonValue2 * 20u) + 4u;
                float4 loadedBufferValue8 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue6).x, rdLoad_zBiomeInfoBuffer(productValue6 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue6 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue6 + 3u).x));
                uint productValue7 = (comparisonValue3 * 20u) + 4u;
                float4 loadedBufferValue9 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue7).x, rdLoad_zBiomeInfoBuffer(productValue7 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue7 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue7 + 3u).x));
                uint productValue8 = (comparisonValue4 * 20u) + 4u;
                float4 loadedBufferValue10 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue8).x, rdLoad_zBiomeInfoBuffer(productValue8 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue8 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue8 + 3u).x));
                float scalarValue2 = frac(quotientValue3);
                float scalarValue3 = frac(quotientValue4);
                float sumValue6 = 1.0f - scalarValue2;
                float sumValue8 = 1.0f - scalarValue3;
                float productValue9 = sumValue8 * sumValue6;
                float productValue13 = sumValue8 * scalarValue2;
                float productValue17 = sumValue6 * scalarValue3;
                float productValue18 = scalarValue3 * scalarValue2;
                branchMergedValue4 = (((productValue18 * loadedBufferValue10.z) + (productValue17 * loadedBufferValue9.z)) + (productValue13 * loadedBufferValue8.z)) + (productValue9 * loadedBufferValue7.z);
                branchMergedValue9 = (((productValue18 * loadedBufferValue10.y) + (productValue17 * loadedBufferValue9.y)) + (productValue13 * loadedBufferValue8.y)) + (productValue9 * loadedBufferValue7.y);
                branchMergedValue10 = (((productValue18 * loadedBufferValue10.x) + (productValue17 * loadedBufferValue9.x)) + (productValue13 * loadedBufferValue8.x)) + (productValue9 * loadedBufferValue7.x);
                branchMergedValue11 = (((productValue18 * loadedBufferValue10.w) + (productValue17 * loadedBufferValue9.w)) + (productValue13 * loadedBufferValue8.w)) + (productValue9 * loadedBufferValue7.w);
            }
            intermediateValue7 = branchMergedValue10;
            intermediateValue8 = branchMergedValue9;
            intermediateValue9 = branchMergedValue4;
            intermediateValue10 = branchMergedValue11;
        }
        else
        {
            intermediateValue7 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.x;
            intermediateValue8 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.y;
            intermediateValue9 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.z;
            intermediateValue10 = RD_UNIFORM_WATER_ALBEDO_EXTINCTION.w;
        }
        float clampedValue1 = RD_UNIFORM_AIR_ALBEDO_EXTINCTION.w * clamp((RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.x * multiplyAddValue3) + RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS.y, 0.0f, 1.0f);
        float productValue19 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.x;
        float productValue20 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.y;
        float productValue21 = clampedValue1 * RD_UNIFORM_AIR_ALBEDO_EXTINCTION.z;
        float productValue113 = (((intermediateValue10 * intermediateValue7) - productValue19) * comparisonValue) + productValue19;
        float productValue114 = (((intermediateValue10 * intermediateValue8) - productValue20) * comparisonValue) + productValue20;
        float productValue115 = (((intermediateValue10 * intermediateValue9) - productValue21) * comparisonValue) + productValue21;
        float productValue116 = ((intermediateValue10 - clampedValue1) * comparisonValue) + clampedValue1;
        float productValue29 = ((RD_UNIFORM_HENYEY_GREENSTEIN_G.y - RD_UNIFORM_HENYEY_GREENSTEIN_G.x) * comparisonValue) + RD_UNIFORM_HENYEY_GREENSTEIN_G.x;
        float nonlinearValue2 = sqrt(((sumValue18 * sumValue18) + (sumValue17 * sumValue17)) + (sumValue43 * sumValue43));
        float clampedValue4 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue2 / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
        float productValue144 = productValue113 - (clampedValue4 * productValue113);
        float productValue145 = productValue114 - (clampedValue4 * productValue114);
        float productValue146 = productValue115 - (clampedValue4 * productValue115);
        float intermediateValue11;
        float intermediateValue12;
        if ((RD_UNIFORM_SKY_SAMPLES_CONFIG.x > 0.5f) && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w > 0.5f))
        {
            float4 sampledTextureValue = skyAmbientSamplesTexture.SampleLevel(skyAmbientSamplesSampler, float3(quotientValue, 1.0f - quotientValue1, (exp2(((RD_UNIFORM_SKY_SAMPLES_CONFIG.y > 0.5f) ? (quotientValue2 - RD_UNIFORM_SKY_SAMPLES_CONFIG.z) : quotientValue2) * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f), 0.0f);
            intermediateValue11 = sampledTextureValue.x;
            intermediateValue12 = sampledTextureValue.y;
        }
        else
        {
            intermediateValue11 = 0.0f;
            intermediateValue12 = RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y;
        }
        float productValue120 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue11;
        float productValue34;
        float productValue35;
        float productValue36;
        if ((RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f) && (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f))
        {
            float sumValue75 = (multiplyAddValue2 - RD_UNIFORM_WORLD_ORIGIN.x) + (-0.5f);
            float sumValue76 = (multiplyAddValue3 - RD_UNIFORM_WORLD_ORIGIN.y) + (-0.5f);
            float sumValue108 = (multiplyAddValue4 - RD_UNIFORM_WORLD_ORIGIN.z) + (-0.4799999892711639404296875f);
            float productValue121 = floor(sumValue75 * 0.0625f) * 16.0f;
            float productValue122 = floor(sumValue76 * 0.0625f) * 16.0f;
            float productValue147 = floor(sumValue108 * 0.0625f) * 16.0f;
            uint productValue124 = uint(int(floor(float(int(uint(int(floor(sumValue75))))) * 0.0625f)));
            uint productValue125 = uint(int(floor(float(int(uint(int(floor(sumValue76))))) * 0.0625f)));
            uint productValue148 = uint(int(floor(float(int(uint(int(floor(sumValue108))))) * 0.0625f)));
            float sumValue78 = sumValue75 - productValue121;
            float sumValue79 = sumValue76 - productValue122;
            float sumValue109 = sumValue108 - productValue147;
            uint bitwiseValue4 = (productValue125 << 16u) | (productValue124 & 65535u);
            uint bitwiseValue44 = (productValue148 & 65535u) | 131072u;
            uint productValue127 = productValue124 * 1540483477u;
            uint productValue128 = productValue125 * 1540483477u;
            uint productValue149 = productValue148 * 1540483477u;
            uint bitwiseValue45 = (((((((((productValue127 >> 24u) ^ productValue127) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue128 >> 24u) ^ productValue128) * 1540483477u)) * 1540483477u) ^ (((productValue149 >> 24u) ^ productValue149) * 1540483477u)) * 1540483477u) ^ 2418085729u;
            uint bitwiseValue46 = ((bitwiseValue45 >> 13u) ^ bitwiseValue45) * 1540483477u;
            uint bitwiseValue47 = (bitwiseValue46 >> 15u) ^ bitwiseValue46;
            uint bitwiseValue48 = bitwiseValue47 >> 16u;
            uint bitwiseValue49 = bitwiseValue47 & 65535u;
            uint comparisonValue92 = uint(bitwiseValue49 == bitwiseValue48) | (bitwiseValue49 ^ bitwiseValue48);
            uint sumValue81 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) + 4294967295u;
            bool intermediateValue16;
            uint scalarValue74 = comparisonValue92;
            uint scalarValue35 = 0u;
            uint scalarValue36 = 0u;
            uint loadedBufferValue11;
            uint bitwiseValue7;
            for (;;)
            {
                bitwiseValue7 = scalarValue74 & sumValue81;
                uint loadedBufferValue62 = rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 2u).x & 65535u;
                bool loadedBufferValue87 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue44) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue4) && (loadedBufferValue62 == comparisonValue92));
                loadedBufferValue11 = loadedBufferValue87 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue35;
                if ((loadedBufferValue62 == 0u) || loadedBufferValue87)
                {
                    intermediateValue16 = loadedBufferValue87;
                    break;
                }
                else
                {
                    uint sumValue82 = scalarValue36 + 1u;
                    if (int(sumValue82) < int(8u))
                    {
                        scalarValue74 = bitwiseValue7 + 1u;
                        scalarValue35 = loadedBufferValue11;
                        scalarValue36 = sumValue82;
                        continue;
                    }
                    else
                    {
                        intermediateValue16 = false;
                        break;
                    }
                }
            }
            uint bitwiseValue17 = loadedBufferValue11 >> 2u;
            float productValue56;
            float productValue57;
            float productValue58;
            if (intermediateValue16)
            {
                float intermediateValue61;
                float intermediateValue62;
                float intermediateValue63;
                float intermediateValue64;
                float intermediateValue66;
                float intermediateValue68;
                float intermediateValue70;
                float intermediateValue72;
                float intermediateValue74;
                float intermediateValue76;
                float intermediateValue77;
                float intermediateValue78;
                float intermediateValue17;
                float intermediateValue18;
                float intermediateValue19;
                uint intermediateValue20;
                uint intermediateValue21;
                uint intermediateValue22;
                float intermediateValue25;
                float sumValue24;
                float sumValue25;
                float sumValue26;
                float sumValue27;
                float sumValue28;
                float sumValue29;
                bool comparisonValue7;
                uint productValue50;
                uint productValue51;
                uint productValue52;
                uint productValue53;
                uint productValue54;
                uint productValue55;
                for (;;)
                {
                    intermediateValue17 = floor(sumValue78);
                    intermediateValue18 = floor(sumValue79);
                    intermediateValue19 = floor(sumValue109);
                    float sumValue83 = sumValue78 - intermediateValue17;
                    float sumValue84 = sumValue79 - intermediateValue18;
                    float sumValue110 = sumValue109 - intermediateValue19;
                    uint comparisonValue93 = ((uint(sumValue84 >= sumValue110) << 1u) | uint(sumValue83 >= sumValue84)) | (uint(sumValue83 >= sumValue110) << 2u);
                    intermediateValue20 = uint(intermediateValue17);
                    intermediateValue21 = uint(intermediateValue18);
                    intermediateValue22 = uint(intermediateValue19);
                    float scalarValue37 = min(sumValue83, sumValue84);
                    float scalarValue38 = max(sumValue83, sumValue84);
                    intermediateValue25 = min(scalarValue37, sumValue110);
                    float scalarValue75 = max(scalarValue38, sumValue110);
                    float scalarValue76 = max(min(scalarValue38, sumValue110), scalarValue37);
                    sumValue24 = 1.0f - scalarValue75;
                    sumValue25 = scalarValue75 - scalarValue76;
                    sumValue26 = scalarValue76 - intermediateValue25;
                    sumValue27 = intermediateValue17 + 1.0f;
                    sumValue28 = intermediateValue18 + 1.0f;
                    sumValue29 = intermediateValue19 + 1.0f;
                    comparisonValue7 = (((intermediateValue17 >= 0.0f) && (intermediateValue18 >= 0.0f)) && (intermediateValue19 >= 0.0f)) && (((sumValue27 < 16.0f) && (sumValue28 < 16.0f)) && (sumValue29 < 16.0f));
                    productValue50 = 0u + (comparisonValue93 * 3u);
                    productValue51 = 1u + (comparisonValue93 * 3u);
                    productValue52 = 2u + (comparisonValue93 * 3u);
                    productValue53 = 0u + (comparisonValue93 * 3u);
                    productValue54 = 1u + (comparisonValue93 * 3u);
                    productValue55 = 2u + (comparisonValue93 * 3u);
                    if (comparisonValue7)
                    {
                        uint bitwiseValue18 = intermediateValue22 << 4u;
                        uint sumValue86 = intermediateValue21 + bitwiseValue17;
                        uint bitwiseValue19 = sumValue86 + (intermediateValue20 << 8u);
                        uint4 loadedBufferValue64 = rdLoad_voxelBuffer(bitwiseValue19 + bitwiseValue18);
                        uint scalarValue41 = loadedBufferValue64.x;
                        float bitwiseValue11;
                        float intermediateValue35;
                        float intermediateValue36;
                        if (scalarValue41 == 0u)
                        {
                            bitwiseValue11 = 0.0f;
                            intermediateValue35 = 0.0f;
                            intermediateValue36 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue20 = float(scalarValue41 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue11 = bitwiseValue20 * float(scalarValue41 & 255u);
                            intermediateValue35 = bitwiseValue20 * float((scalarValue41 >> 8u) & 255u);
                            intermediateValue36 = bitwiseValue20 * float((scalarValue41 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue88 = rdLoad_voxelBuffer(((intermediateValue1[productValue51] + sumValue86) + ((intermediateValue1[productValue50] + intermediateValue20) << 8u)) + ((intermediateValue1[productValue52] + intermediateValue22) << 4u));
                        uint scalarValue77 = loadedBufferValue88.x;
                        float bitwiseValue13;
                        float intermediateValue44;
                        float intermediateValue45;
                        if (scalarValue77 == 0u)
                        {
                            bitwiseValue13 = 0.0f;
                            intermediateValue44 = 0.0f;
                            intermediateValue45 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue50 = float(scalarValue77 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue13 = bitwiseValue50 * float(scalarValue77 & 255u);
                            intermediateValue44 = bitwiseValue50 * float((scalarValue77 >> 8u) & 255u);
                            intermediateValue45 = bitwiseValue50 * float((scalarValue77 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue89 = rdLoad_voxelBuffer(((intermediateValue2[productValue54] + sumValue86) + ((intermediateValue2[productValue53] + intermediateValue20) << 8u)) + ((intermediateValue2[productValue55] + intermediateValue22) << 4u));
                        uint scalarValue78 = loadedBufferValue89.x;
                        float bitwiseValue15;
                        float intermediateValue55;
                        float intermediateValue56;
                        if (scalarValue78 == 0u)
                        {
                            bitwiseValue15 = 0.0f;
                            intermediateValue55 = 0.0f;
                            intermediateValue56 = 0.0f;
                        }
                        else
                        {
                            float bitwiseValue51 = float(scalarValue78 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            bitwiseValue15 = bitwiseValue51 * float(scalarValue78 & 255u);
                            intermediateValue55 = bitwiseValue51 * float((scalarValue78 >> 8u) & 255u);
                            intermediateValue56 = bitwiseValue51 * float((scalarValue78 >> 16u) & 255u);
                        }
                        uint4 loadedBufferValue67 = rdLoad_voxelBuffer((bitwiseValue19 + 273u) + bitwiseValue18);
                        uint scalarValue44 = loadedBufferValue67.x;
                        float branchMergedValue6;
                        float branchMergedValue13;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        float branchMergedValue18;
                        float branchMergedValue19;
                        float branchMergedValue20;
                        float branchMergedValue21;
                        float branchMergedValue28;
                        float branchMergedValue29;
                        if (scalarValue44 == 0u)
                        {
                            branchMergedValue6 = bitwiseValue13;
                            branchMergedValue13 = intermediateValue44;
                            branchMergedValue14 = intermediateValue45;
                            branchMergedValue15 = bitwiseValue15;
                            branchMergedValue16 = intermediateValue55;
                            branchMergedValue17 = intermediateValue56;
                            branchMergedValue18 = 0.0f;
                            branchMergedValue19 = 0.0f;
                            branchMergedValue20 = intermediateValue35;
                            branchMergedValue21 = bitwiseValue11;
                            branchMergedValue28 = 0.0f;
                            branchMergedValue29 = intermediateValue36;
                        }
                        else
                        {
                            float bitwiseValue23 = float(scalarValue44 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            branchMergedValue6 = bitwiseValue13;
                            branchMergedValue13 = intermediateValue44;
                            branchMergedValue14 = intermediateValue45;
                            branchMergedValue15 = bitwiseValue15;
                            branchMergedValue16 = intermediateValue55;
                            branchMergedValue17 = intermediateValue56;
                            branchMergedValue18 = bitwiseValue23 * float(scalarValue44 & 255u);
                            branchMergedValue19 = bitwiseValue23 * float((scalarValue44 >> 8u) & 255u);
                            branchMergedValue20 = intermediateValue35;
                            branchMergedValue21 = bitwiseValue11;
                            branchMergedValue28 = bitwiseValue23 * float((scalarValue44 >> 16u) & 255u);
                            branchMergedValue29 = intermediateValue36;
                        }
                        intermediateValue61 = branchMergedValue21;
                        intermediateValue62 = branchMergedValue20;
                        intermediateValue63 = branchMergedValue29;
                        intermediateValue64 = branchMergedValue6;
                        intermediateValue66 = branchMergedValue13;
                        intermediateValue68 = branchMergedValue14;
                        intermediateValue70 = branchMergedValue15;
                        intermediateValue72 = branchMergedValue16;
                        intermediateValue74 = branchMergedValue17;
                        intermediateValue76 = branchMergedValue18;
                        intermediateValue77 = branchMergedValue19;
                        intermediateValue78 = branchMergedValue28;
                        break;
                    }
                    else
                    {
                        float intermediateValue47;
                        float intermediateValue48;
                        float intermediateValue49;
                        float sumValue31;
                        float sumValue32;
                        float sumValue33;
                        float sumValue34;
                        float sumValue35;
                        float sumValue36;
                        float sumValue37;
                        float sumValue38;
                        float sumValue39;
                        uint comparisonValue9;
                        bool comparisonValue10;
                        for (;;)
                        {
                            sumValue31 = float(intermediateValue1[productValue50]) + intermediateValue17;
                            sumValue32 = float(intermediateValue1[productValue51]) + intermediateValue18;
                            sumValue33 = float(intermediateValue1[productValue52]) + intermediateValue19;
                            sumValue34 = float(intermediateValue2[productValue53]) + intermediateValue17;
                            sumValue35 = float(intermediateValue2[productValue54]) + intermediateValue18;
                            sumValue36 = float(intermediateValue2[productValue55]) + intermediateValue19;
                            sumValue37 = intermediateValue17 + productValue121;
                            sumValue38 = intermediateValue18 + productValue122;
                            sumValue39 = intermediateValue19 + productValue147;
                            uint comparisonValue68 = ((((uint(intermediateValue17 >= 16.0f) << 1u) | uint(intermediateValue17 < 0.0f)) | (uint(intermediateValue18 < 0.0f) << 2u)) | (uint(intermediateValue18 >= 16.0f) << 3u)) | (uint(intermediateValue19 < 0.0f) << 4u);
                            comparisonValue9 = intermediateValue[comparisonValue68 | (uint(intermediateValue19 >= 16.0f) << 5u)];
                            comparisonValue10 = ((((comparisonValue68 | (uint(intermediateValue19 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue68 & 31u))) == 0u;
                            uint loadedBufferValue18;
                            if (comparisonValue10)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue17 + 4096u).x & (1u << (comparisonValue9 & 31u))) == 0u)
                                {
                                    intermediateValue47 = 0.0f;
                                    intermediateValue48 = 0.0f;
                                    intermediateValue49 = 0.0f;
                                    break;
                                }
                                loadedBufferValue18 = ((((uint(sumValue37 - (floor(sumValue37 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue38 - (floor(sumValue38 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue39 - (floor(sumValue39 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue17 + 4097u) + comparisonValue9).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue18 = ((((intermediateValue20 << 8u) & 3840u) | (intermediateValue21 & 15u)) | ((intermediateValue22 << 4u) & 240u)) + bitwiseValue17;
                            }
                            uint4 loadedBufferValue68 = rdLoad_voxelBuffer(loadedBufferValue18);
                            uint scalarValue45 = loadedBufferValue68.x;
                            if (scalarValue45 == 0u)
                            {
                                intermediateValue47 = 0.0f;
                                intermediateValue48 = 0.0f;
                                intermediateValue49 = 0.0f;
                                break;
                            }
                            float bitwiseValue24 = float(scalarValue45 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue47 = bitwiseValue24 * float(scalarValue45 & 255u);
                            intermediateValue48 = bitwiseValue24 * float((scalarValue45 >> 8u) & 255u);
                            intermediateValue49 = bitwiseValue24 * float((scalarValue45 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue65;
                        float intermediateValue67;
                        float intermediateValue69;
                        float sumValue40;
                        float sumValue41;
                        float sumValue42;
                        uint comparisonValue12;
                        bool comparisonValue13;
                        for (;;)
                        {
                            sumValue40 = sumValue31 + productValue121;
                            sumValue41 = sumValue32 + productValue122;
                            sumValue42 = sumValue33 + productValue147;
                            uint comparisonValue94 = ((((uint(sumValue31 >= 16.0f) << 1u) | uint(sumValue31 < 0.0f)) | (uint(sumValue32 < 0.0f) << 2u)) | (uint(sumValue32 >= 16.0f) << 3u)) | (uint(sumValue33 < 0.0f) << 4u);
                            comparisonValue12 = intermediateValue[comparisonValue94 | (uint(sumValue33 >= 16.0f) << 5u)];
                            comparisonValue13 = ((((comparisonValue94 | (uint(sumValue33 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue94 & 31u))) == 0u;
                            uint loadedBufferValue23;
                            if (comparisonValue13)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue17 + 4096u).x & (1u << (comparisonValue12 & 31u))) == 0u)
                                {
                                    intermediateValue65 = 0.0f;
                                    intermediateValue67 = 0.0f;
                                    intermediateValue69 = 0.0f;
                                    break;
                                }
                                loadedBufferValue23 = ((((uint(sumValue40 - (floor(sumValue40 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue41 - (floor(sumValue41 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue42 - (floor(sumValue42 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue17 + 4097u) + comparisonValue12).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue23 = ((((uint(sumValue31) << 8u) & 3840u) | (uint(sumValue32) & 15u)) | ((uint(sumValue33) << 4u) & 240u)) + bitwiseValue17;
                            }
                            uint4 loadedBufferValue70 = rdLoad_voxelBuffer(loadedBufferValue23);
                            uint scalarValue47 = loadedBufferValue70.x;
                            if (scalarValue47 == 0u)
                            {
                                intermediateValue65 = 0.0f;
                                intermediateValue67 = 0.0f;
                                intermediateValue69 = 0.0f;
                                break;
                            }
                            float bitwiseValue26 = float(scalarValue47 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue65 = bitwiseValue26 * float(scalarValue47 & 255u);
                            intermediateValue67 = bitwiseValue26 * float((scalarValue47 >> 8u) & 255u);
                            intermediateValue69 = bitwiseValue26 * float((scalarValue47 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue71;
                        float intermediateValue73;
                        float intermediateValue75;
                        float sumValue47;
                        float sumValue48;
                        float sumValue49;
                        uint comparisonValue15;
                        bool comparisonValue16;
                        for (;;)
                        {
                            sumValue47 = sumValue34 + productValue121;
                            sumValue48 = sumValue35 + productValue122;
                            sumValue49 = sumValue36 + productValue147;
                            uint comparisonValue95 = ((((uint(sumValue34 >= 16.0f) << 1u) | uint(sumValue34 < 0.0f)) | (uint(sumValue35 < 0.0f) << 2u)) | (uint(sumValue35 >= 16.0f) << 3u)) | (uint(sumValue36 < 0.0f) << 4u);
                            comparisonValue15 = intermediateValue[comparisonValue95 | (uint(sumValue36 >= 16.0f) << 5u)];
                            comparisonValue16 = ((((comparisonValue95 | (uint(sumValue36 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue95 & 31u))) == 0u;
                            uint loadedBufferValue25;
                            if (comparisonValue16)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue17 + 4096u).x & (1u << (comparisonValue15 & 31u))) == 0u)
                                {
                                    intermediateValue71 = 0.0f;
                                    intermediateValue73 = 0.0f;
                                    intermediateValue75 = 0.0f;
                                    break;
                                }
                                loadedBufferValue25 = ((((uint(sumValue47 - (floor(sumValue47 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue48 - (floor(sumValue48 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue49 - (floor(sumValue49 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue17 + 4097u) + comparisonValue15).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue25 = ((((uint(sumValue34) << 8u) & 3840u) | (uint(sumValue35) & 15u)) | ((uint(sumValue36) << 4u) & 240u)) + bitwiseValue17;
                            }
                            uint4 loadedBufferValue71 = rdLoad_voxelBuffer(loadedBufferValue25);
                            uint scalarValue48 = loadedBufferValue71.x;
                            if (scalarValue48 == 0u)
                            {
                                intermediateValue71 = 0.0f;
                                intermediateValue73 = 0.0f;
                                intermediateValue75 = 0.0f;
                                break;
                            }
                            float bitwiseValue27 = float(scalarValue48 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue71 = bitwiseValue27 * float(scalarValue48 & 255u);
                            intermediateValue73 = bitwiseValue27 * float((scalarValue48 >> 8u) & 255u);
                            intermediateValue75 = bitwiseValue27 * float((scalarValue48 >> 16u) & 255u);
                            break;
                        }
                        float sumValue111 = sumValue27 + productValue121;
                        float sumValue112 = sumValue28 + productValue122;
                        float sumValue113 = sumValue29 + productValue147;
                        uint comparisonValue96 = ((((uint(sumValue27 >= 16.0f) << 1u) | uint(sumValue27 < 0.0f)) | (uint(sumValue28 < 0.0f) << 2u)) | (uint(sumValue28 >= 16.0f) << 3u)) | (uint(sumValue29 < 0.0f) << 4u);
                        uint comparisonValue97 = comparisonValue96 | (uint(sumValue29 >= 16.0f) << 5u);
                        uint loadedBufferValue34;
                        if ((((comparisonValue97 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue96 & 31u))) == 0u)
                        {
                            if ((rdLoad_voxelBuffer(bitwiseValue17 + 4096u).x & (1u << (intermediateValue[comparisonValue97] & 31u))) == 0u)
                            {
                                intermediateValue61 = intermediateValue47;
                                intermediateValue62 = intermediateValue48;
                                intermediateValue63 = intermediateValue49;
                                intermediateValue64 = intermediateValue65;
                                intermediateValue66 = intermediateValue67;
                                intermediateValue68 = intermediateValue69;
                                intermediateValue70 = intermediateValue71;
                                intermediateValue72 = intermediateValue73;
                                intermediateValue74 = intermediateValue75;
                                intermediateValue76 = 0.0f;
                                intermediateValue77 = 0.0f;
                                intermediateValue78 = 0.0f;
                                break;
                            }
                            loadedBufferValue34 = ((((uint(sumValue111 - (floor(sumValue111 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue112 - (floor(sumValue112 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue113 - (floor(sumValue113 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue17 + 4097u) + intermediateValue[comparisonValue97]).x >> 2u);
                        }
                        else
                        {
                            loadedBufferValue34 = ((((uint(sumValue27) << 8u) & 3840u) | (uint(sumValue28) & 15u)) | ((uint(sumValue29) << 4u) & 240u)) + bitwiseValue17;
                        }
                        uint4 loadedBufferValue90 = rdLoad_voxelBuffer(loadedBufferValue34);
                        uint scalarValue79 = loadedBufferValue90.x;
                        if (scalarValue79 == 0u)
                        {
                            intermediateValue61 = intermediateValue47;
                            intermediateValue62 = intermediateValue48;
                            intermediateValue63 = intermediateValue49;
                            intermediateValue64 = intermediateValue65;
                            intermediateValue66 = intermediateValue67;
                            intermediateValue68 = intermediateValue69;
                            intermediateValue70 = intermediateValue71;
                            intermediateValue72 = intermediateValue73;
                            intermediateValue74 = intermediateValue75;
                            intermediateValue76 = 0.0f;
                            intermediateValue77 = 0.0f;
                            intermediateValue78 = 0.0f;
                            break;
                        }
                        float bitwiseValue52 = float(scalarValue79 >> 24u) * 9.2272217443678528070449829101562e-05f;
                        intermediateValue61 = intermediateValue47;
                        intermediateValue62 = intermediateValue48;
                        intermediateValue63 = intermediateValue49;
                        intermediateValue64 = intermediateValue65;
                        intermediateValue66 = intermediateValue67;
                        intermediateValue68 = intermediateValue69;
                        intermediateValue70 = intermediateValue71;
                        intermediateValue72 = intermediateValue73;
                        intermediateValue74 = intermediateValue75;
                        intermediateValue76 = bitwiseValue52 * float(scalarValue79 & 255u);
                        intermediateValue77 = bitwiseValue52 * float((scalarValue79 >> 8u) & 255u);
                        intermediateValue78 = bitwiseValue52 * float((scalarValue79 >> 16u) & 255u);
                        break;
                    }
                }
                productValue56 = (((intermediateValue64 * sumValue25) + (intermediateValue61 * sumValue24)) + (intermediateValue70 * sumValue26)) + (intermediateValue76 * intermediateValue25);
                productValue57 = (((intermediateValue66 * sumValue25) + (intermediateValue62 * sumValue24)) + (intermediateValue72 * sumValue26)) + (intermediateValue77 * intermediateValue25);
                productValue58 = (((intermediateValue68 * sumValue25) + (intermediateValue63 * sumValue24)) + (intermediateValue74 * sumValue26)) + (intermediateValue78 * intermediateValue25);
            }
            else
            {
                productValue56 = 0.0f;
                productValue57 = 0.0f;
                productValue58 = 0.0f;
            }
            float productValue150 = RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w;
            productValue34 = productValue150 * productValue56;
            productValue35 = productValue150 * productValue57;
            productValue36 = productValue150 * productValue58;
        }
        else
        {
            productValue34 = productValue120 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.x;
            productValue35 = productValue120 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.y;
            productValue36 = productValue120 * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.z;
        }
        float productValue130 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue12;
        float productValue59 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * 0.079577468335628509521484375f;
        float productValue151 = (max((productValue130 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + productValue34, RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue144) * productValue59;
        float productValue152 = (max((productValue130 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + productValue35, RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue145) * productValue59;
        float productValue153 = (max((productValue130 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + productValue36, RD_UNIFORM_MIN_AMBIENT_VALUE.x) * productValue146) * productValue59;
        float quotientValue8 = (-0.0f) - (sumValue17 / nonlinearValue2);
        float quotientValue9 = (-0.0f) - (sumValue18 / nonlinearValue2);
        float quotientValue10 = (-0.0f) - (sumValue43 / nonlinearValue2);
        float productValue42;
        float productValue43;
        float productValue44;
        if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.y == 0.0f) || (abs(intermediateValue12) > 9.9999997473787516355514526367188e-05f))
        {
            float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
            float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
            float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
            float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
            float dotProductValue1 = (((dot(float3(quotientValue8, quotientValue9, quotientValue10), float3(inverseLengthValue * multiplyAddValue8, inverseLengthValue * multiplyAddValue9, inverseLengthValue * multiplyAddValue10)) * 2.0f) + productValue29) * productValue29) + 1.0f;
            float loadedBufferValue31 = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * ((((1.0f - (productValue29 * productValue29)) * 0.079577468335628509521484375f) / (dotProductValue1 * sqrt(dotProductValue1))) * cascadedShadowBufferTexture.Load(int4(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z), 0u)).x);
            productValue42 = ((loadedBufferValue31 * productValue144) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x) + productValue151;
            productValue43 = ((loadedBufferValue31 * productValue145) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y) + productValue152;
            productValue44 = ((loadedBufferValue31 * productValue146) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z) + productValue153;
        }
        else
        {
            productValue42 = productValue151;
            productValue43 = productValue152;
            productValue44 = productValue153;
        }
        float productValue47;
        float productValue48;
        float productValue49;
        if ((RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.y != 0.0f) && (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f))
        {
            float sumValue44 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
            float sumValue45 = (-0.0f) - sumValue43;
            float productValue76 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue45;
            float productValue77 = productValue76 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
            float intermediateValue28;
            if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue45)
            {
                intermediateValue28 = 0.0f;
            }
            else
            {
                float branchMergedValue5;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue45)
                {
                    branchMergedValue5 = 1.0f;
                }
                else
                {
                    branchMergedValue5 = min(floor(min(max((log2(sumValue45) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                }
                intermediateValue28 = branchMergedValue5;
            }
            float quotientValue11 = min(floor(min(max((productValue77 + sumValue17) / (productValue77 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
            float quotientValue12 = min(floor(min(max((productValue76 + sumValue18) / (productValue76 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
            uint intermediateValue30;
            bool intermediateValue32;
            uint intermediateValue33;
            if ((intermediateValue28 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue12 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue11 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue28 < 0.0f) || ((quotientValue11 < 0.0f) || (quotientValue12 < 0.0f))))))
            {
                intermediateValue30 = intermediateValue31;
                intermediateValue32 = false;
                intermediateValue33 = 0u;
            }
            else
            {
                uint scalarValue10 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                uint productValue154 = uint(int(((quotientValue12 + (intermediateValue28 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue11)) * scalarValue10;
                intermediateValue30 = productValue154;
                intermediateValue32 = true;
                intermediateValue33 = productValue154 + scalarValue10;
            }
            float intermediateValue38;
            float intermediateValue40;
            float intermediateValue42;
            if (intermediateValue32 && (int(intermediateValue30) < int(intermediateValue33)))
            {
                float intermediateValue58;
                float intermediateValue59;
                float intermediateValue60;
                float intermediateValue82;
                float intermediateValue83;
                float intermediateValue84;
                float intermediateValue85;
                float intermediateValue39;
                float intermediateValue41;
                float intermediateValue43;
                float scalarValue11 = 0.0f;
                float scalarValue12 = 0.0f;
                float scalarValue13 = 0.0f;
                uint scalarValue80 = intermediateValue30;
                uint loadedBufferValue20;
                for (;;)
                {
                    loadedBufferValue20 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue80).x)));
                    if (int(loadedBufferValue20) < int(0u))
                    {
                        intermediateValue39 = scalarValue11;
                        intermediateValue41 = scalarValue12;
                        intermediateValue43 = scalarValue13;
                        break;
                    }
                    else
                    {
                        uint productValue155 = loadedBufferValue20 * 32u;
                        float4 loadedBufferValue91 = asfloat(uint4(rdLoad_zLights(productValue155).x, rdLoad_zLights(productValue155 + 1u).x, rdLoad_zLights(productValue155 + 2u).x, rdLoad_zLights(productValue155 + 3u).x));
                        intermediateValue58 = loadedBufferValue91.x;
                        intermediateValue59 = loadedBufferValue91.y;
                        intermediateValue60 = loadedBufferValue91.z;
                        float sumValue114 = intermediateValue58 - multiplyAddValue2;
                        float sumValue115 = intermediateValue59 - multiplyAddValue3;
                        float sumValue116 = intermediateValue60 - multiplyAddValue4;
                        float productValue65;
                        if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                        {
                            float sumValue117 = (abs(sumValue115) + abs(sumValue114)) + abs(sumValue116);
                            productValue65 = sumValue117 * sumValue117;
                        }
                        else
                        {
                            productValue65 = dot(float3(sumValue114, sumValue115, sumValue116), float3(sumValue114, sumValue115, sumValue116));
                        }
                        float scalarValue81 = loadedBufferValue91.w;
                        float productValue156 = scalarValue81 * scalarValue81;
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        if (!(productValue65 >= productValue156))
                        {
                            float intermediateValue86;
                            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                            {
                                uint productValue157 = (loadedBufferValue20 * 32u) + 8u;
                                float4 loadedBufferValue92 = asfloat(uint4(rdLoad_zLights(productValue157).x, rdLoad_zLights(productValue157 + 1u).x, rdLoad_zLights(productValue157 + 2u).x, rdLoad_zLights(productValue157 + 3u).x));
                                uint productValue158 = (loadedBufferValue20 * 32u) + 12u;
                                float4 loadedBufferValue93 = asfloat(uint4(rdLoad_zLights(productValue158).x, rdLoad_zLights(productValue158 + 1u).x, rdLoad_zLights(productValue158 + 2u).x, rdLoad_zLights(productValue158 + 3u).x));
                                uint productValue159 = (loadedBufferValue20 * 32u) + 16u;
                                float4 loadedBufferValue94 = asfloat(uint4(rdLoad_zLights(productValue159).x, rdLoad_zLights(productValue159 + 1u).x, rdLoad_zLights(productValue159 + 2u).x, rdLoad_zLights(productValue159 + 3u).x));
                                uint productValue160 = (loadedBufferValue20 * 32u) + 20u;
                                float4 loadedBufferValue95 = asfloat(uint4(rdLoad_zLights(productValue160).x, rdLoad_zLights(productValue160 + 1u).x, rdLoad_zLights(productValue160 + 2u).x, rdLoad_zLights(productValue160 + 3u).x));
                                uint productValue161 = (loadedBufferValue20 * 32u) + 24u;
                                float4 loadedBufferValue96 = asfloat(uint4(rdLoad_zLights(productValue161).x, rdLoad_zLights(productValue161 + 1u).x, rdLoad_zLights(productValue161 + 2u).x, rdLoad_zLights(productValue161 + 3u).x));
                                uint productValue162 = (loadedBufferValue20 * 32u) + 28u;
                                float4 loadedBufferValue97 = asfloat(uint4(rdLoad_zLights(productValue162).x, rdLoad_zLights(productValue162 + 1u).x, rdLoad_zLights(productValue162 + 2u).x, rdLoad_zLights(productValue162 + 3u).x));
                                float sumValue118 = multiplyAddValue2 - intermediateValue58;
                                float sumValue119 = multiplyAddValue3 - intermediateValue59;
                                float sumValue120 = multiplyAddValue4 - intermediateValue60;
                                float scalarValue82 = abs(sumValue118);
                                float scalarValue83 = abs(sumValue119);
                                float scalarValue84 = abs(sumValue120);
                                uint comparisonValue19;
                                if ((scalarValue82 >= scalarValue83) && (scalarValue82 >= scalarValue84))
                                {
                                    comparisonValue19 = uint(!(sumValue118 >= 0.0f));
                                }
                                else
                                {
                                    uint branchMergedValue8;
                                    if (!(scalarValue83 >= scalarValue84))
                                    {
                                        branchMergedValue8 = (sumValue120 >= 0.0f) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue8 = (sumValue119 >= 0.0f) ? 2u : 3u;
                                    }
                                    comparisonValue19 = branchMergedValue8;
                                }
                                float sumValue121 = (-0.0f) - sumValue118;
                                float intermediateValue91;
                                float intermediateValue92;
                                float intermediateValue93;
                                float intermediateValue94;
                                float sumValue58;
                                float intermediateValue95;
                                float intermediateValue96;
                                if (comparisonValue19 == 1u)
                                {
                                    intermediateValue91 = loadedBufferValue93.x;
                                    intermediateValue92 = loadedBufferValue93.y;
                                    intermediateValue93 = loadedBufferValue93.z;
                                    intermediateValue94 = loadedBufferValue93.w;
                                    sumValue58 = (-0.0f) - sumValue120;
                                    intermediateValue95 = sumValue119;
                                    intermediateValue96 = sumValue118;
                                }
                                else
                                {
                                    float branchMergedValue12;
                                    float branchMergedValue22;
                                    float branchMergedValue23;
                                    float branchMergedValue24;
                                    float branchMergedValue25;
                                    float branchMergedValue26;
                                    float branchMergedValue27;
                                    if (comparisonValue19 == 2u)
                                    {
                                        branchMergedValue12 = loadedBufferValue94.x;
                                        branchMergedValue22 = (-0.0f) - sumValue120;
                                        branchMergedValue23 = (-0.0f) - sumValue119;
                                        branchMergedValue24 = sumValue121;
                                        branchMergedValue25 = loadedBufferValue94.w;
                                        branchMergedValue26 = loadedBufferValue94.z;
                                        branchMergedValue27 = loadedBufferValue94.y;
                                    }
                                    else
                                    {
                                        float branchMergedValue30;
                                        float branchMergedValue31;
                                        float branchMergedValue32;
                                        float branchMergedValue33;
                                        float branchMergedValue34;
                                        float branchMergedValue35;
                                        float branchMergedValue36;
                                        if (comparisonValue19 == 3u)
                                        {
                                            branchMergedValue30 = loadedBufferValue95.x;
                                            branchMergedValue31 = sumValue120;
                                            branchMergedValue32 = sumValue119;
                                            branchMergedValue33 = sumValue121;
                                            branchMergedValue34 = loadedBufferValue95.w;
                                            branchMergedValue35 = loadedBufferValue95.z;
                                            branchMergedValue36 = loadedBufferValue95.y;
                                        }
                                        else
                                        {
                                            float branchMergedValue37;
                                            float branchMergedValue38;
                                            float branchMergedValue39;
                                            float branchMergedValue40;
                                            float branchMergedValue41;
                                            float branchMergedValue42;
                                            float branchMergedValue43;
                                            if (comparisonValue19 == 4u)
                                            {
                                                branchMergedValue37 = loadedBufferValue96.x;
                                                branchMergedValue38 = sumValue119;
                                                branchMergedValue39 = (-0.0f) - sumValue120;
                                                branchMergedValue40 = sumValue121;
                                                branchMergedValue41 = loadedBufferValue96.w;
                                                branchMergedValue42 = loadedBufferValue96.z;
                                                branchMergedValue43 = loadedBufferValue96.y;
                                            }
                                            else
                                            {
                                                bool comparisonValue98 = comparisonValue19 == 5u;
                                                branchMergedValue37 = comparisonValue98 ? loadedBufferValue97.x : loadedBufferValue92.x;
                                                branchMergedValue38 = sumValue119;
                                                branchMergedValue39 = comparisonValue98 ? sumValue120 : sumValue121;
                                                branchMergedValue40 = comparisonValue98 ? sumValue118 : sumValue120;
                                                branchMergedValue41 = comparisonValue98 ? loadedBufferValue97.w : loadedBufferValue92.w;
                                                branchMergedValue42 = comparisonValue98 ? loadedBufferValue97.z : loadedBufferValue92.z;
                                                branchMergedValue43 = comparisonValue98 ? loadedBufferValue97.y : loadedBufferValue92.y;
                                            }
                                            branchMergedValue30 = branchMergedValue37;
                                            branchMergedValue31 = branchMergedValue38;
                                            branchMergedValue32 = branchMergedValue39;
                                            branchMergedValue33 = branchMergedValue40;
                                            branchMergedValue34 = branchMergedValue41;
                                            branchMergedValue35 = branchMergedValue42;
                                            branchMergedValue36 = branchMergedValue43;
                                        }
                                        branchMergedValue12 = branchMergedValue30;
                                        branchMergedValue22 = branchMergedValue31;
                                        branchMergedValue23 = branchMergedValue32;
                                        branchMergedValue24 = branchMergedValue33;
                                        branchMergedValue25 = branchMergedValue34;
                                        branchMergedValue26 = branchMergedValue35;
                                        branchMergedValue27 = branchMergedValue36;
                                    }
                                    intermediateValue91 = branchMergedValue12;
                                    intermediateValue92 = branchMergedValue27;
                                    intermediateValue93 = branchMergedValue26;
                                    intermediateValue94 = branchMergedValue25;
                                    sumValue58 = branchMergedValue24;
                                    intermediateValue95 = branchMergedValue22;
                                    intermediateValue96 = branchMergedValue23;
                                }
                                float branchMergedValue7;
                                if ((intermediateValue93 == 0.0f) && (intermediateValue94 == 0.0f))
                                {
                                    branchMergedValue7 = 0.0f;
                                }
                                else
                                {
                                    float multiplyAddValue117 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue96, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue95, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue58)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                    float quotientValue13 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                    float quotientValue14 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                    float sumValue122 = intermediateValue93 - intermediateValue91;
                                    float sumValue123 = intermediateValue94 - intermediateValue92;
                                    float productValue163 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue122;
                                    float productValue164 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue123;
                                    float sampledTextureValue4 = float(pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(productValue163 * ((((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue96, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue95, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue58)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue117) * 0.5f) + 0.5f)) + 0.5f) / productValue163) * sumValue122) + intermediateValue91, quotientValue13 + intermediateValue91), intermediateValue93 - quotientValue13), min(max((((floor(productValue164 * (0.5f - (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue96, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue95, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue58)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue117) * 0.5f))) + 0.5f) / productValue164) * sumValue123) + intermediateValue92, quotientValue14 + intermediateValue92), intermediateValue94 - quotientValue14)), 0.0f).x >= ((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue96, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue95, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue58)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) / multiplyAddValue117));
                                    branchMergedValue7 = sampledTextureValue4;
                                }
                                intermediateValue86 = branchMergedValue7;
                            }
                            else
                            {
                                intermediateValue86 = 1.0f;
                            }
                            uint productValue165 = (loadedBufferValue20 * 32u) + 4u;
                            float4 loadedBufferValue98 = asfloat(uint4(rdLoad_zLights(productValue165).x, rdLoad_zLights(productValue165 + 1u).x, rdLoad_zLights(productValue165 + 2u).x, rdLoad_zLights(productValue165 + 3u).x));
                            float quotientValue23 = productValue65 / (productValue156 + 9.9999997473787516355514526367188e-05f);
                            float clampedValue9 = clamp(1.0f - (quotientValue23 * quotientValue23), 0.0f, 1.0f);
                            float quotientValue24 = (clampedValue9 * clampedValue9) * (1.0f / max(productValue65, 0.100000001490116119384765625f));
                            float clampedValue5;
                            if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                            {
                                float clampedValue10 = clamp(((1.0f - quotientValue24) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                clampedValue5 = clamp((((clampedValue10 * clampedValue10) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue10 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue24;
                            }
                            else
                            {
                                clampedValue5 = quotientValue24;
                            }
                            float productValue166 = clampedValue5 * loadedBufferValue98.w;
                            branchMergedValue = productValue166 * loadedBufferValue98.y;
                            branchMergedValue1 = intermediateValue86;
                            branchMergedValue2 = productValue166 * loadedBufferValue98.z;
                            branchMergedValue3 = productValue166 * loadedBufferValue98.x;
                        }
                        else
                        {
                            branchMergedValue = 0.0f;
                            branchMergedValue1 = 1.0f;
                            branchMergedValue2 = 0.0f;
                            branchMergedValue3 = 0.0f;
                        }
                        intermediateValue83 = branchMergedValue;
                        intermediateValue85 = branchMergedValue1;
                        intermediateValue84 = branchMergedValue2;
                        intermediateValue82 = branchMergedValue3;
                        float multiplyAddValue118 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, intermediateValue60, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, intermediateValue59, intermediateValue58 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) - multiplyAddValue60;
                        float multiplyAddValue119 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, intermediateValue60, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, intermediateValue59, intermediateValue58 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) - multiplyAddValue61;
                        float multiplyAddValue120 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, intermediateValue60, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, intermediateValue59, intermediateValue58 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) - multiplyAddValue62;
                        float inverseLengthValue4 = rsqrt(dot(float3(multiplyAddValue118, multiplyAddValue119, multiplyAddValue120), float3(multiplyAddValue118, multiplyAddValue119, multiplyAddValue120)));
                        float dotProductValue3 = (((dot(float3(quotientValue8, quotientValue9, quotientValue10), float3(inverseLengthValue4 * multiplyAddValue118, inverseLengthValue4 * multiplyAddValue119, inverseLengthValue4 * multiplyAddValue120)) * 2.0f) + productValue29) * productValue29) + 1.0f;
                        float nonlinearValue5 = (((1.0f - (productValue29 * productValue29)) * 0.079577468335628509521484375f) / (dotProductValue3 * sqrt(dotProductValue3))) * intermediateValue85;
                        float productValue167 = ((intermediateValue82 * productValue144) * nonlinearValue5) + scalarValue11;
                        float productValue168 = ((intermediateValue83 * productValue145) * nonlinearValue5) + scalarValue12;
                        float productValue169 = ((intermediateValue84 * productValue146) * nonlinearValue5) + scalarValue13;
                        uint sumValue124 = scalarValue80 + 1u;
                        if (int(sumValue124) < int(intermediateValue33))
                        {
                            scalarValue11 = productValue167;
                            scalarValue12 = productValue168;
                            scalarValue13 = productValue169;
                            scalarValue80 = sumValue124;
                            continue;
                        }
                        else
                        {
                            intermediateValue39 = productValue167;
                            intermediateValue41 = productValue168;
                            intermediateValue43 = productValue169;
                            break;
                        }
                    }
                }
                intermediateValue38 = intermediateValue39;
                intermediateValue40 = intermediateValue41;
                intermediateValue42 = intermediateValue43;
            }
            else
            {
                intermediateValue38 = 0.0f;
                intermediateValue40 = 0.0f;
                intermediateValue42 = 0.0f;
            }
            productValue47 = (intermediateValue38 * sumValue44) + productValue42;
            productValue48 = (intermediateValue40 * sumValue44) + productValue43;
            productValue49 = (intermediateValue42 * sumValue44) + productValue44;
        }
        else
        {
            productValue47 = productValue42;
            productValue48 = productValue43;
            productValue49 = productValue44;
        }
        scatteringBufferOutTexture[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = float4(productValue47, productValue48, productValue49, productValue116 - (clampedValue4 * productValue116));
#endif
    }
}
#if RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128
[numthreads(8, 8, 2)]
#elif RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT256
[numthreads(8, 8, 4)]
#elif RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE
[numthreads(8, 8, 8)]
#endif
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
