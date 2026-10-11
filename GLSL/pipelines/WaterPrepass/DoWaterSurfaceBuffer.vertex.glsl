#version 460
#extension GL_GOOGLE_include_directive : require
// WaterPrepass / DoWaterSurfaceBuffer / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 7
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

#include "../../include/materials/WaterPrepass/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTexCoord3.x = multiplyAddValue3;
    varyingTexCoord3.y = multiplyAddValue4;
    varyingTexCoord3.z = multiplyAddValue5;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue3, multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue3, multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue3, multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue3, multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    float multiplyAddValue6 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue7 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue8 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].z));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    float multiplyAddValue6 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue7 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue8 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue6 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, productValue4, fma(vertexVectorConstants0.packedValues[5u].x, productValue3, vertexVectorConstants0.packedValues[4u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, productValue4, fma(vertexVectorConstants0.packedValues[5u].y, productValue3, vertexVectorConstants0.packedValues[4u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, productValue4, fma(vertexVectorConstants0.packedValues[5u].z, productValue3, vertexVectorConstants0.packedValues[4u].z * productValue2));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue10 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue11 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue12 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue6 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, productValue4, fma(vertexVectorConstants0.packedValues[5u].x, productValue3, vertexVectorConstants0.packedValues[4u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, productValue4, fma(vertexVectorConstants0.packedValues[5u].y, productValue3, vertexVectorConstants0.packedValues[4u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, productValue4, fma(vertexVectorConstants0.packedValues[5u].z, productValue3, vertexVectorConstants0.packedValues[4u].z * productValue2));
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue5 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue6 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue6 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = float(bitfieldExtract(productValue5, int(8u), int(1u)) != 0u);
    varyingTexCoord2.y = float(bitfieldExtract(productValue6, int(8u), int(1u)) != 0u);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue5 & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue6 & 15u) * 0.066666670143604278564453125;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].z * vertexNormal0.x));
#endif
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingFrontFacing0 = int(0u);
    float multiplyAddValue9 = fma(vertexNormal0.w, 0.5, 0.5);
    varyingTexCoord5.x = (multiplyAddValue9 * (rdEvaluateFloatExpression((productValue5 >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.y = (multiplyAddValue9 * (rdEvaluateFloatExpression(productValue5 & 255u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.z = (multiplyAddValue9 * (rdEvaluateFloatExpression((productValue6 >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].y));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].z));
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].z));
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue10;
    varyingTexCoord3.y = multiplyAddValue11;
    varyingTexCoord3.z = multiplyAddValue12;
#endif
}
