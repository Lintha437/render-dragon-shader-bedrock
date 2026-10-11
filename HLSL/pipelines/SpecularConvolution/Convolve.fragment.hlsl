// SpecularConvolution / Convolve / fragment forward pipeline.
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


#include "../../include/materials/SpecularConvolution/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (int)RD_UNIFORM_CURRENT_FACE.x;
  switch (workingVector0.x) {
    case 0 :    workingVector0.x = 1;
    workingVector0.yz = varyingTexCoord0.yx * float2(-2,-2) + float2(1,1);
    break;
    case 1 :    workingVector0.x = -1;
    workingVector0.yz = varyingTexCoord0.yx * float2(-2,2) + float2(1,-1);
    break;
    case 2 :    workingVector0.xz = varyingTexCoord0.xy * float2(2,2) + float2(-1,-1);
    workingVector0.y = 1;
    break;
    case 3 :    workingVector0.xz = varyingTexCoord0.xy * float2(2,-2) + float2(-1,1);
    workingVector0.y = -1;
    break;
    case 4 :    workingVector0.xy = varyingTexCoord0.xy * float2(2,-2) + float2(-1,1);
    workingVector0.z = 1;
    break;
    case 5 :    workingVector0.xy = varyingTexCoord0.xy * float2(-2,-2) + float2(1,1);
    workingVector0.z = -1;
    break;
    default :
    workingVector0.xyz = float3(0,0,0);
    break;
  }
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector0.w = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
  workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.w == 1);
  if (workingVector0.w != 0) {
    workingVector0.w = (int)RD_UNIFORM_CONVOLUTION_PARAMETERS.y;
    if (workingVector0.w == 0) {
      workingVector1.xyz = materialTexture0.SampleLevel(textureSampler0, workingVector0.xyz, 0).xyz;
    } else {
      workingVector0.w = -1 + RD_UNIFORM_CONVOLUTION_PARAMETERS.w;
      workingVector0.w = RD_UNIFORM_CONVOLUTION_PARAMETERS.y / workingVector0.w;
      workingVector1.w = (uint)RD_UNIFORM_CONVOLUTION_PARAMETERS.x;
      workingVector2.x = trunc(RD_UNIFORM_CONVOLUTION_PARAMETERS.z);
      workingVector2.y = (uint)workingVector1.w;
      workingVector0.w = workingVector0.w * workingVector0.w;
      workingVector2.z = workingVector0.w * workingVector0.w;
      workingVector0.w = workingVector0.w * workingVector0.w + -1;
      workingVector2.w = RD_COMPARISON_MASK(abs(workingVector0.z) < 0.999000013);
      workingVector3.xyz = workingVector2.www ? float3(1,0,0) : float3(0,1,0);
      workingVector4.xyz = workingVector3.xyz * workingVector0.yzx;
      workingVector3.xyz = workingVector3.zxy * workingVector0.zxy + -workingVector4.xyz;
      workingVector2.w = dot(workingVector3.xyz, workingVector3.xyz);
      workingVector2.w = rsqrt(workingVector2.w);
      workingVector3.xyz = workingVector3.xyz * workingVector2.www;
      workingVector4.xyz = workingVector3.yzx * workingVector0.zxy;
      workingVector4.xyz = workingVector0.yzx * workingVector3.zxy + -workingVector4.xyz;
      workingVector2.x = workingVector2.x * workingVector2.x;
      workingVector2.x = 6 * workingVector2.x;
      workingVector2.x = 12.566371 / workingVector2.x;
      workingVector5.xyz = float3(0,0,0);
      workingVector2.w = 0;
      workingVector3.w = 0;
      while (true) {
        workingVector4.w = RD_COMPARISON_MASK((int)workingVector3.w >= (int)workingVector1.w);
        if (workingVector4.w != 0) break;
        workingVector4.w = (uint)workingVector3.w >> 16;
        bitMask.w = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector5.w = (((uint)workingVector3.w << 16) & bitMask.w) | ((uint)workingVector4.w & ~bitMask.w);
        workingVector4.w = (uint)workingVector4.w << 1;
        bitMask.w = ((~(-1 << 16)) << 17) & 0xffffffff;  workingVector4.w = (((uint)workingVector3.w << 17) & bitMask.w) | ((uint)workingVector4.w & ~bitMask.w);
        workingVector4.w = (int)workingVector4.w & 0xaaaaaaaa;
        workingVector5.w = (uint)workingVector5.w >> 1;
        workingVector5.w = (int)workingVector5.w & 0x55555555;
        workingVector4.w = (int)workingVector4.w + (int)workingVector5.w;
        workingVector5.w = (uint)workingVector4.w << 2;
        workingVector5.w = (int)workingVector5.w & 0xcccccccc;
        workingVector4.w = (uint)workingVector4.w >> 2;
        workingVector4.w = (int)workingVector4.w & 0x33333333;
        workingVector4.w = (int)workingVector4.w + (int)workingVector5.w;
        workingVector5.w = (uint)workingVector4.w << 4;
        workingVector5.w = (int)workingVector5.w & 0xf0f0f0f0;
        workingVector4.w = (uint)workingVector4.w >> 4;
        workingVector4.w = (int)workingVector4.w & 0x0f0f0f0f;
        workingVector4.w = (int)workingVector4.w + (int)workingVector5.w;
        workingVector5.w = (uint)workingVector4.w << 8;
        workingVector5.w = (int)workingVector5.w & 0xff00ff00;
        workingVector4.w = (uint)workingVector4.w >> 8;
        workingVector4.w = (int)workingVector4.w & 0x00ff00ff;
        workingVector4.w = (int)workingVector4.w + (int)workingVector5.w;
        workingVector4.w = (uint)workingVector4.w;
        workingVector5.w = 2.32830644e-010 * workingVector4.w;
        workingVector6.x = (uint)workingVector3.w;
        workingVector6.x = workingVector6.x / workingVector2.y;
        workingVector6.x = 6.28318548 * workingVector6.x;
        workingVector4.w = -workingVector4.w * 2.32830644e-010 + 1;
        workingVector5.w = workingVector0.w * workingVector5.w + 1;
        workingVector4.w = workingVector4.w / workingVector5.w;
        workingVector5.w = sqrt(workingVector4.w);
        workingVector4.w = 1 + -workingVector4.w;
        workingVector4.w = sqrt(workingVector4.w);
        sincos(workingVector6.x, workingVector6.x, workingVector7.x);
        workingVector6.y = workingVector7.x * workingVector4.w;
        workingVector4.w = workingVector6.x * workingVector4.w;
        workingVector6.xzw = workingVector4.xyz * workingVector4.www;
        workingVector6.xyz = workingVector3.xyz * workingVector6.yyy + workingVector6.xzw;
        workingVector6.xyz = workingVector0.xyz * workingVector5.www + workingVector6.xyz;
        workingVector4.w = dot(workingVector0.xyz, workingVector6.xyz);
        workingVector5.w = workingVector4.w + workingVector4.w;
        workingVector6.xyz = workingVector5.www * workingVector6.xyz + -workingVector0.xyz;
        workingVector5.w = dot(workingVector6.xyz, workingVector6.xyz);
        workingVector5.w = rsqrt(workingVector5.w);
        workingVector6.xyz = workingVector6.xyz * workingVector5.www;
        workingVector5.w = saturate(dot(workingVector0.xyz, workingVector6.xyz));
        workingVector6.w = RD_COMPARISON_MASK(0 < workingVector5.w);
        if (workingVector6.w != 0) {
          workingVector4.w = max(0, workingVector4.w);
          workingVector4.w = workingVector4.w * workingVector4.w;
          workingVector4.w = workingVector4.w * workingVector0.w + 1;
          workingVector4.w = workingVector4.w * workingVector4.w;
          workingVector4.w = 3.14159274 * workingVector4.w;
          workingVector4.w = workingVector2.z / workingVector4.w;
          workingVector4.w = workingVector4.w * workingVector2.y;
          workingVector4.w = 0.249993742 * workingVector4.w;
          workingVector4.w = 1 / workingVector4.w;
          workingVector4.w = workingVector4.w / workingVector2.x;
          workingVector4.w = log2(workingVector4.w);
          workingVector4.w = 0.5 * workingVector4.w;
          workingVector4.w = max(0, workingVector4.w);
          workingVector6.xyz = materialTexture0.SampleLevel(textureSampler0, workingVector6.xyz, workingVector4.w).xyz;
          workingVector5.xyz = workingVector6.xyz * workingVector5.www + workingVector5.xyz;
          workingVector2.w = workingVector5.w + workingVector2.w;
        }
        workingVector3.w = (int)workingVector3.w + 1;
      }
      workingVector0.w = max(0.00100000005, workingVector2.w);
      workingVector1.xyz = workingVector5.xyz / workingVector0.www;
    }
  } else {
    workingVector0.w = trunc(RD_UNIFORM_CONVOLUTION_PARAMETERS.y);
    workingVector1.xyz = materialTexture0.SampleLevel(textureSampler0, workingVector0.xyz, workingVector0.w).xyz;
  }
  fragmentColor0.xyz = workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float productValue = (varyingTexCoord0.x * 2.0f) + (-1.0f);
    float productValue1 = (varyingTexCoord0.y * 2.0f) + (-1.0f);
    float intermediateValue;
    float sumValue;
    float sumValue1;
    switch (uint(int(RD_UNIFORM_CURRENT_FACE.x)))
    {
        case 0u:
        {
            intermediateValue = 1.0f;
            sumValue = (-0.0f) - productValue1;
            sumValue1 = (-0.0f) - productValue;
            break;
        }
        case 1u:
        {
            intermediateValue = -1.0f;
            sumValue = (-0.0f) - productValue1;
            sumValue1 = productValue;
            break;
        }
        case 2u:
        {
            intermediateValue = productValue;
            sumValue = 1.0f;
            sumValue1 = productValue1;
            break;
        }
        case 3u:
        {
            intermediateValue = productValue;
            sumValue = -1.0f;
            sumValue1 = (-0.0f) - productValue1;
            break;
        }
        case 4u:
        {
            intermediateValue = productValue;
            sumValue = (-0.0f) - productValue1;
            sumValue1 = 1.0f;
            break;
        }
        case 5u:
        {
            intermediateValue = (-0.0f) - productValue;
            sumValue = (-0.0f) - productValue1;
            sumValue1 = -1.0f;
            break;
        }
        default:
        {
            intermediateValue = 0.0f;
            sumValue = 0.0f;
            sumValue1 = 0.0f;
            break;
        }
    }
    float inverseLengthValue = rsqrt(dot(float3(intermediateValue, sumValue, sumValue1), float3(intermediateValue, sumValue, sumValue1)));
    float productValue2 = inverseLengthValue * intermediateValue;
    float productValue3 = inverseLengthValue * sumValue;
    float productValue4 = inverseLengthValue * sumValue1;
    uint scalarValue = uint(int(RD_UNIFORM_CONVOLUTION_PARAMETERS.y));
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if (uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u)
    {
        float branchMergedValue4;
        float branchMergedValue5;
        float branchMergedValue6;
        if (scalarValue == 0u)
        {
            float4 vectorValue = cubeMapTexture.SampleLevel(cubeMapSampler, float3(productValue2, productValue3, productValue4), 0.0f);
            branchMergedValue4 = vectorValue.x;
            branchMergedValue5 = vectorValue.y;
            branchMergedValue6 = vectorValue.z;
        }
        else
        {
            float scalarValue1 = float(int(uint(int(RD_UNIFORM_CONVOLUTION_PARAMETERS.z))));
            uint scalarValue2 = uint(RD_UNIFORM_CONVOLUTION_PARAMETERS.x);
            float quotientValue = RD_UNIFORM_CONVOLUTION_PARAMETERS.y / (RD_UNIFORM_CONVOLUTION_PARAMETERS.w + (-1.0f));
            float intermediateValue8;
            float intermediateValue10;
            float intermediateValue12;
            float intermediateValue14;
            if (int(scalarValue2) > int(0u))
            {
                float intermediateValue9;
                float intermediateValue11;
                float intermediateValue13;
                float intermediateValue15;
                float scalarValue3 = 0.0f;
                float scalarValue4 = 0.0f;
                float scalarValue5 = 0.0f;
                float scalarValue6 = 0.0f;
                uint scalarValue7 = 0u;
                float intermediateValue22;
                float productValue6;
                float sumValue3;
                float dotProductValue;
                float productValue20;
                float productValue21;
                float productValue22;
                float clampedValue;
                bool intermediateValue25;
                for (;;)
                {
                    uint bitwiseValue = (scalarValue7 << 16u) | (scalarValue7 >> 16u);
                    uint bitwiseValue1 = ((bitwiseValue << 1u) & 2863311530u) | ((bitwiseValue >> 1u) & 1431655765u);
                    uint bitwiseValue2 = ((bitwiseValue1 << 2u) & 3435973836u) | ((bitwiseValue1 >> 2u) & 858993459u);
                    uint bitwiseValue3 = ((bitwiseValue2 << 4u) & 4042322160u) | ((bitwiseValue2 >> 4u) & 252645135u);
                    float bitwiseValue4 = float(((bitwiseValue3 << 8u) & 4278255360u) | ((bitwiseValue3 >> 8u) & 16711935u)) * 2.3283064365386962890625e-10f;
                    intermediateValue22 = float(scalarValue2);
                    float productValue5 = quotientValue * quotientValue;
                    float quotientValue1 = (float(scalarValue7) / intermediateValue22) * 6.283185482025146484375f;
                    productValue6 = productValue5 * productValue5;
                    sumValue3 = productValue6 + (-1.0f);
                    float nonlinearValue = sqrt((1.0f - bitwiseValue4) / ((bitwiseValue4 * sumValue3) + 1.0f));
                    float nonlinearValue1 = sqrt(1.0f - (nonlinearValue * nonlinearValue));
                    float wavePhaseValue = cos(quotientValue1) * nonlinearValue1;
                    float wavePhaseValue1 = sin(quotientValue1) * nonlinearValue1;
                    bool conditionValue = abs(productValue4) < 0.999000012874603271484375f;
                    float comparisonValue = conditionValue ? 0.0f : 1.0f;
                    float scalarValue8 = float(conditionValue);
                    float productValue7 = (-0.0f) - (productValue3 * scalarValue8);
                    float productValue8 = (scalarValue8 * productValue2) - (comparisonValue * productValue4);
                    float productValue9 = comparisonValue * productValue3;
                    float inverseLengthValue1 = rsqrt(dot(float3(productValue7, productValue8, productValue9), float3(productValue7, productValue8, productValue9)));
                    float productValue10 = inverseLengthValue1 * productValue7;
                    float productValue11 = productValue8 * inverseLengthValue1;
                    float productValue12 = productValue9 * inverseLengthValue1;
                    float productValue13 = ((productValue10 * wavePhaseValue) + (nonlinearValue * productValue2)) + (((productValue12 * productValue3) - (productValue11 * productValue4)) * wavePhaseValue1);
                    float productValue14 = ((productValue11 * wavePhaseValue) + (nonlinearValue * productValue3)) + (((productValue10 * productValue4) - (productValue12 * productValue2)) * wavePhaseValue1);
                    float productValue15 = ((productValue12 * wavePhaseValue) + (nonlinearValue * productValue4)) + (((productValue11 * productValue2) - (productValue10 * productValue3)) * wavePhaseValue1);
                    dotProductValue = dot(float3(productValue2, productValue3, productValue4), float3(productValue13, productValue14, productValue15));
                    float productValue16 = dotProductValue * 2.0f;
                    float productValue17 = (productValue13 * productValue16) - productValue2;
                    float productValue18 = (productValue14 * productValue16) - productValue3;
                    float productValue19 = (productValue15 * productValue16) - productValue4;
                    float inverseLengthValue2 = rsqrt(dot(float3(productValue17, productValue18, productValue19), float3(productValue17, productValue18, productValue19)));
                    productValue20 = productValue17 * inverseLengthValue2;
                    productValue21 = productValue18 * inverseLengthValue2;
                    productValue22 = productValue19 * inverseLengthValue2;
                    clampedValue = clamp(dot(float3(productValue2, productValue3, productValue4), float3(productValue20, productValue21, productValue22)), 0.0f, 1.0f);
                    intermediateValue25 = clampedValue > 0.0f;
                    float branchMergedValue;
                    float branchMergedValue1;
                    float branchMergedValue2;
                    float branchMergedValue3;
                    if (intermediateValue25)
                    {
                        float scalarValue9 = max(dotProductValue, 0.0f);
                        float productValue23 = ((scalarValue9 * scalarValue9) * sumValue3) + 1.0f;
                        float4 sampledTextureValue = cubeMapTexture.SampleLevel(cubeMapSampler, float3(productValue20, productValue21, productValue22), max(log2(1.0f / (((intermediateValue22 * 0.249993741512298583984375f) * (productValue6 / ((productValue23 * productValue23) * 3.1415927410125732421875f))) * (2.094395160675048828125f / (scalarValue1 * scalarValue1)))) * 0.5f, 0.0f));
                        branchMergedValue = clampedValue + scalarValue3;
                        branchMergedValue1 = (sampledTextureValue.x * clampedValue) + scalarValue4;
                        branchMergedValue2 = (sampledTextureValue.y * clampedValue) + scalarValue5;
                        branchMergedValue3 = (sampledTextureValue.z * clampedValue) + scalarValue6;
                    }
                    else
                    {
                        branchMergedValue = scalarValue3;
                        branchMergedValue1 = scalarValue4;
                        branchMergedValue2 = scalarValue5;
                        branchMergedValue3 = scalarValue6;
                    }
                    intermediateValue9 = branchMergedValue;
                    intermediateValue11 = branchMergedValue1;
                    intermediateValue13 = branchMergedValue2;
                    intermediateValue15 = branchMergedValue3;
                    uint sumValue2 = scalarValue7 + 1u;
                    if (sumValue2 == scalarValue2)
                    {
                        break;
                    }
                    else
                    {
                        scalarValue3 = intermediateValue9;
                        scalarValue4 = intermediateValue11;
                        scalarValue5 = intermediateValue13;
                        scalarValue6 = intermediateValue15;
                        scalarValue7 = sumValue2;
                        continue;
                    }
                }
                intermediateValue8 = intermediateValue9;
                intermediateValue10 = intermediateValue11;
                intermediateValue12 = intermediateValue13;
                intermediateValue14 = intermediateValue15;
            }
            else
            {
                intermediateValue8 = 0.0f;
                intermediateValue10 = 0.0f;
                intermediateValue12 = 0.0f;
                intermediateValue14 = 0.0f;
            }
            float scalarValue10 = max(0.001000000047497451305389404296875f, intermediateValue8);
            branchMergedValue4 = intermediateValue10 / scalarValue10;
            branchMergedValue5 = intermediateValue12 / scalarValue10;
            branchMergedValue6 = intermediateValue14 / scalarValue10;
        }
        intermediateValue5 = branchMergedValue4;
        intermediateValue6 = branchMergedValue5;
        intermediateValue7 = branchMergedValue6;
    }
    else
    {
        float4 sampledTextureValue1 = cubeMapTexture.SampleLevel(cubeMapSampler, float3(productValue2, productValue3, productValue4), float(int(scalarValue)));
        intermediateValue5 = sampledTextureValue1.x;
        intermediateValue6 = sampledTextureValue1.y;
        intermediateValue7 = sampledTextureValue1.z;
    }
    fragmentColor0.x = intermediateValue5;
    fragmentColor0.y = intermediateValue6;
    fragmentColor0.z = intermediateValue7;
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
