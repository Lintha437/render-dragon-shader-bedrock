// GamefaceStencil / Transparent / fragment forward pipeline.
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


#include "../../include/materials/GamefaceStencil/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord1 : TEXCOORD1,
  float4 varyingTexCoord0 : TEXCOORD0,
  float4 varyingTexCoord4 : TEXCOORD4,
  float4 varyingTexCoord2 : TEXCOORD2,
  nointerpolation float4 varyingTexCoord3 : TEXCOORD3,
  float4 varyingTexCoord5 : TEXCOORD5,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0,workingVector1,workingVector2;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = (uint3)varyingTexCoord3.yzw;
  if (workingVector0.z == 0) {
    workingVector0.w = varyingTexCoord1.z * varyingTexCoord1.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector1.x = min(1, workingVector0.w);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector0.w = min(1, workingVector0.w);
#endif
  } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 3);
    if (workingVector0.w != 0) {
      workingVector2.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
      workingVector1.xyzw = materialTexture0.Sample(textureSampler0, workingVector2.xy).wxyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector1.x = RD_COMPARISON_MASK((int)workingVector0.z == 3);
    if (workingVector1.x != 0) {
      workingVector1.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
      workingVector0.w = materialTexture0.Sample(textureSampler0, workingVector1.xy).w;
#endif
    } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
      workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 17);
      if (workingVector0.w != 0) {
        workingVector1.x = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
      workingVector1.x = RD_COMPARISON_MASK((int)workingVector0.z == 17);
      if (workingVector1.x != 0) {
        workingVector0.w = 1;
#endif
      } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
        workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 18);
        if (workingVector0.w != 0) {
          workingVector1.x = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        workingVector1.x = RD_COMPARISON_MASK((int)workingVector0.z == 18);
        if (workingVector1.x != 0) {
          workingVector0.w = 1;
#endif
        } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 34);
          if (workingVector0.w != 0) {
            workingVector0.y = (uint)workingVector0.y << 4;
            workingVector0.x = (uint)workingVector0.x >> 4;
            workingVector0.x = (int)workingVector0.x & 15;
            workingVector0.x = (int)workingVector0.x + (int)workingVector0.y;
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector1.x = RD_COMPARISON_MASK((int)workingVector0.z == 34);
          if (workingVector1.x != 0) {
            if (4 == 0) workingVector0.x = 0; else if (4+4 < 32) {             workingVector0.x = (uint)workingVector0.x << (32-(4 + 4)); workingVector0.x = (uint)workingVector0.x >> (32-4);            } else workingVector0.x = (uint)workingVector0.x >> 4;
            bitMask.x = ((~(-1 << 28)) << 4) & 0xffffffff;  workingVector0.x = (((uint)workingVector0.y << 4) & bitMask.x) | ((uint)workingVector0.x & ~bitMask.x);
#endif
            workingVector0.x = (int)workingVector0.x + 1;
#if RD_PLATFORM == RD_PLATFORM_SM40
            workingVector0.yw = frac(varyingTexCoord1.xy);
            workingVector0.xy = fragmentVectorConstants1[workingVector0.x+0].zw * workingVector0.yw + fragmentVectorConstants1[workingVector0.x+0].xy;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            workingVector1.xy = frac(varyingTexCoord1.xy);
            workingVector0.xy = fragmentVectorConstants1[workingVector0.x+0].zw * workingVector1.xy + fragmentVectorConstants1[workingVector0.x+0].xy;
#endif
            workingVector0.xy = workingVector0.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
            workingVector1.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).wxyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            workingVector0.w = materialTexture0.Sample(textureSampler0, workingVector0.xy).w;
#endif
          } else {
            workingVector0.x = RD_COMPARISON_MASK((int)workingVector0.z == 36);
            if (workingVector0.x != 0) {
              workingVector0.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
              workingVector1.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
              workingVector0.w = materialTexture0.Sample(textureSampler0, workingVector0.xy).x;
#endif
            } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
              workingVector1.x = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
              workingVector0.w = 1;
#endif
            }
          }
        }
      }
    }
  }
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.x = RD_COMPARISON_MASK(workingVector1.x < 0.00392156886);
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.w < 0.00392156886);
#endif
  if (workingVector0.x != 0) discard;
  fragmentColor0.xyzw = float4(0,0,0,0);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    uint scalarValue = uint(varyingTexCoord3.w);
    uint bitwiseValue = ((uint(varyingTexCoord3.z) << 4u) | ((uint(varyingTexCoord3.y) >> 4u) & 15u)) + 1u;
    float intermediateValue1;
    if (scalarValue == 0u)
    {
        intermediateValue1 = min(1.0f, varyingTexCoord1.w * varyingTexCoord1.z);
    }
    else
    {
        float branchMergedValue;
        if (scalarValue == 3u)
        {
            branchMergedValue = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y)).w;
        }
        else
        {
            float branchMergedValue1;
            if ((scalarValue + 4294967279u) < 2u)
            {
                branchMergedValue1 = 1.0f;
            }
            else
            {
                float branchMergedValue2;
                if (scalarValue == 34u)
                {
                    branchMergedValue2 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * ((frac(varyingTexCoord1.x) * fragmentConstants[bitwiseValue].z) + fragmentConstants[bitwiseValue].x)) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (((frac(varyingTexCoord1.y) * fragmentConstants[bitwiseValue].w) + fragmentConstants[bitwiseValue].y) * RD_UNIFORM_UV_TRANSFORM_ROW_0.w) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y)).w;
                }
                else
                {
                    float branchMergedValue3;
                    if (scalarValue == 36u)
                    {
                        branchMergedValue3 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y)).x;
                    }
                    else
                    {
                        branchMergedValue3 = 1.0f;
                    }
                    branchMergedValue2 = branchMergedValue3;
                }
                branchMergedValue1 = branchMergedValue2;
            }
            branchMergedValue = branchMergedValue1;
        }
        intermediateValue1 = branchMergedValue;
    }
    if (intermediateValue1 < 0.0039215688593685626983642578125f)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = 0.0f;
    fragmentColor0.y = 0.0f;
    fragmentColor0.z = 0.0f;
    fragmentColor0.w = 0.0f;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
