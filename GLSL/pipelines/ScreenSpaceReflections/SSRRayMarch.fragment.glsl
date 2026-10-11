#version 460
#extension GL_GOOGLE_include_directive : require
// ScreenSpaceReflections / SSRRayMarch / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/ScreenSpaceReflections/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue55 = varyingTexCoord0.x * fragmentVectorConstants1.packedValues[16u].x;
    precise float productValue56 = varyingTexCoord0.y * fragmentVectorConstants1.packedValues[16u].y;
    precise float sumValue26 = floor(productValue55) + 0.5;
    precise float sumValue27 = floor(productValue56) + 0.5;
    precise float productValue57 = sumValue26 * fragmentVectorConstants1.packedValues[16u].z;
    precise float productValue58 = sumValue27 * fragmentVectorConstants1.packedValues[16u].w;
    bool sampledTextureValue7 = uint(textureQueryLevels(intermediateValue2)) > 0u;
    uvec2 sampledTextureValue8 = uvec2(textureSize(intermediateValue2, int(0u)));
    uint scalarValue16 = sampledTextureValue8.x;
    precise float comparisonValue26 = productValue57 * rdEvaluateFloatExpression(sampledTextureValue7 ? scalarValue16 : 0u);
    precise float comparisonValue27 = productValue58 * rdEvaluateFloatExpression(sampledTextureValue7 ? sampledTextureValue8.y : 0u);
    precise float sampledTextureValue15 = rdEvaluateFloatExpression((texelFetch(intermediateValue2, ivec2(uvec2(uint(int(comparisonValue26)), uint(int(comparisonValue27)))), int(0u)).x >> 8u) & 255u) * 0.0039215688593685626983642578125;
    float scalarValue40 = dFdxCoarse(productValue57);
    float scalarValue41 = dFdyCoarse(productValue58);
    float scalarValue42 = dFdxCoarse(productValue58);
    float scalarValue43 = dFdyCoarse(productValue57);
    if (fragmentScalarConstants1.packedValues[16u] < sampledTextureValue15)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float productValue39 = (floor(varyingTexCoord0.x * fragmentVectorConstants1.packedValues[16u].x) + 0.5) * fragmentVectorConstants1.packedValues[16u].z;
    float productValue40 = (floor(varyingTexCoord0.y * fragmentVectorConstants1.packedValues[16u].y) + 0.5) * fragmentVectorConstants1.packedValues[16u].w;
    bool sampledTextureValue7 = uint(textureQueryLevels(intermediateValue2)) > 0u;
    uvec2 sampledTextureValue8 = uvec2(textureSize(intermediateValue2, int(0u)));
    uint scalarValue16 = sampledTextureValue8.x;
    float sampledTextureValue9 = rdEvaluateFloatExpression(bitfieldExtract(texelFetch(intermediateValue2, ivec2(uvec2(uint(int(productValue39 * rdEvaluateFloatExpression(sampledTextureValue7 ? scalarValue16 : 0u))), uint(int(productValue40 * rdEvaluateFloatExpression(sampledTextureValue7 ? sampledTextureValue8.y : 0u))))), int(0u)).x, int(8u), int(8u))) * 0.0039215688593685626983642578125;
    float scalarValue17 = dFdyCoarse(productValue40);
    float scalarValue18 = dFdxCoarse(productValue39);
    float scalarValue19 = dFdxCoarse(productValue40);
    float scalarValue20 = dFdyCoarse(productValue39);
    if (fragmentScalarConstants1.packedValues[16u] < sampledTextureValue9)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (floor(fragmentVectorConstants1.packedValues[16u].x * varyingTexCoord0.x) + 0.5) * fragmentVectorConstants1.packedValues[16u].z;
    float productValue1 = (floor(fragmentVectorConstants1.packedValues[16u].y * varyingTexCoord0.y) + 0.5) * fragmentVectorConstants1.packedValues[16u].w;
    uvec2 sampledTextureValue = uvec2(textureSize(gbufferRoughnessTexture, int(0u)));
    float sampledTextureValue1 = float((texelFetch(gbufferRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue.x)))))) * productValue)), uint(int(float(int(uint(int(float(int(sampledTextureValue.y)))))) * productValue1)))), int(0u)).x >> 8u) & 255u) * 0.0039215688593685626983642578125;
    float intermediateValue;
    float intermediateValue2;
    float intermediateValue4;
    float intermediateValue6;
    if (sampledTextureValue1 > fragmentVectorConstants1.packedValues[4u].x)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        fragmentColor0.x = 0.0;
        fragmentColor0.y = 0.0;
        fragmentColor0.z = 0.0;
        fragmentColor0.w = -1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue = 0.0;
        intermediateValue2 = 0.0;
        intermediateValue4 = 0.0;
        intermediateValue6 = -1.0;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float productValue59 = varyingTexCoord1.x * fragmentScalarConstants1.packedValues[36u];
        precise float productValue60 = varyingTexCoord1.y * fragmentScalarConstants1.packedValues[41u];
        float sampledTextureValue16 = fma(textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(productValue57, productValue58), vec2(scalarValue40, scalarValue42), vec2(scalarValue43, scalarValue41)).x, fragmentScalarConstants1.packedValues[47u], fragmentScalarConstants1.packedValues[51u]);
        precise float quotientValue14 = productValue59 / sampledTextureValue16;
        precise float quotientValue15 = productValue60 / sampledTextureValue16;
        precise float quotientValue17 = fragmentScalarConstants1.packedValues[50u] / sampledTextureValue16;
        vec4 sampledTextureValue17 = textureGrad(sampler2D(materialTexture1, textureSampler1), vec2(productValue57, productValue58), vec2(scalarValue40, scalarValue42), vec2(scalarValue43, scalarValue41));
        float scalarValue44 = sampledTextureValue17.x;
        float scalarValue45 = sampledTextureValue17.y;
        float scalarValue46 = abs(scalarValue45);
        precise float sumValue28 = 1.0 - abs(scalarValue44);
        precise float sumValue29 = 1.0 - scalarValue46;
        precise float sumValue30 = sumValue28 - scalarValue46;
        bool conditionValue8 = sumValue30 < 0.0;
        precise float comparisonValue28 = sumValue29 * ((scalarValue44 >= 0.0) ? 1.0 : (-1.0));
        precise float comparisonValue29 = sumValue28 * ((scalarValue45 >= 0.0) ? 1.0 : (-1.0));
        float comparisonValue30 = conditionValue8 ? comparisonValue28 : scalarValue44;
        float comparisonValue31 = conditionValue8 ? comparisonValue29 : scalarValue45;
        vec3 vectorValue6 = vec3(comparisonValue30, comparisonValue31, sumValue30);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
        precise float productValue61 = inverseLengthValue14 * comparisonValue30;
        precise float productValue62 = inverseLengthValue14 * comparisonValue31;
        precise float productValue63 = inverseLengthValue14 * sumValue30;
        vec3 vectorValue7 = vec3(productValue61, productValue62, productValue63);
        float scalarValue47 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[5u].xyz), vectorValue7);
        float scalarValue48 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[6u].xyz), vectorValue7);
        float scalarValue49 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[7u].xyz), vectorValue7);
        vec3 vectorValue8 = vec3(scalarValue47, scalarValue48, scalarValue49);
        float inverseLengthValue15 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
        precise float productValue64 = inverseLengthValue15 * scalarValue47;
        precise float productValue65 = inverseLengthValue15 * scalarValue48;
        precise float productValue66 = inverseLengthValue15 * scalarValue49;
        vec3 vectorValue9 = vec3(quotientValue14, quotientValue15, quotientValue17);
        float inverseLengthValue16 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
        precise float productValue67 = inverseLengthValue16 * quotientValue14;
        precise float productValue68 = inverseLengthValue16 * quotientValue15;
        precise float productValue69 = inverseLengthValue16 * quotientValue17;
        float scalarValue50 = rdDot3Precise2(vec3(productValue67, productValue68, productValue69), vec3(productValue64, productValue65, productValue66));
        precise float sumValue31 = scalarValue50 + scalarValue50;
        float scalarValue51 = -sumValue31;
        float multiplyAddValue45 = fma(productValue64, scalarValue51, productValue67);
        float multiplyAddValue46 = fma(productValue65, scalarValue51, productValue68);
        float multiplyAddValue47 = fma(productValue66, scalarValue51, productValue69);
        vec3 vectorValue10 = vec3(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47);
        float inverseLengthValue17 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
        precise float productValue70 = inverseLengthValue17 * multiplyAddValue45;
        precise float productValue71 = inverseLengthValue17 * multiplyAddValue46;
        precise float productValue72 = inverseLengthValue17 * multiplyAddValue47;
        float multiplyAddValue48 = fma(productValue64, fragmentScalarConstants1.packedValues[62u], quotientValue14);
        float multiplyAddValue49 = fma(productValue65, fragmentScalarConstants1.packedValues[62u], quotientValue15);
        float multiplyAddValue50 = fma(productValue66, fragmentScalarConstants1.packedValues[62u], quotientValue17);
        float multiplyAddValue51 = fma(multiplyAddValue45, inverseLengthValue17, multiplyAddValue48);
        float multiplyAddValue52 = fma(multiplyAddValue46, inverseLengthValue17, multiplyAddValue49);
        float multiplyAddValue53 = fma(multiplyAddValue47, inverseLengthValue17, multiplyAddValue50);
        bool conditionValue4 = fragmentScalarConstants1.packedValues[52u] < fragmentScalarConstants1.packedValues[53u];
        bool conditionValue5 = !conditionValue4;
        if (((conditionValue4 && ((fragmentVectorConstants1.packedValues[13u].x < multiplyAddValue53) && (multiplyAddValue53 < fragmentVectorConstants1.packedValues[13u].y))) || (conditionValue5 && ((fragmentVectorConstants1.packedValues[13u].y < multiplyAddValue53) && (multiplyAddValue53 < fragmentVectorConstants1.packedValues[13u].x)))) && ((((fragmentVectorConstants1.packedValues[13u].x < multiplyAddValue50) && (multiplyAddValue50 < fragmentVectorConstants1.packedValues[13u].y)) && conditionValue4) || (conditionValue5 && ((multiplyAddValue50 < fragmentVectorConstants1.packedValues[13u].x) && (fragmentVectorConstants1.packedValues[13u].y < multiplyAddValue50)))))
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue10 = fma(textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(productValue39, productValue40), vec2(scalarValue18, scalarValue19), vec2(scalarValue20, scalarValue17)).x, fragmentScalarConstants1.packedValues[47u], fragmentScalarConstants1.packedValues[51u]);
        float quotientValue8 = (varyingTexCoord1.x * fragmentScalarConstants1.packedValues[36u]) / sampledTextureValue10;
        float quotientValue9 = (varyingTexCoord1.y * fragmentScalarConstants1.packedValues[41u]) / sampledTextureValue10;
        float quotientValue10 = fragmentScalarConstants1.packedValues[50u] / sampledTextureValue10;
        vec4 sampledTextureValue11 = textureGrad(sampler2D(materialTexture1, textureSampler1), vec2(productValue39, productValue40), vec2(scalarValue18, scalarValue19), vec2(scalarValue20, scalarValue17));
        float scalarValue21 = sampledTextureValue11.x;
        float scalarValue22 = sampledTextureValue11.y;
        float scalarValue23 = abs(scalarValue22);
        float sumValue19 = 1.0 - abs(scalarValue21);
        float sumValue20 = sumValue19 - scalarValue23;
        bool conditionValue3 = sumValue20 < 0.0;
        float comparisonValue22 = conditionValue3 ? (((scalarValue21 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue23)) : scalarValue21;
        float comparisonValue23 = conditionValue3 ? (((scalarValue22 >= 0.0) ? 1.0 : (-1.0)) * sumValue19) : scalarValue22;
        vec3 vectorValue = vec3(comparisonValue22, comparisonValue23, sumValue20);
        float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
        vec3 productValue41 = vec3(inverseLengthValue8 * comparisonValue22, inverseLengthValue8 * comparisonValue23, inverseLengthValue8 * sumValue20);
        float scalarValue24 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[5u].xyz), productValue41);
        float scalarValue25 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[6u].xyz), productValue41);
        float scalarValue26 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[7u].xyz), productValue41);
        vec3 vectorValue1 = vec3(scalarValue24, scalarValue25, scalarValue26);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        float productValue42 = inverseLengthValue9 * scalarValue24;
        float productValue43 = inverseLengthValue9 * scalarValue25;
        float productValue44 = inverseLengthValue9 * scalarValue26;
        vec3 vectorValue2 = vec3(quotientValue8, quotientValue9, quotientValue10);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        float productValue45 = inverseLengthValue10 * quotientValue8;
        float productValue46 = inverseLengthValue10 * quotientValue9;
        float productValue47 = inverseLengthValue10 * quotientValue10;
        float scalarValue27 = rdDot3Precise2(vec3(productValue45, productValue46, productValue47), vec3(productValue42, productValue43, productValue44));
        float sumValue21 = -(scalarValue27 + scalarValue27);
        float multiplyAddValue14 = fma(productValue42, sumValue21, productValue45);
        float multiplyAddValue15 = fma(productValue43, sumValue21, productValue46);
        float multiplyAddValue16 = fma(productValue44, sumValue21, productValue47);
        vec3 vectorValue3 = vec3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        float productValue48 = inverseLengthValue11 * multiplyAddValue14;
        float productValue49 = inverseLengthValue11 * multiplyAddValue15;
        float productValue50 = inverseLengthValue11 * multiplyAddValue16;
        float multiplyAddValue17 = fma(productValue42, fragmentScalarConstants1.packedValues[62u], quotientValue8);
        float multiplyAddValue18 = fma(productValue43, fragmentScalarConstants1.packedValues[62u], quotientValue9);
        float multiplyAddValue21 = fma(productValue44, fragmentScalarConstants1.packedValues[62u], quotientValue10);
        float multiplyAddValue22 = fma(multiplyAddValue14, inverseLengthValue11, multiplyAddValue17);
        float multiplyAddValue23 = fma(multiplyAddValue15, inverseLengthValue11, multiplyAddValue18);
        float multiplyAddValue24 = fma(multiplyAddValue16, inverseLengthValue11, multiplyAddValue21);
        bool conditionValue4 = fragmentScalarConstants1.packedValues[52u] < fragmentScalarConstants1.packedValues[53u];
        bool conditionValue5 = !conditionValue4;
        if (((conditionValue5 && ((multiplyAddValue24 < fragmentVectorConstants1.packedValues[13u].x) && (fragmentVectorConstants1.packedValues[13u].y < multiplyAddValue24))) || (conditionValue4 && ((fragmentVectorConstants1.packedValues[13u].x < multiplyAddValue24) && (multiplyAddValue24 < fragmentVectorConstants1.packedValues[13u].y)))) && ((conditionValue4 && ((fragmentVectorConstants1.packedValues[13u].x < multiplyAddValue21) && (multiplyAddValue21 < fragmentVectorConstants1.packedValues[13u].y))) || (conditionValue5 && ((multiplyAddValue21 < fragmentVectorConstants1.packedValues[13u].x) && (fragmentVectorConstants1.packedValues[13u].y < multiplyAddValue21)))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sumValue = (-0.0) - fragmentVectorConstants1.packedValues[13u].y;
        float sumValue1 = (-0.0) - fragmentVectorConstants1.packedValues[13u].x;
        uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[15u].w));
        float sampledTextureValue2 = (texture(sampler2D(gbufferDepthTexture, gbufferDepthSampler), vec2(productValue, productValue1)).x * fragmentVectorConstants1.packedValues[11u].w) + fragmentVectorConstants1.packedValues[12u].w;
        float quotientValue = (fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord1.x) / sampledTextureValue2;
        float quotientValue1 = (fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord1.y) / sampledTextureValue2;
        float quotientValue2 = fragmentVectorConstants1.packedValues[12u].z / sampledTextureValue2;
        vec4 sampledTextureValue3 = texture(sampler2D(gbufferNormalTexture, gbufferNormalSampler), vec2(productValue, productValue1));
        float scalarValue1 = sampledTextureValue3.x;
        float scalarValue2 = sampledTextureValue3.y;
        float sumValue2 = 1.0 - abs(scalarValue1);
        float scalarValue3 = abs(scalarValue2);
        float sumValue3 = sumValue2 - scalarValue3;
        bool conditionValue = sumValue3 < 0.0;
        float comparisonValue = conditionValue ? ((1.0 - scalarValue3) * ((scalarValue1 < 0.0) ? (-1.0) : 1.0)) : scalarValue1;
        float comparisonValue1 = conditionValue ? (((scalarValue2 < 0.0) ? (-1.0) : 1.0) * sumValue2) : scalarValue2;
        float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue, comparisonValue1, sumValue3), vec3(comparisonValue, comparisonValue1, sumValue3)));
        float productValue2 = comparisonValue * inverseLengthValue;
        float productValue3 = comparisonValue1 * inverseLengthValue;
        float productValue4 = inverseLengthValue * sumValue3;
        float inverseLengthValue1 = inversesqrt(dot(vec3(productValue2, productValue3, productValue4), vec3(productValue2, productValue3, productValue4)));
        float productValue5 = inverseLengthValue1 * productValue2;
        float productValue6 = productValue3 * inverseLengthValue1;
        float productValue7 = inverseLengthValue1 * productValue4;
        float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[5u].z, productValue7, fma(fragmentVectorConstants1.packedValues[5u].y, productValue6, productValue5 * fragmentVectorConstants1.packedValues[5u].x));
        float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue7, fma(fragmentVectorConstants1.packedValues[6u].y, productValue6, productValue5 * fragmentVectorConstants1.packedValues[6u].x));
        float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[7u].z, productValue7, fma(fragmentVectorConstants1.packedValues[7u].y, productValue6, productValue5 * fragmentVectorConstants1.packedValues[7u].x));
        float inverseLengthValue2 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        float productValue8 = inverseLengthValue2 * multiplyAddValue;
        float productValue9 = inverseLengthValue2 * multiplyAddValue1;
        float productValue10 = inverseLengthValue2 * multiplyAddValue2;
        float inverseLengthValue3 = inversesqrt(dot(vec3(quotientValue, quotientValue1, quotientValue2), vec3(quotientValue, quotientValue1, quotientValue2)));
        float productValue11 = inverseLengthValue3 * quotientValue;
        float productValue12 = inverseLengthValue3 * quotientValue1;
        float productValue13 = inverseLengthValue3 * quotientValue2;
        float dotProductValue = dot(vec3(productValue11, productValue12, productValue13), vec3(productValue8, productValue9, productValue10)) * 2.0;
        float productValue14 = productValue11 - (dotProductValue * productValue8);
        float productValue15 = productValue12 - (dotProductValue * productValue9);
        float productValue16 = productValue13 - (dotProductValue * productValue10);
        float inverseLengthValue4 = inversesqrt(dot(vec3(productValue14, productValue15, productValue16), vec3(productValue14, productValue15, productValue16)));
        float productValue17 = productValue14 * inverseLengthValue4;
        float productValue18 = productValue15 * inverseLengthValue4;
        float productValue19 = productValue16 * inverseLengthValue4;
        float productValue20 = (productValue8 * fragmentVectorConstants1.packedValues[15u].z) + quotientValue;
        float productValue21 = (productValue9 * fragmentVectorConstants1.packedValues[15u].z) + quotientValue1;
        float productValue22 = (productValue10 * fragmentVectorConstants1.packedValues[15u].z) + quotientValue2;
        float sumValue5 = productValue17 + productValue20;
        float sumValue7 = productValue18 + productValue21;
        float sumValue8 = productValue19 + productValue22;
        bool conditionValue1 = fragmentVectorConstants1.packedValues[13u].x < fragmentVectorConstants1.packedValues[13u].y;
        bool bitwiseValue;
        if (conditionValue1)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue73 = multiplyAddValue49 * fragmentVectorConstants1.packedValues[1u].x;
            precise float productValue74 = multiplyAddValue49 * fragmentVectorConstants1.packedValues[1u].y;
            precise float productValue75 = multiplyAddValue49 * fragmentVectorConstants1.packedValues[1u].z;
            precise float productValue76 = multiplyAddValue49 * fragmentVectorConstants1.packedValues[1u].w;
            precise float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue50, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue48, productValue73)) + fragmentVectorConstants1.packedValues[3u].x;
            precise float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue50, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue48, productValue74)) + fragmentVectorConstants1.packedValues[3u].y;
            precise float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue50, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue48, productValue75)) + fragmentVectorConstants1.packedValues[3u].z;
            precise float multiplyAddValue57 = fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue50, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue48, productValue76)) + fragmentVectorConstants1.packedValues[3u].w;
            precise float quotientValue18 = multiplyAddValue54 / multiplyAddValue57;
            precise float quotientValue19 = multiplyAddValue55 / multiplyAddValue57;
            precise float quotientValue20 = multiplyAddValue56 / multiplyAddValue57;
            precise float sumValue32 = quotientValue18 + 1.0;
            precise float sumValue33 = quotientValue19 + 1.0;
            precise float productValue77 = fragmentScalarConstants1.packedValues[68u] * sumValue32;
            float multiplyAddValue58 = fma(-sumValue33, 0.5, 1.0);
            precise float productValue78 = productValue77 * 0.5;
            precise float productValue79 = multiplyAddValue58 * fragmentScalarConstants1.packedValues[69u];
            precise float productValue80 = quotientValue20 * 1.0;
            precise float productValue81 = multiplyAddValue52 * fragmentVectorConstants1.packedValues[1u].x;
            precise float productValue82 = multiplyAddValue52 * fragmentVectorConstants1.packedValues[1u].y;
            precise float productValue83 = multiplyAddValue52 * fragmentVectorConstants1.packedValues[1u].z;
            precise float productValue84 = multiplyAddValue52 * fragmentVectorConstants1.packedValues[1u].w;
            precise float multiplyAddValue59 = fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue53, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue51, productValue81)) + fragmentVectorConstants1.packedValues[3u].x;
            precise float multiplyAddValue60 = fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue53, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue51, productValue82)) + fragmentVectorConstants1.packedValues[3u].y;
            precise float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue53, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue51, productValue83)) + fragmentVectorConstants1.packedValues[3u].z;
            precise float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue53, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue51, productValue84)) + fragmentVectorConstants1.packedValues[3u].w;
            precise float quotientValue21 = multiplyAddValue59 / multiplyAddValue62;
            precise float quotientValue22 = multiplyAddValue60 / multiplyAddValue62;
            precise float quotientValue23 = multiplyAddValue61 / multiplyAddValue62;
            precise float sumValue34 = quotientValue21 + 1.0;
            precise float sumValue35 = quotientValue22 + 1.0;
            precise float productValue85 = fragmentScalarConstants1.packedValues[68u] * sumValue34;
            float multiplyAddValue63 = fma(productValue85, 0.5, -productValue78);
            float multiplyAddValue64 = fma(fma(-sumValue35, 0.5, 1.0), fragmentScalarConstants1.packedValues[69u], -productValue79);
            precise float productValue86 = multiplyAddValue63 * fragmentVectorConstants1.packedValues[16u].x;
            precise float productValue87 = multiplyAddValue64 * fragmentVectorConstants1.packedValues[16u].y;
            float scalarValue52 = spvNMax(abs(productValue87), abs(productValue86));
            precise float quotientValue24 = multiplyAddValue63 / scalarValue52;
            precise float quotientValue25 = multiplyAddValue64 / scalarValue52;
            precise float multiplyAddValue65 = fma(quotientValue23, 1.0, -productValue80) / scalarValue52;
            precise float productValue88 = quotientValue24 * fragmentScalarConstants1.packedValues[61u];
            precise float productValue89 = quotientValue25 * fragmentScalarConstants1.packedValues[61u];
            precise float productValue90 = multiplyAddValue65 * fragmentScalarConstants1.packedValues[61u];
            precise float quotientValue26 = productValue78 / productValue88;
            precise float quotientValue27 = productValue79 / productValue89;
            precise float quotientValue28 = productValue80 / productValue90;
            precise float multiplyAddValue66 = fma(-productValue77, 0.5, 1.0) / productValue88;
            precise float multiplyAddValue67 = fma(-multiplyAddValue58, fragmentScalarConstants1.packedValues[69u], 1.0) / productValue89;
            precise float multiplyAddValue68 = fma(-quotientValue20, 1.0, 1.0) / productValue90;
            uint comparisonValue32 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[60u]))), int(uint(int(spvNMin((productValue90 < 0.0) ? abs(quotientValue28) : multiplyAddValue68, spvNMin((productValue89 < 0.0) ? abs(quotientValue27) : multiplyAddValue67, (productValue88 < 0.0) ? abs(quotientValue26) : multiplyAddValue66)))))));
            float scalarValue28 = rdDot2Precise(vec2(fragmentScalarConstants1.packedValues[52u]), vec2(fragmentScalarConstants1.packedValues[53u]));
            precise float sumValue36 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
            float scalarValue29 = -fragmentScalarConstants1.packedValues[53u];
            precise float multiplyAddValue69 = fma(productValue80, sumValue36, scalarValue29) - fragmentScalarConstants1.packedValues[52u];
            precise float quotientValue29 = scalarValue28 / multiplyAddValue69;
            precise float sumValue37 = fragmentScalarConstants1.packedValues[52u] + quotientValue29;
            precise float quotientValue30 = (-sumValue37) / sumValue36;
            uint intermediateValue37;
            float intermediateValue38;
            float intermediateValue39;
            float intermediateValue40;
            intermediateValue37 = 4294967295u;
            intermediateValue38 = 0.0;
            intermediateValue39 = 0.0;
            intermediateValue40 = 0.0;
            uint comparisonValue7;
            float comparisonValue8;
            float comparisonValue9;
            float comparisonValue10;
            precise float quotientValue16;
            bool multiplyAddValue25;
            uint sumValue12;
            float scalarValue53 = quotientValue30;
            bool conditionValue6 = false;
            uint scalarValue31 = 1u;
            for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue21, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue17, multiplyAddValue18 * fragmentVectorConstants1.packedValues[1u].w)) + fragmentVectorConstants1.packedValues[3u].w;
            float multiplyAddValue27 = (fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue21, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue17, multiplyAddValue18 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) / multiplyAddValue26;
            float multiplyAddValue28 = fragmentScalarConstants1.packedValues[68u] * (((fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue21, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue17, multiplyAddValue18 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue26) + 1.0);
            float multiplyAddValue29 = fma(-(((fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue21, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue17, multiplyAddValue18 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue26) + 1.0), 0.5, 1.0);
            float productValue51 = multiplyAddValue28 * 0.5;
            float productValue52 = multiplyAddValue29 * fragmentScalarConstants1.packedValues[69u];
            float multiplyAddValue30 = fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].w)) + fragmentVectorConstants1.packedValues[3u].w;
            float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[68u] * (((fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue30) + 1.0), 0.5, -productValue51);
            float multiplyAddValue32 = fma(fma(-(((fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue30) + 1.0), 0.5, 1.0), fragmentScalarConstants1.packedValues[69u], -productValue52);
            float productValue53 = spvNMax(abs(multiplyAddValue32 * fragmentVectorConstants1.packedValues[16u].y), abs(multiplyAddValue31 * fragmentVectorConstants1.packedValues[16u].x));
            float quotientValue11 = (multiplyAddValue31 / productValue53) * fragmentScalarConstants1.packedValues[61u];
            float quotientValue12 = (multiplyAddValue32 / productValue53) * fragmentScalarConstants1.packedValues[61u];
            float multiplyAddValue33 = ((((fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) / multiplyAddValue30) - multiplyAddValue27) / productValue53) * fragmentScalarConstants1.packedValues[61u];
            uint multiplyAddValue34 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[60u]))), int(uint(int(spvNMin((multiplyAddValue33 < 0.0) ? abs(multiplyAddValue27 / multiplyAddValue33) : ((1.0 - multiplyAddValue27) / multiplyAddValue33), spvNMin((quotientValue12 < 0.0) ? abs(productValue52 / quotientValue12) : (fma(-multiplyAddValue29, fragmentScalarConstants1.packedValues[69u], 1.0) / quotientValue12), (quotientValue11 < 0.0) ? abs(productValue51 / quotientValue11) : (fma(-multiplyAddValue28, 0.5, 1.0) / quotientValue11))))))));
            float scalarValue28 = rdDot2Precise(vec2(fragmentScalarConstants1.packedValues[52u]), vec2(fragmentScalarConstants1.packedValues[53u]));
            float sumValue22 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
            float scalarValue29 = -fragmentScalarConstants1.packedValues[53u];
            float multiplyAddValue35 = (-(fragmentScalarConstants1.packedValues[52u] + (scalarValue28 / (fma(multiplyAddValue27, sumValue22, scalarValue29) - fragmentScalarConstants1.packedValues[52u])))) / sumValue22;
            uint intermediateValue34;
            float intermediateValue35;
            float intermediateValue36;
            float intermediateValue37;
            intermediateValue34 = 4294967295u;
            intermediateValue35 = 0.0;
            intermediateValue36 = 0.0;
            intermediateValue37 = 0.0;
            uint comparisonValue2;
            float comparisonValue3;
            float comparisonValue4;
            float comparisonValue5;
            float multiplyAddValue19;
            bool multiplyAddValue20;
            uint sumValue4;
            float scalarValue30 = multiplyAddValue35;
            bool conditionValue6 = false;
            uint scalarValue31 = 1u;
            for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            bitwiseValue = (fragmentVectorConstants1.packedValues[13u].x < sumValue8) && (sumValue8 < fragmentVectorConstants1.packedValues[13u].y);
        }
        else
        {
            bitwiseValue = (fragmentVectorConstants1.packedValues[13u].x > sumValue8) && (sumValue8 > fragmentVectorConstants1.packedValues[13u].y);
        }
        bool bitwiseValue1;
        if (conditionValue1)
        {
            bitwiseValue1 = (fragmentVectorConstants1.packedValues[13u].x < productValue22) && (productValue22 < fragmentVectorConstants1.packedValues[13u].y);
        }
        else
        {
            bitwiseValue1 = (fragmentVectorConstants1.packedValues[13u].x > productValue22) && (productValue22 > fragmentVectorConstants1.packedValues[13u].y);
        }
        float branchMergedValue6;
        float branchMergedValue7;
        float branchMergedValue8;
        float branchMergedValue9;
        if (bitwiseValue && bitwiseValue1)
        {
            float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[2u].w, productValue22, fma(fragmentVectorConstants1.packedValues[1u].w, productValue21, productValue20 * fragmentVectorConstants1.packedValues[0u].w)) + fragmentVectorConstants1.packedValues[3u].w;
            float multiplyAddValue4 = (fma(fragmentVectorConstants1.packedValues[2u].x, productValue22, fma(fragmentVectorConstants1.packedValues[1u].x, productValue21, productValue20 * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue3;
            float multiplyAddValue5 = (fma(fragmentVectorConstants1.packedValues[2u].y, productValue22, fma(fragmentVectorConstants1.packedValues[1u].y, productValue21, productValue20 * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue3;
            float multiplyAddValue6 = (fma(fragmentVectorConstants1.packedValues[2u].z, productValue22, fma(fragmentVectorConstants1.packedValues[1u].z, productValue21, productValue20 * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z) / multiplyAddValue3;
            float productValue23 = fragmentVectorConstants1.packedValues[17u].x * 0.5;
            float productValue24 = (multiplyAddValue4 + 1.0) * productValue23;
            float productValue25 = (1.0 - ((multiplyAddValue5 + 1.0) * 0.5)) * fragmentVectorConstants1.packedValues[17u].y;
            float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[2u].w, sumValue8, fma(fragmentVectorConstants1.packedValues[1u].w, sumValue7, sumValue5 * fragmentVectorConstants1.packedValues[0u].w)) + fragmentVectorConstants1.packedValues[3u].w;
            float multiplyAddValue8 = (((fma(fragmentVectorConstants1.packedValues[2u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[1u].x, sumValue7, sumValue5 * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue7) - multiplyAddValue4) * productValue23;
            float multiplyAddValue9 = (fragmentVectorConstants1.packedValues[17u].y * 0.5) * (multiplyAddValue5 - ((fma(fragmentVectorConstants1.packedValues[2u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[1u].y, sumValue7, sumValue5 * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue7));
            float productValue26 = spvNMax(abs(multiplyAddValue8 * fragmentVectorConstants1.packedValues[16u].x), abs(multiplyAddValue9 * fragmentVectorConstants1.packedValues[16u].y));
            float quotientValue3 = (multiplyAddValue8 / productValue26) * fragmentVectorConstants1.packedValues[15u].y;
            float quotientValue4 = (multiplyAddValue9 / productValue26) * fragmentVectorConstants1.packedValues[15u].y;
            float multiplyAddValue10 = ((((fma(fragmentVectorConstants1.packedValues[2u].z, sumValue8, fma(fragmentVectorConstants1.packedValues[1u].z, sumValue7, sumValue5 * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z) / multiplyAddValue7) - multiplyAddValue6) / productValue26) * fragmentVectorConstants1.packedValues[15u].y;
            uint comparisonValue17 = uint(min(int(uint(int(spvNMin(spvNMin((quotientValue3 < 0.0) ? abs(productValue24 / quotientValue3) : ((1.0 - productValue24) / quotientValue3), (quotientValue4 < 0.0) ? abs(productValue25 / quotientValue4) : ((1.0 - productValue25) / quotientValue4)), (multiplyAddValue10 < 0.0) ? abs(multiplyAddValue6 / multiplyAddValue10) : ((1.0 - multiplyAddValue6) / multiplyAddValue10))))), int(uint(int(fragmentVectorConstants1.packedValues[15u].x)))));
            float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[7u].x, productValue19, fma(fragmentVectorConstants1.packedValues[6u].x, productValue18, productValue17 * fragmentVectorConstants1.packedValues[5u].x));
            float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[7u].y, productValue19, fma(fragmentVectorConstants1.packedValues[6u].y, productValue18, productValue17 * fragmentVectorConstants1.packedValues[5u].y));
            float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[7u].z, productValue19, fma(fragmentVectorConstants1.packedValues[6u].z, productValue18, productValue17 * fragmentVectorConstants1.packedValues[5u].z));
            uint intermediateValue13;
            float intermediateValue14;
            float intermediateValue15;
            float intermediateValue16;
            if (int(comparisonValue17) > int(0u))
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                if (!((!conditionValue6) && (int(comparisonValue32) >= int(scalarValue31))))
                {
                    break;
                }
                float scalarValue32 = rdSignedBitsToFloat(scalarValue31);
                float multiplyAddValue70 = fma(productValue88, scalarValue32, productValue78);
                float multiplyAddValue71 = fma(productValue89, scalarValue32, productValue79);
                float multiplyAddValue72 = fma(productValue90, scalarValue32, productValue80);
                precise float multiplyAddValue73 = fma(multiplyAddValue72, sumValue36, scalarValue29) - fragmentScalarConstants1.packedValues[52u];
                precise float quotientValue31 = scalarValue28 / multiplyAddValue73;
                precise float sumValue38 = fragmentScalarConstants1.packedValues[52u] + quotientValue31;
                precise float sampledTextureValue18 = fma(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue70, multiplyAddValue71)).x, sumValue36, scalarValue29) - fragmentScalarConstants1.packedValues[52u];
                precise float quotientValue32 = scalarValue28 / sampledTextureValue18;
                precise float sumValue39 = fragmentScalarConstants1.packedValues[52u] + quotientValue32;
                quotientValue16 = (-sumValue38) / sumValue36;
                precise float quotientValue33 = (-sumValue39) / sumValue36;
                multiplyAddValue25 = (quotientValue16 >= quotientValue33) && (fma(fragmentScalarConstants1.packedValues[59u], quotientValue33, quotientValue33) >= scalarValue53);
                comparisonValue10 = multiplyAddValue25 ? multiplyAddValue70 : intermediateValue40;
                comparisonValue9 = multiplyAddValue25 ? multiplyAddValue71 : intermediateValue39;
                comparisonValue8 = multiplyAddValue25 ? multiplyAddValue72 : intermediateValue38;
                comparisonValue7 = multiplyAddValue25 ? scalarValue31 : intermediateValue37;
                sumValue12 = scalarValue31 + 1u;
                intermediateValue37 = comparisonValue7;
                intermediateValue38 = comparisonValue8;
                intermediateValue39 = comparisonValue9;
                intermediateValue40 = comparisonValue10;
                scalarValue53 = quotientValue16;
                conditionValue6 = multiplyAddValue25;
                scalarValue31 = sumValue12;
                continue;
            }
            if (int(intermediateValue37) >= int(1u))
            {
                uint scalarValue33 = uint(int(fragmentScalarConstants1.packedValues[63u]));
                precise float productValue91 = productValue71 * fragmentVectorConstants1.packedValues[6u].x;
                precise float productValue92 = productValue71 * fragmentVectorConstants1.packedValues[6u].y;
                precise float productValue93 = productValue71 * fragmentVectorConstants1.packedValues[6u].z;
                float multiplyAddValue74 = fma(fragmentVectorConstants1.packedValues[7u].x, productValue72, fma(fragmentVectorConstants1.packedValues[5u].x, productValue70, productValue91));
                float multiplyAddValue75 = fma(fragmentVectorConstants1.packedValues[7u].y, productValue72, fma(fragmentVectorConstants1.packedValues[5u].y, productValue70, productValue92));
                float multiplyAddValue76 = fma(fragmentVectorConstants1.packedValues[7u].z, productValue72, fma(fragmentVectorConstants1.packedValues[5u].z, productValue70, productValue93));
                float sumValue40 = rdSignedBitsToFloat(intermediateValue37 - 1u);
                float scalarValue54 = rdSignedBitsToFloat(intermediateValue37);
                float intermediateValue47;
                float intermediateValue48;
                float intermediateValue49;
                float intermediateValue50;
                intermediateValue47 = scalarValue54;
                intermediateValue48 = intermediateValue38;
                intermediateValue49 = intermediateValue39;
                intermediateValue50 = intermediateValue40;
                float comparisonValue11;
                float comparisonValue12;
                float comparisonValue13;
                float comparisonValue14;
                float comparisonValue15;
                float comparisonValue16;
                uint sumValue16;
                float scalarValue55 = sumValue40;
                float scalarValue56 = scalarValue54;
                uint scalarValue9 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                if (!((!conditionValue6) && (int(multiplyAddValue34) >= int(scalarValue31))))
                {
                    break;
                }
                float scalarValue32 = rdSignedBitsToFloat(scalarValue31);
                float multiplyAddValue36 = fma(quotientValue11, scalarValue32, productValue51);
                float multiplyAddValue37 = fma(quotientValue12, scalarValue32, productValue52);
                float multiplyAddValue38 = fma(multiplyAddValue33, scalarValue32, multiplyAddValue27);
                multiplyAddValue19 = (-(fragmentScalarConstants1.packedValues[52u] + (scalarValue28 / (fma(multiplyAddValue38, sumValue22, scalarValue29) - fragmentScalarConstants1.packedValues[52u])))) / sumValue22;
                float sampledTextureValue12 = (-(fragmentScalarConstants1.packedValues[52u] + (scalarValue28 / (fma(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue36, multiplyAddValue37)).x, sumValue22, scalarValue29) - fragmentScalarConstants1.packedValues[52u])))) / sumValue22;
                multiplyAddValue20 = (multiplyAddValue19 >= sampledTextureValue12) && (fma(fragmentScalarConstants1.packedValues[59u], sampledTextureValue12, sampledTextureValue12) >= scalarValue30);
                comparisonValue5 = multiplyAddValue20 ? multiplyAddValue36 : intermediateValue37;
                comparisonValue4 = multiplyAddValue20 ? multiplyAddValue37 : intermediateValue36;
                comparisonValue3 = multiplyAddValue20 ? multiplyAddValue38 : intermediateValue35;
                comparisonValue2 = multiplyAddValue20 ? scalarValue31 : intermediateValue34;
                sumValue4 = scalarValue31 + 1u;
                intermediateValue34 = comparisonValue2;
                intermediateValue35 = comparisonValue3;
                intermediateValue36 = comparisonValue4;
                intermediateValue37 = comparisonValue5;
                scalarValue30 = multiplyAddValue19;
                conditionValue6 = multiplyAddValue20;
                scalarValue31 = sumValue4;
                continue;
            }
            if (int(intermediateValue34) >= int(1u))
            {
                uint scalarValue33 = uint(int(fragmentScalarConstants1.packedValues[63u]));
                float multiplyAddValue39 = fma(fragmentVectorConstants1.packedValues[7u].x, productValue50, fma(fragmentVectorConstants1.packedValues[5u].x, productValue48, productValue49 * fragmentVectorConstants1.packedValues[6u].x));
                float multiplyAddValue40 = fma(fragmentVectorConstants1.packedValues[7u].y, productValue50, fma(fragmentVectorConstants1.packedValues[5u].y, productValue48, productValue49 * fragmentVectorConstants1.packedValues[6u].y));
                float multiplyAddValue41 = fma(fragmentVectorConstants1.packedValues[7u].z, productValue50, fma(fragmentVectorConstants1.packedValues[5u].z, productValue48, productValue49 * fragmentVectorConstants1.packedValues[6u].z));
                float sumValue23 = rdSignedBitsToFloat(intermediateValue34 - 1u);
                float scalarValue34 = rdSignedBitsToFloat(intermediateValue34);
                float intermediateValue44;
                float intermediateValue45;
                float intermediateValue46;
                float intermediateValue47;
                intermediateValue44 = scalarValue34;
                intermediateValue45 = intermediateValue35;
                intermediateValue46 = intermediateValue36;
                intermediateValue47 = intermediateValue37;
                float comparisonValue6;
                float comparisonValue7;
                float comparisonValue8;
                float comparisonValue9;
                float comparisonValue10;
                float comparisonValue11;
                uint sumValue6;
                float scalarValue35 = sumValue23;
                float scalarValue36 = scalarValue34;
                uint scalarValue9 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float productValue27 = (fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[13u].y) * 2.0;
                float sumValue9 = sumValue - fragmentVectorConstants1.packedValues[13u].x;
                float sumValue10 = fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x;
                uint intermediateValue17;
                float quotientValue5;
                uint intermediateValue18;
                float intermediateValue19;
                float intermediateValue20;
                float intermediateValue21;
                intermediateValue17 = 4294967295u;
                quotientValue5 = (sumValue1 - (productValue27 / ((multiplyAddValue6 * sumValue10) + sumValue9))) / sumValue10;
                intermediateValue18 = 1u;
                intermediateValue19 = 0.0;
                intermediateValue20 = 0.0;
                intermediateValue21 = 0.0;
                uint comparisonValue3;
                float comparisonValue4;
                float comparisonValue5;
                float comparisonValue6;
#endif
                for (;;)
                {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
                    if (int(scalarValue33) <= int(scalarValue9))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float scalarValue4 = float(int(intermediateValue18));
                    float productValue28 = (scalarValue4 * quotientValue3) + productValue24;
                    float productValue29 = (scalarValue4 * quotientValue4) + productValue25;
                    float productValue30 = (scalarValue4 * multiplyAddValue10) + multiplyAddValue6;
                    float quotientValue6 = (sumValue1 - (productValue27 / ((productValue30 * sumValue10) + sumValue9))) / sumValue10;
                    float sampledTextureValue4 = (sumValue1 - (productValue27 / ((texture(sampler2D(gbufferDepthTexture, gbufferDepthSampler), vec2(productValue28, productValue29)).x * sumValue10) + sumValue9))) / sumValue10;
                    bool comparisonValue18 = sampledTextureValue4 <= quotientValue6;
                    bool comparisonValue19 = quotientValue5 <= ((sampledTextureValue4 * fragmentVectorConstants1.packedValues[14u].w) + sampledTextureValue4);
                    bool bitwiseValue2 = comparisonValue18 && comparisonValue19;
                    comparisonValue3 = bitwiseValue2 ? intermediateValue18 : intermediateValue17;
                    comparisonValue4 = bitwiseValue2 ? productValue28 : intermediateValue19;
                    comparisonValue5 = bitwiseValue2 ? productValue29 : intermediateValue20;
                    comparisonValue6 = bitwiseValue2 ? productValue30 : intermediateValue21;
                    if ((int(intermediateValue18) < int(comparisonValue17)) && (!(comparisonValue18 && comparisonValue19)))
                    {
                        intermediateValue17 = comparisonValue3;
                        quotientValue5 = quotientValue6;
                        intermediateValue18++;
                        intermediateValue19 = comparisonValue4;
                        intermediateValue20 = comparisonValue5;
                        intermediateValue21 = comparisonValue6;
                    }
                    else
#endif
                    {
                        break;
                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                    precise float sumValue41 = scalarValue56 + scalarValue55;
                    precise float productValue94 = sumValue41 * 0.5;
                    float multiplyAddValue77 = fma(productValue88, productValue94, productValue78);
                    float multiplyAddValue78 = fma(productValue89, productValue94, productValue79);
                    float multiplyAddValue79 = fma(productValue90, productValue94, productValue80);
                    precise float sampledTextureValue19 = fma(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue77, multiplyAddValue78)).x, sumValue36, scalarValue29) - fragmentScalarConstants1.packedValues[52u];
                    precise float quotientValue34 = scalarValue28 / sampledTextureValue19;
                    precise float sumValue42 = fragmentScalarConstants1.packedValues[52u] + quotientValue34;
                    precise float quotientValue35 = (-sumValue42) / sumValue36;
                    precise float multiplyAddValue80 = fma(multiplyAddValue79, sumValue36, scalarValue29) - fragmentScalarConstants1.packedValues[52u];
                    precise float quotientValue36 = scalarValue28 / multiplyAddValue80;
                    precise float sumValue43 = fragmentScalarConstants1.packedValues[52u] + quotientValue36;
                    precise float quotientValue37 = (-sumValue43) / sumValue36;
                    bool conditionValue9 = quotientValue35 < quotientValue37;
                    comparisonValue14 = conditionValue9 ? multiplyAddValue77 : intermediateValue50;
                    comparisonValue13 = conditionValue9 ? multiplyAddValue78 : intermediateValue49;
                    comparisonValue12 = conditionValue9 ? multiplyAddValue79 : intermediateValue48;
                    comparisonValue15 = conditionValue9 ? scalarValue55 : productValue94;
                    comparisonValue16 = conditionValue9 ? productValue94 : scalarValue56;
                    comparisonValue11 = conditionValue9 ? productValue94 : intermediateValue47;
                    sumValue16 = scalarValue9 + 1u;
                    intermediateValue47 = comparisonValue11;
                    intermediateValue48 = comparisonValue12;
                    intermediateValue49 = comparisonValue13;
                    intermediateValue50 = comparisonValue14;
                    scalarValue55 = comparisonValue15;
                    scalarValue56 = comparisonValue16;
                    scalarValue9 = sumValue16;
                    continue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    float productValue54 = (scalarValue36 + scalarValue35) * 0.5;
                    float multiplyAddValue42 = fma(quotientValue11, productValue54, productValue51);
                    float multiplyAddValue43 = fma(quotientValue12, productValue54, productValue52);
                    float multiplyAddValue44 = fma(multiplyAddValue33, productValue54, multiplyAddValue27);
                    bool sampledTextureValue13 = ((-(fragmentScalarConstants1.packedValues[52u] + (scalarValue28 / (fma(texture(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue42, multiplyAddValue43)).x, sumValue22, scalarValue29) - fragmentScalarConstants1.packedValues[52u])))) / sumValue22) < ((-(fragmentScalarConstants1.packedValues[52u] + (scalarValue28 / (fma(multiplyAddValue44, sumValue22, scalarValue29) - fragmentScalarConstants1.packedValues[52u])))) / sumValue22);
                    comparisonValue9 = sampledTextureValue13 ? multiplyAddValue42 : intermediateValue47;
                    comparisonValue8 = sampledTextureValue13 ? multiplyAddValue43 : intermediateValue46;
                    comparisonValue7 = sampledTextureValue13 ? multiplyAddValue44 : intermediateValue45;
                    comparisonValue10 = sampledTextureValue13 ? scalarValue35 : productValue54;
                    comparisonValue11 = sampledTextureValue13 ? productValue54 : scalarValue36;
                    comparisonValue6 = sampledTextureValue13 ? productValue54 : intermediateValue44;
                    sumValue6 = scalarValue9 + 1u;
                    intermediateValue44 = comparisonValue6;
                    intermediateValue45 = comparisonValue7;
                    intermediateValue46 = comparisonValue8;
                    intermediateValue47 = comparisonValue9;
                    scalarValue35 = comparisonValue10;
                    scalarValue36 = comparisonValue11;
                    scalarValue9 = sumValue6;
                    continue;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                precise float quotientValue38 = intermediateValue47 / rdSignedBitsToFloat(comparisonValue32);
                precise float productValue95 = fragmentScalarConstants1.packedValues[54u] * fragmentScalarConstants1.packedValues[56u];
                precise float multiplyAddValue81 = log2(abs(fma(intermediateValue50, 2.0, -1.0))) * productValue95;
                precise float multiplyAddValue82 = log2(abs(fma(intermediateValue49, 2.0, -1.0))) * fragmentScalarConstants1.packedValues[57u];
                precise float exponentialValue = 1.0 - exp2(multiplyAddValue81);
                precise float exponentialValue1 = 1.0 - exp2(multiplyAddValue82);
                precise float productValue96 = exponentialValue1 * exponentialValue;
                precise float sumValue44 = 1.0 - fragmentScalarConstants1.packedValues[58u];
                precise float sumValue45 = quotientValue38 - fragmentScalarConstants1.packedValues[58u];
                precise float quotientValue39 = 1.0 / sumValue44;
                precise float productValue97 = quotientValue39 * sumValue45;
                float scalarValue57 = spvNClamp(productValue97, 0.0, 1.0);
                precise float productValue98 = scalarValue57 * scalarValue57;
                precise float sumValue46 = fragmentScalarConstants1.packedValues[16u] - fragmentScalarConstants1.packedValues[17u];
                precise float sumValue47 = spvNMax(sampledTextureValue15, fragmentScalarConstants1.packedValues[17u]) - fragmentScalarConstants1.packedValues[17u];
                precise float quotientValue40 = sumValue47 / sumValue46;
                precise float sumValue48 = 1.0 - quotientValue40;
                vec4 sampledTextureValue20 = texture(sampler2D(materialTexture1, textureSampler1), vec2(intermediateValue50, intermediateValue49));
                float scalarValue58 = sampledTextureValue20.x;
                float scalarValue59 = sampledTextureValue20.y;
                float scalarValue60 = abs(scalarValue59);
                precise float sumValue49 = 1.0 - abs(scalarValue58);
                precise float sumValue50 = 1.0 - scalarValue60;
                precise float sumValue51 = sumValue49 - scalarValue60;
                bool conditionValue10 = sumValue51 < 0.0;
                precise float comparisonValue33 = ((scalarValue58 >= 0.0) ? 1.0 : (-1.0)) * sumValue50;
                precise float comparisonValue34 = ((scalarValue59 >= 0.0) ? 1.0 : (-1.0)) * sumValue49;
                float comparisonValue35 = conditionValue10 ? comparisonValue33 : scalarValue58;
                float comparisonValue36 = conditionValue10 ? comparisonValue34 : scalarValue59;
                vec3 vectorValue11 = vec3(comparisonValue35, comparisonValue36, sumValue51);
                float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
                precise float productValue99 = inverseLengthValue18 * comparisonValue35;
                precise float productValue100 = inverseLengthValue18 * comparisonValue36;
                precise float productValue101 = inverseLengthValue18 * sumValue51;
                vec3 vectorValue12 = vec3(multiplyAddValue74, multiplyAddValue75, multiplyAddValue76);
                float inverseLengthValue19 = inversesqrt(rdDot3Precise2(vectorValue12, vectorValue12));
                precise float productValue102 = inverseLengthValue19 * multiplyAddValue74;
                precise float productValue103 = inverseLengthValue19 * multiplyAddValue75;
                precise float productValue104 = inverseLengthValue19 * multiplyAddValue76;
                precise float sumValue52 = 1.0 - rdDot3Precise2(vec3(productValue99, productValue100, productValue101), vec3(productValue102, productValue103, productValue104));
                fragmentColor0.w = spvNMin(sumValue48, spvNMin(spvNClamp(sumValue52, 0.0, 1.0), spvNMin(fma(-fma(scalarValue57, -2.0, 3.0), productValue98, 1.0), productValue96)));
                fragmentColor0.x = intermediateValue50;
                fragmentColor0.y = intermediateValue49;
                fragmentColor0.z = intermediateValue48;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float quotientValue13 = spvNClamp((1.0 / (1.0 - fragmentScalarConstants1.packedValues[58u])) * ((intermediateValue44 / rdSignedBitsToFloat(multiplyAddValue34)) - fragmentScalarConstants1.packedValues[58u]), 0.0, 1.0);
                vec4 sampledTextureValue14 = texture(sampler2D(materialTexture1, textureSampler1), vec2(intermediateValue47, intermediateValue46));
                float scalarValue37 = sampledTextureValue14.x;
                float scalarValue38 = sampledTextureValue14.y;
                float scalarValue39 = abs(scalarValue38);
                float sumValue24 = 1.0 - abs(scalarValue37);
                float sumValue25 = sumValue24 - scalarValue39;
                bool conditionValue7 = sumValue25 < 0.0;
                float comparisonValue24 = conditionValue7 ? (((scalarValue37 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue39)) : scalarValue37;
                float comparisonValue25 = conditionValue7 ? (((scalarValue38 >= 0.0) ? 1.0 : (-1.0)) * sumValue24) : scalarValue38;
                vec3 vectorValue4 = vec3(comparisonValue24, comparisonValue25, sumValue25);
                float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
                vec3 vectorValue5 = vec3(multiplyAddValue39, multiplyAddValue40, multiplyAddValue41);
                float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
                fragmentColor0.w = spvNMin(1.0 - ((spvNMax(sampledTextureValue9, fragmentScalarConstants1.packedValues[17u]) - fragmentScalarConstants1.packedValues[17u]) / (fragmentScalarConstants1.packedValues[16u] - fragmentScalarConstants1.packedValues[17u])), spvNMin(spvNClamp(1.0 - rdDot3Precise2(vec3(inverseLengthValue12 * comparisonValue24, inverseLengthValue12 * comparisonValue25, inverseLengthValue12 * sumValue25), vec3(inverseLengthValue13 * multiplyAddValue39, inverseLengthValue13 * multiplyAddValue40, inverseLengthValue13 * multiplyAddValue41)), 0.0, 1.0), spvNMin(fma(-fma(quotientValue13, -2.0, 3.0), quotientValue13 * quotientValue13, 1.0), (1.0 - exp2(log2(abs(fma(intermediateValue46, 2.0, -1.0))) * fragmentScalarConstants1.packedValues[57u])) * (1.0 - exp2(log2(abs(fma(intermediateValue47, 2.0, -1.0))) * (fragmentScalarConstants1.packedValues[54u] * fragmentScalarConstants1.packedValues[56u]))))));
                fragmentColor0.x = intermediateValue47;
                fragmentColor0.y = intermediateValue46;
                fragmentColor0.z = intermediateValue45;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue13 = comparisonValue3;
                intermediateValue14 = comparisonValue4;
                intermediateValue15 = comparisonValue5;
                intermediateValue16 = comparisonValue6;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
                fragmentColor0.x = 0.0;
                fragmentColor0.y = 0.0;
                fragmentColor0.z = 0.0;
                fragmentColor0.w = -1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue13 = 4294967295u;
                intermediateValue14 = 0.0;
                intermediateValue15 = 0.0;
                intermediateValue16 = 0.0;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue10;
            float branchMergedValue11;
            float branchMergedValue12;
            float branchMergedValue13;
            if (int(intermediateValue13) < int(1u))
            {
                branchMergedValue10 = 0.0;
                branchMergedValue11 = 0.0;
                branchMergedValue12 = -1.0;
                branchMergedValue13 = 0.0;
            }
            else
            {
                float scalarValue5 = float(int(intermediateValue13));
                float intermediateValue1;
                float intermediateValue3;
                float intermediateValue5;
                float intermediateValue24;
                if (int(scalarValue) > int(0u))
                {
                    float sumValue11 = float(int(intermediateValue13 + 4294967295u));
                    float intermediateValue25;
                    float intermediateValue26;
                    float intermediateValue27;
                    float intermediateValue28;
                    float intermediateValue34;
                    float intermediateValue36;
                    float scalarValue6 = sumValue11;
                    float scalarValue7 = scalarValue5;
                    float scalarValue8 = scalarValue5;
                    uint scalarValue9 = 0u;
                    float scalarValue10 = intermediateValue14;
                    float scalarValue11 = intermediateValue15;
                    float scalarValue12 = intermediateValue16;
                    float productValue34;
                    float productValue35;
                    float productValue36;
                    float productValue37;
                    bool sampledTextureValue6;
                    for (;;)
                    {
                        productValue34 = (scalarValue7 + scalarValue6) * 0.5;
                        productValue35 = (productValue34 * quotientValue3) + productValue24;
                        productValue36 = (productValue34 * quotientValue4) + productValue25;
                        productValue37 = (productValue34 * multiplyAddValue10) + multiplyAddValue6;
                        float productValue31 = (fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[13u].y) * 2.0;
                        float sumValue13 = fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x;
                        float sumValue14 = sumValue - fragmentVectorConstants1.packedValues[13u].x;
                        sampledTextureValue6 = ((sumValue1 - (productValue31 / ((productValue37 * sumValue13) + sumValue14))) / sumValue13) > ((sumValue1 - (productValue31 / ((texture(sampler2D(gbufferDepthTexture, gbufferDepthSampler), vec2(productValue35, productValue36)).x * sumValue13) + sumValue14))) / sumValue13);
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        float branchMergedValue4;
                        float branchMergedValue5;
                        if (sampledTextureValue6)
                        {
                            branchMergedValue = productValue37;
                            branchMergedValue1 = productValue36;
                            branchMergedValue2 = productValue35;
                            branchMergedValue3 = productValue34;
                            branchMergedValue4 = productValue34;
                            branchMergedValue5 = scalarValue6;
                        }
                        else
                        {
                            branchMergedValue = scalarValue12;
                            branchMergedValue1 = scalarValue11;
                            branchMergedValue2 = scalarValue10;
                            branchMergedValue3 = scalarValue8;
                            branchMergedValue4 = scalarValue7;
                            branchMergedValue5 = productValue34;
                        }
                        intermediateValue28 = branchMergedValue;
                        intermediateValue27 = branchMergedValue1;
                        intermediateValue26 = branchMergedValue2;
                        intermediateValue25 = branchMergedValue3;
                        intermediateValue36 = branchMergedValue4;
                        intermediateValue34 = branchMergedValue5;
                        uint sumValue15 = scalarValue9 + 1u;
                        if (sumValue15 == scalarValue)
                        {
                            break;
                        }
                        else
                        {
                            scalarValue6 = intermediateValue34;
                            scalarValue7 = intermediateValue36;
                            scalarValue8 = intermediateValue25;
                            scalarValue9 = sumValue15;
                            scalarValue10 = intermediateValue26;
                            scalarValue11 = intermediateValue27;
                            scalarValue12 = intermediateValue28;
                            continue;
                        }
                    }
                    intermediateValue24 = intermediateValue25;
                    intermediateValue1 = intermediateValue26;
                    intermediateValue3 = intermediateValue27;
                    intermediateValue5 = intermediateValue28;
                }
                else
                {
                    intermediateValue24 = scalarValue5;
                    intermediateValue1 = intermediateValue14;
                    intermediateValue3 = intermediateValue15;
                    intermediateValue5 = intermediateValue16;
                }
                float quotientValue7 = spvNClamp(((intermediateValue24 / float(int(comparisonValue17))) - fragmentVectorConstants1.packedValues[14u].z) / (1.0 - fragmentVectorConstants1.packedValues[14u].z), 0.0, 1.0);
                vec4 sampledTextureValue5 = texture(sampler2D(gbufferNormalTexture, gbufferNormalSampler), vec2(intermediateValue1, intermediateValue3));
                float scalarValue13 = sampledTextureValue5.x;
                float scalarValue14 = sampledTextureValue5.y;
                float sumValue17 = 1.0 - abs(scalarValue13);
                float scalarValue15 = abs(scalarValue14);
                float sumValue18 = sumValue17 - scalarValue15;
                bool conditionValue2 = sumValue18 < 0.0;
                float comparisonValue20 = conditionValue2 ? ((1.0 - scalarValue15) * ((scalarValue13 < 0.0) ? (-1.0) : 1.0)) : scalarValue13;
                float comparisonValue21 = conditionValue2 ? (((scalarValue14 < 0.0) ? (-1.0) : 1.0) * sumValue17) : scalarValue14;
                float inverseLengthValue5 = inversesqrt(dot(vec3(comparisonValue20, comparisonValue21, sumValue18), vec3(comparisonValue20, comparisonValue21, sumValue18)));
                float productValue32 = comparisonValue20 * inverseLengthValue5;
                float productValue33 = comparisonValue21 * inverseLengthValue5;
                float productValue38 = inverseLengthValue5 * sumValue18;
                float inverseLengthValue6 = inversesqrt(dot(vec3(productValue32, productValue33, productValue38), vec3(productValue32, productValue33, productValue38)));
                float inverseLengthValue7 = inversesqrt(dot(vec3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), vec3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13)));
                branchMergedValue10 = intermediateValue3;
                branchMergedValue11 = intermediateValue5;
                branchMergedValue12 = spvNMin(spvNMin(spvNMin((1.0 - exp2(log2(abs((intermediateValue3 * 2.0) + (-1.0))) * fragmentVectorConstants1.packedValues[14u].y)) * (1.0 - exp2((fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[13u].z) * log2(abs((intermediateValue1 * 2.0) + (-1.0))))), 1.0 - ((quotientValue7 * quotientValue7) * (3.0 - (quotientValue7 * 2.0)))), spvNClamp(1.0 - dot(vec3(inverseLengthValue6 * productValue32, productValue33 * inverseLengthValue6, inverseLengthValue6 * productValue38), vec3(inverseLengthValue7 * multiplyAddValue11, inverseLengthValue7 * multiplyAddValue12, inverseLengthValue7 * multiplyAddValue13)), 0.0, 1.0)), 1.0 - ((spvNMax(sampledTextureValue1, fragmentVectorConstants1.packedValues[4u].y) - fragmentVectorConstants1.packedValues[4u].y) / (fragmentVectorConstants1.packedValues[4u].x - fragmentVectorConstants1.packedValues[4u].y)));
                branchMergedValue13 = intermediateValue1;
            }
            branchMergedValue6 = branchMergedValue10;
            branchMergedValue7 = branchMergedValue11;
            branchMergedValue8 = branchMergedValue12;
            branchMergedValue9 = branchMergedValue13;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            fragmentColor0.x = 0.0;
            fragmentColor0.y = 0.0;
            fragmentColor0.z = 0.0;
            fragmentColor0.w = -1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue6 = 0.0;
            branchMergedValue7 = 0.0;
            branchMergedValue8 = -1.0;
            branchMergedValue9 = 0.0;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue = branchMergedValue9;
        intermediateValue2 = branchMergedValue6;
        intermediateValue4 = branchMergedValue7;
        intermediateValue6 = branchMergedValue8;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = intermediateValue;
    fragmentColor0.y = intermediateValue2;
    fragmentColor0.z = intermediateValue4;
    fragmentColor0.w = intermediateValue6;
#endif
}
