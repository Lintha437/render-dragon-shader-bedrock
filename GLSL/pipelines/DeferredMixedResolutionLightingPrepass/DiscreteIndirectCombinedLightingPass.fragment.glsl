#version 460
#extension GL_GOOGLE_include_directive : require
// DeferredMixedResolutionLightingPrepass / DiscreteIndirectCombinedLightingPass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_samplerless_texture_functions : require
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON || RD_FEATURE_POINT_LIGHT_SHADING == RD_ON || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#extension GL_EXT_samplerless_texture_functions : require
#endif
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/DeferredMixedResolutionLightingPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits11 = (floor(varyingTexCoord0.x * uintBitsToFloat(reinterpretedBits10.x)) + 0.5) * uintBitsToFloat(reinterpretedBits10.z);
    float reinterpretedBits12 = (floor(varyingTexCoord0.y * uintBitsToFloat(reinterpretedBits10.y)) + 0.5) * uintBitsToFloat(reinterpretedBits10.w);
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture6, textureSampler6), vec2(reinterpretedBits11, reinterpretedBits12));
    float scalarValue40 = sampledTextureValue17.x;
    float productValue91 = floor(scalarValue40 * 65535.0);
    fragmentColor0.w = fma(scalarValue40, 65535.0, -productValue91);
    fragmentColor0.z = productValue91 * 1.525902189314365386962890625e-05;
    vec4 sampledTextureValue19 = texture(sampler2D(materialTexture3, textureSampler3), vec2(reinterpretedBits11, reinterpretedBits12));
    fragmentColor0.x = fma(sampledTextureValue19.x, 0.5, 0.5);
    fragmentColor0.y = fma(sampledTextureValue19.y, 0.5, 0.5);
    bool sampledTextureValue10 = uint(textureQueryLevels(intermediateValue1)) > 0u;
    uvec2 sampledTextureValue11 = uvec2(textureSize(intermediateValue1, int(0u)));
    uint scalarValue10 = sampledTextureValue11.x;
    float sampledTextureValue21 = 1.0 - spvNClamp((texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits11, reinterpretedBits12)).w - 0.501960813999176025390625) * 2.007874011993408203125, 0.0, 1.0);
    uvec4 sampledTextureValue23 = texelFetch(intermediateValue1, ivec2(uvec2(uint(int(reinterpretedBits11 * rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue10 : 0u))), uint(int(reinterpretedBits12 * rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u))))), int(0u));
    uint scalarValue41 = sampledTextureValue23.y;
    uint scalarValue42 = sampledTextureValue23.z;
    float bitwiseValue12 = rdEvaluateFloatExpression(sampledTextureValue23.w & 255u) * 0.0039215688593685626983642578125;
    float bitwiseValue13 = rdEvaluateFloatExpression(scalarValue42 & 255u) * 0.0039215688593685626983642578125;
    float reinterpretedBits13 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u]));
    float productValue92 = bitwiseValue12 * bitwiseValue12;
    float productValue94 = bitwiseValue12 * (productValue92 * productValue92);
    float multiplyAddValue74 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[9u])), fma(productValue92, bitwiseValue12, -productValue94), productValue94);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[5u]);
    float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[23u]));
    float reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u]));
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[1u]);
    float reinterpretedBits18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[15u]));
    fragmentColor1.x = (spvNMax(fma((bitwiseValue13 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue41, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * reinterpretedBits13, 6.0, (multiplyAddValue74 * uintBitsToFloat(reinterpretedBits14.x)) * reinterpretedBits15), reinterpretedBits16 * uintBitsToFloat(reinterpretedBits17.x)) * sampledTextureValue21) * reinterpretedBits18;
    fragmentColor1.y = (spvNMax(fma((bitwiseValue13 * (rdEvaluateFloatExpression(scalarValue41 & 255u) * 0.0039215688593685626983642578125)) * reinterpretedBits13, 6.0, (multiplyAddValue74 * uintBitsToFloat(reinterpretedBits14.y)) * reinterpretedBits15), reinterpretedBits16 * uintBitsToFloat(reinterpretedBits17.y)) * sampledTextureValue21) * reinterpretedBits18;
    fragmentColor1.z = (spvNMax(fma((bitwiseValue13 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue42, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * reinterpretedBits13, 6.0, (multiplyAddValue74 * uintBitsToFloat(reinterpretedBits14.z)) * reinterpretedBits15), reinterpretedBits16 * uintBitsToFloat(reinterpretedBits17.z)) * sampledTextureValue21) * reinterpretedBits18;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue14 = floor(varyingTexCoord0.y * fragmentVectorConstants1.packedValues[38u].y) + 0.5;
    float productValue15 = (floor(varyingTexCoord0.x * fragmentVectorConstants1.packedValues[38u].x) + 0.5) * fragmentVectorConstants1.packedValues[38u].z;
    float productValue16 = productValue14 * fragmentVectorConstants1.packedValues[38u].w;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture3, textureSampler3), vec2(productValue15, productValue16));
    float scalarValue3 = sampledTextureValue6.x;
    float scalarValue4 = sampledTextureValue6.y;
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture6, textureSampler6), vec2(productValue15, productValue16));
    float scalarValue5 = sampledTextureValue7.x;
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(productValue15, productValue16));
    float scalarValue6 = sampledTextureValue9.x;
    float scalarValue7 = sampledTextureValue9.y;
    float scalarValue8 = sampledTextureValue9.z;
    float scalarValue9 = sampledTextureValue9.w;
    float productValue17 = spvNClamp((scalarValue9 - 0.501960813999176025390625) * 2.007874011993408203125, 0.0, 1.0);
    bool sampledTextureValue10 = uint(textureQueryLevels(intermediateValue1)) > 0u;
    uvec2 sampledTextureValue11 = uvec2(textureSize(intermediateValue1, int(0u)));
    uint scalarValue10 = sampledTextureValue11.x;
    uvec4 sampledTextureValue12 = texelFetch(intermediateValue1, ivec2(uvec2(uint(int(productValue15 * rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue10 : 0u))), uint(int(productValue16 * rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u))))), int(0u));
    uint scalarValue11 = sampledTextureValue12.y;
    uint scalarValue12 = sampledTextureValue12.z;
    float bitwiseValue2 = rdEvaluateFloatExpression(sampledTextureValue12.w & 255u) * 0.0039215688593685626983642578125;
    float bitwiseValue3 = rdEvaluateFloatExpression(scalarValue12 & 255u) * 0.0039215688593685626983642578125;
    float sumValue = 1.0 - productValue17;
    float multiplyAddValue = fma(productValue15, 2.0, -1.0);
    float multiplyAddValue1 = fma(fma(-productValue14, fragmentScalarConstants1.packedValues[155u], 1.0), 2.0, -1.0);
    float multiplyAddValue2 = fma(scalarValue5, fragmentScalarConstants1.packedValues[63u], fragmentScalarConstants1.packedValues[67u]);
    float quotientValue = fragmentScalarConstants1.packedValues[66u] / multiplyAddValue2;
    float quotientValue1 = ((multiplyAddValue + fragmentScalarConstants1.packedValues[160u]) * fragmentScalarConstants1.packedValues[52u]) / multiplyAddValue2;
    float scalarValue13 = -quotientValue;
    float quotientValue2 = ((multiplyAddValue1 - fragmentScalarConstants1.packedValues[161u]) * fragmentScalarConstants1.packedValues[57u]) / multiplyAddValue2;
    float scalarValue14 = dFdyCoarse(scalarValue13);
    float scalarValue15 = dFdyCoarse(-quotientValue1);
    float scalarValue16 = dFdxCoarse(quotientValue1);
    float scalarValue17 = dFdxCoarse(quotientValue2);
    float scalarValue18 = dFdyCoarse(-quotientValue2);
    float scalarValue19 = dFdxCoarse(quotientValue);
    float intermediateValue34;
    float intermediateValue35;
    float intermediateValue36;
    float intermediateValue37;
    float intermediateValue38;
    float intermediateValue39;
    if (scalarValue5 != 1.0)
    {
        bool comparisonValue = fragmentScalarConstants1.packedValues[90u] != 0.0;
        float productValue5;
        float productValue6;
        float productValue7;
        float productValue8;
        float productValue9;
        float productValue10;
        if (comparisonValue)
        {
            float quotientValue3 = (multiplyAddValue * fragmentScalarConstants1.packedValues[52u]) / multiplyAddValue2;
            float quotientValue4 = (multiplyAddValue1 * fragmentScalarConstants1.packedValues[57u]) / multiplyAddValue2;
            float productValue18 = scalarValue13 * fragmentScalarConstants1.packedValues[98u];
            bool conditionValue = scalarValue13 < fragmentVectorConstants1.packedValues[24u].x;
            bool conditionValue1 = scalarValue13 < fragmentVectorConstants1.packedValues[24u].y;
            float nonlinearValue = spvNMin(fragmentVectorConstants1.packedValues[27u].z - 1.0, floor(spvNClamp((log2(scalarValue13) - fragmentScalarConstants1.packedValues[122u]) * fragmentScalarConstants1.packedValues[120u], 0.0, 1.0) * (fragmentVectorConstants1.packedValues[27u].z - 2.0)) + 2.0);
            float comparisonValue1 = conditionValue1 ? 1.0 : nonlinearValue;
            float multiplyAddValue3 = spvNMin(fragmentVectorConstants1.packedValues[27u].y - 1.0, floor(spvNClamp(fma(scalarValue13, fragmentScalarConstants1.packedValues[98u], quotientValue4) / (productValue18 + productValue18), 0.0, 1.0) * fragmentVectorConstants1.packedValues[27u].y));
            float multiplyAddValue4 = spvNMin(fragmentVectorConstants1.packedValues[27u].x - 1.0, floor(spvNClamp(fma(productValue18, fragmentScalarConstants1.packedValues[99u], quotientValue3) / fma(productValue18, fragmentScalarConstants1.packedValues[99u], productValue18 * fragmentScalarConstants1.packedValues[99u]), 0.0, 1.0) * fragmentVectorConstants1.packedValues[27u].x));
            float intermediateValue63;
            float intermediateValue65;
            float intermediateValue67;
            float intermediateValue69;
            float intermediateValue71;
            float intermediateValue73;
            if (!(((conditionValue ? 0.0 : comparisonValue1) >= fragmentScalarConstants1.packedValues[110u]) || ((multiplyAddValue3 >= fragmentScalarConstants1.packedValues[109u]) || ((multiplyAddValue4 >= fragmentScalarConstants1.packedValues[108u]) || ((((nonlinearValue < 0.0) && (!conditionValue1)) && (!conditionValue)) || ((multiplyAddValue4 < 0.0) || (multiplyAddValue3 < 0.0)))))))
            {
                float multiplyAddValue5 = fma(fragmentVectorConstants1.packedValues[11u].x, quotientValue, fma(fragmentVectorConstants1.packedValues[9u].x, quotientValue3, quotientValue4 * fragmentVectorConstants1.packedValues[10u].x)) + fragmentVectorConstants1.packedValues[12u].x;
                float multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[11u].y, quotientValue, fma(fragmentVectorConstants1.packedValues[9u].y, quotientValue3, quotientValue4 * fragmentVectorConstants1.packedValues[10u].y)) + fragmentVectorConstants1.packedValues[12u].y;
                float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[11u].z, quotientValue, fma(fragmentVectorConstants1.packedValues[9u].z, quotientValue3, quotientValue4 * fragmentVectorConstants1.packedValues[10u].z)) + fragmentVectorConstants1.packedValues[12u].z;
                float multiplyAddValue8 = (fma(fragmentVectorConstants1.packedValues[11u].x, quotientValue, fma(fragmentVectorConstants1.packedValues[9u].x, quotientValue1, quotientValue2 * fragmentVectorConstants1.packedValues[10u].x)) + fragmentVectorConstants1.packedValues[12u].x) - fragmentVectorConstants1.packedValues[26u].x;
                float multiplyAddValue9 = (fma(fragmentVectorConstants1.packedValues[11u].y, quotientValue, fma(fragmentVectorConstants1.packedValues[9u].y, quotientValue1, quotientValue2 * fragmentVectorConstants1.packedValues[10u].y)) + fragmentVectorConstants1.packedValues[12u].y) - fragmentVectorConstants1.packedValues[26u].y;
                float multiplyAddValue13 = (fma(fragmentVectorConstants1.packedValues[11u].z, quotientValue, fma(fragmentVectorConstants1.packedValues[9u].z, quotientValue1, quotientValue2 * fragmentVectorConstants1.packedValues[10u].z)) + fragmentVectorConstants1.packedValues[12u].z) - fragmentVectorConstants1.packedValues[26u].z;
                vec3 vectorValue = vec3(scalarValue19, scalarValue16, scalarValue17);
                float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                float productValue19 = inverseLengthValue * scalarValue19;
                float productValue20 = inverseLengthValue * scalarValue16;
                float productValue21 = inverseLengthValue * scalarValue17;
                vec3 vectorValue1 = vec3(scalarValue18, scalarValue14, scalarValue15);
                float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
                float productValue22 = inverseLengthValue1 * scalarValue18;
                float productValue36 = inverseLengthValue1 * scalarValue14;
                float productValue37 = inverseLengthValue1 * scalarValue15;
                float multiplyAddValue14 = fma(productValue21, productValue36, -(productValue22 * productValue19));
                float multiplyAddValue15 = fma(productValue19, productValue37, -(productValue36 * productValue20));
                float multiplyAddValue16 = fma(productValue20, productValue22, -(productValue37 * productValue21));
                vec3 vectorValue2 = vec3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16);
                float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
                float productValue38 = inverseLengthValue2 * multiplyAddValue14;
                float productValue39 = inverseLengthValue2 * multiplyAddValue15;
                float productValue40 = inverseLengthValue2 * multiplyAddValue16;
                float multiplyAddValue17 = fma(fragmentVectorConstants1.packedValues[11u].x, productValue40, fma(fragmentVectorConstants1.packedValues[9u].x, productValue38, productValue39 * fragmentVectorConstants1.packedValues[10u].x));
                float multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[11u].y, productValue40, fma(fragmentVectorConstants1.packedValues[9u].y, productValue38, productValue39 * fragmentVectorConstants1.packedValues[10u].y));
                float multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[11u].z, productValue40, fma(fragmentVectorConstants1.packedValues[9u].z, productValue38, productValue39 * fragmentVectorConstants1.packedValues[10u].z));
                vec3 vectorValue3 = vec3(multiplyAddValue17, multiplyAddValue18, multiplyAddValue19);
                float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
                float quotientValue5 = roundEven((inverseLengthValue3 * multiplyAddValue17) / fragmentScalarConstants1.packedValues[148u]) * fragmentScalarConstants1.packedValues[148u];
                float quotientValue6 = roundEven((inverseLengthValue3 * multiplyAddValue18) / fragmentScalarConstants1.packedValues[148u]) * fragmentScalarConstants1.packedValues[148u];
                float quotientValue7 = roundEven((inverseLengthValue3 * multiplyAddValue19) / fragmentScalarConstants1.packedValues[148u]) * fragmentScalarConstants1.packedValues[148u];
                vec3 vectorValue4 = vec3(quotientValue5, quotientValue6, quotientValue7);
                float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
                float productValue41 = inverseLengthValue4 * quotientValue5;
                float productValue42 = inverseLengthValue4 * quotientValue6;
                float productValue43 = inverseLengthValue4 * quotientValue7;
                float scalarValue20 = -fragmentScalarConstants1.packedValues[74u];
                float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[74u], 0.5, -fma(scalarValue20, floor(multiplyAddValue8 / fragmentScalarConstants1.packedValues[74u]), multiplyAddValue8));
                float multiplyAddValue21 = fma(fragmentScalarConstants1.packedValues[74u], 0.5, -fma(scalarValue20, floor(multiplyAddValue9 / fragmentScalarConstants1.packedValues[74u]), multiplyAddValue9));
                float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[74u], 0.5, -fma(scalarValue20, floor(multiplyAddValue13 / fragmentScalarConstants1.packedValues[74u]), multiplyAddValue13));
                float scalarValue21 = -rdDot3Precise2(vec3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22), vec3(productValue41, productValue42, productValue43));
                float scalarValue22 = abs(scalarValue4);
                float sumValue1 = 1.0 - abs(scalarValue3);
                float sumValue2 = sumValue1 - scalarValue22;
                bool conditionValue2 = sumValue2 < 0.0;
                float comparisonValue2 = conditionValue2 ? (((scalarValue3 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue22)) : scalarValue3;
                float comparisonValue3 = conditionValue2 ? (((scalarValue4 >= 0.0) ? 1.0 : (-1.0)) * sumValue1) : scalarValue4;
                vec3 vectorValue5 = vec3(comparisonValue2, comparisonValue3, sumValue2);
                float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
                float productValue44 = inverseLengthValue5 * comparisonValue2;
                float productValue45 = inverseLengthValue5 * comparisonValue3;
                float productValue49 = inverseLengthValue5 * sumValue2;
                float multiplyAddValue23 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue49, fma(fragmentVectorConstants1.packedValues[4u].x, productValue44, productValue45 * fragmentVectorConstants1.packedValues[5u].x));
                float multiplyAddValue24 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue49, fma(fragmentVectorConstants1.packedValues[4u].y, productValue44, productValue45 * fragmentVectorConstants1.packedValues[5u].y));
                float multiplyAddValue25 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue49, fma(fragmentVectorConstants1.packedValues[4u].z, productValue44, productValue45 * fragmentVectorConstants1.packedValues[5u].z));
                vec3 vectorValue6 = vec3(multiplyAddValue23, multiplyAddValue24, multiplyAddValue25);
                float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
                float productValue50 = inverseLengthValue6 * multiplyAddValue23;
                float productValue51 = inverseLengthValue6 * multiplyAddValue24;
                float productValue52 = inverseLengthValue6 * multiplyAddValue25;
                bool comparisonValue10 = fragmentScalarConstants1.packedValues[112u] != 0.0;
                float productValue53 = sumValue * 0.039999999105930328369140625;
                float productValue54 = sumValue * 0.3183098733425140380859375;
                float multiplyAddValue26 = fma(comparisonValue10 ? exp2(log2(spvNMax(scalarValue6, 0.0)) * 2.2000000476837158203125) : ((scalarValue6 <= 0.040449999272823333740234375) ? (scalarValue6 * 0.077399380505084991455078125) : exp2(log2((scalarValue6 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), productValue17, productValue53);
                float multiplyAddValue27 = fma(comparisonValue10 ? exp2(log2(spvNMax(scalarValue7, 0.0)) * 2.2000000476837158203125) : ((scalarValue7 <= 0.040449999272823333740234375) ? (scalarValue7 * 0.077399380505084991455078125) : exp2(log2((scalarValue7 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), productValue17, productValue53);
                float multiplyAddValue28 = fma(comparisonValue10 ? exp2(log2(spvNMax(scalarValue8, 0.0)) * 2.2000000476837158203125) : ((scalarValue8 <= 0.040449999272823333740234375) ? (scalarValue8 * 0.077399380505084991455078125) : exp2(log2((scalarValue8 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), productValue17, productValue53);
                vec3 vectorValue7 = vec3(quotientValue3, quotientValue4, quotientValue);
                float nonlinearValue1 = sqrt(rdDot3Precise2(vectorValue7, vectorValue7)) + 9.9999997473787516355514526367188e-05;
                float productValue58 = spvNClamp((0.4980392158031463623046875 - scalarValue9) * 2.007874011993408203125, 0.0, 1.0) * fragmentScalarConstants1.packedValues[164u];
                bool conditionValue3 = int(uint(int(fragmentScalarConstants1.packedValues[73u]))) > int(0u);
                float multiplyAddValue29 = conditionValue3 ? ((fma(scalarValue21, productValue41, multiplyAddValue20) + multiplyAddValue8) + fragmentVectorConstants1.packedValues[26u].x) : multiplyAddValue5;
                float multiplyAddValue30 = conditionValue3 ? ((fma(scalarValue21, productValue42, multiplyAddValue21) + multiplyAddValue9) + fragmentVectorConstants1.packedValues[26u].y) : multiplyAddValue6;
                float multiplyAddValue31 = conditionValue3 ? ((fma(scalarValue21, productValue43, multiplyAddValue22) + multiplyAddValue13) + fragmentVectorConstants1.packedValues[26u].z) : multiplyAddValue7;
                float multiplyAddValue32 = fma(multiplyAddValue3, fragmentScalarConstants1.packedValues[108u], multiplyAddValue4);
                uint scalarValue23 = uint(int(fragmentScalarConstants1.packedValues[111u]));
                uint multiplyAddValue33 = uint(int(conditionValue ? multiplyAddValue32 : fma(fragmentScalarConstants1.packedValues[109u], fragmentScalarConstants1.packedValues[108u] * comparisonValue1, multiplyAddValue32))) * scalarValue23;
                uint sumValue4 = multiplyAddValue33 + scalarValue23;
                vec3 vectorValue8 = vec3(productValue50, productValue51, productValue52);
                float quotientValue8 = -(quotientValue3 / nonlinearValue1);
                float quotientValue9 = -(quotientValue4 / nonlinearValue1);
                float quotientValue10 = -(quotientValue / nonlinearValue1);
                vec3 vectorValue9 = vec3(quotientValue8, quotientValue9, quotientValue10);
                float sumValue5 = fragmentScalarConstants1.packedValues[165u] + 1.0;
                float productValue59 = sumValue5 * sumValue5;
                float productValue60 = spvNMax(rdEvaluateFloatExpression(bitfieldExtract(sampledTextureValue12.x, int(8u), int(8u))) * 0.0039215688593685626983642578125, 0.0500000007450580596923828125);
                float scalarValue24 = spvNMax(rdDot3Precise2(vectorValue8, vectorValue9), 0.0);
                float productValue61 = productValue60 * productValue60;
                float productValue75 = productValue61 * productValue61;
                float multiplyAddValue34 = fma(productValue61, productValue61, -1.0);
                float productValue76 = productValue61 * 0.5;
                float multiplyAddValue44 = fma(-productValue61, 0.5, 1.0);
                float multiplyAddValue45 = scalarValue24 / (fma(scalarValue24, multiplyAddValue44, productValue76) + 9.9999997473787516355514526367188e-05);
                float sumValue6 = 1.0 - multiplyAddValue26;
                float sumValue16 = 1.0 - multiplyAddValue27;
                float sumValue32 = 1.0 - multiplyAddValue28;
                bool conditionValue4 = fragmentScalarConstants1.packedValues[84u] > 0.0;
                bool conditionValue5 = fragmentScalarConstants1.packedValues[80u] > 0.0;
                float scalarValue25 = -fragmentScalarConstants1.packedValues[124u];
                float quotientValue11 = 0.5 / fragmentVectorConstants1.packedValues[17u].x;
                float quotientValue12 = 0.5 / fragmentVectorConstants1.packedValues[17u].y;
                bool conditionValue6 = productValue58 > 0.0;
                float quotientValue13 = 1.0 / (fragmentScalarConstants1.packedValues[125u] - fragmentScalarConstants1.packedValues[124u]);
                float intermediateValue64;
                float intermediateValue66;
                float intermediateValue68;
                float intermediateValue70;
                float intermediateValue72;
                float intermediateValue74;
                intermediateValue74 = 0.0;
                intermediateValue72 = 0.0;
                intermediateValue70 = 0.0;
                intermediateValue68 = 0.0;
                intermediateValue66 = 0.0;
                intermediateValue64 = 0.0;
                float multiplyAddValue35;
                float multiplyAddValue36;
                float multiplyAddValue37;
                float multiplyAddValue38;
                float multiplyAddValue39;
                float multiplyAddValue40;
                uint sumValue9;
                uint scalarValue26 = multiplyAddValue33;
                for (;;)
                {
                    if (int(scalarValue26) >= int(sumValue4))
                    {
                        break;
                    }
                    uint reinterpretedBits = uint(int(uintBitsToFloat(intermediateValue5.packedValues[scalarValue26])));
                    if (int(reinterpretedBits) < int(0u))
                    {
                        break;
                    }
                    uint productValue77 = reinterpretedBits * 32u;
                    vec3 reinterpretedBits1 = uintBitsToFloat(uvec3(intermediateValue6.packedValues[productValue77], intermediateValue6.packedValues[productValue77 + 1u], intermediateValue6.packedValues[productValue77 + 2u]));
                    float scalarValue27 = reinterpretedBits1.x;
                    float scalarValue28 = reinterpretedBits1.y;
                    float scalarValue29 = reinterpretedBits1.z;
                    float multiplyAddValue46 = (fma(fragmentVectorConstants1.packedValues[6u].x, scalarValue29, fma(fragmentVectorConstants1.packedValues[4u].x, scalarValue27, scalarValue28 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) - quotientValue3;
                    float multiplyAddValue47 = (fma(fragmentVectorConstants1.packedValues[6u].y, scalarValue29, fma(fragmentVectorConstants1.packedValues[4u].y, scalarValue27, scalarValue28 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) - quotientValue4;
                    float multiplyAddValue48 = (fma(fragmentVectorConstants1.packedValues[6u].z, scalarValue29, fma(fragmentVectorConstants1.packedValues[4u].z, scalarValue27, scalarValue28 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) - quotientValue;
                    vec3 vectorValue10 = vec3(multiplyAddValue46, multiplyAddValue47, multiplyAddValue48);
                    float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
                    vec3 productValue78 = vec3(inverseLengthValue7 * multiplyAddValue46, inverseLengthValue7 * multiplyAddValue47, inverseLengthValue7 * multiplyAddValue48);
                    float scalarValue30 = rdDot3Precise2(vectorValue8, productValue78);
                    float scalarValue31 = spvNMax(scalarValue30, 0.0);
                    float multiplyAddValue49 = fma(productValue58, spvNMax((scalarValue30 + fragmentScalarConstants1.packedValues[165u]) / productValue59, 0.0) - scalarValue31, scalarValue31);
                    float multiplyAddValue50 = fma(multiplyAddValue46, inverseLengthValue7, quotientValue8);
                    float multiplyAddValue51 = fma(multiplyAddValue47, inverseLengthValue7, quotientValue9);
                    float multiplyAddValue52 = fma(multiplyAddValue48, inverseLengthValue7, quotientValue10);
                    vec3 vectorValue11 = vec3(multiplyAddValue50, multiplyAddValue51, multiplyAddValue52);
                    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
                    vec3 productValue79 = vec3(inverseLengthValue8 * multiplyAddValue50, inverseLengthValue8 * multiplyAddValue51, inverseLengthValue8 * multiplyAddValue52);
                    float scalarValue32 = spvNMax(rdDot3Precise2(vectorValue8, productValue79), 0.0);
                    float multiplyAddValue53 = fma(scalarValue32 * scalarValue32, multiplyAddValue34, 1.0);
                    float quotientValue14 = productValue75 / ((multiplyAddValue53 * multiplyAddValue53) * 3.1415927410125732421875);
                    float multiplyAddValue56 = multiplyAddValue45 * (scalarValue31 / (fma(scalarValue31, multiplyAddValue44, productValue76) + 9.9999997473787516355514526367188e-05));
                    float sumValue54 = spvNMax(1.0 - spvNMax(rdDot3Precise2(vectorValue9, productValue79), 0.0), 0.0);
                    float productValue80 = sumValue54 * sumValue54;
                    float productValue81 = sumValue54 * (productValue80 * productValue80);
                    float multiplyAddValue57 = fma(sumValue6, productValue81, multiplyAddValue26);
                    float multiplyAddValue58 = fma(sumValue16, productValue81, multiplyAddValue27);
                    float multiplyAddValue59 = fma(sumValue32, productValue81, multiplyAddValue28);
                    float multiplyAddValue63 = fma(scalarValue24 * scalarValue31, 4.0, 9.9999997473787516355514526367188e-05);
                    float intermediateValue86;
                    float intermediateValue87;
                    float intermediateValue88;
                    bool intermediateValue89;
                    float intermediateValue91;
                    if (int(reinterpretedBits) >= int(0u))
                    {
                        vec4 reinterpretedBits2 = uintBitsToFloat(intermediateValue7.packedValues[reinterpretedBits * 8u]);
                        float scalarValue33 = reinterpretedBits2.w;
                        float sumValue64 = reinterpretedBits2.x - multiplyAddValue5;
                        float sumValue71 = reinterpretedBits2.y - multiplyAddValue6;
                        float sumValue72 = reinterpretedBits2.z - multiplyAddValue7;
                        float sumValue73 = abs(sumValue72) + (abs(sumValue71) + abs(sumValue64));
                        vec3 vectorValue12 = vec3(sumValue64, sumValue71, sumValue72);
                        float comparisonValue13 = conditionValue4 ? (sumValue73 * sumValue73) : rdDot3Precise2(vectorValue12, vectorValue12);
                        float productValue46;
                        float productValue47;
                        float productValue48;
                        bool intermediateValue90;
                        float intermediateValue92;
                        if (comparisonValue13 < (scalarValue33 * scalarValue33))
                        {
                            float intermediateValue93;
                            bool intermediateValue94;
                            if (comparisonValue)
                            {
                                vec4 reinterpretedBits3 = uintBitsToFloat(intermediateValue7.packedValues[(reinterpretedBits * 8u) + 2u]);
                                vec4 reinterpretedBits4 = uintBitsToFloat(intermediateValue7.packedValues[(reinterpretedBits * 8u) + 3u]);
                                vec4 reinterpretedBits5 = uintBitsToFloat(intermediateValue7.packedValues[(reinterpretedBits * 8u) + 4u]);
                                vec4 reinterpretedBits6 = uintBitsToFloat(intermediateValue7.packedValues[(reinterpretedBits * 8u) + 5u]);
                                vec4 reinterpretedBits7 = uintBitsToFloat(intermediateValue7.packedValues[(reinterpretedBits * 8u) + 6u]);
                                vec4 reinterpretedBits8 = uintBitsToFloat(intermediateValue7.packedValues[(reinterpretedBits * 8u) + 7u]);
                                float sumValue80 = multiplyAddValue29 - scalarValue27;
                                float sumValue81 = multiplyAddValue30 - scalarValue28;
                                float sumValue82 = multiplyAddValue31 - scalarValue29;
                                float scalarValue34 = abs(sumValue80);
                                float scalarValue35 = abs(sumValue81);
                                float scalarValue36 = abs(sumValue82);
                                bool comparisonValue16 = scalarValue35 >= scalarValue36;
                                bool comparisonValue19 = (scalarValue34 >= scalarValue36) && (scalarValue34 >= scalarValue35);
                                bool comparisonValue22 = sumValue81 >= 0.0;
                                bool comparisonValue25 = sumValue82 >= 0.0;
                                bool conditionValue7 = !comparisonValue19;
                                bool comparisonValue29 = (!(sumValue80 >= 0.0)) && comparisonValue19;
                                bool bitwiseValue4 = (comparisonValue22 && comparisonValue16) && conditionValue7;
                                bool bitwiseValue5 = (comparisonValue16 && (!comparisonValue22)) && conditionValue7;
                                bool bitwiseValue6 = ((!comparisonValue16) && comparisonValue25) && conditionValue7;
                                bool bitwiseValue9 = (comparisonValue25 || comparisonValue16) || comparisonValue19;
                                float comparisonValue30 = comparisonValue29 ? reinterpretedBits4.x : (bitwiseValue4 ? reinterpretedBits5.x : (bitwiseValue5 ? reinterpretedBits6.x : (bitwiseValue6 ? reinterpretedBits7.x : (bitwiseValue9 ? reinterpretedBits3.x : reinterpretedBits8.x))));
                                float comparisonValue31 = comparisonValue29 ? reinterpretedBits4.y : (bitwiseValue4 ? reinterpretedBits5.y : (bitwiseValue5 ? reinterpretedBits6.y : (bitwiseValue6 ? reinterpretedBits7.y : (bitwiseValue9 ? reinterpretedBits3.y : reinterpretedBits8.y))));
                                float comparisonValue32 = comparisonValue29 ? reinterpretedBits4.z : (bitwiseValue4 ? reinterpretedBits5.z : (bitwiseValue5 ? reinterpretedBits6.z : (bitwiseValue6 ? reinterpretedBits7.z : (bitwiseValue9 ? reinterpretedBits3.z : reinterpretedBits8.z))));
                                float comparisonValue33 = comparisonValue29 ? reinterpretedBits4.w : (bitwiseValue4 ? reinterpretedBits5.w : (bitwiseValue5 ? reinterpretedBits6.w : (bitwiseValue6 ? reinterpretedBits7.w : (bitwiseValue9 ? reinterpretedBits3.w : reinterpretedBits8.w))));
                                float multiplyAddValue54;
                                bool multiplyAddValue55;
                                if (!((comparisonValue32 == 0.0) && (comparisonValue33 == 0.0)))
                                {
                                    float scalarValue37 = scalarValue27 - multiplyAddValue29;
                                    float sumValue83 = scalarValue29 - multiplyAddValue31;
                                    float sumValue84 = scalarValue28 - multiplyAddValue30;
                                    float comparisonValue71 = comparisonValue29 ? sumValue83 : (((bitwiseValue6 || bitwiseValue5) || bitwiseValue4) ? scalarValue37 : (bitwiseValue9 ? sumValue82 : sumValue80));
                                    float comparisonValue72 = comparisonValue29 ? sumValue81 : (bitwiseValue4 ? sumValue83 : (bitwiseValue5 ? sumValue82 : sumValue81));
                                    float comparisonValue73 = comparisonValue29 ? sumValue80 : (bitwiseValue4 ? sumValue84 : (bitwiseValue5 ? sumValue81 : (bitwiseValue6 ? sumValue83 : (bitwiseValue9 ? scalarValue37 : sumValue82))));
                                    float multiplyAddValue64 = fma(fragmentVectorConstants1.packedValues[2u].w, comparisonValue73, fma(fragmentVectorConstants1.packedValues[0u].w, comparisonValue71, comparisonValue72 * fragmentVectorConstants1.packedValues[1u].w)) + fragmentVectorConstants1.packedValues[3u].w;
                                    vec3 vectorValue13 = vec3(scalarValue37, sumValue84, sumValue83);
                                    float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
                                    float productValue83 = spvNMin(spvNMax(rdDot3Precise2(vec3(inverseLengthValue9 * scalarValue37, inverseLengthValue9 * sumValue84, inverseLengthValue9 * sumValue83), vec3(productValue44, productValue45, productValue49)), fragmentScalarConstants1.packedValues[144u]), 1.0);
                                    float sumValue85 = comparisonValue32 - comparisonValue30;
                                    float sumValue86 = comparisonValue33 - comparisonValue31;
                                    float productValue84 = sumValue85 * fragmentVectorConstants1.packedValues[17u].x;
                                    float productValue85 = sumValue86 * fragmentVectorConstants1.packedValues[17u].y;
                                    float multiplyAddValue65 = (fma(fragmentVectorConstants1.packedValues[2u].x, comparisonValue73, fma(fragmentVectorConstants1.packedValues[0u].x, comparisonValue71, comparisonValue72 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue64;
                                    float multiplyAddValue66 = (fma(fragmentVectorConstants1.packedValues[2u].y, comparisonValue73, fma(fragmentVectorConstants1.packedValues[0u].y, comparisonValue71, comparisonValue72 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue64;
                                    vec4 sampledTextureValue14 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(spvNMin(comparisonValue32 - quotientValue11, spvNMax(quotientValue11 + comparisonValue30, fma((floor(productValue84 * fma(multiplyAddValue65, 0.5, 0.5)) + 0.5) / productValue84, sumValue85, comparisonValue30))), spvNMin(comparisonValue33 - quotientValue12, spvNMax(quotientValue12 + comparisonValue31, fma((floor(productValue85 * (1.0 - fma(multiplyAddValue66, 0.5, 0.5))) + 0.5) / productValue85, sumValue86, comparisonValue31)))), 0.0);
                                    float scalarValue38 = sampledTextureValue14.x;
                                    float multiplyAddValue67 = fma(fragmentVectorConstants1.packedValues[34u].w, scalarValue38, fma(fragmentVectorConstants1.packedValues[32u].w, multiplyAddValue65, multiplyAddValue66 * fragmentVectorConstants1.packedValues[33u].w)) + fragmentVectorConstants1.packedValues[35u].w;
                                    vec3 vectorValue14 = vec3(comparisonValue71, comparisonValue72, comparisonValue73);
                                    vec3 multiplyAddValue68 = vec3((fma(fragmentVectorConstants1.packedValues[34u].x, scalarValue38, fma(fragmentVectorConstants1.packedValues[32u].x, multiplyAddValue65, multiplyAddValue66 * fragmentVectorConstants1.packedValues[33u].x)) + fragmentVectorConstants1.packedValues[35u].x) / multiplyAddValue67, (fma(fragmentVectorConstants1.packedValues[34u].y, scalarValue38, fma(fragmentVectorConstants1.packedValues[32u].y, multiplyAddValue65, multiplyAddValue66 * fragmentVectorConstants1.packedValues[33u].y)) + fragmentVectorConstants1.packedValues[35u].y) / multiplyAddValue67, (fma(fragmentVectorConstants1.packedValues[34u].z, scalarValue38, fma(fragmentVectorConstants1.packedValues[32u].z, multiplyAddValue65, multiplyAddValue66 * fragmentVectorConstants1.packedValues[33u].z)) + fragmentVectorConstants1.packedValues[35u].z) / multiplyAddValue67);
                                    float nonlinearValue2 = spvNClamp((sqrt(rdDot3Precise2(vectorValue14, vectorValue14)) - sqrt(rdDot3Precise2(multiplyAddValue68, multiplyAddValue68))) * fragmentScalarConstants1.packedValues[166u], 0.0, 1.0);
                                    multiplyAddValue54 = conditionValue6 ? fma(-fma(nonlinearValue2, -2.0, 3.0), nonlinearValue2 * nonlinearValue2, 1.0) : 1.0;
                                    multiplyAddValue55 = scalarValue38 >= (fma(-fma(fragmentScalarConstants1.packedValues[33u], sqrt(fma(-productValue83, productValue83, 1.0)) / productValue83, fragmentScalarConstants1.packedValues[32u]), fragmentScalarConstants1.packedValues[70u] / spvNMax(productValue84, 1.0), fma(fragmentVectorConstants1.packedValues[2u].z, comparisonValue73, fma(fragmentVectorConstants1.packedValues[0u].z, comparisonValue71, comparisonValue72 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) / multiplyAddValue64);
                                }
                                else
                                {
                                    multiplyAddValue54 = 1.0;
                                    multiplyAddValue55 = false;
                                }
                                intermediateValue93 = multiplyAddValue54;
                                intermediateValue94 = multiplyAddValue55;
                            }
                            else
                            {
                                intermediateValue93 = 1.0;
                                intermediateValue94 = true;
                            }
                            float quotientValue15 = 1.0 / spvNMax(comparisonValue13, 0.100000001490116119384765625);
                            float multiplyAddValue69 = comparisonValue13 / fma(scalarValue33, scalarValue33, 9.9999997473787516355514526367188e-05);
                            float multiplyAddValue70 = spvNMax(fma(-multiplyAddValue69, multiplyAddValue69, 1.0), 0.0);
                            float productValue86 = multiplyAddValue70 * multiplyAddValue70;
                            float productValue87 = productValue86 * quotientValue15;
                            float multiplyAddValue71 = spvNClamp(quotientValue13 * (fma(-quotientValue15, productValue86, scalarValue25) + 1.0), 0.0, 1.0);
                            float multiplyAddValue72 = conditionValue5 ? (spvNClamp(fma((multiplyAddValue71 * multiplyAddValue71) * fma(multiplyAddValue71, -2.0, 3.0), fragmentScalarConstants1.packedValues[126u], fragmentScalarConstants1.packedValues[127u]), 0.0, 1.0) * productValue87) : productValue87;
                            vec4 reinterpretedBits9 = uintBitsToFloat(intermediateValue7.packedValues[(reinterpretedBits * 8u) + 1u]);
                            float scalarValue39 = reinterpretedBits9.w;
                            intermediateValue92 = intermediateValue93;
                            intermediateValue90 = intermediateValue94;
                            productValue48 = multiplyAddValue72 * (scalarValue39 * reinterpretedBits9.x);
                            productValue47 = multiplyAddValue72 * (scalarValue39 * reinterpretedBits9.y);
                            productValue46 = multiplyAddValue72 * (scalarValue39 * reinterpretedBits9.z);
                        }
                        else
                        {
                            intermediateValue92 = 1.0;
                            intermediateValue90 = true;
                            productValue48 = 0.0;
                            productValue47 = 0.0;
                            productValue46 = 0.0;
                        }
                        intermediateValue86 = productValue46;
                        intermediateValue87 = productValue47;
                        intermediateValue88 = productValue48;
                        intermediateValue89 = intermediateValue90;
                        intermediateValue91 = intermediateValue92;
                    }
                    else
                    {
                        intermediateValue86 = 0.0;
                        intermediateValue87 = 0.0;
                        intermediateValue88 = 0.0;
                        intermediateValue89 = true;
                        intermediateValue91 = 1.0;
                    }
                    float quotientValue17 = (productValue54 * (productValue58 * spvNMax((rdDot3Precise2(vec3(-productValue50, -productValue51, -productValue52), productValue78) + fragmentScalarConstants1.packedValues[165u]) / productValue59, 0.0))) * intermediateValue91;
                    multiplyAddValue35 = fma(intermediateValue88 * (intermediateValue89 ? ((productValue54 * (multiplyAddValue49 * (1.0 - multiplyAddValue57))) + quotientValue17) : quotientValue17), fragmentScalarConstants1.packedValues[116u], intermediateValue74);
                    multiplyAddValue36 = fma(intermediateValue87 * (intermediateValue89 ? ((productValue54 * (multiplyAddValue49 * (1.0 - multiplyAddValue58))) + quotientValue17) : quotientValue17), fragmentScalarConstants1.packedValues[116u], intermediateValue72);
                    multiplyAddValue37 = fma(intermediateValue86 * (intermediateValue89 ? ((productValue54 * (multiplyAddValue49 * (1.0 - multiplyAddValue59))) + quotientValue17) : quotientValue17), fragmentScalarConstants1.packedValues[116u], intermediateValue70);
                    multiplyAddValue38 = intermediateValue89 ? fma(fragmentScalarConstants1.packedValues[117u], intermediateValue88 * (scalarValue31 * ((multiplyAddValue56 * (quotientValue14 * multiplyAddValue57)) / multiplyAddValue63)), intermediateValue68) : intermediateValue68;
                    multiplyAddValue39 = intermediateValue89 ? fma(fragmentScalarConstants1.packedValues[117u], intermediateValue87 * (scalarValue31 * ((multiplyAddValue56 * (quotientValue14 * multiplyAddValue58)) / multiplyAddValue63)), intermediateValue66) : intermediateValue66;
                    multiplyAddValue40 = intermediateValue89 ? fma(fragmentScalarConstants1.packedValues[117u], intermediateValue86 * (scalarValue31 * ((multiplyAddValue56 * (quotientValue14 * multiplyAddValue59)) / multiplyAddValue63)), intermediateValue64) : intermediateValue64;
                    sumValue9 = scalarValue26 + 1u;
                    intermediateValue74 = multiplyAddValue35;
                    intermediateValue72 = multiplyAddValue36;
                    intermediateValue70 = multiplyAddValue37;
                    intermediateValue68 = multiplyAddValue38;
                    intermediateValue66 = multiplyAddValue39;
                    intermediateValue64 = multiplyAddValue40;
                    scalarValue26 = sumValue9;
                    continue;
                }
                intermediateValue63 = intermediateValue64;
                intermediateValue65 = intermediateValue66;
                intermediateValue67 = intermediateValue68;
                intermediateValue69 = intermediateValue70;
                intermediateValue71 = intermediateValue72;
                intermediateValue73 = intermediateValue74;
            }
            else
            {
                intermediateValue63 = 0.0;
                intermediateValue65 = 0.0;
                intermediateValue67 = 0.0;
                intermediateValue69 = 0.0;
                intermediateValue71 = 0.0;
                intermediateValue73 = 0.0;
            }
            float sumValue88 = 1.0 - fragmentScalarConstants1.packedValues[168u];
            productValue10 = intermediateValue73 * sumValue88;
            productValue9 = intermediateValue71 * sumValue88;
            productValue8 = intermediateValue69 * sumValue88;
            productValue7 = intermediateValue67 * sumValue88;
            productValue6 = intermediateValue65 * sumValue88;
            productValue5 = intermediateValue63 * sumValue88;
        }
        else
        {
            productValue10 = 0.0;
            productValue9 = 0.0;
            productValue8 = 0.0;
            productValue7 = 0.0;
            productValue6 = 0.0;
            productValue5 = 0.0;
        }
        intermediateValue34 = productValue5;
        intermediateValue35 = productValue6;
        intermediateValue36 = productValue7;
        intermediateValue37 = productValue8;
        intermediateValue38 = productValue9;
        intermediateValue39 = productValue10;
    }
    else
    {
        intermediateValue34 = 0.0;
        intermediateValue35 = 0.0;
        intermediateValue36 = 0.0;
        intermediateValue37 = 0.0;
        intermediateValue38 = 0.0;
        intermediateValue39 = 0.0;
    }
    float productValue88 = bitwiseValue2 * bitwiseValue2;
    float productValue89 = bitwiseValue2 * (productValue88 * productValue88);
    float multiplyAddValue73 = fma(fragmentScalarConstants1.packedValues[101u], fma(productValue88, bitwiseValue2, -productValue89), productValue89);
    fragmentColor1.x = fma(spvNMax(fma((bitwiseValue3 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue11, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * fragmentScalarConstants1.packedValues[79u], 6.0, (multiplyAddValue73 * fragmentVectorConstants1.packedValues[39u].x) * fragmentScalarConstants1.packedValues[159u]), fragmentScalarConstants1.packedValues[95u] * fragmentVectorConstants1.packedValues[23u].x) * sumValue, fragmentScalarConstants1.packedValues[119u], intermediateValue39);
    fragmentColor1.y = fma(spvNMax(fma((bitwiseValue3 * (rdEvaluateFloatExpression(scalarValue11 & 255u) * 0.0039215688593685626983642578125)) * fragmentScalarConstants1.packedValues[79u], 6.0, (multiplyAddValue73 * fragmentVectorConstants1.packedValues[39u].y) * fragmentScalarConstants1.packedValues[159u]), fragmentScalarConstants1.packedValues[95u] * fragmentVectorConstants1.packedValues[23u].y) * sumValue, fragmentScalarConstants1.packedValues[119u], intermediateValue38);
    fragmentColor1.z = fma(spvNMax(fma((bitwiseValue3 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue12, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * fragmentScalarConstants1.packedValues[79u], 6.0, (multiplyAddValue73 * fragmentVectorConstants1.packedValues[39u].z) * fragmentScalarConstants1.packedValues[159u]), fragmentScalarConstants1.packedValues[95u] * fragmentVectorConstants1.packedValues[23u].z) * sumValue, fragmentScalarConstants1.packedValues[119u], intermediateValue37);
    fragmentColor0.x = fma(scalarValue3, 0.5, 0.5);
    fragmentColor0.y = fma(scalarValue4, 0.5, 0.5);
    float productValue90 = floor(scalarValue5 * 65535.0);
    fragmentColor0.z = productValue90 * 1.525902189314365386962890625e-05;
    fragmentColor0.w = fma(scalarValue5, 65535.0, -productValue90);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue203 = floor(varyingTexCoord0.y * fragmentVectorConstants1.packedValues[15u].y) + 0.5;
    float productValue204 = (floor(varyingTexCoord0.x * fragmentVectorConstants1.packedValues[15u].x) + 0.5) * fragmentVectorConstants1.packedValues[15u].z;
    float productValue205 = productValue203 * fragmentVectorConstants1.packedValues[15u].w;
    vec4 sampledTextureValue69 = texture(sampler2D(materialTexture3, textureSampler3), vec2(productValue204, productValue205));
    float scalarValue110 = sampledTextureValue69.x;
    float scalarValue111 = sampledTextureValue69.y;
    vec4 sampledTextureValue70 = texture(sampler2D(materialTexture6, textureSampler6), vec2(productValue204, productValue205));
    float scalarValue112 = sampledTextureValue70.x;
    vec4 sampledTextureValue71 = texture(sampler2D(materialTexture1, textureSampler1), vec2(productValue204, productValue205));
    bool sampledTextureValue10 = uint(textureQueryLevels(intermediateValue1)) > 0u;
    uvec2 sampledTextureValue11 = uvec2(textureSize(intermediateValue1, int(0u)));
    uint scalarValue10 = sampledTextureValue11.x;
    uvec4 sampledTextureValue72 = texelFetch(intermediateValue1, ivec2(uvec2(uint(int(productValue204 * rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue10 : 0u))), uint(int(productValue205 * rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u))))), int(0u));
    uint scalarValue113 = sampledTextureValue72.y;
    uint scalarValue114 = sampledTextureValue72.z;
    uint scalarValue115 = sampledTextureValue72.w;
    float bitwiseValue58 = rdEvaluateFloatExpression(scalarValue115 & 255u) * 0.0039215688593685626983642578125;
    uint scalarValue116 = bitfieldExtract(scalarValue115, int(8u), int(8u));
    float intermediateValue31;
    float intermediateValue33;
    float intermediateValue35;
    if ((fragmentScalarConstants1.packedValues[59u] != 0.0) && ((scalarValue116 & 1u) == 0u))
    {
        float multiplyAddValue103 = fma(scalarValue112, fragmentScalarConstants1.packedValues[27u], fragmentScalarConstants1.packedValues[31u]);
        float multiplyAddValue104 = (fma(productValue204, 2.0, -1.0) * fragmentScalarConstants1.packedValues[16u]) / multiplyAddValue103;
        float multiplyAddValue105 = (fma(fma(-productValue203, fragmentScalarConstants1.packedValues[63u], 1.0), 2.0, -1.0) * fragmentScalarConstants1.packedValues[21u]) / multiplyAddValue103;
        float quotientValue44 = fragmentScalarConstants1.packedValues[30u] / multiplyAddValue103;
        float scalarValue117 = abs(scalarValue111);
        float sumValue140 = 1.0 - abs(scalarValue110);
        float sumValue141 = sumValue140 - scalarValue117;
        bool conditionValue11 = sumValue141 < 0.0;
        float comparisonValue95 = conditionValue11 ? (((scalarValue111 >= 0.0) ? 1.0 : (-1.0)) * sumValue140) : scalarValue111;
        float comparisonValue96 = conditionValue11 ? (((scalarValue110 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue117)) : scalarValue110;
        vec3 vectorValue15 = vec3(comparisonValue95, sumValue141, comparisonValue96);
        float inverseLengthValue24 = inversesqrt(rdDot3Precise2(vectorValue15, vectorValue15));
        float productValue206 = inverseLengthValue24 * comparisonValue95;
        float productValue207 = inverseLengthValue24 * sumValue141;
        float productValue208 = inverseLengthValue24 * comparisonValue96;
        float multiplyAddValue106 = fma(productValue208, 0.20000000298023223876953125, ((fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue44, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue104, multiplyAddValue105 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) - fragmentVectorConstants1.packedValues[12u].x) - 0.5);
        float multiplyAddValue107 = fma(productValue206, 0.20000000298023223876953125, ((fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue44, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue104, multiplyAddValue105 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) - fragmentVectorConstants1.packedValues[12u].y) - 0.5);
        float multiplyAddValue108 = fma(productValue207, 0.20000000298023223876953125, ((fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue44, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue104, multiplyAddValue105 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) - fragmentVectorConstants1.packedValues[12u].z) - 0.5);
        uint productValue209 = uint(int(floor(floor(multiplyAddValue106) * 0.0625)));
        uint productValue210 = uint(int(floor(floor(multiplyAddValue107) * 0.0625)));
        uint productValue211 = uint(int(floor(floor(multiplyAddValue108) * 0.0625)));
        uint scalarValue118 = bitfieldInsert(productValue209, productValue210, int(16u), int(16u));
        uint bitwiseValue59 = productValue211 & 65535u;
        uint productValue212 = productValue209 * 1540483477u;
        uint productValue213 = productValue210 * 1540483477u;
        uint productValue214 = productValue211 * 1540483477u;
        uint bitwiseValue60 = ((((productValue214 >> 24u) ^ productValue214) * 1540483477u) ^ ((((productValue213 ^ (productValue213 >> 24u)) * 1540483477u) ^ (((((productValue212 >> 24u) ^ productValue212) * 1540483477u) ^ 2293326976u) * 1540483477u)) * 1540483477u)) * 1540483477u;
        uint bitwiseValue61 = ((bitwiseValue60 >> 13u) ^ bitwiseValue60) * 1540483477u;
        uint bitwiseValue62 = (bitwiseValue61 >> 15u) ^ bitwiseValue61;
        uint bitwiseValue63 = (bitwiseValue62 ^ (bitwiseValue62 >> 16u)) & 65535u;
        bool comparisonValue97 = bitwiseValue63 != 0u;
        uint bitwiseValue64 = bitwiseValue63 | 1u;
        uint sumValue142 = uint(fragmentScalarConstants1.packedValues[36u]) - 1u;
        uint comparisonValue98 = (comparisonValue97 ? bitwiseValue63 : bitwiseValue64) & sumValue142;
        uint comparisonValue4;
        uint comparisonValue5;
        uint bitwiseValue8;
        uint sumValue3;
        uint intermediateValue37;
        uint intermediateValue38;
        uint scalarValue82 = 0u;
        uint scalarValue83 = 0u;
        uint scalarValue119 = comparisonValue98;
        uint scalarValue120 = 0u;
        for (;;)
        {
            if (int(scalarValue120) >= int(8u))
            {
                intermediateValue37 = scalarValue83;
                intermediateValue38 = scalarValue82;
                break;
            }
            uint bitwiseValue65 = intermediateValue4.packedValues[scalarValue119].z & 65535u;
            bool comparisonValue99 = (bitwiseValue59 == intermediateValue4.packedValues[scalarValue119].y) && ((((bitwiseValue64 == bitwiseValue65) && (!comparisonValue97)) || (comparisonValue97 && (bitwiseValue63 == bitwiseValue65))) && (scalarValue118 == intermediateValue4.packedValues[scalarValue119].x));
            bool comparisonValue100 = scalarValue82 != 0u;
            comparisonValue5 = (comparisonValue100 || (!comparisonValue99)) ? scalarValue83 : intermediateValue4.packedValues[scalarValue119].w;
            comparisonValue4 = comparisonValue99 ? 4294967295u : scalarValue82;
            bitwiseValue8 = sumValue142 & (scalarValue119 + 1u);
            bool comparisonValue101 = (bitwiseValue65 == 0u) || comparisonValue99;
            if ((comparisonValue100 && (!comparisonValue101)) || comparisonValue101)
            {
                intermediateValue37 = comparisonValue5;
                intermediateValue38 = comparisonValue4;
                break;
            }
            sumValue3 = scalarValue120 + 1u;
            scalarValue82 = comparisonValue4;
            scalarValue83 = comparisonValue5;
            scalarValue119 = bitwiseValue8;
            scalarValue120 = sumValue3;
            continue;
        }
        float intermediateValue32;
        float intermediateValue34;
        float intermediateValue36;
        if (intermediateValue38 != 0u)
        {
            float productValue215 = floor(multiplyAddValue106 * 0.0625);
            float productValue216 = floor(multiplyAddValue107 * 0.0625);
            float productValue217 = floor(multiplyAddValue108 * 0.0625);
            float multiplyAddValue109 = fma(-productValue215, 16.0, multiplyAddValue106);
            float multiplyAddValue110 = fma(-productValue216, 16.0, multiplyAddValue107);
            float multiplyAddValue111 = fma(-productValue217, 16.0, multiplyAddValue108);
            uint bitwiseValue66 = intermediateValue37 >> 2u;
            float scalarValue121 = abs(productValue208);
            float scalarValue122 = abs(productValue206);
            float scalarValue123 = abs(productValue207);
            float multiplyAddValue10;
            float multiplyAddValue11;
            float multiplyAddValue12;
            if (((scalarValue116 & 2u) == 0u) && ((scalarValue123 >= 1.0) || ((scalarValue122 >= 1.0) || (scalarValue121 >= 1.0))))
            {
                vec3 vectorValue16 = vec3(scalarValue122, scalarValue123, scalarValue121);
                float scalarValue124 = rdDot3Precise2(vec3(multiplyAddValue110, multiplyAddValue111, multiplyAddValue109), vectorValue16);
                float scalarValue125 = rdDot3Precise2(vec3(multiplyAddValue111, multiplyAddValue109, multiplyAddValue110), vectorValue16);
                float scalarValue126 = rdDot3Precise2(vec3(multiplyAddValue109, multiplyAddValue110, multiplyAddValue111), vectorValue16);
                float multiplyAddValue112 = (fma(sumValue141, inverseLengthValue24, productValue206 + productValue208) > 0.0) ? ceil(scalarValue124) : floor(scalarValue124);
                float scalarValue127 = floor(scalarValue125);
                float scalarValue128 = floor(scalarValue126);
                float multiplyAddValue113 = fma(scalarValue122, scalarValue128, fma(scalarValue121, multiplyAddValue112, scalarValue127 * scalarValue123));
                float multiplyAddValue114 = fma(scalarValue123, scalarValue128, fma(scalarValue122, multiplyAddValue112, scalarValue127 * scalarValue121));
                float multiplyAddValue115 = fma(scalarValue121, scalarValue128, fma(scalarValue123, multiplyAddValue112, scalarValue127 * scalarValue122));
                float sumValue143 = scalarValue123 + multiplyAddValue113;
                float sumValue144 = scalarValue121 + multiplyAddValue114;
                float sumValue145 = scalarValue122 + multiplyAddValue115;
                float sumValue146 = scalarValue122 + multiplyAddValue113;
                float sumValue147 = scalarValue123 + multiplyAddValue114;
                float sumValue148 = scalarValue121 + multiplyAddValue115;
                float sumValue149 = scalarValue122 + sumValue143;
                float sumValue150 = scalarValue123 + sumValue144;
                float sumValue151 = scalarValue121 + sumValue145;
                float sumValue152 = scalarValue125 - scalarValue127;
                float sumValue153 = scalarValue126 - scalarValue128;
                float sumValue154 = (scalarValue127 - scalarValue125) + 1.0;
                float sumValue155 = (scalarValue128 - scalarValue126) + 1.0;
                float productValue218 = sumValue155 * sumValue154;
                float productValue219 = sumValue152 * sumValue155;
                float productValue220 = sumValue153 * sumValue154;
                float productValue221 = sumValue152 * sumValue153;
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
                float comparisonValue44;
                float comparisonValue45;
                if ((((multiplyAddValue113 >= 0.0) && (multiplyAddValue114 >= 0.0)) && (multiplyAddValue115 >= 0.0)) && (((sumValue149 < 16.0) && (sumValue150 < 16.0)) && (sumValue151 < 16.0)))
                {
                    uint bitwiseValue67 = bitwiseValue66 + (((uint(multiplyAddValue115) << 4u) + uint(multiplyAddValue114)) + (uint(multiplyAddValue113) << 8u));
                    float bitwiseValue68 = rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue67] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue102 = intermediateValue5.packedValues[bitwiseValue67] != 0u;
                    uint bitwiseValue69 = bitwiseValue66 + (((uint(sumValue145) << 4u) + uint(sumValue144)) + (uint(sumValue143) << 8u));
                    float bitwiseValue70 = rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue69] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue103 = intermediateValue5.packedValues[bitwiseValue69] != 0u;
                    uint bitwiseValue71 = bitwiseValue66 + (((uint(sumValue148) << 4u) + uint(sumValue147)) + (uint(sumValue146) << 8u));
                    float bitwiseValue72 = rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue71] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue104 = intermediateValue5.packedValues[bitwiseValue71] != 0u;
                    uint bitwiseValue73 = bitwiseValue66 + (((uint(sumValue151) << 4u) + uint(sumValue150)) + (uint(sumValue149) << 8u));
                    float bitwiseValue74 = rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue73] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue105 = intermediateValue5.packedValues[bitwiseValue73] != 0u;
                    comparisonValue34 = comparisonValue105 ? ((bitwiseValue74 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue73] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue35 = comparisonValue105 ? ((bitwiseValue74 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue73] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue36 = comparisonValue105 ? ((bitwiseValue74 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[bitwiseValue73] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue37 = comparisonValue104 ? ((bitwiseValue72 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue71] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue38 = comparisonValue104 ? ((bitwiseValue72 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue71] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue39 = comparisonValue104 ? ((bitwiseValue72 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[bitwiseValue71] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue40 = comparisonValue102 ? ((bitwiseValue68 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue67] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue41 = comparisonValue102 ? ((bitwiseValue68 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue67] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue42 = comparisonValue102 ? ((bitwiseValue68 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[bitwiseValue67] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue43 = comparisonValue103 ? ((bitwiseValue70 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue69] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue44 = comparisonValue103 ? ((bitwiseValue70 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue69] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue45 = comparisonValue103 ? ((bitwiseValue70 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[bitwiseValue69] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                else
                {
                    float multiplyAddValue116 = fma(productValue215, 16.0, multiplyAddValue113);
                    float multiplyAddValue117 = fma(productValue216, 16.0, multiplyAddValue114);
                    float multiplyAddValue118 = fma(productValue217, 16.0, multiplyAddValue115);
                    uint comparisonValue106 = min(((((bitfieldInsert(bitfieldInsert(0u, (multiplyAddValue113 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (multiplyAddValue113 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (multiplyAddValue114 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue114 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue115 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue115 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))), 64u);
                    bool conditionValue12 = int(intermediateValue11[comparisonValue106].x) < int(0u);
                    uint sumValue156 = bitwiseValue66 + 4097u;
                    uint sumValue157 = bitwiseValue66 + 4096u;
                    uint multiplyAddValue119 = conditionValue12 ? (bitwiseValue66 + (bitfieldInsert(bitfieldInsert(0u, uint(multiplyAddValue115), int(4u), int(4u)), uint(multiplyAddValue114), int(0u), int(4u)) + bitfieldInsert(0u, uint(multiplyAddValue113), int(8u), int(4u)))) : ((intermediateValue5.packedValues[sumValue156 + intermediateValue11[comparisonValue106].x] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue118 * 0.0625), 16.0, multiplyAddValue118)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue117 * 0.0625), 16.0, multiplyAddValue117)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue116 * 0.0625), 16.0, multiplyAddValue116)), int(8u), int(4u))));
                    float bitwiseValue75 = rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue119] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue107 = (conditionValue12 || (((1u << (intermediateValue11[comparisonValue106].x & 31u)) & intermediateValue5.packedValues[sumValue157]) != 0u)) && (intermediateValue5.packedValues[multiplyAddValue119] != 0u);
                    float multiplyAddValue120 = fma(productValue215, 16.0, sumValue143);
                    float multiplyAddValue121 = fma(productValue216, 16.0, sumValue144);
                    float multiplyAddValue122 = fma(productValue217, 16.0, sumValue145);
                    uint comparisonValue108 = min(((((bitfieldInsert(bitfieldInsert(0u, (sumValue143 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue143 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue144 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue144 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue145 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue145 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))), 64u);
                    bool conditionValue13 = int(intermediateValue11[comparisonValue108].x) < int(0u);
                    uint multiplyAddValue123 = conditionValue13 ? (bitwiseValue66 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue145), int(4u), int(4u)), uint(sumValue144), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue143), int(8u), int(4u)))) : ((intermediateValue5.packedValues[sumValue156 + intermediateValue11[comparisonValue108].x] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue122 * 0.0625), 16.0, multiplyAddValue122)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue121 * 0.0625), 16.0, multiplyAddValue121)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue120 * 0.0625), 16.0, multiplyAddValue120)), int(8u), int(4u))));
                    float bitwiseValue76 = rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue123] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue109 = (conditionValue13 || (((1u << (intermediateValue11[comparisonValue108].x & 31u)) & intermediateValue5.packedValues[sumValue157]) != 0u)) && (intermediateValue5.packedValues[multiplyAddValue123] != 0u);
                    float multiplyAddValue124 = fma(productValue215, 16.0, sumValue146);
                    float multiplyAddValue125 = fma(productValue216, 16.0, sumValue147);
                    float multiplyAddValue126 = fma(productValue217, 16.0, sumValue148);
                    uint comparisonValue110 = min(((((bitfieldInsert(bitfieldInsert(0u, (sumValue146 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue146 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue147 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue147 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue148 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue148 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))), 64u);
                    bool conditionValue14 = int(intermediateValue11[comparisonValue110].x) < int(0u);
                    uint multiplyAddValue127 = conditionValue14 ? (bitwiseValue66 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue148), int(4u), int(4u)), uint(sumValue147), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue146), int(8u), int(4u)))) : ((intermediateValue5.packedValues[sumValue156 + intermediateValue11[comparisonValue110].x] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue126 * 0.0625), 16.0, multiplyAddValue126)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue125 * 0.0625), 16.0, multiplyAddValue125)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue124 * 0.0625), 16.0, multiplyAddValue124)), int(8u), int(4u))));
                    float bitwiseValue77 = rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue127] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue111 = (conditionValue14 || (((1u << (intermediateValue11[comparisonValue110].x & 31u)) & intermediateValue5.packedValues[sumValue157]) != 0u)) && (intermediateValue5.packedValues[multiplyAddValue127] != 0u);
                    float multiplyAddValue128 = fma(productValue215, 16.0, sumValue149);
                    float multiplyAddValue129 = fma(productValue216, 16.0, sumValue150);
                    float multiplyAddValue130 = fma(productValue217, 16.0, sumValue151);
                    uint comparisonValue112 = min(((((bitfieldInsert(bitfieldInsert(0u, (sumValue149 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue149 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue150 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue150 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue151 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue151 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))), 64u);
                    bool conditionValue15 = int(intermediateValue11[comparisonValue112].x) < int(0u);
                    uint multiplyAddValue131 = conditionValue15 ? (bitwiseValue66 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue151), int(4u), int(4u)), uint(sumValue150), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue149), int(8u), int(4u)))) : ((intermediateValue5.packedValues[sumValue156 + intermediateValue11[comparisonValue112].x] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue130 * 0.0625), 16.0, multiplyAddValue130)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue129 * 0.0625), 16.0, multiplyAddValue129)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue128 * 0.0625), 16.0, multiplyAddValue128)), int(8u), int(4u))));
                    float bitwiseValue78 = rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue131] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue113 = (conditionValue15 || (((1u << (intermediateValue11[comparisonValue112].x & 31u)) & intermediateValue5.packedValues[sumValue157]) != 0u)) && (intermediateValue5.packedValues[multiplyAddValue131] != 0u);
                    comparisonValue34 = comparisonValue113 ? ((bitwiseValue78 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue131] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue35 = comparisonValue113 ? ((bitwiseValue78 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue131] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue36 = comparisonValue113 ? ((bitwiseValue78 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[multiplyAddValue131] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue37 = comparisonValue111 ? ((bitwiseValue77 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue127] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue38 = comparisonValue111 ? ((bitwiseValue77 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue127] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue39 = comparisonValue111 ? ((bitwiseValue77 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[multiplyAddValue127] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue40 = comparisonValue107 ? ((bitwiseValue75 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue119] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue41 = comparisonValue107 ? ((bitwiseValue75 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue119] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue42 = comparisonValue107 ? ((bitwiseValue75 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[multiplyAddValue119] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue43 = comparisonValue109 ? ((bitwiseValue76 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue123] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue44 = comparisonValue109 ? ((bitwiseValue76 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue123] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue45 = comparisonValue109 ? ((bitwiseValue76 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[multiplyAddValue123] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                multiplyAddValue10 = fma(comparisonValue36, productValue221, fma(comparisonValue39, productValue220, fma(comparisonValue42, productValue218, productValue219 * comparisonValue45)));
                multiplyAddValue11 = fma(comparisonValue35, productValue221, fma(comparisonValue38, productValue220, fma(comparisonValue41, productValue218, productValue219 * comparisonValue44)));
                multiplyAddValue12 = fma(comparisonValue34, productValue221, fma(comparisonValue37, productValue220, fma(comparisonValue40, productValue218, productValue219 * comparisonValue43)));
            }
            else
            {
                float scalarValue129 = floor(multiplyAddValue109);
                float scalarValue130 = floor(multiplyAddValue110);
                float scalarValue131 = floor(multiplyAddValue111);
                float sumValue158 = multiplyAddValue109 - scalarValue129;
                float sumValue159 = multiplyAddValue110 - scalarValue130;
                float sumValue160 = multiplyAddValue111 - scalarValue131;
                uint comparisonValue114 = bitfieldInsert(bitfieldInsert(0u, (sumValue159 >= sumValue160) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue158 >= sumValue159) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue158 >= sumValue160) ? 4294967295u : 0u, int(2u), int(1u));
                float scalarValue132 = spvNMin(sumValue159, sumValue158);
                float scalarValue133 = spvNMax(sumValue159, sumValue158);
                float scalarValue134 = spvNMin(sumValue160, scalarValue132);
                float scalarValue135 = spvNMax(sumValue160, scalarValue133);
                float scalarValue136 = spvNMax(scalarValue132, spvNMin(sumValue160, scalarValue133));
                float sumValue161 = 1.0 - scalarValue135;
                float sumValue162 = scalarValue135 - scalarValue136;
                float sumValue163 = scalarValue136 - scalarValue134;
                float sumValue164 = scalarValue129 + 1.0;
                float sumValue165 = scalarValue130 + 1.0;
                float sumValue166 = scalarValue131 + 1.0;
                float comparisonValue46;
                float comparisonValue47;
                float comparisonValue48;
                float comparisonValue49;
                float comparisonValue50;
                float comparisonValue51;
                float comparisonValue52;
                float comparisonValue53;
                float comparisonValue54;
                float comparisonValue55;
                float comparisonValue56;
                float comparisonValue57;
                if (((sumValue166 < 16.0) && ((sumValue164 < 16.0) && (sumValue165 < 16.0))) && (((scalarValue129 >= 0.0) && (scalarValue130 >= 0.0)) && (scalarValue131 >= 0.0)))
                {
                    uint scalarValue137 = uint(scalarValue129);
                    uint scalarValue138 = uint(scalarValue130);
                    uint scalarValue139 = uint(scalarValue131);
                    uint scalarValue140 = min(comparisonValue114, 64u);
                    uint sumValue167 = min((comparisonValue114 + 8u), 64u);
                    uint bitwiseValue79 = bitwiseValue66 + (((scalarValue139 << 4u) + scalarValue138) + (scalarValue137 << 8u));
                    float bitwiseValue80 = rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue79] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue115 = intermediateValue5.packedValues[bitwiseValue79] != 0u;
                    uint bitwiseValue81 = (((scalarValue137 + intermediateValue11[scalarValue140].y) << 8u) + (((uint(comparisonValue114 < 2u) + scalarValue139) << 4u) + (scalarValue138 + intermediateValue11[scalarValue140].z))) + bitwiseValue66;
                    float bitwiseValue82 = rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue81] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue116 = intermediateValue5.packedValues[bitwiseValue81] != 0u;
                    uint bitwiseValue83 = (((scalarValue137 + intermediateValue11[sumValue167].y) << 8u) + ((scalarValue138 + intermediateValue11[sumValue167].z) + ((uint(comparisonValue114 < 6u) + scalarValue139) << 4u))) + bitwiseValue66;
                    float bitwiseValue84 = rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue83] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue117 = intermediateValue5.packedValues[bitwiseValue83] != 0u;
                    uint bitwiseValue85 = bitwiseValue66 + ((((scalarValue139 + 1u) << 4u) + (scalarValue138 + 1u)) + ((scalarValue137 + 1u) << 8u));
                    float bitwiseValue86 = rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue85] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue118 = intermediateValue5.packedValues[bitwiseValue85] != 0u;
                    comparisonValue46 = comparisonValue118 ? ((bitwiseValue86 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue85] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue47 = comparisonValue118 ? ((bitwiseValue86 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue85] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue48 = comparisonValue118 ? ((bitwiseValue86 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[bitwiseValue85] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue49 = comparisonValue117 ? ((bitwiseValue84 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue83] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue50 = comparisonValue117 ? ((bitwiseValue84 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue83] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue51 = comparisonValue117 ? ((bitwiseValue84 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[bitwiseValue83] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue52 = comparisonValue115 ? ((bitwiseValue80 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue79] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue53 = comparisonValue115 ? ((bitwiseValue80 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue79] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue54 = comparisonValue115 ? ((bitwiseValue80 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[bitwiseValue79] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue55 = comparisonValue116 ? ((bitwiseValue82 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue81] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue56 = comparisonValue116 ? ((bitwiseValue82 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[bitwiseValue81] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue57 = comparisonValue116 ? ((bitwiseValue82 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[bitwiseValue81] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                else
                {
                    uint scalarValue141 = min(comparisonValue114, 64u);
                    float sumValue168 = scalarValue129 + rdEvaluateFloatExpression(intermediateValue11[scalarValue141].y);
                    float sumValue169 = scalarValue130 + rdEvaluateFloatExpression(intermediateValue11[scalarValue141].z);
                    float sumValue170 = scalarValue131 + rdEvaluateFloatExpression(uint(comparisonValue114 < 2u));
                    uint sumValue171 = min((comparisonValue114 + 8u), 64u);
                    float sumValue172 = scalarValue129 + rdEvaluateFloatExpression(intermediateValue11[sumValue171].y);
                    float sumValue173 = scalarValue130 + rdEvaluateFloatExpression(intermediateValue11[sumValue171].z);
                    float sumValue174 = scalarValue131 + rdEvaluateFloatExpression(uint(comparisonValue114 < 6u));
                    float multiplyAddValue132 = fma(productValue215, 16.0, scalarValue129);
                    float multiplyAddValue133 = fma(productValue216, 16.0, scalarValue130);
                    float multiplyAddValue134 = fma(productValue217, 16.0, scalarValue131);
                    uint comparisonValue119 = min((bitfieldInsert(0u, (scalarValue131 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (scalarValue131 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (scalarValue130 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (scalarValue129 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (scalarValue129 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (scalarValue130 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))), 64u);
                    bool conditionValue16 = int(intermediateValue11[comparisonValue119].x) < int(0u);
                    uint sumValue175 = bitwiseValue66 + 4097u;
                    uint sumValue176 = bitwiseValue66 + 4096u;
                    uint multiplyAddValue135 = conditionValue16 ? (bitwiseValue66 + (bitfieldInsert(0u, uint(scalarValue129), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(scalarValue131), int(4u), int(4u)), uint(scalarValue130), int(0u), int(4u)))) : ((intermediateValue5.packedValues[intermediateValue11[comparisonValue119].x + sumValue175] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue132 * 0.0625), 16.0, multiplyAddValue132)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue134 * 0.0625), 16.0, multiplyAddValue134)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue133 * 0.0625), 16.0, multiplyAddValue133)), int(0u), int(4u))));
                    float bitwiseValue87 = rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue135] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue120 = (conditionValue16 || (((1u << (intermediateValue11[comparisonValue119].x & 31u)) & intermediateValue5.packedValues[sumValue176]) != 0u)) && (intermediateValue5.packedValues[multiplyAddValue135] != 0u);
                    float multiplyAddValue136 = fma(productValue215, 16.0, sumValue168);
                    float multiplyAddValue137 = fma(productValue216, 16.0, sumValue169);
                    float multiplyAddValue138 = fma(productValue217, 16.0, sumValue170);
                    uint comparisonValue121 = min((bitfieldInsert(0u, (sumValue170 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue170 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue169 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue168 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue168 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue169 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))), 64u);
                    bool conditionValue17 = int(intermediateValue11[comparisonValue121].x) < int(0u);
                    uint multiplyAddValue139 = conditionValue17 ? (bitwiseValue66 + (bitfieldInsert(0u, uint(sumValue168), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue170), int(4u), int(4u)), uint(sumValue169), int(0u), int(4u)))) : ((intermediateValue5.packedValues[sumValue175 + intermediateValue11[comparisonValue121].x] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue136 * 0.0625), 16.0, multiplyAddValue136)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue138 * 0.0625), 16.0, multiplyAddValue138)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue137 * 0.0625), 16.0, multiplyAddValue137)), int(0u), int(4u))));
                    float bitwiseValue88 = rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue139] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue122 = (conditionValue17 || (((1u << (intermediateValue11[comparisonValue121].x & 31u)) & intermediateValue5.packedValues[sumValue176]) != 0u)) && (intermediateValue5.packedValues[multiplyAddValue139] != 0u);
                    float multiplyAddValue140 = fma(productValue215, 16.0, sumValue172);
                    float multiplyAddValue141 = fma(productValue216, 16.0, sumValue173);
                    float multiplyAddValue142 = fma(productValue217, 16.0, sumValue174);
                    uint comparisonValue123 = min((bitfieldInsert(0u, (sumValue174 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue174 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue173 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue172 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue172 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue173 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))), 64u);
                    bool conditionValue18 = int(intermediateValue11[comparisonValue123].x) < int(0u);
                    uint multiplyAddValue143 = conditionValue18 ? (bitwiseValue66 + (bitfieldInsert(0u, uint(sumValue172), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue174), int(4u), int(4u)), uint(sumValue173), int(0u), int(4u)))) : ((intermediateValue5.packedValues[intermediateValue11[comparisonValue123].x + sumValue175] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue140 * 0.0625), 16.0, multiplyAddValue140)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue142 * 0.0625), 16.0, multiplyAddValue142)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue141 * 0.0625), 16.0, multiplyAddValue141)), int(0u), int(4u))));
                    float bitwiseValue89 = rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue143] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue124 = (conditionValue18 || (((1u << (intermediateValue11[comparisonValue123].x & 31u)) & intermediateValue5.packedValues[sumValue176]) != 0u)) && (intermediateValue5.packedValues[multiplyAddValue143] != 0u);
                    float multiplyAddValue144 = fma(productValue215, 16.0, sumValue164);
                    float multiplyAddValue145 = fma(productValue216, 16.0, sumValue165);
                    float multiplyAddValue146 = fma(productValue217, 16.0, sumValue166);
                    uint comparisonValue125 = min((bitfieldInsert(0u, (sumValue166 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue166 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue165 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue164 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue164 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue165 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))), 64u);
                    bool conditionValue19 = int(intermediateValue11[comparisonValue125].x) < int(0u);
                    uint multiplyAddValue147 = conditionValue19 ? (bitwiseValue66 + (bitfieldInsert(0u, uint(sumValue164), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue166), int(4u), int(4u)), uint(sumValue165), int(0u), int(4u)))) : ((intermediateValue5.packedValues[intermediateValue11[comparisonValue125].x + sumValue175] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue144 * 0.0625), 16.0, multiplyAddValue144)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue146 * 0.0625), 16.0, multiplyAddValue146)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue145 * 0.0625), 16.0, multiplyAddValue145)), int(0u), int(4u))));
                    float bitwiseValue90 = rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue147] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue126 = (conditionValue19 || (((1u << (intermediateValue11[comparisonValue125].x & 31u)) & intermediateValue5.packedValues[sumValue176]) != 0u)) && (intermediateValue5.packedValues[multiplyAddValue147] != 0u);
                    comparisonValue46 = comparisonValue126 ? ((bitwiseValue90 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue147] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue47 = comparisonValue126 ? ((bitwiseValue90 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue147] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue48 = comparisonValue126 ? ((bitwiseValue90 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[multiplyAddValue147] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue49 = comparisonValue124 ? ((bitwiseValue89 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue143] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue50 = comparisonValue124 ? ((bitwiseValue89 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue143] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue51 = comparisonValue124 ? ((bitwiseValue89 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[multiplyAddValue143] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue52 = comparisonValue120 ? ((bitwiseValue87 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue135] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue53 = comparisonValue120 ? ((bitwiseValue87 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue135] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue54 = comparisonValue120 ? ((bitwiseValue87 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[multiplyAddValue135] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue55 = comparisonValue122 ? ((bitwiseValue88 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue139] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue56 = comparisonValue122 ? ((bitwiseValue88 * (rdEvaluateFloatExpression((intermediateValue5.packedValues[multiplyAddValue139] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue57 = comparisonValue122 ? ((bitwiseValue88 * (rdEvaluateFloatExpression(intermediateValue5.packedValues[multiplyAddValue139] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                multiplyAddValue10 = fma(comparisonValue48, scalarValue134, fma(comparisonValue51, sumValue163, fma(comparisonValue54, sumValue161, sumValue162 * comparisonValue57)));
                multiplyAddValue11 = fma(comparisonValue47, scalarValue134, fma(comparisonValue50, sumValue163, fma(comparisonValue53, sumValue161, sumValue162 * comparisonValue56)));
                multiplyAddValue12 = fma(comparisonValue46, scalarValue134, fma(comparisonValue49, sumValue163, fma(comparisonValue52, sumValue161, sumValue162 * comparisonValue55)));
            }
            intermediateValue36 = multiplyAddValue10;
            intermediateValue34 = multiplyAddValue11;
            intermediateValue32 = multiplyAddValue12;
        }
        else
        {
            intermediateValue36 = 0.0;
            intermediateValue34 = 0.0;
            intermediateValue32 = 0.0;
        }
        intermediateValue31 = intermediateValue32;
        intermediateValue33 = intermediateValue34;
        intermediateValue35 = intermediateValue36;
    }
    else
    {
        float bitwiseValue91 = rdEvaluateFloatExpression(scalarValue114 & 255u) * 0.0039215688593685626983642578125;
        intermediateValue31 = (bitwiseValue91 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue114, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * 6.0;
        intermediateValue33 = (bitwiseValue91 * (rdEvaluateFloatExpression(scalarValue113 & 255u) * 0.0039215688593685626983642578125)) * 6.0;
        intermediateValue35 = (bitwiseValue91 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue113, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * 6.0;
    }
    float productValue222 = 1.0 - spvNClamp((sampledTextureValue71.w - 0.501960813999176025390625) * 2.007874011993408203125, 0.0, 1.0);
    float productValue223 = bitwiseValue58 * bitwiseValue58;
    float productValue224 = bitwiseValue58 * (productValue223 * productValue223);
    float multiplyAddValue148 = fma(fragmentScalarConstants1.packedValues[45u], fma(productValue223, bitwiseValue58, -productValue224), productValue224);
    fragmentColor1.x = (productValue222 * spvNMax(fma(intermediateValue35, fragmentScalarConstants1.packedValues[35u], (multiplyAddValue148 * fragmentVectorConstants1.packedValues[16u].x) * fragmentScalarConstants1.packedValues[67u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].x)) * fragmentScalarConstants1.packedValues[55u];
    fragmentColor1.y = (productValue222 * spvNMax(fma(intermediateValue33, fragmentScalarConstants1.packedValues[35u], (multiplyAddValue148 * fragmentVectorConstants1.packedValues[16u].y) * fragmentScalarConstants1.packedValues[67u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].y)) * fragmentScalarConstants1.packedValues[55u];
    fragmentColor1.z = (productValue222 * spvNMax(fma(intermediateValue31, fragmentScalarConstants1.packedValues[35u], (multiplyAddValue148 * fragmentVectorConstants1.packedValues[16u].z) * fragmentScalarConstants1.packedValues[67u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].z)) * fragmentScalarConstants1.packedValues[55u];
    fragmentColor0.x = fma(scalarValue110, 0.5, 0.5);
    fragmentColor0.y = fma(scalarValue111, 0.5, 0.5);
    float productValue225 = floor(scalarValue112 * 65535.0);
    fragmentColor0.z = productValue225 * 1.525902189314365386962890625e-05;
    fragmentColor0.w = fma(scalarValue112, 65535.0, -productValue225);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue321 = floor(varyingTexCoord0.y * fragmentVectorConstants1.packedValues[40u].y) + 0.5;
    float productValue322 = (floor(varyingTexCoord0.x * fragmentVectorConstants1.packedValues[40u].x) + 0.5) * fragmentVectorConstants1.packedValues[40u].z;
    float productValue323 = productValue321 * fragmentVectorConstants1.packedValues[40u].w;
    float multiplyAddValue172 = fma(productValue322, 2.0, -1.0);
    float multiplyAddValue173 = fma(fma(-productValue321, fragmentScalarConstants1.packedValues[163u], 1.0), 2.0, -1.0);
    vec4 sampledTextureValue104 = texture(sampler2D(materialTexture3, textureSampler3), vec2(productValue322, productValue323));
    float scalarValue194 = sampledTextureValue104.x;
    float scalarValue195 = sampledTextureValue104.y;
    vec4 sampledTextureValue105 = texture(sampler2D(materialTexture6, textureSampler6), vec2(productValue322, productValue323));
    float scalarValue196 = sampledTextureValue105.x;
    float multiplyAddValue174 = fma(scalarValue196, fragmentScalarConstants1.packedValues[63u], fragmentScalarConstants1.packedValues[67u]);
    float quotientValue65 = (multiplyAddValue172 * fragmentScalarConstants1.packedValues[52u]) / multiplyAddValue174;
    float quotientValue66 = (multiplyAddValue173 * fragmentScalarConstants1.packedValues[57u]) / multiplyAddValue174;
    float quotientValue67 = fragmentScalarConstants1.packedValues[66u] / multiplyAddValue174;
    float multiplyAddValue175 = fma(fragmentVectorConstants1.packedValues[11u].x, quotientValue67, fma(fragmentVectorConstants1.packedValues[9u].x, quotientValue65, quotientValue66 * fragmentVectorConstants1.packedValues[10u].x)) + fragmentVectorConstants1.packedValues[12u].x;
    float multiplyAddValue176 = fma(fragmentVectorConstants1.packedValues[11u].y, quotientValue67, fma(fragmentVectorConstants1.packedValues[9u].y, quotientValue65, quotientValue66 * fragmentVectorConstants1.packedValues[10u].y)) + fragmentVectorConstants1.packedValues[12u].y;
    float multiplyAddValue177 = fma(fragmentVectorConstants1.packedValues[11u].z, quotientValue67, fma(fragmentVectorConstants1.packedValues[9u].z, quotientValue65, quotientValue66 * fragmentVectorConstants1.packedValues[10u].z)) + fragmentVectorConstants1.packedValues[12u].z;
    float scalarValue197 = abs(scalarValue195);
    float sumValue225 = 1.0 - abs(scalarValue194);
    float sumValue226 = sumValue225 - scalarValue197;
    bool conditionValue21 = sumValue226 < 0.0;
    float comparisonValue145 = conditionValue21 ? (((scalarValue195 >= 0.0) ? 1.0 : (-1.0)) * sumValue225) : scalarValue195;
    float comparisonValue146 = conditionValue21 ? (((scalarValue194 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue197)) : scalarValue194;
    vec3 vectorValue17 = vec3(comparisonValue145, sumValue226, comparisonValue146);
    float inverseLengthValue37 = inversesqrt(rdDot3Precise2(vectorValue17, vectorValue17));
    float productValue324 = inverseLengthValue37 * comparisonValue145;
    float productValue325 = inverseLengthValue37 * sumValue226;
    float productValue326 = inverseLengthValue37 * comparisonValue146;
    vec4 sampledTextureValue106 = texture(sampler2D(materialTexture1, textureSampler1), vec2(productValue322, productValue323));
    float scalarValue198 = sampledTextureValue106.x;
    float scalarValue199 = sampledTextureValue106.y;
    float scalarValue200 = sampledTextureValue106.z;
    float scalarValue201 = sampledTextureValue106.w;
    float productValue327 = spvNClamp((scalarValue201 - 0.501960813999176025390625) * 2.007874011993408203125, 0.0, 1.0);
    bool sampledTextureValue10 = uint(textureQueryLevels(intermediateValue1)) > 0u;
    uvec2 sampledTextureValue11 = uvec2(textureSize(intermediateValue1, int(0u)));
    uint scalarValue10 = sampledTextureValue11.x;
    uvec4 sampledTextureValue107 = texelFetch(intermediateValue1, ivec2(uvec2(uint(int(productValue322 * rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue10 : 0u))), uint(int(productValue323 * rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u))))), int(0u));
    uint scalarValue202 = sampledTextureValue107.y;
    uint scalarValue203 = sampledTextureValue107.z;
    uint scalarValue204 = sampledTextureValue107.w;
    float bitwiseValue121 = rdEvaluateFloatExpression(scalarValue204 & 255u) * 0.0039215688593685626983642578125;
    uint scalarValue205 = bitfieldExtract(scalarValue204, int(8u), int(8u));
    float sumValue227 = 1.0 - productValue327;
    float quotientValue68 = ((multiplyAddValue172 + fragmentScalarConstants1.packedValues[168u]) * fragmentScalarConstants1.packedValues[52u]) / multiplyAddValue174;
    float quotientValue69 = ((multiplyAddValue173 - fragmentScalarConstants1.packedValues[169u]) * fragmentScalarConstants1.packedValues[57u]) / multiplyAddValue174;
    float scalarValue206 = -quotientValue67;
    float scalarValue207 = dFdyCoarse(-quotientValue68);
    float scalarValue208 = dFdxCoarse(quotientValue68);
    float scalarValue209 = dFdxCoarse(quotientValue69);
    float scalarValue210 = dFdyCoarse(scalarValue206);
    float scalarValue211 = dFdyCoarse(-quotientValue69);
    float scalarValue212 = dFdxCoarse(quotientValue67);
    float intermediateValue42;
    float intermediateValue43;
    float intermediateValue44;
    float intermediateValue45;
    float intermediateValue46;
    float intermediateValue47;
    if (scalarValue196 != 1.0)
    {
        bool comparisonValue147 = fragmentScalarConstants1.packedValues[94u] != 0.0;
        float productValue8;
        float productValue9;
        float productValue10;
        float productValue11;
        float productValue12;
        float productValue13;
        if (comparisonValue147)
        {
            float productValue328 = scalarValue206 * fragmentScalarConstants1.packedValues[102u];
            bool conditionValue22 = scalarValue206 < fragmentVectorConstants1.packedValues[25u].x;
            bool conditionValue23 = scalarValue206 < fragmentVectorConstants1.packedValues[25u].y;
            float nonlinearValue7 = spvNMin(fragmentVectorConstants1.packedValues[28u].z - 1.0, floor(spvNClamp((log2(scalarValue206) - fragmentScalarConstants1.packedValues[130u]) * fragmentScalarConstants1.packedValues[128u], 0.0, 1.0) * (fragmentVectorConstants1.packedValues[28u].z - 2.0)) + 2.0);
            float comparisonValue148 = conditionValue23 ? 1.0 : nonlinearValue7;
            float multiplyAddValue178 = spvNMin(fragmentVectorConstants1.packedValues[28u].y - 1.0, floor(spvNClamp(fma(scalarValue206, fragmentScalarConstants1.packedValues[102u], quotientValue66) / (productValue328 + productValue328), 0.0, 1.0) * fragmentVectorConstants1.packedValues[28u].y));
            float multiplyAddValue179 = spvNMin(fragmentVectorConstants1.packedValues[28u].x - 1.0, floor(spvNClamp(fma(productValue328, fragmentScalarConstants1.packedValues[103u], quotientValue65) / fma(productValue328, fragmentScalarConstants1.packedValues[103u], productValue328 * fragmentScalarConstants1.packedValues[103u]), 0.0, 1.0) * fragmentVectorConstants1.packedValues[28u].x));
            float intermediateValue70;
            float intermediateValue72;
            float intermediateValue74;
            float intermediateValue76;
            float intermediateValue78;
            float intermediateValue80;
            if (!(((conditionValue22 ? 0.0 : comparisonValue148) >= fragmentScalarConstants1.packedValues[114u]) || ((multiplyAddValue178 >= fragmentScalarConstants1.packedValues[113u]) || ((multiplyAddValue179 >= fragmentScalarConstants1.packedValues[112u]) || (((multiplyAddValue179 < 0.0) || (multiplyAddValue178 < 0.0)) || (((nonlinearValue7 < 0.0) && (!conditionValue23)) && (!conditionValue22)))))))
            {
                float multiplyAddValue180 = (fma(fragmentVectorConstants1.packedValues[11u].x, quotientValue67, fma(fragmentVectorConstants1.packedValues[9u].x, quotientValue68, quotientValue69 * fragmentVectorConstants1.packedValues[10u].x)) + fragmentVectorConstants1.packedValues[12u].x) - fragmentVectorConstants1.packedValues[27u].x;
                float multiplyAddValue181 = (fma(fragmentVectorConstants1.packedValues[11u].y, quotientValue67, fma(fragmentVectorConstants1.packedValues[9u].y, quotientValue68, quotientValue69 * fragmentVectorConstants1.packedValues[10u].y)) + fragmentVectorConstants1.packedValues[12u].y) - fragmentVectorConstants1.packedValues[27u].y;
                float multiplyAddValue182 = (fma(fragmentVectorConstants1.packedValues[11u].z, quotientValue67, fma(fragmentVectorConstants1.packedValues[9u].z, quotientValue68, quotientValue69 * fragmentVectorConstants1.packedValues[10u].z)) + fragmentVectorConstants1.packedValues[12u].z) - fragmentVectorConstants1.packedValues[27u].z;
                vec3 vectorValue18 = vec3(scalarValue212, scalarValue208, scalarValue209);
                float inverseLengthValue38 = inversesqrt(rdDot3Precise2(vectorValue18, vectorValue18));
                float productValue329 = inverseLengthValue38 * scalarValue212;
                float productValue330 = inverseLengthValue38 * scalarValue208;
                float productValue331 = inverseLengthValue38 * scalarValue209;
                vec3 vectorValue19 = vec3(scalarValue211, scalarValue210, scalarValue207);
                float inverseLengthValue39 = inversesqrt(rdDot3Precise2(vectorValue19, vectorValue19));
                float productValue332 = inverseLengthValue39 * scalarValue211;
                float productValue333 = inverseLengthValue39 * scalarValue210;
                float productValue334 = inverseLengthValue39 * scalarValue207;
                float multiplyAddValue183 = fma(productValue331, productValue333, -(productValue332 * productValue329));
                float multiplyAddValue184 = fma(productValue329, productValue334, -(productValue333 * productValue330));
                float multiplyAddValue185 = fma(productValue330, productValue332, -(productValue334 * productValue331));
                vec3 vectorValue20 = vec3(multiplyAddValue183, multiplyAddValue184, multiplyAddValue185);
                float inverseLengthValue40 = inversesqrt(rdDot3Precise2(vectorValue20, vectorValue20));
                float productValue335 = inverseLengthValue40 * multiplyAddValue183;
                float productValue336 = inverseLengthValue40 * multiplyAddValue184;
                float productValue337 = inverseLengthValue40 * multiplyAddValue185;
                float multiplyAddValue186 = fma(fragmentVectorConstants1.packedValues[11u].x, productValue337, fma(fragmentVectorConstants1.packedValues[9u].x, productValue335, productValue336 * fragmentVectorConstants1.packedValues[10u].x));
                float multiplyAddValue187 = fma(fragmentVectorConstants1.packedValues[11u].y, productValue337, fma(fragmentVectorConstants1.packedValues[9u].y, productValue335, productValue336 * fragmentVectorConstants1.packedValues[10u].y));
                float multiplyAddValue188 = fma(fragmentVectorConstants1.packedValues[11u].z, productValue337, fma(fragmentVectorConstants1.packedValues[9u].z, productValue335, productValue336 * fragmentVectorConstants1.packedValues[10u].z));
                vec3 vectorValue21 = vec3(multiplyAddValue186, multiplyAddValue187, multiplyAddValue188);
                float inverseLengthValue41 = inversesqrt(rdDot3Precise2(vectorValue21, vectorValue21));
                float quotientValue70 = roundEven((inverseLengthValue41 * multiplyAddValue186) / fragmentScalarConstants1.packedValues[156u]) * fragmentScalarConstants1.packedValues[156u];
                float quotientValue71 = roundEven((inverseLengthValue41 * multiplyAddValue187) / fragmentScalarConstants1.packedValues[156u]) * fragmentScalarConstants1.packedValues[156u];
                float quotientValue72 = roundEven((inverseLengthValue41 * multiplyAddValue188) / fragmentScalarConstants1.packedValues[156u]) * fragmentScalarConstants1.packedValues[156u];
                vec3 vectorValue22 = vec3(quotientValue70, quotientValue71, quotientValue72);
                float inverseLengthValue42 = inversesqrt(rdDot3Precise2(vectorValue22, vectorValue22));
                float productValue338 = inverseLengthValue42 * quotientValue70;
                float productValue339 = inverseLengthValue42 * quotientValue71;
                float productValue340 = inverseLengthValue42 * quotientValue72;
                float scalarValue20 = -fragmentScalarConstants1.packedValues[74u];
                float multiplyAddValue189 = fma(fragmentScalarConstants1.packedValues[74u], 0.5, -fma(scalarValue20, floor(multiplyAddValue180 / fragmentScalarConstants1.packedValues[74u]), multiplyAddValue180));
                float multiplyAddValue190 = fma(fragmentScalarConstants1.packedValues[74u], 0.5, -fma(scalarValue20, floor(multiplyAddValue181 / fragmentScalarConstants1.packedValues[74u]), multiplyAddValue181));
                float multiplyAddValue191 = fma(fragmentScalarConstants1.packedValues[74u], 0.5, -fma(scalarValue20, floor(multiplyAddValue182 / fragmentScalarConstants1.packedValues[74u]), multiplyAddValue182));
                float scalarValue213 = -rdDot3Precise2(vec3(multiplyAddValue189, multiplyAddValue190, multiplyAddValue191), vec3(productValue338, productValue339, productValue340));
                float multiplyAddValue192 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue325, fma(fragmentVectorConstants1.packedValues[4u].x, productValue326, productValue324 * fragmentVectorConstants1.packedValues[5u].x));
                float multiplyAddValue193 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue325, fma(fragmentVectorConstants1.packedValues[4u].y, productValue326, productValue324 * fragmentVectorConstants1.packedValues[5u].y));
                float multiplyAddValue194 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue325, fma(fragmentVectorConstants1.packedValues[4u].z, productValue326, productValue324 * fragmentVectorConstants1.packedValues[5u].z));
                vec3 vectorValue23 = vec3(multiplyAddValue192, multiplyAddValue193, multiplyAddValue194);
                float inverseLengthValue43 = inversesqrt(rdDot3Precise2(vectorValue23, vectorValue23));
                float productValue341 = inverseLengthValue43 * multiplyAddValue192;
                float productValue342 = inverseLengthValue43 * multiplyAddValue193;
                float productValue343 = inverseLengthValue43 * multiplyAddValue194;
                bool comparisonValue149 = fragmentScalarConstants1.packedValues[116u] != 0.0;
                float productValue344 = sumValue227 * 0.039999999105930328369140625;
                float productValue345 = sumValue227 * 0.3183098733425140380859375;
                float multiplyAddValue195 = fma(comparisonValue149 ? exp2(log2(spvNMax(scalarValue198, 0.0)) * 2.2000000476837158203125) : ((scalarValue198 <= 0.040449999272823333740234375) ? (scalarValue198 * 0.077399380505084991455078125) : exp2(log2((scalarValue198 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), productValue327, productValue344);
                float multiplyAddValue196 = fma(comparisonValue149 ? exp2(log2(spvNMax(scalarValue199, 0.0)) * 2.2000000476837158203125) : ((scalarValue199 <= 0.040449999272823333740234375) ? (scalarValue199 * 0.077399380505084991455078125) : exp2(log2((scalarValue199 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), productValue327, productValue344);
                float multiplyAddValue197 = fma(comparisonValue149 ? exp2(log2(spvNMax(scalarValue200, 0.0)) * 2.2000000476837158203125) : ((scalarValue200 <= 0.040449999272823333740234375) ? (scalarValue200 * 0.077399380505084991455078125) : exp2(log2((scalarValue200 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), productValue327, productValue344);
                vec3 vectorValue24 = vec3(quotientValue65, quotientValue66, quotientValue67);
                float nonlinearValue8 = sqrt(rdDot3Precise2(vectorValue24, vectorValue24)) + 9.9999997473787516355514526367188e-05;
                float productValue346 = spvNClamp((0.4980392158031463623046875 - scalarValue201) * 2.007874011993408203125, 0.0, 1.0) * fragmentScalarConstants1.packedValues[172u];
                bool conditionValue3 = int(uint(int(fragmentScalarConstants1.packedValues[73u]))) > int(0u);
                float multiplyAddValue198 = conditionValue3 ? ((fma(scalarValue213, productValue338, multiplyAddValue189) + multiplyAddValue180) + fragmentVectorConstants1.packedValues[27u].x) : multiplyAddValue175;
                float multiplyAddValue199 = conditionValue3 ? ((fma(scalarValue213, productValue339, multiplyAddValue190) + multiplyAddValue181) + fragmentVectorConstants1.packedValues[27u].y) : multiplyAddValue176;
                float multiplyAddValue200 = conditionValue3 ? ((fma(scalarValue213, productValue340, multiplyAddValue191) + multiplyAddValue182) + fragmentVectorConstants1.packedValues[27u].z) : multiplyAddValue177;
                float multiplyAddValue201 = fma(multiplyAddValue178, fragmentScalarConstants1.packedValues[112u], multiplyAddValue179);
                uint scalarValue214 = uint(int(fragmentScalarConstants1.packedValues[115u]));
                uint multiplyAddValue202 = uint(int(conditionValue22 ? multiplyAddValue201 : fma(fragmentScalarConstants1.packedValues[113u], fragmentScalarConstants1.packedValues[112u] * comparisonValue148, multiplyAddValue201))) * scalarValue214;
                uint sumValue228 = multiplyAddValue202 + scalarValue214;
                vec3 vectorValue25 = vec3(productValue341, productValue342, productValue343);
                float quotientValue73 = -(quotientValue65 / nonlinearValue8);
                float quotientValue74 = -(quotientValue66 / nonlinearValue8);
                float quotientValue75 = -(quotientValue67 / nonlinearValue8);
                vec3 vectorValue26 = vec3(quotientValue73, quotientValue74, quotientValue75);
                float scalarValue215 = spvNMax(rdDot3Precise2(vectorValue25, vectorValue26), 0.0);
                float sumValue229 = fragmentScalarConstants1.packedValues[173u] + 1.0;
                float productValue347 = sumValue229 * sumValue229;
                float productValue348 = spvNMax(rdEvaluateFloatExpression(bitfieldExtract(sampledTextureValue107.x, int(8u), int(8u))) * 0.0039215688593685626983642578125, 0.0500000007450580596923828125);
                float productValue349 = productValue348 * productValue348;
                float productValue350 = productValue349 * productValue349;
                float multiplyAddValue203 = fma(productValue349, productValue349, -1.0);
                float productValue351 = productValue349 * 0.5;
                float multiplyAddValue204 = fma(-productValue349, 0.5, 1.0);
                float multiplyAddValue205 = scalarValue215 / (fma(scalarValue215, multiplyAddValue204, productValue351) + 9.9999997473787516355514526367188e-05);
                float sumValue230 = 1.0 - multiplyAddValue195;
                float sumValue231 = 1.0 - multiplyAddValue196;
                float sumValue232 = 1.0 - multiplyAddValue197;
                bool conditionValue4 = fragmentScalarConstants1.packedValues[84u] > 0.0;
                bool conditionValue5 = fragmentScalarConstants1.packedValues[80u] > 0.0;
                float scalarValue216 = -fragmentScalarConstants1.packedValues[132u];
                float quotientValue11 = 0.5 / fragmentVectorConstants1.packedValues[17u].x;
                float quotientValue12 = 0.5 / fragmentVectorConstants1.packedValues[17u].y;
                bool conditionValue24 = productValue346 > 0.0;
                float quotientValue76 = 1.0 / (fragmentScalarConstants1.packedValues[133u] - fragmentScalarConstants1.packedValues[132u]);
                float intermediateValue71;
                float intermediateValue73;
                float intermediateValue75;
                float intermediateValue77;
                float intermediateValue79;
                float intermediateValue81;
                intermediateValue81 = 0.0;
                intermediateValue79 = 0.0;
                intermediateValue77 = 0.0;
                intermediateValue75 = 0.0;
                intermediateValue73 = 0.0;
                intermediateValue71 = 0.0;
                float multiplyAddValue38;
                float multiplyAddValue39;
                float multiplyAddValue40;
                float multiplyAddValue41;
                float multiplyAddValue42;
                float multiplyAddValue43;
                uint sumValue11;
                uint scalarValue217 = multiplyAddValue202;
                for (;;)
                {
                    if (int(sumValue228) <= int(scalarValue217))
                    {
                        break;
                    }
                    uint reinterpretedBits19 = uint(int(uintBitsToFloat(intermediateValue7.packedValues[scalarValue217])));
                    if (int(reinterpretedBits19) < int(0u))
                    {
                        break;
                    }
                    uint productValue352 = reinterpretedBits19 * 32u;
                    vec3 reinterpretedBits20 = uintBitsToFloat(uvec3(intermediateValue8.packedValues[productValue352], intermediateValue8.packedValues[productValue352 + 1u], intermediateValue8.packedValues[productValue352 + 2u]));
                    float scalarValue218 = reinterpretedBits20.x;
                    float scalarValue219 = reinterpretedBits20.y;
                    float scalarValue220 = reinterpretedBits20.z;
                    float multiplyAddValue206 = (fma(fragmentVectorConstants1.packedValues[6u].x, scalarValue220, fma(fragmentVectorConstants1.packedValues[4u].x, scalarValue218, scalarValue219 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) - quotientValue65;
                    float multiplyAddValue207 = (fma(fragmentVectorConstants1.packedValues[6u].y, scalarValue220, fma(fragmentVectorConstants1.packedValues[4u].y, scalarValue218, scalarValue219 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) - quotientValue66;
                    float multiplyAddValue208 = (fma(fragmentVectorConstants1.packedValues[6u].z, scalarValue220, fma(fragmentVectorConstants1.packedValues[4u].z, scalarValue218, scalarValue219 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) - quotientValue67;
                    vec3 vectorValue27 = vec3(multiplyAddValue206, multiplyAddValue207, multiplyAddValue208);
                    float inverseLengthValue44 = inversesqrt(rdDot3Precise2(vectorValue27, vectorValue27));
                    vec3 productValue353 = vec3(inverseLengthValue44 * multiplyAddValue206, inverseLengthValue44 * multiplyAddValue207, inverseLengthValue44 * multiplyAddValue208);
                    float scalarValue221 = rdDot3Precise2(vectorValue25, productValue353);
                    float scalarValue222 = spvNMax(scalarValue221, 0.0);
                    float multiplyAddValue209 = fma(productValue346, spvNMax((scalarValue221 + fragmentScalarConstants1.packedValues[173u]) / productValue347, 0.0) - scalarValue222, scalarValue222);
                    float multiplyAddValue210 = fma(multiplyAddValue206, inverseLengthValue44, quotientValue73);
                    float multiplyAddValue211 = fma(multiplyAddValue207, inverseLengthValue44, quotientValue74);
                    float multiplyAddValue212 = fma(multiplyAddValue208, inverseLengthValue44, quotientValue75);
                    vec3 vectorValue28 = vec3(multiplyAddValue210, multiplyAddValue211, multiplyAddValue212);
                    float inverseLengthValue45 = inversesqrt(rdDot3Precise2(vectorValue28, vectorValue28));
                    vec3 productValue354 = vec3(inverseLengthValue45 * multiplyAddValue210, inverseLengthValue45 * multiplyAddValue211, inverseLengthValue45 * multiplyAddValue212);
                    float scalarValue223 = spvNMax(rdDot3Precise2(vectorValue25, productValue354), 0.0);
                    float multiplyAddValue213 = fma(scalarValue223 * scalarValue223, multiplyAddValue203, 1.0);
                    float quotientValue77 = productValue350 / ((multiplyAddValue213 * multiplyAddValue213) * 3.1415927410125732421875);
                    float multiplyAddValue214 = multiplyAddValue205 * (scalarValue222 / (fma(scalarValue222, multiplyAddValue204, productValue351) + 9.9999997473787516355514526367188e-05));
                    float sumValue233 = spvNMax(1.0 - spvNMax(rdDot3Precise2(vectorValue26, productValue354), 0.0), 0.0);
                    float productValue355 = sumValue233 * sumValue233;
                    float productValue356 = sumValue233 * (productValue355 * productValue355);
                    float multiplyAddValue215 = fma(sumValue230, productValue356, multiplyAddValue195);
                    float multiplyAddValue216 = fma(sumValue231, productValue356, multiplyAddValue196);
                    float multiplyAddValue217 = fma(sumValue232, productValue356, multiplyAddValue197);
                    float multiplyAddValue218 = fma(scalarValue215 * scalarValue222, 4.0, 9.9999997473787516355514526367188e-05);
                    float intermediateValue108;
                    float intermediateValue109;
                    float intermediateValue110;
                    bool intermediateValue111;
                    float intermediateValue113;
                    if (int(reinterpretedBits19) >= int(0u))
                    {
                        vec4 reinterpretedBits21 = uintBitsToFloat(intermediateValue9.packedValues[reinterpretedBits19 * 8u]);
                        float scalarValue224 = reinterpretedBits21.w;
                        float sumValue234 = reinterpretedBits21.x - multiplyAddValue175;
                        float sumValue235 = reinterpretedBits21.y - multiplyAddValue176;
                        float sumValue236 = reinterpretedBits21.z - multiplyAddValue177;
                        float sumValue237 = abs(sumValue236) + (abs(sumValue235) + abs(sumValue234));
                        vec3 vectorValue29 = vec3(sumValue234, sumValue235, sumValue236);
                        float comparisonValue150 = conditionValue4 ? (sumValue237 * sumValue237) : rdDot3Precise2(vectorValue29, vectorValue29);
                        float productValue55;
                        float productValue56;
                        float productValue57;
                        bool intermediateValue112;
                        float intermediateValue114;
                        if (comparisonValue150 < (scalarValue224 * scalarValue224))
                        {
                            float intermediateValue129;
                            bool intermediateValue130;
                            if (comparisonValue147)
                            {
                                vec4 reinterpretedBits22 = uintBitsToFloat(intermediateValue9.packedValues[(reinterpretedBits19 * 8u) + 2u]);
                                vec4 reinterpretedBits23 = uintBitsToFloat(intermediateValue9.packedValues[(reinterpretedBits19 * 8u) + 3u]);
                                vec4 reinterpretedBits24 = uintBitsToFloat(intermediateValue9.packedValues[(reinterpretedBits19 * 8u) + 4u]);
                                vec4 reinterpretedBits25 = uintBitsToFloat(intermediateValue9.packedValues[(reinterpretedBits19 * 8u) + 5u]);
                                vec4 reinterpretedBits26 = uintBitsToFloat(intermediateValue9.packedValues[(reinterpretedBits19 * 8u) + 6u]);
                                vec4 reinterpretedBits27 = uintBitsToFloat(intermediateValue9.packedValues[(reinterpretedBits19 * 8u) + 7u]);
                                float sumValue238 = multiplyAddValue198 - scalarValue218;
                                float sumValue239 = multiplyAddValue199 - scalarValue219;
                                float sumValue240 = multiplyAddValue200 - scalarValue220;
                                float scalarValue225 = abs(sumValue238);
                                float scalarValue226 = abs(sumValue239);
                                float scalarValue227 = abs(sumValue240);
                                bool comparisonValue151 = scalarValue226 >= scalarValue227;
                                bool comparisonValue152 = (scalarValue225 >= scalarValue226) && (scalarValue225 >= scalarValue227);
                                bool comparisonValue153 = sumValue239 >= 0.0;
                                bool comparisonValue154 = sumValue240 >= 0.0;
                                bool conditionValue25 = !comparisonValue152;
                                bool comparisonValue155 = (!(sumValue238 >= 0.0)) && comparisonValue152;
                                bool bitwiseValue122 = conditionValue25 && (comparisonValue151 && comparisonValue153);
                                bool bitwiseValue123 = conditionValue25 && ((!comparisonValue153) && comparisonValue151);
                                bool bitwiseValue124 = ((!comparisonValue151) && comparisonValue154) && conditionValue25;
                                bool bitwiseValue125 = comparisonValue152 || (comparisonValue151 || comparisonValue154);
                                float comparisonValue156 = comparisonValue155 ? reinterpretedBits23.x : (bitwiseValue122 ? reinterpretedBits24.x : (bitwiseValue123 ? reinterpretedBits25.x : (bitwiseValue124 ? reinterpretedBits26.x : (bitwiseValue125 ? reinterpretedBits22.x : reinterpretedBits27.x))));
                                float comparisonValue157 = comparisonValue155 ? reinterpretedBits23.y : (bitwiseValue122 ? reinterpretedBits24.y : (bitwiseValue123 ? reinterpretedBits25.y : (bitwiseValue124 ? reinterpretedBits26.y : (bitwiseValue125 ? reinterpretedBits22.y : reinterpretedBits27.y))));
                                float comparisonValue158 = comparisonValue155 ? reinterpretedBits23.z : (bitwiseValue122 ? reinterpretedBits24.z : (bitwiseValue123 ? reinterpretedBits25.z : (bitwiseValue124 ? reinterpretedBits26.z : (bitwiseValue125 ? reinterpretedBits22.z : reinterpretedBits27.z))));
                                float comparisonValue159 = comparisonValue155 ? reinterpretedBits23.w : (bitwiseValue122 ? reinterpretedBits24.w : (bitwiseValue123 ? reinterpretedBits25.w : (bitwiseValue124 ? reinterpretedBits26.w : (bitwiseValue125 ? reinterpretedBits22.w : reinterpretedBits27.w))));
                                float multiplyAddValue99;
                                bool multiplyAddValue100;
                                if (!((comparisonValue158 == 0.0) && (comparisonValue159 == 0.0)))
                                {
                                    float scalarValue228 = scalarValue218 - multiplyAddValue198;
                                    float sumValue241 = scalarValue220 - multiplyAddValue200;
                                    float sumValue242 = scalarValue219 - multiplyAddValue199;
                                    float comparisonValue160 = comparisonValue155 ? sumValue241 : (((bitwiseValue124 || bitwiseValue123) || bitwiseValue122) ? scalarValue228 : (bitwiseValue125 ? sumValue240 : sumValue238));
                                    float comparisonValue161 = comparisonValue155 ? sumValue239 : (bitwiseValue122 ? sumValue241 : (bitwiseValue123 ? sumValue240 : sumValue239));
                                    float comparisonValue162 = comparisonValue155 ? sumValue238 : (bitwiseValue122 ? sumValue242 : (bitwiseValue123 ? sumValue239 : (bitwiseValue124 ? sumValue241 : (bitwiseValue125 ? scalarValue228 : sumValue240))));
                                    float multiplyAddValue219 = fma(fragmentVectorConstants1.packedValues[2u].w, comparisonValue162, fma(fragmentVectorConstants1.packedValues[0u].w, comparisonValue160, comparisonValue161 * fragmentVectorConstants1.packedValues[1u].w)) + fragmentVectorConstants1.packedValues[3u].w;
                                    vec3 vectorValue30 = vec3(scalarValue228, sumValue242, sumValue241);
                                    float inverseLengthValue46 = inversesqrt(rdDot3Precise2(vectorValue30, vectorValue30));
                                    float productValue357 = spvNMin(spvNMax(rdDot3Precise2(vec3(inverseLengthValue46 * sumValue242, inverseLengthValue46 * sumValue241, inverseLengthValue46 * scalarValue228), vec3(productValue324, productValue325, productValue326)), fragmentScalarConstants1.packedValues[152u]), 1.0);
                                    float sumValue243 = comparisonValue158 - comparisonValue156;
                                    float sumValue244 = comparisonValue159 - comparisonValue157;
                                    float productValue358 = sumValue243 * fragmentVectorConstants1.packedValues[17u].x;
                                    float productValue359 = sumValue244 * fragmentVectorConstants1.packedValues[17u].y;
                                    float multiplyAddValue220 = (fma(fragmentVectorConstants1.packedValues[2u].x, comparisonValue162, fma(fragmentVectorConstants1.packedValues[0u].x, comparisonValue160, comparisonValue161 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue219;
                                    float multiplyAddValue221 = (fma(fragmentVectorConstants1.packedValues[2u].y, comparisonValue162, fma(fragmentVectorConstants1.packedValues[0u].y, comparisonValue160, comparisonValue161 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue219;
                                    vec4 sampledTextureValue108 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(spvNMin(comparisonValue158 - quotientValue11, spvNMax(quotientValue11 + comparisonValue156, fma((floor(productValue358 * fma(multiplyAddValue220, 0.5, 0.5)) + 0.5) / productValue358, sumValue243, comparisonValue156))), spvNMin(comparisonValue159 - quotientValue12, spvNMax(quotientValue12 + comparisonValue157, fma((floor(productValue359 * (1.0 - fma(multiplyAddValue221, 0.5, 0.5))) + 0.5) / productValue359, sumValue244, comparisonValue157)))), 0.0);
                                    float scalarValue229 = sampledTextureValue108.x;
                                    float multiplyAddValue222 = fma(fragmentVectorConstants1.packedValues[36u].w, scalarValue229, fma(fragmentVectorConstants1.packedValues[34u].w, multiplyAddValue220, multiplyAddValue221 * fragmentVectorConstants1.packedValues[35u].w)) + fragmentVectorConstants1.packedValues[37u].w;
                                    vec3 vectorValue31 = vec3(comparisonValue160, comparisonValue161, comparisonValue162);
                                    vec3 multiplyAddValue223 = vec3((fma(fragmentVectorConstants1.packedValues[36u].x, scalarValue229, fma(fragmentVectorConstants1.packedValues[34u].x, multiplyAddValue220, multiplyAddValue221 * fragmentVectorConstants1.packedValues[35u].x)) + fragmentVectorConstants1.packedValues[37u].x) / multiplyAddValue222, (fma(fragmentVectorConstants1.packedValues[36u].y, scalarValue229, fma(fragmentVectorConstants1.packedValues[34u].y, multiplyAddValue220, multiplyAddValue221 * fragmentVectorConstants1.packedValues[35u].y)) + fragmentVectorConstants1.packedValues[37u].y) / multiplyAddValue222, (fma(fragmentVectorConstants1.packedValues[36u].z, scalarValue229, fma(fragmentVectorConstants1.packedValues[34u].z, multiplyAddValue220, multiplyAddValue221 * fragmentVectorConstants1.packedValues[35u].z)) + fragmentVectorConstants1.packedValues[37u].z) / multiplyAddValue222);
                                    float nonlinearValue9 = spvNClamp((sqrt(rdDot3Precise2(vectorValue31, vectorValue31)) - sqrt(rdDot3Precise2(multiplyAddValue223, multiplyAddValue223))) * fragmentScalarConstants1.packedValues[174u], 0.0, 1.0);
                                    multiplyAddValue99 = conditionValue24 ? fma(-fma(nonlinearValue9, -2.0, 3.0), nonlinearValue9 * nonlinearValue9, 1.0) : 1.0;
                                    multiplyAddValue100 = scalarValue229 >= (fma(-fma(fragmentScalarConstants1.packedValues[33u], sqrt(fma(-productValue357, productValue357, 1.0)) / productValue357, fragmentScalarConstants1.packedValues[32u]), fragmentScalarConstants1.packedValues[70u] / spvNMax(productValue358, 1.0), fma(fragmentVectorConstants1.packedValues[2u].z, comparisonValue162, fma(fragmentVectorConstants1.packedValues[0u].z, comparisonValue160, comparisonValue161 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) / multiplyAddValue219);
                                }
                                else
                                {
                                    multiplyAddValue99 = 1.0;
                                    multiplyAddValue100 = false;
                                }
                                intermediateValue129 = multiplyAddValue99;
                                intermediateValue130 = multiplyAddValue100;
                            }
                            else
                            {
                                intermediateValue129 = 1.0;
                                intermediateValue130 = true;
                            }
                            float quotientValue78 = 1.0 / spvNMax(comparisonValue150, 0.100000001490116119384765625);
                            float multiplyAddValue224 = comparisonValue150 / fma(scalarValue224, scalarValue224, 9.9999997473787516355514526367188e-05);
                            float multiplyAddValue225 = spvNMax(fma(-multiplyAddValue224, multiplyAddValue224, 1.0), 0.0);
                            float productValue360 = multiplyAddValue225 * multiplyAddValue225;
                            float productValue361 = productValue360 * quotientValue78;
                            float multiplyAddValue226 = spvNClamp(quotientValue76 * (fma(-quotientValue78, productValue360, scalarValue216) + 1.0), 0.0, 1.0);
                            float multiplyAddValue227 = conditionValue5 ? (spvNClamp(fma((multiplyAddValue226 * multiplyAddValue226) * fma(multiplyAddValue226, -2.0, 3.0), fragmentScalarConstants1.packedValues[134u], fragmentScalarConstants1.packedValues[135u]), 0.0, 1.0) * productValue361) : productValue361;
                            vec4 reinterpretedBits28 = uintBitsToFloat(intermediateValue9.packedValues[(reinterpretedBits19 * 8u) + 1u]);
                            float scalarValue230 = reinterpretedBits28.w;
                            intermediateValue114 = intermediateValue129;
                            intermediateValue112 = intermediateValue130;
                            productValue57 = multiplyAddValue227 * (scalarValue230 * reinterpretedBits28.x);
                            productValue56 = multiplyAddValue227 * (scalarValue230 * reinterpretedBits28.y);
                            productValue55 = multiplyAddValue227 * (scalarValue230 * reinterpretedBits28.z);
                        }
                        else
                        {
                            intermediateValue114 = 1.0;
                            intermediateValue112 = true;
                            productValue57 = 0.0;
                            productValue56 = 0.0;
                            productValue55 = 0.0;
                        }
                        intermediateValue108 = productValue55;
                        intermediateValue109 = productValue56;
                        intermediateValue110 = productValue57;
                        intermediateValue111 = intermediateValue112;
                        intermediateValue113 = intermediateValue114;
                    }
                    else
                    {
                        intermediateValue108 = 0.0;
                        intermediateValue109 = 0.0;
                        intermediateValue110 = 0.0;
                        intermediateValue111 = true;
                        intermediateValue113 = 1.0;
                    }
                    float quotientValue79 = intermediateValue113 * (productValue345 * (productValue346 * spvNMax((rdDot3Precise2(vec3(-productValue341, -productValue342, -productValue343), productValue353) + fragmentScalarConstants1.packedValues[173u]) / productValue347, 0.0)));
                    multiplyAddValue38 = fma(intermediateValue110 * (intermediateValue111 ? ((productValue345 * (multiplyAddValue209 * (1.0 - multiplyAddValue215))) + quotientValue79) : quotientValue79), fragmentScalarConstants1.packedValues[120u], intermediateValue81);
                    multiplyAddValue39 = fma(intermediateValue109 * (intermediateValue111 ? ((productValue345 * (multiplyAddValue209 * (1.0 - multiplyAddValue216))) + quotientValue79) : quotientValue79), fragmentScalarConstants1.packedValues[120u], intermediateValue79);
                    multiplyAddValue40 = fma(intermediateValue108 * (intermediateValue111 ? ((productValue345 * (multiplyAddValue209 * (1.0 - multiplyAddValue217))) + quotientValue79) : quotientValue79), fragmentScalarConstants1.packedValues[120u], intermediateValue77);
                    multiplyAddValue41 = intermediateValue111 ? fma(fragmentScalarConstants1.packedValues[121u], intermediateValue110 * (((multiplyAddValue214 * (quotientValue77 * multiplyAddValue215)) / multiplyAddValue218) * scalarValue222), intermediateValue75) : intermediateValue75;
                    multiplyAddValue42 = intermediateValue111 ? fma(fragmentScalarConstants1.packedValues[121u], intermediateValue109 * (((multiplyAddValue214 * (quotientValue77 * multiplyAddValue216)) / multiplyAddValue218) * scalarValue222), intermediateValue73) : intermediateValue73;
                    multiplyAddValue43 = intermediateValue111 ? fma(fragmentScalarConstants1.packedValues[121u], intermediateValue108 * (((multiplyAddValue214 * (quotientValue77 * multiplyAddValue217)) / multiplyAddValue218) * scalarValue222), intermediateValue71) : intermediateValue71;
                    sumValue11 = scalarValue217 + 1u;
                    intermediateValue81 = multiplyAddValue38;
                    intermediateValue79 = multiplyAddValue39;
                    intermediateValue77 = multiplyAddValue40;
                    intermediateValue75 = multiplyAddValue41;
                    intermediateValue73 = multiplyAddValue42;
                    intermediateValue71 = multiplyAddValue43;
                    scalarValue217 = sumValue11;
                    continue;
                }
                intermediateValue70 = intermediateValue71;
                intermediateValue72 = intermediateValue73;
                intermediateValue74 = intermediateValue75;
                intermediateValue76 = intermediateValue77;
                intermediateValue78 = intermediateValue79;
                intermediateValue80 = intermediateValue81;
            }
            else
            {
                intermediateValue70 = 0.0;
                intermediateValue72 = 0.0;
                intermediateValue74 = 0.0;
                intermediateValue76 = 0.0;
                intermediateValue78 = 0.0;
                intermediateValue80 = 0.0;
            }
            float sumValue245 = 1.0 - fragmentScalarConstants1.packedValues[176u];
            productValue8 = intermediateValue80 * sumValue245;
            productValue9 = intermediateValue78 * sumValue245;
            productValue10 = intermediateValue76 * sumValue245;
            productValue11 = intermediateValue74 * sumValue245;
            productValue12 = intermediateValue72 * sumValue245;
            productValue13 = intermediateValue70 * sumValue245;
        }
        else
        {
            productValue8 = 0.0;
            productValue9 = 0.0;
            productValue10 = 0.0;
            productValue11 = 0.0;
            productValue12 = 0.0;
            productValue13 = 0.0;
        }
        intermediateValue42 = productValue8;
        intermediateValue43 = productValue9;
        intermediateValue44 = productValue10;
        intermediateValue45 = productValue11;
        intermediateValue46 = productValue12;
        intermediateValue47 = productValue13;
    }
    else
    {
        intermediateValue42 = 0.0;
        intermediateValue43 = 0.0;
        intermediateValue44 = 0.0;
        intermediateValue45 = 0.0;
        intermediateValue46 = 0.0;
        intermediateValue47 = 0.0;
    }
    float intermediateValue86;
    float intermediateValue88;
    float intermediateValue90;
    if (((scalarValue205 & 1u) == 0u) && ((fragmentScalarConstants1.packedValues[94u] != 0.0) && (fragmentScalarConstants1.packedValues[127u] != 0.0)))
    {
        float multiplyAddValue228 = fma(productValue326, 0.20000000298023223876953125, (multiplyAddValue175 - fragmentVectorConstants1.packedValues[27u].x) - 0.5);
        float multiplyAddValue229 = fma(productValue324, 0.20000000298023223876953125, (multiplyAddValue176 - fragmentVectorConstants1.packedValues[27u].y) - 0.5);
        float multiplyAddValue230 = fma(productValue325, 0.20000000298023223876953125, (multiplyAddValue177 - fragmentVectorConstants1.packedValues[27u].z) - 0.5);
        uint productValue362 = uint(int(floor(floor(multiplyAddValue228) * 0.0625)));
        uint productValue363 = uint(int(floor(floor(multiplyAddValue229) * 0.0625)));
        uint productValue364 = uint(int(floor(floor(multiplyAddValue230) * 0.0625)));
        uint scalarValue231 = bitfieldInsert(productValue362, productValue363, int(16u), int(16u));
        uint scalarValue232 = bitfieldInsert(131072u, productValue364, int(0u), int(16u));
        uint productValue365 = productValue362 * 1540483477u;
        uint productValue366 = productValue363 * 1540483477u;
        uint productValue367 = productValue364 * 1540483477u;
        uint bitwiseValue126 = ((((((((productValue365 ^ (productValue365 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ ((productValue366 ^ (productValue366 >> 24u)) * 1540483477u)) * 1540483477u) ^ (((productValue367 >> 24u) ^ productValue367) * 1540483477u)) * 1540483477u) ^ 2418085729u;
        uint bitwiseValue127 = ((bitwiseValue126 >> 13u) ^ bitwiseValue126) * 1540483477u;
        uint bitwiseValue128 = bitwiseValue127 ^ (bitwiseValue127 >> 15u);
        uint bitwiseValue129 = (bitwiseValue128 ^ (bitwiseValue128 >> 16u)) & 65535u;
        bool comparisonValue163 = bitwiseValue129 != 0u;
        uint bitwiseValue130 = bitwiseValue129 | 1u;
        uint sumValue246 = uint(fragmentScalarConstants1.packedValues[88u]) - 1u;
        uint comparisonValue164 = (comparisonValue163 ? bitwiseValue129 : bitwiseValue130) & sumValue246;
        uint comparisonValue7;
        uint comparisonValue8;
        uint bitwiseValue7;
        uint sumValue10;
        uint intermediateValue93;
        uint intermediateValue94;
        uint scalarValue82 = 0u;
        uint scalarValue83 = 0u;
        uint scalarValue233 = comparisonValue164;
        uint scalarValue120 = 0u;
        for (;;)
        {
            if (int(scalarValue120) >= int(8u))
            {
                intermediateValue93 = scalarValue83;
                intermediateValue94 = scalarValue82;
                break;
            }
            uint bitwiseValue131 = intermediateValue5.packedValues[scalarValue233].z & 65535u;
            bool comparisonValue165 = (scalarValue232 == intermediateValue5.packedValues[scalarValue233].y) && ((((bitwiseValue130 == bitwiseValue131) && (!comparisonValue163)) || (comparisonValue163 && (bitwiseValue129 == bitwiseValue131))) && (scalarValue231 == intermediateValue5.packedValues[scalarValue233].x));
            bool comparisonValue100 = scalarValue82 != 0u;
            comparisonValue8 = ((!comparisonValue165) || comparisonValue100) ? scalarValue83 : intermediateValue5.packedValues[scalarValue233].w;
            comparisonValue7 = comparisonValue165 ? 4294967295u : scalarValue82;
            bitwiseValue7 = sumValue246 & (scalarValue233 + 1u);
            bool comparisonValue166 = comparisonValue165 || (bitwiseValue131 == 0u);
            if (((!comparisonValue166) && comparisonValue100) || comparisonValue166)
            {
                intermediateValue93 = comparisonValue8;
                intermediateValue94 = comparisonValue7;
                break;
            }
            sumValue10 = scalarValue120 + 1u;
            scalarValue82 = comparisonValue7;
            scalarValue83 = comparisonValue8;
            scalarValue233 = bitwiseValue7;
            scalarValue120 = sumValue10;
            continue;
        }
        float intermediateValue87;
        float intermediateValue89;
        float intermediateValue91;
        if (intermediateValue94 != 0u)
        {
            float productValue368 = floor(multiplyAddValue228 * 0.0625);
            float productValue369 = floor(multiplyAddValue229 * 0.0625);
            float productValue370 = floor(multiplyAddValue230 * 0.0625);
            float multiplyAddValue231 = fma(-productValue368, 16.0, multiplyAddValue228);
            float multiplyAddValue232 = fma(-productValue369, 16.0, multiplyAddValue229);
            float multiplyAddValue233 = fma(-productValue370, 16.0, multiplyAddValue230);
            uint bitwiseValue132 = intermediateValue93 >> 2u;
            float scalarValue234 = abs(productValue326);
            float scalarValue235 = abs(productValue324);
            float scalarValue236 = abs(productValue325);
            float multiplyAddValue60;
            float multiplyAddValue61;
            float multiplyAddValue62;
            if ((((scalarValue234 >= 1.0) || (scalarValue235 >= 1.0)) || (scalarValue236 >= 1.0)) && ((scalarValue205 & 2u) == 0u))
            {
                vec3 vectorValue32 = vec3(scalarValue235, scalarValue236, scalarValue234);
                float scalarValue237 = rdDot3Precise2(vec3(multiplyAddValue232, multiplyAddValue233, multiplyAddValue231), vectorValue32);
                float scalarValue238 = rdDot3Precise2(vec3(multiplyAddValue233, multiplyAddValue231, multiplyAddValue232), vectorValue32);
                float scalarValue239 = rdDot3Precise2(vec3(multiplyAddValue231, multiplyAddValue232, multiplyAddValue233), vectorValue32);
                float multiplyAddValue234 = (fma(sumValue226, inverseLengthValue37, productValue324 + productValue326) > 0.0) ? ceil(scalarValue237) : floor(scalarValue237);
                float scalarValue240 = floor(scalarValue238);
                float scalarValue241 = floor(scalarValue239);
                float multiplyAddValue235 = fma(scalarValue235, scalarValue241, fma(scalarValue234, multiplyAddValue234, scalarValue240 * scalarValue236));
                float multiplyAddValue236 = fma(scalarValue236, scalarValue241, fma(scalarValue235, multiplyAddValue234, scalarValue240 * scalarValue234));
                float multiplyAddValue237 = fma(scalarValue234, scalarValue241, fma(scalarValue236, multiplyAddValue234, scalarValue240 * scalarValue235));
                float sumValue247 = scalarValue236 + multiplyAddValue235;
                float sumValue248 = scalarValue234 + multiplyAddValue236;
                float sumValue249 = scalarValue235 + multiplyAddValue237;
                float sumValue250 = scalarValue235 + multiplyAddValue235;
                float sumValue251 = scalarValue236 + multiplyAddValue236;
                float sumValue252 = scalarValue234 + multiplyAddValue237;
                float sumValue253 = scalarValue235 + sumValue247;
                float sumValue254 = scalarValue236 + sumValue248;
                float sumValue255 = scalarValue234 + sumValue249;
                float sumValue256 = scalarValue238 - scalarValue240;
                float sumValue257 = scalarValue239 - scalarValue241;
                float sumValue258 = (scalarValue240 - scalarValue238) + 1.0;
                float sumValue259 = (scalarValue241 - scalarValue239) + 1.0;
                float productValue371 = sumValue258 * sumValue259;
                float productValue372 = sumValue256 * sumValue259;
                float productValue373 = sumValue257 * sumValue258;
                float productValue374 = sumValue256 * sumValue257;
                float comparisonValue47;
                float comparisonValue48;
                float comparisonValue49;
                float comparisonValue50;
                float comparisonValue51;
                float comparisonValue52;
                float comparisonValue53;
                float comparisonValue54;
                float comparisonValue55;
                float comparisonValue56;
                float comparisonValue57;
                float comparisonValue58;
                if ((((sumValue253 < 16.0) && (sumValue254 < 16.0)) && (sumValue255 < 16.0)) && (((multiplyAddValue235 >= 0.0) && (multiplyAddValue236 >= 0.0)) && (multiplyAddValue237 >= 0.0)))
                {
                    uint bitwiseValue133 = bitwiseValue132 + (((uint(multiplyAddValue237) << 4u) + uint(multiplyAddValue236)) + (uint(multiplyAddValue235) << 8u));
                    float bitwiseValue134 = rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue133] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue167 = intermediateValue6.packedValues[bitwiseValue133] != 0u;
                    uint bitwiseValue135 = bitwiseValue132 + (((uint(sumValue249) << 4u) + uint(sumValue248)) + (uint(sumValue247) << 8u));
                    float bitwiseValue136 = rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue135] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue168 = intermediateValue6.packedValues[bitwiseValue135] != 0u;
                    uint bitwiseValue137 = bitwiseValue132 + (((uint(sumValue252) << 4u) + uint(sumValue251)) + (uint(sumValue250) << 8u));
                    float bitwiseValue138 = rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue137] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue169 = intermediateValue6.packedValues[bitwiseValue137] != 0u;
                    uint bitwiseValue139 = bitwiseValue132 + (((uint(sumValue255) << 4u) + uint(sumValue254)) + (uint(sumValue253) << 8u));
                    float bitwiseValue140 = rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue139] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue170 = intermediateValue6.packedValues[bitwiseValue139] != 0u;
                    comparisonValue47 = comparisonValue170 ? ((bitwiseValue140 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue139] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue48 = comparisonValue170 ? ((bitwiseValue140 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue139] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue49 = comparisonValue170 ? ((bitwiseValue140 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[bitwiseValue139] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue50 = comparisonValue169 ? ((bitwiseValue138 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue137] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue51 = comparisonValue169 ? ((bitwiseValue138 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue137] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue52 = comparisonValue169 ? ((bitwiseValue138 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[bitwiseValue137] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue53 = comparisonValue167 ? ((bitwiseValue134 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue133] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue54 = comparisonValue167 ? ((bitwiseValue134 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue133] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue55 = comparisonValue167 ? ((bitwiseValue134 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[bitwiseValue133] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue56 = comparisonValue168 ? ((bitwiseValue136 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue135] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue57 = comparisonValue168 ? ((bitwiseValue136 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue135] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue58 = comparisonValue168 ? ((bitwiseValue136 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[bitwiseValue135] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                else
                {
                    float multiplyAddValue238 = fma(productValue368, 16.0, multiplyAddValue235);
                    float multiplyAddValue239 = fma(productValue369, 16.0, multiplyAddValue236);
                    float multiplyAddValue240 = fma(productValue370, 16.0, multiplyAddValue237);
                    uint comparisonValue171 = min(((((bitfieldInsert(bitfieldInsert(0u, (multiplyAddValue235 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (multiplyAddValue235 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (multiplyAddValue236 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue236 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue237 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue237 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))), 64u);
                    bool conditionValue26 = int(intermediateValue16[comparisonValue171].x) < int(0u);
                    uint sumValue260 = bitwiseValue132 + 4097u;
                    uint sumValue261 = bitwiseValue132 + 4096u;
                    uint multiplyAddValue241 = conditionValue26 ? (bitwiseValue132 + (bitfieldInsert(bitfieldInsert(0u, uint(multiplyAddValue237), int(4u), int(4u)), uint(multiplyAddValue236), int(0u), int(4u)) + bitfieldInsert(0u, uint(multiplyAddValue235), int(8u), int(4u)))) : ((intermediateValue6.packedValues[intermediateValue16[comparisonValue171].x + sumValue260] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue240 * 0.0625), 16.0, multiplyAddValue240)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue239 * 0.0625), 16.0, multiplyAddValue239)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue238 * 0.0625), 16.0, multiplyAddValue238)), int(8u), int(4u))));
                    float bitwiseValue141 = rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue241] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue172 = (conditionValue26 || (((1u << (intermediateValue16[comparisonValue171].x & 31u)) & intermediateValue6.packedValues[sumValue261]) != 0u)) && (intermediateValue6.packedValues[multiplyAddValue241] != 0u);
                    float multiplyAddValue242 = fma(productValue368, 16.0, sumValue247);
                    float multiplyAddValue243 = fma(productValue369, 16.0, sumValue248);
                    float multiplyAddValue244 = fma(productValue370, 16.0, sumValue249);
                    uint comparisonValue173 = min(((((bitfieldInsert(bitfieldInsert(0u, (sumValue247 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue247 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue248 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue248 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue249 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue249 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))), 64u);
                    bool conditionValue27 = int(intermediateValue16[comparisonValue173].x) < int(0u);
                    uint multiplyAddValue245 = conditionValue27 ? (bitwiseValue132 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue249), int(4u), int(4u)), uint(sumValue248), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue247), int(8u), int(4u)))) : ((intermediateValue6.packedValues[intermediateValue16[comparisonValue173].x + sumValue260] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue244 * 0.0625), 16.0, multiplyAddValue244)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue243 * 0.0625), 16.0, multiplyAddValue243)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue242 * 0.0625), 16.0, multiplyAddValue242)), int(8u), int(4u))));
                    float bitwiseValue142 = rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue245] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue174 = (conditionValue27 || (((1u << (intermediateValue16[comparisonValue173].x & 31u)) & intermediateValue6.packedValues[sumValue261]) != 0u)) && (intermediateValue6.packedValues[multiplyAddValue245] != 0u);
                    float multiplyAddValue246 = fma(productValue368, 16.0, sumValue250);
                    float multiplyAddValue247 = fma(productValue369, 16.0, sumValue251);
                    float multiplyAddValue248 = fma(productValue370, 16.0, sumValue252);
                    uint comparisonValue175 = min(((((bitfieldInsert(bitfieldInsert(0u, (sumValue250 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue250 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue251 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue251 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue252 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue252 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))), 64u);
                    bool conditionValue28 = int(intermediateValue16[comparisonValue175].x) < int(0u);
                    uint multiplyAddValue249 = conditionValue28 ? (bitwiseValue132 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue252), int(4u), int(4u)), uint(sumValue251), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue250), int(8u), int(4u)))) : ((intermediateValue6.packedValues[sumValue260 + intermediateValue16[comparisonValue175].x] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue248 * 0.0625), 16.0, multiplyAddValue248)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue247 * 0.0625), 16.0, multiplyAddValue247)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue246 * 0.0625), 16.0, multiplyAddValue246)), int(8u), int(4u))));
                    float bitwiseValue143 = rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue249] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue176 = (conditionValue28 || (((1u << (intermediateValue16[comparisonValue175].x & 31u)) & intermediateValue6.packedValues[sumValue261]) != 0u)) && (intermediateValue6.packedValues[multiplyAddValue249] != 0u);
                    float multiplyAddValue250 = fma(productValue368, 16.0, sumValue253);
                    float multiplyAddValue251 = fma(productValue369, 16.0, sumValue254);
                    float multiplyAddValue252 = fma(productValue370, 16.0, sumValue255);
                    uint comparisonValue177 = min(((((bitfieldInsert(bitfieldInsert(0u, (sumValue253 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue253 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue254 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue254 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue255 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue255 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))), 64u);
                    bool conditionValue29 = int(intermediateValue16[comparisonValue177].x) < int(0u);
                    uint multiplyAddValue253 = conditionValue29 ? (bitwiseValue132 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue255), int(4u), int(4u)), uint(sumValue254), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue253), int(8u), int(4u)))) : ((intermediateValue6.packedValues[intermediateValue16[comparisonValue177].x + sumValue260] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue252 * 0.0625), 16.0, multiplyAddValue252)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue251 * 0.0625), 16.0, multiplyAddValue251)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue250 * 0.0625), 16.0, multiplyAddValue250)), int(8u), int(4u))));
                    float bitwiseValue144 = rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue253] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue178 = (conditionValue29 || (((1u << (intermediateValue16[comparisonValue177].x & 31u)) & intermediateValue6.packedValues[sumValue261]) != 0u)) && (intermediateValue6.packedValues[multiplyAddValue253] != 0u);
                    comparisonValue47 = comparisonValue178 ? ((bitwiseValue144 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue253] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue48 = comparisonValue178 ? ((bitwiseValue144 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue253] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue49 = comparisonValue178 ? ((bitwiseValue144 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[multiplyAddValue253] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue50 = comparisonValue176 ? ((bitwiseValue143 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue249] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue51 = comparisonValue176 ? ((bitwiseValue143 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue249] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue52 = comparisonValue176 ? ((bitwiseValue143 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[multiplyAddValue249] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue53 = comparisonValue172 ? ((bitwiseValue141 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue241] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue54 = comparisonValue172 ? ((bitwiseValue141 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue241] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue55 = comparisonValue172 ? ((bitwiseValue141 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[multiplyAddValue241] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue56 = comparisonValue174 ? ((bitwiseValue142 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue245] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue57 = comparisonValue174 ? ((bitwiseValue142 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue245] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue58 = comparisonValue174 ? ((bitwiseValue142 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[multiplyAddValue245] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                multiplyAddValue60 = fma(comparisonValue49, productValue374, fma(comparisonValue52, productValue373, fma(comparisonValue55, productValue371, productValue372 * comparisonValue58)));
                multiplyAddValue61 = fma(comparisonValue48, productValue374, fma(comparisonValue51, productValue373, fma(comparisonValue54, productValue371, productValue372 * comparisonValue57)));
                multiplyAddValue62 = fma(comparisonValue47, productValue374, fma(comparisonValue50, productValue373, fma(comparisonValue53, productValue371, productValue372 * comparisonValue56)));
            }
            else
            {
                float scalarValue242 = floor(multiplyAddValue231);
                float scalarValue243 = floor(multiplyAddValue232);
                float scalarValue244 = floor(multiplyAddValue233);
                float sumValue262 = multiplyAddValue231 - scalarValue242;
                float sumValue263 = multiplyAddValue232 - scalarValue243;
                float sumValue264 = multiplyAddValue233 - scalarValue244;
                uint comparisonValue179 = bitfieldInsert(bitfieldInsert(0u, (sumValue263 >= sumValue264) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue262 >= sumValue263) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue262 >= sumValue264) ? 4294967295u : 0u, int(2u), int(1u));
                float scalarValue245 = spvNMin(sumValue263, sumValue262);
                float scalarValue246 = spvNMax(sumValue263, sumValue262);
                float scalarValue247 = spvNMin(sumValue264, scalarValue245);
                float scalarValue248 = spvNMax(sumValue264, scalarValue246);
                float scalarValue249 = spvNMax(scalarValue245, spvNMin(sumValue264, scalarValue246));
                float sumValue265 = 1.0 - scalarValue248;
                float sumValue266 = scalarValue248 - scalarValue249;
                float sumValue267 = scalarValue249 - scalarValue247;
                float sumValue268 = scalarValue242 + 1.0;
                float sumValue269 = scalarValue243 + 1.0;
                float sumValue270 = scalarValue244 + 1.0;
                float comparisonValue59;
                float comparisonValue60;
                float comparisonValue61;
                float comparisonValue62;
                float comparisonValue63;
                float comparisonValue64;
                float comparisonValue65;
                float comparisonValue66;
                float comparisonValue67;
                float comparisonValue68;
                float comparisonValue69;
                float comparisonValue70;
                if (((sumValue270 < 16.0) && ((sumValue268 < 16.0) && (sumValue269 < 16.0))) && (((scalarValue242 >= 0.0) && (scalarValue243 >= 0.0)) && (scalarValue244 >= 0.0)))
                {
                    uint scalarValue250 = uint(scalarValue242);
                    uint scalarValue251 = uint(scalarValue243);
                    uint scalarValue252 = uint(scalarValue244);
                    uint scalarValue253 = min(comparisonValue179, 64u);
                    uint sumValue271 = min((comparisonValue179 + 8u), 64u);
                    uint bitwiseValue145 = bitwiseValue132 + (((scalarValue252 << 4u) + scalarValue251) + (scalarValue250 << 8u));
                    float bitwiseValue146 = rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue145] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue180 = intermediateValue6.packedValues[bitwiseValue145] != 0u;
                    uint bitwiseValue147 = bitwiseValue132 + (((scalarValue250 + intermediateValue16[scalarValue253].y) << 8u) + (((uint(comparisonValue179 < 2u) + scalarValue252) << 4u) + (scalarValue251 + intermediateValue16[scalarValue253].z)));
                    float bitwiseValue148 = rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue147] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue181 = intermediateValue6.packedValues[bitwiseValue147] != 0u;
                    uint bitwiseValue149 = bitwiseValue132 + (((intermediateValue16[sumValue271].y + scalarValue250) << 8u) + ((scalarValue251 + intermediateValue16[sumValue271].z) + ((uint(comparisonValue179 < 6u) + scalarValue252) << 4u)));
                    float bitwiseValue150 = rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue149] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue182 = intermediateValue6.packedValues[bitwiseValue149] != 0u;
                    uint bitwiseValue151 = bitwiseValue132 + (((scalarValue250 + 1u) << 8u) + ((scalarValue251 + 1u) + ((scalarValue252 + 1u) << 4u)));
                    float bitwiseValue152 = rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue151] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue183 = intermediateValue6.packedValues[bitwiseValue151] != 0u;
                    comparisonValue59 = comparisonValue183 ? ((bitwiseValue152 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue151] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue60 = comparisonValue183 ? ((bitwiseValue152 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue151] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue61 = comparisonValue183 ? ((bitwiseValue152 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[bitwiseValue151] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue62 = comparisonValue182 ? ((bitwiseValue150 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue149] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue63 = comparisonValue182 ? ((bitwiseValue150 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue149] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue64 = comparisonValue182 ? ((bitwiseValue150 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[bitwiseValue149] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue65 = comparisonValue180 ? ((bitwiseValue146 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue145] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue66 = comparisonValue180 ? ((bitwiseValue146 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue145] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue67 = comparisonValue180 ? ((bitwiseValue146 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[bitwiseValue145] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue68 = comparisonValue181 ? ((bitwiseValue148 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue147] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue69 = comparisonValue181 ? ((bitwiseValue148 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[bitwiseValue147] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue70 = comparisonValue181 ? ((bitwiseValue148 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[bitwiseValue147] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                else
                {
                    uint scalarValue254 = min(comparisonValue179, 64u);
                    float sumValue272 = scalarValue242 + rdEvaluateFloatExpression(intermediateValue16[scalarValue254].y);
                    float sumValue273 = scalarValue243 + rdEvaluateFloatExpression(intermediateValue16[scalarValue254].z);
                    float sumValue274 = scalarValue244 + rdEvaluateFloatExpression(uint(comparisonValue179 < 2u));
                    uint sumValue275 = min((comparisonValue179 + 8u), 64u);
                    float sumValue276 = scalarValue242 + rdEvaluateFloatExpression(intermediateValue16[sumValue275].y);
                    float sumValue277 = scalarValue243 + rdEvaluateFloatExpression(intermediateValue16[sumValue275].z);
                    float sumValue278 = scalarValue244 + rdEvaluateFloatExpression(uint(comparisonValue179 < 6u));
                    float multiplyAddValue254 = fma(productValue368, 16.0, scalarValue242);
                    float multiplyAddValue255 = fma(productValue369, 16.0, scalarValue243);
                    float multiplyAddValue256 = fma(productValue370, 16.0, scalarValue244);
                    uint comparisonValue184 = min((bitfieldInsert(0u, (scalarValue244 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (scalarValue244 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (scalarValue243 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (scalarValue242 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (scalarValue242 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (scalarValue243 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))), 64u);
                    bool conditionValue30 = int(intermediateValue16[comparisonValue184].x) < int(0u);
                    uint sumValue279 = bitwiseValue132 + 4097u;
                    uint sumValue280 = bitwiseValue132 + 4096u;
                    uint multiplyAddValue257 = conditionValue30 ? (bitwiseValue132 + (bitfieldInsert(0u, uint(scalarValue242), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(scalarValue244), int(4u), int(4u)), uint(scalarValue243), int(0u), int(4u)))) : ((intermediateValue6.packedValues[intermediateValue16[comparisonValue184].x + sumValue279] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue254 * 0.0625), 16.0, multiplyAddValue254)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue256 * 0.0625), 16.0, multiplyAddValue256)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue255 * 0.0625), 16.0, multiplyAddValue255)), int(0u), int(4u))));
                    float bitwiseValue153 = rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue257] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue185 = (conditionValue30 || ((intermediateValue6.packedValues[sumValue280] & (1u << (intermediateValue16[comparisonValue184].x & 31u))) != 0u)) && (intermediateValue6.packedValues[multiplyAddValue257] != 0u);
                    float multiplyAddValue258 = fma(productValue368, 16.0, sumValue272);
                    float multiplyAddValue259 = fma(productValue369, 16.0, sumValue273);
                    float multiplyAddValue260 = fma(productValue370, 16.0, sumValue274);
                    uint comparisonValue186 = min((bitfieldInsert(0u, (sumValue274 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue274 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue273 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue272 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue272 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue273 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))), 64u);
                    bool conditionValue31 = int(intermediateValue16[comparisonValue186].x) < int(0u);
                    uint multiplyAddValue261 = conditionValue31 ? (bitwiseValue132 + (bitfieldInsert(0u, uint(sumValue272), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue274), int(4u), int(4u)), uint(sumValue273), int(0u), int(4u)))) : ((intermediateValue6.packedValues[sumValue279 + intermediateValue16[comparisonValue186].x] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue258 * 0.0625), 16.0, multiplyAddValue258)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue260 * 0.0625), 16.0, multiplyAddValue260)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue259 * 0.0625), 16.0, multiplyAddValue259)), int(0u), int(4u))));
                    float bitwiseValue154 = rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue261] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue187 = (conditionValue31 || ((intermediateValue6.packedValues[sumValue280] & (1u << (intermediateValue16[comparisonValue186].x & 31u))) != 0u)) && (intermediateValue6.packedValues[multiplyAddValue261] != 0u);
                    float multiplyAddValue262 = fma(productValue368, 16.0, sumValue276);
                    float multiplyAddValue263 = fma(productValue369, 16.0, sumValue277);
                    float multiplyAddValue264 = fma(productValue370, 16.0, sumValue278);
                    uint comparisonValue188 = min((bitfieldInsert(0u, (sumValue278 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue278 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue277 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue276 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue276 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue277 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))), 64u);
                    bool conditionValue32 = int(intermediateValue16[comparisonValue188].x) < int(0u);
                    uint multiplyAddValue265 = conditionValue32 ? (bitwiseValue132 + (bitfieldInsert(0u, uint(sumValue276), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue278), int(4u), int(4u)), uint(sumValue277), int(0u), int(4u)))) : ((intermediateValue6.packedValues[intermediateValue16[comparisonValue188].x + sumValue279] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue262 * 0.0625), 16.0, multiplyAddValue262)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue264 * 0.0625), 16.0, multiplyAddValue264)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue263 * 0.0625), 16.0, multiplyAddValue263)), int(0u), int(4u))));
                    float bitwiseValue155 = rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue265] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue189 = (conditionValue32 || ((intermediateValue6.packedValues[sumValue280] & (1u << (intermediateValue16[comparisonValue188].x & 31u))) != 0u)) && (intermediateValue6.packedValues[multiplyAddValue265] != 0u);
                    float multiplyAddValue266 = fma(productValue368, 16.0, sumValue268);
                    float multiplyAddValue267 = fma(productValue369, 16.0, sumValue269);
                    float multiplyAddValue268 = fma(productValue370, 16.0, sumValue270);
                    uint comparisonValue190 = min((bitfieldInsert(0u, (sumValue270 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue270 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue269 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue268 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue268 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue269 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))), 64u);
                    bool conditionValue33 = int(intermediateValue16[comparisonValue190].x) < int(0u);
                    uint multiplyAddValue269 = conditionValue33 ? (bitwiseValue132 + (bitfieldInsert(0u, uint(sumValue268), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue270), int(4u), int(4u)), uint(sumValue269), int(0u), int(4u)))) : ((intermediateValue6.packedValues[intermediateValue16[comparisonValue190].x + sumValue279] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue266 * 0.0625), 16.0, multiplyAddValue266)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue268 * 0.0625), 16.0, multiplyAddValue268)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue267 * 0.0625), 16.0, multiplyAddValue267)), int(0u), int(4u))));
                    float bitwiseValue156 = rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue269] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                    bool comparisonValue191 = (conditionValue33 || ((intermediateValue6.packedValues[sumValue280] & (1u << (intermediateValue16[comparisonValue190].x & 31u))) != 0u)) && (intermediateValue6.packedValues[multiplyAddValue269] != 0u);
                    comparisonValue59 = comparisonValue191 ? ((bitwiseValue156 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue269] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue60 = comparisonValue191 ? ((bitwiseValue156 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue269] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue61 = comparisonValue191 ? ((bitwiseValue156 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[multiplyAddValue269] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue62 = comparisonValue189 ? ((bitwiseValue155 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue265] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue63 = comparisonValue189 ? ((bitwiseValue155 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue265] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue64 = comparisonValue189 ? ((bitwiseValue155 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[multiplyAddValue265] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue65 = comparisonValue185 ? ((bitwiseValue153 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue257] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue66 = comparisonValue185 ? ((bitwiseValue153 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue257] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue67 = comparisonValue185 ? ((bitwiseValue153 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[multiplyAddValue257] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue68 = comparisonValue187 ? ((bitwiseValue154 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue261] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue69 = comparisonValue187 ? ((bitwiseValue154 * (rdEvaluateFloatExpression((intermediateValue6.packedValues[multiplyAddValue261] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    comparisonValue70 = comparisonValue187 ? ((bitwiseValue154 * (rdEvaluateFloatExpression(intermediateValue6.packedValues[multiplyAddValue261] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                }
                multiplyAddValue60 = fma(comparisonValue61, scalarValue247, fma(comparisonValue64, sumValue267, fma(comparisonValue67, sumValue265, sumValue266 * comparisonValue70)));
                multiplyAddValue61 = fma(comparisonValue60, scalarValue247, fma(comparisonValue63, sumValue267, fma(comparisonValue66, sumValue265, sumValue266 * comparisonValue69)));
                multiplyAddValue62 = fma(comparisonValue59, scalarValue247, fma(comparisonValue62, sumValue267, fma(comparisonValue65, sumValue265, sumValue266 * comparisonValue68)));
            }
            intermediateValue91 = multiplyAddValue60;
            intermediateValue89 = multiplyAddValue61;
            intermediateValue87 = multiplyAddValue62;
        }
        else
        {
            intermediateValue91 = 0.0;
            intermediateValue89 = 0.0;
            intermediateValue87 = 0.0;
        }
        intermediateValue86 = intermediateValue87;
        intermediateValue88 = intermediateValue89;
        intermediateValue90 = intermediateValue91;
    }
    else
    {
        float bitwiseValue157 = rdEvaluateFloatExpression(scalarValue203 & 255u) * 0.0039215688593685626983642578125;
        intermediateValue86 = (bitwiseValue157 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue203, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * 6.0;
        intermediateValue88 = (bitwiseValue157 * (rdEvaluateFloatExpression(scalarValue202 & 255u) * 0.0039215688593685626983642578125)) * 6.0;
        intermediateValue90 = (bitwiseValue157 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue202, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * 6.0;
    }
    float productValue375 = bitwiseValue121 * bitwiseValue121;
    float productValue376 = bitwiseValue121 * (productValue375 * productValue375);
    float multiplyAddValue270 = fma(fragmentScalarConstants1.packedValues[105u], fma(productValue375, bitwiseValue121, -productValue376), productValue376);
    fragmentColor1.x = fma(spvNMax(fma(intermediateValue90, fragmentScalarConstants1.packedValues[79u], (multiplyAddValue270 * fragmentVectorConstants1.packedValues[41u].x) * fragmentScalarConstants1.packedValues[167u]), fragmentScalarConstants1.packedValues[99u] * fragmentVectorConstants1.packedValues[24u].x) * sumValue227, fragmentScalarConstants1.packedValues[123u], intermediateValue42);
    fragmentColor1.y = fma(spvNMax(fma(intermediateValue88, fragmentScalarConstants1.packedValues[79u], (multiplyAddValue270 * fragmentVectorConstants1.packedValues[41u].y) * fragmentScalarConstants1.packedValues[167u]), fragmentScalarConstants1.packedValues[99u] * fragmentVectorConstants1.packedValues[24u].y) * sumValue227, fragmentScalarConstants1.packedValues[123u], intermediateValue43);
    fragmentColor1.z = fma(spvNMax(fma(intermediateValue86, fragmentScalarConstants1.packedValues[79u], (multiplyAddValue270 * fragmentVectorConstants1.packedValues[41u].z) * fragmentScalarConstants1.packedValues[167u]), fragmentScalarConstants1.packedValues[99u] * fragmentVectorConstants1.packedValues[24u].z) * sumValue227, fragmentScalarConstants1.packedValues[123u], intermediateValue44);
    fragmentColor0.x = fma(scalarValue194, 0.5, 0.5);
    fragmentColor0.y = fma(scalarValue195, 0.5, 0.5);
    float productValue377 = floor(scalarValue196 * 65535.0);
    fragmentColor0.z = productValue377 * 1.525902189314365386962890625e-05;
    fragmentColor0.w = fma(scalarValue196, 65535.0, -productValue377);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (floor(fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord0.x) + 0.5) * fragmentVectorConstants1.packedValues[4u].z;
    float productValue1 = (floor(fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord0.y) + 0.5) * fragmentVectorConstants1.packedValues[4u].w;
    vec4 sampledTextureValue = texture(sampler2D(normalTexture, normalSampler), vec2(productValue, productValue1));
    uvec2 sampledTextureValue1 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    uvec4 sampledTextureValue2 = texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue1.x)))))) * productValue)), uint(int(float(int(uint(int(float(int(sampledTextureValue1.y)))))) * productValue1)))), int(0u));
    uint scalarValue = sampledTextureValue2.y;
    uint scalarValue1 = sampledTextureValue2.z;
    float bitwiseValue = float(sampledTextureValue2.w & 255u) * 0.0039215688593685626983642578125;
    float bitwiseValue1 = (float(scalarValue1 & 255u) * 9.2272217443678528070449829101562e-05) * fragmentVectorConstants1.packedValues[0u].w;
    float productValue2 = bitwiseValue * bitwiseValue;
    float productValue3 = productValue2 * productValue2;
    float productValue4 = ((((productValue2 - productValue3) * fragmentVectorConstants1.packedValues[2u].y) + productValue3) * bitwiseValue) * fragmentVectorConstants1.packedValues[5u].w;
    float sampledTextureValue3 = fragmentVectorConstants1.packedValues[3u].w * (1.0 - spvNClamp((texture(sampler2D(colorMetalnessSubsurfaceTexture, colorMetalnessSubsurfaceSampler), vec2(productValue, productValue1)).w + (-0.501960813999176025390625)) * 2.007874011993408203125, 0.0, 1.0));
    float sampledTextureValue4 = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(productValue, productValue1)).x * 65535.0;
    float scalarValue2 = floor(sampledTextureValue4);
    fragmentColor0.x = (sampledTextureValue.x * 0.5) + 0.5;
    fragmentColor0.y = (sampledTextureValue.y * 0.5) + 0.5;
    fragmentColor0.z = scalarValue2 * 1.525902189314365386962890625e-05;
    fragmentColor0.w = sampledTextureValue4 - scalarValue2;
    fragmentColor1.x = sampledTextureValue3 * spvNMax((bitwiseValue1 * float((scalarValue >> 8u) & 255u)) + (productValue4 * fragmentVectorConstants1.packedValues[5u].x), fragmentVectorConstants1.packedValues[1u].x * fragmentVectorConstants1.packedValues[1u].w);
    fragmentColor1.y = sampledTextureValue3 * spvNMax((bitwiseValue1 * float(scalarValue & 255u)) + (productValue4 * fragmentVectorConstants1.packedValues[5u].y), fragmentVectorConstants1.packedValues[1u].y * fragmentVectorConstants1.packedValues[1u].w);
    fragmentColor1.z = sampledTextureValue3 * spvNMax((bitwiseValue1 * float((scalarValue1 >> 8u) & 255u)) + (productValue4 * fragmentVectorConstants1.packedValues[5u].z), fragmentVectorConstants1.packedValues[1u].z * fragmentVectorConstants1.packedValues[1u].w);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue95 = (floor(fragmentVectorConstants1.packedValues[38u].x * varyingTexCoord0.x) + 0.5) * fragmentVectorConstants1.packedValues[38u].z;
    float productValue96 = (floor(fragmentVectorConstants1.packedValues[38u].y * varyingTexCoord0.y) + 0.5) * fragmentVectorConstants1.packedValues[38u].w;
    float productValue97 = (productValue95 * 2.0) + (-1.0);
    float productValue98 = ((1.0 - productValue96) * 2.0) + (-1.0);
    vec4 sampledTextureValue25 = texture(sampler2D(normalTexture, normalSampler), vec2(productValue95, productValue96));
    float scalarValue43 = sampledTextureValue25.x;
    float scalarValue44 = sampledTextureValue25.y;
    vec4 sampledTextureValue27 = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(productValue95, productValue96));
    float scalarValue45 = sampledTextureValue27.x;
    float productValue99 = (scalarValue45 * fragmentVectorConstants1.packedValues[15u].w) + fragmentVectorConstants1.packedValues[16u].w;
    float quotientValue21 = (productValue97 * fragmentVectorConstants1.packedValues[13u].x) / productValue99;
    float quotientValue22 = (productValue98 * fragmentVectorConstants1.packedValues[14u].y) / productValue99;
    float quotientValue23 = fragmentVectorConstants1.packedValues[16u].z / productValue99;
    float sumValue89 = (-0.0) - quotientValue23;
    float multiplyAddValue75 = fma(fragmentVectorConstants1.packedValues[11u].x, quotientValue23, fma(fragmentVectorConstants1.packedValues[10u].x, quotientValue22, quotientValue21 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[12u].x;
    float multiplyAddValue76 = fma(fragmentVectorConstants1.packedValues[11u].y, quotientValue23, fma(fragmentVectorConstants1.packedValues[10u].y, quotientValue22, quotientValue21 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[12u].y;
    float multiplyAddValue77 = fma(fragmentVectorConstants1.packedValues[11u].z, quotientValue23, fma(fragmentVectorConstants1.packedValues[10u].z, quotientValue22, quotientValue21 * fragmentVectorConstants1.packedValues[9u].z)) + fragmentVectorConstants1.packedValues[12u].z;
    float quotientValue24 = ((fragmentVectorConstants1.packedValues[40u].x + productValue97) * fragmentVectorConstants1.packedValues[13u].x) / productValue99;
    float quotientValue25 = ((productValue98 - fragmentVectorConstants1.packedValues[40u].y) * fragmentVectorConstants1.packedValues[14u].y) / productValue99;
    float multiplyAddValue78 = (fma(fragmentVectorConstants1.packedValues[11u].x, quotientValue23, fma(fragmentVectorConstants1.packedValues[10u].x, quotientValue25, quotientValue24 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[12u].x) - fragmentVectorConstants1.packedValues[26u].x;
    float multiplyAddValue79 = (fma(fragmentVectorConstants1.packedValues[11u].y, quotientValue23, fma(fragmentVectorConstants1.packedValues[10u].y, quotientValue25, quotientValue24 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[12u].y) - fragmentVectorConstants1.packedValues[26u].y;
    float multiplyAddValue80 = (fma(fragmentVectorConstants1.packedValues[11u].z, quotientValue23, fma(fragmentVectorConstants1.packedValues[10u].z, quotientValue25, quotientValue24 * fragmentVectorConstants1.packedValues[9u].z)) + fragmentVectorConstants1.packedValues[12u].z) - fragmentVectorConstants1.packedValues[26u].z;
    float scalarValue46 = dFdxCoarse(quotientValue24);
    float scalarValue47 = dFdxCoarse(quotientValue25);
    float scalarValue48 = dFdxCoarse(quotientValue23);
    float inverseLengthValue10 = inversesqrt(dot(vec3(scalarValue46, scalarValue47, scalarValue48), vec3(scalarValue46, scalarValue47, scalarValue48)));
    float productValue100 = inverseLengthValue10 * scalarValue46;
    float productValue101 = inverseLengthValue10 * scalarValue47;
    float productValue102 = inverseLengthValue10 * scalarValue48;
    float sumValue90 = dFdyCoarse((-0.0) - quotientValue24);
    float sumValue91 = dFdyCoarse((-0.0) - quotientValue25);
    float sumValue92 = dFdyCoarse((-0.0) - quotientValue23);
    float inverseLengthValue11 = inversesqrt(dot(vec3(sumValue90, sumValue91, sumValue92), vec3(sumValue90, sumValue91, sumValue92)));
    float productValue103 = inverseLengthValue11 * sumValue90;
    float productValue104 = inverseLengthValue11 * sumValue91;
    float productValue105 = inverseLengthValue11 * sumValue92;
    float productValue106 = (productValue105 * productValue101) - (productValue104 * productValue102);
    float productValue108 = (productValue103 * productValue102) - (productValue105 * productValue100);
    float productValue109 = (productValue104 * productValue100) - (productValue103 * productValue101);
    float inverseLengthValue12 = inversesqrt(dot(vec3(productValue106, productValue108, productValue109), vec3(productValue106, productValue108, productValue109)));
    float productValue110 = productValue106 * inverseLengthValue12;
    float productValue111 = productValue108 * inverseLengthValue12;
    float productValue112 = productValue109 * inverseLengthValue12;
    float multiplyAddValue81 = fma(fragmentVectorConstants1.packedValues[11u].x, productValue112, fma(fragmentVectorConstants1.packedValues[10u].x, productValue111, productValue110 * fragmentVectorConstants1.packedValues[9u].x));
    float multiplyAddValue82 = fma(fragmentVectorConstants1.packedValues[11u].y, productValue112, fma(fragmentVectorConstants1.packedValues[10u].y, productValue111, productValue110 * fragmentVectorConstants1.packedValues[9u].y));
    float multiplyAddValue83 = fma(fragmentVectorConstants1.packedValues[11u].z, productValue112, fma(fragmentVectorConstants1.packedValues[10u].z, productValue111, productValue110 * fragmentVectorConstants1.packedValues[9u].z));
    float inverseLengthValue13 = inversesqrt(dot(vec3(multiplyAddValue81, multiplyAddValue82, multiplyAddValue83), vec3(multiplyAddValue81, multiplyAddValue82, multiplyAddValue83)));
    float quotientValue26 = roundEven((inverseLengthValue13 * multiplyAddValue81) / fragmentVectorConstants1.packedValues[37u].x) * fragmentVectorConstants1.packedValues[37u].x;
    float quotientValue27 = roundEven((inverseLengthValue13 * multiplyAddValue82) / fragmentVectorConstants1.packedValues[37u].x) * fragmentVectorConstants1.packedValues[37u].x;
    float quotientValue28 = roundEven((inverseLengthValue13 * multiplyAddValue83) / fragmentVectorConstants1.packedValues[37u].x) * fragmentVectorConstants1.packedValues[37u].x;
    float inverseLengthValue14 = inversesqrt(dot(vec3(quotientValue26, quotientValue27, quotientValue28), vec3(quotientValue26, quotientValue27, quotientValue28)));
    float productValue113 = inverseLengthValue14 * quotientValue26;
    float productValue114 = inverseLengthValue14 * quotientValue27;
    float productValue115 = inverseLengthValue14 * quotientValue28;
    float productValue116 = fragmentVectorConstants1.packedValues[18u].z * 0.5;
    float quotientValue29 = productValue116 - (multiplyAddValue78 - (floor(multiplyAddValue78 / fragmentVectorConstants1.packedValues[18u].z) * fragmentVectorConstants1.packedValues[18u].z));
    float quotientValue30 = productValue116 - (multiplyAddValue79 - (floor(multiplyAddValue79 / fragmentVectorConstants1.packedValues[18u].z) * fragmentVectorConstants1.packedValues[18u].z));
    float quotientValue31 = productValue116 - (multiplyAddValue80 - (floor(multiplyAddValue80 / fragmentVectorConstants1.packedValues[18u].z) * fragmentVectorConstants1.packedValues[18u].z));
    float dotProductValue = dot(vec3(quotientValue29, quotientValue30, quotientValue31), vec3(productValue113, productValue114, productValue115));
    float sumValue93 = 1.0 - abs(scalarValue43);
    float scalarValue49 = abs(scalarValue44);
    float sumValue94 = sumValue93 - scalarValue49;
    bool conditionValue8 = sumValue94 < 0.0;
    float comparisonValue74 = conditionValue8 ? ((1.0 - scalarValue49) * ((scalarValue43 < 0.0) ? (-1.0) : 1.0)) : scalarValue43;
    float comparisonValue75 = conditionValue8 ? (sumValue93 * ((scalarValue44 < 0.0) ? (-1.0) : 1.0)) : scalarValue44;
    float inverseLengthValue15 = inversesqrt(dot(vec3(comparisonValue74, comparisonValue75, sumValue94), vec3(comparisonValue74, comparisonValue75, sumValue94)));
    float productValue117 = comparisonValue74 * inverseLengthValue15;
    float productValue118 = comparisonValue75 * inverseLengthValue15;
    float productValue119 = inverseLengthValue15 * sumValue94;
    float inverseLengthValue16 = inversesqrt(dot(vec3(productValue117, productValue118, productValue119), vec3(productValue117, productValue118, productValue119)));
    float productValue120 = inverseLengthValue16 * productValue117;
    float productValue121 = productValue118 * inverseLengthValue16;
    float productValue122 = inverseLengthValue16 * productValue119;
    float multiplyAddValue84 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue122, fma(fragmentVectorConstants1.packedValues[5u].x, productValue121, productValue120 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue85 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue122, fma(fragmentVectorConstants1.packedValues[5u].y, productValue121, productValue120 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue86 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue122, fma(fragmentVectorConstants1.packedValues[5u].z, productValue121, productValue120 * fragmentVectorConstants1.packedValues[4u].z));
    float inverseLengthValue17 = inversesqrt(dot(vec3(multiplyAddValue84, multiplyAddValue85, multiplyAddValue86), vec3(multiplyAddValue84, multiplyAddValue85, multiplyAddValue86)));
    float productValue123 = inverseLengthValue17 * multiplyAddValue84;
    float productValue124 = inverseLengthValue17 * multiplyAddValue85;
    float productValue125 = inverseLengthValue17 * multiplyAddValue86;
    vec4 sampledTextureValue32 = texture(sampler2D(colorMetalnessSubsurfaceTexture, colorMetalnessSubsurfaceSampler), vec2(productValue95, productValue96));
    float scalarValue50 = sampledTextureValue32.x;
    float scalarValue51 = sampledTextureValue32.y;
    float scalarValue52 = sampledTextureValue32.z;
    float scalarValue53 = sampledTextureValue32.w;
    float productValue126 = spvNClamp((scalarValue53 + (-0.501960813999176025390625)) * 2.007874011993408203125, 0.0, 1.0);
    uvec2 sampledTextureValue1 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    uvec4 sampledTextureValue34 = texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue1.x)))))) * productValue95)), uint(int(float(int(uint(int(float(int(sampledTextureValue1.y)))))) * productValue96)))), int(0u));
    uint scalarValue54 = sampledTextureValue34.y;
    uint scalarValue55 = sampledTextureValue34.z;
    float bitwiseValue24 = float((sampledTextureValue34.x >> 8u) & 255u) * 0.0039215688593685626983642578125;
    float bitwiseValue27 = float(sampledTextureValue34.w & 255u) * 0.0039215688593685626983642578125;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[28u].x != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(scalarValue50, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue51, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue52, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue50 <= 0.040449999272823333740234375) ? (scalarValue50 * 0.077399380505084991455078125) : exp2(log2((scalarValue50 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue51 <= 0.040449999272823333740234375) ? (scalarValue51 * 0.077399380505084991455078125) : exp2(log2((scalarValue51 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue52 <= 0.040449999272823333740234375) ? (scalarValue52 * 0.077399380505084991455078125) : exp2(log2((scalarValue52 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float sumValue95 = 1.0 - productValue126;
    float productValue127 = sumValue95 * 0.039999999105930328369140625;
    float productValue128 = (exponentialValue * productValue126) + productValue127;
    float productValue129 = (exponentialValue1 * productValue126) + productValue127;
    float productValue130 = (exponentialValue2 * productValue126) + productValue127;
    float nonlinearValue3 = sqrt(((quotientValue22 * quotientValue22) + (quotientValue21 * quotientValue21)) + (quotientValue23 * quotientValue23)) + 9.9999997473787516355514526367188e-05;
    float quotientValue32 = quotientValue21 / nonlinearValue3;
    float quotientValue33 = quotientValue22 / nonlinearValue3;
    float quotientValue34 = quotientValue23 / nonlinearValue3;
    float sumValue96 = (-0.0) - quotientValue32;
    float sumValue97 = (-0.0) - quotientValue33;
    float sumValue98 = (-0.0) - quotientValue34;
    float productValue131 = fragmentVectorConstants1.packedValues[41u].x * spvNClamp((0.4980392158031463623046875 - scalarValue53) * 2.007874011993408203125, 0.0, 1.0);
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if (scalarValue45 != 1.0)
    {
        float branchMergedValue5;
        float branchMergedValue10;
        float branchMergedValue11;
        float branchMergedValue12;
        float branchMergedValue13;
        float branchMergedValue14;
        if (fragmentVectorConstants1.packedValues[22u].z != 0.0)
        {
            bool conditionValue9 = int(uint(int(fragmentVectorConstants1.packedValues[18u].y))) > int(0u);
            float comparisonValue76 = conditionValue9 ? (((quotientValue29 + multiplyAddValue78) - (dotProductValue * productValue113)) + fragmentVectorConstants1.packedValues[26u].x) : multiplyAddValue75;
            float comparisonValue77 = conditionValue9 ? (((multiplyAddValue79 - (dotProductValue * productValue114)) + quotientValue30) + fragmentVectorConstants1.packedValues[26u].y) : multiplyAddValue76;
            float comparisonValue78 = conditionValue9 ? (((multiplyAddValue80 - (dotProductValue * productValue115)) + quotientValue31) + fragmentVectorConstants1.packedValues[26u].z) : multiplyAddValue77;
            float productValue132 = fragmentVectorConstants1.packedValues[24u].z * sumValue89;
            float productValue133 = productValue132 * fragmentVectorConstants1.packedValues[24u].w;
            float intermediateValue22;
            if (fragmentVectorConstants1.packedValues[24u].x > sumValue89)
            {
                intermediateValue22 = 0.0;
            }
            else
            {
                float branchMergedValue6;
                if (fragmentVectorConstants1.packedValues[24u].y > sumValue89)
                {
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    branchMergedValue6 = spvNMin(floor(spvNMin(spvNMax((log2(sumValue89) - fragmentVectorConstants1.packedValues[30u].z) * fragmentVectorConstants1.packedValues[30u].x, 0.0), 1.0) * (fragmentVectorConstants1.packedValues[27u].z + (-2.0))) + 2.0, fragmentVectorConstants1.packedValues[27u].z + (-1.0));
                }
                intermediateValue22 = branchMergedValue6;
            }
            float quotientValue35 = spvNMin(floor(spvNMin(spvNMax((productValue133 + quotientValue21) / (productValue133 * 2.0), 0.0), 1.0) * fragmentVectorConstants1.packedValues[27u].x), fragmentVectorConstants1.packedValues[27u].x + (-1.0));
            float quotientValue36 = spvNMin(floor(spvNMin(spvNMax((productValue132 + quotientValue22) / (productValue132 * 2.0), 0.0), 1.0) * fragmentVectorConstants1.packedValues[27u].y), fragmentVectorConstants1.packedValues[27u].y + (-1.0));
            uint intermediateValue23;
            bool intermediateValue25;
            uint intermediateValue26;
            if ((intermediateValue22 >= fragmentVectorConstants1.packedValues[27u].z) || ((quotientValue36 >= fragmentVectorConstants1.packedValues[27u].y) || ((quotientValue35 >= fragmentVectorConstants1.packedValues[27u].x) || ((intermediateValue22 < 0.0) || ((quotientValue35 < 0.0) || (quotientValue36 < 0.0))))))
            {
                intermediateValue23 = intermediateValue24;
                intermediateValue25 = false;
                intermediateValue26 = 0u;
            }
            else
            {
                uint scalarValue56 = uint(int(fragmentVectorConstants1.packedValues[27u].w));
                uint productValue134 = uint(int(((quotientValue36 + (intermediateValue22 * fragmentVectorConstants1.packedValues[27u].y)) * fragmentVectorConstants1.packedValues[27u].x) + quotientValue35)) * scalarValue56;
                intermediateValue23 = productValue134;
                intermediateValue25 = true;
                intermediateValue26 = productValue134 + scalarValue56;
            }
            float intermediateValue28;
            float intermediateValue30;
            float intermediateValue32;
            float intermediateValue34;
            float intermediateValue36;
            float intermediateValue38;
            if (intermediateValue25 && (int(intermediateValue23) < int(intermediateValue26)))
            {
                float intermediateValue50;
                float quotientValue16;
                float dotProductValue3;
                float sumValue18;
                float sumValue19;
                float sumValue20;
                float quotientValue18;
                float quotientValue19;
                float quotientValue20;
                float intermediateValue53;
                float intermediateValue54;
                float intermediateValue55;
                float intermediateValue56;
                float intermediateValue58;
                float intermediateValue29;
                float intermediateValue31;
                float intermediateValue33;
                float intermediateValue35;
                float intermediateValue37;
                float intermediateValue39;
                float scalarValue57 = 0.0;
                float scalarValue58 = 0.0;
                float scalarValue59 = 0.0;
                float scalarValue60 = 0.0;
                float scalarValue61 = 0.0;
                float scalarValue62 = 0.0;
                uint scalarValue63 = intermediateValue23;
                uint sampledTextureValue5;
                for (;;)
                {
                    sampledTextureValue5 = uint(int(uintBitsToFloat(texelFetch(zLightLookupArray, int(scalarValue63)).x)));
                    if (int(sampledTextureValue5) < int(0u))
                    {
                        intermediateValue29 = scalarValue57;
                        intermediateValue31 = scalarValue58;
                        intermediateValue33 = scalarValue59;
                        intermediateValue35 = scalarValue60;
                        intermediateValue37 = scalarValue61;
                        intermediateValue39 = scalarValue62;
                        break;
                    }
                    else
                    {
                        uint productValue135 = sampledTextureValue5 * 32u;
                        vec4 sampledTextureValue36 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue135)).x, texelFetch(zLights, int(productValue135 + 1u)).x, texelFetch(zLights, int(productValue135 + 2u)).x, texelFetch(zLights, int(productValue135 + 3u)).x));
                        float scalarValue64 = sampledTextureValue36.x;
                        float scalarValue65 = sampledTextureValue36.y;
                        float scalarValue66 = sampledTextureValue36.z;
                        float multiplyAddValue87 = fma(fragmentVectorConstants1.packedValues[6u].x, scalarValue66, fma(fragmentVectorConstants1.packedValues[5u].x, scalarValue65, scalarValue64 * fragmentVectorConstants1.packedValues[4u].x)) + (fragmentVectorConstants1.packedValues[7u].x - quotientValue21);
                        float multiplyAddValue88 = fma(fragmentVectorConstants1.packedValues[6u].y, scalarValue66, fma(fragmentVectorConstants1.packedValues[5u].y, scalarValue65, scalarValue64 * fragmentVectorConstants1.packedValues[4u].y)) + (fragmentVectorConstants1.packedValues[7u].y - quotientValue22);
                        float multiplyAddValue89 = fma(fragmentVectorConstants1.packedValues[6u].z, scalarValue66, fma(fragmentVectorConstants1.packedValues[5u].z, scalarValue65, scalarValue64 * fragmentVectorConstants1.packedValues[4u].z)) + (fragmentVectorConstants1.packedValues[7u].z - quotientValue23);
                        float inverseLengthValue18 = inversesqrt(dot(vec3(multiplyAddValue87, multiplyAddValue88, multiplyAddValue89), vec3(multiplyAddValue87, multiplyAddValue88, multiplyAddValue89)));
                        float productValue136 = inverseLengthValue18 * multiplyAddValue87;
                        float productValue137 = inverseLengthValue18 * multiplyAddValue88;
                        float productValue138 = inverseLengthValue18 * multiplyAddValue89;
                        float dotProductValue1 = dot(vec3(productValue123, productValue124, productValue125), vec3(productValue136, productValue137, productValue138));
                        intermediateValue50 = spvNMax(dotProductValue1, 0.0);
                        float dotProductValue2 = spvNMax(dot(vec3(productValue123, productValue124, productValue125), vec3(sumValue96, sumValue97, sumValue98)), 0.0);
                        float sumValue99 = fragmentVectorConstants1.packedValues[41u].y + 1.0;
                        float productValue139 = sumValue99 * sumValue99;
                        quotientValue16 = ((spvNMax((dotProductValue1 + fragmentVectorConstants1.packedValues[41u].y) / productValue139, 0.0) - intermediateValue50) * productValue131) + intermediateValue50;
                        dotProductValue3 = spvNMax((dot(vec3((-0.0) - productValue123, (-0.0) - productValue124, (-0.0) - productValue125), vec3(productValue136, productValue137, productValue138)) + fragmentVectorConstants1.packedValues[41u].y) / productValue139, 0.0) * productValue131;
                        float sumValue100 = productValue136 - quotientValue32;
                        float sumValue101 = productValue137 - quotientValue33;
                        float sumValue102 = productValue138 - quotientValue34;
                        float inverseLengthValue19 = inversesqrt(dot(vec3(sumValue100, sumValue101, sumValue102), vec3(sumValue100, sumValue101, sumValue102)));
                        float productValue140 = inverseLengthValue19 * sumValue100;
                        float productValue141 = inverseLengthValue19 * sumValue101;
                        float productValue142 = inverseLengthValue19 * sumValue102;
                        float scalarValue67 = spvNMax(bitwiseValue24, 0.0500000007450580596923828125);
                        float productValue143 = scalarValue67 * scalarValue67;
                        float productValue144 = productValue143 * productValue143;
                        float dotProductValue4 = spvNMax(dot(vec3(productValue123, productValue124, productValue125), vec3(productValue140, productValue141, productValue142)), 0.0);
                        float productValue145 = ((dotProductValue4 * dotProductValue4) * (productValue144 + (-1.0))) + 1.0;
                        float productValue146 = productValue143 * 0.5;
                        float sumValue103 = 1.0 - productValue146;
                        float sumValue104 = productValue146 + 9.9999997473787516355514526367188e-05;
                        float dotProductValue5 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue96, sumValue97, sumValue98), vec3(productValue140, productValue141, productValue142)), 0.0), 0.0, 1.0);
                        float productValue147 = dotProductValue5 * dotProductValue5;
                        float productValue148 = (productValue147 * productValue147) * dotProductValue5;
                        float productValue149 = (productValue148 * (1.0 - productValue128)) + productValue128;
                        float productValue150 = (productValue148 * (1.0 - productValue129)) + productValue129;
                        float productValue151 = (productValue148 * (1.0 - productValue130)) + productValue130;
                        sumValue18 = 1.0 - productValue149;
                        sumValue19 = 1.0 - productValue150;
                        sumValue20 = 1.0 - productValue151;
                        float quotientValue37 = ((dotProductValue2 / ((sumValue103 * dotProductValue2) + sumValue104)) * (productValue144 / ((productValue145 * productValue145) * 3.1415927410125732421875))) * (intermediateValue50 / ((sumValue103 * intermediateValue50) + sumValue104));
                        float productValue152 = ((intermediateValue50 * 4.0) * dotProductValue2) + 9.9999997473787516355514526367188e-05;
                        quotientValue18 = (productValue149 * quotientValue37) / productValue152;
                        quotientValue19 = (productValue150 * quotientValue37) / productValue152;
                        quotientValue20 = (productValue151 * quotientValue37) / productValue152;
                        float sumValue105 = scalarValue64 - multiplyAddValue75;
                        float sumValue106 = scalarValue65 - multiplyAddValue76;
                        float sumValue107 = scalarValue66 - multiplyAddValue77;
                        float productValue68;
                        if (fragmentVectorConstants1.packedValues[21u].x > 0.0)
                        {
                            float sumValue108 = (abs(sumValue106) + abs(sumValue105)) + abs(sumValue107);
                            productValue68 = sumValue108 * sumValue108;
                        }
                        else
                        {
                            productValue68 = dot(vec3(sumValue105, sumValue106, sumValue107), vec3(sumValue105, sumValue106, sumValue107));
                        }
                        float scalarValue68 = sampledTextureValue36.w;
                        float productValue153 = scalarValue68 * scalarValue68;
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        float branchMergedValue4;
                        if (!(productValue68 >= productValue153))
                        {
                            float intermediateValue57;
                            float intermediateValue59;
                            if (fragmentVectorConstants1.packedValues[22u].z != 0.0)
                            {
                                uint productValue154 = (sampledTextureValue5 * 32u) + 8u;
                                vec4 sampledTextureValue38 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue154)).x, texelFetch(zLights, int(productValue154 + 1u)).x, texelFetch(zLights, int(productValue154 + 2u)).x, texelFetch(zLights, int(productValue154 + 3u)).x));
                                uint productValue155 = (sampledTextureValue5 * 32u) + 12u;
                                vec4 sampledTextureValue40 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue155)).x, texelFetch(zLights, int(productValue155 + 1u)).x, texelFetch(zLights, int(productValue155 + 2u)).x, texelFetch(zLights, int(productValue155 + 3u)).x));
                                uint productValue156 = (sampledTextureValue5 * 32u) + 16u;
                                vec4 sampledTextureValue41 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue156)).x, texelFetch(zLights, int(productValue156 + 1u)).x, texelFetch(zLights, int(productValue156 + 2u)).x, texelFetch(zLights, int(productValue156 + 3u)).x));
                                uint productValue157 = (sampledTextureValue5 * 32u) + 20u;
                                vec4 sampledTextureValue42 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue157)).x, texelFetch(zLights, int(productValue157 + 1u)).x, texelFetch(zLights, int(productValue157 + 2u)).x, texelFetch(zLights, int(productValue157 + 3u)).x));
                                uint productValue158 = (sampledTextureValue5 * 32u) + 24u;
                                vec4 sampledTextureValue43 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue158)).x, texelFetch(zLights, int(productValue158 + 1u)).x, texelFetch(zLights, int(productValue158 + 2u)).x, texelFetch(zLights, int(productValue158 + 3u)).x));
                                uint productValue159 = (sampledTextureValue5 * 32u) + 28u;
                                vec4 sampledTextureValue44 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue159)).x, texelFetch(zLights, int(productValue159 + 1u)).x, texelFetch(zLights, int(productValue159 + 2u)).x, texelFetch(zLights, int(productValue159 + 3u)).x));
                                float sumValue109 = comparisonValue76 - scalarValue64;
                                float sumValue110 = comparisonValue77 - scalarValue65;
                                float sumValue111 = comparisonValue78 - scalarValue66;
                                float scalarValue69 = abs(sumValue109);
                                float scalarValue70 = abs(sumValue110);
                                float scalarValue71 = abs(sumValue111);
                                uint comparisonValue5;
                                if ((scalarValue69 >= scalarValue70) && (scalarValue69 >= scalarValue71))
                                {
                                    comparisonValue5 = uint(!(sumValue109 >= 0.0));
                                }
                                else
                                {
                                    uint branchMergedValue8;
                                    if (!(scalarValue70 >= scalarValue71))
                                    {
                                        branchMergedValue8 = (sumValue111 >= 0.0) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue8 = (sumValue110 >= 0.0) ? 2u : 3u;
                                    }
                                    comparisonValue5 = branchMergedValue8;
                                }
                                float sumValue112 = (-0.0) - sumValue109;
                                float intermediateValue63;
                                float intermediateValue64;
                                float intermediateValue65;
                                float intermediateValue66;
                                float sumValue29;
                                float intermediateValue67;
                                float intermediateValue68;
                                if (comparisonValue5 == 1u)
                                {
                                    intermediateValue63 = sampledTextureValue40.x;
                                    intermediateValue64 = sampledTextureValue40.y;
                                    intermediateValue65 = sampledTextureValue40.z;
                                    intermediateValue66 = sampledTextureValue40.w;
                                    sumValue29 = (-0.0) - sumValue111;
                                    intermediateValue67 = sumValue110;
                                    intermediateValue68 = sumValue109;
                                }
                                else
                                {
                                    float branchMergedValue9;
                                    float branchMergedValue16;
                                    float branchMergedValue17;
                                    float branchMergedValue18;
                                    float branchMergedValue19;
                                    float branchMergedValue20;
                                    float branchMergedValue21;
                                    if (comparisonValue5 == 2u)
                                    {
                                        branchMergedValue9 = sampledTextureValue41.x;
                                        branchMergedValue16 = (-0.0) - sumValue110;
                                        branchMergedValue17 = sumValue112;
                                        branchMergedValue18 = (-0.0) - sumValue111;
                                        branchMergedValue19 = sampledTextureValue41.w;
                                        branchMergedValue20 = sampledTextureValue41.z;
                                        branchMergedValue21 = sampledTextureValue41.y;
                                    }
                                    else
                                    {
                                        float branchMergedValue23;
                                        float branchMergedValue25;
                                        float branchMergedValue26;
                                        float branchMergedValue27;
                                        float branchMergedValue28;
                                        float branchMergedValue29;
                                        float branchMergedValue30;
                                        if (comparisonValue5 == 3u)
                                        {
                                            branchMergedValue23 = sampledTextureValue42.x;
                                            branchMergedValue25 = sumValue110;
                                            branchMergedValue26 = sumValue112;
                                            branchMergedValue27 = sumValue111;
                                            branchMergedValue28 = sampledTextureValue42.w;
                                            branchMergedValue29 = sampledTextureValue42.z;
                                            branchMergedValue30 = sampledTextureValue42.y;
                                        }
                                        else
                                        {
                                            float branchMergedValue31;
                                            float branchMergedValue32;
                                            float branchMergedValue33;
                                            float branchMergedValue34;
                                            float branchMergedValue35;
                                            float branchMergedValue36;
                                            float branchMergedValue37;
                                            if (comparisonValue5 == 4u)
                                            {
                                                branchMergedValue31 = sampledTextureValue43.x;
                                                branchMergedValue32 = (-0.0) - sumValue111;
                                                branchMergedValue33 = sumValue112;
                                                branchMergedValue34 = sumValue110;
                                                branchMergedValue35 = sampledTextureValue43.w;
                                                branchMergedValue36 = sampledTextureValue43.z;
                                                branchMergedValue37 = sampledTextureValue43.y;
                                            }
                                            else
                                            {
                                                bool comparisonValue79 = comparisonValue5 == 5u;
                                                branchMergedValue31 = comparisonValue79 ? sampledTextureValue44.x : sampledTextureValue38.x;
                                                branchMergedValue32 = comparisonValue79 ? sumValue111 : sumValue112;
                                                branchMergedValue33 = comparisonValue79 ? sumValue109 : sumValue111;
                                                branchMergedValue34 = sumValue110;
                                                branchMergedValue35 = comparisonValue79 ? sampledTextureValue44.w : sampledTextureValue38.w;
                                                branchMergedValue36 = comparisonValue79 ? sampledTextureValue44.z : sampledTextureValue38.z;
                                                branchMergedValue37 = comparisonValue79 ? sampledTextureValue44.y : sampledTextureValue38.y;
                                            }
                                            branchMergedValue23 = branchMergedValue31;
                                            branchMergedValue25 = branchMergedValue32;
                                            branchMergedValue26 = branchMergedValue33;
                                            branchMergedValue27 = branchMergedValue34;
                                            branchMergedValue28 = branchMergedValue35;
                                            branchMergedValue29 = branchMergedValue36;
                                            branchMergedValue30 = branchMergedValue37;
                                        }
                                        branchMergedValue9 = branchMergedValue23;
                                        branchMergedValue16 = branchMergedValue25;
                                        branchMergedValue17 = branchMergedValue26;
                                        branchMergedValue18 = branchMergedValue27;
                                        branchMergedValue19 = branchMergedValue28;
                                        branchMergedValue20 = branchMergedValue29;
                                        branchMergedValue21 = branchMergedValue30;
                                    }
                                    intermediateValue63 = branchMergedValue9;
                                    intermediateValue64 = branchMergedValue21;
                                    intermediateValue65 = branchMergedValue20;
                                    intermediateValue66 = branchMergedValue19;
                                    sumValue29 = branchMergedValue17;
                                    intermediateValue67 = branchMergedValue18;
                                    intermediateValue68 = branchMergedValue16;
                                }
                                float branchMergedValue7;
                                float branchMergedValue15;
                                if ((intermediateValue65 == 0.0) && (intermediateValue66 == 0.0))
                                {
                                    branchMergedValue7 = 1.0;
                                    branchMergedValue15 = 0.0;
                                }
                                else
                                {
                                    float multiplyAddValue90 = fma(fragmentVectorConstants1.packedValues[2u].w, intermediateValue68, fma(fragmentVectorConstants1.packedValues[1u].w, intermediateValue67, fragmentVectorConstants1.packedValues[0u].w * sumValue29)) + fragmentVectorConstants1.packedValues[3u].w;
                                    float inverseLengthValue20 = inversesqrt(dot(vec3(productValue120, productValue121, productValue122), vec3(productValue120, productValue121, productValue122)));
                                    float sumValue113 = (-0.0) - sumValue110;
                                    float sumValue114 = (-0.0) - sumValue111;
                                    float inverseLengthValue21 = inversesqrt(dot(vec3(sumValue112, sumValue113, sumValue114), vec3(sumValue112, sumValue113, sumValue114)));
                                    float dotProductValue7 = spvNMin(spvNMax(dot(vec3(inverseLengthValue21 * sumValue112, inverseLengthValue21 * sumValue113, inverseLengthValue21 * sumValue114), vec3(inverseLengthValue20 * productValue120, inverseLengthValue20 * productValue121, inverseLengthValue20 * productValue122)), fragmentVectorConstants1.packedValues[36u].x), 1.0);
                                    float sumValue115 = intermediateValue65 - intermediateValue63;
                                    float productValue160 = fragmentVectorConstants1.packedValues[17u].x * sumValue115;
                                    float multiplyAddValue91 = (fma(fragmentVectorConstants1.packedValues[2u].x, intermediateValue68, fma(fragmentVectorConstants1.packedValues[1u].x, intermediateValue67, fragmentVectorConstants1.packedValues[0u].x * sumValue29)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue90;
                                    float multiplyAddValue92 = (fma(fragmentVectorConstants1.packedValues[2u].y, intermediateValue68, fma(fragmentVectorConstants1.packedValues[1u].y, intermediateValue67, fragmentVectorConstants1.packedValues[0u].y * sumValue29)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue90;
                                    float quotientValue11 = 0.5 / fragmentVectorConstants1.packedValues[17u].x;
                                    float quotientValue12 = 0.5 / fragmentVectorConstants1.packedValues[17u].y;
                                    float sumValue116 = intermediateValue66 - intermediateValue64;
                                    float productValue161 = fragmentVectorConstants1.packedValues[17u].y * sumValue116;
                                    vec4 sampledTextureValue45 = textureLod(sampler2D(pointLightShadowTextureAtlasTexture, pointLightShadowTextureAtlasSampler), vec2(spvNMin(spvNMax((((floor(((multiplyAddValue91 * 0.5) + 0.5) * productValue160) + 0.5) / productValue160) * sumValue115) + intermediateValue63, quotientValue11 + intermediateValue63), intermediateValue65 - quotientValue11), spvNMin(spvNMax((((floor((0.5 - (multiplyAddValue92 * 0.5)) * productValue161) + 0.5) / productValue161) * sumValue116) + intermediateValue64, quotientValue12 + intermediateValue64), intermediateValue66 - quotientValue12)), 0.0);
                                    float scalarValue72 = sampledTextureValue45.x;
                                    float multiplyAddValue93 = float(scalarValue72 >= (((fma(fragmentVectorConstants1.packedValues[2u].z, intermediateValue68, fma(fragmentVectorConstants1.packedValues[1u].z, intermediateValue67, fragmentVectorConstants1.packedValues[0u].z * sumValue29)) + fragmentVectorConstants1.packedValues[3u].z) - ((fragmentVectorConstants1.packedValues[17u].z / spvNMax(productValue160, 1.0)) * (((sqrt(1.0 - (dotProductValue7 * dotProductValue7)) / dotProductValue7) * fragmentVectorConstants1.packedValues[8u].y) + fragmentVectorConstants1.packedValues[8u].x))) / multiplyAddValue90));
                                    float branchMergedValue22;
                                    float branchMergedValue24;
                                    if (productValue131 > 0.0)
                                    {
                                        float multiplyAddValue94 = fma(fragmentVectorConstants1.packedValues[34u].w, scalarValue72, fma(fragmentVectorConstants1.packedValues[33u].w, multiplyAddValue92, fragmentVectorConstants1.packedValues[32u].w * multiplyAddValue91)) + fragmentVectorConstants1.packedValues[35u].w;
                                        float multiplyAddValue95 = (fma(fragmentVectorConstants1.packedValues[34u].x, scalarValue72, fma(fragmentVectorConstants1.packedValues[33u].x, multiplyAddValue92, fragmentVectorConstants1.packedValues[32u].x * multiplyAddValue91)) + fragmentVectorConstants1.packedValues[35u].x) / multiplyAddValue94;
                                        float multiplyAddValue96 = (fma(fragmentVectorConstants1.packedValues[34u].y, scalarValue72, fma(fragmentVectorConstants1.packedValues[33u].y, multiplyAddValue92, fragmentVectorConstants1.packedValues[32u].y * multiplyAddValue91)) + fragmentVectorConstants1.packedValues[35u].y) / multiplyAddValue94;
                                        float multiplyAddValue97 = (fma(fragmentVectorConstants1.packedValues[34u].z, scalarValue72, fma(fragmentVectorConstants1.packedValues[33u].z, multiplyAddValue92, fragmentVectorConstants1.packedValues[32u].z * multiplyAddValue91)) + fragmentVectorConstants1.packedValues[35u].z) / multiplyAddValue94;
                                        float nonlinearValue4 = spvNClamp((sqrt(((intermediateValue67 * intermediateValue67) + (sumValue29 * sumValue29)) + (intermediateValue68 * intermediateValue68)) - sqrt(((multiplyAddValue96 * multiplyAddValue96) + (multiplyAddValue95 * multiplyAddValue95)) + (multiplyAddValue97 * multiplyAddValue97))) * fragmentVectorConstants1.packedValues[41u].z, 0.0, 1.0);
                                        branchMergedValue22 = 1.0 - ((nonlinearValue4 * nonlinearValue4) * (3.0 - (nonlinearValue4 * 2.0)));
                                        branchMergedValue24 = multiplyAddValue93;
                                    }
                                    else
                                    {
                                        branchMergedValue22 = 1.0;
                                        branchMergedValue24 = multiplyAddValue93;
                                    }
                                    branchMergedValue7 = branchMergedValue22;
                                    branchMergedValue15 = branchMergedValue24;
                                }
                                intermediateValue57 = branchMergedValue15;
                                intermediateValue59 = branchMergedValue7;
                            }
                            else
                            {
                                intermediateValue57 = 1.0;
                                intermediateValue59 = 1.0;
                            }
                            uint productValue162 = (sampledTextureValue5 * 32u) + 4u;
                            vec4 sampledTextureValue46 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue162)).x, texelFetch(zLights, int(productValue162 + 1u)).x, texelFetch(zLights, int(productValue162 + 2u)).x, texelFetch(zLights, int(productValue162 + 3u)).x));
                            float quotientValue38 = productValue68 / (productValue153 + 9.9999997473787516355514526367188e-05);
                            float productValue163 = spvNClamp(1.0 - (quotientValue38 * quotientValue38), 0.0, 1.0);
                            float quotientValue39 = (productValue163 * productValue163) * (1.0 / spvNMax(productValue68, 0.100000001490116119384765625));
                            float productValue82;
                            if (fragmentVectorConstants1.packedValues[20u].x > 0.0)
                            {
                                float quotientValue40 = spvNClamp(((1.0 - quotientValue39) - fragmentVectorConstants1.packedValues[31u].x) / (fragmentVectorConstants1.packedValues[31u].y - fragmentVectorConstants1.packedValues[31u].x), 0.0, 1.0);
                                productValue82 = spvNClamp((((quotientValue40 * quotientValue40) * fragmentVectorConstants1.packedValues[31u].z) * (3.0 - (quotientValue40 * 2.0))) + fragmentVectorConstants1.packedValues[31u].w, 0.0, 1.0) * quotientValue39;
                            }
                            else
                            {
                                productValue82 = quotientValue39;
                            }
                            float productValue164 = productValue82 * sampledTextureValue46.w;
                            branchMergedValue = intermediateValue59;
                            branchMergedValue1 = intermediateValue57;
                            branchMergedValue2 = productValue164 * sampledTextureValue46.z;
                            branchMergedValue3 = productValue164 * sampledTextureValue46.x;
                            branchMergedValue4 = productValue164 * sampledTextureValue46.y;
                        }
                        else
                        {
                            branchMergedValue = 1.0;
                            branchMergedValue1 = 1.0;
                            branchMergedValue2 = 0.0;
                            branchMergedValue3 = 0.0;
                            branchMergedValue4 = 0.0;
                        }
                        intermediateValue58 = branchMergedValue;
                        intermediateValue56 = branchMergedValue1;
                        intermediateValue55 = branchMergedValue2;
                        intermediateValue53 = branchMergedValue3;
                        intermediateValue54 = branchMergedValue4;
                        float productValue165 = intermediateValue56 * quotientValue16;
                        float productValue166 = dotProductValue3 * intermediateValue58;
                        float productValue167 = sumValue95 * 0.3183098733425140380859375;
                        float productValue168 = (((productValue167 * intermediateValue53) * (productValue166 + (productValue165 * sumValue18))) * fragmentVectorConstants1.packedValues[29u].x) + scalarValue60;
                        float productValue169 = (((productValue167 * intermediateValue54) * (productValue166 + (productValue165 * sumValue19))) * fragmentVectorConstants1.packedValues[29u].x) + scalarValue61;
                        float productValue170 = (((productValue167 * intermediateValue55) * (productValue166 + (productValue165 * sumValue20))) * fragmentVectorConstants1.packedValues[29u].x) + scalarValue62;
                        float productValue171 = fragmentVectorConstants1.packedValues[29u].y * (intermediateValue56 * intermediateValue50);
                        float productValue172 = ((productValue171 * quotientValue18) * intermediateValue53) + scalarValue57;
                        float productValue173 = ((productValue171 * quotientValue19) * intermediateValue54) + scalarValue58;
                        float productValue174 = ((productValue171 * quotientValue20) * intermediateValue55) + scalarValue59;
                        uint sumValue117 = scalarValue63 + 1u;
                        if (int(sumValue117) < int(intermediateValue26))
                        {
                            scalarValue57 = productValue172;
                            scalarValue58 = productValue173;
                            scalarValue59 = productValue174;
                            scalarValue60 = productValue168;
                            scalarValue61 = productValue169;
                            scalarValue62 = productValue170;
                            scalarValue63 = sumValue117;
                            continue;
                        }
                        else
                        {
                            intermediateValue29 = productValue172;
                            intermediateValue31 = productValue173;
                            intermediateValue33 = productValue174;
                            intermediateValue35 = productValue168;
                            intermediateValue37 = productValue169;
                            intermediateValue39 = productValue170;
                            break;
                        }
                    }
                }
                intermediateValue28 = intermediateValue29;
                intermediateValue30 = intermediateValue31;
                intermediateValue32 = intermediateValue33;
                intermediateValue34 = intermediateValue35;
                intermediateValue36 = intermediateValue37;
                intermediateValue38 = intermediateValue39;
            }
            else
            {
                intermediateValue28 = 0.0;
                intermediateValue30 = 0.0;
                intermediateValue32 = 0.0;
                intermediateValue34 = 0.0;
                intermediateValue36 = 0.0;
                intermediateValue38 = 0.0;
            }
            float sumValue118 = 1.0 - fragmentVectorConstants1.packedValues[42u].x;
            branchMergedValue5 = sumValue118 * intermediateValue28;
            branchMergedValue10 = sumValue118 * intermediateValue38;
            branchMergedValue11 = sumValue118 * intermediateValue36;
            branchMergedValue12 = sumValue118 * intermediateValue34;
            branchMergedValue13 = sumValue118 * intermediateValue32;
            branchMergedValue14 = sumValue118 * intermediateValue30;
        }
        else
        {
            branchMergedValue5 = 0.0;
            branchMergedValue10 = 0.0;
            branchMergedValue11 = 0.0;
            branchMergedValue12 = 0.0;
            branchMergedValue13 = 0.0;
            branchMergedValue14 = 0.0;
        }
        intermediateValue14 = branchMergedValue5;
        intermediateValue15 = branchMergedValue14;
        intermediateValue16 = branchMergedValue13;
        intermediateValue17 = branchMergedValue12;
        intermediateValue18 = branchMergedValue11;
        intermediateValue19 = branchMergedValue10;
    }
    else
    {
        intermediateValue14 = 0.0;
        intermediateValue15 = 0.0;
        intermediateValue16 = 0.0;
        intermediateValue17 = 0.0;
        intermediateValue18 = 0.0;
        intermediateValue19 = 0.0;
    }
    float bitwiseValue28 = (float(scalarValue55 & 255u) * 9.2272217443678528070449829101562e-05) * fragmentVectorConstants1.packedValues[19u].w;
    float productValue175 = bitwiseValue27 * bitwiseValue27;
    float productValue176 = productValue175 * productValue175;
    float productValue177 = (((fragmentVectorConstants1.packedValues[25u].y * (productValue175 - productValue176)) + productValue176) * bitwiseValue27) * fragmentVectorConstants1.packedValues[39u].w;
    float productValue178 = fragmentVectorConstants1.packedValues[29u].w * sumValue95;
    float productValue179 = scalarValue45 * 65535.0;
    float scalarValue73 = floor(productValue179);
    fragmentColor0.x = (scalarValue43 * 0.5) + 0.5;
    fragmentColor0.y = (scalarValue44 * 0.5) + 0.5;
    fragmentColor0.z = scalarValue73 * 1.525902189314365386962890625e-05;
    fragmentColor0.w = productValue179 - scalarValue73;
    fragmentColor1.x = (productValue178 * spvNMax((bitwiseValue28 * float((scalarValue54 >> 8u) & 255u)) + (productValue177 * fragmentVectorConstants1.packedValues[39u].x), fragmentVectorConstants1.packedValues[23u].x * fragmentVectorConstants1.packedValues[23u].w)) + intermediateValue17;
    fragmentColor1.y = (productValue178 * spvNMax((bitwiseValue28 * float(scalarValue54 & 255u)) + (productValue177 * fragmentVectorConstants1.packedValues[39u].y), fragmentVectorConstants1.packedValues[23u].y * fragmentVectorConstants1.packedValues[23u].w)) + intermediateValue18;
    fragmentColor1.z = (productValue178 * spvNMax((bitwiseValue28 * float((scalarValue55 >> 8u) & 255u)) + (productValue177 * fragmentVectorConstants1.packedValues[39u].z), fragmentVectorConstants1.packedValues[23u].z * fragmentVectorConstants1.packedValues[23u].w)) + intermediateValue19;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue180 = (floor(fragmentVectorConstants1.packedValues[15u].x * varyingTexCoord0.x) + 0.5) * fragmentVectorConstants1.packedValues[15u].z;
    float productValue181 = (floor(fragmentVectorConstants1.packedValues[15u].y * varyingTexCoord0.y) + 0.5) * fragmentVectorConstants1.packedValues[15u].w;
    vec4 sampledTextureValue47 = texture(sampler2D(normalTexture, normalSampler), vec2(productValue180, productValue181));
    float scalarValue74 = sampledTextureValue47.x;
    float scalarValue75 = sampledTextureValue47.y;
    vec4 sampledTextureValue48 = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(productValue180, productValue181));
    float scalarValue76 = sampledTextureValue48.x;
    float productValue182 = (scalarValue76 * fragmentVectorConstants1.packedValues[6u].w) + fragmentVectorConstants1.packedValues[7u].w;
    float quotientValue41 = (((productValue180 * 2.0) + (-1.0)) * fragmentVectorConstants1.packedValues[4u].x) / productValue182;
    float quotientValue42 = ((((1.0 - productValue181) * 2.0) + (-1.0)) * fragmentVectorConstants1.packedValues[5u].y) / productValue182;
    float quotientValue43 = fragmentVectorConstants1.packedValues[7u].z / productValue182;
    float sumValue119 = 1.0 - abs(scalarValue74);
    float scalarValue77 = abs(scalarValue75);
    float sumValue120 = sumValue119 - scalarValue77;
    bool conditionValue10 = sumValue120 < 0.0;
    float comparisonValue80 = conditionValue10 ? ((1.0 - scalarValue77) * ((scalarValue74 < 0.0) ? (-1.0) : 1.0)) : scalarValue74;
    float comparisonValue81 = conditionValue10 ? (sumValue119 * ((scalarValue75 < 0.0) ? (-1.0) : 1.0)) : scalarValue75;
    float inverseLengthValue22 = inversesqrt(dot(vec3(comparisonValue80, comparisonValue81, sumValue120), vec3(comparisonValue80, comparisonValue81, sumValue120)));
    float productValue183 = comparisonValue80 * inverseLengthValue22;
    float productValue184 = comparisonValue81 * inverseLengthValue22;
    float productValue185 = inverseLengthValue22 * sumValue120;
    float inverseLengthValue23 = inversesqrt(dot(vec3(productValue183, productValue184, productValue185), vec3(productValue183, productValue184, productValue185)));
    float productValue186 = inverseLengthValue23 * productValue183;
    float productValue187 = productValue184 * inverseLengthValue23;
    float productValue188 = inverseLengthValue23 * productValue185;
    vec4 sampledTextureValue49 = texture(sampler2D(colorMetalnessSubsurfaceTexture, colorMetalnessSubsurfaceSampler), vec2(productValue180, productValue181));
    uvec2 sampledTextureValue1 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    uvec4 sampledTextureValue50 = texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue1.x)))))) * productValue180)), uint(int(float(int(uint(int(float(int(sampledTextureValue1.y)))))) * productValue181)))), int(0u));
    uint scalarValue78 = sampledTextureValue50.y;
    uint scalarValue79 = sampledTextureValue50.z;
    uint scalarValue80 = sampledTextureValue50.w;
    float bitwiseValue29 = float(scalarValue80 & 255u) * 0.0039215688593685626983642578125;
    float bitwiseValue30 = float(scalarValue79 & 255u) * 9.2272217443678528070449829101562e-05;
    uint bitwiseValue31 = uint(floor(float((scalarValue80 >> 8u) & 255u)));
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((fragmentVectorConstants1.packedValues[14u].w != 0.0) && ((bitwiseValue31 & 1u) == 0u))
    {
        float multiplyAddValue98 = (((fragmentVectorConstants1.packedValues[3u].x + (-0.5)) + (productValue186 * 0.20000000298023223876953125)) + fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue43, fma(fragmentVectorConstants1.packedValues[1u].x, quotientValue42, quotientValue41 * fragmentVectorConstants1.packedValues[0u].x))) - fragmentVectorConstants1.packedValues[12u].x;
        float multiplyAddValue101 = (((fragmentVectorConstants1.packedValues[3u].y + (-0.5)) + (productValue187 * 0.20000000298023223876953125)) + fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue43, fma(fragmentVectorConstants1.packedValues[1u].y, quotientValue42, quotientValue41 * fragmentVectorConstants1.packedValues[0u].y))) - fragmentVectorConstants1.packedValues[12u].y;
        float multiplyAddValue102 = (((fragmentVectorConstants1.packedValues[3u].z + (-0.5)) + (productValue188 * 0.20000000298023223876953125)) + fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue43, fma(fragmentVectorConstants1.packedValues[1u].z, quotientValue42, quotientValue41 * fragmentVectorConstants1.packedValues[0u].z))) - fragmentVectorConstants1.packedValues[12u].z;
        float productValue189 = floor(multiplyAddValue98 * 0.0625) * 16.0;
        float productValue190 = floor(multiplyAddValue101 * 0.0625) * 16.0;
        float productValue191 = floor(multiplyAddValue102 * 0.0625) * 16.0;
        uint productValue192 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue98))))) * 0.0625)));
        uint productValue193 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue101))))) * 0.0625)));
        uint productValue194 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue102))))) * 0.0625)));
        float sumValue121 = multiplyAddValue98 - productValue189;
        float sumValue122 = multiplyAddValue101 - productValue190;
        float sumValue123 = multiplyAddValue102 - productValue191;
        uint bitwiseValue32 = (productValue193 << 16u) | (productValue192 & 65535u);
        uint bitwiseValue33 = productValue194 & 65535u;
        uint productValue195 = productValue192 * 1540483477u;
        uint productValue196 = productValue193 * 1540483477u;
        uint productValue197 = productValue194 * 1540483477u;
        uint bitwiseValue34 = ((((((((productValue195 >> 24u) ^ productValue195) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue196 >> 24u) ^ productValue196) * 1540483477u)) * 1540483477u) ^ (((productValue197 >> 24u) ^ productValue197) * 1540483477u)) * 1540483477u;
        uint bitwiseValue35 = ((bitwiseValue34 >> 13u) ^ bitwiseValue34) * 1540483477u;
        uint bitwiseValue36 = (bitwiseValue35 >> 15u) ^ bitwiseValue35;
        uint bitwiseValue37 = bitwiseValue36 >> 16u;
        uint bitwiseValue38 = bitwiseValue36 & 65535u;
        uint comparisonValue82 = uint(bitwiseValue38 == bitwiseValue37) | (bitwiseValue38 ^ bitwiseValue37);
        uint sumValue124 = uint(fragmentVectorConstants1.packedValues[9u].x) + 4294967295u;
        bool intermediateValue18;
        uint scalarValue81 = comparisonValue82;
        uint scalarValue82 = 0u;
        uint scalarValue83 = 0u;
        uint sampledTextureValue5;
        uint bitwiseValue10;
        for (;;)
        {
            bitwiseValue10 = scalarValue81 & sumValue124;
            uint sampledTextureValue51 = texelFetch(gpuEntryBuffer, int((bitwiseValue10 * 4u) + 2u)).x & 65535u;
            bool sampledTextureValue52 = (texelFetch(gpuEntryBuffer, int((bitwiseValue10 * 4u) + 1u)).x == bitwiseValue33) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue10 * 4u)).x == bitwiseValue32) && (sampledTextureValue51 == comparisonValue82));
            sampledTextureValue5 = sampledTextureValue52 ? texelFetch(gpuEntryBuffer, int((bitwiseValue10 * 4u) + 3u)).x : scalarValue82;
            if ((sampledTextureValue51 == 0u) || sampledTextureValue52)
            {
                intermediateValue18 = sampledTextureValue52;
                break;
            }
            else
            {
                uint sumValue125 = scalarValue83 + 1u;
                if (int(sumValue125) < int(8u))
                {
                    scalarValue81 = bitwiseValue10 + 1u;
                    scalarValue82 = sampledTextureValue5;
                    scalarValue83 = sumValue125;
                    continue;
                }
                else
                {
                    intermediateValue18 = false;
                    break;
                }
            }
        }
        uint bitwiseValue39 = sampledTextureValue5 >> 2u;
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (intermediateValue18)
        {
            float scalarValue84 = abs(productValue186);
            float scalarValue85 = abs(productValue187);
            float scalarValue86 = abs(productValue188);
            float branchMergedValue27;
            float branchMergedValue28;
            float branchMergedValue29;
            if (((bitwiseValue31 & 2u) == 0u) && (((scalarValue84 >= 1.0) || (scalarValue85 >= 1.0)) || (scalarValue86 >= 1.0)))
            {
                float intermediateValue63;
                float intermediateValue64;
                float intermediateValue65;
                float intermediateValue66;
                float intermediateValue68;
                float intermediateValue70;
                float intermediateValue72;
                float intermediateValue74;
                float intermediateValue76;
                float intermediateValue78;
                float intermediateValue79;
                float intermediateValue80;
                float productValue23;
                float productValue24;
                float productValue25;
                float sumValue7;
                float sumValue8;
                float sumValue9;
                float sumValue10;
                float sumValue11;
                float sumValue12;
                float sumValue13;
                float sumValue14;
                float sumValue15;
                float productValue26;
                float productValue27;
                float productValue28;
                float productValue29;
                bool comparisonValue4;
                for (;;)
                {
                    float dotProductValue8 = dot(vec3(sumValue121, sumValue122, sumValue123), vec3(scalarValue84, scalarValue85, scalarValue86));
                    float dotProductValue9 = dot(vec3(sumValue121, sumValue122, sumValue123), vec3(scalarValue86, scalarValue84, scalarValue85));
                    float dotProductValue10 = dot(vec3(sumValue121, sumValue122, sumValue123), vec3(scalarValue85, scalarValue86, scalarValue84));
                    float comparisonValue83 = (((inverseLengthValue23 * inverseLengthValue22) * ((comparisonValue80 + sumValue120) + comparisonValue81)) > 0.0) ? ceil(dotProductValue8) : floor(dotProductValue8);
                    float scalarValue87 = floor(dotProductValue9);
                    float scalarValue88 = floor(dotProductValue10);
                    productValue23 = ((comparisonValue83 * scalarValue84) + (scalarValue87 * scalarValue86)) + (scalarValue88 * scalarValue85);
                    productValue24 = ((comparisonValue83 * scalarValue85) + (scalarValue87 * scalarValue84)) + (scalarValue88 * scalarValue86);
                    productValue25 = ((comparisonValue83 * scalarValue86) + (scalarValue87 * scalarValue85)) + (scalarValue88 * scalarValue84);
                    sumValue7 = productValue23 + scalarValue86;
                    sumValue8 = productValue24 + scalarValue84;
                    sumValue9 = productValue25 + scalarValue85;
                    sumValue10 = productValue23 + scalarValue85;
                    sumValue11 = productValue24 + scalarValue86;
                    sumValue12 = productValue25 + scalarValue84;
                    sumValue13 = sumValue7 + scalarValue85;
                    sumValue14 = sumValue11 + scalarValue84;
                    sumValue15 = sumValue9 + scalarValue84;
                    float sumValue126 = dotProductValue9 - scalarValue87;
                    float sumValue127 = dotProductValue10 - scalarValue88;
                    float sumValue128 = 1.0 - sumValue126;
                    float sumValue129 = 1.0 - sumValue127;
                    productValue26 = sumValue129 * sumValue128;
                    productValue27 = sumValue129 * sumValue126;
                    productValue28 = sumValue128 * sumValue127;
                    productValue29 = sumValue127 * sumValue126;
                    comparisonValue4 = ((productValue25 >= 0.0) && ((productValue23 >= 0.0) && (productValue24 >= 0.0))) && ((sumValue15 < 16.0) && ((sumValue13 < 16.0) && (sumValue14 < 16.0)));
                    if (comparisonValue4)
                    {
                        uvec4 sampledTextureValue53 = texelFetch(voxelBuffer, int(((uint(productValue24) + bitwiseValue39) + (uint(productValue25) << 4u)) + (uint(productValue23) << 8u)));
                        uint scalarValue89 = sampledTextureValue53.x;
                        float bitwiseValue14;
                        float intermediateValue37;
                        float intermediateValue38;
                        if (scalarValue89 == 0u)
                        {
                            bitwiseValue14 = 0.0;
                            intermediateValue37 = 0.0;
                            intermediateValue38 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue40 = float(scalarValue89 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue14 = bitwiseValue40 * float(scalarValue89 & 255u);
                            intermediateValue37 = bitwiseValue40 * float((scalarValue89 >> 8u) & 255u);
                            intermediateValue38 = bitwiseValue40 * float((scalarValue89 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue54 = texelFetch(voxelBuffer, int(((uint(sumValue8) + bitwiseValue39) + (uint(sumValue9) << 4u)) + (uint(sumValue7) << 8u)));
                        uint scalarValue90 = sampledTextureValue54.x;
                        float bitwiseValue18;
                        float intermediateValue43;
                        float intermediateValue44;
                        if (scalarValue90 == 0u)
                        {
                            bitwiseValue18 = 0.0;
                            intermediateValue43 = 0.0;
                            intermediateValue44 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue41 = float(scalarValue90 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue18 = bitwiseValue41 * float(scalarValue90 & 255u);
                            intermediateValue43 = bitwiseValue41 * float((scalarValue90 >> 8u) & 255u);
                            intermediateValue44 = bitwiseValue41 * float((scalarValue90 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue55 = texelFetch(voxelBuffer, int(((uint(sumValue11) + bitwiseValue39) + (uint(sumValue12) << 4u)) + (uint(sumValue10) << 8u)));
                        uint scalarValue91 = sampledTextureValue55.x;
                        float bitwiseValue22;
                        float intermediateValue57;
                        float intermediateValue58;
                        if (scalarValue91 == 0u)
                        {
                            bitwiseValue22 = 0.0;
                            intermediateValue57 = 0.0;
                            intermediateValue58 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue42 = float(scalarValue91 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue22 = bitwiseValue42 * float(scalarValue91 & 255u);
                            intermediateValue57 = bitwiseValue42 * float((scalarValue91 >> 8u) & 255u);
                            intermediateValue58 = bitwiseValue42 * float((scalarValue91 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue56 = texelFetch(voxelBuffer, int(((uint(sumValue14) + bitwiseValue39) + (uint(sumValue15) << 4u)) + (uint(sumValue13) << 8u)));
                        uint scalarValue92 = sampledTextureValue56.x;
                        float branchMergedValue3;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        float branchMergedValue7;
                        float branchMergedValue8;
                        float branchMergedValue9;
                        float branchMergedValue10;
                        float branchMergedValue11;
                        float branchMergedValue12;
                        float branchMergedValue13;
                        float branchMergedValue23;
                        float branchMergedValue24;
                        if (scalarValue92 == 0u)
                        {
                            branchMergedValue3 = intermediateValue43;
                            branchMergedValue5 = bitwiseValue18;
                            branchMergedValue6 = intermediateValue38;
                            branchMergedValue7 = intermediateValue37;
                            branchMergedValue8 = bitwiseValue14;
                            branchMergedValue9 = intermediateValue57;
                            branchMergedValue10 = bitwiseValue22;
                            branchMergedValue11 = intermediateValue44;
                            branchMergedValue12 = 0.0;
                            branchMergedValue13 = 0.0;
                            branchMergedValue23 = 0.0;
                            branchMergedValue24 = intermediateValue58;
                        }
                        else
                        {
                            float bitwiseValue43 = float(scalarValue92 >> 24u) * 9.2272217443678528070449829101562e-05;
                            branchMergedValue3 = intermediateValue43;
                            branchMergedValue5 = bitwiseValue18;
                            branchMergedValue6 = intermediateValue38;
                            branchMergedValue7 = intermediateValue37;
                            branchMergedValue8 = bitwiseValue14;
                            branchMergedValue9 = intermediateValue57;
                            branchMergedValue10 = bitwiseValue22;
                            branchMergedValue11 = intermediateValue44;
                            branchMergedValue12 = bitwiseValue43 * float((scalarValue92 >> 16u) & 255u);
                            branchMergedValue13 = bitwiseValue43 * float((scalarValue92 >> 8u) & 255u);
                            branchMergedValue23 = bitwiseValue43 * float(scalarValue92 & 255u);
                            branchMergedValue24 = intermediateValue58;
                        }
                        intermediateValue63 = branchMergedValue8;
                        intermediateValue64 = branchMergedValue7;
                        intermediateValue65 = branchMergedValue6;
                        intermediateValue66 = branchMergedValue5;
                        intermediateValue68 = branchMergedValue3;
                        intermediateValue70 = branchMergedValue11;
                        intermediateValue72 = branchMergedValue10;
                        intermediateValue74 = branchMergedValue9;
                        intermediateValue76 = branchMergedValue24;
                        intermediateValue78 = branchMergedValue23;
                        intermediateValue79 = branchMergedValue13;
                        intermediateValue80 = branchMergedValue12;
                        break;
                    }
                    else
                    {
                        float intermediateValue46;
                        float intermediateValue47;
                        float intermediateValue48;
                        float sumValue29;
                        float sumValue30;
                        float sumValue31;
                        uint comparisonValue8;
                        bool comparisonValue9;
                        for (;;)
                        {
                            sumValue29 = productValue23 + productValue189;
                            sumValue30 = productValue24 + productValue190;
                            sumValue31 = productValue25 + productValue191;
                            uint comparisonValue84 = ((((uint(productValue23 >= 16.0) << 1u) | uint(productValue23 < 0.0)) | (uint(productValue24 < 0.0) << 2u)) | (uint(productValue24 >= 16.0) << 3u)) | (uint(productValue25 < 0.0) << 4u);
                            comparisonValue8 = intermediateValue[comparisonValue84 | (uint(productValue25 >= 16.0) << 5u)];
                            comparisonValue9 = ((((comparisonValue84 | (uint(productValue25 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue84 & 31u))) == 0u;
                            uint sampledTextureValue13;
                            if (comparisonValue9)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue8 & 31u))) == 0u)
                                {
                                    intermediateValue46 = 0.0;
                                    intermediateValue47 = 0.0;
                                    intermediateValue48 = 0.0;
                                    break;
                                }
                                sampledTextureValue13 = ((((uint(sumValue29 - (floor(sumValue29 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue30 - (floor(sumValue30 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue31 - (floor(sumValue31 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue8)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue13 = ((((uint(productValue25) << 4u) & 240u) | (uint(productValue24) & 15u)) | ((uint(productValue23) << 8u) & 3840u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue57 = texelFetch(voxelBuffer, int(sampledTextureValue13));
                            uint scalarValue93 = sampledTextureValue57.x;
                            if (scalarValue93 == 0u)
                            {
                                intermediateValue46 = 0.0;
                                intermediateValue47 = 0.0;
                                intermediateValue48 = 0.0;
                                break;
                            }
                            float bitwiseValue44 = float(scalarValue93 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue46 = bitwiseValue44 * float(scalarValue93 & 255u);
                            intermediateValue47 = bitwiseValue44 * float((scalarValue93 >> 8u) & 255u);
                            intermediateValue48 = bitwiseValue44 * float((scalarValue93 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue67;
                        float intermediateValue69;
                        float intermediateValue71;
                        float sumValue42;
                        float sumValue43;
                        float sumValue44;
                        uint comparisonValue14;
                        bool comparisonValue15;
                        for (;;)
                        {
                            sumValue42 = sumValue7 + productValue189;
                            sumValue43 = sumValue8 + productValue190;
                            sumValue44 = sumValue9 + productValue191;
                            uint comparisonValue85 = ((((uint(sumValue7 >= 16.0) << 1u) | uint(sumValue7 < 0.0)) | (uint(sumValue8 < 0.0) << 2u)) | (uint(sumValue8 >= 16.0) << 3u)) | (uint(sumValue9 < 0.0) << 4u);
                            comparisonValue14 = intermediateValue[comparisonValue85 | (uint(sumValue9 >= 16.0) << 5u)];
                            comparisonValue15 = ((((comparisonValue85 | (uint(sumValue9 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue85 & 31u))) == 0u;
                            uint sampledTextureValue20;
                            if (comparisonValue15)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue14 & 31u))) == 0u)
                                {
                                    intermediateValue67 = 0.0;
                                    intermediateValue69 = 0.0;
                                    intermediateValue71 = 0.0;
                                    break;
                                }
                                sampledTextureValue20 = ((((uint(sumValue42 - (floor(sumValue42 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue43 - (floor(sumValue43 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue44 - (floor(sumValue44 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue14)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue20 = ((((uint(sumValue9) << 4u) & 240u) | (uint(sumValue8) & 15u)) | ((uint(sumValue7) << 8u) & 3840u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue58 = texelFetch(voxelBuffer, int(sampledTextureValue20));
                            uint scalarValue94 = sampledTextureValue58.x;
                            if (scalarValue94 == 0u)
                            {
                                intermediateValue67 = 0.0;
                                intermediateValue69 = 0.0;
                                intermediateValue71 = 0.0;
                                break;
                            }
                            float bitwiseValue45 = float(scalarValue94 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue67 = bitwiseValue45 * float(scalarValue94 & 255u);
                            intermediateValue69 = bitwiseValue45 * float((scalarValue94 >> 8u) & 255u);
                            intermediateValue71 = bitwiseValue45 * float((scalarValue94 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue73;
                        float intermediateValue75;
                        float intermediateValue77;
                        float sumValue48;
                        float sumValue49;
                        float sumValue50;
                        uint comparisonValue20;
                        bool comparisonValue21;
                        for (;;)
                        {
                            sumValue48 = sumValue10 + productValue189;
                            sumValue49 = sumValue11 + productValue190;
                            sumValue50 = sumValue12 + productValue191;
                            uint comparisonValue86 = ((((uint(sumValue10 >= 16.0) << 1u) | uint(sumValue10 < 0.0)) | (uint(sumValue11 < 0.0) << 2u)) | (uint(sumValue11 >= 16.0) << 3u)) | (uint(sumValue12 < 0.0) << 4u);
                            comparisonValue20 = intermediateValue[comparisonValue86 | (uint(sumValue12 >= 16.0) << 5u)];
                            comparisonValue21 = ((((comparisonValue86 | (uint(sumValue12 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue86 & 31u))) == 0u;
                            uint sampledTextureValue24;
                            if (comparisonValue21)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue20 & 31u))) == 0u)
                                {
                                    intermediateValue73 = 0.0;
                                    intermediateValue75 = 0.0;
                                    intermediateValue77 = 0.0;
                                    break;
                                }
                                sampledTextureValue24 = ((((uint(sumValue48 - (floor(sumValue48 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue49 - (floor(sumValue49 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue50 - (floor(sumValue50 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue20)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue24 = ((((uint(sumValue12) << 4u) & 240u) | (uint(sumValue11) & 15u)) | ((uint(sumValue10) << 8u) & 3840u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue59 = texelFetch(voxelBuffer, int(sampledTextureValue24));
                            uint scalarValue95 = sampledTextureValue59.x;
                            if (scalarValue95 == 0u)
                            {
                                intermediateValue73 = 0.0;
                                intermediateValue75 = 0.0;
                                intermediateValue77 = 0.0;
                                break;
                            }
                            float bitwiseValue46 = float(scalarValue95 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue73 = bitwiseValue46 * float(scalarValue95 & 255u);
                            intermediateValue75 = bitwiseValue46 * float((scalarValue95 >> 8u) & 255u);
                            intermediateValue77 = bitwiseValue46 * float((scalarValue95 >> 16u) & 255u);
                            break;
                        }
                        float sumValue130 = sumValue13 + productValue189;
                        float sumValue131 = sumValue14 + productValue190;
                        float sumValue132 = sumValue15 + productValue191;
                        uint comparisonValue87 = ((((uint(sumValue13 >= 16.0) << 1u) | uint(sumValue13 < 0.0)) | (uint(sumValue14 < 0.0) << 2u)) | (uint(sumValue14 >= 16.0) << 3u)) | (uint(sumValue15 < 0.0) << 4u);
                        uint comparisonValue88 = comparisonValue87 | (uint(sumValue15 >= 16.0) << 5u);
                        uint sampledTextureValue28;
                        if ((((comparisonValue88 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue87 & 31u))) == 0u)
                        {
                            if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (intermediateValue[comparisonValue88] & 31u))) == 0u)
                            {
                                intermediateValue63 = intermediateValue46;
                                intermediateValue64 = intermediateValue47;
                                intermediateValue65 = intermediateValue48;
                                intermediateValue66 = intermediateValue67;
                                intermediateValue68 = intermediateValue69;
                                intermediateValue70 = intermediateValue71;
                                intermediateValue72 = intermediateValue73;
                                intermediateValue74 = intermediateValue75;
                                intermediateValue76 = intermediateValue77;
                                intermediateValue78 = 0.0;
                                intermediateValue79 = 0.0;
                                intermediateValue80 = 0.0;
                                break;
                            }
                            sampledTextureValue28 = ((((uint(sumValue130 - (floor(sumValue130 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue131 - (floor(sumValue131 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue132 - (floor(sumValue132 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + intermediateValue[comparisonValue88])).x >> 2u);
                        }
                        else
                        {
                            sampledTextureValue28 = ((((uint(sumValue15) << 4u) & 240u) | (uint(sumValue14) & 15u)) | ((uint(sumValue13) << 8u) & 3840u)) + bitwiseValue39;
                        }
                        uvec4 sampledTextureValue60 = texelFetch(voxelBuffer, int(sampledTextureValue28));
                        uint scalarValue96 = sampledTextureValue60.x;
                        if (scalarValue96 == 0u)
                        {
                            intermediateValue63 = intermediateValue46;
                            intermediateValue64 = intermediateValue47;
                            intermediateValue65 = intermediateValue48;
                            intermediateValue66 = intermediateValue67;
                            intermediateValue68 = intermediateValue69;
                            intermediateValue70 = intermediateValue71;
                            intermediateValue72 = intermediateValue73;
                            intermediateValue74 = intermediateValue75;
                            intermediateValue76 = intermediateValue77;
                            intermediateValue78 = 0.0;
                            intermediateValue79 = 0.0;
                            intermediateValue80 = 0.0;
                            break;
                        }
                        float bitwiseValue47 = float(scalarValue96 >> 24u) * 9.2272217443678528070449829101562e-05;
                        intermediateValue63 = intermediateValue46;
                        intermediateValue64 = intermediateValue47;
                        intermediateValue65 = intermediateValue48;
                        intermediateValue66 = intermediateValue67;
                        intermediateValue68 = intermediateValue69;
                        intermediateValue70 = intermediateValue71;
                        intermediateValue72 = intermediateValue73;
                        intermediateValue74 = intermediateValue75;
                        intermediateValue76 = intermediateValue77;
                        intermediateValue78 = bitwiseValue47 * float(scalarValue96 & 255u);
                        intermediateValue79 = bitwiseValue47 * float((scalarValue96 >> 8u) & 255u);
                        intermediateValue80 = bitwiseValue47 * float((scalarValue96 >> 16u) & 255u);
                        break;
                    }
                }
                branchMergedValue27 = (((intermediateValue68 * productValue27) + (intermediateValue64 * productValue26)) + (intermediateValue74 * productValue28)) + (intermediateValue79 * productValue29);
                branchMergedValue28 = (((intermediateValue70 * productValue27) + (intermediateValue65 * productValue26)) + (intermediateValue76 * productValue28)) + (intermediateValue80 * productValue29);
                branchMergedValue29 = (((intermediateValue66 * productValue27) + (intermediateValue63 * productValue26)) + (intermediateValue72 * productValue28)) + (intermediateValue78 * productValue29);
            }
            else
            {
                float intermediateValue82;
                float intermediateValue83;
                float intermediateValue84;
                float intermediateValue85;
                float intermediateValue87;
                float intermediateValue89;
                float intermediateValue91;
                float intermediateValue93;
                float intermediateValue95;
                float intermediateValue97;
                float intermediateValue98;
                float intermediateValue99;
                float intermediateValue24;
                float intermediateValue25;
                float intermediateValue26;
                uint intermediateValue27;
                uint intermediateValue28;
                uint intermediateValue29;
                float intermediateValue32;
                float sumValue23;
                float sumValue24;
                float sumValue25;
                float sumValue26;
                float sumValue27;
                float sumValue28;
                bool comparisonValue6;
                uint productValue30;
                uint productValue31;
                uint productValue32;
                uint productValue33;
                uint productValue34;
                uint productValue35;
                for (;;)
                {
                    intermediateValue24 = floor(sumValue121);
                    intermediateValue25 = floor(sumValue122);
                    intermediateValue26 = floor(sumValue123);
                    float sumValue133 = sumValue121 - intermediateValue24;
                    float sumValue134 = sumValue122 - intermediateValue25;
                    float sumValue135 = sumValue123 - intermediateValue26;
                    uint comparisonValue89 = ((uint(sumValue134 >= sumValue135) << 1u) | uint(sumValue133 >= sumValue134)) | (uint(sumValue133 >= sumValue135) << 2u);
                    intermediateValue27 = uint(intermediateValue24);
                    intermediateValue28 = uint(intermediateValue25);
                    intermediateValue29 = uint(intermediateValue26);
                    float scalarValue97 = spvNMin(sumValue133, sumValue134);
                    float scalarValue98 = spvNMax(sumValue133, sumValue134);
                    intermediateValue32 = spvNMin(scalarValue97, sumValue135);
                    float scalarValue99 = spvNMax(scalarValue98, sumValue135);
                    float scalarValue100 = spvNMax(spvNMin(scalarValue98, sumValue135), scalarValue97);
                    sumValue23 = 1.0 - scalarValue99;
                    sumValue24 = scalarValue99 - scalarValue100;
                    sumValue25 = scalarValue100 - intermediateValue32;
                    sumValue26 = intermediateValue24 + 1.0;
                    sumValue27 = intermediateValue25 + 1.0;
                    sumValue28 = intermediateValue26 + 1.0;
                    comparisonValue6 = (((intermediateValue24 >= 0.0) && (intermediateValue25 >= 0.0)) && (intermediateValue26 >= 0.0)) && (((sumValue26 < 16.0) && (sumValue27 < 16.0)) && (sumValue28 < 16.0));
                    productValue30 = 0u + (comparisonValue89 * 3u);
                    productValue31 = 1u + (comparisonValue89 * 3u);
                    productValue32 = 2u + (comparisonValue89 * 3u);
                    productValue33 = 0u + (comparisonValue89 * 3u);
                    productValue34 = 1u + (comparisonValue89 * 3u);
                    productValue35 = 2u + (comparisonValue89 * 3u);
                    if (comparisonValue6)
                    {
                        uint bitwiseValue48 = intermediateValue29 << 4u;
                        uint sumValue136 = intermediateValue28 + bitwiseValue39;
                        uint bitwiseValue49 = sumValue136 + (intermediateValue27 << 8u);
                        uvec4 sampledTextureValue61 = texelFetch(voxelBuffer, int(bitwiseValue49 + bitwiseValue48));
                        uint scalarValue101 = sampledTextureValue61.x;
                        float bitwiseValue16;
                        float intermediateValue40;
                        float intermediateValue41;
                        if (scalarValue101 == 0u)
                        {
                            bitwiseValue16 = 0.0;
                            intermediateValue40 = 0.0;
                            intermediateValue41 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue50 = float(scalarValue101 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue16 = bitwiseValue50 * float(scalarValue101 & 255u);
                            intermediateValue40 = bitwiseValue50 * float((scalarValue101 >> 8u) & 255u);
                            intermediateValue41 = bitwiseValue50 * float((scalarValue101 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue62 = texelFetch(voxelBuffer, int(((intermediateValue1[productValue31] + sumValue136) + ((intermediateValue1[productValue30] + intermediateValue27) << 8u)) + ((intermediateValue1[productValue32] + intermediateValue29) << 4u)));
                        uint scalarValue102 = sampledTextureValue62.x;
                        float bitwiseValue20;
                        float intermediateValue50;
                        float intermediateValue51;
                        if (scalarValue102 == 0u)
                        {
                            bitwiseValue20 = 0.0;
                            intermediateValue50 = 0.0;
                            intermediateValue51 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue51 = float(scalarValue102 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue20 = bitwiseValue51 * float(scalarValue102 & 255u);
                            intermediateValue50 = bitwiseValue51 * float((scalarValue102 >> 8u) & 255u);
                            intermediateValue51 = bitwiseValue51 * float((scalarValue102 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue63 = texelFetch(voxelBuffer, int(((intermediateValue2[productValue34] + sumValue136) + ((intermediateValue2[productValue33] + intermediateValue27) << 8u)) + ((intermediateValue2[productValue35] + intermediateValue29) << 4u)));
                        uint scalarValue103 = sampledTextureValue63.x;
                        float bitwiseValue25;
                        float intermediateValue60;
                        float intermediateValue61;
                        if (scalarValue103 == 0u)
                        {
                            bitwiseValue25 = 0.0;
                            intermediateValue60 = 0.0;
                            intermediateValue61 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue52 = float(scalarValue103 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue25 = bitwiseValue52 * float(scalarValue103 & 255u);
                            intermediateValue60 = bitwiseValue52 * float((scalarValue103 >> 8u) & 255u);
                            intermediateValue61 = bitwiseValue52 * float((scalarValue103 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue64 = texelFetch(voxelBuffer, int((bitwiseValue49 + 273u) + bitwiseValue48));
                        uint scalarValue104 = sampledTextureValue64.x;
                        float branchMergedValue4;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        float branchMergedValue18;
                        float branchMergedValue19;
                        float branchMergedValue20;
                        float branchMergedValue21;
                        float branchMergedValue22;
                        float branchMergedValue25;
                        float branchMergedValue26;
                        if (scalarValue104 == 0u)
                        {
                            branchMergedValue4 = intermediateValue40;
                            branchMergedValue14 = intermediateValue41;
                            branchMergedValue15 = bitwiseValue20;
                            branchMergedValue16 = intermediateValue50;
                            branchMergedValue17 = intermediateValue51;
                            branchMergedValue18 = bitwiseValue25;
                            branchMergedValue19 = intermediateValue60;
                            branchMergedValue20 = intermediateValue61;
                            branchMergedValue21 = 0.0;
                            branchMergedValue22 = 0.0;
                            branchMergedValue25 = bitwiseValue16;
                            branchMergedValue26 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue53 = float(scalarValue104 >> 24u) * 9.2272217443678528070449829101562e-05;
                            branchMergedValue4 = intermediateValue40;
                            branchMergedValue14 = intermediateValue41;
                            branchMergedValue15 = bitwiseValue20;
                            branchMergedValue16 = intermediateValue50;
                            branchMergedValue17 = intermediateValue51;
                            branchMergedValue18 = bitwiseValue25;
                            branchMergedValue19 = intermediateValue60;
                            branchMergedValue20 = intermediateValue61;
                            branchMergedValue21 = bitwiseValue53 * float((scalarValue104 >> 8u) & 255u);
                            branchMergedValue22 = bitwiseValue53 * float((scalarValue104 >> 16u) & 255u);
                            branchMergedValue25 = bitwiseValue16;
                            branchMergedValue26 = bitwiseValue53 * float(scalarValue104 & 255u);
                        }
                        intermediateValue82 = branchMergedValue25;
                        intermediateValue83 = branchMergedValue4;
                        intermediateValue84 = branchMergedValue14;
                        intermediateValue85 = branchMergedValue15;
                        intermediateValue87 = branchMergedValue16;
                        intermediateValue89 = branchMergedValue17;
                        intermediateValue91 = branchMergedValue18;
                        intermediateValue93 = branchMergedValue19;
                        intermediateValue95 = branchMergedValue20;
                        intermediateValue97 = branchMergedValue26;
                        intermediateValue98 = branchMergedValue21;
                        intermediateValue99 = branchMergedValue22;
                        break;
                    }
                    else
                    {
                        float intermediateValue53;
                        float intermediateValue54;
                        float intermediateValue55;
                        float sumValue33;
                        float sumValue34;
                        float sumValue35;
                        float sumValue36;
                        float sumValue37;
                        float sumValue38;
                        float sumValue39;
                        float sumValue40;
                        float sumValue41;
                        uint comparisonValue11;
                        bool comparisonValue12;
                        for (;;)
                        {
                            sumValue33 = float(intermediateValue1[productValue30]) + intermediateValue24;
                            sumValue34 = float(intermediateValue1[productValue31]) + intermediateValue25;
                            sumValue35 = float(intermediateValue1[productValue32]) + intermediateValue26;
                            sumValue36 = float(intermediateValue2[productValue33]) + intermediateValue24;
                            sumValue37 = float(intermediateValue2[productValue34]) + intermediateValue25;
                            sumValue38 = float(intermediateValue2[productValue35]) + intermediateValue26;
                            sumValue39 = intermediateValue24 + productValue189;
                            sumValue40 = intermediateValue25 + productValue190;
                            sumValue41 = intermediateValue26 + productValue191;
                            uint comparisonValue90 = ((((uint(intermediateValue24 >= 16.0) << 1u) | uint(intermediateValue24 < 0.0)) | (uint(intermediateValue25 < 0.0) << 2u)) | (uint(intermediateValue25 >= 16.0) << 3u)) | (uint(intermediateValue26 < 0.0) << 4u);
                            comparisonValue11 = intermediateValue[comparisonValue90 | (uint(intermediateValue26 >= 16.0) << 5u)];
                            comparisonValue12 = ((((comparisonValue90 | (uint(intermediateValue26 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue90 & 31u))) == 0u;
                            uint sampledTextureValue16;
                            if (comparisonValue12)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue11 & 31u))) == 0u)
                                {
                                    intermediateValue53 = 0.0;
                                    intermediateValue54 = 0.0;
                                    intermediateValue55 = 0.0;
                                    break;
                                }
                                sampledTextureValue16 = ((((uint(sumValue39 - (floor(sumValue39 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue40 - (floor(sumValue40 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue41 - (floor(sumValue41 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue11)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue16 = ((((intermediateValue27 << 8u) & 3840u) | (intermediateValue28 & 15u)) | ((intermediateValue29 << 4u) & 240u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue65 = texelFetch(voxelBuffer, int(sampledTextureValue16));
                            uint scalarValue105 = sampledTextureValue65.x;
                            if (scalarValue105 == 0u)
                            {
                                intermediateValue53 = 0.0;
                                intermediateValue54 = 0.0;
                                intermediateValue55 = 0.0;
                                break;
                            }
                            float bitwiseValue54 = float(scalarValue105 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue53 = bitwiseValue54 * float(scalarValue105 & 255u);
                            intermediateValue54 = bitwiseValue54 * float((scalarValue105 >> 8u) & 255u);
                            intermediateValue55 = bitwiseValue54 * float((scalarValue105 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue86;
                        float intermediateValue88;
                        float intermediateValue90;
                        float sumValue45;
                        float sumValue46;
                        float sumValue47;
                        uint comparisonValue17;
                        bool comparisonValue18;
                        for (;;)
                        {
                            sumValue45 = sumValue33 + productValue189;
                            sumValue46 = sumValue34 + productValue190;
                            sumValue47 = sumValue35 + productValue191;
                            uint comparisonValue91 = ((((uint(sumValue33 >= 16.0) << 1u) | uint(sumValue33 < 0.0)) | (uint(sumValue34 < 0.0) << 2u)) | (uint(sumValue34 >= 16.0) << 3u)) | (uint(sumValue35 < 0.0) << 4u);
                            comparisonValue17 = intermediateValue[comparisonValue91 | (uint(sumValue35 >= 16.0) << 5u)];
                            comparisonValue18 = ((((comparisonValue91 | (uint(sumValue35 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue91 & 31u))) == 0u;
                            uint sampledTextureValue22;
                            if (comparisonValue18)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue17 & 31u))) == 0u)
                                {
                                    intermediateValue86 = 0.0;
                                    intermediateValue88 = 0.0;
                                    intermediateValue90 = 0.0;
                                    break;
                                }
                                sampledTextureValue22 = ((((uint(sumValue45 - (floor(sumValue45 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue46 - (floor(sumValue46 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue47 - (floor(sumValue47 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue17)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue22 = ((((uint(sumValue33) << 8u) & 3840u) | (uint(sumValue34) & 15u)) | ((uint(sumValue35) << 4u) & 240u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue66 = texelFetch(voxelBuffer, int(sampledTextureValue22));
                            uint scalarValue106 = sampledTextureValue66.x;
                            if (scalarValue106 == 0u)
                            {
                                intermediateValue86 = 0.0;
                                intermediateValue88 = 0.0;
                                intermediateValue90 = 0.0;
                                break;
                            }
                            float bitwiseValue55 = float(scalarValue106 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue86 = bitwiseValue55 * float(scalarValue106 & 255u);
                            intermediateValue88 = bitwiseValue55 * float((scalarValue106 >> 8u) & 255u);
                            intermediateValue90 = bitwiseValue55 * float((scalarValue106 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue92;
                        float intermediateValue94;
                        float intermediateValue96;
                        float sumValue51;
                        float sumValue52;
                        float sumValue53;
                        uint comparisonValue23;
                        bool comparisonValue24;
                        for (;;)
                        {
                            sumValue51 = sumValue36 + productValue189;
                            sumValue52 = sumValue37 + productValue190;
                            sumValue53 = sumValue38 + productValue191;
                            uint comparisonValue92 = ((((uint(sumValue36 >= 16.0) << 1u) | uint(sumValue36 < 0.0)) | (uint(sumValue37 < 0.0) << 2u)) | (uint(sumValue37 >= 16.0) << 3u)) | (uint(sumValue38 < 0.0) << 4u);
                            comparisonValue23 = intermediateValue[comparisonValue92 | (uint(sumValue38 >= 16.0) << 5u)];
                            comparisonValue24 = ((((comparisonValue92 | (uint(sumValue38 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue92 & 31u))) == 0u;
                            uint sampledTextureValue26;
                            if (comparisonValue24)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue23 & 31u))) == 0u)
                                {
                                    intermediateValue92 = 0.0;
                                    intermediateValue94 = 0.0;
                                    intermediateValue96 = 0.0;
                                    break;
                                }
                                sampledTextureValue26 = ((((uint(sumValue51 - (floor(sumValue51 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue52 - (floor(sumValue52 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue53 - (floor(sumValue53 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue23)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue26 = ((((uint(sumValue36) << 8u) & 3840u) | (uint(sumValue37) & 15u)) | ((uint(sumValue38) << 4u) & 240u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue67 = texelFetch(voxelBuffer, int(sampledTextureValue26));
                            uint scalarValue107 = sampledTextureValue67.x;
                            if (scalarValue107 == 0u)
                            {
                                intermediateValue92 = 0.0;
                                intermediateValue94 = 0.0;
                                intermediateValue96 = 0.0;
                                break;
                            }
                            float bitwiseValue56 = float(scalarValue107 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue92 = bitwiseValue56 * float(scalarValue107 & 255u);
                            intermediateValue94 = bitwiseValue56 * float((scalarValue107 >> 8u) & 255u);
                            intermediateValue96 = bitwiseValue56 * float((scalarValue107 >> 16u) & 255u);
                            break;
                        }
                        float sumValue137 = sumValue26 + productValue189;
                        float sumValue138 = sumValue27 + productValue190;
                        float sumValue139 = sumValue28 + productValue191;
                        uint comparisonValue93 = ((((uint(sumValue26 >= 16.0) << 1u) | uint(sumValue26 < 0.0)) | (uint(sumValue27 < 0.0) << 2u)) | (uint(sumValue27 >= 16.0) << 3u)) | (uint(sumValue28 < 0.0) << 4u);
                        uint comparisonValue94 = comparisonValue93 | (uint(sumValue28 >= 16.0) << 5u);
                        uint sampledTextureValue30;
                        if ((((comparisonValue94 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue93 & 31u))) == 0u)
                        {
                            if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (intermediateValue[comparisonValue94] & 31u))) == 0u)
                            {
                                intermediateValue82 = intermediateValue53;
                                intermediateValue83 = intermediateValue54;
                                intermediateValue84 = intermediateValue55;
                                intermediateValue85 = intermediateValue86;
                                intermediateValue87 = intermediateValue88;
                                intermediateValue89 = intermediateValue90;
                                intermediateValue91 = intermediateValue92;
                                intermediateValue93 = intermediateValue94;
                                intermediateValue95 = intermediateValue96;
                                intermediateValue97 = 0.0;
                                intermediateValue98 = 0.0;
                                intermediateValue99 = 0.0;
                                break;
                            }
                            sampledTextureValue30 = ((((uint(sumValue137 - (floor(sumValue137 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue138 - (floor(sumValue138 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue139 - (floor(sumValue139 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + intermediateValue[comparisonValue94])).x >> 2u);
                        }
                        else
                        {
                            sampledTextureValue30 = ((((uint(sumValue26) << 8u) & 3840u) | (uint(sumValue27) & 15u)) | ((uint(sumValue28) << 4u) & 240u)) + bitwiseValue39;
                        }
                        uvec4 sampledTextureValue68 = texelFetch(voxelBuffer, int(sampledTextureValue30));
                        uint scalarValue108 = sampledTextureValue68.x;
                        if (scalarValue108 == 0u)
                        {
                            intermediateValue82 = intermediateValue53;
                            intermediateValue83 = intermediateValue54;
                            intermediateValue84 = intermediateValue55;
                            intermediateValue85 = intermediateValue86;
                            intermediateValue87 = intermediateValue88;
                            intermediateValue89 = intermediateValue90;
                            intermediateValue91 = intermediateValue92;
                            intermediateValue93 = intermediateValue94;
                            intermediateValue95 = intermediateValue96;
                            intermediateValue97 = 0.0;
                            intermediateValue98 = 0.0;
                            intermediateValue99 = 0.0;
                            break;
                        }
                        float bitwiseValue57 = float(scalarValue108 >> 24u) * 9.2272217443678528070449829101562e-05;
                        intermediateValue82 = intermediateValue53;
                        intermediateValue83 = intermediateValue54;
                        intermediateValue84 = intermediateValue55;
                        intermediateValue85 = intermediateValue86;
                        intermediateValue87 = intermediateValue88;
                        intermediateValue89 = intermediateValue90;
                        intermediateValue91 = intermediateValue92;
                        intermediateValue93 = intermediateValue94;
                        intermediateValue95 = intermediateValue96;
                        intermediateValue97 = bitwiseValue57 * float(scalarValue108 & 255u);
                        intermediateValue98 = bitwiseValue57 * float((scalarValue108 >> 8u) & 255u);
                        intermediateValue99 = bitwiseValue57 * float((scalarValue108 >> 16u) & 255u);
                        break;
                    }
                }
                branchMergedValue27 = (((intermediateValue87 * sumValue24) + (intermediateValue83 * sumValue23)) + (intermediateValue93 * sumValue25)) + (intermediateValue98 * intermediateValue32);
                branchMergedValue28 = (((intermediateValue89 * sumValue24) + (intermediateValue84 * sumValue23)) + (intermediateValue95 * sumValue25)) + (intermediateValue99 * intermediateValue32);
                branchMergedValue29 = (((intermediateValue85 * sumValue24) + (intermediateValue82 * sumValue23)) + (intermediateValue91 * sumValue25)) + (intermediateValue97 * intermediateValue32);
            }
            branchMergedValue = branchMergedValue27;
            branchMergedValue1 = branchMergedValue28;
            branchMergedValue2 = branchMergedValue29;
        }
        else
        {
            branchMergedValue = 0.0;
            branchMergedValue1 = 0.0;
            branchMergedValue2 = 0.0;
        }
        intermediateValue11 = branchMergedValue2;
        intermediateValue12 = branchMergedValue;
        intermediateValue13 = branchMergedValue1;
    }
    else
    {
        intermediateValue11 = bitwiseValue30 * float((scalarValue78 >> 8u) & 255u);
        intermediateValue12 = bitwiseValue30 * float(scalarValue78 & 255u);
        intermediateValue13 = bitwiseValue30 * float((scalarValue79 >> 8u) & 255u);
    }
    float productValue198 = bitwiseValue29 * bitwiseValue29;
    float productValue199 = productValue198 * productValue198;
    float productValue200 = (((fragmentVectorConstants1.packedValues[11u].y * (productValue198 - productValue199)) + productValue199) * bitwiseValue29) * fragmentVectorConstants1.packedValues[16u].w;
    float productValue201 = fragmentVectorConstants1.packedValues[13u].w * (1.0 - spvNClamp((sampledTextureValue49.w + (-0.501960813999176025390625)) * 2.007874011993408203125, 0.0, 1.0));
    float productValue202 = scalarValue76 * 65535.0;
    float scalarValue109 = floor(productValue202);
    fragmentColor0.x = (scalarValue74 * 0.5) + 0.5;
    fragmentColor0.y = (scalarValue75 * 0.5) + 0.5;
    fragmentColor0.z = scalarValue109 * 1.525902189314365386962890625e-05;
    fragmentColor0.w = productValue202 - scalarValue109;
    fragmentColor1.x = productValue201 * spvNMax((productValue200 * fragmentVectorConstants1.packedValues[16u].x) + (fragmentVectorConstants1.packedValues[8u].w * intermediateValue11), fragmentVectorConstants1.packedValues[10u].x * fragmentVectorConstants1.packedValues[10u].w);
    fragmentColor1.y = productValue201 * spvNMax((productValue200 * fragmentVectorConstants1.packedValues[16u].y) + (fragmentVectorConstants1.packedValues[8u].w * intermediateValue12), fragmentVectorConstants1.packedValues[10u].y * fragmentVectorConstants1.packedValues[10u].w);
    fragmentColor1.z = productValue201 * spvNMax((productValue200 * fragmentVectorConstants1.packedValues[16u].z) + (fragmentVectorConstants1.packedValues[8u].w * intermediateValue13), fragmentVectorConstants1.packedValues[10u].z * fragmentVectorConstants1.packedValues[10u].w);
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue226 = (floor(fragmentVectorConstants1.packedValues[40u].x * varyingTexCoord0.x) + 0.5) * fragmentVectorConstants1.packedValues[40u].z;
    float productValue227 = (floor(fragmentVectorConstants1.packedValues[40u].y * varyingTexCoord0.y) + 0.5) * fragmentVectorConstants1.packedValues[40u].w;
    float productValue228 = (productValue226 * 2.0) + (-1.0);
    float productValue229 = ((1.0 - productValue227) * 2.0) + (-1.0);
    vec4 sampledTextureValue73 = texture(sampler2D(normalTexture, normalSampler), vec2(productValue226, productValue227));
    float scalarValue142 = sampledTextureValue73.x;
    float scalarValue143 = sampledTextureValue73.y;
    vec4 sampledTextureValue74 = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(productValue226, productValue227));
    float scalarValue144 = sampledTextureValue74.x;
    float productValue230 = (scalarValue144 * fragmentVectorConstants1.packedValues[15u].w) + fragmentVectorConstants1.packedValues[16u].w;
    float quotientValue45 = (productValue228 * fragmentVectorConstants1.packedValues[13u].x) / productValue230;
    float quotientValue46 = (productValue229 * fragmentVectorConstants1.packedValues[14u].y) / productValue230;
    float quotientValue47 = fragmentVectorConstants1.packedValues[16u].z / productValue230;
    float sumValue177 = (-0.0) - quotientValue47;
    float multiplyAddValue149 = fma(fragmentVectorConstants1.packedValues[11u].x, quotientValue47, fma(fragmentVectorConstants1.packedValues[10u].x, quotientValue46, quotientValue45 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[12u].x;
    float multiplyAddValue150 = fma(fragmentVectorConstants1.packedValues[11u].y, quotientValue47, fma(fragmentVectorConstants1.packedValues[10u].y, quotientValue46, quotientValue45 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[12u].y;
    float multiplyAddValue151 = fma(fragmentVectorConstants1.packedValues[11u].z, quotientValue47, fma(fragmentVectorConstants1.packedValues[10u].z, quotientValue46, quotientValue45 * fragmentVectorConstants1.packedValues[9u].z)) + fragmentVectorConstants1.packedValues[12u].z;
    float quotientValue48 = ((fragmentVectorConstants1.packedValues[42u].x + productValue228) * fragmentVectorConstants1.packedValues[13u].x) / productValue230;
    float quotientValue49 = ((productValue229 - fragmentVectorConstants1.packedValues[42u].y) * fragmentVectorConstants1.packedValues[14u].y) / productValue230;
    float multiplyAddValue152 = (fma(fragmentVectorConstants1.packedValues[11u].x, quotientValue47, fma(fragmentVectorConstants1.packedValues[10u].x, quotientValue49, quotientValue48 * fragmentVectorConstants1.packedValues[9u].x)) + fragmentVectorConstants1.packedValues[12u].x) - fragmentVectorConstants1.packedValues[27u].x;
    float multiplyAddValue153 = (fma(fragmentVectorConstants1.packedValues[11u].y, quotientValue47, fma(fragmentVectorConstants1.packedValues[10u].y, quotientValue49, quotientValue48 * fragmentVectorConstants1.packedValues[9u].y)) + fragmentVectorConstants1.packedValues[12u].y) - fragmentVectorConstants1.packedValues[27u].y;
    float multiplyAddValue154 = (fma(fragmentVectorConstants1.packedValues[11u].z, quotientValue47, fma(fragmentVectorConstants1.packedValues[10u].z, quotientValue49, quotientValue48 * fragmentVectorConstants1.packedValues[9u].z)) + fragmentVectorConstants1.packedValues[12u].z) - fragmentVectorConstants1.packedValues[27u].z;
    float scalarValue145 = dFdxCoarse(quotientValue48);
    float scalarValue146 = dFdxCoarse(quotientValue49);
    float scalarValue147 = dFdxCoarse(quotientValue47);
    float inverseLengthValue25 = inversesqrt(dot(vec3(scalarValue145, scalarValue146, scalarValue147), vec3(scalarValue145, scalarValue146, scalarValue147)));
    float productValue231 = inverseLengthValue25 * scalarValue145;
    float productValue232 = inverseLengthValue25 * scalarValue146;
    float productValue233 = inverseLengthValue25 * scalarValue147;
    float sumValue178 = dFdyCoarse((-0.0) - quotientValue48);
    float sumValue179 = dFdyCoarse((-0.0) - quotientValue49);
    float sumValue180 = dFdyCoarse((-0.0) - quotientValue47);
    float inverseLengthValue26 = inversesqrt(dot(vec3(sumValue178, sumValue179, sumValue180), vec3(sumValue178, sumValue179, sumValue180)));
    float productValue234 = inverseLengthValue26 * sumValue178;
    float productValue235 = inverseLengthValue26 * sumValue179;
    float productValue236 = inverseLengthValue26 * sumValue180;
    float productValue237 = (productValue236 * productValue232) - (productValue235 * productValue233);
    float productValue238 = (productValue234 * productValue233) - (productValue236 * productValue231);
    float productValue239 = (productValue235 * productValue231) - (productValue234 * productValue232);
    float inverseLengthValue27 = inversesqrt(dot(vec3(productValue237, productValue238, productValue239), vec3(productValue237, productValue238, productValue239)));
    float productValue240 = productValue237 * inverseLengthValue27;
    float productValue241 = productValue238 * inverseLengthValue27;
    float productValue242 = productValue239 * inverseLengthValue27;
    float multiplyAddValue155 = fma(fragmentVectorConstants1.packedValues[11u].x, productValue242, fma(fragmentVectorConstants1.packedValues[10u].x, productValue241, productValue240 * fragmentVectorConstants1.packedValues[9u].x));
    float multiplyAddValue156 = fma(fragmentVectorConstants1.packedValues[11u].y, productValue242, fma(fragmentVectorConstants1.packedValues[10u].y, productValue241, productValue240 * fragmentVectorConstants1.packedValues[9u].y));
    float multiplyAddValue157 = fma(fragmentVectorConstants1.packedValues[11u].z, productValue242, fma(fragmentVectorConstants1.packedValues[10u].z, productValue241, productValue240 * fragmentVectorConstants1.packedValues[9u].z));
    float inverseLengthValue28 = inversesqrt(dot(vec3(multiplyAddValue155, multiplyAddValue156, multiplyAddValue157), vec3(multiplyAddValue155, multiplyAddValue156, multiplyAddValue157)));
    float quotientValue50 = roundEven((inverseLengthValue28 * multiplyAddValue155) / fragmentVectorConstants1.packedValues[39u].x) * fragmentVectorConstants1.packedValues[39u].x;
    float quotientValue51 = roundEven((inverseLengthValue28 * multiplyAddValue156) / fragmentVectorConstants1.packedValues[39u].x) * fragmentVectorConstants1.packedValues[39u].x;
    float quotientValue52 = roundEven((inverseLengthValue28 * multiplyAddValue157) / fragmentVectorConstants1.packedValues[39u].x) * fragmentVectorConstants1.packedValues[39u].x;
    float inverseLengthValue29 = inversesqrt(dot(vec3(quotientValue50, quotientValue51, quotientValue52), vec3(quotientValue50, quotientValue51, quotientValue52)));
    float productValue243 = inverseLengthValue29 * quotientValue50;
    float productValue244 = inverseLengthValue29 * quotientValue51;
    float productValue245 = inverseLengthValue29 * quotientValue52;
    float productValue116 = fragmentVectorConstants1.packedValues[18u].z * 0.5;
    float quotientValue53 = productValue116 - (multiplyAddValue152 - (floor(multiplyAddValue152 / fragmentVectorConstants1.packedValues[18u].z) * fragmentVectorConstants1.packedValues[18u].z));
    float quotientValue54 = productValue116 - (multiplyAddValue153 - (floor(multiplyAddValue153 / fragmentVectorConstants1.packedValues[18u].z) * fragmentVectorConstants1.packedValues[18u].z));
    float quotientValue55 = productValue116 - (multiplyAddValue154 - (floor(multiplyAddValue154 / fragmentVectorConstants1.packedValues[18u].z) * fragmentVectorConstants1.packedValues[18u].z));
    float dotProductValue11 = dot(vec3(quotientValue53, quotientValue54, quotientValue55), vec3(productValue243, productValue244, productValue245));
    float sumValue181 = 1.0 - abs(scalarValue142);
    float scalarValue148 = abs(scalarValue143);
    float sumValue182 = sumValue181 - scalarValue148;
    bool conditionValue20 = sumValue182 < 0.0;
    float comparisonValue127 = conditionValue20 ? ((1.0 - scalarValue148) * ((scalarValue142 < 0.0) ? (-1.0) : 1.0)) : scalarValue142;
    float comparisonValue128 = conditionValue20 ? (sumValue181 * ((scalarValue143 < 0.0) ? (-1.0) : 1.0)) : scalarValue143;
    float inverseLengthValue30 = inversesqrt(dot(vec3(comparisonValue127, comparisonValue128, sumValue182), vec3(comparisonValue127, comparisonValue128, sumValue182)));
    float productValue246 = comparisonValue127 * inverseLengthValue30;
    float productValue247 = comparisonValue128 * inverseLengthValue30;
    float productValue248 = inverseLengthValue30 * sumValue182;
    float inverseLengthValue31 = inversesqrt(dot(vec3(productValue246, productValue247, productValue248), vec3(productValue246, productValue247, productValue248)));
    float productValue249 = inverseLengthValue31 * productValue246;
    float productValue250 = productValue247 * inverseLengthValue31;
    float productValue251 = inverseLengthValue31 * productValue248;
    float multiplyAddValue158 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue251, fma(fragmentVectorConstants1.packedValues[5u].x, productValue250, productValue249 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue159 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue251, fma(fragmentVectorConstants1.packedValues[5u].y, productValue250, productValue249 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue160 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue251, fma(fragmentVectorConstants1.packedValues[5u].z, productValue250, productValue249 * fragmentVectorConstants1.packedValues[4u].z));
    float inverseLengthValue32 = inversesqrt(dot(vec3(multiplyAddValue158, multiplyAddValue159, multiplyAddValue160), vec3(multiplyAddValue158, multiplyAddValue159, multiplyAddValue160)));
    float productValue252 = inverseLengthValue32 * multiplyAddValue158;
    float productValue253 = inverseLengthValue32 * multiplyAddValue159;
    float productValue254 = inverseLengthValue32 * multiplyAddValue160;
    vec4 sampledTextureValue75 = texture(sampler2D(colorMetalnessSubsurfaceTexture, colorMetalnessSubsurfaceSampler), vec2(productValue226, productValue227));
    float scalarValue149 = sampledTextureValue75.x;
    float scalarValue150 = sampledTextureValue75.y;
    float scalarValue151 = sampledTextureValue75.z;
    float scalarValue152 = sampledTextureValue75.w;
    float productValue255 = spvNClamp((scalarValue152 + (-0.501960813999176025390625)) * 2.007874011993408203125, 0.0, 1.0);
    uvec2 sampledTextureValue1 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    uvec4 sampledTextureValue76 = texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue1.x)))))) * productValue226)), uint(int(float(int(uint(int(float(int(sampledTextureValue1.y)))))) * productValue227)))), int(0u));
    uint scalarValue153 = sampledTextureValue76.y;
    uint scalarValue154 = sampledTextureValue76.z;
    uint scalarValue155 = sampledTextureValue76.w;
    float bitwiseValue92 = float((sampledTextureValue76.x >> 8u) & 255u) * 0.0039215688593685626983642578125;
    float bitwiseValue93 = float(scalarValue155 & 255u) * 0.0039215688593685626983642578125;
    float bitwiseValue94 = float(scalarValue154 & 255u) * 9.2272217443678528070449829101562e-05;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[29u].x != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(scalarValue149, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue150, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue151, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue149 <= 0.040449999272823333740234375) ? (scalarValue149 * 0.077399380505084991455078125) : exp2(log2((scalarValue149 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue150 <= 0.040449999272823333740234375) ? (scalarValue150 * 0.077399380505084991455078125) : exp2(log2((scalarValue150 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue151 <= 0.040449999272823333740234375) ? (scalarValue151 * 0.077399380505084991455078125) : exp2(log2((scalarValue151 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float sumValue183 = 1.0 - productValue255;
    float productValue256 = sumValue183 * 0.039999999105930328369140625;
    float productValue257 = (exponentialValue * productValue255) + productValue256;
    float productValue258 = (exponentialValue1 * productValue255) + productValue256;
    float productValue259 = (exponentialValue2 * productValue255) + productValue256;
    float nonlinearValue5 = sqrt(((quotientValue46 * quotientValue46) + (quotientValue45 * quotientValue45)) + (quotientValue47 * quotientValue47)) + 9.9999997473787516355514526367188e-05;
    float quotientValue56 = quotientValue45 / nonlinearValue5;
    float quotientValue57 = quotientValue46 / nonlinearValue5;
    float quotientValue58 = quotientValue47 / nonlinearValue5;
    float sumValue184 = (-0.0) - quotientValue56;
    float sumValue185 = (-0.0) - quotientValue57;
    float sumValue186 = (-0.0) - quotientValue58;
    float productValue260 = fragmentVectorConstants1.packedValues[43u].x * spvNClamp((0.4980392158031463623046875 - scalarValue152) * 2.007874011993408203125, 0.0, 1.0);
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    if (scalarValue144 != 1.0)
    {
        float branchMergedValue5;
        float branchMergedValue8;
        float branchMergedValue9;
        float branchMergedValue10;
        float branchMergedValue11;
        float branchMergedValue12;
        if (fragmentVectorConstants1.packedValues[23u].z != 0.0)
        {
            bool conditionValue9 = int(uint(int(fragmentVectorConstants1.packedValues[18u].y))) > int(0u);
            float comparisonValue129 = conditionValue9 ? (((quotientValue53 + multiplyAddValue152) - (dotProductValue11 * productValue243)) + fragmentVectorConstants1.packedValues[27u].x) : multiplyAddValue149;
            float comparisonValue130 = conditionValue9 ? (((multiplyAddValue153 - (dotProductValue11 * productValue244)) + quotientValue54) + fragmentVectorConstants1.packedValues[27u].y) : multiplyAddValue150;
            float comparisonValue131 = conditionValue9 ? (((multiplyAddValue154 - (dotProductValue11 * productValue245)) + quotientValue55) + fragmentVectorConstants1.packedValues[27u].z) : multiplyAddValue151;
            float productValue261 = fragmentVectorConstants1.packedValues[25u].z * sumValue177;
            float productValue262 = productValue261 * fragmentVectorConstants1.packedValues[25u].w;
            float intermediateValue29;
            if (fragmentVectorConstants1.packedValues[25u].x > sumValue177)
            {
                intermediateValue29 = 0.0;
            }
            else
            {
                float branchMergedValue7;
                if (fragmentVectorConstants1.packedValues[25u].y > sumValue177)
                {
                    branchMergedValue7 = 1.0;
                }
                else
                {
                    branchMergedValue7 = spvNMin(floor(spvNMin(spvNMax((log2(sumValue177) - fragmentVectorConstants1.packedValues[32u].z) * fragmentVectorConstants1.packedValues[32u].x, 0.0), 1.0) * (fragmentVectorConstants1.packedValues[28u].z + (-2.0))) + 2.0, fragmentVectorConstants1.packedValues[28u].z + (-1.0));
                }
                intermediateValue29 = branchMergedValue7;
            }
            float quotientValue59 = spvNMin(floor(spvNMin(spvNMax((productValue262 + quotientValue45) / (productValue262 * 2.0), 0.0), 1.0) * fragmentVectorConstants1.packedValues[28u].x), fragmentVectorConstants1.packedValues[28u].x + (-1.0));
            float quotientValue60 = spvNMin(floor(spvNMin(spvNMax((productValue261 + quotientValue46) / (productValue261 * 2.0), 0.0), 1.0) * fragmentVectorConstants1.packedValues[28u].y), fragmentVectorConstants1.packedValues[28u].y + (-1.0));
            uint intermediateValue33;
            bool intermediateValue35;
            uint intermediateValue36;
            if ((intermediateValue29 >= fragmentVectorConstants1.packedValues[28u].z) || ((quotientValue60 >= fragmentVectorConstants1.packedValues[28u].y) || ((quotientValue59 >= fragmentVectorConstants1.packedValues[28u].x) || ((intermediateValue29 < 0.0) || ((quotientValue59 < 0.0) || (quotientValue60 < 0.0))))))
            {
                intermediateValue33 = intermediateValue34;
                intermediateValue35 = false;
                intermediateValue36 = 0u;
            }
            else
            {
                uint scalarValue156 = uint(int(fragmentVectorConstants1.packedValues[28u].w));
                uint productValue263 = uint(int(((quotientValue60 + (intermediateValue29 * fragmentVectorConstants1.packedValues[28u].y)) * fragmentVectorConstants1.packedValues[28u].x) + quotientValue59)) * scalarValue156;
                intermediateValue33 = productValue263;
                intermediateValue35 = true;
                intermediateValue36 = productValue263 + scalarValue156;
            }
            float intermediateValue39;
            float intermediateValue41;
            float intermediateValue43;
            float intermediateValue45;
            float intermediateValue47;
            float intermediateValue49;
            if (intermediateValue35 && (int(intermediateValue33) < int(intermediateValue36)))
            {
                float intermediateValue77;
                float quotientValue16;
                float dotProductValue6;
                float sumValue45;
                float sumValue46;
                float sumValue47;
                float quotientValue18;
                float quotientValue19;
                float quotientValue20;
                float intermediateValue102;
                float intermediateValue103;
                float intermediateValue104;
                float intermediateValue105;
                float intermediateValue107;
                float intermediateValue40;
                float intermediateValue42;
                float intermediateValue44;
                float intermediateValue46;
                float intermediateValue48;
                float intermediateValue50;
                uint scalarValue157 = intermediateValue33;
                float scalarValue57 = 0.0;
                float scalarValue58 = 0.0;
                float scalarValue59 = 0.0;
                float scalarValue60 = 0.0;
                float scalarValue61 = 0.0;
                float scalarValue62 = 0.0;
                uint sampledTextureValue8;
                for (;;)
                {
                    sampledTextureValue8 = uint(int(uintBitsToFloat(texelFetch(zLightLookupArray, int(scalarValue157)).x)));
                    if (int(sampledTextureValue8) < int(0u))
                    {
                        intermediateValue40 = scalarValue57;
                        intermediateValue42 = scalarValue58;
                        intermediateValue44 = scalarValue59;
                        intermediateValue46 = scalarValue60;
                        intermediateValue48 = scalarValue61;
                        intermediateValue50 = scalarValue62;
                        break;
                    }
                    else
                    {
                        uint productValue264 = sampledTextureValue8 * 32u;
                        vec4 sampledTextureValue77 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue264)).x, texelFetch(zLights, int(productValue264 + 1u)).x, texelFetch(zLights, int(productValue264 + 2u)).x, texelFetch(zLights, int(productValue264 + 3u)).x));
                        float scalarValue158 = sampledTextureValue77.x;
                        float scalarValue159 = sampledTextureValue77.y;
                        float scalarValue160 = sampledTextureValue77.z;
                        float multiplyAddValue161 = fma(fragmentVectorConstants1.packedValues[6u].x, scalarValue160, fma(fragmentVectorConstants1.packedValues[5u].x, scalarValue159, scalarValue158 * fragmentVectorConstants1.packedValues[4u].x)) + (fragmentVectorConstants1.packedValues[7u].x - quotientValue45);
                        float multiplyAddValue162 = fma(fragmentVectorConstants1.packedValues[6u].y, scalarValue160, fma(fragmentVectorConstants1.packedValues[5u].y, scalarValue159, scalarValue158 * fragmentVectorConstants1.packedValues[4u].y)) + (fragmentVectorConstants1.packedValues[7u].y - quotientValue46);
                        float multiplyAddValue163 = fma(fragmentVectorConstants1.packedValues[6u].z, scalarValue160, fma(fragmentVectorConstants1.packedValues[5u].z, scalarValue159, scalarValue158 * fragmentVectorConstants1.packedValues[4u].z)) + (fragmentVectorConstants1.packedValues[7u].z - quotientValue47);
                        float inverseLengthValue33 = inversesqrt(dot(vec3(multiplyAddValue161, multiplyAddValue162, multiplyAddValue163), vec3(multiplyAddValue161, multiplyAddValue162, multiplyAddValue163)));
                        float productValue265 = inverseLengthValue33 * multiplyAddValue161;
                        float productValue266 = inverseLengthValue33 * multiplyAddValue162;
                        float productValue267 = inverseLengthValue33 * multiplyAddValue163;
                        float dotProductValue12 = dot(vec3(productValue252, productValue253, productValue254), vec3(productValue265, productValue266, productValue267));
                        intermediateValue77 = spvNMax(dotProductValue12, 0.0);
                        float dotProductValue13 = spvNMax(dot(vec3(productValue252, productValue253, productValue254), vec3(sumValue184, sumValue185, sumValue186)), 0.0);
                        float sumValue187 = fragmentVectorConstants1.packedValues[43u].y + 1.0;
                        float productValue268 = sumValue187 * sumValue187;
                        quotientValue16 = ((spvNMax((dotProductValue12 + fragmentVectorConstants1.packedValues[43u].y) / productValue268, 0.0) - intermediateValue77) * productValue260) + intermediateValue77;
                        dotProductValue6 = spvNMax((dot(vec3((-0.0) - productValue252, (-0.0) - productValue253, (-0.0) - productValue254), vec3(productValue265, productValue266, productValue267)) + fragmentVectorConstants1.packedValues[43u].y) / productValue268, 0.0) * productValue260;
                        float sumValue188 = productValue265 - quotientValue56;
                        float sumValue189 = productValue266 - quotientValue57;
                        float sumValue190 = productValue267 - quotientValue58;
                        float inverseLengthValue34 = inversesqrt(dot(vec3(sumValue188, sumValue189, sumValue190), vec3(sumValue188, sumValue189, sumValue190)));
                        float productValue269 = inverseLengthValue34 * sumValue188;
                        float productValue270 = inverseLengthValue34 * sumValue189;
                        float productValue271 = inverseLengthValue34 * sumValue190;
                        float scalarValue161 = spvNMax(bitwiseValue92, 0.0500000007450580596923828125);
                        float productValue272 = scalarValue161 * scalarValue161;
                        float productValue273 = productValue272 * productValue272;
                        float dotProductValue14 = spvNMax(dot(vec3(productValue252, productValue253, productValue254), vec3(productValue269, productValue270, productValue271)), 0.0);
                        float productValue274 = ((dotProductValue14 * dotProductValue14) * (productValue273 + (-1.0))) + 1.0;
                        float productValue275 = productValue272 * 0.5;
                        float sumValue191 = 1.0 - productValue275;
                        float sumValue192 = productValue275 + 9.9999997473787516355514526367188e-05;
                        float dotProductValue15 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue184, sumValue185, sumValue186), vec3(productValue269, productValue270, productValue271)), 0.0), 0.0, 1.0);
                        float productValue276 = dotProductValue15 * dotProductValue15;
                        float productValue277 = (productValue276 * productValue276) * dotProductValue15;
                        float productValue278 = (productValue277 * (1.0 - productValue257)) + productValue257;
                        float productValue279 = (productValue277 * (1.0 - productValue258)) + productValue258;
                        float productValue280 = (productValue277 * (1.0 - productValue259)) + productValue259;
                        sumValue45 = 1.0 - productValue278;
                        sumValue46 = 1.0 - productValue279;
                        sumValue47 = 1.0 - productValue280;
                        float quotientValue61 = ((dotProductValue13 / ((sumValue191 * dotProductValue13) + sumValue192)) * (productValue273 / ((productValue274 * productValue274) * 3.1415927410125732421875))) * (intermediateValue77 / ((sumValue191 * intermediateValue77) + sumValue192));
                        float productValue281 = ((intermediateValue77 * 4.0) * dotProductValue13) + 9.9999997473787516355514526367188e-05;
                        quotientValue18 = (productValue278 * quotientValue61) / productValue281;
                        quotientValue19 = (productValue279 * quotientValue61) / productValue281;
                        quotientValue20 = (productValue280 * quotientValue61) / productValue281;
                        float sumValue193 = scalarValue158 - multiplyAddValue149;
                        float sumValue194 = scalarValue159 - multiplyAddValue150;
                        float sumValue195 = scalarValue160 - multiplyAddValue151;
                        float productValue93;
                        if (fragmentVectorConstants1.packedValues[21u].x > 0.0)
                        {
                            float sumValue196 = (abs(sumValue194) + abs(sumValue193)) + abs(sumValue195);
                            productValue93 = sumValue196 * sumValue196;
                        }
                        else
                        {
                            productValue93 = dot(vec3(sumValue193, sumValue194, sumValue195), vec3(sumValue193, sumValue194, sumValue195));
                        }
                        float scalarValue162 = sampledTextureValue77.w;
                        float productValue282 = scalarValue162 * scalarValue162;
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        float branchMergedValue4;
                        if (!(productValue93 >= productValue282))
                        {
                            float intermediateValue106;
                            float intermediateValue108;
                            if (fragmentVectorConstants1.packedValues[23u].z != 0.0)
                            {
                                uint productValue283 = (sampledTextureValue8 * 32u) + 8u;
                                vec4 sampledTextureValue78 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue283)).x, texelFetch(zLights, int(productValue283 + 1u)).x, texelFetch(zLights, int(productValue283 + 2u)).x, texelFetch(zLights, int(productValue283 + 3u)).x));
                                uint productValue284 = (sampledTextureValue8 * 32u) + 12u;
                                vec4 sampledTextureValue79 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue284)).x, texelFetch(zLights, int(productValue284 + 1u)).x, texelFetch(zLights, int(productValue284 + 2u)).x, texelFetch(zLights, int(productValue284 + 3u)).x));
                                uint productValue285 = (sampledTextureValue8 * 32u) + 16u;
                                vec4 sampledTextureValue80 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue285)).x, texelFetch(zLights, int(productValue285 + 1u)).x, texelFetch(zLights, int(productValue285 + 2u)).x, texelFetch(zLights, int(productValue285 + 3u)).x));
                                uint productValue286 = (sampledTextureValue8 * 32u) + 20u;
                                vec4 sampledTextureValue81 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue286)).x, texelFetch(zLights, int(productValue286 + 1u)).x, texelFetch(zLights, int(productValue286 + 2u)).x, texelFetch(zLights, int(productValue286 + 3u)).x));
                                uint productValue287 = (sampledTextureValue8 * 32u) + 24u;
                                vec4 sampledTextureValue82 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue287)).x, texelFetch(zLights, int(productValue287 + 1u)).x, texelFetch(zLights, int(productValue287 + 2u)).x, texelFetch(zLights, int(productValue287 + 3u)).x));
                                uint productValue288 = (sampledTextureValue8 * 32u) + 28u;
                                vec4 sampledTextureValue83 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue288)).x, texelFetch(zLights, int(productValue288 + 1u)).x, texelFetch(zLights, int(productValue288 + 2u)).x, texelFetch(zLights, int(productValue288 + 3u)).x));
                                float sumValue197 = comparisonValue129 - scalarValue158;
                                float sumValue198 = comparisonValue130 - scalarValue159;
                                float sumValue199 = comparisonValue131 - scalarValue160;
                                float scalarValue163 = abs(sumValue197);
                                float scalarValue164 = abs(sumValue198);
                                float scalarValue165 = abs(sumValue199);
                                uint comparisonValue28;
                                if ((scalarValue163 >= scalarValue164) && (scalarValue163 >= scalarValue165))
                                {
                                    comparisonValue28 = uint(!(sumValue197 >= 0.0));
                                }
                                else
                                {
                                    uint branchMergedValue15;
                                    if (!(scalarValue164 >= scalarValue165))
                                    {
                                        branchMergedValue15 = (sumValue199 >= 0.0) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue15 = (sumValue198 >= 0.0) ? 2u : 3u;
                                    }
                                    comparisonValue28 = branchMergedValue15;
                                }
                                float sumValue200 = (-0.0) - sumValue197;
                                float intermediateValue158;
                                float intermediateValue159;
                                float intermediateValue160;
                                float intermediateValue161;
                                float sumValue87;
                                float intermediateValue162;
                                float intermediateValue163;
                                if (comparisonValue28 == 1u)
                                {
                                    intermediateValue158 = sampledTextureValue79.x;
                                    intermediateValue159 = sampledTextureValue79.y;
                                    intermediateValue160 = sampledTextureValue79.z;
                                    intermediateValue161 = sampledTextureValue79.w;
                                    sumValue87 = (-0.0) - sumValue199;
                                    intermediateValue162 = sumValue198;
                                    intermediateValue163 = sumValue197;
                                }
                                else
                                {
                                    float branchMergedValue16;
                                    float branchMergedValue38;
                                    float branchMergedValue39;
                                    float branchMergedValue40;
                                    float branchMergedValue41;
                                    float branchMergedValue42;
                                    float branchMergedValue43;
                                    if (comparisonValue28 == 2u)
                                    {
                                        branchMergedValue16 = (-0.0) - sumValue198;
                                        branchMergedValue38 = (-0.0) - sumValue199;
                                        branchMergedValue39 = sumValue200;
                                        branchMergedValue40 = sampledTextureValue80.w;
                                        branchMergedValue41 = sampledTextureValue80.z;
                                        branchMergedValue42 = sampledTextureValue80.y;
                                        branchMergedValue43 = sampledTextureValue80.x;
                                    }
                                    else
                                    {
                                        float branchMergedValue52;
                                        float branchMergedValue54;
                                        float branchMergedValue55;
                                        float branchMergedValue56;
                                        float branchMergedValue57;
                                        float branchMergedValue58;
                                        float branchMergedValue59;
                                        if (comparisonValue28 == 3u)
                                        {
                                            branchMergedValue52 = sumValue198;
                                            branchMergedValue54 = sumValue199;
                                            branchMergedValue55 = sumValue200;
                                            branchMergedValue56 = sampledTextureValue81.w;
                                            branchMergedValue57 = sampledTextureValue81.z;
                                            branchMergedValue58 = sampledTextureValue81.y;
                                            branchMergedValue59 = sampledTextureValue81.x;
                                        }
                                        else
                                        {
                                            float branchMergedValue61;
                                            float branchMergedValue62;
                                            float branchMergedValue63;
                                            float branchMergedValue64;
                                            float branchMergedValue65;
                                            float branchMergedValue66;
                                            float branchMergedValue67;
                                            if (comparisonValue28 == 4u)
                                            {
                                                branchMergedValue61 = (-0.0) - sumValue199;
                                                branchMergedValue62 = sumValue198;
                                                branchMergedValue63 = sumValue200;
                                                branchMergedValue64 = sampledTextureValue82.w;
                                                branchMergedValue65 = sampledTextureValue82.z;
                                                branchMergedValue66 = sampledTextureValue82.y;
                                                branchMergedValue67 = sampledTextureValue82.x;
                                            }
                                            else
                                            {
                                                bool comparisonValue132 = comparisonValue28 == 5u;
                                                branchMergedValue61 = comparisonValue132 ? sumValue199 : sumValue200;
                                                branchMergedValue62 = sumValue198;
                                                branchMergedValue63 = comparisonValue132 ? sumValue197 : sumValue199;
                                                branchMergedValue64 = comparisonValue132 ? sampledTextureValue83.w : sampledTextureValue78.w;
                                                branchMergedValue65 = comparisonValue132 ? sampledTextureValue83.z : sampledTextureValue78.z;
                                                branchMergedValue66 = comparisonValue132 ? sampledTextureValue83.y : sampledTextureValue78.y;
                                                branchMergedValue67 = comparisonValue132 ? sampledTextureValue83.x : sampledTextureValue78.x;
                                            }
                                            branchMergedValue52 = branchMergedValue61;
                                            branchMergedValue54 = branchMergedValue62;
                                            branchMergedValue55 = branchMergedValue63;
                                            branchMergedValue56 = branchMergedValue64;
                                            branchMergedValue57 = branchMergedValue65;
                                            branchMergedValue58 = branchMergedValue66;
                                            branchMergedValue59 = branchMergedValue67;
                                        }
                                        branchMergedValue16 = branchMergedValue52;
                                        branchMergedValue38 = branchMergedValue54;
                                        branchMergedValue39 = branchMergedValue55;
                                        branchMergedValue40 = branchMergedValue56;
                                        branchMergedValue41 = branchMergedValue57;
                                        branchMergedValue42 = branchMergedValue58;
                                        branchMergedValue43 = branchMergedValue59;
                                    }
                                    intermediateValue158 = branchMergedValue43;
                                    intermediateValue159 = branchMergedValue42;
                                    intermediateValue160 = branchMergedValue41;
                                    intermediateValue161 = branchMergedValue40;
                                    sumValue87 = branchMergedValue39;
                                    intermediateValue162 = branchMergedValue38;
                                    intermediateValue163 = branchMergedValue16;
                                }
                                float branchMergedValue17;
                                float branchMergedValue44;
                                if ((intermediateValue160 == 0.0) && (intermediateValue161 == 0.0))
                                {
                                    branchMergedValue17 = 1.0;
                                    branchMergedValue44 = 0.0;
                                }
                                else
                                {
                                    float multiplyAddValue164 = fma(fragmentVectorConstants1.packedValues[2u].w, intermediateValue163, fma(fragmentVectorConstants1.packedValues[1u].w, intermediateValue162, fragmentVectorConstants1.packedValues[0u].w * sumValue87)) + fragmentVectorConstants1.packedValues[3u].w;
                                    float inverseLengthValue35 = inversesqrt(dot(vec3(productValue249, productValue250, productValue251), vec3(productValue249, productValue250, productValue251)));
                                    float sumValue201 = (-0.0) - sumValue198;
                                    float sumValue202 = (-0.0) - sumValue199;
                                    float inverseLengthValue36 = inversesqrt(dot(vec3(sumValue200, sumValue201, sumValue202), vec3(sumValue200, sumValue201, sumValue202)));
                                    float dotProductValue16 = spvNMin(spvNMax(dot(vec3(inverseLengthValue36 * sumValue200, inverseLengthValue36 * sumValue201, inverseLengthValue36 * sumValue202), vec3(inverseLengthValue35 * productValue249, inverseLengthValue35 * productValue250, inverseLengthValue35 * productValue251)), fragmentVectorConstants1.packedValues[38u].x), 1.0);
                                    float sumValue203 = intermediateValue160 - intermediateValue158;
                                    float productValue289 = fragmentVectorConstants1.packedValues[17u].x * sumValue203;
                                    float multiplyAddValue165 = (fma(fragmentVectorConstants1.packedValues[2u].x, intermediateValue163, fma(fragmentVectorConstants1.packedValues[1u].x, intermediateValue162, fragmentVectorConstants1.packedValues[0u].x * sumValue87)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue164;
                                    float multiplyAddValue166 = (fma(fragmentVectorConstants1.packedValues[2u].y, intermediateValue163, fma(fragmentVectorConstants1.packedValues[1u].y, intermediateValue162, fragmentVectorConstants1.packedValues[0u].y * sumValue87)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue164;
                                    float quotientValue11 = 0.5 / fragmentVectorConstants1.packedValues[17u].x;
                                    float quotientValue12 = 0.5 / fragmentVectorConstants1.packedValues[17u].y;
                                    float sumValue204 = intermediateValue161 - intermediateValue159;
                                    float productValue290 = fragmentVectorConstants1.packedValues[17u].y * sumValue204;
                                    vec4 sampledTextureValue84 = textureLod(sampler2D(pointLightShadowTextureAtlasTexture, pointLightShadowTextureAtlasSampler), vec2(spvNMin(spvNMax((((floor(((multiplyAddValue165 * 0.5) + 0.5) * productValue289) + 0.5) / productValue289) * sumValue203) + intermediateValue158, quotientValue11 + intermediateValue158), intermediateValue160 - quotientValue11), spvNMin(spvNMax((((floor((0.5 - (multiplyAddValue166 * 0.5)) * productValue290) + 0.5) / productValue290) * sumValue204) + intermediateValue159, quotientValue12 + intermediateValue159), intermediateValue161 - quotientValue12)), 0.0);
                                    float scalarValue166 = sampledTextureValue84.x;
                                    float multiplyAddValue167 = float(scalarValue166 >= (((fma(fragmentVectorConstants1.packedValues[2u].z, intermediateValue163, fma(fragmentVectorConstants1.packedValues[1u].z, intermediateValue162, fragmentVectorConstants1.packedValues[0u].z * sumValue87)) + fragmentVectorConstants1.packedValues[3u].z) - ((fragmentVectorConstants1.packedValues[17u].z / spvNMax(productValue289, 1.0)) * (((sqrt(1.0 - (dotProductValue16 * dotProductValue16)) / dotProductValue16) * fragmentVectorConstants1.packedValues[8u].y) + fragmentVectorConstants1.packedValues[8u].x))) / multiplyAddValue164));
                                    float branchMergedValue53;
                                    float branchMergedValue60;
                                    if (productValue260 > 0.0)
                                    {
                                        float multiplyAddValue168 = fma(fragmentVectorConstants1.packedValues[36u].w, scalarValue166, fma(fragmentVectorConstants1.packedValues[35u].w, multiplyAddValue166, fragmentVectorConstants1.packedValues[34u].w * multiplyAddValue165)) + fragmentVectorConstants1.packedValues[37u].w;
                                        float multiplyAddValue169 = (fma(fragmentVectorConstants1.packedValues[36u].x, scalarValue166, fma(fragmentVectorConstants1.packedValues[35u].x, multiplyAddValue166, fragmentVectorConstants1.packedValues[34u].x * multiplyAddValue165)) + fragmentVectorConstants1.packedValues[37u].x) / multiplyAddValue168;
                                        float multiplyAddValue170 = (fma(fragmentVectorConstants1.packedValues[36u].y, scalarValue166, fma(fragmentVectorConstants1.packedValues[35u].y, multiplyAddValue166, fragmentVectorConstants1.packedValues[34u].y * multiplyAddValue165)) + fragmentVectorConstants1.packedValues[37u].y) / multiplyAddValue168;
                                        float multiplyAddValue171 = (fma(fragmentVectorConstants1.packedValues[36u].z, scalarValue166, fma(fragmentVectorConstants1.packedValues[35u].z, multiplyAddValue166, fragmentVectorConstants1.packedValues[34u].z * multiplyAddValue165)) + fragmentVectorConstants1.packedValues[37u].z) / multiplyAddValue168;
                                        float nonlinearValue6 = spvNClamp((sqrt(((intermediateValue162 * intermediateValue162) + (sumValue87 * sumValue87)) + (intermediateValue163 * intermediateValue163)) - sqrt(((multiplyAddValue170 * multiplyAddValue170) + (multiplyAddValue169 * multiplyAddValue169)) + (multiplyAddValue171 * multiplyAddValue171))) * fragmentVectorConstants1.packedValues[43u].z, 0.0, 1.0);
                                        branchMergedValue53 = 1.0 - ((nonlinearValue6 * nonlinearValue6) * (3.0 - (nonlinearValue6 * 2.0)));
                                        branchMergedValue60 = multiplyAddValue167;
                                    }
                                    else
                                    {
                                        branchMergedValue53 = 1.0;
                                        branchMergedValue60 = multiplyAddValue167;
                                    }
                                    branchMergedValue17 = branchMergedValue53;
                                    branchMergedValue44 = branchMergedValue60;
                                }
                                intermediateValue106 = branchMergedValue44;
                                intermediateValue108 = branchMergedValue17;
                            }
                            else
                            {
                                intermediateValue106 = 1.0;
                                intermediateValue108 = 1.0;
                            }
                            uint productValue291 = (sampledTextureValue8 * 32u) + 4u;
                            vec4 sampledTextureValue85 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue291)).x, texelFetch(zLights, int(productValue291 + 1u)).x, texelFetch(zLights, int(productValue291 + 2u)).x, texelFetch(zLights, int(productValue291 + 3u)).x));
                            float quotientValue62 = productValue93 / (productValue282 + 9.9999997473787516355514526367188e-05);
                            float productValue292 = spvNClamp(1.0 - (quotientValue62 * quotientValue62), 0.0, 1.0);
                            float quotientValue63 = (productValue292 * productValue292) * (1.0 / spvNMax(productValue93, 0.100000001490116119384765625));
                            float productValue107;
                            if (fragmentVectorConstants1.packedValues[20u].x > 0.0)
                            {
                                float quotientValue64 = spvNClamp(((1.0 - quotientValue63) - fragmentVectorConstants1.packedValues[33u].x) / (fragmentVectorConstants1.packedValues[33u].y - fragmentVectorConstants1.packedValues[33u].x), 0.0, 1.0);
                                productValue107 = spvNClamp((((quotientValue64 * quotientValue64) * fragmentVectorConstants1.packedValues[33u].z) * (3.0 - (quotientValue64 * 2.0))) + fragmentVectorConstants1.packedValues[33u].w, 0.0, 1.0) * quotientValue63;
                            }
                            else
                            {
                                productValue107 = quotientValue63;
                            }
                            float productValue293 = productValue107 * sampledTextureValue85.w;
                            branchMergedValue = productValue293 * sampledTextureValue85.x;
                            branchMergedValue1 = intermediateValue108;
                            branchMergedValue2 = intermediateValue106;
                            branchMergedValue3 = productValue293 * sampledTextureValue85.z;
                            branchMergedValue4 = productValue293 * sampledTextureValue85.y;
                        }
                        else
                        {
                            branchMergedValue = 0.0;
                            branchMergedValue1 = 1.0;
                            branchMergedValue2 = 1.0;
                            branchMergedValue3 = 0.0;
                            branchMergedValue4 = 0.0;
                        }
                        intermediateValue102 = branchMergedValue;
                        intermediateValue107 = branchMergedValue1;
                        intermediateValue105 = branchMergedValue2;
                        intermediateValue104 = branchMergedValue3;
                        intermediateValue103 = branchMergedValue4;
                        float productValue294 = intermediateValue105 * quotientValue16;
                        float productValue295 = dotProductValue6 * intermediateValue107;
                        float productValue296 = sumValue183 * 0.3183098733425140380859375;
                        float productValue297 = (((productValue296 * intermediateValue102) * (productValue295 + (productValue294 * sumValue45))) * fragmentVectorConstants1.packedValues[30u].x) + scalarValue60;
                        float productValue298 = (((productValue296 * intermediateValue103) * (productValue295 + (productValue294 * sumValue46))) * fragmentVectorConstants1.packedValues[30u].x) + scalarValue61;
                        float productValue299 = (((productValue296 * intermediateValue104) * (productValue295 + (productValue294 * sumValue47))) * fragmentVectorConstants1.packedValues[30u].x) + scalarValue62;
                        float productValue300 = fragmentVectorConstants1.packedValues[30u].y * (intermediateValue105 * intermediateValue77);
                        float productValue301 = ((productValue300 * quotientValue18) * intermediateValue102) + scalarValue57;
                        float productValue302 = ((productValue300 * quotientValue19) * intermediateValue103) + scalarValue58;
                        float productValue303 = ((productValue300 * quotientValue20) * intermediateValue104) + scalarValue59;
                        uint sumValue205 = scalarValue157 + 1u;
                        if (int(sumValue205) < int(intermediateValue36))
                        {
                            scalarValue157 = sumValue205;
                            scalarValue57 = productValue301;
                            scalarValue58 = productValue302;
                            scalarValue59 = productValue303;
                            scalarValue60 = productValue297;
                            scalarValue61 = productValue298;
                            scalarValue62 = productValue299;
                            continue;
                        }
                        else
                        {
                            intermediateValue40 = productValue301;
                            intermediateValue42 = productValue302;
                            intermediateValue44 = productValue303;
                            intermediateValue46 = productValue297;
                            intermediateValue48 = productValue298;
                            intermediateValue50 = productValue299;
                            break;
                        }
                    }
                }
                intermediateValue39 = intermediateValue40;
                intermediateValue41 = intermediateValue42;
                intermediateValue43 = intermediateValue44;
                intermediateValue45 = intermediateValue46;
                intermediateValue47 = intermediateValue48;
                intermediateValue49 = intermediateValue50;
            }
            else
            {
                intermediateValue39 = 0.0;
                intermediateValue41 = 0.0;
                intermediateValue43 = 0.0;
                intermediateValue45 = 0.0;
                intermediateValue47 = 0.0;
                intermediateValue49 = 0.0;
            }
            float sumValue206 = 1.0 - fragmentVectorConstants1.packedValues[44u].x;
            branchMergedValue5 = sumValue206 * intermediateValue49;
            branchMergedValue8 = sumValue206 * intermediateValue47;
            branchMergedValue9 = sumValue206 * intermediateValue45;
            branchMergedValue10 = sumValue206 * intermediateValue43;
            branchMergedValue11 = sumValue206 * intermediateValue41;
            branchMergedValue12 = sumValue206 * intermediateValue39;
        }
        else
        {
            branchMergedValue5 = 0.0;
            branchMergedValue8 = 0.0;
            branchMergedValue9 = 0.0;
            branchMergedValue10 = 0.0;
            branchMergedValue11 = 0.0;
            branchMergedValue12 = 0.0;
        }
        intermediateValue18 = branchMergedValue12;
        intermediateValue19 = branchMergedValue11;
        intermediateValue20 = branchMergedValue10;
        intermediateValue21 = branchMergedValue9;
        intermediateValue22 = branchMergedValue8;
        intermediateValue23 = branchMergedValue5;
    }
    else
    {
        intermediateValue18 = 0.0;
        intermediateValue19 = 0.0;
        intermediateValue20 = 0.0;
        intermediateValue21 = 0.0;
        intermediateValue22 = 0.0;
        intermediateValue23 = 0.0;
    }
    uint bitwiseValue95 = uint(floor(float((scalarValue155 >> 8u) & 255u)));
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    if (((bitwiseValue95 & 1u) == 0u) && ((fragmentVectorConstants1.packedValues[23u].z != 0.0) && (fragmentVectorConstants1.packedValues[31u].w != 0.0)))
    {
        float productValue304 = ((multiplyAddValue149 + (-0.5)) - fragmentVectorConstants1.packedValues[27u].x) + (productValue249 * 0.20000000298023223876953125);
        float productValue305 = ((multiplyAddValue150 + (-0.5)) - fragmentVectorConstants1.packedValues[27u].y) + (productValue250 * 0.20000000298023223876953125);
        float productValue306 = ((multiplyAddValue151 + (-0.5)) - fragmentVectorConstants1.packedValues[27u].z) + (productValue251 * 0.20000000298023223876953125);
        float productValue307 = floor(productValue304 * 0.0625) * 16.0;
        float productValue308 = floor(productValue305 * 0.0625) * 16.0;
        float productValue309 = floor(productValue306 * 0.0625) * 16.0;
        uint productValue310 = uint(int(floor(float(int(uint(int(floor(productValue304))))) * 0.0625)));
        uint productValue311 = uint(int(floor(float(int(uint(int(floor(productValue305))))) * 0.0625)));
        uint productValue312 = uint(int(floor(float(int(uint(int(floor(productValue306))))) * 0.0625)));
        float sumValue207 = productValue304 - productValue307;
        float sumValue208 = productValue305 - productValue308;
        float sumValue209 = productValue306 - productValue309;
        uint bitwiseValue96 = (productValue311 << 16u) | (productValue310 & 65535u);
        uint bitwiseValue97 = (productValue312 & 65535u) | 131072u;
        uint productValue313 = productValue310 * 1540483477u;
        uint productValue314 = productValue311 * 1540483477u;
        uint productValue315 = productValue312 * 1540483477u;
        uint bitwiseValue98 = (((((((((productValue313 >> 24u) ^ productValue313) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue314 >> 24u) ^ productValue314) * 1540483477u)) * 1540483477u) ^ (((productValue315 >> 24u) ^ productValue315) * 1540483477u)) * 1540483477u) ^ 2418085729u;
        uint bitwiseValue99 = ((bitwiseValue98 >> 13u) ^ bitwiseValue98) * 1540483477u;
        uint bitwiseValue100 = (bitwiseValue99 >> 15u) ^ bitwiseValue99;
        uint bitwiseValue101 = bitwiseValue100 >> 16u;
        uint bitwiseValue102 = bitwiseValue100 & 65535u;
        uint comparisonValue133 = uint(bitwiseValue102 == bitwiseValue101) | (bitwiseValue102 ^ bitwiseValue101);
        uint sumValue210 = uint(fragmentVectorConstants1.packedValues[22u].x) + 4294967295u;
        bool intermediateValue38;
        uint scalarValue167 = comparisonValue133;
        uint scalarValue82 = 0u;
        uint scalarValue83 = 0u;
        uint sampledTextureValue5;
        uint bitwiseValue11;
        for (;;)
        {
            bitwiseValue11 = scalarValue167 & sumValue210;
            uint sampledTextureValue86 = texelFetch(gpuEntryBuffer, int((bitwiseValue11 * 4u) + 2u)).x & 65535u;
            bool sampledTextureValue87 = (texelFetch(gpuEntryBuffer, int((bitwiseValue11 * 4u) + 1u)).x == bitwiseValue97) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue11 * 4u)).x == bitwiseValue96) && (sampledTextureValue86 == comparisonValue133));
            sampledTextureValue5 = sampledTextureValue87 ? texelFetch(gpuEntryBuffer, int((bitwiseValue11 * 4u) + 3u)).x : scalarValue82;
            if ((sampledTextureValue86 == 0u) || sampledTextureValue87)
            {
                intermediateValue38 = sampledTextureValue87;
                break;
            }
            else
            {
                uint sumValue125 = scalarValue83 + 1u;
                if (int(sumValue125) < int(8u))
                {
                    scalarValue167 = bitwiseValue11 + 1u;
                    scalarValue82 = sampledTextureValue5;
                    scalarValue83 = sumValue125;
                    continue;
                }
                else
                {
                    intermediateValue38 = false;
                    break;
                }
            }
        }
        uint bitwiseValue39 = sampledTextureValue5 >> 2u;
        float branchMergedValue6;
        float branchMergedValue18;
        float branchMergedValue19;
        if (intermediateValue38)
        {
            float scalarValue168 = abs(productValue249);
            float scalarValue169 = abs(productValue250);
            float scalarValue170 = abs(productValue251);
            float branchMergedValue49;
            float branchMergedValue50;
            float branchMergedValue51;
            if (((bitwiseValue95 & 2u) == 0u) && (((scalarValue168 >= 1.0) || (scalarValue169 >= 1.0)) || (scalarValue170 >= 1.0)))
            {
                float intermediateValue118;
                float intermediateValue119;
                float intermediateValue120;
                float intermediateValue121;
                float intermediateValue123;
                float intermediateValue125;
                float intermediateValue127;
                float intermediateValue129;
                float intermediateValue131;
                float intermediateValue133;
                float intermediateValue134;
                float intermediateValue135;
                float productValue62;
                float productValue63;
                float productValue64;
                float sumValue17;
                float sumValue18;
                float sumValue19;
                float sumValue20;
                float sumValue21;
                float sumValue22;
                float sumValue23;
                float sumValue24;
                float sumValue25;
                float productValue65;
                float productValue66;
                float productValue67;
                float productValue68;
                bool comparisonValue7;
                for (;;)
                {
                    float dotProductValue17 = dot(vec3(sumValue207, sumValue208, sumValue209), vec3(scalarValue168, scalarValue169, scalarValue170));
                    float dotProductValue18 = dot(vec3(sumValue207, sumValue208, sumValue209), vec3(scalarValue170, scalarValue168, scalarValue169));
                    float dotProductValue19 = dot(vec3(sumValue207, sumValue208, sumValue209), vec3(scalarValue169, scalarValue170, scalarValue168));
                    float comparisonValue134 = (((inverseLengthValue31 * inverseLengthValue30) * ((comparisonValue127 + sumValue182) + comparisonValue128)) > 0.0) ? ceil(dotProductValue17) : floor(dotProductValue17);
                    float scalarValue171 = floor(dotProductValue18);
                    float scalarValue172 = floor(dotProductValue19);
                    productValue62 = ((comparisonValue134 * scalarValue168) + (scalarValue171 * scalarValue170)) + (scalarValue172 * scalarValue169);
                    productValue63 = ((comparisonValue134 * scalarValue169) + (scalarValue171 * scalarValue168)) + (scalarValue172 * scalarValue170);
                    productValue64 = ((comparisonValue134 * scalarValue170) + (scalarValue171 * scalarValue169)) + (scalarValue172 * scalarValue168);
                    sumValue17 = productValue62 + scalarValue170;
                    sumValue18 = productValue63 + scalarValue168;
                    sumValue19 = productValue64 + scalarValue169;
                    sumValue20 = productValue62 + scalarValue169;
                    sumValue21 = productValue63 + scalarValue170;
                    sumValue22 = productValue64 + scalarValue168;
                    sumValue23 = sumValue17 + scalarValue169;
                    sumValue24 = sumValue21 + scalarValue168;
                    sumValue25 = sumValue19 + scalarValue168;
                    float sumValue211 = dotProductValue18 - scalarValue171;
                    float sumValue212 = dotProductValue19 - scalarValue172;
                    float sumValue213 = 1.0 - sumValue211;
                    float sumValue214 = 1.0 - sumValue212;
                    productValue65 = sumValue214 * sumValue213;
                    productValue66 = sumValue214 * sumValue211;
                    productValue67 = sumValue213 * sumValue212;
                    productValue68 = sumValue212 * sumValue211;
                    comparisonValue7 = ((productValue64 >= 0.0) && ((productValue62 >= 0.0) && (productValue63 >= 0.0))) && ((sumValue25 < 16.0) && ((sumValue23 < 16.0) && (sumValue24 < 16.0)));
                    if (comparisonValue7)
                    {
                        uvec4 sampledTextureValue88 = texelFetch(voxelBuffer, int(((uint(productValue63) + bitwiseValue39) + (uint(productValue64) << 4u)) + (uint(productValue62) << 8u)));
                        uint scalarValue173 = sampledTextureValue88.x;
                        float bitwiseValue15;
                        float intermediateValue81;
                        float intermediateValue82;
                        if (scalarValue173 == 0u)
                        {
                            bitwiseValue15 = 0.0;
                            intermediateValue81 = 0.0;
                            intermediateValue82 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue103 = float(scalarValue173 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue15 = bitwiseValue103 * float(scalarValue173 & 255u);
                            intermediateValue81 = bitwiseValue103 * float((scalarValue173 >> 8u) & 255u);
                            intermediateValue82 = bitwiseValue103 * float((scalarValue173 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue89 = texelFetch(voxelBuffer, int(((uint(sumValue18) + bitwiseValue39) + (uint(sumValue19) << 4u)) + (uint(sumValue17) << 8u)));
                        uint scalarValue174 = sampledTextureValue89.x;
                        float bitwiseValue19;
                        float intermediateValue88;
                        float intermediateValue89;
                        if (scalarValue174 == 0u)
                        {
                            bitwiseValue19 = 0.0;
                            intermediateValue88 = 0.0;
                            intermediateValue89 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue104 = float(scalarValue174 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue19 = bitwiseValue104 * float(scalarValue174 & 255u);
                            intermediateValue88 = bitwiseValue104 * float((scalarValue174 >> 8u) & 255u);
                            intermediateValue89 = bitwiseValue104 * float((scalarValue174 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue90 = texelFetch(voxelBuffer, int(((uint(sumValue21) + bitwiseValue39) + (uint(sumValue22) << 4u)) + (uint(sumValue20) << 8u)));
                        uint scalarValue175 = sampledTextureValue90.x;
                        float bitwiseValue23;
                        float intermediateValue109;
                        float intermediateValue110;
                        if (scalarValue175 == 0u)
                        {
                            bitwiseValue23 = 0.0;
                            intermediateValue109 = 0.0;
                            intermediateValue110 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue105 = float(scalarValue175 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue23 = bitwiseValue105 * float(scalarValue175 & 255u);
                            intermediateValue109 = bitwiseValue105 * float((scalarValue175 >> 8u) & 255u);
                            intermediateValue110 = bitwiseValue105 * float((scalarValue175 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue91 = texelFetch(voxelBuffer, int(((uint(sumValue24) + bitwiseValue39) + (uint(sumValue25) << 4u)) + (uint(sumValue23) << 8u)));
                        uint scalarValue176 = sampledTextureValue91.x;
                        float branchMergedValue13;
                        float branchMergedValue20;
                        float branchMergedValue21;
                        float branchMergedValue22;
                        float branchMergedValue23;
                        float branchMergedValue24;
                        float branchMergedValue25;
                        float branchMergedValue26;
                        float branchMergedValue27;
                        float branchMergedValue28;
                        float branchMergedValue45;
                        float branchMergedValue46;
                        if (scalarValue176 == 0u)
                        {
                            branchMergedValue13 = 0.0;
                            branchMergedValue20 = 0.0;
                            branchMergedValue21 = 0.0;
                            branchMergedValue22 = intermediateValue110;
                            branchMergedValue23 = intermediateValue109;
                            branchMergedValue24 = bitwiseValue23;
                            branchMergedValue25 = intermediateValue89;
                            branchMergedValue26 = intermediateValue88;
                            branchMergedValue27 = bitwiseValue19;
                            branchMergedValue28 = intermediateValue82;
                            branchMergedValue45 = intermediateValue81;
                            branchMergedValue46 = bitwiseValue15;
                        }
                        else
                        {
                            float bitwiseValue106 = float(scalarValue176 >> 24u) * 9.2272217443678528070449829101562e-05;
                            branchMergedValue13 = bitwiseValue106 * float((scalarValue176 >> 16u) & 255u);
                            branchMergedValue20 = bitwiseValue106 * float((scalarValue176 >> 8u) & 255u);
                            branchMergedValue21 = bitwiseValue106 * float(scalarValue176 & 255u);
                            branchMergedValue22 = intermediateValue110;
                            branchMergedValue23 = intermediateValue109;
                            branchMergedValue24 = bitwiseValue23;
                            branchMergedValue25 = intermediateValue89;
                            branchMergedValue26 = intermediateValue88;
                            branchMergedValue27 = bitwiseValue19;
                            branchMergedValue28 = intermediateValue82;
                            branchMergedValue45 = intermediateValue81;
                            branchMergedValue46 = bitwiseValue15;
                        }
                        intermediateValue118 = branchMergedValue46;
                        intermediateValue119 = branchMergedValue45;
                        intermediateValue120 = branchMergedValue28;
                        intermediateValue121 = branchMergedValue27;
                        intermediateValue123 = branchMergedValue26;
                        intermediateValue125 = branchMergedValue25;
                        intermediateValue127 = branchMergedValue24;
                        intermediateValue129 = branchMergedValue23;
                        intermediateValue131 = branchMergedValue22;
                        intermediateValue133 = branchMergedValue21;
                        intermediateValue134 = branchMergedValue20;
                        intermediateValue135 = branchMergedValue13;
                        break;
                    }
                    else
                    {
                        float intermediateValue91;
                        float intermediateValue92;
                        float intermediateValue93;
                        float sumValue51;
                        float sumValue52;
                        float sumValue53;
                        uint comparisonValue11;
                        bool comparisonValue12;
                        for (;;)
                        {
                            sumValue51 = productValue62 + productValue307;
                            sumValue52 = productValue63 + productValue308;
                            sumValue53 = productValue64 + productValue309;
                            uint comparisonValue135 = ((((uint(productValue62 >= 16.0) << 1u) | uint(productValue62 < 0.0)) | (uint(productValue63 < 0.0) << 2u)) | (uint(productValue63 >= 16.0) << 3u)) | (uint(productValue64 < 0.0) << 4u);
                            comparisonValue11 = intermediateValue[comparisonValue135 | (uint(productValue64 >= 16.0) << 5u)];
                            comparisonValue12 = ((((comparisonValue135 | (uint(productValue64 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue135 & 31u))) == 0u;
                            uint sampledTextureValue15;
                            if (comparisonValue12)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue11 & 31u))) == 0u)
                                {
                                    intermediateValue91 = 0.0;
                                    intermediateValue92 = 0.0;
                                    intermediateValue93 = 0.0;
                                    break;
                                }
                                sampledTextureValue15 = ((((uint(sumValue51 - (floor(sumValue51 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue52 - (floor(sumValue52 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue53 - (floor(sumValue53 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue11)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue15 = ((((uint(productValue64) << 4u) & 240u) | (uint(productValue63) & 15u)) | ((uint(productValue62) << 8u) & 3840u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue92 = texelFetch(voxelBuffer, int(sampledTextureValue15));
                            uint scalarValue177 = sampledTextureValue92.x;
                            if (scalarValue177 == 0u)
                            {
                                intermediateValue91 = 0.0;
                                intermediateValue92 = 0.0;
                                intermediateValue93 = 0.0;
                                break;
                            }
                            float bitwiseValue107 = float(scalarValue177 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue91 = bitwiseValue107 * float(scalarValue177 & 255u);
                            intermediateValue92 = bitwiseValue107 * float((scalarValue177 >> 8u) & 255u);
                            intermediateValue93 = bitwiseValue107 * float((scalarValue177 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue122;
                        float intermediateValue124;
                        float intermediateValue126;
                        float sumValue65;
                        float sumValue66;
                        float sumValue67;
                        uint comparisonValue17;
                        bool comparisonValue18;
                        for (;;)
                        {
                            sumValue65 = sumValue17 + productValue307;
                            sumValue66 = sumValue18 + productValue308;
                            sumValue67 = sumValue19 + productValue309;
                            uint comparisonValue136 = ((((uint(sumValue17 >= 16.0) << 1u) | uint(sumValue17 < 0.0)) | (uint(sumValue18 < 0.0) << 2u)) | (uint(sumValue18 >= 16.0) << 3u)) | (uint(sumValue19 < 0.0) << 4u);
                            comparisonValue17 = intermediateValue[comparisonValue136 | (uint(sumValue19 >= 16.0) << 5u)];
                            comparisonValue18 = ((((comparisonValue136 | (uint(sumValue19 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue136 & 31u))) == 0u;
                            uint sampledTextureValue29;
                            if (comparisonValue18)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue17 & 31u))) == 0u)
                                {
                                    intermediateValue122 = 0.0;
                                    intermediateValue124 = 0.0;
                                    intermediateValue126 = 0.0;
                                    break;
                                }
                                sampledTextureValue29 = ((((uint(sumValue65 - (floor(sumValue65 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue66 - (floor(sumValue66 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue67 - (floor(sumValue67 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue17)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue29 = ((((uint(sumValue19) << 4u) & 240u) | (uint(sumValue18) & 15u)) | ((uint(sumValue17) << 8u) & 3840u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue93 = texelFetch(voxelBuffer, int(sampledTextureValue29));
                            uint scalarValue178 = sampledTextureValue93.x;
                            if (scalarValue178 == 0u)
                            {
                                intermediateValue122 = 0.0;
                                intermediateValue124 = 0.0;
                                intermediateValue126 = 0.0;
                                break;
                            }
                            float bitwiseValue108 = float(scalarValue178 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue122 = bitwiseValue108 * float(scalarValue178 & 255u);
                            intermediateValue124 = bitwiseValue108 * float((scalarValue178 >> 8u) & 255u);
                            intermediateValue126 = bitwiseValue108 * float((scalarValue178 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue128;
                        float intermediateValue130;
                        float intermediateValue132;
                        float sumValue74;
                        float sumValue75;
                        float sumValue76;
                        uint comparisonValue23;
                        bool comparisonValue24;
                        for (;;)
                        {
                            sumValue74 = sumValue20 + productValue307;
                            sumValue75 = sumValue21 + productValue308;
                            sumValue76 = sumValue22 + productValue309;
                            uint comparisonValue137 = ((((uint(sumValue20 >= 16.0) << 1u) | uint(sumValue20 < 0.0)) | (uint(sumValue21 < 0.0) << 2u)) | (uint(sumValue21 >= 16.0) << 3u)) | (uint(sumValue22 < 0.0) << 4u);
                            comparisonValue23 = intermediateValue[comparisonValue137 | (uint(sumValue22 >= 16.0) << 5u)];
                            comparisonValue24 = ((((comparisonValue137 | (uint(sumValue22 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue137 & 31u))) == 0u;
                            uint sampledTextureValue33;
                            if (comparisonValue24)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue23 & 31u))) == 0u)
                                {
                                    intermediateValue128 = 0.0;
                                    intermediateValue130 = 0.0;
                                    intermediateValue132 = 0.0;
                                    break;
                                }
                                sampledTextureValue33 = ((((uint(sumValue74 - (floor(sumValue74 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue75 - (floor(sumValue75 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue76 - (floor(sumValue76 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue23)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue33 = ((((uint(sumValue22) << 4u) & 240u) | (uint(sumValue21) & 15u)) | ((uint(sumValue20) << 8u) & 3840u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue94 = texelFetch(voxelBuffer, int(sampledTextureValue33));
                            uint scalarValue179 = sampledTextureValue94.x;
                            if (scalarValue179 == 0u)
                            {
                                intermediateValue128 = 0.0;
                                intermediateValue130 = 0.0;
                                intermediateValue132 = 0.0;
                                break;
                            }
                            float bitwiseValue109 = float(scalarValue179 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue128 = bitwiseValue109 * float(scalarValue179 & 255u);
                            intermediateValue130 = bitwiseValue109 * float((scalarValue179 >> 8u) & 255u);
                            intermediateValue132 = bitwiseValue109 * float((scalarValue179 >> 16u) & 255u);
                            break;
                        }
                        float sumValue215 = sumValue23 + productValue307;
                        float sumValue216 = sumValue24 + productValue308;
                        float sumValue217 = sumValue25 + productValue309;
                        uint comparisonValue138 = ((((uint(sumValue23 >= 16.0) << 1u) | uint(sumValue23 < 0.0)) | (uint(sumValue24 < 0.0) << 2u)) | (uint(sumValue24 >= 16.0) << 3u)) | (uint(sumValue25 < 0.0) << 4u);
                        uint comparisonValue139 = comparisonValue138 | (uint(sumValue25 >= 16.0) << 5u);
                        uint sampledTextureValue37;
                        if ((((comparisonValue139 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue138 & 31u))) == 0u)
                        {
                            if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (intermediateValue[comparisonValue139] & 31u))) == 0u)
                            {
                                intermediateValue118 = intermediateValue91;
                                intermediateValue119 = intermediateValue92;
                                intermediateValue120 = intermediateValue93;
                                intermediateValue121 = intermediateValue122;
                                intermediateValue123 = intermediateValue124;
                                intermediateValue125 = intermediateValue126;
                                intermediateValue127 = intermediateValue128;
                                intermediateValue129 = intermediateValue130;
                                intermediateValue131 = intermediateValue132;
                                intermediateValue133 = 0.0;
                                intermediateValue134 = 0.0;
                                intermediateValue135 = 0.0;
                                break;
                            }
                            sampledTextureValue37 = ((((uint(sumValue215 - (floor(sumValue215 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue216 - (floor(sumValue216 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue217 - (floor(sumValue217 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + intermediateValue[comparisonValue139])).x >> 2u);
                        }
                        else
                        {
                            sampledTextureValue37 = ((((uint(sumValue25) << 4u) & 240u) | (uint(sumValue24) & 15u)) | ((uint(sumValue23) << 8u) & 3840u)) + bitwiseValue39;
                        }
                        uvec4 sampledTextureValue95 = texelFetch(voxelBuffer, int(sampledTextureValue37));
                        uint scalarValue180 = sampledTextureValue95.x;
                        if (scalarValue180 == 0u)
                        {
                            intermediateValue118 = intermediateValue91;
                            intermediateValue119 = intermediateValue92;
                            intermediateValue120 = intermediateValue93;
                            intermediateValue121 = intermediateValue122;
                            intermediateValue123 = intermediateValue124;
                            intermediateValue125 = intermediateValue126;
                            intermediateValue127 = intermediateValue128;
                            intermediateValue129 = intermediateValue130;
                            intermediateValue131 = intermediateValue132;
                            intermediateValue133 = 0.0;
                            intermediateValue134 = 0.0;
                            intermediateValue135 = 0.0;
                            break;
                        }
                        float bitwiseValue110 = float(scalarValue180 >> 24u) * 9.2272217443678528070449829101562e-05;
                        intermediateValue118 = intermediateValue91;
                        intermediateValue119 = intermediateValue92;
                        intermediateValue120 = intermediateValue93;
                        intermediateValue121 = intermediateValue122;
                        intermediateValue123 = intermediateValue124;
                        intermediateValue125 = intermediateValue126;
                        intermediateValue127 = intermediateValue128;
                        intermediateValue129 = intermediateValue130;
                        intermediateValue131 = intermediateValue132;
                        intermediateValue133 = bitwiseValue110 * float(scalarValue180 & 255u);
                        intermediateValue134 = bitwiseValue110 * float((scalarValue180 >> 8u) & 255u);
                        intermediateValue135 = bitwiseValue110 * float((scalarValue180 >> 16u) & 255u);
                        break;
                    }
                }
                branchMergedValue49 = (((intermediateValue121 * productValue66) + (intermediateValue118 * productValue65)) + (intermediateValue127 * productValue67)) + (intermediateValue133 * productValue68);
                branchMergedValue50 = (((intermediateValue125 * productValue66) + (intermediateValue120 * productValue65)) + (intermediateValue131 * productValue67)) + (intermediateValue135 * productValue68);
                branchMergedValue51 = (((intermediateValue123 * productValue66) + (intermediateValue119 * productValue65)) + (intermediateValue129 * productValue67)) + (intermediateValue134 * productValue68);
            }
            else
            {
                float intermediateValue137;
                float intermediateValue138;
                float intermediateValue139;
                float intermediateValue140;
                float intermediateValue142;
                float intermediateValue144;
                float intermediateValue146;
                float intermediateValue148;
                float intermediateValue150;
                float intermediateValue152;
                float intermediateValue153;
                float intermediateValue154;
                float intermediateValue63;
                float intermediateValue64;
                float intermediateValue65;
                uint intermediateValue66;
                uint intermediateValue67;
                uint intermediateValue68;
                float intermediateValue71;
                float sumValue33;
                float sumValue34;
                float sumValue35;
                float sumValue36;
                float sumValue37;
                float sumValue38;
                bool comparisonValue9;
                uint productValue69;
                uint productValue70;
                uint productValue71;
                uint productValue72;
                uint productValue73;
                uint productValue74;
                for (;;)
                {
                    intermediateValue63 = floor(sumValue207);
                    intermediateValue64 = floor(sumValue208);
                    intermediateValue65 = floor(sumValue209);
                    float sumValue218 = sumValue207 - intermediateValue63;
                    float sumValue219 = sumValue208 - intermediateValue64;
                    float sumValue220 = sumValue209 - intermediateValue65;
                    uint comparisonValue140 = ((uint(sumValue219 >= sumValue220) << 1u) | uint(sumValue218 >= sumValue219)) | (uint(sumValue218 >= sumValue220) << 2u);
                    intermediateValue66 = uint(intermediateValue63);
                    intermediateValue67 = uint(intermediateValue64);
                    intermediateValue68 = uint(intermediateValue65);
                    float scalarValue181 = spvNMin(sumValue218, sumValue219);
                    float scalarValue182 = spvNMax(sumValue218, sumValue219);
                    intermediateValue71 = spvNMin(scalarValue181, sumValue220);
                    float scalarValue183 = spvNMax(scalarValue182, sumValue220);
                    float scalarValue184 = spvNMax(spvNMin(scalarValue182, sumValue220), scalarValue181);
                    sumValue33 = 1.0 - scalarValue183;
                    sumValue34 = scalarValue183 - scalarValue184;
                    sumValue35 = scalarValue184 - intermediateValue71;
                    sumValue36 = intermediateValue63 + 1.0;
                    sumValue37 = intermediateValue64 + 1.0;
                    sumValue38 = intermediateValue65 + 1.0;
                    comparisonValue9 = (((intermediateValue63 >= 0.0) && (intermediateValue64 >= 0.0)) && (intermediateValue65 >= 0.0)) && (((sumValue36 < 16.0) && (sumValue37 < 16.0)) && (sumValue38 < 16.0));
                    productValue69 = 0u + (comparisonValue140 * 3u);
                    productValue70 = 1u + (comparisonValue140 * 3u);
                    productValue71 = 2u + (comparisonValue140 * 3u);
                    productValue72 = 0u + (comparisonValue140 * 3u);
                    productValue73 = 1u + (comparisonValue140 * 3u);
                    productValue74 = 2u + (comparisonValue140 * 3u);
                    if (comparisonValue9)
                    {
                        uint bitwiseValue111 = intermediateValue68 << 4u;
                        uint sumValue221 = intermediateValue67 + bitwiseValue39;
                        uint bitwiseValue112 = sumValue221 + (intermediateValue66 << 8u);
                        uvec4 sampledTextureValue96 = texelFetch(voxelBuffer, int(bitwiseValue112 + bitwiseValue111));
                        uint scalarValue185 = sampledTextureValue96.x;
                        float bitwiseValue17;
                        float intermediateValue84;
                        float intermediateValue85;
                        if (scalarValue185 == 0u)
                        {
                            bitwiseValue17 = 0.0;
                            intermediateValue84 = 0.0;
                            intermediateValue85 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue113 = float(scalarValue185 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue17 = bitwiseValue113 * float(scalarValue185 & 255u);
                            intermediateValue84 = bitwiseValue113 * float((scalarValue185 >> 8u) & 255u);
                            intermediateValue85 = bitwiseValue113 * float((scalarValue185 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue97 = texelFetch(voxelBuffer, int(((intermediateValue1[productValue70] + sumValue221) + ((intermediateValue1[productValue69] + intermediateValue66) << 8u)) + ((intermediateValue1[productValue71] + intermediateValue68) << 4u)));
                        uint scalarValue186 = sampledTextureValue97.x;
                        float bitwiseValue21;
                        float intermediateValue95;
                        float intermediateValue96;
                        if (scalarValue186 == 0u)
                        {
                            bitwiseValue21 = 0.0;
                            intermediateValue95 = 0.0;
                            intermediateValue96 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue114 = float(scalarValue186 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue21 = bitwiseValue114 * float(scalarValue186 & 255u);
                            intermediateValue95 = bitwiseValue114 * float((scalarValue186 >> 8u) & 255u);
                            intermediateValue96 = bitwiseValue114 * float((scalarValue186 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue98 = texelFetch(voxelBuffer, int(((intermediateValue2[productValue73] + sumValue221) + ((intermediateValue2[productValue72] + intermediateValue66) << 8u)) + ((intermediateValue2[productValue74] + intermediateValue68) << 4u)));
                        uint scalarValue187 = sampledTextureValue98.x;
                        float bitwiseValue26;
                        float intermediateValue112;
                        float intermediateValue113;
                        if (scalarValue187 == 0u)
                        {
                            bitwiseValue26 = 0.0;
                            intermediateValue112 = 0.0;
                            intermediateValue113 = 0.0;
                        }
                        else
                        {
                            float bitwiseValue115 = float(scalarValue187 >> 24u) * 9.2272217443678528070449829101562e-05;
                            bitwiseValue26 = bitwiseValue115 * float(scalarValue187 & 255u);
                            intermediateValue112 = bitwiseValue115 * float((scalarValue187 >> 8u) & 255u);
                            intermediateValue113 = bitwiseValue115 * float((scalarValue187 >> 16u) & 255u);
                        }
                        uvec4 sampledTextureValue99 = texelFetch(voxelBuffer, int((bitwiseValue112 + 273u) + bitwiseValue111));
                        uint scalarValue188 = sampledTextureValue99.x;
                        float branchMergedValue14;
                        float branchMergedValue29;
                        float branchMergedValue30;
                        float branchMergedValue31;
                        float branchMergedValue32;
                        float branchMergedValue33;
                        float branchMergedValue34;
                        float branchMergedValue35;
                        float branchMergedValue36;
                        float branchMergedValue37;
                        float branchMergedValue47;
                        float branchMergedValue48;
                        if (scalarValue188 == 0u)
                        {
                            branchMergedValue14 = 0.0;
                            branchMergedValue29 = 0.0;
                            branchMergedValue30 = 0.0;
                            branchMergedValue31 = intermediateValue113;
                            branchMergedValue32 = intermediateValue112;
                            branchMergedValue33 = bitwiseValue26;
                            branchMergedValue34 = intermediateValue96;
                            branchMergedValue35 = intermediateValue95;
                            branchMergedValue36 = bitwiseValue21;
                            branchMergedValue37 = intermediateValue85;
                            branchMergedValue47 = intermediateValue84;
                            branchMergedValue48 = bitwiseValue17;
                        }
                        else
                        {
                            float bitwiseValue116 = float(scalarValue188 >> 24u) * 9.2272217443678528070449829101562e-05;
                            branchMergedValue14 = bitwiseValue116 * float((scalarValue188 >> 16u) & 255u);
                            branchMergedValue29 = bitwiseValue116 * float((scalarValue188 >> 8u) & 255u);
                            branchMergedValue30 = bitwiseValue116 * float(scalarValue188 & 255u);
                            branchMergedValue31 = intermediateValue113;
                            branchMergedValue32 = intermediateValue112;
                            branchMergedValue33 = bitwiseValue26;
                            branchMergedValue34 = intermediateValue96;
                            branchMergedValue35 = intermediateValue95;
                            branchMergedValue36 = bitwiseValue21;
                            branchMergedValue37 = intermediateValue85;
                            branchMergedValue47 = intermediateValue84;
                            branchMergedValue48 = bitwiseValue17;
                        }
                        intermediateValue137 = branchMergedValue48;
                        intermediateValue138 = branchMergedValue47;
                        intermediateValue139 = branchMergedValue37;
                        intermediateValue140 = branchMergedValue36;
                        intermediateValue142 = branchMergedValue35;
                        intermediateValue144 = branchMergedValue34;
                        intermediateValue146 = branchMergedValue33;
                        intermediateValue148 = branchMergedValue32;
                        intermediateValue150 = branchMergedValue31;
                        intermediateValue152 = branchMergedValue30;
                        intermediateValue153 = branchMergedValue29;
                        intermediateValue154 = branchMergedValue14;
                        break;
                    }
                    else
                    {
                        float intermediateValue98;
                        float intermediateValue99;
                        float intermediateValue100;
                        float sumValue55;
                        float sumValue56;
                        float sumValue57;
                        float sumValue58;
                        float sumValue59;
                        float sumValue60;
                        float sumValue61;
                        float sumValue62;
                        float sumValue63;
                        uint comparisonValue14;
                        bool comparisonValue15;
                        for (;;)
                        {
                            sumValue55 = float(intermediateValue1[productValue69]) + intermediateValue63;
                            sumValue56 = float(intermediateValue1[productValue70]) + intermediateValue64;
                            sumValue57 = float(intermediateValue1[productValue71]) + intermediateValue65;
                            sumValue58 = float(intermediateValue2[productValue72]) + intermediateValue63;
                            sumValue59 = float(intermediateValue2[productValue73]) + intermediateValue64;
                            sumValue60 = float(intermediateValue2[productValue74]) + intermediateValue65;
                            sumValue61 = intermediateValue63 + productValue307;
                            sumValue62 = intermediateValue64 + productValue308;
                            sumValue63 = intermediateValue65 + productValue309;
                            uint comparisonValue141 = ((((uint(intermediateValue63 >= 16.0) << 1u) | uint(intermediateValue63 < 0.0)) | (uint(intermediateValue64 < 0.0) << 2u)) | (uint(intermediateValue64 >= 16.0) << 3u)) | (uint(intermediateValue65 < 0.0) << 4u);
                            comparisonValue14 = intermediateValue[comparisonValue141 | (uint(intermediateValue65 >= 16.0) << 5u)];
                            comparisonValue15 = ((((comparisonValue141 | (uint(intermediateValue65 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue141 & 31u))) == 0u;
                            uint sampledTextureValue18;
                            if (comparisonValue15)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue14 & 31u))) == 0u)
                                {
                                    intermediateValue98 = 0.0;
                                    intermediateValue99 = 0.0;
                                    intermediateValue100 = 0.0;
                                    break;
                                }
                                sampledTextureValue18 = ((((uint(sumValue61 - (floor(sumValue61 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue62 - (floor(sumValue62 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue63 - (floor(sumValue63 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue14)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue18 = ((((intermediateValue66 << 8u) & 3840u) | (intermediateValue67 & 15u)) | ((intermediateValue68 << 4u) & 240u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue100 = texelFetch(voxelBuffer, int(sampledTextureValue18));
                            uint scalarValue189 = sampledTextureValue100.x;
                            if (scalarValue189 == 0u)
                            {
                                intermediateValue98 = 0.0;
                                intermediateValue99 = 0.0;
                                intermediateValue100 = 0.0;
                                break;
                            }
                            float bitwiseValue117 = float(scalarValue189 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue98 = bitwiseValue117 * float(scalarValue189 & 255u);
                            intermediateValue99 = bitwiseValue117 * float((scalarValue189 >> 8u) & 255u);
                            intermediateValue100 = bitwiseValue117 * float((scalarValue189 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue141;
                        float intermediateValue143;
                        float intermediateValue145;
                        float sumValue68;
                        float sumValue69;
                        float sumValue70;
                        uint comparisonValue20;
                        bool comparisonValue21;
                        for (;;)
                        {
                            sumValue68 = sumValue55 + productValue307;
                            sumValue69 = sumValue56 + productValue308;
                            sumValue70 = sumValue57 + productValue309;
                            uint comparisonValue142 = ((((uint(sumValue55 >= 16.0) << 1u) | uint(sumValue55 < 0.0)) | (uint(sumValue56 < 0.0) << 2u)) | (uint(sumValue56 >= 16.0) << 3u)) | (uint(sumValue57 < 0.0) << 4u);
                            comparisonValue20 = intermediateValue[comparisonValue142 | (uint(sumValue57 >= 16.0) << 5u)];
                            comparisonValue21 = ((((comparisonValue142 | (uint(sumValue57 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue142 & 31u))) == 0u;
                            uint sampledTextureValue31;
                            if (comparisonValue21)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue20 & 31u))) == 0u)
                                {
                                    intermediateValue141 = 0.0;
                                    intermediateValue143 = 0.0;
                                    intermediateValue145 = 0.0;
                                    break;
                                }
                                sampledTextureValue31 = ((((uint(sumValue68 - (floor(sumValue68 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue69 - (floor(sumValue69 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue70 - (floor(sumValue70 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue20)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue31 = ((((uint(sumValue55) << 8u) & 3840u) | (uint(sumValue56) & 15u)) | ((uint(sumValue57) << 4u) & 240u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue101 = texelFetch(voxelBuffer, int(sampledTextureValue31));
                            uint scalarValue190 = sampledTextureValue101.x;
                            if (scalarValue190 == 0u)
                            {
                                intermediateValue141 = 0.0;
                                intermediateValue143 = 0.0;
                                intermediateValue145 = 0.0;
                                break;
                            }
                            float bitwiseValue118 = float(scalarValue190 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue141 = bitwiseValue118 * float(scalarValue190 & 255u);
                            intermediateValue143 = bitwiseValue118 * float((scalarValue190 >> 8u) & 255u);
                            intermediateValue145 = bitwiseValue118 * float((scalarValue190 >> 16u) & 255u);
                            break;
                        }
                        float intermediateValue147;
                        float intermediateValue149;
                        float intermediateValue151;
                        float sumValue77;
                        float sumValue78;
                        float sumValue79;
                        uint comparisonValue26;
                        bool comparisonValue27;
                        for (;;)
                        {
                            sumValue77 = sumValue58 + productValue307;
                            sumValue78 = sumValue59 + productValue308;
                            sumValue79 = sumValue60 + productValue309;
                            uint comparisonValue143 = ((((uint(sumValue58 >= 16.0) << 1u) | uint(sumValue58 < 0.0)) | (uint(sumValue59 < 0.0) << 2u)) | (uint(sumValue59 >= 16.0) << 3u)) | (uint(sumValue60 < 0.0) << 4u);
                            comparisonValue26 = intermediateValue[comparisonValue143 | (uint(sumValue60 >= 16.0) << 5u)];
                            comparisonValue27 = ((((comparisonValue143 | (uint(sumValue60 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue143 & 31u))) == 0u;
                            uint sampledTextureValue35;
                            if (comparisonValue27)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (comparisonValue26 & 31u))) == 0u)
                                {
                                    intermediateValue147 = 0.0;
                                    intermediateValue149 = 0.0;
                                    intermediateValue151 = 0.0;
                                    break;
                                }
                                sampledTextureValue35 = ((((uint(sumValue77 - (floor(sumValue77 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue78 - (floor(sumValue78 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue79 - (floor(sumValue79 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + comparisonValue26)).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue35 = ((((uint(sumValue58) << 8u) & 3840u) | (uint(sumValue59) & 15u)) | ((uint(sumValue60) << 4u) & 240u)) + bitwiseValue39;
                            }
                            uvec4 sampledTextureValue102 = texelFetch(voxelBuffer, int(sampledTextureValue35));
                            uint scalarValue191 = sampledTextureValue102.x;
                            if (scalarValue191 == 0u)
                            {
                                intermediateValue147 = 0.0;
                                intermediateValue149 = 0.0;
                                intermediateValue151 = 0.0;
                                break;
                            }
                            float bitwiseValue119 = float(scalarValue191 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue147 = bitwiseValue119 * float(scalarValue191 & 255u);
                            intermediateValue149 = bitwiseValue119 * float((scalarValue191 >> 8u) & 255u);
                            intermediateValue151 = bitwiseValue119 * float((scalarValue191 >> 16u) & 255u);
                            break;
                        }
                        float sumValue222 = sumValue36 + productValue307;
                        float sumValue223 = sumValue37 + productValue308;
                        float sumValue224 = sumValue38 + productValue309;
                        uint comparisonValue92 = ((((uint(sumValue36 >= 16.0) << 1u) | uint(sumValue36 < 0.0)) | (uint(sumValue37 < 0.0) << 2u)) | (uint(sumValue37 >= 16.0) << 3u)) | (uint(sumValue38 < 0.0) << 4u);
                        uint comparisonValue144 = comparisonValue92 | (uint(sumValue38 >= 16.0) << 5u);
                        uint sampledTextureValue39;
                        if ((((comparisonValue144 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue92 & 31u))) == 0u)
                        {
                            if ((texelFetch(voxelBuffer, int(bitwiseValue39 + 4096u)).x & (1u << (intermediateValue[comparisonValue144] & 31u))) == 0u)
                            {
                                intermediateValue137 = intermediateValue98;
                                intermediateValue138 = intermediateValue99;
                                intermediateValue139 = intermediateValue100;
                                intermediateValue140 = intermediateValue141;
                                intermediateValue142 = intermediateValue143;
                                intermediateValue144 = intermediateValue145;
                                intermediateValue146 = intermediateValue147;
                                intermediateValue148 = intermediateValue149;
                                intermediateValue150 = intermediateValue151;
                                intermediateValue152 = 0.0;
                                intermediateValue153 = 0.0;
                                intermediateValue154 = 0.0;
                                break;
                            }
                            sampledTextureValue39 = ((((uint(sumValue222 - (floor(sumValue222 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue223 - (floor(sumValue223 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue224 - (floor(sumValue224 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue39 + 4097u) + intermediateValue[comparisonValue144])).x >> 2u);
                        }
                        else
                        {
                            sampledTextureValue39 = ((((uint(sumValue36) << 8u) & 3840u) | (uint(sumValue37) & 15u)) | ((uint(sumValue38) << 4u) & 240u)) + bitwiseValue39;
                        }
                        uvec4 sampledTextureValue103 = texelFetch(voxelBuffer, int(sampledTextureValue39));
                        uint scalarValue192 = sampledTextureValue103.x;
                        if (scalarValue192 == 0u)
                        {
                            intermediateValue137 = intermediateValue98;
                            intermediateValue138 = intermediateValue99;
                            intermediateValue139 = intermediateValue100;
                            intermediateValue140 = intermediateValue141;
                            intermediateValue142 = intermediateValue143;
                            intermediateValue144 = intermediateValue145;
                            intermediateValue146 = intermediateValue147;
                            intermediateValue148 = intermediateValue149;
                            intermediateValue150 = intermediateValue151;
                            intermediateValue152 = 0.0;
                            intermediateValue153 = 0.0;
                            intermediateValue154 = 0.0;
                            break;
                        }
                        float bitwiseValue120 = float(scalarValue192 >> 24u) * 9.2272217443678528070449829101562e-05;
                        intermediateValue137 = intermediateValue98;
                        intermediateValue138 = intermediateValue99;
                        intermediateValue139 = intermediateValue100;
                        intermediateValue140 = intermediateValue141;
                        intermediateValue142 = intermediateValue143;
                        intermediateValue144 = intermediateValue145;
                        intermediateValue146 = intermediateValue147;
                        intermediateValue148 = intermediateValue149;
                        intermediateValue150 = intermediateValue151;
                        intermediateValue152 = bitwiseValue120 * float(scalarValue192 & 255u);
                        intermediateValue153 = bitwiseValue120 * float((scalarValue192 >> 8u) & 255u);
                        intermediateValue154 = bitwiseValue120 * float((scalarValue192 >> 16u) & 255u);
                        break;
                    }
                }
                branchMergedValue49 = (((intermediateValue140 * sumValue34) + (intermediateValue137 * sumValue33)) + (intermediateValue146 * sumValue35)) + (intermediateValue152 * intermediateValue71);
                branchMergedValue50 = (((intermediateValue144 * sumValue34) + (intermediateValue139 * sumValue33)) + (intermediateValue150 * sumValue35)) + (intermediateValue154 * intermediateValue71);
                branchMergedValue51 = (((intermediateValue142 * sumValue34) + (intermediateValue138 * sumValue33)) + (intermediateValue148 * sumValue35)) + (intermediateValue153 * intermediateValue71);
            }
            branchMergedValue6 = branchMergedValue49;
            branchMergedValue18 = branchMergedValue50;
            branchMergedValue19 = branchMergedValue51;
        }
        else
        {
            branchMergedValue6 = 0.0;
            branchMergedValue18 = 0.0;
            branchMergedValue19 = 0.0;
        }
        intermediateValue25 = branchMergedValue6;
        intermediateValue26 = branchMergedValue19;
        intermediateValue27 = branchMergedValue18;
    }
    else
    {
        intermediateValue25 = bitwiseValue94 * float((scalarValue153 >> 8u) & 255u);
        intermediateValue26 = bitwiseValue94 * float(scalarValue153 & 255u);
        intermediateValue27 = bitwiseValue94 * float((scalarValue154 >> 8u) & 255u);
    }
    float productValue316 = bitwiseValue93 * bitwiseValue93;
    float productValue317 = productValue316 * productValue316;
    float productValue318 = (((fragmentVectorConstants1.packedValues[26u].y * (productValue316 - productValue317)) + productValue317) * bitwiseValue93) * fragmentVectorConstants1.packedValues[41u].w;
    float productValue319 = fragmentVectorConstants1.packedValues[30u].w * sumValue183;
    float productValue320 = scalarValue144 * 65535.0;
    float scalarValue193 = floor(productValue320);
    fragmentColor0.x = (scalarValue142 * 0.5) + 0.5;
    fragmentColor0.y = (scalarValue143 * 0.5) + 0.5;
    fragmentColor0.z = scalarValue193 * 1.525902189314365386962890625e-05;
    fragmentColor0.w = productValue320 - scalarValue193;
    fragmentColor1.x = (productValue319 * spvNMax((productValue318 * fragmentVectorConstants1.packedValues[41u].x) + (fragmentVectorConstants1.packedValues[19u].w * intermediateValue25), fragmentVectorConstants1.packedValues[24u].x * fragmentVectorConstants1.packedValues[24u].w)) + intermediateValue21;
    fragmentColor1.y = (productValue319 * spvNMax((productValue318 * fragmentVectorConstants1.packedValues[41u].y) + (fragmentVectorConstants1.packedValues[19u].w * intermediateValue26), fragmentVectorConstants1.packedValues[24u].y * fragmentVectorConstants1.packedValues[24u].w)) + intermediateValue22;
    fragmentColor1.z = (productValue319 * spvNMax((productValue318 * fragmentVectorConstants1.packedValues[41u].z) + (fragmentVectorConstants1.packedValues[19u].w * intermediateValue27), fragmentVectorConstants1.packedValues[24u].z * fragmentVectorConstants1.packedValues[24u].w)) + intermediateValue23;
#endif
    fragmentColor1.w = 1.0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    fragmentColor2.x = 0.0;
    fragmentColor2.y = 0.0;
    fragmentColor2.z = 0.0;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor2.x = intermediateValue36;
    fragmentColor2.y = intermediateValue35;
    fragmentColor2.z = intermediateValue34;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor2.x = intermediateValue45;
    fragmentColor2.y = intermediateValue46;
    fragmentColor2.z = intermediateValue47;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor2.x = intermediateValue14;
    fragmentColor2.y = intermediateValue15;
    fragmentColor2.z = intermediateValue16;
#elif (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_GPUBLOCK_LIGHTING == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor2.x = intermediateValue18;
    fragmentColor2.y = intermediateValue19;
    fragmentColor2.z = intermediateValue20;
#endif
    fragmentColor2.w = 1.0;
}
