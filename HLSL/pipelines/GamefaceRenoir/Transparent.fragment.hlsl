// GamefaceRenoir / Transparent / fragment forward pipeline.
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


#include "../../include/materials/GamefaceRenoir/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord1 : TEXCOORD1,
  float4 varyingTexCoord4 : TEXCOORD4,
  float4 varyingTexCoord2 : TEXCOORD2,
  nointerpolation float4 varyingTexCoord3 : TEXCOORD3,
  float4 varyingTexCoord5 : TEXCOORD5,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = (uint2)varyingTexCoord3.yz;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.y = (uint)workingVector0.y << 4;
  workingVector0.x = (uint)workingVector0.x >> 4;
  workingVector0.x = (int)workingVector0.x & 15;
  workingVector0.x = (int)workingVector0.x + (int)workingVector0.y;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  if (4 == 0) workingVector0.x = 0; else if (4+4 < 32) {   workingVector0.x = (uint)workingVector0.x << (32-(4 + 4)); workingVector0.x = (uint)workingVector0.x >> (32-4);  } else workingVector0.x = (uint)workingVector0.x >> 4;
  bitMask.x = ((~(-1 << 28)) << 4) & 0xffffffff;  workingVector0.x = (((uint)workingVector0.y << 4) & bitMask.x) | ((uint)workingVector0.x & ~bitMask.x);
#endif
  workingVector0.yz = (int2)fragmentVectorConstants1[workingVector0.x+0].yx;
  workingVector0.w = dot(varyingTexCoord5.xy, varyingTexCoord5.xy);
  workingVector0.w = sqrt(workingVector0.w);
  workingVector1.xyzw = (int4)workingVector0.yyyy & int4(2,4,8,256);
  workingVector2.x = min(abs(varyingTexCoord5.y), abs(varyingTexCoord5.x));
  workingVector2.y = max(abs(varyingTexCoord5.y), abs(varyingTexCoord5.x));
  workingVector2.y = 1 / workingVector2.y;
  workingVector2.x = workingVector2.x * workingVector2.y;
  workingVector2.y = workingVector2.x * workingVector2.x;
  workingVector2.z = workingVector2.y * 0.0208350997 + -0.0851330012;
  workingVector2.z = workingVector2.y * workingVector2.z + 0.180141002;
  workingVector2.z = workingVector2.y * workingVector2.z + -0.330299497;
  workingVector2.y = workingVector2.y * workingVector2.z + 0.999866009;
  workingVector2.z = workingVector2.x * workingVector2.y;
  workingVector2.w = RD_COMPARISON_MASK(abs(varyingTexCoord5.x) < abs(varyingTexCoord5.y));
  workingVector2.z = workingVector2.z * -2 + 1.57079637;
  workingVector2.z = workingVector2.w ? workingVector2.z : 0;
  workingVector2.x = workingVector2.x * workingVector2.y + workingVector2.z;
  workingVector2.y = RD_COMPARISON_MASK(varyingTexCoord5.x < -varyingTexCoord5.x);
  workingVector2.y = workingVector2.y ? -3.141593 : 0;
  workingVector2.x = workingVector2.x + workingVector2.y;
  workingVector2.y = min(varyingTexCoord5.y, varyingTexCoord5.x);
  workingVector2.z = max(varyingTexCoord5.y, varyingTexCoord5.x);
  workingVector2.y = RD_COMPARISON_MASK(workingVector2.y < -workingVector2.y);
  workingVector2.z = RD_COMPARISON_MASK(workingVector2.z >= -workingVector2.z);
  workingVector2.y = workingVector2.z ? workingVector2.y : 0;
  workingVector2.x = workingVector2.y ? -workingVector2.x : workingVector2.x;
  workingVector2.x = 3.14159274 + workingVector2.x;
  workingVector2.x = 0.159154937 * workingVector2.x;
  workingVector1.z = workingVector1.z ? workingVector2.x : 0;
  workingVector0.w = workingVector1.y ? workingVector0.w : workingVector1.z;
  workingVector0.w = workingVector1.x ? varyingTexCoord5.x : workingVector0.w;
  workingVector1.x = frac(workingVector0.w);
  workingVector2.xyz = (int3)workingVector0.yyy & int3(512,16,128);
  workingVector1.y = 0.5 * workingVector0.w;
  workingVector1.y = frac(workingVector1.y);
  workingVector1.z = workingVector1.y + workingVector1.y;
  workingVector2.w = RD_COMPARISON_MASK(workingVector1.y < 0.5);
  workingVector1.y = -workingVector1.y * 2 + 2;
  workingVector1.y = workingVector2.w ? workingVector1.z : workingVector1.y;
  workingVector0.w = workingVector2.x ? workingVector1.y : workingVector0.w;
  workingVector0.w = workingVector1.w ? workingVector1.x : workingVector0.w;
  if (workingVector2.y != 0) {
    workingVector1.x = (int)workingVector0.z + 1;
    workingVector0.w = saturate(workingVector0.w);
    workingVector1.xyzw = fragmentVectorConstants1[workingVector1.x+0].xyzw + -fragmentVectorConstants1[workingVector0.z+0].xyzw;
    workingVector1.xyzw = workingVector0.wwww * workingVector1.xyzw + fragmentVectorConstants1[workingVector0.z+0].xyzw;
  } else {
    workingVector2.x = (int)workingVector0.y & 32;
    if (workingVector2.x != 0) {
      workingVector2.x = -workingVector0.w * 2 + 1;
      workingVector2.y = saturate(workingVector2.x);
      workingVector2.w = min(1, abs(workingVector2.x));
      workingVector2.w = 1 + -workingVector2.w;
      workingVector3.xy = (int2)workingVector0.zz + int2(1,2);
      workingVector4.xyzw = fragmentVectorConstants1[workingVector3.x+0].xyzw * workingVector2.wwww;
      workingVector4.xyzw = workingVector2.yyyy * fragmentVectorConstants1[workingVector0.z+0].xyzw + workingVector4.xyzw;
      workingVector2.x = saturate(-workingVector2.x);
      workingVector1.xyzw = workingVector2.xxxx * fragmentVectorConstants1[workingVector3.y+0].xyzw + workingVector4.xyzw;
    } else {
      workingVector2.x = (int)workingVector0.y & 64;
      if (workingVector2.x != 0) {
        workingVector2.x = workingVector0.w * RD_UNIFORM_UV_TRANSFORM_ROW_2.z + RD_UNIFORM_UV_TRANSFORM_ROW_2.x;
        workingVector2.y = fragmentVectorConstants1[workingVector0.z+0].x * RD_UNIFORM_UV_TRANSFORM_ROW_2.w + RD_UNIFORM_UV_TRANSFORM_ROW_2.y;
        workingVector1.xyzw = materialTexture2.Sample(textureSampler2, workingVector2.xy).xyzw;
      } else {
        workingVector0.y = (int)workingVector0.y & 1;
        if (workingVector0.y != 0) {
          workingVector0.yz = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
          workingVector1.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.yz).xyzw;
        } else {
          workingVector1.xyzw = float4(0,0,0,0);
        }
      }
    }
  }
  if (workingVector2.z != 0) {
    workingVector0.y = (int)workingVector0.x + 1;
    workingVector0.yz = varyingTexCoord2.xy * fragmentVectorConstants1[workingVector0.y+0].xy + fragmentVectorConstants1[workingVector0.y+0].zw;
    workingVector0.yz = workingVector0.yz * RD_UNIFORM_UV_TRANSFORM_ROW_1.zw + RD_UNIFORM_UV_TRANSFORM_ROW_1.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.yz).xyzw;
    workingVector1.xyzw = workingVector2.wwww * workingVector1.xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector0.y = materialTexture1.Sample(textureSampler1, workingVector0.yz).w;
    workingVector1.xyzw = workingVector1.xyzw * workingVector0.yyyy;
#endif
  }
  workingVector0.xyzw = fragmentVectorConstants1[workingVector0.x+0].wwww * workingVector1.xyzw;
  workingVector1.x = saturate(varyingTexCoord1.z);
  fragmentColor0.xyzw = workingVector1.xxxx * workingVector0.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    uint bitwiseValue = (uint(varyingTexCoord3.z) << 4u) | ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue = bitwiseValue + 1u;
    uint scalarValue = uint(int(fragmentConstants[bitwiseValue].y));
    uint scalarValue1 = uint(int(fragmentConstants[bitwiseValue].x));
    float intermediateValue2;
    if ((scalarValue & 2u) == 0u)
    {
        float branchMergedValue;
        if ((scalarValue & 4u) == 0u)
        {
            float branchMergedValue6;
            if ((scalarValue & 8u) == 0u)
            {
                branchMergedValue6 = 0.0f;
            }
            else
            {
                float quotientValue = atan(varyingTexCoord5.y / varyingTexCoord5.x);
                bool conditionValue = varyingTexCoord5.x < 0.0f;
                bool comparisonValue = varyingTexCoord5.x == 0.0f;
                bool comparisonValue1 = varyingTexCoord5.y >= 0.0f;
                bool conditionValue1 = varyingTexCoord5.y < 0.0f;
                branchMergedValue6 = (comparisonValue && comparisonValue1) ? 0.75f : ((comparisonValue && conditionValue1) ? 0.25f : ((((conditionValue && conditionValue1) ? (quotientValue + (-3.1415927410125732421875f)) : ((conditionValue && comparisonValue1) ? (quotientValue + 3.1415927410125732421875f) : quotientValue)) + 3.1415927410125732421875f) * 0.15915493667125701904296875f));
            }
            branchMergedValue = branchMergedValue6;
        }
        else
        {
            branchMergedValue = sqrt((varyingTexCoord5.y * varyingTexCoord5.y) + (varyingTexCoord5.x * varyingTexCoord5.x));
        }
        intermediateValue2 = branchMergedValue;
    }
    else
    {
        intermediateValue2 = varyingTexCoord5.x;
    }
    float intermediateValue5;
    if ((scalarValue & 256u) == 0u)
    {
        float branchMergedValue1;
        if ((scalarValue & 512u) == 0u)
        {
            branchMergedValue1 = intermediateValue2;
        }
        else
        {
            float productValue = frac(intermediateValue2 * 0.5f) * 2.0f;
            branchMergedValue1 = (productValue < 1.0f) ? productValue : (2.0f - productValue);
        }
        intermediateValue5 = branchMergedValue1;
    }
    else
    {
        intermediateValue5 = frac(intermediateValue2);
    }
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue & 16u) == 0u)
    {
        float branchMergedValue2;
        float branchMergedValue3;
        float branchMergedValue4;
        float branchMergedValue5;
        if ((scalarValue & 32u) == 0u)
        {
            float branchMergedValue7;
            float branchMergedValue8;
            float branchMergedValue9;
            float branchMergedValue10;
            if ((scalarValue & 64u) == 0u)
            {
                float branchMergedValue11;
                float branchMergedValue12;
                float branchMergedValue13;
                float branchMergedValue14;
                if ((scalarValue & 1u) == 0u)
                {
                    branchMergedValue11 = 0.0f;
                    branchMergedValue12 = 0.0f;
                    branchMergedValue13 = 0.0f;
                    branchMergedValue14 = 0.0f;
                }
                else
                {
                    float4 sampledTextureValue = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                    branchMergedValue11 = sampledTextureValue.x;
                    branchMergedValue12 = sampledTextureValue.y;
                    branchMergedValue13 = sampledTextureValue.z;
                    branchMergedValue14 = sampledTextureValue.w;
                }
                branchMergedValue7 = branchMergedValue11;
                branchMergedValue8 = branchMergedValue12;
                branchMergedValue9 = branchMergedValue13;
                branchMergedValue10 = branchMergedValue14;
            }
            else
            {
                float4 sampledTextureValue1 = txBuffer2Texture.Sample(txBuffer2Sampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_2.z * intermediateValue5) + RD_UNIFORM_UV_TRANSFORM_ROW_2.x, (RD_UNIFORM_UV_TRANSFORM_ROW_2.w * fragmentConstants[scalarValue1].x) + RD_UNIFORM_UV_TRANSFORM_ROW_2.y));
                branchMergedValue7 = sampledTextureValue1.x;
                branchMergedValue8 = sampledTextureValue1.y;
                branchMergedValue9 = sampledTextureValue1.z;
                branchMergedValue10 = sampledTextureValue1.w;
            }
            branchMergedValue2 = branchMergedValue7;
            branchMergedValue3 = branchMergedValue8;
            branchMergedValue4 = branchMergedValue9;
            branchMergedValue5 = branchMergedValue10;
        }
        else
        {
            float productValue1 = 1.0f - (intermediateValue5 * 2.0f);
            float scalarValue2 = min(max(productValue1, 0.0f), 1.0f);
            float sumValue1 = 1.0f - min(abs(productValue1), 1.0f);
            uint sumValue2 = scalarValue1 + 1u;
            float sumValue3 = min(max((-0.0f) - productValue1, 0.0f), 1.0f);
            uint sumValue4 = scalarValue1 + 2u;
            branchMergedValue2 = ((fragmentConstants[sumValue2].x * sumValue1) + (fragmentConstants[scalarValue1].x * scalarValue2)) + (fragmentConstants[sumValue4].x * sumValue3);
            branchMergedValue3 = ((fragmentConstants[sumValue2].y * sumValue1) + (fragmentConstants[scalarValue1].y * scalarValue2)) + (fragmentConstants[sumValue4].y * sumValue3);
            branchMergedValue4 = ((fragmentConstants[sumValue2].z * sumValue1) + (fragmentConstants[scalarValue1].z * scalarValue2)) + (fragmentConstants[sumValue4].z * sumValue3);
            branchMergedValue5 = ((fragmentConstants[sumValue2].w * sumValue1) + (fragmentConstants[scalarValue1].w * scalarValue2)) + (fragmentConstants[sumValue4].w * sumValue3);
        }
        intermediateValue7 = branchMergedValue2;
        intermediateValue8 = branchMergedValue3;
        intermediateValue9 = branchMergedValue4;
        intermediateValue10 = branchMergedValue5;
    }
    else
    {
        float clampedValue = clamp(intermediateValue5, 0.0f, 1.0f);
        uint sumValue5 = scalarValue1 + 1u;
        intermediateValue7 = ((fragmentConstants[sumValue5].x - fragmentConstants[scalarValue1].x) * clampedValue) + fragmentConstants[scalarValue1].x;
        intermediateValue8 = ((fragmentConstants[sumValue5].y - fragmentConstants[scalarValue1].y) * clampedValue) + fragmentConstants[scalarValue1].y;
        intermediateValue9 = ((fragmentConstants[sumValue5].z - fragmentConstants[scalarValue1].z) * clampedValue) + fragmentConstants[scalarValue1].z;
        intermediateValue10 = ((fragmentConstants[sumValue5].w - fragmentConstants[scalarValue1].w) * clampedValue) + fragmentConstants[scalarValue1].w;
    }
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((scalarValue & 128u) == 0u)
    {
        intermediateValue11 = intermediateValue7;
        intermediateValue12 = intermediateValue8;
        intermediateValue13 = intermediateValue9;
        intermediateValue14 = intermediateValue10;
    }
    else
    {
        float4 sampledTextureValue2 = txBuffer1Texture.Sample(txBuffer1Sampler, float2((((fragmentConstants[sumValue].x * varyingTexCoord2.x) + fragmentConstants[sumValue].z) * RD_UNIFORM_UV_TRANSFORM_ROW_1.z) + RD_UNIFORM_UV_TRANSFORM_ROW_1.x, (((fragmentConstants[sumValue].y * varyingTexCoord2.y) + fragmentConstants[sumValue].w) * RD_UNIFORM_UV_TRANSFORM_ROW_1.w) + RD_UNIFORM_UV_TRANSFORM_ROW_1.y));
        float scalarValue3 = sampledTextureValue2.w;
        intermediateValue11 = scalarValue3 * intermediateValue7;
        intermediateValue12 = scalarValue3 * intermediateValue8;
        intermediateValue13 = scalarValue3 * intermediateValue9;
        intermediateValue14 = scalarValue3 * intermediateValue10;
    }
    float clampedValue1 = clamp(varyingTexCoord1.z, 0.0f, 1.0f) * fragmentConstants[bitwiseValue].w;
    fragmentColor0.x = clampedValue1 * intermediateValue11;
    fragmentColor0.y = clampedValue1 * intermediateValue12;
    fragmentColor0.z = clampedValue1 * intermediateValue13;
    fragmentColor0.w = clampedValue1 * intermediateValue14;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
