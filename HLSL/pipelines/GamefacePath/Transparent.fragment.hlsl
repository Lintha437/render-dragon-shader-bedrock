// GamefacePath / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
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


#include "../../include/materials/GamefacePath/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord0 : TEXCOORD0,
  nointerpolation float4 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.x = (uint)varyingTexCoord3.z << 4;
  workingVector0.y = (uint)varyingTexCoord3.y >> 4;
  workingVector0.y = (int)workingVector0.y & 15;
  workingVector0.x = (int)workingVector0.y + (int)workingVector0.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  if (4 == 0) workingVector0.x = 0; else if (4+4 < 32) {   workingVector0.x = (uint)varyingTexCoord3.y << (32-(4 + 4)); workingVector0.x = (uint)workingVector0.x >> (32-4);  } else workingVector0.x = (uint)varyingTexCoord3.y >> 4;
  bitMask.x = ((~(-1 << 28)) << 4) & 0xffffffff;  workingVector0.x = (((uint)varyingTexCoord3.z << 4) & bitMask.x) | ((uint)workingVector0.x & ~bitMask.x);
#endif
  workingVector0.y = (int)workingVector0.x + 1;
  workingVector0.x = (int)fragmentVectorConstants1[workingVector0.x+0].x;
  workingVector0.z = RD_COMPARISON_MASK((int)varyingTexCoord3.w == 14);
  if (workingVector0.z != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector0.zw = ddx(varyingTexCoord0.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector0.zw = ddx_coarse(varyingTexCoord0.xy);
#endif
    workingVector1.xy = -varyingTexCoord0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector1.xz = ddy(workingVector1.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector1.xz = ddy_coarse(workingVector1.xy);
#endif
    workingVector1.w = varyingTexCoord0.x + varyingTexCoord0.x;
    workingVector0.z = workingVector1.w * workingVector0.z + -workingVector0.w;
    workingVector0.w = workingVector1.w * workingVector1.x + -workingVector1.z;
    workingVector1.x = varyingTexCoord0.x * varyingTexCoord0.x + workingVector1.y;
    workingVector1.x = workingVector1.x * workingVector1.x;
    workingVector0.w = workingVector0.w * workingVector0.w;
    workingVector0.z = workingVector0.z * workingVector0.z + workingVector0.w;
    workingVector0.z = workingVector1.x / workingVector0.z;
    workingVector0.z = sqrt(workingVector0.z);
    workingVector0.z = 1 + -workingVector0.z;
    workingVector1.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw * fragmentVectorConstants1[workingVector0.x+0].xxxx;
    workingVector0.z = max(0, workingVector0.z);
    fragmentColor0.xyzw = workingVector1.xyzw * workingVector0.zzzz;
  } else {
    workingVector0.z = RD_COMPARISON_MASK((int)varyingTexCoord3.w == 11);
    if (workingVector0.z != 0) {
      workingVector0.z = varyingTexCoord0.y * fragmentVectorConstants1[workingVector0.x+0].y + -fragmentVectorConstants1[workingVector0.x+0].z;
      workingVector0.z = 1 + -abs(workingVector0.z);
      workingVector0.x = fragmentVectorConstants1[workingVector0.x+0].x * workingVector0.z;
      workingVector0.x = min(1, workingVector0.x);
      fragmentColor0.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw * workingVector0.xxxx;
    } else {
      fragmentColor0.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw * varyingTexCoord0.yyyy;
    }
  }
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    uint reinterpretedBits = asuint(varyingTexCoord3.w);
    uint reinterpretedBits1 = (asuint(varyingTexCoord3.z) << 4u) | ((asuint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue = reinterpretedBits1 + 1u;
    uint scalarValue = uint(int(fragmentConstants[reinterpretedBits1].x));
    float productValue3;
    float productValue4;
    float productValue5;
    float productValue6;
    if (reinterpretedBits == 14u)
    {
        float scalarValue1 = varyingTexCoord0.x * 2.0f;
        float productValue = (ddx_coarse(varyingTexCoord0.x) * scalarValue1) - ddx_coarse(varyingTexCoord0.y);
        float productValue1 = (ddy_coarse((-0.0f) - varyingTexCoord0.x) * scalarValue1) - ddy_coarse((-0.0f) - varyingTexCoord0.y);
        float productValue2 = (varyingTexCoord0.x * varyingTexCoord0.x) - varyingTexCoord0.y;
        float clampedValue = clamp(1.0f - sqrt((productValue2 * productValue2) / ((productValue1 * productValue1) + (productValue * productValue))), 0.0f, 1.0f) * fragmentConstants[scalarValue].x;
        productValue3 = clampedValue * fragmentConstants[sumValue].x;
        productValue4 = clampedValue * fragmentConstants[sumValue].y;
        productValue5 = clampedValue * fragmentConstants[sumValue].z;
        productValue6 = clampedValue * fragmentConstants[sumValue].w;
    }
    else
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (reinterpretedBits == 11u)
        {
            float scalarValue2 = min(1.0f, (1.0f - abs((fragmentConstants[scalarValue].y * varyingTexCoord0.y) - fragmentConstants[scalarValue].z)) * fragmentConstants[scalarValue].x);
            branchMergedValue = scalarValue2 * fragmentConstants[sumValue].x;
            branchMergedValue1 = scalarValue2 * fragmentConstants[sumValue].y;
            branchMergedValue2 = scalarValue2 * fragmentConstants[sumValue].z;
            branchMergedValue3 = scalarValue2 * fragmentConstants[sumValue].w;
        }
        else
        {
            branchMergedValue = fragmentConstants[sumValue].x * varyingTexCoord0.y;
            branchMergedValue1 = fragmentConstants[sumValue].y * varyingTexCoord0.y;
            branchMergedValue2 = fragmentConstants[sumValue].z * varyingTexCoord0.y;
            branchMergedValue3 = fragmentConstants[sumValue].w * varyingTexCoord0.y;
        }
        productValue3 = branchMergedValue;
        productValue4 = branchMergedValue1;
        productValue5 = branchMergedValue2;
        productValue6 = branchMergedValue3;
    }
    fragmentColor0.x = productValue3;
    fragmentColor0.y = productValue4;
    fragmentColor0.z = productValue5;
    fragmentColor0.w = productValue6;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
