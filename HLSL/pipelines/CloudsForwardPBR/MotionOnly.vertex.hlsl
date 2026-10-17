// CloudsForwardPBR / MotionOnly / vertex forward pipeline.
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
#define RD_BINDING_LAYOUT 9
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_5 1
#endif

#include "../../include/materials/CloudsForwardPBR/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeVertexStage()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.y)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_MATRICES_ROW_1.z)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    float4 multiplyAddValue3 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, multiplyAddValue, multiplyAddValue1 * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue3);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue3);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue3);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue3);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float4 vectorValue = float4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0f);
    float scalarValue = rdDot4Precise(vectorValue, float4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue, float4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, float4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    float4 multiplyAddValue18 = float4(mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.x, scalarValue1, scalarValue * RD_UNIFORM_VIEW_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.y, scalarValue1, scalarValue * RD_UNIFORM_VIEW_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, scalarValue1, scalarValue * RD_UNIFORM_VIEW_MATRIX_ROW_1.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, scalarValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_0.w, scalarValue1, scalarValue * RD_UNIFORM_VIEW_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w);
    clipSpacePosition.x = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x + RD_UNIFORM_SUB_PIXEL_OFFSET.x, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x), multiplyAddValue18);
    clipSpacePosition.y = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y), multiplyAddValue18);
    clipSpacePosition.z = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z), multiplyAddValue18);
    clipSpacePosition.w = rdDot4Precise(float4(RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w), multiplyAddValue18);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue6 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue10, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue11 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue12 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue13 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue16 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue17 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue17, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
#endif
    varyingTexCoord4 = int(0u);
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
    varyingFragmentPosition0.x = 0.0f;
    varyingFragmentPosition0.y = 0.0f;
    varyingFragmentPosition0.z = 0.0f;
    varyingFragmentPosition0.w = 0.0f;
    varyingNormal0.x = 0.0f;
    varyingNormal0.y = 0.0f;
    varyingNormal0.z = 0.0f;
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord6.x = mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_PREV_WORLD_ROW_1.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.x;
    varyingTexCoord6.y = mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_PREV_WORLD_ROW_1.y)) + RD_UNIFORM_PREV_WORLD_ROW_3.y;
    varyingTexCoord6.z = mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_PREV_WORLD_ROW_1.z)) + RD_UNIFORM_PREV_WORLD_ROW_3.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord6.x = mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.x;
    varyingTexCoord6.y = mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.y;
    varyingTexCoord6.z = mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.z;
#endif
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord5.x = 0.0f;
    varyingTexCoord5.y = 0.0f;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue4;
    varyingTexCoord3.y = multiplyAddValue5;
    varyingTexCoord3.z = multiplyAddValue6;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue11;
    varyingTexCoord3.y = multiplyAddValue12;
    varyingTexCoord3.z = multiplyAddValue13;
#endif
}
VertexStageOutput main(VertexStageInput stage_input)
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
#endif
    vertexPosition0 = stage_input.vertexPosition0;
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
#endif
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingFragmentPosition0 = varyingFragmentPosition0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord6 = varyingTexCoord6;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
}
