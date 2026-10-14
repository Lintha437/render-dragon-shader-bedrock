// ParticlePrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/ParticlePrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor0 : COLOR0,
  float3 varyingTexCoord2 : TEXCOORD2,
  float4 varyingColor1 : COLOR1,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTangent0 : TANGENT0,
  float2 varyingTexCoord0 : TEXCOORD0,
  float2 varyingTexCoord1 : TEXCOORD1,
  float3 varyingTexCoord3 : TEXCOORD3,
  out uint4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1,
  out float4 fragmentColor2 : SV_TARGET2)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector0.w != 0) discard;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor0.xyz + varyingColor1.xyz;
  fragmentColor1.xyz = varyingColor1.www * workingVector0.xyz + workingVector1.xyz;
  workingVector0.x = (int)RD_UNIFORM_PBR_TEXTURE_FLAGS.x;
  workingVector0.yz = (int2)workingVector0.xx & int2(1,4);
  workingVector0.yz = RD_COMPARISON_MASK((int2)workingVector0.yz == int2(1,4));
  if (workingVector0.y != 0) {
    workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).zyxw;
    workingVector0.x = (int)workingVector0.x & 2;
    workingVector0.x = RD_COMPARISON_MASK((int)workingVector0.x == 2);
    workingVector0.y = workingVector0.x ? workingVector1.w : RD_UNIFORM_MERS_UNIFORMS.w;
    workingVector0.x = workingVector1.z;
  } else {
    workingVector0.xy = RD_UNIFORM_MERS_UNIFORMS.xw;
    workingVector1.xy = RD_UNIFORM_MERS_UNIFORMS.zy;
  }
  if (workingVector0.z != 0) {
    workingVector0.z = dot(varyingTangent0.xyz, varyingTangent0.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector2.xyz = varyingTangent0.xyz * workingVector0.zzz;
    workingVector0.z = dot(varyingBitangent0.xyz, varyingBitangent0.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector3.xyz = varyingBitangent0.xyz * workingVector0.zzz;
    workingVector0.z = dot(varyingNormal0.xyz, varyingNormal0.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector4.xyz = varyingNormal0.xyz * workingVector0.zzz;
    workingVector5.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
    workingVector5.xyz = workingVector5.xyz * float3(2,2,2) + float3(-1,-1,-1);
    workingVector3.xyz = workingVector5.yyy * workingVector3.xyz;
    workingVector2.xyz = workingVector2.xyz * workingVector5.xxx + workingVector3.xyz;
    workingVector2.xyz = workingVector4.xyz * workingVector5.zzz + workingVector2.xyz;
  } else {
    workingVector2.xyz = varyingNormal0.xyz;
  }
  workingVector3.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord3.xyz;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.y < workingVector0.x);
  workingVector0.x = workingVector0.x * 0.498039216 + 0.501960814;
  workingVector0.y = -workingVector0.y * 0.498039216 + 0.498039216;
  fragmentColor1.w = workingVector0.z ? workingVector0.x : workingVector0.y;
  workingVector0.x = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xyz = workingVector2.xyz * workingVector0.xxx;
  workingVector0.w = abs(workingVector0.x) + abs(workingVector0.y);
  workingVector0.w = workingVector0.w + abs(workingVector0.z);
  workingVector0.w = 1 / workingVector0.w;
  workingVector0.xy = workingVector0.xy * workingVector0.ww;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0);
  workingVector1.zw = float2(1,1) + -abs(workingVector0.yx);
  workingVector2.xy = RD_COMPARISON_MASK(workingVector0.xy >= float2(0,0));
  workingVector2.xy = workingVector2.xy ? float2(1,1) : 0;
  workingVector2.xy = workingVector2.xy * float2(2,2) + float2(-1,-1);
  workingVector1.zw = workingVector2.xy * workingVector1.zw;
  fragmentColor2.xy = workingVector0.zz ? workingVector1.zw : workingVector0.xy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector3.yyy;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector3.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector3.zzz + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector2.xyz;
  workingVector0.zw = workingVector2.xy / workingVector2.zz;
  workingVector0.zw = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor2.zw = workingVector0.xy + -workingVector0.zw;
  workingVector0.x = varyingTexCoord2.x + varyingTexCoord2.y;
  workingVector0.x = varyingTexCoord2.z + workingVector0.x;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 9.99999975e-005);
  workingVector0.y = RD_COMPARISON_MASK(9.99999975e-005 < varyingTexCoord1.x);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  workingVector2.x = varyingTexCoord1.x * varyingTexCoord1.x;
  workingVector0.y = workingVector2.x * 0.600000024 + 0.400000006;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector2.y = workingVector2.x * workingVector0.y;
  workingVector0.y = workingVector2.x * workingVector2.x;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector2.z = workingVector2.x * workingVector0.y;
  workingVector0.yzw = min(float3(1,1,1), workingVector2.xyz);
  workingVector0.xyz = workingVector0.xxx ? workingVector0.yzw : varyingTexCoord2.xyz;
  workingVector0.xyz = float3(0.166666672,0.166666672,0.166666672) * workingVector0.xyz;
  workingVector0.w = 0.00392156886;
  workingVector1.zw = max(workingVector0.xy, workingVector0.zw);
  workingVector0.w = max(workingVector1.z, workingVector1.w);
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.w = 255 * workingVector0.w;
  workingVector0.w = ceil(workingVector0.w);
  workingVector2.w = 0.00392156886 * workingVector0.w;
  workingVector2.xyz = workingVector0.xyz / workingVector2.www;
  workingVector2.xyzw = saturate(workingVector2.xyzw);
  workingVector0.xyzw = float4(255,255,255,255) * workingVector2.xyzw;
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  fragmentColor0.yz = mad((int2)workingVector0.xz, int2(256,256), (int2)workingVector0.yw);
  workingVector0.x = saturate(varyingTexCoord1.y);
  workingVector0.x = 255 * workingVector0.x;
  fragmentColor0.w = (uint)workingVector0.x;
  workingVector1.xy = saturate(workingVector1.xy);
  workingVector0.xy = float2(255,255) * workingVector1.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  fragmentColor0.x = mad((int)workingVector0.x, 256, (int)workingVector0.y);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float4 sampledTextureValue = particleTextureTexture.Sample(particleTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue.w < 0.5f)
    {
        isFragmentDiscarded = true;
    }
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
    uint scalarValue = uint(int(RD_UNIFORM_PBR_TEXTURE_FLAGS.x));
    float intermediateValue1;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    if ((scalarValue & 1u) == 0u)
    {
        intermediateValue1 = RD_UNIFORM_MERS_UNIFORMS.x;
        intermediateValue2 = RD_UNIFORM_MERS_UNIFORMS.y;
        intermediateValue3 = RD_UNIFORM_MERS_UNIFORMS.z;
        intermediateValue4 = RD_UNIFORM_MERS_UNIFORMS.w;
    }
    else
    {
        float4 sampledTextureValue1 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue1 = sampledTextureValue1.x;
        intermediateValue2 = sampledTextureValue1.y;
        intermediateValue3 = sampledTextureValue1.z;
        intermediateValue4 = ((scalarValue & 2u) != 0u) ? sampledTextureValue1.w : RD_UNIFORM_MERS_UNIFORMS.w;
    }
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if ((scalarValue & 4u) == 0u)
    {
        intermediateValue5 = varyingNormal0.x;
        intermediateValue6 = varyingNormal0.y;
        intermediateValue7 = varyingNormal0.z;
    }
    else
    {
        float inverseLengthValue = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue1 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float4 sampledTextureValue2 = normalTextureTexture.Sample(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        float productValue3 = (sampledTextureValue2.y * 2.0f) + (-1.0f);
        float productValue4 = (sampledTextureValue2.z * 2.0f) + (-1.0f);
        float inverseLengthValue2 = ((sampledTextureValue2.x * 2.0f) + (-1.0f)) * rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z)));
        intermediateValue5 = mad(inverseLengthValue * varyingNormal0.x, productValue4, mad(inverseLengthValue1 * varyingBitangent0.x, productValue3, inverseLengthValue2 * varyingTangent0.x));
        intermediateValue6 = mad(inverseLengthValue * varyingNormal0.y, productValue4, mad(inverseLengthValue1 * varyingBitangent0.y, productValue3, inverseLengthValue2 * varyingTangent0.y));
        intermediateValue7 = mad(inverseLengthValue * varyingNormal0.z, productValue4, mad(inverseLengthValue1 * varyingBitangent0.z, productValue3, inverseLengthValue2 * varyingTangent0.z));
    }
    float sumValue = varyingTexCoord3.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue1 = varyingTexCoord3.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue2 = varyingTexCoord3.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue3 = rsqrt(dot(float3(intermediateValue5, intermediateValue6, intermediateValue7), float3(intermediateValue5, intermediateValue6, intermediateValue7)));
    float productValue5 = inverseLengthValue3 * intermediateValue5;
    float productValue6 = inverseLengthValue3 * intermediateValue6;
    float productValue7 = inverseLengthValue3 * intermediateValue7;
    float quotientValue = 1.0f / ((abs(productValue6) + abs(productValue5)) + abs(productValue7));
    float productValue8 = quotientValue * productValue5;
    float productValue9 = quotientValue * productValue6;
    bool conditionValue = productValue7 < 0.0f;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue1 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05f) && (((varyingTexCoord2.y + varyingTexCoord2.x) + varyingTexCoord2.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue10 = varyingTexCoord1.x * varyingTexCoord1.x;
        clampedValue = clamp(productValue10, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue10 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue10, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue10 * productValue10) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue10, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = varyingTexCoord2.x;
        clampedValue1 = varyingTexCoord2.y;
        clampedValue2 = varyingTexCoord2.z;
    }
    float productValue11 = clampedValue * 0.16666667163372039794921875f;
    float productValue12 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue13 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue3 = ceil(clamp(max(max(productValue11, productValue13), max(productValue12, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(intermediateValue3, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue2, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue11 / clampedValue3, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue12 / clampedValue3, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue13 / clampedValue3, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue3, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = uint(clamp(varyingTexCoord1.y, 0.0f, 1.0f) * 255.0f);
    fragmentColor1.x = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    fragmentColor1.y = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    fragmentColor1.z = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    fragmentColor1.w = (intermediateValue1 > intermediateValue4) ? ((intermediateValue1 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue4 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue ? (((productValue8 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue9))) : productValue8;
    fragmentColor2.y = conditionValue ? ((1.0f - abs(productValue8)) * ((productValue9 < 0.0f) ? (-1.0f) : 1.0f)) : productValue9;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue1)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue1)) * 0.5f;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor1 = stage_input.varyingColor1;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
}
#endif
