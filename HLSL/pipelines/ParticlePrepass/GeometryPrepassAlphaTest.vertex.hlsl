// ParticlePrepass / GeometryPrepassAlphaTest / vertex forward pipeline.
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
#define RD_BINDING_LAYOUT 5
#endif


#include "../../include/materials/ParticlePrepass/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float2 vertexTexCoord1 : TEXCOORD1,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor0 : COLOR0,
  out float3 varyingTexCoord2 : TEXCOORD2,
  out float4 varyingColor1 : COLOR1,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTexCoord4 : TEXCOORD4,
  out float3 varyingTangent0 : TANGENT0,
  out float2 varyingTexCoord0 : TEXCOORD0,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord1 : TEXCOORD1,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor0 : COLOR0,
  out float3 varyingTexCoord2 : TEXCOORD2,
  out float4 varyingColor1 : COLOR1,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTexCoord4 : TEXCOORD4,
  out float3 varyingTangent0 : TANGENT0,
  out float2 varyingTexCoord0 : TEXCOORD0,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexPosition0.yyy;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexPosition0.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexPosition0.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz + workingVector1.xyz;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector2.xyzw;
  varyingTexCoord3.xyz = workingVector1.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector2.xyzw;
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
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.xy = float2(65535,65535) * vertexTexCoord1.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  if (8 == 0) workingVector1.x = 0; else if (8+8 < 32) {   workingVector1.x = (uint)workingVector0.x << (32-(8 + 8)); workingVector1.x = (uint)workingVector1.x >> (32-8);  } else workingVector1.x = (uint)workingVector0.x >> 8;
  if (8 == 0) workingVector1.y = 0; else if (8+8 < 32) {   workingVector1.y = (uint)workingVector0.y << (32-(8 + 8)); workingVector1.y = (uint)workingVector1.y >> (32-8);  } else workingVector1.y = (uint)workingVector0.y >> 8;
  if (4 == 0) workingVector1.z = 0; else if (4+4 < 32) {   workingVector1.z = (uint)workingVector0.y << (32-(4 + 4)); workingVector1.z = (uint)workingVector1.z >> (32-4);  } else workingVector1.z = (uint)workingVector0.y >> 4;
  workingVector0.xy = (int2)workingVector0.xy & int2(255,15);
  workingVector1.xyw = (uint3)workingVector1.zxy;
  workingVector1.z = (uint)workingVector0.x;
  workingVector0.x = (uint)workingVector0.y;
  varyingTexCoord1.y = 0.0666666701 * workingVector0.x;
  varyingTexCoord2.xyz = float3(0.00392156886,0.00392156886,0.00392156886) * workingVector1.yzw;
  varyingTexCoord1.x = 0.0666666701 * workingVector1.x;
  workingVector0.x = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  varyingColor1.w = saturate(-RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x / workingVector0.x);
  varyingColor1.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  varyingNormal0.xyz = vertexNormal0.xyz;
  varyingTexCoord4.xyz = float3(0,0,0);
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector0.xyz;
  varyingTangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector0.xyz;
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
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
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.xy = float2(65535,65535) * vertexTexCoord1.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  if (8 == 0) workingVector1.x = 0; else if (8+8 < 32) {   workingVector1.x = (uint)workingVector0.x << (32-(8 + 8)); workingVector1.x = (uint)workingVector1.x >> (32-8);  } else workingVector1.x = (uint)workingVector0.x >> 8;
  if (8 == 0) workingVector1.y = 0; else if (8+8 < 32) {   workingVector1.y = (uint)workingVector0.y << (32-(8 + 8)); workingVector1.y = (uint)workingVector1.y >> (32-8);  } else workingVector1.y = (uint)workingVector0.y >> 8;
  if (4 == 0) workingVector1.z = 0; else if (4+4 < 32) {   workingVector1.z = (uint)workingVector0.y << (32-(4 + 4)); workingVector1.z = (uint)workingVector1.z >> (32-4);  } else workingVector1.z = (uint)workingVector0.y >> 4;
  workingVector0.xy = (int2)workingVector0.xy & int2(255,15);
  workingVector1.xyw = (uint3)workingVector1.zxy;
  workingVector1.z = (uint)workingVector0.x;
  workingVector0.x = (uint)workingVector0.y;
  varyingTexCoord1.y = 0.0666666701 * workingVector0.x;
  varyingTexCoord2.xyz = float3(0.00392156886,0.00392156886,0.00392156886) * workingVector1.yzw;
  varyingTexCoord1.x = 0.0666666701 * workingVector1.x;
  workingVector0.x = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  varyingColor1.w = saturate(-RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x / workingVector0.x);
  varyingColor1.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  varyingNormal0.xyz = vertexNormal0.xyz;
  varyingTexCoord4.xyz = float3(0,0,0);
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector0.xyz;
  varyingTangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector0.xyz;
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(vertexTexCoord1.x * 65535.0f);
    uint productValue1 = uint(vertexTexCoord1.y * 65535.0f);
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue6, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord2.x = float((productValue >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    varyingTexCoord2.y = float(productValue & 255u) * 0.0039215688593685626983642578125f;
    varyingTexCoord2.z = float((productValue1 >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    varyingColor1.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor1.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor1.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor1.w = clamp(((-0.0f) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingNormal0.x = vertexNormal0.x;
    varyingNormal0.y = vertexNormal0.y;
    varyingNormal0.z = vertexNormal0.z;
    varyingTexCoord4.x = 0.0f;
    varyingTexCoord4.y = 0.0f;
    varyingTexCoord4.z = 0.0f;
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125f;
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
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(vertexTexCoord1.x * 65535.0f);
    uint productValue1 = uint(vertexTexCoord1.y * 65535.0f);
    float multiplyAddValue7 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue8 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue9 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue13, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord2.x = float((productValue >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    varyingTexCoord2.y = float(productValue & 255u) * 0.0039215688593685626983642578125f;
    varyingTexCoord2.z = float((productValue1 >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    varyingColor1.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor1.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor1.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor1.w = clamp(((-0.0f) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingNormal0.x = vertexNormal0.x;
    varyingNormal0.y = vertexNormal0.y;
    varyingNormal0.z = vertexNormal0.z;
    varyingTexCoord4.x = 0.0f;
    varyingTexCoord4.y = 0.0f;
    varyingTexCoord4.z = 0.0f;
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125f;
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
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
