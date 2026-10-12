// UIText / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 9
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_ALPHA_TEST
#define RD_FEATURE_ALPHA_TEST RD_OFF
#endif
#ifndef RD_OPTION_FONT_TYPE
#define RD_OPTION_FONT_TYPE RD_FONT_TYPE_BITMAP
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/UIText/VertexBindings.hlsli"

#if (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingTexCoord1 : TEXCOORD1,
  out float2 varyingTexCoord0 : TEXCOORD0)
{
#if RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP
  float4 workingVector0;
#elif RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF
  float4 workingVector0,workingVector1;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * vertexPosition0.yyyy;
  workingVector0.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * vertexPosition0.xxxx + workingVector0.xyzw;
  clipSpacePosition.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.x = 0.0625 + vertexTexCoord0.x;
#if RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP
  varyingTexCoord1.z = -RD_UNIFORM_HALF_TEXEL_OFFSET.x + workingVector0.x;
  workingVector0.x = RD_UNIFORM_GLYPH_HEIGHT.x + vertexTexCoord0.y;
  varyingTexCoord1.w = -RD_UNIFORM_HALF_TEXEL_OFFSET.x + workingVector0.x;
  varyingTexCoord1.xy = RD_UNIFORM_HALF_TEXEL_OFFSET.xx + vertexTexCoord0.xy;
#elif RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF
  workingVector0.z = -RD_UNIFORM_HALF_TEXEL_OFFSET.x + workingVector0.x;
  workingVector1.x = RD_UNIFORM_GLYPH_HEIGHT.x + vertexTexCoord0.y;
  workingVector0.w = -RD_UNIFORM_HALF_TEXEL_OFFSET.x + workingVector1.x;
  workingVector1.x = RD_COMPARISON_MASK(0.000950000016 < RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x);
  workingVector0.xy = RD_UNIFORM_HALF_TEXEL_OFFSET.xx + vertexTexCoord0.xy;
  varyingTexCoord1.xyzw = workingVector1.xxxx ? workingVector0.xyzw : float4(0,0,1,1);
#endif
  workingVector0.x = (int)vertexPosition0.z;
  workingVector0.xyz = RD_COMPARISON_MASK((int3)workingVector0.xxx == int3(1,2,0));
  workingVector0.xy = (int2)workingVector0.yx | (int2)workingVector0.xz;
  workingVector0.x = workingVector0.x ? 0.062500 : 0;
  workingVector0.y = workingVector0.y ? RD_UNIFORM_GLYPH_HEIGHT.x : 0;
  varyingTexCoord0.xy = vertexTexCoord0.xy + workingVector0.xy;
  return;
}
#elif RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingTexCoord1 : TEXCOORD1,
  out float2 varyingTexCoord0 : TEXCOORD0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * vertexPosition0.yyyy;
  workingVector0.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * vertexPosition0.xxxx + workingVector0.xyzw;
  clipSpacePosition.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingTexCoord1.xyzw = float4(0,0,1,1);
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
#elif RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP
    uint scalarValue = uint(int(vertexPosition0.z));
    clipSpacePosition.x = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.x * vertexPosition0.x) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.y * vertexPosition0.x) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.z * vertexPosition0.x) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.w, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.w * vertexPosition0.x) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord1.x = RD_UNIFORM_HALF_TEXEL_OFFSET.x + vertexTexCoord0.x;
    varyingTexCoord1.y = RD_UNIFORM_HALF_TEXEL_OFFSET.x + vertexTexCoord0.y;
    varyingTexCoord1.z = (vertexTexCoord0.x + 0.0625f) - RD_UNIFORM_HALF_TEXEL_OFFSET.x;
    varyingTexCoord1.w = (RD_UNIFORM_GLYPH_HEIGHT.x + vertexTexCoord0.y) - RD_UNIFORM_HALF_TEXEL_OFFSET.x;
    varyingTexCoord0.x = (((scalarValue + 4294967295u) < 2u) ? 0.0625f : 0.0f) + vertexTexCoord0.x;
    varyingTexCoord0.y = ((scalarValue < 2u) ? RD_UNIFORM_GLYPH_HEIGHT.x : 0.0f) + vertexTexCoord0.y;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM65)
    clipSpacePosition.x = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.x + mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.x * vertexPosition0.x);
    clipSpacePosition.y = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.y * vertexPosition0.x) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.z * vertexPosition0.x) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.w, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.w * vertexPosition0.x) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord1.z = 1.0f;
    varyingTexCoord1.w = 1.0f;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#elif RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF
    uint scalarValue = uint(int(vertexPosition0.z));
    float sumValue;
    float sumValue1;
    float sumValue2;
    float sumValue3;
    if (RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x > 0.00095000001601874828338623046875f)
    {
        sumValue = RD_UNIFORM_HALF_TEXEL_OFFSET.x + vertexTexCoord0.x;
        sumValue1 = RD_UNIFORM_HALF_TEXEL_OFFSET.x + vertexTexCoord0.y;
        sumValue2 = (vertexTexCoord0.x + 0.0625f) - RD_UNIFORM_HALF_TEXEL_OFFSET.x;
        sumValue3 = (RD_UNIFORM_GLYPH_HEIGHT.x + vertexTexCoord0.y) - RD_UNIFORM_HALF_TEXEL_OFFSET.x;
    }
    else
    {
        sumValue = 0.0f;
        sumValue1 = 0.0f;
        sumValue2 = 1.0f;
        sumValue3 = 1.0f;
    }
    clipSpacePosition.x = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.x * vertexPosition0.x) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.y * vertexPosition0.x) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.z * vertexPosition0.x) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.w, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.w * vertexPosition0.x) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord1.x = sumValue;
    varyingTexCoord1.y = sumValue1;
    varyingTexCoord1.z = sumValue2;
    varyingTexCoord1.w = sumValue3;
    varyingTexCoord0.x = (((scalarValue + 4294967295u) < 2u) ? 0.0625f : 0.0f) + vertexTexCoord0.x;
    varyingTexCoord0.y = ((scalarValue < 2u) ? RD_UNIFORM_GLYPH_HEIGHT.x : 0.0f) + vertexTexCoord0.y;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#endif
}
#endif
