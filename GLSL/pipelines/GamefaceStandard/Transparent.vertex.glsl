#version 460
#extension GL_GOOGLE_include_directive : require
// GamefaceStandard / Transparent / vertex forward pipeline.
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

#include "../../include/materials/GamefaceStandard/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint bitwiseValue1 = ((vertexTexCoord4.y << 8u) & 3840u) | vertexTexCoord4.x;
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float sumValue3 = rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue1 + 3u]);
    gl_Position.z = rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue1 + 2u]);
    float scalarValue2 = -sumValue3;
    gl_Position.x = fma(rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue1]), 2.0, scalarValue2);
    precise float sumValue4 = sumValue3 - rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue1 + 1u]);
    gl_Position.y = fma(sumValue4, 2.0, scalarValue2);
    gl_Position.w = sumValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint bitwiseValue2 = bitfieldInsert(0u, vertexTexCoord4.y, int(8u), int(4u)) | vertexTexCoord4.x;
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float sumValue5 = rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue2 + 3u]);
    gl_Position.z = rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue2 + 2u]);
    float scalarValue3 = -sumValue5;
    gl_Position.x = fma(rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue2]), 2.0, scalarValue3);
    gl_Position.y = fma(sumValue5 - rdDot4Precise(vectorValue, vertexVectorConstants0.packedValues[bitwiseValue2 + 1u]), 2.0, scalarValue3);
    gl_Position.w = sumValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float scalarValue = float(vertexTexCoord4.x);
    float scalarValue1 = float(vertexTexCoord4.y);
    uint bitwiseValue = ((uint(scalarValue1) << 8u) & 3840u) | uint(scalarValue);
    uint sumValue = bitwiseValue + 3u;
    uint sumValue1 = bitwiseValue + 2u;
    uint sumValue2 = bitwiseValue + 1u;
    float multiplyAddValue = fma(vertexPosition0.z, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[sumValue].w;
    gl_Position.x = ((fma(vertexPosition0.z, vertexVectorConstants0.packedValues[bitwiseValue].z, fma(vertexPosition0.y, vertexVectorConstants0.packedValues[bitwiseValue].y, vertexVectorConstants0.packedValues[bitwiseValue].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[bitwiseValue].w) * 2.0) - multiplyAddValue;
    gl_Position.y = (((((-0.0) - vertexVectorConstants0.packedValues[sumValue2].w) - fma(vertexPosition0.z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexPosition0.x))) + multiplyAddValue) * 2.0) - multiplyAddValue;
    gl_Position.z = fma(vertexPosition0.z, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[sumValue1].w;
    gl_Position.w = multiplyAddValue;
#endif
    varyingTexCoord1.x = vertexTexCoord1.x;
    varyingTexCoord1.y = vertexTexCoord1.y;
    varyingTexCoord1.z = vertexTexCoord1.z;
    varyingTexCoord1.w = vertexTexCoord1.w;
    varyingTexCoord0.x = 0.0;
    varyingTexCoord0.y = 0.0;
    varyingTexCoord0.z = 0.0;
    varyingTexCoord0.w = 0.0;
    varyingTexCoord4.x = vertexTexCoord1.x;
    varyingTexCoord4.y = vertexTexCoord1.y;
    varyingTexCoord4.z = vertexTexCoord1.z;
    varyingTexCoord4.w = vertexTexCoord1.w;
    varyingTexCoord2.x = vertexPosition0.x;
    varyingTexCoord2.y = vertexPosition0.y;
    varyingTexCoord2.z = vertexPosition0.z;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord3.x = rdEvaluateFloatExpression(vertexTexCoord4.x);
    varyingTexCoord3.y = rdEvaluateFloatExpression(vertexTexCoord4.y);
    varyingTexCoord3.z = rdEvaluateFloatExpression(vertexTexCoord4.z);
    varyingTexCoord3.w = rdEvaluateFloatExpression(vertexTexCoord4.w);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord3.x = scalarValue;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = float(vertexTexCoord4.z);
    varyingTexCoord3.w = float(vertexTexCoord4.w);
#endif
    varyingTexCoord5.x = 0.0;
    varyingTexCoord5.y = 0.0;
    varyingTexCoord5.z = 0.0;
    varyingTexCoord5.w = 0.0;
}
