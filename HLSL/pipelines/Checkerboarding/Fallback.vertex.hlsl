// Checkerboarding / Fallback / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 1
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/Checkerboarding/VertexBindings.hlsli"

void executeVertexStage()
{
    clipSpacePosition.x = 0.0f;
    clipSpacePosition.y = 0.0f;
    clipSpacePosition.z = 0.0f;
    clipSpacePosition.w = 0.0f;
}
VertexStageOutput main()
{
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    return stage_output;
}
