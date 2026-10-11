// DeferredIndirectSpecular / DoIndirectSpecularShading / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_MODE
#define RD_OPTION_MODE RD_MODE_DEFAULT
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/DeferredIndirectSpecular/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingColor1 : COLOR1,
  out float4 varyingTexCoord0 : TEXCOORD0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  clipSpacePosition.xyz = vertexPosition0.xyz * float3(2,2,1) + float3(-1,-1,0);
  clipSpacePosition.w = 1;
  varyingColor1.xyz = vertexPosition0.xyz * float3(2,2,1) + float3(-1,-1,0);
  varyingTexCoord0.xy = RD_UNIFORM_VIEWPORT_SCALE.xy * vertexTexCoord0.xy;
  varyingTexCoord0.zw = vertexTexCoord0.xy;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (vertexPosition0.x * 2.0f) + (-1.0f);
    float productValue1 = (vertexPosition0.y * 2.0f) + (-1.0f);
    clipSpacePosition.x = productValue;
    clipSpacePosition.y = productValue1;
    clipSpacePosition.z = vertexPosition0.z;
    clipSpacePosition.w = 1.0f;
    varyingColor1.x = productValue;
    varyingColor1.y = productValue1;
    varyingColor1.z = vertexPosition0.z;
    varyingTexCoord0.x = RD_UNIFORM_VIEWPORT_SCALE.x * vertexTexCoord0.x;
    varyingTexCoord0.y = RD_UNIFORM_VIEWPORT_SCALE.y * vertexTexCoord0.y;
    varyingTexCoord0.z = vertexTexCoord0.x;
    varyingTexCoord0.w = vertexTexCoord0.y;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#endif
}
