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
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
layout(primitive_culling);
layout(local_size_x = 32, local_size_y = 1, local_size_z = 1) in;

float intermediateValue13;

layout(set = 0, binding = 1, std430) restrict readonly buffer objectInstancesSSBO
{
    uint16_t packedValues[];
} objectInstances;

layout(set = 0, binding = 1, std430) restrict readonly buffer objectInstances_1
{
    uint packedValues[];
} objectInstances_2;

layout(set = 0, binding = 2, std430) restrict readonly buffer vertexIrradianceCacheUpdateChunksSSBO
{
    uint packedValues[];
} vertexIrradianceCacheUpdateChunks;

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

layout(set = 13, binding = 0, scalar) restrict readonly buffer inputLightsBufferSSBO
{
    u16vec3 packedValues[];
} inputLightsBuffer;

layout(set = 13, binding = 0, std430) restrict readonly buffer inputLightsBuffer_1
{
    uint packedValues[];
} inputLightsBuffer_2;

layout(set = 1, binding = 10000, std430) buffer vertexIrradianceCacheSSBO
{
    uint16_t packedValues[];
} vertexIrradianceCache[4096];

layout(set = 1, binding = 10000, std430) buffer vertexIrradianceCache_1
{
    u16vec4 packedValues[];
} vertexIrradianceCache_2[4096];

layout(set = 2, binding = 10000, std430) readonly buffer faceIrradianceCacheSSBO
{
    uint16_t packedValues[];
} faceIrradianceCache[4096];

layout(set = 10, binding = 10000, std430) readonly buffer faceDataBuffersRWSSBO
{
    uint packedValues[];
} faceDataBuffersRW[4096];

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
layout(set = 0, binding = 59) uniform texture2DArray skyTexture;
layout(set = 0, binding = 60) uniform texture2DArray causticsTexture;
layout(set = 0, binding = 61) uniform texture2D wibblyTexture;
layout(set = 6, binding = 0) uniform texture2D textures[4096];
layout(set = 0, binding = 0) uniform sampler defaultSampler;
layout(set = 0, binding = 1) uniform sampler linearSampler;
layout(set = 0, binding = 2) uniform sampler linearWrapSampler;

rayQueryEXT intermediateValue55;
rayQueryEXT intermediateValue83;
rayQueryEXT intermediateValue247;
rayQueryEXT intermediateValue262;
rayQueryEXT intermediateValue299;
rayQueryEXT intermediateValue301;
rayQueryEXT intermediateValue332;

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

void main()
{
    uint bitwiseValue = gl_GlobalInvocationID.x >> 4u;
    uint productValue = bitwiseValue * 2u;
    uint productValue1 = (bitwiseValue * 2u) + 1u;
    uint bitwiseValue1 = gl_GlobalInvocationID.x & 15u;
    uint bitwiseValue2 = vertexIrradianceCacheUpdateChunks.packedValues[productValue] & 65535u;
    if (bitwiseValue1 < (vertexIrradianceCacheUpdateChunks.packedValues[productValue] >> 16u))
    {
        uint productValue2 = bitwiseValue2 * 38u;
        vec4 reinterpretedBits = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue2], objectInstances_2.packedValues[productValue2 + 1u], objectInstances_2.packedValues[productValue2 + 2u], objectInstances_2.packedValues[productValue2 + 3u]));
        float intermediateValue3 = reinterpretedBits.x;
        float intermediateValue4 = reinterpretedBits.y;
        float intermediateValue5 = reinterpretedBits.z;
        uint productValue3 = (bitwiseValue2 * 38u) + 4u;
        vec4 reinterpretedBits1 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue3], objectInstances_2.packedValues[productValue3 + 1u], objectInstances_2.packedValues[productValue3 + 2u], objectInstances_2.packedValues[productValue3 + 3u]));
        float intermediateValue6 = reinterpretedBits1.x;
        float intermediateValue7 = reinterpretedBits1.y;
        float intermediateValue8 = reinterpretedBits1.z;
        uint productValue4 = (bitwiseValue2 * 38u) + 8u;
        vec4 reinterpretedBits2 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue4], objectInstances_2.packedValues[productValue4 + 1u], objectInstances_2.packedValues[productValue4 + 2u], objectInstances_2.packedValues[productValue4 + 3u]));
        float intermediateValue9 = reinterpretedBits2.x;
        float intermediateValue10 = reinterpretedBits2.y;
        float intermediateValue11 = reinterpretedBits2.z;
        uint productValue5 = (bitwiseValue2 * 38u) + 25u;
        uint productValue6 = uint(objectInstances.packedValues[(bitwiseValue2 * 76u) + 54u]);
        uint sumValue = productValue6 + 0u;
        uint sumValue1 = productValue6 + 0u;
        uint sumValue2 = vertexIrradianceCacheUpdateChunks.packedValues[productValue1] + bitwiseValue1;
        uint bitwiseValue3 = objectInstances_2.packedValues[(bitwiseValue2 * 38u) + 24u] + (sumValue2 & 4294967292u);
        uint bitwiseValue4 = (vertexIrradianceCacheUpdateChunks.packedValues[productValue1] + gl_GlobalInvocationID.x) & 3u;
        uint productValue7 = uint(objectInstances.packedValues[(bitwiseValue2 * 76u) + 56u]);
        float comparisonValue = (bitwiseValue4 == 0u) ? 0.85000002384185791015625 : 0.0500000007450580596923828125;
        uint bitwiseValue5 = uint(objectInstances.packedValues[(bitwiseValue2 * 76u) + 71u] & 255us);
        uint bitwiseValue6 = (bitwiseValue5 + (productValue7 * bitwiseValue3)) >> 1u;
        f16vec3 sumValue3 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue6], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue6 + 1u], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue6 + 2u]));
        precise float productValue8 = comparisonValue * float(sumValue3.x);
        precise float productValue9 = comparisonValue * float(sumValue3.y);
        precise float productValue10 = comparisonValue * float(sumValue3.z);
        precise float sumValue4 = productValue8 + 0.0;
        precise float sumValue5 = productValue9 + 0.0;
        precise float sumValue6 = productValue10 + 0.0;
        float comparisonValue1 = (bitwiseValue4 == 1u) ? 0.85000002384185791015625 : 0.0500000007450580596923828125;
        uint bitwiseValue7 = (bitwiseValue5 + (productValue7 * (bitwiseValue3 + 1u))) >> 1u;
        f16vec3 sumValue7 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue7], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue7 + 1u], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue7 + 2u]));
        precise float productValue11 = comparisonValue1 * float(sumValue7.x);
        precise float productValue12 = comparisonValue1 * float(sumValue7.y);
        precise float productValue13 = comparisonValue1 * float(sumValue7.z);
        precise float sumValue8 = sumValue4 + productValue11;
        precise float sumValue9 = sumValue5 + productValue12;
        precise float sumValue10 = sumValue6 + productValue13;
        float comparisonValue2 = (bitwiseValue4 == 2u) ? 0.85000002384185791015625 : 0.0500000007450580596923828125;
        uint bitwiseValue8 = (bitwiseValue5 + (productValue7 * (bitwiseValue3 + 2u))) >> 1u;
        f16vec3 sumValue11 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue8], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue8 + 1u], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue8 + 2u]));
        precise float productValue14 = comparisonValue2 * float(sumValue11.x);
        precise float productValue15 = comparisonValue2 * float(sumValue11.y);
        precise float productValue16 = comparisonValue2 * float(sumValue11.z);
        precise float sumValue12 = sumValue8 + productValue14;
        precise float sumValue13 = sumValue9 + productValue15;
        precise float sumValue14 = sumValue10 + productValue16;
        float comparisonValue3 = (bitwiseValue4 == 3u) ? 0.85000002384185791015625 : 0.0500000007450580596923828125;
        uint bitwiseValue9 = (bitwiseValue5 + (productValue7 * (bitwiseValue3 + 3u))) >> 1u;
        f16vec3 sumValue15 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue9], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue9 + 1u], vertexBuffers[nonuniformEXT(sumValue)].packedValues[bitwiseValue9 + 2u]));
        precise float productValue17 = comparisonValue3 * float(sumValue15.x);
        precise float productValue18 = comparisonValue3 * float(sumValue15.y);
        precise float productValue19 = comparisonValue3 * float(sumValue15.z);
        precise float sumValue16 = sumValue12 + productValue17;
        precise float sumValue17 = sumValue13 + productValue18;
        precise float sumValue18 = sumValue14 + productValue19;
        precise float productValue20 = intermediateValue3 * sumValue16;
        precise float productValue21 = sumValue17 * intermediateValue4;
        precise float sumValue19 = productValue21 + productValue20;
        precise float productValue22 = sumValue18 * intermediateValue5;
        precise float sumValue20 = productValue22 + sumValue19;
        precise float productValue23 = 1.0 * reinterpretedBits.w;
        precise float sumValue21 = productValue23 + sumValue20;
        precise float productValue24 = intermediateValue6 * sumValue16;
        precise float productValue25 = sumValue17 * intermediateValue7;
        precise float sumValue22 = productValue25 + productValue24;
        precise float productValue26 = sumValue18 * intermediateValue8;
        precise float sumValue23 = productValue26 + sumValue22;
        precise float productValue27 = 1.0 * reinterpretedBits1.w;
        precise float sumValue24 = productValue27 + sumValue23;
        precise float productValue28 = intermediateValue9 * sumValue16;
        precise float productValue29 = sumValue17 * intermediateValue10;
        precise float sumValue25 = productValue29 + productValue28;
        precise float productValue30 = sumValue18 * intermediateValue11;
        precise float sumValue26 = productValue30 + sumValue25;
        precise float productValue31 = 1.0 * reinterpretedBits2.w;
        precise float sumValue27 = productValue31 + sumValue26;
        uint sumValue28 = productValue6 + 0u;
        uint bitwiseValue10 = ((objectInstances_2.packedValues[productValue5] >> 2u) + ((sumValue2 >> 2u) & 536870911u)) * 4u;
        precise float bitwiseValue11 = float(faceDataBuffersRW[nonuniformEXT(sumValue28)].packedValues[bitwiseValue10] & 1023u) * 0.00195503421127796173095703125;
        precise float sumValue29 = bitwiseValue11 + (-1.0);
        precise float bitwiseValue12 = float((faceDataBuffersRW[nonuniformEXT(sumValue28)].packedValues[bitwiseValue10] >> 10u) & 1023u) * 0.00195503421127796173095703125;
        precise float sumValue30 = bitwiseValue12 + (-1.0);
        precise float bitwiseValue13 = float((faceDataBuffersRW[nonuniformEXT(sumValue28)].packedValues[bitwiseValue10] >> 20u) & 1023u) * 0.00195503421127796173095703125;
        precise float sumValue31 = bitwiseValue13 + (-1.0);
        precise float productValue32 = intermediateValue3 * sumValue29;
        precise float productValue33 = sumValue30 * intermediateValue4;
        precise float sumValue32 = productValue33 + productValue32;
        precise float productValue34 = sumValue31 * intermediateValue5;
        precise float sumValue33 = productValue34 + sumValue32;
        precise float productValue35 = intermediateValue6 * sumValue29;
        precise float productValue36 = sumValue30 * intermediateValue7;
        precise float sumValue34 = productValue36 + productValue35;
        precise float productValue37 = sumValue31 * intermediateValue8;
        precise float sumValue35 = productValue37 + sumValue34;
        precise float productValue38 = intermediateValue9 * sumValue29;
        precise float productValue39 = sumValue30 * intermediateValue10;
        precise float sumValue36 = productValue39 + productValue38;
        precise float productValue40 = sumValue31 * intermediateValue11;
        precise float sumValue37 = productValue40 + sumValue36;
        float inverseLengthValue = inversesqrt(dot(vec3(sumValue33, sumValue35, sumValue37), vec3(sumValue33, sumValue35, sumValue37)));
        precise float productValue41 = sumValue33 * inverseLengthValue;
        precise float productValue42 = sumValue35 * inverseLengthValue;
        precise float productValue43 = sumValue37 * inverseLengthValue;
        uint reinterpretedBits3 = (((uint(int(sumValue24)) << 6u) ^ uint(int(sumValue21))) ^ (uint(int(sumValue27)) << 12u)) ^ floatBitsToUint(RootConstants.packedValues[0u]).x;
        bool dotProductValue = dot(vec3(0.847100675106048583984375, 0.2079117000102996826171875, 0.489073812961578369140625), vec3(productValue41, productValue42, productValue43)) > 0.949999988079071044921875;
        float comparisonValue4 = dotProductValue ? (-0.639436304569244384765625) : 0.847100675106048583984375;
        float comparisonValue5 = dotProductValue ? (-0.3907311260700225830078125) : 0.2079117000102996826171875;
        float comparisonValue6 = dotProductValue ? 0.6621558666229248046875 : 0.489073812961578369140625;
        precise float dotProductValue1 = dot(vec3(comparisonValue4, comparisonValue5, comparisonValue6), vec3(productValue41, productValue42, productValue43));
        precise float productValue44 = productValue41 * dotProductValue1;
        precise float productValue45 = productValue42 * dotProductValue1;
        precise float productValue46 = productValue43 * dotProductValue1;
        precise float sumValue38 = comparisonValue4 - productValue44;
        precise float sumValue39 = comparisonValue5 - productValue45;
        precise float sumValue40 = comparisonValue6 - productValue46;
        float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue38, sumValue39, sumValue40), vec3(sumValue38, sumValue39, sumValue40)));
        precise float productValue47 = sumValue38 * inverseLengthValue1;
        precise float productValue48 = sumValue39 * inverseLengthValue1;
        precise float productValue49 = sumValue40 * inverseLengthValue1;
        precise float productValue50 = productValue42 * productValue49;
        precise float productValue51 = productValue43 * productValue48;
        precise float sumValue41 = productValue50 - productValue51;
        precise float productValue52 = productValue43 * productValue47;
        precise float productValue53 = productValue41 * productValue49;
        precise float sumValue42 = productValue52 - productValue53;
        precise float productValue54 = productValue41 * productValue48;
        precise float productValue55 = productValue42 * productValue47;
        precise float sumValue43 = productValue54 - productValue55;
        float multiplyAddValue = fma(productValue41, 0.004999999888241291046142578125, sumValue21);
        float multiplyAddValue1 = fma(productValue42, 0.004999999888241291046142578125, sumValue24);
        float multiplyAddValue2 = fma(productValue43, 0.004999999888241291046142578125, sumValue27);
        float multiplyAddValue3 = fma(productValue41, -0.004999999888241291046142578125, sumValue21);
        float multiplyAddValue4 = fma(productValue42, -0.004999999888241291046142578125, sumValue24);
        float multiplyAddValue5 = fma(productValue43, -0.004999999888241291046142578125, sumValue27);
        bool comparisonValue7 = objectInstances.packedValues[(bitwiseValue2 * 76u) + 70u] != 0us;
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
        float intermediateValue12;
        float intermediateValue15;
        float intermediateValue17;
        float intermediateValue19;
        float intermediateValue21;
        float intermediateValue23;
        float intermediateValue25;
        float intermediateValue27;
        float intermediateValue29;
        float intermediateValue31;
        float intermediateValue33;
        float intermediateValue35;
        float intermediateValue37;
        float intermediateValue39;
        float intermediateValue41;
        uint intermediateValue43 = reinterpretedBits3;
        float intermediateValue45 = 0.0;
        float intermediateValue46 = 0.0;
        float intermediateValue47 = 0.0;
        float intermediateValue48 = 0.0;
        float intermediateValue49 = 0.0;
        float intermediateValue50 = 0.0;
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
                uint productValue56 = (intermediateValue43 * 1664525u) + 1013904223u;
                precise float bitwiseValue14 = float(productValue56 & 16777215u) * 5.9604644775390625e-08;
                uint productValue57 = (productValue56 * 1664525u) + 1013904223u;
                precise float bitwiseValue15 = float(productValue57 & 16777215u) * 5.9604644775390625e-08;
                float nonlinearValue = sqrt(bitwiseValue14);
                precise float productValue58 = bitwiseValue15 * 6.283185482025146484375;
                precise float wavePhaseValue = nonlinearValue * cos(productValue58);
                precise float wavePhaseValue1 = nonlinearValue * sin(productValue58);
                precise float sumValue45 = 1.0 - bitwiseValue14;
                float nonlinearValue1 = sqrt(sumValue45);
                precise float productValue59 = productValue47 * wavePhaseValue;
                precise float productValue60 = wavePhaseValue1 * sumValue41;
                precise float sumValue46 = productValue60 + productValue59;
                precise float productValue61 = nonlinearValue1 * productValue41;
                precise float sumValue47 = productValue61 + sumValue46;
                precise float productValue62 = productValue48 * wavePhaseValue;
                precise float productValue63 = wavePhaseValue1 * sumValue42;
                precise float sumValue48 = productValue63 + productValue62;
                precise float productValue64 = nonlinearValue1 * productValue42;
                precise float sumValue49 = productValue64 + sumValue48;
                precise float productValue65 = productValue49 * wavePhaseValue;
                precise float productValue66 = wavePhaseValue1 * sumValue43;
                precise float sumValue50 = productValue66 + productValue65;
                precise float productValue67 = nonlinearValue1 * productValue43;
                precise float sumValue51 = productValue67 + sumValue50;
                intermediateValue38 = sumValue47;
                intermediateValue40 = sumValue49;
                intermediateValue42 = sumValue51;
                intermediateValue52 = multiplyAddValue;
                intermediateValue53 = multiplyAddValue1;
                intermediateValue54 = multiplyAddValue2;
                intermediateValue44 = productValue57;
            }
            else
            {
                precise float dotProductValue2 = dot(vec3(intermediateValue37, intermediateValue39, intermediateValue41), vec3(productValue41, productValue42, productValue43));
                precise float productValue68 = productValue41 * dotProductValue2;
                precise float productValue69 = productValue42 * dotProductValue2;
                precise float productValue70 = productValue43 * dotProductValue2;
                precise float productValue71 = productValue68 * 2.0;
                precise float productValue72 = productValue69 * 2.0;
                precise float productValue73 = productValue70 * 2.0;
                precise float sumValue52 = intermediateValue37 - productValue71;
                precise float sumValue53 = intermediateValue39 - productValue72;
                precise float sumValue54 = intermediateValue41 - productValue73;
                intermediateValue38 = sumValue52;
                intermediateValue40 = sumValue53;
                intermediateValue42 = sumValue54;
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
                rayQueryInitializeEXT(intermediateValue55, SceneBVH, 512u, 4u, vec3(intermediateValue52, intermediateValue53, intermediateValue54), 0.0, vec3(intermediateValue38, intermediateValue40, intermediateValue42), 221.6999969482421875);
                bool intermediateValue56 = rayQueryProceedEXT(intermediateValue55);
                if (intermediateValue56)
                {
                    bool intermediateValue107;
                    bool comparisonValue15;
                    for (;;)
                    {
                        uint intermediateValue74 = rayQueryGetIntersectionTypeEXT(intermediateValue55, bool(0u));
                        comparisonValue15 = intermediateValue74 == 0u;
                        if (comparisonValue15)
                        {
                            vec2 intermediateValue101 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue55, bool(0u));
                            vec2 intermediateValue102 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue55, bool(0u));
                            uint intermediateValue103 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue55, bool(0u));
                            uint intermediateValue104 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue55, bool(0u));
                            uint intermediateValue105 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue55, bool(0u));
                            uint productValue89 = (intermediateValue105 * 76u) + 58u;
                            uint productValue90 = (intermediateValue105 * 76u) + 61u;
                            precise float sumValue65 = 1.0 - intermediateValue101.x;
                            precise float sumValue66 = sumValue65 - intermediateValue102.y;
                            uint bitwiseValue17 = (objectInstances_2.packedValues[(intermediateValue105 * 38u) + 25u] >> 2u) + (intermediateValue103 >> 1u);
                            uint productValue91 = uint(objectInstances.packedValues[(intermediateValue105 * 76u) + 54u]) + 0u;
                            bool comparisonValue18 = (intermediateValue103 & 1u) == 0u;
                            uint comparisonValue19 = comparisonValue18 ? faceUvBuffersRW[nonuniformEXT(productValue91)].packedValues[bitwiseValue17].z : faceUvBuffersRW[nonuniformEXT(productValue91)].packedValues[bitwiseValue17].x;
                            uint comparisonValue20 = comparisonValue18 ? faceUvBuffersRW[nonuniformEXT(productValue91)].packedValues[bitwiseValue17].y : faceUvBuffersRW[nonuniformEXT(productValue91)].packedValues[bitwiseValue17].w;
                            uint comparisonValue21 = comparisonValue18 ? faceUvBuffersRW[nonuniformEXT(productValue91)].packedValues[bitwiseValue17].x : faceUvBuffersRW[nonuniformEXT(productValue91)].packedValues[bitwiseValue17].z;
                            bool intermediateValue106 = int16_t(objectInstances.packedValues[productValue90]) < int16_t(0us);
                            float intermediateValue144;
                            float intermediateValue145;
                            if (intermediateValue106)
                            {
                                uint bitwiseValue19 = comparisonValue21 >> 15u;
                                precise float bitwiseValue20 = float(bitwiseValue19 & 1u) * 2.0;
                                precise float sumValue71 = bitwiseValue20 + (-1.0);
                                precise float bitwiseValue21 = float(comparisonValue21 >> 31u) * 2.0;
                                precise float sumValue72 = bitwiseValue21 + (-1.0);
                                precise float bitwiseValue22 = float((comparisonValue21 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue23 = float(bitwiseValue19 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue98 = sumValue71 * 3.0517578125e-05;
                                precise float productValue99 = sumValue72 * 3.0517578125e-05;
                                precise float sumValue73 = bitwiseValue22 + productValue98;
                                precise float sumValue74 = bitwiseValue23 + productValue99;
                                intermediateValue144 = sumValue73;
                                intermediateValue145 = sumValue74;
                            }
                            else
                            {
                                precise float bitwiseValue24 = float(comparisonValue21 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue25 = float(comparisonValue21 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue100 = bitwiseValue24 * 16384.0;
                                precise float sumValue75 = productValue100 + 0.5;
                                precise float productValue101 = bitwiseValue25 * 16384.0;
                                precise float sumValue76 = productValue101 + 0.5;
                                precise float productValue102 = floor(sumValue75) * 6.103515625e-05;
                                precise float productValue103 = floor(sumValue76) * 6.103515625e-05;
                                intermediateValue144 = productValue102;
                                intermediateValue145 = productValue103;
                            }
                            precise float productValue117 = sumValue66 * intermediateValue144;
                            precise float productValue118 = sumValue66 * intermediateValue145;
                            precise float sumValue84 = productValue117 + 0.0;
                            precise float sumValue85 = productValue118 + 0.0;
                            float intermediateValue184;
                            float intermediateValue185;
                            if (intermediateValue106)
                            {
                                uint bitwiseValue45 = comparisonValue20 >> 15u;
                                precise float bitwiseValue46 = float(bitwiseValue45 & 1u) * 2.0;
                                precise float sumValue103 = bitwiseValue46 + (-1.0);
                                precise float bitwiseValue47 = float(comparisonValue20 >> 31u) * 2.0;
                                precise float sumValue104 = bitwiseValue47 + (-1.0);
                                precise float bitwiseValue48 = float((comparisonValue20 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue49 = float(bitwiseValue45 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue133 = sumValue103 * 3.0517578125e-05;
                                precise float productValue134 = sumValue104 * 3.0517578125e-05;
                                precise float sumValue105 = bitwiseValue48 + productValue133;
                                precise float sumValue106 = bitwiseValue49 + productValue134;
                                intermediateValue184 = sumValue105;
                                intermediateValue185 = sumValue106;
                            }
                            else
                            {
                                precise float bitwiseValue50 = float(comparisonValue20 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue51 = float(comparisonValue20 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue135 = bitwiseValue50 * 16384.0;
                                precise float sumValue107 = productValue135 + 0.5;
                                precise float productValue136 = bitwiseValue51 * 16384.0;
                                precise float sumValue108 = productValue136 + 0.5;
                                precise float productValue137 = floor(sumValue107) * 6.103515625e-05;
                                precise float productValue138 = floor(sumValue108) * 6.103515625e-05;
                                intermediateValue184 = productValue137;
                                intermediateValue185 = productValue138;
                            }
                            precise float productValue163 = intermediateValue101.x * intermediateValue184;
                            precise float productValue164 = intermediateValue101.x * intermediateValue185;
                            precise float sumValue120 = sumValue84 + productValue163;
                            precise float sumValue121 = sumValue85 + productValue164;
                            float intermediateValue210;
                            float intermediateValue211;
                            if (intermediateValue106)
                            {
                                uint bitwiseValue64 = comparisonValue19 >> 15u;
                                precise float bitwiseValue65 = float(bitwiseValue64 & 1u) * 2.0;
                                precise float sumValue129 = bitwiseValue65 + (-1.0);
                                precise float bitwiseValue66 = float(comparisonValue19 >> 31u) * 2.0;
                                precise float sumValue130 = bitwiseValue66 + (-1.0);
                                precise float bitwiseValue67 = float((comparisonValue19 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue68 = float(bitwiseValue64 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue173 = sumValue129 * 3.0517578125e-05;
                                precise float productValue174 = sumValue130 * 3.0517578125e-05;
                                precise float sumValue131 = bitwiseValue67 + productValue173;
                                precise float sumValue132 = bitwiseValue68 + productValue174;
                                intermediateValue210 = sumValue131;
                                intermediateValue211 = sumValue132;
                            }
                            else
                            {
                                precise float bitwiseValue69 = float(comparisonValue19 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue70 = float(comparisonValue19 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue175 = bitwiseValue69 * 16384.0;
                                precise float sumValue133 = productValue175 + 0.5;
                                precise float productValue176 = bitwiseValue70 * 16384.0;
                                precise float sumValue134 = productValue176 + 0.5;
                                precise float productValue177 = floor(sumValue133) * 6.103515625e-05;
                                precise float productValue178 = floor(sumValue134) * 6.103515625e-05;
                                intermediateValue210 = productValue177;
                                intermediateValue211 = productValue178;
                            }
                            precise float productValue202 = intermediateValue102.y * intermediateValue210;
                            precise float productValue203 = intermediateValue102.y * intermediateValue211;
                            precise float sumValue150 = sumValue120 + productValue202;
                            precise float sumValue151 = sumValue121 + productValue203;
                            float intermediateValue219;
                            if (objectInstances.packedValues[productValue89] == 65535us)
                            {
                                intermediateValue219 = 1.0;
                            }
                            else
                            {
                                uint reinterpretedBits12;
                                if (objectInstances.packedValues[productValue89] > 4095us)
                                {
                                    reinterpretedBits12 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits12 = uint(objectInstances.packedValues[productValue89]);
                                }
                                intermediateValue219 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits12 + 0u], defaultSampler)), vec2(sumValue150, sumValue151), -0.25).w;
                            }
                            uint comparisonValue41;
                            if (intermediateValue104 == 2u)
                            {
                                comparisonValue41 = 0u;
                            }
                            else
                            {
                                comparisonValue41 = uint(intermediateValue219 <= (((objectInstances.packedValues[productValue90] & 4352us) != 0us) ? 0.5 : 0.0));
                            }
                            if (comparisonValue41 == 0u)
                            {
                                rayQueryConfirmIntersectionEXT(intermediateValue55);
                            }
                        }
                        intermediateValue107 = rayQueryProceedEXT(intermediateValue55);
                        if (intermediateValue107)
                        {
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                uint intermediateValue72 = rayQueryGetIntersectionTypeEXT(intermediateValue55, bool(1u));
                float intermediateValue80;
                float intermediateValue81;
                float intermediateValue82;
                uint bitwiseValue16;
                if (intermediateValue72 == 1u)
                {
                    vec2 intermediateValue75 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue55, bool(1u));
                    vec2 intermediateValue76 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue55, bool(1u));
                    float intermediateValue77 = rayQueryGetIntersectionTEXT(intermediateValue55, bool(1u));
                    uint intermediateValue78 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue55, bool(1u));
                    uint intermediateValue79 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue55, bool(1u));
                    intermediateValue80 = intermediateValue75.x;
                    intermediateValue81 = intermediateValue76.y;
                    intermediateValue82 = intermediateValue77;
                    bitwiseValue16 = ((intermediateValue78 << 14u) & 1073725440u) | (intermediateValue79 & 16383u);
                }
                else
                {
                    intermediateValue80 = 0.0;
                    intermediateValue81 = 0.0;
                    intermediateValue82 = 10000.0;
                    bitwiseValue16 = 1073741823u;
                }
                rayQueryInitializeEXT(intermediateValue83, SceneBVH, 512u, 16u, vec3(intermediateValue52, intermediateValue53, intermediateValue54), 0.0, vec3(intermediateValue38, intermediateValue40, intermediateValue42), intermediateValue82);
                bool intermediateValue84 = rayQueryProceedEXT(intermediateValue83);
                float intermediateValue108;
                float intermediateValue110;
                float intermediateValue112;
                if (intermediateValue84)
                {
                    float intermediateValue109;
                    float intermediateValue111;
                    float intermediateValue113;
                    float intermediateValue125 = 1.0;
                    float intermediateValue126 = 1.0;
                    float intermediateValue127 = 1.0;
                    bool comparisonValue26;
                    for (;;)
                    {
                        uint intermediateValue128 = rayQueryGetIntersectionTypeEXT(intermediateValue83, bool(0u));
                        comparisonValue26 = intermediateValue128 == 0u;
                        float branchMergedValue1;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (comparisonValue26)
                        {
                            vec2 intermediateValue146 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue83, bool(0u));
                            vec2 intermediateValue147 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue83, bool(0u));
                            float intermediateValue148 = rayQueryGetIntersectionTEXT(intermediateValue83, bool(0u));
                            uint intermediateValue149 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue83, bool(0u));
                            uint intermediateValue150 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue83, bool(0u));
                            uint intermediateValue151 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue83, bool(0u));
                            uint productValue119 = (intermediateValue151 * 76u) + 58u;
                            uint productValue120 = (intermediateValue151 * 76u) + 61u;
                            precise float sumValue86 = 1.0 - intermediateValue146.x;
                            precise float sumValue87 = sumValue86 - intermediateValue147.y;
                            uint bitwiseValue29 = (objectInstances_2.packedValues[(intermediateValue151 * 38u) + 25u] >> 2u) + (intermediateValue149 >> 1u);
                            uint productValue121 = uint(objectInstances.packedValues[(intermediateValue151 * 76u) + 54u]) + 0u;
                            bool comparisonValue30 = (intermediateValue149 & 1u) == 0u;
                            uint comparisonValue31 = comparisonValue30 ? faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue29].z : faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue29].x;
                            uint comparisonValue32 = comparisonValue30 ? faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue29].y : faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue29].w;
                            uint comparisonValue33 = comparisonValue30 ? faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue29].x : faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue29].z;
                            bool intermediateValue152 = int16_t(objectInstances.packedValues[productValue120]) < int16_t(0us);
                            float intermediateValue186;
                            float intermediateValue187;
                            if (intermediateValue152)
                            {
                                uint bitwiseValue52 = comparisonValue33 >> 15u;
                                precise float bitwiseValue53 = float(bitwiseValue52 & 1u) * 2.0;
                                precise float sumValue109 = bitwiseValue53 + (-1.0);
                                precise float bitwiseValue54 = float(comparisonValue33 >> 31u) * 2.0;
                                precise float sumValue110 = bitwiseValue54 + (-1.0);
                                precise float bitwiseValue55 = float((comparisonValue33 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue56 = float(bitwiseValue52 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue139 = sumValue109 * 3.0517578125e-05;
                                precise float productValue140 = sumValue110 * 3.0517578125e-05;
                                precise float sumValue111 = bitwiseValue55 + productValue139;
                                precise float sumValue112 = bitwiseValue56 + productValue140;
                                intermediateValue186 = sumValue111;
                                intermediateValue187 = sumValue112;
                            }
                            else
                            {
                                precise float bitwiseValue57 = float(comparisonValue33 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue58 = float(comparisonValue33 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue141 = bitwiseValue57 * 16384.0;
                                precise float sumValue113 = productValue141 + 0.5;
                                precise float productValue142 = bitwiseValue58 * 16384.0;
                                precise float sumValue114 = productValue142 + 0.5;
                                precise float productValue143 = floor(sumValue113) * 6.103515625e-05;
                                precise float productValue144 = floor(sumValue114) * 6.103515625e-05;
                                intermediateValue186 = productValue143;
                                intermediateValue187 = productValue144;
                            }
                            precise float productValue165 = sumValue87 * intermediateValue186;
                            precise float productValue166 = sumValue87 * intermediateValue187;
                            precise float sumValue122 = productValue165 + 0.0;
                            precise float sumValue123 = productValue166 + 0.0;
                            float intermediateValue212;
                            float intermediateValue213;
                            if (intermediateValue152)
                            {
                                uint bitwiseValue71 = comparisonValue32 >> 15u;
                                precise float bitwiseValue72 = float(bitwiseValue71 & 1u) * 2.0;
                                precise float sumValue135 = bitwiseValue72 + (-1.0);
                                precise float bitwiseValue73 = float(comparisonValue32 >> 31u) * 2.0;
                                precise float sumValue136 = bitwiseValue73 + (-1.0);
                                precise float bitwiseValue74 = float((comparisonValue32 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue75 = float(bitwiseValue71 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue179 = sumValue135 * 3.0517578125e-05;
                                precise float productValue180 = sumValue136 * 3.0517578125e-05;
                                precise float sumValue137 = bitwiseValue74 + productValue179;
                                precise float sumValue138 = bitwiseValue75 + productValue180;
                                intermediateValue212 = sumValue137;
                                intermediateValue213 = sumValue138;
                            }
                            else
                            {
                                precise float bitwiseValue76 = float(comparisonValue32 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue77 = float(comparisonValue32 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue181 = bitwiseValue76 * 16384.0;
                                precise float sumValue139 = productValue181 + 0.5;
                                precise float productValue182 = bitwiseValue77 * 16384.0;
                                precise float sumValue140 = productValue182 + 0.5;
                                precise float productValue183 = floor(sumValue139) * 6.103515625e-05;
                                precise float productValue184 = floor(sumValue140) * 6.103515625e-05;
                                intermediateValue212 = productValue183;
                                intermediateValue213 = productValue184;
                            }
                            precise float productValue204 = intermediateValue146.x * intermediateValue212;
                            precise float productValue205 = intermediateValue146.x * intermediateValue213;
                            precise float sumValue152 = sumValue122 + productValue204;
                            precise float sumValue153 = sumValue123 + productValue205;
                            float intermediateValue223;
                            float intermediateValue224;
                            if (intermediateValue152)
                            {
                                uint bitwiseValue84 = comparisonValue31 >> 15u;
                                precise float bitwiseValue85 = float(bitwiseValue84 & 1u) * 2.0;
                                precise float sumValue159 = bitwiseValue85 + (-1.0);
                                precise float bitwiseValue86 = float(comparisonValue31 >> 31u) * 2.0;
                                precise float sumValue160 = bitwiseValue86 + (-1.0);
                                precise float bitwiseValue87 = float((comparisonValue31 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue88 = float(bitwiseValue84 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue209 = sumValue159 * 3.0517578125e-05;
                                precise float productValue210 = sumValue160 * 3.0517578125e-05;
                                precise float sumValue161 = bitwiseValue87 + productValue209;
                                precise float sumValue162 = bitwiseValue88 + productValue210;
                                intermediateValue223 = sumValue161;
                                intermediateValue224 = sumValue162;
                            }
                            else
                            {
                                precise float bitwiseValue89 = float(comparisonValue31 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue90 = float(comparisonValue31 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue211 = bitwiseValue89 * 16384.0;
                                precise float sumValue163 = productValue211 + 0.5;
                                precise float productValue212 = bitwiseValue90 * 16384.0;
                                precise float sumValue164 = productValue212 + 0.5;
                                precise float productValue213 = floor(sumValue163) * 6.103515625e-05;
                                precise float productValue214 = floor(sumValue164) * 6.103515625e-05;
                                intermediateValue223 = productValue213;
                                intermediateValue224 = productValue214;
                            }
                            precise float productValue222 = intermediateValue147.y * intermediateValue223;
                            precise float productValue223 = intermediateValue147.y * intermediateValue224;
                            precise float sumValue174 = sumValue152 + productValue222;
                            precise float sumValue175 = sumValue153 + productValue223;
                            float intermediateValue227;
                            float intermediateValue228;
                            float intermediateValue229;
                            float intermediateValue230;
                            if (objectInstances.packedValues[productValue119] == 65535us)
                            {
                                intermediateValue227 = 1.0;
                                intermediateValue228 = 1.0;
                                intermediateValue229 = 1.0;
                                intermediateValue230 = 1.0;
                            }
                            else
                            {
                                uint reinterpretedBits13;
                                if (objectInstances.packedValues[productValue119] > 4095us)
                                {
                                    reinterpretedBits13 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits13 = uint(objectInstances.packedValues[productValue119]);
                                }
                                vec4 sampledTextureValue3 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits13 + 0u], defaultSampler)), vec2(sumValue174, sumValue175), spvNMin(fma(intermediateValue148, 0.083333335816860198974609375, -0.25), 2.0));
                                intermediateValue227 = sampledTextureValue3.x;
                                intermediateValue228 = sampledTextureValue3.y;
                                intermediateValue229 = sampledTextureValue3.z;
                                intermediateValue230 = sampledTextureValue3.w;
                            }
                            float intermediateValue250;
                            float intermediateValue251;
                            float intermediateValue252;
                            if (intermediateValue150 == 2u)
                            {
                                float branchMergedValue33;
                                float branchMergedValue63;
                                float branchMergedValue64;
                                if ((objectInstances.packedValues[productValue120] & 128us) == 0us)
                                {
                                    float intermediateValue266;
                                    if ((objectInstances.packedValues[productValue120] & 2048us) == 0us)
                                    {
                                        intermediateValue266 = intermediateValue230;
                                    }
                                    else
                                    {
                                        intermediateValue266 = spvNClamp(fma(intermediateValue230, 2.0, -1.0), 0.0, 1.0);
                                    }
                                    branchMergedValue33 = intermediateValue229 - (intermediateValue266 * intermediateValue229);
                                    branchMergedValue63 = intermediateValue228 - (intermediateValue266 * intermediateValue228);
                                    branchMergedValue64 = intermediateValue227 - (intermediateValue266 * intermediateValue227);
                                }
                                else
                                {
                                    branchMergedValue33 = 0.33399999141693115234375;
                                    branchMergedValue63 = 0.33399999141693115234375;
                                    branchMergedValue64 = 0.33399999141693115234375;
                                }
                                intermediateValue250 = branchMergedValue64;
                                intermediateValue251 = branchMergedValue63;
                                intermediateValue252 = branchMergedValue33;
                            }
                            else
                            {
                                float sumValue199 = 1.0 - intermediateValue230;
                                intermediateValue250 = sumValue199;
                                intermediateValue251 = sumValue199;
                                intermediateValue252 = sumValue199;
                            }
                            float productValue267 = intermediateValue250 * intermediateValue125;
                            float productValue268 = intermediateValue251 * intermediateValue126;
                            float productValue269 = intermediateValue252 * intermediateValue127;
                            float intermediateValue153;
                            float intermediateValue154;
                            float intermediateValue155;
                            bool intermediateValue267;
                            if (!(dot(vec3(productValue267, productValue268, productValue269), vec3(1.0)) <= 0.00999999977648258209228515625))
                            {
                                intermediateValue267 = false;
                                intermediateValue153 = productValue267;
                                intermediateValue154 = productValue268;
                                intermediateValue155 = productValue269;
                            }
                            else
                            {
                                intermediateValue267 = true;
                                intermediateValue153 = 0.0;
                                intermediateValue154 = 0.0;
                                intermediateValue155 = 0.0;
                            }
                            float branchMergedValue78;
                            float branchMergedValue82;
                            float branchMergedValue83;
                            if (intermediateValue267)
                            {
                                rayQueryConfirmIntersectionEXT(intermediateValue83);
                                branchMergedValue78 = intermediateValue155;
                                branchMergedValue82 = intermediateValue154;
                                branchMergedValue83 = intermediateValue153;
                            }
                            else
                            {
                                branchMergedValue78 = intermediateValue155;
                                branchMergedValue82 = intermediateValue154;
                                branchMergedValue83 = intermediateValue153;
                            }
                            branchMergedValue1 = branchMergedValue78;
                            branchMergedValue14 = branchMergedValue82;
                            branchMergedValue15 = branchMergedValue83;
                        }
                        else
                        {
                            branchMergedValue1 = intermediateValue127;
                            branchMergedValue14 = intermediateValue126;
                            branchMergedValue15 = intermediateValue125;
                        }
                        intermediateValue113 = branchMergedValue1;
                        intermediateValue111 = branchMergedValue14;
                        intermediateValue109 = branchMergedValue15;
                        bool intermediateValue156 = rayQueryProceedEXT(intermediateValue83);
                        if (intermediateValue156)
                        {
                            intermediateValue125 = intermediateValue109;
                            intermediateValue126 = intermediateValue111;
                            intermediateValue127 = intermediateValue113;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue108 = intermediateValue109;
                    intermediateValue110 = intermediateValue111;
                    intermediateValue112 = intermediateValue113;
                }
                else
                {
                    intermediateValue108 = 1.0;
                    intermediateValue110 = 1.0;
                    intermediateValue112 = 1.0;
                }
                uint intermediateValue114 = rayQueryGetIntersectionTypeEXT(intermediateValue83, bool(1u));
                bool comparisonValue22 = intermediateValue114 == 1u;
                float comparisonValue23 = comparisonValue22 ? 0.0 : intermediateValue108;
                float comparisonValue24 = comparisonValue22 ? 0.0 : intermediateValue110;
                float comparisonValue25 = comparisonValue22 ? 0.0 : intermediateValue112;
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
                float productValue167;
                float productValue168;
                float productValue169;
                if (intermediateValue82 < 10000.0)
                {
                    uint bitwiseValue26 = bitwiseValue16 & 16383u;
                    uint productValue104 = bitwiseValue26 * 38u;
                    vec4 reinterpretedBits7 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue104], objectInstances_2.packedValues[productValue104 + 1u], objectInstances_2.packedValues[productValue104 + 2u], objectInstances_2.packedValues[productValue104 + 3u]));
                    uint productValue105 = (bitwiseValue26 * 38u) + 4u;
                    vec4 reinterpretedBits8 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue105], objectInstances_2.packedValues[productValue105 + 1u], objectInstances_2.packedValues[productValue105 + 2u], objectInstances_2.packedValues[productValue105 + 3u]));
                    uint productValue106 = (bitwiseValue26 * 38u) + 8u;
                    vec4 reinterpretedBits9 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue106], objectInstances_2.packedValues[productValue106 + 1u], objectInstances_2.packedValues[productValue106 + 2u], objectInstances_2.packedValues[productValue106 + 3u]));
                    uint productValue107 = (bitwiseValue26 * 76u) + 58u;
                    uint productValue108 = (bitwiseValue26 * 76u) + 59u;
                    uint productValue109 = (bitwiseValue26 * 76u) + 61u;
                    uint productValue110 = (bitwiseValue26 * 38u) + 32u;
                    float intermediateValue129 = reinterpretedBits7.x;
                    float intermediateValue130 = reinterpretedBits7.y;
                    float intermediateValue131 = reinterpretedBits7.z;
                    float intermediateValue132 = reinterpretedBits8.x;
                    float intermediateValue133 = reinterpretedBits8.y;
                    float intermediateValue134 = reinterpretedBits8.z;
                    float intermediateValue135 = reinterpretedBits9.x;
                    float intermediateValue136 = reinterpretedBits9.y;
                    float intermediateValue137 = reinterpretedBits9.z;
                    uint bitwiseValue27 = (bitwiseValue16 >> 15u) & 32767u;
                    uint productValue111 = uint(objectInstances.packedValues[(bitwiseValue26 * 76u) + 54u]);
                    uint sumValue77 = productValue111 + 0u;
                    float intermediateValue161;
                    float intermediateValue163;
                    float intermediateValue165;
                    float intermediateValue167;
                    float intermediateValue168;
                    float intermediateValue169;
                    float intermediateValue170;
                    float intermediateValue171;
                    float intermediateValue172;
                    float intermediateValue173;
                    float intermediateValue174;
                    float intermediateValue175;
                    float comparisonValue34;
                    float comparisonValue35;
                    float comparisonValue36;
                    if ((intermediateValue82 > 1.0) && (floatBitsToUint(ViewCB.packedValues[86u]).y != 0u))
                    {
                        uint bitwiseValue30 = (objectInstances_2.packedValues[(bitwiseValue26 * 38u) + 25u] >> 2u) + bitwiseValue27;
                        uint productValue122 = bitwiseValue30 * 4u;
                        float multiplyAddValue6 = fma(float(faceDataBuffersRW[nonuniformEXT(sumValue77)].packedValues[productValue122] & 1023u), 0.00195503421127796173095703125, -1.0);
                        float multiplyAddValue7 = fma(float((faceDataBuffersRW[nonuniformEXT(sumValue77)].packedValues[productValue122] >> 10u) & 1023u), 0.00195503421127796173095703125, -1.0);
                        float multiplyAddValue8 = fma(float((faceDataBuffersRW[nonuniformEXT(sumValue77)].packedValues[productValue122] >> 20u) & 1023u), 0.00195503421127796173095703125, -1.0);
                        float multiplyAddValue9 = fma(multiplyAddValue8, intermediateValue131, fma(multiplyAddValue7, intermediateValue130, multiplyAddValue6 * intermediateValue129));
                        float multiplyAddValue10 = fma(multiplyAddValue8, intermediateValue134, fma(multiplyAddValue7, intermediateValue133, multiplyAddValue6 * intermediateValue132));
                        float multiplyAddValue11 = fma(multiplyAddValue8, intermediateValue137, fma(multiplyAddValue7, intermediateValue136, multiplyAddValue6 * intermediateValue135));
                        float inverseLengthValue2 = inversesqrt(dot(vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
                        bool dotProductValue11 = dot(vec3(intermediateValue38, intermediateValue40, intermediateValue42), vec3(inverseLengthValue2 * multiplyAddValue9, inverseLengthValue2 * multiplyAddValue10, inverseLengthValue2 * multiplyAddValue11)) < 0.0;
                        uint sumValue88 = productValue111 + 0u;
                        uint productValue123 = bitwiseValue30 * 8u;
                        f16vec3 sumValue89 = uint16BitsToFloat16(u16vec3(faceIrradianceCache[nonuniformEXT(sumValue88)].packedValues[productValue123], faceIrradianceCache[nonuniformEXT(sumValue88)].packedValues[productValue123 + 1u], faceIrradianceCache[nonuniformEXT(sumValue88)].packedValues[productValue123 + 2u]));
                        uint productValue124 = (bitwiseValue30 * 8u) + 4u;
                        f16vec3 sumValue90 = uint16BitsToFloat16(u16vec3(faceIrradianceCache[nonuniformEXT(sumValue88)].packedValues[productValue124], faceIrradianceCache[nonuniformEXT(sumValue88)].packedValues[productValue124 + 1u], faceIrradianceCache[nonuniformEXT(sumValue88)].packedValues[productValue124 + 2u]));
                        intermediateValue161 = intermediateValue12;
                        intermediateValue163 = intermediateValue15;
                        intermediateValue165 = intermediateValue17;
                        intermediateValue167 = intermediateValue19;
                        intermediateValue168 = intermediateValue21;
                        intermediateValue169 = intermediateValue23;
                        intermediateValue170 = intermediateValue25;
                        intermediateValue171 = intermediateValue27;
                        intermediateValue172 = intermediateValue29;
                        intermediateValue173 = intermediateValue31;
                        intermediateValue174 = intermediateValue33;
                        intermediateValue175 = intermediateValue35;
                        comparisonValue34 = float(dotProductValue11 ? sumValue89.x : sumValue90.x);
                        comparisonValue35 = float(dotProductValue11 ? sumValue89.y : sumValue90.y);
                        comparisonValue36 = float(dotProductValue11 ? sumValue89.z : sumValue90.z);
                    }
                    else
                    {
                        uint productValue125 = (bitwiseValue26 * 38u) + 24u;
                        uint productValue126 = (bitwiseValue26 * 38u) + 25u;
                        uint productValue127 = (bitwiseValue26 * 76u) + 72u;
                        uint bitwiseValue31 = ((bitwiseValue16 >> 13u) & 2u) | ((bitwiseValue16 >> 13u) & 131068u);
                        uint bitwiseValue32 = bitwiseValue31 | 1u;
                        uint bitwiseValue33 = bitwiseValue31 ^ 2u;
                        intermediateValue1[0u] = bitwiseValue31;
                        intermediateValue1[1u] = bitwiseValue32;
                        intermediateValue1[2u] = bitwiseValue33;
                        uint bitwiseValue34 = ((objectInstances_2.packedValues[productValue126] >> 2u) + bitwiseValue27) * 4u;
                        precise float bitwiseValue35 = float(faceDataBuffersRW[nonuniformEXT(sumValue77)].packedValues[bitwiseValue34] & 1023u) * 0.00195503421127796173095703125;
                        precise float sumValue91 = bitwiseValue35 + (-1.0);
                        precise float bitwiseValue36 = float((faceDataBuffersRW[nonuniformEXT(sumValue77)].packedValues[bitwiseValue34] >> 10u) & 1023u) * 0.00195503421127796173095703125;
                        precise float sumValue92 = bitwiseValue36 + (-1.0);
                        precise float bitwiseValue37 = float((faceDataBuffersRW[nonuniformEXT(sumValue77)].packedValues[bitwiseValue34] >> 20u) & 1023u) * 0.00195503421127796173095703125;
                        precise float sumValue93 = bitwiseValue37 + (-1.0);
                        precise float sumValue94 = 1.0 - intermediateValue80;
                        precise float sumValue95 = sumValue94 - intermediateValue81;
                        intermediateValue2[0u] = sumValue95;
                        intermediateValue2[1u] = intermediateValue80;
                        intermediateValue2[2u] = intermediateValue81;
                        uint sumValue96 = productValue111 + 0u;
                        uint productValue128 = uint(objectInstances.packedValues[(bitwiseValue26 * 76u) + 56u]);
                        uint productValue129 = productValue128 * (objectInstances_2.packedValues[productValue125] + bitwiseValue31);
                        uint bitwiseValue38 = uint(objectInstances.packedValues[(bitwiseValue26 * 76u) + 71u] & 255us);
                        uint bitwiseValue39 = (bitwiseValue38 + productValue129) >> 1u;
                        f16vec3 sumValue97 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue96)].packedValues[bitwiseValue39], vertexBuffers[nonuniformEXT(sumValue96)].packedValues[bitwiseValue39 + 1u], vertexBuffers[nonuniformEXT(sumValue96)].packedValues[bitwiseValue39 + 2u]));
                        uint bitwiseValue40 = uint(objectInstances.packedValues[productValue127] & 255us);
                        uint bitwiseValue41 = (bitwiseValue40 + productValue129) >> 2u;
                        uint bitwiseValue42 = uint(objectInstances.packedValues[productValue127] >> 8us);
                        uint bitwiseValue43 = (bitwiseValue42 + productValue129) >> 2u;
                        bool intermediateValue157 = int16_t(objectInstances.packedValues[productValue109]) < int16_t(0us);
                        float bitwiseValue61;
                        float bitwiseValue62;
                        if (intermediateValue157)
                        {
                            uint bitwiseValue59 = vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue43] >> 15u;
                            bitwiseValue61 = ((float(bitwiseValue59 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue43] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                            bitwiseValue62 = ((float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue43] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue59 & 65534u) * 1.525902189314365386962890625e-05);
                        }
                        else
                        {
                            bitwiseValue61 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue43] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                            bitwiseValue62 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue43] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        }
                        uint intermediateValue195;
                        if ((objectInstances.packedValues[productValue109] & 256us) == 0us)
                        {
                            intermediateValue195 = 0u;
                        }
                        else
                        {
                            intermediateValue195 = vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[(uint(objectInstances.packedValues[(bitwiseValue26 * 76u) + 74u] >> 8us) + productValue129) >> 2u] & 65535u;
                        }
                        precise float productValue185 = sumValue95 * float(sumValue97.x);
                        precise float productValue186 = sumValue95 * float(sumValue97.y);
                        precise float productValue187 = sumValue95 * float(sumValue97.z);
                        precise float sumValue141 = productValue185 + 0.0;
                        precise float sumValue142 = productValue186 + 0.0;
                        precise float sumValue143 = productValue187 + 0.0;
                        uint productValue188 = productValue128 * (objectInstances_2.packedValues[productValue125] + bitwiseValue32);
                        uint bitwiseValue78 = (bitwiseValue38 + productValue188) >> 1u;
                        f16vec3 sumValue144 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue96)].packedValues[bitwiseValue78], vertexBuffers[nonuniformEXT(sumValue96)].packedValues[bitwiseValue78 + 1u], vertexBuffers[nonuniformEXT(sumValue96)].packedValues[bitwiseValue78 + 2u]));
                        uint bitwiseValue79 = (bitwiseValue40 + productValue188) >> 2u;
                        uint bitwiseValue80 = (bitwiseValue42 + productValue188) >> 2u;
                        float bitwiseValue91;
                        float bitwiseValue92;
                        if (intermediateValue157)
                        {
                            uint bitwiseValue82 = vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue80] >> 15u;
                            bitwiseValue91 = ((float(bitwiseValue82 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue80] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                            bitwiseValue92 = ((float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue80] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue82 & 65534u) * 1.525902189314365386962890625e-05);
                        }
                        else
                        {
                            bitwiseValue91 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue80] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                            bitwiseValue92 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue80] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        }
                        precise float productValue215 = intermediateValue80 * float(sumValue144.x);
                        precise float productValue216 = intermediateValue80 * float(sumValue144.y);
                        precise float productValue217 = intermediateValue80 * float(sumValue144.z);
                        precise float sumValue165 = sumValue141 + productValue215;
                        precise float sumValue166 = sumValue142 + productValue216;
                        precise float sumValue167 = sumValue143 + productValue217;
                        uint productValue218 = productValue128 * (objectInstances_2.packedValues[productValue125] + bitwiseValue33);
                        uint bitwiseValue93 = (bitwiseValue38 + productValue218) >> 1u;
                        f16vec3 sumValue168 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue96)].packedValues[bitwiseValue93], vertexBuffers[nonuniformEXT(sumValue96)].packedValues[bitwiseValue93 + 1u], vertexBuffers[nonuniformEXT(sumValue96)].packedValues[bitwiseValue93 + 2u]));
                        uint bitwiseValue94 = (bitwiseValue40 + productValue218) >> 2u;
                        uint bitwiseValue95 = (bitwiseValue42 + productValue218) >> 2u;
                        float bitwiseValue98;
                        float bitwiseValue99;
                        if (intermediateValue157)
                        {
                            uint bitwiseValue97 = vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue95] >> 15u;
                            bitwiseValue98 = ((float(bitwiseValue97 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue95] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                            bitwiseValue99 = ((float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue95] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue97 & 65534u) * 1.525902189314365386962890625e-05);
                        }
                        else
                        {
                            bitwiseValue98 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue95] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                            bitwiseValue99 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue95] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        }
                        precise float productValue224 = intermediateValue81 * float(sumValue168.x);
                        precise float productValue225 = intermediateValue81 * float(sumValue168.y);
                        precise float productValue226 = intermediateValue81 * float(sumValue168.z);
                        precise float sumValue178 = sumValue165 + productValue224;
                        precise float sumValue179 = sumValue166 + productValue225;
                        precise float sumValue180 = sumValue167 + productValue226;
                        float productValue227 = ((bitwiseValue91 * intermediateValue80) + (bitwiseValue61 * sumValue95)) + (bitwiseValue98 * intermediateValue81);
                        float productValue228 = ((bitwiseValue92 * intermediateValue80) + (bitwiseValue62 * sumValue95)) + (bitwiseValue99 * intermediateValue81);
                        float bitwiseValue100 = ((float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue94] & 255u) * 0.0039215688593685626983642578125) * intermediateValue81) + (((float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue79] & 255u) * intermediateValue80) + (float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue41] & 255u) * sumValue95)) * 0.0039215688593685626983642578125);
                        float bitwiseValue101 = ((float((vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue94] >> 8u) & 255u) * 0.0039215688593685626983642578125) * intermediateValue81) + (((float((vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue79] >> 8u) & 255u) * intermediateValue80) + (float((vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue41] >> 8u) & 255u) * sumValue95)) * 0.0039215688593685626983642578125);
                        float bitwiseValue102 = ((float((vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue94] >> 16u) & 255u) * 0.0039215688593685626983642578125) * intermediateValue81) + (((float((vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue79] >> 16u) & 255u) * intermediateValue80) + (float((vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue41] >> 16u) & 255u) * sumValue95)) * 0.0039215688593685626983642578125);
                        float bitwiseValue103 = ((float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue94] >> 24u) * 0.0039215688593685626983642578125) * intermediateValue81) + (((float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue79] >> 24u) * intermediateValue80) + (float(vertexBuffers_2[nonuniformEXT(sumValue96)].packedValues[bitwiseValue41] >> 24u) * sumValue95)) * 0.0039215688593685626983642578125);
                        precise float productValue229 = intermediateValue129 * sumValue178;
                        precise float productValue230 = sumValue179 * intermediateValue130;
                        precise float sumValue181 = productValue230 + productValue229;
                        precise float productValue231 = sumValue180 * intermediateValue131;
                        precise float sumValue182 = productValue231 + sumValue181;
                        precise float productValue232 = 1.0 * reinterpretedBits7.w;
                        precise float sumValue183 = productValue232 + sumValue182;
                        precise float productValue233 = intermediateValue132 * sumValue178;
                        precise float productValue234 = sumValue179 * intermediateValue133;
                        precise float sumValue184 = productValue234 + productValue233;
                        precise float productValue235 = sumValue180 * intermediateValue134;
                        precise float sumValue185 = productValue235 + sumValue184;
                        precise float productValue236 = 1.0 * reinterpretedBits8.w;
                        precise float sumValue186 = productValue236 + sumValue185;
                        precise float productValue237 = intermediateValue135 * sumValue178;
                        precise float productValue238 = sumValue179 * intermediateValue136;
                        precise float sumValue187 = productValue238 + productValue237;
                        precise float productValue239 = sumValue180 * intermediateValue137;
                        precise float sumValue188 = productValue239 + sumValue187;
                        precise float productValue240 = 1.0 * reinterpretedBits9.w;
                        precise float sumValue189 = productValue240 + sumValue188;
                        precise float productValue241 = intermediateValue129 * sumValue91;
                        precise float productValue242 = sumValue92 * intermediateValue130;
                        precise float sumValue190 = productValue242 + productValue241;
                        precise float productValue243 = sumValue93 * intermediateValue131;
                        precise float sumValue191 = productValue243 + sumValue190;
                        precise float productValue244 = intermediateValue132 * sumValue91;
                        precise float productValue245 = sumValue92 * intermediateValue133;
                        precise float sumValue192 = productValue245 + productValue244;
                        precise float productValue246 = sumValue93 * intermediateValue134;
                        precise float sumValue193 = productValue246 + sumValue192;
                        precise float productValue247 = intermediateValue135 * sumValue91;
                        precise float productValue248 = sumValue92 * intermediateValue136;
                        precise float sumValue194 = productValue248 + productValue247;
                        precise float productValue249 = sumValue93 * intermediateValue137;
                        precise float sumValue195 = productValue249 + sumValue194;
                        float inverseLengthValue3 = inversesqrt(dot(vec3(sumValue191, sumValue193, sumValue195), vec3(sumValue191, sumValue193, sumValue195)));
                        precise float productValue250 = sumValue191 * inverseLengthValue3;
                        precise float productValue251 = sumValue193 * inverseLengthValue3;
                        precise float productValue252 = sumValue195 * inverseLengthValue3;
                        bool dotProductValue19 = dot(vec3(intermediateValue38, intermediateValue40, intermediateValue42), vec3(productValue250, productValue251, productValue252)) > 0.0;
                        precise float sumValue196 = (-0.0) - productValue250;
                        precise float sumValue197 = (-0.0) - productValue251;
                        precise float sumValue198 = (-0.0) - productValue252;
                        float comparisonValue43 = dotProductValue19 ? sumValue196 : productValue250;
                        float comparisonValue44 = dotProductValue19 ? sumValue197 : productValue251;
                        float comparisonValue45 = dotProductValue19 ? sumValue198 : productValue252;
                        float intermediateValue241;
                        float intermediateValue242;
                        float intermediateValue243;
                        if (((objectInstances.packedValues[productValue109] & 1us) != 0us) && (floatBitsToUint(ViewCB.packedValues[86u]).y != 0u))
                        {
                            uint sumValue200 = productValue111 + 0u;
                            float sumValue201;
                            float sumValue202;
                            float sumValue203;
                            uint sumValue207;
                            float intermediateValue253 = sumValue95;
                            uint intermediateValue254 = bitwiseValue31;
                            float intermediateValue255 = 0.0;
                            float intermediateValue256 = 0.0;
                            float intermediateValue257 = 0.0;
                            uint intermediateValue258 = 0u;
                            f16vec3 sumValue209;
                            f16vec3 sumValue210;
                            for (;;)
                            {
                                uint sumValue208 = intermediateValue254 + objectInstances_2.packedValues[productValue126];
                                uint productValue270 = sumValue208 * 8u;
                                sumValue209 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue200)].packedValues[productValue270], vertexIrradianceCache[nonuniformEXT(sumValue200)].packedValues[productValue270 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue200)].packedValues[productValue270 + 2u]));
                                uint productValue271 = (sumValue208 * 8u) + 4u;
                                sumValue210 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue200)].packedValues[productValue271], vertexIrradianceCache[nonuniformEXT(sumValue200)].packedValues[productValue271 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue200)].packedValues[productValue271 + 2u]));
                                float16_t intermediateValue272;
                                float16_t intermediateValue273;
                                float16_t intermediateValue274;
                                if (dotProductValue19)
                                {
                                    intermediateValue272 = sumValue210.x;
                                    intermediateValue273 = sumValue210.y;
                                    intermediateValue274 = sumValue210.z;
                                }
                                else
                                {
                                    intermediateValue272 = sumValue209.x;
                                    intermediateValue273 = sumValue209.y;
                                    intermediateValue274 = sumValue209.z;
                                }
                                precise float productValue273 = float(intermediateValue274) * intermediateValue253;
                                precise float productValue274 = float(intermediateValue273) * intermediateValue253;
                                precise float productValue275 = float(intermediateValue272) * intermediateValue253;
                                sumValue201 = productValue275 + intermediateValue255;
                                sumValue202 = productValue274 + intermediateValue256;
                                sumValue203 = productValue273 + intermediateValue257;
                                sumValue207 = intermediateValue258 + 1u;
                                if (sumValue207 == 3u)
                                {
                                    break;
                                }
                                intermediateValue253 = intermediateValue2[sumValue207];
                                intermediateValue254 = intermediateValue1[sumValue207];
                                intermediateValue255 = sumValue201;
                                intermediateValue256 = sumValue202;
                                intermediateValue257 = sumValue203;
                                intermediateValue258 = sumValue207;
                                continue;
                            }
                            intermediateValue241 = sumValue201;
                            intermediateValue242 = sumValue202;
                            intermediateValue243 = sumValue203;
                        }
                        else
                        {
                            intermediateValue241 = 0.0;
                            intermediateValue242 = 0.0;
                            intermediateValue243 = 0.0;
                        }
                        precise float productValue254 = comparisonValue43 * 256.0;
                        uint intermediateValue244 = uint(int(productValue254));
                        precise float productValue255 = comparisonValue44 * 256.0;
                        uint intermediateValue245 = uint(int(productValue255));
                        precise float productValue256 = comparisonValue45 * 256.0;
                        uint intermediateValue246 = uint(int(productValue256));
                        precise float productValue257 = comparisonValue43 * 1.52587890625e-05;
                        precise float sumValue204 = sumValue183 + productValue257;
                        float reinterpretedBits14 = (abs(sumValue183) < 0.03125) ? sumValue204 : uintBitsToFloat(((sumValue183 < 0.0) ? (-intermediateValue244) : intermediateValue244) + floatBitsToUint(sumValue183));
                        precise float productValue258 = comparisonValue44 * 1.52587890625e-05;
                        precise float sumValue205 = sumValue186 + productValue258;
                        float reinterpretedBits15 = (abs(sumValue186) < 0.03125) ? sumValue205 : uintBitsToFloat(((sumValue186 < 0.0) ? (-intermediateValue245) : intermediateValue245) + floatBitsToUint(sumValue186));
                        precise float productValue259 = comparisonValue45 * 1.52587890625e-05;
                        precise float sumValue206 = sumValue189 + productValue259;
                        float reinterpretedBits16 = (abs(sumValue189) < 0.03125) ? sumValue206 : uintBitsToFloat(((sumValue189 < 0.0) ? (-intermediateValue246) : intermediateValue246) + floatBitsToUint(sumValue189));
                        float intermediateValue259;
                        float intermediateValue260;
                        float intermediateValue261;
                        if (dot(vec3(ViewCB.packedValues[52u].xyz), vec3(comparisonValue43, comparisonValue44, comparisonValue45)) < 0.0)
                        {
                            intermediateValue259 = 0.0;
                            intermediateValue260 = 0.0;
                            intermediateValue261 = 0.0;
                        }
                        else
                        {
                            rayQueryInitializeEXT(intermediateValue262, SceneBVH, 512u, 32u, vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16), 0.0, vec3(ViewCB.packedValues[53u].xyz), 10000.0);
                            bool intermediateValue263 = rayQueryProceedEXT(intermediateValue262);
                            if (intermediateValue263)
                            {
                                bool intermediateValue295;
                                bool comparisonValue54;
                                for (;;)
                                {
                                    uint intermediateValue279 = rayQueryGetIntersectionTypeEXT(intermediateValue262, bool(0u));
                                    comparisonValue54 = intermediateValue279 == 0u;
                                    if (comparisonValue54)
                                    {
                                        vec2 intermediateValue289 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue262, bool(0u));
                                        vec2 intermediateValue290 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue262, bool(0u));
                                        uint intermediateValue291 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue262, bool(0u));
                                        uint intermediateValue292 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue262, bool(0u));
                                        uint intermediateValue293 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue262, bool(0u));
                                        uint productValue280 = (intermediateValue293 * 76u) + 58u;
                                        uint productValue281 = (intermediateValue293 * 76u) + 61u;
                                        precise float sumValue217 = 1.0 - intermediateValue289.x;
                                        precise float sumValue218 = sumValue217 - intermediateValue290.y;
                                        uint bitwiseValue108 = (objectInstances_2.packedValues[(intermediateValue293 * 38u) + 25u] >> 2u) + (intermediateValue291 >> 1u);
                                        uint productValue282 = uint(objectInstances.packedValues[(intermediateValue293 * 76u) + 54u]) + 0u;
                                        bool comparisonValue59 = (intermediateValue291 & 1u) == 0u;
                                        uint comparisonValue60 = comparisonValue59 ? faceUvBuffersRW[nonuniformEXT(productValue282)].packedValues[bitwiseValue108].z : faceUvBuffersRW[nonuniformEXT(productValue282)].packedValues[bitwiseValue108].x;
                                        uint comparisonValue61 = comparisonValue59 ? faceUvBuffersRW[nonuniformEXT(productValue282)].packedValues[bitwiseValue108].y : faceUvBuffersRW[nonuniformEXT(productValue282)].packedValues[bitwiseValue108].w;
                                        uint comparisonValue62 = comparisonValue59 ? faceUvBuffersRW[nonuniformEXT(productValue282)].packedValues[bitwiseValue108].x : faceUvBuffersRW[nonuniformEXT(productValue282)].packedValues[bitwiseValue108].z;
                                        bool intermediateValue294 = int16_t(objectInstances.packedValues[productValue281]) < int16_t(0us);
                                        float intermediateValue326;
                                        float intermediateValue327;
                                        if (intermediateValue294)
                                        {
                                            uint bitwiseValue116 = comparisonValue62 >> 15u;
                                            precise float bitwiseValue117 = float(bitwiseValue116 & 1u) * 2.0;
                                            precise float sumValue247 = bitwiseValue117 + (-1.0);
                                            precise float bitwiseValue118 = float(comparisonValue62 >> 31u) * 2.0;
                                            precise float sumValue248 = bitwiseValue118 + (-1.0);
                                            precise float bitwiseValue119 = float((comparisonValue62 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue120 = float(bitwiseValue116 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue312 = sumValue247 * 3.0517578125e-05;
                                            precise float productValue313 = sumValue248 * 3.0517578125e-05;
                                            precise float sumValue249 = bitwiseValue119 + productValue312;
                                            precise float sumValue250 = bitwiseValue120 + productValue313;
                                            intermediateValue326 = sumValue249;
                                            intermediateValue327 = sumValue250;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue121 = float(comparisonValue62 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue122 = float(comparisonValue62 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue314 = bitwiseValue121 * 16384.0;
                                            precise float sumValue251 = productValue314 + 0.5;
                                            precise float productValue315 = bitwiseValue122 * 16384.0;
                                            precise float sumValue252 = productValue315 + 0.5;
                                            precise float productValue316 = floor(sumValue251) * 6.103515625e-05;
                                            precise float productValue317 = floor(sumValue252) * 6.103515625e-05;
                                            intermediateValue326 = productValue316;
                                            intermediateValue327 = productValue317;
                                        }
                                        precise float productValue320 = sumValue218 * intermediateValue326;
                                        precise float productValue321 = sumValue218 * intermediateValue327;
                                        precise float sumValue255 = productValue320 + 0.0;
                                        precise float sumValue256 = productValue321 + 0.0;
                                        float intermediateValue370;
                                        float intermediateValue371;
                                        if (intermediateValue294)
                                        {
                                            uint bitwiseValue133 = comparisonValue61 >> 15u;
                                            precise float bitwiseValue134 = float(bitwiseValue133 & 1u) * 2.0;
                                            precise float sumValue263 = bitwiseValue134 + (-1.0);
                                            precise float bitwiseValue135 = float(comparisonValue61 >> 31u) * 2.0;
                                            precise float sumValue264 = bitwiseValue135 + (-1.0);
                                            precise float bitwiseValue136 = float((comparisonValue61 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue137 = float(bitwiseValue133 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue328 = sumValue263 * 3.0517578125e-05;
                                            precise float productValue329 = sumValue264 * 3.0517578125e-05;
                                            precise float sumValue265 = bitwiseValue136 + productValue328;
                                            precise float sumValue266 = bitwiseValue137 + productValue329;
                                            intermediateValue370 = sumValue265;
                                            intermediateValue371 = sumValue266;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue138 = float(comparisonValue61 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue139 = float(comparisonValue61 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue330 = bitwiseValue138 * 16384.0;
                                            precise float sumValue267 = productValue330 + 0.5;
                                            precise float productValue331 = bitwiseValue139 * 16384.0;
                                            precise float sumValue268 = productValue331 + 0.5;
                                            precise float productValue332 = floor(sumValue267) * 6.103515625e-05;
                                            precise float productValue333 = floor(sumValue268) * 6.103515625e-05;
                                            intermediateValue370 = productValue332;
                                            intermediateValue371 = productValue333;
                                        }
                                        precise float productValue342 = intermediateValue289.x * intermediateValue370;
                                        precise float productValue343 = intermediateValue289.x * intermediateValue371;
                                        precise float sumValue275 = sumValue255 + productValue342;
                                        precise float sumValue276 = sumValue256 + productValue343;
                                        float intermediateValue393;
                                        float intermediateValue394;
                                        if (intermediateValue294)
                                        {
                                            uint bitwiseValue163 = comparisonValue60 >> 15u;
                                            precise float bitwiseValue164 = float(bitwiseValue163 & 1u) * 2.0;
                                            precise float sumValue295 = bitwiseValue164 + (-1.0);
                                            precise float bitwiseValue165 = float(comparisonValue60 >> 31u) * 2.0;
                                            precise float sumValue296 = bitwiseValue165 + (-1.0);
                                            precise float bitwiseValue166 = float((comparisonValue60 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue167 = float(bitwiseValue163 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue363 = sumValue295 * 3.0517578125e-05;
                                            precise float productValue364 = sumValue296 * 3.0517578125e-05;
                                            precise float sumValue297 = bitwiseValue166 + productValue363;
                                            precise float sumValue298 = bitwiseValue167 + productValue364;
                                            intermediateValue393 = sumValue297;
                                            intermediateValue394 = sumValue298;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue168 = float(comparisonValue60 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue169 = float(comparisonValue60 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue365 = bitwiseValue168 * 16384.0;
                                            precise float sumValue299 = productValue365 + 0.5;
                                            precise float productValue366 = bitwiseValue169 * 16384.0;
                                            precise float sumValue300 = productValue366 + 0.5;
                                            precise float productValue367 = floor(sumValue299) * 6.103515625e-05;
                                            precise float productValue368 = floor(sumValue300) * 6.103515625e-05;
                                            intermediateValue393 = productValue367;
                                            intermediateValue394 = productValue368;
                                        }
                                        precise float productValue378 = intermediateValue290.y * intermediateValue393;
                                        precise float productValue379 = intermediateValue290.y * intermediateValue394;
                                        precise float sumValue309 = sumValue275 + productValue378;
                                        precise float sumValue310 = sumValue276 + productValue379;
                                        float intermediateValue396;
                                        if (objectInstances.packedValues[productValue280] == 65535us)
                                        {
                                            intermediateValue396 = 1.0;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits24;
                                            if (objectInstances.packedValues[productValue280] > 4095us)
                                            {
                                                reinterpretedBits24 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits24 = uint(objectInstances.packedValues[productValue280]);
                                            }
                                            intermediateValue396 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits24 + 0u], defaultSampler)), vec2(sumValue309, sumValue310), -0.25).w;
                                        }
                                        uint comparisonValue83;
                                        if (intermediateValue292 == 2u)
                                        {
                                            comparisonValue83 = 0u;
                                        }
                                        else
                                        {
                                            comparisonValue83 = uint(intermediateValue396 <= (((objectInstances.packedValues[productValue281] & 4352us) != 0us) ? 0.5 : 0.0));
                                        }
                                        if (comparisonValue83 == 0u)
                                        {
                                            rayQueryConfirmIntersectionEXT(intermediateValue262);
                                        }
                                    }
                                    intermediateValue295 = rayQueryProceedEXT(intermediateValue262);
                                    if (intermediateValue295)
                                    {
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }
                            uint intermediateValue268 = rayQueryGetIntersectionTypeEXT(intermediateValue262, bool(1u));
                            float intermediateValue281;
                            if (intermediateValue268 == 1u)
                            {
                                float intermediateValue280 = rayQueryGetIntersectionTEXT(intermediateValue262, bool(1u));
                                intermediateValue281 = intermediateValue280;
                            }
                            else
                            {
                                intermediateValue281 = 10000.0;
                            }
                            float branchMergedValue34;
                            float branchMergedValue65;
                            float branchMergedValue66;
                            if (intermediateValue281 < 10000.0)
                            {
                                precise float productValue283 = intermediateValue281 * ViewCB.packedValues[63u].x;
                                precise float productValue284 = intermediateValue281 * ViewCB.packedValues[63u].y;
                                precise float productValue285 = intermediateValue281 * ViewCB.packedValues[63u].z;
                                precise float productValue286 = productValue283 * (-1.44269502162933349609375);
                                precise float productValue287 = productValue284 * (-1.44269502162933349609375);
                                precise float productValue288 = productValue285 * (-1.44269502162933349609375);
                                precise float productValue289 = ViewCB.packedValues[53u].x * intermediateValue281;
                                precise float sumValue219 = productValue289 + reinterpretedBits14;
                                precise float productValue290 = ViewCB.packedValues[53u].z * intermediateValue281;
                                precise float sumValue220 = productValue290 + reinterpretedBits16;
                                precise float productValue291 = sumValue219 * ViewCB.packedValues[83u].z;
                                precise float sumValue221 = productValue291 + ViewCB.packedValues[84u].x;
                                precise float productValue292 = sumValue220 * ViewCB.packedValues[83u].w;
                                precise float sumValue222 = productValue292 + ViewCB.packedValues[84u].y;
                                vec4 sampledTextureValue5 = textureLod(sampler2D(wibblyTexture, linearWrapSampler), vec2(sumValue221, sumValue222), 0.0);
                                precise float sumValue223 = sampledTextureValue5.x + (-0.5);
                                precise float sumValue224 = sampledTextureValue5.y + (-0.5);
                                precise float productValue293 = sumValue219 * ViewCB.packedValues[82u].z;
                                precise float sumValue225 = productValue293 + ViewCB.packedValues[83u].x;
                                precise float productValue294 = sumValue220 * ViewCB.packedValues[82u].w;
                                precise float sumValue226 = productValue294 + ViewCB.packedValues[83u].y;
                                precise float productValue295 = sumValue223 * 0.4000000059604644775390625;
                                precise float productValue296 = sumValue224 * 0.4000000059604644775390625;
                                precise float sumValue227 = sumValue225 + productValue295;
                                precise float sumValue228 = productValue296 + sumValue226;
                                precise float productValue297 = ViewCB.packedValues[68u].w * 63.0;
                                uint intermediateValue296 = uint(int(floor(productValue297)));
                                precise float productValue298 = float(int(intermediateValue296 + 1u)) * 0.015625;
                                precise float sumValue229 = (-0.0) - productValue298;
                                float intermediateValue297 = fract(abs(productValue298));
                                precise float sumValue230 = (-0.0) - intermediateValue297;
                                precise float comparisonValue63 = ((productValue298 >= sumValue229) ? intermediateValue297 : sumValue230) * 64.0;
                                vec4 sampledTextureValue6 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue227, sumValue228, float(int(intermediateValue296))), 0.0);
                                float intermediateValue298 = sampledTextureValue6.x;
                                precise float sampledTextureValue7 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue227, sumValue228, float(int(uint(int(comparisonValue63))))), 0.0).x - intermediateValue298;
                                precise float productValue299 = fract(productValue297) * sampledTextureValue7;
                                precise float sumValue231 = intermediateValue298 + productValue299;
                                precise float productValue300 = sumValue231 * 7.0;
                                precise float sumValue232 = productValue300 + 0.800000011920928955078125;
                                precise float productValue301 = intermediateValue281 * (-0.100000001490116119384765625);
                                precise float sumValue233 = sumValue232 + (-1.0);
                                precise float exponentialValue1 = exp2(productValue301) * sumValue233;
                                precise float sumValue234 = exponentialValue1 + 1.0;
                                precise float exponentialValue2 = exp2(productValue286) * sumValue234;
                                precise float exponentialValue3 = exp2(productValue287) * sumValue234;
                                precise float exponentialValue4 = exp2(productValue288) * sumValue234;
                                rayQueryInitializeEXT(intermediateValue299, SceneBVH, 512u, 22u, vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16), 0.0, vec3(ViewCB.packedValues[53u].xyz), intermediateValue281);
                                bool intermediateValue300 = rayQueryProceedEXT(intermediateValue299);
                                float intermediateValue307;
                                float intermediateValue309;
                                float intermediateValue311;
                                if (intermediateValue300)
                                {
                                    float intermediateValue308;
                                    float intermediateValue310;
                                    float intermediateValue312;
                                    float intermediateValue328 = exponentialValue2;
                                    float intermediateValue329 = exponentialValue3;
                                    float intermediateValue330 = exponentialValue4;
                                    bool comparisonValue66;
                                    for (;;)
                                    {
                                        uint intermediateValue331 = rayQueryGetIntersectionTypeEXT(intermediateValue299, bool(0u));
                                        comparisonValue66 = intermediateValue331 == 0u;
                                        float branchMergedValue2;
                                        float branchMergedValue21;
                                        float branchMergedValue22;
                                        if (comparisonValue66)
                                        {
                                            vec2 intermediateValue339 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue299, bool(0u));
                                            vec2 intermediateValue340 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue299, bool(0u));
                                            float intermediateValue341 = rayQueryGetIntersectionTEXT(intermediateValue299, bool(0u));
                                            uint intermediateValue342 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue299, bool(0u));
                                            uint intermediateValue343 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue299, bool(0u));
                                            uint intermediateValue344 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue299, bool(0u));
                                            uint productValue334 = (intermediateValue344 * 76u) + 58u;
                                            uint productValue335 = (intermediateValue344 * 76u) + 61u;
                                            precise float sumValue269 = 1.0 - intermediateValue339.x;
                                            precise float sumValue270 = sumValue269 - intermediateValue340.y;
                                            uint bitwiseValue140 = (objectInstances_2.packedValues[(intermediateValue344 * 38u) + 25u] >> 2u) + (intermediateValue342 >> 1u);
                                            uint productValue336 = uint(objectInstances.packedValues[(intermediateValue344 * 76u) + 54u]) + 0u;
                                            bool comparisonValue68 = (intermediateValue342 & 1u) == 0u;
                                            uint comparisonValue69 = comparisonValue68 ? faceUvBuffersRW[nonuniformEXT(productValue336)].packedValues[bitwiseValue140].z : faceUvBuffersRW[nonuniformEXT(productValue336)].packedValues[bitwiseValue140].x;
                                            uint comparisonValue70 = comparisonValue68 ? faceUvBuffersRW[nonuniformEXT(productValue336)].packedValues[bitwiseValue140].y : faceUvBuffersRW[nonuniformEXT(productValue336)].packedValues[bitwiseValue140].w;
                                            uint comparisonValue71 = comparisonValue68 ? faceUvBuffersRW[nonuniformEXT(productValue336)].packedValues[bitwiseValue140].x : faceUvBuffersRW[nonuniformEXT(productValue336)].packedValues[bitwiseValue140].z;
                                            bool intermediateValue345 = int16_t(objectInstances.packedValues[productValue335]) < int16_t(0us);
                                            float intermediateValue376;
                                            float intermediateValue377;
                                            if (intermediateValue345)
                                            {
                                                uint bitwiseValue142 = comparisonValue71 >> 15u;
                                                precise float bitwiseValue143 = float(bitwiseValue142 & 1u) * 2.0;
                                                precise float sumValue277 = bitwiseValue143 + (-1.0);
                                                precise float bitwiseValue144 = float(comparisonValue71 >> 31u) * 2.0;
                                                precise float sumValue278 = bitwiseValue144 + (-1.0);
                                                precise float bitwiseValue145 = float((comparisonValue71 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue146 = float(bitwiseValue142 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue344 = sumValue277 * 3.0517578125e-05;
                                                precise float productValue345 = sumValue278 * 3.0517578125e-05;
                                                precise float sumValue279 = bitwiseValue145 + productValue344;
                                                precise float sumValue280 = bitwiseValue146 + productValue345;
                                                intermediateValue376 = sumValue279;
                                                intermediateValue377 = sumValue280;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue147 = float(comparisonValue71 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue148 = float(comparisonValue71 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue346 = bitwiseValue147 * 16384.0;
                                                precise float sumValue281 = productValue346 + 0.5;
                                                precise float productValue347 = bitwiseValue148 * 16384.0;
                                                precise float sumValue282 = productValue347 + 0.5;
                                                precise float productValue348 = floor(sumValue281) * 6.103515625e-05;
                                                precise float productValue349 = floor(sumValue282) * 6.103515625e-05;
                                                intermediateValue376 = productValue348;
                                                intermediateValue377 = productValue349;
                                            }
                                            precise float productValue369 = sumValue270 * intermediateValue376;
                                            precise float productValue370 = sumValue270 * intermediateValue377;
                                            precise float sumValue301 = productValue369 + 0.0;
                                            precise float sumValue302 = productValue370 + 0.0;
                                            float intermediateValue397;
                                            float intermediateValue398;
                                            if (intermediateValue345)
                                            {
                                                uint bitwiseValue171 = comparisonValue70 >> 15u;
                                                precise float bitwiseValue172 = float(bitwiseValue171 & 1u) * 2.0;
                                                precise float sumValue311 = bitwiseValue172 + (-1.0);
                                                precise float bitwiseValue173 = float(comparisonValue70 >> 31u) * 2.0;
                                                precise float sumValue312 = bitwiseValue173 + (-1.0);
                                                precise float bitwiseValue174 = float((comparisonValue70 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue175 = float(bitwiseValue171 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue380 = sumValue311 * 3.0517578125e-05;
                                                precise float productValue381 = sumValue312 * 3.0517578125e-05;
                                                precise float sumValue313 = bitwiseValue174 + productValue380;
                                                precise float sumValue314 = bitwiseValue175 + productValue381;
                                                intermediateValue397 = sumValue313;
                                                intermediateValue398 = sumValue314;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue176 = float(comparisonValue70 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue177 = float(comparisonValue70 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue382 = bitwiseValue176 * 16384.0;
                                                precise float sumValue315 = productValue382 + 0.5;
                                                precise float productValue383 = bitwiseValue177 * 16384.0;
                                                precise float sumValue316 = productValue383 + 0.5;
                                                precise float productValue384 = floor(sumValue315) * 6.103515625e-05;
                                                precise float productValue385 = floor(sumValue316) * 6.103515625e-05;
                                                intermediateValue397 = productValue384;
                                                intermediateValue398 = productValue385;
                                            }
                                            precise float productValue399 = intermediateValue339.x * intermediateValue397;
                                            precise float productValue400 = intermediateValue339.x * intermediateValue398;
                                            precise float sumValue329 = sumValue301 + productValue399;
                                            precise float sumValue330 = sumValue302 + productValue400;
                                            float intermediateValue403;
                                            float intermediateValue404;
                                            if (intermediateValue345)
                                            {
                                                uint bitwiseValue192 = comparisonValue69 >> 15u;
                                                precise float bitwiseValue193 = float(bitwiseValue192 & 1u) * 2.0;
                                                precise float sumValue335 = bitwiseValue193 + (-1.0);
                                                precise float bitwiseValue194 = float(comparisonValue69 >> 31u) * 2.0;
                                                precise float sumValue336 = bitwiseValue194 + (-1.0);
                                                precise float bitwiseValue195 = float((comparisonValue69 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue196 = float(bitwiseValue192 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue405 = sumValue335 * 3.0517578125e-05;
                                                precise float productValue406 = sumValue336 * 3.0517578125e-05;
                                                precise float sumValue337 = bitwiseValue195 + productValue405;
                                                precise float sumValue338 = bitwiseValue196 + productValue406;
                                                intermediateValue403 = sumValue337;
                                                intermediateValue404 = sumValue338;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue197 = float(comparisonValue69 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue198 = float(comparisonValue69 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue407 = bitwiseValue197 * 16384.0;
                                                precise float sumValue339 = productValue407 + 0.5;
                                                precise float productValue408 = bitwiseValue198 * 16384.0;
                                                precise float sumValue340 = productValue408 + 0.5;
                                                precise float productValue409 = floor(sumValue339) * 6.103515625e-05;
                                                precise float productValue410 = floor(sumValue340) * 6.103515625e-05;
                                                intermediateValue403 = productValue409;
                                                intermediateValue404 = productValue410;
                                            }
                                            precise float productValue424 = intermediateValue340.y * intermediateValue403;
                                            precise float productValue425 = intermediateValue340.y * intermediateValue404;
                                            precise float sumValue353 = sumValue329 + productValue424;
                                            precise float sumValue354 = sumValue330 + productValue425;
                                            precise float productValue426 = intermediateValue341 * 0.083333335816860198974609375;
                                            precise float sumValue355 = productValue426 + (-0.25);
                                            float intermediateValue410;
                                            float intermediateValue411;
                                            float intermediateValue412;
                                            float intermediateValue413;
                                            if (objectInstances.packedValues[productValue334] == 65535us)
                                            {
                                                intermediateValue410 = 1.0;
                                                intermediateValue411 = 1.0;
                                                intermediateValue412 = 1.0;
                                                intermediateValue413 = 1.0;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits27;
                                                if (objectInstances.packedValues[productValue334] > 4095us)
                                                {
                                                    reinterpretedBits27 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits27 = uint(objectInstances.packedValues[productValue334]);
                                                }
                                                vec4 sampledTextureValue10 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits27 + 0u], defaultSampler)), vec2(sumValue353, sumValue354), spvNMin(sumValue355, 2.0));
                                                intermediateValue410 = sampledTextureValue10.x;
                                                intermediateValue411 = sampledTextureValue10.y;
                                                intermediateValue412 = sampledTextureValue10.z;
                                                intermediateValue413 = sampledTextureValue10.w;
                                            }
                                            float intermediateValue420;
                                            float intermediateValue421;
                                            float intermediateValue422;
                                            if (intermediateValue343 == 2u)
                                            {
                                                float branchMergedValue41;
                                                float branchMergedValue67;
                                                float branchMergedValue68;
                                                if ((objectInstances.packedValues[productValue335] & 128us) == 0us)
                                                {
                                                    float intermediateValue430;
                                                    if ((objectInstances.packedValues[productValue335] & 2048us) == 0us)
                                                    {
                                                        intermediateValue430 = intermediateValue413;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue454 = intermediateValue413 * 2.0;
                                                        precise float sumValue382 = productValue454 + (-1.0);
                                                        intermediateValue430 = spvNClamp(sumValue382, 0.0, 1.0);
                                                    }
                                                    precise float sumValue379 = 0.0 - intermediateValue410;
                                                    precise float sumValue380 = 0.0 - intermediateValue411;
                                                    precise float sumValue381 = 0.0 - intermediateValue412;
                                                    precise float productValue451 = sumValue379 * intermediateValue430;
                                                    precise float productValue452 = sumValue380 * intermediateValue430;
                                                    precise float productValue453 = sumValue381 * intermediateValue430;
                                                    precise float sumValue373 = intermediateValue410 + productValue451;
                                                    precise float sumValue374 = intermediateValue411 + productValue452;
                                                    precise float sumValue375 = intermediateValue412 + productValue453;
                                                    branchMergedValue41 = sumValue375;
                                                    branchMergedValue67 = sumValue374;
                                                    branchMergedValue68 = sumValue373;
                                                }
                                                else
                                                {
                                                    branchMergedValue41 = 0.33399999141693115234375;
                                                    branchMergedValue67 = 0.33399999141693115234375;
                                                    branchMergedValue68 = 0.33399999141693115234375;
                                                }
                                                intermediateValue420 = branchMergedValue68;
                                                intermediateValue421 = branchMergedValue67;
                                                intermediateValue422 = branchMergedValue41;
                                            }
                                            else
                                            {
                                                precise float sumValue368 = 1.0 - intermediateValue413;
                                                intermediateValue420 = sumValue368;
                                                intermediateValue421 = sumValue368;
                                                intermediateValue422 = sumValue368;
                                            }
                                            precise float productValue445 = intermediateValue328 * intermediateValue420;
                                            precise float productValue446 = intermediateValue329 * intermediateValue421;
                                            precise float productValue447 = intermediateValue330 * intermediateValue422;
                                            float intermediateValue346;
                                            float intermediateValue347;
                                            float intermediateValue348;
                                            bool intermediateValue431;
                                            if (!(dot(vec3(productValue445, productValue446, productValue447), vec3(1.0)) <= 0.00999999977648258209228515625))
                                            {
                                                intermediateValue431 = false;
                                                intermediateValue346 = productValue445;
                                                intermediateValue347 = productValue446;
                                                intermediateValue348 = productValue447;
                                            }
                                            else
                                            {
                                                intermediateValue431 = true;
                                                intermediateValue346 = 0.0;
                                                intermediateValue347 = 0.0;
                                                intermediateValue348 = 0.0;
                                            }
                                            float branchMergedValue79;
                                            float branchMergedValue84;
                                            float branchMergedValue85;
                                            if (intermediateValue431)
                                            {
                                                rayQueryConfirmIntersectionEXT(intermediateValue299);
                                                branchMergedValue79 = intermediateValue346;
                                                branchMergedValue84 = intermediateValue347;
                                                branchMergedValue85 = intermediateValue348;
                                            }
                                            else
                                            {
                                                branchMergedValue79 = intermediateValue346;
                                                branchMergedValue84 = intermediateValue347;
                                                branchMergedValue85 = intermediateValue348;
                                            }
                                            branchMergedValue2 = branchMergedValue79;
                                            branchMergedValue21 = branchMergedValue84;
                                            branchMergedValue22 = branchMergedValue85;
                                        }
                                        else
                                        {
                                            branchMergedValue2 = intermediateValue328;
                                            branchMergedValue21 = intermediateValue329;
                                            branchMergedValue22 = intermediateValue330;
                                        }
                                        intermediateValue308 = branchMergedValue2;
                                        intermediateValue310 = branchMergedValue21;
                                        intermediateValue312 = branchMergedValue22;
                                        bool intermediateValue349 = rayQueryProceedEXT(intermediateValue299);
                                        if (intermediateValue349)
                                        {
                                            intermediateValue328 = intermediateValue308;
                                            intermediateValue329 = intermediateValue310;
                                            intermediateValue330 = intermediateValue312;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue307 = intermediateValue308;
                                    intermediateValue309 = intermediateValue310;
                                    intermediateValue311 = intermediateValue312;
                                }
                                else
                                {
                                    intermediateValue307 = exponentialValue2;
                                    intermediateValue309 = exponentialValue3;
                                    intermediateValue311 = exponentialValue4;
                                }
                                uint intermediateValue313 = rayQueryGetIntersectionTypeEXT(intermediateValue299, bool(1u));
                                bool comparisonValue64 = intermediateValue313 == 1u;
                                float comparisonValue50 = comparisonValue64 ? 0.0 : intermediateValue307;
                                float comparisonValue51 = comparisonValue64 ? 0.0 : intermediateValue309;
                                float comparisonValue52 = comparisonValue64 ? 0.0 : intermediateValue311;
                                float branchMergedValue95;
                                float branchMergedValue102;
                                float branchMergedValue103;
                                if (dot(vec3(comparisonValue50, comparisonValue51, comparisonValue52), vec3(1.0)) > 0.00999999977648258209228515625)
                                {
                                    rayQueryInitializeEXT(intermediateValue332, SceneBVH, 512u, 22u, vec3(sumValue219, fma(ViewCB.packedValues[53u].y, intermediateValue281, reinterpretedBits15), sumValue220), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                                    bool intermediateValue333 = rayQueryProceedEXT(intermediateValue332);
                                    float intermediateValue350;
                                    float intermediateValue352;
                                    float intermediateValue354;
                                    if (intermediateValue333)
                                    {
                                        float intermediateValue351;
                                        float intermediateValue353;
                                        float intermediateValue355;
                                        float intermediateValue372 = comparisonValue50;
                                        float intermediateValue373 = comparisonValue51;
                                        float intermediateValue374 = comparisonValue52;
                                        bool comparisonValue77;
                                        for (;;)
                                        {
                                            uint intermediateValue375 = rayQueryGetIntersectionTypeEXT(intermediateValue332, bool(0u));
                                            comparisonValue77 = intermediateValue375 == 0u;
                                            float branchMergedValue4;
                                            float branchMergedValue25;
                                            float branchMergedValue26;
                                            if (comparisonValue77)
                                            {
                                                vec2 intermediateValue378 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue332, bool(0u));
                                                vec2 intermediateValue379 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue332, bool(0u));
                                                float intermediateValue380 = rayQueryGetIntersectionTEXT(intermediateValue332, bool(0u));
                                                uint intermediateValue381 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue332, bool(0u));
                                                uint intermediateValue382 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue332, bool(0u));
                                                uint intermediateValue383 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue332, bool(0u));
                                                uint productValue371 = (intermediateValue383 * 76u) + 58u;
                                                uint productValue372 = (intermediateValue383 * 76u) + 61u;
                                                precise float sumValue303 = 1.0 - intermediateValue378.x;
                                                precise float sumValue304 = sumValue303 - intermediateValue379.y;
                                                uint bitwiseValue170 = (objectInstances_2.packedValues[(intermediateValue383 * 38u) + 25u] >> 2u) + (intermediateValue381 >> 1u);
                                                uint productValue373 = uint(objectInstances.packedValues[(intermediateValue383 * 76u) + 54u]) + 0u;
                                                bool comparisonValue78 = (intermediateValue381 & 1u) == 0u;
                                                uint comparisonValue79 = comparisonValue78 ? faceUvBuffersRW[nonuniformEXT(productValue373)].packedValues[bitwiseValue170].z : faceUvBuffersRW[nonuniformEXT(productValue373)].packedValues[bitwiseValue170].x;
                                                uint comparisonValue80 = comparisonValue78 ? faceUvBuffersRW[nonuniformEXT(productValue373)].packedValues[bitwiseValue170].y : faceUvBuffersRW[nonuniformEXT(productValue373)].packedValues[bitwiseValue170].w;
                                                uint comparisonValue81 = comparisonValue78 ? faceUvBuffersRW[nonuniformEXT(productValue373)].packedValues[bitwiseValue170].x : faceUvBuffersRW[nonuniformEXT(productValue373)].packedValues[bitwiseValue170].z;
                                                bool intermediateValue384 = int16_t(objectInstances.packedValues[productValue372]) < int16_t(0us);
                                                float intermediateValue399;
                                                float intermediateValue400;
                                                if (intermediateValue384)
                                                {
                                                    uint bitwiseValue178 = comparisonValue81 >> 15u;
                                                    precise float bitwiseValue179 = float(bitwiseValue178 & 1u) * 2.0;
                                                    precise float sumValue317 = bitwiseValue179 + (-1.0);
                                                    precise float bitwiseValue180 = float(comparisonValue81 >> 31u) * 2.0;
                                                    precise float sumValue318 = bitwiseValue180 + (-1.0);
                                                    precise float bitwiseValue181 = float((comparisonValue81 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue182 = float(bitwiseValue178 & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue386 = sumValue317 * 3.0517578125e-05;
                                                    precise float productValue387 = sumValue318 * 3.0517578125e-05;
                                                    precise float sumValue319 = bitwiseValue181 + productValue386;
                                                    precise float sumValue320 = bitwiseValue182 + productValue387;
                                                    intermediateValue399 = sumValue319;
                                                    intermediateValue400 = sumValue320;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue183 = float(comparisonValue81 & 65535u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue184 = float(comparisonValue81 >> 16u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue388 = bitwiseValue183 * 16384.0;
                                                    precise float sumValue321 = productValue388 + 0.5;
                                                    precise float productValue389 = bitwiseValue184 * 16384.0;
                                                    precise float sumValue322 = productValue389 + 0.5;
                                                    precise float productValue390 = floor(sumValue321) * 6.103515625e-05;
                                                    precise float productValue391 = floor(sumValue322) * 6.103515625e-05;
                                                    intermediateValue399 = productValue390;
                                                    intermediateValue400 = productValue391;
                                                }
                                                precise float productValue401 = sumValue304 * intermediateValue399;
                                                precise float productValue402 = sumValue304 * intermediateValue400;
                                                precise float sumValue331 = productValue401 + 0.0;
                                                precise float sumValue332 = productValue402 + 0.0;
                                                float intermediateValue405;
                                                float intermediateValue406;
                                                if (intermediateValue384)
                                                {
                                                    uint bitwiseValue199 = comparisonValue80 >> 15u;
                                                    precise float bitwiseValue200 = float(bitwiseValue199 & 1u) * 2.0;
                                                    precise float sumValue341 = bitwiseValue200 + (-1.0);
                                                    precise float bitwiseValue201 = float(comparisonValue80 >> 31u) * 2.0;
                                                    precise float sumValue342 = bitwiseValue201 + (-1.0);
                                                    precise float bitwiseValue202 = float((comparisonValue80 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue203 = float(bitwiseValue199 & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue411 = sumValue341 * 3.0517578125e-05;
                                                    precise float productValue412 = sumValue342 * 3.0517578125e-05;
                                                    precise float sumValue343 = bitwiseValue202 + productValue411;
                                                    precise float sumValue344 = bitwiseValue203 + productValue412;
                                                    intermediateValue405 = sumValue343;
                                                    intermediateValue406 = sumValue344;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue204 = float(comparisonValue80 & 65535u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue205 = float(comparisonValue80 >> 16u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue413 = bitwiseValue204 * 16384.0;
                                                    precise float sumValue345 = productValue413 + 0.5;
                                                    precise float productValue414 = bitwiseValue205 * 16384.0;
                                                    precise float sumValue346 = productValue414 + 0.5;
                                                    precise float productValue415 = floor(sumValue345) * 6.103515625e-05;
                                                    precise float productValue416 = floor(sumValue346) * 6.103515625e-05;
                                                    intermediateValue405 = productValue415;
                                                    intermediateValue406 = productValue416;
                                                }
                                                precise float productValue427 = intermediateValue378.x * intermediateValue405;
                                                precise float productValue428 = intermediateValue378.x * intermediateValue406;
                                                precise float sumValue356 = sumValue331 + productValue427;
                                                precise float sumValue357 = sumValue332 + productValue428;
                                                float intermediateValue418;
                                                float intermediateValue419;
                                                if (intermediateValue384)
                                                {
                                                    uint bitwiseValue213 = comparisonValue79 >> 15u;
                                                    precise float bitwiseValue214 = float(bitwiseValue213 & 1u) * 2.0;
                                                    precise float sumValue362 = bitwiseValue214 + (-1.0);
                                                    precise float bitwiseValue215 = float(comparisonValue79 >> 31u) * 2.0;
                                                    precise float sumValue363 = bitwiseValue215 + (-1.0);
                                                    precise float bitwiseValue216 = float((comparisonValue79 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue217 = float(bitwiseValue213 & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue436 = sumValue362 * 3.0517578125e-05;
                                                    precise float productValue437 = sumValue363 * 3.0517578125e-05;
                                                    precise float sumValue364 = bitwiseValue216 + productValue436;
                                                    precise float sumValue365 = bitwiseValue217 + productValue437;
                                                    intermediateValue418 = sumValue364;
                                                    intermediateValue419 = sumValue365;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue218 = float(comparisonValue79 & 65535u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue219 = float(comparisonValue79 >> 16u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue438 = bitwiseValue218 * 16384.0;
                                                    precise float sumValue366 = productValue438 + 0.5;
                                                    precise float productValue439 = bitwiseValue219 * 16384.0;
                                                    precise float sumValue367 = productValue439 + 0.5;
                                                    precise float productValue440 = floor(sumValue366) * 6.103515625e-05;
                                                    precise float productValue441 = floor(sumValue367) * 6.103515625e-05;
                                                    intermediateValue418 = productValue440;
                                                    intermediateValue419 = productValue441;
                                                }
                                                precise float productValue442 = intermediateValue379.y * intermediateValue418;
                                                precise float productValue443 = intermediateValue379.y * intermediateValue419;
                                                precise float sumValue369 = sumValue356 + productValue442;
                                                precise float sumValue370 = sumValue357 + productValue443;
                                                precise float productValue444 = intermediateValue380 * 0.083333335816860198974609375;
                                                precise float sumValue371 = productValue444 + (-0.25);
                                                float intermediateValue423;
                                                float intermediateValue424;
                                                float intermediateValue425;
                                                float intermediateValue426;
                                                if (objectInstances.packedValues[productValue371] == 65535us)
                                                {
                                                    intermediateValue423 = 1.0;
                                                    intermediateValue424 = 1.0;
                                                    intermediateValue425 = 1.0;
                                                    intermediateValue426 = 1.0;
                                                }
                                                else
                                                {
                                                    uint reinterpretedBits29;
                                                    if (objectInstances.packedValues[productValue371] > 4095us)
                                                    {
                                                        reinterpretedBits29 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                                    }
                                                    else
                                                    {
                                                        reinterpretedBits29 = uint(objectInstances.packedValues[productValue371]);
                                                    }
                                                    vec4 sampledTextureValue12 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits29 + 0u], defaultSampler)), vec2(sumValue369, sumValue370), spvNMin(sumValue371, 2.0));
                                                    intermediateValue423 = sampledTextureValue12.x;
                                                    intermediateValue424 = sampledTextureValue12.y;
                                                    intermediateValue425 = sampledTextureValue12.z;
                                                    intermediateValue426 = sampledTextureValue12.w;
                                                }
                                                float intermediateValue434;
                                                float intermediateValue435;
                                                float intermediateValue436;
                                                if (intermediateValue382 == 2u)
                                                {
                                                    float branchMergedValue43;
                                                    float branchMergedValue71;
                                                    float branchMergedValue72;
                                                    if ((objectInstances.packedValues[productValue372] & 128us) == 0us)
                                                    {
                                                        float intermediateValue437;
                                                        if ((objectInstances.packedValues[productValue372] & 2048us) == 0us)
                                                        {
                                                            intermediateValue437 = intermediateValue426;
                                                        }
                                                        else
                                                        {
                                                            precise float productValue465 = intermediateValue426 * 2.0;
                                                            precise float sumValue394 = productValue465 + (-1.0);
                                                            intermediateValue437 = spvNClamp(sumValue394, 0.0, 1.0);
                                                        }
                                                        precise float sumValue391 = 0.0 - intermediateValue423;
                                                        precise float sumValue392 = 0.0 - intermediateValue424;
                                                        precise float sumValue393 = 0.0 - intermediateValue425;
                                                        precise float productValue462 = sumValue391 * intermediateValue437;
                                                        precise float productValue463 = sumValue392 * intermediateValue437;
                                                        precise float productValue464 = sumValue393 * intermediateValue437;
                                                        precise float sumValue388 = intermediateValue423 + productValue462;
                                                        precise float sumValue389 = intermediateValue424 + productValue463;
                                                        precise float sumValue390 = intermediateValue425 + productValue464;
                                                        branchMergedValue43 = sumValue388;
                                                        branchMergedValue71 = sumValue389;
                                                        branchMergedValue72 = sumValue390;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue43 = 0.33399999141693115234375;
                                                        branchMergedValue71 = 0.33399999141693115234375;
                                                        branchMergedValue72 = 0.33399999141693115234375;
                                                    }
                                                    intermediateValue434 = branchMergedValue43;
                                                    intermediateValue435 = branchMergedValue71;
                                                    intermediateValue436 = branchMergedValue72;
                                                }
                                                else
                                                {
                                                    precise float sumValue383 = 1.0 - intermediateValue426;
                                                    intermediateValue434 = sumValue383;
                                                    intermediateValue435 = sumValue383;
                                                    intermediateValue436 = sumValue383;
                                                }
                                                precise float productValue459 = intermediateValue372 * intermediateValue434;
                                                precise float productValue460 = intermediateValue373 * intermediateValue435;
                                                precise float productValue461 = intermediateValue374 * intermediateValue436;
                                                float intermediateValue385;
                                                float intermediateValue386;
                                                float intermediateValue387;
                                                bool intermediateValue438;
                                                if (!(dot(vec3(productValue459, productValue460, productValue461), vec3(1.0)) <= 0.00999999977648258209228515625))
                                                {
                                                    intermediateValue438 = false;
                                                    intermediateValue385 = productValue459;
                                                    intermediateValue386 = productValue460;
                                                    intermediateValue387 = productValue461;
                                                }
                                                else
                                                {
                                                    intermediateValue438 = true;
                                                    intermediateValue385 = 0.0;
                                                    intermediateValue386 = 0.0;
                                                    intermediateValue387 = 0.0;
                                                }
                                                float branchMergedValue81;
                                                float branchMergedValue88;
                                                float branchMergedValue89;
                                                if (intermediateValue438)
                                                {
                                                    rayQueryConfirmIntersectionEXT(intermediateValue332);
                                                    branchMergedValue81 = intermediateValue387;
                                                    branchMergedValue88 = intermediateValue386;
                                                    branchMergedValue89 = intermediateValue385;
                                                }
                                                else
                                                {
                                                    branchMergedValue81 = intermediateValue387;
                                                    branchMergedValue88 = intermediateValue386;
                                                    branchMergedValue89 = intermediateValue385;
                                                }
                                                branchMergedValue4 = branchMergedValue81;
                                                branchMergedValue25 = branchMergedValue88;
                                                branchMergedValue26 = branchMergedValue89;
                                            }
                                            else
                                            {
                                                branchMergedValue4 = intermediateValue374;
                                                branchMergedValue25 = intermediateValue373;
                                                branchMergedValue26 = intermediateValue372;
                                            }
                                            intermediateValue355 = branchMergedValue4;
                                            intermediateValue353 = branchMergedValue25;
                                            intermediateValue351 = branchMergedValue26;
                                            bool intermediateValue388 = rayQueryProceedEXT(intermediateValue332);
                                            if (intermediateValue388)
                                            {
                                                intermediateValue372 = intermediateValue351;
                                                intermediateValue373 = intermediateValue353;
                                                intermediateValue374 = intermediateValue355;
                                                continue;
                                            }
                                            else
                                            {
                                                break;
                                            }
                                        }
                                        intermediateValue350 = intermediateValue351;
                                        intermediateValue352 = intermediateValue353;
                                        intermediateValue354 = intermediateValue355;
                                    }
                                    else
                                    {
                                        intermediateValue350 = comparisonValue50;
                                        intermediateValue352 = comparisonValue51;
                                        intermediateValue354 = comparisonValue52;
                                    }
                                    uint intermediateValue356 = rayQueryGetIntersectionTypeEXT(intermediateValue332, bool(1u));
                                    bool comparisonValue72 = intermediateValue356 == 1u;
                                    branchMergedValue95 = comparisonValue72 ? 0.0 : intermediateValue354;
                                    branchMergedValue102 = comparisonValue72 ? 0.0 : intermediateValue352;
                                    branchMergedValue103 = comparisonValue72 ? 0.0 : intermediateValue350;
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
                                rayQueryInitializeEXT(intermediateValue301, SceneBVH, 512u, 22u, vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                                bool intermediateValue302 = rayQueryProceedEXT(intermediateValue301);
                                float intermediateValue314;
                                float intermediateValue316;
                                float intermediateValue318;
                                if (intermediateValue302)
                                {
                                    float intermediateValue315;
                                    float intermediateValue317;
                                    float intermediateValue319;
                                    float intermediateValue334 = 1.0;
                                    float intermediateValue335 = 1.0;
                                    float intermediateValue336 = 1.0;
                                    bool comparisonValue67;
                                    for (;;)
                                    {
                                        uint intermediateValue337 = rayQueryGetIntersectionTypeEXT(intermediateValue301, bool(0u));
                                        comparisonValue67 = intermediateValue337 == 0u;
                                        float branchMergedValue3;
                                        float branchMergedValue23;
                                        float branchMergedValue24;
                                        if (comparisonValue67)
                                        {
                                            vec2 intermediateValue357 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue301, bool(0u));
                                            vec2 intermediateValue358 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue301, bool(0u));
                                            float intermediateValue359 = rayQueryGetIntersectionTEXT(intermediateValue301, bool(0u));
                                            uint intermediateValue360 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue301, bool(0u));
                                            uint intermediateValue361 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue301, bool(0u));
                                            uint intermediateValue362 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue301, bool(0u));
                                            uint productValue337 = (intermediateValue362 * 76u) + 58u;
                                            uint productValue338 = (intermediateValue362 * 76u) + 61u;
                                            precise float sumValue271 = 1.0 - intermediateValue357.x;
                                            precise float sumValue272 = sumValue271 - intermediateValue358.y;
                                            uint bitwiseValue141 = (objectInstances_2.packedValues[(intermediateValue362 * 38u) + 25u] >> 2u) + (intermediateValue360 >> 1u);
                                            uint productValue339 = uint(objectInstances.packedValues[(intermediateValue362 * 76u) + 54u]) + 0u;
                                            bool comparisonValue73 = (intermediateValue360 & 1u) == 0u;
                                            uint comparisonValue74 = comparisonValue73 ? faceUvBuffersRW[nonuniformEXT(productValue339)].packedValues[bitwiseValue141].z : faceUvBuffersRW[nonuniformEXT(productValue339)].packedValues[bitwiseValue141].x;
                                            uint comparisonValue75 = comparisonValue73 ? faceUvBuffersRW[nonuniformEXT(productValue339)].packedValues[bitwiseValue141].y : faceUvBuffersRW[nonuniformEXT(productValue339)].packedValues[bitwiseValue141].w;
                                            uint comparisonValue76 = comparisonValue73 ? faceUvBuffersRW[nonuniformEXT(productValue339)].packedValues[bitwiseValue141].x : faceUvBuffersRW[nonuniformEXT(productValue339)].packedValues[bitwiseValue141].z;
                                            bool intermediateValue363 = int16_t(objectInstances.packedValues[productValue338]) < int16_t(0us);
                                            float intermediateValue389;
                                            float intermediateValue390;
                                            if (intermediateValue363)
                                            {
                                                uint bitwiseValue149 = comparisonValue76 >> 15u;
                                                precise float bitwiseValue150 = float(bitwiseValue149 & 1u) * 2.0;
                                                precise float sumValue283 = bitwiseValue150 + (-1.0);
                                                precise float bitwiseValue151 = float(comparisonValue76 >> 31u) * 2.0;
                                                precise float sumValue284 = bitwiseValue151 + (-1.0);
                                                precise float bitwiseValue152 = float((comparisonValue76 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue153 = float(bitwiseValue149 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue350 = sumValue283 * 3.0517578125e-05;
                                                precise float productValue351 = sumValue284 * 3.0517578125e-05;
                                                precise float sumValue285 = bitwiseValue152 + productValue350;
                                                precise float sumValue286 = bitwiseValue153 + productValue351;
                                                intermediateValue389 = sumValue285;
                                                intermediateValue390 = sumValue286;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue154 = float(comparisonValue76 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue155 = float(comparisonValue76 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue352 = bitwiseValue154 * 16384.0;
                                                precise float sumValue287 = productValue352 + 0.5;
                                                precise float productValue353 = bitwiseValue155 * 16384.0;
                                                precise float sumValue288 = productValue353 + 0.5;
                                                precise float productValue354 = floor(sumValue287) * 6.103515625e-05;
                                                precise float productValue355 = floor(sumValue288) * 6.103515625e-05;
                                                intermediateValue389 = productValue354;
                                                intermediateValue390 = productValue355;
                                            }
                                            precise float productValue374 = sumValue272 * intermediateValue389;
                                            precise float productValue375 = sumValue272 * intermediateValue390;
                                            precise float sumValue305 = productValue374 + 0.0;
                                            precise float sumValue306 = productValue375 + 0.0;
                                            float intermediateValue401;
                                            float intermediateValue402;
                                            if (intermediateValue363)
                                            {
                                                uint bitwiseValue185 = comparisonValue75 >> 15u;
                                                precise float bitwiseValue186 = float(bitwiseValue185 & 1u) * 2.0;
                                                precise float sumValue323 = bitwiseValue186 + (-1.0);
                                                precise float bitwiseValue187 = float(comparisonValue75 >> 31u) * 2.0;
                                                precise float sumValue324 = bitwiseValue187 + (-1.0);
                                                precise float bitwiseValue188 = float((comparisonValue75 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue189 = float(bitwiseValue185 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue392 = sumValue323 * 3.0517578125e-05;
                                                precise float productValue393 = sumValue324 * 3.0517578125e-05;
                                                precise float sumValue325 = bitwiseValue188 + productValue392;
                                                precise float sumValue326 = bitwiseValue189 + productValue393;
                                                intermediateValue401 = sumValue325;
                                                intermediateValue402 = sumValue326;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue190 = float(comparisonValue75 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue191 = float(comparisonValue75 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue394 = bitwiseValue190 * 16384.0;
                                                precise float sumValue327 = productValue394 + 0.5;
                                                precise float productValue395 = bitwiseValue191 * 16384.0;
                                                precise float sumValue328 = productValue395 + 0.5;
                                                precise float productValue396 = floor(sumValue327) * 6.103515625e-05;
                                                precise float productValue397 = floor(sumValue328) * 6.103515625e-05;
                                                intermediateValue401 = productValue396;
                                                intermediateValue402 = productValue397;
                                            }
                                            precise float productValue403 = intermediateValue357.x * intermediateValue401;
                                            precise float productValue404 = intermediateValue357.x * intermediateValue402;
                                            precise float sumValue333 = sumValue305 + productValue403;
                                            precise float sumValue334 = sumValue306 + productValue404;
                                            float intermediateValue407;
                                            float intermediateValue408;
                                            if (intermediateValue363)
                                            {
                                                uint bitwiseValue206 = comparisonValue74 >> 15u;
                                                precise float bitwiseValue207 = float(bitwiseValue206 & 1u) * 2.0;
                                                precise float sumValue347 = bitwiseValue207 + (-1.0);
                                                precise float bitwiseValue208 = float(comparisonValue74 >> 31u) * 2.0;
                                                precise float sumValue348 = bitwiseValue208 + (-1.0);
                                                precise float bitwiseValue209 = float((comparisonValue74 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue210 = float(bitwiseValue206 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue417 = sumValue347 * 3.0517578125e-05;
                                                precise float productValue418 = sumValue348 * 3.0517578125e-05;
                                                precise float sumValue349 = bitwiseValue209 + productValue417;
                                                precise float sumValue350 = bitwiseValue210 + productValue418;
                                                intermediateValue407 = sumValue349;
                                                intermediateValue408 = sumValue350;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue211 = float(comparisonValue74 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue212 = float(comparisonValue74 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue419 = bitwiseValue211 * 16384.0;
                                                precise float sumValue351 = productValue419 + 0.5;
                                                precise float productValue420 = bitwiseValue212 * 16384.0;
                                                precise float sumValue352 = productValue420 + 0.5;
                                                precise float productValue421 = floor(sumValue351) * 6.103515625e-05;
                                                precise float productValue422 = floor(sumValue352) * 6.103515625e-05;
                                                intermediateValue407 = productValue421;
                                                intermediateValue408 = productValue422;
                                            }
                                            precise float productValue429 = intermediateValue358.y * intermediateValue407;
                                            precise float productValue430 = intermediateValue358.y * intermediateValue408;
                                            precise float sumValue358 = sumValue333 + productValue429;
                                            precise float sumValue359 = sumValue334 + productValue430;
                                            precise float productValue431 = intermediateValue359 * 0.083333335816860198974609375;
                                            precise float sumValue360 = productValue431 + (-0.25);
                                            float intermediateValue414;
                                            float intermediateValue415;
                                            float intermediateValue416;
                                            float intermediateValue417;
                                            if (objectInstances.packedValues[productValue337] == 65535us)
                                            {
                                                intermediateValue414 = 1.0;
                                                intermediateValue415 = 1.0;
                                                intermediateValue416 = 1.0;
                                                intermediateValue417 = 1.0;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits28;
                                                if (objectInstances.packedValues[productValue337] > 4095us)
                                                {
                                                    reinterpretedBits28 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits28 = uint(objectInstances.packedValues[productValue337]);
                                                }
                                                vec4 sampledTextureValue11 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits28 + 0u], defaultSampler)), vec2(sumValue358, sumValue359), spvNMin(sumValue360, 2.0));
                                                intermediateValue414 = sampledTextureValue11.x;
                                                intermediateValue415 = sampledTextureValue11.y;
                                                intermediateValue416 = sampledTextureValue11.z;
                                                intermediateValue417 = sampledTextureValue11.w;
                                            }
                                            float intermediateValue427;
                                            float intermediateValue428;
                                            float intermediateValue429;
                                            if (intermediateValue361 == 2u)
                                            {
                                                float branchMergedValue42;
                                                float branchMergedValue69;
                                                float branchMergedValue70;
                                                if ((objectInstances.packedValues[productValue338] & 128us) == 0us)
                                                {
                                                    float intermediateValue432;
                                                    if ((objectInstances.packedValues[productValue338] & 2048us) == 0us)
                                                    {
                                                        intermediateValue432 = intermediateValue417;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue458 = intermediateValue417 * 2.0;
                                                        precise float sumValue387 = productValue458 + (-1.0);
                                                        intermediateValue432 = spvNClamp(sumValue387, 0.0, 1.0);
                                                    }
                                                    precise float sumValue384 = 0.0 - intermediateValue414;
                                                    precise float sumValue385 = 0.0 - intermediateValue415;
                                                    precise float sumValue386 = 0.0 - intermediateValue416;
                                                    precise float productValue455 = sumValue384 * intermediateValue432;
                                                    precise float productValue456 = sumValue385 * intermediateValue432;
                                                    precise float productValue457 = sumValue386 * intermediateValue432;
                                                    precise float sumValue376 = intermediateValue414 + productValue455;
                                                    precise float sumValue377 = intermediateValue415 + productValue456;
                                                    precise float sumValue378 = intermediateValue416 + productValue457;
                                                    branchMergedValue42 = sumValue378;
                                                    branchMergedValue69 = sumValue377;
                                                    branchMergedValue70 = sumValue376;
                                                }
                                                else
                                                {
                                                    branchMergedValue42 = 0.33399999141693115234375;
                                                    branchMergedValue69 = 0.33399999141693115234375;
                                                    branchMergedValue70 = 0.33399999141693115234375;
                                                }
                                                intermediateValue427 = branchMergedValue70;
                                                intermediateValue428 = branchMergedValue69;
                                                intermediateValue429 = branchMergedValue42;
                                            }
                                            else
                                            {
                                                precise float sumValue372 = 1.0 - intermediateValue417;
                                                intermediateValue427 = sumValue372;
                                                intermediateValue428 = sumValue372;
                                                intermediateValue429 = sumValue372;
                                            }
                                            precise float productValue448 = intermediateValue334 * intermediateValue427;
                                            precise float productValue449 = intermediateValue335 * intermediateValue428;
                                            precise float productValue450 = intermediateValue336 * intermediateValue429;
                                            float intermediateValue364;
                                            float intermediateValue365;
                                            float intermediateValue366;
                                            bool intermediateValue433;
                                            if (!(dot(vec3(productValue448, productValue449, productValue450), vec3(1.0)) <= 0.00999999977648258209228515625))
                                            {
                                                intermediateValue433 = false;
                                                intermediateValue364 = productValue448;
                                                intermediateValue365 = productValue449;
                                                intermediateValue366 = productValue450;
                                            }
                                            else
                                            {
                                                intermediateValue433 = true;
                                                intermediateValue364 = 0.0;
                                                intermediateValue365 = 0.0;
                                                intermediateValue366 = 0.0;
                                            }
                                            float branchMergedValue80;
                                            float branchMergedValue86;
                                            float branchMergedValue87;
                                            if (intermediateValue433)
                                            {
                                                rayQueryConfirmIntersectionEXT(intermediateValue301);
                                                branchMergedValue80 = intermediateValue366;
                                                branchMergedValue86 = intermediateValue365;
                                                branchMergedValue87 = intermediateValue364;
                                            }
                                            else
                                            {
                                                branchMergedValue80 = intermediateValue366;
                                                branchMergedValue86 = intermediateValue365;
                                                branchMergedValue87 = intermediateValue364;
                                            }
                                            branchMergedValue3 = branchMergedValue80;
                                            branchMergedValue23 = branchMergedValue86;
                                            branchMergedValue24 = branchMergedValue87;
                                        }
                                        else
                                        {
                                            branchMergedValue3 = intermediateValue336;
                                            branchMergedValue23 = intermediateValue335;
                                            branchMergedValue24 = intermediateValue334;
                                        }
                                        intermediateValue319 = branchMergedValue3;
                                        intermediateValue317 = branchMergedValue23;
                                        intermediateValue315 = branchMergedValue24;
                                        bool intermediateValue367 = rayQueryProceedEXT(intermediateValue301);
                                        if (intermediateValue367)
                                        {
                                            intermediateValue334 = intermediateValue315;
                                            intermediateValue335 = intermediateValue317;
                                            intermediateValue336 = intermediateValue319;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue314 = intermediateValue315;
                                    intermediateValue316 = intermediateValue317;
                                    intermediateValue318 = intermediateValue319;
                                }
                                else
                                {
                                    intermediateValue314 = 1.0;
                                    intermediateValue316 = 1.0;
                                    intermediateValue318 = 1.0;
                                }
                                uint intermediateValue320 = rayQueryGetIntersectionTypeEXT(intermediateValue301, bool(1u));
                                bool comparisonValue65 = intermediateValue320 == 1u;
                                branchMergedValue34 = comparisonValue65 ? 0.0 : intermediateValue318;
                                branchMergedValue65 = comparisonValue65 ? 0.0 : intermediateValue316;
                                branchMergedValue66 = comparisonValue65 ? 0.0 : intermediateValue314;
                            }
                            intermediateValue259 = branchMergedValue66;
                            intermediateValue260 = branchMergedValue65;
                            intermediateValue261 = branchMergedValue34;
                        }
                        vec2 reinterpretedBits17 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[intermediateValue195 * 8u]);
                        vec2 reinterpretedBits18 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue195 * 8u) + 1u]);
                        float reinterpretedBits19 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue195 * 16u) + 13u]);
                        float reinterpretedBits20 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue195 * 16u) + 14u]);
                        uint reinterpretedBits21;
                        if (objectInstances.packedValues[productValue107] > 4095us)
                        {
                            reinterpretedBits21 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits21 = uint(objectInstances.packedValues[productValue107]);
                        }
                        uint sumValue214 = reinterpretedBits21 + 0u;
                        float intermediateValue275;
                        float intermediateValue276;
                        float intermediateValue277;
                        float intermediateValue278;
                        if (objectInstances.packedValues[productValue107] == 65535us)
                        {
                            intermediateValue275 = 1.0;
                            intermediateValue276 = 1.0;
                            intermediateValue277 = 1.0;
                            intermediateValue278 = 1.0;
                        }
                        else
                        {
                            vec4 sampledTextureValue4 = textureLod(nonuniformEXT(sampler2D(textures[sumValue214], defaultSampler)), vec2(productValue227, productValue228), spvNMin(100.0, reinterpretedBits19));
                            intermediateValue275 = sampledTextureValue4.x;
                            intermediateValue276 = sampledTextureValue4.y;
                            intermediateValue277 = sampledTextureValue4.z;
                            intermediateValue278 = sampledTextureValue4.w;
                        }
                        float intermediateValue162;
                        float intermediateValue164;
                        float intermediateValue166;
                        float productValue145;
                        float productValue146;
                        float productValue147;
                        float productValue148;
                        float productValue149;
                        float productValue150;
                        float productValue151;
                        float productValue152;
                        float productValue153;
                        if ((objectInstances.packedValues[productValue109] & 1536us) == 0us)
                        {
                            float intermediateValue303;
                            float intermediateValue304;
                            float intermediateValue305;
                            float intermediateValue306;
                            if ((objectInstances.packedValues[productValue109] & 4us) == 0us)
                            {
                                intermediateValue303 = intermediateValue278;
                                intermediateValue304 = bitwiseValue100;
                                intermediateValue305 = bitwiseValue101;
                                intermediateValue306 = bitwiseValue102;
                            }
                            else
                            {
                                uint reinterpretedBits22;
                                if (objectInstances.packedValues[productValue108] > 4095us)
                                {
                                    reinterpretedBits22 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits22 = uint(objectInstances.packedValues[productValue108]);
                                }
                                vec4 sampledTextureValue8 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits22 + 0u], defaultSampler)), vec2(bitwiseValue100, bitwiseValue101), 0.0);
                                intermediateValue303 = 1.0;
                                intermediateValue304 = ((((sampledTextureValue8.x * 2.0) + (-1.0)) * bitwiseValue102) + 1.0) * bitwiseValue103;
                                intermediateValue305 = ((((sampledTextureValue8.y * 2.0) + (-1.0)) * bitwiseValue102) + 1.0) * bitwiseValue103;
                                intermediateValue306 = ((((sampledTextureValue8.z * 2.0) + (-1.0)) * bitwiseValue102) + 1.0) * bitwiseValue103;
                            }
                            float intermediateValue323;
                            float intermediateValue324;
                            float intermediateValue325;
                            if ((objectInstances.packedValues[productValue109] & 8192us) == 0us)
                            {
                                intermediateValue323 = intermediateValue304;
                                intermediateValue324 = intermediateValue305;
                                intermediateValue325 = intermediateValue306;
                            }
                            else
                            {
                                intermediateValue323 = ((1.0 - intermediateValue304) * intermediateValue303) + intermediateValue304;
                                intermediateValue324 = ((1.0 - intermediateValue305) * intermediateValue303) + intermediateValue305;
                                intermediateValue325 = ((1.0 - intermediateValue306) * intermediateValue303) + intermediateValue306;
                            }
                            float intermediateValue338;
                            if ((objectInstances.packedValues[productValue109] & 2048us) == 0us)
                            {
                                intermediateValue338 = intermediateValue303;
                            }
                            else
                            {
                                intermediateValue338 = spvNClamp(fma(intermediateValue303, 2.0, -1.0), 0.0, 1.0);
                            }
                            float bitwiseValue130 = (intermediateValue323 * intermediateValue275) * ((intermediateValue338 * ((float(objectInstances_2.packedValues[productValue110] >> 24u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                            float bitwiseValue131 = (intermediateValue324 * intermediateValue276) * ((intermediateValue338 * ((float((objectInstances_2.packedValues[productValue110] >> 16u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                            float bitwiseValue132 = (intermediateValue325 * intermediateValue277) * ((intermediateValue338 * ((float((objectInstances_2.packedValues[productValue110] >> 8u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                            float productValue362;
                            if (bitwiseValue130 < 0.040449999272823333740234375)
                            {
                                productValue362 = bitwiseValue130 * 0.077399380505084991455078125;
                            }
                            else
                            {
                                productValue362 = exp2(log2((bitwiseValue130 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                            }
                            float productValue398;
                            if (bitwiseValue131 < 0.040449999272823333740234375)
                            {
                                productValue398 = bitwiseValue131 * 0.077399380505084991455078125;
                            }
                            else
                            {
                                productValue398 = exp2(log2((bitwiseValue131 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                            }
                            float productValue423;
                            if (bitwiseValue132 < 0.040449999272823333740234375)
                            {
                                productValue423 = bitwiseValue132 * 0.077399380505084991455078125;
                            }
                            else
                            {
                                productValue423 = exp2(log2((bitwiseValue132 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                            }
                            float reinterpretedBits25;
                            float reinterpretedBits26;
                            if ((pbrTextureDataBuffer.packedValues[(intermediateValue195 * 16u) + 8u] & 1u) == 0u)
                            {
                                reinterpretedBits25 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue195 * 16u) + 11u]);
                                reinterpretedBits26 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue195 * 16u) + 10u]);
                            }
                            else
                            {
                                vec4 sampledTextureValue9 = textureLod(nonuniformEXT(sampler2D(textures[sumValue214], defaultSampler)), vec2(fma(productValue227, reinterpretedBits17.x, reinterpretedBits18.x), fma(productValue228, reinterpretedBits17.y, reinterpretedBits18.y)), spvNMin((100.0 - reinterpretedBits19) + reinterpretedBits20, reinterpretedBits20));
                                float intermediateValue409 = sampledTextureValue9.y;
                                reinterpretedBits25 = sampledTextureValue9.x;
                                reinterpretedBits26 = fma(intermediateValue409, intermediateValue409, 0.0);
                            }
                            float sumValue361 = 1.0 - reinterpretedBits25;
                            float productValue432 = sumValue361 * productValue362;
                            float productValue433 = sumValue361 * productValue398;
                            float productValue434 = sumValue361 * productValue423;
                            float dotProductValue25 = dot(vec3(productValue362, productValue398, productValue423), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                            float productValue435 = (reinterpretedBits26 * 5.0) * ViewCB.packedValues[84u].w;
                            intermediateValue162 = comparisonValue43;
                            intermediateValue164 = comparisonValue44;
                            intermediateValue166 = comparisonValue45;
                            productValue145 = productValue435 * (((dotProductValue25 - productValue362) * ViewCB.packedValues[85u].x) + productValue362);
                            productValue146 = productValue435 * (((dotProductValue25 - productValue398) * ViewCB.packedValues[85u].x) + productValue398);
                            productValue147 = productValue435 * (((dotProductValue25 - productValue423) * ViewCB.packedValues[85u].x) + productValue423);
                            productValue148 = (reinterpretedBits25 * (productValue362 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                            productValue149 = (reinterpretedBits25 * (productValue398 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                            productValue150 = (reinterpretedBits25 * (productValue423 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                            productValue151 = productValue432 - (productValue432 * reinterpretedBits26);
                            productValue152 = productValue433 - (productValue433 * reinterpretedBits26);
                            productValue153 = productValue434 - (productValue434 * reinterpretedBits26);
                        }
                        else
                        {
                            intermediateValue162 = intermediateValue12;
                            intermediateValue164 = intermediateValue15;
                            intermediateValue166 = intermediateValue17;
                            productValue145 = intermediateValue19;
                            productValue146 = intermediateValue21;
                            productValue147 = intermediateValue23;
                            productValue148 = intermediateValue25;
                            productValue149 = intermediateValue27;
                            productValue150 = intermediateValue29;
                            productValue151 = intermediateValue31;
                            productValue152 = intermediateValue33;
                            productValue153 = intermediateValue35;
                        }
                        float productValue154 = (ViewCB.packedValues[85u].y * productValue145) + (productValue151 * intermediateValue241);
                        float productValue155 = (ViewCB.packedValues[85u].y * productValue146) + (productValue152 * intermediateValue242);
                        float productValue156 = (ViewCB.packedValues[85u].y * productValue147) + (productValue153 * intermediateValue243);
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
                        if (dot(vec3(intermediateValue259, intermediateValue260, intermediateValue261), vec3(1.0)) > 0.0)
                        {
                            float sumValue241 = (-0.0) - intermediateValue38;
                            float sumValue242 = (-0.0) - intermediateValue40;
                            float sumValue243 = (-0.0) - intermediateValue42;
                            float sumValue244 = ViewCB.packedValues[52u].x - intermediateValue38;
                            float sumValue245 = ViewCB.packedValues[52u].y - intermediateValue40;
                            float sumValue246 = ViewCB.packedValues[52u].z - intermediateValue42;
                            float inverseLengthValue5 = inversesqrt(dot(vec3(sumValue244, sumValue245, sumValue246), vec3(sumValue244, sumValue245, sumValue246)));
                            float dotProductValue21 = spvNClamp(dot(vec3(intermediateValue162, intermediateValue164, intermediateValue166), vec3(ViewCB.packedValues[52u].xyz)), 0.0, 1.0);
                            float dotProductValue22 = spvNClamp(dot(vec3(intermediateValue162, intermediateValue164, intermediateValue166), vec3(sumValue241, sumValue242, sumValue243)), 0.0, 1.0);
                            float dotProductValue23 = spvNClamp(dot(vec3(sumValue241, sumValue242, sumValue243), vec3(inverseLengthValue5 * sumValue244, inverseLengthValue5 * sumValue245, inverseLengthValue5 * sumValue246)), 0.0, 1.0);
                            float dotProductValue24 = spvNClamp(dot(vec3(productValue148, productValue149, productValue150), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0);
                            float exponentialValue5 = exp2(log2(spvNClamp(1.0 - dotProductValue23, 0.0, 1.0)) * 5.0);
                            float productValue308 = (exponentialValue5 * (dotProductValue24 - productValue148)) + productValue148;
                            float productValue309 = (exponentialValue5 * (dotProductValue24 - productValue149)) + productValue149;
                            float productValue310 = (exponentialValue5 * (dotProductValue24 - productValue150)) + productValue150;
                            float productValue311 = ((dotProductValue23 * dotProductValue23) * 2.0) + (-0.5);
                            float exponentialValue6 = (((exp2(log2(spvNClamp(1.0 - dotProductValue22, 0.0, 1.0)) * 5.0) * productValue311) + 1.0) * 0.3183098733425140380859375) * ((exp2(log2(spvNClamp(1.0 - dotProductValue21, 0.0, 1.0)) * 5.0) * productValue311) + 1.0);
                            float quotientValue10 = 0.079577468335628509521484375 / ((((dotProductValue22 * 0.5) + 0.5) * ((dotProductValue21 * 0.5) + 0.5)) + 1.0000000133514319600180897396058e-10);
                            branchMergedValue31 = intermediateValue162;
                            branchMergedValue54 = intermediateValue164;
                            branchMergedValue55 = (((ViewCB.packedValues[50u].z * intermediateValue261) * dotProductValue21) * ((((1.0 - productValue310) * productValue153) * exponentialValue6) + (productValue310 * quotientValue10))) + productValue156;
                            branchMergedValue56 = (((ViewCB.packedValues[50u].y * intermediateValue260) * dotProductValue21) * ((((1.0 - productValue309) * productValue152) * exponentialValue6) + (productValue309 * quotientValue10))) + productValue155;
                            branchMergedValue57 = (((ViewCB.packedValues[50u].x * intermediateValue259) * dotProductValue21) * ((((1.0 - productValue308) * productValue151) * exponentialValue6) + (productValue308 * quotientValue10))) + productValue154;
                            branchMergedValue58 = productValue153;
                            branchMergedValue59 = productValue152;
                            branchMergedValue60 = productValue151;
                            branchMergedValue61 = productValue150;
                            branchMergedValue62 = productValue149;
                            branchMergedValue73 = productValue148;
                            branchMergedValue74 = productValue147;
                            branchMergedValue75 = productValue146;
                            branchMergedValue76 = productValue145;
                            branchMergedValue77 = intermediateValue166;
                        }
                        else
                        {
                            branchMergedValue31 = intermediateValue162;
                            branchMergedValue54 = intermediateValue164;
                            branchMergedValue55 = productValue156;
                            branchMergedValue56 = productValue155;
                            branchMergedValue57 = productValue154;
                            branchMergedValue58 = productValue153;
                            branchMergedValue59 = productValue152;
                            branchMergedValue60 = productValue151;
                            branchMergedValue61 = productValue150;
                            branchMergedValue62 = productValue149;
                            branchMergedValue73 = productValue148;
                            branchMergedValue74 = productValue147;
                            branchMergedValue75 = productValue146;
                            branchMergedValue76 = productValue145;
                            branchMergedValue77 = intermediateValue166;
                        }
                        intermediateValue161 = branchMergedValue31;
                        intermediateValue163 = branchMergedValue54;
                        intermediateValue165 = branchMergedValue77;
                        intermediateValue167 = branchMergedValue76;
                        intermediateValue168 = branchMergedValue75;
                        intermediateValue169 = branchMergedValue74;
                        intermediateValue170 = branchMergedValue73;
                        intermediateValue171 = branchMergedValue62;
                        intermediateValue172 = branchMergedValue61;
                        intermediateValue173 = branchMergedValue60;
                        intermediateValue174 = branchMergedValue59;
                        intermediateValue175 = branchMergedValue58;
                        comparisonValue34 = branchMergedValue57;
                        comparisonValue35 = branchMergedValue56;
                        comparisonValue36 = branchMergedValue55;
                    }
                    precise float productValue157 = comparisonValue25 * comparisonValue36;
                    precise float productValue158 = comparisonValue24 * comparisonValue35;
                    precise float productValue159 = comparisonValue23 * comparisonValue34;
                    float exponentialValue = 1.0 - exp2(log2(spvNClamp(intermediateValue82 * 0.0045106001198291778564453125, 0.0, 1.0)) * 3.0);
                    intermediateValue57 = intermediateValue161;
                    intermediateValue58 = intermediateValue163;
                    intermediateValue59 = intermediateValue165;
                    intermediateValue60 = intermediateValue167;
                    intermediateValue61 = intermediateValue168;
                    intermediateValue62 = intermediateValue169;
                    intermediateValue63 = intermediateValue170;
                    intermediateValue64 = intermediateValue171;
                    intermediateValue65 = intermediateValue172;
                    intermediateValue66 = intermediateValue173;
                    intermediateValue67 = intermediateValue174;
                    intermediateValue68 = intermediateValue175;
                    productValue167 = exponentialValue * productValue159;
                    productValue168 = exponentialValue * productValue158;
                    productValue169 = exponentialValue * productValue157;
                }
                else
                {
                    uvec4 reinterpretedBits10 = floatBitsToUint(ViewCB.packedValues[75u]);
                    uint intermediateValue138 = reinterpretedBits10.w;
                    float sumValue78 = (-0.0) - intermediateValue38;
                    float sumValue79 = (-0.0) - intermediateValue40;
                    float sumValue80 = (-0.0) - intermediateValue42;
                    float productValue112 = ViewCB.packedValues[60u].w * ViewCB.packedValues[60u].w;
                    float dotProductValue8 = (spvNClamp(ViewCB.packedValues[90u].w, 0.0, 1.0) * 15.9154567718505859375) * ((1.0 - productValue112) / exp2(log2(abs((productValue112 + 1.0) - ((ViewCB.packedValues[60u].w * 2.0) * spvNMin(spvNMax((-0.0) - dot(vec3(ViewCB.packedValues[52u].xyz), vec3(sumValue78, sumValue79, sumValue80)), -1.0), 1.0)))) * 1.5));
                    float intermediateValue176;
                    float intermediateValue177;
                    float intermediateValue178;
                    if (intermediateValue138 == 1u)
                    {
                        intermediateValue176 = ViewCB.packedValues[58u].x;
                        intermediateValue177 = ViewCB.packedValues[58u].y;
                        intermediateValue178 = ViewCB.packedValues[58u].z;
                    }
                    else
                    {
                        float branchMergedValue28;
                        float branchMergedValue44;
                        float branchMergedValue45;
                        if (intermediateValue138 == 2u)
                        {
                            uvec4 intermediateValue179 = floatBitsToUint(ViewCB.packedValues[74u]);
                            uint intermediateValue180 = intermediateValue179.z;
                            uint reinterpretedBits11;
                            if (intermediateValue180 > 4095u)
                            {
                                reinterpretedBits11 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits11 = intermediateValue180;
                            }
                            float intermediateValue188 = abs(intermediateValue38);
                            float intermediateValue189 = abs(intermediateValue40);
                            float intermediateValue190 = abs(intermediateValue42);
                            float intermediateValue214;
                            float comparisonValue40;
                            float intermediateValue215;
                            if ((intermediateValue188 >= intermediateValue189) && (intermediateValue188 >= intermediateValue190))
                            {
                                intermediateValue214 = intermediateValue188;
                                comparisonValue40 = (intermediateValue38 < 0.0) ? sumValue80 : intermediateValue42;
                                intermediateValue215 = sumValue79;
                            }
                            else
                            {
                                float branchMergedValue29;
                                float branchMergedValue46;
                                float branchMergedValue47;
                                if (!(intermediateValue189 >= intermediateValue190))
                                {
                                    branchMergedValue29 = intermediateValue190;
                                    branchMergedValue46 = (intermediateValue42 < 0.0) ? intermediateValue38 : sumValue78;
                                    branchMergedValue47 = sumValue79;
                                }
                                else
                                {
                                    branchMergedValue29 = intermediateValue189;
                                    branchMergedValue46 = sumValue78;
                                    branchMergedValue47 = (intermediateValue40 < 0.0) ? sumValue80 : intermediateValue42;
                                }
                                intermediateValue214 = branchMergedValue29;
                                comparisonValue40 = branchMergedValue46;
                                intermediateValue215 = branchMergedValue47;
                            }
                            precise float quotientValue9 = 0.5 / intermediateValue214;
                            vec4 sampledTextureValue2 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits11 + 0u], linearSampler)), vec2(fract(fma(comparisonValue40, quotientValue9, 0.5) * ViewCB.packedValues[74u].x), fract(fma(intermediateValue215, quotientValue9, 0.5) * ViewCB.packedValues[74u].y)), 0.0);
                            branchMergedValue28 = (ViewCB.packedValues[58u].y * sampledTextureValue2.y) * ViewCB.packedValues[97u].w;
                            branchMergedValue44 = (ViewCB.packedValues[58u].x * sampledTextureValue2.x) * ViewCB.packedValues[97u].w;
                            branchMergedValue45 = (ViewCB.packedValues[58u].z * sampledTextureValue2.z) * ViewCB.packedValues[97u].w;
                        }
                        else
                        {
                            float branchMergedValue90;
                            float branchMergedValue92;
                            float branchMergedValue93;
                            if (intermediateValue138 == 4u)
                            {
                                float intermediateValue191 = (dot(vec3(intermediateValue38, intermediateValue40, intermediateValue42), vec3(ViewCB.packedValues[52u].xyz)) * 0.5) + 0.5;
                                branchMergedValue90 = ((ViewCB.packedValues[75u].y - ViewCB.packedValues[76u].y) * intermediateValue191) + ViewCB.packedValues[76u].y;
                                branchMergedValue92 = ((ViewCB.packedValues[75u].x - ViewCB.packedValues[76u].x) * intermediateValue191) + ViewCB.packedValues[76u].x;
                                branchMergedValue93 = ((ViewCB.packedValues[75u].z - ViewCB.packedValues[76u].z) * intermediateValue191) + ViewCB.packedValues[76u].z;
                            }
                            else
                            {
                                float comparisonValue39;
                                if (abs(intermediateValue40) < 1.0)
                                {
                                    float quotientValue8 = atan(intermediateValue42 / intermediateValue38);
                                    bool intermediateValue196 = intermediateValue38 < 0.0;
                                    bool comparisonValue37 = intermediateValue38 == 0.0;
                                    bool comparisonValue38 = intermediateValue42 >= 0.0;
                                    bool intermediateValue197 = intermediateValue42 < 0.0;
                                    comparisonValue39 = (comparisonValue37 && comparisonValue38) ? 1.57079637050628662109375 : ((comparisonValue37 && intermediateValue197) ? (-1.57079637050628662109375) : ((intermediateValue196 && intermediateValue197) ? (quotientValue8 + (-3.1415927410125732421875)) : ((intermediateValue196 && comparisonValue38) ? (quotientValue8 + 3.1415927410125732421875) : quotientValue8)));
                                }
                                else
                                {
                                    comparisonValue39 = 0.0;
                                }
                                float multiplyAddValue12 = fma(abs((fract((comparisonValue39 - ViewCB.packedValues[50u].w) * 0.15915493667125701904296875) * 2.0) + (-1.0)), 0.984375, 0.0078125);
                                float multiplyAddValue13 = fma(0.5 - (asin(intermediateValue40) * 0.3183098733425140380859375), 0.96875, 0.015625);
                                float productValue189 = ViewCB.packedValues[51u].w * 7.0;
                                float intermediateValue198 = fract(productValue189);
                                uint intermediateValue199 = uint(int(floor(productValue189)));
                                float productValue190 = float(int(intermediateValue199 + 1u)) * 0.125;
                                float intermediateValue200 = fract(abs(productValue190));
                                vec4 sampledTextureValue = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue12, multiplyAddValue13, float(int(intermediateValue199))), 0.0);
                                float intermediateValue201 = sampledTextureValue.x;
                                float intermediateValue202 = sampledTextureValue.y;
                                float intermediateValue203 = sampledTextureValue.z;
                                float productValue191 = intermediateValue201 * intermediateValue201;
                                float productValue192 = intermediateValue202 * intermediateValue202;
                                float productValue193 = intermediateValue203 * intermediateValue203;
                                vec4 sampledTextureValue1 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue12, multiplyAddValue13, float(int(uint(int(((productValue190 >= ((-0.0) - productValue190)) ? intermediateValue200 : ((-0.0) - intermediateValue200)) * 8.0))))), 0.0);
                                float intermediateValue204 = sampledTextureValue1.x;
                                float intermediateValue205 = sampledTextureValue1.y;
                                float intermediateValue206 = sampledTextureValue1.z;
                                float dotProductValue15 = exp2(log2(spvNMax(dot(vec3(intermediateValue38, intermediateValue40, intermediateValue42), vec3(ViewCB.packedValues[52u].xyz)), 0.0)) * 7.0);
                                float productValue194 = dotProductValue15 * 0.0500000007450580596923828125;
                                float productValue195 = ((((intermediateValue204 * intermediateValue204) - productValue191) * intermediateValue198) + productValue191) + (productValue194 * ViewCB.packedValues[50u].x);
                                float productValue196 = ((((intermediateValue205 * intermediateValue205) - productValue192) * intermediateValue198) + productValue192) + (productValue194 * ViewCB.packedValues[50u].y);
                                float productValue197 = ((((intermediateValue206 * intermediateValue206) - productValue193) * intermediateValue198) + productValue193) + (productValue194 * ViewCB.packedValues[50u].z);
                                float productValue198 = (dotProductValue15 * 0.64999997615814208984375) + 0.3499999940395355224609375;
                                branchMergedValue90 = ((((ViewCB.packedValues[58u].y * productValue198) - productValue196) * ViewCB.packedValues[58u].w) + productValue196) * ViewCB.packedValues[97u].w;
                                branchMergedValue92 = ((((ViewCB.packedValues[58u].x * productValue198) - productValue195) * ViewCB.packedValues[58u].w) + productValue195) * ViewCB.packedValues[97u].w;
                                branchMergedValue93 = ((((ViewCB.packedValues[58u].z * productValue198) - productValue197) * ViewCB.packedValues[58u].w) + productValue197) * ViewCB.packedValues[97u].w;
                            }
                            branchMergedValue28 = branchMergedValue90;
                            branchMergedValue44 = branchMergedValue92;
                            branchMergedValue45 = branchMergedValue93;
                        }
                        intermediateValue176 = branchMergedValue44;
                        intermediateValue177 = branchMergedValue28;
                        intermediateValue178 = branchMergedValue45;
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
                    productValue167 = (intermediateValue176 + (((ViewCB.packedValues[50u].x * dotProductValue8) * ViewCB.packedValues[61u].x) * exp2(ViewCB.packedValues[62u].x * (-72.1347503662109375)))) * comparisonValue23;
                    productValue168 = (intermediateValue177 + (((ViewCB.packedValues[50u].y * dotProductValue8) * ViewCB.packedValues[61u].y) * exp2(ViewCB.packedValues[62u].y * (-72.1347503662109375)))) * comparisonValue24;
                    productValue169 = (intermediateValue178 + (((ViewCB.packedValues[50u].z * dotProductValue8) * ViewCB.packedValues[61u].z) * exp2(ViewCB.packedValues[62u].z * (-72.1347503662109375)))) * comparisonValue25;
                }
                branchMergedValue = intermediateValue65;
                branchMergedValue5 = (ViewCB.packedValues[59u].z * comparisonValue25) + productValue169;
                branchMergedValue6 = (ViewCB.packedValues[59u].y * comparisonValue24) + productValue168;
                branchMergedValue7 = (ViewCB.packedValues[59u].x * comparisonValue23) + productValue167;
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
                branchMergedValue5 = 0.0;
                branchMergedValue6 = 0.0;
                branchMergedValue7 = 0.0;
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
            uint sumValue44 = intermediateValue51 + 1u;
            if (sumValue44 == 4u)
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
                intermediateValue51 = sumValue44;
                continue;
            }
        }
        uint sumValue55 = objectInstances_2.packedValues[productValue5] + sumValue2;
        precise float productValue74 = sumValue21 * sumValue21;
        precise float productValue75 = sumValue24 * sumValue24;
        precise float sumValue56 = productValue74 + productValue75;
        precise float productValue76 = sumValue27 * sumValue27;
        precise float sumValue57 = sumValue56 + productValue76;
        precise float sumValue58 = ViewCB.packedValues[97u].y + 10.0;
        precise float sumValue59 = ViewCB.packedValues[97u].y + (-10.0);
        precise float sumValue60 = sumValue58 - sumValue59;
        precise float nonlinearValue2 = sqrt(sumValue57) - sumValue59;
        precise float quotientValue = nonlinearValue2 / sumValue60;
        float intermediateValue73 = spvNClamp(quotientValue, 0.0, 1.0);
        precise float productValue77 = intermediateValue73 * 2.0;
        precise float sumValue61 = 3.0 - productValue77;
        precise float productValue78 = intermediateValue73 * sumValue61;
        precise float productValue79 = intermediateValue73 * productValue78;
        precise float sumValue62 = 1.0 - productValue79;
        float intermediateValue86;
        float intermediateValue87;
        float intermediateValue88;
        float intermediateValue89;
        float intermediateValue90;
        float intermediateValue91;
        float intermediateValue92;
        if (sumValue62 > 0.0)
        {
            uvec4 reinterpretedBits4 = floatBitsToUint(ViewCB.packedValues[92u]);
            uint intermediateValue85 = reinterpretedBits4.w;
            float intermediateValue115;
            float intermediateValue116;
            float intermediateValue117;
            uint intermediateValue118;
            float intermediateValue120;
            float intermediateValue121;
            float intermediateValue122;
            if (intermediateValue85 == 0u)
            {
                intermediateValue115 = 0.0;
                intermediateValue116 = 0.0;
                intermediateValue117 = 0.0;
                intermediateValue118 = 0u;
                intermediateValue120 = 0.0;
                intermediateValue121 = 0.0;
                intermediateValue122 = 0.0;
            }
            else
            {
                uint intermediateValue[8];
                intermediateValue[0u] = 0u;
                uint sumValue67 = intermediateValue85 + 4294967295u;
                uint productValue95 = (intermediateValue44 * 1664525u) + 1013904223u;
                precise float bitwiseValue18 = float(productValue95 & 16777215u) * 5.9604644775390625e-08;
                float intermediateValue123 = float(int(intermediateValue85));
                precise float productValue96 = bitwiseValue18 * intermediateValue123;
                uint intermediateValue124 = uint(min(int(uint(int(productValue96))), int(sumValue67)));
                f16vec3 productValue97 = uint16BitsToFloat16(inputLightsBuffer.packedValues[intermediateValue124 * 2u]);
                precise float sumValue68 = float(productValue97.x) - sumValue21;
                precise float sumValue69 = float(productValue97.y) - sumValue24;
                precise float sumValue70 = float(productValue97.z) - sumValue27;
                precise float dotProductValue7 = 1.0 / dot(vec3(sumValue68, sumValue69, sumValue70), vec3(sumValue68, sumValue69, sumValue70));
                float intermediateValue140;
                uint intermediateValue141;
                float intermediateValue142;
                if (dotProductValue7 > 0.0)
                {
                    intermediateValue[0u] = intermediateValue124;
                    intermediateValue140 = dotProductValue7;
                    intermediateValue141 = 1u;
                    intermediateValue142 = dotProductValue7;
                }
                else
                {
                    intermediateValue140 = -1.0;
                    intermediateValue141 = 0u;
                    intermediateValue142 = 0.0;
                }
                intermediateValue[1u] = 0u;
                uint productValue114 = (productValue95 * 1664525u) + 1013904223u;
                precise float bitwiseValue28 = float(productValue114 & 16777215u) * 5.9604644775390625e-08;
                precise float productValue115 = bitwiseValue28 * intermediateValue123;
                uint intermediateValue143 = uint(min(int(uint(int(productValue115))), int(sumValue67)));
                f16vec3 productValue116 = uint16BitsToFloat16(inputLightsBuffer.packedValues[intermediateValue143 * 2u]);
                precise float sumValue81 = float(productValue116.x) - sumValue21;
                precise float sumValue82 = float(productValue116.y) - sumValue24;
                precise float sumValue83 = float(productValue116.z) - sumValue27;
                precise float dotProductValue10 = 1.0 / dot(vec3(sumValue81, sumValue82, sumValue83), vec3(sumValue81, sumValue82, sumValue83));
                float intermediateValue158;
                uint sumValue99;
                float intermediateValue159;
                if (dotProductValue10 > 0.0)
                {
                    float sumValue98 = dotProductValue10 + intermediateValue142;
                    intermediateValue[1u] = intermediateValue143;
                    intermediateValue158 = sumValue98;
                    sumValue99 = intermediateValue141 + 1u;
                    intermediateValue159 = sumValue98;
                }
                else
                {
                    intermediateValue158 = -1.0;
                    sumValue99 = intermediateValue141;
                    intermediateValue159 = intermediateValue142;
                }
                intermediateValue[2u] = 0u;
                uint productValue130 = (productValue114 * 1664525u) + 1013904223u;
                precise float bitwiseValue44 = float(productValue130 & 16777215u) * 5.9604644775390625e-08;
                precise float productValue131 = bitwiseValue44 * intermediateValue123;
                uint intermediateValue160 = uint(min(int(uint(int(productValue131))), int(sumValue67)));
                f16vec3 productValue132 = uint16BitsToFloat16(inputLightsBuffer.packedValues[intermediateValue160 * 2u]);
                precise float sumValue100 = float(productValue132.x) - sumValue21;
                precise float sumValue101 = float(productValue132.y) - sumValue24;
                precise float sumValue102 = float(productValue132.z) - sumValue27;
                precise float dotProductValue12 = 1.0 / dot(vec3(sumValue100, sumValue101, sumValue102), vec3(sumValue100, sumValue101, sumValue102));
                float intermediateValue181;
                uint sumValue116;
                float intermediateValue182;
                if (dotProductValue12 > 0.0)
                {
                    float sumValue115 = dotProductValue12 + intermediateValue159;
                    intermediateValue[2u] = intermediateValue160;
                    intermediateValue181 = sumValue115;
                    sumValue116 = sumValue99 + 1u;
                    intermediateValue182 = sumValue115;
                }
                else
                {
                    intermediateValue181 = -1.0;
                    sumValue116 = sumValue99;
                    intermediateValue182 = intermediateValue159;
                }
                intermediateValue[3u] = 0u;
                uint productValue160 = (productValue130 * 1664525u) + 1013904223u;
                precise float bitwiseValue60 = float(productValue160 & 16777215u) * 5.9604644775390625e-08;
                precise float productValue161 = bitwiseValue60 * intermediateValue123;
                uint intermediateValue183 = uint(min(int(uint(int(productValue161))), int(sumValue67)));
                f16vec3 productValue162 = uint16BitsToFloat16(inputLightsBuffer.packedValues[intermediateValue183 * 2u]);
                precise float sumValue117 = float(productValue162.x) - sumValue21;
                precise float sumValue118 = float(productValue162.y) - sumValue24;
                precise float sumValue119 = float(productValue162.z) - sumValue27;
                precise float dotProductValue13 = 1.0 / dot(vec3(sumValue117, sumValue118, sumValue119), vec3(sumValue117, sumValue118, sumValue119));
                float intermediateValue192;
                uint sumValue125;
                float intermediateValue193;
                if (dotProductValue13 > 0.0)
                {
                    float sumValue124 = dotProductValue13 + intermediateValue182;
                    intermediateValue[3u] = intermediateValue183;
                    intermediateValue192 = sumValue124;
                    sumValue125 = sumValue116 + 1u;
                    intermediateValue193 = sumValue124;
                }
                else
                {
                    intermediateValue192 = -1.0;
                    sumValue125 = sumValue116;
                    intermediateValue193 = intermediateValue182;
                }
                intermediateValue[4u] = 0u;
                uint productValue170 = (productValue160 * 1664525u) + 1013904223u;
                precise float bitwiseValue63 = float(productValue170 & 16777215u) * 5.9604644775390625e-08;
                precise float productValue171 = bitwiseValue63 * intermediateValue123;
                uint intermediateValue194 = uint(min(int(uint(int(productValue171))), int(sumValue67)));
                f16vec3 productValue172 = uint16BitsToFloat16(inputLightsBuffer.packedValues[intermediateValue194 * 2u]);
                precise float sumValue126 = float(productValue172.x) - sumValue21;
                precise float sumValue127 = float(productValue172.y) - sumValue24;
                precise float sumValue128 = float(productValue172.z) - sumValue27;
                precise float dotProductValue14 = 1.0 / dot(vec3(sumValue126, sumValue127, sumValue128), vec3(sumValue126, sumValue127, sumValue128));
                float intermediateValue207;
                uint sumValue146;
                float intermediateValue208;
                if (dotProductValue14 > 0.0)
                {
                    float sumValue145 = dotProductValue14 + intermediateValue193;
                    intermediateValue[4u] = intermediateValue194;
                    intermediateValue207 = sumValue145;
                    sumValue146 = sumValue125 + 1u;
                    intermediateValue208 = sumValue145;
                }
                else
                {
                    intermediateValue207 = -1.0;
                    sumValue146 = sumValue125;
                    intermediateValue208 = intermediateValue193;
                }
                intermediateValue[5u] = 0u;
                uint productValue199 = (productValue170 * 1664525u) + 1013904223u;
                precise float bitwiseValue81 = float(productValue199 & 16777215u) * 5.9604644775390625e-08;
                precise float productValue200 = bitwiseValue81 * intermediateValue123;
                uint intermediateValue209 = uint(min(int(uint(int(productValue200))), int(sumValue67)));
                f16vec3 productValue201 = uint16BitsToFloat16(inputLightsBuffer.packedValues[intermediateValue209 * 2u]);
                precise float sumValue147 = float(productValue201.x) - sumValue21;
                precise float sumValue148 = float(productValue201.y) - sumValue24;
                precise float sumValue149 = float(productValue201.z) - sumValue27;
                precise float dotProductValue16 = 1.0 / dot(vec3(sumValue147, sumValue148, sumValue149), vec3(sumValue147, sumValue148, sumValue149));
                float intermediateValue216;
                uint sumValue155;
                float intermediateValue217;
                if (dotProductValue16 > 0.0)
                {
                    float sumValue154 = dotProductValue16 + intermediateValue208;
                    intermediateValue[5u] = intermediateValue209;
                    intermediateValue216 = sumValue154;
                    sumValue155 = sumValue146 + 1u;
                    intermediateValue217 = sumValue154;
                }
                else
                {
                    intermediateValue216 = -1.0;
                    sumValue155 = sumValue146;
                    intermediateValue217 = intermediateValue208;
                }
                intermediateValue[6u] = 0u;
                uint productValue206 = (productValue199 * 1664525u) + 1013904223u;
                precise float bitwiseValue83 = float(productValue206 & 16777215u) * 5.9604644775390625e-08;
                precise float productValue207 = bitwiseValue83 * intermediateValue123;
                uint intermediateValue218 = uint(min(int(uint(int(productValue207))), int(sumValue67)));
                f16vec3 productValue208 = uint16BitsToFloat16(inputLightsBuffer.packedValues[intermediateValue218 * 2u]);
                precise float sumValue156 = float(productValue208.x) - sumValue21;
                precise float sumValue157 = float(productValue208.y) - sumValue24;
                precise float sumValue158 = float(productValue208.z) - sumValue27;
                precise float dotProductValue17 = 1.0 / dot(vec3(sumValue156, sumValue157, sumValue158), vec3(sumValue156, sumValue157, sumValue158));
                float intermediateValue220;
                uint sumValue170;
                float intermediateValue221;
                if (dotProductValue17 > 0.0)
                {
                    float sumValue169 = dotProductValue17 + intermediateValue217;
                    intermediateValue[6u] = intermediateValue218;
                    intermediateValue220 = sumValue169;
                    sumValue170 = sumValue155 + 1u;
                    intermediateValue221 = sumValue169;
                }
                else
                {
                    intermediateValue220 = -1.0;
                    sumValue170 = sumValue155;
                    intermediateValue221 = intermediateValue217;
                }
                intermediateValue[7u] = 0u;
                uint productValue219 = (productValue206 * 1664525u) + 1013904223u;
                precise float bitwiseValue96 = float(productValue219 & 16777215u) * 5.9604644775390625e-08;
                precise float productValue220 = bitwiseValue96 * intermediateValue123;
                uint intermediateValue222 = uint(min(int(uint(int(productValue220))), int(sumValue67)));
                f16vec3 productValue221 = uint16BitsToFloat16(inputLightsBuffer.packedValues[intermediateValue222 * 2u]);
                precise float sumValue171 = float(productValue221.x) - sumValue21;
                precise float sumValue172 = float(productValue221.y) - sumValue24;
                precise float sumValue173 = float(productValue221.z) - sumValue27;
                precise float dotProductValue18 = 1.0 / dot(vec3(sumValue171, sumValue172, sumValue173), vec3(sumValue171, sumValue172, sumValue173));
                float intermediateValue225;
                uint sumValue177;
                float intermediateValue226;
                if (dotProductValue18 > 0.0)
                {
                    float sumValue176 = dotProductValue18 + intermediateValue221;
                    intermediateValue[7u] = intermediateValue222;
                    intermediateValue225 = sumValue176;
                    sumValue177 = sumValue170 + 1u;
                    intermediateValue226 = sumValue176;
                }
                else
                {
                    intermediateValue225 = -1.0;
                    sumValue177 = sumValue170;
                    intermediateValue226 = intermediateValue221;
                }
                bool comparisonValue42 = sumValue177 == 0u;
                float intermediateValue231;
                uint intermediateValue232;
                float16_t intermediateValue233;
                float16_t intermediateValue235;
                float16_t intermediateValue237;
                uint intermediateValue239;
                if (comparisonValue42)
                {
                    intermediateValue231 = intermediateValue13;
                    intermediateValue232 = 0u;
                    intermediateValue233 = float16_t(0.0);
                    intermediateValue235 = float16_t(0.0);
                    intermediateValue237 = float16_t(0.0);
                    intermediateValue239 = productValue219;
                }
                else
                {
                    uint intermediateValue265;
                    uint productValue253;
                    float bitwiseValue104;
                    bool intermediateValue240;
                    for (;;)
                    {
                        productValue253 = (productValue219 * 1664525u) + 1013904223u;
                        bitwiseValue104 = (float(productValue253 & 16777215u) * 5.9604584379258085391484200954437e-08) * intermediateValue226;
                        intermediateValue240 = intermediateValue140 > bitwiseValue104;
                        uint intermediateValue249;
                        if (intermediateValue240)
                        {
                            intermediateValue249 = 0u;
                        }
                        else
                        {
                            uint branchMergedValue32;
                            if (intermediateValue158 > bitwiseValue104)
                            {
                                branchMergedValue32 = 1u;
                            }
                            else
                            {
                                uint branchMergedValue94;
                                if (intermediateValue181 > bitwiseValue104)
                                {
                                    branchMergedValue94 = 2u;
                                }
                                else
                                {
                                    uint branchMergedValue104;
                                    if (intermediateValue192 > bitwiseValue104)
                                    {
                                        branchMergedValue104 = 3u;
                                    }
                                    else
                                    {
                                        uint branchMergedValue105;
                                        if (intermediateValue207 > bitwiseValue104)
                                        {
                                            branchMergedValue105 = 4u;
                                        }
                                        else
                                        {
                                            uint branchMergedValue106;
                                            if (intermediateValue216 > bitwiseValue104)
                                            {
                                                branchMergedValue106 = 5u;
                                            }
                                            else
                                            {
                                                uint branchMergedValue107;
                                                if (intermediateValue220 > bitwiseValue104)
                                                {
                                                    branchMergedValue107 = 6u;
                                                }
                                                else
                                                {
                                                    if (!(intermediateValue225 > bitwiseValue104))
                                                    {
                                                        intermediateValue265 = 0u;
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
                            intermediateValue249 = branchMergedValue32;
                        }
                        intermediateValue265 = intermediateValue[intermediateValue249];
                        break;
                    }
                    f16vec3 productValue272 = uint16BitsToFloat16(inputLightsBuffer.packedValues[intermediateValue265 * 2u]);
                    float16_t intermediateValue234 = productValue272.x;
                    float16_t intermediateValue236 = productValue272.y;
                    float16_t intermediateValue238 = productValue272.z;
                    float sumValue211 = float(intermediateValue234) - sumValue21;
                    float sumValue212 = float(intermediateValue236) - sumValue24;
                    float sumValue213 = float(intermediateValue238) - sumValue27;
                    intermediateValue231 = 1.0 / (ViewCB.packedValues[96u].z * dot(vec3(sumValue211, sumValue212, sumValue213), vec3(sumValue211, sumValue212, sumValue213)));
                    intermediateValue232 = inputLightsBuffer_2.packedValues[(intermediateValue265 * 3u) + 2u];
                    intermediateValue233 = intermediateValue234;
                    intermediateValue235 = intermediateValue236;
                    intermediateValue237 = intermediateValue238;
                    intermediateValue239 = productValue253;
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
                    branchMergedValue30 = 0.0;
                    branchMergedValue48 = 0.0;
                    branchMergedValue49 = 0.0;
                    branchMergedValue50 = 0u;
                    branchMergedValue51 = 0.0;
                    branchMergedValue52 = 0.0;
                    branchMergedValue53 = 0.0;
                }
                else
                {
                    float comparisonValue46 = (int(intermediateValue232) < int(0u)) ? 0.23000000417232513427734375 : 0.115000002086162567138671875;
                    float bitwiseValue105 = float(((intermediateValue239 * 1664525u) + 7271263u) & 16777215u);
                    float productValue260 = bitwiseValue105 * 0.002414158545434474945068359375;
                    float productValue261 = (productValue260 - floor(productValue260)) * 6.283185482025146484375;
                    float productValue262 = 0.9999847412109375 - (bitwiseValue105 * 1.1920928955078125e-07);
                    float nonlinearValue3 = sqrt(spvNClamp(1.0 - (productValue262 * productValue262), 0.0, 1.0)) * comparisonValue46;
                    float wavePhaseValue2 = nonlinearValue3 * cos(productValue261);
                    float wavePhaseValue3 = sin(productValue261) * nonlinearValue3;
                    float productValue263 = productValue262 * comparisonValue46;
                    bool dotProductValue20 = dot(vec3(wavePhaseValue2, wavePhaseValue3, productValue263), vec3(float(intermediateValue233) - sumValue21, float(intermediateValue235) - sumValue24, float(intermediateValue237) - sumValue27)) > 0.0;
                    float comparisonValue47 = float(float16_t(dotProductValue20 ? ((-0.0) - wavePhaseValue2) : wavePhaseValue2) + intermediateValue233) - sumValue21;
                    float comparisonValue48 = float(float16_t(dotProductValue20 ? ((-0.0) - wavePhaseValue3) : wavePhaseValue3) + intermediateValue235) - sumValue24;
                    float comparisonValue49 = float(float16_t(dotProductValue20 ? ((-0.0) - productValue263) : productValue263) + intermediateValue237) - sumValue27;
                    float inverseLengthValue4 = inversesqrt(dot(vec3(comparisonValue47, comparisonValue48, comparisonValue49), vec3(comparisonValue47, comparisonValue48, comparisonValue49)));
                    float productValue92 = comparisonValue47 * inverseLengthValue4;
                    float productValue93 = comparisonValue48 * inverseLengthValue4;
                    float productValue94 = comparisonValue49 * inverseLengthValue4;
                    uint productValue264 = uint(int(productValue41 * 256.0));
                    uint productValue265 = uint(int(productValue42 * 256.0));
                    uint productValue266 = uint(int(productValue43 * 256.0));
                    rayQueryInitializeEXT(intermediateValue247, SceneBVH, 512u, 2u, vec3((abs(sumValue21) < 0.03125) ? ((productValue41 * 1.52587890625e-05) + sumValue21) : uintBitsToFloat(((sumValue21 < 0.0) ? (-productValue264) : productValue264) + floatBitsToUint(sumValue21)), (abs(sumValue24) < 0.03125) ? ((productValue42 * 1.52587890625e-05) + sumValue24) : uintBitsToFloat(((sumValue24 < 0.0) ? (-productValue265) : productValue265) + floatBitsToUint(sumValue24)), (abs(sumValue27) < 0.03125) ? ((productValue43 * 1.52587890625e-05) + sumValue27) : uintBitsToFloat(((sumValue27 < 0.0) ? (-productValue266) : productValue266) + floatBitsToUint(sumValue27))), 0.00999999977648258209228515625, vec3(productValue92, productValue93, productValue94), sqrt(((comparisonValue47 * comparisonValue47) + (comparisonValue48 * comparisonValue48)) + (comparisonValue49 * comparisonValue49)) + (-0.00999999977648258209228515625));
                    bool intermediateValue248 = rayQueryProceedEXT(intermediateValue247);
                    if (intermediateValue248)
                    {
                        bool intermediateValue288;
                        bool comparisonValue53;
                        for (;;)
                        {
                            uint intermediateValue269 = rayQueryGetIntersectionTypeEXT(intermediateValue247, bool(0u));
                            comparisonValue53 = intermediateValue269 == 0u;
                            if (comparisonValue53)
                            {
                                vec2 intermediateValue282 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue247, bool(0u));
                                vec2 intermediateValue283 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue247, bool(0u));
                                uint intermediateValue284 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue247, bool(0u));
                                uint intermediateValue285 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue247, bool(0u));
                                uint intermediateValue286 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue247, bool(0u));
                                uint productValue276 = (intermediateValue286 * 76u) + 58u;
                                uint productValue277 = (intermediateValue286 * 76u) + 61u;
                                precise float sumValue215 = 1.0 - intermediateValue282.x;
                                precise float sumValue216 = sumValue215 - intermediateValue283.y;
                                uint bitwiseValue106 = (objectInstances_2.packedValues[(intermediateValue286 * 38u) + 25u] >> 2u) + (intermediateValue284 >> 1u);
                                uint productValue278 = uint(objectInstances.packedValues[(intermediateValue286 * 76u) + 54u]) + 0u;
                                bool comparisonValue55 = (intermediateValue284 & 1u) == 0u;
                                uint comparisonValue56 = comparisonValue55 ? faceUvBuffersRW[nonuniformEXT(productValue278)].packedValues[bitwiseValue106].z : faceUvBuffersRW[nonuniformEXT(productValue278)].packedValues[bitwiseValue106].x;
                                uint comparisonValue57 = comparisonValue55 ? faceUvBuffersRW[nonuniformEXT(productValue278)].packedValues[bitwiseValue106].y : faceUvBuffersRW[nonuniformEXT(productValue278)].packedValues[bitwiseValue106].w;
                                uint comparisonValue58 = comparisonValue55 ? faceUvBuffersRW[nonuniformEXT(productValue278)].packedValues[bitwiseValue106].x : faceUvBuffersRW[nonuniformEXT(productValue278)].packedValues[bitwiseValue106].z;
                                bool intermediateValue287 = int16_t(objectInstances.packedValues[productValue277]) < int16_t(0us);
                                float intermediateValue321;
                                float intermediateValue322;
                                if (intermediateValue287)
                                {
                                    uint bitwiseValue109 = comparisonValue58 >> 15u;
                                    precise float bitwiseValue110 = float(bitwiseValue109 & 1u) * 2.0;
                                    precise float sumValue235 = bitwiseValue110 + (-1.0);
                                    precise float bitwiseValue111 = float(comparisonValue58 >> 31u) * 2.0;
                                    precise float sumValue236 = bitwiseValue111 + (-1.0);
                                    precise float bitwiseValue112 = float((comparisonValue58 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue113 = float(bitwiseValue109 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue302 = sumValue235 * 3.0517578125e-05;
                                    precise float productValue303 = sumValue236 * 3.0517578125e-05;
                                    precise float sumValue237 = bitwiseValue112 + productValue302;
                                    precise float sumValue238 = bitwiseValue113 + productValue303;
                                    intermediateValue321 = sumValue237;
                                    intermediateValue322 = sumValue238;
                                }
                                else
                                {
                                    precise float bitwiseValue114 = float(comparisonValue58 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue115 = float(comparisonValue58 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue304 = bitwiseValue114 * 16384.0;
                                    precise float sumValue239 = productValue304 + 0.5;
                                    precise float productValue305 = bitwiseValue115 * 16384.0;
                                    precise float sumValue240 = productValue305 + 0.5;
                                    precise float productValue306 = floor(sumValue239) * 6.103515625e-05;
                                    precise float productValue307 = floor(sumValue240) * 6.103515625e-05;
                                    intermediateValue321 = productValue306;
                                    intermediateValue322 = productValue307;
                                }
                                precise float productValue318 = sumValue216 * intermediateValue321;
                                precise float productValue319 = sumValue216 * intermediateValue322;
                                precise float sumValue253 = productValue318 + 0.0;
                                precise float sumValue254 = productValue319 + 0.0;
                                float intermediateValue368;
                                float intermediateValue369;
                                if (intermediateValue287)
                                {
                                    uint bitwiseValue123 = comparisonValue57 >> 15u;
                                    precise float bitwiseValue124 = float(bitwiseValue123 & 1u) * 2.0;
                                    precise float sumValue257 = bitwiseValue124 + (-1.0);
                                    precise float bitwiseValue125 = float(comparisonValue57 >> 31u) * 2.0;
                                    precise float sumValue258 = bitwiseValue125 + (-1.0);
                                    precise float bitwiseValue126 = float((comparisonValue57 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue127 = float(bitwiseValue123 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue322 = sumValue257 * 3.0517578125e-05;
                                    precise float productValue323 = sumValue258 * 3.0517578125e-05;
                                    precise float sumValue259 = bitwiseValue126 + productValue322;
                                    precise float sumValue260 = bitwiseValue127 + productValue323;
                                    intermediateValue368 = sumValue259;
                                    intermediateValue369 = sumValue260;
                                }
                                else
                                {
                                    precise float bitwiseValue128 = float(comparisonValue57 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue129 = float(comparisonValue57 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue324 = bitwiseValue128 * 16384.0;
                                    precise float sumValue261 = productValue324 + 0.5;
                                    precise float productValue325 = bitwiseValue129 * 16384.0;
                                    precise float sumValue262 = productValue325 + 0.5;
                                    precise float productValue326 = floor(sumValue261) * 6.103515625e-05;
                                    precise float productValue327 = floor(sumValue262) * 6.103515625e-05;
                                    intermediateValue368 = productValue326;
                                    intermediateValue369 = productValue327;
                                }
                                precise float productValue340 = intermediateValue282.x * intermediateValue368;
                                precise float productValue341 = intermediateValue282.x * intermediateValue369;
                                precise float sumValue273 = sumValue253 + productValue340;
                                precise float sumValue274 = sumValue254 + productValue341;
                                float intermediateValue391;
                                float intermediateValue392;
                                if (intermediateValue287)
                                {
                                    uint bitwiseValue156 = comparisonValue56 >> 15u;
                                    precise float bitwiseValue157 = float(bitwiseValue156 & 1u) * 2.0;
                                    precise float sumValue289 = bitwiseValue157 + (-1.0);
                                    precise float bitwiseValue158 = float(comparisonValue56 >> 31u) * 2.0;
                                    precise float sumValue290 = bitwiseValue158 + (-1.0);
                                    precise float bitwiseValue159 = float((comparisonValue56 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue160 = float(bitwiseValue156 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue356 = sumValue289 * 3.0517578125e-05;
                                    precise float productValue357 = sumValue290 * 3.0517578125e-05;
                                    precise float sumValue291 = bitwiseValue159 + productValue356;
                                    precise float sumValue292 = bitwiseValue160 + productValue357;
                                    intermediateValue391 = sumValue291;
                                    intermediateValue392 = sumValue292;
                                }
                                else
                                {
                                    precise float bitwiseValue161 = float(comparisonValue56 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue162 = float(comparisonValue56 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue358 = bitwiseValue161 * 16384.0;
                                    precise float sumValue293 = productValue358 + 0.5;
                                    precise float productValue359 = bitwiseValue162 * 16384.0;
                                    precise float sumValue294 = productValue359 + 0.5;
                                    precise float productValue360 = floor(sumValue293) * 6.103515625e-05;
                                    precise float productValue361 = floor(sumValue294) * 6.103515625e-05;
                                    intermediateValue391 = productValue360;
                                    intermediateValue392 = productValue361;
                                }
                                precise float productValue376 = intermediateValue283.y * intermediateValue391;
                                precise float productValue377 = intermediateValue283.y * intermediateValue392;
                                precise float sumValue307 = sumValue273 + productValue376;
                                precise float sumValue308 = sumValue274 + productValue377;
                                float intermediateValue395;
                                if (objectInstances.packedValues[productValue276] == 65535us)
                                {
                                    intermediateValue395 = 1.0;
                                }
                                else
                                {
                                    uint reinterpretedBits23;
                                    if (objectInstances.packedValues[productValue276] > 4095us)
                                    {
                                        reinterpretedBits23 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits23 = uint(objectInstances.packedValues[productValue276]);
                                    }
                                    intermediateValue395 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits23 + 0u], defaultSampler)), vec2(sumValue307, sumValue308), -0.25).w;
                                }
                                uint comparisonValue82;
                                if (intermediateValue285 == 2u)
                                {
                                    comparisonValue82 = 0u;
                                }
                                else
                                {
                                    comparisonValue82 = uint(intermediateValue395 <= (((objectInstances.packedValues[productValue277] & 4352us) != 0us) ? 0.5 : 0.0));
                                }
                                if (comparisonValue82 == 0u)
                                {
                                    rayQueryConfirmIntersectionEXT(intermediateValue247);
                                }
                            }
                            intermediateValue288 = rayQueryProceedEXT(intermediateValue247);
                            if (intermediateValue288)
                            {
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                    uint intermediateValue264 = rayQueryGetIntersectionTypeEXT(intermediateValue247, bool(1u));
                    bool intermediateValue271;
                    if (intermediateValue264 == 1u)
                    {
                        float intermediateValue270 = rayQueryGetIntersectionTEXT(intermediateValue247, bool(1u));
                        intermediateValue271 = !(intermediateValue270 < 10000.0);
                    }
                    else
                    {
                        intermediateValue271 = true;
                    }
                    uint intermediateValue119 = uint(intermediateValue271);
                    float branchMergedValue91;
                    float branchMergedValue96;
                    float branchMergedValue97;
                    uint branchMergedValue98;
                    float branchMergedValue99;
                    float branchMergedValue100;
                    float branchMergedValue101;
                    if (intermediateValue271)
                    {
                        float bitwiseValue107 = (intermediateValue231 * 0.0392156876623630523681640625) * float(intermediateValue232 & 255u);
                        float productValue279 = bitwiseValue107 * 0.00117647065781056880950927734375;
                        branchMergedValue91 = productValue279 * float((intermediateValue232 >> 8u) & 255u);
                        branchMergedValue96 = productValue279 * float((intermediateValue232 >> 16u) & 255u);
                        branchMergedValue97 = (float((intermediateValue232 >> 24u) & 127u) * 0.00236220471560955047607421875) * bitwiseValue107;
                        branchMergedValue98 = intermediateValue119;
                        branchMergedValue99 = productValue94;
                        branchMergedValue100 = productValue93;
                        branchMergedValue101 = productValue92;
                    }
                    else
                    {
                        branchMergedValue91 = 0.0;
                        branchMergedValue96 = 0.0;
                        branchMergedValue97 = 0.0;
                        branchMergedValue98 = intermediateValue119;
                        branchMergedValue99 = productValue94;
                        branchMergedValue100 = productValue93;
                        branchMergedValue101 = productValue92;
                    }
                    branchMergedValue30 = branchMergedValue91;
                    branchMergedValue48 = branchMergedValue96;
                    branchMergedValue49 = branchMergedValue97;
                    branchMergedValue50 = branchMergedValue98;
                    branchMergedValue51 = branchMergedValue99;
                    branchMergedValue52 = branchMergedValue100;
                    branchMergedValue53 = branchMergedValue101;
                }
                intermediateValue115 = branchMergedValue53;
                intermediateValue116 = branchMergedValue52;
                intermediateValue117 = branchMergedValue51;
                intermediateValue118 = branchMergedValue50;
                intermediateValue120 = branchMergedValue49;
                intermediateValue121 = branchMergedValue48;
                intermediateValue122 = branchMergedValue30;
            }
            bool reinterpretedBits6 = (((floatBitsToUint(intermediateValue120) & 2147483647u) > 2139095040u) || ((floatBitsToUint(intermediateValue121) & 2147483647u) > 2139095040u)) || ((floatBitsToUint(intermediateValue122) & 2147483647u) > 2139095040u);
            float branchMergedValue27;
            float branchMergedValue35;
            float branchMergedValue36;
            float branchMergedValue37;
            float branchMergedValue38;
            float branchMergedValue39;
            float branchMergedValue40;
            if (intermediateValue118 == 0u)
            {
                branchMergedValue27 = comparisonValue9;
                branchMergedValue35 = comparisonValue8;
                branchMergedValue36 = 2.0;
                branchMergedValue37 = comparisonValue13;
                branchMergedValue38 = comparisonValue12;
                branchMergedValue39 = comparisonValue11;
                branchMergedValue40 = comparisonValue10;
            }
            else
            {
                float dotProductValue9 = dot(vec3(productValue41, productValue42, productValue43), vec3(intermediateValue115, intermediateValue116, intermediateValue117));
                float productValue113 = abs(dotProductValue9) * sumValue62;
                float comparisonValue27 = productValue113 * (reinterpretedBits6 ? 0.0 : intermediateValue120);
                float comparisonValue28 = productValue113 * (reinterpretedBits6 ? 0.0 : intermediateValue121);
                float comparisonValue29 = productValue113 * (reinterpretedBits6 ? 0.0 : intermediateValue122);
                bool intermediateValue139 = dotProductValue9 < 0.0;
                branchMergedValue27 = intermediateValue139 ? comparisonValue9 : (comparisonValue28 + comparisonValue9);
                branchMergedValue35 = intermediateValue139 ? comparisonValue8 : (comparisonValue27 + comparisonValue8);
                branchMergedValue36 = 3.0;
                branchMergedValue37 = intermediateValue139 ? (comparisonValue29 + comparisonValue13) : comparisonValue13;
                branchMergedValue38 = intermediateValue139 ? (comparisonValue28 + comparisonValue12) : comparisonValue12;
                branchMergedValue39 = intermediateValue139 ? (comparisonValue27 + comparisonValue11) : comparisonValue11;
                branchMergedValue40 = intermediateValue139 ? comparisonValue10 : (comparisonValue29 + comparisonValue10);
            }
            intermediateValue86 = branchMergedValue35;
            intermediateValue87 = branchMergedValue27;
            intermediateValue88 = branchMergedValue40;
            intermediateValue89 = branchMergedValue39;
            intermediateValue90 = branchMergedValue38;
            intermediateValue91 = branchMergedValue37;
            intermediateValue92 = branchMergedValue36;
        }
        else
        {
            intermediateValue86 = comparisonValue8;
            intermediateValue87 = comparisonValue9;
            intermediateValue88 = comparisonValue10;
            intermediateValue89 = comparisonValue11;
            intermediateValue90 = comparisonValue12;
            intermediateValue91 = comparisonValue13;
            intermediateValue92 = 2.0;
        }
        f16vec4 productValue80 = uint16BitsToFloat16(vertexIrradianceCache_2[nonuniformEXT(sumValue1)].packedValues[sumValue55 * 2u]);
        uint productValue81 = (sumValue55 * 8u) + 4u;
        uint16_t intermediateValue93 = vertexIrradianceCache[nonuniformEXT(sumValue1)].packedValues[productValue81];
        uint16_t sumValue63 = vertexIrradianceCache[nonuniformEXT(sumValue1)].packedValues[productValue81 + 1u];
        uint16_t sumValue64 = vertexIrradianceCache[nonuniformEXT(sumValue1)].packedValues[productValue81 + 2u];
        f16vec3 intermediateValue94 = uint16BitsToFloat16(u16vec3(intermediateValue93, sumValue63, sumValue64));
        uint productValue82 = min((uint(productValue80.w) + 1u), uint(objectInstances.packedValues[(bitwiseValue2 * 76u) + 63u]));
        float quotientValue1 = 1.0 / float(productValue82);
        float quotientValue2 = intermediateValue86 / intermediateValue92;
        float quotientValue3 = intermediateValue87 / intermediateValue92;
        float quotientValue4 = intermediateValue88 / intermediateValue92;
        float intermediateValue95 = float(productValue80.x);
        float intermediateValue96 = float(productValue80.y);
        float intermediateValue97 = float(productValue80.z);
        float dotProductValue3 = dot(vec3(intermediateValue95, intermediateValue96, intermediateValue97), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float reinterpretedBits5 = uintBitsToFloat(inputIncidentLight.packedValues[0u]);
        float dotProductValue4 = exp2(log2(reinterpretedBits5 * (((dot(vec3(quotientValue2, quotientValue3, quotientValue4), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) - dotProductValue3) * quotientValue1) + dotProductValue3)) * 0.454545438289642333984375) - exp2(log2(reinterpretedBits5 * dotProductValue3) * 0.454545438289642333984375);
        float comparisonValue16 = (dotProductValue4 > 0.20000000298023223876953125) ? ((0.20000000298023223876953125 / dotProductValue4) * quotientValue1) : quotientValue1;
        precise float16_t productValue83 = float16_t((comparisonValue16 * (quotientValue2 - intermediateValue95)) + intermediateValue95);
        precise float16_t productValue84 = float16_t((comparisonValue16 * (quotientValue3 - intermediateValue96)) + intermediateValue96);
        precise float16_t productValue85 = float16_t((comparisonValue16 * (quotientValue4 - intermediateValue97)) + intermediateValue97);
        float quotientValue5 = intermediateValue89 / intermediateValue92;
        float quotientValue6 = intermediateValue90 / intermediateValue92;
        float quotientValue7 = intermediateValue91 / intermediateValue92;
        float intermediateValue98 = float(intermediateValue94.x);
        float intermediateValue99 = float(intermediateValue94.y);
        float intermediateValue100 = float(intermediateValue94.z);
        float dotProductValue5 = dot(vec3(intermediateValue98, intermediateValue99, intermediateValue100), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float dotProductValue6 = exp2(log2((((dot(vec3(quotientValue5, quotientValue6, quotientValue7), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) - dotProductValue5) * quotientValue1) + dotProductValue5) * reinterpretedBits5) * 0.454545438289642333984375) - exp2(log2(dotProductValue5 * reinterpretedBits5) * 0.454545438289642333984375);
        float comparisonValue17 = (dotProductValue6 > 0.20000000298023223876953125) ? ((0.20000000298023223876953125 / dotProductValue6) * quotientValue1) : quotientValue1;
        precise float16_t productValue86 = float16_t((comparisonValue17 * (quotientValue5 - intermediateValue98)) + intermediateValue98);
        precise float16_t productValue87 = float16_t((comparisonValue17 * (quotientValue6 - intermediateValue99)) + intermediateValue99);
        precise float16_t productValue88 = float16_t((comparisonValue17 * (quotientValue7 - intermediateValue100)) + intermediateValue100);
        if (!((((floatBitsToUint(float(productValue85)) & 2147483647u) > 2139095040u) || (((floatBitsToUint(float(productValue83)) & 2147483647u) > 2139095040u) || ((floatBitsToUint(float(productValue84)) & 2147483647u) > 2139095040u))) || (((floatBitsToUint(float(productValue88)) & 2147483647u) > 2139095040u) || (((floatBitsToUint(float(productValue86)) & 2147483647u) > 2139095040u) || ((floatBitsToUint(float(productValue87)) & 2147483647u) > 2139095040u)))))
        {
            vertexIrradianceCache_2[nonuniformEXT(sumValue1)].packedValues[sumValue55 * 2u] = u16vec4(float16BitsToUint16(productValue83), float16BitsToUint16(productValue84), float16BitsToUint16(productValue85), float16BitsToUint16(float16_t(productValue82)));
            vertexIrradianceCache_2[nonuniformEXT(sumValue1)].packedValues[(sumValue55 * 2u) + 1u] = u16vec4(float16BitsToUint16(productValue86), float16BitsToUint16(productValue87), float16BitsToUint16(productValue88), float16BitsToUint16(float16_t(0.0)));
        }
    }
}

