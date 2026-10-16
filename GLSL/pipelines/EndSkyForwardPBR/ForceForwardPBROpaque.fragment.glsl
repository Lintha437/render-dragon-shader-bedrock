#version 460
#extension GL_GOOGLE_include_directive : require
// EndSkyForwardPBR / ForceForwardPBROpaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/EndSkyForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[72u] != 0.0;
    precise float nonlinearValue6 = log2(spvNMax(scalarValue10, 0.0)) * 2.2000000476837158203125;
    precise float nonlinearValue7 = log2(spvNMax(scalarValue11, 0.0)) * 2.2000000476837158203125;
    precise float nonlinearValue8 = log2(spvNMax(scalarValue12, 0.0)) * 2.2000000476837158203125;
    precise float productValue39 = scalarValue10 * 0.077399380505084991455078125;
    precise float productValue40 = scalarValue11 * 0.077399380505084991455078125;
    precise float productValue41 = scalarValue12 * 0.077399380505084991455078125;
    precise float sumValue12 = scalarValue10 + 0.054999999701976776123046875;
    precise float sumValue13 = scalarValue11 + 0.054999999701976776123046875;
    precise float sumValue14 = scalarValue12 + 0.054999999701976776123046875;
    precise float productValue42 = sumValue12 * 0.947867333889007568359375;
    precise float productValue43 = sumValue13 * 0.947867333889007568359375;
    precise float productValue44 = sumValue14 * 0.947867333889007568359375;
    precise float nonlinearValue9 = log2(productValue42) * 2.400000095367431640625;
    precise float nonlinearValue10 = log2(productValue43) * 2.400000095367431640625;
    precise float nonlinearValue11 = log2(productValue44) * 2.400000095367431640625;
    precise float quotientValue12 = varyingColor1.x / varyingColor1.z;
    precise float quotientValue13 = varyingColor1.y / varyingColor1.z;
    precise float quotientValue14 = varyingColor1.z / varyingColor1.z;
    precise float sumValue15 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[4u].x;
    precise float sumValue16 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[4u].y;
    precise float sumValue17 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[4u].z;
    vec3 vectorValue1 = vec3(sumValue15, sumValue16, sumValue17);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    precise float productValue45 = inverseLengthValue2 * sumValue15;
    precise float productValue46 = inverseLengthValue2 * sumValue16;
    precise float productValue47 = inverseLengthValue2 * sumValue17;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue20;
    float intermediateValue22;
    if (fragmentScalarConstants1.packedValues[56u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[72u] != 0.0;
    float quotientValue = varyingColor1.x / varyingColor1.z;
    float quotientValue1 = varyingColor1.y / varyingColor1.z;
    float quotientValue8 = varyingColor1.z / varyingColor1.z;
    float sumValue1 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[4u].x;
    float sumValue2 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[4u].y;
    float sumValue3 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[4u].z;
    vec3 vectorValue = vec3(sumValue1, sumValue2, sumValue3);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue18;
    float intermediateValue20;
    if (fragmentScalarConstants1.packedValues[56u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(skyTextureTexture, skyTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[18u].x != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(scalarValue, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(scalarValue1, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(scalarValue2, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (scalarValue <= 0.040449999272823333740234375) ? (scalarValue * 0.077399380505084991455078125) : exp2(log2((scalarValue + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (scalarValue1 <= 0.040449999272823333740234375) ? (scalarValue1 * 0.077399380505084991455078125) : exp2(log2((scalarValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (scalarValue2 <= 0.040449999272823333740234375) ? (scalarValue2 * 0.077399380505084991455078125) : exp2(log2((scalarValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float quotientValue = varyingColor1.x / varyingColor1.z;
    float quotientValue1 = varyingColor1.y / varyingColor1.z;
    float sumValue = fragmentVectorConstants1.packedValues[8u].w + fragmentVectorConstants1.packedValues[7u].w;
    float quotientValue2 = (quotientValue * fragmentVectorConstants1.packedValues[5u].x) / sumValue;
    float quotientValue3 = (quotientValue1 * fragmentVectorConstants1.packedValues[6u].y) / sumValue;
    float quotientValue4 = fragmentVectorConstants1.packedValues[8u].z / sumValue;
    float sumValue1 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[4u].x;
    float sumValue2 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[4u].y;
    float sumValue3 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[4u].z;
    float inverseLengthValue = inversesqrt(dot(vec3(sumValue1, sumValue2, sumValue3), vec3(sumValue1, sumValue2, sumValue3)));
    float productValue = inverseLengthValue * sumValue1;
    float productValue1 = inverseLengthValue * sumValue2;
    float productValue2 = inverseLengthValue * sumValue3;
    bool comparisonValue = fragmentVectorConstants1.packedValues[14u].y != 0.0;
    float productValue3;
    float productValue4;
    float productValue5;
    if ((comparisonValue && (fragmentVectorConstants1.packedValues[14u].z != 0.0)) && (fragmentVectorConstants1.packedValues[20u].w != 0.0))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float productValue48 = quotientValue12 * fragmentScalarConstants1.packedValues[20u];
        precise float productValue49 = quotientValue13 * fragmentScalarConstants1.packedValues[25u];
        float multiplyAddValue27 = fma(quotientValue14, fragmentScalarConstants1.packedValues[31u], fragmentScalarConstants1.packedValues[35u]);
        precise float quotientValue15 = productValue48 / multiplyAddValue27;
        precise float quotientValue16 = productValue49 / multiplyAddValue27;
        precise float quotientValue17 = fragmentScalarConstants1.packedValues[34u] / multiplyAddValue27;
        vec3 vectorValue2 = vec3(quotientValue15, quotientValue16, quotientValue17);
        precise float nonlinearValue12 = sqrt(rdDot3Precise2(vectorValue2, vectorValue2)) / fragmentScalarConstants1.packedValues[46u];
        precise float sumValue18 = nonlinearValue12 + fragmentScalarConstants1.packedValues[96u];
        precise float sumValue19 = sumValue18 - fragmentScalarConstants1.packedValues[44u];
        precise float productValue50 = sumValue19 * fragmentScalarConstants1.packedValues[45u];
        float scalarValue21 = spvNClamp(productValue50, 0.0, 1.0);
        float intermediateValue19;
        float intermediateValue21;
        float intermediateValue23;
        if (scalarValue21 > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue1 = fma(quotientValue8, fragmentScalarConstants1.packedValues[31u], fragmentScalarConstants1.packedValues[35u]);
        vec3 quotientValue9 = vec3((quotientValue * fragmentScalarConstants1.packedValues[20u]) / multiplyAddValue1, (quotientValue1 * fragmentScalarConstants1.packedValues[25u]) / multiplyAddValue1, fragmentScalarConstants1.packedValues[34u] / multiplyAddValue1);
        float nonlinearValue3 = spvNClamp((((sqrt(rdDot3Precise2(quotientValue9, quotientValue9)) / fragmentScalarConstants1.packedValues[46u]) + fragmentScalarConstants1.packedValues[96u]) - fragmentScalarConstants1.packedValues[44u]) * fragmentScalarConstants1.packedValues[45u], 0.0, 1.0);
        float intermediateValue17;
        float intermediateValue19;
        float intermediateValue21;
        if (nonlinearValue3 > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue3 = spvNMax(fragmentVectorConstants1.packedValues[9u].w + (fragmentVectorConstants1.packedValues[25u].x * fragmentVectorConstants1.packedValues[25u].w), fragmentVectorConstants1.packedValues[10u].x * fragmentVectorConstants1.packedValues[10u].w) * fragmentVectorConstants1.packedValues[14u].z;
        productValue4 = spvNMax(fragmentVectorConstants1.packedValues[9u].w + (fragmentVectorConstants1.packedValues[25u].y * fragmentVectorConstants1.packedValues[25u].w), fragmentVectorConstants1.packedValues[10u].y * fragmentVectorConstants1.packedValues[10u].w) * fragmentVectorConstants1.packedValues[14u].z;
        productValue5 = spvNMax(fragmentVectorConstants1.packedValues[9u].w + (fragmentVectorConstants1.packedValues[25u].z * fragmentVectorConstants1.packedValues[25u].w), fragmentVectorConstants1.packedValues[10u].z * fragmentVectorConstants1.packedValues[10u].w) * fragmentVectorConstants1.packedValues[14u].z;
    }
    else
    {
        productValue3 = 0.0;
        productValue4 = 0.0;
        productValue5 = 0.0;
    }
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (fragmentVectorConstants1.packedValues[14u].x != 0.0)
    {
        float nonlinearValue = spvNClamp(((fragmentVectorConstants1.packedValues[24u].x - fragmentVectorConstants1.packedValues[11u].x) + (sqrt(((quotientValue3 * quotientValue3) + (quotientValue2 * quotientValue2)) + (quotientValue4 * quotientValue4)) / fragmentVectorConstants1.packedValues[11u].z)) * fragmentVectorConstants1.packedValues[11u].y, 0.0, 1.0);
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (nonlinearValue > 0.0)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float intermediateValue25;
            float intermediateValue26;
            float intermediateValue27;
            if (fragmentScalarConstants1.packedValues[57u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue3;
            float multiplyAddValue4;
            float multiplyAddValue5;
            if (fragmentScalarConstants1.packedValues[57u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            if (comparisonValue)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                bool comparisonValue2 = (fragmentScalarConstants1.packedValues[58u] != 0.0) && (fragmentScalarConstants1.packedValues[83u] != 0.0);
                precise float productValue51 = fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].x;
                precise float productValue52 = fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].y;
                precise float productValue53 = fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].z;
                precise float multiplyAddValue28 = spvNMax(fma(fragmentVectorConstants1.packedValues[25u].x, fragmentScalarConstants1.packedValues[103u], fragmentScalarConstants1.packedValues[39u]), productValue51) * fragmentScalarConstants1.packedValues[58u];
                precise float multiplyAddValue29 = spvNMax(fma(fragmentVectorConstants1.packedValues[25u].y, fragmentScalarConstants1.packedValues[103u], fragmentScalarConstants1.packedValues[39u]), productValue52) * fragmentScalarConstants1.packedValues[58u];
                precise float multiplyAddValue30 = spvNMax(fma(fragmentVectorConstants1.packedValues[25u].z, fragmentScalarConstants1.packedValues[103u], fragmentScalarConstants1.packedValues[39u]), productValue53) * fragmentScalarConstants1.packedValues[58u];
                precise float comparisonValue4 = spvNMax(comparisonValue2 ? multiplyAddValue28 : 0.0, 1.0) * fragmentVectorConstants1.packedValues[15u].x;
                precise float comparisonValue5 = spvNMax(comparisonValue2 ? multiplyAddValue29 : 0.0, 1.0) * fragmentVectorConstants1.packedValues[15u].y;
                precise float comparisonValue6 = spvNMax(comparisonValue2 ? multiplyAddValue30 : 0.0, 1.0) * fragmentVectorConstants1.packedValues[15u].z;
                intermediateValue25 = comparisonValue4;
                intermediateValue26 = comparisonValue5;
                intermediateValue27 = comparisonValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                bool comparisonValue2 = (fragmentScalarConstants1.packedValues[58u] != 0.0) && (fragmentScalarConstants1.packedValues[83u] != 0.0);
                multiplyAddValue3 = spvNMax(comparisonValue2 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[25u].x, fragmentScalarConstants1.packedValues[103u], fragmentScalarConstants1.packedValues[39u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].x) * fragmentScalarConstants1.packedValues[58u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[15u].x;
                multiplyAddValue4 = spvNMax(comparisonValue2 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[25u].y, fragmentScalarConstants1.packedValues[103u], fragmentScalarConstants1.packedValues[39u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].y) * fragmentScalarConstants1.packedValues[58u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[15u].y;
                multiplyAddValue5 = spvNMax(comparisonValue2 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[25u].z, fragmentScalarConstants1.packedValues[103u], fragmentScalarConstants1.packedValues[39u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].z) * fragmentScalarConstants1.packedValues[58u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[15u].z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue4 = nonlinearValue;
                branchMergedValue5 = fragmentVectorConstants1.packedValues[15u].x * spvNMax(productValue3, 1.0);
                branchMergedValue6 = spvNMax(productValue4, 1.0) * fragmentVectorConstants1.packedValues[15u].y;
                branchMergedValue7 = spvNMax(productValue5, 1.0) * fragmentVectorConstants1.packedValues[15u].z;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                precise float sumValue20 = fragmentScalarConstants1.packedValues[84u] - fragmentScalarConstants1.packedValues[87u];
                precise float sumValue21 = fragmentScalarConstants1.packedValues[86u] - fragmentScalarConstants1.packedValues[87u];
                precise float productValue54 = fragmentVectorConstants1.packedValues[27u].x * fragmentScalarConstants1.packedValues[111u];
                precise float productValue55 = fragmentVectorConstants1.packedValues[27u].y * fragmentScalarConstants1.packedValues[111u];
                precise float productValue56 = fragmentVectorConstants1.packedValues[27u].z * fragmentScalarConstants1.packedValues[111u];
                precise float productValue57 = fragmentVectorConstants1.packedValues[23u].x * fragmentScalarConstants1.packedValues[95u];
                precise float productValue58 = fragmentVectorConstants1.packedValues[23u].y * fragmentScalarConstants1.packedValues[95u];
                precise float productValue59 = fragmentVectorConstants1.packedValues[23u].z * fragmentScalarConstants1.packedValues[95u];
                precise float sumValue22 = sumValue21 - sumValue20;
                float multiplyAddValue31 = fma(sumValue16, inverseLengthValue2, -sumValue20);
                precise float quotientValue18 = 1.0 / sumValue22;
                precise float productValue60 = quotientValue18 * multiplyAddValue31;
                float scalarValue22 = spvNClamp(productValue60, 0.0, 1.0);
                precise float productValue61 = scalarValue22 * scalarValue22;
                float multiplyAddValue32 = fma(-fma(scalarValue22, -2.0, 3.0), productValue61, 1.0);
                precise float productValue62 = multiplyAddValue32 * multiplyAddValue32;
                precise float productValue63 = multiplyAddValue32 * productValue62;
                vec3 vectorValue3 = vec3(productValue45, productValue46, productValue47);
                float scalarValue23 = rdDot3Precise2(vectorValue3, vec3(fragmentVectorConstants1.packedValues[0u].xyz));
                float scalarValue24 = rdDot3Precise2(vectorValue3, vec3(fragmentVectorConstants1.packedValues[17u].xyz));
                precise float multiplyAddValue33 = fma(scalarValue23, scalarValue23, 1.0) * fragmentScalarConstants1.packedValues[111u];
                precise float multiplyAddValue34 = fma(scalarValue24, scalarValue24, 1.0) * fragmentScalarConstants1.packedValues[95u];
                precise float productValue64 = multiplyAddValue34 * 0.75;
                precise float sumValue23 = fragmentScalarConstants1.packedValues[85u] - sumValue20;
                precise float quotientValue19 = 1.0 / sumValue23;
                precise float productValue65 = quotientValue19 * multiplyAddValue31;
                float scalarValue25 = spvNClamp(productValue65, 0.0, 1.0);
                precise float productValue66 = scalarValue25 * scalarValue25;
                float multiplyAddValue35 = fma(-fma(scalarValue25, -2.0, 3.0), productValue66, 1.0);
                precise float productValue67 = multiplyAddValue35 * multiplyAddValue35;
                precise float productValue68 = multiplyAddValue35 * productValue67;
                precise float sumValue24 = fragmentVectorConstants1.packedValues[26u].x - fragmentVectorConstants1.packedValues[13u].x;
                precise float sumValue25 = fragmentVectorConstants1.packedValues[26u].y - fragmentVectorConstants1.packedValues[13u].y;
                precise float sumValue26 = fragmentVectorConstants1.packedValues[26u].z - fragmentVectorConstants1.packedValues[13u].z;
                precise float multiplyAddValue36 = fma(productValue68, sumValue24, fragmentVectorConstants1.packedValues[13u].x) * fragmentScalarConstants1.packedValues[48u];
                precise float multiplyAddValue37 = fma(productValue68, sumValue25, fragmentVectorConstants1.packedValues[13u].y) * fragmentScalarConstants1.packedValues[48u];
                precise float multiplyAddValue38 = fma(productValue68, sumValue26, fragmentVectorConstants1.packedValues[13u].z) * fragmentScalarConstants1.packedValues[48u];
                precise float productValue69 = multiplyAddValue36 * 0.079577468335628509521484375;
                precise float productValue70 = multiplyAddValue37 * 0.079577468335628509521484375;
                precise float productValue71 = multiplyAddValue38 * 0.079577468335628509521484375;
                float multiplyAddValue39 = fma(multiplyAddValue33, 0.75, productValue64);
                precise float nonlinearValue13 = log2(spvNMax(scalarValue23, 0.0)) * fragmentScalarConstants1.packedValues[51u];
                precise float nonlinearValue14 = log2(spvNMax(scalarValue24, 0.0)) * fragmentScalarConstants1.packedValues[51u];
                float exponentialValue7 = spvNMin(exp2(nonlinearValue14), 1.0);
                float exponentialValue8 = spvNMin(exp2(nonlinearValue13), 1.0);
                float multiplyAddValue40 = fma(-exponentialValue8, 1.7999999523162841796875, 1.809999942779541015625);
                precise float nonlinearValue15 = multiplyAddValue40 * sqrt(multiplyAddValue40);
                precise float quotientValue20 = 0.0361000001430511474609375 / nonlinearValue15;
                float multiplyAddValue41 = fma(-exponentialValue7, 1.7999999523162841796875, 1.809999942779541015625);
                precise float nonlinearValue16 = multiplyAddValue41 * sqrt(multiplyAddValue41);
                precise float quotientValue21 = 0.0361000001430511474609375 / nonlinearValue16;
                precise float productValue72 = productValue54 * fragmentScalarConstants1.packedValues[49u];
                precise float productValue73 = productValue55 * fragmentScalarConstants1.packedValues[49u];
                precise float productValue74 = productValue56 * fragmentScalarConstants1.packedValues[49u];
                precise float productValue75 = exponentialValue8 * productValue72;
                precise float productValue76 = exponentialValue8 * productValue73;
                precise float productValue77 = exponentialValue8 * productValue74;
                precise float productValue78 = productValue57 * fragmentScalarConstants1.packedValues[50u];
                precise float productValue79 = productValue58 * fragmentScalarConstants1.packedValues[50u];
                precise float productValue80 = productValue59 * fragmentScalarConstants1.packedValues[50u];
                precise float productValue81 = exponentialValue7 * productValue78;
                precise float productValue82 = exponentialValue7 * productValue79;
                precise float productValue83 = exponentialValue7 * productValue80;
                precise float productValue84 = quotientValue21 * productValue81;
                precise float productValue85 = quotientValue21 * productValue82;
                precise float productValue86 = quotientValue21 * productValue83;
                precise float productValue87 = productValue63 * fragmentVectorConstants1.packedValues[26u].x;
                precise float productValue88 = productValue63 * fragmentVectorConstants1.packedValues[26u].y;
                precise float productValue89 = productValue63 * fragmentVectorConstants1.packedValues[26u].z;
                precise float productValue90 = productValue87 * 0.079577468335628509521484375;
                precise float productValue91 = productValue88 * 0.079577468335628509521484375;
                precise float productValue92 = productValue89 * 0.079577468335628509521484375;
                precise float multiplyAddValue42 = fma(productValue75, quotientValue20, productValue84) * productValue90;
                precise float multiplyAddValue43 = fma(productValue76, quotientValue20, productValue85) * productValue91;
                precise float multiplyAddValue44 = fma(productValue77, quotientValue20, productValue86) * productValue92;
                float multiplyAddValue45 = fma(productValue69, multiplyAddValue39, multiplyAddValue42);
                float multiplyAddValue46 = fma(productValue70, multiplyAddValue39, multiplyAddValue43);
                float multiplyAddValue47 = fma(productValue71, multiplyAddValue39, multiplyAddValue44);
                bool comparisonValue3 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                float scalarValue15 = spvNMax(fragmentScalarConstants1.packedValues[65u], 1.0);
                precise float sumValue27 = multiplyAddValue45 - fragmentVectorConstants1.packedValues[28u].x;
                precise float sumValue28 = multiplyAddValue46 - fragmentVectorConstants1.packedValues[28u].y;
                precise float sumValue29 = multiplyAddValue47 - fragmentVectorConstants1.packedValues[28u].z;
                intermediateValue25 = comparisonValue3 ? fma(scalarValue15, sumValue27, fragmentVectorConstants1.packedValues[28u].x) : multiplyAddValue45;
                intermediateValue26 = comparisonValue3 ? fma(scalarValue15, sumValue28, fragmentVectorConstants1.packedValues[28u].y) : multiplyAddValue46;
                intermediateValue27 = comparisonValue3 ? fma(scalarValue15, sumValue29, fragmentVectorConstants1.packedValues[28u].z) : multiplyAddValue47;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float sumValue8 = fragmentScalarConstants1.packedValues[87u] - fragmentScalarConstants1.packedValues[84u];
                float multiplyAddValue2 = fma(sumValue2, inverseLengthValue1, sumValue8);
                float quotientValue10 = spvNClamp((1.0 / (sumValue8 + (fragmentScalarConstants1.packedValues[86u] - fragmentScalarConstants1.packedValues[87u]))) * multiplyAddValue2, 0.0, 1.0);
                float multiplyAddValue6 = fma(-fma(quotientValue10, -2.0, 3.0), quotientValue10 * quotientValue10, 1.0);
                float productValue35 = multiplyAddValue6 * (multiplyAddValue6 * multiplyAddValue6);
                vec3 productValue36 = vec3(inverseLengthValue1 * sumValue1, inverseLengthValue1 * sumValue2, inverseLengthValue1 * sumValue3);
                float scalarValue13 = rdDot3Precise2(productValue36, vec3(fragmentVectorConstants1.packedValues[0u].xyz));
                float scalarValue14 = rdDot3Precise2(productValue36, vec3(fragmentVectorConstants1.packedValues[17u].xyz));
                float quotientValue11 = spvNClamp((1.0 / (sumValue8 + fragmentScalarConstants1.packedValues[85u])) * multiplyAddValue2, 0.0, 1.0);
                float multiplyAddValue14 = fma(-fma(quotientValue11, -2.0, 3.0), quotientValue11 * quotientValue11, 1.0);
                float productValue37 = multiplyAddValue14 * (multiplyAddValue14 * multiplyAddValue14);
                float multiplyAddValue15 = fma(fma(scalarValue13, scalarValue13, 1.0) * fragmentScalarConstants1.packedValues[111u], 0.75, (fma(scalarValue14, scalarValue14, 1.0) * fragmentScalarConstants1.packedValues[95u]) * 0.75);
                float exponentialValue5 = spvNMin(exp2(log2(spvNMax(scalarValue14, 0.0)) * fragmentScalarConstants1.packedValues[51u]), 1.0);
                float exponentialValue6 = spvNMin(exp2(log2(spvNMax(scalarValue13, 0.0)) * fragmentScalarConstants1.packedValues[51u]), 1.0);
                float multiplyAddValue16 = fma(-exponentialValue6, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue4 = 0.0361000001430511474609375 / (multiplyAddValue16 * sqrt(multiplyAddValue16));
                float multiplyAddValue17 = fma(-exponentialValue5, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue5 = 0.0361000001430511474609375 / (multiplyAddValue17 * sqrt(multiplyAddValue17));
                float multiplyAddValue18 = fma((fma(productValue37, fragmentVectorConstants1.packedValues[26u].x - fragmentVectorConstants1.packedValues[13u].x, fragmentVectorConstants1.packedValues[13u].x) * fragmentScalarConstants1.packedValues[48u]) * 0.079577468335628509521484375, multiplyAddValue15, fma(exponentialValue6 * ((fragmentVectorConstants1.packedValues[27u].x * fragmentScalarConstants1.packedValues[111u]) * fragmentScalarConstants1.packedValues[49u]), nonlinearValue4, nonlinearValue5 * (exponentialValue5 * ((fragmentVectorConstants1.packedValues[23u].x * fragmentScalarConstants1.packedValues[95u]) * fragmentScalarConstants1.packedValues[50u]))) * ((productValue35 * fragmentVectorConstants1.packedValues[26u].x) * 0.079577468335628509521484375));
                float multiplyAddValue19 = fma((fma(productValue37, fragmentVectorConstants1.packedValues[26u].y - fragmentVectorConstants1.packedValues[13u].y, fragmentVectorConstants1.packedValues[13u].y) * fragmentScalarConstants1.packedValues[48u]) * 0.079577468335628509521484375, multiplyAddValue15, fma(exponentialValue6 * ((fragmentVectorConstants1.packedValues[27u].y * fragmentScalarConstants1.packedValues[111u]) * fragmentScalarConstants1.packedValues[49u]), nonlinearValue4, nonlinearValue5 * (exponentialValue5 * ((fragmentVectorConstants1.packedValues[23u].y * fragmentScalarConstants1.packedValues[95u]) * fragmentScalarConstants1.packedValues[50u]))) * ((productValue35 * fragmentVectorConstants1.packedValues[26u].y) * 0.079577468335628509521484375));
                float multiplyAddValue20 = fma((fma(productValue37, fragmentVectorConstants1.packedValues[26u].z - fragmentVectorConstants1.packedValues[13u].z, fragmentVectorConstants1.packedValues[13u].z) * fragmentScalarConstants1.packedValues[48u]) * 0.079577468335628509521484375, multiplyAddValue15, fma(exponentialValue6 * ((fragmentVectorConstants1.packedValues[27u].z * fragmentScalarConstants1.packedValues[111u]) * fragmentScalarConstants1.packedValues[49u]), nonlinearValue4, nonlinearValue5 * (exponentialValue5 * ((fragmentVectorConstants1.packedValues[23u].z * fragmentScalarConstants1.packedValues[95u]) * fragmentScalarConstants1.packedValues[50u]))) * ((productValue35 * fragmentVectorConstants1.packedValues[26u].z) * 0.079577468335628509521484375));
                bool comparisonValue3 = fragmentScalarConstants1.packedValues[59u] != 0.0;
                float scalarValue15 = spvNMax(fragmentScalarConstants1.packedValues[65u], 1.0);
                multiplyAddValue3 = comparisonValue3 ? fma(scalarValue15, multiplyAddValue18 - fragmentVectorConstants1.packedValues[28u].x, fragmentVectorConstants1.packedValues[28u].x) : multiplyAddValue18;
                multiplyAddValue4 = comparisonValue3 ? fma(scalarValue15, multiplyAddValue19 - fragmentVectorConstants1.packedValues[28u].y, fragmentVectorConstants1.packedValues[28u].y) : multiplyAddValue19;
                multiplyAddValue5 = comparisonValue3 ? fma(scalarValue15, multiplyAddValue20 - fragmentVectorConstants1.packedValues[28u].z, fragmentVectorConstants1.packedValues[28u].z) : multiplyAddValue20;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float quotientValue5 = spvNClamp(((productValue1 - fragmentVectorConstants1.packedValues[21u].x) + fragmentVectorConstants1.packedValues[21u].w) / (fragmentVectorConstants1.packedValues[21u].z - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
                float productValue6 = 1.0 - ((quotientValue5 * quotientValue5) * (3.0 - (quotientValue5 * 2.0)));
                float productValue10 = (productValue6 * productValue6) * productValue6;
                float dotProductValue = dot(vec3(productValue, productValue1, productValue2), vec3(fragmentVectorConstants1.packedValues[0u].xyz));
                float dotProductValue1 = dot(vec3(productValue, productValue1, productValue2), vec3(fragmentVectorConstants1.packedValues[17u].xyz));
                float sumValue4 = fragmentVectorConstants1.packedValues[21u].x - fragmentVectorConstants1.packedValues[21u].w;
                float quotientValue6 = spvNClamp((productValue1 - sumValue4) / (fragmentVectorConstants1.packedValues[21u].y - sumValue4), 0.0, 1.0);
                float productValue11 = 1.0 - ((quotientValue6 * quotientValue6) * (3.0 - (quotientValue6 * 2.0)));
                float productValue12 = (productValue11 * productValue11) * productValue11;
                float productValue17 = (fragmentVectorConstants1.packedValues[12u].x * 0.75) * ((((dotProductValue1 * dotProductValue1) + 1.0) * fragmentVectorConstants1.packedValues[23u].w) + (((dotProductValue * dotProductValue) + 1.0) * fragmentVectorConstants1.packedValues[27u].w));
                float exponentialValue3 = spvNClamp(exp2(log2(spvNMax(dotProductValue, 0.0)) * fragmentVectorConstants1.packedValues[12u].w), 0.0, 1.0);
                float exponentialValue4 = spvNClamp(exp2(log2(spvNMax(dotProductValue1, 0.0)) * fragmentVectorConstants1.packedValues[12u].w), 0.0, 1.0);
                float productValue18 = 1.809999942779541015625 - (exponentialValue3 * 1.7999999523162841796875);
                float nonlinearValue1 = 0.036100022494792938232421875 / (sqrt(productValue18) * productValue18);
                float productValue19 = 1.809999942779541015625 - (exponentialValue4 * 1.7999999523162841796875);
                float nonlinearValue2 = 0.036100022494792938232421875 / (sqrt(productValue19) * productValue19);
                float productValue20 = exponentialValue3 * (fragmentVectorConstants1.packedValues[12u].y * fragmentVectorConstants1.packedValues[27u].w);
                float productValue21 = exponentialValue4 * (fragmentVectorConstants1.packedValues[12u].z * fragmentVectorConstants1.packedValues[23u].w);
                float productValue22 = (((productValue10 * fragmentVectorConstants1.packedValues[26u].x) * (((productValue21 * fragmentVectorConstants1.packedValues[23u].x) * nonlinearValue2) + ((productValue20 * fragmentVectorConstants1.packedValues[27u].x) * nonlinearValue1))) + (((productValue12 * (fragmentVectorConstants1.packedValues[26u].x - fragmentVectorConstants1.packedValues[13u].x)) + fragmentVectorConstants1.packedValues[13u].x) * productValue17)) * 0.079577468335628509521484375;
                float productValue23 = (((productValue10 * fragmentVectorConstants1.packedValues[26u].y) * (((productValue21 * fragmentVectorConstants1.packedValues[23u].y) * nonlinearValue2) + ((productValue20 * fragmentVectorConstants1.packedValues[27u].y) * nonlinearValue1))) + (((productValue12 * (fragmentVectorConstants1.packedValues[26u].y - fragmentVectorConstants1.packedValues[13u].y)) + fragmentVectorConstants1.packedValues[13u].y) * productValue17)) * 0.079577468335628509521484375;
                float productValue24 = (((productValue10 * fragmentVectorConstants1.packedValues[26u].z) * (((productValue21 * fragmentVectorConstants1.packedValues[23u].z) * nonlinearValue2) + ((productValue20 * fragmentVectorConstants1.packedValues[27u].z) * nonlinearValue1))) + (((productValue12 * (fragmentVectorConstants1.packedValues[26u].z - fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[13u].z) * productValue17)) * 0.079577468335628509521484375;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                if (fragmentVectorConstants1.packedValues[14u].w != 0.0)
                {
                    float scalarValue3 = spvNMax(fragmentVectorConstants1.packedValues[16u].y, 1.0);
                    branchMergedValue8 = nonlinearValue;
                    branchMergedValue9 = ((productValue22 - fragmentVectorConstants1.packedValues[28u].x) * scalarValue3) + fragmentVectorConstants1.packedValues[28u].x;
                    branchMergedValue10 = ((productValue23 - fragmentVectorConstants1.packedValues[28u].y) * scalarValue3) + fragmentVectorConstants1.packedValues[28u].y;
                    branchMergedValue11 = ((productValue24 - fragmentVectorConstants1.packedValues[28u].z) * scalarValue3) + fragmentVectorConstants1.packedValues[28u].z;
                }
                else
                {
                    branchMergedValue8 = nonlinearValue;
                    branchMergedValue9 = productValue22;
                    branchMergedValue10 = productValue23;
                    branchMergedValue11 = productValue24;
                }
                branchMergedValue4 = branchMergedValue8;
                branchMergedValue5 = branchMergedValue9;
                branchMergedValue6 = branchMergedValue10;
                branchMergedValue7 = branchMergedValue11;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue23 = intermediateValue25;
            intermediateValue21 = intermediateValue26;
            intermediateValue19 = intermediateValue27;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = multiplyAddValue3;
            intermediateValue19 = multiplyAddValue4;
            intermediateValue17 = multiplyAddValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = branchMergedValue4;
            branchMergedValue1 = branchMergedValue5;
            branchMergedValue2 = branchMergedValue6;
            branchMergedValue3 = branchMergedValue7;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue23 = 0.0;
            intermediateValue21 = 0.0;
            intermediateValue19 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = 0.0;
            intermediateValue19 = 0.0;
            intermediateValue17 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = nonlinearValue;
            branchMergedValue1 = 0.0;
            branchMergedValue2 = 0.0;
            branchMergedValue3 = 0.0;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue17 = scalarValue21;
        intermediateValue18 = intermediateValue19;
        intermediateValue20 = intermediateValue21;
        intermediateValue22 = intermediateValue23;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue15 = nonlinearValue3;
        intermediateValue16 = intermediateValue17;
        intermediateValue18 = intermediateValue19;
        intermediateValue20 = intermediateValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue3 = branchMergedValue;
        intermediateValue4 = branchMergedValue1;
        intermediateValue5 = branchMergedValue2;
        intermediateValue6 = branchMergedValue3;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue17 = 0.0;
        intermediateValue18 = 0.0;
        intermediateValue20 = 0.0;
        intermediateValue22 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue15 = 0.0;
        intermediateValue16 = 0.0;
        intermediateValue18 = 0.0;
        intermediateValue20 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue3 = 0.0;
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
        intermediateValue6 = 0.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue30 = fragmentScalarConstants1.packedValues[84u] - fragmentScalarConstants1.packedValues[87u];
    precise float sumValue31 = fragmentScalarConstants1.packedValues[85u] - sumValue30;
    precise float quotientValue22 = 1.0 / sumValue31;
    precise float multiplyAddValue48 = fma(sumValue16, inverseLengthValue2, -sumValue30) * quotientValue22;
    float scalarValue26 = spvNClamp(multiplyAddValue48, 0.0, 1.0);
    precise float productValue93 = scalarValue26 * scalarValue26;
    float multiplyAddValue49 = fma(-fma(scalarValue26, -2.0, 3.0), productValue93, 1.0);
    precise float productValue94 = multiplyAddValue49 * multiplyAddValue49;
    precise float productValue95 = multiplyAddValue49 * productValue94;
    precise float sumValue32 = fragmentVectorConstants1.packedValues[26u].x - fragmentVectorConstants1.packedValues[13u].x;
    precise float sumValue33 = fragmentVectorConstants1.packedValues[26u].y - fragmentVectorConstants1.packedValues[13u].y;
    precise float sumValue34 = fragmentVectorConstants1.packedValues[26u].z - fragmentVectorConstants1.packedValues[13u].z;
    precise float multiplyAddValue50 = fma(productValue95, sumValue32, fragmentVectorConstants1.packedValues[13u].x) * fragmentScalarConstants1.packedValues[88u];
    precise float multiplyAddValue51 = fma(productValue95, sumValue33, fragmentVectorConstants1.packedValues[13u].y) * fragmentScalarConstants1.packedValues[88u];
    precise float multiplyAddValue52 = fma(productValue95, sumValue34, fragmentVectorConstants1.packedValues[13u].z) * fragmentScalarConstants1.packedValues[88u];
    float multiplyAddValue10;
    float multiplyAddValue11;
    float multiplyAddValue12;
    float multiplyAddValue13;
    if (fragmentScalarConstants1.packedValues[124u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float sumValue9 = fragmentScalarConstants1.packedValues[87u] - fragmentScalarConstants1.packedValues[84u];
    float multiplyAddValue21 = spvNClamp(fma(sumValue2, inverseLengthValue1, sumValue9) * (1.0 / (sumValue9 + fragmentScalarConstants1.packedValues[85u])), 0.0, 1.0);
    float multiplyAddValue22 = fma(-fma(multiplyAddValue21, -2.0, 3.0), multiplyAddValue21 * multiplyAddValue21, 1.0);
    float productValue38 = multiplyAddValue22 * (multiplyAddValue22 * multiplyAddValue22);
    float multiplyAddValue7;
    float multiplyAddValue8;
    float multiplyAddValue9;
    float multiplyAddValue10;
    if (fragmentScalarConstants1.packedValues[124u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sumValue5 = fragmentVectorConstants1.packedValues[21u].x - fragmentVectorConstants1.packedValues[21u].w;
    float quotientValue7 = spvNClamp((productValue1 - sumValue5) / (fragmentVectorConstants1.packedValues[21u].y - sumValue5), 0.0, 1.0);
    float productValue25 = 1.0 - ((quotientValue7 * quotientValue7) * (3.0 - (quotientValue7 * 2.0)));
    float productValue26 = (productValue25 * productValue25) * productValue25;
    float productValue13;
    float productValue14;
    float productValue15;
    float productValue16;
    if (fragmentVectorConstants1.packedValues[31u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float sumValue35 = quotientValue12 + 1.0;
        precise float sumValue36 = quotientValue13 + 1.0;
        precise float productValue96 = sumValue35 * 0.5;
        precise float productValue97 = sumValue36 * 0.5;
        precise float productValue98 = quotientValue13 * fragmentVectorConstants1.packedValues[6u].z;
        precise float productValue99 = quotientValue13 * fragmentVectorConstants1.packedValues[6u].w;
        precise float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[7u].z, quotientValue14, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue12, productValue98)) + fragmentVectorConstants1.packedValues[8u].z;
        precise float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[7u].w, quotientValue14, fma(fragmentVectorConstants1.packedValues[5u].w, quotientValue12, productValue99)) + fragmentVectorConstants1.packedValues[8u].w;
        precise float quotientValue23 = (-multiplyAddValue53) / multiplyAddValue54;
        precise float sumValue37 = quotientValue23 - fragmentScalarConstants1.packedValues[120u];
        precise float sumValue38 = fragmentScalarConstants1.packedValues[121u] - fragmentScalarConstants1.packedValues[120u];
        precise float quotientValue24 = sumValue37 / sumValue38;
        precise float multiplyAddValue55 = log2(fma(quotientValue24, 53.598148345947265625, 1.0)) * 0.17328679561614990234375;
        float multiplyAddValue56 = fma(multiplyAddValue55, trunc(fragmentScalarConstants1.packedValues[118u]), -0.5);
        uint sumValue39 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[118u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue56))), int(0u))))));
        float scalarValue27 = rdSignedBitsToFloat(sumValue39);
        precise float sumValue40 = multiplyAddValue56 - scalarValue27;
        float scalarValue28 = spvNClamp(sumValue40, 0.0, 1.0);
        vec4 sampledTextureValue8 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(productValue96, productValue97, scalarValue27), 0.0);
        float scalarValue29 = sampledTextureValue8.x;
        float scalarValue30 = sampledTextureValue8.y;
        float scalarValue31 = sampledTextureValue8.z;
        float scalarValue32 = sampledTextureValue8.w;
        vec4 sampledTextureValue9 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(productValue96, productValue97, rdSignedBitsToFloat(sumValue39 + 1u)), 0.0);
        precise float sumValue41 = sampledTextureValue9.x - scalarValue29;
        precise float sumValue42 = sampledTextureValue9.y - scalarValue30;
        precise float sumValue43 = sampledTextureValue9.z - scalarValue31;
        precise float sumValue44 = sampledTextureValue9.w - scalarValue32;
        multiplyAddValue10 = fma(scalarValue28, sumValue43, scalarValue31);
        multiplyAddValue11 = fma(scalarValue28, sumValue42, scalarValue30);
        multiplyAddValue12 = fma(scalarValue28, sumValue41, scalarValue29);
        multiplyAddValue13 = fma(scalarValue28, sumValue44, scalarValue32);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float productValue27 = (quotientValue + 1.0) * 0.5;
        float productValue28 = (quotientValue1 + 1.0) * 0.5;
        float multiplyAddValue23 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[7u].z, quotientValue8, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue, quotientValue1 * fragmentVectorConstants1.packedValues[6u].z)) + fragmentVectorConstants1.packedValues[8u].z)) / (fma(fragmentVectorConstants1.packedValues[7u].w, quotientValue8, fma(fragmentVectorConstants1.packedValues[5u].w, quotientValue, quotientValue1 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[8u].w)) - fragmentScalarConstants1.packedValues[120u]) / (fragmentScalarConstants1.packedValues[121u] - fragmentScalarConstants1.packedValues[120u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[118u]), -0.5);
        uint sumValue10 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[118u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue23))), int(0u))))));
        float scalarValue16 = rdSignedBitsToFloat(sumValue10);
        float sumValue11 = spvNClamp(multiplyAddValue23 - scalarValue16, 0.0, 1.0);
        vec4 sampledTextureValue5 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(productValue27, productValue28, scalarValue16), 0.0);
        float scalarValue17 = sampledTextureValue5.x;
        float scalarValue18 = sampledTextureValue5.y;
        float scalarValue19 = sampledTextureValue5.z;
        float scalarValue20 = sampledTextureValue5.w;
        vec4 sampledTextureValue6 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(productValue27, productValue28, rdSignedBitsToFloat(sumValue10 + 1u)), 0.0);
        multiplyAddValue7 = fma(sumValue11, sampledTextureValue6.z - scalarValue19, scalarValue19);
        multiplyAddValue8 = fma(sumValue11, sampledTextureValue6.y - scalarValue18, scalarValue18);
        multiplyAddValue9 = fma(sumValue11, sampledTextureValue6.x - scalarValue17, scalarValue17);
        multiplyAddValue10 = fma(sumValue11, sampledTextureValue6.w - scalarValue20, scalarValue20);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue27 = (quotientValue + 1.0) * 0.5;
        float productValue28 = (quotientValue1 + 1.0) * 0.5;
        uint scalarValue4 = uint(int(fragmentVectorConstants1.packedValues[29u].z));
        float multiplyAddValue = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[8u].z + (fragmentVectorConstants1.packedValues[7u].z + fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[5u].z)))) / (fma(fragmentVectorConstants1.packedValues[6u].w, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[5u].w) + sumValue)) - fragmentVectorConstants1.packedValues[30u].x) / (fragmentVectorConstants1.packedValues[30u].y - fragmentVectorConstants1.packedValues[30u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue4))) + (-0.5);
        uint sumValue6 = uint(min(int(uint(max(int(uint(int(multiplyAddValue))), int(0u)))), int(scalarValue4 + 4294967294u)));
        float scalarValue5 = float(int(sumValue6));
        float sumValue7 = spvNMin(spvNMax(multiplyAddValue - scalarValue5, 0.0), 1.0);
        vec4 sampledTextureValue1 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue27, productValue28, scalarValue5), 0.0);
        float scalarValue6 = sampledTextureValue1.x;
        float scalarValue7 = sampledTextureValue1.y;
        float scalarValue8 = sampledTextureValue1.z;
        float scalarValue9 = sampledTextureValue1.w;
        vec4 sampledTextureValue2 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue27, productValue28, float(int(sumValue6 + 1u))), 0.0);
        productValue13 = ((sampledTextureValue2.x - scalarValue6) * sumValue7) + scalarValue6;
        productValue14 = ((sampledTextureValue2.y - scalarValue7) * sumValue7) + scalarValue7;
        productValue15 = ((sampledTextureValue2.z - scalarValue8) * sumValue7) + scalarValue8;
        productValue16 = ((sampledTextureValue2.w - scalarValue9) * sumValue7) + scalarValue9;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        multiplyAddValue10 = 0.0;
        multiplyAddValue11 = 0.0;
        multiplyAddValue12 = 0.0;
        multiplyAddValue13 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue7 = 0.0;
        multiplyAddValue8 = 0.0;
        multiplyAddValue9 = 0.0;
        multiplyAddValue10 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue13 = 0.0;
        productValue14 = 0.0;
        productValue15 = 0.0;
        productValue16 = 1.0;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    float multiplyAddValue57 = fma(multiplyAddValue13, fma(intermediateValue17, fma(spvNMax(intermediateValue22, multiplyAddValue50), comparisonValue1 ? exp2(nonlinearValue6) : ((scalarValue10 <= 0.040449999272823333740234375) ? productValue39 : exp2(nonlinearValue9)), -1.0), 1.0), multiplyAddValue12);
    float multiplyAddValue58 = fma(multiplyAddValue13, fma(intermediateValue17, fma(spvNMax(intermediateValue20, multiplyAddValue51), comparisonValue1 ? exp2(nonlinearValue7) : ((scalarValue11 <= 0.040449999272823333740234375) ? productValue40 : exp2(nonlinearValue10)), -1.0), 1.0), multiplyAddValue11);
    float multiplyAddValue59 = fma(multiplyAddValue13, fma(intermediateValue17, fma(spvNMax(intermediateValue18, multiplyAddValue52), comparisonValue1 ? exp2(nonlinearValue8) : ((scalarValue12 <= 0.040449999272823333740234375) ? productValue41 : exp2(nonlinearValue11)), -1.0), 1.0), multiplyAddValue10);
    float intermediateValue40;
    float intermediateValue41;
    float intermediateValue42;
    if (fragmentScalarConstants1.packedValues[76u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue24 = fma(multiplyAddValue10, fma(intermediateValue15, fma(spvNMax(intermediateValue20, fma(productValue38, fragmentVectorConstants1.packedValues[26u].x - fragmentVectorConstants1.packedValues[13u].x, fragmentVectorConstants1.packedValues[13u].x) * fragmentScalarConstants1.packedValues[88u]), comparisonValue1 ? exp2(log2(spvNMax(scalarValue10, 0.0)) * 2.2000000476837158203125) : ((scalarValue10 <= 0.040449999272823333740234375) ? (scalarValue10 * 0.077399380505084991455078125) : exp2(log2((scalarValue10 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), -1.0), 1.0), multiplyAddValue9);
    float multiplyAddValue25 = fma(multiplyAddValue10, fma(intermediateValue15, fma(spvNMax(intermediateValue18, fma(productValue38, fragmentVectorConstants1.packedValues[26u].y - fragmentVectorConstants1.packedValues[13u].y, fragmentVectorConstants1.packedValues[13u].y) * fragmentScalarConstants1.packedValues[88u]), comparisonValue1 ? exp2(log2(spvNMax(scalarValue11, 0.0)) * 2.2000000476837158203125) : ((scalarValue11 <= 0.040449999272823333740234375) ? (scalarValue11 * 0.077399380505084991455078125) : exp2(log2((scalarValue11 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), -1.0), 1.0), multiplyAddValue8);
    float multiplyAddValue26 = fma(multiplyAddValue10, fma(intermediateValue15, fma(spvNMax(intermediateValue16, fma(productValue38, fragmentVectorConstants1.packedValues[26u].z - fragmentVectorConstants1.packedValues[13u].z, fragmentVectorConstants1.packedValues[13u].z) * fragmentScalarConstants1.packedValues[88u]), comparisonValue1 ? exp2(log2(spvNMax(scalarValue12, 0.0)) * 2.2000000476837158203125) : ((scalarValue12 <= 0.040449999272823333740234375) ? (scalarValue12 * 0.077399380505084991455078125) : exp2(log2((scalarValue12 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625)), -1.0), 1.0), multiplyAddValue7);
    float productValue7;
    float productValue8;
    float productValue9;
    if (fragmentScalarConstants1.packedValues[76u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue32 = (productValue16 * ((((spvNMax(((productValue26 * (fragmentVectorConstants1.packedValues[26u].x - fragmentVectorConstants1.packedValues[13u].x)) + fragmentVectorConstants1.packedValues[13u].x) * fragmentVectorConstants1.packedValues[22u].x, intermediateValue4) * exponentialValue) + (-1.0)) * intermediateValue3) + 1.0)) + productValue13;
    float productValue33 = (productValue16 * ((((spvNMax(((productValue26 * (fragmentVectorConstants1.packedValues[26u].y - fragmentVectorConstants1.packedValues[13u].y)) + fragmentVectorConstants1.packedValues[13u].y) * fragmentVectorConstants1.packedValues[22u].x, intermediateValue5) * exponentialValue1) + (-1.0)) * intermediateValue3) + 1.0)) + productValue14;
    float productValue34 = (productValue16 * ((((spvNMax(((productValue26 * (fragmentVectorConstants1.packedValues[26u].z - fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[22u].x, intermediateValue6) * exponentialValue2) + (-1.0)) * intermediateValue3) + 1.0)) + productValue15;
    float productValue29;
    float productValue30;
    float productValue31;
    if (fragmentVectorConstants1.packedValues[19u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float sampledTextureValue10 = 0.180000007152557373046875 / texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x;
        precise float sumValue45 = sampledTextureValue10 + 9.9999997473787516355514526367188e-05;
        precise float productValue100 = sumValue45 * multiplyAddValue57;
        precise float productValue101 = sumValue45 * multiplyAddValue58;
        precise float productValue102 = sumValue45 * multiplyAddValue59;
        intermediateValue40 = productValue102;
        intermediateValue41 = productValue101;
        intermediateValue42 = productValue100;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue7 = (0.180000007152557373046875 / texture(sampler2D(materialTexture0, textureSampler0), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue7 = sampledTextureValue7 * multiplyAddValue26;
        productValue8 = sampledTextureValue7 * multiplyAddValue25;
        productValue9 = sampledTextureValue7 * multiplyAddValue24;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue3 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue29 = sampledTextureValue3 * productValue32;
        productValue30 = sampledTextureValue3 * productValue33;
        productValue31 = sampledTextureValue3 * productValue34;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue40 = multiplyAddValue59;
        intermediateValue41 = multiplyAddValue58;
        intermediateValue42 = multiplyAddValue57;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        productValue7 = multiplyAddValue26;
        productValue8 = multiplyAddValue25;
        productValue9 = multiplyAddValue24;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue29 = productValue32;
        productValue30 = productValue33;
        productValue31 = productValue34;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    fragmentColor0.x = intermediateValue42;
    fragmentColor0.y = intermediateValue41;
    fragmentColor0.z = intermediateValue40;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = productValue9;
    fragmentColor0.y = productValue8;
    fragmentColor0.z = productValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = productValue29;
    fragmentColor0.y = productValue30;
    fragmentColor0.z = productValue31;
#endif
    fragmentColor0.w = 1.0;
}
