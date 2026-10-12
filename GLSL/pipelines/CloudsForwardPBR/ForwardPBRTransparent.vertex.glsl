#version 460
#extension GL_GOOGLE_include_directive : require
// CloudsForwardPBR / ForwardPBRTransparent / vertex forward pipeline.
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
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/CloudsForwardPBR/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    vec4 multiplyAddValue10 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[104u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue10);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[105u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue10);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue10);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue10);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    vec4 multiplyAddValue11 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[40u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue11);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[41u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue11);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue11);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue11);
#endif
    uint scalarValue = uint(vertexTexCoord4);
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    bool comparisonValue2 = vertexScalarConstants0.packedValues[102u] != 0.0;
    varyingNormal0.x = comparisonValue2 ? vertexNormal0.x : 0.0;
    varyingNormal0.y = comparisonValue2 ? vertexNormal0.y : 0.0;
    varyingNormal0.z = comparisonValue2 ? vertexNormal0.z : 0.0;
    varyingTexCoord4 = int(comparisonValue2 ? scalarValue : 0u);
    varyingTexCoord5.x = (((scalarValue & 256u) == 0u) && comparisonValue2) ? 16.0 : 0.0;
    varyingTexCoord5.y = ((!comparisonValue2) || ((scalarValue & 512u) != 0u)) ? 0.0 : 16.0;
    varyingColor0.x = spvNClamp(vertexColor0.x * vertexVectorConstants0.packedValues[24u].x, 0.0, 1.0);
    varyingColor0.y = spvNClamp(vertexColor0.y * vertexVectorConstants0.packedValues[24u].y, 0.0, 1.0);
    varyingColor0.z = spvNClamp(vertexColor0.z * vertexVectorConstants0.packedValues[24u].z, 0.0, 1.0);
    varyingColor0.w = vertexScalarConstants0.packedValues[99u];
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    bool comparisonValue3 = vertexScalarConstants0.packedValues[38u] != 0.0;
    varyingNormal0.x = comparisonValue3 ? vertexNormal0.x : 0.0;
    varyingNormal0.y = comparisonValue3 ? vertexNormal0.y : 0.0;
    varyingNormal0.z = comparisonValue3 ? vertexNormal0.z : 0.0;
    varyingTexCoord4 = int(comparisonValue3 ? scalarValue : 0u);
    varyingTexCoord5.x = (((scalarValue & 256u) == 0u) && comparisonValue3) ? 16.0 : 0.0;
    varyingTexCoord5.y = (comparisonValue3 && ((scalarValue & 512u) == 0u)) ? 16.0 : 0.0;
    varyingColor0.x = spvNClamp(vertexColor0.x * vertexVectorConstants0.packedValues[8u].x, 0.0, 1.0);
    varyingColor0.y = spvNClamp(vertexColor0.y * vertexVectorConstants0.packedValues[8u].y, 0.0, 1.0);
    varyingColor0.z = spvNClamp(vertexColor0.z * vertexVectorConstants0.packedValues[8u].z, 0.0, 1.0);
    varyingColor0.w = vertexScalarConstants0.packedValues[35u];
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint intermediateValue1;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    float comparisonValue;
    float comparisonValue1;
    if (vertexVectorConstants0.packedValues[25u].z != 0.0)
    {
        intermediateValue1 = scalarValue;
        intermediateValue2 = vertexNormal0.x;
        intermediateValue3 = vertexNormal0.y;
        intermediateValue4 = vertexNormal0.z;
        comparisonValue = ((scalarValue & 256u) != 0u) ? 0.0 : 16.0;
        comparisonValue1 = ((scalarValue & 512u) != 0u) ? 0.0 : 16.0;
    }
    else
    {
        intermediateValue1 = 0u;
        intermediateValue2 = 0.0;
        intermediateValue3 = 0.0;
        intermediateValue4 = 0.0;
        comparisonValue = 0.0;
        comparisonValue1 = 0.0;
    }
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[26u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[26u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].w)));
    varyingTexCoord4 = int(intermediateValue1);
    varyingColor0.x = spvNClamp(vertexVectorConstants0.packedValues[24u].x * vertexColor0.x, 0.0, 1.0);
    varyingColor0.y = spvNClamp(vertexVectorConstants0.packedValues[24u].y * vertexColor0.y, 0.0, 1.0);
    varyingColor0.z = spvNClamp(vertexVectorConstants0.packedValues[24u].z * vertexColor0.z, 0.0, 1.0);
    varyingColor0.w = vertexVectorConstants0.packedValues[24u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue12 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue13 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue14 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float intermediateValue1;
    float intermediateValue2;
    float intermediateValue3;
    uint intermediateValue4;
    float comparisonValue;
    float comparisonValue1;
    if (vertexVectorConstants0.packedValues[9u].z != 0.0)
    {
        intermediateValue1 = vertexNormal0.x;
        intermediateValue2 = vertexNormal0.y;
        intermediateValue3 = vertexNormal0.z;
        intermediateValue4 = scalarValue;
        comparisonValue = ((scalarValue & 256u) != 0u) ? 0.0 : 16.0;
        comparisonValue1 = ((scalarValue & 512u) != 0u) ? 0.0 : 16.0;
    }
    else
    {
        intermediateValue1 = 0.0;
        intermediateValue2 = 0.0;
        intermediateValue3 = 0.0;
        intermediateValue4 = 0u;
        comparisonValue = 0.0;
        comparisonValue1 = 0.0;
    }
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[10u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue16, multiplyAddValue15 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[10u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue16, multiplyAddValue15 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue16, multiplyAddValue15 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue16, multiplyAddValue15 * vertexVectorConstants0.packedValues[0u].w)));
    varyingTexCoord4 = int(intermediateValue4);
    varyingColor0.x = spvNClamp(vertexVectorConstants0.packedValues[8u].x * vertexColor0.x, 0.0, 1.0);
    varyingColor0.y = spvNClamp(vertexVectorConstants0.packedValues[8u].y * vertexColor0.y, 0.0, 1.0);
    varyingColor0.z = spvNClamp(vertexVectorConstants0.packedValues[8u].z * vertexColor0.z, 0.0, 1.0);
    varyingColor0.w = vertexVectorConstants0.packedValues[8u].w;
#endif
    varyingFragmentPosition0.x = 0.0;
    varyingFragmentPosition0.y = 0.0;
    varyingFragmentPosition0.z = 0.0;
    varyingFragmentPosition0.w = 0.0;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = intermediateValue2;
    varyingNormal0.y = intermediateValue3;
    varyingNormal0.z = intermediateValue4;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = intermediateValue1;
    varyingNormal0.y = intermediateValue2;
    varyingNormal0.z = intermediateValue3;
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord5.x = comparisonValue;
    varyingTexCoord5.y = comparisonValue1;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord5.x = comparisonValue;
    varyingTexCoord5.y = comparisonValue1;
    varyingTexCoord3.x = multiplyAddValue12;
    varyingTexCoord3.y = multiplyAddValue13;
    varyingTexCoord3.z = multiplyAddValue14;
#endif
}
