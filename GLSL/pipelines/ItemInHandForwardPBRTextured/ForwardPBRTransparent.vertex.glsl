#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandForwardPBRTextured / ForwardPBRTransparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
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
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/ItemInHandForwardPBRTextured/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue3;
    gl_Position.y = multiplyAddValue4;
    gl_Position.z = multiplyAddValue5;
    gl_Position.w = multiplyAddValue6;
    varyingColor1.x = multiplyAddValue3;
    varyingColor1.y = multiplyAddValue4;
    varyingColor1.z = multiplyAddValue5;
    varyingColor1.w = multiplyAddValue6;
    float multiplyAddValue7 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue8 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue9 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].z));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue17;
    gl_Position.y = multiplyAddValue18;
    gl_Position.z = multiplyAddValue19;
    gl_Position.w = multiplyAddValue20;
    varyingColor1.x = multiplyAddValue17;
    varyingColor1.y = multiplyAddValue18;
    varyingColor1.z = multiplyAddValue19;
    varyingColor1.w = multiplyAddValue20;
    float multiplyAddValue7 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue8 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue9 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = multiplyAddValue13;
    gl_Position.y = multiplyAddValue14;
    gl_Position.z = multiplyAddValue15;
    gl_Position.w = multiplyAddValue16;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, productValue4, fma(vertexVectorConstants0.packedValues[5u].x, productValue3, vertexVectorConstants0.packedValues[4u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, productValue4, fma(vertexVectorConstants0.packedValues[5u].y, productValue3, vertexVectorConstants0.packedValues[4u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, productValue4, fma(vertexVectorConstants0.packedValues[5u].z, productValue3, vertexVectorConstants0.packedValues[4u].z * productValue2));
    varyingColor1.x = multiplyAddValue13;
    varyingColor1.y = multiplyAddValue14;
    varyingColor1.z = multiplyAddValue15;
    varyingColor1.w = multiplyAddValue16;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue21 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue22 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue23 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = multiplyAddValue24;
    gl_Position.y = multiplyAddValue25;
    gl_Position.z = multiplyAddValue26;
    gl_Position.w = multiplyAddValue27;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, productValue4, fma(vertexVectorConstants0.packedValues[5u].x, productValue3, vertexVectorConstants0.packedValues[4u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, productValue4, fma(vertexVectorConstants0.packedValues[5u].y, productValue3, vertexVectorConstants0.packedValues[4u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, productValue4, fma(vertexVectorConstants0.packedValues[5u].z, productValue3, vertexVectorConstants0.packedValues[4u].z * productValue2));
    varyingColor1.x = multiplyAddValue24;
    varyingColor1.y = multiplyAddValue25;
    varyingColor1.z = multiplyAddValue26;
    varyingColor1.w = multiplyAddValue27;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingFrontFacing0 = int(0u);
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord4 = int(uint(vertexTexCoord4));
#endif
    varyingTexCoord8.x = vertexTexCoord8.x;
    varyingTexCoord8.y = vertexTexCoord8.y;
    varyingTexCoord8.z = vertexTexCoord8.z;
    varyingTexCoord8.w = vertexTexCoord8.w;
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTexCoord5.x = fma(vertexVectorConstants0.packedValues[22u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[20u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[21u].x)) + vertexVectorConstants0.packedValues[23u].x;
    varyingTexCoord5.y = fma(vertexVectorConstants0.packedValues[22u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[20u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[21u].y)) + vertexVectorConstants0.packedValues[23u].y;
    varyingTexCoord5.z = fma(vertexVectorConstants0.packedValues[22u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[20u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[21u].z)) + vertexVectorConstants0.packedValues[23u].z;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].z));
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].x * vertexNormal0.x)) + vertexVectorConstants0.packedValues[7u].x;
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].y * vertexNormal0.x)) + vertexVectorConstants0.packedValues[7u].y;
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].z * vertexNormal0.x)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTexCoord4 = int(uint(vertexTexCoord4));
    varyingTexCoord5.x = fma(vertexVectorConstants0.packedValues[22u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[21u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[20u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[23u].x;
    varyingTexCoord5.y = fma(vertexVectorConstants0.packedValues[22u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[21u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[20u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[23u].y;
    varyingTexCoord5.z = fma(vertexVectorConstants0.packedValues[22u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[21u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[20u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[23u].z;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue10;
    varyingTexCoord3.y = multiplyAddValue11;
    varyingTexCoord3.z = multiplyAddValue12;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].x * vertexNormal0.x)) + vertexVectorConstants0.packedValues[7u].x;
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].y * vertexNormal0.x)) + vertexVectorConstants0.packedValues[7u].y;
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].z * vertexNormal0.x)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTexCoord4 = int(uint(vertexTexCoord4));
    varyingTexCoord5.x = fma(vertexVectorConstants0.packedValues[22u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[21u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[20u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[23u].x;
    varyingTexCoord5.y = fma(vertexVectorConstants0.packedValues[22u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[21u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[20u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[23u].y;
    varyingTexCoord5.z = fma(vertexVectorConstants0.packedValues[22u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[21u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[20u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[23u].z;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue21;
    varyingTexCoord3.y = multiplyAddValue22;
    varyingTexCoord3.z = multiplyAddValue23;
#endif
}
