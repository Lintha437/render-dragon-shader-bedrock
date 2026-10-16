#version 460
#extension GL_GOOGLE_include_directive : require
// Entity / AlphaTestMaskedOverwrite / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE0
#define RD_OPTION_SOURCE_INPUT_TYPE0 RD_SOURCE_INPUT_TYPE0_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE1
#define RD_OPTION_SOURCE_INPUT_TYPE1 RD_SOURCE_INPUT_TYPE1_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE2
#define RD_OPTION_SOURCE_INPUT_TYPE2 RD_SOURCE_INPUT_TYPE2_CONSTANT
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/Entity/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint sumValue1 = bitwiseValue + 23u;
    precise float productValue3 = vertexPosition0.y * vertexVectorConstants0.packedValues[sumValue1].x;
    precise float productValue4 = vertexPosition0.y * vertexVectorConstants0.packedValues[sumValue1].y;
    precise float productValue5 = vertexPosition0.y * vertexVectorConstants0.packedValues[sumValue1].z;
    precise float productValue6 = vertexPosition0.y * vertexVectorConstants0.packedValues[sumValue1].w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint sumValue1 = bitwiseValue + 23u;
#endif
    uint sumValue = bitwiseValue + 22u;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint sumValue1 = bitwiseValue + 23u;
#endif
    uint sumValue2 = bitwiseValue + 24u;
    uint sumValue3 = bitwiseValue + 25u;
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[sumValue2].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue].x, vertexPosition0.x, productValue3)) + vertexVectorConstants0.packedValues[sumValue3].x;
    precise float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[sumValue2].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue].y, vertexPosition0.x, productValue4)) + vertexVectorConstants0.packedValues[sumValue3].y;
    precise float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[sumValue2].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue].z, vertexPosition0.x, productValue5)) + vertexVectorConstants0.packedValues[sumValue3].z;
    precise float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[sumValue2].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue].w, vertexPosition0.x, productValue6)) + vertexVectorConstants0.packedValues[sumValue3].w;
    precise float productValue7 = multiplyAddValue14 * vertexVectorConstants0.packedValues[19u].x;
    precise float productValue8 = multiplyAddValue14 * vertexVectorConstants0.packedValues[19u].y;
    precise float productValue9 = multiplyAddValue14 * vertexVectorConstants0.packedValues[19u].z;
    precise float productValue10 = multiplyAddValue14 * vertexVectorConstants0.packedValues[19u].w;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[21u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[20u].z, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[18u].z, multiplyAddValue13, productValue9)));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[21u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[20u].x, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[18u].x, multiplyAddValue13, productValue7)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[21u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[20u].y, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[18u].y, multiplyAddValue13, productValue8)));
    gl_Position.z = multiplyAddValue17;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[21u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[20u].w, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[18u].w, multiplyAddValue13, productValue10)));
    precise float quotientValue = multiplyAddValue17 / vertexScalarConstants0.packedValues[2u];
    precise float sumValue4 = quotientValue - vertexScalarConstants0.packedValues[0u];
    precise float sumValue5 = vertexScalarConstants0.packedValues[1u] - vertexScalarConstants0.packedValues[0u];
    precise float quotientValue1 = sumValue4 / sumValue5;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[sumValue2].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[sumValue1].x)) + vertexVectorConstants0.packedValues[sumValue3].x;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[sumValue2].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[sumValue1].y)) + vertexVectorConstants0.packedValues[sumValue3].y;
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[sumValue2].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[sumValue1].z)) + vertexVectorConstants0.packedValues[sumValue3].z;
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[sumValue2].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue].w, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[sumValue1].w)) + vertexVectorConstants0.packedValues[sumValue3].w;
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[21u].z, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[20u].z, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[18u].z, multiplyAddValue28, multiplyAddValue29 * vertexVectorConstants0.packedValues[19u].z)));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[21u].x, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[20u].x, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[18u].x, multiplyAddValue28, multiplyAddValue29 * vertexVectorConstants0.packedValues[19u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[21u].y, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[20u].y, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[18u].y, multiplyAddValue28, multiplyAddValue29 * vertexVectorConstants0.packedValues[19u].y)));
    gl_Position.z = multiplyAddValue32;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[21u].w, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[20u].w, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[18u].w, multiplyAddValue28, multiplyAddValue29 * vertexVectorConstants0.packedValues[19u].w)));
    varyingColor2.w = spvNClamp(((multiplyAddValue32 / vertexScalarConstants0.packedValues[2u]) - vertexScalarConstants0.packedValues[0u]) / (vertexScalarConstants0.packedValues[1u] - vertexScalarConstants0.packedValues[0u]), 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[sumValue2].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue1].x, vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[sumValue3].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[sumValue2].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue1].y, vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[sumValue3].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[sumValue2].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue1].z, vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[sumValue3].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[sumValue2].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[sumValue1].w, vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue].w * vertexPosition0.x)) + vertexVectorConstants0.packedValues[sumValue3].w;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[sumValue3].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue1].x, vertexNormal0.y, vertexVectorConstants0.packedValues[sumValue].x * vertexNormal0.x)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[sumValue3].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue1].y, vertexNormal0.y, vertexVectorConstants0.packedValues[sumValue].y * vertexNormal0.x)));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[sumValue3].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue1].z, vertexNormal0.y, vertexVectorConstants0.packedValues[sumValue].z * vertexNormal0.x)));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[sumValue3].w, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue1].w, vertexNormal0.y, vertexVectorConstants0.packedValues[sumValue].w * vertexNormal0.x)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[21u].z, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[20u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[19u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[18u].z)));
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue7, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[2u].x)));
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue7, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[2u].y)));
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue7, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[2u].z)));
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue7, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[2u].w)));
    float inverseLengthValue = inversesqrt(dot(vec4(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11, multiplyAddValue12), vec4(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11, multiplyAddValue12)));
    float productValue = inverseLengthValue * multiplyAddValue9;
    float productValue1 = inverseLengthValue * multiplyAddValue11;
    float productValue2 = (((0.449999988079071044921875 - ((productValue * productValue) * 0.100000001490116119384765625)) + ((productValue1 * productValue1) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[1u].w * 0.3499999940395355224609375)) + ((((inverseLengthValue * multiplyAddValue10) * vertexVectorConstants0.packedValues[56u].w) + 1.0) * 0.2750000059604644775390625);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[21u].x, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[20u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[19u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[18u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[21u].y, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[20u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[19u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[18u].y)));
    gl_Position.z = multiplyAddValue8;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[21u].w, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[20u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[19u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[18u].w)));
#endif
    varyingColor2.x = vertexVectorConstants0.packedValues[54u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[54u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[54u].z;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingColor2.w = spvNClamp(((multiplyAddValue8 / vertexVectorConstants0.packedValues[0u].z) - vertexVectorConstants0.packedValues[0u].x) / (vertexVectorConstants0.packedValues[0u].y - vertexVectorConstants0.packedValues[0u].x), 0.0, 1.0);
#endif
    varyingTexCoord2.x = 0.0;
    varyingTexCoord2.y = 0.0;
    varyingTexCoord2.z = 0.0;
    varyingTexCoord2.w = 0.0;
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue11 = vertexNormal0.y * vertexVectorConstants0.packedValues[sumValue1].x;
    precise float productValue12 = vertexNormal0.y * vertexVectorConstants0.packedValues[sumValue1].y;
    precise float productValue13 = vertexNormal0.y * vertexVectorConstants0.packedValues[sumValue1].z;
    precise float productValue14 = vertexNormal0.y * vertexVectorConstants0.packedValues[sumValue1].w;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[sumValue3].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue].x, vertexNormal0.x, productValue11)));
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[sumValue3].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue].y, vertexNormal0.x, productValue12)));
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[sumValue3].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue].z, vertexNormal0.x, productValue13)));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[sumValue3].w, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue].w, vertexNormal0.x, productValue14)));
    precise float productValue15 = multiplyAddValue19 * vertexVectorConstants0.packedValues[3u].x;
    precise float productValue16 = multiplyAddValue19 * vertexVectorConstants0.packedValues[3u].y;
    precise float productValue17 = multiplyAddValue19 * vertexVectorConstants0.packedValues[3u].z;
    precise float productValue18 = multiplyAddValue19 * vertexVectorConstants0.packedValues[3u].w;
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue18, productValue15)));
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue18, productValue16)));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue18, productValue17)));
    vec4 multiplyAddValue25 = vec4(multiplyAddValue22, multiplyAddValue23, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue18, productValue18))));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue25, multiplyAddValue25));
    precise float productValue19 = inverseLengthValue1 * multiplyAddValue22;
    precise float productValue20 = inverseLengthValue1 * multiplyAddValue23;
    precise float productValue21 = inverseLengthValue1 * multiplyAddValue24;
    precise float productValue22 = productValue19 * productValue19;
    precise float productValue23 = productValue21 * productValue21;
    precise float productValue24 = productValue22 * (-0.100000001490116119384765625);
    precise float multiplyAddValue26 = fma(productValue23, 0.100000001490116119384765625, fma(fma(productValue20, vertexScalarConstants0.packedValues[227u], 1.0), 0.2750000059604644775390625, productValue24)) + 0.449999988079071044921875;
    float multiplyAddValue27 = fma(vertexScalarConstants0.packedValues[7u], 0.3499999940395355224609375, multiplyAddValue26);
    precise float productValue25 = multiplyAddValue27 * vertexVectorConstants0.packedValues[56u].x;
    precise float productValue26 = multiplyAddValue27 * vertexVectorConstants0.packedValues[56u].y;
    precise float productValue27 = multiplyAddValue27 * vertexVectorConstants0.packedValues[56u].z;
    varyingColor3.x = productValue25;
    varyingColor3.y = productValue26;
    varyingColor3.z = productValue27;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[sumValue3].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[sumValue1].x)));
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[sumValue3].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[sumValue1].y)));
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[sumValue3].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[sumValue1].z)));
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[sumValue3].w, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[sumValue2].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[sumValue].w, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[sumValue1].w)));
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[3u].x)));
    float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[3u].y)));
    float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[3u].z)));
    vec4 multiplyAddValue40 = vec4(multiplyAddValue37, multiplyAddValue38, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[3u].w))));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue40, multiplyAddValue40));
    float productValue28 = inverseLengthValue2 * multiplyAddValue37;
    float productValue29 = inverseLengthValue2 * multiplyAddValue39;
    float multiplyAddValue41 = fma(vertexScalarConstants0.packedValues[7u], 0.3499999940395355224609375, fma(productValue29 * productValue29, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue38, vertexScalarConstants0.packedValues[227u], 1.0), 0.2750000059604644775390625, (productValue28 * productValue28) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor3.x = multiplyAddValue41 * vertexVectorConstants0.packedValues[56u].x;
    varyingColor3.y = multiplyAddValue41 * vertexVectorConstants0.packedValues[56u].y;
    varyingColor3.z = multiplyAddValue41 * vertexVectorConstants0.packedValues[56u].z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingColor3.x = productValue2 * vertexVectorConstants0.packedValues[56u].x;
    varyingColor3.y = productValue2 * vertexVectorConstants0.packedValues[56u].y;
    varyingColor3.z = productValue2 * vertexVectorConstants0.packedValues[56u].z;
#endif
    varyingColor3.w = 1.0;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[55u].z, vertexVectorConstants0.packedValues[55u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[55u].w, vertexVectorConstants0.packedValues[55u].y);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[55u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[55u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[55u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[55u].y;
#endif
}
