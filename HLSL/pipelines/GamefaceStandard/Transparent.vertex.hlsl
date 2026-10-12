// GamefaceStandard / Transparent / vertex forward pipeline.
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


#include "../../include/materials/GamefaceStandard/VertexBindings.hlsli"

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
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (uint)vertexTexCoord4.y << 8;
  workingVector0.x = (int)workingVector0.x & 3840;
  workingVector0.x = (int)workingVector0.x | (int)vertexTexCoord4.x;
  workingVector0.yzw = (int3)workingVector0.xxx + int3(1,2,3);
  workingVector1.xyz = vertexPosition0.xyz;
  workingVector1.w = 1;
  workingVector0.y = dot(workingVector1.xyzw, vertexVectorConstants0[workingVector0.y+0].xyzw);
  workingVector0.w = dot(workingVector1.xyzw, vertexVectorConstants0[workingVector0.w+0].xyzw);
  clipSpacePosition.z = dot(workingVector1.xyzw, vertexVectorConstants0[workingVector0.z+0].xyzw);
  workingVector0.x = dot(workingVector1.xyzw, vertexVectorConstants0[workingVector0.x+0].xyzw);
  clipSpacePosition.x = workingVector0.x * 2 + -workingVector0.w;
  workingVector0.x = workingVector0.w + -workingVector0.y;
  clipSpacePosition.y = workingVector0.x * 2 + -workingVector0.w;
  clipSpacePosition.w = workingVector0.w;
  varyingTexCoord1.xyzw = vertexTexCoord1.xyzw;
  varyingTexCoord0.xyzw = float4(0,0,0,0);
  varyingTexCoord4.xyzw = vertexTexCoord1.xyzw;
  varyingTexCoord2.xyz = vertexPosition0.xyz;
  varyingTexCoord3.xyzw = (uint4)vertexTexCoord4.xyzw;
  varyingTexCoord5.xyzw = float4(0,0,0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  bitMask.x = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector0.x = (((uint)vertexTexCoord4.y << 8) & bitMask.x) | ((uint)0 & ~bitMask.x);
  workingVector0.x = (int)workingVector0.x | (int)vertexTexCoord4.x;
  workingVector0.yzw = (int3)workingVector0.xxx + int3(1,2,3);
  workingVector1.xyz = vertexPosition0.xyz;
  workingVector1.w = 1;
  workingVector0.y = dot(workingVector1.xyzw, vertexVectorConstants0[workingVector0.y+0].xyzw);
  workingVector0.w = dot(workingVector1.xyzw, vertexVectorConstants0[workingVector0.w+0].xyzw);
  clipSpacePosition.z = dot(workingVector1.xyzw, vertexVectorConstants0[workingVector0.z+0].xyzw);
  workingVector0.x = dot(workingVector1.xyzw, vertexVectorConstants0[workingVector0.x+0].xyzw);
  clipSpacePosition.x = workingVector0.x * 2 + -workingVector0.w;
  workingVector0.x = workingVector0.w + -workingVector0.y;
  clipSpacePosition.y = workingVector0.x * 2 + -workingVector0.w;
  clipSpacePosition.w = workingVector0.w;
  varyingTexCoord1.xyzw = vertexTexCoord1.xyzw;
  varyingTexCoord0.xyzw = float4(0,0,0,0);
  varyingTexCoord4.xyzw = vertexTexCoord1.xyzw;
  varyingTexCoord2.xyz = vertexPosition0.xyz;
  varyingTexCoord3.xyzw = (uint4)vertexTexCoord4.xyzw;
  varyingTexCoord5.xyzw = float4(0,0,0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float scalarValue = float(vertexTexCoord4.x);
    float scalarValue1 = float(vertexTexCoord4.y);
    uint bitwiseValue = ((uint(scalarValue1) << 8u) & 3840u) | uint(scalarValue);
    uint sumValue = bitwiseValue + 3u;
    uint sumValue1 = bitwiseValue + 2u;
    uint sumValue2 = bitwiseValue + 1u;
    float multiplyAddValue = mad(vertexPosition0.z, vertexConstants[sumValue].z, mad(vertexPosition0.y, vertexConstants[sumValue].y, vertexConstants[sumValue].x * vertexPosition0.x)) + vertexConstants[sumValue].w;
    clipSpacePosition.x = ((mad(vertexPosition0.z, vertexConstants[bitwiseValue].z, mad(vertexPosition0.y, vertexConstants[bitwiseValue].y, vertexConstants[bitwiseValue].x * vertexPosition0.x)) + vertexConstants[bitwiseValue].w) * 2.0f) - multiplyAddValue;
    clipSpacePosition.y = (((((-0.0f) - vertexConstants[sumValue2].w) - mad(vertexPosition0.z, vertexConstants[sumValue2].z, mad(vertexPosition0.y, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * vertexPosition0.x))) + multiplyAddValue) * 2.0f) - multiplyAddValue;
    clipSpacePosition.z = mad(vertexPosition0.z, vertexConstants[sumValue1].z, mad(vertexPosition0.y, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * vertexPosition0.x)) + vertexConstants[sumValue1].w;
    clipSpacePosition.w = multiplyAddValue;
    varyingTexCoord1.x = vertexTexCoord1.x;
    varyingTexCoord1.y = vertexTexCoord1.y;
    varyingTexCoord1.z = vertexTexCoord1.z;
    varyingTexCoord1.w = vertexTexCoord1.w;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord0.z = 0.0f;
    varyingTexCoord0.w = 0.0f;
    varyingTexCoord4.x = vertexTexCoord1.x;
    varyingTexCoord4.y = vertexTexCoord1.y;
    varyingTexCoord4.z = vertexTexCoord1.z;
    varyingTexCoord4.w = vertexTexCoord1.w;
    varyingTexCoord2.x = vertexPosition0.x;
    varyingTexCoord2.y = vertexPosition0.y;
    varyingTexCoord2.z = vertexPosition0.z;
    varyingTexCoord3.x = scalarValue;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = float(vertexTexCoord4.z);
    varyingTexCoord3.w = float(vertexTexCoord4.w);
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
