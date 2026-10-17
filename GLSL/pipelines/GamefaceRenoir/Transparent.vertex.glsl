#version 460
#extension GL_GOOGLE_include_directive : require
// GamefaceRenoir / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/GamefaceRenoir/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint bitwiseValue1 = ((vertexTexCoord4.y << 8u) & 3840u) | vertexTexCoord4.x;
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float sumValue7 = rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue1 + 3u]);
    precise float sumValue8 = sumValue7 - rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue1 + 1u]);
    float scalarValue2 = -sumValue7;
    gl_Position.y = fma(sumValue8, 2.0, scalarValue2);
    gl_Position.x = fma(rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue1]), 2.0, scalarValue2);
    gl_Position.w = sumValue7;
    gl_Position.z = rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue1 + 2u]);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint bitwiseValue2 = bitfieldInsert(0u, vertexTexCoord4.y, int(8u), int(4u)) | vertexTexCoord4.x;
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float sumValue9 = rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue2 + 3u]);
    float scalarValue3 = -sumValue9;
    gl_Position.y = fma(sumValue9 - rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue2 + 1u]), 2.0, scalarValue3);
    gl_Position.x = fma(rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue2]), 2.0, scalarValue3);
    gl_Position.w = sumValue9;
    gl_Position.z = rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue2 + 2u]);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float scalarValue = float(vertexTexCoord4.x);
    float scalarValue1 = float(vertexTexCoord4.y);
    uint bitwiseValue = ((uint(scalarValue1) << 8u) & 3840u) | uint(scalarValue);
    uint sumValue = bitwiseValue + 3u;
    uint sumValue1 = bitwiseValue + 2u;
    uint sumValue2 = bitwiseValue + 1u;
    float multiplyAddValue = fma(vertexPosition0.z, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[sumValue].w;
    bool comparisonValue = vertexTexCoord1.w == 2.0;
    float comparisonValue1 = comparisonValue ? vertexTexCoord1.x : vertexPosition0.x;
    float comparisonValue2 = comparisonValue ? vertexTexCoord1.y : vertexPosition0.y;
    float comparisonValue3 = comparisonValue ? 0.0 : vertexPosition0.z;
    uint sumValue3 = bitwiseValue + 7u;
    uint sumValue4 = bitwiseValue + 6u;
    uint sumValue5 = bitwiseValue + 5u;
    uint sumValue6 = bitwiseValue + 4u;
    gl_Position.x = ((fma(vertexPosition0.z, vertexVectorConstants0.packedValues[bitwiseValue].z, fma(vertexPosition0.y, vertexVectorConstants0.packedValues[bitwiseValue].y, vertexVectorConstants0.packedValues[bitwiseValue].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[bitwiseValue].w) * 2.0) - multiplyAddValue;
    gl_Position.y = (((((-0.0) - vertexVectorConstants0.packedValues[sumValue2].w) - fma(vertexPosition0.z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexPosition0.x))) + multiplyAddValue) * 2.0) - multiplyAddValue;
    gl_Position.z = fma(vertexPosition0.z, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[sumValue1].w;
    gl_Position.w = multiplyAddValue;
#endif
    varyingTexCoord1.x = vertexTexCoord1.x;
    varyingTexCoord1.y = vertexTexCoord1.y;
    varyingTexCoord1.z = vertexTexCoord1.z;
    varyingTexCoord1.w = vertexTexCoord1.w;
    varyingTexCoord4.x = 0.0;
    varyingTexCoord4.y = 0.0;
    varyingTexCoord4.z = 0.0;
    varyingTexCoord4.w = 0.0;
    varyingTexCoord2.x = vertexPosition0.x;
    varyingTexCoord2.y = vertexPosition0.y;
    varyingTexCoord2.z = vertexPosition0.z;
#if RD_PLATFORM == RD_PLATFORM_SM40
    varyingTexCoord3.x = rdEvaluateFloatExpression(vertexTexCoord4.x);
    varyingTexCoord3.y = rdEvaluateFloatExpression(vertexTexCoord4.y);
    varyingTexCoord3.z = rdEvaluateFloatExpression(vertexTexCoord4.z);
    varyingTexCoord3.w = rdEvaluateFloatExpression(vertexTexCoord4.w);
    bool comparisonValue = vertexTexCoord1.w == 2.0;
    vec4 comparisonValue4 = vec4(comparisonValue ? vertexTexCoord1.x : vertexPosition0.x, comparisonValue ? vertexTexCoord1.y : vertexPosition0.y, comparisonValue ? 0.0 : vertexPosition0.z, 1.0);
    varyingTexCoord5.x = rdDot4Precise(comparisonValue4, vertexVectorConstants0.packedValues[bitwiseValue1 + 4u]);
    varyingTexCoord5.y = rdDot4Precise(comparisonValue4, vertexVectorConstants0.packedValues[bitwiseValue1 + 5u]);
    varyingTexCoord5.z = rdDot4Precise(comparisonValue4, vertexVectorConstants0.packedValues[bitwiseValue1 + 6u]);
    varyingTexCoord5.w = rdDot4Precise(comparisonValue4, vertexVectorConstants0.packedValues[bitwiseValue1 + 7u]);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord3.x = rdEvaluateFloatExpression(vertexTexCoord4.x);
    varyingTexCoord3.y = rdEvaluateFloatExpression(vertexTexCoord4.y);
    varyingTexCoord3.z = rdEvaluateFloatExpression(vertexTexCoord4.z);
    varyingTexCoord3.w = rdEvaluateFloatExpression(vertexTexCoord4.w);
    bool comparisonValue = vertexTexCoord1.w == 2.0;
    vec4 comparisonValue4 = vec4(comparisonValue ? vertexTexCoord1.x : vertexPosition0.x, comparisonValue ? vertexTexCoord1.y : vertexPosition0.y, comparisonValue ? 0.0 : vertexPosition0.z, 1.0);
    varyingTexCoord5.x = rdDot4Precise(comparisonValue4, vertexVectorConstants0.packedValues[bitwiseValue2 + 4u]);
    varyingTexCoord5.y = rdDot4Precise(comparisonValue4, vertexVectorConstants0.packedValues[bitwiseValue2 + 5u]);
    varyingTexCoord5.z = rdDot4Precise(comparisonValue4, vertexVectorConstants0.packedValues[bitwiseValue2 + 6u]);
    varyingTexCoord5.w = rdDot4Precise(comparisonValue4, vertexVectorConstants0.packedValues[bitwiseValue2 + 7u]);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord3.x = scalarValue;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = float(vertexTexCoord4.z);
    varyingTexCoord3.w = float(vertexTexCoord4.w);
    varyingTexCoord5.x = fma(comparisonValue3, vertexVectorConstants0.packedValues[sumValue6].z, fma(comparisonValue2, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * comparisonValue1)) + vertexVectorConstants0.packedValues[sumValue6].w;
    varyingTexCoord5.y = fma(comparisonValue3, vertexVectorConstants0.packedValues[sumValue5].z, fma(comparisonValue2, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * comparisonValue1)) + vertexVectorConstants0.packedValues[sumValue5].w;
    varyingTexCoord5.z = fma(comparisonValue3, vertexVectorConstants0.packedValues[sumValue4].z, fma(comparisonValue2, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * comparisonValue1)) + vertexVectorConstants0.packedValues[sumValue4].w;
    varyingTexCoord5.w = fma(comparisonValue3, vertexVectorConstants0.packedValues[sumValue3].z, fma(comparisonValue2, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * comparisonValue1)) + vertexVectorConstants0.packedValues[sumValue3].w;
#endif
    varyingTexCoord0.x = 0.0;
    varyingTexCoord0.y = 0.0;
    varyingTexCoord0.z = 0.0;
    varyingTexCoord0.w = 0.0;
}
