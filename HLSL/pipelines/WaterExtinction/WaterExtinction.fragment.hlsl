// WaterExtinction / WaterExtinction / fragment forward pipeline.
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


#include "../../include/materials/WaterExtinction/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).x;
  workingVector0.y = materialTexture4.Sample(textureSampler4, varyingTexCoord0.xy).x;
  workingVector1.x = RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x;
  workingVector1.y = RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y;
  workingVector1.w = workingVector0.x * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
  workingVector1.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
  workingVector2.xyzw = workingVector1.xyzw / workingVector1.wwww;
  workingVector1.w = workingVector0.y * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
  workingVector0.xyzw = workingVector1.xyzw / workingVector1.wwww;
  workingVector1.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_BIOME_BLENDING_PARAMETERS.x);
  if (workingVector1.x != 0) {
    workingVector1.yz = RD_UNIFORM_INV_VIEW_ROW_1.xz * workingVector0.yy;
    workingVector1.yz = RD_UNIFORM_INV_VIEW_ROW_0.xz * workingVector0.xx + workingVector1.yz;
    workingVector1.yz = RD_UNIFORM_INV_VIEW_ROW_2.xz * workingVector0.zz + workingVector1.yz;
    workingVector1.yz = RD_UNIFORM_INV_VIEW_ROW_3.xz + workingVector1.yz;
    workingVector1.w = 0.5 * RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z;
    workingVector1.w = (int)workingVector1.w;
    workingVector1.yz = -RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.xz + workingVector1.yz;
    workingVector1.yz = workingVector1.yz / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.ww;
    workingVector3.xy = floor(workingVector1.yz);
    workingVector3.xy = (int2)workingVector3.xy;
    workingVector3.xy = (int2)workingVector1.ww + (int2)workingVector3.xy;
    workingVector3.zw = (int2)RD_UNIFORM_BIOME_BLENDING_PARAMETERS.zw;
    workingVector1.w = (int)workingVector3.z + -1;
    workingVector3.xy = max(int2(0,0), (int2)workingVector3.xy);
    workingVector4.xy = min((int2)workingVector3.xy, (int2)workingVector1.ww);
    workingVector4.zw = float2(0,0);
    workingVector1.w = materialTexture0.Load(workingVector4.xyz).x;
    workingVector1.w = 255 * workingVector1.w;
    workingVector1.w = round(workingVector1.w);
    workingVector1.w = (int)workingVector1.w;
    workingVector3.x = RD_COMPARISON_MASK((int)workingVector1.w >= (int)workingVector3.w);
    workingVector1.w = workingVector3.x ? 0 : workingVector1.w;
    workingVector5.xyzw = (int4)workingVector4.xyxy + int4(0,1,1,0);
    workingVector6.xy = workingVector5.zw;
    workingVector6.zw = float2(0,0);
    workingVector3.x = materialTexture0.Load(workingVector6.xyz).x;
    workingVector3.x = 255 * workingVector3.x;
    workingVector3.x = round(workingVector3.x);
    workingVector3.x = (int)workingVector3.x;
    workingVector3.y = RD_COMPARISON_MASK((int)workingVector3.x >= (int)workingVector3.w);
    workingVector3.x = workingVector3.y ? 0 : workingVector3.x;
    workingVector5.zw = float2(0,0);
    workingVector3.y = materialTexture0.Load(workingVector5.xyz).x;
    workingVector3.y = 255 * workingVector3.y;
    workingVector3.y = round(workingVector3.y);
    workingVector3.y = (int)workingVector3.y;
    workingVector3.z = RD_COMPARISON_MASK((int)workingVector3.y >= (int)workingVector3.w);
    workingVector3.y = workingVector3.z ? 0 : workingVector3.y;
    workingVector4.xy = (int2)workingVector4.xy + int2(1,1);
    workingVector4.zw = float2(0,0);
    workingVector3.z = materialTexture0.Load(workingVector4.xyz).x;
    workingVector3.z = 255 * workingVector3.z;
    workingVector3.z = round(workingVector3.z);
    workingVector3.z = (int)workingVector3.z;
    workingVector3.w = RD_COMPARISON_MASK((int)workingVector3.z >= (int)workingVector3.w);
    workingVector3.z = workingVector3.w ? 0 : workingVector3.z;
    workingVector3.w = RD_COMPARISON_MASK((int)workingVector1.w == (int)workingVector3.x);
    workingVector4.x = RD_COMPARISON_MASK((int)workingVector3.y == (int)workingVector3.x);
    workingVector3.w = workingVector3.w ? workingVector4.x : 0;
    workingVector4.x = RD_COMPARISON_MASK((int)workingVector3.z == (int)workingVector3.y);
    workingVector3.w = workingVector3.w ? workingVector4.x : 0;
    if (workingVector3.w != 0) {
      workingVector4.x = sampledResource11[workingVector1.w].val[0/4];
      workingVector4.y = sampledResource11[workingVector1.w].val[0/4+1];
      workingVector4.z = sampledResource11[workingVector1.w].val[0/4+2];
    }
    if (workingVector3.w == 0) {
      workingVector5.x = sampledResource11[workingVector1.w].val[0/4];
      workingVector5.y = sampledResource11[workingVector1.w].val[0/4+1];
      workingVector5.z = sampledResource11[workingVector1.w].val[0/4+2];
      workingVector6.x = sampledResource11[workingVector3.x].val[0/4];
      workingVector6.y = sampledResource11[workingVector3.x].val[0/4+1];
      workingVector6.z = sampledResource11[workingVector3.x].val[0/4+2];
      workingVector3.x = sampledResource11[workingVector3.y].val[0/4];
      workingVector3.y = sampledResource11[workingVector3.y].val[0/4+1];
      workingVector3.w = sampledResource11[workingVector3.y].val[0/4+2];
      workingVector7.x = sampledResource11[workingVector3.z].val[0/4];
      workingVector7.y = sampledResource11[workingVector3.z].val[0/4+1];
      workingVector7.z = sampledResource11[workingVector3.z].val[0/4+2];
      workingVector1.yz = frac(workingVector1.yz);
      workingVector8.xy = float2(1,1) + -workingVector1.zy;
      workingVector1.w = workingVector8.y * workingVector8.x;
      workingVector8.xy = workingVector8.xy * workingVector1.yz;
      workingVector1.y = workingVector1.y * workingVector1.z;
      workingVector6.xyz = workingVector8.xxx * workingVector6.xyz;
      workingVector5.xyz = workingVector5.xyz * workingVector1.www + workingVector6.xyz;
      workingVector3.xyz = workingVector3.xyw * workingVector8.yyy + workingVector5.xyz;
      workingVector4.xyz = workingVector7.xyz * workingVector1.yyy + workingVector3.xyz;
    }
  }
  if (workingVector1.x == 0) {
    workingVector4.xyz = RD_UNIFORM_WATER_EXTINCTION_COEFFICIENTS.xyz;
  }
  workingVector1.x = dot(workingVector2.xyzw, workingVector2.xyzw);
  workingVector1.x = sqrt(workingVector1.x);
  workingVector1.x = min(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z, workingVector1.x);
  workingVector0.x = dot(workingVector0.xyzw, workingVector0.xyzw);
  workingVector0.x = sqrt(workingVector0.x);
  workingVector0.x = min(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z, workingVector0.x);
  workingVector0.x = workingVector1.x + -workingVector0.x;
  workingVector0.x = RD_UNIFORM_WATER_SURFACE_ENABLED_AND_EXTINCTION_DIST_SHIFT.y + workingVector0.x;
  workingVector0.xyz = -workingVector4.xyz * workingVector0.xxx;
  workingVector0.xyz = float3(1.44269502,1.44269502,1.44269502) * workingVector0.xyz;
  fragmentColor0.xyz = exp2(workingVector0.xyz);
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = sceneDepthTexture.Sample(sceneDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = waterDepthTexture.Sample(waterDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x;
    float productValue1 = RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y;
    float productValue2 = (sampledTextureValue.x * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue = productValue / productValue2;
    float quotientValue1 = productValue1 / productValue2;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue2;
    float productValue3 = (sampledTextureValue1.x * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue3 = productValue / productValue3;
    float quotientValue4 = productValue1 / productValue3;
    float quotientValue5 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (RD_UNIFORM_BIOME_BLENDING_PARAMETERS.x > 0.0f)
    {
        uint productValue4 = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z * 0.5f));
        float multiplyAddValue = ((mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue5, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x) - RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.x) / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w;
        float multiplyAddValue1 = ((mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue5, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z) - RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.z) / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w;
        uint sumValue = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z)) + 4294967295u;
        uint sumValue1 = uint(min(int(uint(max(int(uint(int(floor(multiplyAddValue))) + productValue4), int(0u)))), int(sumValue)));
        uint sumValue2 = uint(min(int(uint(max(int(uint(int(floor(multiplyAddValue1))) + productValue4), int(0u)))), int(sumValue)));
        uint loadedBufferValue = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue1, sumValue2), 0u)).x * 255.0f)));
        uint scalarValue = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.w));
        uint comparisonValue = (int(loadedBufferValue) >= int(scalarValue)) ? 0u : loadedBufferValue;
        uint sumValue3 = sumValue1 + 1u;
        uint loadedBufferValue1 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue3, sumValue2), 0u)).x * 255.0f)));
        uint comparisonValue1 = (int(loadedBufferValue1) >= int(scalarValue)) ? 0u : loadedBufferValue1;
        uint sumValue4 = sumValue2 + 1u;
        uint loadedBufferValue2 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue1, sumValue4), 0u)).x * 255.0f)));
        uint comparisonValue2 = (int(loadedBufferValue2) >= int(scalarValue)) ? 0u : loadedBufferValue2;
        uint loadedBufferValue3 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue3, sumValue4), 0u)).x * 255.0f)));
        uint comparisonValue3 = (int(loadedBufferValue3) >= int(scalarValue)) ? 0u : loadedBufferValue3;
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (((comparisonValue == comparisonValue1) && (comparisonValue1 == comparisonValue2)) && (comparisonValue2 == comparisonValue3))
        {
            uint scalarValue1 = comparisonValue * 20u;
            float3 loadedBufferValue4 = asfloat(uint3(rdLoad_zBiomeInfoBuffer(scalarValue1).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 1u).x, rdLoad_zBiomeInfoBuffer(scalarValue1 + 2u).x));
            branchMergedValue = loadedBufferValue4.x;
            branchMergedValue1 = loadedBufferValue4.y;
            branchMergedValue2 = loadedBufferValue4.z;
        }
        else
        {
            uint productValue5 = comparisonValue * 20u;
            float3 loadedBufferValue5 = asfloat(uint3(rdLoad_zBiomeInfoBuffer(productValue5).x, rdLoad_zBiomeInfoBuffer(productValue5 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue5 + 2u).x));
            uint productValue6 = comparisonValue1 * 20u;
            float3 loadedBufferValue6 = asfloat(uint3(rdLoad_zBiomeInfoBuffer(productValue6).x, rdLoad_zBiomeInfoBuffer(productValue6 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue6 + 2u).x));
            uint productValue7 = comparisonValue2 * 20u;
            float3 loadedBufferValue7 = asfloat(uint3(rdLoad_zBiomeInfoBuffer(productValue7).x, rdLoad_zBiomeInfoBuffer(productValue7 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue7 + 2u).x));
            uint productValue8 = comparisonValue3 * 20u;
            float3 loadedBufferValue8 = asfloat(uint3(rdLoad_zBiomeInfoBuffer(productValue8).x, rdLoad_zBiomeInfoBuffer(productValue8 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue8 + 2u).x));
            float scalarValue2 = frac(multiplyAddValue);
            float scalarValue3 = frac(multiplyAddValue1);
            float sumValue5 = 1.0f - scalarValue2;
            float sumValue6 = 1.0f - scalarValue3;
            float productValue9 = sumValue6 * sumValue5;
            float productValue10 = sumValue6 * scalarValue2;
            float productValue11 = sumValue5 * scalarValue3;
            float productValue12 = scalarValue3 * scalarValue2;
            branchMergedValue = (((productValue12 * loadedBufferValue8.x) + (productValue11 * loadedBufferValue7.x)) + (productValue10 * loadedBufferValue6.x)) + (productValue9 * loadedBufferValue5.x);
            branchMergedValue1 = (((productValue12 * loadedBufferValue8.y) + (productValue11 * loadedBufferValue7.y)) + (productValue10 * loadedBufferValue6.y)) + (productValue9 * loadedBufferValue5.y);
            branchMergedValue2 = (((productValue12 * loadedBufferValue8.z) + (productValue11 * loadedBufferValue7.z)) + (productValue10 * loadedBufferValue6.z)) + (productValue9 * loadedBufferValue5.z);
        }
        intermediateValue4 = branchMergedValue;
        intermediateValue5 = branchMergedValue1;
        intermediateValue6 = branchMergedValue2;
    }
    else
    {
        intermediateValue4 = RD_UNIFORM_WATER_EXTINCTION_COEFFICIENTS.x;
        intermediateValue5 = RD_UNIFORM_WATER_EXTINCTION_COEFFICIENTS.y;
        intermediateValue6 = RD_UNIFORM_WATER_EXTINCTION_COEFFICIENTS.z;
    }
    float nonlinearValue = ((min(sqrt((((quotientValue * quotientValue) + 1.0f) + (quotientValue1 * quotientValue1)) + (quotientValue2 * quotientValue2)), RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z) - min(sqrt((((quotientValue3 * quotientValue3) + 1.0f) + (quotientValue4 * quotientValue4)) + (quotientValue5 * quotientValue5)), RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) + RD_UNIFORM_WATER_SURFACE_ENABLED_AND_EXTINCTION_DIST_SHIFT.y) * (-1.44269502162933349609375f);
    fragmentColor0.x = exp2(nonlinearValue * intermediateValue4);
    fragmentColor0.y = exp2(nonlinearValue * intermediateValue5);
    fragmentColor0.z = exp2(nonlinearValue * intermediateValue6);
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
