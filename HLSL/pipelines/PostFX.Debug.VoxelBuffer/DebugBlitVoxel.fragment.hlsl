// PostFX.Debug.VoxelBuffer / DebugBlitVoxel / fragment forward pipeline.
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


#include "../../include/materials/PostFX.Debug.VoxelBuffer/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).x;
  workingVector0.yz = varyingTexCoord0.xy * float2(1,-1) + float2(0,1);
  workingVector0.yz = workingVector0.yz * float2(2,2) + float2(-1,-1);
  workingVector0.y = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector0.y;
  workingVector0.z = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector0.z;
  workingVector0.x = workingVector0.x * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
  workingVector0.yz = workingVector0.yz / workingVector0.xx;
  workingVector0.x = RD_UNIFORM_INV_PROJ_ROW_3.z / workingVector0.x;
  workingVector1.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector0.zzz;
  workingVector0.yzw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector0.yyy + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector0.xxx + workingVector0.yzw;
  workingVector0.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector0.xyz;
  workingVector0.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector0.xyz;
  workingVector1.xy = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xy;
  workingVector2.xyz = float3(1,1,1) + -abs(workingVector1.xyx);
  workingVector3.z = workingVector2.x + -abs(workingVector1.y);
  workingVector0.w = RD_COMPARISON_MASK(workingVector3.z < 0);
  workingVector1.zw = RD_COMPARISON_MASK(workingVector1.xy >= float2(0,0));
  workingVector1.zw = workingVector1.zw ? float2(1,1) : 0;
  workingVector1.zw = workingVector1.zw * float2(2,2) + float2(-1,-1);
  workingVector1.zw = workingVector2.yz * workingVector1.zw;
  workingVector3.xy = workingVector0.ww ? workingVector1.zw : workingVector1.xy;
  workingVector0.w = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = workingVector3.xyz * workingVector0.www;
  workingVector0.xyz = workingVector1.xyz * float3(0.200000003,0.200000003,0.200000003) + workingVector0.xyz;
  workingVector1.xyz = float3(0.0625,0.0625,0.0625) * workingVector0.xyz;
  workingVector1.xyz = floor(workingVector1.xyz);
  workingVector2.xyz = floor(workingVector0.xyz);
  workingVector2.xyz = float3(0.0625,0.0625,0.0625) * workingVector2.xyz;
  workingVector2.xyz = floor(workingVector2.xyz);
  workingVector2.xyz = (int3)workingVector2.xyz;
  workingVector0.w = (int)RD_UNIFORM_VOLUME_LAYER.x;
  bitMask.w = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector1.w = (((uint)workingVector2.y << 16) & bitMask.w) | ((uint)workingVector2.x & ~bitMask.w);
  bitMask.w = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector2.w = (((uint)workingVector0.w << 16) & bitMask.w) | ((uint)workingVector2.z & ~bitMask.w);
  workingVector2.xyz = (int3)workingVector2.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
  workingVector0.w = (int)workingVector0.w * 0x5bd1e995;
  workingVector3.xyz = (uint3)workingVector2.xyz >> int3(24,24,24);
  workingVector2.xyz = (int3)workingVector2.xyz ^ (int3)workingVector3.xyz;
  workingVector2.xyz = (int3)workingVector2.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
  workingVector3.x = (uint)workingVector0.w >> 24;
  workingVector0.w = (int)workingVector0.w ^ (int)workingVector3.x;
  workingVector0.w = (int)workingVector0.w * 0x5bd1e995;
  workingVector2.x = (int)workingVector2.x ^ 0x88b16480;
  workingVector2.x = (int)workingVector2.x * 0x5bd1e995;
  workingVector2.x = (int)workingVector2.y ^ (int)workingVector2.x;
  workingVector2.x = (int)workingVector2.x * 0x5bd1e995;
  workingVector2.x = (int)workingVector2.z ^ (int)workingVector2.x;
  workingVector2.x = (int)workingVector2.x * 0x5bd1e995;
  workingVector0.w = (int)workingVector0.w ^ (int)workingVector2.x;
  workingVector2.x = (uint)workingVector0.w >> 13;
  workingVector0.w = (int)workingVector0.w ^ (int)workingVector2.x;
  workingVector0.w = (int)workingVector0.w * 0x5bd1e995;
  workingVector2.x = (uint)workingVector0.w >> 15;
  workingVector0.w = (int)workingVector0.w ^ (int)workingVector2.x;
  workingVector2.x = (uint)workingVector0.w >> 16;
  workingVector0.w = (int)workingVector0.w ^ (int)workingVector2.x;
  workingVector0.w = (int)workingVector0.w & 0x0000ffff;
  workingVector2.x = workingVector0.w ? 0 : 1;
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  workingVector2.x = (uint)RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x;
  workingVector2.x = (int)workingVector2.x + -1;
  workingVector2.y = (int)workingVector0.w & (int)workingVector2.x;
  workingVector3.x = workingVector2.y;
  workingVector3.yzw = float3(0,0,0);
  while (true) {
    workingVector2.z = RD_COMPARISON_MASK((int)workingVector3.y >= 8);
    if (workingVector2.z != 0) break;
    workingVector4.x = sampledResource6[workingVector3.x].val[0/4];
    workingVector4.y = sampledResource6[workingVector3.x].val[0/4+1];
    workingVector4.z = sampledResource6[workingVector3.x].val[0/4+2];
    workingVector4.w = sampledResource6[workingVector3.x].val[0/4+3];
    workingVector2.z = (int)workingVector4.z & 0x0000ffff;
    workingVector4.z = RD_COMPARISON_MASK((int)workingVector2.z == 0);
    workingVector2.z = RD_COMPARISON_MASK((int)workingVector0.w == (int)workingVector2.z);
    workingVector4.x = RD_COMPARISON_MASK((int)workingVector1.w == (int)workingVector4.x);
    workingVector2.z = workingVector2.z ? workingVector4.x : 0;
    workingVector4.x = RD_COMPARISON_MASK((int)workingVector2.w == (int)workingVector4.y);
    workingVector2.z = workingVector2.z ? workingVector4.x : 0;
    workingVector4.x = workingVector2.z ? workingVector4.w : workingVector3.z;
    workingVector4.x = workingVector3.w ? workingVector3.z : workingVector4.x;
    workingVector4.y = (int)workingVector2.z | (int)workingVector3.w;
    workingVector2.z = (int)workingVector3.x + 1;
    workingVector3.x = (int)workingVector2.x & (int)workingVector2.z;
    workingVector2.z = (int)workingVector4.z | (int)workingVector4.y;
    if (workingVector2.z != 0) {
      workingVector3.zw = workingVector4.xy;
      break;
    }
    workingVector3.y = (int)workingVector3.y + 1;
    workingVector3.zw = workingVector4.xy;
  }
  workingVector0.w = (uint)workingVector3.z >> 2;
  workingVector0.xyz = -workingVector1.xyz * float3(16,16,16) + workingVector0.xyz;
  workingVector0.xyz = floor(workingVector0.xyz);
  workingVector0.xyz = (uint3)workingVector0.xyz;
  bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector0.x = (((uint)workingVector0.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
  bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector0.z = (((uint)workingVector0.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
  bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector0.x = (((uint)workingVector0.y << 0) & bitMask.x) | ((uint)workingVector0.x & ~bitMask.x);
  workingVector0.x = (int)workingVector0.z + (int)workingVector0.x;
  workingVector0.x = (int)workingVector0.x + (int)workingVector0.w;
  workingVector0.x = sampledResource7[workingVector0.x].val[0/4];
  workingVector0.yzw = (uint3)workingVector0.xxx >> int3(8,16,24);
  workingVector1.xyzw = (int4)workingVector0.xyzw & int4(255,255,255,255);
  workingVector1.xyzw = (uint4)workingVector1.xyzw;
  workingVector1.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector1.xyzw;
  workingVector0.yzw = workingVector1.xyz * workingVector1.www;
  workingVector0.yzw = float3(6,6,6) * workingVector0.yzw;
  workingVector0.xyz = workingVector0.xxx ? workingVector0.yzw : float3(0,0,0);
  workingVector0.xyz = (int3)workingVector0.xyz & (int3)workingVector3.www;
  workingVector0.xyz = log2(workingVector0.xyz);
  workingVector0.xyz = float3(0.454545468,0.454545468,0.454545468) * workingVector0.xyz;
  fragmentColor0.xyz = exp2(workingVector0.xyz);
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = rasterColorTexture.Sample(rasterColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = (sampledTextureValue.x * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue = (((varyingTexCoord0.x * 2.0f) + (-1.0f)) * RD_UNIFORM_INV_PROJ_ROW_0.x) / productValue;
    float quotientValue1 = ((((1.0f - varyingTexCoord0.y) * 2.0f) + (-1.0f)) * RD_UNIFORM_INV_PROJ_ROW_1.y) / productValue;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue;
    float4 sampledTextureValue1 = normalTexture.Sample(normalSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float sumValue = 1.0f - abs(scalarValue);
    float scalarValue2 = abs(scalarValue1);
    float sumValue1 = sumValue - scalarValue2;
    bool conditionValue = sumValue1 < 0.0f;
    float comparisonValue = conditionValue ? ((1.0f - scalarValue2) * ((scalarValue < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue;
    float comparisonValue1 = conditionValue ? (((scalarValue1 < 0.0f) ? (-1.0f) : 1.0f) * sumValue) : scalarValue1;
    float inverseLengthValue = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue1), float3(comparisonValue, comparisonValue1, sumValue1))) * 0.20000000298023223876953125f;
    float multiplyAddValue = ((mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x) - RD_UNIFORM_WORLD_ORIGIN.x) + (inverseLengthValue * comparisonValue);
    float multiplyAddValue1 = ((mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y) - RD_UNIFORM_WORLD_ORIGIN.y) + (inverseLengthValue * comparisonValue1);
    float multiplyAddValue2 = ((mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z) - RD_UNIFORM_WORLD_ORIGIN.z) + (inverseLengthValue * sumValue1);
    uint productValue1 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue))))) * 0.0625f)));
    uint productValue2 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue1))))) * 0.0625f)));
    uint productValue3 = uint(int(floor(float(int(uint(int(floor(multiplyAddValue2))))) * 0.0625f)));
    uint scalarValue3 = uint(int(RD_UNIFORM_VOLUME_LAYER.x));
    uint bitwiseValue = (productValue2 << 16u) | (productValue1 & 65535u);
    uint bitwiseValue1 = (scalarValue3 << 16u) | (productValue3 & 65535u);
    uint productValue4 = productValue1 * 1540483477u;
    uint productValue5 = productValue2 * 1540483477u;
    uint productValue6 = productValue3 * 1540483477u;
    uint productValue7 = scalarValue3 * 1540483477u;
    uint bitwiseValue2 = (((((((((productValue4 >> 24u) ^ productValue4) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue5 >> 24u) ^ productValue5) * 1540483477u)) * 1540483477u) ^ (((productValue6 >> 24u) ^ productValue6) * 1540483477u)) * 1540483477u) ^ (((productValue7 >> 24u) ^ productValue7) * 1540483477u);
    uint bitwiseValue3 = ((bitwiseValue2 >> 13u) ^ bitwiseValue2) * 1540483477u;
    uint bitwiseValue4 = (bitwiseValue3 >> 15u) ^ bitwiseValue3;
    uint bitwiseValue5 = bitwiseValue4 >> 16u;
    uint bitwiseValue6 = bitwiseValue4 & 65535u;
    uint comparisonValue2 = uint(bitwiseValue6 == bitwiseValue5) | (bitwiseValue6 ^ bitwiseValue5);
    uint sumValue2 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) + 4294967295u;
    bool intermediateValue8;
    uint scalarValue4 = comparisonValue2;
    uint scalarValue5 = 0u;
    uint scalarValue6 = 0u;
    uint loadedBufferValue;
    uint bitwiseValue7;
    for (;;)
    {
        bitwiseValue7 = scalarValue4 & sumValue2;
        uint loadedBufferValue1 = rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 2u).x & 65535u;
        bool loadedBufferValue2 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue1) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue) && (loadedBufferValue1 == comparisonValue2));
        loadedBufferValue = loadedBufferValue2 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue5;
        if ((loadedBufferValue1 == 0u) || loadedBufferValue2)
        {
            intermediateValue8 = loadedBufferValue2;
            break;
        }
        else
        {
            uint sumValue3 = scalarValue6 + 1u;
            if (int(sumValue3) < int(8u))
            {
                scalarValue4 = bitwiseValue7 + 1u;
                scalarValue5 = loadedBufferValue;
                scalarValue6 = sumValue3;
                continue;
            }
            else
            {
                intermediateValue8 = false;
                break;
            }
        }
    }
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    if (intermediateValue8)
    {
        uint4 loadedBufferValue3 = rdLoad_voxelBuffer(((((uint(floor(multiplyAddValue - (floor(multiplyAddValue * 0.0625f) * 16.0f))) << 8u) & 3840u) | (uint(floor(multiplyAddValue1 - (floor(multiplyAddValue1 * 0.0625f) * 16.0f))) & 15u)) | ((uint(floor(multiplyAddValue2 - (floor(multiplyAddValue2 * 0.0625f) * 16.0f))) << 4u) & 240u)) + (loadedBufferValue >> 2u));
        uint scalarValue7 = loadedBufferValue3.x;
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (scalarValue7 == 0u)
        {
            branchMergedValue = 0.0f;
            branchMergedValue1 = 0.0f;
            branchMergedValue2 = 0.0f;
        }
        else
        {
            float bitwiseValue8 = float(scalarValue7 >> 24u) * 9.2272217443678528070449829101562e-05f;
            branchMergedValue = bitwiseValue8 * float(scalarValue7 & 255u);
            branchMergedValue1 = bitwiseValue8 * float((scalarValue7 >> 8u) & 255u);
            branchMergedValue2 = bitwiseValue8 * float((scalarValue7 >> 16u) & 255u);
        }
        intermediateValue10 = branchMergedValue;
        intermediateValue11 = branchMergedValue1;
        intermediateValue12 = branchMergedValue2;
    }
    else
    {
        intermediateValue10 = 0.0f;
        intermediateValue11 = 0.0f;
        intermediateValue12 = 0.0f;
    }
    fragmentColor0.x = exp2(log2(intermediateValue10) * 0.4545454680919647216796875f);
    fragmentColor0.y = exp2(log2(intermediateValue11) * 0.4545454680919647216796875f);
    fragmentColor0.z = exp2(log2(intermediateValue12) * 0.4545454680919647216796875f);
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
