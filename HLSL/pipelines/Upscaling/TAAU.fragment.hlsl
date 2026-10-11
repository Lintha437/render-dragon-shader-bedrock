// Upscaling / TAAU / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/Upscaling/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = RD_UNIFORM_DISPLAY_RESOLUTION.xy * varyingTexCoord0.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.xy = float2(0.5,0.5) + workingVector0.xy;
  workingVector0.zw = workingVector0.xy * RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON.xx + -RD_UNIFORM_SUB_PIXEL_JITTER_AND_VALID_HISTORY.xy;
  workingVector0.zw = float2(-0.5,-0.5) + workingVector0.zw;
  workingVector1.xy = round(workingVector0.zw);
  workingVector2.xy = (int2)workingVector1.xy;
  workingVector2.zw = float2(0,0);
  workingVector3.xyz = materialTexture1.Load(workingVector2.xyw).xyz;
  workingVector1.zw = materialTexture0.Load(workingVector2.xyz).zw;
  workingVector4.xyz = workingVector3.xyz * workingVector3.xyz;
  workingVector2.zw = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_TAA_UPSCALING_PARAMETERS.wz);
  workingVector5.zw = float2(0,0);
  workingVector6.xyz = workingVector3.xyz;
  workingVector7.xyz = workingVector4.xyz;
  workingVector8.x = workingVector1.z;
  workingVector8.y = -workingVector1.w;
  workingVector9.y = -1;
  while (true) {
    workingVector3.w = RD_COMPARISON_MASK(1 < (int)workingVector9.y);
    if (workingVector3.w != 0) break;
    workingVector3.w = RD_COMPARISON_MASK((int)workingVector9.y == 0);
    workingVector10.xyz = workingVector6.xyz;
    workingVector11.xyz = workingVector7.xyz;
    workingVector8.zw = workingVector8.xy;
    workingVector9.x = -1;
    while (true) {
      workingVector4.w = RD_COMPARISON_MASK(1 < (int)workingVector9.x);
      if (workingVector4.w != 0) break;
      workingVector4.w = RD_COMPARISON_MASK((int)workingVector9.x == 0);
      workingVector4.w = workingVector3.w ? workingVector4.w : 0;
      if (workingVector4.w != 0) {
        workingVector9.x = 1;
        continue;
      }
      workingVector5.xy = (int2)workingVector2.xy + (int2)workingVector9.yx;
      workingVector12.xyz = materialTexture1.Load(workingVector5.xyw).xyz;
      workingVector5.xy = materialTexture0.Load(workingVector5.xyz).zw;
      workingVector10.xyz = workingVector12.xyz + workingVector10.xyz;
      workingVector11.xyz = workingVector12.xyz * workingVector12.xyz + workingVector11.xyz;
      workingVector4.w = dot(workingVector5.xy, workingVector5.xy);
      workingVector6.w = dot(workingVector8.zw, workingVector8.zw);
      workingVector4.w = RD_COMPARISON_MASK(workingVector6.w < workingVector4.w);
      workingVector5.xy = workingVector4.ww ? workingVector5.xy : workingVector8.zw;
      workingVector8.zw = workingVector2.zz ? workingVector5.xy : workingVector8.zw;
      workingVector9.x = (int)workingVector9.x + 1;
    }
    workingVector6.xyz = workingVector10.xyz;
    workingVector7.xyz = workingVector11.xyz;
    workingVector8.xy = workingVector8.zw;
    workingVector9.y = (int)workingVector9.y + 1;
  }
  workingVector1.zw = RD_UNIFORM_RENDER_RESOLUTION.xy * workingVector8.xy;
  workingVector2.xyz = float3(0.111111112,0.111111112,0.111111112) * workingVector6.xyz;
  workingVector2.xyz = workingVector2.xyz * workingVector2.xyz;
  workingVector2.xyz = workingVector7.xyz * float3(0.111111112,0.111111112,0.111111112) + -workingVector2.xyz;
  workingVector2.xyz = max(float3(0,0,0), workingVector2.xyz);
  workingVector2.xyz = sqrt(workingVector2.xyz);
  workingVector3.w = dot(workingVector1.zw, workingVector1.zw);
  workingVector3.w = sqrt(workingVector3.w);
  workingVector3.w = min(1, workingVector3.w);
  workingVector4.x = workingVector3.w * -2 + 3;
  workingVector3.w = workingVector3.w * workingVector3.w;
  workingVector3.w = workingVector4.x * workingVector3.w;
  workingVector4.x = RD_UNIFORM_TAA_UPSCALING_PARAMETERS.x + -RD_UNIFORM_TAA_UPSCALING_PARAMETERS.y;
  workingVector4.x = workingVector3.w * workingVector4.x + RD_UNIFORM_TAA_UPSCALING_PARAMETERS.y;
  workingVector2.xyz = workingVector4.xxx * workingVector2.xyz;
  workingVector4.xyz = workingVector6.xyz * float3(0.111111112,0.111111112,0.111111112) + -workingVector2.xyz;
  workingVector2.xyz = workingVector6.xyz * float3(0.111111112,0.111111112,0.111111112) + workingVector2.xyz;
  workingVector0.xy = -workingVector1.zw * RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON.yy + workingVector0.xy;
  workingVector1.zw = float2(-1,-1) + RD_UNIFORM_DISPLAY_RESOLUTION.xy;
  workingVector0.xy = max(float2(0,0), workingVector0.xy);
  workingVector0.xy = min(workingVector0.xy, workingVector1.zw);
  workingVector1.zw = float2(-0.5,-0.5) + workingVector0.xy;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector5.xyzw = float4(0.5,0.5,-0.5,-0.5) + workingVector1.zwzw;
  workingVector0.xy = saturate(-workingVector5.xy + workingVector0.xy);
  workingVector6.xy = workingVector0.yx * workingVector0.yx;
  workingVector6.zw = workingVector6.xy * workingVector0.yx;
  workingVector7.xy = workingVector6.yx * workingVector0.xy + workingVector0.xy;
  workingVector7.xy = -workingVector7.xy * float2(0.5,0.5) + workingVector6.yx;
  workingVector7.zw = float2(2.5,2.5) * workingVector6.yx;
  workingVector6.zw = workingVector6.wz * float2(1.5,1.5) + -workingVector7.zw;
  workingVector6.zw = float2(1,1) + workingVector6.zw;
  workingVector0.xy = workingVector6.xy * workingVector0.yx + -workingVector6.xy;
  workingVector6.xy = float2(0.5,0.5) * workingVector0.xy;
  workingVector7.zw = float2(1,1) + -workingVector7.xy;
  workingVector7.zw = workingVector7.zw + -workingVector6.zw;
  workingVector0.xy = -workingVector0.yx * float2(0.5,0.5) + workingVector7.zw;
  workingVector6.zw = workingVector6.zw + workingVector0.xy;
  workingVector8.xy = RD_UNIFORM_RECIP_DISPLAY_RESOLUTION.xy * workingVector5.zw;
  workingVector0.xy = workingVector0.xy / workingVector6.zw;
  workingVector0.xy = workingVector5.xy + workingVector0.xy;
  workingVector8.zw = RD_UNIFORM_RECIP_DISPLAY_RESOLUTION.yx * workingVector0.yx;
  workingVector0.xy = float2(2.5,2.5) + workingVector1.zw;
  workingVector5.xy = RD_UNIFORM_RECIP_DISPLAY_RESOLUTION.xy * workingVector0.xy;
  workingVector9.xyz = materialTexture2.SampleLevel(textureSampler2, workingVector8.xy, 0).xyz;
  workingVector0.x = workingVector7.x * workingVector7.y;
  workingVector10.xyz = materialTexture2.SampleLevel(textureSampler2, workingVector8.xz, 0).xyz;
  workingVector1.zw = workingVector7.xy * workingVector6.wz;
  workingVector10.xyz = workingVector10.xyz * workingVector1.zzz;
  workingVector9.xyz = workingVector9.xyz * workingVector0.xxx + workingVector10.xyz;
  workingVector5.zw = workingVector8.xw;
  workingVector10.xyz = materialTexture2.SampleLevel(textureSampler2, workingVector5.zy, 0).xyz;
  workingVector0.xy = workingVector7.xy * workingVector6.xy;
  workingVector7.xyz = workingVector10.xyz * workingVector0.xxx + workingVector9.xyz;
  workingVector9.xyz = materialTexture2.SampleLevel(textureSampler2, workingVector8.wy, 0).xyz;
  workingVector7.xyz = workingVector9.xyz * workingVector1.www + workingVector7.xyz;
  workingVector9.xyz = materialTexture2.SampleLevel(textureSampler2, workingVector8.wz, 0).xyz;
  workingVector0.x = workingVector6.z * workingVector6.w;
  workingVector7.xyz = workingVector9.xyz * workingVector0.xxx + workingVector7.xyz;
  workingVector9.xyz = materialTexture2.SampleLevel(textureSampler2, workingVector5.wy, 0).xyz;
  workingVector1.zw = workingVector6.zw * workingVector6.xy;
  workingVector7.xyz = workingVector9.xyz * workingVector1.zzz + workingVector7.xyz;
  workingVector8.x = workingVector5.x;
  workingVector9.xyz = materialTexture2.SampleLevel(textureSampler2, workingVector8.xy, 0).xyz;
  workingVector7.xyz = workingVector9.xyz * workingVector0.yyy + workingVector7.xyz;
  workingVector8.xyz = materialTexture2.SampleLevel(textureSampler2, workingVector8.xz, 0).xyz;
  workingVector7.xyz = workingVector8.xyz * workingVector1.www + workingVector7.xyz;
  workingVector5.xyz = materialTexture2.SampleLevel(textureSampler2, workingVector5.xy, 0).xyz;
  workingVector0.x = workingVector6.y * workingVector6.x;
  workingVector5.xyz = workingVector5.xyz * workingVector0.xxx + workingVector7.xyz;
  workingVector5.xyz = max(float3(0,0,0), workingVector5.xyz);
  if (workingVector2.w != 0) {
    workingVector6.xyz = RD_COMPARISON_MASK(workingVector2.xyz < workingVector5.xyz);
    workingVector0.x = (int)workingVector6.y | (int)workingVector6.x;
    workingVector0.x = (int)workingVector6.z | (int)workingVector0.x;
    workingVector6.xyz = RD_COMPARISON_MASK(workingVector5.xyz < workingVector4.xyz);
    workingVector0.y = (int)workingVector6.y | (int)workingVector6.x;
    workingVector0.y = (int)workingVector6.z | (int)workingVector0.y;
    workingVector0.x = (int)workingVector0.y | (int)workingVector0.x;
    if (workingVector0.x != 0) {
      workingVector6.xyz = -workingVector5.xyz + workingVector3.xyz;
      workingVector0.x = dot(workingVector6.xyz, workingVector6.xyz);
      workingVector0.x = sqrt(workingVector0.x);
      workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.x);
      workingVector7.xyz = workingVector6.xyz / workingVector0.xxx;
      workingVector6.xyz = workingVector0.yyy ? workingVector7.xyz : workingVector6.xyz;
      workingVector7.xyz = max(workingVector5.xyz, workingVector4.xyz);
      workingVector7.xyz = min(workingVector7.xyz, workingVector2.xyz);
      workingVector8.xyz = float3(-65000,65000,0);
      workingVector0.x = 0;
      while (true) {
        workingVector0.y = RD_COMPARISON_MASK((int)workingVector8.z >= 3);
        if (workingVector0.y != 0) break;
        workingVector0.y = dot(workingVector6.xyz, icb[workingVector8.z+0].xyz);
        workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON.z < abs(workingVector0.y));
        if (workingVector1.z != 0) {
          workingVector1.z = dot(workingVector4.xyz, icb[workingVector8.z+0].xyz);
          workingVector1.w = dot(workingVector5.xyz, icb[workingVector8.z+0].xyz);
          workingVector1.z = workingVector1.z + -workingVector1.w;
          workingVector9.y = workingVector1.z / workingVector0.y;
          workingVector1.z = dot(workingVector2.xyz, icb[workingVector8.z+0].xyz);
          workingVector1.z = workingVector1.z + -workingVector1.w;
          workingVector9.x = workingVector1.z / workingVector0.y;
          workingVector0.y = RD_COMPARISON_MASK(workingVector9.x < workingVector9.y);
          workingVector1.zw = workingVector0.yy ? workingVector9.xy : workingVector9.yx;
          workingVector0.y = RD_COMPARISON_MASK(workingVector8.x < workingVector1.z);
          workingVector8.x = workingVector0.y ? workingVector1.z : workingVector8.x;
          workingVector0.y = RD_COMPARISON_MASK(workingVector1.w < workingVector8.y);
          workingVector8.y = workingVector0.y ? workingVector1.w : workingVector8.y;
          workingVector0.y = RD_COMPARISON_MASK(workingVector8.y < workingVector8.x);
          workingVector0.y = (int)workingVector0.x | (int)workingVector0.y;
          workingVector1.z = RD_COMPARISON_MASK(workingVector8.y < 0);
          workingVector0.x = (int)workingVector0.y | (int)workingVector1.z;
        } else {
          workingVector0.y = dot(workingVector5.xyz, icb[workingVector8.z+0].xyz);
          workingVector1.z = dot(workingVector4.xyz, icb[workingVector8.z+0].xyz);
          workingVector1.z = RD_COMPARISON_MASK(workingVector0.y < workingVector1.z);
          workingVector1.w = dot(workingVector2.xyz, icb[workingVector8.z+0].xyz);
          workingVector0.y = RD_COMPARISON_MASK(workingVector1.w < workingVector0.y);
          workingVector0.y = (int)workingVector0.y | (int)workingVector1.z;
          workingVector0.x = (int)workingVector0.x | (int)workingVector0.y;
        }
        workingVector8.z = (int)workingVector8.z + 1;
      }
      workingVector0.y = RD_COMPARISON_MASK(0 < workingVector8.x);
      workingVector8.xzw = workingVector6.xyz * workingVector8.xxx + workingVector5.xyz;
      workingVector6.xyz = workingVector6.xyz * workingVector8.yyy + workingVector5.xyz;
      workingVector6.xyz = workingVector0.yyy ? workingVector8.xzw : workingVector6.xyz;
      workingVector5.xyz = workingVector0.xxx ? workingVector7.xyz : workingVector6.xyz;
    }
  } else {
    workingVector4.xyz = max(workingVector5.xyz, workingVector4.xyz);
    workingVector5.xyz = min(workingVector4.xyz, workingVector2.xyz);
  }
  workingVector0.xy = -workingVector1.xy + workingVector0.zw;
  workingVector0.x = dot(workingVector0.xy, workingVector0.xy);
  workingVector0.x = -RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON.y * workingVector0.x + 1;
  workingVector0.x = max(0.0500000007, workingVector0.x);
  workingVector0.x = min(1, workingVector0.x);
  workingVector0.x = max(workingVector3.w, workingVector0.x);
  workingVector0.x = 0.100000001 * workingVector0.x;
  workingVector0.y = RD_COMPARISON_MASK(0 != RD_UNIFORM_SUB_PIXEL_JITTER_AND_VALID_HISTORY.z);
  workingVector0.x = workingVector0.y ? workingVector0.x : 1;
  workingVector0.yzw = -workingVector5.xyz + workingVector3.xyz;
  fragmentColor0.xyz = workingVector0.xxx * workingVector0.yzw + workingVector5.xyz;
  fragmentColor0.w = 0;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float productValue = float(uint(RD_UNIFORM_DISPLAY_RESOLUTION.x * varyingTexCoord0.x)) + 0.5f;
    float productValue1 = float(uint(RD_UNIFORM_DISPLAY_RESOLUTION.y * varyingTexCoord0.y)) + 0.5f;
    float productValue2 = ((productValue * RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON.x) - RD_UNIFORM_SUB_PIXEL_JITTER_AND_VALID_HISTORY.x) + (-0.5f);
    float productValue3 = ((productValue1 * RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON.x) - RD_UNIFORM_SUB_PIXEL_JITTER_AND_VALID_HISTORY.y) + (-0.5f);
    uint scalarValue = uint(int(round(productValue2)));
    uint scalarValue1 = uint(int(round(productValue3)));
    float4 loadedBufferValue = inputFinalColorTexture.Load(int3(uint2(scalarValue, scalarValue1), 0u));
    float scalarValue2 = loadedBufferValue.x;
    float scalarValue3 = loadedBufferValue.y;
    float scalarValue4 = loadedBufferValue.z;
    float4 loadedBufferValue1 = inputBufferMotionVectorsTexture.Load(int3(uint2(scalarValue, scalarValue1), 0u));
    float scalarValue5 = loadedBufferValue1.z;
    float sumValue = (-0.0f) - loadedBufferValue1.w;
    float productValue4 = scalarValue2 * scalarValue2;
    float productValue5 = scalarValue3 * scalarValue3;
    float productValue6 = scalarValue4 * scalarValue4;
    float intermediateValue11;
    float intermediateValue13;
    float intermediateValue15;
    float intermediateValue17;
    float intermediateValue19;
    float intermediateValue21;
    float intermediateValue23;
    float intermediateValue25;
    float intermediateValue27;
    float intermediateValue28;
    float intermediateValue29;
    float intermediateValue30;
    float intermediateValue31;
    float intermediateValue32;
    float intermediateValue33;
    float intermediateValue34;
    uint intermediateValue35;
    float scalarValue6 = scalarValue5;
    float scalarValue7 = sumValue;
    float scalarValue8 = scalarValue2;
    float scalarValue9 = scalarValue3;
    float scalarValue10 = scalarValue4;
    float scalarValue11 = productValue4;
    float scalarValue12 = productValue5;
    float scalarValue13 = productValue6;
    uint scalarValue14 = 4294967295u;
    for (;;)
    {
        intermediateValue27 = scalarValue6;
        intermediateValue28 = scalarValue7;
        intermediateValue29 = scalarValue8;
        intermediateValue30 = scalarValue9;
        intermediateValue31 = scalarValue10;
        intermediateValue32 = scalarValue11;
        intermediateValue33 = scalarValue12;
        intermediateValue34 = scalarValue13;
        intermediateValue35 = 4294967295u;
        bool comparisonValue;
        for (;;)
        {
            comparisonValue = (intermediateValue35 | scalarValue14) == 0u;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            float branchMergedValue3;
            float branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            if (comparisonValue)
            {
                branchMergedValue = intermediateValue31;
                branchMergedValue1 = intermediateValue32;
                branchMergedValue2 = intermediateValue33;
                branchMergedValue3 = intermediateValue34;
                branchMergedValue4 = intermediateValue27;
                branchMergedValue5 = intermediateValue28;
                branchMergedValue6 = intermediateValue29;
                branchMergedValue7 = intermediateValue30;
            }
            else
            {
                uint sumValue1 = scalarValue14 + scalarValue;
                uint sumValue2 = intermediateValue35 + scalarValue1;
                float4 loadedBufferValue2 = inputFinalColorTexture.Load(int3(uint2(sumValue1, sumValue2), 0u));
                float scalarValue15 = loadedBufferValue2.x;
                float scalarValue16 = loadedBufferValue2.y;
                float scalarValue17 = loadedBufferValue2.z;
                float4 loadedBufferValue3 = inputBufferMotionVectorsTexture.Load(int3(uint2(sumValue1, sumValue2), 0u));
                float scalarValue18 = loadedBufferValue3.z;
                float sumValue3 = scalarValue15 + intermediateValue29;
                float sumValue4 = scalarValue16 + intermediateValue30;
                float sumValue5 = scalarValue17 + intermediateValue31;
                float productValue7 = (scalarValue15 * scalarValue15) + intermediateValue32;
                float productValue8 = (scalarValue16 * scalarValue16) + intermediateValue33;
                float productValue9 = (scalarValue17 * scalarValue17) + intermediateValue34;
                float branchMergedValue14;
                float branchMergedValue15;
                float branchMergedValue16;
                float branchMergedValue17;
                float branchMergedValue18;
                float branchMergedValue19;
                float branchMergedValue20;
                float branchMergedValue21;
                if (RD_UNIFORM_TAA_UPSCALING_PARAMETERS.w != 0.0f)
                {
                    float branchMergedValue25;
                    float branchMergedValue26;
                    float branchMergedValue27;
                    float branchMergedValue28;
                    float branchMergedValue29;
                    float branchMergedValue30;
                    float branchMergedValue31;
                    float branchMergedValue32;
                    if (dot(float2(scalarValue18, loadedBufferValue3.w), float2(scalarValue18, loadedBufferValue3.w)) > dot(float2(intermediateValue27, intermediateValue28), float2(intermediateValue27, intermediateValue28)))
                    {
                        branchMergedValue25 = sumValue5;
                        branchMergedValue26 = productValue7;
                        branchMergedValue27 = productValue8;
                        branchMergedValue28 = productValue9;
                        branchMergedValue29 = scalarValue18;
                        branchMergedValue30 = loadedBufferValue3.w;
                        branchMergedValue31 = sumValue3;
                        branchMergedValue32 = sumValue4;
                    }
                    else
                    {
                        branchMergedValue25 = sumValue5;
                        branchMergedValue26 = productValue7;
                        branchMergedValue27 = productValue8;
                        branchMergedValue28 = productValue9;
                        branchMergedValue29 = intermediateValue27;
                        branchMergedValue30 = intermediateValue28;
                        branchMergedValue31 = sumValue3;
                        branchMergedValue32 = sumValue4;
                    }
                    branchMergedValue14 = branchMergedValue25;
                    branchMergedValue15 = branchMergedValue26;
                    branchMergedValue16 = branchMergedValue27;
                    branchMergedValue17 = branchMergedValue28;
                    branchMergedValue18 = branchMergedValue29;
                    branchMergedValue19 = branchMergedValue30;
                    branchMergedValue20 = branchMergedValue31;
                    branchMergedValue21 = branchMergedValue32;
                }
                else
                {
                    branchMergedValue14 = sumValue5;
                    branchMergedValue15 = productValue7;
                    branchMergedValue16 = productValue8;
                    branchMergedValue17 = productValue9;
                    branchMergedValue18 = intermediateValue27;
                    branchMergedValue19 = intermediateValue28;
                    branchMergedValue20 = sumValue3;
                    branchMergedValue21 = sumValue4;
                }
                branchMergedValue = branchMergedValue14;
                branchMergedValue1 = branchMergedValue15;
                branchMergedValue2 = branchMergedValue16;
                branchMergedValue3 = branchMergedValue17;
                branchMergedValue4 = branchMergedValue18;
                branchMergedValue5 = branchMergedValue19;
                branchMergedValue6 = branchMergedValue20;
                branchMergedValue7 = branchMergedValue21;
            }
            intermediateValue19 = branchMergedValue;
            intermediateValue21 = branchMergedValue1;
            intermediateValue23 = branchMergedValue2;
            intermediateValue25 = branchMergedValue3;
            intermediateValue11 = branchMergedValue4;
            intermediateValue13 = branchMergedValue5;
            intermediateValue15 = branchMergedValue6;
            intermediateValue17 = branchMergedValue7;
            uint sumValue6 = intermediateValue35 + 1u;
            if (sumValue6 == 2u)
            {
                break;
            }
            else
            {
                intermediateValue27 = intermediateValue11;
                intermediateValue28 = intermediateValue13;
                intermediateValue29 = intermediateValue15;
                intermediateValue30 = intermediateValue17;
                intermediateValue31 = intermediateValue19;
                intermediateValue32 = intermediateValue21;
                intermediateValue33 = intermediateValue23;
                intermediateValue34 = intermediateValue25;
                intermediateValue35 = sumValue6;
                continue;
            }
        }
        uint sumValue7 = scalarValue14 + 1u;
        if (sumValue7 == 2u)
        {
            break;
        }
        else
        {
            scalarValue6 = intermediateValue11;
            scalarValue7 = intermediateValue13;
            scalarValue8 = intermediateValue15;
            scalarValue9 = intermediateValue17;
            scalarValue10 = intermediateValue19;
            scalarValue11 = intermediateValue21;
            scalarValue12 = intermediateValue23;
            scalarValue13 = intermediateValue25;
            scalarValue14 = sumValue7;
            continue;
        }
    }
    float productValue10 = RD_UNIFORM_RENDER_RESOLUTION.x * intermediateValue11;
    float productValue11 = RD_UNIFORM_RENDER_RESOLUTION.y * intermediateValue13;
    float productValue12 = intermediateValue15 * 0.111111111938953399658203125f;
    float productValue13 = intermediateValue17 * 0.111111111938953399658203125f;
    float productValue14 = intermediateValue19 * 0.111111111938953399658203125f;
    float clampedValue = clamp(sqrt(dot(float2(productValue10, productValue11), float2(productValue10, productValue11))), 0.0f, 1.0f);
    float productValue15 = (clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f));
    float productValue16 = ((RD_UNIFORM_TAA_UPSCALING_PARAMETERS.x - RD_UNIFORM_TAA_UPSCALING_PARAMETERS.y) * productValue15) + RD_UNIFORM_TAA_UPSCALING_PARAMETERS.y;
    float nonlinearValue = productValue16 * sqrt(max(0.0f, (intermediateValue21 * 0.111111111938953399658203125f) - (productValue12 * productValue12)));
    float nonlinearValue1 = productValue16 * sqrt(max(0.0f, (intermediateValue23 * 0.111111111938953399658203125f) - (productValue13 * productValue13)));
    float nonlinearValue2 = productValue16 * sqrt(max(0.0f, (intermediateValue25 * 0.111111111938953399658203125f) - (productValue14 * productValue14)));
    float sumValue8 = productValue12 - nonlinearValue;
    float sumValue9 = productValue13 - nonlinearValue1;
    float sumValue10 = productValue14 - nonlinearValue2;
    float sumValue11 = nonlinearValue + productValue12;
    float sumValue12 = nonlinearValue1 + productValue13;
    float sumValue13 = nonlinearValue2 + productValue14;
    float productValue17 = min(max(productValue - (productValue10 * RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON.y), 0.0f), RD_UNIFORM_DISPLAY_RESOLUTION.x + (-1.0f));
    float productValue18 = min(max(productValue1 - (productValue11 * RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON.y), 0.0f), RD_UNIFORM_DISPLAY_RESOLUTION.y + (-1.0f));
    float sumValue14 = floor(productValue17 + (-0.5f));
    float sumValue15 = floor(productValue18 + (-0.5f));
    float sumValue16 = sumValue14 + 0.5f;
    float sumValue17 = sumValue15 + 0.5f;
    float sumValue18 = min(max(productValue17 - sumValue16, 0.0f), 1.0f);
    float sumValue19 = min(max(productValue18 - sumValue17, 0.0f), 1.0f);
    float productValue19 = sumValue18 * sumValue18;
    float productValue20 = sumValue19 * sumValue19;
    float productValue21 = productValue19 * sumValue18;
    float productValue22 = productValue20 * sumValue19;
    float productValue23 = productValue19 - ((productValue21 + sumValue18) * 0.5f);
    float productValue24 = productValue20 - ((productValue22 + sumValue19) * 0.5f);
    float productValue25 = (sumValue18 * 0.5f) * (productValue19 - sumValue18);
    float productValue26 = (sumValue19 * 0.5f) * (productValue20 - sumValue19);
    float sumValue20 = (1.0f - productValue25) - productValue23;
    float sumValue21 = (1.0f - productValue26) - productValue24;
    float productValue27 = (sumValue14 + (-0.5f)) * RD_UNIFORM_RECIP_DISPLAY_RESOLUTION.x;
    float productValue28 = (sumValue15 + (-0.5f)) * RD_UNIFORM_RECIP_DISPLAY_RESOLUTION.y;
    float quotientValue = ((((((productValue19 * 2.5f) + (-1.0f)) - (productValue21 * 1.5f)) + sumValue20) / sumValue20) + sumValue16) * RD_UNIFORM_RECIP_DISPLAY_RESOLUTION.x;
    float quotientValue1 = ((((((productValue20 * 2.5f) + (-1.0f)) - (productValue22 * 1.5f)) + sumValue21) / sumValue21) + sumValue17) * RD_UNIFORM_RECIP_DISPLAY_RESOLUTION.y;
    float productValue29 = (sumValue14 + 2.5f) * RD_UNIFORM_RECIP_DISPLAY_RESOLUTION.x;
    float productValue30 = (sumValue15 + 2.5f) * RD_UNIFORM_RECIP_DISPLAY_RESOLUTION.y;
    float4 sampledTextureValue = inputTaaHistoryTexture.SampleLevel(inputTaaHistorySampler, float2(productValue27, productValue28), 0.0f);
    float productValue31 = productValue24 * productValue23;
    float4 sampledTextureValue1 = inputTaaHistoryTexture.SampleLevel(inputTaaHistorySampler, float2(productValue27, quotientValue1), 0.0f);
    float productValue32 = sumValue21 * productValue23;
    float4 sampledTextureValue2 = inputTaaHistoryTexture.SampleLevel(inputTaaHistorySampler, float2(productValue27, productValue30), 0.0f);
    float productValue33 = productValue23 * productValue26;
    float4 sampledTextureValue3 = inputTaaHistoryTexture.SampleLevel(inputTaaHistorySampler, float2(quotientValue, productValue28), 0.0f);
    float productValue34 = sumValue20 * productValue24;
    float4 sampledTextureValue4 = inputTaaHistoryTexture.SampleLevel(inputTaaHistorySampler, float2(quotientValue, quotientValue1), 0.0f);
    float productValue35 = sumValue21 * sumValue20;
    float4 sampledTextureValue5 = inputTaaHistoryTexture.SampleLevel(inputTaaHistorySampler, float2(quotientValue, productValue30), 0.0f);
    float productValue36 = sumValue20 * productValue26;
    float4 sampledTextureValue6 = inputTaaHistoryTexture.SampleLevel(inputTaaHistorySampler, float2(productValue29, productValue28), 0.0f);
    float productValue37 = productValue24 * productValue25;
    float4 sampledTextureValue7 = inputTaaHistoryTexture.SampleLevel(inputTaaHistorySampler, float2(productValue29, quotientValue1), 0.0f);
    float productValue38 = sumValue21 * productValue25;
    float4 sampledTextureValue8 = inputTaaHistoryTexture.SampleLevel(inputTaaHistorySampler, float2(productValue29, productValue30), 0.0f);
    float productValue39 = productValue26 * productValue25;
    float productValue40 = max(0.0f, ((((((((sampledTextureValue1.x * productValue32) + (sampledTextureValue.x * productValue31)) + (sampledTextureValue2.x * productValue33)) + (sampledTextureValue3.x * productValue34)) + (sampledTextureValue4.x * productValue35)) + (sampledTextureValue5.x * productValue36)) + (sampledTextureValue6.x * productValue37)) + (sampledTextureValue7.x * productValue38)) + (sampledTextureValue8.x * productValue39));
    float productValue41 = max(0.0f, ((((((((sampledTextureValue1.y * productValue32) + (sampledTextureValue.y * productValue31)) + (sampledTextureValue2.y * productValue33)) + (sampledTextureValue3.y * productValue34)) + (sampledTextureValue4.y * productValue35)) + (sampledTextureValue5.y * productValue36)) + (sampledTextureValue6.y * productValue37)) + (sampledTextureValue7.y * productValue38)) + (sampledTextureValue8.y * productValue39));
    float productValue42 = max(0.0f, ((((((((sampledTextureValue1.z * productValue32) + (sampledTextureValue.z * productValue31)) + (sampledTextureValue2.z * productValue33)) + (sampledTextureValue3.z * productValue34)) + (sampledTextureValue4.z * productValue35)) + (sampledTextureValue5.z * productValue36)) + (sampledTextureValue6.z * productValue37)) + (sampledTextureValue7.z * productValue38)) + (sampledTextureValue8.z * productValue39));
    float intermediateValue40;
    float intermediateValue41;
    float intermediateValue42;
    if (RD_UNIFORM_TAA_UPSCALING_PARAMETERS.z != 0.0f)
    {
        float branchMergedValue8;
        float branchMergedValue10;
        float branchMergedValue11;
        if ((((productValue40 > sumValue11) || (productValue41 > sumValue12)) || (productValue42 > sumValue13)) || (((productValue40 < sumValue8) || (productValue41 < sumValue9)) || (productValue42 < sumValue10)))
        {
            float intermediateValue[3];
            intermediateValue[0u] = sumValue11;
            intermediateValue[1u] = sumValue12;
            intermediateValue[2u] = sumValue13;
            float intermediateValue1[3];
            intermediateValue1[0u] = sumValue8;
            intermediateValue1[1u] = sumValue9;
            intermediateValue1[2u] = sumValue10;
            float intermediateValue2[3];
            intermediateValue2[0u] = productValue40;
            intermediateValue2[1u] = productValue41;
            intermediateValue2[2u] = productValue42;
            float sumValue22 = scalarValue2 - productValue40;
            float sumValue23 = scalarValue3 - productValue41;
            float sumValue24 = scalarValue4 - productValue42;
            float intermediateValue3[3];
            intermediateValue3[0u] = sumValue22;
            intermediateValue3[1u] = sumValue23;
            intermediateValue3[2u] = sumValue24;
            float nonlinearValue3 = sqrt(((sumValue23 * sumValue23) + (sumValue22 * sumValue22)) + (sumValue24 * sumValue24));
            float intermediateValue43;
            float intermediateValue44;
            float intermediateValue45;
            if (nonlinearValue3 > 0.0f)
            {
                float quotientValue2 = sumValue22 / nonlinearValue3;
                float quotientValue3 = sumValue23 / nonlinearValue3;
                float quotientValue4 = sumValue24 / nonlinearValue3;
                intermediateValue3[0u] = quotientValue2;
                intermediateValue3[1u] = quotientValue3;
                intermediateValue3[2u] = quotientValue4;
                intermediateValue43 = quotientValue4;
                intermediateValue44 = quotientValue3;
                intermediateValue45 = quotientValue2;
            }
            else
            {
                intermediateValue43 = sumValue24;
                intermediateValue44 = sumValue23;
                intermediateValue45 = sumValue22;
            }
            uint sumValue27;
            float intermediateValue48;
            float intermediateValue50;
            uint intermediateValue52;
            float scalarValue19 = intermediateValue45;
            float scalarValue20 = -65000.0f;
            float scalarValue21 = 65000.0f;
            uint scalarValue22 = 0u;
            uint scalarValue23 = 0u;
            bool intermediateValue54;
            for (;;)
            {
                intermediateValue54 = abs(scalarValue19) > RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON.z;
                if (intermediateValue54)
                {
                    float quotientValue5 = (intermediateValue1[scalarValue23] - intermediateValue2[scalarValue23]) / scalarValue19;
                    float quotientValue6 = (intermediateValue[scalarValue23] - intermediateValue2[scalarValue23]) / scalarValue19;
                    bool conditionValue = quotientValue5 > quotientValue6;
                    float comparisonValue1 = conditionValue ? quotientValue6 : quotientValue5;
                    float comparisonValue2 = conditionValue ? quotientValue5 : quotientValue6;
                    float comparisonValue3 = (comparisonValue1 > scalarValue20) ? comparisonValue1 : scalarValue20;
                    float comparisonValue4 = (comparisonValue2 < scalarValue21) ? comparisonValue2 : scalarValue21;
                    uint branchMergedValue9;
                    float branchMergedValue12;
                    float branchMergedValue13;
                    if (comparisonValue4 < 0.0f)
                    {
                        branchMergedValue9 = 1u;
                        branchMergedValue12 = comparisonValue4;
                        branchMergedValue13 = comparisonValue3;
                    }
                    else
                    {
                        branchMergedValue9 = (comparisonValue3 > comparisonValue4) ? 1u : scalarValue22;
                        branchMergedValue12 = comparisonValue4;
                        branchMergedValue13 = comparisonValue3;
                    }
                    intermediateValue48 = branchMergedValue13;
                    intermediateValue50 = branchMergedValue12;
                    intermediateValue52 = branchMergedValue9;
                }
                else
                {
                    intermediateValue48 = scalarValue20;
                    intermediateValue50 = scalarValue21;
                    intermediateValue52 = ((intermediateValue2[scalarValue23] < intermediateValue1[scalarValue23]) || (intermediateValue2[scalarValue23] > intermediateValue[scalarValue23])) ? 1u : scalarValue22;
                }
                sumValue27 = scalarValue23 + 1u;
                if (sumValue27 == 3u)
                {
                    break;
                }
                scalarValue19 = intermediateValue3[sumValue27];
                scalarValue20 = intermediateValue48;
                scalarValue21 = intermediateValue50;
                scalarValue22 = intermediateValue52;
                scalarValue23 = sumValue27;
                continue;
            }
            float branchMergedValue22;
            float branchMergedValue23;
            float branchMergedValue24;
            if (intermediateValue52 == 0u)
            {
                float branchMergedValue33;
                float branchMergedValue34;
                float branchMergedValue35;
                if (intermediateValue48 > 0.0f)
                {
                    branchMergedValue33 = (intermediateValue48 * intermediateValue43) + productValue42;
                    branchMergedValue34 = (intermediateValue48 * intermediateValue44) + productValue41;
                    branchMergedValue35 = (intermediateValue48 * intermediateValue45) + productValue40;
                }
                else
                {
                    branchMergedValue33 = (intermediateValue50 * intermediateValue43) + productValue42;
                    branchMergedValue34 = (intermediateValue50 * intermediateValue44) + productValue41;
                    branchMergedValue35 = (intermediateValue50 * intermediateValue45) + productValue40;
                }
                branchMergedValue22 = branchMergedValue33;
                branchMergedValue23 = branchMergedValue34;
                branchMergedValue24 = branchMergedValue35;
            }
            else
            {
                branchMergedValue22 = min(sumValue13, max(sumValue10, productValue42));
                branchMergedValue23 = min(sumValue12, max(sumValue9, productValue41));
                branchMergedValue24 = min(sumValue11, max(sumValue8, productValue40));
            }
            branchMergedValue8 = branchMergedValue22;
            branchMergedValue10 = branchMergedValue23;
            branchMergedValue11 = branchMergedValue24;
        }
        else
        {
            branchMergedValue8 = productValue42;
            branchMergedValue10 = productValue41;
            branchMergedValue11 = productValue40;
        }
        intermediateValue40 = branchMergedValue11;
        intermediateValue41 = branchMergedValue10;
        intermediateValue42 = branchMergedValue8;
    }
    else
    {
        intermediateValue40 = min(sumValue11, max(sumValue8, productValue40));
        intermediateValue41 = min(sumValue12, max(sumValue9, productValue41));
        intermediateValue42 = min(sumValue13, max(sumValue10, productValue42));
    }
    float sumValue25 = productValue2 - float(int(scalarValue));
    float sumValue26 = productValue3 - float(int(scalarValue1));
    float dotProductValue = (RD_UNIFORM_SUB_PIXEL_JITTER_AND_VALID_HISTORY.z != 0.0f) ? (max(productValue15, min(max(1.0f - (RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON.y * dot(float2(sumValue25, sumValue26), float2(sumValue25, sumValue26))), 0.0500000007450580596923828125f), 1.0f)) * 0.100000001490116119384765625f) : 1.0f;
    fragmentColor0.x = (dotProductValue * (scalarValue2 - intermediateValue40)) + intermediateValue40;
    fragmentColor0.y = (dotProductValue * (scalarValue3 - intermediateValue41)) + intermediateValue41;
    fragmentColor0.z = (dotProductValue * (scalarValue4 - intermediateValue42)) + intermediateValue42;
    fragmentColor0.w = 0.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
