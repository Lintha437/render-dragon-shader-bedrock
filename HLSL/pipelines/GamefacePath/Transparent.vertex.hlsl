// GamefacePath / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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


#include "../../include/materials/GamefacePath/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexPosition0 : POSITION0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord3 : TEXCOORD3)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexPosition0 : POSITION0,
  float4 vertexTexCoord8 : TEXCOORD8,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = asuint(RD_UNIFORM_MODEL_MATRICES_ROW_1.x) << 8;
  workingVector0.x = (int)workingVector0.x & 3840;
  workingVector0.x = (int)workingVector0.x | asint(RD_UNIFORM_MODEL_MATRICES_ROW_0.x);
  workingVector0.yzw = (int3)workingVector0.xxx + int3(1,2,3);
  workingVector1.xy = vertexPosition0.xy;
  workingVector1.z = 1;
  workingVector0.y = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.y+16].xyw);
  workingVector0.w = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.w+16].xyw);
  clipSpacePosition.z = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.z+16].xyw);
  workingVector0.x = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.x+16].xyw);
  clipSpacePosition.x = workingVector0.x * 2 + -workingVector0.w;
  workingVector0.x = workingVector0.w + -workingVector0.y;
  clipSpacePosition.y = workingVector0.x * 2 + -workingVector0.w;
  clipSpacePosition.w = workingVector0.w;
  varyingTexCoord0.xy = vertexPosition0.zw;
  varyingTexCoord0.zw = float2(0,0);
  varyingTexCoord3.x = RD_UNIFORM_MODEL_MATRICES_ROW_0.x;
  varyingTexCoord3.y = RD_UNIFORM_MODEL_MATRICES_ROW_1.x;
  varyingTexCoord3.z = RD_UNIFORM_MODEL_MATRICES_ROW_2.x;
  varyingTexCoord3.w = RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (uint)vertexTexCoord8.y << 8;
  workingVector0.x = (int)workingVector0.x & 3840;
  workingVector0.x = (int)workingVector0.x | (int)vertexTexCoord8.x;
  workingVector0.yzw = (int3)workingVector0.xxx + int3(1,2,3);
  workingVector1.xy = vertexPosition0.xy;
  workingVector1.z = 1;
  workingVector0.y = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.y+0].xyw);
  workingVector0.w = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.w+0].xyw);
  clipSpacePosition.z = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.z+0].xyw);
  workingVector0.x = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.x+0].xyw);
  clipSpacePosition.x = workingVector0.x * 2 + -workingVector0.w;
  workingVector0.x = workingVector0.w + -workingVector0.y;
  clipSpacePosition.y = workingVector0.x * 2 + -workingVector0.w;
  clipSpacePosition.w = workingVector0.w;
  varyingTexCoord0.xy = vertexPosition0.zw;
  varyingTexCoord0.zw = float2(0,0);
  varyingTexCoord3.xyzw = vertexTexCoord8.xyzw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  bitMask.x = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector0.x = (((uint)RD_UNIFORM_MODEL_MATRICES_ROW_1.x << 8) & bitMask.x) | ((uint)0 & ~bitMask.x);
  workingVector0.x = (int)workingVector0.x | asint(RD_UNIFORM_MODEL_MATRICES_ROW_0.x);
  workingVector0.yzw = (int3)workingVector0.xxx + int3(1,2,3);
  workingVector1.xy = vertexPosition0.xy;
  workingVector1.z = 1;
  workingVector0.y = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.y+16].xyw);
  workingVector0.w = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.w+16].xyw);
  clipSpacePosition.z = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.z+16].xyw);
  workingVector0.x = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.x+16].xyw);
  clipSpacePosition.x = workingVector0.x * 2 + -workingVector0.w;
  workingVector0.x = workingVector0.w + -workingVector0.y;
  clipSpacePosition.y = workingVector0.x * 2 + -workingVector0.w;
  clipSpacePosition.w = workingVector0.w;
  varyingTexCoord0.xy = vertexPosition0.zw;
  varyingTexCoord0.zw = float2(0,0);
  varyingTexCoord3.x = RD_UNIFORM_MODEL_MATRICES_ROW_0.x;
  varyingTexCoord3.y = RD_UNIFORM_MODEL_MATRICES_ROW_1.x;
  varyingTexCoord3.z = RD_UNIFORM_MODEL_MATRICES_ROW_2.x;
  varyingTexCoord3.w = RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  bitMask.x = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector0.x = (((uint)vertexTexCoord8.y << 8) & bitMask.x) | ((uint)0 & ~bitMask.x);
  workingVector0.x = (int)workingVector0.x | (int)vertexTexCoord8.x;
  workingVector0.yzw = (int3)workingVector0.xxx + int3(1,2,3);
  workingVector1.xy = vertexPosition0.xy;
  workingVector1.z = 1;
  workingVector0.y = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.y+0].xyw);
  workingVector0.w = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.w+0].xyw);
  clipSpacePosition.z = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.z+0].xyw);
  workingVector0.x = dot(workingVector1.xyz, vertexVectorConstants0[workingVector0.x+0].xyw);
  clipSpacePosition.x = workingVector0.x * 2 + -workingVector0.w;
  workingVector0.x = workingVector0.w + -workingVector0.y;
  clipSpacePosition.y = workingVector0.x * 2 + -workingVector0.w;
  clipSpacePosition.w = workingVector0.w;
  varyingTexCoord0.xy = vertexPosition0.zw;
  varyingTexCoord0.zw = float2(0,0);
  varyingTexCoord3.xyzw = vertexTexCoord8.xyzw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint reinterpretedBits = ((asuint(RD_UNIFORM_MODEL_MATRICES_ROW_1.x) << 8u) & 3840u) | asuint(RD_UNIFORM_MODEL_MATRICES_ROW_0.x);
    uint sumValue = reinterpretedBits + 19u;
    uint sumValue1 = reinterpretedBits + 18u;
    uint sumValue2 = reinterpretedBits + 17u;
    uint sumValue3 = reinterpretedBits + 16u;
    float multiplyAddValue = mad(vertexPosition0.y, vertexConstants[sumValue].y, vertexConstants[sumValue].x * vertexPosition0.x) + vertexConstants[sumValue].w;
    clipSpacePosition.x = ((vertexConstants[sumValue3].w + mad(vertexPosition0.y, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * vertexPosition0.x)) * 2.0f) - multiplyAddValue;
    clipSpacePosition.y = (((((-0.0f) - vertexConstants[sumValue2].w) - mad(vertexPosition0.y, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * vertexPosition0.x)) + multiplyAddValue) * 2.0f) - multiplyAddValue;
    clipSpacePosition.z = mad(vertexPosition0.y, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * vertexPosition0.x) + vertexConstants[sumValue1].w;
    clipSpacePosition.w = multiplyAddValue;
    varyingTexCoord0.x = vertexPosition0.z;
    varyingTexCoord0.y = vertexPosition0.w;
    varyingTexCoord0.z = 0.0f;
    varyingTexCoord0.w = 0.0f;
    varyingTexCoord3.x = RD_UNIFORM_MODEL_MATRICES_ROW_0.x;
    varyingTexCoord3.y = RD_UNIFORM_MODEL_MATRICES_ROW_1.x;
    varyingTexCoord3.z = RD_UNIFORM_MODEL_MATRICES_ROW_2.x;
    varyingTexCoord3.w = RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexPosition0 = stage_input.vertexPosition0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint reinterpretedBits1 = ((asuint(vertexTexCoord8.y) << 8u) & 3840u) | asuint(vertexTexCoord8.x);
    uint sumValue4 = reinterpretedBits1 + 3u;
    uint sumValue5 = reinterpretedBits1 + 2u;
    uint sumValue6 = reinterpretedBits1 + 1u;
    float multiplyAddValue1 = mad(vertexPosition0.y, vertexConstants[sumValue4].y, vertexConstants[sumValue4].x * vertexPosition0.x) + vertexConstants[sumValue4].w;
    clipSpacePosition.x = ((vertexConstants[reinterpretedBits1].w + mad(vertexPosition0.y, vertexConstants[reinterpretedBits1].y, vertexConstants[reinterpretedBits1].x * vertexPosition0.x)) * 2.0f) - multiplyAddValue1;
    clipSpacePosition.y = (((((-0.0f) - vertexConstants[sumValue6].w) - mad(vertexPosition0.y, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * vertexPosition0.x)) + multiplyAddValue1) * 2.0f) - multiplyAddValue1;
    clipSpacePosition.z = mad(vertexPosition0.y, vertexConstants[sumValue5].y, vertexConstants[sumValue5].x * vertexPosition0.x) + vertexConstants[sumValue5].w;
    clipSpacePosition.w = multiplyAddValue1;
    varyingTexCoord0.x = vertexPosition0.z;
    varyingTexCoord0.y = vertexPosition0.w;
    varyingTexCoord0.z = 0.0f;
    varyingTexCoord0.w = 0.0f;
    varyingTexCoord3.x = vertexTexCoord8.x;
    varyingTexCoord3.y = vertexTexCoord8.y;
    varyingTexCoord3.z = vertexTexCoord8.z;
    varyingTexCoord3.w = vertexTexCoord8.w;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord8 = stage_input.vertexTexCoord8;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
