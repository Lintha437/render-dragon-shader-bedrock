// EditorHighlight / HighlightTextureEdge / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 1
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/EditorHighlight/VertexBindings.hlsli"

void executeVertexStage()
{
    clipSpacePosition.x = (vertexPosition0.x * 2.0f) + (-1.0f);
    clipSpacePosition.y = (vertexPosition0.y * 2.0f) + (-1.0f);
    clipSpacePosition.z = vertexPosition0.z;
    clipSpacePosition.w = 1.0f;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
}
