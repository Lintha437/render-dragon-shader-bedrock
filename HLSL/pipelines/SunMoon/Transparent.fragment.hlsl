// SunMoon / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 1
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


#include "../../include/materials/SunMoon/FragmentBindings.hlsli"

void executeFragmentStage()
{
    float4 sampledTextureValue = sunMoonTextureTexture.Sample(sunMoonTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = sampledTextureValue.x * RD_UNIFORM_SUN_MOON_COLOR.x;
    fragmentColor0.y = sampledTextureValue.y * RD_UNIFORM_SUN_MOON_COLOR.y;
    fragmentColor0.z = sampledTextureValue.z * RD_UNIFORM_SUN_MOON_COLOR.z;
    fragmentColor0.w = sampledTextureValue.w * RD_UNIFORM_SUN_MOON_COLOR.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
