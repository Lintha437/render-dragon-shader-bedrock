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

float intermediateValue132;

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
layout(set = 0, binding = 46) uniform texture2D inputPrimaryViewDirection;
layout(set = 0, binding = 58) uniform texture2DArray blueNoiseTexture;
layout(set = 0, binding = 59) uniform texture2DArray skyTexture;
layout(set = 0, binding = 60) uniform texture2DArray causticsTexture;
layout(set = 0, binding = 61) uniform texture2D wibblyTexture;
layout(set = 6, binding = 0) uniform texture2D textures[4096];
layout(set = 0, binding = 10004, r32f) uniform image2D outputBufferEmissiveAndLinearRoughness;
layout(set = 0, binding = 10006, r32f) uniform image2D outputBufferIndirectSpecular;
layout(set = 0, binding = 10014, r32f) uniform image2D outputBufferDebug;
layout(set = 0, binding = 10015) uniform writeonly image2D outputBufferReflectionDistance;
layout(set = 0, binding = 0) uniform sampler defaultSampler;
layout(set = 0, binding = 1) uniform sampler linearSampler;
layout(set = 0, binding = 2) uniform sampler linearWrapSampler;

rayQueryEXT intermediateValue45;
rayQueryEXT intermediateValue158;
rayQueryEXT intermediateValue174;
rayQueryEXT intermediateValue176;
rayQueryEXT intermediateValue198;

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
    uint intermediateValue3;
    SPIRV_CROSS_FLATTEN
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
    SPIRV_CROSS_FLATTEN
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

void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
    uint intermediateValue2 = reinterpretedBits.z;
    uint bitwiseValue = gl_WorkGroupID.y >> 4u;
    uint bitwiseValue1 = ((intermediateValue2 & 1023u) * (gl_WorkGroupID.y & 15u)) + gl_WorkGroupID.x;
    uint comparisonValue = (bitwiseValue == ((intermediateValue2 >> 14u) & 63u)) ? ((intermediateValue2 >> 10u) & 15u) : 16u;
    uint bitwiseValue2 = (UDiv(bitwiseValue1, comparisonValue) << 2u) + gl_LocalInvocationID.x;
    uint bitwiseValue3 = ((UMod(bitwiseValue1, comparisonValue) + (bitwiseValue << 4u)) << 3u) + gl_LocalInvocationID.y;
    vec4 sampledTextureValue = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
    float intermediateValue5 = sampledTextureValue.x;
    if (!(intermediateValue5 == 65504.0))
    {
        vec4 intermediateValue6 = texelFetch(inputBufferNormal, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float intermediateValue7 = intermediateValue6.x;
        float intermediateValue8 = intermediateValue6.y;
        precise float sumValue = 1.0 - abs(intermediateValue7);
        float intermediateValue9 = abs(intermediateValue8);
        precise float sumValue1 = sumValue - intermediateValue9;
        bool intermediateValue10 = sumValue1 < 0.0;
        precise float sumValue2 = 1.0 - intermediateValue9;
        precise float comparisonValue1 = ((intermediateValue7 >= 0.0) ? 1.0 : (-1.0)) * sumValue2;
        precise float comparisonValue2 = sumValue * ((intermediateValue8 >= 0.0) ? 1.0 : (-1.0));
        float comparisonValue3 = intermediateValue10 ? comparisonValue1 : intermediateValue7;
        float comparisonValue4 = intermediateValue10 ? comparisonValue2 : intermediateValue8;
        float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue3, comparisonValue4, sumValue1), vec3(comparisonValue3, comparisonValue4, sumValue1)));
        precise float productValue = inverseLengthValue * comparisonValue3;
        precise float productValue1 = inverseLengthValue * comparisonValue4;
        precise float productValue2 = sumValue1 * inverseLengthValue;
        float comparisonValue5 = ((productValue2 != 0.0) || ((productValue != 0.0) || (productValue1 != 0.0))) ? productValue2 : 1.0;
        float inverseLengthValue1 = inversesqrt(dot(vec3(productValue, productValue1, comparisonValue5), vec3(productValue, productValue1, comparisonValue5)));
        precise float productValue3 = productValue * inverseLengthValue1;
        precise float productValue4 = productValue1 * inverseLengthValue1;
        precise float productValue5 = inverseLengthValue1 * comparisonValue5;
        vec4 loadedBufferValue = imageLoad(outputBufferEmissiveAndLinearRoughness, ivec2(uvec2(bitwiseValue2, bitwiseValue3)));
        float intermediateValue11 = loadedBufferValue.x;
        float intermediateValue12 = loadedBufferValue.w;
        vec4 sampledTextureValue1 = texelFetch(inputGeometryNormal, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float intermediateValue13 = sampledTextureValue1.x;
        float intermediateValue14 = sampledTextureValue1.y;
        float sumValue3 = 1.0 - abs(intermediateValue13);
        float intermediateValue15 = abs(intermediateValue14);
        float sumValue4 = sumValue3 - intermediateValue15;
        bool intermediateValue16 = sumValue4 < 0.0;
        float comparisonValue6 = intermediateValue16 ? ((1.0 - intermediateValue15) * ((intermediateValue13 >= 0.0) ? 1.0 : (-1.0))) : intermediateValue13;
        float comparisonValue7 = intermediateValue16 ? (((intermediateValue14 >= 0.0) ? 1.0 : (-1.0)) * sumValue3) : intermediateValue14;
        float inverseLengthValue2 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, sumValue4), vec3(comparisonValue6, comparisonValue7, sumValue4)));
        float productValue6 = comparisonValue6 * inverseLengthValue2;
        float productValue7 = comparisonValue7 * inverseLengthValue2;
        float productValue8 = inverseLengthValue2 * sumValue4;
        vec4 sampledTextureValue2 = texelFetch(inputPrimaryWorldPosition, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float intermediateValue17 = sampledTextureValue2.x;
        float intermediateValue18 = sampledTextureValue2.y;
        float intermediateValue19 = sampledTextureValue2.z;
        vec4 sampledTextureValue3 = texelFetch(inputPrimaryViewDirection, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float intermediateValue20 = sampledTextureValue3.x;
        float intermediateValue21 = sampledTextureValue3.y;
        float intermediateValue22 = sampledTextureValue3.z;
        float reinterpretedBits1 = uintBitsToFloat(inputIncidentLight.packedValues[0u]);
        uint reinterpretedBits2 = floatBitsToUint(intermediateValue11) & 2147483647u;
        uint reinterpretedBits3 = floatBitsToUint(loadedBufferValue.y) & 2147483647u;
        uint reinterpretedBits4 = floatBitsToUint(loadedBufferValue.z) & 2147483647u;
        uint reinterpretedBits5 = floatBitsToUint(intermediateValue12) & 2147483647u;
        bool comparisonValue8 = ((reinterpretedBits5 > 2139095040u) || ((reinterpretedBits4 > 2139095040u) || ((reinterpretedBits2 > 2139095040u) || (reinterpretedBits3 > 2139095040u)))) || ((reinterpretedBits5 == 2139095040u) || ((reinterpretedBits4 == 2139095040u) || ((reinterpretedBits2 == 2139095040u) || (reinterpretedBits3 == 2139095040u))));
        bool intermediateValue23;
        if (comparisonValue8)
        {
            bool branchMergedValue9;
            if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3))).w == 0.0)
            {
                imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 1.0, 0.0, 1.0));
                imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
                branchMergedValue9 = comparisonValue8;
            }
            else
            {
                branchMergedValue9 = comparisonValue8;
            }
            intermediateValue23 = branchMergedValue9;
        }
        else
        {
            intermediateValue23 = false;
        }
        if (!intermediateValue23)
        {
            imageStore(outputBufferEmissiveAndLinearRoughness, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue11, loadedBufferValue.yz, intermediateValue12));
        }
        uvec4 reinterpretedBits6 = floatBitsToUint(ViewCB.packedValues[84u]);
        uint intermediateValue24 = reinterpretedBits6.z;
        uint sampledTextureValue4 = uint(texelFetch(inputPrimaryViewDirection, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u)).w);
        uint productValue9 = uint(int(productValue6 * 256.0));
        uint productValue10 = uint(int(productValue7 * 256.0));
        uint productValue11 = uint(int(productValue8 * 256.0));
        precise float productValue12 = intermediateValue12 * intermediateValue12;
        precise float sumValue5 = productValue12 + 9.9999997473787516355514526367188e-05;
        precise float quotientValue = 0.5 / sumValue5;
        vec4 sampledTextureValue5 = texelFetch(blueNoiseTexture, ivec3(uvec3(bitwiseValue2 & 255u, bitwiseValue3 & 255u, (intermediateValue24 >> 1u) & 127u)), int(0u));
        bool comparisonValue9 = (intermediateValue24 & 1u) == 0u;
        float intermediateValue28;
        float intermediateValue29;
        float intermediateValue30;
        float intermediateValue31;
        bool intermediateValue32;
        if (intermediateValue12 == 0.0)
        {
            precise float intermediateValue25 = dot(vec3(intermediateValue20, intermediateValue21, intermediateValue22), vec3(productValue3, productValue4, productValue5)) * 2.0;
            precise float productValue13 = productValue3 * intermediateValue25;
            precise float productValue14 = productValue4 * intermediateValue25;
            precise float productValue15 = productValue5 * intermediateValue25;
            precise float sumValue6 = intermediateValue20 - productValue13;
            precise float sumValue7 = intermediateValue21 - productValue14;
            precise float sumValue8 = intermediateValue22 - productValue15;
            intermediateValue28 = sumValue6;
            intermediateValue29 = sumValue7;
            intermediateValue30 = sumValue8;
            intermediateValue31 = 1.0;
            intermediateValue32 = false;
        }
        else
        {
            float intermediateValue26 = spvNMax(0.001000000047497451305389404296875, productValue12);
            precise float dotProductValue = dot(vec3(0.0, 0.0, 1.0), vec3(productValue3, productValue4, productValue5));
            bool intermediateValue27 = dotProductValue < 0.0;
            float comparisonValue10 = intermediateValue27 ? (-0.0) : 0.0;
            float comparisonValue11 = intermediateValue27 ? (-1.0) : 1.0;
            precise float productValue16 = productValue5 * comparisonValue10;
            precise float productValue17 = productValue4 * comparisonValue11;
            precise float sumValue9 = productValue16 - productValue17;
            precise float productValue18 = productValue3 * comparisonValue11;
            precise float productValue19 = productValue5 * 0.0;
            precise float sumValue10 = productValue18 - productValue19;
            precise float productValue20 = productValue4 * 0.0;
            precise float productValue21 = productValue3 * comparisonValue10;
            precise float sumValue11 = productValue20 - productValue21;
            precise float sumValue12 = abs(dotProductValue) + 1.0;
            precise float productValue22 = sumValue12 * 0.5;
            float nonlinearValue = sqrt(productValue22);
            precise float productValue23 = nonlinearValue * 2.0;
            precise float quotientValue1 = sumValue9 / productValue23;
            precise float quotientValue2 = sumValue10 / productValue23;
            precise float quotientValue3 = sumValue11 / productValue23;
            float intermediateValue33;
            float intermediateValue34;
            float intermediateValue35;
            float intermediateValue36;
            if (intermediateValue27)
            {
                precise float sumValue16 = (-0.0) - quotientValue2;
                precise float sumValue17 = (-0.0) - quotientValue1;
                intermediateValue33 = nonlinearValue;
                intermediateValue34 = quotientValue3;
                intermediateValue35 = sumValue16;
                intermediateValue36 = sumValue17;
            }
            else
            {
                intermediateValue33 = quotientValue1;
                intermediateValue34 = quotientValue2;
                intermediateValue35 = quotientValue3;
                intermediateValue36 = nonlinearValue;
            }
            precise float sumValue18 = (-0.0) - intermediateValue33;
            precise float sumValue19 = (-0.0) - intermediateValue34;
            precise float sumValue20 = (-0.0) - intermediateValue35;
            precise float productValue24 = intermediateValue22 * intermediateValue34;
            precise float productValue25 = intermediateValue21 * intermediateValue35;
            precise float sumValue21 = productValue24 - productValue25;
            precise float productValue26 = intermediateValue20 * intermediateValue35;
            precise float productValue27 = intermediateValue22 * intermediateValue33;
            precise float sumValue22 = productValue26 - productValue27;
            precise float productValue28 = intermediateValue21 * intermediateValue33;
            precise float productValue29 = intermediateValue20 * intermediateValue34;
            precise float sumValue23 = productValue28 - productValue29;
            precise float productValue30 = intermediateValue20 * intermediateValue36;
            precise float productValue31 = intermediateValue21 * intermediateValue36;
            precise float productValue32 = intermediateValue22 * intermediateValue36;
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
            precise float productValue39 = sumValue27 * 2.0;
            precise float productValue40 = sumValue28 * 2.0;
            precise float productValue41 = sumValue29 * 2.0;
            precise float sumValue30 = productValue39 - intermediateValue20;
            precise float sumValue31 = productValue40 - intermediateValue21;
            precise float sumValue32 = productValue41 - intermediateValue22;
            precise float productValue42 = intermediateValue26 * sumValue30;
            precise float productValue43 = intermediateValue26 * sumValue31;
            float inverseLengthValue3 = inversesqrt(dot(vec3(productValue42, productValue43, sumValue32), vec3(productValue42, productValue43, sumValue32)));
            precise float productValue44 = inverseLengthValue3 * productValue42;
            precise float productValue45 = inverseLengthValue3 * productValue43;
            precise float productValue46 = inverseLengthValue3 * sumValue32;
            bool intermediateValue37 = productValue46 < 0.99989998340606689453125;
            precise float productValue47 = productValue46 * 0.0;
            precise float sumValue33 = productValue47 - productValue45;
            precise float sumValue34 = productValue44 - productValue47;
            precise float productValue48 = productValue45 * 0.0;
            precise float productValue49 = productValue44 * 0.0;
            precise float sumValue35 = productValue48 - productValue49;
            float inverseLengthValue4 = inversesqrt(dot(vec3(sumValue33, sumValue34, sumValue35), vec3(sumValue33, sumValue34, sumValue35)));
            precise float productValue50 = inverseLengthValue4 * sumValue33;
            precise float productValue51 = inverseLengthValue4 * sumValue34;
            precise float productValue52 = inverseLengthValue4 * sumValue35;
            float comparisonValue12 = intermediateValue37 ? productValue50 : 1.0;
            float comparisonValue13 = intermediateValue37 ? productValue51 : 0.0;
            float comparisonValue14 = intermediateValue37 ? productValue52 : 0.0;
            precise float productValue53 = productValue45 * comparisonValue14;
            precise float productValue54 = productValue46 * comparisonValue13;
            precise float sumValue36 = productValue53 - productValue54;
            precise float productValue55 = productValue46 * comparisonValue12;
            precise float productValue56 = productValue44 * comparisonValue14;
            precise float sumValue37 = productValue55 - productValue56;
            precise float productValue57 = productValue44 * comparisonValue13;
            precise float productValue58 = productValue45 * comparisonValue12;
            precise float sumValue38 = productValue57 - productValue58;
            float nonlinearValue1 = sqrt(comparisonValue9 ? sampledTextureValue5.x : sampledTextureValue5.z);
            precise float comparisonValue15 = (comparisonValue9 ? sampledTextureValue5.y : sampledTextureValue5.w) * 6.283185482025146484375;
            precise float wavePhaseValue = nonlinearValue1 * cos(comparisonValue15);
            precise float wavePhaseValue1 = nonlinearValue1 * sin(comparisonValue15);
            precise float sumValue39 = productValue46 + 1.0;
            precise float productValue59 = sumValue39 * 0.5;
            precise float sumValue40 = (-0.0) - wavePhaseValue;
            precise float productValue60 = sumValue40 * wavePhaseValue;
            precise float sumValue41 = productValue60 + 1.0;
            float nonlinearValue2 = sqrt(spvNMax(sumValue41, 0.0));
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
            precise float sumValue47 = (-0.0) - sumValue43;
            precise float productValue68 = sumValue47 * sumValue43;
            precise float sumValue48 = productValue68 + 1.0;
            precise float productValue69 = sumValue40 * wavePhaseValue;
            precise float sumValue49 = productValue69 + sumValue48;
            float nonlinearValue3 = sqrt(spvNMax(0.0, sumValue49));
            precise float productValue70 = productValue44 * nonlinearValue3;
            precise float productValue71 = productValue45 * nonlinearValue3;
            precise float productValue72 = productValue46 * nonlinearValue3;
            precise float sumValue50 = productValue70 + sumValue44;
            precise float sumValue51 = productValue71 + sumValue45;
            precise float sumValue52 = sumValue46 + productValue72;
            precise float productValue73 = intermediateValue26 * sumValue50;
            precise float productValue74 = intermediateValue26 * sumValue51;
            float intermediateValue38 = spvNMax(0.0, sumValue52);
            float inverseLengthValue5 = inversesqrt(dot(vec3(productValue73, productValue74, intermediateValue38), vec3(productValue73, productValue74, intermediateValue38)));
            precise float productValue75 = inverseLengthValue5 * productValue73;
            precise float productValue76 = inverseLengthValue5 * productValue74;
            precise float productValue77 = intermediateValue38 * inverseLengthValue5;
            precise float sumValue53 = (-0.0) - sumValue30;
            precise float sumValue54 = (-0.0) - sumValue31;
            precise float sumValue55 = (-0.0) - sumValue32;
            precise float dotProductValue1 = dot(vec3(sumValue53, sumValue54, sumValue55), vec3(productValue75, productValue76, productValue77)) * 2.0;
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
            if (spvNClamp(dot(vec3(productValue75, productValue76, productValue77), vec3(sumValue56, sumValue57, sumValue58)), 0.0, 1.0) < 9.9999997473787516355514526367188e-06)
            {
                branchMergedValue10 = 0.0;
                branchMergedValue18 = true;
                branchMergedValue19 = 0.0;
                branchMergedValue20 = 0.0;
                branchMergedValue21 = 0.0;
            }
            else
            {
                float productValue87 = intermediateValue26 * intermediateValue26;
                float multiplyAddValue = 1.0 / fma(sqrt((dot(vec2(productValue87), vec2(sumValue30 * sumValue30, sumValue31 * sumValue31)) / (sumValue32 * sumValue32)) + 1.0), 0.5, 0.5);
                float multiplyAddValue1 = 1.0 / fma(sqrt((dot(vec2(productValue87), vec2(sumValue56 * sumValue56, sumValue57 * sumValue57)) / (sumValue58 * sumValue58)) + 1.0), 0.5, 0.5);
                precise float productValue88 = intermediateValue34 * sumValue58;
                precise float productValue89 = intermediateValue35 * sumValue57;
                precise float sumValue59 = productValue88 - productValue89;
                precise float productValue90 = intermediateValue35 * sumValue56;
                precise float productValue91 = intermediateValue33 * sumValue58;
                precise float sumValue60 = productValue90 - productValue91;
                precise float productValue92 = intermediateValue33 * sumValue57;
                precise float productValue93 = intermediateValue34 * sumValue56;
                precise float sumValue61 = productValue92 - productValue93;
                precise float productValue94 = intermediateValue36 * sumValue56;
                precise float productValue95 = intermediateValue36 * sumValue57;
                precise float productValue96 = intermediateValue36 * sumValue58;
                precise float sumValue62 = productValue94 + sumValue59;
                precise float sumValue63 = productValue95 + sumValue60;
                precise float sumValue64 = productValue96 + sumValue61;
                precise float productValue97 = intermediateValue34 * sumValue64;
                precise float productValue98 = intermediateValue35 * sumValue63;
                precise float sumValue65 = productValue97 - productValue98;
                precise float productValue99 = intermediateValue35 * sumValue62;
                precise float productValue100 = intermediateValue33 * sumValue64;
                precise float sumValue66 = productValue99 - productValue100;
                precise float productValue101 = intermediateValue33 * sumValue63;
                precise float productValue102 = intermediateValue34 * sumValue62;
                precise float sumValue67 = productValue101 - productValue102;
                precise float productValue103 = sumValue65 * 2.0;
                precise float productValue104 = sumValue66 * 2.0;
                precise float productValue105 = sumValue67 * 2.0;
                precise float sumValue13 = sumValue56 + productValue103;
                precise float sumValue14 = sumValue57 + productValue104;
                precise float sumValue15 = sumValue58 + productValue105;
                branchMergedValue10 = sumValue14;
                branchMergedValue18 = false;
                branchMergedValue19 = multiplyAddValue1 / ((multiplyAddValue1 + multiplyAddValue) - (multiplyAddValue1 * multiplyAddValue));
                branchMergedValue20 = sumValue15;
                branchMergedValue21 = sumValue13;
            }
            intermediateValue28 = branchMergedValue21;
            intermediateValue29 = branchMergedValue10;
            intermediateValue30 = branchMergedValue20;
            intermediateValue31 = branchMergedValue19;
            intermediateValue32 = branchMergedValue18;
        }
        float intermediateValue39;
        float intermediateValue41;
        float intermediateValue42;
        float intermediateValue43;
        uint intermediateValue44;
        if (intermediateValue32)
        {
            intermediateValue39 = 0.0;
            intermediateValue41 = 0.0;
            intermediateValue42 = 0.0;
            intermediateValue43 = 0.0;
            intermediateValue44 = 0u;
        }
        else
        {
            rayQueryInitializeEXT(intermediateValue45, SceneBVH, 512u, 118u, vec3((abs(intermediateValue17) < 0.03125) ? (intermediateValue17 + (productValue6 * 1.52587890625e-05)) : uintBitsToFloat(((intermediateValue17 < 0.0) ? (-productValue9) : productValue9) + floatBitsToUint(intermediateValue17)), (abs(intermediateValue18) < 0.03125) ? (intermediateValue18 + (productValue7 * 1.52587890625e-05)) : uintBitsToFloat(((intermediateValue18 < 0.0) ? (-productValue10) : productValue10) + floatBitsToUint(intermediateValue18)), (abs(intermediateValue19) < 0.03125) ? (intermediateValue19 + (productValue8 * 1.52587890625e-05)) : uintBitsToFloat(((intermediateValue19 < 0.0) ? (-productValue11) : productValue11) + floatBitsToUint(intermediateValue19))), 0.0, vec3(intermediateValue28, intermediateValue29, intermediateValue30), 10000.0);
            bool intermediateValue46 = rayQueryProceedEXT(intermediateValue45);
            if (intermediateValue46)
            {
                bool intermediateValue64;
                bool comparisonValue21;
                for (;;)
                {
                    uint intermediateValue49 = rayQueryGetIntersectionTypeEXT(intermediateValue45, bool(0u));
                    comparisonValue21 = intermediateValue49 == 0u;
                    if (comparisonValue21)
                    {
                        vec2 intermediateValue58 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue45, bool(0u));
                        vec2 intermediateValue59 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue45, bool(0u));
                        uint intermediateValue60 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue45, bool(0u));
                        uint intermediateValue61 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue45, bool(0u));
                        uint intermediateValue62 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue45, bool(0u));
                        uint productValue106 = (intermediateValue62 * 76u) + 58u;
                        uint productValue107 = (intermediateValue62 * 76u) + 61u;
                        precise float sumValue68 = 1.0 - intermediateValue58.x;
                        precise float sumValue69 = sumValue68 - intermediateValue59.y;
                        uint bitwiseValue5 = (objectInstances_2.packedValues[(intermediateValue62 * 38u) + 25u] >> 2u) + (intermediateValue60 >> 1u);
                        uint productValue108 = uint(objectInstances.packedValues[(intermediateValue62 * 76u) + 54u]) + 0u;
                        bool comparisonValue22 = (intermediateValue60 & 1u) == 0u;
                        uint comparisonValue23 = comparisonValue22 ? faceUvBuffersRW[nonuniformEXT(productValue108)].packedValues[bitwiseValue5].z : faceUvBuffersRW[nonuniformEXT(productValue108)].packedValues[bitwiseValue5].x;
                        uint comparisonValue24 = comparisonValue22 ? faceUvBuffersRW[nonuniformEXT(productValue108)].packedValues[bitwiseValue5].y : faceUvBuffersRW[nonuniformEXT(productValue108)].packedValues[bitwiseValue5].w;
                        uint comparisonValue25 = comparisonValue22 ? faceUvBuffersRW[nonuniformEXT(productValue108)].packedValues[bitwiseValue5].x : faceUvBuffersRW[nonuniformEXT(productValue108)].packedValues[bitwiseValue5].z;
                        bool intermediateValue63 = int16_t(objectInstances.packedValues[productValue107]) < int16_t(0us);
                        float intermediateValue76;
                        float intermediateValue77;
                        if (intermediateValue63)
                        {
                            uint bitwiseValue7 = comparisonValue25 >> 15u;
                            precise float bitwiseValue8 = float(bitwiseValue7 & 1u) * 2.0;
                            precise float sumValue70 = bitwiseValue8 + (-1.0);
                            precise float bitwiseValue9 = float(comparisonValue25 >> 31u) * 2.0;
                            precise float sumValue71 = bitwiseValue9 + (-1.0);
                            precise float bitwiseValue10 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue11 = float(bitwiseValue7 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue114 = sumValue70 * 3.0517578125e-05;
                            precise float productValue115 = sumValue71 * 3.0517578125e-05;
                            precise float sumValue72 = bitwiseValue10 + productValue114;
                            precise float sumValue73 = bitwiseValue11 + productValue115;
                            intermediateValue76 = sumValue72;
                            intermediateValue77 = sumValue73;
                        }
                        else
                        {
                            precise float bitwiseValue12 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue13 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue116 = bitwiseValue12 * 16384.0;
                            precise float sumValue74 = productValue116 + 0.5;
                            precise float productValue117 = bitwiseValue13 * 16384.0;
                            precise float sumValue75 = productValue117 + 0.5;
                            precise float productValue118 = floor(sumValue74) * 6.103515625e-05;
                            precise float productValue119 = floor(sumValue75) * 6.103515625e-05;
                            intermediateValue76 = productValue118;
                            intermediateValue77 = productValue119;
                        }
                        precise float productValue122 = sumValue69 * intermediateValue76;
                        precise float productValue123 = sumValue69 * intermediateValue77;
                        precise float sumValue76 = productValue122 + 0.0;
                        precise float sumValue77 = productValue123 + 0.0;
                        float intermediateValue93;
                        float intermediateValue94;
                        if (intermediateValue63)
                        {
                            uint bitwiseValue27 = comparisonValue24 >> 15u;
                            precise float bitwiseValue28 = float(bitwiseValue27 & 1u) * 2.0;
                            precise float sumValue89 = bitwiseValue28 + (-1.0);
                            precise float bitwiseValue29 = float(comparisonValue24 >> 31u) * 2.0;
                            precise float sumValue90 = bitwiseValue29 + (-1.0);
                            precise float bitwiseValue30 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue31 = float(bitwiseValue27 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue134 = sumValue89 * 3.0517578125e-05;
                            precise float productValue135 = sumValue90 * 3.0517578125e-05;
                            precise float sumValue91 = bitwiseValue30 + productValue134;
                            precise float sumValue92 = bitwiseValue31 + productValue135;
                            intermediateValue93 = sumValue91;
                            intermediateValue94 = sumValue92;
                        }
                        else
                        {
                            precise float bitwiseValue32 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue33 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue136 = bitwiseValue32 * 16384.0;
                            precise float sumValue93 = productValue136 + 0.5;
                            precise float productValue137 = bitwiseValue33 * 16384.0;
                            precise float sumValue94 = productValue137 + 0.5;
                            precise float productValue138 = floor(sumValue93) * 6.103515625e-05;
                            precise float productValue139 = floor(sumValue94) * 6.103515625e-05;
                            intermediateValue93 = productValue138;
                            intermediateValue94 = productValue139;
                        }
                        precise float productValue140 = intermediateValue58.x * intermediateValue93;
                        precise float productValue141 = intermediateValue58.x * intermediateValue94;
                        precise float sumValue95 = sumValue76 + productValue140;
                        precise float sumValue96 = sumValue77 + productValue141;
                        float intermediateValue111;
                        float intermediateValue112;
                        if (intermediateValue63)
                        {
                            uint bitwiseValue37 = comparisonValue23 >> 15u;
                            precise float bitwiseValue38 = float(bitwiseValue37 & 1u) * 2.0;
                            precise float sumValue97 = bitwiseValue38 + (-1.0);
                            precise float bitwiseValue39 = float(comparisonValue23 >> 31u) * 2.0;
                            precise float sumValue98 = bitwiseValue39 + (-1.0);
                            precise float bitwiseValue40 = float((comparisonValue23 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue41 = float(bitwiseValue37 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue142 = sumValue97 * 3.0517578125e-05;
                            precise float productValue143 = sumValue98 * 3.0517578125e-05;
                            precise float sumValue99 = bitwiseValue40 + productValue142;
                            precise float sumValue100 = bitwiseValue41 + productValue143;
                            intermediateValue111 = sumValue99;
                            intermediateValue112 = sumValue100;
                        }
                        else
                        {
                            precise float bitwiseValue42 = float(comparisonValue23 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue43 = float(comparisonValue23 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue144 = bitwiseValue42 * 16384.0;
                            precise float sumValue101 = productValue144 + 0.5;
                            precise float productValue145 = bitwiseValue43 * 16384.0;
                            precise float sumValue102 = productValue145 + 0.5;
                            precise float productValue146 = floor(sumValue101) * 6.103515625e-05;
                            precise float productValue147 = floor(sumValue102) * 6.103515625e-05;
                            intermediateValue111 = productValue146;
                            intermediateValue112 = productValue147;
                        }
                        precise float productValue162 = intermediateValue59.y * intermediateValue111;
                        precise float productValue163 = intermediateValue59.y * intermediateValue112;
                        precise float sumValue108 = sumValue95 + productValue162;
                        precise float sumValue109 = sumValue96 + productValue163;
                        float intermediateValue114;
                        if (objectInstances.packedValues[productValue106] == 65535us)
                        {
                            intermediateValue114 = 1.0;
                        }
                        else
                        {
                            uint reinterpretedBits18;
                            if (objectInstances.packedValues[productValue106] > 4095us)
                            {
                                reinterpretedBits18 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits18 = uint(objectInstances.packedValues[productValue106]);
                            }
                            intermediateValue114 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits18 + 0u], defaultSampler)), vec2(sumValue108, sumValue109), -0.25).w;
                        }
                        uint comparisonValue31;
                        if (intermediateValue61 == 2u)
                        {
                            comparisonValue31 = 0u;
                        }
                        else
                        {
                            comparisonValue31 = uint(intermediateValue114 <= (((objectInstances.packedValues[productValue107] & 4352us) != 0us) ? 0.5 : 0.0));
                        }
                        if (comparisonValue31 == 0u)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue45);
                        }
                    }
                    intermediateValue64 = rayQueryProceedEXT(intermediateValue45);
                    if (intermediateValue64)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint intermediateValue47 = rayQueryGetIntersectionTypeEXT(intermediateValue45, bool(1u));
            float intermediateValue55;
            float intermediateValue56;
            float intermediateValue57;
            uint bitwiseValue4;
            if (intermediateValue47 == 1u)
            {
                vec2 intermediateValue50 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue45, bool(1u));
                vec2 intermediateValue51 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue45, bool(1u));
                float intermediateValue52 = rayQueryGetIntersectionTEXT(intermediateValue45, bool(1u));
                uint intermediateValue53 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue45, bool(1u));
                uint intermediateValue54 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue45, bool(1u));
                intermediateValue55 = intermediateValue50.x;
                intermediateValue56 = intermediateValue51.y;
                intermediateValue57 = intermediateValue52;
                bitwiseValue4 = ((intermediateValue53 << 14u) & 1073725440u) | (intermediateValue54 & 16383u);
            }
            else
            {
                intermediateValue55 = 0.0;
                intermediateValue56 = 0.0;
                intermediateValue57 = 10000.0;
                bitwiseValue4 = 1073741823u;
            }
            float intermediateValue40;
            float intermediateValue65;
            float intermediateValue66;
            float intermediateValue67;
            float intermediateValue68;
            float intermediateValue70;
            float intermediateValue72;
            float intermediateValue74;
            if (intermediateValue57 < 10000.0)
            {
                uint bitwiseValue6 = bitwiseValue4 & 16383u;
                uint productValue109 = (bitwiseValue6 * 38u) + 25u;
                uint productValue110 = (bitwiseValue6 * 76u) + 58u;
                uint productValue111 = (bitwiseValue6 * 76u) + 59u;
                uint productValue112 = (bitwiseValue6 * 76u) + 61u;
                uint productValue113 = (bitwiseValue6 * 38u) + 32u;
                float intermediateValue69;
                float intermediateValue71;
                float intermediateValue73;
                if (floatBitsToUint(ViewCB.packedValues[54u]).w == 0u)
                {
                    intermediateValue69 = intermediateValue31;
                    intermediateValue71 = intermediateValue31;
                    intermediateValue73 = intermediateValue31;
                }
                else
                {
                    float productValue121 = intermediateValue57 * (-1.44269502162933349609375);
                    intermediateValue69 = exp2(ViewCB.packedValues[63u].x * productValue121) * intermediateValue31;
                    intermediateValue71 = exp2(ViewCB.packedValues[63u].y * productValue121) * intermediateValue31;
                    intermediateValue73 = exp2(ViewCB.packedValues[63u].z * productValue121) * intermediateValue31;
                }
                bool comparisonValue26 = (objectInstances.packedValues[productValue112] & 1us) != 0us;
                uint productValue120 = uint(objectInstances.packedValues[(bitwiseValue6 * 76u) + 54u]);
                uint bitwiseValue14 = (objectInstances_2.packedValues[productValue109] >> 2u) + ((bitwiseValue4 >> 15u) & 32767u);
                float branchMergedValue13;
                float branchMergedValue29;
                float branchMergedValue30;
                float branchMergedValue31;
                float branchMergedValue32;
                float branchMergedValue33;
                float branchMergedValue34;
                float branchMergedValue35;
                if ((intermediateValue57 > quotientValue) && (comparisonValue26 && (floatBitsToUint(ViewCB.packedValues[86u]).y != 0u)))
                {
                    uint sumValue78 = productValue120 + 0u;
                    uint productValue124 = bitwiseValue14 * 8u;
                    f16vec3 sumValue79 = uint16BitsToFloat16(u16vec3(faceIrradianceCache[nonuniformEXT(sumValue78)].packedValues[productValue124], faceIrradianceCache[nonuniformEXT(sumValue78)].packedValues[productValue124 + 1u], faceIrradianceCache[nonuniformEXT(sumValue78)].packedValues[productValue124 + 2u]));
                    branchMergedValue13 = intermediateValue57;
                    branchMergedValue29 = 0.0;
                    branchMergedValue30 = intermediateValue73;
                    branchMergedValue31 = intermediateValue71;
                    branchMergedValue32 = intermediateValue69;
                    branchMergedValue33 = float(sumValue79.z) * intermediateValue73;
                    branchMergedValue34 = float(sumValue79.y) * intermediateValue71;
                    branchMergedValue35 = float(sumValue79.x) * intermediateValue69;
                }
                else
                {
                    uint productValue125 = bitwiseValue6 * 38u;
                    vec4 reinterpretedBits14 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue125], objectInstances_2.packedValues[productValue125 + 1u], objectInstances_2.packedValues[productValue125 + 2u], objectInstances_2.packedValues[productValue125 + 3u]));
                    float intermediateValue78 = reinterpretedBits14.x;
                    float intermediateValue79 = reinterpretedBits14.y;
                    float intermediateValue80 = reinterpretedBits14.z;
                    uint productValue126 = (bitwiseValue6 * 38u) + 4u;
                    vec4 reinterpretedBits15 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue126], objectInstances_2.packedValues[productValue126 + 1u], objectInstances_2.packedValues[productValue126 + 2u], objectInstances_2.packedValues[productValue126 + 3u]));
                    float intermediateValue81 = reinterpretedBits15.x;
                    float intermediateValue82 = reinterpretedBits15.y;
                    float intermediateValue83 = reinterpretedBits15.z;
                    uint productValue127 = (bitwiseValue6 * 38u) + 8u;
                    vec4 reinterpretedBits16 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue127], objectInstances_2.packedValues[productValue127 + 1u], objectInstances_2.packedValues[productValue127 + 2u], objectInstances_2.packedValues[productValue127 + 3u]));
                    float intermediateValue84 = reinterpretedBits16.x;
                    float intermediateValue85 = reinterpretedBits16.y;
                    float intermediateValue86 = reinterpretedBits16.z;
                    uint productValue128 = (bitwiseValue6 * 38u) + 24u;
                    uint productValue129 = (bitwiseValue6 * 76u) + 72u;
                    uint bitwiseValue15 = ((bitwiseValue4 >> 13u) & 2u) | ((bitwiseValue4 >> 13u) & 131068u);
                    uint bitwiseValue16 = bitwiseValue15 | 1u;
                    uint bitwiseValue17 = bitwiseValue15 ^ 2u;
                    uint intermediateValue[3];
                    intermediateValue[0u] = bitwiseValue15;
                    intermediateValue[1u] = bitwiseValue16;
                    intermediateValue[2u] = bitwiseValue17;
                    uint sumValue80 = productValue120 + 0u;
                    uint productValue130 = bitwiseValue14 * 4u;
                    precise float bitwiseValue18 = float(faceDataBuffersRW_2[nonuniformEXT(sumValue80)].packedValues[productValue130] & 1023u) * 0.00195503421127796173095703125;
                    precise float sumValue81 = bitwiseValue18 + (-1.0);
                    precise float bitwiseValue19 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue80)].packedValues[productValue130] >> 10u) & 1023u) * 0.00195503421127796173095703125;
                    precise float sumValue82 = bitwiseValue19 + (-1.0);
                    precise float bitwiseValue20 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue80)].packedValues[productValue130] >> 20u) & 1023u) * 0.00195503421127796173095703125;
                    precise float sumValue83 = bitwiseValue20 + (-1.0);
                    precise float sumValue84 = 1.0 - intermediateValue55;
                    precise float sumValue85 = sumValue84 - intermediateValue56;
                    float intermediateValue1[3];
                    intermediateValue1[0u] = sumValue85;
                    intermediateValue1[1u] = intermediateValue55;
                    intermediateValue1[2u] = intermediateValue56;
                    uint sumValue86 = productValue120 + 0u;
                    uint productValue131 = uint(objectInstances.packedValues[(bitwiseValue6 * 76u) + 56u]);
                    uint productValue132 = productValue131 * (objectInstances_2.packedValues[productValue128] + bitwiseValue15);
                    uint bitwiseValue21 = uint(objectInstances.packedValues[(bitwiseValue6 * 76u) + 71u] & 255us);
                    uint bitwiseValue22 = (bitwiseValue21 + productValue132) >> 1u;
                    f16vec3 sumValue87 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue86)].packedValues[bitwiseValue22], vertexBuffers[nonuniformEXT(sumValue86)].packedValues[bitwiseValue22 + 1u], vertexBuffers[nonuniformEXT(sumValue86)].packedValues[bitwiseValue22 + 2u]));
                    uint bitwiseValue23 = uint(objectInstances.packedValues[productValue129] & 255us);
                    uint bitwiseValue24 = (bitwiseValue23 + productValue132) >> 2u;
                    uint bitwiseValue25 = uint(objectInstances.packedValues[productValue129] >> 8us);
                    uint bitwiseValue26 = (bitwiseValue25 + productValue132) >> 2u;
                    bool intermediateValue87 = int16_t(objectInstances.packedValues[productValue112]) < int16_t(0us);
                    float bitwiseValue35;
                    float bitwiseValue36;
                    if (intermediateValue87)
                    {
                        uint bitwiseValue34 = vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue26] >> 15u;
                        bitwiseValue35 = ((float(bitwiseValue34 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue26] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                        bitwiseValue36 = ((float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue26] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue34 & 65534u) * 1.525902189314365386962890625e-05);
                    }
                    else
                    {
                        bitwiseValue35 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue26] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        bitwiseValue36 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue26] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                    }
                    uint intermediateValue99;
                    if ((objectInstances.packedValues[productValue112] & 256us) == 0us)
                    {
                        intermediateValue99 = 0u;
                    }
                    else
                    {
                        intermediateValue99 = vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[(uint(objectInstances.packedValues[(bitwiseValue6 * 76u) + 74u] >> 8us) + productValue132) >> 2u] & 65535u;
                    }
                    precise float productValue148 = sumValue85 * float(sumValue87.x);
                    precise float productValue149 = sumValue85 * float(sumValue87.y);
                    precise float productValue150 = sumValue85 * float(sumValue87.z);
                    precise float sumValue103 = productValue148 + 0.0;
                    precise float sumValue104 = productValue149 + 0.0;
                    precise float sumValue105 = productValue150 + 0.0;
                    uint productValue151 = productValue131 * (objectInstances_2.packedValues[productValue128] + bitwiseValue16);
                    uint bitwiseValue44 = (bitwiseValue21 + productValue151) >> 1u;
                    f16vec3 sumValue106 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue86)].packedValues[bitwiseValue44], vertexBuffers[nonuniformEXT(sumValue86)].packedValues[bitwiseValue44 + 1u], vertexBuffers[nonuniformEXT(sumValue86)].packedValues[bitwiseValue44 + 2u]));
                    uint bitwiseValue45 = (bitwiseValue23 + productValue151) >> 2u;
                    uint bitwiseValue46 = (bitwiseValue25 + productValue151) >> 2u;
                    float bitwiseValue48;
                    float bitwiseValue49;
                    if (intermediateValue87)
                    {
                        uint bitwiseValue47 = vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue46] >> 15u;
                        bitwiseValue48 = ((float(bitwiseValue47 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue46] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                        bitwiseValue49 = ((float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue46] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue47 & 65534u) * 1.525902189314365386962890625e-05);
                    }
                    else
                    {
                        bitwiseValue48 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue46] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        bitwiseValue49 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue46] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                    }
                    precise float productValue164 = intermediateValue55 * float(sumValue106.x);
                    precise float productValue165 = intermediateValue55 * float(sumValue106.y);
                    precise float productValue166 = intermediateValue55 * float(sumValue106.z);
                    precise float sumValue111 = sumValue103 + productValue164;
                    precise float sumValue112 = sumValue104 + productValue165;
                    precise float sumValue113 = sumValue105 + productValue166;
                    uint productValue167 = productValue131 * (objectInstances_2.packedValues[productValue128] + bitwiseValue17);
                    uint bitwiseValue50 = (bitwiseValue21 + productValue167) >> 1u;
                    f16vec3 sumValue114 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue86)].packedValues[bitwiseValue50], vertexBuffers[nonuniformEXT(sumValue86)].packedValues[bitwiseValue50 + 1u], vertexBuffers[nonuniformEXT(sumValue86)].packedValues[bitwiseValue50 + 2u]));
                    uint bitwiseValue51 = (bitwiseValue23 + productValue167) >> 2u;
                    uint bitwiseValue52 = (bitwiseValue25 + productValue167) >> 2u;
                    float bitwiseValue54;
                    float bitwiseValue55;
                    if (intermediateValue87)
                    {
                        uint bitwiseValue53 = vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue52] >> 15u;
                        bitwiseValue54 = ((float(bitwiseValue53 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue52] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                        bitwiseValue55 = ((float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue52] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue53 & 65534u) * 1.525902189314365386962890625e-05);
                    }
                    else
                    {
                        bitwiseValue54 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue52] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                        bitwiseValue55 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue52] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                    }
                    precise float productValue168 = intermediateValue56 * float(sumValue114.x);
                    precise float productValue169 = intermediateValue56 * float(sumValue114.y);
                    precise float productValue170 = intermediateValue56 * float(sumValue114.z);
                    precise float sumValue115 = sumValue111 + productValue168;
                    precise float sumValue116 = sumValue112 + productValue169;
                    precise float sumValue117 = sumValue113 + productValue170;
                    float productValue171 = ((bitwiseValue48 * intermediateValue55) + (bitwiseValue35 * sumValue85)) + (bitwiseValue54 * intermediateValue56);
                    float productValue172 = ((bitwiseValue49 * intermediateValue55) + (bitwiseValue36 * sumValue85)) + (bitwiseValue55 * intermediateValue56);
                    float bitwiseValue56 = (((float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue45] & 255u) * intermediateValue55) + (float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue24] & 255u) * sumValue85)) + (float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue51] & 255u) * intermediateValue56)) * 0.0039215688593685626983642578125;
                    float bitwiseValue57 = (((float((vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue45] >> 8u) & 255u) * intermediateValue55) + (float((vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue24] >> 8u) & 255u) * sumValue85)) + (float((vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue51] >> 8u) & 255u) * intermediateValue56)) * 0.0039215688593685626983642578125;
                    float bitwiseValue58 = (((float((vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue45] >> 16u) & 255u) * intermediateValue55) + (float((vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue24] >> 16u) & 255u) * sumValue85)) + (float((vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue51] >> 16u) & 255u) * intermediateValue56)) * 0.0039215688593685626983642578125;
                    float bitwiseValue59 = (((float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue45] >> 24u) * intermediateValue55) + (float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue24] >> 24u) * sumValue85)) + (float(vertexBuffers_2[nonuniformEXT(sumValue86)].packedValues[bitwiseValue51] >> 24u) * intermediateValue56)) * 0.0039215688593685626983642578125;
                    precise float productValue173 = intermediateValue78 * sumValue115;
                    precise float productValue174 = sumValue116 * intermediateValue79;
                    precise float sumValue118 = productValue174 + productValue173;
                    precise float productValue175 = sumValue117 * intermediateValue80;
                    precise float sumValue119 = productValue175 + sumValue118;
                    precise float productValue176 = 1.0 * reinterpretedBits14.w;
                    precise float sumValue120 = productValue176 + sumValue119;
                    precise float productValue177 = intermediateValue81 * sumValue115;
                    precise float productValue178 = sumValue116 * intermediateValue82;
                    precise float sumValue121 = productValue178 + productValue177;
                    precise float productValue179 = sumValue117 * intermediateValue83;
                    precise float sumValue122 = productValue179 + sumValue121;
                    precise float productValue180 = 1.0 * reinterpretedBits15.w;
                    precise float sumValue123 = productValue180 + sumValue122;
                    precise float productValue181 = intermediateValue84 * sumValue115;
                    precise float productValue182 = sumValue116 * intermediateValue85;
                    precise float sumValue124 = productValue182 + productValue181;
                    precise float productValue183 = sumValue117 * intermediateValue86;
                    precise float sumValue125 = productValue183 + sumValue124;
                    precise float productValue184 = 1.0 * reinterpretedBits16.w;
                    precise float sumValue126 = productValue184 + sumValue125;
                    precise float productValue185 = intermediateValue78 * sumValue81;
                    precise float productValue186 = sumValue82 * intermediateValue79;
                    precise float sumValue127 = productValue186 + productValue185;
                    precise float productValue187 = sumValue83 * intermediateValue80;
                    precise float sumValue128 = productValue187 + sumValue127;
                    precise float productValue188 = intermediateValue81 * sumValue81;
                    precise float productValue189 = sumValue82 * intermediateValue82;
                    precise float sumValue129 = productValue189 + productValue188;
                    precise float productValue190 = sumValue83 * intermediateValue83;
                    precise float sumValue130 = productValue190 + sumValue129;
                    precise float productValue191 = intermediateValue84 * sumValue81;
                    precise float productValue192 = sumValue82 * intermediateValue85;
                    precise float sumValue131 = productValue192 + productValue191;
                    precise float productValue193 = sumValue83 * intermediateValue86;
                    precise float sumValue132 = productValue193 + sumValue131;
                    float inverseLengthValue6 = inversesqrt(dot(vec3(sumValue128, sumValue130, sumValue132), vec3(sumValue128, sumValue130, sumValue132)));
                    precise float productValue194 = sumValue128 * inverseLengthValue6;
                    precise float productValue195 = sumValue130 * inverseLengthValue6;
                    precise float productValue196 = sumValue132 * inverseLengthValue6;
                    bool dotProductValue3 = dot(vec3(intermediateValue28, intermediateValue29, intermediateValue30), vec3(productValue194, productValue195, productValue196)) > 0.0;
                    precise float sumValue133 = (-0.0) - productValue194;
                    precise float sumValue134 = (-0.0) - productValue195;
                    precise float sumValue135 = (-0.0) - productValue196;
                    float comparisonValue32 = dotProductValue3 ? sumValue133 : productValue194;
                    float comparisonValue33 = dotProductValue3 ? sumValue134 : productValue195;
                    float comparisonValue34 = dotProductValue3 ? sumValue135 : productValue196;
                    float intermediateValue115;
                    float intermediateValue116;
                    float intermediateValue117;
                    if (comparisonValue26 && (floatBitsToUint(ViewCB.packedValues[86u]).y != 0u))
                    {
                        uint sumValue136 = productValue120 + 0u;
                        float sumValue137;
                        float sumValue138;
                        float sumValue139;
                        uint sumValue140;
                        float intermediateValue118 = sumValue85;
                        uint intermediateValue119 = bitwiseValue15;
                        float intermediateValue120 = 0.0;
                        float intermediateValue121 = 0.0;
                        float intermediateValue122 = 0.0;
                        uint intermediateValue123 = 0u;
                        f16vec3 sumValue142;
                        f16vec3 sumValue143;
                        for (;;)
                        {
                            uint sumValue141 = intermediateValue119 + objectInstances_2.packedValues[productValue109];
                            uint productValue197 = sumValue141 * 8u;
                            sumValue142 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue136)].packedValues[productValue197], vertexIrradianceCache[nonuniformEXT(sumValue136)].packedValues[productValue197 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue136)].packedValues[productValue197 + 2u]));
                            uint productValue198 = (sumValue141 * 8u) + 4u;
                            sumValue143 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue136)].packedValues[productValue198], vertexIrradianceCache[nonuniformEXT(sumValue136)].packedValues[productValue198 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue136)].packedValues[productValue198 + 2u]));
                            float16_t intermediateValue128;
                            float16_t intermediateValue129;
                            float16_t intermediateValue130;
                            if (dotProductValue3)
                            {
                                intermediateValue128 = sumValue143.x;
                                intermediateValue129 = sumValue143.y;
                                intermediateValue130 = sumValue143.z;
                            }
                            else
                            {
                                intermediateValue128 = sumValue142.x;
                                intermediateValue129 = sumValue142.y;
                                intermediateValue130 = sumValue142.z;
                            }
                            precise float productValue199 = float(intermediateValue130) * intermediateValue118;
                            precise float productValue200 = float(intermediateValue129) * intermediateValue118;
                            precise float productValue201 = float(intermediateValue128) * intermediateValue118;
                            sumValue137 = productValue201 + intermediateValue120;
                            sumValue138 = productValue200 + intermediateValue121;
                            sumValue139 = productValue199 + intermediateValue122;
                            sumValue140 = intermediateValue123 + 1u;
                            if (sumValue140 == 3u)
                            {
                                break;
                            }
                            intermediateValue118 = intermediateValue1[sumValue140];
                            intermediateValue119 = intermediateValue[sumValue140];
                            intermediateValue120 = sumValue137;
                            intermediateValue121 = sumValue138;
                            intermediateValue122 = sumValue139;
                            intermediateValue123 = sumValue140;
                            continue;
                        }
                        intermediateValue115 = sumValue137;
                        intermediateValue116 = sumValue138;
                        intermediateValue117 = sumValue139;
                    }
                    else
                    {
                        intermediateValue115 = 0.0;
                        intermediateValue116 = 0.0;
                        intermediateValue117 = 0.0;
                    }
                    vec2 reinterpretedBits19 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[intermediateValue99 * 8u]);
                    vec2 reinterpretedBits20 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue99 * 8u) + 1u]);
                    float reinterpretedBits21 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue99 * 16u) + 13u]);
                    float reinterpretedBits22 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue99 * 16u) + 14u]);
                    float nonlinearValue4 = spvNMax(0.0, log2(abs((ViewCB.packedValues[89u].y * intermediateValue5) + (productValue12 * 0.100000001490116119384765625))) + float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(sumValue80)].packedValues[(bitwiseValue14 * 8u) + 6u])));
                    uint reinterpretedBits23;
                    if (objectInstances.packedValues[productValue110] > 4095us)
                    {
                        reinterpretedBits23 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits23 = uint(objectInstances.packedValues[productValue110]);
                    }
                    uint sumValue144 = reinterpretedBits23 + 0u;
                    float intermediateValue124;
                    float intermediateValue125;
                    float intermediateValue126;
                    float intermediateValue127;
                    if (objectInstances.packedValues[productValue110] == 65535us)
                    {
                        intermediateValue124 = 1.0;
                        intermediateValue125 = 1.0;
                        intermediateValue126 = 1.0;
                        intermediateValue127 = 1.0;
                    }
                    else
                    {
                        vec4 sampledTextureValue9 = textureLod(nonuniformEXT(sampler2D(textures[sumValue144], defaultSampler)), vec2(productValue171, productValue172), spvNMin(nonlinearValue4, reinterpretedBits21));
                        intermediateValue124 = sampledTextureValue9.x;
                        intermediateValue125 = sampledTextureValue9.y;
                        intermediateValue126 = sampledTextureValue9.z;
                        intermediateValue127 = sampledTextureValue9.w;
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
                    if ((objectInstances.packedValues[productValue112] & 1024us) == 0us)
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
                        if ((objectInstances.packedValues[productValue112] & 512us) == 0us)
                        {
                            float intermediateValue145;
                            float intermediateValue146;
                            float intermediateValue147;
                            float intermediateValue148;
                            if ((objectInstances.packedValues[productValue112] & 4us) == 0us)
                            {
                                intermediateValue145 = intermediateValue127;
                                intermediateValue146 = bitwiseValue56;
                                intermediateValue147 = bitwiseValue57;
                                intermediateValue148 = bitwiseValue58;
                            }
                            else
                            {
                                uint reinterpretedBits28;
                                if (objectInstances.packedValues[productValue111] > 4095us)
                                {
                                    reinterpretedBits28 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits28 = uint(objectInstances.packedValues[productValue111]);
                                }
                                vec4 sampledTextureValue10 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits28 + 0u], defaultSampler)), vec2(bitwiseValue56, bitwiseValue57), 0.0);
                                intermediateValue145 = 1.0;
                                intermediateValue146 = ((((sampledTextureValue10.x * 2.0) + (-1.0)) * bitwiseValue58) + 1.0) * bitwiseValue59;
                                intermediateValue147 = ((((sampledTextureValue10.y * 2.0) + (-1.0)) * bitwiseValue58) + 1.0) * bitwiseValue59;
                                intermediateValue148 = ((((sampledTextureValue10.z * 2.0) + (-1.0)) * bitwiseValue58) + 1.0) * bitwiseValue59;
                            }
                            float intermediateValue152;
                            float intermediateValue153;
                            float intermediateValue154;
                            if ((objectInstances.packedValues[productValue112] & 8192us) == 0us)
                            {
                                intermediateValue152 = intermediateValue146;
                                intermediateValue153 = intermediateValue147;
                                intermediateValue154 = intermediateValue148;
                            }
                            else
                            {
                                intermediateValue152 = ((1.0 - intermediateValue146) * intermediateValue145) + intermediateValue146;
                                intermediateValue153 = ((1.0 - intermediateValue147) * intermediateValue145) + intermediateValue147;
                                intermediateValue154 = ((1.0 - intermediateValue148) * intermediateValue145) + intermediateValue148;
                            }
                            float intermediateValue133;
                            if ((objectInstances.packedValues[productValue112] & 2048us) == 0us)
                            {
                                intermediateValue133 = intermediateValue145;
                            }
                            else
                            {
                                intermediateValue133 = spvNClamp(fma(intermediateValue145, 2.0, -1.0), 0.0, 1.0);
                            }
                            float bitwiseValue60 = (intermediateValue152 * intermediateValue124) * ((intermediateValue133 * ((float(objectInstances_2.packedValues[productValue113] >> 24u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                            float bitwiseValue61 = (intermediateValue153 * intermediateValue125) * ((intermediateValue133 * ((float((objectInstances_2.packedValues[productValue113] >> 16u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                            float bitwiseValue62 = (intermediateValue154 * intermediateValue126) * ((intermediateValue133 * ((float((objectInstances_2.packedValues[productValue113] >> 8u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                            float productValue202;
                            if (bitwiseValue60 < 0.040449999272823333740234375)
                            {
                                productValue202 = bitwiseValue60 * 0.077399380505084991455078125;
                            }
                            else
                            {
                                productValue202 = exp2(log2((bitwiseValue60 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                            }
                            float productValue203;
                            if (bitwiseValue61 < 0.040449999272823333740234375)
                            {
                                productValue203 = bitwiseValue61 * 0.077399380505084991455078125;
                            }
                            else
                            {
                                productValue203 = exp2(log2((bitwiseValue61 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                            }
                            float productValue204;
                            if (bitwiseValue62 < 0.040449999272823333740234375)
                            {
                                productValue204 = bitwiseValue62 * 0.077399380505084991455078125;
                            }
                            else
                            {
                                productValue204 = exp2(log2((bitwiseValue62 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                            }
                            float reinterpretedBits24;
                            float reinterpretedBits29;
                            float reinterpretedBits30;
                            if ((pbrTextureDataBuffer.packedValues[(intermediateValue99 * 16u) + 8u] & 1u) == 0u)
                            {
                                reinterpretedBits24 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue99 * 16u) + 11u]);
                                reinterpretedBits29 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue99 * 16u) + 9u]);
                                reinterpretedBits30 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue99 * 16u) + 10u]);
                            }
                            else
                            {
                                vec4 sampledTextureValue14 = textureLod(nonuniformEXT(sampler2D(textures[sumValue144], defaultSampler)), vec2(fma(productValue171, reinterpretedBits19.x, reinterpretedBits20.x), fma(productValue172, reinterpretedBits19.y, reinterpretedBits20.y)), spvNMin((reinterpretedBits22 - reinterpretedBits21) + nonlinearValue4, reinterpretedBits22));
                                reinterpretedBits24 = sampledTextureValue14.x;
                                reinterpretedBits29 = sampledTextureValue14.z;
                                reinterpretedBits30 = fma(sampledTextureValue14.y, sampledTextureValue14.y, 0.0);
                            }
                            float dotProductValue9 = dot(vec3(productValue202, productValue203, productValue204), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                            float productValue292 = (reinterpretedBits30 * 5.0) * ViewCB.packedValues[84u].w;
                            branchMergedValue16 = productValue292 * (((dotProductValue9 - productValue203) * ViewCB.packedValues[85u].x) + productValue203);
                            branchMergedValue40 = productValue292 * (((dotProductValue9 - productValue202) * ViewCB.packedValues[85u].x) + productValue202);
                            branchMergedValue41 = reinterpretedBits29 - (ViewCB.packedValues[85u].w * reinterpretedBits29);
                            branchMergedValue42 = intermediateValue133;
                            branchMergedValue43 = productValue204;
                            branchMergedValue44 = productValue203;
                            branchMergedValue45 = productValue202;
                            branchMergedValue46 = (reinterpretedBits24 * (productValue204 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                            branchMergedValue47 = (reinterpretedBits24 * (productValue203 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                            branchMergedValue48 = (reinterpretedBits24 * (productValue202 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                            branchMergedValue49 = productValue292 * (((dotProductValue9 - productValue204) * ViewCB.packedValues[85u].x) + productValue204);
                            branchMergedValue50 = reinterpretedBits24;
                        }
                        else
                        {
                            branchMergedValue16 = intermediateValue132;
                            branchMergedValue40 = intermediateValue132;
                            branchMergedValue41 = intermediateValue132;
                            branchMergedValue42 = intermediateValue132;
                            branchMergedValue43 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue126) * 1.39999997615814208984375);
                            branchMergedValue44 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue125) * 1.39999997615814208984375);
                            branchMergedValue45 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue124) * 1.39999997615814208984375);
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
                        intermediateValue142 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue124) * 1.7999999523162841796875);
                        intermediateValue143 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue125) * 1.7999999523162841796875);
                        intermediateValue144 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue126) * 1.7999999523162841796875);
                    }
                    float branchMergedValue68;
                    float branchMergedValue70;
                    float branchMergedValue71;
                    float branchMergedValue72;
                    float branchMergedValue73;
                    float branchMergedValue74;
                    float branchMergedValue75;
                    float branchMergedValue76;
                    if ((objectInstances.packedValues[productValue112] & 1536us) == 0us)
                    {
                        float productValue205 = (((1.0 - intermediateValue131) * 0.100000001490116119384765625) + intermediateValue131) * (1.0 - (intermediateValue134 * 0.800000011920928955078125));
                        float productValue206 = intermediateValue142 * productValue205;
                        float productValue207 = intermediateValue143 * productValue205;
                        float productValue208 = intermediateValue144 * productValue205;
                        float productValue209 = (productValue206 * intermediateValue115) + intermediateValue136;
                        float productValue210 = (productValue207 * intermediateValue116) + intermediateValue137;
                        float productValue211 = (productValue208 * intermediateValue117) + intermediateValue138;
                        precise float productValue212 = comparisonValue32 * 256.0;
                        uint intermediateValue149 = uint(int(productValue212));
                        precise float productValue213 = comparisonValue33 * 256.0;
                        uint intermediateValue150 = uint(int(productValue213));
                        precise float productValue214 = comparisonValue34 * 256.0;
                        uint intermediateValue151 = uint(int(productValue214));
                        precise float productValue215 = comparisonValue32 * 1.52587890625e-05;
                        precise float sumValue145 = sumValue120 + productValue215;
                        float reinterpretedBits25 = (abs(sumValue120) < 0.03125) ? sumValue145 : uintBitsToFloat(((sumValue120 < 0.0) ? (-intermediateValue149) : intermediateValue149) + floatBitsToUint(sumValue120));
                        precise float productValue216 = comparisonValue33 * 1.52587890625e-05;
                        precise float sumValue146 = sumValue123 + productValue216;
                        float reinterpretedBits26 = (abs(sumValue123) < 0.03125) ? sumValue146 : uintBitsToFloat(((sumValue123 < 0.0) ? (-intermediateValue150) : intermediateValue150) + floatBitsToUint(sumValue123));
                        precise float productValue217 = comparisonValue34 * 1.52587890625e-05;
                        precise float sumValue147 = sumValue126 + productValue217;
                        float reinterpretedBits27 = (abs(sumValue126) < 0.03125) ? sumValue147 : uintBitsToFloat(((sumValue126 < 0.0) ? (-intermediateValue151) : intermediateValue151) + floatBitsToUint(sumValue126));
                        float intermediateValue155;
                        float intermediateValue156;
                        float intermediateValue157;
                        if (dot(vec3(ViewCB.packedValues[52u].xyz), vec3(comparisonValue32, comparisonValue33, comparisonValue34)) < 0.0)
                        {
                            intermediateValue155 = 0.0;
                            intermediateValue156 = 0.0;
                            intermediateValue157 = 0.0;
                        }
                        else
                        {
                            rayQueryInitializeEXT(intermediateValue158, SceneBVH, 512u, 32u, vec3(reinterpretedBits25, reinterpretedBits26, reinterpretedBits27), 0.0, vec3(ViewCB.packedValues[53u].xyz), 10000.0);
                            bool intermediateValue159 = rayQueryProceedEXT(intermediateValue158);
                            if (intermediateValue159)
                            {
                                bool intermediateValue170;
                                bool comparisonValue38;
                                for (;;)
                                {
                                    uint intermediateValue161 = rayQueryGetIntersectionTypeEXT(intermediateValue158, bool(0u));
                                    comparisonValue38 = intermediateValue161 == 0u;
                                    if (comparisonValue38)
                                    {
                                        vec2 intermediateValue164 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue158, bool(0u));
                                        vec2 intermediateValue165 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue158, bool(0u));
                                        uint intermediateValue166 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue158, bool(0u));
                                        uint intermediateValue167 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue158, bool(0u));
                                        uint intermediateValue168 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue158, bool(0u));
                                        uint productValue236 = (intermediateValue168 * 76u) + 58u;
                                        uint productValue237 = (intermediateValue168 * 76u) + 61u;
                                        precise float sumValue156 = 1.0 - intermediateValue164.x;
                                        precise float sumValue157 = sumValue156 - intermediateValue165.y;
                                        uint bitwiseValue63 = (objectInstances_2.packedValues[(intermediateValue168 * 38u) + 25u] >> 2u) + (intermediateValue166 >> 1u);
                                        uint productValue238 = uint(objectInstances.packedValues[(intermediateValue168 * 76u) + 54u]) + 0u;
                                        bool comparisonValue39 = (intermediateValue166 & 1u) == 0u;
                                        uint comparisonValue40 = comparisonValue39 ? faceUvBuffersRW[nonuniformEXT(productValue238)].packedValues[bitwiseValue63].z : faceUvBuffersRW[nonuniformEXT(productValue238)].packedValues[bitwiseValue63].x;
                                        uint comparisonValue41 = comparisonValue39 ? faceUvBuffersRW[nonuniformEXT(productValue238)].packedValues[bitwiseValue63].y : faceUvBuffersRW[nonuniformEXT(productValue238)].packedValues[bitwiseValue63].w;
                                        uint comparisonValue42 = comparisonValue39 ? faceUvBuffersRW[nonuniformEXT(productValue238)].packedValues[bitwiseValue63].x : faceUvBuffersRW[nonuniformEXT(productValue238)].packedValues[bitwiseValue63].z;
                                        bool intermediateValue169 = int16_t(objectInstances.packedValues[productValue237]) < int16_t(0us);
                                        float intermediateValue192;
                                        float intermediateValue193;
                                        if (intermediateValue169)
                                        {
                                            uint bitwiseValue64 = comparisonValue42 >> 15u;
                                            precise float bitwiseValue65 = float(bitwiseValue64 & 1u) * 2.0;
                                            precise float sumValue174 = bitwiseValue65 + (-1.0);
                                            precise float bitwiseValue66 = float(comparisonValue42 >> 31u) * 2.0;
                                            precise float sumValue175 = bitwiseValue66 + (-1.0);
                                            precise float bitwiseValue67 = float((comparisonValue42 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue68 = float(bitwiseValue64 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue258 = sumValue174 * 3.0517578125e-05;
                                            precise float productValue259 = sumValue175 * 3.0517578125e-05;
                                            precise float sumValue176 = bitwiseValue67 + productValue258;
                                            precise float sumValue177 = bitwiseValue68 + productValue259;
                                            intermediateValue192 = sumValue176;
                                            intermediateValue193 = sumValue177;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue69 = float(comparisonValue42 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue70 = float(comparisonValue42 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue260 = bitwiseValue69 * 16384.0;
                                            precise float sumValue178 = productValue260 + 0.5;
                                            precise float productValue261 = bitwiseValue70 * 16384.0;
                                            precise float sumValue179 = productValue261 + 0.5;
                                            precise float productValue262 = floor(sumValue178) * 6.103515625e-05;
                                            precise float productValue263 = floor(sumValue179) * 6.103515625e-05;
                                            intermediateValue192 = productValue262;
                                            intermediateValue193 = productValue263;
                                        }
                                        precise float productValue264 = sumValue157 * intermediateValue192;
                                        precise float productValue265 = sumValue157 * intermediateValue193;
                                        precise float sumValue180 = productValue264 + 0.0;
                                        precise float sumValue181 = productValue265 + 0.0;
                                        float intermediateValue233;
                                        float intermediateValue234;
                                        if (intermediateValue169)
                                        {
                                            uint bitwiseValue71 = comparisonValue41 >> 15u;
                                            precise float bitwiseValue72 = float(bitwiseValue71 & 1u) * 2.0;
                                            precise float sumValue182 = bitwiseValue72 + (-1.0);
                                            precise float bitwiseValue73 = float(comparisonValue41 >> 31u) * 2.0;
                                            precise float sumValue183 = bitwiseValue73 + (-1.0);
                                            precise float bitwiseValue74 = float((comparisonValue41 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue75 = float(bitwiseValue71 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue266 = sumValue182 * 3.0517578125e-05;
                                            precise float productValue267 = sumValue183 * 3.0517578125e-05;
                                            precise float sumValue184 = bitwiseValue74 + productValue266;
                                            precise float sumValue185 = bitwiseValue75 + productValue267;
                                            intermediateValue233 = sumValue184;
                                            intermediateValue234 = sumValue185;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue76 = float(comparisonValue41 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue77 = float(comparisonValue41 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue268 = bitwiseValue76 * 16384.0;
                                            precise float sumValue186 = productValue268 + 0.5;
                                            precise float productValue269 = bitwiseValue77 * 16384.0;
                                            precise float sumValue187 = productValue269 + 0.5;
                                            precise float productValue270 = floor(sumValue186) * 6.103515625e-05;
                                            precise float productValue271 = floor(sumValue187) * 6.103515625e-05;
                                            intermediateValue233 = productValue270;
                                            intermediateValue234 = productValue271;
                                        }
                                        precise float productValue278 = intermediateValue164.x * intermediateValue233;
                                        precise float productValue279 = intermediateValue164.x * intermediateValue234;
                                        precise float sumValue192 = sumValue180 + productValue278;
                                        precise float sumValue193 = sumValue181 + productValue279;
                                        float intermediateValue254;
                                        float intermediateValue255;
                                        if (intermediateValue169)
                                        {
                                            uint bitwiseValue94 = comparisonValue40 >> 15u;
                                            precise float bitwiseValue95 = float(bitwiseValue94 & 1u) * 2.0;
                                            precise float sumValue206 = bitwiseValue95 + (-1.0);
                                            precise float bitwiseValue96 = float(comparisonValue40 >> 31u) * 2.0;
                                            precise float sumValue207 = bitwiseValue96 + (-1.0);
                                            precise float bitwiseValue97 = float((comparisonValue40 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue98 = float(bitwiseValue94 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue293 = sumValue206 * 3.0517578125e-05;
                                            precise float productValue294 = sumValue207 * 3.0517578125e-05;
                                            precise float sumValue208 = bitwiseValue97 + productValue293;
                                            precise float sumValue209 = bitwiseValue98 + productValue294;
                                            intermediateValue254 = sumValue208;
                                            intermediateValue255 = sumValue209;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue99 = float(comparisonValue40 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue100 = float(comparisonValue40 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue295 = bitwiseValue99 * 16384.0;
                                            precise float sumValue210 = productValue295 + 0.5;
                                            precise float productValue296 = bitwiseValue100 * 16384.0;
                                            precise float sumValue211 = productValue296 + 0.5;
                                            precise float productValue297 = floor(sumValue210) * 6.103515625e-05;
                                            precise float productValue298 = floor(sumValue211) * 6.103515625e-05;
                                            intermediateValue254 = productValue297;
                                            intermediateValue255 = productValue298;
                                        }
                                        precise float productValue306 = intermediateValue165.y * intermediateValue254;
                                        precise float productValue307 = intermediateValue165.y * intermediateValue255;
                                        precise float sumValue218 = sumValue192 + productValue306;
                                        precise float sumValue219 = sumValue193 + productValue307;
                                        float intermediateValue256;
                                        if (objectInstances.packedValues[productValue236] == 65535us)
                                        {
                                            intermediateValue256 = 1.0;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits31;
                                            if (objectInstances.packedValues[productValue236] > 4095us)
                                            {
                                                reinterpretedBits31 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits31 = uint(objectInstances.packedValues[productValue236]);
                                            }
                                            intermediateValue256 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits31 + 0u], defaultSampler)), vec2(sumValue218, sumValue219), -0.25).w;
                                        }
                                        uint comparisonValue62;
                                        if (intermediateValue167 == 2u)
                                        {
                                            comparisonValue62 = 0u;
                                        }
                                        else
                                        {
                                            comparisonValue62 = uint(intermediateValue256 <= (((objectInstances.packedValues[productValue237] & 4352us) != 0us) ? 0.5 : 0.0));
                                        }
                                        if (comparisonValue62 == 0u)
                                        {
                                            rayQueryConfirmIntersectionEXT(intermediateValue158);
                                        }
                                    }
                                    intermediateValue170 = rayQueryProceedEXT(intermediateValue158);
                                    if (intermediateValue170)
                                    {
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }
                            uint intermediateValue160 = rayQueryGetIntersectionTypeEXT(intermediateValue158, bool(1u));
                            float intermediateValue163;
                            if (intermediateValue160 == 1u)
                            {
                                float intermediateValue162 = rayQueryGetIntersectionTEXT(intermediateValue158, bool(1u));
                                intermediateValue163 = intermediateValue162;
                            }
                            else
                            {
                                intermediateValue163 = 10000.0;
                            }
                            float branchMergedValue17;
                            float branchMergedValue51;
                            float branchMergedValue52;
                            if (intermediateValue163 < 10000.0)
                            {
                                precise float productValue239 = intermediateValue163 * ViewCB.packedValues[63u].x;
                                precise float productValue240 = intermediateValue163 * ViewCB.packedValues[63u].y;
                                precise float productValue241 = intermediateValue163 * ViewCB.packedValues[63u].z;
                                precise float productValue242 = productValue239 * (-1.44269502162933349609375);
                                precise float productValue243 = productValue240 * (-1.44269502162933349609375);
                                precise float productValue244 = productValue241 * (-1.44269502162933349609375);
                                precise float productValue245 = ViewCB.packedValues[53u].x * intermediateValue163;
                                precise float sumValue158 = productValue245 + reinterpretedBits25;
                                precise float productValue246 = ViewCB.packedValues[53u].z * intermediateValue163;
                                precise float sumValue159 = productValue246 + reinterpretedBits27;
                                precise float productValue247 = sumValue158 * ViewCB.packedValues[83u].z;
                                precise float sumValue160 = productValue247 + ViewCB.packedValues[84u].x;
                                precise float productValue248 = sumValue159 * ViewCB.packedValues[83u].w;
                                precise float sumValue161 = productValue248 + ViewCB.packedValues[84u].y;
                                vec4 sampledTextureValue11 = textureLod(sampler2D(wibblyTexture, linearWrapSampler), vec2(sumValue160, sumValue161), 0.0);
                                precise float sumValue162 = sampledTextureValue11.x + (-0.5);
                                precise float sumValue163 = sampledTextureValue11.y + (-0.5);
                                precise float productValue249 = sumValue158 * ViewCB.packedValues[82u].z;
                                precise float sumValue164 = productValue249 + ViewCB.packedValues[83u].x;
                                precise float productValue250 = sumValue159 * ViewCB.packedValues[82u].w;
                                precise float sumValue165 = productValue250 + ViewCB.packedValues[83u].y;
                                precise float productValue251 = sumValue162 * 0.4000000059604644775390625;
                                precise float productValue252 = sumValue163 * 0.4000000059604644775390625;
                                precise float sumValue166 = sumValue164 + productValue251;
                                precise float sumValue167 = productValue252 + sumValue165;
                                precise float productValue253 = ViewCB.packedValues[68u].w * 63.0;
                                uint intermediateValue171 = uint(int(floor(productValue253)));
                                precise float productValue254 = float(int(intermediateValue171 + 1u)) * 0.015625;
                                precise float sumValue168 = (-0.0) - productValue254;
                                float intermediateValue172 = fract(abs(productValue254));
                                precise float sumValue169 = (-0.0) - intermediateValue172;
                                precise float comparisonValue43 = ((productValue254 >= sumValue168) ? intermediateValue172 : sumValue169) * 64.0;
                                vec4 sampledTextureValue12 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue166, sumValue167, float(int(intermediateValue171))), 0.0);
                                float intermediateValue173 = sampledTextureValue12.x;
                                precise float sampledTextureValue13 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue166, sumValue167, float(int(uint(int(comparisonValue43))))), 0.0).x - intermediateValue173;
                                precise float productValue255 = fract(productValue253) * sampledTextureValue13;
                                precise float sumValue170 = intermediateValue173 + productValue255;
                                precise float productValue256 = sumValue170 * 7.0;
                                precise float sumValue171 = productValue256 + 0.800000011920928955078125;
                                precise float productValue257 = intermediateValue163 * (-0.100000001490116119384765625);
                                precise float sumValue172 = sumValue171 + (-1.0);
                                precise float exponentialValue2 = exp2(productValue257) * sumValue172;
                                precise float sumValue173 = exponentialValue2 + 1.0;
                                precise float exponentialValue3 = exp2(productValue242) * sumValue173;
                                precise float exponentialValue4 = exp2(productValue243) * sumValue173;
                                precise float exponentialValue5 = exp2(productValue244) * sumValue173;
                                rayQueryInitializeEXT(intermediateValue174, SceneBVH, 512u, 22u, vec3(reinterpretedBits25, reinterpretedBits26, reinterpretedBits27), 0.0, vec3(ViewCB.packedValues[53u].xyz), intermediateValue163);
                                bool intermediateValue175 = rayQueryProceedEXT(intermediateValue174);
                                float intermediateValue178;
                                float intermediateValue180;
                                float intermediateValue182;
                                if (intermediateValue175)
                                {
                                    float intermediateValue179;
                                    float intermediateValue181;
                                    float intermediateValue183;
                                    float intermediateValue194 = exponentialValue3;
                                    float intermediateValue195 = exponentialValue4;
                                    float intermediateValue196 = exponentialValue5;
                                    bool comparisonValue46;
                                    for (;;)
                                    {
                                        uint intermediateValue197 = rayQueryGetIntersectionTypeEXT(intermediateValue174, bool(0u));
                                        comparisonValue46 = intermediateValue197 == 0u;
                                        float branchMergedValue;
                                        float branchMergedValue3;
                                        float branchMergedValue4;
                                        if (comparisonValue46)
                                        {
                                            vec2 intermediateValue204 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue174, bool(0u));
                                            vec2 intermediateValue205 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue174, bool(0u));
                                            float intermediateValue206 = rayQueryGetIntersectionTEXT(intermediateValue174, bool(0u));
                                            uint intermediateValue207 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue174, bool(0u));
                                            uint intermediateValue208 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue174, bool(0u));
                                            uint intermediateValue209 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue174, bool(0u));
                                            uint productValue272 = (intermediateValue209 * 76u) + 58u;
                                            uint productValue273 = (intermediateValue209 * 76u) + 61u;
                                            precise float sumValue188 = 1.0 - intermediateValue204.x;
                                            precise float sumValue189 = sumValue188 - intermediateValue205.y;
                                            uint bitwiseValue78 = (objectInstances_2.packedValues[(intermediateValue209 * 38u) + 25u] >> 2u) + (intermediateValue207 >> 1u);
                                            uint productValue274 = uint(objectInstances.packedValues[(intermediateValue209 * 76u) + 54u]) + 0u;
                                            bool comparisonValue48 = (intermediateValue207 & 1u) == 0u;
                                            uint comparisonValue49 = comparisonValue48 ? faceUvBuffersRW[nonuniformEXT(productValue274)].packedValues[bitwiseValue78].z : faceUvBuffersRW[nonuniformEXT(productValue274)].packedValues[bitwiseValue78].x;
                                            uint comparisonValue50 = comparisonValue48 ? faceUvBuffersRW[nonuniformEXT(productValue274)].packedValues[bitwiseValue78].y : faceUvBuffersRW[nonuniformEXT(productValue274)].packedValues[bitwiseValue78].w;
                                            uint comparisonValue51 = comparisonValue48 ? faceUvBuffersRW[nonuniformEXT(productValue274)].packedValues[bitwiseValue78].x : faceUvBuffersRW[nonuniformEXT(productValue274)].packedValues[bitwiseValue78].z;
                                            bool intermediateValue210 = int16_t(objectInstances.packedValues[productValue273]) < int16_t(0us);
                                            float intermediateValue239;
                                            float intermediateValue240;
                                            if (intermediateValue210)
                                            {
                                                uint bitwiseValue80 = comparisonValue51 >> 15u;
                                                precise float bitwiseValue81 = float(bitwiseValue80 & 1u) * 2.0;
                                                precise float sumValue194 = bitwiseValue81 + (-1.0);
                                                precise float bitwiseValue82 = float(comparisonValue51 >> 31u) * 2.0;
                                                precise float sumValue195 = bitwiseValue82 + (-1.0);
                                                precise float bitwiseValue83 = float((comparisonValue51 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue84 = float(bitwiseValue80 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue280 = sumValue194 * 3.0517578125e-05;
                                                precise float productValue281 = sumValue195 * 3.0517578125e-05;
                                                precise float sumValue196 = bitwiseValue83 + productValue280;
                                                precise float sumValue197 = bitwiseValue84 + productValue281;
                                                intermediateValue239 = sumValue196;
                                                intermediateValue240 = sumValue197;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue85 = float(comparisonValue51 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue86 = float(comparisonValue51 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue282 = bitwiseValue85 * 16384.0;
                                                precise float sumValue198 = productValue282 + 0.5;
                                                precise float productValue283 = bitwiseValue86 * 16384.0;
                                                precise float sumValue199 = productValue283 + 0.5;
                                                precise float productValue284 = floor(sumValue198) * 6.103515625e-05;
                                                precise float productValue285 = floor(sumValue199) * 6.103515625e-05;
                                                intermediateValue239 = productValue284;
                                                intermediateValue240 = productValue285;
                                            }
                                            precise float productValue299 = sumValue189 * intermediateValue239;
                                            precise float productValue300 = sumValue189 * intermediateValue240;
                                            precise float sumValue212 = productValue299 + 0.0;
                                            precise float sumValue213 = productValue300 + 0.0;
                                            float intermediateValue257;
                                            float intermediateValue258;
                                            if (intermediateValue210)
                                            {
                                                uint bitwiseValue102 = comparisonValue50 >> 15u;
                                                precise float bitwiseValue103 = float(bitwiseValue102 & 1u) * 2.0;
                                                precise float sumValue220 = bitwiseValue103 + (-1.0);
                                                precise float bitwiseValue104 = float(comparisonValue50 >> 31u) * 2.0;
                                                precise float sumValue221 = bitwiseValue104 + (-1.0);
                                                precise float bitwiseValue105 = float((comparisonValue50 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue106 = float(bitwiseValue102 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue308 = sumValue220 * 3.0517578125e-05;
                                                precise float productValue309 = sumValue221 * 3.0517578125e-05;
                                                precise float sumValue222 = bitwiseValue105 + productValue308;
                                                precise float sumValue223 = bitwiseValue106 + productValue309;
                                                intermediateValue257 = sumValue222;
                                                intermediateValue258 = sumValue223;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue107 = float(comparisonValue50 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue108 = float(comparisonValue50 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue310 = bitwiseValue107 * 16384.0;
                                                precise float sumValue224 = productValue310 + 0.5;
                                                precise float productValue311 = bitwiseValue108 * 16384.0;
                                                precise float sumValue225 = productValue311 + 0.5;
                                                precise float productValue312 = floor(sumValue224) * 6.103515625e-05;
                                                precise float productValue313 = floor(sumValue225) * 6.103515625e-05;
                                                intermediateValue257 = productValue312;
                                                intermediateValue258 = productValue313;
                                            }
                                            precise float productValue326 = intermediateValue204.x * intermediateValue257;
                                            precise float productValue327 = intermediateValue204.x * intermediateValue258;
                                            precise float sumValue238 = sumValue212 + productValue326;
                                            precise float sumValue239 = sumValue213 + productValue327;
                                            float intermediateValue263;
                                            float intermediateValue264;
                                            if (intermediateValue210)
                                            {
                                                uint bitwiseValue123 = comparisonValue49 >> 15u;
                                                precise float bitwiseValue124 = float(bitwiseValue123 & 1u) * 2.0;
                                                precise float sumValue244 = bitwiseValue124 + (-1.0);
                                                precise float bitwiseValue125 = float(comparisonValue49 >> 31u) * 2.0;
                                                precise float sumValue245 = bitwiseValue125 + (-1.0);
                                                precise float bitwiseValue126 = float((comparisonValue49 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue127 = float(bitwiseValue123 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue332 = sumValue244 * 3.0517578125e-05;
                                                precise float productValue333 = sumValue245 * 3.0517578125e-05;
                                                precise float sumValue246 = bitwiseValue126 + productValue332;
                                                precise float sumValue247 = bitwiseValue127 + productValue333;
                                                intermediateValue263 = sumValue246;
                                                intermediateValue264 = sumValue247;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue128 = float(comparisonValue49 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue129 = float(comparisonValue49 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue334 = bitwiseValue128 * 16384.0;
                                                precise float sumValue248 = productValue334 + 0.5;
                                                precise float productValue335 = bitwiseValue129 * 16384.0;
                                                precise float sumValue249 = productValue335 + 0.5;
                                                precise float productValue336 = floor(sumValue248) * 6.103515625e-05;
                                                precise float productValue337 = floor(sumValue249) * 6.103515625e-05;
                                                intermediateValue263 = productValue336;
                                                intermediateValue264 = productValue337;
                                            }
                                            precise float productValue350 = intermediateValue205.y * intermediateValue263;
                                            precise float productValue351 = intermediateValue205.y * intermediateValue264;
                                            precise float sumValue262 = sumValue238 + productValue350;
                                            precise float sumValue263 = sumValue239 + productValue351;
                                            precise float productValue352 = intermediateValue206 * 0.083333335816860198974609375;
                                            precise float sumValue264 = productValue352 + (-0.25);
                                            float intermediateValue269;
                                            float intermediateValue270;
                                            float intermediateValue271;
                                            float intermediateValue272;
                                            if (objectInstances.packedValues[productValue272] == 65535us)
                                            {
                                                intermediateValue269 = 1.0;
                                                intermediateValue270 = 1.0;
                                                intermediateValue271 = 1.0;
                                                intermediateValue272 = 1.0;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits32;
                                                if (objectInstances.packedValues[productValue272] > 4095us)
                                                {
                                                    reinterpretedBits32 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits32 = uint(objectInstances.packedValues[productValue272]);
                                                }
                                                vec4 sampledTextureValue15 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits32 + 0u], defaultSampler)), vec2(sumValue262, sumValue263), spvNMin(sumValue264, 2.0));
                                                intermediateValue269 = sampledTextureValue15.x;
                                                intermediateValue270 = sampledTextureValue15.y;
                                                intermediateValue271 = sampledTextureValue15.z;
                                                intermediateValue272 = sampledTextureValue15.w;
                                            }
                                            float intermediateValue279;
                                            float intermediateValue280;
                                            float intermediateValue281;
                                            if (intermediateValue208 == 2u)
                                            {
                                                float branchMergedValue26;
                                                float branchMergedValue53;
                                                float branchMergedValue54;
                                                if ((objectInstances.packedValues[productValue273] & 128us) == 0us)
                                                {
                                                    float intermediateValue289;
                                                    if ((objectInstances.packedValues[productValue273] & 2048us) == 0us)
                                                    {
                                                        intermediateValue289 = intermediateValue272;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue376 = intermediateValue272 * 2.0;
                                                        precise float sumValue290 = productValue376 + (-1.0);
                                                        intermediateValue289 = spvNClamp(sumValue290, 0.0, 1.0);
                                                    }
                                                    precise float sumValue287 = 0.0 - intermediateValue269;
                                                    precise float sumValue288 = 0.0 - intermediateValue270;
                                                    precise float sumValue289 = 0.0 - intermediateValue271;
                                                    precise float productValue373 = sumValue287 * intermediateValue289;
                                                    precise float productValue374 = sumValue288 * intermediateValue289;
                                                    precise float productValue375 = sumValue289 * intermediateValue289;
                                                    precise float sumValue281 = intermediateValue269 + productValue373;
                                                    precise float sumValue282 = intermediateValue270 + productValue374;
                                                    precise float sumValue283 = intermediateValue271 + productValue375;
                                                    branchMergedValue26 = sumValue283;
                                                    branchMergedValue53 = sumValue282;
                                                    branchMergedValue54 = sumValue281;
                                                }
                                                else
                                                {
                                                    branchMergedValue26 = 0.33399999141693115234375;
                                                    branchMergedValue53 = 0.33399999141693115234375;
                                                    branchMergedValue54 = 0.33399999141693115234375;
                                                }
                                                intermediateValue279 = branchMergedValue54;
                                                intermediateValue280 = branchMergedValue53;
                                                intermediateValue281 = branchMergedValue26;
                                            }
                                            else
                                            {
                                                precise float sumValue276 = 1.0 - intermediateValue272;
                                                intermediateValue279 = sumValue276;
                                                intermediateValue280 = sumValue276;
                                                intermediateValue281 = sumValue276;
                                            }
                                            precise float productValue367 = intermediateValue194 * intermediateValue279;
                                            precise float productValue368 = intermediateValue195 * intermediateValue280;
                                            precise float productValue369 = intermediateValue196 * intermediateValue281;
                                            float intermediateValue211;
                                            float intermediateValue212;
                                            float intermediateValue213;
                                            bool intermediateValue290;
                                            if (!(dot(vec3(productValue367, productValue368, productValue369), vec3(1.0)) <= 0.00999999977648258209228515625))
                                            {
                                                intermediateValue290 = false;
                                                intermediateValue211 = productValue367;
                                                intermediateValue212 = productValue368;
                                                intermediateValue213 = productValue369;
                                            }
                                            else
                                            {
                                                intermediateValue290 = true;
                                                intermediateValue211 = 0.0;
                                                intermediateValue212 = 0.0;
                                                intermediateValue213 = 0.0;
                                            }
                                            float branchMergedValue59;
                                            float branchMergedValue62;
                                            float branchMergedValue63;
                                            if (intermediateValue290)
                                            {
                                                rayQueryConfirmIntersectionEXT(intermediateValue174);
                                                branchMergedValue59 = intermediateValue213;
                                                branchMergedValue62 = intermediateValue212;
                                                branchMergedValue63 = intermediateValue211;
                                            }
                                            else
                                            {
                                                branchMergedValue59 = intermediateValue213;
                                                branchMergedValue62 = intermediateValue212;
                                                branchMergedValue63 = intermediateValue211;
                                            }
                                            branchMergedValue = branchMergedValue59;
                                            branchMergedValue3 = branchMergedValue62;
                                            branchMergedValue4 = branchMergedValue63;
                                        }
                                        else
                                        {
                                            branchMergedValue = intermediateValue196;
                                            branchMergedValue3 = intermediateValue195;
                                            branchMergedValue4 = intermediateValue194;
                                        }
                                        intermediateValue183 = branchMergedValue;
                                        intermediateValue181 = branchMergedValue3;
                                        intermediateValue179 = branchMergedValue4;
                                        bool intermediateValue214 = rayQueryProceedEXT(intermediateValue174);
                                        if (intermediateValue214)
                                        {
                                            intermediateValue194 = intermediateValue179;
                                            intermediateValue195 = intermediateValue181;
                                            intermediateValue196 = intermediateValue183;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue178 = intermediateValue179;
                                    intermediateValue180 = intermediateValue181;
                                    intermediateValue182 = intermediateValue183;
                                }
                                else
                                {
                                    intermediateValue178 = exponentialValue3;
                                    intermediateValue180 = exponentialValue4;
                                    intermediateValue182 = exponentialValue5;
                                }
                                uint intermediateValue184 = rayQueryGetIntersectionTypeEXT(intermediateValue174, bool(1u));
                                bool comparisonValue44 = intermediateValue184 == 1u;
                                float comparisonValue35 = comparisonValue44 ? 0.0 : intermediateValue178;
                                float comparisonValue36 = comparisonValue44 ? 0.0 : intermediateValue180;
                                float comparisonValue37 = comparisonValue44 ? 0.0 : intermediateValue182;
                                float branchMergedValue79;
                                float branchMergedValue80;
                                float branchMergedValue81;
                                if (dot(vec3(comparisonValue35, comparisonValue36, comparisonValue37), vec3(1.0)) > 0.00999999977648258209228515625)
                                {
                                    rayQueryInitializeEXT(intermediateValue198, SceneBVH, 512u, 22u, vec3(sumValue158, fma(ViewCB.packedValues[53u].y, intermediateValue163, reinterpretedBits26), sumValue159), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                                    bool intermediateValue199 = rayQueryProceedEXT(intermediateValue198);
                                    float intermediateValue215;
                                    float intermediateValue217;
                                    float intermediateValue219;
                                    if (intermediateValue199)
                                    {
                                        float intermediateValue216;
                                        float intermediateValue218;
                                        float intermediateValue220;
                                        float intermediateValue235 = comparisonValue35;
                                        float intermediateValue236 = comparisonValue36;
                                        float intermediateValue237 = comparisonValue37;
                                        bool comparisonValue57;
                                        for (;;)
                                        {
                                            uint intermediateValue238 = rayQueryGetIntersectionTypeEXT(intermediateValue198, bool(0u));
                                            comparisonValue57 = intermediateValue238 == 0u;
                                            float branchMergedValue2;
                                            float branchMergedValue7;
                                            float branchMergedValue8;
                                            if (comparisonValue57)
                                            {
                                                vec2 intermediateValue241 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue198, bool(0u));
                                                vec2 intermediateValue242 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue198, bool(0u));
                                                float intermediateValue243 = rayQueryGetIntersectionTEXT(intermediateValue198, bool(0u));
                                                uint intermediateValue244 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue198, bool(0u));
                                                uint intermediateValue245 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue198, bool(0u));
                                                uint intermediateValue246 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue198, bool(0u));
                                                uint productValue301 = (intermediateValue246 * 76u) + 58u;
                                                uint productValue302 = (intermediateValue246 * 76u) + 61u;
                                                precise float sumValue214 = 1.0 - intermediateValue241.x;
                                                precise float sumValue215 = sumValue214 - intermediateValue242.y;
                                                uint bitwiseValue101 = (objectInstances_2.packedValues[(intermediateValue246 * 38u) + 25u] >> 2u) + (intermediateValue244 >> 1u);
                                                uint productValue303 = uint(objectInstances.packedValues[(intermediateValue246 * 76u) + 54u]) + 0u;
                                                bool comparisonValue58 = (intermediateValue244 & 1u) == 0u;
                                                uint comparisonValue59 = comparisonValue58 ? faceUvBuffersRW[nonuniformEXT(productValue303)].packedValues[bitwiseValue101].z : faceUvBuffersRW[nonuniformEXT(productValue303)].packedValues[bitwiseValue101].x;
                                                uint comparisonValue60 = comparisonValue58 ? faceUvBuffersRW[nonuniformEXT(productValue303)].packedValues[bitwiseValue101].y : faceUvBuffersRW[nonuniformEXT(productValue303)].packedValues[bitwiseValue101].w;
                                                uint comparisonValue61 = comparisonValue58 ? faceUvBuffersRW[nonuniformEXT(productValue303)].packedValues[bitwiseValue101].x : faceUvBuffersRW[nonuniformEXT(productValue303)].packedValues[bitwiseValue101].z;
                                                bool intermediateValue247 = int16_t(objectInstances.packedValues[productValue302]) < int16_t(0us);
                                                float intermediateValue259;
                                                float intermediateValue260;
                                                if (intermediateValue247)
                                                {
                                                    uint bitwiseValue109 = comparisonValue61 >> 15u;
                                                    precise float bitwiseValue110 = float(bitwiseValue109 & 1u) * 2.0;
                                                    precise float sumValue226 = bitwiseValue110 + (-1.0);
                                                    precise float bitwiseValue111 = float(comparisonValue61 >> 31u) * 2.0;
                                                    precise float sumValue227 = bitwiseValue111 + (-1.0);
                                                    precise float bitwiseValue112 = float((comparisonValue61 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue113 = float(bitwiseValue109 & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue314 = sumValue226 * 3.0517578125e-05;
                                                    precise float productValue315 = sumValue227 * 3.0517578125e-05;
                                                    precise float sumValue228 = bitwiseValue112 + productValue314;
                                                    precise float sumValue229 = bitwiseValue113 + productValue315;
                                                    intermediateValue259 = sumValue228;
                                                    intermediateValue260 = sumValue229;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue114 = float(comparisonValue61 & 65535u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue115 = float(comparisonValue61 >> 16u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue316 = bitwiseValue114 * 16384.0;
                                                    precise float sumValue230 = productValue316 + 0.5;
                                                    precise float productValue317 = bitwiseValue115 * 16384.0;
                                                    precise float sumValue231 = productValue317 + 0.5;
                                                    precise float productValue318 = floor(sumValue230) * 6.103515625e-05;
                                                    precise float productValue319 = floor(sumValue231) * 6.103515625e-05;
                                                    intermediateValue259 = productValue318;
                                                    intermediateValue260 = productValue319;
                                                }
                                                precise float productValue328 = sumValue215 * intermediateValue259;
                                                precise float productValue329 = sumValue215 * intermediateValue260;
                                                precise float sumValue240 = productValue328 + 0.0;
                                                precise float sumValue241 = productValue329 + 0.0;
                                                float intermediateValue265;
                                                float intermediateValue266;
                                                if (intermediateValue247)
                                                {
                                                    uint bitwiseValue130 = comparisonValue60 >> 15u;
                                                    precise float bitwiseValue131 = float(bitwiseValue130 & 1u) * 2.0;
                                                    precise float sumValue250 = bitwiseValue131 + (-1.0);
                                                    precise float bitwiseValue132 = float(comparisonValue60 >> 31u) * 2.0;
                                                    precise float sumValue251 = bitwiseValue132 + (-1.0);
                                                    precise float bitwiseValue133 = float((comparisonValue60 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue134 = float(bitwiseValue130 & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue338 = sumValue250 * 3.0517578125e-05;
                                                    precise float productValue339 = sumValue251 * 3.0517578125e-05;
                                                    precise float sumValue252 = bitwiseValue133 + productValue338;
                                                    precise float sumValue253 = bitwiseValue134 + productValue339;
                                                    intermediateValue265 = sumValue252;
                                                    intermediateValue266 = sumValue253;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue135 = float(comparisonValue60 & 65535u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue136 = float(comparisonValue60 >> 16u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue340 = bitwiseValue135 * 16384.0;
                                                    precise float sumValue254 = productValue340 + 0.5;
                                                    precise float productValue341 = bitwiseValue136 * 16384.0;
                                                    precise float sumValue255 = productValue341 + 0.5;
                                                    precise float productValue342 = floor(sumValue254) * 6.103515625e-05;
                                                    precise float productValue343 = floor(sumValue255) * 6.103515625e-05;
                                                    intermediateValue265 = productValue342;
                                                    intermediateValue266 = productValue343;
                                                }
                                                precise float productValue353 = intermediateValue241.x * intermediateValue265;
                                                precise float productValue354 = intermediateValue241.x * intermediateValue266;
                                                precise float sumValue265 = sumValue240 + productValue353;
                                                precise float sumValue266 = sumValue241 + productValue354;
                                                float intermediateValue277;
                                                float intermediateValue278;
                                                if (intermediateValue247)
                                                {
                                                    uint bitwiseValue144 = comparisonValue59 >> 15u;
                                                    precise float bitwiseValue145 = float(bitwiseValue144 & 1u) * 2.0;
                                                    precise float sumValue270 = bitwiseValue145 + (-1.0);
                                                    precise float bitwiseValue146 = float(comparisonValue59 >> 31u) * 2.0;
                                                    precise float sumValue271 = bitwiseValue146 + (-1.0);
                                                    precise float bitwiseValue147 = float((comparisonValue59 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue148 = float(bitwiseValue144 & 65534u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue358 = sumValue270 * 3.0517578125e-05;
                                                    precise float productValue359 = sumValue271 * 3.0517578125e-05;
                                                    precise float sumValue272 = bitwiseValue147 + productValue358;
                                                    precise float sumValue273 = bitwiseValue148 + productValue359;
                                                    intermediateValue277 = sumValue272;
                                                    intermediateValue278 = sumValue273;
                                                }
                                                else
                                                {
                                                    precise float bitwiseValue149 = float(comparisonValue59 & 65535u) * 1.525902189314365386962890625e-05;
                                                    precise float bitwiseValue150 = float(comparisonValue59 >> 16u) * 1.525902189314365386962890625e-05;
                                                    precise float productValue360 = bitwiseValue149 * 16384.0;
                                                    precise float sumValue274 = productValue360 + 0.5;
                                                    precise float productValue361 = bitwiseValue150 * 16384.0;
                                                    precise float sumValue275 = productValue361 + 0.5;
                                                    precise float productValue362 = floor(sumValue274) * 6.103515625e-05;
                                                    precise float productValue363 = floor(sumValue275) * 6.103515625e-05;
                                                    intermediateValue277 = productValue362;
                                                    intermediateValue278 = productValue363;
                                                }
                                                precise float productValue364 = intermediateValue242.y * intermediateValue277;
                                                precise float productValue365 = intermediateValue242.y * intermediateValue278;
                                                precise float sumValue277 = sumValue265 + productValue364;
                                                precise float sumValue278 = sumValue266 + productValue365;
                                                precise float productValue366 = intermediateValue243 * 0.083333335816860198974609375;
                                                precise float sumValue279 = productValue366 + (-0.25);
                                                float intermediateValue282;
                                                float intermediateValue283;
                                                float intermediateValue284;
                                                float intermediateValue285;
                                                if (objectInstances.packedValues[productValue301] == 65535us)
                                                {
                                                    intermediateValue282 = 1.0;
                                                    intermediateValue283 = 1.0;
                                                    intermediateValue284 = 1.0;
                                                    intermediateValue285 = 1.0;
                                                }
                                                else
                                                {
                                                    uint reinterpretedBits34;
                                                    if (objectInstances.packedValues[productValue301] > 4095us)
                                                    {
                                                        reinterpretedBits34 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                                    }
                                                    else
                                                    {
                                                        reinterpretedBits34 = uint(objectInstances.packedValues[productValue301]);
                                                    }
                                                    vec4 sampledTextureValue17 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits34 + 0u], defaultSampler)), vec2(sumValue277, sumValue278), spvNMin(sumValue279, 2.0));
                                                    intermediateValue282 = sampledTextureValue17.x;
                                                    intermediateValue283 = sampledTextureValue17.y;
                                                    intermediateValue284 = sampledTextureValue17.z;
                                                    intermediateValue285 = sampledTextureValue17.w;
                                                }
                                                float intermediateValue293;
                                                float intermediateValue294;
                                                float intermediateValue295;
                                                if (intermediateValue245 == 2u)
                                                {
                                                    float branchMergedValue28;
                                                    float branchMergedValue57;
                                                    float branchMergedValue58;
                                                    if ((objectInstances.packedValues[productValue302] & 128us) == 0us)
                                                    {
                                                        float intermediateValue296;
                                                        if ((objectInstances.packedValues[productValue302] & 2048us) == 0us)
                                                        {
                                                            intermediateValue296 = intermediateValue285;
                                                        }
                                                        else
                                                        {
                                                            precise float productValue387 = intermediateValue285 * 2.0;
                                                            precise float sumValue302 = productValue387 + (-1.0);
                                                            intermediateValue296 = spvNClamp(sumValue302, 0.0, 1.0);
                                                        }
                                                        precise float sumValue299 = 0.0 - intermediateValue282;
                                                        precise float sumValue300 = 0.0 - intermediateValue283;
                                                        precise float sumValue301 = 0.0 - intermediateValue284;
                                                        precise float productValue384 = sumValue299 * intermediateValue296;
                                                        precise float productValue385 = sumValue300 * intermediateValue296;
                                                        precise float productValue386 = sumValue301 * intermediateValue296;
                                                        precise float sumValue296 = intermediateValue282 + productValue384;
                                                        precise float sumValue297 = intermediateValue283 + productValue385;
                                                        precise float sumValue298 = intermediateValue284 + productValue386;
                                                        branchMergedValue28 = sumValue298;
                                                        branchMergedValue57 = sumValue297;
                                                        branchMergedValue58 = sumValue296;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue28 = 0.33399999141693115234375;
                                                        branchMergedValue57 = 0.33399999141693115234375;
                                                        branchMergedValue58 = 0.33399999141693115234375;
                                                    }
                                                    intermediateValue293 = branchMergedValue58;
                                                    intermediateValue294 = branchMergedValue57;
                                                    intermediateValue295 = branchMergedValue28;
                                                }
                                                else
                                                {
                                                    precise float sumValue291 = 1.0 - intermediateValue285;
                                                    intermediateValue293 = sumValue291;
                                                    intermediateValue294 = sumValue291;
                                                    intermediateValue295 = sumValue291;
                                                }
                                                precise float productValue381 = intermediateValue235 * intermediateValue293;
                                                precise float productValue382 = intermediateValue236 * intermediateValue294;
                                                precise float productValue383 = intermediateValue237 * intermediateValue295;
                                                float intermediateValue248;
                                                float intermediateValue249;
                                                float intermediateValue250;
                                                bool intermediateValue297;
                                                if (!(dot(vec3(productValue381, productValue382, productValue383), vec3(1.0)) <= 0.00999999977648258209228515625))
                                                {
                                                    intermediateValue297 = false;
                                                    intermediateValue248 = productValue381;
                                                    intermediateValue249 = productValue382;
                                                    intermediateValue250 = productValue383;
                                                }
                                                else
                                                {
                                                    intermediateValue297 = true;
                                                    intermediateValue248 = 0.0;
                                                    intermediateValue249 = 0.0;
                                                    intermediateValue250 = 0.0;
                                                }
                                                float branchMergedValue61;
                                                float branchMergedValue66;
                                                float branchMergedValue67;
                                                if (intermediateValue297)
                                                {
                                                    rayQueryConfirmIntersectionEXT(intermediateValue198);
                                                    branchMergedValue61 = intermediateValue248;
                                                    branchMergedValue66 = intermediateValue250;
                                                    branchMergedValue67 = intermediateValue249;
                                                }
                                                else
                                                {
                                                    branchMergedValue61 = intermediateValue248;
                                                    branchMergedValue66 = intermediateValue250;
                                                    branchMergedValue67 = intermediateValue249;
                                                }
                                                branchMergedValue2 = branchMergedValue61;
                                                branchMergedValue7 = branchMergedValue66;
                                                branchMergedValue8 = branchMergedValue67;
                                            }
                                            else
                                            {
                                                branchMergedValue2 = intermediateValue235;
                                                branchMergedValue7 = intermediateValue237;
                                                branchMergedValue8 = intermediateValue236;
                                            }
                                            intermediateValue216 = branchMergedValue2;
                                            intermediateValue220 = branchMergedValue7;
                                            intermediateValue218 = branchMergedValue8;
                                            bool intermediateValue251 = rayQueryProceedEXT(intermediateValue198);
                                            if (intermediateValue251)
                                            {
                                                intermediateValue235 = intermediateValue216;
                                                intermediateValue236 = intermediateValue218;
                                                intermediateValue237 = intermediateValue220;
                                                continue;
                                            }
                                            else
                                            {
                                                break;
                                            }
                                        }
                                        intermediateValue215 = intermediateValue216;
                                        intermediateValue217 = intermediateValue218;
                                        intermediateValue219 = intermediateValue220;
                                    }
                                    else
                                    {
                                        intermediateValue215 = comparisonValue35;
                                        intermediateValue217 = comparisonValue36;
                                        intermediateValue219 = comparisonValue37;
                                    }
                                    uint intermediateValue221 = rayQueryGetIntersectionTypeEXT(intermediateValue198, bool(1u));
                                    bool comparisonValue52 = intermediateValue221 == 1u;
                                    branchMergedValue79 = comparisonValue52 ? 0.0 : intermediateValue215;
                                    branchMergedValue80 = comparisonValue52 ? 0.0 : intermediateValue219;
                                    branchMergedValue81 = comparisonValue52 ? 0.0 : intermediateValue217;
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
                                rayQueryInitializeEXT(intermediateValue176, SceneBVH, 512u, 22u, vec3(reinterpretedBits25, reinterpretedBits26, reinterpretedBits27), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                                bool intermediateValue177 = rayQueryProceedEXT(intermediateValue176);
                                float intermediateValue185;
                                float intermediateValue187;
                                float intermediateValue189;
                                if (intermediateValue177)
                                {
                                    float intermediateValue186;
                                    float intermediateValue188;
                                    float intermediateValue190;
                                    float intermediateValue200 = 1.0;
                                    float intermediateValue201 = 1.0;
                                    float intermediateValue202 = 1.0;
                                    bool comparisonValue47;
                                    for (;;)
                                    {
                                        uint intermediateValue203 = rayQueryGetIntersectionTypeEXT(intermediateValue176, bool(0u));
                                        comparisonValue47 = intermediateValue203 == 0u;
                                        float branchMergedValue1;
                                        float branchMergedValue5;
                                        float branchMergedValue6;
                                        if (comparisonValue47)
                                        {
                                            vec2 intermediateValue222 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue176, bool(0u));
                                            vec2 intermediateValue223 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue176, bool(0u));
                                            float intermediateValue224 = rayQueryGetIntersectionTEXT(intermediateValue176, bool(0u));
                                            uint intermediateValue225 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue176, bool(0u));
                                            uint intermediateValue226 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue176, bool(0u));
                                            uint intermediateValue227 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue176, bool(0u));
                                            uint productValue275 = (intermediateValue227 * 76u) + 58u;
                                            uint productValue276 = (intermediateValue227 * 76u) + 61u;
                                            precise float sumValue190 = 1.0 - intermediateValue222.x;
                                            precise float sumValue191 = sumValue190 - intermediateValue223.y;
                                            uint bitwiseValue79 = (objectInstances_2.packedValues[(intermediateValue227 * 38u) + 25u] >> 2u) + (intermediateValue225 >> 1u);
                                            uint productValue277 = uint(objectInstances.packedValues[(intermediateValue227 * 76u) + 54u]) + 0u;
                                            bool comparisonValue53 = (intermediateValue225 & 1u) == 0u;
                                            uint comparisonValue54 = comparisonValue53 ? faceUvBuffersRW[nonuniformEXT(productValue277)].packedValues[bitwiseValue79].z : faceUvBuffersRW[nonuniformEXT(productValue277)].packedValues[bitwiseValue79].x;
                                            uint comparisonValue55 = comparisonValue53 ? faceUvBuffersRW[nonuniformEXT(productValue277)].packedValues[bitwiseValue79].y : faceUvBuffersRW[nonuniformEXT(productValue277)].packedValues[bitwiseValue79].w;
                                            uint comparisonValue56 = comparisonValue53 ? faceUvBuffersRW[nonuniformEXT(productValue277)].packedValues[bitwiseValue79].x : faceUvBuffersRW[nonuniformEXT(productValue277)].packedValues[bitwiseValue79].z;
                                            bool intermediateValue228 = int16_t(objectInstances.packedValues[productValue276]) < int16_t(0us);
                                            float intermediateValue252;
                                            float intermediateValue253;
                                            if (intermediateValue228)
                                            {
                                                uint bitwiseValue87 = comparisonValue56 >> 15u;
                                                precise float bitwiseValue88 = float(bitwiseValue87 & 1u) * 2.0;
                                                precise float sumValue200 = bitwiseValue88 + (-1.0);
                                                precise float bitwiseValue89 = float(comparisonValue56 >> 31u) * 2.0;
                                                precise float sumValue201 = bitwiseValue89 + (-1.0);
                                                precise float bitwiseValue90 = float((comparisonValue56 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue91 = float(bitwiseValue87 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue286 = sumValue200 * 3.0517578125e-05;
                                                precise float productValue287 = sumValue201 * 3.0517578125e-05;
                                                precise float sumValue202 = bitwiseValue90 + productValue286;
                                                precise float sumValue203 = bitwiseValue91 + productValue287;
                                                intermediateValue252 = sumValue202;
                                                intermediateValue253 = sumValue203;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue92 = float(comparisonValue56 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue93 = float(comparisonValue56 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue288 = bitwiseValue92 * 16384.0;
                                                precise float sumValue204 = productValue288 + 0.5;
                                                precise float productValue289 = bitwiseValue93 * 16384.0;
                                                precise float sumValue205 = productValue289 + 0.5;
                                                precise float productValue290 = floor(sumValue204) * 6.103515625e-05;
                                                precise float productValue291 = floor(sumValue205) * 6.103515625e-05;
                                                intermediateValue252 = productValue290;
                                                intermediateValue253 = productValue291;
                                            }
                                            precise float productValue304 = sumValue191 * intermediateValue252;
                                            precise float productValue305 = sumValue191 * intermediateValue253;
                                            precise float sumValue216 = productValue304 + 0.0;
                                            precise float sumValue217 = productValue305 + 0.0;
                                            float intermediateValue261;
                                            float intermediateValue262;
                                            if (intermediateValue228)
                                            {
                                                uint bitwiseValue116 = comparisonValue55 >> 15u;
                                                precise float bitwiseValue117 = float(bitwiseValue116 & 1u) * 2.0;
                                                precise float sumValue232 = bitwiseValue117 + (-1.0);
                                                precise float bitwiseValue118 = float(comparisonValue55 >> 31u) * 2.0;
                                                precise float sumValue233 = bitwiseValue118 + (-1.0);
                                                precise float bitwiseValue119 = float((comparisonValue55 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue120 = float(bitwiseValue116 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue320 = sumValue232 * 3.0517578125e-05;
                                                precise float productValue321 = sumValue233 * 3.0517578125e-05;
                                                precise float sumValue234 = bitwiseValue119 + productValue320;
                                                precise float sumValue235 = bitwiseValue120 + productValue321;
                                                intermediateValue261 = sumValue234;
                                                intermediateValue262 = sumValue235;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue121 = float(comparisonValue55 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue122 = float(comparisonValue55 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue322 = bitwiseValue121 * 16384.0;
                                                precise float sumValue236 = productValue322 + 0.5;
                                                precise float productValue323 = bitwiseValue122 * 16384.0;
                                                precise float sumValue237 = productValue323 + 0.5;
                                                precise float productValue324 = floor(sumValue236) * 6.103515625e-05;
                                                precise float productValue325 = floor(sumValue237) * 6.103515625e-05;
                                                intermediateValue261 = productValue324;
                                                intermediateValue262 = productValue325;
                                            }
                                            precise float productValue330 = intermediateValue222.x * intermediateValue261;
                                            precise float productValue331 = intermediateValue222.x * intermediateValue262;
                                            precise float sumValue242 = sumValue216 + productValue330;
                                            precise float sumValue243 = sumValue217 + productValue331;
                                            float intermediateValue267;
                                            float intermediateValue268;
                                            if (intermediateValue228)
                                            {
                                                uint bitwiseValue137 = comparisonValue54 >> 15u;
                                                precise float bitwiseValue138 = float(bitwiseValue137 & 1u) * 2.0;
                                                precise float sumValue256 = bitwiseValue138 + (-1.0);
                                                precise float bitwiseValue139 = float(comparisonValue54 >> 31u) * 2.0;
                                                precise float sumValue257 = bitwiseValue139 + (-1.0);
                                                precise float bitwiseValue140 = float((comparisonValue54 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue141 = float(bitwiseValue137 & 65534u) * 1.525902189314365386962890625e-05;
                                                precise float productValue344 = sumValue256 * 3.0517578125e-05;
                                                precise float productValue345 = sumValue257 * 3.0517578125e-05;
                                                precise float sumValue258 = bitwiseValue140 + productValue344;
                                                precise float sumValue259 = bitwiseValue141 + productValue345;
                                                intermediateValue267 = sumValue258;
                                                intermediateValue268 = sumValue259;
                                            }
                                            else
                                            {
                                                precise float bitwiseValue142 = float(comparisonValue54 & 65535u) * 1.525902189314365386962890625e-05;
                                                precise float bitwiseValue143 = float(comparisonValue54 >> 16u) * 1.525902189314365386962890625e-05;
                                                precise float productValue346 = bitwiseValue142 * 16384.0;
                                                precise float sumValue260 = productValue346 + 0.5;
                                                precise float productValue347 = bitwiseValue143 * 16384.0;
                                                precise float sumValue261 = productValue347 + 0.5;
                                                precise float productValue348 = floor(sumValue260) * 6.103515625e-05;
                                                precise float productValue349 = floor(sumValue261) * 6.103515625e-05;
                                                intermediateValue267 = productValue348;
                                                intermediateValue268 = productValue349;
                                            }
                                            precise float productValue355 = intermediateValue223.y * intermediateValue267;
                                            precise float productValue356 = intermediateValue223.y * intermediateValue268;
                                            precise float sumValue267 = sumValue242 + productValue355;
                                            precise float sumValue268 = sumValue243 + productValue356;
                                            precise float productValue357 = intermediateValue224 * 0.083333335816860198974609375;
                                            precise float sumValue269 = productValue357 + (-0.25);
                                            float intermediateValue273;
                                            float intermediateValue274;
                                            float intermediateValue275;
                                            float intermediateValue276;
                                            if (objectInstances.packedValues[productValue275] == 65535us)
                                            {
                                                intermediateValue273 = 1.0;
                                                intermediateValue274 = 1.0;
                                                intermediateValue275 = 1.0;
                                                intermediateValue276 = 1.0;
                                            }
                                            else
                                            {
                                                uint reinterpretedBits33;
                                                if (objectInstances.packedValues[productValue275] > 4095us)
                                                {
                                                    reinterpretedBits33 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                                }
                                                else
                                                {
                                                    reinterpretedBits33 = uint(objectInstances.packedValues[productValue275]);
                                                }
                                                vec4 sampledTextureValue16 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits33 + 0u], defaultSampler)), vec2(sumValue267, sumValue268), spvNMin(sumValue269, 2.0));
                                                intermediateValue273 = sampledTextureValue16.x;
                                                intermediateValue274 = sampledTextureValue16.y;
                                                intermediateValue275 = sampledTextureValue16.z;
                                                intermediateValue276 = sampledTextureValue16.w;
                                            }
                                            float intermediateValue286;
                                            float intermediateValue287;
                                            float intermediateValue288;
                                            if (intermediateValue226 == 2u)
                                            {
                                                float branchMergedValue27;
                                                float branchMergedValue55;
                                                float branchMergedValue56;
                                                if ((objectInstances.packedValues[productValue276] & 128us) == 0us)
                                                {
                                                    float intermediateValue291;
                                                    if ((objectInstances.packedValues[productValue276] & 2048us) == 0us)
                                                    {
                                                        intermediateValue291 = intermediateValue276;
                                                    }
                                                    else
                                                    {
                                                        precise float productValue380 = intermediateValue276 * 2.0;
                                                        precise float sumValue295 = productValue380 + (-1.0);
                                                        intermediateValue291 = spvNClamp(sumValue295, 0.0, 1.0);
                                                    }
                                                    precise float sumValue292 = 0.0 - intermediateValue273;
                                                    precise float sumValue293 = 0.0 - intermediateValue274;
                                                    precise float sumValue294 = 0.0 - intermediateValue275;
                                                    precise float productValue377 = sumValue292 * intermediateValue291;
                                                    precise float productValue378 = sumValue293 * intermediateValue291;
                                                    precise float productValue379 = sumValue294 * intermediateValue291;
                                                    precise float sumValue284 = intermediateValue273 + productValue377;
                                                    precise float sumValue285 = intermediateValue274 + productValue378;
                                                    precise float sumValue286 = intermediateValue275 + productValue379;
                                                    branchMergedValue27 = sumValue286;
                                                    branchMergedValue55 = sumValue285;
                                                    branchMergedValue56 = sumValue284;
                                                }
                                                else
                                                {
                                                    branchMergedValue27 = 0.33399999141693115234375;
                                                    branchMergedValue55 = 0.33399999141693115234375;
                                                    branchMergedValue56 = 0.33399999141693115234375;
                                                }
                                                intermediateValue286 = branchMergedValue56;
                                                intermediateValue287 = branchMergedValue55;
                                                intermediateValue288 = branchMergedValue27;
                                            }
                                            else
                                            {
                                                precise float sumValue280 = 1.0 - intermediateValue276;
                                                intermediateValue286 = sumValue280;
                                                intermediateValue287 = sumValue280;
                                                intermediateValue288 = sumValue280;
                                            }
                                            precise float productValue370 = intermediateValue200 * intermediateValue286;
                                            precise float productValue371 = intermediateValue201 * intermediateValue287;
                                            precise float productValue372 = intermediateValue202 * intermediateValue288;
                                            float intermediateValue229;
                                            float intermediateValue230;
                                            float intermediateValue231;
                                            bool intermediateValue292;
                                            if (!(dot(vec3(productValue370, productValue371, productValue372), vec3(1.0)) <= 0.00999999977648258209228515625))
                                            {
                                                intermediateValue292 = false;
                                                intermediateValue229 = productValue370;
                                                intermediateValue230 = productValue371;
                                                intermediateValue231 = productValue372;
                                            }
                                            else
                                            {
                                                intermediateValue292 = true;
                                                intermediateValue229 = 0.0;
                                                intermediateValue230 = 0.0;
                                                intermediateValue231 = 0.0;
                                            }
                                            float branchMergedValue60;
                                            float branchMergedValue64;
                                            float branchMergedValue65;
                                            if (intermediateValue292)
                                            {
                                                rayQueryConfirmIntersectionEXT(intermediateValue176);
                                                branchMergedValue60 = intermediateValue231;
                                                branchMergedValue64 = intermediateValue230;
                                                branchMergedValue65 = intermediateValue229;
                                            }
                                            else
                                            {
                                                branchMergedValue60 = intermediateValue231;
                                                branchMergedValue64 = intermediateValue230;
                                                branchMergedValue65 = intermediateValue229;
                                            }
                                            branchMergedValue1 = branchMergedValue60;
                                            branchMergedValue5 = branchMergedValue64;
                                            branchMergedValue6 = branchMergedValue65;
                                        }
                                        else
                                        {
                                            branchMergedValue1 = intermediateValue202;
                                            branchMergedValue5 = intermediateValue201;
                                            branchMergedValue6 = intermediateValue200;
                                        }
                                        intermediateValue190 = branchMergedValue1;
                                        intermediateValue188 = branchMergedValue5;
                                        intermediateValue186 = branchMergedValue6;
                                        bool intermediateValue232 = rayQueryProceedEXT(intermediateValue176);
                                        if (intermediateValue232)
                                        {
                                            intermediateValue200 = intermediateValue186;
                                            intermediateValue201 = intermediateValue188;
                                            intermediateValue202 = intermediateValue190;
                                            continue;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue185 = intermediateValue186;
                                    intermediateValue187 = intermediateValue188;
                                    intermediateValue189 = intermediateValue190;
                                }
                                else
                                {
                                    intermediateValue185 = 1.0;
                                    intermediateValue187 = 1.0;
                                    intermediateValue189 = 1.0;
                                }
                                uint intermediateValue191 = rayQueryGetIntersectionTypeEXT(intermediateValue176, bool(1u));
                                bool comparisonValue45 = intermediateValue191 == 1u;
                                branchMergedValue17 = comparisonValue45 ? 0.0 : intermediateValue185;
                                branchMergedValue51 = comparisonValue45 ? 0.0 : intermediateValue189;
                                branchMergedValue52 = comparisonValue45 ? 0.0 : intermediateValue187;
                            }
                            intermediateValue155 = branchMergedValue17;
                            intermediateValue156 = branchMergedValue52;
                            intermediateValue157 = branchMergedValue51;
                        }
                        float productValue230;
                        float productValue231;
                        float productValue232;
                        if (dot(vec3(intermediateValue155, intermediateValue156, intermediateValue157), vec3(1.0)) > 0.0)
                        {
                            float sumValue148 = (-0.0) - intermediateValue28;
                            float sumValue149 = (-0.0) - intermediateValue29;
                            float sumValue150 = (-0.0) - intermediateValue30;
                            float productValue218 = spvNMax((((1.0 - intermediateValue135) * 0.5) * spvNClamp(intermediateValue135 * 1.5, 0.0, 1.0)) + intermediateValue135, 0.00999999977648258209228515625);
                            float sumValue151 = ViewCB.packedValues[52u].x - intermediateValue28;
                            float sumValue152 = ViewCB.packedValues[52u].y - intermediateValue29;
                            float sumValue153 = ViewCB.packedValues[52u].z - intermediateValue30;
                            float inverseLengthValue7 = inversesqrt(dot(vec3(sumValue151, sumValue152, sumValue153), vec3(sumValue151, sumValue152, sumValue153)));
                            float productValue219 = inverseLengthValue7 * sumValue151;
                            float productValue220 = inverseLengthValue7 * sumValue152;
                            float productValue221 = inverseLengthValue7 * sumValue153;
                            float dotProductValue4 = spvNClamp(dot(vec3(comparisonValue32, comparisonValue33, comparisonValue34), vec3(ViewCB.packedValues[52u].xyz)), 0.0, 1.0);
                            float dotProductValue5 = spvNClamp(dot(vec3(comparisonValue32, comparisonValue33, comparisonValue34), vec3(sumValue148, sumValue149, sumValue150)), 0.0, 1.0);
                            float dotProductValue6 = spvNClamp(dot(vec3(comparisonValue32, comparisonValue33, comparisonValue34), vec3(productValue219, productValue220, productValue221)), 0.0, 1.0);
                            float dotProductValue7 = spvNClamp(dot(vec3(sumValue148, sumValue149, sumValue150), vec3(productValue219, productValue220, productValue221)), 0.0, 1.0);
                            float productValue222 = productValue218 * productValue218;
                            float productValue223 = productValue222 * productValue222;
                            float productValue224 = (((dotProductValue6 * productValue223) - dotProductValue6) * dotProductValue6) + 1.0;
                            float productValue225 = productValue222 * 0.5;
                            float sumValue154 = 1.0 - productValue225;
                            float dotProductValue8 = spvNClamp(dot(vec3(intermediateValue139, intermediateValue140, intermediateValue141), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0);
                            float exponentialValue = exp2(log2(spvNClamp(1.0 - dotProductValue7, 0.0, 1.0)) * 5.0);
                            float productValue226 = (exponentialValue * (dotProductValue8 - intermediateValue139)) + intermediateValue139;
                            float productValue227 = (exponentialValue * (dotProductValue8 - intermediateValue140)) + intermediateValue140;
                            float productValue228 = (exponentialValue * (dotProductValue8 - intermediateValue141)) + intermediateValue141;
                            float productValue229 = ((dotProductValue7 * dotProductValue7) * (productValue218 * 2.0)) + (-0.5);
                            float exponentialValue1 = (((exp2(log2(spvNClamp(1.0 - dotProductValue5, 0.0, 1.0)) * 5.0) * productValue229) + 1.0) * 0.3183098733425140380859375) * ((exp2(log2(spvNClamp(1.0 - dotProductValue4, 0.0, 1.0)) * 5.0) * productValue229) + 1.0);
                            float quotientValue6 = ((productValue223 / ((productValue224 * productValue224) + 1.0000000133514319600180897396058e-10)) * 0.3183098733425140380859375) * (0.25 / ((((dotProductValue5 * sumValue154) + productValue225) * ((dotProductValue4 * sumValue154) + productValue225)) + 1.0000000133514319600180897396058e-10));
                            productValue230 = (((ViewCB.packedValues[50u].x * intermediateValue155) * dotProductValue4) * ((((1.0 - productValue226) * productValue206) * exponentialValue1) + (productValue226 * quotientValue6))) + productValue209;
                            productValue231 = (((ViewCB.packedValues[50u].y * intermediateValue156) * dotProductValue4) * ((((1.0 - productValue227) * productValue207) * exponentialValue1) + (productValue227 * quotientValue6))) + productValue210;
                            productValue232 = (((ViewCB.packedValues[50u].z * intermediateValue157) * dotProductValue4) * ((((1.0 - productValue228) * productValue208) * exponentialValue1) + (productValue228 * quotientValue6))) + productValue211;
                        }
                        else
                        {
                            productValue230 = productValue209;
                            productValue231 = productValue210;
                            productValue232 = productValue211;
                        }
                        precise float productValue233 = intermediateValue73 * productValue232;
                        precise float productValue234 = intermediateValue71 * productValue231;
                        precise float productValue235 = intermediateValue69 * productValue230;
                        float multiplyAddValue2 = spvNClamp(fma(intermediateValue57 + intermediateValue5, ViewCB.packedValues[51u].x, ViewCB.packedValues[51u].y), 0.0, 1.0);
                        float sumValue155 = 1.0 - multiplyAddValue2;
                        branchMergedValue68 = intermediateValue57;
                        branchMergedValue70 = multiplyAddValue2;
                        branchMergedValue71 = intermediateValue73;
                        branchMergedValue72 = intermediateValue71;
                        branchMergedValue73 = intermediateValue69;
                        branchMergedValue74 = sumValue155 * productValue233;
                        branchMergedValue75 = sumValue155 * productValue234;
                        branchMergedValue76 = sumValue155 * productValue235;
                    }
                    else
                    {
                        branchMergedValue68 = intermediateValue57;
                        branchMergedValue70 = 1.0;
                        branchMergedValue71 = intermediateValue73;
                        branchMergedValue72 = intermediateValue71;
                        branchMergedValue73 = intermediateValue69;
                        branchMergedValue74 = intermediateValue144 * intermediateValue73;
                        branchMergedValue75 = intermediateValue143 * intermediateValue71;
                        branchMergedValue76 = intermediateValue142 * intermediateValue69;
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
                intermediateValue65 = branchMergedValue35;
                intermediateValue66 = branchMergedValue34;
                intermediateValue67 = branchMergedValue33;
                intermediateValue68 = branchMergedValue32;
                intermediateValue70 = branchMergedValue31;
                intermediateValue72 = branchMergedValue30;
                intermediateValue74 = branchMergedValue29;
                intermediateValue40 = branchMergedValue13;
            }
            else
            {
                intermediateValue65 = 0.0;
                intermediateValue66 = 0.0;
                intermediateValue67 = 0.0;
                intermediateValue68 = intermediateValue31;
                intermediateValue70 = intermediateValue31;
                intermediateValue72 = intermediateValue31;
                intermediateValue74 = 1.0;
                intermediateValue40 = ViewCB.packedValues[51u].z;
            }
            float productValue81;
            float productValue82;
            float productValue83;
            if (intermediateValue74 > 0.0)
            {
                uvec4 reinterpretedBits13 = floatBitsToUint(ViewCB.packedValues[75u]);
                uint intermediateValue75 = reinterpretedBits13.w;
                float intermediateValue88;
                float intermediateValue89;
                float intermediateValue90;
                if (intermediateValue75 == 1u)
                {
                    intermediateValue88 = ViewCB.packedValues[58u].x;
                    intermediateValue89 = ViewCB.packedValues[58u].y;
                    intermediateValue90 = ViewCB.packedValues[58u].z;
                }
                else
                {
                    float branchMergedValue14;
                    float branchMergedValue36;
                    float branchMergedValue37;
                    if (intermediateValue75 == 2u)
                    {
                        uvec4 intermediateValue91 = floatBitsToUint(ViewCB.packedValues[74u]);
                        uint intermediateValue92 = intermediateValue91.z;
                        uint reinterpretedBits17;
                        if (intermediateValue92 > 4095u)
                        {
                            reinterpretedBits17 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits17 = intermediateValue92;
                        }
                        float intermediateValue95 = abs(intermediateValue28);
                        float intermediateValue96 = abs(intermediateValue29);
                        float intermediateValue97 = abs(intermediateValue30);
                        float intermediateValue113;
                        float comparisonValue30;
                        float sumValue110;
                        if ((intermediateValue95 >= intermediateValue96) && (intermediateValue95 >= intermediateValue97))
                        {
                            intermediateValue113 = intermediateValue95;
                            comparisonValue30 = (intermediateValue28 < 0.0) ? ((-0.0) - intermediateValue30) : intermediateValue30;
                            sumValue110 = (-0.0) - intermediateValue29;
                        }
                        else
                        {
                            float sumValue107 = (-0.0) - intermediateValue28;
                            float branchMergedValue15;
                            float branchMergedValue38;
                            float branchMergedValue39;
                            if (!(intermediateValue96 >= intermediateValue97))
                            {
                                branchMergedValue15 = (-0.0) - intermediateValue29;
                                branchMergedValue38 = (intermediateValue30 < 0.0) ? intermediateValue28 : sumValue107;
                                branchMergedValue39 = intermediateValue97;
                            }
                            else
                            {
                                branchMergedValue15 = (intermediateValue29 < 0.0) ? ((-0.0) - intermediateValue30) : intermediateValue30;
                                branchMergedValue38 = sumValue107;
                                branchMergedValue39 = intermediateValue96;
                            }
                            intermediateValue113 = branchMergedValue39;
                            comparisonValue30 = branchMergedValue38;
                            sumValue110 = branchMergedValue15;
                        }
                        precise float quotientValue5 = 0.5 / intermediateValue113;
                        vec4 sampledTextureValue8 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits17 + 0u], linearSampler)), vec2(fract(fma(comparisonValue30, quotientValue5, 0.5) * ViewCB.packedValues[74u].x), fract(fma(sumValue110, quotientValue5, 0.5) * ViewCB.packedValues[74u].y)), 0.0);
                        branchMergedValue14 = (ViewCB.packedValues[58u].z * sampledTextureValue8.z) * ViewCB.packedValues[97u].w;
                        branchMergedValue36 = (ViewCB.packedValues[58u].y * sampledTextureValue8.y) * ViewCB.packedValues[97u].w;
                        branchMergedValue37 = (ViewCB.packedValues[58u].x * sampledTextureValue8.x) * ViewCB.packedValues[97u].w;
                    }
                    else
                    {
                        float branchMergedValue69;
                        float branchMergedValue77;
                        float branchMergedValue78;
                        if (intermediateValue75 == 4u)
                        {
                            float intermediateValue98 = (dot(vec3(intermediateValue28, intermediateValue29, intermediateValue30), vec3(ViewCB.packedValues[52u].xyz)) * 0.5) + 0.5;
                            branchMergedValue69 = ((ViewCB.packedValues[75u].z - ViewCB.packedValues[76u].z) * intermediateValue98) + ViewCB.packedValues[76u].z;
                            branchMergedValue77 = ((ViewCB.packedValues[75u].y - ViewCB.packedValues[76u].y) * intermediateValue98) + ViewCB.packedValues[76u].y;
                            branchMergedValue78 = ((ViewCB.packedValues[75u].x - ViewCB.packedValues[76u].x) * intermediateValue98) + ViewCB.packedValues[76u].x;
                        }
                        else
                        {
                            float comparisonValue29;
                            if (abs(intermediateValue29) < 1.0)
                            {
                                float quotientValue4 = atan(intermediateValue30 / intermediateValue28);
                                bool intermediateValue100 = intermediateValue28 < 0.0;
                                bool comparisonValue27 = intermediateValue28 == 0.0;
                                bool comparisonValue28 = intermediateValue30 >= 0.0;
                                bool intermediateValue101 = intermediateValue30 < 0.0;
                                comparisonValue29 = (comparisonValue27 && comparisonValue28) ? 1.57079637050628662109375 : ((comparisonValue27 && intermediateValue101) ? (-1.57079637050628662109375) : ((intermediateValue100 && intermediateValue101) ? (quotientValue4 + (-3.1415927410125732421875)) : ((intermediateValue100 && comparisonValue28) ? (quotientValue4 + 3.1415927410125732421875) : quotientValue4)));
                            }
                            else
                            {
                                comparisonValue29 = 0.0;
                            }
                            float multiplyAddValue3 = fma(abs((fract((comparisonValue29 - ViewCB.packedValues[50u].w) * 0.15915493667125701904296875) * 2.0) + (-1.0)), 0.984375, 0.0078125);
                            float multiplyAddValue4 = fma(0.5 - (asin(intermediateValue29) * 0.3183098733425140380859375), 0.96875, 0.015625);
                            float productValue152 = ViewCB.packedValues[51u].w * 7.0;
                            float intermediateValue102 = fract(productValue152);
                            uint intermediateValue103 = uint(int(floor(productValue152)));
                            float productValue153 = float(int(intermediateValue103 + 1u)) * 0.125;
                            float intermediateValue104 = fract(abs(productValue153));
                            vec4 sampledTextureValue6 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue3, multiplyAddValue4, float(int(intermediateValue103))), 0.0);
                            float intermediateValue105 = sampledTextureValue6.x;
                            float intermediateValue106 = sampledTextureValue6.y;
                            float intermediateValue107 = sampledTextureValue6.z;
                            float productValue154 = intermediateValue105 * intermediateValue105;
                            float productValue155 = intermediateValue106 * intermediateValue106;
                            float productValue156 = intermediateValue107 * intermediateValue107;
                            vec4 sampledTextureValue7 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue3, multiplyAddValue4, float(int(uint(int(((productValue153 >= ((-0.0) - productValue153)) ? intermediateValue104 : ((-0.0) - intermediateValue104)) * 8.0))))), 0.0);
                            float intermediateValue108 = sampledTextureValue7.x;
                            float intermediateValue109 = sampledTextureValue7.y;
                            float intermediateValue110 = sampledTextureValue7.z;
                            float dotProductValue2 = exp2(log2(spvNMax(dot(vec3(intermediateValue28, intermediateValue29, intermediateValue30), vec3(ViewCB.packedValues[52u].xyz)), 0.0)) * 7.0);
                            float productValue157 = dotProductValue2 * 0.0500000007450580596923828125;
                            float productValue158 = ((((intermediateValue108 * intermediateValue108) - productValue154) * intermediateValue102) + productValue154) + (productValue157 * ViewCB.packedValues[50u].x);
                            float productValue159 = ((((intermediateValue109 * intermediateValue109) - productValue155) * intermediateValue102) + productValue155) + (productValue157 * ViewCB.packedValues[50u].y);
                            float productValue160 = ((((intermediateValue110 * intermediateValue110) - productValue156) * intermediateValue102) + productValue156) + (productValue157 * ViewCB.packedValues[50u].z);
                            float productValue161 = (dotProductValue2 * 0.64999997615814208984375) + 0.3499999940395355224609375;
                            branchMergedValue69 = ((((ViewCB.packedValues[58u].z * productValue161) - productValue160) * ViewCB.packedValues[58u].w) + productValue160) * ViewCB.packedValues[97u].w;
                            branchMergedValue77 = ((((ViewCB.packedValues[58u].y * productValue161) - productValue159) * ViewCB.packedValues[58u].w) + productValue159) * ViewCB.packedValues[97u].w;
                            branchMergedValue78 = ((((ViewCB.packedValues[58u].x * productValue161) - productValue158) * ViewCB.packedValues[58u].w) + productValue158) * ViewCB.packedValues[97u].w;
                        }
                        branchMergedValue14 = branchMergedValue69;
                        branchMergedValue36 = branchMergedValue77;
                        branchMergedValue37 = branchMergedValue78;
                    }
                    intermediateValue88 = branchMergedValue37;
                    intermediateValue89 = branchMergedValue36;
                    intermediateValue90 = branchMergedValue14;
                }
                productValue81 = ((intermediateValue74 * intermediateValue68) * intermediateValue88) + intermediateValue65;
                productValue82 = ((intermediateValue74 * intermediateValue70) * intermediateValue89) + intermediateValue66;
                productValue83 = ((intermediateValue74 * intermediateValue72) * intermediateValue90) + intermediateValue67;
            }
            else
            {
                productValue81 = intermediateValue65;
                productValue82 = intermediateValue66;
                productValue83 = intermediateValue67;
            }
            float branchMergedValue11;
            float branchMergedValue22;
            float branchMergedValue23;
            uint branchMergedValue24;
            float branchMergedValue25;
            if (sampledTextureValue4 == 1u)
            {
                branchMergedValue11 = productValue81;
                branchMergedValue22 = productValue82;
                branchMergedValue23 = intermediateValue40;
                branchMergedValue24 = 1u;
                branchMergedValue25 = productValue83;
            }
            else
            {
                uint sumValue88 = sampledTextureValue4 + 63u;
                float productValue133 = spvNMin(intermediateValue40, 50.0) * (-1.44269502162933349609375);
                branchMergedValue11 = float(float16_t(exp2(productValue133 * ViewCB.packedValues[sumValue88].x))) * productValue81;
                branchMergedValue22 = float(float16_t(exp2(productValue133 * ViewCB.packedValues[sumValue88].y))) * productValue82;
                branchMergedValue23 = intermediateValue40;
                branchMergedValue24 = 1u;
                branchMergedValue25 = float(float16_t(exp2(productValue133 * ViewCB.packedValues[sumValue88].z))) * productValue83;
            }
            intermediateValue39 = branchMergedValue23;
            intermediateValue41 = branchMergedValue11;
            intermediateValue42 = branchMergedValue22;
            intermediateValue43 = branchMergedValue25;
            intermediateValue44 = branchMergedValue24;
        }
        imageStore(outputBufferReflectionDistance, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4((intermediateValue44 != 0u) ? (intermediateValue39 / float(int(intermediateValue44))) : 0.0));
        float productValue84 = intermediateValue41 * reinterpretedBits1;
        float productValue85 = intermediateValue42 * reinterpretedBits1;
        float productValue86 = intermediateValue43 * reinterpretedBits1;
        if (floatBitsToUint(ViewCB.packedValues[92u]).z == 0u)
        {
            uint reinterpretedBits7 = floatBitsToUint(productValue84) & 2147483647u;
            uint reinterpretedBits8 = floatBitsToUint(productValue85) & 2147483647u;
            uint reinterpretedBits9 = floatBitsToUint(productValue86) & 2147483647u;
            if (!((((reinterpretedBits7 > 2139095040u) || (reinterpretedBits8 > 2139095040u)) || (reinterpretedBits9 > 2139095040u)) || (((reinterpretedBits7 == 2139095040u) || (reinterpretedBits8 == 2139095040u)) || (reinterpretedBits9 == 2139095040u))))
            {
                imageStore(outputBufferIndirectSpecular, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(productValue84, productValue85, productValue86, 1.0));
            }
        }
        else
        {
            vec4 loadedBufferValue1 = imageLoad(outputBufferIndirectSpecular, ivec2(uvec2(bitwiseValue2, bitwiseValue3)));
            bool comparisonValue16 = loadedBufferValue1.w != 0.0;
            float comparisonValue17 = comparisonValue16 ? (loadedBufferValue1.x + productValue84) : productValue84;
            float comparisonValue18 = comparisonValue16 ? (loadedBufferValue1.y + productValue85) : productValue85;
            float comparisonValue19 = comparisonValue16 ? (loadedBufferValue1.z + productValue86) : productValue86;
            uint reinterpretedBits10 = floatBitsToUint(comparisonValue17) & 2147483647u;
            uint reinterpretedBits11 = floatBitsToUint(comparisonValue18) & 2147483647u;
            uint reinterpretedBits12 = floatBitsToUint(comparisonValue19) & 2147483647u;
            bool comparisonValue20 = ((reinterpretedBits12 > 2139095040u) || ((reinterpretedBits10 > 2139095040u) || (reinterpretedBits11 > 2139095040u))) || ((reinterpretedBits12 == 2139095040u) || ((reinterpretedBits10 == 2139095040u) || (reinterpretedBits11 == 2139095040u)));
            bool intermediateValue48;
            if (comparisonValue20)
            {
                bool branchMergedValue12;
                if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3))).w == 0.0)
                {
                    imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 1.0, 0.0, 1.0));
                    imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
                    branchMergedValue12 = comparisonValue20;
                }
                else
                {
                    branchMergedValue12 = comparisonValue20;
                }
                intermediateValue48 = branchMergedValue12;
            }
            else
            {
                intermediateValue48 = false;
            }
            if (!intermediateValue48)
            {
                imageStore(outputBufferIndirectSpecular, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(comparisonValue17, comparisonValue18, comparisonValue19, 1.0));
            }
        }
    }
}

