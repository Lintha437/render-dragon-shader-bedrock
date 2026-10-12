// CloudsForwardPBR / ForwardPBRTransparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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


#include "../../include/materials/CloudsForwardPBR/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTexCoord0 : TEXCOORD0,
#if RD_FEATURE_INSTANCING == RD_OFF
  int vertexTexCoord4 : TEXCOORD4,
#elif RD_FEATURE_INSTANCING == RD_ON
  int4 vertexTexCoord4 : TEXCOORD4,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
#endif
  out float4 clipSpacePosition : SV_POSITION0,
  out int varyingTexCoord4 : TEXCOORD4,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingFragmentPosition0 : FRAGPOSITION0,
  out float3 varyingNormal0 : NORMAL0,
  out float2 varyingTexCoord0 : TEXCOORD0,
  out float2 varyingTexCoord5 : TEXCOORD5,
  out float3 varyingTexCoord3 : TEXCOORD3)
{
#if RD_FEATURE_INSTANCING == RD_OFF
  float4 workingVector0,workingVector1,workingVector2;
#elif RD_FEATURE_INSTANCING == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
#if RD_FEATURE_INSTANCING == RD_OFF
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexPosition0.yyy;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexPosition0.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexPosition0.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz + workingVector1.xyz;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector2.xyzw;
  varyingTexCoord3.xyz = workingVector1.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector2.xyzw;
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector1.xyz = vertexPosition0.xyz;
  workingVector1.w = 1;
  workingVector2.y = dot(workingVector1.xyzw, vertexTexCoord6.xyzw);
  workingVector3.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector2.yyyy;
  workingVector2.x = dot(workingVector1.xyzw, vertexTexCoord7.xyzw);
  workingVector2.z = dot(workingVector1.xyzw, vertexTexCoord5.xyzw);
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector2.xxxx + workingVector3.xyzw;
  varyingTexCoord3.xyz = workingVector2.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector2.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
#endif
  clipSpacePosition.x = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  clipSpacePosition.y = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  clipSpacePosition.z = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  clipSpacePosition.w = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.xy = (int2)vertexTexCoord4.xx & int2(256,512);
  workingVector0.yz = workingVector0.xy ? float2(0,0) : float2(16,16);
  workingVector0.x = vertexTexCoord4.x;
  workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_CLOUD_LIGHTING_TOGGLES.z);
  workingVector0.xyz = workingVector0.www ? workingVector0.xyz : 0;
  varyingNormal0.xyz = workingVector0.www ? vertexNormal0.xyz : 0;
  varyingTexCoord4.x = workingVector0.x;
  varyingTexCoord5.xy = workingVector0.yz;
  varyingColor0.xyz = saturate(RD_UNIFORM_CLOUD_COLOR.xyz * vertexColor0.xyz);
  varyingColor0.w = RD_UNIFORM_CLOUD_COLOR.w;
  varyingFragmentPosition0.xyzw = float4(0,0,0,0);
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
{
    uint scalarValue = uint(vertexTexCoord4);
#if RD_FEATURE_INSTANCING == RD_OFF
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    uint intermediateValue1;
#elif RD_FEATURE_INSTANCING == RD_ON
    float multiplyAddValue7 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue8 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue9 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float intermediateValue1;
#endif
    float intermediateValue2;
    float intermediateValue3;
#if RD_FEATURE_INSTANCING == RD_OFF
    float intermediateValue4;
#elif RD_FEATURE_INSTANCING == RD_ON
    uint intermediateValue4;
#endif
    float comparisonValue;
    float comparisonValue1;
    if (RD_UNIFORM_CLOUD_LIGHTING_TOGGLES.z != 0.0f)
    {
#if RD_FEATURE_INSTANCING == RD_OFF
        intermediateValue1 = scalarValue;
        intermediateValue2 = vertexNormal0.x;
        intermediateValue3 = vertexNormal0.y;
        intermediateValue4 = vertexNormal0.z;
#elif RD_FEATURE_INSTANCING == RD_ON
        intermediateValue1 = vertexNormal0.x;
        intermediateValue2 = vertexNormal0.y;
        intermediateValue3 = vertexNormal0.z;
        intermediateValue4 = scalarValue;
#endif
        comparisonValue = ((scalarValue & 256u) != 0u) ? 0.0f : 16.0f;
        comparisonValue1 = ((scalarValue & 512u) != 0u) ? 0.0f : 16.0f;
    }
    else
    {
#if RD_FEATURE_INSTANCING == RD_OFF
        intermediateValue1 = 0u;
#elif RD_FEATURE_INSTANCING == RD_ON
        intermediateValue1 = 0.0f;
#endif
        intermediateValue2 = 0.0f;
        intermediateValue3 = 0.0f;
#if RD_FEATURE_INSTANCING == RD_OFF
        intermediateValue4 = 0.0f;
#elif RD_FEATURE_INSTANCING == RD_ON
        intermediateValue4 = 0u;
#endif
        comparisonValue = 0.0f;
        comparisonValue1 = 0.0f;
    }
#if RD_FEATURE_INSTANCING == RD_OFF
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue6, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingTexCoord4 = int(intermediateValue1);
#elif RD_FEATURE_INSTANCING == RD_ON
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue13, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingTexCoord4 = int(intermediateValue4);
#endif
    varyingColor0.x = clamp(RD_UNIFORM_CLOUD_COLOR.x * vertexColor0.x, 0.0f, 1.0f);
    varyingColor0.y = clamp(RD_UNIFORM_CLOUD_COLOR.y * vertexColor0.y, 0.0f, 1.0f);
    varyingColor0.z = clamp(RD_UNIFORM_CLOUD_COLOR.z * vertexColor0.z, 0.0f, 1.0f);
    varyingColor0.w = RD_UNIFORM_CLOUD_COLOR.w;
    varyingFragmentPosition0.x = 0.0f;
    varyingFragmentPosition0.y = 0.0f;
    varyingFragmentPosition0.z = 0.0f;
    varyingFragmentPosition0.w = 0.0f;
#if RD_FEATURE_INSTANCING == RD_OFF
    varyingNormal0.x = intermediateValue2;
    varyingNormal0.y = intermediateValue3;
    varyingNormal0.z = intermediateValue4;
#elif RD_FEATURE_INSTANCING == RD_ON
    varyingNormal0.x = intermediateValue1;
    varyingNormal0.y = intermediateValue2;
    varyingNormal0.z = intermediateValue3;
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord5.x = comparisonValue;
    varyingTexCoord5.y = comparisonValue1;
#if RD_FEATURE_INSTANCING == RD_OFF
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif RD_FEATURE_INSTANCING == RD_ON
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
#endif
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
#if RD_FEATURE_INSTANCING == RD_ON
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
#endif
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingFragmentPosition0 = varyingFragmentPosition0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
}
#endif
