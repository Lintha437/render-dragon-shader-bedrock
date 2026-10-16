// SpecularConvolution / GenerateBrdf / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif


#include "../../include/materials/SpecularConvolution/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = varyingTexCoord0.y * varyingTexCoord0.y;
  workingVector0.y = -varyingTexCoord0.x * varyingTexCoord0.x + 1;
  workingVector1.x = sqrt(workingVector0.y);
  workingVector0.y = (int)RD_UNIFORM_CONVOLUTION_PARAMETERS.x;
  workingVector0.z = (uint)RD_UNIFORM_CONVOLUTION_PARAMETERS.x;
  workingVector0.z = (uint)workingVector0.z;
  workingVector0.w = workingVector0.x * workingVector0.x + -1;
  workingVector1.z = 0.5 * workingVector0.x;
  workingVector0.x = -workingVector0.x * 0.5 + 1;
  workingVector1.w = varyingTexCoord0.x * workingVector0.x + workingVector1.z;
  workingVector1.w = 9.99999975e-005 + workingVector1.w;
  workingVector1.w = varyingTexCoord0.x / workingVector1.w;
  workingVector1.y = varyingTexCoord0.x;
  workingVector2.xyz = float3(0,0,0);
  while (true) {
    workingVector2.w = RD_COMPARISON_MASK((int)workingVector2.z >= (int)workingVector0.y);
    if (workingVector2.w != 0) break;
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector2.w = (uint)workingVector2.z << 16;
    workingVector3.x = (uint)workingVector2.z >> 16;
    workingVector2.w = (int)workingVector2.w + (int)workingVector3.x;
    workingVector3.x = (uint)workingVector2.w << 1;
    workingVector3.x = (int)workingVector3.x & 0xaaaaaaaa;
    workingVector2.w = (uint)workingVector2.w >> 1;
    workingVector2.w = (int)workingVector2.w & 0x55555555;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector2.w = (uint)workingVector2.z >> 16;
    bitMask.x = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector3.x = (((uint)workingVector2.z << 16) & bitMask.x) | ((uint)workingVector2.w & ~bitMask.x);
    workingVector2.w = (uint)workingVector2.w << 1;
    bitMask.w = ((~(-1 << 16)) << 17) & 0xffffffff;  workingVector2.w = (((uint)workingVector2.z << 17) & bitMask.w) | ((uint)workingVector2.w & ~bitMask.w);
    workingVector2.w = (int)workingVector2.w & 0xaaaaaaaa;
    workingVector3.x = (uint)workingVector3.x >> 1;
    workingVector3.x = (int)workingVector3.x & 0x55555555;
#endif
    workingVector2.w = (int)workingVector2.w + (int)workingVector3.x;
    workingVector3.x = (uint)workingVector2.w << 2;
    workingVector3.x = (int)workingVector3.x & 0xcccccccc;
    workingVector2.w = (uint)workingVector2.w >> 2;
    workingVector2.w = (int)workingVector2.w & 0x33333333;
    workingVector2.w = (int)workingVector2.w + (int)workingVector3.x;
    workingVector3.x = (uint)workingVector2.w << 4;
    workingVector3.x = (int)workingVector3.x & 0xf0f0f0f0;
    workingVector2.w = (uint)workingVector2.w >> 4;
    workingVector2.w = (int)workingVector2.w & 0x0f0f0f0f;
    workingVector2.w = (int)workingVector2.w + (int)workingVector3.x;
    workingVector3.x = (uint)workingVector2.w << 8;
    workingVector3.x = (int)workingVector3.x & 0xff00ff00;
    workingVector2.w = (uint)workingVector2.w >> 8;
    workingVector2.w = (int)workingVector2.w & 0x00ff00ff;
    workingVector2.w = (int)workingVector2.w + (int)workingVector3.x;
    workingVector2.w = (uint)workingVector2.w;
    workingVector3.x = 2.32830644e-010 * workingVector2.w;
    workingVector3.y = (uint)workingVector2.z;
    workingVector3.y = workingVector3.y / workingVector0.z;
    workingVector3.y = 6.28318548 * workingVector3.y;
    workingVector2.w = -workingVector2.w * 2.32830644e-010 + 1;
    workingVector3.x = workingVector0.w * workingVector3.x + 1;
    workingVector2.w = workingVector2.w / workingVector3.x;
    workingVector3.x = sqrt(workingVector2.w);
    workingVector2.w = 1 + -workingVector2.w;
    workingVector2.w = sqrt(workingVector2.w);
    workingVector3.y = sin(workingVector3.y);
    workingVector2.w = workingVector3.y * workingVector2.w;
    workingVector3.xy = float2(0,1) * workingVector3.xx;
    workingVector3.xy = workingVector2.ww * float2(1,0) + workingVector3.xy;
    workingVector2.w = dot(workingVector1.xy, workingVector3.xy);
    workingVector3.x = dot(workingVector3.yy, workingVector2.ww);
    workingVector3.x = saturate(-varyingTexCoord0.x + workingVector3.x);
    workingVector3.y = min(1, workingVector3.y);
    workingVector2.w = saturate(workingVector2.w);
    workingVector3.z = RD_COMPARISON_MASK(0 < workingVector3.x);
    workingVector3.w = workingVector3.x * workingVector0.x + workingVector1.z;
    workingVector3.w = 9.99999975e-005 + workingVector3.w;
    workingVector3.x = workingVector3.x / workingVector3.w;
    workingVector3.x = workingVector3.x * workingVector1.w;
    workingVector3.x = workingVector3.x * workingVector2.w;
    workingVector3.y = varyingTexCoord0.x * workingVector3.y;
    workingVector3.x = workingVector3.x / workingVector3.y;
    workingVector2.w = 1 + -workingVector2.w;
    workingVector3.y = workingVector2.w * workingVector2.w;
    workingVector3.y = workingVector3.y * workingVector3.y;
    workingVector3.w = workingVector3.y * workingVector2.w;
    workingVector2.w = -workingVector3.y * workingVector2.w + 1;
    workingVector4.x = workingVector2.w * workingVector3.x + workingVector2.x;
    workingVector4.y = workingVector3.w * workingVector3.x + workingVector2.y;
    workingVector2.xy = workingVector3.zz ? workingVector4.xy : workingVector2.xy;
    workingVector2.z = (int)workingVector2.z + 1;
  }
  fragmentColor0.xy = workingVector2.xy / RD_UNIFORM_CONVOLUTION_PARAMETERS.xx;
  fragmentColor0.zw = float2(0,1);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float nonlinearValue = sqrt(1.0f - (varyingTexCoord0.x * varyingTexCoord0.x));
    float intermediateValue;
    float intermediateValue2;
    if (int(uint(int(RD_UNIFORM_CONVOLUTION_PARAMETERS.x))) > int(0u))
    {
        float intermediateValue1;
        float intermediateValue3;
        float scalarValue = 0.0f;
        float scalarValue1 = 0.0f;
        uint scalarValue2 = 0u;
        float intermediateValue7;
        float productValue;
        float nonlinearValue1;
        float clampedValue;
        float clampedValue1;
        bool intermediateValue8;
        for (;;)
        {
            intermediateValue7 = RD_UNIFORM_CONVOLUTION_PARAMETERS.x;
            uint bitwiseValue = (scalarValue2 << 16u) | (scalarValue2 >> 16u);
            uint bitwiseValue1 = ((bitwiseValue << 1u) & 2863311530u) | ((bitwiseValue >> 1u) & 1431655765u);
            uint bitwiseValue2 = ((bitwiseValue1 << 2u) & 3435973836u) | ((bitwiseValue1 >> 2u) & 858993459u);
            uint bitwiseValue3 = ((bitwiseValue2 << 4u) & 4042322160u) | ((bitwiseValue2 >> 4u) & 252645135u);
            float bitwiseValue4 = float(((bitwiseValue3 << 8u) & 4278255360u) | ((bitwiseValue3 >> 8u) & 16711935u)) * 2.3283064365386962890625e-10f;
            productValue = varyingTexCoord0.y * varyingTexCoord0.y;
            float quotientValue = (float(scalarValue2) / float(uint(intermediateValue7))) * 6.283185482025146484375f;
            nonlinearValue1 = sqrt((1.0f - bitwiseValue4) / ((bitwiseValue4 * ((productValue * productValue) + (-1.0f))) + 1.0f));
            float nonlinearValue2 = sqrt(1.0f - (nonlinearValue1 * nonlinearValue1));
            float dotProductValue = dot(float3(nonlinearValue, 0.0f, varyingTexCoord0.x), float3(sin(quotientValue) * nonlinearValue2, (-0.0f) - (nonlinearValue2 * cos(quotientValue)), nonlinearValue1));
            clampedValue = clamp(((nonlinearValue1 * 2.0f) * dotProductValue) - varyingTexCoord0.x, 0.0f, 1.0f);
            clampedValue1 = clamp(dotProductValue, 0.0f, 1.0f);
            intermediateValue8 = clampedValue > 0.0f;
            float branchMergedValue;
            float branchMergedValue1;
            if (intermediateValue8)
            {
                float productValue1 = productValue * 0.5f;
                float sumValue = 1.0f - productValue1;
                float sumValue1 = productValue1 + 9.9999997473787516355514526367188e-05f;
                float clampedValue2 = (((varyingTexCoord0.x / ((sumValue * varyingTexCoord0.x) + sumValue1)) * clampedValue1) * (clampedValue / ((clampedValue * sumValue) + sumValue1))) / (clamp(nonlinearValue1, 0.0f, 1.0f) * varyingTexCoord0.x);
                float sumValue2 = 1.0f - clampedValue1;
                float productValue2 = sumValue2 * sumValue2;
                float productValue3 = (productValue2 * productValue2) * sumValue2;
                branchMergedValue = (clampedValue2 * (1.0f - productValue3)) + scalarValue;
                branchMergedValue1 = (clampedValue2 * productValue3) + scalarValue1;
            }
            else
            {
                branchMergedValue = scalarValue;
                branchMergedValue1 = scalarValue1;
            }
            intermediateValue1 = branchMergedValue;
            intermediateValue3 = branchMergedValue1;
            uint sumValue3 = scalarValue2 + 1u;
            if (int(sumValue3) < int(uint(int(intermediateValue7))))
            {
                scalarValue = intermediateValue1;
                scalarValue1 = intermediateValue3;
                scalarValue2 = sumValue3;
                continue;
            }
            else
            {
                break;
            }
        }
        intermediateValue = intermediateValue1;
        intermediateValue2 = intermediateValue3;
    }
    else
    {
        intermediateValue = 0.0f;
        intermediateValue2 = 0.0f;
    }
    fragmentColor0.x = intermediateValue / RD_UNIFORM_CONVOLUTION_PARAMETERS.x;
    fragmentColor0.y = intermediateValue2 / RD_UNIFORM_CONVOLUTION_PARAMETERS.x;
    fragmentColor0.z = 0.0f;
    fragmentColor0.w = 1.0f;
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
