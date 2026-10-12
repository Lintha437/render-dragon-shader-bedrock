#version 460
#extension GL_GOOGLE_include_directive : require
// GamefacePath / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/GamefacePath/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uint reinterpretedBits2 = ((floatBitsToUint(vertexScalarConstants0.packedValues[4u]) << 8u) & 3840u) | floatBitsToUint(vertexScalarConstants0.packedValues[0u]);
    vec3 vectorValue = vec3(vertexPosition0.x, vertexPosition0.y, 1.0);
    float bitwiseValue1 = rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits2 + 19u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits2) + 304u) + 12u) >> 2u]));
    gl_Position.z = rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits2 + 18u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits2) + 288u) + 12u) >> 2u]));
    float scalarValue1 = -bitwiseValue1;
    gl_Position.x = fma(rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits2 + 16u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits2) + 256u) + 12u) >> 2u])), 2.0, scalarValue1);
    precise float bitwiseValue2 = bitwiseValue1 - rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits2 + 17u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits2) + 272u) + 12u) >> 2u]));
    gl_Position.y = fma(bitwiseValue2, 2.0, scalarValue1);
    gl_Position.w = bitwiseValue1;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    uint reinterpretedBits3 = ((floatBitsToUint(vertexTexCoord8.y) << 8u) & 3840u) | floatBitsToUint(vertexTexCoord8.x);
    vec3 vectorValue = vec3(vertexPosition0.x, vertexPosition0.y, 1.0);
    float bitwiseValue3 = rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits3 + 3u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits3) + 48u) + 12u) >> 2u]));
    gl_Position.z = rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits3 + 2u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits3) + 32u) + 12u) >> 2u]));
    float scalarValue2 = -bitwiseValue3;
    gl_Position.x = fma(rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits3].xy, vertexScalarConstants0.packedValues[(reinterpretedBits3 * 4u) + 3u])), 2.0, scalarValue2);
    precise float bitwiseValue4 = bitwiseValue3 - rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits3 + 1u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits3) + 16u) + 12u) >> 2u]));
    gl_Position.y = fma(bitwiseValue4, 2.0, scalarValue2);
    gl_Position.w = bitwiseValue3;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint reinterpretedBits1 = bitfieldInsert(0u, floatBitsToUint(vertexScalarConstants0.packedValues[4u]), int(8u), int(4u)) | floatBitsToUint(vertexScalarConstants0.packedValues[0u]);
    vec3 vectorValue = vec3(vertexPosition0.x, vertexPosition0.y, 1.0);
    float bitwiseValue = rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits1 + 19u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits1) + 304u) + 12u) >> 2u]));
    gl_Position.z = rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits1 + 18u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits1) + 288u) + 12u) >> 2u]));
    float scalarValue = -bitwiseValue;
    gl_Position.x = fma(rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits1 + 16u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits1) + 256u) + 12u) >> 2u])), 2.0, scalarValue);
    gl_Position.y = fma(bitwiseValue - rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits1 + 17u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits1) + 272u) + 12u) >> 2u])), 2.0, scalarValue);
    gl_Position.w = bitwiseValue;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint reinterpretedBits4 = bitfieldInsert(0u, floatBitsToUint(vertexTexCoord8.y), int(8u), int(4u)) | floatBitsToUint(vertexTexCoord8.x);
    vec3 vectorValue = vec3(vertexPosition0.x, vertexPosition0.y, 1.0);
    float bitwiseValue5 = rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits4 + 3u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits4) + 48u) + 12u) >> 2u]));
    gl_Position.z = rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits4 + 2u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits4) + 32u) + 12u) >> 2u]));
    float scalarValue3 = -bitwiseValue5;
    gl_Position.x = fma(rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits4].xy, vertexScalarConstants0.packedValues[(reinterpretedBits4 * 4u) + 3u])), 2.0, scalarValue3);
    gl_Position.y = fma(bitwiseValue5 - rdDot3Precise2(vectorValue, vec3(vertexVectorConstants0.packedValues[reinterpretedBits4 + 1u].xy, vertexScalarConstants0.packedValues[(((16u * reinterpretedBits4) + 16u) + 12u) >> 2u])), 2.0, scalarValue3);
    gl_Position.w = bitwiseValue5;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint reinterpretedBits = ((floatBitsToUint(vertexVectorConstants0.packedValues[1u].x) << 8u) & 3840u) | floatBitsToUint(vertexVectorConstants0.packedValues[0u].x);
    uint sumValue = reinterpretedBits + 19u;
    uint sumValue1 = reinterpretedBits + 18u;
    uint sumValue2 = reinterpretedBits + 17u;
    uint sumValue3 = reinterpretedBits + 16u;
    float multiplyAddValue = fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexPosition0.x) + vertexVectorConstants0.packedValues[sumValue].w;
    gl_Position.x = ((vertexVectorConstants0.packedValues[sumValue3].w + fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexPosition0.x)) * 2.0) - multiplyAddValue;
    gl_Position.y = (((((-0.0) - vertexVectorConstants0.packedValues[sumValue2].w) - fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexPosition0.x)) + multiplyAddValue) * 2.0) - multiplyAddValue;
    gl_Position.z = fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexPosition0.x) + vertexVectorConstants0.packedValues[sumValue1].w;
    gl_Position.w = multiplyAddValue;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint reinterpretedBits3 = ((floatBitsToUint(vertexTexCoord8.y) << 8u) & 3840u) | floatBitsToUint(vertexTexCoord8.x);
    uint sumValue4 = reinterpretedBits3 + 3u;
    uint sumValue5 = reinterpretedBits3 + 2u;
    uint sumValue6 = reinterpretedBits3 + 1u;
    float multiplyAddValue1 = fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexPosition0.x) + vertexVectorConstants0.packedValues[sumValue4].w;
    gl_Position.x = ((vertexVectorConstants0.packedValues[reinterpretedBits3].w + fma(vertexPosition0.y, vertexVectorConstants0.packedValues[reinterpretedBits3].y, vertexVectorConstants0.packedValues[reinterpretedBits3].x * vertexPosition0.x)) * 2.0) - multiplyAddValue1;
    gl_Position.y = (((((-0.0) - vertexVectorConstants0.packedValues[sumValue6].w) - fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexPosition0.x)) + multiplyAddValue1) * 2.0) - multiplyAddValue1;
    gl_Position.z = fma(vertexPosition0.y, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexPosition0.x) + vertexVectorConstants0.packedValues[sumValue5].w;
    gl_Position.w = multiplyAddValue1;
#endif
    varyingTexCoord0.x = vertexPosition0.z;
    varyingTexCoord0.y = vertexPosition0.w;
    varyingTexCoord0.z = 0.0;
    varyingTexCoord0.w = 0.0;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord3.x = vertexScalarConstants0.packedValues[0u];
    varyingTexCoord3.y = vertexScalarConstants0.packedValues[4u];
    varyingTexCoord3.z = vertexScalarConstants0.packedValues[8u];
    varyingTexCoord3.w = vertexScalarConstants0.packedValues[12u];
#elif RD_FEATURE_INSTANCING == RD_ON
    varyingTexCoord3.x = vertexTexCoord8.x;
    varyingTexCoord3.y = vertexTexCoord8.y;
    varyingTexCoord3.z = vertexTexCoord8.z;
    varyingTexCoord3.w = vertexTexCoord8.w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = vertexVectorConstants0.packedValues[0u].x;
    varyingTexCoord3.y = vertexVectorConstants0.packedValues[1u].x;
    varyingTexCoord3.z = vertexVectorConstants0.packedValues[2u].x;
    varyingTexCoord3.w = vertexVectorConstants0.packedValues[3u].x;
#endif
}
