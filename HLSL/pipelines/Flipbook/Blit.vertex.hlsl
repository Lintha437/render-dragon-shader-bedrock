// Flipbook / Blit / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/Flipbook/VertexBindings.hlsli"

void executeVertexStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue = vertexPosition0.y * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.x;
    precise float productValue1 = vertexPosition0.y * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.y;
    precise float productValue2 = vertexPosition0.y * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.z;
    precise float productValue3 = vertexPosition0.y * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.w;
    precise float multiplyAddValue = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.x, vertexPosition0.x, productValue)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.x;
    precise float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.y, vertexPosition0.x, productValue1)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.y;
    precise float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.z, vertexPosition0.x, productValue2)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.z;
    precise float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.w, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.w, vertexPosition0.x, productValue3)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.w;
    clipSpacePosition.x = multiplyAddValue;
    clipSpacePosition.y = multiplyAddValue1;
    clipSpacePosition.z = multiplyAddValue2;
    clipSpacePosition.w = multiplyAddValue3;
    precise float sumValue = vertexTexCoord0.y + RD_UNIFORM_V_BLEND_CONTROL.x;
    precise float sumValue1 = vertexTexCoord0.y + RD_UNIFORM_V_BLEND_CONTROL.y;
    varyingTexCoord1.y = sumValue;
    varyingTexCoord0.y = sumValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    clipSpacePosition.x = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.x, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.y, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.z, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.w, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.w, vertexPosition0.x, vertexPosition0.y * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingTexCoord1.y = vertexTexCoord0.y + RD_UNIFORM_V_BLEND_CONTROL.x;
    varyingTexCoord0.y = vertexTexCoord0.y + RD_UNIFORM_V_BLEND_CONTROL.y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    clipSpacePosition.x = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.w, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.w, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.w * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.w;
#endif
    varyingTexCoord1.x = vertexTexCoord0.x;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord1.y = RD_UNIFORM_V_BLEND_CONTROL.x + vertexTexCoord0.y;
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord0.y = RD_UNIFORM_V_BLEND_CONTROL.y + vertexTexCoord0.y;
#endif
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
}
