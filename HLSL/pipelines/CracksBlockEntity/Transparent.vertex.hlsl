// CracksBlockEntity / Transparent / vertex forward pipeline.
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


#include "../../include/materials/CracksBlockEntity/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  int vertexBlendIndices0 : BLENDINDICES0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float2 varyingTexCoord0 : TEXCOORD0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (uint)vertexBlendIndices0.x << 2;
  workingVector0.yzw = vertexVectorConstants0[workingVector0.x+25].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+25].xxx + workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+25].zzz + workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+25].www + workingVector0.yzw;
  workingVector0.yzw = vertexPosition0.yyy * workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+24].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+24].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+24].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+24].www + workingVector1.xyz;
  workingVector0.yzw = workingVector1.xyz * vertexPosition0.xxx + workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+26].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+26].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+26].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+26].www + workingVector1.xyz;
  workingVector0.yzw = workingVector1.xyz * vertexPosition0.zzz + workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+27].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+27].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+27].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+27].www + workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz + workingVector0.yzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  workingVector1.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  clipSpacePosition.x = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector1.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  clipSpacePosition.y = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  clipSpacePosition.z = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector1.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  clipSpacePosition.w = dot(workingVector1.xyzw, workingVector0.xyzw);
  varyingTexCoord0.xy = RD_UNIFORM_UV_SCALE.xy * vertexTexCoord0.xy;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 24u;
    uint sumValue1 = bitwiseValue + 25u;
    uint sumValue2 = bitwiseValue + 26u;
    uint sumValue3 = bitwiseValue + 27u;
    float multiplyAddValue = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue1 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue2 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue6, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingTexCoord0.x = RD_UNIFORM_UV_SCALE.x * vertexTexCoord0.x;
    varyingTexCoord0.y = RD_UNIFORM_UV_SCALE.y * vertexTexCoord0.y;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexBlendIndices0 = stage_input.vertexBlendIndices0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#endif
}
