#version 460
#extension GL_GOOGLE_include_directive : require
// ParticlePrepass / GeometryPrepassAlphaTest / vertex forward pipeline.
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 5
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/ParticlePrepass/VertexBindings.glsli"

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
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[104u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue3);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[105u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue3);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue3);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue3);
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    vec4 multiplyAddValue21 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[104u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue21);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[105u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue21);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue21);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue21);
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(vertexTexCoord1.x * 65535.0);
    uint productValue1 = uint(vertexTexCoord1.y * 65535.0);
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[26u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[26u].y, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].w)));
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue4, fma(vertexVectorConstants0.packedValues[9u].x, productValue3, vertexVectorConstants0.packedValues[8u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue4, fma(vertexVectorConstants0.packedValues[9u].y, productValue3, vertexVectorConstants0.packedValues[8u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue4, fma(vertexVectorConstants0.packedValues[9u].z, productValue3, vertexVectorConstants0.packedValues[8u].z * productValue2));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(vertexTexCoord1.x * 65535.0);
    uint productValue1 = uint(vertexTexCoord1.y * 65535.0);
    float multiplyAddValue14 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue15 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue16 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[26u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[26u].y, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].w)));
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue4, fma(vertexVectorConstants0.packedValues[9u].x, productValue3, vertexVectorConstants0.packedValues[8u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue4, fma(vertexVectorConstants0.packedValues[9u].y, productValue3, vertexVectorConstants0.packedValues[8u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue4, fma(vertexVectorConstants0.packedValues[9u].z, productValue3, vertexVectorConstants0.packedValues[8u].z * productValue2));
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue = uint(vertexTexCoord1.x * 65535.0);
    uint productValue1 = uint(vertexTexCoord1.y * 65535.0);
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = rdEvaluateFloatExpression(bitfieldExtract(productValue, int(8u), int(8u))) * 0.0039215688593685626983642578125;
    varyingTexCoord2.y = rdEvaluateFloatExpression(productValue & 255u) * 0.0039215688593685626983642578125;
    varyingTexCoord2.z = rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(8u), int(8u))) * 0.0039215688593685626983642578125;
    varyingTexCoord1.x = rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(4u), int(4u))) * 0.066666670143604278564453125;
    varyingColor1.w = spvNClamp((-vertexScalarConstants0.packedValues[100u]) / (vertexScalarConstants0.packedValues[101u] - vertexScalarConstants0.packedValues[100u]), 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord2.x = float((productValue >> 8u) & 255u) * 0.0039215688593685626983642578125;
    varyingTexCoord2.y = float(productValue & 255u) * 0.0039215688593685626983642578125;
    varyingTexCoord2.z = float((productValue1 >> 8u) & 255u) * 0.0039215688593685626983642578125;
#endif
    varyingColor1.x = vertexVectorConstants0.packedValues[24u].x;
    varyingColor1.y = vertexVectorConstants0.packedValues[24u].y;
    varyingColor1.z = vertexVectorConstants0.packedValues[24u].z;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingColor1.w = spvNClamp(((-0.0) - vertexVectorConstants0.packedValues[25u].x) / (vertexVectorConstants0.packedValues[25u].y - vertexVectorConstants0.packedValues[25u].x), 0.0, 1.0);
#endif
    varyingNormal0.x = vertexNormal0.x;
    varyingNormal0.y = vertexNormal0.y;
    varyingNormal0.z = vertexNormal0.z;
    varyingTexCoord4.x = 0.0;
    varyingTexCoord4.y = 0.0;
    varyingTexCoord4.z = 0.0;
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord3.x = multiplyAddValue14;
    varyingTexCoord3.y = multiplyAddValue15;
    varyingTexCoord3.z = multiplyAddValue16;
#endif
}
