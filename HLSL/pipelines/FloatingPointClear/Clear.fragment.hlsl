// FloatingPointClear / Clear / fragment forward pipeline.
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


#include "../../include/materials/FloatingPointClear/FragmentBindings.hlsli"

void executeFragmentStage()
{
    fragmentColor0.x = RD_UNIFORM_CLEAR_COLOR.x;
    fragmentColor0.y = RD_UNIFORM_CLEAR_COLOR.y;
    fragmentColor0.z = RD_UNIFORM_CLEAR_COLOR.z;
    fragmentColor0.w = RD_UNIFORM_CLEAR_COLOR.w;
}
FragmentStageOutput main()
{
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
