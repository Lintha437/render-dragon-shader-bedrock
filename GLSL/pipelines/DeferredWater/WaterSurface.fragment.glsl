#version 460
#extension GL_GOOGLE_include_directive : require
// DeferredWater / WaterSurface / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
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

#include "../../include/materials/DeferredWater/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture7, textureSampler7), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float multiplyAddValue = fma(scalarValue2, fragmentScalarConstants1.packedValues[43u], fragmentScalarConstants1.packedValues[47u]);
    float quotientValue = (varyingColor1.x * fragmentScalarConstants1.packedValues[32u]) / multiplyAddValue;
    float quotientValue1 = (varyingColor1.y * fragmentScalarConstants1.packedValues[37u]) / multiplyAddValue;
    float quotientValue2 = fragmentScalarConstants1.packedValues[46u] / multiplyAddValue;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].x, quotientValue, quotientValue1 * fragmentVectorConstants1.packedValues[5u].x));
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].y, quotientValue, quotientValue1 * fragmentVectorConstants1.packedValues[5u].y));
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].z, quotientValue, quotientValue1 * fragmentVectorConstants1.packedValues[5u].z));
    float scalarValue3 = abs(scalarValue1);
    float sumValue = 1.0 - abs(scalarValue);
    float sumValue1 = sumValue - scalarValue3;
    bool conditionValue = sumValue1 < 0.0;
    float comparisonValue = conditionValue ? (((scalarValue >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue3)) : scalarValue;
    float comparisonValue1 = conditionValue ? (((scalarValue1 >= 0.0) ? 1.0 : (-1.0)) * sumValue) : scalarValue1;
    vec3 vectorValue = vec3(comparisonValue, comparisonValue1, sumValue1);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue = inverseLengthValue * comparisonValue;
    float productValue1 = inverseLengthValue * comparisonValue1;
    float productValue2 = inverseLengthValue * sumValue1;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue2, fma(fragmentVectorConstants1.packedValues[0u].x, productValue, productValue1 * fragmentVectorConstants1.packedValues[1u].x));
    float multiplyAddValue5 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue2, fma(fragmentVectorConstants1.packedValues[0u].y, productValue, productValue1 * fragmentVectorConstants1.packedValues[1u].y));
    float multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue2, fma(fragmentVectorConstants1.packedValues[0u].z, productValue, productValue1 * fragmentVectorConstants1.packedValues[1u].z));
    vec3 vectorValue1 = vec3(multiplyAddValue4, multiplyAddValue5, multiplyAddValue6);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    bool sampledTextureValue2 = uint(textureQueryLevels(intermediateValue)) > 0u;
    uvec2 sampledTextureValue3 = uvec2(textureSize(intermediateValue, int(0u)));
    uint scalarValue4 = sampledTextureValue3.x;
    uvec4 sampledTextureValue6 = texelFetch(intermediateValue, ivec2(uvec2(uint(int(rdEvaluateFloatExpression(sampledTextureValue2 ? scalarValue4 : 0u) * varyingTexCoord0.x)), uint(int(rdEvaluateFloatExpression(sampledTextureValue2 ? sampledTextureValue3.y : 0u) * varyingTexCoord0.y)))), int(0u));
    uint scalarValue5 = sampledTextureValue6.y;
    uint scalarValue6 = sampledTextureValue6.z;
    float bitwiseValue = rdEvaluateFloatExpression(sampledTextureValue6.w & 255u);
    float bitwiseValue1 = rdEvaluateFloatExpression(scalarValue6 & 255u) * 0.0039215688593685626983642578125;
    float sampledTextureValue5;
    if (fragmentScalarConstants1.packedValues[384u] > 0.5)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture7, textureSampler7), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float multiplyAddValue = fma(scalarValue2, fragmentScalarConstants1.packedValues[43u], fragmentScalarConstants1.packedValues[47u]);
    float quotientValue = (varyingColor1.x * fragmentScalarConstants1.packedValues[32u]) / multiplyAddValue;
    float quotientValue1 = (varyingColor1.y * fragmentScalarConstants1.packedValues[37u]) / multiplyAddValue;
    float quotientValue2 = fragmentScalarConstants1.packedValues[46u] / multiplyAddValue;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].x, quotientValue, quotientValue1 * fragmentVectorConstants1.packedValues[5u].x));
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].y, quotientValue, quotientValue1 * fragmentVectorConstants1.packedValues[5u].y));
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].z, quotientValue, quotientValue1 * fragmentVectorConstants1.packedValues[5u].z));
    float sumValue113 = multiplyAddValue1 + fragmentVectorConstants1.packedValues[7u].x;
    float sumValue114 = multiplyAddValue2 + fragmentVectorConstants1.packedValues[7u].y;
    float sumValue115 = multiplyAddValue3 + fragmentVectorConstants1.packedValues[7u].z;
    float quotientValue63 = ((varyingColor1.y - fragmentScalarConstants1.packedValues[441u]) * fragmentScalarConstants1.packedValues[37u]) / multiplyAddValue;
    float quotientValue64 = ((varyingColor1.x + fragmentScalarConstants1.packedValues[440u]) * fragmentScalarConstants1.packedValues[32u]) / multiplyAddValue;
    float multiplyAddValue157 = (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].x, quotientValue64, quotientValue63 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) - fragmentVectorConstants1.packedValues[72u].x;
    float multiplyAddValue158 = (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].y, quotientValue64, quotientValue63 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) - fragmentVectorConstants1.packedValues[72u].y;
    float multiplyAddValue159 = (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].z, quotientValue64, quotientValue63 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) - fragmentVectorConstants1.packedValues[72u].z;
    float scalarValue12 = dFdxCoarse(quotientValue2);
    float scalarValue91 = dFdxCoarse(quotientValue64);
    float scalarValue92 = dFdxCoarse(quotientValue63);
    vec3 vectorValue13 = vec3(scalarValue12, scalarValue91, scalarValue92);
    float inverseLengthValue33 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
    float productValue247 = inverseLengthValue33 * scalarValue12;
    float productValue248 = inverseLengthValue33 * scalarValue91;
    float productValue249 = inverseLengthValue33 * scalarValue92;
    float scalarValue93 = -quotientValue2;
    float scalarValue94 = dFdyCoarse(-quotientValue63);
    float scalarValue95 = dFdyCoarse(scalarValue93);
    float scalarValue96 = dFdyCoarse(-quotientValue64);
    vec3 vectorValue14 = vec3(scalarValue94, scalarValue95, scalarValue96);
    float inverseLengthValue34 = inversesqrt(rdDot3Precise2(vectorValue14, vectorValue14));
    float productValue250 = inverseLengthValue34 * scalarValue94;
    float productValue251 = inverseLengthValue34 * scalarValue95;
    float productValue252 = inverseLengthValue34 * scalarValue96;
    float multiplyAddValue160 = fma(productValue249, productValue251, -(productValue250 * productValue247));
    float multiplyAddValue161 = fma(productValue247, productValue252, -(productValue251 * productValue248));
    float multiplyAddValue162 = fma(productValue248, productValue250, -(productValue252 * productValue249));
    vec3 vectorValue15 = vec3(multiplyAddValue160, multiplyAddValue161, multiplyAddValue162);
    float inverseLengthValue35 = inversesqrt(rdDot3Precise2(vectorValue15, vectorValue15));
    float productValue253 = inverseLengthValue35 * multiplyAddValue160;
    float productValue254 = inverseLengthValue35 * multiplyAddValue161;
    float productValue255 = inverseLengthValue35 * multiplyAddValue162;
    float multiplyAddValue163 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue255, fma(fragmentVectorConstants1.packedValues[4u].x, productValue253, productValue254 * fragmentVectorConstants1.packedValues[5u].x));
    float multiplyAddValue164 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue255, fma(fragmentVectorConstants1.packedValues[4u].y, productValue253, productValue254 * fragmentVectorConstants1.packedValues[5u].y));
    float multiplyAddValue165 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue255, fma(fragmentVectorConstants1.packedValues[4u].z, productValue253, productValue254 * fragmentVectorConstants1.packedValues[5u].z));
    vec3 vectorValue16 = vec3(multiplyAddValue163, multiplyAddValue164, multiplyAddValue165);
    float inverseLengthValue36 = inversesqrt(rdDot3Precise2(vectorValue16, vectorValue16));
    float quotientValue65 = roundEven((inverseLengthValue36 * multiplyAddValue163) / fragmentScalarConstants1.packedValues[416u]) * fragmentScalarConstants1.packedValues[416u];
    float quotientValue66 = roundEven((inverseLengthValue36 * multiplyAddValue164) / fragmentScalarConstants1.packedValues[416u]) * fragmentScalarConstants1.packedValues[416u];
    float quotientValue67 = roundEven((inverseLengthValue36 * multiplyAddValue165) / fragmentScalarConstants1.packedValues[416u]) * fragmentScalarConstants1.packedValues[416u];
    vec3 vectorValue17 = vec3(quotientValue65, quotientValue66, quotientValue67);
    float inverseLengthValue37 = inversesqrt(rdDot3Precise2(vectorValue17, vectorValue17));
    float productValue256 = inverseLengthValue37 * quotientValue65;
    float productValue257 = inverseLengthValue37 * quotientValue66;
    float productValue258 = inverseLengthValue37 * quotientValue67;
    float scalarValue97 = -fragmentScalarConstants1.packedValues[398u];
    float multiplyAddValue166 = fma(fragmentScalarConstants1.packedValues[398u], 0.5, -fma(scalarValue97, floor(multiplyAddValue157 / fragmentScalarConstants1.packedValues[398u]), multiplyAddValue157));
    float multiplyAddValue167 = fma(fragmentScalarConstants1.packedValues[398u], 0.5, -fma(scalarValue97, floor(multiplyAddValue158 / fragmentScalarConstants1.packedValues[398u]), multiplyAddValue158));
    float multiplyAddValue168 = fma(fragmentScalarConstants1.packedValues[398u], 0.5, -fma(scalarValue97, floor(multiplyAddValue159 / fragmentScalarConstants1.packedValues[398u]), multiplyAddValue159));
    float scalarValue98 = -rdDot3Precise2(vec3(multiplyAddValue166, multiplyAddValue167, multiplyAddValue168), vec3(productValue256, productValue257, productValue258));
    float scalarValue3 = abs(scalarValue1);
    float sumValue = 1.0 - abs(scalarValue);
    float sumValue1 = sumValue - scalarValue3;
    bool conditionValue = sumValue1 < 0.0;
    float comparisonValue = conditionValue ? (((scalarValue >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue3)) : scalarValue;
    float comparisonValue1 = conditionValue ? (((scalarValue1 >= 0.0) ? 1.0 : (-1.0)) * sumValue) : scalarValue1;
    vec3 vectorValue = vec3(comparisonValue, comparisonValue1, sumValue1);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue = inverseLengthValue * comparisonValue;
    float productValue1 = inverseLengthValue * comparisonValue1;
    float productValue2 = inverseLengthValue * sumValue1;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue2, fma(fragmentVectorConstants1.packedValues[0u].x, productValue, productValue1 * fragmentVectorConstants1.packedValues[1u].x));
    float multiplyAddValue5 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue2, fma(fragmentVectorConstants1.packedValues[0u].y, productValue, productValue1 * fragmentVectorConstants1.packedValues[1u].y));
    float multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue2, fma(fragmentVectorConstants1.packedValues[0u].z, productValue, productValue1 * fragmentVectorConstants1.packedValues[1u].z));
    vec3 vectorValue1 = vec3(multiplyAddValue4, multiplyAddValue5, multiplyAddValue6);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    bool sampledTextureValue2 = uint(textureQueryLevels(intermediateValue)) > 0u;
    uvec2 sampledTextureValue3 = uvec2(textureSize(intermediateValue, int(0u)));
    uint scalarValue4 = sampledTextureValue3.x;
    uvec4 sampledTextureValue6 = texelFetch(intermediateValue, ivec2(uvec2(uint(int(rdEvaluateFloatExpression(sampledTextureValue2 ? scalarValue4 : 0u) * varyingTexCoord0.x)), uint(int(rdEvaluateFloatExpression(sampledTextureValue2 ? sampledTextureValue3.y : 0u) * varyingTexCoord0.y)))), int(0u));
    uint scalarValue5 = sampledTextureValue6.y;
    uint scalarValue6 = sampledTextureValue6.z;
    float productValue259 = rdEvaluateFloatExpression(bitfieldExtract(sampledTextureValue6.x, int(8u), int(8u))) * 0.0039215688593685626983642578125;
    float bitwiseValue = rdEvaluateFloatExpression(sampledTextureValue6.w & 255u);
    float bitwiseValue1 = rdEvaluateFloatExpression(scalarValue6 & 255u) * 0.0039215688593685626983642578125;
    float sampledTextureValue5;
    if (fragmentScalarConstants1.packedValues[436u] > 0.5)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue17 = texture(sampler2D(normalTexture, normalSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue42 = sampledTextureValue17.x;
    float scalarValue43 = sampledTextureValue17.y;
    vec4 sampledTextureValue18 = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue44 = sampledTextureValue18.x;
    float productValue66 = (scalarValue44 * fragmentVectorConstants1.packedValues[10u].w) + fragmentVectorConstants1.packedValues[11u].w;
    float quotientValue15 = (fragmentVectorConstants1.packedValues[8u].x * varyingColor1.x) / productValue66;
    float quotientValue16 = (fragmentVectorConstants1.packedValues[9u].y * varyingColor1.y) / productValue66;
    float quotientValue17 = fragmentVectorConstants1.packedValues[11u].z / productValue66;
    float multiplyAddValue110 = fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].x, quotientValue16, quotientValue15 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue111 = fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].y, quotientValue16, quotientValue15 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue112 = fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue16, quotientValue15 * fragmentVectorConstants1.packedValues[4u].z));
    float quotientValue18 = ((fragmentVectorConstants1.packedValues[97u].x + varyingColor1.x) * fragmentVectorConstants1.packedValues[8u].x) / productValue66;
    float quotientValue19 = ((varyingColor1.y - fragmentVectorConstants1.packedValues[97u].y) * fragmentVectorConstants1.packedValues[9u].y) / productValue66;
    float multiplyAddValue113 = (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].x, quotientValue19, quotientValue18 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) - fragmentVectorConstants1.packedValues[69u].x;
    float multiplyAddValue114 = (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].y, quotientValue19, quotientValue18 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) - fragmentVectorConstants1.packedValues[69u].y;
    float multiplyAddValue115 = (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue19, quotientValue18 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z) - fragmentVectorConstants1.packedValues[69u].z;
    float scalarValue45 = dFdxCoarse(quotientValue18);
    float scalarValue46 = dFdxCoarse(quotientValue19);
    float scalarValue47 = dFdxCoarse(quotientValue17);
    float inverseLengthValue11 = inversesqrt(dot(vec3(scalarValue45, scalarValue46, scalarValue47), vec3(scalarValue45, scalarValue46, scalarValue47)));
    float productValue67 = inverseLengthValue11 * scalarValue45;
    float productValue68 = inverseLengthValue11 * scalarValue46;
    float productValue69 = inverseLengthValue11 * scalarValue47;
    float sumValue35 = dFdyCoarse((-0.0) - quotientValue18);
    float sumValue36 = dFdyCoarse((-0.0) - quotientValue19);
    float sumValue40 = dFdyCoarse((-0.0) - quotientValue17);
    float inverseLengthValue12 = inversesqrt(dot(vec3(sumValue35, sumValue36, sumValue40), vec3(sumValue35, sumValue36, sumValue40)));
    float productValue74 = inverseLengthValue12 * sumValue35;
    float productValue75 = inverseLengthValue12 * sumValue36;
    float productValue76 = inverseLengthValue12 * sumValue40;
    float productValue77 = (productValue76 * productValue68) - (productValue75 * productValue69);
    float productValue78 = (productValue74 * productValue69) - (productValue76 * productValue67);
    float productValue79 = (productValue75 * productValue67) - (productValue74 * productValue68);
    float inverseLengthValue13 = inversesqrt(dot(vec3(productValue77, productValue78, productValue79), vec3(productValue77, productValue78, productValue79)));
    float productValue80 = productValue77 * inverseLengthValue13;
    float productValue81 = productValue78 * inverseLengthValue13;
    float productValue82 = productValue79 * inverseLengthValue13;
    float multiplyAddValue116 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue82, fma(fragmentVectorConstants1.packedValues[5u].x, productValue81, productValue80 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue117 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue82, fma(fragmentVectorConstants1.packedValues[5u].y, productValue81, productValue80 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue118 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue82, fma(fragmentVectorConstants1.packedValues[5u].z, productValue81, productValue80 * fragmentVectorConstants1.packedValues[4u].z));
    float inverseLengthValue14 = inversesqrt(dot(vec3(multiplyAddValue116, multiplyAddValue117, multiplyAddValue118), vec3(multiplyAddValue116, multiplyAddValue117, multiplyAddValue118)));
    float quotientValue20 = roundEven((inverseLengthValue14 * multiplyAddValue116) / fragmentVectorConstants1.packedValues[91u].x) * fragmentVectorConstants1.packedValues[91u].x;
    float quotientValue21 = roundEven((inverseLengthValue14 * multiplyAddValue117) / fragmentVectorConstants1.packedValues[91u].x) * fragmentVectorConstants1.packedValues[91u].x;
    float quotientValue23 = roundEven((inverseLengthValue14 * multiplyAddValue118) / fragmentVectorConstants1.packedValues[91u].x) * fragmentVectorConstants1.packedValues[91u].x;
    float inverseLengthValue15 = inversesqrt(dot(vec3(quotientValue20, quotientValue21, quotientValue23), vec3(quotientValue20, quotientValue21, quotientValue23)));
    float productValue83 = inverseLengthValue15 * quotientValue20;
    float productValue84 = inverseLengthValue15 * quotientValue21;
    float productValue85 = inverseLengthValue15 * quotientValue23;
    float productValue89 = fragmentVectorConstants1.packedValues[88u].z * 0.5;
    float quotientValue24 = productValue89 - (multiplyAddValue113 - (floor(multiplyAddValue113 / fragmentVectorConstants1.packedValues[88u].z) * fragmentVectorConstants1.packedValues[88u].z));
    float quotientValue25 = productValue89 - (multiplyAddValue114 - (floor(multiplyAddValue114 / fragmentVectorConstants1.packedValues[88u].z) * fragmentVectorConstants1.packedValues[88u].z));
    float quotientValue26 = productValue89 - (multiplyAddValue115 - (floor(multiplyAddValue115 / fragmentVectorConstants1.packedValues[88u].z) * fragmentVectorConstants1.packedValues[88u].z));
    float dotProductValue = dot(vec3(quotientValue24, quotientValue25, quotientValue26), vec3(productValue83, productValue84, productValue85));
    float sumValue42 = 1.0 - abs(scalarValue42);
    float scalarValue48 = abs(scalarValue43);
    float sumValue43 = sumValue42 - scalarValue48;
    bool conditionValue5 = sumValue43 < 0.0;
    float comparisonValue40 = conditionValue5 ? ((1.0 - scalarValue48) * ((scalarValue42 < 0.0) ? (-1.0) : 1.0)) : scalarValue42;
    float comparisonValue41 = conditionValue5 ? (sumValue42 * ((scalarValue43 < 0.0) ? (-1.0) : 1.0)) : scalarValue43;
    float inverseLengthValue16 = inversesqrt(dot(vec3(comparisonValue40, comparisonValue41, sumValue43), vec3(comparisonValue40, comparisonValue41, sumValue43)));
    float productValue90 = comparisonValue40 * inverseLengthValue16;
    float productValue91 = comparisonValue41 * inverseLengthValue16;
    float productValue98 = inverseLengthValue16 * sumValue43;
    float inverseLengthValue17 = inversesqrt(dot(vec3(productValue90, productValue91, productValue98), vec3(productValue90, productValue91, productValue98)));
    float productValue101 = inverseLengthValue17 * productValue90;
    float productValue102 = productValue91 * inverseLengthValue17;
    float productValue103 = inverseLengthValue17 * productValue98;
    float multiplyAddValue119 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue103, fma(fragmentVectorConstants1.packedValues[1u].x, productValue102, productValue101 * fragmentVectorConstants1.packedValues[0u].x));
    float multiplyAddValue120 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue103, fma(fragmentVectorConstants1.packedValues[1u].y, productValue102, productValue101 * fragmentVectorConstants1.packedValues[0u].y));
    float multiplyAddValue121 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue103, fma(fragmentVectorConstants1.packedValues[1u].z, productValue102, productValue101 * fragmentVectorConstants1.packedValues[0u].z));
    float inverseLengthValue18 = inversesqrt(dot(vec3(multiplyAddValue119, multiplyAddValue120, multiplyAddValue121), vec3(multiplyAddValue119, multiplyAddValue120, multiplyAddValue121)));
    float productValue106 = inverseLengthValue18 * multiplyAddValue119;
    float productValue107 = inverseLengthValue18 * multiplyAddValue120;
    float productValue108 = inverseLengthValue18 * multiplyAddValue121;
    uvec2 sampledTextureValue19 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    uvec4 sampledTextureValue20 = texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue19.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(sampledTextureValue19.y)))))) * varyingTexCoord0.y)))), int(0u));
    uint scalarValue49 = sampledTextureValue20.y;
    uint scalarValue50 = sampledTextureValue20.z;
    float bitwiseValue4 = float(sampledTextureValue20.w & 255u);
    float productValue109 = bitwiseValue4 * 0.0039215688593685626983642578125;
    float bitwiseValue5 = float((scalarValue49 >> 8u) & 255u);
    float bitwiseValue6 = float(scalarValue49 & 255u);
    float bitwiseValue7 = float((scalarValue50 >> 8u) & 255u);
    float bitwiseValue8 = float(scalarValue50 & 255u);
    float sampledTextureValue4;
    if (fragmentVectorConstants1.packedValues[96u].x > 0.5)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue17 = texture(sampler2D(normalTexture, normalSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue42 = sampledTextureValue17.x;
    float scalarValue43 = sampledTextureValue17.y;
    vec4 sampledTextureValue18 = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue44 = sampledTextureValue18.x;
    float productValue66 = (scalarValue44 * fragmentVectorConstants1.packedValues[10u].w) + fragmentVectorConstants1.packedValues[11u].w;
    float quotientValue15 = (fragmentVectorConstants1.packedValues[8u].x * varyingColor1.x) / productValue66;
    float quotientValue16 = (fragmentVectorConstants1.packedValues[9u].y * varyingColor1.y) / productValue66;
    float quotientValue17 = fragmentVectorConstants1.packedValues[11u].z / productValue66;
    float sumValue75 = (-0.0) - quotientValue17;
    float multiplyAddValue110 = fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].x, quotientValue16, quotientValue15 * fragmentVectorConstants1.packedValues[4u].x));
    float sumValue76 = multiplyAddValue110 + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue111 = fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].y, quotientValue16, quotientValue15 * fragmentVectorConstants1.packedValues[4u].y));
    float sumValue77 = multiplyAddValue111 + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue112 = fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue16, quotientValue15 * fragmentVectorConstants1.packedValues[4u].z));
    float sumValue78 = multiplyAddValue112 + fragmentVectorConstants1.packedValues[7u].z;
    float quotientValue39 = ((fragmentVectorConstants1.packedValues[110u].x + varyingColor1.x) * fragmentVectorConstants1.packedValues[8u].x) / productValue66;
    float quotientValue40 = ((varyingColor1.y - fragmentVectorConstants1.packedValues[110u].y) * fragmentVectorConstants1.packedValues[9u].y) / productValue66;
    float multiplyAddValue136 = (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].x, quotientValue40, quotientValue39 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) - fragmentVectorConstants1.packedValues[72u].x;
    float multiplyAddValue137 = (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].y, quotientValue40, quotientValue39 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) - fragmentVectorConstants1.packedValues[72u].y;
    float multiplyAddValue138 = (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue17, fma(fragmentVectorConstants1.packedValues[5u].z, quotientValue40, quotientValue39 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z) - fragmentVectorConstants1.packedValues[72u].z;
    float scalarValue66 = dFdxCoarse(quotientValue39);
    float scalarValue67 = dFdxCoarse(quotientValue40);
    float scalarValue47 = dFdxCoarse(quotientValue17);
    float inverseLengthValue23 = inversesqrt(dot(vec3(scalarValue66, scalarValue67, scalarValue47), vec3(scalarValue66, scalarValue67, scalarValue47)));
    float productValue167 = inverseLengthValue23 * scalarValue66;
    float productValue168 = inverseLengthValue23 * scalarValue67;
    float productValue169 = inverseLengthValue23 * scalarValue47;
    float sumValue79 = dFdyCoarse((-0.0) - quotientValue39);
    float sumValue80 = dFdyCoarse((-0.0) - quotientValue40);
    float sumValue40 = dFdyCoarse((-0.0) - quotientValue17);
    float inverseLengthValue24 = inversesqrt(dot(vec3(sumValue79, sumValue80, sumValue40), vec3(sumValue79, sumValue80, sumValue40)));
    float productValue170 = inverseLengthValue24 * sumValue79;
    float productValue171 = inverseLengthValue24 * sumValue80;
    float productValue172 = inverseLengthValue24 * sumValue40;
    float productValue173 = (productValue172 * productValue168) - (productValue171 * productValue169);
    float productValue174 = (productValue170 * productValue169) - (productValue172 * productValue167);
    float productValue175 = (productValue171 * productValue167) - (productValue170 * productValue168);
    float inverseLengthValue25 = inversesqrt(dot(vec3(productValue173, productValue174, productValue175), vec3(productValue173, productValue174, productValue175)));
    float productValue176 = productValue173 * inverseLengthValue25;
    float productValue177 = productValue174 * inverseLengthValue25;
    float productValue178 = productValue175 * inverseLengthValue25;
    float multiplyAddValue139 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue178, fma(fragmentVectorConstants1.packedValues[5u].x, productValue177, productValue176 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue140 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue178, fma(fragmentVectorConstants1.packedValues[5u].y, productValue177, productValue176 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue141 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue178, fma(fragmentVectorConstants1.packedValues[5u].z, productValue177, productValue176 * fragmentVectorConstants1.packedValues[4u].z));
    float inverseLengthValue26 = inversesqrt(dot(vec3(multiplyAddValue139, multiplyAddValue140, multiplyAddValue141), vec3(multiplyAddValue139, multiplyAddValue140, multiplyAddValue141)));
    float quotientValue41 = roundEven((inverseLengthValue26 * multiplyAddValue139) / fragmentVectorConstants1.packedValues[104u].x) * fragmentVectorConstants1.packedValues[104u].x;
    float quotientValue42 = roundEven((inverseLengthValue26 * multiplyAddValue140) / fragmentVectorConstants1.packedValues[104u].x) * fragmentVectorConstants1.packedValues[104u].x;
    float quotientValue43 = roundEven((inverseLengthValue26 * multiplyAddValue141) / fragmentVectorConstants1.packedValues[104u].x) * fragmentVectorConstants1.packedValues[104u].x;
    float inverseLengthValue27 = inversesqrt(dot(vec3(quotientValue41, quotientValue42, quotientValue43), vec3(quotientValue41, quotientValue42, quotientValue43)));
    float productValue179 = inverseLengthValue27 * quotientValue41;
    float productValue180 = inverseLengthValue27 * quotientValue42;
    float productValue181 = inverseLengthValue27 * quotientValue43;
    float productValue182 = fragmentVectorConstants1.packedValues[99u].z * 0.5;
    float quotientValue44 = productValue182 - (multiplyAddValue136 - (floor(multiplyAddValue136 / fragmentVectorConstants1.packedValues[99u].z) * fragmentVectorConstants1.packedValues[99u].z));
    float quotientValue45 = productValue182 - (multiplyAddValue137 - (floor(multiplyAddValue137 / fragmentVectorConstants1.packedValues[99u].z) * fragmentVectorConstants1.packedValues[99u].z));
    float quotientValue46 = productValue182 - (multiplyAddValue138 - (floor(multiplyAddValue138 / fragmentVectorConstants1.packedValues[99u].z) * fragmentVectorConstants1.packedValues[99u].z));
    float dotProductValue13 = dot(vec3(quotientValue44, quotientValue45, quotientValue46), vec3(productValue179, productValue180, productValue181));
    float productValue183 = ((quotientValue44 + multiplyAddValue136) - (dotProductValue13 * productValue179)) + fragmentVectorConstants1.packedValues[72u].x;
    float productValue184 = ((multiplyAddValue137 - (dotProductValue13 * productValue180)) + quotientValue45) + fragmentVectorConstants1.packedValues[72u].y;
    float productValue185 = ((multiplyAddValue138 - (dotProductValue13 * productValue181)) + quotientValue46) + fragmentVectorConstants1.packedValues[72u].z;
    float sumValue42 = 1.0 - abs(scalarValue42);
    float scalarValue48 = abs(scalarValue43);
    float sumValue43 = sumValue42 - scalarValue48;
    bool conditionValue5 = sumValue43 < 0.0;
    float comparisonValue40 = conditionValue5 ? ((1.0 - scalarValue48) * ((scalarValue42 < 0.0) ? (-1.0) : 1.0)) : scalarValue42;
    float comparisonValue41 = conditionValue5 ? (sumValue42 * ((scalarValue43 < 0.0) ? (-1.0) : 1.0)) : scalarValue43;
    float inverseLengthValue16 = inversesqrt(dot(vec3(comparisonValue40, comparisonValue41, sumValue43), vec3(comparisonValue40, comparisonValue41, sumValue43)));
    float productValue90 = comparisonValue40 * inverseLengthValue16;
    float productValue91 = comparisonValue41 * inverseLengthValue16;
    float productValue98 = inverseLengthValue16 * sumValue43;
    float inverseLengthValue17 = inversesqrt(dot(vec3(productValue90, productValue91, productValue98), vec3(productValue90, productValue91, productValue98)));
    float productValue101 = inverseLengthValue17 * productValue90;
    float productValue102 = productValue91 * inverseLengthValue17;
    float productValue103 = inverseLengthValue17 * productValue98;
    float multiplyAddValue119 = fma(fragmentVectorConstants1.packedValues[2u].x, productValue103, fma(fragmentVectorConstants1.packedValues[1u].x, productValue102, productValue101 * fragmentVectorConstants1.packedValues[0u].x));
    float multiplyAddValue120 = fma(fragmentVectorConstants1.packedValues[2u].y, productValue103, fma(fragmentVectorConstants1.packedValues[1u].y, productValue102, productValue101 * fragmentVectorConstants1.packedValues[0u].y));
    float multiplyAddValue121 = fma(fragmentVectorConstants1.packedValues[2u].z, productValue103, fma(fragmentVectorConstants1.packedValues[1u].z, productValue102, productValue101 * fragmentVectorConstants1.packedValues[0u].z));
    float inverseLengthValue18 = inversesqrt(dot(vec3(multiplyAddValue119, multiplyAddValue120, multiplyAddValue121), vec3(multiplyAddValue119, multiplyAddValue120, multiplyAddValue121)));
    float productValue106 = inverseLengthValue18 * multiplyAddValue119;
    float productValue107 = inverseLengthValue18 * multiplyAddValue120;
    float productValue108 = inverseLengthValue18 * multiplyAddValue121;
    uvec2 sampledTextureValue19 = uvec2(textureSize(emissiveAmbientLinearRoughnessTexture, int(0u)));
    uvec4 sampledTextureValue20 = texelFetch(emissiveAmbientLinearRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue19.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(sampledTextureValue19.y)))))) * varyingTexCoord0.y)))), int(0u));
    uint scalarValue49 = sampledTextureValue20.y;
    uint scalarValue50 = sampledTextureValue20.z;
    float bitwiseValue12 = float((sampledTextureValue20.x >> 8u) & 255u) * 0.0039215688593685626983642578125;
    float bitwiseValue4 = float(sampledTextureValue20.w & 255u);
    float productValue109 = bitwiseValue4 * 0.0039215688593685626983642578125;
    float bitwiseValue5 = float((scalarValue49 >> 8u) & 255u);
    float bitwiseValue6 = float(scalarValue49 & 255u);
    float bitwiseValue7 = float((scalarValue50 >> 8u) & 255u);
    float bitwiseValue8 = float(scalarValue50 & 255u);
    float sampledTextureValue4;
    if (fragmentVectorConstants1.packedValues[109u].x > 0.5)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        sampledTextureValue5 = textureLod(sampler3D(materialTexture10, textureSampler10), vec3(varyingTexCoord0.x, varyingTexCoord0.y, 1.0), 0.0).y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        sampledTextureValue4 = textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(varyingTexCoord0.x, varyingTexCoord0.y, 1.0), 0.0).y;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        sampledTextureValue5 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        sampledTextureValue4 = 1.0;
#endif
    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec3 vectorValue2 = vec3(quotientValue, quotientValue1, quotientValue2);
    float nonlinearValue = sqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    float sumValue2 = nonlinearValue + 9.9999997473787516355514526367188e-05;
    float quotientValue3 = quotientValue / sumValue2;
    float quotientValue4 = quotientValue1 / sumValue2;
    float quotientValue5 = quotientValue2 / sumValue2;
    vec3 productValue3 = vec3(inverseLengthValue1 * multiplyAddValue4, inverseLengthValue1 * multiplyAddValue5, inverseLengthValue1 * multiplyAddValue6);
    float quotientValue6 = ((varyingColor1.x + fragmentScalarConstants1.packedValues[388u]) * fragmentScalarConstants1.packedValues[32u]) / multiplyAddValue;
    float quotientValue7 = ((varyingColor1.y - fragmentScalarConstants1.packedValues[389u]) * fragmentScalarConstants1.packedValues[37u]) / multiplyAddValue;
    float scalarValue7 = dFdyCoarse(-quotientValue2);
    float scalarValue8 = dFdxCoarse(quotientValue6);
    float scalarValue9 = dFdxCoarse(quotientValue7);
    float scalarValue10 = dFdyCoarse(-quotientValue6);
    float scalarValue11 = dFdyCoarse(-quotientValue7);
    float scalarValue12 = dFdxCoarse(quotientValue2);
    float productValue6;
    float productValue7;
    float productValue8;
    if (!((fragmentScalarConstants1.packedValues[308u] != 0.0) && (bitwiseValue < 0.02549999766051769256591796875)))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec3 vectorValue2 = vec3(quotientValue, quotientValue1, quotientValue2);
    float nonlinearValue = sqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    float sumValue2 = nonlinearValue + 9.9999997473787516355514526367188e-05;
    float quotientValue3 = quotientValue / sumValue2;
    float quotientValue4 = quotientValue1 / sumValue2;
    float quotientValue5 = quotientValue2 / sumValue2;
    bool conditionValue9 = int(uint(int(fragmentScalarConstants1.packedValues[397u]))) > int(0u);
    float multiplyAddValue169 = conditionValue9 ? ((fma(scalarValue98, productValue256, multiplyAddValue166) + multiplyAddValue157) + fragmentVectorConstants1.packedValues[72u].x) : sumValue113;
    float multiplyAddValue170 = conditionValue9 ? ((fma(scalarValue98, productValue257, multiplyAddValue167) + multiplyAddValue158) + fragmentVectorConstants1.packedValues[72u].y) : sumValue114;
    float multiplyAddValue171 = conditionValue9 ? ((fma(scalarValue98, productValue258, multiplyAddValue168) + multiplyAddValue159) + fragmentVectorConstants1.packedValues[72u].z) : sumValue115;
    vec3 productValue3 = vec3(inverseLengthValue1 * multiplyAddValue4, inverseLengthValue1 * multiplyAddValue5, inverseLengthValue1 * multiplyAddValue6);
    float productValue19;
    float productValue20;
    float productValue21;
    if (!((fragmentScalarConstants1.packedValues[324u] != 0.0) && (bitwiseValue < 0.02549999766051769256591796875)))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float nonlinearValue4 = sqrt(((quotientValue16 * quotientValue16) + (quotientValue15 * quotientValue15)) + (quotientValue17 * quotientValue17));
    float sumValue44 = nonlinearValue4 + 9.9999997473787516355514526367188e-05;
    float quotientValue27 = quotientValue15 / sumValue44;
    float quotientValue28 = quotientValue16 / sumValue44;
    float quotientValue29 = quotientValue17 / sumValue44;
    float sumValue45 = (-0.0) - quotientValue27;
    float sumValue46 = (-0.0) - quotientValue28;
    float sumValue47 = (-0.0) - quotientValue29;
    bool conditionValue6 = int(uint(int(fragmentVectorConstants1.packedValues[88u].y))) > int(0u);
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((fragmentVectorConstants1.packedValues[77u].x != 0.0) && (abs(productValue109) < 9.9999997473787516355514526367188e-05))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float nonlinearValue4 = sqrt(((quotientValue16 * quotientValue16) + (quotientValue15 * quotientValue15)) + (quotientValue17 * quotientValue17));
    float sumValue44 = nonlinearValue4 + 9.9999997473787516355514526367188e-05;
    float quotientValue27 = quotientValue15 / sumValue44;
    float quotientValue28 = quotientValue16 / sumValue44;
    float quotientValue29 = quotientValue17 / sumValue44;
    float sumValue45 = (-0.0) - quotientValue27;
    float sumValue46 = (-0.0) - quotientValue28;
    float sumValue47 = (-0.0) - quotientValue29;
    bool conditionValue7 = int(uint(int(fragmentVectorConstants1.packedValues[99u].y))) > int(0u);
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((fragmentVectorConstants1.packedValues[81u].x != 0.0) && (abs(productValue109) < 9.9999997473787516355514526367188e-05))
#endif
    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue34;
        if (uint(int(fragmentScalarConstants1.packedValues[92u])) == 1u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue28;
        if (uint(int(fragmentScalarConstants1.packedValues[100u])) == 1u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue11 = 0.0;
        intermediateValue12 = 0.0;
        intermediateValue13 = 0.0;
    }
    else
    {
        float productValue45;
        if (uint(int(fragmentVectorConstants1.packedValues[23u].x)) == 1u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue11 = 0.0;
        intermediateValue12 = 0.0;
        intermediateValue13 = 0.0;
    }
    else
    {
        float productValue51;
        if (uint(int(fragmentVectorConstants1.packedValues[25u].x)) == 1u)
#endif
        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float multiplyAddValue7 = (fma(fragmentVectorConstants1.packedValues[6u].x, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].x, quotientValue6, quotientValue7 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) - fragmentVectorConstants1.packedValues[69u].x;
            float multiplyAddValue8 = (fma(fragmentVectorConstants1.packedValues[6u].y, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].y, quotientValue6, quotientValue7 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) - fragmentVectorConstants1.packedValues[69u].y;
            float multiplyAddValue9 = (fma(fragmentVectorConstants1.packedValues[6u].z, quotientValue2, fma(fragmentVectorConstants1.packedValues[4u].z, quotientValue6, quotientValue7 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) - fragmentVectorConstants1.packedValues[69u].z;
            vec3 vectorValue3 = vec3(scalarValue12, scalarValue8, scalarValue9);
            float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
            float productValue4 = inverseLengthValue2 * scalarValue12;
            float productValue5 = inverseLengthValue2 * scalarValue8;
            float productValue9 = inverseLengthValue2 * scalarValue9;
            vec3 vectorValue4 = vec3(scalarValue11, scalarValue7, scalarValue10);
            float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
            float productValue10 = inverseLengthValue3 * scalarValue11;
            float productValue11 = inverseLengthValue3 * scalarValue7;
            float productValue12 = inverseLengthValue3 * scalarValue10;
            float multiplyAddValue10 = fma(productValue9, productValue11, -(productValue10 * productValue4));
            float multiplyAddValue11 = fma(productValue4, productValue12, -(productValue11 * productValue5));
            float multiplyAddValue12 = fma(productValue5, productValue10, -(productValue12 * productValue9));
            vec3 vectorValue5 = vec3(multiplyAddValue10, multiplyAddValue11, multiplyAddValue12);
            float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
            float productValue13 = inverseLengthValue4 * multiplyAddValue10;
            float productValue14 = inverseLengthValue4 * multiplyAddValue11;
            float productValue15 = inverseLengthValue4 * multiplyAddValue12;
            float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue15, fma(fragmentVectorConstants1.packedValues[4u].x, productValue13, productValue14 * fragmentVectorConstants1.packedValues[5u].x));
            float multiplyAddValue14 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue15, fma(fragmentVectorConstants1.packedValues[4u].y, productValue13, productValue14 * fragmentVectorConstants1.packedValues[5u].y));
            float multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue15, fma(fragmentVectorConstants1.packedValues[4u].z, productValue13, productValue14 * fragmentVectorConstants1.packedValues[5u].z));
            vec3 vectorValue6 = vec3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15);
            float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
            float quotientValue8 = roundEven((inverseLengthValue5 * multiplyAddValue13) / fragmentScalarConstants1.packedValues[364u]) * fragmentScalarConstants1.packedValues[364u];
            float quotientValue9 = roundEven((inverseLengthValue5 * multiplyAddValue14) / fragmentScalarConstants1.packedValues[364u]) * fragmentScalarConstants1.packedValues[364u];
            float quotientValue10 = roundEven((inverseLengthValue5 * multiplyAddValue15) / fragmentScalarConstants1.packedValues[364u]) * fragmentScalarConstants1.packedValues[364u];
            vec3 vectorValue7 = vec3(quotientValue8, quotientValue9, quotientValue10);
            float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
            float productValue16 = inverseLengthValue6 * quotientValue8;
            float productValue17 = inverseLengthValue6 * quotientValue9;
            float productValue18 = inverseLengthValue6 * quotientValue10;
            float scalarValue13 = -fragmentScalarConstants1.packedValues[354u];
            float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[354u], 0.5, -fma(scalarValue13, floor(multiplyAddValue7 / fragmentScalarConstants1.packedValues[354u]), multiplyAddValue7));
            float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[354u], 0.5, -fma(scalarValue13, floor(multiplyAddValue8 / fragmentScalarConstants1.packedValues[354u]), multiplyAddValue8));
            float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[354u], 0.5, -fma(scalarValue13, floor(multiplyAddValue9 / fragmentScalarConstants1.packedValues[354u]), multiplyAddValue9));
            float scalarValue14 = -rdDot3Precise2(vec3(multiplyAddValue16, multiplyAddValue17, multiplyAddValue18), vec3(productValue16, productValue17, productValue18));
            bool conditionValue1 = int(uint(int(fragmentScalarConstants1.packedValues[353u]))) > int(0u);
            float multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentScalarConstants1.packedValues[331u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentScalarConstants1.packedValues[330u], fma(fragmentVectorConstants1.packedValues[0u].x, fragmentScalarConstants1.packedValues[328u], fragmentVectorConstants1.packedValues[1u].x * fragmentScalarConstants1.packedValues[329u])));
            float multiplyAddValue20 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentScalarConstants1.packedValues[331u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentScalarConstants1.packedValues[330u], fma(fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[328u], fragmentVectorConstants1.packedValues[1u].y * fragmentScalarConstants1.packedValues[329u])));
            float multiplyAddValue21 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentScalarConstants1.packedValues[331u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentScalarConstants1.packedValues[330u], fma(fragmentVectorConstants1.packedValues[0u].z, fragmentScalarConstants1.packedValues[328u], fragmentVectorConstants1.packedValues[1u].z * fragmentScalarConstants1.packedValues[329u])));
            vec3 vectorValue8 = vec3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21);
            float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
            float productValue22 = spvNMax(rdDot3Precise2(productValue3, vec3(inverseLengthValue7 * multiplyAddValue19, inverseLengthValue7 * multiplyAddValue20, inverseLengthValue7 * multiplyAddValue21)), 0.0);
            float sumValue3 = spvNMax(1.0 - productValue22, 0.0);
            float multiplyAddValue22 = fma(productValue * fragmentScalarConstants1.packedValues[375u], sumValue3, conditionValue1 ? ((fma(scalarValue14, productValue16, multiplyAddValue16) + multiplyAddValue7) + fragmentVectorConstants1.packedValues[69u].x) : (multiplyAddValue1 + fragmentVectorConstants1.packedValues[7u].x));
            float multiplyAddValue23 = fma(productValue1 * fragmentScalarConstants1.packedValues[375u], sumValue3, conditionValue1 ? ((fma(scalarValue14, productValue17, multiplyAddValue17) + multiplyAddValue8) + fragmentVectorConstants1.packedValues[69u].y) : (multiplyAddValue2 + fragmentVectorConstants1.packedValues[7u].y));
            float multiplyAddValue24 = fma(productValue2 * fragmentScalarConstants1.packedValues[375u], sumValue3, conditionValue1 ? ((fma(scalarValue14, productValue18, multiplyAddValue18) + multiplyAddValue9) + fragmentVectorConstants1.packedValues[69u].z) : (multiplyAddValue3 + fragmentVectorConstants1.packedValues[7u].z));
            uint scalarValue15 = uint(int(rdDot4Precise(vec4(spvNClamp(fragmentVectorConstants1.packedValues[36u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[36u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[36u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[36u].w, 0.0, 1.0)), vec4(1.0))));
            bool comparisonValue3 = fragmentScalarConstants1.packedValues[352u] != 0.0;
            float intermediateValue57;
            intermediateValue57 = 1.0;
            uint sumValue6;
            float intermediateValue58;
            uint intermediateValue60;
            uint scalarValue16 = 0u;
            uint scalarValue17 = 0u;
            for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float multiplyAddValue172 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentScalarConstants1.packedValues[347u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentScalarConstants1.packedValues[346u], fma(fragmentVectorConstants1.packedValues[0u].x, fragmentScalarConstants1.packedValues[344u], fragmentVectorConstants1.packedValues[1u].x * fragmentScalarConstants1.packedValues[345u])));
            float multiplyAddValue173 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentScalarConstants1.packedValues[347u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentScalarConstants1.packedValues[346u], fma(fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[344u], fragmentVectorConstants1.packedValues[1u].y * fragmentScalarConstants1.packedValues[345u])));
            float multiplyAddValue174 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentScalarConstants1.packedValues[347u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentScalarConstants1.packedValues[346u], fma(fragmentVectorConstants1.packedValues[0u].z, fragmentScalarConstants1.packedValues[344u], fragmentVectorConstants1.packedValues[1u].z * fragmentScalarConstants1.packedValues[345u])));
            vec3 vectorValue18 = vec3(multiplyAddValue172, multiplyAddValue173, multiplyAddValue174);
            float inverseLengthValue38 = inversesqrt(rdDot3Precise2(vectorValue18, vectorValue18));
            float productValue260 = spvNMax(rdDot3Precise2(productValue3, vec3(inverseLengthValue38 * multiplyAddValue172, inverseLengthValue38 * multiplyAddValue173, inverseLengthValue38 * multiplyAddValue174)), 0.0);
            float sumValue116 = spvNMax(1.0 - productValue260, 0.0);
            float multiplyAddValue175 = fma(productValue * fragmentScalarConstants1.packedValues[427u], sumValue116, multiplyAddValue169);
            float multiplyAddValue176 = fma(productValue1 * fragmentScalarConstants1.packedValues[427u], sumValue116, multiplyAddValue170);
            float multiplyAddValue177 = fma(productValue2 * fragmentScalarConstants1.packedValues[427u], sumValue116, multiplyAddValue171);
            uint scalarValue99 = uint(int(rdDot4Precise(vec4(spvNClamp(fragmentVectorConstants1.packedValues[39u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[39u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[39u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[39u].w, 0.0, 1.0)), vec4(1.0))));
            bool comparisonValue79 = fragmentScalarConstants1.packedValues[396u] != 0.0;
            float intermediateValue66;
            intermediateValue66 = 1.0;
            uint sumValue9;
            float intermediateValue67;
            uint intermediateValue69;
            uint scalarValue16 = 0u;
            uint scalarValue17 = 0u;
            for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float multiplyAddValue122 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentVectorConstants1.packedValues[82u].w, fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[82u].z, fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[82u].y, fragmentVectorConstants1.packedValues[82u].x * fragmentVectorConstants1.packedValues[0u].x)));
            float multiplyAddValue123 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentVectorConstants1.packedValues[82u].w, fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[82u].z, fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[82u].y, fragmentVectorConstants1.packedValues[82u].x * fragmentVectorConstants1.packedValues[0u].y)));
            float multiplyAddValue124 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentVectorConstants1.packedValues[82u].w, fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[82u].z, fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[82u].y, fragmentVectorConstants1.packedValues[82u].x * fragmentVectorConstants1.packedValues[0u].z)));
            float inverseLengthValue19 = inversesqrt(dot(vec3(multiplyAddValue122, multiplyAddValue123, multiplyAddValue124), vec3(multiplyAddValue122, multiplyAddValue123, multiplyAddValue124)));
            float dotProductValue2 = spvNMax(dot(vec3(productValue106, productValue107, productValue108), vec3(inverseLengthValue19 * multiplyAddValue122, inverseLengthValue19 * multiplyAddValue123, inverseLengthValue19 * multiplyAddValue124)), 0.0);
            float productValue110 = spvNClamp(1.0 - dotProductValue2, 0.0, 1.0) * fragmentVectorConstants1.packedValues[93u].w;
            float comparisonValue42 = (productValue110 * productValue101) + (conditionValue6 ? (((quotientValue24 + multiplyAddValue113) - (dotProductValue * productValue83)) + fragmentVectorConstants1.packedValues[69u].x) : (multiplyAddValue110 + fragmentVectorConstants1.packedValues[7u].x));
            float comparisonValue43 = (productValue110 * productValue102) + (conditionValue6 ? (((multiplyAddValue114 - (dotProductValue * productValue84)) + quotientValue25) + fragmentVectorConstants1.packedValues[69u].y) : (multiplyAddValue111 + fragmentVectorConstants1.packedValues[7u].y));
            float comparisonValue44 = (productValue110 * productValue103) + (conditionValue6 ? (((multiplyAddValue115 - (dotProductValue * productValue85)) + quotientValue26) + fragmentVectorConstants1.packedValues[69u].z) : (multiplyAddValue112 + fragmentVectorConstants1.packedValues[7u].z));
            uint dotProductValue3 = uint(int(dot(vec4(spvNClamp(fragmentVectorConstants1.packedValues[36u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[36u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[36u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[36u].w, 0.0, 1.0)), vec4(1.0))));
            float intermediateValue16;
            if (int(dotProductValue3) > int(0u))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float multiplyAddValue142 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentVectorConstants1.packedValues[86u].w, fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[86u].z, fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[86u].y, fragmentVectorConstants1.packedValues[86u].x * fragmentVectorConstants1.packedValues[0u].x)));
            float multiplyAddValue143 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentVectorConstants1.packedValues[86u].w, fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[86u].z, fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[86u].y, fragmentVectorConstants1.packedValues[86u].x * fragmentVectorConstants1.packedValues[0u].y)));
            float multiplyAddValue144 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentVectorConstants1.packedValues[86u].w, fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[86u].z, fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[86u].y, fragmentVectorConstants1.packedValues[86u].x * fragmentVectorConstants1.packedValues[0u].z)));
            float inverseLengthValue28 = inversesqrt(dot(vec3(multiplyAddValue142, multiplyAddValue143, multiplyAddValue144), vec3(multiplyAddValue142, multiplyAddValue143, multiplyAddValue144)));
            float dotProductValue14 = spvNMax(dot(vec3(productValue106, productValue107, productValue108), vec3(inverseLengthValue28 * multiplyAddValue142, inverseLengthValue28 * multiplyAddValue143, inverseLengthValue28 * multiplyAddValue144)), 0.0);
            float productValue186 = spvNClamp(1.0 - dotProductValue14, 0.0, 1.0) * fragmentVectorConstants1.packedValues[106u].w;
            float comparisonValue58 = (productValue186 * productValue101) + (conditionValue7 ? productValue183 : sumValue76);
            float comparisonValue59 = (productValue186 * productValue102) + (conditionValue7 ? productValue184 : sumValue77);
            float comparisonValue60 = (productValue186 * productValue103) + (conditionValue7 ? productValue185 : sumValue78);
            uint dotProductValue15 = uint(int(dot(vec4(spvNClamp(fragmentVectorConstants1.packedValues[39u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[39u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[39u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[39u].w, 0.0, 1.0)), vec4(1.0))));
            float intermediateValue18;
            if (int(dotProductValue15) > int(0u))
#endif
            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                if (int(scalarValue15) <= int(scalarValue17))
                {
                    break;
                }
                uint comparisonValue4 = uint(min(int(uint(int((scalarValue17 == 3u) ? fragmentVectorConstants1.packedValues[36u].w : ((scalarValue17 == 2u) ? fragmentVectorConstants1.packedValues[36u].z : ((scalarValue17 == 1u) ? fragmentVectorConstants1.packedValues[36u].y : ((scalarValue17 == 0u) ? fragmentVectorConstants1.packedValues[36u].x : 0.0))))) + scalarValue16), int(8u)));
                intermediateValue58 = intermediateValue57;
                intermediateValue60 = scalarValue16;
                float comparisonValue9;
                uint intermediateValue77;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                if (int(scalarValue99) <= int(scalarValue17))
                {
                    break;
                }
                uint comparisonValue80 = uint(min(int(uint(int((scalarValue17 == 3u) ? fragmentVectorConstants1.packedValues[39u].w : ((scalarValue17 == 2u) ? fragmentVectorConstants1.packedValues[39u].z : ((scalarValue17 == 1u) ? fragmentVectorConstants1.packedValues[39u].y : ((scalarValue17 == 0u) ? fragmentVectorConstants1.packedValues[39u].x : 0.0))))) + scalarValue16), int(8u)));
                intermediateValue67 = intermediateValue66;
                intermediateValue69 = scalarValue16;
                float comparisonValue9;
                uint intermediateValue100;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float intermediateValue17;
                uint intermediateValue20;
                float scalarValue51 = 1.0;
                uint scalarValue16 = 0u;
                uint scalarValue17 = 0u;
                uint sumValue18;
                bool intermediateValue22;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                float intermediateValue19;
                uint intermediateValue28;
                float scalarValue51 = 1.0;
                uint scalarValue16 = 0u;
                uint scalarValue17 = 0u;
                uint sumValue22;
                bool intermediateValue30;
#endif
                for (;;)
                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    if (int(comparisonValue4) <= int(intermediateValue60))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    if (int(comparisonValue80) <= int(intermediateValue69))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    sumValue18 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[scalarValue17 + 144u])) + scalarValue16), int(8u)));
                    intermediateValue22 = int(scalarValue16) < int(sumValue18);
                    uint branchMergedValue;
                    float branchMergedValue5;
                    if (intermediateValue22)
                    {
                        float intermediateValue29;
                        uint intermediateValue30;
                        float scalarValue52 = scalarValue51;
                        uint scalarValue53 = scalarValue16;
                        float multiplyAddValue26;
                        float multiplyAddValue27;
                        float multiplyAddValue28;
                        bool comparisonValue9;
                        for (;;)
                        {
                            uint bitwiseValue9 = scalarValue53 << 2u;
                            uint sumValue49 = bitwiseValue9 + 37u;
                            uint sumValue50 = bitwiseValue9 + 38u;
                            uint sumValue51 = bitwiseValue9 + 39u;
                            uint sumValue53 = bitwiseValue9 + 40u;
                            multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[sumValue51].x, comparisonValue44, fma(fragmentVectorConstants1.packedValues[sumValue50].x, comparisonValue43, fragmentVectorConstants1.packedValues[sumValue49].x * comparisonValue42)) + fragmentVectorConstants1.packedValues[sumValue53].x;
                            multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[sumValue51].y, comparisonValue44, fma(fragmentVectorConstants1.packedValues[sumValue50].y, comparisonValue43, fragmentVectorConstants1.packedValues[sumValue49].y * comparisonValue42)) + fragmentVectorConstants1.packedValues[sumValue53].y;
                            multiplyAddValue28 = fma(fragmentVectorConstants1.packedValues[sumValue51].z, comparisonValue44, fma(fragmentVectorConstants1.packedValues[sumValue50].z, comparisonValue43, fragmentVectorConstants1.packedValues[sumValue49].z * comparisonValue42)) + fragmentVectorConstants1.packedValues[sumValue53].z;
                            comparisonValue9 = ((abs(multiplyAddValue26) <= 1.0) && (abs(multiplyAddValue27) <= 1.0)) && (abs(multiplyAddValue28) <= 1.0);
                            uint branchMergedValue1;
                            float branchMergedValue6;
                            if (comparisonValue9)
                            {
                                uint sumValue54 = scalarValue53 + 12u;
                                float sumValue55 = spvNMin(spvNMax(dotProductValue2, fragmentScalarConstants1.packedValues[scalarValue53 + 96u]), 1.0);
                                float nonlinearValue5 = (sqrt(1.0 - (sumValue55 * sumValue55)) / sumValue55) * fragmentVectorConstants1.packedValues[sumValue54].z;
                                float productValue111 = (multiplyAddValue26 * 0.5) + 0.5;
                                float productValue112 = 0.5 - (multiplyAddValue27 * 0.5);
                                uint comparisonValue45 = (fragmentVectorConstants1.packedValues[88u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[sumValue54].w + 0.5))), int(1u)))), int(9u)));
                                uint quotientValue30 = uint(int(comparisonValue45) / int(2u));
                                float intermediateValue49;
                                if (int(comparisonValue45) > int(0u))
                                {
                                    float sumValue33;
                                    float intermediateValue56;
                                    uint intermediateValue57;
                                    float scalarValue54 = 0.0;
                                    uint scalarValue19 = 0u;
                                    for (;;)
                                    {
                                        intermediateValue56 = scalarValue54;
                                        intermediateValue57 = 0u;
                                        float intermediateValue61;
                                        float productValue99;
                                        vec4 sampledTextureValue10;
                                        float intermediateValue58;
                                        float intermediateValue59;
                                        float productValue100;
                                        bool comparisonValue20;
                                        float sumValue37;
                                        for (;;)
                                        {
                                            float productValue113 = (productValue111 + ((float(int(intermediateValue57 - quotientValue30)) + 0.5) * fragmentVectorConstants1.packedValues[93u].x)) * fragmentVectorConstants1.packedValues[sumValue54].x;
                                            productValue99 = (productValue112 + (fragmentVectorConstants1.packedValues[93u].x * (float(int(scalarValue19 - quotientValue30)) + 0.5))) * fragmentVectorConstants1.packedValues[sumValue54].x;
                                            sampledTextureValue10 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue113, productValue99, float(int(scalarValue53))));
                                            intermediateValue58 = sampledTextureValue10.w;
                                            intermediateValue59 = fragmentVectorConstants1.packedValues[93u].z;
                                            productValue100 = fract((productValue113 * intermediateValue59) + 0.5);
                                            comparisonValue20 = fragmentVectorConstants1.packedValues[88u].x != 0.0;
                                            sumValue37 = (multiplyAddValue28 - fragmentVectorConstants1.packedValues[sumValue54].y) - nonlinearValue5;
                                            float branchMergedValue4;
                                            if (comparisonValue20)
                                            {
                                                branchMergedValue4 = float(intermediateValue58 >= sumValue37);
                                            }
                                            else
                                            {
                                                float comparisonValue46 = (sampledTextureValue10.x < sumValue37) ? 0.0 : 1.0;
                                                float comparisonValue47 = (intermediateValue58 < sumValue37) ? 0.0 : 1.0;
                                                float comparisonValue48 = ((((sampledTextureValue10.z < sumValue37) ? 0.0 : 1.0) - comparisonValue47) * productValue100) + comparisonValue47;
                                                branchMergedValue4 = (fract((productValue99 * intermediateValue59) + 0.5) * ((((((sampledTextureValue10.y < sumValue37) ? 0.0 : 1.0) - comparisonValue46) * productValue100) + comparisonValue46) - comparisonValue48)) + comparisonValue48;
                                            }
                                            intermediateValue61 = branchMergedValue4;
                                            sumValue33 = intermediateValue61 + intermediateValue56;
                                            uint sumValue56 = intermediateValue57 + 1u;
                                            if (sumValue56 == comparisonValue45)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                intermediateValue56 = sumValue33;
                                                intermediateValue57 = sumValue56;
                                                continue;
                                            }
                                        }
                                        uint sumValue58 = scalarValue19 + 1u;
                                        if (sumValue58 == comparisonValue45)
                                        {
                                            break;
                                        }
                                        else
                                        {
                                            scalarValue54 = sumValue33;
                                            scalarValue19 = sumValue58;
                                            continue;
                                        }
                                    }
                                    intermediateValue49 = sumValue33;
                                }
                                else
                                {
                                    intermediateValue49 = 0.0;
                                }
                                branchMergedValue1 = sumValue18;
                                branchMergedValue6 = spvNMin(scalarValue52, intermediateValue49 / float(int(comparisonValue45 * comparisonValue45)));
                            }
                            else
                            {
                                branchMergedValue1 = scalarValue53 + 1u;
                                branchMergedValue6 = scalarValue52;
                            }
                            intermediateValue30 = branchMergedValue1;
                            intermediateValue29 = branchMergedValue6;
                            if (int(intermediateValue30) < int(sumValue18))
                            {
                                scalarValue52 = intermediateValue29;
                                scalarValue53 = intermediateValue30;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                        branchMergedValue = intermediateValue30;
                        branchMergedValue5 = intermediateValue29;
                    }
                    else
                    {
                        branchMergedValue = scalarValue16;
                        branchMergedValue5 = scalarValue51;
                    }
                    intermediateValue20 = branchMergedValue;
                    intermediateValue17 = branchMergedValue5;
                    uint sumValue59 = scalarValue17 + 1u;
                    if (sumValue59 == dotProductValue3)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    sumValue22 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[scalarValue17 + 156u])) + scalarValue16), int(8u)));
                    intermediateValue30 = int(scalarValue16) < int(sumValue22);
                    float branchMergedValue;
                    uint branchMergedValue6;
                    if (intermediateValue30)
                    {
                        float intermediateValue39;
                        uint intermediateValue40;
                        float scalarValue52 = scalarValue51;
                        uint scalarValue53 = scalarValue16;
                        float multiplyAddValue25;
                        float multiplyAddValue26;
                        float multiplyAddValue27;
                        bool comparisonValue12;
                        for (;;)
                        {
                            uint bitwiseValue9 = scalarValue53 << 2u;
                            uint sumValue53 = bitwiseValue9 + 40u;
                            uint sumValue81 = bitwiseValue9 + 41u;
                            uint sumValue82 = bitwiseValue9 + 42u;
                            uint sumValue83 = bitwiseValue9 + 43u;
                            multiplyAddValue25 = fma(fragmentVectorConstants1.packedValues[sumValue82].x, comparisonValue60, fma(fragmentVectorConstants1.packedValues[sumValue81].x, comparisonValue59, fragmentVectorConstants1.packedValues[sumValue53].x * comparisonValue58)) + fragmentVectorConstants1.packedValues[sumValue83].x;
                            multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[sumValue82].y, comparisonValue60, fma(fragmentVectorConstants1.packedValues[sumValue81].y, comparisonValue59, fragmentVectorConstants1.packedValues[sumValue53].y * comparisonValue58)) + fragmentVectorConstants1.packedValues[sumValue83].y;
                            multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[sumValue82].z, comparisonValue60, fma(fragmentVectorConstants1.packedValues[sumValue81].z, comparisonValue59, fragmentVectorConstants1.packedValues[sumValue53].z * comparisonValue58)) + fragmentVectorConstants1.packedValues[sumValue83].z;
                            comparisonValue12 = ((abs(multiplyAddValue25) <= 1.0) && (abs(multiplyAddValue26) <= 1.0)) && (abs(multiplyAddValue27) <= 1.0);
                            uint branchMergedValue1;
                            float branchMergedValue7;
                            if (comparisonValue12)
                            {
                                uint sumValue54 = scalarValue53 + 12u;
                                float sumValue84 = spvNMin(spvNMax(dotProductValue14, fragmentScalarConstants1.packedValues[scalarValue53 + 104u]), 1.0);
                                float nonlinearValue8 = (sqrt(1.0 - (sumValue84 * sumValue84)) / sumValue84) * fragmentVectorConstants1.packedValues[sumValue54].z;
                                float productValue187 = (multiplyAddValue25 * 0.5) + 0.5;
                                float productValue188 = 0.5 - (multiplyAddValue26 * 0.5);
                                uint comparisonValue61 = (fragmentVectorConstants1.packedValues[99u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[sumValue54].w + 0.5))), int(1u)))), int(9u)));
                                uint quotientValue47 = uint(int(comparisonValue61) / int(2u));
                                float intermediateValue71;
                                if (int(comparisonValue61) > int(0u))
                                {
                                    float sumValue48;
                                    float intermediateValue84;
                                    uint intermediateValue85;
                                    float scalarValue54 = 0.0;
                                    uint scalarValue19 = 0u;
                                    for (;;)
                                    {
                                        intermediateValue84 = scalarValue54;
                                        intermediateValue85 = 0u;
                                        float intermediateValue92;
                                        float productValue126;
                                        vec4 sampledTextureValue12;
                                        float intermediateValue86;
                                        float intermediateValue87;
                                        float productValue127;
                                        bool comparisonValue23;
                                        float sumValue52;
                                        for (;;)
                                        {
                                            float productValue189 = (productValue187 + ((float(int(intermediateValue85 - quotientValue47)) + 0.5) * fragmentVectorConstants1.packedValues[106u].x)) * fragmentVectorConstants1.packedValues[sumValue54].x;
                                            productValue126 = (productValue188 + (fragmentVectorConstants1.packedValues[106u].x * (float(int(scalarValue19 - quotientValue47)) + 0.5))) * fragmentVectorConstants1.packedValues[sumValue54].x;
                                            sampledTextureValue12 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue189, productValue126, float(int(scalarValue53))));
                                            intermediateValue86 = sampledTextureValue12.w;
                                            intermediateValue87 = fragmentVectorConstants1.packedValues[106u].z;
                                            productValue127 = fract((productValue189 * intermediateValue87) + 0.5);
                                            comparisonValue23 = fragmentVectorConstants1.packedValues[99u].x != 0.0;
                                            sumValue52 = (multiplyAddValue27 - fragmentVectorConstants1.packedValues[sumValue54].y) - nonlinearValue8;
                                            float branchMergedValue5;
                                            if (comparisonValue23)
                                            {
                                                branchMergedValue5 = float(intermediateValue86 >= sumValue52);
                                            }
                                            else
                                            {
                                                float comparisonValue62 = (sampledTextureValue12.x < sumValue52) ? 0.0 : 1.0;
                                                float comparisonValue63 = (intermediateValue86 < sumValue52) ? 0.0 : 1.0;
                                                float comparisonValue64 = ((((sampledTextureValue12.z < sumValue52) ? 0.0 : 1.0) - comparisonValue63) * productValue127) + comparisonValue63;
                                                branchMergedValue5 = (fract((productValue126 * intermediateValue87) + 0.5) * ((((((sampledTextureValue12.y < sumValue52) ? 0.0 : 1.0) - comparisonValue62) * productValue127) + comparisonValue62) - comparisonValue64)) + comparisonValue64;
                                            }
                                            intermediateValue92 = branchMergedValue5;
                                            sumValue48 = intermediateValue92 + intermediateValue84;
                                            uint sumValue85 = intermediateValue85 + 1u;
                                            if (sumValue85 == comparisonValue61)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                intermediateValue84 = sumValue48;
                                                intermediateValue85 = sumValue85;
                                                continue;
                                            }
                                        }
                                        uint sumValue58 = scalarValue19 + 1u;
                                        if (sumValue58 == comparisonValue61)
                                        {
                                            break;
                                        }
                                        else
                                        {
                                            scalarValue54 = sumValue48;
                                            scalarValue19 = sumValue58;
                                            continue;
                                        }
                                    }
                                    intermediateValue71 = sumValue48;
                                }
                                else
                                {
                                    intermediateValue71 = 0.0;
                                }
                                branchMergedValue1 = sumValue22;
                                branchMergedValue7 = spvNMin(scalarValue52, intermediateValue71 / float(int(comparisonValue61 * comparisonValue61)));
                            }
                            else
                            {
                                branchMergedValue1 = scalarValue53 + 1u;
                                branchMergedValue7 = scalarValue52;
                            }
                            intermediateValue40 = branchMergedValue1;
                            intermediateValue39 = branchMergedValue7;
                            if (int(intermediateValue40) < int(sumValue22))
                            {
                                scalarValue52 = intermediateValue39;
                                scalarValue53 = intermediateValue40;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                        branchMergedValue = intermediateValue39;
                        branchMergedValue6 = intermediateValue40;
                    }
                    else
                    {
                        branchMergedValue = scalarValue51;
                        branchMergedValue6 = scalarValue16;
                    }
                    intermediateValue19 = branchMergedValue;
                    intermediateValue28 = branchMergedValue6;
                    uint sumValue59 = scalarValue17 + 1u;
                    if (sumValue59 == dotProductValue15)
#endif
                    {
                        break;
                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    uint bitwiseValue2 = intermediateValue60 << 2u;
                    uint sumValue4 = bitwiseValue2 + 38u;
                    uint sumValue5 = bitwiseValue2 + 37u;
                    uint sumValue7 = bitwiseValue2 + 39u;
                    uint sumValue8 = bitwiseValue2 + 40u;
                    float multiplyAddValue29 = fma(fragmentVectorConstants1.packedValues[sumValue7].x, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[sumValue5].x, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[sumValue4].x)) + fragmentVectorConstants1.packedValues[sumValue8].x;
                    float multiplyAddValue30 = fma(fragmentVectorConstants1.packedValues[sumValue7].y, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[sumValue5].y, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[sumValue4].y)) + fragmentVectorConstants1.packedValues[sumValue8].y;
                    float multiplyAddValue31 = fma(fragmentVectorConstants1.packedValues[sumValue7].z, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[sumValue5].z, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[sumValue4].z)) + fragmentVectorConstants1.packedValues[sumValue8].z;
                    if (((abs(multiplyAddValue29) <= 1.0) && (abs(multiplyAddValue30) <= 1.0)) && (abs(multiplyAddValue31) <= 1.0))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    uint bitwiseValue14 = intermediateValue69 << 2u;
                    uint sumValue117 = bitwiseValue14 + 41u;
                    uint sumValue118 = bitwiseValue14 + 40u;
                    uint sumValue119 = bitwiseValue14 + 42u;
                    uint sumValue120 = bitwiseValue14 + 43u;
                    float multiplyAddValue178 = fma(fragmentVectorConstants1.packedValues[sumValue119].x, multiplyAddValue177, fma(fragmentVectorConstants1.packedValues[sumValue118].x, multiplyAddValue175, multiplyAddValue176 * fragmentVectorConstants1.packedValues[sumValue117].x)) + fragmentVectorConstants1.packedValues[sumValue120].x;
                    float multiplyAddValue179 = fma(fragmentVectorConstants1.packedValues[sumValue119].y, multiplyAddValue177, fma(fragmentVectorConstants1.packedValues[sumValue118].y, multiplyAddValue175, multiplyAddValue176 * fragmentVectorConstants1.packedValues[sumValue117].y)) + fragmentVectorConstants1.packedValues[sumValue120].y;
                    float multiplyAddValue180 = fma(fragmentVectorConstants1.packedValues[sumValue119].z, multiplyAddValue177, fma(fragmentVectorConstants1.packedValues[sumValue118].z, multiplyAddValue175, multiplyAddValue176 * fragmentVectorConstants1.packedValues[sumValue117].z)) + fragmentVectorConstants1.packedValues[sumValue120].z;
                    if (((abs(multiplyAddValue178) <= 1.0) && (abs(multiplyAddValue179) <= 1.0)) && (abs(multiplyAddValue180) <= 1.0))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    else
#endif
                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                        float comparisonValue6 = spvNMin(spvNMax(productValue22, (intermediateValue60 == 3u) ? fragmentVectorConstants1.packedValues[24u].w : ((intermediateValue60 == 2u) ? fragmentVectorConstants1.packedValues[24u].z : ((intermediateValue60 == 1u) ? fragmentVectorConstants1.packedValues[24u].y : ((intermediateValue60 == 0u) ? fragmentVectorConstants1.packedValues[24u].x : 0.0)))), 1.0);
                        float multiplyAddValue32 = fma(multiplyAddValue29, 0.5, 0.5);
                        uint clampedValue = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[(((16u * intermediateValue60) + 192u) + 12u) >> 2u] + 0.5))), int(1u), int(9u)));
                        bool conditionValue2 = !comparisonValue3;
                        uint comparisonValue7 = (comparisonValue3 ? 1u : clampedValue) >> 1u;
                        float multiplyAddValue33 = 1.0 - fma(multiplyAddValue30, 0.5, 0.5);
                        float scalarValue18 = rdSignedBitsToFloat(intermediateValue60);
                        float multiplyAddValue35 = multiplyAddValue31 - fma(fragmentScalarConstants1.packedValues[(((16u * intermediateValue60) + 192u) + 8u) >> 2u], sqrt(fma(-comparisonValue6, comparisonValue6, 1.0)) / comparisonValue6, fragmentScalarConstants1.packedValues[(((16u * intermediateValue60) + 192u) + 4u) >> 2u]);
                        float intermediateValue93;
                        intermediateValue93 = 0.0;
                        uint sumValue17;
                        float intermediateValue94;
                        uint scalarValue19 = 0u;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                        float comparisonValue81 = spvNMin(spvNMax(productValue260, (intermediateValue69 == 3u) ? fragmentVectorConstants1.packedValues[26u].w : ((intermediateValue69 == 2u) ? fragmentVectorConstants1.packedValues[26u].z : ((intermediateValue69 == 1u) ? fragmentVectorConstants1.packedValues[26u].y : ((intermediateValue69 == 0u) ? fragmentVectorConstants1.packedValues[26u].x : 0.0)))), 1.0);
                        float multiplyAddValue181 = fma(multiplyAddValue178, 0.5, 0.5);
                        uint clampedValue2 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[(((16u * intermediateValue69) + 192u) + 12u) >> 2u] + 0.5))), int(1u), int(9u)));
                        bool conditionValue10 = !comparisonValue79;
                        uint comparisonValue82 = (comparisonValue79 ? 1u : clampedValue2) >> 1u;
                        float multiplyAddValue182 = 1.0 - fma(multiplyAddValue179, 0.5, 0.5);
                        float scalarValue100 = rdSignedBitsToFloat(intermediateValue69);
                        float multiplyAddValue183 = multiplyAddValue180 - fma(fragmentScalarConstants1.packedValues[(((16u * intermediateValue69) + 192u) + 8u) >> 2u], sqrt(fma(-comparisonValue81, comparisonValue81, 1.0)) / comparisonValue81, fragmentScalarConstants1.packedValues[(((16u * intermediateValue69) + 192u) + 4u) >> 2u]);
                        float intermediateValue133;
                        intermediateValue133 = 0.0;
                        uint sumValue28;
                        float intermediateValue134;
                        uint scalarValue19 = 0u;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                        scalarValue51 = intermediateValue17;
                        scalarValue16 = intermediateValue20;
                        scalarValue17 = sumValue59;
                        continue;
                    }
                }
                intermediateValue16 = intermediateValue17;
            }
            else
            {
                intermediateValue16 = 1.0;
            }
            float intermediateValue24;
            if (int(uint(int(fragmentVectorConstants1.packedValues[20u].x))) > int(0u))
            {
                float scalarValue55 = spvNMin(spvNMax(dotProductValue2, fragmentVectorConstants1.packedValues[24u].x), 1.0);
                float multiplyAddValue125 = spvNMin(((fragmentVectorConstants1.packedValues[81u].z - fragmentVectorConstants1.packedValues[12u].y) + fma(fragmentVectorConstants1.packedValues[80u].z, comparisonValue44, fma(fragmentVectorConstants1.packedValues[79u].z, comparisonValue43, fragmentVectorConstants1.packedValues[78u].z * comparisonValue42))) - ((sqrt(1.0 - (scalarValue55 * scalarValue55)) / scalarValue55) * fragmentVectorConstants1.packedValues[12u].z), 1.0);
                float multiplyAddValue126 = (((fma(fragmentVectorConstants1.packedValues[80u].x, comparisonValue44, fma(fragmentVectorConstants1.packedValues[79u].x, comparisonValue43, fragmentVectorConstants1.packedValues[78u].x * comparisonValue42)) + fragmentVectorConstants1.packedValues[81u].x) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[20u].y;
                float multiplyAddValue127 = (0.5 - ((fma(fragmentVectorConstants1.packedValues[80u].y, comparisonValue44, fma(fragmentVectorConstants1.packedValues[79u].y, comparisonValue43, fragmentVectorConstants1.packedValues[78u].y * comparisonValue42)) + fragmentVectorConstants1.packedValues[81u].y) * 0.5)) * fragmentVectorConstants1.packedValues[20u].y;
                uint comparisonValue49 = (fragmentVectorConstants1.packedValues[88u].x != 0.0) ? 1u : 2u;
                uint bitwiseValue10 = comparisonValue49 >> 1u;
                float branchMergedValue7;
                if ((multiplyAddValue127 < fragmentVectorConstants1.packedValues[20u].y) && (((multiplyAddValue126 >= 0.0) && (multiplyAddValue126 < fragmentVectorConstants1.packedValues[20u].y)) && (multiplyAddValue127 >= 0.0)))
                {
                    float dotProductValue4 = dot(vec4(fragmentVectorConstants1.packedValues[36u]), vec4(1.0)) + 1.0;
                    float sumValue25;
                    float intermediateValue45;
                    uint intermediateValue46;
                    float scalarValue56 = 0.0;
                    uint scalarValue20 = 0u;
                    for (;;)
                    {
                        intermediateValue45 = scalarValue56;
                        intermediateValue46 = 0u;
                        float intermediateValue55;
                        float productValue92;
                        float productValue93;
                        bool comparisonValue11;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                        scalarValue51 = intermediateValue19;
                        scalarValue16 = intermediateValue28;
                        scalarValue17 = sumValue59;
                        continue;
                    }
                }
                intermediateValue18 = intermediateValue19;
            }
            else
            {
                intermediateValue18 = 1.0;
            }
            float intermediateValue32;
            if (int(uint(int(fragmentVectorConstants1.packedValues[20u].x))) > int(0u))
            {
                float scalarValue68 = spvNMin(spvNMax(dotProductValue14, fragmentVectorConstants1.packedValues[26u].x), 1.0);
                float multiplyAddValue145 = spvNMin(((fragmentVectorConstants1.packedValues[85u].z - fragmentVectorConstants1.packedValues[12u].y) + fma(fragmentVectorConstants1.packedValues[84u].z, comparisonValue60, fma(fragmentVectorConstants1.packedValues[83u].z, comparisonValue59, fragmentVectorConstants1.packedValues[82u].z * comparisonValue58))) - ((sqrt(1.0 - (scalarValue68 * scalarValue68)) / scalarValue68) * fragmentVectorConstants1.packedValues[12u].z), 1.0);
                float multiplyAddValue146 = (((fma(fragmentVectorConstants1.packedValues[84u].x, comparisonValue60, fma(fragmentVectorConstants1.packedValues[83u].x, comparisonValue59, fragmentVectorConstants1.packedValues[82u].x * comparisonValue58)) + fragmentVectorConstants1.packedValues[85u].x) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[20u].y;
                float multiplyAddValue147 = (0.5 - ((fma(fragmentVectorConstants1.packedValues[84u].y, comparisonValue60, fma(fragmentVectorConstants1.packedValues[83u].y, comparisonValue59, fragmentVectorConstants1.packedValues[82u].y * comparisonValue58)) + fragmentVectorConstants1.packedValues[85u].y) * 0.5)) * fragmentVectorConstants1.packedValues[20u].y;
                uint comparisonValue65 = (fragmentVectorConstants1.packedValues[99u].x != 0.0) ? 1u : 2u;
                uint bitwiseValue13 = comparisonValue65 >> 1u;
                float branchMergedValue12;
                if ((multiplyAddValue147 < fragmentVectorConstants1.packedValues[20u].y) && (((multiplyAddValue146 >= 0.0) && (multiplyAddValue146 < fragmentVectorConstants1.packedValues[20u].y)) && (multiplyAddValue147 >= 0.0)))
                {
                    float dotProductValue16 = dot(vec4(fragmentVectorConstants1.packedValues[39u]), vec4(1.0)) + 1.0;
                    float sumValue29;
                    float intermediateValue67;
                    uint intermediateValue68;
                    float scalarValue56 = 0.0;
                    uint scalarValue20 = 0u;
                    for (;;)
                    {
                        intermediateValue67 = scalarValue56;
                        intermediateValue68 = 0u;
                        float intermediateValue78;
                        float productValue104;
                        float productValue105;
                        bool comparisonValue14;
#endif
                        for (;;)
                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                            if ((comparisonValue3 && (int(scalarValue19) >= int(1u))) || ((int(clampedValue) <= int(scalarValue19)) && conditionValue2))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                            if ((comparisonValue79 && (int(scalarValue19) >= int(1u))) || (conditionValue10 && (int(clampedValue2) <= int(scalarValue19))))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                            float productValue114 = fragmentVectorConstants1.packedValues[20u].y * fragmentVectorConstants1.packedValues[20u].z;
                            productValue92 = (productValue114 * (float(int(intermediateValue46 - bitwiseValue10)) + 0.5)) + multiplyAddValue126;
                            productValue93 = (productValue114 * (float(int(scalarValue20 - bitwiseValue10)) + 0.5)) + multiplyAddValue127;
                            comparisonValue11 = fragmentVectorConstants1.packedValues[88u].x != 0.0;
                            float branchMergedValue2;
                            if (comparisonValue11)
                            {
                                branchMergedValue2 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue92, productValue93, dotProductValue4), 0.0).x >= multiplyAddValue125);
                            }
                            else
                            {
                                vec4 sampledTextureValue21 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue92, productValue93, dotProductValue4));
                                float productValue118 = fract((fragmentVectorConstants1.packedValues[93u].z * productValue92) + 0.5);
                                float comparisonValue50 = (sampledTextureValue21.x < multiplyAddValue125) ? 0.0 : 1.0;
                                float comparisonValue51 = (sampledTextureValue21.w < multiplyAddValue125) ? 0.0 : 1.0;
                                float comparisonValue52 = ((((sampledTextureValue21.z < multiplyAddValue125) ? 0.0 : 1.0) - comparisonValue51) * productValue118) + comparisonValue51;
                                branchMergedValue2 = (((((((sampledTextureValue21.y < multiplyAddValue125) ? 0.0 : 1.0) - comparisonValue50) * productValue118) + comparisonValue50) - comparisonValue52) * fract((fragmentVectorConstants1.packedValues[93u].z * productValue93) + 0.5)) + comparisonValue52;
                            }
                            intermediateValue55 = branchMergedValue2;
                            sumValue25 = intermediateValue55 + intermediateValue45;
                            uint sumValue60 = intermediateValue46 + 1u;
                            if (int(sumValue60) < int(comparisonValue49))
                            {
                                intermediateValue45 = sumValue25;
                                intermediateValue46 = sumValue60;
                                continue;
                            }
                            else
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                            float productValue114 = fragmentVectorConstants1.packedValues[20u].y * fragmentVectorConstants1.packedValues[20u].z;
                            productValue104 = (productValue114 * (float(int(intermediateValue68 - bitwiseValue13)) + 0.5)) + multiplyAddValue146;
                            productValue105 = (productValue114 * (float(int(scalarValue20 - bitwiseValue13)) + 0.5)) + multiplyAddValue147;
                            comparisonValue14 = fragmentVectorConstants1.packedValues[99u].x != 0.0;
                            float branchMergedValue2;
                            if (comparisonValue14)
                            {
                                branchMergedValue2 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue104, productValue105, dotProductValue16), 0.0).x >= multiplyAddValue145);
                            }
                            else
                            {
                                vec4 sampledTextureValue26 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue104, productValue105, dotProductValue16));
                                float productValue190 = fract((fragmentVectorConstants1.packedValues[106u].z * productValue104) + 0.5);
                                float comparisonValue66 = (sampledTextureValue26.x < multiplyAddValue145) ? 0.0 : 1.0;
                                float comparisonValue67 = (sampledTextureValue26.w < multiplyAddValue145) ? 0.0 : 1.0;
                                float comparisonValue68 = ((((sampledTextureValue26.z < multiplyAddValue145) ? 0.0 : 1.0) - comparisonValue67) * productValue190) + comparisonValue67;
                                branchMergedValue2 = (((((((sampledTextureValue26.y < multiplyAddValue145) ? 0.0 : 1.0) - comparisonValue66) * productValue190) + comparisonValue66) - comparisonValue68) * fract((fragmentVectorConstants1.packedValues[106u].z * productValue105) + 0.5)) + comparisonValue68;
                            }
                            intermediateValue78 = branchMergedValue2;
                            sumValue29 = intermediateValue78 + intermediateValue67;
                            uint sumValue86 = intermediateValue68 + 1u;
                            if (int(sumValue86) < int(comparisonValue65))
                            {
                                intermediateValue67 = sumValue29;
                                intermediateValue68 = sumValue86;
                                continue;
                            }
                            else
#endif
                            {
                                break;
                            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                            float sumValue10 = rdSignedBitsToFloat(scalarValue19 - comparisonValue7) + 0.5;
                            intermediateValue94 = intermediateValue93;
                            float multiplyAddValue79;
                            uint sumValue23;
                            uint scalarValue20 = 0u;
                            for (;;)
                            {
                                if (((int(clampedValue) <= int(scalarValue20)) && conditionValue2) || (comparisonValue3 && (int(scalarValue20) >= int(1u))))
                                {
                                    break;
                                }
                                uint bitwiseValue3 = (((16u * intermediateValue60) + 192u) + 0u) >> 2u;
                                float multiplyAddValue36 = fma(multiplyAddValue32, fragmentScalarConstants1.packedValues[bitwiseValue3], ((rdSignedBitsToFloat(scalarValue20 - comparisonValue7) + 0.5) * fragmentScalarConstants1.packedValues[372u]) * fragmentScalarConstants1.packedValues[bitwiseValue3]);
                                float multiplyAddValue37 = fma(multiplyAddValue33, fragmentScalarConstants1.packedValues[bitwiseValue3], (sumValue10 * fragmentScalarConstants1.packedValues[372u]) * fragmentScalarConstants1.packedValues[bitwiseValue3]);
                                vec4 sampledTextureValue7 = textureGather(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue36, multiplyAddValue37, scalarValue18));
                                float multiplyAddValue38 = fract(fma(multiplyAddValue36, fragmentScalarConstants1.packedValues[374u], 0.5));
                                bool comparisonValue8 = sampledTextureValue7.w >= multiplyAddValue35;
                                bool comparisonValue17 = sampledTextureValue7.x >= multiplyAddValue35;
                                float comparisonValue19 = float(sampledTextureValue7.y >= multiplyAddValue35);
                                float comparisonValue21 = float(sampledTextureValue7.z >= multiplyAddValue35);
                                float multiplyAddValue39 = fma(multiplyAddValue38, comparisonValue8 ? (comparisonValue21 - 1.0) : comparisonValue21, float(comparisonValue8));
                                multiplyAddValue79 = comparisonValue3 ? (comparisonValue8 ? (intermediateValue94 + 1.0) : intermediateValue94) : (intermediateValue94 + fma(fract(fma(multiplyAddValue37, fragmentScalarConstants1.packedValues[374u], 0.5)), fma(multiplyAddValue38, comparisonValue17 ? (comparisonValue19 - 1.0) : comparisonValue19, float(comparisonValue17)) - multiplyAddValue39, multiplyAddValue39));
                                sumValue23 = scalarValue20 + 1u;
                                intermediateValue94 = multiplyAddValue79;
                                scalarValue20 = sumValue23;
                                continue;
                            }
                            sumValue17 = scalarValue19 + 1u;
                            intermediateValue93 = intermediateValue94;
                            scalarValue19 = sumValue17;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                            float sumValue121 = rdSignedBitsToFloat(scalarValue19 - comparisonValue82) + 0.5;
                            intermediateValue134 = intermediateValue133;
                            float multiplyAddValue108;
                            uint sumValue41;
                            uint scalarValue20 = 0u;
                            for (;;)
                            {
                                if ((conditionValue10 && (int(clampedValue2) <= int(scalarValue20))) || (comparisonValue79 && (int(scalarValue20) >= int(1u))))
                                {
                                    break;
                                }
                                uint bitwiseValue15 = (((16u * intermediateValue69) + 192u) + 0u) >> 2u;
                                float multiplyAddValue184 = fma(multiplyAddValue181, fragmentScalarConstants1.packedValues[bitwiseValue15], ((rdSignedBitsToFloat(scalarValue20 - comparisonValue82) + 0.5) * fragmentScalarConstants1.packedValues[424u]) * fragmentScalarConstants1.packedValues[bitwiseValue15]);
                                float multiplyAddValue185 = fma(multiplyAddValue182, fragmentScalarConstants1.packedValues[bitwiseValue15], (sumValue121 * fragmentScalarConstants1.packedValues[424u]) * fragmentScalarConstants1.packedValues[bitwiseValue15]);
                                vec4 sampledTextureValue39 = textureGather(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue184, multiplyAddValue185, scalarValue100));
                                float multiplyAddValue186 = fract(fma(multiplyAddValue184, fragmentScalarConstants1.packedValues[426u], 0.5));
                                bool comparisonValue83 = sampledTextureValue39.w >= multiplyAddValue183;
                                bool comparisonValue84 = sampledTextureValue39.x >= multiplyAddValue183;
                                float comparisonValue85 = float(sampledTextureValue39.y >= multiplyAddValue183);
                                float comparisonValue86 = float(sampledTextureValue39.z >= multiplyAddValue183);
                                float multiplyAddValue187 = fma(multiplyAddValue186, comparisonValue83 ? (comparisonValue86 - 1.0) : comparisonValue86, float(comparisonValue83));
                                multiplyAddValue108 = comparisonValue79 ? (comparisonValue83 ? (intermediateValue134 + 1.0) : intermediateValue134) : (intermediateValue134 + fma(fract(fma(multiplyAddValue185, fragmentScalarConstants1.packedValues[426u], 0.5)), fma(multiplyAddValue186, comparisonValue84 ? (comparisonValue85 - 1.0) : comparisonValue85, float(comparisonValue84)) - multiplyAddValue187, multiplyAddValue187));
                                sumValue41 = scalarValue20 + 1u;
                                intermediateValue134 = multiplyAddValue108;
                                scalarValue20 = sumValue41;
                                continue;
                            }
                            sumValue28 = scalarValue19 + 1u;
                            intermediateValue133 = intermediateValue134;
                            scalarValue19 = sumValue28;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                        }
                        uint sumValue61 = scalarValue20 + 1u;
                        if (int(sumValue61) < int(comparisonValue49))
                        {
                            scalarValue56 = sumValue25;
                            scalarValue20 = sumValue61;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                        }
                        uint sumValue61 = scalarValue20 + 1u;
                        if (int(sumValue61) < int(comparisonValue65))
                        {
                            scalarValue56 = sumValue29;
                            scalarValue20 = sumValue61;
#endif
                            continue;
                        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                        intermediateValue77 = comparisonValue4;
                        comparisonValue9 = spvNMin(intermediateValue58, intermediateValue93 / rdSignedBitsToFloat(comparisonValue3 ? 1u : (clampedValue * clampedValue)));
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                        intermediateValue100 = comparisonValue80;
                        comparisonValue9 = spvNMin(intermediateValue67, intermediateValue133 / rdSignedBitsToFloat(comparisonValue79 ? 1u : (clampedValue2 * clampedValue2)));
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                        else
                        {
                            break;
                        }
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                        else
                        {
                            break;
                        }
                    }
                    branchMergedValue12 = sumValue29 / float(int(comparisonValue65 * comparisonValue65));
                }
                else
                {
                    branchMergedValue12 = 1.0;
                }
                intermediateValue32 = branchMergedValue12;
            }
            else
            {
                intermediateValue32 = 1.0;
            }
            float intermediateValue42;
            if ((int(uint(int(fragmentVectorConstants1.packedValues[25u].y))) > int(0u)) && (int(uint(int(fragmentVectorConstants1.packedValues[77u].x))) > int(0u)))
            {
                float multiplyAddValue148 = fma(fragmentVectorConstants1.packedValues[75u].w, comparisonValue60, fma(fragmentVectorConstants1.packedValues[74u].w, comparisonValue59, fragmentVectorConstants1.packedValues[73u].w * comparisonValue58)) + fragmentVectorConstants1.packedValues[76u].w;
                float scalarValue69 = spvNMin(spvNMax(dotProductValue14, fragmentVectorConstants1.packedValues[26u].x), 1.0);
                float multiplyAddValue149 = (((fma(fragmentVectorConstants1.packedValues[75u].z, comparisonValue60, fma(fragmentVectorConstants1.packedValues[74u].z, comparisonValue59, fragmentVectorConstants1.packedValues[73u].z * comparisonValue58)) + fragmentVectorConstants1.packedValues[76u].z) / multiplyAddValue148) - fragmentVectorConstants1.packedValues[12u].y) - ((sqrt(1.0 - (scalarValue69 * scalarValue69)) / scalarValue69) * fragmentVectorConstants1.packedValues[12u].z);
                float multiplyAddValue150 = (((fma(fragmentVectorConstants1.packedValues[75u].x, comparisonValue60, fma(fragmentVectorConstants1.packedValues[74u].x, comparisonValue59, fragmentVectorConstants1.packedValues[73u].x * comparisonValue58)) + fragmentVectorConstants1.packedValues[76u].x) / multiplyAddValue148) * 0.5) + 0.5;
                float multiplyAddValue151 = 0.5 - (((fma(fragmentVectorConstants1.packedValues[75u].y, comparisonValue60, fma(fragmentVectorConstants1.packedValues[74u].y, comparisonValue59, fragmentVectorConstants1.packedValues[73u].y * comparisonValue58)) + fragmentVectorConstants1.packedValues[76u].y) / multiplyAddValue148) * 0.5);
                uint comparisonValue69 = (fragmentVectorConstants1.packedValues[99u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[87u].z + 0.5))), int(1u)))), int(9u)));
                uint quotientValue48 = uint(int(comparisonValue69) / int(2u));
                float dotProductValue17 = dot(vec4(fragmentVectorConstants1.packedValues[39u]), vec4(1.0));
                float intermediateValue56;
                if (int(comparisonValue69) > int(0u))
                {
                    float sumValue31;
                    float intermediateValue72;
                    uint intermediateValue73;
                    float scalarValue58 = 0.0;
                    uint scalarValue22 = 0u;
                    for (;;)
                    {
                        intermediateValue72 = scalarValue58;
                        intermediateValue73 = 0u;
                        float intermediateValue88;
                        vec4 intermediateValue74;
                        float productValue119;
                        float productValue120;
                        bool comparisonValue18;
                        for (;;)
                        {
                            intermediateValue74 = fragmentVectorConstants1.packedValues[106u];
                            productValue119 = (multiplyAddValue150 + ((float(int(intermediateValue73 - quotientValue48)) + 0.5) * intermediateValue74.x)) * fragmentVectorConstants1.packedValues[12u].x;
                            productValue120 = (multiplyAddValue151 + (intermediateValue74.x * (float(int(scalarValue22 - quotientValue48)) + 0.5))) * fragmentVectorConstants1.packedValues[12u].x;
                            comparisonValue18 = fragmentVectorConstants1.packedValues[99u].x != 0.0;
                            float branchMergedValue4;
                            if (comparisonValue18)
                            {
                                branchMergedValue4 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue119, productValue120, dotProductValue17), 0.0).x >= multiplyAddValue149);
                            }
                            else
                            {
                                vec4 sampledTextureValue27 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue119, productValue120, dotProductValue17));
                                float productValue191 = fract((productValue119 * intermediateValue74.z) + 0.5);
                                float comparisonValue70 = (sampledTextureValue27.x < multiplyAddValue149) ? 0.0 : 1.0;
                                float comparisonValue71 = (sampledTextureValue27.w < multiplyAddValue149) ? 0.0 : 1.0;
                                float comparisonValue72 = ((((sampledTextureValue27.z < multiplyAddValue149) ? 0.0 : 1.0) - comparisonValue71) * productValue191) + comparisonValue71;
                                branchMergedValue4 = (((((((sampledTextureValue27.y < multiplyAddValue149) ? 0.0 : 1.0) - comparisonValue70) * productValue191) + comparisonValue70) - comparisonValue72) * fract((productValue120 * intermediateValue74.z) + 0.5)) + comparisonValue72;
                            }
                            intermediateValue88 = branchMergedValue4;
                            sumValue31 = intermediateValue88 + intermediateValue72;
                            uint sumValue87 = intermediateValue73 + 1u;
                            if (sumValue87 == comparisonValue69)
                            {
                                break;
                            }
                            else
                            {
                                intermediateValue72 = sumValue31;
                                intermediateValue73 = sumValue87;
                                continue;
                            }
                        }
                        uint sumValue63 = scalarValue22 + 1u;
                        if (sumValue63 == comparisonValue69)
                        {
                            break;
                        }
                        else
                        {
                            scalarValue58 = sumValue31;
                            scalarValue22 = sumValue63;
                            continue;
                        }
                    }
                    intermediateValue56 = sumValue31;
                }
                else
                {
                    intermediateValue56 = 0.0;
                }
                float quotientValue49 = intermediateValue56 / float(int(comparisonValue69 * comparisonValue69));
                float branchMergedValue13;
                if (quotientValue49 < 1.0)
                {
                    branchMergedValue13 = spvNMin(1.0, spvNMax(quotientValue49, 1.0 - fragmentVectorConstants1.packedValues[87u].w));
                }
                else
                {
                    branchMergedValue13 = 1.0;
                }
                intermediateValue42 = branchMergedValue13;
            }
            else
            {
                intermediateValue42 = 1.0;
            }
            float scalarValue70 = spvNMin(intermediateValue18, spvNMin(intermediateValue32, intermediateValue42));
            float productValue192 = spvNMax(0.0, fragmentVectorConstants1.packedValues[106u].y - spvNMin(fragmentVectorConstants1.packedValues[106u].y * 0.100000001490116119384765625, 8.0));
            float quotientValue50 = spvNClamp((sumValue75 - productValue192) / (fragmentVectorConstants1.packedValues[106u].y - productValue192), 0.0, 1.0);
            productValue51 = (((quotientValue50 * quotientValue50) * (1.0 - scalarValue70)) * (3.0 - (quotientValue50 * 2.0))) + scalarValue70;
        }
        else
        {
            productValue51 = 1.0;
        }
        float multiplyAddValue132 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentVectorConstants1.packedValues[21u].w, fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[21u].z, fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[21u].y, fragmentVectorConstants1.packedValues[21u].x * fragmentVectorConstants1.packedValues[0u].x)));
        float multiplyAddValue133 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentVectorConstants1.packedValues[21u].w, fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[21u].z, fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[21u].y, fragmentVectorConstants1.packedValues[21u].x * fragmentVectorConstants1.packedValues[0u].y)));
        float multiplyAddValue134 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentVectorConstants1.packedValues[21u].w, fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[21u].z, fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[21u].y, fragmentVectorConstants1.packedValues[21u].x * fragmentVectorConstants1.packedValues[0u].z)));
        float inverseLengthValue20 = inversesqrt(dot(vec3(multiplyAddValue132, multiplyAddValue133, multiplyAddValue134), vec3(multiplyAddValue132, multiplyAddValue133, multiplyAddValue134)));
        float productValue124 = inverseLengthValue20 * multiplyAddValue132;
        float productValue125 = inverseLengthValue20 * multiplyAddValue133;
        float productValue128 = inverseLengthValue20 * multiplyAddValue134;
        float dotProductValue6 = spvNMax(dot(vec3(productValue106, productValue107, productValue108), vec3(productValue124, productValue125, productValue128)), 0.0);
        float dotProductValue7 = spvNMax(dot(vec3(productValue106, productValue107, productValue108), vec3(sumValue45, sumValue46, sumValue47)), 0.0);
        float sumValue64 = productValue124 - quotientValue27;
        float sumValue65 = productValue125 - quotientValue28;
        float sumValue66 = productValue128 - quotientValue29;
        float inverseLengthValue21 = inversesqrt(dot(vec3(sumValue64, sumValue65, sumValue66), vec3(sumValue64, sumValue65, sumValue66)));
        float productValue129 = inverseLengthValue21 * sumValue64;
        float productValue130 = inverseLengthValue21 * sumValue65;
        float productValue131 = inverseLengthValue21 * sumValue66;
        float scalarValue71 = spvNMax(bitwiseValue12, 0.0500000007450580596923828125);
        float productValue193 = scalarValue71 * scalarValue71;
        float productValue194 = productValue193 * productValue193;
        float dotProductValue8 = spvNMax(dot(vec3(productValue106, productValue107, productValue108), vec3(productValue129, productValue130, productValue131)), 0.0);
        float productValue195 = ((dotProductValue8 * dotProductValue8) * (productValue194 + (-1.0))) + 1.0;
        float productValue196 = productValue193 * 0.5;
        float sumValue88 = 1.0 - productValue196;
        float sumValue89 = productValue196 + 9.9999997473787516355514526367188e-05;
        float dotProductValue9 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue45, sumValue46, sumValue47), vec3(productValue129, productValue130, productValue131)), 0.0), 0.0, 1.0);
        float productValue137 = dotProductValue9 * dotProductValue9;
        float quotientValue51 = ((((dotProductValue7 / ((sumValue88 * dotProductValue7) + sumValue89)) * (productValue194 / ((productValue195 * productValue195) * 3.1415927410125732421875))) * (dotProductValue6 / ((sumValue88 * dotProductValue6) + sumValue89))) * (((productValue137 * productValue137) * (dotProductValue9 * 0.980000019073486328125)) + 0.0199999995529651641845703125)) / (((dotProductValue6 * 4.0) * dotProductValue7) + 9.9999997473787516355514526367188e-05);
        float productValue197 = fragmentVectorConstants1.packedValues[88u].x * (fragmentVectorConstants1.packedValues[79u].w * productValue51);
        intermediateValue11 = (((productValue197 * fragmentVectorConstants1.packedValues[79u].x) * dotProductValue6) * quotientValue51) * fragmentVectorConstants1.packedValues[80u].y;
        intermediateValue12 = (((productValue197 * fragmentVectorConstants1.packedValues[79u].y) * dotProductValue6) * quotientValue51) * fragmentVectorConstants1.packedValues[80u].y;
        intermediateValue13 = (((productValue197 * fragmentVectorConstants1.packedValues[79u].z) * dotProductValue6) * quotientValue51) * fragmentVectorConstants1.packedValues[80u].y;
    }
    float productValue32;
    float productValue33;
    float productValue34;
    if (fragmentVectorConstants1.packedValues[25u].z != 0.0)
    {
        bool conditionValue8 = int(uint(int(fragmentVectorConstants1.packedValues[99u].y))) > int(0u);
        float comparisonValue73 = conditionValue8 ? productValue183 : sumValue76;
        float comparisonValue74 = conditionValue8 ? productValue184 : sumValue77;
        float comparisonValue75 = conditionValue8 ? productValue185 : sumValue78;
        float productValue198 = fragmentVectorConstants1.packedValues[36u].z * sumValue75;
        float productValue199 = productValue198 * fragmentVectorConstants1.packedValues[36u].w;
        float intermediateValue17;
        if (fragmentVectorConstants1.packedValues[36u].x > sumValue75)
        {
            intermediateValue17 = 0.0;
        }
        else
        {
            float branchMergedValue11;
            if (fragmentVectorConstants1.packedValues[36u].y > sumValue75)
            {
                branchMergedValue11 = 1.0;
            }
            else
            {
                branchMergedValue11 = spvNMin(floor(spvNMin(spvNMax((log2(sumValue75) - fragmentVectorConstants1.packedValues[89u].z) * fragmentVectorConstants1.packedValues[89u].x, 0.0), 1.0) * (fragmentVectorConstants1.packedValues[78u].z + (-2.0))) + 2.0, fragmentVectorConstants1.packedValues[78u].z + (-1.0));
            }
            intermediateValue17 = branchMergedValue11;
        }
        float quotientValue52 = spvNMin(floor(spvNMin(spvNMax((productValue199 + quotientValue15) / (productValue199 * 2.0), 0.0), 1.0) * fragmentVectorConstants1.packedValues[78u].x), fragmentVectorConstants1.packedValues[78u].x + (-1.0));
        float quotientValue53 = spvNMin(floor(spvNMin(spvNMax((productValue198 + quotientValue16) / (productValue198 * 2.0), 0.0), 1.0) * fragmentVectorConstants1.packedValues[78u].y), fragmentVectorConstants1.packedValues[78u].y + (-1.0));
        uint intermediateValue20;
        bool intermediateValue22;
        uint intermediateValue23;
        if ((intermediateValue17 >= fragmentVectorConstants1.packedValues[78u].z) || ((quotientValue53 >= fragmentVectorConstants1.packedValues[78u].y) || ((quotientValue52 >= fragmentVectorConstants1.packedValues[78u].x) || ((intermediateValue17 < 0.0) || ((quotientValue52 < 0.0) || (quotientValue53 < 0.0))))))
        {
            intermediateValue20 = intermediateValue21;
            intermediateValue22 = false;
            intermediateValue23 = 0u;
        }
        else
        {
            uint scalarValue72 = uint(int(fragmentVectorConstants1.packedValues[78u].w));
            uint productValue200 = uint(int(((quotientValue53 + (intermediateValue17 * fragmentVectorConstants1.packedValues[78u].y)) * fragmentVectorConstants1.packedValues[78u].x) + quotientValue52)) * scalarValue72;
            intermediateValue20 = productValue200;
            intermediateValue22 = true;
            intermediateValue23 = productValue200 + scalarValue72;
        }
        float intermediateValue33;
        float intermediateValue35;
        float intermediateValue37;
        if (intermediateValue22 && (int(intermediateValue20) < int(intermediateValue23)))
        {
            float dotProductValue10;
            float quotientValue22;
            float intermediateValue79;
            float intermediateValue80;
            float intermediateValue81;
            float intermediateValue82;
            float intermediateValue34;
            float intermediateValue36;
            float intermediateValue38;
            uint scalarValue73 = intermediateValue20;
            float scalarValue74 = 0.0;
            float scalarValue75 = 0.0;
            float scalarValue76 = 0.0;
            uint sampledTextureValue5;
            for (;;)
            {
                sampledTextureValue5 = uint(int(uintBitsToFloat(texelFetch(zLightLookupArray, int(scalarValue73)).x)));
                if (int(sampledTextureValue5) < int(0u))
                {
                    intermediateValue34 = scalarValue74;
                    intermediateValue36 = scalarValue75;
                    intermediateValue38 = scalarValue76;
                    break;
                }
                else
                {
                    uint productValue201 = sampledTextureValue5 * 32u;
                    vec4 sampledTextureValue28 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue201)).x, texelFetch(zLights, int(productValue201 + 1u)).x, texelFetch(zLights, int(productValue201 + 2u)).x, texelFetch(zLights, int(productValue201 + 3u)).x));
                    float scalarValue77 = sampledTextureValue28.x;
                    float scalarValue78 = sampledTextureValue28.y;
                    float scalarValue79 = sampledTextureValue28.z;
                    float multiplyAddValue152 = fma(fragmentVectorConstants1.packedValues[2u].x, scalarValue79, fma(fragmentVectorConstants1.packedValues[1u].x, scalarValue78, scalarValue77 * fragmentVectorConstants1.packedValues[0u].x)) + (fragmentVectorConstants1.packedValues[3u].x - quotientValue15);
                    float multiplyAddValue153 = fma(fragmentVectorConstants1.packedValues[2u].y, scalarValue79, fma(fragmentVectorConstants1.packedValues[1u].y, scalarValue78, scalarValue77 * fragmentVectorConstants1.packedValues[0u].y)) + (fragmentVectorConstants1.packedValues[3u].y - quotientValue16);
                    float multiplyAddValue154 = fma(fragmentVectorConstants1.packedValues[2u].z, scalarValue79, fma(fragmentVectorConstants1.packedValues[1u].z, scalarValue78, scalarValue77 * fragmentVectorConstants1.packedValues[0u].z)) + (fragmentVectorConstants1.packedValues[3u].z - quotientValue17);
                    float inverseLengthValue29 = inversesqrt(dot(vec3(multiplyAddValue152, multiplyAddValue153, multiplyAddValue154), vec3(multiplyAddValue152, multiplyAddValue153, multiplyAddValue154)));
                    float productValue202 = inverseLengthValue29 * multiplyAddValue152;
                    float productValue203 = inverseLengthValue29 * multiplyAddValue153;
                    float productValue204 = inverseLengthValue29 * multiplyAddValue154;
                    dotProductValue10 = spvNMax(dot(vec3(productValue106, productValue107, productValue108), vec3(productValue202, productValue203, productValue204)), 0.0);
                    float dotProductValue18 = spvNMax(dot(vec3(productValue106, productValue107, productValue108), vec3(sumValue45, sumValue46, sumValue47)), 0.0);
                    float sumValue90 = productValue202 - quotientValue27;
                    float sumValue91 = productValue203 - quotientValue28;
                    float sumValue92 = productValue204 - quotientValue29;
                    float inverseLengthValue30 = inversesqrt(dot(vec3(sumValue90, sumValue91, sumValue92), vec3(sumValue90, sumValue91, sumValue92)));
                    float productValue205 = inverseLengthValue30 * sumValue90;
                    float productValue206 = inverseLengthValue30 * sumValue91;
                    float productValue207 = inverseLengthValue30 * sumValue92;
                    float scalarValue80 = spvNMax(bitwiseValue12, 0.0500000007450580596923828125);
                    float productValue208 = scalarValue80 * scalarValue80;
                    float productValue209 = productValue208 * productValue208;
                    float dotProductValue19 = spvNMax(dot(vec3(productValue106, productValue107, productValue108), vec3(productValue205, productValue206, productValue207)), 0.0);
                    float productValue210 = ((dotProductValue19 * dotProductValue19) * (productValue209 + (-1.0))) + 1.0;
                    float productValue211 = productValue208 * 0.5;
                    float sumValue93 = 1.0 - productValue211;
                    float sumValue94 = productValue211 + 9.9999997473787516355514526367188e-05;
                    float dotProductValue20 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue45, sumValue46, sumValue47), vec3(productValue205, productValue206, productValue207)), 0.0), 0.0, 1.0);
                    float productValue212 = dotProductValue20 * dotProductValue20;
                    quotientValue22 = ((((dotProductValue18 / ((sumValue93 * dotProductValue18) + sumValue94)) * (productValue209 / ((productValue210 * productValue210) * 3.1415927410125732421875))) * (dotProductValue10 / ((sumValue93 * dotProductValue10) + sumValue94))) * (((productValue212 * productValue212) * (dotProductValue20 * 0.980000019073486328125)) + 0.0199999995529651641845703125)) / (((dotProductValue10 * 4.0) * dotProductValue18) + 9.9999997473787516355514526367188e-05);
                    float sumValue95 = scalarValue77 - sumValue76;
                    float sumValue96 = scalarValue78 - sumValue77;
                    float sumValue97 = scalarValue79 - sumValue78;
                    float productValue121;
                    if (fragmentVectorConstants1.packedValues[24u].x > 0.0)
                    {
                        float sumValue98 = (abs(sumValue96) + abs(sumValue95)) + abs(sumValue97);
                        productValue121 = sumValue98 * sumValue98;
#endif
                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    else
                    {
                        intermediateValue77 = intermediateValue60 + 1u;
                        comparisonValue9 = intermediateValue58;
                    }
                    intermediateValue58 = comparisonValue9;
                    intermediateValue60 = intermediateValue77;
                    continue;
                }
                sumValue6 = scalarValue17 + 1u;
                intermediateValue57 = intermediateValue58;
                scalarValue16 = intermediateValue60;
                scalarValue17 = sumValue6;
                continue;
            }
            float intermediateValue78;
            if (int(uint(int(fragmentScalarConstants1.packedValues[80u]))) > int(0u))
            {
                float multiplyAddValue43 = fma(fma(fragmentVectorConstants1.packedValues[80u].x, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[78u].x, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[79u].x)) + fragmentVectorConstants1.packedValues[81u].x, 0.5, 0.5) * fragmentScalarConstants1.packedValues[81u];
                float multiplyAddValue47 = (1.0 - fma(fma(fragmentVectorConstants1.packedValues[80u].y, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[78u].y, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[79u].y)) + fragmentVectorConstants1.packedValues[81u].y, 0.5, 0.5)) * fragmentScalarConstants1.packedValues[81u];
                float comparisonValue10;
                if ((((multiplyAddValue43 >= 0.0) && (multiplyAddValue43 < fragmentScalarConstants1.packedValues[81u])) && (multiplyAddValue47 >= 0.0)) && (multiplyAddValue47 < fragmentScalarConstants1.packedValues[81u]))
                {
                    float scalarValue21 = spvNMin(spvNMax(productValue22, fragmentScalarConstants1.packedValues[96u]), 1.0);
                    float multiplyAddValue48 = spvNMin((fma(fragmentVectorConstants1.packedValues[80u].z, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[78u].z, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[79u].z)) + fragmentVectorConstants1.packedValues[81u].z) - fma(fragmentScalarConstants1.packedValues[50u], sqrt(fma(-scalarValue21, scalarValue21, 1.0)) / scalarValue21, fragmentScalarConstants1.packedValues[49u]), 1.0);
                    bool conditionValue3 = !comparisonValue3;
                    float sumValue11 = rdDot4Precise(fragmentVectorConstants1.packedValues[36u], vec4(1.0)) + 1.0;
                    uint comparisonValue22 = comparisonValue3 ? 0u : 4294967295u;
                    float intermediateValue85;
                    intermediateValue85 = 0.0;
                    uint sumValue15;
                    float intermediateValue86;
                    uint scalarValue22 = 0u;
                    for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    else
                    {
                        intermediateValue100 = intermediateValue69 + 1u;
                        comparisonValue9 = intermediateValue67;
                    }
                    intermediateValue67 = comparisonValue9;
                    intermediateValue69 = intermediateValue100;
                    continue;
                }
                sumValue9 = scalarValue17 + 1u;
                intermediateValue66 = intermediateValue67;
                scalarValue16 = intermediateValue69;
                scalarValue17 = sumValue9;
                continue;
            }
            float intermediateValue104;
            if (int(uint(int(fragmentScalarConstants1.packedValues[80u]))) > int(0u))
            {
                float multiplyAddValue188 = fma(fma(fragmentVectorConstants1.packedValues[84u].x, multiplyAddValue177, fma(fragmentVectorConstants1.packedValues[82u].x, multiplyAddValue175, multiplyAddValue176 * fragmentVectorConstants1.packedValues[83u].x)) + fragmentVectorConstants1.packedValues[85u].x, 0.5, 0.5) * fragmentScalarConstants1.packedValues[81u];
                float multiplyAddValue189 = (1.0 - fma(fma(fragmentVectorConstants1.packedValues[84u].y, multiplyAddValue177, fma(fragmentVectorConstants1.packedValues[82u].y, multiplyAddValue175, multiplyAddValue176 * fragmentVectorConstants1.packedValues[83u].y)) + fragmentVectorConstants1.packedValues[85u].y, 0.5, 0.5)) * fragmentScalarConstants1.packedValues[81u];
                float comparisonValue12;
                if ((((multiplyAddValue188 >= 0.0) && (multiplyAddValue188 < fragmentScalarConstants1.packedValues[81u])) && (multiplyAddValue189 >= 0.0)) && (multiplyAddValue189 < fragmentScalarConstants1.packedValues[81u]))
                {
                    float scalarValue101 = spvNMin(spvNMax(productValue260, fragmentScalarConstants1.packedValues[104u]), 1.0);
                    float multiplyAddValue190 = spvNMin((fma(fragmentVectorConstants1.packedValues[84u].z, multiplyAddValue177, fma(fragmentVectorConstants1.packedValues[82u].z, multiplyAddValue175, multiplyAddValue176 * fragmentVectorConstants1.packedValues[83u].z)) + fragmentVectorConstants1.packedValues[85u].z) - fma(fragmentScalarConstants1.packedValues[50u], sqrt(fma(-scalarValue101, scalarValue101, 1.0)) / scalarValue101, fragmentScalarConstants1.packedValues[49u]), 1.0);
                    bool conditionValue11 = !comparisonValue79;
                    float sumValue122 = rdDot4Precise(fragmentVectorConstants1.packedValues[39u], vec4(1.0)) + 1.0;
                    uint comparisonValue87 = comparisonValue79 ? 0u : 4294967295u;
                    float intermediateValue124;
                    intermediateValue124 = 0.0;
                    uint sumValue26;
                    float intermediateValue125;
                    uint scalarValue22 = 0u;
                    for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue7 = sumValue25 / float(int(comparisonValue49 * comparisonValue49));
                }
                else
                {
                    branchMergedValue7 = 1.0;
                }
                intermediateValue24 = branchMergedValue7;
            }
            else
            {
                intermediateValue24 = 1.0;
            }
            float intermediateValue32;
            if ((int(uint(int(fragmentVectorConstants1.packedValues[23u].y))) > int(0u)) && (int(uint(int(fragmentVectorConstants1.packedValues[74u].x))) > int(0u)))
            {
                float multiplyAddValue128 = fma(fragmentVectorConstants1.packedValues[72u].w, comparisonValue44, fma(fragmentVectorConstants1.packedValues[71u].w, comparisonValue43, fragmentVectorConstants1.packedValues[70u].w * comparisonValue42)) + fragmentVectorConstants1.packedValues[73u].w;
                float scalarValue57 = spvNMin(spvNMax(dotProductValue2, fragmentVectorConstants1.packedValues[24u].x), 1.0);
                float multiplyAddValue129 = (((fma(fragmentVectorConstants1.packedValues[72u].z, comparisonValue44, fma(fragmentVectorConstants1.packedValues[71u].z, comparisonValue43, fragmentVectorConstants1.packedValues[70u].z * comparisonValue42)) + fragmentVectorConstants1.packedValues[73u].z) / multiplyAddValue128) - fragmentVectorConstants1.packedValues[12u].y) - ((sqrt(1.0 - (scalarValue57 * scalarValue57)) / scalarValue57) * fragmentVectorConstants1.packedValues[12u].z);
                float multiplyAddValue130 = (((fma(fragmentVectorConstants1.packedValues[72u].x, comparisonValue44, fma(fragmentVectorConstants1.packedValues[71u].x, comparisonValue43, fragmentVectorConstants1.packedValues[70u].x * comparisonValue42)) + fragmentVectorConstants1.packedValues[73u].x) / multiplyAddValue128) * 0.5) + 0.5;
                float multiplyAddValue131 = 0.5 - (((fma(fragmentVectorConstants1.packedValues[72u].y, comparisonValue44, fma(fragmentVectorConstants1.packedValues[71u].y, comparisonValue43, fragmentVectorConstants1.packedValues[70u].y * comparisonValue42)) + fragmentVectorConstants1.packedValues[73u].y) / multiplyAddValue128) * 0.5);
                uint comparisonValue53 = (fragmentVectorConstants1.packedValues[88u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[83u].z + 0.5))), int(1u)))), int(9u)));
                uint quotientValue31 = uint(int(comparisonValue53) / int(2u));
                float dotProductValue5 = dot(vec4(fragmentVectorConstants1.packedValues[36u]), vec4(1.0));
                float intermediateValue44;
                if (int(comparisonValue53) > int(0u))
                {
                    float sumValue27;
                    float intermediateValue50;
                    uint intermediateValue51;
                    float scalarValue58 = 0.0;
                    uint scalarValue22 = 0u;
                    for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    else
                    {
                        productValue121 = dot(vec3(sumValue95, sumValue96, sumValue97), vec3(sumValue95, sumValue96, sumValue97));
                    }
                    float scalarValue81 = sampledTextureValue28.w;
                    float productValue213 = scalarValue81 * scalarValue81;
                    float branchMergedValue3;
                    float branchMergedValue8;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    if (!(productValue121 >= productValue213))
#endif
                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                        if ((comparisonValue3 && (int(scalarValue22) >= int(1u))) || ((int(scalarValue22) >= int(2u)) && conditionValue3))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                        if ((comparisonValue79 && (int(scalarValue22) >= int(1u))) || ((int(scalarValue22) >= int(2u)) && conditionValue11))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                        intermediateValue50 = scalarValue58;
                        intermediateValue51 = 0u;
                        float intermediateValue60;
                        vec4 intermediateValue52;
                        float productValue95;
                        float productValue96;
                        bool comparisonValue16;
                        for (;;)
                        {
                            intermediateValue52 = fragmentVectorConstants1.packedValues[93u];
                            productValue95 = (multiplyAddValue130 + ((float(int(intermediateValue51 - quotientValue31)) + 0.5) * intermediateValue52.x)) * fragmentVectorConstants1.packedValues[12u].x;
                            productValue96 = (multiplyAddValue131 + (intermediateValue52.x * (float(int(scalarValue22 - quotientValue31)) + 0.5))) * fragmentVectorConstants1.packedValues[12u].x;
                            comparisonValue16 = fragmentVectorConstants1.packedValues[88u].x != 0.0;
                            float branchMergedValue3;
                            if (comparisonValue16)
                            {
                                branchMergedValue3 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue95, productValue96, dotProductValue5), 0.0).x >= multiplyAddValue129);
                            }
                            else
                            {
                                vec4 sampledTextureValue22 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue95, productValue96, dotProductValue5));
                                float productValue122 = fract((productValue95 * intermediateValue52.z) + 0.5);
                                float comparisonValue54 = (sampledTextureValue22.x < multiplyAddValue129) ? 0.0 : 1.0;
                                float comparisonValue55 = (sampledTextureValue22.w < multiplyAddValue129) ? 0.0 : 1.0;
                                float comparisonValue56 = ((((sampledTextureValue22.z < multiplyAddValue129) ? 0.0 : 1.0) - comparisonValue55) * productValue122) + comparisonValue55;
                                branchMergedValue3 = (((((((sampledTextureValue22.y < multiplyAddValue129) ? 0.0 : 1.0) - comparisonValue54) * productValue122) + comparisonValue54) - comparisonValue56) * fract((productValue96 * intermediateValue52.z) + 0.5)) + comparisonValue56;
                            }
                            intermediateValue60 = branchMergedValue3;
                            sumValue27 = intermediateValue60 + intermediateValue50;
                            uint sumValue62 = intermediateValue51 + 1u;
                            if (sumValue62 == comparisonValue53)
                            {
                                break;
                            }
                            else
                            {
                                intermediateValue50 = sumValue27;
                                intermediateValue51 = sumValue62;
                                continue;
                            }
                        }
                        uint sumValue63 = scalarValue22 + 1u;
                        if (sumValue63 == comparisonValue53)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                        float intermediateValue83;
                        if (fragmentVectorConstants1.packedValues[25u].z != 0.0)
#endif
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF || RD_PLATFORM == RD_PLATFORM_SM50
                            break;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                            uint productValue214 = (sampledTextureValue5 * 32u) + 8u;
                            vec4 sampledTextureValue29 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue214)).x, texelFetch(zLights, int(productValue214 + 1u)).x, texelFetch(zLights, int(productValue214 + 2u)).x, texelFetch(zLights, int(productValue214 + 3u)).x));
                            uint productValue215 = (sampledTextureValue5 * 32u) + 12u;
                            vec4 sampledTextureValue30 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue215)).x, texelFetch(zLights, int(productValue215 + 1u)).x, texelFetch(zLights, int(productValue215 + 2u)).x, texelFetch(zLights, int(productValue215 + 3u)).x));
                            uint productValue216 = (sampledTextureValue5 * 32u) + 16u;
                            vec4 sampledTextureValue31 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue216)).x, texelFetch(zLights, int(productValue216 + 1u)).x, texelFetch(zLights, int(productValue216 + 2u)).x, texelFetch(zLights, int(productValue216 + 3u)).x));
                            uint productValue217 = (sampledTextureValue5 * 32u) + 20u;
                            vec4 sampledTextureValue32 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue217)).x, texelFetch(zLights, int(productValue217 + 1u)).x, texelFetch(zLights, int(productValue217 + 2u)).x, texelFetch(zLights, int(productValue217 + 3u)).x));
                            uint productValue218 = (sampledTextureValue5 * 32u) + 24u;
                            vec4 sampledTextureValue33 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue218)).x, texelFetch(zLights, int(productValue218 + 1u)).x, texelFetch(zLights, int(productValue218 + 2u)).x, texelFetch(zLights, int(productValue218 + 3u)).x));
                            uint productValue219 = (sampledTextureValue5 * 32u) + 28u;
                            vec4 sampledTextureValue34 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue219)).x, texelFetch(zLights, int(productValue219 + 1u)).x, texelFetch(zLights, int(productValue219 + 2u)).x, texelFetch(zLights, int(productValue219 + 3u)).x));
                            float sumValue99 = comparisonValue73 - scalarValue77;
                            float sumValue100 = comparisonValue74 - scalarValue78;
                            float sumValue101 = comparisonValue75 - scalarValue79;
                            float scalarValue82 = abs(sumValue99);
                            float scalarValue83 = abs(sumValue100);
                            float scalarValue84 = abs(sumValue101);
                            uint comparisonValue27;
                            if ((scalarValue82 >= scalarValue83) && (scalarValue82 >= scalarValue84))
                            {
                                comparisonValue27 = uint(!(sumValue99 >= 0.0));
                            }
                            else
                            {
                                uint branchMergedValue16;
                                if (!(scalarValue83 >= scalarValue84))
                                {
                                    branchMergedValue16 = (sumValue101 >= 0.0) ? 4u : 5u;
                                }
                                else
                                {
                                    branchMergedValue16 = (sumValue100 >= 0.0) ? 2u : 3u;
                                }
                                comparisonValue27 = branchMergedValue16;
                            }
                            float sumValue102 = (-0.0) - sumValue99;
                            float intermediateValue93;
                            float intermediateValue94;
                            float intermediateValue95;
                            float intermediateValue96;
                            float sumValue57;
                            float intermediateValue97;
                            float intermediateValue98;
                            if (comparisonValue27 == 1u)
                            {
                                intermediateValue93 = sampledTextureValue30.x;
                                intermediateValue94 = sampledTextureValue30.y;
                                intermediateValue95 = sampledTextureValue30.z;
                                intermediateValue96 = sampledTextureValue30.w;
                                sumValue57 = (-0.0) - sumValue101;
                                intermediateValue97 = sumValue100;
                                intermediateValue98 = sumValue99;
                            }
                            else
                            {
                                float branchMergedValue17;
                                float branchMergedValue21;
                                float branchMergedValue22;
                                float branchMergedValue23;
                                float branchMergedValue24;
                                float branchMergedValue25;
                                float branchMergedValue26;
                                if (comparisonValue27 == 2u)
                                {
                                    branchMergedValue17 = (-0.0) - sumValue100;
                                    branchMergedValue21 = (-0.0) - sumValue101;
                                    branchMergedValue22 = sumValue102;
                                    branchMergedValue23 = sampledTextureValue31.w;
                                    branchMergedValue24 = sampledTextureValue31.z;
                                    branchMergedValue25 = sampledTextureValue31.x;
                                    branchMergedValue26 = sampledTextureValue31.y;
                                }
                                else
                                {
                                    float branchMergedValue28;
                                    float branchMergedValue32;
                                    float branchMergedValue33;
                                    float branchMergedValue34;
                                    float branchMergedValue35;
                                    float branchMergedValue36;
                                    float branchMergedValue37;
                                    if (comparisonValue27 == 3u)
                                    {
                                        branchMergedValue28 = sumValue100;
                                        branchMergedValue32 = sumValue101;
                                        branchMergedValue33 = sumValue102;
                                        branchMergedValue34 = sampledTextureValue32.w;
                                        branchMergedValue35 = sampledTextureValue32.z;
                                        branchMergedValue36 = sampledTextureValue32.x;
                                        branchMergedValue37 = sampledTextureValue32.y;
                                    }
                                    else
                                    {
                                        float branchMergedValue39;
                                        float branchMergedValue43;
                                        float branchMergedValue44;
                                        float branchMergedValue45;
                                        float branchMergedValue46;
                                        float branchMergedValue47;
                                        float branchMergedValue48;
                                        if (comparisonValue27 == 4u)
                                        {
                                            branchMergedValue39 = (-0.0) - sumValue101;
                                            branchMergedValue43 = sumValue100;
                                            branchMergedValue44 = sumValue102;
                                            branchMergedValue45 = sampledTextureValue33.w;
                                            branchMergedValue46 = sampledTextureValue33.z;
                                            branchMergedValue47 = sampledTextureValue33.x;
                                            branchMergedValue48 = sampledTextureValue33.y;
                                        }
                                        else
                                        {
                                            bool comparisonValue76 = comparisonValue27 == 5u;
                                            branchMergedValue39 = comparisonValue76 ? sumValue101 : sumValue102;
                                            branchMergedValue43 = sumValue100;
                                            branchMergedValue44 = comparisonValue76 ? sumValue99 : sumValue101;
                                            branchMergedValue45 = comparisonValue76 ? sampledTextureValue34.w : sampledTextureValue29.w;
                                            branchMergedValue46 = comparisonValue76 ? sampledTextureValue34.z : sampledTextureValue29.z;
                                            branchMergedValue47 = comparisonValue76 ? sampledTextureValue34.x : sampledTextureValue29.x;
                                            branchMergedValue48 = comparisonValue76 ? sampledTextureValue34.y : sampledTextureValue29.y;
                                        }
                                        branchMergedValue28 = branchMergedValue39;
                                        branchMergedValue32 = branchMergedValue43;
                                        branchMergedValue33 = branchMergedValue44;
                                        branchMergedValue34 = branchMergedValue45;
                                        branchMergedValue35 = branchMergedValue46;
                                        branchMergedValue36 = branchMergedValue47;
                                        branchMergedValue37 = branchMergedValue48;
                                    }
                                    branchMergedValue17 = branchMergedValue28;
                                    branchMergedValue21 = branchMergedValue32;
                                    branchMergedValue22 = branchMergedValue33;
                                    branchMergedValue23 = branchMergedValue34;
                                    branchMergedValue24 = branchMergedValue35;
                                    branchMergedValue25 = branchMergedValue36;
                                    branchMergedValue26 = branchMergedValue37;
                                }
                                intermediateValue93 = branchMergedValue25;
                                intermediateValue94 = branchMergedValue26;
                                intermediateValue95 = branchMergedValue24;
                                intermediateValue96 = branchMergedValue23;
                                sumValue57 = branchMergedValue22;
                                intermediateValue97 = branchMergedValue21;
                                intermediateValue98 = branchMergedValue17;
                            }
                            float branchMergedValue15;
                            if ((intermediateValue95 == 0.0) && (intermediateValue96 == 0.0))
                            {
                                branchMergedValue15 = 0.0;
                            }
                            else
                            {
                                float multiplyAddValue155 = fma(fragmentVectorConstants1.packedValues[97u].w, intermediateValue98, fma(fragmentVectorConstants1.packedValues[96u].w, intermediateValue97, fragmentVectorConstants1.packedValues[95u].w * sumValue57)) + fragmentVectorConstants1.packedValues[98u].w;
                                float inverseLengthValue31 = inversesqrt(dot(vec3(productValue101, productValue102, productValue103), vec3(productValue101, productValue102, productValue103)));
                                float sumValue103 = (-0.0) - sumValue100;
                                float sumValue104 = (-0.0) - sumValue101;
                                float inverseLengthValue32 = inversesqrt(dot(vec3(sumValue102, sumValue103, sumValue104), vec3(sumValue102, sumValue103, sumValue104)));
                                float dotProductValue21 = spvNMin(spvNMax(dot(vec3(inverseLengthValue32 * sumValue102, inverseLengthValue32 * sumValue103, inverseLengthValue32 * sumValue104), vec3(inverseLengthValue31 * productValue101, inverseLengthValue31 * productValue102, inverseLengthValue31 * productValue103)), fragmentVectorConstants1.packedValues[94u].x), 1.0);
                                float sumValue105 = intermediateValue95 - intermediateValue93;
                                float productValue220 = fragmentVectorConstants1.packedValues[100u].x * sumValue105;
                                float quotientValue54 = 0.5 / fragmentVectorConstants1.packedValues[100u].x;
                                float quotientValue55 = 0.5 / fragmentVectorConstants1.packedValues[100u].y;
                                float sumValue106 = intermediateValue96 - intermediateValue94;
                                float productValue221 = fragmentVectorConstants1.packedValues[100u].y * sumValue106;
                                float sampledTextureValue35 = float(textureLod(sampler2D(pointLightShadowTextureAtlasTexture, pointLightShadowTextureAtlasSampler), vec2(spvNMin(spvNMax((((floor(((((fma(fragmentVectorConstants1.packedValues[97u].x, intermediateValue98, fma(fragmentVectorConstants1.packedValues[96u].x, intermediateValue97, fragmentVectorConstants1.packedValues[95u].x * sumValue57)) + fragmentVectorConstants1.packedValues[98u].x) / multiplyAddValue155) * 0.5) + 0.5) * productValue220) + 0.5) / productValue220) * sumValue105) + intermediateValue93, quotientValue54 + intermediateValue93), intermediateValue95 - quotientValue54), spvNMin(spvNMax((((floor((0.5 - (((fma(fragmentVectorConstants1.packedValues[97u].y, intermediateValue98, fma(fragmentVectorConstants1.packedValues[96u].y, intermediateValue97, fragmentVectorConstants1.packedValues[95u].y * sumValue57)) + fragmentVectorConstants1.packedValues[98u].y) / multiplyAddValue155) * 0.5)) * productValue221) + 0.5) / productValue221) * sumValue106) + intermediateValue94, quotientValue55 + intermediateValue94), intermediateValue96 - quotientValue55)), 0.0).x >= (((fma(fragmentVectorConstants1.packedValues[97u].z, intermediateValue98, fma(fragmentVectorConstants1.packedValues[96u].z, intermediateValue97, fragmentVectorConstants1.packedValues[95u].z * sumValue57)) + fragmentVectorConstants1.packedValues[98u].z) - ((fragmentVectorConstants1.packedValues[100u].z / spvNMax(productValue220, 1.0)) * (((sqrt(1.0 - (dotProductValue21 * dotProductValue21)) / dotProductValue21) * fragmentVectorConstants1.packedValues[102u].y) + fragmentVectorConstants1.packedValues[102u].x))) / multiplyAddValue155));
                                branchMergedValue15 = sampledTextureValue35;
                            }
                            intermediateValue83 = branchMergedValue15;
#endif
                        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                        float sumValue13 = rdSignedBitsToFloat(comparisonValue22 + scalarValue22) + 0.5;
                        intermediateValue86 = intermediateValue85;
                        uint sumValue20;
                        float sampledTextureValue9;
                        uint scalarValue23 = 0u;
                        for (;;)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                        float sumValue123 = rdSignedBitsToFloat(comparisonValue87 + scalarValue22) + 0.5;
                        intermediateValue125 = intermediateValue124;
                        uint sumValue38;
                        float sampledTextureValue10;
                        uint scalarValue23 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        else
#endif
                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                            if ((comparisonValue3 && (int(scalarValue23) >= int(1u))) || (conditionValue3 && (int(scalarValue23) >= int(2u))))
                            {
                                break;
                            }
                            float multiplyAddValue49 = fma((rdSignedBitsToFloat(comparisonValue22 + scalarValue23) + 0.5) * fragmentScalarConstants1.packedValues[82u], fragmentScalarConstants1.packedValues[81u], multiplyAddValue43);
                            float multiplyAddValue54 = fma(sumValue13 * fragmentScalarConstants1.packedValues[82u], fragmentScalarConstants1.packedValues[81u], multiplyAddValue47);
                            if (comparisonValue3)
                            {
                                sampledTextureValue9 = (textureLod(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue49, multiplyAddValue54, sumValue11), 0.0).x >= multiplyAddValue48) ? (intermediateValue86 + 1.0) : intermediateValue86;
                            }
                            else
                            {
                                vec4 sampledTextureValue8 = textureGather(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue49, multiplyAddValue54, sumValue11));
                                float multiplyAddValue55 = fract(fma(multiplyAddValue49, fragmentScalarConstants1.packedValues[374u], 0.5));
                                bool comparisonValue24 = sampledTextureValue8.x >= multiplyAddValue48;
                                bool comparisonValue25 = sampledTextureValue8.w >= multiplyAddValue48;
                                float comparisonValue26 = float(sampledTextureValue8.y >= multiplyAddValue48);
                                float comparisonValue28 = float(sampledTextureValue8.z >= multiplyAddValue48);
                                float multiplyAddValue56 = fma(multiplyAddValue55, comparisonValue25 ? (comparisonValue28 - 1.0) : comparisonValue28, float(comparisonValue25));
                                sampledTextureValue9 = intermediateValue86 + fma(fract(fma(multiplyAddValue54, fragmentScalarConstants1.packedValues[374u], 0.5)), fma(multiplyAddValue55, comparisonValue24 ? (comparisonValue26 - 1.0) : comparisonValue26, float(comparisonValue24)) - multiplyAddValue56, multiplyAddValue56);
                            }
                            sumValue20 = scalarValue23 + 1u;
                            intermediateValue86 = sampledTextureValue9;
                            scalarValue23 = sumValue20;
                            continue;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                            if ((comparisonValue79 && (int(scalarValue23) >= int(1u))) || (conditionValue11 && (int(scalarValue23) >= int(2u))))
                            {
                                break;
                            }
                            float multiplyAddValue191 = fma((rdSignedBitsToFloat(comparisonValue87 + scalarValue23) + 0.5) * fragmentScalarConstants1.packedValues[82u], fragmentScalarConstants1.packedValues[81u], multiplyAddValue188);
                            float multiplyAddValue192 = fma(sumValue123 * fragmentScalarConstants1.packedValues[82u], fragmentScalarConstants1.packedValues[81u], multiplyAddValue189);
                            if (comparisonValue79)
                            {
                                sampledTextureValue10 = (textureLod(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue191, multiplyAddValue192, sumValue122), 0.0).x >= multiplyAddValue190) ? (intermediateValue125 + 1.0) : intermediateValue125;
                            }
                            else
                            {
                                vec4 sampledTextureValue40 = textureGather(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue191, multiplyAddValue192, sumValue122));
                                float multiplyAddValue193 = fract(fma(multiplyAddValue191, fragmentScalarConstants1.packedValues[426u], 0.5));
                                bool comparisonValue88 = sampledTextureValue40.x >= multiplyAddValue190;
                                bool comparisonValue89 = sampledTextureValue40.w >= multiplyAddValue190;
                                float comparisonValue90 = float(sampledTextureValue40.y >= multiplyAddValue190);
                                float comparisonValue91 = float(sampledTextureValue40.z >= multiplyAddValue190);
                                float multiplyAddValue194 = fma(multiplyAddValue193, comparisonValue89 ? (comparisonValue91 - 1.0) : comparisonValue91, float(comparisonValue89));
                                sampledTextureValue10 = intermediateValue125 + fma(fract(fma(multiplyAddValue192, fragmentScalarConstants1.packedValues[426u], 0.5)), fma(multiplyAddValue193, comparisonValue88 ? (comparisonValue90 - 1.0) : comparisonValue90, float(comparisonValue88)) - multiplyAddValue194, multiplyAddValue194);
                            }
                            sumValue38 = scalarValue23 + 1u;
                            intermediateValue125 = sampledTextureValue10;
                            scalarValue23 = sumValue38;
                            continue;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                            scalarValue58 = sumValue27;
                            scalarValue22 = sumValue63;
                            continue;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                            intermediateValue83 = 1.0;
#endif
                        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                        sumValue15 = scalarValue22 + 1u;
                        intermediateValue85 = intermediateValue86;
                        scalarValue22 = sumValue15;
                        continue;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                        sumValue26 = scalarValue22 + 1u;
                        intermediateValue124 = intermediateValue125;
                        scalarValue22 = sumValue26;
                        continue;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                        uint productValue222 = (sampledTextureValue5 * 32u) + 4u;
                        vec4 sampledTextureValue36 = uintBitsToFloat(uvec4(texelFetch(zLights, int(productValue222)).x, texelFetch(zLights, int(productValue222 + 1u)).x, texelFetch(zLights, int(productValue222 + 2u)).x, texelFetch(zLights, int(productValue222 + 3u)).x));
                        float quotientValue56 = productValue121 / (productValue213 + 9.9999997473787516355514526367188e-05);
                        float productValue223 = spvNClamp(1.0 - (quotientValue56 * quotientValue56), 0.0, 1.0);
                        float quotientValue57 = (productValue223 * productValue223) * (1.0 / spvNMax(productValue121, 0.100000001490116119384765625));
                        float productValue136;
                        if (fragmentVectorConstants1.packedValues[23u].x > 0.0)
                        {
                            float quotientValue58 = spvNClamp(((1.0 - quotientValue57) - fragmentVectorConstants1.packedValues[93u].x) / (fragmentVectorConstants1.packedValues[93u].y - fragmentVectorConstants1.packedValues[93u].x), 0.0, 1.0);
                            productValue136 = spvNClamp((((quotientValue58 * quotientValue58) * fragmentVectorConstants1.packedValues[93u].z) * (3.0 - (quotientValue58 * 2.0))) + fragmentVectorConstants1.packedValues[93u].w, 0.0, 1.0) * quotientValue57;
                        }
                        else
                        {
                            productValue136 = quotientValue57;
                        }
                        float productValue224 = productValue136 * sampledTextureValue36.w;
                        branchMergedValue3 = intermediateValue83;
                        branchMergedValue8 = productValue224 * sampledTextureValue36.z;
                        branchMergedValue9 = productValue224 * sampledTextureValue36.y;
                        branchMergedValue10 = productValue224 * sampledTextureValue36.x;
                    }
                    else
                    {
                        branchMergedValue3 = 1.0;
                        branchMergedValue8 = 0.0;
                        branchMergedValue9 = 0.0;
                        branchMergedValue10 = 0.0;
                    }
                    intermediateValue82 = branchMergedValue3;
                    intermediateValue81 = branchMergedValue8;
                    intermediateValue80 = branchMergedValue9;
                    intermediateValue79 = branchMergedValue10;
                    float productValue225 = fragmentVectorConstants1.packedValues[80u].y * ((quotientValue22 * dotProductValue10) * intermediateValue82);
                    float productValue226 = (productValue225 * intermediateValue79) + scalarValue74;
                    float productValue227 = (productValue225 * intermediateValue80) + scalarValue75;
                    float productValue228 = (productValue225 * intermediateValue81) + scalarValue76;
                    uint sumValue107 = scalarValue73 + 1u;
                    if (int(sumValue107) < int(intermediateValue23))
                    {
                        scalarValue73 = sumValue107;
                        scalarValue74 = productValue226;
                        scalarValue75 = productValue227;
                        scalarValue76 = productValue228;
                        continue;
#endif
                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue10 = intermediateValue85 / (comparisonValue3 ? 1.0 : 4.0);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = intermediateValue124 / (comparisonValue79 ? 1.0 : 4.0);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    intermediateValue44 = sumValue27;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    else
                    {
                        intermediateValue34 = productValue226;
                        intermediateValue36 = productValue227;
                        intermediateValue38 = productValue228;
                        break;
                    }
                }
            }
            intermediateValue33 = intermediateValue34;
            intermediateValue35 = intermediateValue36;
            intermediateValue37 = intermediateValue38;
        }
        else
        {
            intermediateValue33 = 0.0;
            intermediateValue35 = 0.0;
            intermediateValue37 = 0.0;
        }
        float sumValue108 = 1.0 - fragmentVectorConstants1.packedValues[112u].x;
        productValue32 = (sumValue108 * intermediateValue33) + intermediateValue11;
        productValue33 = (sumValue108 * intermediateValue35) + intermediateValue12;
        productValue34 = (sumValue108 * intermediateValue37) + intermediateValue13;
    }
    else
    {
        productValue32 = intermediateValue11;
        productValue33 = intermediateValue12;
        productValue34 = intermediateValue13;
    }
    float intermediateValue25;
    float dotProductValue1;
    float intermediateValue15;
    float productValue41;
    float productValue42;
    float productValue43;
    float productValue44;
    float productValue45;
    float productValue46;
    float productValue47;
    float productValue48;
    float productValue49;
    bool comparisonValue5;
    for (;;)
    {
        float quotientValue59 = spvNClamp(((bitwiseValue4 * 0.062745101749897003173828125) - fragmentVectorConstants1.packedValues[31u].y) / spvNMax(fragmentVectorConstants1.packedValues[31u].x - fragmentVectorConstants1.packedValues[31u].y, 1.0), 0.0, 1.0);
        dotProductValue1 = dot(vec3(sumValue45, sumValue46, sumValue47), vec3(productValue106, productValue107, productValue108));
        float sumValue69 = spvNClamp(1.0 - spvNMax(dotProductValue1, 0.0), 0.0, 1.0);
        float productValue139 = sumValue69 * sumValue69;
        float productValue229 = (((productValue139 * productValue139) * (sumValue69 * 0.980000019073486328125)) + 0.0199999995529651641845703125) * (1.0 - (((quotientValue59 * quotientValue59) * quotientValue59) * fragmentVectorConstants1.packedValues[91u].x));
        intermediateValue15 = fragmentVectorConstants1.packedValues[22u].w;
        float productValue230 = (bitwiseValue8 * 9.2272217443678528070449829101562e-05) * intermediateValue15;
        float productValue142 = productValue109 * productValue109;
        float productValue143 = productValue142 * productValue142;
        float productValue231 = ((fragmentVectorConstants1.packedValues[37u].y * (productValue142 - productValue143)) + productValue143) * productValue109;
        productValue41 = fragmentVectorConstants1.packedValues[107u].w * fragmentVectorConstants1.packedValues[107u].x;
        productValue42 = fragmentVectorConstants1.packedValues[107u].w * fragmentVectorConstants1.packedValues[107u].y;
        productValue43 = fragmentVectorConstants1.packedValues[107u].w * fragmentVectorConstants1.packedValues[107u].z;
        productValue44 = fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[27u].w;
        productValue45 = fragmentVectorConstants1.packedValues[27u].y * fragmentVectorConstants1.packedValues[27u].w;
        productValue46 = fragmentVectorConstants1.packedValues[27u].z * fragmentVectorConstants1.packedValues[27u].w;
        productValue47 = (productValue229 * spvNMax((productValue230 * bitwiseValue5) + (productValue231 * productValue41), productValue44)) + productValue32;
        productValue48 = (productValue229 * spvNMax((productValue230 * bitwiseValue6) + (productValue231 * productValue42), productValue45)) + productValue33;
        productValue49 = (spvNMax((productValue230 * bitwiseValue7) + (productValue231 * productValue43), productValue46) * productValue229) + productValue34;
        comparisonValue5 = fragmentVectorConstants1.packedValues[35u].x != 0.0;
        float nonlinearValue1;
        if (comparisonValue5)
        {
            float productValue145 = (1.0 - (dotProductValue1 * dotProductValue1)) * 1.7689001560211181640625;
            if (productValue145 > 1.0)
            {
                intermediateValue25 = 0.0;
                break;
            }
            nonlinearValue1 = sqrt(1.0 - productValue145);
        }
        else
        {
            nonlinearValue1 = dotProductValue1;
        }
        float sumValue70 = spvNClamp(1.0 - nonlinearValue1, 0.0, 1.0);
        float productValue146 = sumValue70 * sumValue70;
        intermediateValue25 = 0.980000019073486328125 - ((productValue146 * productValue146) * (sumValue70 * 0.980000019073486328125));
        break;
    }
    float sumValue109 = 1.0 - intermediateValue25;
    float inverseLengthValue22 = inversesqrt(dot(vec3(multiplyAddValue110, multiplyAddValue111, multiplyAddValue112), vec3(multiplyAddValue110, multiplyAddValue111, multiplyAddValue112)));
    float productValue147 = inverseLengthValue22 * multiplyAddValue110;
    float productValue148 = inverseLengthValue22 * multiplyAddValue111;
    float productValue149 = inverseLengthValue22 * multiplyAddValue112;
    bool comparisonValue77 = fragmentVectorConstants1.packedValues[32u].y != 0.0;
    float productValue70;
    float productValue71;
    float productValue72;
    if ((comparisonValue77 && (fragmentVectorConstants1.packedValues[32u].z != 0.0)) && (fragmentVectorConstants1.packedValues[80u].w != 0.0))
    {
        productValue70 = spvNMax(intermediateValue15 + productValue41, productValue44) * fragmentVectorConstants1.packedValues[32u].z;
        productValue71 = spvNMax(intermediateValue15 + productValue42, productValue45) * fragmentVectorConstants1.packedValues[32u].z;
        productValue72 = spvNMax(intermediateValue15 + productValue43, productValue46) * fragmentVectorConstants1.packedValues[32u].z;
    }
    else
    {
        productValue70 = 0.0;
        productValue71 = 0.0;
        productValue72 = 0.0;
    }
    float intermediateValue48;
    float intermediateValue49;
    float intermediateValue50;
    float intermediateValue51;
    if (fragmentVectorConstants1.packedValues[32u].x != 0.0)
    {
        float quotientValue60 = spvNClamp(((fragmentVectorConstants1.packedValues[105u].x - fragmentVectorConstants1.packedValues[28u].x) + (nonlinearValue4 / fragmentVectorConstants1.packedValues[28u].z)) * fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0);
        float branchMergedValue14;
        float branchMergedValue18;
        float branchMergedValue19;
        float branchMergedValue20;
        if (quotientValue60 > 0.0)
        {
            float branchMergedValue27;
            float branchMergedValue29;
            float branchMergedValue30;
            float branchMergedValue31;
            if (comparisonValue77)
            {
                branchMergedValue27 = spvNMax(productValue72, 1.0) * fragmentVectorConstants1.packedValues[33u].z;
                branchMergedValue29 = spvNMax(productValue71, 1.0) * fragmentVectorConstants1.packedValues[33u].y;
                branchMergedValue30 = fragmentVectorConstants1.packedValues[33u].x * spvNMax(productValue70, 1.0);
                branchMergedValue31 = quotientValue60;
            }
            else
            {
                float quotientValue61 = spvNClamp(((productValue148 - fragmentVectorConstants1.packedValues[90u].x) + fragmentVectorConstants1.packedValues[90u].w) / (fragmentVectorConstants1.packedValues[90u].z - fragmentVectorConstants1.packedValues[90u].x), 0.0, 1.0);
                float productValue232 = 1.0 - ((quotientValue61 * quotientValue61) * (3.0 - (quotientValue61 * 2.0)));
                float productValue233 = (productValue232 * productValue232) * productValue232;
                float dotProductValue22 = dot(vec3(productValue147, productValue148, productValue149), vec3(fragmentVectorConstants1.packedValues[101u].xyz));
                float dotProductValue23 = dot(vec3(productValue147, productValue148, productValue149), vec3(fragmentVectorConstants1.packedValues[38u].xyz));
                float sumValue110 = fragmentVectorConstants1.packedValues[90u].x - fragmentVectorConstants1.packedValues[90u].w;
                float quotientValue62 = spvNClamp((productValue148 - sumValue110) / (fragmentVectorConstants1.packedValues[90u].y - sumValue110), 0.0, 1.0);
                float productValue234 = 1.0 - ((quotientValue62 * quotientValue62) * (3.0 - (quotientValue62 * 2.0)));
                float productValue235 = (productValue234 * productValue234) * productValue234;
                float productValue236 = (fragmentVectorConstants1.packedValues[29u].x * 0.75) * ((((dotProductValue23 * dotProductValue23) + 1.0) * fragmentVectorConstants1.packedValues[92u].w) + (((dotProductValue22 * dotProductValue22) + 1.0) * fragmentVectorConstants1.packedValues[111u].w));
                float exponentialValue4 = spvNClamp(exp2(log2(spvNMax(dotProductValue22, 0.0)) * fragmentVectorConstants1.packedValues[29u].w), 0.0, 1.0);
                float exponentialValue5 = spvNClamp(exp2(log2(spvNMax(dotProductValue23, 0.0)) * fragmentVectorConstants1.packedValues[29u].w), 0.0, 1.0);
                float productValue237 = 1.809999942779541015625 - (exponentialValue4 * 1.7999999523162841796875);
                float nonlinearValue9 = 0.036100022494792938232421875 / (sqrt(productValue237) * productValue237);
                float productValue238 = 1.809999942779541015625 - (exponentialValue5 * 1.7999999523162841796875);
                float nonlinearValue10 = 0.036100022494792938232421875 / (sqrt(productValue238) * productValue238);
                float productValue239 = exponentialValue4 * (fragmentVectorConstants1.packedValues[29u].y * fragmentVectorConstants1.packedValues[111u].w);
                float productValue240 = exponentialValue5 * (fragmentVectorConstants1.packedValues[29u].z * fragmentVectorConstants1.packedValues[92u].w);
                float productValue241 = (((productValue233 * fragmentVectorConstants1.packedValues[108u].x) * (((productValue240 * fragmentVectorConstants1.packedValues[92u].x) * nonlinearValue10) + ((productValue239 * fragmentVectorConstants1.packedValues[111u].x) * nonlinearValue9))) + (((productValue235 * (fragmentVectorConstants1.packedValues[108u].x - fragmentVectorConstants1.packedValues[30u].x)) + fragmentVectorConstants1.packedValues[30u].x) * productValue236)) * 0.079577468335628509521484375;
                float productValue242 = (((productValue233 * fragmentVectorConstants1.packedValues[108u].y) * (((productValue240 * fragmentVectorConstants1.packedValues[92u].y) * nonlinearValue10) + ((productValue239 * fragmentVectorConstants1.packedValues[111u].y) * nonlinearValue9))) + (((productValue235 * (fragmentVectorConstants1.packedValues[108u].y - fragmentVectorConstants1.packedValues[30u].y)) + fragmentVectorConstants1.packedValues[30u].y) * productValue236)) * 0.079577468335628509521484375;
                float productValue243 = (((productValue233 * fragmentVectorConstants1.packedValues[108u].z) * (((productValue240 * fragmentVectorConstants1.packedValues[92u].z) * nonlinearValue10) + ((productValue239 * fragmentVectorConstants1.packedValues[111u].z) * nonlinearValue9))) + (((productValue235 * (fragmentVectorConstants1.packedValues[108u].z - fragmentVectorConstants1.packedValues[30u].z)) + fragmentVectorConstants1.packedValues[30u].z) * productValue236)) * 0.079577468335628509521484375;
                float branchMergedValue38;
                float branchMergedValue40;
                float branchMergedValue41;
                float branchMergedValue42;
                if (fragmentVectorConstants1.packedValues[32u].w != 0.0)
                {
                    float comparisonValue78 = spvNMax(fragmentVectorConstants1.packedValues[34u].y, (scalarValue44 == 1.0) ? sampledTextureValue4 : productValue109);
                    branchMergedValue38 = ((productValue243 - fragmentVectorConstants1.packedValues[113u].z) * comparisonValue78) + fragmentVectorConstants1.packedValues[113u].z;
                    branchMergedValue40 = ((productValue242 - fragmentVectorConstants1.packedValues[113u].y) * comparisonValue78) + fragmentVectorConstants1.packedValues[113u].y;
                    branchMergedValue41 = ((productValue241 - fragmentVectorConstants1.packedValues[113u].x) * comparisonValue78) + fragmentVectorConstants1.packedValues[113u].x;
                    branchMergedValue42 = quotientValue60;
#endif
                }
                else
                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue10 = 1.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = 1.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    intermediateValue44 = 0.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue38 = productValue243;
                    branchMergedValue40 = productValue242;
                    branchMergedValue41 = productValue241;
                    branchMergedValue42 = quotientValue60;
#endif
                }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue78 = comparisonValue10;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue104 = comparisonValue12;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float quotientValue32 = intermediateValue44 / float(int(comparisonValue53 * comparisonValue53));
                float branchMergedValue9;
                if (quotientValue32 < 1.0)
                {
                    branchMergedValue9 = spvNMin(1.0, spvNMax(quotientValue32, 1.0 - fragmentVectorConstants1.packedValues[83u].w));
                }
                else
                {
                    branchMergedValue9 = 1.0;
                }
                intermediateValue32 = branchMergedValue9;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue27 = branchMergedValue38;
                branchMergedValue29 = branchMergedValue40;
                branchMergedValue30 = branchMergedValue41;
                branchMergedValue31 = branchMergedValue42;
#endif
            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            else
            {
                intermediateValue78 = 1.0;
            }
            float comparisonValue13;
            if ((int(uint(int(fragmentScalarConstants1.packedValues[296u]))) > int(0u)) && (int(uint(int(fragmentScalarConstants1.packedValues[93u]))) > int(0u)))
            {
                float multiplyAddValue63 = fma(fragmentVectorConstants1.packedValues[72u].w, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[70u].w, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[71u].w)) + fragmentVectorConstants1.packedValues[73u].w;
                float scalarValue24 = spvNMin(spvNMax(productValue22, fragmentScalarConstants1.packedValues[96u]), 1.0);
                float multiplyAddValue64 = ((fma(fragmentVectorConstants1.packedValues[72u].z, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[70u].z, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[71u].z)) + fragmentVectorConstants1.packedValues[73u].z) / multiplyAddValue63) - (fma(fragmentScalarConstants1.packedValues[50u], sqrt(fma(-scalarValue24, scalarValue24, 1.0)) / scalarValue24, fragmentScalarConstants1.packedValues[49u]) / (multiplyAddValue63 / multiplyAddValue63));
                float multiplyAddValue65 = fma((fma(fragmentVectorConstants1.packedValues[72u].x, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[70u].x, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[71u].x)) + fragmentVectorConstants1.packedValues[73u].x) / multiplyAddValue63, 0.5, 0.5);
                float multiplyAddValue70 = 1.0 - fma((fma(fragmentVectorConstants1.packedValues[72u].y, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[70u].y, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[71u].y)) + fragmentVectorConstants1.packedValues[73u].y) / multiplyAddValue63, 0.5, 0.5);
                uint clampedValue1 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[334u] + 0.5))), int(1u), int(9u)));
                bool conditionValue4 = !comparisonValue3;
                uint comparisonValue29 = (comparisonValue3 ? 1u : clampedValue1) >> 1u;
                float scalarValue25 = rdDot4Precise(fragmentVectorConstants1.packedValues[36u], vec4(1.0));
                float intermediateValue88;
                intermediateValue88 = 0.0;
                uint sumValue16;
                float intermediateValue89;
                uint scalarValue26 = 0u;
                for (;;)
                {
                    if ((comparisonValue3 && (int(scalarValue26) >= int(1u))) || (conditionValue4 && (int(clampedValue1) <= int(scalarValue26))))
                    {
                        break;
                    }
                    float sumValue14 = rdSignedBitsToFloat(scalarValue26 - comparisonValue29) + 0.5;
                    intermediateValue89 = intermediateValue88;
                    uint sumValue21;
                    float sampledTextureValue10;
                    uint scalarValue27 = 0u;
                    for (;;)
                    {
                        if ((conditionValue4 && (int(clampedValue1) <= int(scalarValue27))) || (comparisonValue3 && (int(scalarValue27) >= int(1u))))
                        {
                            break;
                        }
                        float multiplyAddValue71 = fma(multiplyAddValue65, fragmentScalarConstants1.packedValues[48u], ((rdSignedBitsToFloat(scalarValue27 - comparisonValue29) + 0.5) * fragmentScalarConstants1.packedValues[372u]) * fragmentScalarConstants1.packedValues[48u]);
                        float multiplyAddValue72 = fma(multiplyAddValue70, fragmentScalarConstants1.packedValues[48u], (sumValue14 * fragmentScalarConstants1.packedValues[372u]) * fragmentScalarConstants1.packedValues[48u]);
                        if (comparisonValue3)
                        {
                            sampledTextureValue10 = (textureLod(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue71, multiplyAddValue72, scalarValue25), 0.0).x >= multiplyAddValue64) ? (intermediateValue89 + 1.0) : intermediateValue89;
                        }
                        else
                        {
                            vec4 sampledTextureValue13 = textureGather(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue71, multiplyAddValue72, scalarValue25));
                            float multiplyAddValue73 = fract(fma(multiplyAddValue71, fragmentScalarConstants1.packedValues[374u], 0.5));
                            bool comparisonValue30 = sampledTextureValue13.x >= multiplyAddValue64;
                            bool comparisonValue31 = sampledTextureValue13.w >= multiplyAddValue64;
                            float comparisonValue32 = float(sampledTextureValue13.y >= multiplyAddValue64);
                            float comparisonValue33 = float(sampledTextureValue13.z >= multiplyAddValue64);
                            float multiplyAddValue74 = fma(multiplyAddValue73, comparisonValue31 ? (comparisonValue33 - 1.0) : comparisonValue33, float(comparisonValue31));
                            sampledTextureValue10 = intermediateValue89 + fma(fract(fma(multiplyAddValue72, fragmentScalarConstants1.packedValues[374u], 0.5)), fma(multiplyAddValue73, comparisonValue30 ? (comparisonValue32 - 1.0) : comparisonValue32, float(comparisonValue30)) - multiplyAddValue74, multiplyAddValue74);
                        }
                        sumValue21 = scalarValue27 + 1u;
                        intermediateValue89 = sampledTextureValue10;
                        scalarValue27 = sumValue21;
                        continue;
                    }
                    sumValue16 = scalarValue26 + 1u;
                    intermediateValue88 = intermediateValue89;
                    scalarValue26 = sumValue16;
                    continue;
                }
                float comparisonValue34 = intermediateValue88 / rdSignedBitsToFloat(comparisonValue3 ? 1u : (clampedValue1 * clampedValue1));
                comparisonValue13 = (comparisonValue34 < 1.0) ? spvNMin(spvNMax(comparisonValue34, 1.0 - fragmentScalarConstants1.packedValues[335u]), 1.0) : 1.0;
            }
            else
            {
                comparisonValue13 = 1.0;
            }
            float scalarValue28 = spvNMin(spvNMin(comparisonValue13, intermediateValue78), intermediateValue57);
            float productValue23 = spvNMax(fragmentScalarConstants1.packedValues[373u] - spvNMin(fragmentScalarConstants1.packedValues[373u] * 0.100000001490116119384765625, 8.0), 0.0);
            float quotientValue11 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[373u] - productValue23)) * (-(quotientValue2 + productValue23)), 0.0, 1.0);
            multiplyAddValue34 = fma((quotientValue11 * quotientValue11) * fma(quotientValue11, -2.0, 3.0), 1.0 - scalarValue28, scalarValue28);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            else
            {
                intermediateValue104 = 1.0;
            }
            float comparisonValue15;
            if ((int(uint(int(fragmentScalarConstants1.packedValues[308u]))) > int(0u)) && (int(uint(int(fragmentScalarConstants1.packedValues[101u]))) > int(0u)))
            {
                float multiplyAddValue195 = fma(fragmentVectorConstants1.packedValues[75u].w, multiplyAddValue177, fma(fragmentVectorConstants1.packedValues[73u].w, multiplyAddValue175, multiplyAddValue176 * fragmentVectorConstants1.packedValues[74u].w)) + fragmentVectorConstants1.packedValues[76u].w;
                float scalarValue102 = spvNMin(spvNMax(productValue260, fragmentScalarConstants1.packedValues[104u]), 1.0);
                float multiplyAddValue196 = ((fma(fragmentVectorConstants1.packedValues[75u].z, multiplyAddValue177, fma(fragmentVectorConstants1.packedValues[73u].z, multiplyAddValue175, multiplyAddValue176 * fragmentVectorConstants1.packedValues[74u].z)) + fragmentVectorConstants1.packedValues[76u].z) / multiplyAddValue195) - (fma(fragmentScalarConstants1.packedValues[50u], sqrt(fma(-scalarValue102, scalarValue102, 1.0)) / scalarValue102, fragmentScalarConstants1.packedValues[49u]) / (multiplyAddValue195 / multiplyAddValue195));
                float multiplyAddValue197 = fma((fma(fragmentVectorConstants1.packedValues[75u].x, multiplyAddValue177, fma(fragmentVectorConstants1.packedValues[73u].x, multiplyAddValue175, multiplyAddValue176 * fragmentVectorConstants1.packedValues[74u].x)) + fragmentVectorConstants1.packedValues[76u].x) / multiplyAddValue195, 0.5, 0.5);
                float multiplyAddValue198 = 1.0 - fma((fma(fragmentVectorConstants1.packedValues[75u].y, multiplyAddValue177, fma(fragmentVectorConstants1.packedValues[73u].y, multiplyAddValue175, multiplyAddValue176 * fragmentVectorConstants1.packedValues[74u].y)) + fragmentVectorConstants1.packedValues[76u].y) / multiplyAddValue195, 0.5, 0.5);
                uint clampedValue3 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[350u] + 0.5))), int(1u), int(9u)));
                bool conditionValue12 = !comparisonValue79;
                uint comparisonValue92 = (comparisonValue79 ? 1u : clampedValue3) >> 1u;
                float scalarValue103 = rdDot4Precise(fragmentVectorConstants1.packedValues[39u], vec4(1.0));
                float intermediateValue127;
                intermediateValue127 = 0.0;
                uint sumValue27;
                float intermediateValue128;
                uint scalarValue26 = 0u;
                for (;;)
                {
                    if ((conditionValue12 && (int(clampedValue3) <= int(scalarValue26))) || (comparisonValue79 && (int(scalarValue26) >= int(1u))))
                    {
                        break;
                    }
                    float sumValue124 = rdSignedBitsToFloat(scalarValue26 - comparisonValue92) + 0.5;
                    intermediateValue128 = intermediateValue127;
                    uint sumValue39;
                    float sampledTextureValue11;
                    uint scalarValue27 = 0u;
                    for (;;)
                    {
                        if (((int(clampedValue3) <= int(scalarValue27)) && conditionValue12) || (comparisonValue79 && (int(scalarValue27) >= int(1u))))
                        {
                            break;
                        }
                        float multiplyAddValue199 = fma(multiplyAddValue197, fragmentScalarConstants1.packedValues[48u], ((rdSignedBitsToFloat(scalarValue27 - comparisonValue92) + 0.5) * fragmentScalarConstants1.packedValues[424u]) * fragmentScalarConstants1.packedValues[48u]);
                        float multiplyAddValue200 = fma(multiplyAddValue198, fragmentScalarConstants1.packedValues[48u], (sumValue124 * fragmentScalarConstants1.packedValues[424u]) * fragmentScalarConstants1.packedValues[48u]);
                        if (comparisonValue79)
                        {
                            sampledTextureValue11 = (textureLod(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue199, multiplyAddValue200, scalarValue103), 0.0).x >= multiplyAddValue196) ? (intermediateValue128 + 1.0) : intermediateValue128;
                        }
                        else
                        {
                            vec4 sampledTextureValue41 = textureGather(sampler2DArray(materialTexture9, textureSampler9), vec3(multiplyAddValue199, multiplyAddValue200, scalarValue103));
                            float multiplyAddValue201 = fract(fma(multiplyAddValue199, fragmentScalarConstants1.packedValues[426u], 0.5));
                            bool comparisonValue93 = sampledTextureValue41.x >= multiplyAddValue196;
                            bool comparisonValue94 = sampledTextureValue41.w >= multiplyAddValue196;
                            float comparisonValue95 = float(sampledTextureValue41.y >= multiplyAddValue196);
                            float comparisonValue96 = float(sampledTextureValue41.z >= multiplyAddValue196);
                            float multiplyAddValue202 = fma(multiplyAddValue201, comparisonValue94 ? (comparisonValue96 - 1.0) : comparisonValue96, float(comparisonValue94));
                            sampledTextureValue11 = intermediateValue128 + fma(fract(fma(multiplyAddValue200, fragmentScalarConstants1.packedValues[426u], 0.5)), fma(multiplyAddValue201, comparisonValue93 ? (comparisonValue95 - 1.0) : comparisonValue95, float(comparisonValue93)) - multiplyAddValue202, multiplyAddValue202);
                        }
                        sumValue39 = scalarValue27 + 1u;
                        intermediateValue128 = sampledTextureValue11;
                        scalarValue27 = sumValue39;
                        continue;
                    }
                    sumValue27 = scalarValue26 + 1u;
                    intermediateValue127 = intermediateValue128;
                    scalarValue26 = sumValue27;
                    continue;
                }
                float comparisonValue97 = intermediateValue127 / rdSignedBitsToFloat(comparisonValue79 ? 1u : (clampedValue3 * clampedValue3));
                comparisonValue15 = (comparisonValue97 < 1.0) ? spvNMin(spvNMax(comparisonValue97, 1.0 - fragmentScalarConstants1.packedValues[351u]), 1.0) : 1.0;
            }
            else
            {
                comparisonValue15 = 1.0;
            }
            float scalarValue104 = spvNMin(spvNMin(comparisonValue15, intermediateValue104), intermediateValue66);
            float productValue261 = spvNMax(fragmentScalarConstants1.packedValues[425u] - spvNMin(fragmentScalarConstants1.packedValues[425u] * 0.100000001490116119384765625, 8.0), 0.0);
            float quotientValue68 = spvNClamp((-(productValue261 + quotientValue2)) * (1.0 / (fragmentScalarConstants1.packedValues[425u] - productValue261)), 0.0, 1.0);
            multiplyAddValue28 = fma((quotientValue68 * quotientValue68) * fma(quotientValue68, -2.0, 3.0), 1.0 - scalarValue104, scalarValue104);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                intermediateValue32 = 1.0;
            }
            float scalarValue59 = spvNMin(intermediateValue16, spvNMin(intermediateValue24, intermediateValue32));
            float productValue123 = spvNMax(0.0, fragmentVectorConstants1.packedValues[93u].y - spvNMin(fragmentVectorConstants1.packedValues[93u].y * 0.100000001490116119384765625, 8.0));
            float quotientValue33 = spvNClamp((((-0.0) - quotientValue17) - productValue123) / (fragmentVectorConstants1.packedValues[93u].y - productValue123), 0.0, 1.0);
            productValue45 = (((quotientValue33 * quotientValue33) * (1.0 - scalarValue59)) * (3.0 - (quotientValue33 * 2.0))) + scalarValue59;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            branchMergedValue14 = branchMergedValue27;
            branchMergedValue18 = branchMergedValue29;
            branchMergedValue19 = branchMergedValue30;
            branchMergedValue20 = branchMergedValue31;
#endif
        }
        else
        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue34 = 1.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue28 = 1.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            productValue45 = 1.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            branchMergedValue14 = 0.0;
            branchMergedValue18 = 0.0;
            branchMergedValue19 = 0.0;
            branchMergedValue20 = quotientValue60;
#endif
        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue75 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentScalarConstants1.packedValues[87u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentScalarConstants1.packedValues[86u], fma(fragmentVectorConstants1.packedValues[0u].x, fragmentScalarConstants1.packedValues[84u], fragmentVectorConstants1.packedValues[1u].x * fragmentScalarConstants1.packedValues[85u])));
        float multiplyAddValue76 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentScalarConstants1.packedValues[87u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentScalarConstants1.packedValues[86u], fma(fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[84u], fragmentVectorConstants1.packedValues[1u].y * fragmentScalarConstants1.packedValues[85u])));
        float multiplyAddValue77 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentScalarConstants1.packedValues[87u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentScalarConstants1.packedValues[86u], fma(fragmentVectorConstants1.packedValues[0u].z, fragmentScalarConstants1.packedValues[84u], fragmentVectorConstants1.packedValues[1u].z * fragmentScalarConstants1.packedValues[85u])));
        vec3 vectorValue9 = vec3(multiplyAddValue75, multiplyAddValue76, multiplyAddValue77);
        float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
        float scalarValue29 = -quotientValue3;
        float scalarValue30 = -quotientValue4;
        float scalarValue31 = -quotientValue5;
        vec3 vectorValue10 = vec3(scalarValue29, scalarValue30, scalarValue31);
        float scalarValue32 = spvNMax(rdDot3Precise2(productValue3, vectorValue10), 0.0);
        float multiplyAddValue78 = fma(multiplyAddValue75, inverseLengthValue8, scalarValue29);
        float multiplyAddValue80 = fma(multiplyAddValue76, inverseLengthValue8, scalarValue30);
        float multiplyAddValue81 = fma(multiplyAddValue77, inverseLengthValue8, scalarValue31);
        vec3 vectorValue11 = vec3(multiplyAddValue78, multiplyAddValue80, multiplyAddValue81);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
        float productValue24 = spvNMax(rdEvaluateFloatExpression(bitfieldExtract(sampledTextureValue6.x, int(8u), int(8u))) * 0.0039215688593685626983642578125, 0.0500000007450580596923828125);
        float productValue25 = spvNMax(rdDot3Precise2(productValue3, vec3(inverseLengthValue8 * multiplyAddValue75, inverseLengthValue8 * multiplyAddValue76, inverseLengthValue8 * multiplyAddValue77)), 0.0);
        float productValue26 = productValue24 * productValue24;
        vec3 productValue27 = vec3(inverseLengthValue9 * multiplyAddValue78, inverseLengthValue9 * multiplyAddValue80, inverseLengthValue9 * multiplyAddValue81);
        float scalarValue33 = spvNMax(rdDot3Precise2(productValue3, productValue27), 0.0);
        float multiplyAddValue82 = fma(scalarValue33 * scalarValue33, fma(productValue26, productValue26, -1.0), 1.0);
        float productValue28 = productValue26 * 0.5;
        float multiplyAddValue83 = fma(-productValue26, 0.5, 1.0);
        float sumValue19 = spvNMax(1.0 - spvNMax(rdDot3Precise2(vectorValue10, productValue27), 0.0), 0.0);
        float productValue29 = sumValue19 * sumValue19;
        float multiplyAddValue84 = multiplyAddValue34 * (((((productValue25 / (fma(productValue25, multiplyAddValue83, productValue28) + 9.9999997473787516355514526367188e-05)) * (scalarValue32 / (fma(scalarValue32, multiplyAddValue83, productValue28) + 9.9999997473787516355514526367188e-05))) * (((productValue26 * productValue26) / ((multiplyAddValue82 * multiplyAddValue82) * 3.1415927410125732421875)) * fma(sumValue19 * (productValue29 * productValue29), 0.980000019073486328125, 0.0199999995529651641845703125))) / fma(productValue25 * scalarValue32, 4.0, 9.9999997473787516355514526367188e-05)) * productValue25);
        productValue6 = (((fragmentScalarConstants1.packedValues[303u] * fragmentVectorConstants1.packedValues[75u].z) * fragmentScalarConstants1.packedValues[336u]) * multiplyAddValue84) * fragmentScalarConstants1.packedValues[305u];
        productValue7 = (((fragmentScalarConstants1.packedValues[303u] * fragmentVectorConstants1.packedValues[75u].y) * fragmentScalarConstants1.packedValues[336u]) * multiplyAddValue84) * fragmentScalarConstants1.packedValues[305u];
        productValue8 = (((fragmentScalarConstants1.packedValues[303u] * fragmentVectorConstants1.packedValues[75u].x) * fragmentScalarConstants1.packedValues[336u]) * multiplyAddValue84) * fragmentScalarConstants1.packedValues[305u];
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue75 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentScalarConstants1.packedValues[87u], fma(fragmentVectorConstants1.packedValues[2u].x, fragmentScalarConstants1.packedValues[86u], fma(fragmentVectorConstants1.packedValues[0u].x, fragmentScalarConstants1.packedValues[84u], fragmentVectorConstants1.packedValues[1u].x * fragmentScalarConstants1.packedValues[85u])));
        float multiplyAddValue76 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentScalarConstants1.packedValues[87u], fma(fragmentVectorConstants1.packedValues[2u].y, fragmentScalarConstants1.packedValues[86u], fma(fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[84u], fragmentVectorConstants1.packedValues[1u].y * fragmentScalarConstants1.packedValues[85u])));
        float multiplyAddValue77 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentScalarConstants1.packedValues[87u], fma(fragmentVectorConstants1.packedValues[2u].z, fragmentScalarConstants1.packedValues[86u], fma(fragmentVectorConstants1.packedValues[0u].z, fragmentScalarConstants1.packedValues[84u], fragmentVectorConstants1.packedValues[1u].z * fragmentScalarConstants1.packedValues[85u])));
        vec3 vectorValue9 = vec3(multiplyAddValue75, multiplyAddValue76, multiplyAddValue77);
        float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
        float productValue25 = spvNMax(rdDot3Precise2(productValue3, vec3(inverseLengthValue8 * multiplyAddValue75, inverseLengthValue8 * multiplyAddValue76, inverseLengthValue8 * multiplyAddValue77)), 0.0);
        float scalarValue29 = -quotientValue3;
        float scalarValue30 = -quotientValue4;
        float scalarValue31 = -quotientValue5;
        vec3 vectorValue10 = vec3(scalarValue29, scalarValue30, scalarValue31);
        float scalarValue32 = spvNMax(rdDot3Precise2(productValue3, vectorValue10), 0.0);
        float multiplyAddValue78 = fma(multiplyAddValue75, inverseLengthValue8, scalarValue29);
        float multiplyAddValue80 = fma(multiplyAddValue76, inverseLengthValue8, scalarValue30);
        float multiplyAddValue81 = fma(multiplyAddValue77, inverseLengthValue8, scalarValue31);
        vec3 vectorValue11 = vec3(multiplyAddValue78, multiplyAddValue80, multiplyAddValue81);
        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
        float scalarValue105 = spvNMax(productValue259, 0.0500000007450580596923828125);
        float productValue262 = scalarValue105 * scalarValue105;
        vec3 productValue27 = vec3(inverseLengthValue9 * multiplyAddValue78, inverseLengthValue9 * multiplyAddValue80, inverseLengthValue9 * multiplyAddValue81);
        float scalarValue33 = spvNMax(rdDot3Precise2(productValue3, productValue27), 0.0);
        float multiplyAddValue203 = fma(scalarValue33 * scalarValue33, fma(productValue262, productValue262, -1.0), 1.0);
        float productValue263 = productValue262 * 0.5;
        float multiplyAddValue204 = fma(-productValue262, 0.5, 1.0);
        float sumValue19 = spvNMax(1.0 - spvNMax(rdDot3Precise2(vectorValue10, productValue27), 0.0), 0.0);
        float productValue29 = sumValue19 * sumValue19;
        float multiplyAddValue205 = multiplyAddValue28 * (((((productValue25 / (fma(productValue25, multiplyAddValue204, productValue263) + 9.9999997473787516355514526367188e-05)) * (scalarValue32 / (fma(scalarValue32, multiplyAddValue204, productValue263) + 9.9999997473787516355514526367188e-05))) * (((productValue262 * productValue262) / ((multiplyAddValue203 * multiplyAddValue203) * 3.1415927410125732421875)) * fma(sumValue19 * (productValue29 * productValue29), 0.980000019073486328125, 0.0199999995529651641845703125))) / fma(productValue25 * scalarValue32, 4.0, 9.9999997473787516355514526367188e-05)) * productValue25);
        productValue19 = (((fragmentScalarConstants1.packedValues[319u] * fragmentVectorConstants1.packedValues[79u].x) * fragmentScalarConstants1.packedValues[352u]) * multiplyAddValue205) * fragmentScalarConstants1.packedValues[321u];
        productValue20 = (((fragmentScalarConstants1.packedValues[319u] * fragmentVectorConstants1.packedValues[79u].y) * fragmentScalarConstants1.packedValues[352u]) * multiplyAddValue205) * fragmentScalarConstants1.packedValues[321u];
        productValue21 = (((fragmentScalarConstants1.packedValues[319u] * fragmentVectorConstants1.packedValues[79u].z) * fragmentScalarConstants1.packedValues[352u]) * multiplyAddValue205) * fragmentScalarConstants1.packedValues[321u];
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float multiplyAddValue132 = fma(fragmentVectorConstants1.packedValues[3u].x, fragmentVectorConstants1.packedValues[21u].w, fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[21u].z, fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[21u].y, fragmentVectorConstants1.packedValues[21u].x * fragmentVectorConstants1.packedValues[0u].x)));
        float multiplyAddValue133 = fma(fragmentVectorConstants1.packedValues[3u].y, fragmentVectorConstants1.packedValues[21u].w, fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[21u].z, fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[21u].y, fragmentVectorConstants1.packedValues[21u].x * fragmentVectorConstants1.packedValues[0u].y)));
        float multiplyAddValue134 = fma(fragmentVectorConstants1.packedValues[3u].z, fragmentVectorConstants1.packedValues[21u].w, fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[21u].z, fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[21u].y, fragmentVectorConstants1.packedValues[21u].x * fragmentVectorConstants1.packedValues[0u].z)));
        float inverseLengthValue20 = inversesqrt(dot(vec3(multiplyAddValue132, multiplyAddValue133, multiplyAddValue134), vec3(multiplyAddValue132, multiplyAddValue133, multiplyAddValue134)));
        float productValue124 = inverseLengthValue20 * multiplyAddValue132;
        float productValue125 = inverseLengthValue20 * multiplyAddValue133;
        float productValue128 = inverseLengthValue20 * multiplyAddValue134;
        float dotProductValue6 = spvNMax(dot(vec3(productValue106, productValue107, productValue108), vec3(productValue124, productValue125, productValue128)), 0.0);
        float dotProductValue7 = spvNMax(dot(vec3(productValue106, productValue107, productValue108), vec3(sumValue45, sumValue46, sumValue47)), 0.0);
        float sumValue64 = productValue124 - quotientValue27;
        float sumValue65 = productValue125 - quotientValue28;
        float sumValue66 = productValue128 - quotientValue29;
        float inverseLengthValue21 = inversesqrt(dot(vec3(sumValue64, sumValue65, sumValue66), vec3(sumValue64, sumValue65, sumValue66)));
        float productValue129 = inverseLengthValue21 * sumValue64;
        float productValue130 = inverseLengthValue21 * sumValue65;
        float productValue131 = inverseLengthValue21 * sumValue66;
        float bitwiseValue11 = spvNMax(float((sampledTextureValue20.x >> 8u) & 255u) * 0.0039215688593685626983642578125, 0.0500000007450580596923828125);
        float productValue132 = bitwiseValue11 * bitwiseValue11;
        float productValue133 = productValue132 * productValue132;
        float dotProductValue8 = spvNMax(dot(vec3(productValue106, productValue107, productValue108), vec3(productValue129, productValue130, productValue131)), 0.0);
        float productValue134 = ((dotProductValue8 * dotProductValue8) * (productValue133 + (-1.0))) + 1.0;
        float productValue135 = productValue132 * 0.5;
        float sumValue67 = 1.0 - productValue135;
        float sumValue68 = productValue135 + 9.9999997473787516355514526367188e-05;
        float dotProductValue9 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue45, sumValue46, sumValue47), vec3(productValue129, productValue130, productValue131)), 0.0), 0.0, 1.0);
        float productValue137 = dotProductValue9 * dotProductValue9;
        float quotientValue34 = ((((dotProductValue7 / ((sumValue67 * dotProductValue7) + sumValue68)) * (productValue133 / ((productValue134 * productValue134) * 3.1415927410125732421875))) * (dotProductValue6 / ((sumValue67 * dotProductValue6) + sumValue68))) * (((productValue137 * productValue137) * (dotProductValue9 * 0.980000019073486328125)) + 0.0199999995529651641845703125)) / (((dotProductValue6 * 4.0) * dotProductValue7) + 9.9999997473787516355514526367188e-05);
        float productValue138 = fragmentVectorConstants1.packedValues[84u].x * (fragmentVectorConstants1.packedValues[75u].w * productValue45);
        intermediateValue11 = (((productValue138 * fragmentVectorConstants1.packedValues[75u].x) * dotProductValue6) * quotientValue34) * fragmentVectorConstants1.packedValues[76u].y;
        intermediateValue12 = (((productValue138 * fragmentVectorConstants1.packedValues[75u].y) * dotProductValue6) * quotientValue34) * fragmentVectorConstants1.packedValues[76u].y;
        intermediateValue13 = (((productValue138 * fragmentVectorConstants1.packedValues[75u].z) * dotProductValue6) * quotientValue34) * fragmentVectorConstants1.packedValues[76u].y;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue48 = branchMergedValue20;
        intermediateValue49 = branchMergedValue19;
        intermediateValue50 = branchMergedValue18;
        intermediateValue51 = branchMergedValue14;
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON || RD_PLATFORM == RD_PLATFORM_SM50
    else
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue15;
    float dotProductValue1;
    float intermediateValue14;
    float productValue33;
    float productValue34;
    float productValue35;
    float productValue36;
    float productValue37;
    float productValue38;
    float productValue39;
    float productValue40;
    float productValue41;
    bool comparisonValue2;
    for (;;)
#endif
    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue6 = 0.0;
        productValue7 = 0.0;
        productValue8 = 0.0;
    }
    float productValue30 = bitwiseValue * 0.0039215688593685626983642578125;
    float multiplyAddValue85 = spvNClamp(fma(bitwiseValue, 0.062745101749897003173828125, -fragmentScalarConstants1.packedValues[117u]) / spvNMax(fragmentScalarConstants1.packedValues[116u] - fragmentScalarConstants1.packedValues[117u], 1.0), 0.0, 1.0);
    float scalarValue34 = rdDot3Precise2(vec3(-quotientValue3, -quotientValue4, -quotientValue5), productValue3);
    float sumValue24 = spvNMax(1.0 - spvNMax(scalarValue34, 0.0), 0.0);
    float productValue31 = sumValue24 * sumValue24;
    float multiplyAddValue86 = fma(sumValue24 * (productValue31 * productValue31), 0.980000019073486328125, 0.0199999995529651641845703125) * fma(-(multiplyAddValue85 * (multiplyAddValue85 * multiplyAddValue85)), fragmentScalarConstants1.packedValues[344u], 1.0);
    float productValue50 = productValue30 * productValue30;
    float productValue52 = productValue30 * (productValue50 * productValue50);
    float multiplyAddValue87 = fma(fragmentScalarConstants1.packedValues[137u], fma(productValue50, productValue30, -productValue52), productValue52);
    float productValue53 = fragmentScalarConstants1.packedValues[103u] * fragmentVectorConstants1.packedValues[25u].x;
    float productValue57 = fragmentScalarConstants1.packedValues[103u] * fragmentVectorConstants1.packedValues[25u].y;
    float productValue58 = fragmentScalarConstants1.packedValues[103u] * fragmentVectorConstants1.packedValues[25u].z;
    float multiplyAddValue88 = fma(multiplyAddValue86, spvNMax(fma((bitwiseValue1 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue5, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * fragmentScalarConstants1.packedValues[91u], 6.0, (multiplyAddValue87 * fragmentVectorConstants1.packedValues[94u].x) * fragmentScalarConstants1.packedValues[379u]), productValue53), productValue8);
    float multiplyAddValue89 = fma(multiplyAddValue86, spvNMax(fma((bitwiseValue1 * (rdEvaluateFloatExpression(scalarValue5 & 255u) * 0.0039215688593685626983642578125)) * fragmentScalarConstants1.packedValues[91u], 6.0, (multiplyAddValue87 * fragmentVectorConstants1.packedValues[94u].y) * fragmentScalarConstants1.packedValues[379u]), productValue57), productValue7);
    float multiplyAddValue90 = fma(multiplyAddValue86, spvNMax(fma((bitwiseValue1 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue6, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * fragmentScalarConstants1.packedValues[91u], 6.0, (multiplyAddValue87 * fragmentVectorConstants1.packedValues[94u].z) * fragmentScalarConstants1.packedValues[379u]), productValue58), productValue6);
    bool comparisonValue35 = fragmentScalarConstants1.packedValues[132u] != 0.0;
    float multiplyAddValue91 = fma(-scalarValue34, scalarValue34, 1.0);
    bool comparisonValue36 = multiplyAddValue91 <= 0.565323054790496826171875;
    float multiplyAddValue92 = spvNClamp(1.0 - ((comparisonValue35 && comparisonValue36) ? sqrt(fma(-multiplyAddValue91, 1.7689001560211181640625, 1.0)) : scalarValue34), 0.0, 1.0);
    float productValue59 = multiplyAddValue92 * multiplyAddValue92;
    float multiplyAddValue93 = ((!comparisonValue36) && comparisonValue35) ? 1.0 : ((fma(multiplyAddValue92 * (productValue59 * productValue59), 0.980000019073486328125, 0.0199999995529651641845703125) - 1.0) + 1.0);
    bool comparisonValue37 = fragmentVectorConstants1.packedValues[30u].y != 0.0;
    float multiplyAddValue44;
    float multiplyAddValue45;
    float multiplyAddValue46;
    if ((comparisonValue37 && (fragmentVectorConstants1.packedValues[30u].z != 0.0)) && (fragmentScalarConstants1.packedValues[307u] != 0.0))
    {
        multiplyAddValue44 = spvNMax(productValue58, fma(fragmentVectorConstants1.packedValues[94u].z, fragmentScalarConstants1.packedValues[379u], fragmentScalarConstants1.packedValues[91u])) * fragmentScalarConstants1.packedValues[122u];
        multiplyAddValue45 = spvNMax(productValue57, fma(fragmentVectorConstants1.packedValues[94u].y, fragmentScalarConstants1.packedValues[379u], fragmentScalarConstants1.packedValues[91u])) * fragmentScalarConstants1.packedValues[122u];
        multiplyAddValue46 = spvNMax(productValue53, fma(fragmentVectorConstants1.packedValues[94u].x, fragmentScalarConstants1.packedValues[379u], fragmentScalarConstants1.packedValues[91u])) * fragmentScalarConstants1.packedValues[122u];
    }
    else
    {
        multiplyAddValue44 = 0.0;
        multiplyAddValue45 = 0.0;
        multiplyAddValue46 = 0.0;
    }
    float intermediateValue62;
    float intermediateValue63;
    float intermediateValue65;
    float intermediateValue67;
    if (fragmentVectorConstants1.packedValues[30u].x != 0.0)
    {
        float quotientValue12 = spvNClamp((((nonlinearValue / fragmentScalarConstants1.packedValues[106u]) + fragmentScalarConstants1.packedValues[368u]) - fragmentScalarConstants1.packedValues[104u]) * fragmentScalarConstants1.packedValues[105u], 0.0, 1.0);
        float intermediateValue64;
        float intermediateValue66;
        float intermediateValue68;
        if (quotientValue12 > 0.0)
        {
            float productValue36;
            float productValue37;
            float productValue38;
            if (comparisonValue37)
            {
                productValue36 = spvNMax(multiplyAddValue46, 1.0) * fragmentVectorConstants1.packedValues[31u].x;
                productValue37 = spvNMax(multiplyAddValue45, 1.0) * fragmentVectorConstants1.packedValues[31u].y;
                productValue38 = spvNMax(multiplyAddValue44, 1.0) * fragmentVectorConstants1.packedValues[31u].z;
            }
            else
            {
                vec3 vectorValue12 = vec3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue12, vectorValue12));
                float sumValue30 = fragmentScalarConstants1.packedValues[343u] - fragmentScalarConstants1.packedValues[340u];
                float multiplyAddValue94 = fma(multiplyAddValue2, inverseLengthValue10, sumValue30);
                float quotientValue13 = spvNClamp(multiplyAddValue94 * (1.0 / (sumValue30 + (fragmentScalarConstants1.packedValues[342u] - fragmentScalarConstants1.packedValues[343u]))), 0.0, 1.0);
                float multiplyAddValue95 = fma(-fma(quotientValue13, -2.0, 3.0), quotientValue13 * quotientValue13, 1.0);
                float productValue60 = multiplyAddValue95 * (multiplyAddValue95 * multiplyAddValue95);
                vec3 productValue64 = vec3(inverseLengthValue10 * multiplyAddValue1, inverseLengthValue10 * multiplyAddValue2, inverseLengthValue10 * multiplyAddValue3);
                float scalarValue35 = rdDot3Precise2(productValue64, vec3(fragmentVectorConstants1.packedValues[89u].xyz));
                float scalarValue36 = rdDot3Precise2(productValue64, vec3(fragmentVectorConstants1.packedValues[35u].xyz));
                float quotientValue14 = spvNClamp(multiplyAddValue94 * (1.0 / (sumValue30 + fragmentScalarConstants1.packedValues[341u])), 0.0, 1.0);
                float multiplyAddValue96 = fma(-fma(quotientValue14, -2.0, 3.0), quotientValue14 * quotientValue14, 1.0);
                float productValue65 = multiplyAddValue96 * (multiplyAddValue96 * multiplyAddValue96);
                float multiplyAddValue97 = fma(fma(scalarValue35, scalarValue35, 1.0) * fragmentScalarConstants1.packedValues[395u], 0.75, (fma(scalarValue36, scalarValue36, 1.0) * fragmentScalarConstants1.packedValues[351u]) * 0.75);
                float exponentialValue = spvNMin(exp2(log2(spvNMax(scalarValue36, 0.0)) * fragmentScalarConstants1.packedValues[111u]), 1.0);
                float exponentialValue1 = spvNMin(exp2(log2(spvNMax(scalarValue35, 0.0)) * fragmentScalarConstants1.packedValues[111u]), 1.0);
                float multiplyAddValue98 = fma(-exponentialValue1, 1.7999999523162841796875, 1.809999942779541015625);
                float multiplyAddValue99 = fma(-exponentialValue, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue2 = 0.0361000001430511474609375 / (sqrt(multiplyAddValue98) * multiplyAddValue98);
                float nonlinearValue3 = 0.0361000001430511474609375 / (multiplyAddValue99 * sqrt(multiplyAddValue99));
                float multiplyAddValue100 = fma((fma(productValue65, fragmentVectorConstants1.packedValues[95u].x - fragmentVectorConstants1.packedValues[28u].x, fragmentVectorConstants1.packedValues[28u].x) * fragmentScalarConstants1.packedValues[108u]) * 0.079577468335628509521484375, multiplyAddValue97, fma(exponentialValue1 * ((fragmentVectorConstants1.packedValues[98u].x * fragmentScalarConstants1.packedValues[395u]) * fragmentScalarConstants1.packedValues[109u]), nonlinearValue2, nonlinearValue3 * (exponentialValue * ((fragmentVectorConstants1.packedValues[87u].x * fragmentScalarConstants1.packedValues[351u]) * fragmentScalarConstants1.packedValues[110u]))) * ((productValue60 * fragmentVectorConstants1.packedValues[95u].x) * 0.079577468335628509521484375));
                float multiplyAddValue101 = fma((fma(productValue65, fragmentVectorConstants1.packedValues[95u].y - fragmentVectorConstants1.packedValues[28u].y, fragmentVectorConstants1.packedValues[28u].y) * fragmentScalarConstants1.packedValues[108u]) * 0.079577468335628509521484375, multiplyAddValue97, fma(exponentialValue1 * ((fragmentVectorConstants1.packedValues[98u].y * fragmentScalarConstants1.packedValues[395u]) * fragmentScalarConstants1.packedValues[109u]), nonlinearValue2, nonlinearValue3 * (exponentialValue * ((fragmentVectorConstants1.packedValues[87u].y * fragmentScalarConstants1.packedValues[351u]) * fragmentScalarConstants1.packedValues[110u]))) * ((productValue60 * fragmentVectorConstants1.packedValues[95u].y) * 0.079577468335628509521484375));
                float multiplyAddValue102 = fma((fma(productValue65, fragmentVectorConstants1.packedValues[95u].z - fragmentVectorConstants1.packedValues[28u].z, fragmentVectorConstants1.packedValues[28u].z) * fragmentScalarConstants1.packedValues[108u]) * 0.079577468335628509521484375, multiplyAddValue97, fma(exponentialValue1 * ((fragmentVectorConstants1.packedValues[98u].z * fragmentScalarConstants1.packedValues[395u]) * fragmentScalarConstants1.packedValues[109u]), nonlinearValue2, nonlinearValue3 * (exponentialValue * ((fragmentVectorConstants1.packedValues[87u].z * fragmentScalarConstants1.packedValues[351u]) * fragmentScalarConstants1.packedValues[110u]))) * ((productValue60 * fragmentVectorConstants1.packedValues[95u].z) * 0.079577468335628509521484375));
                bool comparisonValue38 = fragmentScalarConstants1.packedValues[123u] != 0.0;
                float comparisonValue39 = spvNMax((scalarValue2 == 1.0) ? sampledTextureValue5 : productValue30, fragmentScalarConstants1.packedValues[129u]);
                productValue36 = comparisonValue38 ? fma(comparisonValue39, multiplyAddValue100 - fragmentVectorConstants1.packedValues[99u].x, fragmentVectorConstants1.packedValues[99u].x) : multiplyAddValue100;
                productValue37 = comparisonValue38 ? fma(comparisonValue39, multiplyAddValue101 - fragmentVectorConstants1.packedValues[99u].y, fragmentVectorConstants1.packedValues[99u].y) : multiplyAddValue101;
                productValue38 = comparisonValue38 ? fma(comparisonValue39, multiplyAddValue102 - fragmentVectorConstants1.packedValues[99u].z, fragmentVectorConstants1.packedValues[99u].z) : multiplyAddValue102;
            }
            intermediateValue68 = productValue36;
            intermediateValue66 = productValue37;
            intermediateValue64 = productValue38;
        }
        else
        {
            intermediateValue68 = 0.0;
            intermediateValue66 = 0.0;
            intermediateValue64 = 0.0;
        }
        intermediateValue62 = quotientValue12;
        intermediateValue63 = intermediateValue64;
        intermediateValue65 = intermediateValue66;
        intermediateValue67 = intermediateValue68;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue19 = 0.0;
        productValue20 = 0.0;
        productValue21 = 0.0;
    }
    bool comparisonValue98 = fragmentScalarConstants1.packedValues[102u] != 0.0;
    float multiplyAddValue40;
    float multiplyAddValue41;
    float multiplyAddValue42;
    if (comparisonValue98)
    {
        float productValue264 = scalarValue93 * fragmentScalarConstants1.packedValues[146u];
        bool conditionValue13 = scalarValue93 < fragmentVectorConstants1.packedValues[36u].x;
        bool conditionValue14 = scalarValue93 < fragmentVectorConstants1.packedValues[36u].y;
        float nonlinearValue11 = spvNMin(fragmentVectorConstants1.packedValues[78u].z - 1.0, floor(spvNClamp((log2(scalarValue93) - fragmentScalarConstants1.packedValues[358u]) * fragmentScalarConstants1.packedValues[356u], 0.0, 1.0) * (fragmentVectorConstants1.packedValues[78u].z - 2.0)) + 2.0);
        float comparisonValue99 = conditionValue14 ? 1.0 : nonlinearValue11;
        float multiplyAddValue206 = spvNMin(fragmentVectorConstants1.packedValues[78u].x - 1.0, floor(spvNClamp(fma(productValue264, fragmentScalarConstants1.packedValues[147u], quotientValue) / fma(productValue264, fragmentScalarConstants1.packedValues[147u], productValue264 * fragmentScalarConstants1.packedValues[147u]), 0.0, 1.0) * fragmentScalarConstants1.packedValues[312u]));
        float multiplyAddValue207 = spvNMin(fragmentVectorConstants1.packedValues[78u].y - 1.0, floor(spvNClamp(fma(scalarValue93, fragmentScalarConstants1.packedValues[146u], quotientValue1) / (productValue264 + productValue264), 0.0, 1.0) * fragmentScalarConstants1.packedValues[313u]));
        float intermediateValue81;
        float intermediateValue83;
        float intermediateValue85;
        if (!(((conditionValue13 ? 0.0 : comparisonValue99) >= fragmentScalarConstants1.packedValues[314u]) || ((multiplyAddValue207 >= fragmentScalarConstants1.packedValues[313u]) || ((multiplyAddValue206 >= fragmentScalarConstants1.packedValues[312u]) || ((((!conditionValue14) && (nonlinearValue11 < 0.0)) && (!conditionValue13)) || ((multiplyAddValue206 < 0.0) || (multiplyAddValue207 < 0.0)))))))
        {
            float multiplyAddValue208 = fma(multiplyAddValue207, fragmentScalarConstants1.packedValues[312u], multiplyAddValue206);
            uint scalarValue106 = uint(int(fragmentScalarConstants1.packedValues[315u]));
            uint multiplyAddValue209 = uint(int(conditionValue13 ? multiplyAddValue208 : fma(fragmentScalarConstants1.packedValues[313u], fragmentScalarConstants1.packedValues[312u] * comparisonValue99, multiplyAddValue208))) * scalarValue106;
            uint sumValue125 = scalarValue106 + multiplyAddValue209;
            float scalarValue107 = -quotientValue3;
            float scalarValue108 = -quotientValue4;
            float scalarValue109 = -quotientValue5;
            vec3 vectorValue19 = vec3(scalarValue107, scalarValue108, scalarValue109);
            float scalarValue110 = spvNMax(rdDot3Precise2(productValue3, vectorValue19), 0.0);
            float scalarValue111 = spvNMax(productValue259, 0.0500000007450580596923828125);
            float productValue265 = scalarValue111 * scalarValue111;
            float productValue266 = productValue265 * productValue265;
            float multiplyAddValue210 = fma(productValue265, productValue265, -1.0);
            float productValue267 = productValue265 * 0.5;
            float multiplyAddValue211 = fma(-productValue265, 0.5, 1.0);
            float multiplyAddValue212 = scalarValue110 / (fma(scalarValue110, multiplyAddValue211, productValue267) + 9.9999997473787516355514526367188e-05);
            bool conditionValue15 = fragmentScalarConstants1.packedValues[96u] > 0.0;
            bool conditionValue16 = fragmentScalarConstants1.packedValues[92u] > 0.0;
            float scalarValue112 = -fragmentScalarConstants1.packedValues[372u];
            float quotientValue54 = 0.5 / fragmentVectorConstants1.packedValues[100u].x;
            float quotientValue55 = 0.5 / fragmentVectorConstants1.packedValues[100u].y;
            float quotientValue69 = 1.0 / (fragmentScalarConstants1.packedValues[373u] - fragmentScalarConstants1.packedValues[372u]);
            float intermediateValue82;
            float intermediateValue84;
            float intermediateValue86;
            intermediateValue86 = 0.0;
            intermediateValue84 = 0.0;
            intermediateValue82 = 0.0;
            float multiplyAddValue60;
            float multiplyAddValue61;
            float multiplyAddValue62;
            uint sumValue12;
            uint scalarValue113 = multiplyAddValue209;
            for (;;)
            {
                if (int(scalarValue113) >= int(sumValue125))
                {
                    break;
                }
                uint reinterpretedBits = uint(int(uintBitsToFloat(intermediateValue8.packedValues[scalarValue113])));
                if (int(reinterpretedBits) < int(0u))
                {
                    break;
                }
                uint productValue268 = reinterpretedBits * 32u;
                vec3 reinterpretedBits1 = uintBitsToFloat(uvec3(intermediateValue9.packedValues[productValue268], intermediateValue9.packedValues[productValue268 + 1u], intermediateValue9.packedValues[productValue268 + 2u]));
                float scalarValue114 = reinterpretedBits1.x;
                float scalarValue115 = reinterpretedBits1.y;
                float scalarValue116 = reinterpretedBits1.z;
                float multiplyAddValue213 = (fma(fragmentVectorConstants1.packedValues[2u].x, scalarValue116, fma(fragmentVectorConstants1.packedValues[0u].x, scalarValue114, scalarValue115 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) - quotientValue;
                float multiplyAddValue214 = (fma(fragmentVectorConstants1.packedValues[2u].y, scalarValue116, fma(fragmentVectorConstants1.packedValues[0u].y, scalarValue114, scalarValue115 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) - quotientValue1;
                float multiplyAddValue215 = (fma(fragmentVectorConstants1.packedValues[2u].z, scalarValue116, fma(fragmentVectorConstants1.packedValues[0u].z, scalarValue114, scalarValue115 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) - quotientValue2;
                vec3 vectorValue20 = vec3(multiplyAddValue213, multiplyAddValue214, multiplyAddValue215);
                float inverseLengthValue39 = inversesqrt(rdDot3Precise2(vectorValue20, vectorValue20));
                float productValue269 = spvNMax(rdDot3Precise2(productValue3, vec3(inverseLengthValue39 * multiplyAddValue213, inverseLengthValue39 * multiplyAddValue214, inverseLengthValue39 * multiplyAddValue215)), 0.0);
                float multiplyAddValue216 = fma(multiplyAddValue213, inverseLengthValue39, scalarValue107);
                float multiplyAddValue217 = fma(multiplyAddValue214, inverseLengthValue39, scalarValue108);
                float multiplyAddValue218 = fma(multiplyAddValue215, inverseLengthValue39, scalarValue109);
                vec3 vectorValue21 = vec3(multiplyAddValue216, multiplyAddValue217, multiplyAddValue218);
                float inverseLengthValue40 = inversesqrt(rdDot3Precise2(vectorValue21, vectorValue21));
                vec3 productValue270 = vec3(inverseLengthValue40 * multiplyAddValue216, inverseLengthValue40 * multiplyAddValue217, inverseLengthValue40 * multiplyAddValue218);
                float scalarValue117 = spvNMax(rdDot3Precise2(productValue3, productValue270), 0.0);
                float multiplyAddValue219 = fma(scalarValue117 * scalarValue117, multiplyAddValue210, 1.0);
                float sumValue126 = spvNMax(1.0 - spvNMax(rdDot3Precise2(vectorValue19, productValue270), 0.0), 0.0);
                float productValue271 = sumValue126 * sumValue126;
                float multiplyAddValue220 = (((multiplyAddValue212 * (productValue269 / (fma(productValue269, multiplyAddValue211, productValue267) + 9.9999997473787516355514526367188e-05))) * ((productValue266 / ((multiplyAddValue219 * multiplyAddValue219) * 3.1415927410125732421875)) * fma(sumValue126 * (productValue271 * productValue271), 0.980000019073486328125, 0.0199999995529651641845703125))) / fma(scalarValue110 * productValue269, 4.0, 9.9999997473787516355514526367188e-05)) * productValue269;
                float intermediateValue119;
                float intermediateValue120;
                float intermediateValue121;
                bool intermediateValue122;
                if (int(reinterpretedBits) >= int(0u))
                {
                    vec4 reinterpretedBits2 = uintBitsToFloat(intermediateValue10.packedValues[reinterpretedBits * 8u]);
                    float scalarValue118 = reinterpretedBits2.w;
                    float sumValue127 = reinterpretedBits2.x - sumValue113;
                    float sumValue128 = reinterpretedBits2.y - sumValue114;
                    float sumValue129 = reinterpretedBits2.z - sumValue115;
                    float sumValue130 = abs(sumValue129) + (abs(sumValue128) + abs(sumValue127));
                    vec3 vectorValue22 = vec3(sumValue127, sumValue128, sumValue129);
                    float comparisonValue100 = conditionValue15 ? (sumValue130 * sumValue130) : rdDot3Precise2(vectorValue22, vectorValue22);
                    float productValue54;
                    float productValue55;
                    float productValue56;
                    bool intermediateValue123;
                    if (comparisonValue100 < (scalarValue118 * scalarValue118))
                    {
                        bool intermediateValue132;
                        if (comparisonValue98)
                        {
                            vec4 reinterpretedBits3 = uintBitsToFloat(intermediateValue10.packedValues[(reinterpretedBits * 8u) + 2u]);
                            vec4 reinterpretedBits4 = uintBitsToFloat(intermediateValue10.packedValues[(reinterpretedBits * 8u) + 3u]);
                            vec4 reinterpretedBits5 = uintBitsToFloat(intermediateValue10.packedValues[(reinterpretedBits * 8u) + 4u]);
                            vec4 reinterpretedBits6 = uintBitsToFloat(intermediateValue10.packedValues[(reinterpretedBits * 8u) + 5u]);
                            vec4 reinterpretedBits7 = uintBitsToFloat(intermediateValue10.packedValues[(reinterpretedBits * 8u) + 6u]);
                            vec4 reinterpretedBits8 = uintBitsToFloat(intermediateValue10.packedValues[(reinterpretedBits * 8u) + 7u]);
                            float sumValue131 = multiplyAddValue169 - scalarValue114;
                            float sumValue132 = multiplyAddValue170 - scalarValue115;
                            float sumValue133 = multiplyAddValue171 - scalarValue116;
                            float scalarValue119 = abs(sumValue131);
                            float scalarValue120 = abs(sumValue132);
                            float scalarValue121 = abs(sumValue133);
                            bool comparisonValue101 = scalarValue120 >= scalarValue121;
                            bool comparisonValue102 = (scalarValue119 >= scalarValue120) && (scalarValue119 >= scalarValue121);
                            bool comparisonValue103 = sumValue132 >= 0.0;
                            bool comparisonValue104 = sumValue133 >= 0.0;
                            bool conditionValue17 = !comparisonValue102;
                            bool comparisonValue105 = (!(sumValue131 >= 0.0)) && comparisonValue102;
                            bool bitwiseValue16 = (comparisonValue101 && comparisonValue103) && conditionValue17;
                            bool bitwiseValue17 = conditionValue17 && ((!comparisonValue103) && comparisonValue101);
                            bool bitwiseValue18 = ((!comparisonValue101) && comparisonValue104) && conditionValue17;
                            bool bitwiseValue19 = comparisonValue102 || (comparisonValue104 || comparisonValue101);
                            float comparisonValue106 = comparisonValue105 ? reinterpretedBits4.z : (bitwiseValue16 ? reinterpretedBits5.z : (bitwiseValue17 ? reinterpretedBits6.z : (bitwiseValue18 ? reinterpretedBits7.z : (bitwiseValue19 ? reinterpretedBits3.z : reinterpretedBits8.z))));
                            float comparisonValue107 = comparisonValue105 ? reinterpretedBits4.w : (bitwiseValue16 ? reinterpretedBits5.w : (bitwiseValue17 ? reinterpretedBits6.w : (bitwiseValue18 ? reinterpretedBits7.w : (bitwiseValue19 ? reinterpretedBits3.w : reinterpretedBits8.w))));
                            bool sampledTextureValue9;
                            if (!((comparisonValue106 == 0.0) && (comparisonValue107 == 0.0)))
                            {
                                float scalarValue122 = scalarValue114 - multiplyAddValue169;
                                float sumValue134 = scalarValue116 - multiplyAddValue171;
                                float sumValue135 = scalarValue115 - multiplyAddValue170;
                                float comparisonValue108 = comparisonValue105 ? reinterpretedBits4.x : (bitwiseValue16 ? reinterpretedBits5.x : (bitwiseValue17 ? reinterpretedBits6.x : (bitwiseValue18 ? reinterpretedBits7.x : (bitwiseValue19 ? reinterpretedBits3.x : reinterpretedBits8.x))));
                                float comparisonValue109 = comparisonValue105 ? reinterpretedBits4.y : (bitwiseValue16 ? reinterpretedBits5.y : (bitwiseValue17 ? reinterpretedBits6.y : (bitwiseValue18 ? reinterpretedBits7.y : (bitwiseValue19 ? reinterpretedBits3.y : reinterpretedBits8.y))));
                                float comparisonValue110 = comparisonValue105 ? sumValue134 : ((bitwiseValue16 || (bitwiseValue18 || bitwiseValue17)) ? scalarValue122 : (bitwiseValue19 ? sumValue133 : sumValue131));
                                float comparisonValue111 = comparisonValue105 ? sumValue132 : (bitwiseValue16 ? sumValue134 : (bitwiseValue17 ? sumValue133 : sumValue132));
                                float comparisonValue112 = comparisonValue105 ? sumValue131 : (bitwiseValue16 ? sumValue135 : (bitwiseValue17 ? sumValue132 : (bitwiseValue18 ? sumValue134 : (bitwiseValue19 ? scalarValue122 : sumValue133))));
                                float multiplyAddValue221 = fma(fragmentVectorConstants1.packedValues[97u].w, comparisonValue112, fma(fragmentVectorConstants1.packedValues[95u].w, comparisonValue110, comparisonValue111 * fragmentVectorConstants1.packedValues[96u].w)) + fragmentVectorConstants1.packedValues[98u].w;
                                vec3 vectorValue23 = vec3(scalarValue122, sumValue135, sumValue134);
                                float inverseLengthValue41 = inversesqrt(rdDot3Precise2(vectorValue23, vectorValue23));
                                float productValue272 = spvNMin(spvNMax(rdDot3Precise2(vec3(inverseLengthValue41 * scalarValue122, inverseLengthValue41 * sumValue135, inverseLengthValue41 * sumValue134), vec3(productValue, productValue1, productValue2)), fragmentScalarConstants1.packedValues[376u]), 1.0);
                                float sumValue136 = comparisonValue106 - comparisonValue108;
                                float sumValue137 = comparisonValue107 - comparisonValue109;
                                float productValue273 = sumValue136 * fragmentVectorConstants1.packedValues[100u].x;
                                float productValue274 = sumValue137 * fragmentVectorConstants1.packedValues[100u].y;
                                sampledTextureValue9 = textureLod(sampler2D(materialTexture5, textureSampler5), vec2(spvNMin(comparisonValue106 - quotientValue54, spvNMax(quotientValue54 + comparisonValue108, fma((floor(productValue273 * fma((fma(fragmentVectorConstants1.packedValues[97u].x, comparisonValue112, fma(fragmentVectorConstants1.packedValues[95u].x, comparisonValue110, comparisonValue111 * fragmentVectorConstants1.packedValues[96u].x)) + fragmentVectorConstants1.packedValues[98u].x) / multiplyAddValue221, 0.5, 0.5)) + 0.5) / productValue273, sumValue136, comparisonValue108))), spvNMin(comparisonValue107 - quotientValue55, spvNMax(quotientValue55 + comparisonValue109, fma((floor(productValue274 * (1.0 - fma((fma(fragmentVectorConstants1.packedValues[97u].y, comparisonValue112, fma(fragmentVectorConstants1.packedValues[95u].y, comparisonValue110, comparisonValue111 * fragmentVectorConstants1.packedValues[96u].y)) + fragmentVectorConstants1.packedValues[98u].y) / multiplyAddValue221, 0.5, 0.5))) + 0.5) / productValue274, sumValue137, comparisonValue109)))), 0.0).x >= (fma(-fma(fragmentScalarConstants1.packedValues[409u], sqrt(fma(-productValue272, productValue272, 1.0)) / productValue272, fragmentScalarConstants1.packedValues[408u]), fragmentScalarConstants1.packedValues[402u] / spvNMax(productValue273, 1.0), fma(fragmentVectorConstants1.packedValues[97u].z, comparisonValue112, fma(fragmentVectorConstants1.packedValues[95u].z, comparisonValue110, comparisonValue111 * fragmentVectorConstants1.packedValues[96u].z)) + fragmentVectorConstants1.packedValues[98u].z) / multiplyAddValue221);
                            }
                            else
                            {
                                sampledTextureValue9 = false;
                            }
                            intermediateValue132 = sampledTextureValue9;
                        }
                        else
                        {
                            intermediateValue132 = true;
                        }
                        float quotientValue70 = 1.0 / spvNMax(comparisonValue100, 0.100000001490116119384765625);
                        float multiplyAddValue222 = comparisonValue100 / fma(scalarValue118, scalarValue118, 9.9999997473787516355514526367188e-05);
                        float multiplyAddValue223 = spvNMax(fma(-multiplyAddValue222, multiplyAddValue222, 1.0), 0.0);
                        float productValue275 = multiplyAddValue223 * multiplyAddValue223;
                        float productValue276 = productValue275 * quotientValue70;
                        float multiplyAddValue224 = spvNClamp(quotientValue69 * (fma(-quotientValue70, productValue275, scalarValue112) + 1.0), 0.0, 1.0);
                        float multiplyAddValue225 = conditionValue16 ? (spvNClamp(fma((multiplyAddValue224 * multiplyAddValue224) * fma(multiplyAddValue224, -2.0, 3.0), fragmentScalarConstants1.packedValues[374u], fragmentScalarConstants1.packedValues[375u]), 0.0, 1.0) * productValue276) : productValue276;
                        vec4 reinterpretedBits9 = uintBitsToFloat(intermediateValue10.packedValues[(reinterpretedBits * 8u) + 1u]);
                        float scalarValue123 = reinterpretedBits9.w;
                        intermediateValue123 = intermediateValue132;
                        productValue56 = multiplyAddValue225 * (scalarValue123 * reinterpretedBits9.x);
                        productValue55 = multiplyAddValue225 * (scalarValue123 * reinterpretedBits9.y);
                        productValue54 = multiplyAddValue225 * (scalarValue123 * reinterpretedBits9.z);
                    }
                    else
                    {
                        intermediateValue123 = true;
                        productValue56 = 0.0;
                        productValue55 = 0.0;
                        productValue54 = 0.0;
                    }
                    intermediateValue119 = productValue54;
                    intermediateValue120 = productValue55;
                    intermediateValue121 = productValue56;
                    intermediateValue122 = intermediateValue123;
                }
                else
                {
                    intermediateValue119 = 0.0;
                    intermediateValue120 = 0.0;
                    intermediateValue121 = 0.0;
                    intermediateValue122 = true;
                }
                multiplyAddValue60 = intermediateValue122 ? fma(fragmentScalarConstants1.packedValues[321u], intermediateValue121 * multiplyAddValue220, intermediateValue86) : intermediateValue86;
                multiplyAddValue61 = intermediateValue122 ? fma(fragmentScalarConstants1.packedValues[321u], intermediateValue120 * multiplyAddValue220, intermediateValue84) : intermediateValue84;
                multiplyAddValue62 = intermediateValue122 ? fma(fragmentScalarConstants1.packedValues[321u], intermediateValue119 * multiplyAddValue220, intermediateValue82) : intermediateValue82;
                sumValue12 = scalarValue113 + 1u;
                intermediateValue86 = multiplyAddValue60;
                intermediateValue84 = multiplyAddValue61;
                intermediateValue82 = multiplyAddValue62;
                scalarValue113 = sumValue12;
                continue;
            }
            intermediateValue81 = intermediateValue82;
            intermediateValue83 = intermediateValue84;
            intermediateValue85 = intermediateValue86;
        }
        else
        {
            intermediateValue81 = 0.0;
            intermediateValue83 = 0.0;
            intermediateValue85 = 0.0;
        }
        float sumValue138 = 1.0 - fragmentScalarConstants1.packedValues[448u];
        multiplyAddValue40 = fma(sumValue138, intermediateValue81, productValue21);
        multiplyAddValue41 = fma(sumValue138, intermediateValue83, productValue20);
        multiplyAddValue42 = fma(sumValue138, intermediateValue85, productValue19);
    }
    else
    {
        multiplyAddValue40 = productValue21;
        multiplyAddValue41 = productValue20;
        multiplyAddValue42 = productValue19;
    }
    float productValue30 = bitwiseValue * 0.0039215688593685626983642578125;
    float multiplyAddValue226 = spvNClamp(fma(bitwiseValue, 0.062745101749897003173828125, -fragmentScalarConstants1.packedValues[125u]) / spvNMax(fragmentScalarConstants1.packedValues[124u] - fragmentScalarConstants1.packedValues[125u], 1.0), 0.0, 1.0);
    float scalarValue34 = rdDot3Precise2(vec3(-quotientValue3, -quotientValue4, -quotientValue5), productValue3);
    float sumValue24 = spvNMax(1.0 - spvNMax(scalarValue34, 0.0), 0.0);
    float productValue31 = sumValue24 * sumValue24;
    float multiplyAddValue227 = fma(sumValue24 * (productValue31 * productValue31), 0.980000019073486328125, 0.0199999995529651641845703125) * fma(-(multiplyAddValue226 * (multiplyAddValue226 * multiplyAddValue226)), fragmentScalarConstants1.packedValues[364u], 1.0);
    float productValue50 = productValue30 * productValue30;
    float productValue52 = productValue30 * (productValue50 * productValue50);
    float multiplyAddValue228 = fma(fragmentScalarConstants1.packedValues[149u], fma(productValue50, productValue30, -productValue52), productValue52);
    float productValue277 = fragmentScalarConstants1.packedValues[111u] * fragmentVectorConstants1.packedValues[27u].x;
    float productValue278 = fragmentScalarConstants1.packedValues[111u] * fragmentVectorConstants1.packedValues[27u].y;
    float productValue279 = fragmentScalarConstants1.packedValues[111u] * fragmentVectorConstants1.packedValues[27u].z;
    float multiplyAddValue229 = fma(multiplyAddValue227, spvNMax(fma((bitwiseValue1 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue5, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * fragmentScalarConstants1.packedValues[91u], 6.0, (multiplyAddValue228 * fragmentVectorConstants1.packedValues[107u].x) * fragmentScalarConstants1.packedValues[431u]), productValue277), multiplyAddValue42);
    float multiplyAddValue230 = fma(multiplyAddValue227, spvNMax(fma((bitwiseValue1 * (rdEvaluateFloatExpression(scalarValue5 & 255u) * 0.0039215688593685626983642578125)) * fragmentScalarConstants1.packedValues[91u], 6.0, (multiplyAddValue228 * fragmentVectorConstants1.packedValues[107u].y) * fragmentScalarConstants1.packedValues[431u]), productValue278), multiplyAddValue41);
    float multiplyAddValue231 = fma(multiplyAddValue227, spvNMax(fma((bitwiseValue1 * (rdEvaluateFloatExpression(bitfieldExtract(scalarValue6, int(8u), int(8u))) * 0.0039215688593685626983642578125)) * fragmentScalarConstants1.packedValues[91u], 6.0, (multiplyAddValue228 * fragmentVectorConstants1.packedValues[107u].z) * fragmentScalarConstants1.packedValues[431u]), productValue279), multiplyAddValue40);
    bool comparisonValue113 = fragmentScalarConstants1.packedValues[140u] != 0.0;
    float multiplyAddValue91 = fma(-scalarValue34, scalarValue34, 1.0);
    bool comparisonValue36 = multiplyAddValue91 <= 0.565323054790496826171875;
    float multiplyAddValue232 = spvNClamp(1.0 - ((comparisonValue113 && comparisonValue36) ? sqrt(fma(-multiplyAddValue91, 1.7689001560211181640625, 1.0)) : scalarValue34), 0.0, 1.0);
    float productValue280 = multiplyAddValue232 * multiplyAddValue232;
    float multiplyAddValue233 = ((!comparisonValue36) && comparisonValue113) ? 1.0 : ((fma(multiplyAddValue232 * (productValue280 * productValue280), 0.980000019073486328125, 0.0199999995529651641845703125) - 1.0) + 1.0);
    bool comparisonValue77 = fragmentVectorConstants1.packedValues[32u].y != 0.0;
    float multiplyAddValue57;
    float multiplyAddValue58;
    float multiplyAddValue59;
    if (((fragmentVectorConstants1.packedValues[32u].z != 0.0) && comparisonValue77) && (fragmentScalarConstants1.packedValues[323u] != 0.0))
    {
        multiplyAddValue57 = spvNMax(productValue279, fma(fragmentVectorConstants1.packedValues[107u].z, fragmentScalarConstants1.packedValues[431u], fragmentScalarConstants1.packedValues[91u])) * fragmentScalarConstants1.packedValues[130u];
        multiplyAddValue58 = spvNMax(productValue278, fma(fragmentVectorConstants1.packedValues[107u].y, fragmentScalarConstants1.packedValues[431u], fragmentScalarConstants1.packedValues[91u])) * fragmentScalarConstants1.packedValues[130u];
        multiplyAddValue59 = spvNMax(productValue277, fma(fragmentVectorConstants1.packedValues[107u].x, fragmentScalarConstants1.packedValues[431u], fragmentScalarConstants1.packedValues[91u])) * fragmentScalarConstants1.packedValues[130u];
    }
    else
    {
        multiplyAddValue57 = 0.0;
        multiplyAddValue58 = 0.0;
        multiplyAddValue59 = 0.0;
    }
    float intermediateValue88;
    float intermediateValue89;
    float intermediateValue91;
    float intermediateValue93;
    if (fragmentVectorConstants1.packedValues[32u].x != 0.0)
    {
        float quotientValue71 = spvNClamp((((nonlinearValue / fragmentScalarConstants1.packedValues[114u]) + fragmentScalarConstants1.packedValues[420u]) - fragmentScalarConstants1.packedValues[112u]) * fragmentScalarConstants1.packedValues[113u], 0.0, 1.0);
        float intermediateValue90;
        float intermediateValue92;
        float intermediateValue94;
        if (quotientValue71 > 0.0)
        {
            float productValue40;
            float productValue41;
            float productValue42;
            if (comparisonValue77)
            {
                productValue40 = spvNMax(multiplyAddValue59, 1.0) * fragmentVectorConstants1.packedValues[33u].x;
                productValue41 = spvNMax(multiplyAddValue58, 1.0) * fragmentVectorConstants1.packedValues[33u].y;
                productValue42 = spvNMax(multiplyAddValue57, 1.0) * fragmentVectorConstants1.packedValues[33u].z;
            }
            else
            {
                vec3 vectorValue12 = vec3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3);
                float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue12, vectorValue12));
                float sumValue139 = fragmentScalarConstants1.packedValues[363u] - fragmentScalarConstants1.packedValues[360u];
                float multiplyAddValue234 = fma(multiplyAddValue2, inverseLengthValue10, sumValue139);
                float quotientValue72 = spvNClamp(multiplyAddValue234 * (1.0 / (sumValue139 + (fragmentScalarConstants1.packedValues[362u] - fragmentScalarConstants1.packedValues[363u]))), 0.0, 1.0);
                float multiplyAddValue235 = fma(-fma(quotientValue72, -2.0, 3.0), quotientValue72 * quotientValue72, 1.0);
                float productValue281 = multiplyAddValue235 * (multiplyAddValue235 * multiplyAddValue235);
                vec3 productValue64 = vec3(inverseLengthValue10 * multiplyAddValue1, inverseLengthValue10 * multiplyAddValue2, inverseLengthValue10 * multiplyAddValue3);
                float scalarValue124 = rdDot3Precise2(productValue64, vec3(fragmentVectorConstants1.packedValues[101u].xyz));
                float scalarValue125 = rdDot3Precise2(productValue64, vec3(fragmentVectorConstants1.packedValues[38u].xyz));
                float quotientValue73 = spvNClamp(multiplyAddValue234 * (1.0 / (sumValue139 + fragmentScalarConstants1.packedValues[361u])), 0.0, 1.0);
                float multiplyAddValue236 = fma(-fma(quotientValue73, -2.0, 3.0), quotientValue73 * quotientValue73, 1.0);
                float productValue282 = multiplyAddValue236 * (multiplyAddValue236 * multiplyAddValue236);
                float multiplyAddValue237 = fma(fma(scalarValue124, scalarValue124, 1.0) * fragmentScalarConstants1.packedValues[447u], 0.75, (fma(scalarValue125, scalarValue125, 1.0) * fragmentScalarConstants1.packedValues[371u]) * 0.75);
                float exponentialValue6 = spvNMin(exp2(log2(spvNMax(scalarValue125, 0.0)) * fragmentScalarConstants1.packedValues[119u]), 1.0);
                float exponentialValue7 = spvNMin(exp2(log2(spvNMax(scalarValue124, 0.0)) * fragmentScalarConstants1.packedValues[119u]), 1.0);
                float multiplyAddValue238 = fma(-exponentialValue7, 1.7999999523162841796875, 1.809999942779541015625);
                float multiplyAddValue239 = fma(-exponentialValue6, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue12 = 0.0361000001430511474609375 / (sqrt(multiplyAddValue238) * multiplyAddValue238);
                float nonlinearValue13 = 0.0361000001430511474609375 / (multiplyAddValue239 * sqrt(multiplyAddValue239));
                float multiplyAddValue240 = fma((fma(productValue282, fragmentVectorConstants1.packedValues[108u].x - fragmentVectorConstants1.packedValues[30u].x, fragmentVectorConstants1.packedValues[30u].x) * fragmentScalarConstants1.packedValues[116u]) * 0.079577468335628509521484375, multiplyAddValue237, fma(exponentialValue7 * ((fragmentVectorConstants1.packedValues[111u].x * fragmentScalarConstants1.packedValues[447u]) * fragmentScalarConstants1.packedValues[117u]), nonlinearValue12, nonlinearValue13 * (exponentialValue6 * ((fragmentVectorConstants1.packedValues[92u].x * fragmentScalarConstants1.packedValues[371u]) * fragmentScalarConstants1.packedValues[118u]))) * ((productValue281 * fragmentVectorConstants1.packedValues[108u].x) * 0.079577468335628509521484375));
                float multiplyAddValue241 = fma((fma(productValue282, fragmentVectorConstants1.packedValues[108u].y - fragmentVectorConstants1.packedValues[30u].y, fragmentVectorConstants1.packedValues[30u].y) * fragmentScalarConstants1.packedValues[116u]) * 0.079577468335628509521484375, multiplyAddValue237, fma(exponentialValue7 * ((fragmentVectorConstants1.packedValues[111u].y * fragmentScalarConstants1.packedValues[447u]) * fragmentScalarConstants1.packedValues[117u]), nonlinearValue12, nonlinearValue13 * (exponentialValue6 * ((fragmentVectorConstants1.packedValues[92u].y * fragmentScalarConstants1.packedValues[371u]) * fragmentScalarConstants1.packedValues[118u]))) * ((productValue281 * fragmentVectorConstants1.packedValues[108u].y) * 0.079577468335628509521484375));
                float multiplyAddValue242 = fma((fma(productValue282, fragmentVectorConstants1.packedValues[108u].z - fragmentVectorConstants1.packedValues[30u].z, fragmentVectorConstants1.packedValues[30u].z) * fragmentScalarConstants1.packedValues[116u]) * 0.079577468335628509521484375, multiplyAddValue237, fma(exponentialValue7 * ((fragmentVectorConstants1.packedValues[111u].z * fragmentScalarConstants1.packedValues[447u]) * fragmentScalarConstants1.packedValues[117u]), nonlinearValue12, nonlinearValue13 * (exponentialValue6 * ((fragmentVectorConstants1.packedValues[92u].z * fragmentScalarConstants1.packedValues[371u]) * fragmentScalarConstants1.packedValues[118u]))) * ((productValue281 * fragmentVectorConstants1.packedValues[108u].z) * 0.079577468335628509521484375));
                bool comparisonValue114 = fragmentScalarConstants1.packedValues[131u] != 0.0;
                float comparisonValue115 = spvNMax((scalarValue2 == 1.0) ? sampledTextureValue5 : productValue30, fragmentScalarConstants1.packedValues[137u]);
                productValue40 = comparisonValue114 ? fma(comparisonValue115, multiplyAddValue240 - fragmentVectorConstants1.packedValues[113u].x, fragmentVectorConstants1.packedValues[113u].x) : multiplyAddValue240;
                productValue41 = comparisonValue114 ? fma(comparisonValue115, multiplyAddValue241 - fragmentVectorConstants1.packedValues[113u].y, fragmentVectorConstants1.packedValues[113u].y) : multiplyAddValue241;
                productValue42 = comparisonValue114 ? fma(comparisonValue115, multiplyAddValue242 - fragmentVectorConstants1.packedValues[113u].z, fragmentVectorConstants1.packedValues[113u].z) : multiplyAddValue242;
            }
            intermediateValue94 = productValue40;
            intermediateValue92 = productValue41;
            intermediateValue90 = productValue42;
        }
        else
        {
            intermediateValue94 = 0.0;
            intermediateValue92 = 0.0;
            intermediateValue90 = 0.0;
        }
        intermediateValue88 = quotientValue71;
        intermediateValue89 = intermediateValue90;
        intermediateValue91 = intermediateValue92;
        intermediateValue93 = intermediateValue94;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue35 = spvNClamp(((bitwiseValue4 * 0.062745101749897003173828125) - fragmentVectorConstants1.packedValues[29u].y) / spvNMax(fragmentVectorConstants1.packedValues[29u].x - fragmentVectorConstants1.packedValues[29u].y, 1.0), 0.0, 1.0);
        dotProductValue1 = dot(vec3(sumValue45, sumValue46, sumValue47), vec3(productValue106, productValue107, productValue108));
        float sumValue69 = spvNClamp(1.0 - spvNMax(dotProductValue1, 0.0), 0.0, 1.0);
        float productValue139 = sumValue69 * sumValue69;
        float productValue140 = (((productValue139 * productValue139) * (sumValue69 * 0.980000019073486328125)) + 0.0199999995529651641845703125) * (1.0 - (((quotientValue35 * quotientValue35) * quotientValue35) * fragmentVectorConstants1.packedValues[86u].x));
        intermediateValue14 = fragmentVectorConstants1.packedValues[22u].w;
        float productValue141 = (bitwiseValue8 * 9.2272217443678528070449829101562e-05) * intermediateValue14;
        float productValue142 = productValue109 * productValue109;
        float productValue143 = productValue142 * productValue142;
        float productValue144 = ((fragmentVectorConstants1.packedValues[34u].y * (productValue142 - productValue143)) + productValue143) * productValue109;
        productValue33 = fragmentVectorConstants1.packedValues[94u].w * fragmentVectorConstants1.packedValues[94u].x;
        productValue34 = fragmentVectorConstants1.packedValues[94u].w * fragmentVectorConstants1.packedValues[94u].y;
        productValue35 = fragmentVectorConstants1.packedValues[94u].w * fragmentVectorConstants1.packedValues[94u].z;
        productValue36 = fragmentVectorConstants1.packedValues[25u].x * fragmentVectorConstants1.packedValues[25u].w;
        productValue37 = fragmentVectorConstants1.packedValues[25u].y * fragmentVectorConstants1.packedValues[25u].w;
        productValue38 = fragmentVectorConstants1.packedValues[25u].z * fragmentVectorConstants1.packedValues[25u].w;
        productValue39 = (productValue140 * spvNMax((productValue141 * bitwiseValue5) + (productValue144 * productValue33), productValue36)) + intermediateValue11;
        productValue40 = (productValue140 * spvNMax((productValue141 * bitwiseValue6) + (productValue144 * productValue34), productValue37)) + intermediateValue12;
        productValue41 = (spvNMax((productValue141 * bitwiseValue7) + (productValue144 * productValue35), productValue38) * productValue140) + intermediateValue13;
        comparisonValue2 = fragmentVectorConstants1.packedValues[33u].x != 0.0;
        float nonlinearValue1;
        if (comparisonValue2)
        {
            float productValue145 = (1.0 - (dotProductValue1 * dotProductValue1)) * 1.7689001560211181640625;
            if (productValue145 > 1.0)
            {
                intermediateValue15 = 0.0;
                break;
            }
            nonlinearValue1 = sqrt(1.0 - productValue145);
        }
        else
        {
            nonlinearValue1 = dotProductValue1;
        }
        float sumValue70 = spvNClamp(1.0 - nonlinearValue1, 0.0, 1.0);
        float productValue146 = sumValue70 * sumValue70;
        intermediateValue15 = 0.980000019073486328125 - ((productValue146 * productValue146) * (sumValue70 * 0.980000019073486328125));
        break;
    }
    float sumValue71 = 1.0 - intermediateValue15;
    float inverseLengthValue22 = inversesqrt(dot(vec3(multiplyAddValue110, multiplyAddValue111, multiplyAddValue112), vec3(multiplyAddValue110, multiplyAddValue111, multiplyAddValue112)));
    float productValue147 = inverseLengthValue22 * multiplyAddValue110;
    float productValue148 = inverseLengthValue22 * multiplyAddValue111;
    float productValue149 = inverseLengthValue22 * multiplyAddValue112;
    bool comparisonValue37 = fragmentVectorConstants1.packedValues[30u].y != 0.0;
    float productValue61;
    float productValue62;
    float productValue63;
    if ((comparisonValue37 && (fragmentVectorConstants1.packedValues[30u].z != 0.0)) && (fragmentVectorConstants1.packedValues[76u].w != 0.0))
    {
        productValue61 = spvNMax(intermediateValue14 + productValue33, productValue36) * fragmentVectorConstants1.packedValues[30u].z;
        productValue62 = spvNMax(intermediateValue14 + productValue34, productValue37) * fragmentVectorConstants1.packedValues[30u].z;
        productValue63 = spvNMax(intermediateValue14 + productValue35, productValue38) * fragmentVectorConstants1.packedValues[30u].z;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue48 = 0.0;
        intermediateValue49 = 0.0;
        intermediateValue50 = 0.0;
        intermediateValue51 = 0.0;
    }
    float productValue94;
    float productValue95;
    float productValue96;
    float productValue97;
    if (fragmentVectorConstants1.packedValues[116u].x != 0.0)
    {
        float productValue162 = (varyingColor1.x + 1.0) * 0.5;
        float productValue163 = (varyingColor1.y + 1.0) * 0.5;
        uint scalarValue85 = uint(int(fragmentVectorConstants1.packedValues[114u].z));
        float multiplyAddValue156 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[11u].z + fma(fragmentVectorConstants1.packedValues[10u].z, scalarValue44, fma(fragmentVectorConstants1.packedValues[9u].z, varyingColor1.y, fragmentVectorConstants1.packedValues[8u].z * varyingColor1.x)))) / (fma(fragmentVectorConstants1.packedValues[10u].w, scalarValue44, fma(fragmentVectorConstants1.packedValues[9u].w, varyingColor1.y, fragmentVectorConstants1.packedValues[8u].w * varyingColor1.x)) + fragmentVectorConstants1.packedValues[11u].w)) - fragmentVectorConstants1.packedValues[115u].x) / (fragmentVectorConstants1.packedValues[115u].y - fragmentVectorConstants1.packedValues[115u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue85))) + (-0.5);
        uint sumValue111 = uint(min(int(uint(max(int(uint(int(multiplyAddValue156))), int(0u)))), int(scalarValue85 + 4294967294u)));
        float scalarValue86 = float(int(sumValue111));
        float sumValue112 = spvNMin(spvNMax(multiplyAddValue156 - scalarValue86, 0.0), 1.0);
        vec4 sampledTextureValue37 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue162, productValue163, scalarValue86), 0.0);
        float scalarValue87 = sampledTextureValue37.x;
        float scalarValue88 = sampledTextureValue37.y;
        float scalarValue89 = sampledTextureValue37.z;
        float scalarValue90 = sampledTextureValue37.w;
        vec4 sampledTextureValue38 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue162, productValue163, float(int(sumValue111 + 1u))), 0.0);
        productValue94 = ((sampledTextureValue38.x - scalarValue87) * sumValue112) + scalarValue87;
        productValue95 = ((sampledTextureValue38.y - scalarValue88) * sumValue112) + scalarValue88;
        productValue96 = ((sampledTextureValue38.z - scalarValue89) * sumValue112) + scalarValue89;
        productValue97 = ((sampledTextureValue38.w - scalarValue90) * sumValue112) + scalarValue90;
    }
    else
    {
        productValue94 = 0.0;
        productValue95 = 0.0;
        productValue96 = 0.0;
        productValue97 = 1.0;
    }
    float productValue244 = (productValue97 * ((((intermediateValue49 * sumValue109) - productValue47) * intermediateValue48) + productValue47)) + (productValue94 * sumValue109);
    float productValue245 = (productValue97 * ((((intermediateValue50 * sumValue109) - productValue48) * intermediateValue48) + productValue48)) + (productValue95 * sumValue109);
    float productValue246 = (productValue97 * ((((intermediateValue51 * sumValue109) - productValue49) * intermediateValue48) + productValue49)) + (productValue96 * sumValue109);
    float productValue115;
    float productValue116;
    float productValue117;
    if (fragmentVectorConstants1.packedValues[103u].x > 0.0)
    {
        float sampledTextureValue25 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue115 = sampledTextureValue25 * productValue244;
        productValue116 = sampledTextureValue25 * productValue245;
        productValue117 = sampledTextureValue25 * productValue246;
#endif
    }
    else
    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue62 = 0.0;
        intermediateValue63 = 0.0;
        intermediateValue65 = 0.0;
        intermediateValue67 = 0.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue88 = 0.0;
        intermediateValue89 = 0.0;
        intermediateValue91 = 0.0;
        intermediateValue93 = 0.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue61 = 0.0;
        productValue62 = 0.0;
        productValue63 = 0.0;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue115 = productValue244;
        productValue116 = productValue245;
        productValue117 = productValue246;
#endif
    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue50;
    float multiplyAddValue51;
    float multiplyAddValue52;
    float multiplyAddValue53;
    if (fragmentScalarConstants1.packedValues[408u] != 0.0)
    {
        float multiplyAddValue103 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[10u].z, scalarValue2, fma(fragmentVectorConstants1.packedValues[8u].z, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[9u].z)) + fragmentVectorConstants1.packedValues[11u].z)) / (fma(fragmentVectorConstants1.packedValues[10u].w, scalarValue2, fma(fragmentVectorConstants1.packedValues[8u].w, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[9u].w)) + fragmentVectorConstants1.packedValues[11u].w)) - fragmentScalarConstants1.packedValues[404u]) / (fragmentScalarConstants1.packedValues[405u] - fragmentScalarConstants1.packedValues[404u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[402u]), -0.5);
        uint sumValue32 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[402u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue103))), int(0u))))));
        float scalarValue37 = rdSignedBitsToFloat(sumValue32);
        float sumValue34 = spvNClamp(multiplyAddValue103 - scalarValue37, 0.0, 1.0);
        float multiplyAddValue104 = fma(varyingColor1.x, 0.5, 0.5);
        float multiplyAddValue105 = fma(varyingColor1.y, 0.5, 0.5);
        vec4 sampledTextureValue14 = textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue104, multiplyAddValue105, scalarValue37), 0.0);
        float scalarValue38 = sampledTextureValue14.x;
        float scalarValue39 = sampledTextureValue14.y;
        float scalarValue40 = sampledTextureValue14.z;
        float scalarValue41 = sampledTextureValue14.w;
        vec4 sampledTextureValue15 = textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue104, multiplyAddValue105, rdSignedBitsToFloat(sumValue32 + 1u)), 0.0);
        multiplyAddValue50 = fma(sumValue34, sampledTextureValue15.z - scalarValue40, scalarValue40);
        multiplyAddValue51 = fma(sumValue34, sampledTextureValue15.y - scalarValue39, scalarValue39);
        multiplyAddValue52 = fma(sumValue34, sampledTextureValue15.x - scalarValue38, scalarValue38);
        multiplyAddValue53 = fma(sumValue34, sampledTextureValue15.w - scalarValue41, scalarValue41);
    }
    else
    {
        multiplyAddValue50 = 0.0;
        multiplyAddValue51 = 0.0;
        multiplyAddValue52 = 0.0;
        multiplyAddValue53 = 1.0;
    }
    float multiplyAddValue106 = fma(multiplyAddValue52, multiplyAddValue93, fma(intermediateValue62, fma(intermediateValue67, multiplyAddValue93, -multiplyAddValue88), multiplyAddValue88) * multiplyAddValue53);
    float multiplyAddValue107 = fma(multiplyAddValue51, multiplyAddValue93, fma(intermediateValue62, fma(intermediateValue65, multiplyAddValue93, -multiplyAddValue89), multiplyAddValue89) * multiplyAddValue53);
    float multiplyAddValue109 = fma(multiplyAddValue50, multiplyAddValue93, fma(intermediateValue62, fma(intermediateValue63, multiplyAddValue93, -multiplyAddValue90), multiplyAddValue90) * multiplyAddValue53);
    float productValue42;
    float productValue43;
    float productValue44;
    if (fragmentScalarConstants1.packedValues[360u] > 0.0)
    {
        float sampledTextureValue16 = (0.180000007152557373046875 / texture(sampler2D(materialTexture6, textureSampler6), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue42 = sampledTextureValue16 * multiplyAddValue109;
        productValue43 = sampledTextureValue16 * multiplyAddValue107;
        productValue44 = sampledTextureValue16 * multiplyAddValue106;
    }
    else
    {
        productValue42 = multiplyAddValue109;
        productValue43 = multiplyAddValue107;
        productValue44 = multiplyAddValue106;
    }
    fragmentColor0.x = productValue44;
    fragmentColor0.y = productValue43;
    fragmentColor0.z = productValue42;
    fragmentColor0.w = multiplyAddValue93;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue66;
    float multiplyAddValue67;
    float multiplyAddValue68;
    float multiplyAddValue69;
    if (fragmentScalarConstants1.packedValues[464u] != 0.0)
    {
        float multiplyAddValue243 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[10u].z, scalarValue2, fma(fragmentVectorConstants1.packedValues[8u].z, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[9u].z)) + fragmentVectorConstants1.packedValues[11u].z)) / (fma(fragmentVectorConstants1.packedValues[10u].w, scalarValue2, fma(fragmentVectorConstants1.packedValues[8u].w, varyingColor1.x, varyingColor1.y * fragmentVectorConstants1.packedValues[9u].w)) + fragmentVectorConstants1.packedValues[11u].w)) - fragmentScalarConstants1.packedValues[460u]) / (fragmentScalarConstants1.packedValues[461u] - fragmentScalarConstants1.packedValues[460u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[458u]), -0.5);
        uint sumValue140 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[458u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue243))), int(0u))))));
        float scalarValue126 = rdSignedBitsToFloat(sumValue140);
        float sumValue141 = spvNClamp(multiplyAddValue243 - scalarValue126, 0.0, 1.0);
        float multiplyAddValue104 = fma(varyingColor1.x, 0.5, 0.5);
        float multiplyAddValue105 = fma(varyingColor1.y, 0.5, 0.5);
        vec4 sampledTextureValue42 = textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue104, multiplyAddValue105, scalarValue126), 0.0);
        float scalarValue127 = sampledTextureValue42.x;
        float scalarValue128 = sampledTextureValue42.y;
        float scalarValue129 = sampledTextureValue42.z;
        float scalarValue130 = sampledTextureValue42.w;
        vec4 sampledTextureValue43 = textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue104, multiplyAddValue105, rdSignedBitsToFloat(sumValue140 + 1u)), 0.0);
        multiplyAddValue66 = fma(sumValue141, sampledTextureValue43.z - scalarValue129, scalarValue129);
        multiplyAddValue67 = fma(sumValue141, sampledTextureValue43.y - scalarValue128, scalarValue128);
        multiplyAddValue68 = fma(sumValue141, sampledTextureValue43.x - scalarValue127, scalarValue127);
        multiplyAddValue69 = fma(sumValue141, sampledTextureValue43.w - scalarValue130, scalarValue130);
    }
    else
    {
        multiplyAddValue66 = 0.0;
        multiplyAddValue67 = 0.0;
        multiplyAddValue68 = 0.0;
        multiplyAddValue69 = 1.0;
    }
    float multiplyAddValue244 = fma(multiplyAddValue68, multiplyAddValue233, fma(intermediateValue88, fma(intermediateValue93, multiplyAddValue233, -multiplyAddValue229), multiplyAddValue229) * multiplyAddValue69);
    float multiplyAddValue245 = fma(multiplyAddValue67, multiplyAddValue233, fma(intermediateValue88, fma(intermediateValue91, multiplyAddValue233, -multiplyAddValue230), multiplyAddValue230) * multiplyAddValue69);
    float multiplyAddValue246 = fma(multiplyAddValue66, multiplyAddValue233, fma(intermediateValue88, fma(intermediateValue89, multiplyAddValue233, -multiplyAddValue231), multiplyAddValue231) * multiplyAddValue69);
    float productValue46;
    float productValue47;
    float productValue48;
    if (fragmentScalarConstants1.packedValues[412u] > 0.0)
    {
        float sampledTextureValue16 = (0.180000007152557373046875 / texture(sampler2D(materialTexture6, textureSampler6), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue46 = sampledTextureValue16 * multiplyAddValue246;
        productValue47 = sampledTextureValue16 * multiplyAddValue245;
        productValue48 = sampledTextureValue16 * multiplyAddValue244;
    }
    else
    {
        productValue46 = multiplyAddValue246;
        productValue47 = multiplyAddValue245;
        productValue48 = multiplyAddValue244;
    }
    fragmentColor0.x = productValue48;
    fragmentColor0.y = productValue47;
    fragmentColor0.z = productValue46;
    fragmentColor0.w = multiplyAddValue233;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    float intermediateValue28;
    if (fragmentVectorConstants1.packedValues[30u].x != 0.0)
    {
        float quotientValue36 = spvNClamp(((fragmentVectorConstants1.packedValues[92u].x - fragmentVectorConstants1.packedValues[26u].x) + (nonlinearValue4 / fragmentVectorConstants1.packedValues[26u].z)) * fragmentVectorConstants1.packedValues[26u].y, 0.0, 1.0);
        float branchMergedValue8;
        float branchMergedValue10;
        float branchMergedValue11;
        float branchMergedValue12;
        if (quotientValue36 > 0.0)
        {
            float branchMergedValue13;
            float branchMergedValue14;
            float branchMergedValue15;
            float branchMergedValue16;
            if (comparisonValue37)
            {
                branchMergedValue13 = spvNMax(productValue63, 1.0) * fragmentVectorConstants1.packedValues[31u].z;
                branchMergedValue14 = spvNMax(productValue62, 1.0) * fragmentVectorConstants1.packedValues[31u].y;
                branchMergedValue15 = fragmentVectorConstants1.packedValues[31u].x * spvNMax(productValue61, 1.0);
                branchMergedValue16 = quotientValue36;
            }
            else
            {
                float quotientValue37 = spvNClamp(((productValue148 - fragmentVectorConstants1.packedValues[85u].x) + fragmentVectorConstants1.packedValues[85u].w) / (fragmentVectorConstants1.packedValues[85u].z - fragmentVectorConstants1.packedValues[85u].x), 0.0, 1.0);
                float productValue150 = 1.0 - ((quotientValue37 * quotientValue37) * (3.0 - (quotientValue37 * 2.0)));
                float productValue151 = (productValue150 * productValue150) * productValue150;
                float dotProductValue11 = dot(vec3(productValue147, productValue148, productValue149), vec3(fragmentVectorConstants1.packedValues[89u].xyz));
                float dotProductValue12 = dot(vec3(productValue147, productValue148, productValue149), vec3(fragmentVectorConstants1.packedValues[35u].xyz));
                float sumValue72 = fragmentVectorConstants1.packedValues[85u].x - fragmentVectorConstants1.packedValues[85u].w;
                float quotientValue38 = spvNClamp((productValue148 - sumValue72) / (fragmentVectorConstants1.packedValues[85u].y - sumValue72), 0.0, 1.0);
                float productValue152 = 1.0 - ((quotientValue38 * quotientValue38) * (3.0 - (quotientValue38 * 2.0)));
                float productValue153 = (productValue152 * productValue152) * productValue152;
                float productValue154 = (fragmentVectorConstants1.packedValues[27u].x * 0.75) * ((((dotProductValue12 * dotProductValue12) + 1.0) * fragmentVectorConstants1.packedValues[87u].w) + (((dotProductValue11 * dotProductValue11) + 1.0) * fragmentVectorConstants1.packedValues[98u].w));
                float exponentialValue2 = spvNClamp(exp2(log2(spvNMax(dotProductValue11, 0.0)) * fragmentVectorConstants1.packedValues[27u].w), 0.0, 1.0);
                float exponentialValue3 = spvNClamp(exp2(log2(spvNMax(dotProductValue12, 0.0)) * fragmentVectorConstants1.packedValues[27u].w), 0.0, 1.0);
                float productValue155 = 1.809999942779541015625 - (exponentialValue2 * 1.7999999523162841796875);
                float nonlinearValue6 = 0.036100022494792938232421875 / (sqrt(productValue155) * productValue155);
                float productValue156 = 1.809999942779541015625 - (exponentialValue3 * 1.7999999523162841796875);
                float nonlinearValue7 = 0.036100022494792938232421875 / (sqrt(productValue156) * productValue156);
                float productValue157 = exponentialValue2 * (fragmentVectorConstants1.packedValues[27u].y * fragmentVectorConstants1.packedValues[98u].w);
                float productValue158 = exponentialValue3 * (fragmentVectorConstants1.packedValues[27u].z * fragmentVectorConstants1.packedValues[87u].w);
                float productValue159 = (((productValue151 * fragmentVectorConstants1.packedValues[95u].x) * (((productValue158 * fragmentVectorConstants1.packedValues[87u].x) * nonlinearValue7) + ((productValue157 * fragmentVectorConstants1.packedValues[98u].x) * nonlinearValue6))) + (((productValue153 * (fragmentVectorConstants1.packedValues[95u].x - fragmentVectorConstants1.packedValues[28u].x)) + fragmentVectorConstants1.packedValues[28u].x) * productValue154)) * 0.079577468335628509521484375;
                float productValue160 = (((productValue151 * fragmentVectorConstants1.packedValues[95u].y) * (((productValue158 * fragmentVectorConstants1.packedValues[87u].y) * nonlinearValue7) + ((productValue157 * fragmentVectorConstants1.packedValues[98u].y) * nonlinearValue6))) + (((productValue153 * (fragmentVectorConstants1.packedValues[95u].y - fragmentVectorConstants1.packedValues[28u].y)) + fragmentVectorConstants1.packedValues[28u].y) * productValue154)) * 0.079577468335628509521484375;
                float productValue161 = (((productValue151 * fragmentVectorConstants1.packedValues[95u].z) * (((productValue158 * fragmentVectorConstants1.packedValues[87u].z) * nonlinearValue7) + ((productValue157 * fragmentVectorConstants1.packedValues[98u].z) * nonlinearValue6))) + (((productValue153 * (fragmentVectorConstants1.packedValues[95u].z - fragmentVectorConstants1.packedValues[28u].z)) + fragmentVectorConstants1.packedValues[28u].z) * productValue154)) * 0.079577468335628509521484375;
                float branchMergedValue17;
                float branchMergedValue18;
                float branchMergedValue19;
                float branchMergedValue20;
                if (fragmentVectorConstants1.packedValues[30u].w != 0.0)
                {
                    float comparisonValue57 = spvNMax(fragmentVectorConstants1.packedValues[32u].y, (scalarValue44 == 1.0) ? sampledTextureValue4 : productValue109);
                    branchMergedValue17 = ((productValue161 - fragmentVectorConstants1.packedValues[99u].z) * comparisonValue57) + fragmentVectorConstants1.packedValues[99u].z;
                    branchMergedValue18 = ((productValue160 - fragmentVectorConstants1.packedValues[99u].y) * comparisonValue57) + fragmentVectorConstants1.packedValues[99u].y;
                    branchMergedValue19 = ((productValue159 - fragmentVectorConstants1.packedValues[99u].x) * comparisonValue57) + fragmentVectorConstants1.packedValues[99u].x;
                    branchMergedValue20 = quotientValue36;
                }
                else
                {
                    branchMergedValue17 = productValue161;
                    branchMergedValue18 = productValue160;
                    branchMergedValue19 = productValue159;
                    branchMergedValue20 = quotientValue36;
                }
                branchMergedValue13 = branchMergedValue17;
                branchMergedValue14 = branchMergedValue18;
                branchMergedValue15 = branchMergedValue19;
                branchMergedValue16 = branchMergedValue20;
            }
            branchMergedValue8 = branchMergedValue13;
            branchMergedValue10 = branchMergedValue14;
            branchMergedValue11 = branchMergedValue15;
            branchMergedValue12 = branchMergedValue16;
        }
        else
        {
            branchMergedValue8 = 0.0;
            branchMergedValue10 = 0.0;
            branchMergedValue11 = 0.0;
            branchMergedValue12 = quotientValue36;
        }
        intermediateValue25 = branchMergedValue12;
        intermediateValue26 = branchMergedValue11;
        intermediateValue27 = branchMergedValue10;
        intermediateValue28 = branchMergedValue8;
    }
    else
    {
        intermediateValue25 = 0.0;
        intermediateValue26 = 0.0;
        intermediateValue27 = 0.0;
        intermediateValue28 = 0.0;
    }
    float productValue70;
    float productValue71;
    float productValue72;
    float productValue73;
    if (fragmentVectorConstants1.packedValues[102u].x != 0.0)
    {
        float productValue162 = (varyingColor1.x + 1.0) * 0.5;
        float productValue163 = (varyingColor1.y + 1.0) * 0.5;
        uint scalarValue60 = uint(int(fragmentVectorConstants1.packedValues[100u].z));
        float multiplyAddValue135 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[11u].z + fma(fragmentVectorConstants1.packedValues[10u].z, scalarValue44, fma(fragmentVectorConstants1.packedValues[9u].z, varyingColor1.y, fragmentVectorConstants1.packedValues[8u].z * varyingColor1.x)))) / (fma(fragmentVectorConstants1.packedValues[10u].w, scalarValue44, fma(fragmentVectorConstants1.packedValues[9u].w, varyingColor1.y, fragmentVectorConstants1.packedValues[8u].w * varyingColor1.x)) + fragmentVectorConstants1.packedValues[11u].w)) - fragmentVectorConstants1.packedValues[101u].x) / (fragmentVectorConstants1.packedValues[101u].y - fragmentVectorConstants1.packedValues[101u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue60))) + (-0.5);
        uint sumValue73 = uint(min(int(uint(max(int(uint(int(multiplyAddValue135))), int(0u)))), int(scalarValue60 + 4294967294u)));
        float scalarValue61 = float(int(sumValue73));
        float sumValue74 = spvNMin(spvNMax(multiplyAddValue135 - scalarValue61, 0.0), 1.0);
        vec4 sampledTextureValue23 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue162, productValue163, scalarValue61), 0.0);
        float scalarValue62 = sampledTextureValue23.x;
        float scalarValue63 = sampledTextureValue23.y;
        float scalarValue64 = sampledTextureValue23.z;
        float scalarValue65 = sampledTextureValue23.w;
        vec4 sampledTextureValue24 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue162, productValue163, float(int(sumValue73 + 1u))), 0.0);
        productValue70 = ((sampledTextureValue24.x - scalarValue62) * sumValue74) + scalarValue62;
        productValue71 = ((sampledTextureValue24.y - scalarValue63) * sumValue74) + scalarValue63;
        productValue72 = ((sampledTextureValue24.z - scalarValue64) * sumValue74) + scalarValue64;
        productValue73 = ((sampledTextureValue24.w - scalarValue65) * sumValue74) + scalarValue65;
    }
    else
    {
        productValue70 = 0.0;
        productValue71 = 0.0;
        productValue72 = 0.0;
        productValue73 = 1.0;
    }
    float productValue164 = (productValue73 * ((((intermediateValue26 * sumValue71) - productValue39) * intermediateValue25) + productValue39)) + (productValue70 * sumValue71);
    float productValue165 = (productValue73 * ((((intermediateValue27 * sumValue71) - productValue40) * intermediateValue25) + productValue40)) + (productValue71 * sumValue71);
    float productValue166 = (productValue73 * ((((intermediateValue28 * sumValue71) - productValue41) * intermediateValue25) + productValue41)) + (productValue72 * sumValue71);
    float productValue86;
    float productValue87;
    float productValue88;
    if (fragmentVectorConstants1.packedValues[90u].x > 0.0)
    {
        float sampledTextureValue25 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue86 = sampledTextureValue25 * productValue164;
        productValue87 = sampledTextureValue25 * productValue165;
        productValue88 = sampledTextureValue25 * productValue166;
    }
    else
    {
        productValue86 = productValue164;
        productValue87 = productValue165;
        productValue88 = productValue166;
    }
    fragmentColor0.x = productValue86;
    fragmentColor0.y = productValue87;
    fragmentColor0.z = productValue88;
    fragmentColor0.w = sumValue71;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = productValue115;
    fragmentColor0.y = productValue116;
    fragmentColor0.z = productValue117;
    fragmentColor0.w = sumValue109;
#endif
}
