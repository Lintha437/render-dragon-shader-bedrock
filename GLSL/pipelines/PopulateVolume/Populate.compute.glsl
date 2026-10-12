#version 460
#extension GL_GOOGLE_include_directive : require
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

#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/PopulateVolume/ComputeBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(computeVectorConstants0.packedValues[16u]);
    float reinterpretedBits1 = uintBitsToFloat(reinterpretedBits.x);
    float reinterpretedBits2 = uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits3 = uintBitsToFloat(reinterpretedBits.z);
    uint scalarValue4 = uint(int(reinterpretedBits2));
    if (!(((int(gl_GlobalInvocationID.x) >= int(uint(int(reinterpretedBits1)))) || (int(gl_GlobalInvocationID.y) >= int(scalarValue4))) || (int(gl_GlobalInvocationID.z) >= int(uint(int(reinterpretedBits3))))))
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits44 = floatBitsToUint(computeVectorConstants0.packedValues[18u]);
    float reinterpretedBits63 = uintBitsToFloat(reinterpretedBits44.x);
    float reinterpretedBits64 = uintBitsToFloat(reinterpretedBits44.y);
    float reinterpretedBits65 = uintBitsToFloat(reinterpretedBits44.z);
    uint scalarValue23 = uint(int(reinterpretedBits64));
    if (!(((int(gl_GlobalInvocationID.x) >= int(uint(int(reinterpretedBits63)))) || (int(gl_GlobalInvocationID.y) >= int(scalarValue23))) || (int(gl_GlobalInvocationID.z) >= int(uint(int(reinterpretedBits65))))))
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits71 = floatBitsToUint(computeVectorConstants0.packedValues[17u]);
    float reinterpretedBits110 = uintBitsToFloat(reinterpretedBits71.x);
    float reinterpretedBits111 = uintBitsToFloat(reinterpretedBits71.y);
    float reinterpretedBits112 = uintBitsToFloat(reinterpretedBits71.z);
    uint scalarValue60 = uint(int(reinterpretedBits111));
    if (!(((int(gl_GlobalInvocationID.x) >= int(uint(int(reinterpretedBits110)))) || (int(gl_GlobalInvocationID.y) >= int(scalarValue60))) || (int(gl_GlobalInvocationID.z) >= int(uint(int(reinterpretedBits112))))))
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits120 = floatBitsToUint(computeVectorConstants0.packedValues[19u]);
    float reinterpretedBits136 = uintBitsToFloat(reinterpretedBits120.x);
    float reinterpretedBits137 = uintBitsToFloat(reinterpretedBits120.y);
    float reinterpretedBits138 = uintBitsToFloat(reinterpretedBits120.z);
    uint scalarValue106 = uint(int(reinterpretedBits137));
    if (!(((int(gl_GlobalInvocationID.x) >= int(uint(int(reinterpretedBits136)))) || (int(gl_GlobalInvocationID.y) >= int(scalarValue106))) || (int(gl_GlobalInvocationID.z) >= int(uint(int(reinterpretedBits138))))))
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if (!((int(gl_GlobalInvocationID.z) >= int(uint(int(computeVectorConstants0.packedValues[16u].z)))) || ((int(gl_GlobalInvocationID.x) >= int(uint(int(computeVectorConstants0.packedValues[16u].x)))) || (int(gl_GlobalInvocationID.y) >= int(uint(int(computeVectorConstants0.packedValues[16u].y)))))))
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    if (!((int(gl_GlobalInvocationID.z) >= int(uint(int(computeVectorConstants0.packedValues[18u].z)))) || ((int(gl_GlobalInvocationID.x) >= int(uint(int(computeVectorConstants0.packedValues[18u].x)))) || (int(gl_GlobalInvocationID.y) >= int(uint(int(computeVectorConstants0.packedValues[18u].y)))))))
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if (!((int(gl_GlobalInvocationID.z) >= int(uint(int(computeVectorConstants0.packedValues[17u].z)))) || ((int(gl_GlobalInvocationID.x) >= int(uint(int(computeVectorConstants0.packedValues[17u].x)))) || (int(gl_GlobalInvocationID.y) >= int(uint(int(computeVectorConstants0.packedValues[17u].y)))))))
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    if (!((int(gl_GlobalInvocationID.z) >= int(uint(int(computeVectorConstants0.packedValues[19u].z)))) || ((int(gl_GlobalInvocationID.x) >= int(uint(int(computeVectorConstants0.packedValues[19u].x)))) || (int(gl_GlobalInvocationID.y) >= int(uint(int(computeVectorConstants0.packedValues[19u].y)))))))
#endif
    {
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue7 = (rdSignedBitsToFloat(gl_GlobalInvocationID.x) + 0.5) / reinterpretedBits1;
        float quotientValue8 = (rdSignedBitsToFloat(gl_GlobalInvocationID.y) + 0.5) / reinterpretedBits2;
        float quotientValue9 = (rdSignedBitsToFloat(gl_GlobalInvocationID.z) + 0.5) / reinterpretedBits3;
        float multiplyAddValue11 = fma(quotientValue7, 2.0, -1.0);
        float multiplyAddValue16 = fma(quotientValue8, 2.0, -1.0);
        float exponentialValue1 = exp2(quotientValue9 * 5.770780086517333984375);
        uvec4 reinterpretedBits4 = floatBitsToUint(computeVectorConstants0.packedValues[2u]);
        float multiplyAddValue17 = -fma(fma(1.0 - exponentialValue1, 0.0186573602259159088134765625, 1.0), uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[124u])), ((exponentialValue1 - 1.0) * 0.0186573602259159088134765625) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[125u])));
        uvec4 reinterpretedBits5 = floatBitsToUint(computeVectorConstants0.packedValues[3u]);
        float multiplyAddValue18 = fma(uintBitsToFloat(reinterpretedBits4.z), multiplyAddValue17, uintBitsToFloat(reinterpretedBits5.z)) / fma(uintBitsToFloat(reinterpretedBits4.w), multiplyAddValue17, uintBitsToFloat(reinterpretedBits5.w));
        uvec4 reinterpretedBits6 = floatBitsToUint(computeVectorConstants0.packedValues[10u]);
        uvec4 reinterpretedBits7 = floatBitsToUint(computeVectorConstants0.packedValues[9u]);
        uvec4 reinterpretedBits8 = floatBitsToUint(computeVectorConstants0.packedValues[11u]);
        uvec4 reinterpretedBits9 = floatBitsToUint(computeVectorConstants0.packedValues[12u]);
        float multiplyAddValue19 = fma(uintBitsToFloat(reinterpretedBits8.w), multiplyAddValue18, fma(uintBitsToFloat(reinterpretedBits7.w), multiplyAddValue11, multiplyAddValue16 * uintBitsToFloat(reinterpretedBits6.w))) + uintBitsToFloat(reinterpretedBits9.w);
        float multiplyAddValue20 = (fma(uintBitsToFloat(reinterpretedBits8.x), multiplyAddValue18, fma(uintBitsToFloat(reinterpretedBits7.x), multiplyAddValue11, multiplyAddValue16 * uintBitsToFloat(reinterpretedBits6.x))) + uintBitsToFloat(reinterpretedBits9.x)) / multiplyAddValue19;
        float multiplyAddValue21 = (fma(uintBitsToFloat(reinterpretedBits8.y), multiplyAddValue18, fma(uintBitsToFloat(reinterpretedBits7.y), multiplyAddValue11, multiplyAddValue16 * uintBitsToFloat(reinterpretedBits6.y))) + uintBitsToFloat(reinterpretedBits9.y)) / multiplyAddValue19;
        float multiplyAddValue22 = (fma(uintBitsToFloat(reinterpretedBits8.z), multiplyAddValue18, fma(uintBitsToFloat(reinterpretedBits7.z), multiplyAddValue11, multiplyAddValue16 * uintBitsToFloat(reinterpretedBits6.z))) + uintBitsToFloat(reinterpretedBits9.z)) / multiplyAddValue19;
        uvec4 reinterpretedBits10 = floatBitsToUint(computeVectorConstants0.packedValues[6u]);
        float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits10.x);
        float reinterpretedBits12 = uintBitsToFloat(reinterpretedBits10.y);
        float reinterpretedBits13 = uintBitsToFloat(reinterpretedBits10.z);
        uvec4 reinterpretedBits14 = floatBitsToUint(computeVectorConstants0.packedValues[5u]);
        float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits14.x);
        float reinterpretedBits16 = uintBitsToFloat(reinterpretedBits14.y);
        float reinterpretedBits17 = uintBitsToFloat(reinterpretedBits14.z);
        uvec4 reinterpretedBits18 = floatBitsToUint(computeVectorConstants0.packedValues[7u]);
        float reinterpretedBits19 = uintBitsToFloat(reinterpretedBits18.x);
        float reinterpretedBits20 = uintBitsToFloat(reinterpretedBits18.y);
        float reinterpretedBits21 = uintBitsToFloat(reinterpretedBits18.z);
        uvec4 reinterpretedBits22 = floatBitsToUint(computeVectorConstants0.packedValues[8u]);
        float reinterpretedBits23 = uintBitsToFloat(reinterpretedBits22.x);
        float reinterpretedBits24 = uintBitsToFloat(reinterpretedBits22.y);
        float reinterpretedBits25 = uintBitsToFloat(reinterpretedBits22.z);
        float multiplyAddValue23 = fma(reinterpretedBits19, multiplyAddValue22, fma(reinterpretedBits15, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits11)) + reinterpretedBits23;
        float multiplyAddValue24 = fma(reinterpretedBits20, multiplyAddValue22, fma(reinterpretedBits16, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits12)) + reinterpretedBits24;
        float multiplyAddValue25 = fma(reinterpretedBits21, multiplyAddValue22, fma(reinterpretedBits17, multiplyAddValue20, multiplyAddValue21 * reinterpretedBits13)) + reinterpretedBits25;
        uint sumValue10 = (scalarValue4 - 1u) - gl_GlobalInvocationID.y;
        vec4 sampledTextureValue15 = texelFetch(materialTexture5, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue10)), int(0u));
        float scalarValue5 = sampledTextureValue15.x;
        float scalarValue6 = sampledTextureValue15.y;
        float multiplyAddValue26 = spvNClamp((fma((quotientValue9 - scalarValue5) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[66u])), scalarValue6, -uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[89u]))) / uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[90u]))) + 0.5, 0.0, 1.0);
        float sampledTextureValue16 = ((quotientValue9 - texelFetch(materialTexture4, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue10)), int(0u)).x) >= 0.0) ? 0.0 : ((multiplyAddValue26 * multiplyAddValue26) * fma(multiplyAddValue26, -2.0, 3.0));
        float reinterpretedBits26 = (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[88u])) != 0.0) ? (1.0 - sampledTextureValue16) : sampledTextureValue16;
        bool reinterpretedBits27 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[60u])) > 0.0;
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue25;
        if (reinterpretedBits27)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue27 = (rdSignedBitsToFloat(gl_GlobalInvocationID.x) + 0.5) / reinterpretedBits63;
        float quotientValue28 = (rdSignedBitsToFloat(gl_GlobalInvocationID.y) + 0.5) / reinterpretedBits64;
        float quotientValue29 = (rdSignedBitsToFloat(gl_GlobalInvocationID.z) + 0.5) / reinterpretedBits65;
        float multiplyAddValue73 = fma(quotientValue27, 2.0, -1.0);
        float multiplyAddValue74 = fma(quotientValue28, 2.0, -1.0);
        float exponentialValue3 = exp2(quotientValue29 * 5.770780086517333984375);
        uvec4 reinterpretedBits4 = floatBitsToUint(computeVectorConstants0.packedValues[2u]);
        float multiplyAddValue75 = -fma(fma(1.0 - exponentialValue3, 0.0186573602259159088134765625, 1.0), uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[176u])), ((exponentialValue3 - 1.0) * 0.0186573602259159088134765625) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[177u])));
        uvec4 reinterpretedBits5 = floatBitsToUint(computeVectorConstants0.packedValues[3u]);
        float multiplyAddValue76 = fma(uintBitsToFloat(reinterpretedBits4.z), multiplyAddValue75, uintBitsToFloat(reinterpretedBits5.z)) / fma(uintBitsToFloat(reinterpretedBits4.w), multiplyAddValue75, uintBitsToFloat(reinterpretedBits5.w));
        uvec4 reinterpretedBits6 = floatBitsToUint(computeVectorConstants0.packedValues[10u]);
        uvec4 reinterpretedBits7 = floatBitsToUint(computeVectorConstants0.packedValues[9u]);
        uvec4 reinterpretedBits8 = floatBitsToUint(computeVectorConstants0.packedValues[11u]);
        uvec4 reinterpretedBits9 = floatBitsToUint(computeVectorConstants0.packedValues[12u]);
        float multiplyAddValue77 = fma(uintBitsToFloat(reinterpretedBits8.w), multiplyAddValue76, fma(uintBitsToFloat(reinterpretedBits7.w), multiplyAddValue73, multiplyAddValue74 * uintBitsToFloat(reinterpretedBits6.w))) + uintBitsToFloat(reinterpretedBits9.w);
        float multiplyAddValue78 = (fma(uintBitsToFloat(reinterpretedBits8.x), multiplyAddValue76, fma(uintBitsToFloat(reinterpretedBits7.x), multiplyAddValue73, multiplyAddValue74 * uintBitsToFloat(reinterpretedBits6.x))) + uintBitsToFloat(reinterpretedBits9.x)) / multiplyAddValue77;
        float multiplyAddValue79 = (fma(uintBitsToFloat(reinterpretedBits8.y), multiplyAddValue76, fma(uintBitsToFloat(reinterpretedBits7.y), multiplyAddValue73, multiplyAddValue74 * uintBitsToFloat(reinterpretedBits6.y))) + uintBitsToFloat(reinterpretedBits9.y)) / multiplyAddValue77;
        float multiplyAddValue80 = (fma(uintBitsToFloat(reinterpretedBits8.z), multiplyAddValue76, fma(uintBitsToFloat(reinterpretedBits7.z), multiplyAddValue73, multiplyAddValue74 * uintBitsToFloat(reinterpretedBits6.z))) + uintBitsToFloat(reinterpretedBits9.z)) / multiplyAddValue77;
        uvec4 reinterpretedBits10 = floatBitsToUint(computeVectorConstants0.packedValues[6u]);
        float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits10.x);
        float reinterpretedBits12 = uintBitsToFloat(reinterpretedBits10.y);
        float reinterpretedBits13 = uintBitsToFloat(reinterpretedBits10.z);
        uvec4 reinterpretedBits14 = floatBitsToUint(computeVectorConstants0.packedValues[5u]);
        float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits14.x);
        float reinterpretedBits16 = uintBitsToFloat(reinterpretedBits14.y);
        float reinterpretedBits17 = uintBitsToFloat(reinterpretedBits14.z);
        uvec4 reinterpretedBits18 = floatBitsToUint(computeVectorConstants0.packedValues[7u]);
        float reinterpretedBits19 = uintBitsToFloat(reinterpretedBits18.x);
        float reinterpretedBits20 = uintBitsToFloat(reinterpretedBits18.y);
        float reinterpretedBits21 = uintBitsToFloat(reinterpretedBits18.z);
        uvec4 reinterpretedBits22 = floatBitsToUint(computeVectorConstants0.packedValues[8u]);
        float reinterpretedBits23 = uintBitsToFloat(reinterpretedBits22.x);
        float reinterpretedBits24 = uintBitsToFloat(reinterpretedBits22.y);
        float reinterpretedBits25 = uintBitsToFloat(reinterpretedBits22.z);
        float multiplyAddValue81 = fma(reinterpretedBits19, multiplyAddValue80, fma(reinterpretedBits15, multiplyAddValue78, multiplyAddValue79 * reinterpretedBits11)) + reinterpretedBits23;
        float multiplyAddValue82 = fma(reinterpretedBits20, multiplyAddValue80, fma(reinterpretedBits16, multiplyAddValue78, multiplyAddValue79 * reinterpretedBits12)) + reinterpretedBits24;
        float multiplyAddValue83 = fma(reinterpretedBits21, multiplyAddValue80, fma(reinterpretedBits17, multiplyAddValue78, multiplyAddValue79 * reinterpretedBits13)) + reinterpretedBits25;
        uint sumValue69 = (scalarValue23 - 1u) - gl_GlobalInvocationID.y;
        vec4 sampledTextureValue56 = texelFetch(materialTexture5, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue69)), int(0u));
        float multiplyAddValue84 = spvNClamp((fma((quotientValue29 - sampledTextureValue56.x) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[74u])), sampledTextureValue56.y, -uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[101u]))) / uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[102u]))) + 0.5, 0.0, 1.0);
        float sampledTextureValue57 = ((quotientValue29 - texelFetch(materialTexture4, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue69)), int(0u)).x) >= 0.0) ? 0.0 : ((multiplyAddValue84 * multiplyAddValue84) * fma(multiplyAddValue84, -2.0, 3.0));
        float reinterpretedBits66 = (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[100u])) != 0.0) ? (1.0 - sampledTextureValue57) : sampledTextureValue57;
        bool reinterpretedBits67 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[68u])) > 0.0;
        float intermediateValue23;
        float intermediateValue25;
        float intermediateValue26;
        float intermediateValue27;
        if (reinterpretedBits67)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue43 = (rdSignedBitsToFloat(gl_GlobalInvocationID.x) + 0.5) / reinterpretedBits110;
        float quotientValue44 = (rdSignedBitsToFloat(gl_GlobalInvocationID.y) + 0.5) / reinterpretedBits111;
        float quotientValue45 = (rdSignedBitsToFloat(gl_GlobalInvocationID.z) + 0.5) / reinterpretedBits112;
        float multiplyAddValue122 = fma(quotientValue43, 2.0, -1.0);
        float multiplyAddValue123 = fma(quotientValue44, 2.0, -1.0);
        float exponentialValue5 = exp2(quotientValue45 * 5.770780086517333984375);
        uvec4 reinterpretedBits4 = floatBitsToUint(computeVectorConstants0.packedValues[2u]);
        float multiplyAddValue124 = -fma(fma(1.0 - exponentialValue5, 0.0186573602259159088134765625, 1.0), uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[136u])), ((exponentialValue5 - 1.0) * 0.0186573602259159088134765625) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[137u])));
        uvec4 reinterpretedBits5 = floatBitsToUint(computeVectorConstants0.packedValues[3u]);
        float multiplyAddValue125 = fma(uintBitsToFloat(reinterpretedBits4.z), multiplyAddValue124, uintBitsToFloat(reinterpretedBits5.z)) / fma(uintBitsToFloat(reinterpretedBits4.w), multiplyAddValue124, uintBitsToFloat(reinterpretedBits5.w));
        uvec4 reinterpretedBits6 = floatBitsToUint(computeVectorConstants0.packedValues[10u]);
        uvec4 reinterpretedBits7 = floatBitsToUint(computeVectorConstants0.packedValues[9u]);
        uvec4 reinterpretedBits8 = floatBitsToUint(computeVectorConstants0.packedValues[11u]);
        uvec4 reinterpretedBits9 = floatBitsToUint(computeVectorConstants0.packedValues[12u]);
        float multiplyAddValue126 = fma(uintBitsToFloat(reinterpretedBits8.w), multiplyAddValue125, fma(uintBitsToFloat(reinterpretedBits7.w), multiplyAddValue122, multiplyAddValue123 * uintBitsToFloat(reinterpretedBits6.w))) + uintBitsToFloat(reinterpretedBits9.w);
        float multiplyAddValue127 = (fma(uintBitsToFloat(reinterpretedBits8.x), multiplyAddValue125, fma(uintBitsToFloat(reinterpretedBits7.x), multiplyAddValue122, multiplyAddValue123 * uintBitsToFloat(reinterpretedBits6.x))) + uintBitsToFloat(reinterpretedBits9.x)) / multiplyAddValue126;
        float multiplyAddValue128 = (fma(uintBitsToFloat(reinterpretedBits8.y), multiplyAddValue125, fma(uintBitsToFloat(reinterpretedBits7.y), multiplyAddValue122, multiplyAddValue123 * uintBitsToFloat(reinterpretedBits6.y))) + uintBitsToFloat(reinterpretedBits9.y)) / multiplyAddValue126;
        float multiplyAddValue129 = (fma(uintBitsToFloat(reinterpretedBits8.z), multiplyAddValue125, fma(uintBitsToFloat(reinterpretedBits7.z), multiplyAddValue122, multiplyAddValue123 * uintBitsToFloat(reinterpretedBits6.z))) + uintBitsToFloat(reinterpretedBits9.z)) / multiplyAddValue126;
        uvec4 reinterpretedBits10 = floatBitsToUint(computeVectorConstants0.packedValues[6u]);
        float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits10.x);
        float reinterpretedBits12 = uintBitsToFloat(reinterpretedBits10.y);
        float reinterpretedBits13 = uintBitsToFloat(reinterpretedBits10.z);
        uvec4 reinterpretedBits14 = floatBitsToUint(computeVectorConstants0.packedValues[5u]);
        float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits14.x);
        float reinterpretedBits16 = uintBitsToFloat(reinterpretedBits14.y);
        float reinterpretedBits17 = uintBitsToFloat(reinterpretedBits14.z);
        uvec4 reinterpretedBits18 = floatBitsToUint(computeVectorConstants0.packedValues[7u]);
        float reinterpretedBits19 = uintBitsToFloat(reinterpretedBits18.x);
        float reinterpretedBits20 = uintBitsToFloat(reinterpretedBits18.y);
        float reinterpretedBits21 = uintBitsToFloat(reinterpretedBits18.z);
        uvec4 reinterpretedBits22 = floatBitsToUint(computeVectorConstants0.packedValues[8u]);
        float reinterpretedBits23 = uintBitsToFloat(reinterpretedBits22.x);
        float reinterpretedBits24 = uintBitsToFloat(reinterpretedBits22.y);
        float reinterpretedBits25 = uintBitsToFloat(reinterpretedBits22.z);
        float multiplyAddValue130 = fma(reinterpretedBits19, multiplyAddValue129, fma(reinterpretedBits15, multiplyAddValue127, multiplyAddValue128 * reinterpretedBits11)) + reinterpretedBits23;
        float multiplyAddValue131 = fma(reinterpretedBits20, multiplyAddValue129, fma(reinterpretedBits16, multiplyAddValue127, multiplyAddValue128 * reinterpretedBits12)) + reinterpretedBits24;
        float multiplyAddValue132 = fma(reinterpretedBits21, multiplyAddValue129, fma(reinterpretedBits17, multiplyAddValue127, multiplyAddValue128 * reinterpretedBits13)) + reinterpretedBits25;
        uint sumValue111 = (scalarValue60 - 1u) - gl_GlobalInvocationID.y;
        vec4 sampledTextureValue103 = texelFetch(materialTexture5, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue111)), int(0u));
        float multiplyAddValue133 = spvNClamp((fma((quotientValue45 - sampledTextureValue103.x) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[70u])), sampledTextureValue103.y, -uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[93u]))) / uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[94u]))) + 0.5, 0.0, 1.0);
        float sampledTextureValue104 = ((quotientValue45 - texelFetch(materialTexture4, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue111)), int(0u)).x) >= 0.0) ? 0.0 : ((multiplyAddValue133 * multiplyAddValue133) * fma(multiplyAddValue133, -2.0, 3.0));
        float reinterpretedBits113 = (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[92u])) != 0.0) ? (1.0 - sampledTextureValue104) : sampledTextureValue104;
        bool reinterpretedBits114 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[64u])) > 0.0;
        float intermediateValue23;
        float intermediateValue25;
        float intermediateValue26;
        float intermediateValue27;
        if (reinterpretedBits114)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue63 = (rdSignedBitsToFloat(gl_GlobalInvocationID.x) + 0.5) / reinterpretedBits136;
        float quotientValue64 = (rdSignedBitsToFloat(gl_GlobalInvocationID.y) + 0.5) / reinterpretedBits137;
        float quotientValue65 = (rdSignedBitsToFloat(gl_GlobalInvocationID.z) + 0.5) / reinterpretedBits138;
        float multiplyAddValue175 = fma(quotientValue63, 2.0, -1.0);
        float multiplyAddValue176 = fma(quotientValue64, 2.0, -1.0);
        float exponentialValue7 = exp2(quotientValue65 * 5.770780086517333984375);
        uvec4 reinterpretedBits4 = floatBitsToUint(computeVectorConstants0.packedValues[2u]);
        float multiplyAddValue177 = -fma(fma(1.0 - exponentialValue7, 0.0186573602259159088134765625, 1.0), uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[188u])), ((exponentialValue7 - 1.0) * 0.0186573602259159088134765625) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[189u])));
        uvec4 reinterpretedBits5 = floatBitsToUint(computeVectorConstants0.packedValues[3u]);
        float multiplyAddValue178 = fma(uintBitsToFloat(reinterpretedBits4.z), multiplyAddValue177, uintBitsToFloat(reinterpretedBits5.z)) / fma(uintBitsToFloat(reinterpretedBits4.w), multiplyAddValue177, uintBitsToFloat(reinterpretedBits5.w));
        uvec4 reinterpretedBits6 = floatBitsToUint(computeVectorConstants0.packedValues[10u]);
        uvec4 reinterpretedBits7 = floatBitsToUint(computeVectorConstants0.packedValues[9u]);
        uvec4 reinterpretedBits8 = floatBitsToUint(computeVectorConstants0.packedValues[11u]);
        uvec4 reinterpretedBits9 = floatBitsToUint(computeVectorConstants0.packedValues[12u]);
        float multiplyAddValue179 = fma(uintBitsToFloat(reinterpretedBits8.w), multiplyAddValue178, fma(uintBitsToFloat(reinterpretedBits7.w), multiplyAddValue175, multiplyAddValue176 * uintBitsToFloat(reinterpretedBits6.w))) + uintBitsToFloat(reinterpretedBits9.w);
        float multiplyAddValue180 = (fma(uintBitsToFloat(reinterpretedBits8.x), multiplyAddValue178, fma(uintBitsToFloat(reinterpretedBits7.x), multiplyAddValue175, multiplyAddValue176 * uintBitsToFloat(reinterpretedBits6.x))) + uintBitsToFloat(reinterpretedBits9.x)) / multiplyAddValue179;
        float multiplyAddValue181 = (fma(uintBitsToFloat(reinterpretedBits8.y), multiplyAddValue178, fma(uintBitsToFloat(reinterpretedBits7.y), multiplyAddValue175, multiplyAddValue176 * uintBitsToFloat(reinterpretedBits6.y))) + uintBitsToFloat(reinterpretedBits9.y)) / multiplyAddValue179;
        float multiplyAddValue182 = (fma(uintBitsToFloat(reinterpretedBits8.z), multiplyAddValue178, fma(uintBitsToFloat(reinterpretedBits7.z), multiplyAddValue175, multiplyAddValue176 * uintBitsToFloat(reinterpretedBits6.z))) + uintBitsToFloat(reinterpretedBits9.z)) / multiplyAddValue179;
        uvec4 reinterpretedBits10 = floatBitsToUint(computeVectorConstants0.packedValues[6u]);
        float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits10.x);
        float reinterpretedBits12 = uintBitsToFloat(reinterpretedBits10.y);
        float reinterpretedBits13 = uintBitsToFloat(reinterpretedBits10.z);
        uvec4 reinterpretedBits14 = floatBitsToUint(computeVectorConstants0.packedValues[5u]);
        float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits14.x);
        float reinterpretedBits16 = uintBitsToFloat(reinterpretedBits14.y);
        float reinterpretedBits17 = uintBitsToFloat(reinterpretedBits14.z);
        uvec4 reinterpretedBits18 = floatBitsToUint(computeVectorConstants0.packedValues[7u]);
        float reinterpretedBits19 = uintBitsToFloat(reinterpretedBits18.x);
        float reinterpretedBits20 = uintBitsToFloat(reinterpretedBits18.y);
        float reinterpretedBits21 = uintBitsToFloat(reinterpretedBits18.z);
        uvec4 reinterpretedBits22 = floatBitsToUint(computeVectorConstants0.packedValues[8u]);
        float reinterpretedBits23 = uintBitsToFloat(reinterpretedBits22.x);
        float reinterpretedBits24 = uintBitsToFloat(reinterpretedBits22.y);
        float reinterpretedBits25 = uintBitsToFloat(reinterpretedBits22.z);
        float multiplyAddValue183 = fma(reinterpretedBits19, multiplyAddValue182, fma(reinterpretedBits15, multiplyAddValue180, multiplyAddValue181 * reinterpretedBits11)) + reinterpretedBits23;
        float multiplyAddValue184 = fma(reinterpretedBits20, multiplyAddValue182, fma(reinterpretedBits16, multiplyAddValue180, multiplyAddValue181 * reinterpretedBits12)) + reinterpretedBits24;
        float multiplyAddValue185 = fma(reinterpretedBits21, multiplyAddValue182, fma(reinterpretedBits17, multiplyAddValue180, multiplyAddValue181 * reinterpretedBits13)) + reinterpretedBits25;
        uint sumValue173 = (scalarValue106 - 1u) - gl_GlobalInvocationID.y;
        vec4 sampledTextureValue151 = texelFetch(materialTexture5, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue173)), int(0u));
        float multiplyAddValue186 = spvNClamp((fma((quotientValue65 - sampledTextureValue151.x) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[78u])), sampledTextureValue151.y, -uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[105u]))) / uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[106u]))) + 0.5, 0.0, 1.0);
        float sampledTextureValue152 = ((quotientValue65 - texelFetch(materialTexture4, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue173)), int(0u)).x) >= 0.0) ? 0.0 : ((multiplyAddValue186 * multiplyAddValue186) * fma(multiplyAddValue186, -2.0, 3.0));
        float reinterpretedBits139 = (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[104u])) != 0.0) ? (1.0 - sampledTextureValue152) : sampledTextureValue152;
        bool reinterpretedBits140 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[72u])) > 0.0;
        float intermediateValue26;
        float intermediateValue28;
        float intermediateValue29;
        float intermediateValue30;
        if (reinterpretedBits140)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue = (float(int(gl_GlobalInvocationID.x)) + 0.5) / computeVectorConstants0.packedValues[16u].x;
        float quotientValue1 = (float(int(gl_GlobalInvocationID.y)) + 0.5) / computeVectorConstants0.packedValues[16u].y;
        float quotientValue2 = (float(int(gl_GlobalInvocationID.z)) + 0.5) / computeVectorConstants0.packedValues[16u].z;
        float productValue = (quotientValue * 2.0) + (-1.0);
        float productValue1 = (quotientValue1 * 2.0) + (-1.0);
        float exponentialValue = (exp2(quotientValue2 * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625;
        float productValue2 = (-0.0) - ((exponentialValue * computeVectorConstants0.packedValues[31u].y) + ((1.0 - exponentialValue) * computeVectorConstants0.packedValues[31u].x));
        float multiplyAddValue = (fma(computeVectorConstants0.packedValues[2u].z, productValue2, 0.0) + computeVectorConstants0.packedValues[3u].z) / (fma(computeVectorConstants0.packedValues[2u].w, productValue2, 0.0) + computeVectorConstants0.packedValues[3u].w);
        float multiplyAddValue1 = fma(computeVectorConstants0.packedValues[11u].w, multiplyAddValue, fma(computeVectorConstants0.packedValues[10u].w, productValue1, productValue * computeVectorConstants0.packedValues[9u].w)) + computeVectorConstants0.packedValues[12u].w;
        float multiplyAddValue2 = (fma(computeVectorConstants0.packedValues[11u].x, multiplyAddValue, fma(computeVectorConstants0.packedValues[10u].x, productValue1, productValue * computeVectorConstants0.packedValues[9u].x)) + computeVectorConstants0.packedValues[12u].x) / multiplyAddValue1;
        float multiplyAddValue3 = (fma(computeVectorConstants0.packedValues[11u].y, multiplyAddValue, fma(computeVectorConstants0.packedValues[10u].y, productValue1, productValue * computeVectorConstants0.packedValues[9u].y)) + computeVectorConstants0.packedValues[12u].y) / multiplyAddValue1;
        float multiplyAddValue4 = (fma(computeVectorConstants0.packedValues[11u].z, multiplyAddValue, fma(computeVectorConstants0.packedValues[10u].z, productValue1, productValue * computeVectorConstants0.packedValues[9u].z)) + computeVectorConstants0.packedValues[12u].z) / multiplyAddValue1;
        float multiplyAddValue5 = fma(computeVectorConstants0.packedValues[7u].x, multiplyAddValue4, fma(computeVectorConstants0.packedValues[6u].x, multiplyAddValue3, multiplyAddValue2 * computeVectorConstants0.packedValues[5u].x)) + computeVectorConstants0.packedValues[8u].x;
        float multiplyAddValue6 = fma(computeVectorConstants0.packedValues[7u].y, multiplyAddValue4, fma(computeVectorConstants0.packedValues[6u].y, multiplyAddValue3, multiplyAddValue2 * computeVectorConstants0.packedValues[5u].y)) + computeVectorConstants0.packedValues[8u].y;
        float multiplyAddValue7 = fma(computeVectorConstants0.packedValues[7u].z, multiplyAddValue4, fma(computeVectorConstants0.packedValues[6u].z, multiplyAddValue3, multiplyAddValue2 * computeVectorConstants0.packedValues[5u].z)) + computeVectorConstants0.packedValues[8u].z;
        uint sumValue = uint(int(computeVectorConstants0.packedValues[16u].y)) + (~gl_GlobalInvocationID.y);
        vec4 sampledTextureValue = texelFetch(screenSpaceWaterFrontFaceDepthAndNormalTexture, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue)), int(0u));
        float quotientValue3 = spvNClamp(((((sampledTextureValue.y * computeVectorConstants0.packedValues[16u].z) * (quotientValue2 - sampledTextureValue.x)) - computeVectorConstants0.packedValues[22u].y) / computeVectorConstants0.packedValues[22u].z) + 0.5, 0.0, 1.0);
        float productValue3 = (quotientValue3 * quotientValue3) * (3.0 - (quotientValue3 * 2.0));
        float sampledTextureValue1 = (((quotientValue2 - texelFetch(screenSpaceWaterBackFaceDepthAndNormalTexture, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue)), int(0u)).x) >= 0.0) && (productValue3 >= 0.0)) ? 0.0 : productValue3;
        float comparisonValue = (computeVectorConstants0.packedValues[22u].x != 0.0) ? (1.0 - sampledTextureValue1) : sampledTextureValue1;
        float intermediateValue4;
        float intermediateValue5;
        float intermediateValue6;
        float intermediateValue7;
        if (computeVectorConstants0.packedValues[15u].x > 0.0)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue10 = (float(int(gl_GlobalInvocationID.x)) + 0.5) / computeVectorConstants0.packedValues[18u].x;
        float quotientValue11 = (float(int(gl_GlobalInvocationID.y)) + 0.5) / computeVectorConstants0.packedValues[18u].y;
        float quotientValue12 = (float(int(gl_GlobalInvocationID.z)) + 0.5) / computeVectorConstants0.packedValues[18u].z;
        float productValue71 = (quotientValue10 * 2.0) + (-1.0);
        float productValue72 = (quotientValue11 * 2.0) + (-1.0);
        float exponentialValue2 = (exp2(quotientValue12 * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625;
        float productValue73 = (-0.0) - ((exponentialValue2 * computeVectorConstants0.packedValues[44u].y) + ((1.0 - exponentialValue2) * computeVectorConstants0.packedValues[44u].x));
        float multiplyAddValue60 = (fma(computeVectorConstants0.packedValues[2u].z, productValue73, 0.0) + computeVectorConstants0.packedValues[3u].z) / (fma(computeVectorConstants0.packedValues[2u].w, productValue73, 0.0) + computeVectorConstants0.packedValues[3u].w);
        float multiplyAddValue61 = fma(computeVectorConstants0.packedValues[11u].w, multiplyAddValue60, fma(computeVectorConstants0.packedValues[10u].w, productValue72, productValue71 * computeVectorConstants0.packedValues[9u].w)) + computeVectorConstants0.packedValues[12u].w;
        float multiplyAddValue62 = (fma(computeVectorConstants0.packedValues[11u].x, multiplyAddValue60, fma(computeVectorConstants0.packedValues[10u].x, productValue72, productValue71 * computeVectorConstants0.packedValues[9u].x)) + computeVectorConstants0.packedValues[12u].x) / multiplyAddValue61;
        float multiplyAddValue63 = (fma(computeVectorConstants0.packedValues[11u].y, multiplyAddValue60, fma(computeVectorConstants0.packedValues[10u].y, productValue72, productValue71 * computeVectorConstants0.packedValues[9u].y)) + computeVectorConstants0.packedValues[12u].y) / multiplyAddValue61;
        float multiplyAddValue64 = (fma(computeVectorConstants0.packedValues[11u].z, multiplyAddValue60, fma(computeVectorConstants0.packedValues[10u].z, productValue72, productValue71 * computeVectorConstants0.packedValues[9u].z)) + computeVectorConstants0.packedValues[12u].z) / multiplyAddValue61;
        float multiplyAddValue65 = fma(computeVectorConstants0.packedValues[7u].x, multiplyAddValue64, fma(computeVectorConstants0.packedValues[6u].x, multiplyAddValue63, multiplyAddValue62 * computeVectorConstants0.packedValues[5u].x));
        float sumValue17 = multiplyAddValue65 + computeVectorConstants0.packedValues[8u].x;
        float multiplyAddValue66 = fma(computeVectorConstants0.packedValues[7u].y, multiplyAddValue64, fma(computeVectorConstants0.packedValues[6u].y, multiplyAddValue63, multiplyAddValue62 * computeVectorConstants0.packedValues[5u].y));
        float sumValue18 = multiplyAddValue66 + computeVectorConstants0.packedValues[8u].y;
        float multiplyAddValue67 = fma(computeVectorConstants0.packedValues[7u].z, multiplyAddValue64, fma(computeVectorConstants0.packedValues[6u].z, multiplyAddValue63, multiplyAddValue62 * computeVectorConstants0.packedValues[5u].z));
        float sumValue43 = multiplyAddValue67 + computeVectorConstants0.packedValues[8u].z;
        uint sumValue44 = uint(int(computeVectorConstants0.packedValues[18u].y)) + (~gl_GlobalInvocationID.y);
        vec4 sampledTextureValue33 = texelFetch(screenSpaceWaterFrontFaceDepthAndNormalTexture, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue44)), int(0u));
        float quotientValue13 = spvNClamp(((((sampledTextureValue33.y * computeVectorConstants0.packedValues[18u].z) * (quotientValue12 - sampledTextureValue33.x)) - computeVectorConstants0.packedValues[25u].y) / computeVectorConstants0.packedValues[25u].z) + 0.5, 0.0, 1.0);
        float productValue74 = (quotientValue13 * quotientValue13) * (3.0 - (quotientValue13 * 2.0));
        float sampledTextureValue34 = (((quotientValue12 - texelFetch(screenSpaceWaterBackFaceDepthAndNormalTexture, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue44)), int(0u)).x) >= 0.0) && (productValue74 >= 0.0)) ? 0.0 : productValue74;
        float comparisonValue27 = (computeVectorConstants0.packedValues[25u].x != 0.0) ? (1.0 - sampledTextureValue34) : sampledTextureValue34;
        float intermediateValue4;
        float intermediateValue5;
        float intermediateValue6;
        float intermediateValue7;
        if (computeVectorConstants0.packedValues[17u].x > 0.0)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue36 = (float(int(gl_GlobalInvocationID.x)) + 0.5) / computeVectorConstants0.packedValues[17u].x;
        float quotientValue37 = (float(int(gl_GlobalInvocationID.y)) + 0.5) / computeVectorConstants0.packedValues[17u].y;
        float quotientValue38 = (float(int(gl_GlobalInvocationID.z)) + 0.5) / computeVectorConstants0.packedValues[17u].z;
        float productValue142 = (quotientValue36 * 2.0) + (-1.0);
        float productValue143 = (quotientValue37 * 2.0) + (-1.0);
        float exponentialValue4 = (exp2(quotientValue38 * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625;
        float productValue144 = (-0.0) - ((exponentialValue4 * computeVectorConstants0.packedValues[34u].y) + ((1.0 - exponentialValue4) * computeVectorConstants0.packedValues[34u].x));
        float multiplyAddValue114 = (fma(computeVectorConstants0.packedValues[2u].z, productValue144, 0.0) + computeVectorConstants0.packedValues[3u].z) / (fma(computeVectorConstants0.packedValues[2u].w, productValue144, 0.0) + computeVectorConstants0.packedValues[3u].w);
        float multiplyAddValue115 = fma(computeVectorConstants0.packedValues[11u].w, multiplyAddValue114, fma(computeVectorConstants0.packedValues[10u].w, productValue143, productValue142 * computeVectorConstants0.packedValues[9u].w)) + computeVectorConstants0.packedValues[12u].w;
        float multiplyAddValue116 = (fma(computeVectorConstants0.packedValues[11u].x, multiplyAddValue114, fma(computeVectorConstants0.packedValues[10u].x, productValue143, productValue142 * computeVectorConstants0.packedValues[9u].x)) + computeVectorConstants0.packedValues[12u].x) / multiplyAddValue115;
        float multiplyAddValue117 = (fma(computeVectorConstants0.packedValues[11u].y, multiplyAddValue114, fma(computeVectorConstants0.packedValues[10u].y, productValue143, productValue142 * computeVectorConstants0.packedValues[9u].y)) + computeVectorConstants0.packedValues[12u].y) / multiplyAddValue115;
        float multiplyAddValue118 = (fma(computeVectorConstants0.packedValues[11u].z, multiplyAddValue114, fma(computeVectorConstants0.packedValues[10u].z, productValue143, productValue142 * computeVectorConstants0.packedValues[9u].z)) + computeVectorConstants0.packedValues[12u].z) / multiplyAddValue115;
        float multiplyAddValue119 = fma(computeVectorConstants0.packedValues[7u].x, multiplyAddValue118, fma(computeVectorConstants0.packedValues[6u].x, multiplyAddValue117, multiplyAddValue116 * computeVectorConstants0.packedValues[5u].x)) + computeVectorConstants0.packedValues[8u].x;
        float multiplyAddValue120 = fma(computeVectorConstants0.packedValues[7u].y, multiplyAddValue118, fma(computeVectorConstants0.packedValues[6u].y, multiplyAddValue117, multiplyAddValue116 * computeVectorConstants0.packedValues[5u].y)) + computeVectorConstants0.packedValues[8u].y;
        float multiplyAddValue121 = fma(computeVectorConstants0.packedValues[7u].z, multiplyAddValue118, fma(computeVectorConstants0.packedValues[6u].z, multiplyAddValue117, multiplyAddValue116 * computeVectorConstants0.packedValues[5u].z)) + computeVectorConstants0.packedValues[8u].z;
        uint sumValue88 = uint(int(computeVectorConstants0.packedValues[17u].y)) + (~gl_GlobalInvocationID.y);
        vec4 sampledTextureValue80 = texelFetch(screenSpaceWaterFrontFaceDepthAndNormalTexture, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue88)), int(0u));
        float quotientValue39 = spvNClamp(((((sampledTextureValue80.y * computeVectorConstants0.packedValues[17u].z) * (quotientValue38 - sampledTextureValue80.x)) - computeVectorConstants0.packedValues[23u].y) / computeVectorConstants0.packedValues[23u].z) + 0.5, 0.0, 1.0);
        float productValue145 = (quotientValue39 * quotientValue39) * (3.0 - (quotientValue39 * 2.0));
        float sampledTextureValue81 = (((quotientValue38 - texelFetch(screenSpaceWaterBackFaceDepthAndNormalTexture, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue88)), int(0u)).x) >= 0.0) && (productValue145 >= 0.0)) ? 0.0 : productValue145;
        float comparisonValue71 = (computeVectorConstants0.packedValues[23u].x != 0.0) ? (1.0 - sampledTextureValue81) : sampledTextureValue81;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        if (computeVectorConstants0.packedValues[16u].x > 0.0)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue46 = (float(int(gl_GlobalInvocationID.x)) + 0.5) / computeVectorConstants0.packedValues[19u].x;
        float quotientValue47 = (float(int(gl_GlobalInvocationID.y)) + 0.5) / computeVectorConstants0.packedValues[19u].y;
        float quotientValue48 = (float(int(gl_GlobalInvocationID.z)) + 0.5) / computeVectorConstants0.packedValues[19u].z;
        float productValue198 = (quotientValue46 * 2.0) + (-1.0);
        float productValue199 = (quotientValue47 * 2.0) + (-1.0);
        float exponentialValue6 = (exp2(quotientValue48 * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625;
        float productValue200 = (-0.0) - ((exponentialValue6 * computeVectorConstants0.packedValues[47u].y) + ((1.0 - exponentialValue6) * computeVectorConstants0.packedValues[47u].x));
        float multiplyAddValue163 = (fma(computeVectorConstants0.packedValues[2u].z, productValue200, 0.0) + computeVectorConstants0.packedValues[3u].z) / (fma(computeVectorConstants0.packedValues[2u].w, productValue200, 0.0) + computeVectorConstants0.packedValues[3u].w);
        float multiplyAddValue164 = fma(computeVectorConstants0.packedValues[11u].w, multiplyAddValue163, fma(computeVectorConstants0.packedValues[10u].w, productValue199, productValue198 * computeVectorConstants0.packedValues[9u].w)) + computeVectorConstants0.packedValues[12u].w;
        float multiplyAddValue165 = (fma(computeVectorConstants0.packedValues[11u].x, multiplyAddValue163, fma(computeVectorConstants0.packedValues[10u].x, productValue199, productValue198 * computeVectorConstants0.packedValues[9u].x)) + computeVectorConstants0.packedValues[12u].x) / multiplyAddValue164;
        float multiplyAddValue166 = (fma(computeVectorConstants0.packedValues[11u].y, multiplyAddValue163, fma(computeVectorConstants0.packedValues[10u].y, productValue199, productValue198 * computeVectorConstants0.packedValues[9u].y)) + computeVectorConstants0.packedValues[12u].y) / multiplyAddValue164;
        float multiplyAddValue167 = (fma(computeVectorConstants0.packedValues[11u].z, multiplyAddValue163, fma(computeVectorConstants0.packedValues[10u].z, productValue199, productValue198 * computeVectorConstants0.packedValues[9u].z)) + computeVectorConstants0.packedValues[12u].z) / multiplyAddValue164;
        float multiplyAddValue168 = fma(computeVectorConstants0.packedValues[7u].x, multiplyAddValue167, fma(computeVectorConstants0.packedValues[6u].x, multiplyAddValue166, multiplyAddValue165 * computeVectorConstants0.packedValues[5u].x));
        float sumValue136 = multiplyAddValue168 + computeVectorConstants0.packedValues[8u].x;
        float multiplyAddValue169 = fma(computeVectorConstants0.packedValues[7u].y, multiplyAddValue167, fma(computeVectorConstants0.packedValues[6u].y, multiplyAddValue166, multiplyAddValue165 * computeVectorConstants0.packedValues[5u].y));
        float sumValue137 = multiplyAddValue169 + computeVectorConstants0.packedValues[8u].y;
        float multiplyAddValue170 = fma(computeVectorConstants0.packedValues[7u].z, multiplyAddValue167, fma(computeVectorConstants0.packedValues[6u].z, multiplyAddValue166, multiplyAddValue165 * computeVectorConstants0.packedValues[5u].z));
        float sumValue138 = multiplyAddValue170 + computeVectorConstants0.packedValues[8u].z;
        uint sumValue139 = uint(int(computeVectorConstants0.packedValues[19u].y)) + (~gl_GlobalInvocationID.y);
        vec4 sampledTextureValue125 = texelFetch(screenSpaceWaterFrontFaceDepthAndNormalTexture, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue139)), int(0u));
        float quotientValue49 = spvNClamp(((((sampledTextureValue125.y * computeVectorConstants0.packedValues[19u].z) * (quotientValue48 - sampledTextureValue125.x)) - computeVectorConstants0.packedValues[26u].y) / computeVectorConstants0.packedValues[26u].z) + 0.5, 0.0, 1.0);
        float productValue201 = (quotientValue49 * quotientValue49) * (3.0 - (quotientValue49 * 2.0));
        float sampledTextureValue126 = (((quotientValue48 - texelFetch(screenSpaceWaterBackFaceDepthAndNormalTexture, ivec2(uvec2(gl_GlobalInvocationID.x, sumValue139)), int(0u)).x) >= 0.0) && (productValue201 >= 0.0)) ? 0.0 : productValue201;
        float comparisonValue112 = (computeVectorConstants0.packedValues[26u].x != 0.0) ? (1.0 - sampledTextureValue126) : sampledTextureValue126;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        if (computeVectorConstants0.packedValues[18u].x > 0.0)
#endif
        {
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            uint reinterpretedBits28 = uint(int(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[62u])) * 0.5));
            float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[19u]));
            float reinterpretedBits30 = (multiplyAddValue20 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[16u]))) / reinterpretedBits29;
            float reinterpretedBits31 = (multiplyAddValue22 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[18u]))) / reinterpretedBits29;
            uvec4 reinterpretedBits32 = floatBitsToUint(computeVectorConstants0.packedValues[15u]);
            uint reinterpretedBits33 = uint(int(uintBitsToFloat(reinterpretedBits32.w)));
            uint reinterpretedBits34 = uint(int(uintBitsToFloat(reinterpretedBits32.z))) - 1u;
            uint sumValue11 = uint(min(int(uint(max(int(reinterpretedBits28 + uint(int(floor(reinterpretedBits30)))), int(0u)))), int(reinterpretedBits34)));
            uint sumValue12 = uint(min(int(uint(max(int(reinterpretedBits28 + uint(int(floor(reinterpretedBits31)))), int(0u)))), int(reinterpretedBits34)));
            uint sampledTextureValue17 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue11, sumValue12)), int(0u)).x * 255.0)));
            bool comparisonValue6 = int(reinterpretedBits33) <= int(sampledTextureValue17);
            bool conditionValue = !comparisonValue6;
            uint comparisonValue8 = comparisonValue6 ? 0u : sampledTextureValue17;
            uint sumValue13 = sumValue12 + 1u;
            uint sumValue14 = sumValue11 + 1u;
            uint sampledTextureValue18 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue14, sumValue12)), int(0u)).x * 255.0)));
            bool comparisonValue11 = int(reinterpretedBits33) <= int(sampledTextureValue18);
            bool conditionValue1 = !comparisonValue11;
            uint sampledTextureValue20 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue11, sumValue13)), int(0u)).x * 255.0)));
            bool comparisonValue17 = int(reinterpretedBits33) <= int(sampledTextureValue20);
            bool conditionValue2 = !comparisonValue17;
            uint sampledTextureValue23 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue14, sumValue13)), int(0u)).x * 255.0)));
            bool comparisonValue18 = int(reinterpretedBits33) <= int(sampledTextureValue23);
            bool comparisonValue20 = sampledTextureValue18 == 0u;
            bool comparisonValue21 = comparisonValue17 || (conditionValue2 && (sampledTextureValue20 == 0u));
            bool comparisonValue22 = (comparisonValue18 && comparisonValue21) || ((!comparisonValue18) && (((sampledTextureValue20 == sampledTextureValue23) && conditionValue2) || (comparisonValue17 && (sampledTextureValue23 == 0u))));
            bool comparisonValue23 = comparisonValue22 && (((conditionValue1 && ((comparisonValue20 && comparisonValue6) || (conditionValue && (sampledTextureValue17 == sampledTextureValue18)))) || (comparisonValue11 && (comparisonValue6 || ((sampledTextureValue17 == 0u) && conditionValue)))) && ((comparisonValue11 && comparisonValue21) || (conditionValue1 && ((comparisonValue20 && comparisonValue17) || (conditionValue2 && (sampledTextureValue18 == sampledTextureValue20))))));
            float reinterpretedBits35;
            float reinterpretedBits36;
            float reinterpretedBits37;
            float reinterpretedBits38;
            if (comparisonValue23)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            uint reinterpretedBits68 = uint(int(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[70u])) * 0.5));
            float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[19u]));
            float reinterpretedBits69 = (multiplyAddValue78 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[16u]))) / reinterpretedBits29;
            float reinterpretedBits70 = (multiplyAddValue80 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[18u]))) / reinterpretedBits29;
            uvec4 reinterpretedBits71 = floatBitsToUint(computeVectorConstants0.packedValues[17u]);
            uint reinterpretedBits72 = uint(int(uintBitsToFloat(reinterpretedBits71.w)));
            uint reinterpretedBits73 = uint(int(uintBitsToFloat(reinterpretedBits71.z))) - 1u;
            uint sumValue70 = uint(min(int(uint(max(int(reinterpretedBits68 + uint(int(floor(reinterpretedBits69)))), int(0u)))), int(reinterpretedBits73)));
            uint sumValue71 = uint(min(int(reinterpretedBits73), int(uint(max(int(reinterpretedBits68 + uint(int(floor(reinterpretedBits70)))), int(0u))))));
            uint sampledTextureValue58 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue70, sumValue71)), int(0u)).x * 255.0)));
            bool comparisonValue46 = int(sampledTextureValue58) >= int(reinterpretedBits72);
            bool conditionValue3 = !comparisonValue46;
            uint comparisonValue47 = comparisonValue46 ? 0u : sampledTextureValue58;
            uint sumValue72 = sumValue71 + 1u;
            uint sumValue73 = sumValue70 + 1u;
            uint sampledTextureValue59 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue73, sumValue71)), int(0u)).x * 255.0)));
            bool comparisonValue48 = int(sampledTextureValue59) >= int(reinterpretedBits72);
            bool conditionValue4 = !comparisonValue48;
            uint sampledTextureValue60 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue70, sumValue72)), int(0u)).x * 255.0)));
            bool comparisonValue49 = int(sampledTextureValue60) >= int(reinterpretedBits72);
            bool conditionValue5 = !comparisonValue49;
            uint sampledTextureValue61 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue73, sumValue72)), int(0u)).x * 255.0)));
            bool comparisonValue50 = int(sampledTextureValue61) >= int(reinterpretedBits72);
            bool comparisonValue51 = sampledTextureValue59 == 0u;
            bool comparisonValue52 = sampledTextureValue60 == 0u;
            bool comparisonValue53 = ((comparisonValue50 && (comparisonValue49 || (conditionValue5 && comparisonValue52))) || ((!comparisonValue50) && (((sampledTextureValue60 == sampledTextureValue61) && conditionValue5) || ((sampledTextureValue61 == 0u) && comparisonValue49)))) && (((((comparisonValue51 && comparisonValue46) || (conditionValue3 && (sampledTextureValue58 == sampledTextureValue59))) && conditionValue4) || (comparisonValue48 && (comparisonValue46 || ((sampledTextureValue58 == 0u) && conditionValue3)))) && ((comparisonValue49 && (comparisonValue48 || (comparisonValue51 && conditionValue4))) || (conditionValue5 && ((comparisonValue48 && comparisonValue52) || (conditionValue4 && (sampledTextureValue59 == sampledTextureValue60))))));
            float reinterpretedBits35;
            float reinterpretedBits36;
            float reinterpretedBits37;
            float reinterpretedBits38;
            if (comparisonValue53)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            uint reinterpretedBits115 = uint(int(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[66u])) * 0.5));
            float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[19u]));
            float reinterpretedBits116 = (multiplyAddValue127 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[16u]))) / reinterpretedBits29;
            float reinterpretedBits117 = (multiplyAddValue129 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[18u]))) / reinterpretedBits29;
            uvec4 reinterpretedBits = floatBitsToUint(computeVectorConstants0.packedValues[16u]);
            uint reinterpretedBits118 = uint(int(uintBitsToFloat(reinterpretedBits.w)));
            uint reinterpretedBits119 = uint(int(uintBitsToFloat(reinterpretedBits.z))) - 1u;
            uint sumValue112 = uint(min(int(uint(max(int(reinterpretedBits115 + uint(int(floor(reinterpretedBits116)))), int(0u)))), int(reinterpretedBits119)));
            uint sumValue113 = uint(min(int(reinterpretedBits119), int(uint(max(int(reinterpretedBits115 + uint(int(floor(reinterpretedBits117)))), int(0u))))));
            uint sampledTextureValue105 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue112, sumValue113)), int(0u)).x * 255.0)));
            bool comparisonValue83 = int(sampledTextureValue105) >= int(reinterpretedBits118);
            bool conditionValue7 = !comparisonValue83;
            uint comparisonValue84 = comparisonValue83 ? 0u : sampledTextureValue105;
            uint sumValue114 = sumValue113 + 1u;
            uint sumValue115 = sumValue112 + 1u;
            uint sampledTextureValue106 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue115, sumValue113)), int(0u)).x * 255.0)));
            bool comparisonValue85 = int(sampledTextureValue106) >= int(reinterpretedBits118);
            bool conditionValue8 = !comparisonValue85;
            uint sampledTextureValue107 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue112, sumValue114)), int(0u)).x * 255.0)));
            bool comparisonValue86 = int(sampledTextureValue107) >= int(reinterpretedBits118);
            bool conditionValue9 = !comparisonValue86;
            uint sampledTextureValue108 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue115, sumValue114)), int(0u)).x * 255.0)));
            bool comparisonValue87 = int(sampledTextureValue108) >= int(reinterpretedBits118);
            bool comparisonValue88 = sampledTextureValue106 == 0u;
            bool comparisonValue89 = sampledTextureValue107 == 0u;
            bool comparisonValue90 = (((!comparisonValue87) && (((sampledTextureValue107 == sampledTextureValue108) && conditionValue9) || (comparisonValue86 && (sampledTextureValue108 == 0u)))) || (comparisonValue87 && (comparisonValue86 || (conditionValue9 && comparisonValue89)))) && (((((comparisonValue88 && comparisonValue83) || (conditionValue7 && (sampledTextureValue105 == sampledTextureValue106))) && conditionValue8) || (comparisonValue85 && (comparisonValue83 || ((sampledTextureValue105 == 0u) && conditionValue7)))) && ((comparisonValue86 && (comparisonValue85 || (comparisonValue88 && conditionValue8))) || (conditionValue9 && ((comparisonValue85 && comparisonValue89) || ((sampledTextureValue106 == sampledTextureValue107) && conditionValue8)))));
            float reinterpretedBits35;
            float reinterpretedBits36;
            float reinterpretedBits37;
            float reinterpretedBits38;
            if (comparisonValue90)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            uint reinterpretedBits141 = uint(int(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[74u])) * 0.5));
            float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[19u]));
            float reinterpretedBits142 = (multiplyAddValue180 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[16u]))) / reinterpretedBits29;
            float reinterpretedBits143 = (multiplyAddValue182 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[18u]))) / reinterpretedBits29;
            uvec4 reinterpretedBits44 = floatBitsToUint(computeVectorConstants0.packedValues[18u]);
            uint reinterpretedBits144 = uint(int(uintBitsToFloat(reinterpretedBits44.w)));
            uint reinterpretedBits145 = uint(int(uintBitsToFloat(reinterpretedBits44.z))) - 1u;
            uint sumValue174 = uint(min(int(uint(max(int(reinterpretedBits141 + uint(int(floor(reinterpretedBits142)))), int(0u)))), int(reinterpretedBits145)));
            uint sumValue175 = uint(min(int(reinterpretedBits145), int(uint(max(int(reinterpretedBits141 + uint(int(floor(reinterpretedBits143)))), int(0u))))));
            uint sampledTextureValue153 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue174, sumValue175)), int(0u)).x * 255.0)));
            bool comparisonValue124 = int(sampledTextureValue153) >= int(reinterpretedBits144);
            uint comparisonValue125 = comparisonValue124 ? 0u : sampledTextureValue153;
            uint sumValue176 = sumValue175 + 1u;
            uint sumValue177 = sumValue174 + 1u;
            uint sampledTextureValue154 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue177, sumValue175)), int(0u)).x * 255.0)));
            bool comparisonValue126 = int(sampledTextureValue154) >= int(reinterpretedBits144);
            bool conditionValue14 = !comparisonValue126;
            uint sampledTextureValue155 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue174, sumValue176)), int(0u)).x * 255.0)));
            bool comparisonValue127 = int(sampledTextureValue155) >= int(reinterpretedBits144);
            bool conditionValue15 = !comparisonValue127;
            uint sampledTextureValue156 = uint(int(roundEven(texelFetch(materialTexture0, ivec2(uvec2(sumValue177, sumValue176)), int(0u)).x * 255.0)));
            bool comparisonValue128 = int(sampledTextureValue156) >= int(reinterpretedBits144);
            bool comparisonValue129 = comparisonValue126 || ((sampledTextureValue154 == 0u) && conditionValue14);
            bool comparisonValue130 = sampledTextureValue155 == 0u;
            bool comparisonValue131 = ((comparisonValue128 && (comparisonValue127 || (conditionValue15 && comparisonValue130))) || ((!comparisonValue128) && ((comparisonValue127 && (sampledTextureValue156 == 0u)) || (conditionValue15 && (sampledTextureValue155 == sampledTextureValue156))))) && ((((!comparisonValue124) && (((sampledTextureValue153 == 0u) && comparisonValue126) || ((sampledTextureValue153 == sampledTextureValue154) && conditionValue14))) || (comparisonValue124 && comparisonValue129)) && ((comparisonValue127 && comparisonValue129) || (conditionValue15 && (((sampledTextureValue154 == sampledTextureValue155) && conditionValue14) || (comparisonValue126 && comparisonValue130)))));
            float reinterpretedBits35;
            float reinterpretedBits36;
            float reinterpretedBits37;
            float reinterpretedBits38;
            if (comparisonValue131)
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            uint productValue4 = uint(int(computeVectorConstants0.packedValues[15u].z * 0.5));
            float quotientValue4 = (multiplyAddValue2 - computeVectorConstants0.packedValues[4u].x) / computeVectorConstants0.packedValues[4u].w;
            float quotientValue5 = (multiplyAddValue4 - computeVectorConstants0.packedValues[4u].z) / computeVectorConstants0.packedValues[4u].w;
            uint sumValue1 = uint(int(computeVectorConstants0.packedValues[15u].z)) + 4294967295u;
            uint sumValue2 = uint(min(int(uint(max(int(uint(int(floor(quotientValue4))) + productValue4), int(0u)))), int(sumValue1)));
            uint sumValue3 = uint(min(int(uint(max(int(uint(int(floor(quotientValue5))) + productValue4), int(0u)))), int(sumValue1)));
            uint sampledTextureValue2 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue2, sumValue3)), int(0u)).x * 255.0)));
            uint scalarValue = uint(int(computeVectorConstants0.packedValues[15u].w));
            uint comparisonValue1 = (int(sampledTextureValue2) >= int(scalarValue)) ? 0u : sampledTextureValue2;
            uint sumValue4 = sumValue2 + 1u;
            uint sampledTextureValue3 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue4, sumValue3)), int(0u)).x * 255.0)));
            uint comparisonValue2 = (int(sampledTextureValue3) >= int(scalarValue)) ? 0u : sampledTextureValue3;
            uint sumValue5 = sumValue3 + 1u;
            uint sampledTextureValue4 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue2, sumValue5)), int(0u)).x * 255.0)));
            uint comparisonValue3 = (int(sampledTextureValue4) >= int(scalarValue)) ? 0u : sampledTextureValue4;
            uint sampledTextureValue5 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue4, sumValue5)), int(0u)).x * 255.0)));
            uint comparisonValue4 = (int(sampledTextureValue5) >= int(scalarValue)) ? 0u : sampledTextureValue5;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            float branchMergedValue3;
            if (((comparisonValue1 == comparisonValue2) && (comparisonValue2 == comparisonValue3)) && (comparisonValue3 == comparisonValue4))
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            uint productValue75 = uint(int(computeVectorConstants0.packedValues[17u].z * 0.5));
            float quotientValue14 = (multiplyAddValue62 - computeVectorConstants0.packedValues[4u].x) / computeVectorConstants0.packedValues[4u].w;
            float quotientValue15 = (multiplyAddValue64 - computeVectorConstants0.packedValues[4u].z) / computeVectorConstants0.packedValues[4u].w;
            uint sumValue45 = uint(int(computeVectorConstants0.packedValues[17u].z)) + 4294967295u;
            uint sumValue46 = uint(min(int(uint(max(int(uint(int(floor(quotientValue14))) + productValue75), int(0u)))), int(sumValue45)));
            uint sumValue50 = uint(min(int(uint(max(int(uint(int(floor(quotientValue15))) + productValue75), int(0u)))), int(sumValue45)));
            uint sampledTextureValue35 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue46, sumValue50)), int(0u)).x * 255.0)));
            uint scalarValue10 = uint(int(computeVectorConstants0.packedValues[17u].w));
            uint comparisonValue28 = (int(sampledTextureValue35) >= int(scalarValue10)) ? 0u : sampledTextureValue35;
            uint sumValue51 = sumValue46 + 1u;
            uint sampledTextureValue37 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue51, sumValue50)), int(0u)).x * 255.0)));
            uint comparisonValue29 = (int(sampledTextureValue37) >= int(scalarValue10)) ? 0u : sampledTextureValue37;
            uint sumValue52 = sumValue50 + 1u;
            uint sampledTextureValue38 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue46, sumValue52)), int(0u)).x * 255.0)));
            uint comparisonValue30 = (int(sampledTextureValue38) >= int(scalarValue10)) ? 0u : sampledTextureValue38;
            uint sampledTextureValue39 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue51, sumValue52)), int(0u)).x * 255.0)));
            uint comparisonValue44 = (int(sampledTextureValue39) >= int(scalarValue10)) ? 0u : sampledTextureValue39;
            float branchMergedValue4;
            float branchMergedValue9;
            float branchMergedValue10;
            float branchMergedValue11;
            if (((comparisonValue28 == comparisonValue29) && (comparisonValue29 == comparisonValue30)) && (comparisonValue30 == comparisonValue44))
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            uint productValue146 = uint(int(computeVectorConstants0.packedValues[16u].z * 0.5));
            float quotientValue40 = (multiplyAddValue116 - computeVectorConstants0.packedValues[4u].x) / computeVectorConstants0.packedValues[4u].w;
            float quotientValue41 = (multiplyAddValue118 - computeVectorConstants0.packedValues[4u].z) / computeVectorConstants0.packedValues[4u].w;
            uint sumValue89 = uint(int(computeVectorConstants0.packedValues[16u].z)) + 4294967295u;
            uint sumValue90 = uint(min(int(uint(max(int(uint(int(floor(quotientValue40))) + productValue146), int(0u)))), int(sumValue89)));
            uint sumValue91 = uint(min(int(uint(max(int(uint(int(floor(quotientValue41))) + productValue146), int(0u)))), int(sumValue89)));
            uint sampledTextureValue82 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue90, sumValue91)), int(0u)).x * 255.0)));
            uint scalarValue41 = uint(int(computeVectorConstants0.packedValues[16u].w));
            uint comparisonValue72 = (int(sampledTextureValue82) >= int(scalarValue41)) ? 0u : sampledTextureValue82;
            uint sumValue92 = sumValue90 + 1u;
            uint sampledTextureValue83 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue92, sumValue91)), int(0u)).x * 255.0)));
            uint comparisonValue73 = (int(sampledTextureValue83) >= int(scalarValue41)) ? 0u : sampledTextureValue83;
            uint sumValue93 = sumValue91 + 1u;
            uint sampledTextureValue84 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue90, sumValue93)), int(0u)).x * 255.0)));
            uint comparisonValue74 = (int(sampledTextureValue84) >= int(scalarValue41)) ? 0u : sampledTextureValue84;
            uint sampledTextureValue85 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue92, sumValue93)), int(0u)).x * 255.0)));
            uint comparisonValue75 = (int(sampledTextureValue85) >= int(scalarValue41)) ? 0u : sampledTextureValue85;
            float branchMergedValue;
            float branchMergedValue2;
            float branchMergedValue3;
            float branchMergedValue4;
            if (((comparisonValue72 == comparisonValue73) && (comparisonValue73 == comparisonValue74)) && (comparisonValue74 == comparisonValue75))
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            uint productValue202 = uint(int(computeVectorConstants0.packedValues[18u].z * 0.5));
            float quotientValue50 = (multiplyAddValue165 - computeVectorConstants0.packedValues[4u].x) / computeVectorConstants0.packedValues[4u].w;
            float quotientValue51 = (multiplyAddValue167 - computeVectorConstants0.packedValues[4u].z) / computeVectorConstants0.packedValues[4u].w;
            uint sumValue140 = uint(int(computeVectorConstants0.packedValues[18u].z)) + 4294967295u;
            uint sumValue141 = uint(min(int(uint(max(int(uint(int(floor(quotientValue50))) + productValue202), int(0u)))), int(sumValue140)));
            uint sumValue142 = uint(min(int(uint(max(int(uint(int(floor(quotientValue51))) + productValue202), int(0u)))), int(sumValue140)));
            uint sampledTextureValue127 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue141, sumValue142)), int(0u)).x * 255.0)));
            uint scalarValue88 = uint(int(computeVectorConstants0.packedValues[18u].w));
            uint comparisonValue113 = (int(sampledTextureValue127) >= int(scalarValue88)) ? 0u : sampledTextureValue127;
            uint sumValue143 = sumValue141 + 1u;
            uint sampledTextureValue128 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue143, sumValue142)), int(0u)).x * 255.0)));
            uint comparisonValue114 = (int(sampledTextureValue128) >= int(scalarValue88)) ? 0u : sampledTextureValue128;
            uint sumValue144 = sumValue142 + 1u;
            uint sampledTextureValue129 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue141, sumValue144)), int(0u)).x * 255.0)));
            uint comparisonValue115 = (int(sampledTextureValue129) >= int(scalarValue88)) ? 0u : sampledTextureValue129;
            uint sampledTextureValue130 = uint(int(roundEven(texelFetch(biomeBlendingMapTexture, ivec2(uvec2(sumValue143, sumValue144)), int(0u)).x * 255.0)));
            uint comparisonValue116 = (int(sampledTextureValue130) >= int(scalarValue88)) ? 0u : sampledTextureValue130;
            float branchMergedValue4;
            float branchMergedValue9;
            float branchMergedValue10;
            float branchMergedValue11;
            if (((comparisonValue113 == comparisonValue114) && (comparisonValue114 == comparisonValue115)) && (comparisonValue115 == comparisonValue116))
#endif
            {
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                uint productValue64 = (comparisonValue8 * 20u) + 4u;
                uvec4 sampledTextureValue25 = uvec4(texelFetch(intermediateValue5, int(productValue64)).x, texelFetch(intermediateValue5, int(productValue64 + 1u)).x, texelFetch(intermediateValue5, int(productValue64 + 2u)).x, texelFetch(intermediateValue5, int(productValue64 + 3u)).x);
                reinterpretedBits35 = uintBitsToFloat(sampledTextureValue25.x);
                reinterpretedBits36 = uintBitsToFloat(sampledTextureValue25.y);
                reinterpretedBits37 = uintBitsToFloat(sampledTextureValue25.z);
                reinterpretedBits38 = uintBitsToFloat(sampledTextureValue25.w);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                uint productValue121 = (comparisonValue47 * 20u) + 4u;
                uvec4 sampledTextureValue62 = uvec4(texelFetch(intermediateValue6, int(productValue121)).x, texelFetch(intermediateValue6, int(productValue121 + 1u)).x, texelFetch(intermediateValue6, int(productValue121 + 2u)).x, texelFetch(intermediateValue6, int(productValue121 + 3u)).x);
                reinterpretedBits35 = uintBitsToFloat(sampledTextureValue62.x);
                reinterpretedBits36 = uintBitsToFloat(sampledTextureValue62.y);
                reinterpretedBits37 = uintBitsToFloat(sampledTextureValue62.z);
                reinterpretedBits38 = uintBitsToFloat(sampledTextureValue62.w);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                uint productValue182 = (comparisonValue84 * 20u) + 4u;
                uvec4 sampledTextureValue109 = uvec4(texelFetch(intermediateValue7, int(productValue182)).x, texelFetch(intermediateValue7, int(productValue182 + 1u)).x, texelFetch(intermediateValue7, int(productValue182 + 2u)).x, texelFetch(intermediateValue7, int(productValue182 + 3u)).x);
                reinterpretedBits35 = uintBitsToFloat(sampledTextureValue109.x);
                reinterpretedBits36 = uintBitsToFloat(sampledTextureValue109.y);
                reinterpretedBits37 = uintBitsToFloat(sampledTextureValue109.z);
                reinterpretedBits38 = uintBitsToFloat(sampledTextureValue109.w);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                uint productValue257 = (comparisonValue125 * 20u) + 4u;
                uvec4 sampledTextureValue157 = uvec4(texelFetch(intermediateValue8, int(productValue257)).x, texelFetch(intermediateValue8, int(productValue257 + 1u)).x, texelFetch(intermediateValue8, int(productValue257 + 2u)).x, texelFetch(intermediateValue8, int(productValue257 + 3u)).x);
                reinterpretedBits35 = uintBitsToFloat(sampledTextureValue157.x);
                reinterpretedBits36 = uintBitsToFloat(sampledTextureValue157.y);
                reinterpretedBits37 = uintBitsToFloat(sampledTextureValue157.z);
                reinterpretedBits38 = uintBitsToFloat(sampledTextureValue157.w);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                uint scalarValue1 = (comparisonValue1 * 20u) + 4u;
                vec4 sampledTextureValue6 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(scalarValue1)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue1 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue1 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue1 + 3u)).x));
                branchMergedValue = sampledTextureValue6.x;
                branchMergedValue1 = sampledTextureValue6.y;
                branchMergedValue2 = sampledTextureValue6.z;
                branchMergedValue3 = sampledTextureValue6.w;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                uint scalarValue11 = (comparisonValue28 * 20u) + 4u;
                vec4 sampledTextureValue40 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(scalarValue11)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue11 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue11 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue11 + 3u)).x));
                branchMergedValue4 = sampledTextureValue40.w;
                branchMergedValue9 = sampledTextureValue40.x;
                branchMergedValue10 = sampledTextureValue40.y;
                branchMergedValue11 = sampledTextureValue40.z;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                uint scalarValue42 = (comparisonValue72 * 20u) + 4u;
                vec4 sampledTextureValue86 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(scalarValue42)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue42 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue42 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue42 + 3u)).x));
                branchMergedValue = sampledTextureValue86.y;
                branchMergedValue2 = sampledTextureValue86.x;
                branchMergedValue3 = sampledTextureValue86.w;
                branchMergedValue4 = sampledTextureValue86.z;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                uint scalarValue89 = (comparisonValue113 * 20u) + 4u;
                vec4 sampledTextureValue131 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(scalarValue89)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue89 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue89 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(scalarValue89 + 3u)).x));
                branchMergedValue4 = sampledTextureValue131.z;
                branchMergedValue9 = sampledTextureValue131.y;
                branchMergedValue10 = sampledTextureValue131.x;
                branchMergedValue11 = sampledTextureValue131.w;
#endif
            }
            else
            {
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                reinterpretedBits35 = comparisonValue22 ? uintBitsToFloat(0xffffffffu ) : 0.0;
                reinterpretedBits36 = uintBitsToFloat(sumValue13);
                reinterpretedBits37 = 0.0;
                reinterpretedBits38 = 0.0;
            }
            float multiplyAddValue12;
            float multiplyAddValue13;
            float multiplyAddValue14;
            float multiplyAddValue15;
            if (!comparisonValue23)
            {
                uint productValue65 = (comparisonValue8 * 20u) + 4u;
                uvec4 sampledTextureValue27 = uvec4(texelFetch(intermediateValue5, int(productValue65)).x, texelFetch(intermediateValue5, int(productValue65 + 1u)).x, texelFetch(intermediateValue5, int(productValue65 + 2u)).x, texelFetch(intermediateValue5, int(productValue65 + 3u)).x);
                uint comparisonValue24 = ((comparisonValue11 ? 0u : sampledTextureValue18) * 20u) + 4u;
                uvec4 sampledTextureValue28 = uvec4(texelFetch(intermediateValue5, int(comparisonValue24)).x, texelFetch(intermediateValue5, int(comparisonValue24 + 1u)).x, texelFetch(intermediateValue5, int(comparisonValue24 + 2u)).x, texelFetch(intermediateValue5, int(comparisonValue24 + 3u)).x);
                uint comparisonValue25 = ((comparisonValue17 ? 0u : sampledTextureValue20) * 20u) + 4u;
                uvec4 sampledTextureValue29 = uvec4(texelFetch(intermediateValue5, int(comparisonValue25)).x, texelFetch(intermediateValue5, int(comparisonValue25 + 1u)).x, texelFetch(intermediateValue5, int(comparisonValue25 + 2u)).x, texelFetch(intermediateValue5, int(comparisonValue25 + 3u)).x);
                uint comparisonValue26 = ((comparisonValue18 ? 0u : sampledTextureValue23) * 20u) + 4u;
                uvec4 sampledTextureValue30 = uvec4(texelFetch(intermediateValue5, int(comparisonValue26)).x, texelFetch(intermediateValue5, int(comparisonValue26 + 1u)).x, texelFetch(intermediateValue5, int(comparisonValue26 + 2u)).x, texelFetch(intermediateValue5, int(comparisonValue26 + 3u)).x);
                float scalarValue7 = fract(reinterpretedBits30);
                float scalarValue8 = fract(reinterpretedBits31);
                float sumValue15 = 1.0 - scalarValue8;
                float sumValue16 = 1.0 - scalarValue7;
                float productValue67 = sumValue15 * sumValue16;
                float productValue68 = scalarValue7 * sumValue15;
                float productValue69 = scalarValue8 * sumValue16;
                float productValue70 = scalarValue8 * scalarValue7;
                multiplyAddValue12 = fma(uintBitsToFloat(sampledTextureValue30.x), productValue70, fma(uintBitsToFloat(sampledTextureValue29.x), productValue69, fma(uintBitsToFloat(sampledTextureValue27.x), productValue67, uintBitsToFloat(sampledTextureValue28.x) * productValue68)));
                multiplyAddValue13 = fma(uintBitsToFloat(sampledTextureValue30.y), productValue70, fma(uintBitsToFloat(sampledTextureValue29.y), productValue69, fma(uintBitsToFloat(sampledTextureValue27.y), productValue67, uintBitsToFloat(sampledTextureValue28.y) * productValue68)));
                multiplyAddValue14 = fma(uintBitsToFloat(sampledTextureValue30.z), productValue70, fma(uintBitsToFloat(sampledTextureValue29.z), productValue69, fma(uintBitsToFloat(sampledTextureValue27.z), productValue67, uintBitsToFloat(sampledTextureValue28.z) * productValue68)));
                multiplyAddValue15 = fma(uintBitsToFloat(sampledTextureValue30.w), productValue70, fma(uintBitsToFloat(sampledTextureValue29.w), productValue69, fma(uintBitsToFloat(sampledTextureValue27.w), productValue67, uintBitsToFloat(sampledTextureValue28.w) * productValue68)));
            }
            else
            {
                multiplyAddValue12 = reinterpretedBits35;
                multiplyAddValue13 = reinterpretedBits36;
                multiplyAddValue14 = reinterpretedBits37;
                multiplyAddValue15 = reinterpretedBits38;
            }
            intermediateValue21 = multiplyAddValue12;
            intermediateValue22 = multiplyAddValue13;
            intermediateValue23 = multiplyAddValue14;
            intermediateValue25 = multiplyAddValue15;
        }
        else
        {
            intermediateValue21 = scalarValue5;
            intermediateValue22 = scalarValue6;
            intermediateValue23 = intermediateValue24;
            intermediateValue25 = intermediateValue24;
        }
        float reinterpretedBits40;
        float reinterpretedBits41;
        float reinterpretedBits42;
        float reinterpretedBits43;
        if (!reinterpretedBits27)
        {
            uvec4 reinterpretedBits39 = floatBitsToUint(computeVectorConstants0.packedValues[32u]);
            reinterpretedBits40 = uintBitsToFloat(reinterpretedBits39.w);
            reinterpretedBits41 = uintBitsToFloat(reinterpretedBits39.z);
            reinterpretedBits42 = uintBitsToFloat(reinterpretedBits39.y);
            reinterpretedBits43 = uintBitsToFloat(reinterpretedBits39.x);
        }
        else
        {
            reinterpretedBits40 = intermediateValue25;
            reinterpretedBits41 = intermediateValue23;
            reinterpretedBits42 = intermediateValue22;
            reinterpretedBits43 = intermediateValue21;
        }
        float multiplyAddValue27 = spvNClamp(fma(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[68u])), multiplyAddValue21, uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[69u]))), 0.0, 1.0);
        uvec4 reinterpretedBits44 = floatBitsToUint(computeVectorConstants0.packedValues[18u]);
        float reinterpretedBits45 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[75u]));
        float reinterpretedBits46 = (multiplyAddValue27 * uintBitsToFloat(reinterpretedBits44.x)) * reinterpretedBits45;
        float reinterpretedBits47 = (multiplyAddValue27 * uintBitsToFloat(reinterpretedBits44.y)) * reinterpretedBits45;
        float reinterpretedBits48 = (multiplyAddValue27 * uintBitsToFloat(reinterpretedBits44.z)) * reinterpretedBits45;
        float multiplyAddValue28 = fma(reinterpretedBits26, fma(reinterpretedBits43, reinterpretedBits40, -reinterpretedBits46), reinterpretedBits46);
        float multiplyAddValue29 = fma(reinterpretedBits26, fma(reinterpretedBits42, reinterpretedBits40, -reinterpretedBits47), reinterpretedBits47);
        float multiplyAddValue30 = fma(reinterpretedBits26, fma(reinterpretedBits41, reinterpretedBits40, -reinterpretedBits48), reinterpretedBits48);
        float multiplyAddValue31 = fma(reinterpretedBits26, fma(-multiplyAddValue27, reinterpretedBits45, reinterpretedBits40), multiplyAddValue27 * uintBitsToFloat(reinterpretedBits44.w));
        vec3 vectorValue = vec3(multiplyAddValue23, multiplyAddValue24, multiplyAddValue25);
        float nonlinearValue1 = sqrt(rdDot3Precise2(vectorValue, vectorValue));
        float reinterpretedBits49 = spvNClamp((((nonlinearValue1 / uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[78u]))) + uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[112u]))) - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[76u]))) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[77u])), 0.0, 1.0);
        float multiplyAddValue32 = fma(reinterpretedBits49, -multiplyAddValue28, multiplyAddValue28);
        float multiplyAddValue36 = fma(reinterpretedBits49, -multiplyAddValue29, multiplyAddValue29);
        float multiplyAddValue37 = fma(reinterpretedBits49, -multiplyAddValue30, multiplyAddValue30);
        float intermediateValue29;
        float intermediateValue30;
        if ((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[120u])) > 0.5) && (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[83u])) > 0.5))
        {
            vec4 sampledTextureValue31 = textureLod(sampler3D(materialTexture9, textureSampler9), vec3(quotientValue7, 1.0 - quotientValue8, (exp2(((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[121u])) > 0.5) ? (quotientValue9 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[122u]))) : quotientValue9) * 5.770780086517333984375) - 1.0) * 0.0186573602259159088134765625), 0.0);
            intermediateValue29 = sampledTextureValue31.y;
            intermediateValue30 = sampledTextureValue31.x;
        }
        else
        {
            intermediateValue29 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[85u]));
            intermediateValue30 = 0.0;
        }
        uvec4 reinterpretedBits50 = floatBitsToUint(computeVectorConstants0.packedValues[14u]);
        uvec4 reinterpretedBits51 = floatBitsToUint(computeVectorConstants0.packedValues[29u]);
        float reinterpretedBits52 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[119u]));
        float reinterpretedBits53 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[59u]));
        float reinterpretedBits54 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[108u]));
        float reinterpretedBits55 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[99u]));
        float multiplyAddValue42 = ((multiplyAddValue32 * spvNMax(fma(intermediateValue30 * uintBitsToFloat(reinterpretedBits50.x), reinterpretedBits53, (intermediateValue29 * uintBitsToFloat(reinterpretedBits51.x)) * reinterpretedBits52), reinterpretedBits54)) * reinterpretedBits55) * 0.079577468335628509521484375;
        float multiplyAddValue43 = ((multiplyAddValue36 * spvNMax(fma(intermediateValue30 * uintBitsToFloat(reinterpretedBits50.y), reinterpretedBits53, (intermediateValue29 * uintBitsToFloat(reinterpretedBits51.y)) * reinterpretedBits52), reinterpretedBits54)) * reinterpretedBits55) * 0.079577468335628509521484375;
        float multiplyAddValue44 = ((multiplyAddValue37 * spvNMax(fma(intermediateValue30 * uintBitsToFloat(reinterpretedBits50.z), reinterpretedBits53, (intermediateValue29 * uintBitsToFloat(reinterpretedBits51.z)) * reinterpretedBits52), reinterpretedBits54)) * reinterpretedBits55) * 0.079577468335628509521484375;
        float multiplyAddValue33;
        float multiplyAddValue34;
        float multiplyAddValue35;
        if ((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[101u])) == 0.0) || (abs(intermediateValue29) > 9.9999997473787516355514526367188e-05))
        {
            float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[104u]));
            float multiplyAddValue54 = fma(reinterpretedBits26, uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[105u])) - reinterpretedBits56, reinterpretedBits56);
            vec4 sampledTextureValue32 = texelFetch(materialTexture7, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), int(0u));
            float scalarValue9 = sampledTextureValue32.x;
            float reinterpretedBits57 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[53u]));
            float reinterpretedBits58 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[52u]));
            float reinterpretedBits59 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[54u]));
            float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[55u]));
            float multiplyAddValue55 = fma(reinterpretedBits23, reinterpretedBits60, fma(reinterpretedBits19, reinterpretedBits59, fma(reinterpretedBits15, reinterpretedBits58, reinterpretedBits11 * reinterpretedBits57)));
            float multiplyAddValue56 = fma(reinterpretedBits24, reinterpretedBits60, fma(reinterpretedBits20, reinterpretedBits59, fma(reinterpretedBits16, reinterpretedBits58, reinterpretedBits12 * reinterpretedBits57)));
            float multiplyAddValue57 = fma(reinterpretedBits25, reinterpretedBits60, fma(reinterpretedBits21, reinterpretedBits59, fma(reinterpretedBits17, reinterpretedBits58, reinterpretedBits13 * reinterpretedBits57)));
            vec3 vectorValue1 = vec3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
            float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
            float multiplyAddValue58 = rdDot2Precise(vec2(rdDot3Precise2(vec3(-(multiplyAddValue23 / nonlinearValue1), -(multiplyAddValue24 / nonlinearValue1), -(multiplyAddValue25 / nonlinearValue1)), vec3(inverseLengthValue1 * multiplyAddValue55, inverseLengthValue1 * multiplyAddValue56, inverseLengthValue1 * multiplyAddValue57))), vec2(multiplyAddValue54)) + fma(multiplyAddValue54, multiplyAddValue54, 1.0);
            float multiplyAddValue59 = (fma(-multiplyAddValue54, multiplyAddValue54, 1.0) * 0.079577468335628509521484375) / (sqrt(multiplyAddValue58) * multiplyAddValue58);
            float reinterpretedBits61 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[95u]));
            uvec4 reinterpretedBits62 = floatBitsToUint(computeVectorConstants0.packedValues[23u]);
            multiplyAddValue33 = fma(multiplyAddValue59 * (scalarValue9 * multiplyAddValue37), reinterpretedBits61 * uintBitsToFloat(reinterpretedBits62.z), multiplyAddValue44);
            multiplyAddValue34 = fma(multiplyAddValue59 * (scalarValue9 * multiplyAddValue36), reinterpretedBits61 * uintBitsToFloat(reinterpretedBits62.y), multiplyAddValue43);
            multiplyAddValue35 = fma(multiplyAddValue59 * (scalarValue9 * multiplyAddValue32), reinterpretedBits61 * uintBitsToFloat(reinterpretedBits62.x), multiplyAddValue42);
        }
        else
        {
            multiplyAddValue33 = multiplyAddValue44;
            multiplyAddValue34 = multiplyAddValue43;
            multiplyAddValue35 = multiplyAddValue42;
        }
        imageStore(intermediateValue6, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(multiplyAddValue35, multiplyAddValue34, multiplyAddValue33, fma(reinterpretedBits49, -multiplyAddValue31, multiplyAddValue31)));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                reinterpretedBits35 = uintBitsToFloat(sumValue73);
                reinterpretedBits36 = uintBitsToFloat(sumValue72);
                reinterpretedBits37 = 0.0;
                reinterpretedBits38 = 0.0;
            }
            float multiplyAddValue12;
            float multiplyAddValue13;
            float multiplyAddValue14;
            float multiplyAddValue15;
            if (!comparisonValue53)
            {
                uint productValue122 = (comparisonValue47 * 20u) + 4u;
                uvec4 sampledTextureValue63 = uvec4(texelFetch(intermediateValue6, int(productValue122)).x, texelFetch(intermediateValue6, int(productValue122 + 1u)).x, texelFetch(intermediateValue6, int(productValue122 + 2u)).x, texelFetch(intermediateValue6, int(productValue122 + 3u)).x);
                uint comparisonValue54 = ((comparisonValue48 ? 0u : sampledTextureValue59) * 20u) + 4u;
                uvec4 sampledTextureValue64 = uvec4(texelFetch(intermediateValue6, int(comparisonValue54)).x, texelFetch(intermediateValue6, int(comparisonValue54 + 1u)).x, texelFetch(intermediateValue6, int(comparisonValue54 + 2u)).x, texelFetch(intermediateValue6, int(comparisonValue54 + 3u)).x);
                uint comparisonValue55 = ((comparisonValue49 ? 0u : sampledTextureValue60) * 20u) + 4u;
                uvec4 sampledTextureValue65 = uvec4(texelFetch(intermediateValue6, int(comparisonValue55)).x, texelFetch(intermediateValue6, int(comparisonValue55 + 1u)).x, texelFetch(intermediateValue6, int(comparisonValue55 + 2u)).x, texelFetch(intermediateValue6, int(comparisonValue55 + 3u)).x);
                uint comparisonValue56 = ((comparisonValue50 ? 0u : sampledTextureValue61) * 20u) + 4u;
                uvec4 sampledTextureValue66 = uvec4(texelFetch(intermediateValue6, int(comparisonValue56)).x, texelFetch(intermediateValue6, int(comparisonValue56 + 1u)).x, texelFetch(intermediateValue6, int(comparisonValue56 + 2u)).x, texelFetch(intermediateValue6, int(comparisonValue56 + 3u)).x);
                float scalarValue24 = fract(reinterpretedBits69);
                float scalarValue25 = fract(reinterpretedBits70);
                float sumValue74 = 1.0 - scalarValue25;
                float sumValue75 = 1.0 - scalarValue24;
                float productValue123 = sumValue74 * sumValue75;
                float productValue124 = sumValue74 * scalarValue24;
                float productValue125 = sumValue75 * scalarValue25;
                float productValue126 = scalarValue25 * scalarValue24;
                multiplyAddValue12 = fma(uintBitsToFloat(sampledTextureValue66.x), productValue126, fma(uintBitsToFloat(sampledTextureValue65.x), productValue125, fma(uintBitsToFloat(sampledTextureValue63.x), productValue123, productValue124 * uintBitsToFloat(sampledTextureValue64.x))));
                multiplyAddValue13 = fma(uintBitsToFloat(sampledTextureValue66.y), productValue126, fma(uintBitsToFloat(sampledTextureValue65.y), productValue125, fma(uintBitsToFloat(sampledTextureValue63.y), productValue123, productValue124 * uintBitsToFloat(sampledTextureValue64.y))));
                multiplyAddValue14 = fma(uintBitsToFloat(sampledTextureValue66.z), productValue126, fma(uintBitsToFloat(sampledTextureValue65.z), productValue125, fma(uintBitsToFloat(sampledTextureValue63.z), productValue123, productValue124 * uintBitsToFloat(sampledTextureValue64.z))));
                multiplyAddValue15 = fma(uintBitsToFloat(sampledTextureValue66.w), productValue126, fma(uintBitsToFloat(sampledTextureValue65.w), productValue125, fma(uintBitsToFloat(sampledTextureValue63.w), productValue123, productValue124 * uintBitsToFloat(sampledTextureValue64.w))));
            }
            else
            {
                multiplyAddValue12 = reinterpretedBits35;
                multiplyAddValue13 = reinterpretedBits36;
                multiplyAddValue14 = reinterpretedBits37;
                multiplyAddValue15 = reinterpretedBits38;
            }
            intermediateValue23 = multiplyAddValue12;
            intermediateValue25 = multiplyAddValue13;
            intermediateValue26 = multiplyAddValue14;
            intermediateValue27 = multiplyAddValue15;
        }
        else
        {
            intermediateValue23 = intermediateValue24;
            intermediateValue25 = intermediateValue24;
            intermediateValue26 = intermediateValue24;
            intermediateValue27 = intermediateValue24;
        }
        float reinterpretedBits40;
        float reinterpretedBits41;
        float reinterpretedBits42;
        float reinterpretedBits43;
        if (!reinterpretedBits67)
        {
            uvec4 reinterpretedBits74 = floatBitsToUint(computeVectorConstants0.packedValues[46u]);
            reinterpretedBits40 = uintBitsToFloat(reinterpretedBits74.w);
            reinterpretedBits41 = uintBitsToFloat(reinterpretedBits74.z);
            reinterpretedBits42 = uintBitsToFloat(reinterpretedBits74.y);
            reinterpretedBits43 = uintBitsToFloat(reinterpretedBits74.x);
        }
        else
        {
            reinterpretedBits40 = intermediateValue27;
            reinterpretedBits41 = intermediateValue26;
            reinterpretedBits42 = intermediateValue25;
            reinterpretedBits43 = intermediateValue23;
        }
        float multiplyAddValue85 = spvNClamp(fma(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[76u])), multiplyAddValue79, uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[77u]))), 0.0, 1.0);
        uvec4 reinterpretedBits75 = floatBitsToUint(computeVectorConstants0.packedValues[20u]);
        float reinterpretedBits76 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[83u]));
        float reinterpretedBits77 = (multiplyAddValue85 * uintBitsToFloat(reinterpretedBits75.x)) * reinterpretedBits76;
        float reinterpretedBits78 = (multiplyAddValue85 * uintBitsToFloat(reinterpretedBits75.y)) * reinterpretedBits76;
        float reinterpretedBits79 = (multiplyAddValue85 * uintBitsToFloat(reinterpretedBits75.z)) * reinterpretedBits76;
        float multiplyAddValue86 = fma(reinterpretedBits66, fma(reinterpretedBits43, reinterpretedBits40, -reinterpretedBits77), reinterpretedBits77);
        float multiplyAddValue87 = fma(reinterpretedBits66, fma(reinterpretedBits42, reinterpretedBits40, -reinterpretedBits78), reinterpretedBits78);
        float multiplyAddValue88 = fma(reinterpretedBits66, fma(reinterpretedBits41, reinterpretedBits40, -reinterpretedBits79), reinterpretedBits79);
        float multiplyAddValue89 = fma(reinterpretedBits66, fma(-multiplyAddValue85, reinterpretedBits76, reinterpretedBits40), multiplyAddValue85 * uintBitsToFloat(reinterpretedBits75.w));
        float reinterpretedBits80 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[120u]));
        float multiplyAddValue90 = fma(reinterpretedBits66, uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[121u])) - reinterpretedBits80, reinterpretedBits80);
        vec3 vectorValue2 = vec3(multiplyAddValue81, multiplyAddValue82, multiplyAddValue83);
        float nonlinearValue4 = sqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        float reinterpretedBits81 = spvNClamp((((nonlinearValue4 / uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[86u]))) + uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[160u]))) - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[84u]))) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[85u])), 0.0, 1.0);
        float multiplyAddValue91 = fma(reinterpretedBits81, -multiplyAddValue86, multiplyAddValue86);
        float multiplyAddValue92 = fma(reinterpretedBits81, -multiplyAddValue87, multiplyAddValue87);
        float multiplyAddValue93 = fma(reinterpretedBits81, -multiplyAddValue88, multiplyAddValue88);
        float intermediateValue31;
        float intermediateValue32;
        if ((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[168u])) > 0.5) && (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[91u])) > 0.5))
        {
            vec4 sampledTextureValue67 = textureLod(sampler3D(materialTexture9, textureSampler9), vec3(quotientValue27, 1.0 - quotientValue28, (exp2(((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[169u])) > 0.5) ? (quotientValue29 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[170u]))) : quotientValue29) * 5.770780086517333984375) - 1.0) * 0.0186573602259159088134765625), 0.0);
            intermediateValue31 = sampledTextureValue67.y;
            intermediateValue32 = sampledTextureValue67.x;
        }
        else
        {
            intermediateValue31 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[93u]));
            intermediateValue32 = 0.0;
        }
        uvec4 reinterpretedBits50 = floatBitsToUint(computeVectorConstants0.packedValues[14u]);
        uvec4 reinterpretedBits82 = floatBitsToUint(computeVectorConstants0.packedValues[41u]);
        float reinterpretedBits83 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[167u]));
        float reinterpretedBits53 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[59u]));
        float reinterpretedBits84 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[124u]));
        float reinterpretedBits85 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[115u]));
        float multiplyAddValue94 = ((multiplyAddValue91 * spvNMax(fma(intermediateValue32 * uintBitsToFloat(reinterpretedBits50.x), reinterpretedBits53, (intermediateValue31 * uintBitsToFloat(reinterpretedBits82.x)) * reinterpretedBits83), reinterpretedBits84)) * reinterpretedBits85) * 0.079577468335628509521484375;
        float multiplyAddValue95 = ((multiplyAddValue92 * spvNMax(fma(intermediateValue32 * uintBitsToFloat(reinterpretedBits50.y), reinterpretedBits53, (intermediateValue31 * uintBitsToFloat(reinterpretedBits82.y)) * reinterpretedBits83), reinterpretedBits84)) * reinterpretedBits85) * 0.079577468335628509521484375;
        float multiplyAddValue96 = ((multiplyAddValue93 * spvNMax(fma(intermediateValue32 * uintBitsToFloat(reinterpretedBits50.z), reinterpretedBits53, (intermediateValue31 * uintBitsToFloat(reinterpretedBits82.z)) * reinterpretedBits83), reinterpretedBits84)) * reinterpretedBits85) * 0.079577468335628509521484375;
        float quotientValue30 = multiplyAddValue81 / nonlinearValue4;
        float quotientValue31 = multiplyAddValue82 / nonlinearValue4;
        float quotientValue32 = multiplyAddValue83 / nonlinearValue4;
        float multiplyAddValue33;
        float multiplyAddValue34;
        float multiplyAddValue35;
        if ((abs(intermediateValue31) > 9.9999997473787516355514526367188e-05) || (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[117u])) == 0.0))
        {
            vec4 sampledTextureValue32 = texelFetch(materialTexture7, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), int(0u));
            float scalarValue9 = sampledTextureValue32.x;
            float reinterpretedBits57 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[53u]));
            float reinterpretedBits58 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[52u]));
            float reinterpretedBits59 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[54u]));
            float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[55u]));
            float multiplyAddValue55 = fma(reinterpretedBits23, reinterpretedBits60, fma(reinterpretedBits19, reinterpretedBits59, fma(reinterpretedBits15, reinterpretedBits58, reinterpretedBits11 * reinterpretedBits57)));
            float multiplyAddValue56 = fma(reinterpretedBits24, reinterpretedBits60, fma(reinterpretedBits20, reinterpretedBits59, fma(reinterpretedBits16, reinterpretedBits58, reinterpretedBits12 * reinterpretedBits57)));
            float multiplyAddValue57 = fma(reinterpretedBits25, reinterpretedBits60, fma(reinterpretedBits21, reinterpretedBits59, fma(reinterpretedBits17, reinterpretedBits58, reinterpretedBits13 * reinterpretedBits57)));
            vec3 vectorValue1 = vec3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
            float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
            float multiplyAddValue97 = rdDot2Precise(vec2(rdDot3Precise2(vec3(-quotientValue30, -quotientValue31, -quotientValue32), vec3(inverseLengthValue1 * multiplyAddValue55, inverseLengthValue1 * multiplyAddValue56, inverseLengthValue1 * multiplyAddValue57))), vec2(multiplyAddValue90)) + fma(multiplyAddValue90, multiplyAddValue90, 1.0);
            float multiplyAddValue98 = (fma(-multiplyAddValue90, multiplyAddValue90, 1.0) * 0.079577468335628509521484375) / (multiplyAddValue97 * sqrt(multiplyAddValue97));
            float reinterpretedBits86 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[111u]));
            uvec4 reinterpretedBits87 = floatBitsToUint(computeVectorConstants0.packedValues[27u]);
            multiplyAddValue33 = fma(multiplyAddValue98 * (scalarValue9 * multiplyAddValue91), reinterpretedBits86 * uintBitsToFloat(reinterpretedBits87.x), multiplyAddValue94);
            multiplyAddValue34 = fma(multiplyAddValue98 * (scalarValue9 * multiplyAddValue92), reinterpretedBits86 * uintBitsToFloat(reinterpretedBits87.y), multiplyAddValue95);
            multiplyAddValue35 = fma(multiplyAddValue98 * (scalarValue9 * multiplyAddValue93), reinterpretedBits86 * uintBitsToFloat(reinterpretedBits87.z), multiplyAddValue96);
        }
        else
        {
            multiplyAddValue33 = multiplyAddValue94;
            multiplyAddValue34 = multiplyAddValue95;
            multiplyAddValue35 = multiplyAddValue96;
        }
        bool reinterpretedBits88 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[66u])) != 0.0;
        float multiplyAddValue38;
        float multiplyAddValue39;
        float multiplyAddValue40;
        if ((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[181u])) != 0.0) && reinterpretedBits88)
        {
            float reinterpretedBits89 = 1.0 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[172u]));
            float scalarValue26 = -multiplyAddValue83;
            float reinterpretedBits90 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[98u]));
            float productValue127 = scalarValue26 * reinterpretedBits90;
            float reinterpretedBits55 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[99u]));
            uvec4 reinterpretedBits91 = floatBitsToUint(computeVectorConstants0.packedValues[24u]);
            bool reinterpretedBits92 = scalarValue26 < uintBitsToFloat(reinterpretedBits91.x);
            bool reinterpretedBits93 = scalarValue26 < uintBitsToFloat(reinterpretedBits91.y);
            uvec4 reinterpretedBits94 = floatBitsToUint(computeVectorConstants0.packedValues[26u]);
            float reinterpretedBits95 = uintBitsToFloat(reinterpretedBits94.x);
            float reinterpretedBits96 = uintBitsToFloat(reinterpretedBits94.y);
            float reinterpretedBits97 = uintBitsToFloat(reinterpretedBits94.z);
            float nonlinearValue5 = spvNMin(reinterpretedBits97 - 1.0, floor(spvNClamp((log2(scalarValue26) - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[138u]))) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[136u])), 0.0, 1.0) * (reinterpretedBits97 - 2.0)) + 2.0);
            float comparisonValue57 = reinterpretedBits93 ? 1.0 : nonlinearValue5;
            float multiplyAddValue99 = spvNMin(reinterpretedBits96 - 1.0, floor(spvNClamp(fma(scalarValue26, reinterpretedBits90, multiplyAddValue82) / (productValue127 + productValue127), 0.0, 1.0) * reinterpretedBits96));
            float multiplyAddValue100 = spvNMin(reinterpretedBits95 - 1.0, floor(spvNClamp(fma(productValue127, reinterpretedBits55, multiplyAddValue81) / fma(productValue127, reinterpretedBits55, productValue127 * reinterpretedBits55), 0.0, 1.0) * reinterpretedBits95));
            float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[104u]));
            float reinterpretedBits98 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[105u]));
            float intermediateValue37;
            float intermediateValue39;
            float intermediateValue41;
            if (!(((reinterpretedBits92 ? 0.0 : comparisonValue57) >= uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[106u]))) || (((multiplyAddValue100 >= reinterpretedBits56) || (((multiplyAddValue100 < 0.0) || (multiplyAddValue99 < 0.0)) || (((nonlinearValue5 < 0.0) && (!reinterpretedBits93)) && (!reinterpretedBits92)))) || (multiplyAddValue99 >= reinterpretedBits98))))
            {
                float multiplyAddValue101 = fma(multiplyAddValue99, reinterpretedBits56, multiplyAddValue100);
                uint reinterpretedBits99 = uint(int(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[107u]))));
                uint multiplyAddValue102 = uint(int(reinterpretedBits92 ? multiplyAddValue101 : fma(reinterpretedBits98, reinterpretedBits56 * comparisonValue57, multiplyAddValue101))) * reinterpretedBits99;
                uint sumValue76 = multiplyAddValue102 + reinterpretedBits99;
                bool reinterpretedBits27 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[60u])) > 0.0;
                bool reinterpretedBits100 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[132u])) > 0.0;
                float reinterpretedBits101 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[128u]));
                float scalarValue27 = -reinterpretedBits101;
                uvec4 reinterpretedBits102 = floatBitsToUint(computeVectorConstants0.packedValues[39u]);
                float reinterpretedBits103 = uintBitsToFloat(reinterpretedBits102.x);
                float reinterpretedBits104 = uintBitsToFloat(reinterpretedBits102.y);
                float quotientValue33 = 0.5 / reinterpretedBits103;
                float quotientValue34 = 0.5 / reinterpretedBits104;
                float reinterpretedBits105 = 1.0 / (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[129u])) - reinterpretedBits101);
                float multiplyAddValue103 = fma(multiplyAddValue90, multiplyAddValue90, 1.0);
                float sumValue77 = multiplyAddValue90 + multiplyAddValue90;
                float multiplyAddValue104 = fma(-multiplyAddValue90, multiplyAddValue90, 1.0) * 0.079577468335628509521484375;
                float intermediateValue38;
                float intermediateValue40;
                float intermediateValue42;
                intermediateValue42 = 0.0;
                intermediateValue40 = 0.0;
                intermediateValue38 = 0.0;
                float multiplyAddValue45;
                float multiplyAddValue46;
                float multiplyAddValue47;
                uint sumValue9;
                uint scalarValue28 = multiplyAddValue102;
                for (;;)
                {
                    if (int(scalarValue28) >= int(sumValue76))
                    {
                        break;
                    }
                    uint sampledTextureValue68 = uint(int(uintBitsToFloat(texelFetch(intermediateValue7, int(scalarValue28)).x)));
                    if (int(sampledTextureValue68) < int(0u))
                    {
                        break;
                    }
                    float intermediateValue46;
                    float intermediateValue47;
                    float intermediateValue48;
                    bool intermediateValue49;
                    if (int(sampledTextureValue68) >= int(0u))
                    {
                        uint productValue128 = sampledTextureValue68 * 32u;
                        vec4 sampledTextureValue69 = uintBitsToFloat(uvec4(texelFetch(intermediateValue8, int(productValue128)).x, texelFetch(intermediateValue8, int(productValue128 + 1u)).x, texelFetch(intermediateValue8, int(productValue128 + 2u)).x, texelFetch(intermediateValue8, int(productValue128 + 3u)).x));
                        float scalarValue29 = sampledTextureValue69.w;
                        float sumValue78 = sampledTextureValue69.x - multiplyAddValue78;
                        float sumValue79 = sampledTextureValue69.y - multiplyAddValue79;
                        float sumValue80 = sampledTextureValue69.z - multiplyAddValue80;
                        float sumValue81 = abs(sumValue80) + (abs(sumValue79) + abs(sumValue78));
                        vec3 vectorValue3 = vec3(sumValue78, sumValue79, sumValue80);
                        float comparisonValue58 = reinterpretedBits27 ? (sumValue81 * sumValue81) : rdDot3Precise2(vectorValue3, vectorValue3);
                        float productValue10;
                        float productValue11;
                        float productValue12;
                        bool intermediateValue50;
                        if (comparisonValue58 < (scalarValue29 * scalarValue29))
                        {
                            bool intermediateValue55;
                            if (reinterpretedBits88)
                            {
                                uint productValue129 = sampledTextureValue68 * 32u;
                                vec3 sampledTextureValue70 = uintBitsToFloat(uvec3(texelFetch(intermediateValue8, int(productValue129)).x, texelFetch(intermediateValue8, int(productValue129 + 1u)).x, texelFetch(intermediateValue8, int(productValue129 + 2u)).x));
                                float scalarValue30 = sampledTextureValue70.x;
                                float scalarValue31 = sampledTextureValue70.y;
                                float scalarValue32 = sampledTextureValue70.z;
                                uint productValue130 = (sampledTextureValue68 * 32u) + 8u;
                                vec4 sampledTextureValue71 = uintBitsToFloat(uvec4(texelFetch(intermediateValue8, int(productValue130)).x, texelFetch(intermediateValue8, int(productValue130 + 1u)).x, texelFetch(intermediateValue8, int(productValue130 + 2u)).x, texelFetch(intermediateValue8, int(productValue130 + 3u)).x));
                                uint productValue131 = (sampledTextureValue68 * 32u) + 12u;
                                vec4 sampledTextureValue72 = uintBitsToFloat(uvec4(texelFetch(intermediateValue8, int(productValue131)).x, texelFetch(intermediateValue8, int(productValue131 + 1u)).x, texelFetch(intermediateValue8, int(productValue131 + 2u)).x, texelFetch(intermediateValue8, int(productValue131 + 3u)).x));
                                uint productValue132 = (sampledTextureValue68 * 32u) + 16u;
                                vec4 sampledTextureValue73 = uintBitsToFloat(uvec4(texelFetch(intermediateValue8, int(productValue132)).x, texelFetch(intermediateValue8, int(productValue132 + 1u)).x, texelFetch(intermediateValue8, int(productValue132 + 2u)).x, texelFetch(intermediateValue8, int(productValue132 + 3u)).x));
                                uint productValue133 = (sampledTextureValue68 * 32u) + 20u;
                                vec4 sampledTextureValue74 = uintBitsToFloat(uvec4(texelFetch(intermediateValue8, int(productValue133)).x, texelFetch(intermediateValue8, int(productValue133 + 1u)).x, texelFetch(intermediateValue8, int(productValue133 + 2u)).x, texelFetch(intermediateValue8, int(productValue133 + 3u)).x));
                                uint productValue134 = (sampledTextureValue68 * 32u) + 24u;
                                vec4 sampledTextureValue75 = uintBitsToFloat(uvec4(texelFetch(intermediateValue8, int(productValue134)).x, texelFetch(intermediateValue8, int(productValue134 + 1u)).x, texelFetch(intermediateValue8, int(productValue134 + 2u)).x, texelFetch(intermediateValue8, int(productValue134 + 3u)).x));
                                uint productValue135 = (sampledTextureValue68 * 32u) + 28u;
                                vec4 sampledTextureValue76 = uintBitsToFloat(uvec4(texelFetch(intermediateValue8, int(productValue135)).x, texelFetch(intermediateValue8, int(productValue135 + 1u)).x, texelFetch(intermediateValue8, int(productValue135 + 2u)).x, texelFetch(intermediateValue8, int(productValue135 + 3u)).x));
                                float sumValue82 = multiplyAddValue78 - scalarValue30;
                                float sumValue83 = multiplyAddValue79 - scalarValue31;
                                float sumValue84 = multiplyAddValue80 - scalarValue32;
                                float scalarValue33 = abs(sumValue82);
                                float scalarValue34 = abs(sumValue83);
                                float scalarValue35 = abs(sumValue84);
                                bool comparisonValue59 = scalarValue34 >= scalarValue35;
                                bool comparisonValue60 = (scalarValue33 >= scalarValue34) && (scalarValue33 >= scalarValue35);
                                bool comparisonValue61 = sumValue83 >= 0.0;
                                bool comparisonValue62 = sumValue84 >= 0.0;
                                bool conditionValue6 = !comparisonValue60;
                                bool comparisonValue63 = (!(sumValue82 >= 0.0)) && comparisonValue60;
                                bool bitwiseValue = (comparisonValue59 && comparisonValue61) && conditionValue6;
                                bool bitwiseValue1 = conditionValue6 && ((!comparisonValue61) && comparisonValue59);
                                bool bitwiseValue2 = ((!comparisonValue59) && comparisonValue62) && conditionValue6;
                                bool bitwiseValue3 = comparisonValue60 || (comparisonValue59 || comparisonValue62);
                                float comparisonValue64 = comparisonValue63 ? sampledTextureValue72.z : (bitwiseValue ? sampledTextureValue73.z : (bitwiseValue1 ? sampledTextureValue74.z : (bitwiseValue2 ? sampledTextureValue75.z : (bitwiseValue3 ? sampledTextureValue71.z : sampledTextureValue76.z))));
                                float comparisonValue65 = comparisonValue63 ? sampledTextureValue72.w : (bitwiseValue ? sampledTextureValue73.w : (bitwiseValue1 ? sampledTextureValue74.w : (bitwiseValue2 ? sampledTextureValue75.w : (bitwiseValue3 ? sampledTextureValue71.w : sampledTextureValue76.w))));
                                bool multiplyAddValue52;
                                if (!((comparisonValue65 == 0.0) && (comparisonValue64 == 0.0)))
                                {
                                    float scalarValue36 = scalarValue30 - multiplyAddValue78;
                                    float sumValue85 = scalarValue32 - multiplyAddValue80;
                                    float comparisonValue66 = comparisonValue63 ? sampledTextureValue72.x : (bitwiseValue ? sampledTextureValue73.x : (bitwiseValue1 ? sampledTextureValue74.x : (bitwiseValue2 ? sampledTextureValue75.x : (bitwiseValue3 ? sampledTextureValue71.x : sampledTextureValue76.x))));
                                    float comparisonValue67 = comparisonValue63 ? sampledTextureValue72.y : (bitwiseValue ? sampledTextureValue73.y : (bitwiseValue1 ? sampledTextureValue74.y : (bitwiseValue2 ? sampledTextureValue75.y : (bitwiseValue3 ? sampledTextureValue71.y : sampledTextureValue76.y))));
                                    float comparisonValue68 = comparisonValue63 ? sumValue85 : ((bitwiseValue || (bitwiseValue2 || bitwiseValue1)) ? scalarValue36 : (bitwiseValue3 ? sumValue84 : sumValue82));
                                    float comparisonValue69 = comparisonValue63 ? sumValue83 : (bitwiseValue ? sumValue85 : (bitwiseValue1 ? sumValue84 : sumValue83));
                                    float comparisonValue70 = comparisonValue63 ? sumValue82 : (bitwiseValue ? (scalarValue31 - multiplyAddValue79) : (bitwiseValue1 ? sumValue83 : (bitwiseValue2 ? sumValue85 : (bitwiseValue3 ? scalarValue36 : sumValue84))));
                                    uvec4 reinterpretedBits106 = floatBitsToUint(computeVectorConstants0.packedValues[36u]);
                                    uvec4 reinterpretedBits107 = floatBitsToUint(computeVectorConstants0.packedValues[35u]);
                                    uvec4 reinterpretedBits108 = floatBitsToUint(computeVectorConstants0.packedValues[37u]);
                                    uvec4 reinterpretedBits109 = floatBitsToUint(computeVectorConstants0.packedValues[38u]);
                                    float multiplyAddValue105 = fma(uintBitsToFloat(reinterpretedBits108.w), comparisonValue70, fma(uintBitsToFloat(reinterpretedBits107.w), comparisonValue68, comparisonValue69 * uintBitsToFloat(reinterpretedBits106.w))) + uintBitsToFloat(reinterpretedBits109.w);
                                    float sumValue86 = comparisonValue64 - comparisonValue66;
                                    float sumValue87 = comparisonValue65 - comparisonValue67;
                                    float productValue136 = sumValue86 * reinterpretedBits103;
                                    float productValue137 = sumValue87 * reinterpretedBits104;
                                    vec4 sampledTextureValue77 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(spvNMin(comparisonValue64 - quotientValue33, spvNMax(quotientValue33 + comparisonValue66, fma((floor(fma((fma(uintBitsToFloat(reinterpretedBits108.x), comparisonValue70, fma(uintBitsToFloat(reinterpretedBits107.x), comparisonValue68, comparisonValue69 * uintBitsToFloat(reinterpretedBits106.x))) + uintBitsToFloat(reinterpretedBits109.x)) / multiplyAddValue105, 0.5, 0.5) * productValue136) + 0.5) / productValue136, sumValue86, comparisonValue66))), spvNMin(comparisonValue65 - quotientValue34, spvNMax(quotientValue34 + comparisonValue67, fma((floor((1.0 - fma((fma(uintBitsToFloat(reinterpretedBits108.y), comparisonValue70, fma(uintBitsToFloat(reinterpretedBits107.y), comparisonValue68, comparisonValue69 * uintBitsToFloat(reinterpretedBits106.y))) + uintBitsToFloat(reinterpretedBits109.y)) / multiplyAddValue105, 0.5, 0.5)) * productValue137) + 0.5) / productValue137, sumValue87, comparisonValue67)))), 0.0);
                                    multiplyAddValue52 = sampledTextureValue77.x >= ((fma(uintBitsToFloat(reinterpretedBits108.z), comparisonValue70, fma(uintBitsToFloat(reinterpretedBits107.z), comparisonValue68, comparisonValue69 * uintBitsToFloat(reinterpretedBits106.z))) + uintBitsToFloat(reinterpretedBits109.z)) / multiplyAddValue105);
                                }
                                else
                                {
                                    multiplyAddValue52 = false;
                                }
                                intermediateValue55 = multiplyAddValue52;
                            }
                            else
                            {
                                intermediateValue55 = true;
                            }
                            float quotientValue35 = 1.0 / spvNMax(comparisonValue58, 0.100000001490116119384765625);
                            float multiplyAddValue106 = comparisonValue58 / fma(scalarValue29, scalarValue29, 9.9999997473787516355514526367188e-05);
                            float multiplyAddValue107 = spvNMax(fma(-multiplyAddValue106, multiplyAddValue106, 1.0), 0.0);
                            float productValue138 = multiplyAddValue107 * multiplyAddValue107;
                            float productValue139 = productValue138 * quotientValue35;
                            float multiplyAddValue108 = spvNClamp(reinterpretedBits105 * (fma(-quotientValue35, productValue138, scalarValue27) + 1.0), 0.0, 1.0);
                            float multiplyAddValue109 = reinterpretedBits100 ? (spvNClamp(fma((multiplyAddValue108 * multiplyAddValue108) * fma(multiplyAddValue108, -2.0, 3.0), uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[130u])), uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[131u]))), 0.0, 1.0) * productValue139) : productValue139;
                            uint productValue140 = (sampledTextureValue68 * 32u) + 4u;
                            vec4 sampledTextureValue78 = uintBitsToFloat(uvec4(texelFetch(intermediateValue8, int(productValue140)).x, texelFetch(intermediateValue8, int(productValue140 + 1u)).x, texelFetch(intermediateValue8, int(productValue140 + 2u)).x, texelFetch(intermediateValue8, int(productValue140 + 3u)).x));
                            float scalarValue37 = sampledTextureValue78.w;
                            intermediateValue50 = intermediateValue55;
                            productValue12 = multiplyAddValue109 * (scalarValue37 * sampledTextureValue78.x);
                            productValue11 = multiplyAddValue109 * (scalarValue37 * sampledTextureValue78.y);
                            productValue10 = multiplyAddValue109 * (scalarValue37 * sampledTextureValue78.z);
                        }
                        else
                        {
                            intermediateValue50 = true;
                            productValue12 = 0.0;
                            productValue11 = 0.0;
                            productValue10 = 0.0;
                        }
                        intermediateValue46 = productValue10;
                        intermediateValue47 = productValue11;
                        intermediateValue48 = productValue12;
                        intermediateValue49 = intermediateValue50;
                    }
                    else
                    {
                        intermediateValue46 = 0.0;
                        intermediateValue47 = 0.0;
                        intermediateValue48 = 0.0;
                        intermediateValue49 = true;
                    }
                    uint productValue141 = sampledTextureValue68 * 32u;
                    vec3 sampledTextureValue79 = uintBitsToFloat(uvec3(texelFetch(intermediateValue8, int(productValue141)).x, texelFetch(intermediateValue8, int(productValue141 + 1u)).x, texelFetch(intermediateValue8, int(productValue141 + 2u)).x));
                    float scalarValue38 = sampledTextureValue79.x;
                    float scalarValue39 = sampledTextureValue79.y;
                    float scalarValue40 = sampledTextureValue79.z;
                    float multiplyAddValue110 = (fma(reinterpretedBits19, scalarValue40, fma(reinterpretedBits15, scalarValue38, scalarValue39 * reinterpretedBits11)) + reinterpretedBits23) - multiplyAddValue81;
                    float multiplyAddValue111 = (fma(reinterpretedBits20, scalarValue40, fma(reinterpretedBits16, scalarValue38, scalarValue39 * reinterpretedBits12)) + reinterpretedBits24) - multiplyAddValue82;
                    float multiplyAddValue112 = (fma(reinterpretedBits21, scalarValue40, fma(reinterpretedBits17, scalarValue38, scalarValue39 * reinterpretedBits13)) + reinterpretedBits25) - multiplyAddValue83;
                    vec3 vectorValue4 = vec3(multiplyAddValue110, multiplyAddValue111, multiplyAddValue112);
                    float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
                    float multiplyAddValue113 = fma(sumValue77, rdDot3Precise2(vec3(-quotientValue30, -quotientValue31, -quotientValue32), vec3(multiplyAddValue110 * inverseLengthValue3, multiplyAddValue111 * inverseLengthValue3, multiplyAddValue112 * inverseLengthValue3)), multiplyAddValue103);
                    float nonlinearValue6 = multiplyAddValue104 / (sqrt(multiplyAddValue113) * multiplyAddValue113);
                    multiplyAddValue45 = intermediateValue49 ? fma(intermediateValue48, multiplyAddValue91 * nonlinearValue6, intermediateValue42) : intermediateValue42;
                    multiplyAddValue46 = intermediateValue49 ? fma(intermediateValue47, multiplyAddValue92 * nonlinearValue6, intermediateValue40) : intermediateValue40;
                    multiplyAddValue47 = intermediateValue49 ? fma(intermediateValue46, multiplyAddValue93 * nonlinearValue6, intermediateValue38) : intermediateValue38;
                    sumValue9 = scalarValue28 + 1u;
                    intermediateValue42 = multiplyAddValue45;
                    intermediateValue40 = multiplyAddValue46;
                    intermediateValue38 = multiplyAddValue47;
                    scalarValue28 = sumValue9;
                    continue;
                }
                intermediateValue37 = intermediateValue38;
                intermediateValue39 = intermediateValue40;
                intermediateValue41 = intermediateValue42;
            }
            else
            {
                intermediateValue37 = 0.0;
                intermediateValue39 = 0.0;
                intermediateValue41 = 0.0;
            }
            multiplyAddValue38 = fma(reinterpretedBits89, intermediateValue37, multiplyAddValue35);
            multiplyAddValue39 = fma(reinterpretedBits89, intermediateValue39, multiplyAddValue34);
            multiplyAddValue40 = fma(reinterpretedBits89, intermediateValue41, multiplyAddValue33);
        }
        else
        {
            multiplyAddValue38 = multiplyAddValue35;
            multiplyAddValue39 = multiplyAddValue34;
            multiplyAddValue40 = multiplyAddValue33;
        }
        imageStore(intermediateValue9, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(multiplyAddValue40, multiplyAddValue39, multiplyAddValue38, fma(reinterpretedBits81, -multiplyAddValue89, multiplyAddValue89)));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                reinterpretedBits35 = uintBitsToFloat(sumValue115);
                reinterpretedBits36 = uintBitsToFloat(sumValue114);
                reinterpretedBits37 = 0.0;
                reinterpretedBits38 = 0.0;
            }
            float multiplyAddValue12;
            float multiplyAddValue13;
            float multiplyAddValue14;
            float multiplyAddValue15;
            if (!comparisonValue90)
            {
                uint productValue183 = (comparisonValue84 * 20u) + 4u;
                uvec4 sampledTextureValue110 = uvec4(texelFetch(intermediateValue7, int(productValue183)).x, texelFetch(intermediateValue7, int(productValue183 + 1u)).x, texelFetch(intermediateValue7, int(productValue183 + 2u)).x, texelFetch(intermediateValue7, int(productValue183 + 3u)).x);
                uint comparisonValue91 = ((comparisonValue85 ? 0u : sampledTextureValue106) * 20u) + 4u;
                uvec4 sampledTextureValue111 = uvec4(texelFetch(intermediateValue7, int(comparisonValue91)).x, texelFetch(intermediateValue7, int(comparisonValue91 + 1u)).x, texelFetch(intermediateValue7, int(comparisonValue91 + 2u)).x, texelFetch(intermediateValue7, int(comparisonValue91 + 3u)).x);
                uint comparisonValue92 = ((comparisonValue86 ? 0u : sampledTextureValue107) * 20u) + 4u;
                uvec4 sampledTextureValue112 = uvec4(texelFetch(intermediateValue7, int(comparisonValue92)).x, texelFetch(intermediateValue7, int(comparisonValue92 + 1u)).x, texelFetch(intermediateValue7, int(comparisonValue92 + 2u)).x, texelFetch(intermediateValue7, int(comparisonValue92 + 3u)).x);
                uint comparisonValue93 = ((comparisonValue87 ? 0u : sampledTextureValue108) * 20u) + 4u;
                uvec4 sampledTextureValue113 = uvec4(texelFetch(intermediateValue7, int(comparisonValue93)).x, texelFetch(intermediateValue7, int(comparisonValue93 + 1u)).x, texelFetch(intermediateValue7, int(comparisonValue93 + 2u)).x, texelFetch(intermediateValue7, int(comparisonValue93 + 3u)).x);
                float scalarValue61 = fract(reinterpretedBits116);
                float scalarValue62 = fract(reinterpretedBits117);
                float sumValue116 = 1.0 - scalarValue62;
                float sumValue117 = 1.0 - scalarValue61;
                float productValue184 = sumValue116 * sumValue117;
                float productValue185 = sumValue116 * scalarValue61;
                float productValue186 = sumValue117 * scalarValue62;
                float productValue187 = scalarValue62 * scalarValue61;
                multiplyAddValue12 = fma(uintBitsToFloat(sampledTextureValue113.x), productValue187, fma(uintBitsToFloat(sampledTextureValue112.x), productValue186, fma(uintBitsToFloat(sampledTextureValue110.x), productValue184, productValue185 * uintBitsToFloat(sampledTextureValue111.x))));
                multiplyAddValue13 = fma(uintBitsToFloat(sampledTextureValue113.y), productValue187, fma(uintBitsToFloat(sampledTextureValue112.y), productValue186, fma(uintBitsToFloat(sampledTextureValue110.y), productValue184, productValue185 * uintBitsToFloat(sampledTextureValue111.y))));
                multiplyAddValue14 = fma(uintBitsToFloat(sampledTextureValue113.z), productValue187, fma(uintBitsToFloat(sampledTextureValue112.z), productValue186, fma(uintBitsToFloat(sampledTextureValue110.z), productValue184, productValue185 * uintBitsToFloat(sampledTextureValue111.z))));
                multiplyAddValue15 = fma(uintBitsToFloat(sampledTextureValue113.w), productValue187, fma(uintBitsToFloat(sampledTextureValue112.w), productValue186, fma(uintBitsToFloat(sampledTextureValue110.w), productValue184, productValue185 * uintBitsToFloat(sampledTextureValue111.w))));
            }
            else
            {
                multiplyAddValue12 = reinterpretedBits35;
                multiplyAddValue13 = reinterpretedBits36;
                multiplyAddValue14 = reinterpretedBits37;
                multiplyAddValue15 = reinterpretedBits38;
            }
            intermediateValue23 = multiplyAddValue12;
            intermediateValue25 = multiplyAddValue13;
            intermediateValue26 = multiplyAddValue14;
            intermediateValue27 = multiplyAddValue15;
        }
        else
        {
            intermediateValue23 = intermediateValue24;
            intermediateValue25 = intermediateValue24;
            intermediateValue26 = intermediateValue24;
            intermediateValue27 = intermediateValue24;
        }
        float reinterpretedBits40;
        float reinterpretedBits41;
        float reinterpretedBits42;
        float reinterpretedBits43;
        if (!reinterpretedBits114)
        {
            uvec4 reinterpretedBits107 = floatBitsToUint(computeVectorConstants0.packedValues[35u]);
            reinterpretedBits40 = uintBitsToFloat(reinterpretedBits107.w);
            reinterpretedBits41 = uintBitsToFloat(reinterpretedBits107.z);
            reinterpretedBits42 = uintBitsToFloat(reinterpretedBits107.y);
            reinterpretedBits43 = uintBitsToFloat(reinterpretedBits107.x);
        }
        else
        {
            reinterpretedBits40 = intermediateValue27;
            reinterpretedBits41 = intermediateValue26;
            reinterpretedBits42 = intermediateValue25;
            reinterpretedBits43 = intermediateValue23;
        }
        float multiplyAddValue134 = spvNClamp(fma(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[72u])), multiplyAddValue128, uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[73u]))), 0.0, 1.0);
        uvec4 reinterpretedBits120 = floatBitsToUint(computeVectorConstants0.packedValues[19u]);
        float reinterpretedBits121 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[79u]));
        float reinterpretedBits122 = (multiplyAddValue134 * uintBitsToFloat(reinterpretedBits120.x)) * reinterpretedBits121;
        float reinterpretedBits123 = (multiplyAddValue134 * uintBitsToFloat(reinterpretedBits120.y)) * reinterpretedBits121;
        float reinterpretedBits124 = (multiplyAddValue134 * uintBitsToFloat(reinterpretedBits120.z)) * reinterpretedBits121;
        float multiplyAddValue135 = fma(reinterpretedBits113, fma(reinterpretedBits43, reinterpretedBits40, -reinterpretedBits122), reinterpretedBits122);
        float multiplyAddValue136 = fma(reinterpretedBits113, fma(reinterpretedBits42, reinterpretedBits40, -reinterpretedBits123), reinterpretedBits123);
        float multiplyAddValue137 = fma(reinterpretedBits113, fma(reinterpretedBits41, reinterpretedBits40, -reinterpretedBits124), reinterpretedBits124);
        float multiplyAddValue138 = fma(reinterpretedBits113, fma(-multiplyAddValue134, reinterpretedBits121, reinterpretedBits40), multiplyAddValue134 * uintBitsToFloat(reinterpretedBits120.w));
        vec3 vectorValue5 = vec3(multiplyAddValue130, multiplyAddValue131, multiplyAddValue132);
        float nonlinearValue8 = sqrt(rdDot3Precise2(vectorValue5, vectorValue5));
        float reinterpretedBits125 = spvNClamp((((nonlinearValue8 / uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[82u]))) + uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[124u]))) - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[80u]))) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[81u])), 0.0, 1.0);
        float multiplyAddValue139 = fma(reinterpretedBits125, -multiplyAddValue135, multiplyAddValue135);
        float multiplyAddValue140 = fma(reinterpretedBits125, -multiplyAddValue136, multiplyAddValue136);
        float multiplyAddValue141 = fma(reinterpretedBits125, -multiplyAddValue137, multiplyAddValue137);
        float intermediateValue31;
        float intermediateValue32;
        if ((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[132u])) > 0.5) && (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[87u])) > 0.5))
        {
            vec4 sampledTextureValue114 = textureLod(sampler3D(materialTexture9, textureSampler9), vec3(quotientValue43, 1.0 - quotientValue44, (exp2(((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[133u])) > 0.5) ? (quotientValue45 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[134u]))) : quotientValue45) * 5.770780086517333984375) - 1.0) * 0.0186573602259159088134765625), 0.0);
            intermediateValue31 = sampledTextureValue114.y;
            intermediateValue32 = sampledTextureValue114.x;
        }
        else
        {
            intermediateValue31 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[89u]));
            intermediateValue32 = 0.0;
        }
        float productValue14;
        float productValue15;
        float productValue16;
        if (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[115u])) != 0.0)
        {
            uvec4 reinterpretedBits91 = floatBitsToUint(computeVectorConstants0.packedValues[24u]);
            float reinterpretedBits126 = (multiplyAddValue127 - uintBitsToFloat(reinterpretedBits91.x)) - 0.5;
            float reinterpretedBits127 = (multiplyAddValue128 - uintBitsToFloat(reinterpretedBits91.y)) - 0.5;
            float reinterpretedBits128 = (multiplyAddValue129 - uintBitsToFloat(reinterpretedBits91.z)) - 0.5;
            uint productValue188 = uint(int(floor(floor(reinterpretedBits126) * 0.0625)));
            uint productValue189 = uint(int(floor(floor(reinterpretedBits127) * 0.0625)));
            uint productValue190 = uint(int(floor(floor(reinterpretedBits128) * 0.0625)));
            uint scalarValue63 = bitfieldInsert(productValue188, productValue189, int(16u), int(16u));
            uint bitwiseValue28 = productValue190 & 65535u;
            uint productValue191 = productValue188 * 1540483477u;
            uint productValue192 = productValue189 * 1540483477u;
            uint productValue193 = productValue190 * 1540483477u;
            uint bitwiseValue29 = ((((((productValue192 >> 24u) ^ productValue192) * 1540483477u) ^ ((((productValue191 ^ (productValue191 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u)) * 1540483477u) ^ (((productValue193 >> 24u) ^ productValue193) * 1540483477u)) * 1540483477u;
            uint bitwiseValue30 = ((bitwiseValue29 >> 13u) ^ bitwiseValue29) * 1540483477u;
            uint bitwiseValue31 = (bitwiseValue30 >> 15u) ^ bitwiseValue30;
            uint bitwiseValue32 = (bitwiseValue31 ^ (bitwiseValue31 >> 16u)) & 65535u;
            bool comparisonValue94 = bitwiseValue32 != 0u;
            uint bitwiseValue33 = bitwiseValue32 | 1u;
            uint reinterpretedBits129 = uint(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[60u]))) - 1u;
            uint comparisonValue95 = (comparisonValue94 ? bitwiseValue32 : bitwiseValue33) & reinterpretedBits129;
            uint comparisonValue13;
            uint comparisonValue14;
            uint bitwiseValue6;
            uint sumValue7;
            uint intermediateValue40;
            uint intermediateValue41;
            uint scalarValue46 = 0u;
            uint scalarValue47 = 0u;
            uint scalarValue64 = comparisonValue95;
            uint scalarValue65 = 0u;
            for (;;)
            {
                if (int(scalarValue65) >= int(8u))
                {
                    intermediateValue40 = scalarValue47;
                    intermediateValue41 = scalarValue46;
                    break;
                }
                uint productValue194 = scalarValue64 * 4u;
                uvec4 sampledTextureValue115 = uvec4(texelFetch(intermediateValue5, int(productValue194)).x, texelFetch(intermediateValue5, int(productValue194 + 1u)).x, texelFetch(intermediateValue5, int(productValue194 + 2u)).x, texelFetch(intermediateValue5, int(productValue194 + 3u)).x);
                uint bitwiseValue34 = sampledTextureValue115.z & 65535u;
                bool comparisonValue96 = (bitwiseValue28 == sampledTextureValue115.y) && ((((bitwiseValue33 == bitwiseValue34) && (!comparisonValue94)) || (comparisonValue94 && (bitwiseValue32 == bitwiseValue34))) && (scalarValue63 == sampledTextureValue115.x));
                bool comparisonValue97 = scalarValue46 != 0u;
                comparisonValue14 = (comparisonValue97 || (!comparisonValue96)) ? scalarValue47 : sampledTextureValue115.w;
                comparisonValue13 = comparisonValue96 ? 4294967295u : scalarValue46;
                bitwiseValue6 = reinterpretedBits129 & (scalarValue64 + 1u);
                bool comparisonValue98 = (bitwiseValue34 == 0u) || comparisonValue96;
                if (comparisonValue98 || (comparisonValue97 && (!comparisonValue98)))
                {
                    intermediateValue40 = comparisonValue14;
                    intermediateValue41 = comparisonValue13;
                    break;
                }
                sumValue7 = scalarValue65 + 1u;
                scalarValue46 = comparisonValue13;
                scalarValue47 = comparisonValue14;
                scalarValue64 = bitwiseValue6;
                scalarValue65 = sumValue7;
                continue;
            }
            float multiplyAddValue39;
            float multiplyAddValue40;
            float multiplyAddValue41;
            if (intermediateValue41 != 0u)
            {
                float productValue195 = floor(reinterpretedBits126 * 0.0625);
                float productValue196 = floor(reinterpretedBits127 * 0.0625);
                float productValue197 = floor(reinterpretedBits128 * 0.0625);
                float multiplyAddValue142 = fma(-productValue195, 16.0, reinterpretedBits126);
                float multiplyAddValue143 = fma(-productValue196, 16.0, reinterpretedBits127);
                float multiplyAddValue144 = fma(-productValue197, 16.0, reinterpretedBits128);
                uint bitwiseValue35 = intermediateValue40 >> 2u;
                float scalarValue66 = floor(multiplyAddValue142);
                float scalarValue67 = floor(multiplyAddValue143);
                float scalarValue68 = floor(multiplyAddValue144);
                float sumValue118 = multiplyAddValue142 - scalarValue66;
                float sumValue119 = multiplyAddValue143 - scalarValue67;
                float sumValue120 = multiplyAddValue144 - scalarValue68;
                uint comparisonValue99 = bitfieldInsert(bitfieldInsert(0u, (sumValue119 >= sumValue120) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue118 >= sumValue119) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue118 >= sumValue120) ? 4294967295u : 0u, int(2u), int(1u));
                float scalarValue69 = spvNMin(sumValue119, sumValue118);
                float scalarValue70 = spvNMax(sumValue119, sumValue118);
                float scalarValue71 = spvNMin(sumValue120, scalarValue69);
                float scalarValue72 = spvNMax(sumValue120, scalarValue70);
                float scalarValue73 = spvNMax(scalarValue69, spvNMin(sumValue120, scalarValue70));
                float sumValue121 = 1.0 - scalarValue72;
                float sumValue122 = scalarValue72 - scalarValue73;
                float sumValue123 = scalarValue73 - scalarValue71;
                float sumValue124 = scalarValue66 + 1.0;
                float sumValue125 = scalarValue67 + 1.0;
                float sumValue126 = scalarValue68 + 1.0;
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
                if (((sumValue126 < 16.0) && ((sumValue124 < 16.0) && (sumValue125 < 16.0))) && (((scalarValue66 >= 0.0) && (scalarValue67 >= 0.0)) && (scalarValue68 >= 0.0)))
                {
                    uint scalarValue74 = uint(scalarValue66);
                    uint scalarValue75 = uint(scalarValue67);
                    uint scalarValue76 = uint(scalarValue68);
                    uint scalarValue77 = min(comparisonValue99, 72u);
                    uint sumValue127 = min((comparisonValue99 + 5u), 72u);
                    uvec4 sampledTextureValue116 = texelFetch(intermediateValue6, int(bitwiseValue35 + (((scalarValue76 << 4u) + scalarValue75) + (scalarValue74 << 8u))));
                    uint scalarValue78 = sampledTextureValue116.x;
                    float bitwiseValue36 = rdEvaluateFloatExpression((scalarValue78 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue100 = scalarValue78 != 0u;
                    uvec4 sampledTextureValue117 = texelFetch(intermediateValue6, int(bitwiseValue35 + ((((uint(comparisonValue99 < 2u) + scalarValue76) << 4u) + (intermediateValue12[scalarValue77].y + scalarValue75)) + ((scalarValue74 + intermediateValue12[scalarValue77].x) << 8u))));
                    uint scalarValue79 = sampledTextureValue117.x;
                    float bitwiseValue37 = rdEvaluateFloatExpression((scalarValue79 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue101 = scalarValue79 != 0u;
                    uvec4 sampledTextureValue118 = texelFetch(intermediateValue6, int(bitwiseValue35 + ((((uint(comparisonValue99 < 6u) + scalarValue76) << 4u) + (intermediateValue12[sumValue127].x + scalarValue75)) + ((scalarValue74 + intermediateValue12[sumValue127].y) << 8u))));
                    uint scalarValue80 = sampledTextureValue118.x;
                    float bitwiseValue38 = rdEvaluateFloatExpression((scalarValue80 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue102 = scalarValue80 != 0u;
                    uvec4 sampledTextureValue119 = texelFetch(intermediateValue6, int(bitwiseValue35 + ((((scalarValue76 + 1u) << 4u) + (scalarValue75 + 1u)) + ((scalarValue74 + 1u) << 8u))));
                    uint scalarValue81 = sampledTextureValue119.x;
                    float bitwiseValue39 = rdEvaluateFloatExpression((scalarValue81 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue103 = scalarValue81 != 0u;
                    comparisonValue31 = comparisonValue103 ? ((bitwiseValue39 * (rdEvaluateFloatExpression((scalarValue81 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue32 = comparisonValue103 ? ((bitwiseValue39 * (rdEvaluateFloatExpression((scalarValue81 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue33 = comparisonValue103 ? ((bitwiseValue39 * (rdEvaluateFloatExpression(scalarValue81 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue34 = comparisonValue102 ? ((bitwiseValue38 * (rdEvaluateFloatExpression((scalarValue80 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue35 = comparisonValue102 ? ((bitwiseValue38 * (rdEvaluateFloatExpression((scalarValue80 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue36 = comparisonValue102 ? ((bitwiseValue38 * (rdEvaluateFloatExpression(scalarValue80 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue37 = comparisonValue100 ? ((bitwiseValue36 * (rdEvaluateFloatExpression((scalarValue78 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue38 = comparisonValue100 ? ((bitwiseValue36 * (rdEvaluateFloatExpression((scalarValue78 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue39 = comparisonValue100 ? ((bitwiseValue36 * (rdEvaluateFloatExpression(scalarValue78 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue40 = comparisonValue101 ? ((bitwiseValue37 * (rdEvaluateFloatExpression((scalarValue79 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue41 = comparisonValue101 ? ((bitwiseValue37 * (rdEvaluateFloatExpression((scalarValue79 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue42 = comparisonValue101 ? ((bitwiseValue37 * (rdEvaluateFloatExpression(scalarValue79 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                else
                {
                    uint scalarValue82 = min(comparisonValue99, 72u);
                    float sumValue128 = scalarValue66 + rdEvaluateFloatExpression(intermediateValue12[scalarValue82].x);
                    float sumValue129 = scalarValue67 + rdEvaluateFloatExpression(intermediateValue12[scalarValue82].y);
                    float sumValue130 = scalarValue68 + rdEvaluateFloatExpression(uint(comparisonValue99 < 2u));
                    uint sumValue131 = min((comparisonValue99 + 5u), 72u);
                    float sumValue132 = scalarValue66 + rdEvaluateFloatExpression(intermediateValue12[sumValue131].y);
                    float sumValue133 = scalarValue67 + rdEvaluateFloatExpression(intermediateValue12[sumValue131].x);
                    float sumValue134 = scalarValue68 + rdEvaluateFloatExpression(uint(comparisonValue99 < 6u));
                    float multiplyAddValue145 = fma(productValue195, 16.0, scalarValue66);
                    float multiplyAddValue146 = fma(productValue196, 16.0, scalarValue67);
                    float multiplyAddValue147 = fma(productValue197, 16.0, scalarValue68);
                    uint comparisonValue104 = min((((((bitfieldInsert(bitfieldInsert(0u, (scalarValue66 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (scalarValue66 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (scalarValue67 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (scalarValue67 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (scalarValue68 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (scalarValue68 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 8u), 72u);
                    bool conditionValue10 = int(intermediateValue12[comparisonValue104].z) < int(0u);
                    uint sumValue135 = bitwiseValue35 + 4097u;
                    uvec4 sampledTextureValue120 = texelFetch(intermediateValue6, int(bitwiseValue35 + 4096u));
                    uint scalarValue83 = sampledTextureValue120.x;
                    uvec4 sampledTextureValue121 = texelFetch(intermediateValue6, int(conditionValue10 ? (bitwiseValue35 + (bitfieldInsert(bitfieldInsert(0u, uint(scalarValue68), int(4u), int(4u)), uint(scalarValue67), int(0u), int(4u)) + bitfieldInsert(0u, uint(scalarValue66), int(8u), int(4u)))) : ((texelFetch(intermediateValue6, int(sumValue135 + intermediateValue12[comparisonValue104].z)).x >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue147 * 0.0625), 16.0, multiplyAddValue147)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue146 * 0.0625), 16.0, multiplyAddValue146)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue145 * 0.0625), 16.0, multiplyAddValue145)), int(8u), int(4u))))));
                    uint scalarValue84 = sampledTextureValue121.x;
                    float bitwiseValue40 = rdEvaluateFloatExpression((scalarValue84 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue105 = (conditionValue10 || ((scalarValue83 & (1u << (intermediateValue12[comparisonValue104].z & 31u))) != 0u)) && (scalarValue84 != 0u);
                    float multiplyAddValue148 = fma(productValue195, 16.0, sumValue128);
                    float multiplyAddValue149 = fma(productValue196, 16.0, sumValue129);
                    float multiplyAddValue150 = fma(productValue197, 16.0, sumValue130);
                    uint comparisonValue106 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue128 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue128 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue129 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue129 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue130 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue130 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 8u), 72u);
                    bool conditionValue11 = int(intermediateValue12[comparisonValue106].z) < int(0u);
                    uvec4 sampledTextureValue122 = texelFetch(intermediateValue6, int(conditionValue11 ? (bitwiseValue35 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue130), int(4u), int(4u)), uint(sumValue129), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue128), int(8u), int(4u)))) : ((texelFetch(intermediateValue6, int(sumValue135 + intermediateValue12[comparisonValue106].z)).x >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue150 * 0.0625), 16.0, multiplyAddValue150)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue149 * 0.0625), 16.0, multiplyAddValue149)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue148 * 0.0625), 16.0, multiplyAddValue148)), int(8u), int(4u))))));
                    uint scalarValue85 = sampledTextureValue122.x;
                    float bitwiseValue41 = rdEvaluateFloatExpression((scalarValue85 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue107 = (conditionValue11 || ((scalarValue83 & (1u << (intermediateValue12[comparisonValue106].z & 31u))) != 0u)) && (scalarValue85 != 0u);
                    float multiplyAddValue151 = fma(productValue195, 16.0, sumValue132);
                    float multiplyAddValue152 = fma(productValue196, 16.0, sumValue133);
                    float multiplyAddValue153 = fma(productValue197, 16.0, sumValue134);
                    uint comparisonValue108 = min((((bitfieldInsert(0u, (sumValue134 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + ((bitfieldInsert(bitfieldInsert(0u, (sumValue132 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue132 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue133 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue133 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)))) + bitfieldInsert(0u, (sumValue134 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 8u), 72u);
                    bool conditionValue12 = int(intermediateValue12[comparisonValue108].z) < int(0u);
                    uvec4 sampledTextureValue123 = texelFetch(intermediateValue6, int(conditionValue12 ? (bitwiseValue35 + (bitfieldInsert(0u, uint(sumValue132), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue134), int(4u), int(4u)), uint(sumValue133), int(0u), int(4u)))) : ((texelFetch(intermediateValue6, int(sumValue135 + intermediateValue12[comparisonValue108].z)).x >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue151 * 0.0625), 16.0, multiplyAddValue151)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue153 * 0.0625), 16.0, multiplyAddValue153)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue152 * 0.0625), 16.0, multiplyAddValue152)), int(0u), int(4u))))));
                    uint scalarValue86 = sampledTextureValue123.x;
                    float bitwiseValue42 = rdEvaluateFloatExpression((scalarValue86 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue109 = (conditionValue12 || ((scalarValue83 & (1u << (intermediateValue12[comparisonValue108].z & 31u))) != 0u)) && (scalarValue86 != 0u);
                    float multiplyAddValue154 = fma(productValue195, 16.0, sumValue124);
                    float multiplyAddValue155 = fma(productValue196, 16.0, sumValue125);
                    float multiplyAddValue156 = fma(productValue197, 16.0, sumValue126);
                    uint comparisonValue110 = min(((bitfieldInsert(0u, (sumValue126 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue126 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue125 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue124 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue124 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue125 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 8u), 72u);
                    bool conditionValue13 = int(intermediateValue12[comparisonValue110].z) < int(0u);
                    uvec4 sampledTextureValue124 = texelFetch(intermediateValue6, int(conditionValue13 ? (bitwiseValue35 + (bitfieldInsert(0u, uint(sumValue124), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue126), int(4u), int(4u)), uint(sumValue125), int(0u), int(4u)))) : ((texelFetch(intermediateValue6, int(sumValue135 + intermediateValue12[comparisonValue110].z)).x >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue154 * 0.0625), 16.0, multiplyAddValue154)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue156 * 0.0625), 16.0, multiplyAddValue156)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue155 * 0.0625), 16.0, multiplyAddValue155)), int(0u), int(4u))))));
                    uint scalarValue87 = sampledTextureValue124.x;
                    float bitwiseValue43 = rdEvaluateFloatExpression((scalarValue87 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue111 = (conditionValue13 || ((scalarValue83 & (1u << (intermediateValue12[comparisonValue110].z & 31u))) != 0u)) && (scalarValue87 != 0u);
                    comparisonValue31 = comparisonValue111 ? ((bitwiseValue43 * (rdEvaluateFloatExpression((scalarValue87 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue32 = comparisonValue111 ? ((bitwiseValue43 * (rdEvaluateFloatExpression((scalarValue87 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue33 = comparisonValue111 ? ((bitwiseValue43 * (rdEvaluateFloatExpression(scalarValue87 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue34 = comparisonValue109 ? ((bitwiseValue42 * (rdEvaluateFloatExpression((scalarValue86 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue35 = comparisonValue109 ? ((bitwiseValue42 * (rdEvaluateFloatExpression((scalarValue86 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue36 = comparisonValue109 ? ((bitwiseValue42 * (rdEvaluateFloatExpression(scalarValue86 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue37 = comparisonValue105 ? ((bitwiseValue40 * (rdEvaluateFloatExpression((scalarValue84 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue38 = comparisonValue105 ? ((bitwiseValue40 * (rdEvaluateFloatExpression((scalarValue84 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue39 = comparisonValue105 ? ((bitwiseValue40 * (rdEvaluateFloatExpression(scalarValue84 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue40 = comparisonValue107 ? ((bitwiseValue41 * (rdEvaluateFloatExpression((scalarValue85 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue41 = comparisonValue107 ? ((bitwiseValue41 * (rdEvaluateFloatExpression((scalarValue85 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue42 = comparisonValue107 ? ((bitwiseValue41 * (rdEvaluateFloatExpression(scalarValue85 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                multiplyAddValue39 = fma(comparisonValue31, scalarValue71, fma(comparisonValue34, sumValue123, fma(comparisonValue37, sumValue121, sumValue122 * comparisonValue40)));
                multiplyAddValue40 = fma(comparisonValue32, scalarValue71, fma(comparisonValue35, sumValue123, fma(comparisonValue38, sumValue121, sumValue122 * comparisonValue41)));
                multiplyAddValue41 = fma(comparisonValue33, scalarValue71, fma(comparisonValue36, sumValue123, fma(comparisonValue39, sumValue121, sumValue122 * comparisonValue42)));
            }
            else
            {
                multiplyAddValue39 = 0.0;
                multiplyAddValue40 = 0.0;
                multiplyAddValue41 = 0.0;
            }
            float reinterpretedBits53 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[59u]));
            productValue14 = multiplyAddValue39 * reinterpretedBits53;
            productValue15 = multiplyAddValue40 * reinterpretedBits53;
            productValue16 = multiplyAddValue41 * reinterpretedBits53;
        }
        else
        {
            uvec4 reinterpretedBits50 = floatBitsToUint(computeVectorConstants0.packedValues[14u]);
            float reinterpretedBits130 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[59u]));
            productValue14 = (intermediateValue32 * uintBitsToFloat(reinterpretedBits50.z)) * reinterpretedBits130;
            productValue15 = (intermediateValue32 * uintBitsToFloat(reinterpretedBits50.y)) * reinterpretedBits130;
            productValue16 = (intermediateValue32 * uintBitsToFloat(reinterpretedBits50.x)) * reinterpretedBits130;
        }
        uvec4 reinterpretedBits39 = floatBitsToUint(computeVectorConstants0.packedValues[32u]);
        float reinterpretedBits131 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[131u]));
        float reinterpretedBits80 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[120u]));
        float reinterpretedBits132 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[107u]));
        float multiplyAddValue157 = ((multiplyAddValue139 * spvNMax(fma(intermediateValue31 * uintBitsToFloat(reinterpretedBits39.x), reinterpretedBits131, productValue16), reinterpretedBits80)) * reinterpretedBits132) * 0.079577468335628509521484375;
        float multiplyAddValue158 = ((multiplyAddValue140 * spvNMax(fma(intermediateValue31 * uintBitsToFloat(reinterpretedBits39.y), reinterpretedBits131, productValue15), reinterpretedBits80)) * reinterpretedBits132) * 0.079577468335628509521484375;
        float multiplyAddValue159 = ((multiplyAddValue141 * spvNMax(fma(intermediateValue31 * uintBitsToFloat(reinterpretedBits39.z), reinterpretedBits131, productValue14), reinterpretedBits80)) * reinterpretedBits132) * 0.079577468335628509521484375;
        float multiplyAddValue33;
        float multiplyAddValue34;
        float multiplyAddValue35;
        if ((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[109u])) == 0.0) || (abs(intermediateValue31) > 9.9999997473787516355514526367188e-05))
        {
            float reinterpretedBits133 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[116u]));
            float multiplyAddValue160 = fma(reinterpretedBits113, uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[117u])) - reinterpretedBits133, reinterpretedBits133);
            vec4 sampledTextureValue32 = texelFetch(materialTexture7, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), int(0u));
            float scalarValue9 = sampledTextureValue32.x;
            float reinterpretedBits57 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[53u]));
            float reinterpretedBits58 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[52u]));
            float reinterpretedBits59 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[54u]));
            float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[55u]));
            float multiplyAddValue55 = fma(reinterpretedBits23, reinterpretedBits60, fma(reinterpretedBits19, reinterpretedBits59, fma(reinterpretedBits15, reinterpretedBits58, reinterpretedBits11 * reinterpretedBits57)));
            float multiplyAddValue56 = fma(reinterpretedBits24, reinterpretedBits60, fma(reinterpretedBits20, reinterpretedBits59, fma(reinterpretedBits16, reinterpretedBits58, reinterpretedBits12 * reinterpretedBits57)));
            float multiplyAddValue57 = fma(reinterpretedBits25, reinterpretedBits60, fma(reinterpretedBits21, reinterpretedBits59, fma(reinterpretedBits17, reinterpretedBits58, reinterpretedBits13 * reinterpretedBits57)));
            vec3 vectorValue1 = vec3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
            float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
            float multiplyAddValue161 = rdDot2Precise(vec2(rdDot3Precise2(vec3(-(multiplyAddValue130 / nonlinearValue8), -(multiplyAddValue131 / nonlinearValue8), -(multiplyAddValue132 / nonlinearValue8)), vec3(multiplyAddValue55 * inverseLengthValue1, multiplyAddValue56 * inverseLengthValue1, multiplyAddValue57 * inverseLengthValue1))), vec2(multiplyAddValue160)) + fma(multiplyAddValue160, multiplyAddValue160, 1.0);
            float multiplyAddValue162 = (fma(-multiplyAddValue160, multiplyAddValue160, 1.0) * 0.079577468335628509521484375) / (sqrt(multiplyAddValue161) * multiplyAddValue161);
            float reinterpretedBits134 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[103u]));
            uvec4 reinterpretedBits135 = floatBitsToUint(computeVectorConstants0.packedValues[25u]);
            multiplyAddValue33 = fma(multiplyAddValue162 * (scalarValue9 * multiplyAddValue141), reinterpretedBits134 * uintBitsToFloat(reinterpretedBits135.z), multiplyAddValue159);
            multiplyAddValue34 = fma(multiplyAddValue162 * (scalarValue9 * multiplyAddValue140), reinterpretedBits134 * uintBitsToFloat(reinterpretedBits135.y), multiplyAddValue158);
            multiplyAddValue35 = fma(multiplyAddValue162 * (scalarValue9 * multiplyAddValue139), reinterpretedBits134 * uintBitsToFloat(reinterpretedBits135.x), multiplyAddValue157);
        }
        else
        {
            multiplyAddValue33 = multiplyAddValue159;
            multiplyAddValue34 = multiplyAddValue158;
            multiplyAddValue35 = multiplyAddValue157;
        }
        imageStore(intermediateValue8, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(multiplyAddValue35, multiplyAddValue34, multiplyAddValue33, fma(reinterpretedBits125, -multiplyAddValue138, multiplyAddValue138)));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                reinterpretedBits35 = uintBitsToFloat(sumValue177);
                reinterpretedBits36 = uintBitsToFloat(sumValue176);
                reinterpretedBits37 = 0.0;
                reinterpretedBits38 = 0.0;
            }
            float multiplyAddValue12;
            float multiplyAddValue13;
            float multiplyAddValue14;
            float multiplyAddValue15;
            if (!comparisonValue131)
            {
                uint productValue258 = (comparisonValue125 * 20u) + 4u;
                uvec4 sampledTextureValue158 = uvec4(texelFetch(intermediateValue8, int(productValue258)).x, texelFetch(intermediateValue8, int(productValue258 + 1u)).x, texelFetch(intermediateValue8, int(productValue258 + 2u)).x, texelFetch(intermediateValue8, int(productValue258 + 3u)).x);
                uint comparisonValue132 = ((comparisonValue126 ? 0u : sampledTextureValue154) * 20u) + 4u;
                uvec4 sampledTextureValue159 = uvec4(texelFetch(intermediateValue8, int(comparisonValue132)).x, texelFetch(intermediateValue8, int(comparisonValue132 + 1u)).x, texelFetch(intermediateValue8, int(comparisonValue132 + 2u)).x, texelFetch(intermediateValue8, int(comparisonValue132 + 3u)).x);
                uint comparisonValue133 = ((comparisonValue127 ? 0u : sampledTextureValue155) * 20u) + 4u;
                uvec4 sampledTextureValue160 = uvec4(texelFetch(intermediateValue8, int(comparisonValue133)).x, texelFetch(intermediateValue8, int(comparisonValue133 + 1u)).x, texelFetch(intermediateValue8, int(comparisonValue133 + 2u)).x, texelFetch(intermediateValue8, int(comparisonValue133 + 3u)).x);
                uint comparisonValue134 = ((comparisonValue128 ? 0u : sampledTextureValue156) * 20u) + 4u;
                uvec4 sampledTextureValue161 = uvec4(texelFetch(intermediateValue8, int(comparisonValue134)).x, texelFetch(intermediateValue8, int(comparisonValue134 + 1u)).x, texelFetch(intermediateValue8, int(comparisonValue134 + 2u)).x, texelFetch(intermediateValue8, int(comparisonValue134 + 3u)).x);
                float scalarValue107 = fract(reinterpretedBits142);
                float scalarValue108 = fract(reinterpretedBits143);
                float sumValue178 = 1.0 - scalarValue108;
                float sumValue179 = 1.0 - scalarValue107;
                float productValue259 = sumValue178 * sumValue179;
                float productValue260 = sumValue178 * scalarValue107;
                float productValue261 = sumValue179 * scalarValue108;
                float productValue262 = scalarValue108 * scalarValue107;
                multiplyAddValue12 = fma(uintBitsToFloat(sampledTextureValue161.x), productValue262, fma(uintBitsToFloat(sampledTextureValue160.x), productValue261, fma(uintBitsToFloat(sampledTextureValue158.x), productValue259, productValue260 * uintBitsToFloat(sampledTextureValue159.x))));
                multiplyAddValue13 = fma(uintBitsToFloat(sampledTextureValue161.y), productValue262, fma(uintBitsToFloat(sampledTextureValue160.y), productValue261, fma(uintBitsToFloat(sampledTextureValue158.y), productValue259, productValue260 * uintBitsToFloat(sampledTextureValue159.y))));
                multiplyAddValue14 = fma(uintBitsToFloat(sampledTextureValue161.z), productValue262, fma(uintBitsToFloat(sampledTextureValue160.z), productValue261, fma(uintBitsToFloat(sampledTextureValue158.z), productValue259, productValue260 * uintBitsToFloat(sampledTextureValue159.z))));
                multiplyAddValue15 = fma(uintBitsToFloat(sampledTextureValue161.w), productValue262, fma(uintBitsToFloat(sampledTextureValue160.w), productValue261, fma(uintBitsToFloat(sampledTextureValue158.w), productValue259, productValue260 * uintBitsToFloat(sampledTextureValue159.w))));
            }
            else
            {
                multiplyAddValue12 = reinterpretedBits35;
                multiplyAddValue13 = reinterpretedBits36;
                multiplyAddValue14 = reinterpretedBits37;
                multiplyAddValue15 = reinterpretedBits38;
            }
            intermediateValue26 = multiplyAddValue12;
            intermediateValue28 = multiplyAddValue13;
            intermediateValue29 = multiplyAddValue14;
            intermediateValue30 = multiplyAddValue15;
        }
        else
        {
            intermediateValue26 = intermediateValue27;
            intermediateValue28 = intermediateValue27;
            intermediateValue29 = intermediateValue27;
            intermediateValue30 = intermediateValue27;
        }
        float reinterpretedBits40;
        float reinterpretedBits41;
        float reinterpretedBits42;
        float reinterpretedBits43;
        if (!reinterpretedBits140)
        {
            uvec4 reinterpretedBits146 = floatBitsToUint(computeVectorConstants0.packedValues[49u]);
            reinterpretedBits40 = uintBitsToFloat(reinterpretedBits146.w);
            reinterpretedBits41 = uintBitsToFloat(reinterpretedBits146.z);
            reinterpretedBits42 = uintBitsToFloat(reinterpretedBits146.y);
            reinterpretedBits43 = uintBitsToFloat(reinterpretedBits146.x);
        }
        else
        {
            reinterpretedBits40 = intermediateValue30;
            reinterpretedBits41 = intermediateValue29;
            reinterpretedBits42 = intermediateValue28;
            reinterpretedBits43 = intermediateValue26;
        }
        float multiplyAddValue187 = spvNClamp(fma(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[80u])), multiplyAddValue181, uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[81u]))), 0.0, 1.0);
        uvec4 reinterpretedBits147 = floatBitsToUint(computeVectorConstants0.packedValues[21u]);
        float reinterpretedBits148 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[87u]));
        float reinterpretedBits149 = (multiplyAddValue187 * uintBitsToFloat(reinterpretedBits147.x)) * reinterpretedBits148;
        float reinterpretedBits150 = (multiplyAddValue187 * uintBitsToFloat(reinterpretedBits147.y)) * reinterpretedBits148;
        float reinterpretedBits151 = (multiplyAddValue187 * uintBitsToFloat(reinterpretedBits147.z)) * reinterpretedBits148;
        float multiplyAddValue188 = fma(reinterpretedBits139, fma(reinterpretedBits43, reinterpretedBits40, -reinterpretedBits149), reinterpretedBits149);
        float multiplyAddValue189 = fma(reinterpretedBits139, fma(reinterpretedBits42, reinterpretedBits40, -reinterpretedBits150), reinterpretedBits150);
        float multiplyAddValue190 = fma(reinterpretedBits139, fma(reinterpretedBits41, reinterpretedBits40, -reinterpretedBits151), reinterpretedBits151);
        float multiplyAddValue191 = fma(reinterpretedBits139, fma(-multiplyAddValue187, reinterpretedBits148, reinterpretedBits40), multiplyAddValue187 * uintBitsToFloat(reinterpretedBits147.w));
        float reinterpretedBits152 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[132u]));
        float multiplyAddValue192 = fma(reinterpretedBits139, uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[133u])) - reinterpretedBits152, reinterpretedBits152);
        vec3 vectorValue6 = vec3(multiplyAddValue183, multiplyAddValue184, multiplyAddValue185);
        float nonlinearValue11 = sqrt(rdDot3Precise2(vectorValue6, vectorValue6));
        float reinterpretedBits153 = spvNClamp((((nonlinearValue11 / uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[90u]))) + uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[172u]))) - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[88u]))) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[89u])), 0.0, 1.0);
        float multiplyAddValue193 = fma(reinterpretedBits153, -multiplyAddValue188, multiplyAddValue188);
        float multiplyAddValue194 = fma(reinterpretedBits153, -multiplyAddValue189, multiplyAddValue189);
        float multiplyAddValue195 = fma(reinterpretedBits153, -multiplyAddValue190, multiplyAddValue190);
        float intermediateValue34;
        float intermediateValue35;
        if ((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[180u])) > 0.5) && (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[95u])) > 0.5))
        {
            vec4 sampledTextureValue162 = textureLod(sampler3D(materialTexture9, textureSampler9), vec3(quotientValue63, 1.0 - quotientValue64, (exp2(((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[181u])) > 0.5) ? (quotientValue65 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[182u]))) : quotientValue65) * 5.770780086517333984375) - 1.0) * 0.0186573602259159088134765625), 0.0);
            intermediateValue34 = sampledTextureValue162.y;
            intermediateValue35 = sampledTextureValue162.x;
        }
        else
        {
            intermediateValue34 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[97u]));
            intermediateValue35 = 0.0;
        }
        bool reinterpretedBits154 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[70u])) != 0.0;
        float productValue14;
        float productValue15;
        float productValue16;
        if (reinterpretedBits154 && (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[131u])) != 0.0))
        {
            uvec4 reinterpretedBits87 = floatBitsToUint(computeVectorConstants0.packedValues[27u]);
            float reinterpretedBits155 = (multiplyAddValue180 - uintBitsToFloat(reinterpretedBits87.x)) - 0.5;
            float reinterpretedBits156 = (multiplyAddValue181 - uintBitsToFloat(reinterpretedBits87.y)) - 0.5;
            float reinterpretedBits157 = (multiplyAddValue182 - uintBitsToFloat(reinterpretedBits87.z)) - 0.4799999892711639404296875;
            uint productValue263 = uint(int(floor(floor(reinterpretedBits155) * 0.0625)));
            uint productValue264 = uint(int(floor(floor(reinterpretedBits156) * 0.0625)));
            uint productValue265 = uint(int(floor(floor(reinterpretedBits157) * 0.0625)));
            uint scalarValue109 = bitfieldInsert(productValue263, productValue264, int(16u), int(16u));
            uint scalarValue110 = bitfieldInsert(131072u, productValue265, int(0u), int(16u));
            uint productValue266 = productValue263 * 1540483477u;
            uint productValue267 = productValue264 * 1540483477u;
            uint productValue268 = productValue265 * 1540483477u;
            uint bitwiseValue54 = ((((((((productValue266 ^ (productValue266 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ ((productValue267 ^ (productValue267 >> 24u)) * 1540483477u)) * 1540483477u) ^ ((productValue268 ^ (productValue268 >> 24u)) * 1540483477u)) * 1540483477u) ^ 2418085729u;
            uint bitwiseValue55 = (bitwiseValue54 ^ (bitwiseValue54 >> 13u)) * 1540483477u;
            uint bitwiseValue56 = (bitwiseValue55 >> 15u) ^ bitwiseValue55;
            uint bitwiseValue57 = (bitwiseValue56 ^ (bitwiseValue56 >> 16u)) & 65535u;
            bool comparisonValue135 = bitwiseValue57 != 0u;
            uint bitwiseValue58 = bitwiseValue57 | 1u;
            uint reinterpretedBits158 = uint(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[64u]))) - 1u;
            uint comparisonValue136 = (comparisonValue135 ? bitwiseValue57 : bitwiseValue58) & reinterpretedBits158;
            uint comparisonValue13;
            uint comparisonValue14;
            uint bitwiseValue5;
            uint sumValue7;
            uint intermediateValue45;
            uint intermediateValue46;
            uint scalarValue46 = 0u;
            uint scalarValue47 = 0u;
            uint scalarValue111 = comparisonValue136;
            uint scalarValue65 = 0u;
            for (;;)
            {
                if (int(scalarValue65) >= int(8u))
                {
                    intermediateValue45 = scalarValue47;
                    intermediateValue46 = scalarValue46;
                    break;
                }
                uint productValue269 = scalarValue111 * 4u;
                uvec4 sampledTextureValue163 = uvec4(texelFetch(intermediateValue6, int(productValue269)).x, texelFetch(intermediateValue6, int(productValue269 + 1u)).x, texelFetch(intermediateValue6, int(productValue269 + 2u)).x, texelFetch(intermediateValue6, int(productValue269 + 3u)).x);
                uint bitwiseValue59 = sampledTextureValue163.z & 65535u;
                bool comparisonValue137 = (scalarValue110 == sampledTextureValue163.y) && (((comparisonValue135 && (bitwiseValue57 == bitwiseValue59)) || ((bitwiseValue58 == bitwiseValue59) && (!comparisonValue135))) && (scalarValue109 == sampledTextureValue163.x));
                bool comparisonValue97 = scalarValue46 != 0u;
                comparisonValue14 = (comparisonValue97 || (!comparisonValue137)) ? scalarValue47 : sampledTextureValue163.w;
                comparisonValue13 = comparisonValue137 ? 4294967295u : scalarValue46;
                bitwiseValue5 = reinterpretedBits158 & (scalarValue111 + 1u);
                bool comparisonValue138 = (bitwiseValue59 == 0u) || comparisonValue137;
                if (comparisonValue138 || ((!comparisonValue138) && comparisonValue97))
                {
                    intermediateValue45 = comparisonValue14;
                    intermediateValue46 = comparisonValue13;
                    break;
                }
                sumValue7 = scalarValue65 + 1u;
                scalarValue46 = comparisonValue13;
                scalarValue47 = comparisonValue14;
                scalarValue111 = bitwiseValue5;
                scalarValue65 = sumValue7;
                continue;
            }
            float multiplyAddValue48;
            float multiplyAddValue49;
            float multiplyAddValue50;
            if (intermediateValue46 != 0u)
            {
                float productValue270 = floor(reinterpretedBits155 * 0.0625);
                float productValue271 = floor(reinterpretedBits156 * 0.0625);
                float productValue272 = floor(reinterpretedBits157 * 0.0625);
                float multiplyAddValue196 = fma(-productValue270, 16.0, reinterpretedBits155);
                float multiplyAddValue197 = fma(-productValue271, 16.0, reinterpretedBits156);
                float multiplyAddValue198 = fma(-productValue272, 16.0, reinterpretedBits157);
                uint bitwiseValue60 = intermediateValue45 >> 2u;
                float scalarValue112 = floor(multiplyAddValue196);
                float scalarValue113 = floor(multiplyAddValue197);
                float scalarValue114 = floor(multiplyAddValue198);
                float sumValue180 = multiplyAddValue196 - scalarValue112;
                float sumValue181 = multiplyAddValue197 - scalarValue113;
                float sumValue182 = multiplyAddValue198 - scalarValue114;
                uint comparisonValue139 = bitfieldInsert(bitfieldInsert(0u, (sumValue181 >= sumValue182) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue180 >= sumValue181) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue180 >= sumValue182) ? 4294967295u : 0u, int(2u), int(1u));
                float scalarValue115 = spvNMin(sumValue181, sumValue180);
                float scalarValue116 = spvNMax(sumValue181, sumValue180);
                float scalarValue117 = spvNMax(sumValue182, scalarValue116);
                float scalarValue118 = spvNMin(sumValue182, scalarValue115);
                float scalarValue119 = spvNMax(scalarValue115, spvNMin(sumValue182, scalarValue116));
                float sumValue183 = 1.0 - scalarValue117;
                float sumValue184 = scalarValue117 - scalarValue119;
                float sumValue185 = scalarValue119 - scalarValue118;
                float sumValue186 = scalarValue112 + 1.0;
                float sumValue187 = scalarValue113 + 1.0;
                float sumValue188 = scalarValue114 + 1.0;
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
                if ((((sumValue186 < 16.0) && (sumValue187 < 16.0)) && (sumValue188 < 16.0)) && (((scalarValue112 >= 0.0) && (scalarValue113 >= 0.0)) && (scalarValue114 >= 0.0)))
                {
                    uint scalarValue120 = uint(scalarValue112);
                    uint scalarValue121 = uint(scalarValue113);
                    uint scalarValue122 = uint(scalarValue114);
                    uint scalarValue123 = min(comparisonValue139, 72u);
                    uint sumValue189 = min((comparisonValue139 + 5u), 72u);
                    uvec4 sampledTextureValue164 = texelFetch(intermediateValue7, int(bitwiseValue60 + (((scalarValue122 << 4u) + scalarValue121) + (scalarValue120 << 8u))));
                    uint scalarValue124 = sampledTextureValue164.x;
                    float bitwiseValue61 = rdEvaluateFloatExpression((scalarValue124 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue140 = scalarValue124 != 0u;
                    uvec4 sampledTextureValue165 = texelFetch(intermediateValue7, int(bitwiseValue60 + ((((uint(comparisonValue139 < 2u) + scalarValue122) << 4u) + (intermediateValue16[scalarValue123].y + scalarValue121)) + ((scalarValue120 + intermediateValue16[scalarValue123].x) << 8u))));
                    uint scalarValue125 = sampledTextureValue165.x;
                    float bitwiseValue62 = rdEvaluateFloatExpression((scalarValue125 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue141 = scalarValue125 != 0u;
                    uvec4 sampledTextureValue166 = texelFetch(intermediateValue7, int(bitwiseValue60 + ((((uint(comparisonValue139 < 6u) + scalarValue122) << 4u) + (intermediateValue16[sumValue189].x + scalarValue121)) + ((scalarValue120 + intermediateValue16[sumValue189].y) << 8u))));
                    uint scalarValue126 = sampledTextureValue166.x;
                    float bitwiseValue63 = rdEvaluateFloatExpression((scalarValue126 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue142 = scalarValue126 != 0u;
                    uvec4 sampledTextureValue167 = texelFetch(intermediateValue7, int(bitwiseValue60 + ((((scalarValue122 + 1u) << 4u) + (scalarValue121 + 1u)) + ((scalarValue120 + 1u) << 8u))));
                    uint scalarValue127 = sampledTextureValue167.x;
                    float bitwiseValue64 = rdEvaluateFloatExpression((scalarValue127 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue143 = scalarValue127 != 0u;
                    comparisonValue32 = comparisonValue143 ? ((bitwiseValue64 * (rdEvaluateFloatExpression((scalarValue127 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue33 = comparisonValue143 ? ((bitwiseValue64 * (rdEvaluateFloatExpression((scalarValue127 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue34 = comparisonValue143 ? ((bitwiseValue64 * (rdEvaluateFloatExpression(scalarValue127 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue35 = comparisonValue142 ? ((bitwiseValue63 * (rdEvaluateFloatExpression((scalarValue126 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue36 = comparisonValue142 ? ((bitwiseValue63 * (rdEvaluateFloatExpression((scalarValue126 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue37 = comparisonValue142 ? ((bitwiseValue63 * (rdEvaluateFloatExpression(scalarValue126 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue38 = comparisonValue140 ? ((bitwiseValue61 * (rdEvaluateFloatExpression((scalarValue124 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue39 = comparisonValue140 ? ((bitwiseValue61 * (rdEvaluateFloatExpression((scalarValue124 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue40 = comparisonValue140 ? ((bitwiseValue61 * (rdEvaluateFloatExpression(scalarValue124 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue41 = comparisonValue141 ? ((bitwiseValue62 * (rdEvaluateFloatExpression((scalarValue125 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue42 = comparisonValue141 ? ((bitwiseValue62 * (rdEvaluateFloatExpression((scalarValue125 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue43 = comparisonValue141 ? ((bitwiseValue62 * (rdEvaluateFloatExpression(scalarValue125 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                else
                {
                    uint scalarValue128 = min(comparisonValue139, 72u);
                    float sumValue190 = scalarValue112 + rdEvaluateFloatExpression(intermediateValue16[scalarValue128].x);
                    float sumValue191 = scalarValue113 + rdEvaluateFloatExpression(intermediateValue16[scalarValue128].y);
                    float sumValue192 = scalarValue114 + rdEvaluateFloatExpression(uint(comparisonValue139 < 2u));
                    uint sumValue193 = min((comparisonValue139 + 5u), 72u);
                    float sumValue194 = scalarValue112 + rdEvaluateFloatExpression(intermediateValue16[sumValue193].y);
                    float sumValue195 = scalarValue113 + rdEvaluateFloatExpression(intermediateValue16[sumValue193].x);
                    float sumValue196 = scalarValue114 + rdEvaluateFloatExpression(uint(comparisonValue139 < 6u));
                    float multiplyAddValue199 = fma(productValue270, 16.0, scalarValue112);
                    float multiplyAddValue200 = fma(productValue271, 16.0, scalarValue113);
                    float multiplyAddValue201 = fma(productValue272, 16.0, scalarValue114);
                    uint comparisonValue144 = min((((((bitfieldInsert(bitfieldInsert(0u, (scalarValue112 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (scalarValue112 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (scalarValue113 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (scalarValue113 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (scalarValue114 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (scalarValue114 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 8u), 72u);
                    bool conditionValue16 = int(intermediateValue16[comparisonValue144].z) < int(0u);
                    uint sumValue197 = bitwiseValue60 + 4097u;
                    uvec4 sampledTextureValue168 = texelFetch(intermediateValue7, int(bitwiseValue60 + 4096u));
                    uint scalarValue129 = sampledTextureValue168.x;
                    uvec4 sampledTextureValue169 = texelFetch(intermediateValue7, int(conditionValue16 ? (bitwiseValue60 + (bitfieldInsert(bitfieldInsert(0u, uint(scalarValue114), int(4u), int(4u)), uint(scalarValue113), int(0u), int(4u)) + bitfieldInsert(0u, uint(scalarValue112), int(8u), int(4u)))) : ((texelFetch(intermediateValue7, int(intermediateValue16[comparisonValue144].z + sumValue197)).x >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue201 * 0.0625), 16.0, multiplyAddValue201)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue200 * 0.0625), 16.0, multiplyAddValue200)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue199 * 0.0625), 16.0, multiplyAddValue199)), int(8u), int(4u))))));
                    uint scalarValue130 = sampledTextureValue169.x;
                    float bitwiseValue65 = rdEvaluateFloatExpression((scalarValue130 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue145 = (conditionValue16 || ((scalarValue129 & (1u << (intermediateValue16[comparisonValue144].z & 31u))) != 0u)) && (scalarValue130 != 0u);
                    float multiplyAddValue202 = fma(productValue270, 16.0, sumValue190);
                    float multiplyAddValue203 = fma(productValue271, 16.0, sumValue191);
                    float multiplyAddValue204 = fma(productValue272, 16.0, sumValue192);
                    uint comparisonValue146 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue190 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue190 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue191 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue191 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue192 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue192 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 8u), 72u);
                    bool conditionValue17 = int(intermediateValue16[comparisonValue146].z) < int(0u);
                    uvec4 sampledTextureValue170 = texelFetch(intermediateValue7, int(conditionValue17 ? (bitwiseValue60 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue192), int(4u), int(4u)), uint(sumValue191), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue190), int(8u), int(4u)))) : ((texelFetch(intermediateValue7, int(intermediateValue16[comparisonValue146].z + sumValue197)).x >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue204 * 0.0625), 16.0, multiplyAddValue204)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue203 * 0.0625), 16.0, multiplyAddValue203)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue202 * 0.0625), 16.0, multiplyAddValue202)), int(8u), int(4u))))));
                    uint scalarValue131 = sampledTextureValue170.x;
                    float bitwiseValue66 = rdEvaluateFloatExpression((scalarValue131 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue147 = (conditionValue17 || ((scalarValue129 & (1u << (intermediateValue16[comparisonValue146].z & 31u))) != 0u)) && (scalarValue131 != 0u);
                    float multiplyAddValue205 = fma(productValue270, 16.0, sumValue194);
                    float multiplyAddValue206 = fma(productValue271, 16.0, sumValue195);
                    float multiplyAddValue207 = fma(productValue272, 16.0, sumValue196);
                    uint comparisonValue148 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue194 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue194 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue195 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue195 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue196 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue196 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 8u), 72u);
                    bool conditionValue18 = int(intermediateValue16[comparisonValue148].z) < int(0u);
                    uvec4 sampledTextureValue171 = texelFetch(intermediateValue7, int(conditionValue18 ? (bitwiseValue60 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue196), int(4u), int(4u)), uint(sumValue195), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue194), int(8u), int(4u)))) : ((texelFetch(intermediateValue7, int(intermediateValue16[comparisonValue148].z + sumValue197)).x >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue207 * 0.0625), 16.0, multiplyAddValue207)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue206 * 0.0625), 16.0, multiplyAddValue206)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue205 * 0.0625), 16.0, multiplyAddValue205)), int(8u), int(4u))))));
                    uint scalarValue132 = sampledTextureValue171.x;
                    float bitwiseValue67 = rdEvaluateFloatExpression((scalarValue132 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue149 = (conditionValue18 || ((scalarValue129 & (1u << (intermediateValue16[comparisonValue148].z & 31u))) != 0u)) && (scalarValue132 != 0u);
                    float multiplyAddValue208 = fma(productValue270, 16.0, sumValue186);
                    float multiplyAddValue209 = fma(productValue271, 16.0, sumValue187);
                    float multiplyAddValue210 = fma(productValue272, 16.0, sumValue188);
                    uint comparisonValue150 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue186 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue186 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue187 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue187 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue188 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue188 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 8u), 72u);
                    bool conditionValue19 = int(intermediateValue16[comparisonValue150].z) < int(0u);
                    uvec4 sampledTextureValue172 = texelFetch(intermediateValue7, int(conditionValue19 ? (bitwiseValue60 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue188), int(4u), int(4u)), uint(sumValue187), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue186), int(8u), int(4u)))) : ((texelFetch(intermediateValue7, int(intermediateValue16[comparisonValue150].z + sumValue197)).x >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue210 * 0.0625), 16.0, multiplyAddValue210)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue209 * 0.0625), 16.0, multiplyAddValue209)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue208 * 0.0625), 16.0, multiplyAddValue208)), int(8u), int(4u))))));
                    uint scalarValue133 = sampledTextureValue172.x;
                    float bitwiseValue68 = rdEvaluateFloatExpression((scalarValue133 >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue151 = (conditionValue19 || ((scalarValue129 & (1u << (intermediateValue16[comparisonValue150].z & 31u))) != 0u)) && (scalarValue133 != 0u);
                    comparisonValue32 = comparisonValue151 ? ((bitwiseValue68 * (rdEvaluateFloatExpression((scalarValue133 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue33 = comparisonValue151 ? ((bitwiseValue68 * (rdEvaluateFloatExpression((scalarValue133 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue34 = comparisonValue151 ? ((bitwiseValue68 * (rdEvaluateFloatExpression(scalarValue133 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue35 = comparisonValue149 ? ((bitwiseValue67 * (rdEvaluateFloatExpression((scalarValue132 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue36 = comparisonValue149 ? ((bitwiseValue67 * (rdEvaluateFloatExpression((scalarValue132 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue37 = comparisonValue149 ? ((bitwiseValue67 * (rdEvaluateFloatExpression(scalarValue132 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue38 = comparisonValue145 ? ((bitwiseValue65 * (rdEvaluateFloatExpression((scalarValue130 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue39 = comparisonValue145 ? ((bitwiseValue65 * (rdEvaluateFloatExpression((scalarValue130 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue40 = comparisonValue145 ? ((bitwiseValue65 * (rdEvaluateFloatExpression(scalarValue130 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue41 = comparisonValue147 ? ((bitwiseValue66 * (rdEvaluateFloatExpression((scalarValue131 >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue42 = comparisonValue147 ? ((bitwiseValue66 * (rdEvaluateFloatExpression((scalarValue131 >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue43 = comparisonValue147 ? ((bitwiseValue66 * (rdEvaluateFloatExpression(scalarValue131 & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                multiplyAddValue48 = fma(comparisonValue32, scalarValue118, fma(comparisonValue35, sumValue185, fma(comparisonValue38, sumValue183, sumValue184 * comparisonValue41)));
                multiplyAddValue49 = fma(comparisonValue33, scalarValue118, fma(comparisonValue36, sumValue185, fma(comparisonValue39, sumValue183, sumValue184 * comparisonValue42)));
                multiplyAddValue50 = fma(comparisonValue34, scalarValue118, fma(comparisonValue37, sumValue185, fma(comparisonValue40, sumValue183, sumValue184 * comparisonValue43)));
            }
            else
            {
                multiplyAddValue48 = 0.0;
                multiplyAddValue49 = 0.0;
                multiplyAddValue50 = 0.0;
            }
            float reinterpretedBits53 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[59u]));
            float reinterpretedBits159 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[184u]));
            productValue14 = (multiplyAddValue48 * reinterpretedBits53) * reinterpretedBits159;
            productValue15 = (multiplyAddValue49 * reinterpretedBits53) * reinterpretedBits159;
            productValue16 = (multiplyAddValue50 * reinterpretedBits53) * reinterpretedBits159;
        }
        else
        {
            uvec4 reinterpretedBits50 = floatBitsToUint(computeVectorConstants0.packedValues[14u]);
            float reinterpretedBits130 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[59u]));
            productValue14 = (intermediateValue35 * uintBitsToFloat(reinterpretedBits50.z)) * reinterpretedBits130;
            productValue15 = (intermediateValue35 * uintBitsToFloat(reinterpretedBits50.y)) * reinterpretedBits130;
            productValue16 = (intermediateValue35 * uintBitsToFloat(reinterpretedBits50.x)) * reinterpretedBits130;
        }
        uvec4 reinterpretedBits160 = floatBitsToUint(computeVectorConstants0.packedValues[44u]);
        float reinterpretedBits161 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[179u]));
        float reinterpretedBits162 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[136u]));
        float reinterpretedBits163 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[123u]));
        float multiplyAddValue211 = ((multiplyAddValue193 * spvNMax(fma(intermediateValue34 * uintBitsToFloat(reinterpretedBits160.x), reinterpretedBits161, productValue16), reinterpretedBits162)) * reinterpretedBits163) * 0.079577468335628509521484375;
        float multiplyAddValue212 = ((multiplyAddValue194 * spvNMax(fma(intermediateValue34 * uintBitsToFloat(reinterpretedBits160.y), reinterpretedBits161, productValue15), reinterpretedBits162)) * reinterpretedBits163) * 0.079577468335628509521484375;
        float multiplyAddValue213 = ((multiplyAddValue195 * spvNMax(fma(intermediateValue34 * uintBitsToFloat(reinterpretedBits160.z), reinterpretedBits161, productValue14), reinterpretedBits162)) * reinterpretedBits163) * 0.079577468335628509521484375;
        float quotientValue66 = multiplyAddValue183 / nonlinearValue11;
        float quotientValue67 = multiplyAddValue184 / nonlinearValue11;
        float quotientValue68 = multiplyAddValue185 / nonlinearValue11;
        float multiplyAddValue33;
        float multiplyAddValue34;
        float multiplyAddValue35;
        if ((uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[125u])) == 0.0) || (abs(intermediateValue34) > 9.9999997473787516355514526367188e-05))
        {
            vec4 sampledTextureValue32 = texelFetch(materialTexture7, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), int(0u));
            float scalarValue9 = sampledTextureValue32.x;
            float reinterpretedBits57 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[53u]));
            float reinterpretedBits58 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[52u]));
            float reinterpretedBits59 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[54u]));
            float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[55u]));
            float multiplyAddValue55 = fma(reinterpretedBits23, reinterpretedBits60, fma(reinterpretedBits19, reinterpretedBits59, fma(reinterpretedBits15, reinterpretedBits58, reinterpretedBits11 * reinterpretedBits57)));
            float multiplyAddValue56 = fma(reinterpretedBits24, reinterpretedBits60, fma(reinterpretedBits20, reinterpretedBits59, fma(reinterpretedBits16, reinterpretedBits58, reinterpretedBits12 * reinterpretedBits57)));
            float multiplyAddValue57 = fma(reinterpretedBits25, reinterpretedBits60, fma(reinterpretedBits21, reinterpretedBits59, fma(reinterpretedBits17, reinterpretedBits58, reinterpretedBits13 * reinterpretedBits57)));
            vec3 vectorValue1 = vec3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
            float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
            float multiplyAddValue214 = rdDot2Precise(vec2(rdDot3Precise2(vec3(-quotientValue66, -quotientValue67, -quotientValue68), vec3(inverseLengthValue1 * multiplyAddValue55, inverseLengthValue1 * multiplyAddValue56, inverseLengthValue1 * multiplyAddValue57))), vec2(multiplyAddValue192)) + fma(multiplyAddValue192, multiplyAddValue192, 1.0);
            float multiplyAddValue215 = (fma(-multiplyAddValue192, multiplyAddValue192, 1.0) * 0.079577468335628509521484375) / (multiplyAddValue214 * sqrt(multiplyAddValue214));
            float reinterpretedBits52 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[119u]));
            uvec4 reinterpretedBits51 = floatBitsToUint(computeVectorConstants0.packedValues[29u]);
            multiplyAddValue33 = fma(multiplyAddValue215 * (scalarValue9 * multiplyAddValue193), reinterpretedBits52 * uintBitsToFloat(reinterpretedBits51.x), multiplyAddValue211);
            multiplyAddValue34 = fma(multiplyAddValue215 * (scalarValue9 * multiplyAddValue194), reinterpretedBits52 * uintBitsToFloat(reinterpretedBits51.y), multiplyAddValue212);
            multiplyAddValue35 = fma(multiplyAddValue215 * (scalarValue9 * multiplyAddValue195), reinterpretedBits52 * uintBitsToFloat(reinterpretedBits51.z), multiplyAddValue213);
        }
        else
        {
            multiplyAddValue33 = multiplyAddValue211;
            multiplyAddValue34 = multiplyAddValue212;
            multiplyAddValue35 = multiplyAddValue213;
        }
        float multiplyAddValue38;
        float multiplyAddValue39;
        float multiplyAddValue40;
        if (reinterpretedBits154 && (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[193u])) != 0.0))
        {
            float reinterpretedBits164 = 1.0 - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[184u]));
            float scalarValue134 = -multiplyAddValue185;
            float reinterpretedBits165 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[102u]));
            float productValue273 = scalarValue134 * reinterpretedBits165;
            float reinterpretedBits134 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[103u]));
            uvec4 reinterpretedBits135 = floatBitsToUint(computeVectorConstants0.packedValues[25u]);
            bool reinterpretedBits166 = scalarValue134 < uintBitsToFloat(reinterpretedBits135.x);
            bool reinterpretedBits167 = scalarValue134 < uintBitsToFloat(reinterpretedBits135.y);
            uvec4 reinterpretedBits168 = floatBitsToUint(computeVectorConstants0.packedValues[28u]);
            float reinterpretedBits169 = uintBitsToFloat(reinterpretedBits168.x);
            float reinterpretedBits170 = uintBitsToFloat(reinterpretedBits168.y);
            float reinterpretedBits171 = uintBitsToFloat(reinterpretedBits168.z);
            float nonlinearValue12 = spvNMin(reinterpretedBits171 - 1.0, floor(spvNClamp((log2(scalarValue134) - uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[150u]))) * uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[148u])), 0.0, 1.0) * (reinterpretedBits171 - 2.0)) + 2.0);
            float comparisonValue152 = reinterpretedBits167 ? 1.0 : nonlinearValue12;
            float multiplyAddValue216 = spvNMin(reinterpretedBits170 - 1.0, floor(spvNClamp(fma(scalarValue134, reinterpretedBits165, multiplyAddValue184) / (productValue273 + productValue273), 0.0, 1.0) * reinterpretedBits170));
            float multiplyAddValue217 = spvNMin(reinterpretedBits169 - 1.0, floor(spvNClamp(fma(productValue273, reinterpretedBits134, multiplyAddValue183) / fma(productValue273, reinterpretedBits134, productValue273 * reinterpretedBits134), 0.0, 1.0) * reinterpretedBits169));
            float reinterpretedBits172 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[112u]));
            float reinterpretedBits173 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[113u]));
            float intermediateValue48;
            float intermediateValue50;
            float intermediateValue52;
            if (!(((((((nonlinearValue12 < 0.0) && (!reinterpretedBits167)) && (!reinterpretedBits166)) || ((multiplyAddValue217 < 0.0) || (multiplyAddValue216 < 0.0))) || (multiplyAddValue217 >= reinterpretedBits172)) || (multiplyAddValue216 >= reinterpretedBits173)) || ((reinterpretedBits166 ? 0.0 : comparisonValue152) >= uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[114u])))))
            {
                float multiplyAddValue218 = fma(multiplyAddValue216, reinterpretedBits172, multiplyAddValue217);
                uint reinterpretedBits174 = uint(int(uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[115u]))));
                uint multiplyAddValue219 = uint(int(reinterpretedBits166 ? multiplyAddValue218 : fma(reinterpretedBits173, reinterpretedBits172 * comparisonValue152, multiplyAddValue218))) * reinterpretedBits174;
                uint sumValue198 = multiplyAddValue219 + reinterpretedBits174;
                bool reinterpretedBits27 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[60u])) > 0.0;
                bool reinterpretedBits175 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[144u])) > 0.0;
                float reinterpretedBits176 = uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[140u]));
                float scalarValue135 = -reinterpretedBits176;
                uvec4 reinterpretedBits177 = floatBitsToUint(computeVectorConstants0.packedValues[42u]);
                float reinterpretedBits178 = uintBitsToFloat(reinterpretedBits177.x);
                float reinterpretedBits179 = uintBitsToFloat(reinterpretedBits177.y);
                float quotientValue69 = 0.5 / reinterpretedBits178;
                float quotientValue70 = 0.5 / reinterpretedBits179;
                float reinterpretedBits180 = 1.0 / (uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[141u])) - reinterpretedBits176);
                float multiplyAddValue220 = fma(multiplyAddValue192, multiplyAddValue192, 1.0);
                float sumValue199 = multiplyAddValue192 + multiplyAddValue192;
                float multiplyAddValue221 = fma(-multiplyAddValue192, multiplyAddValue192, 1.0) * 0.079577468335628509521484375;
                float intermediateValue49;
                float intermediateValue51;
                float intermediateValue53;
                intermediateValue53 = 0.0;
                intermediateValue51 = 0.0;
                intermediateValue49 = 0.0;
                float multiplyAddValue51;
                float multiplyAddValue52;
                float multiplyAddValue53;
                uint sumValue19;
                uint scalarValue136 = multiplyAddValue219;
                for (;;)
                {
                    if (int(sumValue198) <= int(scalarValue136))
                    {
                        break;
                    }
                    uint sampledTextureValue173 = uint(int(uintBitsToFloat(texelFetch(intermediateValue9, int(scalarValue136)).x)));
                    if (int(sampledTextureValue173) < int(0u))
                    {
                        break;
                    }
                    float intermediateValue83;
                    float intermediateValue84;
                    float intermediateValue85;
                    bool intermediateValue86;
                    if (int(sampledTextureValue173) >= int(0u))
                    {
                        uint productValue274 = sampledTextureValue173 * 32u;
                        vec4 sampledTextureValue174 = uintBitsToFloat(uvec4(texelFetch(intermediateValue10, int(productValue274)).x, texelFetch(intermediateValue10, int(productValue274 + 1u)).x, texelFetch(intermediateValue10, int(productValue274 + 2u)).x, texelFetch(intermediateValue10, int(productValue274 + 3u)).x));
                        float scalarValue137 = sampledTextureValue174.w;
                        float sumValue200 = sampledTextureValue174.x - multiplyAddValue180;
                        float sumValue201 = sampledTextureValue174.y - multiplyAddValue181;
                        float sumValue202 = sampledTextureValue174.z - multiplyAddValue182;
                        float sumValue203 = abs(sumValue202) + (abs(sumValue201) + abs(sumValue200));
                        vec3 vectorValue7 = vec3(sumValue200, sumValue201, sumValue202);
                        float comparisonValue153 = reinterpretedBits27 ? (sumValue203 * sumValue203) : rdDot3Precise2(vectorValue7, vectorValue7);
                        float productValue23;
                        float productValue24;
                        float productValue25;
                        bool intermediateValue87;
                        if (comparisonValue153 < (scalarValue137 * scalarValue137))
                        {
                            bool intermediateValue92;
                            if (reinterpretedBits154)
                            {
                                uint productValue275 = sampledTextureValue173 * 32u;
                                vec3 sampledTextureValue175 = uintBitsToFloat(uvec3(texelFetch(intermediateValue10, int(productValue275)).x, texelFetch(intermediateValue10, int(productValue275 + 1u)).x, texelFetch(intermediateValue10, int(productValue275 + 2u)).x));
                                float scalarValue138 = sampledTextureValue175.x;
                                float scalarValue139 = sampledTextureValue175.y;
                                float scalarValue140 = sampledTextureValue175.z;
                                uint productValue276 = (sampledTextureValue173 * 32u) + 8u;
                                vec4 sampledTextureValue176 = uintBitsToFloat(uvec4(texelFetch(intermediateValue10, int(productValue276)).x, texelFetch(intermediateValue10, int(productValue276 + 1u)).x, texelFetch(intermediateValue10, int(productValue276 + 2u)).x, texelFetch(intermediateValue10, int(productValue276 + 3u)).x));
                                uint productValue277 = (sampledTextureValue173 * 32u) + 12u;
                                vec4 sampledTextureValue177 = uintBitsToFloat(uvec4(texelFetch(intermediateValue10, int(productValue277)).x, texelFetch(intermediateValue10, int(productValue277 + 1u)).x, texelFetch(intermediateValue10, int(productValue277 + 2u)).x, texelFetch(intermediateValue10, int(productValue277 + 3u)).x));
                                uint productValue278 = (sampledTextureValue173 * 32u) + 16u;
                                vec4 sampledTextureValue178 = uintBitsToFloat(uvec4(texelFetch(intermediateValue10, int(productValue278)).x, texelFetch(intermediateValue10, int(productValue278 + 1u)).x, texelFetch(intermediateValue10, int(productValue278 + 2u)).x, texelFetch(intermediateValue10, int(productValue278 + 3u)).x));
                                uint productValue279 = (sampledTextureValue173 * 32u) + 20u;
                                vec4 sampledTextureValue179 = uintBitsToFloat(uvec4(texelFetch(intermediateValue10, int(productValue279)).x, texelFetch(intermediateValue10, int(productValue279 + 1u)).x, texelFetch(intermediateValue10, int(productValue279 + 2u)).x, texelFetch(intermediateValue10, int(productValue279 + 3u)).x));
                                uint productValue280 = (sampledTextureValue173 * 32u) + 24u;
                                vec4 sampledTextureValue180 = uintBitsToFloat(uvec4(texelFetch(intermediateValue10, int(productValue280)).x, texelFetch(intermediateValue10, int(productValue280 + 1u)).x, texelFetch(intermediateValue10, int(productValue280 + 2u)).x, texelFetch(intermediateValue10, int(productValue280 + 3u)).x));
                                uint productValue281 = (sampledTextureValue173 * 32u) + 28u;
                                vec4 sampledTextureValue181 = uintBitsToFloat(uvec4(texelFetch(intermediateValue10, int(productValue281)).x, texelFetch(intermediateValue10, int(productValue281 + 1u)).x, texelFetch(intermediateValue10, int(productValue281 + 2u)).x, texelFetch(intermediateValue10, int(productValue281 + 3u)).x));
                                float sumValue204 = multiplyAddValue180 - scalarValue138;
                                float sumValue205 = multiplyAddValue181 - scalarValue139;
                                float sumValue206 = multiplyAddValue182 - scalarValue140;
                                float scalarValue141 = abs(sumValue204);
                                float scalarValue142 = abs(sumValue205);
                                float scalarValue143 = abs(sumValue206);
                                bool comparisonValue154 = scalarValue142 >= scalarValue143;
                                bool comparisonValue155 = (scalarValue141 >= scalarValue143) && (scalarValue141 >= scalarValue142);
                                bool comparisonValue156 = sumValue205 >= 0.0;
                                bool comparisonValue157 = sumValue206 >= 0.0;
                                bool conditionValue20 = !comparisonValue155;
                                bool comparisonValue158 = (!(sumValue204 >= 0.0)) && comparisonValue155;
                                bool bitwiseValue69 = (comparisonValue156 && comparisonValue154) && conditionValue20;
                                bool bitwiseValue70 = (comparisonValue154 && (!comparisonValue156)) && conditionValue20;
                                bool bitwiseValue71 = ((!comparisonValue154) && comparisonValue157) && conditionValue20;
                                bool bitwiseValue72 = (comparisonValue157 || comparisonValue154) || comparisonValue155;
                                float comparisonValue159 = comparisonValue158 ? sampledTextureValue177.z : (bitwiseValue69 ? sampledTextureValue178.z : (bitwiseValue70 ? sampledTextureValue179.z : (bitwiseValue71 ? sampledTextureValue180.z : (bitwiseValue72 ? sampledTextureValue176.z : sampledTextureValue181.z))));
                                float comparisonValue160 = comparisonValue158 ? sampledTextureValue177.w : (bitwiseValue69 ? sampledTextureValue178.w : (bitwiseValue70 ? sampledTextureValue179.w : (bitwiseValue71 ? sampledTextureValue180.w : (bitwiseValue72 ? sampledTextureValue176.w : sampledTextureValue181.w))));
                                bool multiplyAddValue70;
                                if (!((comparisonValue160 == 0.0) && (comparisonValue159 == 0.0)))
                                {
                                    float scalarValue144 = scalarValue138 - multiplyAddValue180;
                                    float sumValue207 = scalarValue140 - multiplyAddValue182;
                                    float comparisonValue161 = comparisonValue158 ? sampledTextureValue177.x : (bitwiseValue69 ? sampledTextureValue178.x : (bitwiseValue70 ? sampledTextureValue179.x : (bitwiseValue71 ? sampledTextureValue180.x : (bitwiseValue72 ? sampledTextureValue176.x : sampledTextureValue181.x))));
                                    float comparisonValue162 = comparisonValue158 ? sampledTextureValue177.y : (bitwiseValue69 ? sampledTextureValue178.y : (bitwiseValue70 ? sampledTextureValue179.y : (bitwiseValue71 ? sampledTextureValue180.y : (bitwiseValue72 ? sampledTextureValue176.y : sampledTextureValue181.y))));
                                    float comparisonValue163 = comparisonValue158 ? sumValue207 : ((bitwiseValue69 || (bitwiseValue70 || bitwiseValue71)) ? scalarValue144 : (bitwiseValue72 ? sumValue206 : sumValue204));
                                    float comparisonValue164 = comparisonValue158 ? sumValue205 : (bitwiseValue69 ? sumValue207 : (bitwiseValue70 ? sumValue206 : sumValue205));
                                    float comparisonValue165 = comparisonValue158 ? sumValue204 : (bitwiseValue69 ? (scalarValue139 - multiplyAddValue181) : (bitwiseValue70 ? sumValue205 : (bitwiseValue71 ? sumValue207 : (bitwiseValue72 ? scalarValue144 : sumValue206))));
                                    uvec4 reinterpretedBits102 = floatBitsToUint(computeVectorConstants0.packedValues[39u]);
                                    uvec4 reinterpretedBits109 = floatBitsToUint(computeVectorConstants0.packedValues[38u]);
                                    uvec4 reinterpretedBits181 = floatBitsToUint(computeVectorConstants0.packedValues[40u]);
                                    uvec4 reinterpretedBits82 = floatBitsToUint(computeVectorConstants0.packedValues[41u]);
                                    float multiplyAddValue222 = fma(uintBitsToFloat(reinterpretedBits181.w), comparisonValue165, fma(uintBitsToFloat(reinterpretedBits109.w), comparisonValue163, comparisonValue164 * uintBitsToFloat(reinterpretedBits102.w))) + uintBitsToFloat(reinterpretedBits82.w);
                                    float sumValue208 = comparisonValue159 - comparisonValue161;
                                    float sumValue209 = comparisonValue160 - comparisonValue162;
                                    float productValue282 = sumValue208 * reinterpretedBits178;
                                    float productValue283 = sumValue209 * reinterpretedBits179;
                                    vec4 sampledTextureValue182 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(spvNMin(comparisonValue159 - quotientValue69, spvNMax(quotientValue69 + comparisonValue161, fma((floor(fma((fma(uintBitsToFloat(reinterpretedBits181.x), comparisonValue165, fma(uintBitsToFloat(reinterpretedBits109.x), comparisonValue163, comparisonValue164 * uintBitsToFloat(reinterpretedBits102.x))) + uintBitsToFloat(reinterpretedBits82.x)) / multiplyAddValue222, 0.5, 0.5) * productValue282) + 0.5) / productValue282, sumValue208, comparisonValue161))), spvNMin(comparisonValue160 - quotientValue70, spvNMax(quotientValue70 + comparisonValue162, fma((floor((1.0 - fma((fma(uintBitsToFloat(reinterpretedBits181.y), comparisonValue165, fma(uintBitsToFloat(reinterpretedBits109.y), comparisonValue163, comparisonValue164 * uintBitsToFloat(reinterpretedBits102.y))) + uintBitsToFloat(reinterpretedBits82.y)) / multiplyAddValue222, 0.5, 0.5)) * productValue283) + 0.5) / productValue283, sumValue209, comparisonValue162)))), 0.0);
                                    multiplyAddValue70 = sampledTextureValue182.x >= ((fma(uintBitsToFloat(reinterpretedBits181.z), comparisonValue165, fma(uintBitsToFloat(reinterpretedBits109.z), comparisonValue163, comparisonValue164 * uintBitsToFloat(reinterpretedBits102.z))) + uintBitsToFloat(reinterpretedBits82.z)) / multiplyAddValue222);
                                }
                                else
                                {
                                    multiplyAddValue70 = false;
                                }
                                intermediateValue92 = multiplyAddValue70;
                            }
                            else
                            {
                                intermediateValue92 = true;
                            }
                            float quotientValue71 = 1.0 / spvNMax(comparisonValue153, 0.100000001490116119384765625);
                            float multiplyAddValue223 = comparisonValue153 / fma(scalarValue137, scalarValue137, 9.9999997473787516355514526367188e-05);
                            float multiplyAddValue224 = spvNMax(fma(-multiplyAddValue223, multiplyAddValue223, 1.0), 0.0);
                            float productValue284 = multiplyAddValue224 * multiplyAddValue224;
                            float productValue285 = productValue284 * quotientValue71;
                            float multiplyAddValue225 = spvNClamp(reinterpretedBits180 * (fma(-quotientValue71, productValue284, scalarValue135) + 1.0), 0.0, 1.0);
                            float multiplyAddValue226 = reinterpretedBits175 ? (spvNClamp(fma((multiplyAddValue225 * multiplyAddValue225) * fma(multiplyAddValue225, -2.0, 3.0), uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[142u])), uintBitsToFloat(floatBitsToUint(computeScalarConstants0.packedValues[143u]))), 0.0, 1.0) * productValue285) : productValue285;
                            uint productValue286 = (sampledTextureValue173 * 32u) + 4u;
                            vec4 sampledTextureValue183 = uintBitsToFloat(uvec4(texelFetch(intermediateValue10, int(productValue286)).x, texelFetch(intermediateValue10, int(productValue286 + 1u)).x, texelFetch(intermediateValue10, int(productValue286 + 2u)).x, texelFetch(intermediateValue10, int(productValue286 + 3u)).x));
                            float scalarValue145 = sampledTextureValue183.w;
                            intermediateValue87 = intermediateValue92;
                            productValue25 = multiplyAddValue226 * (scalarValue145 * sampledTextureValue183.x);
                            productValue24 = multiplyAddValue226 * (scalarValue145 * sampledTextureValue183.y);
                            productValue23 = multiplyAddValue226 * (scalarValue145 * sampledTextureValue183.z);
                        }
                        else
                        {
                            intermediateValue87 = true;
                            productValue25 = 0.0;
                            productValue24 = 0.0;
                            productValue23 = 0.0;
                        }
                        intermediateValue83 = productValue23;
                        intermediateValue84 = productValue24;
                        intermediateValue85 = productValue25;
                        intermediateValue86 = intermediateValue87;
                    }
                    else
                    {
                        intermediateValue83 = 0.0;
                        intermediateValue84 = 0.0;
                        intermediateValue85 = 0.0;
                        intermediateValue86 = true;
                    }
                    uint productValue287 = sampledTextureValue173 * 32u;
                    vec3 sampledTextureValue184 = uintBitsToFloat(uvec3(texelFetch(intermediateValue10, int(productValue287)).x, texelFetch(intermediateValue10, int(productValue287 + 1u)).x, texelFetch(intermediateValue10, int(productValue287 + 2u)).x));
                    float scalarValue146 = sampledTextureValue184.x;
                    float scalarValue147 = sampledTextureValue184.y;
                    float scalarValue148 = sampledTextureValue184.z;
                    float multiplyAddValue227 = (fma(reinterpretedBits19, scalarValue148, fma(reinterpretedBits15, scalarValue146, scalarValue147 * reinterpretedBits11)) + reinterpretedBits23) - multiplyAddValue183;
                    float multiplyAddValue228 = (fma(reinterpretedBits20, scalarValue148, fma(reinterpretedBits16, scalarValue146, scalarValue147 * reinterpretedBits12)) + reinterpretedBits24) - multiplyAddValue184;
                    float multiplyAddValue229 = (fma(reinterpretedBits21, scalarValue148, fma(reinterpretedBits17, scalarValue146, scalarValue147 * reinterpretedBits13)) + reinterpretedBits25) - multiplyAddValue185;
                    vec3 vectorValue8 = vec3(multiplyAddValue227, multiplyAddValue228, multiplyAddValue229);
                    float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
                    float multiplyAddValue230 = fma(sumValue199, rdDot3Precise2(vec3(-quotientValue66, -quotientValue67, -quotientValue68), vec3(multiplyAddValue227 * inverseLengthValue5, multiplyAddValue228 * inverseLengthValue5, multiplyAddValue229 * inverseLengthValue5)), multiplyAddValue220);
                    float nonlinearValue13 = multiplyAddValue221 / (sqrt(multiplyAddValue230) * multiplyAddValue230);
                    multiplyAddValue51 = intermediateValue86 ? fma(intermediateValue85, multiplyAddValue193 * nonlinearValue13, intermediateValue53) : intermediateValue53;
                    multiplyAddValue52 = intermediateValue86 ? fma(intermediateValue84, multiplyAddValue194 * nonlinearValue13, intermediateValue51) : intermediateValue51;
                    multiplyAddValue53 = intermediateValue86 ? fma(intermediateValue83, multiplyAddValue195 * nonlinearValue13, intermediateValue49) : intermediateValue49;
                    sumValue19 = scalarValue136 + 1u;
                    intermediateValue53 = multiplyAddValue51;
                    intermediateValue51 = multiplyAddValue52;
                    intermediateValue49 = multiplyAddValue53;
                    scalarValue136 = sumValue19;
                    continue;
                }
                intermediateValue48 = intermediateValue49;
                intermediateValue50 = intermediateValue51;
                intermediateValue52 = intermediateValue53;
            }
            else
            {
                intermediateValue48 = 0.0;
                intermediateValue50 = 0.0;
                intermediateValue52 = 0.0;
            }
            multiplyAddValue38 = fma(reinterpretedBits164, intermediateValue48, multiplyAddValue35);
            multiplyAddValue39 = fma(reinterpretedBits164, intermediateValue50, multiplyAddValue34);
            multiplyAddValue40 = fma(reinterpretedBits164, intermediateValue52, multiplyAddValue33);
        }
        else
        {
            multiplyAddValue38 = multiplyAddValue35;
            multiplyAddValue39 = multiplyAddValue34;
            multiplyAddValue40 = multiplyAddValue33;
        }
        imageStore(intermediateValue11, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(multiplyAddValue40, multiplyAddValue39, multiplyAddValue38, fma(reinterpretedBits153, -multiplyAddValue191, multiplyAddValue191)));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                uint productValue5 = (comparisonValue1 * 20u) + 4u;
                vec4 sampledTextureValue7 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue5)).x, texelFetch(zBiomeInfoBuffer, int(productValue5 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue5 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue5 + 3u)).x));
                uint productValue6 = (comparisonValue2 * 20u) + 4u;
                vec4 sampledTextureValue8 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue6)).x, texelFetch(zBiomeInfoBuffer, int(productValue6 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue6 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue6 + 3u)).x));
                uint productValue7 = (comparisonValue3 * 20u) + 4u;
                vec4 sampledTextureValue9 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue7)).x, texelFetch(zBiomeInfoBuffer, int(productValue7 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue7 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue7 + 3u)).x));
                uint productValue8 = (comparisonValue4 * 20u) + 4u;
                vec4 sampledTextureValue10 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue8)).x, texelFetch(zBiomeInfoBuffer, int(productValue8 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue8 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue8 + 3u)).x));
                float scalarValue2 = fract(quotientValue4);
                float scalarValue3 = fract(quotientValue5);
                float sumValue6 = 1.0 - scalarValue2;
                float sumValue8 = 1.0 - scalarValue3;
                float productValue9 = sumValue8 * sumValue6;
                float productValue13 = sumValue8 * scalarValue2;
                float productValue17 = sumValue6 * scalarValue3;
                float productValue18 = scalarValue3 * scalarValue2;
                branchMergedValue = (((productValue18 * sampledTextureValue10.x) + (productValue17 * sampledTextureValue9.x)) + (productValue13 * sampledTextureValue8.x)) + (productValue9 * sampledTextureValue7.x);
                branchMergedValue1 = (((productValue18 * sampledTextureValue10.y) + (productValue17 * sampledTextureValue9.y)) + (productValue13 * sampledTextureValue8.y)) + (productValue9 * sampledTextureValue7.y);
                branchMergedValue2 = (((productValue18 * sampledTextureValue10.z) + (productValue17 * sampledTextureValue9.z)) + (productValue13 * sampledTextureValue8.z)) + (productValue9 * sampledTextureValue7.z);
                branchMergedValue3 = (((productValue18 * sampledTextureValue10.w) + (productValue17 * sampledTextureValue9.w)) + (productValue13 * sampledTextureValue8.w)) + (productValue9 * sampledTextureValue7.w);
            }
            intermediateValue4 = branchMergedValue;
            intermediateValue5 = branchMergedValue1;
            intermediateValue6 = branchMergedValue2;
            intermediateValue7 = branchMergedValue3;
        }
        else
        {
            intermediateValue4 = computeVectorConstants0.packedValues[32u].x;
            intermediateValue5 = computeVectorConstants0.packedValues[32u].y;
            intermediateValue6 = computeVectorConstants0.packedValues[32u].z;
            intermediateValue7 = computeVectorConstants0.packedValues[32u].w;
        }
        float productValue19 = computeVectorConstants0.packedValues[18u].w * spvNClamp((computeVectorConstants0.packedValues[17u].x * multiplyAddValue3) + computeVectorConstants0.packedValues[17u].y, 0.0, 1.0);
        float productValue20 = productValue19 * computeVectorConstants0.packedValues[18u].x;
        float productValue21 = productValue19 * computeVectorConstants0.packedValues[18u].y;
        float productValue22 = productValue19 * computeVectorConstants0.packedValues[18u].z;
        float productValue26 = (((intermediateValue7 * intermediateValue4) - productValue20) * comparisonValue) + productValue20;
        float productValue27 = (((intermediateValue7 * intermediateValue5) - productValue21) * comparisonValue) + productValue21;
        float productValue28 = (((intermediateValue7 * intermediateValue6) - productValue22) * comparisonValue) + productValue22;
        float productValue29 = ((intermediateValue7 - productValue19) * comparisonValue) + productValue19;
        float productValue30 = ((computeVectorConstants0.packedValues[26u].y - computeVectorConstants0.packedValues[26u].x) * comparisonValue) + computeVectorConstants0.packedValues[26u].x;
        float nonlinearValue = sqrt(((multiplyAddValue6 * multiplyAddValue6) + (multiplyAddValue5 * multiplyAddValue5)) + (multiplyAddValue7 * multiplyAddValue7));
        float quotientValue6 = spvNClamp(((computeVectorConstants0.packedValues[28u].x - computeVectorConstants0.packedValues[19u].x) + (nonlinearValue / computeVectorConstants0.packedValues[19u].z)) * computeVectorConstants0.packedValues[19u].y, 0.0, 1.0);
        float productValue34 = productValue26 - (quotientValue6 * productValue26);
        float productValue39 = productValue27 - (quotientValue6 * productValue27);
        float productValue40 = productValue28 - (quotientValue6 * productValue28);
        float intermediateValue8;
        float intermediateValue9;
        if ((computeVectorConstants0.packedValues[30u].x > 0.5) && (computeVectorConstants0.packedValues[20u].w > 0.5))
        {
            vec4 sampledTextureValue11 = textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(quotientValue, 1.0 - quotientValue1, (exp2(((computeVectorConstants0.packedValues[30u].y > 0.5) ? (quotientValue2 - computeVectorConstants0.packedValues[30u].z) : quotientValue2) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625), 0.0);
            intermediateValue8 = sampledTextureValue11.x;
            intermediateValue9 = sampledTextureValue11.y;
        }
        else
        {
            intermediateValue8 = 0.0;
            intermediateValue9 = computeVectorConstants0.packedValues[21u].y;
        }
        float productValue41 = computeVectorConstants0.packedValues[14u].w * intermediateValue8;
        float productValue42 = computeVectorConstants0.packedValues[29u].w * intermediateValue9;
        float productValue60 = computeVectorConstants0.packedValues[24u].w * 0.079577468335628509521484375;
        float productValue61 = (spvNMax((productValue42 * computeVectorConstants0.packedValues[29u].x) + (productValue41 * computeVectorConstants0.packedValues[14u].x), computeVectorConstants0.packedValues[27u].x) * productValue34) * productValue60;
        float productValue62 = (spvNMax((productValue42 * computeVectorConstants0.packedValues[29u].y) + (productValue41 * computeVectorConstants0.packedValues[14u].y), computeVectorConstants0.packedValues[27u].x) * productValue39) * productValue60;
        float productValue63 = (spvNMax((productValue42 * computeVectorConstants0.packedValues[29u].z) + (productValue41 * computeVectorConstants0.packedValues[14u].z), computeVectorConstants0.packedValues[27u].x) * productValue40) * productValue60;
        float productValue31;
        float productValue32;
        float productValue33;
        if ((computeVectorConstants0.packedValues[25u].y == 0.0) || (abs(intermediateValue9) > 9.9999997473787516355514526367188e-05))
        {
            float multiplyAddValue8 = fma(computeVectorConstants0.packedValues[8u].x, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].x, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].x, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].x)));
            float multiplyAddValue9 = fma(computeVectorConstants0.packedValues[8u].y, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].y, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].y, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].y)));
            float multiplyAddValue10 = fma(computeVectorConstants0.packedValues[8u].z, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].z, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].z, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].z)));
            float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), vec3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
            float dotProductValue = (((dot(vec3((-0.0) - (multiplyAddValue5 / nonlinearValue), (-0.0) - (multiplyAddValue6 / nonlinearValue), (-0.0) - (multiplyAddValue7 / nonlinearValue)), vec3(inverseLengthValue * multiplyAddValue8, inverseLengthValue * multiplyAddValue9, inverseLengthValue * multiplyAddValue10)) * 2.0) + productValue30) * productValue30) + 1.0;
            float sampledTextureValue14 = computeVectorConstants0.packedValues[23u].w * ((((1.0 - (productValue30 * productValue30)) * 0.079577468335628509521484375) / (dotProductValue * sqrt(dotProductValue))) * texelFetch(cascadedShadowBufferTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), int(0u)).x);
            productValue31 = ((sampledTextureValue14 * productValue34) * computeVectorConstants0.packedValues[23u].x) + productValue61;
            productValue32 = ((sampledTextureValue14 * productValue39) * computeVectorConstants0.packedValues[23u].y) + productValue62;
            productValue33 = ((sampledTextureValue14 * productValue40) * computeVectorConstants0.packedValues[23u].z) + productValue63;
        }
        else
        {
            productValue31 = productValue61;
            productValue32 = productValue62;
            productValue33 = productValue63;
        }
        imageStore(scatteringBufferOutTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(productValue31, productValue32, productValue33, productValue29 - (quotientValue6 * productValue29)));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                uint productValue77 = (comparisonValue28 * 20u) + 4u;
                vec4 sampledTextureValue41 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue77)).x, texelFetch(zBiomeInfoBuffer, int(productValue77 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue77 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue77 + 3u)).x));
                uint productValue78 = (comparisonValue29 * 20u) + 4u;
                vec4 sampledTextureValue42 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue78)).x, texelFetch(zBiomeInfoBuffer, int(productValue78 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue78 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue78 + 3u)).x));
                uint productValue79 = (comparisonValue30 * 20u) + 4u;
                vec4 sampledTextureValue43 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue79)).x, texelFetch(zBiomeInfoBuffer, int(productValue79 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue79 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue79 + 3u)).x));
                uint productValue80 = (comparisonValue44 * 20u) + 4u;
                vec4 sampledTextureValue44 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue80)).x, texelFetch(zBiomeInfoBuffer, int(productValue80 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue80 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue80 + 3u)).x));
                float scalarValue12 = fract(quotientValue14);
                float scalarValue13 = fract(quotientValue15);
                float sumValue53 = 1.0 - scalarValue12;
                float sumValue54 = 1.0 - scalarValue13;
                float productValue81 = sumValue54 * sumValue53;
                float productValue82 = sumValue54 * scalarValue12;
                float productValue83 = sumValue53 * scalarValue13;
                float productValue84 = scalarValue13 * scalarValue12;
                branchMergedValue4 = (((productValue84 * sampledTextureValue44.w) + (productValue83 * sampledTextureValue43.w)) + (productValue82 * sampledTextureValue42.w)) + (productValue81 * sampledTextureValue41.w);
                branchMergedValue9 = (((productValue84 * sampledTextureValue44.x) + (productValue83 * sampledTextureValue43.x)) + (productValue82 * sampledTextureValue42.x)) + (productValue81 * sampledTextureValue41.x);
                branchMergedValue10 = (((productValue84 * sampledTextureValue44.y) + (productValue83 * sampledTextureValue43.y)) + (productValue82 * sampledTextureValue42.y)) + (productValue81 * sampledTextureValue41.y);
                branchMergedValue11 = (((productValue84 * sampledTextureValue44.z) + (productValue83 * sampledTextureValue43.z)) + (productValue82 * sampledTextureValue42.z)) + (productValue81 * sampledTextureValue41.z);
            }
            intermediateValue4 = branchMergedValue9;
            intermediateValue5 = branchMergedValue10;
            intermediateValue6 = branchMergedValue11;
            intermediateValue7 = branchMergedValue4;
        }
        else
        {
            intermediateValue4 = computeVectorConstants0.packedValues[46u].x;
            intermediateValue5 = computeVectorConstants0.packedValues[46u].y;
            intermediateValue6 = computeVectorConstants0.packedValues[46u].z;
            intermediateValue7 = computeVectorConstants0.packedValues[46u].w;
        }
        float productValue85 = computeVectorConstants0.packedValues[20u].w * spvNClamp((computeVectorConstants0.packedValues[19u].x * multiplyAddValue63) + computeVectorConstants0.packedValues[19u].y, 0.0, 1.0);
        float productValue86 = productValue85 * computeVectorConstants0.packedValues[20u].x;
        float productValue87 = productValue85 * computeVectorConstants0.packedValues[20u].y;
        float productValue88 = productValue85 * computeVectorConstants0.packedValues[20u].z;
        float productValue89 = (((intermediateValue7 * intermediateValue4) - productValue86) * comparisonValue27) + productValue86;
        float productValue90 = (((intermediateValue7 * intermediateValue5) - productValue87) * comparisonValue27) + productValue87;
        float productValue91 = (((intermediateValue7 * intermediateValue6) - productValue88) * comparisonValue27) + productValue88;
        float productValue92 = ((intermediateValue7 - productValue85) * comparisonValue27) + productValue85;
        float productValue93 = ((computeVectorConstants0.packedValues[30u].y - computeVectorConstants0.packedValues[30u].x) * comparisonValue27) + computeVectorConstants0.packedValues[30u].x;
        float nonlinearValue2 = sqrt(((sumValue18 * sumValue18) + (sumValue17 * sumValue17)) + (sumValue43 * sumValue43));
        float quotientValue16 = spvNClamp(((computeVectorConstants0.packedValues[40u].x - computeVectorConstants0.packedValues[21u].x) + (nonlinearValue2 / computeVectorConstants0.packedValues[21u].z)) * computeVectorConstants0.packedValues[21u].y, 0.0, 1.0);
        float productValue94 = productValue89 - (quotientValue16 * productValue89);
        float productValue95 = productValue90 - (quotientValue16 * productValue90);
        float productValue96 = productValue91 - (quotientValue16 * productValue91);
        float intermediateValue8;
        float intermediateValue9;
        if ((computeVectorConstants0.packedValues[42u].x > 0.5) && (computeVectorConstants0.packedValues[22u].w > 0.5))
        {
            vec4 sampledTextureValue45 = textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(quotientValue10, 1.0 - quotientValue11, (exp2(((computeVectorConstants0.packedValues[42u].y > 0.5) ? (quotientValue12 - computeVectorConstants0.packedValues[42u].z) : quotientValue12) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625), 0.0);
            intermediateValue8 = sampledTextureValue45.x;
            intermediateValue9 = sampledTextureValue45.y;
        }
        else
        {
            intermediateValue8 = 0.0;
            intermediateValue9 = computeVectorConstants0.packedValues[23u].y;
        }
        float productValue41 = computeVectorConstants0.packedValues[14u].w * intermediateValue8;
        float productValue97 = computeVectorConstants0.packedValues[41u].w * intermediateValue9;
        float productValue98 = computeVectorConstants0.packedValues[28u].w * 0.079577468335628509521484375;
        float productValue99 = (spvNMax((productValue97 * computeVectorConstants0.packedValues[41u].x) + (productValue41 * computeVectorConstants0.packedValues[14u].x), computeVectorConstants0.packedValues[31u].x) * productValue94) * productValue98;
        float productValue100 = (spvNMax((productValue97 * computeVectorConstants0.packedValues[41u].y) + (productValue41 * computeVectorConstants0.packedValues[14u].y), computeVectorConstants0.packedValues[31u].x) * productValue95) * productValue98;
        float productValue101 = (spvNMax((productValue97 * computeVectorConstants0.packedValues[41u].z) + (productValue41 * computeVectorConstants0.packedValues[14u].z), computeVectorConstants0.packedValues[31u].x) * productValue96) * productValue98;
        float quotientValue17 = (-0.0) - (sumValue17 / nonlinearValue2);
        float quotientValue18 = (-0.0) - (sumValue18 / nonlinearValue2);
        float quotientValue19 = (-0.0) - (sumValue43 / nonlinearValue2);
        float productValue31;
        float productValue32;
        float productValue33;
        if ((computeVectorConstants0.packedValues[29u].y == 0.0) || (abs(intermediateValue9) > 9.9999997473787516355514526367188e-05))
        {
            float multiplyAddValue8 = fma(computeVectorConstants0.packedValues[8u].x, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].x, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].x, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].x)));
            float multiplyAddValue9 = fma(computeVectorConstants0.packedValues[8u].y, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].y, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].y, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].y)));
            float multiplyAddValue10 = fma(computeVectorConstants0.packedValues[8u].z, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].z, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].z, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].z)));
            float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), vec3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
            float dotProductValue1 = (((dot(vec3(quotientValue17, quotientValue18, quotientValue19), vec3(inverseLengthValue * multiplyAddValue8, inverseLengthValue * multiplyAddValue9, inverseLengthValue * multiplyAddValue10)) * 2.0) + productValue93) * productValue93) + 1.0;
            float sampledTextureValue46 = computeVectorConstants0.packedValues[27u].w * ((((1.0 - (productValue93 * productValue93)) * 0.079577468335628509521484375) / (dotProductValue1 * sqrt(dotProductValue1))) * texelFetch(cascadedShadowBufferTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), int(0u)).x);
            productValue31 = ((sampledTextureValue46 * productValue94) * computeVectorConstants0.packedValues[27u].x) + productValue99;
            productValue32 = ((sampledTextureValue46 * productValue95) * computeVectorConstants0.packedValues[27u].y) + productValue100;
            productValue33 = ((sampledTextureValue46 * productValue96) * computeVectorConstants0.packedValues[27u].z) + productValue101;
        }
        else
        {
            productValue31 = productValue99;
            productValue32 = productValue100;
            productValue33 = productValue101;
        }
        float productValue36;
        float productValue37;
        float productValue38;
        if ((computeVectorConstants0.packedValues[45u].y != 0.0) && (computeVectorConstants0.packedValues[16u].z != 0.0))
        {
            float sumValue55 = 1.0 - computeVectorConstants0.packedValues[43u].x;
            float sumValue56 = (-0.0) - sumValue43;
            float productValue102 = computeVectorConstants0.packedValues[24u].z * sumValue56;
            float productValue103 = productValue102 * computeVectorConstants0.packedValues[24u].w;
            float intermediateValue10;
            if (computeVectorConstants0.packedValues[24u].x > sumValue56)
            {
                intermediateValue10 = 0.0;
            }
            else
            {
                float branchMergedValue5;
                if (computeVectorConstants0.packedValues[24u].y > sumValue56)
                {
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    branchMergedValue5 = spvNMin(floor(spvNMin(spvNMax((log2(sumValue56) - computeVectorConstants0.packedValues[34u].z) * computeVectorConstants0.packedValues[34u].x, 0.0), 1.0) * (computeVectorConstants0.packedValues[26u].z + (-2.0))) + 2.0, computeVectorConstants0.packedValues[26u].z + (-1.0));
                }
                intermediateValue10 = branchMergedValue5;
            }
            float quotientValue20 = spvNMin(floor(spvNMin(spvNMax((productValue103 + sumValue17) / (productValue103 * 2.0), 0.0), 1.0) * computeVectorConstants0.packedValues[26u].x), computeVectorConstants0.packedValues[26u].x + (-1.0));
            float quotientValue21 = spvNMin(floor(spvNMin(spvNMax((productValue102 + sumValue18) / (productValue102 * 2.0), 0.0), 1.0) * computeVectorConstants0.packedValues[26u].y), computeVectorConstants0.packedValues[26u].y + (-1.0));
            uint intermediateValue11;
            bool intermediateValue13;
            uint intermediateValue14;
            if ((intermediateValue10 >= computeVectorConstants0.packedValues[26u].z) || ((quotientValue21 >= computeVectorConstants0.packedValues[26u].y) || ((quotientValue20 >= computeVectorConstants0.packedValues[26u].x) || ((intermediateValue10 < 0.0) || ((quotientValue20 < 0.0) || (quotientValue21 < 0.0))))))
            {
                intermediateValue11 = intermediateValue12;
                intermediateValue13 = false;
                intermediateValue14 = 0u;
            }
            else
            {
                uint scalarValue14 = uint(int(computeVectorConstants0.packedValues[26u].w));
                uint productValue104 = uint(int(((quotientValue21 + (intermediateValue10 * computeVectorConstants0.packedValues[26u].y)) * computeVectorConstants0.packedValues[26u].x) + quotientValue20)) * scalarValue14;
                intermediateValue11 = productValue104;
                intermediateValue13 = true;
                intermediateValue14 = productValue104 + scalarValue14;
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
                float scalarValue15 = 0.0;
                float scalarValue16 = 0.0;
                float scalarValue17 = 0.0;
                uint scalarValue18 = intermediateValue11;
                uint sampledTextureValue13;
                for (;;)
                {
                    sampledTextureValue13 = uint(int(uintBitsToFloat(texelFetch(zLightLookupArray, int(scalarValue18)).x)));
                    if (int(sampledTextureValue13) < int(0u))
                    {
                        intermediateValue17 = scalarValue15;
                        intermediateValue19 = scalarValue16;
                        intermediateValue21 = scalarValue17;
                        break;
                    }
                    else
                    {
                        uint productValue105 = sampledTextureValue13 * 32u;
                        vec4 sampledTextureValue47 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue105)).x, texelFetch(zLights, int(productValue105 + 1u)).x, texelFetch(zLights, int(productValue105 + 2u)).x, texelFetch(zLights, int(productValue105 + 3u)).x));
                        intermediateValue26 = sampledTextureValue47.x;
                        intermediateValue27 = sampledTextureValue47.y;
                        intermediateValue28 = sampledTextureValue47.z;
                        float sumValue57 = intermediateValue26 - multiplyAddValue62;
                        float sumValue59 = intermediateValue27 - multiplyAddValue63;
                        float sumValue60 = intermediateValue28 - multiplyAddValue64;
                        float productValue44;
                        if (computeVectorConstants0.packedValues[15u].x > 0.0)
                        {
                            float sumValue61 = (abs(sumValue59) + abs(sumValue57)) + abs(sumValue60);
                            productValue44 = sumValue61 * sumValue61;
                        }
                        else
                        {
                            productValue44 = dot(vec3(sumValue57, sumValue59, sumValue60), vec3(sumValue57, sumValue59, sumValue60));
                        }
                        float scalarValue19 = sampledTextureValue47.w;
                        float productValue106 = scalarValue19 * scalarValue19;
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        if (!(productValue44 >= productValue106))
                        {
                            float intermediateValue34;
                            if (computeVectorConstants0.packedValues[16u].z != 0.0)
                            {
                                uint productValue107 = (sampledTextureValue13 * 32u) + 8u;
                                vec4 sampledTextureValue48 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue107)).x, texelFetch(zLights, int(productValue107 + 1u)).x, texelFetch(zLights, int(productValue107 + 2u)).x, texelFetch(zLights, int(productValue107 + 3u)).x));
                                uint productValue108 = (sampledTextureValue13 * 32u) + 12u;
                                vec4 sampledTextureValue49 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue108)).x, texelFetch(zLights, int(productValue108 + 1u)).x, texelFetch(zLights, int(productValue108 + 2u)).x, texelFetch(zLights, int(productValue108 + 3u)).x));
                                uint productValue109 = (sampledTextureValue13 * 32u) + 16u;
                                vec4 sampledTextureValue50 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue109)).x, texelFetch(zLights, int(productValue109 + 1u)).x, texelFetch(zLights, int(productValue109 + 2u)).x, texelFetch(zLights, int(productValue109 + 3u)).x));
                                uint productValue110 = (sampledTextureValue13 * 32u) + 20u;
                                vec4 sampledTextureValue51 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue110)).x, texelFetch(zLights, int(productValue110 + 1u)).x, texelFetch(zLights, int(productValue110 + 2u)).x, texelFetch(zLights, int(productValue110 + 3u)).x));
                                uint productValue111 = (sampledTextureValue13 * 32u) + 24u;
                                vec4 sampledTextureValue52 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue111)).x, texelFetch(zLights, int(productValue111 + 1u)).x, texelFetch(zLights, int(productValue111 + 2u)).x, texelFetch(zLights, int(productValue111 + 3u)).x));
                                uint productValue112 = (sampledTextureValue13 * 32u) + 28u;
                                vec4 sampledTextureValue53 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue112)).x, texelFetch(zLights, int(productValue112 + 1u)).x, texelFetch(zLights, int(productValue112 + 2u)).x, texelFetch(zLights, int(productValue112 + 3u)).x));
                                float sumValue62 = multiplyAddValue62 - intermediateValue26;
                                float sumValue63 = multiplyAddValue63 - intermediateValue27;
                                float sumValue64 = multiplyAddValue64 - intermediateValue28;
                                float scalarValue20 = abs(sumValue62);
                                float scalarValue21 = abs(sumValue63);
                                float scalarValue22 = abs(sumValue64);
                                uint comparisonValue5;
                                if ((scalarValue20 >= scalarValue21) && (scalarValue20 >= scalarValue22))
                                {
                                    comparisonValue5 = uint(!(sumValue62 >= 0.0));
                                }
                                else
                                {
                                    uint branchMergedValue7;
                                    if (!(scalarValue21 >= scalarValue22))
                                    {
                                        branchMergedValue7 = (sumValue64 >= 0.0) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue7 = (sumValue63 >= 0.0) ? 2u : 3u;
                                    }
                                    comparisonValue5 = branchMergedValue7;
                                }
                                float sumValue65 = (-0.0) - sumValue62;
                                float intermediateValue38;
                                float intermediateValue39;
                                float intermediateValue40;
                                float intermediateValue41;
                                float sumValue22;
                                float intermediateValue42;
                                float intermediateValue43;
                                if (comparisonValue5 == 1u)
                                {
                                    intermediateValue38 = sampledTextureValue49.x;
                                    intermediateValue39 = sampledTextureValue49.y;
                                    intermediateValue40 = sampledTextureValue49.z;
                                    intermediateValue41 = sampledTextureValue49.w;
                                    sumValue22 = (-0.0) - sumValue64;
                                    intermediateValue42 = sumValue63;
                                    intermediateValue43 = sumValue62;
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
                                        branchMergedValue8 = sumValue65;
                                        branchMergedValue12 = (-0.0) - sumValue64;
                                        branchMergedValue13 = (-0.0) - sumValue63;
                                        branchMergedValue14 = sampledTextureValue50.x;
                                        branchMergedValue15 = sampledTextureValue50.y;
                                        branchMergedValue16 = sampledTextureValue50.z;
                                        branchMergedValue17 = sampledTextureValue50.w;
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
                                            branchMergedValue18 = sumValue65;
                                            branchMergedValue19 = sumValue64;
                                            branchMergedValue20 = sumValue63;
                                            branchMergedValue21 = sampledTextureValue51.x;
                                            branchMergedValue22 = sampledTextureValue51.y;
                                            branchMergedValue23 = sampledTextureValue51.z;
                                            branchMergedValue24 = sampledTextureValue51.w;
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
                                                branchMergedValue25 = sumValue65;
                                                branchMergedValue26 = sumValue63;
                                                branchMergedValue27 = (-0.0) - sumValue64;
                                                branchMergedValue28 = sampledTextureValue52.x;
                                                branchMergedValue29 = sampledTextureValue52.y;
                                                branchMergedValue30 = sampledTextureValue52.z;
                                                branchMergedValue31 = sampledTextureValue52.w;
                                            }
                                            else
                                            {
                                                bool comparisonValue45 = comparisonValue5 == 5u;
                                                branchMergedValue25 = comparisonValue45 ? sumValue62 : sumValue64;
                                                branchMergedValue26 = sumValue63;
                                                branchMergedValue27 = comparisonValue45 ? sumValue64 : sumValue65;
                                                branchMergedValue28 = comparisonValue45 ? sampledTextureValue53.x : sampledTextureValue48.x;
                                                branchMergedValue29 = comparisonValue45 ? sampledTextureValue53.y : sampledTextureValue48.y;
                                                branchMergedValue30 = comparisonValue45 ? sampledTextureValue53.z : sampledTextureValue48.z;
                                                branchMergedValue31 = comparisonValue45 ? sampledTextureValue53.w : sampledTextureValue48.w;
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
                                if ((intermediateValue40 == 0.0) && (intermediateValue41 == 0.0))
                                {
                                    branchMergedValue6 = 0.0;
                                }
                                else
                                {
                                    float multiplyAddValue68 = fma(computeVectorConstants0.packedValues[37u].w, intermediateValue43, fma(computeVectorConstants0.packedValues[36u].w, intermediateValue42, computeVectorConstants0.packedValues[35u].w * sumValue22)) + computeVectorConstants0.packedValues[38u].w;
                                    float quotientValue22 = 0.5 / computeVectorConstants0.packedValues[39u].x;
                                    float quotientValue23 = 0.5 / computeVectorConstants0.packedValues[39u].y;
                                    float sumValue66 = intermediateValue40 - intermediateValue38;
                                    float sumValue67 = intermediateValue41 - intermediateValue39;
                                    float productValue113 = computeVectorConstants0.packedValues[39u].x * sumValue66;
                                    float productValue114 = computeVectorConstants0.packedValues[39u].y * sumValue67;
                                    float sampledTextureValue54 = float(textureLod(sampler2D(pointLightShadowTextureAtlasTexture, pointLightShadowTextureAtlasSampler), vec2(spvNMin(spvNMax((((floor(productValue113 * ((((fma(computeVectorConstants0.packedValues[37u].x, intermediateValue43, fma(computeVectorConstants0.packedValues[36u].x, intermediateValue42, computeVectorConstants0.packedValues[35u].x * sumValue22)) + computeVectorConstants0.packedValues[38u].x) / multiplyAddValue68) * 0.5) + 0.5)) + 0.5) / productValue113) * sumValue66) + intermediateValue38, quotientValue22 + intermediateValue38), intermediateValue40 - quotientValue22), spvNMin(spvNMax((((floor(productValue114 * (0.5 - (((fma(computeVectorConstants0.packedValues[37u].y, intermediateValue43, fma(computeVectorConstants0.packedValues[36u].y, intermediateValue42, computeVectorConstants0.packedValues[35u].y * sumValue22)) + computeVectorConstants0.packedValues[38u].y) / multiplyAddValue68) * 0.5))) + 0.5) / productValue114) * sumValue67) + intermediateValue39, quotientValue23 + intermediateValue39), intermediateValue41 - quotientValue23)), 0.0).x >= ((fma(computeVectorConstants0.packedValues[37u].z, intermediateValue43, fma(computeVectorConstants0.packedValues[36u].z, intermediateValue42, computeVectorConstants0.packedValues[35u].z * sumValue22)) + computeVectorConstants0.packedValues[38u].z) / multiplyAddValue68));
                                    branchMergedValue6 = sampledTextureValue54;
                                }
                                intermediateValue34 = branchMergedValue6;
                            }
                            else
                            {
                                intermediateValue34 = 1.0;
                            }
                            uint productValue115 = (sampledTextureValue13 * 32u) + 4u;
                            vec4 sampledTextureValue55 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue115)).x, texelFetch(zLights, int(productValue115 + 1u)).x, texelFetch(zLights, int(productValue115 + 2u)).x, texelFetch(zLights, int(productValue115 + 3u)).x));
                            float quotientValue24 = productValue44 / (productValue106 + 9.9999997473787516355514526367188e-05);
                            float productValue116 = spvNClamp(1.0 - (quotientValue24 * quotientValue24), 0.0, 1.0);
                            float quotientValue25 = (productValue116 * productValue116) * (1.0 / spvNMax(productValue44, 0.100000001490116119384765625));
                            float productValue54;
                            if (computeVectorConstants0.packedValues[33u].x > 0.0)
                            {
                                float quotientValue26 = spvNClamp(((1.0 - quotientValue25) - computeVectorConstants0.packedValues[32u].x) / (computeVectorConstants0.packedValues[32u].y - computeVectorConstants0.packedValues[32u].x), 0.0, 1.0);
                                productValue54 = spvNClamp((((quotientValue26 * quotientValue26) * computeVectorConstants0.packedValues[32u].z) * (3.0 - (quotientValue26 * 2.0))) + computeVectorConstants0.packedValues[32u].w, 0.0, 1.0) * quotientValue25;
                            }
                            else
                            {
                                productValue54 = quotientValue25;
                            }
                            float productValue117 = productValue54 * sampledTextureValue55.w;
                            branchMergedValue = productValue117 * sampledTextureValue55.y;
                            branchMergedValue1 = productValue117 * sampledTextureValue55.x;
                            branchMergedValue2 = intermediateValue34;
                            branchMergedValue3 = productValue117 * sampledTextureValue55.z;
                        }
                        else
                        {
                            branchMergedValue = 0.0;
                            branchMergedValue1 = 0.0;
                            branchMergedValue2 = 1.0;
                            branchMergedValue3 = 0.0;
                        }
                        intermediateValue31 = branchMergedValue;
                        intermediateValue30 = branchMergedValue1;
                        intermediateValue33 = branchMergedValue2;
                        intermediateValue32 = branchMergedValue3;
                        float multiplyAddValue69 = fma(computeVectorConstants0.packedValues[7u].x, intermediateValue28, fma(computeVectorConstants0.packedValues[6u].x, intermediateValue27, intermediateValue26 * computeVectorConstants0.packedValues[5u].x)) - multiplyAddValue65;
                        float multiplyAddValue71 = fma(computeVectorConstants0.packedValues[7u].y, intermediateValue28, fma(computeVectorConstants0.packedValues[6u].y, intermediateValue27, intermediateValue26 * computeVectorConstants0.packedValues[5u].y)) - multiplyAddValue66;
                        float multiplyAddValue72 = fma(computeVectorConstants0.packedValues[7u].z, intermediateValue28, fma(computeVectorConstants0.packedValues[6u].z, intermediateValue27, intermediateValue26 * computeVectorConstants0.packedValues[5u].z)) - multiplyAddValue67;
                        float inverseLengthValue2 = inversesqrt(dot(vec3(multiplyAddValue69, multiplyAddValue71, multiplyAddValue72), vec3(multiplyAddValue69, multiplyAddValue71, multiplyAddValue72)));
                        float dotProductValue2 = (((dot(vec3(quotientValue17, quotientValue18, quotientValue19), vec3(inverseLengthValue2 * multiplyAddValue69, inverseLengthValue2 * multiplyAddValue71, inverseLengthValue2 * multiplyAddValue72)) * 2.0) + productValue93) * productValue93) + 1.0;
                        float nonlinearValue3 = (((1.0 - (productValue93 * productValue93)) * 0.079577468335628509521484375) / (dotProductValue2 * sqrt(dotProductValue2))) * intermediateValue33;
                        float productValue118 = ((intermediateValue30 * productValue94) * nonlinearValue3) + scalarValue15;
                        float productValue119 = ((intermediateValue31 * productValue95) * nonlinearValue3) + scalarValue16;
                        float productValue120 = ((intermediateValue32 * productValue96) * nonlinearValue3) + scalarValue17;
                        uint sumValue68 = scalarValue18 + 1u;
                        if (int(sumValue68) < int(intermediateValue14))
                        {
                            scalarValue15 = productValue118;
                            scalarValue16 = productValue119;
                            scalarValue17 = productValue120;
                            scalarValue18 = sumValue68;
                            continue;
                        }
                        else
                        {
                            intermediateValue17 = productValue118;
                            intermediateValue19 = productValue119;
                            intermediateValue21 = productValue120;
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
                intermediateValue16 = 0.0;
                intermediateValue18 = 0.0;
                intermediateValue20 = 0.0;
            }
            productValue36 = (intermediateValue16 * sumValue55) + productValue31;
            productValue37 = (intermediateValue18 * sumValue55) + productValue32;
            productValue38 = (intermediateValue20 * sumValue55) + productValue33;
        }
        else
        {
            productValue36 = productValue31;
            productValue37 = productValue32;
            productValue38 = productValue33;
        }
        imageStore(scatteringBufferOutTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(productValue36, productValue37, productValue38, productValue92 - (quotientValue16 * productValue92)));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                uint productValue147 = (comparisonValue72 * 20u) + 4u;
                vec4 sampledTextureValue87 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue147)).x, texelFetch(zBiomeInfoBuffer, int(productValue147 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue147 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue147 + 3u)).x));
                uint productValue148 = (comparisonValue73 * 20u) + 4u;
                vec4 sampledTextureValue88 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue148)).x, texelFetch(zBiomeInfoBuffer, int(productValue148 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue148 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue148 + 3u)).x));
                uint productValue149 = (comparisonValue74 * 20u) + 4u;
                vec4 sampledTextureValue89 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue149)).x, texelFetch(zBiomeInfoBuffer, int(productValue149 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue149 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue149 + 3u)).x));
                uint productValue150 = (comparisonValue75 * 20u) + 4u;
                vec4 sampledTextureValue90 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue150)).x, texelFetch(zBiomeInfoBuffer, int(productValue150 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue150 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue150 + 3u)).x));
                float scalarValue43 = fract(quotientValue40);
                float scalarValue44 = fract(quotientValue41);
                float sumValue94 = 1.0 - scalarValue43;
                float sumValue95 = 1.0 - scalarValue44;
                float productValue151 = sumValue95 * sumValue94;
                float productValue152 = sumValue95 * scalarValue43;
                float productValue153 = sumValue94 * scalarValue44;
                float productValue154 = scalarValue44 * scalarValue43;
                branchMergedValue = (((productValue154 * sampledTextureValue90.y) + (productValue153 * sampledTextureValue89.y)) + (productValue152 * sampledTextureValue88.y)) + (productValue151 * sampledTextureValue87.y);
                branchMergedValue2 = (((productValue154 * sampledTextureValue90.x) + (productValue153 * sampledTextureValue89.x)) + (productValue152 * sampledTextureValue88.x)) + (productValue151 * sampledTextureValue87.x);
                branchMergedValue3 = (((productValue154 * sampledTextureValue90.w) + (productValue153 * sampledTextureValue89.w)) + (productValue152 * sampledTextureValue88.w)) + (productValue151 * sampledTextureValue87.w);
                branchMergedValue4 = (((productValue154 * sampledTextureValue90.z) + (productValue153 * sampledTextureValue89.z)) + (productValue152 * sampledTextureValue88.z)) + (productValue151 * sampledTextureValue87.z);
            }
            intermediateValue7 = branchMergedValue2;
            intermediateValue8 = branchMergedValue;
            intermediateValue9 = branchMergedValue4;
            intermediateValue10 = branchMergedValue3;
        }
        else
        {
            intermediateValue7 = computeVectorConstants0.packedValues[35u].x;
            intermediateValue8 = computeVectorConstants0.packedValues[35u].y;
            intermediateValue9 = computeVectorConstants0.packedValues[35u].z;
            intermediateValue10 = computeVectorConstants0.packedValues[35u].w;
        }
        float productValue155 = computeVectorConstants0.packedValues[19u].w * spvNClamp((computeVectorConstants0.packedValues[18u].x * multiplyAddValue117) + computeVectorConstants0.packedValues[18u].y, 0.0, 1.0);
        float productValue156 = productValue155 * computeVectorConstants0.packedValues[19u].x;
        float productValue157 = productValue155 * computeVectorConstants0.packedValues[19u].y;
        float productValue158 = productValue155 * computeVectorConstants0.packedValues[19u].z;
        float productValue159 = (((intermediateValue10 * intermediateValue7) - productValue156) * comparisonValue71) + productValue156;
        float productValue160 = (((intermediateValue10 * intermediateValue8) - productValue157) * comparisonValue71) + productValue157;
        float productValue161 = (((intermediateValue10 * intermediateValue9) - productValue158) * comparisonValue71) + productValue158;
        float productValue162 = ((intermediateValue10 - productValue155) * comparisonValue71) + productValue155;
        float productValue163 = ((computeVectorConstants0.packedValues[29u].y - computeVectorConstants0.packedValues[29u].x) * comparisonValue71) + computeVectorConstants0.packedValues[29u].x;
        float nonlinearValue7 = sqrt(((multiplyAddValue120 * multiplyAddValue120) + (multiplyAddValue119 * multiplyAddValue119)) + (multiplyAddValue121 * multiplyAddValue121));
        float quotientValue42 = spvNClamp(((computeVectorConstants0.packedValues[31u].x - computeVectorConstants0.packedValues[20u].x) + (nonlinearValue7 / computeVectorConstants0.packedValues[20u].z)) * computeVectorConstants0.packedValues[20u].y, 0.0, 1.0);
        float productValue164 = productValue159 - (quotientValue42 * productValue159);
        float productValue165 = productValue160 - (quotientValue42 * productValue160);
        float productValue166 = productValue161 - (quotientValue42 * productValue161);
        float intermediateValue11;
        float intermediateValue12;
        if ((computeVectorConstants0.packedValues[33u].x > 0.5) && (computeVectorConstants0.packedValues[21u].w > 0.5))
        {
            vec4 sampledTextureValue91 = textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(quotientValue36, 1.0 - quotientValue37, (exp2(((computeVectorConstants0.packedValues[33u].y > 0.5) ? (quotientValue38 - computeVectorConstants0.packedValues[33u].z) : quotientValue38) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625), 0.0);
            intermediateValue11 = sampledTextureValue91.x;
            intermediateValue12 = sampledTextureValue91.y;
        }
        else
        {
            intermediateValue11 = 0.0;
            intermediateValue12 = computeVectorConstants0.packedValues[22u].y;
        }
        float productValue167 = computeVectorConstants0.packedValues[14u].w * intermediateValue11;
        float productValue35;
        float productValue36;
        float productValue37;
        if (computeVectorConstants0.packedValues[28u].w != 0.0)
        {
            float sumValue96 = (multiplyAddValue116 - computeVectorConstants0.packedValues[24u].x) + (-0.5);
            float sumValue97 = (multiplyAddValue117 - computeVectorConstants0.packedValues[24u].y) + (-0.5);
            float sumValue98 = (multiplyAddValue118 - computeVectorConstants0.packedValues[24u].z) + (-0.5);
            float productValue168 = floor(sumValue96 * 0.0625) * 16.0;
            float productValue169 = floor(sumValue97 * 0.0625) * 16.0;
            float productValue170 = floor(sumValue98 * 0.0625) * 16.0;
            uint productValue171 = uint(int(floor(float(int(uint(int(floor(sumValue96))))) * 0.0625)));
            uint productValue172 = uint(int(floor(float(int(uint(int(floor(sumValue97))))) * 0.0625)));
            uint productValue173 = uint(int(floor(float(int(uint(int(floor(sumValue98))))) * 0.0625)));
            float sumValue99 = sumValue96 - productValue168;
            float sumValue100 = sumValue97 - productValue169;
            float sumValue101 = sumValue98 - productValue170;
            uint bitwiseValue4 = (productValue172 << 16u) | (productValue171 & 65535u);
            uint bitwiseValue8 = productValue173 & 65535u;
            uint productValue174 = productValue171 * 1540483477u;
            uint productValue175 = productValue172 * 1540483477u;
            uint productValue176 = productValue173 * 1540483477u;
            uint bitwiseValue9 = ((((((((productValue174 >> 24u) ^ productValue174) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue175 >> 24u) ^ productValue175) * 1540483477u)) * 1540483477u) ^ (((productValue176 >> 24u) ^ productValue176) * 1540483477u)) * 1540483477u;
            uint bitwiseValue10 = ((bitwiseValue9 >> 13u) ^ bitwiseValue9) * 1540483477u;
            uint bitwiseValue12 = (bitwiseValue10 >> 15u) ^ bitwiseValue10;
            uint bitwiseValue14 = bitwiseValue12 >> 16u;
            uint bitwiseValue16 = bitwiseValue12 & 65535u;
            uint comparisonValue76 = uint(bitwiseValue16 == bitwiseValue14) | (bitwiseValue16 ^ bitwiseValue14);
            uint sumValue102 = uint(computeVectorConstants0.packedValues[15u].x) + 4294967295u;
            bool intermediateValue16;
            uint scalarValue45 = comparisonValue76;
            uint scalarValue46 = 0u;
            uint scalarValue47 = 0u;
            uint sampledTextureValue12;
            uint bitwiseValue7;
            for (;;)
            {
                bitwiseValue7 = scalarValue45 & sumValue102;
                uint sampledTextureValue92 = texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 2u)).x & 65535u;
                bool sampledTextureValue93 = (texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 1u)).x == bitwiseValue8) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue7 * 4u)).x == bitwiseValue4) && (sampledTextureValue92 == comparisonValue76));
                sampledTextureValue12 = sampledTextureValue93 ? texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 3u)).x : scalarValue46;
                if ((sampledTextureValue92 == 0u) || sampledTextureValue93)
                {
                    intermediateValue16 = sampledTextureValue93;
                    break;
                }
                else
                {
                    uint sumValue103 = scalarValue47 + 1u;
                    if (int(sumValue103) < int(8u))
                    {
                        scalarValue45 = bitwiseValue7 + 1u;
                        scalarValue46 = sampledTextureValue12;
                        scalarValue47 = sumValue103;
                        continue;
                    }
                    else
                    {
                        intermediateValue16 = false;
                        break;
                    }
                }
            }
            uint bitwiseValue17 = sampledTextureValue12 >> 2u;
            float productValue52;
            float productValue53;
            float productValue54;
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
                uint productValue46;
                uint productValue47;
                uint productValue48;
                uint productValue49;
                uint productValue50;
                uint productValue51;
                for (;;)
                {
                    intermediateValue17 = floor(sumValue99);
                    intermediateValue18 = floor(sumValue100);
                    intermediateValue19 = floor(sumValue101);
                    float sumValue104 = sumValue99 - intermediateValue17;
                    float sumValue105 = sumValue100 - intermediateValue18;
                    float sumValue106 = sumValue101 - intermediateValue19;
                    uint comparisonValue77 = ((uint(sumValue105 >= sumValue106) << 1u) | uint(sumValue104 >= sumValue105)) | (uint(sumValue104 >= sumValue106) << 2u);
                    intermediateValue20 = uint(intermediateValue17);
                    intermediateValue21 = uint(intermediateValue18);
                    intermediateValue22 = uint(intermediateValue19);
                    float scalarValue48 = spvNMin(sumValue104, sumValue105);
                    float scalarValue49 = spvNMax(sumValue104, sumValue105);
                    intermediateValue25 = spvNMin(scalarValue48, sumValue106);
                    float scalarValue50 = spvNMax(scalarValue49, sumValue106);
                    float scalarValue51 = spvNMax(spvNMin(scalarValue49, sumValue106), scalarValue48);
                    sumValue19 = 1.0 - scalarValue50;
                    sumValue20 = scalarValue50 - scalarValue51;
                    sumValue21 = scalarValue51 - intermediateValue25;
                    sumValue22 = intermediateValue17 + 1.0;
                    sumValue23 = intermediateValue18 + 1.0;
                    sumValue24 = intermediateValue19 + 1.0;
                    comparisonValue7 = (((intermediateValue17 >= 0.0) && (intermediateValue18 >= 0.0)) && (intermediateValue19 >= 0.0)) && (((sumValue22 < 16.0) && (sumValue23 < 16.0)) && (sumValue24 < 16.0));
                    productValue46 = 0u + (comparisonValue77 * 3u);
                    productValue47 = 1u + (comparisonValue77 * 3u);
                    productValue48 = 2u + (comparisonValue77 * 3u);
                    productValue49 = 0u + (comparisonValue77 * 3u);
                    productValue50 = 1u + (comparisonValue77 * 3u);
                    productValue51 = 2u + (comparisonValue77 * 3u);
                    if (comparisonValue7)
                    {
                        uint bitwiseValue18 = intermediateValue22 << 4u;
                        uint sumValue107 = intermediateValue21 + bitwiseValue17;
                        uint bitwiseValue19 = sumValue107 + (intermediateValue20 << 8u);
                        uvec4 sampledTextureValue94 = texelFetch(voxelBuffer, int(bitwiseValue19 + bitwiseValue18));
                        uint scalarValue52 = sampledTextureValue94.x;
                        float bitwiseValue11;
                        float intermediateValue29;
                        float intermediateValue30;
                        if (scalarValue52 == 0u)
                        {
                            bitwiseValue11 = 0.0;
                            intermediateValue29 = 0.0;
                            intermediateValue30 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue20 = float(scalarValue52 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue11 = bitwiseValue20 * float(scalarValue52 & 255u);
                            intermediateValue29 = bitwiseValue20 * float((scalarValue52 >> 8u) & 255u);
                            intermediateValue30 = bitwiseValue20 * float((scalarValue52 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue95 = texelFetch(voxelBuffer, int(((intermediateValue1[productValue47] + sumValue107) + ((intermediateValue1[productValue46] + intermediateValue20) << 8u)) + ((intermediateValue1[productValue48] + intermediateValue22) << 4u)));
                        uint scalarValue53 = sampledTextureValue95.x;
                        float bitwiseValue13;
                        float intermediateValue32;
                        float intermediateValue33;
                        if (scalarValue53 == 0u)
                        {
                            bitwiseValue13 = 0.0;
                            intermediateValue32 = 0.0;
                            intermediateValue33 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue21 = float(scalarValue53 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue13 = bitwiseValue21 * float(scalarValue53 & 255u);
                            intermediateValue32 = bitwiseValue21 * float((scalarValue53 >> 8u) & 255u);
                            intermediateValue33 = bitwiseValue21 * float((scalarValue53 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue96 = texelFetch(voxelBuffer, int(((intermediateValue2[productValue50] + sumValue107) + ((intermediateValue2[productValue49] + intermediateValue20) << 8u)) + ((intermediateValue2[productValue51] + intermediateValue22) << 4u)));
                        uint scalarValue54 = sampledTextureValue96.x;
                        float bitwiseValue15;
                        float intermediateValue39;
                        float intermediateValue40;
                        if (scalarValue54 == 0u)
                        {
                            bitwiseValue15 = 0.0;
                            intermediateValue39 = 0.0;
                            intermediateValue40 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue22 = float(scalarValue54 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue15 = bitwiseValue22 * float(scalarValue54 & 255u);
                            intermediateValue39 = bitwiseValue22 * float((scalarValue54 >> 8u) & 255u);
                            intermediateValue40 = bitwiseValue22 * float((scalarValue54 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue97 = texelFetch(voxelBuffer, int((bitwiseValue19 + 273u) + bitwiseValue18));
                        uint scalarValue55 = sampledTextureValue97.x;
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
                        if (scalarValue55 == 0u)
                        {
                            branchMergedValue1 = 0.0;
                            branchMergedValue5 = 0.0;
                            branchMergedValue6 = 0.0;
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
                            float bitwiseValue23 = float(scalarValue55 >> 24u) * 9.2272217443678528070449829101562e-05;
                            branchMergedValue1 = bitwiseValue23 * float((scalarValue55 >> 8u) & 255u);
                            branchMergedValue5 = bitwiseValue23 * float(scalarValue55 & 255u);
                            branchMergedValue6 = bitwiseValue23 * float((scalarValue55 >> 16u) & 255u);
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
                            sumValue26 = float(intermediateValue1[productValue46]) + intermediateValue17;
                            sumValue27 = float(intermediateValue1[productValue47]) + intermediateValue18;
                            sumValue28 = float(intermediateValue1[productValue48]) + intermediateValue19;
                            sumValue29 = float(intermediateValue2[productValue49]) + intermediateValue17;
                            sumValue30 = float(intermediateValue2[productValue50]) + intermediateValue18;
                            sumValue31 = float(intermediateValue2[productValue51]) + intermediateValue19;
                            sumValue32 = intermediateValue17 + productValue168;
                            sumValue33 = intermediateValue18 + productValue169;
                            sumValue34 = intermediateValue19 + productValue170;
                            uint comparisonValue78 = ((((uint(intermediateValue17 >= 16.0) << 1u) | uint(intermediateValue17 < 0.0)) | (uint(intermediateValue18 < 0.0) << 2u)) | (uint(intermediateValue18 >= 16.0) << 3u)) | (uint(intermediateValue19 < 0.0) << 4u);
                            comparisonValue9 = intermediateValue[comparisonValue78 | (uint(intermediateValue19 >= 16.0) << 5u)];
                            comparisonValue10 = ((((comparisonValue78 | (uint(intermediateValue19 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue78 & 31u))) == 0u;
                            uint sampledTextureValue19;
                            if (comparisonValue10)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue17 + 4096u)).x & (1u << (comparisonValue9 & 31u))) == 0u)
                                {
                                    intermediateValue35 = 0.0;
                                    intermediateValue36 = 0.0;
                                    intermediateValue37 = 0.0;
                                    break;
                                }
                                sampledTextureValue19 = ((((uint(sumValue32 - (floor(sumValue32 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue33 - (floor(sumValue33 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue34 - (floor(sumValue34 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue17 + 4097u) + comparisonValue9)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue19 = ((((intermediateValue20 << 8u) & 3840u) | (intermediateValue21 & 15u)) | ((intermediateValue22 << 4u) & 240u)) + bitwiseValue17;
                            }
                            uvec4 sampledTextureValue98 = texelFetch(voxelBuffer, int(sampledTextureValue19));
                            uint scalarValue56 = sampledTextureValue98.x;
                            if (scalarValue56 == 0u)
                            {
                                intermediateValue35 = 0.0;
                                intermediateValue36 = 0.0;
                                intermediateValue37 = 0.0;
                                break;
                            }
                            float bitwiseValue24 = float(scalarValue56 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue35 = bitwiseValue24 * float(scalarValue56 & 255u);
                            intermediateValue36 = bitwiseValue24 * float((scalarValue56 >> 8u) & 255u);
                            intermediateValue37 = bitwiseValue24 * float((scalarValue56 >> 16u) & 255u);
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
                            sumValue35 = sumValue26 + productValue168;
                            sumValue36 = sumValue27 + productValue169;
                            sumValue37 = sumValue28 + productValue170;
                            uint comparisonValue79 = ((((uint(sumValue26 >= 16.0) << 1u) | uint(sumValue26 < 0.0)) | (uint(sumValue27 < 0.0) << 2u)) | (uint(sumValue27 >= 16.0) << 3u)) | (uint(sumValue28 < 0.0) << 4u);
                            comparisonValue12 = intermediateValue[comparisonValue79 | (uint(sumValue28 >= 16.0) << 5u)];
                            comparisonValue13 = ((((comparisonValue79 | (uint(sumValue28 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue79 & 31u))) == 0u;
                            uint sampledTextureValue22;
                            if (comparisonValue13)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue17 + 4096u)).x & (1u << (comparisonValue12 & 31u))) == 0u)
                                {
                                    intermediateValue46 = 0.0;
                                    intermediateValue48 = 0.0;
                                    intermediateValue50 = 0.0;
                                    break;
                                }
                                sampledTextureValue22 = ((((uint(sumValue35 - (floor(sumValue35 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue36 - (floor(sumValue36 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue37 - (floor(sumValue37 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue17 + 4097u) + comparisonValue12)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue22 = ((((uint(sumValue26) << 8u) & 3840u) | (uint(sumValue27) & 15u)) | ((uint(sumValue28) << 4u) & 240u)) + bitwiseValue17;
                            }
                            uvec4 sampledTextureValue99 = texelFetch(voxelBuffer, int(sampledTextureValue22));
                            uint scalarValue57 = sampledTextureValue99.x;
                            if (scalarValue57 == 0u)
                            {
                                intermediateValue46 = 0.0;
                                intermediateValue48 = 0.0;
                                intermediateValue50 = 0.0;
                                break;
                            }
                            float bitwiseValue25 = float(scalarValue57 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue46 = bitwiseValue25 * float(scalarValue57 & 255u);
                            intermediateValue48 = bitwiseValue25 * float((scalarValue57 >> 8u) & 255u);
                            intermediateValue50 = bitwiseValue25 * float((scalarValue57 >> 16u) & 255u);
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
                            sumValue38 = sumValue29 + productValue168;
                            sumValue39 = sumValue30 + productValue169;
                            sumValue40 = sumValue31 + productValue170;
                            uint comparisonValue80 = ((((uint(sumValue29 >= 16.0) << 1u) | uint(sumValue29 < 0.0)) | (uint(sumValue30 < 0.0) << 2u)) | (uint(sumValue30 >= 16.0) << 3u)) | (uint(sumValue31 < 0.0) << 4u);
                            comparisonValue15 = intermediateValue[comparisonValue80 | (uint(sumValue31 >= 16.0) << 5u)];
                            comparisonValue16 = ((((comparisonValue80 | (uint(sumValue31 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue80 & 31u))) == 0u;
                            uint sampledTextureValue24;
                            if (comparisonValue16)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue17 + 4096u)).x & (1u << (comparisonValue15 & 31u))) == 0u)
                                {
                                    intermediateValue52 = 0.0;
                                    intermediateValue54 = 0.0;
                                    intermediateValue56 = 0.0;
                                    break;
                                }
                                sampledTextureValue24 = ((((uint(sumValue38 - (floor(sumValue38 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue39 - (floor(sumValue39 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue40 - (floor(sumValue40 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue17 + 4097u) + comparisonValue15)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue24 = ((((uint(sumValue29) << 8u) & 3840u) | (uint(sumValue30) & 15u)) | ((uint(sumValue31) << 4u) & 240u)) + bitwiseValue17;
                            }
                            uvec4 sampledTextureValue100 = texelFetch(voxelBuffer, int(sampledTextureValue24));
                            uint scalarValue58 = sampledTextureValue100.x;
                            if (scalarValue58 == 0u)
                            {
                                intermediateValue52 = 0.0;
                                intermediateValue54 = 0.0;
                                intermediateValue56 = 0.0;
                                break;
                            }
                            float bitwiseValue26 = float(scalarValue58 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue52 = bitwiseValue26 * float(scalarValue58 & 255u);
                            intermediateValue54 = bitwiseValue26 * float((scalarValue58 >> 8u) & 255u);
                            intermediateValue56 = bitwiseValue26 * float((scalarValue58 >> 16u) & 255u);
                            break;
                        }
                        float sumValue108 = sumValue22 + productValue168;
                        float sumValue109 = sumValue23 + productValue169;
                        float sumValue110 = sumValue24 + productValue170;
                        uint comparisonValue81 = ((((uint(sumValue22 >= 16.0) << 1u) | uint(sumValue22 < 0.0)) | (uint(sumValue23 < 0.0) << 2u)) | (uint(sumValue23 >= 16.0) << 3u)) | (uint(sumValue24 < 0.0) << 4u);
                        uint comparisonValue82 = comparisonValue81 | (uint(sumValue24 >= 16.0) << 5u);
                        uint sampledTextureValue26;
                        if ((((comparisonValue82 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue81 & 31u))) == 0u)
                        {
                            if ((texelFetch(voxelBuffer, int(bitwiseValue17 + 4096u)).x & (1u << (intermediateValue[comparisonValue82] & 31u))) == 0u)
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
                                intermediateValue57 = 0.0;
                                intermediateValue58 = 0.0;
                                intermediateValue59 = 0.0;
                                break;
                            }
                            sampledTextureValue26 = ((((uint(sumValue108 - (floor(sumValue108 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue109 - (floor(sumValue109 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue110 - (floor(sumValue110 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue17 + 4097u) + intermediateValue[comparisonValue82])).x >> 2u);
                        }
                        else
                        {
                            sampledTextureValue26 = ((((uint(sumValue22) << 8u) & 3840u) | (uint(sumValue23) & 15u)) | ((uint(sumValue24) << 4u) & 240u)) + bitwiseValue17;
                        }
                        uvec4 sampledTextureValue101 = texelFetch(voxelBuffer, int(sampledTextureValue26));
                        uint scalarValue59 = sampledTextureValue101.x;
                        if (scalarValue59 == 0u)
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
                            intermediateValue57 = 0.0;
                            intermediateValue58 = 0.0;
                            intermediateValue59 = 0.0;
                            break;
                        }
                        float bitwiseValue27 = float(scalarValue59 >> 24u) * 9.2272217443678528070449829101562e-05;
                        intermediateValue42 = intermediateValue35;
                        intermediateValue43 = intermediateValue36;
                        intermediateValue44 = intermediateValue37;
                        intermediateValue45 = intermediateValue46;
                        intermediateValue47 = intermediateValue48;
                        intermediateValue49 = intermediateValue50;
                        intermediateValue51 = intermediateValue52;
                        intermediateValue53 = intermediateValue54;
                        intermediateValue55 = intermediateValue56;
                        intermediateValue57 = bitwiseValue27 * float(scalarValue59 & 255u);
                        intermediateValue58 = bitwiseValue27 * float((scalarValue59 >> 8u) & 255u);
                        intermediateValue59 = bitwiseValue27 * float((scalarValue59 >> 16u) & 255u);
                        break;
                    }
                }
                productValue52 = (((intermediateValue45 * sumValue20) + (intermediateValue42 * sumValue19)) + (intermediateValue51 * sumValue21)) + (intermediateValue57 * intermediateValue25);
                productValue53 = (((intermediateValue47 * sumValue20) + (intermediateValue43 * sumValue19)) + (intermediateValue53 * sumValue21)) + (intermediateValue58 * intermediateValue25);
                productValue54 = (((intermediateValue49 * sumValue20) + (intermediateValue44 * sumValue19)) + (intermediateValue55 * sumValue21)) + (intermediateValue59 * intermediateValue25);
            }
            else
            {
                productValue52 = 0.0;
                productValue53 = 0.0;
                productValue54 = 0.0;
            }
            productValue35 = computeVectorConstants0.packedValues[14u].w * productValue52;
            productValue36 = computeVectorConstants0.packedValues[14u].w * productValue53;
            productValue37 = computeVectorConstants0.packedValues[14u].w * productValue54;
        }
        else
        {
            productValue35 = productValue167 * computeVectorConstants0.packedValues[14u].x;
            productValue36 = productValue167 * computeVectorConstants0.packedValues[14u].y;
            productValue37 = productValue167 * computeVectorConstants0.packedValues[14u].z;
        }
        float productValue177 = computeVectorConstants0.packedValues[32u].w * intermediateValue12;
        float productValue178 = computeVectorConstants0.packedValues[26u].w * 0.079577468335628509521484375;
        float productValue179 = (spvNMax((productValue177 * computeVectorConstants0.packedValues[32u].x) + productValue35, computeVectorConstants0.packedValues[30u].x) * productValue164) * productValue178;
        float productValue180 = (spvNMax((productValue177 * computeVectorConstants0.packedValues[32u].y) + productValue36, computeVectorConstants0.packedValues[30u].x) * productValue165) * productValue178;
        float productValue181 = (spvNMax((productValue177 * computeVectorConstants0.packedValues[32u].z) + productValue37, computeVectorConstants0.packedValues[30u].x) * productValue166) * productValue178;
        float productValue43;
        float productValue44;
        float productValue45;
        if ((computeVectorConstants0.packedValues[27u].y == 0.0) || (abs(intermediateValue12) > 9.9999997473787516355514526367188e-05))
        {
            float multiplyAddValue8 = fma(computeVectorConstants0.packedValues[8u].x, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].x, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].x, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].x)));
            float multiplyAddValue9 = fma(computeVectorConstants0.packedValues[8u].y, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].y, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].y, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].y)));
            float multiplyAddValue10 = fma(computeVectorConstants0.packedValues[8u].z, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].z, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].z, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].z)));
            float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), vec3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
            float dotProductValue3 = (((dot(vec3((-0.0) - (multiplyAddValue119 / nonlinearValue7), (-0.0) - (multiplyAddValue120 / nonlinearValue7), (-0.0) - (multiplyAddValue121 / nonlinearValue7)), vec3(inverseLengthValue * multiplyAddValue8, inverseLengthValue * multiplyAddValue9, inverseLengthValue * multiplyAddValue10)) * 2.0) + productValue163) * productValue163) + 1.0;
            float sampledTextureValue102 = computeVectorConstants0.packedValues[25u].w * ((((1.0 - (productValue163 * productValue163)) * 0.079577468335628509521484375) / (dotProductValue3 * sqrt(dotProductValue3))) * texelFetch(cascadedShadowBufferTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), int(0u)).x);
            productValue43 = ((sampledTextureValue102 * productValue164) * computeVectorConstants0.packedValues[25u].x) + productValue179;
            productValue44 = ((sampledTextureValue102 * productValue165) * computeVectorConstants0.packedValues[25u].y) + productValue180;
            productValue45 = ((sampledTextureValue102 * productValue166) * computeVectorConstants0.packedValues[25u].z) + productValue181;
        }
        else
        {
            productValue43 = productValue179;
            productValue44 = productValue180;
            productValue45 = productValue181;
        }
        imageStore(scatteringBufferOutTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(productValue43, productValue44, productValue45, productValue162 - (quotientValue42 * productValue162)));
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                uint productValue203 = (comparisonValue113 * 20u) + 4u;
                vec4 sampledTextureValue132 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue203)).x, texelFetch(zBiomeInfoBuffer, int(productValue203 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue203 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue203 + 3u)).x));
                uint productValue204 = (comparisonValue114 * 20u) + 4u;
                vec4 sampledTextureValue133 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue204)).x, texelFetch(zBiomeInfoBuffer, int(productValue204 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue204 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue204 + 3u)).x));
                uint productValue205 = (comparisonValue115 * 20u) + 4u;
                vec4 sampledTextureValue134 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue205)).x, texelFetch(zBiomeInfoBuffer, int(productValue205 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue205 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue205 + 3u)).x));
                uint productValue206 = (comparisonValue116 * 20u) + 4u;
                vec4 sampledTextureValue135 = uintBitsToFloat(uvec4(texelFetch(zBiomeInfoBuffer, int(productValue206)).x, texelFetch(zBiomeInfoBuffer, int(productValue206 + 1u)).x, texelFetch(zBiomeInfoBuffer, int(productValue206 + 2u)).x, texelFetch(zBiomeInfoBuffer, int(productValue206 + 3u)).x));
                float scalarValue90 = fract(quotientValue50);
                float scalarValue91 = fract(quotientValue51);
                float sumValue145 = 1.0 - scalarValue90;
                float sumValue146 = 1.0 - scalarValue91;
                float productValue207 = sumValue146 * sumValue145;
                float productValue208 = sumValue146 * scalarValue90;
                float productValue209 = sumValue145 * scalarValue91;
                float productValue210 = scalarValue91 * scalarValue90;
                branchMergedValue4 = (((productValue210 * sampledTextureValue135.z) + (productValue209 * sampledTextureValue134.z)) + (productValue208 * sampledTextureValue133.z)) + (productValue207 * sampledTextureValue132.z);
                branchMergedValue9 = (((productValue210 * sampledTextureValue135.y) + (productValue209 * sampledTextureValue134.y)) + (productValue208 * sampledTextureValue133.y)) + (productValue207 * sampledTextureValue132.y);
                branchMergedValue10 = (((productValue210 * sampledTextureValue135.x) + (productValue209 * sampledTextureValue134.x)) + (productValue208 * sampledTextureValue133.x)) + (productValue207 * sampledTextureValue132.x);
                branchMergedValue11 = (((productValue210 * sampledTextureValue135.w) + (productValue209 * sampledTextureValue134.w)) + (productValue208 * sampledTextureValue133.w)) + (productValue207 * sampledTextureValue132.w);
            }
            intermediateValue7 = branchMergedValue10;
            intermediateValue8 = branchMergedValue9;
            intermediateValue9 = branchMergedValue4;
            intermediateValue10 = branchMergedValue11;
        }
        else
        {
            intermediateValue7 = computeVectorConstants0.packedValues[49u].x;
            intermediateValue8 = computeVectorConstants0.packedValues[49u].y;
            intermediateValue9 = computeVectorConstants0.packedValues[49u].z;
            intermediateValue10 = computeVectorConstants0.packedValues[49u].w;
        }
        float productValue211 = computeVectorConstants0.packedValues[21u].w * spvNClamp((computeVectorConstants0.packedValues[20u].x * multiplyAddValue166) + computeVectorConstants0.packedValues[20u].y, 0.0, 1.0);
        float productValue212 = productValue211 * computeVectorConstants0.packedValues[21u].x;
        float productValue213 = productValue211 * computeVectorConstants0.packedValues[21u].y;
        float productValue214 = productValue211 * computeVectorConstants0.packedValues[21u].z;
        float productValue215 = (((intermediateValue10 * intermediateValue7) - productValue212) * comparisonValue112) + productValue212;
        float productValue216 = (((intermediateValue10 * intermediateValue8) - productValue213) * comparisonValue112) + productValue213;
        float productValue217 = (((intermediateValue10 * intermediateValue9) - productValue214) * comparisonValue112) + productValue214;
        float productValue218 = ((intermediateValue10 - productValue211) * comparisonValue112) + productValue211;
        float productValue219 = ((computeVectorConstants0.packedValues[33u].y - computeVectorConstants0.packedValues[33u].x) * comparisonValue112) + computeVectorConstants0.packedValues[33u].x;
        float nonlinearValue9 = sqrt(((sumValue137 * sumValue137) + (sumValue136 * sumValue136)) + (sumValue138 * sumValue138));
        float quotientValue52 = spvNClamp(((computeVectorConstants0.packedValues[43u].x - computeVectorConstants0.packedValues[22u].x) + (nonlinearValue9 / computeVectorConstants0.packedValues[22u].z)) * computeVectorConstants0.packedValues[22u].y, 0.0, 1.0);
        float productValue220 = productValue215 - (quotientValue52 * productValue215);
        float productValue221 = productValue216 - (quotientValue52 * productValue216);
        float productValue222 = productValue217 - (quotientValue52 * productValue217);
        float intermediateValue11;
        float intermediateValue12;
        if ((computeVectorConstants0.packedValues[45u].x > 0.5) && (computeVectorConstants0.packedValues[23u].w > 0.5))
        {
            vec4 sampledTextureValue136 = textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(quotientValue46, 1.0 - quotientValue47, (exp2(((computeVectorConstants0.packedValues[45u].y > 0.5) ? (quotientValue48 - computeVectorConstants0.packedValues[45u].z) : quotientValue48) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625), 0.0);
            intermediateValue11 = sampledTextureValue136.x;
            intermediateValue12 = sampledTextureValue136.y;
        }
        else
        {
            intermediateValue11 = 0.0;
            intermediateValue12 = computeVectorConstants0.packedValues[24u].y;
        }
        float productValue167 = computeVectorConstants0.packedValues[14u].w * intermediateValue11;
        float productValue35;
        float productValue36;
        float productValue37;
        if ((computeVectorConstants0.packedValues[17u].z != 0.0) && (computeVectorConstants0.packedValues[32u].w != 0.0))
        {
            float sumValue147 = (multiplyAddValue165 - computeVectorConstants0.packedValues[27u].x) + (-0.5);
            float sumValue148 = (multiplyAddValue166 - computeVectorConstants0.packedValues[27u].y) + (-0.5);
            float sumValue149 = (multiplyAddValue167 - computeVectorConstants0.packedValues[27u].z) + (-0.4799999892711639404296875);
            float productValue223 = floor(sumValue147 * 0.0625) * 16.0;
            float productValue224 = floor(sumValue148 * 0.0625) * 16.0;
            float productValue225 = floor(sumValue149 * 0.0625) * 16.0;
            uint productValue226 = uint(int(floor(float(int(uint(int(floor(sumValue147))))) * 0.0625)));
            uint productValue227 = uint(int(floor(float(int(uint(int(floor(sumValue148))))) * 0.0625)));
            uint productValue228 = uint(int(floor(float(int(uint(int(floor(sumValue149))))) * 0.0625)));
            float sumValue150 = sumValue147 - productValue223;
            float sumValue151 = sumValue148 - productValue224;
            float sumValue152 = sumValue149 - productValue225;
            uint bitwiseValue44 = (productValue227 << 16u) | (productValue226 & 65535u);
            uint bitwiseValue45 = (productValue228 & 65535u) | 131072u;
            uint productValue229 = productValue226 * 1540483477u;
            uint productValue230 = productValue227 * 1540483477u;
            uint productValue231 = productValue228 * 1540483477u;
            uint bitwiseValue46 = (((((((((productValue229 >> 24u) ^ productValue229) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue230 >> 24u) ^ productValue230) * 1540483477u)) * 1540483477u) ^ (((productValue231 >> 24u) ^ productValue231) * 1540483477u)) * 1540483477u) ^ 2418085729u;
            uint bitwiseValue47 = ((bitwiseValue46 >> 13u) ^ bitwiseValue46) * 1540483477u;
            uint bitwiseValue48 = (bitwiseValue47 >> 15u) ^ bitwiseValue47;
            uint bitwiseValue49 = bitwiseValue48 >> 16u;
            uint bitwiseValue50 = bitwiseValue48 & 65535u;
            uint comparisonValue117 = uint(bitwiseValue50 == bitwiseValue49) | (bitwiseValue50 ^ bitwiseValue49);
            uint sumValue153 = uint(computeVectorConstants0.packedValues[16u].x) + 4294967295u;
            bool intermediateValue16;
            uint scalarValue92 = comparisonValue117;
            uint scalarValue46 = 0u;
            uint scalarValue47 = 0u;
            uint sampledTextureValue12;
            uint bitwiseValue7;
            for (;;)
            {
                bitwiseValue7 = scalarValue92 & sumValue153;
                uint sampledTextureValue92 = texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 2u)).x & 65535u;
                bool sampledTextureValue137 = (texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 1u)).x == bitwiseValue45) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue7 * 4u)).x == bitwiseValue44) && (sampledTextureValue92 == comparisonValue117));
                sampledTextureValue12 = sampledTextureValue137 ? texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 3u)).x : scalarValue46;
                if ((sampledTextureValue92 == 0u) || sampledTextureValue137)
                {
                    intermediateValue16 = sampledTextureValue137;
                    break;
                }
                else
                {
                    uint sumValue103 = scalarValue47 + 1u;
                    if (int(sumValue103) < int(8u))
                    {
                        scalarValue92 = bitwiseValue7 + 1u;
                        scalarValue46 = sampledTextureValue12;
                        scalarValue47 = sumValue103;
                        continue;
                    }
                    else
                    {
                        intermediateValue16 = false;
                        break;
                    }
                }
            }
            uint bitwiseValue17 = sampledTextureValue12 >> 2u;
            float productValue57;
            float productValue58;
            float productValue59;
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
                uint productValue51;
                uint productValue52;
                uint productValue53;
                uint productValue54;
                uint productValue55;
                uint productValue56;
                for (;;)
                {
                    intermediateValue17 = floor(sumValue150);
                    intermediateValue18 = floor(sumValue151);
                    intermediateValue19 = floor(sumValue152);
                    float sumValue154 = sumValue150 - intermediateValue17;
                    float sumValue155 = sumValue151 - intermediateValue18;
                    float sumValue156 = sumValue152 - intermediateValue19;
                    uint comparisonValue118 = ((uint(sumValue155 >= sumValue156) << 1u) | uint(sumValue154 >= sumValue155)) | (uint(sumValue154 >= sumValue156) << 2u);
                    intermediateValue20 = uint(intermediateValue17);
                    intermediateValue21 = uint(intermediateValue18);
                    intermediateValue22 = uint(intermediateValue19);
                    float scalarValue93 = spvNMin(sumValue154, sumValue155);
                    float scalarValue94 = spvNMax(sumValue154, sumValue155);
                    intermediateValue25 = spvNMin(scalarValue93, sumValue156);
                    float scalarValue95 = spvNMax(scalarValue94, sumValue156);
                    float scalarValue96 = spvNMax(spvNMin(scalarValue94, sumValue156), scalarValue93);
                    sumValue24 = 1.0 - scalarValue95;
                    sumValue25 = scalarValue95 - scalarValue96;
                    sumValue26 = scalarValue96 - intermediateValue25;
                    sumValue27 = intermediateValue17 + 1.0;
                    sumValue28 = intermediateValue18 + 1.0;
                    sumValue29 = intermediateValue19 + 1.0;
                    comparisonValue7 = (((intermediateValue17 >= 0.0) && (intermediateValue18 >= 0.0)) && (intermediateValue19 >= 0.0)) && (((sumValue27 < 16.0) && (sumValue28 < 16.0)) && (sumValue29 < 16.0));
                    productValue51 = 0u + (comparisonValue118 * 3u);
                    productValue52 = 1u + (comparisonValue118 * 3u);
                    productValue53 = 2u + (comparisonValue118 * 3u);
                    productValue54 = 0u + (comparisonValue118 * 3u);
                    productValue55 = 1u + (comparisonValue118 * 3u);
                    productValue56 = 2u + (comparisonValue118 * 3u);
                    if (comparisonValue7)
                    {
                        uint bitwiseValue18 = intermediateValue22 << 4u;
                        uint sumValue107 = intermediateValue21 + bitwiseValue17;
                        uint bitwiseValue19 = sumValue107 + (intermediateValue20 << 8u);
                        uvec4 sampledTextureValue94 = texelFetch(voxelBuffer, int(bitwiseValue19 + bitwiseValue18));
                        uint scalarValue52 = sampledTextureValue94.x;
                        float bitwiseValue11;
                        float intermediateValue35;
                        float intermediateValue36;
                        if (scalarValue52 == 0u)
                        {
                            bitwiseValue11 = 0.0;
                            intermediateValue35 = 0.0;
                            intermediateValue36 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue20 = float(scalarValue52 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue11 = bitwiseValue20 * float(scalarValue52 & 255u);
                            intermediateValue35 = bitwiseValue20 * float((scalarValue52 >> 8u) & 255u);
                            intermediateValue36 = bitwiseValue20 * float((scalarValue52 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue138 = texelFetch(voxelBuffer, int(((intermediateValue1[productValue52] + sumValue107) + ((intermediateValue1[productValue51] + intermediateValue20) << 8u)) + ((intermediateValue1[productValue53] + intermediateValue22) << 4u)));
                        uint scalarValue97 = sampledTextureValue138.x;
                        float bitwiseValue13;
                        float intermediateValue44;
                        float intermediateValue45;
                        if (scalarValue97 == 0u)
                        {
                            bitwiseValue13 = 0.0;
                            intermediateValue44 = 0.0;
                            intermediateValue45 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue51 = float(scalarValue97 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue13 = bitwiseValue51 * float(scalarValue97 & 255u);
                            intermediateValue44 = bitwiseValue51 * float((scalarValue97 >> 8u) & 255u);
                            intermediateValue45 = bitwiseValue51 * float((scalarValue97 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue139 = texelFetch(voxelBuffer, int(((intermediateValue2[productValue55] + sumValue107) + ((intermediateValue2[productValue54] + intermediateValue20) << 8u)) + ((intermediateValue2[productValue56] + intermediateValue22) << 4u)));
                        uint scalarValue98 = sampledTextureValue139.x;
                        float bitwiseValue15;
                        float intermediateValue55;
                        float intermediateValue56;
                        if (scalarValue98 == 0u)
                        {
                            bitwiseValue15 = 0.0;
                            intermediateValue55 = 0.0;
                            intermediateValue56 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue52 = float(scalarValue98 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue15 = bitwiseValue52 * float(scalarValue98 & 255u);
                            intermediateValue55 = bitwiseValue52 * float((scalarValue98 >> 8u) & 255u);
                            intermediateValue56 = bitwiseValue52 * float((scalarValue98 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue97 = texelFetch(voxelBuffer, int((bitwiseValue19 + 273u) + bitwiseValue18));
                        uint scalarValue55 = sampledTextureValue97.x;
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
                        if (scalarValue55 == 0u)
                        {
                            branchMergedValue6 = bitwiseValue13;
                            branchMergedValue13 = intermediateValue44;
                            branchMergedValue14 = intermediateValue45;
                            branchMergedValue15 = bitwiseValue15;
                            branchMergedValue16 = intermediateValue55;
                            branchMergedValue17 = intermediateValue56;
                            branchMergedValue18 = 0.0;
                            branchMergedValue19 = 0.0;
                            branchMergedValue20 = intermediateValue35;
                            branchMergedValue21 = bitwiseValue11;
                            branchMergedValue28 = 0.0;
                            branchMergedValue29 = intermediateValue36;
                        }
                        else
                        {
                            float bitwiseValue23 = float(scalarValue55 >> 24u) * 9.2272217443678528070449829101562e-05;
                            branchMergedValue6 = bitwiseValue13;
                            branchMergedValue13 = intermediateValue44;
                            branchMergedValue14 = intermediateValue45;
                            branchMergedValue15 = bitwiseValue15;
                            branchMergedValue16 = intermediateValue55;
                            branchMergedValue17 = intermediateValue56;
                            branchMergedValue18 = bitwiseValue23 * float(scalarValue55 & 255u);
                            branchMergedValue19 = bitwiseValue23 * float((scalarValue55 >> 8u) & 255u);
                            branchMergedValue20 = intermediateValue35;
                            branchMergedValue21 = bitwiseValue11;
                            branchMergedValue28 = bitwiseValue23 * float((scalarValue55 >> 16u) & 255u);
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
                            sumValue31 = float(intermediateValue1[productValue51]) + intermediateValue17;
                            sumValue32 = float(intermediateValue1[productValue52]) + intermediateValue18;
                            sumValue33 = float(intermediateValue1[productValue53]) + intermediateValue19;
                            sumValue34 = float(intermediateValue2[productValue54]) + intermediateValue17;
                            sumValue35 = float(intermediateValue2[productValue55]) + intermediateValue18;
                            sumValue36 = float(intermediateValue2[productValue56]) + intermediateValue19;
                            sumValue37 = intermediateValue17 + productValue223;
                            sumValue38 = intermediateValue18 + productValue224;
                            sumValue39 = intermediateValue19 + productValue225;
                            uint comparisonValue78 = ((((uint(intermediateValue17 >= 16.0) << 1u) | uint(intermediateValue17 < 0.0)) | (uint(intermediateValue18 < 0.0) << 2u)) | (uint(intermediateValue18 >= 16.0) << 3u)) | (uint(intermediateValue19 < 0.0) << 4u);
                            comparisonValue9 = intermediateValue[comparisonValue78 | (uint(intermediateValue19 >= 16.0) << 5u)];
                            comparisonValue10 = ((((comparisonValue78 | (uint(intermediateValue19 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue78 & 31u))) == 0u;
                            uint sampledTextureValue19;
                            if (comparisonValue10)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue17 + 4096u)).x & (1u << (comparisonValue9 & 31u))) == 0u)
                                {
                                    intermediateValue47 = 0.0;
                                    intermediateValue48 = 0.0;
                                    intermediateValue49 = 0.0;
                                    break;
                                }
                                sampledTextureValue19 = ((((uint(sumValue37 - (floor(sumValue37 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue38 - (floor(sumValue38 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue39 - (floor(sumValue39 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue17 + 4097u) + comparisonValue9)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue19 = ((((intermediateValue20 << 8u) & 3840u) | (intermediateValue21 & 15u)) | ((intermediateValue22 << 4u) & 240u)) + bitwiseValue17;
                            }
                            uvec4 sampledTextureValue98 = texelFetch(voxelBuffer, int(sampledTextureValue19));
                            uint scalarValue56 = sampledTextureValue98.x;
                            if (scalarValue56 == 0u)
                            {
                                intermediateValue47 = 0.0;
                                intermediateValue48 = 0.0;
                                intermediateValue49 = 0.0;
                                break;
                            }
                            float bitwiseValue24 = float(scalarValue56 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue47 = bitwiseValue24 * float(scalarValue56 & 255u);
                            intermediateValue48 = bitwiseValue24 * float((scalarValue56 >> 8u) & 255u);
                            intermediateValue49 = bitwiseValue24 * float((scalarValue56 >> 16u) & 255u);
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
                            sumValue40 = sumValue31 + productValue223;
                            sumValue41 = sumValue32 + productValue224;
                            sumValue42 = sumValue33 + productValue225;
                            uint comparisonValue119 = ((((uint(sumValue31 >= 16.0) << 1u) | uint(sumValue31 < 0.0)) | (uint(sumValue32 < 0.0) << 2u)) | (uint(sumValue32 >= 16.0) << 3u)) | (uint(sumValue33 < 0.0) << 4u);
                            comparisonValue12 = intermediateValue[comparisonValue119 | (uint(sumValue33 >= 16.0) << 5u)];
                            comparisonValue13 = ((((comparisonValue119 | (uint(sumValue33 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue119 & 31u))) == 0u;
                            uint sampledTextureValue24;
                            if (comparisonValue13)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue17 + 4096u)).x & (1u << (comparisonValue12 & 31u))) == 0u)
                                {
                                    intermediateValue65 = 0.0;
                                    intermediateValue67 = 0.0;
                                    intermediateValue69 = 0.0;
                                    break;
                                }
                                sampledTextureValue24 = ((((uint(sumValue40 - (floor(sumValue40 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue41 - (floor(sumValue41 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue42 - (floor(sumValue42 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue17 + 4097u) + comparisonValue12)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue24 = ((((uint(sumValue31) << 8u) & 3840u) | (uint(sumValue32) & 15u)) | ((uint(sumValue33) << 4u) & 240u)) + bitwiseValue17;
                            }
                            uvec4 sampledTextureValue100 = texelFetch(voxelBuffer, int(sampledTextureValue24));
                            uint scalarValue58 = sampledTextureValue100.x;
                            if (scalarValue58 == 0u)
                            {
                                intermediateValue65 = 0.0;
                                intermediateValue67 = 0.0;
                                intermediateValue69 = 0.0;
                                break;
                            }
                            float bitwiseValue26 = float(scalarValue58 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue65 = bitwiseValue26 * float(scalarValue58 & 255u);
                            intermediateValue67 = bitwiseValue26 * float((scalarValue58 >> 8u) & 255u);
                            intermediateValue69 = bitwiseValue26 * float((scalarValue58 >> 16u) & 255u);
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
                            sumValue47 = sumValue34 + productValue223;
                            sumValue48 = sumValue35 + productValue224;
                            sumValue49 = sumValue36 + productValue225;
                            uint comparisonValue120 = ((((uint(sumValue34 >= 16.0) << 1u) | uint(sumValue34 < 0.0)) | (uint(sumValue35 < 0.0) << 2u)) | (uint(sumValue35 >= 16.0) << 3u)) | (uint(sumValue36 < 0.0) << 4u);
                            comparisonValue15 = intermediateValue[comparisonValue120 | (uint(sumValue36 >= 16.0) << 5u)];
                            comparisonValue16 = ((((comparisonValue120 | (uint(sumValue36 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue120 & 31u))) == 0u;
                            uint sampledTextureValue26;
                            if (comparisonValue16)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue17 + 4096u)).x & (1u << (comparisonValue15 & 31u))) == 0u)
                                {
                                    intermediateValue71 = 0.0;
                                    intermediateValue73 = 0.0;
                                    intermediateValue75 = 0.0;
                                    break;
                                }
                                sampledTextureValue26 = ((((uint(sumValue47 - (floor(sumValue47 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue48 - (floor(sumValue48 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue49 - (floor(sumValue49 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue17 + 4097u) + comparisonValue15)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue26 = ((((uint(sumValue34) << 8u) & 3840u) | (uint(sumValue35) & 15u)) | ((uint(sumValue36) << 4u) & 240u)) + bitwiseValue17;
                            }
                            uvec4 sampledTextureValue101 = texelFetch(voxelBuffer, int(sampledTextureValue26));
                            uint scalarValue59 = sampledTextureValue101.x;
                            if (scalarValue59 == 0u)
                            {
                                intermediateValue71 = 0.0;
                                intermediateValue73 = 0.0;
                                intermediateValue75 = 0.0;
                                break;
                            }
                            float bitwiseValue27 = float(scalarValue59 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue71 = bitwiseValue27 * float(scalarValue59 & 255u);
                            intermediateValue73 = bitwiseValue27 * float((scalarValue59 >> 8u) & 255u);
                            intermediateValue75 = bitwiseValue27 * float((scalarValue59 >> 16u) & 255u);
                            break;
                        }
                        float sumValue157 = sumValue27 + productValue223;
                        float sumValue158 = sumValue28 + productValue224;
                        float sumValue159 = sumValue29 + productValue225;
                        uint comparisonValue121 = ((((uint(sumValue27 >= 16.0) << 1u) | uint(sumValue27 < 0.0)) | (uint(sumValue28 < 0.0) << 2u)) | (uint(sumValue28 >= 16.0) << 3u)) | (uint(sumValue29 < 0.0) << 4u);
                        uint comparisonValue122 = comparisonValue121 | (uint(sumValue29 >= 16.0) << 5u);
                        uint sampledTextureValue36;
                        if ((((comparisonValue122 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue121 & 31u))) == 0u)
                        {
                            if ((texelFetch(voxelBuffer, int(bitwiseValue17 + 4096u)).x & (1u << (intermediateValue[comparisonValue122] & 31u))) == 0u)
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
                                intermediateValue76 = 0.0;
                                intermediateValue77 = 0.0;
                                intermediateValue78 = 0.0;
                                break;
                            }
                            sampledTextureValue36 = ((((uint(sumValue157 - (floor(sumValue157 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue158 - (floor(sumValue158 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue159 - (floor(sumValue159 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue17 + 4097u) + intermediateValue[comparisonValue122])).x >> 2u);
                        }
                        else
                        {
                            sampledTextureValue36 = ((((uint(sumValue27) << 8u) & 3840u) | (uint(sumValue28) & 15u)) | ((uint(sumValue29) << 4u) & 240u)) + bitwiseValue17;
                        }
                        uvec4 sampledTextureValue140 = texelFetch(voxelBuffer, int(sampledTextureValue36));
                        uint scalarValue99 = sampledTextureValue140.x;
                        if (scalarValue99 == 0u)
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
                            intermediateValue76 = 0.0;
                            intermediateValue77 = 0.0;
                            intermediateValue78 = 0.0;
                            break;
                        }
                        float bitwiseValue53 = float(scalarValue99 >> 24u) * 9.2272217443678528070449829101562e-05;
                        intermediateValue61 = intermediateValue47;
                        intermediateValue62 = intermediateValue48;
                        intermediateValue63 = intermediateValue49;
                        intermediateValue64 = intermediateValue65;
                        intermediateValue66 = intermediateValue67;
                        intermediateValue68 = intermediateValue69;
                        intermediateValue70 = intermediateValue71;
                        intermediateValue72 = intermediateValue73;
                        intermediateValue74 = intermediateValue75;
                        intermediateValue76 = bitwiseValue53 * float(scalarValue99 & 255u);
                        intermediateValue77 = bitwiseValue53 * float((scalarValue99 >> 8u) & 255u);
                        intermediateValue78 = bitwiseValue53 * float((scalarValue99 >> 16u) & 255u);
                        break;
                    }
                }
                productValue57 = (((intermediateValue64 * sumValue25) + (intermediateValue61 * sumValue24)) + (intermediateValue70 * sumValue26)) + (intermediateValue76 * intermediateValue25);
                productValue58 = (((intermediateValue66 * sumValue25) + (intermediateValue62 * sumValue24)) + (intermediateValue72 * sumValue26)) + (intermediateValue77 * intermediateValue25);
                productValue59 = (((intermediateValue68 * sumValue25) + (intermediateValue63 * sumValue24)) + (intermediateValue74 * sumValue26)) + (intermediateValue78 * intermediateValue25);
            }
            else
            {
                productValue57 = 0.0;
                productValue58 = 0.0;
                productValue59 = 0.0;
            }
            float productValue232 = computeVectorConstants0.packedValues[46u].x * computeVectorConstants0.packedValues[14u].w;
            productValue35 = productValue232 * productValue57;
            productValue36 = productValue232 * productValue58;
            productValue37 = productValue232 * productValue59;
        }
        else
        {
            productValue35 = productValue167 * computeVectorConstants0.packedValues[14u].x;
            productValue36 = productValue167 * computeVectorConstants0.packedValues[14u].y;
            productValue37 = productValue167 * computeVectorConstants0.packedValues[14u].z;
        }
        float productValue233 = computeVectorConstants0.packedValues[44u].w * intermediateValue12;
        float productValue234 = computeVectorConstants0.packedValues[30u].w * 0.079577468335628509521484375;
        float productValue235 = (spvNMax((productValue233 * computeVectorConstants0.packedValues[44u].x) + productValue35, computeVectorConstants0.packedValues[34u].x) * productValue220) * productValue234;
        float productValue236 = (spvNMax((productValue233 * computeVectorConstants0.packedValues[44u].y) + productValue36, computeVectorConstants0.packedValues[34u].x) * productValue221) * productValue234;
        float productValue237 = (spvNMax((productValue233 * computeVectorConstants0.packedValues[44u].z) + productValue37, computeVectorConstants0.packedValues[34u].x) * productValue222) * productValue234;
        float quotientValue53 = (-0.0) - (sumValue136 / nonlinearValue9);
        float quotientValue54 = (-0.0) - (sumValue137 / nonlinearValue9);
        float quotientValue55 = (-0.0) - (sumValue138 / nonlinearValue9);
        float productValue43;
        float productValue44;
        float productValue45;
        if ((computeVectorConstants0.packedValues[31u].y == 0.0) || (abs(intermediateValue12) > 9.9999997473787516355514526367188e-05))
        {
            float multiplyAddValue8 = fma(computeVectorConstants0.packedValues[8u].x, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].x, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].x, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].x)));
            float multiplyAddValue9 = fma(computeVectorConstants0.packedValues[8u].y, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].y, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].y, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].y)));
            float multiplyAddValue10 = fma(computeVectorConstants0.packedValues[8u].z, computeVectorConstants0.packedValues[13u].w, fma(computeVectorConstants0.packedValues[7u].z, computeVectorConstants0.packedValues[13u].z, fma(computeVectorConstants0.packedValues[6u].z, computeVectorConstants0.packedValues[13u].y, computeVectorConstants0.packedValues[13u].x * computeVectorConstants0.packedValues[5u].z)));
            float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), vec3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
            float dotProductValue4 = (((dot(vec3(quotientValue53, quotientValue54, quotientValue55), vec3(inverseLengthValue * multiplyAddValue8, inverseLengthValue * multiplyAddValue9, inverseLengthValue * multiplyAddValue10)) * 2.0) + productValue219) * productValue219) + 1.0;
            float sampledTextureValue141 = computeVectorConstants0.packedValues[29u].w * ((((1.0 - (productValue219 * productValue219)) * 0.079577468335628509521484375) / (dotProductValue4 * sqrt(dotProductValue4))) * texelFetch(cascadedShadowBufferTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), int(0u)).x);
            productValue43 = ((sampledTextureValue141 * productValue220) * computeVectorConstants0.packedValues[29u].x) + productValue235;
            productValue44 = ((sampledTextureValue141 * productValue221) * computeVectorConstants0.packedValues[29u].y) + productValue236;
            productValue45 = ((sampledTextureValue141 * productValue222) * computeVectorConstants0.packedValues[29u].z) + productValue237;
        }
        else
        {
            productValue43 = productValue235;
            productValue44 = productValue236;
            productValue45 = productValue237;
        }
        float productValue48;
        float productValue49;
        float productValue50;
        if ((computeVectorConstants0.packedValues[48u].y != 0.0) && (computeVectorConstants0.packedValues[17u].z != 0.0))
        {
            float sumValue160 = 1.0 - computeVectorConstants0.packedValues[46u].x;
            float sumValue161 = (-0.0) - sumValue138;
            float productValue238 = computeVectorConstants0.packedValues[25u].z * sumValue161;
            float productValue239 = productValue238 * computeVectorConstants0.packedValues[25u].w;
            float intermediateValue28;
            if (computeVectorConstants0.packedValues[25u].x > sumValue161)
            {
                intermediateValue28 = 0.0;
            }
            else
            {
                float branchMergedValue5;
                if (computeVectorConstants0.packedValues[25u].y > sumValue161)
                {
                    branchMergedValue5 = 1.0;
                }
                else
                {
                    branchMergedValue5 = spvNMin(floor(spvNMin(spvNMax((log2(sumValue161) - computeVectorConstants0.packedValues[37u].z) * computeVectorConstants0.packedValues[37u].x, 0.0), 1.0) * (computeVectorConstants0.packedValues[28u].z + (-2.0))) + 2.0, computeVectorConstants0.packedValues[28u].z + (-1.0));
                }
                intermediateValue28 = branchMergedValue5;
            }
            float quotientValue56 = spvNMin(floor(spvNMin(spvNMax((productValue239 + sumValue136) / (productValue239 * 2.0), 0.0), 1.0) * computeVectorConstants0.packedValues[28u].x), computeVectorConstants0.packedValues[28u].x + (-1.0));
            float quotientValue57 = spvNMin(floor(spvNMin(spvNMax((productValue238 + sumValue137) / (productValue238 * 2.0), 0.0), 1.0) * computeVectorConstants0.packedValues[28u].y), computeVectorConstants0.packedValues[28u].y + (-1.0));
            uint intermediateValue30;
            bool intermediateValue32;
            uint intermediateValue33;
            if ((intermediateValue28 >= computeVectorConstants0.packedValues[28u].z) || ((quotientValue57 >= computeVectorConstants0.packedValues[28u].y) || ((quotientValue56 >= computeVectorConstants0.packedValues[28u].x) || ((intermediateValue28 < 0.0) || ((quotientValue56 < 0.0) || (quotientValue57 < 0.0))))))
            {
                intermediateValue30 = intermediateValue31;
                intermediateValue32 = false;
                intermediateValue33 = 0u;
            }
            else
            {
                uint scalarValue100 = uint(int(computeVectorConstants0.packedValues[28u].w));
                uint productValue240 = uint(int(((quotientValue57 + (intermediateValue28 * computeVectorConstants0.packedValues[28u].y)) * computeVectorConstants0.packedValues[28u].x) + quotientValue56)) * scalarValue100;
                intermediateValue30 = productValue240;
                intermediateValue32 = true;
                intermediateValue33 = productValue240 + scalarValue100;
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
                float scalarValue15 = 0.0;
                float scalarValue16 = 0.0;
                float scalarValue17 = 0.0;
                uint scalarValue101 = intermediateValue30;
                uint sampledTextureValue21;
                for (;;)
                {
                    sampledTextureValue21 = uint(int(uintBitsToFloat(texelFetch(zLightLookupArray, int(scalarValue101)).x)));
                    if (int(sampledTextureValue21) < int(0u))
                    {
                        intermediateValue39 = scalarValue15;
                        intermediateValue41 = scalarValue16;
                        intermediateValue43 = scalarValue17;
                        break;
                    }
                    else
                    {
                        uint productValue241 = sampledTextureValue21 * 32u;
                        vec4 sampledTextureValue142 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue241)).x, texelFetch(zLights, int(productValue241 + 1u)).x, texelFetch(zLights, int(productValue241 + 2u)).x, texelFetch(zLights, int(productValue241 + 3u)).x));
                        intermediateValue58 = sampledTextureValue142.x;
                        intermediateValue59 = sampledTextureValue142.y;
                        intermediateValue60 = sampledTextureValue142.z;
                        float sumValue162 = intermediateValue58 - multiplyAddValue165;
                        float sumValue163 = intermediateValue59 - multiplyAddValue166;
                        float sumValue164 = intermediateValue60 - multiplyAddValue167;
                        float productValue66;
                        if (computeVectorConstants0.packedValues[15u].x > 0.0)
                        {
                            float sumValue165 = (abs(sumValue163) + abs(sumValue162)) + abs(sumValue164);
                            productValue66 = sumValue165 * sumValue165;
                        }
                        else
                        {
                            productValue66 = dot(vec3(sumValue162, sumValue163, sumValue164), vec3(sumValue162, sumValue163, sumValue164));
                        }
                        float scalarValue102 = sampledTextureValue142.w;
                        float productValue242 = scalarValue102 * scalarValue102;
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        if (!(productValue66 >= productValue242))
                        {
                            float intermediateValue86;
                            if (computeVectorConstants0.packedValues[17u].z != 0.0)
                            {
                                uint productValue243 = (sampledTextureValue21 * 32u) + 8u;
                                vec4 sampledTextureValue143 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue243)).x, texelFetch(zLights, int(productValue243 + 1u)).x, texelFetch(zLights, int(productValue243 + 2u)).x, texelFetch(zLights, int(productValue243 + 3u)).x));
                                uint productValue244 = (sampledTextureValue21 * 32u) + 12u;
                                vec4 sampledTextureValue144 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue244)).x, texelFetch(zLights, int(productValue244 + 1u)).x, texelFetch(zLights, int(productValue244 + 2u)).x, texelFetch(zLights, int(productValue244 + 3u)).x));
                                uint productValue245 = (sampledTextureValue21 * 32u) + 16u;
                                vec4 sampledTextureValue145 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue245)).x, texelFetch(zLights, int(productValue245 + 1u)).x, texelFetch(zLights, int(productValue245 + 2u)).x, texelFetch(zLights, int(productValue245 + 3u)).x));
                                uint productValue246 = (sampledTextureValue21 * 32u) + 20u;
                                vec4 sampledTextureValue146 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue246)).x, texelFetch(zLights, int(productValue246 + 1u)).x, texelFetch(zLights, int(productValue246 + 2u)).x, texelFetch(zLights, int(productValue246 + 3u)).x));
                                uint productValue247 = (sampledTextureValue21 * 32u) + 24u;
                                vec4 sampledTextureValue147 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue247)).x, texelFetch(zLights, int(productValue247 + 1u)).x, texelFetch(zLights, int(productValue247 + 2u)).x, texelFetch(zLights, int(productValue247 + 3u)).x));
                                uint productValue248 = (sampledTextureValue21 * 32u) + 28u;
                                vec4 sampledTextureValue148 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue248)).x, texelFetch(zLights, int(productValue248 + 1u)).x, texelFetch(zLights, int(productValue248 + 2u)).x, texelFetch(zLights, int(productValue248 + 3u)).x));
                                float sumValue166 = multiplyAddValue165 - intermediateValue58;
                                float sumValue167 = multiplyAddValue166 - intermediateValue59;
                                float sumValue168 = multiplyAddValue167 - intermediateValue60;
                                float scalarValue103 = abs(sumValue166);
                                float scalarValue104 = abs(sumValue167);
                                float scalarValue105 = abs(sumValue168);
                                uint comparisonValue19;
                                if ((scalarValue103 >= scalarValue104) && (scalarValue103 >= scalarValue105))
                                {
                                    comparisonValue19 = uint(!(sumValue166 >= 0.0));
                                }
                                else
                                {
                                    uint branchMergedValue8;
                                    if (!(scalarValue104 >= scalarValue105))
                                    {
                                        branchMergedValue8 = (sumValue168 >= 0.0) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue8 = (sumValue167 >= 0.0) ? 2u : 3u;
                                    }
                                    comparisonValue19 = branchMergedValue8;
                                }
                                float sumValue169 = (-0.0) - sumValue166;
                                float intermediateValue91;
                                float intermediateValue92;
                                float intermediateValue93;
                                float intermediateValue94;
                                float sumValue58;
                                float intermediateValue95;
                                float intermediateValue96;
                                if (comparisonValue19 == 1u)
                                {
                                    intermediateValue91 = sampledTextureValue144.x;
                                    intermediateValue92 = sampledTextureValue144.y;
                                    intermediateValue93 = sampledTextureValue144.z;
                                    intermediateValue94 = sampledTextureValue144.w;
                                    sumValue58 = (-0.0) - sumValue168;
                                    intermediateValue95 = sumValue167;
                                    intermediateValue96 = sumValue166;
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
                                        branchMergedValue12 = sampledTextureValue145.x;
                                        branchMergedValue22 = (-0.0) - sumValue168;
                                        branchMergedValue23 = (-0.0) - sumValue167;
                                        branchMergedValue24 = sumValue169;
                                        branchMergedValue25 = sampledTextureValue145.w;
                                        branchMergedValue26 = sampledTextureValue145.z;
                                        branchMergedValue27 = sampledTextureValue145.y;
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
                                            branchMergedValue30 = sampledTextureValue146.x;
                                            branchMergedValue31 = sumValue168;
                                            branchMergedValue32 = sumValue167;
                                            branchMergedValue33 = sumValue169;
                                            branchMergedValue34 = sampledTextureValue146.w;
                                            branchMergedValue35 = sampledTextureValue146.z;
                                            branchMergedValue36 = sampledTextureValue146.y;
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
                                                branchMergedValue37 = sampledTextureValue147.x;
                                                branchMergedValue38 = sumValue167;
                                                branchMergedValue39 = (-0.0) - sumValue168;
                                                branchMergedValue40 = sumValue169;
                                                branchMergedValue41 = sampledTextureValue147.w;
                                                branchMergedValue42 = sampledTextureValue147.z;
                                                branchMergedValue43 = sampledTextureValue147.y;
                                            }
                                            else
                                            {
                                                bool comparisonValue123 = comparisonValue19 == 5u;
                                                branchMergedValue37 = comparisonValue123 ? sampledTextureValue148.x : sampledTextureValue143.x;
                                                branchMergedValue38 = sumValue167;
                                                branchMergedValue39 = comparisonValue123 ? sumValue168 : sumValue169;
                                                branchMergedValue40 = comparisonValue123 ? sumValue166 : sumValue168;
                                                branchMergedValue41 = comparisonValue123 ? sampledTextureValue148.w : sampledTextureValue143.w;
                                                branchMergedValue42 = comparisonValue123 ? sampledTextureValue148.z : sampledTextureValue143.z;
                                                branchMergedValue43 = comparisonValue123 ? sampledTextureValue148.y : sampledTextureValue143.y;
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
                                if ((intermediateValue93 == 0.0) && (intermediateValue94 == 0.0))
                                {
                                    branchMergedValue7 = 0.0;
                                }
                                else
                                {
                                    float multiplyAddValue171 = fma(computeVectorConstants0.packedValues[40u].w, intermediateValue96, fma(computeVectorConstants0.packedValues[39u].w, intermediateValue95, computeVectorConstants0.packedValues[38u].w * sumValue58)) + computeVectorConstants0.packedValues[41u].w;
                                    float quotientValue58 = 0.5 / computeVectorConstants0.packedValues[42u].x;
                                    float quotientValue59 = 0.5 / computeVectorConstants0.packedValues[42u].y;
                                    float sumValue170 = intermediateValue93 - intermediateValue91;
                                    float sumValue171 = intermediateValue94 - intermediateValue92;
                                    float productValue249 = computeVectorConstants0.packedValues[42u].x * sumValue170;
                                    float productValue250 = computeVectorConstants0.packedValues[42u].y * sumValue171;
                                    float sampledTextureValue149 = float(textureLod(sampler2D(pointLightShadowTextureAtlasTexture, pointLightShadowTextureAtlasSampler), vec2(spvNMin(spvNMax((((floor(productValue249 * ((((fma(computeVectorConstants0.packedValues[40u].x, intermediateValue96, fma(computeVectorConstants0.packedValues[39u].x, intermediateValue95, computeVectorConstants0.packedValues[38u].x * sumValue58)) + computeVectorConstants0.packedValues[41u].x) / multiplyAddValue171) * 0.5) + 0.5)) + 0.5) / productValue249) * sumValue170) + intermediateValue91, quotientValue58 + intermediateValue91), intermediateValue93 - quotientValue58), spvNMin(spvNMax((((floor(productValue250 * (0.5 - (((fma(computeVectorConstants0.packedValues[40u].y, intermediateValue96, fma(computeVectorConstants0.packedValues[39u].y, intermediateValue95, computeVectorConstants0.packedValues[38u].y * sumValue58)) + computeVectorConstants0.packedValues[41u].y) / multiplyAddValue171) * 0.5))) + 0.5) / productValue250) * sumValue171) + intermediateValue92, quotientValue59 + intermediateValue92), intermediateValue94 - quotientValue59)), 0.0).x >= ((fma(computeVectorConstants0.packedValues[40u].z, intermediateValue96, fma(computeVectorConstants0.packedValues[39u].z, intermediateValue95, computeVectorConstants0.packedValues[38u].z * sumValue58)) + computeVectorConstants0.packedValues[41u].z) / multiplyAddValue171));
                                    branchMergedValue7 = sampledTextureValue149;
                                }
                                intermediateValue86 = branchMergedValue7;
                            }
                            else
                            {
                                intermediateValue86 = 1.0;
                            }
                            uint productValue251 = (sampledTextureValue21 * 32u) + 4u;
                            vec4 sampledTextureValue150 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue251)).x, texelFetch(zLights, int(productValue251 + 1u)).x, texelFetch(zLights, int(productValue251 + 2u)).x, texelFetch(zLights, int(productValue251 + 3u)).x));
                            float quotientValue60 = productValue66 / (productValue242 + 9.9999997473787516355514526367188e-05);
                            float productValue252 = spvNClamp(1.0 - (quotientValue60 * quotientValue60), 0.0, 1.0);
                            float quotientValue61 = (productValue252 * productValue252) * (1.0 / spvNMax(productValue66, 0.100000001490116119384765625));
                            float productValue76;
                            if (computeVectorConstants0.packedValues[36u].x > 0.0)
                            {
                                float quotientValue62 = spvNClamp(((1.0 - quotientValue61) - computeVectorConstants0.packedValues[35u].x) / (computeVectorConstants0.packedValues[35u].y - computeVectorConstants0.packedValues[35u].x), 0.0, 1.0);
                                productValue76 = spvNClamp((((quotientValue62 * quotientValue62) * computeVectorConstants0.packedValues[35u].z) * (3.0 - (quotientValue62 * 2.0))) + computeVectorConstants0.packedValues[35u].w, 0.0, 1.0) * quotientValue61;
                            }
                            else
                            {
                                productValue76 = quotientValue61;
                            }
                            float productValue253 = productValue76 * sampledTextureValue150.w;
                            branchMergedValue = productValue253 * sampledTextureValue150.y;
                            branchMergedValue1 = intermediateValue86;
                            branchMergedValue2 = productValue253 * sampledTextureValue150.z;
                            branchMergedValue3 = productValue253 * sampledTextureValue150.x;
                        }
                        else
                        {
                            branchMergedValue = 0.0;
                            branchMergedValue1 = 1.0;
                            branchMergedValue2 = 0.0;
                            branchMergedValue3 = 0.0;
                        }
                        intermediateValue83 = branchMergedValue;
                        intermediateValue85 = branchMergedValue1;
                        intermediateValue84 = branchMergedValue2;
                        intermediateValue82 = branchMergedValue3;
                        float multiplyAddValue172 = fma(computeVectorConstants0.packedValues[7u].x, intermediateValue60, fma(computeVectorConstants0.packedValues[6u].x, intermediateValue59, intermediateValue58 * computeVectorConstants0.packedValues[5u].x)) - multiplyAddValue168;
                        float multiplyAddValue173 = fma(computeVectorConstants0.packedValues[7u].y, intermediateValue60, fma(computeVectorConstants0.packedValues[6u].y, intermediateValue59, intermediateValue58 * computeVectorConstants0.packedValues[5u].y)) - multiplyAddValue169;
                        float multiplyAddValue174 = fma(computeVectorConstants0.packedValues[7u].z, intermediateValue60, fma(computeVectorConstants0.packedValues[6u].z, intermediateValue59, intermediateValue58 * computeVectorConstants0.packedValues[5u].z)) - multiplyAddValue170;
                        float inverseLengthValue4 = inversesqrt(dot(vec3(multiplyAddValue172, multiplyAddValue173, multiplyAddValue174), vec3(multiplyAddValue172, multiplyAddValue173, multiplyAddValue174)));
                        float dotProductValue5 = (((dot(vec3(quotientValue53, quotientValue54, quotientValue55), vec3(inverseLengthValue4 * multiplyAddValue172, inverseLengthValue4 * multiplyAddValue173, inverseLengthValue4 * multiplyAddValue174)) * 2.0) + productValue219) * productValue219) + 1.0;
                        float nonlinearValue10 = (((1.0 - (productValue219 * productValue219)) * 0.079577468335628509521484375) / (dotProductValue5 * sqrt(dotProductValue5))) * intermediateValue85;
                        float productValue254 = ((intermediateValue82 * productValue220) * nonlinearValue10) + scalarValue15;
                        float productValue255 = ((intermediateValue83 * productValue221) * nonlinearValue10) + scalarValue16;
                        float productValue256 = ((intermediateValue84 * productValue222) * nonlinearValue10) + scalarValue17;
                        uint sumValue172 = scalarValue101 + 1u;
                        if (int(sumValue172) < int(intermediateValue33))
                        {
                            scalarValue15 = productValue254;
                            scalarValue16 = productValue255;
                            scalarValue17 = productValue256;
                            scalarValue101 = sumValue172;
                            continue;
                        }
                        else
                        {
                            intermediateValue39 = productValue254;
                            intermediateValue41 = productValue255;
                            intermediateValue43 = productValue256;
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
                intermediateValue38 = 0.0;
                intermediateValue40 = 0.0;
                intermediateValue42 = 0.0;
            }
            productValue48 = (intermediateValue38 * sumValue160) + productValue43;
            productValue49 = (intermediateValue40 * sumValue160) + productValue44;
            productValue50 = (intermediateValue42 * sumValue160) + productValue45;
        }
        else
        {
            productValue48 = productValue43;
            productValue49 = productValue44;
            productValue50 = productValue45;
        }
        imageStore(scatteringBufferOutTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(productValue48, productValue49, productValue50, productValue218 - (quotientValue52 * productValue218)));
#endif
    }
}
