#version 460
#extension GL_GOOGLE_include_directive : require
// DeferredMixedResolutionLightingPrepass / DirectionalLightingPass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#endif
#extension GL_EXT_scalar_block_layout : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_samplerless_texture_functions : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#extension GL_EXT_samplerless_texture_functions : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/DeferredMixedResolutionLightingPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float productValue84 = floor(varyingTexCoord0.y * fragmentVectorConstants1.packedValues[108u].y) + 0.5;
    float productValue85 = (floor(varyingTexCoord0.x * fragmentVectorConstants1.packedValues[108u].x) + 0.5) * fragmentVectorConstants1.packedValues[108u].z;
    float productValue86 = productValue84 * fragmentVectorConstants1.packedValues[108u].w;
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture6, textureSampler6), vec2(productValue85, productValue86));
    float scalarValue29 = sampledTextureValue11.x;
    float multiplyAddValue32 = fma(productValue85, 2.0, -1.0);
    float multiplyAddValue33 = fma(fma(-productValue84, fragmentScalarConstants1.packedValues[435u], 1.0), 2.0, -1.0);
    float multiplyAddValue34 = fma(scalarValue29, fragmentScalarConstants1.packedValues[43u], fragmentScalarConstants1.packedValues[47u]);
    float quotientValue25 = fragmentScalarConstants1.packedValues[46u] / multiplyAddValue34;
    float quotientValue26 = ((multiplyAddValue32 + fragmentScalarConstants1.packedValues[440u]) * fragmentScalarConstants1.packedValues[32u]) / multiplyAddValue34;
    float quotientValue27 = ((multiplyAddValue33 - fragmentScalarConstants1.packedValues[441u]) * fragmentScalarConstants1.packedValues[37u]) / multiplyAddValue34;
    float scalarValue30 = dFdyCoarse(productValue86);
    float scalarValue31 = dFdyCoarse(productValue85);
    float scalarValue32 = dFdyCoarse(-quotientValue25);
    float scalarValue33 = dFdxCoarse(quotientValue26);
    float scalarValue34 = dFdxCoarse(productValue85);
    float scalarValue35 = dFdxCoarse(productValue86);
    float scalarValue36 = dFdxCoarse(quotientValue27);
    float scalarValue37 = dFdyCoarse(-quotientValue26);
    float scalarValue38 = dFdyCoarse(-quotientValue27);
    float scalarValue39 = dFdxCoarse(quotientValue25);
    float intermediateValue31;
    float intermediateValue32;
    float intermediateValue33;
    float intermediateValue34;
    float intermediateValue35;
    float intermediateValue36;
    if (scalarValue29 != 1.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (floor(fragmentVectorConstants1.packedValues[108u].x * varyingTexCoord0.x) + 0.5) * fragmentVectorConstants1.packedValues[108u].z;
    float productValue1 = (floor(fragmentVectorConstants1.packedValues[108u].y * varyingTexCoord0.y) + 0.5) * fragmentVectorConstants1.packedValues[108u].w;
    float productValue2 = (productValue * 2.0) + (-1.0);
    float productValue3 = ((1.0 - productValue1) * 2.0) + (-1.0);
    vec4 sampledTextureValue = texture(sampler2D(normalTexture, normalSampler), vec2(productValue, productValue1));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    vec4 sampledTextureValue1 = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(productValue, productValue1));
    float scalarValue2 = sampledTextureValue1.x;
    float productValue4 = (scalarValue2 * fragmentVectorConstants1.packedValues[10u].w) + fragmentVectorConstants1.packedValues[11u].w;
    float quotientValue = (productValue2 * fragmentVectorConstants1.packedValues[8u].x) / productValue4;
    float quotientValue1 = (productValue3 * fragmentVectorConstants1.packedValues[9u].y) / productValue4;
    float quotientValue2 = fragmentVectorConstants1.packedValues[11u].z / productValue4;
    float quotientValue6 = ((fragmentVectorConstants1.packedValues[110u].x + productValue2) * fragmentVectorConstants1.packedValues[8u].x) / productValue4;
    float quotientValue7 = ((productValue3 - fragmentVectorConstants1.packedValues[110u].y) * fragmentVectorConstants1.packedValues[9u].y) / productValue4;
    float multiplyAddValue = (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].x, quotientValue7, quotientValue6 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) - fragmentVectorConstants1.packedValues[90u].x;
    float multiplyAddValue1 = (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].y, quotientValue7, quotientValue6 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) - fragmentVectorConstants1.packedValues[90u].y;
    float multiplyAddValue2 = (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue7, quotientValue6 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z) - fragmentVectorConstants1.packedValues[90u].z;
    float scalarValue3 = dFdxCoarse(quotientValue6);
    float scalarValue4 = dFdxCoarse(quotientValue7);
    float scalarValue5 = dFdxCoarse(quotientValue2);
    float inverseLengthValue = inversesqrt(dot(vec3(scalarValue3, scalarValue4, scalarValue5), vec3(scalarValue3, scalarValue4, scalarValue5)));
    float productValue5 = inverseLengthValue * scalarValue3;
    float productValue6 = inverseLengthValue * scalarValue4;
    float productValue7 = inverseLengthValue * scalarValue5;
    float sumValue = dFdyCoarse((-0.0) - quotientValue6);
    float sumValue1 = dFdyCoarse((-0.0) - quotientValue7);
    float sumValue2 = dFdyCoarse((-0.0) - quotientValue2);
    float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue, sumValue1, sumValue2), vec3(sumValue, sumValue1, sumValue2)));
    float productValue8 = inverseLengthValue1 * sumValue;
    float productValue9 = inverseLengthValue1 * sumValue1;
    float productValue10 = inverseLengthValue1 * sumValue2;
    float productValue11 = (productValue10 * productValue6) - (productValue9 * productValue7);
    float productValue12 = (productValue8 * productValue7) - (productValue10 * productValue5);
    float productValue13 = (productValue9 * productValue5) - (productValue8 * productValue6);
    float inverseLengthValue2 = inversesqrt(dot(vec3(productValue11, productValue12, productValue13), vec3(productValue11, productValue12, productValue13)));
    float productValue14 = productValue11 * inverseLengthValue2;
    float productValue15 = productValue12 * inverseLengthValue2;
    float productValue16 = productValue13 * inverseLengthValue2;
    float multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue16, fma(fragmentVectorConstants1.packedValues[5u].x, productValue15, productValue14 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue16, fma(fragmentVectorConstants1.packedValues[5u].y, productValue15, productValue14 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue16, fma(fragmentVectorConstants1.packedValues[5u].z, productValue15, productValue14 * fragmentVectorConstants1.packedValues[4u].z));
    float inverseLengthValue3 = inversesqrt(dot(vec3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8), vec3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8)));
    float quotientValue8 = roundEven((inverseLengthValue3 * multiplyAddValue6) / fragmentVectorConstants1.packedValues[107u].x) * fragmentVectorConstants1.packedValues[107u].x;
    float quotientValue9 = roundEven((inverseLengthValue3 * multiplyAddValue7) / fragmentVectorConstants1.packedValues[107u].x) * fragmentVectorConstants1.packedValues[107u].x;
    float quotientValue10 = roundEven((inverseLengthValue3 * multiplyAddValue8) / fragmentVectorConstants1.packedValues[107u].x) * fragmentVectorConstants1.packedValues[107u].x;
    float inverseLengthValue4 = inversesqrt(dot(vec3(quotientValue8, quotientValue9, quotientValue10), vec3(quotientValue8, quotientValue9, quotientValue10)));
    float productValue17 = inverseLengthValue4 * quotientValue8;
    float productValue18 = inverseLengthValue4 * quotientValue9;
    float productValue19 = inverseLengthValue4 * quotientValue10;
    float productValue20 = fragmentVectorConstants1.packedValues[53u].z * 0.5;
    float quotientValue11 = productValue20 - (multiplyAddValue - (floor(multiplyAddValue / fragmentVectorConstants1.packedValues[53u].z) * fragmentVectorConstants1.packedValues[53u].z));
    float quotientValue12 = productValue20 - (multiplyAddValue1 - (floor(multiplyAddValue1 / fragmentVectorConstants1.packedValues[53u].z) * fragmentVectorConstants1.packedValues[53u].z));
    float quotientValue13 = productValue20 - (multiplyAddValue2 - (floor(multiplyAddValue2 / fragmentVectorConstants1.packedValues[53u].z) * fragmentVectorConstants1.packedValues[53u].z));
    float dotProductValue = dot(vec3(quotientValue11, quotientValue12, quotientValue13), vec3(productValue17, productValue18, productValue19));
    float sumValue3 = 1.0 - abs(scalarValue);
    float scalarValue6 = abs(scalarValue1);
    float sumValue4 = sumValue3 - scalarValue6;
    bool conditionValue = sumValue4 < 0.0;
    float comparisonValue = conditionValue ? ((1.0 - scalarValue6) * ((scalarValue < 0.0) ? (-1.0) : 1.0)) : scalarValue;
    float comparisonValue1 = conditionValue ? (sumValue3 * ((scalarValue1 < 0.0) ? (-1.0) : 1.0)) : scalarValue1;
    float inverseLengthValue5 = inversesqrt(dot(vec3(comparisonValue, comparisonValue1, sumValue4), vec3(comparisonValue, comparisonValue1, sumValue4)));
    float productValue21 = comparisonValue * inverseLengthValue5;
    float productValue22 = comparisonValue1 * inverseLengthValue5;
    float productValue23 = inverseLengthValue5 * sumValue4;
    float inverseLengthValue6 = inversesqrt(dot(vec3(productValue21, productValue22, productValue23), vec3(productValue21, productValue22, productValue23)));
    float productValue24 = inverseLengthValue6 * productValue21;
    float productValue25 = productValue22 * inverseLengthValue6;
    float productValue26 = inverseLengthValue6 * productValue23;
    float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue26, fma(fragmentVectorConstants1.packedValues[1u].x, productValue25, productValue24 * fragmentVectorConstants1.packedValues[0u].x));
    float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue26, fma(fragmentVectorConstants1.packedValues[1u].y, productValue25, productValue24 * fragmentVectorConstants1.packedValues[0u].y));
    float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue26, fma(fragmentVectorConstants1.packedValues[1u].z, productValue25, productValue24 * fragmentVectorConstants1.packedValues[0u].z));
    float inverseLengthValue7 = inversesqrt(dot(vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue27 = inverseLengthValue7 * multiplyAddValue9;
    float productValue28 = inverseLengthValue7 * multiplyAddValue10;
    float productValue29 = inverseLengthValue7 * multiplyAddValue11;
    vec4 sampledTextureValue2 = texture(sampler2D(colorMetalnessSubsurfaceTexture, colorMetalnessSubsurfaceSampler), vec2(productValue, productValue1));
    float scalarValue7 = sampledTextureValue2.x;
    float scalarValue8 = sampledTextureValue2.y;
    float scalarValue9 = sampledTextureValue2.z;
    float scalarValue10 = sampledTextureValue2.w;
    float productValue30 = spvNClamp((scalarValue10 + (-0.501960813999176025390625)) * 2.007874011993408203125, 0.0, 1.0);
    uvec2 sampledTextureValue3 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    uvec4 sampledTextureValue4 = texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue3.x)))))) * productValue)), uint(int(float(int(uint(int(float(int(sampledTextureValue3.y)))))) * productValue1)))), int(0u));
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[97u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        bool sampledTextureValue12 = uint(textureQueryLevels(intermediateValue2)) > 0u;
        uvec2 sampledTextureValue13 = uvec2(textureSize(intermediateValue2, int(0u)));
        uint scalarValue40 = sampledTextureValue13.x;
        uvec4 sampledTextureValue14 = texelFetch(intermediateValue2, ivec2(uvec2(uint(int(productValue85 * rdEvaluateFloatExpression(sampledTextureValue12 ? scalarValue40 : 0u))), uint(int(productValue86 * rdEvaluateFloatExpression(sampledTextureValue12 ? sampledTextureValue13.y : 0u))))), int(0u));
        float quotientValue3;
        float quotientValue4;
        float quotientValue5;
        float multiplyAddValue3;
        float multiplyAddValue4;
        float multiplyAddValue5;
        if (!((fragmentScalarConstants1.packedValues[396u] != 0.0) && (rdEvaluateFloatExpression(sampledTextureValue14.w & 255u) < 0.02549999766051769256591796875)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        exponentialValue = exp2(log2(spvNMax(scalarValue7, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue8, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue9, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue7 <= 0.040449999272823333740234375) ? (scalarValue7 * 0.077399380505084991455078125) : exp2(log2((scalarValue7 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue8 <= 0.040449999272823333740234375) ? (scalarValue8 * 0.077399380505084991455078125) : exp2(log2((scalarValue8 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue9 <= 0.040449999272823333740234375) ? (scalarValue9 * 0.077399380505084991455078125) : exp2(log2((scalarValue9 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float sumValue5 = 1.0 - productValue30;
    float productValue31 = sumValue5 * 0.039999999105930328369140625;
    float productValue32 = (exponentialValue * productValue30) + productValue31;
    float productValue33 = (exponentialValue1 * productValue30) + productValue31;
    float productValue34 = (exponentialValue2 * productValue30) + productValue31;
    vec4 sampledTextureValue5 = texture(sampler2D(causticsMultiplierTexture, causticsMultiplierSampler), vec2(productValue, productValue1));
    float nonlinearValue = sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2)) + 9.9999997473787516355514526367188e-05;
    float quotientValue14 = quotientValue / nonlinearValue;
    float quotientValue15 = quotientValue1 / nonlinearValue;
    float quotientValue18 = quotientValue2 / nonlinearValue;
    float sumValue7 = (-0.0) - quotientValue14;
    float sumValue8 = (-0.0) - quotientValue15;
    float sumValue9 = (-0.0) - quotientValue18;
    float productValue35 = fragmentVectorConstants1.packedValues[111u].x * spvNClamp((0.4980392158031463623046875 - scalarValue10) * 2.007874011993408203125, 0.0, 1.0);
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if (scalarValue2 != 1.0)
    {
        bool conditionValue1 = int(uint(int(fragmentVectorConstants1.packedValues[53u].y))) > int(0u);
        float branchMergedValue9;
        float branchMergedValue12;
        float branchMergedValue13;
        float branchMergedValue14;
        float branchMergedValue15;
        float branchMergedValue16;
        if ((fragmentVectorConstants1.packedValues[99u].x != 0.0) && (abs(float(sampledTextureValue4.w & 255u) * 0.0039215688593685626983642578125) < 9.9999997473787516355514526367188e-05))
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            vec4 sampledTextureValue15 = textureGrad(sampler2D(materialTexture3, textureSampler3), vec2(productValue85, productValue86), vec2(scalarValue34, scalarValue35), vec2(scalarValue31, scalarValue30));
            float scalarValue41 = sampledTextureValue15.x;
            float scalarValue42 = sampledTextureValue15.y;
            float quotientValue28 = (multiplyAddValue32 * fragmentScalarConstants1.packedValues[32u]) / multiplyAddValue34;
            float quotientValue29 = (multiplyAddValue33 * fragmentScalarConstants1.packedValues[37u]) / multiplyAddValue34;
            float scalarValue43 = abs(scalarValue42);
            float sumValue40 = 1.0 - abs(scalarValue41);
            float sumValue41 = sumValue40 - scalarValue43;
            bool conditionValue2 = sumValue41 < 0.0;
            float comparisonValue20 = conditionValue2 ? (((scalarValue41 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue43)) : scalarValue41;
            float comparisonValue21 = conditionValue2 ? (((scalarValue42 >= 0.0) ? 1.0 : (-1.0)) * sumValue40) : scalarValue42;
            vec3 vectorValue = vec3(comparisonValue20, comparisonValue21, sumValue41);
            float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
            float productValue87 = inverseLengthValue11 * comparisonValue20;
            float productValue88 = inverseLengthValue11 * comparisonValue21;
            float productValue89 = inverseLengthValue11 * sumValue41;
            float multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue89, fma(fragmentVectorConstants1.packedValues[0u].x, productValue87, productValue88 * fragmentVectorConstants1.packedValues[1u].x));
            float multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue89, fma(fragmentVectorConstants1.packedValues[0u].y, productValue87, productValue88 * fragmentVectorConstants1.packedValues[1u].y));
            float multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue89, fma(fragmentVectorConstants1.packedValues[0u].z, productValue87, productValue88 * fragmentVectorConstants1.packedValues[1u].z));
            vec3 vectorValue1 = vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37);
            float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
            float productValue90 = inverseLengthValue12 * multiplyAddValue35;
            float productValue91 = inverseLengthValue12 * multiplyAddValue36;
            float productValue92 = inverseLengthValue12 * multiplyAddValue37;
            vec4 sampledTextureValue16 = textureGrad(sampler2D(materialTexture1, textureSampler1), vec2(productValue85, productValue86), vec2(scalarValue34, scalarValue35), vec2(scalarValue31, scalarValue30));
            float scalarValue44 = sampledTextureValue16.x;
            float scalarValue45 = sampledTextureValue16.y;
            float scalarValue46 = sampledTextureValue16.z;
            float scalarValue47 = sampledTextureValue16.w;
            float productValue93 = spvNClamp((scalarValue47 - 0.501960813999176025390625) * 2.007874011993408203125, 0.0, 1.0);
            bool comparisonValue22 = fragmentScalarConstants1.packedValues[388u] != 0.0;
            float sumValue42 = 1.0 - productValue93;
            float productValue94 = sumValue42 * 0.039999999105930328369140625;
            float productValue95 = sumValue42 * 0.3183098733425140380859375;
            float multiplyAddValue38 = fma(comparisonValue22 ? exp2(log2(spvNMax(scalarValue44, 0.0)) * 2.2000000476837158203125) : ((scalarValue44 <= 0.040449999272823333740234375) ? (scalarValue44 * 0.077399380505084991455078125) : exp2(log2((scalarValue44 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), productValue93, productValue94);
            float multiplyAddValue39 = fma(comparisonValue22 ? exp2(log2(spvNMax(scalarValue45, 0.0)) * 2.2000000476837158203125) : ((scalarValue45 <= 0.040449999272823333740234375) ? (scalarValue45 * 0.077399380505084991455078125) : exp2(log2((scalarValue45 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), productValue93, productValue94);
            float multiplyAddValue40 = fma(comparisonValue22 ? exp2(log2(spvNMax(scalarValue46, 0.0)) * 2.2000000476837158203125) : ((scalarValue46 <= 0.040449999272823333740234375) ? (scalarValue46 * 0.077399380505084991455078125) : exp2(log2((scalarValue46 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), productValue93, productValue94);
            vec4 sampledTextureValue17 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(productValue85, productValue86), vec2(scalarValue34, scalarValue35), vec2(scalarValue31, scalarValue30));
            float scalarValue48 = sampledTextureValue17.x;
            vec3 vectorValue2 = vec3(quotientValue28, quotientValue29, quotientValue25);
            float nonlinearValue3 = sqrt(rdDot3Precise2(vectorValue2, vectorValue2)) + 9.9999997473787516355514526367188e-05;
            float productValue96 = spvNClamp((0.4980392158031463623046875 - scalarValue47) * 2.007874011993408203125, 0.0, 1.0) * fragmentScalarConstants1.packedValues[444u];
            vec3 vectorValue3 = vec3(productValue90, productValue91, productValue92);
            float multiplyAddValue30;
            float intermediateValue60;
            if (uint(int(fragmentScalarConstants1.packedValues[220u])) == 1u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue9 = 0.0;
            branchMergedValue12 = 0.0;
            branchMergedValue13 = 0.0;
            branchMergedValue14 = 0.0;
            branchMergedValue15 = 0.0;
            branchMergedValue16 = 0.0;
        }
        else
        {
            float productValue37;
            float intermediateValue19;
            if (uint(int(fragmentVectorConstants1.packedValues[55u].x)) == 1u)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                float multiplyAddValue41 = (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue25, fma(fragmentVectorConstants1.packedValues[4u].x, quotientValue26, quotientValue27 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) - fragmentVectorConstants1.packedValues[90u].x;
                float multiplyAddValue42 = (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue25, fma(fragmentVectorConstants1.packedValues[4u].y, quotientValue26, quotientValue27 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) - fragmentVectorConstants1.packedValues[90u].y;
                float multiplyAddValue43 = (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue25, fma(fragmentVectorConstants1.packedValues[4u].z, quotientValue26, quotientValue27 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) - fragmentVectorConstants1.packedValues[90u].z;
                vec3 vectorValue4 = vec3(scalarValue39, scalarValue33, scalarValue36);
                float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
                float productValue97 = inverseLengthValue13 * scalarValue39;
                float productValue98 = inverseLengthValue13 * scalarValue33;
                float productValue99 = inverseLengthValue13 * scalarValue36;
                vec3 vectorValue5 = vec3(scalarValue38, scalarValue32, scalarValue37);
                float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
                float productValue100 = scalarValue38 * inverseLengthValue14;
                float productValue101 = scalarValue32 * inverseLengthValue14;
                float productValue102 = scalarValue37 * inverseLengthValue14;
                float multiplyAddValue44 = fma(productValue99, productValue101, -(productValue100 * productValue97));
                float multiplyAddValue45 = fma(productValue97, productValue102, -(productValue101 * productValue98));
                float multiplyAddValue46 = fma(productValue98, productValue100, -(productValue102 * productValue99));
                vec3 vectorValue6 = vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46);
                float inverseLengthValue15 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
                float productValue103 = multiplyAddValue44 * inverseLengthValue15;
                float productValue104 = multiplyAddValue45 * inverseLengthValue15;
                float productValue105 = multiplyAddValue46 * inverseLengthValue15;
                float multiplyAddValue47 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue105, fma(fragmentVectorConstants1.packedValues[4u].x, productValue103, productValue104 * fragmentVectorConstants1.packedValues[5u].x));
                float multiplyAddValue48 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue105, fma(fragmentVectorConstants1.packedValues[4u].y, productValue103, productValue104 * fragmentVectorConstants1.packedValues[5u].y));
                float multiplyAddValue49 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue105, fma(fragmentVectorConstants1.packedValues[4u].z, productValue103, productValue104 * fragmentVectorConstants1.packedValues[5u].z));
                vec3 vectorValue7 = vec3(multiplyAddValue47, multiplyAddValue48, multiplyAddValue49);
                float inverseLengthValue16 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
                float quotientValue30 = roundEven((multiplyAddValue47 * inverseLengthValue16) / fragmentScalarConstants1.packedValues[428u]) * fragmentScalarConstants1.packedValues[428u];
                float quotientValue31 = roundEven((multiplyAddValue48 * inverseLengthValue16) / fragmentScalarConstants1.packedValues[428u]) * fragmentScalarConstants1.packedValues[428u];
                float quotientValue32 = roundEven((multiplyAddValue49 * inverseLengthValue16) / fragmentScalarConstants1.packedValues[428u]) * fragmentScalarConstants1.packedValues[428u];
                vec3 vectorValue8 = vec3(quotientValue30, quotientValue31, quotientValue32);
                float inverseLengthValue17 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
                float productValue106 = quotientValue30 * inverseLengthValue17;
                float productValue107 = quotientValue31 * inverseLengthValue17;
                float productValue108 = quotientValue32 * inverseLengthValue17;
                float scalarValue49 = -fragmentScalarConstants1.packedValues[214u];
                float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[214u], 0.5, -fma(scalarValue49, floor(multiplyAddValue41 / fragmentScalarConstants1.packedValues[214u]), multiplyAddValue41));
                float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[214u], 0.5, -fma(scalarValue49, floor(multiplyAddValue42 / fragmentScalarConstants1.packedValues[214u]), multiplyAddValue42));
                float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[214u], 0.5, -fma(scalarValue49, floor(multiplyAddValue43 / fragmentScalarConstants1.packedValues[214u]), multiplyAddValue43));
                float scalarValue50 = -rdDot3Precise2(vec3(multiplyAddValue50, multiplyAddValue51, multiplyAddValue52), vec3(productValue106, productValue107, productValue108));
                bool conditionValue3 = int(uint(int(fragmentScalarConstants1.packedValues[213u]))) > int(0u);
                float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentScalarConstants1.packedValues[419u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentScalarConstants1.packedValues[418u], fma(fragmentVectorConstants1.packedValues[0u].x, fragmentScalarConstants1.packedValues[416u], fragmentVectorConstants1.packedValues[1u].x * fragmentScalarConstants1.packedValues[417u])));
                float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentScalarConstants1.packedValues[419u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentScalarConstants1.packedValues[418u], fma(fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[416u], fragmentVectorConstants1.packedValues[1u].y * fragmentScalarConstants1.packedValues[417u])));
                float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentScalarConstants1.packedValues[419u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentScalarConstants1.packedValues[418u], fma(fragmentVectorConstants1.packedValues[0u].z, fragmentScalarConstants1.packedValues[416u], fragmentVectorConstants1.packedValues[1u].z * fragmentScalarConstants1.packedValues[417u])));
                vec3 vectorValue9 = vec3(multiplyAddValue53, multiplyAddValue54, multiplyAddValue55);
                float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
                float productValue109 = spvNMax(rdDot3Precise2(vectorValue3, vec3(inverseLengthValue18 * multiplyAddValue53, inverseLengthValue18 * multiplyAddValue54, inverseLengthValue18 * multiplyAddValue55)), 0.0);
                float sumValue43 = spvNMax(1.0 - productValue109, 0.0);
                float multiplyAddValue56 = fma(productValue87 * fragmentScalarConstants1.packedValues[439u], sumValue43, conditionValue3 ? ((fma(scalarValue50, productValue106, multiplyAddValue50) + multiplyAddValue41) + fragmentVectorConstants1.packedValues[90u].x) : (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue25, fma(fragmentVectorConstants1.packedValues[4u].x, quotientValue28, quotientValue29 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x));
                float multiplyAddValue57 = fma(productValue88 * fragmentScalarConstants1.packedValues[439u], sumValue43, conditionValue3 ? ((fma(scalarValue50, productValue107, multiplyAddValue51) + multiplyAddValue42) + fragmentVectorConstants1.packedValues[90u].y) : (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue25, fma(fragmentVectorConstants1.packedValues[4u].y, quotientValue28, quotientValue29 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y));
                float multiplyAddValue60 = fma(productValue89 * fragmentScalarConstants1.packedValues[439u], sumValue43, conditionValue3 ? ((fma(scalarValue50, productValue108, multiplyAddValue52) + multiplyAddValue43) + fragmentVectorConstants1.packedValues[90u].z) : (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue25, fma(fragmentVectorConstants1.packedValues[4u].z, quotientValue28, quotientValue29 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z));
                uint scalarValue51 = uint(int(rdDot4Precise(vec4(spvNClamp(fragmentVectorConstants1.packedValues[57u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[57u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[57u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[57u].w, 0.0, 1.0)), vec4(1.0))));
                bool comparisonValue23 = fragmentScalarConstants1.packedValues[212u] != 0.0;
                float intermediateValue61;
                float intermediateValue69;
                intermediateValue69 = 1.0;
                intermediateValue61 = 1.0;
                uint sumValue6;
                float intermediateValue70;
                float intermediateValue71;
                uint intermediateValue73;
                uint scalarValue13 = 0u;
                uint scalarValue14 = 0u;
                for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentVectorConstants1.packedValues[104u].w, fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[104u].z, fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[104u].y, fragmentVectorConstants1.packedValues[104u].x * fragmentVectorConstants1.packedValues[0u].x)));
                float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentVectorConstants1.packedValues[104u].w, fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[104u].z, fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[104u].y, fragmentVectorConstants1.packedValues[104u].x * fragmentVectorConstants1.packedValues[0u].y)));
                float multiplyAddValue14 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentVectorConstants1.packedValues[104u].w, fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[104u].z, fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[104u].y, fragmentVectorConstants1.packedValues[104u].x * fragmentVectorConstants1.packedValues[0u].z)));
                float inverseLengthValue8 = inversesqrt(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14)));
                float dotProductValue1 = spvNMax(dot(vec3(productValue27, productValue28, productValue29), vec3(inverseLengthValue8 * multiplyAddValue12, inverseLengthValue8 * multiplyAddValue13, inverseLengthValue8 * multiplyAddValue14)), 0.0);
                float productValue36 = spvNClamp(1.0 - dotProductValue1, 0.0, 1.0) * fragmentVectorConstants1.packedValues[109u].w;
                float multiplyAddValue15 = (productValue36 * productValue24) + (conditionValue1 ? (((quotientValue11 + multiplyAddValue) - (dotProductValue * productValue17)) + fragmentVectorConstants1.packedValues[90u].x) : (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].x, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x));
                float multiplyAddValue16 = (productValue36 * productValue25) + (conditionValue1 ? (((multiplyAddValue1 - (dotProductValue * productValue18)) + quotientValue12) + fragmentVectorConstants1.packedValues[90u].y) : (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].y, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y));
                float multiplyAddValue17 = (productValue36 * productValue26) + (conditionValue1 ? (((multiplyAddValue2 - (dotProductValue * productValue19)) + quotientValue13) + fragmentVectorConstants1.packedValues[90u].z) : (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z));
                uint dotProductValue2 = uint(int(dot(vec4(spvNClamp(fragmentVectorConstants1.packedValues[57u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[57u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[57u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[57u].w, 0.0, 1.0)), vec4(1.0))));
                float intermediateValue20;
                float intermediateValue23;
                if (int(dotProductValue2) > int(0u))
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    if (int(scalarValue51) <= int(scalarValue14))
                    {
                        break;
                    }
                    uint comparisonValue24 = uint(min(int(uint(int((scalarValue14 == 3u) ? fragmentVectorConstants1.packedValues[57u].w : ((scalarValue14 == 2u) ? fragmentVectorConstants1.packedValues[57u].z : ((scalarValue14 == 1u) ? fragmentVectorConstants1.packedValues[57u].y : ((scalarValue14 == 0u) ? fragmentVectorConstants1.packedValues[57u].x : 0.0))))) + scalarValue13), int(8u)));
                    intermediateValue70 = intermediateValue69;
                    intermediateValue71 = intermediateValue61;
                    intermediateValue73 = scalarValue13;
                    float quotientValue16;
                    float quotientValue17;
                    uint intermediateValue75;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float intermediateValue22;
                    float intermediateValue24;
                    uint intermediateValue28;
                    float scalarValue11 = 1.0;
                    float scalarValue12 = 1.0;
                    uint scalarValue13 = 0u;
                    uint scalarValue14 = 0u;
                    uint sumValue16;
                    bool intermediateValue30;
#endif
                    for (;;)
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        if (int(comparisonValue24) <= int(intermediateValue73))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        sumValue16 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[scalarValue14 + 228u])) + scalarValue13), int(8u)));
                        intermediateValue30 = int(scalarValue13) < int(sumValue16);
                        uint branchMergedValue;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (intermediateValue30)
                        {
                            float intermediateValue33;
                            float intermediateValue34;
                            uint intermediateValue35;
                            float scalarValue15 = scalarValue11;
                            float scalarValue16 = scalarValue12;
                            uint scalarValue17 = scalarValue13;
                            uint bitwiseValue2;
                            float multiplyAddValue25;
                            float multiplyAddValue26;
                            float multiplyAddValue27;
                            bool comparisonValue4;
                            for (;;)
                            {
                                bitwiseValue2 = scalarValue17 << 2u;
                                uint sumValue10 = bitwiseValue2 + 58u;
                                uint sumValue11 = bitwiseValue2 + 59u;
                                uint sumValue14 = bitwiseValue2 + 60u;
                                uint sumValue17 = bitwiseValue2 + 61u;
                                multiplyAddValue25 = fma(fragmentVectorConstants1.packedValues[sumValue14].x, multiplyAddValue17, fma(fragmentVectorConstants1.packedValues[sumValue11].x, multiplyAddValue16, fragmentVectorConstants1.packedValues[sumValue10].x * multiplyAddValue15)) + fragmentVectorConstants1.packedValues[sumValue17].x;
                                multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[sumValue14].y, multiplyAddValue17, fma(fragmentVectorConstants1.packedValues[sumValue11].y, multiplyAddValue16, fragmentVectorConstants1.packedValues[sumValue10].y * multiplyAddValue15)) + fragmentVectorConstants1.packedValues[sumValue17].y;
                                multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[sumValue14].z, multiplyAddValue17, fma(fragmentVectorConstants1.packedValues[sumValue11].z, multiplyAddValue16, fragmentVectorConstants1.packedValues[sumValue10].z * multiplyAddValue15)) + fragmentVectorConstants1.packedValues[sumValue17].z;
                                comparisonValue4 = ((abs(multiplyAddValue25) <= 1.0) && (abs(multiplyAddValue26) <= 1.0)) && (abs(multiplyAddValue27) <= 1.0);
                                float branchMergedValue1;
                                uint branchMergedValue7;
                                float branchMergedValue8;
                                if (comparisonValue4)
                                {
                                    uint sumValue20 = scalarValue17 + 44u;
                                    float sumValue22 = spvNMin(spvNMax(dotProductValue1, fragmentScalarConstants1.packedValues[scalarValue17 + 224u]), 1.0);
                                    float nonlinearValue1 = (sqrt(1.0 - (sumValue22 * sumValue22)) / sumValue22) * fragmentVectorConstants1.packedValues[sumValue20].z;
                                    float productValue38 = (multiplyAddValue25 * 0.5) + 0.5;
                                    float productValue39 = 0.5 - (multiplyAddValue26 * 0.5);
                                    uint sumValue24 = bitwiseValue2 + 14u;
                                    float nonlinearValue2 = sqrt((((fragmentVectorConstants1.packedValues[sumValue24].x * fragmentVectorConstants1.packedValues[sumValue24].x) + (fragmentVectorConstants1.packedValues[sumValue24].y * fragmentVectorConstants1.packedValues[sumValue24].y)) + (fragmentVectorConstants1.packedValues[sumValue24].z * fragmentVectorConstants1.packedValues[sumValue24].z)) + (fragmentVectorConstants1.packedValues[sumValue24].w * fragmentVectorConstants1.packedValues[sumValue24].w)) * fragmentVectorConstants1.packedValues[111u].z;
                                    uint comparisonValue2 = (fragmentVectorConstants1.packedValues[53u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[sumValue20].w + 0.5))), int(1u)))), int(9u)));
                                    uint quotientValue19 = uint(int(comparisonValue2) / int(2u));
                                    float intermediateValue49;
                                    float intermediateValue50;
                                    if (int(comparisonValue2) > int(0u))
                                    {
                                        float sumValue29;
                                        float productValue67;
                                        float intermediateValue58;
                                        float intermediateValue59;
                                        uint intermediateValue60;
                                        float scalarValue18 = 0.0;
                                        float scalarValue19 = 0.0;
                                        uint scalarValue20 = 0u;
                                        for (;;)
                                        {
                                            intermediateValue58 = scalarValue18;
                                            intermediateValue59 = scalarValue19;
                                            intermediateValue60 = 0u;
                                            float intermediateValue66;
                                            float intermediateValue61;
                                            float intermediateValue62;
                                            float intermediateValue63;
                                            float intermediateValue64;
                                            float productValue75;
                                            float productValue76;
                                            bool comparisonValue14;
                                            float sumValue33;
                                            for (;;)
                                            {
                                                float productValue40 = (productValue38 + ((float(int(intermediateValue60 - quotientValue19)) + 0.5) * fragmentVectorConstants1.packedValues[109u].x)) * fragmentVectorConstants1.packedValues[sumValue20].x;
                                                float productValue41 = (productValue39 + (fragmentVectorConstants1.packedValues[109u].x * (float(int(scalarValue20 - quotientValue19)) + 0.5))) * fragmentVectorConstants1.packedValues[sumValue20].x;
                                                vec4 sampledTextureValue6 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue40, productValue41, float(int(scalarValue17))));
                                                intermediateValue61 = sampledTextureValue6.x;
                                                intermediateValue62 = sampledTextureValue6.y;
                                                intermediateValue63 = sampledTextureValue6.z;
                                                intermediateValue64 = sampledTextureValue6.w;
                                                productValue75 = fract((productValue40 * fragmentVectorConstants1.packedValues[109u].z) + 0.5);
                                                productValue76 = fract((productValue41 * fragmentVectorConstants1.packedValues[109u].z) + 0.5);
                                                float productValue42 = spvNClamp((multiplyAddValue27 - intermediateValue61) * nonlinearValue2, 0.0, 1.0);
                                                float productValue43 = spvNClamp((multiplyAddValue27 - intermediateValue62) * nonlinearValue2, 0.0, 1.0);
                                                float productValue44 = spvNClamp((multiplyAddValue27 - intermediateValue63) * nonlinearValue2, 0.0, 1.0);
                                                float productValue45 = spvNClamp((multiplyAddValue27 - intermediateValue64) * nonlinearValue2, 0.0, 1.0);
                                                float productValue46 = 1.0 - ((productValue42 * productValue42) * (3.0 - (productValue42 * 2.0)));
                                                float productValue47 = 1.0 - ((productValue45 * productValue45) * (3.0 - (productValue45 * 2.0)));
                                                float productValue48 = (((1.0 - ((productValue44 * productValue44) * (3.0 - (productValue44 * 2.0)))) - productValue47) * productValue75) + productValue47;
                                                productValue67 = (productValue48 + intermediateValue59) + ((((((1.0 - ((productValue43 * productValue43) * (3.0 - (productValue43 * 2.0)))) - productValue46) * productValue75) + productValue46) - productValue48) * productValue76);
                                                comparisonValue14 = fragmentVectorConstants1.packedValues[53u].x != 0.0;
                                                sumValue33 = (multiplyAddValue27 - fragmentVectorConstants1.packedValues[sumValue20].y) - nonlinearValue1;
                                                float branchMergedValue4;
                                                if (comparisonValue14)
                                                {
                                                    branchMergedValue4 = float(intermediateValue64 >= sumValue33);
                                                }
                                                else
                                                {
                                                    float comparisonValue3 = (intermediateValue61 < sumValue33) ? 0.0 : 1.0;
                                                    float comparisonValue7 = (intermediateValue64 < sumValue33) ? 0.0 : 1.0;
                                                    float comparisonValue9 = ((((intermediateValue63 < sumValue33) ? 0.0 : 1.0) - comparisonValue7) * productValue75) + comparisonValue7;
                                                    branchMergedValue4 = (((((((intermediateValue62 < sumValue33) ? 0.0 : 1.0) - comparisonValue3) * productValue75) + comparisonValue3) - comparisonValue9) * productValue76) + comparisonValue9;
                                                }
                                                intermediateValue66 = branchMergedValue4;
                                                sumValue29 = intermediateValue66 + intermediateValue58;
                                                uint sumValue25 = intermediateValue60 + 1u;
                                                if (sumValue25 == comparisonValue2)
                                                {
                                                    break;
                                                }
                                                else
                                                {
                                                    intermediateValue58 = sumValue29;
                                                    intermediateValue59 = productValue67;
                                                    intermediateValue60 = sumValue25;
                                                    continue;
                                                }
                                            }
                                            uint sumValue26 = scalarValue20 + 1u;
                                            if (sumValue26 == comparisonValue2)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                scalarValue18 = sumValue29;
                                                scalarValue19 = productValue67;
                                                scalarValue20 = sumValue26;
                                                continue;
                                            }
                                        }
                                        intermediateValue49 = sumValue29;
                                        intermediateValue50 = productValue67;
                                    }
                                    else
                                    {
                                        intermediateValue49 = 0.0;
                                        intermediateValue50 = 0.0;
                                    }
                                    float productValue49 = float(int(comparisonValue2 * comparisonValue2));
                                    branchMergedValue1 = spvNMin(scalarValue15, intermediateValue50 / productValue49);
                                    branchMergedValue7 = sumValue16;
                                    branchMergedValue8 = spvNMin(scalarValue16, intermediateValue49 / productValue49);
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue15;
                                    branchMergedValue7 = scalarValue17 + 1u;
                                    branchMergedValue8 = scalarValue16;
                                }
                                intermediateValue33 = branchMergedValue1;
                                intermediateValue35 = branchMergedValue7;
                                intermediateValue34 = branchMergedValue8;
                                if (int(intermediateValue35) < int(sumValue16))
                                {
                                    scalarValue15 = intermediateValue33;
                                    scalarValue16 = intermediateValue34;
                                    scalarValue17 = intermediateValue35;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            branchMergedValue = intermediateValue35;
                            branchMergedValue5 = intermediateValue33;
                            branchMergedValue6 = intermediateValue34;
                        }
                        else
                        {
                            branchMergedValue = scalarValue13;
                            branchMergedValue5 = scalarValue11;
                            branchMergedValue6 = scalarValue12;
                        }
                        intermediateValue28 = branchMergedValue;
                        intermediateValue22 = branchMergedValue5;
                        intermediateValue24 = branchMergedValue6;
                        uint sumValue27 = scalarValue14 + 1u;
                        if (sumValue27 == dotProductValue2)
#endif
                        {
                            break;
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        uint bitwiseValue3 = intermediateValue73 << 2u;
                        uint sumValue44 = bitwiseValue3 + 59u;
                        uint sumValue45 = bitwiseValue3 + 58u;
                        uint sumValue46 = bitwiseValue3 + 60u;
                        uint sumValue47 = bitwiseValue3 + 61u;
                        float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[sumValue46].x, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[sumValue45].x, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[sumValue44].x)) + fragmentVectorConstants1.packedValues[sumValue47].x;
                        float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[sumValue46].y, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[sumValue45].y, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[sumValue44].y)) + fragmentVectorConstants1.packedValues[sumValue47].y;
                        float multiplyAddValue63 = fma(fragmentVectorConstants1.packedValues[sumValue46].z, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[sumValue45].z, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[sumValue44].z)) + fragmentVectorConstants1.packedValues[sumValue47].z;
                        if (((abs(multiplyAddValue61) <= 1.0) && (abs(multiplyAddValue62) <= 1.0)) && (abs(multiplyAddValue63) <= 1.0))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        else
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            float comparisonValue25 = spvNMin(spvNMax(productValue109, (intermediateValue73 == 3u) ? fragmentVectorConstants1.packedValues[56u].w : ((intermediateValue73 == 2u) ? fragmentVectorConstants1.packedValues[56u].z : ((intermediateValue73 == 1u) ? fragmentVectorConstants1.packedValues[56u].y : ((intermediateValue73 == 0u) ? fragmentVectorConstants1.packedValues[56u].x : 0.0)))), 1.0);
                            float multiplyAddValue64 = fma(multiplyAddValue61, 0.5, 0.5);
                            uint sumValue48 = bitwiseValue3 + 14u;
                            float nonlinearValue4 = sqrt(rdDot4Precise(fragmentVectorConstants1.packedValues[sumValue48], fragmentVectorConstants1.packedValues[sumValue48])) * fragmentScalarConstants1.packedValues[446u];
                            uint clampedValue = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[(((16u * intermediateValue73) + 704u) + 12u) >> 2u] + 0.5))), int(1u), int(9u)));
                            bool conditionValue4 = !comparisonValue23;
                            uint comparisonValue26 = (comparisonValue23 ? 1u : clampedValue) >> 1u;
                            float multiplyAddValue65 = 1.0 - fma(multiplyAddValue62, 0.5, 0.5);
                            float scalarValue52 = rdSignedBitsToFloat(intermediateValue73);
                            float multiplyAddValue66 = multiplyAddValue63 - fma(fragmentScalarConstants1.packedValues[(((16u * intermediateValue73) + 704u) + 8u) >> 2u], sqrt(fma(-comparisonValue25, comparisonValue25, 1.0)) / comparisonValue25, fragmentScalarConstants1.packedValues[(((16u * intermediateValue73) + 704u) + 4u) >> 2u]);
                            float intermediateValue91;
                            float intermediateValue93;
                            intermediateValue91 = 0.0;
                            intermediateValue93 = 0.0;
                            uint sumValue15;
                            float intermediateValue92;
                            float intermediateValue94;
                            uint scalarValue20 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            scalarValue11 = intermediateValue22;
                            scalarValue12 = intermediateValue24;
                            scalarValue13 = intermediateValue28;
                            scalarValue14 = sumValue27;
                            continue;
                        }
                    }
                    intermediateValue20 = intermediateValue22;
                    intermediateValue23 = intermediateValue24;
                }
                else
                {
                    intermediateValue20 = 1.0;
                    intermediateValue23 = 1.0;
                }
                float intermediateValue32;
                if (int(uint(int(fragmentVectorConstants1.packedValues[52u].x))) > int(0u))
                {
                    float scalarValue21 = spvNMin(spvNMax(dotProductValue1, fragmentVectorConstants1.packedValues[56u].x), 1.0);
                    float multiplyAddValue18 = spvNMin(((fragmentVectorConstants1.packedValues[103u].z - fragmentVectorConstants1.packedValues[44u].y) + fma(fragmentVectorConstants1.packedValues[102u].z, multiplyAddValue17, fma(fragmentVectorConstants1.packedValues[101u].z, multiplyAddValue16, fragmentVectorConstants1.packedValues[100u].z * multiplyAddValue15))) - ((sqrt(1.0 - (scalarValue21 * scalarValue21)) / scalarValue21) * fragmentVectorConstants1.packedValues[44u].z), 1.0);
                    float multiplyAddValue19 = (((fma(fragmentVectorConstants1.packedValues[102u].x, multiplyAddValue17, fma(fragmentVectorConstants1.packedValues[101u].x, multiplyAddValue16, fragmentVectorConstants1.packedValues[100u].x * multiplyAddValue15)) + fragmentVectorConstants1.packedValues[103u].x) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[52u].y;
                    float multiplyAddValue20 = (0.5 - ((fma(fragmentVectorConstants1.packedValues[102u].y, multiplyAddValue17, fma(fragmentVectorConstants1.packedValues[101u].y, multiplyAddValue16, fragmentVectorConstants1.packedValues[100u].y * multiplyAddValue15)) + fragmentVectorConstants1.packedValues[103u].y) * 0.5)) * fragmentVectorConstants1.packedValues[52u].y;
                    uint comparisonValue11 = (fragmentVectorConstants1.packedValues[53u].x != 0.0) ? 1u : 2u;
                    uint bitwiseValue = comparisonValue11 >> 1u;
                    float branchMergedValue10;
                    if ((multiplyAddValue20 < fragmentVectorConstants1.packedValues[52u].y) && (((multiplyAddValue19 >= 0.0) && (multiplyAddValue19 < fragmentVectorConstants1.packedValues[52u].y)) && (multiplyAddValue20 >= 0.0)))
                    {
                        float dotProductValue3 = dot(vec4(fragmentVectorConstants1.packedValues[57u]), vec4(1.0)) + 1.0;
                        float sumValue21;
                        float intermediateValue45;
                        uint intermediateValue46;
                        float scalarValue22 = 0.0;
                        uint scalarValue23 = 0u;
                        for (;;)
                        {
                            intermediateValue45 = scalarValue22;
                            intermediateValue46 = 0u;
                            float intermediateValue57;
                            float productValue65;
                            float productValue66;
                            bool comparisonValue6;
#endif
                            for (;;)
                            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                                if ((comparisonValue23 && (int(scalarValue20) >= int(1u))) || ((int(clampedValue) <= int(scalarValue20)) && conditionValue4))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float productValue50 = fragmentVectorConstants1.packedValues[52u].y * fragmentVectorConstants1.packedValues[52u].z;
                                productValue65 = (productValue50 * (float(int(intermediateValue46 - bitwiseValue)) + 0.5)) + multiplyAddValue19;
                                productValue66 = (productValue50 * (float(int(scalarValue23 - bitwiseValue)) + 0.5)) + multiplyAddValue20;
                                comparisonValue6 = fragmentVectorConstants1.packedValues[53u].x != 0.0;
                                float branchMergedValue2;
                                if (comparisonValue6)
                                {
                                    branchMergedValue2 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue65, productValue66, dotProductValue3), 0.0).x >= multiplyAddValue18);
                                }
                                else
                                {
                                    vec4 sampledTextureValue9 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue65, productValue66, dotProductValue3));
                                    float productValue51 = fract((fragmentVectorConstants1.packedValues[109u].z * productValue65) + 0.5);
                                    float comparisonValue12 = (sampledTextureValue9.x < multiplyAddValue18) ? 0.0 : 1.0;
                                    float comparisonValue13 = (sampledTextureValue9.w < multiplyAddValue18) ? 0.0 : 1.0;
                                    float comparisonValue15 = ((((sampledTextureValue9.z < multiplyAddValue18) ? 0.0 : 1.0) - comparisonValue13) * productValue51) + comparisonValue13;
                                    branchMergedValue2 = (((((((sampledTextureValue9.y < multiplyAddValue18) ? 0.0 : 1.0) - comparisonValue12) * productValue51) + comparisonValue12) - comparisonValue15) * fract((fragmentVectorConstants1.packedValues[109u].z * productValue66) + 0.5)) + comparisonValue15;
                                }
                                intermediateValue57 = branchMergedValue2;
                                sumValue21 = intermediateValue57 + intermediateValue45;
                                uint sumValue28 = intermediateValue46 + 1u;
                                if (int(sumValue28) < int(comparisonValue11))
                                {
                                    intermediateValue45 = sumValue21;
                                    intermediateValue46 = sumValue28;
                                    continue;
                                }
                                else
#endif
                                {
                                    break;
                                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                                float sumValue49 = rdSignedBitsToFloat(scalarValue20 - comparisonValue26) + 0.5;
                                intermediateValue92 = intermediateValue91;
                                intermediateValue94 = intermediateValue93;
                                float multiplyAddValue58;
                                float multiplyAddValue59;
                                uint sumValue21;
                                uint scalarValue23 = 0u;
                                for (;;)
                                {
                                    if ((comparisonValue23 && (int(scalarValue23) >= int(1u))) || (conditionValue4 && (int(clampedValue) <= int(scalarValue23))))
                                    {
                                        break;
                                    }
                                    uint bitwiseValue4 = (((16u * intermediateValue73) + 704u) + 0u) >> 2u;
                                    float multiplyAddValue67 = fma(multiplyAddValue64, fragmentScalarConstants1.packedValues[bitwiseValue4], ((rdSignedBitsToFloat(scalarValue23 - comparisonValue26) + 0.5) * fragmentScalarConstants1.packedValues[436u]) * fragmentScalarConstants1.packedValues[bitwiseValue4]);
                                    float multiplyAddValue68 = fma(multiplyAddValue65, fragmentScalarConstants1.packedValues[bitwiseValue4], (sumValue49 * fragmentScalarConstants1.packedValues[436u]) * fragmentScalarConstants1.packedValues[bitwiseValue4]);
                                    vec4 sampledTextureValue18 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue67, multiplyAddValue68, scalarValue52));
                                    float scalarValue53 = sampledTextureValue18.x;
                                    float scalarValue54 = sampledTextureValue18.y;
                                    float scalarValue55 = sampledTextureValue18.z;
                                    float scalarValue56 = sampledTextureValue18.w;
                                    float multiplyAddValue69 = fract(fma(multiplyAddValue67, fragmentScalarConstants1.packedValues[438u], 0.5));
                                    float multiplyAddValue70 = fract(fma(multiplyAddValue68, fragmentScalarConstants1.packedValues[438u], 0.5));
                                    float productValue110 = spvNClamp(nonlinearValue4 * (multiplyAddValue63 - scalarValue53), 0.0, 1.0);
                                    float productValue111 = spvNClamp(nonlinearValue4 * (multiplyAddValue63 - scalarValue54), 0.0, 1.0);
                                    float productValue112 = spvNClamp(nonlinearValue4 * (multiplyAddValue63 - scalarValue55), 0.0, 1.0);
                                    float productValue113 = spvNClamp(nonlinearValue4 * (multiplyAddValue63 - scalarValue56), 0.0, 1.0);
                                    float multiplyAddValue71 = fma(-fma(productValue110, -2.0, 3.0), productValue110 * productValue110, 1.0);
                                    float multiplyAddValue72 = fma(-fma(productValue113, -2.0, 3.0), productValue113 * productValue113, 1.0);
                                    float multiplyAddValue73 = fma(multiplyAddValue69, fma(-fma(productValue112, -2.0, 3.0), productValue112 * productValue112, 1.0) - multiplyAddValue72, multiplyAddValue72);
                                    multiplyAddValue59 = intermediateValue94 + fma(multiplyAddValue70, fma(multiplyAddValue69, fma(-fma(productValue111, -2.0, 3.0), productValue111 * productValue111, 1.0) - multiplyAddValue71, multiplyAddValue71) - multiplyAddValue73, multiplyAddValue73);
                                    bool comparisonValue27 = scalarValue56 >= multiplyAddValue66;
                                    bool comparisonValue28 = scalarValue53 >= multiplyAddValue66;
                                    float comparisonValue29 = float(scalarValue54 >= multiplyAddValue66);
                                    float comparisonValue30 = float(scalarValue55 >= multiplyAddValue66);
                                    float multiplyAddValue74 = fma(multiplyAddValue69, comparisonValue27 ? (comparisonValue30 - 1.0) : comparisonValue30, float(comparisonValue27));
                                    multiplyAddValue58 = comparisonValue23 ? (comparisonValue27 ? (intermediateValue92 + 1.0) : intermediateValue92) : (intermediateValue92 + fma(multiplyAddValue70, fma(multiplyAddValue69, comparisonValue28 ? (comparisonValue29 - 1.0) : comparisonValue29, float(comparisonValue28)) - multiplyAddValue74, multiplyAddValue74));
                                    sumValue21 = scalarValue23 + 1u;
                                    intermediateValue92 = multiplyAddValue58;
                                    intermediateValue94 = multiplyAddValue59;
                                    scalarValue23 = sumValue21;
                                    continue;
                                }
                                sumValue15 = scalarValue20 + 1u;
                                intermediateValue91 = intermediateValue92;
                                intermediateValue93 = intermediateValue94;
                                scalarValue20 = sumValue15;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            }
                            uint sumValue30 = scalarValue23 + 1u;
                            if (int(sumValue30) < int(comparisonValue11))
                            {
                                scalarValue22 = sumValue21;
                                scalarValue23 = sumValue30;
#endif
                                continue;
                            }
#if RD_PLATFORM == RD_PLATFORM_SM50
                            float comparisonValue31 = rdSignedBitsToFloat(comparisonValue23 ? 1u : (clampedValue * clampedValue));
                            intermediateValue75 = comparisonValue24;
                            quotientValue17 = spvNMin(intermediateValue93 / comparisonValue31, intermediateValue71);
                            quotientValue16 = spvNMin(intermediateValue91 / comparisonValue31, intermediateValue70);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            else
                            {
                                break;
                            }
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        else
                        {
                            intermediateValue75 = intermediateValue73 + 1u;
                            quotientValue17 = intermediateValue71;
                            quotientValue16 = intermediateValue70;
                        }
                        intermediateValue70 = quotientValue16;
                        intermediateValue71 = quotientValue17;
                        intermediateValue73 = intermediateValue75;
                        continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        branchMergedValue10 = sumValue21 / float(int(comparisonValue11 * comparisonValue11));
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM50
                    sumValue6 = scalarValue14 + 1u;
                    intermediateValue69 = intermediateValue70;
                    intermediateValue61 = intermediateValue71;
                    scalarValue13 = intermediateValue73;
                    scalarValue14 = sumValue6;
                    continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    else
                    {
                        branchMergedValue10 = 1.0;
                    }
                    intermediateValue32 = branchMergedValue10;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                float intermediateValue76;
                if (int(uint(int(fragmentScalarConstants1.packedValues[208u]))) > int(0u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                else
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    float multiplyAddValue75 = fma(fma(fragmentVectorConstants1.packedValues[102u].x, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[100u].x, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[101u].x)) + fragmentVectorConstants1.packedValues[103u].x, 0.5, 0.5) * fragmentScalarConstants1.packedValues[209u];
                    float multiplyAddValue76 = (1.0 - fma(fma(fragmentVectorConstants1.packedValues[102u].y, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[100u].y, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[101u].y)) + fragmentVectorConstants1.packedValues[103u].y, 0.5, 0.5)) * fragmentScalarConstants1.packedValues[209u];
                    float comparisonValue5;
                    if (((multiplyAddValue76 >= 0.0) && ((multiplyAddValue75 >= 0.0) && (multiplyAddValue75 < fragmentScalarConstants1.packedValues[209u]))) && (multiplyAddValue76 < fragmentScalarConstants1.packedValues[209u]))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    intermediateValue32 = 1.0;
                }
                float intermediateValue37;
                if ((int(uint(int(fragmentVectorConstants1.packedValues[55u].y))) > int(0u)) && (int(uint(int(fragmentVectorConstants1.packedValues[95u].x))) > int(0u)))
                {
                    float multiplyAddValue21 = fma(fragmentVectorConstants1.packedValues[93u].w, multiplyAddValue17, fma(fragmentVectorConstants1.packedValues[92u].w, multiplyAddValue16, fragmentVectorConstants1.packedValues[91u].w * multiplyAddValue15)) + fragmentVectorConstants1.packedValues[94u].w;
                    float scalarValue24 = spvNMin(spvNMax(dotProductValue1, fragmentVectorConstants1.packedValues[56u].x), 1.0);
                    float multiplyAddValue22 = (((fma(fragmentVectorConstants1.packedValues[93u].z, multiplyAddValue17, fma(fragmentVectorConstants1.packedValues[92u].z, multiplyAddValue16, fragmentVectorConstants1.packedValues[91u].z * multiplyAddValue15)) + fragmentVectorConstants1.packedValues[94u].z) / multiplyAddValue21) - fragmentVectorConstants1.packedValues[44u].y) - ((sqrt(1.0 - (scalarValue24 * scalarValue24)) / scalarValue24) * fragmentVectorConstants1.packedValues[44u].z);
                    float multiplyAddValue23 = (((fma(fragmentVectorConstants1.packedValues[93u].x, multiplyAddValue17, fma(fragmentVectorConstants1.packedValues[92u].x, multiplyAddValue16, fragmentVectorConstants1.packedValues[91u].x * multiplyAddValue15)) + fragmentVectorConstants1.packedValues[94u].x) / multiplyAddValue21) * 0.5) + 0.5;
                    float multiplyAddValue24 = 0.5 - (((fma(fragmentVectorConstants1.packedValues[93u].y, multiplyAddValue17, fma(fragmentVectorConstants1.packedValues[92u].y, multiplyAddValue16, fragmentVectorConstants1.packedValues[91u].y * multiplyAddValue15)) + fragmentVectorConstants1.packedValues[94u].y) / multiplyAddValue21) * 0.5);
                    uint comparisonValue16 = (fragmentVectorConstants1.packedValues[53u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[105u].z + 0.5))), int(1u)))), int(9u)));
                    uint quotientValue20 = uint(int(comparisonValue16) / int(2u));
                    float dotProductValue4 = dot(vec4(fragmentVectorConstants1.packedValues[57u]), vec4(1.0));
                    float intermediateValue44;
                    if (int(comparisonValue16) > int(0u))
#endif
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        float scalarValue57 = spvNMin(spvNMax(productValue109, fragmentScalarConstants1.packedValues[224u]), 1.0);
                        float multiplyAddValue77 = spvNMin((fma(fragmentVectorConstants1.packedValues[102u].z, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[100u].z, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[101u].z)) + fragmentVectorConstants1.packedValues[103u].z) - fma(fragmentScalarConstants1.packedValues[178u], sqrt(fma(-scalarValue57, scalarValue57, 1.0)) / scalarValue57, fragmentScalarConstants1.packedValues[177u]), 1.0);
                        bool conditionValue5 = !comparisonValue23;
                        float sumValue50 = rdDot4Precise(fragmentVectorConstants1.packedValues[57u], vec4(1.0)) + 1.0;
                        uint comparisonValue32 = comparisonValue23 ? 0u : 4294967295u;
                        float intermediateValue83;
                        intermediateValue83 = 0.0;
                        uint sumValue12;
                        float intermediateValue84;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        float sumValue23;
                        float intermediateValue51;
                        uint intermediateValue52;
                        float scalarValue25 = 0.0;
#endif
                        uint scalarValue26 = 0u;
                        for (;;)
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            if ((comparisonValue23 && (int(scalarValue26) >= int(1u))) || ((int(scalarValue26) >= int(2u)) && conditionValue5))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            intermediateValue51 = scalarValue25;
                            intermediateValue52 = 0u;
                            float intermediateValue65;
                            vec4 intermediateValue53;
                            float productValue70;
                            float productValue71;
                            bool comparisonValue10;
                            for (;;)
                            {
                                intermediateValue53 = fragmentVectorConstants1.packedValues[109u];
                                productValue70 = (multiplyAddValue23 + ((float(int(intermediateValue52 - quotientValue20)) + 0.5) * intermediateValue53.x)) * fragmentVectorConstants1.packedValues[44u].x;
                                productValue71 = (multiplyAddValue24 + (intermediateValue53.x * (float(int(scalarValue26 - quotientValue20)) + 0.5))) * fragmentVectorConstants1.packedValues[44u].x;
                                comparisonValue10 = fragmentVectorConstants1.packedValues[53u].x != 0.0;
                                float branchMergedValue3;
                                if (comparisonValue10)
                                {
                                    branchMergedValue3 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue70, productValue71, dotProductValue4), 0.0).x >= multiplyAddValue22);
                                }
                                else
                                {
                                    vec4 sampledTextureValue10 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue70, productValue71, dotProductValue4));
                                    float productValue52 = fract((productValue70 * intermediateValue53.z) + 0.5);
                                    float comparisonValue17 = (sampledTextureValue10.x < multiplyAddValue22) ? 0.0 : 1.0;
                                    float comparisonValue18 = (sampledTextureValue10.w < multiplyAddValue22) ? 0.0 : 1.0;
                                    float comparisonValue19 = ((((sampledTextureValue10.z < multiplyAddValue22) ? 0.0 : 1.0) - comparisonValue18) * productValue52) + comparisonValue18;
                                    branchMergedValue3 = (((((((sampledTextureValue10.y < multiplyAddValue22) ? 0.0 : 1.0) - comparisonValue17) * productValue52) + comparisonValue17) - comparisonValue19) * fract((productValue71 * intermediateValue53.z) + 0.5)) + comparisonValue19;
                                }
                                intermediateValue65 = branchMergedValue3;
                                sumValue23 = intermediateValue65 + intermediateValue51;
                                uint sumValue31 = intermediateValue52 + 1u;
                                if (sumValue31 == comparisonValue16)
                                {
                                    break;
                                }
                                else
                                {
                                    intermediateValue51 = sumValue23;
                                    intermediateValue52 = sumValue31;
                                    continue;
                                }
                            }
                            uint sumValue32 = scalarValue26 + 1u;
                            if (sumValue32 == comparisonValue16)
#endif
                            {
                                break;
                            }
#if RD_PLATFORM == RD_PLATFORM_SM50
                            float sumValue51 = rdSignedBitsToFloat(comparisonValue32 + scalarValue26) + 0.5;
                            intermediateValue84 = intermediateValue83;
                            uint sumValue18;
                            float sampledTextureValue7;
                            uint scalarValue58 = 0u;
                            for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            else
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                                if ((conditionValue5 && (int(scalarValue58) >= int(2u))) || (comparisonValue23 && (int(scalarValue58) >= int(1u))))
                                {
                                    break;
                                }
                                float multiplyAddValue78 = fma((rdSignedBitsToFloat(comparisonValue32 + scalarValue58) + 0.5) * fragmentScalarConstants1.packedValues[210u], fragmentScalarConstants1.packedValues[209u], multiplyAddValue75);
                                float multiplyAddValue79 = fma(sumValue51 * fragmentScalarConstants1.packedValues[210u], fragmentScalarConstants1.packedValues[209u], multiplyAddValue76);
                                if (comparisonValue23)
                                {
                                    sampledTextureValue7 = (textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue78, multiplyAddValue79, sumValue50), 0.0).x >= multiplyAddValue77) ? (intermediateValue84 + 1.0) : intermediateValue84;
                                }
                                else
                                {
                                    vec4 sampledTextureValue19 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue78, multiplyAddValue79, sumValue50));
                                    float multiplyAddValue80 = fract(fma(multiplyAddValue78, fragmentScalarConstants1.packedValues[438u], 0.5));
                                    bool comparisonValue33 = sampledTextureValue19.x >= multiplyAddValue77;
                                    bool comparisonValue34 = sampledTextureValue19.w >= multiplyAddValue77;
                                    float comparisonValue35 = float(sampledTextureValue19.y >= multiplyAddValue77);
                                    float comparisonValue36 = float(sampledTextureValue19.z >= multiplyAddValue77);
                                    float multiplyAddValue81 = fma(multiplyAddValue80, comparisonValue34 ? (comparisonValue36 - 1.0) : comparisonValue36, float(comparisonValue34));
                                    sampledTextureValue7 = fma(fract(fma(multiplyAddValue79, fragmentScalarConstants1.packedValues[438u], 0.5)), fma(multiplyAddValue80, comparisonValue33 ? (comparisonValue35 - 1.0) : comparisonValue35, float(comparisonValue33)) - multiplyAddValue81, multiplyAddValue81) + intermediateValue84;
                                }
                                sumValue18 = scalarValue58 + 1u;
                                intermediateValue84 = sampledTextureValue7;
                                scalarValue58 = sumValue18;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                scalarValue25 = sumValue23;
                                scalarValue26 = sumValue32;
#endif
                                continue;
                            }
#if RD_PLATFORM == RD_PLATFORM_SM50
                            sumValue12 = scalarValue26 + 1u;
                            intermediateValue83 = intermediateValue84;
                            scalarValue26 = sumValue12;
                            continue;
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        comparisonValue5 = intermediateValue83 / (comparisonValue23 ? 1.0 : 4.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        intermediateValue44 = sumValue23;
#endif
                    }
                    else
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        comparisonValue5 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        intermediateValue44 = 0.0;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue76 = comparisonValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float quotientValue21 = intermediateValue44 / float(int(comparisonValue16 * comparisonValue16));
                    float branchMergedValue11;
                    if (quotientValue21 < 1.0)
                    {
                        branchMergedValue11 = spvNMin(1.0, spvNMax(quotientValue21, 1.0 - fragmentVectorConstants1.packedValues[105u].w));
                    }
                    else
                    {
                        branchMergedValue11 = 1.0;
                    }
                    intermediateValue37 = branchMergedValue11;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue76 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    intermediateValue37 = 1.0;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                float comparisonValue8;
                if ((int(uint(int(fragmentScalarConstants1.packedValues[221u]))) > int(0u)) && (int(uint(int(fragmentScalarConstants1.packedValues[380u]))) > int(0u)))
                {
                    float multiplyAddValue82 = fma(fragmentVectorConstants1.packedValues[93u].w, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[91u].w, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[92u].w)) + fragmentVectorConstants1.packedValues[94u].w;
                    float scalarValue59 = spvNMin(spvNMax(productValue109, fragmentScalarConstants1.packedValues[224u]), 1.0);
                    float multiplyAddValue83 = ((fma(fragmentVectorConstants1.packedValues[93u].z, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[91u].z, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[92u].z)) + fragmentVectorConstants1.packedValues[94u].z) / multiplyAddValue82) - (fma(fragmentScalarConstants1.packedValues[178u], sqrt(fma(-scalarValue59, scalarValue59, 1.0)) / scalarValue59, fragmentScalarConstants1.packedValues[177u]) / (multiplyAddValue82 / multiplyAddValue82));
                    float multiplyAddValue84 = fma((fma(fragmentVectorConstants1.packedValues[93u].x, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[91u].x, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[92u].x)) + fragmentVectorConstants1.packedValues[94u].x) / multiplyAddValue82, 0.5, 0.5);
                    float multiplyAddValue85 = 1.0 - fma((fma(fragmentVectorConstants1.packedValues[93u].y, multiplyAddValue60, fma(fragmentVectorConstants1.packedValues[91u].y, multiplyAddValue56, multiplyAddValue57 * fragmentVectorConstants1.packedValues[92u].y)) + fragmentVectorConstants1.packedValues[94u].y) / multiplyAddValue82, 0.5, 0.5);
                    uint clampedValue1 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[422u] + 0.5))), int(1u), int(9u)));
                    bool conditionValue6 = !comparisonValue23;
                    uint comparisonValue37 = (comparisonValue23 ? 1u : clampedValue1) >> 1u;
                    float scalarValue60 = rdDot4Precise(fragmentVectorConstants1.packedValues[57u], vec4(1.0));
                    float intermediateValue86;
                    intermediateValue86 = 0.0;
                    uint sumValue13;
                    float intermediateValue87;
                    uint scalarValue61 = 0u;
                    for (;;)
                    {
                        if ((comparisonValue23 && (int(scalarValue61) >= int(1u))) || (conditionValue6 && (int(clampedValue1) <= int(scalarValue61))))
                        {
                            break;
                        }
                        float sumValue52 = rdSignedBitsToFloat(scalarValue61 - comparisonValue37) + 0.5;
                        intermediateValue87 = intermediateValue86;
                        uint sumValue19;
                        float sampledTextureValue8;
                        uint scalarValue62 = 0u;
                        for (;;)
                        {
                            if ((comparisonValue23 && (int(scalarValue62) >= int(1u))) || (conditionValue6 && (int(clampedValue1) <= int(scalarValue62))))
                            {
                                break;
                            }
                            float multiplyAddValue86 = fma(multiplyAddValue84, fragmentScalarConstants1.packedValues[176u], ((rdSignedBitsToFloat(scalarValue62 - comparisonValue37) + 0.5) * fragmentScalarConstants1.packedValues[436u]) * fragmentScalarConstants1.packedValues[176u]);
                            float multiplyAddValue87 = fma(multiplyAddValue85, fragmentScalarConstants1.packedValues[176u], (sumValue52 * fragmentScalarConstants1.packedValues[436u]) * fragmentScalarConstants1.packedValues[176u]);
                            if (comparisonValue23)
                            {
                                sampledTextureValue8 = (textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue86, multiplyAddValue87, scalarValue60), 0.0).x >= multiplyAddValue83) ? (intermediateValue87 + 1.0) : intermediateValue87;
                            }
                            else
                            {
                                vec4 sampledTextureValue20 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue86, multiplyAddValue87, scalarValue60));
                                float multiplyAddValue88 = fract(fma(multiplyAddValue86, fragmentScalarConstants1.packedValues[438u], 0.5));
                                bool comparisonValue38 = sampledTextureValue20.x >= multiplyAddValue83;
                                bool comparisonValue39 = sampledTextureValue20.w >= multiplyAddValue83;
                                float comparisonValue40 = float(sampledTextureValue20.y >= multiplyAddValue83);
                                float comparisonValue41 = float(sampledTextureValue20.z >= multiplyAddValue83);
                                float multiplyAddValue89 = fma(multiplyAddValue88, comparisonValue39 ? (comparisonValue41 - 1.0) : comparisonValue41, float(comparisonValue39));
                                sampledTextureValue8 = intermediateValue87 + fma(fract(fma(multiplyAddValue87, fragmentScalarConstants1.packedValues[438u], 0.5)), fma(multiplyAddValue88, comparisonValue38 ? (comparisonValue40 - 1.0) : comparisonValue40, float(comparisonValue38)) - multiplyAddValue89, multiplyAddValue89);
                            }
                            sumValue19 = scalarValue62 + 1u;
                            intermediateValue87 = sampledTextureValue8;
                            scalarValue62 = sumValue19;
                            continue;
                        }
                        sumValue13 = scalarValue61 + 1u;
                        intermediateValue86 = intermediateValue87;
                        scalarValue61 = sumValue13;
                        continue;
                    }
                    float comparisonValue42 = intermediateValue86 / rdSignedBitsToFloat(comparisonValue23 ? 1u : (clampedValue1 * clampedValue1));
                    comparisonValue8 = (comparisonValue42 < 1.0) ? spvNMin(spvNMax(1.0 - fragmentScalarConstants1.packedValues[423u], comparisonValue42), 1.0) : 1.0;
                }
                else
                {
                    comparisonValue8 = 1.0;
                }
                float scalarValue63 = spvNMin(spvNMin(comparisonValue8, intermediateValue76), intermediateValue69);
                float productValue114 = spvNMax(fragmentScalarConstants1.packedValues[437u] - spvNMin(fragmentScalarConstants1.packedValues[437u] * 0.100000001490116119384765625, 8.0), 0.0);
                float quotientValue33 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[437u] - productValue114)) * (-(quotientValue25 + productValue114)), 0.0, 1.0);
                multiplyAddValue30 = fma((quotientValue33 * quotientValue33) * fma(quotientValue33, -2.0, 3.0), 1.0 - scalarValue63, scalarValue63);
                intermediateValue60 = intermediateValue61;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float scalarValue27 = spvNMin(intermediateValue23, spvNMin(intermediateValue32, intermediateValue37));
                float productValue53 = spvNMax(0.0, fragmentVectorConstants1.packedValues[109u].y - spvNMin(fragmentVectorConstants1.packedValues[109u].y * 0.100000001490116119384765625, 8.0));
                float quotientValue22 = spvNClamp((((-0.0) - quotientValue2) - productValue53) / (fragmentVectorConstants1.packedValues[109u].y - productValue53), 0.0, 1.0);
                productValue37 = (((quotientValue22 * quotientValue22) * (1.0 - scalarValue27)) * (3.0 - (quotientValue22 * 2.0))) + scalarValue27;
                intermediateValue19 = intermediateValue20;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                multiplyAddValue30 = 1.0;
                intermediateValue60 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                productValue37 = 1.0;
                intermediateValue19 = 1.0;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue90 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentScalarConstants1.packedValues[219u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentScalarConstants1.packedValues[218u], fma(fragmentVectorConstants1.packedValues[0u].x, fragmentScalarConstants1.packedValues[216u], fragmentVectorConstants1.packedValues[1u].x * fragmentScalarConstants1.packedValues[217u])));
            float multiplyAddValue91 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentScalarConstants1.packedValues[219u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentScalarConstants1.packedValues[218u], fma(fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[216u], fragmentVectorConstants1.packedValues[1u].y * fragmentScalarConstants1.packedValues[217u])));
            float multiplyAddValue92 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentScalarConstants1.packedValues[219u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentScalarConstants1.packedValues[218u], fma(fragmentVectorConstants1.packedValues[0u].z, fragmentScalarConstants1.packedValues[216u], fragmentVectorConstants1.packedValues[1u].z * fragmentScalarConstants1.packedValues[217u])));
            vec3 vectorValue10 = vec3(multiplyAddValue90, multiplyAddValue91, multiplyAddValue92);
            float inverseLengthValue19 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
            float productValue115 = (scalarValue48 * (fragmentScalarConstants1.packedValues[387u] * fragmentVectorConstants1.packedValues[96u].x)) * fragmentScalarConstants1.packedValues[424u];
            float productValue116 = (scalarValue48 * (fragmentScalarConstants1.packedValues[387u] * fragmentVectorConstants1.packedValues[96u].y)) * fragmentScalarConstants1.packedValues[424u];
            float productValue117 = (scalarValue48 * (fragmentScalarConstants1.packedValues[387u] * fragmentVectorConstants1.packedValues[96u].z)) * fragmentScalarConstants1.packedValues[424u];
            vec3 productValue118 = vec3(inverseLengthValue19 * multiplyAddValue90, inverseLengthValue19 * multiplyAddValue91, inverseLengthValue19 * multiplyAddValue92);
            float scalarValue64 = rdDot3Precise2(vectorValue3, productValue118);
            float scalarValue65 = spvNMax(scalarValue64, 0.0);
            float quotientValue34 = -(quotientValue28 / nonlinearValue3);
            float quotientValue35 = -(quotientValue29 / nonlinearValue3);
            float quotientValue36 = -(quotientValue25 / nonlinearValue3);
            vec3 vectorValue11 = vec3(quotientValue34, quotientValue35, quotientValue36);
            float scalarValue66 = spvNMax(rdDot3Precise2(vectorValue3, vectorValue11), 0.0);
            float sumValue53 = fragmentScalarConstants1.packedValues[445u] + 1.0;
            float productValue119 = sumValue53 * sumValue53;
            float multiplyAddValue93 = fma(productValue96, spvNMax((scalarValue64 + fragmentScalarConstants1.packedValues[445u]) / productValue119, 0.0) - scalarValue65, scalarValue65);
            float multiplyAddValue94 = fma(multiplyAddValue90, inverseLengthValue19, quotientValue34);
            float multiplyAddValue95 = fma(multiplyAddValue91, inverseLengthValue19, quotientValue35);
            float multiplyAddValue96 = fma(multiplyAddValue92, inverseLengthValue19, quotientValue36);
            vec3 vectorValue12 = vec3(multiplyAddValue94, multiplyAddValue95, multiplyAddValue96);
            float inverseLengthValue20 = inversesqrt(rdDot3Precise2(vectorValue12, vectorValue12));
            float productValue120 = spvNMax(rdEvaluateFloatExpression(bitfieldExtract(sampledTextureValue14.x, int(8u), int(8u))) * 0.0039215688593685626983642578125, 0.0500000007450580596923828125);
            float productValue121 = productValue120 * productValue120;
            vec3 productValue122 = vec3(inverseLengthValue20 * multiplyAddValue94, inverseLengthValue20 * multiplyAddValue95, inverseLengthValue20 * multiplyAddValue96);
            float scalarValue67 = spvNMax(rdDot3Precise2(vectorValue3, productValue122), 0.0);
            float multiplyAddValue97 = fma(scalarValue67 * scalarValue67, fma(productValue121, productValue121, -1.0), 1.0);
            float quotientValue37 = (productValue121 * productValue121) / ((multiplyAddValue97 * multiplyAddValue97) * 3.1415927410125732421875);
            float productValue123 = productValue121 * 0.5;
            float multiplyAddValue98 = fma(-productValue121, 0.5, 1.0);
            float multiplyAddValue99 = (scalarValue65 / (fma(scalarValue65, multiplyAddValue98, productValue123) + 9.9999997473787516355514526367188e-05)) * (scalarValue66 / (fma(scalarValue66, multiplyAddValue98, productValue123) + 9.9999997473787516355514526367188e-05));
            float sumValue54 = spvNMax(1.0 - spvNMax(rdDot3Precise2(vectorValue11, productValue122), 0.0), 0.0);
            float productValue124 = sumValue54 * sumValue54;
            float productValue125 = sumValue54 * (productValue124 * productValue124);
            float multiplyAddValue100 = fma(1.0 - multiplyAddValue38, productValue125, multiplyAddValue38);
            float multiplyAddValue101 = fma(1.0 - multiplyAddValue39, productValue125, multiplyAddValue39);
            float multiplyAddValue102 = fma(1.0 - multiplyAddValue40, productValue125, multiplyAddValue40);
            float multiplyAddValue103 = fma(scalarValue65 * scalarValue66, 4.0, 9.9999997473787516355514526367188e-05);
            float quotientValue38 = intermediateValue60 * (productValue95 * (productValue96 * spvNMax((rdDot3Precise2(vec3(-productValue90, -productValue91, -productValue92), productValue118) + fragmentScalarConstants1.packedValues[445u]) / productValue119, 0.0)));
            multiplyAddValue5 = (productValue115 * fma(productValue95 * (multiplyAddValue93 * (1.0 - multiplyAddValue100)), multiplyAddValue30, quotientValue38)) * fragmentScalarConstants1.packedValues[392u];
            multiplyAddValue4 = (productValue116 * fma(productValue95 * (multiplyAddValue93 * (1.0 - multiplyAddValue101)), multiplyAddValue30, quotientValue38)) * fragmentScalarConstants1.packedValues[392u];
            multiplyAddValue3 = (productValue117 * fma(productValue95 * (multiplyAddValue93 * (1.0 - multiplyAddValue102)), multiplyAddValue30, quotientValue38)) * fragmentScalarConstants1.packedValues[392u];
            quotientValue5 = (productValue115 * (multiplyAddValue30 * (((multiplyAddValue99 * (quotientValue37 * multiplyAddValue100)) / multiplyAddValue103) * scalarValue65))) * fragmentScalarConstants1.packedValues[393u];
            quotientValue4 = (productValue116 * (multiplyAddValue30 * (((multiplyAddValue99 * (quotientValue37 * multiplyAddValue101)) / multiplyAddValue103) * scalarValue65))) * fragmentScalarConstants1.packedValues[393u];
            quotientValue3 = (productValue117 * (multiplyAddValue30 * (((multiplyAddValue99 * (quotientValue37 * multiplyAddValue102)) / multiplyAddValue103) * scalarValue65))) * fragmentScalarConstants1.packedValues[393u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float multiplyAddValue28 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentVectorConstants1.packedValues[54u].w, fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[54u].z, fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[54u].y, fragmentVectorConstants1.packedValues[54u].x * fragmentVectorConstants1.packedValues[0u].x)));
            float multiplyAddValue29 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentVectorConstants1.packedValues[54u].w, fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[54u].z, fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[54u].y, fragmentVectorConstants1.packedValues[54u].x * fragmentVectorConstants1.packedValues[0u].y)));
            float multiplyAddValue31 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentVectorConstants1.packedValues[54u].w, fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[54u].z, fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[54u].y, fragmentVectorConstants1.packedValues[54u].x * fragmentVectorConstants1.packedValues[0u].z)));
            float inverseLengthValue9 = inversesqrt(dot(vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue31), vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue31)));
            float productValue54 = inverseLengthValue9 * multiplyAddValue28;
            float productValue55 = inverseLengthValue9 * multiplyAddValue29;
            float productValue56 = inverseLengthValue9 * multiplyAddValue31;
            float productValue57 = fragmentVectorConstants1.packedValues[106u].x * (fragmentVectorConstants1.packedValues[96u].w * sampledTextureValue5.x);
            float productValue58 = productValue57 * fragmentVectorConstants1.packedValues[96u].x;
            float productValue59 = productValue57 * fragmentVectorConstants1.packedValues[96u].y;
            float productValue60 = productValue57 * fragmentVectorConstants1.packedValues[96u].z;
            float dotProductValue5 = dot(vec3(productValue27, productValue28, productValue29), vec3(productValue54, productValue55, productValue56));
            float scalarValue28 = spvNMax(dotProductValue5, 0.0);
            float dotProductValue6 = spvNMax(dot(vec3(productValue27, productValue28, productValue29), vec3(sumValue7, sumValue8, sumValue9)), 0.0);
            float sumValue34 = fragmentVectorConstants1.packedValues[111u].y + 1.0;
            float productValue61 = sumValue34 * sumValue34;
            float sumValue35 = productValue54 - quotientValue14;
            float sumValue36 = productValue55 - quotientValue15;
            float sumValue37 = productValue56 - quotientValue18;
            float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue35, sumValue36, sumValue37), vec3(sumValue35, sumValue36, sumValue37)));
            float productValue62 = inverseLengthValue10 * sumValue35;
            float productValue63 = inverseLengthValue10 * sumValue36;
            float productValue64 = inverseLengthValue10 * sumValue37;
            float bitwiseValue1 = spvNMax(float((sampledTextureValue4.x >> 8u) & 255u) * 0.0039215688593685626983642578125, 0.0500000007450580596923828125);
            float productValue68 = bitwiseValue1 * bitwiseValue1;
            float productValue69 = productValue68 * productValue68;
            float dotProductValue7 = spvNMax(dot(vec3(productValue27, productValue28, productValue29), vec3(productValue62, productValue63, productValue64)), 0.0);
            float productValue72 = ((dotProductValue7 * dotProductValue7) * (productValue69 + (-1.0))) + 1.0;
            float productValue73 = productValue68 * 0.5;
            float sumValue38 = 1.0 - productValue73;
            float sumValue39 = productValue73 + 9.9999997473787516355514526367188e-05;
            float dotProductValue8 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue7, sumValue8, sumValue9), vec3(productValue62, productValue63, productValue64)), 0.0), 0.0, 1.0);
            float productValue74 = dotProductValue8 * dotProductValue8;
            float productValue77 = (productValue74 * productValue74) * dotProductValue8;
            float productValue78 = (productValue77 * (1.0 - productValue32)) + productValue32;
            float productValue79 = (productValue77 * (1.0 - productValue33)) + productValue33;
            float productValue80 = (productValue77 * (1.0 - productValue34)) + productValue34;
            float quotientValue23 = ((dotProductValue6 / ((sumValue38 * dotProductValue6) + sumValue39)) * (productValue69 / ((productValue72 * productValue72) * 3.1415927410125732421875))) * (scalarValue28 / ((sumValue38 * scalarValue28) + sumValue39));
            float productValue81 = ((scalarValue28 * 4.0) * dotProductValue6) + 9.9999997473787516355514526367188e-05;
            float quotientValue24 = (((spvNMax((dotProductValue5 + fragmentVectorConstants1.packedValues[111u].y) / productValue61, 0.0) - scalarValue28) * productValue35) + scalarValue28) * productValue37;
            float dotProductValue9 = (intermediateValue19 * productValue35) * spvNMax((dot(vec3((-0.0) - productValue27, (-0.0) - productValue28, (-0.0) - productValue29), vec3(productValue54, productValue55, productValue56)) + fragmentVectorConstants1.packedValues[111u].y) / productValue61, 0.0);
            float productValue82 = sumValue5 * 0.3183098733425140380859375;
            float productValue83 = fragmentVectorConstants1.packedValues[98u].y * (scalarValue28 * productValue37);
            branchMergedValue9 = ((productValue82 * productValue58) * fragmentVectorConstants1.packedValues[98u].x) * (((1.0 - productValue78) * quotientValue24) + dotProductValue9);
            branchMergedValue12 = (productValue83 * productValue60) * ((productValue80 * quotientValue23) / productValue81);
            branchMergedValue13 = (productValue83 * productValue59) * ((productValue79 * quotientValue23) / productValue81);
            branchMergedValue14 = (productValue83 * productValue58) * ((productValue78 * quotientValue23) / productValue81);
            branchMergedValue15 = ((productValue82 * productValue60) * fragmentVectorConstants1.packedValues[98u].x) * (((1.0 - productValue80) * quotientValue24) + dotProductValue9);
            branchMergedValue16 = ((productValue82 * productValue59) * fragmentVectorConstants1.packedValues[98u].x) * (((1.0 - productValue79) * quotientValue24) + dotProductValue9);
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        else
        {
            multiplyAddValue5 = 0.0;
            multiplyAddValue4 = 0.0;
            multiplyAddValue3 = 0.0;
            quotientValue5 = 0.0;
            quotientValue4 = 0.0;
            quotientValue3 = 0.0;
        }
        intermediateValue31 = quotientValue3;
        intermediateValue32 = quotientValue4;
        intermediateValue33 = quotientValue5;
        intermediateValue34 = multiplyAddValue3;
        intermediateValue35 = multiplyAddValue4;
        intermediateValue36 = multiplyAddValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue13 = branchMergedValue9;
        intermediateValue14 = branchMergedValue16;
        intermediateValue15 = branchMergedValue15;
        intermediateValue16 = branchMergedValue14;
        intermediateValue17 = branchMergedValue13;
        intermediateValue18 = branchMergedValue12;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue31 = 0.0;
        intermediateValue32 = 0.0;
        intermediateValue33 = 0.0;
        intermediateValue34 = 0.0;
        intermediateValue35 = 0.0;
        intermediateValue36 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue13 = 0.0;
        intermediateValue14 = 0.0;
        intermediateValue15 = 0.0;
        intermediateValue16 = 0.0;
        intermediateValue17 = 0.0;
        intermediateValue18 = 0.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = intermediateValue36;
    fragmentColor0.y = intermediateValue35;
    fragmentColor0.z = intermediateValue34;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = intermediateValue13;
    fragmentColor0.y = intermediateValue14;
    fragmentColor0.z = intermediateValue15;
#endif
    fragmentColor0.w = 1.0;
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor1.x = intermediateValue33;
    fragmentColor1.y = intermediateValue32;
    fragmentColor1.z = intermediateValue31;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor1.x = intermediateValue16;
    fragmentColor1.y = intermediateValue17;
    fragmentColor1.z = intermediateValue18;
#endif
    fragmentColor1.w = 1.0;
}
