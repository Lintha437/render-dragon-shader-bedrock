#version 460
#extension GL_GOOGLE_include_directive : require
// UIText / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 9
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_ALPHA_TEST
#define RD_FEATURE_ALPHA_TEST RD_OFF
#endif
#ifndef RD_OPTION_FONT_TYPE
#define RD_OPTION_FONT_TYPE RD_FONT_TYPE_BITMAP
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/UIText/VertexBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue3 = vertexPosition0.y * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[0u].x, vertexPosition0.x, productValue) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[0u].y, vertexPosition0.x, productValue1) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[0u].z, vertexPosition0.x, productValue2) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[0u].w, vertexPosition0.x, productValue3) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue;
    gl_Position.y = multiplyAddValue1;
    gl_Position.z = multiplyAddValue2;
    gl_Position.w = multiplyAddValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    gl_Position.x = fma(vertexVectorConstants0.packedValues[0u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[1u].x) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[0u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[1u].y) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[0u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[1u].z) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[0u].w, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[1u].w) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue = uint(int(vertexPosition0.z));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[1u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].x * vertexPosition0.x) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[1u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].y * vertexPosition0.x) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[1u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].z * vertexPosition0.x) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[1u].w, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].w * vertexPosition0.x) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM65)
    gl_Position.x = vertexVectorConstants0.packedValues[3u].x + fma(vertexVectorConstants0.packedValues[1u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].x * vertexPosition0.x);
    gl_Position.y = fma(vertexVectorConstants0.packedValues[1u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].y * vertexPosition0.x) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[1u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].z * vertexPosition0.x) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[1u].w, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].w * vertexPosition0.x) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue = uint(int(vertexPosition0.z));
    float sumValue;
    float sumValue1;
    float sumValue2;
    float sumValue3;
    if (vertexVectorConstants0.packedValues[5u].x > 0.00095000001601874828338623046875)
    {
        sumValue = vertexVectorConstants0.packedValues[6u].x + vertexTexCoord0.x;
        sumValue1 = vertexVectorConstants0.packedValues[6u].x + vertexTexCoord0.y;
        sumValue2 = (vertexTexCoord0.x + 0.0625) - vertexVectorConstants0.packedValues[6u].x;
        sumValue3 = (vertexVectorConstants0.packedValues[4u].x + vertexTexCoord0.y) - vertexVectorConstants0.packedValues[6u].x;
    }
    else
    {
        sumValue = 0.0;
        sumValue1 = 0.0;
        sumValue2 = 1.0;
        sumValue3 = 1.0;
    }
    gl_Position.x = fma(vertexVectorConstants0.packedValues[1u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].x * vertexPosition0.x) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[1u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].y * vertexPosition0.x) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[1u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].z * vertexPosition0.x) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[1u].w, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].w * vertexPosition0.x) + vertexVectorConstants0.packedValues[3u].w;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue5 = vertexTexCoord0.x + 0.0625;
    precise float sumValue6 = sumValue5 - vertexScalarConstants0.packedValues[20u];
    varyingTexCoord1.z = sumValue6;
    precise float sumValue7 = vertexTexCoord0.y + vertexScalarConstants0.packedValues[16u];
    precise float sumValue8 = sumValue7 - vertexScalarConstants0.packedValues[20u];
    varyingTexCoord1.w = sumValue8;
    precise float sumValue9 = vertexTexCoord0.x + vertexScalarConstants0.packedValues[20u];
    precise float sumValue10 = vertexTexCoord0.y + vertexScalarConstants0.packedValues[20u];
    varyingTexCoord1.x = sumValue9;
    varyingTexCoord1.y = sumValue10;
    uint scalarValue = uint(int(vertexPosition0.z));
    bool comparisonValue = scalarValue == 1u;
    precise float comparisonValue1 = ((comparisonValue || (scalarValue == 2u)) ? 0.0625 : 0.0) + vertexTexCoord0.x;
    precise float comparisonValue2 = ((comparisonValue || (scalarValue == 0u)) ? vertexScalarConstants0.packedValues[16u] : 0.0) + vertexTexCoord0.y;
    varyingTexCoord0.x = comparisonValue1;
    varyingTexCoord0.y = comparisonValue2;
#elif RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord1.z = 1.0;
    varyingTexCoord1.w = 1.0;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue5 = vertexTexCoord0.x + 0.0625;
    precise float sumValue11 = sumValue5 - vertexScalarConstants0.packedValues[24u];
    precise float sumValue7 = vertexTexCoord0.y + vertexScalarConstants0.packedValues[16u];
    precise float sumValue12 = sumValue7 - vertexScalarConstants0.packedValues[24u];
    bool conditionValue = vertexScalarConstants0.packedValues[20u] > 0.00095000001601874828338623046875;
    precise float sumValue13 = vertexTexCoord0.x + vertexScalarConstants0.packedValues[24u];
    precise float sumValue14 = vertexTexCoord0.y + vertexScalarConstants0.packedValues[24u];
    varyingTexCoord1.x = conditionValue ? sumValue13 : 0.0;
    varyingTexCoord1.y = conditionValue ? sumValue14 : 0.0;
    varyingTexCoord1.z = conditionValue ? sumValue11 : 1.0;
    varyingTexCoord1.w = conditionValue ? sumValue12 : 1.0;
    uint scalarValue = uint(int(vertexPosition0.z));
    bool comparisonValue = scalarValue == 1u;
    precise float comparisonValue3 = (((scalarValue == 2u) || comparisonValue) ? 0.0625 : 0.0) + vertexTexCoord0.x;
    precise float comparisonValue4 = (((scalarValue == 0u) || comparisonValue) ? vertexScalarConstants0.packedValues[16u] : 0.0) + vertexTexCoord0.y;
    varyingTexCoord0.x = comparisonValue3;
    varyingTexCoord0.y = comparisonValue4;
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue4 = vertexTexCoord0.x + 0.0625;
    varyingTexCoord1.z = sumValue4 - vertexScalarConstants0.packedValues[20u];
    varyingTexCoord1.w = (vertexTexCoord0.y + vertexScalarConstants0.packedValues[16u]) - vertexScalarConstants0.packedValues[20u];
    varyingTexCoord1.x = vertexTexCoord0.x + vertexScalarConstants0.packedValues[20u];
    varyingTexCoord1.y = vertexTexCoord0.y + vertexScalarConstants0.packedValues[20u];
    uint scalarValue = uint(int(vertexPosition0.z));
    bool comparisonValue = scalarValue == 1u;
    varyingTexCoord0.x = (comparisonValue || (scalarValue == 2u)) ? sumValue4 : vertexTexCoord0.x;
    varyingTexCoord0.y = (comparisonValue || (scalarValue == 0u)) ? (vertexScalarConstants0.packedValues[16u] + vertexTexCoord0.y) : vertexTexCoord0.y;
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue4 = vertexTexCoord0.x + 0.0625;
    bool conditionValue = vertexScalarConstants0.packedValues[20u] > 0.00095000001601874828338623046875;
    varyingTexCoord1.x = conditionValue ? (vertexTexCoord0.x + vertexScalarConstants0.packedValues[24u]) : 0.0;
    varyingTexCoord1.y = conditionValue ? (vertexTexCoord0.y + vertexScalarConstants0.packedValues[24u]) : 0.0;
    varyingTexCoord1.z = conditionValue ? (sumValue4 - vertexScalarConstants0.packedValues[24u]) : 1.0;
    varyingTexCoord1.w = conditionValue ? ((vertexTexCoord0.y + vertexScalarConstants0.packedValues[16u]) - vertexScalarConstants0.packedValues[24u]) : 1.0;
    uint scalarValue = uint(int(vertexPosition0.z));
    bool comparisonValue = scalarValue == 1u;
    varyingTexCoord0.x = ((scalarValue == 2u) || comparisonValue) ? sumValue4 : vertexTexCoord0.x;
    varyingTexCoord0.y = ((scalarValue == 0u) || comparisonValue) ? (vertexScalarConstants0.packedValues[16u] + vertexTexCoord0.y) : vertexTexCoord0.y;
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord1.x = vertexVectorConstants0.packedValues[5u].x + vertexTexCoord0.x;
    varyingTexCoord1.y = vertexVectorConstants0.packedValues[5u].x + vertexTexCoord0.y;
    varyingTexCoord1.z = (vertexTexCoord0.x + 0.0625) - vertexVectorConstants0.packedValues[5u].x;
    varyingTexCoord1.w = (vertexVectorConstants0.packedValues[4u].x + vertexTexCoord0.y) - vertexVectorConstants0.packedValues[5u].x;
    varyingTexCoord0.x = (((scalarValue + 4294967295u) < 2u) ? 0.0625 : 0.0) + vertexTexCoord0.x;
    varyingTexCoord0.y = ((scalarValue < 2u) ? vertexVectorConstants0.packedValues[4u].x : 0.0) + vertexTexCoord0.y;
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord1.x = sumValue;
    varyingTexCoord1.y = sumValue1;
    varyingTexCoord1.z = sumValue2;
    varyingTexCoord1.w = sumValue3;
    varyingTexCoord0.x = (((scalarValue + 4294967295u) < 2u) ? 0.0625 : 0.0) + vertexTexCoord0.x;
    varyingTexCoord0.y = ((scalarValue < 2u) ? vertexVectorConstants0.packedValues[4u].x : 0.0) + vertexTexCoord0.y;
#endif
}
