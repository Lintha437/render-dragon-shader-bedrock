#version 460
#extension GL_EXT_nonuniform_qualifier : require
// UAV binding numbers use an offset of 10000 to keep descriptor classes distinct.
#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
#extension GL_EXT_shader_16bit_storage : require
#if defined(GL_AMD_gpu_shader_half_float)
#extension GL_AMD_gpu_shader_half_float : require
#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
#else
#error No extension available for FP16.
#endif
#extension GL_EXT_ray_query : require
#extension GL_EXT_ray_flags_primitive_culling : require
#if defined(GL_EXT_control_flow_attributes)
#extension GL_EXT_control_flow_attributes : require
#define SPIRV_CROSS_FLATTEN [[flatten]]
#define SPIRV_CROSS_BRANCH [[dont_flatten]]
#define SPIRV_CROSS_UNROLL [[unroll]]
#define SPIRV_CROSS_LOOP [[dont_unroll]]
#else
#define SPIRV_CROSS_FLATTEN
#define SPIRV_CROSS_BRANCH
#define SPIRV_CROSS_UNROLL
#define SPIRV_CROSS_LOOP
#endif
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
layout(primitive_culling);
layout(local_size_x = 4, local_size_y = 8, local_size_z = 1) in;

float intermediateValue268;

layout(set = 0, binding = 1, std430) restrict readonly buffer objectInstancesSSBO
{
    uint16_t packedValues[];
} objectInstances;

layout(set = 0, binding = 1, std430) restrict readonly buffer objectInstances_1
{
    uint packedValues[];
} objectInstances_2;

layout(set = 0, binding = 19, std430) restrict readonly buffer inputIncidentLightSSBO
{
    uint packedValues[];
} inputIncidentLight;

layout(set = 0, binding = 35, std430) restrict readonly buffer pbrTextureDataBufferSSBO
{
    uint packedValues[];
} pbrTextureDataBuffer;

layout(set = 0, binding = 35, std430) restrict readonly buffer pbrTextureDataBuffer_1
{
    uvec2 packedValues[];
} pbrTextureDataBuffer_2;

layout(set = 2, binding = 0, std430) restrict readonly buffer vertexBuffersSSBO
{
    uint16_t packedValues[];
} vertexBuffers[4096];

layout(set = 2, binding = 0, std430) restrict readonly buffer vertexBuffers_1
{
    uint packedValues[];
} vertexBuffers_2[4096];

layout(set = 1, binding = 10000, std430) readonly buffer vertexIrradianceCacheSSBO
{
    uint16_t packedValues[];
} vertexIrradianceCache[4096];

layout(set = 2, binding = 10000, std430) readonly buffer faceIrradianceCacheSSBO
{
    uint16_t packedValues[];
} faceIrradianceCache[4096];

layout(set = 10, binding = 10000, std430) readonly buffer faceDataBuffersRWSSBO
{
    uint16_t packedValues[];
} faceDataBuffersRW[4096];

layout(set = 10, binding = 10000, std430) readonly buffer faceDataBuffersRW_1
{
    uint packedValues[];
} faceDataBuffersRW_2[4096];

layout(set = 11, binding = 10000, std430) readonly buffer faceUvBuffersRWSSBO
{
    uvec4 packedValues[];
} faceUvBuffersRW[4096];

layout(set = 0, binding = 0, std140) uniform ViewCBUBO
{
    vec4 packedValues[100];
} ViewCB;

layout(set = 0, binding = 2, std140) uniform RootConstantsUBO
{
    vec4 packedValues[1];
} RootConstants;

layout(set = 0, binding = 0) uniform accelerationStructureEXT SceneBVH;
layout(set = 0, binding = 14) uniform texture2D inputBufferPrimaryPathLength;
layout(set = 0, binding = 15) uniform texture2D inputBufferNormal;
layout(set = 0, binding = 43) uniform texture2D inputGeometryNormal;
layout(set = 0, binding = 45) uniform texture2D inputPrimaryWorldPosition;
layout(set = 0, binding = 58) uniform texture2DArray blueNoiseTexture;
layout(set = 0, binding = 59) uniform texture2DArray skyTexture;
layout(set = 0, binding = 60) uniform texture2DArray causticsTexture;
layout(set = 0, binding = 61) uniform texture2D wibblyTexture;
layout(set = 6, binding = 0) uniform texture2D textures[4096];
layout(set = 0, binding = 10004, r32f) uniform image2D outputBufferEmissiveAndLinearRoughness;
layout(set = 0, binding = 10005) uniform writeonly image2D outputBufferIndirectDiffuse;
layout(set = 0, binding = 10014, r32f) uniform image2D outputBufferDebug;
layout(set = 0, binding = 10028) uniform writeonly image2D outputBufferIndirectDiffuseChroma;
layout(set = 0, binding = 0) uniform sampler defaultSampler;
layout(set = 0, binding = 1) uniform sampler linearSampler;
layout(set = 0, binding = 2) uniform sampler linearWrapSampler;

rayQueryEXT intermediateValue28;
rayQueryEXT intermediateValue30;
rayQueryEXT intermediateValue44;
rayQueryEXT intermediateValue55;
rayQueryEXT intermediateValue292;
rayQueryEXT intermediateValue300;
rayQueryEXT intermediateValue324;
rayQueryEXT intermediateValue326;
rayQueryEXT intermediateValue338;
rayQueryEXT intermediateValue340;
rayQueryEXT intermediateValue376;
rayQueryEXT intermediateValue388;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

uint UDiv(uint num, uint den)
{
    uint intermediateValue5;
    SPIRV_CROSS_FLATTEN
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
    SPIRV_CROSS_FLATTEN
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

void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
    uint intermediateValue4 = reinterpretedBits.z;
    uint bitwiseValue = gl_WorkGroupID.y >> 4u;
    uint bitwiseValue1 = ((intermediateValue4 & 1023u) * (gl_WorkGroupID.y & 15u)) + gl_WorkGroupID.x;
    uint comparisonValue = (bitwiseValue == ((intermediateValue4 >> 14u) & 63u)) ? ((intermediateValue4 >> 10u) & 15u) : 16u;
    uint bitwiseValue2 = (UDiv(bitwiseValue1, comparisonValue) << 2u) + gl_LocalInvocationID.x;
    uint bitwiseValue3 = ((UMod(bitwiseValue1, comparisonValue) + (bitwiseValue << 4u)) << 3u) + gl_LocalInvocationID.y;
    bool reinterpretedBits1 = floatBitsToUint(ViewCB.packedValues[96u]).x != 0u;
    float reinterpretedBits2 = uintBitsToFloat(inputIncidentLight.packedValues[0u]);
    vec4 sampledTextureValue = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
    float intermediateValue7 = sampledTextureValue.x;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if (intermediateValue7 == 65504.0)
    {
        intermediateValue8 = 0.0;
        intermediateValue9 = 0.0;
        intermediateValue10 = 0.0;
        intermediateValue12 = 0.0;
        intermediateValue13 = 0.0;
        intermediateValue14 = 0.0;
        intermediateValue15 = 0.0;
    }
    else
    {
        vec4 sampledTextureValue1 = texelFetch(inputBufferNormal, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float intermediateValue16 = sampledTextureValue1.x;
        float intermediateValue17 = sampledTextureValue1.y;
        precise float sumValue = 1.0 - abs(intermediateValue16);
        float intermediateValue18 = abs(intermediateValue17);
        precise float sumValue1 = sumValue - intermediateValue18;
        bool intermediateValue19 = sumValue1 < 0.0;
        precise float sumValue2 = 1.0 - intermediateValue18;
        precise float comparisonValue2 = ((intermediateValue16 >= 0.0) ? 1.0 : (-1.0)) * sumValue2;
        precise float comparisonValue3 = sumValue * ((intermediateValue17 >= 0.0) ? 1.0 : (-1.0));
        float comparisonValue4 = intermediateValue19 ? comparisonValue2 : intermediateValue16;
        float comparisonValue5 = intermediateValue19 ? comparisonValue3 : intermediateValue17;
        float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue4, comparisonValue5, sumValue1), vec3(comparisonValue4, comparisonValue5, sumValue1)));
        precise float productValue2 = inverseLengthValue * comparisonValue4;
        precise float productValue3 = inverseLengthValue * comparisonValue5;
        precise float productValue4 = sumValue1 * inverseLengthValue;
        float comparisonValue6 = ((productValue4 != 0.0) || ((productValue2 != 0.0) || (productValue3 != 0.0))) ? productValue4 : 1.0;
        float inverseLengthValue1 = inversesqrt(dot(vec3(productValue2, productValue3, comparisonValue6), vec3(productValue2, productValue3, comparisonValue6)));
        precise float productValue5 = productValue3 * inverseLengthValue1;
        vec4 sampledTextureValue2 = texelFetch(inputGeometryNormal, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float intermediateValue20 = sampledTextureValue2.x;
        float intermediateValue21 = sampledTextureValue2.y;
        precise float sumValue3 = 1.0 - abs(intermediateValue20);
        float intermediateValue22 = abs(intermediateValue21);
        precise float sumValue4 = sumValue3 - intermediateValue22;
        bool intermediateValue23 = sumValue4 < 0.0;
        precise float sumValue5 = 1.0 - intermediateValue22;
        precise float comparisonValue7 = ((intermediateValue20 >= 0.0) ? 1.0 : (-1.0)) * sumValue5;
        precise float comparisonValue8 = sumValue3 * ((intermediateValue21 >= 0.0) ? 1.0 : (-1.0));
        float comparisonValue9 = intermediateValue23 ? comparisonValue7 : intermediateValue20;
        float comparisonValue10 = intermediateValue23 ? comparisonValue8 : intermediateValue21;
        float inverseLengthValue2 = inversesqrt(dot(vec3(comparisonValue9, comparisonValue10, sumValue4), vec3(comparisonValue9, comparisonValue10, sumValue4)));
        precise float productValue6 = inverseLengthValue2 * comparisonValue10;
        vec4 sampledTextureValue3 = texelFetch(inputPrimaryWorldPosition, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float intermediateValue24 = sampledTextureValue3.y;
        imageStore(outputBufferEmissiveAndLinearRoughness, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(imageLoad(outputBufferEmissiveAndLinearRoughness, ivec2(uvec2(bitwiseValue2, bitwiseValue3)))));
        uvec4 reinterpretedBits7 = floatBitsToUint(ViewCB.packedValues[84u]);
        uint intermediateValue25 = reinterpretedBits7.z;
        precise float productValue7 = productValue2 * inverseLengthValue1;
        precise float productValue8 = inverseLengthValue1 * comparisonValue6;
        precise float productValue9 = inverseLengthValue2 * comparisonValue9;
        precise float productValue10 = sumValue4 * inverseLengthValue2;
        float intermediateValue26 = sampledTextureValue3.x;
        float intermediateValue27 = sampledTextureValue3.z;
        uint productValue11 = uint(int(productValue9 * 256.0));
        uint productValue12 = uint(int(productValue6 * 256.0));
        uint productValue13 = uint(int(productValue10 * 256.0));
        float reinterpretedBits8 = (abs(intermediateValue26) < 0.03125) ? (intermediateValue26 + (productValue9 * 1.52587890625e-05)) : uintBitsToFloat(((intermediateValue26 < 0.0) ? (-productValue11) : productValue11) + floatBitsToUint(intermediateValue26));
        float reinterpretedBits9 = (abs(intermediateValue24) < 0.03125) ? (intermediateValue24 + (productValue6 * 1.52587890625e-05)) : uintBitsToFloat(((intermediateValue24 < 0.0) ? (-productValue12) : productValue12) + floatBitsToUint(intermediateValue24));
        float reinterpretedBits10 = (abs(intermediateValue27) < 0.03125) ? (intermediateValue27 + (productValue10 * 1.52587890625e-05)) : uintBitsToFloat(((intermediateValue27 < 0.0) ? (-productValue13) : productValue13) + floatBitsToUint(intermediateValue27));
        vec4 sampledTextureValue4 = texelFetch(blueNoiseTexture, ivec3(uvec3(bitwiseValue2 & 255u, bitwiseValue3 & 255u, (intermediateValue25 >> 1u) & 127u)), int(0u));
        bool comparisonValue11 = (intermediateValue25 & 1u) == 0u;
        float comparisonValue12 = comparisonValue11 ? sampledTextureValue4.x : sampledTextureValue4.z;
        float nonlinearValue = sqrt(comparisonValue12);
        precise float comparisonValue13 = (comparisonValue11 ? sampledTextureValue4.y : sampledTextureValue4.w) * 6.283185482025146484375;
        precise float wavePhaseValue = nonlinearValue * cos(comparisonValue13);
        precise float wavePhaseValue1 = nonlinearValue * sin(comparisonValue13);
        precise float sumValue6 = 1.0 - comparisonValue12;
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
            bool dotProductValue = dot(vec3(0.847100675106048583984375, 0.2079117000102996826171875, 0.489073812961578369140625), vec3(productValue9, productValue6, productValue10)) > 0.949999988079071044921875;
            float comparisonValue14 = dotProductValue ? (-0.639436304569244384765625) : 0.847100675106048583984375;
            float comparisonValue15 = dotProductValue ? (-0.3907311260700225830078125) : 0.2079117000102996826171875;
            float comparisonValue16 = dotProductValue ? 0.6621558666229248046875 : 0.489073812961578369140625;
            precise float dotProductValue1 = dot(vec3(comparisonValue14, comparisonValue15, comparisonValue16), vec3(productValue9, productValue6, productValue10));
            precise float productValue14 = productValue9 * dotProductValue1;
            precise float productValue15 = productValue6 * dotProductValue1;
            precise float productValue16 = productValue10 * dotProductValue1;
            precise float sumValue7 = comparisonValue14 - productValue14;
            precise float sumValue8 = comparisonValue15 - productValue15;
            precise float sumValue9 = comparisonValue16 - productValue16;
            float inverseLengthValue3 = inversesqrt(dot(vec3(sumValue7, sumValue8, sumValue9), vec3(sumValue7, sumValue8, sumValue9)));
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
            rayQueryInitializeEXT(intermediateValue28, SceneBVH, 512u, 2u, vec3(reinterpretedBits8, reinterpretedBits9, reinterpretedBits10), 0.0, vec3(sumValue14, sumValue16, sumValue18), 10000.0);
            bool intermediateValue29 = rayQueryProceedEXT(intermediateValue28);
            if (intermediateValue29)
            {
                bool intermediateValue63;
                bool comparisonValue21;
                for (;;)
                {
                    uint intermediateValue35 = rayQueryGetIntersectionTypeEXT(intermediateValue28, bool(0u));
                    comparisonValue21 = intermediateValue35 == 0u;
                    if (comparisonValue21)
                    {
                        vec2 intermediateValue57 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue28, bool(0u));
                        vec2 intermediateValue58 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue28, bool(0u));
                        uint intermediateValue59 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue28, bool(0u));
                        uint intermediateValue60 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue28, bool(0u));
                        uint intermediateValue61 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue28, bool(0u));
                        uint productValue56 = (intermediateValue61 * 76u) + 58u;
                        uint productValue57 = (intermediateValue61 * 76u) + 61u;
                        precise float sumValue31 = 1.0 - intermediateValue57.x;
                        precise float sumValue32 = sumValue31 - intermediateValue58.y;
                        uint bitwiseValue6 = (objectInstances_2.packedValues[(intermediateValue61 * 38u) + 25u] >> 2u) + (intermediateValue59 >> 1u);
                        uint productValue58 = uint(objectInstances.packedValues[(intermediateValue61 * 76u) + 54u]) + 0u;
                        bool comparisonValue23 = (intermediateValue59 & 1u) == 0u;
                        uint comparisonValue24 = comparisonValue23 ? faceUvBuffersRW[nonuniformEXT(productValue58)].packedValues[bitwiseValue6].z : faceUvBuffersRW[nonuniformEXT(productValue58)].packedValues[bitwiseValue6].x;
                        uint comparisonValue25 = comparisonValue23 ? faceUvBuffersRW[nonuniformEXT(productValue58)].packedValues[bitwiseValue6].y : faceUvBuffersRW[nonuniformEXT(productValue58)].packedValues[bitwiseValue6].w;
                        uint comparisonValue26 = comparisonValue23 ? faceUvBuffersRW[nonuniformEXT(productValue58)].packedValues[bitwiseValue6].x : faceUvBuffersRW[nonuniformEXT(productValue58)].packedValues[bitwiseValue6].z;
                        bool intermediateValue62 = int16_t(objectInstances.packedValues[productValue57]) < int16_t(0us);
                        float intermediateValue95;
                        float intermediateValue96;
                        if (intermediateValue62)
                        {
                            uint bitwiseValue8 = comparisonValue26 >> 15u;
                            precise float bitwiseValue9 = float(bitwiseValue8 & 1u) * 2.0;
                            precise float sumValue35 = bitwiseValue9 + (-1.0);
                            precise float bitwiseValue10 = float(comparisonValue26 >> 31u) * 2.0;
                            precise float sumValue36 = bitwiseValue10 + (-1.0);
                            precise float bitwiseValue11 = float((comparisonValue26 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue12 = float(bitwiseValue8 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue62 = sumValue35 * 3.0517578125e-05;
                            precise float productValue63 = sumValue36 * 3.0517578125e-05;
                            precise float sumValue37 = bitwiseValue11 + productValue62;
                            precise float sumValue38 = bitwiseValue12 + productValue63;
                            intermediateValue95 = sumValue37;
                            intermediateValue96 = sumValue38;
                        }
                        else
                        {
                            precise float bitwiseValue13 = float(comparisonValue26 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue14 = float(comparisonValue26 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue64 = bitwiseValue13 * 16384.0;
                            precise float sumValue39 = productValue64 + 0.5;
                            precise float productValue65 = bitwiseValue14 * 16384.0;
                            precise float sumValue40 = productValue65 + 0.5;
                            precise float productValue66 = floor(sumValue39) * 6.103515625e-05;
                            precise float productValue67 = floor(sumValue40) * 6.103515625e-05;
                            intermediateValue95 = productValue66;
                            intermediateValue96 = productValue67;
                        }
                        precise float productValue84 = sumValue32 * intermediateValue95;
                        precise float productValue85 = sumValue32 * intermediateValue96;
                        precise float sumValue53 = productValue84 + 0.0;
                        precise float sumValue54 = productValue85 + 0.0;
                        float intermediateValue163;
                        float intermediateValue164;
                        if (intermediateValue62)
                        {
                            uint bitwiseValue28 = comparisonValue25 >> 15u;
                            precise float bitwiseValue29 = float(bitwiseValue28 & 1u) * 2.0;
                            precise float sumValue63 = bitwiseValue29 + (-1.0);
                            precise float bitwiseValue30 = float(comparisonValue25 >> 31u) * 2.0;
                            precise float sumValue64 = bitwiseValue30 + (-1.0);
                            precise float bitwiseValue31 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue32 = float(bitwiseValue28 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue102 = sumValue63 * 3.0517578125e-05;
                            precise float productValue103 = sumValue64 * 3.0517578125e-05;
                            precise float sumValue65 = bitwiseValue31 + productValue102;
                            precise float sumValue66 = bitwiseValue32 + productValue103;
                            intermediateValue163 = sumValue65;
                            intermediateValue164 = sumValue66;
                        }
                        else
                        {
                            precise float bitwiseValue33 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue34 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue104 = bitwiseValue33 * 16384.0;
                            precise float sumValue67 = productValue104 + 0.5;
                            precise float productValue105 = bitwiseValue34 * 16384.0;
                            precise float sumValue68 = productValue105 + 0.5;
                            precise float productValue106 = floor(sumValue67) * 6.103515625e-05;
                            precise float productValue107 = floor(sumValue68) * 6.103515625e-05;
                            intermediateValue163 = productValue106;
                            intermediateValue164 = productValue107;
                        }
                        precise float productValue152 = intermediateValue57.x * intermediateValue163;
                        precise float productValue153 = intermediateValue57.x * intermediateValue164;
                        precise float sumValue103 = sumValue53 + productValue152;
                        precise float sumValue104 = sumValue54 + productValue153;
                        float intermediateValue201;
                        float intermediateValue202;
                        if (intermediateValue62)
                        {
                            uint bitwiseValue84 = comparisonValue24 >> 15u;
                            precise float bitwiseValue85 = float(bitwiseValue84 & 1u) * 2.0;
                            precise float sumValue111 = bitwiseValue85 + (-1.0);
                            precise float bitwiseValue86 = float(comparisonValue24 >> 31u) * 2.0;
                            precise float sumValue112 = bitwiseValue86 + (-1.0);
                            precise float bitwiseValue87 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue88 = float(bitwiseValue84 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue160 = sumValue111 * 3.0517578125e-05;
                            precise float productValue161 = sumValue112 * 3.0517578125e-05;
                            precise float sumValue113 = bitwiseValue87 + productValue160;
                            precise float sumValue114 = bitwiseValue88 + productValue161;
                            intermediateValue201 = sumValue113;
                            intermediateValue202 = sumValue114;
                        }
                        else
                        {
                            precise float bitwiseValue89 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue90 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue162 = bitwiseValue89 * 16384.0;
                            precise float sumValue115 = productValue162 + 0.5;
                            precise float productValue163 = bitwiseValue90 * 16384.0;
                            precise float sumValue116 = productValue163 + 0.5;
                            precise float productValue164 = floor(sumValue115) * 6.103515625e-05;
                            precise float productValue165 = floor(sumValue116) * 6.103515625e-05;
                            intermediateValue201 = productValue164;
                            intermediateValue202 = productValue165;
                        }
                        precise float productValue204 = intermediateValue58.y * intermediateValue201;
                        precise float productValue205 = intermediateValue58.y * intermediateValue202;
                        precise float sumValue135 = sumValue103 + productValue204;
                        precise float sumValue136 = sumValue104 + productValue205;
                        float intermediateValue215;
                        if (objectInstances.packedValues[productValue56] == 65535us)
                        {
                            intermediateValue215 = 1.0;
                        }
                        else
                        {
                            uint reinterpretedBits26;
                            if (objectInstances.packedValues[productValue56] > 4095us)
                            {
                                reinterpretedBits26 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits26 = uint(objectInstances.packedValues[productValue56]);
                            }
                            intermediateValue215 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits26 + 0u], defaultSampler)), vec2(sumValue135, sumValue136), -0.25).w;
                        }
                        uint comparisonValue57;
                        if (intermediateValue60 == 2u)
                        {
                            comparisonValue57 = 0u;
                        }
                        else
                        {
                            comparisonValue57 = uint(intermediateValue215 <= (((objectInstances.packedValues[productValue57] & 4352us) != 0us) ? 0.5 : 0.0));
                        }
                        if (comparisonValue57 == 0u)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue28);
                        }
                    }
                    intermediateValue63 = rayQueryProceedEXT(intermediateValue28);
                    if (intermediateValue63)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint intermediateValue33 = rayQueryGetIntersectionTypeEXT(intermediateValue28, bool(1u));
            float intermediateValue41;
            float intermediateValue42;
            float intermediateValue43;
            uint bitwiseValue4;
            if (intermediateValue33 == 1u)
            {
                vec2 intermediateValue36 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue28, bool(1u));
                vec2 intermediateValue37 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue28, bool(1u));
                float intermediateValue38 = rayQueryGetIntersectionTEXT(intermediateValue28, bool(1u));
                uint intermediateValue39 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue28, bool(1u));
                uint intermediateValue40 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue28, bool(1u));
                intermediateValue41 = intermediateValue36.x;
                intermediateValue42 = intermediateValue37.y;
                intermediateValue43 = intermediateValue38;
                bitwiseValue4 = ((intermediateValue39 << 14u) & 1073725440u) | (intermediateValue40 & 16383u);
            }
            else
            {
                intermediateValue41 = 0.0;
                intermediateValue42 = 0.0;
                intermediateValue43 = 10000.0;
                bitwiseValue4 = 1073741823u;
            }
            rayQueryInitializeEXT(intermediateValue44, SceneBVH, 512u, 16u, vec3(reinterpretedBits8, reinterpretedBits9, reinterpretedBits10), 0.0, vec3(sumValue14, sumValue16, sumValue18), intermediateValue43);
            bool intermediateValue45 = rayQueryProceedEXT(intermediateValue44);
            float intermediateValue64;
            float intermediateValue66;
            float intermediateValue68;
            if (intermediateValue45)
            {
                float intermediateValue65;
                float intermediateValue67;
                float intermediateValue69;
                float intermediateValue85 = 1.0;
                float intermediateValue86 = 1.0;
                float intermediateValue87 = 1.0;
                bool comparisonValue39;
                for (;;)
                {
                    uint intermediateValue88 = rayQueryGetIntersectionTypeEXT(intermediateValue44, bool(0u));
                    comparisonValue39 = intermediateValue88 == 0u;
                    float branchMergedValue;
                    float branchMergedValue8;
                    float branchMergedValue9;
                    if (comparisonValue39)
                    {
                        vec2 intermediateValue97 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue44, bool(0u));
                        vec2 intermediateValue98 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue44, bool(0u));
                        float intermediateValue99 = rayQueryGetIntersectionTEXT(intermediateValue44, bool(0u));
                        uint intermediateValue100 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue44, bool(0u));
                        uint intermediateValue101 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue44, bool(0u));
                        uint intermediateValue102 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue44, bool(0u));
                        uint productValue86 = (intermediateValue102 * 76u) + 58u;
                        uint productValue87 = (intermediateValue102 * 76u) + 61u;
                        precise float sumValue55 = 1.0 - intermediateValue97.x;
                        precise float sumValue56 = sumValue55 - intermediateValue98.y;
                        uint bitwiseValue24 = (objectInstances_2.packedValues[(intermediateValue102 * 38u) + 25u] >> 2u) + (intermediateValue100 >> 1u);
                        uint productValue88 = uint(objectInstances.packedValues[(intermediateValue102 * 76u) + 54u]) + 0u;
                        bool comparisonValue41 = (intermediateValue100 & 1u) == 0u;
                        uint comparisonValue42 = comparisonValue41 ? faceUvBuffersRW[nonuniformEXT(productValue88)].packedValues[bitwiseValue24].z : faceUvBuffersRW[nonuniformEXT(productValue88)].packedValues[bitwiseValue24].x;
                        uint comparisonValue43 = comparisonValue41 ? faceUvBuffersRW[nonuniformEXT(productValue88)].packedValues[bitwiseValue24].y : faceUvBuffersRW[nonuniformEXT(productValue88)].packedValues[bitwiseValue24].w;
                        uint comparisonValue44 = comparisonValue41 ? faceUvBuffersRW[nonuniformEXT(productValue88)].packedValues[bitwiseValue24].x : faceUvBuffersRW[nonuniformEXT(productValue88)].packedValues[bitwiseValue24].z;
                        bool intermediateValue103 = int16_t(objectInstances.packedValues[productValue87]) < int16_t(0us);
                        float intermediateValue165;
                        float intermediateValue166;
                        if (intermediateValue103)
                        {
                            uint bitwiseValue35 = comparisonValue44 >> 15u;
                            precise float bitwiseValue36 = float(bitwiseValue35 & 1u) * 2.0;
                            precise float sumValue69 = bitwiseValue36 + (-1.0);
                            precise float bitwiseValue37 = float(comparisonValue44 >> 31u) * 2.0;
                            precise float sumValue70 = bitwiseValue37 + (-1.0);
                            precise float bitwiseValue38 = float((comparisonValue44 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue39 = float(bitwiseValue35 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue108 = sumValue69 * 3.0517578125e-05;
                            precise float productValue109 = sumValue70 * 3.0517578125e-05;
                            precise float sumValue71 = bitwiseValue38 + productValue108;
                            precise float sumValue72 = bitwiseValue39 + productValue109;
                            intermediateValue165 = sumValue71;
                            intermediateValue166 = sumValue72;
                        }
                        else
                        {
                            precise float bitwiseValue40 = float(comparisonValue44 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue41 = float(comparisonValue44 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue110 = bitwiseValue40 * 16384.0;
                            precise float sumValue73 = productValue110 + 0.5;
                            precise float productValue111 = bitwiseValue41 * 16384.0;
                            precise float sumValue74 = productValue111 + 0.5;
                            precise float productValue112 = floor(sumValue73) * 6.103515625e-05;
                            precise float productValue113 = floor(sumValue74) * 6.103515625e-05;
                            intermediateValue165 = productValue112;
                            intermediateValue166 = productValue113;
                        }
                        precise float productValue154 = sumValue56 * intermediateValue165;
                        precise float productValue155 = sumValue56 * intermediateValue166;
                        precise float sumValue105 = productValue154 + 0.0;
                        precise float sumValue106 = productValue155 + 0.0;
                        float intermediateValue203;
                        float intermediateValue204;
                        if (intermediateValue103)
                        {
                            uint bitwiseValue91 = comparisonValue43 >> 15u;
                            precise float bitwiseValue92 = float(bitwiseValue91 & 1u) * 2.0;
                            precise float sumValue117 = bitwiseValue92 + (-1.0);
                            precise float bitwiseValue93 = float(comparisonValue43 >> 31u) * 2.0;
                            precise float sumValue118 = bitwiseValue93 + (-1.0);
                            precise float bitwiseValue94 = float((comparisonValue43 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue95 = float(bitwiseValue91 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue166 = sumValue117 * 3.0517578125e-05;
                            precise float productValue167 = sumValue118 * 3.0517578125e-05;
                            precise float sumValue119 = bitwiseValue94 + productValue166;
                            precise float sumValue120 = bitwiseValue95 + productValue167;
                            intermediateValue203 = sumValue119;
                            intermediateValue204 = sumValue120;
                        }
                        else
                        {
                            precise float bitwiseValue96 = float(comparisonValue43 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue97 = float(comparisonValue43 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue168 = bitwiseValue96 * 16384.0;
                            precise float sumValue121 = productValue168 + 0.5;
                            precise float productValue169 = bitwiseValue97 * 16384.0;
                            precise float sumValue122 = productValue169 + 0.5;
                            precise float productValue170 = floor(sumValue121) * 6.103515625e-05;
                            precise float productValue171 = floor(sumValue122) * 6.103515625e-05;
                            intermediateValue203 = productValue170;
                            intermediateValue204 = productValue171;
                        }
                        precise float productValue206 = intermediateValue97.x * intermediateValue203;
                        precise float productValue207 = intermediateValue97.x * intermediateValue204;
                        precise float sumValue137 = sumValue105 + productValue206;
                        precise float sumValue138 = sumValue106 + productValue207;
                        float intermediateValue217;
                        float intermediateValue218;
                        if (intermediateValue103)
                        {
                            uint bitwiseValue122 = comparisonValue42 >> 15u;
                            precise float bitwiseValue123 = float(bitwiseValue122 & 1u) * 2.0;
                            precise float sumValue151 = bitwiseValue123 + (-1.0);
                            precise float bitwiseValue124 = float(comparisonValue42 >> 31u) * 2.0;
                            precise float sumValue152 = bitwiseValue124 + (-1.0);
                            precise float bitwiseValue125 = float((comparisonValue42 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue126 = float(bitwiseValue122 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue220 = sumValue151 * 3.0517578125e-05;
                            precise float productValue221 = sumValue152 * 3.0517578125e-05;
                            precise float sumValue153 = bitwiseValue125 + productValue220;
                            precise float sumValue154 = bitwiseValue126 + productValue221;
                            intermediateValue217 = sumValue153;
                            intermediateValue218 = sumValue154;
                        }
                        else
                        {
                            precise float bitwiseValue127 = float(comparisonValue42 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue128 = float(comparisonValue42 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue222 = bitwiseValue127 * 16384.0;
                            precise float sumValue155 = productValue222 + 0.5;
                            precise float productValue223 = bitwiseValue128 * 16384.0;
                            precise float sumValue156 = productValue223 + 0.5;
                            precise float productValue224 = floor(sumValue155) * 6.103515625e-05;
                            precise float productValue225 = floor(sumValue156) * 6.103515625e-05;
                            intermediateValue217 = productValue224;
                            intermediateValue218 = productValue225;
                        }
                        precise float productValue232 = intermediateValue98.y * intermediateValue217;
                        precise float productValue233 = intermediateValue98.y * intermediateValue218;
                        precise float sumValue163 = sumValue137 + productValue232;
                        precise float sumValue164 = sumValue138 + productValue233;
                        float intermediateValue221;
                        float intermediateValue222;
                        float intermediateValue223;
                        float intermediateValue224;
                        if (objectInstances.packedValues[productValue86] == 65535us)
                        {
                            intermediateValue221 = 1.0;
                            intermediateValue222 = 1.0;
                            intermediateValue223 = 1.0;
                            intermediateValue224 = 1.0;
                        }
                        else
                        {
                            uint reinterpretedBits28;
                            if (objectInstances.packedValues[productValue86] > 4095us)
                            {
                                reinterpretedBits28 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits28 = uint(objectInstances.packedValues[productValue86]);
                            }
                            vec4 sampledTextureValue11 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits28 + 0u], defaultSampler)), vec2(sumValue163, sumValue164), spvNMin(fma(intermediateValue99, 0.083333335816860198974609375, -0.25), 2.0));
                            intermediateValue221 = sampledTextureValue11.x;
                            intermediateValue222 = sampledTextureValue11.y;
                            intermediateValue223 = sampledTextureValue11.z;
                            intermediateValue224 = sampledTextureValue11.w;
                        }
                        float intermediateValue229;
                        float intermediateValue230;
                        float intermediateValue231;
                        if (intermediateValue101 == 2u)
                        {
                            float branchMergedValue38;
                            float branchMergedValue61;
                            float branchMergedValue62;
                            if ((objectInstances.packedValues[productValue87] & 128us) == 0us)
                            {
                                float intermediateValue241;
                                if ((objectInstances.packedValues[productValue87] & 2048us) == 0us)
                                {
                                    intermediateValue241 = intermediateValue224;
                                }
                                else
                                {
                                    intermediateValue241 = spvNClamp(fma(intermediateValue224, 2.0, -1.0), 0.0, 1.0);
                                }
                                branchMergedValue38 = intermediateValue223 - (intermediateValue241 * intermediateValue223);
                                branchMergedValue61 = intermediateValue222 - (intermediateValue241 * intermediateValue222);
                                branchMergedValue62 = intermediateValue221 - (intermediateValue241 * intermediateValue221);
                            }
                            else
                            {
                                branchMergedValue38 = 0.33399999141693115234375;
                                branchMergedValue61 = 0.33399999141693115234375;
                                branchMergedValue62 = 0.33399999141693115234375;
                            }
                            intermediateValue229 = branchMergedValue62;
                            intermediateValue230 = branchMergedValue61;
                            intermediateValue231 = branchMergedValue38;
                        }
                        else
                        {
                            float sumValue175 = 1.0 - intermediateValue224;
                            intermediateValue229 = sumValue175;
                            intermediateValue230 = sumValue175;
                            intermediateValue231 = sumValue175;
                        }
                        float productValue302 = intermediateValue229 * intermediateValue85;
                        float productValue303 = intermediateValue230 * intermediateValue86;
                        float productValue304 = intermediateValue231 * intermediateValue87;
                        float intermediateValue104;
                        float intermediateValue105;
                        float intermediateValue106;
                        bool intermediateValue242;
                        if (!(dot(vec3(productValue302, productValue303, productValue304), vec3(1.0)) <= 0.00999999977648258209228515625))
                        {
                            intermediateValue242 = false;
                            intermediateValue104 = productValue302;
                            intermediateValue105 = productValue303;
                            intermediateValue106 = productValue304;
                        }
                        else
                        {
                            intermediateValue242 = true;
                            intermediateValue104 = 0.0;
                            intermediateValue105 = 0.0;
                            intermediateValue106 = 0.0;
                        }
                        float branchMergedValue81;
                        float branchMergedValue89;
                        float branchMergedValue90;
                        if (intermediateValue242)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue44);
                            branchMergedValue81 = intermediateValue105;
                            branchMergedValue89 = intermediateValue104;
                            branchMergedValue90 = intermediateValue106;
                        }
                        else
                        {
                            branchMergedValue81 = intermediateValue105;
                            branchMergedValue89 = intermediateValue104;
                            branchMergedValue90 = intermediateValue106;
                        }
                        branchMergedValue = branchMergedValue81;
                        branchMergedValue8 = branchMergedValue89;
                        branchMergedValue9 = branchMergedValue90;
                    }
                    else
                    {
                        branchMergedValue = intermediateValue86;
                        branchMergedValue8 = intermediateValue85;
                        branchMergedValue9 = intermediateValue87;
                    }
                    intermediateValue67 = branchMergedValue;
                    intermediateValue65 = branchMergedValue8;
                    intermediateValue69 = branchMergedValue9;
                    bool intermediateValue107 = rayQueryProceedEXT(intermediateValue44);
                    if (intermediateValue107)
                    {
                        intermediateValue85 = intermediateValue65;
                        intermediateValue86 = intermediateValue67;
                        intermediateValue87 = intermediateValue69;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue64 = intermediateValue65;
                intermediateValue66 = intermediateValue67;
                intermediateValue68 = intermediateValue69;
            }
            else
            {
                intermediateValue64 = 1.0;
                intermediateValue66 = 1.0;
                intermediateValue68 = 1.0;
            }
            uint intermediateValue70 = rayQueryGetIntersectionTypeEXT(intermediateValue44, bool(1u));
            bool comparisonValue27 = intermediateValue70 == 1u;
            float comparisonValue28 = comparisonValue27 ? 0.0 : intermediateValue64;
            float comparisonValue29 = comparisonValue27 ? 0.0 : intermediateValue66;
            float comparisonValue30 = comparisonValue27 ? 0.0 : intermediateValue68;
            float intermediateValue11;
            float intermediateValue121;
            float intermediateValue123;
            float intermediateValue125;
            if (intermediateValue43 < 10000.0)
            {
                uint bitwiseValue15 = bitwiseValue4 & 16383u;
                uint productValue68 = (bitwiseValue15 * 76u) + 58u;
                uint productValue69 = (bitwiseValue15 * 76u) + 59u;
                uint productValue70 = (bitwiseValue15 * 76u) + 61u;
                uint productValue71 = (bitwiseValue15 * 38u) + 32u;
                bool reinterpretedBits14 = (intermediateValue43 > 1.0) && (((objectInstances.packedValues[productValue70] & 1us) != 0us) && (floatBitsToUint(ViewCB.packedValues[86u]).y != 0u));
                float productValue90;
                float productValue91;
                float productValue92;
                if (reinterpretedBits14)
                {
                    uint productValue89 = uint(objectInstances.packedValues[(bitwiseValue15 * 76u) + 54u]) + 0u;
                    uint bitwiseValue25 = ((objectInstances_2.packedValues[(bitwiseValue15 * 38u) + 25u] >> 2u) + ((bitwiseValue4 >> 15u) & 32767u)) * 8u;
                    f16vec3 sumValue57 = uint16BitsToFloat16(u16vec3(faceIrradianceCache[nonuniformEXT(productValue89)].packedValues[bitwiseValue25], faceIrradianceCache[nonuniformEXT(productValue89)].packedValues[bitwiseValue25 + 1u], faceIrradianceCache[nonuniformEXT(productValue89)].packedValues[bitwiseValue25 + 2u]));
                    productValue90 = float(sumValue57.x) * comparisonValue28;
                    productValue91 = float(sumValue57.y) * comparisonValue29;
                    productValue92 = float(sumValue57.z) * comparisonValue30;
                }
                else
                {
                    productValue90 = 0.0;
                    productValue91 = 0.0;
                    productValue92 = 0.0;
                }
                float branchMergedValue32;
                float branchMergedValue48;
                float branchMergedValue49;
                float branchMergedValue50;
                if (reinterpretedBits14)
                {
                    branchMergedValue32 = productValue91;
                    branchMergedValue48 = productValue90;
                    branchMergedValue49 = 0.0;
                    branchMergedValue50 = productValue92;
                }
                else
                {
                    uint productValue118 = bitwiseValue15 * 38u;
                    vec4 reinterpretedBits18 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue118], objectInstances_2.packedValues[productValue118 + 1u], objectInstances_2.packedValues[productValue118 + 2u], objectInstances_2.packedValues[productValue118 + 3u]));
                    float intermediateValue127 = reinterpretedBits18.x;
                    float intermediateValue128 = reinterpretedBits18.y;
                    float intermediateValue129 = reinterpretedBits18.z;
                    uint productValue119 = (bitwiseValue15 * 38u) + 4u;
                    vec4 reinterpretedBits19 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue119], objectInstances_2.packedValues[productValue119 + 1u], objectInstances_2.packedValues[productValue119 + 2u], objectInstances_2.packedValues[productValue119 + 3u]));
                    float intermediateValue130 = reinterpretedBits19.x;
                    float intermediateValue131 = reinterpretedBits19.y;
                    float intermediateValue132 = reinterpretedBits19.z;
                    uint productValue120 = (bitwiseValue15 * 38u) + 8u;
                    vec4 reinterpretedBits20 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue120], objectInstances_2.packedValues[productValue120 + 1u], objectInstances_2.packedValues[productValue120 + 2u], objectInstances_2.packedValues[productValue120 + 3u]));
                    float intermediateValue133 = reinterpretedBits20.x;
                    float intermediateValue134 = reinterpretedBits20.y;
                    float intermediateValue135 = reinterpretedBits20.z;
                    uint productValue121 = (bitwiseValue15 * 38u) + 24u;
                    uint productValue122 = (bitwiseValue15 * 38u) + 25u;
                    uint productValue123 = (bitwiseValue15 * 76u) + 61u;
                    uint productValue124 = (bitwiseValue15 * 76u) + 72u;
                    uint bitwiseValue42 = ((bitwiseValue4 >> 13u) & 2u) | ((bitwiseValue4 >> 13u) & 131068u);
                    uint bitwiseValue43 = bitwiseValue42 | 1u;
                    uint bitwiseValue44 = bitwiseValue42 ^ 2u;
                    uint intermediateValue2[3];
                    intermediateValue2[0u] = bitwiseValue42;
                    intermediateValue2[1u] = bitwiseValue43;
                    intermediateValue2[2u] = bitwiseValue44;
                    uint productValue125 = uint(objectInstances.packedValues[(bitwiseValue15 * 76u) + 54u]);
                    uint sumValue75 = productValue125 + 0u;
                    uint bitwiseValue45 = (objectInstances_2.packedValues[productValue122] >> 2u) + ((bitwiseValue4 >> 15u) & 32767u);
                    uint productValue126 = bitwiseValue45 * 4u;
                    precise float bitwiseValue46 = float(faceDataBuffersRW_2[nonuniformEXT(sumValue75)].packedValues[productValue126] & 1023u) * 0.00195503421127796173095703125;
                    precise float sumValue76 = bitwiseValue46 + (-1.0);
                    precise float bitwiseValue47 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue75)].packedValues[productValue126] >> 10u) & 1023u) * 0.00195503421127796173095703125;
                    precise float sumValue77 = bitwiseValue47 + (-1.0);
                    precise float bitwiseValue48 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue75)].packedValues[productValue126] >> 20u) & 1023u) * 0.00195503421127796173095703125;
                    precise float sumValue78 = bitwiseValue48 + (-1.0);
                    precise float sumValue79 = 1.0 - intermediateValue41;
                    precise float sumValue80 = sumValue79 - intermediateValue42;
                    float intermediateValue3[3];
                    intermediateValue3[0u] = sumValue80;
                    intermediateValue3[1u] = intermediateValue41;
                    intermediateValue3[2u] = intermediateValue42;
                    uint sumValue81 = productValue125 + 0u;
                    uint productValue127 = uint(objectInstances.packedValues[(bitwiseValue15 * 76u) + 56u]);
                    uint productValue128 = productValue127 * (objectInstances_2.packedValues[productValue121] + bitwiseValue42);
                    uint bitwiseValue49 = uint(objectInstances.packedValues[(bitwiseValue15 * 76u) + 71u] & 255us);
                    uint bitwiseValue50 = (bitwiseValue49 + productValue128) >> 1u;
                    f16vec3 sumValue82 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue81)].packedValues[bitwiseValue50], vertexBuffers[nonuniformEXT(sumValue81)].packedValues[bitwiseValue50 + 1u], vertexBuffers[nonuniformEXT(sumValue81)].packedValues[bitwiseValue50 + 2u]));
                    uint bitwiseValue51 = uint(objectInstances.packedValues[productValue124] & 255us);
                    uint bitwiseValue52 = (bitwiseValue51 + productValue128) >> 2u;
                    uint bitwiseValue53 = uint(objectInstances.packedValues[productValue124] >> 8us);
                    uint bitwiseValue54 = (bitwiseValue53 + productValue128) >> 2u;
                    bool intermediateValue136 = int16_t(objectInstances.packedValues[productValue123]) < int16_t(0us);
                    float bitwiseValue98;
                    float bitwiseValue99;
                    if (intermediateValue136)
                    {
                        uint bitwiseValue82 = vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue54] >> 15u;
                        bitwiseValue98 = ((float(bitwiseValue82 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue54] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                        bitwiseValue99 = ((float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue54] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue82 & 65534u) * 1.525902189314365386962890625e-05);
                    }
                    else
                    {
                        bitwiseValue98 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue54] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        bitwiseValue99 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue54] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                    }
                    uint intermediateValue205;
                    if ((objectInstances.packedValues[productValue123] & 256us) == 0us)
                    {
                        intermediateValue205 = 0u;
                    }
                    else
                    {
                        intermediateValue205 = vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[(uint(objectInstances.packedValues[(bitwiseValue15 * 76u) + 74u] >> 8us) + productValue128) >> 2u] & 65535u;
                    }
                    precise float productValue208 = sumValue80 * float(sumValue82.x);
                    precise float productValue209 = sumValue80 * float(sumValue82.y);
                    precise float productValue210 = sumValue80 * float(sumValue82.z);
                    precise float sumValue139 = productValue208 + 0.0;
                    precise float sumValue140 = productValue209 + 0.0;
                    precise float sumValue141 = productValue210 + 0.0;
                    uint productValue211 = productValue127 * (objectInstances_2.packedValues[productValue121] + bitwiseValue43);
                    uint bitwiseValue116 = (bitwiseValue49 + productValue211) >> 1u;
                    f16vec3 sumValue142 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue81)].packedValues[bitwiseValue116], vertexBuffers[nonuniformEXT(sumValue81)].packedValues[bitwiseValue116 + 1u], vertexBuffers[nonuniformEXT(sumValue81)].packedValues[bitwiseValue116 + 2u]));
                    uint bitwiseValue117 = (bitwiseValue51 + productValue211) >> 2u;
                    uint bitwiseValue118 = (bitwiseValue53 + productValue211) >> 2u;
                    float bitwiseValue138;
                    float bitwiseValue139;
                    if (intermediateValue136)
                    {
                        uint bitwiseValue129 = vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue118] >> 15u;
                        bitwiseValue138 = ((float(bitwiseValue129 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue118] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                        bitwiseValue139 = ((float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue118] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue129 & 65534u) * 1.525902189314365386962890625e-05);
                    }
                    else
                    {
                        bitwiseValue138 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue118] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        bitwiseValue139 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue118] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                    }
                    precise float productValue234 = intermediateValue41 * float(sumValue142.x);
                    precise float productValue235 = intermediateValue41 * float(sumValue142.y);
                    precise float productValue236 = intermediateValue41 * float(sumValue142.z);
                    precise float sumValue165 = sumValue139 + productValue234;
                    precise float sumValue166 = sumValue140 + productValue235;
                    precise float sumValue167 = sumValue141 + productValue236;
                    uint productValue237 = productValue127 * (objectInstances_2.packedValues[productValue121] + bitwiseValue44);
                    uint bitwiseValue140 = (bitwiseValue49 + productValue237) >> 1u;
                    f16vec3 sumValue168 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue81)].packedValues[bitwiseValue140], vertexBuffers[nonuniformEXT(sumValue81)].packedValues[bitwiseValue140 + 1u], vertexBuffers[nonuniformEXT(sumValue81)].packedValues[bitwiseValue140 + 2u]));
                    uint bitwiseValue141 = (bitwiseValue51 + productValue237) >> 2u;
                    uint bitwiseValue142 = (bitwiseValue53 + productValue237) >> 2u;
                    float bitwiseValue150;
                    float bitwiseValue151;
                    if (intermediateValue136)
                    {
                        uint bitwiseValue148 = vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue142] >> 15u;
                        bitwiseValue150 = ((float(bitwiseValue148 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue142] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                        bitwiseValue151 = ((float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue142] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue148 & 65534u) * 1.525902189314365386962890625e-05);
                    }
                    else
                    {
                        bitwiseValue150 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue142] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        bitwiseValue151 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue142] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                    }
                    precise float productValue244 = intermediateValue42 * float(sumValue168.x);
                    precise float productValue245 = intermediateValue42 * float(sumValue168.y);
                    precise float productValue246 = intermediateValue42 * float(sumValue168.z);
                    precise float sumValue176 = sumValue165 + productValue244;
                    precise float sumValue177 = sumValue166 + productValue245;
                    precise float sumValue178 = sumValue167 + productValue246;
                    float productValue247 = ((bitwiseValue138 * intermediateValue41) + (bitwiseValue98 * sumValue80)) + (bitwiseValue150 * intermediateValue42);
                    float productValue248 = ((bitwiseValue139 * intermediateValue41) + (bitwiseValue99 * sumValue80)) + (bitwiseValue151 * intermediateValue42);
                    float bitwiseValue152 = (((float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue117] & 255u) * intermediateValue41) + (float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue52] & 255u) * sumValue80)) + (float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue141] & 255u) * intermediateValue42)) * 0.0039215688593685626983642578125;
                    float bitwiseValue153 = (((float((vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue117] >> 8u) & 255u) * intermediateValue41) + (float((vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue52] >> 8u) & 255u) * sumValue80)) + (float((vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue141] >> 8u) & 255u) * intermediateValue42)) * 0.0039215688593685626983642578125;
                    float bitwiseValue154 = (((float((vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue117] >> 16u) & 255u) * intermediateValue41) + (float((vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue52] >> 16u) & 255u) * sumValue80)) + (float((vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue141] >> 16u) & 255u) * intermediateValue42)) * 0.0039215688593685626983642578125;
                    float bitwiseValue155 = (((float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue117] >> 24u) * intermediateValue41) + (float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue52] >> 24u) * sumValue80)) + (float(vertexBuffers_2[nonuniformEXT(sumValue81)].packedValues[bitwiseValue141] >> 24u) * intermediateValue42)) * 0.0039215688593685626983642578125;
                    precise float productValue249 = intermediateValue127 * sumValue176;
                    precise float productValue250 = sumValue177 * intermediateValue128;
                    precise float sumValue179 = productValue250 + productValue249;
                    precise float productValue251 = sumValue178 * intermediateValue129;
                    precise float sumValue180 = productValue251 + sumValue179;
                    precise float productValue252 = 1.0 * reinterpretedBits18.w;
                    precise float sumValue181 = productValue252 + sumValue180;
                    precise float productValue253 = intermediateValue130 * sumValue176;
                    precise float productValue254 = sumValue177 * intermediateValue131;
                    precise float sumValue182 = productValue254 + productValue253;
                    precise float productValue255 = sumValue178 * intermediateValue132;
                    precise float sumValue183 = productValue255 + sumValue182;
                    precise float productValue256 = 1.0 * reinterpretedBits19.w;
                    precise float sumValue184 = productValue256 + sumValue183;
                    precise float productValue257 = intermediateValue133 * sumValue176;
                    precise float productValue258 = sumValue177 * intermediateValue134;
                    precise float sumValue185 = productValue258 + productValue257;
                    precise float productValue259 = sumValue178 * intermediateValue135;
                    precise float sumValue186 = productValue259 + sumValue185;
                    precise float productValue260 = 1.0 * reinterpretedBits20.w;
                    precise float sumValue187 = productValue260 + sumValue186;
                    precise float productValue261 = intermediateValue127 * sumValue76;
                    precise float productValue262 = sumValue77 * intermediateValue128;
                    precise float sumValue188 = productValue262 + productValue261;
                    precise float productValue263 = sumValue78 * intermediateValue129;
                    precise float sumValue189 = productValue263 + sumValue188;
                    precise float productValue264 = intermediateValue130 * sumValue76;
                    precise float productValue265 = sumValue77 * intermediateValue131;
                    precise float sumValue190 = productValue265 + productValue264;
                    precise float productValue266 = sumValue78 * intermediateValue132;
                    precise float sumValue191 = productValue266 + sumValue190;
                    precise float productValue267 = intermediateValue133 * sumValue76;
                    precise float productValue268 = sumValue77 * intermediateValue134;
                    precise float sumValue192 = productValue268 + productValue267;
                    precise float productValue269 = sumValue78 * intermediateValue135;
                    precise float sumValue193 = productValue269 + sumValue192;
                    float inverseLengthValue5 = inversesqrt(dot(vec3(sumValue189, sumValue191, sumValue193), vec3(sumValue189, sumValue191, sumValue193)));
                    precise float productValue270 = sumValue189 * inverseLengthValue5;
                    precise float productValue271 = sumValue191 * inverseLengthValue5;
                    precise float productValue272 = sumValue193 * inverseLengthValue5;
                    bool dotProductValue8 = dot(vec3(sumValue14, sumValue16, sumValue18), vec3(productValue270, productValue271, productValue272)) > 0.0;
                    precise float sumValue194 = (-0.0) - productValue270;
                    precise float sumValue195 = (-0.0) - productValue271;
                    precise float sumValue196 = (-0.0) - productValue272;
                    float comparisonValue59 = dotProductValue8 ? sumValue194 : productValue270;
                    float comparisonValue60 = dotProductValue8 ? sumValue195 : productValue271;
                    float comparisonValue61 = dotProductValue8 ? sumValue196 : productValue272;
                    float intermediateValue232;
                    float intermediateValue233;
                    float intermediateValue234;
                    if (((objectInstances.packedValues[productValue123] & 1us) != 0us) && (floatBitsToUint(ViewCB.packedValues[86u]).y != 0u))
                    {
                        uint sumValue219 = productValue125 + 0u;
                        float sumValue220;
                        float sumValue221;
                        float sumValue222;
                        uint sumValue227;
                        float intermediateValue243 = sumValue80;
                        uint intermediateValue244 = bitwiseValue42;
                        float intermediateValue245 = 0.0;
                        float intermediateValue246 = 0.0;
                        float intermediateValue247 = 0.0;
                        uint intermediateValue248 = 0u;
                        f16vec3 sumValue229;
                        f16vec3 sumValue230;
                        for (;;)
                        {
                            uint sumValue228 = intermediateValue244 + objectInstances_2.packedValues[productValue122];
                            uint productValue308 = sumValue228 * 8u;
                            sumValue229 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue219)].packedValues[productValue308], vertexIrradianceCache[nonuniformEXT(sumValue219)].packedValues[productValue308 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue219)].packedValues[productValue308 + 2u]));
                            uint productValue309 = (sumValue228 * 8u) + 4u;
                            sumValue230 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue219)].packedValues[productValue309], vertexIrradianceCache[nonuniformEXT(sumValue219)].packedValues[productValue309 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue219)].packedValues[productValue309 + 2u]));
                            float16_t intermediateValue265;
                            float16_t intermediateValue266;
                            float16_t intermediateValue267;
                            if (dotProductValue8)
                            {
                                intermediateValue265 = sumValue230.x;
                                intermediateValue266 = sumValue230.y;
                                intermediateValue267 = sumValue230.z;
                            }
                            else
                            {
                                intermediateValue265 = sumValue229.x;
                                intermediateValue266 = sumValue229.y;
                                intermediateValue267 = sumValue229.z;
                            }
                            precise float productValue312 = float(intermediateValue267) * intermediateValue243;
                            precise float productValue313 = float(intermediateValue266) * intermediateValue243;
                            precise float productValue314 = float(intermediateValue265) * intermediateValue243;
                            sumValue220 = productValue314 + intermediateValue245;
                            sumValue221 = productValue313 + intermediateValue246;
                            sumValue222 = productValue312 + intermediateValue247;
                            sumValue227 = intermediateValue248 + 1u;
                            if (sumValue227 == 3u)
                            {
                                break;
                            }
                            intermediateValue243 = intermediateValue3[sumValue227];
                            intermediateValue244 = intermediateValue2[sumValue227];
                            intermediateValue245 = sumValue220;
                            intermediateValue246 = sumValue221;
                            intermediateValue247 = sumValue222;
                            intermediateValue248 = sumValue227;
                            continue;
                        }
                        intermediateValue232 = sumValue220;
                        intermediateValue233 = sumValue221;
                        intermediateValue234 = sumValue222;
                    }
                    else
                    {
                        intermediateValue232 = 0.0;
                        intermediateValue233 = 0.0;
                        intermediateValue234 = 0.0;
                    }
                    vec2 reinterpretedBits30 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[intermediateValue205 * 8u]);
                    vec2 reinterpretedBits31 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue205 * 8u) + 1u]);
                    float reinterpretedBits32 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue205 * 16u) + 13u]);
                    float reinterpretedBits33 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue205 * 16u) + 14u]);
                    float nonlinearValue2 = spvNMax(0.0, log2(abs((ViewCB.packedValues[89u].y * intermediateValue7) + (intermediateValue43 * 0.100000001490116119384765625))) + float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(sumValue75)].packedValues[(bitwiseValue45 * 8u) + 6u])));
                    uint reinterpretedBits38;
                    if (objectInstances.packedValues[productValue68] > 4095us)
                    {
                        reinterpretedBits38 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits38 = uint(objectInstances.packedValues[productValue68]);
                    }
                    uint sumValue231 = reinterpretedBits38 + 0u;
                    float intermediateValue257;
                    float intermediateValue258;
                    float intermediateValue259;
                    float intermediateValue260;
                    if (objectInstances.packedValues[productValue68] == 65535us)
                    {
                        intermediateValue257 = 1.0;
                        intermediateValue258 = 1.0;
                        intermediateValue259 = 1.0;
                        intermediateValue260 = 1.0;
                    }
                    else
                    {
                        vec4 sampledTextureValue13 = textureLod(nonuniformEXT(sampler2D(textures[sumValue231], defaultSampler)), vec2(productValue247, productValue248), spvNMin(nonlinearValue2, reinterpretedBits32));
                        intermediateValue257 = sampledTextureValue13.x;
                        intermediateValue258 = sampledTextureValue13.y;
                        intermediateValue259 = sampledTextureValue13.z;
                        intermediateValue260 = sampledTextureValue13.w;
                    }
                    float productValue315;
                    float productValue316;
                    float productValue317;
                    float productValue318;
                    float productValue319;
                    float productValue320;
                    float productValue321;
                    float productValue322;
                    float productValue323;
                    float productValue324;
                    if ((objectInstances.packedValues[productValue70] & 1536us) == 0us)
                    {
                        float intermediateValue272;
                        float intermediateValue273;
                        float intermediateValue274;
                        float intermediateValue275;
                        if ((objectInstances.packedValues[productValue70] & 4us) == 0us)
                        {
                            intermediateValue272 = intermediateValue260;
                            intermediateValue273 = bitwiseValue152;
                            intermediateValue274 = bitwiseValue153;
                            intermediateValue275 = bitwiseValue154;
                        }
                        else
                        {
                            uint reinterpretedBits46;
                            if (objectInstances.packedValues[productValue69] > 4095us)
                            {
                                reinterpretedBits46 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits46 = uint(objectInstances.packedValues[productValue69]);
                            }
                            vec4 sampledTextureValue15 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits46 + 0u], defaultSampler)), vec2(bitwiseValue152, bitwiseValue153), 0.0);
                            intermediateValue272 = 1.0;
                            intermediateValue273 = ((((sampledTextureValue15.x * 2.0) + (-1.0)) * bitwiseValue154) + 1.0) * bitwiseValue155;
                            intermediateValue274 = ((((sampledTextureValue15.y * 2.0) + (-1.0)) * bitwiseValue154) + 1.0) * bitwiseValue155;
                            intermediateValue275 = ((((sampledTextureValue15.z * 2.0) + (-1.0)) * bitwiseValue154) + 1.0) * bitwiseValue155;
                        }
                        float intermediateValue286;
                        float intermediateValue287;
                        float intermediateValue288;
                        if ((objectInstances.packedValues[productValue70] & 8192us) == 0us)
                        {
                            intermediateValue286 = intermediateValue273;
                            intermediateValue287 = intermediateValue274;
                            intermediateValue288 = intermediateValue275;
                        }
                        else
                        {
                            intermediateValue286 = ((1.0 - intermediateValue273) * intermediateValue272) + intermediateValue273;
                            intermediateValue287 = ((1.0 - intermediateValue274) * intermediateValue272) + intermediateValue274;
                            intermediateValue288 = ((1.0 - intermediateValue275) * intermediateValue272) + intermediateValue275;
                        }
                        float intermediateValue302;
                        if ((objectInstances.packedValues[productValue70] & 2048us) == 0us)
                        {
                            intermediateValue302 = intermediateValue272;
                        }
                        else
                        {
                            intermediateValue302 = spvNClamp(fma(intermediateValue272, 2.0, -1.0), 0.0, 1.0);
                        }
                        float bitwiseValue162 = (intermediateValue286 * intermediateValue257) * ((intermediateValue302 * ((float(objectInstances_2.packedValues[productValue71] >> 24u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                        float bitwiseValue163 = (intermediateValue287 * intermediateValue258) * ((intermediateValue302 * ((float((objectInstances_2.packedValues[productValue71] >> 16u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                        float bitwiseValue164 = (intermediateValue288 * intermediateValue259) * ((intermediateValue302 * ((float((objectInstances_2.packedValues[productValue71] >> 8u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                        float productValue378;
                        if (bitwiseValue162 < 0.040449999272823333740234375)
                        {
                            productValue378 = bitwiseValue162 * 0.077399380505084991455078125;
                        }
                        else
                        {
                            productValue378 = exp2(log2((bitwiseValue162 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                        }
                        float productValue436;
                        if (bitwiseValue163 < 0.040449999272823333740234375)
                        {
                            productValue436 = bitwiseValue163 * 0.077399380505084991455078125;
                        }
                        else
                        {
                            productValue436 = exp2(log2((bitwiseValue163 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                        }
                        float productValue466;
                        if (bitwiseValue164 < 0.040449999272823333740234375)
                        {
                            productValue466 = bitwiseValue164 * 0.077399380505084991455078125;
                        }
                        else
                        {
                            productValue466 = exp2(log2((bitwiseValue164 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                        }
                        float reinterpretedBits48;
                        float reinterpretedBits49;
                        float reinterpretedBits50;
                        if ((pbrTextureDataBuffer.packedValues[(intermediateValue205 * 16u) + 8u] & 1u) == 0u)
                        {
                            reinterpretedBits48 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue205 * 16u) + 11u]);
                            reinterpretedBits49 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue205 * 16u) + 9u]);
                            reinterpretedBits50 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue205 * 16u) + 10u]);
                        }
                        else
                        {
                            vec4 sampledTextureValue23 = textureLod(nonuniformEXT(sampler2D(textures[sumValue231], defaultSampler)), vec2(fma(productValue247, reinterpretedBits30.x, reinterpretedBits31.x), fma(productValue248, reinterpretedBits30.y, reinterpretedBits31.y)), spvNMin((reinterpretedBits33 - reinterpretedBits32) + nonlinearValue2, reinterpretedBits33));
                            reinterpretedBits48 = sampledTextureValue23.x;
                            reinterpretedBits49 = sampledTextureValue23.z;
                            reinterpretedBits50 = fma(sampledTextureValue23.y, sampledTextureValue23.y, 0.0);
                        }
                        float sumValue357 = 1.0 - reinterpretedBits48;
                        float productValue496 = sumValue357 * productValue378;
                        float productValue497 = sumValue357 * productValue436;
                        float productValue498 = sumValue357 * productValue466;
                        float dotProductValue20 = dot(vec3(productValue378, productValue436, productValue466), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                        float productValue499 = (reinterpretedBits50 * 5.0) * ViewCB.packedValues[84u].w;
                        productValue315 = reinterpretedBits49 - (ViewCB.packedValues[85u].w * reinterpretedBits49);
                        productValue316 = productValue499 * (((dotProductValue20 - productValue378) * ViewCB.packedValues[85u].x) + productValue378);
                        productValue317 = productValue499 * (((dotProductValue20 - productValue436) * ViewCB.packedValues[85u].x) + productValue436);
                        productValue318 = productValue499 * (((dotProductValue20 - productValue466) * ViewCB.packedValues[85u].x) + productValue466);
                        productValue319 = (reinterpretedBits48 * (productValue378 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                        productValue320 = (reinterpretedBits48 * (productValue436 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                        productValue321 = (reinterpretedBits48 * (productValue466 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                        productValue322 = productValue496 - (productValue496 * reinterpretedBits50);
                        productValue323 = productValue497 - (productValue497 * reinterpretedBits50);
                        productValue324 = productValue498 - (productValue498 * reinterpretedBits50);
                    }
                    else
                    {
                        productValue315 = intermediateValue268;
                        productValue316 = intermediateValue268;
                        productValue317 = intermediateValue268;
                        productValue318 = intermediateValue268;
                        productValue319 = intermediateValue268;
                        productValue320 = intermediateValue268;
                        productValue321 = intermediateValue268;
                        productValue322 = intermediateValue268;
                        productValue323 = intermediateValue268;
                        productValue324 = intermediateValue268;
                    }
                    float productValue325 = ((productValue316 * comparisonValue28) * ViewCB.packedValues[85u].y) + productValue90;
                    float productValue326 = ((productValue317 * comparisonValue29) * ViewCB.packedValues[85u].y) + productValue91;
                    float productValue327 = ((productValue318 * comparisonValue30) * ViewCB.packedValues[85u].y) + productValue92;
                    float intermediateValue122;
                    float intermediateValue124;
                    float intermediateValue126;
                    if (floatBitsToUint(ViewCB.packedValues[86u]).y == 0u)
                    {
                        intermediateValue122 = productValue325;
                        intermediateValue124 = productValue326;
                        intermediateValue126 = productValue327;
                    }
                    else
                    {
                        intermediateValue122 = productValue325 + ((intermediateValue232 * comparisonValue28) * productValue322);
                        intermediateValue124 = productValue326 + ((intermediateValue233 * comparisonValue29) * productValue323);
                        intermediateValue126 = productValue327 + ((intermediateValue234 * comparisonValue30) * productValue324);
                    }
                    precise float productValue344 = comparisonValue59 * 256.0;
                    uint intermediateValue276 = uint(int(productValue344));
                    precise float productValue345 = comparisonValue60 * 256.0;
                    uint intermediateValue277 = uint(int(productValue345));
                    precise float productValue346 = comparisonValue61 * 256.0;
                    uint intermediateValue278 = uint(int(productValue346));
                    precise float productValue347 = comparisonValue59 * 1.52587890625e-05;
                    precise float sumValue237 = sumValue181 + productValue347;
                    float reinterpretedBits40 = (abs(sumValue181) < 0.03125) ? sumValue237 : uintBitsToFloat(((sumValue181 < 0.0) ? (-intermediateValue276) : intermediateValue276) + floatBitsToUint(sumValue181));
                    precise float productValue348 = comparisonValue60 * 1.52587890625e-05;
                    precise float sumValue238 = sumValue184 + productValue348;
                    float reinterpretedBits41 = (abs(sumValue184) < 0.03125) ? sumValue238 : uintBitsToFloat(((sumValue184 < 0.0) ? (-intermediateValue277) : intermediateValue277) + floatBitsToUint(sumValue184));
                    precise float productValue349 = comparisonValue61 * 1.52587890625e-05;
                    precise float sumValue239 = sumValue187 + productValue349;
                    float reinterpretedBits42 = (abs(sumValue187) < 0.03125) ? sumValue239 : uintBitsToFloat(((sumValue187 < 0.0) ? (-intermediateValue278) : intermediateValue278) + floatBitsToUint(sumValue187));
                    float intermediateValue289;
                    float intermediateValue290;
                    float intermediateValue291;
                    if (dot(vec3(ViewCB.packedValues[52u].xyz), vec3(comparisonValue59, comparisonValue60, comparisonValue61)) < 0.0)
                    {
                        intermediateValue289 = 0.0;
                        intermediateValue290 = 0.0;
                        intermediateValue291 = 0.0;
                    }
                    else
                    {
                        rayQueryInitializeEXT(intermediateValue292, SceneBVH, 512u, 32u, vec3(reinterpretedBits40, reinterpretedBits41, reinterpretedBits42), 0.0, vec3(ViewCB.packedValues[53u].xyz), 10000.0);
                        bool intermediateValue293 = rayQueryProceedEXT(intermediateValue292);
                        if (intermediateValue293)
                        {
                            bool intermediateValue320;
                            bool comparisonValue71;
                            for (;;)
                            {
                                uint intermediateValue308 = rayQueryGetIntersectionTypeEXT(intermediateValue292, bool(0u));
                                comparisonValue71 = intermediateValue308 == 0u;
                                if (comparisonValue71)
                                {
                                    vec2 intermediateValue314 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue292, bool(0u));
                                    vec2 intermediateValue315 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue292, bool(0u));
                                    uint intermediateValue316 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue292, bool(0u));
                                    uint intermediateValue317 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue292, bool(0u));
                                    uint intermediateValue318 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue292, bool(0u));
                                    uint productValue379 = (intermediateValue318 * 76u) + 58u;
                                    uint productValue380 = (intermediateValue318 * 76u) + 61u;
                                    precise float sumValue257 = 1.0 - intermediateValue314.x;
                                    precise float sumValue258 = sumValue257 - intermediateValue315.y;
                                    uint bitwiseValue168 = (objectInstances_2.packedValues[(intermediateValue318 * 38u) + 25u] >> 2u) + (intermediateValue316 >> 1u);
                                    uint productValue381 = uint(objectInstances.packedValues[(intermediateValue318 * 76u) + 54u]) + 0u;
                                    bool comparisonValue73 = (intermediateValue316 & 1u) == 0u;
                                    uint comparisonValue74 = comparisonValue73 ? faceUvBuffersRW[nonuniformEXT(productValue381)].packedValues[bitwiseValue168].z : faceUvBuffersRW[nonuniformEXT(productValue381)].packedValues[bitwiseValue168].x;
                                    uint comparisonValue75 = comparisonValue73 ? faceUvBuffersRW[nonuniformEXT(productValue381)].packedValues[bitwiseValue168].y : faceUvBuffersRW[nonuniformEXT(productValue381)].packedValues[bitwiseValue168].w;
                                    uint comparisonValue76 = comparisonValue73 ? faceUvBuffersRW[nonuniformEXT(productValue381)].packedValues[bitwiseValue168].x : faceUvBuffersRW[nonuniformEXT(productValue381)].packedValues[bitwiseValue168].z;
                                    bool intermediateValue319 = int16_t(objectInstances.packedValues[productValue380]) < int16_t(0us);
                                    float intermediateValue370;
                                    float intermediateValue371;
                                    if (intermediateValue319)
                                    {
                                        uint bitwiseValue170 = comparisonValue76 >> 15u;
                                        precise float bitwiseValue171 = float(bitwiseValue170 & 1u) * 2.0;
                                        precise float sumValue293 = bitwiseValue171 + (-1.0);
                                        precise float bitwiseValue172 = float(comparisonValue76 >> 31u) * 2.0;
                                        precise float sumValue294 = bitwiseValue172 + (-1.0);
                                        precise float bitwiseValue173 = float((comparisonValue76 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue174 = float(bitwiseValue170 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue424 = sumValue293 * 3.0517578125e-05;
                                        precise float productValue425 = sumValue294 * 3.0517578125e-05;
                                        precise float sumValue295 = bitwiseValue173 + productValue424;
                                        precise float sumValue296 = bitwiseValue174 + productValue425;
                                        intermediateValue370 = sumValue295;
                                        intermediateValue371 = sumValue296;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue175 = float(comparisonValue76 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue176 = float(comparisonValue76 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue426 = bitwiseValue175 * 16384.0;
                                        precise float sumValue297 = productValue426 + 0.5;
                                        precise float productValue427 = bitwiseValue176 * 16384.0;
                                        precise float sumValue298 = productValue427 + 0.5;
                                        precise float productValue428 = floor(sumValue297) * 6.103515625e-05;
                                        precise float productValue429 = floor(sumValue298) * 6.103515625e-05;
                                        intermediateValue370 = productValue428;
                                        intermediateValue371 = productValue429;
                                    }
                                    precise float productValue437 = sumValue258 * intermediateValue370;
                                    precise float productValue438 = sumValue258 * intermediateValue371;
                                    precise float sumValue305 = productValue437 + 0.0;
                                    precise float sumValue306 = productValue438 + 0.0;
                                    float intermediateValue452;
                                    float intermediateValue453;
                                    if (intermediateValue319)
                                    {
                                        uint bitwiseValue184 = comparisonValue75 >> 15u;
                                        precise float bitwiseValue185 = float(bitwiseValue184 & 1u) * 2.0;
                                        precise float sumValue309 = bitwiseValue185 + (-1.0);
                                        precise float bitwiseValue186 = float(comparisonValue75 >> 31u) * 2.0;
                                        precise float sumValue310 = bitwiseValue186 + (-1.0);
                                        precise float bitwiseValue187 = float((comparisonValue75 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue188 = float(bitwiseValue184 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue442 = sumValue309 * 3.0517578125e-05;
                                        precise float productValue443 = sumValue310 * 3.0517578125e-05;
                                        precise float sumValue311 = bitwiseValue187 + productValue442;
                                        precise float sumValue312 = bitwiseValue188 + productValue443;
                                        intermediateValue452 = sumValue311;
                                        intermediateValue453 = sumValue312;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue189 = float(comparisonValue75 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue190 = float(comparisonValue75 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue444 = bitwiseValue189 * 16384.0;
                                        precise float sumValue313 = productValue444 + 0.5;
                                        precise float productValue445 = bitwiseValue190 * 16384.0;
                                        precise float sumValue314 = productValue445 + 0.5;
                                        precise float productValue446 = floor(sumValue313) * 6.103515625e-05;
                                        precise float productValue447 = floor(sumValue314) * 6.103515625e-05;
                                        intermediateValue452 = productValue446;
                                        intermediateValue453 = productValue447;
                                    }
                                    precise float productValue467 = intermediateValue314.x * intermediateValue452;
                                    precise float productValue468 = intermediateValue314.x * intermediateValue453;
                                    precise float sumValue329 = sumValue305 + productValue467;
                                    precise float sumValue330 = sumValue306 + productValue468;
                                    float intermediateValue494;
                                    float intermediateValue495;
                                    if (intermediateValue319)
                                    {
                                        uint bitwiseValue230 = comparisonValue74 >> 15u;
                                        precise float bitwiseValue231 = float(bitwiseValue230 & 1u) * 2.0;
                                        precise float sumValue358 = bitwiseValue231 + (-1.0);
                                        precise float bitwiseValue232 = float(comparisonValue74 >> 31u) * 2.0;
                                        precise float sumValue359 = bitwiseValue232 + (-1.0);
                                        precise float bitwiseValue233 = float((comparisonValue74 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue234 = float(bitwiseValue230 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue500 = sumValue358 * 3.0517578125e-05;
                                        precise float productValue501 = sumValue359 * 3.0517578125e-05;
                                        precise float sumValue360 = bitwiseValue233 + productValue500;
                                        precise float sumValue361 = bitwiseValue234 + productValue501;
                                        intermediateValue494 = sumValue360;
                                        intermediateValue495 = sumValue361;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue235 = float(comparisonValue74 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue236 = float(comparisonValue74 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue502 = bitwiseValue235 * 16384.0;
                                        precise float sumValue362 = productValue502 + 0.5;
                                        precise float productValue503 = bitwiseValue236 * 16384.0;
                                        precise float sumValue363 = productValue503 + 0.5;
                                        precise float productValue504 = floor(sumValue362) * 6.103515625e-05;
                                        precise float productValue505 = floor(sumValue363) * 6.103515625e-05;
                                        intermediateValue494 = productValue504;
                                        intermediateValue495 = productValue505;
                                    }
                                    precise float productValue530 = intermediateValue315.y * intermediateValue494;
                                    precise float productValue531 = intermediateValue315.y * intermediateValue495;
                                    precise float sumValue383 = sumValue329 + productValue530;
                                    precise float sumValue384 = sumValue330 + productValue531;
                                    float intermediateValue498;
                                    if (objectInstances.packedValues[productValue379] == 65535us)
                                    {
                                        intermediateValue498 = 1.0;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits54;
                                        if (objectInstances.packedValues[productValue379] > 4095us)
                                        {
                                            reinterpretedBits54 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits54 = uint(objectInstances.packedValues[productValue379]);
                                        }
                                        intermediateValue498 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits54 + 0u], defaultSampler)), vec2(sumValue383, sumValue384), -0.25).w;
                                    }
                                    uint comparisonValue119;
                                    if (intermediateValue317 == 2u)
                                    {
                                        comparisonValue119 = 0u;
                                    }
                                    else
                                    {
                                        comparisonValue119 = uint(intermediateValue498 <= (((objectInstances.packedValues[productValue380] & 4352us) != 0us) ? 0.5 : 0.0));
                                    }
                                    if (comparisonValue119 == 0u)
                                    {
                                        rayQueryConfirmIntersectionEXT(intermediateValue292);
                                    }
                                }
                                intermediateValue320 = rayQueryProceedEXT(intermediateValue292);
                                if (intermediateValue320)
                                {
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                        uint intermediateValue304 = rayQueryGetIntersectionTypeEXT(intermediateValue292, bool(1u));
                        float intermediateValue310;
                        if (intermediateValue304 == 1u)
                        {
                            float intermediateValue309 = rayQueryGetIntersectionTEXT(intermediateValue292, bool(1u));
                            intermediateValue310 = intermediateValue309;
                        }
                        else
                        {
                            intermediateValue310 = 10000.0;
                        }
                        float branchMergedValue40;
                        float branchMergedValue65;
                        float branchMergedValue66;
                        if (intermediateValue310 < 10000.0)
                        {
                            precise float productValue382 = intermediateValue310 * ViewCB.packedValues[63u].x;
                            precise float productValue383 = intermediateValue310 * ViewCB.packedValues[63u].y;
                            precise float productValue384 = intermediateValue310 * ViewCB.packedValues[63u].z;
                            precise float productValue385 = productValue382 * (-1.44269502162933349609375);
                            precise float productValue386 = productValue383 * (-1.44269502162933349609375);
                            precise float productValue387 = productValue384 * (-1.44269502162933349609375);
                            precise float productValue388 = ViewCB.packedValues[53u].x * intermediateValue310;
                            precise float sumValue259 = productValue388 + reinterpretedBits40;
                            precise float productValue389 = ViewCB.packedValues[53u].z * intermediateValue310;
                            precise float sumValue260 = productValue389 + reinterpretedBits42;
                            precise float productValue390 = sumValue259 * ViewCB.packedValues[83u].z;
                            precise float sumValue261 = productValue390 + ViewCB.packedValues[84u].x;
                            precise float productValue391 = sumValue260 * ViewCB.packedValues[83u].w;
                            precise float sumValue262 = productValue391 + ViewCB.packedValues[84u].y;
                            vec4 sampledTextureValue17 = textureLod(sampler2D(wibblyTexture, linearWrapSampler), vec2(sumValue261, sumValue262), 0.0);
                            precise float sumValue263 = sampledTextureValue17.x + (-0.5);
                            precise float sumValue264 = sampledTextureValue17.y + (-0.5);
                            precise float productValue392 = sumValue259 * ViewCB.packedValues[82u].z;
                            precise float sumValue265 = productValue392 + ViewCB.packedValues[83u].x;
                            precise float productValue393 = sumValue260 * ViewCB.packedValues[82u].w;
                            precise float sumValue266 = productValue393 + ViewCB.packedValues[83u].y;
                            precise float productValue394 = sumValue263 * 0.4000000059604644775390625;
                            precise float productValue395 = sumValue264 * 0.4000000059604644775390625;
                            precise float sumValue267 = sumValue265 + productValue394;
                            precise float sumValue268 = productValue395 + sumValue266;
                            precise float productValue396 = ViewCB.packedValues[68u].w * 63.0;
                            uint intermediateValue321 = uint(int(floor(productValue396)));
                            precise float productValue397 = float(int(intermediateValue321 + 1u)) * 0.015625;
                            precise float sumValue269 = (-0.0) - productValue397;
                            float intermediateValue322 = fract(abs(productValue397));
                            precise float sumValue270 = (-0.0) - intermediateValue322;
                            precise float comparisonValue77 = ((productValue397 >= sumValue269) ? intermediateValue322 : sumValue270) * 64.0;
                            vec4 sampledTextureValue18 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue267, sumValue268, float(int(intermediateValue321))), 0.0);
                            float intermediateValue323 = sampledTextureValue18.x;
                            precise float sampledTextureValue19 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue267, sumValue268, float(int(uint(int(comparisonValue77))))), 0.0).x - intermediateValue323;
                            precise float productValue398 = fract(productValue396) * sampledTextureValue19;
                            precise float sumValue271 = intermediateValue323 + productValue398;
                            precise float productValue399 = sumValue271 * 7.0;
                            precise float sumValue272 = productValue399 + 0.800000011920928955078125;
                            precise float productValue400 = intermediateValue310 * (-0.100000001490116119384765625);
                            precise float sumValue273 = sumValue272 + (-1.0);
                            precise float exponentialValue4 = exp2(productValue400) * sumValue273;
                            precise float sumValue274 = exponentialValue4 + 1.0;
                            precise float exponentialValue5 = exp2(productValue385) * sumValue274;
                            precise float exponentialValue6 = exp2(productValue386) * sumValue274;
                            precise float exponentialValue7 = exp2(productValue387) * sumValue274;
                            rayQueryInitializeEXT(intermediateValue324, SceneBVH, 512u, 22u, vec3(reinterpretedBits40, reinterpretedBits41, reinterpretedBits42), 0.0, vec3(ViewCB.packedValues[53u].xyz), intermediateValue310);
                            bool intermediateValue325 = rayQueryProceedEXT(intermediateValue324);
                            float intermediateValue342;
                            float intermediateValue344;
                            float intermediateValue346;
                            if (intermediateValue325)
                            {
                                float intermediateValue343;
                                float intermediateValue345;
                                float intermediateValue347;
                                float intermediateValue372 = exponentialValue5;
                                float intermediateValue373 = exponentialValue6;
                                float intermediateValue374 = exponentialValue7;
                                bool comparisonValue87;
                                for (;;)
                                {
                                    uint intermediateValue375 = rayQueryGetIntersectionTypeEXT(intermediateValue324, bool(0u));
                                    comparisonValue87 = intermediateValue375 == 0u;
                                    float branchMergedValue2;
                                    float branchMergedValue13;
                                    float branchMergedValue14;
                                    if (comparisonValue87)
                                    {
                                        vec2 intermediateValue394 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue324, bool(0u));
                                        vec2 intermediateValue395 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue324, bool(0u));
                                        float intermediateValue396 = rayQueryGetIntersectionTEXT(intermediateValue324, bool(0u));
                                        uint intermediateValue397 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue324, bool(0u));
                                        uint intermediateValue398 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue324, bool(0u));
                                        uint intermediateValue399 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue324, bool(0u));
                                        uint productValue448 = (intermediateValue399 * 76u) + 58u;
                                        uint productValue449 = (intermediateValue399 * 76u) + 61u;
                                        precise float sumValue315 = 1.0 - intermediateValue394.x;
                                        precise float sumValue316 = sumValue315 - intermediateValue395.y;
                                        uint bitwiseValue191 = (objectInstances_2.packedValues[(intermediateValue399 * 38u) + 25u] >> 2u) + (intermediateValue397 >> 1u);
                                        uint productValue450 = uint(objectInstances.packedValues[(intermediateValue399 * 76u) + 54u]) + 0u;
                                        bool comparisonValue91 = (intermediateValue397 & 1u) == 0u;
                                        uint comparisonValue92 = comparisonValue91 ? faceUvBuffersRW[nonuniformEXT(productValue450)].packedValues[bitwiseValue191].z : faceUvBuffersRW[nonuniformEXT(productValue450)].packedValues[bitwiseValue191].x;
                                        uint comparisonValue93 = comparisonValue91 ? faceUvBuffersRW[nonuniformEXT(productValue450)].packedValues[bitwiseValue191].y : faceUvBuffersRW[nonuniformEXT(productValue450)].packedValues[bitwiseValue191].w;
                                        uint comparisonValue94 = comparisonValue91 ? faceUvBuffersRW[nonuniformEXT(productValue450)].packedValues[bitwiseValue191].x : faceUvBuffersRW[nonuniformEXT(productValue450)].packedValues[bitwiseValue191].z;
                                        bool intermediateValue400 = int16_t(objectInstances.packedValues[productValue449]) < int16_t(0us);
                                        float intermediateValue464;
                                        float intermediateValue465;
                                        if (intermediateValue400)
                                        {
                                            uint bitwiseValue202 = comparisonValue94 >> 15u;
                                            precise float bitwiseValue203 = float(bitwiseValue202 & 1u) * 2.0;
                                            precise float sumValue331 = bitwiseValue203 + (-1.0);
                                            precise float bitwiseValue204 = float(comparisonValue94 >> 31u) * 2.0;
                                            precise float sumValue332 = bitwiseValue204 + (-1.0);
                                            precise float bitwiseValue205 = float((comparisonValue94 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue206 = float(bitwiseValue202 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue469 = sumValue331 * 3.0517578125e-05;
                                            precise float productValue470 = sumValue332 * 3.0517578125e-05;
                                            precise float sumValue333 = bitwiseValue205 + productValue469;
                                            precise float sumValue334 = bitwiseValue206 + productValue470;
                                            intermediateValue464 = sumValue333;
                                            intermediateValue465 = sumValue334;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue207 = float(comparisonValue94 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue208 = float(comparisonValue94 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue471 = bitwiseValue207 * 16384.0;
                                            precise float sumValue335 = productValue471 + 0.5;
                                            precise float productValue472 = bitwiseValue208 * 16384.0;
                                            precise float sumValue336 = productValue472 + 0.5;
                                            precise float productValue473 = floor(sumValue335) * 6.103515625e-05;
                                            precise float productValue474 = floor(sumValue336) * 6.103515625e-05;
                                            intermediateValue464 = productValue473;
                                            intermediateValue465 = productValue474;
                                        }
                                        precise float productValue506 = sumValue316 * intermediateValue464;
                                        precise float productValue507 = sumValue316 * intermediateValue465;
                                        precise float sumValue364 = productValue506 + 0.0;
                                        precise float sumValue365 = productValue507 + 0.0;
                                        float intermediateValue499;
                                        float intermediateValue500;
                                        if (intermediateValue400)
                                        {
                                            uint bitwiseValue246 = comparisonValue93 >> 15u;
                                            precise float bitwiseValue247 = float(bitwiseValue246 & 1u) * 2.0;
                                            precise float sumValue385 = bitwiseValue247 + (-1.0);
                                            precise float bitwiseValue248 = float(comparisonValue93 >> 31u) * 2.0;
                                            precise float sumValue386 = bitwiseValue248 + (-1.0);
                                            precise float bitwiseValue249 = float((comparisonValue93 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue250 = float(bitwiseValue246 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue532 = sumValue385 * 3.0517578125e-05;
                                            precise float productValue533 = sumValue386 * 3.0517578125e-05;
                                            precise float sumValue387 = bitwiseValue249 + productValue532;
                                            precise float sumValue388 = bitwiseValue250 + productValue533;
                                            intermediateValue499 = sumValue387;
                                            intermediateValue500 = sumValue388;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue251 = float(comparisonValue93 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue252 = float(comparisonValue93 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue534 = bitwiseValue251 * 16384.0;
                                            precise float sumValue389 = productValue534 + 0.5;
                                            precise float productValue535 = bitwiseValue252 * 16384.0;
                                            precise float sumValue390 = productValue535 + 0.5;
                                            precise float productValue536 = floor(sumValue389) * 6.103515625e-05;
                                            precise float productValue537 = floor(sumValue390) * 6.103515625e-05;
                                            intermediateValue499 = productValue536;
                                            intermediateValue500 = productValue537;
                                        }
                                        precise float productValue570 = intermediateValue394.x * intermediateValue499;
                                        precise float productValue571 = intermediateValue394.x * intermediateValue500;
                                        precise float sumValue423 = sumValue364 + productValue570;
                                        precise float sumValue424 = sumValue365 + productValue571;
                                        float intermediateValue512;
                                        float intermediateValue513;
                                        if (intermediateValue400)
                                        {
                                            uint bitwiseValue288 = comparisonValue92 >> 15u;
                                            precise float bitwiseValue289 = float(bitwiseValue288 & 1u) * 2.0;
                                            precise float sumValue435 = bitwiseValue289 + (-1.0);
                                            precise float bitwiseValue290 = float(comparisonValue92 >> 31u) * 2.0;
                                            precise float sumValue436 = bitwiseValue290 + (-1.0);
                                            precise float bitwiseValue291 = float((comparisonValue92 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue292 = float(bitwiseValue288 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue582 = sumValue435 * 3.0517578125e-05;
                                            precise float productValue583 = sumValue436 * 3.0517578125e-05;
                                            precise float sumValue437 = bitwiseValue291 + productValue582;
                                            precise float sumValue438 = bitwiseValue292 + productValue583;
                                            intermediateValue512 = sumValue437;
                                            intermediateValue513 = sumValue438;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue293 = float(comparisonValue92 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue294 = float(comparisonValue92 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue584 = bitwiseValue293 * 16384.0;
                                            precise float sumValue439 = productValue584 + 0.5;
                                            precise float productValue585 = bitwiseValue294 * 16384.0;
                                            precise float sumValue440 = productValue585 + 0.5;
                                            precise float productValue586 = floor(sumValue439) * 6.103515625e-05;
                                            precise float productValue587 = floor(sumValue440) * 6.103515625e-05;
                                            intermediateValue512 = productValue586;
                                            intermediateValue513 = productValue587;
                                        }
                                        precise float productValue618 = intermediateValue395.y * intermediateValue512;
                                        precise float productValue619 = intermediateValue395.y * intermediateValue513;
                                        precise float sumValue471 = sumValue423 + productValue618;
                                        precise float sumValue472 = sumValue424 + productValue619;
                                        precise float productValue620 = intermediateValue396 * 0.083333335816860198974609375;
                                        precise float sumValue473 = productValue620 + (-0.25);
                                        float intermediateValue524;
                                        float intermediateValue525;
                                        float intermediateValue526;
                                        float intermediateValue527;
                                        if (objectInstances.packedValues[productValue448] == 65535us)
                                        {
                                            intermediateValue524 = 1.0;
                                            intermediateValue525 = 1.0;
                                            intermediateValue526 = 1.0;
                                            intermediateValue527 = 1.0;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits56;
                                            if (objectInstances.packedValues[productValue448] > 4095us)
                                            {
                                                reinterpretedBits56 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits56 = uint(objectInstances.packedValues[productValue448]);
                                            }
                                            vec4 sampledTextureValue25 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits56 + 0u], defaultSampler)), vec2(sumValue471, sumValue472), spvNMin(sumValue473, 2.0));
                                            intermediateValue524 = sampledTextureValue25.x;
                                            intermediateValue525 = sampledTextureValue25.y;
                                            intermediateValue526 = sampledTextureValue25.z;
                                            intermediateValue527 = sampledTextureValue25.w;
                                        }
                                        float intermediateValue544;
                                        float intermediateValue545;
                                        float intermediateValue546;
                                        if (intermediateValue398 == 2u)
                                        {
                                            float branchMergedValue42;
                                            float branchMergedValue69;
                                            float branchMergedValue70;
                                            if ((objectInstances.packedValues[productValue449] & 128us) == 0us)
                                            {
                                                float intermediateValue564;
                                                if ((objectInstances.packedValues[productValue449] & 2048us) == 0us)
                                                {
                                                    intermediateValue564 = intermediateValue527;
                                                }
                                                else
                                                {
                                                    precise float productValue667 = intermediateValue527 * 2.0;
                                                    precise float sumValue524 = productValue667 + (-1.0);
                                                    intermediateValue564 = spvNClamp(sumValue524, 0.0, 1.0);
                                                }
                                                precise float sumValue521 = 0.0 - intermediateValue524;
                                                precise float sumValue522 = 0.0 - intermediateValue525;
                                                precise float sumValue523 = 0.0 - intermediateValue526;
                                                precise float productValue664 = sumValue521 * intermediateValue564;
                                                precise float productValue665 = sumValue522 * intermediateValue564;
                                                precise float productValue666 = sumValue523 * intermediateValue564;
                                                precise float sumValue509 = intermediateValue524 + productValue664;
                                                precise float sumValue510 = intermediateValue525 + productValue665;
                                                precise float sumValue511 = intermediateValue526 + productValue666;
                                                branchMergedValue42 = sumValue511;
                                                branchMergedValue69 = sumValue510;
                                                branchMergedValue70 = sumValue509;
                                            }
                                            else
                                            {
                                                branchMergedValue42 = 0.33399999141693115234375;
                                                branchMergedValue69 = 0.33399999141693115234375;
                                                branchMergedValue70 = 0.33399999141693115234375;
                                            }
                                            intermediateValue544 = branchMergedValue70;
                                            intermediateValue545 = branchMergedValue69;
                                            intermediateValue546 = branchMergedValue42;
                                        }
                                        else
                                        {
                                            precise float sumValue499 = 1.0 - intermediateValue527;
                                            intermediateValue544 = sumValue499;
                                            intermediateValue545 = sumValue499;
                                            intermediateValue546 = sumValue499;
                                        }
                                        precise float productValue652 = intermediateValue372 * intermediateValue544;
                                        precise float productValue653 = intermediateValue373 * intermediateValue545;
                                        precise float productValue654 = intermediateValue374 * intermediateValue546;
                                        float intermediateValue401;
                                        float intermediateValue402;
                                        float intermediateValue403;
                                        bool intermediateValue565;
                                        if (!(dot(vec3(productValue652, productValue653, productValue654), vec3(1.0)) <= 0.00999999977648258209228515625))
                                        {
                                            intermediateValue565 = false;
                                            intermediateValue401 = productValue652;
                                            intermediateValue402 = productValue653;
                                            intermediateValue403 = productValue654;
                                        }
                                        else
                                        {
                                            intermediateValue565 = true;
                                            intermediateValue401 = 0.0;
                                            intermediateValue402 = 0.0;
                                            intermediateValue403 = 0.0;
                                        }
                                        float branchMergedValue83;
                                        float branchMergedValue93;
                                        float branchMergedValue94;
                                        if (intermediateValue565)
                                        {
                                            rayQueryConfirmIntersectionEXT(intermediateValue324);
                                            branchMergedValue83 = intermediateValue403;
                                            branchMergedValue93 = intermediateValue402;
                                            branchMergedValue94 = intermediateValue401;
                                        }
                                        else
                                        {
                                            branchMergedValue83 = intermediateValue403;
                                            branchMergedValue93 = intermediateValue402;
                                            branchMergedValue94 = intermediateValue401;
                                        }
                                        branchMergedValue2 = branchMergedValue83;
                                        branchMergedValue13 = branchMergedValue93;
                                        branchMergedValue14 = branchMergedValue94;
                                    }
                                    else
                                    {
                                        branchMergedValue2 = intermediateValue374;
                                        branchMergedValue13 = intermediateValue373;
                                        branchMergedValue14 = intermediateValue372;
                                    }
                                    intermediateValue347 = branchMergedValue2;
                                    intermediateValue345 = branchMergedValue13;
                                    intermediateValue343 = branchMergedValue14;
                                    bool intermediateValue404 = rayQueryProceedEXT(intermediateValue324);
                                    if (intermediateValue404)
                                    {
                                        intermediateValue372 = intermediateValue343;
                                        intermediateValue373 = intermediateValue345;
                                        intermediateValue374 = intermediateValue347;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue342 = intermediateValue343;
                                intermediateValue344 = intermediateValue345;
                                intermediateValue346 = intermediateValue347;
                            }
                            else
                            {
                                intermediateValue342 = exponentialValue5;
                                intermediateValue344 = exponentialValue6;
                                intermediateValue346 = exponentialValue7;
                            }
                            uint intermediateValue348 = rayQueryGetIntersectionTypeEXT(intermediateValue324, bool(1u));
                            bool comparisonValue83 = intermediateValue348 == 1u;
                            float comparisonValue65 = comparisonValue83 ? 0.0 : intermediateValue342;
                            float comparisonValue66 = comparisonValue83 ? 0.0 : intermediateValue344;
                            float comparisonValue67 = comparisonValue83 ? 0.0 : intermediateValue346;
                            float branchMergedValue113;
                            float branchMergedValue120;
                            float branchMergedValue121;
                            if (dot(vec3(comparisonValue65, comparisonValue66, comparisonValue67), vec3(1.0)) > 0.00999999977648258209228515625)
                            {
                                rayQueryInitializeEXT(intermediateValue376, SceneBVH, 512u, 22u, vec3(sumValue259, fma(ViewCB.packedValues[53u].y, intermediateValue310, reinterpretedBits41), sumValue260), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                                bool intermediateValue377 = rayQueryProceedEXT(intermediateValue376);
                                float intermediateValue405;
                                float intermediateValue407;
                                float intermediateValue409;
                                if (intermediateValue377)
                                {
                                    float intermediateValue406;
                                    float intermediateValue408;
                                    float intermediateValue410;
                                    float intermediateValue454 = comparisonValue65;
                                    float intermediateValue455 = comparisonValue66;
                                    float intermediateValue456 = comparisonValue67;
                                    bool comparisonValue109;
                                    for (;;)
                                    {
                                        uint intermediateValue457 = rayQueryGetIntersectionTypeEXT(intermediateValue376, bool(0u));
                                        comparisonValue109 = intermediateValue457 == 0u;
                                        float branchMergedValue6;
                                        float branchMergedValue21;
                                        float branchMergedValue22;
                                        if (comparisonValue109)
                                        {
                                            vec2 intermediateValue466 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue376, bool(0u));
                                            vec2 intermediateValue467 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue376, bool(0u));
                                            float intermediateValue468 = rayQueryGetIntersectionTEXT(intermediateValue376, bool(0u));
                                            uint intermediateValue469 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue376, bool(0u));
                                            uint intermediateValue470 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue376, bool(0u));
                                            uint intermediateValue471 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue376, bool(0u));
                                            uint productValue508 = (intermediateValue471 * 76u) + 58u;
                                            uint productValue509 = (intermediateValue471 * 76u) + 61u;
                                            precise float sumValue366 = 1.0 - intermediateValue466.x;
                                            precise float sumValue367 = sumValue366 - intermediateValue467.y;
                                            uint bitwiseValue237 = (objectInstances_2.packedValues[(intermediateValue471 * 38u) + 25u] >> 2u) + (intermediateValue469 >> 1u);
                                            uint productValue510 = uint(objectInstances.packedValues[(intermediateValue471 * 76u) + 54u]) + 0u;
                                            bool comparisonValue111 = (intermediateValue469 & 1u) == 0u;
                                            uint comparisonValue112 = comparisonValue111 ? faceUvBuffersRW[nonuniformEXT(productValue510)].packedValues[bitwiseValue237].z : faceUvBuffersRW[nonuniformEXT(productValue510)].packedValues[bitwiseValue237].x;
                                            uint comparisonValue113 = comparisonValue111 ? faceUvBuffersRW[nonuniformEXT(productValue510)].packedValues[bitwiseValue237].y : faceUvBuffersRW[nonuniformEXT(productValue510)].packedValues[bitwiseValue237].w;
                                            uint comparisonValue114 = comparisonValue111 ? faceUvBuffersRW[nonuniformEXT(productValue510)].packedValues[bitwiseValue237].x : faceUvBuffersRW[nonuniformEXT(productValue510)].packedValues[bitwiseValue237].z;
                                            bool intermediateValue472 = int16_t(objectInstances.packedValues[productValue509]) < int16_t(0us);
                                            float intermediateValue501;
                                            float intermediateValue502;
                                            if (intermediateValue472)
                                            {
                                                uint bitwiseValue253 = comparisonValue114 >> 15u;
                                                precise float bitwiseValue254 = float(bitwiseValue253 & 1u) * 2.0;
                                                precise float sumValue391 = bitwiseValue254 + (-1.0);
                                                precise float bitwiseValue255 = float(comparisonValue114 >> 31u) * 2.0;
                                                precise float sumValue392 = bitwiseValue255 + (-1.0);
                                                precise float bitwiseValue256 = float((comparisonValue114 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue257 = float(bitwiseValue253 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue538 = sumValue391 * 3.0517578125e-05;
                                                precise float productValue539 = sumValue392 * 3.0517578125e-05;
                                                precise float sumValue393 = bitwiseValue256 + productValue538;
                                                precise float sumValue394 = bitwiseValue257 + productValue539;
                                                intermediateValue501 = sumValue393;
                                                intermediateValue502 = sumValue394;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue258 = float(comparisonValue114 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue259 = float(comparisonValue114 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue540 = bitwiseValue258 * 16384.0;
                                                precise float sumValue395 = productValue540 + 0.5;
                                                precise float productValue541 = bitwiseValue259 * 16384.0;
                                                precise float sumValue396 = productValue541 + 0.5;
                                                precise float productValue542 = floor(sumValue395) * 6.103515625e-05;
                                                precise float productValue543 = floor(sumValue396) * 6.103515625e-05;
                                                intermediateValue501 = productValue542;
                                                intermediateValue502 = productValue543;
                                            }
                                            precise float productValue572 = sumValue367 * intermediateValue501;
                                            precise float productValue573 = sumValue367 * intermediateValue502;
                                            precise float sumValue425 = productValue572 + 0.0;
                                            precise float sumValue426 = productValue573 + 0.0;
                                            float intermediateValue514;
                                            float intermediateValue515;
                                            if (intermediateValue472)
                                            {
                                                uint bitwiseValue295 = comparisonValue113 >> 15u;
                                                precise float bitwiseValue296 = float(bitwiseValue295 & 1u) * 2.0;
                                                precise float sumValue441 = bitwiseValue296 + (-1.0);
                                                precise float bitwiseValue297 = float(comparisonValue113 >> 31u) * 2.0;
                                                precise float sumValue442 = bitwiseValue297 + (-1.0);
                                                precise float bitwiseValue298 = float((comparisonValue113 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue299 = float(bitwiseValue295 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue588 = sumValue441 * 3.0517578125e-05;
                                                precise float productValue589 = sumValue442 * 3.0517578125e-05;
                                                precise float sumValue443 = bitwiseValue298 + productValue588;
                                                precise float sumValue444 = bitwiseValue299 + productValue589;
                                                intermediateValue514 = sumValue443;
                                                intermediateValue515 = sumValue444;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue300 = float(comparisonValue113 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue301 = float(comparisonValue113 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue590 = bitwiseValue300 * 16384.0;
                                                precise float sumValue445 = productValue590 + 0.5;
                                                precise float productValue591 = bitwiseValue301 * 16384.0;
                                                precise float sumValue446 = productValue591 + 0.5;
                                                precise float productValue592 = floor(sumValue445) * 6.103515625e-05;
                                                precise float productValue593 = floor(sumValue446) * 6.103515625e-05;
                                                intermediateValue514 = productValue592;
                                                intermediateValue515 = productValue593;
                                            }
                                            precise float productValue621 = intermediateValue466.x * intermediateValue514;
                                            precise float productValue622 = intermediateValue466.x * intermediateValue515;
                                            precise float sumValue474 = sumValue425 + productValue621;
                                            precise float sumValue475 = sumValue426 + productValue622;
                                            float intermediateValue540;
                                            float intermediateValue541;
                                            if (intermediateValue472)
                                            {
                                                uint bitwiseValue330 = comparisonValue112 >> 15u;
                                                precise float bitwiseValue331 = float(bitwiseValue330 & 1u) * 2.0;
                                                precise float sumValue487 = bitwiseValue331 + (-1.0);
                                                precise float bitwiseValue332 = float(comparisonValue112 >> 31u) * 2.0;
                                                precise float sumValue488 = bitwiseValue332 + (-1.0);
                                                precise float bitwiseValue333 = float((comparisonValue112 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue334 = float(bitwiseValue330 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue634 = sumValue487 * 3.0517578125e-05;
                                                precise float productValue635 = sumValue488 * 3.0517578125e-05;
                                                precise float sumValue489 = bitwiseValue333 + productValue634;
                                                precise float sumValue490 = bitwiseValue334 + productValue635;
                                                intermediateValue540 = sumValue489;
                                                intermediateValue541 = sumValue490;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue335 = float(comparisonValue112 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue336 = float(comparisonValue112 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue636 = bitwiseValue335 * 16384.0;
                                                precise float sumValue491 = productValue636 + 0.5;
                                                precise float productValue637 = bitwiseValue336 * 16384.0;
                                                precise float sumValue492 = productValue637 + 0.5;
                                                precise float productValue638 = floor(sumValue491) * 6.103515625e-05;
                                                precise float productValue639 = floor(sumValue492) * 6.103515625e-05;
                                                intermediateValue540 = productValue638;
                                                intermediateValue541 = productValue639;
                                            }
                                            precise float productValue646 = intermediateValue467.y * intermediateValue540;
                                            precise float productValue647 = intermediateValue467.y * intermediateValue541;
                                            precise float sumValue500 = sumValue474 + productValue646;
                                            precise float sumValue501 = sumValue475 + productValue647;
                                            precise float productValue648 = intermediateValue468 * 0.083333335816860198974609375;
                                            precise float sumValue502 = productValue648 + (-0.25);
                                            float intermediateValue547;
                                            float intermediateValue548;
                                            float intermediateValue549;
                                            float intermediateValue550;
                                            if (objectInstances.packedValues[productValue508] == 65535us)
                                            {
                                                intermediateValue547 = 1.0;
                                                intermediateValue548 = 1.0;
                                                intermediateValue549 = 1.0;
                                                intermediateValue550 = 1.0;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits60;
                                                if (objectInstances.packedValues[productValue508] > 4095us)
                                                {
                                                    reinterpretedBits60 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits60 = uint(objectInstances.packedValues[productValue508]);
                                                }
                                                vec4 sampledTextureValue29 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits60 + 0u], defaultSampler)), vec2(sumValue500, sumValue501), spvNMin(sumValue502, 2.0));
                                                intermediateValue547 = sampledTextureValue29.x;
                                                intermediateValue548 = sampledTextureValue29.y;
                                                intermediateValue549 = sampledTextureValue29.z;
                                                intermediateValue550 = sampledTextureValue29.w;
                                            }
                                            float intermediateValue572;
                                            float intermediateValue573;
                                            float intermediateValue574;
                                            if (intermediateValue470 == 2u)
                                            {
                                                float branchMergedValue46;
                                                float branchMergedValue77;
                                                float branchMergedValue78;
                                                if ((objectInstances.packedValues[productValue509] & 128us) == 0us)
                                                {
                                                    float intermediateValue578;
                                                    if ((objectInstances.packedValues[productValue509] & 2048us) == 0us)
                                                    {
                                                        intermediateValue578 = intermediateValue550;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue689 = intermediateValue550 * 2.0;
                                                        precise float sumValue548 = productValue689 + (-1.0);
                                                        intermediateValue578 = spvNClamp(sumValue548, 0.0, 1.0);
                                                    }
                                                    precise float sumValue545 = 0.0 - intermediateValue547;
                                                    precise float sumValue546 = 0.0 - intermediateValue548;
                                                    precise float sumValue547 = 0.0 - intermediateValue549;
                                                    precise float productValue686 = sumValue545 * intermediateValue578;
                                                    precise float productValue687 = sumValue546 * intermediateValue578;
                                                    precise float productValue688 = sumValue547 * intermediateValue578;
                                                    precise float sumValue539 = intermediateValue547 + productValue686;
                                                    precise float sumValue540 = intermediateValue548 + productValue687;
                                                    precise float sumValue541 = intermediateValue549 + productValue688;
                                                    branchMergedValue46 = sumValue541;
                                                    branchMergedValue77 = sumValue540;
                                                    branchMergedValue78 = sumValue539;
                                                }
                                                else
                                                {
                                                    branchMergedValue46 = 0.33399999141693115234375;
                                                    branchMergedValue77 = 0.33399999141693115234375;
                                                    branchMergedValue78 = 0.33399999141693115234375;
                                                }
                                                intermediateValue572 = branchMergedValue78;
                                                intermediateValue573 = branchMergedValue77;
                                                intermediateValue574 = branchMergedValue46;
                                            }
                                            else
                                            {
                                                precise float sumValue525 = 1.0 - intermediateValue550;
                                                intermediateValue572 = sumValue525;
                                                intermediateValue573 = sumValue525;
                                                intermediateValue574 = sumValue525;
                                            }
                                            precise float productValue680 = intermediateValue454 * intermediateValue572;
                                            precise float productValue681 = intermediateValue455 * intermediateValue573;
                                            precise float productValue682 = intermediateValue456 * intermediateValue574;
                                            float intermediateValue473;
                                            float intermediateValue474;
                                            float intermediateValue475;
                                            bool intermediateValue579;
                                            if (!(dot(vec3(productValue680, productValue681, productValue682), vec3(1.0)) <= 0.00999999977648258209228515625))
                                            {
                                                intermediateValue579 = false;
                                                intermediateValue473 = productValue680;
                                                intermediateValue474 = productValue681;
                                                intermediateValue475 = productValue682;
                                            }
                                            else
                                            {
                                                intermediateValue579 = true;
                                                intermediateValue473 = 0.0;
                                                intermediateValue474 = 0.0;
                                                intermediateValue475 = 0.0;
                                            }
                                            float branchMergedValue87;
                                            float branchMergedValue101;
                                            float branchMergedValue102;
                                            if (intermediateValue579)
                                            {
                                                rayQueryConfirmIntersectionEXT(intermediateValue376);
                                                branchMergedValue87 = intermediateValue475;
                                                branchMergedValue101 = intermediateValue474;
                                                branchMergedValue102 = intermediateValue473;
                                            }
                                            else
                                            {
                                                branchMergedValue87 = intermediateValue475;
                                                branchMergedValue101 = intermediateValue474;
                                                branchMergedValue102 = intermediateValue473;
                                            }
                                            branchMergedValue6 = branchMergedValue87;
                                            branchMergedValue21 = branchMergedValue101;
                                            branchMergedValue22 = branchMergedValue102;
                                        }
                                        else
                                        {
                                            branchMergedValue6 = intermediateValue456;
                                            branchMergedValue21 = intermediateValue455;
                                            branchMergedValue22 = intermediateValue454;
                                        }
                                        intermediateValue410 = branchMergedValue6;
                                        intermediateValue408 = branchMergedValue21;
                                        intermediateValue406 = branchMergedValue22;
                                        bool intermediateValue476 = rayQueryProceedEXT(intermediateValue376);
                                        if (intermediateValue476)
                                        {
                                            intermediateValue454 = intermediateValue406;
                                            intermediateValue455 = intermediateValue408;
                                            intermediateValue456 = intermediateValue410;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue405 = intermediateValue406;
                                    intermediateValue407 = intermediateValue408;
                                    intermediateValue409 = intermediateValue410;
                                }
                                else
                                {
                                    intermediateValue405 = comparisonValue65;
                                    intermediateValue407 = comparisonValue66;
                                    intermediateValue409 = comparisonValue67;
                                }
                                uint intermediateValue411 = rayQueryGetIntersectionTypeEXT(intermediateValue376, bool(1u));
                                bool comparisonValue95 = intermediateValue411 == 1u;
                                branchMergedValue113 = comparisonValue95 ? 0.0 : intermediateValue407;
                                branchMergedValue120 = comparisonValue95 ? 0.0 : intermediateValue405;
                                branchMergedValue121 = comparisonValue95 ? 0.0 : intermediateValue409;
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
                            rayQueryInitializeEXT(intermediateValue326, SceneBVH, 512u, 22u, vec3(reinterpretedBits40, reinterpretedBits41, reinterpretedBits42), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                            bool intermediateValue327 = rayQueryProceedEXT(intermediateValue326);
                            float intermediateValue349;
                            float intermediateValue351;
                            float intermediateValue353;
                            if (intermediateValue327)
                            {
                                float intermediateValue350;
                                float intermediateValue352;
                                float intermediateValue354;
                                float intermediateValue378 = 1.0;
                                float intermediateValue379 = 1.0;
                                float intermediateValue380 = 1.0;
                                bool comparisonValue88;
                                for (;;)
                                {
                                    uint intermediateValue381 = rayQueryGetIntersectionTypeEXT(intermediateValue326, bool(0u));
                                    comparisonValue88 = intermediateValue381 == 0u;
                                    float branchMergedValue3;
                                    float branchMergedValue15;
                                    float branchMergedValue16;
                                    if (comparisonValue88)
                                    {
                                        vec2 intermediateValue412 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue326, bool(0u));
                                        vec2 intermediateValue413 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue326, bool(0u));
                                        float intermediateValue414 = rayQueryGetIntersectionTEXT(intermediateValue326, bool(0u));
                                        uint intermediateValue415 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue326, bool(0u));
                                        uint intermediateValue416 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue326, bool(0u));
                                        uint intermediateValue417 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue326, bool(0u));
                                        uint productValue451 = (intermediateValue417 * 76u) + 58u;
                                        uint productValue452 = (intermediateValue417 * 76u) + 61u;
                                        precise float sumValue317 = 1.0 - intermediateValue412.x;
                                        precise float sumValue318 = sumValue317 - intermediateValue413.y;
                                        uint bitwiseValue192 = (objectInstances_2.packedValues[(intermediateValue417 * 38u) + 25u] >> 2u) + (intermediateValue415 >> 1u);
                                        uint productValue453 = uint(objectInstances.packedValues[(intermediateValue417 * 76u) + 54u]) + 0u;
                                        bool comparisonValue96 = (intermediateValue415 & 1u) == 0u;
                                        uint comparisonValue97 = comparisonValue96 ? faceUvBuffersRW[nonuniformEXT(productValue453)].packedValues[bitwiseValue192].z : faceUvBuffersRW[nonuniformEXT(productValue453)].packedValues[bitwiseValue192].x;
                                        uint comparisonValue98 = comparisonValue96 ? faceUvBuffersRW[nonuniformEXT(productValue453)].packedValues[bitwiseValue192].y : faceUvBuffersRW[nonuniformEXT(productValue453)].packedValues[bitwiseValue192].w;
                                        uint comparisonValue99 = comparisonValue96 ? faceUvBuffersRW[nonuniformEXT(productValue453)].packedValues[bitwiseValue192].x : faceUvBuffersRW[nonuniformEXT(productValue453)].packedValues[bitwiseValue192].z;
                                        bool intermediateValue418 = int16_t(objectInstances.packedValues[productValue452]) < int16_t(0us);
                                        float intermediateValue477;
                                        float intermediateValue478;
                                        if (intermediateValue418)
                                        {
                                            uint bitwiseValue209 = comparisonValue99 >> 15u;
                                            precise float bitwiseValue210 = float(bitwiseValue209 & 1u) * 2.0;
                                            precise float sumValue337 = bitwiseValue210 + (-1.0);
                                            precise float bitwiseValue211 = float(comparisonValue99 >> 31u) * 2.0;
                                            precise float sumValue338 = bitwiseValue211 + (-1.0);
                                            precise float bitwiseValue212 = float((comparisonValue99 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue213 = float(bitwiseValue209 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue475 = sumValue337 * 3.0517578125e-05;
                                            precise float productValue476 = sumValue338 * 3.0517578125e-05;
                                            precise float sumValue339 = bitwiseValue212 + productValue475;
                                            precise float sumValue340 = bitwiseValue213 + productValue476;
                                            intermediateValue477 = sumValue339;
                                            intermediateValue478 = sumValue340;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue214 = float(comparisonValue99 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue215 = float(comparisonValue99 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue477 = bitwiseValue214 * 16384.0;
                                            precise float sumValue341 = productValue477 + 0.5;
                                            precise float productValue478 = bitwiseValue215 * 16384.0;
                                            precise float sumValue342 = productValue478 + 0.5;
                                            precise float productValue479 = floor(sumValue341) * 6.103515625e-05;
                                            precise float productValue480 = floor(sumValue342) * 6.103515625e-05;
                                            intermediateValue477 = productValue479;
                                            intermediateValue478 = productValue480;
                                        }
                                        precise float productValue511 = sumValue318 * intermediateValue477;
                                        precise float productValue512 = sumValue318 * intermediateValue478;
                                        precise float sumValue368 = productValue511 + 0.0;
                                        precise float sumValue369 = productValue512 + 0.0;
                                        float intermediateValue503;
                                        float intermediateValue504;
                                        if (intermediateValue418)
                                        {
                                            uint bitwiseValue260 = comparisonValue98 >> 15u;
                                            precise float bitwiseValue261 = float(bitwiseValue260 & 1u) * 2.0;
                                            precise float sumValue397 = bitwiseValue261 + (-1.0);
                                            precise float bitwiseValue262 = float(comparisonValue98 >> 31u) * 2.0;
                                            precise float sumValue398 = bitwiseValue262 + (-1.0);
                                            precise float bitwiseValue263 = float((comparisonValue98 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue264 = float(bitwiseValue260 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue544 = sumValue397 * 3.0517578125e-05;
                                            precise float productValue545 = sumValue398 * 3.0517578125e-05;
                                            precise float sumValue399 = bitwiseValue263 + productValue544;
                                            precise float sumValue400 = bitwiseValue264 + productValue545;
                                            intermediateValue503 = sumValue399;
                                            intermediateValue504 = sumValue400;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue265 = float(comparisonValue98 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue266 = float(comparisonValue98 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue546 = bitwiseValue265 * 16384.0;
                                            precise float sumValue401 = productValue546 + 0.5;
                                            precise float productValue547 = bitwiseValue266 * 16384.0;
                                            precise float sumValue402 = productValue547 + 0.5;
                                            precise float productValue548 = floor(sumValue401) * 6.103515625e-05;
                                            precise float productValue549 = floor(sumValue402) * 6.103515625e-05;
                                            intermediateValue503 = productValue548;
                                            intermediateValue504 = productValue549;
                                        }
                                        precise float productValue574 = intermediateValue412.x * intermediateValue503;
                                        precise float productValue575 = intermediateValue412.x * intermediateValue504;
                                        precise float sumValue427 = sumValue368 + productValue574;
                                        precise float sumValue428 = sumValue369 + productValue575;
                                        float intermediateValue516;
                                        float intermediateValue517;
                                        if (intermediateValue418)
                                        {
                                            uint bitwiseValue302 = comparisonValue97 >> 15u;
                                            precise float bitwiseValue303 = float(bitwiseValue302 & 1u) * 2.0;
                                            precise float sumValue447 = bitwiseValue303 + (-1.0);
                                            precise float bitwiseValue304 = float(comparisonValue97 >> 31u) * 2.0;
                                            precise float sumValue448 = bitwiseValue304 + (-1.0);
                                            precise float bitwiseValue305 = float((comparisonValue97 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue306 = float(bitwiseValue302 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue594 = sumValue447 * 3.0517578125e-05;
                                            precise float productValue595 = sumValue448 * 3.0517578125e-05;
                                            precise float sumValue449 = bitwiseValue305 + productValue594;
                                            precise float sumValue450 = bitwiseValue306 + productValue595;
                                            intermediateValue516 = sumValue449;
                                            intermediateValue517 = sumValue450;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue307 = float(comparisonValue97 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue308 = float(comparisonValue97 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue596 = bitwiseValue307 * 16384.0;
                                            precise float sumValue451 = productValue596 + 0.5;
                                            precise float productValue597 = bitwiseValue308 * 16384.0;
                                            precise float sumValue452 = productValue597 + 0.5;
                                            precise float productValue598 = floor(sumValue451) * 6.103515625e-05;
                                            precise float productValue599 = floor(sumValue452) * 6.103515625e-05;
                                            intermediateValue516 = productValue598;
                                            intermediateValue517 = productValue599;
                                        }
                                        precise float productValue623 = intermediateValue413.y * intermediateValue516;
                                        precise float productValue624 = intermediateValue413.y * intermediateValue517;
                                        precise float sumValue476 = sumValue427 + productValue623;
                                        precise float sumValue477 = sumValue428 + productValue624;
                                        precise float productValue625 = intermediateValue414 * 0.083333335816860198974609375;
                                        precise float sumValue478 = productValue625 + (-0.25);
                                        float intermediateValue528;
                                        float intermediateValue529;
                                        float intermediateValue530;
                                        float intermediateValue531;
                                        if (objectInstances.packedValues[productValue451] == 65535us)
                                        {
                                            intermediateValue528 = 1.0;
                                            intermediateValue529 = 1.0;
                                            intermediateValue530 = 1.0;
                                            intermediateValue531 = 1.0;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits57;
                                            if (objectInstances.packedValues[productValue451] > 4095us)
                                            {
                                                reinterpretedBits57 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits57 = uint(objectInstances.packedValues[productValue451]);
                                            }
                                            vec4 sampledTextureValue26 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits57 + 0u], defaultSampler)), vec2(sumValue476, sumValue477), spvNMin(sumValue478, 2.0));
                                            intermediateValue528 = sampledTextureValue26.x;
                                            intermediateValue529 = sampledTextureValue26.y;
                                            intermediateValue530 = sampledTextureValue26.z;
                                            intermediateValue531 = sampledTextureValue26.w;
                                        }
                                        float intermediateValue551;
                                        float intermediateValue552;
                                        float intermediateValue553;
                                        if (intermediateValue416 == 2u)
                                        {
                                            float branchMergedValue43;
                                            float branchMergedValue71;
                                            float branchMergedValue72;
                                            if ((objectInstances.packedValues[productValue452] & 128us) == 0us)
                                            {
                                                float intermediateValue566;
                                                if ((objectInstances.packedValues[productValue452] & 2048us) == 0us)
                                                {
                                                    intermediateValue566 = intermediateValue531;
                                                }
                                                else
                                                {
                                                    precise float productValue671 = intermediateValue531 * 2.0;
                                                    precise float sumValue529 = productValue671 + (-1.0);
                                                    intermediateValue566 = spvNClamp(sumValue529, 0.0, 1.0);
                                                }
                                                precise float sumValue526 = 0.0 - intermediateValue528;
                                                precise float sumValue527 = 0.0 - intermediateValue529;
                                                precise float sumValue528 = 0.0 - intermediateValue530;
                                                precise float productValue668 = sumValue526 * intermediateValue566;
                                                precise float productValue669 = sumValue527 * intermediateValue566;
                                                precise float productValue670 = sumValue528 * intermediateValue566;
                                                precise float sumValue512 = intermediateValue528 + productValue668;
                                                precise float sumValue513 = intermediateValue529 + productValue669;
                                                precise float sumValue514 = intermediateValue530 + productValue670;
                                                branchMergedValue43 = sumValue514;
                                                branchMergedValue71 = sumValue513;
                                                branchMergedValue72 = sumValue512;
                                            }
                                            else
                                            {
                                                branchMergedValue43 = 0.33399999141693115234375;
                                                branchMergedValue71 = 0.33399999141693115234375;
                                                branchMergedValue72 = 0.33399999141693115234375;
                                            }
                                            intermediateValue551 = branchMergedValue72;
                                            intermediateValue552 = branchMergedValue71;
                                            intermediateValue553 = branchMergedValue43;
                                        }
                                        else
                                        {
                                            precise float sumValue503 = 1.0 - intermediateValue531;
                                            intermediateValue551 = sumValue503;
                                            intermediateValue552 = sumValue503;
                                            intermediateValue553 = sumValue503;
                                        }
                                        precise float productValue655 = intermediateValue378 * intermediateValue551;
                                        precise float productValue656 = intermediateValue379 * intermediateValue552;
                                        precise float productValue657 = intermediateValue380 * intermediateValue553;
                                        float intermediateValue419;
                                        float intermediateValue420;
                                        float intermediateValue421;
                                        bool intermediateValue567;
                                        if (!(dot(vec3(productValue655, productValue656, productValue657), vec3(1.0)) <= 0.00999999977648258209228515625))
                                        {
                                            intermediateValue567 = false;
                                            intermediateValue419 = productValue655;
                                            intermediateValue420 = productValue656;
                                            intermediateValue421 = productValue657;
                                        }
                                        else
                                        {
                                            intermediateValue567 = true;
                                            intermediateValue419 = 0.0;
                                            intermediateValue420 = 0.0;
                                            intermediateValue421 = 0.0;
                                        }
                                        float branchMergedValue84;
                                        float branchMergedValue95;
                                        float branchMergedValue96;
                                        if (intermediateValue567)
                                        {
                                            rayQueryConfirmIntersectionEXT(intermediateValue326);
                                            branchMergedValue84 = intermediateValue421;
                                            branchMergedValue95 = intermediateValue420;
                                            branchMergedValue96 = intermediateValue419;
                                        }
                                        else
                                        {
                                            branchMergedValue84 = intermediateValue421;
                                            branchMergedValue95 = intermediateValue420;
                                            branchMergedValue96 = intermediateValue419;
                                        }
                                        branchMergedValue3 = branchMergedValue84;
                                        branchMergedValue15 = branchMergedValue95;
                                        branchMergedValue16 = branchMergedValue96;
                                    }
                                    else
                                    {
                                        branchMergedValue3 = intermediateValue380;
                                        branchMergedValue15 = intermediateValue379;
                                        branchMergedValue16 = intermediateValue378;
                                    }
                                    intermediateValue354 = branchMergedValue3;
                                    intermediateValue352 = branchMergedValue15;
                                    intermediateValue350 = branchMergedValue16;
                                    bool intermediateValue422 = rayQueryProceedEXT(intermediateValue326);
                                    if (intermediateValue422)
                                    {
                                        intermediateValue378 = intermediateValue350;
                                        intermediateValue379 = intermediateValue352;
                                        intermediateValue380 = intermediateValue354;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue349 = intermediateValue350;
                                intermediateValue351 = intermediateValue352;
                                intermediateValue353 = intermediateValue354;
                            }
                            else
                            {
                                intermediateValue349 = 1.0;
                                intermediateValue351 = 1.0;
                                intermediateValue353 = 1.0;
                            }
                            uint intermediateValue355 = rayQueryGetIntersectionTypeEXT(intermediateValue326, bool(1u));
                            bool comparisonValue84 = intermediateValue355 == 1u;
                            branchMergedValue40 = comparisonValue84 ? 0.0 : intermediateValue351;
                            branchMergedValue65 = comparisonValue84 ? 0.0 : intermediateValue349;
                            branchMergedValue66 = comparisonValue84 ? 0.0 : intermediateValue353;
                        }
                        intermediateValue289 = branchMergedValue65;
                        intermediateValue290 = branchMergedValue40;
                        intermediateValue291 = branchMergedValue66;
                    }
                    float branchMergedValue107;
                    float branchMergedValue115;
                    float branchMergedValue116;
                    float branchMergedValue117;
                    if (dot(vec3(intermediateValue289, intermediateValue290, intermediateValue291), vec3(1.0)) > 0.0)
                    {
                        float sumValue243 = (-0.0) - sumValue14;
                        float sumValue244 = (-0.0) - sumValue16;
                        float sumValue245 = (-0.0) - sumValue18;
                        float intermediateValue303 = spvNMax(spvNMax(productValue315, 0.25), 0.00999999977648258209228515625);
                        float sumValue246 = ViewCB.packedValues[52u].x - sumValue14;
                        float sumValue247 = ViewCB.packedValues[52u].y - sumValue16;
                        float sumValue248 = ViewCB.packedValues[52u].z - sumValue18;
                        float inverseLengthValue7 = inversesqrt(dot(vec3(sumValue246, sumValue247, sumValue248), vec3(sumValue246, sumValue247, sumValue248)));
                        float productValue356 = inverseLengthValue7 * sumValue246;
                        float productValue357 = inverseLengthValue7 * sumValue247;
                        float productValue358 = inverseLengthValue7 * sumValue248;
                        float dotProductValue10 = spvNClamp(dot(vec3(comparisonValue59, comparisonValue60, comparisonValue61), vec3(ViewCB.packedValues[52u].xyz)), 0.0, 1.0);
                        float dotProductValue11 = spvNClamp(dot(vec3(comparisonValue59, comparisonValue60, comparisonValue61), vec3(sumValue243, sumValue244, sumValue245)), 0.0, 1.0);
                        float dotProductValue12 = spvNClamp(dot(vec3(comparisonValue59, comparisonValue60, comparisonValue61), vec3(productValue356, productValue357, productValue358)), 0.0, 1.0);
                        float dotProductValue13 = spvNClamp(dot(vec3(sumValue243, sumValue244, sumValue245), vec3(productValue356, productValue357, productValue358)), 0.0, 1.0);
                        float productValue359 = intermediateValue303 * intermediateValue303;
                        float productValue360 = productValue359 * productValue359;
                        float productValue361 = (((dotProductValue12 * productValue360) - dotProductValue12) * dotProductValue12) + 1.0;
                        float productValue362 = productValue359 * 0.5;
                        float sumValue249 = 1.0 - productValue362;
                        float dotProductValue14 = spvNClamp(dot(vec3(productValue319, productValue320, productValue321), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0);
                        float exponentialValue = exp2(log2(spvNClamp(1.0 - dotProductValue13, 0.0, 1.0)) * 5.0);
                        float productValue363 = (exponentialValue * (dotProductValue14 - productValue319)) + productValue319;
                        float productValue364 = (exponentialValue * (dotProductValue14 - productValue320)) + productValue320;
                        float productValue365 = (exponentialValue * (dotProductValue14 - productValue321)) + productValue321;
                        float productValue366 = ((dotProductValue13 * dotProductValue13) * (intermediateValue303 * 2.0)) + (-0.5);
                        float exponentialValue1 = (((exp2(log2(spvNClamp(1.0 - dotProductValue11, 0.0, 1.0)) * 5.0) * productValue366) + 1.0) * 0.3183098733425140380859375) * ((exp2(log2(spvNClamp(1.0 - dotProductValue10, 0.0, 1.0)) * 5.0) * productValue366) + 1.0);
                        float quotientValue4 = ((productValue360 / ((productValue361 * productValue361) + 1.0000000133514319600180897396058e-10)) * 0.3183098733425140380859375) * (0.25 / ((((dotProductValue11 * sumValue249) + productValue362) * ((dotProductValue10 * sumValue249) + productValue362)) + 1.0000000133514319600180897396058e-10));
                        branchMergedValue107 = ((((intermediateValue290 * comparisonValue29) * ViewCB.packedValues[50u].y) * dotProductValue10) * ((((1.0 - productValue364) * productValue323) * exponentialValue1) + (productValue364 * quotientValue4))) + intermediateValue124;
                        branchMergedValue115 = ((((intermediateValue289 * comparisonValue28) * ViewCB.packedValues[50u].x) * dotProductValue10) * ((((1.0 - productValue363) * productValue322) * exponentialValue1) + (productValue363 * quotientValue4))) + intermediateValue122;
                        branchMergedValue116 = 1.0;
                        branchMergedValue117 = ((((intermediateValue291 * comparisonValue30) * ViewCB.packedValues[50u].z) * dotProductValue10) * ((((1.0 - productValue365) * productValue324) * exponentialValue1) + (productValue365 * quotientValue4))) + intermediateValue126;
                    }
                    else
                    {
                        branchMergedValue107 = intermediateValue124;
                        branchMergedValue115 = intermediateValue122;
                        branchMergedValue116 = 1.0;
                        branchMergedValue117 = intermediateValue126;
                    }
                    branchMergedValue32 = branchMergedValue107;
                    branchMergedValue48 = branchMergedValue115;
                    branchMergedValue49 = branchMergedValue116;
                    branchMergedValue50 = branchMergedValue117;
                }
                intermediateValue11 = branchMergedValue49;
                intermediateValue121 = branchMergedValue48;
                intermediateValue123 = branchMergedValue32;
                intermediateValue125 = branchMergedValue50;
            }
            else
            {
                uvec4 reinterpretedBits15 = floatBitsToUint(ViewCB.packedValues[75u]);
                uint intermediateValue89 = reinterpretedBits15.w;
                float sumValue41 = (-0.0) - sumValue14;
                float sumValue42 = (-0.0) - sumValue16;
                float sumValue43 = (-0.0) - sumValue18;
                float productValue72 = ViewCB.packedValues[60u].w * ViewCB.packedValues[60u].w;
                float dotProductValue4 = (spvNClamp(ViewCB.packedValues[90u].w, 0.0, 1.0) * 15.9154567718505859375) * ((1.0 - productValue72) / exp2(log2(abs((productValue72 + 1.0) - ((ViewCB.packedValues[60u].w * 2.0) * spvNMin(spvNMax((-0.0) - dot(vec3(ViewCB.packedValues[52u].xyz), vec3(sumValue41, sumValue42, sumValue43)), -1.0), 1.0)))) * 1.5));
                float intermediateValue137;
                float intermediateValue138;
                float intermediateValue139;
                if (intermediateValue89 == 1u)
                {
                    intermediateValue137 = ViewCB.packedValues[58u].x;
                    intermediateValue138 = ViewCB.packedValues[58u].y;
                    intermediateValue139 = ViewCB.packedValues[58u].z;
                }
                else
                {
                    float branchMergedValue33;
                    float branchMergedValue51;
                    float branchMergedValue52;
                    if (intermediateValue89 == 2u)
                    {
                        uvec4 intermediateValue140 = floatBitsToUint(ViewCB.packedValues[74u]);
                        uint intermediateValue141 = intermediateValue140.z;
                        uint reinterpretedBits24;
                        if (intermediateValue141 > 4095u)
                        {
                            reinterpretedBits24 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits24 = intermediateValue141;
                        }
                        float intermediateValue167 = abs(sumValue14);
                        float intermediateValue168 = abs(sumValue16);
                        float intermediateValue169 = abs(sumValue18);
                        float intermediateValue206;
                        float comparisonValue55;
                        float intermediateValue207;
                        if ((intermediateValue167 >= intermediateValue168) && (intermediateValue167 >= intermediateValue169))
                        {
                            intermediateValue206 = intermediateValue167;
                            comparisonValue55 = (sumValue14 < 0.0) ? sumValue43 : sumValue18;
                            intermediateValue207 = sumValue42;
                        }
                        else
                        {
                            float branchMergedValue36;
                            float branchMergedValue57;
                            float branchMergedValue58;
                            if (!(intermediateValue168 >= intermediateValue169))
                            {
                                branchMergedValue36 = sumValue42;
                                branchMergedValue57 = (sumValue18 < 0.0) ? sumValue14 : sumValue41;
                                branchMergedValue58 = intermediateValue169;
                            }
                            else
                            {
                                branchMergedValue36 = (sumValue16 < 0.0) ? sumValue43 : sumValue18;
                                branchMergedValue57 = sumValue41;
                                branchMergedValue58 = intermediateValue168;
                            }
                            intermediateValue206 = branchMergedValue58;
                            comparisonValue55 = branchMergedValue57;
                            intermediateValue207 = branchMergedValue36;
                        }
                        precise float quotientValue2 = 0.5 / intermediateValue206;
                        vec4 sampledTextureValue9 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits24 + 0u], linearSampler)), vec2(fract(fma(comparisonValue55, quotientValue2, 0.5) * ViewCB.packedValues[74u].x), fract(fma(intermediateValue207, quotientValue2, 0.5) * ViewCB.packedValues[74u].y)), 0.0);
                        branchMergedValue33 = (ViewCB.packedValues[58u].z * sampledTextureValue9.z) * ViewCB.packedValues[97u].w;
                        branchMergedValue51 = (ViewCB.packedValues[58u].x * sampledTextureValue9.x) * ViewCB.packedValues[97u].w;
                        branchMergedValue52 = (ViewCB.packedValues[58u].y * sampledTextureValue9.y) * ViewCB.packedValues[97u].w;
                    }
                    else
                    {
                        float branchMergedValue105;
                        float branchMergedValue109;
                        float branchMergedValue110;
                        if (intermediateValue89 == 4u)
                        {
                            float intermediateValue170 = (dot(vec3(sumValue14, sumValue16, sumValue18), vec3(ViewCB.packedValues[52u].xyz)) * 0.5) + 0.5;
                            branchMergedValue105 = ((ViewCB.packedValues[75u].z - ViewCB.packedValues[76u].z) * intermediateValue170) + ViewCB.packedValues[76u].z;
                            branchMergedValue109 = ((ViewCB.packedValues[75u].x - ViewCB.packedValues[76u].x) * intermediateValue170) + ViewCB.packedValues[76u].x;
                            branchMergedValue110 = ((ViewCB.packedValues[75u].y - ViewCB.packedValues[76u].y) * intermediateValue170) + ViewCB.packedValues[76u].y;
                        }
                        else
                        {
                            float comparisonValue51;
                            if (abs(sumValue16) < 1.0)
                            {
                                float quotientValue = atan(sumValue18 / sumValue14);
                                bool intermediateValue179 = sumValue14 < 0.0;
                                bool comparisonValue49 = sumValue14 == 0.0;
                                bool comparisonValue50 = sumValue18 >= 0.0;
                                bool intermediateValue180 = sumValue18 < 0.0;
                                comparisonValue51 = (comparisonValue49 && comparisonValue50) ? 1.57079637050628662109375 : ((comparisonValue49 && intermediateValue180) ? (-1.57079637050628662109375) : ((intermediateValue179 && intermediateValue180) ? (quotientValue + (-3.1415927410125732421875)) : ((intermediateValue179 && comparisonValue50) ? (quotientValue + 3.1415927410125732421875) : quotientValue)));
                            }
                            else
                            {
                                comparisonValue51 = 0.0;
                            }
                            float multiplyAddValue = fma(abs((fract((comparisonValue51 - ViewCB.packedValues[50u].w) * 0.15915493667125701904296875) * 2.0) + (-1.0)), 0.984375, 0.0078125);
                            float multiplyAddValue1 = fma(0.5 - (asin(sumValue16) * 0.3183098733425140380859375), 0.96875, 0.015625);
                            float productValue172 = ViewCB.packedValues[51u].w * 7.0;
                            float intermediateValue181 = fract(productValue172);
                            uint intermediateValue182 = uint(int(floor(productValue172)));
                            float productValue173 = float(int(intermediateValue182 + 1u)) * 0.125;
                            float intermediateValue183 = fract(abs(productValue173));
                            vec4 sampledTextureValue5 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue, multiplyAddValue1, float(int(intermediateValue182))), 0.0);
                            float intermediateValue184 = sampledTextureValue5.x;
                            float intermediateValue185 = sampledTextureValue5.y;
                            float intermediateValue186 = sampledTextureValue5.z;
                            float productValue174 = intermediateValue184 * intermediateValue184;
                            float productValue175 = intermediateValue185 * intermediateValue185;
                            float productValue176 = intermediateValue186 * intermediateValue186;
                            vec4 sampledTextureValue6 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue, multiplyAddValue1, float(int(uint(int(((productValue173 >= ((-0.0) - productValue173)) ? intermediateValue183 : ((-0.0) - intermediateValue183)) * 8.0))))), 0.0);
                            float intermediateValue187 = sampledTextureValue6.x;
                            float intermediateValue188 = sampledTextureValue6.y;
                            float intermediateValue189 = sampledTextureValue6.z;
                            float dotProductValue6 = exp2(log2(spvNMax(dot(vec3(sumValue14, sumValue16, sumValue18), vec3(ViewCB.packedValues[52u].xyz)), 0.0)) * 7.0);
                            float productValue177 = dotProductValue6 * 0.0500000007450580596923828125;
                            float productValue178 = ((((intermediateValue187 * intermediateValue187) - productValue174) * intermediateValue181) + productValue174) + (productValue177 * ViewCB.packedValues[50u].x);
                            float productValue179 = ((((intermediateValue188 * intermediateValue188) - productValue175) * intermediateValue181) + productValue175) + (productValue177 * ViewCB.packedValues[50u].y);
                            float productValue180 = ((((intermediateValue189 * intermediateValue189) - productValue176) * intermediateValue181) + productValue176) + (productValue177 * ViewCB.packedValues[50u].z);
                            float productValue181 = (dotProductValue6 * 0.64999997615814208984375) + 0.3499999940395355224609375;
                            branchMergedValue105 = ((((ViewCB.packedValues[58u].z * productValue181) - productValue180) * ViewCB.packedValues[58u].w) + productValue180) * ViewCB.packedValues[97u].w;
                            branchMergedValue109 = ((((ViewCB.packedValues[58u].x * productValue181) - productValue178) * ViewCB.packedValues[58u].w) + productValue178) * ViewCB.packedValues[97u].w;
                            branchMergedValue110 = ((((ViewCB.packedValues[58u].y * productValue181) - productValue179) * ViewCB.packedValues[58u].w) + productValue179) * ViewCB.packedValues[97u].w;
                        }
                        branchMergedValue33 = branchMergedValue105;
                        branchMergedValue51 = branchMergedValue109;
                        branchMergedValue52 = branchMergedValue110;
                    }
                    intermediateValue137 = branchMergedValue51;
                    intermediateValue138 = branchMergedValue52;
                    intermediateValue139 = branchMergedValue33;
                }
                intermediateValue11 = 0.0;
                intermediateValue121 = (intermediateValue137 + (((ViewCB.packedValues[50u].x * dotProductValue4) * ViewCB.packedValues[61u].x) * exp2(ViewCB.packedValues[62u].x * (-72.1347503662109375)))) * comparisonValue28;
                intermediateValue123 = (intermediateValue138 + (((ViewCB.packedValues[50u].y * dotProductValue4) * ViewCB.packedValues[61u].y) * exp2(ViewCB.packedValues[62u].y * (-72.1347503662109375)))) * comparisonValue29;
                intermediateValue125 = (intermediateValue139 + (((ViewCB.packedValues[50u].z * dotProductValue4) * ViewCB.packedValues[61u].z) * exp2(ViewCB.packedValues[62u].z * (-72.1347503662109375)))) * comparisonValue30;
            }
            float productValue114 = (ViewCB.packedValues[59u].z * comparisonValue30) + intermediateValue125;
            float productValue = (((ViewCB.packedValues[59u].x * comparisonValue28) + intermediateValue121) - productValue114) * reinterpretedBits2;
            float productValue115 = (productValue * 0.5) + (productValue114 * reinterpretedBits2);
            float productValue1 = (((ViewCB.packedValues[59u].y * comparisonValue29) + intermediateValue123) * reinterpretedBits2) - productValue115;
            float productValue116 = spvNMax((productValue1 * 0.5) + productValue115, 0.0);
            float productValue117 = productValue116 * 0.48860299587249755859375;
            branchMergedValue12 = productValue116 * 0.2820949852466583251953125;
            branchMergedValue26 = productValue117 * sumValue18;
            branchMergedValue27 = productValue117 * sumValue16;
            branchMergedValue28 = productValue117 * sumValue14;
            branchMergedValue29 = intermediateValue11;
            branchMergedValue30 = productValue1;
            branchMergedValue31 = productValue;
        }
        else
        {
            bool dotProductValue2 = dot(vec3(0.847100675106048583984375, 0.2079117000102996826171875, 0.489073812961578369140625), vec3(productValue7, productValue5, productValue8)) > 0.949999988079071044921875;
            float comparisonValue17 = dotProductValue2 ? (-0.639436304569244384765625) : 0.847100675106048583984375;
            float comparisonValue18 = dotProductValue2 ? (-0.3907311260700225830078125) : 0.2079117000102996826171875;
            float comparisonValue19 = dotProductValue2 ? 0.6621558666229248046875 : 0.489073812961578369140625;
            precise float dotProductValue3 = dot(vec3(comparisonValue17, comparisonValue18, comparisonValue19), vec3(productValue7, productValue5, productValue8));
            precise float productValue35 = productValue7 * dotProductValue3;
            precise float productValue36 = productValue5 * dotProductValue3;
            precise float productValue37 = productValue8 * dotProductValue3;
            precise float sumValue19 = comparisonValue17 - productValue35;
            precise float sumValue20 = comparisonValue18 - productValue36;
            precise float sumValue21 = comparisonValue19 - productValue37;
            float inverseLengthValue4 = inversesqrt(dot(vec3(sumValue19, sumValue20, sumValue21), vec3(sumValue19, sumValue20, sumValue21)));
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
            rayQueryInitializeEXT(intermediateValue30, SceneBVH, 512u, 2u, vec3(reinterpretedBits8, reinterpretedBits9, reinterpretedBits10), 0.0, vec3(sumValue26, sumValue28, sumValue30), 10000.0);
            bool intermediateValue31 = rayQueryProceedEXT(intermediateValue30);
            if (intermediateValue31)
            {
                bool intermediateValue77;
                bool comparisonValue22;
                for (;;)
                {
                    uint intermediateValue46 = rayQueryGetIntersectionTypeEXT(intermediateValue30, bool(0u));
                    comparisonValue22 = intermediateValue46 == 0u;
                    if (comparisonValue22)
                    {
                        vec2 intermediateValue71 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue30, bool(0u));
                        vec2 intermediateValue72 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue30, bool(0u));
                        uint intermediateValue73 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue30, bool(0u));
                        uint intermediateValue74 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue30, bool(0u));
                        uint intermediateValue75 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue30, bool(0u));
                        uint productValue59 = (intermediateValue75 * 76u) + 58u;
                        uint productValue60 = (intermediateValue75 * 76u) + 61u;
                        precise float sumValue33 = 1.0 - intermediateValue71.x;
                        precise float sumValue34 = sumValue33 - intermediateValue72.y;
                        uint bitwiseValue7 = (objectInstances_2.packedValues[(intermediateValue75 * 38u) + 25u] >> 2u) + (intermediateValue73 >> 1u);
                        uint productValue61 = uint(objectInstances.packedValues[(intermediateValue75 * 76u) + 54u]) + 0u;
                        bool comparisonValue31 = (intermediateValue73 & 1u) == 0u;
                        uint comparisonValue32 = comparisonValue31 ? faceUvBuffersRW[nonuniformEXT(productValue61)].packedValues[bitwiseValue7].z : faceUvBuffersRW[nonuniformEXT(productValue61)].packedValues[bitwiseValue7].x;
                        uint comparisonValue33 = comparisonValue31 ? faceUvBuffersRW[nonuniformEXT(productValue61)].packedValues[bitwiseValue7].y : faceUvBuffersRW[nonuniformEXT(productValue61)].packedValues[bitwiseValue7].w;
                        uint comparisonValue34 = comparisonValue31 ? faceUvBuffersRW[nonuniformEXT(productValue61)].packedValues[bitwiseValue7].x : faceUvBuffersRW[nonuniformEXT(productValue61)].packedValues[bitwiseValue7].z;
                        bool intermediateValue76 = int16_t(objectInstances.packedValues[productValue60]) < int16_t(0us);
                        float intermediateValue108;
                        float intermediateValue109;
                        if (intermediateValue76)
                        {
                            uint bitwiseValue16 = comparisonValue34 >> 15u;
                            precise float bitwiseValue17 = float(bitwiseValue16 & 1u) * 2.0;
                            precise float sumValue44 = bitwiseValue17 + (-1.0);
                            precise float bitwiseValue18 = float(comparisonValue34 >> 31u) * 2.0;
                            precise float sumValue45 = bitwiseValue18 + (-1.0);
                            precise float bitwiseValue19 = float((comparisonValue34 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue20 = float(bitwiseValue16 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue73 = sumValue44 * 3.0517578125e-05;
                            precise float productValue74 = sumValue45 * 3.0517578125e-05;
                            precise float sumValue46 = bitwiseValue19 + productValue73;
                            precise float sumValue47 = bitwiseValue20 + productValue74;
                            intermediateValue108 = sumValue46;
                            intermediateValue109 = sumValue47;
                        }
                        else
                        {
                            precise float bitwiseValue21 = float(comparisonValue34 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue22 = float(comparisonValue34 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue75 = bitwiseValue21 * 16384.0;
                            precise float sumValue48 = productValue75 + 0.5;
                            precise float productValue76 = bitwiseValue22 * 16384.0;
                            precise float sumValue49 = productValue76 + 0.5;
                            precise float productValue77 = floor(sumValue48) * 6.103515625e-05;
                            precise float productValue78 = floor(sumValue49) * 6.103515625e-05;
                            intermediateValue108 = productValue77;
                            intermediateValue109 = productValue78;
                        }
                        precise float productValue93 = sumValue34 * intermediateValue108;
                        precise float productValue94 = sumValue34 * intermediateValue109;
                        precise float sumValue58 = productValue93 + 0.0;
                        precise float sumValue59 = productValue94 + 0.0;
                        float intermediateValue171;
                        float intermediateValue172;
                        if (intermediateValue76)
                        {
                            uint bitwiseValue55 = comparisonValue33 >> 15u;
                            precise float bitwiseValue56 = float(bitwiseValue55 & 1u) * 2.0;
                            precise float sumValue83 = bitwiseValue56 + (-1.0);
                            precise float bitwiseValue57 = float(comparisonValue33 >> 31u) * 2.0;
                            precise float sumValue84 = bitwiseValue57 + (-1.0);
                            precise float bitwiseValue58 = float((comparisonValue33 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue59 = float(bitwiseValue55 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue129 = sumValue83 * 3.0517578125e-05;
                            precise float productValue130 = sumValue84 * 3.0517578125e-05;
                            precise float sumValue85 = bitwiseValue58 + productValue129;
                            precise float sumValue86 = bitwiseValue59 + productValue130;
                            intermediateValue171 = sumValue85;
                            intermediateValue172 = sumValue86;
                        }
                        else
                        {
                            precise float bitwiseValue60 = float(comparisonValue33 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue61 = float(comparisonValue33 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue131 = bitwiseValue60 * 16384.0;
                            precise float sumValue87 = productValue131 + 0.5;
                            precise float productValue132 = bitwiseValue61 * 16384.0;
                            precise float sumValue88 = productValue132 + 0.5;
                            precise float productValue133 = floor(sumValue87) * 6.103515625e-05;
                            precise float productValue134 = floor(sumValue88) * 6.103515625e-05;
                            intermediateValue171 = productValue133;
                            intermediateValue172 = productValue134;
                        }
                        precise float productValue156 = intermediateValue71.x * intermediateValue171;
                        precise float productValue157 = intermediateValue71.x * intermediateValue172;
                        precise float sumValue107 = sumValue58 + productValue156;
                        precise float sumValue108 = sumValue59 + productValue157;
                        float intermediateValue208;
                        float intermediateValue209;
                        if (intermediateValue76)
                        {
                            uint bitwiseValue100 = comparisonValue32 >> 15u;
                            precise float bitwiseValue101 = float(bitwiseValue100 & 1u) * 2.0;
                            precise float sumValue123 = bitwiseValue101 + (-1.0);
                            precise float bitwiseValue102 = float(comparisonValue32 >> 31u) * 2.0;
                            precise float sumValue124 = bitwiseValue102 + (-1.0);
                            precise float bitwiseValue103 = float((comparisonValue32 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue104 = float(bitwiseValue100 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue182 = sumValue123 * 3.0517578125e-05;
                            precise float productValue183 = sumValue124 * 3.0517578125e-05;
                            precise float sumValue125 = bitwiseValue103 + productValue182;
                            precise float sumValue126 = bitwiseValue104 + productValue183;
                            intermediateValue208 = sumValue125;
                            intermediateValue209 = sumValue126;
                        }
                        else
                        {
                            precise float bitwiseValue105 = float(comparisonValue32 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue106 = float(comparisonValue32 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue184 = bitwiseValue105 * 16384.0;
                            precise float sumValue127 = productValue184 + 0.5;
                            precise float productValue185 = bitwiseValue106 * 16384.0;
                            precise float sumValue128 = productValue185 + 0.5;
                            precise float productValue186 = floor(sumValue127) * 6.103515625e-05;
                            precise float productValue187 = floor(sumValue128) * 6.103515625e-05;
                            intermediateValue208 = productValue186;
                            intermediateValue209 = productValue187;
                        }
                        precise float productValue212 = intermediateValue72.y * intermediateValue208;
                        precise float productValue213 = intermediateValue72.y * intermediateValue209;
                        precise float sumValue143 = sumValue107 + productValue212;
                        precise float sumValue144 = sumValue108 + productValue213;
                        float intermediateValue216;
                        if (objectInstances.packedValues[productValue59] == 65535us)
                        {
                            intermediateValue216 = 1.0;
                        }
                        else
                        {
                            uint reinterpretedBits27;
                            if (objectInstances.packedValues[productValue59] > 4095us)
                            {
                                reinterpretedBits27 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits27 = uint(objectInstances.packedValues[productValue59]);
                            }
                            intermediateValue216 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits27 + 0u], defaultSampler)), vec2(sumValue143, sumValue144), -0.25).w;
                        }
                        uint comparisonValue58;
                        if (intermediateValue74 == 2u)
                        {
                            comparisonValue58 = 0u;
                        }
                        else
                        {
                            comparisonValue58 = uint(intermediateValue216 <= (((objectInstances.packedValues[productValue60] & 4352us) != 0us) ? 0.5 : 0.0));
                        }
                        if (comparisonValue58 == 0u)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue30);
                        }
                    }
                    intermediateValue77 = rayQueryProceedEXT(intermediateValue30);
                    if (intermediateValue77)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint intermediateValue34 = rayQueryGetIntersectionTypeEXT(intermediateValue30, bool(1u));
            float intermediateValue52;
            float intermediateValue53;
            float intermediateValue54;
            uint bitwiseValue5;
            if (intermediateValue34 == 1u)
            {
                vec2 intermediateValue47 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue30, bool(1u));
                vec2 intermediateValue48 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue30, bool(1u));
                float intermediateValue49 = rayQueryGetIntersectionTEXT(intermediateValue30, bool(1u));
                uint intermediateValue50 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue30, bool(1u));
                uint intermediateValue51 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue30, bool(1u));
                intermediateValue52 = intermediateValue47.x;
                intermediateValue53 = intermediateValue48.y;
                intermediateValue54 = intermediateValue49;
                bitwiseValue5 = ((intermediateValue50 << 14u) & 1073725440u) | (intermediateValue51 & 16383u);
            }
            else
            {
                intermediateValue52 = 0.0;
                intermediateValue53 = 0.0;
                intermediateValue54 = 10000.0;
                bitwiseValue5 = 1073741823u;
            }
            rayQueryInitializeEXT(intermediateValue55, SceneBVH, 512u, 16u, vec3(reinterpretedBits8, reinterpretedBits9, reinterpretedBits10), 0.0, vec3(sumValue26, sumValue28, sumValue30), intermediateValue54);
            bool intermediateValue56 = rayQueryProceedEXT(intermediateValue55);
            float intermediateValue78;
            float intermediateValue80;
            float intermediateValue82;
            if (intermediateValue56)
            {
                float intermediateValue79;
                float intermediateValue81;
                float intermediateValue83;
                float intermediateValue90 = 1.0;
                float intermediateValue91 = 1.0;
                float intermediateValue92 = 1.0;
                bool comparisonValue40;
                for (;;)
                {
                    uint intermediateValue93 = rayQueryGetIntersectionTypeEXT(intermediateValue55, bool(0u));
                    comparisonValue40 = intermediateValue93 == 0u;
                    float branchMergedValue1;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if (comparisonValue40)
                    {
                        vec2 intermediateValue110 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue55, bool(0u));
                        vec2 intermediateValue111 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue55, bool(0u));
                        float intermediateValue112 = rayQueryGetIntersectionTEXT(intermediateValue55, bool(0u));
                        uint intermediateValue113 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue55, bool(0u));
                        uint intermediateValue114 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue55, bool(0u));
                        uint intermediateValue115 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue55, bool(0u));
                        uint productValue95 = (intermediateValue115 * 76u) + 58u;
                        uint productValue96 = (intermediateValue115 * 76u) + 61u;
                        precise float sumValue60 = 1.0 - intermediateValue110.x;
                        precise float sumValue61 = sumValue60 - intermediateValue111.y;
                        uint bitwiseValue26 = (objectInstances_2.packedValues[(intermediateValue115 * 38u) + 25u] >> 2u) + (intermediateValue113 >> 1u);
                        uint productValue97 = uint(objectInstances.packedValues[(intermediateValue115 * 76u) + 54u]) + 0u;
                        bool comparisonValue45 = (intermediateValue113 & 1u) == 0u;
                        uint comparisonValue46 = comparisonValue45 ? faceUvBuffersRW[nonuniformEXT(productValue97)].packedValues[bitwiseValue26].z : faceUvBuffersRW[nonuniformEXT(productValue97)].packedValues[bitwiseValue26].x;
                        uint comparisonValue47 = comparisonValue45 ? faceUvBuffersRW[nonuniformEXT(productValue97)].packedValues[bitwiseValue26].y : faceUvBuffersRW[nonuniformEXT(productValue97)].packedValues[bitwiseValue26].w;
                        uint comparisonValue48 = comparisonValue45 ? faceUvBuffersRW[nonuniformEXT(productValue97)].packedValues[bitwiseValue26].x : faceUvBuffersRW[nonuniformEXT(productValue97)].packedValues[bitwiseValue26].z;
                        bool intermediateValue116 = int16_t(objectInstances.packedValues[productValue96]) < int16_t(0us);
                        float intermediateValue173;
                        float intermediateValue174;
                        if (intermediateValue116)
                        {
                            uint bitwiseValue62 = comparisonValue48 >> 15u;
                            precise float bitwiseValue63 = float(bitwiseValue62 & 1u) * 2.0;
                            precise float sumValue89 = bitwiseValue63 + (-1.0);
                            precise float bitwiseValue64 = float(comparisonValue48 >> 31u) * 2.0;
                            precise float sumValue90 = bitwiseValue64 + (-1.0);
                            precise float bitwiseValue65 = float((comparisonValue48 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue66 = float(bitwiseValue62 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue135 = sumValue89 * 3.0517578125e-05;
                            precise float productValue136 = sumValue90 * 3.0517578125e-05;
                            precise float sumValue91 = bitwiseValue65 + productValue135;
                            precise float sumValue92 = bitwiseValue66 + productValue136;
                            intermediateValue173 = sumValue91;
                            intermediateValue174 = sumValue92;
                        }
                        else
                        {
                            precise float bitwiseValue67 = float(comparisonValue48 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue68 = float(comparisonValue48 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue137 = bitwiseValue67 * 16384.0;
                            precise float sumValue93 = productValue137 + 0.5;
                            precise float productValue138 = bitwiseValue68 * 16384.0;
                            precise float sumValue94 = productValue138 + 0.5;
                            precise float productValue139 = floor(sumValue93) * 6.103515625e-05;
                            precise float productValue140 = floor(sumValue94) * 6.103515625e-05;
                            intermediateValue173 = productValue139;
                            intermediateValue174 = productValue140;
                        }
                        precise float productValue158 = sumValue61 * intermediateValue173;
                        precise float productValue159 = sumValue61 * intermediateValue174;
                        precise float sumValue109 = productValue158 + 0.0;
                        precise float sumValue110 = productValue159 + 0.0;
                        float intermediateValue210;
                        float intermediateValue211;
                        if (intermediateValue116)
                        {
                            uint bitwiseValue107 = comparisonValue47 >> 15u;
                            precise float bitwiseValue108 = float(bitwiseValue107 & 1u) * 2.0;
                            precise float sumValue129 = bitwiseValue108 + (-1.0);
                            precise float bitwiseValue109 = float(comparisonValue47 >> 31u) * 2.0;
                            precise float sumValue130 = bitwiseValue109 + (-1.0);
                            precise float bitwiseValue110 = float((comparisonValue47 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue111 = float(bitwiseValue107 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue188 = sumValue129 * 3.0517578125e-05;
                            precise float productValue189 = sumValue130 * 3.0517578125e-05;
                            precise float sumValue131 = bitwiseValue110 + productValue188;
                            precise float sumValue132 = bitwiseValue111 + productValue189;
                            intermediateValue210 = sumValue131;
                            intermediateValue211 = sumValue132;
                        }
                        else
                        {
                            precise float bitwiseValue112 = float(comparisonValue47 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue113 = float(comparisonValue47 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue190 = bitwiseValue112 * 16384.0;
                            precise float sumValue133 = productValue190 + 0.5;
                            precise float productValue191 = bitwiseValue113 * 16384.0;
                            precise float sumValue134 = productValue191 + 0.5;
                            precise float productValue192 = floor(sumValue133) * 6.103515625e-05;
                            precise float productValue193 = floor(sumValue134) * 6.103515625e-05;
                            intermediateValue210 = productValue192;
                            intermediateValue211 = productValue193;
                        }
                        precise float productValue214 = intermediateValue110.x * intermediateValue210;
                        precise float productValue215 = intermediateValue110.x * intermediateValue211;
                        precise float sumValue145 = sumValue109 + productValue214;
                        precise float sumValue146 = sumValue110 + productValue215;
                        float intermediateValue219;
                        float intermediateValue220;
                        if (intermediateValue116)
                        {
                            uint bitwiseValue130 = comparisonValue46 >> 15u;
                            precise float bitwiseValue131 = float(bitwiseValue130 & 1u) * 2.0;
                            precise float sumValue157 = bitwiseValue131 + (-1.0);
                            precise float bitwiseValue132 = float(comparisonValue46 >> 31u) * 2.0;
                            precise float sumValue158 = bitwiseValue132 + (-1.0);
                            precise float bitwiseValue133 = float((comparisonValue46 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue134 = float(bitwiseValue130 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue226 = sumValue157 * 3.0517578125e-05;
                            precise float productValue227 = sumValue158 * 3.0517578125e-05;
                            precise float sumValue159 = bitwiseValue133 + productValue226;
                            precise float sumValue160 = bitwiseValue134 + productValue227;
                            intermediateValue219 = sumValue159;
                            intermediateValue220 = sumValue160;
                        }
                        else
                        {
                            precise float bitwiseValue135 = float(comparisonValue46 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue136 = float(comparisonValue46 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue228 = bitwiseValue135 * 16384.0;
                            precise float sumValue161 = productValue228 + 0.5;
                            precise float productValue229 = bitwiseValue136 * 16384.0;
                            precise float sumValue162 = productValue229 + 0.5;
                            precise float productValue230 = floor(sumValue161) * 6.103515625e-05;
                            precise float productValue231 = floor(sumValue162) * 6.103515625e-05;
                            intermediateValue219 = productValue230;
                            intermediateValue220 = productValue231;
                        }
                        precise float productValue238 = intermediateValue111.y * intermediateValue219;
                        precise float productValue239 = intermediateValue111.y * intermediateValue220;
                        precise float sumValue169 = sumValue145 + productValue238;
                        precise float sumValue170 = sumValue146 + productValue239;
                        float intermediateValue225;
                        float intermediateValue226;
                        float intermediateValue227;
                        float intermediateValue228;
                        if (objectInstances.packedValues[productValue95] == 65535us)
                        {
                            intermediateValue225 = 1.0;
                            intermediateValue226 = 1.0;
                            intermediateValue227 = 1.0;
                            intermediateValue228 = 1.0;
                        }
                        else
                        {
                            uint reinterpretedBits29;
                            if (objectInstances.packedValues[productValue95] > 4095us)
                            {
                                reinterpretedBits29 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits29 = uint(objectInstances.packedValues[productValue95]);
                            }
                            vec4 sampledTextureValue12 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits29 + 0u], defaultSampler)), vec2(sumValue169, sumValue170), spvNMin(fma(intermediateValue112, 0.083333335816860198974609375, -0.25), 2.0));
                            intermediateValue225 = sampledTextureValue12.x;
                            intermediateValue226 = sampledTextureValue12.y;
                            intermediateValue227 = sampledTextureValue12.z;
                            intermediateValue228 = sampledTextureValue12.w;
                        }
                        float intermediateValue235;
                        float intermediateValue236;
                        float intermediateValue237;
                        if (intermediateValue114 == 2u)
                        {
                            float branchMergedValue39;
                            float branchMergedValue63;
                            float branchMergedValue64;
                            if ((objectInstances.packedValues[productValue96] & 128us) == 0us)
                            {
                                float intermediateValue249;
                                if ((objectInstances.packedValues[productValue96] & 2048us) == 0us)
                                {
                                    intermediateValue249 = intermediateValue228;
                                }
                                else
                                {
                                    intermediateValue249 = spvNClamp(fma(intermediateValue228, 2.0, -1.0), 0.0, 1.0);
                                }
                                branchMergedValue39 = intermediateValue226 - (intermediateValue249 * intermediateValue226);
                                branchMergedValue63 = intermediateValue225 - (intermediateValue249 * intermediateValue225);
                                branchMergedValue64 = intermediateValue227 - (intermediateValue249 * intermediateValue227);
                            }
                            else
                            {
                                branchMergedValue39 = 0.33399999141693115234375;
                                branchMergedValue63 = 0.33399999141693115234375;
                                branchMergedValue64 = 0.33399999141693115234375;
                            }
                            intermediateValue235 = branchMergedValue63;
                            intermediateValue236 = branchMergedValue39;
                            intermediateValue237 = branchMergedValue64;
                        }
                        else
                        {
                            float sumValue197 = 1.0 - intermediateValue228;
                            intermediateValue235 = sumValue197;
                            intermediateValue236 = sumValue197;
                            intermediateValue237 = sumValue197;
                        }
                        float productValue305 = intermediateValue235 * intermediateValue90;
                        float productValue306 = intermediateValue236 * intermediateValue91;
                        float productValue307 = intermediateValue237 * intermediateValue92;
                        float intermediateValue117;
                        float intermediateValue118;
                        float intermediateValue119;
                        bool intermediateValue250;
                        if (!(dot(vec3(productValue305, productValue306, productValue307), vec3(1.0)) <= 0.00999999977648258209228515625))
                        {
                            intermediateValue250 = false;
                            intermediateValue117 = productValue305;
                            intermediateValue118 = productValue306;
                            intermediateValue119 = productValue307;
                        }
                        else
                        {
                            intermediateValue250 = true;
                            intermediateValue117 = 0.0;
                            intermediateValue118 = 0.0;
                            intermediateValue119 = 0.0;
                        }
                        float branchMergedValue82;
                        float branchMergedValue91;
                        float branchMergedValue92;
                        if (intermediateValue250)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue55);
                            branchMergedValue82 = intermediateValue119;
                            branchMergedValue91 = intermediateValue118;
                            branchMergedValue92 = intermediateValue117;
                        }
                        else
                        {
                            branchMergedValue82 = intermediateValue119;
                            branchMergedValue91 = intermediateValue118;
                            branchMergedValue92 = intermediateValue117;
                        }
                        branchMergedValue1 = branchMergedValue82;
                        branchMergedValue10 = branchMergedValue91;
                        branchMergedValue11 = branchMergedValue92;
                    }
                    else
                    {
                        branchMergedValue1 = intermediateValue92;
                        branchMergedValue10 = intermediateValue91;
                        branchMergedValue11 = intermediateValue90;
                    }
                    intermediateValue83 = branchMergedValue1;
                    intermediateValue81 = branchMergedValue10;
                    intermediateValue79 = branchMergedValue11;
                    bool intermediateValue120 = rayQueryProceedEXT(intermediateValue55);
                    if (intermediateValue120)
                    {
                        intermediateValue90 = intermediateValue79;
                        intermediateValue91 = intermediateValue81;
                        intermediateValue92 = intermediateValue83;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue78 = intermediateValue79;
                intermediateValue80 = intermediateValue81;
                intermediateValue82 = intermediateValue83;
            }
            else
            {
                intermediateValue78 = 1.0;
                intermediateValue80 = 1.0;
                intermediateValue82 = 1.0;
            }
            uint intermediateValue84 = rayQueryGetIntersectionTypeEXT(intermediateValue55, bool(1u));
            bool comparisonValue35 = intermediateValue84 == 1u;
            float comparisonValue36 = comparisonValue35 ? 0.0 : intermediateValue78;
            float comparisonValue37 = comparisonValue35 ? 0.0 : intermediateValue80;
            float comparisonValue38 = comparisonValue35 ? 0.0 : intermediateValue82;
            float intermediateValue142;
            float intermediateValue144;
            float intermediateValue146;
            if (intermediateValue54 < 10000.0)
            {
                uint bitwiseValue23 = bitwiseValue5 & 16383u;
                uint productValue79 = (bitwiseValue23 * 76u) + 58u;
                uint productValue80 = (bitwiseValue23 * 76u) + 59u;
                uint productValue81 = (bitwiseValue23 * 76u) + 61u;
                uint productValue82 = (bitwiseValue23 * 38u) + 32u;
                bool reinterpretedBits16 = (intermediateValue54 > 1.0) && (((objectInstances.packedValues[productValue81] & 1us) != 0us) && (floatBitsToUint(ViewCB.packedValues[86u]).y != 0u));
                float productValue99;
                float productValue100;
                float productValue101;
                if (reinterpretedBits16)
                {
                    uint productValue98 = uint(objectInstances.packedValues[(bitwiseValue23 * 76u) + 54u]) + 0u;
                    uint bitwiseValue27 = ((objectInstances_2.packedValues[(bitwiseValue23 * 38u) + 25u] >> 2u) + ((bitwiseValue5 >> 15u) & 32767u)) * 8u;
                    f16vec3 sumValue62 = uint16BitsToFloat16(u16vec3(faceIrradianceCache[nonuniformEXT(productValue98)].packedValues[bitwiseValue27], faceIrradianceCache[nonuniformEXT(productValue98)].packedValues[bitwiseValue27 + 1u], faceIrradianceCache[nonuniformEXT(productValue98)].packedValues[bitwiseValue27 + 2u]));
                    productValue99 = float(sumValue62.x) * comparisonValue36;
                    productValue100 = float(sumValue62.y) * comparisonValue37;
                    productValue101 = float(sumValue62.z) * comparisonValue38;
                }
                else
                {
                    productValue99 = 0.0;
                    productValue100 = 0.0;
                    productValue101 = 0.0;
                }
                float branchMergedValue34;
                float branchMergedValue53;
                float branchMergedValue54;
                if (reinterpretedBits16)
                {
                    branchMergedValue34 = productValue101;
                    branchMergedValue53 = productValue99;
                    branchMergedValue54 = productValue100;
                }
                else
                {
                    uint productValue141 = bitwiseValue23 * 38u;
                    vec4 reinterpretedBits21 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue141], objectInstances_2.packedValues[productValue141 + 1u], objectInstances_2.packedValues[productValue141 + 2u], objectInstances_2.packedValues[productValue141 + 3u]));
                    float intermediateValue148 = reinterpretedBits21.x;
                    float intermediateValue149 = reinterpretedBits21.y;
                    float intermediateValue150 = reinterpretedBits21.z;
                    uint productValue142 = (bitwiseValue23 * 38u) + 4u;
                    vec4 reinterpretedBits22 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue142], objectInstances_2.packedValues[productValue142 + 1u], objectInstances_2.packedValues[productValue142 + 2u], objectInstances_2.packedValues[productValue142 + 3u]));
                    float intermediateValue151 = reinterpretedBits22.x;
                    float intermediateValue152 = reinterpretedBits22.y;
                    float intermediateValue153 = reinterpretedBits22.z;
                    uint productValue143 = (bitwiseValue23 * 38u) + 8u;
                    vec4 reinterpretedBits23 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue143], objectInstances_2.packedValues[productValue143 + 1u], objectInstances_2.packedValues[productValue143 + 2u], objectInstances_2.packedValues[productValue143 + 3u]));
                    float intermediateValue154 = reinterpretedBits23.x;
                    float intermediateValue155 = reinterpretedBits23.y;
                    float intermediateValue156 = reinterpretedBits23.z;
                    uint productValue144 = (bitwiseValue23 * 38u) + 24u;
                    uint productValue145 = (bitwiseValue23 * 38u) + 25u;
                    uint productValue146 = (bitwiseValue23 * 76u) + 61u;
                    uint productValue147 = (bitwiseValue23 * 76u) + 72u;
                    uint bitwiseValue69 = ((bitwiseValue5 >> 13u) & 2u) | ((bitwiseValue5 >> 13u) & 131068u);
                    uint bitwiseValue70 = bitwiseValue69 | 1u;
                    uint bitwiseValue71 = bitwiseValue69 ^ 2u;
                    uint intermediateValue[3];
                    intermediateValue[0u] = bitwiseValue69;
                    intermediateValue[1u] = bitwiseValue70;
                    intermediateValue[2u] = bitwiseValue71;
                    uint productValue148 = uint(objectInstances.packedValues[(bitwiseValue23 * 76u) + 54u]);
                    uint sumValue95 = productValue148 + 0u;
                    uint bitwiseValue72 = (objectInstances_2.packedValues[productValue145] >> 2u) + ((bitwiseValue5 >> 15u) & 32767u);
                    uint productValue149 = bitwiseValue72 * 4u;
                    precise float bitwiseValue73 = float(faceDataBuffersRW_2[nonuniformEXT(sumValue95)].packedValues[productValue149] & 1023u) * 0.00195503421127796173095703125;
                    precise float sumValue96 = bitwiseValue73 + (-1.0);
                    precise float bitwiseValue74 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue95)].packedValues[productValue149] >> 10u) & 1023u) * 0.00195503421127796173095703125;
                    precise float sumValue97 = bitwiseValue74 + (-1.0);
                    precise float bitwiseValue75 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue95)].packedValues[productValue149] >> 20u) & 1023u) * 0.00195503421127796173095703125;
                    precise float sumValue98 = bitwiseValue75 + (-1.0);
                    precise float sumValue99 = 1.0 - intermediateValue52;
                    precise float sumValue100 = sumValue99 - intermediateValue53;
                    float intermediateValue1[3];
                    intermediateValue1[0u] = sumValue100;
                    intermediateValue1[1u] = intermediateValue52;
                    intermediateValue1[2u] = intermediateValue53;
                    uint sumValue101 = productValue148 + 0u;
                    uint productValue150 = uint(objectInstances.packedValues[(bitwiseValue23 * 76u) + 56u]);
                    uint productValue151 = productValue150 * (objectInstances_2.packedValues[productValue144] + bitwiseValue69);
                    uint bitwiseValue76 = uint(objectInstances.packedValues[(bitwiseValue23 * 76u) + 71u] & 255us);
                    uint bitwiseValue77 = (bitwiseValue76 + productValue151) >> 1u;
                    f16vec3 sumValue102 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue101)].packedValues[bitwiseValue77], vertexBuffers[nonuniformEXT(sumValue101)].packedValues[bitwiseValue77 + 1u], vertexBuffers[nonuniformEXT(sumValue101)].packedValues[bitwiseValue77 + 2u]));
                    uint bitwiseValue78 = uint(objectInstances.packedValues[productValue147] & 255us);
                    uint bitwiseValue79 = (bitwiseValue78 + productValue151) >> 2u;
                    uint bitwiseValue80 = uint(objectInstances.packedValues[productValue147] >> 8us);
                    uint bitwiseValue81 = (bitwiseValue80 + productValue151) >> 2u;
                    bool intermediateValue157 = int16_t(objectInstances.packedValues[productValue146]) < int16_t(0us);
                    float bitwiseValue114;
                    float bitwiseValue115;
                    if (intermediateValue157)
                    {
                        uint bitwiseValue83 = vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue81] >> 15u;
                        bitwiseValue114 = ((float(bitwiseValue83 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue81] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                        bitwiseValue115 = ((float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue81] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue83 & 65534u) * 1.525902189314365386962890625e-05);
                    }
                    else
                    {
                        bitwiseValue114 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue81] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        bitwiseValue115 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue81] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                    }
                    uint intermediateValue212;
                    if ((objectInstances.packedValues[productValue146] & 256us) == 0us)
                    {
                        intermediateValue212 = 0u;
                    }
                    else
                    {
                        intermediateValue212 = vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[(uint(objectInstances.packedValues[(bitwiseValue23 * 76u) + 74u] >> 8us) + productValue151) >> 2u] & 65535u;
                    }
                    precise float productValue216 = sumValue100 * float(sumValue102.x);
                    precise float productValue217 = sumValue100 * float(sumValue102.y);
                    precise float productValue218 = sumValue100 * float(sumValue102.z);
                    precise float sumValue147 = productValue216 + 0.0;
                    precise float sumValue148 = productValue217 + 0.0;
                    precise float sumValue149 = productValue218 + 0.0;
                    uint productValue219 = productValue150 * (objectInstances_2.packedValues[productValue144] + bitwiseValue70);
                    uint bitwiseValue119 = (bitwiseValue76 + productValue219) >> 1u;
                    f16vec3 sumValue150 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue101)].packedValues[bitwiseValue119], vertexBuffers[nonuniformEXT(sumValue101)].packedValues[bitwiseValue119 + 1u], vertexBuffers[nonuniformEXT(sumValue101)].packedValues[bitwiseValue119 + 2u]));
                    uint bitwiseValue120 = (bitwiseValue78 + productValue219) >> 2u;
                    uint bitwiseValue121 = (bitwiseValue80 + productValue219) >> 2u;
                    float bitwiseValue143;
                    float bitwiseValue144;
                    if (intermediateValue157)
                    {
                        uint bitwiseValue137 = vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue121] >> 15u;
                        bitwiseValue143 = ((float(bitwiseValue137 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue121] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                        bitwiseValue144 = ((float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue121] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue137 & 65534u) * 1.525902189314365386962890625e-05);
                    }
                    else
                    {
                        bitwiseValue143 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue121] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        bitwiseValue144 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue121] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                    }
                    precise float productValue240 = intermediateValue52 * float(sumValue150.x);
                    precise float productValue241 = intermediateValue52 * float(sumValue150.y);
                    precise float productValue242 = intermediateValue52 * float(sumValue150.z);
                    precise float sumValue171 = sumValue147 + productValue240;
                    precise float sumValue172 = sumValue148 + productValue241;
                    precise float sumValue173 = sumValue149 + productValue242;
                    uint productValue243 = productValue150 * (objectInstances_2.packedValues[productValue144] + bitwiseValue71);
                    uint bitwiseValue145 = (bitwiseValue76 + productValue243) >> 1u;
                    f16vec3 sumValue174 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue101)].packedValues[bitwiseValue145], vertexBuffers[nonuniformEXT(sumValue101)].packedValues[bitwiseValue145 + 1u], vertexBuffers[nonuniformEXT(sumValue101)].packedValues[bitwiseValue145 + 2u]));
                    uint bitwiseValue146 = (bitwiseValue78 + productValue243) >> 2u;
                    uint bitwiseValue147 = (bitwiseValue80 + productValue243) >> 2u;
                    float bitwiseValue156;
                    float bitwiseValue157;
                    if (intermediateValue157)
                    {
                        uint bitwiseValue149 = vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue147] >> 15u;
                        bitwiseValue156 = ((float(bitwiseValue149 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue147] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                        bitwiseValue157 = ((float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue147] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue149 & 65534u) * 1.525902189314365386962890625e-05);
                    }
                    else
                    {
                        bitwiseValue156 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue147] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        bitwiseValue157 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue147] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                    }
                    precise float productValue273 = intermediateValue53 * float(sumValue174.x);
                    precise float productValue274 = intermediateValue53 * float(sumValue174.y);
                    precise float productValue275 = intermediateValue53 * float(sumValue174.z);
                    precise float sumValue198 = sumValue171 + productValue273;
                    precise float sumValue199 = sumValue172 + productValue274;
                    precise float sumValue200 = sumValue173 + productValue275;
                    float productValue276 = ((bitwiseValue143 * intermediateValue52) + (bitwiseValue114 * sumValue100)) + (bitwiseValue156 * intermediateValue53);
                    float productValue277 = ((bitwiseValue144 * intermediateValue52) + (bitwiseValue115 * sumValue100)) + (bitwiseValue157 * intermediateValue53);
                    float bitwiseValue158 = (((float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue120] & 255u) * intermediateValue52) + (float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue79] & 255u) * sumValue100)) + (float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue146] & 255u) * intermediateValue53)) * 0.0039215688593685626983642578125;
                    float bitwiseValue159 = (((float((vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue120] >> 8u) & 255u) * intermediateValue52) + (float((vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue79] >> 8u) & 255u) * sumValue100)) + (float((vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue146] >> 8u) & 255u) * intermediateValue53)) * 0.0039215688593685626983642578125;
                    float bitwiseValue160 = (((float((vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue120] >> 16u) & 255u) * intermediateValue52) + (float((vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue79] >> 16u) & 255u) * sumValue100)) + (float((vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue146] >> 16u) & 255u) * intermediateValue53)) * 0.0039215688593685626983642578125;
                    float bitwiseValue161 = (((float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue120] >> 24u) * intermediateValue52) + (float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue79] >> 24u) * sumValue100)) + (float(vertexBuffers_2[nonuniformEXT(sumValue101)].packedValues[bitwiseValue146] >> 24u) * intermediateValue53)) * 0.0039215688593685626983642578125;
                    precise float productValue278 = intermediateValue148 * sumValue198;
                    precise float productValue279 = sumValue199 * intermediateValue149;
                    precise float sumValue201 = productValue279 + productValue278;
                    precise float productValue280 = sumValue200 * intermediateValue150;
                    precise float sumValue202 = productValue280 + sumValue201;
                    precise float productValue281 = 1.0 * reinterpretedBits21.w;
                    precise float sumValue203 = productValue281 + sumValue202;
                    precise float productValue282 = intermediateValue151 * sumValue198;
                    precise float productValue283 = sumValue199 * intermediateValue152;
                    precise float sumValue204 = productValue283 + productValue282;
                    precise float productValue284 = sumValue200 * intermediateValue153;
                    precise float sumValue205 = productValue284 + sumValue204;
                    precise float productValue285 = 1.0 * reinterpretedBits22.w;
                    precise float sumValue206 = productValue285 + sumValue205;
                    precise float productValue286 = intermediateValue154 * sumValue198;
                    precise float productValue287 = sumValue199 * intermediateValue155;
                    precise float sumValue207 = productValue287 + productValue286;
                    precise float productValue288 = sumValue200 * intermediateValue156;
                    precise float sumValue208 = productValue288 + sumValue207;
                    precise float productValue289 = 1.0 * reinterpretedBits23.w;
                    precise float sumValue209 = productValue289 + sumValue208;
                    precise float productValue290 = intermediateValue148 * sumValue96;
                    precise float productValue291 = sumValue97 * intermediateValue149;
                    precise float sumValue210 = productValue291 + productValue290;
                    precise float productValue292 = sumValue98 * intermediateValue150;
                    precise float sumValue211 = productValue292 + sumValue210;
                    precise float productValue293 = intermediateValue151 * sumValue96;
                    precise float productValue294 = sumValue97 * intermediateValue152;
                    precise float sumValue212 = productValue294 + productValue293;
                    precise float productValue295 = sumValue98 * intermediateValue153;
                    precise float sumValue213 = productValue295 + sumValue212;
                    precise float productValue296 = intermediateValue154 * sumValue96;
                    precise float productValue297 = sumValue97 * intermediateValue155;
                    precise float sumValue214 = productValue297 + productValue296;
                    precise float productValue298 = sumValue98 * intermediateValue156;
                    precise float sumValue215 = productValue298 + sumValue214;
                    float inverseLengthValue6 = inversesqrt(dot(vec3(sumValue211, sumValue213, sumValue215), vec3(sumValue211, sumValue213, sumValue215)));
                    precise float productValue299 = sumValue211 * inverseLengthValue6;
                    precise float productValue300 = sumValue213 * inverseLengthValue6;
                    precise float productValue301 = sumValue215 * inverseLengthValue6;
                    bool dotProductValue9 = dot(vec3(sumValue26, sumValue28, sumValue30), vec3(productValue299, productValue300, productValue301)) > 0.0;
                    precise float sumValue216 = (-0.0) - productValue299;
                    precise float sumValue217 = (-0.0) - productValue300;
                    precise float sumValue218 = (-0.0) - productValue301;
                    float comparisonValue62 = dotProductValue9 ? sumValue216 : productValue299;
                    float comparisonValue63 = dotProductValue9 ? sumValue217 : productValue300;
                    float comparisonValue64 = dotProductValue9 ? sumValue218 : productValue301;
                    float intermediateValue238;
                    float intermediateValue239;
                    float intermediateValue240;
                    if (((objectInstances.packedValues[productValue146] & 1us) != 0us) && (floatBitsToUint(ViewCB.packedValues[86u]).y != 0u))
                    {
                        uint sumValue223 = productValue148 + 0u;
                        float sumValue224;
                        float sumValue225;
                        float sumValue226;
                        uint sumValue232;
                        float intermediateValue251 = sumValue100;
                        uint intermediateValue252 = bitwiseValue69;
                        float intermediateValue253 = 0.0;
                        float intermediateValue254 = 0.0;
                        float intermediateValue255 = 0.0;
                        uint intermediateValue256 = 0u;
                        f16vec3 sumValue234;
                        f16vec3 sumValue235;
                        for (;;)
                        {
                            uint sumValue233 = intermediateValue252 + objectInstances_2.packedValues[productValue145];
                            uint productValue310 = sumValue233 * 8u;
                            sumValue234 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue223)].packedValues[productValue310], vertexIrradianceCache[nonuniformEXT(sumValue223)].packedValues[productValue310 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue223)].packedValues[productValue310 + 2u]));
                            uint productValue311 = (sumValue233 * 8u) + 4u;
                            sumValue235 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue223)].packedValues[productValue311], vertexIrradianceCache[nonuniformEXT(sumValue223)].packedValues[productValue311 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue223)].packedValues[productValue311 + 2u]));
                            float16_t intermediateValue269;
                            float16_t intermediateValue270;
                            float16_t intermediateValue271;
                            if (dotProductValue9)
                            {
                                intermediateValue269 = sumValue235.x;
                                intermediateValue270 = sumValue235.y;
                                intermediateValue271 = sumValue235.z;
                            }
                            else
                            {
                                intermediateValue269 = sumValue234.x;
                                intermediateValue270 = sumValue234.y;
                                intermediateValue271 = sumValue234.z;
                            }
                            precise float productValue328 = float(intermediateValue271) * intermediateValue251;
                            precise float productValue329 = float(intermediateValue270) * intermediateValue251;
                            precise float productValue330 = float(intermediateValue269) * intermediateValue251;
                            sumValue224 = productValue330 + intermediateValue253;
                            sumValue225 = productValue329 + intermediateValue254;
                            sumValue226 = productValue328 + intermediateValue255;
                            sumValue232 = intermediateValue256 + 1u;
                            if (sumValue232 == 3u)
                            {
                                break;
                            }
                            intermediateValue251 = intermediateValue1[sumValue232];
                            intermediateValue252 = intermediateValue[sumValue232];
                            intermediateValue253 = sumValue224;
                            intermediateValue254 = sumValue225;
                            intermediateValue255 = sumValue226;
                            intermediateValue256 = sumValue232;
                            continue;
                        }
                        intermediateValue238 = sumValue224;
                        intermediateValue239 = sumValue225;
                        intermediateValue240 = sumValue226;
                    }
                    else
                    {
                        intermediateValue238 = 0.0;
                        intermediateValue239 = 0.0;
                        intermediateValue240 = 0.0;
                    }
                    vec2 reinterpretedBits34 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[intermediateValue212 * 8u]);
                    vec2 reinterpretedBits35 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue212 * 8u) + 1u]);
                    float reinterpretedBits36 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue212 * 16u) + 13u]);
                    float reinterpretedBits37 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue212 * 16u) + 14u]);
                    float nonlinearValue3 = spvNMax(0.0, log2(abs((ViewCB.packedValues[89u].y * intermediateValue7) + (intermediateValue54 * 0.100000001490116119384765625))) + float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(sumValue95)].packedValues[(bitwiseValue72 * 8u) + 6u])));
                    uint reinterpretedBits39;
                    if (objectInstances.packedValues[productValue79] > 4095us)
                    {
                        reinterpretedBits39 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits39 = uint(objectInstances.packedValues[productValue79]);
                    }
                    uint sumValue236 = reinterpretedBits39 + 0u;
                    float intermediateValue261;
                    float intermediateValue262;
                    float intermediateValue263;
                    float intermediateValue264;
                    if (objectInstances.packedValues[productValue79] == 65535us)
                    {
                        intermediateValue261 = 1.0;
                        intermediateValue262 = 1.0;
                        intermediateValue263 = 1.0;
                        intermediateValue264 = 1.0;
                    }
                    else
                    {
                        vec4 sampledTextureValue14 = textureLod(nonuniformEXT(sampler2D(textures[sumValue236], defaultSampler)), vec2(productValue276, productValue277), spvNMin(nonlinearValue3, reinterpretedBits36));
                        intermediateValue261 = sampledTextureValue14.x;
                        intermediateValue262 = sampledTextureValue14.y;
                        intermediateValue263 = sampledTextureValue14.z;
                        intermediateValue264 = sampledTextureValue14.w;
                    }
                    float productValue331;
                    float productValue332;
                    float productValue333;
                    float productValue334;
                    float productValue335;
                    float productValue336;
                    float productValue337;
                    float productValue338;
                    float productValue339;
                    float productValue340;
                    if ((objectInstances.packedValues[productValue81] & 1536us) == 0us)
                    {
                        float intermediateValue279;
                        float intermediateValue280;
                        float intermediateValue281;
                        float intermediateValue282;
                        if ((objectInstances.packedValues[productValue81] & 4us) == 0us)
                        {
                            intermediateValue279 = intermediateValue264;
                            intermediateValue280 = bitwiseValue158;
                            intermediateValue281 = bitwiseValue159;
                            intermediateValue282 = bitwiseValue160;
                        }
                        else
                        {
                            uint reinterpretedBits47;
                            if (objectInstances.packedValues[productValue80] > 4095us)
                            {
                                reinterpretedBits47 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits47 = uint(objectInstances.packedValues[productValue80]);
                            }
                            vec4 sampledTextureValue16 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits47 + 0u], defaultSampler)), vec2(bitwiseValue158, bitwiseValue159), 0.0);
                            intermediateValue279 = 1.0;
                            intermediateValue280 = ((((sampledTextureValue16.x * 2.0) + (-1.0)) * bitwiseValue160) + 1.0) * bitwiseValue161;
                            intermediateValue281 = ((((sampledTextureValue16.y * 2.0) + (-1.0)) * bitwiseValue160) + 1.0) * bitwiseValue161;
                            intermediateValue282 = ((((sampledTextureValue16.z * 2.0) + (-1.0)) * bitwiseValue160) + 1.0) * bitwiseValue161;
                        }
                        float intermediateValue294;
                        float intermediateValue295;
                        float intermediateValue296;
                        if ((objectInstances.packedValues[productValue81] & 8192us) == 0us)
                        {
                            intermediateValue294 = intermediateValue280;
                            intermediateValue295 = intermediateValue281;
                            intermediateValue296 = intermediateValue282;
                        }
                        else
                        {
                            intermediateValue294 = ((1.0 - intermediateValue280) * intermediateValue279) + intermediateValue280;
                            intermediateValue295 = ((1.0 - intermediateValue281) * intermediateValue279) + intermediateValue281;
                            intermediateValue296 = ((1.0 - intermediateValue282) * intermediateValue279) + intermediateValue282;
                        }
                        float intermediateValue305;
                        if ((objectInstances.packedValues[productValue81] & 2048us) == 0us)
                        {
                            intermediateValue305 = intermediateValue279;
                        }
                        else
                        {
                            intermediateValue305 = spvNClamp(fma(intermediateValue279, 2.0, -1.0), 0.0, 1.0);
                        }
                        float bitwiseValue165 = (intermediateValue294 * intermediateValue261) * ((intermediateValue305 * ((float(objectInstances_2.packedValues[productValue82] >> 24u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                        float bitwiseValue166 = (intermediateValue295 * intermediateValue262) * ((intermediateValue305 * ((float((objectInstances_2.packedValues[productValue82] >> 16u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                        float bitwiseValue167 = (intermediateValue296 * intermediateValue263) * ((intermediateValue305 * ((float((objectInstances_2.packedValues[productValue82] >> 8u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                        float productValue401;
                        if (bitwiseValue165 < 0.040449999272823333740234375)
                        {
                            productValue401 = bitwiseValue165 * 0.077399380505084991455078125;
                        }
                        else
                        {
                            productValue401 = exp2(log2((bitwiseValue165 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                        }
                        float productValue439;
                        if (bitwiseValue166 < 0.040449999272823333740234375)
                        {
                            productValue439 = bitwiseValue166 * 0.077399380505084991455078125;
                        }
                        else
                        {
                            productValue439 = exp2(log2((bitwiseValue166 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                        }
                        float productValue481;
                        if (bitwiseValue167 < 0.040449999272823333740234375)
                        {
                            productValue481 = bitwiseValue167 * 0.077399380505084991455078125;
                        }
                        else
                        {
                            productValue481 = exp2(log2((bitwiseValue167 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                        }
                        float reinterpretedBits51;
                        float reinterpretedBits52;
                        float reinterpretedBits53;
                        if ((pbrTextureDataBuffer.packedValues[(intermediateValue212 * 16u) + 8u] & 1u) == 0u)
                        {
                            reinterpretedBits51 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue212 * 16u) + 11u]);
                            reinterpretedBits52 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue212 * 16u) + 9u]);
                            reinterpretedBits53 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue212 * 16u) + 10u]);
                        }
                        else
                        {
                            vec4 sampledTextureValue24 = textureLod(nonuniformEXT(sampler2D(textures[sumValue236], defaultSampler)), vec2(fma(productValue276, reinterpretedBits34.x, reinterpretedBits35.x), fma(productValue277, reinterpretedBits34.y, reinterpretedBits35.y)), spvNMin((reinterpretedBits37 - reinterpretedBits36) + nonlinearValue3, reinterpretedBits37));
                            reinterpretedBits51 = sampledTextureValue24.x;
                            reinterpretedBits52 = sampledTextureValue24.z;
                            reinterpretedBits53 = fma(sampledTextureValue24.y, sampledTextureValue24.y, 0.0);
                        }
                        float sumValue370 = 1.0 - reinterpretedBits51;
                        float productValue513 = sumValue370 * productValue401;
                        float productValue514 = sumValue370 * productValue439;
                        float productValue515 = sumValue370 * productValue481;
                        float dotProductValue21 = dot(vec3(productValue401, productValue439, productValue481), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                        float productValue516 = (reinterpretedBits53 * 5.0) * ViewCB.packedValues[84u].w;
                        productValue331 = reinterpretedBits52 - (ViewCB.packedValues[85u].w * reinterpretedBits52);
                        productValue332 = productValue516 * (((dotProductValue21 - productValue401) * ViewCB.packedValues[85u].x) + productValue401);
                        productValue333 = productValue516 * (((dotProductValue21 - productValue439) * ViewCB.packedValues[85u].x) + productValue439);
                        productValue334 = productValue516 * (((dotProductValue21 - productValue481) * ViewCB.packedValues[85u].x) + productValue481);
                        productValue335 = (reinterpretedBits51 * (productValue401 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                        productValue336 = (reinterpretedBits51 * (productValue439 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                        productValue337 = (reinterpretedBits51 * (productValue481 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                        productValue338 = productValue513 - (productValue513 * reinterpretedBits53);
                        productValue339 = productValue514 - (productValue514 * reinterpretedBits53);
                        productValue340 = productValue515 - (productValue515 * reinterpretedBits53);
                    }
                    else
                    {
                        productValue331 = intermediateValue268;
                        productValue332 = intermediateValue268;
                        productValue333 = intermediateValue268;
                        productValue334 = intermediateValue268;
                        productValue335 = intermediateValue268;
                        productValue336 = intermediateValue268;
                        productValue337 = intermediateValue268;
                        productValue338 = intermediateValue268;
                        productValue339 = intermediateValue268;
                        productValue340 = intermediateValue268;
                    }
                    float productValue341 = ((productValue332 * comparisonValue36) * ViewCB.packedValues[85u].y) + productValue99;
                    float productValue342 = ((productValue333 * comparisonValue37) * ViewCB.packedValues[85u].y) + productValue100;
                    float productValue343 = ((productValue334 * comparisonValue38) * ViewCB.packedValues[85u].y) + productValue101;
                    float intermediateValue143;
                    float intermediateValue145;
                    float intermediateValue147;
                    if (floatBitsToUint(ViewCB.packedValues[86u]).y == 0u)
                    {
                        intermediateValue143 = productValue341;
                        intermediateValue145 = productValue342;
                        intermediateValue147 = productValue343;
                    }
                    else
                    {
                        intermediateValue143 = productValue341 + ((intermediateValue238 * comparisonValue36) * productValue338);
                        intermediateValue145 = productValue342 + ((intermediateValue239 * comparisonValue37) * productValue339);
                        intermediateValue147 = productValue343 + ((intermediateValue240 * comparisonValue38) * productValue340);
                    }
                    precise float productValue350 = comparisonValue62 * 256.0;
                    uint intermediateValue283 = uint(int(productValue350));
                    precise float productValue351 = comparisonValue63 * 256.0;
                    uint intermediateValue284 = uint(int(productValue351));
                    precise float productValue352 = comparisonValue64 * 256.0;
                    uint intermediateValue285 = uint(int(productValue352));
                    precise float productValue353 = comparisonValue62 * 1.52587890625e-05;
                    precise float sumValue240 = sumValue203 + productValue353;
                    float reinterpretedBits43 = (abs(sumValue203) < 0.03125) ? sumValue240 : uintBitsToFloat(((sumValue203 < 0.0) ? (-intermediateValue283) : intermediateValue283) + floatBitsToUint(sumValue203));
                    precise float productValue354 = comparisonValue63 * 1.52587890625e-05;
                    precise float sumValue241 = sumValue206 + productValue354;
                    float reinterpretedBits44 = (abs(sumValue206) < 0.03125) ? sumValue241 : uintBitsToFloat(((sumValue206 < 0.0) ? (-intermediateValue284) : intermediateValue284) + floatBitsToUint(sumValue206));
                    precise float productValue355 = comparisonValue64 * 1.52587890625e-05;
                    precise float sumValue242 = sumValue209 + productValue355;
                    float reinterpretedBits45 = (abs(sumValue209) < 0.03125) ? sumValue242 : uintBitsToFloat(((sumValue209 < 0.0) ? (-intermediateValue285) : intermediateValue285) + floatBitsToUint(sumValue209));
                    float intermediateValue297;
                    float intermediateValue298;
                    float intermediateValue299;
                    if (dot(vec3(ViewCB.packedValues[52u].xyz), vec3(comparisonValue62, comparisonValue63, comparisonValue64)) < 0.0)
                    {
                        intermediateValue297 = 0.0;
                        intermediateValue298 = 0.0;
                        intermediateValue299 = 0.0;
                    }
                    else
                    {
                        rayQueryInitializeEXT(intermediateValue300, SceneBVH, 512u, 32u, vec3(reinterpretedBits43, reinterpretedBits44, reinterpretedBits45), 0.0, vec3(ViewCB.packedValues[53u].xyz), 10000.0);
                        bool intermediateValue301 = rayQueryProceedEXT(intermediateValue300);
                        if (intermediateValue301)
                        {
                            bool intermediateValue334;
                            bool comparisonValue72;
                            for (;;)
                            {
                                uint intermediateValue311 = rayQueryGetIntersectionTypeEXT(intermediateValue300, bool(0u));
                                comparisonValue72 = intermediateValue311 == 0u;
                                if (comparisonValue72)
                                {
                                    vec2 intermediateValue328 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue300, bool(0u));
                                    vec2 intermediateValue329 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue300, bool(0u));
                                    uint intermediateValue330 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue300, bool(0u));
                                    uint intermediateValue331 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue300, bool(0u));
                                    uint intermediateValue332 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue300, bool(0u));
                                    uint productValue402 = (intermediateValue332 * 76u) + 58u;
                                    uint productValue403 = (intermediateValue332 * 76u) + 61u;
                                    precise float sumValue275 = 1.0 - intermediateValue328.x;
                                    precise float sumValue276 = sumValue275 - intermediateValue329.y;
                                    uint bitwiseValue169 = (objectInstances_2.packedValues[(intermediateValue332 * 38u) + 25u] >> 2u) + (intermediateValue330 >> 1u);
                                    uint productValue404 = uint(objectInstances.packedValues[(intermediateValue332 * 76u) + 54u]) + 0u;
                                    bool comparisonValue78 = (intermediateValue330 & 1u) == 0u;
                                    uint comparisonValue79 = comparisonValue78 ? faceUvBuffersRW[nonuniformEXT(productValue404)].packedValues[bitwiseValue169].z : faceUvBuffersRW[nonuniformEXT(productValue404)].packedValues[bitwiseValue169].x;
                                    uint comparisonValue80 = comparisonValue78 ? faceUvBuffersRW[nonuniformEXT(productValue404)].packedValues[bitwiseValue169].y : faceUvBuffersRW[nonuniformEXT(productValue404)].packedValues[bitwiseValue169].w;
                                    uint comparisonValue81 = comparisonValue78 ? faceUvBuffersRW[nonuniformEXT(productValue404)].packedValues[bitwiseValue169].x : faceUvBuffersRW[nonuniformEXT(productValue404)].packedValues[bitwiseValue169].z;
                                    bool intermediateValue333 = int16_t(objectInstances.packedValues[productValue403]) < int16_t(0us);
                                    float intermediateValue382;
                                    float intermediateValue383;
                                    if (intermediateValue333)
                                    {
                                        uint bitwiseValue177 = comparisonValue81 >> 15u;
                                        precise float bitwiseValue178 = float(bitwiseValue177 & 1u) * 2.0;
                                        precise float sumValue299 = bitwiseValue178 + (-1.0);
                                        precise float bitwiseValue179 = float(comparisonValue81 >> 31u) * 2.0;
                                        precise float sumValue300 = bitwiseValue179 + (-1.0);
                                        precise float bitwiseValue180 = float((comparisonValue81 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue181 = float(bitwiseValue177 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue430 = sumValue299 * 3.0517578125e-05;
                                        precise float productValue431 = sumValue300 * 3.0517578125e-05;
                                        precise float sumValue301 = bitwiseValue180 + productValue430;
                                        precise float sumValue302 = bitwiseValue181 + productValue431;
                                        intermediateValue382 = sumValue301;
                                        intermediateValue383 = sumValue302;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue182 = float(comparisonValue81 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue183 = float(comparisonValue81 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue432 = bitwiseValue182 * 16384.0;
                                        precise float sumValue303 = productValue432 + 0.5;
                                        precise float productValue433 = bitwiseValue183 * 16384.0;
                                        precise float sumValue304 = productValue433 + 0.5;
                                        precise float productValue434 = floor(sumValue303) * 6.103515625e-05;
                                        precise float productValue435 = floor(sumValue304) * 6.103515625e-05;
                                        intermediateValue382 = productValue434;
                                        intermediateValue383 = productValue435;
                                    }
                                    precise float productValue440 = sumValue276 * intermediateValue382;
                                    precise float productValue441 = sumValue276 * intermediateValue383;
                                    precise float sumValue307 = productValue440 + 0.0;
                                    precise float sumValue308 = productValue441 + 0.0;
                                    float intermediateValue458;
                                    float intermediateValue459;
                                    if (intermediateValue333)
                                    {
                                        uint bitwiseValue193 = comparisonValue80 >> 15u;
                                        precise float bitwiseValue194 = float(bitwiseValue193 & 1u) * 2.0;
                                        precise float sumValue319 = bitwiseValue194 + (-1.0);
                                        precise float bitwiseValue195 = float(comparisonValue80 >> 31u) * 2.0;
                                        precise float sumValue320 = bitwiseValue195 + (-1.0);
                                        precise float bitwiseValue196 = float((comparisonValue80 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue197 = float(bitwiseValue193 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue454 = sumValue319 * 3.0517578125e-05;
                                        precise float productValue455 = sumValue320 * 3.0517578125e-05;
                                        precise float sumValue321 = bitwiseValue196 + productValue454;
                                        precise float sumValue322 = bitwiseValue197 + productValue455;
                                        intermediateValue458 = sumValue321;
                                        intermediateValue459 = sumValue322;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue198 = float(comparisonValue80 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue199 = float(comparisonValue80 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue456 = bitwiseValue198 * 16384.0;
                                        precise float sumValue323 = productValue456 + 0.5;
                                        precise float productValue457 = bitwiseValue199 * 16384.0;
                                        precise float sumValue324 = productValue457 + 0.5;
                                        precise float productValue458 = floor(sumValue323) * 6.103515625e-05;
                                        precise float productValue459 = floor(sumValue324) * 6.103515625e-05;
                                        intermediateValue458 = productValue458;
                                        intermediateValue459 = productValue459;
                                    }
                                    precise float productValue482 = intermediateValue328.x * intermediateValue458;
                                    precise float productValue483 = intermediateValue328.x * intermediateValue459;
                                    precise float sumValue343 = sumValue307 + productValue482;
                                    precise float sumValue344 = sumValue308 + productValue483;
                                    float intermediateValue496;
                                    float intermediateValue497;
                                    if (intermediateValue333)
                                    {
                                        uint bitwiseValue238 = comparisonValue79 >> 15u;
                                        precise float bitwiseValue239 = float(bitwiseValue238 & 1u) * 2.0;
                                        precise float sumValue371 = bitwiseValue239 + (-1.0);
                                        precise float bitwiseValue240 = float(comparisonValue79 >> 31u) * 2.0;
                                        precise float sumValue372 = bitwiseValue240 + (-1.0);
                                        precise float bitwiseValue241 = float((comparisonValue79 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue242 = float(bitwiseValue238 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue517 = sumValue371 * 3.0517578125e-05;
                                        precise float productValue518 = sumValue372 * 3.0517578125e-05;
                                        precise float sumValue373 = bitwiseValue241 + productValue517;
                                        precise float sumValue374 = bitwiseValue242 + productValue518;
                                        intermediateValue496 = sumValue373;
                                        intermediateValue497 = sumValue374;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue243 = float(comparisonValue79 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue244 = float(comparisonValue79 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue519 = bitwiseValue243 * 16384.0;
                                        precise float sumValue375 = productValue519 + 0.5;
                                        precise float productValue520 = bitwiseValue244 * 16384.0;
                                        precise float sumValue376 = productValue520 + 0.5;
                                        precise float productValue521 = floor(sumValue375) * 6.103515625e-05;
                                        precise float productValue522 = floor(sumValue376) * 6.103515625e-05;
                                        intermediateValue496 = productValue521;
                                        intermediateValue497 = productValue522;
                                    }
                                    precise float productValue550 = intermediateValue329.y * intermediateValue496;
                                    precise float productValue551 = intermediateValue329.y * intermediateValue497;
                                    precise float sumValue403 = sumValue343 + productValue550;
                                    precise float sumValue404 = sumValue344 + productValue551;
                                    float intermediateValue505;
                                    if (objectInstances.packedValues[productValue402] == 65535us)
                                    {
                                        intermediateValue505 = 1.0;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits55;
                                        if (objectInstances.packedValues[productValue402] > 4095us)
                                        {
                                            reinterpretedBits55 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits55 = uint(objectInstances.packedValues[productValue402]);
                                        }
                                        intermediateValue505 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits55 + 0u], defaultSampler)), vec2(sumValue403, sumValue404), -0.25).w;
                                    }
                                    uint comparisonValue120;
                                    if (intermediateValue331 == 2u)
                                    {
                                        comparisonValue120 = 0u;
                                    }
                                    else
                                    {
                                        comparisonValue120 = uint(intermediateValue505 <= (((objectInstances.packedValues[productValue403] & 4352us) != 0us) ? 0.5 : 0.0));
                                    }
                                    if (comparisonValue120 == 0u)
                                    {
                                        rayQueryConfirmIntersectionEXT(intermediateValue300);
                                    }
                                }
                                intermediateValue334 = rayQueryProceedEXT(intermediateValue300);
                                if (intermediateValue334)
                                {
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                        uint intermediateValue307 = rayQueryGetIntersectionTypeEXT(intermediateValue300, bool(1u));
                        float intermediateValue313;
                        if (intermediateValue307 == 1u)
                        {
                            float intermediateValue312 = rayQueryGetIntersectionTEXT(intermediateValue300, bool(1u));
                            intermediateValue313 = intermediateValue312;
                        }
                        else
                        {
                            intermediateValue313 = 10000.0;
                        }
                        float branchMergedValue41;
                        float branchMergedValue67;
                        float branchMergedValue68;
                        if (intermediateValue313 < 10000.0)
                        {
                            precise float productValue405 = intermediateValue313 * ViewCB.packedValues[63u].x;
                            precise float productValue406 = intermediateValue313 * ViewCB.packedValues[63u].y;
                            precise float productValue407 = intermediateValue313 * ViewCB.packedValues[63u].z;
                            precise float productValue408 = productValue405 * (-1.44269502162933349609375);
                            precise float productValue409 = productValue406 * (-1.44269502162933349609375);
                            precise float productValue410 = productValue407 * (-1.44269502162933349609375);
                            precise float productValue411 = ViewCB.packedValues[53u].x * intermediateValue313;
                            precise float sumValue277 = productValue411 + reinterpretedBits43;
                            precise float productValue412 = ViewCB.packedValues[53u].z * intermediateValue313;
                            precise float sumValue278 = productValue412 + reinterpretedBits45;
                            precise float productValue413 = sumValue277 * ViewCB.packedValues[83u].z;
                            precise float sumValue279 = productValue413 + ViewCB.packedValues[84u].x;
                            precise float productValue414 = sumValue278 * ViewCB.packedValues[83u].w;
                            precise float sumValue280 = productValue414 + ViewCB.packedValues[84u].y;
                            vec4 sampledTextureValue20 = textureLod(sampler2D(wibblyTexture, linearWrapSampler), vec2(sumValue279, sumValue280), 0.0);
                            precise float sumValue281 = sampledTextureValue20.x + (-0.5);
                            precise float sumValue282 = sampledTextureValue20.y + (-0.5);
                            precise float productValue415 = sumValue277 * ViewCB.packedValues[82u].z;
                            precise float sumValue283 = productValue415 + ViewCB.packedValues[83u].x;
                            precise float productValue416 = sumValue278 * ViewCB.packedValues[82u].w;
                            precise float sumValue284 = productValue416 + ViewCB.packedValues[83u].y;
                            precise float productValue417 = sumValue281 * 0.4000000059604644775390625;
                            precise float productValue418 = sumValue282 * 0.4000000059604644775390625;
                            precise float sumValue285 = sumValue283 + productValue417;
                            precise float sumValue286 = productValue418 + sumValue284;
                            precise float productValue419 = ViewCB.packedValues[68u].w * 63.0;
                            uint intermediateValue335 = uint(int(floor(productValue419)));
                            precise float productValue420 = float(int(intermediateValue335 + 1u)) * 0.015625;
                            precise float sumValue287 = (-0.0) - productValue420;
                            float intermediateValue336 = fract(abs(productValue420));
                            precise float sumValue288 = (-0.0) - intermediateValue336;
                            precise float comparisonValue82 = ((productValue420 >= sumValue287) ? intermediateValue336 : sumValue288) * 64.0;
                            vec4 sampledTextureValue21 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue285, sumValue286, float(int(intermediateValue335))), 0.0);
                            float intermediateValue337 = sampledTextureValue21.x;
                            precise float sampledTextureValue22 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue285, sumValue286, float(int(uint(int(comparisonValue82))))), 0.0).x - intermediateValue337;
                            precise float productValue421 = fract(productValue419) * sampledTextureValue22;
                            precise float sumValue289 = intermediateValue337 + productValue421;
                            precise float productValue422 = sumValue289 * 7.0;
                            precise float sumValue290 = productValue422 + 0.800000011920928955078125;
                            precise float productValue423 = intermediateValue313 * (-0.100000001490116119384765625);
                            precise float sumValue291 = sumValue290 + (-1.0);
                            precise float exponentialValue8 = exp2(productValue423) * sumValue291;
                            precise float sumValue292 = exponentialValue8 + 1.0;
                            precise float exponentialValue9 = exp2(productValue408) * sumValue292;
                            precise float exponentialValue10 = exp2(productValue409) * sumValue292;
                            precise float exponentialValue11 = exp2(productValue410) * sumValue292;
                            rayQueryInitializeEXT(intermediateValue338, SceneBVH, 512u, 22u, vec3(reinterpretedBits43, reinterpretedBits44, reinterpretedBits45), 0.0, vec3(ViewCB.packedValues[53u].xyz), intermediateValue313);
                            bool intermediateValue339 = rayQueryProceedEXT(intermediateValue338);
                            float intermediateValue356;
                            float intermediateValue358;
                            float intermediateValue360;
                            if (intermediateValue339)
                            {
                                float intermediateValue357;
                                float intermediateValue359;
                                float intermediateValue361;
                                float intermediateValue384 = exponentialValue9;
                                float intermediateValue385 = exponentialValue10;
                                float intermediateValue386 = exponentialValue11;
                                bool comparisonValue89;
                                for (;;)
                                {
                                    uint intermediateValue387 = rayQueryGetIntersectionTypeEXT(intermediateValue338, bool(0u));
                                    comparisonValue89 = intermediateValue387 == 0u;
                                    float branchMergedValue4;
                                    float branchMergedValue17;
                                    float branchMergedValue18;
                                    if (comparisonValue89)
                                    {
                                        vec2 intermediateValue423 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue338, bool(0u));
                                        vec2 intermediateValue424 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue338, bool(0u));
                                        float intermediateValue425 = rayQueryGetIntersectionTEXT(intermediateValue338, bool(0u));
                                        uint intermediateValue426 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue338, bool(0u));
                                        uint intermediateValue427 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue338, bool(0u));
                                        uint intermediateValue428 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue338, bool(0u));
                                        uint productValue460 = (intermediateValue428 * 76u) + 58u;
                                        uint productValue461 = (intermediateValue428 * 76u) + 61u;
                                        precise float sumValue325 = 1.0 - intermediateValue423.x;
                                        precise float sumValue326 = sumValue325 - intermediateValue424.y;
                                        uint bitwiseValue200 = (objectInstances_2.packedValues[(intermediateValue428 * 38u) + 25u] >> 2u) + (intermediateValue426 >> 1u);
                                        uint productValue462 = uint(objectInstances.packedValues[(intermediateValue428 * 76u) + 54u]) + 0u;
                                        bool comparisonValue100 = (intermediateValue426 & 1u) == 0u;
                                        uint comparisonValue101 = comparisonValue100 ? faceUvBuffersRW[nonuniformEXT(productValue462)].packedValues[bitwiseValue200].z : faceUvBuffersRW[nonuniformEXT(productValue462)].packedValues[bitwiseValue200].x;
                                        uint comparisonValue102 = comparisonValue100 ? faceUvBuffersRW[nonuniformEXT(productValue462)].packedValues[bitwiseValue200].y : faceUvBuffersRW[nonuniformEXT(productValue462)].packedValues[bitwiseValue200].w;
                                        uint comparisonValue103 = comparisonValue100 ? faceUvBuffersRW[nonuniformEXT(productValue462)].packedValues[bitwiseValue200].x : faceUvBuffersRW[nonuniformEXT(productValue462)].packedValues[bitwiseValue200].z;
                                        bool intermediateValue429 = int16_t(objectInstances.packedValues[productValue461]) < int16_t(0us);
                                        float intermediateValue479;
                                        float intermediateValue480;
                                        if (intermediateValue429)
                                        {
                                            uint bitwiseValue216 = comparisonValue103 >> 15u;
                                            precise float bitwiseValue217 = float(bitwiseValue216 & 1u) * 2.0;
                                            precise float sumValue345 = bitwiseValue217 + (-1.0);
                                            precise float bitwiseValue218 = float(comparisonValue103 >> 31u) * 2.0;
                                            precise float sumValue346 = bitwiseValue218 + (-1.0);
                                            precise float bitwiseValue219 = float((comparisonValue103 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue220 = float(bitwiseValue216 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue484 = sumValue345 * 3.0517578125e-05;
                                            precise float productValue485 = sumValue346 * 3.0517578125e-05;
                                            precise float sumValue347 = bitwiseValue219 + productValue484;
                                            precise float sumValue348 = bitwiseValue220 + productValue485;
                                            intermediateValue479 = sumValue347;
                                            intermediateValue480 = sumValue348;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue221 = float(comparisonValue103 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue222 = float(comparisonValue103 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue486 = bitwiseValue221 * 16384.0;
                                            precise float sumValue349 = productValue486 + 0.5;
                                            precise float productValue487 = bitwiseValue222 * 16384.0;
                                            precise float sumValue350 = productValue487 + 0.5;
                                            precise float productValue488 = floor(sumValue349) * 6.103515625e-05;
                                            precise float productValue489 = floor(sumValue350) * 6.103515625e-05;
                                            intermediateValue479 = productValue488;
                                            intermediateValue480 = productValue489;
                                        }
                                        precise float productValue523 = sumValue326 * intermediateValue479;
                                        precise float productValue524 = sumValue326 * intermediateValue480;
                                        precise float sumValue377 = productValue523 + 0.0;
                                        precise float sumValue378 = productValue524 + 0.0;
                                        float intermediateValue506;
                                        float intermediateValue507;
                                        if (intermediateValue429)
                                        {
                                            uint bitwiseValue267 = comparisonValue102 >> 15u;
                                            precise float bitwiseValue268 = float(bitwiseValue267 & 1u) * 2.0;
                                            precise float sumValue405 = bitwiseValue268 + (-1.0);
                                            precise float bitwiseValue269 = float(comparisonValue102 >> 31u) * 2.0;
                                            precise float sumValue406 = bitwiseValue269 + (-1.0);
                                            precise float bitwiseValue270 = float((comparisonValue102 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue271 = float(bitwiseValue267 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue552 = sumValue405 * 3.0517578125e-05;
                                            precise float productValue553 = sumValue406 * 3.0517578125e-05;
                                            precise float sumValue407 = bitwiseValue270 + productValue552;
                                            precise float sumValue408 = bitwiseValue271 + productValue553;
                                            intermediateValue506 = sumValue407;
                                            intermediateValue507 = sumValue408;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue272 = float(comparisonValue102 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue273 = float(comparisonValue102 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue554 = bitwiseValue272 * 16384.0;
                                            precise float sumValue409 = productValue554 + 0.5;
                                            precise float productValue555 = bitwiseValue273 * 16384.0;
                                            precise float sumValue410 = productValue555 + 0.5;
                                            precise float productValue556 = floor(sumValue409) * 6.103515625e-05;
                                            precise float productValue557 = floor(sumValue410) * 6.103515625e-05;
                                            intermediateValue506 = productValue556;
                                            intermediateValue507 = productValue557;
                                        }
                                        precise float productValue576 = intermediateValue423.x * intermediateValue506;
                                        precise float productValue577 = intermediateValue423.x * intermediateValue507;
                                        precise float sumValue429 = sumValue377 + productValue576;
                                        precise float sumValue430 = sumValue378 + productValue577;
                                        float intermediateValue518;
                                        float intermediateValue519;
                                        if (intermediateValue429)
                                        {
                                            uint bitwiseValue309 = comparisonValue101 >> 15u;
                                            precise float bitwiseValue310 = float(bitwiseValue309 & 1u) * 2.0;
                                            precise float sumValue453 = bitwiseValue310 + (-1.0);
                                            precise float bitwiseValue311 = float(comparisonValue101 >> 31u) * 2.0;
                                            precise float sumValue454 = bitwiseValue311 + (-1.0);
                                            precise float bitwiseValue312 = float((comparisonValue101 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue313 = float(bitwiseValue309 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue600 = sumValue453 * 3.0517578125e-05;
                                            precise float productValue601 = sumValue454 * 3.0517578125e-05;
                                            precise float sumValue455 = bitwiseValue312 + productValue600;
                                            precise float sumValue456 = bitwiseValue313 + productValue601;
                                            intermediateValue518 = sumValue455;
                                            intermediateValue519 = sumValue456;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue314 = float(comparisonValue101 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue315 = float(comparisonValue101 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue602 = bitwiseValue314 * 16384.0;
                                            precise float sumValue457 = productValue602 + 0.5;
                                            precise float productValue603 = bitwiseValue315 * 16384.0;
                                            precise float sumValue458 = productValue603 + 0.5;
                                            precise float productValue604 = floor(sumValue457) * 6.103515625e-05;
                                            precise float productValue605 = floor(sumValue458) * 6.103515625e-05;
                                            intermediateValue518 = productValue604;
                                            intermediateValue519 = productValue605;
                                        }
                                        precise float productValue626 = intermediateValue424.y * intermediateValue518;
                                        precise float productValue627 = intermediateValue424.y * intermediateValue519;
                                        precise float sumValue479 = sumValue429 + productValue626;
                                        precise float sumValue480 = sumValue430 + productValue627;
                                        precise float productValue628 = intermediateValue425 * 0.083333335816860198974609375;
                                        precise float sumValue481 = productValue628 + (-0.25);
                                        float intermediateValue532;
                                        float intermediateValue533;
                                        float intermediateValue534;
                                        float intermediateValue535;
                                        if (objectInstances.packedValues[productValue460] == 65535us)
                                        {
                                            intermediateValue532 = 1.0;
                                            intermediateValue533 = 1.0;
                                            intermediateValue534 = 1.0;
                                            intermediateValue535 = 1.0;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits58;
                                            if (objectInstances.packedValues[productValue460] > 4095us)
                                            {
                                                reinterpretedBits58 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits58 = uint(objectInstances.packedValues[productValue460]);
                                            }
                                            vec4 sampledTextureValue27 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits58 + 0u], defaultSampler)), vec2(sumValue479, sumValue480), spvNMin(sumValue481, 2.0));
                                            intermediateValue532 = sampledTextureValue27.x;
                                            intermediateValue533 = sampledTextureValue27.y;
                                            intermediateValue534 = sampledTextureValue27.z;
                                            intermediateValue535 = sampledTextureValue27.w;
                                        }
                                        float intermediateValue554;
                                        float intermediateValue555;
                                        float intermediateValue556;
                                        if (intermediateValue427 == 2u)
                                        {
                                            float branchMergedValue44;
                                            float branchMergedValue73;
                                            float branchMergedValue74;
                                            if ((objectInstances.packedValues[productValue461] & 128us) == 0us)
                                            {
                                                float intermediateValue568;
                                                if ((objectInstances.packedValues[productValue461] & 2048us) == 0us)
                                                {
                                                    intermediateValue568 = intermediateValue535;
                                                }
                                                else
                                                {
                                                    precise float productValue675 = intermediateValue535 * 2.0;
                                                    precise float sumValue533 = productValue675 + (-1.0);
                                                    intermediateValue568 = spvNClamp(sumValue533, 0.0, 1.0);
                                                }
                                                precise float sumValue530 = 0.0 - intermediateValue532;
                                                precise float sumValue531 = 0.0 - intermediateValue533;
                                                precise float sumValue532 = 0.0 - intermediateValue534;
                                                precise float productValue672 = sumValue530 * intermediateValue568;
                                                precise float productValue673 = sumValue531 * intermediateValue568;
                                                precise float productValue674 = sumValue532 * intermediateValue568;
                                                precise float sumValue515 = intermediateValue532 + productValue672;
                                                precise float sumValue516 = intermediateValue533 + productValue673;
                                                precise float sumValue517 = intermediateValue534 + productValue674;
                                                branchMergedValue44 = sumValue516;
                                                branchMergedValue73 = sumValue515;
                                                branchMergedValue74 = sumValue517;
                                            }
                                            else
                                            {
                                                branchMergedValue44 = 0.33399999141693115234375;
                                                branchMergedValue73 = 0.33399999141693115234375;
                                                branchMergedValue74 = 0.33399999141693115234375;
                                            }
                                            intermediateValue554 = branchMergedValue73;
                                            intermediateValue555 = branchMergedValue44;
                                            intermediateValue556 = branchMergedValue74;
                                        }
                                        else
                                        {
                                            precise float sumValue504 = 1.0 - intermediateValue535;
                                            intermediateValue554 = sumValue504;
                                            intermediateValue555 = sumValue504;
                                            intermediateValue556 = sumValue504;
                                        }
                                        precise float productValue658 = intermediateValue384 * intermediateValue554;
                                        precise float productValue659 = intermediateValue385 * intermediateValue555;
                                        precise float productValue660 = intermediateValue386 * intermediateValue556;
                                        float intermediateValue430;
                                        float intermediateValue431;
                                        float intermediateValue432;
                                        bool intermediateValue569;
                                        if (!(dot(vec3(productValue658, productValue659, productValue660), vec3(1.0)) <= 0.00999999977648258209228515625))
                                        {
                                            intermediateValue569 = false;
                                            intermediateValue430 = productValue658;
                                            intermediateValue431 = productValue659;
                                            intermediateValue432 = productValue660;
                                        }
                                        else
                                        {
                                            intermediateValue569 = true;
                                            intermediateValue430 = 0.0;
                                            intermediateValue431 = 0.0;
                                            intermediateValue432 = 0.0;
                                        }
                                        float branchMergedValue85;
                                        float branchMergedValue97;
                                        float branchMergedValue98;
                                        if (intermediateValue569)
                                        {
                                            rayQueryConfirmIntersectionEXT(intermediateValue338);
                                            branchMergedValue85 = intermediateValue432;
                                            branchMergedValue97 = intermediateValue431;
                                            branchMergedValue98 = intermediateValue430;
                                        }
                                        else
                                        {
                                            branchMergedValue85 = intermediateValue432;
                                            branchMergedValue97 = intermediateValue431;
                                            branchMergedValue98 = intermediateValue430;
                                        }
                                        branchMergedValue4 = branchMergedValue85;
                                        branchMergedValue17 = branchMergedValue97;
                                        branchMergedValue18 = branchMergedValue98;
                                    }
                                    else
                                    {
                                        branchMergedValue4 = intermediateValue386;
                                        branchMergedValue17 = intermediateValue385;
                                        branchMergedValue18 = intermediateValue384;
                                    }
                                    intermediateValue361 = branchMergedValue4;
                                    intermediateValue359 = branchMergedValue17;
                                    intermediateValue357 = branchMergedValue18;
                                    bool intermediateValue433 = rayQueryProceedEXT(intermediateValue338);
                                    if (intermediateValue433)
                                    {
                                        intermediateValue384 = intermediateValue357;
                                        intermediateValue385 = intermediateValue359;
                                        intermediateValue386 = intermediateValue361;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue356 = intermediateValue357;
                                intermediateValue358 = intermediateValue359;
                                intermediateValue360 = intermediateValue361;
                            }
                            else
                            {
                                intermediateValue356 = exponentialValue9;
                                intermediateValue358 = exponentialValue10;
                                intermediateValue360 = exponentialValue11;
                            }
                            uint intermediateValue362 = rayQueryGetIntersectionTypeEXT(intermediateValue338, bool(1u));
                            bool comparisonValue85 = intermediateValue362 == 1u;
                            float comparisonValue68 = comparisonValue85 ? 0.0 : intermediateValue356;
                            float comparisonValue69 = comparisonValue85 ? 0.0 : intermediateValue358;
                            float comparisonValue70 = comparisonValue85 ? 0.0 : intermediateValue360;
                            float branchMergedValue114;
                            float branchMergedValue122;
                            float branchMergedValue123;
                            if (dot(vec3(comparisonValue68, comparisonValue69, comparisonValue70), vec3(1.0)) > 0.00999999977648258209228515625)
                            {
                                rayQueryInitializeEXT(intermediateValue388, SceneBVH, 512u, 22u, vec3(sumValue277, fma(ViewCB.packedValues[53u].y, intermediateValue313, reinterpretedBits44), sumValue278), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                                bool intermediateValue389 = rayQueryProceedEXT(intermediateValue388);
                                float intermediateValue434;
                                float intermediateValue436;
                                float intermediateValue438;
                                if (intermediateValue389)
                                {
                                    float intermediateValue435;
                                    float intermediateValue437;
                                    float intermediateValue439;
                                    float intermediateValue460 = comparisonValue68;
                                    float intermediateValue461 = comparisonValue69;
                                    float intermediateValue462 = comparisonValue70;
                                    bool comparisonValue110;
                                    for (;;)
                                    {
                                        uint intermediateValue463 = rayQueryGetIntersectionTypeEXT(intermediateValue388, bool(0u));
                                        comparisonValue110 = intermediateValue463 == 0u;
                                        float branchMergedValue7;
                                        float branchMergedValue23;
                                        float branchMergedValue24;
                                        if (comparisonValue110)
                                        {
                                            vec2 intermediateValue481 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue388, bool(0u));
                                            vec2 intermediateValue482 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue388, bool(0u));
                                            float intermediateValue483 = rayQueryGetIntersectionTEXT(intermediateValue388, bool(0u));
                                            uint intermediateValue484 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue388, bool(0u));
                                            uint intermediateValue485 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue388, bool(0u));
                                            uint intermediateValue486 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue388, bool(0u));
                                            uint productValue525 = (intermediateValue486 * 76u) + 58u;
                                            uint productValue526 = (intermediateValue486 * 76u) + 61u;
                                            precise float sumValue379 = 1.0 - intermediateValue481.x;
                                            precise float sumValue380 = sumValue379 - intermediateValue482.y;
                                            uint bitwiseValue245 = (objectInstances_2.packedValues[(intermediateValue486 * 38u) + 25u] >> 2u) + (intermediateValue484 >> 1u);
                                            uint productValue527 = uint(objectInstances.packedValues[(intermediateValue486 * 76u) + 54u]) + 0u;
                                            bool comparisonValue115 = (intermediateValue484 & 1u) == 0u;
                                            uint comparisonValue116 = comparisonValue115 ? faceUvBuffersRW[nonuniformEXT(productValue527)].packedValues[bitwiseValue245].z : faceUvBuffersRW[nonuniformEXT(productValue527)].packedValues[bitwiseValue245].x;
                                            uint comparisonValue117 = comparisonValue115 ? faceUvBuffersRW[nonuniformEXT(productValue527)].packedValues[bitwiseValue245].y : faceUvBuffersRW[nonuniformEXT(productValue527)].packedValues[bitwiseValue245].w;
                                            uint comparisonValue118 = comparisonValue115 ? faceUvBuffersRW[nonuniformEXT(productValue527)].packedValues[bitwiseValue245].x : faceUvBuffersRW[nonuniformEXT(productValue527)].packedValues[bitwiseValue245].z;
                                            bool intermediateValue487 = int16_t(objectInstances.packedValues[productValue526]) < int16_t(0us);
                                            float intermediateValue508;
                                            float intermediateValue509;
                                            if (intermediateValue487)
                                            {
                                                uint bitwiseValue274 = comparisonValue118 >> 15u;
                                                precise float bitwiseValue275 = float(bitwiseValue274 & 1u) * 2.0;
                                                precise float sumValue411 = bitwiseValue275 + (-1.0);
                                                precise float bitwiseValue276 = float(comparisonValue118 >> 31u) * 2.0;
                                                precise float sumValue412 = bitwiseValue276 + (-1.0);
                                                precise float bitwiseValue277 = float((comparisonValue118 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue278 = float(bitwiseValue274 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue558 = sumValue411 * 3.0517578125e-05;
                                                precise float productValue559 = sumValue412 * 3.0517578125e-05;
                                                precise float sumValue413 = bitwiseValue277 + productValue558;
                                                precise float sumValue414 = bitwiseValue278 + productValue559;
                                                intermediateValue508 = sumValue413;
                                                intermediateValue509 = sumValue414;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue279 = float(comparisonValue118 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue280 = float(comparisonValue118 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue560 = bitwiseValue279 * 16384.0;
                                                precise float sumValue415 = productValue560 + 0.5;
                                                precise float productValue561 = bitwiseValue280 * 16384.0;
                                                precise float sumValue416 = productValue561 + 0.5;
                                                precise float productValue562 = floor(sumValue415) * 6.103515625e-05;
                                                precise float productValue563 = floor(sumValue416) * 6.103515625e-05;
                                                intermediateValue508 = productValue562;
                                                intermediateValue509 = productValue563;
                                            }
                                            precise float productValue578 = sumValue380 * intermediateValue508;
                                            precise float productValue579 = sumValue380 * intermediateValue509;
                                            precise float sumValue431 = productValue578 + 0.0;
                                            precise float sumValue432 = productValue579 + 0.0;
                                            float intermediateValue520;
                                            float intermediateValue521;
                                            if (intermediateValue487)
                                            {
                                                uint bitwiseValue316 = comparisonValue117 >> 15u;
                                                precise float bitwiseValue317 = float(bitwiseValue316 & 1u) * 2.0;
                                                precise float sumValue459 = bitwiseValue317 + (-1.0);
                                                precise float bitwiseValue318 = float(comparisonValue117 >> 31u) * 2.0;
                                                precise float sumValue460 = bitwiseValue318 + (-1.0);
                                                precise float bitwiseValue319 = float((comparisonValue117 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue320 = float(bitwiseValue316 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue606 = sumValue459 * 3.0517578125e-05;
                                                precise float productValue607 = sumValue460 * 3.0517578125e-05;
                                                precise float sumValue461 = bitwiseValue319 + productValue606;
                                                precise float sumValue462 = bitwiseValue320 + productValue607;
                                                intermediateValue520 = sumValue461;
                                                intermediateValue521 = sumValue462;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue321 = float(comparisonValue117 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue322 = float(comparisonValue117 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue608 = bitwiseValue321 * 16384.0;
                                                precise float sumValue463 = productValue608 + 0.5;
                                                precise float productValue609 = bitwiseValue322 * 16384.0;
                                                precise float sumValue464 = productValue609 + 0.5;
                                                precise float productValue610 = floor(sumValue463) * 6.103515625e-05;
                                                precise float productValue611 = floor(sumValue464) * 6.103515625e-05;
                                                intermediateValue520 = productValue610;
                                                intermediateValue521 = productValue611;
                                            }
                                            precise float productValue629 = intermediateValue481.x * intermediateValue520;
                                            precise float productValue630 = intermediateValue481.x * intermediateValue521;
                                            precise float sumValue482 = sumValue431 + productValue629;
                                            precise float sumValue483 = sumValue432 + productValue630;
                                            float intermediateValue542;
                                            float intermediateValue543;
                                            if (intermediateValue487)
                                            {
                                                uint bitwiseValue337 = comparisonValue116 >> 15u;
                                                precise float bitwiseValue338 = float(bitwiseValue337 & 1u) * 2.0;
                                                precise float sumValue493 = bitwiseValue338 + (-1.0);
                                                precise float bitwiseValue339 = float(comparisonValue116 >> 31u) * 2.0;
                                                precise float sumValue494 = bitwiseValue339 + (-1.0);
                                                precise float bitwiseValue340 = float((comparisonValue116 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue341 = float(bitwiseValue337 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue640 = sumValue493 * 3.0517578125e-05;
                                                precise float productValue641 = sumValue494 * 3.0517578125e-05;
                                                precise float sumValue495 = bitwiseValue340 + productValue640;
                                                precise float sumValue496 = bitwiseValue341 + productValue641;
                                                intermediateValue542 = sumValue495;
                                                intermediateValue543 = sumValue496;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue342 = float(comparisonValue116 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue343 = float(comparisonValue116 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue642 = bitwiseValue342 * 16384.0;
                                                precise float sumValue497 = productValue642 + 0.5;
                                                precise float productValue643 = bitwiseValue343 * 16384.0;
                                                precise float sumValue498 = productValue643 + 0.5;
                                                precise float productValue644 = floor(sumValue497) * 6.103515625e-05;
                                                precise float productValue645 = floor(sumValue498) * 6.103515625e-05;
                                                intermediateValue542 = productValue644;
                                                intermediateValue543 = productValue645;
                                            }
                                            precise float productValue649 = intermediateValue482.y * intermediateValue542;
                                            precise float productValue650 = intermediateValue482.y * intermediateValue543;
                                            precise float sumValue505 = sumValue482 + productValue649;
                                            precise float sumValue506 = sumValue483 + productValue650;
                                            precise float productValue651 = intermediateValue483 * 0.083333335816860198974609375;
                                            precise float sumValue507 = productValue651 + (-0.25);
                                            float intermediateValue557;
                                            float intermediateValue558;
                                            float intermediateValue559;
                                            float intermediateValue560;
                                            if (objectInstances.packedValues[productValue525] == 65535us)
                                            {
                                                intermediateValue557 = 1.0;
                                                intermediateValue558 = 1.0;
                                                intermediateValue559 = 1.0;
                                                intermediateValue560 = 1.0;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits61;
                                                if (objectInstances.packedValues[productValue525] > 4095us)
                                                {
                                                    reinterpretedBits61 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits61 = uint(objectInstances.packedValues[productValue525]);
                                                }
                                                vec4 sampledTextureValue30 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits61 + 0u], defaultSampler)), vec2(sumValue505, sumValue506), spvNMin(sumValue507, 2.0));
                                                intermediateValue557 = sampledTextureValue30.x;
                                                intermediateValue558 = sampledTextureValue30.y;
                                                intermediateValue559 = sampledTextureValue30.z;
                                                intermediateValue560 = sampledTextureValue30.w;
                                            }
                                            float intermediateValue575;
                                            float intermediateValue576;
                                            float intermediateValue577;
                                            if (intermediateValue485 == 2u)
                                            {
                                                float branchMergedValue47;
                                                float branchMergedValue79;
                                                float branchMergedValue80;
                                                if ((objectInstances.packedValues[productValue526] & 128us) == 0us)
                                                {
                                                    float intermediateValue580;
                                                    if ((objectInstances.packedValues[productValue526] & 2048us) == 0us)
                                                    {
                                                        intermediateValue580 = intermediateValue560;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue693 = intermediateValue560 * 2.0;
                                                        precise float sumValue552 = productValue693 + (-1.0);
                                                        intermediateValue580 = spvNClamp(sumValue552, 0.0, 1.0);
                                                    }
                                                    precise float sumValue549 = 0.0 - intermediateValue557;
                                                    precise float sumValue550 = 0.0 - intermediateValue558;
                                                    precise float sumValue551 = 0.0 - intermediateValue559;
                                                    precise float productValue690 = sumValue549 * intermediateValue580;
                                                    precise float productValue691 = sumValue550 * intermediateValue580;
                                                    precise float productValue692 = sumValue551 * intermediateValue580;
                                                    precise float sumValue542 = intermediateValue557 + productValue690;
                                                    precise float sumValue543 = intermediateValue558 + productValue691;
                                                    precise float sumValue544 = intermediateValue559 + productValue692;
                                                    branchMergedValue47 = sumValue543;
                                                    branchMergedValue79 = sumValue542;
                                                    branchMergedValue80 = sumValue544;
                                                }
                                                else
                                                {
                                                    branchMergedValue47 = 0.33399999141693115234375;
                                                    branchMergedValue79 = 0.33399999141693115234375;
                                                    branchMergedValue80 = 0.33399999141693115234375;
                                                }
                                                intermediateValue575 = branchMergedValue79;
                                                intermediateValue576 = branchMergedValue47;
                                                intermediateValue577 = branchMergedValue80;
                                            }
                                            else
                                            {
                                                precise float sumValue534 = 1.0 - intermediateValue560;
                                                intermediateValue575 = sumValue534;
                                                intermediateValue576 = sumValue534;
                                                intermediateValue577 = sumValue534;
                                            }
                                            precise float productValue683 = intermediateValue460 * intermediateValue575;
                                            precise float productValue684 = intermediateValue461 * intermediateValue576;
                                            precise float productValue685 = intermediateValue462 * intermediateValue577;
                                            float intermediateValue488;
                                            float intermediateValue489;
                                            float intermediateValue490;
                                            bool intermediateValue581;
                                            if (!(dot(vec3(productValue683, productValue684, productValue685), vec3(1.0)) <= 0.00999999977648258209228515625))
                                            {
                                                intermediateValue581 = false;
                                                intermediateValue488 = productValue683;
                                                intermediateValue489 = productValue684;
                                                intermediateValue490 = productValue685;
                                            }
                                            else
                                            {
                                                intermediateValue581 = true;
                                                intermediateValue488 = 0.0;
                                                intermediateValue489 = 0.0;
                                                intermediateValue490 = 0.0;
                                            }
                                            float branchMergedValue88;
                                            float branchMergedValue103;
                                            float branchMergedValue104;
                                            if (intermediateValue581)
                                            {
                                                rayQueryConfirmIntersectionEXT(intermediateValue388);
                                                branchMergedValue88 = intermediateValue490;
                                                branchMergedValue103 = intermediateValue489;
                                                branchMergedValue104 = intermediateValue488;
                                            }
                                            else
                                            {
                                                branchMergedValue88 = intermediateValue490;
                                                branchMergedValue103 = intermediateValue489;
                                                branchMergedValue104 = intermediateValue488;
                                            }
                                            branchMergedValue7 = branchMergedValue88;
                                            branchMergedValue23 = branchMergedValue103;
                                            branchMergedValue24 = branchMergedValue104;
                                        }
                                        else
                                        {
                                            branchMergedValue7 = intermediateValue462;
                                            branchMergedValue23 = intermediateValue461;
                                            branchMergedValue24 = intermediateValue460;
                                        }
                                        intermediateValue439 = branchMergedValue7;
                                        intermediateValue437 = branchMergedValue23;
                                        intermediateValue435 = branchMergedValue24;
                                        bool intermediateValue491 = rayQueryProceedEXT(intermediateValue388);
                                        if (intermediateValue491)
                                        {
                                            intermediateValue460 = intermediateValue435;
                                            intermediateValue461 = intermediateValue437;
                                            intermediateValue462 = intermediateValue439;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue434 = intermediateValue435;
                                    intermediateValue436 = intermediateValue437;
                                    intermediateValue438 = intermediateValue439;
                                }
                                else
                                {
                                    intermediateValue434 = comparisonValue68;
                                    intermediateValue436 = comparisonValue69;
                                    intermediateValue438 = comparisonValue70;
                                }
                                uint intermediateValue440 = rayQueryGetIntersectionTypeEXT(intermediateValue388, bool(1u));
                                bool comparisonValue104 = intermediateValue440 == 1u;
                                branchMergedValue114 = comparisonValue104 ? 0.0 : intermediateValue438;
                                branchMergedValue122 = comparisonValue104 ? 0.0 : intermediateValue436;
                                branchMergedValue123 = comparisonValue104 ? 0.0 : intermediateValue434;
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
                            rayQueryInitializeEXT(intermediateValue340, SceneBVH, 512u, 22u, vec3(reinterpretedBits43, reinterpretedBits44, reinterpretedBits45), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                            bool intermediateValue341 = rayQueryProceedEXT(intermediateValue340);
                            float intermediateValue363;
                            float intermediateValue365;
                            float intermediateValue367;
                            if (intermediateValue341)
                            {
                                float intermediateValue364;
                                float intermediateValue366;
                                float intermediateValue368;
                                float intermediateValue390 = 1.0;
                                float intermediateValue391 = 1.0;
                                float intermediateValue392 = 1.0;
                                bool comparisonValue90;
                                for (;;)
                                {
                                    uint intermediateValue393 = rayQueryGetIntersectionTypeEXT(intermediateValue340, bool(0u));
                                    comparisonValue90 = intermediateValue393 == 0u;
                                    float branchMergedValue5;
                                    float branchMergedValue19;
                                    float branchMergedValue20;
                                    if (comparisonValue90)
                                    {
                                        vec2 intermediateValue441 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue340, bool(0u));
                                        vec2 intermediateValue442 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue340, bool(0u));
                                        float intermediateValue443 = rayQueryGetIntersectionTEXT(intermediateValue340, bool(0u));
                                        uint intermediateValue444 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue340, bool(0u));
                                        uint intermediateValue445 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue340, bool(0u));
                                        uint intermediateValue446 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue340, bool(0u));
                                        uint productValue463 = (intermediateValue446 * 76u) + 58u;
                                        uint productValue464 = (intermediateValue446 * 76u) + 61u;
                                        precise float sumValue327 = 1.0 - intermediateValue441.x;
                                        precise float sumValue328 = sumValue327 - intermediateValue442.y;
                                        uint bitwiseValue201 = (objectInstances_2.packedValues[(intermediateValue446 * 38u) + 25u] >> 2u) + (intermediateValue444 >> 1u);
                                        uint productValue465 = uint(objectInstances.packedValues[(intermediateValue446 * 76u) + 54u]) + 0u;
                                        bool comparisonValue105 = (intermediateValue444 & 1u) == 0u;
                                        uint comparisonValue106 = comparisonValue105 ? faceUvBuffersRW[nonuniformEXT(productValue465)].packedValues[bitwiseValue201].z : faceUvBuffersRW[nonuniformEXT(productValue465)].packedValues[bitwiseValue201].x;
                                        uint comparisonValue107 = comparisonValue105 ? faceUvBuffersRW[nonuniformEXT(productValue465)].packedValues[bitwiseValue201].y : faceUvBuffersRW[nonuniformEXT(productValue465)].packedValues[bitwiseValue201].w;
                                        uint comparisonValue108 = comparisonValue105 ? faceUvBuffersRW[nonuniformEXT(productValue465)].packedValues[bitwiseValue201].x : faceUvBuffersRW[nonuniformEXT(productValue465)].packedValues[bitwiseValue201].z;
                                        bool intermediateValue447 = int16_t(objectInstances.packedValues[productValue464]) < int16_t(0us);
                                        float intermediateValue492;
                                        float intermediateValue493;
                                        if (intermediateValue447)
                                        {
                                            uint bitwiseValue223 = comparisonValue108 >> 15u;
                                            precise float bitwiseValue224 = float(bitwiseValue223 & 1u) * 2.0;
                                            precise float sumValue351 = bitwiseValue224 + (-1.0);
                                            precise float bitwiseValue225 = float(comparisonValue108 >> 31u) * 2.0;
                                            precise float sumValue352 = bitwiseValue225 + (-1.0);
                                            precise float bitwiseValue226 = float((comparisonValue108 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue227 = float(bitwiseValue223 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue490 = sumValue351 * 3.0517578125e-05;
                                            precise float productValue491 = sumValue352 * 3.0517578125e-05;
                                            precise float sumValue353 = bitwiseValue226 + productValue490;
                                            precise float sumValue354 = bitwiseValue227 + productValue491;
                                            intermediateValue492 = sumValue353;
                                            intermediateValue493 = sumValue354;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue228 = float(comparisonValue108 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue229 = float(comparisonValue108 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue492 = bitwiseValue228 * 16384.0;
                                            precise float sumValue355 = productValue492 + 0.5;
                                            precise float productValue493 = bitwiseValue229 * 16384.0;
                                            precise float sumValue356 = productValue493 + 0.5;
                                            precise float productValue494 = floor(sumValue355) * 6.103515625e-05;
                                            precise float productValue495 = floor(sumValue356) * 6.103515625e-05;
                                            intermediateValue492 = productValue494;
                                            intermediateValue493 = productValue495;
                                        }
                                        precise float productValue528 = sumValue328 * intermediateValue492;
                                        precise float productValue529 = sumValue328 * intermediateValue493;
                                        precise float sumValue381 = productValue528 + 0.0;
                                        precise float sumValue382 = productValue529 + 0.0;
                                        float intermediateValue510;
                                        float intermediateValue511;
                                        if (intermediateValue447)
                                        {
                                            uint bitwiseValue281 = comparisonValue107 >> 15u;
                                            precise float bitwiseValue282 = float(bitwiseValue281 & 1u) * 2.0;
                                            precise float sumValue417 = bitwiseValue282 + (-1.0);
                                            precise float bitwiseValue283 = float(comparisonValue107 >> 31u) * 2.0;
                                            precise float sumValue418 = bitwiseValue283 + (-1.0);
                                            precise float bitwiseValue284 = float((comparisonValue107 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue285 = float(bitwiseValue281 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue564 = sumValue417 * 3.0517578125e-05;
                                            precise float productValue565 = sumValue418 * 3.0517578125e-05;
                                            precise float sumValue419 = bitwiseValue284 + productValue564;
                                            precise float sumValue420 = bitwiseValue285 + productValue565;
                                            intermediateValue510 = sumValue419;
                                            intermediateValue511 = sumValue420;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue286 = float(comparisonValue107 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue287 = float(comparisonValue107 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue566 = bitwiseValue286 * 16384.0;
                                            precise float sumValue421 = productValue566 + 0.5;
                                            precise float productValue567 = bitwiseValue287 * 16384.0;
                                            precise float sumValue422 = productValue567 + 0.5;
                                            precise float productValue568 = floor(sumValue421) * 6.103515625e-05;
                                            precise float productValue569 = floor(sumValue422) * 6.103515625e-05;
                                            intermediateValue510 = productValue568;
                                            intermediateValue511 = productValue569;
                                        }
                                        precise float productValue580 = intermediateValue441.x * intermediateValue510;
                                        precise float productValue581 = intermediateValue441.x * intermediateValue511;
                                        precise float sumValue433 = sumValue381 + productValue580;
                                        precise float sumValue434 = sumValue382 + productValue581;
                                        float intermediateValue522;
                                        float intermediateValue523;
                                        if (intermediateValue447)
                                        {
                                            uint bitwiseValue323 = comparisonValue106 >> 15u;
                                            precise float bitwiseValue324 = float(bitwiseValue323 & 1u) * 2.0;
                                            precise float sumValue465 = bitwiseValue324 + (-1.0);
                                            precise float bitwiseValue325 = float(comparisonValue106 >> 31u) * 2.0;
                                            precise float sumValue466 = bitwiseValue325 + (-1.0);
                                            precise float bitwiseValue326 = float((comparisonValue106 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue327 = float(bitwiseValue323 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue612 = sumValue465 * 3.0517578125e-05;
                                            precise float productValue613 = sumValue466 * 3.0517578125e-05;
                                            precise float sumValue467 = bitwiseValue326 + productValue612;
                                            precise float sumValue468 = bitwiseValue327 + productValue613;
                                            intermediateValue522 = sumValue467;
                                            intermediateValue523 = sumValue468;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue328 = float(comparisonValue106 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue329 = float(comparisonValue106 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue614 = bitwiseValue328 * 16384.0;
                                            precise float sumValue469 = productValue614 + 0.5;
                                            precise float productValue615 = bitwiseValue329 * 16384.0;
                                            precise float sumValue470 = productValue615 + 0.5;
                                            precise float productValue616 = floor(sumValue469) * 6.103515625e-05;
                                            precise float productValue617 = floor(sumValue470) * 6.103515625e-05;
                                            intermediateValue522 = productValue616;
                                            intermediateValue523 = productValue617;
                                        }
                                        precise float productValue631 = intermediateValue442.y * intermediateValue522;
                                        precise float productValue632 = intermediateValue442.y * intermediateValue523;
                                        precise float sumValue484 = sumValue433 + productValue631;
                                        precise float sumValue485 = sumValue434 + productValue632;
                                        precise float productValue633 = intermediateValue443 * 0.083333335816860198974609375;
                                        precise float sumValue486 = productValue633 + (-0.25);
                                        float intermediateValue536;
                                        float intermediateValue537;
                                        float intermediateValue538;
                                        float intermediateValue539;
                                        if (objectInstances.packedValues[productValue463] == 65535us)
                                        {
                                            intermediateValue536 = 1.0;
                                            intermediateValue537 = 1.0;
                                            intermediateValue538 = 1.0;
                                            intermediateValue539 = 1.0;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits59;
                                            if (objectInstances.packedValues[productValue463] > 4095us)
                                            {
                                                reinterpretedBits59 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits59 = uint(objectInstances.packedValues[productValue463]);
                                            }
                                            vec4 sampledTextureValue28 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits59 + 0u], defaultSampler)), vec2(sumValue484, sumValue485), spvNMin(sumValue486, 2.0));
                                            intermediateValue536 = sampledTextureValue28.x;
                                            intermediateValue537 = sampledTextureValue28.y;
                                            intermediateValue538 = sampledTextureValue28.z;
                                            intermediateValue539 = sampledTextureValue28.w;
                                        }
                                        float intermediateValue561;
                                        float intermediateValue562;
                                        float intermediateValue563;
                                        if (intermediateValue445 == 2u)
                                        {
                                            float branchMergedValue45;
                                            float branchMergedValue75;
                                            float branchMergedValue76;
                                            if ((objectInstances.packedValues[productValue464] & 128us) == 0us)
                                            {
                                                float intermediateValue570;
                                                if ((objectInstances.packedValues[productValue464] & 2048us) == 0us)
                                                {
                                                    intermediateValue570 = intermediateValue539;
                                                }
                                                else
                                                {
                                                    precise float productValue679 = intermediateValue539 * 2.0;
                                                    precise float sumValue538 = productValue679 + (-1.0);
                                                    intermediateValue570 = spvNClamp(sumValue538, 0.0, 1.0);
                                                }
                                                precise float sumValue535 = 0.0 - intermediateValue536;
                                                precise float sumValue536 = 0.0 - intermediateValue537;
                                                precise float sumValue537 = 0.0 - intermediateValue538;
                                                precise float productValue676 = sumValue535 * intermediateValue570;
                                                precise float productValue677 = sumValue536 * intermediateValue570;
                                                precise float productValue678 = sumValue537 * intermediateValue570;
                                                precise float sumValue518 = intermediateValue536 + productValue676;
                                                precise float sumValue519 = intermediateValue537 + productValue677;
                                                precise float sumValue520 = intermediateValue538 + productValue678;
                                                branchMergedValue45 = sumValue520;
                                                branchMergedValue75 = sumValue519;
                                                branchMergedValue76 = sumValue518;
                                            }
                                            else
                                            {
                                                branchMergedValue45 = 0.33399999141693115234375;
                                                branchMergedValue75 = 0.33399999141693115234375;
                                                branchMergedValue76 = 0.33399999141693115234375;
                                            }
                                            intermediateValue561 = branchMergedValue76;
                                            intermediateValue562 = branchMergedValue75;
                                            intermediateValue563 = branchMergedValue45;
                                        }
                                        else
                                        {
                                            precise float sumValue508 = 1.0 - intermediateValue539;
                                            intermediateValue561 = sumValue508;
                                            intermediateValue562 = sumValue508;
                                            intermediateValue563 = sumValue508;
                                        }
                                        precise float productValue661 = intermediateValue390 * intermediateValue561;
                                        precise float productValue662 = intermediateValue391 * intermediateValue562;
                                        precise float productValue663 = intermediateValue392 * intermediateValue563;
                                        float intermediateValue448;
                                        float intermediateValue449;
                                        float intermediateValue450;
                                        bool intermediateValue571;
                                        if (!(dot(vec3(productValue661, productValue662, productValue663), vec3(1.0)) <= 0.00999999977648258209228515625))
                                        {
                                            intermediateValue571 = false;
                                            intermediateValue448 = productValue661;
                                            intermediateValue449 = productValue662;
                                            intermediateValue450 = productValue663;
                                        }
                                        else
                                        {
                                            intermediateValue571 = true;
                                            intermediateValue448 = 0.0;
                                            intermediateValue449 = 0.0;
                                            intermediateValue450 = 0.0;
                                        }
                                        float branchMergedValue86;
                                        float branchMergedValue99;
                                        float branchMergedValue100;
                                        if (intermediateValue571)
                                        {
                                            rayQueryConfirmIntersectionEXT(intermediateValue340);
                                            branchMergedValue86 = intermediateValue449;
                                            branchMergedValue99 = intermediateValue448;
                                            branchMergedValue100 = intermediateValue450;
                                        }
                                        else
                                        {
                                            branchMergedValue86 = intermediateValue449;
                                            branchMergedValue99 = intermediateValue448;
                                            branchMergedValue100 = intermediateValue450;
                                        }
                                        branchMergedValue5 = branchMergedValue86;
                                        branchMergedValue19 = branchMergedValue99;
                                        branchMergedValue20 = branchMergedValue100;
                                    }
                                    else
                                    {
                                        branchMergedValue5 = intermediateValue391;
                                        branchMergedValue19 = intermediateValue390;
                                        branchMergedValue20 = intermediateValue392;
                                    }
                                    intermediateValue366 = branchMergedValue5;
                                    intermediateValue364 = branchMergedValue19;
                                    intermediateValue368 = branchMergedValue20;
                                    bool intermediateValue451 = rayQueryProceedEXT(intermediateValue340);
                                    if (intermediateValue451)
                                    {
                                        intermediateValue390 = intermediateValue364;
                                        intermediateValue391 = intermediateValue366;
                                        intermediateValue392 = intermediateValue368;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue363 = intermediateValue364;
                                intermediateValue365 = intermediateValue366;
                                intermediateValue367 = intermediateValue368;
                            }
                            else
                            {
                                intermediateValue363 = 1.0;
                                intermediateValue365 = 1.0;
                                intermediateValue367 = 1.0;
                            }
                            uint intermediateValue369 = rayQueryGetIntersectionTypeEXT(intermediateValue340, bool(1u));
                            bool comparisonValue86 = intermediateValue369 == 1u;
                            branchMergedValue41 = comparisonValue86 ? 0.0 : intermediateValue367;
                            branchMergedValue67 = comparisonValue86 ? 0.0 : intermediateValue365;
                            branchMergedValue68 = comparisonValue86 ? 0.0 : intermediateValue363;
                        }
                        intermediateValue297 = branchMergedValue68;
                        intermediateValue298 = branchMergedValue67;
                        intermediateValue299 = branchMergedValue41;
                    }
                    float branchMergedValue108;
                    float branchMergedValue118;
                    float branchMergedValue119;
                    if (dot(vec3(intermediateValue297, intermediateValue298, intermediateValue299), vec3(1.0)) > 0.0)
                    {
                        float sumValue250 = (-0.0) - sumValue26;
                        float sumValue251 = (-0.0) - sumValue28;
                        float sumValue252 = (-0.0) - sumValue30;
                        float intermediateValue306 = spvNMax(spvNMax(productValue331, 0.25), 0.00999999977648258209228515625);
                        float sumValue253 = ViewCB.packedValues[52u].x - sumValue26;
                        float sumValue254 = ViewCB.packedValues[52u].y - sumValue28;
                        float sumValue255 = ViewCB.packedValues[52u].z - sumValue30;
                        float inverseLengthValue8 = inversesqrt(dot(vec3(sumValue253, sumValue254, sumValue255), vec3(sumValue253, sumValue254, sumValue255)));
                        float productValue367 = inverseLengthValue8 * sumValue253;
                        float productValue368 = inverseLengthValue8 * sumValue254;
                        float productValue369 = inverseLengthValue8 * sumValue255;
                        float dotProductValue15 = spvNClamp(dot(vec3(comparisonValue62, comparisonValue63, comparisonValue64), vec3(ViewCB.packedValues[52u].xyz)), 0.0, 1.0);
                        float dotProductValue16 = spvNClamp(dot(vec3(comparisonValue62, comparisonValue63, comparisonValue64), vec3(sumValue250, sumValue251, sumValue252)), 0.0, 1.0);
                        float dotProductValue17 = spvNClamp(dot(vec3(comparisonValue62, comparisonValue63, comparisonValue64), vec3(productValue367, productValue368, productValue369)), 0.0, 1.0);
                        float dotProductValue18 = spvNClamp(dot(vec3(sumValue250, sumValue251, sumValue252), vec3(productValue367, productValue368, productValue369)), 0.0, 1.0);
                        float productValue370 = intermediateValue306 * intermediateValue306;
                        float productValue371 = productValue370 * productValue370;
                        float productValue372 = (((dotProductValue17 * productValue371) - dotProductValue17) * dotProductValue17) + 1.0;
                        float productValue373 = productValue370 * 0.5;
                        float sumValue256 = 1.0 - productValue373;
                        float dotProductValue19 = spvNClamp(dot(vec3(productValue335, productValue336, productValue337), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0);
                        float exponentialValue2 = exp2(log2(spvNClamp(1.0 - dotProductValue18, 0.0, 1.0)) * 5.0);
                        float productValue374 = (exponentialValue2 * (dotProductValue19 - productValue335)) + productValue335;
                        float productValue375 = (exponentialValue2 * (dotProductValue19 - productValue336)) + productValue336;
                        float productValue376 = (exponentialValue2 * (dotProductValue19 - productValue337)) + productValue337;
                        float productValue377 = ((dotProductValue18 * dotProductValue18) * (intermediateValue306 * 2.0)) + (-0.5);
                        float exponentialValue3 = (((exp2(log2(spvNClamp(1.0 - dotProductValue16, 0.0, 1.0)) * 5.0) * productValue377) + 1.0) * 0.3183098733425140380859375) * ((exp2(log2(spvNClamp(1.0 - dotProductValue15, 0.0, 1.0)) * 5.0) * productValue377) + 1.0);
                        float quotientValue5 = ((productValue371 / ((productValue372 * productValue372) + 1.0000000133514319600180897396058e-10)) * 0.3183098733425140380859375) * (0.25 / ((((dotProductValue16 * sumValue256) + productValue373) * ((dotProductValue15 * sumValue256) + productValue373)) + 1.0000000133514319600180897396058e-10));
                        branchMergedValue108 = ((((intermediateValue299 * comparisonValue38) * ViewCB.packedValues[50u].z) * dotProductValue15) * ((((1.0 - productValue376) * productValue340) * exponentialValue3) + (productValue376 * quotientValue5))) + intermediateValue147;
                        branchMergedValue118 = ((((intermediateValue297 * comparisonValue36) * ViewCB.packedValues[50u].x) * dotProductValue15) * ((((1.0 - productValue374) * productValue338) * exponentialValue3) + (productValue374 * quotientValue5))) + intermediateValue143;
                        branchMergedValue119 = ((((intermediateValue298 * comparisonValue37) * ViewCB.packedValues[50u].y) * dotProductValue15) * ((((1.0 - productValue375) * productValue339) * exponentialValue3) + (productValue375 * quotientValue5))) + intermediateValue145;
                    }
                    else
                    {
                        branchMergedValue108 = intermediateValue147;
                        branchMergedValue118 = intermediateValue143;
                        branchMergedValue119 = intermediateValue145;
                    }
                    branchMergedValue34 = branchMergedValue108;
                    branchMergedValue53 = branchMergedValue118;
                    branchMergedValue54 = branchMergedValue119;
                }
                intermediateValue142 = branchMergedValue53;
                intermediateValue144 = branchMergedValue54;
                intermediateValue146 = branchMergedValue34;
            }
            else
            {
                uvec4 reinterpretedBits17 = floatBitsToUint(ViewCB.packedValues[75u]);
                uint intermediateValue94 = reinterpretedBits17.w;
                float sumValue50 = (-0.0) - sumValue26;
                float sumValue51 = (-0.0) - sumValue28;
                float sumValue52 = (-0.0) - sumValue30;
                float productValue83 = ViewCB.packedValues[60u].w * ViewCB.packedValues[60u].w;
                float dotProductValue5 = (spvNClamp(ViewCB.packedValues[90u].w, 0.0, 1.0) * 15.9154567718505859375) * ((1.0 - productValue83) / exp2(log2(abs((productValue83 + 1.0) - ((ViewCB.packedValues[60u].w * 2.0) * spvNMin(spvNMax((-0.0) - dot(vec3(ViewCB.packedValues[52u].xyz), vec3(sumValue50, sumValue51, sumValue52)), -1.0), 1.0)))) * 1.5));
                float intermediateValue158;
                float intermediateValue159;
                float intermediateValue160;
                if (intermediateValue94 == 1u)
                {
                    intermediateValue158 = ViewCB.packedValues[58u].x;
                    intermediateValue159 = ViewCB.packedValues[58u].y;
                    intermediateValue160 = ViewCB.packedValues[58u].z;
                }
                else
                {
                    float branchMergedValue35;
                    float branchMergedValue55;
                    float branchMergedValue56;
                    if (intermediateValue94 == 2u)
                    {
                        uvec4 intermediateValue161 = floatBitsToUint(ViewCB.packedValues[74u]);
                        uint intermediateValue162 = intermediateValue161.z;
                        uint reinterpretedBits25;
                        if (intermediateValue162 > 4095u)
                        {
                            reinterpretedBits25 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits25 = intermediateValue162;
                        }
                        float intermediateValue175 = abs(sumValue26);
                        float intermediateValue176 = abs(sumValue28);
                        float intermediateValue177 = abs(sumValue30);
                        float intermediateValue213;
                        float comparisonValue56;
                        float intermediateValue214;
                        if ((intermediateValue175 >= intermediateValue176) && (intermediateValue175 >= intermediateValue177))
                        {
                            intermediateValue213 = intermediateValue175;
                            comparisonValue56 = (sumValue26 < 0.0) ? sumValue52 : sumValue30;
                            intermediateValue214 = sumValue51;
                        }
                        else
                        {
                            float branchMergedValue37;
                            float branchMergedValue59;
                            float branchMergedValue60;
                            if (!(intermediateValue176 >= intermediateValue177))
                            {
                                branchMergedValue37 = sumValue51;
                                branchMergedValue59 = (sumValue30 < 0.0) ? sumValue26 : sumValue50;
                                branchMergedValue60 = intermediateValue177;
                            }
                            else
                            {
                                branchMergedValue37 = (sumValue28 < 0.0) ? sumValue52 : sumValue30;
                                branchMergedValue59 = sumValue50;
                                branchMergedValue60 = intermediateValue176;
                            }
                            intermediateValue213 = branchMergedValue60;
                            comparisonValue56 = branchMergedValue59;
                            intermediateValue214 = branchMergedValue37;
                        }
                        precise float quotientValue3 = 0.5 / intermediateValue213;
                        vec4 sampledTextureValue10 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits25 + 0u], linearSampler)), vec2(fract(fma(comparisonValue56, quotientValue3, 0.5) * ViewCB.packedValues[74u].x), fract(fma(intermediateValue214, quotientValue3, 0.5) * ViewCB.packedValues[74u].y)), 0.0);
                        branchMergedValue35 = (ViewCB.packedValues[58u].y * sampledTextureValue10.y) * ViewCB.packedValues[97u].w;
                        branchMergedValue55 = (ViewCB.packedValues[58u].x * sampledTextureValue10.x) * ViewCB.packedValues[97u].w;
                        branchMergedValue56 = (ViewCB.packedValues[58u].z * sampledTextureValue10.z) * ViewCB.packedValues[97u].w;
                    }
                    else
                    {
                        float branchMergedValue106;
                        float branchMergedValue111;
                        float branchMergedValue112;
                        if (intermediateValue94 == 4u)
                        {
                            float intermediateValue178 = (dot(vec3(sumValue26, sumValue28, sumValue30), vec3(ViewCB.packedValues[52u].xyz)) * 0.5) + 0.5;
                            branchMergedValue106 = ((ViewCB.packedValues[75u].y - ViewCB.packedValues[76u].y) * intermediateValue178) + ViewCB.packedValues[76u].y;
                            branchMergedValue111 = ((ViewCB.packedValues[75u].x - ViewCB.packedValues[76u].x) * intermediateValue178) + ViewCB.packedValues[76u].x;
                            branchMergedValue112 = ((ViewCB.packedValues[75u].z - ViewCB.packedValues[76u].z) * intermediateValue178) + ViewCB.packedValues[76u].z;
                        }
                        else
                        {
                            float comparisonValue54;
                            if (abs(sumValue28) < 1.0)
                            {
                                float quotientValue1 = atan(sumValue30 / sumValue26);
                                bool intermediateValue190 = sumValue26 < 0.0;
                                bool comparisonValue52 = sumValue26 == 0.0;
                                bool comparisonValue53 = sumValue30 >= 0.0;
                                bool intermediateValue191 = sumValue30 < 0.0;
                                comparisonValue54 = (comparisonValue52 && comparisonValue53) ? 1.57079637050628662109375 : ((comparisonValue52 && intermediateValue191) ? (-1.57079637050628662109375) : ((intermediateValue190 && intermediateValue191) ? (quotientValue1 + (-3.1415927410125732421875)) : ((intermediateValue190 && comparisonValue53) ? (quotientValue1 + 3.1415927410125732421875) : quotientValue1)));
                            }
                            else
                            {
                                comparisonValue54 = 0.0;
                            }
                            float multiplyAddValue2 = fma(abs((fract((comparisonValue54 - ViewCB.packedValues[50u].w) * 0.15915493667125701904296875) * 2.0) + (-1.0)), 0.984375, 0.0078125);
                            float multiplyAddValue3 = fma(0.5 - (asin(sumValue28) * 0.3183098733425140380859375), 0.96875, 0.015625);
                            float productValue194 = ViewCB.packedValues[51u].w * 7.0;
                            float intermediateValue192 = fract(productValue194);
                            uint intermediateValue193 = uint(int(floor(productValue194)));
                            float productValue195 = float(int(intermediateValue193 + 1u)) * 0.125;
                            float intermediateValue194 = fract(abs(productValue195));
                            vec4 sampledTextureValue7 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue2, multiplyAddValue3, float(int(intermediateValue193))), 0.0);
                            float intermediateValue195 = sampledTextureValue7.x;
                            float intermediateValue196 = sampledTextureValue7.y;
                            float intermediateValue197 = sampledTextureValue7.z;
                            float productValue196 = intermediateValue195 * intermediateValue195;
                            float productValue197 = intermediateValue196 * intermediateValue196;
                            float productValue198 = intermediateValue197 * intermediateValue197;
                            vec4 sampledTextureValue8 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue2, multiplyAddValue3, float(int(uint(int(((productValue195 >= ((-0.0) - productValue195)) ? intermediateValue194 : ((-0.0) - intermediateValue194)) * 8.0))))), 0.0);
                            float intermediateValue198 = sampledTextureValue8.x;
                            float intermediateValue199 = sampledTextureValue8.y;
                            float intermediateValue200 = sampledTextureValue8.z;
                            float dotProductValue7 = exp2(log2(spvNMax(dot(vec3(sumValue26, sumValue28, sumValue30), vec3(ViewCB.packedValues[52u].xyz)), 0.0)) * 7.0);
                            float productValue199 = dotProductValue7 * 0.0500000007450580596923828125;
                            float productValue200 = ((((intermediateValue198 * intermediateValue198) - productValue196) * intermediateValue192) + productValue196) + (productValue199 * ViewCB.packedValues[50u].x);
                            float productValue201 = ((((intermediateValue199 * intermediateValue199) - productValue197) * intermediateValue192) + productValue197) + (productValue199 * ViewCB.packedValues[50u].y);
                            float productValue202 = ((((intermediateValue200 * intermediateValue200) - productValue198) * intermediateValue192) + productValue198) + (productValue199 * ViewCB.packedValues[50u].z);
                            float productValue203 = (dotProductValue7 * 0.64999997615814208984375) + 0.3499999940395355224609375;
                            branchMergedValue106 = ((((ViewCB.packedValues[58u].y * productValue203) - productValue201) * ViewCB.packedValues[58u].w) + productValue201) * ViewCB.packedValues[97u].w;
                            branchMergedValue111 = ((((ViewCB.packedValues[58u].x * productValue203) - productValue200) * ViewCB.packedValues[58u].w) + productValue200) * ViewCB.packedValues[97u].w;
                            branchMergedValue112 = ((((ViewCB.packedValues[58u].z * productValue203) - productValue202) * ViewCB.packedValues[58u].w) + productValue202) * ViewCB.packedValues[97u].w;
                        }
                        branchMergedValue35 = branchMergedValue106;
                        branchMergedValue55 = branchMergedValue111;
                        branchMergedValue56 = branchMergedValue112;
                    }
                    intermediateValue158 = branchMergedValue55;
                    intermediateValue159 = branchMergedValue35;
                    intermediateValue160 = branchMergedValue56;
                }
                intermediateValue142 = (intermediateValue158 + (((ViewCB.packedValues[50u].x * dotProductValue5) * ViewCB.packedValues[61u].x) * exp2(ViewCB.packedValues[62u].x * (-72.1347503662109375)))) * comparisonValue36;
                intermediateValue144 = (intermediateValue159 + (((ViewCB.packedValues[50u].y * dotProductValue5) * ViewCB.packedValues[61u].y) * exp2(ViewCB.packedValues[62u].y * (-72.1347503662109375)))) * comparisonValue37;
                intermediateValue146 = (intermediateValue160 + (((ViewCB.packedValues[50u].z * dotProductValue5) * ViewCB.packedValues[61u].z) * exp2(ViewCB.packedValues[62u].z * (-72.1347503662109375)))) * comparisonValue38;
            }
            branchMergedValue12 = 0.0;
            branchMergedValue26 = ((ViewCB.packedValues[59u].z * comparisonValue38) + intermediateValue146) * reinterpretedBits2;
            branchMergedValue27 = ((ViewCB.packedValues[59u].y * comparisonValue37) + intermediateValue144) * reinterpretedBits2;
            branchMergedValue28 = ((ViewCB.packedValues[59u].x * comparisonValue36) + intermediateValue142) * reinterpretedBits2;
            branchMergedValue29 = 0.0;
            branchMergedValue30 = 0.0;
            branchMergedValue31 = 0.0;
        }
        intermediateValue8 = branchMergedValue31;
        intermediateValue9 = branchMergedValue30;
        intermediateValue10 = branchMergedValue29;
        intermediateValue12 = branchMergedValue28;
        intermediateValue13 = branchMergedValue27;
        intermediateValue14 = branchMergedValue26;
        intermediateValue15 = branchMergedValue12;
    }
    uint reinterpretedBits3 = floatBitsToUint(intermediateValue12) & 2147483647u;
    uint reinterpretedBits4 = floatBitsToUint(intermediateValue13) & 2147483647u;
    uint reinterpretedBits5 = floatBitsToUint(intermediateValue14) & 2147483647u;
    uint reinterpretedBits6 = floatBitsToUint(intermediateValue15) & 2147483647u;
    bool comparisonValue1 = ((((reinterpretedBits3 > 2139095040u) || (reinterpretedBits4 > 2139095040u)) || (reinterpretedBits5 > 2139095040u)) || (reinterpretedBits6 > 2139095040u)) || ((((reinterpretedBits3 == 2139095040u) || (reinterpretedBits4 == 2139095040u)) || (reinterpretedBits5 == 2139095040u)) || (reinterpretedBits6 == 2139095040u));
    if (reinterpretedBits1)
    {
        if (comparisonValue1)
        {
            if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3))).w == 0.0)
            {
                imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 0.0, 1.0, 1.0));
                imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
            }
        }
        uint reinterpretedBits11 = floatBitsToUint(intermediateValue8) & 2147483647u;
        uint reinterpretedBits12 = floatBitsToUint(intermediateValue9) & 2147483647u;
        uint reinterpretedBits13 = floatBitsToUint(intermediateValue10) & 2147483647u;
        bool comparisonValue20 = (((reinterpretedBits11 > 2139095040u) || (reinterpretedBits12 > 2139095040u)) || (reinterpretedBits13 > 2139095040u)) || (((reinterpretedBits11 == 2139095040u) || (reinterpretedBits12 == 2139095040u)) || (reinterpretedBits13 == 2139095040u));
        if (comparisonValue20)
        {
            if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3))).w == 0.0)
            {
                imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 0.0, 1.0, 1.0));
                imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
            }
        }
        if (!comparisonValue1)
        {
            imageStore(outputBufferIndirectDiffuse, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue12, intermediateValue13, intermediateValue14, intermediateValue15));
        }
        if (!comparisonValue20)
        {
            imageStore(outputBufferIndirectDiffuseChroma, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue8, intermediateValue9, intermediateValue10, intermediateValue8));
        }
    }
    else
    {
        bool intermediateValue32;
        if (comparisonValue1)
        {
            bool branchMergedValue25;
            if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3))).w == 0.0)
            {
                imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 0.0, 1.0, 1.0));
                imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
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
            imageStore(outputBufferIndirectDiffuse, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue12, intermediateValue13, intermediateValue14, intermediateValue15));
        }
    }
}

