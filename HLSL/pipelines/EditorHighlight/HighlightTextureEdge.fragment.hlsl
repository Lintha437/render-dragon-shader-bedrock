// EditorHighlight / HighlightTextureEdge / fragment forward pipeline.
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


#include "../../include/materials/EditorHighlight/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.xyzw = materialTexture4.Sample(textureSampler4, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector3.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.y = RD_COMPARISON_MASK(0 != RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.y != 0) {
    workingVector4.xyzw = materialTexture2.Load(float4(0,0,0,0)).xyzw;
    workingVector0.z = 0.180000007 / workingVector4.x;
    workingVector0.z = 9.99999975e-005 + workingVector0.z;
    workingVector2.xyz = workingVector2.xyz / workingVector0.zzz;
    workingVector3.xyz = workingVector3.xyz / workingVector0.zzz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.x = materialTexture4.Sample(textureSampler4, varyingTexCoord0.xy).x;
  workingVector0.y = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).x;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
  workingVector0.z = RD_COMPARISON_MASK(0 != RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.z != 0) {
    workingVector0.w = materialTexture2.Load(float4(0,0,0,0)).x;
    workingVector2.w = 0.180000007 / workingVector0.w;
    workingVector2.w = 9.99999975e-005 + workingVector2.w;
    workingVector1.xyz = workingVector1.xyz / workingVector2.www;
    workingVector2.xyz = workingVector2.xyz / workingVector2.www;
#endif
  } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector4.x = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector0.w = 1;
#endif
  }
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.zw = RD_UNIFORM_SCREEN_SIZE.zw * RD_UNIFORM_OUTLINE_WIDTH.xx;
  workingVector1.yz = -RD_UNIFORM_OUTLINE_WIDTH.xx * RD_UNIFORM_SCREEN_SIZE.zw + varyingTexCoord0.xy;
  workingVector5.xyzw = materialTexture0.Sample(textureSampler0, workingVector1.yz).xyzw;
  workingVector6.xyzw = workingVector0.zwzw * float4(-1,0,-1,1) + varyingTexCoord0.xyxy;
  workingVector7.xyzw = materialTexture0.Sample(textureSampler0, workingVector6.xy).xyzw;
  workingVector6.xyzw = materialTexture0.Sample(textureSampler0, workingVector6.zw).xyzw;
  workingVector8.xyzw = workingVector0.zwzw * float4(0,-1,0,1) + varyingTexCoord0.xyxy;
  workingVector9.xyzw = materialTexture0.Sample(textureSampler0, workingVector8.xy).xyzw;
  workingVector8.xyzw = materialTexture0.Sample(textureSampler0, workingVector8.zw).xyzw;
  workingVector10.xyzw = workingVector0.zwzw * float4(1,-1,1,0) + varyingTexCoord0.xyxy;
  workingVector11.xyzw = materialTexture0.Sample(textureSampler0, workingVector10.xy).xyzw;
  workingVector10.xyzw = materialTexture0.Sample(textureSampler0, workingVector10.zw).xyzw;
  workingVector0.zw = RD_UNIFORM_OUTLINE_WIDTH.xx * RD_UNIFORM_SCREEN_SIZE.zw + varyingTexCoord0.xy;
  workingVector12.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.zw).xyzw;
  workingVector5.x = ceil(workingVector5.w);
  workingVector5.y = ceil(workingVector7.w);
  workingVector5.z = ceil(workingVector6.w);
  workingVector0.z = dot(float3(1,2,1), workingVector5.xyz);
  workingVector6.x = ceil(workingVector11.w);
  workingVector6.y = ceil(workingVector10.w);
  workingVector6.z = ceil(workingVector12.w);
  workingVector0.w = dot(float3(-1,-2,-1), workingVector6.xyz);
  workingVector0.z = workingVector0.z + workingVector0.w;
  workingVector0.w = dot(float2(1,-1), workingVector5.xz);
  workingVector5.x = ceil(workingVector9.w);
  workingVector5.y = ceil(workingVector8.w);
  workingVector1.y = dot(float2(2,-2), workingVector5.xy);
  workingVector0.w = workingVector1.y + workingVector0.w;
  workingVector1.y = dot(float2(1,-1), workingVector6.xz);
  workingVector0.w = workingVector1.y + workingVector0.w;
  workingVector0.w = workingVector0.w * workingVector0.w;
  workingVector0.z = workingVector0.z * workingVector0.z + workingVector0.w;
  workingVector1.yzw = RD_UNIFORM_HIGHLIGHT_COLOR.xyz + -workingVector3.xyz;
  workingVector1.yzw = RD_UNIFORM_HIGHLIGHT_COLOR.www * workingVector1.yzw + workingVector3.xyz;
  workingVector3.xyz = workingVector2.xyz + -workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_HIGHLIGHT_ALPHA.xxx * workingVector3.xyz + workingVector1.yzw;
  workingVector3.xyzw = RD_UNIFORM_SCREEN_SIZE.zwzw * RD_UNIFORM_BLOCK_EDGE_THICKNESS.xxxx;
  workingVector5.xyzw = workingVector3.zwzw * float4(-1,0,1,0) + varyingTexCoord0.xyxy;
  workingVector3.xyzw = workingVector3.xyzw * float4(0,-1,0,1) + varyingTexCoord0.xyxy;
  workingVector6.xyzw = materialTexture1.Sample(textureSampler1, workingVector5.xy).xyzw;
  workingVector5.xyzw = materialTexture1.Sample(textureSampler1, workingVector5.zw).xyzw;
  workingVector7.xyzw = materialTexture1.Sample(textureSampler1, workingVector3.xy).xyzw;
  workingVector3.xyzw = materialTexture1.Sample(textureSampler1, workingVector3.zw).xyzw;
  workingVector8.y = workingVector1.x * 9999 + 1;
  workingVector8.x = workingVector6.x * 9999 + 1;
  workingVector8.z = workingVector5.x * 9999 + 1;
  workingVector5.x = workingVector7.x * 9999 + 1;
  workingVector5.z = workingVector3.x * 9999 + 1;
  workingVector0.w = dot(float3(-1,2,-1), workingVector8.xyz);
  workingVector5.y = workingVector8.y;
  workingVector3.x = dot(float3(-1,2,-1), workingVector5.xyz);
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector3.xy = RD_UNIFORM_SCREEN_SIZE.zw * RD_UNIFORM_OUTLINE_WIDTH.xx;
  workingVector3.zw = -RD_UNIFORM_OUTLINE_WIDTH.xx * RD_UNIFORM_SCREEN_SIZE.zw + varyingTexCoord0.xy;
  workingVector2.w = materialTexture0.Sample(textureSampler0, workingVector3.zw).w;
  workingVector4.xyzw = workingVector3.xyxy * float4(-1,0,-1,1) + varyingTexCoord0.xyxy;
  workingVector3.z = materialTexture0.Sample(textureSampler0, workingVector4.xy).w;
  workingVector3.w = materialTexture0.Sample(textureSampler0, workingVector4.zw).w;
  workingVector4.xyzw = workingVector3.xyxy * float4(0,-1,0,1) + varyingTexCoord0.xyxy;
  workingVector4.x = materialTexture0.Sample(textureSampler0, workingVector4.xy).w;
  workingVector4.y = materialTexture0.Sample(textureSampler0, workingVector4.zw).w;
  workingVector5.xyzw = workingVector3.xyxy * float4(1,-1,1,0) + varyingTexCoord0.xyxy;
  workingVector3.x = materialTexture0.Sample(textureSampler0, workingVector5.xy).w;
  workingVector3.y = materialTexture0.Sample(textureSampler0, workingVector5.zw).w;
  workingVector4.zw = RD_UNIFORM_OUTLINE_WIDTH.xx * RD_UNIFORM_SCREEN_SIZE.zw + varyingTexCoord0.xy;
  workingVector4.z = materialTexture0.Sample(textureSampler0, workingVector4.zw).w;
  workingVector5.x = ceil(workingVector2.w);
  workingVector5.yz = ceil(workingVector3.zw);
  workingVector2.w = dot(float3(1,2,1), workingVector5.xyz);
  workingVector6.xy = ceil(workingVector3.xy);
  workingVector6.z = ceil(workingVector4.z);
  workingVector3.x = dot(float3(-1,-2,-1), workingVector6.xyz);
  workingVector2.w = workingVector3.x + workingVector2.w;
  workingVector3.x = dot(float2(1,-1), workingVector5.xz);
  workingVector5.xy = ceil(workingVector4.xy);
  workingVector3.y = dot(float2(2,-2), workingVector5.xy);
  workingVector3.x = workingVector3.x + workingVector3.y;
  workingVector3.y = dot(float2(1,-1), workingVector6.xz);
  workingVector3.x = workingVector3.x + workingVector3.y;
#endif
  workingVector3.x = workingVector3.x * workingVector3.x;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.w = workingVector0.w * workingVector0.w + workingVector3.x;
  workingVector0.zw = sqrt(workingVector0.zw);
  workingVector0.w = RD_COMPARISON_MASK(0.00999999978 < workingVector0.w);
  workingVector0.w = workingVector0.w ? 1.000000 : 0;
  workingVector0.w = RD_UNIFORM_BLOCK_EDGE_COLOR.w * workingVector0.w;
  workingVector3.xyz = RD_UNIFORM_BLOCK_EDGE_COLOR.xyz + -workingVector1.yzw;
  workingVector3.xyz = workingVector0.www * workingVector3.xyz + workingVector1.yzw;
  workingVector1.xy = float2(1.19999996e-007,-1.19999996e-007) + workingVector1.xx;
  workingVector0.w = RD_COMPARISON_MASK(workingVector1.x < 1);
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector1.y);
  workingVector0.z = RD_UNIFORM_OUTLINE_COLOR.w * workingVector0.z;
  workingVector1.xyz = RD_UNIFORM_OUTLINE_COLOR.xyz + -workingVector2.xyz;
  workingVector1.w = 0;
  workingVector1.xyzw = workingVector0.zzzz * workingVector1.xyzw + workingVector2.xyzw;
  workingVector4.yzw = workingVector3.xyz + -workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_HIDDEN_BLOCKS_ALPHA.xxx * workingVector4.yzw + workingVector1.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector2.w = workingVector2.w * workingVector2.w + workingVector3.x;
  workingVector2.w = sqrt(workingVector2.w);
  workingVector3.xyz = RD_UNIFORM_HIGHLIGHT_COLOR.xyz + -workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_HIGHLIGHT_COLOR.www * workingVector3.xyz + workingVector2.xyz;
  workingVector3.xyz = -workingVector2.xyz + workingVector1.xyz;
  workingVector2.xyz = RD_UNIFORM_HIGHLIGHT_ALPHA.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector3.xyzw = RD_UNIFORM_SCREEN_SIZE.zwzw * RD_UNIFORM_BLOCK_EDGE_THICKNESS.xxxx;
  workingVector4.xyzw = workingVector3.zwzw * float4(-1,0,1,0) + varyingTexCoord0.xyxy;
  workingVector3.xyzw = workingVector3.xyzw * float4(0,-1,0,1) + varyingTexCoord0.xyxy;
  workingVector4.x = materialTexture1.Sample(textureSampler1, workingVector4.xy).x;
  workingVector4.y = materialTexture1.Sample(textureSampler1, workingVector4.zw).x;
  workingVector3.x = materialTexture1.Sample(textureSampler1, workingVector3.xy).x;
  workingVector3.y = materialTexture1.Sample(textureSampler1, workingVector3.zw).x;
  workingVector5.y = workingVector0.y * 9999 + 1;
  workingVector5.x = workingVector4.x * 9999 + 1;
  workingVector5.z = workingVector4.y * 9999 + 1;
  workingVector4.x = workingVector3.x * 9999 + 1;
  workingVector4.z = workingVector3.y * 9999 + 1;
  workingVector3.x = dot(float3(-1,2,-1), workingVector5.xyz);
  workingVector4.y = workingVector5.y;
  workingVector3.y = dot(float3(-1,2,-1), workingVector4.xyz);
  workingVector3.y = workingVector3.y * workingVector3.y;
  workingVector3.x = workingVector3.x * workingVector3.x + workingVector3.y;
  workingVector3.x = sqrt(workingVector3.x);
  workingVector3.x = RD_COMPARISON_MASK(0.00999999978 < workingVector3.x);
  workingVector3.x = workingVector3.x ? 1.000000 : 0;
  workingVector3.x = RD_UNIFORM_BLOCK_EDGE_COLOR.w * workingVector3.x;
  workingVector3.yzw = RD_UNIFORM_BLOCK_EDGE_COLOR.xyz + -workingVector2.xyz;
  workingVector3.xyz = workingVector3.xxx * workingVector3.yzw + workingVector2.xyz;
  workingVector2.xy = float2(1.19999996e-007,-1.19999996e-007) + workingVector0.yy;
  workingVector0.y = RD_COMPARISON_MASK(workingVector2.x < 1);
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector2.y);
  workingVector2.x = RD_UNIFORM_OUTLINE_COLOR.w * workingVector2.w;
  workingVector4.xyz = RD_UNIFORM_OUTLINE_COLOR.xyz + -workingVector1.xyz;
  workingVector4.w = 0;
  workingVector2.xyzw = workingVector2.xxxx * workingVector4.xyzw + workingVector1.xyzw;
  workingVector4.xyz = workingVector3.xyz + -workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_HIDDEN_BLOCKS_ALPHA.xxx * workingVector4.xyz + workingVector2.xyz;
#endif
  workingVector3.w = RD_UNIFORM_HIGHLIGHT_ALPHA.x;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.xyzw = workingVector0.xxxx ? workingVector3.xyzw : workingVector1.xyzw;
  workingVector1.xyzw = workingVector0.wwww ? workingVector1.xyzw : workingVector2.xyzw;
  workingVector0.x = 0.180000007 / workingVector4.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector2.xyzw = workingVector0.xxxx ? workingVector3.xyzw : workingVector2.xyzw;
  workingVector1.xyzw = workingVector0.yyyy ? workingVector2.xyzw : workingVector1.xyzw;
  workingVector0.x = 0.180000007 / workingVector0.w;
#endif
  workingVector0.x = 9.99999975e-005 + workingVector0.x;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.xzw = workingVector1.xyz * workingVector0.xxx;
  fragmentColor0.xyz = workingVector0.yyy ? workingVector0.xzw : workingVector1.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.xyw = workingVector1.xyz * workingVector0.xxx;
  fragmentColor0.xyz = workingVector0.zzz ? workingVector0.xyw : workingVector1.xyz;
#endif
  fragmentColor0.w = workingVector1.w;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = sceneTextureDepthTexture.Sample(sceneTextureDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float4 sampledTextureValue2 = sceneTextureColorTexture.Sample(sceneTextureColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.x;
    float scalarValue2 = sampledTextureValue2.y;
    float scalarValue3 = sampledTextureValue2.z;
    float scalarValue4 = sampledTextureValue2.w;
    float4 sampledTextureValue3 = highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue3.x;
    float scalarValue6 = sampledTextureValue3.y;
    float scalarValue7 = sampledTextureValue3.z;
    float quotientValue1;
    float quotientValue2;
    float quotientValue3;
    float quotientValue4;
    float quotientValue5;
    float quotientValue6;
    float intermediateValue9;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x != 0.0f)
    {
        float4 loadedBufferValue = previousFrameAverageLuminanceTexture.Load(int3(uint2(0u, 0u), 0u));
        float scalarValue8 = loadedBufferValue.x;
        float quotientValue = (0.180000007152557373046875f / scalarValue8) + 9.9999997473787516355514526367188e-05f;
        quotientValue1 = scalarValue1 / quotientValue;
        quotientValue2 = scalarValue2 / quotientValue;
        quotientValue3 = scalarValue3 / quotientValue;
        quotientValue4 = scalarValue5 / quotientValue;
        quotientValue5 = scalarValue6 / quotientValue;
        quotientValue6 = scalarValue7 / quotientValue;
        intermediateValue9 = scalarValue8;
    }
    else
    {
        quotientValue1 = scalarValue1;
        quotientValue2 = scalarValue2;
        quotientValue3 = scalarValue3;
        quotientValue4 = scalarValue5;
        quotientValue5 = scalarValue6;
        quotientValue6 = scalarValue7;
        intermediateValue9 = 1.0f;
    }
    float productValue = RD_UNIFORM_SCREEN_SIZE.z * RD_UNIFORM_OUTLINE_WIDTH.x;
    float productValue1 = RD_UNIFORM_SCREEN_SIZE.w * RD_UNIFORM_OUTLINE_WIDTH.x;
    float sumValue = varyingTexCoord0.x - productValue;
    float sumValue1 = varyingTexCoord0.y - productValue1;
    float sumValue2 = productValue1 + varyingTexCoord0.y;
    float sumValue3 = productValue + varyingTexCoord0.x;
    float sampledTextureValue4 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue, sumValue1)).w);
    float sampledTextureValue5 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue, varyingTexCoord0.y)).w);
    float sampledTextureValue6 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue, sumValue2)).w);
    float sampledTextureValue7 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(varyingTexCoord0.x, sumValue1)).w);
    float sampledTextureValue8 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(varyingTexCoord0.x, sumValue2)).w);
    float sampledTextureValue9 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue3, sumValue1)).w);
    float sampledTextureValue10 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue3, varyingTexCoord0.y)).w);
    float sampledTextureValue11 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue3, sumValue2)).w);
    float dotProductValue = (dot(0.0f.xxx, float3(sampledTextureValue7, 0.0f, sampledTextureValue8)) + dot(float3(1.0f, 2.0f, 1.0f), float3(sampledTextureValue4, sampledTextureValue5, sampledTextureValue6))) + dot(float3(-1.0f, -2.0f, -1.0f), float3(sampledTextureValue9, sampledTextureValue10, sampledTextureValue11));
    float dotProductValue1 = (dot(float3(2.0f, 0.0f, -2.0f), float3(sampledTextureValue7, 0.0f, sampledTextureValue8)) + dot(float3(1.0f, 0.0f, -1.0f), float3(sampledTextureValue4, sampledTextureValue5, sampledTextureValue6))) + dot(float3(1.0f, 0.0f, -1.0f), float3(sampledTextureValue9, sampledTextureValue10, sampledTextureValue11));
    float productValue2 = ((RD_UNIFORM_HIGHLIGHT_COLOR.x - quotientValue4) * RD_UNIFORM_HIGHLIGHT_COLOR.w) + quotientValue4;
    float productValue3 = ((RD_UNIFORM_HIGHLIGHT_COLOR.y - quotientValue5) * RD_UNIFORM_HIGHLIGHT_COLOR.w) + quotientValue5;
    float productValue4 = ((RD_UNIFORM_HIGHLIGHT_COLOR.z - quotientValue6) * RD_UNIFORM_HIGHLIGHT_COLOR.w) + quotientValue6;
    float productValue5 = ((quotientValue1 - productValue2) * RD_UNIFORM_HIGHLIGHT_ALPHA.x) + productValue2;
    float productValue6 = ((quotientValue2 - productValue3) * RD_UNIFORM_HIGHLIGHT_ALPHA.x) + productValue3;
    float productValue7 = ((quotientValue3 - productValue4) * RD_UNIFORM_HIGHLIGHT_ALPHA.x) + productValue4;
    float productValue8 = RD_UNIFORM_SCREEN_SIZE.z * RD_UNIFORM_BLOCK_EDGE_THICKNESS.x;
    float productValue9 = RD_UNIFORM_SCREEN_SIZE.w * RD_UNIFORM_BLOCK_EDGE_THICKNESS.x;
    float sampledTextureValue12 = (highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).x * 9999.0f) + 1.0f;
    float sampledTextureValue13 = dot(float3(-1.0f, 2.0f, -1.0f), float3((highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x - productValue8, varyingTexCoord0.y)).x * 9999.0f) + 1.0f, sampledTextureValue12, (highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(productValue8 + varyingTexCoord0.x, varyingTexCoord0.y)).x * 9999.0f) + 1.0f));
    float sampledTextureValue14 = dot(float3(-1.0f, 2.0f, -1.0f), float3((highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y - productValue9)).x * 9999.0f) + 1.0f, sampledTextureValue12, (highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x, productValue9 + varyingTexCoord0.y)).x * 9999.0f) + 1.0f));
    float nonlinearValue = float(sqrt((sampledTextureValue14 * sampledTextureValue14) + (sampledTextureValue13 * sampledTextureValue13)) > 0.00999999977648258209228515625f) * RD_UNIFORM_BLOCK_EDGE_COLOR.w;
    float productValue10 = ((RD_UNIFORM_BLOCK_EDGE_COLOR.x - productValue5) * nonlinearValue) + productValue5;
    float productValue11 = ((RD_UNIFORM_BLOCK_EDGE_COLOR.y - productValue6) * nonlinearValue) + productValue6;
    float productValue12 = ((RD_UNIFORM_BLOCK_EDGE_COLOR.z - productValue7) * nonlinearValue) + productValue7;
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((scalarValue + 1.1999999571798980468884110450745e-07f) < 1.0f)
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (!((scalarValue + (-1.1999999571798980468884110450745e-07f)) <= sampledTextureValue.x))
        {
            float nonlinearValue1 = RD_UNIFORM_OUTLINE_COLOR.w * sqrt((dotProductValue1 * dotProductValue1) + (dotProductValue * dotProductValue));
            float productValue13 = ((RD_UNIFORM_OUTLINE_COLOR.x - quotientValue1) * nonlinearValue1) + quotientValue1;
            float productValue14 = ((RD_UNIFORM_OUTLINE_COLOR.y - quotientValue2) * nonlinearValue1) + quotientValue2;
            float productValue15 = ((RD_UNIFORM_OUTLINE_COLOR.z - quotientValue3) * nonlinearValue1) + quotientValue3;
            branchMergedValue = ((productValue10 - productValue13) * RD_UNIFORM_HIDDEN_BLOCKS_ALPHA.x) + productValue13;
            branchMergedValue1 = ((productValue11 - productValue14) * RD_UNIFORM_HIDDEN_BLOCKS_ALPHA.x) + productValue14;
            branchMergedValue2 = ((productValue12 - productValue15) * RD_UNIFORM_HIDDEN_BLOCKS_ALPHA.x) + productValue15;
            branchMergedValue3 = scalarValue4;
        }
        else
        {
            branchMergedValue = productValue10;
            branchMergedValue1 = productValue11;
            branchMergedValue2 = productValue12;
            branchMergedValue3 = RD_UNIFORM_HIGHLIGHT_ALPHA.x;
        }
        intermediateValue10 = branchMergedValue;
        intermediateValue11 = branchMergedValue1;
        intermediateValue12 = branchMergedValue2;
        intermediateValue13 = branchMergedValue3;
    }
    else
    {
        intermediateValue10 = quotientValue1;
        intermediateValue11 = quotientValue2;
        intermediateValue12 = quotientValue3;
        intermediateValue13 = scalarValue4;
    }
    float productValue16;
    float productValue17;
    float productValue18;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x != 0.0f)
    {
        float quotientValue7 = (0.180000007152557373046875f / intermediateValue9) + 9.9999997473787516355514526367188e-05f;
        productValue16 = quotientValue7 * intermediateValue10;
        productValue17 = quotientValue7 * intermediateValue11;
        productValue18 = quotientValue7 * intermediateValue12;
    }
    else
    {
        productValue16 = intermediateValue10;
        productValue17 = intermediateValue11;
        productValue18 = intermediateValue12;
    }
    fragmentColor0.x = productValue16;
    fragmentColor0.y = productValue17;
    fragmentColor0.z = productValue18;
    fragmentColor0.w = intermediateValue13;
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
