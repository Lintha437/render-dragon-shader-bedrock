#version 460
#extension GL_GOOGLE_include_directive : require
// StandardRed / Opaque / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/StandardRed/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue16 = fragmentVectorConstants1.packedValues[1u].x * fragmentScalarConstants1.packedValues[25u];
    precise float productValue17 = fragmentVectorConstants1.packedValues[1u].y * fragmentScalarConstants1.packedValues[25u];
    precise float productValue18 = fragmentVectorConstants1.packedValues[1u].z * fragmentScalarConstants1.packedValues[25u];
    float multiplyAddValue9 = -fma(fragmentVectorConstants1.packedValues[2u].x, fragmentScalarConstants1.packedValues[26u], fma(fragmentVectorConstants1.packedValues[0u].x, fragmentScalarConstants1.packedValues[24u], productValue16));
    float multiplyAddValue10 = -fma(fragmentVectorConstants1.packedValues[2u].y, fragmentScalarConstants1.packedValues[26u], fma(fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[24u], productValue17));
    float multiplyAddValue11 = -fma(fragmentVectorConstants1.packedValues[2u].z, fragmentScalarConstants1.packedValues[26u], fma(fragmentVectorConstants1.packedValues[0u].z, fragmentScalarConstants1.packedValues[24u], productValue18));
    vec3 vectorValue4 = vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11);
    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
    precise float productValue19 = inverseLengthValue8 * multiplyAddValue9;
    precise float productValue20 = inverseLengthValue8 * multiplyAddValue10;
    precise float productValue21 = inverseLengthValue8 * multiplyAddValue11;
    float scalarValue = -varyingColor1.x;
    float scalarValue1 = -varyingColor1.y;
    float scalarValue2 = -varyingColor1.z;
    vec3 vectorValue1 = vec3(scalarValue, scalarValue1, scalarValue2);
    float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    float multiplyAddValue12 = fma(scalarValue, inverseLengthValue5, productValue19);
    float multiplyAddValue13 = fma(scalarValue1, inverseLengthValue5, productValue20);
    float multiplyAddValue14 = fma(scalarValue2, inverseLengthValue5, productValue21);
    vec3 vectorValue5 = vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14);
    float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    precise float productValue22 = inverseLengthValue9 * multiplyAddValue12;
    precise float productValue23 = inverseLengthValue9 * multiplyAddValue13;
    precise float productValue24 = inverseLengthValue9 * multiplyAddValue14;
    vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    precise float productValue25 = inverseLengthValue7 * varyingNormal0.x;
    precise float productValue26 = inverseLengthValue7 * varyingNormal0.y;
    precise float productValue27 = inverseLengthValue7 * varyingNormal0.z;
    vec3 vectorValue6 = vec3(productValue25, productValue26, productValue27);
    float scalarValue7 = spvNClamp(rdDot3Precise2(vectorValue6, vec3(productValue19, productValue20, productValue21)), 0.0, 1.0);
    precise float nonlinearValue = log2(spvNClamp(rdDot3Precise2(vectorValue6, vec3(productValue22, productValue23, productValue24)), 0.0, 1.0)) * 0.4554755687713623046875;
    precise float exponentialValue1 = exp2(nonlinearValue) * 0.17050254344940185546875;
    precise float productValue28 = fragmentScalarConstants1.packedValues[23u] * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue29 = fragmentScalarConstants1.packedValues[23u] * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue30 = fragmentScalarConstants1.packedValues[23u] * fragmentVectorConstants1.packedValues[5u].z;
    precise float productValue31 = exponentialValue1 * productValue28;
    precise float productValue32 = exponentialValue1 * productValue29;
    precise float productValue33 = exponentialValue1 * productValue30;
    precise float productValue34 = scalarValue7 * productValue28;
    precise float productValue35 = scalarValue7 * productValue29;
    precise float productValue36 = scalarValue7 * productValue30;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    precise float productValue37 = productValue34 * scalarValue4;
    precise float productValue38 = productValue35 * scalarValue5;
    precise float productValue39 = productValue36 * scalarValue6;
    precise float productValue40 = fragmentScalarConstants1.packedValues[19u] * fragmentVectorConstants1.packedValues[4u].x;
    precise float productValue41 = fragmentScalarConstants1.packedValues[19u] * fragmentVectorConstants1.packedValues[4u].y;
    precise float productValue42 = fragmentScalarConstants1.packedValues[19u] * fragmentVectorConstants1.packedValues[4u].z;
    fragmentColor0.x = fma(productValue31, scalarValue4, fma(productValue40, scalarValue4, productValue37));
    fragmentColor0.y = fma(productValue32, scalarValue5, fma(productValue41, scalarValue5, productValue38));
    fragmentColor0.z = fma(productValue33, scalarValue6, fma(productValue42, scalarValue6, productValue39));
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue3 = -fma(fragmentVectorConstants1.packedValues[2u].x, fragmentScalarConstants1.packedValues[26u], fma(fragmentVectorConstants1.packedValues[0u].x, fragmentScalarConstants1.packedValues[24u], fragmentVectorConstants1.packedValues[1u].x * fragmentScalarConstants1.packedValues[25u]));
    float multiplyAddValue4 = -fma(fragmentVectorConstants1.packedValues[2u].y, fragmentScalarConstants1.packedValues[26u], fma(fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[24u], fragmentVectorConstants1.packedValues[1u].y * fragmentScalarConstants1.packedValues[25u]));
    float multiplyAddValue5 = -fma(fragmentVectorConstants1.packedValues[2u].z, fragmentScalarConstants1.packedValues[26u], fma(fragmentVectorConstants1.packedValues[0u].z, fragmentScalarConstants1.packedValues[24u], fragmentVectorConstants1.packedValues[1u].z * fragmentScalarConstants1.packedValues[25u]));
    vec3 vectorValue = vec3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5);
    float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue9 = inverseLengthValue4 * multiplyAddValue3;
    float productValue10 = inverseLengthValue4 * multiplyAddValue4;
    float productValue11 = inverseLengthValue4 * multiplyAddValue5;
    float scalarValue = -varyingColor1.x;
    float scalarValue1 = -varyingColor1.y;
    float scalarValue2 = -varyingColor1.z;
    vec3 vectorValue1 = vec3(scalarValue, scalarValue1, scalarValue2);
    float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    float multiplyAddValue6 = fma(scalarValue, inverseLengthValue5, productValue9);
    float multiplyAddValue7 = fma(scalarValue1, inverseLengthValue5, productValue10);
    float multiplyAddValue8 = fma(scalarValue2, inverseLengthValue5, productValue11);
    vec3 vectorValue2 = vec3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    vec3 vectorValue3 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    vec3 productValue12 = vec3(inverseLengthValue7 * varyingNormal0.x, inverseLengthValue7 * varyingNormal0.y, inverseLengthValue7 * varyingNormal0.z);
    float scalarValue3 = spvNClamp(rdDot3Precise2(productValue12, vec3(productValue9, productValue10, productValue11)), 0.0, 1.0);
    float exponentialValue = exp2(log2(spvNClamp(rdDot3Precise2(productValue12, vec3(inverseLengthValue6 * multiplyAddValue6, inverseLengthValue6 * multiplyAddValue7, inverseLengthValue6 * multiplyAddValue8)), 0.0, 1.0)) * 0.4554755687713623046875) * 0.17050254344940185546875;
    float productValue13 = fragmentScalarConstants1.packedValues[23u] * fragmentVectorConstants1.packedValues[5u].x;
    float productValue14 = fragmentScalarConstants1.packedValues[23u] * fragmentVectorConstants1.packedValues[5u].y;
    float productValue15 = fragmentScalarConstants1.packedValues[23u] * fragmentVectorConstants1.packedValues[5u].z;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    fragmentColor0.x = fma(exponentialValue * productValue13, scalarValue4, fma(fragmentScalarConstants1.packedValues[19u] * fragmentVectorConstants1.packedValues[4u].x, scalarValue4, (scalarValue3 * productValue13) * scalarValue4));
    fragmentColor0.y = fma(exponentialValue * productValue14, scalarValue5, fma(fragmentScalarConstants1.packedValues[19u] * fragmentVectorConstants1.packedValues[4u].y, scalarValue5, (scalarValue3 * productValue14) * scalarValue5));
    fragmentColor0.z = fma(exponentialValue * productValue15, scalarValue6, fma(fragmentScalarConstants1.packedValues[19u] * fragmentVectorConstants1.packedValues[4u].z, scalarValue6, (scalarValue3 * productValue15) * scalarValue6));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue = inverseLengthValue * varyingNormal0.x;
    float productValue1 = inverseLengthValue * varyingNormal0.y;
    float productValue2 = inverseLengthValue * varyingNormal0.z;
    float multiplyAddValue = (-0.0) - fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[6u].z, fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[6u].x * fragmentVectorConstants1.packedValues[0u].x));
    float multiplyAddValue1 = (-0.0) - fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[6u].z, fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[6u].x * fragmentVectorConstants1.packedValues[0u].y));
    float multiplyAddValue2 = (-0.0) - fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[6u].z, fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[6u].x * fragmentVectorConstants1.packedValues[0u].z));
    float inverseLengthValue1 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
    float productValue3 = inverseLengthValue1 * multiplyAddValue;
    float productValue4 = inverseLengthValue1 * multiplyAddValue1;
    float productValue5 = inverseLengthValue1 * multiplyAddValue2;
    float sumValue = (-0.0) - varyingColor1.x;
    float sumValue1 = (-0.0) - varyingColor1.y;
    float sumValue2 = (-0.0) - varyingColor1.z;
    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue, sumValue1, sumValue2), vec3(sumValue, sumValue1, sumValue2)));
    float productValue6 = (inverseLengthValue2 * sumValue) + productValue3;
    float productValue7 = (inverseLengthValue2 * sumValue1) + productValue4;
    float productValue8 = (inverseLengthValue2 * sumValue2) + productValue5;
    float inverseLengthValue3 = inversesqrt(dot(vec3(productValue6, productValue7, productValue8), vec3(productValue6, productValue7, productValue8)));
    float dotProductValue = (spvNClamp(exp2(log2(spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(productValue6 * inverseLengthValue3, productValue7 * inverseLengthValue3, productValue8 * inverseLengthValue3)), 0.0, 1.0)) * 0.4554755687713623046875) * 0.17050254344940185546875, 0.0, 1.0) + spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(productValue3, productValue4, productValue5)), 0.0, 1.0)) * fragmentVectorConstants1.packedValues[5u].w;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[4u].w * fragmentVectorConstants1.packedValues[4u].x) + (dotProductValue * fragmentVectorConstants1.packedValues[5u].x)) * sampledTextureValue.x;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[4u].w * fragmentVectorConstants1.packedValues[4u].y) + (dotProductValue * fragmentVectorConstants1.packedValues[5u].y)) * sampledTextureValue.y;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[4u].w * fragmentVectorConstants1.packedValues[4u].z) + (dotProductValue * fragmentVectorConstants1.packedValues[5u].z)) * sampledTextureValue.z;
#endif
    fragmentColor0.w = 1.0;
}
