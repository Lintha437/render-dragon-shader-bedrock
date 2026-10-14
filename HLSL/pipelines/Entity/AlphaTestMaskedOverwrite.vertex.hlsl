// Entity / AlphaTestMaskedOverwrite / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE0
#define RD_OPTION_SOURCE_INPUT_TYPE0 RD_SOURCE_INPUT_TYPE0_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE1
#define RD_OPTION_SOURCE_INPUT_TYPE1 RD_SOURCE_INPUT_TYPE1_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE2
#define RD_OPTION_SOURCE_INPUT_TYPE2 RD_SOURCE_INPUT_TYPE2_CONSTANT
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/Entity/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  int vertexBlendIndices0 : BLENDINDICES0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor2 : COLOR2,
  out float4 varyingTexCoord2 : TEXCOORD2,
  out float4 varyingColor3 : COLOR3,
  out float2 varyingTexCoord0 : TEXCOORD0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (uint)vertexBlendIndices0.x << 2;
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+23].xyzw * vertexPosition0.yyyy;
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+22].xyzw * vertexPosition0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+24].xyzw * vertexPosition0.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+25].xyzw + workingVector1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector2.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector2.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.xyzw * workingVector1.wwww + workingVector2.xyzw;
  clipSpacePosition.xyzw = workingVector1.xyzw;
  workingVector0.y = workingVector1.z / RD_UNIFORM_FOG_CONTROL.z;
  workingVector0.y = -RD_UNIFORM_FOG_CONTROL.x + workingVector0.y;
  workingVector0.z = RD_UNIFORM_FOG_CONTROL.y + -RD_UNIFORM_FOG_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.y / workingVector0.z);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  varyingTexCoord2.xyzw = float4(0,0,0,0);
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+23].xyzw * vertexNormal0.yyyy;
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+22].xyzw * vertexNormal0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+24].xyzw * vertexNormal0.zzzz + workingVector1.xyzw;
  workingVector0.xyzw = vertexVectorConstants0[workingVector0.x+25].xyzw * vertexNormal0.wwww + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * workingVector0.wwww + workingVector1.xyzw;
  workingVector0.w = dot(workingVector0.xyzw, workingVector0.xyzw);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector0.y = workingVector0.y * RD_UNIFORM_TILE_LIGHT_COLOR.w + 1;
  workingVector0.xz = workingVector0.xz * workingVector0.xz;
  workingVector0.x = -0.100000001 * workingVector0.x;
  workingVector0.x = workingVector0.y * 0.275000006 + workingVector0.x;
  workingVector0.x = workingVector0.z * 0.100000001 + workingVector0.x;
  workingVector0.x = 0.449999988 + workingVector0.x;
  workingVector0.x = RD_UNIFORM_OVERLAY_COLOR.w * 0.349999994 + workingVector0.x;
  varyingColor3.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xxx;
  varyingColor3.w = 1;
  varyingTexCoord0.xy = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 22u;
    uint sumValue1 = bitwiseValue + 23u;
    uint sumValue2 = bitwiseValue + 24u;
    uint sumValue3 = bitwiseValue + 25u;
    float multiplyAddValue = mad(vertexConstants[sumValue2].x, vertexPosition0.z, mad(vertexConstants[sumValue1].x, vertexPosition0.y, vertexConstants[sumValue].x * vertexPosition0.x)) + vertexConstants[sumValue3].x;
    float multiplyAddValue1 = mad(vertexConstants[sumValue2].y, vertexPosition0.z, mad(vertexConstants[sumValue1].y, vertexPosition0.y, vertexConstants[sumValue].y * vertexPosition0.x)) + vertexConstants[sumValue3].y;
    float multiplyAddValue2 = mad(vertexConstants[sumValue2].z, vertexPosition0.z, mad(vertexConstants[sumValue1].z, vertexPosition0.y, vertexConstants[sumValue].z * vertexPosition0.x)) + vertexConstants[sumValue3].z;
    float multiplyAddValue3 = mad(vertexConstants[sumValue2].w, vertexPosition0.z, mad(vertexConstants[sumValue1].w, vertexPosition0.y, vertexConstants[sumValue].w * vertexPosition0.x)) + vertexConstants[sumValue3].w;
    float multiplyAddValue4 = mad(vertexConstants[sumValue3].x, vertexNormal0.w, mad(vertexConstants[sumValue2].x, vertexNormal0.z, mad(vertexConstants[sumValue1].x, vertexNormal0.y, vertexConstants[sumValue].x * vertexNormal0.x)));
    float multiplyAddValue5 = mad(vertexConstants[sumValue3].y, vertexNormal0.w, mad(vertexConstants[sumValue2].y, vertexNormal0.z, mad(vertexConstants[sumValue1].y, vertexNormal0.y, vertexConstants[sumValue].y * vertexNormal0.x)));
    float multiplyAddValue6 = mad(vertexConstants[sumValue3].z, vertexNormal0.w, mad(vertexConstants[sumValue2].z, vertexNormal0.z, mad(vertexConstants[sumValue1].z, vertexNormal0.y, vertexConstants[sumValue].z * vertexNormal0.x)));
    float multiplyAddValue7 = mad(vertexConstants[sumValue3].w, vertexNormal0.w, mad(vertexConstants[sumValue2].w, vertexNormal0.z, mad(vertexConstants[sumValue1].w, vertexNormal0.y, vertexConstants[sumValue].w * vertexNormal0.x)));
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, multiplyAddValue7, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, multiplyAddValue6, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue10 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, multiplyAddValue7, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, multiplyAddValue6, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue11 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, multiplyAddValue7, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, multiplyAddValue6, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue12 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, multiplyAddValue7, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, multiplyAddValue6, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_MODEL_MATRICES_ROW_0.w)));
    float inverseLengthValue = rsqrt(dot(float4(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11, multiplyAddValue12), float4(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11, multiplyAddValue12)));
    float productValue = inverseLengthValue * multiplyAddValue9;
    float productValue1 = inverseLengthValue * multiplyAddValue11;
    float productValue2 = (((0.449999988079071044921875f - ((productValue * productValue) * 0.100000001490116119384765625f)) + ((productValue1 * productValue1) * 0.100000001490116119384765625f)) + (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f)) + ((((inverseLengthValue * multiplyAddValue10) * RD_UNIFORM_TILE_LIGHT_COLOR.w) + 1.0f) * 0.2750000059604644775390625f);
    clipSpacePosition.x = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue3, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue3, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = multiplyAddValue8;
    clipSpacePosition.w = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue8 / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingTexCoord2.x = 0.0f;
    varyingTexCoord2.y = 0.0f;
    varyingTexCoord2.z = 0.0f;
    varyingTexCoord2.w = 0.0f;
    varyingColor3.x = productValue2 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue2 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue2 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    varyingTexCoord0.y = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexBlendIndices0 = stage_input.vertexBlendIndices0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor2 = varyingColor2;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingColor3 = varyingColor3;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#endif
}
