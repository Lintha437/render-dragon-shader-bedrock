// WaterPrepass / DepthAndNormal / vertex forward pipeline.
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
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/WaterPrepass/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
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
  out float2 varyingTexCoord2 : TEXCOORD2,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out float3 varyingTexCoord5 : TEXCOORD5,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
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
  out float2 varyingTexCoord2 : TEXCOORD2,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out float3 varyingTexCoord5 : TEXCOORD5,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
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
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.xyz = float3(65535,65535,65535) * vertexTexCoord1.xyy;
  workingVector0.xyz = round(workingVector0.xyz);
  workingVector0.xyz = (uint3)workingVector0.xyz;
  workingVector1.z = (uint)workingVector0.z >> 4;
  workingVector1.w = workingVector0.z;
  workingVector0.zw = (int2)workingVector1.zw & int2(15,15);
  workingVector0.zw = (uint2)workingVector0.zw;
  varyingTexCoord1.xy = float2(0.0666666701,0.0666666701) * workingVector0.zw;
  workingVector1.xy = (uint2)workingVector0.xy >> 8;
  workingVector0.x = (int)workingVector0.x & 255;
  workingVector0.y = (uint)workingVector0.x;
  workingVector1.xyzw = (int4)workingVector1.xyxy & int4(1,1,254,254);
  varyingTexCoord2.xy = workingVector1.xy ? float2(1,1) : float2(0,0);
  workingVector0.xz = (uint2)workingVector1.zw;
  workingVector0.xyz = float3(0.00392156886,0.00392156886,0.00392156886) * workingVector0.xyz;
  workingVector0.w = vertexNormal0.w * 0.5 + 0.5;
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  varyingTexCoord5.xyz = float3(6,6,6) * workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  varyingNormal0.xyz = workingVector0.xyz * workingVector0.www;
  varyingTangent0.xyz = float3(0,0,0);
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
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
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.xyz = float3(65535,65535,65535) * vertexTexCoord1.xyy;
  workingVector0.xyz = round(workingVector0.xyz);
  workingVector0.xyz = (uint3)workingVector0.xyz;
  workingVector1.z = (uint)workingVector0.z >> 4;
  workingVector1.w = workingVector0.z;
  workingVector0.zw = (int2)workingVector1.zw & int2(15,15);
  workingVector0.zw = (uint2)workingVector0.zw;
  varyingTexCoord1.xy = float2(0.0666666701,0.0666666701) * workingVector0.zw;
  workingVector1.xy = (uint2)workingVector0.xy >> 8;
  workingVector0.x = (int)workingVector0.x & 255;
  workingVector0.y = (uint)workingVector0.x;
  workingVector1.xyzw = (int4)workingVector1.xyxy & int4(1,1,254,254);
  varyingTexCoord2.xy = workingVector1.xy ? float2(1,1) : float2(0,0);
  workingVector0.xz = (uint2)workingVector1.zw;
  workingVector0.xyz = float3(0.00392156886,0.00392156886,0.00392156886) * workingVector0.xyz;
  workingVector0.w = vertexNormal0.w * 0.5 + 0.5;
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  varyingTexCoord5.xyz = float3(6,6,6) * workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  varyingNormal0.xyz = workingVector0.xyz * workingVector0.www;
  varyingTangent0.xyz = float3(0,0,0);
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
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
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.xy = float2(65535,65535) * vertexTexCoord1.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector1.w = workingVector0.y;
  workingVector1.xyz = (uint3)workingVector0.xyy >> int3(8,8,4);
  workingVector0.zw = (int2)workingVector1.zw & int2(15,15);
  workingVector1.xy = (int2)workingVector1.xy & int2(254,254);
  workingVector1.xz = (uint2)workingVector1.xy;
  workingVector0.zw = (uint2)workingVector0.zw;
  varyingTexCoord1.xy = float2(0.0666666701,0.0666666701) * workingVector0.zw;
  if (1 == 0) workingVector0.y = 0; else if (1+8 < 32) {   workingVector0.y = (uint)workingVector0.x << (32-(1 + 8)); workingVector0.y = (uint)workingVector0.y >> (32-1);  } else workingVector0.y = (uint)workingVector0.x >> 8;
  if (1 == 0) workingVector0.z = 0; else if (1+8 < 32) {   workingVector0.z = (uint)workingVector0.y << (32-(1 + 8)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.y >> 8;
  workingVector0.x = (int)workingVector0.x & 255;
  workingVector1.y = (uint)workingVector0.x;
  workingVector1.xyz = float3(0.00392156886,0.00392156886,0.00392156886) * workingVector1.xyz;
  varyingTexCoord2.xy = workingVector0.yz ? float2(1,1) : float2(0,0);
  workingVector0.x = vertexNormal0.w * 0.5 + 0.5;
  workingVector0.xyz = workingVector1.xyz * workingVector0.xxx;
  varyingTexCoord5.xyz = float3(6,6,6) * workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  varyingNormal0.xyz = workingVector0.xyz * workingVector0.www;
  varyingTangent0.xyz = float3(0,0,0);
  varyingTexCoord0.xy = vertexTexCoord0.xy;
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
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.xy = float2(65535,65535) * vertexTexCoord1.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector1.w = workingVector0.y;
  workingVector1.xyz = (uint3)workingVector0.xyy >> int3(8,8,4);
  workingVector0.zw = (int2)workingVector1.zw & int2(15,15);
  workingVector1.xy = (int2)workingVector1.xy & int2(254,254);
  workingVector1.xz = (uint2)workingVector1.xy;
  workingVector0.zw = (uint2)workingVector0.zw;
  varyingTexCoord1.xy = float2(0.0666666701,0.0666666701) * workingVector0.zw;
  if (1 == 0) workingVector0.y = 0; else if (1+8 < 32) {   workingVector0.y = (uint)workingVector0.x << (32-(1 + 8)); workingVector0.y = (uint)workingVector0.y >> (32-1);  } else workingVector0.y = (uint)workingVector0.x >> 8;
  if (1 == 0) workingVector0.z = 0; else if (1+8 < 32) {   workingVector0.z = (uint)workingVector0.y << (32-(1 + 8)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.y >> 8;
  workingVector0.x = (int)workingVector0.x & 255;
  workingVector1.y = (uint)workingVector0.x;
  workingVector1.xyz = float3(0.00392156886,0.00392156886,0.00392156886) * workingVector1.xyz;
  varyingTexCoord2.xy = workingVector0.yz ? float2(1,1) : float2(0,0);
  workingVector0.x = vertexNormal0.w * 0.5 + 0.5;
  workingVector0.xyz = workingVector1.xyz * workingVector0.xxx;
  varyingTexCoord5.xyz = float3(6,6,6) * workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  varyingNormal0.xyz = workingVector0.xyz * workingVector0.www;
  varyingTangent0.xyz = float3(0,0,0);
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5), float3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5)));
    uint productValue = uint(round(vertexTexCoord1.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord1.y * 65535.0f));
    uint bitwiseValue = productValue >> 8u;
    uint bitwiseValue1 = productValue1 >> 8u;
    float productValue2 = (vertexNormal0.w * 0.01176470704376697540283203125f) + 0.01176470704376697540283203125f;
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingBitangent0.x = 0.0f;
    varyingBitangent0.y = 0.0f;
    varyingBitangent0.z = 0.0f;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue2;
    varyingTexCoord5.y = float(productValue & 255u) * productValue2;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue2;
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125f;
    varyingNormal0.x = inverseLengthValue * multiplyAddValue3;
    varyingNormal0.y = inverseLengthValue * multiplyAddValue4;
    varyingNormal0.z = inverseLengthValue * multiplyAddValue5;
    varyingTangent0.x = 0.0f;
    varyingTangent0.y = 0.0f;
    varyingTangent0.z = 0.0f;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
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
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue6 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue7 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue8 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5), float3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5)));
    uint productValue = uint(round(vertexTexCoord1.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord1.y * 65535.0f));
    uint bitwiseValue = productValue >> 8u;
    uint bitwiseValue1 = productValue1 >> 8u;
    float productValue2 = (vertexNormal0.w * 0.01176470704376697540283203125f) + 0.01176470704376697540283203125f;
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue8, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue8, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue8, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue8, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingBitangent0.x = 0.0f;
    varyingBitangent0.y = 0.0f;
    varyingBitangent0.z = 0.0f;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue2;
    varyingTexCoord5.y = float(productValue & 255u) * productValue2;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue2;
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125f;
    varyingNormal0.x = inverseLengthValue * multiplyAddValue3;
    varyingNormal0.y = inverseLengthValue * multiplyAddValue4;
    varyingNormal0.z = inverseLengthValue * multiplyAddValue5;
    varyingTangent0.x = 0.0f;
    varyingTangent0.y = 0.0f;
    varyingTangent0.z = 0.0f;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord3.x = multiplyAddValue6;
    varyingTexCoord3.y = multiplyAddValue7;
    varyingTexCoord3.z = multiplyAddValue8;
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
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
