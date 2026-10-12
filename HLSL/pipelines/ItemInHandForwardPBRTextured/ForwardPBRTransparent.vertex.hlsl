// ItemInHandForwardPBRTextured / ForwardPBRTransparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/ItemInHandForwardPBRTextured/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
  float4 vertexTexCoord0 : TEXCOORD0,
  int4 vertexTexCoord4 : TEXCOORD4,
  float4 vertexTexCoord8 : TEXCOORD8,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingColor0 : COLOR0,
  out int varyingFrontFacing0 : FRONTFACING0,
  out int varyingTexCoord4 : TEXCOORD4,
  out float4 varyingTexCoord8 : TEXCOORD8,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTexCoord5 : TEXCOORD5,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
  float4 vertexTexCoord0 : TEXCOORD0,
  int4 vertexTexCoord4 : TEXCOORD4,
  float4 vertexTexCoord8 : TEXCOORD8,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingColor0 : COLOR0,
  out int varyingFrontFacing0 : FRONTFACING0,
  out int varyingTexCoord4 : TEXCOORD4,
  out float4 varyingTexCoord8 : TEXCOORD8,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTexCoord5 : TEXCOORD5,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexPosition0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexPosition0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexPosition0.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz + workingVector0.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  varyingTexCoord3.xyz = workingVector0.xyz;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor1.xyzw = workingVector0.xyzw;
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingFrontFacing0.x = 0;
  varyingTexCoord4.x = vertexTexCoord4.x;
  varyingTexCoord8.xyzw = vertexTexCoord8.xyzw;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  varyingNormal0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_1.xyz * vertexPosition0.yyy;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexPosition0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexPosition0.zzz + workingVector0.xyz;
  varyingTexCoord5.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector0.xyz;
  varyingTangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector0.xyz;
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  if (1 == 0) workingVector0.z = 0; else if (1+15 < 32) {   workingVector0.z = (uint)workingVector0.x << (32-(1 + 15)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.x >> 15;
  if (1 == 0) workingVector0.w = 0; else if (1+15 < 32) {   workingVector0.w = (uint)workingVector0.y << (32-(1 + 15)); workingVector0.w = (uint)workingVector0.w >> (32-1);  } else workingVector0.w = (uint)workingVector0.y >> 15;
  bitMask.x = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.x = (((uint)workingVector0.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
  bitMask.y = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.y = (((uint)workingVector0.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = vertexPosition0.xyz;
  workingVector0.w = 1;
  workingVector1.y = dot(workingVector0.xyzw, vertexTexCoord6.xyzw);
  workingVector2.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector1.x = dot(workingVector0.xyzw, vertexTexCoord7.xyzw);
  workingVector1.z = dot(workingVector0.xyzw, vertexTexCoord5.xyzw);
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector2.xyzw;
  varyingTexCoord3.xyz = workingVector1.xyz;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor1.xyzw = workingVector0.xyzw;
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingFrontFacing0.x = 0;
  varyingTexCoord4.x = vertexTexCoord4.x;
  varyingTexCoord8.xyzw = vertexTexCoord8.xyzw;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  varyingNormal0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_1.xyz * vertexPosition0.yyy;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexPosition0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexPosition0.zzz + workingVector0.xyz;
  varyingTexCoord5.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector0.xyz;
  varyingTangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector0.xyz;
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  if (1 == 0) workingVector0.z = 0; else if (1+15 < 32) {   workingVector0.z = (uint)workingVector0.x << (32-(1 + 15)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.x >> 15;
  if (1 == 0) workingVector0.w = 0; else if (1+15 < 32) {   workingVector0.w = (uint)workingVector0.y << (32-(1 + 15)); workingVector0.w = (uint)workingVector0.w >> (32-1);  } else workingVector0.w = (uint)workingVector0.y >> 15;
  bitMask.x = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.x = (((uint)workingVector0.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
  bitMask.y = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.y = (((uint)workingVector0.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float productValue = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue1 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue2 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue3 = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue4 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = multiplyAddValue3;
    clipSpacePosition.y = multiplyAddValue4;
    clipSpacePosition.z = multiplyAddValue5;
    clipSpacePosition.w = multiplyAddValue6;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue));
    varyingColor1.x = multiplyAddValue3;
    varyingColor1.y = multiplyAddValue4;
    varyingColor1.z = multiplyAddValue5;
    varyingColor1.w = multiplyAddValue6;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingFrontFacing0 = int(0u);
    varyingTexCoord8.x = vertexTexCoord8.x;
    varyingTexCoord8.y = vertexTexCoord8.y;
    varyingTexCoord8.z = vertexTexCoord8.z;
    varyingTexCoord8.w = vertexTexCoord8.w;
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    varyingTexCoord4 = int(uint(vertexTexCoord4));
    varyingTexCoord5.x = mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.x;
    varyingTexCoord5.y = mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.y;
    varyingTexCoord5.z = mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.z;
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue3 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue4 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue4 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
    vertexTexCoord8 = stage_input.vertexTexCoord8;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingTexCoord8 = varyingTexCoord8;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue7 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue8 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue9 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float productValue = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue1 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue2 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue3 = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue4 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = multiplyAddValue10;
    clipSpacePosition.y = multiplyAddValue11;
    clipSpacePosition.z = multiplyAddValue12;
    clipSpacePosition.w = multiplyAddValue13;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue1, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue));
    varyingColor1.x = multiplyAddValue10;
    varyingColor1.y = multiplyAddValue11;
    varyingColor1.z = multiplyAddValue12;
    varyingColor1.w = multiplyAddValue13;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingFrontFacing0 = int(0u);
    varyingTexCoord8.x = vertexTexCoord8.x;
    varyingTexCoord8.y = vertexTexCoord8.y;
    varyingTexCoord8.z = vertexTexCoord8.z;
    varyingTexCoord8.w = vertexTexCoord8.w;
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    varyingTexCoord4 = int(uint(vertexTexCoord4));
    varyingTexCoord5.x = mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.x;
    varyingTexCoord5.y = mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.y;
    varyingTexCoord5.z = mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexPosition0.y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_PREV_WORLD_ROW_3.z;
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue3 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue4 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue4 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
    vertexTexCoord8 = stage_input.vertexTexCoord8;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingTexCoord8 = varyingTexCoord8;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
