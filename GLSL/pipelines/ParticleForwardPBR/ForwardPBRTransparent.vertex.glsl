#version 460
#extension GL_GOOGLE_include_directive : require
// ParticleForwardPBR / ForwardPBRTransparent / vertex forward pipeline.
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
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/ParticleForwardPBR/VertexBindings.glsli"

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
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = multiplyAddValue3;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = multiplyAddValue12;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(vertexTexCoord1.x * 65535.0);
    uint productValue1 = uint(vertexTexCoord1.y * 65535.0);
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = multiplyAddValue7;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(vertexTexCoord1.x * 65535.0);
    uint productValue1 = uint(vertexTexCoord1.y * 65535.0);
    float multiplyAddValue8 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue9 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue10 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = multiplyAddValue11;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint productValue = uint(vertexTexCoord1.x * 65535.0);
    uint productValue1 = uint(vertexTexCoord1.y * 65535.0);
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = rdEvaluateFloatExpression(bitfieldExtract(productValue, int(8u), int(8u))) * 0.0039215688593685626983642578125;
    varyingTexCoord2.y = rdEvaluateFloatExpression(productValue & 255u) * 0.0039215688593685626983642578125;
    varyingTexCoord2.z = rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(8u), int(8u))) * 0.0039215688593685626983642578125;
    varyingTexCoord1.x = rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(4u), int(4u))) * 0.066666670143604278564453125;
    varyingColor1.w = spvNClamp(((multiplyAddValue3 / vertexScalarConstants0.packedValues[82u]) - vertexScalarConstants0.packedValues[80u]) / (vertexScalarConstants0.packedValues[81u] - vertexScalarConstants0.packedValues[80u]), 0.0, 1.0);
    varyingColor1.x = vertexVectorConstants0.packedValues[21u].x;
    varyingColor1.y = vertexVectorConstants0.packedValues[21u].y;
    varyingColor1.z = vertexVectorConstants0.packedValues[21u].z;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint productValue = uint(vertexTexCoord1.x * 65535.0);
    uint productValue1 = uint(vertexTexCoord1.y * 65535.0);
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = rdEvaluateFloatExpression(bitfieldExtract(productValue, int(8u), int(8u))) * 0.0039215688593685626983642578125;
    varyingTexCoord2.y = rdEvaluateFloatExpression(productValue & 255u) * 0.0039215688593685626983642578125;
    varyingTexCoord2.z = rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(8u), int(8u))) * 0.0039215688593685626983642578125;
    varyingTexCoord1.x = rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(4u), int(4u))) * 0.066666670143604278564453125;
    varyingColor1.w = spvNClamp(((multiplyAddValue12 / vertexScalarConstants0.packedValues[18u]) - vertexScalarConstants0.packedValues[16u]) / (vertexScalarConstants0.packedValues[17u] - vertexScalarConstants0.packedValues[16u]), 0.0, 1.0);
    varyingColor1.x = vertexVectorConstants0.packedValues[5u].x;
    varyingColor1.y = vertexVectorConstants0.packedValues[5u].y;
    varyingColor1.z = vertexVectorConstants0.packedValues[5u].z;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord2.x = float((productValue >> 8u) & 255u) * 0.0039215688593685626983642578125;
    varyingTexCoord2.y = float(productValue & 255u) * 0.0039215688593685626983642578125;
    varyingTexCoord2.z = float((productValue1 >> 8u) & 255u) * 0.0039215688593685626983642578125;
    varyingColor1.x = vertexVectorConstants0.packedValues[21u].x;
    varyingColor1.y = vertexVectorConstants0.packedValues[21u].y;
    varyingColor1.z = vertexVectorConstants0.packedValues[21u].z;
    varyingColor1.w = spvNClamp(((multiplyAddValue7 / vertexVectorConstants0.packedValues[20u].z) - vertexVectorConstants0.packedValues[20u].x) / (vertexVectorConstants0.packedValues[20u].y - vertexVectorConstants0.packedValues[20u].x), 0.0, 1.0);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord2.x = float((productValue >> 8u) & 255u) * 0.0039215688593685626983642578125;
    varyingTexCoord2.y = float(productValue & 255u) * 0.0039215688593685626983642578125;
    varyingTexCoord2.z = float((productValue1 >> 8u) & 255u) * 0.0039215688593685626983642578125;
    varyingColor1.x = vertexVectorConstants0.packedValues[5u].x;
    varyingColor1.y = vertexVectorConstants0.packedValues[5u].y;
    varyingColor1.z = vertexVectorConstants0.packedValues[5u].z;
    varyingColor1.w = spvNClamp(((multiplyAddValue11 / vertexVectorConstants0.packedValues[4u].z) - vertexVectorConstants0.packedValues[4u].x) / (vertexVectorConstants0.packedValues[4u].y - vertexVectorConstants0.packedValues[4u].x), 0.0, 1.0);
#endif
    varyingNormal0.x = 0.0;
    varyingNormal0.y = 0.0;
    varyingNormal0.z = 0.0;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord3.x = multiplyAddValue4;
    varyingTexCoord3.y = multiplyAddValue5;
    varyingTexCoord3.z = multiplyAddValue6;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord3.x = multiplyAddValue8;
    varyingTexCoord3.y = multiplyAddValue9;
    varyingTexCoord3.z = multiplyAddValue10;
#endif
}
