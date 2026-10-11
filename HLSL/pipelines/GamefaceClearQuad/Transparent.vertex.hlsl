// GamefaceClearQuad / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/GamefaceClearQuad/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float3 vertexPosition0 : POSITION0,
  float4 vertexTexCoord1 : TEXCOORD1,
  uint4 vertexTexCoord4 : TEXCOORD4,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingTexCoord1 : TEXCOORD1,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord4 : TEXCOORD4,
  out float4 varyingTexCoord2 : TEXCOORD2,
  out float4 varyingTexCoord3 : TEXCOORD3,
  out float4 varyingTexCoord5 : TEXCOORD5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  clipSpacePosition.xyz = vertexPosition0.xyz;
  clipSpacePosition.w = 1;
  varyingTexCoord1.xyzw = float4(0,0,0,0);
  varyingTexCoord0.xyzw = vertexTexCoord1.xyzw;
  varyingTexCoord4.xyzw = float4(0,0,0,0);
  varyingTexCoord2.xyz = float3(0,0,0);
  varyingTexCoord3.xyzw = float4(0,0,0,0);
  varyingTexCoord5.xyzw = float4(0,0,0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    clipSpacePosition.x = vertexPosition0.x;
    clipSpacePosition.y = vertexPosition0.y;
    clipSpacePosition.z = vertexPosition0.z;
    clipSpacePosition.w = 1.0f;
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord1.z = 0.0f;
    varyingTexCoord1.w = 0.0f;
    varyingTexCoord0.x = vertexTexCoord1.x;
    varyingTexCoord0.y = vertexTexCoord1.y;
    varyingTexCoord0.z = vertexTexCoord1.z;
    varyingTexCoord0.w = vertexTexCoord1.w;
    varyingTexCoord4.x = 0.0f;
    varyingTexCoord4.y = 0.0f;
    varyingTexCoord4.z = 0.0f;
    varyingTexCoord4.w = 0.0f;
    varyingTexCoord2.x = 0.0f;
    varyingTexCoord2.y = 0.0f;
    varyingTexCoord2.z = 0.0f;
    varyingTexCoord3.x = 0.0f;
    varyingTexCoord3.y = 0.0f;
    varyingTexCoord3.z = 0.0f;
    varyingTexCoord3.w = 0.0f;
    varyingTexCoord5.x = 0.0f;
    varyingTexCoord5.y = 0.0f;
    varyingTexCoord5.z = 0.0f;
    varyingTexCoord5.w = 0.0f;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    return stage_output;
#endif
}
