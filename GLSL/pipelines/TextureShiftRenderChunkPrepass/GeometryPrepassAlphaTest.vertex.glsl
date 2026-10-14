#version 460
#extension GL_GOOGLE_include_directive : require
// TextureShiftRenderChunkPrepass / GeometryPrepassAlphaTest / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
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
#define RD_BINDING_LAYOUT 9
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/TextureShiftRenderChunkPrepass/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    vec4 multiplyAddValue3 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue3);
    float sumValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue3);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue3);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue3);
    gl_Position.x = sumValue;
    gl_Position.y = sumValue1;
    gl_Position.z = scalarValue;
    gl_Position.w = scalarValue1;
    varyingColor1.x = sumValue;
    varyingColor1.y = sumValue1;
    varyingColor1.z = scalarValue;
    varyingColor1.w = scalarValue1;
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue4 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue3;
    varyingTexCoord3.y = scalarValue2;
    varyingTexCoord3.z = scalarValue4;
    vec4 multiplyAddValue19 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue19);
    float sumValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue19);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue19);
    float scalarValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue19);
    gl_Position.x = sumValue2;
    gl_Position.y = sumValue3;
    gl_Position.z = scalarValue5;
    gl_Position.w = scalarValue6;
    varyingColor1.x = sumValue2;
    varyingColor1.y = sumValue3;
    varyingColor1.z = scalarValue5;
    varyingColor1.w = scalarValue6;
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue2 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue3 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue4 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue6 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue >> 8u;
    uint bitwiseValue1 = productValue1 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = multiplyAddValue15;
    gl_Position.y = multiplyAddValue16;
    gl_Position.z = multiplyAddValue17;
    gl_Position.w = multiplyAddValue18;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue6, fma(vertexVectorConstants0.packedValues[9u].x, productValue5, vertexVectorConstants0.packedValues[8u].x * productValue4));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue6, fma(vertexVectorConstants0.packedValues[9u].y, productValue5, vertexVectorConstants0.packedValues[8u].y * productValue4));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue6, fma(vertexVectorConstants0.packedValues[9u].z, productValue5, vertexVectorConstants0.packedValues[8u].z * productValue4));
    varyingColor1.x = multiplyAddValue15;
    varyingColor1.y = multiplyAddValue16;
    varyingColor1.z = multiplyAddValue17;
    varyingColor1.w = multiplyAddValue18;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue20 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue21 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue22 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue2 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue3 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue4 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue6 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue >> 8u;
    uint bitwiseValue1 = productValue1 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = multiplyAddValue27;
    gl_Position.y = multiplyAddValue28;
    gl_Position.z = multiplyAddValue29;
    gl_Position.w = multiplyAddValue30;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue6, fma(vertexVectorConstants0.packedValues[9u].x, productValue5, vertexVectorConstants0.packedValues[8u].x * productValue4));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue6, fma(vertexVectorConstants0.packedValues[9u].y, productValue5, vertexVectorConstants0.packedValues[8u].y * productValue4));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue6, fma(vertexVectorConstants0.packedValues[9u].z, productValue5, vertexVectorConstants0.packedValues[8u].z * productValue4));
    varyingColor1.x = multiplyAddValue27;
    varyingColor1.y = multiplyAddValue28;
    varyingColor1.z = multiplyAddValue29;
    varyingColor1.w = multiplyAddValue30;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = float(bitfieldExtract(productValue, int(8u), int(1u)) != 0u);
    varyingTexCoord2.y = float(bitfieldExtract(productValue1, int(8u), int(1u)) != 0u);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
#endif
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingFrontFacing0 = int(0u);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue2 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue2 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue3 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
#endif
    varyingTexCoord6.x = vertexTexCoord2.x;
    varyingTexCoord6.y = vertexTexCoord2.y;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue7 = fma(vertexNormal0.w, 0.5, 0.5);
    varyingTexCoord5.x = (multiplyAddValue7 * (rdEvaluateFloatExpression((productValue >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.y = (multiplyAddValue7 * (rdEvaluateFloatExpression(productValue & 255u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.z = (multiplyAddValue7 * (rdEvaluateFloatExpression((productValue1 >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z));
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z));
    uint productValue2 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue3 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue2, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue2, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue3, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue3, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue8;
    varyingTexCoord3.y = multiplyAddValue9;
    varyingTexCoord3.z = multiplyAddValue10;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue20;
    varyingTexCoord3.y = multiplyAddValue21;
    varyingTexCoord3.z = multiplyAddValue22;
#endif
}
