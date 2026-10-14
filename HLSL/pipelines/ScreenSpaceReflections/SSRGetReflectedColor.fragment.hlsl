// ScreenSpaceReflections / SSRGetReflectedColor / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/ScreenSpaceReflections/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture4.Sample(textureSampler4, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w >= 0);
  if (workingVector1.x != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector1.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector1.x = materialTexture0.Sample(textureSampler0, workingVector0.xy).x;
#endif
    workingVector0.xy = workingVector0.xy * float2(1,-1) + float2(0,1);
    workingVector0.xy = workingVector0.xy * float2(2,2) + float2(-1,-1);
    workingVector2.x = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector0.x;
    workingVector2.y = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector0.y;
    workingVector0.x = workingVector1.x * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
    workingVector2.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
    workingVector1.xyz = workingVector2.xyz / workingVector0.xxx;
    workingVector2.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector1.yyy;
    workingVector1.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector1.xxx + workingVector2.xyz;
    workingVector1.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector1.zzz + workingVector1.xyw;
    workingVector1.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector1.xyz;
    workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector1.yyy;
    workingVector1.xyw = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector1.xxx + workingVector2.xyz;
    workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector1.zzz + workingVector1.xyw;
    workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector1.xyz;
    workingVector0.xy = workingVector1.xy / workingVector1.zz;
    workingVector0.xy = float2(1,1) + workingVector0.xy;
    workingVector1.x = 0.5 * workingVector0.x;
    workingVector1.z = -workingVector0.y * 0.5 + 1;
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector1.xyzw = materialTexture6.Sample(textureSampler6, workingVector1.xz).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector1.xyz = materialTexture6.Sample(textureSampler6, workingVector1.xz).xyz;
#endif
    workingVector1.w = workingVector0.w;
  } else {
    workingVector1.xyzw = float4(0,0,0,0);
  }
  workingVector0.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.x);
  if (workingVector0.x != 0) {
    workingVector0.xy = varyingTexCoord0.xy * float2(1,-1) + float2(0,1);
    workingVector0.xy = workingVector0.xy * float2(2,2) + float2(-1,-1);
    workingVector2.x = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector0.x;
    workingVector2.y = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector0.y;
    workingVector0.x = workingVector0.z * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
    workingVector2.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
    workingVector0.xyz = workingVector2.xyz / workingVector0.xxx;
    workingVector2.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector0.yyy;
    workingVector0.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector0.xxx + workingVector2.xyz;
    workingVector0.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
    workingVector0.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector0.xyz;
    workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector0.yyy;
    workingVector0.xyw = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector0.xxx + workingVector2.xyz;
    workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector0.zzz + workingVector0.xyw;
    workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector0.xyz;
    workingVector0.xy = workingVector0.xy / workingVector0.zz;
    workingVector0.xy = float2(1,1) + workingVector0.xy;
    workingVector0.x = RD_UNIFORM_VIEWPORT_SCALE.z * workingVector0.x;
    workingVector0.z = (int)RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.z;
    workingVector0.w = -(int)workingVector0.z;
    workingVector2.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
    workingVector3.xyzw = float4(0,0,0,0);
    workingVector4.xyzw = float4(0,0,0,0);
    workingVector2.w = 0;
    workingVector5.x = workingVector0.w;
    while (true) {
      workingVector5.y = RD_COMPARISON_MASK((int)workingVector0.z < (int)workingVector5.x);
      if (workingVector5.y != 0) break;
      workingVector6.x = (int)workingVector5.x;
      workingVector7.xyzw = workingVector3.xyzw;
      workingVector8.xyzw = workingVector4.xyzw;
      workingVector5.y = workingVector2.w;
      workingVector5.z = workingVector0.w;
      while (true) {
        workingVector5.w = RD_COMPARISON_MASK((int)workingVector0.z < (int)workingVector5.z);
        if (workingVector5.w != 0) break;
        workingVector6.y = (int)workingVector5.z;
        workingVector6.yz = workingVector6.xy * RD_UNIFORM_SCREEN_SIZE.zw + varyingTexCoord0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
        workingVector9.xyzw = materialTexture4.Sample(textureSampler4, workingVector6.yz).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        workingVector9.xyw = materialTexture4.Sample(textureSampler4, workingVector6.yz).xyw;
#endif
        workingVector5.w = RD_COMPARISON_MASK(workingVector9.w >= 0);
        if (workingVector5.w != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector10.xyzw = materialTexture0.Sample(textureSampler0, workingVector9.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector5.w = materialTexture0.Sample(textureSampler0, workingVector9.xy).x;
#endif
          workingVector6.yz = workingVector9.xy * float2(1,-1) + float2(0,1);
          workingVector6.yz = workingVector6.yz * float2(2,2) + float2(-1,-1);
          workingVector2.x = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector6.y;
          workingVector2.y = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector6.z;
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector5.w = workingVector10.x * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector5.w = workingVector5.w * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
#endif
          workingVector6.yzw = workingVector2.xyz / workingVector5.www;
          workingVector10.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector6.zzz;
          workingVector10.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector6.yyy + workingVector10.xyz;
          workingVector6.yzw = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector6.www + workingVector10.xyz;
          workingVector6.yzw = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector6.yzw;
          workingVector10.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector6.zzz;
          workingVector10.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector6.yyy + workingVector10.xyz;
          workingVector6.yzw = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector6.www + workingVector10.xyz;
          workingVector6.yzw = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector6.yzw;
          workingVector2.xy = workingVector6.yz / workingVector6.ww;
          workingVector2.xy = float2(1,1) + workingVector2.xy;
          workingVector10.x = 0.5 * workingVector2.x;
          workingVector10.z = -workingVector2.y * 0.5 + 1;
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector10.xyzw = materialTexture6.Sample(textureSampler6, workingVector10.xz).xyzw;
          workingVector9.xyz = workingVector10.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector9.xyz = materialTexture6.Sample(textureSampler6, workingVector10.xz).xyz;
#endif
        } else {
          workingVector9.xyzw = float4(0,0,0,0);
        }
        workingVector5.y = 1 + workingVector5.y;
        workingVector10.xyzw = workingVector9.xyzw + -workingVector7.xyzw;
        workingVector11.xyzw = workingVector10.xyzw / workingVector5.yyyy;
        workingVector7.xyzw = workingVector11.xyzw + workingVector7.xyzw;
        workingVector9.xyzw = workingVector9.xyzw + -workingVector7.xyzw;
        workingVector8.xyzw = workingVector10.xyzw * workingVector9.xyzw + workingVector8.xyzw;
        workingVector5.z = (int)workingVector5.z + 1;
      }
      workingVector3.xyzw = workingVector7.xyzw;
      workingVector4.xyzw = workingVector8.xyzw;
      workingVector2.w = workingVector5.y;
      workingVector5.x = (int)workingVector5.x + 1;
    }
    workingVector0.z = -1 + workingVector2.w;
    workingVector2.xyzw = workingVector4.xyzw / workingVector0.zzzz;
    workingVector0.y = -workingVector0.y * 0.5 + 1;
    workingVector4.x = 0.5 * workingVector0.x;
    workingVector4.y = RD_UNIFORM_VIEWPORT_SCALE.w * workingVector0.y;
    workingVector0.xyzw = materialTexture5.Sample(textureSampler5, workingVector4.xy).xyzw;
    workingVector2.xyzw = max(float4(0,0,0,0), workingVector2.xyzw);
    workingVector2.xyzw = sqrt(workingVector2.xyzw);
    workingVector4.xyzw = RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.yyyy * workingVector2.xyzw + workingVector3.xyzw;
    workingVector2.xyzw = -RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.yyyy * workingVector2.xyzw + workingVector3.xyzw;
    workingVector0.xyzw = max(workingVector2.xyzw, workingVector0.xyzw);
    workingVector0.xyzw = min(workingVector0.xyzw, workingVector4.xyzw);
  } else {
    workingVector0.xyzw = workingVector1.xyzw;
  }
  workingVector1.xyzw = workingVector1.xyzw + -workingVector0.xyzw;
  fragmentColor0.xyzw = RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.wwww * workingVector1.xyzw + workingVector0.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = inputTextureTexture.Sample(inputTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.w;
    float sampledTextureValue1 = (gbufferDepthTexture.Sample(gbufferDepthSampler, float2(scalarValue, sampledTextureValue.y)).x * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue = (((scalarValue * 2.0f) + (-1.0f)) * RD_UNIFORM_INV_PROJ_ROW_0.x) / sampledTextureValue1;
    float quotientValue1 = ((((1.0f - sampledTextureValue.y) * 2.0f) + (-1.0f)) * RD_UNIFORM_INV_PROJ_ROW_1.y) / sampledTextureValue1;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / sampledTextureValue1;
    float multiplyAddValue = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (!(scalarValue1 >= 0.0f))
    {
        intermediateValue2 = 0.0f;
        intermediateValue3 = 0.0f;
        intermediateValue4 = 0.0f;
        intermediateValue5 = 0.0f;
    }
    else
    {
        float4 sampledTextureValue2 = rasterColorTexture.Sample(rasterColorSampler, float2((((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue3) + 1.0f) * 0.5f, 1.0f - ((((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue3) + 1.0f) * 0.5f)));
        intermediateValue2 = sampledTextureValue2.x;
        intermediateValue3 = sampledTextureValue2.y;
        intermediateValue4 = sampledTextureValue2.z;
        intermediateValue5 = scalarValue1;
    }
    float sumValue;
    float sumValue1;
    float sumValue2;
    float sumValue3;
    if (RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.x > 0.0f)
    {
        float productValue = (sampledTextureValue.z * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
        float quotientValue3 = (RD_UNIFORM_INV_PROJ_ROW_0.x * ((varyingTexCoord0.x * 2.0f) + (-1.0f))) / productValue;
        float quotientValue4 = (RD_UNIFORM_INV_PROJ_ROW_1.y * (((1.0f - varyingTexCoord0.y) * 2.0f) + (-1.0f))) / productValue;
        float quotientValue5 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue;
        float multiplyAddValue4 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue5, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x;
        float multiplyAddValue5 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue5, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y;
        float multiplyAddValue6 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue5, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z;
        float multiplyAddValue7 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, multiplyAddValue6, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
        uint scalarValue2 = uint(int(RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.z));
        uint scalarValue3 = -scalarValue2;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        if (int(scalarValue2) < int(scalarValue3))
        {
            intermediateValue8 = -1.0f;
            intermediateValue9 = 0.0f;
            intermediateValue10 = 0.0f;
            intermediateValue11 = 0.0f;
            intermediateValue12 = 0.0f;
            intermediateValue13 = 0.0f;
            intermediateValue14 = 0.0f;
            intermediateValue15 = 0.0f;
            intermediateValue16 = 0.0f;
        }
        else
        {
            float quotientValue6;
            float quotientValue7;
            float quotientValue8;
            float quotientValue9;
            float productValue1;
            float productValue2;
            float productValue3;
            float productValue4;
            float sumValue5;
            float intermediateValue27;
            uint intermediateValue28;
            float intermediateValue29;
            float intermediateValue30;
            float intermediateValue31;
            float intermediateValue32;
            float intermediateValue33;
            float intermediateValue34;
            float intermediateValue35;
            float intermediateValue36;
            float scalarValue4 = 0.0f;
            uint scalarValue5 = scalarValue3;
            float scalarValue6 = 0.0f;
            float scalarValue7 = 0.0f;
            float scalarValue8 = 0.0f;
            float scalarValue9 = 0.0f;
            float scalarValue10 = 0.0f;
            float scalarValue11 = 0.0f;
            float scalarValue12 = 0.0f;
            float scalarValue13 = 0.0f;
            for (;;)
            {
                intermediateValue27 = scalarValue4;
                intermediateValue28 = scalarValue3;
                intermediateValue29 = scalarValue6;
                intermediateValue30 = scalarValue7;
                intermediateValue31 = scalarValue8;
                intermediateValue32 = scalarValue9;
                intermediateValue33 = scalarValue10;
                intermediateValue34 = scalarValue11;
                intermediateValue35 = scalarValue12;
                intermediateValue36 = scalarValue13;
                float intermediateValue40;
                float intermediateValue41;
                float intermediateValue42;
                float intermediateValue43;
                float intermediateValue37;
                float intermediateValue38;
                float intermediateValue39;
                bool comparisonValue;
                for (;;)
                {
                    float4 sampledTextureValue3 = inputTextureTexture.Sample(inputTextureSampler, float2((RD_UNIFORM_SCREEN_SIZE.z * float(int(scalarValue5))) + varyingTexCoord0.x, (RD_UNIFORM_SCREEN_SIZE.w * float(int(intermediateValue28))) + varyingTexCoord0.y));
                    intermediateValue37 = sampledTextureValue3.x;
                    intermediateValue38 = sampledTextureValue3.y;
                    intermediateValue39 = sampledTextureValue3.w;
                    comparisonValue = !(intermediateValue39 >= 0.0f);
                    float branchMergedValue;
                    float branchMergedValue1;
                    float branchMergedValue2;
                    float branchMergedValue3;
                    if (comparisonValue)
                    {
                        branchMergedValue = 0.0f;
                        branchMergedValue1 = 0.0f;
                        branchMergedValue2 = 0.0f;
                        branchMergedValue3 = 0.0f;
                    }
                    else
                    {
                        float sampledTextureValue4 = (gbufferDepthTexture.Sample(gbufferDepthSampler, float2(intermediateValue37, intermediateValue38)).x * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
                        float quotientValue10 = (((intermediateValue37 * 2.0f) + (-1.0f)) * RD_UNIFORM_INV_PROJ_ROW_0.x) / sampledTextureValue4;
                        float quotientValue11 = ((((1.0f - intermediateValue38) * 2.0f) + (-1.0f)) * RD_UNIFORM_INV_PROJ_ROW_1.y) / sampledTextureValue4;
                        float quotientValue12 = RD_UNIFORM_INV_PROJ_ROW_3.z / sampledTextureValue4;
                        float multiplyAddValue8 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue12, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue11, quotientValue10 * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x;
                        float multiplyAddValue9 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue12, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue11, quotientValue10 * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y;
                        float multiplyAddValue10 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue12, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue11, quotientValue10 * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z;
                        float multiplyAddValue11 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, multiplyAddValue10, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, multiplyAddValue9, multiplyAddValue8 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
                        float4 sampledTextureValue5 = rasterColorTexture.Sample(rasterColorSampler, float2((((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, multiplyAddValue10, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, multiplyAddValue9, multiplyAddValue8 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue11) + 1.0f) * 0.5f, 1.0f - ((((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, multiplyAddValue10, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, multiplyAddValue9, multiplyAddValue8 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue11) + 1.0f) * 0.5f)));
                        branchMergedValue = intermediateValue39;
                        branchMergedValue1 = sampledTextureValue5.z;
                        branchMergedValue2 = sampledTextureValue5.y;
                        branchMergedValue3 = sampledTextureValue5.x;
                    }
                    intermediateValue43 = branchMergedValue;
                    intermediateValue42 = branchMergedValue1;
                    intermediateValue41 = branchMergedValue2;
                    intermediateValue40 = branchMergedValue3;
                    sumValue5 = intermediateValue27 + 1.0f;
                    float sumValue4 = intermediateValue40 - intermediateValue29;
                    float sumValue6 = intermediateValue41 - intermediateValue30;
                    float sumValue7 = intermediateValue42 - intermediateValue31;
                    float sumValue8 = intermediateValue43 - intermediateValue32;
                    quotientValue6 = (sumValue4 / sumValue5) + intermediateValue29;
                    quotientValue7 = (sumValue6 / sumValue5) + intermediateValue30;
                    quotientValue8 = (sumValue7 / sumValue5) + intermediateValue31;
                    quotientValue9 = (sumValue8 / sumValue5) + intermediateValue32;
                    productValue1 = ((intermediateValue40 - quotientValue6) * sumValue4) + intermediateValue33;
                    productValue2 = ((intermediateValue41 - quotientValue7) * sumValue6) + intermediateValue34;
                    productValue3 = ((intermediateValue42 - quotientValue8) * sumValue7) + intermediateValue35;
                    productValue4 = ((intermediateValue43 - quotientValue9) * sumValue8) + intermediateValue36;
                    if (int(intermediateValue28) < int(scalarValue2))
                    {
                        intermediateValue27 = sumValue5;
                        intermediateValue28++;
                        intermediateValue29 = quotientValue6;
                        intermediateValue30 = quotientValue7;
                        intermediateValue31 = quotientValue8;
                        intermediateValue32 = quotientValue9;
                        intermediateValue33 = productValue1;
                        intermediateValue34 = productValue2;
                        intermediateValue35 = productValue3;
                        intermediateValue36 = productValue4;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                if (int(scalarValue5) < int(scalarValue2))
                {
                    scalarValue4 = sumValue5;
                    scalarValue5++;
                    scalarValue6 = quotientValue6;
                    scalarValue7 = quotientValue7;
                    scalarValue8 = quotientValue8;
                    scalarValue9 = quotientValue9;
                    scalarValue10 = productValue1;
                    scalarValue11 = productValue2;
                    scalarValue12 = productValue3;
                    scalarValue13 = productValue4;
                    continue;
                }
                else
                {
                    break;
                }
            }
            precise float sumValue9 = sumValue5 + (-1.0f);
            intermediateValue8 = sumValue9;
            intermediateValue9 = quotientValue6;
            intermediateValue10 = quotientValue7;
            intermediateValue11 = quotientValue8;
            intermediateValue12 = quotientValue9;
            intermediateValue13 = productValue1;
            intermediateValue14 = productValue2;
            intermediateValue15 = productValue3;
            intermediateValue16 = productValue4;
        }
        float4 sampledTextureValue6 = previousReflectionBufferTexture.Sample(previousReflectionBufferSampler, float2(((((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, multiplyAddValue6, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue7) + 1.0f) * 0.5f) * RD_UNIFORM_VIEWPORT_SCALE.z, RD_UNIFORM_VIEWPORT_SCALE.w * (1.0f - ((((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, multiplyAddValue6, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue7) + 1.0f) * 0.5f))));
        float nonlinearValue = sqrt(max(0.0f, intermediateValue13 / intermediateValue8)) * RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.y;
        float nonlinearValue1 = sqrt(max(0.0f, intermediateValue14 / intermediateValue8)) * RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.y;
        float nonlinearValue2 = sqrt(max(0.0f, intermediateValue15 / intermediateValue8)) * RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.y;
        float nonlinearValue3 = sqrt(max(0.0f, intermediateValue16 / intermediateValue8)) * RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.y;
        sumValue = min(max(sampledTextureValue6.x, intermediateValue9 - nonlinearValue), nonlinearValue + intermediateValue9);
        sumValue1 = min(max(sampledTextureValue6.y, intermediateValue10 - nonlinearValue1), nonlinearValue1 + intermediateValue10);
        sumValue2 = min(max(sampledTextureValue6.z, intermediateValue11 - nonlinearValue2), nonlinearValue2 + intermediateValue11);
        sumValue3 = min(max(sampledTextureValue6.w, intermediateValue12 - nonlinearValue3), nonlinearValue3 + intermediateValue12);
    }
    else
    {
        sumValue = intermediateValue2;
        sumValue1 = intermediateValue3;
        sumValue2 = intermediateValue4;
        sumValue3 = intermediateValue5;
    }
    fragmentColor0.x = ((intermediateValue2 - sumValue) * RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.w) + sumValue;
    fragmentColor0.y = ((intermediateValue3 - sumValue1) * RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.w) + sumValue1;
    fragmentColor0.z = ((intermediateValue4 - sumValue2) * RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.w) + sumValue2;
    fragmentColor0.w = ((intermediateValue5 - sumValue3) * RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS.w) + sumValue3;
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
