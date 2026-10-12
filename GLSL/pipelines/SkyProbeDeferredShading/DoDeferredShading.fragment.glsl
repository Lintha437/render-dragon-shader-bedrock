#version 460
#extension GL_GOOGLE_include_directive : require
// SkyProbeDeferredShading / DoDeferredShading / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
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
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/SkyProbeDeferredShading/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture6, textureSampler6), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue6.x;
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue7.x;
    float scalarValue13 = sampledTextureValue7.y;
    float scalarValue14 = sampledTextureValue7.z;
    bool sampledTextureValue8 = uint(textureQueryLevels(intermediateValue1)) > 0u;
    uvec2 sampledTextureValue9 = uvec2(textureSize(intermediateValue1, int(0u)));
    uint scalarValue15 = sampledTextureValue9.x;
    float sampledTextureValue10 = rdEvaluateFloatExpression(texelFetch(intermediateValue1, ivec2(uvec2(uint(int(rdEvaluateFloatExpression(sampledTextureValue8 ? scalarValue15 : 0u) * varyingTexCoord0.x)), uint(int(rdEvaluateFloatExpression(sampledTextureValue8 ? sampledTextureValue9.y : 0u) * varyingTexCoord0.y)))), int(0u)).x & 255u) * 0.0039215688593685626983642578125;
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[72u] != 0.0;
    float exponentialValue5 = comparisonValue1 ? exp2(log2(spvNMax(scalarValue12, 0.0)) * 2.2000000476837158203125) : ((scalarValue12 <= 0.040449999272823333740234375) ? (scalarValue12 * 0.077399380505084991455078125) : exp2(log2((scalarValue12 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue6 = comparisonValue1 ? exp2(log2(spvNMax(scalarValue13, 0.0)) * 2.2000000476837158203125) : ((scalarValue13 <= 0.040449999272823333740234375) ? (scalarValue13 * 0.077399380505084991455078125) : exp2(log2((scalarValue13 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue7 = comparisonValue1 ? exp2(log2(spvNMax(scalarValue14, 0.0)) * 2.2000000476837158203125) : ((scalarValue14 <= 0.040449999272823333740234375) ? (scalarValue14 * 0.077399380505084991455078125) : exp2(log2((scalarValue14 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float scalarValue16 = rdDot3Precise2(vec3(exponentialValue5, exponentialValue6, exponentialValue7), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    float multiplyAddValue7 = sampledTextureValue10 * (fma(fragmentScalarConstants1.packedValues[85u], scalarValue16 - exponentialValue5, exponentialValue5) * fragmentScalarConstants1.packedValues[82u]);
    float multiplyAddValue8 = sampledTextureValue10 * (fma(fragmentScalarConstants1.packedValues[85u], scalarValue16 - exponentialValue6, exponentialValue6) * fragmentScalarConstants1.packedValues[82u]);
    float multiplyAddValue9 = sampledTextureValue10 * (fma(fragmentScalarConstants1.packedValues[85u], scalarValue16 - exponentialValue7, exponentialValue7) * fragmentScalarConstants1.packedValues[82u]);
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue23;
    float intermediateValue25;
    if (fragmentScalarConstants1.packedValues[52u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float productValue = (scalarValue * fragmentVectorConstants1.packedValues[6u].w) + fragmentVectorConstants1.packedValues[7u].w;
    float quotientValue = (fragmentVectorConstants1.packedValues[4u].x * varyingColor1.x) / productValue;
    float quotientValue1 = (fragmentVectorConstants1.packedValues[5u].y * varyingColor1.y) / productValue;
    float quotientValue2 = fragmentVectorConstants1.packedValues[7u].z / productValue;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[1u].x, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[0u].x));
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[1u].y, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[0u].y));
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[1u].z, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[0u].z));
    vec4 sampledTextureValue1 = texture(sampler2D(colorMetalnessSubsurfaceTexture, colorMetalnessSubsurfaceSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    uvec2 sampledTextureValue2 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[18u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue14 = fma(scalarValue11, fragmentScalarConstants1.packedValues[27u], fragmentScalarConstants1.packedValues[31u]);
        float quotientValue6 = (varyingColor1.x * fragmentScalarConstants1.packedValues[16u]) / multiplyAddValue14;
        float quotientValue7 = (varyingColor1.y * fragmentScalarConstants1.packedValues[21u]) / multiplyAddValue14;
        float quotientValue8 = fragmentScalarConstants1.packedValues[30u] / multiplyAddValue14;
        vec3 vectorValue = vec3(quotientValue6, quotientValue7, quotientValue8);
        float nonlinearValue3 = spvNClamp((((sqrt(rdDot3Precise2(vectorValue, vectorValue)) / fragmentScalarConstants1.packedValues[42u]) + fragmentScalarConstants1.packedValues[104u]) - fragmentScalarConstants1.packedValues[40u]) * fragmentScalarConstants1.packedValues[41u], 0.0, 1.0);
        float intermediateValue22;
        float intermediateValue24;
        float intermediateValue26;
        if (nonlinearValue3 > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        exponentialValue = exp2(log2(spvNMax(scalarValue1, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue2, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue3, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue1 <= 0.040449999272823333740234375) ? (scalarValue1 * 0.077399380505084991455078125) : exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue2 <= 0.040449999272823333740234375) ? (scalarValue2 * 0.077399380505084991455078125) : exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue3 <= 0.040449999272823333740234375) ? (scalarValue3 * 0.077399380505084991455078125) : exp2(log2((scalarValue3 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float dotProductValue = dot(vec3(exponentialValue, exponentialValue1, exponentialValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    float sampledTextureValue3 = ((float(texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue2.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(sampledTextureValue2.y)))))) * varyingTexCoord0.y)))), int(0u)).x & 255u) * 0.0039215688593685626983642578125) * fragmentVectorConstants1.packedValues[20u].z) * fragmentVectorConstants1.packedValues[21u].x;
    float productValue1 = (((dotProductValue - exponentialValue) * fragmentVectorConstants1.packedValues[21u].y) + exponentialValue) * sampledTextureValue3;
    float productValue2 = (((dotProductValue - exponentialValue1) * fragmentVectorConstants1.packedValues[21u].y) + exponentialValue1) * sampledTextureValue3;
    float productValue3 = (((dotProductValue - exponentialValue2) * fragmentVectorConstants1.packedValues[21u].y) + exponentialValue2) * sampledTextureValue3;
    float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
    float productValue4 = inverseLengthValue * multiplyAddValue;
    float productValue5 = inverseLengthValue * multiplyAddValue1;
    float productValue6 = inverseLengthValue * multiplyAddValue2;
    float productValue7;
    float productValue8;
    float productValue9;
    if ((productValue5 < 0.100000001490116119384765625) && (fragmentVectorConstants1.packedValues[16u].x > 0.0))
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(productValue4, 0.100000001490116119384765625, productValue6), vec3(productValue4, 0.100000001490116119384765625, productValue6)));
        productValue7 = inverseLengthValue1 * productValue4;
        productValue8 = inverseLengthValue1 * 0.100000001490116119384765625;
        productValue9 = inverseLengthValue1 * productValue6;
    }
    else
    {
        productValue7 = productValue4;
        productValue8 = productValue5;
        productValue9 = productValue6;
    }
    bool comparisonValue = fragmentVectorConstants1.packedValues[13u].y != 0.0;
    float productValue10;
    float productValue11;
    float productValue12;
    if ((fragmentVectorConstants1.packedValues[20u].w != 0.0) && (comparisonValue && (fragmentVectorConstants1.packedValues[13u].z != 0.0)))
    {
        productValue10 = spvNMax(fragmentVectorConstants1.packedValues[8u].w + (fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[27u].w), fragmentVectorConstants1.packedValues[9u].x * fragmentVectorConstants1.packedValues[9u].w) * fragmentVectorConstants1.packedValues[13u].z;
        productValue11 = spvNMax(fragmentVectorConstants1.packedValues[8u].w + (fragmentVectorConstants1.packedValues[27u].y * fragmentVectorConstants1.packedValues[27u].w), fragmentVectorConstants1.packedValues[9u].y * fragmentVectorConstants1.packedValues[9u].w) * fragmentVectorConstants1.packedValues[13u].z;
        productValue12 = spvNMax(fragmentVectorConstants1.packedValues[8u].w + (fragmentVectorConstants1.packedValues[27u].z * fragmentVectorConstants1.packedValues[27u].w), fragmentVectorConstants1.packedValues[9u].z * fragmentVectorConstants1.packedValues[9u].w) * fragmentVectorConstants1.packedValues[13u].z;
    }
    else
    {
        productValue10 = 0.0;
        productValue11 = 0.0;
        productValue12 = 0.0;
    }
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if (fragmentVectorConstants1.packedValues[13u].x != 0.0)
    {
        float nonlinearValue = spvNClamp(((fragmentVectorConstants1.packedValues[26u].x - fragmentVectorConstants1.packedValues[10u].x) + (sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2)) / fragmentVectorConstants1.packedValues[10u].z)) * fragmentVectorConstants1.packedValues[10u].y, 0.0, 1.0);
        float branchMergedValue;
        float branchMergedValue2;
        float branchMergedValue3;
        float branchMergedValue4;
        if (nonlinearValue > 0.0)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue4;
            float multiplyAddValue5;
            float multiplyAddValue6;
            if (fragmentScalarConstants1.packedValues[53u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue7;
            float branchMergedValue8;
            float branchMergedValue9;
            float branchMergedValue10;
            if (comparisonValue)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                bool comparisonValue2 = (fragmentScalarConstants1.packedValues[54u] != 0.0) && (fragmentScalarConstants1.packedValues[83u] != 0.0);
                multiplyAddValue4 = spvNMax(comparisonValue2 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[27u].x, fragmentScalarConstants1.packedValues[111u], fragmentScalarConstants1.packedValues[35u]), fragmentScalarConstants1.packedValues[39u] * fragmentVectorConstants1.packedValues[9u].x) * fragmentScalarConstants1.packedValues[54u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[14u].x;
                multiplyAddValue5 = spvNMax(comparisonValue2 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[27u].y, fragmentScalarConstants1.packedValues[111u], fragmentScalarConstants1.packedValues[35u]), fragmentScalarConstants1.packedValues[39u] * fragmentVectorConstants1.packedValues[9u].y) * fragmentScalarConstants1.packedValues[54u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[14u].y;
                multiplyAddValue6 = spvNMax(comparisonValue2 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[27u].z, fragmentScalarConstants1.packedValues[111u], fragmentScalarConstants1.packedValues[35u]), fragmentScalarConstants1.packedValues[39u] * fragmentVectorConstants1.packedValues[9u].z) * fragmentScalarConstants1.packedValues[54u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[14u].z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue7 = nonlinearValue;
                branchMergedValue8 = fragmentVectorConstants1.packedValues[14u].x * spvNMax(productValue10, 1.0);
                branchMergedValue9 = spvNMax(productValue11, 1.0) * fragmentVectorConstants1.packedValues[14u].y;
                branchMergedValue10 = spvNMax(productValue12, 1.0) * fragmentVectorConstants1.packedValues[14u].z;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                float multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue8, fma(fragmentVectorConstants1.packedValues[0u].x, quotientValue6, quotientValue7 * fragmentVectorConstants1.packedValues[1u].x));
                float multiplyAddValue16 = fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue8, fma(fragmentVectorConstants1.packedValues[0u].y, quotientValue6, quotientValue7 * fragmentVectorConstants1.packedValues[1u].y));
                float multiplyAddValue17 = fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue8, fma(fragmentVectorConstants1.packedValues[0u].z, quotientValue6, quotientValue7 * fragmentVectorConstants1.packedValues[1u].z));
                vec3 vectorValue1 = vec3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17);
                float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
                float productValue37 = multiplyAddValue15 * inverseLengthValue2;
                float productValue38 = multiplyAddValue16 * inverseLengthValue2;
                float productValue39 = multiplyAddValue17 * inverseLengthValue2;
                bool bitwiseValue = (productValue38 < 0.100000001490116119384765625) && (fragmentScalarConstants1.packedValues[64u] > 0.0);
                vec3 vectorValue2 = vec3(productValue37, productValue39, 0.100000001490116119384765625);
                float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
                float comparisonValue3 = bitwiseValue ? (inverseLengthValue3 * 0.100000001490116119384765625) : productValue38;
                float sumValue3 = fragmentScalarConstants1.packedValues[91u] - fragmentScalarConstants1.packedValues[88u];
                float sumValue4 = comparisonValue3 + sumValue3;
                float quotientValue9 = spvNClamp((1.0 / (sumValue3 + (fragmentScalarConstants1.packedValues[90u] - fragmentScalarConstants1.packedValues[91u]))) * sumValue4, 0.0, 1.0);
                float multiplyAddValue18 = fma(-fma(quotientValue9, -2.0, 3.0), quotientValue9 * quotientValue9, 1.0);
                float productValue40 = multiplyAddValue18 * (multiplyAddValue18 * multiplyAddValue18);
                vec3 comparisonValue4 = vec3(bitwiseValue ? (inverseLengthValue3 * productValue37) : productValue37, comparisonValue3, bitwiseValue ? (inverseLengthValue3 * productValue39) : productValue39);
                float scalarValue17 = rdDot3Precise2(comparisonValue4, vec3(fragmentVectorConstants1.packedValues[24u].xyz));
                float scalarValue18 = rdDot3Precise2(comparisonValue4, vec3(fragmentVectorConstants1.packedValues[17u].xyz));
                float quotientValue10 = spvNClamp((1.0 / (sumValue3 + fragmentScalarConstants1.packedValues[89u])) * sumValue4, 0.0, 1.0);
                float multiplyAddValue19 = fma(-fma(quotientValue10, -2.0, 3.0), quotientValue10 * quotientValue10, 1.0);
                float productValue41 = multiplyAddValue19 * (multiplyAddValue19 * multiplyAddValue19);
                float multiplyAddValue20 = fma(fma(scalarValue17, scalarValue17, 1.0) * fragmentScalarConstants1.packedValues[123u], 0.75, (fma(scalarValue18, scalarValue18, 1.0) * fragmentScalarConstants1.packedValues[95u]) * 0.75);
                float exponentialValue8 = spvNMin(exp2(log2(spvNMax(scalarValue18, 0.0)) * fragmentScalarConstants1.packedValues[47u]), 1.0);
                float exponentialValue9 = spvNMin(exp2(log2(spvNMax(scalarValue17, 0.0)) * fragmentScalarConstants1.packedValues[47u]), 1.0);
                float multiplyAddValue21 = fma(-exponentialValue9, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue4 = 0.0361000001430511474609375 / (multiplyAddValue21 * sqrt(multiplyAddValue21));
                float multiplyAddValue22 = fma(-exponentialValue8, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue5 = 0.0361000001430511474609375 / (multiplyAddValue22 * sqrt(multiplyAddValue22));
                float multiplyAddValue23 = fma((fma(productValue41, fragmentVectorConstants1.packedValues[28u].x - fragmentVectorConstants1.packedValues[12u].x, fragmentVectorConstants1.packedValues[12u].x) * fragmentScalarConstants1.packedValues[44u]) * 0.079577468335628509521484375, multiplyAddValue20, fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[30u].x * fragmentScalarConstants1.packedValues[123u]) * fragmentScalarConstants1.packedValues[45u]), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[23u].x * fragmentScalarConstants1.packedValues[95u]) * fragmentScalarConstants1.packedValues[46u]))) * ((productValue40 * fragmentVectorConstants1.packedValues[28u].x) * 0.079577468335628509521484375));
                float multiplyAddValue24 = fma((fma(productValue41, fragmentVectorConstants1.packedValues[28u].y - fragmentVectorConstants1.packedValues[12u].y, fragmentVectorConstants1.packedValues[12u].y) * fragmentScalarConstants1.packedValues[44u]) * 0.079577468335628509521484375, multiplyAddValue20, fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[30u].y * fragmentScalarConstants1.packedValues[123u]) * fragmentScalarConstants1.packedValues[45u]), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[23u].y * fragmentScalarConstants1.packedValues[95u]) * fragmentScalarConstants1.packedValues[46u]))) * ((productValue40 * fragmentVectorConstants1.packedValues[28u].y) * 0.079577468335628509521484375));
                float multiplyAddValue25 = fma((fma(productValue41, fragmentVectorConstants1.packedValues[28u].z - fragmentVectorConstants1.packedValues[12u].z, fragmentVectorConstants1.packedValues[12u].z) * fragmentScalarConstants1.packedValues[44u]) * 0.079577468335628509521484375, multiplyAddValue20, fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[30u].z * fragmentScalarConstants1.packedValues[123u]) * fragmentScalarConstants1.packedValues[45u]), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[23u].z * fragmentScalarConstants1.packedValues[95u]) * fragmentScalarConstants1.packedValues[46u]))) * ((productValue40 * fragmentVectorConstants1.packedValues[28u].z) * 0.079577468335628509521484375));
                bool comparisonValue5 = fragmentScalarConstants1.packedValues[55u] != 0.0;
                float scalarValue19 = spvNMax(fragmentScalarConstants1.packedValues[61u], 1.0);
                multiplyAddValue4 = comparisonValue5 ? fma(scalarValue19, multiplyAddValue23 - fragmentVectorConstants1.packedValues[31u].x, fragmentVectorConstants1.packedValues[31u].x) : multiplyAddValue23;
                multiplyAddValue5 = comparisonValue5 ? fma(scalarValue19, multiplyAddValue24 - fragmentVectorConstants1.packedValues[31u].y, fragmentVectorConstants1.packedValues[31u].y) : multiplyAddValue24;
                multiplyAddValue6 = comparisonValue5 ? fma(scalarValue19, multiplyAddValue25 - fragmentVectorConstants1.packedValues[31u].z, fragmentVectorConstants1.packedValues[31u].z) : multiplyAddValue25;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float quotientValue3 = spvNClamp(((productValue8 - fragmentVectorConstants1.packedValues[22u].x) + fragmentVectorConstants1.packedValues[22u].w) / (fragmentVectorConstants1.packedValues[22u].z - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
                float productValue13 = 1.0 - ((quotientValue3 * quotientValue3) * (3.0 - (quotientValue3 * 2.0)));
                float productValue14 = (productValue13 * productValue13) * productValue13;
                float dotProductValue1 = dot(vec3(productValue7, productValue8, productValue9), vec3(fragmentVectorConstants1.packedValues[24u].xyz));
                float dotProductValue2 = dot(vec3(productValue7, productValue8, productValue9), vec3(fragmentVectorConstants1.packedValues[17u].xyz));
                float sumValue = fragmentVectorConstants1.packedValues[22u].x - fragmentVectorConstants1.packedValues[22u].w;
                float quotientValue4 = spvNClamp((productValue8 - sumValue) / (fragmentVectorConstants1.packedValues[22u].y - sumValue), 0.0, 1.0);
                float productValue15 = 1.0 - ((quotientValue4 * quotientValue4) * (3.0 - (quotientValue4 * 2.0)));
                float productValue16 = (productValue15 * productValue15) * productValue15;
                float productValue17 = (fragmentVectorConstants1.packedValues[11u].x * 0.75) * ((((dotProductValue2 * dotProductValue2) + 1.0) * fragmentVectorConstants1.packedValues[23u].w) + (((dotProductValue1 * dotProductValue1) + 1.0) * fragmentVectorConstants1.packedValues[30u].w));
                float exponentialValue3 = spvNClamp(exp2(log2(spvNMax(dotProductValue1, 0.0)) * fragmentVectorConstants1.packedValues[11u].w), 0.0, 1.0);
                float exponentialValue4 = spvNClamp(exp2(log2(spvNMax(dotProductValue2, 0.0)) * fragmentVectorConstants1.packedValues[11u].w), 0.0, 1.0);
                float productValue22 = 1.809999942779541015625 - (exponentialValue3 * 1.7999999523162841796875);
                float nonlinearValue1 = 0.036100022494792938232421875 / (sqrt(productValue22) * productValue22);
                float productValue23 = 1.809999942779541015625 - (exponentialValue4 * 1.7999999523162841796875);
                float nonlinearValue2 = 0.036100022494792938232421875 / (sqrt(productValue23) * productValue23);
                float productValue24 = exponentialValue3 * (fragmentVectorConstants1.packedValues[11u].y * fragmentVectorConstants1.packedValues[30u].w);
                float productValue25 = exponentialValue4 * (fragmentVectorConstants1.packedValues[11u].z * fragmentVectorConstants1.packedValues[23u].w);
                float productValue26 = (((productValue14 * fragmentVectorConstants1.packedValues[28u].x) * (((productValue25 * fragmentVectorConstants1.packedValues[23u].x) * nonlinearValue2) + ((productValue24 * fragmentVectorConstants1.packedValues[30u].x) * nonlinearValue1))) + (((productValue16 * (fragmentVectorConstants1.packedValues[28u].x - fragmentVectorConstants1.packedValues[12u].x)) + fragmentVectorConstants1.packedValues[12u].x) * productValue17)) * 0.079577468335628509521484375;
                float productValue27 = (((productValue14 * fragmentVectorConstants1.packedValues[28u].y) * (((productValue25 * fragmentVectorConstants1.packedValues[23u].y) * nonlinearValue2) + ((productValue24 * fragmentVectorConstants1.packedValues[30u].y) * nonlinearValue1))) + (((productValue16 * (fragmentVectorConstants1.packedValues[28u].y - fragmentVectorConstants1.packedValues[12u].y)) + fragmentVectorConstants1.packedValues[12u].y) * productValue17)) * 0.079577468335628509521484375;
                float productValue28 = (((productValue14 * fragmentVectorConstants1.packedValues[28u].z) * (((productValue25 * fragmentVectorConstants1.packedValues[23u].z) * nonlinearValue2) + ((productValue24 * fragmentVectorConstants1.packedValues[30u].z) * nonlinearValue1))) + (((productValue16 * (fragmentVectorConstants1.packedValues[28u].z - fragmentVectorConstants1.packedValues[12u].z)) + fragmentVectorConstants1.packedValues[12u].z) * productValue17)) * 0.079577468335628509521484375;
                float branchMergedValue11;
                float branchMergedValue12;
                float branchMergedValue13;
                float branchMergedValue14;
                if (fragmentVectorConstants1.packedValues[13u].w != 0.0)
                {
                    float scalarValue4 = spvNMax(fragmentVectorConstants1.packedValues[15u].y, 1.0);
                    branchMergedValue11 = nonlinearValue;
                    branchMergedValue12 = ((productValue26 - fragmentVectorConstants1.packedValues[31u].x) * scalarValue4) + fragmentVectorConstants1.packedValues[31u].x;
                    branchMergedValue13 = ((productValue27 - fragmentVectorConstants1.packedValues[31u].y) * scalarValue4) + fragmentVectorConstants1.packedValues[31u].y;
                    branchMergedValue14 = ((productValue28 - fragmentVectorConstants1.packedValues[31u].z) * scalarValue4) + fragmentVectorConstants1.packedValues[31u].z;
                }
                else
                {
                    branchMergedValue11 = nonlinearValue;
                    branchMergedValue12 = productValue26;
                    branchMergedValue13 = productValue27;
                    branchMergedValue14 = productValue28;
                }
                branchMergedValue7 = branchMergedValue11;
                branchMergedValue8 = branchMergedValue12;
                branchMergedValue9 = branchMergedValue13;
                branchMergedValue10 = branchMergedValue14;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue26 = multiplyAddValue4;
            intermediateValue24 = multiplyAddValue5;
            intermediateValue22 = multiplyAddValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = branchMergedValue7;
            branchMergedValue2 = branchMergedValue8;
            branchMergedValue3 = branchMergedValue9;
            branchMergedValue4 = branchMergedValue10;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue26 = 0.0;
            intermediateValue24 = 0.0;
            intermediateValue22 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = nonlinearValue;
            branchMergedValue2 = 0.0;
            branchMergedValue3 = 0.0;
            branchMergedValue4 = 0.0;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue20 = nonlinearValue3;
        intermediateValue21 = intermediateValue22;
        intermediateValue23 = intermediateValue24;
        intermediateValue25 = intermediateValue26;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue4 = branchMergedValue;
        intermediateValue5 = branchMergedValue2;
        intermediateValue6 = branchMergedValue3;
        intermediateValue7 = branchMergedValue4;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue20 = 0.0;
        intermediateValue21 = 0.0;
        intermediateValue23 = 0.0;
        intermediateValue25 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
        intermediateValue6 = 0.0;
        intermediateValue7 = 0.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue10;
    float multiplyAddValue11;
    float multiplyAddValue12;
    float multiplyAddValue13;
    if (fragmentScalarConstants1.packedValues[136u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue18;
    float productValue19;
    float productValue20;
    float productValue21;
    if (fragmentVectorConstants1.packedValues[34u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue26 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[6u].z, scalarValue11, fma(fragmentVectorConstants1.packedValues[4u].z, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z)) / (fma(fragmentVectorConstants1.packedValues[6u].w, scalarValue11, fma(fragmentVectorConstants1.packedValues[4u].w, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[7u].w)) - fragmentScalarConstants1.packedValues[132u]) / (fragmentScalarConstants1.packedValues[133u] - fragmentScalarConstants1.packedValues[132u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[130u]), -0.5);
        uint sumValue5 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[130u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue26))), int(0u))))));
        float scalarValue20 = rdSignedBitsToFloat(sumValue5);
        float sumValue6 = spvNClamp(multiplyAddValue26 - scalarValue20, 0.0, 1.0);
        float multiplyAddValue27 = fma(varyingColor1.x, 0.5, 0.5);
        float multiplyAddValue28 = fma(varyingColor1.y, 0.5, 0.5);
        vec4 sampledTextureValue11 = textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue27, multiplyAddValue28, scalarValue20), 0.0);
        float scalarValue21 = sampledTextureValue11.x;
        float scalarValue22 = sampledTextureValue11.y;
        float scalarValue23 = sampledTextureValue11.z;
        float scalarValue24 = sampledTextureValue11.w;
        vec4 sampledTextureValue12 = textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue27, multiplyAddValue28, rdSignedBitsToFloat(sumValue5 + 1u)), 0.0);
        multiplyAddValue10 = fma(sumValue6, sampledTextureValue12.z - scalarValue23, scalarValue23);
        multiplyAddValue11 = fma(sumValue6, sampledTextureValue12.y - scalarValue22, scalarValue22);
        multiplyAddValue12 = fma(sumValue6, sampledTextureValue12.x - scalarValue21, scalarValue21);
        multiplyAddValue13 = fma(sumValue6, sampledTextureValue12.w - scalarValue24, scalarValue24);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue29 = (varyingColor1.x + 1.0) * 0.5;
        float productValue30 = (varyingColor1.y + 1.0) * 0.5;
        uint scalarValue5 = uint(int(fragmentVectorConstants1.packedValues[32u].z));
        float multiplyAddValue3 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[7u].z + fma(fragmentVectorConstants1.packedValues[6u].z, scalarValue, fma(fragmentVectorConstants1.packedValues[5u].z, varyingColor1.y, fragmentVectorConstants1.packedValues[4u].z * varyingColor1.x)))) / (fma(fragmentVectorConstants1.packedValues[6u].w, scalarValue, fma(fragmentVectorConstants1.packedValues[5u].w, varyingColor1.y, fragmentVectorConstants1.packedValues[4u].w * varyingColor1.x)) + fragmentVectorConstants1.packedValues[7u].w)) - fragmentVectorConstants1.packedValues[33u].x) / (fragmentVectorConstants1.packedValues[33u].y - fragmentVectorConstants1.packedValues[33u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue5))) + (-0.5);
        uint sumValue1 = uint(min(int(uint(max(int(uint(int(multiplyAddValue3))), int(0u)))), int(scalarValue5 + 4294967294u)));
        float scalarValue6 = float(int(sumValue1));
        float sumValue2 = spvNMin(spvNMax(multiplyAddValue3 - scalarValue6, 0.0), 1.0);
        vec4 sampledTextureValue4 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue29, productValue30, scalarValue6), 0.0);
        float scalarValue7 = sampledTextureValue4.x;
        float scalarValue8 = sampledTextureValue4.y;
        float scalarValue9 = sampledTextureValue4.z;
        float scalarValue10 = sampledTextureValue4.w;
        vec4 sampledTextureValue5 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue29, productValue30, float(int(sumValue1 + 1u))), 0.0);
        productValue18 = ((sampledTextureValue5.x - scalarValue7) * sumValue2) + scalarValue7;
        productValue19 = ((sampledTextureValue5.y - scalarValue8) * sumValue2) + scalarValue8;
        productValue20 = ((sampledTextureValue5.z - scalarValue9) * sumValue2) + scalarValue9;
        productValue21 = ((sampledTextureValue5.w - scalarValue10) * sumValue2) + scalarValue10;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue10 = 0.0;
        multiplyAddValue11 = 0.0;
        multiplyAddValue12 = 0.0;
        multiplyAddValue13 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue18 = 0.0;
        productValue19 = 0.0;
        productValue20 = 0.0;
        productValue21 = 1.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue29 = fma(multiplyAddValue13, fma(intermediateValue20, fma(-multiplyAddValue7, fragmentScalarConstants1.packedValues[84u], intermediateValue25), multiplyAddValue7 * fragmentScalarConstants1.packedValues[84u]), multiplyAddValue12);
    float multiplyAddValue30 = fma(multiplyAddValue13, fma(intermediateValue20, fma(-multiplyAddValue8, fragmentScalarConstants1.packedValues[84u], intermediateValue23), multiplyAddValue8 * fragmentScalarConstants1.packedValues[84u]), multiplyAddValue11);
    float multiplyAddValue31 = fma(multiplyAddValue13, fma(intermediateValue20, fma(-multiplyAddValue9, fragmentScalarConstants1.packedValues[84u], intermediateValue21), multiplyAddValue9 * fragmentScalarConstants1.packedValues[84u]), multiplyAddValue10);
    bool comparisonValue6 = fragmentScalarConstants1.packedValues[76u] == 3.0;
    bool comparisonValue7 = fragmentScalarConstants1.packedValues[76u] != 2.0;
    float quotientValue11 = spvNMax((spvNMin(spvNMax((varyingColor1.y + 1.0) * 0.5, fragmentScalarConstants1.packedValues[117u]), fragmentScalarConstants1.packedValues[116u]) - fragmentScalarConstants1.packedValues[117u]) / ((fragmentScalarConstants1.packedValues[116u] - fragmentScalarConstants1.packedValues[117u]) + 9.9999997473787516355514526367188e-06), fragmentScalarConstants1.packedValues[118u]);
    float comparisonValue8 = comparisonValue6 ? (multiplyAddValue29 * fragmentScalarConstants1.packedValues[118u]) : (comparisonValue7 ? (multiplyAddValue29 * quotientValue11) : multiplyAddValue29);
    float comparisonValue9 = comparisonValue6 ? (multiplyAddValue30 * fragmentScalarConstants1.packedValues[118u]) : (comparisonValue7 ? (multiplyAddValue30 * quotientValue11) : multiplyAddValue30);
    float comparisonValue10 = comparisonValue6 ? (multiplyAddValue31 * fragmentScalarConstants1.packedValues[118u]) : (comparisonValue7 ? (multiplyAddValue31 * quotientValue11) : multiplyAddValue31);
    bool conditionValue1 = fragmentScalarConstants1.packedValues[100u] > 0.0;
    fragmentColor0.x = conditionValue1 ? (comparisonValue8 * 0.0033142860047519207000732421875) : comparisonValue8;
    fragmentColor0.y = conditionValue1 ? (comparisonValue9 * 0.0033142860047519207000732421875) : comparisonValue9;
    fragmentColor0.z = conditionValue1 ? (comparisonValue10 * 0.0033142860047519207000732421875) : comparisonValue10;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue31 = (productValue21 * (((intermediateValue5 - productValue1) * intermediateValue4) + productValue1)) + productValue18;
    float productValue32 = (productValue21 * (((intermediateValue6 - productValue2) * intermediateValue4) + productValue2)) + productValue19;
    float productValue33 = (productValue21 * (((intermediateValue7 - productValue3) * intermediateValue4) + productValue3)) + productValue20;
    float productValue34;
    float productValue35;
    float productValue36;
    if (fragmentVectorConstants1.packedValues[19u].x == 3.0)
    {
        productValue34 = fragmentVectorConstants1.packedValues[29u].z * productValue31;
        productValue35 = fragmentVectorConstants1.packedValues[29u].z * productValue32;
        productValue36 = fragmentVectorConstants1.packedValues[29u].z * productValue33;
    }
    else
    {
        float branchMergedValue1;
        float branchMergedValue5;
        float branchMergedValue6;
        if (fragmentVectorConstants1.packedValues[19u].x != 2.0)
        {
            float quotientValue5 = spvNMax((spvNMin(spvNMax((varyingColor1.y + 1.0) * 0.5, fragmentVectorConstants1.packedValues[29u].y), fragmentVectorConstants1.packedValues[29u].x) - fragmentVectorConstants1.packedValues[29u].y) / ((fragmentVectorConstants1.packedValues[29u].x + 9.9999997473787516355514526367188e-06) - fragmentVectorConstants1.packedValues[29u].y), fragmentVectorConstants1.packedValues[29u].z);
            branchMergedValue1 = quotientValue5 * productValue31;
            branchMergedValue5 = quotientValue5 * productValue32;
            branchMergedValue6 = quotientValue5 * productValue33;
        }
        else
        {
            branchMergedValue1 = productValue31;
            branchMergedValue5 = productValue32;
            branchMergedValue6 = productValue33;
        }
        productValue34 = branchMergedValue1;
        productValue35 = branchMergedValue5;
        productValue36 = branchMergedValue6;
    }
    bool conditionValue = fragmentVectorConstants1.packedValues[25u].x > 0.0;
    fragmentColor0.x = conditionValue ? (productValue34 * 0.0033142860047519207000732421875) : productValue34;
    fragmentColor0.y = conditionValue ? (productValue35 * 0.0033142860047519207000732421875) : productValue35;
    fragmentColor0.z = conditionValue ? (productValue36 * 0.0033142860047519207000732421875) : productValue36;
#endif
    fragmentColor0.w = 1.0;
}
