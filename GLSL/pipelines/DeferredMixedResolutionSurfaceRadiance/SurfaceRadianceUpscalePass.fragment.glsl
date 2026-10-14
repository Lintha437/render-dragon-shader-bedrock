#version 460
#extension GL_GOOGLE_include_directive : require
// DeferredMixedResolutionSurfaceRadiance / SurfaceRadianceUpscalePass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_UPSCALING
#define RD_FEATURE_UPSCALING RD_OFF
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

#include "../../include/materials/DeferredMixedResolutionSurfaceRadiance/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture7, textureSampler7), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue11.x;
    bool sampledTextureValue12 = uint(textureQueryLevels(intermediateValue2)) > 0u;
    uvec2 sampledTextureValue13 = uvec2(textureSize(intermediateValue2, int(0u)));
    uint scalarValue11 = sampledTextureValue13.x;
    uvec4 sampledTextureValue14 = texelFetch(intermediateValue2, ivec2(uvec2(uint(int(rdEvaluateFloatExpression(sampledTextureValue12 ? scalarValue11 : 0u) * varyingTexCoord0.x)), uint(int(rdEvaluateFloatExpression(sampledTextureValue12 ? sampledTextureValue13.y : 0u) * varyingTexCoord0.y)))), int(0u));
    float sampledTextureValue4;
    if (fragmentScalarConstants1.packedValues[104u] > 0.5)
    {
        sampledTextureValue4 = textureLod(sampler3D(materialTexture11, textureSampler11), vec3(varyingTexCoord0.x, varyingTexCoord0.y, 1.0), 0.0).y;
    }
    else
    {
        sampledTextureValue4 = 1.0;
    }
    float scalarValue12 = dFdxCoarse(varyingTexCoord0.x);
    float scalarValue13 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue14 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue15 = dFdyCoarse(varyingTexCoord0.y);
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    float intermediateValue31;
    float intermediateValue32;
    float intermediateValue33;
    float productValue1;
    float productValue2;
    float productValue3;
    if (scalarValue10 != 1.0)
    {
        vec4 sampledTextureValue15 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue12, scalarValue13), vec2(scalarValue14, scalarValue15));
        float scalarValue16 = sampledTextureValue15.x;
        float scalarValue17 = sampledTextureValue15.y;
        float scalarValue18 = sampledTextureValue15.z;
        float bitwiseValue1 = rdEvaluateFloatExpression(sampledTextureValue14.x & 255u) * 0.0039215688593685626983642578125;
        bool comparisonValue2 = fragmentScalarConstants1.packedValues[68u] != 0.0;
        float exponentialValue5 = comparisonValue2 ? exp2(log2(spvNMax(scalarValue16, 0.0)) * 2.2000000476837158203125) : ((scalarValue16 <= 0.040449999272823333740234375) ? (scalarValue16 * 0.077399380505084991455078125) : exp2(log2((scalarValue16 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
        float exponentialValue6 = comparisonValue2 ? exp2(log2(spvNMax(scalarValue17, 0.0)) * 2.2000000476837158203125) : ((scalarValue17 <= 0.040449999272823333740234375) ? (scalarValue17 * 0.077399380505084991455078125) : exp2(log2((scalarValue17 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
        float exponentialValue7 = comparisonValue2 ? exp2(log2(spvNMax(scalarValue18, 0.0)) * 2.2000000476837158203125) : ((scalarValue18 <= 0.040449999272823333740234375) ? (scalarValue18 * 0.077399380505084991455078125) : exp2(log2((scalarValue18 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
        vec4 sampledTextureValue16 = textureGrad(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue12, scalarValue13), vec2(scalarValue14, scalarValue15));
        vec4 sampledTextureValue17 = textureGrad(sampler2D(materialTexture8, textureSampler8), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue12, scalarValue13), vec2(scalarValue14, scalarValue15));
        float scalarValue19 = rdDot3Precise2(vec3(exponentialValue5, exponentialValue6, exponentialValue7), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        multiplyAddValue = (bitwiseValue1 * (fma(fragmentScalarConstants1.packedValues[81u], scalarValue19 - exponentialValue7, exponentialValue7) * fragmentScalarConstants1.packedValues[78u])) * fragmentScalarConstants1.packedValues[80u];
        multiplyAddValue1 = (bitwiseValue1 * (fma(fragmentScalarConstants1.packedValues[81u], scalarValue19 - exponentialValue6, exponentialValue6) * fragmentScalarConstants1.packedValues[78u])) * fragmentScalarConstants1.packedValues[80u];
        multiplyAddValue2 = (bitwiseValue1 * (fma(fragmentScalarConstants1.packedValues[81u], scalarValue19 - exponentialValue5, exponentialValue5) * fragmentScalarConstants1.packedValues[78u])) * fragmentScalarConstants1.packedValues[80u];
        intermediateValue31 = sampledTextureValue17.z;
        intermediateValue32 = sampledTextureValue17.y;
        intermediateValue33 = sampledTextureValue17.x;
        productValue1 = exponentialValue7 * sampledTextureValue16.z;
        productValue2 = exponentialValue6 * sampledTextureValue16.y;
        productValue3 = exponentialValue5 * sampledTextureValue16.x;
    }
    else
    {
        multiplyAddValue = 0.0;
        multiplyAddValue1 = 0.0;
        multiplyAddValue2 = 0.0;
        intermediateValue31 = 0.0;
        intermediateValue32 = 0.0;
        intermediateValue33 = 0.0;
        productValue1 = 0.0;
        productValue2 = 0.0;
        productValue3 = 0.0;
    }
    float sumValue6 = multiplyAddValue2 + (productValue3 + intermediateValue33);
    float sumValue7 = multiplyAddValue1 + (productValue2 + intermediateValue32);
    float sumValue8 = multiplyAddValue + (productValue1 + intermediateValue31);
    float intermediateValue35;
    float intermediateValue36;
    float intermediateValue38;
    float intermediateValue40;
    if (fragmentScalarConstants1.packedValues[52u] != 0.0)
    {
        float multiplyAddValue14 = fma(scalarValue10, fragmentScalarConstants1.packedValues[31u], fragmentScalarConstants1.packedValues[35u]);
        float quotientValue5 = (varyingColor1.x * fragmentScalarConstants1.packedValues[20u]) / multiplyAddValue14;
        float quotientValue6 = (varyingColor1.y * fragmentScalarConstants1.packedValues[25u]) / multiplyAddValue14;
        float quotientValue7 = fragmentScalarConstants1.packedValues[34u] / multiplyAddValue14;
        vec3 vectorValue = vec3(quotientValue5, quotientValue6, quotientValue7);
        float nonlinearValue3 = spvNClamp((((sqrt(rdDot3Precise2(vectorValue, vectorValue)) / fragmentScalarConstants1.packedValues[46u]) + fragmentScalarConstants1.packedValues[92u]) - fragmentScalarConstants1.packedValues[44u]) * fragmentScalarConstants1.packedValues[45u], 0.0, 1.0);
        float intermediateValue37;
        float intermediateValue39;
        float intermediateValue41;
        if (nonlinearValue3 > 0.0)
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture7, textureSampler7), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue11.x;
    bool sampledTextureValue12 = uint(textureQueryLevels(intermediateValue2)) > 0u;
    uvec2 sampledTextureValue13 = uvec2(textureSize(intermediateValue2, int(0u)));
    uint scalarValue11 = sampledTextureValue13.x;
    uvec4 sampledTextureValue14 = texelFetch(intermediateValue2, ivec2(uvec2(uint(int(rdEvaluateFloatExpression(sampledTextureValue12 ? scalarValue11 : 0u) * varyingTexCoord0.x)), uint(int(rdEvaluateFloatExpression(sampledTextureValue12 ? sampledTextureValue13.y : 0u) * varyingTexCoord0.y)))), int(0u));
    float sampledTextureValue4;
    if (fragmentScalarConstants1.packedValues[112u] > 0.5)
    {
        sampledTextureValue4 = textureLod(sampler3D(materialTexture11, textureSampler11), vec3(varyingTexCoord0.x, varyingTexCoord0.y, 1.0), 0.0).y;
    }
    else
    {
        sampledTextureValue4 = 1.0;
    }
    float scalarValue12 = dFdxCoarse(varyingTexCoord0.x);
    float scalarValue14 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue13 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue15 = dFdyCoarse(varyingTexCoord0.y);
    float multiplyAddValue28;
    float multiplyAddValue29;
    float multiplyAddValue30;
    float multiplyAddValue31;
    float multiplyAddValue32;
    float multiplyAddValue33;
    float multiplyAddValue34;
    float multiplyAddValue35;
    float multiplyAddValue36;
    if (scalarValue10 != 1.0)
    {
        vec4 sampledTextureValue32 = textureGrad(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue12, scalarValue13), vec2(scalarValue14, scalarValue15));
        float scalarValue40 = sampledTextureValue32.x;
        float scalarValue41 = sampledTextureValue32.y;
        float scalarValue42 = abs(scalarValue41);
        float sumValue33 = 1.0 - abs(scalarValue40);
        float sumValue34 = sumValue33 - scalarValue42;
        bool conditionValue5 = sumValue34 < 0.0;
        float comparisonValue22 = conditionValue5 ? (((scalarValue40 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue42)) : scalarValue40;
        float comparisonValue23 = conditionValue5 ? (((scalarValue41 >= 0.0) ? 1.0 : (-1.0)) * sumValue33) : scalarValue41;
        vec3 vectorValue2 = vec3(comparisonValue22, comparisonValue23, sumValue34);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec4 sampledTextureValue15 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue12, scalarValue13), vec2(scalarValue14, scalarValue15));
        float scalarValue16 = sampledTextureValue15.x;
        float scalarValue17 = sampledTextureValue15.y;
        float scalarValue18 = sampledTextureValue15.z;
        float bitwiseValue1 = rdEvaluateFloatExpression(sampledTextureValue14.x & 255u) * 0.0039215688593685626983642578125;
        bool comparisonValue24 = fragmentScalarConstants1.packedValues[72u] != 0.0;
        float exponentialValue10 = comparisonValue24 ? exp2(log2(spvNMax(scalarValue16, 0.0)) * 2.2000000476837158203125) : ((scalarValue16 <= 0.040449999272823333740234375) ? (scalarValue16 * 0.077399380505084991455078125) : exp2(log2((scalarValue16 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
        float exponentialValue11 = comparisonValue24 ? exp2(log2(spvNMax(scalarValue17, 0.0)) * 2.2000000476837158203125) : ((scalarValue17 <= 0.040449999272823333740234375) ? (scalarValue17 * 0.077399380505084991455078125) : exp2(log2((scalarValue17 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
        float exponentialValue12 = comparisonValue24 ? exp2(log2(spvNMax(scalarValue18, 0.0)) * 2.2000000476837158203125) : ((scalarValue18 <= 0.040449999272823333740234375) ? (scalarValue18 * 0.077399380505084991455078125) : exp2(log2((scalarValue18 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
        float multiplyAddValue50 = floor(fma(varyingTexCoord0.x, fragmentVectorConstants1.packedValues[17u].x, -0.5)) + 0.5;
        float multiplyAddValue51 = floor(fma(varyingTexCoord0.y, fragmentVectorConstants1.packedValues[17u].y, -0.5)) + 0.5;
        float productValue109 = multiplyAddValue50 * fragmentVectorConstants1.packedValues[17u].z;
        float productValue110 = multiplyAddValue51 * fragmentVectorConstants1.packedValues[17u].w;
        float sumValue35 = fragmentVectorConstants1.packedValues[17u].z + productValue109;
        float sumValue36 = fragmentVectorConstants1.packedValues[17u].w + productValue110;
        float multiplyAddValue52 = fma(multiplyAddValue50, fragmentVectorConstants1.packedValues[17u].z, fragmentVectorConstants1.packedValues[17u].z);
        float multiplyAddValue53 = fma(multiplyAddValue51, fragmentVectorConstants1.packedValues[17u].w, fragmentVectorConstants1.packedValues[17u].w);
        float multiplyAddValue54 = fract(fma(-multiplyAddValue50, fragmentVectorConstants1.packedValues[17u].z, varyingTexCoord0.x) * fragmentVectorConstants1.packedValues[17u].x);
        float multiplyAddValue55 = fract(fma(-multiplyAddValue51, fragmentVectorConstants1.packedValues[17u].w, varyingTexCoord0.y) * fragmentVectorConstants1.packedValues[17u].y);
        float sumValue37 = 1.0 - multiplyAddValue55;
        float sumValue38 = 1.0 - multiplyAddValue54;
        vec4 sampledTextureValue33 = texture(sampler2D(materialTexture4, textureSampler4), vec2(productValue109, productValue110));
        float multiplyAddValue56 = fma(sampledTextureValue33.x, 2.0, -1.0);
        float multiplyAddValue57 = fma(sampledTextureValue33.y, 2.0, -1.0);
        float scalarValue43 = abs(multiplyAddValue57);
        float sumValue39 = 1.0 - abs(multiplyAddValue56);
        float sumValue40 = sumValue39 - scalarValue43;
        bool conditionValue6 = sumValue40 < 0.0;
        float comparisonValue25 = conditionValue6 ? (((multiplyAddValue56 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue43)) : multiplyAddValue56;
        float comparisonValue26 = conditionValue6 ? (((multiplyAddValue57 >= 0.0) ? 1.0 : (-1.0)) * sumValue39) : multiplyAddValue57;
        vec3 vectorValue3 = vec3(comparisonValue25, comparisonValue26, sumValue40);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float multiplyAddValue58 = fma(sampledTextureValue33.z, 65535.0, sampledTextureValue33.w);
        vec3 productValue111 = vec3(inverseLengthValue12 * comparisonValue22, inverseLengthValue12 * comparisonValue23, inverseLengthValue12 * sumValue34);
        float exponentialValue13 = spvNMax(spvNMin(exp2((rdDot3Precise2(vec3(inverseLengthValue13 * comparisonValue25, inverseLengthValue13 * comparisonValue26, inverseLengthValue13 * sumValue40), productValue111) - 1.0) * fragmentScalarConstants1.packedValues[92u]), 1.0), 6.1999999161344021558761596679688e-05);
        bool comparisonValue27 = scalarValue10 >= 1.0;
        float multiplyAddValue59 = 1.0 / (abs(fma(-multiplyAddValue58, 1.525902189314365386962890625e-05, scalarValue10)) + 6.1999999161344021558761596679688e-05);
        vec4 sampledTextureValue34 = texture(sampler2D(materialTexture4, textureSampler4), vec2(sumValue35, productValue110));
        float multiplyAddValue60 = fma(sampledTextureValue34.x, 2.0, -1.0);
        float multiplyAddValue61 = fma(sampledTextureValue34.y, 2.0, -1.0);
        float scalarValue44 = abs(multiplyAddValue61);
        float sumValue41 = 1.0 - abs(multiplyAddValue60);
        float sumValue42 = sumValue41 - scalarValue44;
        bool conditionValue7 = sumValue42 < 0.0;
        float comparisonValue28 = conditionValue7 ? (((multiplyAddValue60 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue44)) : multiplyAddValue60;
        float comparisonValue29 = conditionValue7 ? (((multiplyAddValue61 >= 0.0) ? 1.0 : (-1.0)) * sumValue41) : multiplyAddValue61;
        vec3 vectorValue4 = vec3(comparisonValue28, comparisonValue29, sumValue42);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        float multiplyAddValue62 = fma(sampledTextureValue34.z, 65535.0, sampledTextureValue34.w);
        float exponentialValue14 = spvNMax(spvNMin(exp2((rdDot3Precise2(vec3(inverseLengthValue14 * comparisonValue28, inverseLengthValue14 * comparisonValue29, inverseLengthValue14 * sumValue42), productValue111) - 1.0) * fragmentScalarConstants1.packedValues[92u]), 1.0), 6.1999999161344021558761596679688e-05);
        float multiplyAddValue63 = 1.0 / (abs(fma(-multiplyAddValue62, 1.525902189314365386962890625e-05, scalarValue10)) + 6.1999999161344021558761596679688e-05);
        float comparisonValue30 = (sumValue37 * multiplyAddValue54) * (((comparisonValue27 || (multiplyAddValue62 >= 65535.0)) ? ((((exponentialValue14 <= 6.1999999161344021558761596679688e-05) ? 0.00012399999832268804311752319335938 : 0.0) - multiplyAddValue63) + multiplyAddValue63) : multiplyAddValue63) * exponentialValue14);
        vec4 sampledTextureValue35 = texture(sampler2D(materialTexture4, textureSampler4), vec2(productValue109, sumValue36));
        float multiplyAddValue64 = fma(sampledTextureValue35.x, 2.0, -1.0);
        float multiplyAddValue65 = fma(sampledTextureValue35.y, 2.0, -1.0);
        float scalarValue45 = abs(multiplyAddValue65);
        float sumValue43 = 1.0 - abs(multiplyAddValue64);
        float sumValue44 = sumValue43 - scalarValue45;
        bool conditionValue8 = sumValue44 < 0.0;
        float comparisonValue31 = conditionValue8 ? ((1.0 - scalarValue45) * ((multiplyAddValue64 >= 0.0) ? 1.0 : (-1.0))) : multiplyAddValue64;
        float comparisonValue32 = conditionValue8 ? (sumValue43 * ((multiplyAddValue65 >= 0.0) ? 1.0 : (-1.0))) : multiplyAddValue65;
        vec3 vectorValue5 = vec3(comparisonValue31, comparisonValue32, sumValue44);
        float inverseLengthValue15 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
        float multiplyAddValue66 = fma(sampledTextureValue35.z, 65535.0, sampledTextureValue35.w);
        float exponentialValue15 = spvNMax(spvNMin(exp2((rdDot3Precise2(vec3(inverseLengthValue15 * comparisonValue31, inverseLengthValue15 * comparisonValue32, inverseLengthValue15 * sumValue44), productValue111) - 1.0) * fragmentScalarConstants1.packedValues[92u]), 1.0), 6.1999999161344021558761596679688e-05);
        float multiplyAddValue67 = 1.0 / (abs(fma(-multiplyAddValue66, 1.525902189314365386962890625e-05, scalarValue10)) + 6.1999999161344021558761596679688e-05);
        vec4 sampledTextureValue36 = texture(sampler2D(materialTexture4, textureSampler4), vec2(multiplyAddValue52, multiplyAddValue53));
        float multiplyAddValue68 = fma(sampledTextureValue36.x, 2.0, -1.0);
        float multiplyAddValue69 = fma(sampledTextureValue36.y, 2.0, -1.0);
        float scalarValue46 = abs(multiplyAddValue69);
        float sumValue45 = 1.0 - abs(multiplyAddValue68);
        float sumValue46 = sumValue45 - scalarValue46;
        bool conditionValue9 = sumValue46 < 0.0;
        float comparisonValue33 = conditionValue9 ? (((multiplyAddValue68 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue46)) : multiplyAddValue68;
        float comparisonValue34 = conditionValue9 ? (((multiplyAddValue69 >= 0.0) ? 1.0 : (-1.0)) * sumValue45) : multiplyAddValue69;
        vec3 vectorValue6 = vec3(comparisonValue33, comparisonValue34, sumValue46);
        float inverseLengthValue16 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
        float multiplyAddValue70 = fma(sampledTextureValue36.z, 65535.0, sampledTextureValue36.w);
        float exponentialValue16 = spvNMax(spvNMin(exp2((rdDot3Precise2(vec3(inverseLengthValue16 * comparisonValue33, inverseLengthValue16 * comparisonValue34, inverseLengthValue16 * sumValue46), productValue111) - 1.0) * fragmentScalarConstants1.packedValues[92u]), 1.0), 6.1999999161344021558761596679688e-05);
        float multiplyAddValue71 = 1.0 / (abs(fma(-multiplyAddValue70, 1.525902189314365386962890625e-05, scalarValue10)) + 6.1999999161344021558761596679688e-05);
        float comparisonValue35 = (multiplyAddValue55 * multiplyAddValue54) * (((comparisonValue27 || (multiplyAddValue70 >= 65535.0)) ? ((((exponentialValue16 <= 6.1999999161344021558761596679688e-05) ? 0.00012399999832268804311752319335938 : 0.0) - multiplyAddValue71) + multiplyAddValue71) : multiplyAddValue71) * exponentialValue16);
        float multiplyAddValue72 = fma(((comparisonValue27 || (multiplyAddValue58 >= 65535.0)) ? ((((exponentialValue13 <= 6.1999999161344021558761596679688e-05) ? 0.00012399999832268804311752319335938 : 0.0) - multiplyAddValue59) + multiplyAddValue59) : multiplyAddValue59) * exponentialValue13, sumValue37 * sumValue38, comparisonValue30);
        float multiplyAddValue73 = fma(((comparisonValue27 || (multiplyAddValue66 >= 65535.0)) ? ((((exponentialValue15 <= 6.1999999161344021558761596679688e-05) ? 0.00012399999832268804311752319335938 : 0.0) - multiplyAddValue67) + multiplyAddValue67) : multiplyAddValue67) * exponentialValue15, sumValue38 * multiplyAddValue55, comparisonValue35);
        bool conditionValue10 = multiplyAddValue72 > 0.0;
        bool conditionValue11 = multiplyAddValue73 > 0.0;
        float quotientValue20 = comparisonValue30 / multiplyAddValue72;
        float quotientValue21 = comparisonValue35 / multiplyAddValue73;
        float multiplyAddValue74 = conditionValue10 ? fma(sumValue35 - productValue109, quotientValue20, productValue109) : productValue109;
        float multiplyAddValue75 = conditionValue10 ? fma(productValue110 - productValue110, quotientValue20, productValue110) : productValue110;
        float multiplyAddValue76 = conditionValue11 ? fma(multiplyAddValue52 - productValue109, quotientValue21, productValue109) : productValue109;
        float multiplyAddValue77 = conditionValue11 ? fma(multiplyAddValue53 - sumValue36, quotientValue21, sumValue36) : sumValue36;
        float sumValue47 = (multiplyAddValue73 + multiplyAddValue72) + 6.1999999161344021558761596679688e-05;
        float quotientValue22 = multiplyAddValue72 / sumValue47;
        float quotientValue23 = multiplyAddValue73 / sumValue47;
        vec4 sampledTextureValue37 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue74, multiplyAddValue75));
        vec4 sampledTextureValue38 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue76, multiplyAddValue77));
        vec4 sampledTextureValue39 = texture(sampler2D(materialTexture8, textureSampler8), vec2(multiplyAddValue74, multiplyAddValue75));
        vec4 sampledTextureValue40 = texture(sampler2D(materialTexture8, textureSampler8), vec2(multiplyAddValue76, multiplyAddValue77));
        float scalarValue47 = rdDot3Precise2(vec3(exponentialValue10, exponentialValue11, exponentialValue12), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        multiplyAddValue28 = (bitwiseValue1 * (fma(fragmentScalarConstants1.packedValues[85u], scalarValue47 - exponentialValue12, exponentialValue12) * fragmentScalarConstants1.packedValues[82u])) * fragmentScalarConstants1.packedValues[84u];
        multiplyAddValue29 = (bitwiseValue1 * (fma(fragmentScalarConstants1.packedValues[85u], scalarValue47 - exponentialValue11, exponentialValue11) * fragmentScalarConstants1.packedValues[82u])) * fragmentScalarConstants1.packedValues[84u];
        multiplyAddValue30 = (bitwiseValue1 * (fma(fragmentScalarConstants1.packedValues[85u], scalarValue47 - exponentialValue10, exponentialValue10) * fragmentScalarConstants1.packedValues[82u])) * fragmentScalarConstants1.packedValues[84u];
        multiplyAddValue31 = exponentialValue12 * fma(quotientValue22, sampledTextureValue37.z, quotientValue23 * sampledTextureValue38.z);
        multiplyAddValue32 = exponentialValue11 * fma(quotientValue22, sampledTextureValue37.y, quotientValue23 * sampledTextureValue38.y);
        multiplyAddValue33 = exponentialValue10 * fma(quotientValue22, sampledTextureValue37.x, quotientValue23 * sampledTextureValue38.x);
        multiplyAddValue34 = fma(quotientValue22, sampledTextureValue39.z, quotientValue23 * sampledTextureValue40.z);
        multiplyAddValue35 = fma(quotientValue22, sampledTextureValue39.y, quotientValue23 * sampledTextureValue40.y);
        multiplyAddValue36 = fma(quotientValue22, sampledTextureValue39.x, quotientValue23 * sampledTextureValue40.x);
    }
    else
    {
        multiplyAddValue28 = 0.0;
        multiplyAddValue29 = 0.0;
        multiplyAddValue30 = 0.0;
        multiplyAddValue31 = 0.0;
        multiplyAddValue32 = 0.0;
        multiplyAddValue33 = 0.0;
        multiplyAddValue34 = 0.0;
        multiplyAddValue35 = 0.0;
        multiplyAddValue36 = 0.0;
    }
    float sumValue48 = multiplyAddValue30 + (multiplyAddValue36 + multiplyAddValue33);
    float sumValue49 = multiplyAddValue29 + (multiplyAddValue35 + multiplyAddValue32);
    float sumValue50 = multiplyAddValue28 + (multiplyAddValue34 + multiplyAddValue31);
    float intermediateValue55;
    float intermediateValue56;
    float intermediateValue58;
    float intermediateValue60;
    if (fragmentScalarConstants1.packedValues[52u] != 0.0)
    {
        float multiplyAddValue14 = fma(scalarValue10, fragmentScalarConstants1.packedValues[31u], fragmentScalarConstants1.packedValues[35u]);
        float quotientValue5 = (varyingColor1.x * fragmentScalarConstants1.packedValues[20u]) / multiplyAddValue14;
        float quotientValue6 = (varyingColor1.y * fragmentScalarConstants1.packedValues[25u]) / multiplyAddValue14;
        float quotientValue7 = fragmentScalarConstants1.packedValues[34u] / multiplyAddValue14;
        vec3 vectorValue = vec3(quotientValue5, quotientValue6, quotientValue7);
        float nonlinearValue7 = spvNClamp((((sqrt(rdDot3Precise2(vectorValue, vectorValue)) / fragmentScalarConstants1.packedValues[46u]) + fragmentScalarConstants1.packedValues[100u]) - fragmentScalarConstants1.packedValues[44u]) * fragmentScalarConstants1.packedValues[45u], 0.0, 1.0);
        float intermediateValue57;
        float intermediateValue59;
        float intermediateValue61;
        if (nonlinearValue7 > 0.0)
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float productValue = (scalarValue * fragmentVectorConstants1.packedValues[7u].w) + fragmentVectorConstants1.packedValues[8u].w;
    float quotientValue = (fragmentVectorConstants1.packedValues[5u].x * varyingColor1.x) / productValue;
    float quotientValue1 = (fragmentVectorConstants1.packedValues[6u].y * varyingColor1.y) / productValue;
    float quotientValue2 = fragmentVectorConstants1.packedValues[8u].z / productValue;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[3u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[1u].x));
    float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[3u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[1u].y));
    float multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[3u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[1u].z));
    vec4 sampledTextureValue1 = texture(sampler2D(colorMetalnessSubsurfaceTexture, colorMetalnessSubsurfaceSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    uvec2 sampledTextureValue2 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    uvec4 sampledTextureValue3 = texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue2.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(sampledTextureValue2.y)))))) * varyingTexCoord0.y)))), int(0u));
    float sampledTextureValue4;
    if (fragmentVectorConstants1.packedValues[26u].x > 0.5)
    {
        sampledTextureValue4 = textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(varyingTexCoord0.x, varyingTexCoord0.y, 1.0), 0.0).y;
    }
    else
    {
        sampledTextureValue4 = 1.0;
    }
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
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
    float productValue1;
    float productValue2;
    float productValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float productValue4;
    float productValue5;
    float productValue6;
    if (scalarValue != 1.0)
    {
        vec4 sampledTextureValue6 = texture(sampler2D(diffuseLightingTexture, diffuseLightingSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        vec4 sampledTextureValue7 = texture(sampler2D(specularLightingTexture, specularLightingSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        float dotProductValue = dot(vec3(exponentialValue, exponentialValue1, exponentialValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float bitwiseValue = ((float(sampledTextureValue3.x & 255u) * 0.0039215688593685626983642578125) * fragmentVectorConstants1.packedValues[19u].z) * fragmentVectorConstants1.packedValues[20u].x;
        productValue1 = sampledTextureValue6.x * exponentialValue;
        productValue2 = sampledTextureValue6.y * exponentialValue1;
        productValue3 = sampledTextureValue6.z * exponentialValue2;
        intermediateValue4 = sampledTextureValue7.x;
        intermediateValue5 = sampledTextureValue7.y;
        intermediateValue6 = sampledTextureValue7.z;
        productValue4 = (((dotProductValue - exponentialValue) * fragmentVectorConstants1.packedValues[20u].y) + exponentialValue) * bitwiseValue;
        productValue5 = (((dotProductValue - exponentialValue1) * fragmentVectorConstants1.packedValues[20u].y) + exponentialValue1) * bitwiseValue;
        productValue6 = (((dotProductValue - exponentialValue2) * fragmentVectorConstants1.packedValues[20u].y) + exponentialValue2) * bitwiseValue;
    }
    else
    {
        productValue1 = 0.0;
        productValue2 = 0.0;
        productValue3 = 0.0;
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
        intermediateValue6 = 0.0;
        productValue4 = 0.0;
        productValue5 = 0.0;
        productValue6 = 0.0;
    }
    float sumValue = (intermediateValue4 + productValue1) + productValue4;
    float sumValue1 = (intermediateValue5 + productValue2) + productValue5;
    float sumValue2 = (intermediateValue6 + productValue3) + productValue6;
    float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue3, multiplyAddValue7, multiplyAddValue8), vec3(multiplyAddValue3, multiplyAddValue7, multiplyAddValue8)));
    float productValue13 = inverseLengthValue * multiplyAddValue3;
    float productValue14 = inverseLengthValue * multiplyAddValue7;
    float productValue15 = inverseLengthValue * multiplyAddValue8;
    bool comparisonValue = fragmentVectorConstants1.packedValues[13u].y != 0.0;
    float productValue10;
    float productValue11;
    float productValue12;
    if ((comparisonValue && (fragmentVectorConstants1.packedValues[13u].z != 0.0)) && (fragmentVectorConstants1.packedValues[19u].w != 0.0))
    {
        productValue10 = spvNMax(fragmentVectorConstants1.packedValues[9u].w + (fragmentVectorConstants1.packedValues[24u].x * fragmentVectorConstants1.packedValues[24u].w), fragmentVectorConstants1.packedValues[10u].x * fragmentVectorConstants1.packedValues[10u].w) * fragmentVectorConstants1.packedValues[13u].z;
        productValue11 = spvNMax(fragmentVectorConstants1.packedValues[9u].w + (fragmentVectorConstants1.packedValues[24u].y * fragmentVectorConstants1.packedValues[24u].w), fragmentVectorConstants1.packedValues[10u].y * fragmentVectorConstants1.packedValues[10u].w) * fragmentVectorConstants1.packedValues[13u].z;
        productValue12 = spvNMax(fragmentVectorConstants1.packedValues[9u].w + (fragmentVectorConstants1.packedValues[24u].z * fragmentVectorConstants1.packedValues[24u].w), fragmentVectorConstants1.packedValues[10u].z * fragmentVectorConstants1.packedValues[10u].w) * fragmentVectorConstants1.packedValues[13u].z;
    }
    else
    {
        productValue10 = 0.0;
        productValue11 = 0.0;
        productValue12 = 0.0;
    }
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if (fragmentVectorConstants1.packedValues[13u].x != 0.0)
    {
        float nonlinearValue = spvNClamp(((fragmentVectorConstants1.packedValues[23u].x - fragmentVectorConstants1.packedValues[11u].x) + (sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2)) / fragmentVectorConstants1.packedValues[11u].z)) * fragmentVectorConstants1.packedValues[11u].y, 0.0, 1.0);
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (nonlinearValue > 0.0)
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue21 = texture(sampler2D(normalTexture, normalSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue21.x;
    float scalarValue28 = sampledTextureValue21.y;
    vec4 sampledTextureValue = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float productValue = (scalarValue * fragmentVectorConstants1.packedValues[7u].w) + fragmentVectorConstants1.packedValues[8u].w;
    float quotientValue = (fragmentVectorConstants1.packedValues[5u].x * varyingColor1.x) / productValue;
    float quotientValue1 = (fragmentVectorConstants1.packedValues[6u].y * varyingColor1.y) / productValue;
    float quotientValue2 = fragmentVectorConstants1.packedValues[8u].z / productValue;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[3u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[2u].x, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[1u].x));
    float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[3u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[2u].y, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[1u].y));
    float multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[3u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[2u].z, quotientValue1, quotientValue * fragmentVectorConstants1.packedValues[1u].z));
    float sumValue12 = 1.0 - abs(scalarValue27);
    float scalarValue29 = abs(scalarValue28);
    float sumValue13 = sumValue12 - scalarValue29;
    bool conditionValue = sumValue13 < 0.0;
    float comparisonValue6 = conditionValue ? ((1.0 - scalarValue29) * ((scalarValue27 < 0.0) ? (-1.0) : 1.0)) : scalarValue27;
    float comparisonValue7 = conditionValue ? (sumValue12 * ((scalarValue28 < 0.0) ? (-1.0) : 1.0)) : scalarValue28;
    float inverseLengthValue2 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, sumValue13), vec3(comparisonValue6, comparisonValue7, sumValue13)));
    float productValue54 = comparisonValue6 * inverseLengthValue2;
    float productValue55 = comparisonValue7 * inverseLengthValue2;
    float productValue60 = inverseLengthValue2 * sumValue13;
    float inverseLengthValue3 = inversesqrt(dot(vec3(productValue54, productValue55, productValue60), vec3(productValue54, productValue55, productValue60)));
    float productValue61 = inverseLengthValue3 * productValue54;
    float productValue62 = productValue55 * inverseLengthValue3;
    float productValue63 = inverseLengthValue3 * productValue60;
    vec4 sampledTextureValue1 = texture(sampler2D(colorMetalnessSubsurfaceTexture, colorMetalnessSubsurfaceSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    uvec2 sampledTextureValue2 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    uvec4 sampledTextureValue3 = texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue2.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(sampledTextureValue2.y)))))) * varyingTexCoord0.y)))), int(0u));
    float sampledTextureValue5;
    if (fragmentVectorConstants1.packedValues[28u].x > 0.5)
    {
        sampledTextureValue5 = textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(varyingTexCoord0.x, varyingTexCoord0.y, 1.0), 0.0).y;
    }
    else
    {
        sampledTextureValue5 = 1.0;
    }
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[18u].x != 0.0)
    {
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
    float productValue36;
    float productValue37;
    float productValue38;
    float productValue39;
    float productValue40;
    float productValue41;
    float productValue42;
    float productValue43;
    float productValue44;
    if (scalarValue != 1.0)
    {
        float productValue64 = floor((fragmentVectorConstants1.packedValues[17u].x * varyingTexCoord0.x) + (-0.5)) + 0.5;
        float productValue65 = productValue64 * fragmentVectorConstants1.packedValues[17u].z;
        float productValue66 = (floor((fragmentVectorConstants1.packedValues[17u].y * varyingTexCoord0.y) + (-0.5)) + 0.5) * fragmentVectorConstants1.packedValues[17u].w;
        float sumValue14 = productValue65 + fragmentVectorConstants1.packedValues[17u].z;
        float sumValue15 = productValue66 + fragmentVectorConstants1.packedValues[17u].w;
        float productValue67 = fract((varyingTexCoord0.x - productValue65) * fragmentVectorConstants1.packedValues[17u].x);
        float productValue68 = fract((varyingTexCoord0.y - productValue66) * fragmentVectorConstants1.packedValues[17u].y);
        float sumValue16 = 1.0 - productValue67;
        float sumValue17 = 1.0 - productValue68;
        vec4 sampledTextureValue22 = texture(sampler2D(normalsAndDepthLightingTexture, normalsAndDepthLightingSampler), vec2(productValue65, productValue66));
        float productValue69 = (sampledTextureValue22.x * 2.0) + (-1.0);
        float productValue70 = (sampledTextureValue22.y * 2.0) + (-1.0);
        float sumValue18 = 1.0 - abs(productValue69);
        float scalarValue30 = abs(productValue70);
        float sumValue19 = sumValue18 - scalarValue30;
        bool conditionValue1 = sumValue19 < 0.0;
        float comparisonValue8 = conditionValue1 ? (((productValue69 < 0.0) ? (-1.0) : 1.0) * (1.0 - scalarValue30)) : productValue69;
        float comparisonValue9 = conditionValue1 ? (((productValue70 < 0.0) ? (-1.0) : 1.0) * sumValue18) : productValue70;
        float inverseLengthValue4 = inversesqrt(dot(vec3(comparisonValue8, comparisonValue9, sumValue19), vec3(comparisonValue8, comparisonValue9, sumValue19)));
        float productValue71 = comparisonValue8 * inverseLengthValue4;
        float productValue75 = comparisonValue9 * inverseLengthValue4;
        float productValue76 = inverseLengthValue4 * sumValue19;
        float inverseLengthValue5 = inversesqrt(dot(vec3(productValue71, productValue75, productValue76), vec3(productValue71, productValue75, productValue76)));
        float productValue77 = ((sampledTextureValue22.z * 65535.0) + sampledTextureValue22.w) * 1.525902189314365386962890625e-05;
        float dotProductValue3 = spvNMax(spvNClamp(exp2((dot(vec3(productValue71 * inverseLengthValue5, productValue75 * inverseLengthValue5, inverseLengthValue5 * productValue76), vec3(productValue61, productValue62, productValue63)) + (-1.0)) * fragmentVectorConstants1.packedValues[23u].x), 0.0, 1.0), 6.1999999161344021558761596679688e-05);
        float comparisonValue10 = (scalarValue < 1.0) ? 0.0 : 1.0;
        float quotientValue10 = 1.0 / (abs(scalarValue - productValue77) + 6.1999999161344021558761596679688e-05);
        vec4 sampledTextureValue23 = texture(sampler2D(normalsAndDepthLightingTexture, normalsAndDepthLightingSampler), vec2(sumValue14, productValue66));
        float productValue78 = (sampledTextureValue23.x * 2.0) + (-1.0);
        float productValue79 = (sampledTextureValue23.y * 2.0) + (-1.0);
        float sumValue20 = 1.0 - abs(productValue78);
        float scalarValue31 = abs(productValue79);
        float sumValue21 = sumValue20 - scalarValue31;
        bool conditionValue2 = sumValue21 < 0.0;
        float comparisonValue11 = conditionValue2 ? (((productValue78 < 0.0) ? (-1.0) : 1.0) * (1.0 - scalarValue31)) : productValue78;
        float comparisonValue12 = conditionValue2 ? (((productValue79 < 0.0) ? (-1.0) : 1.0) * sumValue20) : productValue79;
        float inverseLengthValue6 = inversesqrt(dot(vec3(comparisonValue11, comparisonValue12, sumValue21), vec3(comparisonValue11, comparisonValue12, sumValue21)));
        float productValue80 = comparisonValue11 * inverseLengthValue6;
        float productValue81 = comparisonValue12 * inverseLengthValue6;
        float productValue82 = inverseLengthValue6 * sumValue21;
        float inverseLengthValue7 = inversesqrt(dot(vec3(productValue80, productValue81, productValue82), vec3(productValue80, productValue81, productValue82)));
        float productValue83 = ((sampledTextureValue23.z * 65535.0) + sampledTextureValue23.w) * 1.525902189314365386962890625e-05;
        float dotProductValue4 = spvNMax(spvNClamp(exp2((dot(vec3(productValue80 * inverseLengthValue7, productValue81 * inverseLengthValue7, inverseLengthValue7 * productValue82), vec3(productValue61, productValue62, productValue63)) + (-1.0)) * fragmentVectorConstants1.packedValues[23u].x), 0.0, 1.0), 6.1999999161344021558761596679688e-05);
        float quotientValue11 = 1.0 / (abs(scalarValue - productValue83) + 6.1999999161344021558761596679688e-05);
        float comparisonValue13 = ((sumValue17 * productValue67) * dotProductValue4) * (((((dotProductValue4 > 6.1999999161344021558761596679688e-05) ? 0.0 : 0.00012399999832268804311752319335938) - quotientValue11) * spvNMax(comparisonValue10, (productValue83 < 1.0) ? 0.0 : 1.0)) + quotientValue11);
        vec4 sampledTextureValue24 = texture(sampler2D(normalsAndDepthLightingTexture, normalsAndDepthLightingSampler), vec2(productValue65, sumValue15));
        float productValue84 = (sampledTextureValue24.x * 2.0) + (-1.0);
        float productValue85 = (sampledTextureValue24.y * 2.0) + (-1.0);
        float sumValue22 = 1.0 - abs(productValue84);
        float scalarValue32 = abs(productValue85);
        float sumValue23 = sumValue22 - scalarValue32;
        bool conditionValue3 = sumValue23 < 0.0;
        float comparisonValue14 = conditionValue3 ? (((productValue84 < 0.0) ? (-1.0) : 1.0) * (1.0 - scalarValue32)) : productValue84;
        float comparisonValue15 = conditionValue3 ? (((productValue85 < 0.0) ? (-1.0) : 1.0) * sumValue22) : productValue85;
        float inverseLengthValue8 = inversesqrt(dot(vec3(comparisonValue14, comparisonValue15, sumValue23), vec3(comparisonValue14, comparisonValue15, sumValue23)));
        float productValue86 = comparisonValue14 * inverseLengthValue8;
        float productValue87 = comparisonValue15 * inverseLengthValue8;
        float productValue88 = inverseLengthValue8 * sumValue23;
        float inverseLengthValue9 = inversesqrt(dot(vec3(productValue86, productValue87, productValue88), vec3(productValue86, productValue87, productValue88)));
        float productValue89 = ((sampledTextureValue24.z * 65535.0) + sampledTextureValue24.w) * 1.525902189314365386962890625e-05;
        float dotProductValue5 = spvNMax(spvNClamp(exp2((dot(vec3(productValue86 * inverseLengthValue9, productValue87 * inverseLengthValue9, inverseLengthValue9 * productValue88), vec3(productValue61, productValue62, productValue63)) + (-1.0)) * fragmentVectorConstants1.packedValues[23u].x), 0.0, 1.0), 6.1999999161344021558761596679688e-05);
        float quotientValue12 = 1.0 / (abs(scalarValue - productValue89) + 6.1999999161344021558761596679688e-05);
        vec4 sampledTextureValue25 = texture(sampler2D(normalsAndDepthLightingTexture, normalsAndDepthLightingSampler), vec2(sumValue14, sumValue15));
        float productValue90 = (sampledTextureValue25.x * 2.0) + (-1.0);
        float productValue91 = (sampledTextureValue25.y * 2.0) + (-1.0);
        float sumValue24 = 1.0 - abs(productValue90);
        float scalarValue33 = abs(productValue91);
        float sumValue25 = sumValue24 - scalarValue33;
        bool conditionValue4 = sumValue25 < 0.0;
        float comparisonValue16 = conditionValue4 ? (((productValue90 < 0.0) ? (-1.0) : 1.0) * (1.0 - scalarValue33)) : productValue90;
        float comparisonValue17 = conditionValue4 ? (((productValue91 < 0.0) ? (-1.0) : 1.0) * sumValue24) : productValue91;
        float inverseLengthValue10 = inversesqrt(dot(vec3(comparisonValue16, comparisonValue17, sumValue25), vec3(comparisonValue16, comparisonValue17, sumValue25)));
        float productValue92 = comparisonValue16 * inverseLengthValue10;
        float productValue93 = comparisonValue17 * inverseLengthValue10;
        float productValue94 = inverseLengthValue10 * sumValue25;
        float inverseLengthValue11 = inversesqrt(dot(vec3(productValue92, productValue93, productValue94), vec3(productValue92, productValue93, productValue94)));
        float productValue95 = ((sampledTextureValue25.z * 65535.0) + sampledTextureValue25.w) * 1.525902189314365386962890625e-05;
        float dotProductValue6 = spvNMax(spvNClamp(exp2((dot(vec3(productValue92 * inverseLengthValue11, productValue93 * inverseLengthValue11, inverseLengthValue11 * productValue94), vec3(productValue61, productValue62, productValue63)) + (-1.0)) * fragmentVectorConstants1.packedValues[23u].x), 0.0, 1.0), 6.1999999161344021558761596679688e-05);
        float quotientValue13 = 1.0 / (abs(scalarValue - productValue95) + 6.1999999161344021558761596679688e-05);
        float comparisonValue18 = ((productValue68 * productValue67) * dotProductValue6) * (((((dotProductValue6 > 6.1999999161344021558761596679688e-05) ? 0.0 : 0.00012399999832268804311752319335938) - quotientValue13) * spvNMax(comparisonValue10, (productValue95 < 1.0) ? 0.0 : 1.0)) + quotientValue13);
        float comparisonValue19 = comparisonValue13 + (((sumValue17 * sumValue16) * dotProductValue3) * (((((dotProductValue3 > 6.1999999161344021558761596679688e-05) ? 0.0 : 0.00012399999832268804311752319335938) - quotientValue10) * spvNMax(comparisonValue10, (productValue77 < 1.0) ? 0.0 : 1.0)) + quotientValue10));
        float comparisonValue20 = comparisonValue18 + (((sumValue16 * productValue68) * dotProductValue5) * (((((dotProductValue5 > 6.1999999161344021558761596679688e-05) ? 0.0 : 0.00012399999832268804311752319335938) - quotientValue12) * spvNMax(comparisonValue10, (productValue89 < 1.0) ? 0.0 : 1.0)) + quotientValue12));
        float quotientValue14 = (((comparisonValue13 / comparisonValue19) * float(comparisonValue19 > 0.0)) + productValue64) * fragmentVectorConstants1.packedValues[17u].z;
        float quotientValue15 = ((float(comparisonValue20 > 0.0) * (comparisonValue18 / comparisonValue20)) + productValue64) * fragmentVectorConstants1.packedValues[17u].z;
        float sumValue26 = (comparisonValue19 + 6.1999999161344021558761596679688e-05) + comparisonValue20;
        float quotientValue16 = comparisonValue19 / sumValue26;
        float quotientValue17 = comparisonValue20 / sumValue26;
        vec4 sampledTextureValue26 = texture(sampler2D(diffuseLightingTexture, diffuseLightingSampler), vec2(quotientValue14, productValue66));
        vec4 sampledTextureValue27 = texture(sampler2D(diffuseLightingTexture, diffuseLightingSampler), vec2(quotientValue15, sumValue15));
        vec4 sampledTextureValue28 = texture(sampler2D(specularLightingTexture, specularLightingSampler), vec2(quotientValue14, productValue66));
        vec4 sampledTextureValue29 = texture(sampler2D(specularLightingTexture, specularLightingSampler), vec2(quotientValue15, sumValue15));
        float dotProductValue = dot(vec3(exponentialValue, exponentialValue1, exponentialValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float bitwiseValue2 = ((float(sampledTextureValue3.x & 255u) * 0.0039215688593685626983642578125) * fragmentVectorConstants1.packedValues[20u].z) * fragmentVectorConstants1.packedValues[21u].x;
        productValue36 = ((sampledTextureValue27.x * quotientValue17) + (sampledTextureValue26.x * quotientValue16)) * exponentialValue;
        productValue37 = ((sampledTextureValue27.y * quotientValue17) + (sampledTextureValue26.y * quotientValue16)) * exponentialValue1;
        productValue38 = ((sampledTextureValue27.z * quotientValue17) + (sampledTextureValue26.z * quotientValue16)) * exponentialValue2;
        productValue39 = (sampledTextureValue29.x * quotientValue17) + (sampledTextureValue28.x * quotientValue16);
        productValue40 = (sampledTextureValue29.y * quotientValue17) + (sampledTextureValue28.y * quotientValue16);
        productValue41 = (sampledTextureValue29.z * quotientValue17) + (sampledTextureValue28.z * quotientValue16);
        productValue42 = (((dotProductValue - exponentialValue) * fragmentVectorConstants1.packedValues[21u].y) + exponentialValue) * bitwiseValue2;
        productValue43 = (((dotProductValue - exponentialValue1) * fragmentVectorConstants1.packedValues[21u].y) + exponentialValue1) * bitwiseValue2;
        productValue44 = (((dotProductValue - exponentialValue2) * fragmentVectorConstants1.packedValues[21u].y) + exponentialValue2) * bitwiseValue2;
    }
    else
    {
        productValue36 = 0.0;
        productValue37 = 0.0;
        productValue38 = 0.0;
        productValue39 = 0.0;
        productValue40 = 0.0;
        productValue41 = 0.0;
        productValue42 = 0.0;
        productValue43 = 0.0;
        productValue44 = 0.0;
    }
    float sumValue27 = (productValue39 + productValue36) + productValue42;
    float sumValue28 = (productValue40 + productValue37) + productValue43;
    float sumValue29 = (productValue41 + productValue38) + productValue44;
    float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue3, multiplyAddValue7, multiplyAddValue8), vec3(multiplyAddValue3, multiplyAddValue7, multiplyAddValue8)));
    float productValue13 = inverseLengthValue * multiplyAddValue3;
    float productValue14 = inverseLengthValue * multiplyAddValue7;
    float productValue15 = inverseLengthValue * multiplyAddValue8;
    bool comparisonValue = fragmentVectorConstants1.packedValues[13u].y != 0.0;
    float productValue48;
    float productValue49;
    float productValue50;
    if ((comparisonValue && (fragmentVectorConstants1.packedValues[13u].z != 0.0)) && (fragmentVectorConstants1.packedValues[20u].w != 0.0))
    {
        productValue48 = spvNMax(fragmentVectorConstants1.packedValues[9u].w + (fragmentVectorConstants1.packedValues[26u].x * fragmentVectorConstants1.packedValues[26u].w), fragmentVectorConstants1.packedValues[10u].x * fragmentVectorConstants1.packedValues[10u].w) * fragmentVectorConstants1.packedValues[13u].z;
        productValue49 = spvNMax(fragmentVectorConstants1.packedValues[9u].w + (fragmentVectorConstants1.packedValues[26u].y * fragmentVectorConstants1.packedValues[26u].w), fragmentVectorConstants1.packedValues[10u].y * fragmentVectorConstants1.packedValues[10u].w) * fragmentVectorConstants1.packedValues[13u].z;
        productValue50 = spvNMax(fragmentVectorConstants1.packedValues[9u].w + (fragmentVectorConstants1.packedValues[26u].z * fragmentVectorConstants1.packedValues[26u].w), fragmentVectorConstants1.packedValues[10u].z * fragmentVectorConstants1.packedValues[10u].w) * fragmentVectorConstants1.packedValues[13u].z;
    }
    else
    {
        productValue48 = 0.0;
        productValue49 = 0.0;
        productValue50 = 0.0;
    }
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if (fragmentVectorConstants1.packedValues[13u].x != 0.0)
    {
        float nonlinearValue6 = spvNClamp(((fragmentVectorConstants1.packedValues[25u].x - fragmentVectorConstants1.packedValues[11u].x) + (sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2)) / fragmentVectorConstants1.packedValues[11u].z)) * fragmentVectorConstants1.packedValues[11u].y, 0.0, 1.0);
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (nonlinearValue6 > 0.0)
#endif
        {
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float multiplyAddValue4;
            float multiplyAddValue5;
            float multiplyAddValue6;
            if (fragmentScalarConstants1.packedValues[53u] != 0.0)
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float multiplyAddValue38;
            float multiplyAddValue39;
            float multiplyAddValue40;
            if (fragmentScalarConstants1.packedValues[53u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            if (comparisonValue)
#endif
            {
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool comparisonValue3 = (fragmentScalarConstants1.packedValues[54u] != 0.0) && (fragmentScalarConstants1.packedValues[79u] != 0.0);
                multiplyAddValue4 = spvNMax(comparisonValue3 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[24u].x, fragmentScalarConstants1.packedValues[99u], fragmentScalarConstants1.packedValues[39u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].x) * fragmentScalarConstants1.packedValues[54u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[14u].x;
                multiplyAddValue5 = spvNMax(comparisonValue3 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[24u].y, fragmentScalarConstants1.packedValues[99u], fragmentScalarConstants1.packedValues[39u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].y) * fragmentScalarConstants1.packedValues[54u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[14u].y;
                multiplyAddValue6 = spvNMax(comparisonValue3 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[24u].z, fragmentScalarConstants1.packedValues[99u], fragmentScalarConstants1.packedValues[39u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].z) * fragmentScalarConstants1.packedValues[54u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[14u].z;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool comparisonValue36 = (fragmentScalarConstants1.packedValues[54u] != 0.0) && (fragmentScalarConstants1.packedValues[83u] != 0.0);
                multiplyAddValue38 = spvNMax(comparisonValue36 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[26u].x, fragmentScalarConstants1.packedValues[107u], fragmentScalarConstants1.packedValues[39u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].x) * fragmentScalarConstants1.packedValues[54u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[14u].x;
                multiplyAddValue39 = spvNMax(comparisonValue36 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[26u].y, fragmentScalarConstants1.packedValues[107u], fragmentScalarConstants1.packedValues[39u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].y) * fragmentScalarConstants1.packedValues[54u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[14u].y;
                multiplyAddValue40 = spvNMax(comparisonValue36 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[26u].z, fragmentScalarConstants1.packedValues[107u], fragmentScalarConstants1.packedValues[39u]), fragmentScalarConstants1.packedValues[43u] * fragmentVectorConstants1.packedValues[10u].z) * fragmentScalarConstants1.packedValues[54u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[14u].z;
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue4 = nonlinearValue;
                branchMergedValue5 = fragmentVectorConstants1.packedValues[14u].x * spvNMax(productValue10, 1.0);
                branchMergedValue6 = spvNMax(productValue11, 1.0) * fragmentVectorConstants1.packedValues[14u].y;
                branchMergedValue7 = spvNMax(productValue12, 1.0) * fragmentVectorConstants1.packedValues[14u].z;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue4 = nonlinearValue6;
                branchMergedValue5 = fragmentVectorConstants1.packedValues[14u].x * spvNMax(productValue48, 1.0);
                branchMergedValue6 = spvNMax(productValue49, 1.0) * fragmentVectorConstants1.packedValues[14u].y;
                branchMergedValue7 = spvNMax(productValue50, 1.0) * fragmentVectorConstants1.packedValues[14u].z;
#endif
            }
            else
            {
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                float multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[3u].x, quotientValue7, fma(fragmentVectorConstants1.packedValues[1u].x, quotientValue5, quotientValue6 * fragmentVectorConstants1.packedValues[2u].x));
                float multiplyAddValue16 = fma(fragmentVectorConstants1.packedValues[3u].y, quotientValue7, fma(fragmentVectorConstants1.packedValues[1u].y, quotientValue5, quotientValue6 * fragmentVectorConstants1.packedValues[2u].y));
                float multiplyAddValue17 = fma(fragmentVectorConstants1.packedValues[3u].z, quotientValue7, fma(fragmentVectorConstants1.packedValues[1u].z, quotientValue5, quotientValue6 * fragmentVectorConstants1.packedValues[2u].z));
                vec3 vectorValue1 = vec3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17);
                float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
                float sumValue9 = fragmentScalarConstants1.packedValues[87u] - fragmentScalarConstants1.packedValues[84u];
                float multiplyAddValue18 = fma(multiplyAddValue16, inverseLengthValue1, sumValue9);
                float quotientValue8 = spvNClamp(multiplyAddValue18 * (1.0 / (sumValue9 + (fragmentScalarConstants1.packedValues[86u] - fragmentScalarConstants1.packedValues[87u]))), 0.0, 1.0);
                float multiplyAddValue19 = fma(-fma(quotientValue8, -2.0, 3.0), quotientValue8 * quotientValue8, 1.0);
                float productValue51 = multiplyAddValue19 * (multiplyAddValue19 * multiplyAddValue19);
                vec3 productValue52 = vec3(inverseLengthValue1 * multiplyAddValue15, inverseLengthValue1 * multiplyAddValue16, inverseLengthValue1 * multiplyAddValue17);
                float scalarValue20 = rdDot3Precise2(productValue52, vec3(fragmentVectorConstants1.packedValues[0u].xyz));
                float scalarValue21 = rdDot3Precise2(productValue52, vec3(fragmentVectorConstants1.packedValues[16u].xyz));
                float quotientValue9 = spvNClamp(multiplyAddValue18 * (1.0 / (sumValue9 + fragmentScalarConstants1.packedValues[85u])), 0.0, 1.0);
                float multiplyAddValue20 = fma(-fma(quotientValue9, -2.0, 3.0), quotientValue9 * quotientValue9, 1.0);
                float productValue53 = multiplyAddValue20 * (multiplyAddValue20 * multiplyAddValue20);
                float multiplyAddValue21 = fma(fma(scalarValue20, scalarValue20, 1.0) * fragmentScalarConstants1.packedValues[115u], 0.75, (fma(scalarValue21, scalarValue21, 1.0) * fragmentScalarConstants1.packedValues[91u]) * 0.75);
                float exponentialValue8 = spvNMin(exp2(log2(spvNMax(scalarValue21, 0.0)) * fragmentScalarConstants1.packedValues[51u]), 1.0);
                float exponentialValue9 = spvNMin(exp2(log2(spvNMax(scalarValue20, 0.0)) * fragmentScalarConstants1.packedValues[51u]), 1.0);
                float multiplyAddValue22 = fma(-exponentialValue9, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue4 = 0.0361000001430511474609375 / (multiplyAddValue22 * sqrt(multiplyAddValue22));
                float multiplyAddValue23 = fma(-exponentialValue8, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue5 = 0.0361000001430511474609375 / (multiplyAddValue23 * sqrt(multiplyAddValue23));
                float multiplyAddValue24 = fma((fma(productValue53, fragmentVectorConstants1.packedValues[25u].x - fragmentVectorConstants1.packedValues[27u].x, fragmentVectorConstants1.packedValues[27u].x) * fragmentScalarConstants1.packedValues[48u]) * 0.079577468335628509521484375, multiplyAddValue21, ((productValue51 * fragmentVectorConstants1.packedValues[25u].x) * 0.079577468335628509521484375) * fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[28u].x * fragmentScalarConstants1.packedValues[115u]) * fragmentScalarConstants1.packedValues[49u]), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[22u].x * fragmentScalarConstants1.packedValues[91u]) * fragmentScalarConstants1.packedValues[50u]))));
                float multiplyAddValue25 = fma((fma(productValue53, fragmentVectorConstants1.packedValues[25u].y - fragmentVectorConstants1.packedValues[27u].y, fragmentVectorConstants1.packedValues[27u].y) * fragmentScalarConstants1.packedValues[48u]) * 0.079577468335628509521484375, multiplyAddValue21, ((productValue51 * fragmentVectorConstants1.packedValues[25u].y) * 0.079577468335628509521484375) * fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[28u].y * fragmentScalarConstants1.packedValues[115u]) * fragmentScalarConstants1.packedValues[49u]), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[22u].y * fragmentScalarConstants1.packedValues[91u]) * fragmentScalarConstants1.packedValues[50u]))));
                float multiplyAddValue26 = fma((fma(productValue53, fragmentVectorConstants1.packedValues[25u].z - fragmentVectorConstants1.packedValues[27u].z, fragmentVectorConstants1.packedValues[27u].z) * fragmentScalarConstants1.packedValues[48u]) * 0.079577468335628509521484375, multiplyAddValue21, ((productValue51 * fragmentVectorConstants1.packedValues[25u].z) * 0.079577468335628509521484375) * fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[28u].z * fragmentScalarConstants1.packedValues[115u]) * fragmentScalarConstants1.packedValues[49u]), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[22u].z * fragmentScalarConstants1.packedValues[91u]) * fragmentScalarConstants1.packedValues[50u]))));
                bool comparisonValue4 = fragmentScalarConstants1.packedValues[55u] != 0.0;
                float comparisonValue5 = spvNMax((scalarValue10 == 1.0) ? sampledTextureValue4 : (rdEvaluateFloatExpression(sampledTextureValue14.w & 255u) * 0.0039215688593685626983642578125), fragmentScalarConstants1.packedValues[61u]);
                multiplyAddValue4 = comparisonValue4 ? fma(comparisonValue5, multiplyAddValue24 - fragmentVectorConstants1.packedValues[29u].x, fragmentVectorConstants1.packedValues[29u].x) : multiplyAddValue24;
                multiplyAddValue5 = comparisonValue4 ? fma(comparisonValue5, multiplyAddValue25 - fragmentVectorConstants1.packedValues[29u].y, fragmentVectorConstants1.packedValues[29u].y) : multiplyAddValue25;
                multiplyAddValue6 = comparisonValue4 ? fma(comparisonValue5, multiplyAddValue26 - fragmentVectorConstants1.packedValues[29u].z, fragmentVectorConstants1.packedValues[29u].z) : multiplyAddValue26;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                float multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[3u].x, quotientValue7, fma(fragmentVectorConstants1.packedValues[1u].x, quotientValue5, quotientValue6 * fragmentVectorConstants1.packedValues[2u].x));
                float multiplyAddValue16 = fma(fragmentVectorConstants1.packedValues[3u].y, quotientValue7, fma(fragmentVectorConstants1.packedValues[1u].y, quotientValue5, quotientValue6 * fragmentVectorConstants1.packedValues[2u].y));
                float multiplyAddValue17 = fma(fragmentVectorConstants1.packedValues[3u].z, quotientValue7, fma(fragmentVectorConstants1.packedValues[1u].z, quotientValue5, quotientValue6 * fragmentVectorConstants1.packedValues[2u].z));
                vec3 vectorValue1 = vec3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17);
                float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
                float sumValue51 = fragmentScalarConstants1.packedValues[91u] - fragmentScalarConstants1.packedValues[88u];
                float multiplyAddValue78 = fma(multiplyAddValue16, inverseLengthValue1, sumValue51);
                float quotientValue24 = spvNClamp(multiplyAddValue78 * (1.0 / (sumValue51 + (fragmentScalarConstants1.packedValues[90u] - fragmentScalarConstants1.packedValues[91u]))), 0.0, 1.0);
                float multiplyAddValue79 = fma(-fma(quotientValue24, -2.0, 3.0), quotientValue24 * quotientValue24, 1.0);
                float productValue112 = multiplyAddValue79 * (multiplyAddValue79 * multiplyAddValue79);
                vec3 productValue52 = vec3(inverseLengthValue1 * multiplyAddValue15, inverseLengthValue1 * multiplyAddValue16, inverseLengthValue1 * multiplyAddValue17);
                float scalarValue20 = rdDot3Precise2(productValue52, vec3(fragmentVectorConstants1.packedValues[0u].xyz));
                float scalarValue21 = rdDot3Precise2(productValue52, vec3(fragmentVectorConstants1.packedValues[16u].xyz));
                float quotientValue25 = spvNClamp(multiplyAddValue78 * (1.0 / (sumValue51 + fragmentScalarConstants1.packedValues[89u])), 0.0, 1.0);
                float multiplyAddValue80 = fma(-fma(quotientValue25, -2.0, 3.0), quotientValue25 * quotientValue25, 1.0);
                float productValue113 = multiplyAddValue80 * (multiplyAddValue80 * multiplyAddValue80);
                float multiplyAddValue81 = fma(fma(scalarValue20, scalarValue20, 1.0) * fragmentScalarConstants1.packedValues[123u], 0.75, (fma(scalarValue21, scalarValue21, 1.0) * fragmentScalarConstants1.packedValues[99u]) * 0.75);
                float exponentialValue8 = spvNMin(exp2(log2(spvNMax(scalarValue21, 0.0)) * fragmentScalarConstants1.packedValues[51u]), 1.0);
                float exponentialValue9 = spvNMin(exp2(log2(spvNMax(scalarValue20, 0.0)) * fragmentScalarConstants1.packedValues[51u]), 1.0);
                float multiplyAddValue22 = fma(-exponentialValue9, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue4 = 0.0361000001430511474609375 / (multiplyAddValue22 * sqrt(multiplyAddValue22));
                float multiplyAddValue23 = fma(-exponentialValue8, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue5 = 0.0361000001430511474609375 / (multiplyAddValue23 * sqrt(multiplyAddValue23));
                float multiplyAddValue82 = fma((fma(productValue113, fragmentVectorConstants1.packedValues[27u].x - fragmentVectorConstants1.packedValues[29u].x, fragmentVectorConstants1.packedValues[29u].x) * fragmentScalarConstants1.packedValues[48u]) * 0.079577468335628509521484375, multiplyAddValue81, ((productValue112 * fragmentVectorConstants1.packedValues[27u].x) * 0.079577468335628509521484375) * fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[30u].x * fragmentScalarConstants1.packedValues[123u]) * fragmentScalarConstants1.packedValues[49u]), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[24u].x * fragmentScalarConstants1.packedValues[99u]) * fragmentScalarConstants1.packedValues[50u]))));
                float multiplyAddValue83 = fma((fma(productValue113, fragmentVectorConstants1.packedValues[27u].y - fragmentVectorConstants1.packedValues[29u].y, fragmentVectorConstants1.packedValues[29u].y) * fragmentScalarConstants1.packedValues[48u]) * 0.079577468335628509521484375, multiplyAddValue81, ((productValue112 * fragmentVectorConstants1.packedValues[27u].y) * 0.079577468335628509521484375) * fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[30u].y * fragmentScalarConstants1.packedValues[123u]) * fragmentScalarConstants1.packedValues[49u]), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[24u].y * fragmentScalarConstants1.packedValues[99u]) * fragmentScalarConstants1.packedValues[50u]))));
                float multiplyAddValue84 = fma((fma(productValue113, fragmentVectorConstants1.packedValues[27u].z - fragmentVectorConstants1.packedValues[29u].z, fragmentVectorConstants1.packedValues[29u].z) * fragmentScalarConstants1.packedValues[48u]) * 0.079577468335628509521484375, multiplyAddValue81, ((productValue112 * fragmentVectorConstants1.packedValues[27u].z) * 0.079577468335628509521484375) * fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[30u].z * fragmentScalarConstants1.packedValues[123u]) * fragmentScalarConstants1.packedValues[49u]), nonlinearValue4, nonlinearValue5 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[24u].z * fragmentScalarConstants1.packedValues[99u]) * fragmentScalarConstants1.packedValues[50u]))));
                bool comparisonValue4 = fragmentScalarConstants1.packedValues[55u] != 0.0;
                float comparisonValue5 = spvNMax((scalarValue10 == 1.0) ? sampledTextureValue4 : (rdEvaluateFloatExpression(sampledTextureValue14.w & 255u) * 0.0039215688593685626983642578125), fragmentScalarConstants1.packedValues[61u]);
                multiplyAddValue38 = comparisonValue4 ? fma(comparisonValue5, multiplyAddValue82 - fragmentVectorConstants1.packedValues[31u].x, fragmentVectorConstants1.packedValues[31u].x) : multiplyAddValue82;
                multiplyAddValue39 = comparisonValue4 ? fma(comparisonValue5, multiplyAddValue83 - fragmentVectorConstants1.packedValues[31u].y, fragmentVectorConstants1.packedValues[31u].y) : multiplyAddValue83;
                multiplyAddValue40 = comparisonValue4 ? fma(comparisonValue5, multiplyAddValue84 - fragmentVectorConstants1.packedValues[31u].z, fragmentVectorConstants1.packedValues[31u].z) : multiplyAddValue84;
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float quotientValue3 = spvNClamp(((productValue14 - fragmentVectorConstants1.packedValues[21u].x) + fragmentVectorConstants1.packedValues[21u].w) / (fragmentVectorConstants1.packedValues[21u].z - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
                float productValue16 = 1.0 - ((quotientValue3 * quotientValue3) * (3.0 - (quotientValue3 * 2.0)));
                float productValue17 = (productValue16 * productValue16) * productValue16;
                float dotProductValue1 = dot(vec3(productValue13, productValue14, productValue15), vec3(fragmentVectorConstants1.packedValues[0u].xyz));
                float dotProductValue2 = dot(vec3(productValue13, productValue14, productValue15), vec3(fragmentVectorConstants1.packedValues[16u].xyz));
                float sumValue3 = fragmentVectorConstants1.packedValues[21u].x - fragmentVectorConstants1.packedValues[21u].w;
                float quotientValue4 = spvNClamp((productValue14 - sumValue3) / (fragmentVectorConstants1.packedValues[21u].y - sumValue3), 0.0, 1.0);
                float productValue22 = 1.0 - ((quotientValue4 * quotientValue4) * (3.0 - (quotientValue4 * 2.0)));
                float productValue23 = (productValue22 * productValue22) * productValue22;
                float productValue24 = (fragmentVectorConstants1.packedValues[12u].x * 0.75) * ((((dotProductValue2 * dotProductValue2) + 1.0) * fragmentVectorConstants1.packedValues[22u].w) + (((dotProductValue1 * dotProductValue1) + 1.0) * fragmentVectorConstants1.packedValues[28u].w));
                float exponentialValue3 = spvNClamp(exp2(log2(spvNMax(dotProductValue1, 0.0)) * fragmentVectorConstants1.packedValues[12u].w), 0.0, 1.0);
                float exponentialValue4 = spvNClamp(exp2(log2(spvNMax(dotProductValue2, 0.0)) * fragmentVectorConstants1.packedValues[12u].w), 0.0, 1.0);
                float productValue25 = 1.809999942779541015625 - (exponentialValue3 * 1.7999999523162841796875);
                float nonlinearValue1 = 0.036100022494792938232421875 / (sqrt(productValue25) * productValue25);
                float productValue26 = 1.809999942779541015625 - (exponentialValue4 * 1.7999999523162841796875);
                float nonlinearValue2 = 0.036100022494792938232421875 / (sqrt(productValue26) * productValue26);
                float productValue27 = exponentialValue3 * (fragmentVectorConstants1.packedValues[12u].y * fragmentVectorConstants1.packedValues[28u].w);
                float productValue28 = exponentialValue4 * (fragmentVectorConstants1.packedValues[12u].z * fragmentVectorConstants1.packedValues[22u].w);
                float productValue29 = (((productValue17 * fragmentVectorConstants1.packedValues[25u].x) * (((productValue28 * fragmentVectorConstants1.packedValues[22u].x) * nonlinearValue2) + ((productValue27 * fragmentVectorConstants1.packedValues[28u].x) * nonlinearValue1))) + (((productValue23 * (fragmentVectorConstants1.packedValues[25u].x - fragmentVectorConstants1.packedValues[27u].x)) + fragmentVectorConstants1.packedValues[27u].x) * productValue24)) * 0.079577468335628509521484375;
                float productValue30 = (((productValue17 * fragmentVectorConstants1.packedValues[25u].y) * (((productValue28 * fragmentVectorConstants1.packedValues[22u].y) * nonlinearValue2) + ((productValue27 * fragmentVectorConstants1.packedValues[28u].y) * nonlinearValue1))) + (((productValue23 * (fragmentVectorConstants1.packedValues[25u].y - fragmentVectorConstants1.packedValues[27u].y)) + fragmentVectorConstants1.packedValues[27u].y) * productValue24)) * 0.079577468335628509521484375;
                float productValue31 = (((productValue17 * fragmentVectorConstants1.packedValues[25u].z) * (((productValue28 * fragmentVectorConstants1.packedValues[22u].z) * nonlinearValue2) + ((productValue27 * fragmentVectorConstants1.packedValues[28u].z) * nonlinearValue1))) + (((productValue23 * (fragmentVectorConstants1.packedValues[25u].z - fragmentVectorConstants1.packedValues[27u].z)) + fragmentVectorConstants1.packedValues[27u].z) * productValue24)) * 0.079577468335628509521484375;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                if (fragmentVectorConstants1.packedValues[13u].w != 0.0)
                {
                    float comparisonValue1 = spvNMax(fragmentVectorConstants1.packedValues[15u].y, (scalarValue == 1.0) ? sampledTextureValue4 : (float(sampledTextureValue3.w & 255u) * 0.0039215688593685626983642578125));
                    branchMergedValue8 = nonlinearValue;
                    branchMergedValue9 = ((productValue29 - fragmentVectorConstants1.packedValues[29u].x) * comparisonValue1) + fragmentVectorConstants1.packedValues[29u].x;
                    branchMergedValue10 = ((productValue30 - fragmentVectorConstants1.packedValues[29u].y) * comparisonValue1) + fragmentVectorConstants1.packedValues[29u].y;
                    branchMergedValue11 = ((productValue31 - fragmentVectorConstants1.packedValues[29u].z) * comparisonValue1) + fragmentVectorConstants1.packedValues[29u].z;
                }
                else
                {
                    branchMergedValue8 = nonlinearValue;
                    branchMergedValue9 = productValue29;
                    branchMergedValue10 = productValue30;
                    branchMergedValue11 = productValue31;
                }
                branchMergedValue4 = branchMergedValue8;
                branchMergedValue5 = branchMergedValue9;
                branchMergedValue6 = branchMergedValue10;
                branchMergedValue7 = branchMergedValue11;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                float quotientValue18 = spvNClamp(((productValue14 - fragmentVectorConstants1.packedValues[22u].x) + fragmentVectorConstants1.packedValues[22u].w) / (fragmentVectorConstants1.packedValues[22u].z - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
                float productValue96 = 1.0 - ((quotientValue18 * quotientValue18) * (3.0 - (quotientValue18 * 2.0)));
                float productValue97 = (productValue96 * productValue96) * productValue96;
                float dotProductValue1 = dot(vec3(productValue13, productValue14, productValue15), vec3(fragmentVectorConstants1.packedValues[0u].xyz));
                float dotProductValue2 = dot(vec3(productValue13, productValue14, productValue15), vec3(fragmentVectorConstants1.packedValues[16u].xyz));
                float sumValue30 = fragmentVectorConstants1.packedValues[22u].x - fragmentVectorConstants1.packedValues[22u].w;
                float quotientValue19 = spvNClamp((productValue14 - sumValue30) / (fragmentVectorConstants1.packedValues[22u].y - sumValue30), 0.0, 1.0);
                float productValue98 = 1.0 - ((quotientValue19 * quotientValue19) * (3.0 - (quotientValue19 * 2.0)));
                float productValue99 = (productValue98 * productValue98) * productValue98;
                float productValue100 = (fragmentVectorConstants1.packedValues[12u].x * 0.75) * ((((dotProductValue2 * dotProductValue2) + 1.0) * fragmentVectorConstants1.packedValues[24u].w) + (((dotProductValue1 * dotProductValue1) + 1.0) * fragmentVectorConstants1.packedValues[30u].w));
                float exponentialValue3 = spvNClamp(exp2(log2(spvNMax(dotProductValue1, 0.0)) * fragmentVectorConstants1.packedValues[12u].w), 0.0, 1.0);
                float exponentialValue4 = spvNClamp(exp2(log2(spvNMax(dotProductValue2, 0.0)) * fragmentVectorConstants1.packedValues[12u].w), 0.0, 1.0);
                float productValue25 = 1.809999942779541015625 - (exponentialValue3 * 1.7999999523162841796875);
                float nonlinearValue1 = 0.036100022494792938232421875 / (sqrt(productValue25) * productValue25);
                float productValue26 = 1.809999942779541015625 - (exponentialValue4 * 1.7999999523162841796875);
                float nonlinearValue2 = 0.036100022494792938232421875 / (sqrt(productValue26) * productValue26);
                float productValue101 = exponentialValue3 * (fragmentVectorConstants1.packedValues[12u].y * fragmentVectorConstants1.packedValues[30u].w);
                float productValue102 = exponentialValue4 * (fragmentVectorConstants1.packedValues[12u].z * fragmentVectorConstants1.packedValues[24u].w);
                float productValue103 = (((productValue97 * fragmentVectorConstants1.packedValues[27u].x) * (((productValue102 * fragmentVectorConstants1.packedValues[24u].x) * nonlinearValue2) + ((productValue101 * fragmentVectorConstants1.packedValues[30u].x) * nonlinearValue1))) + (((productValue99 * (fragmentVectorConstants1.packedValues[27u].x - fragmentVectorConstants1.packedValues[29u].x)) + fragmentVectorConstants1.packedValues[29u].x) * productValue100)) * 0.079577468335628509521484375;
                float productValue104 = (((productValue97 * fragmentVectorConstants1.packedValues[27u].y) * (((productValue102 * fragmentVectorConstants1.packedValues[24u].y) * nonlinearValue2) + ((productValue101 * fragmentVectorConstants1.packedValues[30u].y) * nonlinearValue1))) + (((productValue99 * (fragmentVectorConstants1.packedValues[27u].y - fragmentVectorConstants1.packedValues[29u].y)) + fragmentVectorConstants1.packedValues[29u].y) * productValue100)) * 0.079577468335628509521484375;
                float productValue105 = (((productValue97 * fragmentVectorConstants1.packedValues[27u].z) * (((productValue102 * fragmentVectorConstants1.packedValues[24u].z) * nonlinearValue2) + ((productValue101 * fragmentVectorConstants1.packedValues[30u].z) * nonlinearValue1))) + (((productValue99 * (fragmentVectorConstants1.packedValues[27u].z - fragmentVectorConstants1.packedValues[29u].z)) + fragmentVectorConstants1.packedValues[29u].z) * productValue100)) * 0.079577468335628509521484375;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                if (fragmentVectorConstants1.packedValues[13u].w != 0.0)
                {
                    float comparisonValue21 = spvNMax(fragmentVectorConstants1.packedValues[15u].y, (scalarValue == 1.0) ? sampledTextureValue5 : (float(sampledTextureValue3.w & 255u) * 0.0039215688593685626983642578125));
                    branchMergedValue8 = nonlinearValue6;
                    branchMergedValue9 = ((productValue103 - fragmentVectorConstants1.packedValues[31u].x) * comparisonValue21) + fragmentVectorConstants1.packedValues[31u].x;
                    branchMergedValue10 = ((productValue104 - fragmentVectorConstants1.packedValues[31u].y) * comparisonValue21) + fragmentVectorConstants1.packedValues[31u].y;
                    branchMergedValue11 = ((productValue105 - fragmentVectorConstants1.packedValues[31u].z) * comparisonValue21) + fragmentVectorConstants1.packedValues[31u].z;
                }
                else
                {
                    branchMergedValue8 = nonlinearValue6;
                    branchMergedValue9 = productValue103;
                    branchMergedValue10 = productValue104;
                    branchMergedValue11 = productValue105;
                }
                branchMergedValue4 = branchMergedValue8;
                branchMergedValue5 = branchMergedValue9;
                branchMergedValue6 = branchMergedValue10;
                branchMergedValue7 = branchMergedValue11;
#endif
            }
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue41 = multiplyAddValue4;
            intermediateValue39 = multiplyAddValue5;
            intermediateValue37 = multiplyAddValue6;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue61 = multiplyAddValue38;
            intermediateValue59 = multiplyAddValue39;
            intermediateValue57 = multiplyAddValue40;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = branchMergedValue4;
            branchMergedValue1 = branchMergedValue5;
            branchMergedValue2 = branchMergedValue6;
            branchMergedValue3 = branchMergedValue7;
#endif
        }
        else
        {
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue41 = 0.0;
            intermediateValue39 = 0.0;
            intermediateValue37 = 0.0;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue61 = 0.0;
            intermediateValue59 = 0.0;
            intermediateValue57 = 0.0;
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            branchMergedValue = nonlinearValue;
            branchMergedValue1 = 0.0;
            branchMergedValue2 = 0.0;
            branchMergedValue3 = 0.0;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            branchMergedValue = nonlinearValue6;
            branchMergedValue1 = 0.0;
            branchMergedValue2 = 0.0;
            branchMergedValue3 = 0.0;
#endif
        }
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue35 = nonlinearValue3;
        intermediateValue36 = intermediateValue37;
        intermediateValue38 = intermediateValue39;
        intermediateValue40 = intermediateValue41;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue55 = nonlinearValue7;
        intermediateValue56 = intermediateValue57;
        intermediateValue58 = intermediateValue59;
        intermediateValue60 = intermediateValue61;
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue7 = branchMergedValue;
        intermediateValue8 = branchMergedValue1;
        intermediateValue9 = branchMergedValue2;
        intermediateValue10 = branchMergedValue3;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue16 = branchMergedValue;
        intermediateValue17 = branchMergedValue1;
        intermediateValue18 = branchMergedValue2;
        intermediateValue19 = branchMergedValue3;
#endif
    }
    else
    {
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue35 = 0.0;
        intermediateValue36 = 0.0;
        intermediateValue38 = 0.0;
        intermediateValue40 = 0.0;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue55 = 0.0;
        intermediateValue56 = 0.0;
        intermediateValue58 = 0.0;
        intermediateValue60 = 0.0;
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue7 = 0.0;
        intermediateValue8 = 0.0;
        intermediateValue9 = 0.0;
        intermediateValue10 = 0.0;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue16 = 0.0;
        intermediateValue17 = 0.0;
        intermediateValue18 = 0.0;
        intermediateValue19 = 0.0;
#endif
    }
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue10;
    float multiplyAddValue11;
    float multiplyAddValue12;
    float multiplyAddValue13;
    if (fragmentScalarConstants1.packedValues[128u] != 0.0)
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue44;
    float multiplyAddValue45;
    float multiplyAddValue46;
    float multiplyAddValue47;
    if (fragmentScalarConstants1.packedValues[136u] != 0.0)
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue18;
    float productValue19;
    float productValue20;
    float productValue21;
    if (fragmentVectorConstants1.packedValues[32u].x != 0.0)
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue56;
    float productValue57;
    float productValue58;
    float productValue59;
    if (fragmentVectorConstants1.packedValues[34u].x != 0.0)
#endif
    {
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue27 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[7u].z, scalarValue10, fma(fragmentVectorConstants1.packedValues[5u].z, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[6u].z)) + fragmentVectorConstants1.packedValues[8u].z)) / (fma(fragmentVectorConstants1.packedValues[7u].w, scalarValue10, fma(fragmentVectorConstants1.packedValues[5u].w, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[8u].w)) - fragmentScalarConstants1.packedValues[124u]) / (fragmentScalarConstants1.packedValues[125u] - fragmentScalarConstants1.packedValues[124u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[122u]), -0.5);
        uint sumValue10 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[122u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue27))), int(0u))))));
        float scalarValue22 = rdSignedBitsToFloat(sumValue10);
        float sumValue11 = spvNClamp(multiplyAddValue27 - scalarValue22, 0.0, 1.0);
        float multiplyAddValue37 = fma(varyingColor1.x, 0.5, 0.5);
        float multiplyAddValue41 = fma(varyingColor1.y, 0.5, 0.5);
        vec4 sampledTextureValue18 = textureLod(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue37, multiplyAddValue41, scalarValue22), 0.0);
        float scalarValue23 = sampledTextureValue18.x;
        float scalarValue24 = sampledTextureValue18.y;
        float scalarValue25 = sampledTextureValue18.z;
        float scalarValue26 = sampledTextureValue18.w;
        vec4 sampledTextureValue19 = textureLod(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue37, multiplyAddValue41, rdSignedBitsToFloat(sumValue10 + 1u)), 0.0);
        multiplyAddValue10 = fma(sumValue11, sampledTextureValue19.z - scalarValue25, scalarValue25);
        multiplyAddValue11 = fma(sumValue11, sampledTextureValue19.y - scalarValue24, scalarValue24);
        multiplyAddValue12 = fma(sumValue11, sampledTextureValue19.x - scalarValue23, scalarValue23);
        multiplyAddValue13 = fma(sumValue11, sampledTextureValue19.w - scalarValue26, scalarValue26);
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue85 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[7u].z, scalarValue10, fma(fragmentVectorConstants1.packedValues[5u].z, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[6u].z)) + fragmentVectorConstants1.packedValues[8u].z)) / (fma(fragmentVectorConstants1.packedValues[7u].w, scalarValue10, fma(fragmentVectorConstants1.packedValues[5u].w, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[8u].w)) - fragmentScalarConstants1.packedValues[132u]) / (fragmentScalarConstants1.packedValues[133u] - fragmentScalarConstants1.packedValues[132u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[130u]), -0.5);
        uint sumValue52 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[130u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue85))), int(0u))))));
        float scalarValue48 = rdSignedBitsToFloat(sumValue52);
        float sumValue53 = spvNClamp(multiplyAddValue85 - scalarValue48, 0.0, 1.0);
        float multiplyAddValue37 = fma(varyingColor1.x, 0.5, 0.5);
        float multiplyAddValue41 = fma(varyingColor1.y, 0.5, 0.5);
        vec4 sampledTextureValue41 = textureLod(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue37, multiplyAddValue41, scalarValue48), 0.0);
        float scalarValue49 = sampledTextureValue41.x;
        float scalarValue50 = sampledTextureValue41.y;
        float scalarValue51 = sampledTextureValue41.z;
        float scalarValue52 = sampledTextureValue41.w;
        vec4 sampledTextureValue42 = textureLod(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue37, multiplyAddValue41, rdSignedBitsToFloat(sumValue52 + 1u)), 0.0);
        multiplyAddValue44 = fma(sumValue53, sampledTextureValue42.z - scalarValue51, scalarValue51);
        multiplyAddValue45 = fma(sumValue53, sampledTextureValue42.y - scalarValue50, scalarValue50);
        multiplyAddValue46 = fma(sumValue53, sampledTextureValue42.x - scalarValue49, scalarValue49);
        multiplyAddValue47 = fma(sumValue53, sampledTextureValue42.w - scalarValue52, scalarValue52);
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float productValue32 = (varyingColor1.x + 1.0) * 0.5;
        float productValue33 = (varyingColor1.y + 1.0) * 0.5;
        uint scalarValue4 = uint(int(fragmentVectorConstants1.packedValues[30u].z));
        float multiplyAddValue9 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[8u].z + fma(fragmentVectorConstants1.packedValues[7u].z, scalarValue, fma(fragmentVectorConstants1.packedValues[6u].z, varyingColor1.y, fragmentVectorConstants1.packedValues[5u].z * varyingColor1.x)))) / (fma(fragmentVectorConstants1.packedValues[7u].w, scalarValue, fma(fragmentVectorConstants1.packedValues[6u].w, varyingColor1.y, fragmentVectorConstants1.packedValues[5u].w * varyingColor1.x)) + fragmentVectorConstants1.packedValues[8u].w)) - fragmentVectorConstants1.packedValues[31u].x) / (fragmentVectorConstants1.packedValues[31u].y - fragmentVectorConstants1.packedValues[31u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue4))) + (-0.5);
        uint sumValue4 = uint(min(int(uint(max(int(uint(int(multiplyAddValue9))), int(0u)))), int(scalarValue4 + 4294967294u)));
        float scalarValue5 = float(int(sumValue4));
        float sumValue5 = spvNMin(spvNMax(multiplyAddValue9 - scalarValue5, 0.0), 1.0);
        vec4 sampledTextureValue8 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue32, productValue33, scalarValue5), 0.0);
        float scalarValue6 = sampledTextureValue8.x;
        float scalarValue7 = sampledTextureValue8.y;
        float scalarValue8 = sampledTextureValue8.z;
        float scalarValue9 = sampledTextureValue8.w;
        vec4 sampledTextureValue9 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue32, productValue33, float(int(sumValue4 + 1u))), 0.0);
        productValue18 = ((sampledTextureValue9.x - scalarValue6) * sumValue5) + scalarValue6;
        productValue19 = ((sampledTextureValue9.y - scalarValue7) * sumValue5) + scalarValue7;
        productValue20 = ((sampledTextureValue9.z - scalarValue8) * sumValue5) + scalarValue8;
        productValue21 = ((sampledTextureValue9.w - scalarValue9) * sumValue5) + scalarValue9;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float productValue32 = (varyingColor1.x + 1.0) * 0.5;
        float productValue33 = (varyingColor1.y + 1.0) * 0.5;
        uint scalarValue34 = uint(int(fragmentVectorConstants1.packedValues[32u].z));
        float multiplyAddValue49 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[8u].z + fma(fragmentVectorConstants1.packedValues[7u].z, scalarValue, fma(fragmentVectorConstants1.packedValues[6u].z, varyingColor1.y, fragmentVectorConstants1.packedValues[5u].z * varyingColor1.x)))) / (fma(fragmentVectorConstants1.packedValues[7u].w, scalarValue, fma(fragmentVectorConstants1.packedValues[6u].w, varyingColor1.y, fragmentVectorConstants1.packedValues[5u].w * varyingColor1.x)) + fragmentVectorConstants1.packedValues[8u].w)) - fragmentVectorConstants1.packedValues[33u].x) / (fragmentVectorConstants1.packedValues[33u].y - fragmentVectorConstants1.packedValues[33u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue34))) + (-0.5);
        uint sumValue31 = uint(min(int(uint(max(int(uint(int(multiplyAddValue49))), int(0u)))), int(scalarValue34 + 4294967294u)));
        float scalarValue35 = float(int(sumValue31));
        float sumValue32 = spvNMin(spvNMax(multiplyAddValue49 - scalarValue35, 0.0), 1.0);
        vec4 sampledTextureValue30 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue32, productValue33, scalarValue35), 0.0);
        float scalarValue36 = sampledTextureValue30.x;
        float scalarValue37 = sampledTextureValue30.y;
        float scalarValue38 = sampledTextureValue30.z;
        float scalarValue39 = sampledTextureValue30.w;
        vec4 sampledTextureValue31 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue32, productValue33, float(int(sumValue31 + 1u))), 0.0);
        productValue56 = ((sampledTextureValue31.x - scalarValue36) * sumValue32) + scalarValue36;
        productValue57 = ((sampledTextureValue31.y - scalarValue37) * sumValue32) + scalarValue37;
        productValue58 = ((sampledTextureValue31.z - scalarValue38) * sumValue32) + scalarValue38;
        productValue59 = ((sampledTextureValue31.w - scalarValue39) * sumValue32) + scalarValue39;
#endif
    }
    else
    {
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        multiplyAddValue10 = 0.0;
        multiplyAddValue11 = 0.0;
        multiplyAddValue12 = 0.0;
        multiplyAddValue13 = 1.0;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        multiplyAddValue44 = 0.0;
        multiplyAddValue45 = 0.0;
        multiplyAddValue46 = 0.0;
        multiplyAddValue47 = 1.0;
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue18 = 0.0;
        productValue19 = 0.0;
        productValue20 = 0.0;
        productValue21 = 1.0;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue56 = 0.0;
        productValue57 = 0.0;
        productValue58 = 0.0;
        productValue59 = 1.0;
#endif
    }
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue42 = fma(multiplyAddValue13, fma(intermediateValue35, intermediateValue40 - sumValue6, sumValue6), multiplyAddValue12);
    float multiplyAddValue43 = fma(multiplyAddValue13, fma(intermediateValue35, intermediateValue38 - sumValue7, sumValue7), multiplyAddValue11);
    float multiplyAddValue48 = fma(multiplyAddValue13, fma(intermediateValue35, intermediateValue36 - sumValue8, sumValue8), multiplyAddValue10);
    float productValue7;
    float productValue8;
    float productValue9;
    if (fragmentScalarConstants1.packedValues[72u] > 0.0)
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue86 = fma(multiplyAddValue47, fma(intermediateValue55, intermediateValue60 - sumValue48, sumValue48), multiplyAddValue46);
    float multiplyAddValue87 = fma(multiplyAddValue47, fma(intermediateValue55, intermediateValue58 - sumValue49, sumValue49), multiplyAddValue45);
    float multiplyAddValue88 = fma(multiplyAddValue47, fma(intermediateValue55, intermediateValue56 - sumValue50, sumValue50), multiplyAddValue44);
    float productValue7;
    float productValue8;
    float productValue9;
    if (fragmentScalarConstants1.packedValues[76u] > 0.0)
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue45 = (productValue21 * (((intermediateValue8 - sumValue) * intermediateValue7) + sumValue)) + productValue18;
    float productValue46 = (productValue21 * (((intermediateValue9 - sumValue1) * intermediateValue7) + sumValue1)) + productValue19;
    float productValue47 = (productValue21 * (((intermediateValue10 - sumValue2) * intermediateValue7) + sumValue2)) + productValue20;
    float productValue34;
    float productValue35;
    float productValue36;
    if (fragmentVectorConstants1.packedValues[18u].x > 0.0)
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue106 = (productValue59 * (((intermediateValue17 - sumValue27) * intermediateValue16) + sumValue27)) + productValue56;
    float productValue107 = (productValue59 * (((intermediateValue18 - sumValue28) * intermediateValue16) + sumValue28)) + productValue57;
    float productValue108 = (productValue59 * (((intermediateValue19 - sumValue29) * intermediateValue16) + sumValue29)) + productValue58;
    float productValue72;
    float productValue73;
    float productValue74;
    if (fragmentVectorConstants1.packedValues[19u].x > 0.0)
#endif
    {
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float sampledTextureValue20 = (0.180000007152557373046875 / texture(sampler2D(materialTexture6, textureSampler6), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue7 = sampledTextureValue20 * multiplyAddValue48;
        productValue8 = sampledTextureValue20 * multiplyAddValue43;
        productValue9 = sampledTextureValue20 * multiplyAddValue42;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float sampledTextureValue20 = (0.180000007152557373046875 / texture(sampler2D(materialTexture6, textureSampler6), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue7 = sampledTextureValue20 * multiplyAddValue88;
        productValue8 = sampledTextureValue20 * multiplyAddValue87;
        productValue9 = sampledTextureValue20 * multiplyAddValue86;
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue10 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue34 = sampledTextureValue10 * productValue45;
        productValue35 = sampledTextureValue10 * productValue46;
        productValue36 = sampledTextureValue10 * productValue47;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue10 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue72 = sampledTextureValue10 * productValue106;
        productValue73 = sampledTextureValue10 * productValue107;
        productValue74 = sampledTextureValue10 * productValue108;
#endif
    }
    else
    {
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue7 = multiplyAddValue48;
        productValue8 = multiplyAddValue43;
        productValue9 = multiplyAddValue42;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue7 = multiplyAddValue88;
        productValue8 = multiplyAddValue87;
        productValue9 = multiplyAddValue86;
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue34 = productValue45;
        productValue35 = productValue46;
        productValue36 = productValue47;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue72 = productValue106;
        productValue73 = productValue107;
        productValue74 = productValue108;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = productValue9;
    fragmentColor0.y = productValue8;
    fragmentColor0.z = productValue7;
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = productValue34;
    fragmentColor0.y = productValue35;
    fragmentColor0.z = productValue36;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = productValue72;
    fragmentColor0.y = productValue73;
    fragmentColor0.z = productValue74;
#endif
    fragmentColor0.w = 1.0;
}
