// TextureShiftRenderChunk / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 5
#endif


#include "../../include/materials/TextureShiftRenderChunk/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord1 : TEXCOORD1,
#if RD_FEATURE_INSTANCING == RD_OFF
  float2 vertexTexCoord2 : TEXCOORD2,
#elif RD_FEATURE_INSTANCING == RD_ON
  float4 vertexTexCoord2 : TEXCOORD2,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
#endif
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingColor0 : COLOR0,
  out float2 varyingTexCoord2 : TEXCOORD2,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out float4 varyingColor2 : COLOR2,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord5 : TEXCOORD5,
  out float3 varyingTexCoord3 : TEXCOORD3,
  out float4 varyingColor3 : COLOR3)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
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
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector2.xyzw;
  workingVector0.x = dot(workingVector0.xyzw, workingVector2.xyzw);
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector1.xyz = vertexPosition0.xyz;
  workingVector1.w = 1;
  workingVector2.y = dot(workingVector1.xyzw, vertexTexCoord6.xyzw);
  workingVector3.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector2.yyyy;
  workingVector2.x = dot(workingVector1.xyzw, vertexTexCoord7.xyzw);
  workingVector2.z = dot(workingVector1.xyzw, vertexTexCoord5.xyzw);
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector2.xxxx + workingVector3.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector2.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector0.x = dot(workingVector0.xyzw, workingVector1.xyzw);
#endif
  workingVector3.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector3.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector3.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector3.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
#if RD_FEATURE_INSTANCING == RD_OFF
  workingVector0.y = dot(workingVector3.xyzw, workingVector2.xyzw);
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector0.y = dot(workingVector3.xyzw, workingVector1.xyzw);
#endif
  workingVector3.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector3.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector3.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector3.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
#if RD_FEATURE_INSTANCING == RD_OFF
  workingVector0.z = dot(workingVector3.xyzw, workingVector2.xyzw);
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector0.z = dot(workingVector3.xyzw, workingVector1.xyzw);
#endif
  workingVector3.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector3.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector3.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector3.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
#if RD_FEATURE_INSTANCING == RD_OFF
  workingVector0.w = dot(workingVector3.xyzw, workingVector2.xyzw);
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector0.w = dot(workingVector3.xyzw, workingVector1.xyzw);
#endif
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor1.xyzw = workingVector0.xyzw;
#if RD_FEATURE_INSTANCING == RD_OFF
  workingVector0.xyz = RD_UNIFORM_VIEW_POSITION_AND_TIME.xyz + -workingVector1.xyz;
  workingVector0.x = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.x = sqrt(workingVector0.x);
  workingVector0.y = RD_COMPARISON_MASK(0.5 < RD_UNIFORM_MESH_CONTEXT.x);
  workingVector2.xyzw = workingVector0.yyyy ? float4(0.99000001,1,100000,100000) : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.xyzw;
  workingVector0.xy = workingVector0.xx / workingVector2.wz;
  workingVector0.x = saturate(workingVector0.x);
  workingVector0.y = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector0.y;
  workingVector0.y = workingVector0.y + -workingVector2.x;
  workingVector0.z = workingVector2.y + -workingVector2.x;
  varyingColor2.w = saturate(workingVector0.y / workingVector0.z);
  workingVector0.y = 1 + -vertexColor0.w;
  workingVector0.x = workingVector0.x * workingVector0.y + vertexColor0.w;
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector0.x = 1 + -vertexColor0.w;
  workingVector0.yzw = RD_UNIFORM_VIEW_POSITION_AND_TIME.xyz + -workingVector2.xyz;
  workingVector0.y = dot(workingVector0.yzw, workingVector0.yzw);
  workingVector0.y = sqrt(workingVector0.y);
  workingVector0.z = RD_COMPARISON_MASK(0.5 < RD_UNIFORM_MESH_CONTEXT.x);
  workingVector1.xyzw = workingVector0.zzzz ? float4(0.99000001,1,100000,100000) : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.xyzw;
  workingVector0.yz = workingVector0.yy / workingVector1.wz;
  workingVector0.y = saturate(workingVector0.y);
  workingVector0.z = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector0.z;
  workingVector0.z = workingVector0.z + -workingVector1.x;
  workingVector0.w = workingVector1.y + -workingVector1.x;
  varyingColor2.w = saturate(workingVector0.z / workingVector0.w);
  workingVector0.x = workingVector0.y * workingVector0.x + vertexColor0.w;
#endif
  workingVector0.y = RD_COMPARISON_MASK(vertexColor0.w < 0.949999988);
  varyingColor0.w = workingVector0.y ? workingVector0.x : vertexColor0.w;
  varyingColor0.xyz = vertexColor0.xyz;
  workingVector0.xy = float2(65535,65535) * vertexTexCoord1.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.yz = (uint2)workingVector0.xy;
  workingVector0.x = (uint)workingVector0.z >> 4;
  workingVector0.xw = (int2)workingVector0.xz & int2(15,15);
  workingVector0.yz = (int2)workingVector0.yz & int2(256,256);
  varyingTexCoord2.xy = workingVector0.yz ? float2(1,1) : float2(0,0);
  workingVector0.xy = (uint2)workingVector0.xw;
  varyingTexCoord1.xy = float2(0.0666666701,0.0666666701) * workingVector0.xy;
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
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
  varyingTexCoord5.xy = vertexTexCoord2.xy;
#if RD_FEATURE_INSTANCING == RD_OFF
  varyingTexCoord3.xyz = workingVector1.xyz;
  varyingColor3.xyz = workingVector1.xyz;
#elif RD_FEATURE_INSTANCING == RD_ON
  varyingTexCoord3.xyz = workingVector2.xyz;
  varyingColor3.xyz = workingVector2.xyz;
#endif
  varyingColor3.w = 0;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
{
#if RD_FEATURE_INSTANCING == RD_OFF
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue;
    float sumValue1 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue1;
    float sumValue2 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue2;
    float nonlinearValue = sqrt(((sumValue * sumValue) + (sumValue1 * sumValue1)) + (sumValue2 * sumValue2));
#elif RD_FEATURE_INSTANCING == RD_ON
    float multiplyAddValue11 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue12 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue13 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue3 = RD_UNIFORM_VIEW_POSITION_AND_TIME.x - multiplyAddValue11;
    float sumValue4 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y - multiplyAddValue12;
    float sumValue5 = RD_UNIFORM_VIEW_POSITION_AND_TIME.z - multiplyAddValue13;
    float nonlinearValue1 = sqrt(((sumValue3 * sumValue3) + (sumValue4 * sumValue4)) + (sumValue5 * sumValue5));
#endif
    bool conditionValue = RD_UNIFORM_MESH_CONTEXT.x > 0.5f;
    float comparisonValue = conditionValue ? 0.9900000095367431640625f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
#if RD_FEATURE_INSTANCING == RD_OFF
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue7 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue6, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue8 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue9 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue10 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
#elif RD_FEATURE_INSTANCING == RD_ON
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue16 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue17 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue18 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue17, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue19 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue20 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue21 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
#endif
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    float clampedValue;
    if (vertexColor0.w < 0.949999988079071044921875f)
    {
#if RD_FEATURE_INSTANCING == RD_OFF
        clampedValue = (clamp(nonlinearValue / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.w), 0.0f, 1.0f) * (1.0f - vertexColor0.w)) + vertexColor0.w;
#elif RD_FEATURE_INSTANCING == RD_ON
        clampedValue = (clamp(nonlinearValue1 / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.w), 0.0f, 1.0f) * (1.0f - vertexColor0.w)) + vertexColor0.w;
#endif
    }
    else
    {
        clampedValue = vertexColor0.w;
    }
    uint productValue2 = uint(round(vertexTexCoord1.y * 65535.0f));
#if RD_FEATURE_INSTANCING == RD_OFF
    clipSpacePosition.x = multiplyAddValue7;
    clipSpacePosition.y = multiplyAddValue8;
    clipSpacePosition.z = multiplyAddValue9;
    clipSpacePosition.w = multiplyAddValue10;
    varyingColor1.x = multiplyAddValue7;
    varyingColor1.y = multiplyAddValue8;
    varyingColor1.z = multiplyAddValue9;
    varyingColor1.w = multiplyAddValue10;
#elif RD_FEATURE_INSTANCING == RD_ON
    clipSpacePosition.x = multiplyAddValue18;
    clipSpacePosition.y = multiplyAddValue19;
    clipSpacePosition.z = multiplyAddValue20;
    clipSpacePosition.w = multiplyAddValue21;
    varyingColor1.x = multiplyAddValue18;
    varyingColor1.y = multiplyAddValue19;
    varyingColor1.z = multiplyAddValue20;
    varyingColor1.w = multiplyAddValue21;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = clampedValue;
    varyingTexCoord2.x = float((uint(round(vertexTexCoord1.x * 65535.0f)) & 256u) != 0u);
    varyingTexCoord2.y = float((productValue2 & 256u) != 0u);
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
#if RD_FEATURE_INSTANCING == RD_OFF
    varyingColor2.w = clamp((((nonlinearValue / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - comparisonValue) / ((conditionValue ? 1.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) - comparisonValue), 0.0f, 1.0f);
#elif RD_FEATURE_INSTANCING == RD_ON
    varyingColor2.w = clamp((((nonlinearValue1 / (conditionValue ? 100000.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x) - comparisonValue) / ((conditionValue ? 1.0f : RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) - comparisonValue), 0.0f, 1.0f);
#endif
    varyingTexCoord1.x = float((productValue2 >> 4u) & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord1.y = float(productValue2 & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord5.x = vertexTexCoord2.x;
    varyingTexCoord5.y = vertexTexCoord2.y;
#if RD_FEATURE_INSTANCING == RD_OFF
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    varyingColor3.x = multiplyAddValue;
    varyingColor3.y = multiplyAddValue1;
    varyingColor3.z = multiplyAddValue2;
#elif RD_FEATURE_INSTANCING == RD_ON
    varyingTexCoord3.x = multiplyAddValue11;
    varyingTexCoord3.y = multiplyAddValue12;
    varyingTexCoord3.z = multiplyAddValue13;
    varyingColor3.x = multiplyAddValue11;
    varyingColor3.y = multiplyAddValue12;
    varyingColor3.z = multiplyAddValue13;
#endif
    varyingColor3.w = 0.0f;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    vertexTexCoord2 = stage_input.vertexTexCoord2;
#if RD_FEATURE_INSTANCING == RD_ON
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
#endif
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingColor2 = varyingColor2;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    stage_output.varyingColor3 = varyingColor3;
    return stage_output;
}
#endif
