// ItemInHandTextured / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif


#include "../../include/materials/ItemInHandTextured/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor3 : COLOR3,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector1.w = 1;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.yzw = workingVector2.xyz * varyingColor0.xyz + -workingVector2.xyz;
  workingVector0.yzw = workingVector2.www * workingVector0.yzw + workingVector2.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector2.xyz = varyingColor0.xyz * workingVector2.xyz;
  workingVector0.xyzw = workingVector0.xxxx ? workingVector1.xyzw : workingVector2.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  fragmentColor0.w = workingVector0.w;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector1.z = 1;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xywz;
  workingVector0.yz = workingVector2.xy * varyingColor0.xy + -workingVector2.xy;
  workingVector0.yz = workingVector2.zz * workingVector0.yz + workingVector2.xy;
  workingVector1.xy = varyingColor0.ww * workingVector0.yz;
  workingVector2.xy = varyingColor0.xy * workingVector2.xy;
  workingVector0.xyz = workingVector0.xxx ? workingVector1.xyz : workingVector2.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector1.xy = float2(-1,-1) + varyingColor0.xy;
  workingVector1.xy = RD_UNIFORM_COLOR_BASED.xx * workingVector1.xy + float2(1,1);
  workingVector0.xy = workingVector1.xy * workingVector0.xy;
  fragmentColor0.w = workingVector0.z;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.y = ceil(workingVector0.y);
  workingVector0.xyz = workingVector0.yyy * workingVector1.xyz + workingVector0.xzw;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector1.z = 1;
  workingVector0.yzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector2.xy = workingVector0.yz * varyingColor0.xy + -workingVector0.yz;
  workingVector2.xy = workingVector0.ww * workingVector2.xy + workingVector0.yz;
  workingVector1.xy = varyingColor0.ww * workingVector2.xy;
  workingVector0.yz = varyingColor0.xy * workingVector0.yz;
  workingVector0.xyz = workingVector0.xxx ? workingVector1.xyz : workingVector0.yzw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector1.xy = float2(-1,-1) + varyingColor0.xy;
  workingVector1.xy = RD_UNIFORM_COLOR_BASED.xx * workingVector1.xy + float2(1,1);
  workingVector0.xy = workingVector1.xy * workingVector0.xy;
  fragmentColor0.w = workingVector0.z;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.y = ceil(workingVector0.y);
  workingVector0.xyz = workingVector0.yyy * workingVector1.xyz + workingVector0.xzw;
#endif
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float scalarValue2 = sampledTextureValue.z;
#endif
    float scalarValue3 = sampledTextureValue.w;
    float productValue = scalarValue * varyingColor0.x;
    float productValue1 = scalarValue1 * varyingColor0.y;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue6 = scalarValue2 * varyingColor0.z;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue2;
#endif
    float productValue3;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue4;
    float productValue5;
    float intermediateValue4;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float intermediateValue3;
#endif
    if (RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f)
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        productValue3 = (((productValue - scalarValue) * scalarValue3) + scalarValue) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue1) * scalarValue3) + scalarValue1) * varyingColor0.w;
        productValue5 = (((productValue6 - scalarValue2) * scalarValue3) + scalarValue2) * varyingColor0.w;
        intermediateValue4 = 1.0f;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        productValue2 = (((productValue - scalarValue) * scalarValue3) + scalarValue) * varyingColor0.w;
        productValue3 = (((productValue1 - scalarValue1) * scalarValue3) + scalarValue1) * varyingColor0.w;
        intermediateValue3 = 1.0f;
#endif
    }
    else
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue6;
        intermediateValue4 = scalarValue3;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        productValue2 = productValue;
        productValue3 = productValue1;
        intermediateValue3 = scalarValue3;
#endif
    }
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue7 = (RD_UNIFORM_MAT_COLOR.x * productValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue8 = (RD_UNIFORM_MAT_COLOR.y * productValue4) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue9 = (RD_UNIFORM_MAT_COLOR.z * productValue5) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue10 = (((productValue7 * RD_UNIFORM_CHANGE_COLOR.x) - productValue7) * varyingColor0.w) + productValue7;
    float productValue11 = (((productValue8 * RD_UNIFORM_CHANGE_COLOR.y) - productValue8) * varyingColor0.w) + productValue8;
    float productValue12 = (((productValue9 * RD_UNIFORM_CHANGE_COLOR.z) - productValue9) * varyingColor0.w) + productValue9;
    float productValue13 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue10) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue10) * varyingColor1.x;
    float productValue14 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11) * varyingColor1.y;
    float productValue15 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue12) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue12) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.y = ((varyingColor2.y - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.z = ((varyingColor2.z - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR.w * intermediateValue4;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue16 = (RD_UNIFORM_MAT_COLOR.x * productValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue17 = (RD_UNIFORM_MAT_COLOR.y * productValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue18 = productValue16 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue19 = productValue16 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue20 = productValue16 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue4 = ceil(productValue17);
    float productValue21 = (((productValue17 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue18) * scalarValue4) + productValue18;
    float productValue22 = (((productValue17 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue19) * scalarValue4) + productValue19;
    float productValue23 = (((productValue17 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue20) * scalarValue4) + productValue20;
    float productValue24 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue21) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue21) * varyingColor1.x;
    float productValue25 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22) * varyingColor1.y;
    float productValue26 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue24) * varyingColor2.w) + productValue24;
    fragmentColor0.y = ((varyingColor2.y - productValue25) * varyingColor2.w) + productValue25;
    fragmentColor0.z = ((varyingColor2.z - productValue26) * varyingColor2.w) + productValue26;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR.w * intermediateValue3;
#endif
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor3 = stage_input.varyingColor3;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
