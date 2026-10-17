// GamefaceRenoir / Transparent / vertex forward pipeline.
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


#include "../../include/materials/GamefaceRenoir/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float3 vertexPosition0 : POSITION0,
  float4 vertexTexCoord1 : TEXCOORD1,
  uint4 vertexTexCoord4 : TEXCOORD4,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingTexCoord1 : TEXCOORD1,
  out float4 varyingTexCoord4 : TEXCOORD4,
  out float4 varyingTexCoord2 : TEXCOORD2,
  out float4 varyingTexCoord3 : TEXCOORD3,
  out float4 varyingTexCoord5 : TEXCOORD5,
  out float4 varyingTexCoord0 : TEXCOORD0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.x = (uint)vertexTexCoord4.y << 8;
  workingVector0.x = (int)workingVector0.x & 3840;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  bitMask.x = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector0.x = (((uint)vertexTexCoord4.y << 8) & bitMask.x) | ((uint)0 & ~bitMask.x);
#endif
  workingVector0.x = (int)workingVector0.x | (int)vertexTexCoord4.x;
  workingVector1.xyzw = (int4)workingVector0.xxxx + int4(1,2,3,4);
  workingVector2.xyz = vertexPosition0.xyz;
  workingVector2.w = 1;
  workingVector0.y = dot(workingVector2.xyzw, vertexVectorConstants0[workingVector1.x+0].xyzw);
  workingVector0.z = dot(workingVector2.xyzw, vertexVectorConstants0[workingVector1.z+0].xyzw);
  workingVector0.y = workingVector0.z + -workingVector0.y;
  clipSpacePosition.y = workingVector0.y * 2 + -workingVector0.z;
  workingVector0.y = dot(workingVector2.xyzw, vertexVectorConstants0[workingVector0.x+0].xyzw);
  workingVector3.xyz = (int3)workingVector0.xxx + int3(5,6,7);
  clipSpacePosition.x = workingVector0.y * 2 + -workingVector0.z;
  clipSpacePosition.w = workingVector0.z;
  clipSpacePosition.z = dot(workingVector2.xyzw, vertexVectorConstants0[workingVector1.y+0].xyzw);
  varyingTexCoord1.xyzw = vertexTexCoord1.xyzw;
  varyingTexCoord4.xyzw = float4(0,0,0,0);
  varyingTexCoord2.xyz = vertexPosition0.xyz;
  varyingTexCoord3.xyzw = (uint4)vertexTexCoord4.xyzw;
  workingVector0.x = RD_COMPARISON_MASK(vertexTexCoord1.w == 2.000000);
  workingVector4.xy = vertexTexCoord1.xy;
  workingVector4.zw = float2(0,1);
  workingVector0.xyzw = workingVector0.xxxx ? workingVector4.xyzw : workingVector2.xyzw;
  varyingTexCoord5.x = dot(workingVector0.xyzw, vertexVectorConstants0[workingVector1.w+0].xyzw);
  varyingTexCoord5.y = dot(workingVector0.xyzw, vertexVectorConstants0[workingVector3.x+0].xyzw);
  varyingTexCoord5.z = dot(workingVector0.xyzw, vertexVectorConstants0[workingVector3.y+0].xyzw);
  varyingTexCoord5.w = dot(workingVector0.xyzw, vertexVectorConstants0[workingVector3.z+0].xyzw);
  varyingTexCoord0.xyzw = float4(0,0,0,0);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
{
    float scalarValue = float(vertexTexCoord4.x);
    float scalarValue1 = float(vertexTexCoord4.y);
    uint bitwiseValue = ((uint(scalarValue1) << 8u) & 3840u) | uint(scalarValue);
    uint sumValue = bitwiseValue + 3u;
    uint sumValue1 = bitwiseValue + 2u;
    uint sumValue2 = bitwiseValue + 1u;
    float multiplyAddValue = mad(vertexPosition0.z, vertexConstants[sumValue].z, mad(vertexPosition0.y, vertexConstants[sumValue].y, vertexConstants[sumValue].x * vertexPosition0.x)) + vertexConstants[sumValue].w;
    bool comparisonValue = vertexTexCoord1.w == 2.0f;
    float comparisonValue1 = comparisonValue ? vertexTexCoord1.x : vertexPosition0.x;
    float comparisonValue2 = comparisonValue ? vertexTexCoord1.y : vertexPosition0.y;
    float comparisonValue3 = comparisonValue ? 0.0f : vertexPosition0.z;
    uint sumValue3 = bitwiseValue + 7u;
    uint sumValue4 = bitwiseValue + 6u;
    uint sumValue5 = bitwiseValue + 5u;
    uint sumValue6 = bitwiseValue + 4u;
    clipSpacePosition.x = ((mad(vertexPosition0.z, vertexConstants[bitwiseValue].z, mad(vertexPosition0.y, vertexConstants[bitwiseValue].y, vertexConstants[bitwiseValue].x * vertexPosition0.x)) + vertexConstants[bitwiseValue].w) * 2.0f) - multiplyAddValue;
    clipSpacePosition.y = (((((-0.0f) - vertexConstants[sumValue2].w) - mad(vertexPosition0.z, vertexConstants[sumValue2].z, mad(vertexPosition0.y, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * vertexPosition0.x))) + multiplyAddValue) * 2.0f) - multiplyAddValue;
    clipSpacePosition.z = mad(vertexPosition0.z, vertexConstants[sumValue1].z, mad(vertexPosition0.y, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * vertexPosition0.x)) + vertexConstants[sumValue1].w;
    clipSpacePosition.w = multiplyAddValue;
    varyingTexCoord1.x = vertexTexCoord1.x;
    varyingTexCoord1.y = vertexTexCoord1.y;
    varyingTexCoord1.z = vertexTexCoord1.z;
    varyingTexCoord1.w = vertexTexCoord1.w;
    varyingTexCoord4.x = 0.0f;
    varyingTexCoord4.y = 0.0f;
    varyingTexCoord4.z = 0.0f;
    varyingTexCoord4.w = 0.0f;
    varyingTexCoord2.x = vertexPosition0.x;
    varyingTexCoord2.y = vertexPosition0.y;
    varyingTexCoord2.z = vertexPosition0.z;
    varyingTexCoord3.x = scalarValue;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = float(vertexTexCoord4.z);
    varyingTexCoord3.w = float(vertexTexCoord4.w);
    varyingTexCoord5.x = mad(comparisonValue3, vertexConstants[sumValue6].z, mad(comparisonValue2, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * comparisonValue1)) + vertexConstants[sumValue6].w;
    varyingTexCoord5.y = mad(comparisonValue3, vertexConstants[sumValue5].z, mad(comparisonValue2, vertexConstants[sumValue5].y, vertexConstants[sumValue5].x * comparisonValue1)) + vertexConstants[sumValue5].w;
    varyingTexCoord5.z = mad(comparisonValue3, vertexConstants[sumValue4].z, mad(comparisonValue2, vertexConstants[sumValue4].y, vertexConstants[sumValue4].x * comparisonValue1)) + vertexConstants[sumValue4].w;
    varyingTexCoord5.w = mad(comparisonValue3, vertexConstants[sumValue3].z, mad(comparisonValue2, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * comparisonValue1)) + vertexConstants[sumValue3].w;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord0.z = 0.0f;
    varyingTexCoord0.w = 0.0f;
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
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
}
#endif
