// DeferredIndirectSpecular / DoIndirectSpecularUpscale / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_UPSCALING
#define RD_FEATURE_UPSCALING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif


#include "../../include/materials/DeferredIndirectSpecular/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_FEATURE_UPSCALING == RD_OFF
  float4 workingVector0;
#elif RD_FEATURE_UPSCALING == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = materialTexture8.Sample(textureSampler8, varyingTexCoord0.xy).x;
#if RD_FEATURE_UPSCALING == RD_OFF
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x != 1.000000);
  if (workingVector0.x != 0) {
    workingVector0.xyz = materialTexture9.Sample(textureSampler9, varyingTexCoord0.xy).xyz;
#elif RD_FEATURE_UPSCALING == RD_ON
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.x != 1.000000);
  if (workingVector0.y != 0) {
    workingVector0.yz = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xy;
    workingVector1.xyz = float3(1,1,1) + -abs(workingVector0.yzy);
    workingVector2.z = workingVector1.x + -abs(workingVector0.z);
    workingVector0.w = RD_COMPARISON_MASK(workingVector2.z < 0);
    workingVector1.xw = RD_COMPARISON_MASK(workingVector0.yz >= float2(0,0));
    workingVector1.xw = workingVector1.xw ? float2(1,1) : 0;
    workingVector1.xw = workingVector1.xw * float2(2,2) + float2(-1,-1);
    workingVector1.xy = workingVector1.yz * workingVector1.xw;
    workingVector2.xy = workingVector0.ww ? workingVector1.xy : workingVector0.yz;
    workingVector0.y = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector0.y = rsqrt(workingVector0.y);
    workingVector0.yzw = workingVector2.xyz * workingVector0.yyy;
    workingVector1.xyz = varyingTexCoord0.xyx * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.xyx + float3(-0.5,-0.5,-0.5);
    workingVector1.xyz = floor(workingVector1.xyz);
    workingVector1.xyz = float3(0.5,0.5,0.5) + workingVector1.xyz;
    workingVector2.xyz = RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.zwz * workingVector1.xyz;
    workingVector3.xyzw = RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.zwzw * float4(1,0,0,1) + workingVector2.zyzy;
    workingVector4.zw = workingVector1.zy * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.zw + RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.zw;
    workingVector1.xy = -workingVector1.zy * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.zw + varyingTexCoord0.xy;
    workingVector1.xy = RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.xy * workingVector1.xy;
    workingVector1.xy = frac(workingVector1.xy);
    workingVector1.zw = float2(1,1) + -workingVector1.yx;
    workingVector5.x = workingVector1.w * workingVector1.z;
    workingVector1.zw = workingVector1.xy * workingVector1.zw;
    workingVector1.x = workingVector1.x * workingVector1.y;
    workingVector6.xyzw = materialTexture4.Sample(textureSampler4, workingVector2.zy).xyzw;
    workingVector5.yz = workingVector6.xy * float2(2,2) + float2(-1,-1);
    workingVector7.xyz = float3(1,1,1) + -abs(workingVector5.yzy);
    workingVector8.z = workingVector7.x + -abs(workingVector5.z);
    workingVector1.y = RD_COMPARISON_MASK(workingVector8.z < 0);
    workingVector6.xy = RD_COMPARISON_MASK(workingVector5.yz >= float2(0,0));
    workingVector6.xy = workingVector6.xy ? float2(1,1) : 0;
    workingVector6.xy = workingVector6.xy * float2(2,2) + float2(-1,-1);
    workingVector6.xy = workingVector7.yz * workingVector6.xy;
    workingVector8.xy = workingVector1.yy ? workingVector6.xy : workingVector5.yz;
    workingVector1.y = dot(workingVector8.xyz, workingVector8.xyz);
    workingVector1.y = rsqrt(workingVector1.y);
    workingVector5.yzw = workingVector8.xyz * workingVector1.yyy;
    workingVector1.y = workingVector6.z * 65535 + workingVector6.w;
    workingVector5.y = dot(workingVector5.yzw, workingVector0.yzw);
    workingVector5.y = -1 + workingVector5.y;
    workingVector5.y = RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x * workingVector5.y;
    workingVector5.y = exp2(workingVector5.y);
    workingVector5.y = min(1, workingVector5.y);
    workingVector1.y = -workingVector1.y * 1.52590219e-005 + workingVector0.x;
    workingVector1.y = 6.19999992e-005 + abs(workingVector1.y);
    workingVector1.y = 6.19999992e-005 / workingVector1.y;
    workingVector1.y = workingVector5.y * workingVector1.y;
    workingVector6.xyzw = materialTexture4.Sample(textureSampler4, workingVector3.xy).xyzw;
    workingVector5.yz = workingVector6.xy * float2(2,2) + float2(-1,-1);
    workingVector7.xyz = float3(1,1,1) + -abs(workingVector5.yzy);
    workingVector8.z = workingVector7.x + -abs(workingVector5.z);
    workingVector5.w = RD_COMPARISON_MASK(workingVector8.z < 0);
    workingVector6.xy = RD_COMPARISON_MASK(workingVector5.yz >= float2(0,0));
    workingVector6.xy = workingVector6.xy ? float2(1,1) : 0;
    workingVector6.xy = workingVector6.xy * float2(2,2) + float2(-1,-1);
    workingVector6.xy = workingVector7.yz * workingVector6.xy;
    workingVector8.xy = workingVector5.ww ? workingVector6.xy : workingVector5.yz;
    workingVector5.y = dot(workingVector8.xyz, workingVector8.xyz);
    workingVector5.y = rsqrt(workingVector5.y);
    workingVector5.yzw = workingVector8.xyz * workingVector5.yyy;
    workingVector6.x = workingVector6.z * 65535 + workingVector6.w;
    workingVector5.y = dot(workingVector5.yzw, workingVector0.yzw);
    workingVector5.y = -1 + workingVector5.y;
    workingVector5.y = RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x * workingVector5.y;
    workingVector5.y = exp2(workingVector5.y);
    workingVector5.y = min(1, workingVector5.y);
    workingVector5.z = -workingVector6.x * 1.52590219e-005 + workingVector0.x;
    workingVector5.z = 6.19999992e-005 + abs(workingVector5.z);
    workingVector5.z = 6.19999992e-005 / workingVector5.z;
    workingVector5.y = workingVector5.y * workingVector5.z;
    workingVector6.xy = workingVector5.yy * workingVector1.zz;
    workingVector7.xyzw = materialTexture4.Sample(textureSampler4, workingVector3.zw).xyzw;
    workingVector5.yz = workingVector7.xy * float2(2,2) + float2(-1,-1);
    workingVector8.xyz = float3(1,1,1) + -abs(workingVector5.yzy);
    workingVector9.z = workingVector8.x + -abs(workingVector5.z);
    workingVector1.z = RD_COMPARISON_MASK(workingVector9.z < 0);
    workingVector7.xy = RD_COMPARISON_MASK(workingVector5.yz >= float2(0,0));
    workingVector7.xy = workingVector7.xy ? float2(1,1) : 0;
    workingVector7.xy = workingVector7.xy * float2(2,2) + float2(-1,-1);
    workingVector7.xy = workingVector8.yz * workingVector7.xy;
    workingVector9.xy = workingVector1.zz ? workingVector7.xy : workingVector5.yz;
    workingVector1.z = dot(workingVector9.xyz, workingVector9.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector5.yzw = workingVector9.xyz * workingVector1.zzz;
    workingVector1.z = workingVector7.z * 65535 + workingVector7.w;
    workingVector3.z = dot(workingVector5.yzw, workingVector0.yzw);
    workingVector3.z = -1 + workingVector3.z;
    workingVector3.z = RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x * workingVector3.z;
    workingVector3.z = exp2(workingVector3.z);
    workingVector3.z = min(1, workingVector3.z);
    workingVector1.z = -workingVector1.z * 1.52590219e-005 + workingVector0.x;
    workingVector1.z = 6.19999992e-005 + abs(workingVector1.z);
    workingVector1.z = 6.19999992e-005 / workingVector1.z;
    workingVector1.z = workingVector3.z * workingVector1.z;
    workingVector7.xyzw = materialTexture4.Sample(textureSampler4, workingVector4.zw).xyzw;
    workingVector5.yz = workingVector7.xy * float2(2,2) + float2(-1,-1);
    workingVector8.xyz = float3(1,1,1) + -abs(workingVector5.yzy);
    workingVector9.z = workingVector8.x + -abs(workingVector5.z);
    workingVector3.z = RD_COMPARISON_MASK(workingVector9.z < 0);
    workingVector7.xy = RD_COMPARISON_MASK(workingVector5.yz >= float2(0,0));
    workingVector7.xy = workingVector7.xy ? float2(1,1) : 0;
    workingVector7.xy = workingVector7.xy * float2(2,2) + float2(-1,-1);
    workingVector7.xy = workingVector8.yz * workingVector7.xy;
    workingVector9.xy = workingVector3.zz ? workingVector7.xy : workingVector5.yz;
    workingVector3.z = dot(workingVector9.xyz, workingVector9.xyz);
    workingVector3.z = rsqrt(workingVector3.z);
    workingVector5.yzw = workingVector9.xyz * workingVector3.zzz;
    workingVector3.z = workingVector7.z * 65535 + workingVector7.w;
    workingVector0.y = dot(workingVector5.yzw, workingVector0.yzw);
    workingVector0.y = -1 + workingVector0.y;
    workingVector0.y = RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x * workingVector0.y;
    workingVector0.y = exp2(workingVector0.y);
    workingVector0.y = min(1, workingVector0.y);
    workingVector0.x = -workingVector3.z * 1.52590219e-005 + workingVector0.x;
    workingVector0.x = 6.19999992e-005 + abs(workingVector0.x);
    workingVector0.x = 6.19999992e-005 / workingVector0.x;
    workingVector0.x = workingVector0.y * workingVector0.x;
    workingVector6.zw = workingVector0.xx * workingVector1.xx;
    workingVector0.x = workingVector1.y * workingVector5.x + workingVector6.y;
    workingVector0.y = workingVector1.z * workingVector1.w + workingVector6.w;
    workingVector1.xyzw = RD_COMPARISON_MASK(float4(0,0,0,0) < workingVector0.xxyy);
    workingVector5.xyzw = workingVector6.xyzw / workingVector0.xxyy;
    workingVector1.xyzw = workingVector1.xyzw ? float4(1,1,1,1) : 0;
    workingVector1.xyzw = workingVector1.xyzw * workingVector5.xyzw;
    workingVector2.w = workingVector3.w;
    workingVector4.xy = workingVector3.xy;
    workingVector3.xyzw = workingVector4.xyzw + -workingVector2.zyzw;
    workingVector1.xyzw = workingVector1.xyzw * workingVector3.xyzw + workingVector2.xyzw;
    workingVector0.z = workingVector0.x + workingVector0.y;
    workingVector0.z = 6.19999992e-005 + workingVector0.z;
    workingVector0.xy = workingVector0.xy / workingVector0.zz;
    workingVector2.xyz = materialTexture9.Sample(textureSampler9, workingVector1.xy).xyz;
    workingVector1.xyz = materialTexture9.Sample(textureSampler9, workingVector1.zw).xyz;
    workingVector0.yzw = workingVector1.xyz * workingVector0.yyy;
    workingVector0.xyz = workingVector0.xxx * workingVector2.xyz + workingVector0.yzw;
#endif
  } else {
    workingVector0.xyz = float3(0,0,0);
  }
  fragmentColor0.xyz = workingVector0.xyz;
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
#if RD_FEATURE_UPSCALING == RD_OFF
    float intermediateValue;
    float intermediateValue1;
    float intermediateValue2;
    if (sceneDepthTexture.Sample(sceneDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).x != 1.0f)
#elif RD_FEATURE_UPSCALING == RD_ON
    float4 sampledTextureValue1 = normalTexture.Sample(normalSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float4 sampledTextureValue2 = sceneDepthTexture.Sample(sceneDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue2.x;
    float sumValue = 1.0f - abs(scalarValue);
    float scalarValue3 = abs(scalarValue1);
    float sumValue1 = sumValue - scalarValue3;
    bool conditionValue = sumValue1 < 0.0f;
    float comparisonValue = conditionValue ? ((1.0f - scalarValue3) * ((scalarValue < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue;
    float comparisonValue1 = conditionValue ? (sumValue * ((scalarValue1 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue1;
    float inverseLengthValue = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue1), float3(comparisonValue, comparisonValue1, sumValue1)));
    float productValue = comparisonValue * inverseLengthValue;
    float productValue1 = comparisonValue1 * inverseLengthValue;
    float productValue2 = inverseLengthValue * sumValue1;
    float inverseLengthValue1 = rsqrt(dot(float3(productValue, productValue1, productValue2), float3(productValue, productValue1, productValue2)));
    float productValue3 = inverseLengthValue1 * productValue;
    float productValue4 = productValue1 * inverseLengthValue1;
    float productValue5 = inverseLengthValue1 * productValue2;
    float productValue31;
    float productValue32;
    float productValue33;
    if (scalarValue2 != 1.0f)
#endif
    {
#if RD_FEATURE_UPSCALING == RD_OFF
        float4 sampledTextureValue = specularLightingTexture.Sample(specularLightingSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue = sampledTextureValue.x;
        intermediateValue1 = sampledTextureValue.y;
        intermediateValue2 = sampledTextureValue.z;
#elif RD_FEATURE_UPSCALING == RD_ON
        float productValue6 = floor((RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.x * varyingTexCoord0.x) + (-0.5f)) + 0.5f;
        float productValue7 = productValue6 * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.z;
        float productValue8 = (floor((RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.y * varyingTexCoord0.y) + (-0.5f)) + 0.5f) * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.w;
        float sumValue2 = productValue7 + RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.z;
        float sumValue3 = productValue8 + RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.w;
        float productValue9 = frac((varyingTexCoord0.x - productValue7) * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.x);
        float productValue10 = frac((varyingTexCoord0.y - productValue8) * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.y);
        float sumValue4 = 1.0f - productValue9;
        float sumValue5 = 1.0f - productValue10;
        float4 sampledTextureValue3 = normalsAndDepthLightingTexture.Sample(normalsAndDepthLightingSampler, float2(productValue7, productValue8));
        float productValue11 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
        float productValue12 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
        float sumValue6 = 1.0f - abs(productValue11);
        float scalarValue4 = abs(productValue12);
        float sumValue7 = sumValue6 - scalarValue4;
        bool conditionValue1 = sumValue7 < 0.0f;
        float comparisonValue2 = conditionValue1 ? (((productValue11 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - scalarValue4)) : productValue11;
        float comparisonValue3 = conditionValue1 ? (((productValue12 < 0.0f) ? (-1.0f) : 1.0f) * sumValue6) : productValue12;
        float inverseLengthValue2 = rsqrt(dot(float3(comparisonValue2, comparisonValue3, sumValue7), float3(comparisonValue2, comparisonValue3, sumValue7)));
        float productValue13 = comparisonValue2 * inverseLengthValue2;
        float productValue14 = comparisonValue3 * inverseLengthValue2;
        float productValue15 = inverseLengthValue2 * sumValue7;
        float inverseLengthValue3 = rsqrt(dot(float3(productValue13, productValue14, productValue15), float3(productValue13, productValue14, productValue15)));
        float4 sampledTextureValue4 = normalsAndDepthLightingTexture.Sample(normalsAndDepthLightingSampler, float2(sumValue2, productValue8));
        float productValue16 = (sampledTextureValue4.x * 2.0f) + (-1.0f);
        float productValue17 = (sampledTextureValue4.y * 2.0f) + (-1.0f);
        float sumValue8 = 1.0f - abs(productValue16);
        float scalarValue5 = abs(productValue17);
        float sumValue9 = sumValue8 - scalarValue5;
        bool conditionValue2 = sumValue9 < 0.0f;
        float comparisonValue4 = conditionValue2 ? (((productValue16 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - scalarValue5)) : productValue16;
        float comparisonValue5 = conditionValue2 ? (((productValue17 < 0.0f) ? (-1.0f) : 1.0f) * sumValue8) : productValue17;
        float inverseLengthValue4 = rsqrt(dot(float3(comparisonValue4, comparisonValue5, sumValue9), float3(comparisonValue4, comparisonValue5, sumValue9)));
        float productValue18 = comparisonValue4 * inverseLengthValue4;
        float productValue19 = comparisonValue5 * inverseLengthValue4;
        float productValue20 = inverseLengthValue4 * sumValue9;
        float inverseLengthValue5 = rsqrt(dot(float3(productValue18, productValue19, productValue20), float3(productValue18, productValue19, productValue20)));
        float clampedValue = ((sumValue5 * productValue9) * clamp(exp2((dot(float3(productValue18 * inverseLengthValue5, productValue19 * inverseLengthValue5, inverseLengthValue5 * productValue20), float3(productValue3, productValue4, productValue5)) + (-1.0f)) * RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x), 0.0f, 1.0f)) * (6.1999999161344021558761596679688e-05f / (abs(scalarValue2 - (((sampledTextureValue4.z * 65535.0f) + sampledTextureValue4.w) * 1.525902189314365386962890625e-05f)) + 6.1999999161344021558761596679688e-05f));
        float4 sampledTextureValue5 = normalsAndDepthLightingTexture.Sample(normalsAndDepthLightingSampler, float2(productValue7, sumValue3));
        float productValue21 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
        float productValue22 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
        float sumValue10 = 1.0f - abs(productValue21);
        float scalarValue6 = abs(productValue22);
        float sumValue11 = sumValue10 - scalarValue6;
        bool conditionValue3 = sumValue11 < 0.0f;
        float comparisonValue6 = conditionValue3 ? (((productValue21 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - scalarValue6)) : productValue21;
        float comparisonValue7 = conditionValue3 ? (((productValue22 < 0.0f) ? (-1.0f) : 1.0f) * sumValue10) : productValue22;
        float inverseLengthValue6 = rsqrt(dot(float3(comparisonValue6, comparisonValue7, sumValue11), float3(comparisonValue6, comparisonValue7, sumValue11)));
        float productValue23 = comparisonValue6 * inverseLengthValue6;
        float productValue24 = comparisonValue7 * inverseLengthValue6;
        float productValue25 = inverseLengthValue6 * sumValue11;
        float inverseLengthValue7 = rsqrt(dot(float3(productValue23, productValue24, productValue25), float3(productValue23, productValue24, productValue25)));
        float4 sampledTextureValue6 = normalsAndDepthLightingTexture.Sample(normalsAndDepthLightingSampler, float2(sumValue2, sumValue3));
        float productValue26 = (sampledTextureValue6.x * 2.0f) + (-1.0f);
        float productValue27 = (sampledTextureValue6.y * 2.0f) + (-1.0f);
        float sumValue12 = 1.0f - abs(productValue26);
        float scalarValue7 = abs(productValue27);
        float sumValue13 = sumValue12 - scalarValue7;
        bool conditionValue4 = sumValue13 < 0.0f;
        float comparisonValue8 = conditionValue4 ? (((productValue26 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - scalarValue7)) : productValue26;
        float comparisonValue9 = conditionValue4 ? (((productValue27 < 0.0f) ? (-1.0f) : 1.0f) * sumValue12) : productValue27;
        float inverseLengthValue8 = rsqrt(dot(float3(comparisonValue8, comparisonValue9, sumValue13), float3(comparisonValue8, comparisonValue9, sumValue13)));
        float productValue28 = comparisonValue8 * inverseLengthValue8;
        float productValue29 = comparisonValue9 * inverseLengthValue8;
        float productValue30 = inverseLengthValue8 * sumValue13;
        float inverseLengthValue9 = rsqrt(dot(float3(productValue28, productValue29, productValue30), float3(productValue28, productValue29, productValue30)));
        float clampedValue1 = ((productValue10 * productValue9) * clamp(exp2((dot(float3(productValue28 * inverseLengthValue9, productValue29 * inverseLengthValue9, inverseLengthValue9 * productValue30), float3(productValue3, productValue4, productValue5)) + (-1.0f)) * RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x), 0.0f, 1.0f)) * (6.1999999161344021558761596679688e-05f / (abs(scalarValue2 - (((sampledTextureValue6.z * 65535.0f) + sampledTextureValue6.w) * 1.525902189314365386962890625e-05f)) + 6.1999999161344021558761596679688e-05f));
        float clampedValue2 = clampedValue + (((sumValue5 * sumValue4) * clamp(exp2((dot(float3(productValue13 * inverseLengthValue3, productValue14 * inverseLengthValue3, inverseLengthValue3 * productValue15), float3(productValue3, productValue4, productValue5)) + (-1.0f)) * RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x), 0.0f, 1.0f)) * (6.1999999161344021558761596679688e-05f / (abs(scalarValue2 - (((sampledTextureValue3.z * 65535.0f) + sampledTextureValue3.w) * 1.525902189314365386962890625e-05f)) + 6.1999999161344021558761596679688e-05f)));
        float clampedValue3 = clampedValue1 + (((sumValue4 * productValue10) * clamp(exp2((dot(float3(productValue23 * inverseLengthValue7, productValue24 * inverseLengthValue7, inverseLengthValue7 * productValue25), float3(productValue3, productValue4, productValue5)) + (-1.0f)) * RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x), 0.0f, 1.0f)) * (6.1999999161344021558761596679688e-05f / (abs(scalarValue2 - (((sampledTextureValue5.z * 65535.0f) + sampledTextureValue5.w) * 1.525902189314365386962890625e-05f)) + 6.1999999161344021558761596679688e-05f)));
        float sumValue14 = (clampedValue2 + 6.1999999161344021558761596679688e-05f) + clampedValue3;
        float quotientValue = clampedValue2 / sumValue14;
        float quotientValue1 = clampedValue3 / sumValue14;
        float4 sampledTextureValue7 = specularLightingTexture.Sample(specularLightingSampler, float2((((clampedValue / clampedValue2) * float(clampedValue2 > 0.0f)) + productValue6) * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.z, productValue8));
        float4 sampledTextureValue8 = specularLightingTexture.Sample(specularLightingSampler, float2(((float(clampedValue3 > 0.0f) * (clampedValue1 / clampedValue3)) + productValue6) * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.z, sumValue3));
        productValue31 = (sampledTextureValue8.x * quotientValue1) + (sampledTextureValue7.x * quotientValue);
        productValue32 = (sampledTextureValue8.y * quotientValue1) + (sampledTextureValue7.y * quotientValue);
        productValue33 = (sampledTextureValue8.z * quotientValue1) + (sampledTextureValue7.z * quotientValue);
#endif
    }
    else
    {
#if RD_FEATURE_UPSCALING == RD_OFF
        intermediateValue = 0.0f;
        intermediateValue1 = 0.0f;
        intermediateValue2 = 0.0f;
#elif RD_FEATURE_UPSCALING == RD_ON
        productValue31 = 0.0f;
        productValue32 = 0.0f;
        productValue33 = 0.0f;
#endif
    }
#if RD_FEATURE_UPSCALING == RD_OFF
    fragmentColor0.x = intermediateValue;
    fragmentColor0.y = intermediateValue1;
    fragmentColor0.z = intermediateValue2;
#elif RD_FEATURE_UPSCALING == RD_ON
    fragmentColor0.x = productValue31;
    fragmentColor0.y = productValue32;
    fragmentColor0.z = productValue33;
#endif
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
